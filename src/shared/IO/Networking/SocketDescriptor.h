#ifndef MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H
#define MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H

#include "IO/Networking/IpAddress.h"
#include "IO/NativeAliases.h"

#include "Policies/ObjectConstructorTraits.h"

#include <string>

namespace IO { namespace Networking {

/// Is the owner of a native socket. Cannot be detached from it.
/// The socket must be closed before this is destructed.
class SocketDescriptor final : public MaNGOS::Policies::NoCopyButAllowMove
{
public:
    explicit SocketDescriptor(Native::SocketHandle nativeSocket, IO::Networking::IpEndpoint remoteEndpoint);
    SocketDescriptor(SocketDescriptor&& other) noexcept : m_isClosed(other.m_isClosed), m_remoteEndpoint(other.m_remoteEndpoint), m_nativeSocket(other.m_nativeSocket)
    { other.m_isClosed = true; }
    ~SocketDescriptor();

    void CloseSocket();

    bool IsClosed() const { return m_isClosed; }
    IO::Native::SocketHandle const& GetNativeSocket() const { return m_nativeSocket; }
    IO::Networking::IpEndpoint const& GetRemoteEndpoint() const { return m_remoteEndpoint; }

 private:
    bool m_isClosed;
    IO::Native::SocketHandle const m_nativeSocket;
    IO::Networking::IpEndpoint const m_remoteEndpoint;
};

}} // namespace IO::Networking

#endif //MANGOS_IO_NETWORKING_SOCKETDESCRIPTOR_H
