#include "AsyncSocket.h"
#include "Log.h"
#include "Errors.h"
#include "IpAddress.h"

IO::Networking::AsyncSocket::AsyncSocket(AsyncSocket&& other) noexcept :
    m_ctx(other.m_ctx),
    m_descriptor(std::move(other.m_descriptor)),
    m_contextCallback(std::move(other.m_contextCallback)),
    m_readCallback(std::move(other.m_readCallback)),
    m_writeCallback(std::move(other.m_writeCallback)),
    m_writeSrc(std::move(other.m_writeSrc)),
#if defined(WIN32)
    m_currentContextTask(std::move(other.m_currentContextTask)),
    m_currentWriteTask(std::move(other.m_currentWriteTask)),
    m_currentReadTask(std::move(other.m_currentReadTask))
#elif defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    m_readDstBuffer(other.m_readDstBuffer),
    m_readDstBufferSize(other.m_readDstBufferSize),
    m_readDstBufferBytesLeft(other.m_readDstBufferBytesLeft),
    m_writeSrcAlreadyTransferred(other.m_writeSrcAlreadyTransferred)
#endif
{
    MANGOS_DEBUG_ASSERT(!(m_atomicState.load(std::memory_order_relaxed) & SocketStateFlags::IS_INITIALIZED)); // dont allow std::move() if memory address is fixed

    m_atomicState.exchange(other.m_atomicState);
    other.m_atomicState.exchange(SocketStateFlags::WAS_MOVED_NO_DTOR);
}

IO::Networking::AsyncSocket::~AsyncSocket()
{
    int state = m_atomicState.load(std::memory_order_relaxed);
    if (state & SocketStateFlags::WAS_MOVED_NO_DTOR)
        return; // Ignore destructor

    sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "[%s] Destructor called ~AsyncSocket: No references left", GetRemoteIpString().c_str());
    m_descriptor.CloseSocket(); // <-- This will actually close the socket and release the file descriptor to the kernel

    // Logic behind these checks:
    // If the destructor is called, there should be no more std::shared_ptr<> references to this object
    // Every Read(...) or Write(...) should use `shared_from_this()` if this is not the case, one of the following checks will fail
    MANGOS_ASSERT(!(state & SocketStateFlags::CONTEXT_PRESENT));
    MANGOS_ASSERT(!(state & SocketStateFlags::WRITE_PRESENT));
    MANGOS_ASSERT(!(state & SocketStateFlags::READ_PRESENT));
}

bool IO::Networking::AsyncSocket::IsClosing() const
{
    bool isClosing = m_atomicState.load(std::memory_order_relaxed) & SHUTDOWN_PENDING;
    return isClosing;
}

void IO::Networking::AsyncSocket::ReadSkip(std::size_t skipSize, std::function<void(IO::NetworkError const&)> const& callback)
{
    std::shared_ptr<std::vector<uint8_t>> skipBuffer(new std::vector<uint8_t>());
    skipBuffer->resize(skipSize);
    Read((char*)skipBuffer->data(), skipSize, [skipBuffer, callback](IO::NetworkError const& error, size_t)
    {
        // KEEP skipBuffer in scope!
        // Do not remove skipBuffer before Read() is done, since we are transferring into it via async IO
        // and since we are using a raw pointer, the Task has no knowledge about the lifetime of the std::vector
        skipBuffer->clear();
        callback(error);
    });
}
