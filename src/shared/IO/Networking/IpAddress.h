#ifndef MANGOS_IPADDRESS_H
#define MANGOS_IPADDRESS_H

#include <string>
#include <array>
#include <utility>
#include <cstdint>
#include "nonstd/optional.hpp"

namespace IO { namespace Networking
{
    class IpAddress
    {
    public:
        enum class Type { IPv4, IPv6 };

        static IpAddress FromIpv4Uint32(uint32_t ip);

        /// IPv4 Format: 255.255.255.255
        /// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]
        static nonstd::optional<IpAddress> TryParseFromString(std::string const& ipAddressString);

        /// IPv4 Format: 255.255.255.255
        /// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]
        std::string const& toString() const { return m_cachedToString; }

        Type getType() const;

        /// "127.0.0.1" would return 2130706433
        uint32_t _getInternalIPv4ReprAsUint32() const;
     private:
        struct // NOLINT(*-pro-type-member-init) we manage the initialization on our own.
        {
            Type type = Type::IPv4;
            union
            {
                uint32_t                ipv4; // IPv4 address in
                std::array<uint16_t, 8> ipv6; // index[0] is leftmost element in string representation
            };
        } m_address;

        // Since IPs are used in a lot of logging, we just cache the result, so it is not re-created all the time
        void UpdateCachedString();
        std::string m_cachedToString;
    };

    class IpEndpoint
    {
    public:
        IpAddress ip;
        uint16_t port;

    public:
        IpEndpoint() : ip{}, port{0} {}
        IpEndpoint(IO::Networking::IpAddress ip, uint16_t port) : ip{std::move(ip)}, port{port} {}

        /// IPv4 Format: 255.255.255.255:1337
        /// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]:1337
        std::string toString() const
        {
            return ip.toString() + ':' + std::to_string(port);
        };
    };
}} // namespace IO::Networking


#endif //MANGOS_IPADDRESS_H
