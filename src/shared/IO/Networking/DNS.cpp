#include "./DNS.h"
#include "./Internal.h"
#include "Log.h"
#include "Errors.h"
#include "Util.h"
#include "IO/SystemErrorToString.h"

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

std::vector<IO::Networking::IpAddress> IO::Networking::DNS::ResolveDomainAll(std::string const& domainName, IpAddress::Type type)
{
    MANGOS_ASSERT(type == IpAddress::Type::IPv4); // TODO: this function is only tested with IPv4. `inet_ntop` will fail

    // Check if we can parse the domain as an IP
    nonstd::optional<IpAddress> maybeIp = IpAddress::TryParseFromString(domainName);
    if (maybeIp)
    {
        IpAddress const& ip = maybeIp.value();
        MANGOS_ASSERT(ip.GetType() == type);
        return { ip }; // The "domain" can be directly parsed as an IP
    }

    // try to resolve the domain
    addrinfo hints = {};
    hints.ai_family = type == IpAddress::Type::IPv4 ? AF_INET :  AF_INET6;
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

    std::vector<IpAddress> list;

    for (addrinfo* ptr = dnsResult; ptr != nullptr; ptr = ptr->ai_next)
    {
        if (ptr->ai_family == AF_INET)
        {
            sockaddr_in* sockaddr_ipv4 = reinterpret_cast<sockaddr_in*>(ptr->ai_addr);
            IpAddress ip = IO::Networking::Internal::inet_ntop(&(sockaddr_ipv4->sin_addr));
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

nonstd::optional<IO::Networking::IpAddress> IO::Networking::DNS::ResolveDomainSingle(std::string const& domainName, IpAddress::Type type, SelectionStrategy strategy)
{
    std::vector<IpAddress> allIps = ResolveDomainAll(domainName, type);
    if (allIps.empty())
        return nonstd::nullopt; // No IP found

    switch (strategy)
    {
        case SelectionStrategy::First:
            return allIps.front();
        case SelectionStrategy::Random:
            return allIps[urand(0, allIps.size() - 1)];
    }

    MANGOS_ASSERT(false);
}
