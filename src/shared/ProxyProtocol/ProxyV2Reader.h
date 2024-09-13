#ifndef MANGOS_PROXYPROTOCOL_PROXYV2READER_H
#define MANGOS_PROXYPROTOCOL_PROXYV2READER_H

#include "IO/Networking/AsyncSocket.h"

#include "nonstd/expected.hpp"

namespace ProxyProtocol
{
    /// Allows you to read the proxy protocol V2
    /// Keep in mind that this must be from a trusted source
    void ReadProxyV2Handshake(IO::Networking::AsyncSocket* socket, std::function<void(nonstd::expected<IO::Networking::IpAddress, IO::NetworkError> const&)> const& callback);
}

#endif //MANGOS_PROXYPROTOCOL_PROXYV2READER_H
