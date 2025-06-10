#include "SocketDescriptor.h"
#include "IO/Networking/Internal.h"

#include "Errors.h"

IO::Networking::SocketDescriptor::SocketDescriptor(IO::Native::SocketHandle nativeSocket, IO::Networking::IpEndpoint remoteEndpoint)
    : m_nativeSocket(nativeSocket), m_remoteEndpoint(remoteEndpoint), m_isClosed(false)
{
}

IO::Networking::SocketDescriptor::~SocketDescriptor()
{
    MANGOS_ASSERT(m_isClosed);
}

void IO::Networking::SocketDescriptor::CloseSocket()
{
    MANGOS_ASSERT(!m_isClosed);
    m_isClosed = true;
    IO::Networking::Internal::CloseSocket(m_nativeSocket);
}
