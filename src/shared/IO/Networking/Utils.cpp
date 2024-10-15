#include "./Utils.h"
#include "../../Errors.h"

/// Checks whenever the same (IPv4) Address is in the same subnet as the other one
bool IO::Networking::IsInSameSubnet(IpAddress const& ipAddressInQuestion, IpAddress const& subnetIpAddress, uint8_t subnetMaskInCidrNotation)
{
    if (ipAddressInQuestion.GetType() != IpAddress::Type::IPv4 || subnetIpAddress.GetType() != IpAddress::Type::IPv4)
        return false;

    MANGOS_ASSERT(subnetMaskInCidrNotation >= 0 && subnetMaskInCidrNotation <= 32); // CIDR notation means that "255.255.255.0" is actually "24"

    // An IPv4 address is in the same subnet if the first n-bits (subnetMaskBits) are the same
    uint32_t binarySubnetMask = 0xFFFFFFFF << (32 - subnetMaskInCidrNotation);
    uint32_t inQuestionNet = ipAddressInQuestion._getInternalIPv4ReprAsUint32() & binarySubnetMask;
    uint32_t subnetNet = subnetIpAddress._getInternalIPv4ReprAsUint32() & binarySubnetMask;
    bool isInSameSubnet = (inQuestionNet == subnetNet);

    return isInSameSubnet;
}
