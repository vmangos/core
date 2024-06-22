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
    \ingroup u2w
*/

#include "WorldSocket.h"                                    // must be first to make ACE happy with ACE includes in it
#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "Group.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "World.h"
#include "BattleGroundMgr.h"
#include "MapManager.h"
#include "SocialMgr.h"
#include "PlayerBotMgr.h"
#include "PlayerBotAI.h"
#include "Anticheat.h"
#include "Language.h"
#include "Auth/Sha1.h"
#include "Chat.h"
#include "MasterPlayer.h"

#include <openssl/md5.h>

// select opcodes appropriate for processing in Map::Update context for current session state
static bool MapSessionFilterHelper(WorldSession* session, OpcodeHandler const& opHandle)
{
    // we do not process not logged in player packets
    Player* plr = session->GetPlayer();
    if (!plr)
        return false;

    // in Map::Update() we do not process packets where player is not in world!
    return plr->IsInWorld();
}


bool MapSessionFilter::Process(std::unique_ptr<WorldPacket> const& packet)
{
    OpcodeHandler const& opHandle = opcodeTable[packet->GetOpcode()];
    // let's check if our opcode can be really processed in Map::Update()
    return MapSessionFilterHelper(m_pSession, opHandle);
}

static uint32 g_sessionCounter = 0;

// WorldSession constructor
WorldSession::WorldSession(uint32 id, WorldSocket *sock, AccountTypes sec, time_t mute_time, LocaleConstant locale) :
    m_guid(g_sessionCounter++), m_muteTime(mute_time), m_connected(true), m_disconnectTimer(0), m_who_recvd(false), m_ah_list_recvd(false),
    m_accountFlags(0), m_idleTime(WorldTimer::getMSTime()), _player(nullptr), m_socket(sock), m_security(sec), m_accountId(id),
    m_exhaustionState(0), m_createTime(time(nullptr)), m_previousPlayTime(0), m_logoutTime(0), m_inQueue(false),
    m_playerLoading(false), m_playerLogout(false), m_playerRecentlyLogout(false), m_playerSave(false), m_sessionDbcLocale(sWorld.GetAvailableDbcLocale(locale)),
    m_sessionDbLocaleIndex(sObjectMgr.GetIndexForLocale(locale)), m_latency(0), m_tutorialState(TUTORIALDATA_UNCHANGED), m_warden(nullptr), m_cheatData(nullptr),
    m_bot(nullptr), m_clientOS(CLIENT_OS_UNKNOWN), m_clientPlatform(CLIENT_PLATFORM_UNKNOWN), m_gameBuild(0),
    m_charactersCount(10), m_characterMaxLevel(0), m_lastPubChannelMsgTime(0), m_moveRejectTime(0), m_masterPlayer(nullptr)
{
    if (sock)
    {
        m_address = sock->GetRemoteAddress();
        sock->AddReference();
    }
    else
        m_address = "<BOT>";
}

// WorldSession destructor
WorldSession::~WorldSession()
{
    // unload player if not unloaded
    if (_player)
        LogoutPlayer(!m_bot || sPlayerBotMgr.IsSavingAllowed());

    // If have unclosed socket, close it
    if (m_socket)
    {
        m_socket->CloseSocket();
        m_socket->RemoveReference();
        m_socket = nullptr;
    }

    // empty incoming packet queue
    for (auto& i : m_recvQueue)
        i.clear();

    if (m_warden)
        sAnticheatMgr->RemoveWardenSession(m_warden);

    delete m_cheatData;
}

// Get the player name
char const* WorldSession::GetPlayerName() const
{
    return GetPlayer() ? GetPlayer()->GetName() : "<none>";
}

// Send a packet to the client
void WorldSession::SendPacket(WorldPacket const* packet)
{
    // There is a maximum size packet.
    if (packet->size() > 0x8000)
    {
        // Packet will be rejected by client
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[NETWORK] Packet %s size %u is too large. Not sent [Account %u Player %s]", LookupOpcodeName(packet->GetOpcode()), packet->size(), GetAccountId(), GetPlayerName());
        return;
    }

    if (!m_socket)
    {
        if (GetBot() && GetBot()->ai)
            GetBot()->ai->OnPacketReceived(packet);
        return;
    }

    SendPacketImpl(packet);
}

void WorldSession::SendPacketImpl(WorldPacket const* packet)
{
#ifdef _DEBUG

    // Code for network use statistic
    static uint64 sendPacketCount = 0;
    static uint64 sendPacketBytes = 0;

    static time_t firstTime = time(nullptr);
    static time_t lastTime = firstTime;                     // next 60 secs start time

    static uint64 sendLastPacketCount = 0;
    static uint64 sendLastPacketBytes = 0;

    time_t cur_time = time(nullptr);

    if ((cur_time - lastTime) < 60)
    {
        sendPacketCount += 1;
        sendPacketBytes += packet->size();

        sendLastPacketCount += 1;
        sendLastPacketBytes += packet->size();
    }
    else
    {
        uint64 minTime = uint64(cur_time - lastTime);
        uint64 fullTime = uint64(lastTime - firstTime);
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Send all time packets count: " UI64FMTD " bytes: " UI64FMTD " avr.count/sec: %f avr.bytes/sec: %f time: %u", sendPacketCount, sendPacketBytes, float(sendPacketCount) / fullTime, float(sendPacketBytes) / fullTime, uint32(fullTime));
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Send last min packets count: " UI64FMTD " bytes: " UI64FMTD " avr.count/sec: %f avr.bytes/sec: %f", sendLastPacketCount, sendLastPacketBytes, float(sendLastPacketCount) / minTime, float(sendLastPacketBytes) / minTime);

        lastTime = cur_time;
        sendLastPacketCount = 1;
        sendLastPacketBytes = packet->wpos();               // wpos is real written size
    }

#endif                                                  // !_DEBUG

    // sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[%s]Send packet : %u|0x%x (%s)", GetPlayerName(), packet->GetOpcode(), packet->GetOpcode(), LookupOpcodeName(packet->GetOpcode()));
    if (m_sniffFile)
        m_sniffFile->WritePacket(*packet, false, time(nullptr));

    if (m_socket->SendPacket(*packet) == -1)
        m_socket->CloseSocket();
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
void WorldSession::SendMovementPacket(WorldPacket const* packet)
{
    // There is a maximum size packet.
    if (packet->size() > 0x8000)
    {
        // Packet will be rejected by client
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[NETWORK] Packet %s size %u is too large. Not sent [Account %u Player %s]", LookupOpcodeName(packet->GetOpcode()), packet->size(), GetAccountId(), GetPlayerName());
        return;
    }

    if (!m_socket)
    {
        if (GetBot() && GetBot()->ai)
            GetBot()->ai->OnPacketReceived(packet);
        return;
    }

    if (++m_movePacketsSentThisInterval < sWorld.getConfig(CONFIG_UINT32_COMPRESSION_MOVEMENT_COUNT) &&
        m_movePacketsSentLastInterval < sWorld.getConfig(CONFIG_UINT32_COMPRESSION_MOVEMENT_COUNT))
    {
        SendPacketImpl(packet);
        return;
    }
        
    std::lock_guard<std::mutex> guard(m_movementPacketCompressorMutex);
    if (m_movementPacketCompressor.CanAddPacket(*packet))
        m_movementPacketCompressor.AddPacket(*packet);
    else
    {
        // send batched packets first to maintain order of packets
        SendCompressedMovementPackets();
        SendPacketImpl(packet);
    }
}

void WorldSession::SendCompressedMovementPackets()
{
    if (m_movementPacketCompressor.HasData())
    {
        WorldPacket packet;
        if (m_movementPacketCompressor.BuildPacket(packet))
            SendPacket(&packet);
        else
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Movement packet compression failed! Packets lost!");
        m_movementPacketCompressor.ClearBuffer();
    }
}
#else
void WorldSession::SendMovementPacket(WorldPacket const* packet)
{
    SendPacket(packet);
}
#endif

uint32 GetChatPacketProcessingType(uint32 chatType)
{
    switch (chatType)
    {
        // These can be handled at any time session update in world thread is not running.
        case CHAT_MSG_CHANNEL:
        case CHAT_MSG_WHISPER:
        case CHAT_MSG_PARTY:
        case CHAT_MSG_GUILD:
        case CHAT_MSG_OFFICER:
        case CHAT_MSG_RAID:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        case CHAT_MSG_RAID_LEADER:
        case CHAT_MSG_RAID_WARNING:
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
        case CHAT_MSG_BATTLEGROUND:
        case CHAT_MSG_BATTLEGROUND_LEADER:
#endif
        case CHAT_MSG_DND:
            return PACKET_PROCESS_ASYNC;
        // These can be handled on the map thread.
        case CHAT_MSG_SAY:
        case CHAT_MSG_EMOTE:
        case CHAT_MSG_YELL:
            return PACKET_PROCESS_MAP;
    }

    return PACKET_PROCESS_WORLD;
}

// Add an incoming packet to the queue
void WorldSession::QueuePacket(std::unique_ptr<WorldPacket> newPacket)
{
    if (m_sniffFile)
        m_sniffFile->WritePacket(*newPacket, true, time(nullptr));

    if (_player && MovementAnticheat::IsLoggedOpcode(newPacket->GetOpcode()))
        GetCheatData()->LogMovementPacket(true, *newPacket);

    uint32 processing;

    // Handle chat packets on async thread when possible
    if (newPacket->GetOpcode() == CMSG_MESSAGECHAT &&
        newPacket->size() >= sizeof(uint32))
        processing = GetChatPacketProcessingType(*((uint32*)newPacket->contents()));
    else
    {
        OpcodeHandler const& opHandle = opcodeTable[newPacket->GetOpcode()];
        processing = opHandle.packetProcessing;

        if (processing >= PACKET_PROCESS_MAX_TYPE)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: opcode %s (0x%.4X) will be skipped",
                LookupOpcodeName(newPacket->GetOpcode()),
                newPacket->GetOpcode());
            return;
        }
    }

    m_recvQueue[processing].add(std::move(newPacket));
}

// Logging helper for unexpected opcodes
void WorldSession::LogUnexpectedOpcode(WorldPacket* packet, char const* reason)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "SESSION: received unexpected opcode %s (0x%.4X) %s",
                  LookupOpcodeName(packet->GetOpcode()),
                  packet->GetOpcode(),
                  reason);
}

// Logging helper for unexpected opcodes
void WorldSession::LogUnprocessedTail(WorldPacket* packet)
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: opcode %s (0x%.4X) have unprocessed tail data (read stop at " SIZEFMTD " from " SIZEFMTD ")",
                  LookupOpcodeName(packet->GetOpcode()),
                  packet->GetOpcode(),
                  packet->rpos(), packet->wpos());
}

void WorldSession::CheckPlayedTimeLimit(time_t now)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    time_t const currentPlayed = GetConsecutivePlayTime(now);

    if (currentPlayed >= PLAY_TIME_LIMIT_FULL)
    {
        if (m_exhaustionState < PLAY_TIME_LIMIT_FULL)
        {
            SendPlayTimeWarning(PTF_UNHEALTHY_TIME, 0);
            GetPlayer()->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_PLAY_TIME);
            GetPlayer()->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_PARTIAL_PLAY_TIME);
            m_exhaustionState = PLAY_TIME_LIMIT_FULL;
        }
    }
    else if (currentPlayed >= PLAY_TIME_LIMIT_APPROCHING_FULL)
    {
        if (m_exhaustionState < PLAY_TIME_LIMIT_APPROCHING_FULL)
        {
            SendPlayTimeWarning(PTF_APPROACHING_NO_PLAY_TIME, int32(PLAY_TIME_LIMIT_FULL - currentPlayed));
            GetPlayer()->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_PARTIAL_PLAY_TIME);
            GetPlayer()->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_PLAY_TIME);
            m_exhaustionState = PLAY_TIME_LIMIT_APPROCHING_FULL;
        }
    }
    else if (currentPlayed >= PLAY_TIME_LIMIT_PARTIAL)
    {
        if (m_exhaustionState < PLAY_TIME_LIMIT_PARTIAL)
        {
            SendPlayTimeWarning(PTF_APPROACHING_NO_PLAY_TIME, int32(PLAY_TIME_LIMIT_FULL - currentPlayed));
            GetPlayer()->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_PARTIAL_PLAY_TIME);
            GetPlayer()->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_PLAY_TIME);
            m_exhaustionState = PLAY_TIME_LIMIT_PARTIAL;
        }
    }
    else if (currentPlayed >= PLAY_TIME_LIMIT_APPROACHING_PARTIAL)
    {
        if (m_exhaustionState < PLAY_TIME_LIMIT_APPROACHING_PARTIAL)
        {
            SendPlayTimeWarning(PTF_APPROACHING_PARTIAL_PLAY_TIME, int32(PLAY_TIME_LIMIT_PARTIAL - currentPlayed));
            m_exhaustionState = PLAY_TIME_LIMIT_APPROACHING_PARTIAL;
        }
    }
#endif
}

void WorldSession::SendPlayTimeWarning(PlayTimeFlag flag, int32 timeLeftInSeconds)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    WorldPacket data(SMSG_PLAY_TIME_WARNING, sizeof(uint32) + sizeof(int32));
    data << uint32(flag);
    data << int32(timeLeftInSeconds);
    SendPacket(&data);
#endif
}

bool WorldSession::ForcePlayerLogoutDelay()
{
    if (!sWorld.IsStopped() && GetPlayer() && GetPlayer()->FindMap() && GetPlayer()->IsInWorld())
    {
        if (GetBot())
        {
            GetPlayer()->RemoveFromGroup();
        }
        else if (sWorld.getConfig(CONFIG_BOOL_FORCE_LOGOUT_DELAY))
        {
            sLog.Player(this, LOG_CHAR, "LostSocket", LOG_LVL_BASIC, "");
            SetDisconnectedSession();
            m_disconnectTimer = 120000;
            GetPlayer()->OnDisconnected();
            GetPlayer()->SaveToDB();
            return true;
        }
    }
    return false;
}

// Update the WorldSession (triggered by World update)
bool WorldSession::Update(PacketFilter& updater)
{
    uint32 sessionUpdateTime = WorldTimer::getMSTime();
    for (uint32 & i : m_floodPacketsCount)
        i = 0;

    // Retrieve packets from the receive queue and call the appropriate handlers
    ProcessPackets(updater);

    if (CharacterScreenIdleKick(sessionUpdateTime))
        return false;

    sessionUpdateTime = WorldTimer::getMSTimeDiffToNow(sessionUpdateTime);

    if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_UNIQUE_SESSION_UPDATE) && sessionUpdateTime > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_UNIQUE_SESSION_UPDATE))
        sLog.Out(LOG_PERFORMANCE, LOG_LVL_MINIMAL, "Slow session update: %ums. Account %u on IP %s", sessionUpdateTime, GetAccountId(), GetRemoteAddress().c_str());

    //check if we are safe to proceed with logout
    //logout procedure should happen only in World::UpdateSessions() method!!!
    if (updater.ProcessLogout())
    {
        if (m_bot != nullptr && m_bot->state == PB_STATE_OFFLINE)
        {
            LogoutPlayer(sPlayerBotMgr.IsSavingAllowed());
            return false;
        }

        // Cleanup socket pointer if need
        if (m_socket && m_socket->IsClosed())
        {
            m_socket->RemoveReference();
            m_socket = nullptr;

            if (m_warden)
            {
                sAnticheatMgr->RemoveWardenSession(m_warden);
                m_warden = nullptr;
            }

            // Character stays IG for 2 minutes
            return ForcePlayerLogoutDelay();
        }

        time_t const currTime = time(nullptr);

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
        // send these out every world update
        SendCompressedMovementPackets();

        // only enable compression when there's a lot of movement around us
        if (m_movePacketTrackingIntervalStart + 10 < currTime)
        {
            m_movePacketTrackingIntervalStart = currTime;
            m_movePacketsSentLastInterval = m_movePacketsSentThisInterval;
            m_movePacketsSentThisInterval = 0;
        }
#endif
        
        if (sWorld.getConfig(CONFIG_BOOL_LIMIT_PLAY_TIME) &&
            GetPlayer() && GetPlayer()->IsInWorld())
            CheckPlayedTimeLimit(currTime);

        ///- If necessary, log the player out
        bool const forceConnection = !sWorld.IsStopped() && sPlayerBotMgr.ForceAccountConnection(this);

        if ((!m_socket || (ShouldLogOut(currTime) && !m_playerLoading)) && !forceConnection && m_bot == nullptr)
            LogoutPlayer(true);

        if (!m_socket && !forceConnection && this->m_bot == nullptr)
            return false;                                       //Will remove this session from the world session map
    }
    else // Async map based update
    {
        if (GetMasterPlayer() && GetPlayer())
        {
            GetMasterPlayer()->LoadPlayer(GetPlayer());
            GetMasterPlayer()->Update();
        }
        // else
        // TODO: Broadcast MasterPlayer update to Master
    }

    return true;
}

bool WorldSession::CanProcessPackets() const
{
    return ((m_socket && !m_socket->IsClosed()) || (_player && (m_bot || sPlayerBotMgr.IsChatBot(_player->GetGUIDLow()))));
}

void WorldSession::ProcessPackets(PacketFilter& updater)
{
    std::unique_ptr<WorldPacket> packet;
    m_receivedPacketType[updater.PacketProcessType()] = false;
    while (CanProcessPackets() && m_recvQueue[updater.PacketProcessType()].next(packet, updater))
    {
        m_receivedPacketType[updater.PacketProcessType()] = true;
        if (!AllowPacket(packet->GetOpcode()))
            break;

        OpcodeHandler const& opHandle = opcodeTable[packet->GetOpcode()];
        try
        {
            uint32 packetTime = WorldTimer::getMSTime();
            switch (opHandle.status)
            {
                case STATUS_LOGGEDIN:

                    if (!_player)
                    {
                        // skip STATUS_LOGGEDIN opcode unexpected errors if player logout sometime ago - this can be network lag delayed packets
                        if (!m_playerRecentlyLogout)
                            LogUnexpectedOpcode(packet.get(), "the player has not logged in yet");
                    }
                    else if (_player->IsInWorld())
                        ExecuteOpcode(opHandle, packet.get());

                    // lag can cause STATUS_LOGGEDIN opcodes to arrive after the player started a transfer
                    break;
                case STATUS_LOGGEDIN_OR_RECENTLY_LOGGEDOUT:
                    if (!_player && !m_playerRecentlyLogout)
                        LogUnexpectedOpcode(packet.get(), "the player has not logged in yet and not recently logout");
                    else
                        // not expected _player or must checked in packet hanlder
                        ExecuteOpcode(opHandle, packet.get());
                    break;
                case STATUS_TRANSFER:
                    if (!_player)
                        LogUnexpectedOpcode(packet.get(), "the player has not logged in yet");
                    else if (_player->IsInWorld())
                        LogUnexpectedOpcode(packet.get(), "the player is still in world");
                    else
                        ExecuteOpcode(opHandle, packet.get());
                    break;
                case STATUS_AUTHED:
                    // prevent cheating with skip queue wait
                    if (m_inQueue)
                    {
                        LogUnexpectedOpcode(packet.get(), "the player is still in queue");
                        break;
                    }

                    // single from authed time opcodes send in to after logout time
                    // and before other STATUS_LOGGEDIN_OR_RECENTLY_LOGGOUT opcodes.
                    m_playerRecentlyLogout = false;

                    ExecuteOpcode(opHandle, packet.get());
                    break;
                case STATUS_NEVER:
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received not allowed opcode %s (0x%.4X)",
                                  opHandle.name,
                                  packet->GetOpcode());
                    break;
                case STATUS_UNHANDLED:
                    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "SESSION: received not handled opcode %s (0x%.4X)",
                              opHandle.name,
                              packet->GetOpcode());
                    break;
                default:
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received wrong-status-req opcode %s (0x%.4X)",
                                  opHandle.name,
                                  packet->GetOpcode());
                    break;
            }
            packetTime = WorldTimer::getMSTimeDiffToNow(packetTime);
            if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_PACKET) && packetTime > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_PACKET))
                sLog.Out(LOG_PERFORMANCE, LOG_LVL_MINIMAL, "Slow packet opcode %s: %ums. Account %u on IP %s", opHandle.name, packetTime, GetAccountId(), GetRemoteAddress().c_str());
        }
        catch (ByteBufferException &)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::Update ByteBufferException occured while parsing a packet (opcode:0x%x) from client %s, accountid=%i.",
                          packet->GetOpcode(), GetRemoteAddress().c_str(), GetAccountId());
            if (sLog.HasLogLevelOrHigher(LOG_LVL_DEBUG))
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Dumping error causing packet:");
                packet->hexlike();
            }

            if (sWorld.getConfig(CONFIG_BOOL_KICK_PLAYER_ON_BAD_PACKET))
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Disconnecting session [account id %u / address %s] for badly formatted packet.",
                           GetAccountId(), GetRemoteAddress().c_str());
                ProcessAnticheatAction("Anticrash", "ByteBufferException", CHEAT_ACTION_KICK);
            }
        }
        catch (std::runtime_error &e)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "CATCH Exception 'ASSERT' for account %u / IP %s", GetAccountId(), GetRemoteAddress().c_str());
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, e.what());
            ProcessAnticheatAction("Anticrash", "ASSERT failed", CHEAT_ACTION_KICK);
        }
        catch (...)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "CATCH Unknown exception. Account %u / IP %s", GetAccountId(), GetRemoteAddress().c_str());
            ProcessAnticheatAction("Anticrash", "Exception raised", CHEAT_ACTION_KICK);
        }
    }
}


void WorldSession::ClearIncomingPacketsByType(PacketProcessing type)
{
    ASSERT(type < PACKET_PROCESS_MAX_TYPE);
    m_recvQueue[type].clear();
}

void WorldSession::SetDisconnectedSession()
{
    m_connected = false;
    StopSniffing();
    sWorld.SetSessionDisconnected(this);
}

bool WorldSession::UpdateDisconnected(uint32 diff)
{
    ASSERT(!m_connected);
    if (!_player || !_player->IsInWorld() || !_player->FindMap())
        return false;
    if (m_disconnectTimer < diff)
        return false; // Delete this session
    m_disconnectTimer -= diff;
    return true;
}

// %Log the player out
void WorldSession::LogoutPlayer(bool Save)
{
    // finish pending transfers before starting the logout
    /* while(_player && _player->IsBeingTeleportedFar())
        HandleMoveWorldportAckOpcode(); */

    m_idleTime = WorldTimer::getMSTime();
    m_playerLogout = true;
    m_playerSave = Save;

    if (_player)
    {
        bool inWorld = _player->IsInWorld() && _player->FindMap();

        sLog.Player(this, LOG_CHAR, "Logout", LOG_LVL_DETAIL, "");

        if (ObjectGuid lootGuid = GetPlayer()->GetLootGuid())
            DoLootRelease(lootGuid);

        if (inWorld)
        {
            // If the player just died before logging out, make him appear as a ghost
            if (_player->GetDeathTimer())
            {
                _player->GetHostileRefManager().deleteReferences();
                _player->BuildPlayerRepop();
                _player->RepopAtGraveyard();
            }
            else if (_player->IsInCombat())
            {
                _player->CombatStop();
                _player->GetHostileRefManager().setOnlineOfflineState(false);
            }
            else if (_player->HasAuraType(SPELL_AURA_SPIRIT_OF_REDEMPTION))
            {
                // this will kill character by SPELL_AURA_SPIRIT_OF_REDEMPTION
                _player->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
                //_player->SetDeathPvP(*); set at SPELL_AURA_SPIRIT_OF_REDEMPTION apply time
                _player->KillPlayer();
                _player->BuildPlayerRepop();
                _player->RepopAtGraveyard();
            }

            _player->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_LEAVE_WORLD_CANCELS);

        }
        

        if (_player->IsInLFG())
            sWorld.GetLFGQueue().GetMessager().AddMessage([playerGuid = _player->GetObjectGuid()](LFGQueue* queue)
        {
            queue->RemovePlayerFromQueue(playerGuid, PLAYER_SYSTEM_LEAVE);
        });

        // Teleport to home if the player is in an invalid instance
        if (!_player->m_InstanceValid && !_player->IsGameMaster())
        {
            _player->TeleportToHomebind();
            //this is a bad place to call for far teleport because we need player to be in world for successful logout
            //maybe we should implement delayed far teleport logout?
            sMapMgr.ExecuteSingleDelayedTeleport(_player);
        }

        // FG: finish pending transfers after starting the logout
        // this should fix players being able to logout and login back with full hp at death position
        while (_player->IsBeingTeleportedFar())
        {
            HandleMoveWorldportAckOpcode();
            sMapMgr.ExecuteSingleDelayedTeleport(_player); // Execute chain teleport if there are some
        }

        // drop the flag if player is carrying it
        if (BattleGround *bg = _player->GetBattleGround())
        {
            _player->LeaveBattleground(true);

            // check for teleports both before and after leaving bg
            // fixes exploit where you can be considered to be inside bg
            // while you are actually outside if you kill wow process on
            // loading screen during the teleport into bg when joining
            while (_player->IsBeingTeleportedFar())
            {
                HandleMoveWorldportAckOpcode();
                sMapMgr.ExecuteSingleDelayedTeleport(_player);
            }
        }

        // Refresh apres ca
        inWorld = _player->IsInWorld() && _player->FindMap();
        if (!inWorld)
        {
            Save = false;
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[CRASH] Player %s is not in world during logout.", _player->GetName());
        }

        sBattleGroundMgr.PlayerLoggedOut(_player);

        // Reset the online field in the account table
        // no point resetting online in character table here as Player::SaveToDB() will set it to 1 since player has not been removed from world at this stage
        // No SQL injection as AccountID is uint32
        static SqlStatementID id;

        SqlStatement stmt = LoginDatabase.CreateStatement(id, "UPDATE `account` SET `current_realm` = ?, `online` = 0 WHERE `id` = ?");
        stmt.PExecute(uint32(0), GetAccountId());

        // If the player is in a guild, update the guild roster and broadcast a logout message to other guild members
        if (Guild* guild = sGuildMgr.GetGuildById(_player->GetGuildId()))
        {
            if (MemberSlot* slot = guild->GetMemberSlot(_player->GetObjectGuid()))
            {
                slot->SetMemberStats(_player);
                slot->UpdateLogoutTime();
            }

            guild->BroadcastEvent(GE_SIGNED_OFF, _player->GetObjectGuid(), _player->GetName());
        }

        // Remove pet
        _player->RemovePet(PET_SAVE_AS_CURRENT);

        // Dungeon anti-exploit. Should be before save
        bool removedFromMap = false;
        if (Map* map = _player->FindMap())
        {
            if (map->IsNonRaidDungeon() && !_player->GetBoundInstanceSaveForSelfOrGroup(map->GetId()))
            {
                AreaTriggerTeleport const* at = sObjectMgr.GetGoBackTrigger(map->GetId());
                if (at)
                    removedFromMap = _player->TeleportTo(at->destination);
                else
                    removedFromMap = _player->TeleportToHomebind();

                sMapMgr.ExecuteSingleDelayedTeleport(_player);
            }
        }

        // empty buyback items and save the player in the database
        // some save parts only correctly work in case player present in map/player_lists (pets, etc)
        if (Save)
            _player->SaveToDB(false, removedFromMap);

        // Leave all channels before player delete...
        _player->CleanupChannels();

        // If the player is in a group (or invited), remove him. If the group if then only 1 person, disband the group.
        _player->UninviteFromGroup();

        // Send update to group
        if (Group* group = _player->GetGroup())
            group->UpdatePlayerOnlineStatus(_player, false);

        // Update cached data at logout
        sObjectMgr.UpdatePlayerCache(_player);

        // No need to create any new maps
        sMapMgr.CancelInstanceCreationForPlayer(_player);

        // Remove the player from the world
        // the player may not be in the world when logging out
        // e.g if he got disconnected during a transfer to another map
        // calls to GetMap in this case may cause crashes

        if (inWorld && !removedFromMap)
        {
            Map* _map = _player->GetMap();
            _map->Remove(_player, true);
        }
        else
        {
            _player->CleanupsBeforeDelete();
            Map::DeleteFromWorld(_player);
        }

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
        m_movementPacketCompressor.ClearBuffer();
#endif

        SetPlayer(nullptr);                                    // deleted in Remove/DeleteFromWorld call

        // Send the 'logout complete' packet to the client
        WorldPacket data(SMSG_LOGOUT_COMPLETE, 0);
        SendPacket(&data);

        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "SESSION: Sent SMSG_LOGOUT_COMPLETE Message");
    }

    if (m_masterPlayer)
    {
        // Broadcast a logout message to the player's friends
        if (m_masterPlayer->GetSocial())
        {
            sSocialMgr.SendFriendStatus(m_masterPlayer, FRIEND_OFFLINE, m_masterPlayer->GetObjectGuid(), true);
            sSocialMgr.RemovePlayerSocial(m_masterPlayer->GetGUIDLow());
            m_masterPlayer->SetSocial(nullptr);
        }

        m_masterPlayer->SaveToDB();
        delete m_masterPlayer;
        m_masterPlayer = nullptr;
    }

    m_clientMoverGuid.Clear();
    m_playerLogout = false;
    m_playerSave = false;
    m_playerRecentlyLogout = true;
    LogoutRequest(0);
}

// Kick a player out of the World
void WorldSession::KickPlayer()
{
    if (m_socket)
        m_socket->CloseSocket();
    else if (m_bot)
        m_bot->requestRemoval = true;
}

// Cancel channeling handler

void WorldSession::SendAreaTriggerMessage(char const* Text, ...)
{
    va_list ap;
    char szStr [1024];
    szStr[0] = '\0';

    va_start(ap, Text);
    vsnprintf(szStr, 1024, Text, ap);
    va_end(ap);

    uint32 length = strlen(szStr) + 1;
    WorldPacket data(SMSG_AREA_TRIGGER_MESSAGE, 4 + length);
    data << length;
    data << szStr;
    SendPacket(&data);
}

void WorldSession::SendNotification(char const* format, ...)
{
    if (format)
    {
        va_list ap;
        char szStr [1024];
        szStr[0] = '\0';
        va_start(ap, format);
        vsnprintf(szStr, 1024, format, ap);
        va_end(ap);

        WorldPacket data(SMSG_NOTIFICATION, (strlen(szStr) + 1));
        data << szStr;
        SendPacket(&data);
    }
}

void WorldSession::SendNotification(int32 string_id, ...)
{
    char const* format = GetMangosString(string_id);
    if (format)
    {
        va_list ap;
        char szStr [1024];
        szStr[0] = '\0';
        va_start(ap, string_id);
        vsnprintf(szStr, 1024, format, ap);
        va_end(ap);

        WorldPacket data(SMSG_NOTIFICATION, (strlen(szStr) + 1));
        data << szStr;
        SendPacket(&data);
    }
}

char const*  WorldSession::GetMangosString(int32 entry) const
{
    return sObjectMgr.GetMangosString(entry, GetSessionDbLocaleIndex());
}

void WorldSession::Handle_NULL(WorldPacket& recvPacket)
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received unimplemented opcode %s (0x%.4X)",
                  LookupOpcodeName(recvPacket.GetOpcode()),
                  recvPacket.GetOpcode());
}

void WorldSession::Handle_EarlyProccess(WorldPacket& recvPacket)
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received opcode %s (0x%.4X) that must be processed in WorldSocket::OnRead",
                  LookupOpcodeName(recvPacket.GetOpcode()),
                  recvPacket.GetOpcode());
}

void WorldSession::Handle_ServerSide(WorldPacket& recvPacket)
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received server-side opcode %s (0x%.4X)",
                  LookupOpcodeName(recvPacket.GetOpcode()),
                  recvPacket.GetOpcode());
}

void WorldSession::Handle_Deprecated(WorldPacket& recvPacket)
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SESSION: received deprecated opcode %s (0x%.4X)",
                  LookupOpcodeName(recvPacket.GetOpcode()),
                  recvPacket.GetOpcode());
}

void WorldSession::SendAuthWaitQue(uint32 position)
{
    if (position == 0)
    {
        WorldPacket packet(SMSG_AUTH_RESPONSE, 1);
        packet << uint8(AUTH_OK);
        SendPacket(&packet);
    }
    else
    {
        WorldPacket packet(SMSG_AUTH_RESPONSE, 5);
        packet << uint8(AUTH_WAIT_QUEUE);
        packet << uint32(position);
        SendPacket(&packet);
    }
}

void WorldSession::LoadGlobalAccountData()
{
    std::unique_ptr<QueryResult> result = CharacterDatabase.PQuery("SELECT `type`, `time`, `data` FROM `account_data` WHERE `account`=%u", GetAccountId());
    LoadAccountData(
        std::move(result),
        NewAccountData::GLOBAL_CACHE_MASK
    );
}

void WorldSession::LoadAccountData(std::unique_ptr<QueryResult> result, uint32 mask)
{
    for (uint32 i = 0; i < NewAccountData::NUM_ACCOUNT_DATA_TYPES; ++i)
        if (mask & (1 << i))
            m_accountData[i] = AccountData();

    if (!result)
        return;

    do
    {
        Field* fields = result->Fetch();

        uint32 type = fields[0].GetUInt32();
        if (type >= NewAccountData::NUM_ACCOUNT_DATA_TYPES)
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_ERROR, "Table `%s` have invalid account data type (%u), ignore.",
                mask == NewAccountData::GLOBAL_CACHE_MASK ? "account_data" : "character_account_data", type);
            continue;
        }

        if ((mask & (1 << type)) == 0)
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_ERROR, "Table `%s` have non appropriate for table  account data type (%u), ignore.",
                mask == NewAccountData::GLOBAL_CACHE_MASK ? "account_data" : "character_account_data", type);
            continue;
        }

        m_accountData[type].timestamp = time_t(fields[1].GetUInt64());
        m_accountData[type].data = fields[2].GetCppString();
    } while (result->NextRow());
}

void WorldSession::SetAccountData(NewAccountData::AccountDataType type, const std::string& data)
{
    time_t const currentTime = time(nullptr);
    if ((1 << type) & NewAccountData::GLOBAL_CACHE_MASK)
    {
        if (data.empty())
        {
            CharacterDatabase.PExecute("DELETE FROM `account_data` WHERE `account`=%u AND `type`=%u", GetAccountId(), uint32(type));
        }
        else
        {
            std::string escapedData = data;
            CharacterDatabase.escape_string(escapedData);
            CharacterDatabase.PExecute("REPLACE INTO `account_data` VALUES (%u, %u, %u, '%s')", GetAccountId(), uint32(type), uint64(currentTime), escapedData.c_str());
        }
    }
    else
    {
        // _player can be nullptr and packet received after logout but m_currentPlayerGuid still store correct guid
        if (!m_currentPlayerGuid)
            return;

        if (data.empty())
        {
            CharacterDatabase.PExecute("DELETE FROM `character_account_data` WHERE `guid`=%u AND `type`=%u", m_currentPlayerGuid.GetCounter(), uint32(type));
        }
        else
        {
            std::string escapedData = data;
            CharacterDatabase.escape_string(escapedData);
            CharacterDatabase.PExecute("REPLACE INTO `character_account_data` VALUES (%u, %u, %u, '%s')", m_currentPlayerGuid.GetCounter(), uint32(type), uint64(currentTime), escapedData.c_str());
        }
    }

    m_accountData[type].timestamp = currentTime;
    m_accountData[type].data = data;
}

void WorldSession::SendAccountDataTimes()
{
    bool const isOldClient = GetGameBuild() <= CLIENT_BUILD_1_8_4;
    uint32 const dataCount = isOldClient ? OldAccountData::NUM_ACCOUNT_DATA_TYPES : NewAccountData::NUM_ACCOUNT_DATA_TYPES;
    WorldPacket data(SMSG_ACCOUNT_DATA_MD5, dataCount * MD5_DIGEST_LENGTH);
    for (uint32 index = 0; index < NewAccountData::NUM_ACCOUNT_DATA_TYPES; ++index)
    {
        // Skip indexes that dont exist in old clients
        if (isOldClient)
        {
            OldAccountData::AccountDataType oldIndex = ConvertNewAccountDataToOld(index);
            if (oldIndex == OldAccountData::NUM_ACCOUNT_DATA_TYPES)
                continue;
        }

        AccountData const& itr = m_accountData[index];
        if (itr.data.empty())
        {
            for (int i = 0; i < MD5_DIGEST_LENGTH; i++)
                data << uint8(0);
        }
        else
        {
            MD5_CTX md5;
            MD5_Init(&md5);
            MD5_Update(&md5, itr.data.c_str(), itr.data.size());

            uint8 fileHash[MD5_DIGEST_LENGTH];
            MD5_Final(fileHash, &md5);
            data.append(fileHash, MD5_DIGEST_LENGTH);
        }
    }
    SendPacket(&data);
}

void WorldSession::LoadTutorialsData()
{
    for (uint32 & tutorial : m_tutorials)
        tutorial = 0;

    std::unique_ptr<QueryResult> result = CharacterDatabase.PQuery("SELECT `tut0`, `tut1`, `tut2`, `tut3`, `tut4`, `tut5`, `tut6`, `tut7` FROM `character_tutorial` WHERE `account` = '%u'", GetAccountId());

    if (!result)
    {
        m_tutorialState = TUTORIALDATA_NEW;
        return;
    }

    do
    {
        Field* fields = result->Fetch();

        for (int iI = 0; iI < 8; ++iI)
            m_tutorials[iI] = fields[iI].GetUInt32();
    }
    while (result->NextRow());

    m_tutorialState = TUTORIALDATA_UNCHANGED;
}

void WorldSession::SendTutorialsData()
{
    WorldPacket data(SMSG_TUTORIAL_FLAGS, 4 * 8);
    for (uint32 tutorial : m_tutorials)
        data << tutorial;
    SendPacket(&data);
}

void WorldSession::SaveTutorialsData()
{
    static SqlStatementID updTutorial ;
    static SqlStatementID insTutorial ;

    switch (m_tutorialState)
    {
        case TUTORIALDATA_CHANGED:
        {
            SqlStatement stmt = CharacterDatabase.CreateStatement(updTutorial, "UPDATE `character_tutorial` SET `tut0`=?, `tut1`=?, `tut2`=?, `tut3`=?, `tut4`=?, `tut5`=?, `tut6`=?, `tut7`=? WHERE `account` = ?");
            for (uint32 tutorial : m_tutorials)
                stmt.addUInt32(tutorial);

            stmt.addUInt32(GetAccountId());
            stmt.Execute();
        }
        break;

        case TUTORIALDATA_NEW:
        {
            SqlStatement stmt = CharacterDatabase.CreateStatement(insTutorial, "INSERT INTO `character_tutorial` (`account`, `tut0`, `tut1`, `tut2`, `tut3`, `tut4`, `tut5`, `tut6`, `tut7`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

            stmt.addUInt32(GetAccountId());
            for (uint32 tutorial : m_tutorials)
                stmt.addUInt32(tutorial);

            stmt.Execute();
        }
        break;
        case TUTORIALDATA_UNCHANGED:
            break;
    }

    m_tutorialState = TUTORIALDATA_UNCHANGED;
}

void WorldSession::ExecuteOpcode(OpcodeHandler const& opHandle, WorldPacket* packet)
{
    // need prevent do internal far teleports in handlers because some handlers do lot steps
    // or call code that can do far teleports in some conditions unexpectedly for generic way work code
    if (_player)
        _player->SetCanDelayTeleport(true);

    //sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[%s] Recvd packet : %u/0x%x (%s)", GetUsername().c_str(), packet->GetOpcode(), packet->GetOpcode(), LookupOpcodeName(packet->GetOpcode()));
    (this->*opHandle.handler)(*packet);

    if (_player)
    {
        // can be not set in fact for login opcode, but this not create porblems.
        _player->SetCanDelayTeleport(false);

        //we should execute delayed teleports only for alive(!) players
        //because we don't want player's ghost teleported from graveyard
        if (_player->IsHasDelayedTeleport())
            _player->TeleportTo(_player->m_teleport_dest, _player->m_teleport_options);
    }
    if (packet->rpos() < packet->wpos() && sLog.HasLogLevelOrHigher(LOG_LVL_DEBUG))
        LogUnprocessedTail(packet);
}

void WorldSession::InitWarden()
{
    MANGOS_ASSERT(!m_warden);
    m_warden = sAnticheatMgr->CreateWardenFor(this, &m_sessionKey);
}

void WorldSession::InitCheatData(Player* pPlayer)
{
    if (m_cheatData)
        m_cheatData->InitNewPlayer(pPlayer);
    else
        m_cheatData = sAnticheatMgr->CreateAnticheatFor(pPlayer);
}

MovementAnticheat* WorldSession::GetCheatData()
{
    return m_cheatData ? m_cheatData : (m_cheatData = sAnticheatMgr->CreateAnticheatFor(GetPlayer()));
}

void WorldSession::ProcessAnticheatAction(char const* detector, char const* reason, uint32 cheatAction, uint32 banSeconds)
{
    char const* action = "";
    if (cheatAction & CHEAT_ACTION_MUTE_PUB_CHANS)
    {
        action = "Muted from public channels.";
        if (GetSecurity() == SEC_PLAYER)
        {
            LoginDatabase.PExecute("UPDATE `account` SET `flags` = `flags` | 0x%x WHERE `id` = %u", ACCOUNT_FLAG_MUTED_FROM_PUBLIC_CHANNELS, GetAccountId());
            SetAccountFlags(GetAccountFlags() | ACCOUNT_FLAG_MUTED_FROM_PUBLIC_CHANNELS);
        }
    }
    if (cheatAction & CHEAT_ACTION_BAN_IP_ACCOUNT)
    {
        action = "Account+IP banned.";
        if (GetSecurity() == SEC_PLAYER)
        {
            std::string _reason = std::string("CHEAT") + ": " + reason;
            sWorld.BanAccount(BAN_ACCOUNT, GetUsername(), banSeconds, _reason, detector);
            std::stringstream banIpReason;
            banIpReason << "Cf account " << GetUsername();
            sWorld.BanAccount(BAN_IP, GetRemoteAddress(), banSeconds, banIpReason.str(), detector);
        }
    }
    else if (cheatAction & CHEAT_ACTION_BAN_ACCOUNT)
    {
        action = "Banned.";
        std::string _reason = std::string("CHEAT") + ": " + reason;
        if (GetSecurity() == SEC_PLAYER)
            sWorld.BanAccount(BAN_ACCOUNT, GetUsername(), banSeconds, _reason, detector);
    }
    else if (cheatAction & CHEAT_ACTION_KICK)
    {
        action = "Kicked.";
        if (GetSecurity() == SEC_PLAYER)
            KickPlayer();
    }
    else if (cheatAction & CHEAT_ACTION_REPORT_GMS)
        action = "Announced to GMs.";
    else if (!(cheatAction & CHEAT_ACTION_LOG))
        return;

    std::string playerDesc;
    if (_player)
        playerDesc = _player->GetShortDescription();
    else
    {
        std::stringstream oss;
        oss << "<None> [" << GetUsername() << ":" << GetAccountId() << "@" << GetRemoteAddress().c_str() << "]";
        playerDesc = oss.str();
    }

    if ((cheatAction & CHEAT_ACTION_GLOBAL_ANNOUNNCE) &&
        (cheatAction >= CHEAT_ACTION_KICK))
    {
        std::stringstream oss;
        oss << "|r[|c1f40af20Announce by |cffff0000" << detector << "|r]: Player " << playerDesc << ", Cheat: " << reason << ", Penalty: " << action;
        sWorld.SendGlobalText(oss.str().c_str(), this);
    }

    if (cheatAction & CHEAT_ACTION_REPORT_GMS)
    {
        std::stringstream oss;
        oss << "Player " << playerDesc << ", Cheat: " << reason;

        if (cheatAction >= CHEAT_ACTION_KICK)
            oss << ", Penalty: " << action;

        sWorld.SendGMText(LANG_GM_ANNOUNCE_COLOR, detector, oss.str().c_str());
    }
    
    sLog.Player(this, LOG_ANTICHEAT, detector, LOG_LVL_MINIMAL, "[%s] Player %s, Cheat %s, Penalty: %s",
        detector, playerDesc.c_str(), reason, action);
}

bool WorldSession::HasUsedClickToMove() const
{
    if (m_warden)
        return m_warden->HasUsedClickToMove();
    return false;
}

bool WorldSession::AllowPacket(uint16 opcode)
{
    // Do not count packets that are often spamed by the client when loading a zone for example.
    switch (opcode)
    {
        case CMSG_GAMEOBJECT_QUERY:
        case CMSG_CREATURE_QUERY:
        case CMSG_QUESTGIVER_STATUS_QUERY:
        case CMSG_ITEM_QUERY_SINGLE:
        case CMSG_NAME_QUERY:
        case CMSG_PET_NAME_QUERY:
        case CMSG_GUILD_QUERY:
        case CMSG_JOIN_CHANNEL:         // Can be flooded by addons upon login
        case CMSG_AUCTION_LIST_ITEMS:   // We already handle only one per session update
        case CMSG_WHO:                  // We already handle only one per session update
            return true;
        default:
            break;
    }

    m_floodPacketsCount[FLOOD_TOTAL_PACKETS]++;

    switch (opcode)
    {
        case CMSG_CHAR_CREATE:
        case CMSG_CHAR_ENUM:
        case CMSG_CHAR_DELETE:
        case CMSG_OPEN_ITEM:
        case CMSG_PETITION_BUY:
        case CMSG_PETITION_SIGN:
        case CMSG_PETITION_QUERY:
        case MSG_PETITION_RENAME:
        case CMSG_SEND_MAIL:
        case CMSG_PLAYER_LOGIN:
        case CMSG_GMTICKET_UPDATETEXT:
            m_floodPacketsCount[FLOOD_VERY_SLOW_OPCODES]++;
        // no break, since slow packets are also very slow packets.
        case CMSG_LOGOUT_REQUEST:
        case CMSG_ADD_FRIEND:
        case CMSG_DEL_FRIEND:
        case CMSG_BUY_ITEM:
        case CMSG_SELL_ITEM:
            m_floodPacketsCount[FLOOD_SLOW_OPCODES]++;
            break;
        default:
            break;
    }

    // Check if the permitted threshold has been exceeded
    std::stringstream reason;
    if (m_floodPacketsCount[FLOOD_VERY_SLOW_OPCODES] > 2)
        reason << m_floodPacketsCount[FLOOD_VERY_SLOW_OPCODES] << " very slow packets";
    if (m_floodPacketsCount[FLOOD_SLOW_OPCODES] > 8)
        reason << m_floodPacketsCount[FLOOD_SLOW_OPCODES] << " slow packets";
    if (m_floodPacketsCount[FLOOD_TOTAL_PACKETS] > 300)
        reason << m_floodPacketsCount[FLOOD_TOTAL_PACKETS] << " packets";
    if (!reason.str().empty())
    {
        reason << " (" << LookupOpcodeName(opcode) << ")";
        ProcessAnticheatAction("AntiFlood", reason.str().c_str(), sWorld.getConfig(CONFIG_UINT32_ANTIFLOOD_SANCTION));
        return false;
    }

    return true;
}

bool WorldSession::CharacterScreenIdleKick(uint32 currTime)
{
    if (GetPlayer() || m_inQueue || PlayerLoading()) // not on the character screen
        return false;

    auto maxIdle = sWorld.getConfig(CONFIG_UINT32_CHARACTER_SCREEN_MAX_IDLE_TIME);

    if (!maxIdle) // disabled
        return false;

    if ((currTime - m_idleTime) >= (maxIdle * 1000))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "SESSION: Kicking session [%s] from character selection", GetRemoteAddress().c_str());
        return true;
    }

    return false;
}
