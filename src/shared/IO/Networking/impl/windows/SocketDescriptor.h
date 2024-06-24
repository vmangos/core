#ifndef MANGOS_IO_NETWORKING_WIN32_SOCKETDESCIRPTOR_H
#define MANGOS_IO_NETWORKING_WIN32_SOCKETDESCIRPTOR_H

#include <string>
#include "IO/Networking/IpAddress.h"

#include <WinSock2.h>

namespace IO { namespace Networking {

struct SocketDescriptor {
public:
    IpEndpoint const peerEndpoint;
//private:
    SOCKET nativeSocket;
};

}} // namespace IO::Networking

#endif //MANGOS_IO_NETWORKING_WIN32_SOCKETDESCIRPTOR_H
