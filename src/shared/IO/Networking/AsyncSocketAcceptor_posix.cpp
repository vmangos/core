#include "./AsyncSocketAcceptor.h"

#include "IO/Utils_Unix.h"
#include "IO/Context/IoContext.h"
#include "IO/Networking/SocketDescriptor.h"
#include "IO/Networking/IpAddress.h"
#include "IO/Networking/Internal.h"
#include "IO/SystemErrorToString.h"

#include "Log.h"
#include "Errors.h"

#if defined(__linux__) || defined(__APPLE__)
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#endif

#if defined(__linux__)
#include <sys/epoll.h>
#elif defined(__APPLE__)
#include <sys/event.h>
#include <unistd.h>
#endif

#include <vector>
#include <memory>
#include <string>
#include <chrono>

std::unique_ptr<IO::Networking::AsyncSocketAcceptor> IO::Networking::AsyncSocketAcceptor::CreateAndBindServer(IO::IoContext* ctx, std::string const& bindIpStr, uint16_t port)
{
    nonstd::optional<IpAddress> maybeBindIp = IpAddress::TryParseFromString(bindIpStr);
    if (!maybeBindIp.has_value())
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Fail to parse IP '%s'", bindIpStr.c_str());
        return nullptr;
    }

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

    sockaddr_in m_serverAddress{};
    m_serverAddress.sin_family = AF_INET;
    IO::Networking::Internal::inet_pton(maybeBindIp.value(), &(m_serverAddress.sin_addr));
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

    auto server = std::unique_ptr<AsyncSocketAcceptor>(new AsyncSocketAcceptor(ctx, listenNativeSocket));

    // Add server socket to event queue (needed for ::accept(..))
#if defined(__linux__)
    ::epoll_event event;
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
    struct ::kevent addedEvents{};
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

IO::Networking::AsyncSocketAcceptor::~AsyncSocketAcceptor()
{
    MANGOS_ASSERT(m_wasClosed);
}

void IO::Networking::AsyncSocketAcceptor::ClosePortAndStopAcceptingNewConnections()
{
    m_wasClosed = true;

    ::close(m_acceptorNativeSocket);
}

void IO::Networking::AsyncSocketAcceptor::AutoAcceptSocketsUntilClose(std::function<void(IO::Networking::SocketDescriptor)> const& onNewSocket)
{
    m_onNewSocketCallback = onNewSocket;
}

void IO::Networking::AsyncSocketAcceptor::OnNewClientToAcceptAvailable()
{
    if (m_onNewSocketCallback == nullptr)
        return; // ignore, do not ::accept() yet

    ::sockaddr_in peerAddress;
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
    IO::Networking::SocketDescriptor socketDescriptor{nativePeerSocket, peerEndpoint};

    IO::NetworkError err = IO::Utils::SetFdStatusFlag(nativePeerSocket, O_NONBLOCK);
    if (err)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] OnNewClientToAcceptAvailable -> ::IO::Utils::SetFdStatusFlag(...) Error: %s", err.ToString().c_str());
        return;
    }

    m_onNewSocketCallback(std::move(socketDescriptor));
}

void IO::Networking::AsyncSocketAcceptor::OnIoEvent(uint32_t event)
{
    // The only event we can receive is ::accept()
    OnNewClientToAcceptAvailable();
}
