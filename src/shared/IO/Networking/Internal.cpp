#include "Errors.h"
#include "./Internal.h"

#if defined(__linux__)
#include <arpa/inet.h>
#endif

/// Converts a native IN_ADDR to a IO::Networking::IpAddress
IO::Networking::IpAddress IO::Networking::Internal::inet_ntop(in_addr const* nativeAddress)
{
#if defined(WIN32)
    // We cant use ::inet_ntoa(...) because it's not thread safe. We cant use ::inet_ntop(...) because it's not WinXP compatible, so we have to do it ourselves.
    int constexpr MAX_IPV4_LENGTH = 16; // "255.255.255.255" = length 15 + 1 for null-terminator
    char ipv4AddressString[MAX_IPV4_LENGTH];
    { // impl was taken from ACE, should be universal
        uint8_t const* p = reinterpret_cast<uint8_t const*>(nativeAddress);
        snprintf(ipv4AddressString, MAX_IPV4_LENGTH, "%d.%d.%d.%d", p[0], p[1], p[2], p[3]);
    }
    auto ipAddress = IO::Networking::IpAddress::TryParseFromString(ipv4AddressString);
#else
    char ipv4AddressString[INET_ADDRSTRLEN];
    ::inet_ntop(AF_INET, nativeAddress, ipv4AddressString, INET_ADDRSTRLEN);
    auto ipAddress = IO::Networking::IpAddress::TryParseFromString(ipv4AddressString);
#endif
    MANGOS_ASSERT(ipAddress.has_value()); // this should never fail, since we got a valid IP from IN_ADDR
    return ipAddress.value();
}
