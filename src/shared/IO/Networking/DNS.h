#ifndef MANGOS_IO_NETWORKING_DNS_H
#define MANGOS_IO_NETWORKING_DNS_H

#include <vector>
#include "./IpAddress.h"

namespace IO { namespace Networking { namespace DNS
{
    std::string GetOwnHostname();

    /// Will also work with IP addresses without touching the DNS layer
    /// \warning Will return an empty list if unable to resolve the domain
    std::vector<IO::Networking::IpAddress> ResolveDomainAll(std::string const& domainName, IO::Networking::IpAddress::Type type);

    /// Different strategies on how to resolve multiple IPAddresses on the same domain name
    /// This can happen if, for example, a domain has multiple "A-Records" with the same name but different IPs.
    enum class SelectionStrategy
    {
        /// If multiple IPAddresses, take the first one
        First,

        /// If multiple IPAddresses, take a random one, has a "load-balancing" effect
        Random,
    };

    /// Just like `ResolveDomainAll` but will return at most one IPAddress
    nonstd::optional<IO::Networking::IpAddress> ResolveDomainSingle(std::string const& domainName, IO::Networking::IpAddress::Type type, SelectionStrategy strategy = SelectionStrategy::First);
}}} // namespace IO::Networking

#endif // MANGOS_IO_NETWORKING_DNS_H
