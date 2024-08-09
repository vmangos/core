#ifndef MANGOS_IO_NETWORKING_ASYNCSOCKET_H
#define MANGOS_IO_NETWORKING_ASYNCSOCKET_H

#include <memory>
#include <utility>
#include <vector>
#include <array>
#include <cstdint>
#include <functional>
#include <atomic>
#include "ByteBuffer.h"
#include "IO/Context/IoContext.h"
#include "IO/Networking/NetworkError.h"
#include "IO/Networking/SocketDescriptor.h"
#include "IO/Context/AsyncIoOperation.h"

namespace IO { namespace Networking {
    template<typename SocketType>
    class AsyncSocketListener;

    // this socket is different in that it does not block on reads
    template<typename SocketType>
    class AsyncSocket : public std::enable_shared_from_this<SocketType>
#if defined(__linux__) || defined(__APPLE__)
            , public IO::SystemIoEventReceiver
#endif
    {
        friend class AsyncSocketListener<SocketType>;

        public:
            explicit AsyncSocket(IO::IoContext* ctx, SocketDescriptor socketDescriptor) : m_ctx(ctx), m_socket(std::move(socketDescriptor)) {}
            ~AsyncSocket() noexcept(false); // this destructor will throw if there is a pending transaction
            AsyncSocket(AsyncSocket const&) = delete;
            AsyncSocket& operator=(AsyncSocket const&) = delete;
            AsyncSocket(AsyncSocket&&) = delete;
            AsyncSocket& operator=(AsyncSocket&&) = delete;

            /// Must be overwritten by the subclass. Will be executed after socket is setup. Should start a Read(...) or something.
            virtual void Start() = 0;

            IO::NetworkError SetNativeSocketOption_NoDelay(bool doNoDelay);
            IO::NetworkError SetNativeSocketOption_SystemOutgoingSendBuffer(int bytes);

            /// Keep in mind to keep the source buffer in scope of the callback, otherwise random memory might get overwritten
            /// Most of the time this is not an issue, since you want to process the incoming buffer
            void Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&)> const& callback);
            void ReadSkip(std::size_t skipSize, std::function<void(IO::NetworkError const&)> const& callback);

            /// The callback is invoked in the IO thread
            /// Useful for computational expensive operations (e.g. packing and encryption), that should be avoided in the main loop
            void EnterIoContext(std::function<void(IO::NetworkError)> const& callback);

            /// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered! (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
            void Write(std::shared_ptr<std::vector<uint8_t> const> const& source, std::function<void(IO::NetworkError const&)> const& callback);
            /// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered! (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
            void Write(std::shared_ptr<ByteBuffer const> const& source, std::function<void(IO::NetworkError const&)> const& callback);
            /// Warning: Using this function will NOT copy the buffer, dont overwrite it unless callback is triggered! (but a reference to the smart_ptr will be held throughout the transfer, so you dont need to)
            void Write(std::shared_ptr<uint8 const> const& source, uint64_t size, std::function<void(IO::NetworkError const&)> const& callback);

            void CloseSocket();
            bool IsClosing() const;

            IO::Networking::IpEndpoint const& GetRemoteEndpoint() const;
            std::string GetRemoteIpString() const;

#if defined(__linux__) || defined(__APPLE__)
            void OnIoEvent(uint32_t event) final;
#endif

        private:
            IO::IoContext* m_ctx;
            IO::Networking::SocketDescriptor m_socket;

            // We are doing all this atomic stuff, just so we don't have to std::mutex everything
            enum SocketStateFlags : int
            {
                SHUTDOWN_PENDING     = (1 << 0), // stop all new transaction requests. There should never be a new _INUSE when this is present
                IGNORE_TRANSFERS     = (1 << 1), // Like SHUTDOWN_PENDING but the event receivers `PerformNonBlockingRead` and `PerformNonBlockingWrite` will ignore the event

                // PRESENT: Stuff that is present and set
                // PENDING: Stuff that is currently being used, if you want to close the socket you must spinwait it.

                WRITE_PENDING_SET    = (1 << 2),
                WRITE_PRESENT        = (1 << 3),
                WRITE_PENDING_LOAD   = (1 << 4),

                READ_PENDING_SET     = (1 << 5),
                READ_PRESENT         = (1 << 6),
                READ_PENDING_LOAD    = (1 << 7),

                CONTEXT_PENDING_SET  = (1 << 8),
                CONTEXT_PRESENT      = (1 << 9),
                CONTEXT_PENDING_LOAD = (1 << 10),
            };
            std::atomic<int> m_atomicState{0};

            std::function<void(IO::NetworkError)> m_contextCallback = nullptr; // <-- Callback into user code

            // Read = the target buffer to write the network stream to
            std::function<void(IO::NetworkError)> m_readCallback = nullptr; // <-- Callback into user code

            // Write = the source buffer from where to read to be able to write to the network stream
            std::function<void(IO::NetworkError)> m_writeCallback = nullptr; // <-- Callback into user code
            std::shared_ptr<ByteBuffer const> m_writeSrcBufferDummyHolder_ByteBuffer = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer
            std::shared_ptr<std::vector<uint8_t> const> m_writeSrcBufferDummyHolder_u8Vector = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer
            std::shared_ptr<uint8_t const> m_writeSrcBufferDummyHolder_rawArray = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer

#if defined(WIN32)
            IocpOperationTask m_currentContextTask; // <-- Internal tasks / callback to internal networking code
            IocpOperationTask m_currentWriteTask; // <-- Internal tasks / callback to internal networking code
            IocpOperationTask m_currentReadTask; // <-- Internal tasks / callback to internal networking code
#elif defined(__linux__) || defined(__APPLE__)
        private:
            void PerformNonBlockingRead();
            void PerformNonBlockingWrite();
            void PerformContextSwitch();
            void StopPendingTransactionsAndForceClose();

            char* m_readDstBuffer = nullptr; // this ptr will move along the buffer as its filled, check m_readDstBufferBytesLeft for space
            std::size_t m_readDstBufferBytesLeft = 0;
            char const* m_writeSrcBuffer = nullptr; // this ptr will move along the buffer as its filled, check m_writeSrcBufferBytesLeft for space
            std::size_t m_writeSrcBufferBytesLeft = 0;
#endif
    };
}} // namespace IO::Networking

template<typename SocketType>
IO::Networking::AsyncSocket<SocketType>::~AsyncSocket() noexcept(false)
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

template<typename SocketType>
bool IO::Networking::AsyncSocket<SocketType>::IsClosing() const
{
    bool isClosing = m_atomicState.load(std::memory_order::memory_order_relaxed) & SHUTDOWN_PENDING;
    return isClosing;
}

template<typename SocketType>
IO::Networking::IpEndpoint const& IO::Networking::AsyncSocket<SocketType>::GetRemoteEndpoint() const
{
    return m_socket.m_peerEndpoint;
}

template<typename SocketType>
std::string IO::Networking::AsyncSocket<SocketType>::GetRemoteIpString() const
{
    return GetRemoteEndpoint().ip.toString();
}

template<typename SocketType>
void IO::Networking::AsyncSocket<SocketType>::ReadSkip(std::size_t skipSize, std::function<void(IO::NetworkError const&)> const& callback)
{
    std::shared_ptr<std::vector<uint8_t>> skipBuffer(new std::vector<uint8_t>());
    skipBuffer->resize(skipSize);
    Read((char*)skipBuffer->data(), skipSize, [skipBuffer, callback](IO::NetworkError const& error)
    {
        // KEEP skipBuffer in scope!
        // Do not remove skipBuffer before Read() is done, since we are transferring into it via async IO
        // and since we are using a raw pointer, the Task has no knowledge about the lifetime of the std::vector
        skipBuffer->clear();
        callback(error);
    });
}

#if defined(WIN32)
#include "./impl/windows/AsyncSocket_impl.h"
#elif defined(__linux__) || defined(__APPLE__)
#include "./impl/unix/AsyncSocket_impl.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSOCKET_H
