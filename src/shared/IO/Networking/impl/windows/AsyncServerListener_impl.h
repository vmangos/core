#ifndef MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H

#include <vector>
#include <memory>
#include <string>
#include <chrono>
#include <WinSock2.h>
#include "./IocpOperationTask.h"



template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::HandleAccept(std::shared_ptr<TClientSocket> newClient)
{
    newClient->Start();
}

template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::RunEventLoop(std::chrono::milliseconds maxBlockingDuration)
{
    ULONG_PTR completionKey = 0;
    IocpOperationTask* task = nullptr;

    DWORD bytesWritten = 0;
    bool booleanOkay = ::GetQueuedCompletionStatus(m_completionPort, &bytesWritten, &completionKey, reinterpret_cast<LPOVERLAPPED*>(&task), maxBlockingDuration.count());
    DWORD errorCode = ::GetLastError();
    if (task)
        task->OnComplete(booleanOkay ? 0 : errorCode);
    else if (errorCode != WAIT_TIMEOUT)
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::GetQueuedCompletionStatus(...) Has no TASK!!! Error: %u", errorCode);
}

template<typename TClientSocket>
std::unique_ptr<AsyncServerListener<TClientSocket>> AsyncServerListener<TClientSocket>::CreateAndBindServer(const std::string &bindIp, uint16_t port)
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

    int const numberOfConcurrentThreads = 0; // If this parameter is zero, the system allows as many concurrently running threads as there are processors in the system.
    HANDLE completionPort = ::CreateIoCompletionPort(INVALID_HANDLE_VALUE, nullptr, (ULONG_PTR) 0, numberOfConcurrentThreads);
    if (completionPort == nullptr)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::CreateIoCompletionPort(root, ...) Error: %u", GetLastError());
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
    HANDLE tmpCompletionPort = ::CreateIoCompletionPort((HANDLE) listenNativeSocket, completionPort, (u_long) 0, 0);
    if (tmpCompletionPort != completionPort) {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::CreateIoCompletionPort(listen, ...) Error: %u", WSAGetLastError());
        return nullptr;
    }

    SOCKADDR_IN m_serverAddress;
    m_serverAddress.sin_family = AF_INET;
    m_serverAddress.sin_addr.s_addr = ::inet_addr(bindIp.c_str());
    m_serverAddress.sin_port = ::htons(port);
    errorCode = ::bind(listenNativeSocket, (SOCKADDR*)(&m_serverAddress), sizeof(m_serverAddress));
    if (errorCode != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::bind(...) Error: %u", WSAGetLastError());
        return nullptr;
    }

    int const acceptBacklogCount = 50; // the number of connection requests that are queued in the kernel until this process calls "accept"
    errorCode = ::listen(listenNativeSocket, acceptBacklogCount);
    if (errorCode != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::listen(...) Error: %u", WSAGetLastError());
        return nullptr;
    }

    auto server = std::unique_ptr<AsyncServerListener<TClientSocket>>(new AsyncServerListener<TClientSocket>(listenNativeSocket, completionPort));
    server->StartAcceptOperation();
    return server;
}

template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::StartAcceptOperation()
{
    SOCKET nativePeerSocket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (nativePeerSocket == INVALID_SOCKET)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::socket(accept, ...) Error: %u", WSAGetLastError());
        return;
    }

    // Attach our acceptor socket to our completion port
    HANDLE tmpCompletionPort = CreateIoCompletionPort((HANDLE) nativePeerSocket, m_completionPort, (u_long) 0, 0);
    if (tmpCompletionPort != m_completionPort) {
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
    IocpOperationTask* task = new IocpOperationTask([nativePeerSocket, this, addrBuffer](IocpOperationTask* task, DWORD errorCode) {
        std::string peerIpAddressStr(inet_ntoa(addrBuffer->peerAddress.sin_addr)); // inet_ntoa will "free" (reuse) the char* on its own
        delete addrBuffer;
        auto peerIpAddress = IO::Networking::IpAddress::TryParseFromString(peerIpAddressStr);
        MANGOS_ASSERT(peerIpAddress.has_value());

        uint16_t peerPort = ntohs(addrBuffer->peerAddress.sin_port);
        IO::Networking::IpEndpoint peerEndpoint(peerIpAddress.value(), peerPort);
        IO::Networking::SocketDescriptor socketDescriptor{peerEndpoint, nativePeerSocket};

        std::shared_ptr<TClientSocket> client = std::make_shared<TClientSocket>(socketDescriptor);
        HandleAccept(client);

        this->StartAcceptOperation();
    });

    DWORD bytesWritten = 0;

    bool booleanOkay = ::AcceptEx(m_acceptorNativeSocket, nativePeerSocket,
                                  addrBuffer,
                                  0,
                                  sizeof(addrBuffer->localAddress) + sizeof(addrBuffer->__pad1), sizeof(addrBuffer->peerAddress) + sizeof(addrBuffer->__pad2),
                                  &bytesWritten, task
    );
    if (!booleanOkay)
    {
        int lastError = WSAGetLastError();
        if (lastError != WSA_IO_PENDING)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::AcceptEx(...) Error: %u", lastError);
            return;
        }
    }
}

#endif //MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H
