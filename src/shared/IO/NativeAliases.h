#ifndef MANGOS_IO_NATIVEALIASES_H
#define MANGOS_IO_NATIVEALIASES_H

#if defined(WIN32)
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN

namespace IO::Native {
    typedef SOCKET SocketHandle;
    typedef HANDLE FileHandle;
}

#elif defined(__linux__)

namespace IO::Native {
    typedef int SocketHandle;
    typedef int FileHandle;
}

#endif

#endif //MANGOS_IO_NATIVEALIASES_H
