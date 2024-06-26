#ifndef MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H
#define MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H

#include <string>
#include "./IpAddress.h"
#include "../NativeAliases.h"

namespace IO { namespace Networking {

struct SocketDescriptor {
public:
    IO::Networking::IpEndpoint const m_peerEndpoint;
    IO::Native::SocketHandle const _nativeSocket; // <-- Internal use only
};

}} // namespace IO::Networking

#endif //MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H
