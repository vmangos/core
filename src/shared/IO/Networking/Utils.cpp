#include "./Utils.h"
#include "nonstd/optional.hpp"
#include "../../Errors.h"

bool IO::Networking::IsInSameSubnet(IpAddress const& ipAddressInQuestion, IpAddress const& subnetIpAddress, uint8_t subnetMaskInCidrNotation)
{
    if (ipAddressInQuestion.getType() != IpAddress::Type::IPv4 || subnetIpAddress.getType() != IpAddress::Type::IPv4)
        return false;

    MANGOS_ASSERT(subnetMaskInCidrNotation >= 0 && subnetMaskInCidrNotation <= 32);

    // An IPv4 address is in the same subnet if the first n-bits (subnetMaskBits) are the same
    uint32_t binarySubnetMask = 0xFFFFFFFF << (32 - subnetMaskInCidrNotation);
    uint32_t inQuestionNet = ipAddressInQuestion._getInternalIPv4ReprAsUint32() & binarySubnetMask;
    uint32_t subnetNet = ipAddressInQuestion._getInternalIPv4ReprAsUint32() & binarySubnetMask;
    bool isInSameSubnet = (inQuestionNet == subnetNet);

    return isInSameSubnet;
}
