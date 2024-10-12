#ifndef MANGOS_IO_SYSTEMERRORTOSTRING_H
#define MANGOS_IO_SYSTEMERRORTOSTRING_H

#include <string>

/** Returns the status code and text description of a system error */
std::string SystemErrorToString(int nativeSystemErrorCode);

#endif //MANGOS_IO_SYSTEMERRORTOSTRING_H
