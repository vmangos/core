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
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "UpdateMask.h"
#include "World.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "Player.h"
#include "Unit.h"
#include "Spell.h"
#include "DynamicObject.h"
#include "Group.h"
#include "UpdateData.h"
#include "ObjectAccessor.h"
#include "Policies/SingletonImp.h"
#include "Totem.h"
#include "Creature.h"
#include "Formulas.h"
#include "BattleGround.h"
#include "CreatureAI.h"
#include "ScriptMgr.h"
#include "Util.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "MapManager.h"
#include "MoveSpline.h"

#include "ZoneScript.h"
#include "PlayerAI.h"
#include "Anticheat.h"

#define NULL_AURA_SLOT 0xFF

pAuraHandler AuraHandler[TOTAL_AURAS] =
{
    &Aura::HandleNULL,                                      //  0 SPELL_AURA_NONE
    &Aura::HandleBindSight,                                 //  1 SPELL_AURA_BIND_SIGHT
    &Aura::HandleModPossess,                                //  2 SPELL_AURA_MOD_POSSESS
    &Aura::HandlePeriodicDamage,                            //  3 SPELL_AURA_PERIODIC_DAMAGE
    &Aura::HandleAuraDummy,                                 //  4 SPELL_AURA_DUMMY
    &Aura::HandleModConfuse,                                //  5 SPELL_AURA_MOD_CONFUSE
    &Aura::HandleModCharm,                                  //  6 SPELL_AURA_MOD_CHARM
    &Aura::HandleModFear,                                   //  7 SPELL_AURA_MOD_FEAR
    &Aura::HandlePeriodicHeal,                              //  8 SPELL_AURA_PERIODIC_HEAL
    &Aura::HandleModAttackSpeed,                            //  9 SPELL_AURA_MOD_ATTACKSPEED
    &Aura::HandleModThreat,                                 // 10 SPELL_AURA_MOD_THREAT
    &Aura::HandleModTaunt,                                  // 11 SPELL_AURA_MOD_TAUNT
    &Aura::HandleAuraModStun,                               // 12 SPELL_AURA_MOD_STUN
    &Aura::HandleModDamageDone,                             // 13 SPELL_AURA_MOD_DAMAGE_DONE
    &Aura::HandleNoImmediateEffect,                         // 14 SPELL_AURA_MOD_DAMAGE_TAKEN   implemented in Unit::MeleeDamageBonusTaken and Unit::SpellBaseDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         // 15 SPELL_AURA_DAMAGE_SHIELD      implemented in Unit::DealMeleeDamage
    &Aura::HandleModStealth,                                // 16 SPELL_AURA_MOD_STEALTH
    &Aura::HandleNoImmediateEffect,                         // 17 SPELL_AURA_MOD_STEALTH_DETECT
    &Aura::HandleInvisibility,                              // 18 SPELL_AURA_MOD_INVISIBILITY
    &Aura::HandleInvisibilityDetect,                        // 19 SPELL_AURA_MOD_INVISIBILITY_DETECTION
    &Aura::HandleAuraModTotalHealthPercentRegen,            // 20 SPELL_AURA_OBS_MOD_HEALTH
    &Aura::HandleAuraModTotalManaPercentRegen,              // 21 SPELL_AURA_OBS_MOD_MANA
    &Aura::HandleAuraModResistance,                         // 22 SPELL_AURA_MOD_RESISTANCE
    &Aura::HandlePeriodicTriggerSpell,                      // 23 SPELL_AURA_PERIODIC_TRIGGER_SPELL
    &Aura::HandlePeriodicEnergize,                          // 24 SPELL_AURA_PERIODIC_ENERGIZE
    &Aura::HandleAuraModPacify,                             // 25 SPELL_AURA_MOD_PACIFY
    &Aura::HandleAuraModRoot,                               // 26 SPELL_AURA_MOD_ROOT
    &Aura::HandleAuraModSilence,                            // 27 SPELL_AURA_MOD_SILENCE
    &Aura::HandleNoImmediateEffect,                         // 28 SPELL_AURA_REFLECT_SPELLS        implement in Unit::SpellHitResult
    &Aura::HandleAuraModStat,                               // 29 SPELL_AURA_MOD_STAT
    &Aura::HandleAuraModSkill,                              // 30 SPELL_AURA_MOD_SKILL
    &Aura::HandleAuraModIncreaseSpeed,                      // 31 SPELL_AURA_MOD_INCREASE_SPEED
    &Aura::HandleAuraModIncreaseMountedSpeed,               // 32 SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED
    &Aura::HandleAuraModDecreaseSpeed,                      // 33 SPELL_AURA_MOD_DECREASE_SPEED
    &Aura::HandleAuraModIncreaseHealth,                     // 34 SPELL_AURA_MOD_INCREASE_HEALTH
    &Aura::HandleAuraModIncreaseEnergy,                     // 35 SPELL_AURA_MOD_INCREASE_ENERGY
    &Aura::HandleAuraModShapeshift,                         // 36 SPELL_AURA_MOD_SHAPESHIFT
    &Aura::HandleAuraModEffectImmunity,                     // 37 SPELL_AURA_EFFECT_IMMUNITY
    &Aura::HandleAuraModStateImmunity,                      // 38 SPELL_AURA_STATE_IMMUNITY
    &Aura::HandleAuraModSchoolImmunity,                     // 39 SPELL_AURA_SCHOOL_IMMUNITY
    &Aura::HandleAuraModDmgImmunity,                        // 40 SPELL_AURA_DAMAGE_IMMUNITY
    &Aura::HandleAuraModDispelImmunity,                     // 41 SPELL_AURA_DISPEL_IMMUNITY
    &Aura::HandleAuraProcTriggerSpell,                      // 42 SPELL_AURA_PROC_TRIGGER_SPELL  implemented in Unit::ProcDamageAndSpellFor and Unit::HandleProcTriggerSpell
    &Aura::HandleNoImmediateEffect,                         // 43 SPELL_AURA_PROC_TRIGGER_DAMAGE implemented in Unit::ProcDamageAndSpellFor
    &Aura::HandleAuraTrackCreatures,                        // 44 SPELL_AURA_TRACK_CREATURES
    &Aura::HandleAuraTrackResources,                        // 45 SPELL_AURA_TRACK_RESOURCES
    &Aura::HandleUnused,                                    // 46 SPELL_AURA_46
    &Aura::HandleAuraModParryPercent,                       // 47 SPELL_AURA_MOD_PARRY_PERCENT
    &Aura::HandleUnused,                                    // 48 SPELL_AURA_48
    &Aura::HandleAuraModDodgePercent,                       // 49 SPELL_AURA_MOD_DODGE_PERCENT
    &Aura::HandleUnused,                                    // 50 SPELL_AURA_MOD_BLOCK_SKILL    obsolete?
    &Aura::HandleAuraModBlockPercent,                       // 51 SPELL_AURA_MOD_BLOCK_PERCENT
    &Aura::HandleAuraModCritPercent,                        // 52 SPELL_AURA_MOD_CRIT_PERCENT
    &Aura::HandlePeriodicLeech,                             // 53 SPELL_AURA_PERIODIC_LEECH
    &Aura::HandleModHitChance,                              // 54 SPELL_AURA_MOD_HIT_CHANCE
    &Aura::HandleModSpellHitChance,                         // 55 SPELL_AURA_MOD_SPELL_HIT_CHANCE
    &Aura::HandleAuraTransform,                             // 56 SPELL_AURA_TRANSFORM
    &Aura::HandleModSpellCritChance,                        // 57 SPELL_AURA_MOD_SPELL_CRIT_CHANCE
    &Aura::HandleAuraModIncreaseSwimSpeed,                  // 58 SPELL_AURA_MOD_INCREASE_SWIM_SPEED
    &Aura::HandleNoImmediateEffect,                         // 59 SPELL_AURA_MOD_DAMAGE_DONE_CREATURE implemented in Unit::MeleeDamageBonusDone and Unit::SpellDamageBonusDone
    &Aura::HandleAuraModPacifyAndSilence,                   // 60 SPELL_AURA_MOD_PACIFY_SILENCE
    &Aura::HandleAuraModScale,                              // 61 SPELL_AURA_MOD_SCALE
    &Aura::HandlePeriodicHealthFunnel,                      // 62 SPELL_AURA_PERIODIC_HEALTH_FUNNEL
    &Aura::HandleUnused,                                    // 63 SPELL_AURA_PERIODIC_MANA_FUNNEL obsolete?
    &Aura::HandlePeriodicManaLeech,                         // 64 SPELL_AURA_PERIODIC_MANA_LEECH
    &Aura::HandleModCastingSpeed,                           // 65 SPELL_AURA_MOD_CASTING_SPEED_NOT_STACK
    &Aura::HandleFeignDeath,                                // 66 SPELL_AURA_FEIGN_DEATH
    &Aura::HandleAuraModDisarm,                             // 67 SPELL_AURA_MOD_DISARM
    &Aura::HandleAuraModStalked,                            // 68 SPELL_AURA_MOD_STALKED
    &Aura::HandleSchoolAbsorb,                              // 69 SPELL_AURA_SCHOOL_ABSORB implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleUnused,                                    // 70 SPELL_AURA_EXTRA_ATTACKS      Useless, used by only one spell that has only visual effect
    &Aura::HandleModSpellCritChanceShool,                   // 71 SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL
    &Aura::HandleModPowerCostPCT,                           // 72 SPELL_AURA_MOD_POWER_COST_SCHOOL_PCT
    &Aura::HandleModPowerCost,                              // 73 SPELL_AURA_MOD_POWER_COST_SCHOOL
    &Aura::HandleNoImmediateEffect,                         // 74 SPELL_AURA_REFLECT_SPELLS_SCHOOL  implemented in Unit::SpellHitResult
    &Aura::HandleNoImmediateEffect,                         // 75 SPELL_AURA_MOD_LANGUAGE
    &Aura::HandleFarSight,                                  // 76 SPELL_AURA_FAR_SIGHT
    &Aura::HandleModMechanicImmunity,                       // 77 SPELL_AURA_MECHANIC_IMMUNITY
    &Aura::HandleAuraMounted,                               // 78 SPELL_AURA_MOUNTED
    &Aura::HandleModDamagePercentDone,                      // 79 SPELL_AURA_MOD_DAMAGE_PERCENT_DONE
    &Aura::HandleModPercentStat,                            // 80 SPELL_AURA_MOD_PERCENT_STAT
    &Aura::HandleNoImmediateEffect,                         // 81 SPELL_AURA_SPLIT_DAMAGE_PCT       implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleWaterBreathing,                            // 82 SPELL_AURA_WATER_BREATHING
    &Aura::HandleModBaseResistance,                         // 83 SPELL_AURA_MOD_BASE_RESISTANCE
    &Aura::HandleModRegen,                                  // 84 SPELL_AURA_MOD_REGEN
    &Aura::HandleModPowerRegen,                             // 85 SPELL_AURA_MOD_POWER_REGEN
    &Aura::HandleChannelDeathItem,                          // 86 SPELL_AURA_CHANNEL_DEATH_ITEM
    &Aura::HandleNoImmediateEffect,                         // 87 SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN implemented in Unit::MeleeDamageBonusTaken and Unit::SpellDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         // 88 SPELL_AURA_MOD_HEALTH_REGEN_PERCENT implemented in Player::RegenerateHealth
    &Aura::HandlePeriodicDamagePCT,                         // 89 SPELL_AURA_PERIODIC_DAMAGE_PERCENT
    &Aura::HandleUnused,                                    // 90 SPELL_AURA_MOD_RESIST_CHANCE  Useless
    &Aura::HandleNoImmediateEffect,                         // 91 SPELL_AURA_MOD_DETECT_RANGE implemented in Creature::GetAttackDistance
    &Aura::HandlePreventFleeing,                            // 92 SPELL_AURA_PREVENTS_FLEEING
    &Aura::HandleModUnattackable,                           // 93 SPELL_AURA_MOD_UNATTACKABLE
    &Aura::HandleInterruptRegen,                            // 94 SPELL_AURA_INTERRUPT_REGEN implemented in Player::RegenerateAll
    &Aura::HandleAuraGhost,                                 // 95 SPELL_AURA_GHOST
    &Aura::HandleNoImmediateEffect,                         // 96 SPELL_AURA_SPELL_MAGNET implemented in Unit::SelectMagnetTarget
    &Aura::HandleManaShield,                                // 97 SPELL_AURA_MANA_SHIELD implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleAuraModSkill,                              // 98 SPELL_AURA_MOD_SKILL_TALENT
    &Aura::HandleAuraModAttackPower,                        // 99 SPELL_AURA_MOD_ATTACK_POWER
    &Aura::HandleAurasVisible,                              //100 SPELL_AURA_AURAS_VISIBLE
    &Aura::HandleModResistancePercent,                      //101 SPELL_AURA_MOD_RESISTANCE_PCT
    &Aura::HandleNoImmediateEffect,                         //102 SPELL_AURA_MOD_MELEE_ATTACK_POWER_VERSUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleAuraModTotalThreat,                        //103 SPELL_AURA_MOD_TOTAL_THREAT
    &Aura::HandleAuraWaterWalk,                             //104 SPELL_AURA_WATER_WALK
    &Aura::HandleAuraFeatherFall,                           //105 SPELL_AURA_FEATHER_FALL
    &Aura::HandleAuraHover,                                 //106 SPELL_AURA_HOVER
    &Aura::HandleAddModifier,                               //107 SPELL_AURA_ADD_FLAT_MODIFIER
    &Aura::HandleAddModifier,                               //108 SPELL_AURA_ADD_PCT_MODIFIER
    &Aura::HandleNoImmediateEffect,                         //109 SPELL_AURA_ADD_TARGET_TRIGGER
    &Aura::HandleModPowerRegenPCT,                          //110 SPELL_AURA_MOD_POWER_REGEN_PERCENT
    &Aura::HandleUnused,                                    //111 SPELL_AURA_ADD_CASTER_HIT_TRIGGER
    &Aura::HandleNoImmediateEffect,                         //112 SPELL_AURA_OVERRIDE_CLASS_SCRIPTS implemented in diff functions.
    &Aura::HandleNoImmediateEffect,                         //113 SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //114 SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN_PCT implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //115 SPELL_AURA_MOD_HEALING                 implemented in Unit::SpellBaseHealingBonusTaken
    &Aura::HandleNoImmediateEffect,                         //116 SPELL_AURA_MOD_REGEN_DURING_COMBAT     imppemented in Player::RegenerateAll and Player::RegenerateHealth
    &Aura::HandleNoImmediateEffect,                         //117 SPELL_AURA_MOD_MECHANIC_RESISTANCE     implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //118 SPELL_AURA_MOD_HEALING_PCT             implemented in Unit::SpellHealingBonusTaken
    &Aura::HandleUnused,                                    //119 SPELL_AURA_SHARE_PET_TRACKING useless
    &Aura::HandleAuraUntrackable,                           //120 SPELL_AURA_UNTRACKABLE
    &Aura::HandleAuraEmpathy,                               //121 SPELL_AURA_EMPATHY
    &Aura::HandleModOffhandDamagePercent,                   //122 SPELL_AURA_MOD_OFFHAND_DAMAGE_PCT
    &Aura::HandleNoImmediateEffect,                         //123 SPELL_AURA_MOD_TARGET_RESISTANCE  implemented in Unit::CalculateAbsorbAndResist and Unit::CalcArmorReducedDamage
    &Aura::HandleAuraModRangedAttackPower,                  //124 SPELL_AURA_MOD_RANGED_ATTACK_POWER
    &Aura::HandleNoImmediateEffect,                         //125 SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //126 SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN_PCT implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //127 SPELL_AURA_RANGED_ATTACK_POWER_ATTACKER_BONUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleModPossessPet,                             //128 SPELL_AURA_MOD_POSSESS_PET
    &Aura::HandleAuraModIncreaseSpeed,                      //129 SPELL_AURA_MOD_SPEED_ALWAYS
    &Aura::HandleAuraModIncreaseMountedSpeed,               //130 SPELL_AURA_MOD_MOUNTED_SPEED_ALWAYS
    &Aura::HandleNoImmediateEffect,                         //131 SPELL_AURA_MOD_RANGED_ATTACK_POWER_VERSUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleAuraModIncreaseEnergyPercent,              //132 SPELL_AURA_MOD_INCREASE_ENERGY_PERCENT
    &Aura::HandleAuraModIncreaseHealthPercent,              //133 SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT
    &Aura::HandleAuraModRegenInterrupt,                     //134 SPELL_AURA_MOD_MANA_REGEN_INTERRUPT
    &Aura::HandleModHealingDone,                            //135 SPELL_AURA_MOD_HEALING_DONE
    &Aura::HandleNoImmediateEffect,                         //136 SPELL_AURA_MOD_HEALING_DONE_PERCENT   implemented in Unit::SpellHealingBonusDone
    &Aura::HandleModTotalPercentStat,                       //137 SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE
    &Aura::HandleModMeleeSpeedPct,                          //138 SPELL_AURA_MOD_MELEE_HASTE
    &Aura::HandleForceReaction,                             //139 SPELL_AURA_FORCE_REACTION
    &Aura::HandleAuraModRangedHaste,                        //140 SPELL_AURA_MOD_RANGED_HASTE
    &Aura::HandleRangedAmmoHaste,                           //141 SPELL_AURA_MOD_RANGED_AMMO_HASTE
    &Aura::HandleAuraModBaseResistancePCT,                  //142 SPELL_AURA_MOD_BASE_RESISTANCE_PCT
    &Aura::HandleAuraModResistanceExclusive,                //143 SPELL_AURA_MOD_RESISTANCE_EXCLUSIVE
    &Aura::HandleAuraSafeFall,                              //144 SPELL_AURA_SAFE_FALL                         implemented in WorldSession::HandleMovementOpcodes
    &Aura::HandleUnused,                                    //145 SPELL_AURA_CHARISMA obsolete?
    &Aura::HandleUnused,                                    //146 SPELL_AURA_PERSUADED obsolete?
    &Aura::HandleModMechanicImmunityMask,                   //147 SPELL_AURA_MECHANIC_IMMUNITY_MASK            implemented in Unit::IsImmuneToSpell and Unit::IsImmuneToSpellEffect (check part)
    &Aura::HandleAuraRetainComboPoints,                     //148 SPELL_AURA_RETAIN_COMBO_POINTS
    &Aura::HandleNoImmediateEffect,                         //149 SPELL_AURA_RESIST_PUSHBACK
    &Aura::HandleShieldBlockValue,                          //150 SPELL_AURA_MOD_SHIELD_BLOCKVALUE_PCT
    &Aura::HandleAuraTrackStealthed,                        //151 SPELL_AURA_TRACK_STEALTHED
    &Aura::HandleNoImmediateEffect,                         //152 SPELL_AURA_MOD_DETECTED_RANGE         implemented in Creature::GetAttackDistance
    &Aura::HandleNoImmediateEffect,                         //153 SPELL_AURA_SPLIT_DAMAGE_FLAT          implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleNoImmediateEffect,                         //154 SPELL_AURA_MOD_STEALTH_LEVEL          implemented in Unit::isVisibleForOrDetect
    &Aura::HandleNoImmediateEffect,                         //155 SPELL_AURA_MOD_WATER_BREATHING        implemented in Player::getMaxTimer
    &Aura::HandleNoImmediateEffect,                         //156 SPELL_AURA_MOD_REPUTATION_GAIN        implemented in Player::CalculateReputationGain
    &Aura::HandleUnused,                                    //157 SPELL_AURA_PET_DAMAGE_MULTI (single test like spell 20782, also single for 214 aura)
    &Aura::HandleShieldBlockValue,                          //158 SPELL_AURA_MOD_SHIELD_BLOCKVALUE
    &Aura::HandleNoImmediateEffect,                         //159 SPELL_AURA_NO_PVP_CREDIT      only for Honorless Target spell
    &Aura::HandleNoImmediateEffect,                         //160 SPELL_AURA_MOD_AOE_AVOIDANCE                 implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //161 SPELL_AURA_MOD_HEALTH_REGEN_IN_COMBAT
    &Aura::HandleAuraPowerBurn,                             //162 SPELL_AURA_POWER_BURN_MANA
    &Aura::HandleUnused,                                    //163 SPELL_AURA_MOD_CRIT_DAMAGE_BONUS
    &Aura::HandleUnused,                                    //164 useless, only one test spell
    &Aura::HandleNoImmediateEffect,                         //165 SPELL_AURA_MELEE_ATTACK_POWER_ATTACKER_BONUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleAuraModAttackPowerPercent,                 //166 SPELL_AURA_MOD_ATTACK_POWER_PCT
    &Aura::HandleAuraModRangedAttackPowerPercent,           //167 SPELL_AURA_MOD_RANGED_ATTACK_POWER_PCT
    &Aura::HandleNoImmediateEffect,                         //168 SPELL_AURA_MOD_DAMAGE_DONE_VERSUS            implemented in Unit::SpellDamageBonusDone, Unit::MeleeDamageBonusDone
    &Aura::HandleNoImmediateEffect,                         //169 SPELL_AURA_MOD_CRIT_PERCENT_VERSUS           implemented in Unit::DealDamageBySchool, Unit::DoAttackDamage, Unit::SpellCriticalBonus
    &Aura::HandleNULL,                                      //170 SPELL_AURA_DETECT_AMORE       only for Detect Amore spell
    &Aura::HandleAuraModIncreaseSpeed,                      //171 SPELL_AURA_MOD_SPEED_NOT_STACK
    &Aura::HandleAuraModIncreaseMountedSpeed,               //172 SPELL_AURA_MOD_MOUNTED_SPEED_NOT_STACK
    &Aura::HandleUnused,                                    //173 SPELL_AURA_ALLOW_CHAMPION_SPELLS  only for Proclaim Champion spell
    &Aura::HandleModSpellDamagePercentFromStat,             //174 SPELL_AURA_MOD_SPELL_DAMAGE_OF_STAT_PERCENT  implemented in Unit::SpellBaseDamageBonusDone (in 1.12.* only spirit)
    &Aura::HandleModSpellHealingPercentFromStat,            //175 SPELL_AURA_MOD_SPELL_HEALING_OF_STAT_PERCENT implemented in Unit::SpellBaseHealingBonusDone (in 1.12.* only spirit)
    &Aura::HandleSpiritOfRedemption,                        //176 SPELL_AURA_SPIRIT_OF_REDEMPTION   only for Spirit of Redemption spell, die at aura end
    &Aura::HandleAuraAoeCharm,                              //177 SPELL_AURA_AOE_CHARM
    &Aura::HandleNoImmediateEffect,                         //178 SPELL_AURA_MOD_DEBUFF_RESISTANCE          implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //179 SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE implemented in Unit::SpellCriticalBonus
    &Aura::HandleNoImmediateEffect,                         //180 SPELL_AURA_MOD_FLAT_SPELL_DAMAGE_VERSUS   implemented in Unit::SpellDamageBonusDone
    &Aura::HandleUnused,                                    //181 SPELL_AURA_MOD_FLAT_SPELL_CRIT_DAMAGE_VERSUS unused
    &Aura::HandleAuraModResistenceOfStatPercent,            //182 SPELL_AURA_MOD_RESISTANCE_OF_STAT_PERCENT
    &Aura::HandleNoImmediateEffect,                         //183 SPELL_AURA_MOD_CRITICAL_THREAT only used in 28746, implemented in ThreatCalcHelper::CalcThreat
    &Aura::HandleNoImmediateEffect,                         //184 SPELL_AURA_MOD_ATTACKER_MELEE_HIT_CHANCE  implemented in Unit::RollMeleeOutcomeAgainst
    &Aura::HandleNoImmediateEffect,                         //185 SPELL_AURA_MOD_ATTACKER_RANGED_HIT_CHANCE implemented in Unit::RollMeleeOutcomeAgainst
    &Aura::HandleNoImmediateEffect,                         //186 SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE  implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //187 SPELL_AURA_MOD_ATTACKER_MELEE_CRIT_CHANCE  implemented in Unit::GetUnitCriticalChance
    &Aura::HandleNoImmediateEffect,                         //188 SPELL_AURA_MOD_ATTACKER_RANGED_CRIT_CHANCE implemented in Unit::GetUnitCriticalChance
    &Aura::HandleUnused,                                    //189 SPELL_AURA_MOD_RATING (not used in 1.12.1)
    &Aura::HandleNoImmediateEffect,                         //190 SPELL_AURA_MOD_FACTION_REPUTATION_GAIN     implemented in Player::CalculateReputationGain
    &Aura::HandleAuraModUseNormalSpeed,                     //191 SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED
    // Nostalrius - custom
    &Aura::HandleAuraAuraSpell,
};

static AuraType const frozenAuraTypes[] = { SPELL_AURA_MOD_ROOT, SPELL_AURA_MOD_STUN, SPELL_AURA_NONE };

Aura::Aura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolder *holder, Unit *target, Unit *caster, Item* castItem) :
    m_spellmod(nullptr), m_periodicTimer(0), m_periodicTick(0), m_removeMode(AURA_REMOVE_BY_DEFAULT),
    m_effIndex(eff), m_positive(false), m_isPeriodic(false), m_isAreaAura(false),
    m_isPersistent(false), m_in_use(0), m_spellAuraHolder(holder),
// NOSTALRIUS: auras exclusifs
    m_applied(false)
{
    MANGOS_ASSERT(target);
    MANGOS_ASSERT(spellproto && spellproto == sSpellMgr.GetSpellEntry(spellproto->Id) && "`info` must be pointer to sSpellStore element");
    ASSERT(spellproto->EffectApplyAuraName[eff]);

    m_currentBasePoints = currentBasePoints ? *currentBasePoints : spellproto->CalculateSimpleValue(eff);

    m_positive = IsPositiveEffect(spellproto, m_effIndex);
    m_applyTime = time(nullptr);

    int32 damage;
    if (!caster)
        damage = m_currentBasePoints;
    else
        damage = caster->CalculateSpellDamage(target, spellproto, m_effIndex, &m_currentBasePoints);

    damage *= GetStackAmount();

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "Aura: construct Spellid : %u, Aura : %u Target : %d Damage : %d", spellproto->Id, spellproto->EffectApplyAuraName[eff], spellproto->EffectImplicitTargetA[eff], damage);

    SetModifier(AuraType(spellproto->EffectApplyAuraName[eff]), damage, spellproto->EffectAmplitude[eff], spellproto->EffectMiscValue[eff]);
    CalculatePeriodic(caster ? caster->GetSpellModOwner() : NULL, true);
    ComputeExclusive();
    if (IsLastAuraOnHolder() && !m_positive)
    {
        // Exclude passive spells.
        if (holder->IsNeedVisibleSlot(caster))
            holder->CalculateForDebuffLimit();

        holder->CalculateHeartBeat(caster, target);
    }
}

void Aura::Refresh(Unit* caster, Unit* target, SpellAuraHolder* pRefreshWithHolder)
{
    Aura* pHolderAura = pRefreshWithHolder->GetAuraByEffectIndex(m_effIndex);
    if (!pHolderAura)
        return;
    m_periodicTick = 0;
    Player* modOwner = caster ? caster->GetSpellModOwner() : NULL;
    m_applyTime = time(nullptr);
    // Refresh periodic period, but keep current timer.
    // If we chain refresh a DoT, it should not prevent first damage tick!
    int32 oldPeriodicTimer = m_periodicTimer;
    CalculatePeriodic(modOwner, true);
    if (oldPeriodicTimer < m_periodicTimer)
        m_periodicTimer = oldPeriodicTimer;

    // Re-calculation du montant de degats
    if (IsApplied() || !IsExclusive())
    {
        bool lockStats = false;
        switch (GetSpellProto()->EffectApplyAuraName[m_effIndex])
        {
            case SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE:
                if (GetSpellProto()->Attributes & 0x10)
                    break;
            // no break
            case SPELL_AURA_MOD_STAT:
            case SPELL_AURA_MOD_PERCENT_STAT:
            case SPELL_AURA_MOD_INCREASE_HEALTH:
            case SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT: // Exemple : 27038
                lockStats = true;
                break;
        }
        if (lockStats)
            target->SetCanModifyStats(false);
        //unapply with the old modifiers and reapply with the new.
        ApplyModifier(false, true, false);
        // Refresh de quelques variables du modifier
        m_modifier.m_auraname = pHolderAura->GetModifier()->m_auraname;
        m_modifier.m_amount = pHolderAura->GetModifier()->m_amount;
        m_modifier.m_miscvalue = pHolderAura->GetModifier()->m_miscvalue;
        ApplyModifier(true, true, false);
        if (lockStats)
        {
            target->SetCanModifyStats(true);
            target->UpdateAllStats();
        }
    }
}

void SpellAuraHolder::Refresh(Unit* caster, Unit* target, SpellAuraHolder* pRefreshWithHolder)
{
    m_casterGuid = caster ? caster->GetObjectGuid() : target->GetObjectGuid();
    m_applyTime = time(nullptr);
    m_duration = pRefreshWithHolder->GetAuraDuration();
    m_maxDuration = pRefreshWithHolder->GetAuraMaxDuration();
    for (int i = 0 ; i < MAX_EFFECT_INDEX; ++i)
    {
        if (Aura* pAura = GetAuraByEffectIndex(SpellEffectIndex(i)))
            pAura->Refresh(caster, target, pRefreshWithHolder);
    }
    UpdateAuraDuration();
    UpdateAuraApplication();
}

bool SpellAuraHolder::CanBeRefreshedBy(SpellAuraHolder* other) const
{
    if (!other)
        return false;
    if (other->GetCasterGuid() != GetCasterGuid())
        return false;
    // Meme ID/Effet de sort
    if (other->GetId() != GetId())
        return false;
    if (m_spellProto->StackAmount) // Se stack
        return false;
    if (m_spellProto->procCharges) // Ou a des charges (fix bug visuel)
        return false;
    return true;
}

bool SpellAuraHolder::IsMoreImportantDebuffThan(SpellAuraHolder* other) const
{
    // Same category : last aura applies
    if (m_debuffLimitScore == other->m_debuffLimitScore)
        return m_applyTime > other->m_applyTime;
    // Else, compare categories
    return m_debuffLimitScore > other->m_debuffLimitScore;
}

Aura::~Aura()
{
}

AreaAura::AreaAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolder *holder, Unit *target,
                   Unit *caster, Item* castItem) : Aura(spellproto, eff, currentBasePoints, holder, target, caster, castItem)
{
    m_isAreaAura = true;

    // caster==NULL in constructor args if target==caster in fact
    Unit* caster_ptr = caster ? caster : target;

    m_radius = GetSpellRadius(sSpellRadiusStore.LookupEntry(spellproto->EffectRadiusIndex[m_effIndex]));
    if (Player* modOwner = caster_ptr->GetSpellModOwner())
        modOwner->ApplySpellMod(spellproto->Id, SPELLMOD_RADIUS, m_radius);

    switch (spellproto->Effect[eff])
    {
        case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
            m_areaAuraType = AREA_AURA_PARTY;
            if (target->GetTypeId() == TYPEID_UNIT && ((Creature*)target)->IsTotem())
                m_modifier.m_auraname = SPELL_AURA_NONE;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_RAID:
            m_areaAuraType = AREA_AURA_RAID;
            if (target->GetTypeId() == TYPEID_UNIT && ((Creature*)target)->IsTotem())
                m_modifier.m_auraname = SPELL_AURA_NONE;
            // Light's Beacon not applied to caster itself (TODO: more generic check for another similar spell if any?)
            else if (target == caster_ptr && spellproto->Id == 53651)
                m_modifier.m_auraname = SPELL_AURA_NONE;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_FRIEND:
            m_areaAuraType = AREA_AURA_FRIEND;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_ENEMY:
            m_areaAuraType = AREA_AURA_ENEMY;
            if (target == caster_ptr)
                m_modifier.m_auraname = SPELL_AURA_NONE;    // Do not do any effect on self
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_PET:
            m_areaAuraType = AREA_AURA_PET;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_OWNER:
            m_areaAuraType = AREA_AURA_OWNER;
            if (target == caster_ptr)
                m_modifier.m_auraname = SPELL_AURA_NONE;
            break;
        default:
            sLog.outError("Wrong spell effect in AreaAura constructor");
            MANGOS_ASSERT(false);
            break;
    }
}

AreaAura::~AreaAura()
{
}

PersistentAreaAura::PersistentAreaAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolder *holder, Unit *target,
                                       Unit *caster, Item* castItem) : Aura(spellproto, eff, currentBasePoints, holder, target, caster, castItem)
{
    m_isPersistent = true;
}

PersistentAreaAura::~PersistentAreaAura()
{
}

SingleEnemyTargetAura::SingleEnemyTargetAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolder *holder, Unit *target,
        Unit *caster, Item* castItem) : Aura(spellproto, eff, currentBasePoints, holder, target, caster, castItem)
{
    if (caster)
        m_castersTargetGuid = caster->GetTypeId() == TYPEID_PLAYER ? ((Player*)caster)->GetSelectionGuid() : caster->GetTargetGuid();
}

SingleEnemyTargetAura::~SingleEnemyTargetAura()
{
}

Unit* SingleEnemyTargetAura::GetTriggerTarget() const
{
    return ObjectAccessor::GetUnit(*(m_spellAuraHolder->GetTarget()), m_castersTargetGuid);
}

Aura* CreateAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolder *holder, Unit *target, Unit *caster, Item* castItem)
{
    if (IsAreaAuraEffect(spellproto->Effect[eff]))
        return new AreaAura(spellproto, eff, currentBasePoints, holder, target, caster, castItem);

    return new Aura(spellproto, eff, currentBasePoints, holder, target, caster, castItem);
}

SpellAuraHolder* CreateSpellAuraHolder(SpellEntry const* spellproto, Unit *target, WorldObject *caster, Item *castItem)
{
    return new SpellAuraHolder(spellproto, target, caster, castItem);
}

void Aura::SetModifier(AuraType t, int32 a, uint32 pt, int32 miscValue)
{
    m_modifier.m_auraname = t;
    m_modifier.m_amount = a;
    m_modifier.m_miscvalue = miscValue;
    m_modifier.periodictime = pt;
}

void Aura::UpdatePeriodicTimer(int32 duration)
{
    if (m_isPeriodic)
    {
        // If duration gets changed, also change the periodic timer so that we
        // aren't losing out on ticks. Required for channeled spells that utilize
        // dynamic objects - don't want periodic timer initialized to the full
        // tick timer on entry into the aura
        // Avoid using modulo if we don't need to (slight perf increase)
        int32 newtick = (duration > m_modifier.periodictime) ? (duration % m_modifier.periodictime) : duration;
        // can be a divisible amount, in which case set it to the full period
        if (!newtick)
            newtick = m_modifier.periodictime;

        m_periodicTimer = newtick;
    }
}

void Aura::UpdateForAffected(uint32 diff)
{
    SetInUse(true);
    Aura::Update(diff);
    SetInUse(false);
}

void Aura::Update(uint32 diff)
{
    if (m_isPeriodic)
    {
        m_periodicTimer -= diff;

        if (m_periodicTimer <= 0) // tick also at m_periodicTimer==0 to prevent lost last tick in case max m_duration == (max m_periodicTimer)*N
        {
            // update before applying (aura can be removed in TriggerSpell or PeriodicTick calls)
            m_periodicTimer += m_modifier.periodictime;
            ++m_periodicTick;                               // for some infinity auras in some cases can overflow and reset
            PeriodicTick();
        }
    }
}

// Called by caster of this area aura to tick auras for affected targets
void AreaAura::UpdateForAffected(uint32 diff)
{
    Aura::UpdateForAffected(diff);
}

void AreaAura::Update(uint32 diff)
{
    // update for the caster of the aura
    if (GetCasterGuid() == GetTarget()->GetObjectGuid())
    {
        Unit* caster = GetTarget();

        if (!caster->hasUnitState(UNIT_STAT_ISOLATED))
        {
            Unit* owner = caster->GetCharmerOrOwner();
            if (!owner)
                owner = caster;
            Spell::UnitList targets;

            switch (m_areaAuraType)
            {
                case AREA_AURA_PARTY:
                {
                    Group *pGroup = nullptr;

                    if (owner->GetTypeId() == TYPEID_PLAYER)
                        pGroup = ((Player*)owner)->GetGroup();

                    if (pGroup)
                    {
                        uint8 subgroup = ((Player*)owner)->GetSubGroup();
                        for (GroupReference *itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
                        {
                            Player* Target = itr->getSource();
                            if (Target && Target->isAlive() && Target->GetSubGroup() == subgroup && (!Target->duel || owner == Target) && caster->IsFriendlyTo(Target))
                            {
                                if (caster->IsWithinDistInMap(Target, m_radius))
                                    targets.push_back(Target);
                                Pet *pet = Target->GetPet();
                                if (pet && pet->isAlive() && caster->IsWithinDistInMap(pet, m_radius))
                                    targets.push_back(pet);
                            }
                        }
                    }
                    else
                    {
                        // add owner
                        if (owner != caster && caster->IsWithinDistInMap(owner, m_radius))
                            targets.push_back(owner);
                        // add caster's pet
                        Unit* pet = caster->GetPet();
                        if (pet && caster->IsWithinDistInMap(pet, m_radius))
                            targets.push_back(pet);
                    }
                    break;
                }
                case AREA_AURA_RAID:
                {
                    Group *pGroup = nullptr;

                    if (owner->GetTypeId() == TYPEID_PLAYER)
                        pGroup = ((Player*)owner)->GetGroup();

                    if (pGroup)
                    {
                        for (GroupReference *itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
                        {
                            Player* Target = itr->getSource();
                            if (Target && Target->isAlive() && caster->IsFriendlyTo(Target))
                            {
                                if (caster->IsWithinDistInMap(Target, m_radius))
                                    targets.push_back(Target);
                                Pet *pet = Target->GetPet();
                                if (pet && pet->isAlive() && caster->IsWithinDistInMap(pet, m_radius))
                                    targets.push_back(pet);
                            }
                        }
                    }
                    else
                    {
                        // add owner
                        if (owner != caster && caster->IsWithinDistInMap(owner, m_radius))
                            targets.push_back(owner);
                        // add caster's pet
                        Unit* pet = caster->GetPet();
                        if (pet && caster->IsWithinDistInMap(pet, m_radius))
                            targets.push_back(pet);
                    }
                    break;
                }
                case AREA_AURA_FRIEND:
                {
                    MaNGOS::AnyFriendlyUnitInObjectRangeCheck u_check(caster, m_radius);
                    MaNGOS::UnitListSearcher<MaNGOS::AnyFriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
                    Cell::VisitAllObjects(caster, searcher, m_radius);
                    break;
                }
                case AREA_AURA_ENEMY:
                {
                    MaNGOS::AnyAoETargetUnitInObjectRangeCheck u_check(caster, m_radius); // No GetCharmer in searcher
                    MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck> searcher(targets, u_check);
                    Cell::VisitAllObjects(caster, searcher, m_radius);
                    break;
                }
                case AREA_AURA_OWNER:
                {
                    if (owner != caster && caster->IsWithinDistInMap(owner, m_radius))
                        targets.push_back(owner);
                    break;
                }
                case AREA_AURA_PET:
                {
                    if (owner != caster && caster->IsWithinDistInMap(owner, m_radius))
                        targets.push_back(owner);
                    break;
                }
            }

            for (Spell::UnitList::iterator tIter = targets.begin(); tIter != targets.end(); tIter++)
            {
                // default flag is to apply aura to current iteration target, set to 
                // false if an area aura of the same spellid exists on the target
                bool apply = true;

                Unit *target = *tIter;

                // we need to ignore present caster self applied area auras sometimes
                // in cases where this is the only aura applied for this spell effect
                Unit::SpellAuraHolderBounds spair = target->GetSpellAuraHolderBounds(GetId());
                for (Unit::SpellAuraHolderMap::const_iterator i = spair.first; i != spair.second; ++i)
                {
                    if (i->second->IsDeleted())
                        continue;

                    Aura *aur = i->second->GetAuraByEffectIndex(m_effIndex);

                    if (aur)
                    {
                        // If this unit is the caster, update the tick. Units won't tick their
                        // own area auras. Make sure we don't double tick if this unit is the caster
                        // though
                        if (i->second->GetCasterGuid() == GetCasterGuid() && i->second->GetTarget()->GetObjectGuid() != GetCasterGuid())
                        {
                            aur->UpdateForAffected(diff);
                        }

                        // in generic case not allow stacking area auras
                        apply = false;
                        break;
                    }
                    else
                        continue;
                }

                if (!apply)
                    continue;

                // Skip some targets (TODO: Might require better checks, also unclear how the actual caster must/can be handled)
                if (GetSpellProto()->AttributesEx3 & SPELL_ATTR_EX3_TARGET_ONLY_PLAYER && target->GetTypeId() != TYPEID_PLAYER)
                    continue;

                if (SpellEntry const *actualSpellInfo = sSpellMgr.SelectAuraRankForLevel(GetSpellProto(), target->getLevel()))
                {
                    int32 actualBasePoints = m_currentBasePoints;
                    // recalculate basepoints for lower rank (all AreaAura spell not use custom basepoints?)
                    if (actualSpellInfo != GetSpellProto())
                        actualBasePoints = actualSpellInfo->CalculateSimpleValue(m_effIndex);

                    SpellAuraHolder *holder = target->GetSpellAuraHolder(actualSpellInfo->Id, GetCasterGuid());

                    bool addedToExisting = true;
                    if (!holder)
                    {
                        holder = CreateSpellAuraHolder(actualSpellInfo, target, caster);
                        addedToExisting = false;
                    }

                    AreaAura *aur = new AreaAura(actualSpellInfo, m_effIndex, &actualBasePoints, holder, target, caster, nullptr);
                    holder->AddAura(aur, m_effIndex);

                    if (!holder->IsPassive() && !holder->IsPermanent())
                    {
                        // Aura duration has already been decremented in caster holder update, so re-add
                        // for the target's holder or it will be one diff in the future
                        holder->SetAuraDuration(GetAuraDuration() + diff);
                    }

                    // Caster's aura will tick at the end of this method, so subtract now to remain synced
                    holder->RefreshAuraPeriodicTimers(m_periodicTimer - diff);

                    if (addedToExisting)
                    {
                        target->AddAuraToModList(aur);
                        holder->SetInUse(true);
                        aur->ApplyModifier(true, true);
                        holder->SetInUse(false);
                    }
                    else if (!target->AddSpellAuraHolder(holder))
                        holder = nullptr;

                    DETAIL_LOG("Added aura %u to holder for spell %u on %s", m_effIndex, GetId(), target->GetName());

                    // Add holder to spell if it's channeled so the updates are synced
                    if (holder && IsChanneled() && !addedToExisting)
                    {
                        if (Spell *spell = caster->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
                        {
                            spell->AddChanneledAuraHolder(holder);
                        }
                    }
                }
            }
        }
        Aura::Update(diff);
    }
    else                                                    // aura at non-caster
    {
        Unit* caster = GetCaster();
        Unit* target = GetTarget();

        // Aura updates in caster update, see above
        //Aura::Update(diff);

        // only do range/removal check, tick is done on caster update to remain in sync
        // remove aura if out-of-range from caster (after teleport for example)
        // or caster is isolated or caster no longer has the aura
        // or caster is (no longer) friendly
        bool needFriendly = (m_areaAuraType == AREA_AURA_ENEMY ? false : true);
        if (!caster || caster->hasUnitState(UNIT_STAT_ISOLATED) ||
                !caster->IsWithinDistInMap(target, m_radius) ||
                !caster->HasAura(GetId(), GetEffIndex()) ||
                caster->IsFriendlyTo(target) != needFriendly
            )
        {
            target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetCasterGuid(), AURA_REMOVE_BY_RANGE);
        }
        else if (m_areaAuraType == AREA_AURA_PARTY)         // check if in same sub group
        {
            // not check group if target == owner or target == pet
            if (caster->GetCharmerOrOwnerGuid() != target->GetObjectGuid() && caster->GetObjectGuid() != target->GetCharmerOrOwnerGuid())
            {
                Player* check = caster->GetCharmerOrOwnerPlayerOrPlayerItself();

                Group *pGroup = check ? check->GetGroup() : NULL;
                if (pGroup)
                {
                    Player* checkTarget = target->GetCharmerOrOwnerPlayerOrPlayerItself();
                    if (!checkTarget || !pGroup->SameSubGroup(check, checkTarget))
                        target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetCasterGuid(), AURA_REMOVE_BY_GROUP);
                }
                else
                    target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetCasterGuid(), AURA_REMOVE_BY_GROUP);
            }
        }
        else if (m_areaAuraType == AREA_AURA_PET)
        {
            if (target->GetObjectGuid() != caster->GetCharmerOrOwnerGuid())
                target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetCasterGuid(), AURA_REMOVE_BY_GROUP);
        }
    }
}

void PersistentAreaAura::Update(uint32 diff)
{
    // remove the aura if its caster or the dynamic object causing it was removed
    // or if the target moves too far from the dynamic object

    bool remove = false;
    uint32 spellId = GetId();
    // Nostalrius: piege explosif. Ne doit pas etre retire lorsqu'on sort de la zone.
    if (spellId != 13812 && spellId != 14314 && spellId != 14315)
    {
        remove = true;
        if (Unit *caster = GetCaster())
        {
            std::vector<DynamicObject*> dynObjs;
            caster->GetDynObjects(spellId, GetEffIndex(), dynObjs);
            Unit* pUnitTarget = GetTarget();
            for (DynamicObject* obj : dynObjs)
            {
                if (pUnitTarget->IsWithinDistInMap(obj, obj->GetRadius()))
                    remove = false;
                else
                    obj->RemoveAffected(pUnitTarget);           // let later reapply if target return to range
            }
        }
    }

    // Note: Unit may have been removed from the world (mid-teleport) during this
    // update (since the caster updates area auras). We shouldn't be ticking it
    // when the target is out of range anyway.
    if (remove)
        GetTarget()->RemoveSingleAuraFromSpellAuraHolder(GetHolder(), m_effIndex, AURA_REMOVE_BY_RANGE);
    else
        Aura::Update(diff);
}

void Aura::ApplyModifier(bool apply, bool Real, bool skipCheckExclusive)
{
    // Dans Unit::RemoveAura, ApplyModifier est toujours appelle.
    if (IsApplied() == apply)
        return;
    AuraType aura = m_modifier.m_auraname;

    GetHolder()->SetInUse(true);
    SetInUse(true);
    // NOSTALRIUS: Auras exclusifs.
    if (apply && !skipCheckExclusive && IsExclusive() && !ExclusiveAuraCanApply())
    {
        GetHolder()->SetInUse(false);
        SetInUse(false);
        return;
    }
    m_applied = apply;
    if (aura < TOTAL_AURAS)
        (*this.*AuraHandler [aura])(apply, Real);

    if (!apply && !skipCheckExclusive && IsExclusive())
        ExclusiveAuraUnapply();

    SetInUse(false);
    GetHolder()->SetInUse(false);
}

bool Aura::isAffectedOnSpell(SpellEntry const *spell) const
{
    if (m_spellmod)
        return m_spellmod->isAffectedOnSpell(spell);

    // Check family name
    if (spell->SpellFamilyName != GetSpellProto()->SpellFamilyName)
        return false;

    ClassFamilyMask mask = sSpellMgr.GetSpellAffectMask(GetId(), GetEffIndex());
    return spell->IsFitToFamilyMask(mask);
}

bool Aura::CanProcFrom(SpellEntry const *spell, uint32 EventProcEx, uint32 procEx, bool active, bool useClassMask) const
{
    // Check EffectClassMask (in pre-3.x stored in spell_affect in fact)
    ClassFamilyMask mask = sSpellMgr.GetSpellAffectMask(GetId(), GetEffIndex());

    // Nostalrius: c'est la moindre des choses d'utiliser un peu 'spell_proc_event' non ?
    if (!mask)
        if (SpellProcEventEntry const* entry = sSpellMgr.GetSpellProcEvent(GetId()))
            mask = entry->spellFamilyMask[GetEffIndex()];

    // if no class mask defined, or spell_proc_event has SpellFamilyName=0 - allow proc
    if (!useClassMask || !mask)
    {
        if (!(EventProcEx & PROC_EX_EX_TRIGGER_ALWAYS))
        {
            // Check for extra req (if none) and hit/crit
            if (EventProcEx == PROC_EX_NONE)
            {
                // No extra req, so can trigger only for active (damage/healing present) and hit/crit
                if ((procEx & (PROC_EX_NORMAL_HIT | PROC_EX_CRITICAL_HIT)) && active)
                    return true;
                else
                    return false;
            }
            else // Passive spells hits here only if resist/reflect/immune/evade
            {
                // Passive spells can`t trigger if need hit (exclude cases when procExtra include non-active flags)
                if ((EventProcEx & (PROC_EX_NORMAL_HIT | PROC_EX_CRITICAL_HIT) & procEx) && !active)
                    return false;
            }
        }
        return true;
    }
    else
    {
        // SpellFamilyName check is performed in SpellMgr::IsSpellProcEventCanTriggeredBy and it is done once for whole holder
        // note: SpellFamilyName is not checked if no spell_proc_event is defined
        return mask.IsFitToFamilyMask(spell->SpellFamilyFlags);
    }
}

void Aura::ReapplyAffectedPassiveAuras(Unit* target)
{
    // we need store cast item guids for self casted spells
    // expected that not exist permanent auras from stackable auras from different items
    std::map<uint32, ObjectGuid> affectedSelf;

    for (Unit::SpellAuraHolderMap::const_iterator itr = target->GetSpellAuraHolderMap().begin(); itr != target->GetSpellAuraHolderMap().end(); ++itr)
    {
        // permanent passive
        // passive spells can be affected only by own or owner spell mods)
        if (itr->second->IsPassive() && itr->second->IsPermanent() &&
                // non deleted and not same aura (any with same spell id)
                !itr->second->IsDeleted() && itr->second->GetId() != GetId() &&
                // and affected by aura
                itr->second->GetCasterGuid() == target->GetObjectGuid() &&
                // and affected by spellmod
                isAffectedOnSpell(itr->second->GetSpellProto()))
            affectedSelf[itr->second->GetId()] = itr->second->GetCastItemGuid();
    }

    if (!affectedSelf.empty())
    {
        Player* pTarget = target->GetTypeId() == TYPEID_PLAYER ? (Player*)target : NULL;

        for (std::map<uint32, ObjectGuid>::const_iterator map_itr = affectedSelf.begin(); map_itr != affectedSelf.end(); ++map_itr)
        {
            Item* item = pTarget && map_itr->second ? pTarget->GetItemByGuid(map_itr->second) : NULL;
            target->RemoveAurasDueToSpell(map_itr->first);
            target->CastSpell(target, map_itr->first, true, item);
        }
    }
}

struct ReapplyAffectedPassiveAurasHelper
{
    explicit ReapplyAffectedPassiveAurasHelper(Aura* _aura) : aura(_aura) {}
    void operator()(Unit* unit) const
    {
        aura->ReapplyAffectedPassiveAuras(unit);
    }
    Aura* aura;
};

void Aura::ReapplyAffectedPassiveAuras()
{
    // not reapply spell mods with charges (use original value because processed and at remove)
    if (GetSpellProto()->procCharges)
        return;

    // not reapply some spell mods ops (mostly speedup case)
    switch (m_modifier.m_miscvalue)
    {
        case SPELLMOD_DURATION:
        case SPELLMOD_CHARGES:
        case SPELLMOD_NOT_LOSE_CASTING_TIME:
        case SPELLMOD_CASTING_TIME:
        case SPELLMOD_COOLDOWN:
        case SPELLMOD_COST:
        case SPELLMOD_ACTIVATION_TIME:
        case SPELLMOD_CASTING_TIME_OLD:
            return;
    }

    // reapply talents to own passive persistent auras
    ReapplyAffectedPassiveAuras(GetTarget());

    // re-apply talents/passives/area auras applied to pet/totems (it affected by player spellmods)
    GetTarget()->CallForAllControlledUnits(ReapplyAffectedPassiveAurasHelper(this), CONTROLLED_PET | CONTROLLED_TOTEMS);
}

/*********************************************************/
/***               BASIC AURA FUNCTION                 ***/
/*********************************************************/
void Aura::HandleAddModifier(bool apply, bool Real)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER || !Real)
        return;

    if (m_modifier.m_miscvalue >= MAX_SPELLMOD)
        return;

    if (apply)
    {
        // Add custom charges for some mod aura
        switch (GetSpellProto()->Id)
        {
            case 17941:                                     // Shadow Trance
            case 22008:                                     // Netherwind Focus
                GetHolder()->SetAuraCharges(1);
                break;
        }

        // In pre-TBC wrong spellmods in DBC
        // Nostalrius: fix dans spell_effect_mod (EffectMiscValue)
        /*
        switch (GetSpellProto()->SpellIconID)
        {
            case 143:       // Permafrost Speed Decrease
                if (GetEffIndex() == EFFECT_INDEX_1)
                    m_modifier.m_miscvalue = SPELLMOD_EFFECT1;
                break;
            case 228:       // Improved Curse of Exhaustion Speed Decrease
                if (GetEffIndex() == EFFECT_INDEX_0)
                    m_modifier.m_miscvalue = SPELLMOD_EFFECT1;
                break;
            case 250:       // Camouflage Speed Decrease (13975, 14062, 14063, 14064, 14065)
                if (GetEffIndex() == EFFECT_INDEX_0)
                    m_modifier.m_miscvalue = SPELLMOD_EFFECT3;
                break;
            case 1181:       // Pathfinding Speed Increase (ID = 19560)
                if (GetEffIndex() == EFFECT_INDEX_0)
                    m_modifier.m_miscvalue = SPELLMOD_EFFECT1;
                break;
            case 1494:       // Amplify Curse Speed Decrease (18310, 18311, 18312, 18313)
                if (GetEffIndex() == EFFECT_INDEX_0)
                    m_modifier.m_miscvalue = SPELLMOD_EFFECT1;
                break;
            case 1563:       // Cheetah Sprint (ID = 24348)
                if (GetEffIndex() == EFFECT_INDEX_0)
                    m_modifier.m_miscvalue = SPELLMOD_EFFECT1;
                break;
        }*/

        m_spellmod = new SpellModifier(
            SpellModOp(m_modifier.m_miscvalue),
            SpellModType(m_modifier.m_auraname),            // SpellModType value == spell aura types
            m_modifier.m_amount,
            this,
            // prevent expire spell mods with (charges > 0 && m_stackAmount > 1)
            // all this spell expected expire not at use but at spell proc event check
            GetSpellProto()->StackAmount > 1 ? 0 : GetHolder()->GetAuraCharges());
    }

    ASSERT(m_spellmod);
    ((Player*)GetTarget())->AddSpellMod(m_spellmod, apply);
    if (!apply)
        m_spellmod = nullptr; // Deja supprime par Player::AddSpellMod.

    ReapplyAffectedPassiveAuras();
}

void Aura::TriggerSpell()
{
    ObjectGuid casterGUID = GetCasterGuid();
    Unit* triggerTarget = GetTriggerTarget();

    if (!casterGUID || !triggerTarget)
        return;

    // generic casting code with custom spells and target/caster customs
    uint32 trigger_spell_id = GetSpellProto()->EffectTriggerSpell[m_effIndex];

    SpellEntry const *triggeredSpellInfo = sSpellMgr.GetSpellEntry(trigger_spell_id);
    SpellEntry const *auraSpellInfo = GetSpellProto();
    uint32 auraId = auraSpellInfo->Id;
    Unit* target = GetTarget();

    uint32 spellRandom;

    // specific code for cases with no trigger spell provided in field
    if (triggeredSpellInfo == nullptr)
    {
        switch (auraSpellInfo->SpellFamilyName)
        {
            case SPELLFAMILY_GENERIC:
            {
                switch (auraId)
                {
                    // Firestone Passive (1-5 ranks)
                    case 758:
                    case 17945:
                    case 17947:
                    case 17949:
                    {
                        if (triggerTarget->GetTypeId() != TYPEID_PLAYER)
                            return;
                        Item* item = ((Player*)triggerTarget)->GetWeaponForAttack(BASE_ATTACK);
                        if (!item)
                            return;
                        uint32 enchant_id = 0;
                        switch (GetId())
                        {
                            case   758:
                                enchant_id = 1803;
                                break;   // Rank 1
                            case 17945:
                                enchant_id = 1823;
                                break;   // Rank 2
                            case 17947:
                                enchant_id = 1824;
                                break;   // Rank 3
                            case 17949:
                                enchant_id = 1825;
                                break;   // Rank 4
                            default:
                                return;
                        }
                        // remove old enchanting before applying new
                        ((Player*)triggerTarget)->ApplyEnchantment(item, TEMP_ENCHANTMENT_SLOT, false);
                        item->SetEnchantment(TEMP_ENCHANTMENT_SLOT, enchant_id, m_modifier.periodictime + 1000, 0);
                        // add new enchanting
                        ((Player*)triggerTarget)->ApplyEnchantment(item, TEMP_ENCHANTMENT_SLOT, true);
                        return;
                    }
//                    // Periodic Mana Burn
//                    case 812: break;
//                    // Polymorphic Ray
//                    case 6965: break;
//                    // Fire Nova (1-7 ranks)
//                    case 8350:
//                    case 8508:
//                    case 8509:
//                    case 11312:
//                    case 11313:
//                    case 25540:
//                    case 25544:
//                        break;
                    // Thaumaturgy Channel
                    case 9712:
                        trigger_spell_id = 21029;
                        break;
//                    // Egan's Blaster
//                    case 17368: break;
//                    // Haunted
//                    case 18347: break;
//                    // Ranshalla Waiting
//                    case 18953: break;
//                    // Inferno
//                    case 19695: break;
//                    // Frostwolf Muzzle DND
//                    case 21794: break;
//                    // Alterac Ram Collar DND
//                    case 21866: break;
//                    // Celebras Waiting
//                    case 21916: break;
                    // Brood Affliction: Bronze
                    case 23170:
                    {
                        int rand = urand(0, 9);
                        if (rand < 4)   // Ustaag <Nostalrius> : 40% chance
                            target->CastSpell(target, 23171, true, nullptr, this);
                        return;
                    }
                    case 23493:                             // Restoration
                    {
                        int32 heal = triggerTarget->GetMaxHealth() / 10;
                        triggerTarget->DealHeal(triggerTarget, heal, auraSpellInfo);

                        if (int32 mana = triggerTarget->GetMaxPower(POWER_MANA))
                        {
                            mana /= 10;
                            triggerTarget->EnergizeBySpell(triggerTarget, 23493, mana, POWER_MANA);
                        }
                        return;
                    }
//                    // Stoneclaw Totem Passive TEST
//                    case 23792: break;
//                    // Axe Flurry
//                    case 24018: break;
//                    // Mark of Arlokk
//                    case 24210: break;
//                    // Restoration
//                    case 24379: break;
//                    // Happy Pet
//                    case 24716: break;
//                    // Dream Fog
//                    case 24780: break;
//                    // Cannon Prep
//                    case 24832: break;
                    case 24834:                             // Shadow Bolt Whirl
                    {
                        uint32 spellForTick[8] = { 24820, 24821, 24822, 24823, 24835, 24836, 24837, 24838 };
                        trigger_spell_id = spellForTick[GetAuraTicks() % 8];
                        break;
                    }
//                    // Stink Trap
//                    case 24918: break;
//                    // Agro Drones
//                    case 25152: break;
                    case 25371:                             // Consume
                    {
                        int32 bpDamage = triggerTarget->GetMaxHealth() * 10 / 100;
                        triggerTarget->CastCustomSpell(triggerTarget, 25373, &bpDamage, nullptr, nullptr, true, nullptr, this, casterGUID);
                        return;
                    }
//                    // Pain Spike
//                    case 25572: break;
                    case 26009:                             // Rotate 360
                    case 26136:                             // Rotate -360
                    {
                        float newAngle = target->GetOrientation();

                        if (auraId == 26009)
                            newAngle += M_PI_F / 40;
                        else
                            newAngle -= M_PI_F / 40;

                        newAngle = MapManager::NormalizeOrientation(newAngle);
                        target->SetFacingTo(newAngle);
                        target->CastSpell(target, 26029, true);
                        return;
                    }
//                    // Consume
//                    case 26196: break;
//                    // Berserk
//                    case 26615: break;
//                    // Defile
//                    case 27177: break;
//                    // Teleport: IF/UC
//                    case 27601: break;
//                    // Five Fat Finger Exploding Heart Technique
//                    case 27673: break;
                    // Nitrous Boost
                    case 27746:
                    {
                        if (target->GetPower(POWER_MANA) >= 10)
                        {
                            target->ModifyPower(POWER_MANA, -10);
                            target->SendEnergizeSpellLog(target, 27746, -10, POWER_MANA);
                        }
                        else
                            target->RemoveAurasDueToSpell(27746);
                        return;
                    }
                    // Steam Tank Passive
                    case 27747:
                    {
                        uint32 tonkmana = target->GetPower(POWER_MANA);
                        if (tonkmana < 100)
                        {
                            target->ModifyPower(POWER_MANA, tonkmana > 90 ? (100 - tonkmana) : 10);
                        }
                        return;
                    }
                    case 27808:                             // Frost Blast
                    {
                        int32 bpDamage = triggerTarget->GetMaxHealth() * 26 / 100;
                        triggerTarget->CastCustomSpell(triggerTarget, 29879, &bpDamage, nullptr, nullptr, true, nullptr, this, casterGUID);
                        return;
                    }
                    // Detonate Mana
                    case 27819:
                    {
                        // 50% Mana Burn
                        int32 bpDamage = (int32)triggerTarget->GetPower(POWER_MANA) / 2;
                        triggerTarget->ModifyPower(POWER_MANA, -bpDamage);
                        triggerTarget->CastCustomSpell(triggerTarget, 27820, &bpDamage, nullptr, nullptr, true, nullptr, this, triggerTarget->GetObjectGuid());
                        return;
                    }
                    // Stalagg Chain and Feugen Chain
                    case 28096:
                    case 28111:
                    {
                        // X-Chain is casted by Tesla to X, so: caster == Tesla, target = X
                        Unit* pCaster = GetCaster();
                        if (pCaster && pCaster->GetTypeId() == TYPEID_UNIT && !pCaster->IsWithinDistInMap(target, 60.0f))
                        {
                            pCaster->InterruptNonMeleeSpells(true);
                            ((Creature*)pCaster)->SetInCombatWithZone();
                            // Stalagg Tesla Passive or Feugen Tesla Passive
                            pCaster->CastSpell(pCaster, auraId == 28096 ? 28097 : 28109, true, nullptr, nullptr, target->GetObjectGuid());
                        }
                        return;
                    }
//                    // Controller Timer
//                    case 28095: break;
//                    // Stalagg Tesla Passive
//                    case 28097: break;
//                    // Feugen Tesla Passive
//                    case 28109: break;
//                    // Mark of Didier
//                    case 28114: break;
//                    // Communique Timer, camp
//                    case 28346: break;
//                    
                    case 28522: // Icebolt
                    {
                        if (target && target->isAlive() && !target->HasAura(31800))
                        {
                            target->CastSpell(target, 31800, true); // Icebolt which causes immunity to frost dmg
                            trigger_spell_id = 28535; //summon ice block
                            break;
                        }
                        else
                        {
                            return;
                        }
                    }
                    // Silithyst
//                  case 29519: break;
                    default:
                        break;
                }
                break;
            }
            case SPELLFAMILY_MAGE:
            {
                switch (auraId)
                {
                    case 66:                                // Invisibility
                        // Here need periodic trigger reducing threat spell (or do it manually)
                        return;
                    default:
                        break;
                }
                break;
            }
//            case SPELLFAMILY_WARRIOR:
//            {
//                switch(auraId)
//                {
//                    // Wild Magic
//                    case 23410: break;
//                    // Corrupted Totems
//                    case 23425: break;
//                    default:
//                        break;
//                }
//                break;
//            }
//            case SPELLFAMILY_PRIEST:
//            {
//                switch(auraId)
//                {
//                    // Blue Beam
//                    case 32930: break;
//                    default:
//                        break;
//                }
//                break;
//            }
            case SPELLFAMILY_DRUID:
            {
                switch (auraId)
                {
                    case 768:                               // Cat Form
                        // trigger_spell_id not set and unknown effect triggered in this case, ignoring for while
                        return;
                    case 22842:                             // Frenzied Regeneration
                    case 22895:
                    case 22896:
                    {
                        int32 LifePerRage = GetModifier()->m_amount;

                        int32 lRage = target->GetPower(POWER_RAGE);
                        if (lRage > 100)                    // rage stored as rage*10
                            lRage = 100;
                        target->ModifyPower(POWER_RAGE, -lRage);
                        int32 FRTriggerBasePoints = int32(lRage * LifePerRage / 10);
                        target->CastCustomSpell(target, 22845, &FRTriggerBasePoints, nullptr, nullptr, true, nullptr, this);
                        return;
                    }
                    default:
                        break;
                }
                break;
            }
            case SPELLFAMILY_SHAMAN:
            {
                switch (auraId)
                {
                    case 28820:                             // Lightning Shield (The Earthshatterer set trigger after cast Lighting Shield)
                    {
                        // Need remove self if Lightning Shield not active
                        Unit::SpellAuraHolderMap const& auras = triggerTarget->GetSpellAuraHolderMap();
                        for (Unit::SpellAuraHolderMap::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
                        {
                            SpellEntry const* spell = itr->second->GetSpellProto();
                            if (spell->IsFitToFamily<SPELLFAMILY_SHAMAN, CF_SHAMAN_LIGHTNING_SHIELD>())
                                return;
                        }
                        triggerTarget->RemoveAurasDueToSpell(28820);
                        return;
                    }
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }

        // Reget trigger spell proto
        triggeredSpellInfo = sSpellMgr.GetSpellEntry(trigger_spell_id);
    }
    else
    {
        // Spell exist but require custom code
        switch (auraId)
        {
            case 7054:
                spellRandom = urand(0, 14) + 7038;
                target->CastSpell(target, spellRandom, true, nullptr, this);
                return;
                break;
            case 8892:  // Goblin Rocket Boots
            case 13141: // Gnomish Rocket Boots
                // 20 ticks, et une chance sur 5 d'exploser.
                if (urand(0, 20 * 5 - 1) != 0)
                    return;
                break;
            case 9347:                                      // Mortal Strike
            {
                // expected selection current fight target
                triggerTarget = GetTarget()->getVictim();
                if (!triggerTarget)
                    return;

                // avoid triggering for far target
                SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(triggeredSpellInfo->rangeIndex);
                float max_range = GetSpellMaxRange(srange);
                if (!triggerTarget->IsWithinDist(GetTarget(), max_range))
                    return;

                break;
            }
            case 1010:                                      // Curse of Idiocy
            {
                // TODO: spell casted by result in correct way mostly
                // BUT:
                // 1) target show casting at each triggered cast: target don't must show casting animation for any triggered spell
                //      but must show affect apply like item casting
                // 2) maybe aura must be replace by new with accumulative stat mods instead stacking

                // prevent cast by triggered auras
                if (casterGUID == triggerTarget->GetObjectGuid())
                    return;

                // stop triggering after each affected stats lost > 90
                int32 intelectLoss = 0;
                int32 spiritLoss = 0;

                Unit::AuraList const& mModStat = triggerTarget->GetAurasByType(SPELL_AURA_MOD_STAT);
                for (Unit::AuraList::const_iterator i = mModStat.begin(); i != mModStat.end(); ++i)
                {
                    if ((*i)->GetId() == 1010)
                    {
                        switch ((*i)->GetModifier()->m_miscvalue)
                        {
                            case STAT_INTELLECT:
                                intelectLoss += (*i)->GetModifier()->m_amount;
                                break;
                            case STAT_SPIRIT:
                                spiritLoss   += (*i)->GetModifier()->m_amount;
                                break;
                            default:
                                break;
                        }
                    }
                }

                if (intelectLoss <= -90 && spiritLoss <= -90)
                    return;

                break;
            }
            case 16191:                                     // Mana Tide
            {
                triggerTarget->CastCustomSpell(triggerTarget, trigger_spell_id, &m_modifier.m_amount, nullptr, nullptr, true, nullptr, this);
                return;
            }
            //Frost Trap Aura
            case 13810:
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;
                // Pour le talent hunt 'Piege' par exemple (chances de stun)
                caster->ProcDamageAndSpell(target, (PROC_FLAG_ON_TRAP_ACTIVATION | PROC_FLAG_SUCCESSFUL_AOE), PROC_FLAG_NONE, PROC_EX_NORMAL_HIT, 1, BASE_ATTACK, GetSpellProto());
                return;
            }
            // Thaddius negative charge
            case 28084:
            {
                // Lets only process the following when in naxx, otherwise it can become expensive as hell
                if (triggerTarget->GetMap()->GetId() != 533) 
                    break;
                Unit* caster = GetCaster();

                int numStacks = 0;
                // Finding the amount of other players within 13yd that has the same polarity
                Map::PlayerList const& pList = triggerTarget->GetMap()->GetPlayers();
                for (Map::PlayerList::const_iterator it = pList.begin(); it != pList.end(); ++it)
                {
                    Player* pPlayer = (*it).getSource();
                    if (pPlayer->GetGUID() == casterGUID) continue;
                    if (!pPlayer) continue;
                    if (pPlayer->isDead()) continue;
                    // 2d distance should be good enough
                    if (pPlayer->HasAura(28084) && caster->GetDistance2d(pPlayer) < 13.0f) // 13.0f taken from dbc
                    {
                        ++numStacks;
                    }
                }
                if (numStacks > 0)
                {
                    if (!triggerTarget->HasAura(29660))
                        triggerTarget->AddAura(29660);
                    triggerTarget->GetAura(29660, EFFECT_INDEX_0)->GetHolder()->SetStackAmount(numStacks);
                }
                else
                    triggerTarget->RemoveAurasDueToSpell(29659);
                break;
            }
            // Thaddius positive charge
            case 28059:
            {
                // Lets only process the following when in naxx, otherwise it can become expensive as hell
                if (triggerTarget->GetMap()->GetId() != 533)
                    break;
                Unit* caster = GetCaster();

                int numStacks = 0;
                // Finding the amount of other players within 13yd that has the same polarity
                Map::PlayerList const& pList = triggerTarget->GetMap()->GetPlayers();
                for (Map::PlayerList::const_iterator it = pList.begin(); it != pList.end(); ++it)
                {
                    Player* pPlayer = (*it).getSource();
                    if (!pPlayer) continue;
                    if (pPlayer->GetGUID() == triggerTarget->GetGUID()) continue;
                    if (pPlayer->isDead()) continue;
                    // 2d distance should be good enough
                    if (pPlayer->HasAura(28059) && caster->GetDistance2d(pPlayer) < 13.0f) // 13.0f taken from dbc
                    {
                        ++numStacks;
                    }
                }
                if (numStacks > 0)
                {
                    if (!triggerTarget->HasAura(29659))
                        triggerTarget->AddAura(29659);
                    triggerTarget->GetAura(29659, EFFECT_INDEX_0)->GetHolder()->SetStackAmount(numStacks);
                }
                else
                    triggerTarget->RemoveAurasDueToSpell(29659);
                break;
            }
            // Activate MG Turret
            case 25026:
            {
                if (target->GetPower(POWER_MANA) >= 10)
                {
                    target->ModifyPower(POWER_MANA, -10);
                    target->SendEnergizeSpellLog(target, 25026, -10, POWER_MANA);
                }
                else
                    target->RemoveAurasDueToSpell(25026);
                break;
            }
            // Flamethrower
            case 25027:
            {
                if (target->GetPower(POWER_MANA) >= 10)
                {
                    target->ModifyPower(POWER_MANA, -10);
                    target->SendEnergizeSpellLog(target, 25027, -10, POWER_MANA);
                }
                else
                    target->RemoveAurasDueToSpell(25027);
                break;
            }
        }
    }

    Unit* triggerCaster = triggerTarget;
    WorldObject* triggerTargetObject = nullptr;

    // for channeled spell cast applied from aura owner to channel target (persistent aura affects already applied to true target)
    // some periodic casts applied to targets, so need select proper caster (ex. 15790)
    if (IsChanneled() && GetSpellProto()->Effect[GetEffIndex()] != SPELL_EFFECT_PERSISTENT_AREA_AURA)
    {
        // interesting 2 cases: periodic aura at caster of channeled spell
        if (target->GetObjectGuid() == casterGUID)
        {
            triggerCaster = target;

            if (WorldObject* channelTarget = target->GetMap()->GetWorldObject(target->GetChannelObjectGuid()))
            {
                if (channelTarget->isType(TYPEMASK_UNIT))
                    triggerTarget = (Unit*)channelTarget;
                else
                    triggerTargetObject = channelTarget;
            }
        }
        // or periodic aura at caster channel target
        else if (Unit* caster = GetCaster())
        {
            if (target->GetObjectGuid() == caster->GetChannelObjectGuid())
            {
                triggerCaster = caster;
                triggerTarget = target;
            }
        }
    }

    // All ok cast by default case
    if (triggeredSpellInfo)
    {
        if (triggerTargetObject)
            triggerCaster->CastSpell(triggerTargetObject->GetPositionX(), triggerTargetObject->GetPositionY(), triggerTargetObject->GetPositionZ(),
                                     triggeredSpellInfo, true, nullptr, this, casterGUID);
        else
            triggerCaster->CastSpell(triggerTarget, triggeredSpellInfo, true, nullptr, this, casterGUID);
    }
    else
    {
        if (Unit* caster = GetCaster())
        {
            if (triggerTarget->GetTypeId() != TYPEID_UNIT || !sScriptMgr.OnEffectDummy(caster, GetId(), GetEffIndex(), (Creature*)triggerTarget))
                sLog.outError("Aura::TriggerSpell: Spell %u have 0 in EffectTriggered[%d], not handled custom case?", GetId(), GetEffIndex());
        }
    }
}

/*********************************************************/
/***                  AURA EFFECTS                     ***/
/*********************************************************/

void Aura::HandleAuraDummy(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    Unit *target = GetTarget();

    // AT APPLY
    if (apply)
    {
        switch (GetSpellProto()->SpellFamilyName)
        {
            case SPELLFAMILY_GENERIC:
            {
                switch (GetId())
                {
                    case 2584:                              // Waiting to Resurrect
                    {
                        // for cases where aura would re-apply and player is no longer in BG
                        if (Unit* caster = GetCaster())
                        {
                            if (Player* player = caster->ToPlayer())
                                if (!player->InBattleGround())
                                    player->RemoveAurasDueToSpell(2584);
                        }
                        return;
                    }
                    case 10255:                             // Stoned
                    {
                        if (Unit* caster = GetCaster())
                        {
                            if (caster->GetTypeId() != TYPEID_UNIT)
                                return;

                            caster->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            caster->addUnitState(UNIT_STAT_ROOT);
                        }
                        return;
                    }
                    case 13139:                             // net-o-matic
                    {
                        // root to self part of (root_target->charge->root_self sequence
                        if (Unit* caster = GetCaster())
                            caster->CastSpell(caster, 13138, true, nullptr, this);
                        GetHolder()->SetAuraDuration(0); // Remove aura (else stays for ever, and casts at login)
                        return;
                    }
                    case 26234:                             // Ragnaros Submerge Visual
                    {
                        if (Unit* caster = GetCaster())
                        {
                            caster->CastSpell(caster, 21107, true); // Ragnaros Submerge Fade
                            caster->CastSpell(caster, 21859, true); // Ragnaros Submerge Effect
                            caster->RemoveAurasDueToSpell(26234);   // Need remove Submerge Visual after apply
                        }
                        return;
                    }
                    case 22646:                             // Goblin Rocket Helmet
                    {
                        if (Unit* caster = GetCaster())
                            caster->CastSpell(caster, 13360, true);
                        return;
                    }
                    case 24596: // Intoxicating Venom
                    {
                        if (target)
                        {
                            m_isPeriodic            = true;
                            m_modifier.periodictime = 1000;
                        }
                        return;
                    }
                    case 29154:
                    {
                        Unit* caster = GetCaster();
                        if (!caster) break;
                        caster->HandleEmote(EMOTE_STATE_SUBMERGED);
                    }
                }
                break;
            }
            case SPELLFAMILY_SHAMAN:
                break;
        }
    }
    // AT REMOVE
    else
    {
        if (IsQuestTameSpell(GetId()) && target->isAlive())
        {
            Unit* caster = GetCaster();
            if (!caster || !caster->isAlive())
                return;

            uint32 finalSpellId = 0;
            switch (GetId())
            {
                case 19548:
                    finalSpellId = 19597;
                    break;
                case 19674:
                    finalSpellId = 19677;
                    break;
                case 19687:
                    finalSpellId = 19676;
                    break;
                case 19688:
                    finalSpellId = 19678;
                    break;
                case 19689:
                    finalSpellId = 19679;
                    break;
                case 19692:
                    finalSpellId = 19680;
                    break;
                case 19693:
                    finalSpellId = 19684;
                    break;
                case 19694:
                    finalSpellId = 19681;
                    break;
                case 19696:
                    finalSpellId = 19682;
                    break;
                case 19697:
                    finalSpellId = 19683;
                    break;
                case 19699:
                    finalSpellId = 19685;
                    break;
                case 19700:
                    finalSpellId = 19686;
                    break;
            }

            if (finalSpellId)
                caster->CastSpell(target, finalSpellId, true, nullptr, this);

            return;
        }

        switch (GetId())
        {
            case 126: // Kilrogg eye
                if (Unit* caster = GetCaster())
                    if (Player* casterPlayer = caster->ToPlayer())
                        if (Pet* guardian = caster->FindGuardianWithEntry(4277))
                            guardian->DisappearAndDie(); // Removes mod posses
                return;
            case 10255:                                     // Stoned
            {
                if (Unit* caster = GetCaster())
                {
                    if (caster->GetTypeId() != TYPEID_UNIT)
                        return;
                    caster->clearUnitState(UNIT_STAT_ROOT | UNIT_STAT_PENDING_ROOT);
                    caster->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                }
                return;
            }
            case 11403: // Dream Vision
                if (Unit* caster = GetCaster())
                    if (Player* casterPlayer = caster->ToPlayer())
                        if (Pet* guardian = caster->FindGuardianWithEntry(7863))
                            guardian->DisappearAndDie();

                return;
            case 11826:
                if (m_removeMode != AURA_REMOVE_BY_EXPIRE)
                    return;

                if (Unit* caster = GetCaster())
                    if (caster->GetTypeId() == TYPEID_PLAYER)
                        caster->CastSpell(target, 11828, true, caster->ToPlayer()->GetItemByGuid(GetCastItemGuid()), this);
                break;
            case 12479:                                     // Hex of Jammal'an
                target->CastSpell(target, 12480, true, nullptr, this);
                return;
            case 12774:                                     // (DND) Belnistrasz Idol Shutdown Visual
            {
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    return;

                // Idom Rool Camera Shake <- wtf, don't drink while making spellnames?
                if (Unit* caster = GetCaster())
                    caster->CastSpell(caster, 12816, true);

                return;
            }
            case 20939: // Undying Soul - Dummy aura used for Unstuck command
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                { 
                    if (Unit* caster = GetCaster())
                        if (Player* casterPlayer = caster->ToPlayer())
                        {
                            if (casterPlayer->isAlive() && !casterPlayer->isInCombat() && !casterPlayer->IsTaxiFlying())
                            {
                                casterPlayer->AddAura(15007); // Add Resurrection Sickness
                                if (sObjectMgr.GetClosestGraveYard(casterPlayer->GetPositionX(), casterPlayer->GetPositionY(), casterPlayer->GetPositionZ(), casterPlayer->GetMapId(), casterPlayer->GetTeam()))
                                    casterPlayer->DealDamage(casterPlayer, casterPlayer->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                                else
                                {
                                    // If there is no nearby graveyard, player's ghost would spawn at the same spot.
                                    WorldSafeLocsEntry const *ClosestGrave = casterPlayer->GetTeamId() ? sWorldSafeLocsStore.LookupEntry(10) : sWorldSafeLocsStore.LookupEntry(4);
                                    if (ClosestGrave)
                                    {
                                        casterPlayer->SetHealth(1);
                                        casterPlayer->TeleportTo(ClosestGrave->map_id, ClosestGrave->x, ClosestGrave->y, ClosestGrave->z, 0, 0);
                                    }
                                }
                            }
                        }
                }
                return;
            }
            case 24906:                                     // Emeriss Aura
            {
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    target->CastSpell(target, 24904, true, nullptr, this);

                return;
            }
            case 25042:                                     // Mark of Nature
            {
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    target->CastSpell(target, 25040, true, nullptr, this);
                return;
            }
            case 23183:                                     // Mark of Frost
            {
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    target->CastSpell(target, 23182, true, nullptr, this);
                    return;
            }
            case 28169:                                     // Mutating Injection
            {
                Unit* caster = GetCaster();
                // Mutagen Explosion
                if (m_removeMode == AuraRemoveMode::AURA_REMOVE_BY_DISPEL)
                {
                    caster->CastSpell(target, 28206, true);
                }
                else
                {
                    caster->CastSpell(target, 28206, true, nullptr, this);
                }
                
                // Summons Poison Cloud creature
                target->CastSpell(target, 28240, true, nullptr, this);
                return;
            }
            case 24324: // Ivina < Nostalrius > : Hakkar
            {
                target->RemoveAurasDueToSpell(24321);
                return;
            }
            case 28059: // Thaddius positive charge, removing aplify effect on remove
            {
                if (target->HasAura(29659))
                    target->RemoveAurasDueToSpell(29659);
                break;
            }
            case 28084: // Thaddius negative charge, removing aplify effect on remove
            {
                if (target->HasAura(29660))
                    target->RemoveAurasDueToSpell(29660);
                break;
            }
        }

        /*if (m_removeMode == AURA_REMOVE_BY_DEATH) // redundant, AM is cancelled in aura holder removal
        {
            // Stop caster Arcane Missle chanelling on death
            if (GetSpellProto()->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_ARCANE_MISSILES_CHANNEL>())
            {
                if (Unit* caster = GetCaster())
                    caster->InterruptSpell(CURRENT_CHANNELED_SPELL);

                return;
            }
        }*/
    }

    // AT APPLY & REMOVE

    switch (GetSpellProto()->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch (GetId())
            {
                case 6606:                                  // Self Visual - Sleep Until Cancelled (DND)
                {
                    if (apply)
                    {
                        target->SetStandState(UNIT_STAND_STATE_SLEEP);
                        target->addUnitState(UNIT_STAT_ROOT);
                    }
                    else
                    {
                        target->clearUnitState(UNIT_STAT_ROOT);
                        target->SetStandState(UNIT_STAND_STATE_STAND);
                    }

                    return;
                }
                case 24658:                                 // Unstable Power
                {
                    if (apply)
                    {
                        Unit* caster = GetCaster();
                        if (!caster)
                            return;

                        caster->CastSpell(target, 24659, true, nullptr, nullptr, GetCasterGuid());
                    }
                    else
                        target->RemoveAurasDueToSpell(24659);
                    return;
                }
                case 24661:                                 // Restless Strength
                {
                    if (apply)
                    {
                        Unit* caster = GetCaster();
                        if (!caster)
                            return;

                        caster->CastSpell(target, 24662, true, nullptr, nullptr, GetCasterGuid());
                    }
                    else
                        target->RemoveAurasDueToSpell(24662);
                    return;
                }
                case 29266:                                 // Permanent Feign Death
                {
                    // Unclear what the difference really is between them.
                    // Some has effect1 that makes the difference, however not all.
                    // Some appear to be used depending on creature location, in water, at solid ground, in air/suspended, etc
                    // For now, just handle all the same way
                    if (target->GetTypeId() == TYPEID_UNIT)
                        target->SetFeignDeath(apply);

                    return;
                }
                case 10848: // Shroud of Death
                case 22650: // Ghost Visual
                case 27978: // Shroud of Death
                    if (apply)
                        target->m_AuraFlags |= UNIT_AURAFLAG_ALIVE_INVISIBLE;
                    else
                        target->m_AuraFlags |= ~UNIT_AURAFLAG_ALIVE_INVISIBLE;
                    return;
            }
            break;
        }
        case SPELLFAMILY_DRUID:
        {
            // Predatory Strikes
            if (target->GetTypeId() == TYPEID_PLAYER && GetSpellProto()->SpellIconID == 1563)
            {
                ((Player*)target)->UpdateAttackPowerAndDamage();
                return;
            }
            // Enrage
            if ((target->GetTypeId() == TYPEID_PLAYER) && (GetId() == 5229))
            {
                ((Player*)target)->UpdateArmor(); // Spell managed in UpdateArmor()
                return;
            }
            break;
        }
        case SPELLFAMILY_ROGUE:
            break;
        case SPELLFAMILY_HUNTER:
            break;
        case SPELLFAMILY_SHAMAN:
        {
            switch (GetId())
            {
                case 6495:                                  // Sentry Totem
                {
                    if (target->GetTypeId() != TYPEID_PLAYER)
                        return;

                    Totem* totem = target->GetTotem(TOTEM_SLOT_AIR);

                    if (totem && apply)
                        ((Player*)target)->GetCamera().SetView(totem);
                    else
                        ((Player*)target)->GetCamera().ResetView();

                    return;
                }
            }
            // Improved Weapon Totems
            if (GetSpellProto()->SpellIconID == 57 && target->GetTypeId() == TYPEID_PLAYER)
            {
                if (apply)
                {
                    switch (m_effIndex)
                    {
                        case 0:
                            // Windfury Totem
                            m_spellmod = new SpellModifier(SPELLMOD_EFFECT1, SPELLMOD_PCT, m_modifier.m_amount, GetId(), UI64LIT(0x00200000000));
                            break;
                        case 1:
                            // Flametongue Totem
                            m_spellmod = new SpellModifier(SPELLMOD_EFFECT1, SPELLMOD_PCT, m_modifier.m_amount, GetId(), UI64LIT(0x00400000000));
                            break;
                        default:
                            return;
                    }
                }

                ((Player*)target)->AddSpellMod(m_spellmod, apply);
                return;
            }
            break;
        }
    }

    // pet auras
    if (PetAura const* petSpell = sSpellMgr.GetPetAura(GetId()))
    {
        if (apply)
            target->AddPetAura(petSpell);
        else
            target->RemovePetAura(petSpell);
        return;
    }

    if (GetEffIndex() == EFFECT_INDEX_0 && target->GetTypeId() == TYPEID_PLAYER)
    {
        SpellAreaForAreaMapBounds saBounds = sSpellMgr.GetSpellAreaForAuraMapBounds(GetId());
        if (saBounds.first != saBounds.second)
        {
            uint32 zone, area;
            target->GetZoneAndAreaId(zone, area);

            for (SpellAreaForAreaMap::const_iterator itr = saBounds.first; itr != saBounds.second; ++itr)
            {
                // some auras remove at aura remove
                if (!itr->second->IsFitToRequirements((Player*)target, zone, area))
                    target->RemoveAurasDueToSpell(itr->second->spellId);
                // some auras applied at aura apply
                else if (itr->second->autocast)
                {
                    if (!target->HasAura(itr->second->spellId, EFFECT_INDEX_0))
                        target->CastSpell(target, itr->second->spellId, true);
                }
            }
        }
    }

    // script has to "handle with care", only use where data are not ok to use in the above code.
    if (target->GetTypeId() == TYPEID_UNIT)
        sScriptMgr.OnAuraDummy(this, apply);
}

void Aura::HandleAuraMounted(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(m_modifier.m_miscvalue);
        if (!ci)
        {
            sLog.outErrorDb("AuraMounted: `creature_template`='%u' not found in database (only need it modelid)", m_modifier.m_miscvalue);
            return;
        }

        uint32 display_id = Creature::ChooseDisplayId(ci);
        CreatureModelInfo const *minfo = sObjectMgr.GetCreatureModelRandomGender(display_id);
        if (minfo)
            display_id = minfo->modelid;

        target->Mount(display_id, GetId());
    }
    else
        target->Unmount(true);
}

void Aura::HandleAuraWaterWalk(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    WorldPacket data;
    if (apply)
        data.Initialize(SMSG_MOVE_WATER_WALK, 8 + 4);
    else
        data.Initialize(SMSG_MOVE_LAND_WALK, 8 + 4);
    data << GetTarget()->GetPackGUID();
    data << uint32(0);

    if (Player* t = GetTarget()->ToPlayer())
    {
        t->GetSession()->SendPacket(&data);
        t->GetCheatData()->OrderSent(&data);
    }
    else
        GetTarget()->SendMovementMessageToSet(std::move(data), true);
}

void Aura::HandleAuraFeatherFall(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;
    WorldPacket data;
    if (apply)
        data.Initialize(SMSG_MOVE_FEATHER_FALL, 8 + 4);
    else
        data.Initialize(SMSG_MOVE_NORMAL_FALL, 8 + 4);
    data << GetTarget()->GetPackGUID();
    data << uint32(0);

    if (Player* t = GetTarget()->ToPlayer())
    {
        t->GetSession()->SendPacket(&data);
        t->GetCheatData()->OrderSent(&data);
        // start fall from current height
        if (!apply)
            t->SetFallInformation(0, t->GetPositionZ());
    }
    else
        GetTarget()->SendMovementMessageToSet(std::move(data), true);
}

void Aura::HandleAuraHover(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    WorldPacket data;
    if (apply)
        data.Initialize(SMSG_MOVE_SET_HOVER, 8 + 4);
    else
        data.Initialize(SMSG_MOVE_UNSET_HOVER, 8 + 4);
    data << GetTarget()->GetPackGUID();
    data << uint32(0);
    GetTarget()->SendMovementMessageToSet(std::move(data), true);
    if (Player* t = GetTarget()->ToPlayer())
        t->GetCheatData()->OrderSent(&data);
}

void Aura::HandleWaterBreathing(bool /*apply*/, bool /*Real*/)
{
    // update timers in client
    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        ((Player*)GetTarget())->UpdateMirrorTimers();
}

std::pair<unsigned int, float> getShapeshiftModelInfo(ShapeshiftForm form, Unit *target){
    unsigned int modelid = 0;
    float mod = 1;
    switch (form)
    {
    case FORM_CAT:
        if (Player::TeamForRace(target->getRace()) == ALLIANCE)
            modelid = 892;
        else
            modelid = 8571;
        mod = 0.80f;
        break;
    case FORM_TRAVEL:
        modelid = 632;
        mod = 0.80f;
        break;
    case FORM_AQUA:
        modelid = 2428;
        mod = 0.80f;
        break;
    case FORM_BEAR:
        if (Player::TeamForRace(target->getRace()) == ALLIANCE)
            modelid = 2281;
        else
            modelid = 2289;
        break;
    case FORM_GHOUL:
        if (Player::TeamForRace(target->getRace()) == ALLIANCE)
            modelid = 10045;
        break;
    case FORM_DIREBEAR:
        if (Player::TeamForRace(target->getRace()) == ALLIANCE)
            modelid = 2281;
        else
            modelid = 2289;
        break;
    case FORM_CREATUREBEAR:
        modelid = 902;
        break;
    case FORM_GHOSTWOLF:
        modelid = 4613;
        mod = 0.80f;
        break;
    case FORM_MOONKIN:
        if (Player::TeamForRace(target->getRace()) == ALLIANCE)
            modelid = 15374;
        else
            modelid = 15375;
        break;
    case FORM_TREE:
        modelid = 864;
        break;
    case FORM_SPIRITOFREDEMPTION:
        modelid = 16031;
        break;
    /*case FORM_BATTLESTANCE:
    case FORM_BERSERKERSTANCE:
    case FORM_DEFENSIVESTANCE:
    case FORM_AMBIENT:
    case FORM_SHADOW:
    case FORM_STEALTH:*/
    default:
        break;
    }
    return {modelid,mod};
}

void Aura::HandleAuraModShapeshift(bool apply, bool Real)
{
    if (!Real)
        return;
    ShapeshiftForm form = ShapeshiftForm(m_modifier.m_miscvalue);

    Unit *target = GetTarget();

    SpellShapeshiftFormEntry const* ssEntry = sSpellShapeshiftFormStore.LookupEntry(form);
    if (!ssEntry)
    {
        sLog.outError("Unknown shapeshift form %u in spell %u", form, GetId());
        return;
    }

    // remove polymorph before changing display id to keep new display id
    switch (form)
    {
        case FORM_CAT:
        case FORM_TREE:
        case FORM_TRAVEL:
        case FORM_AQUA:
        case FORM_BEAR:
        case FORM_DIREBEAR:
        case FORM_MOONKIN:
        {
            // remove movement affects
            target->RemoveSpellsCausingAura(SPELL_AURA_MOD_ROOT, GetHolder());
            Unit::AuraList const& slowingAuras = target->GetAurasByType(SPELL_AURA_MOD_DECREASE_SPEED);
            for (Unit::AuraList::const_iterator iter = slowingAuras.begin(); iter != slowingAuras.end();)
            {
                SpellEntry const* aurSpellInfo = (*iter)->GetSpellProto();

                uint32 aurMechMask = aurSpellInfo->GetAllSpellMechanicMask();

                // If spell that caused this aura has Croud Control or Daze effect
                if ((aurMechMask & MECHANIC_NOT_REMOVED_BY_SHAPESHIFT) ||
                        // some Daze spells have these parameters instead of MECHANIC_DAZE (skip snare spells)
                        (aurSpellInfo->SpellIconID == 15 && aurSpellInfo->Dispel == 0 &&
                        (aurMechMask & (1 << (MECHANIC_SNARE - 1))) == 0))
                {
                    ++iter;
                    continue;
                }

                // All OK, remove aura now
                target->RemoveAurasDueToSpellByCancel(aurSpellInfo->Id);
                iter = slowingAuras.begin();
            }

            break;
        }
        case FORM_BERSERKERSTANCE:
        {
            // do nothing when removing Nefarian warrior call
            if (!apply && GetSpellProto()->Id == 23397)
                return;
        }
        default:
            break;
    }

    std::pair<unsigned int, float> info = getShapeshiftModelInfo(form, target);
    unsigned int modelid = info.first;
    if (modelid > 0 && !target->getTransForm())
    {
        if (apply)
        {
            target->setTransformScale(info.second);
            target->SetDisplayId(modelid);
        }
        else
        {
            target->resetTransformScale();
            target->SetDisplayId(target->GetNativeDisplayId());
        }
    }

    if (apply)
    {


        Powers PowerType = POWER_MANA;
        switch (form)
        {
        case FORM_CAT:
            PowerType = POWER_ENERGY;
            break;
        case FORM_BEAR:
        case FORM_DIREBEAR:
            PowerType = POWER_RAGE;
            break;
        /*case FORM_TRAVEL:
        case FORM_AQUA:
        case FORM_GHOUL:
        case FORM_CREATUREBEAR:
        case FORM_GHOSTWOLF:
        case FORM_MOONKIN:
        case FORM_AMBIENT:
        case FORM_SHADOW:
        case FORM_STEALTH:
        case FORM_TREE:
        case FORM_SPIRITOFREDEMPTION:
            break;*/
        case FORM_BATTLESTANCE:
        case FORM_BERSERKERSTANCE:
        case FORM_DEFENSIVESTANCE:
            PowerType = POWER_RAGE;
            break;
        default:
            break;
        }
        // remove other shapeshift before applying a new one
        target->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT, GetHolder());

        if (PowerType != POWER_MANA)
        {
            // reset power to default values only at power change
            uint32 powaa = target->GetPower(PowerType);
            if (target->getPowerType() != PowerType)
                target->setPowerType(PowerType);

            switch (form)
            {
                case FORM_CAT:
                case FORM_BEAR:
                case FORM_DIREBEAR:
                {
                    // get furor proc chance
                    int32 furorChance = 0;
                    Unit::AuraList const& mDummy = target->GetAurasByType(SPELL_AURA_DUMMY);
                    for (Unit::AuraList::const_iterator i = mDummy.begin(); i != mDummy.end(); ++i)
                    {
                        if ((*i)->GetSpellProto()->SpellIconID == 238)
                        {
                            furorChance = (*i)->GetModifier()->m_amount;
                            break;
                        }
                    }

                    if (m_modifier.m_miscvalue == FORM_CAT)
                    {
                        target->SetPower(POWER_ENERGY, 0);
                        if (irand(1, 100) <= furorChance)
                            target->CastSpell(target, 17099, true, nullptr, this);
                    }
                    else
                    {
                        target->SetPower(POWER_RAGE, powaa);
                        if (irand(1, 100) <= furorChance)
                            target->CastSpell(target, 17057, true, nullptr, this);
                    }
                    break;
                }
                case FORM_BATTLESTANCE:
                case FORM_DEFENSIVESTANCE:
                case FORM_BERSERKERSTANCE:
                {
                    uint32 Rage_val = 0;
                    //Tactical mastery
                    if (target->GetTypeId() == TYPEID_PLAYER)
                    {
                        Unit::AuraList const& aurasOverrideClassScripts = target->GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
                        for (Unit::AuraList::const_iterator iter = aurasOverrideClassScripts.begin(); iter != aurasOverrideClassScripts.end(); ++iter)
                        {
                            // select by script id
                            switch ((*iter)->GetModifier()->m_miscvalue)
                            {
                                case 831:
                                    Rage_val =  50;
                                    break;
                                case 832:
                                    Rage_val = 100;
                                    break;
                                case 833:
                                    Rage_val = 150;
                                    break;
                                case 834:
                                    Rage_val = 200;
                                    break;
                                case 835:
                                    Rage_val = 250;
                                    break;
                            }
                            if (Rage_val != 0)
                                break;
                        }
                    }
                    if (target->GetPower(POWER_RAGE) > Rage_val)
                        target->SetPower(POWER_RAGE, Rage_val);
                    break;
                }
                default:
                    break;
            }
        }

        target->SetShapeshiftForm(form);
    }
    else
    {
        if (target->getClass() == CLASS_DRUID)
        {
            target->setPowerType(POWER_MANA);
            target->SetPower(POWER_RAGE, 0);
        }

        target->SetShapeshiftForm(FORM_NONE);
    }

    // adding/removing linked auras
    // add/remove the shapeshift aura's boosts
    HandleShapeshiftBoosts(apply);
    target->UpdateModelData();

    if (target->GetTypeId() == TYPEID_PLAYER)
        ((Player*)target)->InitDataForForm();
}

void Aura::HandleAuraTransform(bool apply, bool Real)
{
    Unit *target = GetTarget();
    if (apply)
    {
        float mod_x = 1;
        uint32 model_id = 0;

        // Discombobulate removes mount auras.
        if (GetId() == 4060 && Real)
            target->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

        // update active transform spell only not set or not overwriting negative by positive case
        if (!target->getTransForm() || !IsPositiveSpell(GetId()) || IsPositiveSpell(target->getTransForm()))
        {
            if (GetId() == 23603)   // Ustaag <Nostalrius> : Nefarian Class Call Mage
            {
                int rand = 0;
                rand = urand(0, 2);
                switch (rand)
                {
                    case 0:
                        model_id = 1060;
                        break;
                    case 1:
                        model_id = 4473;
                        break;
                    case 2:
                        model_id = 7898;
                        break;
                }
            }
            else if (m_modifier.m_miscvalue == 0)         // special case (spell specific functionality)
            {
                switch (GetId())
                {
                    case 16739:                                 // Orb of Deception
                    {
                        uint8 gender = sObjectMgr.GetCreatureModelInfo(target->GetDisplayId())->gender;
                        switch (target->getRace())
                        {
                        case RACE_TROLL:
                            model_id = gender == GENDER_MALE ?
                                        10135 :
                                        10134 ;
                            break;
                        case RACE_TAUREN:
                            model_id = gender == GENDER_MALE ?
                                        10136 :
                                        10147 ;
                            break;
                        case RACE_HUMAN:
                            model_id = gender == GENDER_MALE ?
                                        10137 :
                                        10138 ;
                            break;
                        case RACE_ORC:
                            model_id = gender == GENDER_MALE ?
                                        10139 :
                                        10140 ;
                            break;
                        case RACE_DWARF:
                            model_id = gender == GENDER_MALE ?
                                        10141 :
                                        10142 ;
                            break;
                        case RACE_NIGHTELF:
                            model_id = gender == GENDER_MALE ?
                                        10143 :
                                        10144 ;
                            break;
                        case RACE_UNDEAD:
                            model_id = gender == GENDER_MALE ?
                                        10146 :
                                        10145 ;
                            break;
                        case RACE_GNOME:
                            if (gender == GENDER_MALE)
                            {
                                model_id = 10148;
                                mod_x = DEFAULT_TAUREN_MALE_SCALE;
                            }
                            else
                            {
                                model_id = 10149;
                                mod_x = DEFAULT_TAUREN_FEMALE_SCALE;
                            }
                            break;
                        default:
                            break;
                        }
                        break;
                    }
                    default:
                        sLog.outError("Aura::HandleAuraTransform, spell %u does not have creature entry defined, need custom defined model.", GetId());
                        break;
                }
            }
            else
            {
                CreatureInfo const * ci = ObjectMgr::GetCreatureTemplate(m_modifier.m_miscvalue);
                if (!ci)
                {
                    model_id = 16358;                           // pig pink ^_^
                    sLog.outError("Auras: unknown creature id = %d (only need its modelid) Form Spell Aura Transform in Spell ID = %d", m_modifier.m_miscvalue, GetId());
                }
                else
                    model_id = Creature::ChooseDisplayId(ci);   // Will use the default model here

                // creature case, need to update equipment
                if (ci && target->GetTypeId() == TYPEID_UNIT)
                    ((Creature*)target)->LoadEquipment(ci->equipmentId, true);
            }

            if (model_id)
            {
                target->SetDisplayId(model_id);
                target->setTransformScale(mod_x);
            }
            target->setTransForm(GetId());
        }
    }
    else
    {
        //reset cosmetics only if it's the current transform
        if (target->getTransForm() == GetId())
        {
            target->setTransForm(0);
            target->SetDisplayId(target->GetNativeDisplayId());
            target->resetTransformScale();

            // apply default equipment for creature case
            if (target->GetTypeId() == TYPEID_UNIT)
                ((Creature*)target)->LoadEquipment(((Creature*)target)->GetCreatureInfo()->equipmentId, true);


            // re-apply some from still active with preference negative cases
            Unit::AuraList const& otherTransforms = target->GetAurasByType(SPELL_AURA_TRANSFORM);
            if (!otherTransforms.empty())
            {
                // look for other transform auras
                Aura* handledAura = *otherTransforms.rbegin();
                for (Unit::AuraList::const_reverse_iterator i = otherTransforms.rbegin(); i != otherTransforms.rend(); ++i)
                {
                    // negative auras are preferred
                    if (!IsPositiveSpell((*i)->GetSpellProto()->Id))
                    {
                        handledAura = *i;
                        break;
                    }
                }
                handledAura->HandleAuraTransform(true,false);
            }
            else //reapply shapeshifting, there should be only one.
            {
                std::pair<unsigned int, float> info = getShapeshiftModelInfo(target->GetShapeshiftForm(), target);
                if (info.first)
                {
                    target->SetDisplayId(info.first);
                    target->setTransformScale(info.second);
                }
            }
        }
    }
}

void Aura::HandleForceReaction(bool apply, bool Real)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (!Real)
        return;

    Player* player = (Player*)GetTarget();

    uint32 faction_id = m_modifier.m_miscvalue;
    ReputationRank faction_rank = ReputationRank(m_modifier.m_amount);

    player->GetReputationMgr().ApplyForceReaction(faction_id, faction_rank, apply);
    player->GetReputationMgr().SendForceReactions();

    // stop fighting if at apply forced rank friendly or at remove real rank friendly
    if ((apply && faction_rank >= REP_FRIENDLY) || (!apply && player->GetReputationRank(faction_id) >= REP_FRIENDLY))
        player->StopAttackFaction(faction_id);

    // sorry, need to hack ashbringer to make you friendly with scarlet crusade too
    if (m_spellAuraHolder && m_spellAuraHolder->GetSpellProto() &&  m_spellAuraHolder->GetId() == 28282)
    {
        uint32 scarlet_crusade_faction_id = 56;
        ReputationRank scarlet_crusade_rank = ReputationRank(7);
        player->GetReputationMgr().ApplyForceReaction(scarlet_crusade_faction_id, scarlet_crusade_rank, apply);
        player->GetReputationMgr().SendForceReactions();

        // stop fighting if at apply forced rank friendly or at remove real rank friendly
        if ((apply && scarlet_crusade_rank >= REP_FRIENDLY) || (!apply && player->GetReputationRank(scarlet_crusade_faction_id) >= REP_FRIENDLY))
            player->StopAttackFaction(scarlet_crusade_faction_id);
    }

    if (!apply && player->GetZoneId() == 1377 && GetId() == 29519 && m_removeMode == AURA_REMOVE_BY_DEATH)
    {
        // OutdoorPVP Silithus : Perte du buff silithyste
        if (ZoneScript* pScript = player->GetZoneScript())
            pScript->HandleDropFlag(player, GetId());
    }

}

void Aura::HandleAuraModSkill(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    uint32 prot = GetSpellProto()->EffectMiscValue[m_effIndex];

    // Can't modify an unknown skill
    if (!GetTarget()->ToPlayer()->HasSkill(prot))
    {
        // Revert m_applied assigned in Aura::ApplyModidier
        m_applied = !apply;
        return;
    }

    int32 points = GetModifier()->m_amount;

    ((Player*)GetTarget())->ModifySkillBonus(prot, (apply ? points : -points), m_modifier.m_auraname == SPELL_AURA_MOD_SKILL_TALENT);
    if (prot == SKILL_DEFENSE)
        ((Player*)GetTarget())->UpdateDefenseBonusesMod();
}
void Aura::HandleChannelDeathItem(bool apply, bool Real)
{
    if (Real && !apply)
    {
        if (m_removeMode != AURA_REMOVE_BY_DEATH)
            return;
        // Item amount
        if (m_modifier.m_amount <= 0)
            return;

        SpellEntry const *spellInfo = GetSpellProto();
        if (spellInfo->EffectItemType[m_effIndex] == 0)
            return;

        Unit* victim = GetTarget();
        Unit* caster = GetCaster();
        if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
            return;
        // Demonistes : un seul fragment d'ame si on caste "Brulure de l'ombre" et "Siphon d'ame" sur une cible.
        if (spellInfo->SpellFamilyName == SPELLFAMILY_WARLOCK)
            if (victim->HasAuraTypeByCaster(SPELL_AURA_CHANNEL_DEATH_ITEM, caster->GetObjectGuid()))
                return;

        // Soul Shard (target req.)
        if (spellInfo->EffectItemType[m_effIndex] == 6265)
        {
            // Only from non-grey units
            if (!((Player*)caster)->isHonorOrXPTarget(victim) ||
                    (victim->GetTypeId() == TYPEID_UNIT && !victim->ToCreature()->IsTappedBy(caster->ToPlayer())))
                return;
        }

        //Adding items
        uint32 noSpaceForCount = 0;
        uint32 count = m_modifier.m_amount;

        ItemPosCountVec dest;
        InventoryResult msg = ((Player*)caster)->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, spellInfo->EffectItemType[m_effIndex], count, &noSpaceForCount);
        if (msg != EQUIP_ERR_OK)
        {
            count -= noSpaceForCount;
            ((Player*)caster)->SendEquipError(msg, nullptr, nullptr, spellInfo->EffectItemType[m_effIndex]);
            if (count == 0)
                return;
        }

        Item* newitem = ((Player*)caster)->StoreNewItem(dest, spellInfo->EffectItemType[m_effIndex], true);
        ((Player*)caster)->SendNewItem(newitem, count, true, true);
    }
}

void Aura::HandleBindSight(bool apply, bool /*Real*/)
{
    Unit* caster = GetCaster();
    if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Camera& camera = ((Player*)caster)->GetCamera();
    if (apply)
        camera.SetView(GetTarget());
    else
        camera.ResetView();
}

void Aura::HandleFarSight(bool apply, bool /*Real*/)
{
    Unit* caster = GetCaster();
    if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Camera& camera = ((Player*)caster)->GetCamera();
    if (apply)
        camera.SetView(GetTarget());
    else
        camera.ResetView();
}

void Aura::HandleAuraTrackCreatures(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (apply)
        GetTarget()->RemoveNoStackAurasDueToAuraHolder(GetHolder());

    if (apply)
        GetTarget()->SetFlag(PLAYER_TRACK_CREATURES, uint32(1) << (m_modifier.m_miscvalue - 1));
    else
        GetTarget()->RemoveFlag(PLAYER_TRACK_CREATURES, uint32(1) << (m_modifier.m_miscvalue - 1));
}

void Aura::HandleAuraTrackResources(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (apply)
        GetTarget()->RemoveNoStackAurasDueToAuraHolder(GetHolder());

    if (apply)
        GetTarget()->SetFlag(PLAYER_TRACK_RESOURCES, uint32(1) << (m_modifier.m_miscvalue - 1));
    else
        GetTarget()->RemoveFlag(PLAYER_TRACK_RESOURCES, uint32(1) << (m_modifier.m_miscvalue - 1));
}

void Aura::HandleAuraTrackStealthed(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (apply)
        GetTarget()->RemoveNoStackAurasDueToAuraHolder(GetHolder());

    GetTarget()->ApplyModByteFlag(PLAYER_FIELD_BYTES, 0, PLAYER_FIELD_BYTE_TRACK_STEALTHED, apply);
}

void Aura::HandleAuraModScale(bool apply, bool /*Real*/)
{
    GetTarget()->ApplyPercentModFloatValue(OBJECT_FIELD_SCALE_X, float(m_modifier.m_amount), apply);
    GetTarget()->UpdateModelData();
}

void Aura::HandleModPossess(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* target = GetTarget();
    Unit* caster = GetCaster();
    if (!caster || !target)
        return;
    caster->ModPossess(target, apply, m_removeMode);
    target->AddThreat(caster,target->GetHealth(), false, GetSpellSchoolMask(GetSpellProto()));

    if (!apply && GetId() == 24937) // Controlling Steam Tonk
    {
        target->CastSpell(target, 27771, true); // Cast Damaged Tonk
        caster->CastSpell(caster, 9179, true); // Cast 3 sec Stun on self
        caster->RemoveAurasDueToSpell(24935); // Unroot player
    }
}

void Unit::ModPossess(Unit* target, bool apply, AuraRemoveMode m_removeMode)
{
    // not possess yourself
    if (target == this)
        return;

    Unit* caster = this;

    Player* p_caster = nullptr;
    if (caster->IsCreature() && target->IsPlayer())
    {
        // Creature cast CM sur Joueur
    }
    else if (caster->IsPlayer())
        p_caster = (Player*)caster;
    else
        return;

    if (apply)
    {
        FactionTemplateEntry const* origFactionTemplate = target->getFactionTemplateEntry();
        target->addUnitState(UNIT_STAT_CONTROLLED);

        target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);
        target->SetCharmerGuid(caster->GetObjectGuid());
        target->setFaction(caster->getFaction());

        // target should became visible at SetView call(if not visible before):
        // otherwise client\p_caster will ignore packets from the target(SetClientControl for example)
        p_caster->GetCamera().SetView(target);

        caster->SetCharm(target);
        p_caster->SetMover(target);

        target->CombatStop(true);

        if (CharmInfo *charmInfo = target->InitCharmInfo(target))
        {
            charmInfo->InitPossessCreateSpells();
            charmInfo->SetReactState(REACT_PASSIVE);
            charmInfo->SetCommandState(COMMAND_STAY);
            charmInfo->SetOriginalFactionTemplate(origFactionTemplate);
        }

        p_caster->PossessSpellInitialize();

        if (Creature* pTargetCrea = target->ToCreature())
            if (pTargetCrea->AI()->SwitchAiAtControl())
                pTargetCrea->AIM_Initialize();

        if (target->IsPlayer() && !caster->IsPlayer())
                target->ToPlayer()->SetControlledBy(caster);
        // Les mobs doivent attaquer celui qui est CM.
        // On appelle donc 'MoveInLineOfSight' pour les mobs a cote.
        target->ScheduleAINotify(0);
        target->UpdateControl();
        if (target->hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED | UNIT_STAT_ROOT | UNIT_STAT_PENDING_ROOT))
            target->SetMovement(MOVE_ROOT);
        target->StopMoving();
    }
    else
    {
        // On transfert la menace vers celui qui a CM
        target->TransferAttackersThreatTo(caster);

        // spell is interrupted on channeled aura removal, don't need to interrupt here
        //caster->InterruptSpell(CURRENT_CHANNELED_SPELL);

        p_caster->SetMover(nullptr);

        caster->SetCharm(nullptr);
        caster->UpdateControl();

        // there is a possibility that target became invisible for client\p_caster at ResetView call:
        // it must be called after movement control unapplying, not before! the reason is same as at aura applying
        p_caster->GetCamera().ResetView();
        p_caster->RemovePetActionBar();

        // on delete only do caster related effects
        if (m_removeMode == AURA_REMOVE_BY_DELETE)
            return;

        target->clearUnitState(UNIT_STAT_CONTROLLED);

        target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);

        target->SetCharmerGuid(ObjectGuid());

        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            Player* p_target = ((Player*)target);
            p_target->RemoveAI();
            p_target->RelocateToLastClientPosition(); // Movement interpolation - prevent undermap.
        }

        target->RestoreFaction();
        target->CombatStop(true);
        target->StopMoving(true);
        target->UpdateControl();

        if (Creature* pCreature = target->ToCreature())
        {
            if (pCreature->AI() && pCreature->AI()->SwitchAiAtControl())
                pCreature->AIM_Initialize();

            pCreature->AttackedBy(caster);
        }
        // cast mind exhaustion on self when the posess possess ends if the creature
        // is death knight understudy (razuvious). 
        // todo: if there is a way to know a possess has ended through scriptAI, fix this.
        if (target->GetEntry() == 16803)
        {
            target->CastSpell(target, 29051, true); 
        }
    }
    target->SetUnitMovementFlags(MOVEFLAG_NONE);
}

void Aura::HandleModPossessPet(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* caster = GetCaster();
    if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Unit* target = GetTarget();
    if (target->GetTypeId() != TYPEID_UNIT || !((Creature*)target)->IsPet())
        return;

    Pet* pet = (Pet*)target;

    Player* p_caster = (Player*)caster;
    p_caster->ModPossessPet(pet, apply, m_removeMode);
}

void Player::ModPossessPet(Pet* pet, bool apply, AuraRemoveMode m_removeMode)
{
    Player* p_caster = this;
    Camera& camera = p_caster->GetCamera();

    if (apply)
    {
        pet->addUnitState(UNIT_STAT_CONTROLLED);

        // target should became visible at SetView call(if not visible before):
        // otherwise client\p_caster will ignore packets from the target(SetClientControl for example)
        camera.SetView(pet);

        p_caster->SetCharm(pet);
        p_caster->SetMover(pet);

        pet->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);
        pet->SetCharmerGuid(p_caster->GetObjectGuid());
        pet->SetPossesorGuid(p_caster->GetObjectGuid());

        pet->StopMoving();
        pet->GetMotionMaster()->Clear(false);
        pet->GetMotionMaster()->MoveIdle();
        pet->UpdateControl();
        pet->SetWalk(p_caster->IsWalking());

        if (CharmInfo* charmInfo = pet->GetCharmInfo())
        {
            charmInfo->SetIsAtStay(false);
            charmInfo->SetIsReturning(false);
            charmInfo->SetIsFollowing(false);
        }
    }
    else
    {
        p_caster->SetCharm(nullptr);
        p_caster->SetMover(nullptr);

        // there is a possibility that target became invisible for client\p_caster at ResetView call:
        // it must be called after movement control unapplying, not before! the reason is same as at aura applying
        camera.ResetView();
        pet->UpdateControl();
        pet->SetCharmerGuid(ObjectGuid());
        pet->SetPossesorGuid(ObjectGuid());

        // To avoid moving the wrong unit on server side between cancellation and mover swap
        // the pet has the controlled state removed in WorldSession::HandleSetActiveMoverOpcode
    }
}

void Aura::HandleModCharm(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit *target = GetTarget();

    // not charm yourself
    if (GetCasterGuid() == target->GetObjectGuid())
        return;

    Unit* caster = GetCaster();

    if (apply)
    {
        if (!caster)
            return;

        FactionTemplateEntry const* origFactionTemplate = target->getFactionTemplateEntry();

        // is it really need after spell check checks?
        target->RemoveSpellsCausingAura(SPELL_AURA_MOD_CHARM, GetHolder());
        target->RemoveSpellsCausingAura(SPELL_AURA_MOD_POSSESS, GetHolder());
        target->RemoveSpellsCausingAura(SPELL_AURA_AOE_CHARM, GetHolder()); // this is a bit dodgy, like most removals of SPELL_AURA_AOE_CHARM 

        target->SetCharmerGuid(GetCasterGuid());
        target->setFaction(caster->getFaction());
        target->CastStop(target == caster ? GetId() : 0);
        caster->SetCharm(target);

        target->CombatStop(true);
        target->DeleteThreatList();
        target->getHostileRefManager().deleteReferences();

        CharmInfo *charmInfo = target->InitCharmInfo(target);
        charmInfo->InitCharmCreateSpells();
        charmInfo->SetReactState(REACT_DEFENSIVE);
        // Default movement is follow
        charmInfo->SetCommandState(COMMAND_FOLLOW);

        charmInfo->SetIsCommandAttack(false);
        charmInfo->SetIsAtStay(false);
        charmInfo->SetIsReturning(true);
        charmInfo->SetIsCommandFollow(true);
        charmInfo->SetIsFollowing(false);
        charmInfo->SetOriginalFactionTemplate(origFactionTemplate);

        target->AttackStop();
        target->InterruptNonMeleeSpells(false);
        if (caster->GetTypeId() == TYPEID_PLAYER) // Units will make the controlled player attack (MoveChase)
            target->GetMotionMaster()->MoveFollow(caster, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);

        if (Creature* pCreaTarget = target->ToCreature())
        {
            if (pCreaTarget->AI() && pCreaTarget->AI()->SwitchAiAtControl())
                pCreaTarget->AIM_Initialize();
            if (caster->GetTypeId() == TYPEID_PLAYER && caster->getClass() == CLASS_WARLOCK)
            {
                CreatureInfo const *cinfo = ((Creature*)target)->GetCreatureInfo();
                if (cinfo && cinfo->type == CREATURE_TYPE_DEMON)
                {
                    // creature with pet number expected have class set
                    if (target->GetByteValue(UNIT_FIELD_BYTES_0, 1) == 0)
                    {
                        if (cinfo->unit_class == 0)
                            sLog.outErrorDb("Creature (Entry: %u) have unit_class = 0 but used in charmed spell, that will be result client crash.", cinfo->Entry);
                        else
                            sLog.outError("Creature (Entry: %u) have unit_class = %u but at charming have class 0!!! that will be result client crash.", cinfo->Entry, cinfo->unit_class);

                        target->SetByteValue(UNIT_FIELD_BYTES_0, 1, CLASS_MAGE);
                    }

                    //just to enable stat window
                    charmInfo->SetPetNumber(sObjectMgr.GeneratePetNumber(), true);
                    //if charmed two demons the same session, the 2nd gets the 1st one's name
                    target->SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, uint32(time(nullptr)));
                }
            }
        }
        else if (Player* pPlayer = target->ToPlayer())
        {
            if (caster->GetTypeId() == TYPEID_UNIT)
            {
                pPlayer->SetControlledBy(caster);
                if (pPlayer->i_AI && m_spellAuraHolder->GetId() == 28410)
                    pPlayer->i_AI->enablePositiveSpells = true;
            }
            else
            {
                PlayerAI *oldAi = pPlayer->i_AI;
                delete oldAi;
                pPlayer->i_AI = new PlayerControlledAI(pPlayer, caster);
            }
        }
        target->UpdateControl();
        if (caster->GetTypeId() == TYPEID_PLAYER)
            ((Player*)caster)->CharmSpellInitialize();
    }
    else
    {
        target->SetCharmerGuid(ObjectGuid());

        if(target->GetTypeId() != TYPEID_PLAYER)
        {
            CreatureInfo const *cinfo = ((Creature*)target)->GetCreatureInfo();

            // restore faction
            if (((Creature*)target)->IsPet())
            {
                if (Unit* owner = target->GetOwner())
                    target->setFaction(owner->getFaction());
                else if (cinfo)
                    target->setFaction(cinfo->faction_A);
            }
            else if (cinfo)                             // normal creature
                target->setFaction(cinfo->faction_A);

            // restore UNIT_FIELD_BYTES_0
            if (cinfo && caster && caster->GetTypeId() == TYPEID_PLAYER && caster->getClass() == CLASS_WARLOCK && cinfo->type == CREATURE_TYPE_DEMON)
            {
                // DB must have proper class set in field at loading, not req. restore, including workaround case at apply
                // target->SetByteValue(UNIT_FIELD_BYTES_0, 1, cinfo->unit_class);

                if (target->GetCharmInfo())
                    target->GetCharmInfo()->SetPetNumber(0, true);
                else
                    sLog.outError("Aura::HandleModCharm: target (GUID: %u TypeId: %u) has a charm aura but no charm info!", target->GetGUIDLow(), target->GetTypeId());
            }
        }

        if (caster)
        {
            caster->SetCharm(nullptr);
            if (caster->GetTypeId() == TYPEID_PLAYER)
                ((Player*)caster)->RemovePetActionBar();
        }
        
        target->UpdateControl();

        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            Player* pPlayer = target->ToPlayer();
            ((Player*)target)->setFactionForRace(target->getRace());
        }
        // this should possibly be the case for other spells too...
        // why on earth remove player from combat if, for example, its a boss casting it
        if (m_spellAuraHolder->GetId() == 28410 && target->GetTypeId() == TYPEID_PLAYER)
        {
            if (caster->isAlive() && caster->isInCombat())
            {
                if (target->GetTypeId() == TYPEID_PLAYER)
                    ((Player*)target)->SendAttackSwingCancelAttack();

                if (target->IsNonMeleeSpellCasted(false))
                    target->InterruptNonMeleeSpells(false);

                target->AttackStop();
                target->RemoveAllAttackers();
                target->DeleteThreatList();
                target->getHostileRefManager().deleteReferences();

                caster->SetInCombatWith(target);
                target->SetInCombatWith(caster);
                
                target->SetInCombatState(false, caster);
            }
            else
            {
                target->CombatStop(true);
                target->DeleteThreatList();
                target->getHostileRefManager().deleteReferences();
            }
        }
        else
        {
            target->CombatStop(true);
            target->DeleteThreatList();
            target->getHostileRefManager().deleteReferences();
        }

        target->SetUnitMovementFlags(MOVEFLAG_NONE);
        target->StopMoving();
        target->GetMotionMaster()->Clear(false);
        target->GetMotionMaster()->MoveIdle();

        if (Creature* pTargetCrea = target->ToCreature())
        {
            if (pTargetCrea->AI() && pTargetCrea->AI()->SwitchAiAtControl())
                pTargetCrea->AIM_Initialize();
            if (caster)
                pTargetCrea->AttackedBy(caster);
        }
        else if (Player* pPlayer = target->ToPlayer())
        {
            pPlayer->RemoveAI();

            // Charmed players are seen as hostile and not in the group for other clients, restore
            // group upon charm end
            pPlayer->setFactionForRace(target->getRace());
            if(pPlayer->GetGroup())
                pPlayer->GetGroup()->BroadcastGroupUpdate();
        }
    }
}

void Aura::HandleModConfuse(bool apply, bool Real)
{
    if (!Real)
        return;

    GetTarget()->SetConfused(apply, GetCasterGuid(), GetId());
}

void Aura::HandleModFear(bool apply, bool Real)
{
    if (!Real)
        return;

    GetTarget()->SetFeared(apply, GetCasterGuid(), GetId());
}

void Aura::HandleFeignDeath(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* pTarget = GetTarget();
    // Toutes les personnes qui castent sur le casteur de FD doivent etre interrompues.
    if (apply)
        pTarget->InterruptSpellsCastedOnMe();

    pTarget->SetFeignDeath(apply, GetCasterGuid(), GetId());
}

void Aura::HandleAuraModDisarm(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (!apply && target->HasAuraType(SPELL_AURA_MOD_DISARM))
        return;

    // Main-hand speed and attack damage is already set for feral form (and they cannot be disarmed anyway)
    // If the form is switched the disarm speed/damage will be applied automatically
    // Only update swing timers for players on disarm
    // https://www.youtube.com/watch?v=8TDUpudEL-M&t=6m5s
    // Furthermore, we need to apply/unapply weapon mods for players on disarm
    // so they don't have weapon stats (or talent boosts) whilst disarmed
    if (target->GetTypeId() == TYPEID_PLAYER && !target->IsInFeralForm())
    {
        Player* pTarget = target->ToPlayer();

        // (un)applying weapon dependent mods is more practical on a non disarmed player
        // if we unapply the aura remove the flag before _ApplyWeaponDependentAuraMods
        if (!apply)
        {
            target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISARMED, false);
            pTarget->SetRegularAttackTime();
        }

        if (Item* weapon = pTarget->GetWeaponForAttack(BASE_ATTACK, true, true))
            pTarget->_ApplyWeaponDependentAuraMods(weapon, BASE_ATTACK, !apply);

        // if we apply the aura add the flag after _ApplyWeaponDependentAuraMods
        if (apply)
        {
            target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISARMED, true);
            target->SetAttackTime(BASE_ATTACK, BASE_ATTACK_TIME);
        }
    }
    else
        target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISARMED, apply);

    // Warrior 'Disarm' skill generates 104 base threat
    // http://wowwiki.wikia.com/wiki/Disarm?direction=prev&oldid=200198 (2006) implies it 
    // generates a large amount
    // http://wowwiki.wikia.com/wiki/Threat has threat listed at 104, which is in line
    // with the values of other warrior abilities
    // We can suppose that the same is true for all spells which apply disarm
    if (apply)
    {
        float threat = 104.0f * sSpellMgr.GetSpellThreatMultiplier(GetHolder()->GetSpellProto());
        target->AddThreat(GetCaster(), threat, false, SPELL_SCHOOL_MASK_NONE, GetHolder()->GetSpellProto());
    }

    // Don't update damage if in feral
    if (!target->IsInFeralForm())
        target->UpdateDamagePhysical(BASE_ATTACK);
}

void Aura::HandleAuraModStun(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        // Stun/roots effects apply at charge end
        bool inCharge = target->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHARGE_MOTION_TYPE;
        // Frost stun aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
            target->ModifyAuraState(AURA_STATE_FROZEN, apply);

        target->addUnitState(inCharge ? UNIT_STAT_PENDING_STUNNED : UNIT_STAT_STUNNED);
        target->SetTargetGuid(ObjectGuid());

        target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
        target->CastStop(target->GetObjectGuid() == GetCasterGuid() ? GetId() : 0);
        if (target->GetObjectGuid() != GetCasterGuid())
            target->InterruptNonMeleeSpells(false);

        // Player specific
        if (Player* targetPlayer = target->ToPlayer())
        {
            if (!targetPlayer->IsMounted())
                targetPlayer->SetStandState(UNIT_STAND_STATE_STAND);// in 1.5 client

            // Release loot if any
            if (ObjectGuid lootGuid = targetPlayer->GetLootGuid())
                targetPlayer->GetSession()->DoLootRelease(lootGuid);
        }

        if (!target->movespline->Finalized() || target->GetTypeId() == TYPEID_UNIT)
            if (!inCharge)
                target->StopMoving();

        target->SetMovement(MOVE_ROOT);
    }
    else
    {
        // Frost stun aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
        {
            bool found_another = false;
            for (AuraType const* itr = &frozenAuraTypes[0]; *itr != SPELL_AURA_NONE; ++itr)
            {
                Unit::AuraList const& auras = target->GetAurasByType(*itr);
                for (Unit::AuraList::const_iterator i = auras.begin(); i != auras.end(); ++i)
                {
                    if (GetSpellSchoolMask((*i)->GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
                    {
                        found_another = true;
                        break;
                    }
                }
                if (found_another)
                    break;
            }

            if (!found_another)
                target->ModifyAuraState(AURA_STATE_FROZEN, apply);
        }

        // Real remove called after current aura remove from lists, check if other similar auras active
        if (target->HasAuraType(SPELL_AURA_MOD_STUN))
            return;

        target->clearUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED);
        target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);


        if (target->getVictim() && target->isAlive())
            target->SetTargetGuid(target->getVictim()->GetObjectGuid());

        if (!target->hasUnitState(UNIT_STAT_ROOT | UNIT_STAT_PENDING_ROOT))         // prevent allow move if have also root effect
            target->SetMovement(MOVE_UNROOT);

        // Wyvern Sting
        if (GetSpellProto()->IsFitToFamily<SPELLFAMILY_HUNTER, CF_HUNTER_MISC>())
        {
            Unit* caster = GetCaster();
            if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
                return;

            uint32 spell_id = 0;

            switch (GetId())
            {
                case 19386:
                    spell_id = 24131;
                    break;
                case 24132:
                    spell_id = 24134;
                    break;
                case 24133:
                    spell_id = 24135;
                    break;
                default:
                    sLog.outError("Spell selection called for unexpected original spell %u, new spell for this spell family?", GetId());
                    return;
            }

            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spell_id);

            if (!spellInfo)
                return;

            caster->CastSpell(target, spellInfo, true, nullptr, this);
            return;
        }
    }
}

void Aura::HandleModStealth(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (apply)
    {
        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            if (SpellAuraHolder *holder = ((Player*)target)->GetSpellAuraHolder(29519))
            {
                if (target->GetZoneId() == 1377)
                {
                    // OutdoorPVP Silithus : Perte du buff silithyste
                    if (ZoneScript* pScript = ((Player*)target)->GetZoneScript())
                        pScript->HandleDropFlag((Player*)target, 29519);
                }
            }
        }

        // drop flag at stealth in bg
        target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

        // only at real aura add
        if (Real)
        {
            target->SetByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAGS_CREEP);

            if (target->GetTypeId() == TYPEID_PLAYER)
                target->SetByteFlag(PLAYER_FIELD_BYTES2, 1, PLAYER_FIELD_BYTE2_STEALTH);

            // apply only if not in GM invisibility (and overwrite invisibility state)
            if (target->GetVisibility() != VISIBILITY_OFF)
            {
                target->SetVisibility(VISIBILITY_GROUP_NO_DETECT);
                target->SetVisibility(VISIBILITY_GROUP_STEALTH);
            }

            // for RACE_NIGHTELF stealth
            if (target->GetTypeId() == TYPEID_PLAYER && GetId() == 20580)
                target->CastSpell(target, 21009, true, nullptr, this);

            target->InterruptSpellsCastedOnMe();
        }
    }
    else
    {
        // for RACE_NIGHTELF stealth
        if (Real && target->GetTypeId() == TYPEID_PLAYER && GetId() == 20580)
            target->RemoveAurasDueToSpell(21009);

        // only at real aura remove of _last_ SPELL_AURA_MOD_STEALTH
        if (Real && !target->HasAuraType(SPELL_AURA_MOD_STEALTH))
        {
            // if no GM invisibility
            if (target->GetVisibility() != VISIBILITY_OFF)
            {
                target->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAGS_CREEP);

                if (target->GetTypeId() == TYPEID_PLAYER)
                    target->RemoveByteFlag(PLAYER_FIELD_BYTES2, 1, PLAYER_FIELD_BYTE2_STEALTH);

                // restore invisibility if any
                if (target->HasAuraType(SPELL_AURA_MOD_INVISIBILITY))
                {
                    target->SetVisibility(VISIBILITY_GROUP_NO_DETECT);
                    target->SetVisibility(VISIBILITY_GROUP_INVISIBILITY);
                }
                else
                    target->SetVisibility(VISIBILITY_ON);
            }
        }
    }
}

void Aura::HandleInvisibility(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (apply)
    {
        target->m_invisibilityMask |= (1 << m_modifier.m_miscvalue);
        target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

        if (Real && target->GetTypeId() == TYPEID_PLAYER)
        {
            // apply glow vision
            target->SetByteFlag(PLAYER_FIELD_BYTES2, 1, PLAYER_FIELD_BYTE2_INVISIBILITY_GLOW);

        }

        // apply only if not in GM invisibility and not stealth
        if (target->GetVisibility() == VISIBILITY_ON)
        {
            // Aura not added yet but visibility code expect temporary add aura
            target->SetVisibility(VISIBILITY_GROUP_NO_DETECT);
            target->SetVisibility(VISIBILITY_GROUP_INVISIBILITY);
        }
    }
    else
    {
        // recalculate value at modifier remove (current aura already removed)
        target->m_invisibilityMask = 0;
        Unit::AuraList const& auras = target->GetAurasByType(SPELL_AURA_MOD_INVISIBILITY);
        for (Unit::AuraList::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
            target->m_invisibilityMask |= (1 << (*itr)->GetModifier()->m_miscvalue);

        // only at real aura remove and if not have different invisibility auras.
        if (Real && target->m_invisibilityMask == 0)
        {
            // remove glow vision
            if (target->GetTypeId() == TYPEID_PLAYER)
                target->RemoveByteFlag(PLAYER_FIELD_BYTES2, 1, PLAYER_FIELD_BYTE2_INVISIBILITY_GLOW);

            // apply only if not in GM invisibility & not stealthed while invisible
            if (target->GetVisibility() != VISIBILITY_OFF)
            {
                // if have stealth aura then already have stealth visibility
                if (!target->HasAuraType(SPELL_AURA_MOD_STEALTH))
                    target->SetVisibility(VISIBILITY_ON);
            }
        }
    }
}

void Aura::HandleInvisibilityDetect(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (apply)
        target->m_detectInvisibilityMask |= (1 << m_modifier.m_miscvalue);
    else
    {
        // recalculate value at modifier remove (current aura already removed)
        target->m_detectInvisibilityMask = 0;
        Unit::AuraList const& auras = target->GetAurasByType(SPELL_AURA_MOD_INVISIBILITY_DETECTION);
        for (Unit::AuraList::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
            target->m_detectInvisibilityMask |= (1 << (*itr)->GetModifier()->m_miscvalue);
    }
    if (Real && target->GetTypeId() == TYPEID_PLAYER)
        ((Player*)target)->GetCamera().UpdateVisibilityForOwner();
}

void Aura::HandleAuraModRoot(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        // Stun/roots effects apply at charge end
        bool inCharge = target->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHARGE_MOTION_TYPE;
        // Frost root aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
            target->ModifyAuraState(AURA_STATE_FROZEN, apply);

        target->addUnitState(inCharge ? UNIT_STAT_PENDING_ROOT : UNIT_STAT_ROOT);

        //Save last orientation
        if (target->getVictim())
            target->SetOrientation(target->GetAngle(target->getVictim()));

        if (!target->movespline->Finalized() && !inCharge)
            target->StopMoving();

        target->SetMovement(MOVE_ROOT);
    }
    else
    {
        // Frost root aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
        {
            bool found_another = false;
            for (AuraType const* itr = &frozenAuraTypes[0]; *itr != SPELL_AURA_NONE; ++itr)
            {
                Unit::AuraList const& auras = target->GetAurasByType(*itr);
                for (Unit::AuraList::const_iterator i = auras.begin(); i != auras.end(); ++i)
                {
                    if (GetSpellSchoolMask((*i)->GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
                    {
                        found_another = true;
                        break;
                    }
                }
                if (found_another)
                    break;
            }

            if (!found_another)
                target->ModifyAuraState(AURA_STATE_FROZEN, apply);
        }

        // Real remove called after current aura remove from lists, check if other similar auras active
        if (target->HasAuraType(SPELL_AURA_MOD_ROOT))
            return;

        target->clearUnitState(UNIT_STAT_ROOT | UNIT_STAT_PENDING_ROOT);

        if (!target->hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))      // prevent allow move if have also stun effect
        {
            target->SetMovement(MOVE_UNROOT);
            target->SetUnitMovementFlags(MOVEFLAG_NONE);
        }
    }
}

void Aura::HandleAuraModSilence(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED);
        // Stop cast only spells vs PreventionType == SPELL_PREVENTION_TYPE_SILENCE
        for (uint32 i = CURRENT_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
            if (Spell* spell = target->GetCurrentSpell(CurrentSpellTypes(i)))
                if (spell->m_spellInfo->PreventionType == SPELL_PREVENTION_TYPE_SILENCE)
                    // Stop spells on prepare or casting state
                    target->InterruptSpell(CurrentSpellTypes(i), false);
    }
    else
    {
        // Real remove called after current aura remove from lists, check if other similar auras active
        if (target->HasAuraType(SPELL_AURA_MOD_SILENCE))
            return;

        target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED);
    }
}

void Aura::HandleModThreat(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    int level_diff = 0;
    int multiplier = 0;
    switch (GetId())
    {
        // Arcane Shroud
        case 26400:
            level_diff = target->getLevel() - 60;
            multiplier = 2;
            break;
        // The Eye of Diminution
        case 28862:
            level_diff = target->getLevel() - 60;
            multiplier = 1;
            break;
    }

    if (level_diff > 0)
        m_modifier.m_amount += multiplier * level_diff;

    if (target->GetTypeId() == TYPEID_PLAYER)
        for (int8 x = 0; x < MAX_SPELL_SCHOOL; x++)
            if (m_modifier.m_miscvalue & int32(1 << x))
                ApplyPercentModFloatVar(target->m_threatModifier[x], float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModTotalThreat(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (!target->isAlive() || target->GetTypeId() != TYPEID_PLAYER)
        return;

    Unit* caster = GetCaster();

    if (!caster || !caster->isAlive())
        return;

    target->getHostileRefManager().addTempThreat(m_modifier.m_amount, apply);
}

void Aura::HandleModTaunt(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (!target->isAlive() || !target->CanHaveThreatList())
        return;

    Unit* caster = GetCaster();

    if (!caster || !caster->isAlive())
        return;

    if (apply)
        target->TauntApply(caster);
    else
    {
        // When taunt aura fades out, mob will switch to previous target if current has less than 1.1 * secondthreat
        target->TauntFadeOut(caster);
    }
}

/*********************************************************/
/***                  MODIFY SPEED                     ***/
/*********************************************************/
void Aura::HandleAuraModIncreaseSpeed(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    GetTarget()->UpdateSpeed(MOVE_RUN, true);
}

void Aura::HandleAuraModIncreaseMountedSpeed(bool /*apply*/, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    GetTarget()->UpdateSpeed(MOVE_RUN, true);
}

void Aura::HandleAuraModIncreaseSwimSpeed(bool /*apply*/, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    GetTarget()->UpdateSpeed(MOVE_SWIM, true);
}

void Aura::HandleAuraModDecreaseSpeed(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    Unit* target = GetTarget();

    target->UpdateSpeed(MOVE_RUN, true);
    target->UpdateSpeed(MOVE_SWIM, true);
}

void Aura::HandleAuraModUseNormalSpeed(bool /*apply*/, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    Unit *target = GetTarget();

    target->UpdateSpeed(MOVE_RUN, true);
    target->UpdateSpeed(MOVE_SWIM, true);
}

/*********************************************************/
/***                     IMMUNITY                      ***/
/*********************************************************/

void Aura::HandleModMechanicImmunity(bool apply, bool /*Real*/)
{
    uint32 misc  = m_modifier.m_miscvalue;
    Unit *target = GetTarget();

    if (apply && GetSpellProto()->AttributesEx & SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY)
        target->RemoveAurasAtMechanicImmunity(1 << (misc - 1), GetId());

    // Transfert ne doit pas appliquer d'immunite pendant 1sec, mais simplement dispel
    if (GetSpellProto()->DurationIndex == 36)
        return;

    target->ApplySpellImmune(GetId(), IMMUNITY_MECHANIC, misc, apply);

    // re-apply Fear Ward if it was not wasted during Bersereker Rage
    if (!apply && GetSpellProto()->IsFitToFamily<SPELLFAMILY_WARRIOR, CF_WARRIOR_BERSERKER_RAGE>())
    {
        if (target->HasAura(6346))
        {
            auto aura = target->GetAura(6346, EFFECT_INDEX_0);
            aura->HandleModMechanicImmunity(true, true);
        }
    }
}

void Aura::HandleModMechanicImmunityMask(bool apply, bool /*Real*/)
{
    uint32 mechanic  = m_modifier.m_miscvalue;

    if (apply && GetSpellProto()->AttributesEx & SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY)
        GetTarget()->RemoveAurasAtMechanicImmunity(mechanic, GetId());

    // check implemented in Unit::IsImmuneToSpell and Unit::IsImmuneToSpellEffect
}

//this method is called whenever we add / remove aura which gives m_target some imunity to some spell effect
void Aura::HandleAuraModEffectImmunity(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    // when removing flag aura, handle flag drop
    if (!apply && target->GetTypeId() == TYPEID_PLAYER
            && (GetSpellProto()->AuraInterruptFlags & AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION))
    {
        // En CM, si un ennemi nous met un boubou, on ne doit pas perdre le flag.
        if (!target->HasAuraType(SPELL_AURA_MOD_POSSESS))
            if (BattleGround *bg = ((Player*)target)->GetBattleGround())
                bg->EventPlayerDroppedFlag(((Player*)target));
    }

    target->ApplySpellImmune(GetId(), IMMUNITY_EFFECT, m_modifier.m_miscvalue, apply);
}

void Aura::HandleAuraModStateImmunity(bool apply, bool Real)
{
    if (apply && Real && GetSpellProto()->AttributesEx & SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY)
    {
        Unit::AuraList const& auraList = GetTarget()->GetAurasByType(AuraType(m_modifier.m_miscvalue));
        for (Unit::AuraList::const_iterator itr = auraList.begin(); itr != auraList.end();)
        {
            if (auraList.front() != this)                   // skip itself aura (it already added)
            {
                GetTarget()->RemoveAurasDueToSpell(auraList.front()->GetId());
                itr = auraList.begin();
            }
            else
                ++itr;
        }
    }

    GetTarget()->ApplySpellImmune(GetId(), IMMUNITY_STATE, m_modifier.m_miscvalue, apply);
}

void Aura::HandleAuraModSchoolImmunity(bool apply, bool Real)
{
    Unit* target = GetTarget();
    target->ApplySpellImmune(GetId(), IMMUNITY_SCHOOL, m_modifier.m_miscvalue, apply);

    // remove all flag auras (they are positive, but they must be removed when you are immune)
    if (apply && GetSpellProto()->AttributesEx & SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY
              && GetSpellProto()->AttributesEx2 & SPELL_ATTR_EX2_DAMAGE_REDUCED_SHIELD
              && target->IsPlayer() && !target->isCharmed())
        target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

    // TODO: optimalize this cycle - use RemoveAurasWithInterruptFlags call or something else
    if (Real && apply
            && GetSpellProto()->AttributesEx & SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY
            && IsPositiveSpell(GetId()))                        //Only positive immunity removes auras
    {
        uint32 school_mask = m_modifier.m_miscvalue;
        Unit::SpellAuraHolderMap& Auras = target->GetSpellAuraHolderMap();
        for (Unit::SpellAuraHolderMap::iterator iter = Auras.begin(), next; iter != Auras.end(); iter = next)
        {
            next = iter;
            ++next;
            SpellEntry const *spell = iter->second->GetSpellProto();
            if ((GetSpellSchoolMask(spell) & school_mask) //Check for school mask
                    && !(spell->Attributes & SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)    //Spells unaffected by invulnerability
                    && !iter->second->IsPositive()          //Don't remove positive spells
                    && spell->Id != GetId())                //Don't remove self
            {
                target->RemoveAurasDueToSpell(spell->Id);
                if (Auras.empty())
                    break;
                else
                    next = Auras.begin();
            }
        }
    }
    if (Real && GetSpellProto()->Mechanic == MECHANIC_BANISH)
    {
        if (apply)
            target->addUnitState(UNIT_STAT_ISOLATED);
        else
            target->clearUnitState(UNIT_STAT_ISOLATED);
    }
}

void Aura::HandleAuraModDmgImmunity(bool apply, bool /*Real*/)
{
    GetTarget()->ApplySpellImmune(GetId(), IMMUNITY_DAMAGE, m_modifier.m_miscvalue, apply);
}

void Aura::HandleAuraModDispelImmunity(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    if (GetId() == 20594) // Forme de pierre
    {
        GetTarget()->ApplySpellDispelImmunity(GetSpellProto(), DISPEL_DISEASE, apply);
        GetTarget()->ApplySpellDispelImmunity(GetSpellProto(), DISPEL_POISON, apply);
        return;
    }
    GetTarget()->ApplySpellDispelImmunity(GetSpellProto(), DispelType(m_modifier.m_miscvalue), apply);
}

void Aura::HandleAuraProcTriggerSpell(bool apply, bool Real)
{
    if (!Real)
        return;

    switch (GetId())
    {
        // some spell have charges by functionality not have its in spell data
        case 28200:                                         // Ascendance (Talisman of Ascendance trinket)
            if (apply)
                GetHolder()->SetAuraCharges(6);
            break;
        default:
            break;
    }
}

void Aura::HandleAuraModStalked(bool apply, bool /*Real*/)
{
    // used by spells: Hunter's Mark, Mind Vision, Syndicate Tracker (MURP) DND
    if (apply)
    {
        GetTarget()->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_TRACK_UNIT);
        GetTarget()->ForceValuesUpdateAtIndex(UNIT_DYNAMIC_FLAGS);
    }
    else
        GetTarget()->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_TRACK_UNIT);
}

/*********************************************************/
/***                   PERIODIC                        ***/
/*********************************************************/

void Aura::HandlePeriodicTriggerSpell(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    Unit *target = GetTarget();

    if (!apply)
    {
        switch (GetId())
        {
            case 23620:                                     // Burning Adrenaline
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    target->CastSpell(target, 23478, true);
                return;
                /*
                this is not needed. Might have been in the past, but if functions correct without this hack now.
            case 29213:                                     // Curse of the Plaguebringer
                if (m_removeMode != AURA_REMOVE_BY_DISPEL)
                    // Cast Wrath of the Plaguebringer if not dispelled
                    target->CastSpell(target, 29214, true, nullptr, this);
                return;
                */
            default:
                break;
        }
    }
}

void Aura::HandlePeriodicTriggerSpellWithValue(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandlePeriodicEnergize(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandleAuraPowerBurn(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandlePeriodicHeal(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    Unit *target = GetTarget();

    // For prevent double apply bonuses
    bool loading = (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit *caster = GetCaster();
        if (!caster)
            return;

        m_modifier.m_amount = caster->SpellHealingBonusDone(target, GetSpellProto(), m_modifier.m_amount, DOT, GetStackAmount());
    }
}

void Aura::HandlePeriodicDamage(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    m_isPeriodic = apply;

    Unit *target = GetTarget();
    SpellEntry const* spellProto = GetSpellProto();

    // For prevent double apply bonuses
    bool loading = (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit *caster = GetCaster();
        if (!caster)
            return;

        switch (spellProto->SpellFamilyName)
        {
            case SPELLFAMILY_DRUID:
            {
                // Rip
                if (spellProto->IsFitToFamilyMask<CF_DRUID_RIP_BITE>())
                {
                    // $AP * min(0.06*$cp, 0.24)/6 [Yes, there is no difference, whether 4 or 5 CPs are being used]
                    if (caster->GetTypeId() == TYPEID_PLAYER)
                    {
                        uint8 cp = ((Player*)caster)->GetComboPoints();

                        if (cp > 4) cp = 4;
                        m_modifier.m_amount += int32(caster->GetTotalAttackPowerValue(BASE_ATTACK) * cp / 100);
                    }
                }
                break;
            }
            case SPELLFAMILY_ROGUE:
            {
                // Rupture
                if (spellProto->IsFitToFamilyMask<CF_ROGUE_RUPTURE>())
                {
                    // Dmg/tick = $AP*min(0.01*$cp, 0.03) [Like Rip: only the first three CP increase the contribution from AP]
                    if (caster->GetTypeId() == TYPEID_PLAYER)
                    {
                        uint8 cp = ((Player*)caster)->GetComboPoints();
                        if (cp > 3) cp = 3;
                        m_modifier.m_amount += int32(caster->GetTotalAttackPowerValue(BASE_ATTACK) * cp / 100);
                    }
                }
                break;
            }
            default:
                break;
        }

        if (m_modifier.m_auraname == SPELL_AURA_PERIODIC_DAMAGE)
        {
            // SpellDamageBonusDone for magic spells
            if (spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE || spellProto->DmgClass == SPELL_DAMAGE_CLASS_MAGIC)
                m_modifier.m_amount = caster->SpellDamageBonusDone(target, GetSpellProto(), m_modifier.m_amount, DOT, GetStackAmount());
            // MeleeDamagebonusDone for weapon based spells
            else
            {
                WeaponAttackType attackType = GetWeaponAttackType(GetSpellProto());
                m_modifier.m_amount = caster->MeleeDamageBonusDone(target, m_modifier.m_amount, attackType, GetSpellProto(), DOT, GetStackAmount());
            }
        }
    }
}

void Aura::HandlePeriodicDamagePCT(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandlePeriodicLeech(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    // For prevent double apply bonuses
    bool loading = (GetTarget()->GetTypeId() == TYPEID_PLAYER && ((Player*)GetTarget())->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit *caster = GetCaster();
        if (!caster)
            return;

        m_modifier.m_amount = caster->SpellDamageBonusDone(GetTarget(), GetSpellProto(), m_modifier.m_amount, DOT, GetStackAmount());
    }
}

void Aura::HandlePeriodicManaLeech(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandlePeriodicHealthFunnel(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    // For prevent double apply bonuses
    bool loading = (GetTarget()->GetTypeId() == TYPEID_PLAYER && ((Player*)GetTarget())->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit *caster = GetCaster();
        if (!caster)
            return;

        m_modifier.m_amount = caster->SpellDamageBonusDone(GetTarget(), GetSpellProto(), m_modifier.m_amount, DOT, GetStackAmount());
    }
}

/*********************************************************/
/***                  MODIFY STATS                     ***/
/*********************************************************/

/********************************/
/***        RESISTANCE        ***/
/********************************/

void Aura::HandleAuraModResistanceExclusive(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    SpellEntry const* spellProto = GetSpellProto();
    // Calcul du montant des autres buffs similaires.
    int32 maxModifiersOthers[MAX_SPELL_SCHOOL] = {0};
    Unit::AuraList const& mModResistanceExcl = target->GetAurasByType(SPELL_AURA_MOD_RESISTANCE_EXCLUSIVE);
    for (Unit::AuraList::const_iterator i = mModResistanceExcl.begin(); i != mModResistanceExcl.end(); ++i)
        for (int8 x = SPELL_SCHOOL_NORMAL; x < MAX_SPELL_SCHOOL; ++x)
            if ((*i)->GetSpellProto()->Id != spellProto->Id && (*i)->GetModifier()->m_miscvalue & int32(1 << x))
                if (maxModifiersOthers[x] < (*i)->GetModifier()->m_amount)
                    maxModifiersOthers[x] = (*i)->GetModifier()->m_amount;
    // Application des effets.
    for (int8 x = SPELL_SCHOOL_NORMAL; x < MAX_SPELL_SCHOOL; x++)
    {
        GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + x), BASE_VALUE, float(maxModifiersOthers[x]), !apply);
        if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
            ((Player*)GetTarget())->ApplyResistanceBuffModsMod(SpellSchools(x), m_positive, float(maxModifiersOthers[x]), !apply);
        GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + x), BASE_VALUE, float(std::max(maxModifiersOthers[x], m_modifier.m_miscvalue & int32(1 << x) ? m_modifier.m_amount : 0)), apply);
        if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
            ((Player*)GetTarget())->ApplyResistanceBuffModsMod(SpellSchools(x), m_positive, float(std::max(maxModifiersOthers[x], m_modifier.m_miscvalue & int32(1 << x) ? m_modifier.m_amount : 0)), apply);
    }
}

void Aura::HandleAuraModResistance(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    SpellEntry const* spellProto = GetSpellProto();

    for (int8 x = SPELL_SCHOOL_NORMAL; x < MAX_SPELL_SCHOOL; x++)
    {
        if (m_modifier.m_miscvalue & int32(1 << x))
        {
            target->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + x), TOTAL_VALUE, float(m_modifier.m_amount), apply);
            if (target->GetTypeId() == TYPEID_PLAYER)
                ((Player*)target)->ApplyResistanceBuffModsMod(SpellSchools(x), m_positive, float(m_modifier.m_amount), apply);
        }
    }

    // Faerie Fire (druid versions)
    if (spellProto->SpellIconID == 109 && spellProto->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_FAERIE_FIRE>())
    {
        target->ApplySpellDispelImmunity(spellProto, DISPEL_STEALTH, apply);
        target->ApplySpellDispelImmunity(spellProto, DISPEL_INVISIBILITY, apply);
    }
}

void Aura::HandleAuraModBaseResistancePCT(bool apply, bool /*Real*/)
{
    // only players have base stats
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
    {
        //pets only have base armor
        if (((Creature*)GetTarget())->IsPet() && (m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_NORMAL))
            GetTarget()->HandleStatModifier(UNIT_MOD_ARMOR, BASE_PCT, float(m_modifier.m_amount), apply);
    }
    else
    {
        for (int8 x = SPELL_SCHOOL_NORMAL; x < MAX_SPELL_SCHOOL; x++)
        {
            if (m_modifier.m_miscvalue & int32(1 << x))
                GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + x), BASE_PCT, float(m_modifier.m_amount), apply);
        }
    }
}

void Aura::HandleAurasVisible(bool apply, bool /*Real*/)
{
    GetTarget()->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_AURAS_VISIBLE, apply);
}

void Aura::HandleModResistancePercent(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    for (int8 i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; i++)
    {
        if (m_modifier.m_miscvalue & int32(1 << i))
        {
            target->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + i), TOTAL_PCT, float(m_modifier.m_amount), apply);
            if (target->GetTypeId() == TYPEID_PLAYER)
            {
                ((Player*)target)->ApplyResistanceBuffModsPercentMod(SpellSchools(i), true, float(m_modifier.m_amount), apply);
                ((Player*)target)->ApplyResistanceBuffModsPercentMod(SpellSchools(i), false, float(m_modifier.m_amount), apply);
            }
        }
    }
}

void Aura::HandleModBaseResistance(bool apply, bool /*Real*/)
{
    // only players have base stats
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
    {
        //only pets have base stats
        if (((Creature*)GetTarget())->IsPet() && (m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_NORMAL))
            GetTarget()->HandleStatModifier(UNIT_MOD_ARMOR, TOTAL_VALUE, float(m_modifier.m_amount), apply);
    }
    else
    {
        for (int i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; i++)
            if (m_modifier.m_miscvalue & (1 << i))
                GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + i), TOTAL_VALUE, float(m_modifier.m_amount), apply);
    }
}

/********************************/
/***           STAT           ***/
/********************************/

void Aura::HandleAuraModStat(bool apply, bool /*Real*/)
{
    if (m_modifier.m_miscvalue < -2 || m_modifier.m_miscvalue > 4)
    {
        sLog.outError("WARNING: Spell %u effect %u have unsupported misc value (%i) for SPELL_AURA_MOD_STAT ", GetId(), GetEffIndex(), m_modifier.m_miscvalue);
        return;
    }

    for (int32 i = STAT_STRENGTH; i < MAX_STATS; i++)
    {
        // -1 or -2 is all stats ( misc < -2 checked in function beginning )
        if (m_modifier.m_miscvalue < 0 || m_modifier.m_miscvalue == i)
        {
            //m_target->ApplyStatMod(Stats(i), m_modifier.m_amount,apply);
            GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_STAT_START + i), TOTAL_VALUE, float(m_modifier.m_amount), apply);
            if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
                ((Player*)GetTarget())->ApplyStatBuffMod(Stats(i), float(m_modifier.m_amount), apply);
        }
    }
}

void Aura::HandleModPercentStat(bool apply, bool /*Real*/)
{
    if (m_modifier.m_miscvalue < -1 || m_modifier.m_miscvalue > 4)
    {
        sLog.outError("WARNING: Misc Value for SPELL_AURA_MOD_PERCENT_STAT not valid");
        return;
    }

    // only players have base stats
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    for (int32 i = STAT_STRENGTH; i < MAX_STATS; ++i)
    {
        if (m_modifier.m_miscvalue == i || m_modifier.m_miscvalue == -1)
            GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_STAT_START + i), BASE_PCT, float(m_modifier.m_amount), apply);
    }
}

void Aura::HandleModSpellDamagePercentFromStat(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    // Magic damage modifiers implemented in Unit::SpellDamageBonusDone
    // This information for client side use only
    // Recalculate bonus
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleModSpellHealingPercentFromStat(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    // Recalculate bonus
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleModHealingDone(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;
    // implemented in Unit::SpellHealingBonusDone
    // this information is for client side only
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleModTotalPercentStat(bool apply, bool /*Real*/)
{
    if (m_modifier.m_miscvalue < -1 || m_modifier.m_miscvalue > 4)
    {
        sLog.outError("WARNING: Misc Value for SPELL_AURA_MOD_PERCENT_STAT not valid");
        return;
    }

    Unit *target = GetTarget();

    //save current and max HP before applying aura
    uint32 curHPValue = target->GetHealth();
    uint32 maxHPValue = target->GetMaxHealth();

    for (int32 i = STAT_STRENGTH; i < MAX_STATS; i++)
    {
        if (m_modifier.m_miscvalue == i || m_modifier.m_miscvalue == -1)
        {
            target->HandleStatModifier(UnitMods(UNIT_MOD_STAT_START + i), TOTAL_PCT, float(m_modifier.m_amount), apply);
            if (target->GetTypeId() == TYPEID_PLAYER)
                ((Player*)target)->ApplyStatPercentBuffMod(Stats(i), float(m_modifier.m_amount), apply);
        }
    }

    //recalculate current HP/MP after applying aura modifications (only for spells with 0x10 flag)
    if ((m_modifier.m_miscvalue == STAT_STAMINA) && (maxHPValue > 0) && (GetSpellProto()->Attributes & 0x10) && target->isAlive())
    {
        // newHP = (curHP / maxHP) * newMaxHP = (newMaxHP * curHP) / maxHP -> which is better because no int -> double -> int conversion is needed
        uint32 newHPValue = (target->GetMaxHealth() * curHPValue) / maxHPValue;
        target->SetHealth(newHPValue);
    }
}

void Aura::HandleAuraModResistenceOfStatPercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (m_modifier.m_miscvalue != SPELL_SCHOOL_MASK_NORMAL)
    {
        // support required adding replace UpdateArmor by loop by UpdateResistence at intellect update
        // and include in UpdateResistence same code as in UpdateArmor for aura mod apply.
        sLog.outError("Aura SPELL_AURA_MOD_RESISTANCE_OF_STAT_PERCENT(182) need adding support for non-armor resistances!");
        return;
    }

    // Recalculate Armor
    GetTarget()->UpdateArmor();
}

/********************************/
/***      HEAL & ENERGIZE     ***/
/********************************/
void Aura::HandleAuraModTotalHealthPercentRegen(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandleAuraModTotalManaPercentRegen(bool apply, bool /*Real*/)
{
    if (m_modifier.periodictime == 0)
        m_modifier.periodictime = 1000;

    m_periodicTimer = m_modifier.periodictime;
    m_isPeriodic = apply;
}

void Aura::HandleModRegen(bool apply, bool /*Real*/)        // eating
{
    if (m_modifier.periodictime == 0)
        m_modifier.periodictime = 5000;

    m_periodicTimer = 5000;
    m_isPeriodic = apply;
}

void Aura::HandleModPowerRegen(bool apply, bool Real)       // drinking
{
    if (!Real)
        return;

    Powers pt = GetTarget()->getPowerType();
    if (m_modifier.periodictime == 0)
    {
        // Anger Management (only spell use this aura for rage)
        if (pt == POWER_RAGE)
            m_modifier.periodictime = 3000;
        else
            m_modifier.periodictime = 2000;
    }

    m_periodicTimer = 5000;

    if (m_modifier.m_miscvalue == POWER_MANA)
        (GetTarget())->UpdateManaRegen();

    m_isPeriodic = apply;
}

void Aura::HandleModPowerRegenPCT(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    // Update manaregen value
    if (m_modifier.m_miscvalue == POWER_MANA)
        (GetTarget())->UpdateManaRegen();
}

void Aura::HandleAuraModIncreaseHealth(bool apply, bool Real)
{
    Unit *target = GetTarget();

    // Special case with temporary increase max/current health
    switch (GetId())
    {
        case 12976:                                         // Warrior Last Stand triggered spell
        {
            if (Real)
            {
                if (apply)
                {
                    target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);
                    target->ModifyHealth(m_modifier.m_amount);
                }
                else
                {
                    if (int32(target->GetHealth()) > m_modifier.m_amount)
                        target->ModifyHealth(-m_modifier.m_amount);
                    else
                        target->SetHealth(1);
                    target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);
                }
            }
            return;
        }
        // Druid bear form
        case 1178:
        case 9635:
        {
            if (Real)
            {
                float fHealthPercent = float(target->GetHealth()) / target->GetMaxHealth();
                int32 newMaxHealth = target->GetMaxHealth();
                if (apply)
                    newMaxHealth += m_modifier.m_amount;
                else
                    newMaxHealth -= m_modifier.m_amount;

                uint32 newHealth = ceil(newMaxHealth * fHealthPercent);
                target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);
                target->SetHealth(newHealth);
            }
            return;
        }
        // Trinket BWL (Don de vie)
        case 23782:
        {
            if (Real)
            {
                target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_PCT, 15.0f, apply);
                if (apply)
                {
                    int32 healAmount = target->GetMaxHealth() * 0.15f;
                    target->CastCustomSpell(target, 23783, &healAmount, nullptr, nullptr, true, nullptr, this);
                }
            }
            return;
        }
    }

    // generic case
    target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModIncreaseEnergy(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    Powers powerType = Powers(m_modifier.m_miscvalue);

    UnitMods unitMod = UnitMods(UNIT_MOD_POWER_START + powerType);

    target->HandleStatModifier(unitMod, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModIncreaseEnergyPercent(bool apply, bool /*Real*/)
{
    Powers powerType = Powers(m_modifier.m_miscvalue);

    UnitMods unitMod = UnitMods(UNIT_MOD_POWER_START + powerType);

    GetTarget()->HandleStatModifier(unitMod, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModIncreaseHealthPercent(bool apply, bool /*Real*/)
{
    GetTarget()->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_PCT, float(m_modifier.m_amount), apply);

    if (GetTarget()->GetMaxHealth() == 1)
        GetTarget()->DoKillUnit(GetTarget());
}

/********************************/
/***          FIGHT           ***/
/********************************/

void Aura::HandleAuraModParryPercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateParryPercentage();
}

void Aura::HandleAuraModDodgePercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateDodgePercentage();
    //sLog.outError("BONUS DODGE CHANCE: + %f", float(m_modifier.m_amount));
}

void Aura::HandleAuraModBlockPercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateBlockPercentage();
    //sLog.outError("BONUS BLOCK CHANCE: + %f", float(m_modifier.m_amount));
}

void Aura::HandleAuraModRegenInterrupt(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateManaRegen();
}

void Aura::HandleAuraModCritPercent(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (target->GetTypeId() != TYPEID_PLAYER)
        return;

    // apply item specific bonuses for already equipped weapon
    if (Real)
    {
        for (int i = 0; i < MAX_ATTACK; ++i)
            if (Item* pItem = ((Player*)target)->GetWeaponForAttack(WeaponAttackType(i), true, false))
                ((Player*)target)->_ApplyWeaponDependentAuraCritMod(pItem, WeaponAttackType(i), this, apply);
    }

    // mods must be applied base at equipped weapon class and subclass comparison
    // with spell->EquippedItemClass and  EquippedItemSubClassMask and EquippedItemInventoryTypeMask
    // m_modifier.m_miscvalue comparison with item generated damage types

    if (GetSpellProto()->EquippedItemClass == -1)
    {
        ((Player*)target)->HandleBaseModValue(CRIT_PERCENTAGE,         FLAT_MOD, float(m_modifier.m_amount), apply);
        ((Player*)target)->HandleBaseModValue(OFFHAND_CRIT_PERCENTAGE, FLAT_MOD, float(m_modifier.m_amount), apply);
        ((Player*)target)->HandleBaseModValue(RANGED_CRIT_PERCENTAGE,  FLAT_MOD, float(m_modifier.m_amount), apply);
    }
    else
    {
        // done in Player::_ApplyWeaponDependentAuraMods
    }
}

void Aura::HandleModHitChance(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    if (GetId() != 22780) // [Ranged Hit Bonus +3] as stated in name ...
        target->m_modMeleeHitChance += apply ? m_modifier.m_amount : (-m_modifier.m_amount);
    target->m_modRangedHitChance += apply ? m_modifier.m_amount : (-m_modifier.m_amount);
}

void Aura::HandleModSpellHitChance(bool apply, bool /*Real*/)
{
    GetTarget()->m_modSpellHitChance += apply ? m_modifier.m_amount : (-m_modifier.m_amount);
}

void Aura::HandleModSpellCritChance(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        ((Player*)GetTarget())->UpdateAllSpellCritChances();
    else
        GetTarget()->m_baseSpellCritChance += apply ? m_modifier.m_amount : (-m_modifier.m_amount);
}

void Aura::HandleModSpellCritChanceShool(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    for (int school = SPELL_SCHOOL_NORMAL; school < MAX_SPELL_SCHOOL; ++school)
        if (m_modifier.m_miscvalue & (1 << school))
            ((Player*)GetTarget())->UpdateSpellCritChance(school);
}

/********************************/
/***         ATTACK SPEED     ***/
/********************************/

void Aura::HandleModCastingSpeed(bool apply, bool /*Real*/)
{
    GetTarget()->ApplyCastTimePercentMod(float(m_modifier.m_amount), apply);
}

void Aura::HandleModAttackSpeed(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    target->ApplyAttackTimePercentMod(BASE_ATTACK, float(m_modifier.m_amount), apply);
    target->ApplyAttackTimePercentMod(OFF_ATTACK, float(m_modifier.m_amount), apply);
    target->ApplyAttackTimePercentMod(RANGED_ATTACK, float(m_modifier.m_amount), apply);
}

void Aura::HandleModMeleeSpeedPct(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    target->ApplyAttackTimePercentMod(BASE_ATTACK, float(m_modifier.m_amount), apply);
    target->ApplyAttackTimePercentMod(OFF_ATTACK, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModRangedHaste(bool apply, bool /*Real*/)
{
    GetTarget()->ApplyAttackTimePercentMod(RANGED_ATTACK, float(m_modifier.m_amount), apply);
}

void Aura::HandleRangedAmmoHaste(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;
    GetTarget()->ApplyAttackTimePercentMod(RANGED_ATTACK, float(m_modifier.m_amount), apply);
}

/********************************/
/***        ATTACK POWER      ***/
/********************************/

void Aura::HandleAuraModAttackPower(bool apply, bool /*Real*/)
{
    GetTarget()->HandleStatModifier(UNIT_MOD_ATTACK_POWER, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModRangedAttackPower(bool apply, bool /*Real*/)
{
    if ((GetTarget()->getClassMask() & CLASSMASK_WAND_USERS) != 0)
        return;

    GetTarget()->HandleStatModifier(UNIT_MOD_ATTACK_POWER_RANGED, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModAttackPowerPercent(bool apply, bool /*Real*/)
{
    //UNIT_FIELD_ATTACK_POWER_MULTIPLIER = multiplier - 1
    GetTarget()->HandleStatModifier(UNIT_MOD_ATTACK_POWER, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModRangedAttackPowerPercent(bool apply, bool /*Real*/)
{
    if ((GetTarget()->getClassMask() & CLASSMASK_WAND_USERS) != 0)
        return;

    //UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER = multiplier - 1
    GetTarget()->HandleStatModifier(UNIT_MOD_ATTACK_POWER_RANGED, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

/********************************/
/***        DAMAGE BONUS      ***/
/********************************/
void Aura::HandleModDamageDone(bool apply, bool Real)
{
    Unit *target = GetTarget();

    // apply item specific bonuses for already equipped weapon
    if (Real && target->GetTypeId() == TYPEID_PLAYER)
    {
        for (int i = 0; i < MAX_ATTACK; ++i)
            if (Item* pItem = ((Player*)target)->GetWeaponForAttack(WeaponAttackType(i), true, false))
                ((Player*)target)->_ApplyWeaponDependentAuraDamageMod(pItem, WeaponAttackType(i), this, apply);
    }

    // m_modifier.m_miscvalue is bitmask of spell schools
    // 1 ( 0-bit ) - normal school damage (SPELL_SCHOOL_MASK_NORMAL)
    // 126 - full bitmask all magic damages (SPELL_SCHOOL_MASK_MAGIC) including wands
    // 127 - full bitmask any damages
    //
    // mods must be applied base at equipped weapon class and subclass comparison
    // with spell->EquippedItemClass and  EquippedItemSubClassMask and EquippedItemInventoryTypeMask
    // m_modifier.m_miscvalue comparison with item generated damage types

    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_NORMAL) != 0)
    {
        // apply generic physical damage bonuses including wand case
        if (GetSpellProto()->EquippedItemClass == -1 || target->GetTypeId() != TYPEID_PLAYER)
        {
            target->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND, TOTAL_VALUE, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_VALUE, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_RANGED, TOTAL_VALUE, float(m_modifier.m_amount), apply);
        }
        else
        {
            // done in Player::_ApplyWeaponDependentAuraMods
        }

        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            if (m_positive)
                target->ApplyModUInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_POS, m_modifier.m_amount, apply);
            else
                target->ApplyModUInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_NEG, m_modifier.m_amount, apply);
        }
    }

    // Skip non magic case for speedup
    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_MAGIC) == 0)
        return;

    if (GetSpellProto()->EquippedItemClass != -1 || GetSpellProto()->EquippedItemInventoryTypeMask != 0)
    {
        // wand magic case (skip generic to all item spell bonuses)
        // done in Player::_ApplyWeaponDependentAuraMods

        // Skip item specific requirements for not wand magic damage
        return;
    }

    // Magic damage modifiers implemented in Unit::SpellDamageBonusDone
    // This information for client side use only
    if (target->GetTypeId() == TYPEID_PLAYER)
    {
        if (m_positive)
        {
            for (int i = SPELL_SCHOOL_HOLY; i < MAX_SPELL_SCHOOL; ++i)
            {
                if ((m_modifier.m_miscvalue & (1 << i)) != 0)
                    target->ApplyModUInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_POS + i, m_modifier.m_amount, apply);
            }
        }
        else
        {
            for (int i = SPELL_SCHOOL_HOLY; i < MAX_SPELL_SCHOOL; ++i)
            {
                if ((m_modifier.m_miscvalue & (1 << i)) != 0)
                    target->ApplyModUInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_NEG + i, m_modifier.m_amount, apply);
            }
        }
        Pet* pet = target->GetPet();
        if (pet)
            pet->UpdateAttackPowerAndDamage();
    }
}

void Aura::HandleModDamagePercentDone(bool apply, bool Real)
{
    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "AURA MOD DAMAGE type:%u negative:%u", m_modifier.m_miscvalue, m_positive ? 0 : 1);
    Unit *target = GetTarget();

    // apply item specific bonuses for already equipped weapon
    if (Real && target->GetTypeId() == TYPEID_PLAYER)
    {
        for (int i = 0; i < MAX_ATTACK; ++i)
            if (Item* pItem = ((Player*)target)->GetWeaponForAttack(WeaponAttackType(i), true, false))
                ((Player*)target)->_ApplyWeaponDependentAuraDamageMod(pItem, WeaponAttackType(i), this, apply);
    }

    // m_modifier.m_miscvalue is bitmask of spell schools
    // 1 ( 0-bit ) - normal school damage (SPELL_SCHOOL_MASK_NORMAL)
    // 126 - full bitmask all magic damages (SPELL_SCHOOL_MASK_MAGIC) including wand
    // 127 - full bitmask any damages
    //
    // mods must be applied base at equipped weapon class and subclass comparison
    // with spell->EquippedItemClass and  EquippedItemSubClassMask and EquippedItemInventoryTypeMask
    // m_modifier.m_miscvalue comparison with item generated damage types

    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_NORMAL) != 0)
    {
        // apply generic physical damage bonuses including wand case
        if (GetSpellProto()->EquippedItemClass == -1 || target->GetTypeId() != TYPEID_PLAYER)
        {
            target->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND, TOTAL_PCT, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_PCT, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_RANGED, TOTAL_PCT, float(m_modifier.m_amount), apply);
        }
        else
        {
            // done in Player::_ApplyWeaponDependentAuraMods
        }
        // For show in client
        if (target->GetTypeId() == TYPEID_PLAYER)
            target->ApplyModSignedFloatValue(PLAYER_FIELD_MOD_DAMAGE_DONE_PCT, m_modifier.m_amount / 100.0f, apply);
    }

    // Skip non magic case for speedup
    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_MAGIC) == 0)
        return;

    if (GetSpellProto()->EquippedItemClass != -1 || GetSpellProto()->EquippedItemInventoryTypeMask != 0)
    {
        // wand magic case (skip generic to all item spell bonuses)
        // done in Player::_ApplyWeaponDependentAuraMods

        // Skip item specific requirements for not wand magic damage
        return;
    }

    // Magic damage percent modifiers implemented in Unit::SpellDamageBonusDone
    // Send info to client
    if (target->GetTypeId() == TYPEID_PLAYER)
        for (int i = SPELL_SCHOOL_HOLY; i < MAX_SPELL_SCHOOL; ++i)
            target->ApplyModSignedFloatValue(PLAYER_FIELD_MOD_DAMAGE_DONE_PCT + i, m_modifier.m_amount / 100.0f, apply);
}

void Aura::HandleModOffhandDamagePercent(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "AURA MOD OFFHAND DAMAGE");

    GetTarget()->HandleStatModifier(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

/********************************/
/***        POWER COST        ***/
/********************************/

void Aura::HandleModPowerCostPCT(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    float amount = m_modifier.m_amount / 100.0f;
    for (int i = 0; i < MAX_SPELL_SCHOOL; ++i)
        if (m_modifier.m_miscvalue & (1 << i))
            GetTarget()->ApplyModSignedFloatValue(UNIT_FIELD_POWER_COST_MULTIPLIER + i, amount, apply);
}

void Aura::HandleModPowerCost(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    for (int i = 0; i < MAX_SPELL_SCHOOL; ++i)
        if (m_modifier.m_miscvalue & (1 << i))
            GetTarget()->ApplyModInt32Value(UNIT_FIELD_POWER_COST_MODIFIER + i, m_modifier.m_amount, apply);
}

/*********************************************************/
/***                    OTHERS                         ***/
/*********************************************************/

void Aura::HandleShapeshiftBoosts(bool apply)
{
    uint32 spellId1 = 0;
    uint32 spellId2 = 0;
    uint32 HotWSpellId = 0;

    ShapeshiftForm form = ShapeshiftForm(GetModifier()->m_miscvalue);

    Unit *target = GetTarget();

    switch (form)
    {
        case FORM_CAT:
            spellId1 = 3025;
            HotWSpellId = 24900;
            break;
        case FORM_TREE:
            spellId1 = 5420;
            break;
        case FORM_TRAVEL:
            spellId1 = 5419;
            break;
        case FORM_AQUA:
            spellId1 = 5421;
            break;
        case FORM_BEAR:
            spellId1 = 1178;
            spellId2 = 21178;
            HotWSpellId = 24899;
            break;
        case FORM_DIREBEAR:
            spellId1 = 9635;
            spellId2 = 21178;
            HotWSpellId = 24899;
            break;
        case FORM_BATTLESTANCE:
            spellId1 = 21156;
            break;
        case FORM_DEFENSIVESTANCE:
            spellId1 = 7376;
            break;
        case FORM_BERSERKERSTANCE:
            spellId1 = 7381;
            break;
        case FORM_MOONKIN:
            spellId1 = 24905;
            break;
        case FORM_SPIRITOFREDEMPTION:
            spellId1 = 27792;
            spellId2 = 27795;                               // must be second, this important at aura remove to prevent to early iterator invalidation.
            break;
        case FORM_GHOSTWOLF:
        case FORM_AMBIENT:
        case FORM_GHOUL:
        case FORM_SHADOW:
        case FORM_STEALTH:
        case FORM_CREATURECAT:
        case FORM_CREATUREBEAR:
            break;
    }

    if (apply)
    {
        if (spellId1)
            target->AddAura(spellId1, 0, target);
        if (spellId2)
            target->AddAura(spellId2, 0, target);

        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            const PlayerSpellMap& sp_list = ((Player *)target)->GetSpellMap();
            for (PlayerSpellMap::const_iterator itr = sp_list.begin(); itr != sp_list.end(); ++itr)
            {
                if (itr->second.state == PLAYERSPELL_REMOVED) continue;
                if (itr->first == spellId1 || itr->first == spellId2) continue;
                SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);
                if (!spellInfo || !IsNeedCastSpellAtFormApply(spellInfo, form))
                    continue;
                target->CastSpell(target, itr->first, true, nullptr, this);
            }

            // Leader of the Pack
            if (((Player*)target)->HasSpell(17007))
            {
                SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(24932);
                if (spellInfo && spellInfo->Stances & (1 << (form - 1)))
                    target->CastSpell(target, 24932, true, nullptr, this);
            }

            // Heart of the Wild
            if (HotWSpellId)
            {
                Unit::AuraList const& mModTotalStatPct = target->GetAurasByType(SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE);
                for (Unit::AuraList::const_iterator i = mModTotalStatPct.begin(); i != mModTotalStatPct.end(); ++i)
                {
                    if ((*i)->GetSpellProto()->SpellIconID == 240 && (*i)->GetModifier()->m_miscvalue == 3)
                    {
                        int32 HotWMod = (*i)->GetModifier()->m_amount;
                        target->CastCustomSpell(target, HotWSpellId, &HotWMod, nullptr, nullptr, true, nullptr, this);
                        break;
                    }
                }
            }
        }
    }
    else
    {
        if (spellId1)
            target->RemoveAurasDueToSpell(spellId1);
        if (spellId2)
            target->RemoveAurasDueToSpell(spellId2);

        Unit::SpellAuraHolderMap& tAuras = target->GetSpellAuraHolderMap();
        for (Unit::SpellAuraHolderMap::iterator itr = tAuras.begin(); itr != tAuras.end();)
        {
            if (itr->second->IsRemovedOnShapeLost())
            {
                target->RemoveAurasDueToSpell(itr->second->GetId());
                itr = tAuras.begin();
            }
            else
                ++itr;
        }

        // Interrupt current shape specific spells
        for (uint32 i = CURRENT_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
            if (Spell* spell = target->GetCurrentSpell(CurrentSpellTypes(i)))
                if (IsRemovedOnShapeLostSpell(spell->m_spellInfo))
                    target->InterruptSpell(CurrentSpellTypes(i), false);
    }
}

void Aura::HandleAuraEmpathy(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_UNIT)
        return;

    CreatureInfo const * ci = ObjectMgr::GetCreatureTemplate(GetTarget()->GetEntry());
    if (ci && ci->type == CREATURE_TYPE_BEAST)
        GetTarget()->ApplyModUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_SPECIALINFO, apply);
}

void Aura::HandleAuraUntrackable(bool apply, bool /*Real*/)
{
    if (apply)
        GetTarget()->SetByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_UNTRACKABLE);
    else
        GetTarget()->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_UNTRACKABLE);
}

void Aura::HandleAuraModPacify(bool apply, bool /*Real*/)
{
    if (apply)
        GetTarget()->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
    else
        GetTarget()->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
}

void Aura::HandleAuraModPacifyAndSilence(bool apply, bool Real)
{
    HandleAuraModPacify(apply, Real);
    HandleAuraModSilence(apply, Real);
}

void Aura::HandleAuraGhost(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (apply)
        GetTarget()->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST);
    else
        GetTarget()->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST);

    if (((Player*)GetTarget())->GetGroup())
        ((Player*)GetTarget())->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_STATUS);
}

void Aura::HandleShieldBlockValue(bool apply, bool /*Real*/)
{
    BaseModType modType = FLAT_MOD;
    if (m_modifier.m_auraname == SPELL_AURA_MOD_SHIELD_BLOCKVALUE_PCT)
        modType = PCT_MOD;

    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        ((Player*)GetTarget())->HandleBaseModValue(SHIELD_BLOCK_VALUE, modType, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraRetainComboPoints(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *target = (Player*)GetTarget();

    // combo points was added in SPELL_EFFECT_ADD_COMBO_POINTS handler
    // remove only if aura expire by time (in case combo points amount change aura removed without combo points lost)
    if (!apply && m_removeMode == AURA_REMOVE_BY_EXPIRE && target->GetComboTargetGuid())
        if (Unit* unit = ObjectAccessor::GetUnit(*GetTarget(), target->GetComboTargetGuid()))
            target->AddComboPoints(unit, -m_modifier.m_amount);
}

void Aura::HandleModUnattackable(bool Apply, bool Real)
{
    if (Real && Apply)
    {
        GetTarget()->CombatStop();
        GetTarget()->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);
    }
    GetTarget()->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE, Apply);
}

void Aura::HandleSpiritOfRedemption(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    Unit *target = GetTarget();

    // prepare spirit state
    if (apply)
    {
        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            // disable breath/etc timers
            ((Player*)target)->StopMirrorTimers();

            // set stand state (expected in this form)
            if (!target->IsStandState())
                target->SetStandState(UNIT_STAND_STATE_STAND);
        }

        target->SetHealth(1);
    }
    // die at aura end
    else
        target->DealDamage(target, target->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, GetSpellProto(), false);
}

void Aura::HandleAuraAoeCharm(bool apply, bool real)
{
    if (!real)
        return;
    if (GetSpellProto()->Id == 28410) // Chains of Kel'Thuzad 
    {
        HandleModCharm(apply, real);
    }
}

void Aura::HandleSchoolAbsorb(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* caster = GetCaster();
    if (!caster)
        return;

    Unit *target = GetTarget();
    SpellEntry const* spellProto = GetSpellProto();
    if (apply)
    {
        // prevent double apply bonuses
        if (target->GetTypeId() != TYPEID_PLAYER || !((Player*)target)->GetSession()->PlayerLoading())
        {
            float DoneActualBenefit = 0.0f;
            switch (spellProto->SpellFamilyName)
            {
                case SPELLFAMILY_PRIEST:
                    // Power Word: Shield
                    if (spellProto->IsFitToFamilyMask<CF_PRIEST_POWER_WORD_SHIELD>())
                    {
                        //+10% from +healing bonus
                        DoneActualBenefit = caster->SpellBaseHealingBonusDone(GetSpellSchoolMask(spellProto)) * 0.1f;
                        break;
                    }
                    break;
                case SPELLFAMILY_MAGE:
                    // Frost ward, Fire ward
                    if (spellProto->IsFitToFamilyMask<CF_MAGE_FIRE_WARD, CF_MAGE_FROST_WARD>())
                    {
                        //+10% from +spd bonus
                        DoneActualBenefit = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(spellProto)) * 0.1f;
                        break;
                    }
                    break;
                case SPELLFAMILY_WARLOCK:
                    // Shadow Ward
                    if (spellProto->SpellIconID == 207 && spellProto->Category == 56)
                    {
                        //+10% from +spd bonus
                        DoneActualBenefit = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(spellProto)) * 0.1f;
                        break;
                    }
                    break;
                default:
                    break;
            }

            DoneActualBenefit *= caster->CalculateLevelPenalty(GetSpellProto());

            m_modifier.m_amount += (int32)DoneActualBenefit;

            // Power Word: Shield generates half the threat as healing for the same amount
            if (spellProto->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_POWER_WORD_SHIELD>() && spellProto->Id != 27779)
                caster->getHostileRefManager().threatAssist(caster, float(m_modifier.m_amount) * 0.25, spellProto);
        }
    }
}

void Aura::PeriodicTick(SpellEntry const* sProto, AuraType auraType, uint32 data)
{
    Unit *target = GetTarget();
    SpellEntry const* spellProto = sProto ? sProto : GetSpellProto();

    switch (sProto ? auraType : m_modifier.m_auraname)
    {
        case SPELL_AURA_PERIODIC_DAMAGE:
        case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
        {
            // don't damage target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            Unit *pCaster = GetCaster();
            if (!pCaster)
                return;

            if (spellProto->Effect[GetEffIndex()] == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
                    pCaster->SpellHitResult(target, spellProto, GetEffIndex(), false) != SPELL_MISS_NONE)
                return;

            // Check for immune (not use charges)
            if (target->IsImmuneToDamage(GetSpellSchoolMask(spellProto), spellProto))
                return;

            uint32 absorb = 0;
            uint32 resist = 0;
            CleanDamage cleanDamage = CleanDamage(0, BASE_ATTACK, MELEE_HIT_NORMAL, 0, 0);

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 amount = 0;
            if (!sProto)
                amount = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;
            else
                amount = data;

            uint32 pdamage;

            if (sProto)
            {
                if (auraType == SPELL_AURA_PERIODIC_DAMAGE)
                    pdamage = amount;
                else
                    pdamage = uint32(target->GetMaxHealth() * amount / 100);
            }
            else
            {
                if (m_modifier.m_auraname == SPELL_AURA_PERIODIC_DAMAGE)
                    pdamage = amount;
                else
                    pdamage = uint32(target->GetMaxHealth() * amount / 100);
            }

            // SpellDamageBonus for magic spells
            if (spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE || spellProto->DmgClass == SPELL_DAMAGE_CLASS_MAGIC)
                pdamage = target->SpellDamageBonusTaken(pCaster, spellProto, pdamage, DOT, GetStackAmount());
            // MeleeDamagebonus for weapon based spells
            else
            {
                WeaponAttackType attackType = GetWeaponAttackType(spellProto);
                pdamage = target->MeleeDamageBonusTaken(pCaster, pdamage, attackType, spellProto, DOT, GetStackAmount());
            }

            // Calculate armor mitigation if it is a physical spell
            // But not for bleed mechanic spells
            if (GetSpellSchoolMask(spellProto) & SPELL_SCHOOL_MASK_NORMAL && GetEffectMechanic(spellProto, m_effIndex) != MECHANIC_BLEED && !(spellProto->Custom & SPELL_CUSTOM_IGNORE_ARMOR))
            {
                uint32 pdamageReductedArmor = pCaster->CalcArmorReducedDamage(target, pdamage);
                cleanDamage.damage += pdamage - pdamageReductedArmor;
                pdamage = pdamageReductedArmor;
            }

            // TODO (Curse of Agony/Starshards):
            // only base damage should be affected, not whole damage

            // Curse of Agony damage-per-tick calculation
            if (spellProto->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_CURSE_OF_AGONY>())
            {
                // 1..4 ticks, 1/2 from normal tick damage
                if (GetAuraTicks() <= 4)
                    pdamage = pdamage / 2;
                // 9..12 ticks, 3/2 from normal tick damage
                else if (GetAuraTicks() >= 9)
                    pdamage += (pdamage + 1) / 2;       // +1 prevent 0.5 damage possible lost at 1..4 ticks
                // 5..8 ticks have normal tick damage
            }
            if (spellProto->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_STARSHARDS>())
            {
                //ticks: 2/3, 2/3, 1, 1, 4/3, 4/3
                float ticks[] = {0,.111f,.222f,.389f,.556f,.778f,1};
                float dmg = ticks[GetAuraTicks() -1];
                float ddone = ticks[GetAuraTicks()];
                pdamage *= 6;
                pdamage = std::round(std::round(pdamage * ddone) - pdamage * dmg);
            }


            target->CalculateDamageAbsorbAndResist(pCaster, GetSpellSchoolMask(spellProto), DOT, pdamage, &absorb, &resist, spellProto);

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s attacked %s for %u dmg inflicted by %u",
                              GetCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId());

            pCaster->DealDamageMods(target, pdamage, &absorb);

            // Set trigger flag
            uint32 procAttacker = PROC_FLAG_ON_DO_PERIODIC;
            uint32 procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;
            pdamage = (pdamage <= absorb + resist) ? 0 : (pdamage - absorb - resist);

            SpellPeriodicAuraLogInfo pInfo(this, pdamage, absorb, resist, 0.0f);
            target->SendPeriodicAuraLog(&pInfo, sProto ? auraType : SPELL_AURA_NONE);

            if (pdamage)
                procVictim |= PROC_FLAG_TAKEN_ANY_DAMAGE;

            pCaster->ProcDamageAndSpell(target, procAttacker, procVictim, PROC_EX_NORMAL_HIT, pdamage, BASE_ATTACK, spellProto);

            cleanDamage.absorb = absorb;
            cleanDamage.resist = resist;
            pCaster->DealDamage(target, pdamage, &cleanDamage, DOT, GetSpellSchoolMask(spellProto), spellProto, true);
            // Curse of Doom: If the target dies from this damage, there is a chance that a Doomguard will be summoned.
            if (spellProto->Id == 603 && !target->isAlive() && !urand(0, 9))
                pCaster->CastSpell(pCaster, 18662, true);
            break;
        }
        case SPELL_AURA_PERIODIC_LEECH:
        case SPELL_AURA_PERIODIC_HEALTH_FUNNEL:
        {
            // don't damage target if not alive, possible death persistent effects
            if (!target->IsInWorld() || !target->isAlive())
                return;

            Unit *pCaster = GetCaster();
            if (!pCaster)
                return;

            if (!pCaster->IsInWorld() || !pCaster->isAlive())
                return;

            if (spellProto->Effect[GetEffIndex()] == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
                    pCaster->SpellHitResult(target, spellProto, GetEffIndex(), false) != SPELL_MISS_NONE)
                return;

            // Check for immune
            if (target->IsImmuneToDamage(GetSpellSchoolMask(spellProto), spellProto))
                return;

            uint32 absorb = 0;
            uint32 resist = 0;
            CleanDamage cleanDamage =  CleanDamage(0, BASE_ATTACK, MELEE_HIT_NORMAL, 0, 0);

            uint32 pdamage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            //Calculate armor mitigation if it is a physical spell
            if (GetSpellSchoolMask(spellProto) & SPELL_SCHOOL_MASK_NORMAL)
            {
                uint32 pdamageReductedArmor = pCaster->CalcArmorReducedDamage(target, pdamage);
                cleanDamage.damage += pdamage - pdamageReductedArmor;
                pdamage = pdamageReductedArmor;
            }

            pdamage = target->SpellDamageBonusTaken(pCaster, spellProto, pdamage, DOT, GetStackAmount());

            target->CalculateDamageAbsorbAndResist(pCaster, GetSpellSchoolMask(spellProto), DOT, pdamage, &absorb, &resist, spellProto);

            if (target->GetHealth() < pdamage)
                pdamage = uint32(target->GetHealth());

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s health leech of %s for %u dmg inflicted by %u abs is %u",
                              GetCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId(), absorb);

            pCaster->DealDamageMods(target, pdamage, &absorb);

            pCaster->SendSpellNonMeleeDamageLog(target, GetId(), pdamage, GetSpellSchoolMask(spellProto), absorb, resist, false, 0);

            float multiplier = spellProto->EffectMultipleValue[GetEffIndex()] > 0 ? spellProto->EffectMultipleValue[GetEffIndex()] : 1;

            // Set trigger flag
            uint32 procAttacker = PROC_FLAG_ON_DO_PERIODIC;
            uint32 procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;

            pdamage = (pdamage <= absorb + resist) ? 0 : (pdamage - absorb - resist);
            if (pdamage)
                procVictim |= PROC_FLAG_TAKEN_ANY_DAMAGE;

            cleanDamage.absorb = absorb;
            cleanDamage.resist = resist;

            pCaster->ProcDamageAndSpell(target, procAttacker, procVictim, PROC_EX_NORMAL_HIT, pdamage, BASE_ATTACK, spellProto);
            int32 new_damage = pCaster->DealDamage(target, pdamage, &cleanDamage, DOT, GetSpellSchoolMask(spellProto), spellProto, false);

            if (!target->isAlive() && pCaster->IsNonMeleeSpellCasted(false))
                for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
                    if (Spell* spell = pCaster->GetCurrentSpell(CurrentSpellTypes(i)))
                        if (spell->m_spellInfo->Id == GetId())
                            spell->cancel();

            if (Player *modOwner = pCaster->GetSpellModOwner())
                modOwner->ApplySpellMod(GetId(), SPELLMOD_MULTIPLE_VALUE, multiplier);

            uint32 heal = int32(new_damage * multiplier);

            int32 gain = pCaster->DealHeal(pCaster, heal, spellProto);
            pCaster->getHostileRefManager().threatAssist(pCaster, gain * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            break;
        }
        case SPELL_AURA_PERIODIC_HEAL:
        case SPELL_AURA_OBS_MOD_HEALTH:
        {
            // don't heal target if not alive, mostly death persistent effects from items
            if (!target->isAlive())
                return;

            Unit *pCaster = GetCaster();
            if (!pCaster)
                return;

            // Don't heal target if it is already at max health. We still need
            // to do procs on the tick, however
            if (target->GetHealth() == target->GetMaxHealth())
            {
                uint32 procAttacker = PROC_FLAG_ON_DO_PERIODIC;
                uint32 procVictim = PROC_FLAG_ON_TAKE_PERIODIC;
                uint32 procEx = PROC_EX_NORMAL_HIT | PROC_EX_PERIODIC_POSITIVE;
                pCaster->ProcDamageAndSpell(target, procAttacker, procVictim, procEx, 1, BASE_ATTACK, spellProto);

                return;
            }

            // heal for caster damage (must be alive)
            if (target != pCaster && spellProto->SpellVisual == 163 && !pCaster->isAlive())
                return;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 amount = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            uint32 pdamage;

            if (m_modifier.m_auraname == SPELL_AURA_OBS_MOD_HEALTH)
                pdamage = uint32(target->GetMaxHealth() * amount / 100);
            else
                pdamage = amount;

            pdamage = target->SpellHealingBonusTaken(pCaster, spellProto, pdamage, DOT, GetStackAmount());

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s heal of %s for %u health inflicted by %u",
                              GetCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId());

            int32 gain = target->ModifyHealth(pdamage);
            SpellPeriodicAuraLogInfo pInfo(this, pdamage, 0, 0, 0.0f);
            target->SendPeriodicAuraLog(&pInfo);

            // Set trigger flag
            uint32 procAttacker = PROC_FLAG_ON_DO_PERIODIC;
            uint32 procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;
            uint32 procEx = PROC_EX_NORMAL_HIT | PROC_EX_PERIODIC_POSITIVE;
            pCaster->ProcDamageAndSpell(target, procAttacker, procVictim, procEx, gain, BASE_ATTACK, spellProto);

            target->getHostileRefManager().threatAssist(pCaster, float(gain) * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);

            // heal for caster damage, warlock's health funnel aldready cost hps
            if (target != pCaster && spellProto->SpellVisual == 163 &&
                !(spellProto->SpellFamilyName == SPELLFAMILY_WARLOCK &&
                spellProto->IsFitToFamilyMask<CF_WARLOCK_HEALTH_FUNNEL>()))
            {
                uint32 dmg = spellProto->manaPerSecond;
                if (pCaster->GetHealth() <= dmg && pCaster->GetTypeId() == TYPEID_PLAYER)
                {
                    pCaster->RemoveAurasDueToSpell(GetId());

                    // finish current generic/channeling spells, don't affect autorepeat
                    pCaster->FinishSpell(CURRENT_GENERIC_SPELL);
                    pCaster->FinishSpell(CURRENT_CHANNELED_SPELL);
                }
                else
                {
                    uint32 damage = gain;
                    uint32 absorb = 0;
                    pCaster->DealDamageMods(pCaster, damage, &absorb);
                    pCaster->SendSpellNonMeleeDamageLog(pCaster, GetId(), damage, GetSpellSchoolMask(spellProto), absorb, 0, false, 0, false);

                    CleanDamage cleanDamage =  CleanDamage(0, BASE_ATTACK, MELEE_HIT_NORMAL, absorb, 0);
                    pCaster->DealDamage(pCaster, damage, &cleanDamage, NODAMAGE, GetSpellSchoolMask(spellProto), spellProto, true);
                }
            }
            break;
        }
        case SPELL_AURA_PERIODIC_MANA_LEECH:
        {
            // don't damage target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            if (m_modifier.m_miscvalue < 0 || m_modifier.m_miscvalue >= MAX_POWERS)
                return;

            Powers power = Powers(m_modifier.m_miscvalue);

            // power type might have changed between aura applying and tick (druid's shapeshift)
            if (target->getPowerType() != power)
                return;

            Unit *pCaster = GetCaster();
            if (!pCaster)
                return;

            if (!pCaster->isAlive())
                return;

            if (GetSpellProto()->Effect[GetEffIndex()] == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
                    pCaster->SpellHitResult(target, spellProto, GetEffIndex(), false) != SPELL_MISS_NONE)
                return;

            // Check for immune (not use charges)
            if (target->IsImmuneToDamage(GetSpellSchoolMask(spellProto), spellProto))
                return;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 pdamage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s power leech of %s for %u dmg inflicted by %u",
                              GetCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId());

            int32 drain_amount = target->GetPower(power) > pdamage ? pdamage : target->GetPower(power);

            target->ModifyPower(power, -drain_amount);

            float gain_multiplier = 0;

            if (pCaster->GetMaxPower(power) > 0)
            {
                gain_multiplier = spellProto->EffectMultipleValue[GetEffIndex()];

                if (Player *modOwner = pCaster->GetSpellModOwner())
                    modOwner->ApplySpellMod(GetId(), SPELLMOD_MULTIPLE_VALUE, gain_multiplier);
            }

            SpellPeriodicAuraLogInfo pInfo(this, drain_amount, 0, 0, gain_multiplier);
            target->SendPeriodicAuraLog(&pInfo);

            int32 gain_amount = int32(drain_amount * gain_multiplier);

            if (gain_amount)
            {
                float threat = pCaster->ModifyPower(power, gain_amount) * sSpellMgr.GetSpellThreatMultiplier(spellProto);
                threat *= 0.5; // Mana Drain
                target->AddThreat(pCaster, threat, false, GetSpellSchoolMask(spellProto), spellProto);
            }
            if (target->GetPower(power) == 0)
            {
                if (spellProto->Id == 21056) //Marque de Kazzak
                {
                    // Explose quand y'a plus de mana a drainer
                    target->CastSpell(target, 21058, true);
                    GetHolder()->SetAuraDuration(0);
                }
            }

            // Improved Drain Mana
            auto improvedManaDrain1 = pCaster->GetAura(17864, EFFECT_INDEX_0);
            auto improvedManaDrain2 = pCaster->GetAura(18393, EFFECT_INDEX_0);

            if (improvedManaDrain2)
                PeriodicTick(improvedManaDrain2->GetHolder()->GetSpellProto(), SPELL_AURA_PERIODIC_DAMAGE, drain_amount * 0.3f);
            else if (improvedManaDrain1)
                PeriodicTick(improvedManaDrain1->GetHolder()->GetSpellProto(), SPELL_AURA_PERIODIC_DAMAGE, drain_amount * 0.15f);

            // Nostalrius: break des controles type 'AURA_INTERRUPT_FLAG_DAMAGE'
            target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_DAMAGE);
            break;
        }
        case SPELL_AURA_PERIODIC_ENERGIZE:
        {
            // don't energize target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 pdamage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s energize %s for %u dmg inflicted by %u",
                              GetCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId());

            if (m_modifier.m_miscvalue < 0 || m_modifier.m_miscvalue >= MAX_POWERS)
                break;

            Powers power = Powers(m_modifier.m_miscvalue);

            if (target->GetMaxPower(power) == 0)
                break;

            SpellPeriodicAuraLogInfo pInfo(this, pdamage, 0, 0, 0.0f);
            target->SendPeriodicAuraLog(&pInfo);

            int32 gain = target->ModifyPower(power, pdamage);

            if (power != POWER_MANA)     // 1.9 - Mana regeneration over time will no longer generate threat.
                if (Unit* pCaster = GetCaster())
                    target->getHostileRefManager().threatAssist(pCaster, float(gain) * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            break;
        }
        case SPELL_AURA_OBS_MOD_MANA:
        {
            // don't energize target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 amount = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            uint32 pdamage = uint32(target->GetMaxPower(POWER_MANA) * amount / 100);

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s energize %s for %u mana inflicted by %u",
                              GetCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId());

            if (target->GetMaxPower(POWER_MANA) == 0)
                break;

            SpellPeriodicAuraLogInfo pInfo(this, pdamage, 0, 0, 0.0f);
            target->SendPeriodicAuraLog(&pInfo);

            int32 gain = target->ModifyPower(POWER_MANA, pdamage);

            if (Unit* pCaster = GetCaster())
                target->getHostileRefManager().threatAssist(pCaster, float(gain) * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            break;
        }
        case SPELL_AURA_POWER_BURN_MANA:
        {
            // don't mana burn target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            Unit *pCaster = GetCaster();
            if (!pCaster)
                return;

            // Check for immune (not use charges)
            if (target->IsImmuneToDamage(GetSpellSchoolMask(spellProto), spellProto))
                return;

            int32 pdamage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            Powers powerType = Powers(m_modifier.m_miscvalue);

            if (!target->isAlive() || target->getPowerType() != powerType)
                return;

            uint32 gain = uint32(-target->ModifyPower(powerType, -pdamage));

            gain = uint32(gain * spellProto->EffectMultipleValue[GetEffIndex()]);

            // maybe has to be sent different to client, but not by SMSG_PERIODICAURALOG
            SpellNonMeleeDamage damageInfo(pCaster, target, spellProto->Id, SpellSchools(spellProto->School));
            pCaster->CalculateSpellDamage(&damageInfo, gain, spellProto);

            damageInfo.target->CalculateAbsorbResistBlock(pCaster, &damageInfo, spellProto);

            pCaster->DealDamageMods(damageInfo.target, damageInfo.damage, &damageInfo.absorb);

            pCaster->SendSpellNonMeleeDamageLog(&damageInfo);

            // Set trigger flag
            uint32 procAttacker = PROC_FLAG_ON_DO_PERIODIC;
            uint32 procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;
            uint32 procEx       = createProcExtendMask(&damageInfo, SPELL_MISS_NONE);
            if (damageInfo.damage)
                procVictim |= PROC_FLAG_TAKEN_ANY_DAMAGE;

            pCaster->ProcDamageAndSpell(damageInfo.target, procAttacker, procVictim, procEx, damageInfo.damage, BASE_ATTACK, spellProto);

            pCaster->DealSpellDamage(&damageInfo, true);
            break;
        }
        case SPELL_AURA_MOD_REGEN:
        {
            // don't heal target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            int32 gain = target->ModifyHealth(m_modifier.m_amount);
            if (Unit *caster = GetCaster())
                target->getHostileRefManager().threatAssist(caster, float(gain) * 0.5f  * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            // Eating anim
            if (spellProto->AuraInterruptFlags & AURA_INTERRUPT_FLAG_NOT_SEATED)
                target->HandleEmoteCommand(EMOTE_ONESHOT_EAT);
            break;
        }
        case SPELL_AURA_MOD_POWER_REGEN:
        {
            // don't energize target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            Powers pt = target->getPowerType();
            if (int32(pt) != m_modifier.m_miscvalue)
                return;

            if (spellProto->AuraInterruptFlags & AURA_INTERRUPT_FLAG_NOT_SEATED)
            {
                // eating anim
                target->HandleEmoteCommand(EMOTE_ONESHOT_EAT);
            }
            else if (GetId() == 20577)
            {
                // cannibalize anim
                target->HandleEmoteCommand(EMOTE_STATE_CANNIBALIZE);
            }

            // Anger Management
            // amount = 1+ 16 = 17 = 3,4*5 = 10,2*5/3
            // so 17 is rounded amount for 5 sec tick grow ~ 1 range grow in 3 sec
            if (pt == POWER_RAGE)
                target->ModifyPower(pt, m_modifier.m_amount * 3 / 5);
            break;
        }
        // Here tick dummy auras
        case SPELL_AURA_DUMMY:                              // some spells have dummy aura
        {
            PeriodicDummyTick();
            break;
        }
        case SPELL_AURA_PERIODIC_TRIGGER_SPELL:
        {
            TriggerSpell();
            break;
        }
        default:
            break;
    }
}

void Aura::PeriodicDummyTick()
{
    SpellEntry const* spell = GetSpellProto();
    Unit *target = GetTarget();
    switch (spell->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch (spell->Id)
            {
                // Forsaken Skills
                case 7054:
                {
                    uint32 spellRandom = urand(0, 14) + 7038;
                    sLog.outInfo("7054 %u", spellRandom);

                    target->CastSpell(target, spellRandom, true, nullptr, this);
                    // Possibly need cast one of them (but
                    // 7038 Forsaken Skill: Swords
                    // 7039 Forsaken Skill: Axes
                    // 7040 Forsaken Skill: Daggers
                    // 7041 Forsaken Skill: Maces
                    // 7042 Forsaken Skill: Staves
                    // 7043 Forsaken Skill: Bows
                    // 7044 Forsaken Skill: Guns
                    // 7045 Forsaken Skill: 2H Axes
                    // 7046 Forsaken Skill: 2H Maces
                    // 7047 Forsaken Skill: 2H Swords
                    // 7048 Forsaken Skill: Defense
                    // 7049 Forsaken Skill: Fire
                    // 7050 Forsaken Skill: Frost
                    // 7051 Forsaken Skill: Holy
                    // 7053 Forsaken Skill: Shadow
                    return;
                }
                case 7057:                                  // Haunting Spirits
                    if (roll_chance_i(33))
                        target->CastSpell(target, m_modifier.m_amount, true, nullptr, this);
                    return;
                case 24596:                                 // Intoxicating Venom
                    if (target->isInCombat() && urand(0, 99) < 7)
                        target->AddAura(8379); // Disarm
                    return;
            }
            break;
        }
        default:
            break;
    }
}

void Aura::HandlePreventFleeing(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit::AuraList const& fearAuras = GetTarget()->GetAurasByType(SPELL_AURA_MOD_FEAR);
    if (fearAuras.empty())
    {
        // Units may be feared without spell (Creature::DoFleeToGetAssistance)
        if (GetTarget()->GetTypeId() == TYPEID_UNIT)
            if (GetTarget()->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLEEING_MOTION_TYPE ||
                    GetTarget()->GetMotionMaster()->GetCurrentMovementGeneratorType() == ASSISTANCE_MOTION_TYPE ||
                    GetTarget()->GetMotionMaster()->GetCurrentMovementGeneratorType() == ASSISTANCE_DISTRACT_MOTION_TYPE ||
                    GetTarget()->GetMotionMaster()->GetCurrentMovementGeneratorType() == TIMED_FLEEING_MOTION_TYPE)
                GetTarget()->GetMotionMaster()->MovementExpired(false);
    }
    else
    {
        if (apply)
            GetTarget()->SetFeared(false, fearAuras.front()->GetCasterGuid());
        else
            GetTarget()->SetFeared(true, fearAuras.front()->GetCasterGuid(), fearAuras.front()->GetId());
    }
}

void Aura::HandleManaShield(bool apply, bool Real)
{
    if (!Real)
        return;

    // prevent double apply bonuses
    if (apply && (GetTarget()->GetTypeId() != TYPEID_PLAYER || !((Player*)GetTarget())->GetSession()->PlayerLoading()))
    {
        if (Unit* caster = GetCaster())
        {
            float DoneActualBenefit = 0.0f;

            // Mana Shield
            // 0% coeff in vanilla (changed patch 2.4.0)
            // if (GetSpellProto()->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_MANA_SHIELD>())
            //    DoneActualBenefit = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(GetSpellProto())) * 0.5f;

            // DoneActualBenefit *= caster->CalculateLevelPenalty(GetSpellProto());

            m_modifier.m_amount += (int32)DoneActualBenefit;
        }
    }
}

bool Aura::IsLastAuraOnHolder()
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (i != GetEffIndex() && GetHolder()->m_auras[i])
            return false;
    return true;
}

SpellAuraHolder::SpellAuraHolder(SpellEntry const* spellproto, Unit *target, WorldObject *caster, Item *castItem) :
    m_spellProto(spellproto), m_target(target), m_castItemGuid(castItem ? castItem->GetObjectGuid() : ObjectGuid()),
    m_auraSlot(MAX_AURAS), m_auraLevel(1), m_procCharges(0),
    m_stackAmount(1), m_removeMode(AURA_REMOVE_BY_DEFAULT), m_AuraDRGroup(DIMINISHING_NONE), m_timeCla(1000),
    m_permanent(false), m_isRemovedOnShapeLost(true), m_deleted(false), m_in_use(0),
    m_debuffLimitAffected(false), m_debuffLimitScore(0), _heartBeatRandValue(0), _pveHeartBeatData(nullptr),
    m_spellTriggered(false), m_AuraDRLevel(DIMINISHING_LEVEL_1)
{
    MANGOS_ASSERT(target);
    MANGOS_ASSERT(spellproto && spellproto == sSpellMgr.GetSpellEntry(spellproto->Id) && "`info` must be pointer to sSpellStore element");

    if (!caster)
        m_casterGuid = target->GetObjectGuid();
    else
    {
        // remove this assert when not unit casters will be supported
        MANGOS_ASSERT(caster->isType(TYPEMASK_UNIT))
        m_casterGuid = caster->GetObjectGuid();
    }

    m_applyTime      = time(nullptr);
    m_isPassive      = IsPassiveSpell(GetId()) || spellproto->Attributes == 0x80;
    m_isDeathPersist = IsDeathPersistentSpell(spellproto);
    m_isSingleTarget = IsSingleTargetSpell(spellproto);
    m_procCharges    = spellproto->procCharges;
    m_isChanneled    = IsChanneledSpell(spellproto);

    m_isRemovedOnShapeLost = m_casterGuid == m_target->GetObjectGuid() && IsRemovedOnShapeLostSpell(m_spellProto);

    // Exceptions
    // Attaques circulaires
    if (m_spellProto->Id == 12292)
        m_isRemovedOnShapeLost = false;

    Unit* unitCaster = caster && caster->isType(TYPEMASK_UNIT) ? (Unit*)caster : NULL;

    m_duration = m_maxDuration = CalculateSpellDuration(spellproto, unitCaster);

    if (m_maxDuration == -1 || (m_isPassive && spellproto->DurationIndex == 0))
        m_permanent = true;
    // Fix de l'affichage dans le journal de combat des buffs tres cours.
    // Exemple: immunite des trinket PvP.
    else if (m_maxDuration < 200)
    {
        m_duration = 300;
        m_maxDuration = 300;
    }

    if (unitCaster)
    {
        if (Player* modOwner = unitCaster->GetSpellModOwner())
            modOwner->ApplySpellMod(GetId(), SPELLMOD_CHARGES, m_procCharges);
    }

    // some custom stack values at aura holder create
    switch (m_spellProto->Id)
    {
        // some auras applied with max stack
        case 24575:                                         // Brittle Armor
        case 24659:                                         // Unstable Power
        case 24662:                                         // Restless Strength
        case 26464:                                         // Mercurial Shield
            m_stackAmount = m_spellProto->StackAmount;
            break;
    }

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        m_auras[i] = nullptr;
    m_makesTargetSecondaryFocus = !IsPositiveSpell(GetSpellProto()) && (GetSpellProto()->AuraInterruptFlags & AURA_INTERRUPT_FLAG_DAMAGE
                                                                    ||  IsSpellHaveAura(m_spellProto, SPELL_AURA_MOD_CONFUSE)
                                                                    ||  IsSpellHaveAura(m_spellProto, SPELL_AURA_MOD_FEAR));
}

void SpellAuraHolder::AddAura(Aura *aura, SpellEffectIndex index)
{
    ASSERT(index == aura->GetEffIndex());
    m_auras[index] = aura;
}

void SpellAuraHolder::RemoveAura(SpellEffectIndex index)
{
    m_auras[index] = nullptr;
}

void SpellAuraHolder::ApplyAuraModifiers(bool apply, bool real)
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX && !IsDeleted(); ++i)
        if (Aura *aur = GetAuraByEffectIndex(SpellEffectIndex(i)))
            aur->ApplyModifier(apply, real);
}

void SpellAuraHolder::_AddSpellAuraHolder()
{
    if (!GetId())
        return;
    if (!m_target)
        return;

    // Try find slot for aura
    uint8 slot = NULL_AURA_SLOT;
    Unit* caster = GetCaster();

    // Lookup free slot
    // will be < MAX_AURAS slot (if find free) with !secondaura
    if (IsNeedVisibleSlot(caster))
    {
        if (IsPositive())                                   // empty positive slot
        {
            for (uint8 i = 0; i < MAX_POSITIVE_AURAS; i++)
            {
                if (m_target->GetUInt32Value((uint16)(UNIT_FIELD_AURA + i)) == 0)
                {
                    slot = i;
                    break;
                }
            }
        }
        else                                                // empty negative slot
        {
            for (uint8 i = MAX_POSITIVE_AURAS; i < MAX_AURAS; i++)
            {
                if (m_target->GetUInt32Value((uint16)(UNIT_FIELD_AURA + i)) == 0)
                {
                    slot = i;
                    break;
                }
            }
        }
    }

    // set infinity cooldown state for spells
    if (caster)
    {
        if (m_spellProto->Attributes & SPELL_ATTR_DISABLED_WHILE_ACTIVE)
        {
            Item* castItem = nullptr;
            if (m_castItemGuid && caster->GetTypeId() == TYPEID_PLAYER)
                castItem = ((Player*)caster)->GetItemByGuid(m_castItemGuid);
            caster->AddSpellAndCategoryCooldowns(m_spellProto, castItem ? castItem->GetEntry() : 0, nullptr, true);
        }
    }

    SetAuraSlot(slot);

    // Not update fields for not first spell's aura, all data already in fields
    if (slot < MAX_AURAS)                                   // slot found
    {
        SetAura(slot, false);
        SetAuraFlag(slot, true);
        SetAuraLevel(slot, caster ? caster->getLevel() : sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL));
        UpdateAuraApplication();

        // update for out of range group members
        m_target->UpdateAuraForGroup(slot);

        UpdateAuraDuration();
    }

    //*****************************************************
    // Update target aura state flag (at 1 aura apply)
    // TODO: Make it easer
    //*****************************************************
    // Sitdown on apply aura req seated
    if (m_spellProto->AuraInterruptFlags & AURA_INTERRUPT_FLAG_NOT_SEATED && !m_target->IsSitState())
        m_target->SetStandState(UNIT_STAND_STATE_SIT);

    // register aura diminishing on apply
    if (getDiminishGroup() != DIMINISHING_NONE)
        m_target->ApplyDiminishingAura(getDiminishGroup(), true);

    // Update Seals information
    if (IsSealSpell(GetSpellProto()))
        m_target->ModifyAuraState(AURA_STATE_JUDGEMENT, true);
}

void SpellAuraHolder::_RemoveSpellAuraHolder()
{
    // Remove all triggered by aura spells vs unlimited duration
    // except same aura replace case
    if (m_removeMode != AURA_REMOVE_BY_STACK)
        CleanupTriggeredSpells();

    Unit* caster = GetCaster();

    if (caster && IsPersistent())
    {
        DynamicObject *dynObj = caster->GetDynObject(GetId());
        if (dynObj)
            dynObj->RemoveAffected(m_target);
    }

    //passive auras do not get put in slots
    // Note: but totem can be not accessible for aura target in time remove (to far for find in grid)
    //if(m_isPassive && !(caster && caster->GetTypeId() == TYPEID_UNIT && ((Creature*)caster)->isTotem()))
    //    return false;

    uint8 slot = GetAuraSlot();

    if (slot < MAX_AURAS)
    {
        if (m_target->GetUInt32Value((uint16)(UNIT_FIELD_AURA + slot)) == 0)
            return;
        SetAura(slot, true);
        SetAuraFlag(slot, false);
        SetAuraLevel(slot, caster ? caster->getLevel() : sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL));
    }

    // unregister aura diminishing (and store last time)
    if (getDiminishGroup() != DIMINISHING_NONE)
        m_target->ApplyDiminishingAura(getDiminishGroup(), false);

    m_procCharges = 0;
    m_stackAmount = 1;
    UpdateAuraApplication();

    if (m_removeMode != AURA_REMOVE_BY_DELETE)
    {
        // update for out of range group members
        if (slot < MAX_AURAS)
            m_target->UpdateAuraForGroup(slot);

        //*****************************************************
        // Update target aura state flag (at last aura remove)
        //*****************************************************
        uint32 removeState = 0;
        ClassFamilyMask removeFamilyFlag = m_spellProto->SpellFamilyFlags;
        switch (m_spellProto->SpellFamilyName)
        {
            case SPELLFAMILY_PALADIN:
                if (IsSealSpell(m_spellProto))
                    removeState = AURA_STATE_JUDGEMENT;     // Update Seals information
                break;
        }

        // Remove state (but need check other auras for it)
        if (removeState)
        {
            bool found = false;
            Unit::SpellAuraHolderMap const& holders = m_target->GetSpellAuraHolderMap();
            for (Unit::SpellAuraHolderMap::const_iterator i = holders.begin(); i != holders.end(); ++i)
            {
                SpellEntry const *auraSpellInfo = (*i).second->GetSpellProto();
                if (auraSpellInfo->IsFitToFamily(SpellFamily(m_spellProto->SpellFamilyName), removeFamilyFlag))
                {
                    found = true;
                    break;
                }
            }

            // this has been last aura
            if (!found)
                m_target->ModifyAuraState(AuraState(removeState), false);
        }

        // reset cooldown state for spells
        if (caster)
            if (GetSpellProto()->Attributes & SPELL_ATTR_DISABLED_WHILE_ACTIVE)
                // note: item based cooldowns and cooldown spell mods with charges ignored (unknown existing cases)
                caster->CooldownEvent(GetSpellProto());
    }
}

void SpellAuraHolder::CleanupTriggeredSpells()
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (!m_spellProto->EffectApplyAuraName[i])
            continue;

        uint32 tSpellId = m_spellProto->EffectTriggerSpell[i];
        if (!tSpellId)
            continue;

        SpellEntry const* tProto = sSpellMgr.GetSpellEntry(tSpellId);
        if (!tProto)
            continue;

        if (GetSpellDuration(tProto) != -1)
            continue;

        // needed for spell 43680, maybe others
        // TODO: is there a spell flag, which can solve this in a more sophisticated way?
        if (m_spellProto->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_TRIGGER_SPELL &&
                GetSpellDuration(m_spellProto) == int32(m_spellProto->EffectAmplitude[i]))
            continue;

        m_target->RemoveAurasDueToSpell(tSpellId);
    }
}

bool SpellAuraHolder::ModStackAmount(int32 num)
{
    uint32 protoStackAmount = m_spellProto->StackAmount;

    // Can`t mod
    if (!protoStackAmount)
        return true;

    // Modify stack but limit it
    int32 stackAmount = m_stackAmount + num;
    if (stackAmount > (int32)protoStackAmount)
        stackAmount = protoStackAmount;
    else if (stackAmount <= 0) // Last aura from stack removed
    {
        m_stackAmount = 0;
        return true; // need remove aura
    }

    // Update stack amount
    SetStackAmount(stackAmount);
    return false;
}

void SpellAuraHolder::SetStackAmount(uint32 stackAmount)
{
    Unit *target = GetTarget();
    Unit *caster = GetCaster();
    if (!target || !caster)
        return;

    bool refresh = stackAmount >= m_stackAmount;
    if (stackAmount != m_stackAmount)
    {
        m_stackAmount = stackAmount;
        UpdateAuraApplication();

        for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (Aura *aur = m_auras[i])
            {
                int32 bp = aur->GetBasePoints();
                int32 amount = m_stackAmount * caster->CalculateSpellDamage(target, m_spellProto, SpellEffectIndex(i), &bp);
                // Reapply if amount change
                if (amount != aur->GetModifier()->m_amount)
                {
                    aur->ApplyModifier(false, true);
                    aur->GetModifier()->m_amount = amount;
                    aur->ApplyModifier(true, true);
                }
            }
        }
    }

    if (refresh)
        // Stack increased refresh duration
        RefreshHolder();
}

Unit* SpellAuraHolder::GetCaster() const
{
    if (GetCasterGuid() == m_target->GetObjectGuid())
        return m_target;

    return ObjectAccessor::GetUnit(*m_target, m_casterGuid);// player will search at any maps
}

bool SpellAuraHolder::IsWeaponBuffCoexistableWith(SpellAuraHolder const* ref) const
{
    // only item casted spells
    if (!GetCastItemGuid())
        return false;

    // Exclude Debuffs
    if (!IsPositive())
        return false;

    // Exclude Non-generic Buffs and Executioner-Enchant
    if (GetSpellProto()->SpellFamilyName != SPELLFAMILY_GENERIC)
        return false;

    // Exclude Stackable Buffs [ie: Blood Reserve]
    if (GetSpellProto()->StackAmount)
        return false;

    // only self applied player buffs
    if (m_target->GetTypeId() != TYPEID_PLAYER || m_target->GetObjectGuid() != GetCasterGuid())
        return false;

    Item* castItem = ((Player*)m_target)->GetItemByGuid(GetCastItemGuid());
    if (!castItem)
        return false;

    // Limit to Weapon-Slots
    if (!castItem->IsEquipped() ||
            (castItem->GetSlot() != EQUIPMENT_SLOT_MAINHAND && castItem->GetSlot() != EQUIPMENT_SLOT_OFFHAND))
        return false;

    // form different weapons
    return ref->GetCastItemGuid() && ref->GetCastItemGuid() != GetCastItemGuid();
}

bool SpellAuraHolder::IsNeedVisibleSlot(Unit const* caster) const
{
    bool totemAura = caster && caster->GetTypeId() == TYPEID_UNIT && ((Creature*)caster)->IsTotem();

    // Check for persistent area auras that only do damage. If it has a secondary effect, it takes
    // up a slot
    bool persistent = m_spellProto->Effect[EFFECT_INDEX_0] == SPELL_EFFECT_PERSISTENT_AREA_AURA;
    bool persistentWithSecondaryEffect = false;

    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        // Check for persistent aura here since the effect aura is applied to the holder
        // by a dynamic object as the target passes through the object field, meaning
        // m_auras will be unset when this method is called (initialization)
        if (!m_auras[i] && !persistent)
            continue;

        // special area auras cases
        switch (m_spellProto->Effect[i])
        {
            case SPELL_EFFECT_APPLY_AREA_AURA_PET:
            case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                // passive auras (except totem auras) do not get placed in caster slot
                return (m_target != caster || totemAura || !m_isPassive) && m_auras[i]->GetModifier()->m_auraname != SPELL_AURA_NONE;

                break;
            case SPELL_EFFECT_PERSISTENT_AREA_AURA:
                // If spell aura applies something other than plain damage, it takes
                // up a debuff slot.
                if (m_spellProto->EffectApplyAuraName[i] != SPELL_AURA_PERIODIC_DAMAGE)
                    persistentWithSecondaryEffect = true;

                break;
            default:
                break;
        }
    }

    /*  Persistent area auras such as Blizzard/RoF/Volley do not get require debuff slots
        since they just do area damage with no additional effects. However, spells like
        Hurricane do since they have a secondary effect attached to them. There are enough
        persistent area spells in-game that making a switch for all of them is a bit
        unreasonable. Any spell with a secondary affect should take up a slot. Note
        that most (usable) persistent spells only deal damage.

        It was considered whether spells with secondary effects should still deal damage,
        even if there is no room for the other effect, however the debuff tooltip states
        that the spell causes damage AND slows, therefore it must take a debuff slot.
     */
    if (persistent && !persistentWithSecondaryEffect)
    {
        return false;
    }

    // necessary for some spells, e.g. Immolate visual passive 28330
    if (m_spellProto->SpellVisual)
        return true;

    // passive auras (except totem auras) do not get placed in the slots
    return !m_isPassive || totemAura;
}

void SpellAuraHolder::HandleSpellSpecificBoosts(bool apply)
{
    uint32 spellId1 = 0;
    uint32 spellId2 = 0;
    uint32 spellId3 = 0;
    uint32 spellId4 = 0;

    switch (GetSpellProto()->SpellFamilyName)
    {
        case SPELLFAMILY_SHAMAN:
        {
            // Nostalrius : Pas de marche sur l'eau + loup fantome.
            if (apply && GetSpellProto()->Id == 2645)
                if (Unit* pCaster = GetCaster())
                    if (Aura* aura = pCaster->GetAura(546, EFFECT_INDEX_0))
                        pCaster->RemoveAura(aura);
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            switch (GetId())
            {
                case 11189:                                 // Frost Warding
                case 28332:
                {
                    if (m_target->GetTypeId() == TYPEID_PLAYER && !apply)
                    {
                        // reflection chance (effect 1) of Frost Ward, applied in dummy effect
                        if (SpellModifier *mod = ((Player*)m_target)->GetSpellMod(SPELLMOD_EFFECT2, GetId()))
                            ((Player*)m_target)->AddSpellMod(mod, false);
                    }
                    return;
                }
                case 11094:                                 // Improved Fire Ward
                case 13043:
                {
                    if (m_target->GetTypeId() == TYPEID_PLAYER && !apply)
                    {
                        // reflection chance (effect 1) of Fire Ward, applied in dummy effect
                        if (SpellModifier *mod = ((Player*)m_target)->GetSpellMod(SPELLMOD_EFFECT2, GetId()))
                            ((Player*)m_target)->AddSpellMod(mod, false);
                    }
                    return;
                }
                default:
                    return;
            }
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            switch (GetId())
            {
                // The Beast Within and Bestial Wrath - immunity
                case 19574:
                {
                    spellId1 = 24395;
                    spellId2 = 24396;
                    spellId3 = 24397;
                    spellId4 = 26592;
                    break;
                }
                default:
                    return;
            }
            break;
        }
        default:
            return;
    }

    // prevent aura deletion, specially in multi-boost case
    SetInUse(true);

    if (apply)
    {
        if (spellId1)
            m_target->CastSpell(m_target, spellId1, true, nullptr, nullptr, GetCasterGuid());
        if (spellId2 && !IsDeleted())
            m_target->CastSpell(m_target, spellId2, true, nullptr, nullptr, GetCasterGuid());
        if (spellId3 && !IsDeleted())
            m_target->CastSpell(m_target, spellId3, true, nullptr, nullptr, GetCasterGuid());
        if (spellId4 && !IsDeleted())
            m_target->CastSpell(m_target, spellId4, true, nullptr, nullptr, GetCasterGuid());
    }
    else
    {
        if (spellId1)
            m_target->RemoveAurasByCasterSpell(spellId1, GetCasterGuid());
        if (spellId2)
            m_target->RemoveAurasByCasterSpell(spellId2, GetCasterGuid());
        if (spellId3)
            m_target->RemoveAurasByCasterSpell(spellId3, GetCasterGuid());
        if (spellId4)
            m_target->RemoveAurasByCasterSpell(spellId4, GetCasterGuid());
    }

    SetInUse(false);
}

void SpellAuraHolder::HandleCastOnAuraRemoval() const
{
    uint32 uiTriggeredSpell = 0;
    AuraRemoveMode mode = GetRemoveMode();

    switch (GetId())
    {
        case 26180:
        {
            if (mode == AURA_REMOVE_BY_DISPEL)
                uiTriggeredSpell = 26233;        // Wyvern Sting (AQ40, Princess Huhuran)
            break;
        }
        case 24002:
        case 24003:
        {
            if (mode == AURA_REMOVE_BY_EXPIRE)
                uiTriggeredSpell = 24004;        // Tranquilizing Poison (ZG, Razzashi Serpent)
            break;
        }
        default:
            return;
    }

    if (uiTriggeredSpell)
    {
        if (Unit* caster = GetCaster())
            caster->CastSpell(GetTarget(), uiTriggeredSpell, true);
        else
            GetTarget()->CastSpell(GetTarget(), uiTriggeredSpell, true);
    }
}

void Aura::HandleAuraSafeFall(bool Apply, bool Real)
{
    // implemented in WorldSession::HandleMovementOpcodes
}

SpellAuraHolder::~SpellAuraHolder()
{
    // note: auras in delete list won't be affected since they clear themselves from holder when adding to deletedAuraslist
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        delete m_auras[i];

    delete _pveHeartBeatData;
}

void SpellAuraHolder::Update(uint32 diff)
{
    // Battements de coeur : 2 fonctionnements.
    // PvP
    if (_heartBeatRandValue)
    {
        float diminishRate = GetDiminishingRate(m_AuraDRLevel);
        float elapsedTime = (m_maxDuration - m_duration) / 1000.0f;
        float averageBreakTime = 12.0f * diminishRate; // 50% chance to break after 12 secs
        float maxBreakTime = 15.0f * diminishRate;
        static const float chanceBreakAtMax = 1.0f; // 1% break > 15 secs. Patch 1.2: "Players now have an increasing chance to break free of the effect, such that it is unlikely the effect will last more than 15 seconds."
        static const float chanceBreakAtMaxLog = log((100 - chanceBreakAtMax) / chanceBreakAtMax);
        float coeff = (1.0f / (maxBreakTime - averageBreakTime)) * chanceBreakAtMaxLog;
        float currHeartBeatValue = 100.0f / (1.0f + exp(coeff * (averageBreakTime - elapsedTime)));
        DEBUG_UNIT(GetTarget(), DEBUG_DR, "|HB Duration [Curr%.2f|Max%u]. Value[Curr%.2f|Limit%.2f]",
                           elapsedTime, m_maxDuration / 1000, currHeartBeatValue, _heartBeatRandValue);
        if (_heartBeatRandValue <=  currHeartBeatValue)
        {
            if (Unit* pTarget = GetTarget())
                pTarget->RemoveSpellAuraHolder(this);
            return;
        }
    }
    // PvE
    if (_pveHeartBeatData)
    {
        if (_pveHeartBeatData->timer <= diff)
        {
            _pveHeartBeatData->timer += 5000 - diff;
            if (Unit* pTarget = GetTarget())
            {
                uint32 missChance = 10000 - _pveHeartBeatData->hitChance;
                uint32 rand = urand(0, 10000);

                if (rand < missChance)
                {
                    delete _pveHeartBeatData;
                    _pveHeartBeatData = nullptr;
                    pTarget->RemoveSpellAuraHolder(this);
                    return;
                }
            }
        }
        else
            _pveHeartBeatData->timer -= diff;
    }

    if (m_duration > 0)
    {
        m_duration -= diff;
        if (m_duration < 0)
            m_duration = 0;

        m_timeCla -= diff;

        if (m_timeCla <= 0)
        {
            if (Unit* caster = GetCaster())
            {
                Powers powertype = Powers(m_spellProto->powerType);
                int32 manaPerSecond = m_spellProto->manaPerSecond + m_spellProto->manaPerSecondPerLevel * caster->getLevel();
                m_timeCla = 1 * IN_MILLISECONDS;

                Unit* target = GetTarget();
                if (manaPerSecond && // avoid double cost for health funnel :
                    !(m_spellProto->SpellFamilyName == SPELLFAMILY_WARLOCK &&
                    m_spellProto->IsFitToFamilyMask<CF_WARLOCK_HEALTH_FUNNEL>() &&
                    target && (target->GetCharmerOrOwnerGuid() == GetCasterGuid())))
                {
                    if (powertype == POWER_HEALTH && int32(caster->GetHealth()) > manaPerSecond)
                        caster->ModifyHealth(-manaPerSecond);
                    else if (int32(caster->GetPower(powertype)) >= manaPerSecond)
                        caster->ModifyPower(powertype, -manaPerSecond);
                    else
                    {
                        if (target)
                            target->RemoveAurasDueToSpell(m_spellProto->Id, this);
                        if (m_isChanneled)
                            caster->InterruptSpell(CURRENT_CHANNELED_SPELL);
                        if (Player* plCaster = caster->ToPlayer())
                            Spell::SendCastResult(plCaster, m_spellProto, SPELL_FAILED_FIZZLE);
                    }
                }
            }
        }
    }

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura *aura = m_auras[i])
            aura->UpdateAura(diff);

    // Channeled aura required check distance from caster
    if (m_isChanneled && GetCasterGuid() != m_target->GetObjectGuid())
    {
        Unit* caster = GetCaster();
        if (!caster)
        {
            m_target->RemoveAurasByCasterSpell(GetId(), GetCasterGuid());
            return;
        }

        // Nostalrius : mise en combat
        if (!(GetSpellProto()->AttributesEx3 & SPELL_ATTR_EX3_NO_INITIAL_AGGRO) && !IsPositive() &&
                caster->isVisibleForOrDetect(m_target, m_target, false))
        {
            m_target->SetInCombatWith(caster);
            caster->SetInCombatWith(m_target);
        }
        // unlimited range
        if (m_spellProto->Custom & SPELL_CUSTOM_CHAN_NO_DIST_LIMIT)
            return;

        // need check distance for channeled target only
        if (caster->GetChannelObjectGuid() == m_target->GetObjectGuid())
        {
            // spell range + guessed interrupt leeway range
            float max_range = GetSpellMaxRange(sSpellRangeStore.LookupEntry(m_spellProto->rangeIndex));

            if (m_target->IsHostileTo(caster))
                max_range *= 1.33f;
            else // add radius of caster (see Spell::CheckRange)
                max_range += 1.25f;

            if (Player* modOwner = caster->GetSpellModOwner())
                modOwner->ApplySpellMod(GetId(), SPELLMOD_RANGE, max_range, nullptr);

            if (caster->GetCombatDistance(m_target) > max_range)
                caster->InterruptSpell(CURRENT_CHANNELED_SPELL);
        }
    }
}

void SpellAuraHolder::RefreshHolder()
{
    SetAuraDuration(GetAuraMaxDuration());
    UpdateAuraDuration();
}

/**
 * Updates periodic timers based on the current duration. Used for channeled spells
 * which are applied using dynamic objects, when we want the tick to be based on
 * the current spell timer rather than a fresh holder.
 * @param duration Custom duration to base tick on (typically in the case of passive auras)
 *
 */
void SpellAuraHolder::RefreshAuraPeriodicTimers(uint32 duration)
{
    for (int i = 0 ; i < MAX_EFFECT_INDEX; ++i)
    {
        if (Aura* pAura = GetAuraByEffectIndex(SpellEffectIndex(i)))
        {
            // If the aura is periodic, update the periodic timer to correspond with the new
            // aura timer
            if (pAura->IsPeriodic())
                pAura->UpdatePeriodicTimer(duration ? duration : m_duration);
        }
    }
}

void SpellAuraHolder::SetAuraMaxDuration(int32 duration)
{
    m_maxDuration = duration;

    // possible overwrite persistent state
    if (duration > 0)
    {
        if (!(IsPassive() && GetSpellProto()->DurationIndex == 0))
            SetPermanent(false);
    }
}

uint32 SpellAuraHolder::GetAuraPeriodicTickTimer(SpellEffectIndex index) const
{
    Aura *aur = m_auras[index];
    if (!aur)
        return -1;

    return aur->GetAuraPeriodicTimer();
}

bool SpellAuraHolder::HasMechanic(uint32 mechanic) const
{
    if (mechanic == m_spellProto->Mechanic)
        return true;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (m_auras[i] && m_spellProto->EffectMechanic[i] == mechanic)
            return true;
    return false;
}

bool SpellAuraHolder::HasMechanicMask(uint32 mechanicMask) const
{
    if (m_spellProto->Mechanic && mechanicMask & (1 << (m_spellProto->Mechanic - 1)))
        return true;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (m_auras[i] && m_spellProto->EffectMechanic[i] && ((1 << (m_spellProto->EffectMechanic[i] - 1)) & mechanicMask))
            return true;
    return false;
}

bool SpellAuraHolder::IsPersistent() const
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura *aur = m_auras[i])
            if (aur->IsPersistent())
                return true;
    return false;
}

bool SpellAuraHolder::IsAreaAura() const
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura *aur = m_auras[i])
            if (aur->IsAreaAura())
                return true;
    return false;
}

bool SpellAuraHolder::IsPositive() const
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura *aur = m_auras[i])
            if (!aur->IsPositive())
                return false;
    return true;
}

bool SpellAuraHolder::IsEmptyHolder() const
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (m_auras[i])
            return false;
    return true;
}

void SpellAuraHolder::UnregisterSingleCastHolder()
{
    if (IsSingleTarget())
    {
        if (Unit* caster = GetCaster())
            caster->GetSingleCastSpellTargets().erase(GetSpellProto());

        m_isSingleTarget = false;
    }
}

void SpellAuraHolder::SetAuraFlag(uint32 slot, bool add)
{
    uint32 index    = slot >> 3;
    uint32 byte     = (slot & 7) << 2;
    uint32 val      = m_target->GetUInt32Value(UNIT_FIELD_AURAFLAGS + index);
    if (add)
        val |= ((uint32)AFLAG_MASK << byte);
    else
        val &= ~((uint32)AFLAG_MASK << byte);

    m_target->SetUInt32Value(UNIT_FIELD_AURAFLAGS + index, val);
}

void SpellAuraHolder::SetAuraLevel(uint32 slot, uint32 level)
{
    uint32 index    = slot / 4;
    uint32 byte     = (slot % 4) * 8;
    uint32 val      = m_target->GetUInt32Value(UNIT_FIELD_AURALEVELS + index);
    val &= ~(0xFF << byte);
    val |= (level << byte);
    m_target->SetUInt32Value(UNIT_FIELD_AURALEVELS + index, val);
}

void SpellAuraHolder::UpdateAuraApplication()
{
    if (m_auraSlot >= MAX_AURAS)
        return;

    uint32 stackCount = m_procCharges > 0 ? m_procCharges * m_stackAmount : m_stackAmount;

    uint32 index    = m_auraSlot / 4;
    uint32 byte     = (m_auraSlot % 4) * 8;
    uint32 val      = m_target->GetUInt32Value(UNIT_FIELD_AURAAPPLICATIONS + index);
    val &= ~(0xFF << byte);
    // field expect count-1 for proper amount show, also prevent overflow at client side
    val |= ((uint8(stackCount <= 255 ? stackCount - 1 : 255 - 1)) << byte);
    m_target->SetUInt32Value(UNIT_FIELD_AURAAPPLICATIONS + index, val);
}

void SpellAuraHolder::UpdateAuraDuration() const
{
    if (GetAuraSlot() >= MAX_AURAS || m_isPassive)
        return;

    if (m_target->GetTypeId() == TYPEID_PLAYER)
    {
        WorldPacket data(SMSG_UPDATE_AURA_DURATION, 5);
        data << uint8(GetAuraSlot());
        data << uint32(GetAuraDuration());
        ((Player*)m_target)->SendDirectMessage(&data);
    }
}

void SpellAuraHolder::SetAffectedByDebuffLimit(bool isAffectedByDebuffLimit)
{
    m_debuffLimitAffected = isAffectedByDebuffLimit;
}

/** NOSTALRIUS
 Debuff limitation
    Categories:
     * 4 (highest)  Highest Priority Debuffs (Generally, a debuff that alters the ability of a mob to act normally)
     * 3            Generally, a standalone debuff ability intentionally casted that gives benefits group/raid wide
     * 2            Generally, a debuff that is a secondary result of some other ability but still gives raid-wide benefits
     * 1            Generally, debuffs that are intentionally cast, stand-alone damage-over-time abilities
     * 0            Generally, a debuff that is a secondarily applied damage-over-time effect
  */
void SpellAuraHolder::CalculateForDebuffLimit()
{
    m_debuffLimitAffected = true;
    m_debuffLimitScore = 0;

    // First, some exceptions
    switch (m_spellProto->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch (m_spellProto->Id)
            {
                // Hakkar's Blood Siphon
                case 24323:
                case 24322:
                case 28732: // Faerlina Widow's Embrace
                    m_debuffLimitScore = 4;
                    return;
            }
        }
        case SPELLFAMILY_PALADIN:
        {
            switch (m_spellProto->Id)
            {
                // Judgement of Wisdom (3 ranks)
                case 20186:
                case 20354:
                case 20355:
                // Judgement of Light
                case 20185: // r1
                case 20344: // r2
                case 20345: // r3
                case 20346: // r4
                    m_debuffLimitScore = 3;
                    return;
                // Judgement of the Crusader (6 ranks)
                case 21183:
                case 20188:
                case 20300:
                case 20301:
                case 20302:
                case 20303:
                    m_debuffLimitScore = 2;
                    return;
            }
        }
        case SPELLFAMILY_MAGE:
        {
            switch (m_spellProto->Id)
            {
                // Ignite talent trigger
                case 12654:
                    m_debuffLimitScore = 2;
                    return;
            }
        }
    }

    // Fireball
    if (m_spellProto->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_FIREBALL, CF_MAGE_CONJURE>())
    {
        m_debuffLimitScore = 0;
        return;
    }

    // Gestion des priorites par type d'aura
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (!m_spellProto->EffectApplyAuraName[i])
            continue;

        uint32 currEffectScore = 0;
        switch (m_spellProto->EffectApplyAuraName[i])
        {
            case SPELL_AURA_MOD_TAUNT:
            case SPELL_AURA_MOD_THREAT:
            case SPELL_AURA_MOD_CHARM:
            case SPELL_AURA_MOD_FEAR:
            case SPELL_AURA_MOD_CONFUSE:
            case SPELL_AURA_MOD_POSSESS:
            case SPELL_AURA_MOD_STUN:
                currEffectScore = 4;
                break;
            case SPELL_AURA_MOD_RESISTANCE:
            case SPELL_AURA_MOD_LANGUAGE:                   // Language curse
            case SPELL_AURA_MOD_STALKED:                    // Hunter mark
            case SPELL_AURA_MOD_DISARM:
            case SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN:
            case SPELL_AURA_PREVENTS_FLEEING:               // Curse of recklessness
            case SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE: // Winter's Chill
            case SPELL_AURA_MOD_MELEE_HASTE:
            case SPELL_AURA_MOD_ATTACK_POWER:
            case SPELL_AURA_MOD_DAMAGE_DONE:
            case SPELL_AURA_MOD_DAMAGE_TAKEN:
            case SPELL_AURA_MOD_HEALING_PCT:                // Mortal Strike
                currEffectScore = 3;
                break;
            case SPELL_AURA_PERIODIC_DAMAGE:
            case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
            case SPELL_AURA_PERIODIC_LEECH:
                currEffectScore = 1;
                break;
            case SPELL_AURA_RANGED_ATTACK_POWER_ATTACKER_BONUS: // Expose Weakness
                m_debuffLimitScore = 3;
                return;
            case SPELL_AURA_DUMMY:
                if (m_spellProto->SpellVisual == 3582 && m_spellProto->SpellIconID == 150) // Vampiric Embrace
                {
                    m_debuffLimitScore = 3;
                    return;
                }
                break;
        }
        if (currEffectScore > m_debuffLimitScore)
            m_debuffLimitScore = currEffectScore;
    }

    if (IsTriggered())
    {
        if (m_debuffLimitScore > 2)
            m_debuffLimitScore = 2;
        else
            m_debuffLimitScore = 0;
    }
    else if (m_isChanneled && m_debuffLimitScore < 1)
        m_debuffLimitScore = 1;
}

// Fix premiers tics
void Aura::CalculatePeriodic(Player * modOwner, bool create)
{
    //m_modifier.periodictime = GetSpellProto()->EffectAmplitude[m_effIndex];

    // prepare periodics
    switch (GetSpellProto()->EffectApplyAuraName[m_effIndex])
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
            m_isPeriodic = true;
            break;
        default:
            break;
    }

    if (!m_isPeriodic)
        return;

    // Apply casting time mods
    if (m_modifier.periodictime && modOwner)
    {
        // Apply periodic time mod
        modOwner->ApplySpellMod(GetId(), SPELLMOD_ACTIVATION_TIME, m_modifier.periodictime);
    }

    // Totem griffes de pierre
    if (GetSpellProto()->SpellVisual == 0 && GetSpellProto()->SpellIconID == 689)
        return;

    switch (GetId())
    {
        case 8145:  // Tremor Tortem Passive
        case 6474:  // Earthbind Totem Passive
        case 8179:  // Grounding Totem Passive
        case 8172:  // Disease Cleansing Totem Passive
        case 8167:  // Poison Cleansing Totem Passive
        case 8515:  // Windfury Totem Passive (Rank 1)
        case 10609: // Windfury Totem Passive (Rank 2)
        case 10612: // Windfury Totem Passive (Rank 3)
        case 13797: // Immolation Trap Effect (Rank 1)
        case 14298: // Immolation Trap Effect (Rank 2)
        case 14299: // Immolation Trap Effect (Rank 3)
        case 14300: // Immolation Trap Effect (Rank 4)
        case 14301: // Immolation Trap Effect (Rank 5)
        case 23184: // Mark of Frost
        case 25041: // Mark of Nature
            break;
        default:
            m_periodicTimer = m_modifier.periodictime;
    }
}

// Battements de coeur (chance de briser les CC)
void SpellAuraHolder::CalculateHeartBeat(Unit* caster, Unit* target)
{
    if (_pveHeartBeatData)
    {
        delete _pveHeartBeatData;
        _pveHeartBeatData = nullptr;
    }

    _heartBeatRandValue = 0;

    // Ni les sorts permanents, ni les sorts positifs ne sont affectes.
    // Check si positif fait dans Aura::Aura car ici le dernier Aura ajoute n'est pas encore dans 'm_auras'
    if (!m_permanent && m_maxDuration > 10000)
    {
        if (m_spellProto->Attributes & SPELL_ATTR_DIMINISHING_RETURNS
                // Exception pour la coiffe de controle gnome/Heaume-fusee gobelin
                || m_spellProto->Id == 13181 || m_spellProto->Id == 13327)
        {
            // Pour les joueurs
            if (target->GetCharmerOrOwnerPlayerOrPlayerItself())
                _heartBeatRandValue = rand_norm_f() * 100.0f;
        }
        // En PvE. Ne concerne pas certains sorts avec DR (fear geres avec dmg par exemple).
        if (caster && target->GetTypeId() == TYPEID_UNIT && m_spellProto->IsPvEHeartBeat())
        {
            _pveHeartBeatData = new HeartBeatData;
            _pveHeartBeatData->timer = 5000;
            _pveHeartBeatData->hitChance = caster->MagicSpellHitChance(target, m_spellProto);
        }
    }
}

void Aura::HandleInterruptRegen(bool apply, bool real)
{
    if (!real)
        return;
    if (!apply)
        return;
    GetTarget()->SetInCombatState(false);
}

// Un nouvel aura ...
void Aura::HandleAuraAuraSpell(bool apply, bool real)
{
    Unit* target = GetTarget();
    if (!real || !target)
        return;
    uint32 spell = GetSpellProto()->EffectTriggerSpell[m_effIndex];
    if (apply)
        target->AddAura(spell, ADD_AURA_PASSIVE, target);
    else
        target->RemoveAurasDueToSpell(spell);
}


// Auras exclusifs
/*
Sorts d'exemple:
11364 (+50), 21849 (+15)
*/

bool _IsExclusiveSpellAura(SpellEntry const* spellproto, SpellEffectIndex eff, AuraType auraname)
{
    // Flametongue Totem / Totem of Wrath / Strength of Earth Totem / Fel Intelligence / Leader of the Pack
    // Moonkin Aura / Mana Spring Totem / Tree of Life Aura / Improved Devotion Aura / Improved Icy Talons / Trueshot Aura
    // Improved Moonkin Form / Sanctified Retribution Aura / Blood Pact
    if (spellproto->Effect[eff] == SPELL_EFFECT_APPLY_AREA_AURA_RAID)
        return false;

    // Exceptions - se stack avec tout.
    switch (spellproto->Id)
    {
        // Terres foudroyees et Zanza
        case 10693:
        case 10691: // +25 esprit
        case 10668:
        case 10671: // +25 endu
        case 10667:
        case 10670: // +25 force
        case 10669:
        case 10672: // +25 agi
        case 10692:
        case 10690: // +25 intel
        case 24382:             // Buff zanza
        // Alcools
        case 25804:
        case 20875:
        case 25722:
        case 25037:
        case 22789:
        case 22790:
        case 6114:
        case 5020:
        case 5021:
        case 23179: //le proc de l'�p�e de Razorgore (+300 force) devrait se cumuler avec TOUT : ID 23179
        case 20007: //le proc Crois� devrait se cumuler avec TOUT : ID 20007
        case 20572: //Le racial Orc (ID 20572)
        case 17038: //l'Eau des Tombe-Hiver (ID 17038)
        case 16329: //le Juju's Might (ID 16329)
        case 25891: //le buff du Bijou Choc de Terre (ID : 25891)
        case 18264: // Charge du maitre (baton epique scholo)
        case 12022: // Chapeau pirate
        case 22817: // PA HT Nord
        // Aura de precision (hunt)
        case 19506:
        case 20905:
        case 20906:
        case 18262: // Pierre � Aiguiser El�mentaire (+2% crit)
        case 24932: // chef de la Meute
        case 24907: // aura S�l�nien
        case 22888: // Buff Onyxia
        case 15366: // Buff Felwood
        case 22820: // HT +3% crit sorts
        case 17628: // Supreme Power
        case 22730: // Bouffe +10 Intell
        case 18141: // Bouffe +10 Esprit
        case 18125: // Bouffe +10 Force
        case 18192: // Bouffe +10 Agility
        case 18191: // Bouffe +10 Endu
        case 25661: // Bouffe +25 Endu
        case 24427: // Diamond Flask
        case 17528: // Mighty Rage Potion
        case 23697: // Alterac Spring Water
            return false;

        case 17538: // Le +crit du buff de l'Elixir de la Mangouste 17538, devrait se stack avec TOUT.
            return (eff == EFFECT_INDEX_0);
    }
    switch (spellproto->SpellFamilyName)
    {
        case SPELLFAMILY_WARLOCK:
            // Blood Pact
            if (spellproto->IsFitToFamilyMask<CF_WARLOCK_IMP_BUFFS>())
                return false;
            break;
        case SPELLFAMILY_SHAMAN:
            // Strength of Earth (ID 8076, 8162, 8163, 10441, 25362)
            if (spellproto->IsFitToFamilyMask<CF_SHAMAN_STRENGTH_OF_EARTH>())
                return false;
            break;
        case SPELLFAMILY_WARRIOR:
            // Battle Shout (ID 6673, 5242, 6192, 11549, 11550, 11551, 25289)
            if (spellproto->IsFitToFamilyMask<CF_WARRIOR_BATTLE_SHOUT>())
                return false;
            break;
        case SPELLFAMILY_PALADIN:
            // Blessing of Might (ID 19740, 19834, 19835, 19836, 19837, 19838, 25291, 25782, 25916)
            if (spellproto->IsFitToFamilyMask<CF_PALADIN_BLESSING_OF_MIGHT, CF_PALADIN_BLESSINGS>())
                return false;
            break;
        case SPELLFAMILY_HUNTER:
            // Aspect of the Hawk
            if (spellproto->IsFitToFamilyMask<CF_HUNTER_ASPECT_OF_THE_HAWK>())
                return false;
            break;
    }

    // La bouffe
    if (spellproto->AttributesEx2 & SPELL_ATTR_EX2_FOOD_BUFF)
        return false;

    switch (auraname)
    {
        //case SPELL_AURA_PERIODIC_DAMAGE:
        //case SPELL_AURA_DUMMY:
        //    return false;
        case SPELL_AURA_MOD_HEALING_DONE:                               // Demonic Pact
        case SPELL_AURA_MOD_DAMAGE_DONE:                                // Demonic Pact
        case SPELL_AURA_MOD_ATTACK_POWER_PCT:                           // Abomination's Might / Unleashed Rage
        case SPELL_AURA_MOD_RANGED_ATTACK_POWER_PCT:
        case SPELL_AURA_MOD_ATTACK_POWER:                               // (Greater) Blessing of Might / Battle Shout
        case SPELL_AURA_MOD_RANGED_ATTACK_POWER:
        case SPELL_AURA_MOD_POWER_REGEN:                                // (Greater) Blessing of Wisdom
        case SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN:                       // Glyph of Salvation / Pain Suppression / Safeguard ?
        case SPELL_AURA_MOD_STAT:
            return true;
        case SPELL_AURA_MOD_SPELL_CRIT_CHANCE:
            return true;
        case SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE:                 // Winter's Chill / Improved Scorch
            if (spellproto->SpellFamilyName == SPELLFAMILY_MAGE)
                return false;
            return true;
        case SPELL_AURA_MOD_RESISTANCE_EXCLUSIVE: // A gere autrement (exlusif par rapport a la resistance)
            return false;
        case SPELL_AURA_MOD_HEALING_PCT:                                // Mortal Strike / Wound Poison / Aimed Shot / Furious Attacks
            // Healing taken debuffs
            if (spellproto->EffectBasePoints[eff] < 0)
                return false;
            return true;
        case SPELL_AURA_MOD_RESISTANCE_PCT:
            // Ancestral Healing / Inspiration
            if (spellproto->SpellFamilyName == SPELLFAMILY_SHAMAN ||
                    spellproto->SpellFamilyName == SPELLFAMILY_PRIEST)
                return false;
            return true;
        default:
            return false;
    }
}

void Aura::ComputeExclusive()
{
    m_exclusive = false;
    //return;
    if (GetHolder()->IsPassive() || !GetHolder()->IsPositive())
        return;
    m_exclusive = _IsExclusiveSpellAura(GetSpellProto(), GetEffIndex(), GetModifier()->m_auraname);
}

// Resultat :
// - 0 : pas dans la meme categorie.
// - 1 : je suis plus important. Je m'applique.
// - 2 : il est plus important. Il s'applique.
int Aura::CheckExclusiveWith(Aura const* other) const
{
    ASSERT(IsExclusive());
    ASSERT(other);
    ASSERT(other->IsExclusive());
    if (other->GetModifier()->m_auraname != GetModifier()->m_auraname)
        return 0;
    if (other->GetModifier()->m_miscvalue != GetModifier()->m_miscvalue)
        return 0;
    if (other->GetSpellProto()->EffectItemType[other->GetEffIndex()] != GetSpellProto()->EffectItemType[GetEffIndex()])
        return 0;

    // Lui est mieux
    if (other->GetModifier()->m_amount > GetModifier()->m_amount)
        return 2;
    return 1;
}

bool Aura::ExclusiveAuraCanApply()
{
    Unit* target = GetTarget();
    ASSERT(target);
    if (Aura* mostImportant = target->GetMostImportantAuraAfter(this, this))
    {
        // Il y a un souci dans le sort.
        if (mostImportant->IsInUse())
        {
            sLog.outInfo("[%s:Map%u:Aura%u:AuraImportant%u] Aura::ExclusiveAuraCanApply IsInUse", target->GetName(), target->GetMapId(), GetId(), mostImportant->GetId());
            return false;
        }
        ASSERT(!mostImportant->IsInUse());
        int checkResult = CheckExclusiveWith(mostImportant);
        switch (checkResult)
        {
            case 1: // Je suis plus important.
                // Normalement, 'mostImportant' en etant le plus important de sa categorie
                // doit etre applique.
                if (!mostImportant->IsApplied())
                {
                    sLog.outInfo("[%s:Map%u:Aura%u:AuraImportant%u] Aura::ExclusiveAuraCanApply IsApplied", target->GetName(), target->GetMapId(), GetId(), mostImportant->GetId());
                    return false;
                }
                ASSERT(mostImportant->IsApplied());
                // On le desactive, et je m'active.
                mostImportant->ApplyModifier(false, true, true);
                break;
            case 2: // Il est plus important, je le laisse.
                return false;
            case 0: // Impossible.
                ASSERT(false);
            default: // Impossible aussi
                ASSERT(false);
        }
    }
    // Pas d'autre aura trouve, je m'applique.
    return true;
}

void Aura::ExclusiveAuraUnapply()
{
    Unit* target = GetTarget();
    ASSERT(target);
    // On restaure le precedent plus grand aura.
    if (Aura* mostImportant = target->GetMostImportantAuraAfter(this, this))
    {
        if (mostImportant->IsInUse())
        {
            sLog.outInfo("[%s:Map%u:Aura%u:AuraImportant%u] Aura::ExclusiveAuraUnapply IsInUse", target->GetName(), target->GetMapId(), GetId(), mostImportant->GetId());
            return;
        }
        if (mostImportant->IsApplied())
        {
            sLog.outInfo("[%s:Map%u:Aura%u:AuraImportant%u] Aura::ExclusiveAuraUnapply IsApplied", target->GetName(), target->GetMapId(), GetId(), mostImportant->GetId());
            return;
        }
        ASSERT(!mostImportant->IsInUse());
        ASSERT(!mostImportant->IsApplied());
        mostImportant->ApplyModifier(true, true, true);
    }
}
