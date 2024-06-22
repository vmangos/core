#ifndef MANGOS_IO_NETWORKING_ASYNCSOCKET_H
#define MANGOS_IO_NETWORKING_ASYNCSOCKET_H

#ifdef WIN32
#include "./impl/windows/AsyncSocket.h"
#else
#error "Mangos::IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSOCKET_H
