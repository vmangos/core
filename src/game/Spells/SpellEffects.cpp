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
#include "Opcodes.h"
#include "Log.h"
#include "UpdateMask.h"
#include "World.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "Player.h"
#include "SkillExtraItems.h"
#include "Unit.h"
#include "Spell.h"
#include "DynamicObject.h"
#include "SpellAuras.h"
#include "Group.h"
#include "UpdateData.h"
#include "MapManager.h"
#include "ObjectAccessor.h"
#include "SharedDefines.h"
#include "Pet.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "GossipDef.h"
#include "Creature.h"
#include "Totem.h"
#include "CreatureAI.h"
#include "BattleGroundMgr.h"
#include "BattleGround.h"
#include "BattleGroundWS.h"
#include "Language.h"
#include "SocialMgr.h"
#include "VMapFactory.h"
#include "Util.h"
#include "TemporarySummon.h"
#include "MoveMapSharedDefines.h"

#include "InstanceData.h"
#include "ScriptMgr.h"

pEffect SpellEffects[TOTAL_SPELL_EFFECTS] =
{
    &Spell::EffectNULL,                                     //  0
    &Spell::EffectInstaKill,                                //  1 SPELL_EFFECT_INSTAKILL
    &Spell::EffectSchoolDMG,                                //  2 SPELL_EFFECT_SCHOOL_DAMAGE
    &Spell::EffectDummy,                                    //  3 SPELL_EFFECT_DUMMY
    &Spell::EffectUnused,                                   //  4 SPELL_EFFECT_PORTAL_TELEPORT          unused from pre-1.2.1
    &Spell::EffectTeleportUnits,                            //  5 SPELL_EFFECT_TELEPORT_UNITS
    &Spell::EffectApplyAura,                                //  6 SPELL_EFFECT_APPLY_AURA
    &Spell::EffectEnvironmentalDMG,                         //  7 SPELL_EFFECT_ENVIRONMENTAL_DAMAGE
    &Spell::EffectPowerDrain,                               //  8 SPELL_EFFECT_POWER_DRAIN
    &Spell::EffectHealthLeech,                              //  9 SPELL_EFFECT_HEALTH_LEECH
    &Spell::EffectHeal,                                     // 10 SPELL_EFFECT_HEAL
    &Spell::EffectBind,                                     // 11 SPELL_EFFECT_BIND
    &Spell::EffectUnused,                                   // 12 SPELL_EFFECT_PORTAL                   unused from pre-1.2.1, exist 2 spell, but not exist any data about its real usage
    &Spell::EffectUnused,                                   // 13 SPELL_EFFECT_RITUAL_BASE              unused from pre-1.2.1
    &Spell::EffectUnused,                                   // 14 SPELL_EFFECT_RITUAL_SPECIALIZE        unused from pre-1.2.1
    &Spell::EffectUnused,                                   // 15 SPELL_EFFECT_RITUAL_ACTIVATE_PORTAL   unused from pre-1.2.1
    &Spell::EffectQuestComplete,                            // 16 SPELL_EFFECT_QUEST_COMPLETE
    &Spell::EffectWeaponDmg,                                // 17 SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL
    &Spell::EffectResurrect,                                // 18 SPELL_EFFECT_RESURRECT
    &Spell::EffectAddExtraAttacks,                          // 19 SPELL_EFFECT_ADD_EXTRA_ATTACKS
    &Spell::EffectEmpty,                                    // 20 SPELL_EFFECT_DODGE                    one spell: Dodge
    &Spell::EffectEmpty,                                    // 21 SPELL_EFFECT_EVADE                    one spell: Evade (DND)
    &Spell::EffectParry,                                    // 22 SPELL_EFFECT_PARRY
    &Spell::EffectBlock,                                    // 23 SPELL_EFFECT_BLOCK                    one spell: Block
    &Spell::EffectCreateItem,                               // 24 SPELL_EFFECT_CREATE_ITEM
    &Spell::EffectEmpty,                                    // 25 SPELL_EFFECT_WEAPON                   spell per weapon type, in ItemSubclassmask store mask that can be used for usability check at equip, but current way using skill also work.
    &Spell::EffectEmpty,                                    // 26 SPELL_EFFECT_DEFENSE                  one spell: Defense
    &Spell::EffectPersistentAA,                             // 27 SPELL_EFFECT_PERSISTENT_AREA_AURA
    &Spell::EffectSummon,                                   // 28 SPELL_EFFECT_SUMMON
    &Spell::EffectLeapForward,                              // 29 SPELL_EFFECT_LEAP
    &Spell::EffectEnergize,                                 // 30 SPELL_EFFECT_ENERGIZE
    &Spell::EffectWeaponDmg,                                // 31 SPELL_EFFECT_WEAPON_PERCENT_DAMAGE
    &Spell::EffectTriggerMissileSpell,                      // 32 SPELL_EFFECT_TRIGGER_MISSILE
    &Spell::EffectOpenLock,                                 // 33 SPELL_EFFECT_OPEN_LOCK
    &Spell::EffectSummonChangeItem,                         // 34 SPELL_EFFECT_SUMMON_CHANGE_ITEM
    &Spell::EffectApplyAreaAura,                            // 35 SPELL_EFFECT_APPLY_AREA_AURA_PARTY
    &Spell::EffectLearnSpell,                               // 36 SPELL_EFFECT_LEARN_SPELL
    &Spell::EffectEmpty,                                    // 37 SPELL_EFFECT_SPELL_DEFENSE            one spell: SPELLDEFENSE (DND)
    &Spell::EffectDispel,                                   // 38 SPELL_EFFECT_DISPEL
    &Spell::EffectEmpty,                                    // 39 SPELL_EFFECT_LANGUAGE                 misc store lang id
    &Spell::EffectDualWield,                                // 40 SPELL_EFFECT_DUAL_WIELD
    &Spell::EffectSummonWild,                               // 41 SPELL_EFFECT_SUMMON_WILD
    &Spell::EffectSummonGuardian,                           // 42 SPELL_EFFECT_SUMMON_GUARDIAN
    &Spell::EffectTeleUnitsFaceCaster,                      // 43 SPELL_EFFECT_TELEPORT_UNITS_FACE_CASTER
    &Spell::EffectLearnSkill,                               // 44 SPELL_EFFECT_SKILL_STEP
    &Spell::EffectAddHonor,                                 // 45 SPELL_EFFECT_ADD_HONOR                honor/pvp related
    &Spell::EffectNULL,                                     // 46 SPELL_EFFECT_SPAWN                    spawn/login animation, expected by spawn unit cast, also base points store some dynflags
    &Spell::EffectTradeSkill,                               // 47 SPELL_EFFECT_TRADE_SKILL
    &Spell::EffectUnused,                                   // 48 SPELL_EFFECT_STEALTH                  one spell: Base Stealth
    &Spell::EffectUnused,                                   // 49 SPELL_EFFECT_DETECT                   one spell: Detect
    &Spell::EffectTransmitted,                              // 50 SPELL_EFFECT_TRANS_DOOR
    &Spell::EffectUnused,                                   // 51 SPELL_EFFECT_FORCE_CRITICAL_HIT       unused from pre-1.2.1
    &Spell::EffectUnused,                                   // 52 SPELL_EFFECT_GUARANTEE_HIT            unused from pre-1.2.1
    &Spell::EffectEnchantItemPerm,                          // 53 SPELL_EFFECT_ENCHANT_ITEM
    &Spell::EffectEnchantItemTmp,                           // 54 SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY
    &Spell::EffectTameCreature,                             // 55 SPELL_EFFECT_TAMECREATURE
    &Spell::EffectSummonPet,                                // 56 SPELL_EFFECT_SUMMON_PET
    &Spell::EffectLearnPetSpell,                            // 57 SPELL_EFFECT_LEARN_PET_SPELL
    &Spell::EffectWeaponDmg,                                // 58 SPELL_EFFECT_WEAPON_DAMAGE
    &Spell::EffectOpenLock,                                 // 59 SPELL_EFFECT_OPEN_LOCK_ITEM
    &Spell::EffectProficiency,                              // 60 SPELL_EFFECT_PROFICIENCY
    &Spell::EffectSendEvent,                                // 61 SPELL_EFFECT_SEND_EVENT
    &Spell::EffectPowerBurn,                                // 62 SPELL_EFFECT_POWER_BURN
    &Spell::EffectThreat,                                   // 63 SPELL_EFFECT_THREAT
    &Spell::EffectTriggerSpell,                             // 64 SPELL_EFFECT_TRIGGER_SPELL
    &Spell::EffectUnused,                                   // 65 SPELL_EFFECT_HEALTH_FUNNEL            unused
    &Spell::EffectUnused,                                   // 66 SPELL_EFFECT_POWER_FUNNEL             unused from pre-1.2.1
    &Spell::EffectHealMaxHealth,                            // 67 SPELL_EFFECT_HEAL_MAX_HEALTH
    &Spell::EffectInterruptCast,                            // 68 SPELL_EFFECT_INTERRUPT_CAST
    &Spell::EffectDistract,                                 // 69 SPELL_EFFECT_DISTRACT
    &Spell::EffectPull,                                     // 70 SPELL_EFFECT_PULL                     one spell: Distract Move
    &Spell::EffectPickPocket,                               // 71 SPELL_EFFECT_PICKPOCKET
    &Spell::EffectAddFarsight,                              // 72 SPELL_EFFECT_ADD_FARSIGHT
    &Spell::EffectSummonGuardian,                           // 73 SPELL_EFFECT_SUMMON_POSSESSED
    &Spell::EffectSummonTotem,                              // 74 SPELL_EFFECT_SUMMON_TOTEM
    &Spell::EffectHealMechanical,                           // 75 SPELL_EFFECT_HEAL_MECHANICAL          one spell: Mechanical Patch Kit
    &Spell::EffectSummonObjectWild,                         // 76 SPELL_EFFECT_SUMMON_OBJECT_WILD
    &Spell::EffectScriptEffect,                             // 77 SPELL_EFFECT_SCRIPT_EFFECT
    &Spell::EffectUnused,                                   // 78 SPELL_EFFECT_ATTACK
    &Spell::EffectSanctuary,                                // 79 SPELL_EFFECT_SANCTUARY
    &Spell::EffectAddComboPoints,                           // 80 SPELL_EFFECT_ADD_COMBO_POINTS
    &Spell::EffectUnused,                                   // 81 SPELL_EFFECT_CREATE_HOUSE             one spell: Create House (TEST)
    &Spell::EffectNULL,                                     // 82 SPELL_EFFECT_BIND_SIGHT
    &Spell::EffectDuel,                                     // 83 SPELL_EFFECT_DUEL
    &Spell::EffectStuck,                                    // 84 SPELL_EFFECT_STUCK
    &Spell::EffectSummonPlayer,                             // 85 SPELL_EFFECT_SUMMON_PLAYER
    &Spell::EffectActivateObject,                           // 86 SPELL_EFFECT_ACTIVATE_OBJECT
    &Spell::EffectSummonTotem,                              // 87 SPELL_EFFECT_SUMMON_TOTEM_SLOT1
    &Spell::EffectSummonTotem,                              // 88 SPELL_EFFECT_SUMMON_TOTEM_SLOT2
    &Spell::EffectSummonTotem,                              // 89 SPELL_EFFECT_SUMMON_TOTEM_SLOT3
    &Spell::EffectSummonTotem,                              // 90 SPELL_EFFECT_SUMMON_TOTEM_SLOT4
    &Spell::EffectUnused,                                   // 91 SPELL_EFFECT_THREAT_ALL               one spell: zzOLDBrainwash
    &Spell::EffectEnchantHeldItem,                          // 92 SPELL_EFFECT_ENCHANT_HELD_ITEM
    &Spell::EffectUnused,                                   // 93 SPELL_EFFECT_SUMMON_PHANTASM
    &Spell::EffectSelfResurrect,                            // 94 SPELL_EFFECT_SELF_RESURRECT
    &Spell::EffectSkinning,                                 // 95 SPELL_EFFECT_SKINNING
    &Spell::EffectCharge,                                   // 96 SPELL_EFFECT_CHARGE
    &Spell::EffectSummonCritter,                            // 97 SPELL_EFFECT_SUMMON_CRITTER
    &Spell::EffectKnockBack,                                // 98 SPELL_EFFECT_KNOCK_BACK
    &Spell::EffectDisEnchant,                               // 99 SPELL_EFFECT_DISENCHANT
    &Spell::EffectInebriate,                                //100 SPELL_EFFECT_INEBRIATE
    &Spell::EffectFeedPet,                                  //101 SPELL_EFFECT_FEED_PET
    &Spell::EffectDismissPet,                               //102 SPELL_EFFECT_DISMISS_PET
    &Spell::EffectReputation,                               //103 SPELL_EFFECT_REPUTATION
    &Spell::EffectSummonObject,                             //104 SPELL_EFFECT_SUMMON_OBJECT_SLOT1
    &Spell::EffectSummonObject,                             //105 SPELL_EFFECT_SUMMON_OBJECT_SLOT2
    &Spell::EffectSummonObject,                             //106 SPELL_EFFECT_SUMMON_OBJECT_SLOT3
    &Spell::EffectSummonObject,                             //107 SPELL_EFFECT_SUMMON_OBJECT_SLOT4
    &Spell::EffectDispelMechanic,                           //108 SPELL_EFFECT_DISPEL_MECHANIC
    &Spell::EffectSummonDeadPet,                            //109 SPELL_EFFECT_SUMMON_DEAD_PET
    &Spell::EffectDestroyAllTotems,                         //110 SPELL_EFFECT_DESTROY_ALL_TOTEMS
    &Spell::EffectDurabilityDamage,                         //111 SPELL_EFFECT_DURABILITY_DAMAGE
    &Spell::EffectSummonDemon,                              //112 SPELL_EFFECT_SUMMON_DEMON
    &Spell::EffectResurrectNew,                             //113 SPELL_EFFECT_RESURRECT_NEW
    &Spell::EffectTaunt,                                    //114 SPELL_EFFECT_ATTACK_ME
    &Spell::EffectDurabilityDamagePCT,                      //115 SPELL_EFFECT_DURABILITY_DAMAGE_PCT
    &Spell::EffectSkinPlayerCorpse,                         //116 SPELL_EFFECT_SKIN_PLAYER_CORPSE       one spell: Remove Insignia, bg usage, required special corpse flags...
    &Spell::EffectSpiritHeal,                               //117 SPELL_EFFECT_SPIRIT_HEAL              one spell: Spirit Heal
    &Spell::EffectSkill,                                    //118 SPELL_EFFECT_SKILL                    professions and more
    &Spell::EffectApplyAreaAura,                            //119 SPELL_EFFECT_APPLY_AREA_AURA_PET
    &Spell::EffectUnused,                                   //120 SPELL_EFFECT_TELEPORT_GRAVEYARD       one spell: Graveyard Teleport Test
    &Spell::EffectWeaponDmg,                                //121 SPELL_EFFECT_NORMALIZED_WEAPON_DMG
    &Spell::EffectUnused,                                   //122 SPELL_EFFECT_122                      unused
    &Spell::EffectSendTaxi,                                 //123 SPELL_EFFECT_SEND_TAXI                taxi/flight related (misc value is taxi path id)
    &Spell::EffectPlayerPull,                               //124 SPELL_EFFECT_PLAYER_PULL              opposite of knockback effect (pulls player twoard caster)
    &Spell::EffectModifyThreatPercent,                      //125 SPELL_EFFECT_MODIFY_THREAT_PERCENT
    &Spell::EffectUnused,                                   //126 SPELL_EFFECT_126                      future spell steal effect? now only used one test spell
    &Spell::EffectUnused,                                   //127 SPELL_EFFECT_127                      future Prospecting spell, not have spells
    &Spell::EffectApplyAreaAura,                            //128 SPELL_EFFECT_APPLY_AREA_AURA_FRIEND
    &Spell::EffectApplyAreaAura,                            //129 SPELL_EFFECT_APPLY_AREA_AURA_ENEMY
    &Spell::EffectDespawnObject,                            //130 SPELL_EFFECT_DESPAWN_OBJECT
    &Spell::EffectNostalrius,                               //131 SPELL_EFFECT_NOSTALRIUS
};

void Spell::EffectEmpty(SpellEffectIndex /*eff_idx*/)
{
    // NOT NEED ANY IMPLEMENTATION CODE, EFFECT POSISBLE USED AS MARKER OR CLIENT INFORM
}

void Spell::EffectNULL(SpellEffectIndex /*eff_idx*/)
{
    DEBUG_LOG("WORLD: Spell Effect DUMMY");
}

void Spell::EffectUnused(SpellEffectIndex /*eff_idx*/)
{
    // NOT USED BY ANY SPELL OR USELESS OR IMPLEMENTED IN DIFFERENT WAY IN MANGOS
}

void Spell::EffectResurrectNew(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->isAlive())
        return;

    if (!unitTarget->IsInWorld())
        return;

    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
    {
        // Pet case
        Pet* pet = unitTarget->ToPet();
        if (!pet)
            return;
        Unit* owner = pet->GetOwner();
        if (!owner)
            return;
        uint32 health = damage;

        pet->NearTeleportTo(m_caster->GetPositionX(), m_caster->GetPositionY(), m_caster->GetPositionZ(), m_caster->GetOrientation(), false);
        pet->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_NONE);
        pet->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);
        pet->SetDeathState(ALIVE);
        pet->clearUnitState(UNIT_STAT_ALL_DYN_STATES);
        pet->SetHealth(pet->GetMaxHealth() > health ? health : pet->GetMaxHealth());

        pet->AIM_Initialize();

        // m_caster->PetSpellInitialize(); -- action bar not removed at death and not required send at revive
        pet->SavePetToDB(PET_SAVE_AS_CURRENT);

        // Remove Demonic Sacrifice auras (Blizzlike - cf patchnote 1.12)
        Unit::AuraList const& auraClassScripts = owner->GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
        for (Unit::AuraList::const_iterator itr = auraClassScripts.begin(); itr != auraClassScripts.end();)
        {
            if ((*itr)->GetModifier()->m_miscvalue == 2228)
            {
                owner->RemoveAurasDueToSpell((*itr)->GetId());
                itr = auraClassScripts.begin();
            }
            else
                ++itr;
        }
        return;
    }

    Player* pTarget = ((Player*)unitTarget);

    if (pTarget->isRessurectRequested())      // already have one active request
        return;

    uint32 health = damage;
    uint32 mana = m_spellInfo->EffectMiscValue[eff_idx];
    pTarget->setResurrectRequestData(m_caster->GetObjectGuid(), m_caster->GetMapId(), m_caster->GetPositionX(), m_caster->GetPositionY(), m_caster->GetPositionZ(), health, mana);
    SendResurrectRequest(pTarget);

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectInstaKill(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget || !unitTarget->isAlive())
        return;

    // Demonic Sacrifice
    if (m_spellInfo->Id == 18788 && unitTarget->GetTypeId() == TYPEID_UNIT)
    {
        uint32 entry = unitTarget->GetEntry();
        uint32 spellID;
        switch (entry)
        {
            case   416:
                spellID = 18789;
                break;               //imp
            case   417:
                spellID = 18792;
                break;               //fellhunter
            case  1860:
                spellID = 18790;
                break;               //void
            case  1863:
                spellID = 18791;
                break;               //succubus
            default:
                sLog.outError("EffectInstaKill: Unhandled creature entry (%u) case.", entry);
                return;
        }

        m_caster->CastSpell(m_caster, spellID, true);
    }

    if (m_caster == unitTarget)                             // prevent interrupt message
        finish();

    WorldObject* caster = GetCastingObject();               // we need the original casting object

    WorldPacket data(SMSG_SPELLINSTAKILLLOG, (8 + 4));
    data << unitTarget->GetObjectGuid();                    // Victim GUID
    data << uint32(m_spellInfo->Id);
    m_caster->SendMessageToSet(&data, true);

    m_caster->DealDamage(unitTarget, unitTarget->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
}

void Spell::EffectEnvironmentalDMG(SpellEffectIndex eff_idx)
{
    uint32 absorb = 0;
    uint32 resist = 0;

    // Note: this hack with damage replace required until GO casting not implemented
    // environment damage spells already have around enemies targeting but this not help in case nonexistent GO casting support
    // currently each enemy selected explicitly and self cast damage, we prevent apply self casted spell bonuses/etc
    damage = m_spellInfo->CalculateSimpleValue(eff_idx);

    m_caster->CalculateDamageAbsorbAndResist(m_caster, GetSpellSchoolMask(m_spellInfo), SPELL_DIRECT_DAMAGE, damage, &absorb, &resist, m_spellInfo);

    m_caster->SendSpellNonMeleeDamageLog(m_caster, m_spellInfo->Id, damage, GetSpellSchoolMask(m_spellInfo), absorb, resist, false, 0, false);
    if (m_caster->GetTypeId() == TYPEID_PLAYER)
        ((Player*)m_caster)->EnvironmentalDamage(DAMAGE_FIRE, damage);
}

void Spell::EffectSchoolDMG(SpellEffectIndex effect_idx)
{
    if (unitTarget && unitTarget->isAlive())
    {
        switch (m_spellInfo->SpellFamilyName)
        {
            case SPELLFAMILY_GENERIC:
            {
                //Gore
                if (m_spellInfo->SpellIconID == 2269)
                    damage += (rand() % 2) ? damage : 0;

                switch (m_spellInfo->Id)                    // better way to check unknown
                {
                    // Meteor like spells (divided damage to targets)
                    case 24340:
                    case 26558:
                    case 28884:     // Meteor
                    case 26789:                             // Shard of the Fallen Star
                    {
                        uint32 count = 0;
                        for (TargetList::const_iterator ihit = m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end(); ++ihit)
                            if (ihit->effectMask & (1 << effect_idx))
                                ++count;

                        damage /= count;                    // divide to all targets
                        break;
                    }
                    // percent from health with min
                    case 25599:                             // Thundercrash
                    {
                        damage = unitTarget->GetHealth() / 2;
                        if (damage < 200)
                            damage = 200;
                        break;
                    }
                    case 23206:                             // Chain Lightning (Simone the Seductress)
                    {
                        if (unitTarget->HasAura(20190))     // reduce damage by 75% if target has Aspect of the Wild (Rank 2)
                            damage *= 0.25;
                         break;
                    }
                }
                break;
            }

            case SPELLFAMILY_MAGE:
                break;
            case SPELLFAMILY_WARRIOR:
            {
                // Bloodthirst
                if (m_spellInfo->SpellIconID == 38 && m_spellInfo->IsFitToFamilyMask<CF_WARRIOR_MORTAL_STRIKE>())
                    damage = uint32(damage * (m_caster->GetTotalAttackPowerValue(BASE_ATTACK)) / 100);
                // Shield Slam
                else if (m_spellInfo->IsFitToFamilyMask<CF_WARRIOR_SHIELD_SLAM>())
                    damage += int32(m_caster->GetShieldBlockValue());
                // Execute trigger
                else if (m_spellInfo->Id == 20647)
                    m_caster->SetPower(POWER_RAGE, 0);
                break;
            }
            case SPELLFAMILY_WARLOCK:
            {
                // Conflagrate - consumes Immolate
                if (m_spellInfo->IsFitToFamilyMask<CF_WARLOCK_CONFLAGRATE>())
                {
                    // for caster applied auras only
                    Unit::AuraList const &mPeriodic = unitTarget->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
                    for (Unit::AuraList::const_iterator i = mPeriodic.begin(); i != mPeriodic.end(); ++i)
                    {
                        // Immolate
                        if ((*i)->GetSpellProto()->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_IMMOLATE>() &&
                            (*i)->GetCasterGuid() == m_caster->GetObjectGuid())
                        {
                            unitTarget->RemoveAurasByCasterSpell((*i)->GetId(), m_caster->GetObjectGuid());
                            break;
                        }
                    }
                }
                break;
            }
            case SPELLFAMILY_DRUID:
            {
                // Ferocious Bite
                if (m_spellInfo->IsFitToFamilyMask<CF_DRUID_RIP_BITE>() && m_spellInfo->SpellVisual == 6587)
                {
                    // ( AP * 3% * combo + energy * 2,7 + damage )
                    if (uint32 combo = ((Player*)m_caster)->GetComboPoints())
                        damage += int32(m_caster->GetTotalAttackPowerValue(BASE_ATTACK) * combo * 0.03f);
                    damage += int32(m_caster->GetPower(POWER_ENERGY) * m_spellInfo->DmgMultiplier[effect_idx]);
                    m_caster->SetPower(POWER_ENERGY, 0);
                }
                break;
            }
            case SPELLFAMILY_ROGUE:
            {
                // Eviscerate
                if (m_spellInfo->IsFitToFamilyMask<CF_ROGUE_EVISCERATE>() && m_caster->GetTypeId() == TYPEID_PLAYER)
                {
                    if (uint32 combo = ((Player*)m_caster)->GetComboPoints())
                        damage += int32(m_caster->GetTotalAttackPowerValue(BASE_ATTACK) * combo * 0.03f);
                }
                break;
            }
            case SPELLFAMILY_HUNTER:
                break;
            case SPELLFAMILY_PALADIN:
            {
                // Hammer of Wrath - receive bonus from spell damage
                if (m_spellInfo->SpellIconID == 42)
                {
                    damage = m_caster->SpellDamageBonusDone(unitTarget, m_spellInfo, damage, SPELL_DIRECT_DAMAGE);
                    damage = unitTarget->SpellDamageBonusTaken(m_caster, m_spellInfo, damage, SPELL_DIRECT_DAMAGE);
                }
                // Judgement of Command - receive bonus from spell damage
                else if (m_spellInfo->SpellIconID == 561)
                {
                    // base damage halved if target not stunned.
                    if (!unitTarget->hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
                        damage = int32(damage * 0.5f);

                    damage = m_caster->SpellDamageBonusDone(unitTarget, m_spellInfo, damage, SPELL_DIRECT_DAMAGE);
                    damage = unitTarget->SpellDamageBonusTaken(m_caster, m_spellInfo, damage, SPELL_DIRECT_DAMAGE);
                }
                break;
            }
        }

        if (damage >= 0)
            m_damage += damage;
    }
}

void Spell::EffectDummy(SpellEffectIndex eff_idx)
{
    if (!unitTarget && !gameObjTarget && !itemTarget && !corpseTarget)
        return;

    // selection by spell family
    switch (m_spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch (m_spellInfo->Id)
            {
                case 11885: // Capture Treant
                case 11886: // Capture Wildkin
                case 11887: // Capture Hippogryph
                case 11888: // Capture Faerie Dragon
                case 11889: // Capture Mountain Giant
                case 12699: // Summon Screecher Spirit
                {
                    if (unitTarget->isDead() && unitTarget->GetTypeId() == TYPEID_UNIT)
                        ((Creature*)unitTarget)->ForcedDespawn(1000);
                    break;
                }
                case 25716 : // Force Self - Bow
                {
                    m_caster->HandleEmote(EMOTE_ONESHOT_BOW);
                    return;
                }
                case 27798 : //Nature's Bounty
                {
                    switch(unitTarget->getPowerType())
                    {
                        case POWER_RAGE :
                            unitTarget->EnergizeBySpell(unitTarget, 27798, 10, POWER_RAGE);
                        return;
                        case POWER_ENERGY :
                            unitTarget->EnergizeBySpell(unitTarget, 27798, 40, POWER_ENERGY);
                        return;
                        case POWER_MANA :
                            unitTarget->EnergizeBySpell(unitTarget, 27798, 300, POWER_MANA);
                        return;
                    }
                    return;
                }
                case 24531: // Refocus : "Instantly clears the cooldowns of Aimed Shot, Multishot, Volley, and Arcane Shot."
                {
                    if (!m_caster->IsPlayer())
                        return;
                    SpellCooldowns cm = ((Player *)m_caster)->GetSpellCooldownMap();
                    for (SpellCooldowns::const_iterator itr = cm.begin(); itr != cm.end();)
                    {
                        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);

                        if (spellInfo->IsFitToFamily<SPELLFAMILY_HUNTER, CF_HUNTER_ARCANE_SHOT, CF_HUNTER_MULTI_SHOT, CF_HUNTER_VOLLEY, CF_HUNTER_AIMED_SHOT>() &&
                            spellInfo->Id != m_spellInfo->Id && GetSpellRecoveryTime(spellInfo) > 0)
                            ((Player*)m_caster)->RemoveSpellCooldown((itr++)->first, true);
                        else
                            ++itr;
                    }
                    return;
                }
                case 8344: // Universal Remote
                {
                    if (!m_originalCaster)
                        return;

                    // Random spell
                    uint32 randomSpell = urand(0, 2);
                    switch (randomSpell)
                    {
                        case 0:
                            m_originalCaster->CastSpell(unitTarget, 8345, true);
                            break;
                        case 1:
                            m_originalCaster->CastSpell(unitTarget, 8346, true);
                            break;
                        case 2:
                            unitTarget->CastSpell(unitTarget, 8599, true);
                            break;
                        default:
                            m_originalCaster->CastSpell(unitTarget, 8346, true);
                            break;
                    }
                    return;
                }
                case 13006: // Shrink ray
                {
                    if (!m_originalCaster)
                        return;
                    /* Source: http://www.wowwiki.com/Gnomish_Shrink_Ray
                        Not implemented yet:
                        Make every attacking enemy bigger
                        Make every attacking enemy smaller
                        Give shield-wielding enemies "Improved Blocking" for 30 seconds (this shows no visible effect other than target is hit by the ray)
                        13003 - Shrink Ray (single target)
                        13010 - Shrink (TARGET_ALL_PARTY_AROUND_CASTER)
                        13004 - Grow  (TARGET_ALL_PARTY_AROUND_CASTER)
                     */
                    uint32 r = urand(0, 99);
                    // Normal behavior
                    if (r > 15)
                        m_originalCaster->CastSpell(unitTarget, 13003, true);
                    else if (r > 13) // Make the user bigger
                    {
                        m_originalCaster->AddAura(13004);
                        m_originalCaster->SendSpellGo(m_originalCaster, 13004);
                    }
                    else if (r > 11) // Make the user smaller
                    {
                        m_originalCaster->AddAura(13010);
                        m_originalCaster->SendSpellGo(m_originalCaster, 13010);
                    }
                    else if (r > 9) // Make the target bigger
                    {
                        unitTarget->AddAura(13004);
                        m_originalCaster->SendSpellGo(unitTarget, 13004);
                    }
                    else if (r > 4) // Make the user's entire party smaller
                        m_originalCaster->CastSpell(unitTarget, 13010, true);
                    else // Make the user's entire party bigger
                        m_originalCaster->CastSpell(unitTarget, 13004, true);
                    break;
                }
                // Gnomish Mind Control Cap
                case 13180:
                {
                    if (!m_originalCaster)
                        return;

                    // [WowWiki] Possible malfunctions
                    // - Fails with no effect, but cooldown is trigged.
                    // - User becomes mind controlled by target. However, if the Gnomish Mind Control Cap is used while in a shapeshift form (such as cat form), this effect does not trigger.
                    switch (urand(0, 5))
                    {
                        case 0:
                            break;
                        case 1:
                            if (m_originalCaster->GetShapeshiftForm() == FORM_NONE)
                                unitTarget->CastSpell(m_originalCaster, 13181, true);
                            break;
                        default:
                            m_originalCaster->CastSpell(unitTarget, 13181, true);
                            break;
                    }
                    return;
                }
                // BRD : Invocation de Theldren
                case 27517:
                {
                    if (!m_originalCaster)
                        return;

                    if (InstanceData* pInst = m_originalCaster->GetInstanceData())
                        pInst->CustomSpellCasted(27517, m_originalCaster, unitTarget);
                    return;
                }
                case 14537:                                 // Six Demon Bag
                {
                    if (!unitTarget)
                        return;

                    Unit* newTarget = unitTarget;
                    uint32 spell_id = 0;
                    uint32 roll = urand(0, 99);
                    if (roll < 25)                          // Fireball (25% chance)
                        spell_id = 11921;
                    else if (roll < 50)                     // Frostbolt (25% chance)
                        spell_id = 13322;
                    else if (roll < 70)                     // Chain Lighting (20% chance)
                        spell_id = 21179;
                    else if (roll < 77)                     // Polymorph (10% chance, 7% to target)
                        spell_id = 13323;
                    else if (roll < 80)                     // Polymorph (10% chance, 3% to self, backfire)
                    {
                        spell_id = 13323;
                        newTarget = m_caster;
                    }
                    else if (roll < 95)                     // Enveloping Winds (15% chance)
                        spell_id = 25189;
                    else                                    // Summon Felhund minion (5% chance)
                    {
                        spell_id = 14642;
                        newTarget = m_caster;
                    }

                    m_caster->CastSpell(newTarget, spell_id, true, m_CastItem);
                    return;
                }
                case 17009:                                 // Voodoo
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spell_id = 0;
                    switch (urand(0, 6))
                    {
                        case 0:
                            spell_id = 16707;
                            break;    // Hex
                        case 1:
                            spell_id = 16708;
                            break;    // Hex
                        case 2:
                            spell_id = 16709;
                            break;    // Hex
                        case 3:
                            spell_id = 16711;
                            break;    // Grow
                        case 4:
                            spell_id = 16712;
                            break;    // Special Brew
                        case 5:
                            spell_id = 16713;
                            break;    // Ghostly
                        case 6:
                            spell_id = 16716;
                            break;    // Launch
                    }

                    m_caster->CastSpell(unitTarget, spell_id, true, nullptr, nullptr, m_originalCasterGUID, m_spellInfo);
                    return;
                }

                case 25720:     //spell Place Loot / Quest 8606 Decoy!
                {
                    if (!m_originalCaster)
                        return;
                    if (m_originalCaster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    sLog.outString("Quest 8606 item Dummy Effect.");
                    Player* pPlayer = (Player*)m_originalCaster;
                    // Check for buff Narain!
                    if (!pPlayer->HasAura(25688))
                        return;
                    // Start event 9527 using custom spell to avoid db error
                    pPlayer->CastSpell(pPlayer, 33031, true);
                    // Delete item Bag of Gold (21041)
                    pPlayer->DestroyItemCount(21041, -1, true, false);
                    return;
                }
                case 3360:                                  // Curse of the Eye
                {
                    if (!unitTarget)
                        return;

                    uint32 spell_id = (unitTarget->getGender() == GENDER_MALE) ? 10651 : 10653;

                    m_caster->CastSpell(unitTarget, spell_id, true);
                    return;
                }
                case 7671:                                  // Transformation (human<->worgen)
                {
                    if (!unitTarget)
                        return;

                    // Transform Visual
                    unitTarget->CastSpell(unitTarget, 24085, true);
                    return;
                }
                case 8063:                                  // Deviate Fish
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spell_id = 0;
                    switch (urand(1, 5))
                    {
                        case 1:
                            spell_id = 8064;
                            break;     // Sleepy
                        case 2:
                            spell_id = 8065;
                            break;     // Invigorate
                        case 3:
                            spell_id = 8066;
                            break;     // Shrink
                        case 4:
                            spell_id = 8067;
                            break;     // Party Time!
                        case 5:
                            spell_id = 8068;
                            break;     // Healthy Spirit
                    }
                    m_caster->CastSpell(m_caster, spell_id, true, nullptr);
                    return;
                }
                case 8213:                                  // Savory Deviate Delight
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spell_id = 0;
                    switch (urand(1, 2))
                    {
                        // Flip Out - ninja
                        case 1:
                            spell_id = (m_caster->getGender() == GENDER_MALE ? 8219 : 8220);
                            break;
                        // Yaaarrrr - pirate
                        case 2:
                            spell_id = (m_caster->getGender() == GENDER_MALE ? 8221 : 8222);
                            break;
                    }

                    m_caster->CastSpell(m_caster, spell_id, true, nullptr);
                    return;
                }
                case 8593:                                  // Symbol of life (restore creature to life)
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_UNIT)
                        return;

                    ((Creature*)unitTarget)->SetDeathState(JUST_ALIVED);
                    return;
                }
                case 9976:                                  // Polly Eats the E.C.A.C.
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_UNIT)
                        return;

                    // Summon Polly Jr.
                    unitTarget->CastSpell(unitTarget, 9998, true);

                    ((Creature*)unitTarget)->ForcedDespawn(100);
                    return;
                }
                case 12162:                                 // Deep wounds
                case 12850:                                 // (now good common check for this spells)
                case 12868:
                {
                    if (!unitTarget)
                        return;

                    float damage;
                    // DW should benefit of attack power, damage percent mods etc.
                    // TODO: check if using offhand damage is correct and if it should be divided by 2
                    if (m_caster->haveOffhandWeapon() && m_caster->getAttackTimer(BASE_ATTACK) > m_caster->getAttackTimer(OFF_ATTACK))
                        damage = (m_caster->GetFloatValue(UNIT_FIELD_MINOFFHANDDAMAGE) + m_caster->GetFloatValue(UNIT_FIELD_MAXOFFHANDDAMAGE)) / 2;
                    else
                        damage = (m_caster->GetFloatValue(UNIT_FIELD_MINDAMAGE) + m_caster->GetFloatValue(UNIT_FIELD_MAXDAMAGE)) / 2;

                    switch (m_spellInfo->Id)
                    {
                        case 12162:
                            damage *= 0.2f;
                            break;
                        case 12850:
                            damage *= 0.4f;
                            break;
                        case 12868:
                            damage *= 0.6f;
                            break;
                        default:
                            sLog.outError("Spell::EffectDummy: Spell %u not handled in DW", m_spellInfo->Id);
                            return;
                    };

                    int32 deepWoundsDotBasePoints0 = int32(damage / 4);
                    m_caster->CastCustomSpell(unitTarget, 12721, &deepWoundsDotBasePoints0, nullptr, nullptr, true, nullptr);
                    return;
                }
                case 12975:                                 //Last Stand
                {
                    int32 healthModSpellBasePoints0 = int32(m_caster->GetMaxHealth() * 0.3);
                    m_caster->CastCustomSpell(m_caster, 12976, &healthModSpellBasePoints0, nullptr, nullptr, true, nullptr);
                    return;
                }
                case 13120:                                 // net-o-matic
                {
                    if (!unitTarget)
                        return;

                    uint32 spell_id = 0;

                    uint32 roll = urand(0, 99);

                    if (roll < 10)                           // 10% for 30 sec self root (off-like chance unknown)
                        spell_id = 16566;
                    else if (roll < 20)                      // 10% for 20 sec root, charge to target (off-like chance unknown)
                        spell_id = 13119;                   // triggers 13139
                    else                                    // normal root
                        spell_id = 13099;

                    m_caster->CastSpell(unitTarget, spell_id, true, nullptr);
                    return;
                }
                case 13535:                                 // Tame Beast
                {
                    if (!m_originalCaster || m_originalCaster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    Creature* channelTarget = m_originalCaster->GetMap()->GetCreature(m_originalCaster->GetChannelObjectGuid());

                    if (!channelTarget)
                        return;

                    m_originalCaster->CastSpell(channelTarget, 13481, true, nullptr, nullptr, m_originalCasterGUID, m_spellInfo);
                    return;
                }
                case 13567:                                 // Dummy Trigger
                {
                    // can be used for different aura triggering, so select by aura
                    if (!m_triggeredByAuraSpell || !unitTarget)
                        return;

                    switch (m_triggeredByAuraSpell->Id)
                    {
                        case 26467:                         // Persistent Shield
                            m_caster->CastCustomSpell(unitTarget, 26470, &damage, nullptr, nullptr, true);
                            break;
                        default:
                            sLog.outError("EffectDummy: Non-handled case for spell 13567 for triggered aura %u", m_triggeredByAuraSpell->Id);
                            break;
                    }
                    return;
                }
                case 14185:                                 // Preparation Rogue
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    //immediately finishes the cooldown on certain Rogue abilities
                    SpellCooldowns cm = ((Player *)m_caster)->GetSpellCooldownMap();
                    for (SpellCooldowns::const_iterator itr = cm.begin(); itr != cm.end(); ++itr)
                    {
                        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);

                        if (spellInfo->SpellFamilyName == SPELLFAMILY_ROGUE &&
                                spellInfo->Id != m_spellInfo->Id && GetSpellRecoveryTime(spellInfo) > 0)
                            ((Player*)m_caster)->RemoveSpellCooldown(itr->first, true);
                    }
                    return;
                }
                case 15998:                                 // Capture Worg Pup
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_UNIT)
                        return;

                    Creature* creatureTarget = (Creature*)unitTarget;

                    creatureTarget->ForcedDespawn();
                    return;
                }
                case 16589:                                 // Noggenfogger Elixir
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spell_id = 0;
                    switch (urand(1, 3))
                    {
                        case 1:
                            spell_id = 16595;
                            break;
                        case 2:
                            spell_id = 16593;
                            break;
                        default:
                            spell_id = 16591;
                            break;
                    }

                    m_caster->CastSpell(m_caster, spell_id, true, nullptr);
                    return;
                }
                case 17251:                                 // Spirit Healer Res
                {
                    if (!unitTarget)
                        return;

                    Unit* caster = GetAffectiveCaster();

                    if (caster && caster->GetTypeId() == TYPEID_PLAYER)
                    {
                        WorldPacket data(SMSG_SPIRIT_HEALER_CONFIRM, 8);
                        data << unitTarget->GetObjectGuid();
                        ((Player*)caster)->GetSession()->SendPacket(&data);
                    }
                    return;
                }
                case 17271:                                 // Test Fetid Skull
                {
                    if (!itemTarget && m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spell_id = roll_chance_i(50)
                                      ? 17269                             // Create Resonating Skull
                                      : 17270;                            // Create Bone Dust

                    m_caster->CastSpell(m_caster, spell_id, true, nullptr);
                    return;
                }
                case 17770:                                 // Wolfshead Helm Energy
                {
                    m_caster->CastSpell(m_caster, 29940, true, nullptr);
                    return;
                }
                case 17950:
                {
                    if (!unitTarget)
                        return;

                    // Shadow Portal
                    const uint32 spell_list[6] = {17863, 17939, 17943, 17944, 17946, 17948};

                    m_caster->CastSpell(unitTarget, spell_list[urand(0, 5)], true);
                    return;
                }
                case 18350:                                 // Dummy Trigger
                {
                    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // Need remove self if Lightning Shield not active
                    Unit::SpellAuraHolderMap const& auras = unitTarget->GetSpellAuraHolderMap();
                    for (Unit::SpellAuraHolderMap::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
                    {
                        SpellEntry const* spell = itr->second->GetSpellProto();
                        if (spell->IsFitToFamily<SPELLFAMILY_SHAMAN, CF_SHAMAN_LIGHTNING_SHIELD>())
                            return;
                    }
                    unitTarget->RemoveAurasDueToSpell(28820);
                    return;
                }
                case 19411:                                 // Lava Bomb
                case 20474:                                 // Lava Bomb
                {
                    if (!unitTarget)
                        return;

                    unitTarget->CastSpell(unitTarget, 20494, true);
                    return;
                }
                case 19593:                                // Egg Explosion (Buru)
                {
                    if (!unitTarget)
                        return;

                    if (!m_originalCaster)
                        return;

                    float tempDamage = 0.0f;
                    float distance = m_originalCaster->GetDistance(unitTarget);
                    distance = 1.0 - (distance / 25.0f);

                    if (unitTarget->isAlive())
                    {
                        if (unitTarget->IsPlayer())
                        {
                            tempDamage = 500 * distance;
                            if (tempDamage < 100)
                                tempDamage = 100;
                        }
                        else
                        {
                            if (unitTarget->GetEntry() == 15370 && unitTarget->GetHealthPercent() > 20.0f)
                                tempDamage = 45000 * distance;
                            else
                                return;
                        }

                        m_originalCaster->DealDamage(unitTarget, tempDamage, nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
                    }
                    return;
                }
                case 20572:                                 // Blood Fury
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    m_caster->CastSpell(m_caster, 23230, true);

                    damage = damage * (m_caster->GetInt32Value(UNIT_FIELD_ATTACK_POWER)) / 100;
                    if (damage > 0)
                        m_caster->CastCustomSpell(m_caster, 23234, &damage, nullptr, nullptr, true, nullptr);
                    return;
                }
                case 20577:                                 // Cannibalize
                {
                    if (unitTarget || corpseTarget)
                        m_caster->CastSpell(m_caster, 20578, true, nullptr);
                    return;
                }
                case 23019:                                 // Crystal Prison Dummy DND
                {
                    if (!unitTarget || !unitTarget->isAlive() || unitTarget->GetTypeId() != TYPEID_UNIT || ((Creature*)unitTarget)->IsPet())
                        return;

                    Creature* creatureTarget = (Creature*)unitTarget;
                    if (creatureTarget->IsPet())
                        return;

                    GameObject* pGameObj = new GameObject;

                    Map *map = creatureTarget->GetMap();

                    // create before death for get proper coordinates
                    if (!pGameObj->Create(map->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), 179644, map,
                                          creatureTarget->GetPositionX(), creatureTarget->GetPositionY(), creatureTarget->GetPositionZ(),
                                          creatureTarget->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, GO_ANIMPROGRESS_DEFAULT, GO_STATE_READY))
                    {
                        delete pGameObj;
                        return;
                    }

                    pGameObj->SetRespawnTime(creatureTarget->GetRespawnTime() - time(nullptr));
                    pGameObj->SetOwnerGuid(m_caster->GetObjectGuid());
                    //Pose un soucis(Maxinus)
                    // pGameObj->SetUInt32Value(GAMEOBJECT_LEVEL, m_caster->getLevel());
                    pGameObj->SetSpellId(m_spellInfo->Id);
                    pGameObj->SetWorldMask(m_caster->GetWorldMask());

                    creatureTarget->ForcedDespawn();

                    DEBUG_LOG("AddObject at SpellEfects.cpp EffectDummy");
                    map->Add(pGameObj);

                    WorldPacket data(SMSG_GAMEOBJECT_SPAWN_ANIM_OBSOLETE, 8);
                    data << ObjectGuid(pGameObj->GetObjectGuid());
                    m_caster->SendMessageToSet(&data, true);

                    return;
                }
                case 23074:                                 // Arcanite Dragonling
                {
                    if (!m_CastItem)
                        return;

                    m_caster->CastSpell(m_caster, 19804, true, m_CastItem);
                    return;
                }
                case 23075:                                 // Mithril Mechanical Dragonling
                {
                    if (!m_CastItem)
                        return;

                    m_caster->CastSpell(m_caster, 12749, true, m_CastItem);
                    return;
                }
                case 23076:                                 // Mechanical Dragonling
                {
                    if (!m_CastItem)
                        return;

                    m_caster->CastSpell(m_caster, 4073, true, m_CastItem);
                    return;
                }
                case 23133:                                 // Gnomish Battle Chicken
                {
                    if (!m_CastItem)
                        return;

                    m_caster->CastSpell(m_caster, 13166, true, m_CastItem);
                    return;
                }
                case 23134:                                 // Goblin Bomb Dispenser
                {
                    if (!m_CastItem)
                        return;

                    uint32 roll = urand(0, 99);

                    if (roll < 10)
                        unitTarget->CastSpell(m_caster, 13261, true);

                    else
                        m_caster->CastSpell(m_caster, 13258, true, m_CastItem);

                    return;
                }
                case 4050:                                    // Explosive Sheep
                {
                    Unit* pOwner = m_caster->GetCharmerOrOwner();
                    if (pOwner && pOwner->GetTypeId() == TYPEID_PLAYER)
                    {
                        uint32 spellid = m_caster->GetUInt32Value(UNIT_CREATED_BY_SPELL);
                        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellid);
                        if (spellInfo)
                            pOwner->CooldownEvent(spellInfo);
                    }
                    return;
                }
                case 23138:                                 // Gate of Shazzrah
                {
                    if (!unitTarget)
                        return;

                    // Effect probably include a threat change, but it is unclear if fully
                    // reset or just forced upon target for teleport (SMSG_HIGHEST_THREAT_UPDATE)

                    // Gate of Shazzrah
                    m_caster->CastSpell(unitTarget, 23139, true);
                    return;
                }
                case 23448:                                 // Transporter Arrival - Ultrasafe Transporter: Gadgetzan - backfires
                {
                    int32 r = irand(0, 119);
                    if (r < 20)                             // Transporter Malfunction - 1/6 polymorph
                        m_caster->CastSpell(m_caster, 23444, true);
                    else if (r < 100)                       // Evil Twin               - 4/6 evil twin
                        m_caster->CastSpell(m_caster, 23445, true);
                    else                                    // Transporter Malfunction - 1/6 miss the target
                        m_caster->CastSpell(m_caster, 36902, true);

                    return;
                }
                case 23453:                                 // Gnomish Transporter - Ultrasafe Transporter: Gadgetzan
                {
                    uint64 m_playerGUID = m_caster->GetObjectGuid();

                    if (roll_chance_i(50))                  // Gadgetzan Transporter         - success
                        m_caster->CastSpell(m_caster, 23441, true);
                    else // Gadgetzan Transporter Failure - failure
                    {
                        if (roll_chance_i(50))
                            m_caster->CastSpell(m_caster, 23446, true);
                        else
                        {
                            if (Player* pPlayer = m_caster->GetMap()->GetPlayer(m_playerGUID))
                                pPlayer->TeleportTo(1, -7341.38f, -3908.11f, 150.7f, 0.51f);
                        }
                    }
                    return;
                }
                case 23645:                                 // Hourglass Sand
                    m_caster->RemoveAurasDueToSpell(23170); // Brood Affliction: Bronze
                    return;
                case 23725:                                 // Gift of Life (warrior bwl trinket)
                    m_caster->CastSpell(m_caster, 23782, true);
                    return;
                case 24781:                                 // Dream Fog
                {
                    if (m_caster->GetTypeId() != TYPEID_UNIT || !unitTarget)
                        return;
                    // TODO Note: Should actually not only AttackStart, but fixate on the target
                    ((Creature*)m_caster)->AI()->AttackStart(unitTarget);
                    return;
                }
                case 24930:                                 // Hallow's End Treat
                {
                    uint32 spell_id = 0;

                    switch (urand(1, 4))
                    {
                        case 1:
                            spell_id = 24924;
                            break;    // Larger and Orange
                        case 2:
                            spell_id = 24925;
                            break;    // Skeleton
                        case 3:
                            spell_id = 24926;
                            break;    // Pirate
                        case 4:
                            spell_id = 24927;
                            break;    // Ghost
                    }

                    m_caster->CastSpell(m_caster, spell_id, true);
                    return;
                }
                case 25860:                                 // Reindeer Transformation
                {
                    if (!m_caster->HasAuraType(SPELL_AURA_MOUNTED))
                        return;

                    float speed = m_caster->GetSpeedRate(MOVE_RUN);

                    m_caster->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

                    //5 different spells used depending on mounted speed
                    if (speed >= 2.0f)
                        m_caster->CastSpell(m_caster, 25859, true); //100% ground Reindeer
                    else
                        // Reindeer
                        m_caster->CastSpell(m_caster, 25858, true); //60% ground Reindeer

                    return;
                }
                case 25938:                                 // Viscidus explode
                {
                    if (!m_caster)
                        return;

                    if (m_caster->GetHealthPercent() < 5.0f) // Only way to kill this boss
                    {
                        m_caster->CastSpell(m_caster, 26003, true);
                        return;
                    }

                    // Stop combat
                    m_caster->CombatStop();

                    // Fake death
                    //m_caster->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FEING_DEATH);
                    m_caster->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    m_caster->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
                    m_caster->addUnitState(UNIT_STAT_DIED);

                    // Summon globs
                    m_caster->CastSpell(m_caster, 25885, true);

                    return;
                }
                case 26003:                                 // Viscidus suicide
                {
                    if (!m_caster)
                        return;

                    if (!m_caster->isAlive())
                        return;

                    m_caster->CastSpell(m_caster, 26002, true);
                    return;
                }
                case 26074:                                 // Holiday Cheer
                    // implemented at client side
                    return;
                case 26399:                                 // Despawn Tentacles (C'thun)
                {
                    if (!m_caster)
                        return;

                    if (unitTarget)
                        m_caster->DealDamage(unitTarget, unitTarget->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NONE, nullptr, false);

                    return;
                }
                case 26626:                                 // Mana Burn Area
                {
                    if (unitTarget->GetTypeId() != TYPEID_UNIT || unitTarget->getPowerType() != POWER_MANA)
                        return;

                    m_caster->CastSpell(unitTarget, 25779, true);
                    return;
                }
                case 28006:                                 // Arcane Cloaking
                {
                    if (unitTarget && unitTarget->GetTypeId() == TYPEID_PLAYER)
                        // Naxxramas Entry Flag Effect DND
                        m_caster->CastSpell(unitTarget, 29294, true);

                    return;
                }
                case 28098:                                 // Stalagg Tesla Effect
                case 28110:                                 // Feugen Tesla Effect
                {
                    if (unitTarget->GetTypeId() != TYPEID_UNIT)
                        return;

                    if (m_caster->getVictim() && !m_caster->IsWithinDistInMap(unitTarget, 60.0f))
                    {
                        // Cast Shock on nearby targets
                        if (Unit* pTarget = ((Creature*)m_caster)->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                            unitTarget->CastSpell(pTarget, 28099, false);
                    }
                    else
                    {
                        // "Evade"
                        unitTarget->RemoveAurasDueToSpell(m_spellInfo->Id == 28098 ? 28097 : 28109);
                        unitTarget->DeleteThreatList();
                        unitTarget->CombatStop(true);
                        // Recast chain (Stalagg Chain or Feugen Chain
                        unitTarget->CastSpell(m_caster, m_spellInfo->Id == 28098 ? 28096 : 28111, false);
                    }
                    return;
                }
                case 8897:                                 // Destroy Rocket Boots
                {
                    m_caster->CastSpell(unitTarget, 8893, true);
                    m_caster->CastSpell(unitTarget, 13158, true);

                    return;
                }
                case 23185:                                 // Aura of Frost
                case 25044:                                 // Aura of Nature
                {
                    if (!unitTarget)
                        return;

                    if (unitTarget->HasAura(25040))         // Mark of Nature
                        unitTarget->CastSpell(unitTarget, 25043, true);

                    if (unitTarget->HasAura(23182))         // Mark of Frost
                        unitTarget->CastSpell(unitTarget, 23186, true);

                    unitTarget->RemoveAurasAtMechanicImmunity(1 << (MECHANIC_BANDAGE - 1), 0);
                    unitTarget->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);

                    if (!unitTarget->IsStandState())
                        unitTarget->SetStandState(UNIT_STAND_STATE_STAND);

                    return;
                }
            }

            //All IconID Check in there
            switch (m_spellInfo->SpellIconID)
            {
                // Berserking (troll racial traits)
                case 1661:
                {
                    uint32 healthPerc = uint32((float(m_caster->GetHealth()) / m_caster->GetMaxHealth()) * 100);
                    int32 melee_mod = 10;
                    if (healthPerc <= 40)
                        melee_mod = 30;
                    if (healthPerc < 100 && healthPerc > 40)
                        melee_mod = 10 + (100 - healthPerc) / 3;

                    // FIXME: custom spell required this aura state by some unknown reason, we not need remove it anyway
                    m_caster->ModifyAuraState(AURA_STATE_BERSERKING, true);
                    m_caster->CastCustomSpell(m_caster, 26635, &melee_mod, &melee_mod, &melee_mod, true, nullptr);
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            switch (m_spellInfo->Id)
            {
                case 11189:                                 // Frost Warding
                case 28332:
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // increase reflaction chanced (effect 1) of Frost Ward, removed in aura boosts
                    SpellModifier *mod = new SpellModifier(SPELLMOD_EFFECT2, SPELLMOD_FLAT, damage, m_spellInfo->Id, UI64LIT(0x0000000000000100));
                    ((Player*)unitTarget)->AddSpellMod(mod, true);
                    break;
                }
                case 11094:                                 // Improved Fire Ward
                case 13043:
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // increase reflaction chanced (effect 1) of Fire Ward, removed in aura boosts
                    SpellModifier *mod = new SpellModifier(SPELLMOD_EFFECT2, SPELLMOD_FLAT, damage, m_spellInfo->Id, UI64LIT(0x0000000000000008));
                    ((Player*)unitTarget)->AddSpellMod(mod, true);
                    break;
                }
                case 12472:                                 // Cold Snap
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // immediately finishes the cooldown on Frost spells
                    SpellCooldowns cm = ((Player *)m_caster)->GetSpellCooldownMap();
                    for (SpellCooldowns::const_iterator itr = cm.begin(); itr != cm.end();)
                    {
                        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);

                        if (spellInfo->SpellFamilyName == SPELLFAMILY_MAGE &&
                                (GetSpellSchoolMask(spellInfo) & SPELL_SCHOOL_MASK_FROST) &&
                                spellInfo->Id != m_spellInfo->Id && GetSpellRecoveryTime(spellInfo) > 0)
                            ((Player*)m_caster)->RemoveSpellCooldown((itr++)->first, true);
                        else
                            ++itr;
                    }
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_WARRIOR:
        {
            // Execute
            if (m_spellInfo->IsFitToFamilyMask<CF_WARRIOR_EXECUTE>())
            {
                if (!unitTarget)
                    return;

                int32 basePoints0 = damage + int32(m_caster->GetPower(POWER_RAGE) * m_spellInfo->DmgMultiplier[eff_idx]);
                // m_caster->SetPower(POWER_RAGE, 0); // Done in EffectSchoolDMG - spell 20647
                m_caster->CastCustomSpell(unitTarget, 20647, &basePoints0, nullptr, nullptr, true, nullptr);
                return;
            }
            if (m_spellInfo->Id == 21977)                   //Warrior's Wrath
            {
                if (!unitTarget)
                    return;

                m_caster->CastSpell(unitTarget, 21887, true); // spell mod
                return;
            }
            if (m_spellInfo->Id == 23424)                   // Ustaag <Nostalrius> : Nefarian Class Call Chaman Corrupted Totems
            {
                switch (urand(0, 3))
                {
                    case 0:        // Corrupted Fire Nova Totem
                        m_caster->CastSpell(m_caster, 23419, true);
                        break;
                    case 1:        // Corrupted Stoneskin Totem
                        m_caster->CastSpell(m_caster, 23420, true);
                        break;
                    case 2:        // Corrupted Windfury Totem
                        m_caster->CastSpell(m_caster, 23423, true);
                        break;
                    case 3:        // Corrupted Healing Stream Totem
                        m_caster->CastSpell(m_caster, 23422, true);
                        break;
                }
                return;
            }
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // Life Tap
            if (m_spellInfo->IsFitToFamilyMask<CF_WARLOCK_LIFE_TAP>())
            {
                float cost = m_currentBasePoints[EFFECT_INDEX_0];

                if (Player* modOwner = m_caster->GetSpellModOwner())
                    modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_COST, cost, this);

                int32 dmg = m_caster->SpellDamageBonusDone(m_caster, m_spellInfo, uint32(cost > 0 ? cost : 0), SPELL_DIRECT_DAMAGE);
                dmg = m_caster->SpellDamageBonusTaken(m_caster, m_spellInfo, dmg, SPELL_DIRECT_DAMAGE);

                if (int32(m_caster->GetHealth()) > dmg)
                {
                    // Shouldn't Appear in Combat Log
                    m_caster->ModifyHealth(-dmg);

                    int32 mana = dmg;

                    Unit::AuraList const& auraDummy = m_caster->GetAurasByType(SPELL_AURA_DUMMY);
                    for (Unit::AuraList::const_iterator itr = auraDummy.begin(); itr != auraDummy.end(); ++itr)
                    {
                        // only Imp. Life Tap have this in combination with dummy aura
                        if ((*itr)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_WARLOCK && (*itr)->GetSpellProto()->SpellIconID == 208)
                            mana = ((*itr)->GetModifier()->m_amount + 100) * mana / 100;
                    }

                    m_caster->CastCustomSpell(m_caster, 31818, &mana, nullptr, nullptr, true, nullptr);
                    // Mana Feed
                    int32 manaFeedVal = m_caster->CalculateSpellDamage(m_caster, m_spellInfo, EFFECT_INDEX_1);
                    manaFeedVal = manaFeedVal * mana / 100;
                    if (manaFeedVal > 0)
                        m_caster->CastCustomSpell(m_caster, 32553, &manaFeedVal, nullptr, nullptr, true, nullptr);
                }
                else
                    SendCastResult(SPELL_FAILED_FIZZLE);

                return;
            }
            break;
        }
        case SPELLFAMILY_PRIEST:
        {
            switch (m_spellInfo->Id)
            {
                case 28598:                                 // Touch of Weakness triggered spell
                {
                    if (!unitTarget || !m_triggeredByAuraSpell)
                        return;

                    uint32 spellid = 0;
                    switch (m_triggeredByAuraSpell->Id)
                    {
                        case 2652:
                            spellid =  2943;
                            break; // Rank 1
                        case 19261:
                            spellid = 19249;
                            break; // Rank 2
                        case 19262:
                            spellid = 19251;
                            break; // Rank 3
                        case 19264:
                            spellid = 19252;
                            break; // Rank 4
                        case 19265:
                            spellid = 19253;
                            break; // Rank 5
                        case 19266:
                            spellid = 19254;
                            break; // Rank 6
                        case 25461:
                            spellid = 25460;
                            break; // Rank 7
                        default:
                            sLog.outError("Spell::EffectDummy: Spell 28598 triggered by unhandeled spell %u", m_triggeredByAuraSpell->Id);
                            return;
                    }
                    m_caster->CastSpell(unitTarget, spellid, true, nullptr);
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_DRUID:
            switch (m_spellInfo->Id)
            {
                case 5229:                                  // Enrage
                {
                    // Reduce base armor by 27% in Bear Form and 16% in Dire Bear Form
                }
            }
            break;
        /*
        case SPELLFAMILY_ROGUE:
        {
            switch (m_spellInfo->Id)
            {
                case 5938:                                  // Shiv
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    Player *pCaster = ((Player*)m_caster);

                    Item *item = pCaster->GetWeaponForAttack(OFF_ATTACK);
                    if (!item)
                        return;

                    // all poison enchantments is temporary
                    uint32 enchant_id = item->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT);
                    if (!enchant_id)
                        return;

                    SpellItemEnchantmentEntry const *pEnchant = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
                    if (!pEnchant)
                        return;

                    for (int s = 0; s < 3; ++s)
                    {
                        if (pEnchant->type[s] != ITEM_ENCHANTMENT_TYPE_COMBAT_SPELL)
                            continue;

                        SpellEntry const* combatEntry = sSpellMgr.GetSpellEntry(pEnchant->spellid[s]);
                        if (!combatEntry || combatEntry->Dispel != DISPEL_POISON)
                            continue;

                        m_caster->CastSpell(unitTarget, combatEntry, true, item);
                    }

                    m_caster->CastSpell(unitTarget, 5940, true);
                    return;
                }
            }
            break;
        }
        */
        case SPELLFAMILY_HUNTER:
        {
            switch (m_spellInfo->Id)
            {
                case 23989:                                 // Readiness talent
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    //immediately finishes the cooldown for hunter abilities
                    SpellCooldowns cm = ((Player*)m_caster)->GetSpellCooldownMap();
                    for (SpellCooldowns::const_iterator itr = cm.begin(); itr != cm.end();)
                    {
                        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);

                        if (spellInfo->SpellFamilyName == SPELLFAMILY_HUNTER && spellInfo->Id != 23989 && GetSpellRecoveryTime(spellInfo) > 0)
                            ((Player*)m_caster)->RemoveSpellCooldown((itr++)->first, true);
                        else
                            ++itr;
                    }
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            switch (m_spellInfo->SpellIconID)
            {
                case 156:                                   // Holy Shock
                {
                    if (!unitTarget)
                        return;

                    int hurt = 0;
                    int heal = 0;

                    switch (m_spellInfo->Id)
                    {
                        case 20473:
                            hurt = 25912;
                            heal = 25914;
                            break;
                        case 20929:
                            hurt = 25911;
                            heal = 25913;
                            break;
                        case 20930:
                            hurt = 25902;
                            heal = 25903;
                            break;
                        default:
                            sLog.outError("Spell::EffectDummy: Spell %u not handled in HS", m_spellInfo->Id);
                            return;
                    }

                    if (m_caster->IsFriendlyTo(unitTarget))
                        m_caster->CastSpell(unitTarget, heal, true);
                    else
                        m_caster->CastSpell(unitTarget, hurt, true);

                    return;
                }
                case 561:                                   // Judgement of command
                {
                    if (!unitTarget)
                        return;

                    uint32 spell_id = m_currentBasePoints[eff_idx];
                    SpellEntry const* spell_proto = sSpellMgr.GetSpellEntry(spell_id);
                    if (!spell_proto)
                        return;

                    m_caster->CastSpell(unitTarget, spell_proto, true, nullptr);
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            // Rockbiter Weapon
            if (m_spellInfo->IsFitToFamilyMask<CF_SHAMAN_ROCKBITER_WEAPON>())
            {
                uint32 spell_id = 0;
                switch (m_spellInfo->Id)
                {
                    case  8017:
                        spell_id = 36494;
                        break;    // Rank 1
                    case  8018:
                        spell_id = 36750;
                        break;    // Rank 2
                    case  8019:
                        spell_id = 36755;
                        break;    // Rank 3
                    case 10399:
                        spell_id = 36759;
                        break;    // Rank 4
                    case 16314:
                        spell_id = 36763;
                        break;    // Rank 5
                    case 16315:
                        spell_id = 36766;
                        break;    // Rank 6
                    case 16316:
                        spell_id = 36771;
                        break;    // Rank 7
                    default:
                        sLog.outError("Spell::EffectDummy: Spell %u not handled in RW", m_spellInfo->Id);
                        return;
                }

                SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spell_id);

                if (!spellInfo)
                {
                    sLog.outError("WORLD: unknown spell id %i", spell_id);
                    return;
                }

                if (m_caster->GetTypeId() != TYPEID_PLAYER)
                    return;

                for (int j = BASE_ATTACK; j <= OFF_ATTACK; ++j)
                {
                    if (Item* item = ((Player*)m_caster)->GetWeaponForAttack(WeaponAttackType(j)))
                    {
                        if (item->IsFitToSpellRequirements(m_spellInfo))
                        {
                            Spell *spell = new Spell(m_caster, spellInfo, true);

                            // enchanting spell selected by calculated damage-per-sec in enchanting effect
                            // at calculation applied affect from Elemental Weapons talent
                            // real enchantment damage
                            spell->m_currentBasePoints[1] = damage;

                            SpellCastTargets targets;
                            targets.setItemTarget(item);
                            spell->prepare(std::move(targets));
                        }
                    }
                }
                return;
            }

            // Flametongue Weapon Proc, Ranks
            // Daemon : et totem langue de feu
            if (m_spellInfo->IsFitToFamilyMask<CF_SHAMAN_FLAMETONGUE_WEAPON, CF_SHAMAN_FLAMETONGUE_TOTEM>())
            {
                if (!m_CastItem)
                {
                    sLog.outError("Spell::EffectDummy: spell %i requires cast Item", m_spellInfo->Id);
                    return;
                }
                // found spelldamage coefficients of 0.381% per 0.1 speed and 15.244 per 4.0 speed
                // but own calculation say 0.385 gives at most one point difference to published values
                int32 spellDamage = m_caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(m_spellInfo));
                float weaponSpeed = (1.0f / IN_MILLISECONDS) * m_CastItem->GetProto()->Delay;
                int32 totalDamage = int32((damage + 3.85f * spellDamage) * 0.01 * weaponSpeed);

                m_caster->CastCustomSpell(unitTarget, 10444, &totalDamage, nullptr, nullptr, true, m_CastItem);
                return;
            }
            break;
        }
    }

    // pet auras
    if (PetAura const* petSpell = sSpellMgr.GetPetAura(m_spellInfo->Id))
    {
        m_caster->AddPetAura(petSpell);
        return;
    }

    // Script based implementation. Must be used only for not good for implementation in core spell effects
    // So called only for not processed cases
    if (gameObjTarget)
        sScriptMgr.OnEffectDummy(m_caster, m_spellInfo->Id, eff_idx, gameObjTarget);
    else if (unitTarget && unitTarget->GetTypeId() == TYPEID_UNIT)
        sScriptMgr.OnEffectDummy(m_caster, m_spellInfo->Id, eff_idx, (Creature*)unitTarget);
    else if (itemTarget)
        sScriptMgr.OnEffectDummy(m_caster, m_spellInfo->Id, eff_idx, itemTarget);
}

void Spell::EffectTriggerSpell(SpellEffectIndex eff_idx)
{
    // only unit case known
    if (!unitTarget)
    {
        if (gameObjTarget || itemTarget)
            sLog.outError("Spell::EffectTriggerSpell (Spell: %u): Unsupported non-unit case!", m_spellInfo->Id);
        return;
    }

    uint32 triggered_spell_id = m_spellInfo->EffectTriggerSpell[eff_idx];

    // special cases
    switch (m_spellInfo->Id)
    {
        // The Only Cure is More Green Glow quest 2962
        case 12709:
            if (urand(0, 2))
                m_caster->CastSpell(unitTarget, 11638, true, m_CastItem, nullptr, m_originalCasterGUID);
            else
                m_caster->CastSpell(unitTarget, 11637, true, m_CastItem, nullptr, m_originalCasterGUID);
            return;
        // Linken's Boomerang: 10% chance to proc stun, 3% chance to proc disarm (dubious numbers)
        case 15712:
            if (triggered_spell_id == 15753 && urand(0, 10))
            {
                return;
            }

            if (triggered_spell_id == 15752 && urand(0, 30))
            {
                return;
            }

            break;
    }
    switch (triggered_spell_id)
    {
        // Item [Scorpid Surprise] - Heals 294 damage over 21 sec, assuming you don't bite down on a poison sac.
        // 10% proc rate (no source !)
        case 6411:
            if (urand(0, 10))
                return;
            break;
        // Vanish (not exist)
        case 18461:
        {
            unitTarget->RemoveSpellsCausingAura(SPELL_AURA_MOD_ROOT);
            unitTarget->RemoveSpellsCausingAura(SPELL_AURA_MOD_DECREASE_SPEED);
            unitTarget->RemoveSpellsCausingAura(SPELL_AURA_MOD_STALKED);

            // if this spell is given to NPC it must handle rest by it's own AI
            if (unitTarget->GetTypeId() != TYPEID_PLAYER)
                return;

            // get highest rank of the Stealth spell
            uint32 spellId = 0;
            const PlayerSpellMap& sp_list = ((Player*)unitTarget)->GetSpellMap();
            for (PlayerSpellMap::const_iterator itr = sp_list.begin(); itr != sp_list.end(); ++itr)
            {
                // only highest rank is shown in spell book, so simply check if shown in spell book
                if (!itr->second.active || itr->second.disabled || itr->second.state == PLAYERSPELL_REMOVED)
                    continue;

                SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);
                if (!spellInfo)
                    continue;

                if (spellInfo->IsFitToFamily<SPELLFAMILY_ROGUE, CF_ROGUE_STEALTH>())
                {
                    spellId = spellInfo->Id;
                    break;
                }
            }

            // no Stealth spell found
            if (!spellId)
                return;

            // reset cooldown on it if needed
            if (((Player*)unitTarget)->HasSpellCooldown(spellId))
                ((Player*)unitTarget)->RemoveSpellCooldown(spellId);

            m_caster->CastSpell(unitTarget, spellId, true);
            return;
        }
        // just skip
        case 23770:                                         // Sayge's Dark Fortune of *
            // not exist, common cooldown can be implemented in scripts if need.
            return;
        // Brittle Armor - (need add max stack of 24575 Brittle Armor)
        case 29284:
            m_caster->CastSpell(unitTarget, 24575, true, m_CastItem, nullptr, m_originalCasterGUID);
            return;
        // Mercurial Shield - (need add max stack of 26464 Mercurial Shield)
        case 29286:
            m_caster->CastSpell(unitTarget, 26464, true, m_CastItem, nullptr, m_originalCasterGUID);
            return;
    }

    // normal case
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(triggered_spell_id);
    if (!spellInfo)
    {
        sLog.outError("EffectTriggerSpell of spell %u: triggering unknown spell id %i", m_spellInfo->Id, triggered_spell_id);
        return;
    }

    // select formal caster for triggered spell
    Unit* caster = m_caster;

    // some triggered spells require specific equipment
    if (spellInfo->EquippedItemClass >= 0 && m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        // main hand weapon required
        if (spellInfo->AttributesEx3 & SPELL_ATTR_EX3_MAIN_HAND)
        {
            Item* item = ((Player*)m_caster)->GetWeaponForAttack(BASE_ATTACK, true, false);

            // skip spell if no weapon in slot or broken
            if (!item)
                return;

            // skip spell if weapon not fit to triggered spell
            if (!item->IsFitToSpellRequirements(spellInfo))
                return;
        }

        // offhand hand weapon required
        if (spellInfo->AttributesEx3 & SPELL_ATTR_EX3_REQ_OFFHAND)
        {
            Item* item = ((Player*)m_caster)->GetWeaponForAttack(OFF_ATTACK, true, false);

            // skip spell if no weapon in slot or broken
            if (!item)
                return;

            // skip spell if weapon not fit to triggered spell
            if (!item->IsFitToSpellRequirements(spellInfo))
                return;
        }
    }
    else
    {
        // Note: not exist spells with weapon req. and IsSpellHaveCasterSourceTargets == true
        // so this just for speedup places in else
        caster = IsSpellWithCasterSourceTargetsOnly(spellInfo) ? unitTarget : m_caster;
    }

    caster->CastSpell(unitTarget, spellInfo, true, nullptr, nullptr, m_originalCasterGUID);
}

void Spell::EffectTriggerMissileSpell(SpellEffectIndex effect_idx)
{
    uint32 triggered_spell_id = m_spellInfo->EffectTriggerSpell[effect_idx];

    // normal case
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(triggered_spell_id);

    if (!spellInfo)
    {
        sLog.outError("EffectTriggerMissileSpell of spell %u (eff: %u): triggering unknown spell id %u",
                      m_spellInfo->Id, effect_idx, triggered_spell_id);
        return;
    }

    if (m_CastItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    m_caster->CastSpell(m_targets.m_destX, m_targets.m_destY, m_targets.m_destZ, spellInfo, true, m_CastItem, nullptr, m_originalCasterGUID);
}

void Spell::EffectTeleportUnits(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->IsTaxiFlying())
        return;

    switch (m_spellInfo->EffectImplicitTargetB[eff_idx])
    {
        case TARGET_INNKEEPER_COORDINATES:
        {
            // Only players can teleport to innkeeper
            if (unitTarget->GetTypeId() != TYPEID_PLAYER)
                return;

            ((Player*)unitTarget)->TeleportToHomebind(unitTarget == m_caster ? TELE_TO_SPELL : 0);
            return;
        }
        case TARGET_AREAEFFECT_INSTANT:                     // in all cases first TARGET_TABLE_X_Y_Z_COORDINATES
        case TARGET_TABLE_X_Y_Z_COORDINATES:
        {
            SpellTargetPosition const* st = sSpellMgr.GetSpellTargetPosition(m_spellInfo->Id);
            if (!st)
            {
                sLog.outError("Spell::EffectTeleportUnits - unknown Teleport coordinates for spell ID %u", m_spellInfo->Id);
                return;
            }

            if (st->target_mapId == unitTarget->GetMapId())
                unitTarget->NearTeleportTo(st->target_X, st->target_Y, st->target_Z, st->target_Orientation, TELE_TO_NOT_LEAVE_COMBAT | TELE_TO_NOT_UNSUMMON_PET | (unitTarget == m_caster ? TELE_TO_SPELL : 0));
            else if (unitTarget->GetTypeId() == TYPEID_PLAYER)
                ((Player*)unitTarget)->TeleportTo(st->target_mapId, st->target_X, st->target_Y, st->target_Z, st->target_Orientation, unitTarget == m_caster ? TELE_TO_SPELL : 0);
            break;
        }
        case TARGET_EFFECT_SELECT:
        {
            // m_destN filled, but sometimes for wrong dest and does not have TARGET_FLAG_DEST_LOCATION

            float x = unitTarget->GetPositionX();
            float y = unitTarget->GetPositionY();
            float z = unitTarget->GetPositionZ();
            float orientation = m_caster->GetOrientation();

            m_caster->NearTeleportTo(x, y, z, orientation, TELE_TO_NOT_LEAVE_COMBAT | TELE_TO_NOT_UNSUMMON_PET | (unitTarget == m_caster ? TELE_TO_SPELL : 0));
            return;
        }
        default:
        {
            // If not exist data for dest location - return
            if (!(m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION))
            {
                sLog.outError("Spell::EffectTeleportUnits - unknown EffectImplicitTargetB[%u] = %u for spell ID %u", eff_idx, m_spellInfo->EffectImplicitTargetB[eff_idx], m_spellInfo->Id);
                return;
            }
            // Init dest coordinates
            float x = m_targets.m_destX;
            float y = m_targets.m_destY;
            float z = m_targets.m_destZ;
            float orientation = unitTarget->GetOrientation();
            // Teleport
            unitTarget->NearTeleportTo(x, y, z, orientation, TELE_TO_NOT_LEAVE_COMBAT | TELE_TO_NOT_UNSUMMON_PET | (unitTarget == m_caster ? TELE_TO_SPELL : 0));
            return;
        }
    }

    // post effects for TARGET_TABLE_X_Y_Z_COORDINATES
    if (m_spellInfo->Id == 23442)
    {
        int32 r = irand(0, 119);
        if (r >= 70)                                    // 7/12 success
        {
            if (r < 100)                                // 4/12 evil twin
                m_caster->CastSpell(m_caster, 23445, true);
            else                                        // 1/12 fire
                m_caster->CastSpell(m_caster, 23449, true);
        }
    }
}

void Spell::EffectApplyAura(SpellEffectIndex eff_idx)
{
    if (!unitTarget || !m_spellAuraHolder)
        return;

    if (!m_spellInfo->EffectApplyAuraName[eff_idx])
        return;

    // ghost spell check, allow apply any auras at player loading in ghost mode (will be cleanup after load)
    if ((!unitTarget->isAlive() && !(IsDeathOnlySpell(m_spellInfo) || IsDeathPersistentSpell(m_spellInfo))) &&
            (unitTarget->GetTypeId() != TYPEID_PLAYER || !((Player*)unitTarget)->GetSession()->PlayerLoading()))
        return;

    if (unitTarget->HasMorePowerfullSpellActive(m_spellInfo))
        return;

    Unit* caster = GetAffectiveCaster();
    if (!caster)
    {
        // FIXME: currently we can't have auras applied explicitly by gameobjects
        // so for auras from wild gameobjects (no owner) target used
        if (m_originalCasterGUID.IsGameObject())
            caster = unitTarget;
        else
            return;
    }

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "Spell: Aura is: %u [Spell%u:DiminishingGroup%u]", m_spellInfo->EffectApplyAuraName[eff_idx], m_spellInfo->Id, m_diminishGroup);

    // Sayge's Dark Fortune: +1-10% (random) (Youfie)
    if (m_spellInfo->SpellIconID == 1595 && m_spellInfo->SpellVisual == 7042)
        m_currentBasePoints[EFFECT_INDEX_0] = m_spellInfo->Id == 23769 ? urand(1, 25) : urand(1, 10);
    // Gnomish Death Ray
    // rarely has a chance of dealing double damage, 14.29% chance (guess)
    // for now we use linear level scaling, but this is likely incorrect (hp pools don't scale exactly linearly)
    // there is some speculation that this should be tied to Engineering skill level, but since you don't need Engineering to use the item at all this seems doubtful
    else if (m_spellInfo->Id == 13278)
        m_currentBasePoints[eff_idx] = eff_idx == EFFECT_INDEX_0 ? int32(urand(600, 1200) * (caster->getLevel() / 60.0f)) * (!urand(0,6) ? 2 : 1)
                                                                 : m_currentBasePoints[EFFECT_INDEX_0] * 0.1249f;
    // Paladin T3 JoL
    else if (m_spellInfo->IsFitToFamilyMask<CF_PALADIN_JUDGEMENT_OF_WISDOM_LIGHT>() && m_spellInfo->SpellIconID == 299 && m_caster->HasAura(28775))
        m_currentBasePoints[eff_idx] = 20;

    Aura* aur = CreateAura(m_spellInfo, eff_idx, &m_currentBasePoints[eff_idx], m_spellAuraHolder, unitTarget, caster, m_CastItem);
    m_spellAuraHolder->AddAura(aur, eff_idx);
}

void Spell::EffectPowerDrain(SpellEffectIndex eff_idx)
{
    if (m_spellInfo->EffectMiscValue[eff_idx] < 0 || m_spellInfo->EffectMiscValue[eff_idx] >= MAX_POWERS)
        return;

    Powers drain_power = Powers(m_spellInfo->EffectMiscValue[eff_idx]);

    if (!unitTarget)
        return;
    if (!unitTarget->isAlive())
        return;
    if (unitTarget->getPowerType() != drain_power)
        return;
    if (damage < 0)
        return;

    int32 curPower = unitTarget->GetPower(drain_power);

    //add spell damage bonus
    damage = m_caster->SpellDamageBonusDone(unitTarget, m_spellInfo, uint32(damage), SPELL_DIRECT_DAMAGE, 1, this);
    damage = unitTarget->SpellDamageBonusTaken(m_caster, m_spellInfo, uint32(damage), SPELL_DIRECT_DAMAGE, 1, this);

    int32 new_damage;
    if (curPower < damage)
        new_damage = curPower;
    else
        new_damage = damage;

    unitTarget->ModifyPower(drain_power, -new_damage);

    ExecuteLogInfo info(unitTarget->GetObjectGuid());
    info.powerDrain.power = drain_power;
    info.powerDrain.amount = new_damage;
    info.powerDrain.multiplier = 0.0f;

    // Don`t restore from self drain
    if (drain_power == POWER_MANA && m_caster != unitTarget)
    {
        float manaMultiplier = m_spellInfo->EffectMultipleValue[eff_idx];
        if (manaMultiplier == 0)
            manaMultiplier = 1;

        if (Player *modOwner = m_caster->GetSpellModOwner())
            modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_MULTIPLE_VALUE, manaMultiplier);

        int32 gain = int32(new_damage * manaMultiplier);

        m_caster->ModifyPower(POWER_MANA, gain);

        info.powerDrain.multiplier = manaMultiplier;
    }
}

void Spell::EffectSendEvent(SpellEffectIndex eff_idx)
{
    /*
    we do not handle a flag dropping or clicking on flag in battleground by sendevent system
    */
    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "Spell ScriptStart %u for spellid %u in EffectSendEvent ", m_spellInfo->EffectMiscValue[eff_idx], m_spellInfo->Id);

    if (!sScriptMgr.OnProcessEvent(m_spellInfo->EffectMiscValue[eff_idx], m_caster, focusObject, true))
        m_caster->GetMap()->ScriptsStart(sEventScripts, m_spellInfo->EffectMiscValue[eff_idx], m_caster, focusObject);
}

void Spell::EffectPowerBurn(SpellEffectIndex eff_idx)
{
    if (m_spellInfo->EffectMiscValue[eff_idx] < 0 || m_spellInfo->EffectMiscValue[eff_idx] >= MAX_POWERS)
        return;

    Powers powertype = Powers(m_spellInfo->EffectMiscValue[eff_idx]);

    if (!unitTarget)
        return;
    if (!unitTarget->isAlive())
        return;
    if (unitTarget->getPowerType() != powertype)
        return;
    if (damage < 0)
        return;

    int32 curPower = int32(unitTarget->GetPower(powertype));

    int32 new_damage = (curPower < damage) ? curPower : damage;

    unitTarget->ModifyPower(powertype, -new_damage);
    float multiplier = m_spellInfo->EffectMultipleValue[eff_idx];

    if (Player *modOwner = m_caster->GetSpellModOwner())
        modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_MULTIPLE_VALUE, multiplier);

    new_damage = int32(new_damage * multiplier);
    m_damage += new_damage;
}

void Spell::EffectHeal(SpellEffectIndex /*eff_idx*/)
{
    if (unitTarget && unitTarget->isAlive() && damage >= 0)
    {
        // Try to get original caster
        Unit *caster = GetAffectiveCaster();
        if (!caster)
            return;

        int32 addhealth = damage;

        // Swiftmend - consumes Regrowth or Rejuvenation
        if (m_spellInfo->Id == 18562)
        {
            Unit::AuraList const& RejorRegr = unitTarget->GetAurasByType(SPELL_AURA_PERIODIC_HEAL);
            // find most short by duration
            Aura *targetAura = nullptr;
            for (Unit::AuraList::const_iterator i = RejorRegr.begin(); i != RejorRegr.end(); ++i)
            {
                // Regrowth or Rejuvenation
                if ((*i)->GetSpellProto()->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_REJUVENATION, CF_DRUID_REGROWTH>())
                    if (!targetAura || (*i)->GetAuraDuration() < targetAura->GetAuraDuration())
                        targetAura = *i;
            }

            if (!targetAura)
            {
                sLog.outError("Target (GUID: %u TypeId: %u) has aurastate AURA_STATE_SWIFTMEND but no matching aura.", unitTarget->GetGUIDLow(), unitTarget->GetTypeId());
                return;
            }
            int idx = 0;
            while (idx < 3)
            {
                if (targetAura->GetSpellProto()->EffectApplyAuraName[idx] == SPELL_AURA_PERIODIC_HEAL)
                    break;
                idx++;
            }

            int32 tickheal = targetAura->GetModifier()->m_amount;
            int32 tickcount = 0;
            // Regrowth : 0x40
            // "18 sec of Regrowth" -> 6 ticks
            if (targetAura->GetSpellProto()->IsFitToFamilyMask<CF_DRUID_REGROWTH>())
                tickcount = 6;
            // Rejuvenation : 0x10
            // "12 sec of Rejuvenation" -> 4 ticks
            if (targetAura->GetSpellProto()->IsFitToFamilyMask<CF_DRUID_REJUVENATION>())
                tickcount = 4;

            unitTarget->RemoveAurasDueToSpell(targetAura->GetId());

            addhealth += tickheal * tickcount;
        }

        // JoL - Extra heal stored in m_triggeredByAuraBasePoints
        if (m_spellInfo->SpellIconID == 299 && m_spellInfo->SpellVisual == 5560 && m_spellInfo->SpellFamilyFlags == 0 && m_triggeredByAuraBasePoints > 0)
            addhealth += m_triggeredByAuraBasePoints;

        addhealth = caster->SpellHealingBonusDone(unitTarget, m_spellInfo, addhealth, HEAL, 1, this);
        addhealth = unitTarget->SpellHealingBonusTaken(caster, m_spellInfo, addhealth, HEAL, 1, this);

        m_healing += addhealth;
    }
}

void Spell::EffectHealMechanical(SpellEffectIndex /*eff_idx*/)
{
    // Mechanic creature type should be correctly checked by targetCreatureType field
    if (unitTarget && unitTarget->isAlive() && damage >= 0)
    {
        // Try to get original caster
        Unit *caster = GetAffectiveCaster();
        if (!caster)
            return;

        uint32 addhealth = caster->SpellHealingBonusDone(unitTarget, m_spellInfo, damage, HEAL);
        addhealth = unitTarget->SpellHealingBonusTaken(caster, m_spellInfo, addhealth, HEAL);

        caster->DealHeal(unitTarget, addhealth, m_spellInfo);
    }
}

void Spell::EffectHealthLeech(SpellEffectIndex effIndex)
{
    if (!unitTarget || !unitTarget->isAlive() || damage < 0)
        return;

    damage = m_caster->SpellDamageBonusDone(unitTarget, m_spellInfo, uint32(damage), SPELL_DIRECT_DAMAGE);
    damage = unitTarget->SpellDamageBonusTaken(m_caster, m_spellInfo, uint32(damage), SPELL_DIRECT_DAMAGE);

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "HealthLeech :%i", damage);

    float healMultiplier = m_spellInfo->EffectMultipleValue[effIndex];
    if (Player *modOwner = m_caster->GetSpellModOwner())
        modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_MULTIPLE_VALUE, healMultiplier);

    m_damage += damage;
    // get max possible damage, don't count overkill for heal
    uint32 healthGain = uint32(damage);
    if (healthGain > unitTarget->GetHealth())
        damage = unitTarget->GetHealth();
    damage *= healMultiplier;

    if (m_caster->isAlive())
    {
        m_caster->DealHeal(m_caster, uint32(healthGain), m_spellInfo);
    }
}

void Spell::DoCreateItem(SpellEffectIndex eff_idx, uint32 itemtype)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    Player* player = (Player*)unitTarget;

    uint32 newitemid = itemtype;
    ItemPrototype const *pProto = ObjectMgr::GetItemPrototype(newitemid);
    if (!pProto)
    {
        player->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, nullptr, nullptr);
        return;
    }

    // bg reward have some special in code work
    uint32 bgType = 0;
    switch (m_spellInfo->Id)
    {
        case SPELL_AV_MARK_WINNER:
        case SPELL_AV_MARK_LOSER:
            bgType = BATTLEGROUND_AV;
            break;
        case SPELL_WS_ALLY_WINNER:
        case SPELL_WS_HORDE_WINNER:
        case SPELL_WS_OLD_LOSER:
        case SPELL_WS_MARK_WINNER:
        case SPELL_WS_MARK_LOSER:
            bgType = BATTLEGROUND_WS;
            break;
        case SPELL_OLD_ARATHI_WINNER:
        case SPELL_AB_MARK_WINNER:
        case SPELL_AB_MARK_LOSER:
            bgType = BATTLEGROUND_AB;
            break;
        default:
            break;
    }

    uint32 num_to_add = damage;

    if (num_to_add < 1)
        num_to_add = 1;
    if (num_to_add > pProto->Stackable)
        num_to_add = pProto->Stackable;

    // init items_count to 1, since 1 item will be created regardless of specialization
    int items_count = 1;
    // the chance to create additional items
    float additionalCreateChance = 0.0f;
    // the maximum number of created additional items
    uint8 additionalMaxNum = 0;
    // get the chance and maximum number for creating extra items
    if (canCreateExtraItems(player, m_spellInfo->Id, additionalCreateChance, additionalMaxNum))
    {
        // roll with this chance till we roll not to create or we create the max num
        while (roll_chance_f(additionalCreateChance) && items_count <= additionalMaxNum)
            ++items_count;
    }

    // really will be created more items
    num_to_add *= items_count;

    // can the player store the new item?
    ItemPosCountVec dest;
    uint32 no_space = 0;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, newitemid, num_to_add, &no_space);
    if (msg != EQUIP_ERR_OK)
    {
        // convert to possible store amount
        if (msg == EQUIP_ERR_INVENTORY_FULL || msg == EQUIP_ERR_CANT_CARRY_MORE_OF_THIS)
            num_to_add -= no_space;
        else
        {
            // if not created by another reason from full inventory or unique items amount limitation
            player->SendEquipError(msg, nullptr, nullptr, newitemid);
            return;
        }
    }

    if (num_to_add)
    {
        // create the new item and store it
        Item* pItem = player->StoreNewItem(dest, newitemid, true, Item::GenerateItemRandomPropertyId(newitemid));

        // was it successful? return error if not
        if (!pItem)
        {
            player->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, nullptr, nullptr);
            return;
        }

        // set the "Crafted by ..." property of the item
        if (pItem->GetProto()->Class != ITEM_CLASS_CONSUMABLE && pItem->GetProto()->Class != ITEM_CLASS_QUEST)
            pItem->SetGuidValue(ITEM_FIELD_CREATOR, player->GetObjectGuid());

        // send info to the client
        if (pItem)
            player->SendNewItem(pItem, num_to_add, true, bgType == 0);

        // we succeeded in creating at least one item, so a levelup is possible
        if (bgType == 0)
            player->UpdateCraftSkill(m_spellInfo->Id);
    }

    // for battleground marks send by mail if not add all expected
    if (no_space > 0 && bgType)
    {
        if (BattleGround* bg = sBattleGroundMgr.GetBattleGroundTemplate(BattleGroundTypeId(bgType)))
            bg->SendRewardMarkByMail(player, newitemid, no_space);
    }
}

void Spell::EffectCreateItem(SpellEffectIndex eff_idx)
{
    DoCreateItem(eff_idx, m_spellInfo->EffectItemType[eff_idx]);

    ExecuteLogInfo info;
    info.createItem.itemEntry = m_spellInfo->EffectItemType[eff_idx];
    AddExecuteLogInfo(eff_idx, info);
}

void Spell::EffectPersistentAA(SpellEffectIndex eff_idx)
{
    Unit* pCaster = GetAffectiveCaster();
    // FIXME: in case wild GO will used wrong affective caster (target in fact) as dynobject owner
    if (!pCaster)
        pCaster = m_caster;

    float radius = GetSpellRadius(sSpellRadiusStore.LookupEntry(m_spellInfo->EffectRadiusIndex[eff_idx]));

    if (Player* modOwner = pCaster->GetSpellModOwner())
        modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_RADIUS, radius);

    DynamicObject* dynObj = new DynamicObject;
    if (!dynObj->Create(pCaster->GetMap()->GenerateLocalLowGuid(HIGHGUID_DYNAMICOBJECT), pCaster, m_spellInfo->Id,
                        eff_idx, m_targets.m_destX, m_targets.m_destY, m_targets.m_destZ, m_duration, radius, DYNAMIC_OBJECT_AREA_SPELL))
    {
        delete dynObj;
        return;
    }

    pCaster->AddDynObject(dynObj);
    pCaster->GetMap()->Add(dynObj);
}

void Spell::EffectEnergize(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;
    if (!unitTarget->isAlive())
        return;

    if (m_spellInfo->EffectMiscValue[eff_idx] < 0 || m_spellInfo->EffectMiscValue[eff_idx] >= MAX_POWERS)
        return;

    Powers power = Powers(m_spellInfo->EffectMiscValue[eff_idx]);

    if (damage < 0)
        return;

    if (unitTarget->GetMaxPower(power) == 0)
        return;

    if (m_spellInfo->Id == 2687)
        unitTarget->SetInCombatState(false, nullptr);

    m_caster->EnergizeBySpell(unitTarget, m_spellInfo->Id, damage, power);
}

void Spell::SendLoot(ObjectGuid guid, LootType loottype, LockType lockType)
{
    if (gameObjTarget)
    {
        switch (gameObjTarget->GetGoType())
        {
            case GAMEOBJECT_TYPE_DOOR:
            case GAMEOBJECT_TYPE_BUTTON:
            case GAMEOBJECT_TYPE_QUESTGIVER:
            case GAMEOBJECT_TYPE_SPELL_FOCUS:
            case GAMEOBJECT_TYPE_GOOBER:
                gameObjTarget->Use(m_caster);
                return;

            case GAMEOBJECT_TYPE_CHEST:
                gameObjTarget->Use(m_caster);
                // Don't return, let loots been taken
                break;

            case GAMEOBJECT_TYPE_TRAP:
                if (lockType == LOCKTYPE_DISARM_TRAP)
                {
                    gameObjTarget->SetLootState(GO_JUST_DEACTIVATED);
                    return;
                }
                sLog.outError("Spell::SendLoot unhandled locktype %u for GameObject trap (entry %u) for spell %u.", lockType, gameObjTarget->GetEntry(), m_spellInfo->Id);
                return;
            default:
                sLog.outError("Spell::SendLoot unhandled GameObject type %u (entry %u) for spell %u.", gameObjTarget->GetGoType(), gameObjTarget->GetEntry(), m_spellInfo->Id);
                return;
        }
    }

    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    // Send loot
    ((Player*)m_caster)->SendLoot(guid, loottype);
}

void Spell::EffectOpenLock(SpellEffectIndex eff_idx)
{
    if (!m_caster || m_caster->GetTypeId() != TYPEID_PLAYER)
    {
        DEBUG_LOG("WORLD: Open Lock - No Player Caster!");
        return;
    }

    Player* player = (Player*)m_caster;

    uint32 lockId = 0;
    ObjectGuid guid;

    // Get lockId
    if (gameObjTarget)
    {
        GameObjectInfo const* goInfo = gameObjTarget->GetGOInfo();
        // Arathi Basin banner opening !
        if ((goInfo->type == GAMEOBJECT_TYPE_BUTTON && goInfo->button.noDamageImmune) ||
                (goInfo->type == GAMEOBJECT_TYPE_GOOBER && goInfo->goober.losOK))
        {
            //CanUseBattleGroundObject() already called in CheckCast()
            // in battleground check
            if (BattleGround *bg = player->GetBattleGround())
            {
                // check if it's correct bg
                if (bg->GetTypeID() == BATTLEGROUND_AB || bg->GetTypeID() == BATTLEGROUND_AV)
                    bg->EventPlayerClickedOnFlag(player, gameObjTarget);
                return;
            }
        }
        else if (goInfo->type == GAMEOBJECT_TYPE_FLAGSTAND)
        {
            //CanUseBattleGroundObject() already called in CheckCast()
            // in battleground check
            if (BattleGround *bg = player->GetBattleGround())
                return;
        }
        lockId = goInfo->GetLockId();
        guid = gameObjTarget->GetObjectGuid();
    }
    else if (itemTarget)
    {
        lockId = itemTarget->GetProto()->LockID;
        guid = itemTarget->GetObjectGuid();
    }
    else
    {
        DEBUG_LOG("WORLD: Open Lock - No GameObject/Item Target!");
        return;
    }

    SkillType skillId = SKILL_NONE;
    int32 reqSkillValue = 0;
    int32 skillValue;

    SpellCastResult res = CanOpenLock(eff_idx, lockId, skillId, reqSkillValue, skillValue);
    if (res != SPELL_CAST_OK)
    {
        SendCastResult(res);
        return;
    }

    // mark item as unlocked
    if (itemTarget)
        itemTarget->SetFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_UNLOCKED);

    SendLoot(guid, LOOT_SKINNING, LockType(m_spellInfo->EffectMiscValue[eff_idx]));

    if (gameObjTarget)
    {
        if (player)
            sScriptMgr.OnGameObjectOpen(player, gameObjTarget);
        if (gameObjTarget->AI())
            gameObjTarget->AI()->OnUse(m_caster);
    }

    // not allow use skill grow at item base open
    if (!m_CastItem && skillId != SKILL_NONE)
    {
        // update skill if really known
        if (uint32 pureSkillValue = player->GetPureSkillValue(skillId))
        {
            if (gameObjTarget)
            {
                // Allow one skill-up until respawned
                if (!gameObjTarget->IsInSkillupList(player) &&
                        player->UpdateGatherSkill(skillId, pureSkillValue, reqSkillValue))
                    gameObjTarget->AddToSkillupList(player);
            }
            else if (itemTarget)
            {
                // Do one skill-up
                player->UpdateGatherSkill(skillId, pureSkillValue, reqSkillValue);
            }
        }
    }

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(guid));
}

void Spell::EffectSummonChangeItem(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *player = (Player*)m_caster;

    // applied only to using item
    if (!m_CastItem)
        return;

    // ... only to item in own inventory/bank/equip_slot
    if (m_CastItem->GetOwnerGuid() != player->GetObjectGuid())
        return;

    uint32 newitemid = m_spellInfo->EffectItemType[eff_idx];
    if (!newitemid)
        return;

    uint16 pos = m_CastItem->GetPos();

    Item *pNewItem = Item::CreateItem(newitemid, 1, player);
    if (!pNewItem)
        return;

    for (uint8 j = PERM_ENCHANTMENT_SLOT; j <= TEMP_ENCHANTMENT_SLOT; ++j)
    {
        if (m_CastItem->GetEnchantmentId(EnchantmentSlot(j)))
            pNewItem->SetEnchantment(EnchantmentSlot(j), m_CastItem->GetEnchantmentId(EnchantmentSlot(j)), m_CastItem->GetEnchantmentDuration(EnchantmentSlot(j)), m_CastItem->GetEnchantmentCharges(EnchantmentSlot(j)));
    }

    if (m_CastItem->GetUInt32Value(ITEM_FIELD_DURABILITY) < m_CastItem->GetUInt32Value(ITEM_FIELD_MAXDURABILITY))
    {
        double loosePercent = 1 - m_CastItem->GetUInt32Value(ITEM_FIELD_DURABILITY) / double(m_CastItem->GetUInt32Value(ITEM_FIELD_MAXDURABILITY));
        player->DurabilityLoss(pNewItem, loosePercent);
    }

    if (player->IsInventoryPos(pos))
    {
        ItemPosCountVec dest;
        uint8 msg = player->CanStoreItem(m_CastItem->GetBagSlot(), m_CastItem->GetSlot(), dest, pNewItem, true);
        if (msg == EQUIP_ERR_OK)
        {
            player->DestroyItem(m_CastItem->GetBagSlot(), m_CastItem->GetSlot(), true);

            // prevent crash at access and unexpected charges counting with item update queue corrupt
            ClearCastItem();

            player->StoreItem(dest, pNewItem, true);
            return;
        }
    }
    else if (player->IsBankPos(pos))
    {
        ItemPosCountVec dest;
        uint8 msg = player->CanBankItem(m_CastItem->GetBagSlot(), m_CastItem->GetSlot(), dest, pNewItem, true);
        if (msg == EQUIP_ERR_OK)
        {
            player->DestroyItem(m_CastItem->GetBagSlot(), m_CastItem->GetSlot(), true);

            // prevent crash at access and unexpected charges counting with item update queue corrupt
            ClearCastItem();

            player->BankItem(dest, pNewItem, true);
            return;
        }
    }
    else if (player->IsEquipmentPos(pos))
    {
        uint16 dest;
        uint8 msg = player->CanEquipItem(m_CastItem->GetSlot(), dest, pNewItem, true, false);
        if (msg == EQUIP_ERR_OK)
        {
            player->DestroyItem(m_CastItem->GetBagSlot(), m_CastItem->GetSlot(), true);

            // prevent crash at access and unexpected charges counting with item update queue corrupt
            ClearCastItem();

            player->EquipItem(dest, pNewItem, true);
            player->AutoUnequipOffhandIfNeed();
            return;
        }
    }

    // fail
    delete pNewItem;
}

void Spell::EffectProficiency(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;
    Player *p_target = (Player*)unitTarget;

    uint32 subClassMask = m_spellInfo->EquippedItemSubClassMask;
    if (m_spellInfo->EquippedItemClass == ITEM_CLASS_WEAPON && !(p_target->GetWeaponProficiency() & subClassMask))
    {
        p_target->AddWeaponProficiency(subClassMask);
        p_target->SendProficiency(ITEM_CLASS_WEAPON, p_target->GetWeaponProficiency());
    }
    if (m_spellInfo->EquippedItemClass == ITEM_CLASS_ARMOR && !(p_target->GetArmorProficiency() & subClassMask))
    {
        p_target->AddArmorProficiency(subClassMask);
        p_target->SendProficiency(ITEM_CLASS_ARMOR, p_target->GetArmorProficiency());
    }
}

void Spell::EffectApplyAreaAura(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;
    if (!unitTarget->isAlive())
        return;

    AreaAura* Aur = new AreaAura(m_spellInfo, eff_idx, &m_currentBasePoints[eff_idx], m_spellAuraHolder, unitTarget, m_caster, m_CastItem);
    m_spellAuraHolder->AddAura(Aur, eff_idx);
}

void Spell::EffectSummon(SpellEffectIndex eff_idx)
{
    if (!m_caster->GetPetGuid().IsEmpty())
        return;

    if (!unitTarget)
        return;
    uint32 pet_entry = m_spellInfo->EffectMiscValue[eff_idx];
    if (!pet_entry)
        return;

    CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(pet_entry);
    if (!cInfo)
    {
        sLog.outErrorDb("Spell::DoSummon: creature entry %u not found for spell %u.", pet_entry, m_spellInfo->Id);
        return;
    }

    uint32 level = m_caster->getLevel();
    Pet* spawnCreature = new Pet(SUMMON_PET);

    if (m_caster->GetTypeId() == TYPEID_PLAYER && spawnCreature->LoadPetFromDB((Player*)m_caster, pet_entry))
    {
        // Summon in dest location
        if (m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION)
            spawnCreature->Relocate(m_targets.m_destX, m_targets.m_destY, m_targets.m_destZ, -m_caster->GetOrientation());

        // set timer for unsummon
        if (m_duration > 0)
            spawnCreature->SetDuration(m_duration);

        return;
    }

    // Summon in dest location
    CreatureCreatePos pos(m_caster->GetMap(), m_targets.m_destX, m_targets.m_destY, m_targets.m_destZ, -m_caster->GetOrientation());

    if (!(m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION))
        pos = CreatureCreatePos(m_caster, -m_caster->GetOrientation());

    Map *map = m_caster->GetMap();
    uint32 pet_number = sObjectMgr.GeneratePetNumber();
    if (!spawnCreature->Create(map->GenerateLocalLowGuid(HIGHGUID_PET), pos, cInfo, pet_number))
    {
        sLog.outErrorDb("Spell::EffectSummon: can't create creature with entry %u for spell %u", cInfo->Entry, m_spellInfo->Id);
        delete spawnCreature;
        return;
    }

    spawnCreature->SetSummonPoint(pos);

    // set timer for unsummon
    if (m_duration > 0)
        spawnCreature->SetDuration(m_duration);

    spawnCreature->SetOwnerGuid(m_caster->GetObjectGuid());
    spawnCreature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);
    spawnCreature->SetInitCreaturePowerType();
    spawnCreature->setFaction(m_caster->getFaction());
    spawnCreature->SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, 0);
    spawnCreature->SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, 0);
    spawnCreature->SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, 1000);
    spawnCreature->SetCreatorGuid(m_caster->GetObjectGuid());
    spawnCreature->SetUInt32Value(UNIT_CREATED_BY_SPELL, m_spellInfo->Id);

    spawnCreature->InitStatsForLevel(level, m_caster);

    spawnCreature->GetCharmInfo()->SetPetNumber(pet_number, false);

    spawnCreature->AIM_Initialize();
    spawnCreature->InitPetCreateSpells();
    spawnCreature->SetHealth(spawnCreature->GetMaxHealth());
    spawnCreature->SetPower(POWER_MANA, spawnCreature->GetMaxPower(POWER_MANA));

    //spawnCreature->SetName("");                           // generated by client

    map->Add((Creature*)spawnCreature);

    m_caster->SetPet(spawnCreature);

    if (m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        spawnCreature->SetReactState(REACT_DEFENSIVE);
        spawnCreature->SavePetToDB(PET_SAVE_AS_CURRENT);
        ((Player*)m_caster)->PetSpellInitialize();
    }
    else
        spawnCreature->SetReactState(REACT_AGGRESSIVE);

    if (m_caster->GetTypeId() == TYPEID_UNIT && ((Creature*)m_caster)->AI())
        ((Creature*)m_caster)->AI()->JustSummoned((Creature*)spawnCreature);
}

void Spell::EffectLearnSpell(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
    {
        if (m_caster->GetTypeId() == TYPEID_PLAYER)
            EffectLearnPetSpell(eff_idx);

        return;
    }

    Player *player = (Player*)unitTarget;

    uint32 spellToLearn = m_spellInfo->EffectTriggerSpell[eff_idx];
    player->learnSpell(spellToLearn, false);

    DEBUG_LOG("Spell: Player %u has learned spell %u from NpcGUID=%u", player->GetGUIDLow(), spellToLearn, m_caster->GetGUIDLow());
}

void Spell::EffectDispel(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    // Shield Slam 50% chance dispel
    if (m_spellInfo->IsFitToFamily<SPELLFAMILY_WARRIOR, CF_WARRIOR_SHIELD_SLAM>() && !roll_chance_i(50))
        return;

    // Fill possible dispel list
    std::list <std::pair<SpellAuraHolder* , uint32> > dispel_list;

    bool checkFaction = true;
    // Pierre de sort dissipe sorts negatifs et positifs.
    if (m_spellInfo->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_SPELLSTONE>())
        checkFaction = false;
    bool friendly = checkFaction && !isReflected ? unitTarget->IsFriendlyTo(m_caster) : false;
    // Create dispel mask by dispel type
    int32 dispel_type = m_spellInfo->EffectMiscValue[eff_idx];
    uint32 dispelMask  = GetDispellMask(dispel_type < 0 ? DISPEL_ALL : DispelType(dispel_type));
    Unit::SpellAuraHolderMap const& auras = unitTarget->GetSpellAuraHolderMap();
    for (Unit::SpellAuraHolderMap::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
    {
        SpellAuraHolder *holder = itr->second;
        if ((1 << holder->GetSpellProto()->Dispel) & dispelMask)
        {
            if (holder->GetSpellProto()->Dispel == DISPEL_MAGIC || 
                holder->GetSpellProto()->Dispel == DISPEL_POISON)
            {
                if (checkFaction)
                {
                    bool positive = holder->IsPositive();
                    // do not remove positive auras if friendly target
                    //               negative auras if non-friendly target
                    if (positive == friendly)
                        continue;
                }
            }
            dispel_list.push_back(std::pair<SpellAuraHolder* , uint32>(holder, holder->GetStackAmount()));
        }
    }
    // Ok if exist some buffs for dispel try dispel it
    if (!dispel_list.empty())
    {
        std::list<std::pair<SpellAuraHolder* , uint32> > success_list; // (spell_id,casterGuid)
        std::list < uint32 > fail_list;                     // spell_id

        // some spells have effect value = 0 and all from its by meaning expect 1
        if (!damage)
            damage = 1;

        // Dispel N = damage buffs (or while exist buffs for dispel)
        for (int32 count = 0; count < damage && !dispel_list.empty(); ++count)
        {
            // Random select buff for dispel
            std::list<std::pair<SpellAuraHolder* , uint32> >::iterator dispel_itr = dispel_list.begin();
            std::advance(dispel_itr, urand(0, dispel_list.size() - 1));

            SpellAuraHolder *holder = dispel_itr->first;

            dispel_itr->second -= 1;

            // remove entry from dispel_list if nothing left in stack
            if (dispel_itr->second == 0)
                dispel_list.erase(dispel_itr);

            SpellEntry const* spellInfo = holder->GetSpellProto();
            // Base dispel chance
            // TODO: possible chance depend from spell level??
            int32 miss_chance = 0;
            // Apply dispel mod from aura caster
            if (Unit *caster = holder->GetCaster())
            {
                if (Player* modOwner = caster->GetSpellModOwner())
                    modOwner->ApplySpellMod(spellInfo->Id, SPELLMOD_RESIST_DISPEL_CHANCE, miss_chance, this);
            }
            // Try dispel
            if (roll_chance_i(miss_chance))
                fail_list.push_back(spellInfo->Id);
            else
            {
                bool foundDispelled = false;
                for (std::list<std::pair<SpellAuraHolder* , uint32> >::iterator success_iter = success_list.begin(); success_iter != success_list.end(); ++success_iter)
                {
                    if (success_iter->first->GetId() == holder->GetId() && success_iter->first->GetCasterGuid() == holder->GetCasterGuid())
                    {
                        success_iter->second += 1;
                        foundDispelled = true;
                        break;
                    }
                }
                if (!foundDispelled)
                    success_list.push_back(std::pair<SpellAuraHolder* , uint32>(holder, 1));
            }
        }
        // Send success log and really remove auras
        if (!success_list.empty())
        {
            int32 count = success_list.size();
            WorldPacket data(SMSG_SPELLDISPELLOG, 8 + 8 + 4 + count * 4);
            data << unitTarget->GetPackGUID();              // Victim GUID
            data << m_caster->GetPackGUID();                // Caster GUID
            data << uint32(count);
            for (std::list<std::pair<SpellAuraHolder* , uint32> >::iterator j = success_list.begin(); j != success_list.end(); ++j)
            {
                SpellAuraHolder* dispelledHolder = j->first;
                data << uint32(dispelledHolder->GetId());   // Spell Id
                unitTarget->RemoveAuraHolderDueToSpellByDispel(dispelledHolder->GetId(), j->second, dispelledHolder->GetCasterGuid(), m_caster);
            }
            m_caster->SendMessageToSet(&data, true);

            // On success dispel
            // Devour Magic
            if (m_spellInfo->SpellFamilyName == SPELLFAMILY_WARLOCK && m_spellInfo->Category == SPELLCATEGORY_DEVOUR_MAGIC)
            {
                uint32 heal_spell = 0;
                switch (m_spellInfo->Id)
                {
                    case 19505:
                        heal_spell = 19658;
                        break;
                    case 19731:
                        heal_spell = 19732;
                        break;
                    case 19734:
                        heal_spell = 19733;
                        break;
                    case 19736:
                        heal_spell = 19735;
                        break;
                    default:
                        DEBUG_LOG("Spell for Devour Magic %d not handled in Spell::EffectDispel", m_spellInfo->Id);
                        break;
                }
                if (heal_spell)
                    m_caster->CastSpell(m_caster, heal_spell, true);
            }
        }
        // Send fail log to client
        if (!fail_list.empty())
        {
            // Failed to dispel
            WorldPacket data(SMSG_DISPEL_FAILED, 8 + 8 + 4 * fail_list.size());
            data << m_caster->GetObjectGuid();              // Caster GUID
            data << unitTarget->GetObjectGuid();            // Victim GUID
            for (std::list< uint32 >::iterator j = fail_list.begin(); j != fail_list.end(); ++j)
                data << uint32(*j);                         // Spell Id
            m_caster->SendMessageToSet(&data, true);
        }
    }

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectDualWield(SpellEffectIndex /*eff_idx*/)
{
    if (unitTarget && unitTarget->GetTypeId() == TYPEID_PLAYER)
        ((Player*)unitTarget)->SetCanDualWield(true);
}

void Spell::EffectPull(SpellEffectIndex /*eff_idx*/)
{
    // TODO: create a proper pull towards distract spell center for distract
    DEBUG_LOG("WORLD: Spell Effect DUMMY");
}

void Spell::EffectDistract(SpellEffectIndex eff_idx)
{
    // Check for possible target
    if (!unitTarget || unitTarget->isInCombat())
        return;

    // target must be OK to do this
    if (unitTarget->hasUnitState(UNIT_STAT_CAN_NOT_REACT))
        return;

    unitTarget->SetFacingTo(unitTarget->GetAngle(m_targets.m_destX, m_targets.m_destY));
    unitTarget->clearUnitState(UNIT_STAT_MOVING);

    if (unitTarget->GetTypeId() == TYPEID_UNIT)
        unitTarget->GetMotionMaster()->MoveDistract(damage * IN_MILLISECONDS);

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectPickPocket(SpellEffectIndex /*eff_idx*/)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    // victim must be creature and attackable
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_UNIT || m_caster->IsFriendlyTo(unitTarget))
        return;

    // victim have to be alive and humanoid or undead
    if (unitTarget->isAlive() && (unitTarget->GetCreatureTypeMask() & CREATURE_TYPEMASK_HUMANOID_OR_UNDEAD) != 0)
        ((Player*)m_caster)->SendLoot(unitTarget->GetObjectGuid(), LOOT_PICKPOCKETING);
}

void Spell::EffectAddFarsight(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    int32 duration = GetSpellDuration(m_spellInfo);
    DynamicObject* dynObj = new DynamicObject;

    // set radius to 0: spell not expected to work as persistent aura
    if (!dynObj->Create(m_caster->GetMap()->GenerateLocalLowGuid(HIGHGUID_DYNAMICOBJECT), m_caster,
                        m_spellInfo->Id, eff_idx, m_targets.m_destX, m_targets.m_destY, m_targets.m_destZ, duration, 0, DYNAMIC_OBJECT_FARSIGHT_FOCUS))
    {
        delete dynObj;
        return;
    }

    m_caster->AddDynObject(dynObj);
    m_caster->GetMap()->Add(dynObj);

    ((Player*)m_caster)->GetCamera().SetView(dynObj);
}

void Spell::EffectSummonWild(SpellEffectIndex eff_idx)
{
    uint32 creature_entry = m_spellInfo->EffectMiscValue[eff_idx];
    if (!creature_entry)
        return;

    uint32 level = m_caster->getLevel();

    // level of creature summoned using engineering item based at engineering skill level
    if (m_caster->GetTypeId() == TYPEID_PLAYER && m_CastItem)
    {
        ItemPrototype const *proto = m_CastItem->GetProto();
        if (proto && proto->RequiredSkill == SKILL_ENGINEERING)
        {
            uint16 skill202 = ((Player*)m_caster)->GetSkillValue(SKILL_ENGINEERING);
            if (skill202)
                level = skill202 / 5;
        }
    }

    // select center of summon position
    float center_x = m_targets.m_destX;
    float center_y = m_targets.m_destY;
    float center_z = m_targets.m_destZ;

    float radius = GetSpellRadius(sSpellRadiusStore.LookupEntry(m_spellInfo->EffectRadiusIndex[eff_idx]));
    int32 duration = GetSpellDuration(m_spellInfo);
    TempSummonType summonType = (duration == 0) ? TEMPSUMMON_DEAD_DESPAWN : TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN;

    int32 amount = damage > 0 ? damage : 1;

    for (int32 count = 0; count < amount; ++count)
    {
        float px, py, pz;
        // If dest location if present
        if (m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION)
        {
            // Summon 1 unit in dest location
            if (count == 0)
            {
                px = m_targets.m_destX;
                py = m_targets.m_destY;
                pz = m_targets.m_destZ;
            }
            // Summon in random point all other units if location present
            else
                m_caster->GetRandomPoint(center_x, center_y, center_z, radius, px, py, pz);
        }
        // Summon if dest location not present near caster
        else
        {
            if (radius > 0.0f)
            {
                // not using bounding radius of caster here
                m_caster->GetClosePoint(px, py, pz, 0.0f, radius);
            }
            else
            {
                // EffectRadiusIndex 0 or 36
                px = m_caster->GetPositionX();
                py = m_caster->GetPositionY();
                pz = m_caster->GetPositionZ();
            }
        }

        if (Creature *summon = m_caster->SummonCreature(creature_entry, px, py, pz, m_caster->GetOrientation(), summonType, duration))
        {
            summon->SetUInt32Value(UNIT_CREATED_BY_SPELL, m_spellInfo->Id);
            // Exception for Alterac Shredder. The second effect of the spell (possess) can't target the shredder
            // because it is not summoned at target selection phase.
            switch (m_spellInfo->Id)
            {
                // Both sides
                case 21544:
                case 21565:
                    summon->SetUInt32Value(UNIT_CREATED_BY_SPELL, m_spellInfo->EffectTriggerSpell[1]);
                    summon->SetCreatorGuid(m_caster->GetObjectGuid());
                    *m_selfContainer = nullptr;
                    m_caster->CastSpell(summon, m_spellInfo->EffectTriggerSpell[1], true);
                    break;
                // Target Dummy
                case 4071:
                case 4072:
                case 19805:
                    summon->lootForCreator = true;
                    summon->SetCreatorGuid(m_caster->GetObjectGuid());
                    summon->SetLootRecipient(m_caster);
                    break;
                // Rockwing Gargoyle
                case 16381:
                    if (m_caster->getAttackerForHelper())
                        summon->AI()->AttackStart(m_caster->getAttackerForHelper());
                    break;
                // Chained Essence of Eranikus
                case 12766:
                    int EranikusText = -1001012;
                    switch (urand(0, 7))
                    {
                        case 1:
                            EranikusText = -1001013;
                            break;
                        case 2:
                            EranikusText = -1001014;
                            break;
                        case 3:
                            EranikusText = -1001015;
                            break;
                        case 4:
                            EranikusText = -1001016;
                            break;
                        case 5:
                            EranikusText = -1001017;
                            break;
                        case 6:
                            EranikusText = -1001018;
                            break;
                        case 7:
                            EranikusText = -1001019;
                            break;
                    }
                    summon->MonsterWhisper(EranikusText, m_caster);
                    break;

            }

            // UNIT_FIELD_CREATEDBY are not set for these kind of spells.
            // Does exceptions exist? If so, what are they?
            // summon->SetCreatorGuid(m_caster->GetObjectGuid());
        }
    }
}

// Used for SPELL_EFFECT_SUMMON_GUARDIAN and SPELL_EFFECT_SUMMON_POSSESSED
void Spell::EffectSummonGuardian(SpellEffectIndex eff_idx)
{
    uint32 pet_entry = m_spellInfo->EffectMiscValue[eff_idx];
    if (!pet_entry)
        return;

    CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(pet_entry);
    if (!cInfo)
    {
        sLog.outErrorDb("Spell::DoSummonGuardian: creature entry %u not found for spell %u.", pet_entry, m_spellInfo->Id);
        return;
    }

    // set timer for unsummon
    int32 duration = CalculateSpellDuration(m_spellInfo, m_caster);

    // second direct cast unsummon guardian(s) (guardians without like functionality have cooldown > spawn time)
    if (!m_IsTriggeredSpell && m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        bool found = false;
        // including protector
        while (Pet* old_summon = m_caster->FindGuardianWithEntry(pet_entry))
        {
            old_summon->Unsummon(PET_SAVE_AS_DELETED, m_caster);
            found = true;
        }

        if (found && !(m_spellInfo->DurationIndex && m_spellInfo->Category))
            return;
    }

    // Hard cap for NPC summoned guardians
    if (m_caster->GetTypeId() != TYPEID_PLAYER && m_caster->GetGuardianCountWithEntry(pet_entry) > 15)
        return;

    // in another case summon new
    uint32 level = m_caster->getLevel();

    // level of pet summoned using engineering item based at engineering skill level
    if (m_caster->GetTypeId() == TYPEID_PLAYER && m_CastItem)
    {
        ItemPrototype const *proto = m_CastItem->GetProto();
        if (proto && proto->RequiredSkill == SKILL_ENGINEERING)
        {
            uint16 engiLevel = ((Player*)m_caster)->GetSkillValue(SKILL_ENGINEERING);
            if (engiLevel)
            {
                level = engiLevel / 5;
            }
        }
    }

    if (m_spellInfo->Id == 9515) // Exception for 'Summon Tracking Hound'
        level = m_spellInfo->spellLevel;
    if (m_spellInfo->Id == 14642 && level > cInfo->maxlevel) // Felhound Minion level cap
        level = cInfo->maxlevel;

    // select center of summon position
    float center_x = m_targets.m_destX;
    float center_y = m_targets.m_destY;
    float center_z = m_targets.m_destZ;

    float radius = GetSpellRadius(sSpellRadiusStore.LookupEntry(m_spellInfo->EffectRadiusIndex[eff_idx]));

    int32 amount = damage > 0 ? damage : 1;

    for (int32 count = 0; count < amount; ++count)
    {
        Pet* spawnCreature = new Pet(GUARDIAN_PET);

        // If dest location if present
        // Summon 1 unit in dest location
        CreatureCreatePos pos(m_caster->GetMap(), m_targets.m_destX, m_targets.m_destY, m_targets.m_destZ, -m_caster->GetOrientation());

        if (m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION)
        {
            // Summon in random point all other units if location present
            if (count > 0)
            {
                float x, y, z;
                m_caster->GetRandomPoint(center_x, center_y, center_z, radius, x, y, z);
                pos = CreatureCreatePos(m_caster->GetMap(), x, y, z, m_caster->GetOrientation());
            }
        }
        // Summon if dest location not present near caster
        else
            pos = CreatureCreatePos(m_caster, m_caster->GetOrientation());

        Map *map = m_caster->GetMap();
        uint32 pet_number = sObjectMgr.GeneratePetNumber();
        if (!spawnCreature->Create(map->GenerateLocalLowGuid(HIGHGUID_PET), pos, cInfo, pet_number))
        {
            sLog.outError("Spell::DoSummonGuardian: can't create creature entry %u for spell %u.", pet_entry, m_spellInfo->Id);
            delete spawnCreature;
            return;
        }

        spawnCreature->SetSummonPoint(pos);

        if (m_duration > 0)
            spawnCreature->SetDuration(m_duration);

        //spawnCreature->SetName("");                       // generated by client
        spawnCreature->SetOwnerGuid(m_caster->GetObjectGuid());
        spawnCreature->SetInitCreaturePowerType();
        spawnCreature->SetUInt32Value(UNIT_NPC_FLAGS, spawnCreature->GetCreatureInfo()->npcflag);
        spawnCreature->setFaction(m_caster->getFaction());
        spawnCreature->SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, 0);
        spawnCreature->SetCreatorGuid(m_caster->GetObjectGuid());
        spawnCreature->SetUInt32Value(UNIT_CREATED_BY_SPELL, m_spellInfo->Id);

        spawnCreature->InitStatsForLevel(level, m_caster);
        spawnCreature->GetCharmInfo()->SetPetNumber(pet_number, false);

        spawnCreature->AIM_Initialize();

        m_caster->AddGuardian(spawnCreature);

        map->Add((Creature*)spawnCreature);

        // Notify Summoner
        if (m_caster->GetTypeId() == TYPEID_UNIT && ((Creature*)m_caster)->AI())
            ((Creature*)m_caster)->AI()->JustSummoned(spawnCreature);

        switch (m_spellInfo->Id)
        {
            case 126: // Eye of Kilrogg
            {
                spawnCreature->SetWalk(false);
                if (Player* p = m_caster->ToPlayer())
                {
                    // Stealth
                    spawnCreature->CastSpell(spawnCreature, 2585, true);
                    p->ModPossessPet(spawnCreature, true, AURA_REMOVE_BY_DEFAULT);
                }
                break;
            }
            case 11403: // Elixir of Dream Vision
            {
                spawnCreature->SetWalk(false);
                if (Player* p = m_caster->ToPlayer())
                {
                    spawnCreature->CastSpell(spawnCreature, 27986, true); // Levitate
                    p->ModPossessPet(spawnCreature, true, AURA_REMOVE_BY_DEFAULT);
                }
                break;
            }
            case 17166: // Release Umi's Yeti - Quest Are We There, Yeti? Part 3
            {
                spawnCreature->MonsterTextEmote(-1900169);
                spawnCreature->MonsterSay(-1900170);

                switch (spawnCreature->GetAreaId())
                {
                    case 541: // Un'Goro Crater
                        if (Creature* pCreature = spawnCreature->FindNearestCreature(10977, 30.0f, true)) // NPC_QUIXXIL
                        {
                            spawnCreature->GetMotionMaster()->MoveFollow(pCreature, 0.6f, M_PI_F);
                            pCreature->MonsterSay(-1900171);
                            pCreature->SetWalk(false);
                            pCreature->GetMotionMaster()->MoveWaypoint(false);
                        }
                        break;
                    case 976: // Tanaris
                        if (Creature* pCreature = spawnCreature->FindNearestCreature(7583, 30.0f, true)) // NPC_SPRINKLE
                        {
                            spawnCreature->GetMotionMaster()->MoveFollow(pCreature, 0.6f, M_PI_F);
                            pCreature->MonsterTextEmote(-1900172);
                            pCreature->SetWalk(false);
                            pCreature->GetMotionMaster()->MoveWaypoint(false);
                        }
                        break;
                    case 2255: // Winterspring
                        if (Creature* pCreature = spawnCreature->FindNearestCreature(10978, 30.0f, true)) // NPC_LEGACKI
                        {
                            spawnCreature->GetMotionMaster()->MoveFollow(pCreature, 0.6f, M_PI_F);
                            pCreature->MonsterTextEmote(-1900173);
                            pCreature->SetWalk(false);
                            pCreature->GetMotionMaster()->MoveWaypoint(false);
                        }
                        break;
                }
                break;
            }
        }
    }
}

void Spell::EffectTeleUnitsFaceCaster(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    if (unitTarget->IsTaxiFlying())
        return;

    float fx, fy, fz;
    if (m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION)
        m_targets.getDestination(fx, fy, fz);
    else
    {
        float dis = GetSpellRadius(sSpellRadiusStore.LookupEntry(m_spellInfo->EffectRadiusIndex[eff_idx]));
        m_caster->GetClosePoint(fx, fy, fz, unitTarget->GetObjectBoundingRadius(), dis);
    }

    unitTarget->NearTeleportTo(fx, fy, fz, -m_caster->GetOrientation(), TELE_TO_NOT_LEAVE_COMBAT | TELE_TO_NOT_UNSUMMON_PET | (unitTarget == m_caster ? TELE_TO_SPELL : 0));
}

void Spell::EffectLearnSkill(SpellEffectIndex eff_idx)
{
    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    if (damage < 0)
        return;

    uint32 skillid =  m_spellInfo->EffectMiscValue[eff_idx];
    uint16 skillval = ((Player*)unitTarget)->GetPureSkillValue(skillid);
    ((Player*)unitTarget)->SetSkill(skillid, skillval ? skillval : 1, damage * 75, damage);
}

void Spell::EffectAddHonor(SpellEffectIndex /*eff_idx*/)
{
    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    // honor-spells don't scale with level and won't be casted by an item
    // also we must use damage (spelldescription says +25 honor but damage is only 24)
    ((Player*)unitTarget)->GetHonorMgr().Add(float(damage), QUEST);
    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "SpellEffect::AddHonor (spell_id %u) rewards %u honor points (non scale) for player: %u", m_spellInfo->Id, damage, ((Player*)unitTarget)->GetGUIDLow());
}

void Spell::EffectTradeSkill(SpellEffectIndex /*eff_idx*/)
{
    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;
    // uint32 skillid =  m_spellInfo->EffectMiscValue[i];
    // uint16 skillmax = ((Player*)unitTarget)->(skillid);
    // ((Player*)unitTarget)->SetSkill(skillid,skillval?skillval:1,skillmax+75);
}

void Spell::EffectEnchantItemPerm(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;
    if (!itemTarget)
        return;

    Player* p_caster = (Player*)m_caster;

    // not grow at item use at item case
    p_caster->UpdateCraftSkill(m_spellInfo->Id);

    uint32 enchant_id = m_spellInfo->EffectMiscValue[eff_idx];
    if (!enchant_id)
        return;

    SpellItemEnchantmentEntry const *pEnchant = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
    if (!pEnchant)
        return;

    // item can be in trade slot and have owner diff. from caster
    Player* item_owner = itemTarget->GetOwner();
    if (!item_owner)
        return;

    if (!sWorld.getConfig(CONFIG_BOOL_GM_ALLOW_TRADES) && p_caster->GetSession()->GetSecurity() > SEC_PLAYER)
        return;

    if (item_owner != p_caster && p_caster->GetSession()->GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
    {
        sLog.outCommand(p_caster->GetSession()->GetAccountId(), "GM %s (Account: %u) enchanting(perm): %s (Entry: %d) for player: %s (Account: %u)",
                        p_caster->GetName(), p_caster->GetSession()->GetAccountId(),
                        itemTarget->GetProto()->Name1, itemTarget->GetEntry(),
                        item_owner->GetName(), item_owner->GetSession()->GetAccountId());
    }

    // remove old enchanting before applying new if equipped
    item_owner->ApplyEnchantment(itemTarget, PERM_ENCHANTMENT_SLOT, false);

    itemTarget->SetEnchantment(PERM_ENCHANTMENT_SLOT, enchant_id, 0, 0);

    // add new enchanting if equipped
    item_owner->ApplyEnchantment(itemTarget, PERM_ENCHANTMENT_SLOT, true);
}


uint32 GetPoisonCharges(uint32 spellId)
{
    switch (spellId)
    {
        // Instant Poison
        case 8679:
            return 40;
        case 8686:
            return 55;
        case 8688:
            return 70;
        case 11338:
            return 85;
        case 11339:
            return 100;
        case 11340:
            return 115;
        // Mind-numbing Poison
        case 5761:
            return 50;
        case 8693:
            return 75;
        case 11399:
            return 100;
        // Deadly Poison
        case 2823:
            return 60;
        case 2824:
            return 75;
        case 11355:
            return 90;
        case 11356:
            return 105;
        case 25351:
            return 120;
        // Wound Poison
        case 13219:
            return 60;
        case 13225:
            return 75;
        case 13226:
            return 90;
        case 13227:
            return 105;
            // Crippling poison
            //case 3408:  return 0;
            //case 11202: return 0;
    }
    return 0;
}


void Spell::EffectEnchantItemTmp(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Player* p_caster = (Player*)m_caster;

    if (!itemTarget)
        return;

    uint32 enchant_id = m_spellInfo->EffectMiscValue[eff_idx];
    uint32 charges    = 0;

    if (!enchant_id)
    {
        sLog.outError("Spell %u Effect %u (SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY) have 0 as enchanting id", m_spellInfo->Id, eff_idx);
        return;
    }

    SpellItemEnchantmentEntry const *pEnchant = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
    if (!pEnchant)
    {
        sLog.outError("Spell %u Effect %u (SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY) have nonexistent enchanting id %u ", m_spellInfo->Id, eff_idx, enchant_id);
        return;
    }

    // select enchantment duration
    uint32 duration;

    // other rogue family enchantments always 1 hour (some have spell damage=0, but some have wrong data in EffBasePoints)
    if (m_spellInfo->SpellFamilyName == SPELLFAMILY_ROGUE)
        duration = 1800;                                    // 30 mins (Ustaag <Nostalrius> : 1h post 2.3)
    // shaman family enchantments
    else if (m_spellInfo->SpellFamilyName == SPELLFAMILY_SHAMAN)
        duration = 300;                                     // 5 mins (Ustaag <Nostalrius> : 30 mn post 1.12)
    // other cases with this SpellVisual already selected
    else if (m_spellInfo->SpellVisual == 215)
        duration = 1800;                                    // 30 mins
    // some fishing pole bonuses
    else if (m_spellInfo->SpellVisual == 563)
        duration = enchant_id == 266 ? 300 : 600;           // 10 or 5 mins
    // shaman Rockbiter enchantments
    else if (m_spellInfo->SpellVisual == 58)
        duration = 300;                                     // 5 mins (Ustaag <Nostalrius> : 30 mn post 1.12)
    // shaman Flametongue enchantments
    else if (m_spellInfo->SpellVisual == 290)
        duration = 300;                                     // 5 mins (Ustaag <Nostalrius> : 30 mn post 1.12)
    // shaman Frostbrand enchantments
    else if (m_spellInfo->SpellVisual == 291)
        duration = 300;                                     // 5 mins (Ustaag <Nostalrius> : 30 mn post 1.12)
    // Sharpen Blade enchantments
    else if (m_spellInfo->SpellVisual == 3324)
        duration = 1800;                                    // 30 mins (Ustaag <Nostalrius> : Sharpening Stone)
    // Enhance Blunt enchantments
    else if (m_spellInfo->SpellVisual == 3325)
        duration = 1800;                                    // 30 mins (Ustaag <Nostalrius> : Weightstone)
    // Oil enchantments
    else if (m_spellInfo->SpellVisual == 3182)
        duration = 1800;                                    // 30 mins (Ustaag <Nostalrius> : Oil)
    // default case
    else
        duration = 3600;                                    // 1 hour

    // Calcul du nombre de charges
    // Poisons :
    if (m_spellInfo->SpellFamilyName == SPELLFAMILY_ROGUE)
        charges = GetPoisonCharges(m_spellInfo->Id);

    // item can be in trade slot and have owner diff. from caster
    Player* item_owner = itemTarget->GetOwner();
    if (!item_owner)
        return;

    if (!sWorld.getConfig(CONFIG_BOOL_GM_ALLOW_TRADES) && p_caster->GetSession()->GetSecurity() > SEC_PLAYER)
        return;

    if (item_owner != p_caster && p_caster->GetSession()->GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
    {
        sLog.outCommand(p_caster->GetSession()->GetAccountId(), "GM %s (Account: %u) enchanting(temp): %s (Entry: %d) for player: %s (Account: %u)",
                        p_caster->GetName(), p_caster->GetSession()->GetAccountId(),
                        itemTarget->GetProto()->Name1, itemTarget->GetEntry(),
                        item_owner->GetName(), item_owner->GetSession()->GetAccountId());
    }

    // remove old enchant before applying new 
    item_owner->ApplyEnchantment(itemTarget, TEMP_ENCHANTMENT_SLOT, false);

    itemTarget->SetEnchantment(TEMP_ENCHANTMENT_SLOT, enchant_id, duration * 1000, charges);

    // add new enchanting if equipped
    item_owner->ApplyEnchantment(itemTarget, TEMP_ENCHANTMENT_SLOT, true);
}

void Spell::EffectTameCreature(SpellEffectIndex /*eff_idx*/)
{
    // Caster must be player, checked in Spell::CheckCast
    // Spell can be triggered, we need to check original caster prior to caster
    Player* plr = (Player*)GetAffectiveCaster();

    Creature* creatureTarget = (Creature*)unitTarget;

    // cast finish successfully
    //SendChannelUpdate(0);
    finish();

    Pet* pet = new Pet(HUNTER_PET);

    // Nostalrius: defensive as default behaviour
    pet->SetReactState(REACT_DEFENSIVE);

    if (!pet->CreateBaseAtCreature(creatureTarget))
    {
        delete pet;
        return;
    }

    pet->SetOwnerGuid(plr->GetObjectGuid());
    pet->SetCreatorGuid(plr->GetObjectGuid());
    pet->setFaction(plr->getFaction());
    pet->SetUInt32Value(UNIT_CREATED_BY_SPELL, m_spellInfo->Id);

    if (plr->IsPvP())
        pet->SetPvP(true);

    if (!pet->InitStatsForLevel(creatureTarget->getLevel()))
    {
        sLog.outError("Pet::InitStatsForLevel() failed for creature (Entry: %u)!", creatureTarget->GetEntry());
        delete pet;
        return;
    }

    pet->GetCharmInfo()->SetPetNumber(sObjectMgr.GeneratePetNumber(), true);
    // this enables pet details window (Shift+P)
    pet->AIM_Initialize();
    pet->InitPetCreateSpells();
    pet->SetHealth(pet->GetMaxHealth());

    // "kill" original creature
    creatureTarget->ForcedDespawn();

    // prepare visual effect for levelup
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, creatureTarget->getLevel() - 1);

    // Apply default loyalty at summon
    LoyaltyLevel defaultLoyalty = LoyaltyLevel(sWorld.getConfig(CONFIG_UINT32_PET_DEFAULT_LOYALTY));
    while (pet->GetLoyaltyLevel() != defaultLoyalty)
        pet->ModifyLoyalty(pet->GetStartLoyaltyPoints(defaultLoyalty));

    // add to world
    pet->GetMap()->Add((Creature*)pet);

    // visual effect for levelup
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, creatureTarget->getLevel());

    // caster have pet now
    plr->SetPet(pet);

    pet->SavePetToDB(PET_SAVE_AS_CURRENT);
    plr->PetSpellInitialize();
}

void Spell::EffectSummonPet(SpellEffectIndex eff_idx)
{
    m_caster->EffectSummonPet(m_spellInfo->Id, m_spellInfo->EffectMiscValue[eff_idx]);
}

void Unit::EffectSummonPet(uint32 spellId, uint32 petentry)
{
    Pet *OldSummon = GetPet();

    // if pet requested type already exist
    if (OldSummon)
    {
        if (petentry == 0 || OldSummon->GetEntry() == petentry)
        {
            if (OldSummon->isDead())
            {
                if (petentry) // Warlock pet
                    OldSummon->Unsummon(PET_SAVE_NOT_IN_SLOT);
                else
                    return; // pet in corpse state can't be summoned
            }
            else
                OldSummon->GetMap()->Remove((Creature*)OldSummon, false);
        }
        else if (GetTypeId() == TYPEID_PLAYER)
            OldSummon->Unsummon(OldSummon->getPetType() == HUNTER_PET ? PET_SAVE_AS_DELETED : PET_SAVE_NOT_IN_SLOT, this);
        else
            return;
    }

    CreatureInfo const* cInfo = petentry ? sCreatureStorage.LookupEntry<CreatureInfo>(petentry) : NULL;

    // == 0 in case call current pet, check only real summon case
    if (petentry && !cInfo)
    {
        sLog.outErrorDb("EffectSummonPet: creature entry %u not found for spell %u.", petentry, spellId);
        return;
    }

    Pet* NewSummon = new Pet;

    // petentry==0 for hunter "call pet" (current pet summoned if any)
    if (GetTypeId() == TYPEID_PLAYER && NewSummon->LoadPetFromDB((Player*)this, petentry))
    {
        if (NewSummon->getPetType() == SUMMON_PET)
        {
            // Remove Demonic Sacrifice auras (known pet)
            Unit::AuraList const& auraClassScripts = GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
            for (Unit::AuraList::const_iterator itr = auraClassScripts.begin(); itr != auraClassScripts.end();)
            {
                if ((*itr)->GetModifier()->m_miscvalue == 2228)
                {
                    RemoveAurasDueToSpell((*itr)->GetId());
                    itr = auraClassScripts.begin();
                }
                else
                    ++itr;
            }
        }
        return;
    }

    // not error in case fail hunter call pet
    if (!petentry)
    {
        delete NewSummon;
        return;
    }

    CreatureCreatePos pos(this, GetOrientation(), PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);

    Map *map = GetMap();
    uint32 pet_number = sObjectMgr.GeneratePetNumber();
    if (!NewSummon->Create(map->GenerateLocalLowGuid(HIGHGUID_PET), pos, cInfo, pet_number))
    {
        delete NewSummon;
        return;
    }

    uint32 petlevel = getLevel();
    NewSummon->SetSummonPoint(pos);

    NewSummon->setPetType(SUMMON_PET);

    uint32 faction = getFaction();
    if (GetTypeId() == TYPEID_UNIT)
        NewSummon->SetReactState(REACT_AGGRESSIVE);
    else
        NewSummon->SetReactState(REACT_DEFENSIVE);

    NewSummon->SetOwnerGuid(GetObjectGuid());
    NewSummon->SetCreatorGuid(GetObjectGuid());
    NewSummon->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);
    NewSummon->setFaction(faction);
    NewSummon->SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, uint32(time(nullptr)));
    NewSummon->SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, 0);
    NewSummon->SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, 1000);
    NewSummon->SetUInt32Value(UNIT_CREATED_BY_SPELL, spellId);

    // Only players have permanent pets. Fix elite pets for NPCs.
    NewSummon->GetCharmInfo()->SetPetNumber(pet_number, GetTypeId() == TYPEID_PLAYER);
    NewSummon->GetCharmInfo()->SetCommandState(COMMAND_FOLLOW);

    // this enables pet details window (Shift+P)
    if (IsPvP())
        NewSummon->SetPvP(true);

    NewSummon->InitStatsForLevel(petlevel, this);
    NewSummon->InitPetCreateSpells();

    if (NewSummon->getPetType() == SUMMON_PET)
    {
        // Remove Demonic Sacrifice auras (new pet)
        Unit::AuraList const& auraClassScripts = GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
        for (Unit::AuraList::const_iterator itr = auraClassScripts.begin(); itr != auraClassScripts.end();)
        {
            if ((*itr)->GetModifier()->m_miscvalue == 2228)
            {
                RemoveAurasDueToSpell((*itr)->GetId());
                itr = auraClassScripts.begin();
            }
            else
                ++itr;
        }

        // generate new name for summon pet
        std::string new_name = sObjectMgr.GeneratePetName(petentry);
        if (!new_name.empty())
            NewSummon->SetName(new_name);
    }
    else if (NewSummon->getPetType() == HUNTER_PET)
        NewSummon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME);

    NewSummon->AIM_Initialize();
    NewSummon->SetHealth(NewSummon->GetMaxHealth());
    NewSummon->SetPower(POWER_MANA, NewSummon->GetMaxPower(POWER_MANA));

    map->Add((Creature*)NewSummon);

    SetPet(NewSummon);
    DEBUG_LOG("New Pet has guid %u", NewSummon->GetGUIDLow());

    if (Player* caster = ToPlayer())
    {
        NewSummon->SavePetToDB(PET_SAVE_AS_CURRENT);
        caster->PetSpellInitialize();
        caster->m_petEntry = NewSummon->GetEntry();
        caster->m_petSpell = NewSummon->GetUInt32Value(UNIT_CREATED_BY_SPELL);
    }
}

void Spell::EffectLearnPetSpell(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *_player = (Player*)m_caster;

    Pet *pet = _player->GetPet();
    if (!pet)
        return;
    if (!pet->isAlive())
        return;

    SpellEntry const *learn_spellproto = sSpellMgr.GetSpellEntry(m_spellInfo->EffectTriggerSpell[eff_idx]);
    if (!learn_spellproto)
        return;

    pet->SetTP(pet->m_TrainingPoints - pet->GetTPForSpell(learn_spellproto->Id));
    pet->learnSpell(learn_spellproto->Id);

    pet->SavePetToDB(PET_SAVE_AS_CURRENT);
    _player->PetSpellInitialize();
}

void Spell::EffectTaunt(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    // this effect use before aura Taunt apply for prevent taunt already attacking target
    // for spell as marked "non effective at already attacking target"
    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
    {
        if (unitTarget->getVictim() == m_caster)
        {
            SendCastResult(SPELL_FAILED_DONT_REPORT);
            return;
        }
    }

    // Also use this effect to set the taunter's threat to the taunted creature's highest value
    if (unitTarget->CanHaveThreatList() && unitTarget->getThreatManager().getCurrentVictim())
        unitTarget->getThreatManager().addThreat(m_caster, unitTarget->getThreatManager().getCurrentVictim()->getThreat());

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectWeaponDmg(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;
    if (!unitTarget->isAlive())
        return;

    if (m_spellInfo->Id == 17364) // Courroux naturel
    {
        if (!m_caster->isAlive()) // CalculateMeleeDamage does not work in that case.
            return;
        m_caster->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_MELEE_ATTACK);
        if (Spell* spell = m_caster->GetCurrentSpell(CURRENT_MELEE_SPELL))
            spell->cast();
        CalcDamageInfo damageInfo;
        m_caster->CalculateMeleeDamage(unitTarget, 0, &damageInfo, BASE_ATTACK);

        // Send log damage message to client
        for (uint8 i = 0; i < m_caster->GetWeaponDamageCount(BASE_ATTACK); i++)
        {
            damageInfo.totalDamage -= damageInfo.subDamage[i].damage;
            m_caster->DealDamageMods(unitTarget, damageInfo.subDamage[i].damage, &damageInfo.subDamage[i].absorb);
            damageInfo.totalDamage += damageInfo.subDamage[i].damage;
        }

        m_caster->SendAttackStateUpdate(&damageInfo);
        m_caster->ProcDamageAndSpell(damageInfo.target, damageInfo.procAttacker, damageInfo.procVictim, damageInfo.procEx, damageInfo.totalDamage, damageInfo.attackType);
        m_caster->DealMeleeDamage(&damageInfo, true);

        // if damage unitTarget call AI reaction
        unitTarget->AttackedBy(m_caster);
        m_damage = 0;
        return;
    }

    // multiple weapon dmg effect workaround
    // execute only the last weapon damage
    // and handle all effects at once
    for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
    {
        switch (m_spellInfo->Effect[j])
        {
            case SPELL_EFFECT_WEAPON_DAMAGE:
            case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
            case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:
            case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
                if (j < int(eff_idx))                             // we must calculate only at last weapon effect
                    return;
                break;
        }
    }

    // some spell specific modifiers
    bool customBonusDamagePercentMod = false;
    float bonusDamagePercentMod  = 1.0f;                    // applied to fixed effect damage bonus if set customBonusDamagePercentMod
    float weaponDamagePercentMod = 1.0f;                    // applied to weapon damage (and to fixed effect damage bonus if customBonusDamagePercentMod not set
    bool normalized = false;

    int32 spell_bonus = 0;                                  // bonus specific for spell
    switch (m_spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_ROGUE:
        {
            // Ambush
            if (m_spellInfo->IsFitToFamilyMask<CF_ROGUE_AMBUSH>())
            {
                customBonusDamagePercentMod = true;
                bonusDamagePercentMod = 2.5f;               // 250%
            }
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            // Seal of Command - receive benefit from Spell Damage and Healing
            if (m_spellInfo->Id == 20424)
            {
                spell_bonus += int32(0.20f * m_caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(m_spellInfo)));
                spell_bonus += int32(0.29f * unitTarget->SpellBaseDamageBonusTaken(GetSpellSchoolMask(m_spellInfo)));
            }
            break;
        }
    }

    int32 fixed_bonus = 0;
    for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
    {
        switch (m_spellInfo->Effect[j])
        {
            case SPELL_EFFECT_WEAPON_DAMAGE:
            case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
                fixed_bonus += CalculateDamage(SpellEffectIndex(j), unitTarget);
                break;
            case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:
                fixed_bonus += CalculateDamage(SpellEffectIndex(j), unitTarget);
                normalized = true;
                break;
            case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
                weaponDamagePercentMod *= float(CalculateDamage(SpellEffectIndex(j), unitTarget)) / 100.0f;

                // applied only to prev.effects fixed damage
                if (customBonusDamagePercentMod)
                    fixed_bonus = int32(fixed_bonus * bonusDamagePercentMod);
                else
                    fixed_bonus = int32(fixed_bonus * weaponDamagePercentMod);
                break;
            default:
                break;                                      // not weapon damage effect, just skip
        }
    }

    // non-weapon damage
    int32 bonus = spell_bonus + fixed_bonus;

    // apply to non-weapon bonus weapon total pct effect, weapon total flat effect included in weapon damage
    if (bonus)
    {
        UnitMods unitMod;
        switch (m_attackType)
        {
            default:
            case BASE_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_MAINHAND;
                break;
            case OFF_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_OFFHAND;
                break;
            case RANGED_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_RANGED;
                break;
        }

        float weapon_total_pct  = m_caster->GetModifierValue(unitMod, TOTAL_PCT);
        bonus = int32(bonus * weapon_total_pct);
    }

    // + weapon damage with applied weapon% dmg to base weapon damage in call
    bonus += int32(m_caster->CalculateDamage(m_attackType, normalized) * weaponDamagePercentMod);

    // prevent negative damage
    m_damage += uint32(bonus > 0 ? bonus : 0);

     // Sanctity Aura addition mod (HACK) for SoC
    if (m_spellInfo->Id == 20424)
    {
        // + Sanctity Aura
        if (m_caster->HasAura(20218))
            m_damage *= 1.1f;
    }
}

void Spell::EffectThreat(SpellEffectIndex eff_idx)
{
    if (!unitTarget || !unitTarget->isAlive() || !m_caster->isAlive())
        return;

    if (!unitTarget->CanHaveThreatList())
        return;

    unitTarget->AddThreat(m_caster, float(damage), false, GetSpellSchoolMask(m_spellInfo), m_spellInfo);

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectHealMaxHealth(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget)
        return;
    if (!unitTarget->isAlive())
        return;
    uint32 heal = m_caster->GetMaxHealth();

    // Healing percent modifiers
    float  DoneTotalMod = 1.0f;
    float  TakenTotalMod = 1.0f;

    // Healing done percent
    std::list <Aura*> const& mHealingDonePct = m_caster->GetAurasByType(SPELL_AURA_MOD_HEALING_DONE_PERCENT);
    for (std::list <Aura*>::const_iterator i = mHealingDonePct.begin(); i != mHealingDonePct.end(); ++i)
        DoneTotalMod *= (100.0f + (*i)->GetModifier()->m_amount) / 100.0f;

    heal *= DoneTotalMod;

    // Healing taken percent
    float minval = float(unitTarget->GetMaxNegativeAuraModifier(SPELL_AURA_MOD_HEALING_PCT));
    if (minval)
        TakenTotalMod *= (100.0f + minval) / 100.0f;

    float maxval = float(unitTarget->GetMaxPositiveAuraModifier(SPELL_AURA_MOD_HEALING_PCT));
    if (maxval)
        TakenTotalMod *= (100.0f + maxval) / 100.0f;

    heal *= TakenTotalMod;

    m_healing += heal;
}

void Spell::EffectInterruptCast(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;
    if (!unitTarget->isAlive())
        return;

    // TODO: not all spells that used this effect apply cooldown at school spells
    // also exist case: apply cooldown to interrupted cast only and to all spells
    for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
    {
        if (Spell* spell = unitTarget->GetCurrentSpell(CurrentSpellTypes(i)))
        {
            // Nostalrius: fix CS of instant spells (with CC Delay)
            if (i != CURRENT_CHANNELED_SPELL && !spell->GetCastTime())
                continue;

            SpellEntry const* curSpellInfo = spell->m_spellInfo;
            // check if we can interrupt spell
            if ((spell->getState() == SPELL_STATE_CASTING
                || (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastTime() > 0.0f))
                && curSpellInfo->PreventionType == SPELL_PREVENTION_TYPE_SILENCE
                && ((i == CURRENT_GENERIC_SPELL && curSpellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_DAMAGE)
                || (i == CURRENT_CHANNELED_SPELL && curSpellInfo->ChannelInterruptFlags & CHANNEL_FLAG_INTERRUPT)))
            {
                unitTarget->ProhibitSpellSchool(GetSpellSchoolMask(curSpellInfo), GetSpellDuration(m_spellInfo));
                unitTarget->InterruptSpell(CurrentSpellTypes(i), false);

                ExecuteLogInfo info(unitTarget->GetObjectGuid());
                info.interruptCast.spellId = curSpellInfo->Id;
                AddExecuteLogInfo(eff_idx, info);
            }
        }
    }
}

void Spell::EffectSummonObjectWild(SpellEffectIndex eff_idx)
{
    uint32 gameobject_id = m_spellInfo->EffectMiscValue[eff_idx];

    GameObject* pGameObj = new GameObject;

    WorldObject* target = focusObject;
    if (!target)
        target = m_caster;

    float x, y, z, o;
    if (m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION)
    {
        x = m_targets.m_destX;
        y = m_targets.m_destY;
        z = m_targets.m_destZ;
        o = target->GetOrientation();
    }
    else
    {
        m_caster->GetPosition(x, y, z);
        o = m_caster->GetOrientation();
    }

    Map *map = target->GetMap();

    if (!pGameObj->Create(map->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), gameobject_id, map,
                          x, y, z, o, 0.0f, 0.0f, 0.0f, 0.0f, GO_ANIMPROGRESS_DEFAULT, GO_STATE_READY))
    {
        delete pGameObj;
        return;
    }

    int32 duration = GetSpellDuration(m_spellInfo);

    pGameObj->SetRespawnTime(duration > 0 ? duration / IN_MILLISECONDS : 0);
    pGameObj->SetSpellId(m_spellInfo->Id);

    // Wild object not have owner and check clickable by players
    map->Add(pGameObj);

    if (pGameObj->GetGoType() == GAMEOBJECT_TYPE_FLAGDROP && m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        Player *pl = (Player*)m_caster;
        BattleGround* bg = ((Player *)m_caster)->GetBattleGround();

        switch (pGameObj->GetMapId())
        {
            case 489:                                       //WS
            {
                if (bg && bg->GetTypeID() == BATTLEGROUND_WS && bg->GetStatus() == STATUS_IN_PROGRESS)
                {
                    Team team = ALLIANCE;
                    if (pl->GetTeam() == team)
                        team = HORDE;

                    ((BattleGroundWS*)bg)->SetDroppedFlagGuid(pGameObj->GetObjectGuid(), team);
                }
                break;
            }
        }
    }

    pGameObj->SetWorldMask(m_caster->GetWorldMask());
    pGameObj->SummonLinkedTrapIfAny();

    if (m_caster->GetTypeId() == TYPEID_UNIT && ((Creature*)m_caster)->AI())
        ((Creature*)m_caster)->AI()->JustSummoned(pGameObj);
}

void Spell::EffectScriptEffect(SpellEffectIndex eff_idx)
{
    // TODO: we must implement hunter pet summon at login there (spell 6962)
    switch (m_spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch (m_spellInfo->Id)
            {
                case 8856:                                  // Bending Shinbone
                {
                    if (!itemTarget && m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spell_id = 0;
                    switch (urand(1, 5))
                    {
                        case 1:
                            spell_id = 8854;
                            break;
                        default:
                            spell_id = 8855;
                            break;
                    }

                    m_caster->CastSpell(m_caster, spell_id, true, nullptr);
                    return;
                }
                case 17512:                                 // Piccolo of the Flaming Fire
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    unitTarget->HandleEmoteCommand(EMOTE_STATE_DANCE);

                    return;
                }
                case 22539:                                 // Shadow Flame (All script effects, not just end ones to
                case 22972:                                 // prevent player from dodging the last triggered spell)
                case 22975:
                case 22976:
                case 22977:
                case 22978:
                case 22979:
                case 22980:
                case 22981:
                case 22982:
                case 22983:
                case 22984:
                case 22985:
                {
                    if (!unitTarget || !unitTarget->isAlive())
                        return;

                    // Onyxia Scale Cloak
                    if (unitTarget->GetDummyAura(22683))
                        return;

                    // Shadow Flame
                    m_caster->CastSpell(unitTarget, 22682, true);
                    return;
                }
                case 24194:                                 // Uther's Tribute
                case 24195:                                 // Grom's Tribute
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint8 race = m_caster->getRace();
                    uint32 spellId = 0;

                    switch (m_spellInfo->Id)
                    {
                        case 24194:
                            switch (race)
                            {
                                case RACE_HUMAN:
                                    spellId = 24105;
                                    break;
                                case RACE_DWARF:
                                    spellId = 24107;
                                    break;
                                case RACE_NIGHTELF:
                                    spellId = 24108;
                                    break;
                                case RACE_GNOME:
                                    spellId = 24106;
                                    break;
                            }
                            break;
                        case 24195:
                            switch (race)
                            {
                                case RACE_ORC:
                                    spellId = 24104;
                                    break;
                                case RACE_UNDEAD:
                                    spellId = 24103;
                                    break;
                                case RACE_TAUREN:
                                    spellId = 24102;
                                    break;
                                case RACE_TROLL:
                                    spellId = 24101;
                                    break;
                            }
                            break;
                    }

                    if (spellId)
                        m_caster->CastSpell(m_caster, spellId, true);

                    return;
                }
                case 24320:                                 // Poisonous Blood
                {
                    unitTarget->CastSpell(unitTarget, 24321, true, nullptr, nullptr, m_caster->GetObjectGuid());
                    return;
                }
                case 24324: // Nostalrius : Ivina (Hakkar)
                {
                    enum
                    {
                        SPELL_BLOODSIPHON_STUN       = 24324,
                        SPELL_BLOODSIPHON_DAMAGE     = 24323,
                        SPELL_BLOODSIPHON_HEAL       = 24322,
                        SPELL_POISONOUS_BLOOD        = 24321
                    };
                    if (!unitTarget || !unitTarget->isAlive())
                        return;

                    if (unitTarget->HasAura(SPELL_POISONOUS_BLOOD))
                        unitTarget->CastSpell(m_caster, SPELL_BLOODSIPHON_DAMAGE, true);
                    else
                        unitTarget->CastSpell(m_caster, SPELL_BLOODSIPHON_HEAL, true);
                    return;
                }
                case 24590:                                 // Brittle Armor - need remove one 24575 Brittle Armor aura
                    unitTarget->RemoveAuraHolderFromStack(24575);
                    return;
                case 24714:                                 // Trick
                {
                    if (m_caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    if (roll_chance_i(14))                  // Trick (can be different critter models). 14% since below can have 1 of 6
                        m_caster->CastSpell(m_caster, 24753, true);
                    else                                    // Random Costume, 6 different (plus add. for gender)
                        m_caster->CastSpell(m_caster, 24720, true);

                    return;
                }
                case 24717:                                 // Pirate Costume
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // Pirate Costume (male or female)
                    m_caster->CastSpell(unitTarget, unitTarget->getGender() == GENDER_MALE ? 24708 : 24709, true);
                    return;
                }
                case 24718:                                 // Ninja Costume
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // Ninja Costume (male or female)
                    m_caster->CastSpell(unitTarget, unitTarget->getGender() == GENDER_MALE ? 24711 : 24710, true);
                    return;
                }
                case 24719:                                 // Leper Gnome Costume
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // Leper Gnome Costume (male or female)
                    m_caster->CastSpell(unitTarget, unitTarget->getGender() == GENDER_MALE ? 24712 : 24713, true);
                    return;
                }
                case 24720:                                 // Random Costume
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spellId = 0;

                    switch (urand(0, 6))
                    {
                        case 0:
                            spellId = unitTarget->getGender() == GENDER_MALE ? 24708 : 24709;
                            break;
                        case 1:
                            spellId = unitTarget->getGender() == GENDER_MALE ? 24711 : 24710;
                            break;
                        case 2:
                            spellId = unitTarget->getGender() == GENDER_MALE ? 24712 : 24713;
                            break;
                        case 3:
                            spellId = 24723;
                            break;
                        case 4:
                            spellId = 24732;
                            break;
                        case 5:
                            spellId = unitTarget->getGender() == GENDER_MALE ? 24735 : 24736;
                            break;
                        case 6:
                            spellId = 24740;
                            break;
                    }

                    m_caster->CastSpell(unitTarget, spellId, true);
                    return;
                }
                case 24737:                                 // Ghost Costume
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // Ghost Costume (male or female)
                    m_caster->CastSpell(unitTarget, unitTarget->getGender() == GENDER_MALE ? 24735 : 24736, true);
                    return;
                }
                case 24751:                                 // Trick or Treat
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    // Tricked or Treated
                    unitTarget->CastSpell(unitTarget, 24755, true);

                    // Treat / Trick
                    unitTarget->CastSpell(unitTarget, roll_chance_i(50) ? 24714 : 24715, true);
                    return;
                }
                case 26004:                                 // Mistletoe
                {
                    if (!unitTarget)
                        return;

                    unitTarget->HandleEmote(EMOTE_ONESHOT_CHEER);
                    return;
                }
                case 26137:                                 // Rotate Trigger
                {
                    if (!unitTarget)
                        return;

                    unitTarget->CastSpell(unitTarget, urand(0, 1) ? 26009 : 26136, true);
                    return;
                }
                case 26218:                                 // Mistletoe
                {
                    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    uint32 spells[3] = {26206, 26207, 45036};

                    m_caster->CastSpell(unitTarget, spells[urand(0, 2)], true);
                    return;
                }
                case 26275:                                 // PX-238 Winter Wondervolt TRAP
                {
                    uint32 spells[4] = {26272, 26157, 26273, 26274};

                    // check presence
                    for (int j = 0; j < 4; ++j)
                        if (unitTarget->HasAura(spells[j], EFFECT_INDEX_0))
                            return;

                    unitTarget->CastSpell(unitTarget, spells[urand(0, 3)], true);
                    return;
                }
                case 26465:                                 // Mercurial Shield - need remove one 26464 Mercurial Shield aura
                    unitTarget->RemoveAuraHolderFromStack(26464);
                    return;
                case 26656:                                 // Summon Black Qiraji Battle Tank
                {
                    if (!unitTarget)
                        return;

                    // Prevent stacking of mounts
                    unitTarget->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

                    // Two separate mounts depending on area id (allows use both in and out of specific instance)
                    if (unitTarget->GetAreaId() == 3428)
                        unitTarget->CastSpell(unitTarget, 25863, true, m_CastItem);
                    else
                        unitTarget->CastSpell(unitTarget, 26655, true, m_CastItem);

                    return;
                }
                case 27687:                                 // Summon Bone Minions
                {
                    if (!unitTarget)
                        return;

                    unitTarget->CastSpell(unitTarget, 27690, true);
                    unitTarget->CastSpell(unitTarget, 27691, true);
                    unitTarget->CastSpell(unitTarget, 27692, true);
                    unitTarget->CastSpell(unitTarget, 27693, true);
                    return;
                }
                case 27695:                                 // Summon Bone Mages
                {
                    if (!unitTarget)
                        return;

                    unitTarget->CastSpell(unitTarget, 27696, true);
                    unitTarget->CastSpell(unitTarget, 27697, true);
                    unitTarget->CastSpell(unitTarget, 27698, true);
                    unitTarget->CastSpell(unitTarget, 27699, true);
                    return;
                }
                case 28374:                                 // Decimate (Naxxramas: Gluth)
                {
                    if (!unitTarget)
                        return;

                    int32 damage = unitTarget->GetHealth() - unitTarget->GetMaxHealth() * 0.05f;
                    if (damage > 0)
                        m_caster->CastCustomSpell(unitTarget, 28375, &damage, nullptr, nullptr, true);
                    return;
                }
                case 28560:                                 // Summon Blizzard
                {
                    if (!unitTarget)
                        return;

                    unitTarget->CastSpell(unitTarget, 28561, true, nullptr, nullptr, m_caster->GetObjectGuid());
                    return;
                }
                case 30918:                                 // Improved Sprint
                {
                    if (!unitTarget)
                        return;

                    // Removes snares and roots.
                    unitTarget->RemoveAurasAtMechanicImmunity(IMMUNE_TO_ROOT_AND_SNARE_MASK, 30918, true);
                    break;
                }
                case 29182:                                 // Teleport to Twin Emperors
                {
                    if (unitTarget && unitTarget->IsPlayer())
                        unitTarget->CastSpell(unitTarget, 29181, true);
                    return;
                }
                case 29188:                                 // Teleport to Final Chamber
                {
                    if (unitTarget && unitTarget->IsPlayer())
                        unitTarget->CastSpell(unitTarget, 29190, true);
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            switch (m_spellInfo->Id)
            {
                case  6201:                                 // Healthstone creating spells
                case  6202:
                case  5699:
                case 11729:
                case 11730:
                case 27230:
                {
                    if (!unitTarget)
                        return;

                    uint32 itemtype;
                    uint32 rank = 0;
                    Unit::AuraList const& mDummyAuras = unitTarget->GetAurasByType(SPELL_AURA_DUMMY);
                    for (Unit::AuraList::const_iterator i = mDummyAuras.begin(); i != mDummyAuras.end(); ++i)
                    {
                        if ((*i)->GetId() == 18692)
                        {
                            rank = 1;
                            break;
                        }
                        else if ((*i)->GetId() == 18693)
                        {
                            rank = 2;
                            break;
                        }
                    }

                    static uint32 const itypes[6][3] =
                    {
                        { 5512, 19004, 19005},              // Minor Healthstone
                        { 5511, 19006, 19007},              // Lesser Healthstone
                        { 5509, 19008, 19009},              // Healthstone
                        { 5510, 19010, 19011},              // Greater Healthstone
                        { 9421, 19012, 19013},              // Major Healthstone
                        {22103, 22104, 22105}               // Master Healthstone
                    };

                    switch (m_spellInfo->Id)
                    {
                        case  6201:
                            itemtype = itypes[0][rank];
                            break; // Minor Healthstone
                        case  6202:
                            itemtype = itypes[1][rank];
                            break; // Lesser Healthstone
                        case  5699:
                            itemtype = itypes[2][rank];
                            break; // Healthstone
                        case 11729:
                            itemtype = itypes[3][rank];
                            break; // Greater Healthstone
                        case 11730:
                            itemtype = itypes[4][rank];
                            break; // Major Healthstone
                        case 27230:
                            itemtype = itypes[5][rank];
                            break; // Master Healthstone
                        default:
                            return;
                    }
                    DoCreateItem(eff_idx, itemtype);
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            // Flash of Light
            if (m_spellInfo->SpellIconID  == 242)
            {
                if (!unitTarget || !unitTarget->isAlive())
                    return;
                int32 heal = damage;

                int32 spellid = m_spellInfo->Id;            // send main spell id as basepoints for not used effect
                m_caster->CastCustomSpell(unitTarget, 19993, &heal, &spellid, nullptr, true);
            }
            else if (m_spellInfo->IsFitToFamilyMask<CF_PALADIN_JUDGEMENT>())
            {
                if (!unitTarget || !unitTarget->isAlive())
                    return;
                uint32 spellId2 = 0;

                // all seals have aura dummy
                Unit::AuraList const& m_dummyAuras = m_caster->GetAurasByType(SPELL_AURA_DUMMY);
                for (Unit::AuraList::const_iterator itr = m_dummyAuras.begin(); itr != m_dummyAuras.end(); ++itr)
                {
                    SpellEntry const *spellInfo = (*itr)->GetSpellProto();

                    // search seal (all seals have judgement's aura dummy spell id in 2 effect
                    if (!spellInfo || !IsSealSpell((*itr)->GetSpellProto()) || (*itr)->GetEffIndex() != 2)
                        continue;

                    // must be calculated base at raw base points in spell proto, GetModifier()->m_value for S.Righteousness modified by SPELLMOD_DAMAGE
                    spellId2 = (*itr)->GetSpellProto()->CalculateSimpleValue(EFFECT_INDEX_2);

                    if (spellId2 <= 1)
                        continue;

                    // found, remove seal
                    m_caster->RemoveAurasDueToSpell((*itr)->GetId());
                    break;
                }

                m_caster->CastSpell(unitTarget, spellId2, true);
                return;
            }
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            switch(m_spellInfo->Id)
            {
                case  20865:    // Rockbiter Weapon Proc
                case  20866:
                case  20867:
                case  20868:
                case  20870:
                case  20871:
                {
                    if (!unitTarget || !unitTarget->CanHaveThreatList())
                        return;

                    if (unitTarget->getThreatManager().getThreat(m_caster))
                        unitTarget->getThreatManager().addThreat(m_caster, damage * m_caster->GetAttackTime(BASE_ATTACK) / 1000);
                }
            }
            break;
        }
    }

    // normal DB scripted effect
    if (!unitTarget)
        return;

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "Spell ScriptStart spellid %u in EffectScriptEffect ", m_spellInfo->Id);
    m_caster->GetMap()->ScriptsStart(sSpellScripts, m_spellInfo->Id, m_caster, unitTarget);
}

void Spell::EffectSanctuary(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    unitTarget->InterruptSpellsCastedOnMe(true);   
    unitTarget->CombatStop();
    unitTarget->getHostileRefManager().deleteReferences();  // stop all fighting

    // Vanish allows to remove all threat and cast regular stealth so other spells can be used
    if (m_spellInfo->IsFitToFamily<SPELLFAMILY_ROGUE, CF_ROGUE_VANISH>())
    {
        m_caster->RemoveSpellsCausingAura(SPELL_AURA_MOD_ROOT);
        unitTarget->InterruptAttacksOnMe();
        
        if (auto pPlayer = m_caster->ToPlayer())
        {
            pPlayer->SetCannotBeDetectedTimer(1000);
        }
    }

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectAddComboPoints(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget)
        return;

    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    if (damage <= 0)
        return;

    ((Player*)m_caster)->AddComboPoints(unitTarget, damage);
    ((Player*)m_caster)->SetUInt64Value(PLAYER_FIELD_COMBO_TARGET, unitTarget->GetGUID());
}

void Spell::EffectDuel(SpellEffectIndex eff_idx)
{
    if (!m_caster || !unitTarget || m_caster->GetTypeId() != TYPEID_PLAYER || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *caster = (Player*)m_caster;
    Player *target = (Player*)unitTarget;

    // if the caster is already in a duel or has issued a challenge
    if (caster->duel && caster->duel->opponent != target)
    {
        if (caster->duel->startTime)
            caster->DuelComplete(DUEL_WON);
        else
            caster->DuelComplete(DUEL_INTERUPTED);

       delete caster->duel;
       delete target->duel;
       caster->duel = target->duel = nullptr;
    }

    // if the caster attempts to duel somebody they're already in a duel with
    if (caster->duel && caster->duel->opponent == target && caster->duel->startTime)
    {
        SendCastResult(SPELL_FAILED_TARGET_ENEMY);
        return;
    }

    // if the target already has a pending duel/is dueling, reject the request
    if (target->duel)
    {
        SendCastResult(SPELL_FAILED_TARGET_DUELING);
        return;
    }

    // caster or target already have requested duel
    if (caster->duel || !target->GetSocial() || target->GetSocial()->HasIgnore(caster->GetObjectGuid()) || target->FindMap() != caster->FindMap())
        return;

    // Players can only fight a duel with each other outside (=not inside dungeons and not in capital cities)
    const auto *casterAreaEntry = AreaEntry::GetById(caster->GetAreaId());
    if (casterAreaEntry && !(casterAreaEntry->Flags & AREA_FLAG_DUEL))
    {
        SendCastResult(SPELL_FAILED_NO_DUELING);            // Dueling isn't allowed here
        return;
    }

    const auto *targetAreaEntry = AreaEntry::GetById(target->GetAreaId());
    if (targetAreaEntry && !(targetAreaEntry->Flags & AREA_FLAG_DUEL))
    {
        SendCastResult(SPELL_FAILED_NO_DUELING);            // Dueling isn't allowed here
        return;
    }

    //CREATE DUEL FLAG OBJECT
    GameObject* pGameObj = new GameObject;

    uint32 gameobject_id = m_spellInfo->EffectMiscValue[eff_idx];

    Map *map = m_caster->GetMap();
    float x = (m_caster->GetPositionX() + unitTarget->GetPositionX()) * 0.5f;
    float y = (m_caster->GetPositionY() + unitTarget->GetPositionY()) * 0.5f;
    float z = m_caster->GetPositionZ();

    if (!pGameObj->Create(map->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), gameobject_id, map, x, y, z,
                          m_caster->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, GO_ANIMPROGRESS_DEFAULT, GO_STATE_READY))
    {
        delete pGameObj;
        return;
    }

    pGameObj->SetUInt32Value(GAMEOBJECT_FACTION, m_caster->getFaction());
    pGameObj->SetUInt32Value(GAMEOBJECT_LEVEL, m_caster->getLevel() + 1);
    int32 duration = GetSpellDuration(m_spellInfo);
    pGameObj->SetRespawnTime(duration > 0 ? duration / IN_MILLISECONDS : 0);
    pGameObj->SetSpellId(m_spellInfo->Id);

    m_caster->AddGameObject(pGameObj);
    map->Add(pGameObj);
    //END

    // Send request
    WorldPacket data(SMSG_DUEL_REQUESTED, 8 + 8);
    data << pGameObj->GetObjectGuid();
    data << caster->GetObjectGuid();
    caster->GetSession()->SendPacket(&data);
    target->GetSession()->SendPacket(&data);

    // create duel-info
    DuelInfo *duel   = new DuelInfo;
    duel->initiator  = caster;
    duel->opponent   = target;
    duel->startTime  = 0;
    duel->startTimer = 0;

    DuelInfo *duel2   = new DuelInfo;
    duel2->initiator  = caster;
    duel2->opponent   = caster;
    duel2->startTime  = 0;
    duel2->startTimer = 0;

    if (Transport* t = caster->GetTransport())
    {
        duel->transportGuid  = t->GetGUIDLow();
        duel2->transportGuid = t->GetGUIDLow();
    }
    caster->duel     = duel;
    target->duel      = duel2;

    caster->SetGuidValue(PLAYER_DUEL_ARBITER, pGameObj->GetObjectGuid());
    target->SetGuidValue(PLAYER_DUEL_ARBITER, pGameObj->GetObjectGuid());
}

void Spell::EffectStuck(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    if (!sWorld.getConfig(CONFIG_BOOL_CAST_UNSTUCK))
        return;

    Player* pTarget = (Player*)unitTarget;

    DEBUG_LOG("Spell Effect: Stuck");
    sLog.outInfo("Player %s (guid %u) used auto-unstuck feature at map %u (%f, %f, %f).", pTarget->GetName(), pTarget->GetGUIDLow(), m_caster->GetMapId(), m_caster->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());

    if (pTarget->IsTaxiFlying())
        return;

    // TP to last overmap position
    if (fabs(pTarget->_lastSafeX) > 0.1f && fabs(pTarget->_lastSafeY) > 0.1f)
        pTarget->TeleportTo(pTarget->GetMapId(), pTarget->_lastSafeX, pTarget->_lastSafeY, pTarget->_lastSafeZ - 2.0f + 0.7f, 0.0f);
}

void Spell::EffectSummonPlayer(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    // Evil Twin (ignore player summon, but hide this for summoner)
    if (unitTarget->GetDummyAura(23445))
        return;

    float x, y, z;
    WorldObject* landingObject = m_caster;
    // summon to the ritual go location if any
    if (GameObject* pGo = m_targets.getGOTarget())
        if (pGo->GetGoType() == GAMEOBJECT_TYPE_SUMMONING_RITUAL)
            landingObject = pGo;

    landingObject->GetClosePoint(x, y, z, unitTarget->GetObjectBoundingRadius());

    ((Player*)unitTarget)->SetSummonPoint(m_caster->GetMapId(), x, y, z);

    WorldPacket data(SMSG_SUMMON_REQUEST, 8 + 4 + 4);
    data << m_caster->GetObjectGuid();                      // summoner guid
    data << uint32(m_caster->GetZoneId());                  // summoner zone
    data << uint32(MAX_PLAYER_SUMMON_DELAY * IN_MILLISECONDS); // auto decline after msecs
    ((Player*)unitTarget)->GetSession()->SendPacket(&data);
}

static ScriptInfo generateActivateCommand()
{
    ScriptInfo si;
    si.command = SCRIPT_COMMAND_ACTIVATE_OBJECT;
    return si;
}

void Spell::EffectActivateObject(SpellEffectIndex eff_idx)
{
    if (!gameObjTarget)
        return;

    static ScriptInfo activateCommand = generateActivateCommand();

    int32 delay_secs = m_spellInfo->CalculateSimpleValue(eff_idx);

    gameObjTarget->GetMap()->ScriptCommandStart(activateCommand, delay_secs, m_caster, gameObjTarget);
}

void Spell::EffectSummonTotem(SpellEffectIndex eff_idx)
{
    int slot = 0;
    switch (m_spellInfo->Effect[eff_idx])
    {
        case SPELL_EFFECT_SUMMON_TOTEM:
            slot = TOTEM_SLOT_NONE;
            break;
        case SPELL_EFFECT_SUMMON_TOTEM_SLOT1:
            slot = TOTEM_SLOT_FIRE;
            break;
        case SPELL_EFFECT_SUMMON_TOTEM_SLOT2:
            slot = TOTEM_SLOT_EARTH;
            break;
        case SPELL_EFFECT_SUMMON_TOTEM_SLOT3:
            slot = TOTEM_SLOT_WATER;
            break;
        case SPELL_EFFECT_SUMMON_TOTEM_SLOT4:
            slot = TOTEM_SLOT_AIR;
            break;
        default:
            return;
    }

    // unsummon old totem
    if (slot < MAX_TOTEM_SLOT)
        if (Totem *OldTotem = m_caster->GetTotem(TotemSlot(slot)))
            OldTotem->UnSummon();

    // FIXME: Setup near to finish point because GetObjectBoundingRadius set in Create but some Create calls can be dependent from proper position
    // if totem have creature_template_addon.auras with persistent point for example or script call
    float angle = slot < MAX_TOTEM_SLOT ? M_PI_F / MAX_TOTEM_SLOT - (slot * 2 * M_PI_F / MAX_TOTEM_SLOT) : 0;

    CreatureCreatePos pos(m_caster, m_caster->GetOrientation(), 2.0f, angle);

    CreatureInfo const *cinfo = ObjectMgr::GetCreatureTemplate(m_spellInfo->EffectMiscValue[eff_idx]);
    if (!cinfo)
    {
        sLog.outErrorDb("Creature entry %u does not exist but used in spell %u totem summon.", m_spellInfo->Id, m_spellInfo->EffectMiscValue[eff_idx]);
        return;
    }

    Totem* pTotem = new Totem;

    if (!pTotem->Create(m_caster->GetMap()->GenerateLocalLowGuid(HIGHGUID_UNIT), pos, cinfo, m_caster))
    {
        delete pTotem;
        return;
    }

    pTotem->SetSummonPoint(pos);

    if (slot < MAX_TOTEM_SLOT)
        m_caster->_AddTotem(TotemSlot(slot), pTotem);

    //pTotem->SetName("");                                  // generated by client
    pTotem->SetOwner(m_caster);
    pTotem->SetTypeBySummonSpell(m_spellInfo);              // must be after Create call where m_spells initialized

    pTotem->SetDuration(m_duration);

    if (damage)                                             // if not spell info, DB values used
    {
        pTotem->SetMaxHealth(damage);
        pTotem->SetHealth(damage);
    }

    pTotem->SetUInt32Value(UNIT_CREATED_BY_SPELL, m_spellInfo->Id);

    if (m_caster->GetTypeId() == TYPEID_PLAYER)
        pTotem->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);

    if (m_caster->IsPvP())
        pTotem->SetPvP(true);

    pTotem->Summon(m_caster);
}

void Spell::EffectEnchantHeldItem(SpellEffectIndex eff_idx)
{
    // this is only item spell effect applied to main-hand weapon of target player (players in area)
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    Player* item_owner = (Player*)unitTarget;
    Item* item = item_owner->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);

    if (!item)
        return;

    // must be equipped
    if (!item ->IsEquipped())
        return;

    // Nostalrius (INTERFACTION) : Totem furie-des-vents ecrase les benes de puissance et des rois Paladin.
    if (m_spellInfo->SpellFamilyName == SPELLFAMILY_SHAMAN)
    {
        Unit::AuraList const& auras = unitTarget->GetAurasByType(SPELL_AURA_MOD_ATTACK_POWER);
        for (Unit::AuraList::const_iterator i = auras.begin(); i != auras.end(); ++i)
        {
            if ((*i)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_PALADIN &&
                    // Bene de puissance inf et sup
                    ((*i)->GetSpellProto()->SpellIconID == 298 || (*i)->GetSpellProto()->SpellIconID == 1802))
            {
                unitTarget->RemoveAurasDueToSpell((*i)->GetSpellProto()->Id);
                break; // Normalement on ne peut avoir qu'une seule bene de ce type.
            }
        }
        Unit::AuraList const& auras2 = unitTarget->GetAurasByType(SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE);
        for (Unit::AuraList::const_iterator i = auras2.begin(); i != auras2.end(); ++i)
        {
            if ((*i)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_PALADIN &&
                    // Bene des rois inf et sup
                    ((*i)->GetSpellProto()->Id == 20217 || (*i)->GetSpellProto()->Id == 25898))
            {
                unitTarget->RemoveAurasDueToSpell((*i)->GetSpellProto()->Id);
                break; // Normalement on ne peut avoir qu'une seule bene de ce type.
            }
        }
    }

    if (m_spellInfo->EffectMiscValue[eff_idx])
    {
        uint32 enchant_id = m_spellInfo->EffectMiscValue[eff_idx];
        int32 duration = GetSpellDuration(m_spellInfo);     // Try duration index first...
        if (!duration)
            duration = m_currentBasePoints[eff_idx];        //Base points after ..
        if (!duration)
            duration = 10;                                  // 10 seconds for enchants which don't have listed duration

        SpellItemEnchantmentEntry const *pEnchant = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
        if (!pEnchant)
            return;

        // Always go to temp enchantment slot
        EnchantmentSlot slot = TEMP_ENCHANTMENT_SLOT;

        // Enchantment will not be applied if a different one already exists
        if (item->GetEnchantmentId(slot) && item->GetEnchantmentId(slot) != enchant_id)
            return;

        // Apply the temporary enchantment
        item->SetEnchantment(slot, enchant_id, duration * IN_MILLISECONDS, 0);
        item_owner->ApplyEnchantment(item, slot, true);
    }
}

void Spell::EffectDisEnchant(SpellEffectIndex /*eff_idx*/)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    if (!itemTarget || !itemTarget->GetProto()->DisenchantID)
        return;

    Player* pCaster = static_cast<Player*>(m_caster);

    pCaster->UpdateCraftSkill(m_spellInfo->Id);
    pCaster->SendLoot(itemTarget->GetObjectGuid(), LOOT_DISENCHANTING);

    // quick solution to prevent exploiting; this will cause items loss on full bags though
    // in order to fix this correctly have to fix first plMover->SendLootRelease(lootGuid); @ MovementHandler
    // and in order to fix it the loot manager has to be rewritten; not me pls
    if (ObjectGuid lootGuid = pCaster->GetLootGuid())
        pCaster->GetSession()->DoLootRelease(lootGuid);

    // item will be removed at disenchanting end
}

void Spell::EffectInebriate(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *player = (Player*)unitTarget;
    uint16 currentDrunk = player->GetDrunkValue();
    uint16 drunkMod = damage * 256;
    if (currentDrunk + drunkMod > 0xFFFF)
        currentDrunk = 0xFFFF;
    else
        currentDrunk += drunkMod;
    player->SetDrunkValue(currentDrunk, m_CastItem ? m_CastItem->GetEntry() : 0);
}

void Spell::EffectFeedPet(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *_player = (Player*)m_caster;

    Item* foodItem = itemTarget;
    if (!foodItem)
        return;

    Pet *pet = _player->GetPet();
    if (!pet)
        return;

    if (!pet->isAlive())
        return;

    if (!pet->IsWithinLOSInMap(_player))
    {
        SendCastResult(SPELL_FAILED_LINE_OF_SIGHT);
        return;
    }

    int32 benefit = pet->GetCurrentFoodBenefitLevel(foodItem->GetProto()->ItemLevel);
    if (benefit <= 0)
        return;

    ExecuteLogInfo info;
    info.feedPet.itemEntry = foodItem->GetProto()->ItemId;

    uint32 count = 1;
    _player->DestroyItemCount(foodItem, count, true);
    m_caster->CastCustomSpell(m_caster, m_spellInfo->EffectTriggerSpell[eff_idx], &benefit, nullptr, nullptr, true);

    AddExecuteLogInfo(eff_idx, info);
}

void Spell::EffectDismissPet(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Pet* pet = m_caster->GetPet();

    // not let dismiss dead pet
    if (!pet || !pet->isAlive())
        return;

    pet->Unsummon(PET_SAVE_NOT_IN_SLOT, m_caster);

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(pet->GetObjectGuid()));
}

void Spell::EffectSummonObject(SpellEffectIndex eff_idx)
{
    uint32 go_id = m_spellInfo->EffectMiscValue[eff_idx];

    uint8 slot = 0;
    switch (m_spellInfo->Effect[eff_idx])
    {
        case SPELL_EFFECT_SUMMON_OBJECT_SLOT1:
            slot = 0;
            break;
        case SPELL_EFFECT_SUMMON_OBJECT_SLOT2:
            slot = 1;
            break;
        case SPELL_EFFECT_SUMMON_OBJECT_SLOT3:
            slot = 2;
            break;
        case SPELL_EFFECT_SUMMON_OBJECT_SLOT4:
            slot = 3;
            break;
        default:
            return;
    }

    if (ObjectGuid guid = m_caster->m_ObjectSlotGuid[slot])
    {
        if (GameObject* obj = m_caster ? m_caster->GetMap()->GetGameObject(guid) : NULL)
            obj->SetLootState(GO_JUST_DEACTIVATED);
        m_caster->m_ObjectSlotGuid[slot].Clear();
    }

    GameObject* pGameObj = new GameObject;

    float x, y, z;
    // If dest location if present
    if (m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION)
    {
        x = m_targets.m_destX;
        y = m_targets.m_destY;
        z = m_targets.m_destZ;
    }
    // Summon in random point all other units if location present
    else
        m_caster->GetClosePoint(x, y, z, DEFAULT_WORLD_OBJECT_SIZE);

    Map *map = m_caster->GetMap();
    if (!pGameObj->Create(map->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), go_id, map,
                          x, y, z, m_caster->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, GO_ANIMPROGRESS_DEFAULT, GO_STATE_READY))
    {
        delete pGameObj;
        return;
    }

    pGameObj->SetUInt32Value(GAMEOBJECT_LEVEL, m_caster->getLevel());
    int32 duration = GetSpellDuration(m_spellInfo);
    pGameObj->SetRespawnTime(duration > 0 ? duration / IN_MILLISECONDS : 0);
    pGameObj->SetSpellId(m_spellInfo->Id);
    m_caster->AddGameObject(pGameObj);

    map->Add(pGameObj);
    WorldPacket data(SMSG_GAMEOBJECT_SPAWN_ANIM_OBSOLETE, 8);
    data << ObjectGuid(pGameObj->GetObjectGuid());
    m_caster->SendMessageToSet(&data, true);

    m_caster->m_ObjectSlotGuid[slot] = pGameObj->GetObjectGuid();

    pGameObj->SummonLinkedTrapIfAny();

    if (m_caster->GetTypeId() == TYPEID_UNIT && ((Creature*)m_caster)->AI())
        ((Creature*)m_caster)->AI()->JustSummoned(pGameObj);
}

void Spell::EffectResurrect(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;
    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    if (unitTarget->isAlive())
        return;
    if (!unitTarget->IsInWorld())
        return;

    switch (m_spellInfo->Id)
    {
        // Defibrillate (Goblin Jumper Cables) have 33% chance on success
        case 8342:
            if (roll_chance_i(67))
            {
                m_caster->CastSpell(m_caster, 8338, true, m_CastItem);
                return;
            }
            break;
        // Defibrillate (Goblin Jumper Cables XL) have 50% chance on success
        case 22999:
            if (roll_chance_i(50))
            {
                m_caster->CastSpell(m_caster, 23055, true, m_CastItem);
                return;
            }
            break;
        default:
            break;
    }

    Player* pTarget = ((Player*)unitTarget);

    if (pTarget->isRessurectRequested())      // already have one active request
        return;

    uint32 health = pTarget->GetMaxHealth() * damage / 100;
    uint32 mana   = pTarget->GetMaxPower(POWER_MANA) * damage / 100;

    pTarget->setResurrectRequestData(m_caster->GetObjectGuid(), m_caster->GetMapId(), m_caster->GetPositionX(), m_caster->GetPositionY(), m_caster->GetPositionZ(), health, mana);
    SendResurrectRequest(pTarget);

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectAddExtraAttacks(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    if (!unitTarget->isAlive()|| unitTarget->IsExtraAttacksLocked())
        return;

    if (m_spellInfo->Id == 20178) // Reckoning
    {
        if (unitTarget->GetExtraAttacks() < 4)
            unitTarget->AddExtraAttack();
        return;
    }

    if (unitTarget->GetExtraAttacks())
        return;

    unitTarget->AddExtraAttackOnUpdate();
    unitTarget->SetExtraAttaks(damage);

    ExecuteLogInfo info(unitTarget->GetObjectGuid());
    info.extraAttacks.count = damage;
    AddExecuteLogInfo(eff_idx, info);
}

void Spell::EffectParry(SpellEffectIndex /*eff_idx*/)
{
    if (unitTarget && unitTarget->GetTypeId() == TYPEID_PLAYER)
        ((Player*)unitTarget)->SetCanParry(true);
}

void Spell::EffectBlock(SpellEffectIndex /*eff_idx*/)
{
    if (unitTarget && unitTarget->GetTypeId() == TYPEID_PLAYER)
        ((Player*)unitTarget)->SetCanBlock(true);
}

void Spell::EffectLeapForward(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    if (unitTarget->IsTaxiFlying())
        return;

    float x, y, z;
    m_targets.getDestination(x, y, z);

    unitTarget->NearTeleportTo(x, y, z, unitTarget->GetOrientation(), TELE_TO_NOT_LEAVE_TRANSPORT | TELE_TO_NOT_LEAVE_COMBAT | TELE_TO_NOT_UNSUMMON_PET | (unitTarget == m_caster ? TELE_TO_SPELL : 0));

}

void Spell::EffectReputation(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *_player = (Player*)unitTarget;

    int32  rep_change = m_currentBasePoints[eff_idx];
    uint32 faction_id = m_spellInfo->EffectMiscValue[eff_idx];

    FactionEntry const* factionEntry = sFactionStore.LookupEntry(faction_id);

    if (!factionEntry)
        return;

    rep_change = _player->CalculateReputationGain(REPUTATION_SOURCE_SPELL, rep_change, faction_id);

    _player->GetReputationMgr().ModifyReputation(factionEntry, rep_change);
}

void Spell::EffectQuestComplete(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    uint32 quest_id = m_spellInfo->EffectMiscValue[eff_idx];
    ((Player*)unitTarget)->AreaExploredOrEventHappens(quest_id);
}

void Spell::EffectSelfResurrect(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->isAlive())
        return;
    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;
    if (!unitTarget->IsInWorld())
        return;

    uint32 health = 0;
    uint32 mana = 0;

    // flat case
    if (damage < 0)
    {
        health = uint32(-damage);
        mana = m_spellInfo->EffectMiscValue[eff_idx];
    }
    // percent case
    else
    {
        health = uint32(damage / 100.0f * unitTarget->GetMaxHealth());
        if (unitTarget->GetMaxPower(POWER_MANA) > 0)
            mana = uint32(damage / 100.0f * unitTarget->GetMaxPower(POWER_MANA));
    }

    Player *plr = ((Player*)unitTarget);
    plr->ResurrectPlayer(0.0f);

    plr->SetHealth(health);
    plr->SetPower(POWER_MANA, mana);
    plr->SetPower(POWER_RAGE, 0);
    plr->SetPower(POWER_ENERGY, plr->GetMaxPower(POWER_ENERGY));

    plr->SpawnCorpseBones();
}

void Spell::EffectSkinning(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget->IsInWorld() || unitTarget->GetTypeId() != TYPEID_UNIT)
        return;
    if (!m_caster || m_caster->GetTypeId() != TYPEID_PLAYER || !m_caster->IsInWorld())
        return;

    Creature* creature = (Creature*) unitTarget;
    int32 targetLevel = creature->getLevel();

    uint32 skill = creature->GetCreatureInfo()->GetRequiredLootSkill();

    ((Player*)m_caster)->SendLoot(creature->GetObjectGuid(), LOOT_SKINNING);
    creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);

    int32 reqValue = targetLevel < 10 ? 0 : targetLevel < 20 ? (targetLevel - 10) * 10 : targetLevel * 5;

    int32 skillValue = ((Player*)m_caster)->GetPureSkillValue(skill);

    // Double chances for elites
    ((Player*)m_caster)->UpdateGatherSkill(skill, skillValue, reqValue, creature->IsElite() ? 2 : 1);
}

void Spell::EffectCharge(SpellEffectIndex /*eff_idx*/)
{
    if (!unitTarget)
        return;

    // cf Spell::OnSpellLaunch
}

void Spell::EffectSummonCritter(SpellEffectIndex eff_idx)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;
    Player* player = (Player*)m_caster;

    uint32 pet_entry = m_spellInfo->EffectMiscValue[eff_idx];
    if (!pet_entry)
        return;

    CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(pet_entry);
    if (!cInfo)
    {
        sLog.outErrorDb("Spell::DoSummonCritter: creature entry %u not found for spell %u.", pet_entry, m_spellInfo->Id);
        return;
    }

    Pet* old_critter = player->GetMiniPet();

    // for same pet just despawn
    if (old_critter && old_critter->GetEntry() == pet_entry)
    {
        player->RemoveMiniPet();
        return;
    }

    // despawn old pet before summon new
    if (old_critter)
        player->RemoveMiniPet();

    CreatureCreatePos pos(m_caster->GetMap(), m_targets.m_destX, m_targets.m_destY, m_targets.m_destZ, m_caster->GetOrientation());
    if (!(m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION))
        pos = CreatureCreatePos(m_caster, m_caster->GetOrientation());

    // summon new pet
    Pet* critter = new Pet(MINI_PET);

    Map *map = m_caster->GetMap();
    uint32 pet_number = sObjectMgr.GeneratePetNumber();
    if (!critter->Create(map->GenerateLocalLowGuid(HIGHGUID_PET), pos, cInfo, pet_number))
    {
        sLog.outError("Spell::EffectSummonCritter, spellid %u: no such creature entry %u", m_spellInfo->Id, pet_entry);
        delete critter;
        return;
    }

    critter->SetSummonPoint(pos);

    //critter->SetName("");                                 // generated by client
    critter->SetOwnerGuid(m_caster->GetObjectGuid());
    critter->SetCreatorGuid(m_caster->GetObjectGuid());
    critter->setFaction(m_caster->getFaction());
    critter->SetUInt32Value(UNIT_CREATED_BY_SPELL, m_spellInfo->Id);

    critter->AIM_Initialize();
    critter->InitPetCreateSpells();                         // e.g. disgusting oozeling has a create spell as critter...
    critter->SelectLevel(critter->GetCreatureInfo());       // some summoned creaters have different from 1 DB data for level/hp
    critter->SetUInt32Value(UNIT_NPC_FLAGS, critter->GetCreatureInfo()->npcflag);
    // some mini-pets have quests

    // set timer for unsummon
    int32 duration = GetSpellDuration(m_spellInfo);
    if (duration > 0)
        critter->SetDuration(duration);

    player->_SetMiniPet(critter);

    map->Add((Creature*)critter);

    // Notify Summoner
    if (m_caster->GetTypeId() == TYPEID_UNIT && ((Creature*)m_caster)->AI())
        ((Creature*)m_caster)->AI()->JustSummoned(critter);
}

void Spell::EffectKnockBack(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    // remove Dream Fog Sleep aura to let target be launched
    // ugly and barely working solution untill proper pending states handling implemented
    unitTarget->RemoveAurasDueToSpell(24778);

    unitTarget->KnockBackFrom(m_caster, float(m_spellInfo->EffectMiscValue[eff_idx]) / 10, float(damage) / 10);
}

void Spell::EffectSendTaxi(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)unitTarget)->ActivateTaxiPathTo(m_spellInfo->EffectMiscValue[eff_idx], m_spellInfo->Id, true);
}

void Spell::EffectPlayerPull(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    float dist = unitTarget->GetDistance2d(m_caster);
    if (damage && dist > damage)
        dist = float(damage);

    unitTarget->KnockBackFrom(m_caster, -dist, float(m_spellInfo->EffectMiscValue[eff_idx]) / 10);
}

void Spell::EffectDispelMechanic(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    uint32 mechanic = m_spellInfo->EffectMiscValue[eff_idx];

    Unit::SpellAuraHolderMap& Auras = unitTarget->GetSpellAuraHolderMap();
    for (Unit::SpellAuraHolderMap::iterator iter = Auras.begin(), next; iter != Auras.end(); iter = next)
    {
        next = iter;
        ++next;
        SpellEntry const *spell = iter->second->GetSpellProto();
        if (iter->second->HasMechanic(mechanic))
        {
            unitTarget->RemoveAurasDueToSpell(spell->Id);
            if (Auras.empty())
                break;
            else
                next = Auras.begin();
        }
    }

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectSummonDeadPet(SpellEffectIndex /*eff_idx*/)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;
    Player *_player = (Player*)m_caster;
    Pet *pet = _player->GetPet();
    if (!pet)
        return;
    if (pet->isAlive())
        return;
    if (damage < 0)
        return;

    // Chakor : Teleport the pet to the player's location
    pet->NearTeleportTo(_player->GetPositionX(), _player->GetPositionY(), _player->GetPositionZ(), _player->GetOrientation(), false);
    pet->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_NONE);
    pet->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);
    pet->SetDeathState(ALIVE);
    pet->clearUnitState(UNIT_STAT_ALL_DYN_STATES);
    pet->SetHealth(uint32(pet->GetMaxHealth() * (float(damage) / 100)));

    pet->AIM_Initialize();

    // _player->PetSpellInitialize(); -- action bar not removed at death and not required send at revive
    pet->SavePetToDB(PET_SAVE_AS_CURRENT);
}

void Spell::EffectDestroyAllTotems(SpellEffectIndex /*eff_idx*/)
{
    for (int slot = 0;  slot < MAX_TOTEM_SLOT; ++slot)
        if (Totem* totem = m_caster->GetTotem(TotemSlot(slot)))
            totem->UnSummon();
}

void Spell::EffectDurabilityDamage(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    int32 slot = m_spellInfo->EffectMiscValue[eff_idx];

    // FIXME: some spells effects have value -1/-2
    // Possibly its mean -1 all player equipped items and -2 all items
    if (slot < 0)
    {
        ((Player*)unitTarget)->DurabilityPointsLossAll(damage, (slot < -1));

        ExecuteLogInfo info(unitTarget->GetObjectGuid());
        info.durabilityDamage.itemEntry = -1;
        info.durabilityDamage.unk = -1;
        AddExecuteLogInfo(eff_idx, info);

        return;
    }

    // invalid slot value
    if (slot >= INVENTORY_SLOT_BAG_END)
        return;

    if (Item* item = ((Player*)unitTarget)->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
    {
        ((Player*)unitTarget)->DurabilityPointsLoss(item, damage);

        ExecuteLogInfo info(unitTarget->GetObjectGuid());
        info.durabilityDamage.itemEntry = item->GetProto()->ItemId;
        info.durabilityDamage.unk = -1;
        AddExecuteLogInfo(eff_idx, info);
    }
}

void Spell::EffectDurabilityDamagePCT(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    int32 slot = m_spellInfo->EffectMiscValue[eff_idx];

    // FIXME: some spells effects have value -1/-2
    // Possibly its mean -1 all player equipped items and -2 all items
    if (slot < 0)
    {
        ((Player*)unitTarget)->DurabilityLossAll(double(damage) / 100.0f, (slot < -1));
        return;
    }

    // invalid slot value
    if (slot >= INVENTORY_SLOT_BAG_END)
        return;

    if (damage <= 0)
        return;

    if (Item* item = ((Player*)unitTarget)->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
        ((Player*)unitTarget)->DurabilityLoss(item, double(damage) / 100.0f);
}

void Spell::EffectModifyThreatPercent(SpellEffectIndex eff_idx)
{
    if (!unitTarget)
        return;

    unitTarget->getThreatManager().modifyThreatPercent(m_caster, damage);

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(unitTarget->GetObjectGuid()));
}

void Spell::EffectTransmitted(SpellEffectIndex eff_idx)
{
    uint32 name_id = m_spellInfo->EffectMiscValue[eff_idx];

    GameObjectInfo const* goinfo = ObjectMgr::GetGameObjectInfo(name_id);

    if (!goinfo)
    {
        sLog.outErrorDb("Gameobject (Entry: %u) not exist and not created at spell (ID: %u) cast", name_id, m_spellInfo->Id);
        return;
    }

    float fx, fy, fz;
    if (m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION)
    {
        fx = m_targets.m_destX;
        fy = m_targets.m_destY;
        fz = m_targets.m_destZ;
    }
    //FIXME: this can be better check for most objects but still hack
    else if (m_spellInfo->EffectRadiusIndex[eff_idx] && m_spellInfo->speed == 0)
    {
        float dis = GetSpellRadius(sSpellRadiusStore.LookupEntry(m_spellInfo->EffectRadiusIndex[eff_idx]));
        float x, y, z;
        m_caster->GetPosition(x, y, z);
        fx = x + dis * cos(m_caster->GetOrientation());
        fy = y + dis * sin(m_caster->GetOrientation());
        fz = z;
        m_caster->GetMap()->GetLosHitPosition(x, y, z + 0.5f, fx, fy, fz, -1.5f);
    }
    else
    {
        float min_dis = GetSpellMinRange(sSpellRangeStore.LookupEntry(m_spellInfo->rangeIndex));
        float max_dis = GetSpellMaxRange(sSpellRangeStore.LookupEntry(m_spellInfo->rangeIndex));
        float dis = rand_norm_f() * (max_dis - min_dis) + min_dis;

        float x, y, z;
        m_caster->GetPosition(x, y, z);
        fx = x + dis * cos(m_caster->GetOrientation());
        fy = y + dis * sin(m_caster->GetOrientation());
        fz = z;
        m_caster->GetMap()->GetLosHitPosition(x, y, z + 0.5f, fx, fy, fz, -1.5f);
    }

    Map *cMap = m_caster->GetMap();

    if (goinfo->type == GAMEOBJECT_TYPE_FISHINGNODE)
    {
        float waterLevel = m_caster->GetTerrain()->GetWaterLevel(fx, fy, fz);
        if (waterLevel == VMAP_INVALID_HEIGHT_VALUE)             // Hack to prevent fishing bobber from failing to land on fishing hole
        {
            // but this is not proper, we really need to ignore not materialized objects
            SendCastResult(SPELL_FAILED_NOT_FISHABLE);
            SendChannelUpdate(0);
            return;
        }

        // replace by water level in this case
        //fz = cMap->GetWaterLevel(fx, fy);
        fz = waterLevel;
    }

    GameObject* pGameObj = new GameObject;

    if (!pGameObj->Create(cMap->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), name_id, cMap,
                          fx, fy, fz, m_caster->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, GO_ANIMPROGRESS_DEFAULT, GO_STATE_READY))
    {
        delete pGameObj;
        return;
    }

    int32 duration = GetSpellDuration(m_spellInfo);

    switch (goinfo->type)
    {
        case GAMEOBJECT_TYPE_FISHINGNODE:
        {
            m_caster->SetChannelObjectGuid(pGameObj->GetObjectGuid());
            m_caster->AddGameObject(pGameObj);              // will removed at spell cancel

            // end time of range when possible catch fish (FISHING_BOBBER_READY_TIME..GetDuration(m_spellInfo))
            // start time == fish-FISHING_BOBBER_READY_TIME (0..GetDuration(m_spellInfo)-FISHING_BOBBER_READY_TIME)
            int32 lastSec = 0;
            switch (urand(0, 3))
            {
                case 0:
                    lastSec =  3;
                    break;
                case 1:
                    lastSec =  7;
                    break;
                case 2:
                    lastSec = 13;
                    break;
                case 3:
                    lastSec = 17;
                    break;
            }

            duration = duration - lastSec * IN_MILLISECONDS + FISHING_BOBBER_READY_TIME * IN_MILLISECONDS;
            break;
        }
        case GAMEOBJECT_TYPE_SUMMONING_RITUAL:
        {
            if (m_caster->GetTypeId() == TYPEID_PLAYER)
            {
                // Set the summoning target
                if (m_caster->GetTypeId() == TYPEID_PLAYER && m_caster->ToPlayer()->GetSelectionGuid())
                    pGameObj->SetSummonTarget(m_caster->ToPlayer()->GetSelectionGuid());

                // will be removed at Spell::Cancel or GameObject::RemoveUniqueUse if activated
                m_caster->AddGameObject(pGameObj);

                // the caster becomes a go user too
                pGameObj->AddUniqueUse(m_caster->ToPlayer());
                m_targets.setGOTarget(pGameObj);
                SetChannelingVisual(true);
            }
            break;
        }
        case GAMEOBJECT_TYPE_FISHINGHOLE:
        case GAMEOBJECT_TYPE_CHEST:
        default:
            break;
    }

    pGameObj->SetRespawnTime(duration > 0 ? duration / IN_MILLISECONDS : 0);

    pGameObj->SetOwnerGuid(m_caster->GetObjectGuid());
    if (m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        if(Group * group = ((Player*)m_caster)->GetGroup())
            pGameObj->SetOwnerGroupId(group->GetId());
    }
    pGameObj->SetUInt32Value(GAMEOBJECT_LEVEL, m_caster->getLevel());
    pGameObj->SetSpellId(m_spellInfo->Id);

    DEBUG_LOG("AddObject at SpellEfects.cpp EffectTransmitted");
    //m_caster->AddGameObject(pGameObj);
    //m_ObjToDel.push_back(pGameObj);

    cMap->Add(pGameObj);

    pGameObj->SummonLinkedTrapIfAny();

    if (m_caster->GetTypeId() == TYPEID_UNIT && ((Creature*)m_caster)->AI())
        ((Creature*)m_caster)->AI()->JustSummoned(pGameObj);
}

void Spell::EffectSkill(SpellEffectIndex /*eff_idx*/)
{
    DEBUG_LOG("WORLD: SkillEFFECT");
}

void Spell::EffectSummonDemon(SpellEffectIndex eff_idx)
{
    float px = m_targets.m_destX;
    float py = m_targets.m_destY;
    float pz = m_targets.m_destZ;

    // summon to the ritual object location if any
    if (GameObject* pGo = m_targets.getGOTarget())
        if (pGo->GetGoType() == GAMEOBJECT_TYPE_SUMMONING_RITUAL)
            pGo->GetPosition(px, py, pz);

    Creature* Charmed = m_caster->SummonCreature(m_spellInfo->EffectMiscValue[eff_idx], px, py, pz, m_caster->GetOrientation(), TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN, 3600000);
    if (!Charmed)
        return;

    // might not always work correctly, maybe the creature that dies from CoD casts the effect on itself and is therefore the caster?
    Charmed->SetLevel(m_caster->getLevel());

    // TODO: Add damage/mana/hp according to level

    if (m_spellInfo->EffectMiscValue[eff_idx] == 89)        // Inferno summon
    {
        // Enslave demon effect, without mana cost and cooldown
        m_caster->CastSpell(Charmed, 20882, true);          // FIXME: enslave does not scale with level, level 62+ minions cannot be enslaved

        // Inferno effect
        Charmed->CastSpell(Charmed, 22703, true, nullptr);
    }
}

void Spell::EffectSpiritHeal(SpellEffectIndex /*eff_idx*/)
{
    // TODO player can't see the heal-animation - he should respawn some ticks later
    if (!unitTarget || unitTarget->isAlive())
        return;
    if (unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;
    if (!unitTarget->IsInWorld())
        return;
    if (!unitTarget->HasAura(2584))
        return;

    auto player = unitTarget->ToPlayer();

    if (!player)
        return;

    // no resurrection on a GY other than homie if BG is not in progress
    if (player->GetBattleGround()->GetStatus() != STATUS_IN_PROGRESS && !player->isGameMaster())
        player->RepopAtGraveyard();

    player->RemoveAurasDueToSpell(2584);
    player->ResurrectPlayer(1.0f);
    player->SpawnCorpseBones();
    player->AutoReSummonPet();
}

// remove insignia spell effect
void Spell::EffectSkinPlayerCorpse(SpellEffectIndex eff_idx)
{
    DEBUG_LOG("Effect: SkinPlayerCorpse");
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Unit *target = unitTarget;
    if (!target && corpseTarget)
        target = ObjectAccessor::FindPlayer(corpseTarget->GetOwnerGuid());
    if (!target)
    {
        ASSERT(corpseTarget);
        Corpse *bones = sObjectAccessor.ConvertCorpseForPlayer(corpseTarget->GetOwnerGuid(), true);
        m_caster->ToPlayer()->SendLoot((bones?bones:corpseTarget)->GetObjectGuid(), LOOT_INSIGNIA);
        DEBUG_LOG("Effect SkinPlayerCorpse: corpse owner was not found");
        return;
    }

    if (target->GetTypeId() != TYPEID_PLAYER || target->isAlive())
        return;

    ((Player*)target)->RemovedInsignia((Player*)m_caster, corpseTarget);

    AddExecuteLogInfo(eff_idx, ExecuteLogInfo(target->GetObjectGuid()));
}
void Spell::EffectBind(SpellEffectIndex eff_idx)
{
    if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    Player* player = (Player*)unitTarget;

    uint32 area_id;
    WorldLocation loc;
    player->GetPosition(loc);
    area_id = player->GetAreaId();

    player->SetHomebindToLocation(loc, area_id);

    // binding
    WorldPacket data(SMSG_BINDPOINTUPDATE, (4 + 4 + 4 + 4 + 4));
    data << float(loc.coord_x);
    data << float(loc.coord_y);
    data << float(loc.coord_z);
    data << uint32(loc.mapid);
    data << uint32(area_id);
    player->SendDirectMessage(&data);

    DEBUG_LOG("New Home Position X is %f", loc.coord_x);
    DEBUG_LOG("New Home Position Y is %f", loc.coord_y);
    DEBUG_LOG("New Home Position Z is %f", loc.coord_z);
    DEBUG_LOG("New Home MapId is %u", loc.mapid);
    DEBUG_LOG("New Home AreaId is %u", area_id);

    // zone update
    data.Initialize(SMSG_PLAYERBOUND, 8 + 4);
    data << player->GetObjectGuid();
    data << uint32(area_id);
    player->SendDirectMessage(&data);
}

void Spell::EffectDespawnObject(SpellEffectIndex eff_idx)
{
    DEBUG_LOG("SPELL_EFFECT_DESPAWN_OBJECT");
    if (!gameObjTarget)
        return;
    gameObjTarget->AddObjectToRemoveList();
}
void Spell::EffectNostalrius(SpellEffectIndex eff_idx)
{
    DEBUG_LOG("SPELL_EFFECT_NOSTALRIUS");
}
