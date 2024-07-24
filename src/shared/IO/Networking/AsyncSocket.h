#ifndef MANGOS_IO_NETWORKING_ASYNCSOCKET_H
#define MANGOS_IO_NETWORKING_ASYNCSOCKET_H

#include <memory>
#include <utility>
#include <vector>
#include <array>
#include <cstdint>
#include <functional>
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
#if defined(__linux__)
            , public IO::UnixEpollEventReceiver
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

#if defined(__linux__)
            void OnEpollEvent(uint32_t epollEvents) final;
#endif

        private:
            IO::IoContext* m_ctx;
            IO::Networking::SocketDescriptor m_socket;
            bool m_disconnectRequest = false; // "Soft Shutdown Request", dont allow new transactions

            // TODO make std::atomic<int> this way I can check if shutdown is present and if there is a pending transaction a the same time
            std::atomic_flag m_contextCallbackPresent{false};
            std::function<void(IO::NetworkError)> m_contextCallback = nullptr; // <-- Callback into user code

            // Read = the target buffer to write the network stream to
            std::atomic_flag m_readCallbackPresent;
            std::function<void(IO::NetworkError)> m_readCallback = nullptr; // <-- Callback into user code

            // Write = the source buffer from where to read to be able to write to the network stream
            std::atomic_flag m_writeCallbackPresent;
            std::function<void(IO::NetworkError)> m_writeCallback = nullptr; // <-- Callback into user code
            std::shared_ptr<ByteBuffer const> m_writeSrcBufferDummyHolder_ByteBuffer = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer
            std::shared_ptr<std::vector<uint8_t> const> m_writeSrcBufferDummyHolder_u8Vector = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer
            std::shared_ptr<uint8_t const> m_writeSrcBufferDummyHolder_rawArray = nullptr; // Optional. To keep the shared_ptr for the lifetime of the transfer

#if defined(WIN32)
            std::mutex m_writeLock;
            std::mutex m_contextLock;
            IocpOperationTask m_currentContextTask; // <-- Internal tasks / callback to internal networking code
            IocpOperationTask m_currentWriteTask; // <-- Internal tasks / callback to internal networking code
            IocpOperationTask m_currentReadTask; // <-- Internal tasks / callback to internal networking code
#elif defined(__linux__)

        public: // TODO: Make me private again. Why does friend not work?
            void PerformNonBlockingRead();
            void PerformNonBlockingWrite();
            void StopPendingTransactionsAndForceClose();
        private:
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
    if (!m_disconnectRequest)
        CloseSocket();

    // Logic behind these checks:
    // If the destructor is called, there should be no more std::shared_ptr<> references to this object
    // Every Read() or Write should use `shared_from_this()` if this is not the case one of these checks will fail
    if (m_contextCallbackPresent.test_and_set())
            MANGOS_ASSERT(false); // TODO: allow MANGOS_ASSERT to accept a string description
    if (m_readCallbackPresent.test_and_set())
            MANGOS_ASSERT(false); // TODO: allow MANGOS_ASSERT to accept a string description
    if (m_writeCallbackPresent.test_and_set())
            MANGOS_ASSERT(false); // TODO: allow MANGOS_ASSERT to accept a string description
}

template<typename SocketType>
bool IO::Networking::AsyncSocket<SocketType>::IsClosing() const
{
    return m_disconnectRequest;
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
#elif defined(__linux__)
#include "./impl/unix/AsyncSocket_impl.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSOCKET_H
