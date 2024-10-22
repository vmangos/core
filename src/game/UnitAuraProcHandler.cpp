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

#include "Common.h"
#include "Log.h"
#include "Creature.h"
#include "Player.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "SpellMgr.h"
#include "Util.h"
#include "World.h"
#include "GridMap.h"

pAuraProcHandler AuraProcHandler[TOTAL_AURAS] =
{
    &Unit::HandleNULLProc,                                  //  0 SPELL_AURA_NONE
    &Unit::HandleNULLProc,                                  //  1 SPELL_AURA_BIND_SIGHT
    &Unit::HandleNULLProc,                                  //  2 SPELL_AURA_MOD_POSSESS
    &Unit::HandleNULLProc,                                  //  3 SPELL_AURA_PERIODIC_DAMAGE
    &Unit::HandleDummyAuraProc,                             //  4 SPELL_AURA_DUMMY
    &Unit::HandleNULLProc,                                  //  5 SPELL_AURA_MOD_CONFUSE
    &Unit::HandleNULLProc,                                  //  6 SPELL_AURA_MOD_CHARM
    &Unit::HandleRemoveFearByDamageChanceProc,              //  7 SPELL_AURA_MOD_FEAR
    &Unit::HandleNULLProc,                                  //  8 SPELL_AURA_PERIODIC_HEAL
    &Unit::HandleNULLProc,                                  //  9 SPELL_AURA_MOD_ATTACKSPEED
    &Unit::HandleNULLProc,                                  // 10 SPELL_AURA_MOD_THREAT
    &Unit::HandleNULLProc,                                  // 11 SPELL_AURA_MOD_TAUNT
    &Unit::HandleNULLProc,                                  // 12 SPELL_AURA_MOD_STUN
    &Unit::HandleModDamageAuraProc,                         // 13 SPELL_AURA_MOD_DAMAGE_DONE
    &Unit::HandleNULLProc,                                  // 14 SPELL_AURA_MOD_DAMAGE_TAKEN
    &Unit::HandleNULLProc,                                  // 15 SPELL_AURA_DAMAGE_SHIELD
    &Unit::HandleNULLProc,                                  // 16 SPELL_AURA_MOD_STEALTH
    &Unit::HandleNULLProc,                                  // 17 SPELL_AURA_MOD_STEALTH_DETECT
    &Unit::HandleInvisibilityAuraProc,                      // 18 SPELL_AURA_MOD_INVISIBILITY
    &Unit::HandleNULLProc,                                  // 19 SPELL_AURA_MOD_INVISIBILITY_DETECTION
    &Unit::HandleNULLProc,                                  // 20 SPELL_AURA_OBS_MOD_HEALTH
    &Unit::HandleNULLProc,                                  // 21 SPELL_AURA_OBS_MOD_MANA
    &Unit::HandleModResistanceAuraProc,                     // 22 SPELL_AURA_MOD_RESISTANCE
    &Unit::HandleNULLProc,                                  // 23 SPELL_AURA_PERIODIC_TRIGGER_SPELL
    &Unit::HandleNULLProc,                                  // 24 SPELL_AURA_PERIODIC_ENERGIZE
    &Unit::HandleNULLProc,                                  // 25 SPELL_AURA_MOD_PACIFY
    &Unit::HandleRemoveByDamageChanceProc,                  // 26 SPELL_AURA_MOD_ROOT
    &Unit::HandleNULLProc,                                  // 27 SPELL_AURA_MOD_SILENCE
    &Unit::HandleNULLProc,                                  // 28 SPELL_AURA_REFLECT_SPELLS
    &Unit::HandleNULLProc,                                  // 29 SPELL_AURA_MOD_STAT
    &Unit::HandleNULLProc,                                  // 30 SPELL_AURA_MOD_SKILL
    &Unit::HandleNULLProc,                                  // 31 SPELL_AURA_MOD_INCREASE_SPEED
    &Unit::HandleNULLProc,                                  // 32 SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED
    &Unit::HandleNULLProc,                                  // 33 SPELL_AURA_MOD_DECREASE_SPEED
    &Unit::HandleNULLProc,                                  // 34 SPELL_AURA_MOD_INCREASE_HEALTH
    &Unit::HandleNULLProc,                                  // 35 SPELL_AURA_MOD_INCREASE_ENERGY
    &Unit::HandleNULLProc,                                  // 36 SPELL_AURA_MOD_SHAPESHIFT
    &Unit::HandleNULLProc,                                  // 37 SPELL_AURA_EFFECT_IMMUNITY
    &Unit::HandleNULLProc,                                  // 38 SPELL_AURA_STATE_IMMUNITY
    &Unit::HandleNULLProc,                                  // 39 SPELL_AURA_SCHOOL_IMMUNITY
    &Unit::HandleNULLProc,                                  // 40 SPELL_AURA_DAMAGE_IMMUNITY
    &Unit::HandleNULLProc,                                  // 41 SPELL_AURA_DISPEL_IMMUNITY
    &Unit::HandleProcTriggerSpellAuraProc,                  // 42 SPELL_AURA_PROC_TRIGGER_SPELL
    &Unit::HandleProcTriggerDamageAuraProc,                 // 43 SPELL_AURA_PROC_TRIGGER_DAMAGE
    &Unit::HandleNULLProc,                                  // 44 SPELL_AURA_TRACK_CREATURES
    &Unit::HandleNULLProc,                                  // 45 SPELL_AURA_TRACK_RESOURCES
    &Unit::HandleNULLProc,                                  // 46 SPELL_AURA_MOD_PARRY_SKILL
    &Unit::HandleNULLProc,                                  // 47 SPELL_AURA_MOD_PARRY_PERCENT
    &Unit::HandleNULLProc,                                  // 48 SPELL_AURA_MOD_DODGE_SKILL
    &Unit::HandleNULLProc,                                  // 49 SPELL_AURA_MOD_DODGE_PERCENT
    &Unit::HandleNULLProc,                                  // 50 SPELL_AURA_MOD_BLOCK_SKILL    obsolete?
    &Unit::HandleNULLProc,                                  // 51 SPELL_AURA_MOD_BLOCK_PERCENT
    &Unit::HandleNULLProc,                                  // 52 SPELL_AURA_MOD_CRIT_PERCENT
    &Unit::HandleNULLProc,                                  // 53 SPELL_AURA_PERIODIC_LEECH
    &Unit::HandleNULLProc,                                  // 54 SPELL_AURA_MOD_HIT_CHANCE
    &Unit::HandleNULLProc,                                  // 55 SPELL_AURA_MOD_SPELL_HIT_CHANCE
    &Unit::HandleNULLProc,                                  // 56 SPELL_AURA_TRANSFORM
    &Unit::HandleNULLProc,                                  // 57 SPELL_AURA_MOD_SPELL_CRIT_CHANCE
    &Unit::HandleNULLProc,                                  // 58 SPELL_AURA_MOD_INCREASE_SWIM_SPEED
    &Unit::HandleNULLProc,                                  // 59 SPELL_AURA_MOD_DAMAGE_DONE_CREATURE
    &Unit::HandleRemoveByDamageChanceProc,                  // 60 SPELL_AURA_MOD_PACIFY_SILENCE
    &Unit::HandleNULLProc,                                  // 61 SPELL_AURA_MOD_SCALE
    &Unit::HandleNULLProc,                                  // 62 SPELL_AURA_PERIODIC_HEALTH_FUNNEL
    &Unit::HandleNULLProc,                                  // 63 SPELL_AURA_PERIODIC_MANA_FUNNEL obsolete?
    &Unit::HandleNULLProc,                                  // 64 SPELL_AURA_PERIODIC_MANA_LEECH
    &Unit::HandleModCastingSpeedNotStackAuraProc,           // 65 SPELL_AURA_MOD_CASTING_SPEED_NOT_STACK
    &Unit::HandleNULLProc,                                  // 66 SPELL_AURA_FEIGN_DEATH
    &Unit::HandleNULLProc,                                  // 67 SPELL_AURA_MOD_DISARM
    &Unit::HandleNULLProc,                                  // 68 SPELL_AURA_MOD_STALKED
    &Unit::HandleNULLProc,                                  // 69 SPELL_AURA_SCHOOL_ABSORB
    &Unit::HandleNULLProc,                                  // 70 SPELL_AURA_EXTRA_ATTACKS      Useless, used by only one spell that has only visual effect
    &Unit::HandleNULLProc,                                  // 71 SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL
    &Unit::HandleModPowerCostSchoolAuraProc,                // 72 SPELL_AURA_MOD_POWER_COST_SCHOOL_PCT
    &Unit::HandleModPowerCostSchoolAuraProc,                // 73 SPELL_AURA_MOD_POWER_COST_SCHOOL
    &Unit::HandleReflectSpellsSchoolAuraProc,               // 74 SPELL_AURA_REFLECT_SPELLS_SCHOOL
    &Unit::HandleNULLProc,                                  // 75 SPELL_AURA_MOD_LANGUAGE
    &Unit::HandleNULLProc,                                  // 76 SPELL_AURA_FAR_SIGHT
    &Unit::HandleMechanicImmuneResistanceAuraProc,          // 77 SPELL_AURA_MECHANIC_IMMUNITY
    &Unit::HandleNULLProc,                                  // 78 SPELL_AURA_MOUNTED
    &Unit::HandleNULLProc,                                  // 79 SPELL_AURA_MOD_DAMAGE_PERCENT_DONE
    &Unit::HandleNULLProc,                                  // 80 SPELL_AURA_MOD_PERCENT_STAT
    &Unit::HandleNULLProc,                                  // 81 SPELL_AURA_SPLIT_DAMAGE_PCT
    &Unit::HandleNULLProc,                                  // 82 SPELL_AURA_WATER_BREATHING
    &Unit::HandleNULLProc,                                  // 83 SPELL_AURA_MOD_BASE_RESISTANCE
    &Unit::HandleNULLProc,                                  // 84 SPELL_AURA_MOD_REGEN
    &Unit::HandleCantTrigger,                               // 85 SPELL_AURA_MOD_POWER_REGEN
    &Unit::HandleNULLProc,                                  // 86 SPELL_AURA_CHANNEL_DEATH_ITEM
    &Unit::HandleNULLProc,                                  // 87 SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN
    &Unit::HandleNULLProc,                                  // 88 SPELL_AURA_MOD_HEALTH_REGEN_PERCENT
    &Unit::HandleNULLProc,                                  // 89 SPELL_AURA_PERIODIC_DAMAGE_PERCENT
    &Unit::HandleNULLProc,                                  // 90 SPELL_AURA_MOD_RESIST_CHANCE  Useless
    &Unit::HandleNULLProc,                                  // 91 SPELL_AURA_MOD_DETECT_RANGE
    &Unit::HandleNULLProc,                                  // 92 SPELL_AURA_PREVENTS_FLEEING
    &Unit::HandleNULLProc,                                  // 93 SPELL_AURA_MOD_UNATTACKABLE
    &Unit::HandleNULLProc,                                  // 94 SPELL_AURA_INTERRUPT_REGEN
    &Unit::HandleNULLProc,                                  // 95 SPELL_AURA_GHOST
    &Unit::HandleNULLProc,                                  // 96 SPELL_AURA_SPELL_MAGNET
    &Unit::HandleNULLProc,                                  // 97 SPELL_AURA_MANA_SHIELD
    &Unit::HandleNULLProc,                                  // 98 SPELL_AURA_MOD_SKILL_TALENT
    &Unit::HandleNULLProc,                                  // 99 SPELL_AURA_MOD_ATTACK_POWER
    &Unit::HandleNULLProc,                                  //100 SPELL_AURA_AURAS_VISIBLE obsolete? all player can see all auras now
    &Unit::HandleNULLProc,                                  //101 SPELL_AURA_MOD_RESISTANCE_PCT
    &Unit::HandleNULLProc,                                  //102 SPELL_AURA_MOD_MELEE_ATTACK_POWER_VERSUS
    &Unit::HandleNULLProc,                                  //103 SPELL_AURA_MOD_TOTAL_THREAT
    &Unit::HandleNULLProc,                                  //104 SPELL_AURA_WATER_WALK
    &Unit::HandleNULLProc,                                  //105 SPELL_AURA_FEATHER_FALL
    &Unit::HandleNULLProc,                                  //106 SPELL_AURA_HOVER
    &Unit::HandleNULLProc,                                  //107 SPELL_AURA_ADD_FLAT_MODIFIER
    &Unit::HandleNULLProc,                                  //108 SPELL_AURA_ADD_PCT_MODIFIER
    &Unit::HandleAddTargetTriggerAuraProc,                  //109 SPELL_AURA_ADD_TARGET_TRIGGER
    &Unit::HandleNULLProc,                                  //110 SPELL_AURA_MOD_POWER_REGEN_PERCENT
    &Unit::HandleNULLProc,                                  //111 SPELL_AURA_ADD_CASTER_HIT_TRIGGER
    &Unit::HandleOverrideClassScriptAuraProc,               //112 SPELL_AURA_OVERRIDE_CLASS_SCRIPTS
    &Unit::HandleNULLProc,                                  //113 SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN
    &Unit::HandleNULLProc,                                  //114 SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN_PCT
    &Unit::HandleNULLProc,                                  //115 SPELL_AURA_MOD_HEALING
    &Unit::HandleNULLProc,                                  //116 SPELL_AURA_MOD_REGEN_DURING_COMBAT
    &Unit::HandleMechanicImmuneResistanceAuraProc,          //117 SPELL_AURA_MOD_MECHANIC_RESISTANCE
    &Unit::HandleNULLProc,                                  //118 SPELL_AURA_MOD_HEALING_PCT
    &Unit::HandleNULLProc,                                  //119 SPELL_AURA_SHARE_PET_TRACKING useless
    &Unit::HandleNULLProc,                                  //120 SPELL_AURA_UNTRACKABLE
    &Unit::HandleNULLProc,                                  //121 SPELL_AURA_EMPATHY
    &Unit::HandleNULLProc,                                  //122 SPELL_AURA_MOD_OFFHAND_DAMAGE_PCT
    &Unit::HandleNULLProc,                                  //123 SPELL_AURA_MOD_TARGET_RESISTANCE
    &Unit::HandleNULLProc,                                  //124 SPELL_AURA_MOD_RANGED_ATTACK_POWER
    &Unit::HandleNULLProc,                                  //125 SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN
    &Unit::HandleNULLProc,                                  //126 SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN_PCT
    &Unit::HandleNULLProc,                                  //127 SPELL_AURA_RANGED_ATTACK_POWER_ATTACKER_BONUS
    &Unit::HandleNULLProc,                                  //128 SPELL_AURA_MOD_POSSESS_PET
    &Unit::HandleNULLProc,                                  //129 SPELL_AURA_MOD_SPEED_ALWAYS
    &Unit::HandleNULLProc,                                  //130 SPELL_AURA_MOD_MOUNTED_SPEED_ALWAYS
    &Unit::HandleNULLProc,                                  //131 SPELL_AURA_MOD_RANGED_ATTACK_POWER_VERSUS
    &Unit::HandleNULLProc,                                  //132 SPELL_AURA_MOD_INCREASE_ENERGY_PERCENT
    &Unit::HandleNULLProc,                                  //133 SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT
    &Unit::HandleNULLProc,                                  //134 SPELL_AURA_MOD_MANA_REGEN_INTERRUPT
    &Unit::HandleNULLProc,                                  //135 SPELL_AURA_MOD_HEALING_DONE
    &Unit::HandleNULLProc,                                  //136 SPELL_AURA_MOD_HEALING_DONE_PERCENT
    &Unit::HandleNULLProc,                                  //137 SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE
    &Unit::HandleHasteAuraProc,                             //138 SPELL_AURA_MOD_MELEE_HASTE
    &Unit::HandleNULLProc,                                  //139 SPELL_AURA_FORCE_REACTION
    &Unit::HandleNULLProc,                                  //140 SPELL_AURA_MOD_RANGED_HASTE
    &Unit::HandleNULLProc,                                  //141 SPELL_AURA_MOD_RANGED_AMMO_HASTE
    &Unit::HandleNULLProc,                                  //142 SPELL_AURA_MOD_BASE_RESISTANCE_PCT
    &Unit::HandleNULLProc,                                  //143 SPELL_AURA_MOD_RESISTANCE_EXCLUSIVE
    &Unit::HandleNULLProc,                                  //144 SPELL_AURA_SAFE_FALL
    &Unit::HandleNULLProc,                                  //145 SPELL_AURA_CHARISMA obsolete?
    &Unit::HandleNULLProc,                                  //146 SPELL_AURA_PERSUADED obsolete?
    &Unit::HandleNULLProc,                                  //147 SPELL_AURA_MECHANIC_IMMUNITY_MASK
    &Unit::HandleNULLProc,                                  //148 SPELL_AURA_RETAIN_COMBO_POINTS
    &Unit::HandleCantTrigger,                               //149 SPELL_AURA_RESIST_PUSHBACK
    &Unit::HandleNULLProc,                                  //150 SPELL_AURA_MOD_SHIELD_BLOCKVALUE_PCT
    &Unit::HandleNULLProc,                                  //151 SPELL_AURA_TRACK_STEALTHED
    &Unit::HandleNULLProc,                                  //152 SPELL_AURA_MOD_DETECTED_RANGE
    &Unit::HandleNULLProc,                                  //153 SPELL_AURA_SPLIT_DAMAGE_FLAT
    &Unit::HandleNULLProc,                                  //154 SPELL_AURA_MOD_STEALTH_LEVEL
    &Unit::HandleNULLProc,                                  //155 SPELL_AURA_MOD_WATER_BREATHING
    &Unit::HandleNULLProc,                                  //156 SPELL_AURA_MOD_REPUTATION_GAIN
    &Unit::HandleNULLProc,                                  //157 SPELL_AURA_PET_DAMAGE_MULTI (single test like spell 20782, also single for 214 aura)
    &Unit::HandleNULLProc,                                  //158 SPELL_AURA_MOD_SHIELD_BLOCKVALUE
    &Unit::HandleNULLProc,                                  //159 SPELL_AURA_NO_PVP_CREDIT      only for Honorless Target spell
    &Unit::HandleNULLProc,                                  //160 SPELL_AURA_MOD_AOE_AVOIDANCE
    &Unit::HandleNULLProc,                                  //161 SPELL_AURA_MOD_HEALTH_REGEN_IN_COMBAT
    &Unit::HandleNULLProc,                                  //162 SPELL_AURA_POWER_BURN_MANA
    &Unit::HandleNULLProc,                                  //163 SPELL_AURA_MOD_CRIT_DAMAGE_BONUS
    &Unit::HandleNULLProc,                                  //164 useless, only one test spell
    &Unit::HandleNULLProc,                                  //165 SPELL_AURA_MELEE_ATTACK_POWER_ATTACKER_BONUS
    &Unit::HandleNULLProc,                                  //166 SPELL_AURA_MOD_ATTACK_POWER_PCT
    &Unit::HandleNULLProc,                                  //167 SPELL_AURA_MOD_RANGED_ATTACK_POWER_PCT
    &Unit::HandleNULLProc,                                  //168 SPELL_AURA_MOD_DAMAGE_DONE_VERSUS
    &Unit::HandleNULLProc,                                  //169 SPELL_AURA_MOD_CRIT_PERCENT_VERSUS
    &Unit::HandleNULLProc,                                  //170 SPELL_AURA_DETECT_AMORE       only for Detect Amore spell
    &Unit::HandleNULLProc,                                  //171 SPELL_AURA_MOD_SPEED_NOT_STACK
    &Unit::HandleNULLProc,                                  //172 SPELL_AURA_MOD_MOUNTED_SPEED_NOT_STACK
    &Unit::HandleNULLProc,                                  //173 SPELL_AURA_ALLOW_CHAMPION_SPELLS  only for Proclaim Champion spell
    &Unit::HandleNULLProc,                                  //174 SPELL_AURA_MOD_SPELL_DAMAGE_OF_STAT_PERCENT
    &Unit::HandleNULLProc,                                  //175 SPELL_AURA_MOD_SPELL_HEALING_OF_STAT_PERCENT
    &Unit::HandleNULLProc,                                  //176 SPELL_AURA_SPIRIT_OF_REDEMPTION   only for Spirit of Redemption spell, die at aura end
    &Unit::HandleNULLProc,                                  //177 SPELL_AURA_AOE_CHARM
    &Unit::HandleNULLProc,                                  //178 SPELL_AURA_MOD_DEBUFF_RESISTANCE
    &Unit::HandleNULLProc,                                  //179 SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE
    &Unit::HandleNULLProc,                                  //180 SPELL_AURA_MOD_FLAT_SPELL_DAMAGE_VERSUS
    &Unit::HandleNULLProc,                                  //181 SPELL_AURA_MOD_FLAT_SPELL_CRIT_DAMAGE_VERSUS unused
    &Unit::HandleNULLProc,                                  //182 SPELL_AURA_MOD_RESISTANCE_OF_STAT_PERCENT
    &Unit::HandleNULLProc,                                  //183 SPELL_AURA_MOD_CRITICAL_THREAT only used in 28746
    &Unit::HandleNULLProc,                                  //184 SPELL_AURA_MOD_ATTACKER_MELEE_HIT_CHANCE
    &Unit::HandleNULLProc,                                  //185 SPELL_AURA_MOD_ATTACKER_RANGED_HIT_CHANCE
    &Unit::HandleNULLProc,                                  //186 SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE
    &Unit::HandleNULLProc,                                  //187 SPELL_AURA_MOD_ATTACKER_MELEE_CRIT_CHANCE
    &Unit::HandleNULLProc,                                  //188 SPELL_AURA_MOD_ATTACKER_RANGED_CRIT_CHANCE
    &Unit::HandleNULLProc,                                  //189 SPELL_AURA_MOD_RATING
    &Unit::HandleNULLProc,                                  //190 SPELL_AURA_MOD_FACTION_REPUTATION_GAIN
    &Unit::HandleNULLProc,                                  //191 SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED
};

// Fonctions Nostalrius
inline bool SpellCanTrigger(SpellEntry const* spellProto, SpellEntry const* procSpell, uint8 eff_idx = 0)
{
    return (procSpell && procSpell->SpellFamilyName == spellProto->SpellFamilyName && procSpell->SpellFamilyFlags & spellProto->EffectItemType[eff_idx]);
}

SpellProcEventTriggerCheck Unit::IsTriggeredAtSpellProcEvent(Unit* pVictim, SpellAuraHolder* holder, SpellEntry const* procSpell, uint32 procFlag, uint32 procExtra, WeaponAttackType attType, bool isVictim, SpellProcEventEntry const*& spellProcEvent, bool isSpellTriggeredByAuraOrItem) const
{
    SpellEntry const* spellProto = holder->GetSpellProto();
    /*
    if (procSpell)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Flag : 0x%x, Extr : 0x%x. ProcSpell %u Aura %u",
            procFlag, procExtra, procSpell->Id, spellProto->Id);
    else
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Flag : 0x%x, Extr : 0x%x. Aura %u (ICON %u)",
            procFlag, procExtra, spellProto->Id, spellProto->SpellIconID);*/

    // Flurry can't proc on additional windfury attacks
    if (spellProto->SpellIconID == 108 && spellProto->SpellVisual == 2759 && m_extraAttacks)
        return SPELL_PROC_TRIGGER_FAILED;

    // Don't proc weapons on Sap
    if (spellProto->Id == 14076 || spellProto->Id == 14094 || spellProto->Id == 14095)
        return SPELL_PROC_TRIGGER_FAILED;

    // [TODO]
    // Delete all these spells, and manage it via the DB (spell_proc_event)
    if (procSpell && !(procExtra & PROC_EX_CAST_END))
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        // Eye for an Eye
        if (spellProto->Id == 9799 || spellProto->Id == 25988)
        {
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
            // World of Warcraft Client Patch 1.10.0 (2006-03-28)
            // - Eye for an Eye - This talent can now trigger while you are mounted.
            if (IsMounted())
                return SPELL_PROC_TRIGGER_FAILED;

            // World of Warcraft Client Patch 1.10.0 (2006-03-28)
            // - If a paladin avoids damage with Divine Shield, Eye for an Eye will
            //   not react.
            if (!((procFlag & PROC_FLAG_TAKE_HARMFUL_SPELL) && (procExtra & (PROC_EX_CRITICAL_HIT | PROC_EX_IMMUNE))))
                return SPELL_PROC_TRIGGER_FAILED;
#else
            if (!((procFlag & PROC_FLAG_TAKE_HARMFUL_SPELL) && (procExtra & PROC_EX_CRITICAL_HIT)))
                return SPELL_PROC_TRIGGER_FAILED;
#endif
        }
#endif
        // Improved Lay on Hands
        if (spellProto->SpellIconID == 79 && spellProto->SpellFamilyName == SPELLFAMILY_PALADIN)
        {
            if (procSpell->SpellFamilyName == SPELLFAMILY_PALADIN && procSpell->SpellIconID == 79 && procSpell->Category == 56 && !isVictim)
                return SPELL_PROC_TRIGGER_OK;
            else
                return SPELL_PROC_TRIGGER_FAILED;
        }
        // Wrath of Cenarius - Spell Blasting
        if (spellProto->Id == 25906)
        {
            // Should be able to proc when negative magical effect lands on a target.
            if (!isVictim && (procSpell->DmgClass == SPELL_DAMAGE_CLASS_MAGIC) && !procSpell->IsPositiveSpell() && (procExtra & (PROC_EX_NORMAL_HIT | PROC_EX_CRITICAL_HIT)) && !(procSpell->IsSpellAppliesAura() && (procFlag & PROC_FLAG_DEAL_HARMFUL_PERIODIC)))
            {
                if (roll_chance_f((float)spellProto->procChance))
                    return SPELL_PROC_TRIGGER_OK;
                else
                    return SPELL_PROC_TRIGGER_ROLL_FAILED;
            }
        }
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_10_2
        // World of Warcraft Client Patch 1.11.0 (2006-06-20)
        // - Vengeance: Seal of Command critical hits can now trigger this ability
        if ((procSpell->Id == 20424) && (spellProto->SpellIconID == 84))
            return SPELL_PROC_TRIGGER_FAILED;
#endif
        // DRUID
        // Omen of Clarity
        if (spellProto->Id == 16864)
        {
            if (!procSpell && (procFlag & (PROC_FLAG_DEAL_MELEE_SWING | PROC_FLAG_DEAL_MELEE_ABILITY)))
            {
                if (roll_chance_u(10))
                    return SPELL_PROC_TRIGGER_OK;
                else
                    return SPELL_PROC_TRIGGER_ROLL_FAILED;
            }
            return SPELL_PROC_TRIGGER_FAILED;
        }
        // PRIEST
        // Inspiration
        if (spellProto->SpellIconID == 79 && spellProto->SpellFamilyName == SPELLFAMILY_PRIEST)
        {
            if (procSpell->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_PRAYER_OF_HEALING, CF_PRIEST_HEAL,
                CF_PRIEST_FLASH_HEAL, CF_PRIEST_FLASH_HEAL2, CF_PRIEST_GREATER_HEAL>() &&
                procExtra & PROC_EX_CRITICAL_HIT && procFlag & PROC_FLAG_DEAL_HELPFUL_SPELL)
                return SPELL_PROC_TRIGGER_OK;
            else
                return SPELL_PROC_TRIGGER_FAILED;
        }
        // SPELL_AURA_ADD_TARGET_PROC
        // Chance of proc calculated after.
        if (spellProto->EffectApplyAuraName[0] == SPELL_AURA_ADD_TARGET_TRIGGER)
        {
            // All spells that proc on the victim
            // Then the others
            if (isVictim)
                return SPELL_PROC_TRIGGER_FAILED;

            switch (spellProto->Id)
            {
                // Frosty Zap
                case 24392:
                    if (SpellCanTrigger(spellProto, procSpell))
                        return SPELL_PROC_TRIGGER_OK;
                    break;
            }

            return SPELL_PROC_TRIGGER_FAILED;
        }

        // World of Warcraft Client Patch 1.10.0 (2006-03-28)
        // - Execute - This ability will now work with Sweeping Strikes again. If
        //   the second victim is below 20 % health, they will be hit with the full
        //   Execute amount.If the second victim is not below 20 % health, they
        //   will be hit with normal melee swing damage.
        // - Whirlwind - When this ability is used with Sweeping Strikes, it will
        //   burn only one charge of Sweeping Strikes and will generate only one
        //   additional attack.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
        // Sweeping Strikes
        if (spellProto->Id == 12292 || spellProto->Id == 18765)
        {
            // Never proc for Execute.
            if (procSpell->SpellIconID == 1648)
                return SPELL_PROC_TRIGGER_FAILED;

            // Proc for every Whirlwind hit.
            if (procSpell->SpellIconID == 83)
                return SPELL_PROC_TRIGGER_OK;

            if (procSpell->IsDirectDamageSpell() && (procFlag & (PROC_FLAG_DEAL_MELEE_SWING | PROC_FLAG_DEAL_MELEE_ABILITY)))
                return SPELL_PROC_TRIGGER_OK;
        }
#endif
        //  Never proc for Rend.	
        if (spellProto->Id == 12292) 
        {
            if (procSpell->SpellIconID == 245)      
                return SPELL_PROC_TRIGGER_FAILED;
        }
        // SHAMAN
        // Elemental Mastery
        // Do not consume aura if spell did not benefit from crit chance bonus.
        // Can happen if aura was cast after damaging spell was already launched.
        if (spellProto->Id == 16166 && (procExtra & PROC_EX_NORMAL_HIT))
            return SPELL_PROC_TRIGGER_FAILED;
    }

    // Get proc Event Entry
    spellProcEvent = sSpellMgr.GetSpellProcEvent(spellProto->Id);

    // Custom hard-coded cases which depend on the proc event for firing...
    if (procSpell)
    {
        // Fear Ward always procs on any Fear (except ones cast by ourselves...)
        if (spellProto->Id == 6346 && isVictim)
        {
            if (procSpell->Mechanic == MECHANIC_FEAR)
                return SPELL_PROC_TRIGGER_OK;
            else
                return SPELL_PROC_TRIGGER_FAILED;
        }
    }

    // Get EventProcFlag
    uint32 EventProcFlag;
    if (spellProcEvent && spellProcEvent->procFlags) // if exist get custom spellProcEvent->procFlags
        EventProcFlag = spellProcEvent->procFlags;
    else
        EventProcFlag = spellProto->procFlags;       // else get from spell proto
    // Continue if no trigger exist
    if (!EventProcFlag)
        return SPELL_PROC_TRIGGER_FAILED;

    // Check spellProcEvent data requirements
    if (!SpellMgr::IsSpellProcEventCanTriggeredBy(spellProcEvent, EventProcFlag, procSpell, procFlag, procExtra))
        return SPELL_PROC_TRIGGER_FAILED;

    // In most cases req get honor or XP from kill
    if ((EventProcFlag & PROC_FLAG_KILL) && IsPlayer())
    {
        bool allow = ((Player*)this)->IsHonorOrXPTarget(pVictim);
        if (!allow)
            return SPELL_PROC_TRIGGER_FAILED;
    }
    // Aura added by spell can`t trigger from self (prevent drop charges/do triggers)
    // But except periodic triggers (can triggered from self)
    if (procSpell && procSpell->Id == spellProto->Id && !(EventProcFlag & PROC_FLAG_TAKE_HARMFUL_PERIODIC))
        return SPELL_PROC_TRIGGER_FAILED;

    // Check if current equipment allows aura to proc
    if (!isVictim && IsPlayer() && !spellProto->HasAttribute(SPELL_ATTR_EX3_NO_PROC_EQUIP_REQUIREMENT))
    {
        if (spellProto->EquippedItemClass == ITEM_CLASS_WEAPON)
        {
            Item *item = nullptr;
            if (attType == BASE_ATTACK)
                item = ((Player*)this)->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
            else if (attType == OFF_ATTACK)
                item = ((Player*)this)->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
            else
                item = ((Player*)this)->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_RANGED);

            if (!CanUseEquippedWeapon(attType))
                return SPELL_PROC_TRIGGER_FAILED;

            if (!item || item->IsBroken() || item->GetProto()->Class != ITEM_CLASS_WEAPON || !((1 << item->GetProto()->SubClass) & spellProto->EquippedItemSubClassMask))
                return SPELL_PROC_TRIGGER_FAILED;
        }
        else if (spellProto->EquippedItemClass == ITEM_CLASS_ARMOR)
        {
            // Check if player is wearing shield
            Item *item = ((Player*)this)->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
            if (!item || item->IsBroken() || item->GetProto()->Class != ITEM_CLASS_ARMOR || !((1 << item->GetProto()->SubClass) & spellProto->EquippedItemSubClassMask))
                return SPELL_PROC_TRIGGER_FAILED;
        }
    }

    if (isSpellTriggeredByAuraOrItem && procSpell &&
        !procSpell->HasAttribute(SPELL_ATTR_EX3_NOT_A_PROC) &&
        !spellProto->HasAttribute(SPELL_ATTR_EX3_CAN_PROC_FROM_PROCS))
        return SPELL_PROC_TRIGGER_FAILED;

    if (spellProto->HasAttribute(SPELL_ATTR_EX3_ONLY_PROC_OUTDOORS) &&
       !GetTerrain()->IsOutdoors(GetPositionX(), GetPositionY(), GetPositionZ()))
        return SPELL_PROC_TRIGGER_FAILED;

    if (spellProto->HasAttribute(SPELL_ATTR_EX3_ONLY_PROC_ON_CASTER) &&
        holder->GetTarget()->GetObjectGuid() != holder->GetCasterGuid())
        return SPELL_PROC_TRIGGER_FAILED;

    // Get chance from spell
    float chance = (float)spellProto->procChance;
    // If in spellProcEvent exist custom chance, chance = spellProcEvent->customChance;
    if (spellProcEvent && spellProcEvent->customChance)
        chance = spellProcEvent->customChance;

    // If PPM exist calculate chance from PPM
    if (!isVictim && spellProcEvent && spellProcEvent->ppmRate != 0)
    {
        uint32 WeaponSpeed = GetAttackTime(attType);
        chance = GetPPMProcChance(WeaponSpeed, spellProcEvent->ppmRate);
    }

    // Apply chance modifier aura
    if (Player* modOwner = GetSpellModOwner())
    {
        modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_CHANCE_OF_SUCCESS, chance);
        if (modOwner->HasCheatOption(PLAYER_CHEAT_ALWAYS_PROC))
            return SPELL_PROC_TRIGGER_OK;
    }

    if (roll_chance_f(chance))
        return SPELL_PROC_TRIGGER_OK;

    return SPELL_PROC_TRIGGER_ROLL_FAILED;
}

SpellAuraProcResult Unit::TriggerProccedSpell(Unit* target, int32* basepoints, uint32 triggeredSpellId, Item* castItem, Aura* triggeredByAura, uint32 cooldown, ObjectGuid originalCaster, SpellEntry const* triggeredByParent)
{
    SpellEntry const* triggerEntry = sSpellMgr.GetSpellEntry(triggeredSpellId);

    if (!triggerEntry)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::TriggerProccedSpell: Script has nonexistent triggered spell %u", triggeredSpellId);
        return SPELL_AURA_PROC_FAILED;
    }

    return TriggerProccedSpell(target, basepoints, triggerEntry, castItem, triggeredByAura, cooldown);
}

SpellAuraProcResult Unit::TriggerProccedSpell(Unit* target, int32* basepoints, SpellEntry const* spellInfo, Item* castItem, Aura* triggeredByAura, uint32 cooldown, ObjectGuid originalCaster, SpellEntry const* triggeredByParent)
{
    // default case
    if (!target || (target != this && !target->IsAlive()))
        return SPELL_AURA_PROC_FAILED;

    if (!IsSpellReady(*spellInfo))
        return SPELL_AURA_PROC_FAILED;

    if (basepoints && (basepoints[EFFECT_INDEX_0] || basepoints[EFFECT_INDEX_1] || basepoints[EFFECT_INDEX_2]))
        CastCustomSpell(target, spellInfo,
            basepoints[EFFECT_INDEX_0] ? basepoints[EFFECT_INDEX_0] : 0,
            basepoints[EFFECT_INDEX_1] ? basepoints[EFFECT_INDEX_1] : 0,
            basepoints[EFFECT_INDEX_2] ? basepoints[EFFECT_INDEX_2] : 0,
            true, castItem, triggeredByAura);
    else
        CastSpell(target, spellInfo, true, castItem, triggeredByAura, originalCaster, nullptr, triggeredByParent);

    if (cooldown)
        AddCooldown(*spellInfo, nullptr, false, cooldown);

    return SPELL_AURA_PROC_OK;
}

SpellAuraProcResult Unit::HandleHasteAuraProc(Unit* pVictim, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const* /*procSpell*/, uint32 /*procFlag*/, uint32 procEx, uint32 cooldown)
{
    // Flurry: last charge crit will reapply the buff, don't remove any charges
    if (triggeredByAura->GetSpellProto()->SpellIconID == 108 && 
        triggeredByAura->GetSpellProto()->SpellVisual == 2759 &&
        triggeredByAura->GetHolder()->GetAuraCharges() <= 1 &&
        (procEx & PROC_EX_CRITICAL_HIT))
        return SPELL_AURA_PROC_FAILED;

    return SPELL_AURA_PROC_OK;
}

SpellAuraProcResult Unit::HandleDummyAuraProc(Unit* pVictim, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 procFlag, uint32 procEx, uint32 cooldown)
{
    SpellEntry const* dummySpell = triggeredByAura->GetSpellProto();
    float  triggerAmount = triggeredByAura->GetModifier()->m_amount;

    Item* castItem = triggeredByAura->GetCastItemGuid() && GetTypeId() == TYPEID_PLAYER
                     ? ((Player*)this)->GetItemByGuid(triggeredByAura->GetCastItemGuid()) : nullptr;

    uint32 triggered_spell_id = 0;
    Unit* target = pVictim;
    int32  basepoints[MAX_EFFECT_INDEX] = {0, 0, 0};
    int8 stacks_left = triggeredByAura->GetHolder()->GetAuraCharges();

    switch (dummySpell->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch (dummySpell->Id)
            {
                // Illusion Passive
                case 7131:
                {
                    if (Creature* pCreature = ToCreature())
                        pCreature->DespawnOrUnsummon(1);
                    return SPELL_AURA_PROC_OK;
                }
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
                // Eye for an Eye
                case 9799:
                case 25988:
                {
                    // prevent damage back from weapon special attacks
                    if (!procSpell || procSpell->DmgClass != SPELL_DAMAGE_CLASS_MAGIC)
                        return SPELL_AURA_PROC_FAILED;

                    // return damage % to attacker but < 50% own total health
                    basepoints[0] = dither(triggerAmount * int32(originalAmount) / 100);
                    if (basepoints[0] > (int32)GetMaxHealth() / 2)
                        basepoints[0] = (int32)GetMaxHealth() / 2;

                    triggered_spell_id = 25997;
                    break;
                }
#endif
                // Sweeping Strikes
                case 12292:
                case 18765:
                {
                    if (!pVictim)
                        return SPELL_AURA_PROC_FAILED;

                    // dont trigger from non damaging spells, amount is 1 for non damaging spells if they hit
                    // tested on classic that rend does not trigger sweeping strikes
                    if (amount <= 1)
                        return SPELL_AURA_PROC_FAILED;

                    // Prevent chain of triggered spell from same triggered spell
                    if (procSpell && (procSpell->Id == 26654 || procSpell->Id == 12723))
                        return SPELL_AURA_PROC_FAILED;

                    // Fix range for target selection when proccing SS with whirlwind. Whirlwind doesn't
                    // have a radius set on its prototype, but it is 8 yards.
                    float radius = ATTACK_DISTANCE;
                    if (procSpell && procSpell->Id == 1680)
                        radius = 8.0f;

                    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                    // - Sweeping Strikes will now ignore dead targets, and will ignore PvP
                    //   enabled targets if you are not PvP enabled.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
                    target = SelectRandomUnfriendlyTarget(pVictim, radius, false, true, true);
#else
                    target = SelectRandomUnfriendlyTarget(pVictim, radius, false, true, false);
#endif
                    if (!target)
                        return SPELL_AURA_PROC_OK; //Burn charges when solo target

                    // World of Warcraft Client Patch 1.10.0 (2006-03-28)
                    // - Execute - This ability will now work with Sweeping Strikes again. If
                    //   the second victim is below 20 % health, they will be hit with the full
                    //   Execute amount.If the second victim is not below 20 % health, they
                    //   will be hit with normal melee swing damage.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
                    // Case for Execute. This will only run when procced by Execute
                    if (procSpell && procSpell->Id == 20647)
                    {
                        if (pVictim->GetHealthPercent() <= 20.0f && target->GetHealthPercent() <= 20.0f)  // If Both Target A and target B is less or equal than 20% do full damage
                        {
                            basepoints[0] = ditheru(amount * 100 / CalcArmorReducedDamage(pVictim, 100));
                            triggered_spell_id = 12723; // Note this SS id deals 1 damage by itself (Cannot crit)
                        }
                        else if (pVictim->GetHealthPercent() <= 20.0f)    // If only Target A is less or equal than 20% and target B is over 20% do Basic attack damage
                        {
                            triggered_spell_id = 26654; // This SS deals damage equal to AA also this spell ID can crit ?? Maybe this explains the rumor of SS criting since it only scales with spell crit ? = 5% crit.
                        }
                        else // Full damage on anything else (Shouldn't really ever be used) since execute can only be used less or equal than 20% anyway.
                        {
                            basepoints[0] = ditheru(amount * 100 / CalcArmorReducedDamage(pVictim, 100));
                            triggered_spell_id = 12723; // Note this SS id deals 1 damage by itself (Cannot crit)
                        }
                    }
                    else if (procSpell && procSpell->Id == 1680 && stacks_left > 1) //Whirlwind
                    {   
                        basepoints[0] = ditheru(amount * 100 / CalcArmorReducedDamage(pVictim, 100)); 
                        triggered_spell_id = 12723;                                                   
                        CastSpell(pVictim, 26654, true);                                              
                        triggeredByAura->GetHolder()->DropAuraCharge();
                    }    
                    else // Full damage on anything else
#endif
                    {
                        basepoints[0] = ditheru(amount * 100 / CalcArmorReducedDamage(pVictim, 100));
                        triggered_spell_id = 12723; // Note this SS id deals 1 damage by itself (Cannot crit)
                    }

                    break;
                }
                // Retaliation
                case 20230:
                {
                    // check attack comes not from behind
                    if (!HasInArc(pVictim))
                        return SPELL_AURA_PROC_FAILED;

                    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                    // - Retaliation - Will now cause a maximum of 30 retaliatory strikes in
                    //  15 seconds.In addition, retaliatory strikes will not be possible
                    //  while stunned.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
                    if (HasUnitState(UNIT_STAT_CAN_NOT_REACT))
                        return SPELL_AURA_PROC_FAILED;
#endif

                    triggered_spell_id = 22858;
                    break;
                }
                // Twisted Reflection (boss spell)
                case 21063:
                    triggered_spell_id = 21064;
                    break;
                // Unstable Power
                case 24658:
                {
                    // Need to remove one 24659 aura
                    // It does consume 2 charges on using Holy Nova, confirmed on classic era ptr.
                    RemoveAuraHolderFromStack(24659);
                    return SPELL_AURA_PROC_OK;
                }
                // Restless Strength
                case 24661:
                {
                    // Need remove one 24662 aura
                    RemoveAuraHolderFromStack(24662);
                    return SPELL_AURA_PROC_OK;
                }
                // Viscidus Frost Weakness
                // Disabled for now, handled on Viscidus script
                /*
                case 25926:
                {
                    if (!procSpell)
                        return SPELL_AURA_PROC_FAILED;

                    if (GetSchoolMask(procSpell->School) == SPELL_SCHOOL_MASK_FROST)
                    {
                        ++triggeredByAura->GetModifier()->m_amount;
                        triggerAmount = triggeredByAura->GetModifier()->m_amount;

                        if (triggerAmount == 100)
                            triggered_spell_id = 26034; // Slowed
                        else if (triggerAmount == 150)
                            triggered_spell_id = 26036; // Slowed more
                        else if (triggerAmount == 200)
                            triggered_spell_id = 25937; // Freeze
                    }

                    break;
                }
                */
                // Viscidus Freeze
                case 25937:
                {
                    if (procSpell)
                    {
                        // Wand spell entry marked as physical, we need to add an exception here
                        if (GetSchoolMask(procSpell->School) != SPELL_SCHOOL_MASK_NORMAL || procSpell->Id == 5019)
                            return SPELL_AURA_PROC_FAILED;
                    }

                    ++triggeredByAura->GetModifier()->m_amount;
                    triggerAmount = triggeredByAura->GetModifier()->m_amount;

                    if (triggerAmount == 50)
                        MonsterTextEmote(-1531044, nullptr, true); // Cracks
                    else if (triggerAmount == 100)
                        MonsterTextEmote(-1531045, nullptr, true); // Shatter
                    else if (triggerAmount == 150)
                    {
                        RemoveAurasDueToSpell(25937);
                        triggered_spell_id = 25938; // Explode
                    }

                    break;
                }
                // Adaptive Warding (Frostfire Regalia set)
                case 28764:
                {
                    if (!procSpell)
                        return SPELL_AURA_PROC_FAILED;

                    // find Mage Armor
                    bool found = false;
                    AuraList const& mRegenInterupt = GetAurasByType(SPELL_AURA_MOD_MANA_REGEN_INTERRUPT);
                    for (const auto iter : mRegenInterupt)
                    {
                        if (SpellEntry const* iterSpellProto = iter->GetSpellProto())
                        {
                            if (iterSpellProto->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_MAGE_ARMOR>())
                            {
                                found = true;
                                break;
                            }
                        }
                    }
                    if (!found)
                        return SPELL_AURA_PROC_FAILED;

                    switch (GetFirstSchoolInMask(procSpell->GetSpellSchoolMask()))
                    {
                        case SPELL_SCHOOL_NORMAL:
                        case SPELL_SCHOOL_HOLY:
                            return SPELL_AURA_PROC_FAILED;                   // ignored
                        case SPELL_SCHOOL_FIRE:
                            triggered_spell_id = 28765;
                            break;
                        case SPELL_SCHOOL_NATURE:
                            triggered_spell_id = 28768;
                            break;
                        case SPELL_SCHOOL_FROST:
                            triggered_spell_id = 28766;
                            break;
                        case SPELL_SCHOOL_SHADOW:
                            triggered_spell_id = 28769;
                            break;
                        case SPELL_SCHOOL_ARCANE:
                            triggered_spell_id = 28770;
                            break;
                        default:
                            return SPELL_AURA_PROC_FAILED;
                    }

                    target = this;
                    break;
                }
                // Obsidian Armor (Justice Bearer`s Pauldrons shoulder)
                case 27539:
                {
                    if (!procSpell)
                        return SPELL_AURA_PROC_FAILED;

                    switch (GetFirstSchoolInMask(procSpell->GetSpellSchoolMask()))
                    {
                        case SPELL_SCHOOL_NORMAL:
                            return SPELL_AURA_PROC_FAILED;                   // ignore
                        case SPELL_SCHOOL_HOLY:
                            triggered_spell_id = 27536;
                            break;
                        case SPELL_SCHOOL_FIRE:
                            triggered_spell_id = 27533;
                            break;
                        case SPELL_SCHOOL_NATURE:
                            triggered_spell_id = 27538;
                            break;
                        case SPELL_SCHOOL_FROST:
                            triggered_spell_id = 27534;
                            break;
                        case SPELL_SCHOOL_SHADOW:
                            triggered_spell_id = 27535;
                            break;
                        case SPELL_SCHOOL_ARCANE:
                            triggered_spell_id = 27540;
                            break;
                        default:
                            return SPELL_AURA_PROC_FAILED;
                    }

                    target = this;
                    break;
                }
            }
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            // Magic Absorption
            if (dummySpell->SpellIconID == 459)             // only this spell have SpellIconID == 459 and dummy aura
            {
                if (GetPowerType() != POWER_MANA)
                    return SPELL_AURA_PROC_FAILED;

                // mana reward
                basepoints[0] = dither(triggerAmount * GetMaxPower(POWER_MANA) / 100);
                target = this;
                triggered_spell_id = 29442;
                break;
            }
            // Master of Elements
            if (dummySpell->SpellIconID == 1920)
            {
                if (!procSpell)
                    return SPELL_AURA_PROC_FAILED;

                // mana cost save
                int32 cost = procSpell->manaCost + procSpell->ManaCostPercentage * GetCreateMana() / 100;
                basepoints[0] = dither(cost * triggerAmount / 100);
                if (basepoints[0] <= 0)
                    return SPELL_AURA_PROC_FAILED;

                target = this;
                triggered_spell_id = 29077;
                break;
            }
            switch (dummySpell->Id)
            {
                // Ignite
                case 11119:
                case 11120:
                case 12846:
                case 12847:
                case 12848:
                {
                    uint32 totalDamage = originalAmount;

                    switch (dummySpell->Id)
                    {
                        case 11119:
                            basepoints[0] = int32(0.04f * totalDamage);
                            break;
                        case 11120:
                            basepoints[0] = int32(0.08f * totalDamage);
                            break;
                        case 12846:
                            basepoints[0] = int32(0.12f * totalDamage);
                            break;
                        case 12847:
                            basepoints[0] = int32(0.16f * totalDamage);
                            break;
                        case 12848:
                            basepoints[0] = int32(0.20f * totalDamage);
                            break;
                        default:
                            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleDummyAuraProc: non handled spell id: %u (IG)", dummySpell->Id);
                            return SPELL_AURA_PROC_FAILED;
                    }
                    
                    // Get current Ignite Aura if exist
                    Aura* igniteAura = target->GetAura(12654, EFFECT_INDEX_0);
                    
                    if (igniteAura)
                    {
                        Modifier *igniteModifier = igniteAura->GetModifier();
                        SpellAuraHolder* igniteHolder = igniteAura->GetHolder();
                        
                        int32 tickDamage = igniteModifier->m_amount;
                        
                        bool notAtMaxStack = igniteAura->GetStackAmount() < 5;
                        
                        bool reapplyIgnite = igniteAura->GetAuraTicks() >= igniteAura->GetAuraMaxTicks();
                        
                        if (!reapplyIgnite)
                        {
                            if (notAtMaxStack)
                            {
                                tickDamage += basepoints[0];
                                
                                igniteHolder->ModStackAmount(1);
                                
                                // Update DOT damage
                                igniteModifier->m_amount = tickDamage;
                                igniteAura->ApplyModifier(true, true, false);
                            }
                            else
                                igniteHolder->SetStackAmount(5);
                            
                            // Refresh Ignite Stack
                            igniteHolder->Refresh(igniteAura->GetCaster(), target, igniteHolder);
                            
                            return SPELL_AURA_PROC_OK;
                        }
                        
                        // All damage done, remove and continue to reapply
                        target->RemoveAurasDueToSpell(12654);
                    }
                    
                    // No Ignite found, apply Ignite Aura
                    triggered_spell_id = 12654;
                    break;
                }
                // Combustion
                case 11129:
                {
                    // does not proc if no target is affected (aoe like flamestrike)
                    if (!pVictim)
                        return SPELL_AURA_PROC_FAILED;

                    // combustion counter was dispelled or clicked off
                    if (!HasAura(28682))
                    {
                        RemoveAurasDueToSpell(11129);
                        return SPELL_AURA_PROC_FAILED;
                    }

                    //last charge and crit
                    if (triggeredByAura->GetHolder()->GetAuraCharges() <= 1 && (procEx & PROC_EX_CRITICAL_HIT))
                    {
                        RemoveAurasDueToSpell(28682);       //-> remove Combustion auras
                        return SPELL_AURA_PROC_OK;                        // charge counting (will removed)
                    }

                    CastSpell(this, 28682, true, castItem, triggeredByAura);
                    return (procEx & PROC_EX_CRITICAL_HIT) ? SPELL_AURA_PROC_OK : SPELL_AURA_PROC_FAILED; // charge update only at crit hits, no hidden cooldowns
                }
            }
            break;
        }
        case SPELLFAMILY_WARRIOR:
            break;
        case SPELLFAMILY_WARLOCK:
            break;
        case SPELLFAMILY_PRIEST:
        {
            switch (dummySpell->Id)
            {
                // Vampiric Embrace
                case 15286:
                {
                    if (!pVictim || !pVictim->IsAlive())
                        return SPELL_AURA_PROC_FAILED;

                    // pVictim is caster of aura
                    if (triggeredByAura->GetCasterGuid() != pVictim->GetObjectGuid())
                        return SPELL_AURA_PROC_FAILED;

                    // heal amount
                    basepoints[0] = dither(triggerAmount * amount / 100);

                    // don't heal for 0
                    if (basepoints[0] < 1)
                        basepoints[0] = 1;

                    pVictim->CastCustomSpell(pVictim, 15290, basepoints[0], {}, {}, true, castItem, triggeredByAura);
                    return SPELL_AURA_PROC_OK;                                // no hidden cooldown
                }
                // Oracle Healing Bonus ("Garments of the Oracle" set)
                case 26169:
                {
                    // heal amount
                    basepoints[0] = int32(amount * 0.1f);
                    if (!basepoints[0])
                        return SPELL_AURA_PROC_FAILED;

                    target = this;
                    triggered_spell_id = 26170;
                    break;
                }
                // Greater Heal (Vestments of Faith (Priest Tier 3) - 4 pieces bonus)
                case 28809:
                {
                    triggered_spell_id = 28810;
                    break;
                }
            }
            break;
        }
        case SPELLFAMILY_DRUID:
        {
            switch (dummySpell->Id)
            {
                // Healing Touch (Dreamwalker Raiment set)
                case 28719:
                {
                    // mana back
                    basepoints[0] = int32(procSpell->manaCost * 30 / 100);
                    target = this;
                    triggered_spell_id = 28742;
                    break;
                }
                // Healing Touch Refund (Idol of Longevity trinket)
                case 28847:
                {
                    target = this;
                    triggered_spell_id = 28848;
                    break;
                }
            }
            break;
        }
        case SPELLFAMILY_ROGUE:
        {
            switch (dummySpell->Id)
            {
                // Clean Escape
                case 23582:
                    // triggered spell have same masks and etc with main Vanish spell
                    if (!procSpell || procSpell->Effect[EFFECT_INDEX_0] == SPELL_EFFECT_NONE)
                        return SPELL_AURA_PROC_FAILED;
                    triggered_spell_id = 23583;
                    break;
                    
                // Blade Flurry
                case 13877:
                {
                    if (!pVictim)
                        return SPELL_AURA_PROC_FAILED;

                    // prevent chain of triggered spell from same triggered spell
                    if (procSpell && procSpell->Id == 22482)
                        return SPELL_AURA_PROC_FAILED;

                    target = SelectRandomUnfriendlyTarget(pVictim, 5.0f, false, true);

                    if (!target)
                        return SPELL_AURA_PROC_FAILED;

                     // Reconstitute damage before armor reduction
                    basepoints[0] = ditheru(amount * 100 / CalcArmorReducedDamage(pVictim, 100));

                    triggered_spell_id = 22482;
                    break;
                }
            }
            break;
        }
        case SPELLFAMILY_HUNTER:
            break;
        case SPELLFAMILY_PALADIN:
        {
            // Seal of Righteousness - melee proc dummy
            if ((dummySpell->IsFitToFamilyMask<CF_PALADIN_SEALS>()) && triggeredByAura->GetEffIndex() == EFFECT_INDEX_0)
            {
                if (!pVictim || !pVictim->IsAlive())
                    return SPELL_AURA_PROC_FAILED;

                if (GetTypeId() != TYPEID_PLAYER)
                    return SPELL_AURA_PROC_FAILED;

                uint32 spellId;
                switch (triggeredByAura->GetId())
                {
                    case 20154:
                    case 21084:
                        spellId = 25742;
                        break;     // Rank 1
                    case 20287:
                        spellId = 25740;
                        break;     // Rank 2
                    case 20288:
                        spellId = 25739;
                        break;     // Rank 3
                    case 20289:
                        spellId = 25738;
                        break;     // Rank 4
                    case 20290:
                        spellId = 25737;
                        break;     // Rank 5
                    case 20291:
                        spellId = 25736;
                        break;     // Rank 6
                    case 20292:
                        spellId = 25735;
                        break;     // Rank 7
                    case 20293:
                        spellId = 25713;
                        break;     // Rank 8
                    default:
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleDummyAuraProc: non handled possibly SoR (Id = %u)", triggeredByAura->GetId());
                        return SPELL_AURA_PROC_FAILED;
                }
                float MAX_WSP = 4.0f;
                float MIN_WSP = 1.5f;

                Item *item = ((Player*)this)->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                float speed = (item ? item->GetProto()->Delay : BASE_ATTACK_TIME) / 1000.0f;

                float minDmg = triggerAmount / 87.0f;
                float maxDmg = triggerAmount / 25.0f;

                float damageBasePoints = (maxDmg - minDmg) * ((speed - MIN_WSP) / (MAX_WSP - MIN_WSP)) + minDmg;

                // Apply Improved Seal of Rightousness talent
                // Modifier is applied on base damage only (changed patch 2.1.0)
                uint32 impSoRList[] = { 20224, 20225, 20330, 20331, 20332 };
                for (uint32 i : impSoRList) {
                    SpellModifier *mod = ((Player*)this)->GetSpellMod(SPELLMOD_ALL_EFFECTS, i);
                    if (mod && mod->type == SPELLMOD_PCT && mod->value > 0)
                        damageBasePoints += damageBasePoints*(float)mod->value / 100.0f;
                }

                float damagePoint = damageBasePoints;

                // apply damage bonuses manually
                if (damagePoint >= 0)
                {
                    damagePoint = SpellDamageBonusDone(pVictim, dummySpell, EFFECT_INDEX_0, damagePoint, SPELL_DIRECT_DAMAGE);
                    damagePoint = pVictim->SpellDamageBonusTaken(this, dummySpell, EFFECT_INDEX_0, damagePoint, SPELL_DIRECT_DAMAGE);
                }

                CastCustomSpell(pVictim, spellId, dither(damagePoint), {}, {}, true, nullptr, triggeredByAura);
                // Seal of Righteousness can proc weapon enchants. mechanic removed in 2.1.0
                ((Player*)this)->CastItemCombatSpell(pVictim, BASE_ATTACK);
                return SPELL_AURA_PROC_OK;                                // no hidden cooldown
            }

            switch (dummySpell->Id)
            {
                // Holy Power (Redemption Armor set)
                case 28789:
                {
                    if (!pVictim)
                        return SPELL_AURA_PROC_FAILED;

                    // Set class defined buff
                    switch (pVictim->GetClass())
                    {
                        case CLASS_PALADIN:
                        case CLASS_PRIEST:
                        case CLASS_SHAMAN:
                        case CLASS_DRUID:
                            triggered_spell_id = 28795;     // Increases the friendly target's mana regeneration by $s1 per 5 sec. for $d.
                            break;
                        case CLASS_MAGE:
                        case CLASS_WARLOCK:
                            triggered_spell_id = 28793;     // Increases the friendly target's spell damage and healing by up to $s1 for $d.
                            break;
                        case CLASS_HUNTER:
                        case CLASS_ROGUE:
                            triggered_spell_id = 28791;     // Increases the friendly target's attack power by $s1 for $d.
                            break;
                        case CLASS_WARRIOR:
                            triggered_spell_id = 28790;     // Increases the friendly target's armor
                            break;
                        default:
                            return SPELL_AURA_PROC_FAILED;
                    }
                    break;
                }
            }
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            switch (dummySpell->Id)
            {
                // Totemic Power (The Earthshatterer set)
                case 28823:
                {
                    if (!pVictim)
                        return SPELL_AURA_PROC_FAILED;

                    // Set class defined buff
                    switch (pVictim->GetClass())
                    {
                        case CLASS_PALADIN:
                        case CLASS_PRIEST:
                        case CLASS_SHAMAN:
                        case CLASS_DRUID:
                            triggered_spell_id = 28824;     // Increases the friendly target's mana regeneration by $s1 per 5 sec. for $d.
                            break;
                        case CLASS_MAGE:
                        case CLASS_WARLOCK:
                            triggered_spell_id = 28825;     // Increases the friendly target's spell damage and healing by up to $s1 for $d.
                            break;
                        case CLASS_HUNTER:
                        case CLASS_ROGUE:
                            triggered_spell_id = 28826;     // Increases the friendly target's attack power by $s1 for $d.
                            break;
                        case CLASS_WARRIOR:
                            triggered_spell_id = 28827;     // Increases the friendly target's armor
                            break;
                        default:
                            return SPELL_AURA_PROC_FAILED;
                    }
                    break;
                }
                // Lesser Healing Wave (Totem of Flowing Water Relic)
                case 28849:
                {
                    target = this;
                    triggered_spell_id = 28850;
                    break;
                }
            }
            break;
        }
        default:
            break;
    }

    // processed charge only counting case
    if (!triggered_spell_id)
        return SPELL_AURA_PROC_OK;

    return TriggerProccedSpell(target, basepoints, triggered_spell_id, castItem, triggeredByAura, cooldown);
}

SpellAuraProcResult Unit::HandleProcTriggerSpellAuraProc(Unit* pVictim, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 procFlags, uint32 procEx, uint32 cooldown)
{
    // Get triggered aura spell info
    SpellEntry const* auraSpellInfo = triggeredByAura->GetSpellProto();

    // Basepoints of trigger aura
    float triggerAmount = triggeredByAura->GetModifier()->m_amount;

    // Set trigger spell id, target, custom basepoints
    uint32 trigger_spell_id = auraSpellInfo->EffectTriggerSpell[triggeredByAura->GetEffIndex()];
    Unit*  target = nullptr;
    int32  basepoints[MAX_EFFECT_INDEX] = {0, 0, 0};

    Item* castItem = triggeredByAura->GetCastItemGuid() && GetTypeId() == TYPEID_PLAYER
                     ? ((Player*)this)->GetItemByGuid(triggeredByAura->GetCastItemGuid()) : nullptr;

    // Try handle unknown trigger spells
    // Custom requirements (not listed in procEx) Warning! damage dealing after this
    // Custom triggered spells
    switch (auraSpellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
            switch (auraSpellInfo->Id)
            {
                //case 5301:  break;                        // Defensive State (DND)
                //case 7137:  break;                        // Shadow Charge (Rank 1)
                //case 7377:  break;                        // Take Immune Periodic Damage <Not Working>
                //case 13358: break;                        // Defensive State (DND)
                //case 16092: break;                        // Defensive State (DND)
                //case 18943: break;                        // Double Attack
                //case 19194: break;                        // Double Attack
                //case 19817: break;                        // Double Attack
                //case 19818: break;                        // Double Attack
                //case 22835: break;                        // Drunken Rage
                //    trigger_spell_id = 14822; break;
                case 23780:                                 // Aegis of Preservation (Aegis of Preservation trinket)
                    trigger_spell_id = 23781;
                    break;
                //case 24949: break;                        // Defensive State 2 (DND)
                case 27522:                                 // Mana Drain Trigger
                {
                    // On successful melee or ranged attack gain $29471s1 mana and if possible drain $27526s1 mana from the target.
                    if (IsAlive())
                        CastSpell(this, 29471, true, castItem, triggeredByAura);
                    if (pVictim && pVictim->IsAlive())
                        CastSpell(pVictim, 27526, true, castItem, triggeredByAura);
                    return SPELL_AURA_PROC_OK;
                }
                case 31255:                                 // Deadly Swiftness (Rank 1)
                {
                    // whenever you deal damage to a target who is below 20% health.
                    //if (pVictim->GetHealth() > pVictim->GetMaxHealth() / 5)
                        //return SPELL_AURA_PROC_FAILED;

                    target = this;
                    trigger_spell_id = 22588;
                    break;
                }
                case 28200:                                 // Talisman of Ascendance
                {
                    if (procSpell && (procSpell->IsAreaOfEffectSpell() || procSpell->Effect[0] == SPELL_EFFECT_SCRIPT_EFFECT))
                        return SPELL_AURA_PROC_FAILED;
                    break;
                }
            }
            break;
        case SPELLFAMILY_MAGE:
            if (auraSpellInfo->Id == 26467)                 // Persistent Shield (Scarab Brooch trinket)
            {
                // This spell originally trigger 13567 - Dummy Trigger (vs dummy effect)
                basepoints[0] = amount * 15 / 100;
                target = pVictim;
                trigger_spell_id = 26470;
            }
            break;
        case SPELLFAMILY_WARRIOR:
            break;
        case SPELLFAMILY_WARLOCK:
        {
            // Pyroclasm
            if (auraSpellInfo->SpellIconID == 1137)
            {
                if (!pVictim || !pVictim->IsAlive() || pVictim == this || procSpell == nullptr)
                    return SPELL_AURA_PROC_FAILED;
                // Calculate spell tick count for spells
                uint32 tick = 1; // Default tick = 1

                if (procSpell->SpellIconID == 184 && procSpell->SpellVisual == 2253)
                    tick = 1; // Feu de l'ame
                // Hellfire have 15 tick
                else if (procSpell->IsFitToFamilyMask<CF_WARLOCK_HELLFIRE>())
                    tick = 15;
                // Rain of Fire have 4 tick
                else if (procSpell->IsFitToFamilyMask<CF_WARLOCK_RAIN_OF_FIRE>())
                    tick = 4;
                else
                    return SPELL_AURA_PROC_FAILED;

                // Calculate chance = baseChance / tick
                float chance = 0;
                switch (auraSpellInfo->Id)
                {
                    case 18096: // Rank 1
                        chance = 13.0f / tick;
                        break;
                    case 18073: // Rank 2
                        chance = 26.0f / tick;
                        break;
                }

                // Roll chance
                if (!roll_chance_f(chance))
                    return SPELL_AURA_PROC_FAILED;

                trigger_spell_id = 18093;
            }
            // Cheat Death
            else if (auraSpellInfo->Id == 28845)
            {
                // When your health drops below 20% ....
                int32 health20 = int32(GetMaxHealth()) / 5;
                if (int32(GetHealth()) - int32(amount) >= health20 || int32(GetHealth()) < health20)
                    return SPELL_AURA_PROC_FAILED;
            }
            // Consequences ne proc pas sur soi-meme (Flammes infernales)
            else if (auraSpellInfo->SpellIconID == 11)
            {
                if (pVictim == this)
                    return SPELL_AURA_PROC_FAILED;
            }
            break;
        }
        case SPELLFAMILY_PRIEST:
        {
            // Shadowguard
            if (auraSpellInfo->SpellIconID == 19)
            {
                switch (auraSpellInfo->Id)
                {
                    case 18137:
                        trigger_spell_id = 28377;
                        break;   // Rank 1
                    case 19308:
                        trigger_spell_id = 28378;
                        break;   // Rank 2
                    case 19309:
                        trigger_spell_id = 28379;
                        break;   // Rank 3
                    case 19310:
                        trigger_spell_id = 28380;
                        break;   // Rank 4
                    case 19311:
                        trigger_spell_id = 28381;
                        break;   // Rank 5
                    case 19312:
                        trigger_spell_id = 28382;
                        break;   // Rank 6
                    default:
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleProcTriggerSpell: Spell %u not handled in SG", auraSpellInfo->Id);
                        return SPELL_AURA_PROC_FAILED;
                }
            }
            // Blessed Recovery
            else if (auraSpellInfo->SpellIconID == 1875)
            {
                switch (auraSpellInfo->Id)
                {
                    case 27811:
                        trigger_spell_id = 27813;
                        break;
                    case 27815:
                        trigger_spell_id = 27817;
                        break;
                    case 27816:
                        trigger_spell_id = 27818;
                        break;
                    default:
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleProcTriggerSpell: Spell %u not handled in BR", auraSpellInfo->Id);
                        return SPELL_AURA_PROC_FAILED;
                }
                basepoints[0] = dither(amount * triggerAmount / 100 / 3);
                target = this;
            }
            break;
        }
        case SPELLFAMILY_DRUID:
            break;
        case SPELLFAMILY_HUNTER:
        {
            switch (auraSpellInfo->Id)
            {
                case 5118: // Aspect of the Cheetah
                case 13159: // Aspect of the Pack
                {
                    // dont trigger from non damaging spells, amount is 1 for non damaging spells if they hit
                    if (amount <= 1)
                        return SPELL_AURA_PROC_FAILED;

                    break;
                }
            }
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
            // Seal of Righteousness - melee proc dummy
            if (auraSpellInfo->IsFitToFamilyMask<CF_PALADIN_SEALS>())
            {
                if (!pVictim || !pVictim->IsAlive())
                    return SPELL_AURA_PROC_FAILED;

                if (GetTypeId() != TYPEID_PLAYER)
                    return SPELL_AURA_PROC_FAILED;

                uint32 spellId = 0;
                switch (auraSpellInfo->Id)
                {
                    case 21084:
                        spellId = 25742;
                        break; // Rank 1
                    case 20287:
                        spellId = 25740;
                        break; // Rank 2
                    case 20288:
                        spellId = 25739;
                        break; // Rank 3
                    case 20289:
                        spellId = 25738;
                        break; // Rank 4
                    case 20290:
                        spellId = 25737;
                        break; // Rank 5
                    case 20291:
                        spellId = 25736;
                        break; // Rank 6
                    case 20292:
                        spellId = 25735;
                        break; // Rank 7
                    case 20293:
                        spellId = 25713;
                        break; // Rank 8
                }
                if (spellId)
                {
                    float MAX_WSP = 4.0f;
                    float MIN_WSP = 1.5f;

                    Item *item = static_cast<Player*>(this)->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                    float speed = (item ? item->GetProto()->Delay : BASE_ATTACK_TIME) / 1000.0f;

                    float minDmg = triggerAmount / 87.0f;
                    float maxDmg = triggerAmount / 25.0f;

                    float damageBasePoints = (maxDmg - minDmg) * ((speed - MIN_WSP) / (MAX_WSP - MIN_WSP)) + minDmg;

                    // Apply Improved Seal of Rightousness talent
                    // Modifier is applied on base damage only (changed patch 2.1.0)
                    uint32 impSoRList[] = { 20224, 20225, 20330, 20331, 20332 };
                    for (int i = 0; i < 5; ++i) {
                        SpellModifier *mod = static_cast<Player*>(this)->GetSpellMod(SPELLMOD_ALL_EFFECTS, impSoRList[i]);
                        if (mod && mod->type == SPELLMOD_PCT && mod->value > 0)
                            damageBasePoints += damageBasePoints*(float)mod->value / 100.0f;
                    }

                    float damagePoint = damageBasePoints;

                    // apply damage bonuses manually
                    if (damagePoint >= 0)
                    {
                        damagePoint = SpellDamageBonusDone(pVictim, auraSpellInfo, triggeredByAura->GetEffIndex(), damagePoint, SPELL_DIRECT_DAMAGE);
                        damagePoint = pVictim->SpellDamageBonusTaken(this, auraSpellInfo, triggeredByAura->GetEffIndex(), damagePoint, SPELL_DIRECT_DAMAGE);
                    }

                    CastCustomSpell(pVictim, spellId, dither(damagePoint), {}, {}, true, nullptr, triggeredByAura);
                    // Seal of Righteousness can proc weapon enchants. mechanic removed in 2.1.0
                    static_cast<Player*>(this)->CastItemCombatSpell(pVictim, BASE_ATTACK);
                    return SPELL_AURA_PROC_OK;                                // no hidden cooldown
                }
            }
#endif
            // Judgement of Light and Judgement of Wisdom
            if (auraSpellInfo->IsFitToFamilyMask<CF_PALADIN_JUDGEMENT_OF_WISDOM_LIGHT>())
            {
                switch (auraSpellInfo->Id)
                {
                    // Judgement of Light
                    case 20185:
                        trigger_spell_id = 20267;
                        break; // Rank 1
                    case 20344:
                        trigger_spell_id = 20341;
                        break; // Rank 2
                    case 20345:
                        trigger_spell_id = 20342;
                        break; // Rank 3
                    case 20346:
                        trigger_spell_id = 20343;
                        break; // Rank 4
                    // Judgement of Wisdom
                    case 20186:
                        trigger_spell_id = 20268;
                        break; // Rank 1
                    case 20354:
                        trigger_spell_id = 20352;
                        break; // Rank 2
                    case 20355:
                        trigger_spell_id = 20353;
                        break; // Rank 3
                    default:
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleProcTriggerSpell: Spell %u miss posibly Judgement of Light/Wisdom", auraSpellInfo->Id);
                        return SPELL_AURA_PROC_FAILED;
                }

                // Need to pass victim guid so its not overwritten with aura caster.
                // Intentionally do not pass triggeredByAura here.
                // Seal of Light healing is done by the person who attacks,
                // and does not increase threat of the original caster.
                pVictim->CastSpell(pVictim, trigger_spell_id, true, castItem, triggeredByAura, pVictim->GetObjectGuid());
                return SPELL_AURA_PROC_OK;                        // no hidden cooldown
            }
            // Illumination
            else if (auraSpellInfo->SpellIconID == 241)
            {
                if (!procSpell)
                    return SPELL_AURA_PROC_FAILED;

                Player* pPlayer = ToPlayer();
                if (!pPlayer)
                    return SPELL_AURA_PROC_FAILED;

                // procspell is triggered spell but we need mana cost of original casted spell
                SpellEntry const* originalSpell = procSpell;

                // Holy Shock
                if (procSpell->IsFitToFamilyMask<CF_PALADIN_HOLY_SHOCK>())
                {
                    uint32 originalSpellId;
                    switch (procSpell->Id)
                    {
                        case 25914: originalSpellId = 20473; break;
                        case 25913: originalSpellId = 20929; break;
                        case 25903: originalSpellId = 20930; break;
                        default:
                            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleProcTriggerSpell: Spell %u not handled in HShock", procSpell->Id);
                            return SPELL_AURA_PROC_FAILED;
                    }
                    originalSpell = sSpellMgr.GetSpellEntry(originalSpellId);
                }

                basepoints[0] = originalSpell->manaCost;
                trigger_spell_id = 20272;
                target = this;
                break;
            }
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            // Lightning Shield (overwrite non existing triggered spell call in spell.dbc
            if (auraSpellInfo->IsFitToFamilyMask<CF_SHAMAN_LIGHTNING_SHIELD>() && auraSpellInfo->SpellVisual == 37)
            {
                switch (auraSpellInfo->Id)
                {
                    case 324:                               // Rank 1
                        trigger_spell_id = 26364;
                        break;
                    case 325:                               // Rank 2
                        trigger_spell_id = 26365;
                        break;
                    case 905:                               // Rank 3
                        trigger_spell_id = 26366;
                        break;
                    case 945:                               // Rank 4
                        trigger_spell_id = 26367;
                        break;
                    case 8134:                              // Rank 5
                        trigger_spell_id = 26369;
                        break;
                    case 10431:                             // Rank 6
                        trigger_spell_id = 26370;
                        break;
                    case 10432:                             // Rank 7
                        trigger_spell_id = 26363;
                        break;
                    default:
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleProcTriggerSpell: Spell %u not handled in LShield", auraSpellInfo->Id);
                        return SPELL_AURA_PROC_FAILED;
                }
            }
            // Lightning Shield (The Ten Storms set)
            else if (auraSpellInfo->Id == 23551)
            {
                trigger_spell_id = 23552;
                target = pVictim;
            }
            // Damage from Lightning Shield (The Ten Storms set)
            else if (auraSpellInfo->Id == 23552)
                trigger_spell_id = 27635;
            // Mana Surge (The Earthfury set)
            else if (auraSpellInfo->Id == 23572)
            {
                if (!procSpell)
                    return SPELL_AURA_PROC_FAILED;
                basepoints[0] = procSpell->manaCost * 35 / 100;
                trigger_spell_id = 23571;
                target = this;
            }
            break;
        }
        default:
            break;
    }

    // All ok. Check current trigger spell
    SpellEntry const* triggerEntry = sSpellMgr.GetSpellEntry(trigger_spell_id);
    if (!triggerEntry)
    {
        // Not cast unknown spell
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandleProcTriggerSpell: Spell %u have %u in EffectTriggered[%d], not handled custom case?", auraSpellInfo->Id, trigger_spell_id, triggeredByAura->GetEffIndex());
        return SPELL_AURA_PROC_FAILED;
    }

    // not allow proc extra attack spell at extra attack
    if (m_extraAttacks && triggerEntry->HasEffect(SPELL_EFFECT_ADD_EXTRA_ATTACKS) && triggerEntry->Id != 20178)
        return SPELL_AURA_PROC_FAILED;

    // Custom basepoints/target for exist spell
    // dummy basepoints or other customs
    switch (trigger_spell_id)
    {
        // Cast positive spell on enemy target
        case 7099:  // Curse of Mending
        case 20233: // Improved Lay on Hands (cast on target)
        {
            target = pVictim;
            break;
        }
        // Combo points add triggers (need add combopoint only for main target, and after possible combopoints reset)
        case 15250: // Rogue Setup
        {
            if (!pVictim || pVictim != GetVictim())  // applied only for main target
                return SPELL_AURA_PROC_FAILED;
            break;                                   // continue normal case
        }
        // Finishing moves that add combo points
        case 14189: // Seal Fate (Netherblade set)
        case 14157: // Ruthlessness
        {
            // Need add combopoint AFTER finishing move (or they get dropped in finish phase)
            if (!sWorld.getConfig(CONFIG_UINT32_SPELL_PROC_DELAY))
            {
                if (Spell* spell = GetCurrentSpell(CURRENT_GENERIC_SPELL))
                {
                    spell->AddTriggeredSpell(trigger_spell_id);
                    return SPELL_AURA_PROC_OK;
                }
                return SPELL_AURA_PROC_FAILED;
            }
            break;
        }
    }

    // try detect target manually if not set
    if (target == nullptr)
        target = !(procFlags & PROC_FLAG_DEAL_HELPFUL_SPELL) && Spells::IsPositiveSpell(trigger_spell_id) ? this : pVictim;

    return TriggerProccedSpell(target, basepoints, triggerEntry, castItem, triggeredByAura, cooldown, GetObjectGuid(), procSpell);
}

SpellAuraProcResult Unit::HandleProcTriggerDamageAuraProc(Unit* pVictim, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 procFlags, uint32 procEx, uint32 cooldown)
{
    SpellEntry const* spellInfo = triggeredByAura->GetSpellProto();
    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "ProcDamageAndSpell: doing %u damage from spell id %u (triggered by auratype %u of spell %u)",
                     triggeredByAura->GetModifier()->m_amount, spellInfo->Id, triggeredByAura->GetModifier()->m_auraname, triggeredByAura->GetId());
    
    if (!pVictim || !pVictim->IsAlive())
        return SPELL_AURA_PROC_FAILED;

    // Trigger damage can be resisted...
    if (SpellMissInfo missInfo = SpellHitResult(pVictim, spellInfo, triggeredByAura->GetEffIndex(), false))
    {
        SendSpellDamageResist(pVictim, spellInfo->Id);
        return SPELL_AURA_PROC_OK;
    }

    // World of Warcraft Client Patch 1.9.0 (2006-01-03)
    // - Seal of Righteousness - Now does holy damage on every swing.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
    if (spellInfo->IsFitToFamilyMask<CF_PALADIN_SEALS>())
    {
        switch (spellInfo->Id)
        {
            case 21084: // Rank 1
            case 20287: // Rank 2
            case 20288: // Rank 3
            case 20289: // Rank 4
            case 20290: // Rank 5
            case 20291: // Rank 6
            case 20292: // Rank 7
            case 20293: // Rank 8
            {
                if (!roll_chance_i(75)) // made up value
                    return SPELL_AURA_PROC_FAILED;
            }
            break; 
        }
    }
#endif

    SpellNonMeleeDamage damageInfo(this, pVictim, spellInfo->Id, SpellSchools(spellInfo->School));
    float fdamage = CalculateSpellEffectValue(pVictim, spellInfo, triggeredByAura->GetEffIndex());
    fdamage = SpellDamageBonusDone(pVictim, spellInfo, triggeredByAura->GetEffIndex(), fdamage, SPELL_DIRECT_DAMAGE);
    fdamage = pVictim->SpellDamageBonusTaken(this, spellInfo, triggeredByAura->GetEffIndex(), fdamage, SPELL_DIRECT_DAMAGE);
    damageInfo.damage = ditheru(fdamage);
    damageInfo.target->CalculateAbsorbResistBlock(this, &damageInfo, spellInfo);
    DealDamageMods(damageInfo.target, damageInfo.damage, &damageInfo.absorb);
    SendSpellNonMeleeDamageLog(&damageInfo);
    DealSpellDamage(&damageInfo, true);
    return SPELL_AURA_PROC_OK;
}

SpellAuraProcResult Unit::HandleOverrideClassScriptAuraProc(Unit* pVictim, uint32 /*amount*/, uint32 /*originalAmount*/, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 /*procFlag*/, uint32 /*procEx*/ , uint32 cooldown)
{
    int32 scriptId = triggeredByAura->GetModifier()->m_miscvalue;

    if (!pVictim || !pVictim->IsAlive())
        return SPELL_AURA_PROC_FAILED;

    Item* castItem = triggeredByAura->GetCastItemGuid() && GetTypeId() == TYPEID_PLAYER
                     ? ((Player*)this)->GetItemByGuid(triggeredByAura->GetCastItemGuid()) : nullptr;

    // Basepoints of trigger aura
    float triggerAmount = triggeredByAura->GetModifier()->m_amount;

    uint32 triggered_spell_id = 0;

    switch (scriptId)
    {
        case 4309: // Crepuscule
        {
            triggered_spell_id = 17941;
            break;
        }
        case 836:                                           // Improved Blizzard (Rank 1)
        {
            if (!procSpell || procSpell->SpellVisual != 259)
                return SPELL_AURA_PROC_FAILED;
            triggered_spell_id = 12484;
            break;
        }
        case 988:                                           // Improved Blizzard (Rank 2)
        {
            if (!procSpell || procSpell->SpellVisual != 259)
                return SPELL_AURA_PROC_FAILED;
            triggered_spell_id = 12485;
            break;
        }
        case 989:                                           // Improved Blizzard (Rank 3)
        {
            if (!procSpell || procSpell->SpellVisual != 259)
                return SPELL_AURA_PROC_FAILED;
            triggered_spell_id = 12486;
            break;
        }
        case 4086:                                          // Improved Mend Pet (Rank 1)
        case 4087:                                          // Improved Mend Pet (Rank 2)
        {
            if (!roll_chance_i(triggerAmount))
                return SPELL_AURA_PROC_FAILED;

            triggered_spell_id = 24406;
            break;
        }
        case 3656: // Corrupted Healing
        {
            // only proc on direct healing
            if (procSpell->HasEffect(SPELL_EFFECT_HEAL))
                triggered_spell_id = 23402;
            break;
        }
        case 4533: // Druid T3 Bonus: 28716 (50% chance)
        {
            if (procSpell->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_REJUVENATION>())
            {
                switch (pVictim->GetPowerType())
                {
                case POWER_MANA:
                    triggered_spell_id = 28722;
                    break;
                case POWER_RAGE:
                    triggered_spell_id = 28723;
                    break;
                case POWER_ENERGY:
                    triggered_spell_id = 28724;
                    break;
                }
            }
            break;
        }
        case 4537: // Druid T3 Bonus: 28744
        {
            if (procSpell->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_REGROWTH>())
                triggered_spell_id = 28750;

            break;
        }
    }

    // not processed
    if (!triggered_spell_id)
        return SPELL_AURA_PROC_OK;

    return TriggerProccedSpell(pVictim, nullptr, triggered_spell_id, castItem, triggeredByAura, cooldown);
}

SpellAuraProcResult Unit::HandleModCastingSpeedNotStackAuraProc(Unit* /*pVictim*/, uint32 /*amount*/, uint32 /*originalAmount*/, Aura* /*triggeredByAura*/, SpellEntry const* procSpell, uint32 /*procFlag*/, uint32 /*procEx*/, uint32 /*cooldown*/)
{
    // Skip melee hits or instant cast spells
    return !(procSpell == nullptr || procSpell->GetCastTime(this) == 0) ? SPELL_AURA_PROC_OK : SPELL_AURA_PROC_FAILED;
}

SpellAuraProcResult Unit::HandleReflectSpellsSchoolAuraProc(Unit* /*pVictim*/, uint32 /*amount*/, uint32 /*originalAmount*/, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 /*procFlag*/, uint32 /*procEx*/, uint32 /*cooldown*/)
{
    // Skip Melee hits and spells ws wrong school
    return !(procSpell == nullptr || (triggeredByAura->GetModifier()->m_miscvalue & GetSchoolMask(procSpell->School)) == 0) ? SPELL_AURA_PROC_OK : SPELL_AURA_PROC_FAILED;
}

SpellAuraProcResult Unit::HandleModPowerCostSchoolAuraProc(Unit* /*pVictim*/, uint32 /*amount*/, uint32 /*originalAmount*/, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 /*procFlag*/, uint32 /*procEx*/, uint32 /*cooldown*/)
{
    // Skip melee hits and spells ws wrong school or zero cost
    return !(procSpell == nullptr ||
             (procSpell->manaCost == 0 && procSpell->ManaCostPercentage == 0) ||           // Cost check
             (triggeredByAura->GetModifier()->m_miscvalue & GetSchoolMask(procSpell->School)) == 0) ? SPELL_AURA_PROC_OK : SPELL_AURA_PROC_FAILED;  // School check
}

SpellAuraProcResult Unit::HandleMechanicImmuneResistanceAuraProc(Unit* /*pVictim*/, uint32 /*amount*/, uint32 /*originalAmount*/, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 /*procFlag*/, uint32 /*procEx*/, uint32 /*cooldown*/)
{
    // Compare mechanic
    return !(procSpell == nullptr || procSpell->Mechanic != triggeredByAura->GetModifier()->m_miscvalue)
           ? SPELL_AURA_PROC_OK : SPELL_AURA_PROC_FAILED;
}

// Nostalrius
SpellAuraProcResult Unit::HandleAddTargetTriggerAuraProc(Unit* pVictim, uint32 /*amount*/, uint32 /*originalAmount*/, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 /*procFlag*/, uint32 /*procEx*/ , uint32 cooldown)
{
    SpellEntry const* aurEntry = triggeredByAura->GetSpellProto();
    uint32 trigger_spell_id = aurEntry->EffectTriggerSpell[0];
    float chance = 0.0f;

    if (aurEntry->EffectBasePoints[0] != -1)
        chance = aurEntry->EffectBasePoints[0];
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Spell %u has chance = -1 but not handled in core ...", aurEntry->Id);

    // Si il y a plusieurs ticks ...
    // Blizzard - 8 ticks (fix procs abuses de morsure de givre)
    if (aurEntry->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_BLIZZARD>())
        chance /= 8;

    // Chance = -1 -> A calculer manuellement
    if (!roll_chance_f(chance))
        return SPELL_AURA_PROC_FAILED;

    if (trigger_spell_id)
    {
        bool bTarget = true;
        switch (aurEntry->Id)
        {
            case 17768: // Casque tete de loup
            case 24392: // Gelee soudaine
            case 14179: // Frappes implacables
                bTarget = false;
                break;
        }

        if (bTarget)
        {
            // Cone de glace
            if (pVictim->GetGUID() == GetGUID())
                return SPELL_AURA_PROC_FAILED;
            pVictim->CastSpell(pVictim, trigger_spell_id, true, nullptr, triggeredByAura);
        }
        else
            CastSpell(this, trigger_spell_id, true, nullptr, triggeredByAura);
    }
    return SPELL_AURA_PROC_OK;
}

SpellAuraProcResult Unit::HandleModResistanceAuraProc(Unit* /*pVictim*/, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const* /*procSpell*/, uint32 /*procFlag*/, uint32 /*procEx*/, uint32 /*cooldown*/)
{
    SpellEntry const* spellInfo = triggeredByAura->GetSpellProto();

    // Inner Fire
    if (spellInfo->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_INNER_FIRE>())
    {
        // only at real damage
        if (!amount)
            return SPELL_AURA_PROC_FAILED;
    }

    return SPELL_AURA_PROC_OK;
}

SpellAuraProcResult Unit::HandleModDamageAuraProc(Unit* /*pVictim*/, uint32 /*amount*/, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const* procSpell, uint32 /*procFlag*/, uint32 /*procEx*/, uint32 /*cooldown*/)
{
    // the aura school mask must match the spell school
    uint32 const schoolMask = procSpell ? GetSchoolMask(procSpell->School) : SPELL_SCHOOL_MASK_NORMAL;
    if (!(schoolMask & triggeredByAura->GetModifier()->m_miscvalue))
        return SPELL_AURA_PROC_FAILED;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    switch (triggeredByAura->GetId())
    {
        case 24659: // Zandalarian Hero Charm - Unstable Power
        {
            if (!procSpell)
                return SPELL_AURA_PROC_FAILED;

            /*
            World of Warcraft Client Patch 1.11.0 (2006-06-20)
            - Judgement of Command: Now consumes a charge of the Zandalarian Hero 
              Charm. In addition, when this spell is resisted it will no longer 
              erroneously still do damage.
            - Judgement of Righteousness: Now consumes a charge of the Zandalarian 
              Hero Charm.
            - Shadowguard: This Troll Priest racial spell now works with Vampiric 
              Embrace, Blackout, and Shadow Weaving. In addition, the damage from 
              Shadowguard will now consume charges of the Zandalarian Hero Charm's 
              Unstable Power aura.
            - Zandalarian Hero Charm: The damage and healing on this item have been
              reduced by 30%. Instead of granting 35 damage and 70 healing per 
              charge, it now grants 25 damage and 50 healing per charge. Several 
              Paladin spells, Starshards, and Lightning Shield were not consuming 
              charges of this trinket. All those spells have been fixed. In 
              addition, totems which now benefit from increased damage and healing 
              will also consume charges (Healing Stream Totem, Searing Totem, Magma 
              Totem, and Fire Nova Totem)
            World of Warcraft Client Patch 1.10.0 (2006-03-28)
            - The charges from the Zandalarian Hero Charm will now be consumed by
              melee and ranged abilities and spells which do non-physical damage.
              This includes: Hammer of Wrath, Judgement of Righteousness, Seal of
              Command, Judgement of Command, Volley, and Arcane Shot. The trinket
              will also now burn charges from each casting of a damage over time
              spell, heal over time spell, and area aura spells such as Blizzard
              and Consecration. Only one charge will be burned per area spell cast,
              rather than multiple charges per target hit as was previously the
              case.
            */
            if (!procSpell->IsDirectDamageSpell() &&
                !procSpell->IsHealSpell() &&
                !procSpell->HasAura(SPELL_AURA_PERIODIC_DAMAGE) &&
                !procSpell->HasAura(SPELL_AURA_PERIODIC_LEECH) &&
                !procSpell->HasAura(SPELL_AURA_PERIODIC_HEALTH_FUNNEL) &&
                !(procSpell->SpellVisual == 319 && procSpell->SpellIconID == 1647) && // Healing Stream Totem
                !(procSpell->SpellVisual == 221 && procSpell->SpellIconID == 680) &&  // Searing Totem
                !(procSpell->SpellVisual == 369 && procSpell->SpellIconID == 37) &&   // Magma Totem
                !(procSpell->SpellVisual == 221 && procSpell->SpellIconID == 33)      // Fire Nova Totem
                )
                return SPELL_AURA_PROC_FAILED;

            RemoveAuraHolderFromStack(24659);
            return SPELL_AURA_PROC_OK;
        }
    }
#endif

    return SPELL_AURA_PROC_OK;
}

SpellAuraProcResult Unit::HandleRemoveByDamageChanceProc(Unit* pVictim, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const *procSpell, uint32 procFlag, uint32 procEx, uint32 cooldown)
{
    // The chance to dispel an aura depends on the damage taken with respect to the casters level.
    uint32 max_dmg = GetLevel() > 8 ? 25 * GetLevel() - 150 : 50;
    float chance = float(amount) / max_dmg * 100.0f;
    if (roll_chance_f(chance))
    {
        triggeredByAura->SetInUse(true);
        RemoveAurasByCasterSpell(triggeredByAura->GetId(), triggeredByAura->GetCasterGuid());
        triggeredByAura->SetInUse(false);
        return SPELL_AURA_PROC_OK;
    }

    return SPELL_AURA_PROC_FAILED;
}

SpellAuraProcResult Unit::HandleRemoveFearByDamageChanceProc(Unit* pVictim, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const *procSpell, uint32 procFlag, uint32 procEx, uint32 cooldown)
{
    if (!originalAmount)
        return SPELL_AURA_PROC_FAILED;

    switch (triggeredByAura->GetSpellProto()->Mechanic)
    {
        case MECHANIC_FEAR:
        case MECHANIC_TURN:
            break;
        default:
            return SPELL_AURA_PROC_FAILED;
    }

    // Formula derived from Youfie's post here:
    // https://forum.nostalrius.org/viewtopic.php?f=5&t=17424#p119432

    // The chance to dispel an aura depends on the damage taken with respect to the caster's level.
    uint32 max_dmg = GetLevel() > 8 ? 25 * GetLevel() - 150 : 50;

    // Players are 3x more likely to break fears
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    if (IsPlayer())
#else
    // World of Warcraft Client Patch 1.11.0 (2006-06-20)
    // - Fear: The calculations to determine if Fear effects should break due
    //   to receiving damage have been changed. In addition, Intimidating
    //   Shout now follows that player versus non - player distinction, while
    //   previously it did not.
    if (IsPlayer() && !HasAura(5246))
#endif
        max_dmg *= 0.333f;

    // World of Warcraft Client Patch 1.11.0 (2006-06-20)
    // - Fear: The calculations to determine if Fear effects should break due
    //   to receiving damage have been changed. In addition, the chance for a
    //   damage over time spell to break Fear is now significantly lower.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    // DOT spells are 3x less likely to break fears after 1.11
    if (procFlag & PROC_FLAG_TAKE_HARMFUL_PERIODIC)
        max_dmg *= 3;
#endif

    // for players, this means max_dmg = 450 at level 60, or 1350 if the damage source is a dot
    // for mobs, this means max_dmg = 1350 at level 60, or 4050 if the damage source is a dot

    // World of Warcraft Client Patch 1.11.0 (2006-06-20)
    // - Fear: The calculations to determine if Fear effects should break due 
    //   to receiving damage have been changed.The old calculation used the
    //   base damage of the ability.The new calculation uses the final amount
    //   of damage dealt, after all modifiers.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_10_2
    if (procSpell && pVictim)
        originalAmount = pVictim->CalculateSpellEffectValue(this, procSpell, EFFECT_INDEX_0);
#endif

    float chance = float(originalAmount) / float(max_dmg) * 100.0f;
    if (roll_chance_f(chance))
    {
        triggeredByAura->SetInUse(true);
        RemoveAurasByCasterSpell(triggeredByAura->GetId(), triggeredByAura->GetCasterGuid());
        triggeredByAura->SetInUse(false);
        return SPELL_AURA_PROC_OK;
    }

    return SPELL_AURA_PROC_FAILED;
}

SpellAuraProcResult Unit::HandleInvisibilityAuraProc(Unit* pVictim, uint32 amount, uint32 originalAmount, Aura* triggeredByAura, SpellEntry const *procSpell, uint32 procFlag, uint32 procEx, uint32 cooldown)
{
    if (triggeredByAura->GetSpellProto()->HasAttribute(SPELL_ATTR_PASSIVE) || !triggeredByAura->GetSpellProto()->IsPositiveSpell())
        return SPELL_AURA_PROC_FAILED;

    RemoveAurasDueToSpell(triggeredByAura->GetId());
    return SPELL_AURA_PROC_OK;
}
