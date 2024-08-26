#ifndef MANGOS_IO_NETWORKING_UNIX_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_UNIX_ASYNCSERVERLISTENER_H

#include <vector>
#include <memory>
#include <string>
#include <chrono>
#include "Log.h"
#include "Errors.h"
#include "IO/Utils_Unix.h"
#include "IO/Context/IoContext.h"
#include "IO/Networking/SocketDescriptor.h"
#include "IO/Networking/IpAddress.h"
#include "IO/Networking/Internal.h"
#include "IO/SystemErrorToString.h"

#if defined(__linux__)
#include <sys/epoll.h>
#elif defined(__APPLE__)
#include <sys/event.h>
#endif

template<typename TClientSocket>
IO::Networking::AsyncServerListener<TClientSocket>::~AsyncServerListener()
{
    MANGOS_ASSERT(m_wasClosed);
}

template<typename TClientSocket>
void IO::Networking::AsyncServerListener<TClientSocket>::ClosePortAndStopAcceptingNewConnections()
{
    m_wasClosed = true;

    ::close(m_acceptorNativeSocket);
}

template<typename TClientSocket>
std::unique_ptr<IO::Networking::AsyncServerListener<TClientSocket>> IO::Networking::AsyncServerListener<TClientSocket>::CreateAndBindServer(IO::IoContext* ctx, std::string const& bindIp, uint16_t port)
{
    IO::Native::SocketHandle listenNativeSocket = ::socket(AF_INET, SOCK_STREAM, 0);
    if (listenNativeSocket == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::socket(listen) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    int optionValue = 1; // Unix/macOS is a bit weird. When someone else is still connected to our socket, but we restart the server, the server cannot bind again.
    if (::setsockopt(listenNativeSocket, SOL_SOCKET, SO_REUSEADDR, &optionValue, sizeof(optionValue)) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::setsockopt(reuseaddr) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    sockaddr_in m_serverAddress;
    m_serverAddress.sin_family = AF_INET;
    m_serverAddress.sin_addr.s_addr = ::inet_addr(bindIp.c_str());
    m_serverAddress.sin_port = htons(port);
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

    auto server = std::unique_ptr<AsyncServerListener<TClientSocket>>(new AsyncServerListener<TClientSocket>(ctx, listenNativeSocket));

    // Add server socket to event queue (needed for ::accept(..))
#if defined(__linux__)
    struct epoll_event event;
    event.events = EPOLLIN | EPOLLERR; // Don't use EdgeTrigger here, since if multiple ::accepts are in the queue, we one get notified for one
    event.data.u32 = static_cast<uint32_t>(IoContextEpollTargetType::IoEventReceiverFunction);
    static_assert(std::is_base_of<IO::SystemIoEventReceiver, typename std::pointer_traits<decltype(server)>::element_type>::value, "Must implement SystemIoEventReceiver interface!");
    event.data.ptr = server.get(); // note static_assert above
    if (::epoll_ctl(ctx->GetUnixEpollDescriptor(), EPOLL_CTL_ADD, listenNativeSocket, &event) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::epoll_ctl(...) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }
#elif defined(__APPLE__)
    struct kevent addedEvents{};
    static_assert(std::is_base_of<IO::SystemIoEventReceiver, typename std::pointer_traits<decltype(server)>::element_type>::value, "Must implement SystemIoEventReceiver interface!");
    EV_SET(&addedEvents, listenNativeSocket, EVFILT_READ, EV_ADD | EV_ERROR, 0, 0, server.get());
    if (::kevent(ctx->GetKqueueDescriptor(), &addedEvents, 1, nullptr, 0, nullptr) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateAndBindServer -> ::kevent(...) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }
#else
    #error "Unsupported"
#endif

    return server;
}

template<typename TClientSocket>
void IO::Networking::AsyncServerListener<TClientSocket>::OnNewClientToAcceptAvailable()
{
    struct sockaddr_in peerAddress;
    socklen_t client_len = sizeof(peerAddress);
    int nativePeerSocket = ::accept(m_acceptorNativeSocket, (struct sockaddr*)&peerAddress, &client_len);
    if (nativePeerSocket == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] RunEventLoop -> ::accept(...) Error: %s", SystemErrorToCString(errno));
        return;
    }

    IO::Networking::IpAddress peerIpAddress = IO::Networking::Internal::inet_ntop(&(peerAddress.sin_addr));
    uint16_t peerPort = ntohs(peerAddress.sin_port);

    IO::Networking::IpEndpoint peerEndpoint(peerIpAddress, peerPort);
    IO::Networking::SocketDescriptor socketDescriptor{peerEndpoint, nativePeerSocket};

    std::shared_ptr<TClientSocket> client = std::make_shared<TClientSocket>(m_ctx, socketDescriptor);

#if defined(__linux__)
    struct epoll_event event;
    event.events = EPOLLIN | EPOLLOUT | EPOLLERR | EPOLLRDHUP | EPOLLET;
    static_assert(std::is_base_of<IO::SystemIoEventReceiver, typename std::pointer_traits<decltype(client)>::element_type>::value, "Must implement SystemIoEventReceiver interface!");
    event.data.ptr = client.get(); // note static_assert above
    if (::epoll_ctl(m_ctx->GetUnixEpollDescriptor(), EPOLL_CTL_ADD, nativePeerSocket, &event) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] OnNewClientToAcceptAvailable -> ::epoll_ctl(...) Error: %s", SystemErrorToCString(errno));
        return;
    }
#elif defined(__APPLE__)
    struct kevent addedEvents[3];
    static_assert(std::is_base_of<IO::SystemIoEventReceiver, typename std::pointer_traits<decltype(client)>::element_type>::value, "Must implement SystemIoEventReceiver interface!");

    // EVFILT_READ (epoll: EPOLLIN)
    EV_SET(&addedEvents[0], nativePeerSocket, EVFILT_READ, EV_ADD | EV_CLEAR, 0, 0, client.get());

    // EVFILT_WRITE (epoll: EPOLLOUT)
    EV_SET(&addedEvents[1], nativePeerSocket, EVFILT_WRITE, EV_ADD | EV_CLEAR, 0, 0, client.get());

    if (::kevent(m_ctx->GetKqueueDescriptor(), addedEvents, 2, nullptr, 0, nullptr) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] OnNewClientToAcceptAvailable -> setting ::kevent(...) Error: %s", SystemErrorToCString(errno));
        return;
    }
#else
    #error "Unsupported"
#endif

    IO::NetworkError err = IO::Utils::SetFdStatusFlag(nativePeerSocket, O_NONBLOCK);
    if (err)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] OnNewClientToAcceptAvailable -> ::IO::Utils::SetFdStatusFlag(...) Error: %s", err.ToString().c_str());
        return;
    }

    HandlePostAccept(client);
}

template<typename TClientSocket>
void IO::Networking::AsyncServerListener<TClientSocket>::OnIoEvent(uint32_t event)
{
    OnNewClientToAcceptAvailable();
}

#endif //MANGOS_IO_NETWORKING_UNIX_ASYNCSERVERLISTENER_H
