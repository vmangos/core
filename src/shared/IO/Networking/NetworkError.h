#ifndef MANGOS_IO_NETWORKING_NETWORKERROR_H
#define MANGOS_IO_NETWORKING_NETWORKERROR_H

#include <string>

namespace IO
{
    struct NetworkError {
        enum class ErrorType {
            NoError,
            InternalError,
            SocketClosed,
            OnlyOneTransferPerDirectionAllowed,
        };

        ErrorType Error;

        explicit operator bool() const {
            return Error != ErrorType::NoError;
        };

        std::string toString() const {
            return "TODO, Error to String";
        }
    };
} // namespace IO

#endif //MANGOS_IO_NETWORKING_NETWORKERROR_H
