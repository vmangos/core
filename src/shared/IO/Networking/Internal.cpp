#include "./Internal.h"

#include "Errors.h"

#if defined(WIN32)
#include <WinSock2.h>
#include <WS2tcpip.h>
#elif defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include <unistd.h>
#include <arpa/inet.h>
#endif

#if defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include <sys/socket.h>
#include <netinet/in.h>

#ifdef inet_ntop
#undef inet_ntop
#endif

#ifdef inet_pton
#undef inet_pton
#endif

#endif

/// Converts a native `IN_ADDR` to a `IO::Networking::IpAddress`
IO::Networking::IpAddress IO::Networking::Internal::inet_ntop(in_addr const* nativeAddress)
{
#if defined(WIN32)
    // We cant use ::inet_ntoa(...) because it's not thread safe. We cant use ::inet_ntop(...) because it's not WinXP compatible, so we have to do it ourselves.
    int constexpr MAX_IPV4_LENGTH = 16; // "255.255.255.255" = length 15 + 1 for null-terminator
    char ipv4AddressString[MAX_IPV4_LENGTH];
    { // This implementation was taken from ACE, should be universal
        uint8_t const* p = reinterpret_cast<uint8_t const*>(nativeAddress);
        snprintf(ipv4AddressString, MAX_IPV4_LENGTH, "%d.%d.%d.%d", p[0], p[1], p[2], p[3]);
    }
    auto ipAddress = IO::Networking::IpAddress::TryParseFromString(ipv4AddressString);
#elif defined(__linux__) || defined(__APPLE__)
    char ipv4AddressString[INET_ADDRSTRLEN];
    ::inet_ntop(AF_INET, nativeAddress, ipv4AddressString, INET_ADDRSTRLEN);
    auto ipAddress = IO::Networking::IpAddress::TryParseFromString(ipv4AddressString);
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    char ipv4AddressString[INET_ADDRSTRLEN];
    __inet_ntop(AF_INET, nativeAddress, ipv4AddressString, INET_ADDRSTRLEN);
    auto ipAddress = IO::Networking::IpAddress::TryParseFromString(ipv4AddressString);
#else
    #error "Unsupported platform"
#endif
    MANGOS_ASSERT(ipAddress.has_value()); // this should never fail, since we got a valid IP from IN_ADDR
    return ipAddress.value();
}

void IO::Networking::Internal::CloseSocket(IO::Native::SocketHandle nativeSocket)
{
#if defined(WIN32)
    ::closesocket(nativeSocket);
#elif defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    ::close(nativeSocket);
#else
    #error "Unsupported platform"
#endif
}

// Converts a `IO::Networking::IpAddress` to a native `IN_ADDR`
void IO::Networking::Internal::inet_pton(IO::Networking::IpAddress const& ipAddress, in_addr* out_dest)
{
    MANGOS_ASSERT(ipAddress.GetType() == IpAddress::Type::IPv4);

#if defined(WIN32)
    // We cant use `inet_pton`, because it's not supported on WinXP.
    // But this method would basically just take the internal representation and store it in a union anyways ¯\_(ツ)_/¯
    out_dest->s_addr = ::htonl(ipAddress._getInternalIPv4ReprAsUint32());
#elif defined(__linux__) || defined(__APPLE__)
    MANGOS_ASSERT(::inet_pton(AF_INET, ipAddress.ToString().c_str(), out_dest) == 1);
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    MANGOS_ASSERT(__inet_pton(AF_INET, ipAddress.ToString().c_str(), out_dest) == 1);
#else
    #error "Unsupported platform"
#endif
}
