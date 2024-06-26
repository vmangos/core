#ifndef MANGOS_IO_NATIVEALIASES_H
#define MANGOS_IO_NATIVEALIASES_H

#if defined(WIN32)
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN

namespace IO { namespace Native {
    typedef UINT_PTR SocketHandle;
    typedef HANDLE FileHandle;
}} // namespace IO::_Native

#elif defined(__linux__)

namespace IO { namespace Native {
    typedef int SocketHandle;
    typedef int FileHandle;
}} // namespace IO::Native

#endif

#endif //MANGOS_IO_NATIVEALIASES_H
