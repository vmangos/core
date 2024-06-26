#ifndef MANGOS_IO_SYSTEMERRORTOSTRING_H
#define MANGOS_IO_SYSTEMERRORTOSTRING_H

#include <string>

// The buffer is thread_local, don't free it
char const* SystemErrorToCString(int nativeSystemErrorCode);
std::string SystemErrorToString(int nativeSystemErrorCode);

#endif //MANGOS_IO_SYSTEMERRORTOSTRING_H
