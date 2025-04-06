#include "AsyncSocket.h"
#include "Log.h"

IO::NetworkError IO::Networking::AsyncSocket::InitializeAndFixateMemoryLocation()
{
    int state = m_atomicState.fetch_or(SocketStateFlags::IS_INITIALIZED);
    MANGOS_ASSERT(!(state & SocketStateFlags::IS_INITIALIZED)); // can be only performed once

    // There is nothing to do on windows (using IOCP), since we are referencing this socket for each transfer individually

    return IO::NetworkError(NetworkError::ErrorType::NoError);
}

IO::NetworkError IO::Networking::AsyncSocket::SetNativeSocketOption_NoDelay(bool doNoDelay)
{
    int optionValue = doNoDelay ? 1 : 0;
    int result = ::setsockopt(m_descriptor.GetNativeSocket(), IPPROTO_TCP, TCP_NODELAY, (char*)&optionValue, sizeof(optionValue));
    if (result != 0)
        return IO::NetworkError(NetworkError::ErrorType::InternalError, ::WSAGetLastError());
    return IO::NetworkError(NetworkError::ErrorType::NoError);
}

IO::NetworkError IO::Networking::AsyncSocket::SetNativeSocketOption_SystemOutgoingSendBuffer(int bytes)
{
    int optionValue = bytes;
    int result = ::setsockopt(m_descriptor.GetNativeSocket(), SOL_SOCKET, SO_SNDBUF, (char*)&optionValue, sizeof(optionValue));
    if (result != 0)
        return IO::NetworkError(NetworkError::ErrorType::InternalError, ::WSAGetLastError());
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

    m_readCallback = callback;

    int const bufferCount = 1;
    struct BufferCtx
    {
        WSABUF buffers[bufferCount];
    };

    std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
    bufferCtx->buffers[0].len = size;
    bufferCtx->buffers[0].buf = target;

    m_currentReadTask.InitNew([this, bufferCtx, size](DWORD errorCode) {
        uint64_t bytesProcessed = m_currentReadTask.InternalHigh;
        if (bytesProcessed == 0)
        { // 0 means the socket is already closed on the other side
            sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] Empty response -> Going to disconnect.", GetRemoteIpString().c_str());
            CloseSocket();
            auto tmpCallback = std::move(m_readCallback);
            m_currentReadTask.Reset();
            m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
            return;
        }

        if (bytesProcessed < bufferCtx->buffers[0].len)
        { // We are not done yet. We need to requeue our task
            bufferCtx->buffers[0].buf += bytesProcessed;
            bufferCtx->buffers[0].len -= bytesProcessed;

            int const bufferCount = 1;
            DWORD flags = 0;
            int errorCode = ::WSARecv(m_descriptor.GetNativeSocket(), bufferCtx->buffers, bufferCount, nullptr, &flags, &(m_currentReadTask), nullptr);
            if (errorCode)
            {
                int err = ::WSAGetLastError();
                if (err != WSA_IO_PENDING) // Pending means that this task was queued (which is what we want)
                {
                    sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::WSARecv(...) Error: %u", err);
                    auto tmpCallback = std::move(m_readCallback);
                    m_currentReadTask.Reset();
                    m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
                    tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err), 0);
                    return;
                }
            }
        }
        else
        {
            auto tmpCallback = std::move(m_readCallback);
            m_currentReadTask.Reset();
            m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError), size);
        }
    });

    DWORD flags = 0;
    m_atomicState.fetch_xor(SocketStateFlags::READ_PRESENT | SocketStateFlags::READ_PENDING_SET); // set PRESENT and unset PENDING_SET
    int errorCode = ::WSARecv(m_descriptor.GetNativeSocket(), bufferCtx->buffers, bufferCount, nullptr, &flags, &m_currentReadTask, nullptr);
    if (errorCode)
    {
        int err = ::WSAGetLastError();
        if (err != WSA_IO_PENDING) // Pending means that this task was queued (which is what we want)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::WSARecv(...) Error: %u", err);
            auto tmpCallback = std::move(m_readCallback);
            m_currentReadTask.Reset();
            m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err), 0);
            return;
        }
    }
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

    m_readCallback = callback;

    int const bufferCount = 1;
    struct BufferCtx
    {
        WSABUF buffers[bufferCount];
    };

    std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
    bufferCtx->buffers[0].len = size;
    bufferCtx->buffers[0].buf = target;

    m_currentReadTask.InitNew([this, bufferCtx](DWORD errorCode) {
        uint64_t bytesProcessed = m_currentReadTask.InternalHigh;
        if (bytesProcessed == 0)
        { // 0 means the socket is already closed on the other side
            sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] Empty response -> Going to disconnect.", GetRemoteIpString().c_str());
            CloseSocket();
            auto tmpCallback = std::move(m_readCallback);
            m_currentReadTask.Reset();
            m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed), 0);
            return;
        }

        auto tmpCallback = std::move(m_readCallback);
        m_currentReadTask.Reset();
        m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError), bytesProcessed);
    });

    DWORD flags = 0;
    m_atomicState.fetch_xor(SocketStateFlags::READ_PRESENT | SocketStateFlags::READ_PENDING_SET); // set PRESENT and unset PENDING_SET
    int errorCode = ::WSARecv(m_descriptor.GetNativeSocket(), bufferCtx->buffers, bufferCount, nullptr, &flags, &m_currentReadTask, nullptr);
    if (errorCode)
    {
        int err = ::WSAGetLastError();
        if (err != WSA_IO_PENDING) // Pending means that this task was queued (which is what we want)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::WSARecv(...) Error: %u", err);
            auto tmpCallback = std::move(m_readCallback);
            m_currentReadTask.Reset();
            m_atomicState.fetch_and(~SocketStateFlags::READ_PRESENT);
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err), 0);
            return;
        }
    }
}

/// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered!
/// (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
void IO::Networking::AsyncSocket::Write(IO::ReadableBuffer const& source, std::function<void(IO::NetworkError const&)> const& callback)
{
    if (source.GetSize() > 8*1024*1024)
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[NETWORK] You are about to send a very large message (%llu bytes). The Windows Kernel will happily accept that. Split the Write(...) calls next time!", source.GetSize());

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

    m_writeCallback = callback;
    m_writeSrc = source;

    int const bufferCount = 1;
    struct BufferCtx
    {
        WSABUF buffers[bufferCount];
    };

    std::shared_ptr<BufferCtx> bufferCtx(new BufferCtx{0});
    bufferCtx->buffers[0].len = m_writeSrc.GetSize();
    bufferCtx->buffers[0].buf = (char*)(m_writeSrc.GetPtr());

    m_currentWriteTask.InitNew([this, bufferCtx](DWORD errorCode) {
        uint64_t bytesProcessed = m_currentWriteTask.InternalHigh;

        IO::NetworkError errorResult(IO::NetworkError::ErrorType::InternalError, errorCode);

        if (bytesProcessed == 0)
        { // 0 means the socket is already closed on the other side
            CloseSocket();
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::SocketClosed);
        }
        else if (bytesProcessed < bufferCtx->buffers[0].len || errorCode != 0)
        { // Compared to Read(...), the Write(...) system call should be able to transfer the whole buffer in one
            CloseSocket();
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::InternalError, errorCode);
        }
        else
        {
            errorResult = IO::NetworkError(IO::NetworkError::ErrorType::NoError);
        }

        auto tmpCallback = std::move(m_writeCallback);
        m_writeSrc = nullptr;
        m_currentWriteTask.Reset();
        m_atomicState.fetch_and(~SocketStateFlags::WRITE_PRESENT);
        tmpCallback(errorResult);
    });

    DWORD flags = 0;
    m_atomicState.fetch_xor(SocketStateFlags::WRITE_PRESENT | SocketStateFlags::WRITE_PENDING_SET); // set PRESENT and unset PENDING_SET
    int errorCode = ::WSASend(m_descriptor.GetNativeSocket(), bufferCtx->buffers, bufferCount, nullptr, flags, &m_currentWriteTask, nullptr);
    if (errorCode)
    {
        int err = ::WSAGetLastError();
        if (err != WSA_IO_PENDING) // Pending means that this task was queued (which is what we want)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::WSASend(...) Error: %u", err);
            auto tmpCallback = std::move(m_writeCallback);
            m_writeSrc = nullptr;
            m_currentWriteTask.Reset();
            m_atomicState.fetch_and(~SocketStateFlags::WRITE_PRESENT);
            tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::InternalError, err));
            return;
        }
    }
}

void IO::Networking::AsyncSocket::CloseSocket()
{
    // set SHUTDOWN_PENDING flag, and check if there was already a previous one
    if (m_atomicState.fetch_or(SocketStateFlags::SHUTDOWN_PENDING) & SocketStateFlags::SHUTDOWN_PENDING)
        return; // there was already a ::shutdown()

    // shutdown the native socket to prevent new operations
    ::shutdown(m_descriptor.GetNativeSocket(), SD_BOTH);
    // interrupt and fail all pending IOCP events and post them to the completion queue
    ::CancelIoEx(reinterpret_cast<HANDLE>(m_descriptor.GetNativeSocket()), nullptr);
}

/// The callback is invoked in the IO thread
/// Useful for computational expensive operations (e.g. packing and encryption), that should be avoided in the main loop
void IO::Networking::AsyncSocket::EnterIoContext(std::function<void(IO::NetworkError)> const& callback)
{
    int state = m_atomicState.fetch_or(SocketStateFlags::CONTEXT_PENDING_SET);
    MANGOS_DEBUG_ASSERT(state & SocketStateFlags::IS_INITIALIZED);

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

    m_currentContextTask.InitNew([this](DWORD errorCode) {
        auto tmpCallback = std::move(m_contextCallback);
        m_currentContextTask.Reset();
        m_atomicState.fetch_and(~SocketStateFlags::CONTEXT_PRESENT);
        tmpCallback(IO::NetworkError(IO::NetworkError::ErrorType::NoError));
    });

    m_atomicState.fetch_xor(SocketStateFlags::CONTEXT_PRESENT | SocketStateFlags::CONTEXT_PENDING_SET); // set PRESENT and unset PENDING_SET

    m_ctx->PostOperationForImmediateInvocation(&m_currentContextTask);
}

IO::Networking::AsyncSocket::AsyncSocket(IO::IoContext* ctx, IO::Networking::SocketDescriptor socketDescriptor)
    : m_ctx(ctx), m_descriptor(std::move(socketDescriptor))
{
    // Attach our acceptor socket to our completion port
    if (::CreateIoCompletionPort((HANDLE) m_descriptor.GetNativeSocket(), m_ctx->GetWindowsCompletionPort(), (u_long)0, 0) != m_ctx->GetWindowsCompletionPort())
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::CreateIoCompletionPort(accept, ...) Error: %u", ::WSAGetLastError());
        return;
    }
}
