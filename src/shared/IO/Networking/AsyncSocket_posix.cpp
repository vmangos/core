#include "AsyncSocket.h"
#include "IO/SystemErrorToString.h"
#include "Errors.h"
#include "Log.h"

#if defined(__linux__)
#include <sys/epoll.h>
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include <sys/socket.h>
#include <sys/event.h>
#include <unistd.h>
#endif
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <thread>

IO::Networking::AsyncSocket::AsyncSocket(IO::IoContext* ctx, IO::Networking::SocketDescriptor socketDescriptor)
    : m_ctx(ctx), m_descriptor(std::move(socketDescriptor))
{
}

IO::NetworkError IO::Networking::AsyncSocket::InitializeAndFixateMemoryLocation()
{
    int state = m_atomicState.fetch_or(SocketStateFlags::IS_INITIALIZED);
    MANGOS_ASSERT(!(state & SocketStateFlags::IS_INITIALIZED)); // can be only performed once

#if defined(__linux__)
    ::epoll_event event;
    event.events = EPOLLIN | EPOLLOUT | EPOLLERR | EPOLLRDHUP | EPOLLET;
    event.data.ptr = this;
    if (::epoll_ctl(m_ctx->GetUnixEpollDescriptor(), EPOLL_CTL_ADD, m_descriptor.GetNativeSocket(), &event) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "OnNewClientToAcceptAvailable -> ::epoll_ctl(...) Error: %s", SystemErrorToString(errno).c_str());
        return IO::NetworkError(NetworkError::ErrorType::InternalError, errno);
    }
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    struct kevent addedEvents[2];

    // EVFILT_READ (epoll: EPOLLIN)
    EV_SET(&addedEvents[0], m_descriptor.GetNativeSocket(), EVFILT_READ, EV_ADD | EV_CLEAR, 0, 0, this);

    // EVFILT_WRITE (epoll: EPOLLOUT)
    EV_SET(&addedEvents[1], m_descriptor.GetNativeSocket(), EVFILT_WRITE, EV_ADD | EV_CLEAR, 0, 0, this);

    if (::kevent(m_ctx->GetKqueueDescriptor(), addedEvents, 2, nullptr, 0, nullptr) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "AsyncSocket -> ::kevent(...) Error: %s", SystemErrorToString(errno).c_str());
        return IO::NetworkError(NetworkError::ErrorType::InternalError, errno);
    }
#else
    #error "Unsupported"
#endif
    return IO::NetworkError(NetworkError::ErrorType::NoError);
}

void IO::Networking::AsyncSocket::Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&, std::size_t)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::READ_PENDING_SET);
    MANGOS_DEBUG_ASSERT(state & SocketStateFlags::IS_INITIALIZED);

    if (state & SocketStateFlags::READ_PENDING_SET)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed), 0);
        return;
    }

    if (state & SocketStateFlags::SHUTDOWN_PENDING)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
        return;
    }

    if (state & SocketStateFlags::READ_PRESENT)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed), 0);
        return;
    }

    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket::Read(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError), 0); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if there is already something for us buffered in memory
    ssize_t alreadyRead = ::recv(m_descriptor.GetNativeSocket(), target, size, 0);
    if (alreadyRead == 0)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] Read(...) -> ::recv() returned 0, which means the socket is half-closed.", GetRemoteIpString().c_str());
        StopPendingTransactionsAndForceClose();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
        return;
    }
    else if (alreadyRead == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno), 0);
            return;
        }
        alreadyRead = 0; // Would block, so we need to queue it for later
    }
    if (alreadyRead == size)
    { // oh wow, we already have the whole buffer, no need to set up variables
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError), alreadyRead);
        return;
    }

    m_readDstBuffer = target + alreadyRead;
    m_readDstBufferSize = size;
    m_readDstBufferBytesLeft = size - alreadyRead;
    m_readCallback = callback;

    m_atomicState.fetch_xor(SocketStateFlags::READ_PRESENT | SocketStateFlags::READ_PENDING_SET); // set PRESENT and unset PENDING_SET
}

void IO::Networking::AsyncSocket::ReadSome(char* target, std::size_t size, std::function<void(IO::NetworkError const&, std::size_t)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::READ_PENDING_SET);
    MANGOS_DEBUG_ASSERT(state & SocketStateFlags::IS_INITIALIZED);

    if (state & SocketStateFlags::READ_PENDING_SET)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed), 0);
        return;
    }

    if (state & SocketStateFlags::SHUTDOWN_PENDING)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
        return;
    }

    if (state & SocketStateFlags::READ_PRESENT)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed), 0);
        return;
    }

    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket::Read(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError), 0); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if there is already something for us buffered in memory
    ssize_t alreadyRead = ::recv(m_descriptor.GetNativeSocket(), target, size, 0);
    if (alreadyRead == 0)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] Read(...) -> ::recv() returned 0, which means the socket is half-closed.", GetRemoteIpString().c_str());
        StopPendingTransactionsAndForceClose();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
        return;
    }
    else if (alreadyRead == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno), 0);
            return;
        }
        alreadyRead = 0; // Would block, so we need to queue it for later
    }
    if (alreadyRead != 0)
    { // oh wow, we already have "some" buffer, no need to set up variables
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError), alreadyRead);
        return;
    }

    m_readDstBuffer = target + alreadyRead;
    m_readDstBufferSize = 0; // 0 means ReadSome(), only one ::recv call
    m_readDstBufferBytesLeft = size - alreadyRead;
    m_readCallback = callback;

    m_atomicState.fetch_xor(SocketStateFlags::READ_PRESENT | SocketStateFlags::READ_PENDING_SET); // set PRESENT and unset PENDING_SET
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
void IO::Networking::AsyncSocket::Write(IO::ReadableBuffer const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::WRITE_PENDING_SET);
    MANGOS_DEBUG_ASSERT(state & SocketStateFlags::IS_INITIALIZED);

    if (state & SocketStateFlags::WRITE_PENDING_SET)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }

    if (state & SocketStateFlags::SHUTDOWN_PENDING)
    {
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }

    if (state & SocketStateFlags::WRITE_PRESENT)
    {
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }

    if (source.GetSize() == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket::Write(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffer
    ssize_t alreadySent = ::send(m_descriptor.GetNativeSocket(), source.GetPtr(), source.GetSize(), 0);
    if (alreadySent == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
            return;
        }
        alreadySent = 0; // Would block, so we need to queue it for later
    }
    if (alreadySent == source.GetSize())
    { // oh wow, we already sent the whole buffer, no need to set up variables
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrc = source;
    m_writeSrcAlreadyTransferred = alreadySent;
    m_writeCallback = callback;

    m_atomicState.fetch_xor(SocketStateFlags::WRITE_PRESENT | SocketStateFlags::WRITE_PENDING_SET); // set PRESENT and unset PENDING_SET
}

void IO::Networking::AsyncSocket::CloseSocket()
{
    // This function will not actually >close< the socket, since this would release the file descriptor and could cause race conditions,
    // if the same descriptor id is reused by another socket.

    // set SHUTDOWN_PENDING flag, and check if there was already a previous one
    if (m_atomicState.fetch_or(SocketStateFlags::SHUTDOWN_PENDING) & SocketStateFlags::SHUTDOWN_PENDING)
        return; // there was already a ::shutdown()

    sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] CloseSocket(): Disconnect request", GetRemoteIpString().c_str());
    ::shutdown(m_descriptor.GetNativeSocket(), SHUT_RDWR);
}

void IO::Networking::AsyncSocket::PerformNonBlockingRead()
{
    int state = m_atomicState.fetch_or(SocketStateFlags::READ_PENDING_LOAD);
    if (state & SocketStateFlags::READ_PENDING_LOAD)
        return; // Someone else uses it

    if (!(state & SocketStateFlags::READ_PRESENT))
    {
        // there is a really rare race condition
        // since we are using EDGE trigger for ::recv
        // if the buffer is not directly set, but we receive an EPOLL event,
        // we might have to wait for the buffer to be set
        // Otherwise this event is ignored forever
        while ((state = m_atomicState.load()) & SocketStateFlags::READ_PENDING_SET)
            std::this_thread::yield();
    }

    if (!(state & SocketStateFlags::READ_PRESENT))
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
        return; // There is no buffer
    }

    if (state & SocketStateFlags::IGNORE_TRANSFERS)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
        return; // We are not allowed to react to it
    }

    ssize_t newWrittenBytes = ::recv(m_descriptor.GetNativeSocket(), m_readDstBuffer, m_readDstBufferBytesLeft, 0);
    if (newWrittenBytes == 0)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
        sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] ::recv() returned 0, which means the socket is half-closed.", GetRemoteIpString().c_str());
        StopPendingTransactionsAndForceClose();
        return;
    }
    if (newWrittenBytes < 0)
    {
        // If ::recv() failed because the socket is "not ready" we simply use a higher log level
        sLog.Out(LOG_NETWORK, errno == EWOULDBLOCK ? LOG_LVL_BASIC : LOG_LVL_ERROR, "[%s] ::recv on client failed: %s", GetRemoteIpString().c_str(), SystemErrorToString(errno).c_str());
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
        return;
    }

    m_readDstBufferBytesLeft -= newWrittenBytes;
    m_readDstBuffer += newWrittenBytes;

    bool isReadSome = m_readDstBufferSize == 0; // if we have readSome we only want to execute one ::recv() call

    if (m_readDstBufferBytesLeft == 0 || isReadSome)
    { // we are done with this buffer
        m_readDstBuffer = nullptr;

        auto tmpCallback = std::move(m_readCallback);
        m_atomicState.fetch_and(~(SocketStateFlags::READ_PENDING_LOAD | SocketStateFlags::READ_PRESENT));

        std::size_t transferSize = isReadSome ? newWrittenBytes : m_readDstBufferSize;
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError), transferSize);
    }
    else
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
    }
}

void IO::Networking::AsyncSocket::PerformNonBlockingWrite()
{
    int state = m_atomicState.fetch_or(SocketStateFlags::WRITE_PENDING_LOAD);

    if (state & SocketStateFlags::WRITE_PENDING_LOAD)
        return; // Someone else uses it

    if (!(state & SocketStateFlags::WRITE_PRESENT))
    {
        // there is a really rare race condition
        // since we are using EDGE trigger for ::send
        // if the buffer is not directly set, but we receive an EPOLL event,
        // we might have to wait for the buffer to be set
        // Otherwise this event is ignored forever
        while ((state = m_atomicState.load()) & SocketStateFlags::WRITE_PENDING_SET)
            std::this_thread::yield();
    }

    if (!(state & SocketStateFlags::WRITE_PRESENT))
    {
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_LOAD);
        return; // There is no buffer :(
    }

    if (state & SocketStateFlags::IGNORE_TRANSFERS)
    {
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_LOAD);
        return; // We are not allowed to react to it
    }

    ssize_t newSentBytes = ::send(m_descriptor.GetNativeSocket(), (m_writeSrc.GetPtr() + m_writeSrcAlreadyTransferred), (m_writeSrc.GetSize() - m_writeSrcAlreadyTransferred), 0);
    if (newSentBytes == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[Performance] Unnecessary call to PerformNonBlockingWrite()");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_LOAD);
        return;
    }
    if (newSentBytes == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] ::send on client failed: %s", GetRemoteIpString().c_str(), SystemErrorToString(errno).c_str());
        }
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_LOAD);
        return;
    }

    m_writeSrcAlreadyTransferred += newSentBytes;

    if (m_writeSrcAlreadyTransferred == m_writeSrc.GetSize())
    { // we are done with this buffer
        m_writeSrc = nullptr;

        auto tmpCallback = std::move(m_writeCallback);
        m_atomicState.fetch_and(~(SocketStateFlags::WRITE_PENDING_LOAD | SocketStateFlags::WRITE_PRESENT));
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
    }
    else
    {
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_LOAD);
    }
}

void IO::Networking::AsyncSocket::PerformContextSwitch()
{
    int state = m_atomicState.fetch_or(SocketStateFlags::CONTEXT_PENDING_LOAD);

    if (state & SocketStateFlags::CONTEXT_PENDING_LOAD)
        return; // Someone else uses it

    MANGOS_ASSERT(state & SocketStateFlags::CONTEXT_PRESENT); // why was this function even called if we have no context?

    auto tmpCallback = std::move(m_contextCallback);
    m_atomicState.fetch_and(~(SocketStateFlags::CONTEXT_PENDING_LOAD | SocketStateFlags::CONTEXT_PRESENT));

    if (state & SocketStateFlags::SHUTDOWN_PENDING)
    {
        m_atomicState.fetch_and(~SocketStateFlags::CONTEXT_PENDING_LOAD);
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return; // The socket was closed, no transfers are allowed
    }

    MANGOS_DEBUG_ASSERT(tmpCallback);
    tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
}

void IO::Networking::AsyncSocket::StopPendingTransactionsAndForceClose()
{
    CloseSocket(); // this guarantees SHUTDOWN_PENDING to be set

    int state = m_atomicState.fetch_or(SocketStateFlags::IGNORE_TRANSFERS);
    if (state & SocketStateFlags::IGNORE_TRANSFERS)
        return; // maybe another thread also called StopPendingTransactionsAndForceClose

    // we must wait for the other threads to finish
    int const pendingTransferMask = SocketStateFlags::WRITE_PENDING_SET |
                                    SocketStateFlags::WRITE_PENDING_LOAD |
                                    SocketStateFlags::READ_PENDING_SET |
                                    SocketStateFlags::READ_PENDING_LOAD;
    if (state & pendingTransferMask)
    {
        while ((state = m_atomicState.load()) & pendingTransferMask)
            std::this_thread::yield(); // :( atomic::wait() was implemented in C++20
    }

    if (state & SocketStateFlags::WRITE_PRESENT)
    {
        auto tmpWriteCallback = std::move(m_writeCallback);
        m_writeSrc = nullptr;
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PRESENT);
        tmpWriteCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
    }

    if (state & SocketStateFlags::READ_PRESENT)
    {
        auto tmpReadCallback = std::move(m_readCallback);
        m_readDstBuffer = nullptr;
        m_readDstBufferBytesLeft = 0;
        m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
        tmpReadCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
    }

    // Note: Don't even think about clearing CONTEXT_PRESENT here, since it's stored as a raw pointer in `m_contextSwitchQueue`
}

void IO::Networking::AsyncSocket::EnterIoContext(std::function<void(IO::NetworkError)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::CONTEXT_PENDING_SET);
    if (state & SocketStateFlags::CONTEXT_PENDING_SET)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }

    if (state & SocketStateFlags::SHUTDOWN_PENDING)
    {
        m_atomicState.fetch_and(~SocketStateFlags::CONTEXT_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }

    if (state & SocketStateFlags::CONTEXT_PRESENT)
    {
        m_atomicState.fetch_and(~SocketStateFlags::CONTEXT_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }

    m_contextCallback = callback;
    m_atomicState.fetch_xor(SocketStateFlags::CONTEXT_PRESENT | SocketStateFlags::CONTEXT_PENDING_SET); // set PRESENT and unset PENDING_SET

    m_ctx->PostForImmediateInvocation(this);
}

void IO::Networking::AsyncSocket::OnIoEvent(uint32_t event)
{
    int const CALLBACK_EVENT_FLAG =
#if defined(__linux__)
        0;
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
        EVFILT_USER;
#else
    #error "Unsupported"
#endif

    if (m_atomicState.load(std::memory_order_relaxed) & SocketStateFlags::IGNORE_TRANSFERS)
        return; // This is just an initial check, must be atomically checked in the handlers later.

    if (event == CALLBACK_EVENT_FLAG)
    {
        PerformContextSwitch();
        return;
    }

#if defined(__linux__)
    if (event & EPOLLERR)
    {
        int error = 0;
        socklen_t errLen = sizeof(error);
        if (::getsockopt(m_descriptor.GetNativeSocket(), SOL_SOCKET, SO_ERROR, (void*)&error, &errLen) == 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] epoll reported socket error: %s", GetRemoteIpString().c_str(), SystemErrorToString(error).c_str());
        }
        else
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] epoll reported socket error: Internal error", GetRemoteIpString().c_str());
        }
        StopPendingTransactionsAndForceClose();
    }
    else if (event & EPOLLRDHUP)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] EPOLLRDHUP -> Going to disconnect.", GetRemoteIpString().c_str());
        StopPendingTransactionsAndForceClose();
    }
    else
    {
        if (event & EPOLLIN)
            PerformNonBlockingRead();

        if (event & EPOLLOUT)
            PerformNonBlockingWrite();
    }
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    switch ((int)event) // it's a "filter" from kqueue
    {
#if defined(__APPLE__) || defined(__OpenBSD__)
        case EVFILT_EXCEPT:
        {
            int error = 0;
            socklen_t errLen = sizeof(error);
            if (::getsockopt(m_descriptor.GetNativeSocket(), SOL_SOCKET, SO_ERROR, (void*)&error, &errLen) == 0)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] kqueue reported socket exception: Error: %s", GetRemoteIpString().c_str(), SystemErrorToString(error).c_str());

                if (error == 0)
                    break;
            }
            else
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] kqueue reported socket exception: Internal error", GetRemoteIpString().c_str());
            }
            StopPendingTransactionsAndForceClose();
            break;
        }
#endif
        case EVFILT_READ:
        {
            PerformNonBlockingRead();
            break;
        }
        case EVFILT_WRITE:
        {
            PerformNonBlockingWrite();
            break;
        }
        default:
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Unhandled event %d", (int)event);
    }
#else
    #error "Unsupported"
#endif
}

IO::NetworkError IO::Networking::AsyncSocket::SetNativeSocketOption_NoDelay(bool doNoDelay)
{
    if (IsClosing())
        return IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed);

    int optionValue = doNoDelay ? 1 : 0;
    if (::setsockopt(m_descriptor.GetNativeSocket(), IPPROTO_TCP, TCP_NODELAY, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}

IO::NetworkError IO::Networking::AsyncSocket::SetNativeSocketOption_SystemOutgoingSendBuffer(int bytes)
{
    MANGOS_ASSERT(bytes >= 1); // although a buffer of size 1 would already be pretty small...

    if (IsClosing())
        return IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed);

    int optionValue = bytes;
    if (::setsockopt(m_descriptor.GetNativeSocket(), SOL_SOCKET, SO_SNDBUF, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}
