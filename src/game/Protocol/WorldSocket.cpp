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

#include "Auth/AuthCrypt.h"
#include "World.h"
#include "AccountMgr.h"
#include "SharedDefines.h"
#include "WorldSession.h"
#include "WorldSocket.h"
#include "WorldSocketMgr.h"
#include "AddonHandler.h"
#include "Opcodes.h"
#include "MangosSocketImpl.h"
#include "ace/OS_NS_netdb.h"
#include "Crypto/Hash/SHA1.h"

template class MangosSocket<WorldSession, WorldSocket, AuthCrypt>;

int WorldSocket::ProcessIncoming(WorldPacket* new_pct)
{
    MANGOS_ASSERT(new_pct);

    // manage memory ;)
    std::unique_ptr<WorldPacket> aptr(new_pct);

    const ACE_UINT16 opcode = new_pct->GetOpcode();

    if (opcode >= NUM_MSG_TYPES)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received nonexistent opcode 0x%.4X", opcode);
        return -1;
    }

    if (closing_)
        return -1;

    new_pct->FillPacketTime(WorldTimer::getMSTime());

    try
    {
        switch (opcode)
        {
            case CMSG_PING:
                return HandlePing(*new_pct);
            case CMSG_AUTH_SESSION:
                if (m_Session)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::ProcessIncoming: Player send CMSG_AUTH_SESSION again");
                    return -1;
                }

                return HandleAuthSession(*new_pct);
            default:
            {
                GuardType lock(m_SessionLock);

                if (m_Session != nullptr)
                {
                    // WARNINIG here we call it with locks held.
                    // Its possible to cause deadlock if QueuePacket calls back
                    m_Session->QueuePacket(std::move(aptr));
                    return 0;
                }
                else
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::ProcessIncoming: Client not authed opcode = %u", uint32(opcode));
                    return -1;
                }
            }
        }
    }
    catch (ByteBufferException &)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::ProcessIncoming ByteBufferException occured while parsing an instant handled packet (opcode: %u) from client %s, accountid=%i.",
                      opcode, GetRemoteAddress().c_str(), m_Session ? m_Session->GetAccountId() : -1);
        if (sLog.HasLogLevelOrHigher(LOG_LVL_DEBUG))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Dumping error-causing packet:");
            new_pct->hexlike();
        }

        if (sWorld.getConfig(CONFIG_BOOL_KICK_PLAYER_ON_BAD_PACKET))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Disconnecting session [account id %i / address %s] for badly formatted packet.",
                       m_Session ? m_Session->GetAccountId() : -1, GetRemoteAddress().c_str());

            return -1;
        }
        else
            return 0;
    }

    ACE_NOTREACHED(return 0);
}

static std::set<std::string> GetServerAddresses()
{
    std::set<std::string> addresses;
    char hostName[MAXHOSTNAMELEN] = {};

    if (ACE_OS::hostname(hostName, MAXHOSTNAMELEN) != -1)
    {
        if (hostent* hp = ACE_OS::gethostbyname(hostName))
        {
            for (int i = 0; hp->h_addr_list[i] != 0; ++i)
            {
                in_addr addr;
                memcpy(&addr, hp->h_addr_list[i], sizeof(in_addr));
                addresses.insert(ACE_OS::inet_ntoa(addr));
            }
        }
    }

    addresses.insert("127.0.0.1");

    return addresses;
}

int WorldSocket::HandleAuthSession(WorldPacket& recvPacket)
{
    // NOTE: ATM the socket is singlethread, have this in mind ...
    Crypto::Hash::SHA1::Digest digest;
    uint32 clientSeed;
    uint32 serverId;
    uint32 clientBuild;
    uint32 id, security;
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
        return -1;
    }

    // Get the account information from the realmd database
    std::string safe_account = account; // Duplicate, else will screw the SHA hash verification below
    LoginDatabase.escape_string(safe_account);
    // No SQL injection, username escaped.
    //                                                                  0        1            2               3            4      5      6             7           8       9             10
    std::unique_ptr<QueryResult> result(LoginDatabase.PQuery("SELECT a.`id`, aa.`gmLevel`, a.`sessionkey`, a.`last_ip`, a.`v`, a.`s`, a.`mutetime`, a.`locale`, a.`os`, a.`platform`, a.`flags`, "
    //      11         12                13
        "a.`email`, a.`email_verif`, ab.`unbandate` > UNIX_TIMESTAMP() OR ab.`unbandate` = ab.`bandate` FROM `account` a LEFT JOIN `account_access` aa ON a.`id` = aa.`id` AND aa.`RealmID` IN (-1, %u) "
        "LEFT JOIN `account_banned` ab ON a.`id` = ab.`id` AND ab.`active` = 1 WHERE a.`username` = '%s' && DATEDIFF(NOW(), a.`last_login`) < 1 ORDER BY aa.`RealmID` DESC LIMIT 1", realmID, safe_account.c_str()));

    // Stop if the account is not found
    if (!result)
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_UNKNOWN_ACCOUNT);

        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Sent Auth Response (unknown account).");
        return -1;
    }

    Field* fields = result->Fetch();

    // Prevent connecting directly to mangosd by checking
    // that same ip connected to realmd previously.
    if (strcmp(fields[3].GetString(), GetRemoteAddress().c_str()) &&
        serverAddressList.find(GetRemoteAddress()) == serverAddressList.end())
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_FAILED);
        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldSocket::HandleAuthSession: Sent Auth Response (Account IP differs).");
        return -1;
    }

    id = fields[0].GetUInt32();
    security = fields[1].GetString() ? fields[1].GetUInt32() : SEC_PLAYER;
    if (security > SEC_ADMINISTRATOR) // prevent invalid security settings in DB
        security = SEC_ADMINISTRATOR;

    K.SetHexStr(fields[2].GetString());
    if (K.AsByteArray().empty())
        return -1;

    time_t mutetime = time_t (fields[6].GetUInt64());
    locale = LocaleConstant(fields[7].GetUInt8());
    if (locale >= MAX_LOCALE)
        locale = LOCALE_enUS;
    os = fields[8].GetCppString();
    platform = fields[9].GetCppString();
    uint32 accFlags = fields[10].GetUInt32();
    std::string email = fields[11].GetCppString();
    bool verifiedEmail = fields[12].GetBool() || email.empty(); // treat no email as verified (created from console)
    bool isBanned = fields[13].GetBool();

    if (isBanned || sAccountMgr.IsIPBanned(GetRemoteAddress()))
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_BANNED);
        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Sent Auth Response (Account banned).");
        return -1;
    }

    // Check locked state for server
    AccountTypes allowedAccountType = sWorld.GetPlayerSecurityLimit();

    if (allowedAccountType > SEC_PLAYER && AccountTypes(security) < allowedAccountType)
    {
        packet.Initialize(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_UNAVAILABLE);
        SendPacket(packet);

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "WorldSocket::HandleAuthSession: User tries to login but his security level is not enough");
        return -1;
    }

    // Check that Key and account name are the same on client and server
    Crypto::Hash::SHA1::Generator sha;

    uint32 t = 0;
    uint32 seed = m_Seed;

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

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Sent Auth Response (authentification failed).");
        return -1;
    }

    std::string address = GetRemoteAddress();

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
        return -1;
    }

    ClientPlatformType clientPlatform;
    if (platform == "x86")
        clientPlatform = CLIENT_PLATFORM_X86;
    else if (platform == "PPC" && clientOs == CLIENT_OS_MAC)
        clientPlatform = CLIENT_PLATFORM_PPC;
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandleAuthSession: Unrecognized Platform '%s' for account '%s' from %s", platform.c_str(), account.c_str(), address.c_str());
        return -1;
    }

    // NOTE ATM the socket is single-threaded, have this in mind ...
    ACE_NEW_RETURN(m_Session, WorldSession(id, this, AccountTypes(security), mutetime, locale), -1);

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
    sAccountMgr.UpdateAccountData(id, account, email, verifiedEmail, AccountTypes(security));

    sWorld.AddSession(m_Session);

    // Create and send the Addon packet
    if (sAddOnHandler.BuildAddonPacket(&recvPacket, &addonPacket))
        SendPacket(addonPacket);

    return 0;
}

int WorldSocket::HandlePing(WorldPacket& recvPacket)
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

    if (m_LastPingTime == ACE_Time_Value::zero)
        m_LastPingTime = ACE_OS::gettimeofday();  // for 1st ping
    else
    {
        ACE_Time_Value cur_time = ACE_OS::gettimeofday();
        ACE_Time_Value diff_time(cur_time);
        diff_time -= m_LastPingTime;
        m_LastPingTime = cur_time;

        if (diff_time < ACE_Time_Value(27))
        {
            ++m_OverSpeedPings;

            uint32 max_count = sWorld.getConfig(CONFIG_UINT32_MAX_OVERSPEED_PINGS);

            if (max_count && m_OverSpeedPings > max_count)
            {
                GuardType lock(m_SessionLock);

                if (m_Session && m_Session->GetSecurity() == SEC_PLAYER)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandlePing: Player kicked for "
                                  "overspeeded pings address = %s",
                                  GetRemoteAddress().c_str());

                    return -1;
                }
            }
        }
        else
            m_OverSpeedPings = 0;
    }

    // critical section
    {
        GuardType lock(m_SessionLock);

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        if (m_Session)
            m_Session->SetLatency(latency);
        else
#else
        if (!m_Session)
#endif
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSocket::HandlePing: peer sent CMSG_PING, "
                          "but is not authenticated or got recently kicked,"
                          " address = %s",
                          GetRemoteAddress().c_str());
            return -1;
        }
    }

    WorldPacket packet(SMSG_PONG, 4);
    packet << ping;
    return SendPacket(packet);
}

int WorldSocket::OnSocketOpen()
{
    return sWorldSocketMgr->OnSocketOpen(this);
}

int WorldSocket::SendStartupPacket()
{
    // Send startup packet.
    WorldPacket packet(SMSG_AUTH_CHALLENGE, 4);
    packet << m_Seed;

    return SendPacket(packet);
}
