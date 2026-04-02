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

struct Handlers
{
    // TODO: Change to sparse vector or map<> for 1.13+
    OpcodeHandler handlers[NUM_MSG_TYPES];
};

template<typename T>
struct get_packet_class
{
};

template<typename PacketClass>
struct get_packet_class<void(WorldSession::*)(PacketClass const&)>
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
        ref.impl = OpcodeHandlerPacketImplDetails{ \
            /*status*/ (requiredState), \
            /*packetProcessing*/ (schedulingStrategy), \
            /*readPacket*/ static_cast<std::unique_ptr<ClientPacket>(*)(WorldPacket&)>(&WorldSession::Handle_GenericRead<get_packet_class<decltype(handlerPtr)>::type>), \
            /*handler*/ static_cast<void (WorldSession::*)(ClientPacket const&)>(&WorldSession::Handle_GenericPacket<get_packet_class<decltype(handlerPtr)>::type, (handlerPtr)>) \
        };\
    }

    // For unhandled packets
    #define INVALID_PACKET(opcode, reason) \
    { \
        OpcodeHandler& ref = list.handlers[(opcode)]; \
        ref.name = #opcode; \
        ref.impl = nonstd::make_unexpected((reason)); \
    }

    // Correspondence between opcodes and their names
    INVALID_PACKET(MSG_NULL_ACTION,                   UnhandleReason::Invalid);
    INVALID_PACKET(CMSG_BOOTME,                       UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_DBLOOKUP,                     UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_DBLOOKUP,                     UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_QUERY_OBJECT_POSITION,        UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_QUERY_OBJECT_POSITION,        UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_QUERY_OBJECT_ROTATION,        UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_QUERY_OBJECT_ROTATION,        UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_WORLD_TELEPORT,               STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleWorldTeleportOpcode);
    DEFINE_HANDLER(CMSG_TELEPORT_TO_UNIT,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleTeleportToUnitOpcode);
    INVALID_PACKET(CMSG_ZONE_MAP,                     UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_ZONE_MAP,                     UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_DEBUG_CHANGECELLZONE,         UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_EMBLAZON_TABARD_OBSOLETE,     UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_UNEMBLAZON_TABARD_OBSOLETE,   UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_RECHARGE,                     UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_LEARN_SPELL,                  UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_CREATEMONSTER,                UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_DESTROYMONSTER,               UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_CREATEITEM,                   UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_CREATEGAMEOBJECT,             UnhandleReason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(SMSG_CHECK_FOR_BOTS,               UnhandleReason::SendByServer);
#endif
    INVALID_PACKET(CMSG_MAKEMONSTERATTACKGUID,        UnhandleReason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_BOT_DETECTED2,                UnhandleReason::Unhandled);
#endif
    INVALID_PACKET(CMSG_FORCEACTION,                  UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_FORCEACTIONONOTHER,           UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_FORCEACTIONSHOW,              UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_FORCEACTIONSHOW,              UnhandleReason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_PETGODMODE,                   UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_PETGODMODE,                   UnhandleReason::SendByServer);
#endif
    INVALID_PACKET(SMSG_DEBUGINFOSPELLMISS_OBSOLETE,  UnhandleReason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_WEATHER_SPEED_CHEAT,          UnhandleReason::Unhandled);
#endif
    INVALID_PACKET(CMSG_UNDRESSPLAYER,                UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_BEASTMASTER,                  UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GODMODE,                      UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GODMODE,                      UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_CHEAT_SETMONEY,               UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_LEVEL_CHEAT,                  UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_PET_LEVEL_CHEAT,              UnhandleReason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(CMSG_SET_WORLDSTATE,               UnhandleReason::Unhandled);
#endif
    INVALID_PACKET(CMSG_COOLDOWN_CHEAT,               UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_USE_SKILL_CHEAT,              UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_FLAG_QUEST,                   UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_FLAG_QUEST_FINISH,            UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_CLEAR_QUEST,                  UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SEND_EVENT,                   UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_DEBUG_AISTATE,                UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_DEBUG_AISTATE,                UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_DISABLE_PVP_CHEAT,            UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_ADVANCE_SPAWN_TIME,           UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_PVP_PORT_OBSOLETE,            UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_AUTH_SRP6_BEGIN,              UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_AUTH_SRP6_PROOF,              UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_AUTH_SRP6_RECODE,             UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_CHAR_CREATE,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharCreateOpcode);
    DEFINE_HANDLER(CMSG_CHAR_ENUM,                    STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharEnumOpcode);
    DEFINE_HANDLER(CMSG_CHAR_DELETE,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharDeleteOpcode);
    INVALID_PACKET(SMSG_AUTH_SRP6_RESPONSE,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CHAR_CREATE,                  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CHAR_ENUM,                    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CHAR_DELETE,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PLAYER_LOGIN,                 STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandlePlayerLoginOpcode);
    INVALID_PACKET(SMSG_NEW_WORLD,                    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_TRANSFER_PENDING,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_TRANSFER_ABORTED,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CHARACTER_LOGIN_FAILED,       UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOGIN_SETTIMESPEED,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GAMETIME_UPDATE,              UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GAMETIME_SET,                 UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GAMETIME_SET,                 UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GAMESPEED_SET,                UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GAMESPEED_SET,                UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_SERVERTIME,                   UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_SERVERTIME,                   UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PLAYER_LOGOUT,                STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandlePlayerLogoutOpcode);
    DEFINE_HANDLER(CMSG_LOGOUT_REQUEST,               STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleLogoutRequestOpcode);
    INVALID_PACKET(SMSG_LOGOUT_RESPONSE,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOGOUT_COMPLETE,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_LOGOUT_CANCEL,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleLogoutCancelOpcode);
    INVALID_PACKET(SMSG_LOGOUT_CANCEL_ACK,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_NAME_QUERY,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQueryPlayerNameOpcode);
    INVALID_PACKET(SMSG_NAME_QUERY_RESPONSE,          UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_NAME_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetNameQueryOpcode);
    INVALID_PACKET(SMSG_PET_NAME_QUERY_RESPONSE,      UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_QUERY,                  STATUS_AUTHED,    PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildQueryOpcode);
    INVALID_PACKET(SMSG_GUILD_QUERY_RESPONSE,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_ITEM_QUERY_SINGLE,            STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleItemQuerySingleOpcode);
    INVALID_PACKET(CMSG_ITEM_QUERY_MULTIPLE,          UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_ITEM_QUERY_SINGLE_RESPONSE,   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_QUERY_MULTIPLE_RESPONSE, UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PAGE_TEXT_QUERY,              STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandlePageTextQueryOpcode);
    INVALID_PACKET(SMSG_PAGE_TEXT_QUERY_RESPONSE,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUEST_QUERY,                  STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleQuestQueryOpcode);
    INVALID_PACKET(SMSG_QUEST_QUERY_RESPONSE,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GAMEOBJECT_QUERY,             STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleGameObjectQueryOpcode);
    INVALID_PACKET(SMSG_GAMEOBJECT_QUERY_RESPONSE,    UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_CREATURE_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleCreatureQueryOpcode);
    INVALID_PACKET(SMSG_CREATURE_QUERY_RESPONSE,      UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_WHO,                          STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleWhoOpcode);
    INVALID_PACKET(SMSG_WHO,                          UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_WHOIS,                        STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleWhoisOpcode);
    INVALID_PACKET(SMSG_WHOIS,                        UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FRIEND_LIST,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleFriendListOpcode);
    INVALID_PACKET(SMSG_FRIEND_LIST,                  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_FRIEND_STATUS,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_ADD_FRIEND,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAddFriendOpcode);
    DEFINE_HANDLER(CMSG_DEL_FRIEND,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDelFriendOpcode);
    INVALID_PACKET(SMSG_IGNORE_LIST,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_ADD_IGNORE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAddIgnoreOpcode);
    DEFINE_HANDLER(CMSG_DEL_IGNORE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDelIgnoreOpcode);
    DEFINE_HANDLER(CMSG_GROUP_INVITE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupInviteOpcode);
    INVALID_PACKET(SMSG_GROUP_INVITE,                 UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GROUP_CANCEL,                 UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GROUP_CANCEL,                 UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_ACCEPT,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupAcceptOpcode);
    DEFINE_HANDLER(CMSG_GROUP_DECLINE,                STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupDeclineOpcode);
    INVALID_PACKET(SMSG_GROUP_DECLINE,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_UNINVITE,               STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupUninviteOpcode);
    DEFINE_HANDLER(CMSG_GROUP_UNINVITE_GUID,          STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupUninviteGuidOpcode);
    INVALID_PACKET(SMSG_GROUP_UNINVITE,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_SET_LEADER,             STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupSetLeaderOpcode);
    INVALID_PACKET(SMSG_GROUP_SET_LEADER,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_LOOT_METHOD,                  STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleLootMethodOpcode);
    DEFINE_HANDLER(CMSG_GROUP_DISBAND,                STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupDisbandOpcode);
    INVALID_PACKET(SMSG_GROUP_DESTROYED,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GROUP_LIST,                   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PARTY_MEMBER_STATS,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PARTY_COMMAND_RESULT,         UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_UPDATE_GROUP_MEMBERS,          UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_GUILD_CREATE,                 STATUS_NEVER,     PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildCreateOpcode);
    DEFINE_HANDLER(CMSG_GUILD_INVITE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildInviteOpcode);
    INVALID_PACKET(SMSG_GUILD_INVITE,                 UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_ACCEPT,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildAcceptOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DECLINE,                STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDeclineOpcode);
    INVALID_PACKET(SMSG_GUILD_DECLINE,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_INFO,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildInfoOpcode);
    INVALID_PACKET(SMSG_GUILD_INFO,                   UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_ROSTER,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildRosterOpcode);
    INVALID_PACKET(SMSG_GUILD_ROSTER,                 UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GUILD_PROMOTE,                STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildPromoteOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DEMOTE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDemoteOpcode);
    DEFINE_HANDLER(CMSG_GUILD_LEAVE,                  STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildLeaveOpcode);
    DEFINE_HANDLER(CMSG_GUILD_REMOVE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildRemoveOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DISBAND,                STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDisbandOpcode);
    DEFINE_HANDLER(CMSG_GUILD_LEADER,                 STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildLeaderOpcode);
    DEFINE_HANDLER(CMSG_GUILD_MOTD,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildMOTDOpcode);
    INVALID_PACKET(SMSG_GUILD_EVENT,                  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GUILD_COMMAND_RESULT,         UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_UPDATE_GUILD,                  UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_MESSAGECHAT,                  STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleChatMessageOpcode);
    INVALID_PACKET(SMSG_MESSAGECHAT,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_JOIN_CHANNEL,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleJoinChannelOpcode);
    DEFINE_HANDLER(CMSG_LEAVE_CHANNEL,                STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleLeaveChannelOpcode);
    INVALID_PACKET(SMSG_CHANNEL_NOTIFY,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_CHANNEL_LIST,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChannelListOpcode);
    INVALID_PACKET(SMSG_CHANNEL_LIST,                 UnhandleReason::SendByServer);
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
    INVALID_PACKET(SMSG_UPDATE_OBJECT,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DESTROY_OBJECT,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_USE_ITEM,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleUseItemOpcode);
    DEFINE_HANDLER(CMSG_OPEN_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleOpenItemOpcode);
    DEFINE_HANDLER(CMSG_READ_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleReadItemOpcode);
    INVALID_PACKET(SMSG_READ_ITEM_OK,                 UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_READ_ITEM_FAILED,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_COOLDOWN,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GAMEOBJ_USE,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGameObjectUseOpcode);
    INVALID_PACKET(CMSG_GAMEOBJ_CHAIR_USE_OBSOLETE,   UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GAMEOBJECT_CUSTOM_ANIM,       UnhandleReason::SendByServer);
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
    INVALID_PACKET(MSG_MOVE_TOGGLE_LOGGING,           UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_TELEPORT,                 UnhandleReason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_TELEPORT_CHEAT,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMoveSetRawPosition);
    DEFINE_HANDLER(MSG_MOVE_TELEPORT_ACK,             STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveTeleportAckOpcode);
    INVALID_PACKET(MSG_MOVE_TOGGLE_FALL_LOGGING,      UnhandleReason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_FALL_LAND,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_START_SWIM,               STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_STOP_SWIM,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    INVALID_PACKET(MSG_MOVE_SET_RUN_SPEED_CHEAT,      UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_RUN_SPEED,            UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_RUN_BACK_SPEED_CHEAT, UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_RUN_BACK_SPEED,       UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_WALK_SPEED_CHEAT,     UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_WALK_SPEED,           UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_SPEED_CHEAT,     UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_SPEED,           UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_BACK_SPEED_CHEAT,UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_SWIM_BACK_SPEED,      UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_ALL_SPEED_CHEAT,      UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_TURN_RATE_CHEAT,      UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_SET_TURN_RATE,            UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_TOGGLE_COLLISION_CHEAT,   UnhandleReason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_SET_FACING,               STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_SET_PITCH,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    DEFINE_HANDLER(MSG_MOVE_WORLDPORT_ACK,            STATUS_TRANSFER,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMoveWorldportAckOpcode);
    INVALID_PACKET(SMSG_MONSTER_MOVE,                 UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_WATER_WALK,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_LAND_WALK,               UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_MOVE_SET_RAW_POSITION_ACK,     UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_MOVE_SET_RAW_POSITION,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMoveSetRawPosition);
    INVALID_PACKET(SMSG_FORCE_RUN_SPEED_CHANGE,       UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_RUN_SPEED_CHANGE_ACK,   STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_RUN_BACK_SPEED_CHANGE,  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK, STATUS_LOGGEDIN, PACKET_PROCESS_MOVEMENT,    &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_SWIM_SPEED_CHANGE,      UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_SWIM_SPEED_CHANGE_ACK,  STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_MOVE_ROOT,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_MOVE_ROOT_ACK,          STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveRootAck);
    INVALID_PACKET(SMSG_FORCE_MOVE_UNROOT,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_MOVE_UNROOT_ACK,        STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveRootAck);
    INVALID_PACKET(MSG_MOVE_ROOT,                     UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_UNROOT,                   UnhandleReason::Unhandled);
    DEFINE_HANDLER(MSG_MOVE_HEARTBEAT,                STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    INVALID_PACKET(SMSG_MOVE_KNOCK_BACK,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_MOVE_KNOCK_BACK_ACK,          STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveKnockBackAck);
    INVALID_PACKET(MSG_MOVE_KNOCK_BACK,               UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_MOVE_FEATHER_FALL,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_NORMAL_FALL,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_SET_HOVER,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MOVE_UNSET_HOVER,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_MOVE_HOVER_ACK,               STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementFlagChangeToggleAck);
    INVALID_PACKET(MSG_MOVE_HOVER,                    UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_TRIGGER_CINEMATIC_CHEAT,      UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_OPENING_CINEMATIC,            UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_TRIGGER_CINEMATIC,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_NEXT_CINEMATIC_CAMERA,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleNextCinematicCamera);
    DEFINE_HANDLER(CMSG_COMPLETE_CINEMATIC,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCompleteCinematic);
    INVALID_PACKET(SMSG_TUTORIAL_FLAGS,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TUTORIAL_FLAG,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTutorialFlagOpcode);
    DEFINE_HANDLER(CMSG_TUTORIAL_CLEAR,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTutorialClearOpcode);
    DEFINE_HANDLER(CMSG_TUTORIAL_RESET,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTutorialResetOpcode);
    DEFINE_HANDLER(CMSG_STANDSTATECHANGE,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStandStateChangeOpcode);
    DEFINE_HANDLER(CMSG_EMOTE,                        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleEmoteOpcode);
    INVALID_PACKET(SMSG_EMOTE,                        UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TEXT_EMOTE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTextEmoteOpcode);
    INVALID_PACKET(SMSG_TEXT_EMOTE,                   UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_AUTOEQUIP_GROUND_ITEM,        UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_AUTOSTORE_GROUND_ITEM,        UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_AUTOSTORE_LOOT_ITEM,          STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutostoreLootItemOpcode);
    INVALID_PACKET(CMSG_STORE_LOOT_IN_SLOT,           UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_AUTOEQUIP_ITEM,               STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoEquipItemOpcode);
    DEFINE_HANDLER(CMSG_AUTOSTORE_BAG_ITEM,           STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoStoreBagItemOpcode);
    DEFINE_HANDLER(CMSG_SWAP_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSwapItem);
    DEFINE_HANDLER(CMSG_SWAP_INV_ITEM,                STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSwapInvItemOpcode);
    DEFINE_HANDLER(CMSG_SPLIT_ITEM,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSplitItemOpcode);
    DEFINE_HANDLER(CMSG_AUTOEQUIP_ITEM_SLOT,          STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoEquipItemSlotOpcode);
    INVALID_PACKET(CMSG_DROP_ITEM,                    UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_DESTROYITEM,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleDestroyItemOpcode);
    INVALID_PACKET(SMSG_INVENTORY_CHANGE_FAILURE,     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_OPEN_CONTAINER,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_INSPECT,                      STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleInspectOpcode);
    INVALID_PACKET(SMSG_INSPECT,                      UnhandleReason::SendByServer);
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
    INVALID_PACKET(SMSG_TRADE_STATUS,                 UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_TRADE_STATUS_EXTENDED,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_INITIALIZE_FACTIONS,          UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SET_FACTION_VISIBLE,          UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SET_FACTION_STANDING,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_FACTION_ATWAR,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetFactionAtWarOpcode);
    INVALID_PACKET(CMSG_SET_FACTION_CHEAT,            UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_SET_PROFICIENCY,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_ACTION_BUTTON,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetActionButtonOpcode);
    INVALID_PACKET(SMSG_ACTION_BUTTONS,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_INITIAL_SPELLS,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LEARNED_SPELL,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SUPERCEDED_SPELL,             UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_NEW_SPELL_SLOT,               UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_CAST_SPELL,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCastSpellOpcode);
    DEFINE_HANDLER(CMSG_CANCEL_CAST,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCancelCastOpcode);
    INVALID_PACKET(SMSG_CAST_RESULT,                  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_START,                  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_GO,                     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_FAILURE,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_COOLDOWN,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_COOLDOWN_EVENT,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_CANCEL_AURA,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCancelAuraOpcode);
    INVALID_PACKET(SMSG_UPDATE_AURA_DURATION,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PET_CAST_FAILED,              UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_CHANNEL_START,                 UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_CHANNEL_UPDATE,                UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_CANCEL_CHANNELLING,           STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleCancelChanneling);
    INVALID_PACKET(SMSG_AI_REACTION,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_SELECTION,                STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleSetSelectionOpcode);
    INVALID_PACKET(CMSG_SET_TARGET_OBSOLETE,          UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_ATTACKSWING,                  STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleAttackSwingOpcode);
    DEFINE_HANDLER(CMSG_ATTACKSTOP,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandleAttackStopOpcode);
    INVALID_PACKET(SMSG_ATTACKSTART,                  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSTOP,                   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_NOTINRANGE,       UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_BADFACING,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_NOTSTANDING,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_DEADTARGET,       UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKSWING_CANT_ATTACK,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ATTACKERSTATEUPDATE,          UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_VICTIMSTATEUPDATE_OBSOLETE,   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DAMAGE_DONE_OBSOLETE,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DAMAGE_TAKEN_OBSOLETE,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CANCEL_COMBAT,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PLAYER_COMBAT_XP_GAIN_OBSOLETE,UnhandleReason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    INVALID_PACKET(SMSG_SPELLHEALLOG,                 UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELLENERGIZELOG,             UnhandleReason::SendByServer);
#endif
    INVALID_PACKET(CMSG_SHEATHE_OBSOLETE,             UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SAVE_PLAYER,                  UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SETDEATHBINDPOINT,            UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_BINDPOINTUPDATE,              UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GETDEATHBINDZONE,             UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_BINDZONEREPLY,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PLAYERBOUND,                  UnhandleReason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    INVALID_PACKET(SMSG_CLIENT_CONTROL_UPDATE,        UnhandleReason::SendByServer);
#endif
    DEFINE_HANDLER(CMSG_REPOP_REQUEST,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleRepopRequestOpcode);
    INVALID_PACKET(SMSG_RESURRECT_REQUEST,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_RESURRECT_RESPONSE,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleResurrectResponseOpcode);
    DEFINE_HANDLER(CMSG_LOOT,                         STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleLootOpcode);
    DEFINE_HANDLER(CMSG_LOOT_MONEY,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleLootMoneyOpcode);
    DEFINE_HANDLER(CMSG_LOOT_RELEASE,                 STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleLootReleaseOpcode);
    INVALID_PACKET(SMSG_LOOT_RESPONSE,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_RELEASE_RESPONSE,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_REMOVED,                 UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_MONEY_NOTIFY,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ITEM_NOTIFY,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_CLEAR_MONEY,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_PUSH_RESULT,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_REQUESTED,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_OUTOFBOUNDS,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_INBOUNDS,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_COMPLETE,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_WINNER,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_DUEL_ACCEPTED,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDuelAcceptedOpcode);
    DEFINE_HANDLER(CMSG_DUEL_CANCELLED,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleDuelCancelledOpcode);
    INVALID_PACKET(SMSG_MOUNTRESULT,                  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DISMOUNTRESULT,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PUREMOUNT_CANCELLED_OBSOLETE, UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_MOUNTSPECIAL_ANIM,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMountSpecialAnimOpcode);
    INVALID_PACKET(SMSG_MOUNTSPECIAL_ANIM,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PET_TAME_FAILURE,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_SET_ACTION,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetSetAction);
    DEFINE_HANDLER(CMSG_PET_ACTION,                   STATUS_LOGGEDIN,  PACKET_PROCESS_SPELLS,        &WorldSession::HandlePetAction);
    DEFINE_HANDLER(CMSG_PET_ABANDON,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetAbandon);
    DEFINE_HANDLER(CMSG_PET_RENAME,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetRename);
    INVALID_PACKET(SMSG_PET_NAME_INVALID,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PET_SPELLS,                   UnhandleReason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    INVALID_PACKET(SMSG_PET_MODE,                     UnhandleReason::SendByServer);
#endif
    DEFINE_HANDLER(CMSG_GOSSIP_HELLO,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGossipHelloOpcode);
    DEFINE_HANDLER(CMSG_GOSSIP_SELECT_OPTION,         STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGossipSelectOptionOpcode);
    INVALID_PACKET(SMSG_GOSSIP_MESSAGE,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GOSSIP_COMPLETE,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_NPC_TEXT_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleNpcTextQueryOpcode);
    INVALID_PACKET(SMSG_NPC_TEXT_UPDATE,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_NPC_WONT_TALK,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_STATUS_QUERY,      STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverStatusQueryOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_STATUS,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_HELLO,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverHelloOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_LIST,        UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_QUERY_QUEST,       STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverQueryQuestOpcode);
    DEFINE_HANDLER(CMSG_QUESTGIVER_QUEST_AUTOLAUNCH,  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverQuestAutoLaunch);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_DETAILS,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_ACCEPT_QUEST,      STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleQuestgiverAcceptQuestOpcode);
    DEFINE_HANDLER(CMSG_QUESTGIVER_COMPLETE_QUEST,    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverCompleteQuest);
    INVALID_PACKET(SMSG_QUESTGIVER_REQUEST_ITEMS,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_REQUEST_REWARD,    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverRequestRewardOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_OFFER_REWARD,      UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_CHOOSE_REWARD,     STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleQuestgiverChooseRewardOpcode);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_INVALID,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTGIVER_CANCEL,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestgiverCancel);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_COMPLETE,    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_QUESTGIVER_QUEST_FAILED,      UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUESTLOG_SWAP_QUEST,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestLogSwapQuest);
    DEFINE_HANDLER(CMSG_QUESTLOG_REMOVE_QUEST,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestLogRemoveQuest);
    INVALID_PACKET(SMSG_QUESTLOG_FULL,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_FAILED,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_FAILEDTIMER,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_COMPLETE,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_ADD_KILL,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_QUESTUPDATE_ADD_ITEM,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUEST_CONFIRM_ACCEPT,         STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestConfirmAccept);
    INVALID_PACKET(SMSG_QUEST_CONFIRM_ACCEPT,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PUSHQUESTTOPARTY,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePushQuestToParty);
    DEFINE_HANDLER(CMSG_LIST_INVENTORY,               STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleListInventoryOpcode);
    INVALID_PACKET(SMSG_LIST_INVENTORY,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SELL_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleSellItemOpcode);
    INVALID_PACKET(SMSG_SELL_ITEM,                    UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BUY_ITEM,                     STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleBuyItemOpcode);
    DEFINE_HANDLER(CMSG_BUY_ITEM_IN_SLOT,             STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleBuyItemInSlotOpcode);
    INVALID_PACKET(SMSG_BUY_ITEM,                     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_BUY_FAILED,                   UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_TAXICLEARALLNODES,            UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_TAXIENABLEALLNODES,           UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_TAXISHOWNODES,                UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_SHOWTAXINODES,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TAXINODE_STATUS_QUERY,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTaxiNodeStatusQueryOpcode);
    INVALID_PACKET(SMSG_TAXINODE_STATUS,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TAXIQUERYAVAILABLENODES,      STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTaxiQueryAvailableNodes);
    DEFINE_HANDLER(CMSG_ACTIVATETAXI,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleActivateTaxiOpcode);
    INVALID_PACKET(SMSG_ACTIVATETAXIREPLY,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_NEW_TAXI_PATH,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TRAINER_LIST,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTrainerListOpcode);
    INVALID_PACKET(SMSG_TRAINER_LIST,                 UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TRAINER_BUY_SPELL,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTrainerBuySpellOpcode);
    INVALID_PACKET(SMSG_TRAINER_BUY_SUCCEEDED,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_TRAINER_BUY_FAILED,           UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BINDER_ACTIVATE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBinderActivateOpcode);
    INVALID_PACKET(SMSG_PLAYERBINDERROR,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BANKER_ACTIVATE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBankerActivateOpcode);
    INVALID_PACKET(SMSG_SHOW_BANK,                    UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BUY_BANK_SLOT,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBuyBankSlotOpcode);
    INVALID_PACKET(SMSG_BUY_BANK_SLOT_RESULT,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_SHOWLIST,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionShowListOpcode);
    INVALID_PACKET(SMSG_PETITION_SHOWLIST,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_BUY,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionBuyOpcode);
    DEFINE_HANDLER(CMSG_PETITION_SHOW_SIGNATURES,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionShowSignOpcode);
    INVALID_PACKET(SMSG_PETITION_SHOW_SIGNATURES,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_SIGN,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionSignOpcode);
    INVALID_PACKET(SMSG_PETITION_SIGN_RESULTS,        UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_PETITION_DECLINE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionDeclineOpcode);
    DEFINE_HANDLER(CMSG_OFFER_PETITION,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleOfferPetitionOpcode);
    DEFINE_HANDLER(CMSG_TURN_IN_PETITION,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTurnInPetitionOpcode);
    INVALID_PACKET(SMSG_TURN_IN_PETITION_RESULTS,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PETITION_QUERY,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionQueryOpcode);
    INVALID_PACKET(SMSG_PETITION_QUERY_RESPONSE,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_FISH_NOT_HOOKED,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_FISH_ESCAPED,                 UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BUG,                          STATUS_NEVER,     PACKET_PROCESS_MAP,           &WorldSession::HandleBugOpcode);
    INVALID_PACKET(SMSG_NOTIFICATION,                 UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PLAYED_TIME,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePlayedTime);
    INVALID_PACKET(SMSG_PLAYED_TIME,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_QUERY_TIME,                   STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleQueryTimeOpcode);
    INVALID_PACKET(SMSG_QUERY_TIME_RESPONSE,          UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOG_XPGAIN,                   UnhandleReason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(SMSG_AURACASTLOG,                  UnhandleReason::SendByServer);
#endif
    DEFINE_HANDLER(CMSG_RECLAIM_CORPSE,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleReclaimCorpseOpcode);
    DEFINE_HANDLER(CMSG_WRAP_ITEM,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleWrapItemOpcode);
    INVALID_PACKET(SMSG_LEVELUP_INFO,                 UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_MINIMAP_PING,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMinimapPingOpcode);
    INVALID_PACKET(SMSG_RESISTLOG,                    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ENCHANTMENTLOG,               UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_SET_SKILL_CHEAT,              UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_START_MIRROR_TIMER,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PAUSE_MIRROR_TIMER,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_STOP_MIRROR_TIMER,            UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_PING,                         UnhandleReason::AlreadyHandledElsewhere);
    INVALID_PACKET(SMSG_PONG,                         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CLEAR_COOLDOWN,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GAMEOBJECT_PAGETEXT,          UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SETSHEATHED,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetSheathedOpcode);
    INVALID_PACKET(SMSG_COOLDOWN_CHEAT,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_DELAYED,                UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_PLAYER_MACRO_OBSOLETE,        UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_PLAYER_MACRO_OBSOLETE,        UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GHOST,                        UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_INVIS,                     UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_INVALID_PROMOTION_CODE,       UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_GM_BIND_OTHER,                 UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_GM_SUMMON,                     UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_ITEM_TIME_UPDATE,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ITEM_ENCHANT_TIME_UPDATE,     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_AUTH_CHALLENGE,               UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_AUTH_SESSION,                 UnhandleReason::AlreadyHandledElsewhere);
    INVALID_PACKET(SMSG_AUTH_RESPONSE,                UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_GM_SHOWLABEL,                  UnhandleReason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    DEFINE_HANDLER(CMSG_PET_CAST_SPELL,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetCastSpellOpcode);
#endif
    DEFINE_HANDLER(MSG_SAVE_GUILD_EMBLEM,             STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleSaveGuildEmblemOpcode);
    DEFINE_HANDLER(MSG_TABARDVENDOR_ACTIVATE,         STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleTabardVendorActivateOpcode);
    INVALID_PACKET(SMSG_PLAY_SPELL_VISUAL,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_ZONEUPDATE,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleZoneUpdateOpcode);
    INVALID_PACKET(SMSG_PARTYKILLLOG,                 UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_COMPRESSED_UPDATE_OBJECT,     UnhandleReason::SendByServer);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    INVALID_PACKET(SMSG_PLAY_SPELL_IMPACT,            UnhandleReason::SendByServer);
#endif
    INVALID_PACKET(SMSG_EXPLORATION_EXPERIENCE,       UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GM_SET_SECURITY_GROUP,        UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_NUKE,                      UnhandleReason::Unhandled);
    DEFINE_HANDLER(MSG_RANDOM_ROLL,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRandomRollOpcode);
    INVALID_PACKET(SMSG_ENVIRONMENTALDAMAGELOG,       UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_RWHOIS,                       UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_RWHOIS,                       UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_LOOKING_FOR_GROUP,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleLFGOpcode);
    INVALID_PACKET(CMSG_SET_LOOKING_FOR_GROUP,        UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_UNLEARN_SPELL,                UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_UNLEARN_SKILL,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleUnlearnSkillOpcode);
    INVALID_PACKET(SMSG_REMOVED_SPELL,                UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_DECHARGE,                     UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_GMTICKET_CREATE,              STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMTicketCreateOpcode);
    INVALID_PACKET(SMSG_GMTICKET_CREATE,              UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GMTICKET_UPDATETEXT,          STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMTicketUpdateTextOpcode);
    INVALID_PACKET(SMSG_GMTICKET_UPDATETEXT,          UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_ACCOUNT_DATA_MD5,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_REQUEST_ACCOUNT_DATA,         STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleRequestAccountData);
    DEFINE_HANDLER(CMSG_UPDATE_ACCOUNT_DATA,          STATUS_LOGGEDIN_OR_RECENTLY_LOGGEDOUT, PACKET_PROCESS_WORLD,         &WorldSession::HandleUpdateAccountData);
    INVALID_PACKET(SMSG_UPDATE_ACCOUNT_DATA,          UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CLEAR_FAR_SIGHT_IMMEDIATE,    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_POWERGAINLOG_OBSOLETE,        UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GM_TEACH,                     UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_CREATE_ITEM_TARGET,        UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_GMTICKET_GETTICKET,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGMTicketGetTicketOpcode);
    INVALID_PACKET(SMSG_GMTICKET_GETTICKET,           UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_UNLEARN_TALENTS,              UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GAMEOBJECT_SPAWN_ANIM,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GAMEOBJECT_DESPAWN_ANIM,      UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_CORPSE_QUERY,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCorpseQueryOpcode);
    DEFINE_HANDLER(CMSG_GMTICKET_DELETETICKET,        STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMTicketDeleteTicketOpcode);
    INVALID_PACKET(SMSG_GMTICKET_DELETETICKET,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CHAT_WRONG_FACTION,           UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GMTICKET_SYSTEMSTATUS,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGMTicketSystemStatusOpcode);
    INVALID_PACKET(SMSG_GMTICKET_SYSTEMSTATUS,        UnhandleReason::SendByServer);
               // Can call convert corpse on different map.
    DEFINE_HANDLER(CMSG_SPIRIT_HEALER_ACTIVATE,       STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleSpiritHealerActivateOpcode);
    INVALID_PACKET(CMSG_SET_STAT_CHEAT,               UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_SET_REST_START,               UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_SKILL_BUY_STEP,               UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SKILL_BUY_RANK,               UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_XP_CHEAT,                     UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_SPIRIT_HEALER_CONFIRM,        UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_CHARACTER_POINT_CHEAT,        UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GOSSIP_POI,                   UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_CHAT_IGNORED,                 STATUS_LOGGEDIN,  PACKET_PROCESS_CHANNEL,       &WorldSession::HandleChatIgnoredOpcode);
    INVALID_PACKET(CMSG_GM_VISION,                    UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SERVER_COMMAND,               UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_SILENCE,                   UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_REVEALTO,                  UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_RESURRECT,                 UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_SUMMONMOB,                 UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_MOVECORPSE,                UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_FREEZE,                    UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_UBERINVIS,                 UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_REQUEST_PLAYER_INFO,       UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GM_PLAYER_INFO,               UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_GUILD_RANK,                   STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildRankOpcode);
    DEFINE_HANDLER(CMSG_GUILD_ADD_RANK,               STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildAddRankOpcode);
    DEFINE_HANDLER(CMSG_GUILD_DEL_RANK,               STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildDelRankOpcode);
    DEFINE_HANDLER(CMSG_GUILD_SET_PUBLIC_NOTE,        STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildSetPublicNoteOpcode);
    DEFINE_HANDLER(CMSG_GUILD_SET_OFFICER_NOTE,       STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildSetOfficerNoteOpcode);
    INVALID_PACKET(SMSG_LOGIN_VERIFY_WORLD,           UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_CLEAR_EXPLORATION,            UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_SEND_MAIL,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSendMail);
    INVALID_PACKET(SMSG_SEND_MAIL_RESULT,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GET_MAIL_LIST,                STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleGetMailList);
    INVALID_PACKET(SMSG_MAIL_LIST_RESULT,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_LIST,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlefieldListOpcode);
    INVALID_PACKET(SMSG_BATTLEFIELD_LIST,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_JOIN,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlefieldJoinOpcode);
    INVALID_PACKET(SMSG_BATTLEFIELD_WIN,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_BATTLEFIELD_LOSE,             UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_TAXICLEARNODE,                UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_TAXIENABLENODE,               UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_ITEM_TEXT_QUERY,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleItemTextQuery);
    INVALID_PACKET(SMSG_ITEM_TEXT_QUERY_RESPONSE,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_MAIL_TAKE_MONEY,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailTakeMoney);
    DEFINE_HANDLER(CMSG_MAIL_TAKE_ITEM,               STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD, /*COD*/ &WorldSession::HandleMailTakeItem);
    DEFINE_HANDLER(CMSG_MAIL_MARK_AS_READ,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailMarkAsRead);
    DEFINE_HANDLER(CMSG_MAIL_RETURN_TO_SENDER,        STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMailReturnToSender);
    DEFINE_HANDLER(CMSG_MAIL_DELETE,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailDelete);
    DEFINE_HANDLER(CMSG_MAIL_CREATE_TEXT_ITEM,        STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleMailCreateTextItem);
    INVALID_PACKET(SMSG_SPELLLOGMISS,                 UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELLLOGEXECUTE,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DEBUGAURAPROC,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PERIODICAURALOG,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELLDAMAGESHIELD,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELLNONMELEEDAMAGELOG,       UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_LEARN_TALENT,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleLearnTalentOpcode);
    INVALID_PACKET(SMSG_RESURRECT_FAILED,             UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TOGGLE_PVP,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTogglePvP);
    INVALID_PACKET(SMSG_ZONE_UNDER_ATTACK,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_AUCTION_HELLO,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAuctionHelloOpcode);
    DEFINE_HANDLER(CMSG_AUCTION_SELL_ITEM,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionSellItem);
    DEFINE_HANDLER(CMSG_AUCTION_REMOVE_ITEM,          STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionRemoveItem);
    DEFINE_HANDLER(CMSG_AUCTION_LIST_ITEMS,           STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionListItems);
    DEFINE_HANDLER(CMSG_AUCTION_LIST_OWNER_ITEMS,     STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionListOwnerItems);
    DEFINE_HANDLER(CMSG_AUCTION_PLACE_BID,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionPlaceBid);
    INVALID_PACKET(SMSG_AUCTION_COMMAND_RESULT,       UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_LIST_RESULT,          UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_OWNER_LIST_RESULT,    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_BIDDER_NOTIFICATION,  UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_OWNER_NOTIFICATION,   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PROCRESIST,                   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_STANDSTATE_CHANGE_FAILURE,    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DISPEL_FAILED,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELLORDAMAGE_IMMUNE,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_AUCTION_LIST_BIDDER_ITEMS,    STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleAuctionListBidderItems);
    INVALID_PACKET(SMSG_AUCTION_BIDDER_LIST_RESULT,   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SET_FLAT_SPELL_MODIFIER,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SET_PCT_SPELL_MODIFIER,       UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_AMMO,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetAmmoOpcode);
    INVALID_PACKET(SMSG_CORPSE_RECLAIM_DELAY,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SET_ACTIVE_MOVER,             STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleSetActiveMoverOpcode);
    DEFINE_HANDLER(CMSG_PET_CANCEL_AURA,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetCancelAuraOpcode);
    INVALID_PACKET(CMSG_PLAYER_AI_CHEAT,              UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_CANCEL_AUTO_REPEAT_SPELL,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCancelAutoRepeatSpellOpcode);
    INVALID_PACKET(MSG_GM_ACCOUNT_ONLINE,             UnhandleReason::Unhandled);
    DEFINE_HANDLER(MSG_LIST_STABLED_PETS,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleListStabledPetsOpcode);
    DEFINE_HANDLER(CMSG_STABLE_PET,                   STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStablePet);
    DEFINE_HANDLER(CMSG_UNSTABLE_PET,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleUnstablePet);
    DEFINE_HANDLER(CMSG_BUY_STABLE_SLOT,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBuyStableSlot);
    INVALID_PACKET(SMSG_STABLE_RESULT,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_STABLE_REVIVE_PET,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStableRevivePet);
    DEFINE_HANDLER(CMSG_STABLE_SWAP_PET,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleStableSwapPet);
    DEFINE_HANDLER(MSG_QUEST_PUSH_RESULT,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQuestPushResult);
    INVALID_PACKET(SMSG_PLAY_MUSIC,                   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PLAY_OBJECT_SOUND,            UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_REQUEST_PET_INFO,             STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleRequestPetInfoOpcode);
    DEFINE_HANDLER(CMSG_FAR_SIGHT,                    STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleFarSightOpcode);
    INVALID_PACKET(SMSG_SPELLDISPELLOG,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DAMAGE_CALC_LOG,              UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_ENABLE_DAMAGE_LOG,            UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_GROUP_CHANGE_SUB_GROUP,       STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupChangeSubGroupOpcode);
    DEFINE_HANDLER(CMSG_REQUEST_PARTY_MEMBER_STATS,   STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRequestPartyMemberStatsOpcode);
    DEFINE_HANDLER(CMSG_GROUP_SWAP_SUB_GROUP,         STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupSwapSubGroupOpcode);
    INVALID_PACKET(CMSG_RESET_FACTION_CHEAT,          UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_AUTOSTORE_BANK_ITEM,          STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoStoreBankItemOpcode);
    DEFINE_HANDLER(CMSG_AUTOBANK_ITEM,                STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleAutoBankItemOpcode);
    DEFINE_HANDLER(MSG_QUERY_NEXT_MAIL_TIME,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleQueryNextMailTime);
    INVALID_PACKET(SMSG_RECEIVED_MAIL,                UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_RAID_GROUP_ONLY,              UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_SET_DURABILITY_CHEAT,         UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SET_PVP_RANK_CHEAT,           UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_ADD_PVP_MEDAL_CHEAT,          UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_DEL_PVP_MEDAL_CHEAT,          UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SET_PVP_TITLE,                UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_PVP_CREDIT,                   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_AUCTION_REMOVED_NOTIFICATION, UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_GROUP_RAID_CONVERT,           STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupRaidConvertOpcode);
    DEFINE_HANDLER(CMSG_GROUP_ASSISTANT_LEADER,       STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleGroupAssistantLeaderOpcode);
    DEFINE_HANDLER(CMSG_BUYBACK_ITEM,                 STATUS_LOGGEDIN,  PACKET_PROCESS_SELF_ITEMS,    &WorldSession::HandleBuybackItem);
    INVALID_PACKET(SMSG_SERVER_MESSAGE,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_MEETINGSTONE_JOIN,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMeetingStoneJoinOpcode);
    DEFINE_HANDLER(CMSG_MEETINGSTONE_LEAVE,           STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMeetingStoneLeaveOpcode);
    INVALID_PACKET(CMSG_MEETINGSTONE_CHEAT,           UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_MEETINGSTONE_SETQUEUE,        UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_MEETINGSTONE_INFO,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleMeetingStoneInfoOpcode);
    INVALID_PACKET(SMSG_MEETINGSTONE_COMPLETE,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MEETINGSTONE_IN_PROGRESS,     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MEETINGSTONE_MEMBER_ADDED,    UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GMTICKETSYSTEM_TOGGLE,        UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_CANCEL_GROWTH_AURA,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleCancelGrowthAuraOpcode);
    INVALID_PACKET(SMSG_CANCEL_AUTO_REPEAT,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_STANDSTATE_UPDATE,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ALL_PASSED,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ROLL_WON,                UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_LOOT_ROLL,                    STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleLootRoll);
    INVALID_PACKET(SMSG_LOOT_START_ROLL,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_LOOT_ROLL,                    UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_LOOT_MASTER_GIVE,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleLootMasterGiveOpcode);
    INVALID_PACKET(SMSG_LOOT_MASTER_LIST,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SET_FORCED_REACTIONS,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_FAILED_OTHER,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GAMEOBJECT_RESET_STATE,       UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_REPAIR_ITEM,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleRepairItemOpcode);
    INVALID_PACKET(SMSG_CHAT_PLAYER_NOT_FOUND,        UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_TALENT_WIPE_CONFIRM,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleTalentWipeConfirmOpcode);
    INVALID_PACKET(SMSG_SUMMON_REQUEST,               UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_SUMMON_RESPONSE,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSummonResponseOpcode);
    INVALID_PACKET(MSG_MOVE_TOGGLE_GRAVITY_CHEAT,     UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_MONSTER_MOVE_TRANSPORT,       UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PET_BROKEN,                   UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_MOVE_FEATHER_FALL,             UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_MOVE_WATER_WALK,               UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_SERVER_BROADCAST,             UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_SELF_RES,                     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSelfResOpcode);
    INVALID_PACKET(SMSG_FEIGN_DEATH_RESISTED,         UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_RUN_SCRIPT,                   UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_SCRIPT_MESSAGE,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DUEL_COUNTDOWN,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_AREA_TRIGGER_MESSAGE,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_TOGGLE_HELM,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleShowingHelmOpcode);
    DEFINE_HANDLER(CMSG_TOGGLE_CLOAK,                 STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleShowingCloakOpcode);
    INVALID_PACKET(SMSG_MEETINGSTONE_JOINFAILED,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PLAYER_SKINNED,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DURABILITY_DAMAGE_DEATH,      UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_SET_EXPLORATION,              UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_SET_ACTIONBAR_TOGGLES,        STATUS_AUTHED,    PACKET_PROCESS_MAP,           &WorldSession::HandleSetActionBarTogglesOpcode);
    INVALID_PACKET(MSG_DELETE_GUILD_CHARTER,          UnhandleReason::Unhandled);
    DEFINE_HANDLER(MSG_PETITION_RENAME,               STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetitionRenameOpcode);
    INVALID_PACKET(SMSG_INIT_WORLD_STATES,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_UPDATE_WORLD_STATE,           UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_ITEM_NAME_QUERY,              STATUS_LOGGEDIN,  PACKET_PROCESS_DB_QUERY,      &WorldSession::HandleItemNameQueryOpcode);
    INVALID_PACKET(SMSG_ITEM_NAME_QUERY_RESPONSE,     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PET_ACTION_FEEDBACK,          UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_CHAR_RENAME,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleCharRenameOpcode);
    INVALID_PACKET(SMSG_CHAR_RENAME,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_MOVE_SPLINE_DONE,             STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveSplineDoneOpcode);
    DEFINE_HANDLER(CMSG_MOVE_FALL_RESET,              STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementOpcodes);
    INVALID_PACKET(SMSG_INSTANCE_SAVE_CREATED,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_RAID_INSTANCE_INFO,           UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_REQUEST_RAID_INFO,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleRequestRaidInfoOpcode);
    DEFINE_HANDLER(CMSG_MOVE_TIME_SKIPPED,            STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveTimeSkippedOpcode);
    DEFINE_HANDLER(CMSG_MOVE_FEATHER_FALL_ACK,        STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementFlagChangeToggleAck);
    DEFINE_HANDLER(CMSG_MOVE_WATER_WALK_ACK,          STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMovementFlagChangeToggleAck);
    DEFINE_HANDLER(CMSG_MOVE_NOT_ACTIVE_MOVER,        STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleMoveNotActiveMoverOpcode);
    INVALID_PACKET(SMSG_PLAY_SOUND,                   UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_STATUS,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlefieldStatusOpcode);
    INVALID_PACKET(SMSG_BATTLEFIELD_STATUS,           UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEFIELD_PORT,             STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleBattleFieldPortOpcode);
    DEFINE_HANDLER(MSG_INSPECT_HONOR_STATS,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleInspectHonorStatsOpcode);
    DEFINE_HANDLER(CMSG_BATTLEMASTER_HELLO,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattlemasterHelloOpcode);
    INVALID_PACKET(CMSG_MOVE_START_SWIM_CHEAT,        UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_MOVE_STOP_SWIM_CHEAT,         UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_FORCE_WALK_SPEED_CHANGE,      UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_WALK_SPEED_CHANGE_ACK,  STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_SWIM_BACK_SPEED_CHANGE, UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK,  STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT, &WorldSession::HandleForceSpeedChangeAckOpcodes);
    INVALID_PACKET(SMSG_FORCE_TURN_RATE_CHANGE,       UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_FORCE_TURN_RATE_CHANGE_ACK,   STATUS_LOGGEDIN,  PACKET_PROCESS_MOVEMENT,      &WorldSession::HandleForceSpeedChangeAckOpcodes);
    DEFINE_HANDLER(MSG_PVP_LOG_DATA,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePVPLogDataOpcode);
    DEFINE_HANDLER(CMSG_LEAVE_BATTLEFIELD,            STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleLeaveBattlefieldOpcode);
    DEFINE_HANDLER(CMSG_AREA_SPIRIT_HEALER_QUERY,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAreaSpiritHealerQueryOpcode);
    DEFINE_HANDLER(CMSG_AREA_SPIRIT_HEALER_QUEUE,     STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleAreaSpiritHealerQueueOpcode);
    INVALID_PACKET(SMSG_AREA_SPIRIT_HEALER_TIME,      UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GM_UNTEACH,                   UnhandleReason::Unhandled);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    INVALID_PACKET(SMSG_WARDEN_DATA,                  UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_WARDEN_DATA,                  STATUS_AUTHED,    PACKET_PROCESS_WORLD,         &WorldSession::HandleWardenDataOpcode);
#endif
    INVALID_PACKET(SMSG_GROUP_JOINED_BATTLEGROUND,    UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_BATTLEGROUND_PLAYER_POSITIONS, STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleBattleGroundPlayerPositionsOpcode);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    INVALID_PACKET(SMSG_PARTY_MEMBER_STATS_FULL,      UnhandleReason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    DEFINE_HANDLER(CMSG_PET_STOP_ATTACK,              STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetStopAttack);
    INVALID_PACKET(SMSG_BINDER_CONFIRM,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_BATTLEGROUND_PLAYER_JOINED,   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_BATTLEGROUND_PLAYER_LEFT,     UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_BATTLEMASTER_JOIN,            STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleBattlemasterJoinOpcode);
    INVALID_PACKET(SMSG_ADDON_INFO,                   UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_UNLEARN,                  STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetUnlearnOpcode);
    INVALID_PACKET(SMSG_PET_UNLEARN_CONFIRM,          UnhandleReason::SendByServer);
    DEFINE_HANDLER(CMSG_PET_SPELL_AUTOCAST,           STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandlePetSpellAutocastOpcode);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    INVALID_PACKET(SMSG_WEATHER,                      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PLAY_TIME_WARNING,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MINIGAME_SETUP,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_MINIGAME_STATE,               UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_MINIGAME_MOVE,                UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_MINIGAME_MOVE_FAILED,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_RAID_INSTANCE_MESSAGE,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_COMPRESSED_MOVES,             UnhandleReason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    DEFINE_HANDLER(CMSG_GUILD_INFO_TEXT,              STATUS_LOGGEDIN,  PACKET_PROCESS_GUILD,         &WorldSession::HandleGuildChangeInfoTextOpcode);
    INVALID_PACKET(SMSG_CHAT_RESTRICTED,              UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_RUN_SPEED,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_RUN_BACK_SPEED,    UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_SWIM_SPEED,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_WALK_SPEED,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_SWIM_BACK_SPEED,   UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_SET_TURN_RATE,         UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_UNROOT,           UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_FEATHER_FALL,     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_NORMAL_FALL,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_SET_HOVER,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_UNSET_HOVER,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_WATER_WALK,       UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_LAND_WALK,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_START_SWIM,       UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_STOP_SWIM,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_SET_RUN_MODE,     UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPLINE_MOVE_SET_WALK_MODE,    UnhandleReason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    INVALID_PACKET(CMSG_GM_NUKE_ACCOUNT,              UnhandleReason::Unhandled);
    INVALID_PACKET(MSG_GM_DESTROY_CORPSE,             UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_GM_DESTROY_ONLINE_CORPSE,     UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_ACTIVATETAXIEXPRESS,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleActivateTaxiExpressOpcode);
    INVALID_PACKET(SMSG_SET_FACTION_ATWAR,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GAMETIMEBIAS_SET,             UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_DEBUG_ACTIONS_START,          UnhandleReason::Unhandled);
    INVALID_PACKET(CMSG_DEBUG_ACTIONS_STOP,           UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_SET_FACTION_INACTIVE,         STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetFactionInactiveOpcode);
    DEFINE_HANDLER(CMSG_SET_WATCHED_FACTION,          STATUS_LOGGEDIN,  PACKET_PROCESS_MAP,           &WorldSession::HandleSetWatchedFactionOpcode);
    INVALID_PACKET(MSG_MOVE_TIME_SKIPPED,             UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_SPLINE_MOVE_ROOT,             UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_SET_EXPLORATION_ALL,          UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_INVALIDATE_PLAYER,            UnhandleReason::SendByServer);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    DEFINE_HANDLER(CMSG_RESET_INSTANCES,              STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleResetInstancesOpcode);
    INVALID_PACKET(SMSG_INSTANCE_RESET,               UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_INSTANCE_RESET_FAILED,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_UPDATE_LAST_INSTANCE,         UnhandleReason::SendByServer);
    DEFINE_HANDLER(MSG_RAID_TARGET_UPDATE,            STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRaidTargetUpdateOpcode);
    DEFINE_HANDLER(MSG_RAID_READY_CHECK,              STATUS_LOGGEDIN,  PACKET_PROCESS_GROUP,         &WorldSession::HandleRaidReadyCheckOpcode);
    INVALID_PACKET(CMSG_LUA_USAGE,                    UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_PET_ACTION_SOUND,             UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_PET_DISMISS_SOUND,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_GHOSTEE_GONE,                 UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_GM_UPDATE_TICKET_STATUS,      UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_GM_TICKET_STATUS_UPDATE,      UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_SET_DUNGEON_DIFFICULTY,        UnhandleReason::Unhandled);
    DEFINE_HANDLER(CMSG_GMSURVEY_SUBMIT,              STATUS_LOGGEDIN,  PACKET_PROCESS_WORLD,         &WorldSession::HandleGMSurveySubmitOpcode);
    INVALID_PACKET(SMSG_UPDATE_INSTANCE_OWNERSHIP,    UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_IGNORE_KNOCKBACK_CHEAT,       UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_CHAT_PLAYER_AMBIGUOUS,        UnhandleReason::SendByServer);
    INVALID_PACKET(MSG_DELAY_GHOST_TELEPORT,          UnhandleReason::Unhandled);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    INVALID_PACKET(SMSG_SPELLINSTAKILLLOG,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELL_UPDATE_CHAIN_TARGETS,   UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_CHAT_FILTERED,                UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_EXPECTED_SPAM_RECORDS,        UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_SPELLSTEALLOG,                UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_LOTTERY_QUERY_OBSOLETE,       UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_LOTTERY_QUERY_RESULT_OBSOLETE, UnhandleReason::SendByServer);
    INVALID_PACKET(CMSG_BUY_LOTTERY_TICKET_OBSOLETE,  UnhandleReason::Unhandled);
    INVALID_PACKET(SMSG_LOTTERY_RESULT_OBSOLETE,      UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CHARACTER_PROFILE,            UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_CHARACTER_PROFILE_REALM_CONNECTED, UnhandleReason::SendByServer);
    INVALID_PACKET(SMSG_DEFENSE_MESSAGE,              UnhandleReason::SendByServer);
#endif

    return list;
}

Handlers const handlerList = BuildOpcodeList();

OpcodeHandler emptyHandler;

OpcodeHandler const& LookupOpcodeHandler(uint16 id)
{
    if (id >= NUM_MSG_TYPES)
        return emptyHandler;
    return handlerList.handlers[id];
}

char const* LookupOpcodeName(uint16 id)
{
    return LookupOpcodeHandler(id).name;
}
