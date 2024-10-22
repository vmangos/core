#ifndef MANGOS_PROXYPROTOCOL_PROXYV2READER_H
#define MANGOS_PROXYPROTOCOL_PROXYV2READER_H

#include "IO/Networking/AsyncSocket.h"

#include "nonstd/expected.hpp"

namespace ProxyProtocol
{
    /// Allows you to receive the correct client IP via proxy protocol V2.
    /// If you are using HaProxy you can enable it with the "send-proxy-v2" at the "backend server".
    /// This function must be called before any other Read() call, because its sent by the proxy fist.
    /// \warning You have to verify if the socket is from a trusted proxy IP!
    void ReadProxyV2Handshake(IO::Networking::AsyncSocket* socket, std::function<void(nonstd::expected<IO::Networking::IpAddress, IO::NetworkError> const&)> const& callback);
}

#endif //MANGOS_PROXYPROTOCOL_PROXYV2READER_H
