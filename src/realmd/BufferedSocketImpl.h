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

#include "BufferedSocket.h"
#include "Config/Config.h"
#include "Log.h"

template<class SocketType>
bool BufferedSocketAcceptor<SocketType>::AcceptClient(SocketType *pClient)
{
    pClient->dataLength = sizeof(SOCKADDR);
    pClient->socket = accept(m_serverSocket, (SOCKADDR *)&pClient->address, &pClient->dataLength);

    if (pClient->socket == 0 ||
        pClient->socket == SOCKET_ERROR)
    {
        return false;
    }
    else
    {
        pClient->connected = true;
        FD_ZERO(&pClient->socketData);
        FD_SET(pClient->socket, &pClient->socketData);

        return true;
    }

    return false;
}

template<class SocketType>
void BufferedSocketAcceptor<SocketType>::AcceptConnections()
{
    int j;
    if (m_connectionsCount < BUFFERED_SOCKET_ACCEPTOR_MAX_CLIENTS)
    {
        for (j = 0; j < BUFFERED_SOCKET_ACCEPTOR_MAX_CLIENTS; j++)
        {
            if (!m_clients[j]->connected)
            {
                if (AcceptClient(m_clients[j].get()))
                {
                    m_connectionsCount++;
                    m_clients[j]->remoteAddress = inet_ntoa(m_clients[j]->address.sin_addr);
                    m_clients[j]->OnAccept();
                }
            }
        }
    }
}

template<class SocketType>
bool BufferedSocketAcceptor<SocketType>::DisconnectClient(SocketType *pClient)
{
    bool result = pClient->connected;

    if (pClient->connected == true)
        closesocket(pClient->socket);

    pClient->OnClose();

    // reset everything except the index
    int index = pClient->index;
    *pClient = SocketType();
    pClient->index = index;

    --m_connectionsCount;

    return result;
}

template<class SocketType>
void BufferedSocketAcceptor<SocketType>::StopNetwork()
{
    int j;
    for (j = 0; j < BUFFERED_SOCKET_ACCEPTOR_MAX_CLIENTS, j++;)
        DisconnectClient(m_clients[j].get());

    closesocket(m_serverSocket);
    m_serverSocket = INVALID_SOCKET;
    WSACleanup();
}

template<class SocketType>
int BufferedSocketAcceptor<SocketType>::ReceiveClient(SocketType *pClient, char *buffer, int size)
{
    // make sure we dont write out of bounds
    MANGOS_ASSERT((pClient->recvPosition + size) <= BUFFERED_SOCKET_BUFFER_SIZE);

    if (FD_ISSET(pClient->socket, &pClient->socketData))
    {
        pClient->dataLength = recv(pClient->socket, buffer, size, 0);

        if (pClient->dataLength == 0)
            DisconnectClient(pClient);

        return pClient->dataLength;
    }

    return 0;
}

template<class SocketType>
void BufferedSocketAcceptor<SocketType>::ReceiveData()
{
    int j;
    for (j = 0; j < BUFFERED_SOCKET_ACCEPTOR_MAX_CLIENTS; j++)
    {
        if (m_clients[j]->connected)
        {
            if (ReceiveClient(m_clients[j].get(), m_clients[j]->recvBuffer + m_clients[j]->recvPosition, BUFFERED_SOCKET_BUFFER_SIZE - m_clients[j]->recvPosition) > 0)
            {
                m_clients[j]->recvPosition += m_clients[j]->dataLength;
                m_clients[j]->OnRead();
            }
        }
    }
}

template<class SocketType>
bool BufferedSocketAcceptor<SocketType>::SendData(SocketType* pClient, char const* buffer, int size)
{
    pClient->dataLength = send(pClient->socket, buffer, size, 0);
    if ((pClient->dataLength == SOCKET_ERROR) || (pClient->dataLength == 0))
    {
        DisconnectClient(pClient);
        return false;
    }

    return true;
}

template<class SocketType>
bool BufferedSocketAcceptor<SocketType>::StartNetwork(char const* bindIp, uint16 port)
{
    WSADATA wsaData;
    int res, i = 1;
    unsigned long b = 1;

    // make sure we don't start network twice
    MANGOS_ASSERT(m_serverSocket == INVALID_SOCKET);

    m_serverAddress.sin_family = AF_INET;
    m_serverAddress.sin_addr.s_addr = inet_addr(bindIp);
    m_serverAddress.sin_port = htons(port);
    memcpy(&m_serverSocketAddress, &m_serverAddress, sizeof(SOCKADDR_IN));

    res = WSAStartup(MAKEWORD(1, 1), &wsaData);

    if (res != 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to initialize winsock.");
        return false;
    }

    m_serverSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    if (m_serverSocket == INVALID_SOCKET)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid socket.");
        return false;
    }
    else if (m_serverSocket == SOCKET_ERROR)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Socket error.");
        return false;
    }

    setsockopt(m_serverSocket, SOL_SOCKET, SO_REUSEADDR, (char *)&i, sizeof(i));
    res = bind(m_serverSocket, &m_serverSocketAddress, sizeof(m_serverSocketAddress));

    if (res != 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to bind socket.");
        return false;
    }

    res = listen(m_serverSocket, 8);

    if (res != 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to listen on socket.");
        return false;
    }

    ioctlsocket(m_serverSocket, FIONBIO, &b);

    /* Initialize sessions array */
    for (int j = 0; j < BUFFERED_SOCKET_ACCEPTOR_MAX_CLIENTS; j++)
    {
        m_clients[j] = std::make_unique<SocketType>();
        m_clients[j]->index = j;
    }

    return true;
}

template <typename DerivedType, class Acceptor>
bool BufferedSocket<DerivedType, Acceptor>::send(const char *buf, size_t len)
{
    acceptor->SendData((DerivedType*)this, buf, len);
    return connected;
}

template <typename DerivedType, class Acceptor>
void BufferedSocket<DerivedType, Acceptor>::close_connection()
{
    acceptor->DisconnectClient((DerivedType*)this);
}
