/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _CREATURE_GROUPS_H
#define _CREATURE_GROUPS_H

#include "Common.h"
#include "ObjectGuid.h"

#include <map>

class Map;
class Unit;
class Creature;
class CreatureGroup;
struct CreatureData;

enum OptionFlags
{
    OPTION_FORMATION_MOVE               = 0x001,
    OPTION_AGGRO_TOGETHER               = 0x002,
    OPTION_EVADE_TOGETHER               = 0x004,
    OPTION_RESPAWN_TOGETHER             = 0x008,
    OPTION_RESPAWN_ALL_ON_MASTER_EVADE  = 0x010,
    OPTION_RESPAWN_ALL_ON_ANY_EVADE     = 0x020,
    OPTION_INFORM_LEADER_ON_MEMBER_DIED = 0x040,
    OPTION_INFORM_MEMBERS_ON_ANY_DIED   = 0x080,
};

#define ALL_CREATURE_GROUP_OPTIONS (OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER | OPTION_RESPAWN_TOGETHER | OPTION_RESPAWN_ALL_ON_MASTER_EVADE | OPTION_RESPAWN_ALL_ON_ANY_EVADE | OPTION_INFORM_LEADER_ON_MEMBER_DIED | OPTION_INFORM_MEMBERS_ON_ANY_DIED)

struct CreatureGroupMember
{
    bool ComputeRelativePosition(float leaderAngle, float &x, float &y) const;
    float followDistance = 0.0f;
    float followAngle = 0.0f;
    uint32 memberFlags = 0;
};

class CreatureGroupsManager;

class CreatureGroup
{
    friend class CreatureGroupsManager;
    public:
        CreatureGroup(ObjectGuid leader) : m_leaderGuid(leader), m_originalLeaderGuid(leader), m_options(0), m_assistGuard(false), m_respawnGuard(false), m_deleted(false), m_lastReachedWaypoint(0)
        {
        }
        void AddMember(ObjectGuid guid, float followDist, float followAngle, uint32 memberFlags = (OPTION_FORMATION_MOVE|OPTION_AGGRO_TOGETHER));
        void RemoveMember(ObjectGuid guid);
        void RemoveTemporaryLeader(Creature* pLeader);
        void DisbandGroup(Creature* pLeader);
        void DeleteFromDb();
        void SaveToDb();

        ObjectGuid const& GetLeaderGuid() const { return m_leaderGuid; }
        ObjectGuid const& GetOriginalLeaderGuid() const { return m_originalLeaderGuid; }
        std::map<ObjectGuid, CreatureGroupMember> const& GetMembers() const { return m_members; }
        bool ContainsGuid(ObjectGuid guid) const { return m_members.find(guid) != m_members.end(); }
        bool IsFormation() const { return m_options & OPTION_FORMATION_MOVE; }
        bool HasGroupFlag(uint32 flag) const { return m_options & flag; }
        void SetLastReachedWaypoint(uint32 point) { m_lastReachedWaypoint = point; }
        uint32 ChooseCreatureId(ObjectGuid guid, CreatureData const* pData, Map* pMap) const;

        void OnMemberAttackStart(Creature* member, Unit* target);
        void OnMemberDied(Creature* member);
        void OnLeaveCombat(Creature* creature);
        void OnRespawn(Creature* member);
        void RespawnAll(Creature* except);
    protected:
        void Respawn(Creature* member, CreatureGroupMember const* memberEntry);
        void MemberAssist(Creature* member, Unit* target, Creature* alliedAttacker);
        ObjectGuid m_leaderGuid;
        ObjectGuid m_originalLeaderGuid;
        uint32 m_options;
        bool m_assistGuard;
        bool m_respawnGuard;
        bool m_deleted;
        uint32 m_lastReachedWaypoint;
        std::map<ObjectGuid, CreatureGroupMember> m_members;
        std::map<uint32 /*entry*/, std::pair<int32 /*min*/, int32 /*max*/>> m_entryLimits;
};

class CreatureGroupsManager
{
    public:
        static CreatureGroupsManager* instance()
        {
            static CreatureGroupsManager* i = new CreatureGroupsManager();
            return i;
        }
        void LoadCreatureGroup(ObjectGuid guid, CreatureGroup*& group);
        void RegisterNewGroup(CreatureGroup* group) { m_groups[group->GetOriginalLeaderGuid()] = group; }
        void Load();
        void EraseCreatureGroup(ObjectGuid leaderGuid) { m_groups.erase(leaderGuid); }
        static ObjectGuid ConvertDBGuid(uint32 guidlow);
    protected:
        std::map<ObjectGuid, CreatureGroup*> m_groups;
};

#define sCreatureGroupsManager (CreatureGroupsManager::instance())

#endif
