#ifndef MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
#define MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H

#include "IO/SystemErrorToString.h"

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }
    if (m_readCallback != nullptr)
    { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Read(...) with size 0");
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if there is already something for us buffered in memory
    int alreadyRead = ::recv(m_socket._nativeSocket, target, size, 0);
    if (alreadyRead == -1)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
        return;
    }
    if (alreadyRead == size)
    { // oh wow, we already have the whole buffer, no need to set up variables
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_readDstBuffer = target + alreadyRead;
    m_readDstBufferBytesLeft = size - alreadyRead;
    m_readCallback = callback;
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed));
        return;
    }
    if (m_readCallback != nullptr)
    { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
        callback(IO::NetworkError(IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed));
        return;
    }
    std::size_t size = source->size();
    char const* ptr = reinterpret_cast<const char *>(source->data());
    if (size == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "ERROR: Tried to IO::Networking::AsyncSocket<SocketType>::Read(...) with size 0");
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError)); // technically not an error, we are just done with the buffer
        return;
    }

    // Check if we can write into memory buffered
    int alreadySent = ::send(m_socket._nativeSocket, ptr, size, MSG_DONTWAIT);
    if (alreadySent == -1)
    {
        if (errno != EWOULDBLOCK)
        {
            callback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errno));
            return;
        }
        alreadySent = 0; // Would block, so we need to queue it for later
    }
    if (alreadySent == source->size())
    { // oh wow, we already sent the whole buffer, no need to set up variables
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }

    m_writeSrcBuffer = ptr + alreadySent;
    m_writeSrcBufferBytesLeft = size - alreadySent;
    m_writeCallback = callback;
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    throw std::runtime_error("Not implemented: Write");
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<uint8_t const> const& source, uint64_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    throw std::runtime_error("Not implemented: Write");
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
bool IO::Networking::AsyncSocket<SocketType>::HasPendingTransfers() const
{
    return m_writeSrcBuffer || m_readDstBuffer;
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::PerformNonBlockingRead()
{
    if (m_readDstBuffer == nullptr || m_readDstBufferBytesLeft == 0 || m_readCallback == nullptr)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[Error] PerformNonBlockingRead() was called without destination buffer");
        return;
    }

    int newWrittenBytes = ::recv(m_socket._nativeSocket, m_readDstBuffer, m_readDstBufferBytesLeft, 0);
    if (newWrittenBytes == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] Unnecessary call to PerformNonBlockingRead()");
        return;
    }
    if (newWrittenBytes < 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::recv on client failed: %s", SystemErrorToCString(errno));
        return;
    }

    MANGOS_ASSERT(newWrittenBytes <= m_readDstBufferBytesLeft);
    m_readDstBufferBytesLeft -= newWrittenBytes;
    m_readDstBuffer += newWrittenBytes;

    if (m_readDstBufferBytesLeft == 0)
    { // we are done with this buffer
        m_readDstBuffer = nullptr;

        auto tmpCallback = std::move(m_readCallback);
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
    }
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::PerformNonBlockingWrite()
{
    if (m_writeSrcBuffer == nullptr || m_writeSrcBufferBytesLeft == 0 || m_writeCallback == nullptr)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[Error] PerformNonBlockingWrite() was called without destination buffer");
        return;
    }

    int newSentBytes = ::send(m_socket._nativeSocket, m_writeSrcBuffer, m_writeSrcBufferBytesLeft, MSG_DONTWAIT);
    if (newSentBytes == 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] Unnecessary call to PerformNonBlockingWrite()");
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

    MANGOS_ASSERT(newSentBytes <= m_writeSrcBufferBytesLeft);
    m_writeSrcBufferBytesLeft -= newSentBytes;
    m_writeSrcBuffer += newSentBytes;

    if (m_writeSrcBufferBytesLeft == 0)
    { // we are done with this buffer
        m_writeSrcBuffer = nullptr;

        auto tmpCallback = std::move(m_writeCallback);
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
    }
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::StopPendingTransactionsAndForceClose()
{
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
}

#endif //MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
