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

enum eScriptCommand
{
    SCRIPT_COMMAND_TALK                     = 0,            // source = WorldObject, target = any/none, datalong (see enum ChatType for supported CHAT_TYPE_'s)
                                                            // datalong2 = creature entry (searching for a buddy, closest to source), datalong3 = creature search radius, datalong4 = gameobject db guid
                                                            // data_flags = flag_target_player_as_source    = 0x01
                                                            //              flag_original_source_as_target  = 0x02
                                                            //              flag_buddy_as_target            = 0x04
                                                            // dataint = text entry from db_script_string -table. dataint2-4 optional for random selected text.
    SCRIPT_COMMAND_EMOTE                    = 1,            // source = Unit (or WorldObject when creature entry defined), target = Unit (or none)
                                                            // datalong = emote_id
                                                            // datalong2 = creature entry (searching for a buddy, closest to source), datalong3 = creature search radius
                                                            // data_flags = flag_target_as_source           = 0x01
    SCRIPT_COMMAND_FIELD_SET                = 2,            // source = any, datalong = field_id, datalong2 = value
    SCRIPT_COMMAND_MOVE_TO                  = 3,            // source = Creature, datalong = 1 if coordinates are relative to target, datalong2 = time, x/y/z
    SCRIPT_COMMAND_FLAG_SET                 = 4,            // source = any, datalong = field_id, datalong2 = bitmask
    SCRIPT_COMMAND_FLAG_REMOVE              = 5,            // source = any, datalong = field_id, datalong2 = bitmask
    SCRIPT_COMMAND_TELEPORT_TO              = 6,            // source or target with Player, datalong = map_id, x/y/z
    SCRIPT_COMMAND_QUEST_EXPLORED           = 7,            // one from source or target must be Player, another GO/Creature, datalong=quest_id, datalong2=distance or 0
    SCRIPT_COMMAND_KILL_CREDIT              = 8,            // source or target with Player, datalong = creature entry, datalong2 = bool (0=personal credit, 1=group credit)
    SCRIPT_COMMAND_RESPAWN_GAMEOBJECT       = 9,            // source = any (summoner), datalong=db_guid, datalong2=despawn_delay
    SCRIPT_COMMAND_TEMP_SUMMON_CREATURE     = 10,           // source = any (summoner), datalong=creature entry, datalong2=despawn_delay
                                                            // data_flags & SCRIPT_FLAG_COMMAND_ADDITIONAL = summon active, SUMMON_CREATURE_UNIQUE = check for same entry in radius, SUMMON_CREATURE_UNIQUE_TEMP = same but only TempSummon
                                                            // dataint = (bool) setRun; 0 = off (default), 1 = on
                                                            // dataint2: 0 = use orientation specified, 1 = face source, 2 = face target
    SCRIPT_COMMAND_OPEN_DOOR                = 11,           // source = unit, datalong=db_guid, datalong2=reset_delay
    SCRIPT_COMMAND_CLOSE_DOOR               = 12,           // source = unit, datalong=db_guid, datalong2=reset_delay
    SCRIPT_COMMAND_ACTIVATE_OBJECT          = 13,           // source = unit, target=GO
    SCRIPT_COMMAND_REMOVE_AURA              = 14,           // source (datalong2!=0) or target (datalong==0) unit, datalong = spell_id
    SCRIPT_COMMAND_CAST_SPELL               = 15,           // source/target cast spell at target/source
                                                            // datalong2: 0: s->t 1: s->s 2: t->t 3: t->s (this values in 2 bits), and 0x4 mask for cast triggered can be added to
    SCRIPT_COMMAND_PLAY_SOUND               = 16,           // source = any object, target=any/player, datalong (sound_id), datalong2 (bitmask: 0/1=anyone/target, 0/2=with distance dependent, so 1|2 = 3 is target with distance dependent)
    SCRIPT_COMMAND_CREATE_ITEM              = 17,           // source or target must be player, datalong = item entry, datalong2 = amount
    SCRIPT_COMMAND_DESPAWN_CREATURE         = 18,           // source or target must be creature
                                                            // datalong = despawn delay
                                                            // datalong2 = search for npc entry if provided
                                                            // datalong3 = search distance
    SCRIPT_COMMAND_PLAY_MOVIE               = 19,           // target can only be a player, datalog = movie id
    SCRIPT_COMMAND_MOVEMENT                 = 20,           // source or target must be creature. datalong = MovementType (0:idle, 1:random or 2:waypoint)
                                                            // datalong2 = creature entry (searching for a buddy, closest to source), datalong3 = creature search radius
    SCRIPT_COMMAND_SET_ACTIVEOBJECT         = 21,           // source=any, target=creature
                                                            // datalong=bool 0=off, 1=on
                                                            // datalong2=creature entry, datalong3=search radius
    SCRIPT_COMMAND_SET_FACTION              = 22,           // source=any, target=creature
                                                            // datalong=factionId,
                                                            // datalong2=creature entry, datalong3=search radius
    SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL  = 23,           // source=any, target=creature
                                                            // datalong=creature entry/modelid (depend on data_flags)
                                                            // datalong2=creature entry, datalong3=search radius
                                                            // dataflags= 0x01 to use datalong value as modelid explicit
    SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL  = 24,           // source=any, target=creature
                                                            // datalong=creature entry/modelid (depend on data_flags)
                                                            // datalong2=creature entry, datalong3=search radius
                                                            // dataflags= 0x01 to use datalong value as modelid explicit
    SCRIPT_COMMAND_SET_RUN                  = 25,           // source=any, target=creature
                                                            // datalong= bool 0=off, 1=on
                                                            // datalong2=creature entry, datalong3=search radius
    SCRIPT_COMMAND_ATTACK_START             = 26,           // source = Creature (or WorldObject when creature entry are defined), target = Player
                                                            // datalong2 = creature entry (searching for a buddy, closest to source), datalong3 = creature search radius
    SCRIPT_COMMAND_GO_LOCK_STATE            = 27,           // source or target must be WorldObject
                                                            // datalong= 1=lock, 2=unlock, 4=set not-interactable, 8=set interactable
                                                            // datalong2= go entry, datalong3= go search radius
    SCRIPT_COMMAND_STAND_STATE              = 28,           // source = Unit (or WorldObject when creature entry defined), target = Unit (or none)
                                                            // datalong = stand state (enum UnitStandStateType)
                                                            // datalong2 = creature entry (searching for a buddy, closest to source), datalong3 = creature search radius
                                                            // data_flags = flag_target_as_source           = 0x01
    SCRIPT_COMMAND_MODIFY_NPC_FLAGS         = 29,           // source=any, target=creature
                                                            // datalong=NPCFlags
                                                            // datalong2:0x00=toggle, 0x01=add, 0x02=remove
                                                            // datalong3 = creature entry (searching for a buddy, closest to source), datalong4 = creature search radius
    SCRIPT_COMMAND_SEND_TAXI_PATH           = 30,           // source or target must be player
                                                            // datalong = taxi path id
    SCRIPT_COMMAND_TERMINATE_SCRIPT         = 31,           // source = any
                                                            // datalong = search for npc entry if provided
                                                            // datalong2= search distance
                                                            // data_flags & 0x01: terminate steps of this script if npc found
                                                            //              ELSE: terminate steps of this script if npc not found
    SCRIPT_COMMAND_ENTER_EVADE_MODE         = 33,           // source = Unit (or WorldObject when creature entry defined), target = Unit (or none)
                                                            // datalong = search for npc entry if provided
                                                            // datalong2= search distance
    SCRIPT_COMMAND_TERMINATE_COND           = 34,           // source = any
                                                            // datalong = condition_id, datalong2 = if != 0 then quest_id of quest that will be failed for player's group if the script is terminated
                                                            // data_flags & 0x01 terminate when condition is false ELSE terminate when condition is true
    SCRIPT_COMMAND_TURN_TO                  = 35,           // source = Unit or any worldobject if datalong2 = 1, target = Unit
                                                            // datalong: 0=face target (usually player), 1=set to orientation specified, 2=face a creature
                                                            // datalong2 = 0, change source's orientation, ELSE change traget's orientation
                                                            // datalong3 = search for npc entry if provided
                                                            // datalong4 = search distance
    SCRIPT_COMMAND_MEETINGSTONE             = 36,           // datalong = area id

};

#define MAX_TEXT_ID 4                                       // used for SCRIPT_COMMAND_TALK
static constexpr uint32 MAX_EMOTE_ID = 4;                   // used for SCRIPT_COMMAND_EMOTE

enum SummonCreatureFlags
{
    SUMMON_CREATURE_ACTIVE      = 0x1,
    SUMMON_CREATURE_UNIQUE      = 0x2,                      // not actually unique, just checks for same entry in certain range
    SUMMON_CREATURE_UNIQUE_TEMP = 0x4,                      // same as 0x2 but check for TempSummon only creatures
};

struct ScriptInfo
{
    uint32 id;
    uint32 delay;
    uint32 command;

    union
    {
        struct                                              // SCRIPT_COMMAND_TALK (0)
        {
            uint32 chatType;                                // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
            uint32 gameobjectGuid;                          // datalong4
            uint32 flags;                                   // data_flags
            int32  textId[MAX_TEXT_ID];                     // dataint to dataint4
        } talk;

        struct                                              // SCRIPT_COMMAND_EMOTE (1)
        {
            uint32 emoteId;                                 // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
            uint32 unused1;                                 // datalong4
            uint32 flags;                                   // data_flags
            uint32 randomEmotes[MAX_EMOTE_ID];              // dataint to dataint4
        } emote;

        struct                                              // SCRIPT_COMMAND_FIELD_SET (2)
        {
            uint32 fieldId;                                 // datalong
            uint32 fieldValue;                              // datalong2
        } setField;

        struct                                              // SCRIPT_COMMAND_MOVE_TO (3)
        {
            uint32 relativeToTarget;                        // datalong
            uint32 travelTime;                              // datalong2
        } moveTo;

        struct                                              // SCRIPT_COMMAND_FLAG_SET (4)
        {
            uint32 fieldId;                                 // datalong
            uint32 fieldValue;                              // datalong2
        } setFlag;

        struct                                              // SCRIPT_COMMAND_FLAG_REMOVE (5)
        {
            uint32 fieldId;                                 // datalong
            uint32 fieldValue;                              // datalong2
        } removeFlag;

        struct                                              // SCRIPT_COMMAND_TELEPORT_TO (6)
        {
            uint32 mapId;                                   // datalong
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
            uint32 isSourceTarget;                          // datalong2
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
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
        } despawn;

        struct                                              // SCRIPT_COMMAND_PLAY_MOVIE (19)
        {
            uint32 movieId;                                 // datalong
        } playMovie;

        struct                                              // SCRIPT_COMMAND_MOVEMENT (20)
        {
            uint32 movementType;                            // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
        } movement;

        struct                                              // SCRIPT_COMMAND_SET_ACTIVEOBJECT (21)
        {
            uint32 activate;                                // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
        } activeObject;

        struct                                              // SCRIPT_COMMAND_SET_FACTION (22)
        {
            uint32 factionId;                               // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
            uint32 empty1;                                  // datalong4
            uint32 flags;                                   // data_flags
        } faction;

        struct                                              // SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (23)
        {
            uint32 creatureOrModelEntry;                    // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
            uint32 empty1;                                  // datalong4
            uint32 flags;                                   // data_flags
        } morph;

        struct                                              // SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (24)
        {
            uint32 creatureOrModelEntry;                    // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
            uint32 empty1;                                  // datalong4
            uint32 flags;                                   // data_flags
        } mount;

        struct                                              // SCRIPT_COMMAND_SET_RUN (25)
        {
            uint32 run;                                     // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
        } run;

        struct                                              // SCRIPT_COMMAND_ATTACK_START (26)
        {
            uint32 empty1;                                  // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
            uint32 empty2;                                  // datalong4
            uint32 flags;                                   // data_flags
        } attack;

        struct                                              // SCRIPT_COMMAND_GO_LOCK_STATE (27)
        {
            uint32 lockState;                               // datalong
            uint32 goEntry;                                 // datalong2
            uint32 searchRadius;                            // datalong3
        } goLockState;

        struct                                              // SCRIPT_COMMAND_STAND_STATE (28)
        {
            uint32 stand_state;                             // datalong
            uint32 creatureEntry;                           // datalong2
            uint32 searchRadius;                            // datalong3
            uint32 unused1;                                 // datalong4
            uint32 flags;                                   // data_flags
        } standState;

        struct                                              // SCRIPT_COMMAND_MODIFY_NPC_FLAGS (29)
        {
            uint32 flag;                                    // datalong
            uint32 change_flag;                             // datalong2
            uint32 creatureEntry;                           // datalong3
            uint32 searchRadius;                            // datalong4
        } npcFlag;

        struct                                              // SCRIPT_COMMAND_SEND_TAXI_PATH (30)
        {
            uint32 taxiPathId;                              // datalong
        } sendTaxiPath;

        struct                                              // SCRIPT_COMMAND_TERMINATE_SCRIPT (31)
        {
            uint32 creatureEntry;                           // datalong
            uint32 searchRadius;                            // datalong2
            uint32 unused1;                                 // datalong3
            uint32 unused2;                                 // datalong4
            uint32 flags;                                   // data_flags
        } terminateScript;

        struct                                              // SCRIPT_COMMAND_ENTER_EVADE_MODE (33)
        {
            uint32 creatureEntry;                           // datalong
            uint32 searchRadius;                            // datalong2
        } enterEvadeMode;

        struct                                              // SCRIPT_COMMAND_TERMINATE_COND (34)
        {
            uint32 conditionId;                             // datalong
            uint32 failQuest;                               // datalong2
            uint32 unused1;                                 // datalong3
            uint32 unused2;                                 // datalong4
            uint32 flags;                                   // data_flags
        } terminateCond;

        struct                                              // SCRIPT_COMMAND_TURN_TO (35)
        {
            uint32 facingLogic;                             // datalong
            uint32 isSourceTarget;                          // datalong2
            uint32 creatureEntry;                           // datalong3
            uint32 searchRadius;                            // datalong4
        } turnTo;

        struct                                              // SCRIPT_COMMAND_MEETINGSTONE (36)
        {
            uint32 areaId;                                  // datalong
        } meetingstone;

        struct
        {
            uint32 data[9];
        } raw;
    };

    float x;
    float y;
    float z;
    float o;

    // helpers
    uint32 GetGOGuid() const
    {
        switch(command)
        {
            case SCRIPT_COMMAND_TALK: return talk.gameobjectGuid;
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

#define TEXT_SOURCE_GOSSIP_START    TEXT_SOURCE_RANGE*3
#define TEXT_SOURCE_GOSSIP_END      TEXT_SOURCE_RANGE*4 + 1

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
        void LoadGossipScripts();
        void LoadCreatureMovementScripts();

        void LoadDbScriptStrings();

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
        void LoadScriptGossipTexts();
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
