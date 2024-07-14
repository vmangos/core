#ifndef MANGOS_IO_NETWORKING_UNIX_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_UNIX_ASYNCSERVERLISTENER_H

#include <vector>
#include <memory>
#include <string>
#include <chrono>
#include <sys/epoll.h>
#include "IO/SystemErrorToString.h"

template<typename TClientSocket>
AsyncServerListener<TClientSocket>::~AsyncServerListener()
{
}

template<typename TClientSocket>
std::unique_ptr<AsyncServerListener<TClientSocket>> AsyncServerListener<TClientSocket>::CreateAndBindServer(std::string const& bindIp, uint16_t port)
{
    IO::Native::SocketHandle listenNativeSocket = ::socket(AF_INET, SOCK_STREAM, 0);
    if (listenNativeSocket == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::socket(listen) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    int optionValue = 1; // Linux is a bit weird. When someone else is still connected to our socket, but we restart the server, the server cannot bind again.
    if (::setsockopt(listenNativeSocket, SOL_SOCKET, SO_REUSEADDR, &optionValue, sizeof(optionValue)) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::setsockopt(reuseaddr) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    sockaddr_in m_serverAddress;
    m_serverAddress.sin_family = AF_INET;
    m_serverAddress.sin_addr.s_addr = ::inet_addr(bindIp.c_str());
    m_serverAddress.sin_port = ::htons(port);
    if (::bind(listenNativeSocket, (struct sockaddr*)&m_serverAddress, sizeof(m_serverAddress)) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::bind(listen) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    int const acceptBacklogCount = 50; // the number of connection requests that are queued in the kernel until this process calls "accept"
    if (::listen(listenNativeSocket, acceptBacklogCount) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::listen(...) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    int const epollSizeHint = 50; // <-- hint, how many epoll targets we have. But in modern kernels this is ignored anyway
    int epollDescriptor = ::epoll_create(epollSizeHint);
    if (epollDescriptor == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::epoll_create(...) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    // Add server socket to epoll (needed for ::accept(..))
    struct epoll_event event;
    event.events = EPOLLIN | EPOLLERR; // Don't use EdgeTrigger here, since if multiple ::accepts are in the queue, we one get notified for one
    event.data.fd = listenNativeSocket;
    if (::epoll_ctl(epollDescriptor, EPOLL_CTL_ADD, listenNativeSocket, &event) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::epoll_ctl(...) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    auto server = std::unique_ptr<AsyncServerListener<TClientSocket>>(new AsyncServerListener<TClientSocket>(listenNativeSocket, epollDescriptor));
    return server;
}

template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::RunEventLoop(std::chrono::milliseconds maxBlockingDuration)
{
    int const maxEvents = 100;

    struct epoll_event events[maxEvents];
    int numEvents = ::epoll_wait(m_epollDescriptor, events, maxEvents, maxBlockingDuration.count());
    if (numEvents == -1)
    {
        if (errno != EINTR) // ignore interrupted system call
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] RunEventLoop -> ::epoll_wait(...) Error: %s", SystemErrorToCString(errno));
        return;
    }
    if (numEvents == 0)
        return; // no events

    sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "numEvents = %d", numEvents);

    for (int i = 0; i < numEvents; i++)
    {
        auto const& event = events[i];

        if (event.data.fd == m_acceptorNativeSocket)
        {
            this->OnNewClientToAcceptAvailable();
        }
        else
        {
            TClientSocket* client = (TClientSocket*) event.data.ptr;
            if (event.events & EPOLLERR)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Epoll ERR");
                client->StopPendingTransactionsAndForceClose();
            }
            else if (event.events & EPOLLRDHUP)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "EPOLLRDHUP -> Going to disconnect.");
                client->StopPendingTransactionsAndForceClose();
            }
            else
            {
                if (event.events & EPOLLIN)
                    client->PerformNonBlockingRead();

                if (event.events & EPOLLOUT)
                    client->PerformNonBlockingWrite();
            }
        }

    }
}

template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::OnNewClientToAcceptAvailable()
{
    struct sockaddr_in peerAddress;
    socklen_t client_len = sizeof(peerAddress);
    int nativePeerSocket = ::accept(m_acceptorNativeSocket, (struct sockaddr*)&peerAddress, &client_len);
    if (nativePeerSocket == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] RunEventLoop -> ::accept(...) Error: %s", SystemErrorToCString(errno));
        return;
    }

    std::string peerIpAddressStr(inet_ntoa(peerAddress.sin_addr)); // inet_ntoa will "free" (reuse) the char* on its own
    auto peerIpAddress = IO::Networking::IpAddress::TryParseFromString(peerIpAddressStr);
    MANGOS_ASSERT(peerIpAddress.has_value());

    uint16_t peerPort = ntohs(peerAddress.sin_port);
    IO::Networking::IpEndpoint peerEndpoint(peerIpAddress.value(), peerPort);
    IO::Networking::SocketDescriptor socketDescriptor{peerEndpoint, nativePeerSocket};

    std::shared_ptr<TClientSocket> client = std::make_shared<TClientSocket>(socketDescriptor);

    struct epoll_event event;
    event.events = EPOLLIN | EPOLLOUT | EPOLLERR | EPOLLRDHUP | EPOLLET;
    event.data.ptr = client.get();
    if (::epoll_ctl(m_epollDescriptor, EPOLL_CTL_ADD, nativePeerSocket, &event) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] OnNewClientToAcceptAvailable -> ::epoll_ctl(...) Error: %s", SystemErrorToCString(errno));
        return;
    }

    HandlePostAccept(client);
}

#endif //MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H
