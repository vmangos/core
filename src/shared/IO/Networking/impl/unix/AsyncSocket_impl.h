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
        callback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
        return;
    }
    m_readCallback = callback;
    m_readDstBuffer = target;
    m_readDstBufferBytesLeft = size;
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    throw std::runtime_error("Not implemented: Write");
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
    ::close(m_socket._nativeSocket); // will silently remove from this Socket from the epoll set
    throw std::runtime_error("Not implemented: CloseSocket");
}

template<typename SocketType>
bool IO::Networking::AsyncSocket<SocketType>::HasPendingTransfers() const
{
    throw std::runtime_error("Not implemented: HasPendingTransfers");
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::PerformNonBlockingRead() {
    if (m_readDstBuffer == nullptr || m_readDstBufferBytesLeft == 0)
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

#endif //MANGOS_IO_NETWORKING_UNIX_ASYNCSOCKET_IMPL_H
