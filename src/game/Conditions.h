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
    //                                                      // Legend:
    CONDITION_NOT                   = -3,                   // Returns the opposite of the provided condition. This condition is deprecated. Use the reverse result flag.
                                                            // Requirement: None
                                                            // Value1: condition_id
    CONDITION_OR                    = -2,                   // Returns true if at least one of the provided conditions is true.
                                                            // Requirement: None
                                                            // Value1: condition_id
                                                            // Value2: condition_id
                                                            // Value3: condition_id (optional)
                                                            // Value4: condition_id (optional)
    CONDITION_AND                   = -1,                   // Returns true only if all the provided conditions are true.
                                                            // Requirement: None
                                                            // Value1: condition_id
                                                            // Value2: condition_id
                                                            // Value3: condition_id (optional)
                                                            // Value4: condition_id (optional)
    CONDITION_NONE                  = 0,                    // Always returns true. For internal use only.
                                                            // Requirement: None
    CONDITION_AURA                  = 1,                    // Checks if the unit has an aura from this spell.
                                                            // Requirement: Unit Target
                                                            // Value1: spell_id
                                                            // Value2: effindex
    CONDITION_ITEM                  = 2,                    // Checks if the player has an item in his inventory.
                                                            // Requirement: Player Target
                                                            // Value1: item_id
                                                            // Value2: count
    CONDITION_ITEM_EQUIPPED         = 3,                    // Checks if the player has equipped an item.
                                                            // Requirement: Player Target
                                                            // Value1: item_id
    CONDITION_AREAID                = 4,                    // Checks if the player is in a specific zone or area.
                                                            // Requirement: WorldObject Target or Source
                                                            // Value1: area_id
    CONDITION_REPUTATION_RANK_MIN   = 5,                    // Checks if the player's reputation with a given faction is equal or greater than.
                                                            // Requirement: Player Target
                                                            // Value1: faction_id
                                                            // Value2: min_rank
    CONDITION_TEAM                  = 6,                    // Checks if the player is a member of the specified team.
                                                            // Requirement: Player Target
                                                            // Value1: player_team (469 - Alliance 67 - Horde)
    CONDITION_SKILL                 = 7,                    // Checks if the player's skill is equal or greater than.
                                                            // Requirement: Player Target
                                                            // Value1: skill_id
                                                            // Value2: skill_value
    CONDITION_QUESTREWARDED         = 8,                    // Checks if the player has already completed a quest.
                                                            // Requirement: Player Target
                                                            // Value1: quest_id
    CONDITION_QUESTTAKEN            = 9,                    // Checks if the player has accepted a quest.
                                                            // Requirement: Player Target
                                                            // Value1: quest_id     
                                                            // Value2: 0,1,2 for condition true while quest active (0 any state, 1 if quest incomplete, 2 if quest completed).
    CONDITION_AD_COMMISSION_AURA    = 10,                   // Returns true if the player has an argent dawn commission aura.
                                                            // Requirement: Player Target
    CONDITION_WAR_EFFORT_STAGE      = 11,                   // Checks the current state of the War Effect event.
                                                            // Requirement: None
                                                            // Value1: stage
                                                            // Value2: 0 : ==, 1: >= 2 <=
    CONDITION_ACTIVE_GAME_EVENT     = 12,                   // Checks if a given game event is currently active.
                                                            // Requirement: None
                                                            // Value1: event_id
    CONDITION_CANT_PATH_TO_VICTIM   = 13,                   // Returns true if the source is chasing a victim but is unable to find a path to it.
                                                            // Requirement: Unit Source
    CONDITION_RACE_CLASS            = 14,                   // Checks if the player's race and class matches the given mask.
                                                            // Requirement: Player Target
                                                            // Value1: race_mask
                                                            // Value2: class_mask
    CONDITION_LEVEL                 = 15,                   // Checks the target's level.
                                                            // Requirement: Unit Target
                                                            // Value1: level
                                                            // Value2: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_SOURCE_ENTRY          = 16,                   // Check's if the source's entry id matches the one specified.
                                                            // Requirement: WorldObject Source
                                                            // Value1: entry
    CONDITION_SPELL                 = 17,                   // Checks if the player has learned the given spell.
                                                            // Requirement: Player Target
                                                            // Value1: spell_id
                                                            // Value2: 0, 1 (0: has spell, 1: hasn't spell)
    CONDITION_INSTANCE_SCRIPT       = 18,                   // Calls the instance script to check an internal condition.
                                                            // Requirement: Map
                                                            // Value1: map_id
                                                            // Value2: instance_condition_id (instance script specific enum)
    CONDITION_QUESTAVAILABLE        = 19,                   // Checks if the player is able to accept a quest.
                                                            // Requirement: Player Target
                                                            // Value1: quest_id
    CONDITION_NEARBY_CREATURE       = 20,                   // Checks if there is a creature nearby with the given id.
                                                            // Requirement: WorldObject Target
                                                            // Value1: creature_id
                                                            // Value2: search_radius
                                                            // Value3: dead
                                                            // Value4: not_self
    CONDITION_NEARBY_GAMEOBJECT     = 21,                   // Checks if there is a gameobject nearby with the given id.
                                                            // Requirement: WorldObject Target
                                                            // Value1: gobject_id
                                                            // Value2: search_radius
    CONDITION_QUEST_NONE            = 22,                   // Returns true if the player has not taken the given quest and has not been rewared for it before.
                                                            // Requirement: Player Target
                                                            // Value1: quest_id
    CONDITION_ITEM_WITH_BANK        = 23,                   // Checks if the player has an item in his inventory or bank.
                                                            // Requirement: Player Target
                                                            // Value1: item_id
                                                            // Value2: count
    CONDITION_WOW_PATCH             = 24,                   // Checks the current content patch. (progression system)
                                                            // Requirement: None
                                                            // Value1: patch (0-10)
                                                            // Value2: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_ESCORT                = 25,                   // Checks the alive state of the source and target, and the distance between them. Used for escorts.
                                                            // Requirement: None (optionally Creature Source, Player Target)
                                                            // Value1: flags (see enum eEscortConditionFlags)
                                                            // Value2: distance (optional)
    CONDITION_ACTIVE_HOLIDAY        = 26,                   // Checks if a given holiday is active. Recommended to use CONDITION_ACTIVE_GAME_EVENT instead.
                                                            // Requirement: None
                                                            // Value1: holiday_id
    CONDITION_GENDER                = 27,                   // Checks the target's gender.
                                                            // Requirement: WorldObject Target
                                                            // Value1: gender (0=male, 1=female, 2=none) (see enum Gender)
    CONDITION_IS_PLAYER             = 28,                   // Checks if the target is a player or belongs to a player.
                                                            // Requirement: WorldObject Target
                                                            // Value1: 0=player only, 1=player owned too
    CONDITION_SKILL_BELOW           = 29,                   // Returns true if player knows the skill id and skill is less than (and not equal to) skill_value (for skill_value > 1)
                                                            // Requirement: Player Target
                                                            // Value1: skill_id
                                                            // Value2: skill_value (if 1, then true if player does not know skill_id)
    CONDITION_REPUTATION_RANK_MAX   = 30,                   // Returns true if the player's reputation with a given faction is below or equal to the specified rank.
                                                            // Requirement: Player Target
                                                            // Value1: faction_id
                                                            // Value2: max_rank
    CONDITION_HAS_FLAG              = 31,                   // Returns true if the source has a specific flag turned on.
                                                            // Requirement: WorldObject Source
                                                            // Value1: field_id (see UpdateFields.h)
                                                            // Value2: flag
    CONDITION_LAST_WAYPOINT         = 32,                   // Checks the source creature's last reached waypoint.
                                                            // Requirement: Creature Source
                                                            // Value1: waypointId
                                                            // Value2: 0 : ==, 1: >= 2 <=
    CONDITION_MAP_ID                = 33,                   // Checks the current map id.
                                                            // Requirement: Map
                                                            // Value1: map_id
    CONDITION_INSTANCE_DATA         = 34,                   // Gets data from the instance script and checks the returned value.
                                                            // Requirement: Map
                                                            // Value1: index
                                                            // Value2: data
                                                            // Value3: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_MAP_EVENT_DATA        = 35,                   // Gets data from a scripted map event and checks the returned value.
                                                            // Requirement: Map
                                                            // Value1: event_id
                                                            // Value2: index
                                                            // Value3: data
                                                            // Value4: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_MAP_EVENT_ACTIVE      = 36,                   // Returns true if a scripted map event with this id is currently active.
                                                            // Requirement: Map
                                                            // Value1: event_id
    CONDITION_LINE_OF_SIGHT         = 37,                   // Returns true if the source and target are in line of sight of one another.
                                                            // Requirement: WorldObject Source, WorldObject Target
    CONDITION_DISTANCE              = 38,                   // Checks the distance between the provided source and target.
                                                            // Requirement: WorldObject Source, WorldObject Target
                                                            // Value1: distance
                                                            // Value2: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_IS_MOVING             = 39,                   // Returns true if the target is currently moving.
                                                            // Requirement: WorldObject Target
    CONDITION_HAS_PET               = 40,                   // Returns true if the target has a pet.
                                                            // Requirement: Unit Target
    CONDITION_HEALTH_PERCENT        = 41,                   // Checks the target's current health percent.
                                                            // Requirement: Unit Target
                                                            // Value1: hp_percent
                                                            // Value2: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_MANA_PERCENT          = 42,                   // Checks the target's current mana percent.
                                                            // Requirement: Unit Target
                                                            // Value1: mana_percent
                                                            // Value2: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_IS_IN_COMBAT          = 43,                   // Checks if the target is currently in combat.
                                                            // Requirement: Unit Target
    CONDITION_IS_HOSTILE_TO         = 44,                   // Returns true if the target is hostile to the source.
                                                            // Requirement: WorldObject Source, WorldObject Target
    CONDITION_IS_IN_GROUP           = 45,                   // Returns true if the player is in a group.
                                                            // Requirement: Player Target
    CONDITION_IS_ALIVE              = 46,                   // Returns true if the target is alive.
                                                            // Requirement: Unit Target
    CONDITION_MAP_EVENT_TARGETS     = 47,                   // Returns true if all extra targets that are part of a scripted map event satisfy the provided condition id.
                                                            // Requirement: Map
                                                            // Value1: event_id
                                                            // Value2: condition_id
    CONDITION_OBJECT_IS_SPAWNED     = 48,                   // Returns true if the gameobject is currently spawned.
                                                            // Requirement: GameObject Target
    CONDITION_OBJECT_LOOT_STATE     = 49,                   // Checks the current loot state of a GameObject.
                                                            // Requirement: GameObject Target
                                                            // Value1: loot_state (see enum LootState)
    CONDITION_OBJECT_FIT_CONDITION  = 50,                   // Returns true if a gameobject with this guid exists and it satisfies the provided condition id.
                                                            // Requirement: Map
                                                            // Value1: guid
                                                            // Value2: condition_id
    CONDITION_PVP_RANK              = 51,                   // Checks the player's honor rank.
                                                            // Requirement: Player Target
                                                            // Value1: rank
                                                            // Value2: 0, 1 or 2 (0: equal to, 1: equal or higher than, 2: equal or less than)
    CONDITION_DB_GUID               = 52,                   // Checks source object's db guid.
                                                            // Requirement: WorldObject Source
                                                            // Value1: guid
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
    CONDITION_FROM_MAP_EVENT        = 8,                    // Used to check conditions from scripted map events
    CONDITION_FROM_DBSCRIPTS        = 9,                    // Used to check a condition from DB Scripts Engine
    CONDITION_FROM_AREATRIGGER      = 10,                   // Used to check a condition from areatrigger_teleport table
    CONDITION_FROM_QUEST            = 11,
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
    CONDITION_REQ_MAP_OR_WORLDOBJECT,
    CONDITION_REQ_BOTH_WORLDOBJECTS,
    CONDITION_REQ_BOTH_GAMEOBJECTS,
    CONDITION_REQ_BOTH_UNITS,
    CONDITION_REQ_BOTH_PLAYERS,
};

enum eEscortConditionFlags
{
    CF_ESCORT_SOURCE_DEAD = 0x1,
    CF_ESCORT_TARGET_DEAD = 0x2,
};

class ConditionEntry
{
    public:
        // Default constructor, required for SQL Storage (Will give errors if used elsewise)
        ConditionEntry() : m_entry(0), m_condition(CONDITION_AND), m_value1(0), m_value2(0), m_value3(0), m_value4(0), m_flags(0) {}

        ConditionEntry(uint32 _entry, int16 _condition, uint32 _value1, uint32 _value2, uint32 _value3, uint32 _value4, uint8 _flags)
            : m_entry(_entry), m_condition(ConditionType(_condition)), m_value1(_value1), m_value2(_value2), m_value3(_value3), m_value4(_value4), m_flags(_flags) {}

        // Checks correctness of values
        bool IsValid();
        static bool CanBeUsedWithoutPlayer(uint32 entry);

        // Checks if the condition is met
        bool Meets(WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const;

        Team GetTeam() const
        {
            return m_condition == CONDITION_TEAM ? Team(m_value1) : TEAM_CROSSFACTION;
        }
    private:
        void DisableCondition() { m_condition = CONDITION_NONE; m_flags ^= CONDITION_FLAG_REVERSE_RESULT; }
        bool CheckParamRequirements(WorldObject const* target, Map const* map, WorldObject const* source) const;
        bool inline Evaluate(WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const;
        uint32 m_entry;                                     // entry of the condition
        ConditionType m_condition;                          // additional condition type
        uint32 m_value1;                                    // data for the condition - see ConditionType definition
        uint32 m_value2;
        uint32 m_value3;
        uint32 m_value4;
        uint8 m_flags;
};

// Check if a player meets condition conditionId
bool IsConditionSatisfied(uint32 conditionId, WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType);

#endif
