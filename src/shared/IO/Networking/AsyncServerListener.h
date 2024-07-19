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
    class AsyncServerListener : IO::UnixEpollEventReceiver {

    public:
        ~AsyncServerListener();
        AsyncServerListener(AsyncServerListener const&) = delete;
        AsyncServerListener& operator=(AsyncServerListener const&) = delete;
        AsyncServerListener(AsyncServerListener&&) = delete;
        AsyncServerListener& operator=(AsyncServerListener&&) = delete;

        static std::unique_ptr<AsyncServerListener<TClientSocket>> CreateAndBindServer(IO::IoContext* ctx, std::string const& bindIp, uint16_t port);

#if defined(__linux__)
        void OnEpollEvent(uint32_t epollEvents) final; // used for ::accept
#endif

    private:
        void HandlePostAccept(std::shared_ptr<TClientSocket> newClient);

        IO::Native::SocketHandle m_acceptorNativeSocket;
        IO::IoContext* m_ctx;

#if defined(WIN32)
        void StartAcceptOperation();

        explicit AsyncServerListener(IO::IoContext* ctx, IO::Native::SocketHandle acceptorNativeSocket)
                : m_ctx(ctx), m_acceptorNativeSocket(acceptorNativeSocket) {}

        IocpOperationTask m_currentAcceptTask;
#elif defined(__linux__)
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
#elif defined(__linux__)
#include "./impl/unix/AsyncServerListener_impl.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
