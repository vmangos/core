#ifndef MANGOS_IO_NETWORKING_DNS_H
#define MANGOS_IO_NETWORKING_DNS_H

#include <vector>
#include <chrono>
#include "./IpAddress.h"

namespace IO { namespace Networking { namespace DNS
{
    std::string GetOwnHostname();

    /// Will also work with IP addresses without touching the DNS layer
    /// \param timeout Maximum time to wait for DNS resolution. Default of 0 uses system default (potentially blocking).
    /// \warning Will return an empty list if unable to resolve the domain or if timeout is exceeded
    std::vector<IO::Networking::IpAddress> ResolveDomainAll(std::string const& domainName, IO::Networking::IpAddress::Type type, std::chrono::seconds timeout = std::chrono::seconds{0});

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
    /// \param timeout Maximum time to wait for DNS resolution. Default of 0 uses system default (potentially blocking).
    /// \warning Will return nullopt if unable to resolve the domain or if timeout is exceeded
    nonstd::optional<IO::Networking::IpAddress> ResolveDomainSingle(std::string const& domainName, IO::Networking::IpAddress::Type type, std::chrono::seconds timeout = std::chrono::seconds{0}, SelectionStrategy strategy = SelectionStrategy::First);
}}} // namespace IO::Networking

#endif // MANGOS_IO_NETWORKING_DNS_H
