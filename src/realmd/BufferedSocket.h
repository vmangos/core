/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/** \file
  \ingroup realmd
  */

#ifndef _BUFFEREDSOCKET_H_
#define _BUFFEREDSOCKET_H_

#include "Common.h"
#include <string>

#define BUFFERED_SOCKET_BUFFER_SIZE 256

template <typename DerivedType, class Acceptor>
struct BufferedSocket
{
    virtual void OnRead(void) { }
    virtual void OnAccept(void) { }
    virtual void OnClose(void) { }

    std::string const& get_remote_address() const
    {
        return remoteAddress;
    }
    size_t recv_len() const
    {
        return recvPosition;
    }
    bool recv_soft(char* buf, size_t len)
    {
        if (len > recvPosition)
            return false;

        memcpy(buf, recvBuffer, len);
        return true;
    }
    bool recv(char* buf, size_t len)
    {
        if (len > recvPosition)
            return false;

        memcpy(buf, recvBuffer, len);
        memcpy(recvBuffer, recvBuffer + len, BUFFERED_SOCKET_BUFFER_SIZE - len);
        recvPosition -= len;
        return true;
    }
    void recv_skip(size_t len)
    {
        if (len > recvPosition)
            len = recvPosition;

        if (!len)
            return;

        memcpy(recvBuffer, recvBuffer + len, BUFFERED_SOCKET_BUFFER_SIZE - len);
        recvPosition -= len;
    }
    bool send(const char *buf, size_t len);
    void close_connection();

    int         index = 0;
    bool		connected = false;
    SOCKADDR_IN	address;
    SOCKET		socket = INVALID_SOCKET;
    fd_set		socketData;
    int			dataLength = 0;
    char        recvBuffer[BUFFERED_SOCKET_BUFFER_SIZE] = {};
    int         recvPosition = 0;
    std::string remoteAddress;
    Acceptor* acceptor = nullptr;
};

#define BUFFERED_SOCKET_ACCEPTOR_MAX_CLIENTS 1024

template<class SocketType>
class BufferedSocketAcceptor
{
public:
    bool AcceptClient(SocketType* pClient);
    void AcceptConnections();
    bool DisconnectClient(SocketType* pClient);
    void StopNetwork();
    int ReceiveClient(SocketType* pClient, char * buffer, int size);
    void ReceiveData();
    bool SendData(SocketType* pClient, char const* buffer, int size);
    bool StartNetwork(char const* bindIp, uint16 port);
    int GetConnectionsCount() const { return m_connectionsCount; }

private:
    SOCKADDR_IN	   m_serverAddress;
    SOCKADDR	   m_serverSocketAddress;
    SOCKET		   m_serverSocket = INVALID_SOCKET;
    std::unique_ptr<SocketType> m_clients[BUFFERED_SOCKET_ACCEPTOR_MAX_CLIENTS];
    int			   m_connectionsCount = 0;
};

#endif /* _BUFFEREDSOCKET_H_ */
