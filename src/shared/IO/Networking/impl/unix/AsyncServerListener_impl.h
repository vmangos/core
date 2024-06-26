#ifndef MANGOS_IO_NETWORKING_UNIX_ASYNCSERVERLISTENER_H
#define MANGOS_IO_NETWORKING_UNIX_ASYNCSERVERLISTENER_H

#include <vector>
#include <memory>
#include <string>
#include <chrono>

template<typename TClientSocket>
AsyncServerListener<TClientSocket>::~AsyncServerListener()
{
}

template<typename TClientSocket>
std::unique_ptr<AsyncServerListener<TClientSocket>> AsyncServerListener<TClientSocket>::CreateAndBindServer(const std::string &bindIp, uint16_t port)
{
    return nullptr;
}

template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::StartAcceptOperation()
{
}

template<typename TClientSocket>
void AsyncServerListener<TClientSocket>::RunEventLoop(std::chrono::milliseconds maxBlockingDuration)
{
}

#endif //MANGOS_IO_NETWORKING_WIN32_ASYNCSERVERLISTENER_H
