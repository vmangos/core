#include "SocketConnector.h"
#include "Internal.h"

#if defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    #include <sys/socket.h>
    #include <netinet/in.h>
    #include <arpa/inet.h>
    #include "IO/Utils_Unix.h"
    #define GetNetworkError() errno
#elif defined(WIN32)
    #include <WinSock2.h>
    #include <WS2tcpip.h>
    #define GetNetworkError() ::WSAGetLastError()
#endif

#if defined(__linux__)
    #include <sys/epoll.h>
    #include <fcntl.h>
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    #include <sys/event.h>
    #include <unistd.h>
#endif

#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)

#ifdef inet_pton
#undef inet_pton
#endif

#endif

nonstd::expected<IO::Networking::SocketDescriptor, IO::NetworkError> IO::Networking::SocketConnector::ConnectBlocking(IO::Networking::IpEndpoint const& target, std::chrono::milliseconds timeoutMs)
{
    IO::Native::SocketHandle nativeSocket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (nativeSocket == -1)
    {
        return nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, GetNetworkError()));
    }

    ::sockaddr_in targetAddress{};
    targetAddress.sin_family = AF_INET;
    targetAddress.sin_port = htons(target.port);
    IO::Networking::Internal::inet_pton(target.ip, &(targetAddress.sin_addr));

    // Set socket to non-blocking mode, so the `::connect` does not block

#if defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    IO::NetworkError err = IO::Utils::SetFdStatusFlag(nativeSocket, O_NONBLOCK);
    if (err)
        return nonstd::make_unexpected(err);
#elif defined(WIN32)
    u_long mode = 1;
    int ioCtlStatus = ::ioctlsocket(nativeSocket, FIONBIO, &mode);
    if (ioCtlStatus != 0)
        return nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, GetNetworkError()));
#endif

    int result = ::connect(nativeSocket, (struct sockaddr *)&targetAddress, sizeof(targetAddress));
    if (result == -1)
    {
        int lastError = GetNetworkError();
        if (lastError !=
#if defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
        EINPROGRESS
#elif defined(WIN32)
        WSAEWOULDBLOCK
#endif
        )
        { // Oh, this is an actual error :(
            IO::Networking::Internal::CloseSocket(nativeSocket);
            return nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, lastError));
        }
    }

    ::timeval tv{};
    tv.tv_sec = (long)(timeoutMs.count() / 1000L);
    tv.tv_usec = (long)((timeoutMs.count() % 1000L) * 1000L);

    ::fd_set selectFileDescriptors;
    FD_ZERO(&selectFileDescriptors);
    FD_SET(nativeSocket, &selectFileDescriptors);

    // wait for some kind response
    int selectStatus = ::select((int)(nativeSocket + 1), &selectFileDescriptors, &selectFileDescriptors, &selectFileDescriptors, &tv);
    if (selectStatus == -1)
    { // ::select internal error
        int lastError = GetNetworkError();
        IO::Networking::Internal::CloseSocket(nativeSocket);
        return nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, lastError));
    }

    if (selectStatus == 0)
    { // timeout
        IO::Networking::Internal::CloseSocket(nativeSocket);
        return nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::Timeout, 0));
    }

    int socketError = 0;
    socklen_t socketErrorLength = sizeof(socketError);
    int getSocketOptStatus = ::getsockopt(nativeSocket, SOL_SOCKET, SO_ERROR, (char*)&socketError, &socketErrorLength);
    if (getSocketOptStatus != 0)
    {
        IO::Networking::Internal::CloseSocket(nativeSocket);
        return nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, GetNetworkError()));
    }

    if (socketError != 0)
    {
        IO::Networking::Internal::CloseSocket(nativeSocket);
        return nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, socketError));
    }

    return IO::Networking::SocketDescriptor(nativeSocket, target);
}
