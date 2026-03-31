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

#include "Opcodes.h"

enum class Reason
{
    Invalid,
    Unhandled,
    AlreadyHandledElsewhere, // should already be handled before the packet reaches this opcode map
    SendByServer,
};

struct Handlers
{
    OpcodeHandler handlers[NUM_MSG_TYPES];
};

template<typename T>
struct get_packet_class
{
};

template<typename PacketClass>
struct get_packet_class<void(WorldSession::*)(PacketClass&)>
{
    using type = PacketClass;
};

Handlers BuildOpcodeList()
{
    Handlers list{};

    // For generic handlers
    #define DEFINE_HANDLER(opcode, requiredState, schedulingStrategy, handlerPtr) \
    { \
        OpcodeHandler& ref = list.handlers[(opcode)]; \
        ref.name = #opcode; \
        ref.status = (requiredState); \
        ref.packetProcessing = (schedulingStrategy); \
        ref.handler = &WorldSession::Handle_Generic<get_packet_class<decltype(handlerPtr)>::type, (handlerPtr)>; \
    }

    // For unhandled packets
    #define INVALID_PACKET(opcode, reason) \
    { \
        OpcodeHandler& ref = list.handlers[(opcode)]; \
        ref.name = #opcode; \
        ref.status = STATUS_NEVER; \
        ref.packetProcessing = PACKET_PROCESS_MAX_TYPE; \
        ref.handler = (reason) == Reason::SendByServer ? &WorldSession::Handle_ServerSide : ((reason) == Reason::AlreadyHandledElsewhere ? &WorldSession::Handle_EarlyProccess : &WorldSession::Handle_NULL); \
    }

    // Correspondence between opcodes and their names
    INVALID_PACKET(MSG_NULL_ACTION,                   Reason::Invalid);
    INVALID_PACKET(CMSG_BOOTME,                       Reason::Unhandled);
    INVALID_PACKET(CMSG_DBLOOKUP,                     Reason::Unhandled);
    INVALID_PACKET(SMSG_DBLOOKUP,                     Reason::SendByServer);
    INVALID_PACKET(CMSG_QUERY_OBJECT_POSITION,        Reason::Unhandled);
    INVALID_PACKET(SMSG_QUERY_OBJECT_POSITION,        Reason::SendByServer);
    INVALID_PACKET(CMSG_QUERY_OBJECT_ROTATION,        Reason::Unhandled);
    INVALID_PACKET(SMSG_QUERY_OBJECT_ROTATION,        Reason::SendByServer);
    DEFINE_HANDLER(CMSG_WORLD_TELEPORT,               STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleWorldTeleportOpcode);
    DEFINE_HANDLER(CMSG_TELEPORT_TO_UNIT,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleTeleportToUnitOpcode);
    INVALID_PACKET(CMSG_ZONE_MAP,                     Reason::Unhandled);
    INVALID_PACKET(SMSG_ZONE_MAP,                     Reason::SendByServer);
    INVALID_PACKET(CMSG_DEBUG_CHANGECELLZONE,         Reason::Unhandled);
    INVALID_PACKET(CMSG_EMBLAZON_TABARD_OBSOLETE,     Reason::Unhandled);
    INVALID_PACKET(CMSG_UNEMBLAZON_TABARD_OBSOLETE,   Reason::Unhandled);
    INVALID_PACKET(CMSG_RECHARGE,                     Reason::Unhandled);
    INVALID_PACKET(CMSG_LEARN_SPELL,                  Reason::Unhandled);
    INVALID_PACKET(CMSG_CREATEMONSTER,                Reason::Unhandled);
    INVALID_PACKET(CMSG_DESTROYMONSTER,               Reason::Unhandled);
    INVALID_PACKET(CMSG_CREATEITEM,                   Reason::Unhandled);
    INVALID_PACKET(CMSG_CREATEGAMEOBJECT,             Reason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(SMSG_CHECK_FOR_BOTS,               Reason::SendByServer);
#endif
    INVALID_PACKET(CMSG_MAKEMONSTERATTACKGUID,        Reason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_BOT_DETECTED2,                Reason::Unhandled);
#endif
    INVALID_PACKET(CMSG_FORCEACTION,                  Reason::Unhandled);
    INVALID_PACKET(CMSG_FORCEACTIONONOTHER,           Reason::Unhandled);
    INVALID_PACKET(CMSG_FORCEACTIONSHOW,              Reason::Unhandled);
    INVALID_PACKET(SMSG_FORCEACTIONSHOW,              Reason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_PETGODMODE,                   Reason::Unhandled);
    INVALID_PACKET(SMSG_PETGODMODE,                   Reason::SendByServer);
#endif
    INVALID_PACKET(SMSG_DEBUGINFOSPELLMISS_OBSOLETE,  Reason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_WEATHER_SPEED_CHEAT,          Reason::Unhandled);
#endif
    INVALID_PACKET(CMSG_UNDRESSPLAYER,                Reason::Unhandled);
    INVALID_PACKET(CMSG_BEASTMASTER,                  Reason::Unhandled);
    INVALID_PACKET(CMSG_GODMODE,                      Reason::Unhandled);
    INVALID_PACKET(SMSG_GODMODE,                      Reason::SendByServer);
    INVALID_PACKET(CMSG_CHEAT_SETMONEY,               Reason::Unhandled);
    INVALID_PACKET(CMSG_LEVEL_CHEAT,                  Reason::Unhandled);
    INVALID_PACKET(CMSG_PET_LEVEL_CHEAT,              Reason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_SET_WORLDSTATE,               Reason::Unhandled);
#endif
    INVALID_PACKET(CMSG_COOLDOWN_CHEAT,               Reason::Unhandled);
    INVALID_PACKET(CMSG_USE_SKILL_CHEAT,              Reason::Unhandled);
    INVALID_PACKET(CMSG_FLAG_QUEST,                   Reason::Unhandled);
    INVALID_PACKET(CMSG_FLAG_QUEST_FINISH,            Reason::Unhandled);
    INVALID_PACKET(CMSG_CLEAR_QUEST,                  Reason::Unhandled);
    INVALID_PACKET(CMSG_SEND_EVENT,                   Reason::Unhandled);
    INVALID_PACKET(CMSG_DEBUG_AISTATE,                Reason::Unhandled);
    INVALID_PACKET(SMSG_DEBUG_AISTATE,                Reason::SendByServer);
    INVALID_PACKET(CMSG_DISABLE_PVP_CHEAT,            Reason::Unhandled);
    INVALID_PACKET(CMSG_ADVANCE_SPAWN_TIME,           Reason::Unhandled);
    INVALID_PACKET(CMSG_PVP_PORT_OBSOLETE,            Reason::Unhandled);
    INVALID_PACKET(CMSG_AUTH_SRP6_BEGIN,              Reason::Unhandled);
    INVALID_PACKET(CMSG_AUTH_SRP6_PROOF,              Reason::Unhandled);
    INVALID_PACKET(CMSG_AUTH_SRP6_RECODE,             Reason::Unhandled);
    DEFINE_HANDLER(CMSG_CHAR_CREATE,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharCreateOpcode);
    DEFINE_HANDLER(CMSG_CHAR_ENUM,                    STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharEnumOpcode);
    DEFINE_HANDLER(CMSG_CHAR_DELETE,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharDeleteOpcode);
    INVALID_PACKET(SMSG_AUTH_SRP6_RESPONSE,           Reason::SendByServer);
    INVALID_PACKET(SMSG_CHAR_CREATE,                  Reason::SendByServer);
    INVALID_PACKET(SMSG_CHAR_ENUM,                    Reason::SendByServer);
    INVALID_PACKET(SMSG_CHAR_DELETE,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PLAYER_LOGIN,                 STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandlePlayerLoginOpcode);
    INVALID_PACKET(SMSG_NEW_WORLD,                    Reason::SendByServer);
    INVALID_PACKET(SMSG_TRANSFER_PENDING,             Reason::SendByServer);
    INVALID_PACKET(SMSG_TRANSFER_ABORTED,             Reason::SendByServer);
    INVALID_PACKET(SMSG_CHARACTER_LOGIN_FAILED,       Reason::SendByServer);
    INVALID_PACKET(SMSG_LOGIN_SETTIMESPEED,           Reason::SendByServer);
    INVALID_PACKET(SMSG_GAMETIME_UPDATE,              Reason::SendByServer);
    INVALID_PACKET(CMSG_GAMETIME_SET,                 Reason::Unhandled);
    INVALID_PACKET(SMSG_GAMETIME_SET,                 Reason::SendByServer);
    INVALID_PACKET(CMSG_GAMESPEED_SET,                Reason::Unhandled);
    INVALID_PACKET(SMSG_GAMESPEED_SET,                Reason::SendByServer);
    INVALID_PACKET(CMSG_SERVERTIME,                   Reason::Unhandled);
    INVALID_PACKET(SMSG_SERVERTIME,                   Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PLAYER_LOGOUT,                STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandlePlayerLogoutOpcode);
    DEFINE_HANDLER(CMSG_LOGOUT_REQUEST,               STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleLogoutRequestOpcode);
    INVALID_PACKET(SMSG_LOGOUT_RESPONSE,              Reason::SendByServer);
    INVALID_PACKET(SMSG_LOGOUT_COMPLETE,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_LOGOUT_CANCEL,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleLogoutCancelOpcode);
    INVALID_PACKET(SMSG_LOGOUT_CANCEL_ACK,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_NAME_QUERY,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQueryPlayerNameOpcode);
    INVALID_PACKET(SMSG_NAME_QUERY_RESPONSE,          Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_NAME_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetNameQueryOpcode);
    INVALID_PACKET(SMSG_PET_NAME_QUERY_RESPONSE,      Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_QUERY,                  STATUS_AUTHED,    PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildQueryOpcode);
    INVALID_PACKET(SMSG_GUILD_QUERY_RESPONSE,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_ITEM_QUERY_SINGLE,            STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleItemQuerySingleOpcode);
    INVALID_PACKET(CMSG_ITEM_QUERY_MULTIPLE,          Reason::Unhandled);
    INVALID_PACKET(SMSG_ITEM_QUERY_SINGLE_RESPONSE,   Reason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_QUERY_MULTIPLE_RESPONSE, Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PAGE_TEXT_QUERY,              STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandlePageTextQueryOpcode);
    INVALID_PACKET(SMSG_PAGE_TEXT_QUERY_RESPONSE,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUEST_QUERY,                  STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleQuestQueryOpcode);
    INVALID_PACKET(SMSG_QUEST_QUERY_RESPONSE,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GAMEOBJECT_QUERY,             STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleGameObjectQueryOpcode);
    INVALID_PACKET(SMSG_GAMEOBJECT_QUERY_RESPONSE,    Reason::SendByServer);
    DEFINE_HANDLER(CMSG_CREATURE_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleCreatureQueryOpcode);
    INVALID_PACKET(SMSG_CREATURE_QUERY_RESPONSE,      Reason::SendByServer);
    DEFINE_HANDLER(CMSG_WHO,                          STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleWhoOpcode);
    INVALID_PACKET(SMSG_WHO,                          Reason::SendByServer);
    DEFINE_HANDLER(CMSG_WHOIS,                        STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleWhoisOpcode);
    INVALID_PACKET(SMSG_WHOIS,                        Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FRIEND_LIST,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleFriendListOpcode);
    INVALID_PACKET(SMSG_FRIEND_LIST,                  Reason::SendByServer);
    INVALID_PACKET(SMSG_FRIEND_STATUS,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_ADD_FRIEND,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAddFriendOpcode);
    DEFINE_HANDLER(CMSG_DEL_FRIEND,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDelFriendOpcode);
    INVALID_PACKET(SMSG_IGNORE_LIST,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_ADD_IGNORE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAddIgnoreOpcode);
    DEFINE_HANDLER(CMSG_DEL_IGNORE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDelIgnoreOpcode);
    DEFINE_HANDLER(CMSG_GROUP_INVITE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupInviteOpcode);
    INVALID_PACKET(SMSG_GROUP_INVITE,                 Reason::SendByServer);
    INVALID_PACKET(CMSG_GROUP_CANCEL,                 Reason::Unhandled);
    INVALID_PACKET(SMSG_GROUP_CANCEL,                 Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_ACCEPT,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupAcceptOpcode);
    DEFINE_HANDLER(CMSG_GROUP_DECLINE,                STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupDeclineOpcode);
    INVALID_PACKET(SMSG_GROUP_DECLINE,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_UNINVITE,               STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupUninviteOpcode);
    DEFINE_HANDLER(CMSG_GROUP_UNINVITE_GUID,          STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupUninviteGuidOpcode);
    INVALID_PACKET(SMSG_GROUP_UNINVITE,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_SET_LEADER,             STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupSetLeaderOpcode);
    INVALID_PACKET(SMSG_GROUP_SET_LEADER,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_LOOT_METHOD,                  STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleLootMethodOpcode);
    DEFINE_HANDLER(CMSG_GROUP_DISBAND,                STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupDisbandOpcode);
    INVALID_PACKET(SMSG_GROUP_DESTROYED,              Reason::SendByServer);
    INVALID_PACKET(SMSG_GROUP_LIST,                   Reason::SendByServer);
    INVALID_PACKET(SMSG_PARTY_MEMBER_STATS,           Reason::SendByServer);
    INVALID_PACKET(SMSG_PARTY_COMMAND_RESULT,         Reason::SendByServer);
    INVALID_PACKET(MSG_UPDATE_GROUP_MEMBERS,          Reason::Unhandled);
    DEFINE_HANDLER(CMSG_GUILD_CREATE,                 STATUS_NEVER,     PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildCreateOpcode);
    DEFINE_HANDLER(CMSG_GUILD_INVITE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildInviteOpcode);
    INVALID_PACKET(SMSG_GUILD_INVITE,                 Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_ACCEPT,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildAcceptOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DECLINE,                STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDeclineOpcode);
    INVALID_PACKET(SMSG_GUILD_DECLINE,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_INFO,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildInfoOpcode);
    INVALID_PACKET(SMSG_GUILD_INFO,                   Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_ROSTER,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildRosterOpcode);
    INVALID_PACKET(SMSG_GUILD_ROSTER,                 Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_PROMOTE,                STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildPromoteOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DEMOTE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDemoteOpcode);
    DEFINE_HANDLER(CMSG_GUILD_LEAVE,                  STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildLeaveOpcode);
    DEFINE_HANDLER(CMSG_GUILD_REMOVE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildRemoveOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DISBAND,                STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDisbandOpcode);
    DEFINE_HANDLER(CMSG_GUILD_LEADER,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildLeaderOpcode);
    DEFINE_HANDLER(CMSG_GUILD_MOTD,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildMOTDOpcode);
    INVALID_PACKET(SMSG_GUILD_EVENT,                  Reason::SendByServer);
    INVALID_PACKET(SMSG_GUILD_COMMAND_RESULT,         Reason::SendByServer);
    INVALID_PACKET(MSG_UPDATE_GUILD,                  Reason::Unhandled);
    DEFINE_HANDLER(CMSG_MESSAGECHAT,                  STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleChatMessageOpcode);
    INVALID_PACKET(SMSG_MESSAGECHAT,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_JOIN_CHANNEL,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleJoinChannelOpcode);
    DEFINE_HANDLER(CMSG_LEAVE_CHANNEL,                STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleLeaveChannelOpcode);
    INVALID_PACKET(SMSG_CHANNEL_NOTIFY,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_CHANNEL_LIST,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelListOpcode);
    INVALID_PACKET(SMSG_CHANNEL_LIST,                 Reason::SendByServer);
    DEFINE_HANDLER(CMSG_CHANNEL_PASSWORD,             STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelPasswordOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_SET_OWNER,            STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelSetOwnerOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_OWNER,                STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelOwnerOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_MODERATOR,            STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelModeratorOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_UNMODERATOR,          STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelUnmoderatorOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_MUTE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelMuteOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_UNMUTE,               STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelUnmuteOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_INVITE,               STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelInviteOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_KICK,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelKickOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_BAN,                  STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelBanOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_UNBAN,                STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelUnbanOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_ANNOUNCEMENTS,        STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelAnnouncementsOpcode);
    DEFINE_HANDLER(CMSG_CHANNEL_MODERATE,             STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelModerateOpcode);
    INVALID_PACKET(SMSG_UPDATE_OBJECT,                Reason::SendByServer);
    INVALID_PACKET(SMSG_DESTROY_OBJECT,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_USE_ITEM,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleUseItemOpcode);
    DEFINE_HANDLER(CMSG_OPEN_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleOpenItemOpcode);
    DEFINE_HANDLER(CMSG_READ_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleReadItemOpcode);
    INVALID_PACKET(SMSG_READ_ITEM_OK,                 Reason::SendByServer);
    INVALID_PACKET(SMSG_READ_ITEM_FAILED,             Reason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_COOLDOWN,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GAMEOBJ_USE,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGameObjectUseOpcode);
    INVALID_PACKET(CMSG_GAMEOBJ_CHAIR_USE_OBSOLETE,   Reason::Unhandled);
    INVALID_PACKET(SMSG_GAMEOBJECT_CUSTOM_ANIM,       Reason::SendByServer);
    DEFINE_HANDLER(CMSG_AREATRIGGER,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAreaTriggerOpcode);
    DEFINE_HANDLER(MSG_MOVE_START_FORWARD,            STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_BACKWARD,           STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_STOP,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_STRAFE_LEFT,        STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_STRAFE_RIGHT,       STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_STOP_STRAFE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_JUMP,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_TURN_LEFT,          STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_TURN_RIGHT,         STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_STOP_TURN,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_PITCH_UP,           STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_PITCH_DOWN,         STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_STOP_PITCH,               STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_SET_RUN_MODE,             STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_SET_WALK_MODE,            STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    INVALID_PACKET(MSG_MOVE_TOGGLE_LOGGING,           Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_TELEPORT,                 Reason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_TELEPORT_CHEAT,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMoveSetRawPosition);
    DEFINE_HANDLER(MSG_MOVE_TELEPORT_ACK,             STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveTeleportAckOpcode);
    INVALID_PACKET(MSG_MOVE_TOGGLE_FALL_LOGGING,      Reason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_FALL_LAND,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_SWIM,               STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_STOP_SWIM,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    INVALID_PACKET(MSG_MOVE_SET_RUN_SPEED_CHEAT,      Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_RUN_SPEED,            Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_RUN_BACK_SPEED_CHEAT, Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_RUN_BACK_SPEED,       Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_WALK_SPEED_CHEAT,     Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_WALK_SPEED,           Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_SPEED_CHEAT,     Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_SPEED,           Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_BACK_SPEED_CHEAT,Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_BACK_SPEED,      Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_ALL_SPEED_CHEAT,      Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_TURN_RATE_CHEAT,      Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_TURN_RATE,            Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_TOGGLE_COLLISION_CHEAT,   Reason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_SET_FACING,               STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_SET_PITCH,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_WORLDPORT_ACK,            STATUS_TRANSFER,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMoveWorldportAckOpcode);
    INVALID_PACKET(SMSG_MONSTER_MOVE,                 Reason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_WATER_WALK,              Reason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_LAND_WALK,               Reason::SendByServer);
    INVALID_PACKET(MSG_MOVE_SET_RAW_POSITION_ACK,     Reason::Unhandled);
    DEFINE_HANDLER(CMSG_MOVE_SET_RAW_POSITION,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMoveSetRawPosition);
    INVALID_PACKET(SMSG_FORCE_RUN_SPEED_CHANGE,       Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_RUN_SPEED_CHANGE_ACK,   STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_RUN_BACK_SPEED_CHANGE,  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK, STATUS_LOGGEDIN, PACKET_PROCESS_MOVEMENT,    &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_SWIM_SPEED_CHANGE,      Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_SWIM_SPEED_CHANGE_ACK,  STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_MOVE_ROOT,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_MOVE_ROOT_ACK,          STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveRootAck);
    INVALID_PACKET(SMSG_FORCE_MOVE_UNROOT,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_MOVE_UNROOT_ACK,        STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveRootAck);
    INVALID_PACKET(MSG_MOVE_ROOT,                     Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_UNROOT,                   Reason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_HEARTBEAT,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    INVALID_PACKET(SMSG_MOVE_KNOCK_BACK,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_MOVE_KNOCK_BACK_ACK,          STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveKnockBackAck);
    INVALID_PACKET(MSG_MOVE_KNOCK_BACK,               Reason::Unhandled);
    INVALID_PACKET(SMSG_MOVE_FEATHER_FALL,            Reason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_NORMAL_FALL,             Reason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_SET_HOVER,               Reason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_UNSET_HOVER,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_MOVE_HOVER_ACK,               STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementFlagChangeToggleAck);
    INVALID_PACKET(MSG_MOVE_HOVER,                    Reason::Unhandled);
    INVALID_PACKET(CMSG_TRIGGER_CINEMATIC_CHEAT,      Reason::Unhandled);
    INVALID_PACKET(CMSG_OPENING_CINEMATIC,            Reason::Unhandled);
    INVALID_PACKET(SMSG_TRIGGER_CINEMATIC,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_NEXT_CINEMATIC_CAMERA,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleNextCinematicCamera);
    DEFINE_HANDLER(CMSG_COMPLETE_CINEMATIC,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCompleteCinematic);
    INVALID_PACKET(SMSG_TUTORIAL_FLAGS,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TUTORIAL_FLAG,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTutorialFlagOpcode);
    DEFINE_HANDLER(CMSG_TUTORIAL_CLEAR,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTutorialClearOpcode);
    DEFINE_HANDLER(CMSG_TUTORIAL_RESET,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTutorialResetOpcode);
    DEFINE_HANDLER(CMSG_STANDSTATECHANGE,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStandStateChangeOpcode);
    DEFINE_HANDLER(CMSG_EMOTE,                        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleEmoteOpcode);
    INVALID_PACKET(SMSG_EMOTE,                        Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TEXT_EMOTE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTextEmoteOpcode);
    INVALID_PACKET(SMSG_TEXT_EMOTE,                   Reason::SendByServer);
    INVALID_PACKET(CMSG_AUTOEQUIP_GROUND_ITEM,        Reason::Unhandled);
    INVALID_PACKET(CMSG_AUTOSTORE_GROUND_ITEM,        Reason::Unhandled);
    DEFINE_HANDLER(CMSG_AUTOSTORE_LOOT_ITEM,          STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutostoreLootItemOpcode);
    INVALID_PACKET(CMSG_STORE_LOOT_IN_SLOT,           Reason::Unhandled);
    DEFINE_HANDLER(CMSG_AUTOEQUIP_ITEM,               STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoEquipItemOpcode);
    DEFINE_HANDLER(CMSG_AUTOSTORE_BAG_ITEM,           STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoStoreBagItemOpcode);
    DEFINE_HANDLER(CMSG_SWAP_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSwapItem);
    DEFINE_HANDLER(CMSG_SWAP_INV_ITEM,                STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSwapInvItemOpcode);
    DEFINE_HANDLER(CMSG_SPLIT_ITEM,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSplitItemOpcode);
    DEFINE_HANDLER(CMSG_AUTOEQUIP_ITEM_SLOT,          STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoEquipItemSlotOpcode);
    INVALID_PACKET(CMSG_DROP_ITEM,                    Reason::Unhandled);
    DEFINE_HANDLER(CMSG_DESTROYITEM,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleDestroyItemOpcode);
    INVALID_PACKET(SMSG_INVENTORY_CHANGE_FAILURE,     Reason::SendByServer);
    INVALID_PACKET(SMSG_OPEN_CONTAINER,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_INSPECT,                      STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleInspectOpcode);
    INVALID_PACKET(SMSG_INSPECT,                      Reason::SendByServer);
    DEFINE_HANDLER(CMSG_INITIATE_TRADE,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleInitiateTradeOpcode);
    DEFINE_HANDLER(CMSG_BEGIN_TRADE,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBeginTradeOpcode);
    DEFINE_HANDLER(CMSG_BUSY_TRADE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBusyTradeOpcode);
    DEFINE_HANDLER(CMSG_IGNORE_TRADE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleIgnoreTradeOpcode);
    DEFINE_HANDLER(CMSG_ACCEPT_TRADE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAcceptTradeOpcode);
    DEFINE_HANDLER(CMSG_UNACCEPT_TRADE,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleUnacceptTradeOpcode);
    DEFINE_HANDLER(CMSG_CANCEL_TRADE,                 STATUS_LOGGEDIN_OR_RECENTLY_LOGGEDOUT, PACKET_PROCESS_MAP,         &WorldSession::HandleCancelTradeOpcode);
    DEFINE_HANDLER(CMSG_SET_TRADE_ITEM,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetTradeItemOpcode);
    DEFINE_HANDLER(CMSG_CLEAR_TRADE_ITEM,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleClearTradeItemOpcode);
    DEFINE_HANDLER(CMSG_SET_TRADE_GOLD,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetTradeGoldOpcode);
    INVALID_PACKET(SMSG_TRADE_STATUS,                 Reason::SendByServer);
    INVALID_PACKET(SMSG_TRADE_STATUS_EXTENDED,        Reason::SendByServer);
    INVALID_PACKET(SMSG_INITIALIZE_FACTIONS,          Reason::SendByServer);
    INVALID_PACKET(SMSG_SET_FACTION_VISIBLE,          Reason::SendByServer);
    INVALID_PACKET(SMSG_SET_FACTION_STANDING,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_FACTION_ATWAR,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetFactionAtWarOpcode);
    INVALID_PACKET(CMSG_SET_FACTION_CHEAT,            Reason::Unhandled);
    INVALID_PACKET(SMSG_SET_PROFICIENCY,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_ACTION_BUTTON,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetActionButtonOpcode);
    INVALID_PACKET(SMSG_ACTION_BUTTONS,               Reason::SendByServer);
    INVALID_PACKET(SMSG_INITIAL_SPELLS,               Reason::SendByServer);
    INVALID_PACKET(SMSG_LEARNED_SPELL,                Reason::SendByServer);
    INVALID_PACKET(SMSG_SUPERCEDED_SPELL,             Reason::SendByServer);
    INVALID_PACKET(CMSG_NEW_SPELL_SLOT,               Reason::Unhandled);
    DEFINE_HANDLER(CMSG_CAST_SPELL,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCastSpellOpcode);
    DEFINE_HANDLER(CMSG_CANCEL_CAST,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCancelCastOpcode);
    INVALID_PACKET(SMSG_CAST_RESULT,                  Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_START,                  Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_GO,                     Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_FAILURE,                Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_COOLDOWN,               Reason::SendByServer);
    INVALID_PACKET(SMSG_COOLDOWN_EVENT,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_CANCEL_AURA,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCancelAuraOpcode);
    INVALID_PACKET(SMSG_UPDATE_AURA_DURATION,         Reason::SendByServer);
    INVALID_PACKET(SMSG_PET_CAST_FAILED,              Reason::SendByServer);
    INVALID_PACKET(MSG_CHANNEL_START,                 Reason::Unhandled);
    INVALID_PACKET(MSG_CHANNEL_UPDATE,                Reason::Unhandled);
    DEFINE_HANDLER(CMSG_CANCEL_CHANNELLING,           STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCancelChanneling);
    INVALID_PACKET(SMSG_AI_REACTION,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_SELECTION,                STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleSetSelectionOpcode);
    INVALID_PACKET(CMSG_SET_TARGET_OBSOLETE,          Reason::Unhandled);
    INVALID_PACKET(CMSG_UNUSED,                       Reason::Unhandled);
    INVALID_PACKET(CMSG_UNUSED2,                      Reason::Unhandled);
    DEFINE_HANDLER(CMSG_ATTACKSWING,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleAttackSwingOpcode);
    DEFINE_HANDLER(CMSG_ATTACKSTOP,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleAttackStopOpcode);
    INVALID_PACKET(SMSG_ATTACKSTART,                  Reason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSTOP,                   Reason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_NOTINRANGE,       Reason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_BADFACING,        Reason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_NOTSTANDING,      Reason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_DEADTARGET,       Reason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_CANT_ATTACK,      Reason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKERSTATEUPDATE,          Reason::SendByServer);
    INVALID_PACKET(SMSG_VICTIMSTATEUPDATE_OBSOLETE,   Reason::SendByServer);
    INVALID_PACKET(SMSG_DAMAGE_DONE_OBSOLETE,         Reason::SendByServer);
    INVALID_PACKET(SMSG_DAMAGE_TAKEN_OBSOLETE,        Reason::SendByServer);
    INVALID_PACKET(SMSG_CANCEL_COMBAT,                Reason::SendByServer);
    INVALID_PACKET(SMSG_PLAYER_COMBAT_XP_GAIN_OBSOLETE,Reason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    INVALID_PACKET(SMSG_SPELLHEALLOG,                 Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELLENERGIZELOG,             Reason::SendByServer);
#endif
    INVALID_PACKET(CMSG_SHEATHE_OBSOLETE,             Reason::Unhandled);
    INVALID_PACKET(CMSG_SAVE_PLAYER,                  Reason::Unhandled);
    INVALID_PACKET(CMSG_SETDEATHBINDPOINT,            Reason::Unhandled);
    INVALID_PACKET(SMSG_BINDPOINTUPDATE,              Reason::SendByServer);
    INVALID_PACKET(CMSG_GETDEATHBINDZONE,             Reason::Unhandled);
    INVALID_PACKET(SMSG_BINDZONEREPLY,                Reason::SendByServer);
    INVALID_PACKET(SMSG_PLAYERBOUND,                  Reason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    INVALID_PACKET(SMSG_CLIENT_CONTROL_UPDATE,        Reason::SendByServer);
#endif
    DEFINE_HANDLER(CMSG_REPOP_REQUEST,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleRepopRequestOpcode);
    INVALID_PACKET(SMSG_RESURRECT_REQUEST,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_RESURRECT_RESPONSE,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleResurrectResponseOpcode);
    DEFINE_HANDLER(CMSG_LOOT,                         STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleLootOpcode);
    DEFINE_HANDLER(CMSG_LOOT_MONEY,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleLootMoneyOpcode);
    DEFINE_HANDLER(CMSG_LOOT_RELEASE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleLootReleaseOpcode);
    INVALID_PACKET(SMSG_LOOT_RESPONSE,                Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_RELEASE_RESPONSE,        Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_REMOVED,                 Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_MONEY_NOTIFY,            Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ITEM_NOTIFY,             Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_CLEAR_MONEY,             Reason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_PUSH_RESULT,             Reason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_REQUESTED,               Reason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_OUTOFBOUNDS,             Reason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_INBOUNDS,                Reason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_COMPLETE,                Reason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_WINNER,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_DUEL_ACCEPTED,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDuelAcceptedOpcode);
    DEFINE_HANDLER(CMSG_DUEL_CANCELLED,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDuelCancelledOpcode);
    INVALID_PACKET(SMSG_MOUNTRESULT,                  Reason::SendByServer);
    INVALID_PACKET(SMSG_DISMOUNTRESULT,               Reason::SendByServer);
    INVALID_PACKET(SMSG_PUREMOUNT_CANCELLED_OBSOLETE, Reason::SendByServer);
    DEFINE_HANDLER(CMSG_MOUNTSPECIAL_ANIM,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMountSpecialAnimOpcode);
    INVALID_PACKET(SMSG_MOUNTSPECIAL_ANIM,            Reason::SendByServer);
    INVALID_PACKET(SMSG_PET_TAME_FAILURE,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_SET_ACTION,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetSetAction);
    DEFINE_HANDLER(CMSG_PET_ACTION,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandlePetAction);
    DEFINE_HANDLER(CMSG_PET_ABANDON,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetAbandon);
    DEFINE_HANDLER(CMSG_PET_RENAME,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetRename);
    INVALID_PACKET(SMSG_PET_NAME_INVALID,             Reason::SendByServer);
    INVALID_PACKET(SMSG_PET_SPELLS,                   Reason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    INVALID_PACKET(SMSG_PET_MODE,                     Reason::SendByServer);
#endif
    DEFINE_HANDLER(CMSG_GOSSIP_HELLO,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGossipHelloOpcode);
    DEFINE_HANDLER(CMSG_GOSSIP_SELECT_OPTION,         STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGossipSelectOptionOpcode);
    INVALID_PACKET(SMSG_GOSSIP_MESSAGE,               Reason::SendByServer);
    INVALID_PACKET(SMSG_GOSSIP_COMPLETE,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_NPC_TEXT_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleNpcTextQueryOpcode);
    INVALID_PACKET(SMSG_NPC_TEXT_UPDATE,              Reason::SendByServer);
    INVALID_PACKET(SMSG_NPC_WONT_TALK,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_STATUS_QUERY,      STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverStatusQueryOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_STATUS,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_HELLO,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverHelloOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_LIST,        Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_QUERY_QUEST,       STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverQueryQuestOpcode);
    DEFINE_HANDLER(CMSG_QUESTGIVER_QUEST_AUTOLAUNCH,  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverQuestAutoLaunch);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_DETAILS,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_ACCEPT_QUEST,      STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleQuestgiverAcceptQuestOpcode);
    DEFINE_HANDLER(CMSG_QUESTGIVER_COMPLETE_QUEST,    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverCompleteQuest);
    INVALID_PACKET(SMSG_QUESTGIVER_REQUEST_ITEMS,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_REQUEST_REWARD,    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverRequestRewardOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_OFFER_REWARD,      Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_CHOOSE_REWARD,     STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleQuestgiverChooseRewardOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_INVALID,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_CANCEL,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverCancel);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_COMPLETE,    Reason::SendByServer);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_FAILED,      Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTLOG_SWAP_QUEST,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestLogSwapQuest);
    DEFINE_HANDLER(CMSG_QUESTLOG_REMOVE_QUEST,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestLogRemoveQuest);
    INVALID_PACKET(SMSG_QUESTLOG_FULL,                Reason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_FAILED,           Reason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_FAILEDTIMER,      Reason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_COMPLETE,         Reason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_ADD_KILL,         Reason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_ADD_ITEM,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUEST_CONFIRM_ACCEPT,         STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestConfirmAccept);
    INVALID_PACKET(SMSG_QUEST_CONFIRM_ACCEPT,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PUSHQUESTTOPARTY,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePushQuestToParty);
    DEFINE_HANDLER(CMSG_LIST_INVENTORY,               STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleListInventoryOpcode);
    INVALID_PACKET(SMSG_LIST_INVENTORY,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SELL_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSellItemOpcode);
    INVALID_PACKET(SMSG_SELL_ITEM,                    Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BUY_ITEM,                     STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleBuyItemOpcode);
    DEFINE_HANDLER(CMSG_BUY_ITEM_IN_SLOT,             STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleBuyItemInSlotOpcode);
    INVALID_PACKET(SMSG_BUY_ITEM,                     Reason::SendByServer);
    INVALID_PACKET(SMSG_BUY_FAILED,                   Reason::SendByServer);
    INVALID_PACKET(CMSG_TAXICLEARALLNODES,            Reason::Unhandled);
    INVALID_PACKET(CMSG_TAXIENABLEALLNODES,           Reason::Unhandled);
    INVALID_PACKET(CMSG_TAXISHOWNODES,                Reason::Unhandled);
    INVALID_PACKET(SMSG_SHOWTAXINODES,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TAXINODE_STATUS_QUERY,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTaxiNodeStatusQueryOpcode);
    INVALID_PACKET(SMSG_TAXINODE_STATUS,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TAXIQUERYAVAILABLENODES,      STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTaxiQueryAvailableNodes);
    DEFINE_HANDLER(CMSG_ACTIVATETAXI,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleActivateTaxiOpcode);
    INVALID_PACKET(SMSG_ACTIVATETAXIREPLY,            Reason::SendByServer);
    INVALID_PACKET(SMSG_NEW_TAXI_PATH,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TRAINER_LIST,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTrainerListOpcode);
    INVALID_PACKET(SMSG_TRAINER_LIST,                 Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TRAINER_BUY_SPELL,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTrainerBuySpellOpcode);
    INVALID_PACKET(SMSG_TRAINER_BUY_SUCCEEDED,        Reason::SendByServer);
    INVALID_PACKET(SMSG_TRAINER_BUY_FAILED,           Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BINDER_ACTIVATE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBinderActivateOpcode);
    INVALID_PACKET(SMSG_PLAYERBINDERROR,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BANKER_ACTIVATE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBankerActivateOpcode);
    INVALID_PACKET(SMSG_SHOW_BANK,                    Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BUY_BANK_SLOT,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBuyBankSlotOpcode);
    INVALID_PACKET(SMSG_BUY_BANK_SLOT_RESULT,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_SHOWLIST,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionShowListOpcode);
    INVALID_PACKET(SMSG_PETITION_SHOWLIST,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_BUY,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionBuyOpcode);
    DEFINE_HANDLER(CMSG_PETITION_SHOW_SIGNATURES,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionShowSignOpcode);
    INVALID_PACKET(SMSG_PETITION_SHOW_SIGNATURES,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_SIGN,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionSignOpcode);
    INVALID_PACKET(SMSG_PETITION_SIGN_RESULTS,        Reason::SendByServer);
    DEFINE_HANDLER(MSG_PETITION_DECLINE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionDeclineOpcode);
    DEFINE_HANDLER(CMSG_OFFER_PETITION,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleOfferPetitionOpcode);
    DEFINE_HANDLER(CMSG_TURN_IN_PETITION,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTurnInPetitionOpcode);
    INVALID_PACKET(SMSG_TURN_IN_PETITION_RESULTS,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionQueryOpcode);
    INVALID_PACKET(SMSG_PETITION_QUERY_RESPONSE,      Reason::SendByServer);
    INVALID_PACKET(SMSG_FISH_NOT_HOOKED,              Reason::SendByServer);
    INVALID_PACKET(SMSG_FISH_ESCAPED,                 Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BUG,                          STATUS_NEVER,     PACKET_PROCESS_MAP,           &WorldSession::HandleBugOpcode);
    INVALID_PACKET(SMSG_NOTIFICATION,                 Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PLAYED_TIME,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePlayedTime);
    INVALID_PACKET(SMSG_PLAYED_TIME,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_QUERY_TIME,                   STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleQueryTimeOpcode);
    INVALID_PACKET(SMSG_QUERY_TIME_RESPONSE,          Reason::SendByServer);
    INVALID_PACKET(SMSG_LOG_XPGAIN,                   Reason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(SMSG_AURACASTLOG,                  Reason::SendByServer);
#endif
    DEFINE_HANDLER(CMSG_RECLAIM_CORPSE,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleReclaimCorpseOpcode);
    DEFINE_HANDLER(CMSG_WRAP_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleWrapItemOpcode);
    INVALID_PACKET(SMSG_LEVELUP_INFO,                 Reason::SendByServer);
    DEFINE_HANDLER(MSG_MINIMAP_PING,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMinimapPingOpcode);
    INVALID_PACKET(SMSG_RESISTLOG,                    Reason::SendByServer);
    INVALID_PACKET(SMSG_ENCHANTMENTLOG,               Reason::SendByServer);
    INVALID_PACKET(CMSG_SET_SKILL_CHEAT,              Reason::Unhandled);
    INVALID_PACKET(SMSG_START_MIRROR_TIMER,           Reason::SendByServer);
    INVALID_PACKET(SMSG_PAUSE_MIRROR_TIMER,           Reason::SendByServer);
    INVALID_PACKET(SMSG_STOP_MIRROR_TIMER,            Reason::SendByServer);
    INVALID_PACKET(CMSG_PING,                         Reason::AlreadyHandledElsewhere);
    INVALID_PACKET(SMSG_PONG,                         Reason::SendByServer);
    INVALID_PACKET(SMSG_CLEAR_COOLDOWN,               Reason::SendByServer);
    INVALID_PACKET(SMSG_GAMEOBJECT_PAGETEXT,          Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SETSHEATHED,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetSheathedOpcode);
    INVALID_PACKET(SMSG_COOLDOWN_CHEAT,               Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_DELAYED,                Reason::SendByServer);
    INVALID_PACKET(CMSG_PLAYER_MACRO_OBSOLETE,        Reason::Unhandled);
    INVALID_PACKET(SMSG_PLAYER_MACRO_OBSOLETE,        Reason::SendByServer);
    INVALID_PACKET(CMSG_GHOST,                        Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_INVIS,                     Reason::Unhandled);
    INVALID_PACKET(SMSG_INVALID_PROMOTION_CODE,       Reason::SendByServer);
    INVALID_PACKET(MSG_GM_BIND_OTHER,                 Reason::Unhandled);
    INVALID_PACKET(MSG_GM_SUMMON,                     Reason::Unhandled);
    INVALID_PACKET(SMSG_ITEM_TIME_UPDATE,             Reason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_ENCHANT_TIME_UPDATE,     Reason::SendByServer);
    INVALID_PACKET(SMSG_AUTH_CHALLENGE,               Reason::SendByServer);
    INVALID_PACKET(CMSG_AUTH_SESSION,                 Reason::AlreadyHandledElsewhere);
    INVALID_PACKET(SMSG_AUTH_RESPONSE,                Reason::SendByServer);
    INVALID_PACKET(MSG_GM_SHOWLABEL,                  Reason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    DEFINE_HANDLER(CMSG_PET_CAST_SPELL,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetCastSpellOpcode);
#endif
    DEFINE_HANDLER(MSG_SAVE_GUILD_EMBLEM,             STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleSaveGuildEmblemOpcode);
    DEFINE_HANDLER(MSG_TABARDVENDOR_ACTIVATE,         STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleTabardVendorActivateOpcode);
    INVALID_PACKET(SMSG_PLAY_SPELL_VISUAL,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_ZONEUPDATE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleZoneUpdateOpcode);
    INVALID_PACKET(SMSG_PARTYKILLLOG,                 Reason::SendByServer);
    INVALID_PACKET(SMSG_COMPRESSED_UPDATE_OBJECT,     Reason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(SMSG_PLAY_SPELL_IMPACT,            Reason::SendByServer);
#endif
    INVALID_PACKET(SMSG_EXPLORATION_EXPERIENCE,       Reason::SendByServer);
    INVALID_PACKET(CMSG_GM_SET_SECURITY_GROUP,        Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_NUKE,                      Reason::Unhandled);
    DEFINE_HANDLER(MSG_RANDOM_ROLL,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRandomRollOpcode);
    INVALID_PACKET(SMSG_ENVIRONMENTALDAMAGELOG,       Reason::SendByServer);
    INVALID_PACKET(CMSG_RWHOIS,                       Reason::Unhandled);
    INVALID_PACKET(SMSG_RWHOIS,                       Reason::SendByServer);
    DEFINE_HANDLER(MSG_LOOKING_FOR_GROUP,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleLFGOpcode);
    INVALID_PACKET(CMSG_SET_LOOKING_FOR_GROUP,        Reason::Unhandled);
    INVALID_PACKET(CMSG_UNLEARN_SPELL,                Reason::Unhandled);
    DEFINE_HANDLER(CMSG_UNLEARN_SKILL,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleUnlearnSkillOpcode);
    INVALID_PACKET(SMSG_REMOVED_SPELL,                Reason::SendByServer);
    INVALID_PACKET(CMSG_DECHARGE,                     Reason::Unhandled);
    DEFINE_HANDLER(CMSG_GMTICKET_CREATE,              STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMTicketCreateOpcode);
    INVALID_PACKET(SMSG_GMTICKET_CREATE,              Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GMTICKET_UPDATETEXT,          STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMTicketUpdateTextOpcode);
    INVALID_PACKET(SMSG_GMTICKET_UPDATETEXT,          Reason::SendByServer);
    INVALID_PACKET(SMSG_ACCOUNT_DATA_MD5,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_REQUEST_ACCOUNT_DATA,         STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleRequestAccountData);
    DEFINE_HANDLER(CMSG_UPDATE_ACCOUNT_DATA,          STATUS_LOGGEDIN_OR_RECENTLY_LOGGEDOUT, PACKET_PROCESS_WORLD,         &WorldSession::HandleUpdateAccountData);
    INVALID_PACKET(SMSG_UPDATE_ACCOUNT_DATA,          Reason::SendByServer);
    INVALID_PACKET(SMSG_CLEAR_FAR_SIGHT_IMMEDIATE,    Reason::SendByServer);
    INVALID_PACKET(SMSG_POWERGAINLOG_OBSOLETE,        Reason::SendByServer);
    INVALID_PACKET(CMSG_GM_TEACH,                     Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_CREATE_ITEM_TARGET,        Reason::Unhandled);
    DEFINE_HANDLER(CMSG_GMTICKET_GETTICKET,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGMTicketGetTicketOpcode);
    INVALID_PACKET(SMSG_GMTICKET_GETTICKET,           Reason::SendByServer);
    INVALID_PACKET(CMSG_UNLEARN_TALENTS,              Reason::Unhandled);
    INVALID_PACKET(SMSG_GAMEOBJECT_SPAWN_ANIM,        Reason::SendByServer);
    INVALID_PACKET(SMSG_GAMEOBJECT_DESPAWN_ANIM,      Reason::SendByServer);
    DEFINE_HANDLER(MSG_CORPSE_QUERY,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCorpseQueryOpcode);
    DEFINE_HANDLER(CMSG_GMTICKET_DELETETICKET,        STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMTicketDeleteTicketOpcode);
    INVALID_PACKET(SMSG_GMTICKET_DELETETICKET,        Reason::SendByServer);
    INVALID_PACKET(SMSG_CHAT_WRONG_FACTION,           Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GMTICKET_SYSTEMSTATUS,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGMTicketSystemStatusOpcode);
    INVALID_PACKET(SMSG_GMTICKET_SYSTEMSTATUS,        Reason::SendByServer);
               // Can call convert corpse on different map.
    DEFINE_HANDLER(CMSG_SPIRIT_HEALER_ACTIVATE,       STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleSpiritHealerActivateOpcode);
    INVALID_PACKET(CMSG_SET_STAT_CHEAT,               Reason::Unhandled);
    INVALID_PACKET(SMSG_SET_REST_START,               Reason::SendByServer);
    INVALID_PACKET(CMSG_SKILL_BUY_STEP,               Reason::Unhandled);
    INVALID_PACKET(CMSG_SKILL_BUY_RANK,               Reason::Unhandled);
    INVALID_PACKET(CMSG_XP_CHEAT,                     Reason::Unhandled);
    INVALID_PACKET(SMSG_SPIRIT_HEALER_CONFIRM,        Reason::SendByServer);
    INVALID_PACKET(CMSG_CHARACTER_POINT_CHEAT,        Reason::Unhandled);
    INVALID_PACKET(SMSG_GOSSIP_POI,                   Reason::SendByServer);
    DEFINE_HANDLER(CMSG_CHAT_IGNORED,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChatIgnoredOpcode);
    INVALID_PACKET(CMSG_GM_VISION,                    Reason::Unhandled);
    INVALID_PACKET(CMSG_SERVER_COMMAND,               Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_SILENCE,                   Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_REVEALTO,                  Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_RESURRECT,                 Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_SUMMONMOB,                 Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_MOVECORPSE,                Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_FREEZE,                    Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_UBERINVIS,                 Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_REQUEST_PLAYER_INFO,       Reason::Unhandled);
    INVALID_PACKET(SMSG_GM_PLAYER_INFO,               Reason::Unhandled);
    DEFINE_HANDLER(CMSG_GUILD_RANK,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildRankOpcode);
    DEFINE_HANDLER(CMSG_GUILD_ADD_RANK,               STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildAddRankOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DEL_RANK,               STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDelRankOpcode);
    DEFINE_HANDLER(CMSG_GUILD_SET_PUBLIC_NOTE,        STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildSetPublicNoteOpcode);
    DEFINE_HANDLER(CMSG_GUILD_SET_OFFICER_NOTE,       STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildSetOfficerNoteOpcode);
    INVALID_PACKET(SMSG_LOGIN_VERIFY_WORLD,           Reason::SendByServer);
    INVALID_PACKET(CMSG_CLEAR_EXPLORATION,            Reason::Unhandled);
    DEFINE_HANDLER(CMSG_SEND_MAIL,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSendMail);
    INVALID_PACKET(SMSG_SEND_MAIL_RESULT,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GET_MAIL_LIST,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGetMailList);
    INVALID_PACKET(SMSG_MAIL_LIST_RESULT,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_LIST,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlefieldListOpcode);
    INVALID_PACKET(SMSG_BATTLEFIELD_LIST,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_JOIN,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlefieldJoinOpcode);
    INVALID_PACKET(SMSG_BATTLEFIELD_WIN,              Reason::SendByServer);
    INVALID_PACKET(SMSG_BATTLEFIELD_LOSE,             Reason::SendByServer);
    INVALID_PACKET(CMSG_TAXICLEARNODE,                Reason::Unhandled);
    INVALID_PACKET(CMSG_TAXIENABLENODE,               Reason::Unhandled);
    DEFINE_HANDLER(CMSG_ITEM_TEXT_QUERY,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleItemTextQuery);
    INVALID_PACKET(SMSG_ITEM_TEXT_QUERY_RESPONSE,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_MAIL_TAKE_MONEY,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailTakeMoney);
    DEFINE_HANDLER(CMSG_MAIL_TAKE_ITEM,               STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD, /*COD*/ &WorldSession::HandleMailTakeItem);
    DEFINE_HANDLER(CMSG_MAIL_MARK_AS_READ,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailMarkAsRead);
    DEFINE_HANDLER(CMSG_MAIL_RETURN_TO_SENDER,        STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMailReturnToSender);
    DEFINE_HANDLER(CMSG_MAIL_DELETE,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailDelete);
    DEFINE_HANDLER(CMSG_MAIL_CREATE_TEXT_ITEM,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailCreateTextItem);
    INVALID_PACKET(SMSG_SPELLLOGMISS,                 Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELLLOGEXECUTE,              Reason::SendByServer);
    INVALID_PACKET(SMSG_DEBUGAURAPROC,                Reason::SendByServer);
    INVALID_PACKET(SMSG_PERIODICAURALOG,              Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELLDAMAGESHIELD,            Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELLNONMELEEDAMAGELOG,       Reason::SendByServer);
    DEFINE_HANDLER(CMSG_LEARN_TALENT,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleLearnTalentOpcode);
    INVALID_PACKET(SMSG_RESURRECT_FAILED,             Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TOGGLE_PVP,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTogglePvP);
    INVALID_PACKET(SMSG_ZONE_UNDER_ATTACK,            Reason::SendByServer);
    DEFINE_HANDLER(MSG_AUCTION_HELLO,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAuctionHelloOpcode);
    DEFINE_HANDLER(CMSG_AUCTION_SELL_ITEM,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionSellItem);
    DEFINE_HANDLER(CMSG_AUCTION_REMOVE_ITEM,          STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionRemoveItem);
    DEFINE_HANDLER(CMSG_AUCTION_LIST_ITEMS,           STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionListItems);
    DEFINE_HANDLER(CMSG_AUCTION_LIST_OWNER_ITEMS,     STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionListOwnerItems);
    DEFINE_HANDLER(CMSG_AUCTION_PLACE_BID,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionPlaceBid);
    INVALID_PACKET(SMSG_AUCTION_COMMAND_RESULT,       Reason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_LIST_RESULT,          Reason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_OWNER_LIST_RESULT,    Reason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_BIDDER_NOTIFICATION,  Reason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_OWNER_NOTIFICATION,   Reason::SendByServer);
    INVALID_PACKET(SMSG_PROCRESIST,                   Reason::SendByServer);
    INVALID_PACKET(SMSG_STANDSTATE_CHANGE_FAILURE,    Reason::SendByServer);
    INVALID_PACKET(SMSG_DISPEL_FAILED,                Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELLORDAMAGE_IMMUNE,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_AUCTION_LIST_BIDDER_ITEMS,    STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionListBidderItems);
    INVALID_PACKET(SMSG_AUCTION_BIDDER_LIST_RESULT,   Reason::SendByServer);
    INVALID_PACKET(SMSG_SET_FLAT_SPELL_MODIFIER,      Reason::SendByServer);
    INVALID_PACKET(SMSG_SET_PCT_SPELL_MODIFIER,       Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_AMMO,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetAmmoOpcode);
    INVALID_PACKET(SMSG_CORPSE_RECLAIM_DELAY,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_ACTIVE_MOVER,             STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleSetActiveMoverOpcode);
    DEFINE_HANDLER(CMSG_PET_CANCEL_AURA,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetCancelAuraOpcode);
    INVALID_PACKET(CMSG_PLAYER_AI_CHEAT,              Reason::Unhandled);
    DEFINE_HANDLER(CMSG_CANCEL_AUTO_REPEAT_SPELL,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCancelAutoRepeatSpellOpcode);
    INVALID_PACKET(MSG_GM_ACCOUNT_ONLINE,             Reason::Unhandled);
    DEFINE_HANDLER(MSG_LIST_STABLED_PETS,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleListStabledPetsOpcode);
    DEFINE_HANDLER(CMSG_STABLE_PET,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStablePet);
    DEFINE_HANDLER(CMSG_UNSTABLE_PET,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleUnstablePet);
    DEFINE_HANDLER(CMSG_BUY_STABLE_SLOT,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBuyStableSlot);
    INVALID_PACKET(SMSG_STABLE_RESULT,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_STABLE_REVIVE_PET,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStableRevivePet);
    DEFINE_HANDLER(CMSG_STABLE_SWAP_PET,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStableSwapPet);
    DEFINE_HANDLER(MSG_QUEST_PUSH_RESULT,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestPushResult);
    INVALID_PACKET(SMSG_PLAY_MUSIC,                   Reason::SendByServer);
    INVALID_PACKET(SMSG_PLAY_OBJECT_SOUND,            Reason::SendByServer);
    DEFINE_HANDLER(CMSG_REQUEST_PET_INFO,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleRequestPetInfoOpcode);
    DEFINE_HANDLER(CMSG_FAR_SIGHT,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleFarSightOpcode);
    INVALID_PACKET(SMSG_SPELLDISPELLOG,               Reason::SendByServer);
    INVALID_PACKET(SMSG_DAMAGE_CALC_LOG,              Reason::SendByServer);
    INVALID_PACKET(CMSG_ENABLE_DAMAGE_LOG,            Reason::Unhandled);
    DEFINE_HANDLER(CMSG_GROUP_CHANGE_SUB_GROUP,       STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupChangeSubGroupOpcode);
    DEFINE_HANDLER(CMSG_REQUEST_PARTY_MEMBER_STATS,   STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRequestPartyMemberStatsOpcode);
    DEFINE_HANDLER(CMSG_GROUP_SWAP_SUB_GROUP,         STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupSwapSubGroupOpcode);
    INVALID_PACKET(CMSG_RESET_FACTION_CHEAT,          Reason::Unhandled);
    DEFINE_HANDLER(CMSG_AUTOSTORE_BANK_ITEM,          STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoStoreBankItemOpcode);
    DEFINE_HANDLER(CMSG_AUTOBANK_ITEM,                STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoBankItemOpcode);
    DEFINE_HANDLER(MSG_QUERY_NEXT_MAIL_TIME,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQueryNextMailTime);
    INVALID_PACKET(SMSG_RECEIVED_MAIL,                Reason::SendByServer);
    INVALID_PACKET(SMSG_RAID_GROUP_ONLY,              Reason::SendByServer);
    INVALID_PACKET(CMSG_SET_DURABILITY_CHEAT,         Reason::Unhandled);
    INVALID_PACKET(CMSG_SET_PVP_RANK_CHEAT,           Reason::Unhandled);
    INVALID_PACKET(CMSG_ADD_PVP_MEDAL_CHEAT,          Reason::Unhandled);
    INVALID_PACKET(CMSG_DEL_PVP_MEDAL_CHEAT,          Reason::Unhandled);
    INVALID_PACKET(CMSG_SET_PVP_TITLE,                Reason::Unhandled);
    INVALID_PACKET(SMSG_PVP_CREDIT,                   Reason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_REMOVED_NOTIFICATION, Reason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_RAID_CONVERT,           STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupRaidConvertOpcode);
    DEFINE_HANDLER(CMSG_GROUP_ASSISTANT_LEADER,       STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupAssistantLeaderOpcode);
    DEFINE_HANDLER(CMSG_BUYBACK_ITEM,                 STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleBuybackItem);
    INVALID_PACKET(SMSG_SERVER_MESSAGE,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_MEETINGSTONE_JOIN,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMeetingStoneJoinOpcode);
    DEFINE_HANDLER(CMSG_MEETINGSTONE_LEAVE,           STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMeetingStoneLeaveOpcode);
    INVALID_PACKET(CMSG_MEETINGSTONE_CHEAT,           Reason::Unhandled);
    INVALID_PACKET(SMSG_MEETINGSTONE_SETQUEUE,        Reason::SendByServer);
    DEFINE_HANDLER(CMSG_MEETINGSTONE_INFO,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMeetingStoneInfoOpcode);
    INVALID_PACKET(SMSG_MEETINGSTONE_COMPLETE,        Reason::SendByServer);
    INVALID_PACKET(SMSG_MEETINGSTONE_IN_PROGRESS,     Reason::SendByServer);
    INVALID_PACKET(SMSG_MEETINGSTONE_MEMBER_ADDED,    Reason::SendByServer);
    INVALID_PACKET(CMSG_GMTICKETSYSTEM_TOGGLE,        Reason::Unhandled);
    DEFINE_HANDLER(CMSG_CANCEL_GROWTH_AURA,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCancelGrowthAuraOpcode);
    INVALID_PACKET(SMSG_CANCEL_AUTO_REPEAT,           Reason::SendByServer);
    INVALID_PACKET(SMSG_STANDSTATE_UPDATE,            Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ALL_PASSED,              Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ROLL_WON,                Reason::SendByServer);
    DEFINE_HANDLER(CMSG_LOOT_ROLL,                    STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleLootRoll);
    INVALID_PACKET(SMSG_LOOT_START_ROLL,              Reason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ROLL,                    Reason::SendByServer);
    DEFINE_HANDLER(CMSG_LOOT_MASTER_GIVE,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleLootMasterGiveOpcode);
    INVALID_PACKET(SMSG_LOOT_MASTER_LIST,             Reason::SendByServer);
    INVALID_PACKET(SMSG_SET_FORCED_REACTIONS,         Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_FAILED_OTHER,           Reason::SendByServer);
    INVALID_PACKET(SMSG_GAMEOBJECT_RESET_STATE,       Reason::SendByServer);
    DEFINE_HANDLER(CMSG_REPAIR_ITEM,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleRepairItemOpcode);
    INVALID_PACKET(SMSG_CHAT_PLAYER_NOT_FOUND,        Reason::SendByServer);
    DEFINE_HANDLER(MSG_TALENT_WIPE_CONFIRM,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTalentWipeConfirmOpcode);
    INVALID_PACKET(SMSG_SUMMON_REQUEST,               Reason::SendByServer);
    DEFINE_HANDLER(CMSG_SUMMON_RESPONSE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSummonResponseOpcode);
    INVALID_PACKET(MSG_MOVE_TOGGLE_GRAVITY_CHEAT,     Reason::Unhandled);
    INVALID_PACKET(SMSG_MONSTER_MOVE_TRANSPORT,       Reason::SendByServer);
    INVALID_PACKET(SMSG_PET_BROKEN,                   Reason::SendByServer);
    INVALID_PACKET(MSG_MOVE_FEATHER_FALL,             Reason::Unhandled);
    INVALID_PACKET(MSG_MOVE_WATER_WALK,               Reason::Unhandled);
    INVALID_PACKET(CMSG_SERVER_BROADCAST,             Reason::Unhandled);
    DEFINE_HANDLER(CMSG_SELF_RES,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSelfResOpcode);
    INVALID_PACKET(SMSG_FEIGN_DEATH_RESISTED,         Reason::SendByServer);
    INVALID_PACKET(CMSG_RUN_SCRIPT,                   Reason::Unhandled);
    INVALID_PACKET(SMSG_SCRIPT_MESSAGE,               Reason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_COUNTDOWN,               Reason::SendByServer);
    INVALID_PACKET(SMSG_AREA_TRIGGER_MESSAGE,         Reason::SendByServer);
    DEFINE_HANDLER(CMSG_TOGGLE_HELM,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleShowingHelmOpcode);
    DEFINE_HANDLER(CMSG_TOGGLE_CLOAK,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleShowingCloakOpcode);
    INVALID_PACKET(SMSG_MEETINGSTONE_JOINFAILED,      Reason::SendByServer);
    INVALID_PACKET(SMSG_PLAYER_SKINNED,               Reason::SendByServer);
    INVALID_PACKET(SMSG_DURABILITY_DAMAGE_DEATH,      Reason::SendByServer);
    INVALID_PACKET(CMSG_SET_EXPLORATION,              Reason::Unhandled);
    DEFINE_HANDLER(CMSG_SET_ACTIONBAR_TOGGLES,        STATUS_AUTHED,    PACKET_PROCESS_MAP,           &WorldSession::HandleSetActionBarTogglesOpcode);
    INVALID_PACKET(MSG_DELETE_GUILD_CHARTER,          Reason::Unhandled);
    DEFINE_HANDLER(MSG_PETITION_RENAME,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionRenameOpcode);
    INVALID_PACKET(SMSG_INIT_WORLD_STATES,            Reason::SendByServer);
    INVALID_PACKET(SMSG_UPDATE_WORLD_STATE,           Reason::SendByServer);
    DEFINE_HANDLER(CMSG_ITEM_NAME_QUERY,              STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleItemNameQueryOpcode);
    INVALID_PACKET(SMSG_ITEM_NAME_QUERY_RESPONSE,     Reason::SendByServer);
    INVALID_PACKET(SMSG_PET_ACTION_FEEDBACK,          Reason::SendByServer);
    DEFINE_HANDLER(CMSG_CHAR_RENAME,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharRenameOpcode);
    INVALID_PACKET(SMSG_CHAR_RENAME,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_MOVE_SPLINE_DONE,             STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveSplineDoneOpcode);
    DEFINE_HANDLER(CMSG_MOVE_FALL_RESET,              STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    INVALID_PACKET(SMSG_INSTANCE_SAVE_CREATED,        Reason::SendByServer);
    INVALID_PACKET(SMSG_RAID_INSTANCE_INFO,           Reason::SendByServer);
    DEFINE_HANDLER(CMSG_REQUEST_RAID_INFO,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleRequestRaidInfoOpcode);
    DEFINE_HANDLER(CMSG_MOVE_TIME_SKIPPED,            STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveTimeSkippedOpcode);
    DEFINE_HANDLER(CMSG_MOVE_FEATHER_FALL_ACK,        STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementFlagChangeToggleAck);
    DEFINE_HANDLER(CMSG_MOVE_WATER_WALK_ACK,          STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementFlagChangeToggleAck);
    DEFINE_HANDLER(CMSG_MOVE_NOT_ACTIVE_MOVER,        STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveNotActiveMoverOpcode);
    INVALID_PACKET(SMSG_PLAY_SOUND,                   Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_STATUS,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlefieldStatusOpcode);
    INVALID_PACKET(SMSG_BATTLEFIELD_STATUS,           Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_PORT,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleBattleFieldPortOpcode);
    DEFINE_HANDLER(MSG_INSPECT_HONOR_STATS,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleInspectHonorStatsOpcode);
    DEFINE_HANDLER(CMSG_BATTLEMASTER_HELLO,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlemasterHelloOpcode);
    INVALID_PACKET(CMSG_MOVE_START_SWIM_CHEAT,        Reason::Unhandled);
    INVALID_PACKET(CMSG_MOVE_STOP_SWIM_CHEAT,         Reason::Unhandled);
    INVALID_PACKET(SMSG_FORCE_WALK_SPEED_CHANGE,      Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_WALK_SPEED_CHANGE_ACK,  STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_SWIM_BACK_SPEED_CHANGE, Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK,  STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT, &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_TURN_RATE_CHANGE,       Reason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_TURN_RATE_CHANGE_ACK,   STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    DEFINE_HANDLER(MSG_PVP_LOG_DATA,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePVPLogDataOpcode);
    DEFINE_HANDLER(CMSG_LEAVE_BATTLEFIELD,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleLeaveBattlefieldOpcode);
    DEFINE_HANDLER(CMSG_AREA_SPIRIT_HEALER_QUERY,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAreaSpiritHealerQueryOpcode);
    DEFINE_HANDLER(CMSG_AREA_SPIRIT_HEALER_QUEUE,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAreaSpiritHealerQueueOpcode);
    INVALID_PACKET(SMSG_AREA_SPIRIT_HEALER_TIME,      Reason::SendByServer);
    INVALID_PACKET(CMSG_GM_UNTEACH,                   Reason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    INVALID_PACKET(SMSG_WARDEN_DATA,                  Reason::SendByServer);
    DEFINE_HANDLER(CMSG_WARDEN_DATA,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleWardenDataOpcode);
#endif
    INVALID_PACKET(SMSG_GROUP_JOINED_BATTLEGROUND,    Reason::SendByServer);
    DEFINE_HANDLER(MSG_BATTLEGROUND_PLAYER_POSITIONS, STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattleGroundPlayerPositionsOpcode);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    INVALID_PACKET(SMSG_PARTY_MEMBER_STATS_FULL,      Reason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    DEFINE_HANDLER(CMSG_PET_STOP_ATTACK,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetStopAttack);
    INVALID_PACKET(SMSG_BINDER_CONFIRM,               Reason::SendByServer);
    INVALID_PACKET(SMSG_BATTLEGROUND_PLAYER_JOINED,   Reason::SendByServer);
    INVALID_PACKET(SMSG_BATTLEGROUND_PLAYER_LEFT,     Reason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEMASTER_JOIN,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleBattlemasterJoinOpcode);
    INVALID_PACKET(SMSG_ADDON_INFO,                   Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_UNLEARN,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetUnlearnOpcode);
    INVALID_PACKET(SMSG_PET_UNLEARN_CONFIRM,          Reason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_SPELL_AUTOCAST,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetSpellAutocastOpcode);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    INVALID_PACKET(SMSG_WEATHER,                      Reason::SendByServer);
    INVALID_PACKET(SMSG_PLAY_TIME_WARNING,            Reason::SendByServer);
    INVALID_PACKET(SMSG_MINIGAME_SETUP,               Reason::SendByServer);
    INVALID_PACKET(SMSG_MINIGAME_STATE,               Reason::SendByServer);
    INVALID_PACKET(CMSG_MINIGAME_MOVE,                Reason::Unhandled);
    INVALID_PACKET(SMSG_MINIGAME_MOVE_FAILED,         Reason::SendByServer);
    INVALID_PACKET(SMSG_RAID_INSTANCE_MESSAGE,        Reason::SendByServer);
    INVALID_PACKET(SMSG_COMPRESSED_MOVES,             Reason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    DEFINE_HANDLER(CMSG_GUILD_INFO_TEXT,              STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildChangeInfoTextOpcode);
    INVALID_PACKET(SMSG_CHAT_RESTRICTED,              Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_RUN_SPEED,         Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_RUN_BACK_SPEED,    Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_SWIM_SPEED,        Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_WALK_SPEED,        Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_SWIM_BACK_SPEED,   Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_TURN_RATE,         Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_UNROOT,           Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_FEATHER_FALL,     Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_NORMAL_FALL,      Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_SET_HOVER,        Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_UNSET_HOVER,      Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_WATER_WALK,       Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_LAND_WALK,        Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_START_SWIM,       Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_STOP_SWIM,        Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_SET_RUN_MODE,     Reason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_SET_WALK_MODE,    Reason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    INVALID_PACKET(CMSG_GM_NUKE_ACCOUNT,              Reason::Unhandled);
    INVALID_PACKET(MSG_GM_DESTROY_CORPSE,             Reason::Unhandled);
    INVALID_PACKET(CMSG_GM_DESTROY_ONLINE_CORPSE,     Reason::Unhandled);
    DEFINE_HANDLER(CMSG_ACTIVATETAXIEXPRESS,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleActivateTaxiExpressOpcode);
    INVALID_PACKET(SMSG_SET_FACTION_ATWAR,            Reason::SendByServer);
    INVALID_PACKET(SMSG_GAMETIMEBIAS_SET,             Reason::SendByServer);
    INVALID_PACKET(CMSG_DEBUG_ACTIONS_START,          Reason::Unhandled);
    INVALID_PACKET(CMSG_DEBUG_ACTIONS_STOP,           Reason::Unhandled);
    DEFINE_HANDLER(CMSG_SET_FACTION_INACTIVE,         STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetFactionInactiveOpcode);
    DEFINE_HANDLER(CMSG_SET_WATCHED_FACTION,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetWatchedFactionOpcode);
    INVALID_PACKET(MSG_MOVE_TIME_SKIPPED,             Reason::Unhandled);
    INVALID_PACKET(SMSG_SPLINE_MOVE_ROOT,             Reason::SendByServer);
    INVALID_PACKET(CMSG_SET_EXPLORATION_ALL,          Reason::Unhandled);
    INVALID_PACKET(SMSG_INVALIDATE_PLAYER,            Reason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    DEFINE_HANDLER(CMSG_RESET_INSTANCES,              STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleResetInstancesOpcode);
    INVALID_PACKET(SMSG_INSTANCE_RESET,               Reason::SendByServer);
    INVALID_PACKET(SMSG_INSTANCE_RESET_FAILED,        Reason::SendByServer);
    INVALID_PACKET(SMSG_UPDATE_LAST_INSTANCE,         Reason::SendByServer);
    DEFINE_HANDLER(MSG_RAID_TARGET_UPDATE,            STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRaidTargetUpdateOpcode);
    DEFINE_HANDLER(MSG_RAID_READY_CHECK,              STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRaidReadyCheckOpcode);
    INVALID_PACKET(CMSG_LUA_USAGE,                    Reason::Unhandled);
    INVALID_PACKET(SMSG_PET_ACTION_SOUND,             Reason::SendByServer);
    INVALID_PACKET(SMSG_PET_DISMISS_SOUND,            Reason::SendByServer);
    INVALID_PACKET(SMSG_GHOSTEE_GONE,                 Reason::SendByServer);
    INVALID_PACKET(CMSG_GM_UPDATE_TICKET_STATUS,      Reason::Unhandled);
    INVALID_PACKET(SMSG_GM_TICKET_STATUS_UPDATE,      Reason::SendByServer);
    INVALID_PACKET(MSG_SET_DUNGEON_DIFFICULTY,        Reason::Unhandled);
    DEFINE_HANDLER(CMSG_GMSURVEY_SUBMIT,              STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMSurveySubmitOpcode);
    INVALID_PACKET(SMSG_UPDATE_INSTANCE_OWNERSHIP,    Reason::SendByServer);
    INVALID_PACKET(CMSG_IGNORE_KNOCKBACK_CHEAT,       Reason::Unhandled);
    INVALID_PACKET(SMSG_CHAT_PLAYER_AMBIGUOUS,        Reason::SendByServer);
    INVALID_PACKET(MSG_DELAY_GHOST_TELEPORT,          Reason::Unhandled);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    INVALID_PACKET(SMSG_SPELLINSTAKILLLOG,            Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_UPDATE_CHAIN_TARGETS,   Reason::SendByServer);
    INVALID_PACKET(CMSG_CHAT_FILTERED,                Reason::Unhandled);
    INVALID_PACKET(SMSG_EXPECTED_SPAM_RECORDS,        Reason::SendByServer);
    INVALID_PACKET(SMSG_SPELLSTEALLOG,                Reason::SendByServer);
    INVALID_PACKET(CMSG_LOTTERY_QUERY_OBSOLETE,       Reason::Unhandled);
    INVALID_PACKET(SMSG_LOTTERY_QUERY_RESULT_OBSOLETE, Reason::SendByServer);
    INVALID_PACKET(CMSG_BUY_LOTTERY_TICKET_OBSOLETE,  Reason::Unhandled);
    INVALID_PACKET(SMSG_LOTTERY_RESULT_OBSOLETE,      Reason::SendByServer);
    INVALID_PACKET(SMSG_CHARACTER_PROFILE,            Reason::SendByServer);
    INVALID_PACKET(SMSG_CHARACTER_PROFILE_REALM_CONNECTED, Reason::SendByServer);
    INVALID_PACKET(SMSG_DEFENSE_MESSAGE,              Reason::SendByServer);
#endif

    return list;
}

Handlers const handlerList = BuildOpcodeList();

constexpr OpcodeHandler emptyHandler = {
    "<none>",
    STATUS_UNHANDLED,
    PACKET_PROCESS_MAX_TYPE,
    &WorldSession::Handle_NULL
};

OpcodeHandler const& LookupOpcodeHandler(uint16 id)
{
    if (id >= NUM_MSG_TYPES)
        return emptyHandler;
    return handlerList.handlers[id];
}

char const* LookupOpcodeName(uint16 id)
{
    if (id >= NUM_MSG_TYPES)
        return "Received unknown opcode, it's more than max!";
    return handlerList.handlers[id].name;
}
