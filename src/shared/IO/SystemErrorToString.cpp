#include "./SystemErrorToString.h"

#if defined(WIN32)
#include <Windows.h>
#elif defined(__linux__)
#include <cstring>
#endif

constexpr int MAX_ERROR_TEXT_LENGTH = 255;
thread_local char g_threadLocalStorage[MAX_ERROR_TEXT_LENGTH];

// The buffer is thread_local, don't free it
char const* SystemErrorToCString(int nativeSystemErrorCode) {
#if defined(WIN32)
    if (!FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_MAX_WIDTH_MASK, nullptr, nativeSystemErrorCode, MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), g_threadLocalStorage, MAX_ERROR_TEXT_LENGTH, nullptr))
        return "<Unable to generate error text>";
    return g_threadLocalStorage;
#elif defined(__linux__)
    // Linux might not need our buffer in all cases, sometimes it has a pointer to the text already
    return ::strerror_r(nativeSystemErrorCode, g_threadLocalStorage, sizeof(g_threadLocalStorage));
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    if (::strerror_r(nativeSystemErrorCode, g_threadLocalStorage, sizeof(g_threadLocalStorage)) != 0)
        return "<Unable to generate error text>";
    return g_threadLocalStorage;
#else
#error "IO::SystemErrorToCString(...) not supported on your platform"
#endif
}

std::string SystemErrorToString(int nativeSystemErrorCode) {
    return '(' + std::to_string(nativeSystemErrorCode) + ") " + SystemErrorToCString(nativeSystemErrorCode);
}
