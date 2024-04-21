/*
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

#ifndef __CREATURE_DEFINES_H
#define __CREATURE_DEFINES_H

#include "Common.h"
#include "SharedDefines.h"
#include "UnitDefines.h"
#include "ObjectGuid.h"
#include "Util.h"

#include <array>
#include <vector>


enum TrainerType                                            // this is important type for npcs!
{
    TRAINER_TYPE_CLASS             = 0,
    TRAINER_TYPE_MOUNTS            = 1,                     // on blizz it's 2
    TRAINER_TYPE_TRADESKILLS       = 2,
    TRAINER_TYPE_PETS              = 3
};

#define MAX_TRAINER_TYPE 4

// CreatureType.dbc
enum CreatureType
{
    CREATURE_TYPE_BEAST            = 1,
    CREATURE_TYPE_DRAGONKIN        = 2,
    CREATURE_TYPE_DEMON            = 3,
    CREATURE_TYPE_ELEMENTAL        = 4,
    CREATURE_TYPE_GIANT            = 5,
    CREATURE_TYPE_UNDEAD           = 6,
    CREATURE_TYPE_HUMANOID         = 7,
    CREATURE_TYPE_CRITTER          = 8,
    CREATURE_TYPE_MECHANICAL       = 9,
    CREATURE_TYPE_NOT_SPECIFIED    = 10,
    CREATURE_TYPE_TOTEM            = 11,
};

uint32 const CREATURE_TYPEMASK_HUMANOID_OR_UNDEAD = (1 << (CREATURE_TYPE_HUMANOID - 1)) | (1 << (CREATURE_TYPE_UNDEAD - 1));
uint32 const CREATURE_TYPEMASK_MECHANICAL_OR_ELEMENTAL = (1 << (CREATURE_TYPE_MECHANICAL - 1)) | (1 << (CREATURE_TYPE_ELEMENTAL - 1));

// CreatureFamily.dbc
enum CreatureFamily
{
    CREATURE_FAMILY_WOLF           = 1,
    CREATURE_FAMILY_CAT            = 2,
    CREATURE_FAMILY_SPIDER         = 3,
    CREATURE_FAMILY_BEAR           = 4,
    CREATURE_FAMILY_BOAR           = 5,
    CREATURE_FAMILY_CROCOLISK      = 6,
    CREATURE_FAMILY_CARRION_BIRD   = 7,
    CREATURE_FAMILY_CRAB           = 8,
    CREATURE_FAMILY_GORILLA        = 9,
    CREATURE_FAMILY_HORSE_CUSTOM   = 10,                    // not exist in DBC but used for horse like beasts in DB
    CREATURE_FAMILY_RAPTOR         = 11,
    CREATURE_FAMILY_TALLSTRIDER    = 12,
    CREATURE_FAMILY_FELHUNTER      = 15,
    CREATURE_FAMILY_VOIDWALKER     = 16,
    CREATURE_FAMILY_SUCCUBUS       = 17,
    CREATURE_FAMILY_DOOMGUARD      = 19,
    CREATURE_FAMILY_SCORPID        = 20,
    CREATURE_FAMILY_TURTLE         = 21,
    CREATURE_FAMILY_IMP            = 23,
    CREATURE_FAMILY_BAT            = 24,
    CREATURE_FAMILY_HYENA          = 25,
    CREATURE_FAMILY_OWL            = 26,
    CREATURE_FAMILY_WIND_SERPENT   = 27,
    CREATURE_FAMILY_REMOTE_CONTROL = 28,
};

enum CreatureEliteType
{
    CREATURE_ELITE_NORMAL          = 0,
    CREATURE_ELITE_ELITE           = 1,
    CREATURE_ELITE_RAREELITE       = 2,
    CREATURE_ELITE_WORLDBOSS       = 3,
    CREATURE_ELITE_RARE            = 4,
    CREATURE_UNKNOWN               = 5                      // found in 2.2.3 for 2 mobs
};

enum CreatureStaticFlags
{
    CREATURE_STATIC_FLAG_MOUNTABLE                         = 0x00000001, // Not used by core.
    CREATURE_STATIC_FLAG_NO_XP                             = 0x00000002, // No experience will be gained from killing the creature.
    CREATURE_STATIC_FLAG_NO_LOOT                           = 0x00000004, // Not used by core.
    CREATURE_STATIC_FLAG_UNKILLABLE                        = 0x00000008, // Invincibility threshold set to 1 HP.
    CREATURE_STATIC_FLAG_TAMEABLE                          = 0x00000010, // Can be tamed by hunters.
    CREATURE_STATIC_FLAG_IMMUNE_TO_PC                      = 0x00000020, // Applies UNIT_FLAG_IMMUNE_TO_PLAYER on spawn.
    CREATURE_STATIC_FLAG_IMMUNE_TO_NPC                     = 0x00000040, // Applies UNIT_FLAG_IMMUNE_TO_NPC on spawn.
    CREATURE_STATIC_FLAG_CAN_WIELD_LOOT                    = 0x00000080, // Will generate loot on spawn and equip any weapons.
    CREATURE_STATIC_FLAG_SESSILE                           = 0x00000100, // Cannot move.
    CREATURE_STATIC_FLAG_UNINTERACTIBLE                    = 0x00000200, // Applies UNIT_FLAG_NOT_SELECTABLE on spawn.
    CREATURE_STATIC_FLAG_NO_AUTOMATIC_REGEN                = 0x00000400, // Will not regen health and mana.
    CREATURE_STATIC_FLAG_DESPAWN_INSTANTLY                 = 0x00000800, // Despawn corpse instantly on death.
    CREATURE_STATIC_FLAG_CORPSE_RAID                       = 0x00001000, // Does not check distance upon death for loot and xp eligibility.
    CREATURE_STATIC_FLAG_CREATOR_LOOT                      = 0x00002000, // Can be looted by the player who created it.
    CREATURE_STATIC_FLAG_NO_DEFENSE                        = 0x00004000, // Defense skill is 0.
    CREATURE_STATIC_FLAG_NO_SPELL_DEFENSE                  = 0x00008000, // Cannot resist spells.
    CREATURE_STATIC_FLAG_RAID_BOSS_MOB                     = 0x00010000, // Not used by core.
    CREATURE_STATIC_FLAG_COMBAT_PING                       = 0x00020000, // Send mini map ping packet upon entering combat.
    CREATURE_STATIC_FLAG_AQUATIC                           = 0x00040000, // Inhabit Type = INHABIT_WATER ; Original Comment: "aka Water Only"
    CREATURE_STATIC_FLAG_AMPHIBIOUS                        = 0x00080000, // Inhabit Type = INHABIT_GROUND | INHABIT_WATER
    CREATURE_STATIC_FLAG_NO_MELEE                          = 0x00100000, // Does not auto attack ; Original Comment: "Flee"
    CREATURE_STATIC_FLAG_VISIBLE_TO_GHOSTS                 = 0x00200000, // Spirit Healers.
    CREATURE_STATIC_FLAG_PVP_ENABLING                      = 0x00400000, // Flagged for PvP, makes it possible to target creature with beneficial spells as well.
    CREATURE_STATIC_FLAG_DO_NOT_PLAY_WOUND_ANIM            = 0x00800000, // Will not play EMOTE_ONESHOT_WOUNDCRITICAL.
    CREATURE_STATIC_FLAG_NO_FACTION_TOOLTIP                = 0x01000000, // Not used by core.
    CREATURE_STATIC_FLAG_IGNORE_COMBAT                     = 0x02000000, // React State = Passive
    CREATURE_STATIC_FLAG_ONLY_ATTACK_PVP_ENABLING          = 0x04000000, // No proximity aggro for players who are not PvP flagged.
    CREATURE_STATIC_FLAG_CALLS_GUARDS                      = 0x08000000, // Summons a guard if an opposite faction player gets near or attacks.
    CREATURE_STATIC_FLAG_CAN_SWIM                          = 0x10000000, // Applies UNIT_FLAG_USE_SWIM_ANIMATION on spawn.
    CREATURE_STATIC_FLAG_FLOATING                          = 0x20000000, // Applies MOVEFLAG_FIXED_Z on spawn ; Original Comment: "Don't use"
    CREATURE_STATIC_FLAG_MORE_AUDIBLE                      = 0x40000000, // Original Comment: "Caution, Expensive"
    CREATURE_STATIC_FLAG_LARGE_AOI                         = 0x80000000  // Increases visibility distance to 200 yards ; Original Comment: "Caution, Expensive"
};

enum CreatureStaticFlags2
{
    CREATURE_STATIC_FLAG_2_NO_PET_SCALING                  = 0x00000001, // Not used by core.
    CREATURE_STATIC_FLAG_2_FORCE_RAID_COMBAT               = 0x00000002, // Enters combat with zone on aggro.
    CREATURE_STATIC_FLAG_2_LOCK_TAPPERS_TO_RAID_ON_DEATH   = 0x00000004, // Killing this creature will bind players to the raid.
    CREATURE_STATIC_FLAG_2_NO_HARMFUL_VERTEX_COLORING      = 0x00000008, // Not used by core.
    CREATURE_STATIC_FLAG_2_NO_CRUSHING_BLOWS               = 0x00000010, // Will not do crushing blows.
    CREATURE_STATIC_FLAG_2_NO_OWNER_THREAT                 = 0x00000020, // Does not put owner in combat when it enters combat.
    CREATURE_STATIC_FLAG_2_NO_WOUNDED_SLOWDOWN             = 0x00000040, // Does not reduce run speed at low health.
};

// This is a censured version of the static flags to be sent to client after 1.10.
enum CreatureTypeFlags
{
    CREATURE_TYPEFLAGS_TAMEABLE                   = 0x00000001, // Derived from CREATURE_STATIC_FLAG_TAMEABLE (0x00000010)
    CREATURE_TYPEFLAGS_VISIBLE_TO_GHOSTS          = 0x00000002, // Derived from CREATURE_STATIC_FLAG_VISIBLE_TO_GHOSTS (0x00200000)
    CREATURE_TYPEFLAGS_RAID_BOSS_MOB              = 0x00000004, // Derived from CREATURE_STATIC_FLAG_RAID_BOSS_MOB (0x00010000)
    CREATURE_TYPEFLAGS_DO_NOT_PLAY_WOUND_ANIM     = 0x00000008, // Derived from CREATURE_STATIC_FLAG_DO_NOT_PLAY_WOUND_ANIM (0x00800000)
    CREATURE_TYPEFLAGS_NO_FACTION_TOOLTIP         = 0x00000010, // Derived from CREATURE_STATIC_FLAG_NO_FACTION_TOOLTIP (0x01000000)
    CREATURE_TYPEFLAGS_MORE_AUDIBLE               = 0x00000020, // Derived from CREATURE_STATIC_FLAG_MORE_AUDIBLE (0x40000000)
    CREATURE_TYPEFLAGS_NO_HARMFUL_VERTEX_COLORING = 0x00000040, // Derived from CREATURE_STATIC_FLAG_2_NO_HARMFUL_VERTEX_COLORING (0x00000008)
};

enum CreatureFlagsExtra
{
    CREATURE_FLAG_EXTRA_NO_LEASH_EVADE               = 0x00000001, // 1        Creature will not evade due to target running away
    CREATURE_FLAG_EXTRA_NO_AGGRO                     = 0x00000002, // 2        Creature is defensive and does not attack nearby hostile targets
    CREATURE_FLAG_EXTRA_NO_PARRY                     = 0x00000004, // 4        Creature can't parry
    CREATURE_FLAG_EXTRA_NO_UNREACHABLE_EVADE         = 0x00000008, // 8        Creature will not evade due to target being unreachable
    CREATURE_FLAG_EXTRA_NO_BLOCK                     = 0x00000010, // 16       Creature can't block
    CREATURE_FLAG_EXTRA_NO_MOVEMENT_PAUSE            = 0x00000020, // 32       Creature will not pause movement when player talks to it
    CREATURE_FLAG_EXTRA_ALWAYS_RUN                   = 0x00000040, // 64       Creature will use run speed out of combat
    CREATURE_FLAG_EXTRA_INVISIBLE                    = 0x00000080, // 128      Creature is always invisible for player (mostly trigger creatures)
    CREATURE_FLAG_EXTRA_GIGANTIC_AOI                 = 0x00000100, // 256      CREATURE_DIFFICULTYFLAGS_3_GIGANTIC_AOI (400 yards)
    CREATURE_FLAG_EXTRA_INFINITE_AOI                 = 0x00000200, // 512      CREATURE_DIFFICULTYFLAGS_3_INFINITE_AOI
    CREATURE_FLAG_EXTRA_GUARD                        = 0x00000400, // 1024     Creature is a guard
    CREATURE_FLAG_EXTRA_NO_THREAT_LIST               = 0x00000800, // 2048     Creature does not select targets based on threat
    CREATURE_FLAG_EXTRA_KEEP_POSITIVE_AURAS_ON_EVADE = 0x00001000, // 4096     Creature keeps positive auras at reset
    CREATURE_FLAG_EXTRA_ALWAYS_CRUSH                 = 0x00002000, // 8192     Creature always roll a crushing melee outcome when not miss/crit/dodge/parry/block
    CREATURE_FLAG_EXTRA_APPEAR_DEAD                  = 0x00004000, // 16384    Creature will have UNIT_DYNFLAG_DEAD applied
    CREATURE_FLAG_EXTRA_CHASE_GEN_NO_BACKING         = 0x00008000, // 32768    Creature does not move back when target is within bounding radius
    CREATURE_FLAG_EXTRA_NO_ASSIST                    = 0x00010000, // 65536    Creature does not aggro when nearby creatures aggro
    CREATURE_FLAG_EXTRA_NO_TARGET                    = 0x00020000, // 131072   Creature is passive and does not acquire targets
    CREATURE_FLAG_EXTRA_ONLY_VISIBLE_TO_FRIENDLY     = 0x00040000, // 262144   Creature can only be seen by friendly units
    CREATURE_FLAG_EXTRA_CAN_ASSIST                   = 0x00080000, // 524288   CREATURE_TYPEFLAGS_CAN_ASSIST from TBC
};

enum CreatureImmunityFlags
{
    CREATURE_IMMUNITY_AOE            = 0x01,
    CREATURE_IMMUNITY_TAUNT          = 0x02, // SPELL_AURA_MOD_TAUNT, SPELL_EFFECT_ATTACK_ME
    CREATURE_IMMUNITY_MOD_STAT       = 0x04, // SPELL_AURA_MOD_STAT, SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE
    CREATURE_IMMUNITY_MOD_CAST_SPEED = 0x08, // SPELL_AURA_MOD_CASTING_SPEED_NOT_STACK
    CREATURE_IMMUNITY_DISEASE        = 0x10, // DISPEL_DISEASE
    CREATURE_IMMUNITY_POISON         = 0x20, // DISPEL_POISON
    CREATURE_IMMUNITY_CURSE          = 0x40, // DISPEL_CURSE
};

// Number of spells in one template
#define CREATURE_SPELLS_MAX_SPELLS 8
// Columns in the db for each spell
#define CREATURE_SPELLS_MAX_COLUMNS 11

struct CreatureSpellsEntry
{
    uint16 const spellId;
    uint8 const  probability;
    uint8 const  castTarget;
    uint32 const targetParam1;
    uint32 const targetParam2;
    uint16 const  castFlags;
    uint32 const delayInitialMin;
    uint32 const delayInitialMax;
    uint32 const delayRepeatMin;
    uint32 const delayRepeatMax;
    uint32 const scriptId;
    CreatureSpellsEntry(uint16 Id, uint8 Probability, uint8 CastTarget, uint32 TargetParam1, uint32 TargetParam2, uint16 CastFlags, uint32 InitialMin, uint32 InitialMax, uint32 RepeatMin, uint32 RepeatMax, uint32 ScriptId) : spellId(Id), probability(Probability), castTarget(CastTarget), targetParam1(TargetParam1), targetParam2(TargetParam2), castFlags(CastFlags), delayInitialMin(InitialMin), delayInitialMax(InitialMax), delayRepeatMin(RepeatMin), delayRepeatMax(RepeatMax), scriptId(ScriptId) {}
};

typedef std::vector<CreatureSpellsEntry> CreatureSpellsList;

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push,N), also any gcc version not support it at some platform
#if defined(__GNUC__)
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

#define MAX_DISPLAY_IDS_PER_CREATURE 4                                // only single send to client in static data
#define CREATURE_FLEE_TEXT 1150
#define NPC_MOVEMENT_PAUSE_TIME 180000

#define SPEED_REDUCTION_NONE   1.0f
#define SPEED_REDUCTION_HP_15  0.7f
#define SPEED_REDUCTION_HP_10  0.6f
#define SPEED_REDUCTION_HP_5   0.5f

#define DEFAULT_NPC_WALK_SPEED_RATE 1.0f
#define DEFAULT_NPC_RUN_SPEED_RATE 1.14286f

// from `creature_template` table
struct CreatureInfo
{
    uint32  entry = 0;
    std::string name;
    std::string subname;
    uint32  level_min = 1;
    uint32  level_max = 1;
    uint32  faction = 0;
    uint32  npc_flags = 0;
    uint32  gossip_menu_id = 0;
    uint32  display_id[MAX_DISPLAY_IDS_PER_CREATURE] = {};
    float   display_scale[MAX_DISPLAY_IDS_PER_CREATURE] = {};
    uint32  display_probability[MAX_DISPLAY_IDS_PER_CREATURE] = {};
    uint32  display_total_probability = 0;
    uint32  mount_display_id = 0;
    float   speed_walk = 1.0f;
    float   speed_run = 1.14286f;
    float   detection_range = 18.0f;                        // Detection Range for Line of Sight aggro
    float   call_for_help_range = 5.0f;                     // Radius for combat assistance call
    float   leash_range = 0.0f;                             // Hard limit on allowed chase distance
    uint32  type = 0;                                       // enum CreatureType values
    uint32  pet_family = 0;                                 // enum CreatureFamily values (optional)
    uint32  rank = 0;
    uint32  unit_class = 0;                                 // enum Classes. Note only 4 classes are known for creatures.
    float   xp_multiplier = 1.0f;
    float   health_multiplier = 1.0f;
    float   mana_multiplier = 1.0f;
    float   armor_multiplier = 1.0f;
    float   damage_multiplier = 1.0f;
    float   damage_variance = 0.14f;
    uint32  damage_school = 0;
    uint32  base_attack_time = 2000;
    uint32  ranged_attack_time = 2000;
    int32   holy_res = 0;
    int32   fire_res = 0;
    int32   nature_res = 0;
    int32   frost_res = 0;
    int32   shadow_res = 0;
    int32   arcane_res = 0;
    uint32  trainer_type = 0;
    uint32  trainer_spell = 0;
    uint32  trainer_class = 0;
    uint32  trainer_race = 0;
    uint32  loot_id = 0;
    uint32  pickpocket_loot_id = 0;
    uint32  skinning_loot_id = 0;
    uint32  gold_min = 0;
    uint32  gold_max = 0;
    uint32  spells[CREATURE_MAX_SPELLS] = {};
    uint32  spell_list_id = 0;
    uint32  pet_spell_list_id = 0;
    uint32  spawn_spell_id = 0;
    uint32 const* auras = nullptr;
    std::string ai_name;
    uint32  movement_type = 0;
    uint32  inhabit_type = 3;
    bool    civilian = false;
    bool    racial_leader = false;
    uint32  equipment_id = 0;
    uint32  trainer_id = 0;
    uint32  vendor_id = 0;
    uint32  mechanic_immune_mask = 0;
    uint32  school_immune_mask = 0;
    uint32  immunity_flags = 0;
    uint32  static_flags1 = 0;
    uint32  static_flags2 = 0;
    uint32  flags_extra = 0;
    uint32  script_id = 0;

    // helpers
    static HighGuid GetHighGuid()
    {
        return HIGHGUID_UNIT;                               // in pre-3.x always HIGHGUID_UNIT
    }

    ObjectGuid GetObjectGuid(uint32 lowguid) const { return ObjectGuid(GetHighGuid(), entry, lowguid); }

    bool IsTameable() const
    {
        return type == CREATURE_TYPE_BEAST && pet_family != 0 && static_flags1 & CREATURE_STATIC_FLAG_TAMEABLE;
    }

    uint32 GetTypeFlags() const
    {
        uint32 typeFlags = 0;
        if (static_flags1 & CREATURE_STATIC_FLAG_TAMEABLE)
            typeFlags |= CREATURE_TYPEFLAGS_TAMEABLE;
        if (static_flags1 & CREATURE_STATIC_FLAG_VISIBLE_TO_GHOSTS)
            typeFlags |= CREATURE_TYPEFLAGS_VISIBLE_TO_GHOSTS;
        if (static_flags1 & CREATURE_STATIC_FLAG_RAID_BOSS_MOB)
            typeFlags |= CREATURE_TYPEFLAGS_RAID_BOSS_MOB;
        if (static_flags1 & CREATURE_STATIC_FLAG_DO_NOT_PLAY_WOUND_ANIM)
            typeFlags |= CREATURE_TYPEFLAGS_DO_NOT_PLAY_WOUND_ANIM;
        if (static_flags1 & CREATURE_STATIC_FLAG_NO_FACTION_TOOLTIP)
            typeFlags |= CREATURE_TYPEFLAGS_NO_FACTION_TOOLTIP;
        if (static_flags1 & CREATURE_STATIC_FLAG_MORE_AUDIBLE)
            typeFlags |= CREATURE_TYPEFLAGS_MORE_AUDIBLE;
        if (static_flags2 & CREATURE_STATIC_FLAG_2_NO_HARMFUL_VERTEX_COLORING)
            typeFlags |= CREATURE_TYPEFLAGS_NO_HARMFUL_VERTEX_COLORING;
        return typeFlags;
    }
};

struct EquipmentEntry
{
    uint32 probability = 0;
    uint32 item[3] = { 0, 0, 0 };
};

struct EquipmentTemplate
{
    uint32 totalProbability = 0;
    std::vector<EquipmentEntry> equipment;

    EquipmentEntry const* ChooseEquipmentEntry() const
    {
        if (!totalProbability)
            return nullptr;

        uint32 const roll = urand(0, totalProbability - 1);
        uint32 sum = 0;

        for (auto const& itr : equipment)
        {
            if (!itr.probability)
                continue;

            sum += itr.probability;
            if (roll < sum)
                return &itr;
        }

        return nullptr;
    }
};

#define MAX_CREATURE_IDS_PER_SPAWN 5

// from `creature` table
struct CreatureData
{
    std::array<uint32, MAX_CREATURE_IDS_PER_SPAWN> creature_id = {};
    WorldLocation position;
    uint32 spawntimesecsmin = 0;
    uint32 spawntimesecsmax = 0;
    float wander_distance = 0.0f;
    float health_percent = 100.0f;
    float mana_percent = 100.0f;
    uint8 movement_type = 0;
    uint32 spawn_flags = 0;
    float visibility_mod = 0.0f;

    // non db field
    uint32 instanciatedContinentInstanceId;

    // helper function
    ObjectGuid GetObjectGuid(uint32 lowguid) const { return ObjectGuid(CreatureInfo::GetHighGuid(), creature_id[0], lowguid); }
    uint32 GetRandomRespawnTime() const { return urand(spawntimesecsmin, spawntimesecsmax); }
    uint32 ChooseCreatureId() const
    {
        uint32 creatureId = 0;
        uint32 creatureIdCount = 0;
        for (; creatureIdCount < MAX_CREATURE_IDS_PER_SPAWN && creature_id[creatureIdCount]; ++creatureIdCount);

        if (creatureIdCount)
            creatureId = creature_id[urand(0, creatureIdCount - 1)];

        if (!creatureId)
            creatureId = 1;

        return creatureId;
    }
    bool HasCreatureId(uint32 id) const
    {
        return std::find(creature_id.begin(), creature_id.end(), id) != creature_id.end();
    }
    uint32 GetCreatureIdCount() const
    {
        uint32 creatureIdCount = 0;
        for (; creatureIdCount < MAX_CREATURE_IDS_PER_SPAWN && creature_id[creatureIdCount]; ++creatureIdCount);
        return creatureIdCount;
    }
};

// from `creature_addon` table
struct CreatureDataAddon
{
    uint32 guid;
    uint32 display_id;
    int32  mount_display_id;
    int32  equipment_id;
    uint8  stand_state;
    uint8  sheath_state;                                    // SheathState
    uint32 emote_state;
    uint32 const* auras;                                    // loaded as char* "spell1 spell2 ... "
};

struct CreatureDisplayInfoAddon
{
    uint32 display_id;
    float bounding_radius;
    float combat_reach;
    float speed_walk;
    float speed_run;
    uint8 gender;
    uint32 display_id_other_gender;                         // The oposite gender for this display id (male/female)
};

struct CreatureClassLevelStats
{
    CreatureClassLevelStats() = default;
    CreatureClassLevelStats(float melee_damage_, float ranged_damage_, int32 attack_power_, int32 ranged_attack_power_,
        int32 health_, int32 base_health_, int32 mana_, int32 base_mana_, int32 strength_, int32 agility_, int32 stamina_,
        int32 intellect_, int32 spirit_, int32 armor_) : melee_damage(melee_damage_), ranged_damage(ranged_damage_), attack_power(attack_power_),
        ranged_attack_power(ranged_attack_power_), health(health_), base_health(base_health_), mana(mana_), base_mana(base_mana_), strength(strength_),
        agility(agility_), stamina(stamina_), intellect(intellect_), spirit(spirit_), armor(armor_) {};

    float melee_damage = 0.0f;
    float ranged_damage = 0.0f;
    int32 attack_power = 0;
    int32 ranged_attack_power = 0;
    int32 health = 0;
    int32 base_health = 0;
    int32 mana = 0;
    int32 base_mana = 0;
    int32 strength = 0;
    int32 agility = 0;
    int32 stamina = 0;
    int32 intellect = 0;
    int32 spirit = 0;
    int32 armor = 0;
};

// GCC have alternative #pragma pack() syntax and old gcc version not support pack(pop), also any gcc version not support it at some platform
#if defined(__GNUC__)
#pragma pack()
#else
#pragma pack(pop)
#endif

struct CreatureLocale
{
    std::vector<std::string> Name;
    std::vector<std::string> SubName;
};

struct GossipMenuItemsLocale
{
    std::vector<std::string> OptionText;
    std::vector<std::string> BoxText;
};

struct PointOfInterestLocale
{
    std::vector<std::string> IconName;
};

enum InhabitTypeValues
{
    INHABIT_GROUND = 1,
    INHABIT_WATER  = 2,
    INHABIT_AIR    = 4,
    INHABIT_ANYWHERE = INHABIT_GROUND | INHABIT_WATER | INHABIT_AIR
};

// Enums used by StringTextData::Type (CreatureEventAI)
enum ChatType
{
    CHAT_TYPE_SAY               = 0,
    CHAT_TYPE_YELL              = 1,
    CHAT_TYPE_TEXT_EMOTE        = 2,
    CHAT_TYPE_BOSS_EMOTE        = 3,
    CHAT_TYPE_WHISPER           = 4,
    CHAT_TYPE_BOSS_WHISPER      = 5,
    CHAT_TYPE_ZONE_YELL         = 6,
    CHAT_TYPE_ZONE_EMOTE        = 7,

    CHAT_TYPE_MAX
};

// Selection method used by SelectAttackingTarget
enum AttackingTarget
{
    ATTACKING_TARGET_RANDOM = 0,                            // Just selects a random target
    ATTACKING_TARGET_TOPAGGRO,                              // Selects targets from top aggro to bottom
    ATTACKING_TARGET_BOTTOMAGGRO,                           // Selects targets from bottom aggro to top
    ATTACKING_TARGET_NEAREST,                               // Selects the closest target
    ATTACKING_TARGET_FARTHEST                               // Selects the farthest away target
};

enum SelectFlags
{
    SELECT_FLAG_IN_LOS              = 0x001,                // Default Selection Requirement for Spell-targets
    SELECT_FLAG_PLAYER              = 0x002,
    SELECT_FLAG_POWER_MANA          = 0x004,                // For Energy based spells, like manaburn
    SELECT_FLAG_POWER_RAGE          = 0x008,
    SELECT_FLAG_POWER_ENERGY        = 0x010,
    SELECT_FLAG_IN_MELEE_RANGE      = 0x040,
    SELECT_FLAG_NOT_IN_MELEE_RANGE  = 0x080,
    SELECT_FLAG_NO_TOTEM            = 0x100,
    SELECT_FLAG_PLAYER_NOT_GM       = 0x200,
    SELECT_FLAG_PET                 = 0x400,
    SELECT_FLAG_NOT_PLAYER          = 0x800,
    SELECT_FLAG_POWER_NOT_MANA      = 0x1000,               // Used in some dungeon encounters
};

#define MAX_SELECT_FLAG_MASK (SELECT_FLAG_IN_LOS | SELECT_FLAG_PLAYER | SELECT_FLAG_POWER_MANA | SELECT_FLAG_POWER_RAGE | SELECT_FLAG_POWER_ENERGY | SELECT_FLAG_IN_MELEE_RANGE | SELECT_FLAG_NOT_IN_MELEE_RANGE | SELECT_FLAG_NO_TOTEM | SELECT_FLAG_PLAYER_NOT_GM | SELECT_FLAG_PET | SELECT_FLAG_NOT_PLAYER | SELECT_FLAG_POWER_NOT_MANA)

enum RegenStatsFlags
{
    REGEN_FLAG_HEALTH               = 0x001,
    REGEN_FLAG_POWER                = 0x002,
};

enum CreatureStateFlag : uint16
{
    CSTATE_ALREADY_CALL_ASSIST   = 0x0001,
    CSTATE_ALREADY_SEARCH_ASSIST = 0x0002,
    CSTATE_REGEN_HEALTH          = 0x0004,
    CSTATE_REGEN_MANA            = 0x0008,
    CSTATE_INIT_AI_ON_RESPAWN    = 0x0010,
    CSTATE_COMBAT                = 0x0020,
    CSTATE_COMBAT_WITH_ZONE      = 0x0040,
    CSTATE_ESCORTABLE            = 0x0080,
    CSTATE_DESPAWNING            = 0x0100,
    CSTATE_TARGETED_EMOTE        = 0x0200,
    CSTATE_IMPOSED_COOLDOWN      = 0x0400,
    CSTATE_INIT_AI_ON_UPDATE     = 0x0800,
};

// Vendors
struct VendorItem
{
    VendorItem(uint32 _item, uint32 _maxcount, uint32 _incrtime, uint32 _itemflags, uint32 _conditionId)
        : item(_item), maxcount(_maxcount), incrtime(_incrtime), itemflags(_itemflags), conditionId(_conditionId) {}

    uint32 item;
    uint32 maxcount;                                        // 0 for infinity item amount
    uint32 incrtime;                                        // time for restore items amount if maxcount != 0
    uint32 itemflags;
    uint32 conditionId;                                     // condition to check for this item
};
typedef std::vector<VendorItem*> VendorItemList;

struct VendorItemData
{
    VendorItemList m_items;

    VendorItem* GetItem(uint32 slot) const
    {
        if (slot>=m_items.size()) return nullptr;
        return m_items[slot];
    }
    bool Empty() const { return m_items.empty(); }
    uint8 GetItemCount() const { return m_items.size(); }
    void AddItem(uint32 item, uint32 maxcount, uint32 ptime, uint32 itemflags, uint32 conditonId)
    {
        m_items.push_back(new VendorItem(item, maxcount, ptime, itemflags, conditonId));
    }
    bool RemoveItem(uint32 item_id);
    VendorItem const* FindItem(uint32 item_id) const;
    size_t FindItemSlot(uint32 item_id) const;

    void Clear()
    {
        for (const auto& item : m_items)
            delete item;
        m_items.clear();
    }
};

struct VendorItemCount
{
    explicit VendorItemCount(uint32 _item, uint32 _count, uint32 _restockDelay)
        : itemId(_item), count(_count), restockDelay(_restockDelay), lastIncrementTime(time(nullptr)) {}

    uint32 itemId;
    uint32 count;
    uint32 restockDelay;
    time_t lastIncrementTime;
};

enum VendorItemFlags
{
    VENDOR_ITEM_FLAG_RANDOM_RESTOCK   = 0x01,
    VENDOR_ITEM_FLAG_DYNAMIC_RESTOCK  = 0x02,
};

typedef std::vector<VendorItemCount> VendorItemCounts;

struct TrainerSpell
{
    TrainerSpell() : spell(0), spellCost(0), reqSkill(0), reqSkillValue(0), reqLevel(0) {}

    TrainerSpell(uint32 _spell, uint32 _spellCost, uint32 _reqSkill, uint32 _reqSkillValue, uint32 _reqLevel)
        : spell(_spell), spellCost(_spellCost), reqSkill(_reqSkill), reqSkillValue(_reqSkillValue), reqLevel(_reqLevel)
    {}

    uint32 spell;
    uint32 spellCost;
    uint32 reqSkill;
    uint32 reqSkillValue;
    uint32 reqLevel;
};

typedef std::unordered_map<uint32 /*spellid*/, TrainerSpell> TrainerSpellMap;

struct TrainerSpellData
{
    TrainerSpellData() : trainerType(0) {}

    TrainerSpellMap spellList;
    uint32 trainerType;                                     // trainer type based at trainer spells, can be different from creature_template value.
                                                            // req. for correct show non-prof. trainers like weaponmaster, allowed values 0 and 2.
    TrainerSpell const* Find(uint32 spell_id) const;
    void Clear() { spellList.clear(); }
};

// max different by z coordinate for creature aggro reaction
#define CREATURE_Z_ATTACK_RANGE 3

#define MAX_VENDOR_ITEMS 128                                // Limitation in item count field size in SMSG_LIST_INVENTORY

#define MAX_VIRTUAL_ITEM_SLOT 3

enum VirtualItemInfoByteOffset
{
    VIRTUAL_ITEM_INFO_0_OFFSET_CLASS         = 0,
    VIRTUAL_ITEM_INFO_0_OFFSET_SUBCLASS      = 1,
    VIRTUAL_ITEM_INFO_0_OFFSET_MATERIAL      = 2,
    VIRTUAL_ITEM_INFO_0_OFFSET_INVENTORYTYPE = 3,

    VIRTUAL_ITEM_INFO_1_OFFSET_SHEATH        = 0,
};

enum CreatureSubtype
{
    CREATURE_SUBTYPE_GENERIC,                               // new Creature
    CREATURE_SUBTYPE_PET,                                   // new Pet
    CREATURE_SUBTYPE_TOTEM,                                 // new Totem
    CREATURE_SUBTYPE_TEMPORARY_SUMMON,                      // new TemporarySummon
};

enum TemporaryFactionFlags                                  // Used at real faction changes
{
    TEMPFACTION_NONE                    = 0x00,             // When no flag is used in temporary faction change, faction will be persistent. It will then require manual change back to default/another faction when changed once
    TEMPFACTION_RESTORE_RESPAWN         = 0x01,             // Default faction will be restored at respawn
    TEMPFACTION_RESTORE_COMBAT_STOP     = 0x02,             // ... at CombatStop() (happens at creature death, at evade or custom scripte among others)
    TEMPFACTION_RESTORE_REACH_HOME      = 0x04,             // ... at reaching home in home movement (evade), if not already done at CombatStop()
    TEMPFACTION_ALL,
};

#define MAX_LEVEL_DIFF_FOR_AGGRO_RANGE 25

#endif
