#ifndef MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H

#ifdef WIN32
#include "./impl/windows/AsyncServerListener.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
