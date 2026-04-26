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

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Opcodes.h"
#include "Log.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Group.h"
#include "SocialMgr.h"
#include "Util.h"

/* differeces from off:
    -you can uninvite yourself - is is useful
    -you can accept invitation even if leader went offline
*/
/* todo:
    -group_destroyed msg is sent but not shown
    -reduce xp gaining when in raid group
    -quest sharing has to be corrected
    -FIX sending PartyMemberStats
*/

void WorldSession::SendPartyResult(PartyOperation operation, std::string const& memberName, PartyResult res)
{
    auto packet = std::make_unique<WorldPackets::Group::PartyCommandResult>();
    packet->operation = operation;
    packet->memberName = memberName;
    packet->result = res;
    SendPacket(std::move(packet));
}

void WorldSession::HandleGroupInviteOpcode(WorldPackets::Group::GroupInvite const& packet)
{
    // Attempt add selected player

    // Cheating
    if (!normalizePlayerName(const_cast<std::string&>(packet.memberName)))
    {
        SendPartyResult(PARTY_OP_INVITE, packet.memberName, ERR_BAD_PLAYER_NAME_S);
        return;
    }

    Player* player = sObjectMgr.GetPlayer(packet.memberName.c_str());

    // No player
    if (!player)
    {
        SendPartyResult(PARTY_OP_INVITE, packet.memberName, ERR_BAD_PLAYER_NAME_S);
        return;
    }

    // Can't group with
    if (!GetPlayer()->IsGameMaster() && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP) && GetPlayer()->GetTeam() != player->GetTeam())
    {
        SendPartyResult(PARTY_OP_INVITE, packet.memberName, ERR_PLAYER_WRONG_FACTION);
        return;
    }

    // Just ignore us
    if (player->GetSocial()->HasIgnore(GetPlayer()->GetObjectGuid()))
    {
        SendPartyResult(PARTY_OP_INVITE, packet.memberName, ERR_IGNORING_YOU_S);
        return;
    }

    Group* group = GetPlayer()->GetGroup();
    if (group && group->isBGGroup())
        group = GetPlayer()->GetOriginalGroup();

    Group* group2 = player->GetGroup();
    if (group2 && group2->isBGGroup())
        group2 = player->GetOriginalGroup();
    // Player already in another group or invited
    if (group2 || player->GetGroupInvite())
    {
        SendPartyResult(PARTY_OP_INVITE, packet.memberName, ERR_ALREADY_IN_GROUP_S);
        return;
    }

    if (group)
    {
        // not have permissions for invite
        if (!group->IsLeader(GetPlayer()->GetObjectGuid()) && !group->IsAssistant(GetPlayer()->GetObjectGuid()))
        {
            SendPartyResult(PARTY_OP_INVITE, "", ERR_NOT_LEADER);
            return;
        }
        // not have place
        if (group->IsFull())
        {
            SendPartyResult(PARTY_OP_INVITE, "", ERR_GROUP_FULL);
            return;
        }
    }

    // ok, but group not exist, start a new group
    // but don't create and save the group to the DB until
    // at least one person joins
    if (!group)
    {
        group = new Group;
        // new group: if can't add then delete
        if (!group->AddLeaderInvite(GetPlayer()))
        {
            delete group;
            return;
        }
        if (!group->AddInvite(player))
        {
            delete group;
            return;
        }
    }
    else
    {
        // already existing group: if can't add then just leave
        if (!group->AddInvite(player))
            return;
    }

    // ok, we do it
    auto invitePacket = std::make_unique<WorldPackets::Group::GroupInviteNotification>();
    invitePacket->inviterName = GetPlayer()->GetName();
    player->GetSession()->SendPacket(std::move(invitePacket));

    SendPartyResult(PARTY_OP_INVITE, packet.memberName, ERR_PARTY_RESULT_OK);
}

void WorldSession::HandleGroupAcceptOpcode(NullClientPacket const& /*packet*/)
{
    Group* group = GetPlayer()->GetGroupInvite();
    if (!group)
        return;

    if (group->GetLeaderGuid() == GetPlayer()->GetObjectGuid())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandleGroupAcceptOpcode: %s tried to accept an invite to his own group",
                 GetPlayer()->GetGuidStr().c_str());
        return;
    }

    // remove in from invites in any case
    group->RemoveInvite(GetPlayer());

    /** error handling **/
    /********************/

    // not have place
    if (group->IsFull())
    {
        SendPartyResult(PARTY_OP_INVITE, "", ERR_GROUP_FULL);
        return;
    }

    Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid());

    // forming a new group, create it
    if (!group->IsCreated())
    {
        if (leader)
            group->RemoveInvite(leader);
        if (group->Create(group->GetLeaderGuid(), group->GetLeaderName()))
            sObjectMgr.AddGroup(group);
        else
            return;
    }

    // everything is fine, do it, PLAYER'S GROUP IS SET IN ADDMEMBER!!!
    if (!group->AddMember(GetPlayer()->GetObjectGuid(), GetPlayer()->GetName()))
        return;
    group->BroadcastGroupUpdate();
}

void WorldSession::HandleGroupDeclineOpcode(NullClientPacket const& /*packet*/)
{
    Group* group = GetPlayer()->GetGroupInvite();
    if (!group)
        return;

    // remember leader if online
    Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid());

    // uninvite, group can be deleted
    GetPlayer()->UninviteFromGroup();

    if (!leader || !leader->GetSession())
        return;

    // report
    auto declinePacket = std::make_unique<WorldPackets::Group::GroupDeclineNotification>();
    declinePacket->playerName = GetPlayer()->GetName();
    leader->GetSession()->SendPacket(std::move(declinePacket));
}

void WorldSession::HandleGroupUninviteGuidOpcode(WorldPackets::Group::GroupUninviteGuid const& packet)
{
    // can't uninvite yourself
    if (packet.guid == GetPlayer()->GetObjectGuid())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandleGroupUninviteGuidOpcode: leader %s tried to uninvite himself from the group.", GetPlayer()->GetGuidStr().c_str());
        return;
    }

    PartyResult res = GetPlayer()->CanUninviteFromGroup(packet.guid);
    if (res != ERR_PARTY_RESULT_OK)
    {
        SendPartyResult(PARTY_OP_LEAVE, "", res);
        return;
    }

    Group* grp = GetPlayer()->GetGroup();
    if (!grp)
        return;

    if (grp->IsMember(packet.guid))
    {
        Player::RemoveFromGroup(grp, packet.guid);
        return;
    }

    if (Player* plr = grp->GetInvited(packet.guid))
    {
        plr->UninviteFromGroup();
        return;
    }

    SendPartyResult(PARTY_OP_LEAVE, "", ERR_TARGET_NOT_IN_GROUP_S);
}

void WorldSession::HandleGroupUninviteOpcode(WorldPackets::Group::GroupUninvite const& packet)
{
    // player not found
    if (!normalizePlayerName(const_cast<std::string&>(packet.memberName)))
        return;

    // can't uninvite yourself
    if (GetPlayer()->GetName() == packet.memberName)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandleGroupUninviteOpcode: leader %s tried to uninvite himself from the group.", GetPlayer()->GetGuidStr().c_str());
        return;
    }

    Group* grp = GetPlayer()->GetGroup();
    if (!grp)
        return;

    if (ObjectGuid guid = grp->GetMemberGuid(packet.memberName))
    {
        PartyResult res = GetPlayer()->CanUninviteFromGroup(guid);
        if (res != ERR_PARTY_RESULT_OK)
        {
            SendPartyResult(PARTY_OP_LEAVE, "", res);
            return;
        }
        Player::RemoveFromGroup(grp, guid);
        return;
    }

    if (Player* plr = grp->GetInvited(packet.memberName))
    {
        PartyResult res = GetPlayer()->CanUninviteFromGroup(plr->GetObjectGuid());
        if (res != ERR_PARTY_RESULT_OK)
        {
            SendPartyResult(PARTY_OP_LEAVE, "", res);
            return;
        }
        plr->UninviteFromGroup();
        return;
    }

    SendPartyResult(PARTY_OP_LEAVE, packet.memberName, ERR_TARGET_NOT_IN_GROUP_S);
}

void WorldSession::HandleGroupSetLeaderOpcode(WorldPackets::Group::GroupSetLeader const& packet)
{
    Group* group = GetPlayer()->GetGroup();
    if (!group)
        return;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    Player* player = sObjectMgr.GetPlayer(packet.guid);
#else
    Player* player = sObjectMgr.GetPlayer(packet.name.c_str());
#endif

    /** error handling **/
    if (!player || player == GetPlayer() || !group->IsLeader(GetPlayer()->GetObjectGuid()) || player->GetGroup() != group)
        return;

    // everything is fine, do it
    group->ChangeLeader(player->GetObjectGuid());
}

void WorldSession::HandleGroupDisbandOpcode(NullClientPacket const& /*packet*/)
{
    if (!GetPlayer()->GetGroup())
        return;

    if (_player->InBattleGround())
        return;

    /** error handling **/
    /********************/

    // everything is fine, do it
    SendPartyResult(PARTY_OP_LEAVE, GetPlayer()->GetName(), ERR_PARTY_RESULT_OK);

    GetPlayer()->GetGroup()->BroadcastGroupUpdate();
    GetPlayer()->RemoveFromGroup();
}

void WorldSession::HandleLootMethodOpcode(WorldPackets::Group::LootMethod const& packet)
{
    // Impossible.
    if (packet.lootMethod > 4)
        return;

    Group* group = GetPlayer()->GetGroup();
    if (!group || group->isBGGroup())
        group = GetPlayer()->GetOriginalGroup();

    if (!group)
        return;

    /** error handling **/
    if (!group->IsLeader(GetPlayer()->GetObjectGuid()))
        return;
    /********************/

    // everything is fine, do it
    group->SetLootMethod((LootMethod)packet.lootMethod);
    group->SetLooterGuid(packet.lootMaster);
    group->SetLootThreshold((ItemQualities)packet.lootThreshold);
    group->SendUpdate();
}

void WorldSession::HandleLootRoll(WorldPackets::Loot::LootRoll const& packet)
{
    Group* group = GetPlayer()->GetGroup();
    if (!group)
        return;

    if (packet.rollType >= MAX_ROLL_FROM_CLIENT)
        return;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    if (GetPlayer()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_PLAY_TIME))
    {
        SendPlayTimeWarning(PTF_UNHEALTHY_TIME, 0);
        const_cast<uint8&>(packet.rollType) = ROLL_PASS;
    }
#endif

    // everything is fine, do it, if false then some cheating problem found (result not used in pre-3.0)
    group->CountRollVote(GetPlayer(), packet.lootedTarget, packet.itemSlot, RollVote(packet.rollType));
}

void WorldSession::HandleMinimapPingOpcode(WorldPackets::Group::MinimapPing const& packet)
{
    if (!GetPlayer()->GetGroup())
        return;

    WorldPacket data(MSG_MINIMAP_PING, (8 + 4 + 4));
    data << GetPlayer()->GetObjectGuid();
    data << float(packet.x);
    data << float(packet.y);
    GetPlayer()->GetGroup()->BroadcastPacket(&data, true, -1, GetPlayer()->GetObjectGuid());
}

void WorldSession::HandleRandomRollOpcode(WorldPackets::Group::RandomRoll const& packet)
{
    /** error handling **/
    if (packet.minimum > packet.maximum || packet.maximum > 10000) // < 32768 for urand call
        return;
    /********************/

    // everything is fine, do it
    uint32 roll = urand(packet.minimum, packet.maximum);

    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "ROLL: MIN: %u, MAX: %u, ROLL: %u", packet.minimum, packet.maximum, roll);

    WorldPacket data(MSG_RANDOM_ROLL, 4 + 4 + 4 + 8);
    data << uint32(packet.minimum);
    data << uint32(packet.maximum);
    data << uint32(roll);
    data << GetPlayer()->GetObjectGuid();

    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
    // - Using /random will now send the text to your party or raid wherever
    //   they are instead of the local area around the player that used /random.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    if (GetPlayer()->GetGroup())
        GetPlayer()->GetGroup()->BroadcastPacket(&data, false);
    else
        SendPacket(&data);
#else
    GetPlayer()->SendObjectMessageToSet(&data, true);
#endif
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldSession::HandleRaidTargetUpdateOpcode(WorldPackets::Group::RaidTargetUpdate const& packet)
{
    Group* group = GetPlayer()->GetGroup();
    if (!group)
        group = GetPlayer()->GetOriginalGroup();
    if (!group)
        return;

    /** error handling **/
    /********************/

    // everything is fine, do it
    if (packet.iconId == 0xFF) // target icon request
        group->SendTargetIconList(this);
    else // target icon update
    {
        if (!group->IsLeader(GetPlayer()->GetObjectGuid()) &&
            !group->IsAssistant(GetPlayer()->GetObjectGuid()))
            return;

        group->SetTargetIcon(packet.iconId, packet.guid);
    }
}
#endif

void WorldSession::HandleGroupRaidConvertOpcode(NullClientPacket const& /*packet*/)
{
    Group* group = GetPlayer()->GetGroup();
    if (!group)
        return;

    if (_player->InBattleGround())
        return;

    /** error handling **/
    if (!group->IsLeader(GetPlayer()->GetObjectGuid()) || group->GetMembersCount() < group->GetMembersMinCount())
        return;
    /********************/

    // everything is fine, do it (is it 0 (PARTY_OP_INVITE) correct code)
    SendPartyResult(PARTY_OP_INVITE, "", ERR_PARTY_RESULT_OK);
    group->ConvertToRaid();
}

void WorldSession::HandleGroupChangeSubGroupOpcode(WorldPackets::Group::GroupChangeSubGroup const& packet)
{
    if (packet.groupNr >= MAX_RAID_SUBGROUPS)
        return;

    // we will get correct pointer for group here, so we don't have to check if group is BG raid
    Group* group = GetPlayer()->GetGroup();
    if (!group)
        return;

    /** error handling **/
    if (!group->IsLeader(GetPlayer()->GetObjectGuid()) &&
        !group->IsAssistant(GetPlayer()->GetObjectGuid()))
        return;

    if (!group->HasFreeSlotSubGroup(packet.groupNr))
        return;
    /********************/

    // everything is fine, do it
    if (Player* player = sObjectMgr.GetPlayer(packet.name.c_str()))
        group->ChangeMembersGroup(player, packet.groupNr);
    else
    {
        if (ObjectGuid guid = sObjectMgr.GetPlayerGuidByName(packet.name))
            group->ChangeMembersGroup(guid, packet.groupNr);
    }
}

void WorldSession::HandleGroupSwapSubGroupOpcode(WorldPackets::Group::GroupSwapSubGroup const& packet)
{
    Group* group = GetPlayer()->GetGroup();
    if (!group)
        return;

    /** error handling **/
    if (!group->IsLeader(GetPlayer()->GetObjectGuid()) &&
        !group->IsAssistant(GetPlayer()->GetObjectGuid()))
        return;
    /********************/

    // If both players are online do swap with Player objects, else
    // do swap with Guids
    Player* player = sObjectMgr.GetPlayer(packet.name.c_str());
    Player* swapPlayer = sObjectMgr.GetPlayer(packet.nameSwapWith.c_str());

    if (player && swapPlayer)
    {
        group->SwapMembersGroup(player, swapPlayer);
    }
    else
    {
        ObjectGuid swapGuid = sObjectMgr.GetPlayerGuidByName(packet.name);
        ObjectGuid swapWithGuid = sObjectMgr.GetPlayerGuidByName(packet.nameSwapWith);

        if (!swapGuid || !swapWithGuid)
            return;

        group->SwapMembersGroup(swapGuid, swapWithGuid);
    }
}

void WorldSession::HandleGroupAssistantLeaderOpcode(WorldPackets::Group::GroupAssistantLeader const& packet)
{
    Group* group = GetPlayer()->GetGroup();
    if (!group)
        return;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    Player* player = sObjectMgr.GetPlayer(packet.guid);
#else
    Player* player = sObjectMgr.GetPlayer(packet.name.c_str());
#endif

    /** error handling **/
    if (!player || player == GetPlayer() || !group->IsLeader(GetPlayer()->GetObjectGuid()) || player->GetGroup() != group)
        return;

    // everything is fine, do it
    group->SetAssistant(player->GetObjectGuid(), (packet.flag != 0));
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldSession::HandleRaidReadyCheckOpcode(WorldPackets::Group::RaidReadyCheckFromClient const& packet)
{
    if (!packet.state.has_value()) // request
    {
        Group* group = GetPlayer()->GetGroup();
        if (!group)
            return;

        /** error handling **/
        if (!group->IsLeader(GetPlayer()->GetObjectGuid()) &&
            !group->IsAssistant(GetPlayer()->GetObjectGuid()))
            return;
        /********************/

        // everything is fine, do it
        group->BroadcastPacket(std::move(std::make_unique<WorldPackets::Group::RaidReadyCheckFromServer_Request>()), false, -1);

        group->OfflineReadyCheck();
    }
    else // answer
    {
        Group* group = GetPlayer()->GetGroup();
        if (!group)
            return;

        // Forward to the raid leader
        if (Player* gleader = sObjectMgr.GetPlayer(group->GetLeaderGuid()))
        {
            auto response = std::make_unique<WorldPackets::Group::RaidReadyCheckFromServer_Response>();
            response->senderGuid = GetPlayer()->GetObjectGuid();
            response->state = packet.state.value();
            gleader->GetSession()->SendPacket(std::move(response));
        }
    }
}
#endif

void WorldSession::BuildPartyMemberStatsPacket(Player* player, WorldPacket* data, uint32 mask, bool sendAllAuras)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    *data << player->GetPackGUID();
#else
    *data << player->GetGUID();
#endif
    *data << uint32(mask);

    if (mask & GROUP_UPDATE_FLAG_STATUS)
        *data << uint8(GetGroupMemberStatus(player));

    if (mask & GROUP_UPDATE_FLAG_CUR_HP)
        *data << uint16(player->GetHealth());

    if (mask & GROUP_UPDATE_FLAG_MAX_HP)
        *data << uint16(player->GetMaxHealth());

    Powers powerType = player->GetPowerType();
    if (mask & GROUP_UPDATE_FLAG_POWER_TYPE)
        *data << uint8(powerType);

    if (mask & GROUP_UPDATE_FLAG_CUR_POWER)
        *data << uint16(player->GetPower(powerType));

    if (mask & GROUP_UPDATE_FLAG_MAX_POWER)
        *data << uint16(player->GetMaxPower(powerType));

    if (mask & GROUP_UPDATE_FLAG_LEVEL)
        *data << uint16(player->GetLevel());

    if (mask & GROUP_UPDATE_FLAG_ZONE)
        *data << uint16(player->GetCachedZoneId());

    if (mask & GROUP_UPDATE_FLAG_POSITION)
        *data << int16(player->GetPositionX()) << int16(player->GetPositionY());

    if (mask & GROUP_UPDATE_FLAG_AURAS)
    {
        uint64 auramask = sendAllAuras ? player->GetAuraApplicationMask() : player->GetAuraUpdateMask();
        *data << uint32(auramask);
        for (uint32 i = 0; i < MAX_POSITIVE_AURAS; ++i)
            if (auramask & (uint64(1) << i))
                *data << uint16(player->GetUInt32Value(UNIT_FIELD_AURA + i));
    }

    if (mask & GROUP_UPDATE_FLAG_AURAS_NEGATIVE)
    {
        uint64 auramask = sendAllAuras ? player->GetNegativeAuraApplicationMask() : player->GetAuraUpdateMask();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        uint16 maskForClient = uint16(auramask >> 32);
#else
        uint8 maskForClient = uint8(auramask >> 32);
#endif
        *data << maskForClient;
        for (uint64 i = MAX_POSITIVE_AURAS; i < MAX_AURAS; ++i)
            if (auramask & (uint64(1) << i))
                *data << uint16(player->GetUInt32Value(UNIT_FIELD_AURA + i));
    }

    Pet* pet = player->GetPet();
    if (mask & GROUP_UPDATE_FLAG_PET_GUID)
        *data << (pet ? pet->GetObjectGuid() : ObjectGuid());

    if (mask & GROUP_UPDATE_FLAG_PET_NAME)
    {
        if (pet)
            *data << pet->GetName();
        else
            *data << uint8(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_MODEL_ID)
    {
        if (pet)
            *data << uint16(pet->GetDisplayId());
        else
            *data << uint16(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_CUR_HP)
    {
        if (pet)
            *data << uint16(pet->GetHealth());
        else
            *data << uint16(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_MAX_HP)
    {
        if (pet)
            *data << uint16(pet->GetMaxHealth());
        else
            *data << uint16(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_POWER_TYPE)
    {
        if (pet)
            *data << uint8(pet->GetPowerType());
        else
            *data << uint8(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_CUR_POWER)
    {
        if (pet)
            *data << uint16(pet->GetPower(pet->GetPowerType()));
        else
            *data << uint16(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_MAX_POWER)
    {
        if (pet)
            *data << uint16(pet->GetMaxPower(pet->GetPowerType()));
        else
            *data << uint16(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_AURAS)
    {
        if (pet)
        {
            uint64 auramask = sendAllAuras ? pet->GetAuraApplicationMask() : pet->GetAuraUpdateMask();
            *data << uint32(auramask);
            for (uint32 i = 0; i < MAX_POSITIVE_AURAS; ++i)
            {
                if (auramask & (uint64(1) << i))
                    *data << uint16(pet->GetUInt32Value(UNIT_FIELD_AURA + i));
            }
        }
        else
            *data << uint32(0);
    }

    if (mask & GROUP_UPDATE_FLAG_PET_AURAS_NEGATIVE)
    {
        if (pet)
        {
            uint64 auramask = sendAllAuras ? pet->GetNegativeAuraApplicationMask() : pet->GetAuraUpdateMask();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            uint16 maskForClient = uint16(auramask >> 32);
#else
            uint8 maskForClient = uint8(auramask >> 32);
#endif
            *data << maskForClient;
            for (uint32 i = MAX_POSITIVE_AURAS; i < MAX_AURAS; ++i)
            {
                if (auramask & (uint64(1) << i))
                    *data << uint16(pet->GetUInt32Value(UNIT_FIELD_AURA + i));
            }
        }
        else
            *data << uint16(0);
    }
}

void WorldSession::BuildPartyMemberStatsChangedPacket(Player* player, WorldPacket* data)
{
    uint32 mask = player->GetGroupUpdateFlag();

    if (mask & GROUP_UPDATE_FLAG_POWER_TYPE) // if update power type, update current/max power also
        mask |= (GROUP_UPDATE_FLAG_CUR_POWER | GROUP_UPDATE_FLAG_MAX_POWER);

    if (mask & GROUP_UPDATE_FLAG_PET_POWER_TYPE) // same for pets
        mask |= (GROUP_UPDATE_FLAG_PET_CUR_POWER | GROUP_UPDATE_FLAG_PET_MAX_POWER);

    uint32 byteCount = 0;
    for (int i = 0; i < GROUP_UPDATE_FLAGS_COUNT; ++i)
        if (mask & (1 << i))
            byteCount += GroupUpdateLength[i];

    data->Initialize(SMSG_PARTY_MEMBER_STATS, 8 + 4 + byteCount);
    BuildPartyMemberStatsPacket(player, data, mask, false);
}

/*this procedure handles clients CMSG_REQUEST_PARTY_MEMBER_STATS request*/
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
void WorldSession::HandleRequestPartyMemberStatsOpcode(WorldPackets::Group::RequestPartyMemberStats const& packet)
{
    Player* player = HashMapHolder<Player>::Find(packet.guid);

    if (!player || !player->IsInSameRaidWith(_player))
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
        WorldPacket data(SMSG_PARTY_MEMBER_STATS_FULL, 3 + 4 + 1);
#else
        WorldPacket data(SMSG_PARTY_MEMBER_STATS, 8 + 4 + 1);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        data << packet.guid.WriteAsPacked();
#else
        data << packet.guid;
#endif
        data << uint32(GROUP_UPDATE_FLAG_STATUS);
        data << uint8(MEMBER_STATUS_OFFLINE);
        SendPacket(&data);
        return;
    }

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    WorldPacket data(SMSG_PARTY_MEMBER_STATS_FULL, 4 + 2 + 2 + 2 + 1 + 2 * 6 + 8 + 1 + 8);
#else
    WorldPacket data(SMSG_PARTY_MEMBER_STATS, 4 + 2 + 2 + 2 + 1 + 2 * 6 + 8 + 1 + 8);
#endif
    BuildPartyMemberStatsPacket(player, &data, GROUP_UPDATE_FULL, true);
    SendPacket(&data);
}
#endif

void WorldSession::HandleRequestRaidInfoOpcode(NullClientPacket const& /*packet*/)
{
    // every time the player checks the character screen
    _player->SendRaidInfo();
}
