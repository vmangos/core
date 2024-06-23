#ifndef MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H
#define MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H

#ifdef WIN32
#include "./impl/windows/SocketDescriptor.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H
