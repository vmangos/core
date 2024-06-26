#include "./SystemErrorToString.h"

#if defined(__linux__)
#include <cstring>
#endif

constexpr int MAX_ERROR_TEXT_LENGTH = 255;
thread_local char g_threadLocalStorage[MAX_ERROR_TEXT_LENGTH];

// The buffer is thread_local, don't free it
char const* SystemErrorToCString(int nativeSystemErrorCode) {
#if defined(WIN32)
    if (::strerror_s(g_threadLocalStorage, sizeof(g_threadLocalStorage), nativeSystemErrorCode) != 0)
        return "<Unable to genereate error text>";
    return g_threadLocalStorage;
#elif defined(__linux__)
    // Linux might not actually need our buffer in all cases, sometimes it has a pointer to the text already
    return ::strerror_r(nativeSystemErrorCode, g_threadLocalStorage, sizeof(g_threadLocalStorage));
#else
#error "IO::SystemErrorToCString(...) not supported on your platform"
#endif
}

std::string SystemErrorToString(int nativeSystemErrorCode) {
    return SystemErrorToCString(nativeSystemErrorCode);
}
