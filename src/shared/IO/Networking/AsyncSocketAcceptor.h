#ifndef MANGOS_IO_NETWORKING_ASYNCSOCKETACCEPTOR_H
#define MANGOS_IO_NETWORKING_ASYNCSOCKETACCEPTOR_H

#include "IO/NativeAliases.h"
#include "IO/Context/IoContext.h"
#include "IO/Context/AsyncIoOperation.h"
#include "IO/Networking/NetworkError.h"
#include "IO/Networking/SocketDescriptor.h"

#include "Policies/ObjectConstructorTraits.h"

#include "nonstd/expected.hpp"

#include <cstddef>
#include <chrono>
#include <string>

namespace IO { namespace Networking {

    class AsyncSocket;

    /// A class that allows you to bind to a TCP address and accept connections
    class AsyncSocketAcceptor : MaNGOS::Policies::NoCopyButAllowMove
    #if defined(__linux__) || defined(__APPLE__)
                , IO::SystemIoEventReceiver
    #endif
    {
        public:
            ~AsyncSocketAcceptor(); // this destructor will throw if ClosePortAndStopAcceptingNewConnections was not called

            static std::unique_ptr<AsyncSocketAcceptor> CreateAndBindServer(IO::IoContext* ctx, std::string const& bindIp, uint16_t port);
            void ClosePortAndStopAcceptingNewConnections();

            /// Automatically accepts all incoming connections until this Acceptor is StoppedAndClosed
            void AutoAcceptSocketsUntilClose(std::function<void(IO::Networking::SocketDescriptor socketDescriptor)> const& onNewSocket);
    #if defined(__linux__) || defined(__APPLE__)
            void OnIoEvent(uint32_t event); // used for ::accept
    #endif

        private:
            explicit AsyncSocketAcceptor(IO::IoContext* ctx, IO::Native::SocketHandle acceptorNativeSocket)
                : m_ctx(ctx), m_acceptorNativeSocket(acceptorNativeSocket), m_wasClosed(false) {}

            IO::Native::SocketHandle m_acceptorNativeSocket;
            IO::IoContext* m_ctx;
            bool m_wasClosed;

    #if defined(WIN32)
            void AcceptOne(std::function<void(nonstd::expected<IO::Networking::SocketDescriptor, IO::NetworkError> acceptResult)> const& afterAccept);
            IocpOperationTask m_currentAcceptTask;
    #elif defined(__linux__) || defined(__APPLE__)
            std::function<void(IO::Networking::SocketDescriptor socketDescriptor)> m_onNewSocketCallback = nullptr;
            void OnNewClientToAcceptAvailable(); // a new socket on ::accept() is available
    #endif

    };
}} // namespace IO::Networking

#endif // MANGOS_IO_NETWORKING_ASYNCSOCKETACCEPTOR_H
