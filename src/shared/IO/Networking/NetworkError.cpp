#include "./NetworkError.h"

std::string const& ErrorBaseString(IO::NetworkError::ErrorType errorType)
{
    switch (errorType) {
        case IO::NetworkError::ErrorType::NoError:
        {
            static std::string txt = "NoError";
            return txt;
        }
        case IO::NetworkError::ErrorType::InternalError:
        {
            static std::string txt = "InternalError";
            return txt;
        }
        case IO::NetworkError::ErrorType::SocketClosed:
        {
            static std::string txt = "SocketClosed";
            return txt;
        }
        case IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed:
        {
            static std::string txt = "OnlyOneTransferPerDirectionAllowed";
            return txt;
        }
    }
}

std::string IO::NetworkError::ToString() const
{
    std::string result = ErrorBaseString(GetErrorType());
    if (_GetOsErrorCode())
        result += " (Code: " + std::to_string(_GetOsErrorCode()) + ")";

    return result;
}
