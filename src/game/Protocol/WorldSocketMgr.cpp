/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 * Copyright (C) 2017-2024 VMaNGOS Project <https://github.com/vmangos>
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

/** \file WorldSocketMgr.cpp
*  \ingroup u2w
*  \author Derex <derex101@gmail.com>
*/

#include "WorldSocket.h"
#include "WorldSocketMgr.h"
#include "WorldSocket.h"
#include "Log.h"
#include "Policies/SingletonImp.h"
#include "IO/Networking/AsyncSocketAcceptor.h"
#include "IO/Multithreading/CreateThread.h"
#include "ProxyProtocol/ProxyV2Reader.h"

INSTANTIATE_SINGLETON_1(WorldSocketMgr);

bool WorldSocketMgr::StartWorldNetworking(IO::IoContext* ioCtx, WorldSocketMgrOptions const& options)
{
    m_ioContext = ioCtx;
    m_settings = options;

    // Launch the listening network socket
    m_listener = IO::Networking::AsyncSocketAcceptor::CreateAndBindServer(ioCtx, options.bindIp, options.bindPort);
    if (m_listener == nullptr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to start WorldSocket network");
        return false;
    }
    m_listener->AutoAcceptSocketsUntilClose([this](IO::Networking::SocketDescriptor socketDescriptor)
    {
        this->OnNewClientConnected(std::move(socketDescriptor));
    });

    return true;
}

void WorldSocketMgr::StopWorldNetworking()
{
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Stop world networking...");
    if (m_listener != nullptr)
    {
        m_listener->ClosePortAndStopAcceptingNewConnections();
        m_listener = nullptr;
    }
}

void WorldSocketMgr::OnNewClientConnected(IO::Networking::SocketDescriptor socketDescriptor)
{
    // Attach descriptor to AsyncSocket and configure it before attaching it to the WorldSocket
    IO::IoContext* ioContext = GetLeastUsedIoContext();
    auto worldSocket = std::make_shared<WorldSocket>(std::move(IO::Networking::AsyncSocket(ioContext, std::move(socketDescriptor))));
    std::string const& socketIp = worldSocket->m_socket.GetRemoteIpString();

    if (IO::NetworkError initError = worldSocket->m_socket.InitializeAndFixateMemoryLocation())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[%s] Failed to InitializeAndFixateMemoryLocation %s", socketIp.c_str(), initError.ToString().c_str());
        return; // implicit close()
    }

    if (m_settings.socketOutByteBufferSize >= 0)
    {
        IO::NetworkError error = worldSocket->m_socket.SetNativeSocketOption_SystemOutgoingSendBuffer(m_settings.socketOutByteBufferSize);
        if (error)
        { // We don't close the socket, since its basically just a "warning" I guess.
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] Failed to set SystemOutgoingSendBuffer option on socket. Error: %s", socketIp.c_str(), error.ToString().c_str());
        }
    }

    if (m_settings.doExplicitTcpNoDelay) // Set TCP_NODELAY.
    {
        IO::NetworkError error = worldSocket->m_socket.SetNativeSocketOption_NoDelay(true);
        if (error)
        { // We don't close the socket, since its basically just a "warning" I guess.
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] Failed to set NoDelay option on socket. Error: %s", socketIp.c_str(), error.ToString().c_str());
        }
    }

    // Check if the remote endpoint is actually a trusted proxy, so we can retrieve the real client ip
    if (!m_settings.trustedProxyIps.empty() && std::find(m_settings.trustedProxyIps.begin(), m_settings.trustedProxyIps.end(), socketIp) != m_settings.trustedProxyIps.end())
    {
        // parse proxy header
        ProxyProtocol::ReadProxyV2Handshake(&(worldSocket->m_socket), [worldSocket](nonstd::expected<IO::Networking::IpAddress, IO::NetworkError> const& maybeIp)
        {
            if (!maybeIp.has_value())
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] Failed to parse proxy header. Error: %s", worldSocket->m_socket.GetRemoteIpString().c_str(), maybeIp.error().ToString().c_str());
                return; // implicit close()
            }
            worldSocket->m_remoteIpAddressStringAfterProxy = maybeIp.value().ToString();
            sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] Connection accepted (proxy ip: %s)", worldSocket->GetRemoteIpString().c_str(), worldSocket->m_socket.GetRemoteIpString().c_str());
            worldSocket->Start();
        });
    }
    else
    {
        // no proxy, we can start directly
        sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] Connection accepted", worldSocket->GetRemoteIpString().c_str());
        worldSocket->Start();
    }
}

IO::IoContext* WorldSocketMgr::GetLeastUsedIoContext()
{
    // TODO: Currently the main shared ioCtx is used
    //  but we could do a thread affinity here, just like TrinityCore does it.
    //  See `Trinity::SocketMgr::SelectThreadWithMinConnections()`
    return m_ioContext;
}
