#ifndef MANGOS_IO_NETWORKING_DNS_H
#define MANGOS_IO_NETWORKING_DNS_H

#include <vector>
#include "./IpAddress.h"

namespace IO { namespace Networking { namespace DNS
{
    std::string GetOwnHostname();

    /// Will also work with IP addresses without touching the DNS layer
    /// \warning Will return an empty list if unable to resolve the domain
    std::vector<IO::Networking::IpAddress> ResolveDomain(std::string const& domainName, IO::Networking::IpAddress::Type type);
}}} // namespace IO::Networking

#endif // MANGOS_IO_NETWORKING_DNS_H
