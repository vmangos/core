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

#include "Creature.h"
#include "CreatureGroups.h"
#include "ObjectMgr.h"
#include "CreatureAI.h"
#include "BattleGround.h"

void CreatureGroup::AddMember(ObjectGuid guid, float followDist, float followAngle, uint32 memberFlags)
{
    if (guid == m_leaderGuid)
        return;

    CreatureGroupMember& member = m_members[guid];
    member.followDistance = followDist;
    member.followAngle    = followAngle;
    member.memberFlags    = memberFlags;
    m_options |= memberFlags;
}

void CreatureGroup::OnMemberAttackStart(Creature* member, Unit* target)
{
    if (m_deleted)
        return;

    if (!(m_options & OPTION_AGGRO_TOGETHER))
        return;

    for (const auto& itr : m_members)
        if (itr.first != member->GetObjectGuid())
            MemberAssist(member->GetMap()->GetCreature(itr.first), target, member);

    if (member->GetObjectGuid() != GetOriginalLeaderGuid())
        MemberAssist(member->GetMap()->GetCreature(GetOriginalLeaderGuid()), target, member);
}

void CreatureGroup::OnMemberDied(Creature* member)
{
    if (m_deleted)
        return;

    if (m_options & OPTION_INFORM_LEADER_ON_MEMBER_DIED)
    {
        if (member->GetObjectGuid() != GetOriginalLeaderGuid())
            if (Creature* groupLeader = member->GetMap()->GetCreature(GetOriginalLeaderGuid()))
                if (groupLeader->IsInWorld() && groupLeader->IsAlive() && groupLeader->AI())
                    groupLeader->AI()->GroupMemberJustDied(member, false);
    }
    if (m_options & OPTION_INFORM_MEMBERS_ON_ANY_DIED)
    {
        for (const auto& itr : m_members)
            if (itr.first != member->GetObjectGuid())
                if (Creature* otherMember = member->GetMap()->GetCreature(itr.first))
                    if (otherMember->IsInWorld() && otherMember->IsAlive() && otherMember->AI())
                        otherMember->AI()->GroupMemberJustDied(member, member->GetObjectGuid() == GetOriginalLeaderGuid());
    }

    // Select new leader on death if group uses formation movement.
    if ((member->GetObjectGuid() == GetLeaderGuid()) && IsFormation())
    {
        Creature* pOriginalLeader = (member->GetObjectGuid() == GetOriginalLeaderGuid()) ? member : member->GetMap()->GetCreature(GetOriginalLeaderGuid());
        if (pOriginalLeader && pOriginalLeader->GetDefaultMovementType() == WAYPOINT_MOTION_TYPE)
        {
            Creature* pNewLeader = nullptr;
            for (const auto& itr : m_members)
            {
                if (itr.first != member->GetObjectGuid())
                {
                    if (Creature* otherMember = member->GetMap()->GetCreature(itr.first))
                    {
                        if (otherMember->IsInWorld() && otherMember->IsAlive())
                        {
                            pNewLeader = otherMember;
                            break;
                        }
                    }
                }
            }

            if (pNewLeader)
            {
                m_leaderGuid = pNewLeader->GetObjectGuid();
                pNewLeader->GetMotionMaster()->MoveWaypointAsDefault(m_lastReachedWaypoint, 0, 1000, pOriginalLeader->GetGUIDLow(), pOriginalLeader->GetEntry(), true);

                for (const auto& itr : m_members)
                    if (itr.first != member->GetObjectGuid() && itr.first != pNewLeader->GetObjectGuid())
                        if (Creature* otherMember = member->GetMap()->GetCreature(itr.first))
                            if (otherMember->IsInWorld() && otherMember->IsAlive())
                                otherMember->GetMotionMaster()->ReInitializePatrolMovement();
            }
            else
                m_leaderGuid = m_originalLeaderGuid; // Everyone is dead, reset leader to original.
        }
    }
}

void CreatureGroup::OnLeaveCombat(Creature* member)
{
    if (m_deleted)
        return;

    bool masterEvade = member->GetObjectGuid() == GetOriginalLeaderGuid();
    if (m_options & OPTION_EVADE_TOGETHER)
    {
        for (const auto& itr : m_members)
            if (itr.first != member->GetObjectGuid())
                if (Creature* otherMember = member->GetMap()->GetCreature(itr.first))
                    if (otherMember->IsInWorld() && otherMember->IsAlive() && otherMember->AI())
                        otherMember->AI()->EnterEvadeMode();

        if (!masterEvade)
        {
            if (Creature* originaLeader = member->GetMap()->GetCreature(GetOriginalLeaderGuid()))
            {
                if (originaLeader->IsInWorld() && originaLeader->IsAlive() && originaLeader->AI())
                {
                    masterEvade = true;
                    originaLeader->AI()->EnterEvadeMode();
                }
            }
        }
    }

    if ((m_options & OPTION_RESPAWN_ALL_ON_ANY_EVADE) ||
       ((m_options & OPTION_RESPAWN_ALL_ON_MASTER_EVADE) && masterEvade))
        RespawnAll(member);
}

void CreatureGroup::OnRespawn(Creature* member)
{
    if (m_deleted)
        return;

    // On respawn of original leader, make sure other members
    // follow him now instead of the temporary leader.
    if ((m_leaderGuid != m_originalLeaderGuid) &&
        (member->GetObjectGuid() == m_originalLeaderGuid))
    {
        m_leaderGuid = m_originalLeaderGuid;
        for (const auto& itr : m_members)
            if (Creature* otherMember = member->GetMap()->GetCreature(itr.first))
                if (otherMember->IsInWorld() && otherMember->IsAlive())
                    otherMember->GetMotionMaster()->Initialize();
    }

    if (!(m_options & OPTION_RESPAWN_TOGETHER))
        return;

    RespawnAll(member);
}

void CreatureGroup::RespawnAll(Creature* except)
{
    if (m_deleted)
        return;

    for (const auto& itr : m_members)
        if (itr.first != except->GetObjectGuid())
            if (Creature* otherMember = except->GetMap()->GetCreature(itr.first))
                Respawn(otherMember, &itr.second);

    if (except->GetObjectGuid() != GetOriginalLeaderGuid())
        if (Creature* otherMember = except->GetMap()->GetCreature(GetOriginalLeaderGuid()))
            Respawn(otherMember, nullptr);
}

void CreatureGroup::Respawn(Creature* member, CreatureGroupMember const* memberEntry /* = nullptr for leader */)
{
    // Prevent stack overflow (member->Respawn() can call CreatureGroup::Respawn, etc ...)
    if (m_respawnGuard)
        return;

    m_respawnGuard = true;
    if (member->IsInWorld() && member->GetRespawnTime() > time(nullptr))
    {
        BattleGround* bg = member->GetMap()->IsBattleGround() ? ((BattleGroundMap*)member->GetMap())->GetBG() : nullptr;
        if (!bg || bg->CanBeSpawned(member))
        {
            if (memberEntry && memberEntry->memberFlags & OPTION_FORMATION_MOVE)
            {
                if (Unit* leader = member->GetMap()->GetUnit(GetOriginalLeaderGuid()))
                {
                    float x, y, z;
                    if (leader->IsAlive() || leader->GetTypeId() != TYPEID_UNIT)
                        leader->GetPosition(x, y, z);
                    else
                        leader->ToCreature()->GetRespawnCoord(x, y, z);

                    float tmpx = x;
                    float tmpy = y;
                    memberEntry->ComputeRelativePosition(leader->GetOrientation(), x, y);
                    x += tmpx;
                    y += tmpy;
                    member->UpdateGroundPositionZ(x, y, z);
                    member->NearTeleportTo(x, y, z, leader->GetAngle(x, y) + M_PI);
                }
            }
            member->Respawn();
        }
    }
    m_respawnGuard = false;
}

void CreatureGroup::MemberAssist(Creature* member, Unit* target, Creature* alliedAttacker)
{
    if (m_assistGuard)
        return;

    if (!member || !member->IsInWorld())
        return;

    if (!member->IsAlive())
        return;

    if (member->GetVictim())
        return;

    if (member->AI())
    {
        m_assistGuard = true;
        member->SetNoCallAssistance(true);
        member->AI()->AttackedBy(target);
        if (member->GetVictim())
            member->SetLastLeashExtensionTimePtr(alliedAttacker->GetLastLeashExtensionTimePtr());
        m_assistGuard = false;
    }
}

void CreatureGroup::RemoveTemporaryLeader(Creature* pLeader)
{
    if (m_deleted)
        return;

    m_leaderGuid = m_originalLeaderGuid;
    RemoveMember(pLeader->GetObjectGuid());

    for (const auto& itr : m_members)
        if (itr.first != pLeader->GetObjectGuid())
            if (Creature* otherMember = pLeader->GetMap()->GetCreature(itr.first))
                if (otherMember->IsInWorld() && otherMember->IsAlive())
                    otherMember->GetMotionMaster()->ReInitializePatrolMovement();
}

void CreatureGroup::RemoveMember(ObjectGuid guid)
{
    if (m_deleted)
        return;

    std::map<ObjectGuid, CreatureGroupMember>::iterator it = m_members.find(guid);
    if (it != m_members.end())
        m_members.erase(it);
}

void CreatureGroup::DisbandGroup(Creature* pLeader)
{
    MANGOS_ASSERT(!m_deleted);
    MANGOS_ASSERT(pLeader->GetObjectGuid() == GetOriginalLeaderGuid());

    m_deleted = true;

    if (pLeader->HasStaticDBSpawnData())
        sCreatureGroupsManager->EraseCreatureGroup(GetOriginalLeaderGuid());
    pLeader->SetCreatureGroup(nullptr);

    for (auto const& it : m_members)
    {
        if (Creature* pOtherMember = pLeader->GetMap()->GetCreature(it.first))
        {
            pOtherMember->SetCreatureGroup(nullptr);
            if (IsFormation() && pOtherMember->IsAlive())
                pOtherMember->GetMotionMaster()->Initialize();
        }
    }

    m_members.clear();
}

void CreatureGroup::DoForAllMembers(Map* pMap, std::function<void(Creature*)>&& pFunc)
{
    for (auto const& it : m_members)
    {
        if (Creature* pMember = pMap->GetCreature(it.first))
            pFunc(pMember);
    }
}

void CreatureGroup::DeleteFromDb()
{
    WorldDatabase.PExecute("DELETE FROM `creature_groups` WHERE `leader_guid`=%u", m_originalLeaderGuid.GetCounter());
}

void CreatureGroup::SaveToDb()
{
    DeleteFromDb();
    for (const auto& itr : m_members)
        WorldDatabase.PExecute("INSERT INTO `creature_groups` SET `leader_guid`=%u, `member_guid`=%u, `dist`='%f', `angle`='%f', `flags`=%u",
                               m_originalLeaderGuid.GetCounter(), itr.first.GetCounter(), itr.second.followDistance, itr.second.followAngle, itr.second.memberFlags);
}

uint32 CreatureGroup::ChooseCreatureId(ObjectGuid guid, CreatureData const* pData, Map* pMap) const
{
    if (m_entryLimits.empty())
        return pData->ChooseCreatureId();

    ObjectGuidSet nonSpawnedMembers; // at first load of spawn the other members might not be loaded yet
    std::map<uint32 /*entry*/, std::pair<int32 /*min*/, int32 /*max*/>> currentLimits = m_entryLimits;
    for (auto const& itr : m_members)
    {
        if (itr.first == guid)
            continue;

        if (Creature* pOtherMember = pMap->GetCreature(itr.first))
        {
            auto itr2 = currentLimits.find(pOtherMember->GetEntry());
            if (itr2 != currentLimits.end())
            {
                --itr2->second.first;
                --itr2->second.second;
            }
        }
        else
            nonSpawnedMembers.insert(itr.first);
    }
    if (guid != GetOriginalLeaderGuid())
    {
        if (Creature* pLeader = pMap->GetCreature(GetOriginalLeaderGuid()))
        {
            auto itr2 = currentLimits.find(pLeader->GetEntry());
            if (itr2 != currentLimits.end())
            {
                --itr2->second.first;
                --itr2->second.second;
            }
        }
        else
            nonSpawnedMembers.insert(GetOriginalLeaderGuid());
    }

    std::set<uint32> availableIds;
    for (int i = 0; i < MAX_CREATURE_IDS_PER_SPAWN; ++i)
    {
        uint32 creatureId = pData->creature_id[i];
        if (!creatureId)
            break;

        auto itr2 = currentLimits.find(creatureId);
        if (itr2 == currentLimits.end() || itr2->second.second > 0)
            availableIds.insert(creatureId);
    }

    if (availableIds.empty())
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CREATURE GROUPS: Unable to select creature id for %s", guid.GetString().c_str());
        return pData->ChooseCreatureId();
    }

    // check minimum count
    for (auto const& itr : currentLimits)
    {
        if (itr.second.first > 0 && availableIds.find(itr.first) != availableIds.end())
        {
            if (nonSpawnedMembers.empty())
                return itr.first;

            uint32 otherSpawnsWithEntryCount = 0;
            for (auto const& memberGuid : nonSpawnedMembers)
            {
                if (CreatureData const* pMemberData = sObjectMgr.GetCreatureData(memberGuid.GetCounter()))
                {
                    if (pMemberData->HasCreatureId(itr.first))
                        otherSpawnsWithEntryCount++;
                }
            }

            // Not enough unspawned points left to satisfy min limit. We must select this creature id.
            if (otherSpawnsWithEntryCount <= itr.second.first)
                return itr.first;
        }
    }

    uint32 selectedIndex = urand(0, availableIds.size() - 1);
    auto itr3 = availableIds.begin();
    std::advance(itr3, selectedIndex);
    return *itr3;
}

bool CreatureGroupMember::ComputeRelativePosition(float leaderAngle, float &x, float &y) const
{
    x = cos(followAngle + leaderAngle) * followDistance;
    y = sin(followAngle + leaderAngle) * followDistance;
    return true;
}

ObjectGuid CreatureGroupsManager::ConvertDBGuid(uint32 guidlow)
{
    if (CreatureData const* data = sObjectMgr.GetCreatureData(guidlow))
        return data->GetObjectGuid(guidlow);
    return ObjectGuid();
}

void CreatureGroupsManager::Load()
{
    uint32 oldMSTime = WorldTimer::getMSTime();

    // Memory leak, but we cannot delete the loaded groups, since pointer may be present at loaded creatures
    m_groups.clear();

    std::unique_ptr<QueryResult> result(WorldDatabase.Query("SELECT `leader_guid`, `member_guid`, `dist`, `angle`, `flags` FROM `creature_groups` ORDER BY `leader_guid`"));

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, ">>  Loaded 0 creature groups. DB table `creature_groups` is empty!");
        return;
    }

    uint32 count = 0;
    Field* fields;
    CreatureGroup *currentGroup = nullptr;
    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();
        fields = result->Fetch();

        //Load group member data
        ObjectGuid leaderGuid = ConvertDBGuid(fields[0].GetUInt32());
        ObjectGuid memberGuid = ConvertDBGuid(fields[1].GetUInt32());
        if (leaderGuid.IsEmpty())
        {
            if (!sObjectMgr.IsExistingCreatureGuid(fields[0].GetUInt32()))
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CREATURE GROUPS: Bad leader guid %u", fields[0].GetUInt32());
        }
        else if (memberGuid.IsEmpty())
        {
            if (!sObjectMgr.IsExistingCreatureGuid(fields[1].GetUInt32()))
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CREATURE GROUPS: Bad member guid %u", fields[1].GetUInt32());
        }
        else
        {
            if (!currentGroup || leaderGuid != currentGroup->GetOriginalLeaderGuid())
            {
                currentGroup = new CreatureGroup(leaderGuid);
                RegisterNewGroup(currentGroup);
            }
            currentGroup->AddMember(memberGuid, fields[2].GetFloat(), fields[3].GetFloat(), fields[4].GetUInt32());
            ++count;
        }
    }
    while (result->NextRow());

    result = WorldDatabase.Query("SELECT `leader_guid`, `creature_id`, `min_count`, `max_count` FROM `creature_groups_entry_limit` ORDER BY `leader_guid`");

    if (result)
    {
        Field* fields;
        CreatureGroup *currentGroup = nullptr;

        do
        {
            fields = result->Fetch();

            //Load group member data
            ObjectGuid leaderGuid = ConvertDBGuid(fields[0].GetUInt32());
            uint32 creatureId = fields[1].GetUInt32();
            int32 minCount = fields[2].GetInt32();
            int32 maxCount = fields[3].GetInt32();

            if (maxCount <= 0)
                maxCount = INT_MAX;
            else if (minCount > maxCount)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CREATURE GROUPS: Min count %u is bigger than Max count %u for id %u in group with leader guid %u", minCount, maxCount, creatureId, fields[0].GetUInt32());
                continue;
            }

            if (!sObjectMgr.GetCreatureTemplate(creatureId))
            {
                if (!sObjectMgr.IsExistingCreatureId(creatureId))
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CREATURE GROUPS: Bad creature id %u", creatureId);
                continue;
            }
            
            if (leaderGuid.IsEmpty())
            {
                if (!sObjectMgr.IsExistingCreatureGuid(fields[0].GetUInt32()))
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CREATURE GROUPS: Bad leader guid %u", fields[0].GetUInt32());
            }
            else
            {
                if (!currentGroup || leaderGuid != currentGroup->GetOriginalLeaderGuid())
                {
                    currentGroup = nullptr;
                    for (const auto& itr : m_groups)
                    {
                        if (itr.first == leaderGuid)
                        {
                            currentGroup = itr.second;
                            break;
                        }
                    }
                }

                if (!currentGroup)
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CREATURE GROUPS: Bad leader guid %u", fields[0].GetUInt32());
                    continue;
                }
                
                currentGroup->m_entryLimits[creatureId] = std::make_pair(minCount, maxCount);
            }
        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u creature groups in %u ms", count, WorldTimer::getMSTime() - oldMSTime);
}

void CreatureGroupsManager::LoadCreatureGroup(ObjectGuid guid, CreatureGroup*& group)
{
    group = nullptr;
    for (const auto& itr : m_groups)
    {
        if (itr.first == guid || itr.second->ContainsGuid(guid))
        {
            group = itr.second;
            break;
        }
    }
}
