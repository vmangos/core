#ifndef MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H

#include "../NativeAliases.h"
#include "IO/Context/IoContext.h"
#include "IO/Context/AsyncIoOperation.h"
#include <cstddef>
#include <chrono>
#include <string>

namespace IO { namespace Networking {

    template<typename TClientSocket>
    class AsyncServerListener
#if defined(__linux__) || defined(__APPLE__)
            : public IO::SystemIoEventReceiver
#endif
    {

    public:
        ~AsyncServerListener() noexcept(false); // this destructor will throw if ClosePortAndStopAcceptingNewConnections was not called
        AsyncServerListener(AsyncServerListener const&) = delete;
        AsyncServerListener& operator=(AsyncServerListener const&) = delete;
        AsyncServerListener(AsyncServerListener&&) = delete;
        AsyncServerListener& operator=(AsyncServerListener&&) = delete;

        static std::unique_ptr<AsyncServerListener<TClientSocket>> CreateAndBindServer(IO::IoContext* ctx, std::string const& bindIp, uint16_t port);
        void ClosePortAndStopAcceptingNewConnections();

#if defined(__linux__) || defined(__APPLE__)
        void OnIoEvent(uint32_t event) final; // used for ::accept
#endif

    private:
        void HandlePostAccept(std::shared_ptr<TClientSocket> newClient);

        IO::Native::SocketHandle m_acceptorNativeSocket;
        IO::IoContext* m_ctx;
        bool m_wasClosed;

#if defined(WIN32)
        void StartAcceptOperation();

        explicit AsyncServerListener(IO::IoContext* ctx, IO::Native::SocketHandle acceptorNativeSocket)
                : m_ctx(ctx), m_acceptorNativeSocket(acceptorNativeSocket), m_wasClosed(false) {}

        IocpOperationTask m_currentAcceptTask;
#elif defined(__linux__) || defined(__APPLE__)
        void OnNewClientToAcceptAvailable();

        explicit AsyncServerListener(IO::IoContext* ctx, IO::Native::SocketHandle acceptorNativeSocket)
                : m_ctx(ctx), m_acceptorNativeSocket(acceptorNativeSocket) {}
#endif
    };

    template<typename TClientSocket>
    void AsyncServerListener<TClientSocket>::HandlePostAccept(std::shared_ptr<TClientSocket> newClient)
    {
        newClient->Start();
    }

}} // namespace IO::Networking

#if defined(WIN32)
#include "./impl/windows/AsyncServerListener_impl.h"
#elif defined(__linux__) || defined(__APPLE__)
#include "./impl/unix/AsyncServerListener_impl.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
