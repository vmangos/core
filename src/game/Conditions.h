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

#ifndef MANGOS_CONDITIONS_H
#define MANGOS_CONDITIONS_H

#include "SharedDefines.h"

enum ConditionType
{
    //                                                      // value1       value2  for the Condition enumed
    CONDITION_NOT                   = -3,                   // cond-id-1    0          returns !cond-id-1
    CONDITION_OR                    = -2,                   // cond-id-1    cond-id-2  returns cond-id-1 OR cond-id-2
    CONDITION_AND                   = -1,                   // cond-id-1    cond-id-2  returns cond-id-1 AND cond-id-2
    CONDITION_NONE                  = 0,                    // 0            0
    CONDITION_AURA                  = 1,                    // spell_id     effindex
    CONDITION_ITEM                  = 2,                    // item_id      count   check present req. amount items in inventory
    CONDITION_ITEM_EQUIPPED         = 3,                    // item_id      0
    CONDITION_AREAID                = 4,                    // area_id      0, 1 (0: in (sub)area, 1: not in (sub)area)
    CONDITION_REPUTATION_RANK_MIN   = 5,                    // faction_id   min_rank
    CONDITION_TEAM                  = 6,                    // player_team  0,      (469 - Alliance 67 - Horde)
    CONDITION_SKILL                 = 7,                    // skill_id     skill_value
    CONDITION_QUESTREWARDED         = 8,                    // quest_id     0
    CONDITION_QUESTTAKEN            = 9,                    // quest_id     0,1,2   for condition true while quest active (0 any state, 1 if quest incomplete, 2 if quest completed).
    CONDITION_AD_COMMISSION_AURA    = 10,                   // 0            0,      for condition true while one from AD commission aura active
    CONDITION_WAR_EFFORT_STAGE      = 11,                   // value1: the stage                      value2: 0 : >=, 1: ==, 2 <=
    CONDITION_ACTIVE_GAME_EVENT     = 12,                   // event_id     0
    CONDITION_AREA_FLAG             = 13,                   // area_flag    area_flag_not
    CONDITION_RACE_CLASS            = 14,                   // race_mask    class_mask
    CONDITION_LEVEL                 = 15,                   // player_level 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_SOURCE_ENTRY          = 16,                   // value1: the entry to check     2: 0 (not equal), 1 (equal)
    CONDITION_SPELL                 = 17,                   // spell_id     0, 1 (0: has spell, 1: hasn't spell)
    CONDITION_INSTANCE_SCRIPT       = 18,                   // map_id       instance_condition_id (instance script specific enum)
    CONDITION_QUESTAVAILABLE        = 19,                   // quest_id     0       for case when loot/gossip possible only if player can start quest
    CONDITION_NEARBY_CREATURE       = 20,                   // creature_id  search_radius
    CONDITION_NEARBY_GAMEOBJECT     = 21,                   // gobject_id   search_radius
    CONDITION_QUEST_NONE            = 22,                   // quest_id     0 (quest did not take and not rewarded)
    CONDITION_ITEM_WITH_BANK        = 23,                   // item_id      count   check present req. amount items in inventory or bank
    CONDITION_WOW_PATCH             = 24,                   // value1: wow patch setting from config (0-10)
                                                            // value2: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_DEAD_OR_AWAY          = 25,                   // value1: 0=player dead, 1=player is dead (with group dead), 2=player in instance are dead, 3=creature is dead
                                                            // value2: if != 0 only consider players in range of this value
    CONDITION_ACTIVE_HOLIDAY        = 26,                   // holiday_id   0       preferred use instead CONDITION_ACTIVE_GAME_EVENT when possible
    CONDITION_TARGET_GENDER         = 27,                   // 0=male, 1=female, 2=none (see enum Gender)
    CONDITION_LEARNABLE_ABILITY     = 28,                   // spell_id     0 or item_id
                                                            // True when player can learn ability (using min skill value from SkillLineAbility).
                                                            // Item_id can be defined in addition, to check if player has one (1) item in inventory or bank.
                                                            // When player has spell or has item (when defined), condition return false.
    CONDITION_SKILL_BELOW           = 29,                   // skill_id     skill_value
                                                            // True if player has skill skill_id and skill less than (and not equal) skill_value (for skill_value > 1)
                                                            // If skill_value == 1, then true if player has not skill skill_id
    CONDITION_REPUTATION_RANK_MAX   = 30,                   // faction_id   max_rank
    CONDITION_HAS_FLAG              = 31,                   // field_id     flag
    CONDITION_LAST_WAYPOINT         = 32,                   // waypointId   0 = exact, 1: wp <= waypointId, 2: wp > waypointId  Use to check what waypoint was last reached
    CONDITION_MAP_ID                = 33,                   // map_id
};

enum ConditionFlags
{
    CONDITION_FLAG_REVERSE_RESULT = 0x1,
    CONDITION_FLAG_SWAP_TARGETS   = 0x2
};

enum ConditionSource                                        // From where was the condition called?
{
    CONDITION_FROM_LOOT             = 0,                    // Used to check a *_loot_template entry
    CONDITION_FROM_REFERING_LOOT    = 1,                    // Used to check a entry refering to a reference_loot_template entry
    CONDITION_FROM_GOSSIP_MENU      = 2,                    // Used to check a gossip menu menu-text
    CONDITION_FROM_GOSSIP_OPTION    = 3,                    // Used to check a gossip menu option-item
    CONDITION_FROM_EVENTAI          = 4,                    // Used to check EventAI Event conditions.
    CONDITION_FROM_HARDCODED        = 5,                    // Used to check a hardcoded event - not actually a condition
    CONDITION_FROM_VENDOR           = 6,                    // Used to check a condition from a vendor
    CONDITION_FROM_SPELL_AREA       = 7,                    // Used to check a condition from spell_area table
    CONDITION_FROM_RESERVED_1       = 8,                    // reserved for 3.x and later
    CONDITION_FROM_DBSCRIPTS        = 9,                    // Used to check a condition from DB Scripts Engine
};

enum ConditionRequirement
{
    CONDITION_REQ_NONE,
    CONDITION_REQ_TARGET_WORLDOBJECT,
    CONDITION_REQ_TARGET_GAMEOBJECT,
    CONDITION_REQ_TARGET_UNIT,
    CONDITION_REQ_TARGET_CREATURE,
    CONDITION_REQ_TARGET_PLAYER,
    CONDITION_REQ_SOURCE_WORLDOBJECT,
    CONDITION_REQ_SOURCE_GAMEOBJECT,
    CONDITION_REQ_SOURCE_UNIT,
    CONDITION_REQ_SOURCE_CREATURE,
    CONDITION_REQ_SOURCE_PLAYER,
    CONDITION_REQ_ANY_WORLDOBJECT,
    CONDITION_REQ_MAP_OR_WORLDOBJECT
};

class ConditionEntry
{
    public:
        // Default constructor, required for SQL Storage (Will give errors if used elsewise)
        ConditionEntry() : m_entry(0), m_condition(CONDITION_AND), m_value1(0), m_value2(0), m_flags(0) {}

        ConditionEntry(uint16 _entry, int16 _condition, uint32 _value1, uint32 _value2, uint8 _flags)
            : m_entry(_entry), m_condition(ConditionType(_condition)), m_value1(_value1), m_value2(_value2), m_flags(_flags) {}

        // Checks correctness of values
        bool IsValid();
        static bool CanBeUsedWithoutPlayer(uint16 entry);

        // Checks if the condition is met
        bool Meets(WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const;

        Team GetTeam() const
        {
            return m_condition == CONDITION_TEAM ? Team(m_value1) : TEAM_CROSSFACTION;
        }
    private:
        bool CheckParamRequirements(WorldObject const* target, Map const* map, WorldObject const* source) const;
        bool inline Evaluate(WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const;
        uint16 m_entry;                                     // entry of the condition
        ConditionType m_condition;                          // additional condition type
        uint32 m_value1;                                    // data for the condition - see ConditionType definition
        uint32 m_value2;
        uint8 m_flags;
};

#endif
