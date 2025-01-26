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

#ifndef _SPELLMGR_H
#define _SPELLMGR_H

// For static or at-server-startup loaded spell data

#include "Common.h"
#include "SharedDefines.h"
#include "SpellAuraDefines.h"
#include "DBCStructure.h"
#include "DBCStores.h"
#include "SQLStorages.h"
#include "SpellEntry.h"

#include <map>
#include <memory>

class Player;
class Spell;
class Unit;

struct SpellProcEventEntry
{
    uint32      schoolMask;
    uint32      spellFamilyName;                            // if nonzero - for matching proc condition based on candidate spell's SpellFamilyNamer value
    uint64      spellFamilyMask[MAX_EFFECT_INDEX];          // if nonzero - for matching proc condition based on candidate spell's SpellFamilyFlags  (like auras 107 and 108 do)
    uint32      procFlags;                                  // bitmask for matching proc event
    uint32      procEx;                                     // proc Extend info (see ProcFlagsEx)
    float       ppmRate;                                    // for melee (ranged?) damage spells - proc rate per minute. if zero, falls back to flat chance from Spell.dbc
    float       customChance;                               // Owerride chance (in most cases for debug only)
    uint32      cooldown;                                   // hidden cooldown used for some spell proc events, applied to _triggered_spell_
};

typedef std::unordered_map<uint32, SpellProcEventEntry> SpellProcEventMap;

//==========================
// Spell Groups (TC)
//==========================

enum SpellGroup
{
    SPELL_GROUP_NULL = 0,
    // Not needed pre-BC ?
    /*SPELL_GROUP_ELIXIR_BATTLE = 1,
    SPELL_GROUP_ELIXIR_GUARDIAN = 2,
    SPELL_GROUP_ELIXIR_UNSTABLE = 3,
    SPELL_GROUP_ELIXIR_SHATTRATH = 4,*/
    SPELL_GROUP_CORE_RANGE_MAX = 1,
};

//                  spell_id, group_id
typedef std::multimap<uint32, SpellGroup > SpellSpellGroupMap;
typedef std::pair<SpellSpellGroupMap::const_iterator,SpellSpellGroupMap::const_iterator> SpellSpellGroupMapBounds;

//                      group_id, spell_id
typedef std::multimap<SpellGroup, int32> SpellGroupSpellMap;
typedef std::pair<SpellGroupSpellMap::const_iterator,SpellGroupSpellMap::const_iterator> SpellGroupSpellMapBounds;

enum SpellGroupStackRule
{
    SPELL_GROUP_STACK_RULE_DEFAULT = 0, // Inutile
    SPELL_GROUP_STACK_RULE_EXCLUSIVE = 1,
    //SPELL_GROUP_STACK_RULE_EXCLUSIVE_FROM_SAME_CASTER = 2, // Inutilise, non implemente.
    SPELL_GROUP_STACK_RULE_POWERFULL_CHAIN = 3,
};
#define SPELL_GROUP_STACK_RULE_MAX 4

typedef std::map<SpellGroup, SpellGroupStackRule> SpellGroupStackMap;

#define ELIXIR_FLASK_MASK     0x03                          // 2 bit mask for batter compatibility with more recent client version, flaks must have both bits set
#define ELIXIR_WELL_FED       0x10                          // Some foods have SPELLFAMILY_POTION

struct SpellThreatEntry
{
    uint16 threat;
    float multiplier;
    float ap_bonus;
};

typedef std::map<uint32, uint8> SpellElixirMap;
typedef std::map<uint32, uint32> SpellEnchantChargesMap;
typedef std::map<uint32, float> SpellProcItemEnchantMap;
typedef std::map<uint32, SpellThreatEntry> SpellThreatMap;

// Spell script target related declarations (accessed using SpellMgr functions)
enum SpellTargetType
{
    SPELL_TARGET_TYPE_GAMEOBJECT = 0,
    SPELL_TARGET_TYPE_CREATURE   = 1,
    SPELL_TARGET_TYPE_DEAD       = 2
};

#define MAX_SPELL_TARGET_TYPE 3

struct SpellTargetEntry
{
    SpellTargetEntry(SpellTargetType type_, uint32 targetEntry_, uint32 conditionId_, uint32 inverseEffectMask_) : type(type_), targetEntry(targetEntry_), conditionId(conditionId_), inverseEffectMask(inverseEffectMask_) {}
    SpellTargetType type;
    uint32 targetEntry;
    uint32 conditionId;
    uint32 inverseEffectMask;

    bool CanNotHitWithSpellEffect(SpellEffectIndex effect) const { return (inverseEffectMask & (1 << effect)) != 0; }
};

typedef std::multimap<uint32,SpellTargetEntry> SpellScriptTarget;
typedef std::pair<SpellScriptTarget::const_iterator,SpellScriptTarget::const_iterator> SpellScriptTargetBounds;

// coordinates for spells (accessed using SpellMgr functions)
typedef WorldLocation SpellTargetPosition;

typedef std::unordered_map<uint32, SpellTargetPosition> SpellTargetPositionMap;

// Spell pet auras
class PetAura
{
    public:
        PetAura() : removeOnChangePet(false), damage(0)
        {
            auras.clear();
        }

        PetAura(uint32 petEntry, uint32 aura, bool _removeOnChangePet, int _damage) :
        removeOnChangePet(_removeOnChangePet), damage(_damage)
        {
            auras[petEntry] = aura;
        }

        uint32 GetAura(uint32 petEntry) const
        {
            std::map<uint32, uint32>::const_iterator itr = auras.find(petEntry);
            if (itr != auras.end())
                return itr->second;
            else
            {
                std::map<uint32, uint32>::const_iterator itr2 = auras.find(0);
                if (itr2 != auras.end())
                    return itr2->second;
                else
                    return 0;
            }
        }

        void AddAura(uint32 petEntry, uint32 aura)
        {
            auras[petEntry] = aura;
        }

        bool IsRemovedOnChangePet() const
        {
            return removeOnChangePet;
        }

        int32 GetDamage() const
        {
            return damage;
        }

    private:
        std::map<uint32, uint32> auras;
        bool removeOnChangePet;
        int32 damage;
};
typedef std::map<uint16, PetAura> SpellPetAuraMap;

struct SpellArea
{
    uint32 spellId;
    uint32 areaId;                                          // zone/subzone/or 0 is not limited to zone
    uint32 questStart;                                      // quest start (quest must be active or rewarded for spell apply)
    uint32 questEnd;                                        // quest end (quest don't must be rewarded for spell apply)
    int32  auraSpell;                                       // spell aura must be applied for spell apply )if possitive) and it don't must be applied in other case
    uint32 raceMask;                                        // can be applied only to races
    Gender gender;                                          // can be applied only to gender
    bool questStartCanActive;                               // if true then quest start can be active (not only rewarded)
    bool autocast;                                          // if true then auto applied at area enter, in other case just allowed to cast

    // helpers
    bool IsFitToRequirements(Player const* player, uint32 newZone, uint32 newArea) const;
};

typedef std::multimap<uint32,SpellArea> SpellAreaMap;
typedef std::multimap<uint32,SpellArea const*> SpellAreaForQuestMap;
typedef std::multimap<uint32,SpellArea const*> SpellAreaForAuraMap;
typedef std::multimap<uint32,SpellArea const*> SpellAreaForAreaMap;
typedef std::pair<SpellAreaMap::const_iterator,SpellAreaMap::const_iterator> SpellAreaMapBounds;
typedef std::pair<SpellAreaForQuestMap::const_iterator,SpellAreaForQuestMap::const_iterator> SpellAreaForQuestMapBounds;
typedef std::pair<SpellAreaForAuraMap::const_iterator, SpellAreaForAuraMap::const_iterator>  SpellAreaForAuraMapBounds;
typedef std::pair<SpellAreaForAreaMap::const_iterator, SpellAreaForAreaMap::const_iterator>  SpellAreaForAreaMapBounds;


// Spell rank chain  (accessed using SpellMgr functions)
struct SpellChainNode
{
    uint32 prev;
    uint32 first;
    uint32 req;
    uint8  rank;
};

typedef std::unordered_map<uint32, SpellChainNode> SpellChainMap;
typedef std::multimap<uint32, uint32> SpellChainMapNext;

// Spell learning properties (accessed using SpellMgr functions)
struct SpellLearnSkillNode
{
    uint16 skill;
    uint16 step;
    uint16 value;                                           // 0  - max skill value for player level
    uint16 maxvalue;                                        // 0  - max skill value for player level
};

typedef std::map<uint32, SpellLearnSkillNode> SpellLearnSkillMap;

struct SpellLearnSpellNode
{
    uint32 spell;
    bool active;                                            // show in spellbook or not
    bool autoLearned;
};

typedef std::multimap<uint32, SpellLearnSpellNode> SpellLearnSpellMap;
typedef std::pair<SpellLearnSpellMap::const_iterator,SpellLearnSpellMap::const_iterator> SpellLearnSpellMapBounds;

typedef std::multimap<uint32, SkillLineAbilityEntry const*> SkillLineAbilityMap;
typedef std::pair<SkillLineAbilityMap::const_iterator,SkillLineAbilityMap::const_iterator> SkillLineAbilityMapBounds;

typedef std::multimap<uint32, SkillRaceClassInfoEntry const*> SkillRaceClassInfoMap;
typedef std::pair<SkillRaceClassInfoMap::const_iterator,SkillRaceClassInfoMap::const_iterator> SkillRaceClassInfoMapBounds;

inline bool IsPrimaryProfessionSkill(uint32 skill)
{
    SkillLineEntry const* pSkill = sSkillLineStore.LookupEntry(skill);
    if (!pSkill)
        return false;

    if (pSkill->categoryId != SKILL_CATEGORY_PROFESSION)
        return false;

    return true;
}

inline bool IsProfessionSkill(uint32 skill)
{
    return  IsPrimaryProfessionSkill(skill) || skill == SKILL_FISHING || skill == SKILL_COOKING || skill == SKILL_FIRST_AID;
}

inline bool IsProfessionOrRidingSkill(uint32 skill)
{
    return  IsProfessionSkill(skill) || skill == SKILL_RIDING;
}

typedef std::vector<std::unique_ptr<SpellEntry>> SpellEntryMap;

class SpellMgr
{
    friend struct DoSpellBonuses;
    friend struct DoSpellProcEvent;
    friend struct DoSpellProcItemEnchant;

    // Constructors
    public:
        SpellMgr();
        ~SpellMgr() = default;

    // Accessors (const or static functions)
    public:
        // Spell Groups - TrinityCore
        SpellSpellGroupMapBounds GetSpellSpellGroupMapBounds(uint32 spell_id) const
        {
            spell_id = GetFirstSpellInChain(spell_id);
            return SpellSpellGroupMapBounds(mSpellSpellGroup.lower_bound(spell_id),mSpellSpellGroup.upper_bound(spell_id));
        }
        uint32 IsSpellMemberOfSpellGroup(uint32 spellid, SpellGroup groupid) const
        {
            SpellSpellGroupMapBounds spellGroup = GetSpellSpellGroupMapBounds(spellid);
            for (SpellSpellGroupMap::const_iterator itr = spellGroup.first; itr != spellGroup.second ; ++itr)
            {
                if (itr->second == groupid)
                    return true;
            }
            return false;
        }

        SpellGroupSpellMapBounds GetSpellGroupSpellMapBounds(SpellGroup group_id) const
        {
            return SpellGroupSpellMapBounds(mSpellGroupSpell.lower_bound(group_id),mSpellGroupSpell.upper_bound(group_id));
        }
        void GetSetOfSpellsInSpellGroup(SpellGroup group_id, std::set<uint32>& foundSpells) const
        {
            std::set<SpellGroup> usedGroups;
            GetSetOfSpellsInSpellGroup(group_id, foundSpells, usedGroups);
        }
        void GetSetOfSpellsInSpellGroup(SpellGroup group_id, std::set<uint32>& foundSpells, std::set<SpellGroup>& usedGroups) const
        {
            if (usedGroups.find(group_id) != usedGroups.end())
                return;
            usedGroups.insert(group_id);

            SpellGroupSpellMapBounds groupSpell = GetSpellGroupSpellMapBounds(group_id);
            for (SpellGroupSpellMap::const_iterator itr = groupSpell.first; itr != groupSpell.second ; ++itr)
            {
                if (itr->second < 0)
                {
                    SpellGroup currGroup = (SpellGroup)abs(itr->second);
                    GetSetOfSpellsInSpellGroup(currGroup, foundSpells, usedGroups);
                }
                else
                {
                    foundSpells.insert(itr->second);
                }
            }
        }

        SpellGroupStackRule CheckSpellGroupStackRules(uint32 spellid_1, uint32 spellid_2, SpellGroup& group) const
        {
            spellid_1 = GetFirstSpellInChain(spellid_1);
            spellid_2 = GetFirstSpellInChain(spellid_2);
            if (spellid_1 == spellid_2)
                return SPELL_GROUP_STACK_RULE_DEFAULT;
            // find SpellGroups which are common for both spells
            SpellSpellGroupMapBounds spellGroup1 = GetSpellSpellGroupMapBounds(spellid_1);
            std::set<SpellGroup> groups;
            for (SpellSpellGroupMap::const_iterator itr = spellGroup1.first; itr != spellGroup1.second ; ++itr)
                if (IsSpellMemberOfSpellGroup(spellid_2, itr->second))
                    groups.insert(itr->second);

            SpellGroupStackRule rule = SPELL_GROUP_STACK_RULE_DEFAULT;

            for (const auto itr : groups)
            {
                SpellGroupStackMap::const_iterator found = mSpellGroupStack.find(itr);
                if (found != mSpellGroupStack.end())
                {
                    rule = found->second;
                    group = found->first;
                }
                if (rule)
                    break;
            }
            return rule;
        }

        // End of Spell Groups - Nostalrius improvements.
        // Handling for "A more powerful spell is already active"
        bool ListMorePowerfulSpells(uint32 spellId, std::vector<uint32>&) const;
        bool ListLessPowerfulSpells(uint32 spellId, std::vector<uint32>&) const;
        /**
         * Assumes that both spells are in the given group.
         * Returns true if $powerfullSpell is actually the most powerfull spell.
         */
        bool IsMorePowerfulSpell(uint32 powerfullSpell, uint32 otherSpell, SpellGroup group) const
        {
            // The most powerfull spell appears after less powerfull spells in the list.
            for (const auto& itr : mSpellGroupSpell)
            {
                if (itr.first != group)
                    continue;
                if (itr.second == powerfullSpell)
                    return false;
                if (itr.second == otherSpell)
                    return true;
            }
            MANGOS_ASSERT(false && "Both spells not in the given group !");
            return true;
        }

        // Spell affects
        uint64 GetSpellAffectMask(uint32 spellId, SpellEffectIndex effectId) const
        {
            if (SpellEntry const* spellEntry = GetSpellEntry(spellId))
                return spellEntry->EffectItemType[effectId];
            return 0;
        }

        SpellElixirMap const& GetSpellElixirMap() const { return mSpellElixirs; }

        uint32 GetSpellElixirMask(uint32 spellid) const
        {
            SpellElixirMap::const_iterator itr = mSpellElixirs.find(spellid);
            if (itr==mSpellElixirs.end())
                return 0x0;

            return itr->second;
        }

        SpellSpecific GetSpellElixirSpecific(uint32 spellid) const
        {
            uint32 mask = GetSpellElixirMask(spellid);

            // flasks must have all bits set from ELIXIR_FLASK_MASK
            if ((mask & ELIXIR_FLASK_MASK)==ELIXIR_FLASK_MASK)
                return SPELL_FLASK_ELIXIR;
            else if (mask & ELIXIR_WELL_FED)
                return SPELL_WELL_FED;
            else
                return SPELL_NORMAL;
        }

        uint32 GetSpellEnchantCharges(uint32 spellid) const
        {
            auto itr = mSpellEnchantChargesMap.find(spellid);
            if (itr == mSpellEnchantChargesMap.end())
                return 0;

            return itr->second;
        }

        SpellThreatEntry const* GetSpellThreatEntry(uint32 spellid) const
        {
            SpellThreatMap::const_iterator itr = mSpellThreatMap.find(spellid);
            if (itr != mSpellThreatMap.end())
                return &itr->second;

            return nullptr;
        }

        float GetSpellThreatMultiplier(SpellEntry const* spellInfo) const
        {
            if (!spellInfo)
                return 1.0f;

            if (SpellThreatEntry const* entry = GetSpellThreatEntry(spellInfo->Id))
                return entry->multiplier;

            return 1.0f;
        }

        // Spell proc events
        SpellProcEventEntry const* GetSpellProcEvent(uint32 spellId) const
        {
            SpellProcEventMap::const_iterator itr = mSpellProcEventMap.find(spellId);
            if (itr != mSpellProcEventMap.end())
                return &itr->second;
            return nullptr;
        }

        // Spell procs from item enchants
        float GetItemEnchantProcChance(uint32 spellid) const
        {
            SpellProcItemEnchantMap::const_iterator itr = mSpellProcItemEnchantMap.find(spellid);
            if (itr==mSpellProcItemEnchantMap.end())
                return 0.0f;

            return itr->second;
        }

        static bool IsSpellProcEventCanTriggeredBy(SpellProcEventEntry const* spellProcEvent, uint32 EventProcFlag, SpellEntry const* procSpell, uint32 procFlags, uint32 procExtra);

        // Spell target coordinates
        SpellTargetPosition const* GetSpellTargetPosition(uint32 spell_id) const
        {
            SpellTargetPositionMap::const_iterator itr = mSpellTargetPositions.find(spell_id);
            if (itr != mSpellTargetPositions.end())
                return &itr->second;
            return nullptr;
        }

        // Spell ranks chains
        SpellChainNode const* GetSpellChainNode(uint32 spell_id) const
        {
            SpellChainMap::const_iterator itr = mSpellChains.find(spell_id);
            if (itr == mSpellChains.end())
                return nullptr;

            return &itr->second;
        }

        uint32 GetFirstSpellInChain(uint32 spell_id) const
        {
            if (SpellChainNode const* node = GetSpellChainNode(spell_id))
                return node->first;

            return spell_id;
        }

        uint32 GetPrevSpellInChain(uint32 spell_id) const
        {
            if (SpellChainNode const* node = GetSpellChainNode(spell_id))
                return node->prev;

            return 0;
        }

        SpellChainMapNext const& GetSpellChainNext() const { return mSpellChainsNext; }

        template<typename Worker>
        void doForHighRanks(uint32 spellid, Worker& worker)
        {
            SpellChainMapNext const& nextMap = GetSpellChainNext();
            for(SpellChainMapNext::const_iterator itr = nextMap.lower_bound(spellid); itr != nextMap.upper_bound(spellid); ++itr)
            {
                worker(itr->second);
                doForHighRanks(itr->second,worker);
            }
        }

        // Note: not use rank for compare to spell ranks: spell chains isn't linear order
        // Use IsHighRankOfSpell instead
        uint8 GetSpellRank(uint32 spell_id) const
        {
            if (SpellChainNode const* node = GetSpellChainNode(spell_id))
                return node->rank;

            return 0;
        }

        bool IsHighRankOfSpell(uint32 spell1,uint32 spell2) const
        {
            SpellChainMap::const_iterator itr = mSpellChains.find(spell1);

            uint32 rank2 = GetSpellRank(spell2);

            // not ordered correctly by rank value
            if (itr == mSpellChains.end() || !rank2 || itr->second.rank <= rank2)
                return false;

            // check present in same rank chain
            for(; itr != mSpellChains.end(); itr = mSpellChains.find(itr->second.prev))
                if (itr->second.prev==spell2)
                    return true;

            return false;
        }

        bool IsRankSpellDueToSpell(SpellEntry const* spellInfo_1,uint32 spellId_2) const;
        bool IsNoStackSpellDueToSpell(uint32 spellId_1, uint32 spellId_2) const;
        
        uint32 GetSpellBookSuccessorSpellId(uint32 spellId)
        {
            SkillLineAbilityMapBounds bounds = GetSkillLineAbilityMapBoundsBySpellId(spellId);
            for (SkillLineAbilityMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
            {
                if (SkillLineAbilityEntry const* pAbility = itr->second)
                {
                    if (pAbility->forward_spellid)
                        return pAbility->forward_spellid;
                }
            }
            return 0;
        }

        SpellEntry const* SelectAuraRankForLevel(SpellEntry const* spellInfo, uint32 Level) const;

        // Spell learning
        SpellLearnSkillNode const* GetSpellLearnSkill(uint32 spell_id) const
        {
            SpellLearnSkillMap::const_iterator itr = mSpellLearnSkills.find(spell_id);
            if (itr != mSpellLearnSkills.end())
                return &itr->second;
            else
                return nullptr;
        }

        bool IsSpellLearnSpell(uint32 spell_id) const
        {
            return mSpellLearnSpells.find(spell_id) != mSpellLearnSpells.end();
        }

        SpellLearnSpellMapBounds GetSpellLearnSpellMapBounds(uint32 spell_id) const
        {
            return mSpellLearnSpells.equal_range(spell_id);
        }

        bool IsSpellLearnToSpell(uint32 spell_id1,uint32 spell_id2) const
        {
            SpellLearnSpellMapBounds bounds = GetSpellLearnSpellMapBounds(spell_id1);
            for(SpellLearnSpellMap::const_iterator i = bounds.first; i != bounds.second; ++i)
                if (i->second.spell==spell_id2)
                    return true;
            return false;
        }

        static bool IsProfessionOrRidingSpell(uint32 spellId);
        static bool IsProfessionSpell(uint32 spellId);
        static bool IsPrimaryProfessionSpell(uint32 spellId);
        bool IsPrimaryProfessionFirstRankSpell(uint32 spellId) const;

        bool IsSkillBonusSpell(uint32 spellId) const;


        // Spell script targets
        SpellScriptTargetBounds GetSpellScriptTargetBounds(uint32 spell_id) const
        {
            return mSpellScriptTarget.equal_range(spell_id);
        }

        // Spell correctness for client using
        static bool IsSpellValid(SpellEntry const* spellInfo, Player* pl = nullptr, bool msg = true);

        SkillLineAbilityMapBounds GetSkillLineAbilityMapBoundsBySpellId(uint32 spellId) const
        {
            return mSkillLineAbilityMapBySpellId.equal_range(spellId);
        }

        SkillLineAbilityMapBounds GetSkillLineAbilityMapBoundsBySkillId(uint32 skillId) const
        {
            return mSkillLineAbilityMapBySkillId.equal_range(skillId);
}

        SkillRaceClassInfoMapBounds GetSkillRaceClassInfoMapBounds(uint32 skill_id) const
        {
            return mSkillRaceClassInfoMap.equal_range(skill_id);
        }

        PetAura const* GetPetAura(uint32 spell_id)
        {
            SpellPetAuraMap::const_iterator itr = mSpellPetAuraMap.find(spell_id);
            if (itr != mSpellPetAuraMap.end())
                return &itr->second;
            else
                return nullptr;
        }

        SpellCastResult GetSpellAllowedInLocationError(SpellEntry const* spellInfo, Unit const* caster, Player const* player = nullptr);
        SpellCastResult GetSpellAllowedInLocationError(SpellEntry const* spellInfo, uint32 zone_id, uint32 area_id, Player const* player = nullptr);
        uint32 GetRequiredAreaForSpell(uint32 spellId);

        SpellAreaMapBounds GetSpellAreaMapBounds(uint32 spell_id) const
        {
            return mSpellAreaMap.equal_range(spell_id);
        }

        SpellAreaForQuestMapBounds GetSpellAreaForQuestMapBounds(uint32 quest_id, bool active) const
        {
            if (active)
                return mSpellAreaForActiveQuestMap.equal_range(quest_id);
            else
                return mSpellAreaForQuestMap.equal_range(quest_id);
        }

        SpellAreaForQuestMapBounds GetSpellAreaForQuestEndMapBounds(uint32 quest_id) const
        {
            return mSpellAreaForQuestEndMap.equal_range(quest_id);
        }

        SpellAreaForAuraMapBounds GetSpellAreaForAuraMapBounds(uint32 spell_id) const
        {
            return mSpellAreaForAuraMap.equal_range(spell_id);
        }

        SpellAreaForAreaMapBounds GetSpellAreaForAreaMapBounds(uint32 area_id) const
        {
            return mSpellAreaForAreaMap.equal_range(area_id);
        }

    // Modifiers
    public:
        static SpellMgr& Instance();

        void CheckUsedSpells(char const* table);

        // Loading data at server startup
        void LoadSpellChains();
        void LoadSpellEnchantCharges();
        void LoadSpellLearnSkills();
        void LoadSpellLearnSpells();
        void LoadSpellScriptTarget();
        void LoadSpellElixirs();
        void LoadSpellProcEvents();
        void LoadSpellProcItemEnchant();
        void LoadSpellTargetPositions();
        void LoadSpellThreats();
        void LoadSkillLineAbilityMaps();
        void LoadSkillRaceClassInfoMap();
        void LoadSpellPetAuras();
        void LoadSpellAreas();
        void LoadExistingSpellIds();

        // SPELL GROUPS
        void LoadSpellGroups();
        void LoadSpellGroupStackRules();

        // SpellEntry
        void LoadSpells();
        void AssignInternalSpellFlags();
        SpellEntry const* GetSpellEntry(uint32 spellId) const { return spellId < GetMaxSpellId() ? mSpellEntryMap[spellId].get() : nullptr; }
        uint32 GetMaxSpellId() const { return mSpellEntryMap.size(); }
        bool IsExistingSpellId(uint32 id) const { return (mExistingSpellsSet.find(id) != mExistingSpellsSet.end()); }

        // spell_mod
        SpellEntry const*  OverwriteSpellEntry(uint32 id)
        {
            if (id < GetMaxSpellId())
            {
                std::unique_ptr<SpellEntry> newSpell = std::make_unique<SpellEntry>();
                newSpell->Internal |= SPELL_INTERNAL_CUSTOM;
                for (uint32 i = 0; i < 8; ++i)
                {
                    newSpell->SpellName[i] = "CustomSpell";
                }
                mSpellEntryMap[id] = std::move(newSpell);
                return mSpellEntryMap[id].get();
            }
            return nullptr;
        }

    private:
        SpellScriptTarget  mSpellScriptTarget;
        SpellChainMap      mSpellChains;
        SpellChainMapNext  mSpellChainsNext;
        SpellLearnSkillMap mSpellLearnSkills;
        SpellLearnSpellMap mSpellLearnSpells;
        SpellTargetPositionMap mSpellTargetPositions;
        SpellElixirMap     mSpellElixirs;
        SpellThreatMap     mSpellThreatMap;
        SpellProcEventMap  mSpellProcEventMap;
        SpellProcItemEnchantMap mSpellProcItemEnchantMap;
        SpellEnchantChargesMap mSpellEnchantChargesMap;
        SkillLineAbilityMap mSkillLineAbilityMapBySpellId;
        SkillLineAbilityMap mSkillLineAbilityMapBySkillId;
        SkillRaceClassInfoMap mSkillRaceClassInfoMap;
        SpellPetAuraMap     mSpellPetAuraMap;
        SpellAreaMap         mSpellAreaMap;
        SpellAreaForQuestMap mSpellAreaForQuestMap;
        SpellAreaForQuestMap mSpellAreaForActiveQuestMap;
        SpellAreaForQuestMap mSpellAreaForQuestEndMap;
        SpellAreaForAuraMap  mSpellAreaForAuraMap;
        SpellAreaForAreaMap  mSpellAreaForAreaMap;
        std::set<uint32>     mExistingSpellsSet;

        // SPELL GROUPS
        SpellSpellGroupMap mSpellSpellGroup;
        SpellGroupSpellMap mSpellGroupSpell;
        SpellGroupStackMap   mSpellGroupStack;
        // SpellEntry
        SpellEntryMap      mSpellEntryMap;
};

#define sSpellMgr SpellMgr::Instance()
#endif
