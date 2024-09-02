#ifndef MANGOS_IO_NETWORKING_ASYNCSOCKET_H
#define MANGOS_IO_NETWORKING_ASYNCSOCKET_H

#include "IO/Context/IoContext.h"
#include "IO/Networking/NetworkError.h"
#include "IO/Networking/SocketDescriptor.h"
#include "IO/Context/AsyncIoOperation.h"
#include "Policies/ObjectConstructorTraits.h"
#include "ByteBuffer.h"
#include "IO/NativeAliases.h"
#include "IO/SmartBuffer.h"

#include <memory>
#include <utility>
#include <vector>
#include <array>
#include <cstdint>
#include <functional>
#include <atomic>

namespace IO { namespace Networking {

    /// TODO Rename me to just Socket
    /// You have to keep the instance alive while a transaction is running. Use a shared pointer or something on every callback!
    class AsyncSocket : public MaNGOS::Policies::NoCopyButAllowMove
#if defined(__linux__) || defined(__APPLE__)
           , public IO::SystemIoEventReceiver
#endif
    {
        public:
            explicit AsyncSocket(IO::IoContext* ctx, SocketDescriptor socketDescriptor);
            AsyncSocket(AsyncSocket&& other) noexcept;
            ~AsyncSocket(); // this destructor will throw if there is a pending transaction

            IO::NetworkError SetNativeSocketOption_NoDelay(bool doNoDelay);
            IO::NetworkError SetNativeSocketOption_SystemOutgoingSendBuffer(int bytes);

            /// Keep in mind to keep the source buffer in scope of the callback, otherwise random memory might get overwritten
            /// Most of the time this is not an issue, since you want to process the incoming buffer
            /// You have to keep the pointer alive until the callback is called. Use [self = shared_from_this()]
            void Read(char* target, std::size_t size, std::function<void(IO::NetworkError const&, std::size_t)> const& callback);
            void ReadSome(char* target, std::size_t maxSize, std::function<void(IO::NetworkError const&, size_t)> const& callback);
            void ReadSkip(std::size_t skipSize, std::function<void(IO::NetworkError const&)> const& callback);

            /// The callback is invoked in the IO thread
            /// Useful for computational expensive operations (e.g. packing and encryption), that should be avoided in the main loop
            void EnterIoContext(std::function<void(IO::NetworkError)> const& callback);

            /// Warning: Using this function will NOT copy the buffer content, dont overwrite it unless callback is triggered!
            void Write(IO::ReadableBuffer const& source, std::function<void(IO::NetworkError const&)> const& callback);

            void CloseSocket();
            bool IsClosing() const;

            IO::Networking::IpEndpoint const& GetRemoteEndpoint() const
            {
                return m_descriptor.GetRemoteEndpoint();
            }

            /// IPv4 Format: 255.255.255.255
            /// IPv6 Format: [FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF]
            std::string const& GetRemoteIpString() const
            {
                return GetRemoteEndpoint().ip.toString();
            }

        private:
#if defined(__linux__) || defined(__APPLE__)
            void OnIoEvent(uint32_t event) final; // invoked by IoContext
#endif

        protected: // socket specific variables
            IO::IoContext* m_ctx;
            IO::Networking::SocketDescriptor m_descriptor;

        private: // internal stuff

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

                WAS_MOVED_NO_DTOR    = (1 << 11),
            };
            std::atomic<int> m_atomicState{0};

            std::function<void(IO::NetworkError)> m_contextCallback = nullptr; // <-- Callback into user code

            // Read = the target buffer to write the network stream to
            std::function<void(IO::NetworkError const&, size_t)> m_readCallback = nullptr; // <-- Callback into user code

            // Write = the source buffer from where to read to be able to write to the network stream
            std::function<void(IO::NetworkError)> m_writeCallback = nullptr; // <-- Callback into user code
            IO::ReadableBuffer m_writeSrc{};

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
            std::size_t m_readDstBufferSize = 0; // will be 0 if ReadSome(), otherwise the original buffer size
            std::size_t m_readDstBufferBytesLeft = 0;
            char const* m_writeSrcBuffer = nullptr; // this ptr will move along the buffer as its filled, check m_writeSrcBufferBytesLeft for space
            std::size_t m_writeSrcBufferBytesLeft = 0;
#endif
    };
}} // namespace IO::Networking

#endif //MANGOS_IO_NETWORKING_ASYNCSOCKET_H
