#include <sstream>
#include "IpAddress.h"

nonstd::optional<IO::Networking::IpAddress> IO::Networking::IpAddress::TryParseFromString(std::string const& ipAddressString)
{
    IpAddress result;

    size_t ipv6Begin = -1;
    ipv6Begin = ipAddressString.find('[');
    if (ipv6Begin == -1)
    {
        result.m_address.type = Type::IPv4;
        const char* const fixEndPtr = ipAddressString.c_str() + ipAddressString.size();

        const char* tmpLastEndPtr = ipAddressString.c_str(); // loop variable
        for (int i = 0; i < result.m_address.ipv4.size(); i++)
        {
            const char* tmpStartPtr = tmpLastEndPtr;
            tmpLastEndPtr = fixEndPtr;

            int64_t segment = std::strtoll(tmpStartPtr, const_cast<char **>(&tmpLastEndPtr), 10);
            if (segment < 0 || segment > 255)
                return nonstd::nullopt;

            if (i != (result.m_address.ipv4.size() - 1))
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
            result.m_address.ipv4[i] = (uint8_t) segment;
        }
    }
    else
    {
        result.m_address.type = Type::IPv6;
        // TODO: Implement me. Keep in mind all the IPv6 truncation possibilities
        return nonstd::nullopt;
    }
    return result;
}

/// IPv4 Format: 255.255.255.255
/// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]
std::string IO::Networking::IpAddress::toString() const
{
    if (m_address.type == Type::IPv4)
    {
        return std::to_string((m_address.ipv4[0]) & 0xFF) + "." +
               std::to_string((m_address.ipv4[1]) & 0xFF) + "." +
               std::to_string((m_address.ipv4[2]) & 0xFF) + "." +
               std::to_string((m_address.ipv4[3]) & 0xFF);
    }
    else
    {
        // The IPv6 spec allows multiple zeros in a row to be truncated _once_ to just "::"
        // And segments where the number is just :FFFF: can be represented by :0:
        // Leading zeros in a segment can be completely omitted.
        // For example 1111:1100:FFFF:FFFF:0222:FFFF:0033:3333
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
        return result.str();
    }
}

IO::Networking::IpAddress::Type IO::Networking::IpAddress::getType() const
{
    return m_address.type;
}

