#include "AsyncSocket.h"
#include "Log.h"
#include "Errors.h"

IO::Networking::AsyncSocket::~AsyncSocket() noexcept(false)
{
    sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "Destructor called ~AsyncSocket: No references left");
    CloseSocket();

//#ifdef DEBUG
    // Logic behind these checks:
    // If the destructor is called, there should be no more std::shared_ptr<> references to this object
    // Every Read(...) or Write(...) should use `shared_from_this()` if this is not the case, one of the following checks will fail
    int state = m_atomicState.load(std::memory_order::memory_order_relaxed);
    MANGOS_ASSERT(!(state & SocketStateFlags::CONTEXT_PRESENT));
    MANGOS_ASSERT(!(state & SocketStateFlags::WRITE_PRESENT));
    MANGOS_ASSERT(!(state & SocketStateFlags::READ_PRESENT));
//#endif // _DEBUG
}

bool IO::Networking::AsyncSocket::IsClosing() const
{
    bool isClosing = m_atomicState.load(std::memory_order::memory_order_relaxed) & SHUTDOWN_PENDING;
    return isClosing;
}

IO::Networking::IpEndpoint const& IO::Networking::AsyncSocket::GetRemoteEndpoint() const
{
    return m_socket.m_peerEndpoint;
}

std::string IO::Networking::AsyncSocket::GetRemoteIpString() const
{
    return GetRemoteEndpoint().ip.toString(); // Just gets the IP part e.g. "192.168.13.37"
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
