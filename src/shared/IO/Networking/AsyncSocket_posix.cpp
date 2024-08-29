#include "AsyncSocket.h"
#include "IO/SystemErrorToString.h"
#include "Errors.h"
#include "Log.h"

#if defined(__linux__)
#include <sys/epoll.h>
#elif defined(__APPLE__)
#include <sys/event.h>
#endif
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <thread>

void IO::Networking::AsyncSocket::Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&, std::size_t)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::READ_PENDING_SET);
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
    int alreadyRead = ::recv(m_socket._nativeSocket, target, size, 0);
    if (alreadyRead == 0)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[ERROR] Read(...) -> ::recv() returned 0, which means the socket is half-closed.");
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
        StopPendingTransactionsAndForceClose();
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
    int alreadyRead = ::recv(m_socket._nativeSocket, target, size, 0);
    if (alreadyRead == 0)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[ERROR] Read(...) -> ::recv() returned 0, which means the socket is half-closed.");
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
        StopPendingTransactionsAndForceClose();
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
void IO::Networking::AsyncSocket::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::WRITE_PENDING_SET);
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

    std::size_t size = source->size();
    char const* ptr = reinterpret_cast<char const*>(source->data());
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket::Write(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffer
    int alreadySent = ::send(m_socket._nativeSocket, ptr, size, 0);
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
    if (alreadySent == size)
    { // oh wow, we already sent the whole buffer, no need to set up variables
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrcBufferDummyHolder_u8Vector = source;
    m_writeSrcBuffer = ptr + alreadySent;
    m_writeSrcBufferBytesLeft = size - alreadySent;
    m_writeCallback = callback;

    m_atomicState.fetch_xor(SocketStateFlags::WRITE_PRESENT | SocketStateFlags::WRITE_PENDING_SET); // set PRESENT and unset PENDING_SET
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
void IO::Networking::AsyncSocket::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::WRITE_PENDING_SET);
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

    std::size_t size = source->size();
    char const* ptr = reinterpret_cast<char const*>(source->contents());
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket::Write(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffer
    int alreadySent = ::send(m_socket._nativeSocket, ptr, size, 0);
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
    if (alreadySent == size)
    { // oh wow, we already sent the whole buffer, no need to set up variables
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrcBufferDummyHolder_ByteBuffer = source;
    m_writeSrcBuffer = ptr + alreadySent;
    m_writeSrcBufferBytesLeft = size - alreadySent;
    m_writeCallback = callback;

    m_atomicState.fetch_xor(SocketStateFlags::WRITE_PRESENT | SocketStateFlags::WRITE_PENDING_SET); // set PRESENT and unset PENDING_SET
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
void IO::Networking::AsyncSocket::Write(std::shared_ptr<uint8_t const> const& source, uint64_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::WRITE_PENDING_SET);
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

    char const* ptr = reinterpret_cast<char const*>(source.get());
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket::Write(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffer
    int alreadySent = ::send(m_socket._nativeSocket, ptr, size, 0);
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
    if (alreadySent == size)
    { // oh wow, we already sent the whole buffer, no need to set up variables
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrcBufferDummyHolder_rawArray = source;
    m_writeSrcBuffer = ptr + alreadySent;
    m_writeSrcBufferBytesLeft = size - alreadySent;
    m_writeCallback = callback;

    m_atomicState.fetch_xor(SocketStateFlags::WRITE_PRESENT | SocketStateFlags::WRITE_PENDING_SET); // set PRESENT and unset PENDING_SET
}

void IO::Networking::AsyncSocket::CloseSocket()
{
    // set SHUTDOWN_PENDING flag, and check if there was already a previous one
    if (m_atomicState.fetch_or(SocketStateFlags::SHUTDOWN_PENDING) & SocketStateFlags::SHUTDOWN_PENDING)
        return; // there was already a ::close()

    sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "CloseSocket(): Disconnect request");
    ::close(m_socket._nativeSocket); // will silently remove from this Socket from the epoll set
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

    int newWrittenBytes = ::recv(m_socket._nativeSocket, m_readDstBuffer, m_readDstBufferBytesLeft, 0);
    if (newWrittenBytes == 0)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[ERROR] ::recv() returned 0, which means the socket is half-closed.");
        StopPendingTransactionsAndForceClose();
        return;
    }
    if (newWrittenBytes < 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::recv on client failed: %s", SystemErrorToCString(errno));
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

    int newSentBytes = ::send(m_socket._nativeSocket, m_writeSrcBuffer, m_writeSrcBufferBytesLeft, 0);
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
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::send on client failed: %s", SystemErrorToCString(errno));
        }
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_LOAD);
        return;
    }

    m_writeSrcBufferBytesLeft -= newSentBytes;
    m_writeSrcBuffer += newSentBytes;

    if (m_writeSrcBufferBytesLeft == 0)
    { // we are done with this buffer
        m_writeSrcBuffer = nullptr;
        m_writeSrcBufferDummyHolder_ByteBuffer = nullptr;
        m_writeSrcBufferDummyHolder_u8Vector = nullptr;
        m_writeSrcBufferDummyHolder_rawArray = nullptr;

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

    if (state & SocketStateFlags::IGNORE_TRANSFERS)
    {
        m_atomicState.fetch_and(~SocketStateFlags::CONTEXT_PENDING_LOAD);
        return; // We are not allowed to react to it
    }

    auto tmpCallback = std::move(m_contextCallback);
    m_atomicState.fetch_and(~(SocketStateFlags::CONTEXT_PENDING_LOAD | SocketStateFlags::CONTEXT_PRESENT));

    MANGOS_DEBUG_ASSERT(tmpCallback);
    tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
}

void IO::Networking::AsyncSocket::StopPendingTransactionsAndForceClose()
{
    CloseSocket(); // this guarantees SHUTDOWN_PENDING to be set

    m_atomicState.fetch_or(SocketStateFlags::IGNORE_TRANSFERS);

    int state = m_atomicState.fetch_or(SocketStateFlags::IGNORE_TRANSFERS);

    // we must wait for the other threads to finish
    int const pendingTransferMask = SocketStateFlags::WRITE_PENDING_SET |
                                    SocketStateFlags::WRITE_PENDING_LOAD |
                                    SocketStateFlags::READ_PENDING_SET |
                                    SocketStateFlags::READ_PENDING_LOAD |
                                    SocketStateFlags::CONTEXT_PENDING_SET |
                                    SocketStateFlags::CONTEXT_PENDING_LOAD;
    if (state & pendingTransferMask)
    {
        while ((state = m_atomicState.load()) & pendingTransferMask)
            std::this_thread::yield(); // :( atomic::wait() was implemented in C++20
    }

    if (state & SocketStateFlags::WRITE_PRESENT)
    {
        auto tmpWriteCallback = std::move(m_writeCallback);
        m_writeSrcBuffer = nullptr;
        m_writeSrcBufferDummyHolder_ByteBuffer = nullptr;
        m_writeSrcBufferDummyHolder_u8Vector = nullptr;
        m_writeSrcBufferDummyHolder_rawArray = nullptr;
        m_writeSrcBufferBytesLeft = 0;
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

    if (state & SocketStateFlags::CONTEXT_PRESENT)
    {
        auto tmpContextCallback = std::move(m_contextCallback);
        m_atomicState.fetch_and(~SocketStateFlags::CONTEXT_PRESENT);
        tmpContextCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
    }
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
#elif defined(__APPLE__)
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
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "epoll reported socket error");
        StopPendingTransactionsAndForceClose();
    }
    else if (event & EPOLLRDHUP)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "EPOLLRDHUP -> Going to disconnect.");
        StopPendingTransactionsAndForceClose();
    }
    else
    {
        if (event & EPOLLIN)
            PerformNonBlockingRead();

        if (event & EPOLLOUT)
            PerformNonBlockingWrite();
    }
#elif defined(__APPLE__)
    switch ((int)event) // it's a "filter" from kqueue
    {
        case EVFILT_EXCEPT:
        {
            int error = 0;
            socklen_t errlen = sizeof(error);
            if (::getsockopt(m_socket._nativeSocket, SOL_SOCKET, SO_ERROR, (void*)&error, &errlen) == 0)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "kqueue reported socket exception: Error: %s", SystemErrorToCString(error));

                if (error == 0)
                    break;
            }
            else
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "kqueue reported socket exception: Internal error");
            }
            StopPendingTransactionsAndForceClose();
            break;
        }
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
    MANGOS_ASSERT(!IsClosing());

    int optionValue = doNoDelay ? 1 : 0;
    if (::setsockopt(m_socket._nativeSocket, IPPROTO_TCP, TCP_NODELAY, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}

IO::NetworkError IO::Networking::AsyncSocket::SetNativeSocketOption_SystemOutgoingSendBuffer(int bytes)
{
    MANGOS_ASSERT(!IsClosing());
    MANGOS_ASSERT(bytes > 1); // although a buffer of size 1 is already pretty low...

    int optionValue = bytes;
    if (::setsockopt(m_socket._nativeSocket, SOL_SOCKET, SO_SNDBUF, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}
