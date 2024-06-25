#ifndef MANGOS_IPADDRESS_H
#define MANGOS_IPADDRESS_H

#include <string>
#include <array>
#include "nonstd/optional.hpp"

namespace IO { namespace Networking
{
    class IpAddress
    {
    public:
        enum class Type { IPv4, IPv6 };

        static nonstd::optional<IpAddress> TryParseFromString(std::string const& ipAddressString);

        /// IPv4 Format: 255.255.255.255
        /// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]
        std::string toString() const;

        Type getType() const;

        uint32_t _getInternalIPv4ReprAsUint32() const;

    private:
        struct
        {
            Type type = Type::IPv4;
            union
            {
                std::array<uint8_t,  4> ipv4; // index[0] is leftmost element in string representation
                std::array<uint16_t, 8> ipv6; // index[0] is leftmost element in string representation
            };
        } m_address;
    };

    class IpEndpoint
    {
    public:
        IpAddress ip;
        uint16_t port;

    public:
        IpEndpoint() : ip{}, port{0} {}
        IpEndpoint(IO::Networking::IpAddress ip, uint16_t port) : ip{ip}, port{port} {}
        std::string toString() const
        {
            return ip.toString() + ':' + std::to_string(port);
        };
    };
}} // namespace IO::Networking


#endif //MANGOS_IPADDRESS_H
