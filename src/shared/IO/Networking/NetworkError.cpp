#include "./NetworkError.h"
#include "../SystemErrorToString.h"

std::string const& GetErrorBaseString(IO::NetworkError::ErrorType errorType)
{
    switch (errorType)
    {
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

    static std::string undefined = "<UNDEFINED>";
    return undefined;
}

std::string IO::NetworkError::ToString() const
{
    std::string result = GetErrorBaseString(this->GetErrorType());
    if (m_additionalOsErrorCode)
        result += " (Code " + std::to_string(m_additionalOsErrorCode) + ": " + SystemErrorToString(m_additionalOsErrorCode) + ")";

    return result;
}
