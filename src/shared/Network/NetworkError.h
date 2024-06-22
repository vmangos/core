#ifndef MANGOS_NETWORKERROR_H
#define MANGOS_NETWORKERROR_H

#include <string>

namespace MaNGOS
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
}

#endif //MANGOS_NETWORKERROR_H
