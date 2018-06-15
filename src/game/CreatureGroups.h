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

class CreatureGroup;


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

struct CreatureGroupMember
{
    bool ComputeRelativePosition(float leaderAngle, float &x, float &y) const;
    float followDistance;
    float followAngle;
    uint32 memberFlags;
};

class CreatureGroup
{
    public:
        CreatureGroup(ObjectGuid leader) : _leaderGuid(leader), _options(0), _respawnGuard(false)
        {
        }
        CreatureGroupMember* AddMember(ObjectGuid guid, float followDist, float followAngle, uint32 memberFlags = (OPTION_FORMATION_MOVE|OPTION_AGGRO_TOGETHER));
        void RemoveMember(ObjectGuid guid);
        void DeleteFromDb();
        void SaveToDb();

        ObjectGuid GetLeaderGuid() const { return _leaderGuid; }
        std::map<ObjectGuid, CreatureGroupMember*> const& GetMembers() const { return _members; }
        bool ContainsGuid(ObjectGuid guid) const { return _members.find(guid) != _members.end(); }
        bool IsFormation() const { return _options & OPTION_FORMATION_MOVE; }

        uint32 GetWaitTime(Creature* member);
        void OnMemberAttackStart(Creature* member, Unit* target);
        void MemberAssist(Creature* member, Unit* target);

        void OnMemberDied(Creature* member);

        void OnLeaveCombat(Creature* creature);
        void OnRespawn(Creature* member);
        void RespawnAll(Creature* except);
    protected:
        void Respawn(Creature* member, CreatureGroupMember const* memberEntry);
        ObjectGuid _leaderGuid;
        uint32 _options;
        bool    _respawnGuard;
        std::map<ObjectGuid, CreatureGroupMember*> _members;
};

class CreatureGroupsManager
{
    public:
        static CreatureGroupsManager* instance()
        {
            static CreatureGroupsManager* i = new CreatureGroupsManager();
            return i;
        }
        void LoadCreatureGroup(Creature* creature, CreatureGroup*& group);
        void RegisterNewGroup(CreatureGroup* group) { _groups[group->GetLeaderGuid()] = group; }
        void Load();
        static ObjectGuid ConvertDBGuid(uint32 guidlow);
    protected:
        std::map<ObjectGuid, CreatureGroup*> _groups;
};

#define sCreatureGroupsManager (CreatureGroupsManager::instance())

#endif
