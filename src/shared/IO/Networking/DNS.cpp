#include "./DNS.h"
#include "./Internal.h"
#include "Log.h"
#include "Errors.h"
#include "Util.h"
#include "IO/SystemErrorToString.h"
#include "IO/Multithreading/CreateThread.h"
#include <mutex>
#include <condition_variable>
#include <atomic>
#include <memory>

#if defined(WIN32)
#include <WinSock2.h>
#include <ws2tcpip.h>
#elif defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include <netdb.h>
#include <unistd.h>
#endif

#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include <sys/socket.h>
#include <netinet/in.h>
#endif

std::string IO::Networking::DNS::GetOwnHostname()
{
    char hostname[1024];
    if (::gethostname(hostname, sizeof(hostname)) == -1)
    {
        sLog.Out(LogType::LOG_NETWORK, LOG_LVL_ERROR, "IO ERROR: ::gethostname(...): %s", SystemErrorToString(errno).c_str());
        MANGOS_ASSERT(false);
    }
    return hostname;
}

namespace
{
    // Limit concurrent pending DNS resolutions to prevent thread accumulation on DNS failures
    std::atomic<int> g_pendingDnsResolutions{0};
    constexpr int MAX_PENDING_DNS_RESOLUTIONS = 10;

    // Internal blocking DNS resolution (no timeout)
    std::vector<IO::Networking::IpAddress> ResolveDomainBlocking(std::string const& domainName, IO::Networking::IpAddress::Type type)
    {
        MANGOS_ASSERT(type == IO::Networking::IpAddress::Type::IPv4); // TODO: this function is only tested with IPv4. `inet_ntop` will fail

        // Check if we can parse the domain as an IP
        nonstd::optional<IO::Networking::IpAddress> maybeIp = IO::Networking::IpAddress::TryParseFromString(domainName);
        if (maybeIp)
        {
            IO::Networking::IpAddress const& ip = maybeIp.value();
            MANGOS_ASSERT(ip.GetType() == type);
            return { ip }; // The "domain" can be directly parsed as an IP
        }

        // try to resolve the domain
        addrinfo hints = {};
        hints.ai_family = type == IO::Networking::IpAddress::Type::IPv4 ? AF_INET :  AF_INET6;
        hints.ai_socktype = SOCK_STREAM;
        hints.ai_protocol = IPPROTO_TCP;

        addrinfo* dnsResult = nullptr;
        if (::getaddrinfo(domainName.c_str(), nullptr, &hints, &dnsResult) != 0)
        {
            sLog.Out(LogType::LOG_NETWORK, LOG_LVL_ERROR, "IO ERROR: ::getaddrinfo(...): %s", SystemErrorToString(
#if defined(WIN32)
            ::WSAGetLastError()
#else
            errno
#endif
            ).c_str());
            return {}; // error occurred, empty return
        }

        std::vector<IO::Networking::IpAddress> list;

        for (addrinfo* ptr = dnsResult; ptr != nullptr; ptr = ptr->ai_next)
        {
            if (ptr->ai_family == AF_INET)
            {
                sockaddr_in* sockaddr_ipv4 = reinterpret_cast<sockaddr_in*>(ptr->ai_addr);
                IO::Networking::IpAddress ip = IO::Networking::Internal::inet_ntop(&(sockaddr_ipv4->sin_addr));
                list.emplace_back(ip);
            }
            else if (ptr->ai_family == AF_INET6)
            {
                // TODO: Add inet_ntop for IPv6
                //sockaddr_in6* sockaddr_ipv6 = reinterpret_cast<sockaddr_in6*>(ptr->ai_addr);
                //IpAddress ip = IO::Networking::Internal::inet_ntop(&(sockaddr_ipv6->sin_addr));
                //list.emplace_back(ip);
            }
            else
            {
                MANGOS_ASSERT(false && (ptr->ai_family == AF_INET || ptr->ai_family == AF_INET6));
            }
        }

        freeaddrinfo(dnsResult);

        return list;
    }

    // Shared state for DNS resolution with timeout - must live on heap to survive thread detachment
    struct DnsResolverState
    {
        std::vector<IO::Networking::IpAddress> result;
        std::mutex mutex;
        std::condition_variable condition;
        std::atomic<bool> resolved{false};
        std::exception_ptr exceptionPtr = nullptr;
    };
}

std::vector<IO::Networking::IpAddress> IO::Networking::DNS::ResolveDomainAll(std::string const& domainName, IpAddress::Type type, std::chrono::seconds timeout)
{
    // If timeout is 0, use blocking version directly
    if (timeout.count() == 0)
        return ResolveDomainBlocking(domainName, type);

    // Check if we can parse the domain as an IP (no DNS lookup needed, no timeout needed)
    nonstd::optional<IpAddress> maybeIp = IpAddress::TryParseFromString(domainName);
    if (maybeIp)
    {
        IpAddress const& ip = maybeIp.value();
        MANGOS_ASSERT(ip.GetType() == type);
        return { ip }; // The "domain" can be directly parsed as an IP
    }

    // Check if we have too many pending DNS resolutions (prevents thread accumulation on DNS failures)
    int currentPending = g_pendingDnsResolutions.load();
    if (currentPending >= MAX_PENDING_DNS_RESOLUTIONS)
    {
        sLog.Out(LogType::LOG_NETWORK, LOG_LVL_ERROR,
            "DNS resolution skipped for domain %s: too many pending resolutions (%d/%d)",
            domainName.c_str(), currentPending, MAX_PENDING_DNS_RESOLUTIONS);
        return {};
    }
    g_pendingDnsResolutions.fetch_add(1);

    // Use shared_ptr for state so it survives thread detachment on timeout
    auto state = std::make_shared<DnsResolverState>();

    // Worker thread that performs the DNS resolution
    std::thread resolverThread = IO::Multithreading::CreateThread("DnsResolver", [state, domainName, type]()
    {
        try
        {
            std::vector<IpAddress> dnsResult = ResolveDomainBlocking(domainName, type);

            std::lock_guard<std::mutex> lock(state->mutex);
            state->result = std::move(dnsResult);
            state->resolved.store(true);
            state->condition.notify_one();
        }
        catch (...)
        {
            std::lock_guard<std::mutex> lock(state->mutex);
            state->exceptionPtr = std::current_exception();
            state->resolved.store(true);
            state->condition.notify_one();
        }

        // Always decrement counter when thread finishes (whether joined or detached)
        g_pendingDnsResolutions.fetch_sub(1);
    });

    // Wait for either resolution or timeout
    std::unique_lock<std::mutex> lock(state->mutex);
    bool resolutionCompleted = state->condition.wait_for(lock, timeout, [&state]() {
        return state->resolved.load();
    });

    if (!resolutionCompleted)
    {
        // Timeout reached - detach thread, shared_ptr ensures state stays valid
        resolverThread.detach();

        sLog.Out(LogType::LOG_NETWORK, LOG_LVL_ERROR, "DNS resolution timeout after %lld seconds for domain: %s",
            static_cast<long long>(timeout.count()), domainName.c_str());
        return {}; // Return empty result on timeout
    }

    lock.unlock();

    // Make sure the thread is joined before checking results
    if (resolverThread.joinable())
        resolverThread.join();

    // Check if an exception occurred in the resolver thread
    if (state->exceptionPtr)
    {
        try
        {
            std::rethrow_exception(state->exceptionPtr);
        }
        catch (std::exception const& e)
        {
            sLog.Out(LogType::LOG_NETWORK, LOG_LVL_ERROR, "DNS resolution exception for domain %s: %s", domainName.c_str(), e.what());
        }
        catch (...)
        {
            sLog.Out(LogType::LOG_NETWORK, LOG_LVL_ERROR, "DNS resolution unknown exception for domain: %s", domainName.c_str());
        }
        return {}; // Return empty result on exception
    }

    return state->result;
}

nonstd::optional<IO::Networking::IpAddress> IO::Networking::DNS::ResolveDomainSingle(std::string const& domainName, IpAddress::Type type, std::chrono::seconds timeout, SelectionStrategy strategy)
{
    std::vector<IpAddress> allIps = ResolveDomainAll(domainName, type, timeout);
    if (allIps.empty())
        return nonstd::nullopt; // No IP found or timeout

    switch (strategy)
    {
        case SelectionStrategy::First:
            return allIps.front();
        case SelectionStrategy::Random:
            return allIps[urand(0, allIps.size() - 1)];
    }

    MANGOS_ASSERT(false);
}
