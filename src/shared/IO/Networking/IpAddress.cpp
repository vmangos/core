#include "IpAddress.h"
#include "Errors.h"

#include <sstream>

IO::Networking::IpAddress IO::Networking::IpAddress::FromIpv4Uint32(uint32_t ip)
{
    IpAddress result;
    result.m_address.type = Type::IPv4;
    result.m_address.ipv4 = ip;
    result.UpdateCachedString();
    return result;
}

/// IPv4 Format: 255.255.255.255
/// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]
nonstd::optional<IO::Networking::IpAddress> IO::Networking::IpAddress::TryParseFromString(std::string const& ipAddressString)
{
    IpAddress result;

    size_t ipv6Begin = -1;
    ipv6Begin = ipAddressString.find('[');
    if (ipv6Begin == -1)
    {
        result.m_address.type = Type::IPv4;

        // IPv4 expected format: 255.255.255.255
        const char* const fixEndPtr = ipAddressString.c_str() + ipAddressString.size();

        const char* tmpLastEndPtr = ipAddressString.c_str(); // <- loop variable
        for (int i = 0; i < 4; i++)
        {
            char const* tmpStartPtr = tmpLastEndPtr;
            tmpLastEndPtr = fixEndPtr;

            // Parse a number. Must be in range [0-255]
            int64_t segment = std::strtoll(tmpStartPtr, const_cast<char **>(&tmpLastEndPtr), 10);
            if (segment < 0 || segment > 255)
                return nonstd::nullopt; // invalid number range, only [0..255] is valid

            if (i != 3)
            { // We should not be at the end, and the next character should be a dot
                if (tmpLastEndPtr >= fixEndPtr || tmpLastEndPtr[0] != '.')
                    return nonstd::nullopt;
                tmpLastEndPtr++; // Skip the '.'
            }
            else
            { // Last segment, we should be at the end
                if (tmpLastEndPtr != fixEndPtr)
                    return nonstd::nullopt;
            }
            result.m_address.ipv4 <<= 8;
            result.m_address.ipv4 |= (uint8_t) segment;
        }
    }
    else
    {
        result.m_address.type = Type::IPv6;
        // TODO: Implement me. Keep in mind all the IPv6 truncation possibilities
        return nonstd::nullopt;
    }

    result.UpdateCachedString();

    return result;
}

IO::Networking::IpAddress::Type IO::Networking::IpAddress::GetType() const
{
    return m_address.type;
}

/// "127.0.0.1" would return 2130706433
uint32_t IO::Networking::IpAddress::_getInternalIPv4ReprAsUint32() const
{
    MANGOS_ASSERT(m_address.type == Type::IPv4);
    return m_address.ipv4;
}

/// IPv4 Format: 255.255.255.255
/// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]
void IO::Networking::IpAddress::UpdateCachedString()
{
    if (m_address.type == Type::IPv4)
    {
        m_cachedToString = std::to_string((m_address.ipv4 >> (3*8)) & 0xFF) + "." +
                           std::to_string((m_address.ipv4 >> (2*8)) & 0xFF) + "." +
                           std::to_string((m_address.ipv4 >> (1*8)) & 0xFF) + "." +
                           std::to_string((m_address.ipv4 >> (0*8)) & 0xFF);
    }
    else
    {
        // The IPv6 spec allows multiple zeros in a row to be truncated _once_ to just "::"
        // And segments where the number is just :FFFF: can be represented by :0:
        // Leading zeros in a segment can be completely omitted.
        // For example 1111:1100:0000:0000:0222:FFFF:0033:3333
        // Can be      1111:1100::222:0:33:3333
        int zeroStart = -1, zeroLength = 0;

        // Find the longest sequence of zeros for compression
        {
            bool inZeroSeq = false;
            for (int i = 0; i < m_address.ipv6.size(); i++)
            {
                if (m_address.ipv6[i] == 0)
                {
                    int length = 0;
                    while (i < 8 && m_address.ipv6[i] == 0)
                    {
                        ++length;
                        ++i;
                    }
                    if (length > zeroLength)
                    {
                        zeroStart = i - length;
                        zeroLength = length;
                    }
                }
            }
        }

        std::stringstream result;
        result << std::hex << std::uppercase; // enable number conversion to hex output
        result << '[';
        for (int i = 0; i < m_address.ipv6.size(); i++)
        {
            if (i == zeroStart)
            { // we are in a zero truncation part
                if (i == 0)
                    result << "::";
                else
                    result << ':';

                i += zeroLength - 1;
            }
            else
            {
                if (i > 0)
                    result << ':'; // add : separator

                result << m_address.ipv6[i];
            }
        }
        result << ']';
        m_cachedToString = result.str();
    }
}

bool IO::Networking::operator==(IpAddress const& lhs, IpAddress const& rhs)
{
    if (lhs.GetType() != rhs.GetType())
        return false;

    switch (lhs.GetType())
    {
        case IpAddress::Type::IPv4:
            return lhs.m_address.ipv4 == rhs.m_address.ipv4;
        case IpAddress::Type::IPv6:
            return lhs.m_address.ipv6 == rhs.m_address.ipv6;
    }

    return false;
}

bool IO::Networking::operator==(IpEndpoint const& lhs, IpEndpoint const& rhs)
{
    return lhs.ip == rhs.ip && lhs.port == rhs.port;
}
