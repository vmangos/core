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

#ifndef MANGOS_GAME_SERVER_WORLDSOCKET_H
#define MANGOS_GAME_SERVER_WORLDSOCKET_H

#include "IO/Networking/AsyncSocket.h"
#include "Auth/AuthCrypt.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "IO/Timer/TimerHandle.h"

class WorldSocketMgr;

class WorldSocket final : public std::enable_shared_from_this<WorldSocket>
{
    friend WorldSocketMgr;

private:
    enum class HandlerResult
    {
        Okay,
        Fail,
    };

#if defined( __GNUC__ )
#pragma pack(1)
#else
#pragma pack(push,1)
#endif
    struct ClientPktHeader
    {
        uint16 size;
        uint32 cmd;
    };
#if defined( __GNUC__ )
#pragma pack()
#else
#pragma pack(pop)
#endif

    /// Time in which the last ping was received
    std::chrono::system_clock::time_point m_lastPingTime;

    /// Keep track of over-speed pings, to prevent ping flood.
    uint32 m_overSpeedPings;

    /// Class used for managing encryption of the headers
    AuthCrypt m_Crypt; // TODO: Rename me to m_crypt

    /// Session to which received packets are routed
    WorldSession* m_Session; // TODO: Rename me to m_session

    /// Random seed used in SMSG_AUTH_CHALLENGE and CMSG_AUTH_SESSION
    uint32 const m_authSeed;

    /// Session key used to authenticate the client (value from db `account` table)
    //BigNumber m_authSessionKey;

    /// Starting the recv loop
    void Start();

    /// Called by WorldSocketMgr when a new connection is made
    void SendInitialPacketAndStartRecvLoop();

    /// process one incoming packet.
    void DoRecvIncomingData();

    /// Encrypt and write to queue
    void HandleResultOfAsyncWrite(IO::NetworkError const& error, std::shared_ptr<ByteBuffer> const& alreadyAllocatedBuffer);

    HandlerResult _HandleCompleteReceivedPacket(std::unique_ptr<WorldPacket> packet);

    /// Called by ProcessIncoming() on CMSG_AUTH_SESSION.
    HandlerResult _HandleAuthSession(WorldPacket& recvPacket);

    /// Called by ProcessIncoming() on CMSG_PING.
    HandlerResult _HandlePing(WorldPacket& recvPacket);

    std::shared_ptr<IO::Timer::TimerHandle> m_sessionNoAuthTimeout; // nullptr after auth, or if feature is disabled

    std::mutex m_sendQueueLock;
    std::queue<WorldPacket> m_sendQueue;
    std::atomic_flag m_sendQueueIsRunning;

    IO::Networking::AsyncSocket m_socket;
    std::string m_remoteIpAddressStringAfterProxy; // might differ from `m_socket.m_descriptor` if behind proxy

public:
    explicit WorldSocket(IO::Networking::AsyncSocket socket);
    /// The destructor will automatically close the socket
    ~WorldSocket();
    WorldSocket(WorldSocket const&) = delete;
    WorldSocket& operator=(WorldSocket const&) = delete;
    WorldSocket(WorldSocket&&) = delete;
    WorldSocket& operator=(WorldSocket&&) = delete;

    void SendPacket(WorldPacket packet);

    void FinalizeSession()
    {
        m_Session = nullptr;
    }

    // ----- Exposing `m_socket` features -----
    inline std::string const& GetRemoteIpString() const { return m_remoteIpAddressStringAfterProxy; }
    inline bool IsClosing() const { return m_socket.IsClosing(); }
    void CloseSocket();
};

#endif // MANGOS_GAME_SERVER_WORLDSOCKET_H
