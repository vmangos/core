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

#include "IO/Networking/AsyncSocket.h"
#include "Containers/LockFree/RingBuffer.h"
#include "Auth/AuthCrypt.h"
#include "Auth/BigNumber.h"
#include "WorldPacket.h"

#ifndef MANGOS_GAME_SERVER_WORLDSOCKET_H
#define MANGOS_GAME_SERVER_WORLDSOCKET_H

class WorldSocketMgr;

class WorldSocket : public IO::Networking::AsyncSocket<WorldSocket>
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

    static constexpr size_t MAX_BUFFERED_PACKET_COUNT = 1024;
    MaNGOS::Containers::RingBuffer<WorldPacket, MAX_BUFFERED_PACKET_COUNT> m_sendQueue; // TODO make it WorldPacket* to be a trivial data type, in the ~WorldSocket we have to free the rest
    bool m_sendQueueIsRunning;

#ifdef _DEBUG
    //std::deque<uint32> m_opcodeHistoryOut{};
    //std::deque<uint32> m_opcodeHistoryInc{};
#endif

public:
    explicit WorldSocket(IO::IoContext* ctx, IO::Networking::SocketDescriptor const& socketDescriptor);
    ~WorldSocket();

    void Start() final;

    void SendPacket(WorldPacket packet);

    void FinalizeSession() { m_Session = nullptr; }

    //static std::vector<uint32> m_packetCooldowns;
    //std::map<uint32, TimePoint> m_lastPacket;
};

#endif // MANGOS_GAME_SERVER_WORLDSOCKET_H
