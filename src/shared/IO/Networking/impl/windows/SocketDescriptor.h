#ifndef MANGOS_IO_NETWORKING_WIN32_SOCKETDESCIRPTOR_H
#define MANGOS_IO_NETWORKING_WIN32_SOCKETDESCIRPTOR_H

#include <string>

#include "WinSock2.h"

struct SocketDescriptor {
public:
    /// IP address without port.
    /// An unmodified vanilla client without proxy only supports IPv4.
    /// (But in case of an IPv6-address it might also contain these characters "[::]")
    std::string const peerAddress;
//private:
    SOCKET nativeSocket;
};

#endif //MANGOS_IO_NETWORKING_WIN32_SOCKETDESCIRPTOR_H
