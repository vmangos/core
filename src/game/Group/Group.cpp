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
#include "Opcodes.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Player.h"
#include "World.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "Group.h"
#include "Formulas.h"
#include "ObjectAccessor.h"
#include "BattleGround.h"
#include "MapManager.h"
#include "MapPersistentStateMgr.h"
#include "Util.h"
#include "LootMgr.h"
#include "LFGMgr.h"
#include "LFGQueue.h"
#include "UpdateMask.h"

#include <array>

GroupMemberStatus GetGroupMemberStatus(Player const* member = nullptr)
{
    uint8 flags = MEMBER_STATUS_OFFLINE;
    if (member && !member->GetSession()->PlayerLogout())
    {
        flags |= MEMBER_STATUS_ONLINE;
        if (member->IsPvP())
            flags |= MEMBER_STATUS_PVP;
        if (member->IsDead())
            flags |= MEMBER_STATUS_DEAD;
        if (member->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
            flags |= MEMBER_STATUS_GHOST;
        if (member->IsFFAPvP())
            flags |= MEMBER_STATUS_PVP_FFA;
        if (member->IsAFK())
            flags |= MEMBER_STATUS_AFK;
        if (member->IsDND())
            flags |= MEMBER_STATUS_DND;
    }
    return GroupMemberStatus(flags);
}

#define LOOT_ROLL_TIMEOUT  (1*MINUTE*IN_MILLISECONDS)

//===================================================
//============== Roll ===============================
//===================================================

void Roll::targetObjectBuildLink()
{
    // called from link()
    getTarget()->addLootValidatorRef(this);
}

//===================================================
//============== Group ==============================
//===================================================

Group::Group() : m_Id(0), m_leaderLastOnline(0), m_groupType(GROUPTYPE_NORMAL), 
                 m_bgGroup(nullptr), m_lootMethod(FREE_FOR_ALL), m_lootThreshold(ITEM_QUALITY_UNCOMMON),
                 m_subGroupsCounts(nullptr), m_groupTeam(TEAM_NONE), m_LFGAreaId(0)
{
}

Group::~Group()
{
    if (m_bgGroup)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Group::~Group: battleground group being deleted.");
        if (m_bgGroup->GetBgRaid(ALLIANCE) == this)
            m_bgGroup->SetBgRaid(ALLIANCE, nullptr);
        else if (m_bgGroup->GetBgRaid(HORDE) == this)
            m_bgGroup->SetBgRaid(HORDE, nullptr);
        else
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Group::~Group: battleground group is not linked to the correct battleground.");
    }
    RemoveAllInvites();
    Rolls::iterator itr;
    while (!RollId.empty())
    {
        itr = RollId.begin();
        Roll *r = *itr;
        RollId.erase(itr);
        delete(r);
    }

    // it is undefined whether objectmgr (which stores the groups) or instancesavemgr
    // will be unloaded first so we must be prepared for both cases
    // this may unload some dungeon persistent state
    for (const auto& itr : m_boundInstances)
        itr.second.state->RemoveGroup(this);

    // Sub group counters clean up
    delete[] m_subGroupsCounts;
}

bool Group::Create(ObjectGuid guid, char const*  name)
{
    m_leaderGuid = guid;
    m_leaderName = name;
    m_leaderLastOnline = time(nullptr);

    m_groupType  = isBGGroup() ? GROUPTYPE_RAID : GROUPTYPE_NORMAL;

    if (m_groupType == GROUPTYPE_RAID)
        _initRaidSubGroupsCounter();

    m_lootMethod = GROUP_LOOT;
    m_lootThreshold = ITEM_QUALITY_UNCOMMON;
    m_looterGuid = guid;

    if (!isBGGroup())
    {
        m_Id = sObjectMgr.GenerateGroupId();

        Player* leader = sObjectMgr.GetPlayer(guid);

        Player::ConvertInstancesToGroup(leader, this, guid);

        // store group in database
        CharacterDatabase.BeginTransaction();
        CharacterDatabase.PExecute("DELETE FROM `groups` WHERE `group_id` ='%u'", m_Id);
        CharacterDatabase.PExecute("DELETE FROM `group_member` WHERE `group_id` ='%u'", m_Id);

        CharacterDatabase.PExecute("REPLACE INTO `groups` (`group_id`, `leader_guid`, `main_tank_guid`, `main_assistant_guid`, `loot_method`, `looter_guid`, `loot_threshold`, `icon1`, `icon2`, `icon3`, `icon4`, `icon5`, `icon6`, `icon7`, `icon8`, `is_raid`) "
                                   "VALUES('%u','%u','%u','%u','%u','%u','%u','" UI64FMTD "','" UI64FMTD "','" UI64FMTD "','" UI64FMTD "','" UI64FMTD "','" UI64FMTD "','" UI64FMTD "','" UI64FMTD "','%u')",
                                   m_Id, m_leaderGuid.GetCounter(), m_mainTankGuid.GetCounter(), m_mainAssistantGuid.GetCounter(), uint32(m_lootMethod),
                                   m_looterGuid.GetCounter(), uint32(m_lootThreshold),
                                   m_targetIcons[0].GetRawValue(), m_targetIcons[1].GetRawValue(),
                                   m_targetIcons[2].GetRawValue(), m_targetIcons[3].GetRawValue(),
                                   m_targetIcons[4].GetRawValue(), m_targetIcons[5].GetRawValue(),
                                   m_targetIcons[6].GetRawValue(), m_targetIcons[7].GetRawValue(),
                                   isRaidGroup());
    }

    if (!AddMember(guid, name))
        return false;

    if (!isBGGroup())
        CharacterDatabase.CommitTransaction();

    _updateLeaderFlag();

    return true;
}

bool Group::LoadGroupFromDB(Field* fields)
{
    //                                          0               1                    2            3            4               5      6      7      8      9      10     11     12     13       14           15
    // result = CharacterDatabase.Query("SELECT main_tank_guid, main_assistant_guid, loot_method, looter_guid, loot_threshold, icon1, icon2, icon3, icon4, icon5, icon6, icon7, icon8, is_raid, leader_guid, group_id FROM groups");

    m_Id = fields[15].GetUInt32();
    m_leaderGuid = ObjectGuid(HIGHGUID_PLAYER, fields[14].GetUInt32());

    // group leader not exist
    if (!sObjectMgr.GetPlayerNameByGUID(m_leaderGuid, m_leaderName))
        return false;

    m_leaderLastOnline = time(nullptr);

    m_groupType  = fields[13].GetBool() ? GROUPTYPE_RAID : GROUPTYPE_NORMAL;

    if (m_groupType == GROUPTYPE_RAID)
        _initRaidSubGroupsCounter();

    m_mainTankGuid = ObjectGuid(HIGHGUID_PLAYER, fields[0].GetUInt32());
    m_mainAssistantGuid = ObjectGuid(HIGHGUID_PLAYER, fields[1].GetUInt32());
    m_lootMethod = LootMethod(fields[2].GetUInt8());
    m_looterGuid = ObjectGuid(HIGHGUID_PLAYER, fields[3].GetUInt32());
    m_lootThreshold = ItemQualities(fields[4].GetUInt16());

    for (int i = 0; i < TARGET_ICON_COUNT; ++i)
        m_targetIcons[i] = ObjectGuid(fields[5 + i].GetUInt64());

    return true;
}

bool Group::LoadMemberFromDB(uint32 guidLow, uint8 subgroup, bool assistant)
{
    // skip nonexistent member
    PlayerCacheData const* data = sObjectMgr.GetPlayerDataByGUID(guidLow);
    if (!data)
        return false;

    ObjectGuid guid = ObjectGuid(HIGHGUID_PLAYER, guidLow);

    for (auto const& itr : m_memberSlots)
    {
        if (itr.guid == guid)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Attempt to add duplicate member into group on load.");
            return false;
        }
    }

    MemberSlot member;
    member.guid      = guid;
    member.name      = data->sName;
    member.group     = subgroup;
    member.assistant = assistant;
    m_memberSlots.push_back(member);

    SubGroupCounterIncrease(subgroup);

    Team playerTeam = Player::TeamForRace(data->uiRace);
    if ((m_groupTeam == ALLIANCE && playerTeam == HORDE) ||
        (m_groupTeam == HORDE && playerTeam == ALLIANCE))
        m_groupTeam = TEAM_CROSSFACTION;
    if (m_groupTeam == TEAM_NONE)
        m_groupTeam = playerTeam;
    return true;
}

void Group::ConvertToRaid()
{
    m_groupType = GROUPTYPE_RAID;

    _initRaidSubGroupsCounter();

    if (!isBGGroup())
        CharacterDatabase.PExecute("UPDATE `groups` SET `is_raid` = 1 WHERE `group_id`='%u'", m_Id);
    SendUpdate();

    // update quest related GO states (quest activity dependent from raid membership)
    for (const auto& itr : m_memberSlots)
    {
        if (Player* player = sObjectMgr.GetPlayer(itr.guid))
        {
            player->m_Events.AddLambdaEventAtOffset([player]
            {
                player->UpdateForQuestWorldObjects();
            }, 1);
        }
    }
}

bool Group::AddInvite(Player* player)
{
    if (!player || player->GetGroupInvite())
        return false;
    Group* group = player->GetGroup();
    if (group && group->isBGGroup())
        group = player->GetOriginalGroup();
    if (group)
        return false;

    RemoveInvite(player);

    m_invitees.insert(player);

    player->SetGroupInvite(this);

    return true;
}

bool Group::AddLeaderInvite(Player* player)
{
    if (!AddInvite(player))
        return false;

    _updateLeaderFlag(true);
    m_leaderGuid = player->GetObjectGuid();
    m_leaderName = player->GetName();
    _updateLeaderFlag();
    return true;
}

uint32 Group::RemoveInvite(Player* player)
{
    if (m_invitees.find(player) != m_invitees.end())
    {
        ASSERT(player->GetGroupInvite() == this);
        m_invitees.erase(player);
        player->SetGroupInvite(nullptr);
    }
    return GetMembersCount();
}

void Group::RemoveAllInvites()
{
    for (const auto itr : m_invitees)
    {
        ASSERT(itr->GetGroupInvite() == this);
        itr->SetGroupInvite(nullptr);
    }

    m_invitees.clear();
}

Player* Group::GetInvited(ObjectGuid guid) const
{
    for (const auto itr : m_invitees)
        if (itr->GetObjectGuid() == guid)
            return itr;

    return nullptr;
}

Player* Group::GetInvited(std::string const& name) const
{
    for (const auto itr : m_invitees)
    {
        if (itr->GetName() == name)
            return itr;
    }
    return nullptr;
}

bool Group::AddMember(ObjectGuid guid, char const* name, uint8 joinMethod)
{
    if (!_addMember(guid, name))
        return false;

    SendUpdate();

    if (Player* player = sObjectMgr.GetPlayer(guid))
    {
        if ((m_groupTeam == ALLIANCE && player->GetTeam() == HORDE) ||
            (m_groupTeam == HORDE && player->GetTeam() == ALLIANCE))
            m_groupTeam = TEAM_CROSSFACTION;
        if (m_groupTeam == TEAM_NONE)
            m_groupTeam = player->GetTeam();

        if (!IsLeader(player->GetObjectGuid()) && !isBGGroup())
        {
            // reset the new member's instances, unless he is currently in one of them
            // including raid instances that they are not permanently bound to!
            player->ResetInstances(INSTANCE_RESET_GROUP_JOIN);
        }
        player->SetGroupUpdateFlag(GROUP_UPDATE_FULL);
        player->SetAuraUpdateMask(player->GetAuraApplicationMask());
        if (Pet* pet = player->GetPet())
            pet->SetAuraUpdateMask(pet->GetAuraApplicationMask());

        // quest related GO state dependent from raid membership
        if (isRaidGroup())
        {
            player->m_Events.AddLambdaEventAtOffset([player]
            {
                player->UpdateForQuestWorldObjects();
            }, 1);
        }

        // Cancel instance reset
        Map* map = player->GetMap();
        if (map->IsDungeon())
        {
            // Compare group and player bind
            InstanceGroupBind* groupBind = GetBoundInstance(map->GetId());
            InstancePlayerBind* playerBind = player->GetBoundInstance(map->GetId());
            if (playerBind && groupBind && !player->m_InstanceValid && playerBind->state == groupBind->state && !((DungeonMap*)map)->IsUnloadingBeforeReset())
                player->m_InstanceValid = true;
        }

        {
            // Broadcast new player group member fields to rest of the group
            UpdateData groupData;
            WorldPacket groupDataPacket;

            // Broadcast group members' fields to player
            for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
            {
                if (itr->getSource() == player)
                    continue;

                if (Player* member = itr->getSource())
                {
                    if (player->IsInVisibleList(member))
                    {
                        UpdateMask updateMask;
                        updateMask.SetCount(member->GetValuesCount());
                        member->MarkUpdateFieldsWithFlagForUpdate(updateMask, UF_FLAG_GROUP_ONLY);
                        if (updateMask.HasData())
                            member->BuildValuesUpdateBlockForPlayer(groupData, updateMask, player);
                    }

                    if (member->IsInVisibleList(player))
                    {
                        UpdateMask updateMask;
                        updateMask.SetCount(member->GetValuesCount());
                        member->MarkUpdateFieldsWithFlagForUpdate(updateMask, UF_FLAG_GROUP_ONLY);
                        if (updateMask.HasData())
                        {
                            UpdateData newData;
                            player->BuildValuesUpdateBlockForPlayer(newData, updateMask, member);

                            if (newData.HasData())
                            {
                                WorldPacket newDataPacket;
                                newData.BuildPacket(&newDataPacket);
                                member->SendDirectMessage(&newDataPacket);
                            }
                        }
                    }
                }
            }

            if (groupData.HasData())
            {
                groupData.BuildPacket(&groupDataPacket);
                player->SendDirectMessage(&groupDataPacket);
            }
        }

        if (IsInLFG())
        {
            if (joinMethod != GROUP_LFG)
            {
                sLFGMgr.UpdateGroup(this, true, guid);
            }
        }
    }

    return true;
}

uint32 Group::RemoveMember(ObjectGuid guid, uint8 removeMethod)
{
    // remove member and change leader (if need) only if strong more 2 members _before_ member remove
    if (GetMembersCount() > GetMembersMinCount())
    {
        bool leaderChanged = _removeMember(guid);
        bool leftGroup = false;

        if (Player* player = sObjectMgr.GetPlayer(guid))
        {
            // quest related GO state dependent from raid membership
            if (isRaidGroup())
            {
                player->m_Events.AddLambdaEventAtOffset([player]
                {
                    player->UpdateForQuestWorldObjects();
                }, 1);
            }

            WorldPacket data;

            if (removeMethod == GROUP_KICK)
            {
                data.Initialize(SMSG_GROUP_UNINVITE, 0);
                player->GetSession()->SendPacket(&data);

                if (IsInLFG())
                {
                    data.Initialize(SMSG_MEETINGSTONE_SETQUEUE, 5);
                    data << 0 << uint8(MEETINGSTONE_STATUS_PARTY_MEMBER_REMOVED_PARTY_REMOVED);
                    BroadcastPacket(&data, true);
                    leftGroup = true;
                    sWorld.GetLFGQueue().GetMessager().AddMessage([groupId = GetId()](LFGQueue* queue)
                    {
                        queue->RemoveGroupFromQueue(groupId);
                    });

                    // want to make sure group is removed before player is added
                    // send a message and add a kicked player to lfg queue
                    player->GetSession()->SendMeetingstoneSetqueue(m_LFGAreaId, MEETINGSTONE_STATUS_LOOKING_FOR_NEW_PARTY_IN_QUEUE);
                    sLFGMgr.AddToQueue(player, m_LFGAreaId);
                }
            }

            if (removeMethod == GROUP_LEAVE && IsInLFG())
            {
                player->GetSession()->SendMeetingstoneSetqueue(0, MEETINGSTONE_STATUS_NONE);

                if (!leaderChanged)
                {
                    data.Initialize(SMSG_MEETINGSTONE_SETQUEUE, 5);
                    data << m_LFGAreaId << uint8(MEETINGSTONE_STATUS_PARTY_MEMBER_LEFT_LFG);
                    BroadcastPacket(&data, true);
                }
            }

            //we already removed player from group and in player->GetGroup() is his original group!
            if (Group* group = player->GetGroup())
                group->SendUpdate();
            else
            {
                data.Initialize(SMSG_GROUP_LIST, 24);
                data << uint64(0) << uint64(0) << uint64(0);
                player->GetSession()->SendPacket(&data);
            }

            _homebindIfInstance(player);
        }

        if (leaderChanged)
        {
            leftGroup = true;

            WorldPacket data(SMSG_GROUP_SET_LEADER, (m_leaderName.size() + 1));
            data << m_leaderName;
            BroadcastPacket(&data, true);

            sWorld.GetLFGQueue().GetMessager().AddMessage([groupId = GetId()](LFGQueue* queue)
            {
                queue->RemoveGroupFromQueue(groupId);
            });
        }

        if (!leftGroup && IsInLFG())
            sLFGMgr.UpdateGroup(this, false, guid);

        SendUpdate();
    }
    // if group before remove <= 2 disband it
    else
        Disband(true, guid);

    return m_memberSlots.size();
}

void Group::ChangeLeader(ObjectGuid guid)
{
    member_citerator slot = _getMemberCSlot(guid);
    if (slot == m_memberSlots.end())
        return;

    _setLeader(guid);

    WorldPacket data(SMSG_GROUP_SET_LEADER, slot->name.size() + 1);
    data << slot->name;
    BroadcastPacket(&data, true);
    SendUpdate();
}

void Group::Disband(bool hideDestroy, ObjectGuid initiator)
{
    Player* player;
    Player* remainingPlayer = nullptr;

    for (const auto& itr : m_memberSlots)
    {
        player = sObjectMgr.GetPlayer(itr.guid);
        if (!player)
            continue;

        //we cannot call _removeMember because it would invalidate member iterator
        //if we are removing player from battleground raid
        if (isBGGroup())
            player->RemoveFromBattleGroundRaid();
        else
        {
            //we can remove player who is in battleground from his original group
            if (player->GetOriginalGroup() == this)
                player->SetOriginalGroup(nullptr);
            else
                player->SetGroup(nullptr);
        }

        // quest related GO state dependent from raid membership
        if (isRaidGroup())
        {
            player->m_Events.AddLambdaEventAtOffset([player]
            {
                player->UpdateForQuestWorldObjects();
            }, 1);
        }

        WorldPacket data;
        if (!hideDestroy)
        {
            data.Initialize(SMSG_GROUP_DESTROYED, 0);
            player->GetSession()->SendPacket(&data);
        }

        //we already removed player from group and in player->GetGroup() is his original group, send update
        if (Group* group = player->GetGroup())
            group->SendUpdate();
        else
        {
            data.Initialize(SMSG_GROUP_LIST, 24);
            data << uint64(0) << uint64(0) << uint64(0);
            player->GetSession()->SendPacket(&data);

            if (IsInLFG())
                player->GetSession()->SendMeetingstoneSetqueue(0, MEETINGSTONE_STATUS_NONE);
        }

        // only the person who initiated the disband should be kicked from instance, as he left by choice
        if (initiator.IsEmpty() || initiator == player->GetObjectGuid())
            _homebindIfInstance(player);
        else
            remainingPlayer = player;
    }

    if (IsInLFG())
    {
        sWorld.GetLFGQueue().GetMessager().AddMessage([groupId = GetId()](LFGQueue* queue)
        {
            queue->RemoveGroupFromQueue(groupId);
        });
    }

    for (auto itr = RollId.begin(); itr != RollId.end(); itr = RollId.begin())
        CountTheRoll(itr);
    m_memberSlots.clear();

    RemoveAllInvites();

    if (!isBGGroup())
    {
        CharacterDatabase.BeginTransaction();
        CharacterDatabase.PExecute("DELETE FROM `groups` WHERE `group_id`='%u'", m_Id);
        CharacterDatabase.PExecute("DELETE FROM `group_member` WHERE `group_id`='%u'", m_Id);
        CharacterDatabase.CommitTransaction();

        // transfer instance save to last player in dungeon
        if (remainingPlayer)
        {
            BoundInstancesMap::iterator itr = m_boundInstances.find(remainingPlayer->GetMapId());
            if (itr != m_boundInstances.end() && !itr->second.perm &&
                !remainingPlayer->GetBoundInstance(remainingPlayer->GetMapId()))
            {
                remainingPlayer->BindToInstance(itr->second.state, itr->second.perm, false);
                CharacterDatabase.PExecute("DELETE FROM `group_instance` WHERE `leader_guid` = '%u' AND `instance` = '%u'",
                    GetLeaderGuid().GetCounter(), itr->second.state->GetInstanceId());
                itr->second.state->RemoveGroup(this);               // save can become invalid
                m_boundInstances.erase(itr);
            }
        }

        ResetInstances(INSTANCE_RESET_GROUP_DISBAND, nullptr);
    }

    _updateLeaderFlag(true);
    m_leaderGuid.Clear();
    m_leaderName.clear();
}

/*********************************************************/
/***                   LFG SYSTEM                      ***/
/*********************************************************/

void Group::CalculateLFGRoles(LFGGroupQueueInfo& data)
{
    uint32 m_initRoles = (PLAYER_ROLE_TANK | PLAYER_ROLE_DAMAGE | PLAYER_ROLE_HEALER);
    uint32 dpsCount = 0;

    static std::array<LfgRoles, 3> PotentialRoles =
    {
        PLAYER_ROLE_TANK,
        PLAYER_ROLE_HEALER,
        PLAYER_ROLE_DAMAGE
    };

    std::vector<ObjectGuid> processed;

    for (const auto& citr : GetMemberSlots())
    {
        Classes playerClass = (Classes)sObjectMgr.GetPlayerClassByGUID(citr.guid);
        LfgRoles lfgRole;
        Player* member = sObjectMgr.GetPlayer(citr.guid);
        // if enabled and player is online, calculate role based on most used talent tree
        if (member && sWorld.getConfig(CONFIG_BOOL_LFG_MATCHMAKING))
            lfgRole = LFGMgr::CalculateTalentRoles(member);
        else
            lfgRole = LFGMgr::CalculateRoles(playerClass);

        for (LfgRoles role : PotentialRoles)
        {
            // We can't fulfill this role as our class, skip it
            if (!(lfgRole & role))
                continue;

            if ((role & m_initRoles) == role)
            {
                // If we occupy the slot, don't test other roles
                if (FillPremadeLFG(citr.guid, playerClass, role, m_initRoles, dpsCount, processed))
                    break;
            }
        }
    }

    data.availableRoles = (LfgRoles)m_initRoles;
    data.dpsCount = dpsCount;
    data.playerCount = GetMembersCount();
}

bool Group::FillPremadeLFG(ObjectGuid const& plrGuid, Classes playerClass, LfgRoles requiredRole, uint32& InitRoles,
    uint32& DpsCount, std::vector<ObjectGuid>& processed)
{
    // We grant the role unless someone else in the group has higher priority for it
    LfgRolePriority priority = LFGMgr::GetPriority(playerClass, requiredRole);

    for (const auto& citr : GetMemberSlots())
    {
        if (plrGuid == citr.guid)
            continue;

        // Player is already allocated
        if (std::find(std::begin(processed), std::end(processed), citr.guid) != processed.end())
            continue;

        Classes memberClass = (Classes)sObjectMgr.GetPlayerClassByGUID(citr.guid);

        // Someone else has higher prio
        if (priority < LFGMgr::GetPriority(memberClass, requiredRole))
            return false;
    }

    switch (requiredRole)
    {
        case PLAYER_ROLE_TANK:
        {
            InitRoles &= ~PLAYER_ROLE_TANK;
            break;
        }
        case PLAYER_ROLE_HEALER:
        {
            InitRoles &= ~PLAYER_ROLE_HEALER;
            break;
        }
        case PLAYER_ROLE_DAMAGE:
        {
            if (DpsCount < LFGMgr::GetMaximumDPSSlots())
            {
                ++DpsCount;

                if (DpsCount >= LFGMgr::GetMaximumDPSSlots())
                    InitRoles &= ~PLAYER_ROLE_DAMAGE;
            }
            break;
        }
        default:
            break;
    }
    processed.push_back(plrGuid);

    return true;
}

/*********************************************************/
/***                   LOOT SYSTEM                     ***/
/*********************************************************/

void Group::SendLootStartRoll(uint32 CountDown, Roll const& r)
{
    WorldPacket data(SMSG_LOOT_START_ROLL, (8 + 4 + 4 + 4 + 4 + 4));
    data << r.lootedTargetGUID;                             // creature guid what we're looting
    data << uint32(r.itemSlot);                             // item slot in loot
    data << uint32(r.itemid);                               // the itemEntryId for the item that shall be rolled for
    data << uint32(0);                                      // randomSuffix - not used ?
    data << uint32(r.itemRandomPropId);                     // item random property ID
    data << uint32(CountDown);                              // the countdown time to choose "need" or "greed"

    for (const auto& itr : r.playerVote)
    {
        Player* p = sObjectMgr.GetPlayer(itr.first);
        if (!p)
            continue;

        if (itr.second == ROLL_NOT_VALID)
            continue;

        p->GetSession()->SendPacket(&data);
    }
}

void Group::SendLootRoll(ObjectGuid const& targetGuid, uint8 rollNumber, uint8 rollType, Roll const& r)
{
    WorldPacket data(SMSG_LOOT_ROLL, (8 + 4 + 8 + 4 + 4 + 4 + 1 + 1));
    data << r.lootedTargetGUID;                             // creature guid that we're looting
    data << uint32(r.itemSlot);
    data << targetGuid;                                     // player guid
    data << uint32(r.itemid);                               // the itemEntryId for the item that shall be rolled for
    data << uint32(0);                                      // randomSuffix - not used?
    data << uint32(r.itemRandomPropId);                     // Item random property ID
    data << uint8(rollNumber);                              // 0: "Need for: [item name]" > 127: "you passed on: [item name]"      Roll number
    data << uint8(rollType);                                // 0: "Need for: [item name]" 0: "You have selected need for [item name] 1: need roll 2: greed roll

    for (const auto& itr : r.playerVote)
    {
        Player* p = sObjectMgr.GetPlayer(itr.first);
        if (!p)
            continue;

        if (itr.second != ROLL_NOT_VALID)
            p->GetSession()->SendPacket(&data);
    }
}

void Group::SendLootRollWon(ObjectGuid const& targetGuid, uint8 rollNumber, RollVote rollType, Roll const& r)
{
    WorldPacket data(SMSG_LOOT_ROLL_WON, (8 + 4 + 4 + 4 + 4 + 8 + 1 + 1));
    data << r.lootedTargetGUID;                             // creature guid what we're looting
    data << uint32(r.itemSlot);                             // item slot in loot
    data << uint32(r.itemid);                               // the itemEntryId for the item that shall be rolled for
    data << uint32(0);                                      // randomSuffix - not used ?
    data << uint32(r.itemRandomPropId);                     // Item random property
    data << targetGuid;                                     // guid of the player who won.
    data << uint8(rollNumber);                              // rollnumber related to SMSG_LOOT_ROLL
    data << uint8(rollType);                                // Rolltype related to SMSG_LOOT_ROLL

    for (const auto& itr : r.playerVote)
    {
        Player* p = sObjectMgr.GetPlayer(itr.first);
        if (!p)
            continue;

        if (itr.second != ROLL_NOT_VALID)
            p->GetSession()->SendPacket(&data);
    }
}

void Group::SendLootAllPassed(Roll const& r)
{
    WorldPacket data(SMSG_LOOT_ALL_PASSED, (8 + 4 + 4 + 4 + 4));
    data << r.lootedTargetGUID;                             // creature guid what we're looting
    data << uint32(r.itemSlot);                             // item slot in loot
    data << uint32(r.itemid);                               // The itemEntryId for the item that shall be rolled for
    data << uint32(r.itemRandomPropId);                     // Item random property ID
    data << uint32(0);                                      // Item random suffix ID - not used ?

    for (const auto& itr : r.playerVote)
    {
        Player* p = sObjectMgr.GetPlayer(itr.first);
        if (!p)
            continue;

        if (itr.second != ROLL_NOT_VALID)
            p->GetSession()->SendPacket(&data);
    }
}

void Group::GroupLoot(Creature* creature, Loot* loot)
{
    for (uint8 itemSlot = 0; itemSlot < loot->items.size(); ++itemSlot)
    {
        LootItem& lootItem = loot->items[itemSlot];
        if (lootItem.freeforall)
            continue;

        ItemPrototype const* itemProto = sObjectMgr.GetItemPrototype(lootItem.itemid);
        if (!itemProto)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Group::GroupLoot: missing item prototype for item with id: %d", lootItem.itemid);
            continue;
        }

        //roll for over-threshold item if it's one-player loot
        if (itemProto->Quality >= uint32(m_lootThreshold))
            StartLootRoll(creature, GROUP_LOOT, loot, itemSlot);
        else
            lootItem.is_underthreshold = 1;
    }
}

void Group::NeedBeforeGreed(Creature* creature, Loot* loot)
{
    for (uint8 itemSlot = 0; itemSlot < loot->items.size(); ++itemSlot)
    {
        LootItem& lootItem = loot->items[itemSlot];
        if (lootItem.freeforall)
            continue;

        ItemPrototype const* itemProto = sObjectMgr.GetItemPrototype(lootItem.itemid);
        if (!itemProto)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Group::NeedBeforeGreed: missing item prototype for item with id: %d", lootItem.itemid);
            continue;
        }

        //only roll for one-player items, not for ones everyone can get
        if (itemProto->Quality >= uint32(m_lootThreshold))
            StartLootRoll(creature, NEED_BEFORE_GREED, loot, itemSlot);
        else
            lootItem.is_underthreshold = 1;
    }
}

void Group::MasterLoot(Creature* creature, Loot* loot, Player* player)
{
    for (auto& i : loot->items)
    {
        ItemPrototype const* item = sObjectMgr.GetItemPrototype(i.itemid);
        if (!item)
            continue;
        if (item->Quality < uint32(m_lootThreshold))
            i.is_underthreshold = 1;
    }

    uint32 playerCount = 0;

    WorldPacket data(SMSG_LOOT_MASTER_LIST, 330);
    data << uint8(0);

    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* looter = itr->getSource();
        if (!looter->IsInWorld())
            continue;

        if (looter->IsWithinLootXPDist(creature) && loot->IsAllowedLooter(looter->GetObjectGuid(), false))
        {
            data << looter->GetObjectGuid();
            ++playerCount;
        }
    }

    data.put<uint8>(0, playerCount);
    player->GetSession()->SendPacket(&data);
}

bool Group::CountRollVote(Player* player, ObjectGuid const& lootedTarget, uint32 itemSlot, RollVote vote)
{
    Rolls::iterator rollI = RollId.begin();
    for (; rollI != RollId.end(); ++rollI)
        if ((*rollI)->isValid() && (*rollI)->lootedTargetGUID == lootedTarget && (*rollI)->itemSlot == itemSlot)
            break;

    if (rollI == RollId.end())
        return false;

    CountRollVote(player->GetObjectGuid(), rollI, vote);    // result not related this function result meaning, ignore
    return true;
}

bool Group::CountRollVote(ObjectGuid const& playerGUID, Rolls::iterator& rollI, RollVote vote)
{
    Roll* roll = *rollI;

    Roll::PlayerVote::iterator itr = roll->playerVote.find(playerGUID);
    // this condition means that player joins to the party after roll begins
    if (itr == roll->playerVote.end())
        return true;                                        // result used for need iterator ++, so avoid for end of list

    if (Loot* pLoot = roll->getLoot())
        if (pLoot->items.empty())
            return false;

    switch (vote)
    {
        case ROLL_PASS:                                     // Player choose pass
        {
            SendLootRoll(playerGUID, 128, 128, *roll);
            ++roll->totalPass;
            itr->second = ROLL_PASS;
            break;
        }
        case ROLL_NEED:                                     // player choose Need
        {
            SendLootRoll(playerGUID, 0, 0, *roll);
            ++roll->totalNeed;
            itr->second = ROLL_NEED;
            break;
        }
        case ROLL_GREED:                                    // player choose Greed
        {
            SendLootRoll(playerGUID, 128, 2, *roll);
            ++roll->totalGreed;
            itr->second = ROLL_GREED;
            break;
        }
        default:                                            // Roll removed case
            break;
    }

    if (roll->totalPass + roll->totalNeed + roll->totalGreed >= roll->totalPlayersRolling)
    {
        CountTheRoll(rollI);
        return true;
    }

    return false;
}

void Group::StartLootRoll(Creature* lootTarget, LootMethod method, Loot* loot, uint8 itemSlot)
{
    if (itemSlot >= loot->items.size())
        return;

    LootItem const& lootItem =  loot->items[itemSlot];

    ItemPrototype const* item = sObjectMgr.GetItemPrototype(lootItem.itemid);

    Roll* r = new Roll(lootTarget->GetObjectGuid(), lootItem);

    //a vector is filled with only near party members
    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* playerToRoll = itr->getSource();
        if (!playerToRoll || !playerToRoll->IsInWorld())
            continue;

        if ((method != NEED_BEFORE_GREED || playerToRoll->CanUseItem(item) == EQUIP_ERR_OK) &&
            lootItem.AllowedForPlayer(playerToRoll, lootTarget) &&
            loot->IsAllowedLooter(playerToRoll->GetObjectGuid(), false) &&
            playerToRoll->IsWithinLootXPDist(lootTarget))
        {
            r->playerVote[playerToRoll->GetObjectGuid()] = ROLL_NOT_EMITED_YET;
            ++r->totalPlayersRolling;
        }
    }

    if (r->totalPlayersRolling > 0)                         // has looters
    {
        r->setLoot(loot);
        r->itemSlot = itemSlot;

        if (r->totalPlayersRolling == 1)                    // single looter
        {
            r->playerVote.begin()->second = ROLL_NEED;
            CountSingleLooterRoll(r);
        }
        else
        {
            SendLootStartRoll(LOOT_ROLL_TIMEOUT, *r);
            loot->items[itemSlot].is_blocked = true;
            lootTarget->StartGroupLoot(this, LOOT_ROLL_TIMEOUT);
            RollId.push_back(r);
        }
    }
    else                                            // no looters??
        delete r;
}

void Group::SendLootStartRollsForPlayer(Player* pPlayer)
{
    if (!pPlayer)
        return;

    for (const auto roll : RollId)
    {
        if (!roll->isValid())
            continue;

        for (Roll::PlayerVote::const_iterator itrVote = roll->playerVote.begin(); itrVote != roll->playerVote.end(); ++itrVote)
        {
            if (itrVote->first != pPlayer->GetObjectGuid() || itrVote->second != ROLL_NOT_EMITED_YET)
                continue;

            uint32 countDown = 0;
            if (Creature* pCreature = pPlayer->GetMap()->GetCreature(roll->lootedTargetGUID))
                countDown = pCreature->GetGroupLootTimer();

            if (!countDown)
                continue;

            WorldPacket data(SMSG_LOOT_START_ROLL, (8 + 4 + 4 + 4 + 4 + 4));
            data << roll->lootedTargetGUID;                   // creature guid what we're looting
            data << uint32(roll->itemSlot);                   // item slot in loot
            data << uint32(roll->itemid);                     // the itemEntryId for the item that shall be rolled for
            data << uint32(0);                                // randomSuffix - not used ?
            data << uint32(roll->itemRandomPropId);           // item random property ID
            data << uint32(countDown);                        // the countdown time to choose "need" or "greed"

            pPlayer->GetSession()->SendPacket(&data);
        }
    }
}

// called when roll timer expires
void Group::EndRoll(Loot* loot)
{
    for (Rolls::iterator itr = RollId.begin(); itr != RollId.end();)
    {
        if ((*itr)->getLoot() == loot)
        {
            CountTheRoll(itr);           //i don't have to edit player votes, who didn't vote ... he will pass
            itr = RollId.begin();
        }
        else
            itr++;
    }
}

void Group::CountSingleLooterRoll(Roll* roll)
{
    ObjectGuid playerGuid = roll->playerVote.begin()->first;
    Player* player = sObjectMgr.GetPlayer(playerGuid);
    SendLootRollWon(playerGuid, uint8(100), ROLL_NEED, *roll);

    LootItem* item = &(roll->getLoot()->items[roll->itemSlot]);
    if (player)
    {
        ItemPosCountVec dest;
        InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, roll->itemid, item->count);
        if (msg == EQUIP_ERR_OK)
        {
            item->is_looted = true;
            roll->getLoot()->NotifyItemRemoved(roll->itemSlot);
            --roll->getLoot()->unlootedCount;
            sLog.Player(player->GetSession(), LOG_LOOTS, LOG_LVL_MINIMAL, "%s wins need roll for %ux%u [loot from %s]",
                player->GetShortDescription().c_str(), item->count, item->itemid, roll->lootedTargetGUID.GetString().c_str());
            if (Item* newItem = player->StoreNewItem(dest, roll->itemid, true, item->randomPropertyId))
                player->OnReceivedItem(newItem);
        }
        else
        {
            item->is_blocked = false;
            item->lootOwner = playerGuid;
            player->SendEquipError(msg, nullptr, nullptr, roll->itemid);
        }
    }

    delete roll;
}

void Group::CountTheRoll(Rolls::iterator& rollI)
{
    Roll* roll = *rollI;
    if (!roll->isValid())                                   // is loot already deleted ?
    {
        rollI = RollId.erase(rollI);
        delete roll;
        return;
    }

    //end of the roll
    if (roll->totalNeed > 0)
    {
        if (!roll->playerVote.empty())
        {
            uint8 maxresul = 0;
            ObjectGuid maxguid  = (*roll->playerVote.begin()).first;
            Player* player;

            for (Roll::PlayerVote::const_iterator itr = roll->playerVote.begin(); itr != roll->playerVote.end(); ++itr)
            {
                if (itr->second != ROLL_NEED)
                    continue;

                uint8 randomN = urand(1, 100);
                SendLootRoll(itr->first, randomN, ROLL_NEED, *roll);
                if (maxresul < randomN)
                {
                    maxguid  = itr->first;
                    maxresul = randomN;
                }
            }
            SendLootRollWon(maxguid, maxresul, ROLL_NEED, *roll);
            player = sObjectMgr.GetPlayer(maxguid);

            LootItem* item = &(roll->getLoot()->items[roll->itemSlot]);
            if (player)
            {
                ItemPosCountVec dest;
                InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, roll->itemid, item->count);
                if (msg == EQUIP_ERR_OK)
                {
                    item->is_looted = true;
                    roll->getLoot()->NotifyItemRemoved(roll->itemSlot);
                    --roll->getLoot()->unlootedCount;
                    sLog.Player(player->GetSession(), LOG_LOOTS, LOG_LVL_MINIMAL, "%s wins need roll for %ux%u [loot from %s]",
                             player->GetShortDescription().c_str(), item->count, item->itemid, roll->lootedTargetGUID.GetString().c_str());
                    if (Item* newItem = player->StoreNewItem(dest, roll->itemid, true, item->randomPropertyId))
                        player->OnReceivedItem(newItem);
                }
                else
                {
                    item->is_blocked = false;
                    item->lootOwner = maxguid;
                    player->SendEquipError(msg, nullptr, nullptr, roll->itemid);
                }
            }
            else
                item->lootOwner = maxguid;
        }
    }
    else if (roll->totalGreed > 0)
    {
        if (!roll->playerVote.empty())
        {
            uint8 maxresul = 0;
            ObjectGuid maxguid = (*roll->playerVote.begin()).first;
            Player* player;

            Roll::PlayerVote::iterator itr;
            for (itr = roll->playerVote.begin(); itr != roll->playerVote.end(); ++itr)
            {
                if (itr->second != ROLL_GREED)
                    continue;

                uint8 randomN = urand(1, 100);
                SendLootRoll(itr->first, randomN, itr->second, *roll);
                if (maxresul < randomN)
                {
                    maxguid  = itr->first;
                    maxresul = randomN;
                }
            }
            SendLootRollWon(maxguid, maxresul, ROLL_GREED, *roll);
            player = sObjectMgr.GetPlayer(maxguid);

            if (player)
            {
                ItemPosCountVec dest;
                LootItem* item = &(roll->getLoot()->items[roll->itemSlot]);
                InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, roll->itemid, item->count);
                if (msg == EQUIP_ERR_OK)
                {
                    item->is_looted = true;
                    roll->getLoot()->NotifyItemRemoved(roll->itemSlot);
                    --roll->getLoot()->unlootedCount;
                    sLog.Player(player->GetSession(), LOG_LOOTS, LOG_LVL_MINIMAL, "%s wins greed roll for %ux%u [loot from %s]",
                             player->GetShortDescription().c_str(), item->count, item->itemid, roll->lootedTargetGUID.GetString().c_str());
                    if (Item* newItem = player->StoreNewItem(dest, roll->itemid, true, item->randomPropertyId))
                        player->OnReceivedItem(newItem);
                }
                else
                {
                    item->is_blocked = false;
                    player->SendEquipError(msg, nullptr, nullptr, roll->itemid);
                }
            }
        }
    }
    else
    {
        SendLootAllPassed(*roll);
        LootItem* item = &(roll->getLoot()->items[roll->itemSlot]);
        if (item) item->is_blocked = false;
    }
    rollI = RollId.erase(rollI);
    delete roll;
}

void Group::SetTargetIcon(uint8 id, ObjectGuid targetGuid)
{
    if (id >= TARGET_ICON_COUNT)
        return;

    // clean other icons
    if (targetGuid)
        for (int i = 0; i < TARGET_ICON_COUNT; ++i)
            if (m_targetIcons[i] == targetGuid)
                SetTargetIcon(i, ObjectGuid());

    m_targetIcons[id] = targetGuid;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    WorldPacket data(MSG_RAID_TARGET_UPDATE, (1 + 1 + 8));
    data << uint8(0); // 1 - full icon list, 0 - delta update
    data << uint8(id);
    data << targetGuid;
    BroadcastPacket(&data, true);
#endif
}

void Group::ClearTargetIcon(ObjectGuid targetGuid)
// Find target icon of target. Clear if found
{
    for (int i = 0; i < TARGET_ICON_COUNT; ++i)
        if (m_targetIcons[i] == targetGuid)
            return SetTargetIcon(i, ObjectGuid());
}


static void GetDataForXPAtKill_helper(Player* player, Unit const* victim, uint32& sum_level, Player* & member_with_max_level, Unit* & not_gray_member_with_max_level)
{
    sum_level += player->GetLevel();
    if (!member_with_max_level || member_with_max_level->GetLevel() < player->GetLevel())
        member_with_max_level = player;

    uint32 gray_level = MaNGOS::XP::GetGrayLevel(player->GetLevel());
    if (victim->GetLevel() > gray_level && (!not_gray_member_with_max_level
        || not_gray_member_with_max_level->GetLevel() < player->GetLevel()))
        not_gray_member_with_max_level = player;
}

void Group::GetDataForXPAtKill(Unit const* victim, uint32& count, uint32& sum_level, Player* & member_with_max_level, Unit* & not_gray_member_with_max_level, Player* additional)
{
    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* member = itr->getSource();
        if (!member || !member->IsAlive() || !member->IsInWorld())                  // only for alive
            continue;

        // will proccesed later
        if (member == additional)
            continue;

        if (!member->IsAtGroupRewardDistance(victim))       // at req. distance
            continue;

        ++count;
        GetDataForXPAtKill_helper(member, victim, sum_level, member_with_max_level, not_gray_member_with_max_level);
    }

    if (additional)
    {
        if (additional->IsAtGroupRewardDistance(victim))    // at req. distance
        {
            ++count;
            GetDataForXPAtKill_helper(additional, victim, sum_level, member_with_max_level, not_gray_member_with_max_level);
        }
    }
}

void Group::SendTargetIconList(WorldSession* session)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    if (!session)
        return;

    WorldPacket data(MSG_RAID_TARGET_UPDATE, (1 + TARGET_ICON_COUNT * 9));
    data << uint8(1); // 1 - full icon list, 0 - delta update

    for (int i = 0; i < TARGET_ICON_COUNT; ++i)
    {
        if (!m_targetIcons[i])
            continue;

        data << uint8(i);
        data << m_targetIcons[i];
    }

    session->SendPacket(&data);
#endif
}

void Group::SendUpdate()
{
    // sending full group list update clears marked targets when not in a raid, so we need to resend them
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    std::unique_ptr<WorldPacket> markedTargets;
    if (!isRaidGroup())
    {
        for (int i = 0; i < TARGET_ICON_COUNT; ++i)
        {
            if (!m_targetIcons[i])
                continue;

            if (!markedTargets)
            {
                markedTargets = std::make_unique<WorldPacket>(MSG_RAID_TARGET_UPDATE, (1 + TARGET_ICON_COUNT * 9));
                *markedTargets << uint8(1); // 1 - full icon list, 0 - delta update
            }
                
            *markedTargets << uint8(i);
            *markedTargets << m_targetIcons[i];
        }
    }
#endif

    for (member_citerator citr = m_memberSlots.begin(); citr != m_memberSlots.end(); ++citr)
    {
        Player* player = sObjectMgr.GetPlayer(citr->guid);
        if (!player || player->GetGroup() != this)
            continue;

        // guess size
        WorldPacket data(SMSG_GROUP_LIST, (1 + 1 + 1 + 4 + GetMembersCount() * 20) + 8 + 1 + 8 + 1);
        data << (uint8)m_groupType;                         // group type
        data << (uint8)(citr->group | (citr->assistant ? 0x80 : 0)); // own flags (groupid | (assistant?0x80:0))

        uint32 count = 0;
        size_t countPos = data.wpos();
        data << uint32(0);
        for (const auto& itr : m_memberSlots)
        {
            if (citr->guid == itr.guid)
                continue;

            data << itr.name;
            data << itr.guid;
            data << uint8(GetGroupMemberStatus(sObjectMgr.GetPlayer(itr.guid)));
            data << (uint8)(itr.group | (itr.assistant ? 0x80 : 0));
            count++;
        }
        data.put<uint32>(countPos, count);

        data << m_leaderGuid;                               // leader guid
        if (count)
        {
            data << uint8(m_lootMethod);                    // loot method
            if (GetLootMethod() == MASTER_LOOT)
                data << m_looterGuid;                       // looter guid
            else
                data << uint64(0);
            data << uint8(m_lootThreshold);                 // loot threshold

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
            data << uint8(0);                               // dungeon difficulty
#endif
        }
        player->GetSession()->SendPacket(&data);

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        if (markedTargets)
            player->GetSession()->SendPacket(markedTargets.get());
#endif
    }
}

void Group::UpdatePlayerOutOfRange(Player* pPlayer)
{
    if (!pPlayer || !pPlayer->IsInWorld())
        return;

    if (pPlayer->GetGroupUpdateFlag() == GROUP_UPDATE_FLAG_NONE)
        return;

    WorldPacket data;
    pPlayer->GetSession()->BuildPartyMemberStatsChangedPacket(pPlayer, &data);

    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
        if (Player* player = itr->getSource())
            if (player != pPlayer && !player->IsInVisibleList(pPlayer)) // Possible unsafe call (cross maps groups)
                player->GetSession()->SendPacket(&data);
}

void Group::UpdatePlayerOnlineStatus(Player* player, bool online /*= true*/)
{
    if (!player)
        return;
    ObjectGuid const guid = player->GetObjectGuid();
    if (!IsMember(guid))
        return;

    SendUpdate();
    if (online)
    {
        player->SetGroupUpdateFlag(GROUP_UPDATE_FULL);
        UpdatePlayerOutOfRange(player);
    }
    else if (IsLeader(guid))
        m_leaderLastOnline = time(nullptr);
}

void Group::UpdateOfflineLeader(time_t time, uint32 delay)
{
    // Do not update BG groups, BGs take care of offliners
    if (isBGGroup())
        return;

    // TODO: Maybe cache the world session for the leader, and only fetch if we hit a cache miss?
    // Get the leader and leader session
    uint32 leaderAcc = sObjectMgr.GetPlayerAccountIdByGUID(m_leaderGuid);
    WorldSession* session = sWorld.FindSession(leaderAcc);
    Player* leader = sObjectMgr.GetPlayer(m_leaderGuid);

    // Check for delay, leader presence or if the leader is loading

    if (leader)
    {
        m_leaderLastOnline = time;
        return;
    }

    if ((time - m_leaderLastOnline) < delay || (session && session->PlayerLoading()))
        return;

    _chooseLeader(true);
}

void Group::BroadcastPacket(WorldPacket* packet, bool ignorePlayersInBGRaid, int group, ObjectGuid ignore)
{
    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* pl = itr->getSource();
        if (!pl || (ignore && pl->GetObjectGuid() == ignore) || (ignorePlayersInBGRaid && pl->GetGroup() != this))
            continue;

        if (group == -1 || itr->getSubGroup() == group)
            pl->GetSession()->SendPacket(packet);
    }
}

void Group::BroadcastReadyCheck(WorldPacket* packet)
{
    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* pl = itr->getSource();
        if (pl)
            if (IsLeader(pl->GetObjectGuid()) || IsAssistant(pl->GetObjectGuid()))
                pl->GetSession()->SendPacket(packet);
    }
}

void Group::OfflineReadyCheck()
{
    /*
        for(member_citerator citr = m_memberSlots.begin(); citr != m_memberSlots.end(); ++citr)
        {
            Player* pl = sObjectMgr.GetPlayer(citr->guid);
            if (!pl)
            {
                WorldPacket data(MSG_RAID_READY_CHECK_CONFIRM, 9);
                data << citr->guid;
                data << uint8(0);
                BroadcastReadyCheck(&data);
            }
        }
    */
}

bool Group::_addMember(ObjectGuid guid, char const* name, bool isAssistant)
{
    // get first not-full group
    uint8 groupid = 0;
    if (m_subGroupsCounts)
    {
        bool groupFound = false;
        for (; groupid < MAX_RAID_SUBGROUPS; ++groupid)
        {
            if (m_subGroupsCounts[groupid] < MAX_GROUP_SIZE)
            {
                groupFound = true;
                break;
            }
        }
        // We are raid group and no one slot is free
        if (!groupFound)
            return false;
    }

    return _addMember(guid, name, isAssistant, groupid);
}

bool Group::_addMember(ObjectGuid guid, char const* name, bool isAssistant, uint8 group)
{
    if (IsFull())
        return false;

    if (!guid)
        return false;

    for (auto const& itr : m_memberSlots)
    {
        if (itr.guid == guid)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Attempt to add duplicate member into group.");
            return false;
        }
    }

    Player* player = sObjectMgr.GetPlayer(guid);

    MemberSlot member;
    member.guid      = guid;
    member.name      = name;
    member.group     = group;
    member.assistant = isAssistant;
    m_memberSlots.push_back(member);

    SubGroupCounterIncrease(group);

    if (player)
    {
        if (Group* invitedGroup = player->GetGroupInvite())
            invitedGroup->RemoveInvite(player);
        player->SetGroupInvite(nullptr);

        //if player is in group and he is being added to BG raid group, then call SetBattleGroundRaid()
        if (player->GetGroup() && isBGGroup())
            player->SetBattleGroundRaid(this, group);
        //if player is in bg raid and we are adding him to normal group, then call SetOriginalGroup()
        else if (player->GetGroup())
            player->SetOriginalGroup(this, group);
        //if player is not in group, then call set group
        else
            player->SetGroup(this, group);

        // if the same group invites the player back, cancel the homebind timer
        if (InstanceGroupBind *bind = GetBoundInstance(player->GetMapId()))
            if (bind->state->GetInstanceId() == player->GetInstanceId())
                player->m_InstanceValid = true;
    }

    if (!isBGGroup() && !(player && player->IsSavingDisabled()))
    {
        // insert into group table
        CharacterDatabase.PExecute("INSERT INTO `group_member` (`group_id`, `member_guid`, `assistant`, `subgroup`) VALUES('%u','%u','%u','%u')",
                                   m_Id, member.guid.GetCounter(), ((member.assistant == 1) ? 1 : 0), member.group);
    }

    return true;
}

bool Group::_removeMember(ObjectGuid guid)
{
    Player* player = sObjectMgr.GetPlayer(guid);
    if (player)
    {
        //if we are removing player from battleground raid
        if (isBGGroup())
            player->RemoveFromBattleGroundRaid();
        else
        {
            //we can remove player who is in battleground from his original group
            if (player->GetOriginalGroup() == this)
                player->SetOriginalGroup(nullptr);
            else
                player->SetGroup(nullptr);
        }
    }

    _removeRolls(guid);

    member_witerator slot = _getMemberWSlot(guid);
    if (slot != m_memberSlots.end())
    {
        SubGroupCounterDecrease(slot->group);

        m_memberSlots.erase(slot);
    }

    if (!isBGGroup())
        CharacterDatabase.PExecute("DELETE FROM `group_member` WHERE `member_guid`='%u'", guid.GetCounter());

    if (m_leaderGuid == guid)                               // leader was removed
    {
        _updateLeaderFlag(true);
        _chooseLeader();
        return true;
    }

    return false;
}

void Group::_chooseLeader(bool offline /*= false*/)
{
    if (GetMembersCount() < GetMembersMinCount())
        return;

    ObjectGuid first = ObjectGuid(); // First available: if no suitable canditates are found
    ObjectGuid chosen = ObjectGuid(); // Player matching prio creteria

    for (const auto& itr : m_memberSlots)
    {
        if (itr.guid == m_leaderGuid)
            continue;

        // Prioritize online players
        Player* player = sObjectMgr.GetPlayer(itr.guid);
        if (!player || player->GetGroup() != this)
            continue;

        // Prioritize assistants for raids
        if (isRaidGroup() && !itr.assistant)
        {
            if (first.IsEmpty())
                first = itr.guid;
            continue;
        }

        chosen = itr.guid;
        break;
    }

    if (chosen.IsEmpty())
        chosen = first;

    // If we are choosing a new leader due to inactivity, check if everyone is offline first
    if (offline && chosen.IsEmpty())
        return;

    // Still nobody online...
    if (chosen.IsEmpty())
        chosen = m_memberSlots.front().guid;

    // Do announce if we are choosing a new leader due to old one being offline
    return (offline ? ChangeLeader(chosen) : _setLeader(chosen));
}

void Group::_setLeader(ObjectGuid guid)
{
    member_citerator slot = _getMemberCSlot(guid);
    if (slot == m_memberSlots.end())
        return;

    if (!isBGGroup())
    {
        uint32 slot_lowguid = slot->guid.GetCounter();

        uint32 leader_lowguid = m_leaderGuid.GetCounter();

        // TODO: set a time limit to have this function run rarely cause it can be slow
        CharacterDatabase.BeginTransaction();

        // update the group's bound instances when changing leaders

        // remove all permanent binds from the group
        // in the DB also remove solo binds that will be replaced with permbinds
        // from the new leader
        CharacterDatabase.PExecute(
            "DELETE FROM `group_instance` WHERE `leader_guid`='%u' AND (`permanent` = 1 OR "
            "`instance` IN (SELECT `instance` FROM `character_instance` WHERE `guid` = '%u')"
            ")", leader_lowguid, slot_lowguid);

        Player* player = sObjectMgr.GetPlayer(slot->guid);

        if (player)
        {
            for (BoundInstancesMap::iterator itr = m_boundInstances.begin(); itr != m_boundInstances.end();)
            {
                if (itr->second.perm)
                {
                    itr->second.state->RemoveGroup(this);
                    m_boundInstances.erase(itr++);
                }
                else
                    ++itr;
            }
        }

        // update the group's solo binds to the new leader
        CharacterDatabase.PExecute("UPDATE `group_instance` SET `leader_guid`='%u' WHERE `leader_guid` = '%u'",
                                   slot_lowguid, leader_lowguid);

        // copy the permanent binds from the new leader to the group
        // overwriting the solo binds with permanent ones if necessary
        // in the DB those have been deleted already
        Player::ConvertInstancesToGroup(player, this, slot->guid);

        // update the group leader
        CharacterDatabase.PExecute("UPDATE `groups` SET `leader_guid`='%u' WHERE `group_id`='%u'", slot_lowguid, m_Id);
        CharacterDatabase.CommitTransaction();
    }

    _updateLeaderFlag(true);
    m_leaderGuid = slot->guid;
    m_leaderName = slot->name;
    m_leaderLastOnline = time(nullptr);
    _updateLeaderFlag();
}

void Group::_updateLeaderFlag(bool const remove /*= false*/)
{
    if (Player* player = sObjectMgr.GetPlayer(m_leaderGuid))
        player->UpdateGroupLeaderFlag(remove);
}

void Group::_removeRolls(ObjectGuid guid)
{
    for (Rolls::iterator it = RollId.begin(); it != RollId.end();)
    {
        Roll* roll = *it;
        Roll::PlayerVote::iterator itr2 = roll->playerVote.find(guid);
        if (itr2 == roll->playerVote.end())
        {
            ++it;
            continue;
        }

        if (itr2->second == ROLL_GREED)
            --roll->totalGreed;
        if (itr2->second == ROLL_NEED)
            --roll->totalNeed;
        if (itr2->second == ROLL_PASS)
            --roll->totalPass;
        if (itr2->second != ROLL_NOT_VALID)
            --roll->totalPlayersRolling;

        roll->playerVote.erase(itr2);

        if (!CountRollVote(guid, it, ROLL_NOT_EMITED_YET))
            ++it;
    }
}

bool Group::_swapMembersGroup(ObjectGuid guid, ObjectGuid swapGuid)
{
    // If we can't get a member slot for both members then the swap is impossible
    member_witerator slot = _getMemberWSlot(guid);
    if (slot == m_memberSlots.end())
        return false;

    member_witerator swapSlot = _getMemberWSlot(swapGuid);
    if (swapSlot == m_memberSlots.end())
        return false;

    uint8 swapGroup = swapSlot->group;
    swapSlot->group = slot->group;
    slot->group = swapGroup;

    // Don't need to change group counters since we are swapping
    if (!isBGGroup())
    {
        CharacterDatabase.PExecute("UPDATE `group_member` SET `subgroup`='%u' WHERE `member_guid`='%u'", slot->group, guid.GetCounter());
        CharacterDatabase.PExecute("UPDATE `group_member` SET `subgroup`='%u' WHERE `member_guid`='%u'", swapSlot->group, swapGuid.GetCounter());
    }

    return true;
}

bool Group::_setMembersGroup(ObjectGuid guid, uint8 group)
{
    member_witerator slot = _getMemberWSlot(guid);
    if (slot == m_memberSlots.end())
        return false;

    slot->group = group;

    SubGroupCounterIncrease(group);

    if (!isBGGroup())
        CharacterDatabase.PExecute("UPDATE `group_member` SET `subgroup`='%u' WHERE `member_guid`='%u'", group, guid.GetCounter());

    return true;
}

bool Group::_setAssistantFlag(ObjectGuid guid, bool const& state)
{
    member_witerator slot = _getMemberWSlot(guid);
    if (slot == m_memberSlots.end())
        return false;

    slot->assistant = state;
    if (!isBGGroup())
        CharacterDatabase.PExecute("UPDATE `group_member` SET `assistant`='%u' WHERE `member_guid`='%u'", (state) ? 1 : 0, guid.GetCounter());
    return true;
}

bool Group::_setMainTank(ObjectGuid guid)
{
    if (m_mainTankGuid == guid)
        return false;

    if (guid)
    {
        member_citerator slot = _getMemberCSlot(guid);
        if (slot == m_memberSlots.end())
            return false;

        if (m_mainAssistantGuid == guid)
            _setMainAssistant(ObjectGuid());
    }

    m_mainTankGuid = guid;

    if (!isBGGroup())
        CharacterDatabase.PExecute("UPDATE `groups` SET `main_tank_guid`='%u' WHERE `group_id`='%u'", m_mainTankGuid.GetCounter(), m_Id);

    return true;
}

bool Group::_setMainAssistant(ObjectGuid guid)
{
    if (m_mainAssistantGuid == guid)
        return false;

    if (guid)
    {
        member_witerator slot = _getMemberWSlot(guid);
        if (slot == m_memberSlots.end())
            return false;

        if (m_mainTankGuid == guid)
            _setMainTank(ObjectGuid());
    }

    m_mainAssistantGuid = guid;

    if (!isBGGroup())
        CharacterDatabase.PExecute("UPDATE `groups` SET `main_assistant_guid`='%u' WHERE `group_id`='%u'",
                                   m_mainAssistantGuid.GetCounter(), m_Id);

    return true;
}

bool Group::SameSubGroup(Player const* member1, Player const* member2) const
{
    if (!member1 || !member2)
        return false;
    if (member1->GetGroup() != this || member2->GetGroup() != this)
        return false;
    else
        return member1->GetSubGroup() == member2->GetSubGroup();
}

// allows setting subgroup for offline members
void Group::ChangeMembersGroup(ObjectGuid guid, uint8 group)
{
    if (!isRaidGroup() || group >= MAX_RAID_SUBGROUPS)
        return;

    // Cannot put player in group if it would cause the group to overflow
    if (m_subGroupsCounts && m_subGroupsCounts[group] >= MAX_GROUP_SIZE)
        return;

    Player* player = sObjectMgr.GetPlayer(guid);

    if (!player)
    {
        uint8 prevSubGroup = GetMemberGroup(guid);
        if (prevSubGroup == group)
            return;

        if (_setMembersGroup(guid, group))
        {
            SubGroupCounterDecrease(prevSubGroup);
            SendUpdate();
        }
    }
    else
        // This methods handles itself groupcounter decrease
        ChangeMembersGroup(player, group);
}

// only for online members
void Group::ChangeMembersGroup(Player* player, uint8 group)
{
    if (!player || !isRaidGroup() || group >= MAX_RAID_SUBGROUPS)
        return;

    // Player's current subgroup may be from a battleground, so check
    // subgroup in this Group
    uint8 prevSubGroup = GetMemberGroup(player->GetObjectGuid());
    if (prevSubGroup == group || prevSubGroup >= MAX_RAID_SUBGROUPS)
        return;

    // Cannot put player in group if it would cause the group to overflow
    if (m_subGroupsCounts && m_subGroupsCounts[group] >= MAX_GROUP_SIZE)
        return;

    if (_setMembersGroup(player->GetObjectGuid(), group))
    {
        if (player->GetGroup() == this)
            player->GetGroupRef().setSubGroup(group);
        //if player is in BG raid, it is possible that he is also in normal raid - and that normal raid is stored in m_originalGroup reference
        else
        {
            prevSubGroup = player->GetOriginalSubGroup();
            player->GetOriginalGroupRef().setSubGroup(group);
        }
        SubGroupCounterDecrease(prevSubGroup);

        SendUpdate();
    }
}

// One or both members are offline
void Group::SwapMembersGroup(ObjectGuid guid, ObjectGuid swapGuid)
{
    if (!isRaidGroup())
        return;

    Player* player = sObjectMgr.GetPlayer(guid);
    Player* swapPlayer = sObjectMgr.GetPlayer(swapGuid);

    if (player && swapPlayer)
        SwapMembersGroup(player, swapPlayer);
    else
    {
        uint8 group = GetMemberGroup(guid);
        uint8 swapGroup = GetMemberGroup(swapGuid);

        // Same group, can't swap
        if (group == swapGroup || group >= MAX_RAID_SUBGROUPS || swapGroup >= MAX_RAID_SUBGROUPS)
            return;

        if (_swapMembersGroup(guid, swapGuid))
        {
            // Player is online, update group refs
            if (player)
            {
                if (player->GetGroup() == this)
                    player->GetGroupRef().setSubGroup(swapGroup);
                // BG group
                else
                    player->GetOriginalGroupRef().setSubGroup(swapGroup);
            }

            // Swap player is online, update group refs
            if (swapPlayer)
            {
                if (swapPlayer->GetGroup() == this)
                    swapPlayer->GetGroupRef().setSubGroup(group);
                else
                    swapPlayer->GetOriginalGroupRef().setSubGroup(group);
            }

            // Don't change group counters, we're swapping. Just update
            SendUpdate();
        }
    }
}

// Both members online
void Group::SwapMembersGroup(Player* player, Player* swapPlayer)
{
    if (!isRaidGroup() || !player || !swapPlayer)
        return;

    // Cannot swap players in the same sub group! Get groups from GetMemberGroup,
    // as either player may be in a battleground and not have their current group
    // set to this Group
    uint8 group = GetMemberGroup(player->GetObjectGuid());
    uint8 swapGroup = GetMemberGroup(swapPlayer->GetObjectGuid());

    if (group == swapGroup || group >= MAX_RAID_SUBGROUPS || swapGroup >= MAX_RAID_SUBGROUPS)
        return;

    if (_swapMembersGroup(player->GetObjectGuid(), swapPlayer->GetObjectGuid()))
    {
        // One player may be in a BG group, the other not
        if (player->GetGroup() == this)
            player->GetGroupRef().setSubGroup(swapGroup);
        // BG group
        else
            player->GetOriginalGroupRef().setSubGroup(swapGroup);

        if (swapPlayer->GetGroup() == this)
            swapPlayer->GetGroupRef().setSubGroup(group);
        else
            swapPlayer->GetOriginalGroupRef().setSubGroup(group);

        SendUpdate();
    }
}

uint32 Group::CanJoinBattleGroundQueue(BattleGroundTypeId bgTypeId, BattleGroundQueueTypeId bgQueueTypeId, uint32 MinPlayerCount, uint32 MaxPlayerCount, Player* Leader, std::vector<uint32>* excludedMembers)
{
    // check for min / max count
    uint32 memberscount = GetMembersCount();
    if (memberscount < MinPlayerCount)
        return BG_JOIN_ERR_GROUP_NOT_ENOUGH;
    if (memberscount > MaxPlayerCount)
        return BG_JOIN_ERR_GROUP_TOO_MANY;

    // no reference found, can't join this way
    if (!Leader)
        return BG_JOIN_ERR_OFFLINE_MEMBER;

    BattleGroundBracketId bracket_id = Leader->GetBattleGroundBracketIdFromLevel(bgTypeId);
    Team team = Leader->GetTeam();

    // check every member of the group to be able to join
    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* member = itr->getSource();
        // offline member? don't let join
        if (!member || !member->IsInWorld())
            return BG_JOIN_ERR_OFFLINE_MEMBER;
        // don't allow cross-faction join as group
        if (member->GetTeam() != team)
            return BG_JOIN_ERR_MIXED_FACTION;
        // not in the same battleground level bracket, don't let join
        if (member->GetBattleGroundBracketIdFromLevel(bgTypeId) != bracket_id)
        {
            if (excludedMembers && (std::find(excludedMembers->begin(), excludedMembers->end(), member->GetGUIDLow()) == excludedMembers->end()))
                excludedMembers->push_back(member->GetGUIDLow());
        }
        // don't let join if someone from the group is already in that bg queue
        if (member->InBattleGroundQueueForBattleGroundQueueType(bgQueueTypeId))
            return BG_JOIN_ERR_GROUP_MEMBER_ALREADY_IN_QUEUE;
        // check for deserter debuff
        if (!member->CanJoinToBattleground())
            return BG_JOIN_ERR_GROUP_DESERTER;
        // check if member can join any more battleground queues
        if (!member->HasFreeBattleGroundQueueId())
            return BG_JOIN_ERR_ALL_QUEUES_USED;
        if (!sWorld.getConfig(CONFIG_BOOL_TAG_IN_BATTLEGROUNDS) && member->InBattleGround())
            return BG_JOIN_ERR_OFFLINE_MEMBER;
    }
    return BG_JOIN_ERR_OK;
}

bool Group::InCombatToInstance(uint32 instanceId)
{
    for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* pPlayer = itr->getSource();
        if (pPlayer->IsInCombat() && pPlayer->GetInstanceId() == instanceId)
            return true;
    }
    return false;
}

void Group::ResetInstances(InstanceResetMethod method, Player* SendMsgTo)
{
    if (isBGGroup())
        return;

    // method can be INSTANCE_RESET_ALL, INSTANCE_RESET_GROUP_DISBAND

    for (BoundInstancesMap::iterator itr = m_boundInstances.begin(); itr != m_boundInstances.end();)
    {
        DungeonPersistentState* state = itr->second.state;
        MapEntry const* entry = sMapStorage.LookupEntry<MapEntry>(itr->first);
        if (!entry || (!state->CanReset() && method != INSTANCE_RESET_GROUP_DISBAND))
        {
            ++itr;
            continue;
        }

        if (method == INSTANCE_RESET_ALL)
        {
            // the "reset all instances" method can only reset normal maps
            if (entry->mapType == MAP_RAID)
            {
                ++itr;
                continue;
            }

            if (SendMsgTo)
            {
                bool offline_players = false;
                for (const auto& itr : m_memberSlots)
                {
                    Player* pl = sObjectMgr.GetPlayer(itr.guid);
                    if (!pl)
                    {
                        offline_players = true;
                        break;
                    }
                }

                if (offline_players)
                {
                    SendMsgTo->SendResetInstanceFailed(INSTANCERESET_FAIL_OFFLINE, state->GetMapId());
                    ++itr;
                    continue;
                }
            }
        }

        bool isEmpty = true;
        // if the map is loaded, reset it
        if (Map* map = sMapMgr.FindMap(state->GetMapId(), state->GetInstanceId()))
            if (map->IsDungeon() && !(method == INSTANCE_RESET_GROUP_DISBAND && !state->CanReset()))
                isEmpty = ((DungeonMap*)map)->Reset(method);

        if (SendMsgTo)
        {
            if (isEmpty)
                SendMsgTo->SendResetInstanceSuccess(state->GetMapId());
            else
                SendMsgTo->SendResetInstanceFailed(INSTANCERESET_FAIL_GENERAL, state->GetMapId());
        }

        if (isEmpty || method == INSTANCE_RESET_GROUP_DISBAND)
        {
            // do not reset the instance, just unbind if others are permanently bound to it
            if (state->CanReset())
                state->DeleteFromDB();
            else
                CharacterDatabase.PExecute("DELETE FROM `group_instance` WHERE `instance` = '%u'", state->GetInstanceId());
            // i don't know for sure if hash_map iterators
            m_boundInstances.erase(itr);
            itr = m_boundInstances.begin();
            // this unloads the instance save unless online players are bound to it
            // (eg. permanent binds or GM solo binds)
            state->RemoveGroup(this);
        }
        else
            ++itr;
    }
}

InstanceGroupBind* Group::GetBoundInstance(uint32 mapid)
{
    MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(mapid);
    if (!mapEntry)
        return nullptr;

    BoundInstancesMap::iterator itr = m_boundInstances.find(mapid);
    if (itr != m_boundInstances.end())
        return &itr->second;
    else
        return nullptr;
}

InstanceGroupBind* Group::BindToInstance(DungeonPersistentState* state, bool permanent, bool load)
{
    if (state && !isBGGroup())
    {
        ASSERT(state->GetMapId() > 1);

        InstanceGroupBind& bind = m_boundInstances[state->GetMapId()];
        if (bind.state)
        {
            // when a boss is killed or when copying the players's binds to the group
            if (permanent != bind.perm || state != bind.state)
                if (!load)
                    CharacterDatabase.PExecute("UPDATE `group_instance` SET `instance` = '%u', `permanent` = '%u' WHERE `leader_guid` = '%u' AND `instance` = '%u'",
                                               state->GetInstanceId(), permanent, GetLeaderGuid().GetCounter(), bind.state->GetInstanceId());
        }
        else if (!load)
            CharacterDatabase.PExecute("INSERT INTO `group_instance` (`leader_guid`, `instance`, `permanent`) VALUES ('%u', '%u', '%u')",
                                       GetLeaderGuid().GetCounter(), state->GetInstanceId(), permanent);

        if (bind.state != state)
        {
            if (bind.state)
                bind.state->RemoveGroup(this);
            state->AddGroup(this);
        }

        bind.state = state;
        bind.perm = permanent;
        if (!load)
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Group::BindToInstance: Group (Id: %d) is now bound to map %d, instance %d",
                      GetId(), state->GetMapId(), state->GetInstanceId());
        return &bind;
    }
    else
        return nullptr;
}

void Group::UnbindInstance(uint32 mapid, bool unload)
{
    BoundInstancesMap::iterator itr = m_boundInstances.find(mapid);
    if (itr != m_boundInstances.end())
    {
        if (!unload)
            CharacterDatabase.PExecute("DELETE FROM `group_instance` WHERE `leader_guid` = '%u' AND `instance` = '%u'",
                                       GetLeaderGuid().GetCounter(), itr->second.state->GetInstanceId());
        itr->second.state->RemoveGroup(this);               // save can become invalid
        m_boundInstances.erase(itr);
    }
}

void Group::_homebindIfInstance(Player* player)
{
    if (player && !player->IsGameMaster())
    {
        Map* map = player->GetMap();
        if (map->IsDungeon())
        {
            // leaving the group in an instance, the homebind timer is started
            // unless the player is permanently saved to the instance
            InstancePlayerBind *playerBind = player->GetBoundInstance(map->GetId());
            if (!playerBind || !playerBind->perm)
                player->m_InstanceValid = false;
        }
    }
}

static void RewardGroupAtKill_helper(Player* pGroupGuy, Unit* pVictim, uint32 count, bool PvP, float group_rate, uint32 sum_level, bool is_dungeon, Unit* not_gray_member_with_max_level, Player* member_with_max_level, uint32 xp)
{
    // honor can be in PvP and !PvP (racial leader) cases (for alive)
    if (pGroupGuy->IsAlive())
    {
        pGroupGuy->RewardHonor(pVictim, count);

        // World of Warcraft Client Patch 1.10.0 (2006-03-28)
        // - Frostwolf and Stormpike faction will now be gained by killing
        //   players of the opposite faction.
        if (pGroupGuy->GetBattleGround() && (pGroupGuy->GetBattleGround()->GetTypeID() == BATTLEGROUND_AV) && (sWorld.GetWowPatch() >= WOW_PATCH_110))
        {
            if (Player* pPlayerVictim = ToPlayer(pVictim))
            {
                if ((pGroupGuy->GetTeam() == ALLIANCE) && (pPlayerVictim->GetTeam() == HORDE))
                {
                    FactionEntry const* factionEntry = sObjectMgr.GetFactionEntry(730);
                    if (factionEntry)
                        pGroupGuy->GetReputationMgr().ModifyReputation(factionEntry, 1);
                }
                if ((pGroupGuy->GetTeam() == HORDE) && (pPlayerVictim->GetTeam() == ALLIANCE))
                {
                    FactionEntry const* factionEntry = sObjectMgr.GetFactionEntry(729);
                    if (factionEntry)
                        pGroupGuy->GetReputationMgr().ModifyReputation(factionEntry, 1);
                }
            }
        }
    }

    // xp and reputation only in !PvP case
    if (!PvP)
    {
        float rate = group_rate * float(pGroupGuy->GetLevel()) / sum_level;

        // if is in dungeon then all receive full reputation at kill
        // rewarded any alive/dead/near_corpse group member
        pGroupGuy->RewardReputation(pVictim, 1.0f);

        // XP updated only for alive group member
        if (pGroupGuy->IsAlive() && not_gray_member_with_max_level)
        {
            uint32 itr_xp = (member_with_max_level == not_gray_member_with_max_level) ? uint32(xp * rate) : uint32((xp * rate / 2) + 1);
            if (pGroupGuy->GetLevel() <= not_gray_member_with_max_level->GetLevel())
                pGroupGuy->GiveXP(itr_xp, pVictim);
            if (Pet* pet = pGroupGuy->GetPet())
                if (pet->GetLevel() <= not_gray_member_with_max_level->GetLevel())
                    pet->GivePetXP(itr_xp);
        }

        // quest objectives updated only for alive group member or dead but with not released body
        if (pGroupGuy->IsAlive() || !pGroupGuy->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
        {
            // normal creature (not pet/etc) can be only in !PvP case
            if (pVictim->GetTypeId() == TYPEID_UNIT)
                pGroupGuy->KilledMonster(((Creature*)pVictim)->GetCreatureInfo(), pVictim->GetObjectGuid());
        }
    }
}

/** Provide rewards to group members at unit kill
 *
 * @param pVictim       Killed unit
 * @param pPlayerTap    Player who tap unit if online, it can be group member or can be not if leaved after tap but before kill target
 *
 * Rewards received by group members and pPlayerTap
 */
void Group::RewardGroupAtKill(Unit* pVictim, Player* pPlayerTap)
{
    bool PvP = pVictim->IsCharmerOrOwnerPlayerOrPlayerItself();

    // prepare data for near group iteration (PvP and !PvP cases)
    uint32 xp = 0;

    uint32 count = 0;
    uint32 sum_level = 0;
    Player* member_with_max_level = nullptr;
    Unit* not_gray_member_with_max_level = nullptr;

    GetDataForXPAtKill(pVictim, count, sum_level, member_with_max_level, not_gray_member_with_max_level, pPlayerTap);

    if (member_with_max_level)
    {
        // not get Xp in PvP or no not gray players in group
        xp = (PvP || !not_gray_member_with_max_level) ? 0 : MaNGOS::XP::Gain(not_gray_member_with_max_level, static_cast<Creature*>(pVictim));

        // skip in check PvP case (for speed, not used)
        bool is_raid = PvP ? false : sMapStorage.LookupEntry<MapEntry>(pVictim->GetMapId())->IsRaid() && isRaidGroup();
        bool is_dungeon = PvP ? false : sMapStorage.LookupEntry<MapEntry>(pVictim->GetMapId())->IsDungeon();
        float group_rate = MaNGOS::XP::xp_in_group_rate(count, is_raid);

        for (GroupReference* itr = GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            Player* pGroupGuy = itr->getSource();
            if (!pGroupGuy || !pGroupGuy->IsInWorld())
                continue;

            // will proccessed later
            if (pGroupGuy == pPlayerTap)
                continue;

            if (!pGroupGuy->IsAtGroupRewardDistance(pVictim))
                continue;                               // member (alive or dead) or his corpse at req. distance

            RewardGroupAtKill_helper(pGroupGuy, pVictim, count, PvP, group_rate, sum_level, is_dungeon, not_gray_member_with_max_level, member_with_max_level, xp);
        }

        if (pPlayerTap)
        {
            // member (alive or dead) or his corpse at req. distance
            if (pPlayerTap->IsAtGroupRewardDistance(pVictim))
                RewardGroupAtKill_helper(pPlayerTap, pVictim, count, PvP, group_rate, sum_level, is_dungeon, not_gray_member_with_max_level, member_with_max_level, xp);
        }
    }
}

struct BroadcastGroupUpdateHelper
{
    explicit BroadcastGroupUpdateHelper(Unit* _source) : source(_source) {}
    void operator()(Unit* unit) const
    {
        if (unit->GetTypeId() == TYPEID_PLAYER)
            unit->ForceValuesUpdateAtIndex(PLAYER_FLAGS);
        unit->ForceValuesUpdateAtIndex(UNIT_FIELD_FACTIONTEMPLATE);
        // Visibilite des points de vie
        unit->ForceValuesUpdateAtIndex(UNIT_FIELD_HEALTH);
        unit->ForceValuesUpdateAtIndex(UNIT_FIELD_MAXHEALTH);
    }
    Unit* source;
};

// Nostalrius : RAID ally-horde
void Group::BroadcastGroupUpdate()
{
    for (const auto& itr : m_memberSlots)
    {
        Player* pp = sObjectMgr.GetPlayer(itr.guid);
        if (pp && pp->IsInWorld())
        {
            pp->ForceValuesUpdateAtIndex(PLAYER_FLAGS);
            pp->ForceValuesUpdateAtIndex(UNIT_FIELD_FACTIONTEMPLATE);
            pp->ForceValuesUpdateAtIndex(UNIT_FIELD_HEALTH);
            pp->ForceValuesUpdateAtIndex(UNIT_FIELD_MAXHEALTH);
            pp->CallForAllControlledUnits(BroadcastGroupUpdateHelper(pp), CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM | CONTROLLED_MINIPET | CONTROLLED_TOTEMS);
        }
    }
}

// notify group members which player is the allowed looter for the given creature
void Group::SendLooter(Creature* creature, Player* pLooter)
{
    ASSERT(creature);
    /*
        WorldPacket data(SMSG_LOOT_LIST, (8+8));
        data << uint64(creature->GetGUID());
        data << uint8(0); // unk1

        if (pLooter)
            data << pLooter->GetPackGUID();
        else
            data << uint8(0);

        BroadcastPacket(&data, false);
    */
}



// Retrieve the next Round-Roubin player for the group
//
// No update done if loot method is Master or FFA.
//
// If the RR player is not yet set for the group, the first group member becomes the round-robin player.
// If the RR player is set, the next player in group becomes the round-robin player.
//
// If ifneed is true,
//      the current RR player is checked to be near the looted object.
//      if yes, no update done.
//      if not, he loses his turn.
void Group::UpdateLooterGuid(WorldObject* pLootedObject, bool ifneed)
{
    switch (GetLootMethod())
    {
        case MASTER_LOOT:
        case FREE_FOR_ALL:
            return;
        default:
            // round robin style looting applies for all low
            // quality items in each loot method except free for all and master loot
            break;
    }

    ObjectGuid oldLooterGUID = GetLooterGuid();
    member_citerator guid_itr = _getMemberCSlot(oldLooterGUID);
    if (guid_itr != m_memberSlots.end())
    {
        if (ifneed)
        {
            // not update if only update if need and ok
            Player* looter = ObjectAccessor::FindPlayer(guid_itr->guid);
            //if (looter && looter->IsWithinDistInMap(pLootedObject, sWorld.getConfig(CONFIG_FLOAT_GROUP_XP_DISTANCE), false))
            if (looter && looter->IsWithinLootXPDist(pLootedObject))
                return;
        }
        ++guid_itr;
    }

    // search next after current
    Player* pNewLooter = nullptr;
    for (member_citerator itr = guid_itr; itr != m_memberSlots.end(); ++itr)
    {
        if (Player* player = ObjectAccessor::FindPlayer(itr->guid))
            //if (player->IsWithinDistInMap(pLootedObject, sWorld.getConfig(CONFIG_FLOAT_GROUP_XP_DISTANCE), false))
            if (player->IsWithinLootXPDist(pLootedObject))
            {
                pNewLooter = player;
                break;
            }
    }

    if (!pNewLooter)
    {
        // search from start
        for (member_citerator itr = m_memberSlots.begin(); itr != guid_itr; ++itr)
        {
            if (Player* player = ObjectAccessor::FindPlayer(itr->guid))
                //if (player->IsWithinDistInMap(pLootedObject, sWorld.getConfig(CONFIG_FLOAT_GROUP_XP_DISTANCE), false))
                if (player->IsWithinLootXPDist(pLootedObject))
                {
                    pNewLooter = player;
                    break;
                }
        }
    }

    if (pNewLooter)
    {
        if (oldLooterGUID != pNewLooter->GetObjectGuid())
        {
            SetLooterGuid(pNewLooter->GetObjectGuid());
            SendUpdate();
        }
    }
    else
    {
        SetLooterGuid(0);
        SendUpdate();
    }
}
