#ifndef MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
#define MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H

#include <sys/epoll.h>
#include <netinet/tcp.h>
#include <thread>
#include "IO/SystemErrorToString.h"

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::READ_PENDING_SET);
    if (state & SocketStateFlags::READ_PENDING_SET)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }

    if (state & SocketStateFlags::SHUTDOWN_PENDING)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }

    if (state & SocketStateFlags::READ_PRESENT)
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }

    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Read(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if there is already something for us buffered in memory
    int alreadyRead = ::recv(m_socket._nativeSocket, target, size, 0);
    if (alreadyRead == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
            return;
        }
        alreadyRead = 0; // Would block, so we need to queue it for later
    }
    if (alreadyRead == size)
    { // oh wow, we already have the whole buffer, no need to set up variables
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_readDstBuffer = target + alreadyRead;
    m_readDstBufferBytesLeft = size - alreadyRead;
    m_readCallback = callback;

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "READ BUFFER SET");
    m_atomicState.fetch_xor(SocketStateFlags::READ_PRESENT | SocketStateFlags::READ_PENDING_SET); // set PRESENT and unset PENDING_SET
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
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
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Write(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffered
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
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
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
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Write(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffered
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
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<uint8_t const> const& source, uint64_t size, std::function<void(IO::NetworkError const&)> const& callback)
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
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Read(...) with size 0");
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PENDING_SET);
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffered
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

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::CloseSocket()
{
    // set SHUTDOWN_PENDING flag, and check if there was already a previous one
    if (m_atomicState.fetch_or(SocketStateFlags::SHUTDOWN_PENDING) & SocketStateFlags::SHUTDOWN_PENDING)
        return; // there was already a ::close()

    sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "CloseSocket(): Disconnect request");
    ::close(m_socket._nativeSocket); // will silently remove from this Socket from the epoll set
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::PerformNonBlockingRead()
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
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[Performance] Unnecessary call to PerformNonBlockingRead()");
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
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

    if (m_readDstBufferBytesLeft == 0)
    { // we are done with this buffer
        m_readDstBuffer = nullptr;

        auto tmpCallback = std::move(m_readCallback);
        m_atomicState.fetch_and(~(SocketStateFlags::READ_PENDING_LOAD | SocketStateFlags::READ_PRESENT));
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
    }
    else
    {
        m_atomicState.fetch_and(~SocketStateFlags::READ_PENDING_LOAD);
    }
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::PerformNonBlockingWrite()
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

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::StopPendingTransactionsAndForceClose()
{
    CloseSocket(); // this guarantees SHUTDOWN_PENDING to be set

    m_atomicState.fetch_or(SocketStateFlags::IGNORE_TRANSFERS);

    int state = m_atomicState.fetch_or(SocketStateFlags::IGNORE_TRANSFERS);

    // we must wait for the other threads to finish
    int const pendingTransferMask = SocketStateFlags::WRITE_PENDING_SET | SocketStateFlags::WRITE_PENDING_LOAD | SocketStateFlags::READ_PENDING_LOAD | SocketStateFlags::READ_PENDING_LOAD;
    while ((state = m_atomicState.load()) & pendingTransferMask)
        std::this_thread::yield(); // :( atomic::wait() was implemented in C++20

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
        tmpReadCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
    }

    // btw. we cannot abort a pending context switch, since it's randomly writing our pointer to the scheduler queue // TODO: This is not true anymore, just make a load() where epollevents == 0
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::EnterIoContext(std::function<void(IO::NetworkError)> const& callback)
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

    m_contextCallback = std::move(callback);
    m_atomicState.fetch_xor(SocketStateFlags::CONTEXT_PRESENT | SocketStateFlags::CONTEXT_PENDING_SET); // set PRESENT and unset PENDING_SET

    m_ctx->PostEpollEventForImmediateExecution(this);
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::OnEpollEvent(uint32_t epollEvents)
{
    if (epollEvents == 0)
    {
        auto tmpCallback = std::move(m_contextCallback);
        MANGOS_DEBUG_ASSERT(tmpCallback);
        m_atomicState.fetch_and(~SocketStateFlags::CONTEXT_PRESENT);
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    if (m_atomicState.load(std::memory_order_relaxed) & SocketStateFlags::IGNORE_TRANSFERS)
        return; // This is just an initial check. Must be check in `PerformNonBlockingRead` and `PerformNonBlockingWrite` while setting PENDING_LOAD

    if (epollEvents & EPOLLERR)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Epoll ERR");
        StopPendingTransactionsAndForceClose();
    }
    else if (epollEvents & EPOLLRDHUP)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "EPOLLRDHUP -> Going to disconnect.");
        StopPendingTransactionsAndForceClose();
    }
    else
    {
        if (epollEvents & EPOLLIN)
            PerformNonBlockingRead();

        if (epollEvents & EPOLLOUT)
            PerformNonBlockingWrite();
    }
}

template<typename SocketType>
IO::NetworkError IO::Networking::AsyncSocket<SocketType>::SetNativeSocketOption_NoDelay(bool doNoDelay)
{
    MANGOS_ASSERT(!IsClosing());

    int optionValue = doNoDelay ? 1 : 0;
    if (::setsockopt(m_socket._nativeSocket, IPPROTO_TCP, TCP_NODELAY, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}

template<typename SocketType>
IO::NetworkError IO::Networking::AsyncSocket<SocketType>::SetNativeSocketOption_SystemOutgoingSendBuffer(int bytes)
{
    MANGOS_ASSERT(!IsClosing());
    MANGOS_ASSERT(bytes > 1); // although 1 is already pretty low...

    int optionValue = bytes;
    if (::setsockopt(m_socket._nativeSocket, SOL_SOCKET, SO_SNDBUF, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}

#endif //MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
