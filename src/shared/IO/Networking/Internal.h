#ifndef MANGOS_IO_NETWORKING_INTERNAL_H
#define MANGOS_IO_NETWORKING_INTERNAL_H

#include "./IpAddress.h"
#include "IO/NativeAliases.h"

struct in_addr;

namespace IO { namespace Networking { namespace Internal
{
    /// Converts a native `IN_ADDR` to a `IO::Networking::IpAddress`
    IO::Networking::IpAddress inet_ntop(in_addr const* nativeAddress);

    /// Converts a `IO::Networking::IpAddress` to a native `IN_ADDR`
    void inet_pton(IO::Networking::IpAddress const& ipAddress, in_addr* out_dest);

    /// Closes a socket
    void CloseSocket(IO::Native::SocketHandle nativeSocket);

}}} // IO::Networking::Internal

#endif // MANGOS_IO_NETWORKING_INTERNAL_H
