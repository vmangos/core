#ifndef MANGOS_IO_NETWORKING_UTILS_H
#define MANGOS_IO_NETWORKING_UTILS_H

#include <string>
#include "./IpAddress.h"

namespace IO { namespace Networking
{
    /// Checks whenever the same (IPv4) Address is in the same subnet as the other one
    bool IsInSameSubnet(IpAddress const& ipAddressInQuestion, IpAddress const& subnetIpAddress, uint8_t subnetMaskInCidrNotation);
}} // namespace IO::Networking

#endif //MANGOS_IO_NETWORKING_UTILS_H
