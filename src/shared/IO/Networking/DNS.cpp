#include "./DNS.h"
#include "./Internal.h"
#include "Log.h"
#include "Errors.h"
#include "IO/SystemErrorToString.h"

#if defined(WIN32)
#include <WinSock2.h>
#include <ws2tcpip.h>
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

std::vector<IO::Networking::IpAddress> IO::Networking::DNS::ResolveDomain(std::string const& domainName, IO::Networking::IpAddress::Type type)
{
    MANGOS_ASSERT(type == IpAddress::Type::IPv4);

    addrinfo hints = {};
    hints.ai_family = type == IpAddress::Type::IPv4 ? AF_INET :  AF_INET6;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_protocol = IPPROTO_TCP;

    addrinfo* dnsResult = nullptr;
    if (::getaddrinfo(domainName.c_str(), nullptr, &hints, &dnsResult) != 0)
    {
        sLog.Out(LogType::LOG_NETWORK, LOG_LVL_ERROR, "IO ERROR: ::getaddrinfo(...): %s", SystemErrorToString(errno).c_str());
        MANGOS_ASSERT(false);
    }

    std::vector<IO::Networking::IpAddress> list;

    for (addrinfo* ptr = dnsResult; ptr != nullptr; ptr = ptr->ai_next)
    {
        sockaddr_in* sockaddr_ipv4 = reinterpret_cast<sockaddr_in*>(ptr->ai_addr);
        IpAddress ip = IO::Networking::Internal::inet_ntop(&(sockaddr_ipv4->sin_addr));
        list.emplace_back(ip);
    }

    freeaddrinfo(dnsResult);

    return list;
}
