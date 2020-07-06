/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

#ifndef MANGOSSERVER_CREATURE_H
#define MANGOSSERVER_CREATURE_H

#include "Common.h"
#include "Unit.h"
#include "UpdateMask.h"
#include "ItemPrototype.h"
#include "SharedDefines.h"
#include "LootMgr.h"
#include "DBCEnums.h"
#include "Database/DatabaseEnv.h"
#include "CreatureGroups.h"
#include "Cell.h"
#include "Util.h"

#include <list>

class SpellEntry;

class CreatureAI;
class Group;
class Quest;
class Player;
class WorldSession;
class CreatureGroup;

struct GameEventCreatureData;

enum CreatureFlagsExtra
{
    CREATURE_FLAG_EXTRA_INSTANCE_BIND                = 0x00000001,       // creature kill bind instance with killer and killer's group
    CREATURE_FLAG_EXTRA_NO_AGGRO                     = 0x00000002,       // not aggro (ignore faction/reputation hostility)
    CREATURE_FLAG_EXTRA_NO_PARRY                     = 0x00000004,       // creature can't parry
    CREATURE_FLAG_EXTRA_SUMMON_GUARD                 = 0x00000008,       // creature summons a guard if an opposite faction player gets near or attacks
    CREATURE_FLAG_EXTRA_NO_BLOCK                     = 0x00000010,       // creature can't block
    CREATURE_FLAG_EXTRA_NO_CRUSH                     = 0x00000020,       // creature can't do crush attacks
    CREATURE_FLAG_EXTRA_NO_XP_AT_KILL                = 0x00000040,       // creature kill not provide XP
    CREATURE_FLAG_EXTRA_INVISIBLE                    = 0x00000080,       // creature is always invisible for player (mostly trigger creatures)
    CREATURE_FLAG_EXTRA_NOT_TAUNTABLE                = 0x00000100,       // creature is immune to taunt auras and effect attack me
    CREATURE_FLAG_EXTRA_AGGRO_ZONE                   = 0x00000200,       // creature sets itself in combat with zone on aggro
    CREATURE_FLAG_EXTRA_GUARD                        = 0x00000400,       // creature is a guard
    CREATURE_FLAG_EXTRA_NO_THREAT_LIST               = 0x00000800,
    CREATURE_FLAG_EXTRA_KEEP_POSITIVE_AURAS_ON_EVADE = 0x00001000,       // creature keeps positive auras at reset
    CREATURE_FLAG_EXTRA_ALWAYS_CRUSH                 = 0x00002000,       // creature always roll a crushing melee outcome when not miss/crit/dodge/parry/block
    CREATURE_FLAG_EXTRA_IMMUNE_AOE                   = 0x00004000,       // creature is immune to AoE
    CREATURE_FLAG_EXTRA_CHASE_GEN_NO_BACKING         = 0x00008000,       // creature does not move back when target is within bounding radius
    CREATURE_FLAG_EXTRA_NO_ASSIST                    = 0x00010000,       // creature does not aggro when nearby creatures aggro
    CREATURE_FLAG_EXTRA_NO_TARGET                    = 0x00020000,       // creature does not acquire targets
    CREATURE_FLAG_EXTRA_ONLY_VISIBLE_TO_FRIENDLY     = 0x00040000,       // creature can only be seen by friendly units
    CREATURE_FLAG_EXTRA_PVP                          = 0x00080000,       // creature has pvp unit flag set by default
    CREATURE_FLAG_EXTRA_CAN_ASSIST                   = 0x00100000,       // CREATURE_TYPEFLAGS_CAN_ASSIST from TBC
    CREATURE_FLAG_EXTRA_LARGE_AOI                    = 0x00200000,       // CREATURE_DIFFICULTYFLAGS_LARGE_AOI (200 yards)
    CREATURE_FLAG_EXTRA_GIGANTIC_AOI                 = 0x00400000,       // CREATURE_DIFFICULTYFLAGS_3_GIGANTIC_AOI (400 yards)
    CREATURE_FLAG_EXTRA_INFINITE_AOI                 = 0x00800000,       // CREATURE_DIFFICULTYFLAGS_3_INFINITE_AOI
};

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push,N), also any gcc version not support it at some platform
#if defined(__GNUC__)
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

#define MAX_DISPLAY_IDS_PER_CREATURE 4                                // only single send to client in static data
#define CREATURE_FLEE_TEXT 1150

#define SPEED_REDUCTION_NONE   1.0f
#define SPEED_REDUCTION_HP_15  0.7f
#define SPEED_REDUCTION_HP_10  0.6f
#define SPEED_REDUCTION_HP_5   0.5f

// from `creature_template` table
struct CreatureInfo
{
    uint32  entry;
    uint32  display_id[MAX_DISPLAY_IDS_PER_CREATURE];
    float   display_scale[MAX_DISPLAY_IDS_PER_CREATURE];
    uint32  display_probability[MAX_DISPLAY_IDS_PER_CREATURE];
    uint32  display_total_probability;
    char*   name;
    char*   subname;
    uint32  gossip_menu_id;
    uint32  level_min;
    uint32  level_max;
    uint32  health_min;
    uint32  health_max;
    uint32  mana_min;
    uint32  mana_max;
    uint32  armor;
    uint32  faction;
    uint32  npc_flags;
    float   speed_walk;
    float   speed_run;
    float   detection_range;                                // Detection Range for Line of Sight aggro
    float   call_for_help_range;                            // Radius for combat assistance call
    float   leash_range;                                    // Hard limit on allowed chase distance
    uint32  rank;
    float   xp_multiplier;
    float   dmg_min;
    float   dmg_max;
    uint32  dmg_school;
    uint32  attack_power;
    float   dmg_multiplier;
    uint32  base_attack_time;
    uint32  ranged_attack_time;
    uint32  unit_class;                                     // enum Classes. Note only 4 classes are known for creatures.
    uint32  unit_flags;                                     // enum UnitFlags mask values
    uint32  dynamic_flags;
    uint32  beast_family;                                   // enum CreatureFamily values (optional)
    uint32  trainer_type;
    uint32  trainer_spell;
    uint32  trainer_class;
    uint32  trainer_race;
    float   ranged_dmg_min;
    float   ranged_dmg_max;
    uint32  ranged_attack_power;
    uint32  type;                                           // enum CreatureType values
    uint32  type_flags;                                     // enum CreatureTypeFlags mask values
    uint32  loot_id;
    uint32  pickpocket_loot_id;
    uint32  skinning_loot_id;
    int32   holy_res;
    int32   fire_res;
    int32   nature_res;
    int32   frost_res;
    int32   shadow_res;
    int32   arcane_res;
    uint32  spells[CREATURE_MAX_SPELLS];
    uint32  spell_list_id;
    uint32  pet_spell_list_id;
    uint32  gold_min;
    uint32  gold_max;
    char const* ai_name;
    uint32  movement_type;
    uint32  inhabit_type;
    uint32  civilian;
    bool    racial_leader;
    uint32  regeneration;
    uint32  equipment_id;
    uint32  trainer_id;
    uint32  vendor_id;
    uint32  mechanic_immune_mask;
    uint32  school_immune_mask;
    uint32  flags_extra;
    uint32  script_id;

    // helpers
    static HighGuid GetHighGuid()
    {
        return HIGHGUID_UNIT;                               // in pre-3.x always HIGHGUID_UNIT
    }

    ObjectGuid GetObjectGuid(uint32 lowguid) const { return ObjectGuid(GetHighGuid(), entry, lowguid); }

    bool isTameable() const
    {
        return type == CREATURE_TYPE_BEAST && beast_family != 0 && type_flags & CREATURE_TYPEFLAGS_TAMEABLE;
    }
};

struct EquipmentInfo
{
    uint32  entry;
    uint32  equipentry[3];
};

#define MAX_CREATURE_IDS_PER_SPAWN 4

// from `creature` table
struct CreatureData
{
    std::array<uint32, MAX_CREATURE_IDS_PER_SPAWN> creature_id = {};
    WorldLocation position;
    uint32 display_id = 0;
    int32 equipment_id = 0;
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
    uint32 GetCreatureIdCount() const
    {
        uint32 creatureIdCount = 0;
        for (; creatureIdCount < MAX_CREATURE_IDS_PER_SPAWN && creature_id[creatureIdCount]; ++creatureIdCount);
        return creatureIdCount;
    }
};

// from `creature_addon` and `creature_template_addon`tables
struct CreatureDataAddon
{
    uint32 guidOrEntry;
    uint32 mount;
    uint32 bytes1;
    uint8  sheath_state;                                    // SheathState
    uint8  flags;                                           // UnitBytes2_Flags
    uint32 emote;
    uint32 move_flags;
    uint32 const* auras;                                    // loaded as char* "spell1 spell2 ... "
};

struct CreatureDisplayInfoAddon
{
    uint32 display_id;
    float bounding_radius;
    float combat_reach;
    uint8 gender;
    uint32 display_id_other_gender;                         // The oposite gender for this display id (male/female)
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
    CHAT_TYPE_ZONE_YELL         = 6
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

enum RegenStatsFlags
{
    REGEN_FLAG_HEALTH               = 0x001,
    REGEN_FLAG_POWER                = 0x002,
};

// Change to uint16 if adding more flags!
enum CreatureStateFlag : uint8
{
    CSTATE_ALREADY_CALL_ASSIST   = 0x01,
    CSTATE_ALREADY_SEARCH_ASSIST = 0x02,
    CSTATE_REGEN_HEALTH          = 0x04,
    CSTATE_REGEN_MANA            = 0x08,
    CSTATE_INIT_AI_ON_RESPAWN    = 0x10,
    CSTATE_COMBAT                = 0x20,
    CSTATE_COMBAT_WITH_ZONE      = 0x40,
    CSTATE_ESCORTABLE            = 0x80,
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

typedef std::list<VendorItemCount> VendorItemCounts;

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

#define MAX_VENDOR_ITEMS 255                                // Limitation in item count field size in SMSG_LIST_INVENTORY

enum VirtualItemSlot
{
    VIRTUAL_ITEM_SLOT_0 = 0,
    VIRTUAL_ITEM_SLOT_1 = 1,
    VIRTUAL_ITEM_SLOT_2 = 2,
};

#define MAX_VIRTUAL_ITEM_SLOT 3

enum VirtualItemInfoByteOffset
{
    VIRTUAL_ITEM_INFO_0_OFFSET_CLASS         = 0,
    VIRTUAL_ITEM_INFO_0_OFFSET_SUBCLASS      = 1,
    VIRTUAL_ITEM_INFO_0_OFFSET_MATERIAL      = 2,
    VIRTUAL_ITEM_INFO_0_OFFSET_INVENTORYTYPE = 3,

    VIRTUAL_ITEM_INFO_1_OFFSET_SHEATH        = 0,
};

struct CreatureCreatePos
{
    // exactly coordinates used
    CreatureCreatePos(Map* map, float x, float y, float z, float o)
        : m_map(map), m_closeObject(nullptr), m_angle(0.0f), m_dist(0.0f) { m_pos.x = x; m_pos.y = y; m_pos.z = z; m_pos.o = o; }
    // if dist == 0.0f -> exactly object coordinates used, in other case close point to object (CONTACT_DIST can be used as minimal distances)
    CreatureCreatePos(WorldObject* closeObject, float ori, float dist = 0.0f, float angle = 0.0f)
        : m_map(closeObject->GetMap()),
        m_closeObject(closeObject), m_angle(angle), m_dist(dist) { m_pos.o = ori; }

    Map* GetMap() const { return m_map; }
    void SelectFinalPoint(Creature* cr);
    bool Relocate(Creature* cr) const;

    // read only after SelectFinalPoint
    Position m_pos;
private:
    Map* m_map;
    WorldObject* m_closeObject;
    float m_angle;
    float m_dist;
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

class ThreatListProcesser
{
    public:
        ThreatListProcesser() {}
        virtual ~ThreatListProcesser() {}
        virtual bool Process(Unit* unit) = 0;
};

class Creature : public Unit
{
    CreatureAI *i_AI;

    public:

        explicit Creature(CreatureSubtype subtype = CREATURE_SUBTYPE_GENERIC);
        ~Creature() override;

        void AddToWorld() override;
        void RemoveFromWorld() override;

        bool Create(uint32 guidlow, CreatureCreatePos& cPos, CreatureInfo const* cinfo, Team team, uint32 firstCreatureId, CreatureData const* data = nullptr, GameEventCreatureData const* eventData = nullptr);
        bool LoadCreatureAddon(bool reload = false);
        void UnloadCreatureAddon(CreatureDataAddon const* data);

        // CreatureGroups
        CreatureGroup* GetCreatureGroup() const { return m_creatureGroup; }
        void SetCreatureGroup(CreatureGroup* group) { m_creatureGroup = group; }
        void JoinCreatureGroup(Creature* leader, float dist, float angle, uint32 options);
        void LeaveCreatureGroup();
        uint32 GetSpawnFlags() const;

        // Fonctions utilisees par les links, et appelle CreatureAI.
        void OnEnterCombat(Unit* pAttacker, bool notInCombat = false) override;
        void OnLeaveCombat() override;
        void RemoveAurasAtReset();
        // En cas de modification "manuelle" des stats.
        void ResetStats();

        void SelectLevel(CreatureInfo const* cinfo, float percentHealth = 100.0f, float percentMana = 100.0f);
        void LoadEquipment(uint32 equip_entry, bool force=false);

        bool HasStaticDBSpawnData() const;                  // listed in `creature` table and have fixed in DB guid
        uint32 GetDBTableGUIDLow() const;

        char const* GetSubName() const { return GetCreatureInfo()->subname; }

        void Update(uint32 update_diff, uint32 time) override;  // overwrite Unit::Update

        virtual void RegenerateAll(uint32 update_diff, bool skipCombatCheck = false);
        void GetRespawnCoord(float &x, float &y, float &z, float* ori = nullptr, float* dist = nullptr) const;
        uint32 GetEquipmentId() const { return m_equipmentId; }

        void SaveHomePosition() { SetHomePosition(GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation()); }
        void SetHomePosition(float x, float y, float z, float o);
        void GetHomePosition(float &x, float &y, float &z, float &o);
        Position const& GetHomePosition() { return m_homePosition; }
        float GetHomePositionO() const { return m_homePosition.o; }
        void ResetHomePosition();

        void AddCreatureState(CreatureStateFlag f) { m_creatureStateFlags |= f; }
        bool HasCreatureState(CreatureStateFlag f) const { return m_creatureStateFlags & f; }
        void ClearCreatureState(CreatureStateFlag f) { m_creatureStateFlags &= ~f; }
        bool HasTypeFlag(CreatureTypeFlags flag) const { return GetCreatureInfo()->type_flags & flag; }
        bool HasExtraFlag(CreatureFlagsExtra flag) const { return GetCreatureInfo()->flags_extra & flag; }

        CreatureSubtype GetSubtype() const { return m_subtype; }
        bool IsPet() const { return m_subtype == CREATURE_SUBTYPE_PET; }
        bool IsTotem() const { return m_subtype == CREATURE_SUBTYPE_TOTEM; }
        Totem const* ToTotem() const { return IsTotem() ? reinterpret_cast<Totem const*>(this) : nullptr; }
        Totem* ToTotem() { return IsTotem() ? reinterpret_cast<Totem*>(this) : nullptr; }
        bool IsTemporarySummon() const { return m_subtype == CREATURE_SUBTYPE_TEMPORARY_SUMMON; }
        bool IsCorpse() const { return GetDeathState() ==  CORPSE; }
        bool IsDespawned() const { return GetDeathState() ==  DEAD; }
        void SetCorpseDelay(uint32 delay) { m_corpseDelay = delay; }
        bool IsRacialLeader() const { return GetCreatureInfo()->racial_leader; }
        bool IsCivilian() const { return GetCreatureInfo()->civilian; }
        bool IsTrigger() const { return HasExtraFlag(CREATURE_FLAG_EXTRA_INVISIBLE); }
        bool IsGuard() const { return HasExtraFlag(CREATURE_FLAG_EXTRA_GUARD); }

        // World of Warcraft Client Patch 1.10.0 (2006-03-28)
        // - Area effect spells and abilities will no longer consider totems as
        //   valid targets.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        bool IsImmuneToAoe() const { return IsTotem() || HasExtraFlag(CREATURE_FLAG_EXTRA_IMMUNE_AOE); }
#else
        bool IsImmuneToAoe() const { return HasExtraFlag(CREATURE_FLAG_EXTRA_IMMUNE_AOE); }
#endif

        bool CanWalk() const override { return GetCreatureInfo()->inhabit_type & INHABIT_GROUND; }
        bool CanSwim() const override { return IsPet() || GetCreatureInfo()->inhabit_type & INHABIT_WATER; }
        bool CanFly()  const override { return !IsPet() && GetCreatureInfo()->inhabit_type & INHABIT_AIR; }

        void SetReactState(ReactStates st) { m_reactState = st; }
        ReactStates GetReactState() const { return m_reactState; }
        bool HasReactState(ReactStates state) const { return (m_reactState == state); }
        void InitializeReactState()
        {
            if (IsTotem() || IsTrigger() || GetCreatureType() == CREATURE_TYPE_CRITTER)
                SetReactState(REACT_PASSIVE);
            else
                SetReactState(REACT_AGGRESSIVE);
        }

        bool IsTrainerOf(Player* player, bool msg) const;
        bool CanInteractWithBattleMaster(Player* player, bool msg) const;
        bool CanTrainAndResetTalentsOf(Player* pPlayer) const;

        bool IsOutOfThreatArea(Unit* pVictim) const;
        void FillGuidsListFromThreatList(std::vector<ObjectGuid>& guids, uint32 maxamount = 0);

        bool IsImmuneToSpell(SpellEntry const* spellInfo, bool castOnSelf) const override;
        bool IsImmuneToDamage(SpellSchoolMask meleeSchoolMask, SpellEntry const* spellInfo = nullptr) const override;
        bool IsImmuneToSpellEffect(SpellEntry const* spellInfo, SpellEffectIndex index, bool castOnSelf) const override;

        bool IsElite() const
        {
            if (IsPet())
                return false;

            uint32 rank = GetCreatureInfo()->rank;
            return rank != CREATURE_ELITE_NORMAL && rank != CREATURE_ELITE_RARE;
        }

        bool IsWorldBoss() const
        {
            if (IsPet())
                return false;

            return GetCreatureInfo()->rank == CREATURE_ELITE_WORLDBOSS;
        }

        bool IsInEvadeMode() const;

        bool AIM_Initialize();
        void SetAI(CreatureAI * ai) { i_AI = ai; }

        CreatureAI* AI() { return i_AI; }
        CreatureAI const* AI() const { return i_AI; }
        void SetAInitializeOnRespawn(bool initialize)
        {
            if (initialize)
                AddCreatureState(CSTATE_INIT_AI_ON_RESPAWN);
            else
                ClearCreatureState(CSTATE_INIT_AI_ON_RESPAWN);
        }

        uint32 GetShieldBlockValue() const override
        {
            return GetLevel() / 2 + uint32(GetStat(STAT_STRENGTH) / 20); // dunno mob block value
        }

        SpellSchoolMask GetMeleeDamageSchoolMask() const override { return m_meleeDamageSchoolMask; }
        void SetMeleeDamageSchool(SpellSchools school) { m_meleeDamageSchoolMask = GetSchoolMask(school); }

        bool HasSpell(uint32 spellId) const override;

        bool UpdateEntry(uint32 entry, Team team = ALLIANCE, CreatureData const* data = nullptr, GameEventCreatureData const* eventData = nullptr, bool preserveHPAndPower = true);

        void ApplyGameEventSpells(GameEventCreatureData const* eventData, bool activated);
        bool UpdateStats(Stats stat) override;
        bool UpdateAllStats() override;
        void UpdateResistances(uint32 school) override;
        void UpdateArmor() override;
        void UpdateMaxHealth() override;
        void UpdateMaxPower(Powers power) override;
        void UpdateManaRegen() override;
        void UpdateAttackPowerAndDamage(bool ranged = false) override;
        void UpdateDamagePhysical(WeaponAttackType attType) override;
        uint32 GetCurrentEquipmentId() const { return m_equipmentId; }

        static float _GetHealthMod(int32 rank);             ///< Get custom factor to scale health (default 1, CONFIG_FLOAT_RATE_CREATURE_*_HP)
        static float _GetDamageMod(int32 rank);             ///< Get custom factor to scale damage (default 1, CONFIG_FLOAT_RATE_*_DAMAGE)
        static float _GetSpellDamageMod(int32 rank);        ///< Get custom factor to scale spell damage (default 1, CONFIG_FLOAT_RATE_*_SPELLDAMAGE)

        VendorItemData const* GetVendorItems() const;
        VendorItemData const* GetVendorTemplateItems() const;
        uint32 GetVendorItemCurrentCount(VendorItem const* vItem);
        uint32 UpdateVendorItemCurrentCount(VendorItem const* vItem, uint32 used_count);

        TrainerSpellData const* GetTrainerTemplateSpells() const;
        TrainerSpellData const* GetTrainerSpells() const;

        CreatureInfo const* GetCreatureInfo() const { return m_creatureInfo; }
        CreatureDataAddon const* GetCreatureAddon() const;
        CreatureData const* GetCreatureData() const;

        static uint32 ChooseDisplayId(CreatureInfo const* cinfo, CreatureData const* data = nullptr, GameEventCreatureData const* eventData = nullptr, float* scale = nullptr);
        static float GetScaleForDisplayId(uint32 displayId);

        std::string GetAIName() const;
        std::string GetScriptName() const;
        uint32 GetScriptId() const;

        // overwrite WorldObject function for proper name localization
        char const* GetNameForLocaleIdx(int32 locale_idx) const override;

        void SetDeathState(DeathState s) override;                   // overwrite virtual Unit::SetDeathState
        bool FallGround();

        bool LoadFromDB(uint32 guid, Map* map);
        void SaveToDB();
                                                            // overwrited in Pet
        virtual void SaveToDB(uint32 mapid);
        virtual void DeleteFromDB();                        // overwrited in Pet
        static void DeleteFromDB(uint32 lowguid, CreatureData const* data);

        Loot loot;
        bool lootForPickPocketed;
        bool lootForBody;
        bool lootForSkin;
        uint32 skinningForOthersTimer; // If == 0, then everyone can skin
        bool lootForCreator = false;

        ObjectGuid GetLootRecipientGuid() const { return m_lootRecipientGuid; }
        uint32 GetLootGroupRecipientId() const { return m_lootGroupRecipientId; }
        Player* GetLootRecipient() const;                   // use group cases as prefered
        Group* GetGroupLootRecipient() const;
        bool HasLootRecipient() const { return m_lootGroupRecipientId || m_lootRecipientGuid; }
        bool IsGroupLootRecipient() const { return m_lootGroupRecipientId; }
        void SetLootRecipient(Unit* unit);
        void AllLootRemovedFromCorpse();
        Player* GetOriginalLootRecipient() const;           // ignore group changes/etc, not for looting
        bool IsTappedBy(Player const* player) const;
        bool IsSkinnableBy(Player const* player) const { return !skinningForOthersTimer || IsTappedBy(player); }

        uint32 m_spells[CREATURE_MAX_SPELLS];

        float GetAttackDistance(Unit const* pl) const;
        float GetDetectionRange() const { return m_detectionDistance; }

        void SendAIReaction(AiReaction reactionType);

        void DoFlee();
        void DoFleeToGetAssistance();
        float GetFleeingSpeed() const;
        void MoveAwayFromTarget(Unit* pTarget, float distance);
        void CallForHelp(float fRadius);
        void CallAssistance();
        void SetNoCallAssistance(bool val)
        { 
            if (val)
                AddCreatureState(CSTATE_ALREADY_CALL_ASSIST);
            else
                ClearCreatureState(CSTATE_ALREADY_CALL_ASSIST);
        }
        void SetNoSearchAssistance(bool val)
        {
            if (val)
                AddCreatureState(CSTATE_ALREADY_SEARCH_ASSIST);
            else
                ClearCreatureState(CSTATE_ALREADY_SEARCH_ASSIST);
        }
        bool HasSearchedAssistance() const { return HasCreatureState(CSTATE_ALREADY_SEARCH_ASSIST); }
        bool CanAssistTo(Unit const* u, Unit const* enemy, bool checkfaction = true) const;
        bool CanInitiateAttack();
        bool CanHaveTarget() const { return !HasExtraFlag(CREATURE_FLAG_EXTRA_NO_TARGET); }

        uint32 GetDefaultMount() { return m_mountId; }
        void SetDefaultMount(uint32 id) { m_mountId = id; }
        
        void SetTauntImmunity(bool immune);

        MovementGeneratorType GetDefaultMovementType() const { return m_defaultMovementType; }
        void SetDefaultMovementType(MovementGeneratorType mgt) { m_defaultMovementType = mgt; }

        // for use only in LoadHelper, Map::Add Map::CreatureCellRelocation
        Cell const& GetCurrentCell() const { return m_currentCell; }
        void SetCurrentCell(Cell const& cell) { m_currentCell = cell; }

        bool IsVisibleInGridForPlayer(Player const* pl) const override;

        void RemoveCorpse();
        bool IsDeadByDefault() const;

        void ForcedDespawn(uint32 timeMSToDespawn = 0);
        void DespawnOrUnsummon(uint32 msTimeToDespawn = 0);

        time_t const& GetRespawnTime() const { return m_respawnTime; }
        time_t GetRespawnTimeEx() const;
        void SetRespawnTime(uint32 respawn) { m_respawnTime = respawn ? time(nullptr) + respawn : 0; }
        void Respawn();
        void SaveRespawnTime() override;
        void ApplyDynamicRespawnDelay(uint32& delay, CreatureData const* data);

        uint32 GetRespawnDelay() const { return m_respawnDelay; }
        void SetRespawnDelay(uint32 delay) { m_respawnDelay = delay; }

        float GetWanderDistance() const { return m_wanderDistance; }
        void SetWanderDistance(float dist) { m_wanderDistance = dist; }

        // Functions spawn/remove creature with DB guid in all loaded map copies (if point grid loaded in map)
        static void AddToRemoveListInMaps(uint32 db_guid, CreatureData const* data);
        static void SpawnInMaps(uint32 db_guid, CreatureData const* data);

        void StartGroupLoot(Group* group, uint32 timer);

        void SendZoneUnderAttackMessage(Player* attacker);

        void SetInCombatWithZone(bool initialPulse = true);
        bool canStartAttack(Unit const* who, bool force) const;
        bool _IsTargetAcceptable(Unit const* target) const;
        bool canCreatureAttack(Unit const* pVictim, bool force) const;

        // Smartlog
        time_t GetCombatTime(bool total) const;
        void ResetCombatTime(bool combat = false);
        void UpdateCombatState(bool combat)
        {
            if (combat)
                AddCreatureState(CSTATE_COMBAT);
            else
                ClearCreatureState(CSTATE_COMBAT);
        }
        // For raid bosses that set the entire raid in combat
        void UpdateCombatWithZoneState(bool combat)
        {
            if (combat)
                AddCreatureState(CSTATE_COMBAT_WITH_ZONE);
            else
                ClearCreatureState(CSTATE_COMBAT_WITH_ZONE);
        }
        void LogDeath(Unit* pKiller) const;
        void LogLongCombat() const;
        void LogScriptInfo(std::ostringstream &data) const;
        // Smartlog end

        Unit* SelectAttackingTarget(AttackingTarget target, uint32 position, uint32 spellId, uint32 selectFlags = SELECT_FLAG_NO_TOTEM) const;
        Unit* SelectAttackingTarget(AttackingTarget target, uint32 position, SpellEntry const* pSpellInfo = nullptr, uint32 selectFlags = SELECT_FLAG_NO_TOTEM) const;

        // AI helpers
        Unit* SelectNearestHostileUnitInAggroRange(bool useLOS, bool ignoreCivilians = false) const;
        Unit* SelectNearestTargetInAttackDistance(float dist) const;
        Creature* FindNearestFriendlyGuard(float range) const;
        void CallNearestGuard(Unit* pEnemy) const;

        // Used by Creature Spells system to always know result of cast
        SpellCastResult TryToCast(Unit* pTarget, uint32 uiSpell, uint32 uiCastFlags, uint8 uiChance);
        SpellCastResult TryToCast(Unit* pTarget, SpellEntry const* pSpellInfo, uint32 uiCastFlags, uint8 uiChance);

        // Unit on which the creature is currently casting a spell. Used to make mobs face their cast target.
        // Client makes creatures always face unit sent in UNIT_FIELD_TARGET, orientation doesn't matter.
        // We send this guid instead when its set, to avoid overwriting the unit field.
        void SetCastingTarget(Unit const* pTarget)
        {
            if (pTarget != GetVictim())
            {
                m_castingTargetGuid = pTarget->GetGUID();
                ForceValuesUpdateAtIndex(UNIT_FIELD_TARGET);
                ForceValuesUpdateAtIndex(UNIT_FIELD_TARGET + 1);
            }
        }
        void ClearCastingTarget()
        {
            if (m_castingTargetGuid)
            {
                m_castingTargetGuid = 0;
                ForceValuesUpdateAtIndex(UNIT_FIELD_TARGET);
                ForceValuesUpdateAtIndex(UNIT_FIELD_TARGET + 1);
            }
        }
        uint64 m_castingTargetGuid;

        // - Victim selection (from aggro list)
        Unit* GetNearestVictimInRange(float min, float max);
        Unit* GetFarthestVictimInRange(float min, float max);
        Unit* GetVictimInRange(float min, float max);
        Unit* GetHostileCasterInRange(float min, float max);
        Unit* GetHostileCaster();

        // - Generic Selection
        void ProcessThreatList(ThreatListProcesser* f);

        // Spell Launch :
        // Return true if target found. 
        bool CastSpellOnFarthestVictim (uint32 spellId, float min = 0.0f, float max = 100.0f, bool triggered = false);
        bool CastSpellOnNearestVictim(uint32 spellId, float min = 0.0f, float max = 100.0f, bool triggered = false);
        bool CastSpellOnHostileCasterInRange(uint32 spellId, float min = 0.0f, float max = 100.0f, bool triggered = false);
        // Set in combat with units on the threatlist of 'pOther'
        void AddThreatsOf(Creature const* pOther);

        bool HasQuest(uint32 quest_id) const override;
        bool HasInvolvedQuest(uint32 quest_id)  const override;

        void SetDefaultGossipMenuId(uint32 menuId) { m_gossipMenuId = menuId; }
        uint32 GetDefaultGossipMenuId() const override { return m_gossipMenuId; }

        GridReference<Creature>& GetGridRef() { return m_gridRef; }
        bool IsRegeneratingHealth() const { return HasCreatureState(CSTATE_REGEN_HEALTH); }
        bool IsRegeneratingMana() const { return HasCreatureState(CSTATE_REGEN_MANA); }
        virtual uint8 GetPetAutoSpellSize() const { return CREATURE_MAX_SPELLS; }
        virtual uint32 GetPetAutoSpellOnPos(uint8 pos) const
        {
            if (pos >= CREATURE_MAX_SPELLS || m_charmInfo->GetCharmSpell(pos)->GetType() != ACT_ENABLED)
                return 0;
            return m_charmInfo->GetCharmSpell(pos)->GetAction();
        }

        void SetCombatStartPosition(float x, float y, float z) { m_combatStartX = x; m_combatStartY = y; m_combatStartZ = z; }
        void GetCombatStartPosition(float &x, float &y, float &z) const
        { x = m_combatStartX; y = m_combatStartY; z = m_combatStartZ; }

        void SetSummonPoint(CreatureCreatePos const& pos) { m_summonPos = pos.m_pos; }
        void GetSummonPoint(float &fX, float &fY, float &fZ, float &fOrient) const { fX = m_summonPos.x; fY = m_summonPos.y; fZ = m_summonPos.z; fOrient = m_summonPos.o; }

        void SetNoXP() { AddUnitState(UNIT_STAT_NO_KILL_REWARD); }

        void SetFactionTemporary(uint32 factionId, uint32 tempFactionFlags = TEMPFACTION_ALL);
        void ClearTemporaryFaction();
        uint32 GetTemporaryFactionFlags() const { return m_temporaryFactionFlags; }
        int32 GetReputationId() const { return m_reputationId; }

        void SendAreaSpiritHealerQueryOpcode(Player* pl);

        void DisappearAndDie();

        // Auto evade timer (if target not reachable)
        // Tested on retail 5.4.0: Creatures evade after 3 seconds (but does not return to home position)
        bool IsEvadeBecauseTargetNotReachable() const { return m_TargetNotReachableTimer > 3000; }
        uint32 GetLastDamageTakenTime() const { return m_lastDamageTakenForEvade; }
        void   ResetLastDamageTakenTime() { m_lastDamageTakenForEvade = 0; }
        uint32 m_TargetNotReachableTimer;

        bool IsTempPacified() const         { return m_pacifiedTimer > 0; }
        void SetTempPacified(uint32 timer)  { if (m_pacifiedTimer < timer) m_pacifiedTimer = timer; }
        uint32 GetTempPacifiedTimer() const { return m_pacifiedTimer; }
        uint32 m_pacifiedTimer;
        uint32 m_manaRegen;

        void RegenerateHealth();
        void RegenerateMana();

        void SetVirtualItem(VirtualItemSlot slot, uint32 item_id);

        void ResetDamageTakenOrigin()
        {
            m_playerDamageTaken     = 0;
            m_nonPlayerDamageTaken   = 0;
        }

        void CountDamageTaken(uint32 damage, bool fromPlayerOrSelf)
        {
            if (fromPlayerOrSelf)
                m_playerDamageTaken += damage;
            else
                m_nonPlayerDamageTaken += damage;
        }

        bool IsLootAllowedDueToDamageOrigin() const
        {
            return 65 * m_playerDamageTaken > 35 * m_nonPlayerDamageTaken;
        }

        float GetXPModifierDueToDamageOrigin() const
        {
            // If players dealt less than 35% of the damage, no XP and no loot - or both=0
            if (!IsLootAllowedDueToDamageOrigin())
                return 0.0f;
            return float(m_playerDamageTaken) / (m_playerDamageTaken + m_nonPlayerDamageTaken);
        }

        bool HasWeapon() const;

        void SetCallForHelpDist(float dist)
        {
            m_callForHelpDist = dist;
        }

        void SetLeashDistance(float dist)
        {
            m_leashDistance = dist;
        }

        void SetDetectionDistance(float dist)
        {
            m_detectionDistance = dist;
        }

        // (msecs)timer used for group loot
        uint32 GetGroupLootTimer() { return m_groupLootTimer; }

        void SetEscortable(bool escortable)
        {
            if (escortable)
                AddCreatureState(CSTATE_ESCORTABLE);
            else
                ClearCreatureState(CSTATE_ESCORTABLE); 
        }
        bool IsEscortable() const { return HasCreatureState(CSTATE_ESCORTABLE); }
        bool CanAssistPlayers() { return HasExtraFlag(CREATURE_FLAG_EXTRA_CAN_ASSIST); }
        bool CanSummonGuards() { return HasExtraFlag(CREATURE_FLAG_EXTRA_SUMMON_GUARD); }
        uint32 GetOriginalEntry() const { return m_originalEntry; }

    protected:
        bool MeetsSelectAttackingRequirement(Unit* pTarget, SpellEntry const* pSpellInfo, uint32 selectFlags) const;

        bool CreateFromProto(uint32 guidlow, CreatureInfo const* cinfo, Team team, uint32 firstCreatureId, CreatureData const* data = nullptr, GameEventCreatureData const* eventData = nullptr);
        bool InitEntry(uint32 entry, Team team=ALLIANCE, CreatureData const* data = nullptr, GameEventCreatureData const* eventData = nullptr);

        uint32 m_groupLootTimer;                            // (msecs)timer used for group loot
        uint32 m_groupLootId;                               // used to find group which is looting corpse
        void StopGroupLoot();

        // vendor items
        VendorItemCounts m_vendorItemCounts;

        uint32 m_lootMoney;
        ObjectGuid m_lootRecipientGuid;                     // player who will have rights for looting if m_lootGroupRecipient==0 or group disbanded
        uint32 m_lootGroupRecipientId;                      // group who will have rights for looting if set and exist

        /// Timers
        uint32 m_corpseDecayTimer;                          // (msecs)timer for death or corpse disappearance
        time_t m_respawnTime;                               // (secs) time of next respawn
        uint32 m_respawnDelay;                              // (secs) delay between corpse disappearance and respawning
        uint32 m_corpseDelay;                               // (secs) delay between death and corpse disappearance
        float m_wanderDistance;

        time_t m_combatStartTime;
        uint32 m_combatResetCount;

        CreatureSubtype m_subtype;                          // set in Creatures subclasses for fast it detect without dynamic_cast use
        MovementGeneratorType m_defaultMovementType;
        Cell m_currentCell;                                 // store current cell where creature listed
        uint32 m_equipmentId;
        uint32 m_mountId;                                   // display Id to mount

        bool m_AI_locked;
        uint8 m_creatureStateFlags;                         // change this to uint16 if adding more state flags
        uint32 m_temporaryFactionFlags;                     // used for real faction changes (not auras etc)
        int32 m_reputationId;                               // Id of the creature's faction in the client reputations list.
        uint32 m_gossipMenuId;

        SpellSchoolMask m_meleeDamageSchoolMask;
        uint32 m_originalEntry;

        CreatureGroup* m_creatureGroup;

        float m_combatStartX;
        float m_combatStartY;
        float m_combatStartZ;

        Position m_homePosition;

        ReactStates m_reactState;

        Position m_summonPos;

        uint32 m_lastDamageTakenForEvade;
        // Used to compute XP.
        uint32 m_playerDamageTaken;
        uint32 m_nonPlayerDamageTaken;
        
        float m_callForHelpDist;
        float m_leashDistance;
        float m_detectionDistance;

    private:
        GridReference<Creature> m_gridRef;
        CreatureInfo const* m_creatureInfo;
};

class AssistDelayEvent : public BasicEvent
{
    public:
        AssistDelayEvent(ObjectGuid victim, Unit& owner, std::list<Creature*> const& assistants);

        bool Execute(uint64 e_time, uint32 p_time) override;
    private:
        AssistDelayEvent();

        ObjectGuid              m_victimGuid;
        std::vector<ObjectGuid> m_assistantGuids;
        Unit&                   m_owner;
};

class ForcedDespawnDelayEvent : public BasicEvent
{
    public:
        explicit ForcedDespawnDelayEvent(Creature& owner) : BasicEvent(), m_owner(owner) { }
        bool Execute(uint64 e_time, uint32 p_time) override;

    private:
        Creature& m_owner;
};

#endif
