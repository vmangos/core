/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
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

#ifndef _LFG_QUEUE_H
#define _LFG_QUEUE_H

#include "Common.h"
#include "LFGDefines.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"
#include "Multithreading/Messager.h"

class Player;

struct LFGPlayerQueueInfo
{
    LfgRoles roleMask = PLAYER_ROLE_NONE;
    uint32 team = 0;
    uint32 areaId = 0;
    uint32 timeInLFG = 0;
	bool hasQueuePriority = false;
    std::string name;
    uint8 playerClass = 0;
    std::list<std::pair<LfgRoles, LfgRolePriority>> rolePriority;

    void CalculateRoles(Classes playerClass);
    void CalculateTalentRoles(Player* player);
    LfgRolePriority GetRolePriority(LfgRoles role);
};

struct LFGGroupQueueInfo
{
    uint32 availableRoles = 0;
    uint32 dpsCount = 0;
    uint32 team = 0;
    uint32 areaId = 0;
    uint32 groupTimer = 0;
    uint32 playerCount = 0;
};

class LFGQueue
{
    public:
        void Update();

        bool IsPlayerInQueue(ObjectGuid const& plrGuid) const;
        bool IsGroupInQueue(uint32 groupId) const;

        void UpdateGroup(LFGGroupQueueInfo const& groupInfo, bool join, ObjectGuid playerGuid, uint32 groupId);
        void RestoreOfflinePlayer(ObjectGuid playerGuid);

        void RemovePlayerFromQueue(ObjectGuid playerGuid, PlayerLeaveMethod leaveMethod = PLAYER_CLIENT_LEAVE); // 0 == by default system (cmsg, leader leave), 1 == by lfg system (no need report text you left queu)
        void RemoveGroupFromQueue(uint32 groupId, GroupLeaveMethod leaveMethod = GROUP_CLIENT_LEAVE);

        Messager<LFGQueue>& GetMessager() { return m_messager; }

        void AddGroup(LFGGroupQueueInfo const& groupInfo, uint32 groupId);
        void AddPlayer(LFGPlayerQueueInfo const& playerInfo, ObjectGuid playerGuid);
    private:
        void FindInArea(std::list<ObjectGuid>& players, uint32 area, uint32 team, ObjectGuid const& exclude);
        bool FindRoleToGroup(ObjectGuid playerGuid, uint32 groupId, LfgRoles role);

        typedef std::map<ObjectGuid, LFGPlayerQueueInfo> QueuedPlayersMap;
        QueuedPlayersMap m_queuedPlayers;
        QueuedPlayersMap m_offlinePlayers;

        typedef std::map<uint32, LFGGroupQueueInfo> QueuedGroupsMap;
        QueuedGroupsMap m_queuedGroups;

        Messager<LFGQueue> m_messager;

        uint32 m_groupSize = 5;
};

#endif