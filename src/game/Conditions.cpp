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

#include "Conditions.h"
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
    "EventAI",
    "hardcoded",
    "vendor",
    "spell_area",
    "scripted map event",
    "script action",
    "areatrigger",
    "quest template",
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
    CONDITION_REQ_SOURCE_UNIT,        //  13
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
    CONDITION_REQ_TARGET_WORLDOBJECT, //  28
    CONDITION_REQ_TARGET_PLAYER,      //  29
    CONDITION_REQ_TARGET_PLAYER,      //  30
    CONDITION_REQ_SOURCE_WORLDOBJECT, //  31
    CONDITION_REQ_SOURCE_CREATURE,    //  32
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  33
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  34
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  35
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  36
    CONDITION_REQ_BOTH_WORLDOBJECTS,  //  37
    CONDITION_REQ_BOTH_WORLDOBJECTS,  //  38
    CONDITION_REQ_TARGET_WORLDOBJECT, //  39
    CONDITION_REQ_TARGET_UNIT,        //  40
    CONDITION_REQ_TARGET_UNIT,        //  41
    CONDITION_REQ_TARGET_UNIT,        //  42
    CONDITION_REQ_TARGET_UNIT,        //  43
    CONDITION_REQ_BOTH_WORLDOBJECTS,  //  44
    CONDITION_REQ_TARGET_PLAYER,      //  45
    CONDITION_REQ_TARGET_UNIT,        //  46
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  47
    CONDITION_REQ_TARGET_GAMEOBJECT,  //  48
    CONDITION_REQ_TARGET_GAMEOBJECT,  //  49
    CONDITION_REQ_MAP_OR_WORLDOBJECT, //  50
    CONDITION_REQ_TARGET_PLAYER,      //  51
    CONDITION_REQ_SOURCE_WORLDOBJECT, //  52
    CONDITION_REQ_NONE,               //  53
    CONDITION_REQ_TARGET_WORLDOBJECT, //  54
    CONDITION_REQ_TARGET_GAMEOBJECT,  //  55
    CONDITION_REQ_TARGET_WORLDOBJECT, //  56
};

// Starts from 4th element so that -3 will return first element.
uint8 const* ConditionTargets = &ConditionTargetsInternal[3];

// Checks if player meets the condition
bool ConditionEntry::Meets(WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Condition-System: Check condition %u, type %i - called from %s with params target: %s, map %i, source %s",
              m_entry, m_condition, conditionSourceToStr[conditionSourceType], target ? target->GetGuidStr().c_str() : "<nullptr>", map ? map->GetId() : -1, source ? source->GetGuidStr().c_str() : "<nullptr>");

    if (m_flags & CONDITION_FLAG_SWAP_TARGETS)
        std::swap(source, target);

    if (!CheckParamRequirements(target, map, source))
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION %u type %u used with bad parameters, called from %s, used with target: %s, map %i, source %s",
            m_entry, m_condition, conditionSourceToStr[conditionSourceType], target ? target->GetGuidStr().c_str() : "<nullptr>", map ? map->GetId() : -1, source ? source->GetGuidStr().c_str() : "<nullptr>");
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
            // Third and fourth condition are optional
            if (m_value3 && sConditionStorage.LookupEntry<ConditionEntry>(m_value3)->Meets(target, map, source, conditionSourceType))
                return true;
            if (m_value4 && sConditionStorage.LookupEntry<ConditionEntry>(m_value4)->Meets(target, map, source, conditionSourceType))
                return true;
            
            return sConditionStorage.LookupEntry<ConditionEntry>(m_value1)->Meets(target, map, source, conditionSourceType) || sConditionStorage.LookupEntry<ConditionEntry>(m_value2)->Meets(target, map, source, conditionSourceType);
        }
        case CONDITION_AND:
        {
            // Third and fourth condition are optional
            bool extraConditionsSatisfied = true;
            if (m_value3)
                extraConditionsSatisfied = extraConditionsSatisfied && sConditionStorage.LookupEntry<ConditionEntry>(m_value3)->Meets(target, map, source, conditionSourceType);
            if (m_value4)
                extraConditionsSatisfied = extraConditionsSatisfied && sConditionStorage.LookupEntry<ConditionEntry>(m_value4)->Meets(target, map, source, conditionSourceType);

            return extraConditionsSatisfied && sConditionStorage.LookupEntry<ConditionEntry>(m_value1)->Meets(target, map, source, conditionSourceType) && sConditionStorage.LookupEntry<ConditionEntry>(m_value2)->Meets(target, map, source, conditionSourceType);
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
            return (zone == m_value1 || area == m_value1);
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
            return (pPlayer->HasSkill(m_value1) && pPlayer->GetSkillValueBase(m_value1) >= m_value2);
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
            for (const auto& aura : auras)
                if ((aura.second->GetSpellProto()->Attributes & SPELL_ATTR_ALLOW_WHILE_MOUNTED || aura.second->GetSpellProto()->Attributes & SPELL_ATTR_IS_ABILITY) && aura.second->GetSpellProto()->SpellVisual == 3580)
                    return true;
            return false;
        }
        case CONDITION_SAVED_VARIABLE:
        {
            auto const stage = static_cast<int64>(sObjectMgr.GetSavedVariable(m_value1, 0));
            switch (m_value3)
            {
                case 0:
                    return stage == m_value2;
                case 1:
                    return stage >= m_value2;
                case 2:
                    return stage <= m_value2;
            }
            return false;
        }
        case CONDITION_ACTIVE_GAME_EVENT:
        {
            return sGameEventMgr.IsActiveEvent(m_value1);
        }
        case CONDITION_RACE_CLASS:
        {
            Player const* pPlayer = target->ToPlayer();
            return (!m_value1 || (pPlayer->GetRaceMask() & m_value1)) && (!m_value2 || (pPlayer->GetClassMask() & m_value2));
        }
        case CONDITION_LEVEL:
        {
            auto const level = static_cast<int64>(target->ToUnit()->GetLevel());
            switch (m_value2)
            {
                case 0:
                    return level == m_value1;
                case 1:
                    return level >= m_value1;
                case 2:
                    return level <= m_value1;
            }
            return false;
        }
        case CONDITION_SOURCE_ENTRY:
        {
            return (source->GetEntry() == m_value1) ||
                   (m_value2 && source->GetEntry() == m_value2) ||
                   (m_value3 && source->GetEntry() == m_value3) ||
                   (m_value4 && source->GetEntry() == m_value4);
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
                map = target ? target->GetMap() : source->GetMap();

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
            return (bool)(target->FindNearestCreature(m_value1, m_value2, !m_value3, m_value4 ? target->ToCreature() : nullptr));
        }
        case CONDITION_NEARBY_GAMEOBJECT:
        {
            return (bool)(target->FindNearestGameObject(m_value1, m_value2));
        }
        case CONDITION_QUEST_NONE:
        {
            Player const* pPlayer = target->ToPlayer();
            return !pPlayer->IsCurrentQuest(m_value1) && !pPlayer->GetQuestRewardStatus(m_value1);
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
        case CONDITION_ESCORT:
        {
            Creature const* pSource = ToCreature(source);
            Player const* pTarget = ToPlayer(target);

            if (m_value1 & CF_ESCORT_SOURCE_DEAD)
                if (!pSource || pSource->IsDead())
                    return true;

            if (m_value1 & CF_ESCORT_TARGET_DEAD)
                if (!pTarget || pTarget->IsDead() || !pTarget->IsInWorld())
                    return true;

            if (m_value2)
                if (!pSource || !pTarget || !pSource->IsWithinDistInMap(pTarget, m_value2))
                    return true;

            return false;
        }
        case CONDITION_ACTIVE_HOLIDAY:
        {
            return sGameEventMgr.IsActiveHoliday(HolidayIds(m_value1));
        }
        case CONDITION_GENDER:
        {
            return target->GetGender() == m_value1;
        }
        case CONDITION_SKILL_BELOW:
        {
            Player const* pPlayer = target->ToPlayer();
            if (m_value2 == 1)
                return !pPlayer->HasSkill(m_value1);
            else
                return pPlayer->HasSkill(m_value1) && pPlayer->GetSkillValueBase(m_value1) < m_value2;
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
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CONDITION_HAS_FLAG call for wrong field %u (max count: %u) in object (TypeId: %u).",
                    m_value1, source->GetValuesCount(), source->GetTypeId());
                return false;
            }
            return source->HasFlag(m_value1, m_value2);
        }
        case CONDITION_LAST_WAYPOINT:
        {
            auto const lastReachedWp = static_cast<int64>(((Creature*)source)->GetMotionMaster()->getLastReachedWaypoint());
            switch (m_value2)
            {
                case 0:
                    return m_value1 == lastReachedWp;
                case 1:
                    return m_value1 >= lastReachedWp;
                case 2:
                    return m_value1 <= lastReachedWp;
            }
            return false;
        }
        case CONDITION_MAP_ID:
        {
            uint32 mapId = map ? map->GetId() : (source ? source->GetMapId() : target->GetMapId());

            return mapId == m_value1;
        }
        case CONDITION_INSTANCE_DATA:
        {
            Map const* pMap = map ? map : (source ? source->GetMap() : target->GetMap());

            if (InstanceData const* data = pMap->GetInstanceData())
            {
                auto const value = static_cast<int64>(const_cast<InstanceData*>(data)->GetData(m_value1));

                switch (m_value3)
                {
                    case 0:
                        return value == m_value2;
                    case 1:
                        return value >= m_value2;
                    case 2:
                        return value <= m_value2;
                }
            }

            return false;
        }
        case CONDITION_MAP_EVENT_DATA:
        {
            Map const* pMap = map ? map : (source ? source->GetMap() : target->GetMap());

            if (ScriptedEvent const* pEvent = pMap->GetScriptedMapEvent(m_value1))
            {
                auto const value = static_cast<int64>(pEvent->GetData(m_value2));

                switch (m_value4)
                {
                    case 0:
                        return value == m_value3;
                    case 1:
                        return value >= m_value3;
                    case 2:
                        return value <= m_value3;
                }
            }
            return false;
        }
        case CONDITION_MAP_EVENT_ACTIVE:
        {
            Map const* pMap = map ? map : (source ? source->GetMap() : target->GetMap());
            return pMap->GetScriptedMapEvent(m_value1);
        }
        case CONDITION_LINE_OF_SIGHT:
        {
            return source->IsWithinLOSInMap(target);
        }
        case CONDITION_DISTANCE_TO_TARGET:
        {
            auto const distance = static_cast<int64>(source->GetDistance(target));

            switch (m_value2)
            {
                case 0:
                    return distance == m_value1;
                case 1:
                    return distance >= m_value1;
                case 2:
                    return distance <= m_value1;
            }
            return false;
        }
        case CONDITION_IS_MOVING:
        {
            return target->IsMoving();
        }
        case CONDITION_HAS_PET:
        {
            return target->ToUnit()->GetPet();
        }
        case CONDITION_HEALTH_PERCENT:
        {
            auto const hp_percent = static_cast<int64>(target->ToUnit()->GetHealthPercent());
            
            switch (m_value2)
            {
                case 0:
                    return hp_percent == m_value1;
                case 1:
                    return hp_percent >= m_value1;
                case 2:
                    return hp_percent <= m_value1;
            }
            return false;
        }
        case CONDITION_MANA_PERCENT:
        {
            auto const mana_percent = static_cast<int64>(target->ToUnit()->GetPowerPercent(POWER_MANA));

            switch (m_value2)
            {
                case 0:
                    return mana_percent == m_value1;
                case 1:
                    return mana_percent >= m_value1;
                case 2:
                    return mana_percent <= m_value1;
            }
            return false;
        }
        case CONDITION_IS_IN_COMBAT:
        {
            return target->ToUnit()->IsInCombat();
        }
        case CONDITION_IS_HOSTILE_TO:
        {
            return target->IsHostileTo(source);
        }
        case CONDITION_IS_IN_GROUP:
        {
            return target->ToPlayer()->GetGroup();
        }
        case CONDITION_IS_ALIVE:
        {
            return target->ToUnit()->IsAlive();
        }
        case CONDITION_MAP_EVENT_TARGETS:
        {
            bool bSatisfied = true;
            Map* pMap = const_cast<Map*>(map ? map : (source ? source->GetMap() : target->GetMap()));
            if (ScriptedEvent const* pEvent = pMap->GetScriptedMapEvent(m_value1))
            {
                for (const auto& eventTarget : pEvent->m_vTargets)
                {
                    WorldObject* pObject = pMap->GetWorldObject(eventTarget.target);

                    if (pObject)
                        bSatisfied = bSatisfied && sConditionStorage.LookupEntry<ConditionEntry>(m_value2)->Meets(pObject, map, source, conditionSourceType);

                    if (!bSatisfied)
                        return false;
                }
            }
            return bSatisfied;
        }
        case CONDITION_CANT_PATH_TO_VICTIM:
        {
            return source->ToUnit()->CantPathToVictim();
        }
        case CONDITION_IS_PLAYER:
        {
            return m_value1 ? (target->IsUnit() ? static_cast<Unit const*>(target)->IsCharmerOrOwnerPlayerOrPlayerItself() : false) : target->IsPlayer();
        }
        case CONDITION_OBJECT_IS_SPAWNED:
        {
            return target->ToGameObject()->isSpawned();
        }
        case CONDITION_OBJECT_LOOT_STATE:
        {
            return target->ToGameObject()->getLootState() == m_value1;
        }
        case CONDITION_OBJECT_FIT_CONDITION:
        {
            Map* pMap = const_cast<Map*>(map ? map : (source ? source->GetMap() : target->GetMap()));
            if (GameObjectData const* pGameObjectData = sObjectMgr.GetGOData(m_value1))
                if (GameObject* pGameObject = pMap->GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, pGameObjectData->id, uint32(m_value1))))
                    return sConditionStorage.LookupEntry<ConditionEntry>(m_value2)->Meets(pGameObject, map, source, conditionSourceType);
            return false;
        }
        case CONDITION_PVP_RANK:
        {
            int8 visualRank = target->ToPlayer()->GetHonorMgr().GetRank().visualRank;
            switch (m_value2)
            {
                case 0:
                    return visualRank == int8(m_value1);
                case 1:
                    return visualRank >= int8(m_value1);
                case 2:
                    return visualRank <= int8(m_value1);
            }
            return false;
        }
        case CONDITION_DB_GUID:
        {
            if (GameObject const* pGo = source->ToGameObject())
            {
                if (uint32 dbGuid = pGo->GetDBTableGUIDLow())
                    return (dbGuid == m_value1) || (dbGuid == m_value2) || (dbGuid == m_value3) || (dbGuid == m_value4);
            }
            else if (Creature const* pCreature = source->ToCreature())
            { 
                if (uint32 dbGuid = pCreature->GetDBTableGUIDLow())
                    return (dbGuid == m_value1) || (dbGuid == m_value2) || (dbGuid == m_value3) || (dbGuid == m_value4);
            }
            return false;
        }
        case CONDITION_LOCAL_TIME:
        {
            time_t rawtime;
            time(&rawtime);

            struct tm* timeinfo;
            timeinfo = localtime(&rawtime);

            return (timeinfo->tm_hour >= m_value1) && (timeinfo->tm_min >= m_value2) && (timeinfo->tm_hour <= m_value3) && (timeinfo->tm_min <= m_value4);
        }
        case CONDITION_DISTANCE_TO_POSITION:
        {
            return target->GetDistance3dToCenter(m_value1, m_value2, m_value3) <= m_value4;
        }
        case CONDITION_OBJECT_GO_STATE:
        {
            return target->ToGameObject()->GetGoState() == m_value1;
        }
        case CONDITION_NEARBY_PLAYER:
        {
            switch (m_value1)
            {
                case 0:
                    return (bool)target->FindNearestPlayer(m_value2);
                case 1:
                    return (bool)target->FindNearestHostilePlayer(m_value2);
                case 2:
                    return (bool)target->FindNearestFriendlyPlayer(m_value2);
            }
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
        case CONDITION_REQ_BOTH_WORLDOBJECTS:
            if (source && target)
                return true;
            return false;
        case CONDITION_REQ_BOTH_GAMEOBJECTS:
            if (source && source->IsGameObject() && target && target->IsGameObject())
                return true;
            return false;
        case CONDITION_REQ_BOTH_UNITS:
            if (source && source->IsUnit() && target && target->IsUnit())
                return true;
            return false;
        case CONDITION_REQ_BOTH_PLAYERS:
            if (source && source->IsPlayer() && target && target->IsPlayer())
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
            if (m_value1 >= static_cast<int64>(m_entry))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_NOT (entry %u, type %d) has invalid value1 %u, must be lower than entry, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            ConditionEntry const* condition1 = sConditionStorage.LookupEntry<ConditionEntry>(m_value1);
            if (!condition1)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_NOT (entry %u, type %d) has value1 %u without proper condition, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_OR:
        case CONDITION_AND:
        {
            if (m_value1 >= static_cast<int64>(m_entry))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has invalid value1 %u, must be lower than entry, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 >= static_cast<int64>(m_entry))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has invalid value2 %u, must be lower than entry, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            ConditionEntry const* condition1 = sConditionStorage.LookupEntry<ConditionEntry>(m_value1);
            if (!condition1)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has value1 %u without proper condition, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            ConditionEntry const* condition2 = sConditionStorage.LookupEntry<ConditionEntry>(m_value2);
            if (!condition2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has value2 %u without proper condition, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            if (m_value3)
            {
                if (m_value3 >= static_cast<int64>(m_entry))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has invalid value3 %u, must be lower than entry, skipped", m_entry, m_condition, m_value3);
                    return false;
                }
                ConditionEntry const* condition3 = sConditionStorage.LookupEntry<ConditionEntry>(m_value3);
                if (!condition3)
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has value3 %u without proper condition, skipped", m_entry, m_condition, m_value3);
                    return false;
                }
            }
            if (m_value4)
            {
                if (m_value4 >= static_cast<int64>(m_entry))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has invalid value4 %u, must be lower than entry, skipped", m_entry, m_condition, m_value4);
                    return false;
                }
                ConditionEntry const* condition4 = sConditionStorage.LookupEntry<ConditionEntry>(m_value4);
                if (!condition4)
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION _AND or _OR (entry %u, type %d) has value4 %u without proper condition, skipped", m_entry, m_condition, m_value4);
                    return false;
                }
            }
            break;
        }
        case CONDITION_AURA:
        {
            if (!sSpellMgr.GetSpellEntry(m_value1))
            {
                if (!sSpellMgr.IsExistingSpellId(m_value1))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Aura condition (entry %u, type %u) requires to have non-existent spell (Id: %d), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    DisableCondition();
                    return true;
                }
            }
            if (m_value2 >= MAX_EFFECT_INDEX)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Aura condition (entry %u, type %u) requires to have non-existent effect index (%u) (must be 0..%u), skipped", m_entry, m_condition, m_value2, MAX_EFFECT_INDEX - 1);
                return false;
            }
            break;
        }
        case CONDITION_ITEM:
        case CONDITION_ITEM_WITH_BANK:
        {
            ItemPrototype const* proto = sObjectMgr.GetItemPrototype(m_value1);
            if (!proto)
            {
                if (!sObjectMgr.IsExistingItemId(m_value1))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Item condition (entry %u, type %u) requires to have non-existent item (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    DisableCondition();
                    return true;
                }
            }

            if (m_value2 < 1)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Item condition (entry %u, type %u) useless with count < 1, skipped", m_entry, m_condition);
                return false;
            }
            break;
        }
        case CONDITION_ITEM_EQUIPPED:
        {
            ItemPrototype const* proto = sObjectMgr.GetItemPrototype(m_value1);
            if (!proto)
            {
                if (!sObjectMgr.IsExistingItemId(m_value1))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "ItemEquipped condition (entry %u, type %u) requires to have non-existent item (%u) equipped, skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    DisableCondition();
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
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Zone condition (entry %u, type %u) requires to be in non-existent area (%u), skipped", m_entry, m_condition, m_value1);
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
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Reputation condition (entry %u, type %u) requires to have reputation non-existent faction (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 >= MAX_REPUTATION_RANK)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Reputation condition (entry %u, type %u) has invalid rank requirement (value2 = %u) - must be between %u and %u, skipped", m_entry, m_condition, m_value2, MIN_REPUTATION_RANK, MAX_REPUTATION_RANK - 1);
                return false;
            }
            break;
        }
        case CONDITION_TEAM:
        {
            if (m_value1 != ALLIANCE && m_value1 != HORDE)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Team condition (entry %u, type %u) specifies unknown team (%u), skipped", m_entry, m_condition, m_value1);
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
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Skill condition (entry %u, type %u) specifies non-existent skill (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 < 1 || m_value2 > sWorld.GetConfigMaxSkillValue())
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Skill condition (entry %u, type %u) specifies invalid skill value (%u), skipped", m_entry, m_condition, m_value2);
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
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Quest condition (entry %u, type %u) specifies non-existent quest (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    DisableCondition();
                    return true;
                }
            }

            if (m_value2 && m_condition != CONDITION_QUESTTAKEN)
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Quest condition (entry %u, type %u) has useless data in value2 (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_AD_COMMISSION_AURA:
        {
            if (m_value1)
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Quest condition (entry %u, type %u) has useless data in value1 (%u)!", m_entry, m_condition, m_value1);
            if (m_value2)
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Quest condition (entry %u, type %u) has useless data in value2 (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_ACTIVE_GAME_EVENT:
        {
            if (!sGameEventMgr.IsValidEvent(m_value1))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "(Not)Active event condition (entry %u, type %u) requires existing event id (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_RACE_CLASS:
        {
            if (!m_value1 && !m_value2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Race_class condition (entry %u, type %u) has both values like 0, skipped", m_entry, m_condition);
                return false;
            }

            if (m_value1 && !(m_value1 & RACEMASK_ALL_PLAYABLE))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Race_class condition (entry %u, type %u) has invalid player class %u, skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 && !(m_value2 & CLASSMASK_ALL_PLAYABLE))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Race_class condition (entry %u, type %u) has invalid race mask %u, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_LEVEL:
        {
            if (!m_value1 || m_value1 > static_cast<int64>(sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL)))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Level condition (entry %u, type %u)has invalid level %u, skipped", m_entry, m_condition, m_value1);
                return false;
            }

            if (m_value2 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Level condition (entry %u, type %u) has invalid argument %u (must be 0..2), skipped", m_entry, m_condition, m_value2);
                return false;
            }

            break;
        }
        case CONDITION_SPELL:
        {
            if (!sSpellMgr.GetSpellEntry(m_value1))
            {
                if (!sSpellMgr.IsExistingSpellId(m_value1))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Spell condition (entry %u, type %u) requires to have non-existent spell (Id: %d), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    DisableCondition();
                    return true;
                }
            }

            if (m_value2 > 1)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Spell condition (entry %u, type %u) has invalid argument %u (must be 0..1), skipped", m_entry, m_condition, m_value2);
                return false;
            }

            break;
        }
        case CONDITION_NEARBY_CREATURE:
        {
            if (!sObjectMgr.GetCreatureTemplate(m_value1))
            {
                if (!sObjectMgr.IsExistingCreatureId(m_value1))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Nearby creature condition (entry %u, type %u) specifies non-existent creature (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    DisableCondition();
                    return true;
                }
            }

            if (!m_value2)
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Nearby creature condition (entry %u, type %u) used without search radius (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_NEARBY_GAMEOBJECT:
        {
            if (!sObjectMgr.GetGameObjectInfo(m_value1))
            {
                if (!sObjectMgr.IsExistingGameObjectId(m_value1))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Nearby gameobject condition (entry %u, type %u) specifies non-existent gameobject (%u), skipped", m_entry, m_condition, m_value1);
                    return false;
                }
                else
                {
                    DisableCondition();
                    return true;
                }
            }

            if (!m_value2)
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Nearby gameobject condition (entry %u, type %u) used without search radius (%u)!", m_entry, m_condition, m_value2);
            break;
        }
        case CONDITION_LAST_WAYPOINT:
        {
            if (m_value2 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Last Waypoint condition (entry %u, type %u) has an invalid value in value2. (Has %u, supported 0, 1, or 2), skipping.", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_GENDER:
        {
            if (m_value1 >= GENDER_NONE)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Gender condition (entry %u, type %u) has an invalid value in value1. (Has %u, must be smaller than %u), skipping.", m_entry, m_condition, m_value1, GENDER_NONE);
                return false;
            }
            break;
        }
        case CONDITION_ESCORT:
        {
            break;
        }
        case CONDITION_WOW_PATCH:
        {
            if (m_value1 > 10)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Patch condition (entry %u, type %u) has an invalid value in value1 (must be 0..10), skipping.", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Patch condition (entry %u, type %u) has invalid argument %u (must be 0..2), skipped.", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_SOURCE_ENTRY:
        {
            if (!sObjectMgr.GetCreatureTemplate(m_value1) && !sObjectMgr.GetGameObjectInfo(m_value1))
            {
                if (!sObjectMgr.IsExistingCreatureId(m_value1) && !sObjectMgr.IsExistingGameObjectId(m_value1))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "NPC Entry condition (entry %u, type %u) has invalid non-existent NPC entry %u", m_entry, m_condition, m_value2);
                    return false;
                }
                else
                {
                    DisableCondition();
                    return true;
                }
            }
            break;
        }
        case CONDITION_SAVED_VARIABLE:
        {
            if (m_value1 == VAR_WE_STAGE && (m_value2 < 0 || m_value2 > WAR_EFFORT_STAGE_COMPLETE))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "War Effort stage condition (entry %u, type %u) has invalid stage %u", m_entry, m_condition, m_value2);
                return false;
            }
            if (m_value3 < 0 || m_value3 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Saved variable condition (entry %u, type %u) has invalid equality %u", m_entry, m_condition, m_value3);
                return false;
            }
            break;
        }
        case CONDITION_MAP_ID:
        {
            if (!sMapStorage.LookupEntry<MapEntry>(m_value1))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Current map condition (entry %u, type %u) has invalid Map ID %u", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_DISTANCE_TO_TARGET:
        {
            if (m_value2 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Distance to target condition (entry %u, type %u) has invalid argument %u (must be 0..2), skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_HEALTH_PERCENT:
        case CONDITION_MANA_PERCENT:
        {
            if ((m_value1 < 1) || (m_value1 > 100))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Health or Mana percent condition (entry %u, type %u) has invalid argument %u (must be 1..100), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Health or Mana percent condition (entry %u, type %u) has invalid argument %u (must be 0..2), skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_MAP_EVENT_TARGETS:
        {
            ConditionEntry const* condition1 = sConditionStorage.LookupEntry<ConditionEntry>(m_value2);
            if (!condition1)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_MAP_EVENT_TARGETS (entry %u, type %d) has value2 %u without proper condition, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_OBJECT_LOOT_STATE:
        {
            if (m_value1 > GO_JUST_DEACTIVATED)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_OBJECT_LOOT_STATE (entry %u, type %d) has value1 %u for an invalid loot state, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_OBJECT_FIT_CONDITION:
        {
            if (!sObjectMgr.IsExistingGameObjectGuid(m_value1))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_OBJECT_FIT_CONDITION (entry %u, type %u) uses non-existent GameObject guid %u", m_entry, m_condition, m_value1);
                return false;
            }
            ConditionEntry const* condition1 = sConditionStorage.LookupEntry<ConditionEntry>(m_value2);
            if (!condition1)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_OBJECT_FIT_CONDITION (entry %u, type %d) has value2 %u without proper condition, skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_PVP_RANK:
        {
            if (m_value1 > 14)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_PVP_RANK (entry %u, type %u) has invalid honor rank %u, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_PVP_RANK (entry %u, type %u) has invalid argument %u (must be 0..2), skipped", m_entry, m_condition, m_value2);
                return false;
            }
            break;
        }
        case CONDITION_HAS_FLAG:
        {
            // Fix field id for older client builds.
            m_value1 = GetIndexOfUpdateFieldForCurrentBuild(m_value1);
            break;
        }
        case CONDITION_DB_GUID:
        {
            if (!sObjectMgr.IsExistingCreatureGuid(m_value1) && !sObjectMgr.IsExistingGameObjectGuid(m_value1))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_DB_GUID (entry %u, type %d) uses non-existent guid %u in value1, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_LOCAL_TIME:
        {
            if (m_value1 > 23)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_LOCAL_TIME (entry %u, type %d) has value1 greater than 23 hours (%u), skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 > 59)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_LOCAL_TIME (entry %u, type %d) has value2 greater than 59 minutes (%u), skipped", m_entry, m_condition, m_value2);
                return false;
            }
            if (m_value3 > 23)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_LOCAL_TIME (entry %u, type %d) has value3 greater than 23 hours (%u), skipped", m_entry, m_condition, m_value3);
                return false;
            }
            if (m_value4 > 59)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_LOCAL_TIME (entry %u, type %d) has value4 greater than 59 minutes (%u), skipped", m_entry, m_condition, m_value4);
                return false;
            }
            break;
        }
        case CONDITION_DISTANCE_TO_POSITION:
        {
            if (!MaNGOS::IsValidMapCoord(m_value1, m_value2, m_value3))
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_DISTANCE_TO_POSITION (entry %u, type %d) has invalid coordinates, skipped", m_entry, m_condition);
                return false;
            }
            if (m_value4 <= 0)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_DISTANCE_TO_POSITION (entry %u, type %d) does not have max distance set in value4, skipped", m_entry, m_condition);
                return false;
            }
            break;
        }
        case CONDITION_OBJECT_GO_STATE:
        {
            if (m_value1 > GO_STATE_ACTIVE_ALTERNATIVE)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_OBJECT_GO_STATE (entry %u, type %u) has invalid GO state %u, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            break;
        }
        case CONDITION_NEARBY_PLAYER:
        {
            if (m_value1 < 0 || m_value1 > 2)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_NEARBY_PLAYER (entry %u, type %u) has invalid value1 %u, skipped", m_entry, m_condition, m_value1);
                return false;
            }
            if (m_value2 <= 0)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CONDITION_NEARBY_PLAYER (entry %u, type %d) does not have max distance set in value2, skipped", m_entry, m_condition);
                return false;
            }
            break;
        }
        case CONDITION_NONE:
        case CONDITION_INSTANCE_SCRIPT:
        case CONDITION_ACTIVE_HOLIDAY:
        case CONDITION_INSTANCE_DATA:
        case CONDITION_MAP_EVENT_DATA:
        case CONDITION_MAP_EVENT_ACTIVE:
        case CONDITION_LINE_OF_SIGHT:
        case CONDITION_IS_MOVING:
        case CONDITION_HAS_PET:
        case CONDITION_IS_IN_COMBAT:
        case CONDITION_IS_HOSTILE_TO:
        case CONDITION_IS_IN_GROUP:
        case CONDITION_IS_ALIVE:
        case CONDITION_CANT_PATH_TO_VICTIM:
        case CONDITION_IS_PLAYER:
        case CONDITION_OBJECT_IS_SPAWNED:
            break;
        default:
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Condition entry %u has bad type of %d, skipped ", m_entry, m_condition);
            return false;
    }
    return true;
}

// Check if a condition can be used without providing a player param
bool ConditionEntry::CanBeUsedWithoutPlayer(uint32 entry)
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

bool IsConditionSatisfied(uint32 conditionId, WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType)
{
    if (ConditionEntry const* condition = sConditionStorage.LookupEntry<ConditionEntry>(conditionId))
        return condition->Meets(target, map, source, conditionSourceType);

    return false;
}