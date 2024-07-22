#ifndef MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
#define MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H

#include <sys/epoll.h>
#include <netinet/tcp.h>
#include "IO/SystemErrorToString.h"

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }

    if (m_readCallbackPresent.test_and_set())
    { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Read(...) with size 0");
        m_readCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if there is already something for us buffered in memory
    int alreadyRead = ::recv(m_socket._nativeSocket, target, size, 0);
    if (alreadyRead == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_readCallbackPresent.clear();
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
            return;
        }
        alreadyRead = 0; // Would block, so we need to queue it for later
    }
    if (alreadyRead == size)
    { // oh wow, we already have the whole buffer, no need to set up variables
        m_readCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_readDstBuffer = target + alreadyRead;
    m_readDstBufferBytesLeft = size - alreadyRead;
    m_readCallback = callback;
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }

    if (m_writeCallbackPresent.test_and_set())
    { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }
    std::size_t size = source->size();
    char const* ptr = reinterpret_cast<char const*>(source->data());
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Write(...) with size 0");
        m_writeCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffered
    int alreadySent = ::send(m_socket._nativeSocket, ptr, size, 0);
    if (alreadySent == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_writeCallbackPresent.clear();
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
            return;
        }
        alreadySent = 0; // Would block, so we need to queue it for later
    }
    if (alreadySent == size)
    { // oh wow, we already sent the whole buffer, no need to set up variables
        m_writeCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrcBufferDummyHolder_u8Vector = source;
    m_writeSrcBuffer = ptr + alreadySent;
    m_writeSrcBufferBytesLeft = size - alreadySent;
    m_writeCallback = callback;
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }

    if (m_writeCallbackPresent.test_and_set())
    { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }
    std::size_t size = source->size();
    char const* ptr = reinterpret_cast<char const*>(source->contents());
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Write(...) with size 0");
        m_writeCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffered
    int alreadySent = ::send(m_socket._nativeSocket, ptr, size, 0);
    if (alreadySent == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_writeCallbackPresent.clear();
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
            return;
        }
        alreadySent = 0; // Would block, so we need to queue it for later
    }
    if (alreadySent == size)
    { // oh wow, we already sent the whole buffer, no need to set up variables
        m_writeCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrcBufferDummyHolder_ByteBuffer = source;
    m_writeSrcBuffer = ptr + alreadySent;
    m_writeSrcBufferBytesLeft = size - alreadySent;
    m_writeCallback = callback;
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<uint8_t const> const& source, uint64_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }

    if (m_writeCallbackPresent.test_and_set())
    { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }

    char const* ptr = reinterpret_cast<char const*>(source.get());
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Read(...) with size 0");
        m_writeCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffered
    int alreadySent = ::send(m_socket._nativeSocket, ptr, size, 0);
    if (alreadySent == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            m_writeCallbackPresent.clear();
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
            return;
        }
        alreadySent = 0; // Would block, so we need to queue it for later
    }
    if (alreadySent == size)
    { // oh wow, we already sent the whole buffer, no need to set up variables
        m_writeCallbackPresent.clear();
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrcBufferDummyHolder_rawArray = source;
    m_writeSrcBuffer = ptr + alreadySent;
    m_writeSrcBufferBytesLeft = size - alreadySent;
    m_writeCallback = callback;
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::CloseSocket()
{
    if (m_disconnectRequest)
        return;
    m_disconnectRequest = true;

    sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "CloseSocket(): Disconnect request");
    ::close(m_socket._nativeSocket); // will silently remove from this Socket from the epoll set
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::PerformNonBlockingRead()
{
    if (m_readDstBuffer == nullptr || m_readDstBufferBytesLeft == 0 || m_readCallback == nullptr)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[Performance] PerformNonBlockingRead() was called without destination buffer");
        return;
    }

    int newWrittenBytes = ::recv(m_socket._nativeSocket, m_readDstBuffer, m_readDstBufferBytesLeft, 0);
    if (newWrittenBytes == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[Performance] Unnecessary call to PerformNonBlockingRead()");
        return;
    }
    if (newWrittenBytes < 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::recv on client failed: %s", SystemErrorToCString(errno));
        return;
    }

    m_readDstBufferBytesLeft -= newWrittenBytes;
    m_readDstBuffer += newWrittenBytes;

    if (m_readDstBufferBytesLeft == 0)
    { // we are done with this buffer
        m_readDstBuffer = nullptr;

        auto tmpCallback = std::move(m_readCallback);
        m_readCallbackPresent.clear();
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
    }
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::PerformNonBlockingWrite()
{
    if (m_writeSrcBuffer == nullptr || m_writeSrcBufferBytesLeft == 0 || m_writeCallback == nullptr)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[Performance] PerformNonBlockingWrite() was called without destination buffer");
        return;
    }

    int newSentBytes = ::send(m_socket._nativeSocket, m_writeSrcBuffer, m_writeSrcBufferBytesLeft, 0);
    if (newSentBytes == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[Performance] Unnecessary call to PerformNonBlockingWrite()");
        return;
    }
    if (newSentBytes == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::send on client failed: %s", SystemErrorToCString(errno));
        }
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
        m_writeCallbackPresent.clear();
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
    }
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::StopPendingTransactionsAndForceClose()
{
    // We cannot abort a pending context switch, since it's randomly writing our pointer to the pipe

    auto tmpReadCallback = std::move(m_readCallback);
    auto tmpWriteCallback = std::move(m_writeCallback);
    m_writeSrcBufferBytesLeft = 0;
    m_readDstBufferBytesLeft = 0;
    m_writeSrcBuffer = nullptr;
    m_readDstBuffer = nullptr;
    if (tmpReadCallback)
        tmpReadCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
    if (tmpWriteCallback)
        tmpWriteCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
    CloseSocket();

    m_readCallbackPresent.clear();
    m_writeCallbackPresent.clear();
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::EnterIoContext(std::function<void(IO::NetworkError)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }
    if (m_contextCallbackPresent.test_and_set())
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }
    m_contextCallback = std::move(callback);
    m_ctx->PostEpollEventForImmediateExecution(this);
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::OnEpollEvent(uint32_t epollEvents)
{
    if (epollEvents == 0)
    {
        auto tmpCallback = std::move(m_contextCallback);
        m_contextCallbackPresent.clear();
        MANGOS_DEBUG_ASSERT(tmpCallback);
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

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
    int optionValue = doNoDelay ? 1 : 0;
    if (::setsockopt(m_socket._nativeSocket, IPPROTO_TCP, TCP_NODELAY, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}

template<typename SocketType>
IO::NetworkError IO::Networking::AsyncSocket<SocketType>::SetNativeSocketOption_SystemOutgoingSendBuffer(int bytes)
{
    MANGOS_ASSERT(bytes > 1); // although 1 is already pretty low...

    int optionValue = bytes;
    if (::setsockopt(m_socket._nativeSocket, SOL_SOCKET, SO_SNDBUF, (char*) &optionValue, sizeof(optionValue)) != 0)
        return IO::NetworkError::FromSystemError(errno);

    return IO::NetworkError(IO::NetworkError::ErrorType::NoError);
}

#endif //MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
