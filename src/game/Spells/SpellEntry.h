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

#ifndef _SPELLENTRY_H
#define _SPELLENTRY_H

#include <array>
#include "DBCStructure.h"
#include "SharedDefines.h"
#include "SpellAuraDefines.h"

class Spell;
class Unit;
class SpellEntry;

// Custom flags assigned in the db
enum SpellAttributeCustom
{
    SPELL_CUSTOM_NONE                       = 0x000,
    SPELL_CUSTOM_ALLOW_STACK_BETWEEN_CASTER = 0x001,     // For example 'Siphon Soul' must be able to stack between the warlocks on a mob
    SPELL_CUSTOM_NEGATIVE                   = 0x002,
    SPELL_CUSTOM_POSITIVE                   = 0x004,
    SPELL_CUSTOM_CHAN_NO_DIST_LIMIT         = 0x008,
    SPELL_CUSTOM_FIXED_DAMAGE               = 0x010,     // Not affected by damage/healing done bonus
    SPELL_CUSTOM_IGNORE_ARMOR               = 0x020,
    SPELL_CUSTOM_BEHIND_TARGET              = 0x040,     // For spells that require the caster to be behind the target
    SPELL_CUSTOM_FACE_TARGET                = 0x080,     // For spells that require the target to be in front of the caster
    SPELL_CUSTOM_SINGLE_TARGET_AURA         = 0x100,     // Aura applied by spell can only be on 1 target at a time
    SPELL_CUSTOM_AURA_APPLY_BREAKS_STEALTH  = 0x200,     // Stealth is removed when this aura is applied
};

// Custom flags assigned by the core based on spell template data
enum SpellAttributeInternal
{
    SPELL_INTERNAL_APPLIES_AURA             = 0x001,
    SPELL_INTERNAL_APPLIES_PERIODIC_AURA    = 0x002,
    SPELL_INTERNAL_PASSIVE_STACK_WITH_RANKS = 0x004,
    SPELL_INTERNAL_POSITIVE                 = 0x008,
    SPELL_INTERNAL_HEAL                     = 0x010,
    SPELL_INTERNAL_DIRECT_DAMAGE            = 0x020,
    SPELL_INTERNAL_CASTER_SOURCE_TARGETS    = 0x040,
    SPELL_INTERNAL_AOE                      = 0x080,
    SPELL_INTERNAL_AOE_AURA                 = 0x100,
    SPELL_INTERNAL_DISMOUNT                 = 0x200,
    SPELL_INTERNAL_CHARM                    = 0x400,
    SPELL_INTERNAL_REFLECTABLE              = 0x800,
};

// original names, do not edit
enum SpellCategories
{
    SPELLCATEGORY_DEFAULT = 1,
    SPELLCATEGORY_DIRECT_DAMAGE_SPELL = 2,
    SPELLCATEGORY_ITEM_COMBAT_CONSUMABLE_POTION = 4,
    SPELLCATEGORY_ITEM_FOOD = 11,
    SPELLCATEGORY_HEALING_SPELL = 12,
    SPELLCATEGORY_QUICK_BUFF_RESIST_SPELL = 17,
    SPELLCATEGORY_DAMAGE_OVER_TIME_SPELL = 18,
    SPELLCATEGORY_QUICK_DAMAGE_SPELL = 19,
    SPELLCATEGORY_INVULNERABILITY_OTHER = 20,
    SPELLCATEGORY_QUICK_BUFF_SPELL = 21,
    SPELLCATEGORY_QUICK_DEBUFF_SPELL = 22,
    SPELLCATEGORY_SUMMONING = 23,
    SPELLCATEGORY_ITEM_COMBAT_CONSUMABLE_AGGRESSIVE = 24,
    SPELLCATEGORY_QUICK_HEAL_SPELL = 25,
    SPELLCATEGORY_RESURRECTION_FULL = 26,
    SPELLCATEGORY_ITEM_SCROLL = 27,
    SPELLCATEGORY_ITEM_QUICK_BUFF = 28,
    SPELLCATEGORY_ITEM_DEBUFF = 29,
    SPELLCATEGORY_ITEM_HEALING = 30,
    SPELLCATEGORY_CONJURE_SHORT = 31,
    SPELLCATEGORY_STUN = 32,
    SPELLCATEGORY_MEZ = 33,
    SPELLCATEGORY_ROOT = 34,
    SPELLCATEGORY_DIRECT_DAMAGE_AE_SPELL = 35,
    SPELLCATEGORY_DEBUFF_SPELL = 36,
    SPELLCATEGORY_INVULNERABILITY = 37,
    SPELLCATEGORY_AURA = 38,
    SPELLCATEGORY_SHAPESHIFT = 39,
    SPELLCATEGORY_MELEE_GENERIC = 40,
    SPELLCATEGORY_CRITICAL = 41,
    SPELLCATEGORY_SNARE = 42,
    SPELLCATEGORY_SHOUT = 43,
    SPELLCATEGORY_SPEED = 44,
    SPELLCATEGORY_TOTEM_STONECLAW = 45,
    SPELLCATEGORY_HEALING_GROUP_SPELL = 46,
    SPELLCATEGORY_COMBAT_STATES = 47,
    SPELLCATEGORY_DIRECT_DAMAGE_AE_ABILITY = 49,
    SPELLCATEGORY_DIRECT_DAMAGE_AECONE_ABILITY = 50,
    SPELLCATEGORY_QUICK_DEBUFF_DPS_SPELL = 51,
    SPELLCATEGORY_QUICK_DEBUFF_DR_SPELL = 52,
    SPELLCATEGORY_QUICK_BUFF_DR_SPELL = 54,
    SPELLCATEGORY_QUICK_BUFF_DPS_SPELL = 55,
    SPELLCATEGORY_INSTANT_HEAL_SPELL = 56,
    SPELLCATEGORY_QUICK_HEAL_GROUP_SPELL = 57,
    SPELLCATEGORY_INSTANT_HEAL_GROUP_SPELL = 58,
    SPELLCATEGORY_ITEM_DRINK = 59,
    SPELLCATEGORY_INVULNERABILITY_TEMP = 60,
    SPELLCATEGORY_ENERGIZE_GROUP_SPELL = 61,
    SPELLCATEGORY_ENERGIZE_SPELL = 62,
    SPELLCATEGORY_BIG_DIRECT_DAMAGE_SPELL = 63,
    SPELLCATEGORY_MINIMAP_SPECIAL = 64,
    SPELLCATEGORY_MELEE_SPECIAL = 65,
    SPELLCATEGORY_DODGE_MANEUVER = 66,
    SPELLCATEGORY_BLOCK_MANEUVER = 67,
    SPELLCATEGORY_PARRY_MANEUVER = 68,
    SPELLCATEGORY_DIRECT_DAMAGE_AEPERSISTENT_SPELL = 72,
    SPELLCATEGORY_MARTIAL_ARTS_GENERIC = 73,
    SPELLCATEGORY_MARTIAL_ARTS_SPECIAL = 74,
    SPELLCATEGORY_DETECT = 75,
    SPELLCATEGORY_SHOOT_THROW = 76,
    SPELLCATEGORY_TRADE_HERBALISM = 77,
    SPELLCATEGORY_TRADE_MINING = 78,
    SPELLCATEGORY_ITEM_POTION_NONCOMBAT = 79,
    SPELLCATEGORY_TAUNT_DETAUNT = 82,
    SPELLCATEGORY_TAMING = 83,
    SPELLCATEGORY_TAUNT_AE = 84,
    SPELLCATEGORY_DIRECT_DAMAGE_AECHAIN_ABILITY = 85,
    SPELLCATEGORY_PET = 86,
    SPELLCATEGORY_CONJURE_LONG = 87,
    SPELLCATEGORY_SILENCE = 88,
    SPELLCATEGORY_PORTAL = 89,
    SPELLCATEGORY_CHARM = 93,
    SPELLCATEGORY_ITEM_SUMMONING = 94,
    SPELLCATEGORY_RACIAL_ABILITY = 95,
    SPELLCATEGORY_RACIAL_ABILITY_2 = 96,
    SPELLCATEGORY_SECONDARY_SURVIVAL = 97,
    SPELLCATEGORY_BIG_DIRECT_DAMAGE_SPELL_2 = 98,
    SPELLCATEGORY_INSTANT_SPELL = 99,
    SPELLCATEGORY_ITEM_MANA_GEM = 100,
    SPELLCATEGORY_FELHUNTER = 101,
    SPELLCATEGORY_ITEM_LONG_BUFF = 102,
    SPELLCATEGORY_ITEM_EPIC = 103,
    SPELLCATEGORY_TOTEM_HEALING = 104,
    SPELLCATEGORY_TOTEM_SERPENT = 105,
    SPELLCATEGORY_TOTEM_SLOWING = 106,
    SPELLCATEGORY_TOTEM_MANA = 107,
    SPELLCATEGORY_TOTEM_INVISIBILITY = 108,
    SPELLCATEGORY_MELEE_DISARM = 109,
    SPELLCATEGORY_DISCIPLINE = 132,
    SPELLCATEGORY_GLOBAL = 133,
    SPELLCATEGORY_ITEM_BANDAGE = 150,
    SPELLCATEGORY_FINISHING_MOVE_WEAPONSCALED = 170,
    SPELLCATEGORY_BANISH = 190,
    SPELLCATEGORY_TOTEM_GROUNDING = 230,
    SPELLCATEGORY_BLAST_WAVE = 250,
    SPELLCATEGORY_KIDNEY_SHOT = 270,
    SPELLCATEGORY_PYROBLAST_REUSE = 290,
    SPELLCATEGORY_TRANSMUTE_ALCHEMY = 310,
    SPELLCATEGORY_MOUNT = 330,
    SPELLCATEGORY_INNER_RAGE = 350,
    SPELLCATEGORY_RANGED_WEAPON = 351,
    SPELLCATEGORY_LIGHTNING_SHIELD = 371,
    SPELLCATEGORY_QUEST_FELCURSE = 391,
    SPELLCATEGORY_TRAP = 411,
    SPELLCATEGORY_HOLY_NOVA = 431,
    SPELLCATEGORY_HOLY_FIRE = 451,
    SPELLCATEGORY_ICE_BARRIER = 471,
    SPELLCATEGORY_ASTRAL_RECALL = 511,
    SPELLCATEGORY_NATURES_GRASP = 531, 
    SPELLCATEGORY_AURA_OF_THE_PIOUS = 551,
    SPELLCATEGORY_HURRICANE = 571,
    SPELLCATEGORY_TOTEM_MANA_TIDE = 591,
    SPELLCATEGORY_WINGS_OF_HOPE = 611,
    SPELLCATEGORY_SOUL_FIRE = 631,
    SPELLCATEGORY_DEATH_COIL = 633,
    SPELLCATEGORY_HOWL_OF_TERROR = 634,
    SPELLCATEGORY_SHADOWBURN = 651,
    SPELLCATEGORY_DESPERATE_PRAYER = 671,
    SPELLCATEGORY_CONFLAGRATE = 672,
    SPELLCATEGORY_DEVOURING_PLAGUE = 691,
    SPELLCATEGORY_SUMMON_INFERNAL = 731,
    SPELLCATEGORY_TREE_FORM = 751,
    SPELLCATEGORY_ITEM_SALT_SHAKER = 791,
    SPELLCATEGORY_DIVINE_INTERVENTION = 811,
    SPELLCATEGORY_SOULSTONE = 831,
    SPELLCATEGORY_RESTORATION = 851,
    SPELLCATEGORY_SHADOWMELD = 871,
    SPELLCATEGORY_INTERCEPT = 872,
    SPELLCATEGORY_WHIRLWIND = 891,
    SPELLCATEGORY_HOLY_SHOCK = 892,
    SPELLCATEGORY_DISTRACTING_SHOT = 911,
    SPELLCATEGORY_HOLY_SHIELD = 931,
    SPELLCATEGORY_CONSECRATION = 932,
    SPELLCATEGORY_PVP_BATTLEFIELD_ITEM_LONG_30_MINS = 951,
    SPELLCATEGORY_MORTAL_STRIKE = 971,
    SPELLCATEGORY_ITEM_SNOWMASTER = 991,
    SPELLCATEGORY_FRENZIED_HEALING = 1011,
    SPELLCATEGORY_ITEM_HALF_HOUR = 1031,
    SPELLCATEGORY_ITEM_JUMPER_CABLES = 1051,
    SPELLCATEGORY_ITEM_HATCH_JUBLING = 1071,
    SPELLCATEGORY_BATTLEGROUNDS_RECALL = 1091,
    SPELLCATEGORY_WYVERN_STING = 1111,
    SPELLCATEGORY_HAMMER_OF_VENGEANCE = 1131,
    SPELLCATEGORY_INTIMIDATION = 1132,
    SPELLCATEGORY_FAERIE_FIRE_FERAL = 1133,
    SPELLCATEGORY_RIPOSTE = 1134,
    SPELLCATEGORY_COUNTERATTACK = 1135,
    SPELLCATEGORY_HOLIDAY_FIREWORK_ROCKETS = 1136,
    SPELLCATEGORY_HOLIDAY_FIRECRACKER = 1137,
    SPELLCATEGORY_RC_WEAPONS = 1138,
    SPELLCATEGORY_ITEM_QUEST_10_MINUTES = 1139,
    SPELLCATEGORY_ITEM_QUEST_1_MIN = 1140,
    SPELLCATEGORY_ITEM_BURST_TRINKET = 1141,
    SPELLCATEGORY_HOLIDAY_VALENTINE_PERFUME_COLOGNE = 1142,
    SPELLCATEGORY_ITEM_TARGET_DUMMY = 1143,
    SPELLCATEGORY_PRIEST_RACIAL = 1144,
    SPELLCATEGORY_LIGHTWELL = 1145,
    SPELLCATEGORY_QUEST_1_HOUR = 1149,
    SPELLCATEGORY_SHADOWTHUNDERSTRIKE = 1150,
    SPELLCATEGORY_TALENT_DPS = 1151,
    SPELLCATEGORY_CREATURE_SPECIAL = 1152,
    SPELLCATEGORY_ITEM_COMBAT_CONSUMABLE_NONAGGRESSIVE = 1153,
    SPELLCATEGORY_ARATHI_BASIN_TRINKET = 1155,
    SPELLCATEGORY_CREATURE_SPECIAL_2 = 1159,
    SPELLCATEGORY_ITEM_PRIEST_EPIC_STAFF = 1160,
    SPELLCATEGORY_REINCARNATION = 1161
};

// Spell clasification
enum SpellSpecific
{
    SPELL_NORMAL            = 0,
    SPELL_SEAL              = 1,
    SPELL_BLESSING          = 2,
    SPELL_AURA              = 3,
    SPELL_STING             = 4,
    SPELL_CURSE             = 5,
    SPELL_ASPECT            = 6,
    SPELL_TRACKER           = 7,
    SPELL_WARLOCK_ARMOR     = 8,
    SPELL_MAGE_ARMOR        = 9,
    SPELL_ELEMENTAL_SHIELD  = 10,
    SPELL_MAGE_POLYMORPH    = 11,
    SPELL_POSITIVE_SHOUT    = 12,
    SPELL_JUDGEMENT         = 13,
    SPELL_BATTLE_ELIXIR     = 14,
    SPELL_GUARDIAN_ELIXIR   = 15,
    SPELL_FLASK_ELIXIR      = 16,
    //SPELL_PRESENCE          = 17,                         // used in 3.x
    //SPELL_HAND              = 18,                         // used in 3.x
    SPELL_WELL_FED          = 19,
    SPELL_FOOD              = 20,
    SPELL_DRINK             = 21,
    SPELL_FOOD_AND_DRINK    = 22,
    SPELL_NEGATIVE_HASTE    = 23,
    SPELL_SNARE             = 24,
};

namespace Spells
{
    SpellSpecific GetSpellSpecific(uint32 spellId);

    // Diminishing Returns interaction with spells
    inline DiminishingReturnsType GetDiminishingReturnsGroupType(DiminishingGroup group)
    {
        switch (group)
        {
            case DIMINISHING_CONTROL_STUN:
            case DIMINISHING_TRIGGER_STUN:
            case DIMINISHING_KIDNEYSHOT:
                return DRTYPE_ALL;
            case DIMINISHING_SLEEP:
            case DIMINISHING_CONTROL_ROOT:
            case DIMINISHING_TRIGGER_ROOT:
            case DIMINISHING_FEAR:
            case DIMINISHING_CHARM:
            case DIMINISHING_POLYMORPH:
            case DIMINISHING_SILENCE:
            case DIMINISHING_DISARM:
            case DIMINISHING_DEATHCOIL:
            case DIMINISHING_FREEZE:
            case DIMINISHING_BANISH:
            case DIMINISHING_WARLOCK_FEAR:
            case DIMINISHING_KNOCKOUT:
                return DRTYPE_PLAYER;
            default:
                break;
        }

        return DRTYPE_NONE;
    }

    inline float GetDiminishingRate(uint32 type)
    {
        switch (type)
        {
            case DIMINISHING_LEVEL_1:
                return 1.0f;
            case DIMINISHING_LEVEL_2:
                return 0.5f;
            case DIMINISHING_LEVEL_3:
                return 0.25f;
            case DIMINISHING_LEVEL_IMMUNE:
                return 0.0f;
            default:
                break;
        }

        return 1.0f;
    }

    // Different spell properties
    inline float GetSpellRadius(SpellRadiusEntry const *radius) { return (radius ? radius->Radius : 0); }
    inline float GetSpellMinRange(SpellRangeEntry const *range) { return (range ? range->minRange : 0); }
    inline float GetSpellMaxRange(SpellRangeEntry const *range) { return (range ? range->maxRange : 0); }
    int32 CompareAuraRanks(uint32 spellId_1, uint32 spellId_2);
    bool CompareSpellSpecificAuras(SpellEntry const* spellInfo_1, SpellEntry const* spellInfo_2);

    // order from less to more strict
    // target not allow have more one spell specific from same caster
    inline bool IsSingleFromSpellSpecificPerTargetPerCaster(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
    {
        switch (spellSpec1)
        {
            case SPELL_BLESSING:
            case SPELL_AURA:
            case SPELL_STING:
            case SPELL_CURSE:
            case SPELL_ASPECT:
            case SPELL_POSITIVE_SHOUT:
            case SPELL_JUDGEMENT:
                return spellSpec1 == spellSpec2;
            default:
                return false;
        }
    }

    // target not allow have more one ranks from spell from spell specific per target
    inline bool IsSingleFromSpellSpecificSpellRanksPerTarget(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
    {
        switch (spellSpec1)
        {
            case SPELL_BLESSING:
            case SPELL_AURA:
            case SPELL_CURSE:
            case SPELL_ASPECT:
            case SPELL_JUDGEMENT:
                return spellSpec1 == spellSpec2;
            default:
                return false;
        }
    }

    // target not allow have more one spell specific per target from any caster
    inline bool IsSingleFromSpellSpecificPerTarget(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
    {
        switch (spellSpec1)
        {
            case SPELL_SEAL:
            case SPELL_TRACKER:
            case SPELL_WARLOCK_ARMOR:
            case SPELL_MAGE_ARMOR:
            case SPELL_ELEMENTAL_SHIELD:
            case SPELL_MAGE_POLYMORPH:
            case SPELL_WELL_FED:
            case SPELL_NEGATIVE_HASTE:
            case SPELL_SNARE:
                return spellSpec1 == spellSpec2;
            case SPELL_BATTLE_ELIXIR:
                return spellSpec2 == SPELL_BATTLE_ELIXIR
                    || spellSpec2 == SPELL_FLASK_ELIXIR;
            case SPELL_GUARDIAN_ELIXIR:
                return spellSpec2 == SPELL_GUARDIAN_ELIXIR
                    || spellSpec2 == SPELL_FLASK_ELIXIR;
            case SPELL_FLASK_ELIXIR:
                return spellSpec2 == SPELL_BATTLE_ELIXIR
                    || spellSpec2 == SPELL_GUARDIAN_ELIXIR
                    || spellSpec2 == SPELL_FLASK_ELIXIR;
            case SPELL_FOOD:
                return spellSpec2 == SPELL_FOOD
                    || spellSpec2 == SPELL_FOOD_AND_DRINK;
            case SPELL_DRINK:
                return spellSpec2 == SPELL_DRINK
                    || spellSpec2 == SPELL_FOOD_AND_DRINK;
            case SPELL_FOOD_AND_DRINK:
                return spellSpec2 == SPELL_FOOD
                    || spellSpec2 == SPELL_DRINK
                    || spellSpec2 == SPELL_FOOD_AND_DRINK;
            default:
                return false;
        }
    }

    bool IsPassiveSpell(uint32 spellId);
    bool IsPositiveSpell(uint32 spellId);
    bool IsPositiveSpell(uint32 spellId, Unit* caster, Unit* victim);

    inline bool IsPositiveTarget(uint32 targetA, uint32 targetB)
    {
        switch (targetA)
        {
            // non-positive targets
            case TARGET_CHAIN_DAMAGE:
            case TARGET_ALL_ENEMY_IN_AREA:
            case TARGET_ALL_ENEMY_IN_AREA_INSTANT:
            case TARGET_IN_FRONT_OF_CASTER:
            case TARGET_ALL_ENEMY_IN_AREA_CHANNELED:
            case TARGET_CURRENT_ENEMY_COORDINATES:
                return false;
            // positive or dependent
            case TARGET_CASTER_COORDINATES:
                return (targetB == TARGET_ALL_PARTY || targetB == TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER || targetB == TARGET_AREAEFFECT_INSTANT);
            default:
                break;
        }
        if (targetB)
            return IsPositiveTarget(targetB, 0);
        return true;
    }

    inline bool IsExplicitPositiveTarget(uint32 targetA)
    {
        // positive targets that in target selection code expect target in m_targers, so not that auto-select target by spell data by m_caster and etc
        switch (targetA)
        {
            case TARGET_SINGLE_FRIEND:
            case TARGET_SINGLE_PARTY:
            case TARGET_CHAIN_HEAL:
            case TARGET_SINGLE_FRIEND_2:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsExplicitNegativeTarget(uint32 targetA)
    {
        // non-positive targets that in target selection code expect target in m_targers, so not that auto-select target by spell data by m_caster and etc
        switch (targetA)
        {
            case TARGET_CHAIN_DAMAGE:
            case TARGET_CURRENT_ENEMY_COORDINATES:
                return true;
            default:
                break;
        }
        return false;
    }

    // Requires you to manually select an unit as the target.
    inline bool IsExplicitlySelectedUnitTarget(uint32 target)
    {
        switch (target)
        {
            case TARGET_CHAIN_DAMAGE:
            case TARGET_SINGLE_FRIEND:
            case TARGET_UNIT_TARGET_ANY:
            case TARGET_CHAIN_HEAL:
            case TARGET_CURRENT_ENEMY_COORDINATES :
            case TARGET_SINGLE_FRIEND_2:
            //case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
        }
        return false;
    }

    bool IsSingleTargetSpells(SpellEntry const *spellInfo1, SpellEntry const *spellInfo2);

    inline bool IsCasterSourceTarget(uint32 target)
    {
        switch (target )
        {
            case TARGET_SELF:
            case TARGET_PET:
            case TARGET_ALL_PARTY_AROUND_CASTER:
            case TARGET_IN_FRONT_OF_CASTER:
            case TARGET_MASTER:
            case TARGET_MINION:
            case TARGET_ALL_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER_2:
            case TARGET_SELF_FISHING:
            case TARGET_TOTEM_EARTH:
            case TARGET_TOTEM_WATER:
            case TARGET_TOTEM_AIR:
            case TARGET_TOTEM_FIRE:
            case TARGET_AREAEFFECT_GO_AROUND_DEST:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsPointEffectTarget(SpellTarget target)
    {
        switch (target )
        {
            case TARGET_INNKEEPER_COORDINATES:
            case TARGET_TABLE_X_Y_Z_COORDINATES:
            case TARGET_CASTER_COORDINATES:
            case TARGET_SCRIPT_COORDINATES:
            case TARGET_CURRENT_ENEMY_COORDINATES:
            case TARGET_DUELVSPLAYER_COORDINATES:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsAreaEffectPossitiveTarget(SpellTarget target)
    {
        switch (target )
        {
            case TARGET_ALL_PARTY_AROUND_CASTER:
            case TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER:
            case TARGET_ALL_FRIENDLY_UNITS_IN_AREA:
            case TARGET_ALL_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER_2:
            case TARGET_AREAEFFECT_PARTY:
            case TARGET_ALL_RAID_AROUND_CASTER:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsAreaEffectTarget(SpellTarget target)
    {
        switch (target )
        {
            case TARGET_AREAEFFECT_INSTANT:
            case TARGET_AREAEFFECT_CUSTOM:
            case TARGET_ALL_ENEMY_IN_AREA:
            case TARGET_ALL_ENEMY_IN_AREA_INSTANT:
            case TARGET_ALL_PARTY_AROUND_CASTER:
            case TARGET_IN_FRONT_OF_CASTER:
            case TARGET_ALL_ENEMY_IN_AREA_CHANNELED:
            case TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER:
            case TARGET_ALL_FRIENDLY_UNITS_IN_AREA:
            case TARGET_ALL_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER_2:
            case TARGET_AREAEFFECT_PARTY:
            case TARGET_AREAEFFECT_GO_AROUND_DEST:
            case TARGET_ALL_RAID_AROUND_CASTER:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                return true;
            default:
                break;
        }
        return false;
    }

    inline bool IsAreaAuraEffect(uint32 effect)
    {
        return
                effect == SPELL_EFFECT_APPLY_AREA_AURA_PARTY  ||
                effect == SPELL_EFFECT_APPLY_AREA_AURA_PET    ||
                // Post-vanilla but very useful sometimes.
                effect == SPELL_EFFECT_APPLY_AREA_AURA_RAID   ||
                effect == SPELL_EFFECT_APPLY_AREA_AURA_ENEMY  ||
                effect == SPELL_EFFECT_APPLY_AREA_AURA_FRIEND ;
    }

    inline uint32 GetDispellMask(DispelType dispel)
    {
        // If dispell all
        if (dispel == DISPEL_ALL)
            return DISPEL_ALL_MASK;
        else
            return (1 << dispel);
    }

    inline bool IsEffectAppliesAura(uint32 effectName)
    {
        switch (effectName)
        {
            case SPELL_EFFECT_APPLY_AURA:
            case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
            case SPELL_EFFECT_APPLY_AREA_AURA_PET:
            case SPELL_EFFECT_APPLY_AREA_AURA_RAID:
            case SPELL_EFFECT_APPLY_AREA_AURA_FRIEND:
            case SPELL_EFFECT_APPLY_AREA_AURA_ENEMY:
                return true;
        }

        return false;
    }
}

class SpellEntry
{
    public:
        SpellEntry() = default;
        ~SpellEntry() = default;
        void InitCachedValues();


        /// DBC DATA:
        uint32    Id = 0;                                          // 0
        uint32    School = 0;                                      // 1
        uint32    Category = 0;                                    // 2
      //uint32    castUI;                                          // 3 not used
        uint32    Dispel = 0;                                      // 4
        uint32    Mechanic = 0;                                    // 5
        uint32    Attributes = 0;                                  // 6
        uint32    AttributesEx = 0;                                // 7
        uint32    AttributesEx2 = 0;                               // 8
        uint32    AttributesEx3 = 0;                               // 9
        uint32    AttributesEx4 = 0;                               // 10
        uint32    Stances = 0;                                     // 11
        uint32    StancesNot = 0;                                  // 12
        uint32    Targets = 0;                                     // 13
        uint32    TargetCreatureType = 0;                          // 14
        uint32    RequiresSpellFocus = 0;                          // 15
        uint32    CasterAuraState = 0;                             // 16
        uint32    TargetAuraState = 0;                             // 17
        uint32    CastingTimeIndex = 0;                            // 18
        uint32    RecoveryTime = 0;                                // 19
        uint32    CategoryRecoveryTime = 0;                        // 20
        uint32    InterruptFlags = 0;                              // 21
        uint32    AuraInterruptFlags = 0;                          // 22
        uint32    ChannelInterruptFlags = 0;                       // 23
        uint32    procFlags = 0;                                   // 24
        uint32    procChance = 0;                                  // 25
        uint32    procCharges = 0;                                 // 26
        uint32    maxLevel = 0;                                    // 27
        uint32    baseLevel = 0;                                   // 28
        uint32    spellLevel = 0;                                  // 29
        uint32    DurationIndex = 0;                               // 30
        uint32    powerType = 0;                                   // 31
        uint32    manaCost = 0;                                    // 32
        uint32    manaCostPerlevel = 0;                            // 33
        uint32    manaPerSecond = 0;                               // 34
        uint32    manaPerSecondPerLevel = 0;                       // 35
        uint32    rangeIndex = 1;                                  // 36
        float     speed = 0.f;                                     // 37
      //uint32    modalNextSpell;                                  // 38 not used
        uint32    StackAmount = 0;                                 // 39
        uint32    Totem[MAX_SPELL_TOTEMS] = {};                    // 40-41
        int32     Reagent[MAX_SPELL_REAGENTS] = {};                // 42-49
        uint32    ReagentCount[MAX_SPELL_REAGENTS] = {};           // 50-57
        int32     EquippedItemClass = -1;                          // 58 (value)
        int32     EquippedItemSubClassMask = 0;                    // 59 (mask)
        int32     EquippedItemInventoryTypeMask = 0;               // 60 (mask)
        uint32    Effect[MAX_EFFECT_INDEX] = {};                   // 61-63
        int32     EffectDieSides[MAX_EFFECT_INDEX] = {};           // 64-66
        uint32    EffectBaseDice[MAX_EFFECT_INDEX] = {};           // 67-69
        float     EffectDicePerLevel[MAX_EFFECT_INDEX] = {};       // 70-72
        float     EffectRealPointsPerLevel[MAX_EFFECT_INDEX] = {}; // 73-75
        int32     EffectBasePoints[MAX_EFFECT_INDEX] = {};         // 76-78 
        uint32    EffectMechanic[MAX_EFFECT_INDEX] = {};           // 79-81
        uint32    EffectImplicitTargetA[MAX_EFFECT_INDEX] = {};    // 82-84
        uint32    EffectImplicitTargetB[MAX_EFFECT_INDEX] = {};    // 85-87
        uint32    EffectRadiusIndex[MAX_EFFECT_INDEX] = {};        // 88-90
        uint32    EffectApplyAuraName[MAX_EFFECT_INDEX] = {};      // 91-93
        uint32    EffectAmplitude[MAX_EFFECT_INDEX] = {};          // 94-96
        float     EffectMultipleValue[MAX_EFFECT_INDEX] = {};      // 97-99
        uint32    EffectChainTarget[MAX_EFFECT_INDEX] = {};        // 100-102
        uint32    EffectItemType[MAX_EFFECT_INDEX] = {};           // 103-105
        int32     EffectMiscValue[MAX_EFFECT_INDEX] = {};          // 106-108
        uint32    EffectTriggerSpell[MAX_EFFECT_INDEX] = {};       // 109-111
        float     EffectPointsPerComboPoint[MAX_EFFECT_INDEX] = {};// 112-114
        uint32    SpellVisual = 0;                                 // 115
      //uint32    SpellVisual2;                                    // 116 not used
        uint32    SpellIconID = 0;                                 // 117
        uint32    activeIconID = 0;                                // 118
        uint32    spellPriority = 0;                               // 119
        std::array<std::string, MAX_DBC_LOCALE> SpellName{};       // 120-127
      //uint32    SpellNameFlag;                                   // 128     not used
        std::array<std::string, MAX_DBC_LOCALE> Rank{};            // 129-136
      //uint32    RankFlags;                                       // 137     not used
      //char*     Description[8];                                  // 138-145 not used
      //uint32    DescriptionFlags;                                // 146     not used
      //char*     ToolTip[8];                                      // 147-154 not used
      //uint32    ToolTipFlags;                                    // 155     not used
        uint32    ManaCostPercentage = 0;                          // 156
        uint32    StartRecoveryCategory = 0;                       // 157
        uint32    StartRecoveryTime = 0;                           // 158
        uint32    MaxTargetLevel = 0;                              // 160
        uint32    SpellFamilyName = 0;                             // 161
        uint64    SpellFamilyFlags = 0;                            // 162
        uint32    MaxAffectedTargets = 0;                          // 163
        uint32    DmgClass = 0;                                    // 164
        uint32    PreventionType = 0;                              // 165
      //int32     StanceBarOrder;                                  // 166 not used
        float     DmgMultiplier[MAX_EFFECT_INDEX] = {};            // 167-169
      //uint32    MinFactionId;                                    // 170 not used
      //uint32    MinReputation;                                   // 171 not used
      //uint32    RequiredAuraVision;                              // 172 not used

        /// CUSTOM FIELDS:
        uint32 MinTargetLevel = 0;                                 // 159
        uint32 Custom = 0;                                         // 173
        uint32 Internal = 0;                                       // Assigned by the core.
    protected:
        bool _isBinary = false;
        bool _isDispel = false;
        bool _isNonPeriodicDispel = false;
        void ComputeBinary();
        void ComputeNonPeriodicDispel();
        void ComputeDispel();
    public:
        bool IsBinary() const { return _isBinary; }
        bool IsDispel() const { return _isDispel; }
        bool IsNonPeriodicDispel() const { return _isNonPeriodicDispel; }
        bool IsPvEHeartBeat() const;
        bool IsCCSpell() const;
        DiminishingGroup GetDiminishingReturnsGroup(bool triggered) const;

        // helpers
        int32 CalculateSimpleValue(SpellEffectIndex eff) const { return EffectBasePoints[eff] + int32(EffectBaseDice[eff]); }

        bool IsFitToFamilyMask(uint64 familyFlags) const
        {
            return !!(SpellFamilyFlags & familyFlags);
        }

        bool IsFitToFamily(SpellFamily family, uint64 familyFlags) const
        {
            return SpellFamily(SpellFamilyName) == family && IsFitToFamilyMask(familyFlags);
        }

        template <SpellFamily family, ClassFlag... Args>
        bool IsFitToFamily() const
        {
            return SpellFamily(SpellFamilyName) == family && !!(SpellFamilyFlags & BitMask<uint64, Args...>::value);
        }

        template <ClassFlag... Args>
        bool IsFitToFamilyMask() const
        {
            return !!(SpellFamilyFlags & BitMask<uint64, Args...>::value);
        }

        uint32 GetAllSpellMechanicMask() const
        {
            uint32 mask = 0;
            if (Mechanic)
                mask |= 1 << (Mechanic - 1);
            for (int i=0; i< MAX_EFFECT_INDEX; ++i)
                if (EffectMechanic[i])
                    mask |= 1 << (EffectMechanic[i]-1);
            return mask;
        }

        bool HasAttribute(SpellAttributes attribute) const { return Attributes & attribute; }
        bool HasAttribute(SpellAttributesEx attribute) const { return AttributesEx & attribute; }
        bool HasAttribute(SpellAttributesEx2 attribute) const { return AttributesEx2 & attribute; }
        bool HasAttribute(SpellAttributesEx3 attribute) const { return AttributesEx3 & attribute; }
        bool HasAttribute(SpellAttributesEx4 attribute) const { return AttributesEx4 & attribute; }

        inline bool HasEffect(SpellEffects effect) const
        {
            for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
                if (SpellEffects(Effect[i]) == effect)
                    return true;
            return false;
        }

        inline bool IsSpellAppliesAura() const
        {
            return Internal & SPELL_INTERNAL_APPLIES_AURA;
        }

        inline bool IsSpellAppliesAura(uint32 effectMask) const
        {
            for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if (effectMask & (1 << i))
                {
                    if (Spells::IsEffectAppliesAura(Effect[i]) && EffectApplyAuraName[i])
                        return true;
                }
            }
            return false;
        }

        // Spells that apply damage or heal over time
        // Returns false for periodic and direct mixed spells (immolate, etc)
        inline bool IsSpellAppliesPeriodicAura() const
        {
            return Internal & SPELL_INTERNAL_APPLIES_PERIODIC_AURA;
        }

        inline bool IsEffectHandledOnDelayedSpellLaunch(SpellEffectIndex effecIdx) const
        {
            switch (Effect[effecIdx])
            {
                case SPELL_EFFECT_SCHOOL_DAMAGE:
                case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
                case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
                case SPELL_EFFECT_WEAPON_DAMAGE:
                case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:
                    return true;
                default:
                    return false;
            }
        }

        inline bool IsPeriodicRegenerateEffect(SpellEffectIndex effecIdx) const
        {
            switch (AuraType(EffectApplyAuraName[effecIdx]))
            {
                case SPELL_AURA_PERIODIC_ENERGIZE:
                case SPELL_AURA_PERIODIC_HEAL:
                case SPELL_AURA_PERIODIC_HEALTH_FUNNEL:
                    return true;
                default:
                    return false;
            }
        }

        inline bool HasAura(AuraType aura) const
        {
            for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
                if (AuraType(EffectApplyAuraName[i]) == aura)
                    return true;
            return false;
        }

        inline bool HasSingleAura(AuraType aura) const
        {
            bool hasAura = false;
            for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
                if (AuraType(EffectApplyAuraName[i]) == aura)
                    hasAura = true;
                else if (Effect[i] == SPELL_EFFECT_APPLY_AURA)
                    return false;
            return hasAura;
        }

        inline bool IsSealSpell() const
        {
            //Collection of all the seal family flags. No other paladin spell has any of those.
            return IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_SEAL_OF_THE_CRUSADER, CF_PALADIN_SEAL_OF_COMMAND, CF_PALADIN_SEALS>();
        }

        inline bool IsElementalShield() const
        {
            // family flags 10 (Lightning), 42 (Earth), 37 (Water), proc shield from T2 8 pieces bonus
            return IsFitToFamilyMask<CF_SHAMAN_LIGHTNING_SHIELD>() || Id == 23552;
        }

        inline bool IsFromBehindOnlySpell() const
        {
            return ((AttributesEx2 == 0x100000 && (AttributesEx & 0x200) == 0x200) || (Custom & SPELL_CUSTOM_BEHIND_TARGET));
        }

        inline bool IsPassiveSpell() const
        {
            // Nostalrius : 0x80 -> D'autres sorts passifs, dont les enchants par exemple
            return (Attributes & (SPELL_ATTR_PASSIVE)) != 0;
        }

        inline bool IsPassiveSpellStackableWithRanks() const
        {
            return Internal & SPELL_INTERNAL_PASSIVE_STACK_WITH_RANKS;
        }

        inline bool IsDeathOnlySpell() const
        {
            return (AttributesEx3 & SPELL_ATTR_EX3_CAST_ON_DEAD) || (Id == 2584);
        }

        inline bool IsDeathPersistentSpell() const
        {
            return HasAttribute(SPELL_ATTR_EX3_DEATH_PERSISTENT);
        }

        inline bool IsNonCombatSpell() const
        {
            return (Attributes & SPELL_ATTR_CANT_USED_IN_COMBAT) != 0;
        }

        inline bool IsPositiveSpell() const
        {
            return Internal & SPELL_INTERNAL_POSITIVE;
        }

        bool IsPositiveSpell(Unit* caster, Unit* victim) const;
        bool IsPositiveEffect(SpellEffectIndex effIndex, Unit* caster = nullptr, Unit* victim = nullptr) const;

        inline bool IsHealSpell() const
        {
            return Internal & SPELL_INTERNAL_HEAL;
        }

        inline bool IsDirectDamageSpell() const
        {
            return Internal & SPELL_INTERNAL_DIRECT_DAMAGE;
        }

        inline bool HasSingleTargetAura() const
        {
            return Custom & SPELL_CUSTOM_SINGLE_TARGET_AURA;
        }

        inline bool IsSpellWithCasterSourceTargetsOnly() const
        {
            return Internal & SPELL_INTERNAL_CASTER_SOURCE_TARGETS;
        }

        inline bool IsAreaOfEffectSpell() const
        {
            return Internal & SPELL_INTERNAL_AOE;
        }

        inline bool HasAreaAuraEffect() const
        {
            return Internal & SPELL_INTERNAL_AOE_AURA;
        }

        inline bool IsDismountSpell() const
        {
            return Internal & SPELL_INTERNAL_DISMOUNT;
        }

        inline bool IsCharmSpell() const
        {
            return Internal & SPELL_INTERNAL_CHARM;
        }

        inline bool IsReflectableSpell() const
        {
            return Internal & SPELL_INTERNAL_REFLECTABLE;
        }

        inline bool IsReflectableSpell(Unit* caster, Unit* victim) const
        {
            return DmgClass == SPELL_DAMAGE_CLASS_MAGIC && !HasAttribute(SPELL_ATTR_IS_ABILITY)
                && !HasAttribute(SPELL_ATTR_EX_CANT_BE_REFLECTED) && !HasAttribute(SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)
                && !HasAttribute(SPELL_ATTR_PASSIVE) && !IsPositiveSpell(caster, victim);
        }

        inline bool IsAutoRepeatRangedSpell() const
        {
            return (Attributes & SPELL_ATTR_RANGED) && (AttributesEx2 & SPELL_ATTR_EX2_AUTOREPEAT_FLAG);
        }

        inline bool IsSpellRequiresRangedAP() const
        {
            return (SpellFamilyName == SPELLFAMILY_HUNTER && DmgClass != SPELL_DAMAGE_CLASS_MELEE);
        }

        inline bool IsChanneledSpell() const
        {
            return (AttributesEx & (SPELL_ATTR_EX_CHANNELED_1 | SPELL_ATTR_EX_CHANNELED_2));
        }

        inline bool NeedsComboPoints() const
        {
            return (AttributesEx & (SPELL_ATTR_EX_REQ_TARGET_COMBO_POINTS | SPELL_ATTR_EX_REQ_COMBO_POINTS));
        }

        inline bool IsTotemSummonSpell() const
        {
            return Effect[0] >= SPELL_EFFECT_SUMMON_TOTEM_SLOT1 && Effect[0] <= SPELL_EFFECT_SUMMON_TOTEM_SLOT4;
        }

        inline bool HasRealTimeDuration() const
        {
            return HasAttribute(SPELL_ATTR_EX4_REAL_TIME_DURATION);
        }

        inline bool HasAuraWithSpellTriggerEffect() const
        {
            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                switch (EffectApplyAuraName[i])
                {
                    case SPELL_AURA_PROC_TRIGGER_SPELL:
                        return true;
                }
            }
            return false;
        }

        inline bool IsNeedCastSpellAtFormApply(ShapeshiftForm form) const
        {
            if (!(Attributes & (SPELL_ATTR_PASSIVE | SPELL_ATTR_HIDDEN_CLIENTSIDE)) || !form)
                return false;

            // passive spells with SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT are already active without shapeshift, do no recast!
            // Feline Swiftness Passive 2a not have 0x1 mask in Stance field in spell data as expected
            return ((Stances & (1 << (form - 1)) || Id == 24864 && form == FORM_CAT) &&
                !(AttributesEx2 & SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT));
        }

        // Spell effects require a specific power type on the target
        inline bool IsTargetPowerTypeValid(Powers powerType) const
        {
            for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if (Effect[i] == SPELL_EFFECT_NONE)
                    continue;

                if ((Effect[i] == SPELL_EFFECT_POWER_BURN ||
                    Effect[i] == SPELL_EFFECT_POWER_DRAIN ||
                    EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_MANA_LEECH ||
                    EffectApplyAuraName[i] == SPELL_AURA_POWER_BURN_MANA) &&
                    int32(powerType) != EffectMiscValue[i])
                {
                    continue;
                }
                return true;
            }
            return false;
        }

        inline bool IsRemovedOnShapeLostSpell() const
        {
            return (Stances || Id == 24864) &&
                !(AttributesEx2 & SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT) &&
                !(Attributes & SPELL_ATTR_NOT_SHAPESHIFT);
        }

        inline SpellSchoolMask GetSpellSchoolMask() const
        {
            return GetSchoolMask(School);
        }

        inline uint32 GetSpellMechanicMask(uint32 effectMask) const
        {
            uint32 mask = 0;
            if (Mechanic)
                mask |= 1 << (Mechanic - 1);

            for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if (!(effectMask & (1 << i)))
                    continue;

                if (EffectMechanic[i])
                    mask |= 1 << (EffectMechanic[i] - 1);
            }

            return mask;
        }

        inline Mechanics GetEffectMechanic(SpellEffectIndex effect) const
        {
            if (EffectMechanic[effect])
                return Mechanics(EffectMechanic[effect]);
            if (Mechanic)
                return Mechanics(Mechanic);
            return MECHANIC_NONE;
        }

        inline uint32 GetRecoveryTime() const
        {
            return RecoveryTime > CategoryRecoveryTime ? RecoveryTime : CategoryRecoveryTime;
        }

        int32 GetDuration() const;
        int32 GetMaxDuration() const;
        int32 CalculateDuration(Unit const* caster = nullptr) const;
        uint32 GetCastTime(Spell* spell = nullptr) const;
        uint32 GetCastTimeForBonus(DamageEffectType damagetype) const;
        uint16 GetAuraMaxTicks() const;
        WeaponAttackType GetWeaponAttackType() const;
        float CalculateDefaultCoefficient(DamageEffectType const damagetype) const;
        float CalculateCustomCoefficient(Unit const* caster, DamageEffectType const damageType, float coeff, Spell* spell, bool donePart) const;
        SpellCastResult GetErrorAtShapeshiftedCast(uint32 form) const;
        uint32 GetMechanic() const { return Mechanic; }
        uint32 GetManaCost() const { return manaCost; }
        uint32 GetSpellFamilyName() const { return SpellFamilyName; }
        uint32 GetAuraInterruptFlags() const { return AuraInterruptFlags; }
        uint32 GetStackAmount() const { return StackAmount; }
        uint32 GetEffectImplicitTargetAByIndex(SpellEffectIndex j) const { return EffectImplicitTargetA[j];}
        uint32 GetEffectImplicitTargetBByIndex(SpellEffectIndex j) const { return EffectImplicitTargetB[j];}
        uint32 GetEffectApplyAuraNameByIndex(SpellEffectIndex j) const { return EffectApplyAuraName[j];}
        uint32 GetEffectMiscValue(SpellEffectIndex j) const { return EffectMiscValue[j];}
        uint64 GetSpellFamilyFlags() const { return SpellFamilyFlags; }

        template <typename T, int Val>
        struct Shift
        {
            static T const value = T(1) << Val;
        };
        template <typename T, int N1, int N2 = -1, int N3 = -1, int N4 = -1, int N5 = -1, int N6 = -1, int N7 = -1, int N8 = -1, int N9 = -1, int N10 = -1>
        struct BitMask
        {
            static T const value = Shift<T, N1>::value | BitMask<T, N2, N3, N4, N5, N6, N7, N8, N9, N10, -1>::value;
        };

        template <typename T>
        struct BitMask<T, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1>
        {
            static T const value = 0;
        };
};

#endif
