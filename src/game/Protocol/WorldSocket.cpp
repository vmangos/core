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

#include "WorldSocket.h"
#include "WorldSocketMgr.h"
#include "WorldSession.h"

#include "Auth/AuthCrypt.h"
#include "World.h"
#include "AccountMgr.h"
#include "SharedDefines.h"
#include "AddonHandler.h"
#include "Opcodes.h"
#include "Crypto/Hash/SHA1.h"
#include "Database/SqlPreparedStatement.h"
#include "Database/DatabaseEnv.h"
#include "DBCStores.h"
#include "Config/Config.h"
#include "Util.h"

#include "IO/Networking/DNS.h"
#include "IO/Timer/AsyncSystemTimer.h"

#include <memory>

#if defined( __GNUC__ )
#pragma pack(1)
#else
#pragma pack(push,1)
#endif
struct ServerPktHeader
{
    uint16 size;
    uint16 cmd;

    char const* data() const
    {
        return reinterpret_cast<char const*>(this);
    }

    std::size_t headerSize() const
    {
        return sizeof(ServerPktHeader);
    }
};
#if defined( __GNUC__ )
#pragma pack()
#else
#pragma pack(pop)
#endif

WorldSocket::WorldSocket(IO::Networking::AsyncSocket socket)
    : m_socket(std::move(socket)),
      m_lastPingTime(std::chrono::system_clock::time_point::min()),
      m_overSpeedPings(0),
      m_Session(nullptr),
      m_authSeed(static_cast<uint32>(rand32())),
      m_remoteIpAddressStringAfterProxy(m_socket.GetRemoteIpString())
{
    m_sendQueueIsRunning.clear(); // there is no atomic_flag::constructor on windows to initialize it with false by default (and if left out, linux is uninitialized and will fail randomly)
}

WorldSocket::~WorldSocket()
{
    CloseSocket();
    sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] Connection closed", GetRemoteIpString().c_str());

    if (m_sessionNoAuthTimeout)
    {
        m_sessionNoAuthTimeout->Cancel();
    }
}

void WorldSocket::DoRecvIncomingData()
{
    std::shared_ptr<ClientPktHeader> header = std::make_shared<ClientPktHeader>();

    m_socket.Read((char*)header.get(), sizeof(ClientPktHeader), [self = shared_from_this(), header](IO::NetworkError const& error, std::size_t) -> void
    {
        if (error)
        {
            if (error.GetErrorType() != IO::NetworkError::ErrorType::SocketClosed || !self->IsClosing()) // only print error if it's not "normal close" related
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] WorldSocket::DoRecvIncomingData: IoError: %s", self->m_socket.GetRemoteIpString().c_str(), error.ToString().c_str());
                self->CloseSocket(); // This call to CloseSocket is actually necessary for once, so that others can see that this socket is not usable anymore
            }
            return;
        }

        // thread safe due to always being called from service context
        self->m_Crypt.DecryptRecv((uint8*)header.get(), sizeof(ClientPktHeader));

        EndianConvertReverse(header->size);
        EndianConvert(header->cmd);

        if ((header->size < 4) || (header->size > 0x2800) || (header->cmd >= NUM_MSG_TYPES))
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] WorldSocket::DoRecvIncomingData: client sent malformed packet size = %u, cmd = %u", self->m_socket.GetRemoteIpString().c_str(), header->size, header->cmd);
            return;
        }

        size_t remainingPacketSize = header->size - sizeof(header->cmd);
        if (remainingPacketSize == 0)
        { // Fastpath, it's probably an OpCode without any data
            auto packet = std::make_unique<WorldPacket>(header->cmd, 0);
            if (self->_HandleCompleteReceivedPacket(std::move(packet)) == HandlerResult::Okay)
                self->DoRecvIncomingData();
        }
        else
        {
            // Allocate WorldPacket once and write into the memory inplace, no need to move or copy stuff
            // Cannot move std::unique_ptr into function capture, so it's wrapped into std::shared_ptr
            std::shared_ptr<std::unique_ptr<WorldPacket>> packetTmpSharedPtr(new std::unique_ptr<WorldPacket>(new WorldPacket(header->cmd, remainingPacketSize)));
            (*packetTmpSharedPtr)->resize(remainingPacketSize);
            self->m_socket.Read((char*)((*packetTmpSharedPtr)->contents()), (*packetTmpSharedPtr)->size(), [self, packetTmpSharedPtr](IO::NetworkError const& error, std::size_t) -> void
            {
                if (error)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldSocket::DoRecvIncomingData: Error %s", error.ToString().c_str());
                    self->CloseSocket();
                    return;
                }

                // by std::moving the content of the shared_ptr, we will separate the unique_ptr out of the shared_ptr.
                if (self->_HandleCompleteReceivedPacket(std::move(*packetTmpSharedPtr)) == HandlerResult::Okay)
                    self->DoRecvIncomingData();
            });
        }
    });
}

WorldSocket::HandlerResult WorldSocket::_HandleCompleteReceivedPacket(std::unique_ptr<WorldPacket> packet)
{
    uint16 const opcode = packet->GetOpcode();

    if (opcode >= NUM_MSG_TYPES)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received nonexistent opcode 0x%.4X", opcode);
        return HandlerResult::Fail;
    }

    if (IsClosing())
        return HandlerResult::Fail;

    packet->FillPacketTime(WorldTimer::getMSTime());

    try
    {
        switch (opcode)
        {
            case CMSG_PING:
                return _HandlePing(*packet);
            case CMSG_AUTH_SESSION:
                if (m_Session != nullptr)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::ProcessIncoming: Player send CMSG_AUTH_SESSION again");
                    return HandlerResult::Fail;
                }
                return _HandleAuthSession(*packet);
            default:
                if (m_Session == nullptr)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::ProcessIncoming: Client not authed opcode = %u", uint32(opcode));
                    return HandlerResult::Fail;
                }

                m_Session->QueuePacket(std::move(packet));
                return HandlerResult::Okay;
        }
    }
    catch (ByteBufferException&)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::ProcessIncoming ByteBufferException occured while parsing an instant handled packet (opcode: %u) from client %s, accountid=%i.", opcode, GetRemoteIpString().c_str(), m_Session ? m_Session->GetAccountId() : -1);

        if (sLog.HasLogLevelOrHigher(LOG_LVL_DEBUG))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Dumping error-causing packet:");
            packet->hexlike();
        }

        if (sWorld.getConfig(CONFIG_BOOL_KICK_PLAYER_ON_BAD_PACKET))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Disconnecting session [account id %i / address %s] for badly formatted packet.",
                       m_Session ? m_Session->GetAccountId() : -1, GetRemoteIpString().c_str());

            return HandlerResult::Fail;
        }

        return HandlerResult::Okay;
    }

    MANGOS_ASSERT(false); // This should never be reached
}

/// This function will resolve the ip-addresse of the current host
/// For example if you hostname is called "world.mycoolserver.com" and it points to 123.45.66.7 it will be added to the server list
/// Also 127.0.0.1 will be added as a fallback
/// This list is later used to determine if clients try to connect to this server without registering at realmd first
static std::set<std::string> GetServerAddresses()
{
    std::set<std::string> addresses;
    addresses.insert("127.0.0.1");

    std::string myHostname = IO::Networking::DNS::GetOwnHostname();
    std::vector<IO::Networking::IpAddress> ipAddresses = IO::Networking::DNS::ResolveDomainAll(myHostname, IO::Networking::IpAddress::Type::IPv4);
    for (auto const& ipAddress : ipAddresses)
    {
        addresses.insert(ipAddress.ToString());
    }

    return addresses;
}

WorldSocket::HandlerResult WorldSocket::_HandleAuthSession(WorldPacket& recvPacket)
{
    Crypto::Hash::SHA1::Digest digest;
    uint32 clientSeed;
    uint32 serverId;
    uint32 clientBuild;
    uint32 accountId;
    AccountTypes security;
    LocaleConstant locale;
    std::string account, os, platform;
    BigNumber K;
    WorldPacket packet, addonPacket;
    static std::set<std::string> const serverAddressList = GetServerAddresses();

    // Read the content of the packet
    recvPacket >> clientBuild;
    recvPacket >> serverId;
    recvPacket >> account;

    recvPacket >> clientSeed;
    recvPacket.read(digest.data(), digest.size());

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WorldSocket::HandleAuthSession: client %u, serverId %u, account %s, clientseed %u",
              clientBuild,
              serverId,
              account.c_str(),
              clientSeed);

    // Check the version of client trying to connect
    if (!IsAcceptableClientBuild(clientBuild))
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_VERSION_MISMATCH);

        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Sent Auth Response (version mismatch).");
        return HandlerResult::Fail;
    }

    // Get the account information from the realmd database
    std::string safe_account = account; // Duplicate, else will screw the SHA hash verification below
    LoginDatabase.escape_string(safe_account);
    // No SQL injection, username escaped.
    auto accountQueryResult =
        LoginDatabase.PQuery("SELECT "
                             "a.`id`, "             // 0
                             "aa.`gmLevel`, "       // 1
                             "a.`sessionkey`, "     // 2
                             "a.`last_ip`, "        // 3
                             "a.`v`, "              // 4
                             "a.`s`, "              // 5
                             "a.`mutetime`, "       // 6
                             "a.`locale`, "         // 7
                             "a.`os`, "             // 8
                             "a.`platform`, "       // 9
                             "a.`flags`, "          // 10
                             "a.`email`, "          // 11
                             "a.`email_verif`, "    // 12
                             "ab.`unbandate` > UNIX_TIMESTAMP() OR ab.`unbandate` = ab.`bandate` " // 13
                             "FROM `account` a "
                             "LEFT JOIN `account_access` aa ON a.`id` = aa.`id` AND aa.`RealmID` IN (-1, %u) "
                             "LEFT JOIN `account_banned` ab ON a.`id` = ab.`id` AND ab.`active` = 1 WHERE a.`username` = '%s' && DATEDIFF(NOW(), a.`last_login`) < 1 "
                             "ORDER BY aa.`RealmID` DESC LIMIT 1", realmID, safe_account.c_str());

    // Stop if the account is not found
    if (!accountQueryResult)
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_UNKNOWN_ACCOUNT);

        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Sent Auth Response (unknown account).");
        return HandlerResult::Fail;
    }

    Field* fields = accountQueryResult->Fetch();

    // Prevent connecting directly to mangosd by checking
    // that same ip connected to realmd previously.
    if (fields[3].GetCppString() != GetRemoteIpString() && serverAddressList.find(GetRemoteIpString()) == serverAddressList.end())
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_FAILED);
        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldSocket::HandleAuthSession: Sent Auth Response (Account IP differs from realmd).");
        return HandlerResult::Fail;
    }

    accountId = fields[0].GetUInt32();
    security = fields[1].GetString() ? (AccountTypes)(fields[1].GetUInt32()) : SEC_PLAYER;
    if (security > SEC_ADMINISTRATOR) // prevent invalid security settings in DB
        security = SEC_ADMINISTRATOR;

    K.SetHexStr(fields[2].GetString());
    if (K.AsByteArray().empty())
        return HandlerResult::Fail;

    time_t mutetime = time_t(fields[6].GetUInt64());
    locale = LocaleConstant(fields[7].GetUInt8());
    if (locale >= MAX_LOCALE)
        locale = LOCALE_enUS;
    os = fields[8].GetCppString();
    platform = fields[9].GetCppString();
    uint32 accFlags = fields[10].GetUInt32();
    std::string email = fields[11].GetCppString();
    bool verifiedEmail = fields[12].GetBool() || email.empty(); // treat no email as verified (created from console)
    bool isBanned = fields[13].GetBool();

    if (isBanned || sAccountMgr.IsIPBanned(GetRemoteIpString()))
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_BANNED);
        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Sent Auth Response (Account banned).");
        return HandlerResult::Fail;
    }

    // Check locked state for server
    AccountTypes allowedAccountType = sWorld.GetPlayerSecurityLimit();

    if (allowedAccountType > SEC_PLAYER && security < allowedAccountType)
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_UNAVAILABLE);
        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldSocket::HandleAuthSession: User tries to login but his security level is not enough");
        return HandlerResult::Fail;
    }

    // Check that Key and account name are the same on client and server
    Crypto::Hash::SHA1::Generator sha;

    uint32 t = 0;
    uint32 seed = m_authSeed;

    sha.UpdateData(account);
    sha.UpdateData((uint8 *) &t, 4);
    sha.UpdateData((uint8 *) &clientSeed, 4);
    sha.UpdateData((uint8 *) &seed, 4);
    sha.UpdateData(K);
    auto expectedDigest = sha.GetDigest();

    if (digest != expectedDigest)
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_FAILED);
        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Sent Auth Response (authentification failed), account ID: %u.", accountId);
        return HandlerResult::Fail;
    }

    std::string address = GetRemoteIpString();

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WorldSocket::HandleAuthSession: Client '%s' authenticated successfully from %s.",
              account.c_str(),
              address.c_str());

    // Update the last_ip in the database
    // No SQL injection, username escaped.
    static SqlStatementID updAccount;

    SqlStatement stmt = LoginDatabase.CreateStatement(updAccount, "UPDATE `account` SET `last_ip` = ? WHERE `username` = ?");
    stmt.PExecute(address.c_str(), account.c_str());

    ClientOSType clientOs;
    if (os == "Win")
        clientOs = CLIENT_OS_WIN;
    else if (os == "OSX")
        clientOs = CLIENT_OS_MAC;
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Unrecognized OS '%s' for account '%s' from %s", os.c_str(), account.c_str(), address.c_str());
        return HandlerResult::Fail;
    }

    ClientPlatformType clientPlatform;
    if (platform == "x86")
        clientPlatform = CLIENT_PLATFORM_X86;
    else if (platform == "PPC" && clientOs == CLIENT_OS_MAC)
        clientPlatform = CLIENT_PLATFORM_PPC;
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Unrecognized Platform '%s' for account '%s' from %s", platform.c_str(), account.c_str(), address.c_str());
        return HandlerResult::Fail;
    }


    // ===== Auth was successful =====
    if (this->m_sessionNoAuthTimeout)
    {
        this->m_sessionNoAuthTimeout->Cancel();
        this->m_sessionNoAuthTimeout = nullptr;
    }

    m_Session = new WorldSession(accountId, this->shared_from_this(), security, mutetime, locale);

    m_Crypt.SetKey(K.AsByteArray());
    m_Crypt.Init();

    m_Session->SetUsername(account);
    m_Session->SetGameBuild(clientBuild);
    m_Session->SetAccountFlags(accFlags);
    m_Session->SetOS(clientOs);
    m_Session->SetPlatform(clientPlatform);
    m_Session->SetVerifiedEmail(verifiedEmail);
    m_Session->SetSessionKey(K);
    m_Session->LoadGlobalAccountData();
    m_Session->LoadTutorialsData();
    sAccountMgr.UpdateAccountData(accountId, account, email, verifiedEmail, security);

    sWorld.AddSession(m_Session);

    // Create and send the Addon packet
    if (sAddOnHandler.BuildAddonPacket(&recvPacket, &addonPacket))
        SendPacket(addonPacket);

    return HandlerResult::Okay;
}

WorldSocket::HandlerResult WorldSocket::_HandlePing(WorldPacket& recvPacket)
{
    uint32 ping;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    uint32 latency;
#endif

    // Get the ping packet content
    recvPacket >> ping;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    recvPacket >> latency;
#endif

    if (m_lastPingTime == std::chrono::system_clock::time_point::min())
        m_lastPingTime = std::chrono::system_clock::now();              // for 1st ping
    else
    {
        auto now = std::chrono::system_clock::now();
        std::chrono::seconds seconds = std::chrono::duration_cast<std::chrono::seconds>(now - m_lastPingTime);
        m_lastPingTime = now;

        if (seconds.count() < 27)
        {
            ++m_overSpeedPings;

            uint32 maxAllowedOverspeedPings = sWorld.getConfig(CONFIG_UINT32_MAX_OVERSPEED_PINGS);
            if (maxAllowedOverspeedPings && m_overSpeedPings > maxAllowedOverspeedPings)
            {
                if (m_Session && m_Session->GetSecurity() == SEC_PLAYER)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandlePing: Player kicked for overspeeded pings address = %s", GetRemoteIpString().c_str());
                    return HandlerResult::Fail;
                }
            }
        }
        else
        {
            m_overSpeedPings = 0;
        }
    }

    // critical section
    {
        if (m_Session)
        {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
            m_Session->SetLatency(latency);
#endif
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandlePing: peer sent CMSG_PING, but is not authenticated or got recently kicked, address = %s", GetRemoteIpString().c_str());
            return HandlerResult::Fail;
        }
    }

    WorldPacket packet(SMSG_PONG, 4);
    packet << ping;
    SendPacket(packet);

    return HandlerResult::Okay;
}

void WorldSocket::SendInitialPacketAndStartRecvLoop()
{
    // Send startup packet.
    WorldPacket packet(SMSG_AUTH_CHALLENGE, 4);
    packet << m_authSeed;

    SendPacket(packet);

    DoRecvIncomingData();
}

void WorldSocket::SendPacket(WorldPacket packet)
{
    if (IsClosing())
        return;

    // We don't want to allocate or encrypt anything inside the world thread, so we move everything to the IO thread.
    m_sendQueueLock.lock();
    if (m_sendQueue.size() > 1024) // There should never be so many packets queued up. The socket is probably not responding.
    {
        m_sendQueueLock.unlock();
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] Send queue is full. Disconnecting.", GetRemoteIpString().c_str());
        CloseSocket();
        return;
    }
    m_sendQueue.push(std::move(packet));
    m_sendQueueLock.unlock();

    // Start AsyncProcessingSendQueue which take things from the queue
    if (m_sendQueueIsRunning.test_and_set())
        return; // already running

    m_socket.EnterIoContext([self = shared_from_this()](IO::NetworkError error)
    {
        self->HandleResultOfAsyncWrite(error, std::make_shared<ByteBuffer>());
    });
}

void WorldSocket::HandleResultOfAsyncWrite(IO::NetworkError const& error, std::shared_ptr<ByteBuffer> const& alreadyAllocatedBuffer)
{
    if (error)
    {
        if (error.GetErrorType() != IO::NetworkError::ErrorType::SocketClosed || !IsClosing()) // only print error if it's not "normal close" related
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] WorldSocket::HandleResultOfAsyncWrite: IoError: %s", GetRemoteIpString().c_str(), error.ToString().c_str());
            CloseSocket(); // This call to CloseSocket is actually necessary for once, so that others can see that this socket is not usable anymore
        }

        m_sendQueueIsRunning.clear();
        return;
    }

    if (m_sendQueue.empty())
    {
        m_sendQueueIsRunning.clear();
        return;
    }

    // Combine all packets into `alreadyAllocatedBuffer`
    alreadyAllocatedBuffer->clear();
    while (!m_sendQueue.empty())
    {
        m_sendQueueLock.lock();
        if (m_sendQueue.empty()) // re-check after we locked the queue if it's really not empty
        {
            m_sendQueueLock.unlock();
            break;
        }
        WorldPacket packet = std::move(m_sendQueue.front());
        m_sendQueue.pop();
        m_sendQueueLock.unlock();

        ServerPktHeader header{};

        header.cmd = packet.GetOpcode();
        EndianConvert(header.cmd);

        header.size = static_cast<uint16>(packet.size() + 2);
        EndianConvertReverse(header.size);

        m_Crypt.EncryptSend(reinterpret_cast<uint8*>(&header), sizeof(header)); // in vanilla versions of the game only the header is encrypted

        alreadyAllocatedBuffer->append(header.data(), header.headerSize());
        if (!packet.empty())
            alreadyAllocatedBuffer->append(packet.contents(), packet.size());
    }

    m_socket.Write({ alreadyAllocatedBuffer /* dont move, re-used in lambda */ }, [self = shared_from_this(), alreadyAllocatedBuffer](IO::NetworkError const& error)
    {
        self->HandleResultOfAsyncWrite(error, alreadyAllocatedBuffer);
    });
}

void WorldSocket::Start()
{
    // Start auto timeout loop
    if (int secs = sConfig.GetIntDefault("Network.TimeoutSecsIfNoAuth", 10))
    {
        m_sessionNoAuthTimeout = sAsyncSystemTimer.ScheduleFunctionOnce(std::chrono::seconds(secs), [this]()
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_DETAIL, "[%s] Connection has reached TimeoutSecsIfNoAuth. Closing socket...", this->GetRemoteIpString().c_str());
            // It's correct that we capture _this_ and not a shared_ptr, since the timer will be canceled in destructor
            this->CloseSocket();
        });
    }

    SendInitialPacketAndStartRecvLoop();
}

void WorldSocket::CloseSocket()
{
    m_socket.CloseSocket();
}
