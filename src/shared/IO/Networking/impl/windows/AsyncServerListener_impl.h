#ifndef MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H

#include <vector>
#include <memory>
#include <string>
#include <chrono>
#include <WinSock2.h>
#include "IO/Context/AsyncIoOperation.h"
#include "IO/Networking/IpAddress.h"
#include "IO/Networking/SocketDescriptor.h"

template<typename TClientSocket>
IO::Networking::AsyncServerListener<TClientSocket>::~AsyncServerListener()
{
    ::closesocket(m_acceptorNativeSocket);
}

template<typename TClientSocket>
std::unique_ptr<IO::Networking::AsyncServerListener<TClientSocket>> IO::Networking::AsyncServerListener<TClientSocket>::CreateAndBindServer(IO::IoContext* ctx, std::string const& bindIp, uint16_t port)
{
    int errorCode;

    // TODO <static> check if WSA was already initialized
    // TODO if fatal error, close socket and CleanupWSA (if reference counter == 0)

    WSADATA wsaData;
    errorCode = ::WSAStartup(MAKEWORD(2, 2), &wsaData);
    if (errorCode != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSAStartup(...) Error: %u", errorCode);
        return nullptr;
    }

    // Create an IPv4 TCP server where other clients can connect to
    SOCKET listenNativeSocket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (listenNativeSocket == INVALID_SOCKET)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::socket(listen, ...) Error: %u", WSAGetLastError());
        return nullptr;
    }

    // Attach our listener socket to our completion port
    if (::CreateIoCompletionPort((HANDLE) listenNativeSocket, ctx->GetWindowsCompletionPort(), (u_long) 0, 0) != ctx->GetWindowsCompletionPort()) {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::CreateIoCompletionPort(listen, ...) Error: %u", WSAGetLastError());
        return nullptr;
    }

    sockaddr_in m_serverAddress;
    m_serverAddress.sin_family = AF_INET;
    m_serverAddress.sin_addr.s_addr = ::inet_addr(bindIp.c_str());
    m_serverAddress.sin_port = ::htons(port);
    if (::bind(listenNativeSocket, (struct sockaddr*)(&m_serverAddress), sizeof(m_serverAddress)) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::bind(...) Error: %u", WSAGetLastError());
        return nullptr;
    }

    int const acceptBacklogCount = 50; // the number of connection requests that are queued in the kernel until this process calls "accept"
    if (::listen(listenNativeSocket, acceptBacklogCount) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::listen(...) Error: %u", WSAGetLastError());
        return nullptr;
    }

    auto server = std::unique_ptr<AsyncServerListener<TClientSocket>>(new AsyncServerListener<TClientSocket>(ctx, listenNativeSocket));
    server->StartAcceptOperation();
    return server;
}

template<typename TClientSocket>
void IO::Networking::AsyncServerListener<TClientSocket>::StartAcceptOperation()
{
    SOCKET nativePeerSocket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP); // <-- will be filled when callback is called
    if (nativePeerSocket == INVALID_SOCKET)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::socket(accept, ...) Error: %u", WSAGetLastError());
        return;
    }

    // Attach our acceptor socket to our completion port
    if (::CreateIoCompletionPort((HANDLE) nativePeerSocket, m_ctx->GetWindowsCompletionPort(), (u_long) 0, 0) != m_ctx->GetWindowsCompletionPort()) {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::CreateIoCompletionPort(accept, ...) Error: %u", WSAGetLastError());
        return;
    }

    struct Addresses {
        sockaddr_in localAddress;
        uint8_t __pad1[16];
        sockaddr_in peerAddress;
        uint8_t __pad2[16];
    };

    Addresses* addrBuffer = new Addresses();
    m_currentAcceptTask.InitNew([nativePeerSocket, this, addrBuffer](DWORD errorCode) {
        if (errorCode)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::AcceptEx(...) Task Error: %u", errorCode);
            m_currentAcceptTask.Reset();
            return;
        }

        // TODO use inet_ntop to be thread safe
        std::string peerIpAddressStr(inet_ntoa(addrBuffer->peerAddress.sin_addr)); // inet_ntoa will "free" (reuse) the char* on its own
        delete addrBuffer;
        auto peerIpAddress = IO::Networking::IpAddress::TryParseFromString(peerIpAddressStr);
        MANGOS_ASSERT(peerIpAddress.has_value());

        uint16_t peerPort = ntohs(addrBuffer->peerAddress.sin_port);
        IO::Networking::IpEndpoint peerEndpoint(peerIpAddress.value(), peerPort);
        IO::Networking::SocketDescriptor socketDescriptor{peerEndpoint, nativePeerSocket};

        std::shared_ptr<TClientSocket> client = std::make_shared<TClientSocket>(m_ctx, socketDescriptor);
        HandlePostAccept(client);

        m_currentAcceptTask.Reset();
        this->StartAcceptOperation();
    });

    DWORD bytesWritten = 0;

    bool booleanOkay = ::AcceptEx(m_acceptorNativeSocket, nativePeerSocket,
                                  addrBuffer,
                                  0,
                                  sizeof(addrBuffer->localAddress) + sizeof(addrBuffer->__pad1), sizeof(addrBuffer->peerAddress) + sizeof(addrBuffer->__pad2),
                                  &bytesWritten, &m_currentAcceptTask
                        );
    if (!booleanOkay)
    {
        int lastError = WSAGetLastError();
        if (lastError != WSA_IO_PENDING) // Pending means that this task was queued (which is what we want)
        {
            m_currentAcceptTask.Reset();
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::AcceptEx(...) Error: %u", lastError);
            return;
        }
    }
}

#endif //MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H
