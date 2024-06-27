#ifndef MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H

template<typename TClientSocket>
class AsyncServerListener {

public:
    ~AsyncServerListener();
    AsyncServerListener(AsyncServerListener const&) = delete;
    AsyncServerListener& operator=(AsyncServerListener const&) = delete;
    AsyncServerListener(AsyncServerListener&&) = delete;
    AsyncServerListener& operator=(AsyncServerListener&&) = delete;

    static std::unique_ptr<AsyncServerListener<TClientSocket>> CreateAndBindServer(std::string const& bindIp, uint16_t port);
    void RunEventLoop(std::chrono::milliseconds maxBlockingDuration);

private:
    void HandlePostAccept(std::shared_ptr<TClientSocket> newClient);

    IO::Native::SocketHandle m_acceptorNativeSocket;

#if defined(WIN32)
    void StartAcceptOperation();

    explicit AsyncServerListener(IO::Native::SocketHandle acceptorNativeSocket, HANDLE completionPort)
            : m_acceptorNativeSocket(acceptorNativeSocket), m_completionPort(completionPort) {}

    HANDLE m_completionPort;
    IocpOperationTask m_currentAcceptTask;
#elif defined(__linux__)
    void OnNewClientToAcceptAvailable();

    explicit AsyncServerListener(IO::Native::SocketHandle acceptorNativeSocket, int epollDescriptor)
            : m_acceptorNativeSocket(acceptorNativeSocket), m_epollDescriptor(epollDescriptor) {}

    int m_epollDescriptor;
#endif
};


template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::HandlePostAccept(std::shared_ptr<TClientSocket> newClient)
{
    newClient->Start();
}

#if defined(WIN32)
#include "./impl/windows/AsyncServerListener_impl.h"
#elif defined(__linux__)
#include "./impl/unix/AsyncServerListener_impl.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
