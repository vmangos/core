#include "NodeSession.h"
#include "WorldPacket.h"
#include "WorldSocket.h"
#include "World.h"
#include "WorldSession.h"
#include "CharacterDatabaseCache.h"
#include "NodesOpcodes.h"
#include "Serializer.h"
#include "PlayerSerializer.h"

/*** SESSION LOADING ***/
struct PacketLoadSession_Header
{
    // Session
    uint32 accountId;
    uint32 accountMaxLevel;
    uint32 accountFlags;
    AccountTypes sec;
    time_t muteTime;
    LocaleConstant locale;
};

void NodeSession::LoadSession(WorldSession* wsess)
{
    ASSERT(!IsConnectedToMaster());
    PacketLoadSession_Header sessInfos;
    sessInfos.accountId = wsess->GetAccountId();
    sessInfos.accountMaxLevel = wsess->GetAccountMaxLevel();
    sessInfos.accountFlags = wsess->GetAccountFlags();
    sessInfos.sec = wsess->GetSecurity();
    sessInfos.muteTime = wsess->m_muteTime;
    sessInfos.locale = wsess->GetSessionDbcLocale();

    WorldPacket data(MMSG_LOAD_SESSION, sizeof(sessInfos));
    data.append(&sessInfos, 1);
    SendPacket(&data);
    sLog.outString("Sent MMSG_LOAD_SESSION [size=%u | %u]", data.size(),sizeof(sessInfos));

    WorldSocket* sock = wsess->GetSocket();
    if (!sock)
        return;
    sock->AddReference();

    m_socketsLock.acquire_write();
    SocketsMap::iterator it = m_accountSockets.find(wsess->GetAccountId());
    if (it != m_accountSockets.end())
        it->second->RemoveReference();
    m_accountSockets[wsess->GetAccountId()] = sock;
    m_socketsLock.release();
}

void NodeSession::HandleLoadSession(WorldPacket& pkt)
{
    PacketLoadSession_Header loadInfos;
    pkt.read((uint8*)&loadInfos, sizeof(loadInfos));

    WorldSession* wsess = new WorldSession(loadInfos.accountId, NULL, loadInfos.sec, loadInfos.muteTime, loadInfos.locale);
    wsess->SetAccountFlags(loadInfos.accountFlags);
    wsess->SetAccountMaxLevel(loadInfos.accountMaxLevel);
    wsess->SetMasterSession(this);
    sWorld.AddSessionToSessionsMap(wsess);
    sWorld.UpdateMaxSessionCounters();

    sLog.outString("MMSG_LOAD_SESSION: Wsess: %u", loadInfos.accountId);
}

/*** PLAYER DB LOADING **/
struct PacketLoadPlayer_Header
{
    uint32 accountId;
    ObjectGuid playerGuid;
    // TODO: Load group
    // TODO: Load pet cache
    // TODO: Load Guild
};

void NodeSession::LoginPlayer(WorldSession* wsess, ObjectGuid playerGuid)
{
    ASSERT(!IsConnectedToMaster());
    PacketLoadPlayer_Header plInfos;
    plInfos.accountId = wsess->GetAccountId();
    plInfos.playerGuid = playerGuid;

    // TODO: Send cached pets too !
    WorldPacket data(MMSG_LOAD_PLAYER_FROM_DB, sizeof(plInfos));
    data.append(&plInfos, 1);
    SendPacket(&data);
}

void NodeSession::HandleLoadPlayerFromDB(WorldPacket& pkt)
{
    PacketLoadPlayer_Header loadInfos;
    pkt.read((uint8*)&loadInfos, sizeof(loadInfos));

    WorldSession* wsess = sWorld.FindSession(loadInfos.accountId);
    if (!wsess)
    {
        sLog.outError("MMSG_LOAD_PLAYER_FROM_DB: Unable to load player %u (session for acc %u not found)", loadInfos.playerGuid, loadInfos.accountId);
        return;
    }

    wsess->LoginPlayer(loadInfos.playerGuid);
    sLog.outString("MMSG_LOAD_PLAYER_FROM_DB: Wsess: %u Login %u", loadInfos.accountId, loadInfos.playerGuid.GetCounter());
}

/*** SERIALIZED LOADING ***/

void NodeSession::SendPlayer(WorldSession* wsess, Player* player)
{
    PacketLoadPlayer_Header plInfos;
    plInfos.accountId = wsess->GetAccountId();
    plInfos.playerGuid = player->GetObjectGuid();

    WorldPacket data(MSG_LOAD_PLAYER_SERIALIZED, 500);
    data.append(&plInfos, 1);
    MaNGOS::Serializer::WriteSerializer s(data);
    MaNGOS::Serializer::Serialize(s, *player);
    SendPacket(&data);
}

void NodeSession::HandleLoadPlayerSerialized(WorldPacket& pkt)
{
    PacketLoadPlayer_Header loadInfos;
    pkt.read((uint8*)&loadInfos, sizeof(loadInfos));

    WorldSession* wsess = sWorld.FindSession(loadInfos.accountId);
    if (!wsess)
    {
        sLog.outError("MSG_LOAD_PLAYER_SERIALIZED: Unable to load player %u (session for acc %u not found)", loadInfos.playerGuid, loadInfos.accountId);
        return;
    }
    // TODO: Already online, etc ...
    ASSERT(!sObjectAccessor.FindPlayerNotInWorld(loadInfos.playerGuid));

    Player* player = new Player(wsess);
    wsess->SetPlayer(player);
    player->PrepareWakeUp(loadInfos.playerGuid);
    MaNGOS::Serializer::ReadSerializer s(pkt);
    MaNGOS::Serializer::Serialize(s, *player);
    player->WakeUp();
    sObjectAccessor.AddObject(player);

    WorldPacket data(SMSG_NEW_WORLD, 20);
    data << uint32(player->GetTeleportDest().mapid);
    data << float(player->GetTeleportDest().coord_x);
    data << float(player->GetTeleportDest().coord_y);
    data << float(player->GetTeleportDest().coord_z);
    data << float(player->GetTeleportDest().orientation);
    wsess->SendPacket(&data);
}

/** DISCONNECT PLAYER */
void NodeSession::SendDisconnectedFromMaster(uint32 accountId)
{
    ASSERT(!IsConnectedToMaster());

    WorldPacket data(MMSG_SESSION_SOCKET_LOST, 4);
    data << accountId;
    SendPacket(&data);
}

void NodeSession::HandleSessionSocketClosed(WorldPacket& pkt)
{
    uint32 accountId;
    pkt >> accountId;

    WorldSession* sess = sWorld.FindSession(accountId);
    if (!sess)
        return;
    sess->SetMasterSession(NULL); // Will be disconnected after 120 seconds
    sess->ForcePlayerLogoutDelay();
}

void NodeSession::HandleSessionLogoutComplete(WorldPacket& pkt)
{
    uint32 accountId;
    pkt >> accountId;

    WorldSession* sess = sWorld.FindSession(accountId);
    if (!sess)
        return;
    sess->SetNodeSession(NULL);
    sess->LogoutPlayer(false); // Do not save the player, he was already saved on the Node
}

