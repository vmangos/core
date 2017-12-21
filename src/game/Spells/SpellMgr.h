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
// For more high level function for sSpellStore data

#include "Common.h"
#include "SharedDefines.h"
#include "SpellAuraDefines.h"
#include "DBCStructure.h"
#include "DBCStores.h"
#include "SQLStorages.h"
#include "SpellEntry.h"

#include "Utilities/UnorderedMapSet.h"

#include <map>

class Player;
class Spell;
class Unit;
struct SpellModifier;

// Nostalrius : Champs 'Custom' de SpellEntry
enum SpellAttributeCustom
{
    SPELL_CUSTOM_NONE                       = 0x000,

    // Par exemple 'Siphon d'ame' doit pouvoir se stacker entre les demos sur un mob.
    SPELL_CUSTOM_ALLOW_STACK_BETWEEN_CASTER = 0x001,
    SPELL_CUSTOM_NEGATIVE                   = 0x002,
    SPELL_CUSTOM_POSITIVE                   = 0x004,
    SPELL_CUSTOM_CHAN_NO_DIST_LIMIT         = 0x008,
    SPELL_CUSTOM_FIXED_DAMAGE               = 0x010,
    SPELL_CUSTOM_IGNORE_ARMOR               = 0x020,
    SPELL_CUSTOM_FROM_BEHIND                = 0x040     // For spells that require the caster to be behind the target
};

// only used in code
enum SpellCategories
{
    SPELLCATEGORY_HEALTH_MANA_POTIONS = 4,
    SPELLCATEGORY_DEVOUR_MAGIC        = 12
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
};

SpellSpecific GetSpellSpecific(uint32 spellId);

// Different spell properties
inline float GetSpellRadius(SpellRadiusEntry const *radius) { return (radius ? radius->Radius : 0); }
uint32 GetSpellCastTime(SpellEntry const* spellInfo, Spell* spell = NULL);
uint32 GetSpellCastTimeForBonus( SpellEntry const *spellProto, DamageEffectType damagetype );
float CalculateDefaultCoefficient(SpellEntry const *spellProto, DamageEffectType const damagetype);
float CalculateCustomCoefficient(SpellEntry const *spellProto,  Unit const* caster, DamageEffectType const damageType, float coeff, Spell* spell, bool donePart);
inline float GetSpellMinRange(SpellRangeEntry const *range) { return (range ? range->minRange : 0); }
inline float GetSpellMaxRange(SpellRangeEntry const *range) { return (range ? range->maxRange : 0); }
inline uint32 GetSpellRecoveryTime(SpellEntry const *spellInfo) { return spellInfo->RecoveryTime > spellInfo->CategoryRecoveryTime ? spellInfo->RecoveryTime : spellInfo->CategoryRecoveryTime; }
int32 GetSpellDuration(SpellEntry const *spellInfo);
int32 GetSpellMaxDuration(SpellEntry const *spellInfo);
int32 CalculateSpellDuration(SpellEntry const *spellInfo, Unit const* caster = NULL);
uint16 GetSpellAuraMaxTicks(SpellEntry const* spellInfo);
WeaponAttackType GetWeaponAttackType(SpellEntry const *spellInfo);

inline bool IsSpellHaveEffect(SpellEntry const *spellInfo, SpellEffects effect)
{
    for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
        if(SpellEffects(spellInfo->Effect[i])==effect)
            return true;
    return false;
}

inline bool IsSpellAppliesAura(SpellEntry const *spellInfo, uint32 effectMask = ((1 << EFFECT_INDEX_0) | (1 << EFFECT_INDEX_1) | (1 << EFFECT_INDEX_2)))
{
    for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (effectMask & (1 << i))
        {
            switch (spellInfo->Effect[i])
            {
                case SPELL_EFFECT_APPLY_AURA:
                case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                case SPELL_EFFECT_APPLY_AREA_AURA_PET:
                case SPELL_EFFECT_APPLY_AREA_AURA_RAID:
                case SPELL_EFFECT_APPLY_AREA_AURA_FRIEND:
                case SPELL_EFFECT_APPLY_AREA_AURA_ENEMY:
                    if (spellInfo->EffectApplyAuraName[i])
                        return true;
                    break;
            }
        }
    }
    return false;
}

// Spells that apply damage or heal over time
// Returns false for periodic and direct mixed spells (immolate, etc)
inline bool IsSpellAppliesPeriodicAura(SpellEntry const *spellInfo)
{
    bool periodic = false;
    bool direct = false;
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch (spellInfo->Effect[i])
        {
            case SPELL_EFFECT_SCHOOL_DAMAGE:
            case SPELL_EFFECT_POWER_DRAIN:
            case SPELL_EFFECT_HEALTH_LEECH:
            case SPELL_EFFECT_ENVIRONMENTAL_DAMAGE:
            case SPELL_EFFECT_POWER_BURN:
            case SPELL_EFFECT_HEAL:
                direct = true;
                break;
            case SPELL_EFFECT_APPLY_AURA:
                switch (spellInfo->EffectApplyAuraName[i])
                {
                    case SPELL_AURA_PERIODIC_DAMAGE:
                    case SPELL_AURA_PERIODIC_HEAL:
                    case SPELL_AURA_PERIODIC_ENERGIZE:
                    case SPELL_AURA_OBS_MOD_HEALTH:
                    case SPELL_AURA_PERIODIC_LEECH:
                    case SPELL_AURA_PERIODIC_HEALTH_FUNNEL:
                    case SPELL_AURA_PERIODIC_MANA_LEECH:
                    case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                    case SPELL_AURA_POWER_BURN_MANA:
                    case SPELL_AURA_PERIODIC_TRIGGER_SPELL:
                        periodic = true;
                    default:
                        break;
                }
            default:
                break;
        }
    }
    return periodic && !direct;
}

inline bool IsEffectHandledOnDelayedSpellLaunch(SpellEntry const *spellInfo, SpellEffectIndex effecIdx)
{
    switch (spellInfo->Effect[effecIdx])
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

inline bool IsPeriodicRegenerateEffect(SpellEntry const* spellInfo, SpellEffectIndex effecIdx)
{
    switch (AuraType(spellInfo->EffectApplyAuraName[effecIdx]))
    {
        case SPELL_AURA_PERIODIC_ENERGIZE:
        case SPELL_AURA_PERIODIC_HEAL:
        case SPELL_AURA_PERIODIC_HEALTH_FUNNEL:
            return true;
        default:
            return false;
    }
}

inline bool IsSpellHaveAura(SpellEntry const *spellInfo, AuraType aura)
{
    for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
        if(AuraType(spellInfo->EffectApplyAuraName[i])==aura)
            return true;
    return false;
}

inline bool IsSpellLastAuraEffect(SpellEntry const *spellInfo, SpellEffectIndex effecIdx)
{
    for(int i = effecIdx+1; i < MAX_EFFECT_INDEX; ++i)
        if(spellInfo->EffectApplyAuraName[i])
            return false;
    return true;
}

bool IsNoStackAuraDueToAura(uint32 spellId_1, uint32 spellId_2);

inline bool IsSealSpell(SpellEntry const *spellInfo)
{
    //Collection of all the seal family flags. No other paladin spell has any of those.
    return spellInfo->IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_SEAL_OF_THE_CRUSADER, CF_PALADIN_SEAL_OF_COMMAND, CF_PALADIN_SEALS>();
}

inline bool IsElementalShield(SpellEntry const *spellInfo)
{
    // family flags 10 (Lightning), 42 (Earth), 37 (Water), proc shield from T2 8 pieces bonus
    return spellInfo->IsFitToFamilyMask<CF_SHAMAN_LIGHTNING_SHIELD>() || spellInfo->Id == 23552;
}

int32 CompareAuraRanks(uint32 spellId_1, uint32 spellId_2);

// order from less to more strict
bool IsSingleFromSpellSpecificPerTargetPerCaster(SpellSpecific spellSpec1,SpellSpecific spellSpec2);
bool IsSingleFromSpellSpecificSpellRanksPerTarget(SpellSpecific spellSpec1,SpellSpecific spellSpec2);
bool IsSingleFromSpellSpecificPerTarget(SpellSpecific spellSpec1,SpellSpecific spellSpec2);

bool IsPassiveSpell(uint32 spellId);
bool IsPassiveSpell(SpellEntry const* spellProto);

inline bool IsPassiveSpellStackableWithRanks(SpellEntry const* spellProto)
{
    if (!IsPassiveSpell(spellProto))
        return false;

    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (SpellEffects(spellProto->Effect[i]) == SPELL_EFFECT_APPLY_AURA || SpellEffects(spellProto->Effect[i]) == SPELL_EFFECT_APPLY_AREA_AURA_PARTY)
            return false;
    }
    return true;
}


inline bool IsDeathOnlySpell(SpellEntry const *spellInfo)
{
    return spellInfo->AttributesEx3 & SPELL_ATTR_EX3_CAST_ON_DEAD
        || spellInfo->Id == 2584;
}

inline bool IsDeathPersistentSpell(SpellEntry const *spellInfo)
{
    return spellInfo->HasAttribute(SPELL_ATTR_EX3_DEATH_PERSISTENT);
}

inline bool IsNonCombatSpell(SpellEntry const *spellInfo)
{
    return (spellInfo->Attributes & SPELL_ATTR_CANT_USED_IN_COMBAT) != 0;
}

bool IsPositiveSpell(uint32 spellId, Unit* caster = NULL, Unit* victim = NULL);
bool IsPositiveSpell(SpellEntry const *spellproto, Unit* caster = NULL, Unit* victim = NULL);
bool IsPositiveEffect(SpellEntry const *spellInfo, SpellEffectIndex effIndex, Unit* caster = NULL, Unit* victim = NULL);
bool IsPositiveTarget(uint32 targetA, uint32 targetB);
bool IsHealSpell(SpellEntry const *spellProto);

bool IsExplicitPositiveTarget(uint32 targetA);
bool IsExplicitNegativeTarget(uint32 targetA);

bool IsSingleTargetSpell(SpellEntry const *spellInfo);
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

inline bool IsSpellWithCasterSourceTargetsOnly(SpellEntry const* spellInfo)
{
    for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        uint32 targetA = spellInfo->EffectImplicitTargetA[i];
        if(targetA && !IsCasterSourceTarget(targetA))
            return false;

        uint32 targetB = spellInfo->EffectImplicitTargetB[i];
        if(targetB && !IsCasterSourceTarget(targetB))
            return false;

        if(!targetA && !targetB)
            return false;
    }
    return true;
}

inline bool IsPointEffectTarget( Targets target )
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

inline bool IsAreaEffectPossitiveTarget( Targets target )
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

inline bool IsAreaEffectTarget( Targets target )
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

inline bool IsAreaOfEffectSpell(SpellEntry const *spellInfo)
{
    return
            IsAreaEffectTarget(Targets(spellInfo->EffectImplicitTargetA[EFFECT_INDEX_0])) ||
            IsAreaEffectTarget(Targets(spellInfo->EffectImplicitTargetB[EFFECT_INDEX_0])) ||
            IsAreaEffectTarget(Targets(spellInfo->EffectImplicitTargetA[EFFECT_INDEX_1])) ||
            IsAreaEffectTarget(Targets(spellInfo->EffectImplicitTargetB[EFFECT_INDEX_1])) ||
            IsAreaEffectTarget(Targets(spellInfo->EffectImplicitTargetA[EFFECT_INDEX_2])) ||
            IsAreaEffectTarget(Targets(spellInfo->EffectImplicitTargetB[EFFECT_INDEX_2])) ;
}

inline bool IsAreaAuraEffect(uint32 effect)
{
    return
            effect == SPELL_EFFECT_APPLY_AREA_AURA_PARTY  ||
            effect == SPELL_EFFECT_APPLY_AREA_AURA_PET    ||
        // Post-vanilla mais bien utile desfois.
            effect == SPELL_EFFECT_APPLY_AREA_AURA_RAID   ||
            effect == SPELL_EFFECT_APPLY_AREA_AURA_ENEMY  ||
            effect == SPELL_EFFECT_APPLY_AREA_AURA_FRIEND ;
}

inline bool HasAreaAuraEffect(SpellEntry const *spellInfo)
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (IsAreaAuraEffect(spellInfo->Effect[i]))
            return true;
    return false;
}

inline bool HasAuraWithTriggerEffect(SpellEntry const *spellInfo)
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch(spellInfo->EffectApplyAuraName[i])
        {
            case SPELL_AURA_PERIODIC_TRIGGER_SPELL:
            case SPELL_AURA_PROC_TRIGGER_SPELL:
            case SPELL_AURA_PROC_TRIGGER_DAMAGE:
                return true;
        }
    }
    return false;
}

inline bool HasAuraWithSpellTriggerEffect(SpellEntry const *spellInfo)
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch (spellInfo->EffectApplyAuraName[i])
        {
            case SPELL_AURA_PROC_TRIGGER_SPELL:
                return true;
        }
    }
    return false;
}

inline bool IsCharmSpell(SpellEntry const *spellInfo)
{
    return IsSpellHaveAura(spellInfo, SPELL_AURA_MOD_CHARM) || IsSpellHaveAura(spellInfo, SPELL_AURA_MOD_POSSESS);
}

inline bool IsDispelSpell(SpellEntry const *spellInfo)
{
    return IsSpellHaveEffect(spellInfo, SPELL_EFFECT_DISPEL);
}

inline bool IsAutoRepeatRangedSpell(SpellEntry const* spellInfo)
{
    return (spellInfo->Attributes & SPELL_ATTR_RANGED) && (spellInfo->AttributesEx2 & SPELL_ATTR_EX2_AUTOREPEAT_FLAG);
}

inline bool IsSpellRequiresRangedAP(SpellEntry const* spellInfo)
{
    return (spellInfo->SpellFamilyName == SPELLFAMILY_HUNTER && spellInfo->DmgClass != SPELL_DAMAGE_CLASS_MELEE);
}

SpellCastResult GetErrorAtShapeshiftedCast (SpellEntry const *spellInfo, uint32 form);

inline bool IsChanneledSpell(SpellEntry const* spellInfo)
{
    return (spellInfo->AttributesEx & (SPELL_ATTR_EX_CHANNELED_1 | SPELL_ATTR_EX_CHANNELED_2));
}

inline bool IsNeedCastSpellAtFormApply(SpellEntry const* spellInfo, ShapeshiftForm form)
{
    if (!(spellInfo->Attributes & (SPELL_ATTR_PASSIVE | SPELL_ATTR_HIDDEN_CLIENTSIDE)) || !form)
        return false;

    // passive spells with SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT are already active without shapeshift, do no recast!
    // Feline Swiftness Passive 2a not have 0x1 mask in Stance field in spell data as expected
    return ((spellInfo->Stances & (1<<(form-1))  || spellInfo->Id == 24864 && form == FORM_CAT) &&
        !(spellInfo->AttributesEx2 & SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT));
}

inline bool IsReflectableSpell(SpellEntry const* spellInfo, Unit* caster = NULL, Unit* victim = NULL)
{
    return spellInfo->DmgClass == SPELL_DAMAGE_CLASS_MAGIC && !spellInfo->HasAttribute(SPELL_ATTR_IS_ABILITY)
      && !spellInfo->HasAttribute(SPELL_ATTR_EX_CANT_BE_REFLECTED) && !spellInfo->HasAttribute(SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)
      && !spellInfo->HasAttribute(SPELL_ATTR_PASSIVE) && !IsPositiveSpell(spellInfo, caster, victim);
}

inline bool NeedsComboPoints(SpellEntry const* spellInfo)
{
    return (spellInfo->AttributesEx & (SPELL_ATTR_EX_REQ_TARGET_COMBO_POINTS | SPELL_ATTR_EX_REQ_COMBO_POINTS));
}

inline bool IsTotemSummonSpell(SpellEntry const* spellInfo)
{
    return spellInfo->Effect[0] >= SPELL_EFFECT_SUMMON_TOTEM_SLOT1 && spellInfo->Effect[0] <= SPELL_EFFECT_SUMMON_TOTEM_SLOT4;
}

// Spell effects require a specific power type on the target
inline bool IsTargetPowerTypeValid(SpellEntry const *spellInfo, Powers powerType)
{
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (spellInfo->Effect[i] == SPELL_EFFECT_NONE)
            continue;

        if ((spellInfo->Effect[i] == SPELL_EFFECT_POWER_BURN ||
            spellInfo->Effect[i] == SPELL_EFFECT_POWER_DRAIN ||
            spellInfo->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_MANA_LEECH ||
            spellInfo->EffectApplyAuraName[i] == SPELL_AURA_POWER_BURN_MANA) &&
            int32(powerType) != spellInfo->EffectMiscValue[i])
        {
            continue;
        }
        return true;
    }
    return false;
}

inline bool IsRemovedOnShapeLostSpell(SpellEntry const *spellInfo)
{
    return (spellInfo->Stances || spellInfo->Id == 24864) &&
           !(spellInfo->AttributesEx2 & SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT) &&
           !(spellInfo->Attributes & SPELL_ATTR_NOT_SHAPESHIFT);
}

inline SpellSchoolMask GetSpellSchoolMask(SpellEntry const* spellInfo)
{
    return GetSchoolMask(spellInfo->School);
}

inline uint32 GetSpellMechanicMask(SpellEntry const* spellInfo, uint32 effectMask)
{
    uint32 mask = 0;
    if (spellInfo->Mechanic)
        mask |= 1 << (spellInfo->Mechanic - 1);

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (!(effectMask & (1 << i)))
            continue;

        if (spellInfo->EffectMechanic[i])
            mask |= 1 << (spellInfo->EffectMechanic[i]-1);
    }

    return mask;
}

inline Mechanics GetEffectMechanic(SpellEntry const* spellInfo, SpellEffectIndex effect)
{
    if (spellInfo->EffectMechanic[effect])
        return Mechanics(spellInfo->EffectMechanic[effect]);
    if (spellInfo->Mechanic)
        return Mechanics(spellInfo->Mechanic);
    return MECHANIC_NONE;
}

inline uint32 GetDispellMask(DispelType dispel)
{
    // If dispell all
    if (dispel == DISPEL_ALL)
        return DISPEL_ALL_MASK;
    else
        return (1 << dispel);
}

// Spell affects related declarations (accessed using SpellMgr functions)
typedef std::map<uint32, uint64> SpellAffectMap;

// Spell proc event related declarations (accessed using SpellMgr functions)
enum ProcFlags
{
    PROC_FLAG_NONE                           = 0x00000000,

    PROC_FLAG_KILLED                         = 0x00000001,   // 00 Killed by aggressor
    PROC_FLAG_KILL                           = 0x00000002,   // 01 Kill target (in most cases need XP/Honor reward, see Unit::IsTriggeredAtSpellProcEvent for additinoal check)

    PROC_FLAG_SUCCESSFUL_MELEE_HIT           = 0x00000004,   // 02 Successful melee auto attack
    PROC_FLAG_TAKEN_MELEE_HIT                = 0x00000008,   // 03 Taken damage from melee auto attack hit

    PROC_FLAG_SUCCESSFUL_MELEE_SPELL_HIT     = 0x00000010,   // 04 Successful attack by Spell that use melee weapon
    PROC_FLAG_TAKEN_MELEE_SPELL_HIT          = 0x00000020,   // 05 Taken damage by Spell that use melee weapon

    PROC_FLAG_SUCCESSFUL_RANGED_HIT          = 0x00000040,   // 06 Successful Ranged auto attack
    PROC_FLAG_TAKEN_RANGED_HIT               = 0x00000080,   // 07 Taken damage from ranged auto attack

    PROC_FLAG_SUCCESSFUL_RANGED_SPELL_HIT    = 0x00000100,   // 08 Successful Ranged attack by Spell that use ranged weapon
    PROC_FLAG_TAKEN_RANGED_SPELL_HIT         = 0x00000200,   // 09 Taken damage by Spell that use ranged weapon

    PROC_FLAG_SUCCESSFUL_NONE_POSITIVE_SPELL = 0x00000400,   // 10 Successful positive spell cast (no damage class, or not a healing spell)
    PROC_FLAG_TAKEN_NONE_POSITIVE_SPELL      = 0x00000800,   // 11 Taken positive spell (no damage class)

    PROC_FLAG_SUCCESSFUL_NONE_SPELL_HIT      = 0x00001000,   // 12 Successful negative spell cast (no damage class)
    PROC_FLAG_TAKEN_NONE_SPELL_HIT           = 0x00002000,   // 13 Taken negative damage (no damage class)

    PROC_FLAG_SUCCESSFUL_POSITIVE_SPELL      = 0x00004000,   // 14 Successful cast positive spell (by default only on healing (direct and periodic))
    PROC_FLAG_TAKEN_POSITIVE_SPELL           = 0x00008000,   // 15 Taken positive spell hit (by default only on healing (direct and periodic))

    PROC_FLAG_SUCCESSFUL_NEGATIVE_SPELL_HIT  = 0x00010000,   // 16 Successful negative spell cast (by default only on damage)
    PROC_FLAG_TAKEN_NEGATIVE_SPELL_HIT       = 0x00020000,   // 17 Taken negative spell (by default only on damage)

    PROC_FLAG_ON_DO_PERIODIC                 = 0x00040000,   // 18 Successful do periodic (damage / healing, determined by PROC_EX_PERIODIC_POSITIVE or negative if no procEx)
    PROC_FLAG_ON_TAKE_PERIODIC               = 0x00080000,   // 19 Taken spell periodic (damage / healing, determined by PROC_EX_PERIODIC_POSITIVE or negative if no procEx)

    PROC_FLAG_TAKEN_ANY_DAMAGE               = 0x00100000,   // 20 Taken any damage
    PROC_FLAG_ON_TRAP_ACTIVATION             = 0x00200000,   // 21 On trap activation

    PROC_FLAG_TAKEN_OFFHAND_HIT              = 0x00400000,   // 22 Taken off-hand melee attacks(not used)
    PROC_FLAG_SUCCESSFUL_OFFHAND_HIT         = 0x00800000,   // 23 Successful off-hand melee attacks

    PROC_FLAG_SUCCESSFUL_AOE                 = 0x01000000,   // 24 Nostalrius: AoE casted. Triggered only once, whatever the number of targets.
    PROC_FLAG_SUCCESSFUL_SPELL_CAST          = 0x02000000,   // 25 Nostalrius: Spell cast successful (procs only once for AoE)

    PROC_FLAG_SUCCESSFUL_MANA_SPELL_CAST     = 0x04000000,   // 26 Successful cast of a mana based spell (procs only once for AoE)
    PROC_FLAG_SUCCESSFUL_CURE_SPELL_CAST     = 0x08000000,   // 27 Successful cast of curing spell (i.e. Cleanse)

    PROC_FLAG_SUCCESSFUL_PERIODIC_SPELL_HIT  = 0x10000000,   // 28 Successful do periodic (procs only on initial cast)
    PROC_FLAG_TAKEN_PERIODIC_SPELL_HIT       = 0x20000000    // 29 Taken spell periodic (procs only on initial cast)
};

#define MELEE_BASED_TRIGGER_MASK (PROC_FLAG_SUCCESSFUL_MELEE_HIT        | \
                                  PROC_FLAG_TAKEN_MELEE_HIT             | \
                                  PROC_FLAG_SUCCESSFUL_MELEE_SPELL_HIT  | \
                                  PROC_FLAG_TAKEN_MELEE_SPELL_HIT       | \
                                  PROC_FLAG_SUCCESSFUL_RANGED_HIT       | \
                                  PROC_FLAG_TAKEN_RANGED_HIT            | \
                                  PROC_FLAG_SUCCESSFUL_RANGED_SPELL_HIT | \
                                  PROC_FLAG_TAKEN_RANGED_SPELL_HIT)

#define NEGATIVE_TRIGGER_MASK (MELEE_BASED_TRIGGER_MASK                | \
                               PROC_FLAG_SUCCESSFUL_NONE_SPELL_HIT     | \
                               PROC_FLAG_TAKEN_NONE_SPELL_HIT          | \
                               PROC_FLAG_SUCCESSFUL_NEGATIVE_SPELL_HIT | \
                               PROC_FLAG_TAKEN_NEGATIVE_SPELL_HIT)

enum ProcFlagsEx
{
    PROC_EX_NONE                = 0x0000000,                // If none can tigger on Hit/Crit only (passive spells MUST defined by SpellFamily flag)
    PROC_EX_NORMAL_HIT          = 0x0000001,                // If set only from normal hit (only damage spells)
    PROC_EX_CRITICAL_HIT        = 0x0000002,
    PROC_EX_MISS                = 0x0000004,
    PROC_EX_RESIST              = 0x0000008,
    PROC_EX_DODGE               = 0x0000010,
    PROC_EX_PARRY               = 0x0000020,
    PROC_EX_BLOCK               = 0x0000040,
    PROC_EX_EVADE               = 0x0000080,
    PROC_EX_IMMUNE              = 0x0000100,
    PROC_EX_DEFLECT             = 0x0000200,
    PROC_EX_ABSORB              = 0x0000400,
    PROC_EX_REFLECT             = 0x0000800,
    PROC_EX_INTERRUPT           = 0x0001000,                // Melee hit result can be Interrupt (not used)
    PROC_EX_RESERVED1           = 0x0002000,
    PROC_EX_RESERVED2           = 0x0004000,
    PROC_EX_RESERVED3           = 0x0008000,
    PROC_EX_EX_TRIGGER_ALWAYS   = 0x0010000,                // If set trigger always ( no matter another flags) used for drop charges
    PROC_EX_EX_ONE_TIME_TRIGGER = 0x0020000,                // If set trigger always but only one time (not used)
    PROC_EX_PERIODIC_POSITIVE   = 0x0040000,                // For periodic heal
    PROC_EX_NO_PERIODIC         = 0x0080000,                // Will never proc if periodic proc flag present
};

struct SpellProcEventEntry
{
    uint32      schoolMask;
    uint32      spellFamilyName;                            // if nonzero - for matching proc condition based on candidate spell's SpellFamilyNamer value
    ClassFamilyMask spellFamilyMask[MAX_EFFECT_INDEX];      // if nonzero - for matching proc condition based on candidate spell's SpellFamilyFlags  (like auras 107 and 108 do)
    uint32      procFlags;                                  // bitmask for matching proc event
    uint32      procEx;                                     // proc Extend info (see ProcFlagsEx)
    float       ppmRate;                                    // for melee (ranged?) damage spells - proc rate per minute. if zero, falls back to flat chance from Spell.dbc
    float       customChance;                               // Owerride chance (in most cases for debug only)
    uint32      cooldown;                                   // hidden cooldown used for some spell proc events, applied to _triggered_spell_
};

struct SpellBonusEntry
{
    float  direct_damage;
    float  dot_damage;
    float  ap_bonus;
    float  ap_dot_bonus;
};

typedef UNORDERED_MAP<uint32, SpellProcEventEntry> SpellProcEventMap;
typedef UNORDERED_MAP<uint32, SpellBonusEntry>     SpellBonusMap;

//==========================
// Spell Groups (TC)
//==========================

enum SpellGroup
{
    SPELL_GROUP_NULL = 0,
    // Inutile pre-BC ?
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
    SpellTargetEntry(SpellTargetType type_,uint32 targetEntry_) : type(type_), targetEntry(targetEntry_) {}
    SpellTargetType type;
    uint32 targetEntry;
};

typedef std::multimap<uint32,SpellTargetEntry> SpellScriptTarget;
typedef std::pair<SpellScriptTarget::const_iterator,SpellScriptTarget::const_iterator> SpellScriptTargetBounds;

// coordinates for spells (accessed using SpellMgr functions)
struct SpellTargetPosition
{
    uint32 target_mapId;
    float  target_X;
    float  target_Y;
    float  target_Z;
    float  target_Orientation;
};

typedef UNORDERED_MAP<uint32, SpellTargetPosition> SpellTargetPositionMap;

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
            if(itr != auras.end())
                return itr->second;
            else
            {
                std::map<uint32, uint32>::const_iterator itr2 = auras.find(0);
                if(itr2 != auras.end())
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

typedef UNORDERED_MAP<uint32, SpellChainNode> SpellChainMap;
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
    SkillLineEntry const *pSkill = sSkillLineStore.LookupEntry(skill);
    if(!pSkill)
        return false;

    if(pSkill->categoryId != SKILL_CATEGORY_PROFESSION)
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

typedef std::map<uint32, uint32> SpellFacingFlagMap;
typedef std::vector<SpellEntry*> SpellEntryMap;

class SpellMgr
{
    friend struct DoSpellBonuses;
    friend struct DoSpellProcEvent;
    friend struct DoSpellProcItemEnchant;

    // Constructors
    public:
        SpellMgr();
        ~SpellMgr();

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

            for (std::set<SpellGroup>::iterator itr = groups.begin() ; itr!= groups.end() ; ++itr)
            {
                SpellGroupStackMap::const_iterator found = mSpellGroupStack.find(*itr);
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

        // Fin Spell Groups - ameliorations Nostalrius.
        // Gestion de "Un sort plus puissant est deja actif"
        bool ListMorePowerfullSpells(uint32 spellId, std::list<uint32>&) const;
        bool ListLessPowerfullSpells(uint32 spellId, std::list<uint32>&) const;
        /**
         * Assumes that both spells are in the given group.
         * Returns true if $powerfullSpell is actually the most powerfull spell.
         */
        bool IsMorePowerfullSpell(uint32 powerfullSpell, uint32 otherSpell, SpellGroup group) const
        {
            // The most powerfull spell appears after less powerfull spells in the list.
            bool spellPassed = false;
            for (SpellGroupSpellMap::const_iterator itr = mSpellGroupSpell.begin(); itr != mSpellGroupSpell.end(); ++itr)
            {
                if (itr->first != group)
                    continue;
                if (itr->second == powerfullSpell)
                    return false;
                if (itr->second == otherSpell)
                    return true;
            }
            MANGOS_ASSERT(false && "Both spells not in the given group !");
            return true;
        }

        // Spell affects
        ClassFamilyMask GetSpellAffectMask(uint32 spellId, SpellEffectIndex effectId) const
        {
            SpellAffectMap::const_iterator itr = mSpellAffectMap.find((spellId<<8) + effectId);
            if (itr != mSpellAffectMap.end())
                return ClassFamilyMask(itr->second);
            if (SpellEntry const* spellEntry = GetSpellEntry(spellId))
                return ClassFamilyMask(spellEntry->EffectItemType[effectId]);
            return ClassFamilyMask();
        }

        SpellElixirMap const& GetSpellElixirMap() const { return mSpellElixirs; }

        uint32 GetSpellElixirMask(uint32 spellid) const
        {
            SpellElixirMap::const_iterator itr = mSpellElixirs.find(spellid);
            if(itr==mSpellElixirs.end())
                return 0x0;

            return itr->second;
        }

        SpellSpecific GetSpellElixirSpecific(uint32 spellid) const
        {
            uint32 mask = GetSpellElixirMask(spellid);

            // flasks must have all bits set from ELIXIR_FLASK_MASK
            if((mask & ELIXIR_FLASK_MASK)==ELIXIR_FLASK_MASK)
                return SPELL_FLASK_ELIXIR;
            else if(mask & ELIXIR_WELL_FED)
                return SPELL_WELL_FED;
            else
                return SPELL_NORMAL;
        }

        SpellThreatEntry const* GetSpellThreatEntry(uint32 spellid) const
        {
            SpellThreatMap::const_iterator itr = mSpellThreatMap.find(spellid);
            if (itr != mSpellThreatMap.end())
                return &itr->second;

            return NULL;
        }

        float GetSpellThreatMultiplier(SpellEntry const *spellInfo) const
        {
            if (!spellInfo)
                return 1.0f;

            if (SpellThreatEntry const *entry = GetSpellThreatEntry(spellInfo->Id))
                return entry->multiplier;

            return 1.0f;
        }

        // Spell proc events
        SpellProcEventEntry const* GetSpellProcEvent(uint32 spellId) const
        {
            SpellProcEventMap::const_iterator itr = mSpellProcEventMap.find(spellId);
            if( itr != mSpellProcEventMap.end( ) )
                return &itr->second;
            return NULL;
        }

        // Spell procs from item enchants
        float GetItemEnchantProcChance(uint32 spellid) const
        {
            SpellProcItemEnchantMap::const_iterator itr = mSpellProcItemEnchantMap.find(spellid);
            if(itr==mSpellProcItemEnchantMap.end())
                return 0.0f;

            return itr->second;
        }

        static bool IsSpellProcEventCanTriggeredBy( SpellProcEventEntry const * spellProcEvent, uint32 EventProcFlag, SpellEntry const * procSpell, uint32 procFlags, uint32 procExtra);

        // Spell bonus data
        SpellBonusEntry const* GetSpellBonusData(uint32 spellId) const
        {
            // Lookup data
            SpellBonusMap::const_iterator itr = mSpellBonusMap.find(spellId);
            if( itr != mSpellBonusMap.end( ) )
                return &itr->second;

            return NULL;
        }

        uint32 GetSpellFacingFlag(uint32 spellId) const
        {
            SpellFacingFlagMap::const_iterator itr =  mSpellFacingFlagMap.find(spellId);
            if(itr != mSpellFacingFlagMap.end())
                return itr->second;
            return 0x0;
        }

        // Spell target coordinates
        SpellTargetPosition const* GetSpellTargetPosition(uint32 spell_id) const
        {
            SpellTargetPositionMap::const_iterator itr = mSpellTargetPositions.find( spell_id );
            if( itr != mSpellTargetPositions.end( ) )
                return &itr->second;
            return NULL;
        }

        // Spell ranks chains
        SpellChainNode const* GetSpellChainNode(uint32 spell_id) const
        {
            SpellChainMap::const_iterator itr = mSpellChains.find(spell_id);
            if(itr == mSpellChains.end())
                return NULL;

            return &itr->second;
        }

        uint32 GetFirstSpellInChain(uint32 spell_id) const
        {
            if(SpellChainNode const* node = GetSpellChainNode(spell_id))
                return node->first;

            return spell_id;
        }

        uint32 GetPrevSpellInChain(uint32 spell_id) const
        {
            if(SpellChainNode const* node = GetSpellChainNode(spell_id))
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
            if(SpellChainNode const* node = GetSpellChainNode(spell_id))
                return node->rank;

            return 0;
        }

        uint8 IsHighRankOfSpell(uint32 spell1,uint32 spell2) const
        {
            SpellChainMap::const_iterator itr = mSpellChains.find(spell1);

            uint32 rank2 = GetSpellRank(spell2);

            // not ordered correctly by rank value
            if(itr == mSpellChains.end() || !rank2 || itr->second.rank <= rank2)
                return false;

            // check present in same rank chain
            for(; itr != mSpellChains.end(); itr = mSpellChains.find(itr->second.prev))
                if(itr->second.prev==spell2)
                    return true;

            return false;
        }

        bool IsRankSpellDueToSpell(SpellEntry const *spellInfo_1,uint32 spellId_2) const;
        bool IsNoStackSpellDueToSpell(uint32 spellId_1, uint32 spellId_2) const;
        bool CanAurasStack(SpellEntry const *spellInfo_1, SpellEntry const *spellInfo_2, bool sameCaster) const;
        bool canStackSpellRanksInSpellBook(SpellEntry const *spellInfo) const;
        bool IsRankedSpellNonStackableInSpellBook(SpellEntry const *spellInfo) const
        {
            return !canStackSpellRanksInSpellBook(spellInfo) && GetSpellRank(spellInfo->Id) != 0;
        }

        SpellEntry const* SelectAuraRankForLevel(SpellEntry const* spellInfo, uint32 Level) const;

        // Spell learning
        SpellLearnSkillNode const* GetSpellLearnSkill(uint32 spell_id) const
        {
            SpellLearnSkillMap::const_iterator itr = mSpellLearnSkills.find(spell_id);
            if(itr != mSpellLearnSkills.end())
                return &itr->second;
            else
                return NULL;
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
        static bool IsSpellValid(SpellEntry const * spellInfo, Player* pl = NULL, bool msg = true);

        SkillLineAbilityMapBounds GetSkillLineAbilityMapBounds(uint32 spell_id) const
        {
            return mSkillLineAbilityMap.equal_range(spell_id);
        }

        SkillRaceClassInfoMapBounds GetSkillRaceClassInfoMapBounds(uint32 skill_id) const
        {
            return mSkillRaceClassInfoMap.equal_range(skill_id);
        }

        PetAura const* GetPetAura(uint32 spell_id)
        {
            SpellPetAuraMap::const_iterator itr = mSpellPetAuraMap.find(spell_id);
            if(itr != mSpellPetAuraMap.end())
                return &itr->second;
            else
                return NULL;
        }

        SpellCastResult GetSpellAllowedInLocationError(SpellEntry const *spellInfo, Unit const* caster, Player const* player = NULL);
        SpellCastResult GetSpellAllowedInLocationError(SpellEntry const *spellInfo, uint32 zone_id, uint32 area_id, Player const* player = NULL);

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
        void LoadSpellLearnSkills();
        void LoadSpellLearnSpells();
        void LoadSpellScriptTarget();
        void LoadSpellAffects();
        void LoadSpellElixirs();
        void LoadSpellProcEvents();
        void LoadSpellProcItemEnchant();
        void LoadSpellBonuses();
        void LoadSpellTargetPositions();
        void LoadSpellThreats();
        void LoadSkillLineAbilityMap();
        void LoadSkillRaceClassInfoMap();
        void LoadSpellPetAuras();
        void LoadSpellAreas();
        void LoadFacingCasterFlags();

        // SPELL GROUPS
        void LoadSpellGroups();
        void LoadSpellGroupStackRules();
        // SpellEntry
        void LoadSpells();
        SpellEntry const* GetSpellEntry(uint32 spellId) const { return spellId < GetMaxSpellId() ? mSpellEntryMap[spellId] : NULL; }
        uint32 GetMaxSpellId() const { return mSpellEntryMap.size(); }
            // spell_mod
        bool SetSpellEntry(uint32 id, SpellEntry* ptr)
        {
            if (id < GetMaxSpellId())
            {
                mSpellEntryMap[id] = ptr;
                return true;
            }
            return false;
        }

    private:
        SpellScriptTarget  mSpellScriptTarget;
        SpellChainMap      mSpellChains;
        SpellChainMapNext  mSpellChainsNext;
        SpellLearnSkillMap mSpellLearnSkills;
        SpellLearnSpellMap mSpellLearnSpells;
        SpellTargetPositionMap mSpellTargetPositions;
        SpellAffectMap     mSpellAffectMap;
        SpellElixirMap     mSpellElixirs;
        SpellThreatMap     mSpellThreatMap;
        SpellProcEventMap  mSpellProcEventMap;
        SpellProcItemEnchantMap mSpellProcItemEnchantMap;
        SpellBonusMap      mSpellBonusMap;
        SkillLineAbilityMap mSkillLineAbilityMap;
        SkillRaceClassInfoMap mSkillRaceClassInfoMap;
        SpellPetAuraMap     mSpellPetAuraMap;
        SpellAreaMap         mSpellAreaMap;
        SpellAreaForQuestMap mSpellAreaForQuestMap;
        SpellAreaForQuestMap mSpellAreaForActiveQuestMap;
        SpellAreaForQuestMap mSpellAreaForQuestEndMap;
        SpellAreaForAuraMap  mSpellAreaForAuraMap;
        SpellAreaForAreaMap  mSpellAreaForAreaMap;
        SpellFacingFlagMap  mSpellFacingFlagMap;

        // SPELL GROUPS
        SpellSpellGroupMap mSpellSpellGroup;
        SpellGroupSpellMap mSpellGroupSpell;
        SpellGroupStackMap   mSpellGroupStack;
        // SpellEntry
        SpellEntryMap      mSpellEntryMap;
};

#define sSpellMgr SpellMgr::Instance()
#endif
