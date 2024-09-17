#ifndef MANGOS_IO_NETWORKING_NETWORKERROR_H
#define MANGOS_IO_NETWORKING_NETWORKERROR_H

#include <string>

namespace IO
{
    class NetworkError {
    public:
        enum class ErrorType : int
        {
            NoError,
            InternalError, // see m_additionalOsErrorCode
            SocketClosed,
            OnlyOneTransferPerDirectionAllowed,
            Timeout,
            InvalidProtocolBehavior,
        };
    public:
        explicit constexpr NetworkError(ErrorType errorType) : NetworkError(errorType, 0) {};
        explicit constexpr NetworkError(ErrorType errorType, int osErrorCode) : m_error{errorType}, m_additionalOsErrorCode{osErrorCode} {};

        ErrorType GetErrorType() const { return m_error; };

        explicit operator bool() const { return GetErrorType() != ErrorType::NoError; };
        std::string ToString() const;

        static NetworkError FromSystemError(int osErrorCode)
        {
            return NetworkError(ErrorType::InternalError, osErrorCode);
        }
    private:
        ErrorType m_error;
        /// internal variable for ToString(), might be os and situation dependent (On windows there is ::GetLastError()/errno and ::WSAGetLastError())
        int m_additionalOsErrorCode;
    };

} // namespace IO

#endif //MANGOS_IO_NETWORKING_NETWORKERROR_H
