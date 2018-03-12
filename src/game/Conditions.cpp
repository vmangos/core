/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2017-2018 Light's Hope <https://lightshope.org>
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

#include "Unit.h"
#include "Player.h"
#include "GameEventMgr.h"
#include "SpellAuras.h"
#include "InstanceData.h"
#include "HardcodedEvents.h"
#include "World.h"

char const* conditionSourceToStr[] =
{
    "loot system",
    "referencing loot",
    "gossip menu",
    "gossip menu option",
    "event AI",
    "hardcoded",
    "vendor's item check",
    "spell_area check",
    "DBScript engine"
};

// Stores what params need to be provided to each condition type.
// (source, target, map)
uint8 const ConditionTargetsInternal[] =
{
    CONDITION_REQ_NONE,               // -3
    CONDITION_REQ_NONE,               // -2
    CONDITION_REQ_NONE,               // -1
    CONDITION_REQ_NONE,               //  0
    CONDITION_REQ_TARGET_UNIT,        //  1
    CONDITION_REQ_TARGET_PLAYER,      //  2
    CONDITION_REQ_TARGET_PLAYER,      //  3
    CONDITION_REQ_ANY_WORLDOBJECT,    //  4
    CONDITION_REQ_TARGET_PLAYER,      //  5
    CONDITION_REQ_TARGET_PLAYER,      //  6
    CONDITION_REQ_TARGET_PLAYER,      //  7
    CONDITION_REQ_TARGET_PLAYER,      //  8
    CONDITION_REQ_TARGET_PLAYER,      //  9
    CONDITION_REQ_TARGET_PLAYER,      //  10
    CONDITION_REQ_NONE,               //  11
    CONDITION_REQ_NONE,               //  12
    CONDITION_REQ_ANY_WORLDOBJECT,    //  13
    CONDITION_REQ_TARGET_PLAYER,      //  14
    CONDITION_REQ_TARGET_UNIT,        //  15
    CONDITION_REQ_SOURCE_WORLDOBJECT, //  16
    CONDITION_REQ_TARGET_PLAYER,      //  17
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  18
    CONDITION_REQ_TARGET_PLAYER,      //  19
    CONDITION_REQ_TARGET_WORLDOBJECT, //  20
    CONDITION_REQ_TARGET_WORLDOBJECT, //  21
    CONDITION_REQ_TARGET_PLAYER,      //  22
    CONDITION_REQ_TARGET_PLAYER,      //  23
    CONDITION_REQ_NONE,               //  24
    CONDITION_REQ_NONE,               //  25
    CONDITION_REQ_NONE,               //  26
    CONDITION_REQ_TARGET_WORLDOBJECT, //  27
    CONDITION_REQ_TARGET_PLAYER,      //  28
    CONDITION_REQ_TARGET_PLAYER,      //  29
    CONDITION_REQ_TARGET_PLAYER,      //  30
    CONDITION_REQ_SOURCE_WORLDOBJECT, //  31
    CONDITION_REQ_SOURCE_CREATURE,    //  32
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  33
};

// Starts from 4th element so that -3 will return first element.
uint8 const* ConditionTargets = &ConditionTargetsInternal[3];

// Checks if player meets the condition
bool ConditionEntry::Meets(WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const
{
    DEBUG_LOG("Condition-System: Check condition %u, type %i - called from %s with params target: %s, map %i, source %s",
              m_entry, m_condition, conditionSourceToStr[conditionSourceType], target ? target->GetGuidStr().c_str() : "<NULL>", map ? map->GetId() : -1, source ? source->GetGuidStr().c_str() : "<NULL>");

    if (m_flags & CONDITION_FLAG_SWAP_TARGETS)
        std::swap(source, target);

    if (!CheckParamRequirements(target, map, source))
    {
        sLog.outErrorDb("CONDITION %u type %u used with bad parameters, called from %s, used with target: %s, map %i, source %s",
            m_entry, m_condition, conditionSourceToStr[conditionSourceType], target ? target->GetGuidStr().c_str() : "NULL", map ? map->GetId() : -1, source ? source->GetGuidStr().c_str() : "NULL");
        return false;
    } 

    bool result = Evaluate(target, map, source, conditionSourceType);

    if (m_flags & CONDITION_FLAG_REVERSE_RESULT)
        result = !result;

    return result;
}

// Actual evaluation of the condition done here.
bool inline ConditionEntry::Evaluate(WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const
{
    switch (m_condition)
    {
        case CONDITION_NOT:
        {
            // Checked on load
            return !sConditionStorage.LookupEntry<ConditionEntry>(m_value1)->Meets(target, map, source, conditionSourceType);
        }
        case CONDITION_OR:
        {
            // Checked on load
            return sConditionStorage.LookupEntry<ConditionEntry>(m_value1)->Meets(target, map, source, conditionSourceType) || sConditionStorage.LookupEntry<ConditionEntry>(m_value2)->Meets(target, map, source, conditionSourceType);
        }
        case CONDITION_AND:
        {
            // Checked on load
            return sConditionStorage.LookupEntry<ConditionEntry>(m_value1)->Meets(target, map, source, conditionSourceType) && sConditionStorage.LookupEntry<ConditionEntry>(m_value2)->Meets(target, map, source, conditionSourceType);
        }
        case CONDITION_NONE:
        {
            return true;                                    // empty condition, always met
        }
        case CONDITION_AURA:
        {
            return target->ToUnit()->HasAura(m_value1, SpellEffectIndex(m_value2));
        }
        case CONDITION_ITEM:
        {
            return target->ToPlayer()->HasItemCount(m_value1, m_value2);
        }
        case CONDITION_ITEM_EQUIPPED:
        {
            return target->ToPlayer()->HasItemWithIdEquipped(m_value1, 1);
        }
        case CONDITION_AREAID:
        {
            uint32 zone, area;
            WorldObject const* searcher = source ? source : target;
            searcher->GetZoneAndAreaId(zone, area);
            return ((zone == m_value1 || area == m_value1) == (m_value2 == 0));
        }
        case CONDITION_REPUTATION_RANK_MIN:
        {
            FactionEntry const* faction = sObjectMgr.GetFactionEntry(m_value1);
            return (target->ToPlayer()->GetReputationMgr().GetRank(faction) >= ReputationRank(m_value2));
        }
        case CONDITION_TEAM:
        {
            return (uint32(target->ToPlayer()->GetTeam()) == m_value1);
        }
        case CONDITION_SKILL:
        {
            Player const* pPlayer = target->ToPlayer();
            return (pPlayer->HasSkill(m_value1) && pPlayer->GetBaseSkillValue(m_value1) >= m_value2);
        }
        case CONDITION_QUESTREWARDED:
        {
            return target->ToPlayer()->GetQuestRewardStatus(m_value1);
        }
        case CONDITION_QUESTTAKEN:
        {
            return target->ToPlayer()->IsCurrentQuest(m_value1, m_value2);
        }
        case CONDITION_AD_COMMISSION_AURA:
        {
            Unit::SpellAuraHolderMap const& auras = target->ToPlayer()->GetSpellAuraHolderMap();
            for (Unit::SpellAuraHolderMap::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
                if ((itr->second->GetSpellProto()->Attributes & SPELL_ATTR_CASTABLE_WHILE_MOUNTED || itr->second->GetSpellProto()->Attributes & SPELL_ATTR_IS_ABILITY) && itr->second->GetSpellProto()->SpellVisual == 3580)
                    return true;
            return false;
        }
        case CONDITION_WAR_EFFORT_STAGE:
        {
            uint32 stage = sObjectMgr.GetSavedVariable(VAR_WE_STAGE, 0);
            switch (m_value2)
            {
                case 0:
                    return stage >= m_value1;
                case 1:
                    return stage == m_value1;
                case 2:
                    return stage <= m_value1;
            }
            return false;
        }
        case CONDITION_ACTIVE_GAME_EVENT:
        {
            return sGameEventMgr.IsActiveEvent(m_value1);
        }
        case CONDITION_AREA_FLAG:
        {
            WorldObject const* searcher = source ? source : target;
            if (const auto *pAreaEntry = AreaEntry::GetById(searcher->GetAreaId()))
                if ((!m_value1 || (pAreaEntry->Flags & m_value1)) && (!m_value2 || !(pAreaEntry->Flags & m_value2)))
                    return true;
            return false;
        }
        case CONDITION_RACE_CLASS:
        {
            Player const* pPlayer = target->ToPlayer();
            if ((!m_value1 || (pPlayer->getRaceMask() & m_value1)) && (!m_value2 || (pPlayer->getClassMask() & m_value2)))
                return true;
            return false;
        }
        case CONDITION_LEVEL:
        {
            Unit const* pTarget = target->ToUnit();
            switch (m_value2)
            {
                case 0:
                    return pTarget->getLevel() == m_value1;
                case 1:
                    return pTarget->getLevel() >= m_value1;
                case 2:
                    return pTarget->getLevel() <= m_value1;
            }
            return false;
        }
        case CONDITION_SOURCE_ENTRY:
        {
            switch (m_value2)
            {
                case 0:
                    return source->GetEntry() != m_value1;
                case 1:
                    return source->GetEntry() == m_value1;
            }
            return false;
        }
        case CONDITION_SPELL:
        {
            Player const* pPlayer = target->ToPlayer();
            switch (m_value2)
            {
                case 0:
                    return pPlayer->HasSpell(m_value1);
                case 1:
                    return !pPlayer->HasSpell(m_value1);
            }
            return false;
        }
        case CONDITION_INSTANCE_SCRIPT:
        {
            Player const* pPlayer = target  ? target->ToPlayer() : nullptr;
            if (!map)
                map = pPlayer ? pPlayer->GetMap() : source->GetMap();

            if (InstanceData const* data = map->GetInstanceData())
                return data->CheckConditionCriteriaMeet(pPlayer, m_value1, source, m_value2);
            return false;
        }
        case CONDITION_QUESTAVAILABLE:
        {
            return target->ToPlayer()->CanTakeQuest(sObjectMgr.GetQuestTemplate(m_value1), false);
        }
        case CONDITION_NEARBY_CREATURE:
        {
            return (bool)(target->FindNearestCreature(m_value1, m_value2));
        }
        case CONDITION_NEARBY_GAMEOBJECT:
        {
            return (bool)(target->FindNearestGameObject(m_value1, m_value2));
        }
        case CONDITION_QUEST_NONE:
        {
            Player const* pPlayer = target->ToPlayer();
            if (!pPlayer->IsCurrentQuest(m_value1) && !pPlayer->GetQuestRewardStatus(m_value1))
                return true;
            return false;
        }
        case CONDITION_ITEM_WITH_BANK:
        {
            return target->ToPlayer()->HasItemCount(m_value1, m_value2, true);
        }
        case CONDITION_WOW_PATCH:
        {
            switch (m_value2)
            {
                case 0:
                    return sWorld.GetWowPatch() == m_value1;
                case 1:
                    return sWorld.GetWowPatch() >= m_value1;
                case 2:
                    return sWorld.GetWowPatch() <= m_value1;
            }
            return false;
        }
        case CONDITION_DEAD_OR_AWAY:
        {
            Player const* pPlayer = (target && (target->GetTypeId() == TYPEID_PLAYER)) ? static_cast<Player const*>(target) : nullptr;
            switch (m_value1)
            {
                case 0:                                     // Player dead or out of range
                    return !pPlayer || !pPlayer->isAlive() || (m_value2 && source && !source->IsWithinDistInMap(pPlayer, m_value2));
                case 1:                                     // All players in Group dead or out of range
                    if (!pPlayer)
                        return true;
                    if (Group* grp = ((Player*)pPlayer)->GetGroup())
                    {
                        for (GroupReference* itr = grp->GetFirstMember(); itr != NULL; itr = itr->next())
                        {
                            Player* pl = itr->getSource();
                            if (pl && pl->isAlive() && !pl->isGameMaster() && (!m_value2 || !source || source->IsWithinDistInMap(pl, m_value2)))
                                return false;
                        }
                        return true;
                    }
                    else
                        return !pPlayer->isAlive() || (m_value2 && source && !source->IsWithinDistInMap(pPlayer, m_value2));
                case 2:                                     // All players in instance dead or out of range
                    if (!map && (target || source))
                        map = source ? source->GetMap() : target->GetMap();
                    if (!map || !map->Instanceable())
                    {
                        sLog.outErrorDb("CONDITION_DEAD_OR_AWAY %u (Player in instance case) - called from %s without map param or from non-instanceable map %i", m_entry, conditionSourceToStr[conditionSourceType], map ? map->GetId() : -1);
                        return false;
                    }
                    for (Map::PlayerList::const_iterator itr = map->GetPlayers().begin(); itr != map->GetPlayers().end(); ++itr)
                    {
                        Player const* plr = itr->getSource();
                        if (plr && plr->isAlive() && !plr->isGameMaster() && (!m_value2 || !source || source->IsWithinDistInMap(plr, m_value2)))
                            return false;
                    }
                    return true;
                case 3:                                     // Creature source is dead
                    return !source || source->GetTypeId() != TYPEID_UNIT || !((Unit*)source)->isAlive();
            }
            break;
        }
        case CONDITION_ACTIVE_HOLIDAY:
        {
            return sGameEventMgr.IsActiveHoliday(HolidayIds(m_value1));
        }
        case CONDITION_TARGET_GENDER:
        {
            return target->getGender() == m_value1;
        }
        case CONDITION_LEARNABLE_ABILITY:
        {
            Player const* pPlayer = target->ToPlayer();
            // Already know the spell
            if (pPlayer->HasSpell(m_value1))
                return false;

            // If item defined, check if player has the item already.
            if (m_value2)
            {
                // Hard coded item count. This should be ok, since the intention with this condition is to have
                // a all-in-one check regarding items that learn some ability (primary/secondary tradeskills).
                // Commonly, items like this is unique and/or are not expected to be obtained more than once.
                if (pPlayer->HasItemCount(m_value2, 1, true))
                    return false;
            }

            bool isSkillOk = false;

            SkillLineAbilityMapBounds bounds = sSpellMgr.GetSkillLineAbilityMapBounds(m_value1);

            for (SkillLineAbilityMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
            {
                const SkillLineAbilityEntry* skillInfo = itr->second;

                if (!skillInfo)
                    continue;

                // doesn't have skill
                if (!pPlayer->HasSkill(skillInfo->skillId))
                    return false;

                // doesn't match class
                if (skillInfo->classmask && (skillInfo->classmask & pPlayer->getClassMask()) == 0)
                    return false;

                // doesn't match race
                if (skillInfo->racemask && (skillInfo->racemask & pPlayer->getRaceMask()) == 0)
                    return false;

                // skill level too low
                if (skillInfo->min_value > pPlayer->GetSkillValue(skillInfo->skillId))
                    return false;

                isSkillOk = true;
                break;
            }

            if (isSkillOk)
                return true;

            return false;
        }
        case CONDITION_SKILL_BELOW:
        {
            Player const* pPlayer = target->ToPlayer();
            if (m_value2 == 1)
                return !pPlayer->HasSkill(m_value1);
            else
                return pPlayer->HasSkill(m_value1) && pPlayer->GetBaseSkillValue(m_value1) < m_value2;
        }
        case CONDITION_REPUTATION_RANK_MAX:
        {
            FactionEntry const* faction = sObjectMgr.GetFactionEntry(m_value1);
            return (target->ToPlayer()->GetReputationMgr().GetRank(faction) <= ReputationRank(m_value2));
        }
        case CONDITION_HAS_FLAG:
        {
            if (m_value1 <= OBJECT_FIELD_ENTRY || m_value1 >= source->GetValuesCount())
            {
                sLog.outError("CONDITION_HAS_FLAG call for wrong field %u (max count: %u) in object (TypeId: %u).",
                    m_value1, source->GetValuesCount(), source->GetTypeId());
                return false;
            }
            return source->HasFlag(m_value1, m_value2);
        }
        case CONDITION_LAST_WAYPOINT:
        {
            uint32 lastReachedWp = ((Creature*)source)->GetMotionMaster()->getLastReachedWaypoint();
            switch (m_value2)
            {
                case 0:
                    return m_value1 == lastReachedWp;
                case 1:
                    return m_value1 <= lastReachedWp;
                case 2:
                    return m_value1 > lastReachedWp;
            }
            return false;
        }
        case CONDITION_MAP_ID:
        {
            uint32 mapId = map ? map->GetId() : (source ? source->GetMapId() : target->GetMapId());

            if (mapId == m_value1)
                return true;

            return false;
        }
    }
    return false;
}

// Which params must be provided to a Condition
bool ConditionEntry::CheckParamRequirements(WorldObject const* target, Map const* map, WorldObject const* source) const
{
    switch (ConditionTargets[m_condition])
    {
        case CONDITION_REQ_NONE:
            return true;
        case CONDITION_REQ_TARGET_WORLDOBJECT:
            if (target)
                return true;
            return false;
        case CONDITION_REQ_TARGET_GAMEOBJECT:
            if (target && target->IsGameObject())
                return true;
            return false;
        case CONDITION_REQ_TARGET_UNIT:
            if (target && target->IsUnit())
                return true;
            return false;
        case CONDITION_REQ_TARGET_CREATURE:
            if (target && target->IsCreature())
                return true;
            return false;
        case CONDITION_REQ_TARGET_PLAYER:
            if (target && target->IsPlayer())
                return true;
            return false;
        case CONDITION_REQ_SOURCE_WORLDOBJECT:
            if (source)
                return true;
            return false;
        case CONDITION_REQ_SOURCE_GAMEOBJECT:
            if (source && source->IsGameObject())
                return true;
            return false;
        case CONDITION_REQ_SOURCE_UNIT:
            if (source && source->IsUnit())
                return true;
            return false;
        case CONDITION_REQ_SOURCE_CREATURE:
            if (source && source->IsCreature())
                return true;
            return false;
        case CONDITION_REQ_SOURCE_PLAYER:
            if (source && source->IsPlayer())
                return true;
            return false;
        case CONDITION_REQ_ANY_WORLDOBJECT:
            if (source || target)
                return true;
            return false;
        case CONDITION_REQ_MAP_OR_WORLDOBJECT:
            if (map || source || target)
                return true;
            return false;
    }
    
    return true;
}

// Verification of condition values validity
bool ConditionEntry::IsValid()
{
    switch (m_condition)
    {
        case CONDITION_NOT:
        {
            if (m_value1 >= m_entry)
            {
                sLog.outErrorDb("CONDITION_NOT (entry %u, type %d) has invalid value1 %u, must be lower than entry, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            const ConditionEntry* condition1 = sConditionStorage.LookupEntry<ConditionEntry>(m_value1);
            if (!condition1)
            {
                sLog.outErrorDb("CONDITION_NOT (entry %u, type %d) has value1 %u without proper condition, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_OR:
        case CONDITION_AND:
        {
            if (m_value1 >= m_entry)
            {
                sLog.outErrorDb("CONDITION _AND or _OR (entry %u, type %d) has invalid value1 %u, must be lower than entry, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 >= m_entry)
            {
                sLog.outErrorDb("CONDITION _AND or _OR (entry %u, type %d) has invalid value2 %u, must be lower than entry, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            const ConditionEntry* condition1 = sConditionStorage.LookupEntry<ConditionEntry>(m_value1);
            if (!condition1)
            {
                sLog.outErrorDb("CONDITION _AND or _OR (entry %u, type %d) has value1 %u without proper condition, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            const ConditionEntry* condition2 = sConditionStorage.LookupEntry<ConditionEntry>(m_value2);
            if (!condition2)
            {
                sLog.outErrorDb("CONDITION _AND or _OR (entry %u, type %d) has value2 %u without proper condition, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_AURA:
        {
            if (!sSpellMgr.GetSpellEntry(m_value1))
            {
                sLog.outErrorDb("Aura condition (entry %u, type %u) requires to have non existing spell (Id: %d), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 >= MAX_EFFECT_INDEX)
            {
                sLog.outErrorDb("Aura condition (entry %u, type %u) requires to have non existing effect index (%u) (must be 0..%u), skipped", m_entry, m_condition, m_value2, MAX_EFFECT_INDEX - 1);
                return false;
            }
            break;
        }
        case CONDITION_ITEM:
        case CONDITION_ITEM_WITH_BANK:
        {
            ItemPrototype const* proto = ObjectMgr::GetItemPrototype(m_value1);
            if (!proto)
            {
                if (!sObjectMgr.IsExistingItemId(m_value1))
                {
                    sLog.outErrorDb("Item condition (entry %u, type %u) requires to have non existing item (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    m_condition = CONDITION_NONE;
                    m_flags = CONDITION_FLAG_REVERSE_RESULT;
                    return true;
                }
            }

            if (m_value2 < 1)
            {
                sLog.outErrorDb("Item condition (entry %u, type %u) useless with count < 1, skipped", m_entry, m_condition);
                return false;
            }
            break;
        }
        case CONDITION_ITEM_EQUIPPED:
        {
            ItemPrototype const* proto = ObjectMgr::GetItemPrototype(m_value1);
            if (!proto)
            {
                if (!sObjectMgr.IsExistingItemId(m_value1))
                {
                    sLog.outErrorDb("ItemEquipped condition (entry %u, type %u) requires to have non existing item (%u) equipped, skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    m_condition = CONDITION_NONE;
                    m_flags = CONDITION_FLAG_REVERSE_RESULT;
                    return true;
                }
            }
            break;
        }
        case CONDITION_AREAID:
        {
            const auto *areaEntry = AreaEntry::GetById(m_value1);
            if (!areaEntry)
            {
                sLog.outErrorDb("Zone condition (entry %u, type %u) requires to be in non existing area (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 > 1)
            {
                sLog.outErrorDb("Zone condition (entry %u, type %u) has invalid argument %u (must be 0..1), skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_REPUTATION_RANK_MIN:
        case CONDITION_REPUTATION_RANK_MAX:
        {
            FactionEntry const* factionEntry = sObjectMgr.GetFactionEntry(m_value1);
            if (!factionEntry)
            {
                sLog.outErrorDb("Reputation condition (entry %u, type %u) requires to have reputation non existing faction (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 >= MAX_REPUTATION_RANK)
            {
                sLog.outErrorDb("Reputation condition (entry %u, type %u) has invalid rank requirement (value2 = %u) - must be between %u and %u, skipped", m_entry, m_condition, m_value2, MIN_REPUTATION_RANK, MAX_REPUTATION_RANK - 1);
                return false;
            }
            break;
        }
        case CONDITION_TEAM:
        {
            if (m_value1 != ALLIANCE && m_value1 != HORDE)
            {
                sLog.outErrorDb("Team condition (entry %u, type %u) specifies unknown team (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_SKILL:
        case CONDITION_SKILL_BELOW:
        {
            SkillLineEntry const* pSkill = sSkillLineStore.LookupEntry(m_value1);
            if (!pSkill)
            {
                sLog.outErrorDb("Skill condition (entry %u, type %u) specifies non-existing skill (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 < 1 || m_value2 > sWorld.GetConfigMaxSkillValue())
            {
                sLog.outErrorDb("Skill condition (entry %u, type %u) specifies invalid skill value (%u), skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_QUESTREWARDED:
        case CONDITION_QUESTTAKEN:
        case CONDITION_QUESTAVAILABLE:
        case CONDITION_QUEST_NONE:
        {
            Quest const* Quest = sObjectMgr.GetQuestTemplate(m_value1);
            if (!Quest)
            {
                if (!sObjectMgr.IsExistingQuestId(m_value1))
                {
                    sLog.outErrorDb("Quest condition (entry %u, type %u) specifies non-existing quest (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    m_condition = CONDITION_NONE;
                    m_flags = CONDITION_FLAG_REVERSE_RESULT;
                    return true;
                }
            }

            if (m_value2 && m_condition != CONDITION_QUESTTAKEN)
                sLog.outErrorDb("Quest condition (entry %u, type %u) has useless data in value2 (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_AD_COMMISSION_AURA:
        {
            if (m_value1)
                sLog.outErrorDb("Quest condition (entry %u, type %u) has useless data in value1 (%u)!", m_entry, m_condition, m_value1);
            if (m_value2)
                sLog.outErrorDb("Quest condition (entry %u, type %u) has useless data in value2 (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_ACTIVE_GAME_EVENT:
        {
            if (!sGameEventMgr.IsValidEvent(m_value1))
            {
                sLog.outErrorDb("(Not)Active event condition (entry %u, type %u) requires existing event id (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_AREA_FLAG:
        {
            if (!m_value1 && !m_value2)
            {
                sLog.outErrorDb("Area flag condition (entry %u, type %u) has both values like 0, skipped", m_entry, m_condition);
                return false;
            }
            break;
        }
        case CONDITION_RACE_CLASS:
        {
            if (!m_value1 && !m_value2)
            {
                sLog.outErrorDb("Race_class condition (entry %u, type %u) has both values like 0, skipped", m_entry, m_condition);
                return false;
            }

            if (m_value1 && !(m_value1 & RACEMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Race_class condition (entry %u, type %u) has invalid player class %u, skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 && !(m_value2 & CLASSMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Race_class condition (entry %u, type %u) has invalid race mask %u, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_LEVEL:
        {
            if (!m_value1 || m_value1 > sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
            {
                sLog.outErrorDb("Level condition (entry %u, type %u)has invalid level %u, skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 > 2)
            {
                sLog.outErrorDb("Level condition (entry %u, type %u) has invalid argument %u (must be 0..2), skipped", m_entry, m_condition, m_value2);
                return false;
            }

            break;
        }
        case CONDITION_SPELL:
        {
            if (!sSpellMgr.GetSpellEntry(m_value1))
            {
                sLog.outErrorDb("Spell condition (entry %u, type %u) requires to have non existing spell (Id: %d), skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 > 1)
            {
                sLog.outErrorDb("Spell condition (entry %u, type %u) has invalid argument %u (must be 0..1), skipped", m_entry, m_condition, m_value2);
                return false;
            }

            break;
        }
        case CONDITION_INSTANCE_SCRIPT:
            break;
        case CONDITION_NEARBY_CREATURE:
        {
            if (!sObjectMgr.GetCreatureTemplate(m_value1))
            {
                if (!sObjectMgr.IsExistingCreatureId(m_value1))
                {
                    sLog.outErrorDb("Nearby creature condition (entry %u, type %u) specifies non-existing creature (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    m_condition = CONDITION_NONE;
                    m_flags = CONDITION_FLAG_REVERSE_RESULT;
                    return true;
                }
            }

            if (!m_value2)
                sLog.outErrorDb("Nearby creature condition (entry %u, type %u) used without search radius (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_NEARBY_GAMEOBJECT:
        {
            if (!sObjectMgr.GetGameObjectInfo(m_value1))
            {
                if (!sObjectMgr.IsExistingGameObjectId(m_value1))
                {
                    sLog.outErrorDb("Nearby gameobject condition (entry %u, type %u) specifies non-existing gameobject (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    m_condition = CONDITION_NONE;
                    m_flags = CONDITION_FLAG_REVERSE_RESULT;
                    return true;
                }
            }

            if (!m_value2)
                sLog.outErrorDb("Nearby gameobject condition (entry %u, type %u) used without search radius (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_HAS_FLAG:
        case CONDITION_ACTIVE_HOLIDAY:
            // no way check holidays in pre-3.x
            break;
        case CONDITION_LEARNABLE_ABILITY:
        {
            SkillLineAbilityMapBounds bounds = sSpellMgr.GetSkillLineAbilityMapBounds(m_value1);

            if (bounds.first == bounds.second)
            {
                sLog.outErrorDb("Learnable ability conditon (entry %u, type %u) has spell id %u defined, but this spell is not listed in SkillLineAbility and can not be used, skipping.", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2)
            {
                ItemPrototype const* proto = ObjectMgr::GetItemPrototype(m_value2);
                if (!proto)
                {
                    if (!sObjectMgr.IsExistingItemId(m_value2))
                    {
                        sLog.outErrorDb("Learnable ability conditon (entry %u, type %u) has item entry %u defined but item does not exist, skipping.", m_entry, m_condition, m_value2);
                        return false;
                    }
                    else
                    {
                        m_condition = CONDITION_NONE;
                        m_flags = CONDITION_FLAG_REVERSE_RESULT;
                        return true;
                    }
                }
            }

            break;
        }
        case CONDITION_LAST_WAYPOINT:
        {
            if (m_value2 > 2)
            {
                sLog.outErrorDb("Last Waypoint condition (entry %u, type %u) has an invalid value in value2. (Has %u, supported 0, 1, or 2), skipping.", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_TARGET_GENDER:
        {
            if (m_value1 >= GENDER_NONE)
            {
                sLog.outErrorDb("Gender condition (entry %u, type %u) has an invalid value in value1. (Has %u, must be smaller than %u), skipping.", m_entry, m_condition, m_value1, GENDER_NONE);
                return false;
            }
            break;
        }
        case CONDITION_DEAD_OR_AWAY:
        {
            if (m_value1 >= 4)
            {
                sLog.outErrorDb("Dead condition (entry %u, type %u) has an invalid value in value1. (Has %u, must be smaller than 4), skipping.", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_WOW_PATCH:
        {
            if (m_value1 > 10)
            {
                sLog.outErrorDb("Patch condition (entry %u, type %u) has an invalid value in value1 (must be 0..10), skipping.", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 > 2)
            {
                sLog.outErrorDb("Patch condition (entry %u, type %u) has invalid argument %u (must be 0..2), skipped.", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_SOURCE_ENTRY:
        {
            if (!sObjectMgr.GetCreatureTemplate(m_value1))
            {
                if (!sObjectMgr.IsExistingCreatureId(m_value1))
                {
                    sLog.outErrorDb("NPC Entry condition (entry %u, type %u) has invalid nonexistent NPC entry %u", m_entry, m_condition, m_value2);
                    return false;
                }
                else
                {
                    m_condition = CONDITION_NONE;
                    m_flags = CONDITION_FLAG_REVERSE_RESULT;
                    return true;
                }
            }
            if (m_value2 < 0 || m_value2 > 1)
            {
                sLog.outErrorDb("NPC Entry condition (entry %u, type %u) has invalid criteria %u (must be 0 or 1)", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_WAR_EFFORT_STAGE:
        {
            if (m_value1 < 0 || m_value1 > WAR_EFFORT_STAGE_COMPLETE)
            {
                sLog.outErrorDb("War Effort stage condition (entry %u, type %u) has invalid stage %u", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 < 0 || m_value2 > 2)
            {
                sLog.outErrorDb("War Effort stage condition (entry %u, type %u) has invalid equality %u", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_MAP_ID:
        {
            if (!sMapStorage.LookupEntry<MapEntry>(m_value1))
            {
                sLog.outErrorDb("Current map condition (entry %u, type %u) has invalid Map ID %u", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_NONE:
            break;
        default:
            sLog.outErrorDb("Condition entry %u has bad type of %d, skipped ", m_entry, m_condition);
            return false;
    }
    return true;
}

// Check if a condition can be used without providing a player param
bool ConditionEntry::CanBeUsedWithoutPlayer(uint16 entry)
{
    ConditionEntry const* condition = sConditionStorage.LookupEntry<ConditionEntry>(entry);
    if (!condition)
        return false;

    switch (condition->m_condition)
    {
        case CONDITION_NOT:
            return CanBeUsedWithoutPlayer(condition->m_value1);
        case CONDITION_AND:
        case CONDITION_OR:
            return CanBeUsedWithoutPlayer(condition->m_value1) && CanBeUsedWithoutPlayer(condition->m_value2);
        default:
            if (ConditionTargets[condition->m_condition] != CONDITION_REQ_TARGET_PLAYER)
                return true;
    }
    return false;
}
