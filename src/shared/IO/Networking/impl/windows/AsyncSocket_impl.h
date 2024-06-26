#ifndef MANGOS_IO_NETWORKING_WIN32_ASYNCSOCKET_IMPL_H
#define MANGOS_IO_NETWORKING_WIN32_ASYNCSOCKET_IMPL_H

template<typename SocketType>
void AsyncSocket<SocketType>::Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (m_disconnectRequest)
    {
        callback(IO::NetworkError{IO::NetworkError::ErrorType::SocketClosed});
        return;
    }
    if (m_readCallback != nullptr)
    { // We already have a buffer. Just like ASIO, only one Read can be queued at the same time
        callback(IO::NetworkError{IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
        return;
    }
    m_readCallback = callback;

    int const bufferCount = 1;
    struct BufferCtx
    {
        WSABUF buffers[bufferCount];
    };

    std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
    bufferCtx->buffers[0].len = size;
    bufferCtx->buffers[0].buf = target;

    m_currentReadTask.InitNew([self = this->shared_from_this(), bufferCtx](DWORD errorCode) {
        uint64_t bytesProcessed = self->m_currentReadTask.InternalHigh;
        if (bytesProcessed == 0)
        { // 0 means the socket is already closed on the other side
            sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "Empty response -> Going to disconnect.");
            self->CloseSocket();
            auto tmpCallback = std::move(self->m_readCallback);
            self->m_currentReadTask.Reset();
            tmpCallback(IO::NetworkError{IO::NetworkError::ErrorType::SocketClosed});
            return;
        }

        if (bytesProcessed < bufferCtx->buffers[0].len)
        { // We are not done yet. We need to requeue our task
            bufferCtx->buffers[0].buf += bytesProcessed;
            bufferCtx->buffers[0].len -= bytesProcessed;

            int const bufferCount = 1;
            DWORD flags = 0;
            int errorCode = ::WSARecv(self->m_socket._nativeSocket, bufferCtx->buffers, bufferCount, nullptr, &flags, &(self->m_currentReadTask), nullptr);
            if (errorCode)
            {
                int err = WSAGetLastError();
                if (err != WSA_IO_PENDING)
                {
                    sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSARecv(...) Error: %u", err);
                    auto tmpCallback = std::move(self->m_readCallback);
                    self->m_currentReadTask.Reset();
                    tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err));
                    return;
                }
            }
        }
        else
        {
            auto tmpCallback = std::move(self->m_readCallback);
            self->m_currentReadTask.Reset();
            tmpCallback(IO::NetworkError{IO::NetworkError::ErrorType::NoError});
        }
    });

    DWORD flags = 0;
    int errorCode = ::WSARecv(m_socket._nativeSocket, bufferCtx->buffers, bufferCount, nullptr, &flags, &m_currentReadTask, nullptr);
    if (errorCode)
    {
        int err = WSAGetLastError();
        if (err != WSA_IO_PENDING)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSARecv(...) Error: %u", err);
            auto tmpCallback = std::move(this->m_readCallback);
            m_currentReadTask.Reset();
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err));
            return;
        }
    }
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void AsyncSocket<SocketType>::Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (source->size() > 8*1024*1024)
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[NETWORK] You are about to send a very large message (%llu bytes). The Windows Kernel will happily accept that. Split the Write(...) calls next time!", source->size());

    if (m_disconnectRequest)
    {
        callback(IO::NetworkError{IO::NetworkError::ErrorType::SocketClosed});
        return;
    }
    if (m_writeCallback != nullptr)
    { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
        callback(IO::NetworkError{IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
        return;
    }
    m_writeCallback = callback;
    m_writeSrcBufferDummyHolder_u8Vector = source;

    int const bufferCount = 1;
    struct BufferCtx
    {
        WSABUF buffers[bufferCount];
    };

    std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
    bufferCtx->buffers[0].len = source->size();
    bufferCtx->buffers[0].buf = (char*)(source->data());

    m_currentWriteTask.InitNew([self = this->shared_from_this(), bufferCtx](IocpOperationTask* task, DWORD errorCode) {
        uint64_t bytesProcessed = task->InternalHigh;

        IO::NetworkError errorResult(IO::NetworkError::ErrorType::InternalError, errorCode);

        if (bytesProcessed == 0)
        { // 0 means the socket is already closed on the other side
            self->CloseSocket();
            errorResult = IO::NetworkError{IO::NetworkError::ErrorType::SocketClosed};
        }
        else if (bytesProcessed < bufferCtx->buffers[0].len || errorCode != 0)
        {
            self->CloseSocket();
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errorCode);
        }
        else
        {
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::NoError);
        }

        auto tmpCallback = std::move(self->m_writeCallback);
        self->m_writeSrcBufferDummyHolder_u8Vector = nullptr;
        m_currentWriteTask.Reset();
        tmpCallback(errorResult);
    });

    DWORD flags = 0;
    int errorCode = ::WSASend(m_socket._nativeSocket, bufferCtx->buffers, bufferCount, nullptr, flags, &m_currentWriteTask, nullptr);
    if (errorCode)
    {
        int err = WSAGetLastError();
        if (err != WSA_IO_PENDING)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSASend(...) Error: %u", err);
            auto tmpCallback = std::move(this->m_writeCallback);
            this->m_writeSrcBufferDummyHolder_u8Vector = nullptr;
            m_currentWriteTask.Reset();
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err));
            return;
        }
    }
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void AsyncSocket<SocketType>::Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (source->size() > 8*1024*1024)
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[NETWORK] You are about to send a very large message (%llu bytes). The Windows Kernel will happily accept that. Split the Write(...) calls next time!", source->size());

    if (m_disconnectRequest)
    {
        callback(IO::NetworkError{IO::NetworkError::ErrorType::SocketClosed});
        return;
    }
    if (m_writeCallback != nullptr)
    { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
        callback(IO::NetworkError{IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
        return;
    }
    m_writeCallback = callback;
    m_writeSrcBufferDummyHolder_ByteBuffer = source;

    int const bufferCount = 1;
    struct BufferCtx
    {
        WSABUF buffers[bufferCount];
    };

    std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
    bufferCtx->buffers[0].len = source->size();
    bufferCtx->buffers[0].buf = (char*)(source->contents());

    m_currentWriteTask.InitNew([self = this->shared_from_this(), bufferCtx](DWORD errorCode) {
        uint64_t bytesProcessed = self->m_currentWriteTask.InternalHigh;

        IO::NetworkError errorResult(IO::NetworkError::ErrorType::InternalError, errorCode);

        if (bytesProcessed == 0)
        { // 0 means the socket is already closed on the other side
            self->CloseSocket();
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed);
        }
        else if (bytesProcessed < bufferCtx->buffers[0].len || errorCode != 0)
        {
            self->CloseSocket();
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errorCode);
        }
        else
        {
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::NoError);
        }

        auto tmpCallback = std::move(self->m_writeCallback);
        self->m_writeSrcBufferDummyHolder_ByteBuffer = nullptr;
        self->m_currentWriteTask.Reset();
        tmpCallback(errorResult);
    });

    DWORD flags = 0;
    int errorCode = ::WSASend(m_socket._nativeSocket, bufferCtx->buffers, bufferCount, nullptr, flags, &m_currentWriteTask, nullptr);
    if (errorCode)
    {
        int err = WSAGetLastError();
        if (err != WSA_IO_PENDING)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSASend(...) Error: %u", err);
            auto tmpCallback = std::move(this->m_writeCallback);
            this->m_writeSrcBufferDummyHolder_ByteBuffer = nullptr;
            m_currentWriteTask.Reset();
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err));
            return;
        }
    }
}

/// Warning using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
template<typename SocketType>
void AsyncSocket<SocketType>::Write(std::shared_ptr<uint8_t const> const& source, uint64_t size, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (size > 8*1024*1024)
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[NETWORK] You are about to send a very large message (%llu bytes). The Windows Kernel will happily accept that. Split the Write(...) calls next time!", size);

    if (m_disconnectRequest)
    {
        callback(IO::NetworkError{IO::NetworkError::ErrorType::SocketClosed});
        return;
    }
    if (m_writeCallback != nullptr)
    { // We already have a buffer. Just like ASIO, only one Write can be queued at the same time
        callback(IO::NetworkError{IO::NetworkError::ErrorType::OnlyOneTransferPerDirectionAllowed});
        return;
    }
    m_writeCallback = callback;
    m_writeSrcBufferDummyHolder_rawArray = source;

    int const bufferCount = 1;
    struct BufferCtx
    {
        WSABUF buffers[bufferCount];
    };

    std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
    bufferCtx->buffers[0].len = size;
    bufferCtx->buffers[0].buf = (char*)source.get();

    m_currentWriteTask.InitNew([self = this->shared_from_this(), bufferCtx](DWORD errorCode) {
        uint64_t bytesProcessed = self->m_currentWriteTask.InternalHigh;

        IO::NetworkError errorResult(IO::NetworkError::ErrorType::InternalError, errorCode);

        if (bytesProcessed == 0)
        { // 0 means the socket is already closed on the other side
            self->CloseSocket();
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed);
        }
        else if (bytesProcessed < bufferCtx->buffers[0].len || errorCode != 0)
        {
            self->CloseSocket();
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errorCode);
        }
        else
        {
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::NoError);
        }

        auto tmpCallback = std::move(self->m_writeCallback);
        self->m_writeSrcBufferDummyHolder_rawArray = nullptr;
        self->m_currentWriteTask.Reset();
        tmpCallback(errorResult);
    });

    DWORD flags = 0;
    int errorCode = ::WSASend(m_socket._nativeSocket, bufferCtx->buffers, bufferCount, nullptr, flags, &m_currentWriteTask, nullptr);
    if (errorCode)
    {
        int err = WSAGetLastError();
        if (err != WSA_IO_PENDING)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::WSASend(...) Error: %u", err);
            auto tmpCallback = std::move(this->m_writeCallback);
            m_currentWriteTask.Reset();
            this->m_writeSrcBufferDummyHolder_rawArray = nullptr;
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err));
            return;
        }
    }
}

template<typename SocketType>
void AsyncSocket<SocketType>::CloseSocket()
{
    if (m_disconnectRequest)
        return;
    m_disconnectRequest = true;

    sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "CloseSocket(): Disconnect request");
    ::closesocket(m_socket._nativeSocket);
}

template<typename SocketType>
bool AsyncSocket<SocketType>::HasPendingTransfers() const
{
    return m_currentWriteTask.m_callback || m_currentReadTask.m_callback;
}

#endif //MANGOS_IO_NETWORKING_WIN32_ASYNCSOCKET_IMPL_H
