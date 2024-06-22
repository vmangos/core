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
#include "SharedDefines.h"
#include "Opcodes.h"
#include "Player.h"
#include "Group.h"
#include "BattleGroundMgr.h"
#include "BattleGroundAV.h"
#include "BattleGroundAB.h"
#include "BattleGroundWS.h"
#include "MapManager.h"
#include "Map.h"
#include "ObjectMgr.h"
#include "ProgressBar.h"
#include "Chat.h"
#include "World.h"
#include "WorldPacket.h"
#include "Language.h"
#include "GameEventMgr.h"
#include "Policies/SingletonImp.h"
#include <chrono>
#include <random>

INSTANTIATE_SINGLETON_1(BattleGroundMgr);

/*********************************************************/
/***            BATTLEGROUND QUEUE SYSTEM              ***/
/*********************************************************/

BattleGroundQueue::BattleGroundQueue()
{
    for (uint32 i = 0; i < BG_TEAMS_COUNT; ++i)
    {
        for (uint32 j = 0; j < MAX_BATTLEGROUND_BRACKETS; ++j)
        {
            m_sumOfWaitTimes[i][j] = 0;
            m_waitTimeLastPlayer[i][j] = 0;
            for (uint32 k = 0; k < COUNT_OF_PLAYERS_TO_AVERAGE_WAIT_TIME; ++k)
                m_waitTimes[i][j][k] = 0;
        }
    }
}

BattleGroundQueue::~BattleGroundQueue()
{
    m_queuedPlayers.clear();
    for (auto& group : m_queuedGroups)
    {
        for (uint32 j = 0; j < BG_QUEUE_GROUP_TYPES_COUNT; ++j)
        {
            for (GroupsQueueType::iterator itr = group[j].begin(); itr != group[j].end(); ++itr)
                delete(*itr);
            group[j].clear();
        }
    }
}

/*********************************************************/
/***      BATTLEGROUND QUEUE SELECTION POOLS           ***/
/*********************************************************/

// selection pool initialization, used to clean up from prev selection
void BattleGroundQueue::SelectionPool::Init()
{
    selectedGroups.clear();
    playerCount = 0;
}

// remove group info from selection pool
// returns true when we need to try to add new group to selection pool
// returns false when selection pool is ok or when we kicked smaller group than we need to kick
// sometimes it can be called on empty selection pool
bool BattleGroundQueue::SelectionPool::KickGroup(uint32 size)
{
    //find maxgroup or LAST group with size == size and kick it
    bool found = false;
    GroupsQueueType::iterator groupToKick = selectedGroups.begin();
    for (GroupsQueueType::iterator itr = groupToKick; itr != selectedGroups.end(); ++itr)
    {
        if (abs((int32)((*itr)->players.size() - size)) <= 1)
        {
            groupToKick = itr;
            found = true;
        }
        else if (!found && (*itr)->players.size() >= (*groupToKick)->players.size())
            groupToKick = itr;
    }
    //if pool is empty, do nothing
    if (GetPlayerCount())
    {
        //update player count
        GroupQueueInfo* ginfo = (*groupToKick);
        selectedGroups.erase(groupToKick);
        playerCount -= ginfo->players.size();
        //return false if we kicked smaller group or there are enough players in selection pool
        if (ginfo->players.size() <= size + 1)
            return false;
    }
    return true;
}

// add group to selection pool
// used when building selection pools
// returns true if we can invite more players, or when we added group to selection pool
// returns false when selection pool is full
bool BattleGroundQueue::SelectionPool::AddGroup(GroupQueueInfo* ginfo, uint32 desiredCount, uint32 bgInstanceId)
{
    //if group is larger than desired count - don't allow to add it to pool
    if (!ginfo->isInvitedToBgInstanceGuid &&
       (!ginfo->desiredInstanceId || ginfo->desiredInstanceId == bgInstanceId) &&
       (desiredCount >= playerCount + ginfo->players.size()))
    {
        selectedGroups.push_back(ginfo);
        // increase selected players count
        playerCount += ginfo->players.size();
        return true;
    }
    return playerCount < desiredCount;
}

/*********************************************************/
/***               BATTLEGROUND QUEUES                 ***/
/*********************************************************/

// add group or player (grp == nullptr) to bg queue with the given leader and bg specifications
GroupQueueInfo* BattleGroundQueue::AddGroup(Player* leader, Group* grp, BattleGroundTypeId bgTypeId, BattleGroundBracketId bracketId, bool isPremade, uint32 instanceId, std::vector<uint32>* excludedMembers)
{
    // create new ginfo
    GroupQueueInfo* ginfo = new GroupQueueInfo;
    ginfo->bgTypeId                  = bgTypeId;
    ginfo->isInvitedToBgInstanceGuid = 0;
    ginfo->joinTime                  = WorldTimer::getMSTime();
    ginfo->removeInviteTime          = 0;
    ginfo->groupTeam                 = leader->GetTeam();
    ginfo->desiredInstanceId         = instanceId;
    ginfo->players.clear();

    //compute index (if group is premade or joined a rated match) to queues
    uint32 index = 0;
    if (!isPremade)
        index += BG_TEAMS_COUNT;                            // BG_QUEUE_PREMADE_* -> BG_QUEUE_NORMAL_*

    if (ginfo->groupTeam == HORDE)
        index++;                                            // BG_QUEUE_*_ALLIANCE -> BG_QUEUE_*_HORDE

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Adding Group to BattleGroundQueue bgTypeId : %u, bracketId : %u, index : %u", bgTypeId, bracketId, index);

    //add players from group to ginfo
    {
        //ACE_Guard<ACE_Recursive_Thread_Mutex> guard(m_lock);
        if (grp)
        {
            uint32 const group_limit = sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_GROUP_LIMIT);
            for (GroupReference* itr = grp->GetFirstMember(); itr != nullptr; itr = itr->next())
            {
                Player* member = itr->getSource();
                if (!member)
                    continue;   // this should never happen
                
                if (excludedMembers && (std::find(excludedMembers->begin(), excludedMembers->end(), member->GetGUIDLow()) != excludedMembers->end()))
                    continue;

                if (grp->GetMembersCount() > group_limit) // queue players solo if group size is above limit set in config
                {
                    AddGroup(member, nullptr, bgTypeId, bracketId, false, instanceId, nullptr);
                    ChatHandler(member).PSendSysMessage("Group queue limit is set to %u. You have been queued solo.", group_limit);
                }
                else
                {
                    PlayerQueueInfo& pl_info = m_queuedPlayers[member->GetObjectGuid()];
                    pl_info.online = true;
                    pl_info.lastOnlineTime = 0;
                    pl_info.groupInfo = ginfo;
                    // add the pinfo to ginfo's list
                    ginfo->players[member->GetObjectGuid()] = &pl_info;
                    sLog.Out(LOG_BG, LOG_LVL_DETAIL, "%s:%u [%u:%s] tag BG=%u (groupLeader '%s')",
                        member->GetName(),
                        member->GetGUIDLow(), member->GetSession()->GetAccountId(), member->GetSession()->GetRemoteAddress().c_str(),
                        bgTypeId, leader->GetName());
                }
            }
        }
        else
        {
            PlayerQueueInfo& pl_info = m_queuedPlayers[leader->GetObjectGuid()];
            pl_info.online           = true;
            pl_info.lastOnlineTime   = 0;
            pl_info.groupInfo        = ginfo;
            ginfo->players[leader->GetObjectGuid()]  = &pl_info;
            sLog.Out(LOG_BG, LOG_LVL_DETAIL, "%s:%u [%u:%s] tag BG=%u",
                     leader->GetName(),
                     leader->GetGUIDLow(), leader->GetSession()->GetAccountId(), leader->GetSession()->GetRemoteAddress().c_str(),
                     bgTypeId);
        }

        //add groupInfo to m_queuedGroups
        if (!ginfo->players.empty())
            m_queuedGroups[bracketId][index].push_back(ginfo);
        else
            return ginfo; // group size was above limit

        //announce to world, this code needs mutex
        if (!isPremade && sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_QUEUE_ANNOUNCER_JOIN))
        {
            BattleGround* bg = sBattleGroundMgr.GetBattleGroundTemplate(ginfo->bgTypeId);
            if (bg)
            {
                char const* bgName = bg->GetName();
                uint32 minPlayers = bg->GetMinPlayersPerTeam();
                uint32 qHorde = 0;
                uint32 qAlliance = 0;
                uint32 qMinLevel = leader->GetMinLevelForBattleGroundBracketId(bracketId, bgTypeId);
                uint32 qMaxLevel = leader->GetMaxLevelForBattleGroundBracketId(bracketId, bgTypeId);
                GroupsQueueType::const_iterator itr;
                for (itr = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].begin(); itr != m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].end(); ++itr)
                    if (!(*itr)->isInvitedToBgInstanceGuid)
                        qAlliance += (*itr)->players.size();
                for (itr = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].begin(); itr != m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].end(); ++itr)
                    if (!(*itr)->isInvitedToBgInstanceGuid)
                        qHorde += (*itr)->players.size();

                // Show queue status to player only (when joining queue)
                if (sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_QUEUE_ANNOUNCER_JOIN) == 1)
                {
                    ChatHandler(leader).PSendSysMessage(LANG_BG_QUEUE_ANNOUNCE_SELF, bgName, qMinLevel, qMaxLevel - 1,
                                                        qAlliance, (minPlayers > qAlliance) ? minPlayers - qAlliance : (uint32)0, qHorde, (minPlayers > qHorde) ? minPlayers - qHorde : (uint32)0);
                }
                // System message
                else
                {
                    sWorld.SendWorldText(LANG_BG_QUEUE_ANNOUNCE_WORLD, bgName, qMinLevel, qMaxLevel - 1,
                                         qAlliance, (minPlayers > qAlliance) ? minPlayers - qAlliance : (uint32)0, qHorde, (minPlayers > qHorde) ? minPlayers - qHorde : (uint32)0);
                }
            }
        }
        //release mutex
    }

    return ginfo;
}

void BattleGroundQueue::PlayerInvitedToBgUpdateAverageWaitTime(GroupQueueInfo* ginfo, BattleGroundBracketId bracketId)
{
    uint32 timeInQueue = WorldTimer::getMSTimeDiff(ginfo->joinTime, WorldTimer::getMSTime());
    uint8 teamIndex = BG_TEAM_ALLIANCE;                    //default set to BG_TEAM_ALLIANCE - or non rated arenas!

    if (ginfo->groupTeam == HORDE)
        teamIndex = BG_TEAM_HORDE;

    //store pointer to arrayindex of player that was added first
    uint32* lastPlayerAddedPointer = &(m_waitTimeLastPlayer[teamIndex][bracketId]);
    //remove his time from sum
    m_sumOfWaitTimes[teamIndex][bracketId] -= m_waitTimes[teamIndex][bracketId][(*lastPlayerAddedPointer)];
    //set average time to new
    m_waitTimes[teamIndex][bracketId][(*lastPlayerAddedPointer)] = timeInQueue;
    //add new time to sum
    m_sumOfWaitTimes[teamIndex][bracketId] += timeInQueue;
    //set index of last player added to next one
    (*lastPlayerAddedPointer)++;
    (*lastPlayerAddedPointer) %= COUNT_OF_PLAYERS_TO_AVERAGE_WAIT_TIME;
}

uint32 BattleGroundQueue::GetAverageQueueWaitTime(GroupQueueInfo* ginfo, BattleGroundBracketId bracketId)
{
    uint8 teamIndex = BG_TEAM_ALLIANCE;                    //default set to BG_TEAM_ALLIANCE - or non rated arenas!
    if (ginfo->groupTeam == HORDE)
        teamIndex = BG_TEAM_HORDE;
    //check if there is enought values(we always add values > 0)
    if (m_waitTimes[teamIndex][bracketId][COUNT_OF_PLAYERS_TO_AVERAGE_WAIT_TIME - 1])
        return (m_sumOfWaitTimes[teamIndex][bracketId] / COUNT_OF_PLAYERS_TO_AVERAGE_WAIT_TIME);
    else
        //if there aren't enough values return 0 - not available
        return 0;
}

// remove player from queue and from group info, if group info is empty then remove it too
void BattleGroundQueue::RemovePlayer(ObjectGuid guid, bool decreaseInvitedCount)
{
    //Player* player = sObjectMgr.GetPlayer(guid);
    //ACE_Guard<ACE_Recursive_Thread_Mutex> guard(m_lock);

    int32 bracketId = -1;                                     // signed for proper for-loop finish
    QueuedPlayersMap::iterator itr;

    //remove player from map, if he's there
    itr = m_queuedPlayers.find(guid);
    if (itr == m_queuedPlayers.end())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGroundQueue: couldn't find for remove: %s", guid.GetString().c_str());
        return;
    }

    GroupQueueInfo* group = itr->second.groupInfo;
    GroupsQueueType::iterator groupItr, groupItrTmp;
    // mostly people with the highest levels are in battlegrounds, thats why
    // we count from MAX_BATTLEGROUND_QUEUES - 1 to 0
    // variable index removes useless searching in other team's queue
    uint32 index = BattleGround::GetTeamIndexByTeamId(group->groupTeam);

    for (int32 bracket_id_tmp = MAX_BATTLEGROUND_BRACKETS - 1; bracket_id_tmp >= 0 && bracketId == -1; --bracket_id_tmp)
    {
        //we must check premade and normal team's queue - because when players from premade are joining bg,
        //they leave groupinfo so we can't use its players size to find out index
        for (uint32 j = index; j < BG_QUEUE_GROUP_TYPES_COUNT; j += BG_QUEUE_NORMAL_ALLIANCE)
        {
            for (groupItrTmp = m_queuedGroups[bracket_id_tmp][j].begin(); groupItrTmp != m_queuedGroups[bracket_id_tmp][j].end(); ++groupItrTmp)
            {
                if ((*groupItrTmp) == group)
                {
                    bracketId = bracket_id_tmp;
                    groupItr = groupItrTmp;
                    //we must store index to be able to erase iterator
                    index = j;
                    break;
                }
            }
        }
    }
    //player can't be in queue without group, but just in case
    if (bracketId == -1)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGroundQueue: ERROR Cannot find groupinfo for %s", guid.GetString().c_str());
        return;
    }
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "BattleGroundQueue: Removing %s, from bracketId %u", guid.GetString().c_str(), (uint32)bracketId);

    // ALL variables are correctly set
    // We can ignore leveling up in queue - it should not cause crash
    // remove player from group
    // if only one player there, remove group

    // remove player queue info from group queue info
    GroupQueueInfoPlayers::iterator pitr = group->players.find(guid);
    if (pitr != group->players.end())
        group->players.erase(pitr);

    // if invited to bg, and should decrease invited count, then do it
    if (decreaseInvitedCount && group->isInvitedToBgInstanceGuid)
    {
        BattleGround* bg = sBattleGroundMgr.GetBattleGround(group->isInvitedToBgInstanceGuid, group->bgTypeId);
        if (bg)
            bg->DecreaseInvitedCount(group->groupTeam);
    }

    // remove player queue info
    m_queuedPlayers.erase(itr);

    // remove group queue info if needed
    if (group->players.empty())
    {
        m_queuedGroups[bracketId][index].erase(groupItr);
        delete group;
    }
}

//returns true when player playerGuid is in queue and is invited to bgInstanceGuid
bool BattleGroundQueue::IsPlayerInvited(ObjectGuid playerGuid, uint32 const bgInstanceGuid, uint32 const removeTime)
{
    //ACE_Guard<ACE_Recursive_Thread_Mutex> g(m_lock);
    QueuedPlayersMap::const_iterator qItr = m_queuedPlayers.find(playerGuid);
    return (qItr != m_queuedPlayers.end()
            && qItr->second.groupInfo->isInvitedToBgInstanceGuid == bgInstanceGuid
            && qItr->second.groupInfo->removeInviteTime == removeTime);
}

bool BattleGroundQueue::GetPlayerGroupInfoData(ObjectGuid guid, GroupQueueInfo* ginfo)
{
    //ACE_Guard<ACE_Recursive_Thread_Mutex> g(m_lock);
    QueuedPlayersMap::const_iterator qItr = m_queuedPlayers.find(guid);
    if (qItr == m_queuedPlayers.end())
        return false;
    *ginfo = *(qItr->second.groupInfo);
    return true;
}

bool BattleGroundQueue::InviteGroupToBG(GroupQueueInfo* ginfo, BattleGround* bg, Team side)
{
    // set side if needed
    if (side)
        ginfo->groupTeam = side;

    if (!ginfo->isInvitedToBgInstanceGuid)
    {
        // not yet invited
        // set invitation
        ginfo->isInvitedToBgInstanceGuid = bg->GetInstanceID();
        BattleGroundTypeId bgTypeId = bg->GetTypeID();
        BattleGroundQueueTypeId bgQueueTypeId = BattleGroundMgr::BgQueueTypeId(bgTypeId);
        BattleGroundBracketId bracketId = bg->GetBracketId();

        ginfo->removeInviteTime = WorldTimer::getMSTime() + INVITE_ACCEPT_WAIT_TIME;

        // loop through the players
        for (GroupQueueInfoPlayers::iterator itr = ginfo->players.begin(); itr != ginfo->players.end(); ++itr)
        {
            // set invited player counters
            bg->IncreaseInvitedCount(ginfo->groupTeam);

            // get the player
            Player* player = ObjectAccessor::FindPlayerNotInWorld(itr->first);
            // if offline, skip him
            if (!player)
                continue;

            // invite the player
            PlayerInvitedToBgUpdateAverageWaitTime(ginfo, bracketId);
            //sBattleGroundMgr.InvitePlayer(player, bg, ginfo->Team);

            player->SetInviteForBattleGroundQueueType(bgQueueTypeId, ginfo->isInvitedToBgInstanceGuid);

            // create remind invite events
            BgQueueInviteEvent* inviteEvent = new BgQueueInviteEvent(player->GetObjectGuid(), ginfo->isInvitedToBgInstanceGuid, bgTypeId, ginfo->removeInviteTime);
            player->m_Events.AddEvent(inviteEvent, player->m_Events.CalculateTime(INVITATION_REMIND_TIME));
            // create automatic remove events
            BGQueueRemoveEvent* removeEvent = new BGQueueRemoveEvent(player->GetObjectGuid(), ginfo->isInvitedToBgInstanceGuid, bgTypeId, bgQueueTypeId, ginfo->removeInviteTime);
            player->m_Events.AddEvent(removeEvent, player->m_Events.CalculateTime(INVITE_ACCEPT_WAIT_TIME));

            WorldPacket data;

            uint32 queueSlot = player->GetBattleGroundQueueIndex(bgQueueTypeId);

            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Battleground: invited %s to BG instance %u queueindex %u bgtype %u, I can't help it if they don't press the enter battle button.",
                      player->GetGuidStr().c_str(), bg->GetInstanceID(), queueSlot, bg->GetTypeID());

            // send status packet
            sBattleGroundMgr.BuildBattleGroundStatusPacket(&data, bg, queueSlot, STATUS_WAIT_JOIN, INVITE_ACCEPT_WAIT_TIME, 0);
            player->GetSession()->SendPacket(&data);
        }
        return true;
    }

    return false;
}

/*
This function is inviting players to already running battlegrounds
Invitation type is based on config file
large groups are disadvantageous, because they will be kicked first if invitation type = 1
*/
void BattleGroundQueue::FillPlayersToBg(BattleGround* bg, BattleGroundBracketId bracketId)
{
    int32 hordeFree = bg->GetFreeSlotsForTeam(HORDE);
    int32 allyFree   = bg->GetFreeSlotsForTeam(ALLIANCE);

    //iterator for iterating through bg queue
    GroupsQueueType::const_iterator allyItr = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].begin();
    //count of groups in queue - used to stop cycles
    uint32 aliCount = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].size();
    //index to queue which group is current
    uint32 aliIndex = 0;
    for (; aliIndex < aliCount && m_selectionPools[BG_TEAM_ALLIANCE].AddGroup((*allyItr), allyFree, bg->GetClientInstanceID()); aliIndex++)
        ++allyItr;
    //the same thing for horde
    GroupsQueueType::const_iterator hordeItr = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].begin();
    uint32 hordeCount = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].size();
    uint32 hordeIndex = 0;
    for (; hordeIndex < hordeCount && m_selectionPools[BG_TEAM_HORDE].AddGroup((*hordeItr), hordeFree, bg->GetClientInstanceID()); hordeIndex++)
        ++hordeItr;

    //if ofc like BG queue invitation is set in config, then we are happy
    if (sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_INVITATION_TYPE) == 0)
        return;

    /*
    if we reached this code, then we have to solve NP - complete problem called Subset sum problem
    So one solution is to check all possible invitation subgroups, or we can use these conditions:
    1. Last time when BattleGroundQueue::Update was executed we invited all possible players - so there is only small possibility
        that we will invite now whole queue, because only 1 change has been made to queues from the last BattleGroundQueue::Update call
    2. Other thing we should consider is group order in queue
    */

    // At first we need to compare free space in bg and our selection pool
    int32 diffAli   = allyFree   - int32(m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount());
    int32 diffHorde = hordeFree - int32(m_selectionPools[BG_TEAM_HORDE].GetPlayerCount());
    while (abs(diffAli - diffHorde) > 1 && (m_selectionPools[BG_TEAM_HORDE].GetPlayerCount() > 0 || m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount() > 0))
    {
        //each cycle execution we need to kick at least 1 group
        if (diffAli < diffHorde)
        {
            //kick alliance group, add to pool new group if needed
            if (m_selectionPools[BG_TEAM_ALLIANCE].KickGroup(diffHorde - diffAli))
            {
                for (; aliIndex < aliCount && m_selectionPools[BG_TEAM_ALLIANCE].AddGroup((*allyItr), (allyFree >= diffHorde) ? allyFree - diffHorde : 0, bg->GetClientInstanceID()); aliIndex++)
                    ++allyItr;
            }
            //if ali selection is already empty, then kick horde group, but if there are less horde than ali in bg - break;
            if (!m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount())
            {
                if (allyFree <= diffHorde + 1)
                    break;
                m_selectionPools[BG_TEAM_HORDE].KickGroup(diffHorde - diffAli);
            }
        }
        else
        {
            //kick horde group, add to pool new group if needed
            if (m_selectionPools[BG_TEAM_HORDE].KickGroup(diffAli - diffHorde))
            {
                for (; hordeIndex < hordeCount && m_selectionPools[BG_TEAM_HORDE].AddGroup((*hordeItr), (hordeFree >= diffAli) ? hordeFree - diffAli : 0, bg->GetClientInstanceID()); hordeIndex++)
                    ++hordeItr;
            }
            if (!m_selectionPools[BG_TEAM_HORDE].GetPlayerCount())
            {
                if (hordeFree <= diffAli + 1)
                    break;
                m_selectionPools[BG_TEAM_ALLIANCE].KickGroup(diffAli - diffHorde);
            }
        }
        //count diffs after small update
        diffAli   = allyFree  - int32(m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount());
        diffHorde = hordeFree - int32(m_selectionPools[BG_TEAM_HORDE].GetPlayerCount());
    }
}

// this method checks if premade versus premade battleground is possible
// then after 30 mins (default) in queue it moves premade group to normal queue
// it tries to invite as much players as it can - to maxPlayersPerTeam, because premade groups have more than minPlayersPerTeam players
bool BattleGroundQueue::CheckPremadeMatch(BattleGroundBracketId bracketId, uint32 minPlayersPerTeam, uint32 maxPlayersPerTeam)
{
    GroupsQueueType::const_iterator itrTeam[BG_TEAMS_COUNT];
    for (uint32 queueType = 0; queueType < 2; ++queueType)
        for (uint32 i = 0; i < BG_TEAMS_COUNT; i++)
        {
            itrTeam[i] = m_queuedGroups[bracketId][2*queueType + i].begin();
            for (; itrTeam[i] != m_queuedGroups[bracketId][2*queueType + i].end(); ++(itrTeam[i]))
            {
                if (!(*(itrTeam[i]))->isInvitedToBgInstanceGuid && (*(itrTeam[i]))->players.size() >= sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_PREMADE_QUEUE_GROUP_MIN_SIZE))
                {
                    m_selectionPools[i].AddGroup(*(itrTeam[i]), maxPlayersPerTeam, 0);
                    if (m_selectionPools[i].GetPlayerCount() >= minPlayersPerTeam)
                        break;
                }
            }
        }
    //try to invite same number of players - this cycle may cause longer wait time even if there are enough players in queue, but we want ballanced bg
    uint32 j = BG_TEAM_ALLIANCE;
    if (m_selectionPools[BG_TEAM_HORDE].GetPlayerCount() < m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount())
        j = BG_TEAM_HORDE;

    //allow 1v0 if debug bg
    if (sBattleGroundMgr.isTesting() && (m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount() || m_selectionPools[BG_TEAM_HORDE].GetPlayerCount()))
        return true;

    //return true if there are enough players in selection pools - enable to work .debug bg command correctly
    if (m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount() >= minPlayersPerTeam && m_selectionPools[BG_TEAM_HORDE].GetPlayerCount() >= minPlayersPerTeam)
        return true;

    // now check if we can move group from Premade queue to normal queue (timer has expired) or group size lowered!!
    // this could be 2 cycles but i'm checking only first team in queue - it can cause problem -
    // if first is invited to BG and seconds timer expired, but we can ignore it, because players have only 80 seconds to click to enter bg
    // and when they click or after 80 seconds the queue info is removed from queue
    uint32 time_before = WorldTimer::getMSTime() - sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_PREMADE_GROUP_WAIT_FOR_MATCH);
    for (uint32 i = 0; i < BG_TEAMS_COUNT; i++)
    {
        if (!m_queuedGroups[bracketId][BG_QUEUE_PREMADE_ALLIANCE + i].empty())
        {
            GroupsQueueType::iterator itr = m_queuedGroups[bracketId][BG_QUEUE_PREMADE_ALLIANCE + i].begin();
            if (!(*itr)->isInvitedToBgInstanceGuid && ((*itr)->joinTime < time_before || (*itr)->players.size() < minPlayersPerTeam))
            {
                //we must insert group to normal queue and erase pointer from premade queue
                m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE + i].push_back((*itr));
                m_queuedGroups[bracketId][BG_QUEUE_PREMADE_ALLIANCE + i].erase(itr);
            }
        }
    }
    //selection pools are not set
    return false;
}

// this method tries to create battleground with minPlayersPerTeam against minPlayersPerTeam
bool BattleGroundQueue::CheckNormalMatch(BattleGroundBracketId bracketId, uint32 minPlayers, uint32 maxPlayers)
{
    GroupsQueueType::const_iterator itrTeam[BG_TEAMS_COUNT];
    for (uint32 i = 0; i < BG_TEAMS_COUNT; i++)
    {
        itrTeam[i] = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE + i].begin();
        for (; itrTeam[i] != m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE + i].end(); ++(itrTeam[i]))
        {
            if (!(*(itrTeam[i]))->isInvitedToBgInstanceGuid)
            {
                m_selectionPools[i].AddGroup(*(itrTeam[i]), maxPlayers, 0);
                if (m_selectionPools[i].GetPlayerCount() >= minPlayers)
                    break;
            }
        }
    }
    //try to invite same number of players - this cycle may cause longer wait time even if there are enough players in queue, but we want ballanced bg
    uint32 j = BG_TEAM_ALLIANCE;
    if (m_selectionPools[BG_TEAM_HORDE].GetPlayerCount() < m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount())
        j = BG_TEAM_HORDE;
    if ((sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_INVITATION_TYPE) != 0)
            && m_selectionPools[BG_TEAM_HORDE].GetPlayerCount() >= minPlayers && m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount() >= minPlayers)
    {
        //we will try to invite more groups to team with less players indexed by j
        ++(itrTeam[j]);                                         //this will not cause a crash, because for cycle above reached break;
        for (; itrTeam[j] != m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE + j].end(); ++(itrTeam[j]))
        {
            if (!(*(itrTeam[j]))->isInvitedToBgInstanceGuid)
                if (!m_selectionPools[j].AddGroup(*(itrTeam[j]), m_selectionPools[(j + 1) % BG_TEAMS_COUNT].GetPlayerCount(), 0))
                    break;
        }
        // do not allow to start bg with more than 2 players more on 1 faction
        if (abs((int32)(m_selectionPools[BG_TEAM_HORDE].GetPlayerCount() - m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount())) > 2)
            return false;
    }
    //allow 1v0 if debug bg
    if (sBattleGroundMgr.isTesting() && (m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount() || m_selectionPools[BG_TEAM_HORDE].GetPlayerCount()))
        return true;

    //return true if there are enough players in selection pools - enable to work .debug bg command correctly
    return m_selectionPools[BG_TEAM_ALLIANCE].GetPlayerCount() >= minPlayers && m_selectionPools[BG_TEAM_HORDE].GetPlayerCount() >= minPlayers;
}

/*
this method is called when group is inserted, or player / group is removed from BG Queue - there is only one player's status changed, so we don't use while(true) cycles to invite whole queue
it must be called after fully adding the members of a group to ensure group joining
should be called from BattleGround::RemovePlayer function in some cases
*/
void BattleGroundQueue::Update(BattleGroundTypeId bgTypeId, BattleGroundBracketId bracketId)
{
    //ACE_Guard<ACE_Recursive_Thread_Mutex> guard(m_lock);

    // First, remove players who shouldn't be in queue anymore
    QueuedPlayersMap::iterator itrOffline = m_queuedPlayers.begin();
    while (itrOffline != m_queuedPlayers.end())
    {
        // remove offline players
        if (!itrOffline->second.online && WorldTimer::getMSTimeDiffToNow(itrOffline->second.lastOnlineTime) > OFFLINE_BG_QUEUE_TIME)
        {
            RemovePlayer(itrOffline->first, true);
            itrOffline = m_queuedPlayers.begin();
            continue;
        }

        // remove players who are in queue for bg that has ended
        GroupQueueInfo* group = itrOffline->second.groupInfo;
        if (group->isInvitedToBgInstanceGuid)
        {
            BattleGround* bg;
            if ((bg = sBattleGroundMgr.GetBattleGround(group->isInvitedToBgInstanceGuid, group->bgTypeId)) && bg->GetStatus() == STATUS_WAIT_LEAVE)
            {
                if (itrOffline->second.online)
                {
                    if (Player* player = ObjectAccessor::FindPlayerNotInWorld(itrOffline->first))
                    {
                        BattleGroundQueueTypeId queueTypeId = BattleGroundMgr::BgQueueTypeId(group->bgTypeId);
                        uint32 queueSlot = player->GetBattleGroundQueueIndex(queueTypeId);
                        if (queueSlot < PLAYER_MAX_BATTLEGROUND_QUEUES)
                        {
                            player->RemoveBattleGroundQueueId(queueTypeId);

                            WorldPacket data;
                            sBattleGroundMgr.BuildBattleGroundStatusPacket(&data, bg, queueSlot, STATUS_NONE, 0, 0);
                            player->GetSession()->SendPacket(&data);
                        }
                    }
                }

                RemovePlayer(itrOffline->first, true);
                itrOffline = m_queuedPlayers.begin();
                continue;
            }
        }

        ++itrOffline;
    }

    // if no players in queue - do nothing
    if (m_queuedGroups[bracketId][BG_QUEUE_PREMADE_ALLIANCE].empty() &&
            m_queuedGroups[bracketId][BG_QUEUE_PREMADE_HORDE].empty() &&
            m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].empty() &&
            m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].empty())
        return;

    if (sWorld.getConfig(CONFIG_BOOL_BATTLEGROUND_RANDOMIZE))
    {
        auto seed = std::chrono::system_clock::now().time_since_epoch().count();
        std::shuffle(m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].begin(),
            m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].end(),
            std::default_random_engine(seed));
        std::shuffle(m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].begin(),
            m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].end(),
            std::default_random_engine(seed));
    }

    // battleground with free slot for player should be always in the beginning of the queue
    // maybe it would be better to create bgfreeslotqueue for each bracketId
    BgFreeSlotQueueType::iterator itr, next;
    for (itr = sBattleGroundMgr.m_bgFreeSlotQueue[bgTypeId].begin(); itr != sBattleGroundMgr.m_bgFreeSlotQueue[bgTypeId].end(); itr = next)
    {
        next = itr;
        ++next;
        // battleground is running, so if:
        if ((*itr)->GetTypeID() == bgTypeId && (*itr)->GetBracketId() == bracketId &&
                (*itr)->GetStatus() > STATUS_WAIT_QUEUE && (*itr)->GetStatus() < STATUS_WAIT_LEAVE)
        {
            BattleGround* bg = *itr; //we have to store battleground pointer here, because when battleground is full, it is removed from free queue (not yet implemented!!)
            // and iterator is invalid

            // clear selection pools
            m_selectionPools[BG_TEAM_ALLIANCE].Init();
            m_selectionPools[BG_TEAM_HORDE].Init();

            // call a function that does the job for us
            FillPlayersToBg(bg, bracketId);

            // now everything is set, invite players
            for (const auto itr : m_selectionPools[BG_TEAM_ALLIANCE].selectedGroups)
                InviteGroupToBG(itr, bg, itr->groupTeam);
            for (const auto itr : m_selectionPools[BG_TEAM_HORDE].selectedGroups)
                InviteGroupToBG(itr, bg, itr->groupTeam);

            if (!bg->HasFreeSlots())
            {
                // remove BG from m_bgFreeSlotQueue
                bg->RemoveFromBGFreeSlotQueue();
            }
        }
    }

    // finished iterating through the bgs with free slots, maybe we need to create a new bg

    BattleGround*  bgTemplate = sBattleGroundMgr.GetBattleGroundTemplate(bgTypeId);
    if (!bgTemplate)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Battleground: Update: bg template not found for %u", bgTypeId);
        return;
    }
    // get the min. players per team, properly for larger arenas as well.
    uint32 minPlayersPerTeam = bgTemplate->GetMinPlayersPerTeam();
    uint32 maxPlayersPerTeam = bgTemplate->GetMaxPlayersPerTeam();

    int normalMatchesCreationAttempts = 1;
    // now check if there are in queues enough players to start new game of (normal battleground)
    if (bgTypeId == BATTLEGROUND_AV && sWorld.getConfig(CONFIG_UINT32_AV_MIN_PLAYERS_IN_QUEUE) && !sBattleGroundMgr.isTesting())
    {
        int minPlayersInQueue = sWorld.getConfig(CONFIG_UINT32_AV_MIN_PLAYERS_IN_QUEUE);
        int playersInQueuePerTeam[BG_TEAMS_COUNT] = {0};
        for (uint32 i = 0; i < BG_TEAMS_COUNT; i++)
        {
            GroupsQueueType::const_iterator itr = m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE + i].begin();
            for (; itr != m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE + i].end(); ++itr)
                if (!(*itr)->isInvitedToBgInstanceGuid)
                    playersInQueuePerTeam[i]++; // Only one player, because premades are not allowed in AV.
        }
        if (playersInQueuePerTeam[BG_TEAM_ALLIANCE] < minPlayersInQueue ||
                playersInQueuePerTeam[BG_TEAM_HORDE] < minPlayersInQueue)
            normalMatchesCreationAttempts = 0;
        else
        {
            // Now randomize
            auto seed = std::chrono::system_clock::now().time_since_epoch().count();
            std::shuffle(m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].begin(),
                m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].begin() + minPlayersInQueue,
                std::default_random_engine(seed));
            std::shuffle(m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].begin(),
                m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].begin() + minPlayersInQueue,
                std::default_random_engine(seed));
            sLog.Out(LOG_BG, LOG_LVL_DETAIL, "Alterac queue randomized (%u alliance vs %u horde)",
                m_queuedGroups[bracketId][BG_QUEUE_NORMAL_ALLIANCE].size(),
                m_queuedGroups[bracketId][BG_QUEUE_NORMAL_HORDE].size());
        }
    }
    if (bgTypeId == BATTLEGROUND_AV && sWorld.getConfig(CONFIG_UINT32_AV_INITIAL_MAX_PLAYERS) && !sBattleGroundMgr.isTesting() && normalMatchesCreationAttempts)
    {
        maxPlayersPerTeam = sWorld.getConfig(CONFIG_UINT32_AV_INITIAL_MAX_PLAYERS);
        if (maxPlayersPerTeam <= minPlayersPerTeam)
            maxPlayersPerTeam = minPlayersPerTeam;
        normalMatchesCreationAttempts = 2;
    }
    if (sBattleGroundMgr.isTesting())
        minPlayersPerTeam = 1;

    m_selectionPools[BG_TEAM_ALLIANCE].Init();
    m_selectionPools[BG_TEAM_HORDE].Init();

    uint32 qMinLevel = Player::GetMinLevelForBattleGroundBracketId(bracketId, bgTypeId);
    uint32 qMaxLevel = Player::GetMaxLevelForBattleGroundBracketId(bracketId, bgTypeId);
    {
        //check if there is premade against premade match
        if (CheckPremadeMatch(bracketId, minPlayersPerTeam, maxPlayersPerTeam))
        {
            //create new battleground
            BattleGround* bg2 = sBattleGroundMgr.CreateNewBattleGround(bgTypeId, bracketId);
            if (!bg2)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGroundQueue::Update - Cannot create battleground: %u", bgTypeId);
                return;
            }
            //invite those selection pools
            for (uint32 i = 0; i < BG_TEAMS_COUNT; i++)
                for (const auto itr : m_selectionPools[BG_TEAM_ALLIANCE + i].selectedGroups)
                    InviteGroupToBG(itr, bg2, itr->groupTeam);
            //start bg
            bg2->SetLevelRange(qMinLevel, qMaxLevel - 1);
            bg2->StartBattleGround();
        }
    }

    for (int attempt = 0; attempt < normalMatchesCreationAttempts; ++attempt)
    {
        m_selectionPools[BG_TEAM_ALLIANCE].Init();
        m_selectionPools[BG_TEAM_HORDE].Init();
        // if there are enough players in pools, start new battleground or non rated arena
        if (CheckNormalMatch(bracketId, minPlayersPerTeam, maxPlayersPerTeam))
        {
            // we successfully created a pool
            BattleGround* bg2 = sBattleGroundMgr.CreateNewBattleGround(bgTypeId, bracketId);
            if (!bg2)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGroundQueue::Update - Cannot create battleground: %u", bgTypeId);
                return;
            }

            // invite those selection pools
            for (uint32 i = 0; i < BG_TEAMS_COUNT; i++)
                for (const auto itr : m_selectionPools[BG_TEAM_ALLIANCE + i].selectedGroups)
                    InviteGroupToBG(itr, bg2, itr->groupTeam);

            // start bg
            bg2->SetLevelRange(qMinLevel, qMaxLevel - 1);
            bg2->StartBattleGround();
        }
    }
}

/*********************************************************/
/***            BATTLEGROUND QUEUE EVENTS              ***/
/*********************************************************/

bool BgQueueInviteEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    Player* player = ObjectAccessor::FindPlayerNotInWorld(m_playerGuid);
    // player logged off (we should do nothing, he is correctly removed from queue in another procedure)
    if (!player)
        return true;

    BattleGround* bg = sBattleGroundMgr.GetBattleGround(m_bgInstanceGuid, m_bgTypeId);
    //if battleground ended and its instance deleted - do nothing
    if (!bg)
        return true;

    BattleGroundQueueTypeId bgQueueTypeId = BattleGroundMgr::BgQueueTypeId(bg->GetTypeID());
    uint32 queueSlot = player->GetBattleGroundQueueIndex(bgQueueTypeId);
    if (queueSlot < PLAYER_MAX_BATTLEGROUND_QUEUES)         // player is in queue or in battleground
    {
        // check if player is invited to this bg
        BattleGroundQueue &bgQueue = sBattleGroundMgr.m_battleGroundQueues[bgQueueTypeId];
        if (bgQueue.IsPlayerInvited(m_playerGuid, m_bgInstanceGuid, m_removeTime))
        {
            WorldPacket data;
            //we must send remaining time in queue
            sBattleGroundMgr.BuildBattleGroundStatusPacket(&data, bg, queueSlot, STATUS_WAIT_JOIN, INVITE_ACCEPT_WAIT_TIME - INVITATION_REMIND_TIME, 0);
            player->GetSession()->SendPacket(&data);
        }
    }
    return true;                                            //event will be deleted
}

void BgQueueInviteEvent::Abort(uint64 /*e_time*/)
{
    //do nothing
}

/*
    this event has many possibilities when it is executed:
    1. player is in battleground ( he clicked enter on invitation window )
    2. player left battleground queue and he isn't there any more
    3. player left battleground queue and he joined it again and isInvitedToBgInstanceGuid = 0
    4. player left queue and he joined again and he has been invited to same battleground again -> we should not remove him from queue yet
    5. player is invited to bg and he didn't choose what to do and timer expired - only in this condition we should call queue::RemovePlayer
    we must remove player in the 5. case even if battleground object doesn't exist!
*/
bool BGQueueRemoveEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    Player* player = ObjectAccessor::FindPlayerNotInWorld(m_playerGuid);
    if (!player)
        // player logged off (we should do nothing, he is correctly removed from queue in another procedure)
        return true;

    BattleGround* bg = sBattleGroundMgr.GetBattleGround(m_bgInstanceGuid, m_bgTypeId);
    //battleground can be deleted already when we are removing queue info
    //bg pointer can be nullptr! so use it carefully!

    uint32 queueSlot = player->GetBattleGroundQueueIndex(m_bgQueueTypeId);
    if (queueSlot < PLAYER_MAX_BATTLEGROUND_QUEUES)         // player is in queue, or in Battleground
    {
        // check if player is in queue for this BG and if we are removing his invite event
        BattleGroundQueue &bgQueue = sBattleGroundMgr.m_battleGroundQueues[m_bgQueueTypeId];
        if (bgQueue.IsPlayerInvited(m_playerGuid, m_bgInstanceGuid, m_removeTime))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Battleground: removing player %u from bg queue for instance %u because of not pressing enter battle in time.", player->GetGUIDLow(), m_bgInstanceGuid);

            player->RemoveBattleGroundQueueId(m_bgQueueTypeId);
            bgQueue.RemovePlayer(m_playerGuid, true);
            //update queues if battleground isn't ended
            if (bg && bg->GetStatus() != STATUS_WAIT_LEAVE)
                sBattleGroundMgr.ScheduleQueueUpdate(m_bgQueueTypeId, m_bgTypeId, bg->GetBracketId());

            WorldPacket data;
            sBattleGroundMgr.BuildBattleGroundStatusPacket(&data, bg, queueSlot, STATUS_NONE, 0, 0);
            player->GetSession()->SendPacket(&data);
        }
    }

    //event will be deleted
    return true;
}

void BGQueueRemoveEvent::Abort(uint64 /*e_time*/)
{
    //do nothing
}

/*********************************************************/
/***            BATTLEGROUND MANAGER                   ***/
/*********************************************************/

BattleGroundMgr::BattleGroundMgr()
{
    for (uint32 i = BATTLEGROUND_TYPE_NONE; i < MAX_BATTLEGROUND_TYPE_ID; i++)
        m_battleGrounds[i].clear();
    m_testing = false;
}

BattleGroundMgr::~BattleGroundMgr()
{
    DeleteAllBattleGrounds();
}

void BattleGroundMgr::DeleteAllBattleGrounds()
{
    // will also delete template bgs:
    for (uint32 i = BATTLEGROUND_TYPE_NONE; i < MAX_BATTLEGROUND_TYPE_ID; ++i)
    {
        for (BattleGroundSet::iterator itr = m_battleGrounds[i].begin(); itr != m_battleGrounds[i].end();)
        {
            BattleGround* bg = itr->second;
            ++itr;                                          // step from invalidate iterator pos in result element remove in ~BattleGround call
            delete bg;
        }
    }
}

// used to update running battlegrounds, and delete finished ones
void BattleGroundMgr::Update(uint32 diff)
{
    // update scheduled queues
    if (!m_queueUpdateScheduler.empty())
    {
        std::vector<uint32> scheduled;
        {
            //create mutex
            //ACE_Guard<ACE_Thread_Mutex> guard(schedulerLock);
            //copy vector and clear the other
            scheduled = std::vector<uint32>(m_queueUpdateScheduler);
            m_queueUpdateScheduler.clear();
            //release lock
        }

        for (uint32 i : scheduled)
        {
            BattleGroundQueueTypeId bgQueueTypeId = BattleGroundQueueTypeId(i >> 16 & 255);
            BattleGroundTypeId bgTypeId = BattleGroundTypeId((i >> 8) & 255);
            BattleGroundBracketId bracketId = BattleGroundBracketId(i & 255);
            m_battleGroundQueues[bgQueueTypeId].Update(bgTypeId, bracketId);
        }
    }
}

void BattleGroundMgr::BuildBattleGroundStatusPacket(WorldPacket* data, BattleGround *bg, uint8 queueSlot, uint8 statusId, uint32 time1, uint32 time2)
{
    // we can be in 3 queues in same time...
    if (statusId == 0 || !bg)
    {
        data->Initialize(SMSG_BATTLEFIELD_STATUS, 4 * 2);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        *data << uint32(queueSlot);                         // queue id (0...2)
#endif
        *data << uint32(0);
        return;
    }

    data->Initialize(SMSG_BATTLEFIELD_STATUS, (4 + 1 + 1 + 4 + 2 + 4 + 1 + 4 + 4 + 4));
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    *data << uint32(queueSlot);                             // queue id (0...2) - player can be in 3 queues in time
#endif
    // uint64 in client
    *data << uint32(bg->GetMapId());
    *data << uint8(bg->GetBracketId());
    *data << uint32(bg->GetClientInstanceID());
    *data << uint32(statusId);
    switch (statusId)
    {
        case STATUS_WAIT_QUEUE:                             // status_in_queue
            *data << uint32(time1);                         // average wait time, milliseconds
            *data << uint32(time2);                         // time in queue, updated every minute!, milliseconds
            break;
        case STATUS_WAIT_JOIN:                              // status_invite
            *data << uint32(time1);                         // time to remove from queue, milliseconds
            break;
        case STATUS_IN_PROGRESS:                            // status_in_progress
            *data << uint32(time1);                         // time to bg auto leave, 0 at bg start, 120000 after bg end, milliseconds
            *data << uint32(time2);                         // time from bg start, milliseconds
            break;
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unknown BG status!");
            break;
    }
}

void BattleGroundMgr::BuildPvpLogDataPacket(WorldPacket* data, BattleGround *bg)
{
    data->Initialize(MSG_PVP_LOG_DATA, (1 + 4 + 40 * bg->GetPlayerScoresSize()));

    if (bg->GetStatus() != STATUS_WAIT_LEAVE)
    {
        *data << uint8(0);                                  // bg not ended
    }
    else
    {
        *data << uint8(1);                                  // bg ended
        *data << uint8(bg->GetWinner());                    // who wins
    }

    uint32 count = bg->GetPlayerScoresSize();
    if (count >= 80) // Client has a hard limit to 80. If we go beyond (but it should not happen ?!), WoW Error (happening !)
        count = 80;
    *data << (uint32)(count);

    for (BattleGround::BattleGroundScoreMap::const_iterator itr = bg->GetPlayerScoresBegin(); itr != bg->GetPlayerScoresEnd(); ++itr)
    {
        if (!count)
            break;

        --count;
        BattleGroundScore const* score = itr->second;

        *data << ObjectGuid(itr->first);

        Player* player = ObjectAccessor::FindPlayerNotInWorld(itr->first);

        *data << uint32(player ? player->GetHonorMgr().GetRank().rank : 4);
        *data << uint32(score->killingBlows);
        *data << uint32(score->honorableKills);
        *data << uint32(score->deaths);
        *data << uint32(score->bonusHonor);

        switch (bg->GetTypeID())                             // battleground specific things
        {
            case BATTLEGROUND_AV:
                *data << (uint32)0x00000007;                // count of next fields
                *data << (uint32)((BattleGroundAVScore*)score)->graveyardsAssaulted;  // Graveyards Assaulted
                *data << (uint32)((BattleGroundAVScore*)score)->graveyardsDefended;   // Graveyards Defended
                *data << (uint32)((BattleGroundAVScore*)score)->towersAssaulted;      // Towers Assaulted
                *data << (uint32)((BattleGroundAVScore*)score)->towersDefended;       // Towers Defended
                *data << (uint32)((BattleGroundAVScore*)score)->secondaryObjectives;  // Mines Taken
                *data << (uint32)((BattleGroundAVScore*)score)->lieutnantCount;       // Lieutnant kills
                *data << (uint32)((BattleGroundAVScore*)score)->secondaryNPC;         // Secondary unit summons
                break;
            case BATTLEGROUND_WS:
                *data << (uint32)0x00000002;                // count of next fields
                *data << (uint32)((BattleGroundWGScore*)score)->flagCaptures;         // Flag Captures
                *data << (uint32)((BattleGroundWGScore*)score)->flagReturns;          // Flag Returns
                break;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            case BATTLEGROUND_AB:
                *data << (uint32)0x00000002;                // count of next fields
                *data << (uint32)((BattleGroundABScore*)score)->basesAssaulted;       // Bases Asssulted
                *data << (uint32)((BattleGroundABScore*)score)->basesDefended;        // Bases Defended
                break;
#endif
            default:
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Unhandled MSG_PVP_LOG_DATA for BG id %u", bg->GetTypeID());
                *data << (uint32)0;
                break;
        }
    }
}

void BattleGroundMgr::BuildGroupJoinedBattlegroundPacket(WorldPacket* data, int32 status)
{
    data->Initialize(SMSG_GROUP_JOINED_BATTLEGROUND, 4);
    // for status, see enum BattleGroundGroupJoinStatus
    *data << int32(status);
}

void BattleGroundMgr::BuildUpdateWorldStatePacket(WorldPacket* data, uint32 field, uint32 value)
{
    data->Initialize(SMSG_UPDATE_WORLD_STATE, 4 + 4);
    WriteUpdateWorldStatePair(*data, field, value);
}

void BattleGroundMgr::BuildPlaySoundPacket(WorldPacket* data, uint32 soundid)
{
    data->Initialize(SMSG_PLAY_SOUND, 4);
    *data << uint32(soundid);
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
void BattleGroundMgr::BuildPlayerLeftBattleGroundPacket(WorldPacket* data, ObjectGuid guid)
{
    data->Initialize(SMSG_BATTLEGROUND_PLAYER_LEFT, 8);
    *data << ObjectGuid(guid);
}

void BattleGroundMgr::BuildPlayerJoinedBattleGroundPacket(WorldPacket* data, Player* player)
{
    data->Initialize(SMSG_BATTLEGROUND_PLAYER_JOINED, 8);
    *data << player->GetObjectGuid();
}
#endif

BattleGround* BattleGroundMgr::GetBattleGroundThroughClientInstance(uint32 instanceId, BattleGroundTypeId bgTypeId)
{
    //cause at HandleBattleGroundJoinOpcode the clients sends the instanceid he gets from
    //SMSG_BATTLEFIELD_LIST we need to find the battleground with this clientinstance-id
    BattleGround* bg = GetBattleGroundTemplate(bgTypeId);
    if (!bg)
        return nullptr;

    for (const auto& itr : m_battleGrounds[bgTypeId])
    {
        if (itr.second->GetClientInstanceID() == instanceId)
            return itr.second;
    }
    return nullptr;
}

BattleGround* BattleGroundMgr::GetBattleGround(uint32 instanceId, BattleGroundTypeId bgTypeId)
{
    //search if needed
    BattleGroundSet::iterator itr;
    if (bgTypeId == BATTLEGROUND_TYPE_NONE)
    {
        for (uint32 i = BATTLEGROUND_AV; i < MAX_BATTLEGROUND_TYPE_ID; i++)
        {
            itr = m_battleGrounds[i].find(instanceId);
            if (itr != m_battleGrounds[i].end())
                return itr->second;
        }
        return nullptr;
    }
    itr = m_battleGrounds[bgTypeId].find(instanceId);
    return ((itr != m_battleGrounds[bgTypeId].end()) ? itr->second : nullptr);
}

BattleGround* BattleGroundMgr::GetBattleGroundTemplate(BattleGroundTypeId bgTypeId)
{
    //map is sorted and we can be sure that lowest instance id has only BG template
    return m_battleGrounds[bgTypeId].empty() ? nullptr : m_battleGrounds[bgTypeId].begin()->second;
}

uint32 BattleGroundMgr::CreateClientVisibleInstanceId(BattleGroundTypeId bgTypeId, BattleGroundBracketId bracketId)
{
    // here, we create an instanceid, which is just for
    // displaying this to the client and without any other use.
    // the client-instanceIds are unique for each battleground-type
    // the instance-id just needs to be as low as possible, beginning with 1
    // the following works, because std::set is default ordered with "<"
    // the optimization would be to use as bitmask std::vector<uint32> - but that would only make code unreadable
    uint32 lastId = 1;
    ClientBattleGroundIdSet& ids = m_clientBattleGroundIds[bgTypeId][bracketId];
    for (auto id : ids)
    {
        if (lastId == id)
            lastId++;
        else
            break;
    }
    ids.insert(lastId);
    return lastId;
}

// create a new battleground that will really be used to play
BattleGround* BattleGroundMgr::CreateNewBattleGround(BattleGroundTypeId bgTypeId, BattleGroundBracketId bracketId)
{
    // get the template BG
    BattleGround *bgTemplate = GetBattleGroundTemplate(bgTypeId);
    if (!bgTemplate)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGround: CreateNewBattleGround - bg template not found for %u", bgTypeId);
        return nullptr;
    }

    BattleGround *bg = nullptr;
    // create a copy of the BG template
    switch (bgTypeId)
    {
        case BATTLEGROUND_AV:
            bg = new BattleGroundAV(*(BattleGroundAV*)bgTemplate);
            break;
        case BATTLEGROUND_WS:
            bg = new BattleGroundWS(*(BattleGroundWS*)bgTemplate);
            break;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        case BATTLEGROUND_AB:
            bg = new BattleGroundAB(*(BattleGroundAB*)bgTemplate);
            break;
#endif
        default:
            //error, but it is handled few lines above
            return 0;
    }

    bg->Reset();
    bg->SetClientInstanceID(CreateClientVisibleInstanceId(bgTypeId, bracketId));

    // start the joining of the bg
    bg->SetStatus(STATUS_WAIT_JOIN);
    bg->SetBracketId(bracketId);

    // will also set m_bgMap, instanceid
    sMapMgr.CreateBgMap(bg->GetMapId(), bg);
    return bg;
}

// used to create the BG templates
uint32 BattleGroundMgr::CreateBattleGround(BattleGroundTypeId bgTypeId, uint32 minPlayersPerTeam, uint32 maxPlayersPerTeam, uint32 levelMin, uint32 levelMax, uint32 allianceWinSpell, uint32 allianceLoseSpell, uint32 hordeWinSpell, uint32 hordeLoseSpell, char const* battleGroundName, uint32 mapID, float team1StartLocX, float team1StartLocY, float team1StartLocZ, float team1StartLocO, float team2StartLocX, float team2StartLocY, float team2StartLocZ, float team2StartLocO, uint32 playerSkinReflootId)
{
    // Create the BG
    BattleGround *bg = nullptr;
    switch (bgTypeId)
    {
        case BATTLEGROUND_AV:
            bg = new BattleGroundAV;
            break;
        case BATTLEGROUND_WS:
            bg = new BattleGroundWS;
            break;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        case BATTLEGROUND_AB:
            bg = new BattleGroundAB;
            break;
#endif
        default:
            bg = new BattleGround;
            break;                           // placeholder for non implemented BG
    }

    bg->SetMapId(mapID);
    bg->SetTypeID(bgTypeId);
    bg->SetMinPlayersPerTeam(minPlayersPerTeam);
    bg->SetMaxPlayersPerTeam(maxPlayersPerTeam);
    bg->SetMinPlayers(minPlayersPerTeam * 2);
    bg->SetMaxPlayers(maxPlayersPerTeam * 2);
    bg->SetAllianceWinSpell(allianceWinSpell);
    bg->SetAllianceLoseSpell(allianceLoseSpell);
    bg->SetHordeWinSpell(hordeWinSpell);
    bg->SetHordeLoseSpell(hordeLoseSpell);
    bg->SetName(battleGroundName);
    bg->SetTeamStartLoc(ALLIANCE, team1StartLocX, team1StartLocY, team1StartLocZ, team1StartLocO);
    bg->SetTeamStartLoc(HORDE,    team2StartLocX, team2StartLocY, team2StartLocZ, team2StartLocO);
    bg->SetLevelRange(levelMin, levelMax);
    bg->SetPlayerSkinRefLootId(playerSkinReflootId);

    // add bg to update list
    AddBattleGround(bg->GetInstanceID(), bg->GetTypeID(), bg);

    // return some not-null value, bgTypeId is good enough for me
    return bgTypeId;
}

void BattleGroundMgr::CreateInitialBattleGrounds()
{
    uint32 count = 0;

    //                                                                0     1                       2                       3            4            5                     6                      7                  8                   9                          10                      11
    std::unique_ptr<QueryResult> result(WorldDatabase.PQuery("SELECT `id`, `min_players_per_team`, `max_players_per_team`, `min_level`, `max_level`, `alliance_win_spell`, `alliance_lose_spell`, `horde_win_spell`, `horde_lose_spell`, `alliance_start_location`, `horde_start_location`, `player_loot_id` FROM `battleground_template` t1 WHERE `patch`=(SELECT max(`patch`) FROM `battleground_template` t2 WHERE t1.`id`=t2.`id` && `patch` <= %u)", sWorld.GetWowPatch()));

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, ">> Loaded 0 battlegrounds. DB table `battleground_template` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();
        Field* fields = result->Fetch();

        uint32 bgTypeID_ = fields[0].GetUInt32();

        BattleGroundTypeId bgTypeID = BattleGroundTypeId(bgTypeID_);

        uint32 minPlayersPerTeam = fields[1].GetUInt32();
        uint32 maxPlayersPerTeam = fields[2].GetUInt32();
        uint32 MinLvl = fields[3].GetUInt32();
        uint32 MaxLvl = fields[4].GetUInt32();
        uint32 AllianceWinSpell  = fields[5].GetUInt32();
        uint32 AllianceLoseSpell = fields[6].GetUInt32();
        uint32 HordeWinSpell  = fields[7].GetUInt32();
        uint32 HordeLoseSpell = fields[8].GetUInt32();

        float AStartLoc[4];
        float HStartLoc[4];

        uint32 start1 = fields[9].GetUInt32();

        WorldSafeLocsEntry const* start = sWorldSafeLocsStore.LookupEntry(start1);
        if (start)
        {
            AStartLoc[0] = start->x;
            AStartLoc[1] = start->y;
            AStartLoc[2] = start->z;
            AStartLoc[3] = sObjectMgr.GetWorldSafeLocFacing(start->ID);
        }
        else
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table `battleground_template` for id %u have nonexistent WorldSafeLocs.dbc id %u in field `AllianceStartLoc`. BG not created.", bgTypeID, start1);
            continue;
        }

        uint32 start2 = fields[10].GetUInt32();

        start = sWorldSafeLocsStore.LookupEntry(start2);
        if (start)
        {
            HStartLoc[0] = start->x;
            HStartLoc[1] = start->y;
            HStartLoc[2] = start->z;
            HStartLoc[3] = sObjectMgr.GetWorldSafeLocFacing(start->ID);
        }
        else
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table `battleground_template` for id %u have non-existed WorldSafeLocs.dbc id %u in field `HordeStartLoc`. BG not created.", bgTypeID, start2);
            continue;
        }

        uint32 playerSkinReflootId = fields[11].GetUInt32();
        if (playerSkinReflootId && !ExistsRefLootTemplate(playerSkinReflootId))
        {
            playerSkinReflootId = 0;
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table `battleground_template` for id %u associated with nonexistent refloot id %u. Setting to 0.", bgTypeID, playerSkinReflootId);
        }

        if (playerSkinReflootId)
            m_usedRefloot.insert(playerSkinReflootId);

        uint32 mapId = GetBattleGrounMapIdByTypeId(bgTypeID);
        char const* name;

        if (MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(mapId))
            name = mapEntry->name;
        else
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table `battleground_template` for id %u associated with nonexistent map id %u.", bgTypeID, mapId);
            continue;
        }

        //sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Creating battleground %s, %u-%u", bl->name[sWorld.GetDBClang()], MinLvl, MaxLvl);
        if (!CreateBattleGround(bgTypeID, minPlayersPerTeam, maxPlayersPerTeam, MinLvl, MaxLvl, AllianceWinSpell, AllianceLoseSpell, HordeWinSpell, HordeLoseSpell, name, mapId, AStartLoc[0], AStartLoc[1], AStartLoc[2], AStartLoc[3], HStartLoc[0], HStartLoc[1], HStartLoc[2], HStartLoc[3], playerSkinReflootId))
            continue;

        ++count;
    }
    while (result->NextRow());

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u battlegrounds", count);
}

void BattleGroundMgr::BuildBattleGroundListPacket(WorldPacket* data, ObjectGuid guid, Player* player, BattleGroundTypeId bgTypeId)
{
    if (!player)
        return;

    uint32 mapId = GetBattleGrounMapIdByTypeId(bgTypeId);

    data->Initialize(SMSG_BATTLEFIELD_LIST);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    *data << guid; // battlemaster guid
#endif
    *data << uint32(mapId);
    *data << uint8(player->GetBattleGroundBracketIdFromLevel(bgTypeId));

    size_t countPos = data->wpos();
    uint32 count = 0;
    *data << uint32(0); // number of bg instances

    uint32 bracketId = player->GetBattleGroundBracketIdFromLevel(bgTypeId);
    ClientBattleGroundIdSet const& ids = m_clientBattleGroundIds[bgTypeId][bracketId];
    for (const auto id : ids)
    {
        *data << uint32(id);
        ++count;
    }
    data->put<uint32>(countPos, count);
}

void BattleGroundMgr::SendToBattleGround(Player* player, uint32 instanceId, BattleGroundTypeId bgTypeId)
{
    BattleGround *bg = GetBattleGround(instanceId, bgTypeId);
    if (bg)
    {
        uint32 mapid = bg->GetMapId();
        float x, y, z, o;
        Team team = player->GetBGTeam();
        if (team == 0)
            team = player->GetTeam();
        bg->GetTeamStartLoc(team, x, y, z, o);

        // Remove AFK from player before BG teleport
        if (player->IsAFK())
            player->ToggleAFK();

        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "BATTLEGROUND: Sending %s to map %u, X %f, Y %f, Z %f, O %f", player->GetName(), mapid, x, y, z, o);
        player->TeleportTo(mapid, x, y, z, o);
    }
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "player %u trying to port to nonexistent bg instance %u", player->GetGUIDLow(), instanceId);
}

BattleGroundQueueTypeId BattleGroundMgr::BgQueueTypeId(BattleGroundTypeId bgTypeId)
{
    switch (bgTypeId)
    {
        case BATTLEGROUND_WS:
            return BATTLEGROUND_QUEUE_WS;
        case BATTLEGROUND_AB:
            return BATTLEGROUND_QUEUE_AB;
        case BATTLEGROUND_AV:
            return BATTLEGROUND_QUEUE_AV;
        default:
            return BATTLEGROUND_QUEUE_NONE;
    }
}

BattleGroundTypeId BattleGroundMgr::BgTemplateId(BattleGroundQueueTypeId bgQueueTypeId)
{
    switch (bgQueueTypeId)
    {
        case BATTLEGROUND_QUEUE_WS:
            return BATTLEGROUND_WS;
        case BATTLEGROUND_QUEUE_AB:
            return BATTLEGROUND_AB;
        case BATTLEGROUND_QUEUE_AV:
            return BATTLEGROUND_AV;
        default:
            return BattleGroundTypeId(0);                   // used for unknown template (it exist and do nothing)
    }
}

void BattleGroundMgr::ToggleTesting()
{
    m_testing = !m_testing;
    if (m_testing)
        sWorld.SendWorldText(LANG_DEBUG_BG_ON);
    else
        sWorld.SendWorldText(LANG_DEBUG_BG_OFF);
}

void BattleGroundMgr::ScheduleQueueUpdate(BattleGroundQueueTypeId bgQueueTypeId, BattleGroundTypeId bgTypeId, BattleGroundBracketId bracketId)
{
    //ACE_Guard<ACE_Thread_Mutex> guard(schedulerLock);
    //we will use only 1 number created of bgTypeId and queue_id
    uint32 schedule_id = (bgQueueTypeId << 16) | (bgTypeId << 8) | bracketId;
    bool found = false;
    for (uint32 i : m_queueUpdateScheduler)
    {
        if (i == schedule_id)
        {
            found = true;
            break;
        }
    }
    if (!found)
        m_queueUpdateScheduler.push_back(schedule_id);
}

uint32 BattleGroundMgr::GetPrematureFinishTime() const
{
    return sWorld.getConfig(CONFIG_UINT32_BATTLEGROUND_PREMATURE_FINISH_TIMER);
}

void BattleGroundMgr::LoadBattleMastersEntry()
{
    m_battleMastersMap.clear();                              // need for reload case

    std::unique_ptr<QueryResult> result = WorldDatabase.Query("SELECT `entry`, `bg_template` FROM `battlemaster_entry`");

    uint32 count = 0;

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded 0 battlemaster entries - table is empty!");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        ++count;
        bar.step();

        Field* fields = result->Fetch();

        uint32 entry = fields[0].GetUInt32();
        uint32 bgTypeId  = fields[1].GetUInt32();
        if (bgTypeId >= MAX_BATTLEGROUND_TYPE_ID)
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_ERROR, "Table `battlemaster_entry` contain entry %u for nonexistent battleground type %u, ignored.", entry, bgTypeId);
            continue;
        }

        m_battleMastersMap[entry] = BattleGroundTypeId(bgTypeId);

    }
    while (result->NextRow());

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u battlemaster entries", count);
}

HolidayIds BattleGroundMgr::BgTypeToWeekendHolidayId(BattleGroundTypeId bgTypeId)
{
    switch (bgTypeId)
    {
        case BATTLEGROUND_AV:
            return HOLIDAY_CALL_TO_ARMS_AV;
        case BATTLEGROUND_WS:
            return HOLIDAY_CALL_TO_ARMS_WS;
        case BATTLEGROUND_AB:
            return HOLIDAY_CALL_TO_ARMS_AB;
        default:
            return HOLIDAY_NONE;
    }
}

BattleGroundTypeId BattleGroundMgr::WeekendHolidayIdToBgType(HolidayIds holiday)
{
    switch (holiday)
    {
        case HOLIDAY_CALL_TO_ARMS_AV:
            return BATTLEGROUND_AV;
        case HOLIDAY_CALL_TO_ARMS_WS:
            return BATTLEGROUND_WS;
        case HOLIDAY_CALL_TO_ARMS_AB:
            return BATTLEGROUND_AB;
        default:
            return BATTLEGROUND_TYPE_NONE;
    }
}

bool BattleGroundMgr::IsBgWeekend(BattleGroundTypeId bgTypeId)
{
    return sGameEventMgr.IsActiveHoliday(BgTypeToWeekendHolidayId(bgTypeId));
}

void BattleGroundMgr::LoadBattleEventIndexes()
{
    BattleGroundEventIdx events;
    events.event1 = BG_EVENT_NONE;
    events.event2 = BG_EVENT_NONE;
    m_gameObjectBattleEventIndexMap.clear();             // need for reload case
    m_gameObjectBattleEventIndexMap[-1].push_back(events);
    m_creatureBattleEventIndexMap.clear();               // need for reload case
    m_creatureBattleEventIndexMap[-1].push_back(events);

    uint32 count = 0;

    std::unique_ptr<QueryResult> result =
        //                               0         1           2                3                4              5           6
        WorldDatabase.Query("SELECT data.typ, data.guid1, data.ev1 AS ev1, data.ev2 AS ev2, data.map AS m, data.guid2, description.map, "
                            //                              7                  8                   9
                            "description.event1, description.event2, description.description "
                            "FROM "
                            "(SELECT '1' AS typ, a.guid AS guid1, a.event1 AS ev1, a.event2 AS ev2, b.map AS map, b.guid AS guid2 "
                            "FROM gameobject_battleground AS a "
                            "LEFT OUTER JOIN gameobject AS b ON a.guid = b.guid "
                            "UNION "
                            "SELECT '2' AS typ, a.guid AS guid1, a.event1 AS ev1, a.event2 AS ev2, b.map AS map, b.guid AS guid2 "
                            "FROM creature_battleground AS a "
                            "LEFT OUTER JOIN creature AS b ON a.guid = b.guid "
                            ") data "
                            "RIGHT OUTER JOIN battleground_events AS description ON data.map = description.map "
                            "AND data.ev1 = description.event1 AND data.ev2 = description.event2 "
                            // full outer join doesn't work in mysql :-/ so just UNION-select the same again and add a left outer join
                            "UNION "
                            "SELECT data.typ, data.guid1, data.ev1, data.ev2, data.map, data.guid2, description.map, "
                            "description.event1, description.event2, description.description "
                            "FROM "
                            "(SELECT '1' AS typ, a.guid AS guid1, a.event1 AS ev1, a.event2 AS ev2, b.map AS map, b.guid AS guid2 "
                            "FROM gameobject_battleground AS a "
                            "LEFT OUTER JOIN gameobject AS b ON a.guid = b.guid "
                            "UNION "
                            "SELECT '2' AS typ, a.guid AS guid1, a.event1 AS ev1, a.event2 AS ev2, b.map AS map, b.guid AS guid2 "
                            "FROM creature_battleground AS a "
                            "LEFT OUTER JOIN creature AS b ON a.guid = b.guid "
                            ") data "
                            "LEFT OUTER JOIN battleground_events AS description ON data.map = description.map "
                            "AND data.ev1 = description.event1 AND data.ev2 = description.event2 "
                            "ORDER BY m, ev1, ev2");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, ">> Loaded 0 battleground eventindexes.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();
        Field* fields = result->Fetch();
        if (fields[2].GetUInt8() == BG_EVENT_NONE || fields[3].GetUInt8() == BG_EVENT_NONE)
            continue;                                       // we don't need to add those to the eventmap

        bool gameobject         = (fields[0].GetUInt8() == 1);
        uint32 dbGuid           = fields[1].GetUInt32();
        events.event1           = fields[2].GetUInt8();
        events.event2           = fields[3].GetUInt8();
        uint32 map              = fields[4].GetUInt32();

        uint32 descMap = fields[6].GetUInt32();
        uint8 descEvent1 = fields[7].GetUInt8();
        uint8 descEvent2 = fields[8].GetUInt8();
        char const* description = fields[9].GetString();

        // checking for nullptr - through right outer join this will mean following:
        if (fields[5].GetUInt32() != dbGuid)
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "BattleGroundEvent: %s with nonexistent guid %u for event: map:%u, event1:%u, event2:%u (\"%s\")",
                            (gameobject) ? "gameobject" : "creature", dbGuid, map, events.event1, events.event2, description);
            continue;
        }

        // checking for nullptr - through full outer join this can mean 2 things:
        if (descMap != map)
        {
            // there is an event missing
            if (dbGuid == 0)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "BattleGroundEvent: missing db-data for map:%u, event1:%u, event2:%u (\"%s\")", descMap, descEvent1, descEvent2, description);
                continue;
            }
            // we have an event which shouldn't exist
            else
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "BattleGroundEvent: %s with guid %u is registered, for a nonexistent event: map:%u, event1:%u, event2:%u",
                                (gameobject) ? "gameobject" : "creature", dbGuid, map, events.event1, events.event2);
                continue;
            }
        }

        if (gameobject)
            m_gameObjectBattleEventIndexMap[dbGuid].push_back(events);
        else
            m_creatureBattleEventIndexMap[dbGuid].push_back(events);

        ++count;

    }
    while (result->NextRow());

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u battleground eventindexes", count);
}

// Offline BG queue system
void BattleGroundMgr::PlayerLoggedIn(Player* player)
{
    for (int i = 1; i <= PLAYER_MAX_BATTLEGROUND_QUEUES; ++i)
    {
        if (m_battleGroundQueues[i].PlayerLoggedIn(player))
        {
            GroupQueueInfo groupInfo;
            m_battleGroundQueues[i].GetPlayerGroupInfoData(player->GetObjectGuid(), &groupInfo);
            uint32 avgTime   = m_battleGroundQueues[i].GetAverageQueueWaitTime(&groupInfo, player->GetBattleGroundBracketIdFromLevel(groupInfo.bgTypeId));
            // Send "in queue" packet.
            uint32 queueSlot = player->AddBattleGroundQueueId(BattleGroundQueueTypeId(i));

            WorldPacket data;
            BattleGround* bg = GetBattleGroundTemplate(groupInfo.bgTypeId);
            BuildBattleGroundStatusPacket(&data, bg, queueSlot, STATUS_WAIT_QUEUE, avgTime, WorldTimer::getMSTimeDiff(groupInfo.joinTime, WorldTimer::getMSTime()));
            player->GetSession()->SendPacket(&data);

            if (groupInfo.isInvitedToBgInstanceGuid)
            {
                player->SetInviteForBattleGroundQueueType(BattleGroundQueueTypeId(i), groupInfo.isInvitedToBgInstanceGuid);

                // create automatic remove events
                BGQueueRemoveEvent* removeEvent = new BGQueueRemoveEvent(player->GetObjectGuid(), groupInfo.isInvitedToBgInstanceGuid, bg->GetTypeID(), BattleGroundQueueTypeId(i), groupInfo.removeInviteTime);
                uint32 offset = (WorldTimer::getMSTime() > groupInfo.removeInviteTime) ? 1 : WorldTimer::getMSTimeDiff(WorldTimer::getMSTime(), groupInfo.removeInviteTime);
                player->m_Events.AddEvent(removeEvent, player->m_Events.CalculateTime(offset));
            }
        }
    }
}

void BattleGroundMgr::PlayerLoggedOut(Player* player)
{
    for (int i = 1; i <= PLAYER_MAX_BATTLEGROUND_QUEUES; ++i)
    {
        if (BattleGroundQueueTypeId bgQueueTypeId = player->GetBattleGroundQueueTypeId(i-1))
        {
            player->RemoveBattleGroundQueueId(bgQueueTypeId);
            m_battleGroundQueues[bgQueueTypeId].PlayerLoggedOut(player->GetObjectGuid());
        }
    }
}

void BattleGroundQueue::PlayerLoggedOut(ObjectGuid guid)
{
    QueuedPlayersMap::iterator itr;

    //remove player from map, if he's there
    itr = m_queuedPlayers.find(guid);
    if (itr == m_queuedPlayers.end())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGroundQueue: couldn't find for remove: %s", guid.GetString().c_str());
        return;
    }
    itr->second.lastOnlineTime  = WorldTimer::getMSTime();
    itr->second.online          = false;
}

bool BattleGroundQueue::PlayerLoggedIn(Player* player)
{
    QueuedPlayersMap::iterator itr;

    //remove player from map, if he's there
    itr = m_queuedPlayers.find(player->GetObjectGuid());
    if (itr == m_queuedPlayers.end())
        return false;

    itr->second.online          = true;
    return true;
}
