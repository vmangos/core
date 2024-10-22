#ifndef MANGOS_IO_NETWORKING_UNIX_LOWLEVELUTIL_H
#define MANGOS_IO_NETWORKING_UNIX_LOWLEVELUTIL_H

#include <fcntl.h>
#include "./Networking/NetworkError.h"
#include "./NativeAliases.h"

namespace IO { namespace Utils
{
    /// Sets a status flag on a handle (for example O_NONBLOCK)
    inline IO::NetworkError SetFdStatusFlag(IO::Native::SocketHandle socket, int status)
    {
        int originalFileStatus = ::fcntl(socket, F_GETFL);
        if (originalFileStatus == -1)
            return IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno);

        int newFileStatus = originalFileStatus | status;
        int returnVal = ::fcntl(socket, F_SETFL, newFileStatus);
        if (returnVal == -1)
            return IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno);

        return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
    }
}} // namespace UI::Util

#endif //MANGOS_IO_NETWORKING_UNIX_LOWLEVELUTIL_H
