#include "Utils.h"

#if defined(WIN32)
#include <Windows.h>
#else
#include <unistd.h>
#endif

uint64_t IO::Utils::GetCurrentProcessId()
{
#ifdef WIN32
    return ::GetCurrentProcessId();
#else
    return ::getpid();
#endif
}
