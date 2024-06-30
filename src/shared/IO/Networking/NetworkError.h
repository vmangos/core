#ifndef MANGOS_IO_NETWORKING_NETWORKERROR_H
#define MANGOS_IO_NETWORKING_NETWORKERROR_H

#include <string>

namespace IO
{
    class NetworkError {
    public:
        enum class ErrorType {
            NoError,
            InternalError,
            SocketClosed,
            OnlyOneTransferPerDirectionAllowed,
        };
    public:
        explicit NetworkError(ErrorType errorType) : NetworkError(errorType, 0) {};
        explicit NetworkError(ErrorType errorType, int osErrorCode) : m_error{errorType}, m_additionalOsErrorCode{osErrorCode} {};

        ErrorType GetErrorType() const { return m_error; };

        explicit operator bool() const { return GetErrorType() != ErrorType::NoError; };
        std::string ToString() const;

    private:
        ErrorType m_error;
        /// internal variable for toString(), might be os and situation dependent (On windows there is ::GetLastError()/errno and ::WSAGetLastError())
        int m_additionalOsErrorCode;
    };
} // namespace IO

#endif //MANGOS_IO_NETWORKING_NETWORKERROR_H
