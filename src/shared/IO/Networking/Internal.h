#ifndef MANGOS_IO_NETWORKING_INTERNAL_H
#define MANGOS_IO_NETWORKING_INTERNAL_H

#include "./IpAddress.h"
#include "IO/NativeAliases.h"

struct in_addr;

namespace IO { namespace Networking { namespace Internal
{
    /// Converts a native IN_ADDR to a IO::Networking::IpAddress
    IO::Networking::IpAddress inet_ntop(in_addr const* nativeAddress);

    /// Closes a socket
    void CloseSocket(IO::Native::SocketHandle nativeSocket);

}}} // IO::Networking::Internal

#endif // MANGOS_IO_NETWORKING_INTERNAL_H
