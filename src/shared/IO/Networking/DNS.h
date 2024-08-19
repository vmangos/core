#ifndef MANGOS_IO_NETWORKING_DNS_H
#define MANGOS_IO_NETWORKING_DNS_H

#include <vector>
#include <experimental/vector>
#include "./IpAddress.h"

namespace IO { namespace Networking { namespace DNS
{
    std::string GetOwnHostname();
    std::vector<IO::Networking::IpAddress> ResolveDomain(std::string const& domainName, IO::Networking::IpAddress::Type type);
}}} // namespace IO::Networking

#endif // MANGOS_IO_NETWORKING_DNS_H
