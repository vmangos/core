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
    explicit AsyncServerListener(SOCKET acceptorNativeSocket, HANDLE completionPort)
            : m_acceptorNativeSocket(acceptorNativeSocket), m_completionPort(completionPort) {}

    void StartAcceptOperation();
    void HandleAccept(std::shared_ptr<TClientSocket> newClient);

    SOCKET m_acceptorNativeSocket;
    HANDLE m_completionPort;
    IocpOperationTask m_currentAcceptTask;
};

#ifdef WIN32
#include "./impl/windows/AsyncServerListener_impl.h"
#else
#error "IO::Networking not supported on your platform"
#endif

#endif //MANGOS_IO_NETWORKING_ASYNCSERVERLISTENER_H
