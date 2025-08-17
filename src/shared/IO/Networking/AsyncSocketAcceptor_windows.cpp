#ifndef MANGOS_IO_NETWORKING_WIN32_AsyncSocketAcceptor_H
#define MANGOS_IO_NETWORKING_WIN32_AsyncSocketAcceptor_H

#include "IO/Networking/AsyncSocketAcceptor.h"
#include "IO/Networking/Internal.h"
#include "IO/Context/AsyncIoOperation.h"
#include "IO/Networking/IpAddress.h"
#include "IO/Networking/SocketDescriptor.h"
#include "IO/SystemErrorToString.h"
#include "Log.h"
#include "Memory/ArrayDeleter.h"

#include <vector>
#include <memory>
#include <string>
#include <chrono>

#include <WinSock2.h>
#include <MSWSock.h> // TODO: Currently just needed for ::AcceptEx, maybe its better if we get this func-ptr at runtime, just like Microsoft recommends it

IO::Networking::AsyncSocketAcceptor::AsyncSocketAcceptor(IO::IoContext* ctx, IO::Native::SocketHandle acceptorNativeSocket)
    : m_ctx(ctx), m_acceptorNativeSocket(acceptorNativeSocket), m_wasClosed(false) {}

IO::Networking::AsyncSocketAcceptor::~AsyncSocketAcceptor()
{
    MANGOS_ASSERT(m_wasClosed);
}

void IO::Networking::AsyncSocketAcceptor::ClosePortAndStopAcceptingNewConnections()
{
    m_wasClosed = true;

    ::closesocket(m_acceptorNativeSocket);

    while (m_currentAcceptTask.m_callback != nullptr)
        std::this_thread::yield(); // I think it's fine to "busy" wait here instead of adding complex .wait() logic to the hot `StartAcceptOperation` code.
}

std::unique_ptr<IO::Networking::AsyncSocketAcceptor> IO::Networking::AsyncSocketAcceptor::CreateAndBindServer(IO::IoContext* ctx, std::string const& bindIpStr, uint16_t port)
{
    nonstd::optional<IpAddress> maybeBindIp = IpAddress::TryParseFromString(bindIpStr);
    if (!maybeBindIp.has_value())
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Fail to parse IP '%s'", bindIpStr.c_str());
        return nullptr;
    }

    int errorCode;

    // TODO <static> check if WSA was already initialized
    // TODO if fatal error, close socket and CleanupWSA (if reference counter == 0)

    WSADATA wsaData;
    errorCode = ::WSAStartup(MAKEWORD(2, 2), &wsaData);
    if (errorCode != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::WSAStartup(...) Error: %u", errorCode);
        return nullptr;
    }

    // Create an IPv4 TCP server where other clients can connect to
    SOCKET listenNativeSocket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (listenNativeSocket == INVALID_SOCKET)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::socket(listen, ...) Error: %u", ::WSAGetLastError());
        return nullptr;
    }

    // Attach our listener socket to our completion port
    if (::CreateIoCompletionPort((HANDLE) listenNativeSocket, ctx->GetWindowsCompletionPort(), (u_long) 0, 0) != ctx->GetWindowsCompletionPort())
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::CreateIoCompletionPort(listen, ...) Error: %u", ::WSAGetLastError());
        return nullptr;
    }

    sockaddr_in m_serverAddress{};
    m_serverAddress.sin_family = AF_INET;
    IO::Networking::Internal::inet_pton(maybeBindIp.value(), &(m_serverAddress.sin_addr));
    m_serverAddress.sin_port = ::htons(port);
    if (::bind(listenNativeSocket, (struct sockaddr*)(&m_serverAddress), sizeof(m_serverAddress)) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::bind(...) Error: %s", SystemErrorToString(::WSAGetLastError()).c_str());
        return nullptr;
    }

    int const acceptBacklogCount = 50; // the number of connection requests that are queued in the kernel until this process calls "accept"
    if (::listen(listenNativeSocket, acceptBacklogCount) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::listen(...) Error: %s", SystemErrorToString(::WSAGetLastError()).c_str());
        return nullptr;
    }

    auto server = std::unique_ptr<AsyncSocketAcceptor>(new AsyncSocketAcceptor(ctx, listenNativeSocket));
    return server;
}

void IO::Networking::AsyncSocketAcceptor::AutoAcceptSocketsUntilClose(std::function<void(IO::Networking::SocketDescriptor socketDescriptor)> const& onNewSocket)
{
    AcceptOne([onNewSocket, this](nonstd::expected<IO::Networking::SocketDescriptor, IO::NetworkError> acceptResult)
    {
        if (!acceptResult.has_value())
        {
            if (!m_wasClosed)
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "AcceptOne Error: %s", acceptResult.error().ToString().c_str());
            return;
        }

        onNewSocket(std::move(acceptResult.value()));
        AutoAcceptSocketsUntilClose(onNewSocket);
    });
}

void IO::Networking::AsyncSocketAcceptor::AcceptOne(std::function<void(nonstd::expected<IO::Networking::SocketDescriptor, IO::NetworkError>)> const& afterAccept)
{
    SOCKET nativePeerSocket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP); // <-- will be filled when callback is called
    if (nativePeerSocket == INVALID_SOCKET)
    {
        afterAccept(nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, ::WSAGetLastError())));
        return;
    }

    // AcceptEx stores the data in an internal Windows format. It can be read with `::GetAcceptExSockaddrs()`.
    std::shared_ptr<uint8_t> addrBuffer = std::shared_ptr<uint8_t>(new uint8_t[((sizeof(sockaddr_in) + 16) * 2)], MaNGOS::Memory::array_deleter<uint8_t>());
    m_currentAcceptTask.InitNew([nativePeerSocket, this, addrBuffer, afterAccept](DWORD errorCode)
    {
        auto localAfterAccept = std::move(afterAccept);
        auto localAddrBuffer = std::move(addrBuffer);
        auto localNativePeerSocket = std::move(nativePeerSocket);
        auto wasClosed = m_wasClosed;

        this->m_currentAcceptTask.Reset(); // IMPORTANT: after we reset, the captured variables are no longer valid
        // ===== No captured variables after this point =====

        if (!errorCode)
        { // No error, everything is fine
            SOCKADDR_IN* localAddr = nullptr;
            SOCKADDR_IN* remoteAddr = nullptr;
            int localAddrLen = 0;
            int remoteAddrLen = 0;

            ::GetAcceptExSockaddrs(localAddrBuffer.get(), 0,
                sizeof(SOCKADDR_IN) + 16, sizeof(SOCKADDR_IN) + 16,
                (SOCKADDR**)&localAddr, &localAddrLen,
                (SOCKADDR**)&remoteAddr, &remoteAddrLen);

            IpAddress ip = IO::Networking::Internal::inet_ntop(&(remoteAddr->sin_addr));
            uint16_t port = ::ntohs(remoteAddr->sin_port);

            localAfterAccept(IO::Networking::SocketDescriptor(localNativePeerSocket, { ip, port }));
            return;
        }

        if (errorCode == ERROR_OPERATION_ABORTED && wasClosed)
        { // ignore "aborted" error when we are in a closing state
            localAfterAccept(nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::SocketClosed, 0)));
            return;
        }

        // we got a real error
        localAfterAccept(nonstd::make_unexpected(IO::NetworkError(NetworkError::ErrorType::InternalError, ::WSAGetLastError())));
    });

    DWORD bytesWritten = 0;

    bool booleanOkay = ::AcceptEx(m_acceptorNativeSocket, nativePeerSocket,
        addrBuffer.get(),
        0,
        sizeof (sockaddr_in) + 16, sizeof (sockaddr_in) + 16,
        &bytesWritten, &m_currentAcceptTask
    );
    if (!booleanOkay)
    {
        int lastError = ::WSAGetLastError();
        if (lastError != WSA_IO_PENDING) // Pending means that this task was queued (which is what we want)
        {
            m_currentAcceptTask.Reset();
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::AcceptEx(...) Error: %u", lastError);
            return;
        }
    }
}

#endif //MANGOS_IO_NETWORKING_WIN32_AsyncSocketAcceptor_H
