/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
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

#ifndef _SCRIPTMGR_H
#define _SCRIPTMGR_H

#include "Common.h"
#include "Policies/Singleton.h"
#include "ObjectGuid.h"
#include "DBCEnums.h"
#include "ace/Atomic_Op.h"

struct AreaTriggerEntry;
class Aura;
class Creature;
class CreatureAI;
class GameObject;
class GameObjectAI;
class InstanceData;
class Item;
class Map;
class Object;
class Player;
class Quest;
class SpellCastTargets;
class Unit;
class WorldObject;

// Legend:
// source - the type of object which executes the command
// target - the type of object used as target of the command if needed
// provided source - the "Object* source" provided to the command
// provided target - the "Object* target" provided to the command

// For example the talk command can be used by any WorldObject and the text will
// be said by this object. If there is also a target provided of type Unit, then
// any use of $n in the text will show the name of this unit.

// Command functions are defined in Map.h and implemented in ScriptCommands.cpp!

enum eScriptCommand
{
    SCRIPT_COMMAND_TALK                     = 0,            // source = WorldObject
                                                            // target = Unit/None
                                                            // datalong = chat_type (see enum ChatType)
                                                            // dataint = broadcast_text id. dataint2-4 optional for random selected text.
    SCRIPT_COMMAND_EMOTE                    = 1,            // source = Unit
                                                            // datalong = emote_id
    SCRIPT_COMMAND_FIELD_SET                = 2,            // source = Object
                                                            // datalong = field_id
                                                            // datalong2 = value
    SCRIPT_COMMAND_MOVE_TO                  = 3,            // source = Creature
                                                            // target = WorldObject (for datalong > 0)
                                                            // datalong = coordinates_type (see enum eMoveToCoordinateTypes)
                                                            // datalong2 = time
                                                            // datalong3 = movement_options (see enum MoveOptions)
                                                            // datalong4 = eMoveToFlags
                                                            // x/y/z/o = coordinates
    SCRIPT_COMMAND_MODIFY_FLAGS             = 4,            // source = Object
                                                            // datalong = field_id
                                                            // datalong2 = bitmask
                                                            // datalong3 = eModifyFlagsOptions
    SCRIPT_COMMAND_INTERRUPT_CASTS          = 5,            // source = Unit
                                                            // datalong = (bool) with_delayed
                                                            // datalong2 = spell_id (optional)
    SCRIPT_COMMAND_TELEPORT_TO              = 6,            // source = Unit
                                                            // datalong = map_id (only used for players but still required)
                                                            // datalong2 = teleport_options (see enum TeleportToOptions)
                                                            // x/y/z/o = coordinates
    SCRIPT_COMMAND_QUEST_EXPLORED           = 7,            // source = Player (from provided source or target)
                                                            // target = WorldObject (from provided source or target)
                                                            // datalong = quest_id
                                                            // datalong2 = distance or 0
    SCRIPT_COMMAND_KILL_CREDIT              = 8,            // source = Player (from provided source or target)
                                                            // datalong = creature entry
                                                            // datalong2 = bool (0=personal credit, 1=group credit)
    SCRIPT_COMMAND_RESPAWN_GAMEOBJECT       = 9,            // source = Map
                                                            // target = GameObject (from datalong, provided source or target)
                                                            // datalong = db_guid
                                                            // datalong2 = despawn_delay
    SCRIPT_COMMAND_TEMP_SUMMON_CREATURE     = 10,           // source = WorldObject (from provided source or buddy)
                                                            // datalong = creature_entry
                                                            // datalong2 = despawn_delay
                                                            // datalong3 = unique_limit
                                                            // datalong4 = unique_distance
                                                            // data_flags = eSummonCreatureFlags
                                                            // dataint = (bool) setRun; 0 = off (default), 1 = on
                                                            // dataint2 = eSummonCreatureFacingOptions
                                                            // x/y/z/o = coordinates
    SCRIPT_COMMAND_OPEN_DOOR                = 11,           // source = GameObject (from datalong, provided source or target)
                                                            // If provided target is BUTTON GameObject, command is run on it too.
                                                            // datalong = db_guid
                                                            // datalong2 = reset_delay
    SCRIPT_COMMAND_CLOSE_DOOR               = 12,           // source = GameObject (from datalong, provided source or target)
                                                            // If provided target is BUTTON GameObject, command is run on it too.
                                                            // datalong = db_guid
                                                            // datalong2 = reset_delay
    SCRIPT_COMMAND_ACTIVATE_OBJECT          = 13,           // source = GameObject
                                                            // target = Unit
    SCRIPT_COMMAND_REMOVE_AURA              = 14,           // source = Unit
                                                            // datalong = spell_id
    SCRIPT_COMMAND_CAST_SPELL               = 15,           // source = Unit
                                                            // target = Unit
                                                            // datalong = spell_id
                                                            // datalong2 = eCastSpellFlags
    SCRIPT_COMMAND_PLAY_SOUND               = 16,           // source = WorldObject
                                                            // target = Player/None
                                                            // datalong = sound_id
                                                            // datalong2 = ePlaySoundFlags
    SCRIPT_COMMAND_CREATE_ITEM              = 17,           // source = Player (from provided source or target)
                                                            // datalong = item_entry
                                                            // datalong2 = amount
    SCRIPT_COMMAND_DESPAWN_CREATURE         = 18,           // source = Creature
                                                            // datalong = despawn_delay
    SCRIPT_COMMAND_SET_EQUIPMENT            = 19,           // source = Creature
                                                            // datalong = (bool) reset_default
                                                            // dataint = main-hand item_id
                                                            // dataint2 = off-hand item_id
                                                            // dataint3 = ranged item_id
    SCRIPT_COMMAND_MOVEMENT                 = 20,           // source = Creature
                                                            // datalong = see enum MovementGeneratorType (not all are supported)
                                                            // datalong2 = bool_param (meaning depends on the motion type)
                                                            // datalong3 = int_param (meaning depends on the motion type)
                                                            // x = distance (only for some motion types)
                                                            // o = angle (only for some motion types)
    SCRIPT_COMMAND_SET_ACTIVEOBJECT         = 21,           // source = Creature
                                                            // datalong = (bool) 0=off, 1=on
    SCRIPT_COMMAND_SET_FACTION              = 22,           // source = Creature
                                                            // datalong = faction_Id,
                                                            // datalong2 = see enum TemporaryFactionFlags
    SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL  = 23,           // source = Creature
                                                            // datalong = creature entry/modelid (depend on datalong2)
                                                            // datalong2 = (bool) is_display_id
    SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL  = 24,           // source = Creature
                                                            // datalong = creature entry/modelid (depend on datalong2)
                                                            // datalong2 = (bool) is_display_id
    SCRIPT_COMMAND_SET_RUN                  = 25,           // source = Creature
                                                            // datalong = (bool) 0 = off, 1 = on
    SCRIPT_COMMAND_ATTACK_START             = 26,           // source = Creature
                                                            // target = Player
    SCRIPT_COMMAND_UPDATE_ENTRY             = 27,           // source = Creature
                                                            // datalong = creature_entry
                                                            // datalong2 = team for display_id (0 = alliance, 1 = horde)
    SCRIPT_COMMAND_STAND_STATE              = 28,           // source = Unit
                                                            // datalong = stand_state (enum UnitStandStateType)
    SCRIPT_COMMAND_MODIFY_THREAT            = 29,           // source = Creature
                                                            // datalong = eModifyThreatTargets
                                                            // x = percent
    SCRIPT_COMMAND_SEND_TAXI_PATH           = 30,           // source = Player
                                                            // datalong = taxi_path_id
    SCRIPT_COMMAND_TERMINATE_SCRIPT         = 31,           // source = Any
                                                            // datalong = creature_entry
                                                            // datalong2 = search_distance
                                                            // datalong3 = eTerminateScriptOptions
    SCRIPT_COMMAND_TERMINATE_CONDITION      = 32,           // source = Any
                                                            // datalong = condition_id
                                                            // datalong2 = failed_quest_id
                                                            // datalong3 = eTerminateConditionFlags
    SCRIPT_COMMAND_ENTER_EVADE_MODE         = 33,           // source = Creature
    SCRIPT_COMMAND_SET_HOME_POSITION        = 34,           // source = Creature
                                                            // datalong = (bool) use_current_position
                                                            // x/y/z/o = coordinates
    SCRIPT_COMMAND_TURN_TO                  = 35,           // source = Unit
                                                            // target = WorldObject
                                                            // datalong = eTurnToFacingOptions
    SCRIPT_COMMAND_MEETINGSTONE             = 36,           // source = Player
                                                            // datalong = area_id
    SCRIPT_COMMAND_SET_INST_DATA            = 37,           // source = Map
                                                            // datalong = field
                                                            // datalong2 = data
                                                            // datalong3 = eSetInstDataOptions
    SCRIPT_COMMAND_SET_INST_DATA64          = 38,           // source = Map
                                                            // target = Object (when saving guid)
                                                            // datalong = field
                                                            // datalong2 = data
                                                            // datalong3 = eSetInstData64Options
    SCRIPT_COMMAND_START_SCRIPT             = 39,           // source = Map
                                                            // datalong1-4 = event_script id
                                                            // dataint1-4 = chance (total cant be above 100)
    SCRIPT_COMMAND_REMOVE_ITEM              = 40,           // source = Player (from provided source or target)
                                                            // datalong = item_entry
                                                            // datalong2 = amount
    SCRIPT_COMMAND_REMOVE_OBJECT            = 41,           // source = GameObject
                                                            // target = Unit
    SCRIPT_COMMAND_MAX,

    SCRIPT_COMMAND_DISABLED                 = 9999          // Script action was disabled during loading.
};

#define MAX_TEXT_ID 4                                       // used for SCRIPT_COMMAND_TALK
static constexpr uint32 MAX_EMOTE_ID = 4;                   // used for SCRIPT_COMMAND_EMOTE

// Flags used by SCRIPT_COMMAND_MOVE_TO
enum eMoveToFlags
{
    SF_MOVETO_FORCED        = 0x1,                          // No check if creature can move.
    SF_MOVETO_POINT_MOVEGEN = 0x2,                          // Changes movement generator to point movement.
};

// Possible datalong3 values for SCRIPT_COMMAND_MOVE_TO
enum eMoveToCoordinateTypes
{
    SO_MOVETO_COORDINATES_NORMAL               = 0,
    SO_MOVETO_COORDINATES_RELATIVE_TO_TARGET   = 1,            // Coordinates are added to that of target.
    SO_MOVETO_COORDINATES_DISTANCE_FROM_TARGET = 2,            // X is distance from target, others not used.

    MOVETO_COORDINATES_MAX
};

// Possible datalong3 values for SCRIPT_COMMAND_MODIFY_FLAGS
enum eModifyFlagsOptions
{
    SO_MODIFYFLAGS_TOGGLE = 0,
    SO_MODIFYFLAGS_SET    = 1,
    SO_MODIFYFLAGS_REMOVE = 2
};

// Flags used by SCRIPT_COMMAND_TEMP_SUMMON_CREATURE
// Must start from 0x8 because of target selection flags.
enum eSummonCreatureFlags
{
    SF_SUMMONCREATURE_ACTIVE      = 0x10,                     // active creatures are always updated
    SF_SUMMONCREATURE_UNIQUE      = 0x20,                     // not actually unique, just checks for same entry in certain range
    SF_SUMMONCREATURE_UNIQUE_TEMP = 0x40                      // same as 0x10 but check for TempSummon only creatures
};

// Possible dataint2 values for SCRIPT_COMMAND_TEMP_SUMMON_CREATURE
enum eSummonCreatureFacingOptions
{
    SO_SUMMONCREATURE_FACE_SUMMONER = 1,                         // Creature will face the summoner.
    SO_SUMMONCREATURE_FACE_TARGET   = 2                          // Creature will face the provided target object.
};

// Flags used by SCRIPT_COMMAND_CAST_SPELL
enum eCastSpellFlags
{
    SF_CASTSPELL_TRIGGERED          = 0x1,                    // Triggered spells skip checks.
    SF_CASTSPELL_INTERRUPT_PREVIOUS = 0x2                     // Will interrupt the current spell cast.
};

// Flags used by SCRIPT_COMMAND_PLAY_SOUND
enum ePlaySoundFlags
{
    SF_PLAYSOUND_ONLY_TO_TARGET     = 0x1,
    SF_PLAYSOUND_DISTANCE_DEPENDENT = 0x2
};

// Possible datalong values for SCRIPT_COMMAND_MODIFY_THREAT
enum eModifyThreatTargets
{
    SO_MODIFYTHREAT_PROVIDED_TARGET = 0,
    SO_MODIFYTHREAT_CURRENT_VICTIM  = 1,
    SO_MODIFYTHREAT_ALL_ATTACKERS   = 2,

    SO_MODIFYTHREAT_MAX_TARGETS
};

// Possible datalong3 values for SCRIPT_COMMAND_TERMINATE_SCRIPT
enum eTerminateScriptOptions
{
    SO_TERMINATESCRIPT_IF_NOT_FOUND = 0,
    SO_TERMINATESCRIPT_IF_FOUND     = 1
};

// Flags used by SCRIPT_COMMAND_TERMINATE_CONDITION
enum eTerminateConditionFlags
{
    SF_TERMINATECONDITION_WHEN_FALSE = 0x1
};

// Possible datalong values for SCRIPT_COMMAND_TURN_TO
enum eTurnToFacingOptions
{
    SO_TURNTO_FACE_TARGET          = 0,
    SO_TURNTO_PROVIDED_ORIENTATION = 1
};

// Possible datalong3 values for SCRIPT_COMMAND_SET_INST_DATA
enum eSetInstDataOptions
{
    SO_INSTDATA_RAW       = 0,
    SO_INSTDATA_INCREMENT = 1,
    SO_INSTDATA_DECREMENT = 2,

    SO_INSTDATA_MAX
};

// Possible datalong3 values for SCRIPT_COMMAND_SET_INST_DATA64
enum eSetInstData64Options
{
    SO_INSTDATA64_RAW         = 0,
    SO_INSTDATA64_SOURCE_GUID = 1,

    SO_INSTDATA64_MAX
};

// Values used in buddy_type column
enum eBuddyType
{
    BUDDY_TYPE_CREATURE_ENTRY           = 0,
    BUDDY_TYPE_CREATURE_GUID            = 1,
    BUDDY_TYPE_CREATURE_INSTANCE_DATA   = 2,
    BUDDY_TYPE_GAMEOBJECT_ENTRY         = 3,
    BUDDY_TYPE_GAMEOBJECT_GUID          = 4,
    BUDDY_TYPE_GAMEOBJECT_INSTANCE_DATA = 5,
};

enum eDataFlags
{
    SF_GENERAL_SWAP_INITIAL_TARGETS = 0x1,                  // Swaps the provided source and target, before buddy is checked.
    SF_GENERAL_SWAP_FINAL_TARGETS   = 0x2,                  // Swaps the local source and target, after buddy is assigned.
    SF_GENERAL_TARGET_SELF          = 0x4,                  // Replaces the provided target with the provided source.
    SF_GENERAL_ABORT_ON_FAILURE     = 0x8                   // Terminates the script if the command fails.
};

struct ScriptInfo
{
    uint32 id;
    uint32 delay;
    uint32 command;
    uint32 condition;

    union
    {
        struct                                              // SCRIPT_COMMAND_TALK (0)
        {
            uint32 chatType;                                // datalong
            uint32 unused1;                                 // datalong2
            uint32 unused2;                                 // datalong3
            uint32 unused3;                                 // datalong4
            uint32 unused4;                                 // data_flags
            int32  textId[MAX_TEXT_ID];                     // dataint to dataint4
        } talk;

        struct                                              // SCRIPT_COMMAND_EMOTE (1)
        {
            uint32 emoteId;                                 // datalong
            uint32 unused1;                                 // datalong2
            uint32 unused2;                                 // datalong3
            uint32 unused3;                                 // datalong4
            uint32 unused4;                                 // data_flags
            uint32 randomEmotes[MAX_EMOTE_ID];              // dataint to dataint4
        } emote;

        struct                                              // SCRIPT_COMMAND_FIELD_SET (2)
        {
            uint32 fieldId;                                 // datalong
            uint32 fieldValue;                              // datalong2
        } setField;

        struct                                              // SCRIPT_COMMAND_MOVE_TO (3)
        {
            uint32 coordinatesType;                         // datalong
            uint32 travelTime;                              // datalong2
            uint32 movementOptions;                         // datalong3
            uint32 flags;                                   // datalong4
        } moveTo;

        struct                                              // SCRIPT_COMMAND_MODIFY_FLAGS (4)
        {
            uint32 fieldId;                                 // datalong
            uint32 fieldValue;                              // datalong2
            uint32 mode;                                    // datalong3
        } modFlags;

        struct                                              // SCRIPT_COMMAND_INTERRUPT_CASTS (5)
        {
            uint32 withDelayed;                             // datalong
            uint32 spellId;                                 // datalong2
        } interruptCasts;

        struct                                              // SCRIPT_COMMAND_TELEPORT_TO (6)
        {
            uint32 mapId;                                   // datalong
            uint32 teleportOptions;                         // datalong2
        } teleportTo;

        struct                                              // SCRIPT_COMMAND_QUEST_EXPLORED (7)
        {
            uint32 questId;                                 // datalong
            uint32 distance;                                // datalong2
        } questExplored;

        struct                                              // SCRIPT_COMMAND_KILL_CREDIT (8)
        {
            uint32 creatureEntry;                           // datalong
            uint32 isGroupCredit;                           // datalong2
        } killCredit;

        struct                                              // SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (9)
        {
            uint32 goGuid;                                  // datalong
            int32 despawnDelay;                             // datalong2
        } respawnGo;

        struct                                              // SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (10)
        {
            uint32 creatureEntry;                           // datalong
            uint32 despawnDelay;                            // datalong2
            uint32 uniqueLimit;                             // datalong3
            uint32 uniqueDistance;                          // datalong4
            uint32 flags;                                   // data_flags
            int32 setRun;                                   // dataint
            int32 facingLogic;                              // dataint2
        } summonCreature;

        struct                                              // SCRIPT_COMMAND_OPEN_DOOR (11)
        {
            uint32 goGuid;                                  // datalong
            int32 resetDelay;                               // datalong2
        } openDoor;

        struct                                              // SCRIPT_COMMAND_CLOSE_DOOR (12)
        {
            uint32 goGuid;                                  // datalong
            int32 resetDelay;                               // datalong2
        } closeDoor;

                                                            // SCRIPT_COMMAND_ACTIVATE_OBJECT (13)

        struct                                              // SCRIPT_COMMAND_REMOVE_AURA (14)
        {
            uint32 spellId;                                 // datalong
        } removeAura;

        struct                                              // SCRIPT_COMMAND_CAST_SPELL (15)
        {
            uint32 spellId;                                 // datalong
            uint32 flags;                                   // datalong2
        } castSpell;

        struct                                              // SCRIPT_COMMAND_PLAY_SOUND (16)
        {
            uint32 soundId;                                 // datalong
            uint32 flags;                                   // datalong2
        } playSound;

        struct                                              // SCRIPT_COMMAND_CREATE_ITEM (17)
        {
            uint32 itemEntry;                               // datalong
            uint32 amount;                                  // datalong2
        } createItem;

        struct                                              // SCRIPT_COMMAND_DESPAWN_CREATURE (18)
        {
            uint32 despawnDelay;                            // datalong
        } despawn;

        struct                                              // SCRIPT_COMMAND_SET_EQUIPMENT (19)
        {
            uint32 resetDefault;                            // datalong
            uint32 unused1;                                 // datalong2
            uint32 unused2;                                 // datalong3
            uint32 unused3;                                 // datalong4
            uint32 unused4;                                 // data_flags
            int32  slot[MAX_TEXT_ID];                       // dataint to dataint4
        } setEquipment;

        struct                                              // SCRIPT_COMMAND_MOVEMENT (20)
        {
            uint32 movementType;                            // datalong
            uint32 boolParam;                               // datalong2
            uint32 intParam;                                // datalong3
        } movement;

        struct                                              // SCRIPT_COMMAND_SET_ACTIVEOBJECT (21)
        {
            uint32 activate;                                // datalong
        } activeObject;

        struct                                              // SCRIPT_COMMAND_SET_FACTION (22)
        {
            uint32 factionId;                               // datalong
            uint32 flags;                                   // datalong2
        } faction;

        struct                                              // SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (23)
        {
            uint32 creatureOrModelEntry;                    // datalong
            uint32 isDisplayId;                             // datalong2
        } morph;

        struct                                              // SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (24)
        {
            uint32 creatureOrModelEntry;                    // datalong
            uint32 isDisplayId;                             // datalong2
        } mount;

        struct                                              // SCRIPT_COMMAND_SET_RUN (25)
        {
            uint32 run;                                     // datalong
        } run;

                                                            // SCRIPT_COMMAND_ATTACK_START (26)

        struct                                              // SCRIPT_COMMAND_UPDATE_ENTRY (27)
        {
            uint32 creatureEntry;                           // datalong
            uint32 team;                                    // datalong2
        } updateEntry;

        struct                                              // SCRIPT_COMMAND_STAND_STATE (28)
        {
            uint32 stand_state;                             // datalong
        } standState;

        struct                                              // SCRIPT_COMMAND_MODIFY_THREAT (29)
        {
            uint32 target;                                  // datalong
        } modThreat;

        struct                                              // SCRIPT_COMMAND_SEND_TAXI_PATH (30)
        {
            uint32 taxiPathId;                              // datalong
        } sendTaxiPath;

        struct                                              // SCRIPT_COMMAND_TERMINATE_SCRIPT (31)
        {
            uint32 creatureEntry;                           // datalong
            uint32 searchRadius;                            // datalong2
            uint32 flags;                                   // datalong3
        } terminateScript;

        struct                                              // SCRIPT_COMMAND_TERMINATE_CONDITION (32)
        {
            uint32 conditionId;                             // datalong
            uint32 failQuest;                               // datalong2
            uint32 flags;                                   // datalong3
        } terminateCond;

                                                            // SCRIPT_COMMAND_ENTER_EVADE_MODE (33)

        struct                                              // SCRIPT_COMMAND_SET_HOME_POSITION (34)
        {
            uint32 useCurrent;                              // datalong
        } setHome;

        struct                                              // SCRIPT_COMMAND_TURN_TO (35)
        {
            uint32 facingLogic;                             // datalong
        } turnTo;

        struct                                              // SCRIPT_COMMAND_MEETINGSTONE (36)
        {
            uint32 areaId;                                  // datalong
        } meetingstone;

        struct                                              // SCRIPT_COMMAND_SET_INST_DATA (37)
        {
            uint32 field;                                   // datalong
            uint32 data;                                    // datalong2
            uint32 type;                                    // datalong3
        } setData;

        struct                                              // SCRIPT_COMMAND_SET_INST_DATA64 (38)
        {
            uint32 field;                                   // datalong
            uint32 data;                                    // datalong2
            uint32 type;                                    // datalong3
        } setData64;

        struct                                              // SCRIPT_COMMAND_START_SCRIPT (39)
        {
            uint32 scriptId[4];                             // datalong to datalong4
            uint32 unused;                                  // data_flags
            int32 chance[4];                                // dataint to dataint4
        } startScript;

        struct                                              // SCRIPT_COMMAND_REMOVE_ITEM (40)
        {
            uint32 itemEntry;                               // datalong
            uint32 amount;                                  // datalong2
        } removeItem;

                                                            // SCRIPT_COMMAND_REMOVE_OBJECT (41)

        struct
        {
            uint32 data[9];
        } raw;
    };

    uint32 buddy_id;
    uint32 buddy_radius;
    uint8 buddy_type;

    float x;
    float y;
    float z;
    float o;

    ScriptInfo() : id(0), delay(0), command(0), condition(0), buddy_id(0), buddy_radius(0), buddy_type(0), x(0), y(0), z(0), o(0)
    {
        memset(raw.data, 0, sizeof(raw.data));
    }

    // helpers
    uint32 GetGOGuid() const
    {
        switch(command)
        {
            case SCRIPT_COMMAND_RESPAWN_GAMEOBJECT: return respawnGo.goGuid;
            case SCRIPT_COMMAND_OPEN_DOOR: return openDoor.goGuid;
            case SCRIPT_COMMAND_CLOSE_DOOR: return closeDoor.goGuid;
            default: return 0;
        }
    }
};

struct ScriptAction
{
    ObjectGuid sourceGuid;
    ObjectGuid targetGuid;
    ObjectGuid ownerGuid;                                   // owner of source if source is item
    ScriptInfo const* script;                               // pointer to static script data

    bool IsSameScript(uint32 id, ObjectGuid sourceGuid, ObjectGuid targetGuid, ObjectGuid ownerGuid) const
    {
        return id == script->id &&
            (sourceGuid == this->sourceGuid || !sourceGuid) &&
            (targetGuid == this->targetGuid || !targetGuid) &&
            (ownerGuid == this->ownerGuid || !ownerGuid);
    }
};

typedef std::multimap<uint32, ScriptInfo> ScriptMap;
typedef std::map<uint32, ScriptMap > ScriptMapMap;

extern ScriptMapMap sQuestEndScripts;
extern ScriptMapMap sQuestStartScripts;
extern ScriptMapMap sSpellScripts;
extern ScriptMapMap sCreatureSpellScripts;
extern ScriptMapMap sGameObjectScripts;
extern ScriptMapMap sEventScripts;
extern ScriptMapMap sGossipScripts;
extern ScriptMapMap sCreatureMovementScripts;

#define MAX_SCRIPTS         5000                            //72 bytes each (approx 351kb)
#define VISIBLE_RANGE       (166.0f)                        //MAX visible range (size of grid)
#define DEFAULT_TEXT        "<ScriptDev2 Text Entry Missing!>"

#define TEXT_SOURCE_RANGE -1000000                          //the amount of entries each text source has available

#define TEXT_SOURCE_TEXT_START      TEXT_SOURCE_RANGE
#define TEXT_SOURCE_TEXT_END        TEXT_SOURCE_RANGE*2 + 1

#define TEXT_SOURCE_CUSTOM_START    TEXT_SOURCE_RANGE*2
#define TEXT_SOURCE_CUSTOM_END      TEXT_SOURCE_RANGE*3 + 1

//Spell targets used by SelectSpell
enum SelectTarget
{
    SELECT_TARGET_DONTCARE = 0,                             //All target types allowed

    SELECT_TARGET_SELF,                                     //Only Self casting

    SELECT_TARGET_SINGLE_ENEMY,                             //Only Single Enemy
    SELECT_TARGET_AOE_ENEMY,                                //Only AoE Enemy
    SELECT_TARGET_ANY_ENEMY,                                //AoE or Single Enemy

    SELECT_TARGET_SINGLE_FRIEND,                            //Only Single Friend
    SELECT_TARGET_AOE_FRIEND,                               //Only AoE Friend
    SELECT_TARGET_ANY_FRIEND,                               //AoE or Single Friend
};

//Spell Effects used by SelectSpell
enum SelectEffect
{
    SELECT_EFFECT_DONTCARE = 0,                             //All spell effects allowed
    SELECT_EFFECT_DAMAGE,                                   //Spell does damage
    SELECT_EFFECT_HEALING,                                  //Spell does healing
    SELECT_EFFECT_AURA,                                     //Spell applies an aura
};

//TODO: find better namings and definitions.
//N=Neutral, A=Alliance, H=Horde.
//NEUTRAL or FRIEND = Hostility to player surroundings (not a good definition)
//ACTIVE or PASSIVE = Hostility to environment surroundings.
enum eEscortFaction
{
    FACTION_ESCORT_A_NEUTRAL_PASSIVE    = 10,
    FACTION_ESCORT_H_NEUTRAL_PASSIVE    = 33,
    FACTION_ESCORT_N_NEUTRAL_PASSIVE    = 113,

    FACTION_ESCORT_A_NEUTRAL_ACTIVE     = 231,
    FACTION_ESCORT_H_NEUTRAL_ACTIVE     = 232,
    FACTION_ESCORT_N_NEUTRAL_ACTIVE     = 250,

    FACTION_ESCORT_N_FRIEND_PASSIVE     = 290,
    FACTION_ESCORT_N_FRIEND_ACTIVE      = 495,

    FACTION_ESCORT_A_PASSIVE            = 774,
    FACTION_ESCORT_H_PASSIVE            = 775,

    FACTION_ESCORT_N_ACTIVE             = 1986,
    FACTION_ESCORT_H_ACTIVE             = 2046
};

struct ScriptPointMove
{
    uint32 uiCreatureEntry;
    uint32 uiPointId;
    float  fX;
    float  fY;
    float  fZ;
    uint32 uiWaitTime;
};

struct StringTextData
{
    uint32 SoundId;
    uint8  Type;
    uint32 Language;
    uint32 Emote;
};

struct CreatureEscortData
{
    uint32 uiCreatureEntry;
    uint32 uiQuestEntry;
    uint32 uiEscortFaction;
    uint32 uiLastWaypointEntry;
};

struct TSpellSummary
{
    uint8 Targets;                                          // set of enum SelectTarget
    uint8 Effects;                                          // set of enum SelectEffect
};

struct Script
{
    Script() :
        Name(""), pGossipHello(nullptr), pGOGossipHello(nullptr), pQuestAcceptNPC(nullptr),
        pGossipSelect(nullptr), pGOGossipSelect(nullptr),
        pGossipSelectWithCode(nullptr), pGOGossipSelectWithCode(nullptr), pQuestComplete(nullptr),
        pNPCDialogStatus(nullptr), pGODialogStatus(nullptr), pQuestRewardedNPC(nullptr), pQuestRewardedGO(nullptr), pItemHello(nullptr), pGOHello(nullptr), pAreaTrigger(nullptr),
        pProcessEventId(nullptr), pItemQuestAccept(nullptr), pGOQuestAccept(nullptr),
        pItemUse(nullptr), pEffectDummyCreature(nullptr), pEffectDummyGameObj(nullptr), pEffectDummyItem(nullptr),
        pEffectAuraDummy(nullptr), GOOpen(nullptr),
        GOGetAI(nullptr), GetAI(nullptr), GetInstanceData(nullptr)
    {}

    std::string Name;

    //Methods to be scripted
    bool (*pGossipHello             )(Player*, Creature*);
    bool (*pGOGossipHello           )(Player*, GameObject*);
    bool (*pQuestAcceptNPC          )(Player*, Creature*, Quest const*);
    bool (*pGossipSelect            )(Player*, Creature*, uint32, uint32);
    bool (*pGOGossipSelect          )(Player*, GameObject*, uint32, uint32);
    bool (*pGossipSelectWithCode    )(Player*, Creature*, uint32, uint32, const char*);
    bool (*pGOGossipSelectWithCode  )(Player*, GameObject*, uint32, uint32, const char*);
//    bool (*pQuestSelect             )(Player*, Creature*, const Quest*);
    bool (*pQuestComplete           )(Player*, Creature*, const Quest*);
    uint32 (*pNPCDialogStatus       )(Player*, Creature*);
    uint32 (*pGODialogStatus        )(Player*, GameObject*);
    bool (*pQuestRewardedNPC        )(Player*, Creature*, Quest const*);
    bool (*pQuestRewardedGO         )(Player*, GameObject*, Quest const*);
    bool (*pItemHello               )(Player*, Item*, const Quest*);
    bool (*pGOHello                 )(Player*, GameObject*);
    bool (*pAreaTrigger             )(Player*, const AreaTriggerEntry*);
    bool (*pProcessEventId          )(uint32, Object*, Object*, bool);
    bool (*pItemQuestAccept         )(Player*, Item*, const Quest*);
    bool (*pGOQuestAccept           )(Player*, GameObject*, const Quest*);
//    bool (*pGOChooseReward          )(Player*, GameObject*, const Quest*, uint32);
    bool (*pItemUse                 )(Player*, Item*, SpellCastTargets const&);
    bool (*pEffectDummyCreature     )(Unit*, uint32, SpellEffectIndex, Creature*);
    bool (*pEffectDummyGameObj      )(Unit*, uint32, SpellEffectIndex, GameObject*);
    bool (*pEffectDummyItem         )(Unit*, uint32, SpellEffectIndex, Item*);
    bool (*pEffectAuraDummy         )(const Aura*, bool);
    bool (*GOOpen                   )(Player* pUser, GameObject* gobj);
    GameObjectAI* (*GOGetAI         )(GameObject* pGo);

    CreatureAI* (*GetAI)(Creature*);
    InstanceData* (*GetInstanceData)(Map*);

    void RegisterSelf(bool reportUnused = true);
};

class ScriptMgr
{
    public:
        ScriptMgr();
        ~ScriptMgr();

        void LoadGameObjectScripts();
        void LoadQuestEndScripts();
        void LoadQuestStartScripts();
        void LoadEventScripts();
        void LoadSpellScripts();
        void LoadCreatureSpellScripts();
        void LoadGossipScripts();
        void LoadCreatureMovementScripts();

        void CheckAllScriptTexts();

        void LoadScriptNames();
        void LoadAreaTriggerScripts();
        void LoadEventIdScripts();
        
        void FillSpellSummary();

        TSpellSummary* GetSpellSummary() const { return m_spellSummary; }

        uint32 GetAreaTriggerScriptId(uint32 triggerId) const;
        uint32 GetEventIdScriptId(uint32 eventId) const;

        const char* GetScriptName(uint32 id) const { return id < m_scriptNames.size() ? m_scriptNames[id].c_str() : ""; }
        uint32 GetScriptId(const char *name) const;
        uint32 GetScriptIdsCount() const { return m_scriptNames.size(); }
        
        void Initialize();
        void LoadDatabase();

        void LoadScriptTexts();
        void LoadScriptTextsCustom();
        void LoadScriptWaypoints();
        void LoadEscortData();

        StringTextData const* GetTextData(int32 uiTextId) const
        {
            TextDataMap::const_iterator itr = m_mTextDataMap.find(uiTextId);

            if (itr == m_mTextDataMap.end())
                return nullptr;

            return &itr->second;
        }
        
        CreatureEscortData const* GetEscortData(int32 creature_id) const
        {
            EscortDataMap::const_iterator itr = m_mEscortDataMap.find(creature_id);

            if (itr == m_mEscortDataMap.end())
                return nullptr;

            return &itr->second;
        }

        std::vector<ScriptPointMove> const &GetPointMoveList(uint32 uiCreatureEntry) const
        {
            static std::vector<ScriptPointMove> vEmpty;

            auto itr = m_mPointMoveMap.find(uiCreatureEntry);

            if (itr == m_mPointMoveMap.end())
                return vEmpty;

            return itr->second;
        }

        uint32 IncreaseScheduledScriptsCount() { return (uint32)++m_scheduledScripts; }
        uint32 DecreaseScheduledScriptCount() { return (uint32)--m_scheduledScripts; }
        uint32 DecreaseScheduledScriptCount(size_t count) { return (uint32)(m_scheduledScripts -= count); }
        bool IsScriptScheduled() const { return m_scheduledScripts > 0; }

        CreatureAI* GetCreatureAI(Creature* pCreature);
        GameObjectAI* GetGameObjectAI(GameObject* pGob);
        InstanceData* CreateInstanceData(Map* pMap);

        bool OnGossipHello(Player* pPlayer, Creature* pCreature);
        bool OnGossipHello(Player* pPlayer, GameObject* pGameObject);
        bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 sender, uint32 action, const char* code);
        bool OnGossipSelect(Player* pPlayer, GameObject* pGameObject, uint32 sender, uint32 action, const char* code);
        bool OnQuestAccept(Player* pPlayer, Creature* pCreature, Quest const* pQuest);
        bool OnQuestAccept(Player* pPlayer, GameObject* pGameObject, Quest const* pQuest);
        bool OnQuestAccept(Player* pPlayer, Item* pItem, Quest const* pQuest);
        bool OnQuestRewarded(Player* pPlayer, Creature* pCreature, Quest const* pQuest);
        bool OnQuestRewarded(Player* pPlayer, GameObject* pGameObject, Quest const* pQuest);
        uint32 GetDialogStatus(Player* pPlayer, Creature* pCreature);
        uint32 GetDialogStatus(Player* pPlayer, GameObject* pGameObject);
        bool OnGameObjectUse(Player* pPlayer, GameObject* pGameObject);
        bool OnGameObjectOpen(Player* pPlayer, GameObject* pGameObject);
        bool OnItemUse(Player* pPlayer, Item* pItem, SpellCastTargets const& targets);
        bool OnAreaTrigger(Player* pPlayer, AreaTriggerEntry const* atEntry);
        bool OnProcessEvent(uint32 eventId, Object* pSource, Object* pTarget, bool isStart);
        bool OnEffectDummy(Unit* pCaster, uint32 spellId, SpellEffectIndex effIndex, Creature* pTarget);
        bool OnEffectDummy(Unit* pCaster, uint32 spellId, SpellEffectIndex effIndex, GameObject* pTarget);
        bool OnEffectDummy(Unit* pCaster, uint32 spellId, SpellEffectIndex effIndex, Item* pTarget);
        bool OnAuraDummy(Aura const* pAura, bool apply);

    private:
        void CollectPossibleEventIds(std::set<uint32>& eventIds);
        void LoadScripts(ScriptMapMap& scripts, const char* tablename);
        void CheckScriptTexts(ScriptMapMap const& scripts);
        void DisableScriptAction(ScriptInfo& script);

        typedef std::vector<std::string> ScriptNameMap;
        typedef UNORDERED_MAP<uint32, uint32> AreaTriggerScriptMap;
        typedef UNORDERED_MAP<uint32, uint32> EventIdScriptMap;
        
        //Maps and lists
        typedef UNORDERED_MAP<int32, StringTextData> TextDataMap;
        typedef UNORDERED_MAP<uint32, std::vector<ScriptPointMove> > PointMoveMap;
        typedef UNORDERED_MAP<int32, CreatureEscortData> EscortDataMap;

        AreaTriggerScriptMap    m_AreaTriggerScripts;
        EventIdScriptMap        m_EventIdScripts;

        ScriptNameMap           m_scriptNames;

        TSpellSummary* m_spellSummary;
        
        TextDataMap     m_mTextDataMap;                     //additional data for text strings
        PointMoveMap    m_mPointMoveMap;                    //coordinates for waypoints
        EscortDataMap   m_mEscortDataMap;                   // Des donnees pour les quetes d'escorte scriptees via la DB

        //atomic op counter for active scripts amount
        ACE_Atomic_Op<ACE_Thread_Mutex, int> m_scheduledScripts;
};

//Generic scripting text function
void DoScriptText(int32 textEntry, WorldObject* pSource, Unit* target = nullptr, uint32 chatTypeOverride = 0);
void DoOrSimulateScriptTextForMap(int32 iTextEntry, uint32 uiCreatureEntry, Map* pMap, Creature* pCreatureSource = nullptr, Unit* pTarget = nullptr);

#define sScriptMgr MaNGOS::Singleton<ScriptMgr>::Instance()

MANGOS_DLL_SPEC uint32 GetAreaTriggerScriptId(uint32 triggerId);
MANGOS_DLL_SPEC uint32 GetEventIdScriptId(uint32 eventId);
MANGOS_DLL_SPEC uint32 GetScriptId(const char *name);
MANGOS_DLL_SPEC char const* GetScriptName(uint32 id);
MANGOS_DLL_SPEC uint32 GetScriptIdsCount();

#endif
