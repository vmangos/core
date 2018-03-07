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

#include "SpellMgr.h"
#include "ObjectMgr.h"
#include "SpellAuraDefines.h"
#include "ProgressBar.h"
#include "DBCStores.h"
#include "World.h"
#include "Chat.h"
#include "Spell.h"
#include "BattleGroundMgr.h"
#include "MapManager.h"
#include "Unit.h"

SpellMgr::SpellMgr()
{
}

SpellMgr::~SpellMgr()
{
    for (SpellEntryMap::iterator it = mSpellEntryMap.begin(); it != mSpellEntryMap.end(); ++it)
        delete *it;
}

SpellMgr& SpellMgr::Instance()
{
    static SpellMgr spellMgr;
    return spellMgr;
}

int32 GetSpellDuration(SpellEntry const *spellInfo)
{
    if (!spellInfo)
        return 0;
    SpellDurationEntry const *du = sSpellDurationStore.LookupEntry(spellInfo->DurationIndex);
    if (!du)
        return 0;
    return (du->Duration[0] == -1) ? -1 : abs(du->Duration[0]);
}

int32 GetSpellMaxDuration(SpellEntry const *spellInfo)
{
    if (!spellInfo)
        return 0;
    SpellDurationEntry const *du = sSpellDurationStore.LookupEntry(spellInfo->DurationIndex);
    if (!du)
        return 0;
    return (du->Duration[2] == -1) ? -1 : abs(du->Duration[2]);
}

int32 CalculateSpellDuration(SpellEntry const *spellInfo, Unit const* caster)
{
    int32 duration = GetSpellDuration(spellInfo);

    if (duration != -1 && caster)
    {
        int32 maxduration = GetSpellMaxDuration(spellInfo);

        if (duration != maxduration && caster->GetTypeId() == TYPEID_PLAYER)
            duration += int32((maxduration - duration) * ((Player*)caster)->GetComboPoints() / 5);

        if (Player* modOwner = caster->GetSpellModOwner())
        {
            modOwner->ApplySpellMod(spellInfo->Id, SPELLMOD_DURATION, duration);

            if (duration < 0)
                duration = 0;
        }
    }

    return duration;
}

uint32 GetSpellCastTime(SpellEntry const* spellInfo, Spell* spell)
{
    if (spell)
    {
        // some triggered spells have data only usable for client
        if (spell->IsTriggeredSpellWithRedundentData())
            return 0;

        // spell targeted to non-trading trade slot item instant at trade success apply
        if (spell->GetCaster()->GetTypeId() == TYPEID_PLAYER)
            if (TradeData* my_trade = ((Player*)(spell->GetCaster()))->GetTradeData())
                if (Item* nonTrade = my_trade->GetTraderData()->GetItem(TRADE_SLOT_NONTRADED))
                    if (nonTrade == spell->m_targets.getItemTarget())
                        return 0;
    }

    SpellCastTimesEntry const *spellCastTimeEntry = sSpellCastTimesStore.LookupEntry(spellInfo->CastingTimeIndex);

    // not all spells have cast time index and this is all is pasiive abilities
    if (!spellCastTimeEntry)
        return 0;

    int32 castTime = spellCastTimeEntry->CastTime;

    if (spell)
    {
        // Nostalrius: ne pas consommer les SpellModifier si 'castTime' = 0 (Eclat lunaire / Grace de la nature 16886)
        if (castTime)
            if (Player* modOwner = spell->GetCaster()->GetSpellModOwner())
                modOwner->ApplySpellMod(spellInfo->Id, SPELLMOD_CASTING_TIME, castTime, spell);

        if (!(spellInfo->Attributes & (SPELL_ATTR_IS_ABILITY | SPELL_ATTR_TRADESPELL)))
            castTime = int32(castTime * spell->GetCaster()->GetFloatValue(UNIT_MOD_CAST_SPEED));
        else
        {
            if (spell->IsRangedSpell() && !spell->IsAutoRepeat())
                castTime = int32(castTime * spell->GetCaster()->m_modAttackSpeedPct[RANGED_ATTACK]);
        }
    }

    if (spellInfo->Attributes & SPELL_ATTR_RANGED && (!spell || !spell->IsAutoRepeat()))
        castTime += 500;

    return (castTime > 0) ? uint32(castTime) : 0;
}

uint32 GetSpellCastTimeForBonus(SpellEntry const *spellProto, DamageEffectType damagetype)
{
    uint32 CastingTime = !IsChanneledSpell(spellProto) ? GetSpellCastTime(spellProto) : GetSpellDuration(spellProto);

    if (CastingTime > 7000) CastingTime = 7000;
    if (CastingTime < 1500) CastingTime = 1500;

    if (damagetype == DOT && !IsChanneledSpell(spellProto))
        CastingTime = 3500;

    int32 overTime    = 0;
    uint8 effects     = 0;
    bool DirectDamage = false;
    bool AreaEffect   = false;

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (IsAreaEffectTarget(Targets(spellProto->EffectImplicitTargetA[i])) || IsAreaEffectTarget(Targets(spellProto->EffectImplicitTargetB[i])))
            AreaEffect = true;

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch (spellProto->Effect[i])
        {
            case SPELL_EFFECT_SCHOOL_DAMAGE:
            case SPELL_EFFECT_POWER_DRAIN:
            case SPELL_EFFECT_HEALTH_LEECH:
            case SPELL_EFFECT_ENVIRONMENTAL_DAMAGE:
            case SPELL_EFFECT_POWER_BURN:
            case SPELL_EFFECT_HEAL:
                DirectDamage = true;
                break;
            case SPELL_EFFECT_APPLY_AURA:
                switch (spellProto->EffectApplyAuraName[i])
                {
                    case SPELL_AURA_PERIODIC_DAMAGE:
                    case SPELL_AURA_PERIODIC_HEAL:
                    case SPELL_AURA_PERIODIC_LEECH:
                        if (GetSpellDuration(spellProto))
                            overTime = GetSpellDuration(spellProto);
                        break;
                    // Penalty for additional effects
                    case SPELL_AURA_DUMMY:
                        ++effects;
                        break;
                    case SPELL_AURA_MOD_DECREASE_SPEED:
                        ++effects;
                        break;
                    case SPELL_AURA_MOD_CONFUSE:
                    case SPELL_AURA_MOD_STUN:
                    case SPELL_AURA_MOD_ROOT:
                        // -10% per effect
                        effects += 2;
                        break;
                    default:
                        break;
                }
                break;
            default:
                break;
        }
    }

    // Combined Spells with Both Over Time and Direct Damage
    if (overTime > 0 && CastingTime > 0 && DirectDamage)
    {
        // mainly for DoTs which are 3500 here otherwise
        uint32 OriginalCastTime = GetSpellCastTime(spellProto);
        if (OriginalCastTime > 7000) OriginalCastTime = 7000;
        if (OriginalCastTime < 1500) OriginalCastTime = 1500;
        // Portion to Over Time
        float PtOT = (overTime / 15000.0f) / ((overTime / 15000.0f) + (OriginalCastTime / 3500.0f));

        if (damagetype == DOT)
            CastingTime = uint32(CastingTime * PtOT);
        else if (PtOT < 1.0f)
            CastingTime  = uint32(CastingTime * (1 - PtOT));
        else
            CastingTime = 0;
    }

    // Area Effect Spells receive only half of bonus
    if (AreaEffect)
        CastingTime /= 2;

    // 50% for damage and healing spells for leech spells from damage bonus and 0% from healing
    for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
    {
        if (spellProto->Effect[j] == SPELL_EFFECT_HEALTH_LEECH ||
                (spellProto->Effect[j] == SPELL_EFFECT_APPLY_AURA && spellProto->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_LEECH))
        {
            CastingTime /= 2;
            break;
        }
    }

    // -5% of total per any additional effect (multiplicative)
    for (int i = 0; i < effects; ++i)
        CastingTime *= 0.95f;

    return CastingTime;
}

uint16 GetSpellAuraMaxTicks(SpellEntry const* spellInfo)
{
    int32 DotDuration = GetSpellDuration(spellInfo);
    if (DotDuration == 0)
        return 1;

    // 200% limit
    if (DotDuration > 30000)
        DotDuration = 30000;

    for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
    {
        if (spellInfo->Effect[j] == SPELL_EFFECT_APPLY_AURA && (
                    spellInfo->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_DAMAGE ||
                    spellInfo->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_HEAL ||
                    spellInfo->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_LEECH))
        {
            if (spellInfo->EffectAmplitude[j] != 0)
                return DotDuration / spellInfo->EffectAmplitude[j];
            break;
        }
    }

    return 6;
}

float CalculateDefaultCoefficient(SpellEntry const *spellProto, DamageEffectType const damagetype)
{
    // Damage over Time spells bonus calculation
    float DotFactor = 1.0f;
    if (damagetype == DOT)
    {
        if (!IsChanneledSpell(spellProto))
            DotFactor = GetSpellDuration(spellProto) / 15000.0f;

        if (uint16 DotTicks = GetSpellAuraMaxTicks(spellProto))
            DotFactor /= DotTicks;
    }

    // Distribute Damage over multiple effects, reduce by AoE
    float coeff = GetSpellCastTimeForBonus(spellProto, damagetype) / 3500.0f;

    return coeff * DotFactor;
}


float CalculateCustomCoefficient(SpellEntry const *spellProto, Unit const* caster, DamageEffectType const damageType, float coeff, Spell* spell, bool donePart)
{
    if (!caster)
        return coeff;

    //if (caster->IsPlayer())
    //{
        switch (spellProto->SpellFamilyName)
        {
            case SPELLFAMILY_PALADIN:
            {
                // Seal of Righteousness
                if (spellProto->IsFitToFamilyMask(UI64LIT(0x0000000008000000)) && spellProto->SpellIconID == 25)
                {
                    coeff = 0.092f;
                    float speed = BASE_ATTACK_TIME;

                    if (caster->IsPlayer())
                    {
                        if (Item *item = ((Player*)caster)->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND))
                        {
                            coeff = item->isOneHandedWeapon() ? 0.092f : 0.108f;
                            speed = item->GetProto()->Delay;
                        }
                    }

                    speed /= 1000.0f;

                    return speed * coeff;
                }
                // Seal of Command
                if (spellProto->Id == 20424)
                {
                    return donePart ? 0.20f : 0.29f;
                }
            }
            case SPELLFAMILY_SHAMAN:
            {
                if (!spell)
                    return coeff;

                // Chain Lightning / Chain Heal / Healing Wave (T1 8/8 bonus)
                if (spellProto->IsFitToFamilyMask(UI64LIT(0x00000000142)))
                {
                    float multiplier = spellProto->DmgMultiplier[0];

                    if (spell->GetTargetNum() > 1)
                    {
                        if (Player* modOwner = caster->GetSpellModOwner())
                        {
                            // Improved Chain Heal (T2 3/8 bonus) / Gift of the Gathering Storm Chain Lightning Bonus
                            modOwner->ApplySpellMod(spell->m_spellInfo->Id, SPELLMOD_EFFECT_PAST_FIRST, multiplier, spell);
                        }
                    }

                    for (uint8 i = 1; i < spell->GetTargetNum(); ++i)
                        coeff *= multiplier;
                    return coeff;
                }
            }
            default:
                break;
        }
    //}

    return coeff;
}

WeaponAttackType GetWeaponAttackType(SpellEntry const *spellInfo)
{
    if (!spellInfo)
        return BASE_ATTACK;

    switch (spellInfo->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:
            if (spellInfo->AttributesEx3 & SPELL_ATTR_EX3_REQ_OFFHAND)
                return OFF_ATTACK;
            else
                return BASE_ATTACK;
            break;
        case SPELL_DAMAGE_CLASS_RANGED:
            return RANGED_ATTACK;
            break;
        default:
            // Wands
            if (spellInfo->AttributesEx2 & SPELL_ATTR_EX2_AUTOREPEAT_FLAG)
                return RANGED_ATTACK;
            else
                return BASE_ATTACK;
            break;
    }
}

bool IsPassiveSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return false;
    return IsPassiveSpell(spellInfo);
}

bool IsPassiveSpell(SpellEntry const *spellInfo)
{
    // Nostalrius : 0x80 -> D'autres sorts passifs, dont les enchants par exemple
    return (spellInfo->Attributes & (SPELL_ATTR_PASSIVE)) != 0;
}

bool IsNoStackAuraDueToAura(uint32 spellId_1, uint32 spellId_2)
{
    SpellEntry const *spellInfo_1 = sSpellMgr.GetSpellEntry(spellId_1);
    SpellEntry const *spellInfo_2 = sSpellMgr.GetSpellEntry(spellId_2);
    if (!spellInfo_1 || !spellInfo_2) return false;
    if (spellInfo_1->Id == spellId_2) return false;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        for (int32 j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if (spellInfo_1->Effect[i] == spellInfo_2->Effect[j]
                    && spellInfo_1->EffectApplyAuraName[i] == spellInfo_2->EffectApplyAuraName[j]
                    && spellInfo_1->EffectMiscValue[i] == spellInfo_2->EffectMiscValue[j]
                    && spellInfo_1->EffectItemType[i] == spellInfo_2->EffectItemType[j]
                    && (spellInfo_1->Effect[i] != 0 || spellInfo_1->EffectApplyAuraName[i] != 0 ||
                        spellInfo_1->EffectMiscValue[i] != 0 || spellInfo_1->EffectItemType[i] != 0))
                return true;
        }
    }

    return false;
}

int32 CompareAuraRanks(uint32 spellId_1, uint32 spellId_2)
{
    SpellEntry const*spellInfo_1 = sSpellMgr.GetSpellEntry(spellId_1);
    SpellEntry const*spellInfo_2 = sSpellMgr.GetSpellEntry(spellId_2);
    if (!spellInfo_1 || !spellInfo_2) return 0;
    if (spellId_1 == spellId_2) return 0;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (spellInfo_1->Effect[i] != 0 && spellInfo_2->Effect[i] != 0 && spellInfo_1->Effect[i] == spellInfo_2->Effect[i])
        {
            int32 diff = spellInfo_1->EffectBasePoints[i] - spellInfo_2->EffectBasePoints[i];
            if (spellInfo_1->CalculateSimpleValue(SpellEffectIndex(i)) < 0 && spellInfo_2->CalculateSimpleValue(SpellEffectIndex(i)) < 0)
                return -diff;
            else return diff;
        }
    }
    return 0;
}

bool CompareSpellSpecificAuras(SpellEntry const* spellInfo_1, SpellEntry const* spellInfo_2)
{
    if (!spellInfo_1 || !spellInfo_2) return 0;
    if (spellInfo_1 == spellInfo_2) return 0;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        for (int32 j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if (spellInfo_1->Effect[i] == SPELL_EFFECT_APPLY_AURA
                && spellInfo_1->EffectApplyAuraName[i] == spellInfo_2->EffectApplyAuraName[j])
            {
                if (spellInfo_1->EffectBasePoints[i] < spellInfo_2->EffectBasePoints[j] && spellInfo_2->EffectBasePoints[j] < 0)
                    return true;
                else if (spellInfo_1->EffectBasePoints[i] > spellInfo_2->EffectBasePoints[j] && spellInfo_2->EffectBasePoints[j] >= 0)
                    return true;
                else if (spellInfo_1->EffectBasePoints[i] == spellInfo_2->EffectBasePoints[j] && GetSpellDuration(spellInfo_1) >= GetSpellDuration(spellInfo_2))
                    return true;
            }
        }
    }

    return false;
}

SpellSpecific GetSpellSpecific(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return SPELL_NORMAL;

    switch (spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            // Aspect of the Beast
            if (spellInfo->Id == 13161)
                return SPELL_ASPECT;

            // Food / Drinks (mostly)
            if (spellInfo->AuraInterruptFlags & AURA_INTERRUPT_FLAG_NOT_SEATED)
            {
                bool food = false;
                bool drink = false;
                for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
                {
                    switch (spellInfo->EffectApplyAuraName[i])
                    {
                        // Food
                        case SPELL_AURA_MOD_REGEN:
                        case SPELL_AURA_OBS_MOD_HEALTH:
                            food = true;
                            break;
                        // Drink
                        case SPELL_AURA_MOD_POWER_REGEN:
                        case SPELL_AURA_OBS_MOD_MANA:
                            drink = true;
                            break;
                        default:
                            break;
                    }
                }

                if (food && drink)
                    return SPELL_FOOD_AND_DRINK;
                else if (food)
                    return SPELL_FOOD;
                else if (drink)
                    return SPELL_DRINK;
            }
            else
            {
                // Well Fed buffs (must be exclusive with Food / Drink replenishment effects, or else Well Fed will cause them to be removed)
                // SpellIcon 2560 is Spell 46687, does not have this flag
                if (spellInfo->AttributesEx2 & SPELL_ATTR_EX2_FOOD_BUFF)
                    return SPELL_WELL_FED;
            }
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            // family flags 18(Molten), 25(Frost/Ice), 28(Mage)
            if (spellInfo->SpellFamilyFlags & UI64LIT(0x12000000))
                return SPELL_MAGE_ARMOR;

            if (spellInfo->EffectApplyAuraName[EFFECT_INDEX_0] == SPELL_AURA_MOD_CONFUSE && spellInfo->PreventionType == SPELL_PREVENTION_TYPE_SILENCE)
                return SPELL_MAGE_POLYMORPH;

            break;
        }
        case SPELLFAMILY_WARRIOR:
        {
            if (spellInfo->SpellFamilyFlags & UI64LIT(0x00008000010000))
                return SPELL_POSITIVE_SHOUT;

            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // only warlock curses have this
            if (spellInfo->Dispel == DISPEL_CURSE)
                return SPELL_CURSE;
            break;
        }
        case SPELLFAMILY_PRIEST:
        {
            // "Well Fed" buff from Blessed Sunfruit, Blessed Sunfruit Juice, Alterac Spring Water
            if ((spellInfo->Attributes & SPELL_ATTR_CASTABLE_WHILE_SITTING) &&
                    (spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_AUTOATTACK) &&
                    (spellInfo->SpellIconID == 52 || spellInfo->SpellIconID == 79))
                return SPELL_WELL_FED;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // only hunter stings have this
            if (spellInfo->Dispel == DISPEL_POISON)
                return SPELL_STING;

            // only hunter aspects have this (one have generic family), if exclude Auto Shot
            if (spellInfo->activeIconID == 122 && spellInfo->Id != 75)
                return SPELL_ASPECT;

            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            if (IsSealSpell(spellInfo))
                return SPELL_SEAL;

            if (spellInfo->IsFitToFamilyMask(UI64LIT(0x0000000010000100)))
                return SPELL_BLESSING;

            if ((spellInfo->IsFitToFamilyMask(UI64LIT(0x0000000020180400))) && spellInfo->baseLevel != 0)
                return SPELL_JUDGEMENT;

            for (int i = 0; i < 3; ++i)
            {
                // only paladin auras have this
                if (spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AREA_AURA_PARTY)
                    return SPELL_AURA;
            }
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            if (IsElementalShield(spellInfo))
                return SPELL_ELEMENTAL_SHIELD;

            break;
        }

        case SPELLFAMILY_POTION:
            return sSpellMgr.GetSpellElixirSpecific(spellInfo->Id);
    }

    // only warlock armor/skin have this (in additional to family cases)
    if (spellInfo->SpellVisual == 130 && spellInfo->SpellIconID == 89)
        return SPELL_WARLOCK_ARMOR;

    // Tracking spells (exclude Well Fed, some other always allowed cases)
    if ((IsSpellHaveAura(spellInfo, SPELL_AURA_TRACK_CREATURES) ||
            IsSpellHaveAura(spellInfo, SPELL_AURA_TRACK_RESOURCES)  ||
            IsSpellHaveAura(spellInfo, SPELL_AURA_TRACK_STEALTHED)) &&
            ((spellInfo->AttributesEx & SPELL_ATTR_EX_NOT_RESET_AUTO_ACTIONS) || (spellInfo->Attributes & SPELL_ATTR_CASTABLE_WHILE_MOUNTED)))
        return SPELL_TRACKER;

    // elixirs can have different families, but potion most ofc.
    if (SpellSpecific sp = sSpellMgr.GetSpellElixirSpecific(spellInfo->Id))
        return sp;

    // Attack speed reduction
    if (IsSpellHaveSingleAura(spellInfo, SPELL_AURA_MOD_MELEE_HASTE))
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
            if (AuraType(spellInfo->EffectApplyAuraName[i]) == SPELL_AURA_MOD_MELEE_HASTE && spellInfo->EffectBasePoints[i] < 0)
                return SPELL_NEGATIVE_HASTE;

    // Movement speed reduction
    if (IsSpellHaveSingleAura(spellInfo, SPELL_AURA_MOD_DECREASE_SPEED))
        return SPELL_SNARE;

    return SPELL_NORMAL;
}

// target not allow have more one spell specific from same caster
bool IsSingleFromSpellSpecificPerTargetPerCaster(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
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
bool IsSingleFromSpellSpecificSpellRanksPerTarget(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
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
bool IsSingleFromSpellSpecificPerTarget(SpellSpecific spellSpec1, SpellSpecific spellSpec2)
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

bool IsPositiveTarget(uint32 targetA, uint32 targetB)
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

bool IsExplicitPositiveTarget(uint32 targetA)
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

bool IsExplicitNegativeTarget(uint32 targetA)
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

bool IsPositiveEffect(SpellEntry const *spellproto, SpellEffectIndex effIndex, Unit* caster, Unit* victim)
{
    // Nostalrius (SpellMod)
    if (spellproto->Custom & SPELL_CUSTOM_POSITIVE)
        return true;
    if (spellproto->Custom & SPELL_CUSTOM_NEGATIVE)
        return false;

    // Hellfire. Damages the caster, but is still positive !
    // (Has same SpellFamilyFlags as Soul Fire oO)
    if (spellproto->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_HELLFIRE>() && spellproto->SpellIconID == 937 && spellproto->SpellVisual == 5423)
        return true;

    switch (spellproto->Effect[effIndex])
    {
        case SPELL_EFFECT_DUMMY:
            // some explicitly required dummy effect sets
            switch (spellproto->Id)
            {
                case 10258:                                 // Awaken Vault Warder
                case 18153:                                 // Kodo Kombobulator
                    return true;
                default:
                    break;
            }
            break;
        // always positive effects (check before target checks that provided non-positive result in some case for positive effects)
        case SPELL_EFFECT_HEAL:
        case SPELL_EFFECT_LEARN_SPELL:
        case SPELL_EFFECT_SKILL_STEP:
            return true;
        // Negative Effects
        case SPELL_EFFECT_INSTAKILL:
            // Suicide is a positive spell - ex. Garr Massive Eruption
            if (spellproto->EffectImplicitTargetA[effIndex] == TARGET_SELF && spellproto->EffectImplicitTargetB[effIndex] == TARGET_NONE)
                return true;
            // Sacrifice is a positive spell - for the warlock :)
            if (spellproto->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_VOIDWALKER_SPELLS>())
                return true;
            return false;
        // Dispel can be positive or negative depending on the target
        case SPELL_EFFECT_DISPEL:
            if (caster && victim)
            {
                if (CharmInfo *charm = victim->GetCharmInfo())
                    if (FactionTemplateEntry const* ft = charm->GetOriginalFactionTemplate())
                        return ft->IsFriendlyTo(*caster->getFactionTemplateEntry());
                return caster->IsFriendlyTo(victim);
            }
        // non-positive aura use
        case SPELL_EFFECT_APPLY_AURA:
        {
            switch (spellproto->EffectApplyAuraName[effIndex])
            {
                case SPELL_AURA_DUMMY:
                {
                    // dummy aura can be positive or negative dependent from casted spell
                    switch (spellproto->Id)
                    {
                        case 13139:                         // net-o-matic special effect
                        case 23445:                         // evil twin
                            return false;
                        // some spells have unclear target modes for selection, so just make effect positive
                        case 27184:
                        case 27190:
                        case 27191:
                        case 27201:
                        case 27202:
                        case 27203:
                            return true;
                        default:
                            break;
                    }
                }
                break;
                case SPELL_AURA_MOD_DAMAGE_DONE:            // dependent from base point sign (negative -> negative)
                case SPELL_AURA_MOD_RESISTANCE:
                case SPELL_AURA_MOD_STAT:
                case SPELL_AURA_MOD_SKILL:
                case SPELL_AURA_MOD_DODGE_PERCENT:
                case SPELL_AURA_MOD_HEALING_PCT:
                case SPELL_AURA_MOD_HEALING_DONE:
                    if (spellproto->CalculateSimpleValue(effIndex) < 0)
                        return false;
                    break;
                case SPELL_AURA_MOD_DAMAGE_TAKEN:           // dependent from bas point sign (positive -> negative)
                    if (spellproto->CalculateSimpleValue(effIndex) < 0)
                        return true;
                    // let check by target modes (for Amplify Magic cases/etc)
                    break;
                case SPELL_AURA_MOD_SPELL_CRIT_CHANCE:
                case SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT:
                case SPELL_AURA_MOD_DAMAGE_PERCENT_DONE:
                    if (spellproto->CalculateSimpleValue(effIndex) > 0)
                        return true;                        // some expected positive spells have unclear target modes // maybe don't need this at all now that we don't check for what was SPELL_ATTR_EX_NEGATIVE
                    break;
                case SPELL_AURA_ADD_TARGET_TRIGGER:
                    return true;
                case SPELL_AURA_PERIODIC_TRIGGER_SPELL:
                    if (spellproto->Id != spellproto->EffectTriggerSpell[effIndex])
                    {
                        uint32 spellTriggeredId = spellproto->EffectTriggerSpell[effIndex];
                        SpellEntry const *spellTriggeredProto = sSpellMgr.GetSpellEntry(spellTriggeredId);

                        if (spellTriggeredProto)
                        {
                            // non-positive targets of main spell return early
                            for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
                            {
                                // if non-positive trigger cast targeted to positive target this main cast is non-positive
                                // this will place this spell auras as debuffs
                                if (spellTriggeredProto->Effect[i] &&
                                        IsPositiveTarget(spellTriggeredProto->EffectImplicitTargetA[i], spellTriggeredProto->EffectImplicitTargetB[i]) &&
                                        !IsPositiveEffect(spellTriggeredProto, SpellEffectIndex(i)))
                                    return false;
                            }
                        }
                    }
                    break;
                case SPELL_AURA_PROC_TRIGGER_SPELL:
                    // many positive auras have negative triggered spells at damage for example and this not make it negative (it can be canceled for example)
                    break;
                case SPELL_AURA_MOD_STUN:                   //have positive and negative spells, we can't sort its correctly at this moment.
                    if (effIndex == EFFECT_INDEX_0 && spellproto->Effect[EFFECT_INDEX_1] == 0 && spellproto->Effect[EFFECT_INDEX_2] == 0)
                        return false;                       // but all single stun aura spells is negative

                    // Petrification
                    if (spellproto->Id == 17624)
                        return false;
                    break;
                case SPELL_AURA_MOD_PACIFY_SILENCE:
                    if (spellproto->Id == 24740)            // Wisp Costume
                        return true;
                    return false;
                case SPELL_AURA_MOD_SILENCE:
                    if (spellproto->Id == 24732)            // Bat Costume
                        return true;
                    return false;
                case SPELL_AURA_MOD_ROOT:
                case SPELL_AURA_GHOST:
                case SPELL_AURA_PERIODIC_LEECH:
                case SPELL_AURA_MOD_STALKED:
                case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                case SPELL_AURA_MOD_DETECT_RANGE:
                    return false;
                case SPELL_AURA_PERIODIC_DAMAGE:            // used in positive spells also.
                    // part of negative spell if casted at self (prevent cancel)
                    if (spellproto->EffectImplicitTargetA[effIndex] == TARGET_SELF)
                        return false;
                    break;
                case SPELL_AURA_MOD_DECREASE_SPEED:         // used in positive spells also
                    // part of positive spell if casted at self
                    if (spellproto->EffectImplicitTargetA[effIndex] == TARGET_SELF &&
                            spellproto->SpellFamilyName == SPELLFAMILY_GENERIC)
                        return false;
                    // but not this if this first effect (don't found better check)
                    if (spellproto->Attributes & 0x4000000 && effIndex == EFFECT_INDEX_0)
                        return false;
                    break;
                case SPELL_AURA_MOD_SCALE:
                    // some spells negative
                    switch (spellproto->Id)
                    {
                        case 802:                           // Mutate Bug, wrongly negative by target modes
                            return true;
                    }
                    break;
                case SPELL_AURA_MECHANIC_IMMUNITY:
                {
                    // non-positive immunities
                    switch (spellproto->EffectMiscValue[effIndex])
                    {
                        case MECHANIC_BANDAGE:
                        case MECHANIC_SHIELD:
                        case MECHANIC_MOUNT:
                        case MECHANIC_INVULNERABILITY:
                            return false;
                        default:
                            break;
                    }
                }
                break;
                case SPELL_AURA_ADD_FLAT_MODIFIER:          // mods
                case SPELL_AURA_ADD_PCT_MODIFIER:
                {
                    // non-positive mods
                    switch (spellproto->EffectMiscValue[effIndex])
                    {
                        case SPELLMOD_COST:                 // dependent from bas point sign (negative -> positive)
                            if (spellproto->CalculateSimpleValue(effIndex) > 0)
                                return false;
                            break;
                        default:
                            break;
                    }
                }
                break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }

    // non-positive targets
    if (!IsPositiveTarget(spellproto->EffectImplicitTargetA[effIndex], spellproto->EffectImplicitTargetB[effIndex]))
        return false;

    // Attributes check
    if (spellproto->Attributes & SPELL_ATTR_NEGATIVE)
        return false;

    // ok, positive
    return true;
}

bool IsPositiveSpell(uint32 spellId, Unit* caster, Unit* victim)
{
    SpellEntry const *spellproto = sSpellMgr.GetSpellEntry(spellId);
    if (!spellproto)
        return false;

    return IsPositiveSpell(spellproto, caster, victim);
}

bool IsPositiveSpell(SpellEntry const *spellproto, Unit* caster, Unit* victim)
{
    if (spellproto->Attributes & SPELL_ATTR_NEGATIVE)
        return false;
    // spells with at least one negative effect are considered negative
    // some self-applied spells have negative effects but in self casting case negative check ignored.
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (spellproto->Effect[i] && !IsPositiveEffect(spellproto, SpellEffectIndex(i), caster, victim))
            return false;
    return true;
}

bool IsHealSpell(SpellEntry const *spellProto)
{
    // Holy Light/Flash of Light
    if (spellProto->SpellFamilyName == SPELLFAMILY_PALADIN)
    {
        if (spellProto->IsFitToFamilyMask<CF_PALADIN_FLASH_OF_LIGHT2>() ||
            spellProto->IsFitToFamilyMask<CF_PALADIN_HOLY_LIGHT2>())
            return true;
    }

    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch (spellProto->Effect[i])
        {
            case SPELL_EFFECT_HEAL:
            case SPELL_EFFECT_HEAL_MAX_HEALTH:
                return true;
            case SPELL_EFFECT_APPLY_AURA:
            case SPELL_EFFECT_APPLY_AREA_AURA_FRIEND:
            case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
            case SPELL_EFFECT_APPLY_AREA_AURA_RAID:
            case SPELL_EFFECT_APPLY_AREA_AURA_PET:
            {
                switch (spellProto->EffectApplyAuraName[i])
                {
                    case SPELL_AURA_PERIODIC_HEAL:
                        return true;
                }
                break;
            }
        }
    }

    return false;
}

bool IsSingleTargetSpell(SpellEntry const *spellInfo)
{
    // exceptions (have spellInfo->AttributesEx & (1<<18) but not single targeted)
    switch (spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
            switch (spellInfo->Id)
            {
                case 4538:                                          // Extract Essence (group targets)
                case 5106:                                          // Crystal Flash (group targets)
                case 5530:                                          // Mace Stun Effect
                case 5648:                                          // Stunning Blast, rank 1
                case 5649:                                          // Stunning Blast, rank 2
                case 5726:                                          // Stunning Blow, Rank 1
                case 5727:                                          // Stunning Blow, Rank 2
                case 6927:                                          // Shadowstalker Slash, Rank 1
                case 8399:                                          // Sleep (group targets)
                case 9159:                                          // Sleep (armor triggred affect)
                case 9256:                                          // Deep Sleep (group targets)
                case 13902:                                         // Fist of Ragnaros
                case 16104:                                         // Crystallize (group targets)
                case 17286:                                         // Crusader's Hammer (group targets)
                case 20277:                                         // Fist of Ragnaros (group targets)
                case 20669:                                         // Sleep (group targets)
                case 20683:                                         // Highlord's Justice
                case 24664:                                         // Sleep (group targets)
                    return false;
            }
            break;
        case SPELLFAMILY_HUNTER:
            // Hunter's Mark
            if (spellInfo->SpellVisual == 3239)
                return true;
            // Freezing Trap
            else if (spellInfo->IsFitToFamilyMask<CF_HUNTER_FREEZING_TRAP_EFFECT>())
                return false;
            break;
        case SPELLFAMILY_ROGUE:
            // Cheap Shot
            if (spellInfo->IsFitToFamilyMask<CF_ROGUE_CHEAP_SHOT>())
                return false;
            break;
    } 

    // cannot be cast on another target while not cooled down anyway
    if (GetSpellDuration(spellInfo) < int32(GetSpellRecoveryTime(spellInfo)))
        return false;

    // all other single target spells have if it has AttributesEx
    if (spellInfo->AttributesEx & (1 << 18))
        return true;

    // other single target
    //Fear
    if ((spellInfo->SpellIconID == 98 && spellInfo->SpellFamilyName == SPELLFAMILY_WARLOCK)
      //Banish
      || (spellInfo->SpellIconID == 96 && spellInfo->SpellVisual == 1305))
             return true;

    // Entangling roots -> Can still have on several targets using [Nature's Grasp] (fixed in patch 2.2)
    if (spellInfo->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_ENTANGLING_ROOTS>() && spellInfo->Id != 19975)
        return true;

    // TODO - need found Judgements rule
    switch (GetSpellSpecific(spellInfo->Id))
    {
        case SPELL_JUDGEMENT:
        case SPELL_MAGE_POLYMORPH:
            return true;
        default:
            break;
    }

    return false;
}

bool IsSingleTargetSpells(SpellEntry const *spellInfo1, SpellEntry const *spellInfo2)
{
    // TODO - need better check
    // Equal icon and spellfamily
    if (spellInfo1->SpellFamilyName == spellInfo2->SpellFamilyName &&
            spellInfo1->SpellIconID == spellInfo2->SpellIconID)
        return true;

    // TODO - need found Judgements rule
    SpellSpecific spec1 = GetSpellSpecific(spellInfo1->Id);
    // spell with single target specific types
    switch (spec1)
    {
        case SPELL_JUDGEMENT:
        case SPELL_MAGE_POLYMORPH:
            if (GetSpellSpecific(spellInfo2->Id) == spec1)
                return true;
            break;
        default:
            break;
    }

    return false;
}

SpellCastResult GetErrorAtShapeshiftedCast(SpellEntry const *spellInfo, uint32 form)
{
    // talents that learn spells can have stance requirements that need ignore
    // (this requirement only for client-side stance show in talent description)
    if (GetTalentSpellCost(spellInfo->Id) > 0 &&
            (spellInfo->Effect[EFFECT_INDEX_0] == SPELL_EFFECT_LEARN_SPELL || spellInfo->Effect[EFFECT_INDEX_1] == SPELL_EFFECT_LEARN_SPELL || spellInfo->Effect[EFFECT_INDEX_2] == SPELL_EFFECT_LEARN_SPELL))
        return SPELL_CAST_OK;

    uint32 stanceMask = (form ? 1 << (form - 1) : 0);

    if (stanceMask & spellInfo->StancesNot)                 // can explicitly not be casted in this stance
        return SPELL_FAILED_NOT_SHAPESHIFT;

    if (stanceMask & spellInfo->Stances)                    // can explicitly be casted in this stance
        return SPELL_CAST_OK;

    bool actAsShifted = false;
    if (form > 0)
    {
        SpellShapeshiftFormEntry const *shapeInfo = sSpellShapeshiftFormStore.LookupEntry(form);
        if (!shapeInfo)
        {
            sLog.outError("GetErrorAtShapeshiftedCast: unknown shapeshift %u", form);
            return SPELL_CAST_OK;
        }
        actAsShifted = !(shapeInfo->flags1 & 1);            // shapeshift acts as normal form for spells
    }

    if (actAsShifted)
    {
        if (spellInfo->Attributes & SPELL_ATTR_NOT_SHAPESHIFT) // not while shapeshifted
            return SPELL_FAILED_NOT_SHAPESHIFT;
        else if (spellInfo->Stances != 0)                   // needs other shapeshift
            return SPELL_FAILED_ONLY_SHAPESHIFT;
    }
    else
    {
        // needs shapeshift
        if (!(spellInfo->AttributesEx2 & SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT) && spellInfo->Stances != 0)
            return SPELL_FAILED_ONLY_SHAPESHIFT;
    }

    return SPELL_CAST_OK;
}

void SpellMgr::LoadSpellTargetPositions()
{
    mSpellTargetPositions.clear();                                // need for reload case

    uint32 count = 0;

    //                                                0   1           2                  3                  4                  5
    QueryResult *result = WorldDatabase.Query("SELECT id, target_map, target_position_x, target_position_y, target_position_z, target_orientation FROM spell_target_position");
    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell target destination coordinates", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 Spell_ID = fields[0].GetUInt32();

        SpellTargetPosition st;

        st.target_mapId       = fields[1].GetUInt32();
        st.target_X           = fields[2].GetFloat();
        st.target_Y           = fields[3].GetFloat();
        st.target_Z           = fields[4].GetFloat();
        st.target_Orientation = fields[5].GetFloat();

        MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(st.target_mapId);
        if (!mapEntry)
        {
            sLog.outErrorDb("Spell (ID:%u) target map (ID: %u) does not exist in `Map.dbc`.", Spell_ID, st.target_mapId);
            continue;
        }

        if (st.target_X == 0 && st.target_Y == 0 && st.target_Z == 0)
        {
            sLog.outErrorDb("Spell (ID:%u) target coordinates not provided.", Spell_ID);
            continue;
        }

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(Spell_ID);
        if (!spellInfo)
        {
            sLog.outErrorDb("Spell (ID:%u) listed in `spell_target_position` does not exist.", Spell_ID);
            continue;
        }

        bool found = false;
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (spellInfo->EffectImplicitTargetA[i] == TARGET_TABLE_X_Y_Z_COORDINATES || spellInfo->EffectImplicitTargetB[i] == TARGET_TABLE_X_Y_Z_COORDINATES)
            {
                found = true;
                break;
            }
        }
        if (!found)
        {
            sLog.outErrorDb("Spell (Id: %u) listed in `spell_target_position` does not have target TARGET_TABLE_X_Y_Z_COORDINATES (17).", Spell_ID);
            continue;
        }

        mSpellTargetPositions[Spell_ID] = st;
        ++count;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell target destination coordinates", count);
}

template <typename EntryType, typename WorkerType, typename StorageType>
struct SpellRankHelper
{
    SpellRankHelper(SpellMgr &_mgr, StorageType &_storage): mgr(_mgr), worker(_storage), customRank(0) {}
    void RecordRank(EntryType &entry, uint32 spell_id)
    {
        const SpellEntry *spell = sSpellMgr.GetSpellEntry(spell_id);
        if (!spell)
        {
            sLog.outErrorDb("Spell %u listed in `%s` does not exist", spell_id, worker.TableName());
            return;
        }

        uint32 first_id = mgr.GetFirstSpellInChain(spell_id);

        // most spell ranks expected same data
        if (first_id)
        {
            firstRankSpells.insert(first_id);

            if (first_id != spell_id)
            {
                if (!worker.IsValidCustomRank(entry, spell_id, first_id))
                    return;
                // for later check that first rank also added
                else
                {
                    firstRankSpellsWithCustomRanks.insert(first_id);
                    ++customRank;
                }
            }
        }

        worker.AddEntry(entry, spell);
    }
    void FillHigherRanks()
    {
        // check that first rank added for custom ranks
        for (std::set<uint32>::const_iterator itr = firstRankSpellsWithCustomRanks.begin(); itr != firstRankSpellsWithCustomRanks.end(); ++itr)
            if (!worker.HasEntry(*itr))
                sLog.outErrorDb("Spell %u must be listed in `%s` as first rank for listed custom ranks of spell but not found!", *itr, worker.TableName());

        // fill absent non first ranks data base at first rank data
        for (std::set<uint32>::const_iterator itr = firstRankSpells.begin(); itr != firstRankSpells.end(); ++itr)
        {
            if (worker.SetStateToEntry(*itr))
                mgr.doForHighRanks(*itr, worker);
        }
    }
    std::set<uint32> firstRankSpells;
    std::set<uint32> firstRankSpellsWithCustomRanks;

    SpellMgr &mgr;
    WorkerType worker;
    uint32 customRank;
};

struct DoSpellProcEvent
{
    DoSpellProcEvent(SpellProcEventMap& _spe_map) : spe_map(_spe_map), customProc(0), count(0) {}
    void operator()(uint32 spell_id)
    {
        SpellProcEventEntry const& spe = state->second;
        // add ranks only for not filled data (some ranks have ppm data different for ranks for example)
        SpellProcEventMap::const_iterator spellItr = spe_map.find(spell_id);
        if (spellItr == spe_map.end())
            spe_map[spell_id] = spe;
        // if custom rank data added then it must be same except ppm
        else
        {
            SpellProcEventEntry const& r_spe = spellItr->second;
            if (spe.schoolMask != r_spe.schoolMask)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different schoolMask from first rank in chain", spell_id);

            if (spe.spellFamilyName != r_spe.spellFamilyName)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different spellFamilyName from first rank in chain", spell_id);

            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if (spe.spellFamilyMask[i] != r_spe.spellFamilyMask[i])
                {
                    sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different spellFamilyMask from first rank in chain", spell_id);
                    break;
                }
            }

            if (spe.procFlags != r_spe.procFlags)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different procFlags from first rank in chain", spell_id);

            if (spe.procEx != r_spe.procEx)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different procEx from first rank in chain", spell_id);

            // only ppm allowed has been different from first rank

            if (spe.customChance != r_spe.customChance)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different customChance from first rank in chain", spell_id);

            if (spe.cooldown != r_spe.cooldown)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different cooldown from first rank in chain", spell_id);
        }
    }

    const char* TableName()
    {
        return "spell_proc_event";
    }
    bool IsValidCustomRank(SpellProcEventEntry const &spe, uint32 entry, uint32 first_id)
    {
        // let have independent data in table for spells with ppm rates (exist rank dependent ppm rate spells)
        if (!spe.ppmRate)
        {
            sLog.outErrorDb("Spell %u listed in `spell_proc_event` is not first rank (%u) in chain", entry, first_id);
            // prevent loading since it won't have an effect anyway
            return false;
        }
        return true;
    }
    void AddEntry(SpellProcEventEntry const &spe, SpellEntry const *spell)
    {
        spe_map[spell->Id] = spe;

        bool isCustom = false;

        if (spe.procFlags == 0)
        {
            if (spell->procFlags == 0)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` probally not triggered spell (no proc flags)", spell->Id);
        }
        else
        {
            if (spell->procFlags == spe.procFlags)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` has exactly same proc flags as in spell.dbc, field value redundant", spell->Id);
            else
                isCustom = true;
        }

        if (spe.customChance == 0)
        {
            /* enable for re-check cases, 0 chance ok for some cases because in some cases it set by another spell/talent spellmod)
            if (spell->procChance==0 && !spe.ppmRate)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` probally not triggered spell (no chance or ppm)", spell->Id);
            */
        }
        else
        {
            if (spell->procChance == spe.customChance)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` has exactly same custom chance as in spell.dbc, field value redundant", spell->Id);
            else
                isCustom = true;
        }

        // totally redundant record
        if (!spe.schoolMask && !spe.procFlags &&
                !spe.procEx && !spe.ppmRate && !spe.customChance && !spe.cooldown)
        {
            bool empty = !spe.spellFamilyName ? true : false;
            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if (spe.spellFamilyMask[i])
                {
                    empty = false;
                    break;
                }
            }
            if (empty)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` not have any useful data", spell->Id);
        }

        if (isCustom)
            ++customProc;
        else
            ++count;
    }

    bool HasEntry(uint32 spellId)
    {
        return spe_map.count(spellId) > 0;
    }
    bool SetStateToEntry(uint32 spellId)
    {
        return (state = spe_map.find(spellId)) != spe_map.end();
    }
    SpellProcEventMap& spe_map;
    SpellProcEventMap::const_iterator state;

    uint32 customProc;
    uint32 count;
};

void SpellMgr::LoadSpellProcEvents()
{
    mSpellProcEventMap.clear();                             // need for reload case

    //                                                0      1           2                3                 4                 5                 6          7       8        9             10
    QueryResult *result = WorldDatabase.Query("SELECT entry, SchoolMask, SpellFamilyName, SpellFamilyMask0, SpellFamilyMask1, SpellFamilyMask2, procFlags, procEx, ppmRate, CustomChance, Cooldown FROM spell_proc_event");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> No spell proc event conditions loaded");
        return;
    }

    SpellRankHelper<SpellProcEventEntry, DoSpellProcEvent, SpellProcEventMap> rankHelper(*this, mSpellProcEventMap);

    BarGoLink bar(result->GetRowCount());
    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();

        SpellProcEventEntry spe;

        spe.schoolMask      = fields[1].GetUInt32();
        spe.spellFamilyName = fields[2].GetUInt32();

        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
            spe.spellFamilyMask[i] = fields[3 + i].GetUInt64();

        spe.procFlags       = fields[6].GetUInt32();
        spe.procEx          = fields[7].GetUInt32();
        spe.ppmRate         = fields[8].GetFloat();
        spe.customChance    = fields[9].GetFloat();
        spe.cooldown        = fields[10].GetUInt32();

        rankHelper.RecordRank(spe, entry);

    }
    while (result->NextRow());

    rankHelper.FillHigherRanks();

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u extra spell proc event conditions +%u custom proc (inc. +%u custom ranks)",  rankHelper.worker.count, rankHelper.worker.customProc, rankHelper.customRank);
}

struct DoSpellProcItemEnchant
{
    DoSpellProcItemEnchant(SpellProcItemEnchantMap& _procMap, float _ppm) : procMap(_procMap), ppm(_ppm) {}
    void operator()(uint32 spell_id)
    {
        procMap[spell_id] = ppm;
    }

    SpellProcItemEnchantMap& procMap;
    float ppm;
};

void SpellMgr::LoadSpellProcItemEnchant()
{
    mSpellProcItemEnchantMap.clear();                       // need for reload case

    uint32 count = 0;

    //                                                0      1
    QueryResult *result = WorldDatabase.Query("SELECT entry, ppmRate FROM spell_proc_item_enchant");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u proc item enchant definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();
        float ppmRate = fields[1].GetFloat();

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(entry);

        if (!spellInfo)
        {
            sLog.outErrorDb("Spell %u listed in `spell_proc_item_enchant` does not exist", entry);
            continue;
        }

        uint32 first_id = GetFirstSpellInChain(entry);

        if (first_id != entry)
        {
            sLog.outErrorDb("Spell %u listed in `spell_proc_item_enchant` is not first rank (%u) in chain", entry, first_id);
            // prevent loading since it won't have an effect anyway
            continue;
        }

        mSpellProcItemEnchantMap[entry] = ppmRate;

        // also add to high ranks
        DoSpellProcItemEnchant worker(mSpellProcItemEnchantMap, ppmRate);
        doForHighRanks(entry, worker);

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u proc item enchant definitions", count);
}

struct DoSpellBonuses
{
    DoSpellBonuses(SpellBonusMap& _spellBonusMap, SpellBonusEntry const& _spellBonus) : spellBonusMap(_spellBonusMap), spellBonus(_spellBonus) {}
    void operator()(uint32 spell_id)
    {
        spellBonusMap[spell_id] = spellBonus;
    }

    SpellBonusMap& spellBonusMap;
    SpellBonusEntry const& spellBonus;
};

void SpellMgr::LoadSpellBonuses()
{
    mSpellBonusMap.clear();                             // need for reload case
    uint32 count = 0;
    //                                                0      1             2          3
    QueryResult *result = WorldDatabase.Query("SELECT entry, direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus FROM spell_bonus_data");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded %u spell bonus data", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());
    do
    {
        Field *fields = result->Fetch();
        bar.step();
        uint32 entry = fields[0].GetUInt32();

        SpellEntry const* spell = sSpellMgr.GetSpellEntry(entry);
        if (!spell)
        {
            sLog.outErrorDb("Spell %u listed in `spell_bonus_data` does not exist", entry);
            continue;
        }

        uint32 first_id = GetFirstSpellInChain(entry);

        if (first_id != entry)
        {
            sLog.outErrorDb("Spell %u listed in `spell_bonus_data` is not first rank (%u) in chain", entry, first_id);
            // prevent loading since it won't have an effect anyway
            continue;
        }

        SpellBonusEntry sbe;

        sbe.direct_damage = fields[1].GetFloat();
        sbe.dot_damage    = fields[2].GetFloat();
        sbe.ap_bonus      = fields[3].GetFloat();
        sbe.ap_dot_bonus   = fields[4].GetFloat();

        bool need_dot = false;
        bool need_direct = false;
        uint32 x = 0;                                       // count all, including empty, meaning: not all existing effect is DoTs/HoTs
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (!spell->Effect[i])
            {
                ++x;
                continue;
            }

            // DoTs/HoTs
            switch (spell->EffectApplyAuraName[i])
            {
                case SPELL_AURA_PERIODIC_DAMAGE:
                case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                case SPELL_AURA_PERIODIC_LEECH:
                case SPELL_AURA_PERIODIC_HEAL:
                case SPELL_AURA_OBS_MOD_HEALTH:
                case SPELL_AURA_PERIODIC_MANA_LEECH:
                case SPELL_AURA_OBS_MOD_MANA:
                case SPELL_AURA_POWER_BURN_MANA:
                    need_dot = true;
                    ++x;
                    break;
                default:
                    break;
            }
        }

        //TODO: maybe add explicit list possible direct damage spell effects...
        if (x < MAX_EFFECT_INDEX)
            need_direct = true;

        // Check if direct_bonus is needed in `spell_bonus_data`
        float direct_calc = 0.0f;
        float direct_diff = 1000.0f;                        // for have big diff if no DB field value
        if (sbe.direct_damage)
        {
            direct_calc = CalculateDefaultCoefficient(spell, SPELL_DIRECT_DAMAGE);
            direct_diff = std::abs(sbe.direct_damage - direct_calc);
        }

        // Check if dot_bonus is needed in `spell_bonus_data`
        float dot_calc = 0.0f;
        float dot_diff = 1000.0f;                           // for have big diff if no DB field value
        if (sbe.dot_damage)
        {
            dot_calc = CalculateDefaultCoefficient(spell, DOT);
            dot_diff = std::abs(sbe.dot_damage - dot_calc);
        }

        if (direct_diff < 0.02f && !need_dot && !sbe.ap_bonus && !sbe.ap_dot_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `direct_bonus` not needed (data from table: %f, calculated %f, difference of %f) and `dot_bonus` also not used",
                            entry, sbe.direct_damage, direct_calc, direct_diff);
        else if (direct_diff < 0.02f && dot_diff < 0.02f && !sbe.ap_bonus && !sbe.ap_dot_bonus)
        {
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `direct_bonus` not needed (data from table: %f, calculated %f, difference of %f) and ",
                            entry, sbe.direct_damage, direct_calc, direct_diff);
            sLog.outErrorDb("                                  ... `dot_bonus` not needed (data from table: %f, calculated %f, difference of %f)",
                            sbe.dot_damage, dot_calc, dot_diff);
        }
        else if (!need_direct && dot_diff < 0.02f && !sbe.ap_bonus && !sbe.ap_dot_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `dot_bonus` not needed (data from table: %f, calculated %f, difference of %f) and direct also not used",
                            entry, sbe.dot_damage, dot_calc, dot_diff);
        else if (!need_direct && sbe.direct_damage)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `direct_bonus` not used (spell not have non-periodic affects)", entry);
        else if (!need_dot && sbe.dot_damage)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `dot_bonus` not used (spell not have periodic affects)", entry);

        if (!need_direct && sbe.ap_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `ap_bonus` not used (spell not have non-periodic affects)", entry);
        else if (!need_dot && sbe.ap_dot_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `ap_dot_bonus` not used (spell not have periodic affects)", entry);

        mSpellBonusMap[entry] = sbe;

        // also add to high ranks
        DoSpellBonuses worker(mSpellBonusMap, sbe);
        doForHighRanks(entry, worker);

        ++count;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u extra spell bonus data",  count);
}

bool SpellMgr::IsSpellProcEventCanTriggeredBy(SpellProcEventEntry const * spellProcEvent, uint32 EventProcFlag, SpellEntry const * procSpell, uint32 procFlags, uint32 procExtra)
{
    // No extra req need
    uint32 procEvent_procEx = PROC_EX_NONE;

    // check prockFlags for condition
    if ((procFlags & EventProcFlag) == 0)
        return false;

    // Always trigger for this
    if (EventProcFlag & (PROC_FLAG_KILLED | PROC_FLAG_KILL | PROC_FLAG_ON_TRAP_ACTIVATION))
        return true;

    if (spellProcEvent)     // Exist event data
    {
        // Store extra req
        procEvent_procEx = spellProcEvent->procEx;

        // For melee triggers
        if (procSpell == nullptr)
        {
            // Check (if set) for school (melee attack have Normal school)
            if (spellProcEvent->schoolMask && (spellProcEvent->schoolMask & SPELL_SCHOOL_MASK_NORMAL) == 0)
                return false;
        }
        else // For spells need check school/spell family/family mask
        {
            // Check (if set) for school
            if (spellProcEvent->schoolMask && (spellProcEvent->schoolMask & GetSchoolMask(procSpell->School)) == 0)
                return false;

            // Check (if set) for spellFamilyName
            if (spellProcEvent->spellFamilyName && (spellProcEvent->spellFamilyName != procSpell->SpellFamilyName))
                return false;
        }
    }

    // Check for extra req (if none) and hit/crit
    if (procEvent_procEx == PROC_EX_NONE)
    {
        // Don't allow proc from periodic heal if no extra requirement is defined
        if (EventProcFlag & (PROC_FLAG_ON_DO_PERIODIC | PROC_FLAG_ON_TAKE_PERIODIC) && (procExtra & PROC_EX_PERIODIC_POSITIVE))
            return false;

        // No extra req, so can trigger for (damage/healing present) and hit/crit
        if (procExtra & (PROC_EX_NORMAL_HIT | PROC_EX_CRITICAL_HIT))
            return true;
    }
    else // all spells hits here only if resist/reflect/immune/evade/periodic
    {
        // Exist req for PROC_EX_EX_TRIGGER_ALWAYS
        if (procEvent_procEx & PROC_EX_EX_TRIGGER_ALWAYS)
            return true;
        // Exist req for PROC_EX_NO_PERIODIC
        if ((procEvent_procEx & PROC_EX_NO_PERIODIC) && (procFlags & (PROC_FLAG_ON_DO_PERIODIC | PROC_FLAG_ON_TAKE_PERIODIC | PROC_FLAG_SUCCESSFUL_PERIODIC_SPELL_HIT | PROC_FLAG_TAKEN_PERIODIC_SPELL_HIT)))
            return false;
        // Check Extra Requirement like (hit/crit/miss/resist/parry/dodge/block/immune/reflect/absorb and other)
        if (procEvent_procEx & procExtra)
            return true;
    }
    return false;
}

void SpellMgr::LoadSpellGroups()
{
    mSpellSpellGroup.clear();                                  // need for reload case
    mSpellGroupSpell.clear();

    uint32 count = 0;

    //                                                0         1
    QueryResult* result = WorldDatabase.Query("SELECT group_id, spell_id FROM spell_group ORDER BY group_id, group_spell_id, spell_id");
    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded %u spell group definitions", count);
        return;
    }

    std::set<uint32> groups;

    do
    {
        Field *fields = result->Fetch();
        uint32 group_id = fields[0].GetUInt32();
        int32 spell_id = fields[1].GetInt32();

        groups.insert(std::set<uint32>::value_type(group_id));
        mSpellGroupSpell.insert(SpellGroupSpellMap::value_type((SpellGroup)group_id, spell_id));

    }
    while (result->NextRow());

    for (SpellGroupSpellMap::iterator itr = mSpellGroupSpell.begin(); itr != mSpellGroupSpell.end();)
    {
        if (itr->second < 0)
        {
            if (groups.find(abs(itr->second)) == groups.end())
            {
                sLog.outErrorDb("SpellGroup id %u listed in `spell_groups` does not exist", abs(itr->second));
                mSpellGroupSpell.erase(itr++);
            }
            else
                ++itr;
        }
        else
        {
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(itr->second);

            if (!spellInfo)
            {
                sLog.outErrorDb("Spell %u listed in `spell_group` does not exist", itr->second);
                mSpellGroupSpell.erase(itr++);
            }
            // Necessaire pour le fix "Un sort plus puissant est deja actif".
            /*else if (GetSpellRank(itr->second) > 1)
            {
                sLog.outErrorDb("Spell %u listed in `spell_group` is not first rank of spell", itr->second);
                mSpellGroupSpell.erase(itr++);
            }*/
            else
                ++itr;
        }
    }

    for (std::set<uint32>::iterator groupItr = groups.begin(); groupItr != groups.end(); ++groupItr)
    {
        std::set<uint32> spells;
        GetSetOfSpellsInSpellGroup(SpellGroup(*groupItr), spells);

        for (std::set<uint32>::iterator spellItr = spells.begin(); spellItr != spells.end(); ++spellItr)
        {
            ++count;
            mSpellSpellGroup.insert(SpellSpellGroupMap::value_type(*spellItr, SpellGroup(*groupItr)));
        }
    }
    delete result;
    sLog.outString();
    sLog.outString(">> Loaded %u spell group definitions", count);
}

void SpellMgr::LoadSpellGroupStackRules()
{
    mSpellGroupStack.clear();                                  // need for reload case

    uint32 count = 0;

    //                                                       0         1
    QueryResult* result = WorldDatabase.Query("SELECT group_id, stack_rule FROM spell_group_stack_rules");
    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded %u spell group stack rules", count);
        return;
    }

    do
    {
        Field *fields = result->Fetch();

        uint32 group_id = fields[0].GetUInt32();
        uint8 stack_rule = fields[1].GetUInt32();
        if (stack_rule >= SPELL_GROUP_STACK_RULE_MAX)
        {
            sLog.outErrorDb("SpellGroupStackRule %u listed in `spell_group_stack_rules` does not exist", stack_rule);
            continue;
        }

        SpellGroupSpellMapBounds spellGroup = GetSpellGroupSpellMapBounds((SpellGroup)group_id);

        if (spellGroup.first == spellGroup.second)
        {
            sLog.outErrorDb("SpellGroup id %u listed in `spell_group_stack_rules` does not exist", group_id);
            continue;
        }

        mSpellGroupStack[(SpellGroup)group_id] = (SpellGroupStackRule)stack_rule;

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell group stack rules", count);
}

bool SpellMgr::ListMorePowerfullSpells(uint32 spellId, std::list<uint32>& list) const
{
    std::vector<uint32> spellGroupIds;
    std::vector<uint32>::iterator spellGroupIdsIt;
    // first = groupid, second = spellId
    for (SpellGroupSpellMap::const_iterator itr = mSpellGroupSpell.begin(); itr != mSpellGroupSpell.end(); ++itr)
    {
        if (itr->second == spellId)
        {
            // Un sort peut etre dans plusieurs groupes. On s'interesse au groupe 'SPELL_GROUP_STACK_RULE_POWERFULL_CHAIN'
            SpellGroupStackMap::const_iterator found = mSpellGroupStack.find(itr->first);
            // Ce groupe n'a pas de regle ... Pas d'entree dans 'spell_group_stack_rule' ?
            if (found == mSpellGroupStack.end())
                continue;
            SpellGroupStackRule stackRule = found->second;
            if (stackRule == SPELL_GROUP_STACK_RULE_POWERFULL_CHAIN)
            {
                spellGroupIds.push_back(itr->first);
            }
        }
    }
    if (spellGroupIds.size() == 0)
        return false;
    for (spellGroupIdsIt = spellGroupIds.begin(); spellGroupIdsIt != spellGroupIds.end(); ++spellGroupIdsIt)
    {
        bool spellPassed = false;
        for (SpellGroupSpellMap::const_iterator itr = mSpellGroupSpell.begin(); itr != mSpellGroupSpell.end(); ++itr)
        {
            if (itr->first != *(spellGroupIdsIt))
                continue;
            if (!spellPassed)
            {
                if (itr->second == spellId)
                    spellPassed = true;
                continue;
            }
            list.push_back(itr->second);
        }
        MANGOS_ASSERT(spellPassed == true);
    }
    return !list.empty();
}

bool SpellMgr::ListLessPowerfullSpells(uint32 spellId, std::list<uint32>& list) const
{
    std::vector<uint32> spellGroupIds;
    std::vector<uint32>::iterator spellGroupIdsIt;
    // first = groupid, second = spellId
    for (SpellGroupSpellMap::const_iterator itr = mSpellGroupSpell.begin(); itr != mSpellGroupSpell.end(); ++itr)
    {
        if (itr->second == spellId)
        {
            // Un sort peut etre dans plusieurs groupes. On s'interesse au groupe 'SPELL_GROUP_STACK_RULE_POWERFULL_CHAIN'
            SpellGroupStackMap::const_iterator found = mSpellGroupStack.find(itr->first);
            // Ce groupe n'a pas de regle ... Pas d'entree dans 'spell_group_stack_rule' ?
            if (found == mSpellGroupStack.end())
                continue;
            SpellGroupStackRule stackRule = found->second;
            if (stackRule == SPELL_GROUP_STACK_RULE_POWERFULL_CHAIN)
            {
                spellGroupIds.push_back(itr->first);
            }
        }
    }
    if (spellGroupIds.size() == 0)
        return false;
    for (spellGroupIdsIt = spellGroupIds.begin(); spellGroupIdsIt != spellGroupIds.end(); ++spellGroupIdsIt)
    {
        for (SpellGroupSpellMap::const_iterator itr = mSpellGroupSpell.begin(); itr != mSpellGroupSpell.end(); ++itr)
        {
            if (itr->first != *(spellGroupIdsIt))
                continue;
            if (itr->second == spellId)
                break;
            list.push_back(itr->second);
        }
    }
    return !list.empty();
}

void SpellMgr::LoadSpellElixirs()
{
    mSpellElixirs.clear();                                  // need for reload case

    uint32 count = 0;

    //                                                0      1
    QueryResult *result = WorldDatabase.Query("SELECT entry, mask FROM spell_elixir");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell elixir definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();
        uint8 mask = fields[1].GetUInt8();

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(entry);

        if (!spellInfo)
        {
            sLog.outErrorDb("Spell %u listed in `spell_elixir` does not exist", entry);
            continue;
        }

        mSpellElixirs[entry] = mask;

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell elixir definitions", count);
}

struct DoSpellThreat
{
    DoSpellThreat(SpellThreatMap& _threatMap) : threatMap(_threatMap), count(0) {}
    void operator()(uint32 spell_id)
    {
        SpellThreatEntry const &ste = state->second;
        // add ranks only for not filled data (spells adding flat threat are usually different for ranks)
        SpellThreatMap::const_iterator spellItr = threatMap.find(spell_id);
        if (spellItr == threatMap.end())
            threatMap[spell_id] = ste;

        // just assert that entry is not redundant
        else
        {
            SpellThreatEntry const& r_ste = spellItr->second;
            if (ste.threat == r_ste.threat && ste.multiplier == r_ste.multiplier && ste.ap_bonus == r_ste.ap_bonus)
                sLog.outErrorDb("Spell %u listed in `spell_threat` as custom rank has same data as Rank 1, so redundant", spell_id);
        }
    }
    const char* TableName()
    {
        return "spell_threat";
    }
    bool IsValidCustomRank(SpellThreatEntry const &ste, uint32 entry, uint32 first_id)
    {
        if (!ste.threat)
        {
            sLog.outErrorDb("Spell %u listed in `spell_threat` is not first rank (%u) in chain and has no threat", entry, first_id);
            // prevent loading unexpected data
            return false;
        }
        return true;
    }
    void AddEntry(SpellThreatEntry const &ste, SpellEntry const *spell)
    {
        threatMap[spell->Id] = ste;

        // flat threat bonus and attack power bonus currently only work properly when all
        // effects have same targets, otherwise, we'd need to seperate it by effect index
        if (ste.threat || ste.ap_bonus != 0.f)
        {
            const uint32 *targetA = spell->EffectImplicitTargetA;
            if ((targetA[EFFECT_INDEX_1] && targetA[EFFECT_INDEX_1] != targetA[EFFECT_INDEX_0]) ||
                    (targetA[EFFECT_INDEX_2] && targetA[EFFECT_INDEX_2] != targetA[EFFECT_INDEX_0]))
                sLog.outErrorDb("Spell %u listed in `spell_threat` has effects with different targets, threat may be assigned incorrectly", spell->Id);
        }
        ++count;
    }
    bool HasEntry(uint32 spellId)
    {
        return threatMap.count(spellId) > 0;
    }
    bool SetStateToEntry(uint32 spellId)
    {
        return (state = threatMap.find(spellId)) != threatMap.end();
    }

    SpellThreatMap& threatMap;
    SpellThreatMap::const_iterator state;
    uint32 count;
};

void SpellMgr::LoadSpellThreats()
{
    mSpellThreatMap.clear();                                // need for reload case

    //                                                0      1       2           3
    QueryResult *result = WorldDatabase.Query("SELECT entry, Threat, multiplier, ap_bonus FROM spell_threat");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> No spell threat entries loaded.");
        return;
    }

    SpellRankHelper<SpellThreatEntry, DoSpellThreat, SpellThreatMap> rankHelper(*this, mSpellThreatMap);

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();

        SpellThreatEntry ste;
        ste.threat = fields[1].GetUInt16();
        ste.multiplier = fields[2].GetFloat();
        ste.ap_bonus = fields[3].GetFloat();

        rankHelper.RecordRank(ste, entry);

    }
    while (result->NextRow());

    rankHelper.FillHigherRanks();

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell threat entries", rankHelper.worker.count);
}

bool SpellMgr::IsRankSpellDueToSpell(SpellEntry const *spellInfo_1, uint32 spellId_2) const
{
    SpellEntry const *spellInfo_2 = sSpellMgr.GetSpellEntry(spellId_2);
    if (!spellInfo_1 || !spellInfo_2) return false;
    if (spellInfo_1->Id == spellId_2) return false;
    // Nostalrius : Check generique.
    if (spellInfo_1->SpellFamilyName == spellInfo_2->SpellFamilyName &&
        spellInfo_1->SpellFamilyFlags == spellInfo_2->SpellFamilyFlags &&
        spellInfo_1->SpellIconID == spellInfo_2->SpellIconID &&
        spellInfo_1->SpellVisual == spellInfo_2->SpellVisual &&
        spellInfo_1->SpellFamilyName != SPELLFAMILY_GENERIC &&
        spellInfo_1->Effect[0] == spellInfo_2->Effect[0] &&
        spellInfo_1->EffectApplyAuraName[0] == spellInfo_2->EffectApplyAuraName[0] &&
        spellInfo_1->SpellIconID > 1 &&
        (spellInfo_1->EffectApplyAuraName[0] != SPELL_AURA_ADD_FLAT_MODIFIER ||
         spellInfo_1->EffectMiscValue[0] == spellInfo_2->EffectMiscValue[0]))
    {
        // Same modifier but it affects different spells
        if (spellInfo_1->EffectApplyAuraName[0] == SPELL_AURA_ADD_FLAT_MODIFIER &&
            spellInfo_1->EffectItemType[0] != 0 && spellInfo_2->EffectItemType[0] != 0 &&
            !(spellInfo_1->EffectItemType[0] & spellInfo_2->EffectItemType[0]))
        {
            return GetFirstSpellInChain(spellInfo_1->Id) == GetFirstSpellInChain(spellId_2);
        }

        return true;
    }

    return GetFirstSpellInChain(spellInfo_1->Id) == GetFirstSpellInChain(spellId_2);
}

bool SpellMgr::canStackSpellRanksInSpellBook(SpellEntry const *spellInfo) const
{
    if (IsPassiveSpell(spellInfo))                          // ranked passive spell
        return false;
    if (spellInfo->powerType != POWER_MANA && spellInfo->powerType != POWER_HEALTH)
        return false;
    if (IsProfessionOrRidingSpell(spellInfo->Id))
        return false;

    if (IsSkillBonusSpell(spellInfo->Id))
        return false;

    // All stance spells. if any better way, change it.
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch (spellInfo->SpellFamilyName)
        {
            case SPELLFAMILY_PALADIN:
                // Paladin aura Spell
                if (spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AREA_AURA_PARTY)
                    return false;
                break;
            case SPELLFAMILY_DRUID:
                // Druid form Spell
                if (spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AURA &&
                        spellInfo->EffectApplyAuraName[i] == SPELL_AURA_MOD_SHAPESHIFT)
                    return false;
                break;
            case SPELLFAMILY_ROGUE:
                // Rogue Stealth
                if (spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AURA &&
                        spellInfo->EffectApplyAuraName[i] == SPELL_AURA_MOD_SHAPESHIFT)
                    return false;
                break;
        }
    }
    return true;
}

bool SpellMgr::IsNoStackSpellDueToSpell(uint32 spellId_1, uint32 spellId_2) const
{
    SpellGroup unused;
    if (CheckSpellGroupStackRules(spellId_1, spellId_2, unused) != SPELL_GROUP_STACK_RULE_DEFAULT)
    {
        DETAIL_LOG("[STACK][%u/%u] Pas de stack (DB/spell_group)", spellId_1, spellId_2);
        return false;
    }

    SpellEntry const *spellInfo_1 = sSpellMgr.GetSpellEntry(spellId_1);
    SpellEntry const *spellInfo_2 = sSpellMgr.GetSpellEntry(spellId_2);

    if (!spellInfo_1 || !spellInfo_2)
        return false;

    if (spellId_1 == spellId_2)
        return false;

    // Resurrection sickness
    if ((spellInfo_1->Id == SPELL_ID_PASSIVE_RESURRECTION_SICKNESS) != (spellInfo_2->Id == SPELL_ID_PASSIVE_RESURRECTION_SICKNESS))
        return false;

    // Allow stack passive and not passive spells
    if ((spellInfo_1->Attributes & SPELL_ATTR_PASSIVE) != (spellInfo_2->Attributes & SPELL_ATTR_PASSIVE))
        return false;

    // Specific spell family spells
    switch (spellInfo_1->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
            switch (spellInfo_2->SpellFamilyName)
            {
                case SPELLFAMILY_GENERIC:                   // same family case
                {
                    // Thunderfury
                    if ((spellInfo_1->Id == 21992 && spellInfo_2->Id == 27648) ||
                            (spellInfo_2->Id == 21992 && spellInfo_1->Id == 27648))
                        return false;

                    // Soulstone Resurrection and Twisting Nether (resurrector)
                    if (spellInfo_1->SpellIconID == 92 && spellInfo_2->SpellIconID == 92 && (
                                (spellInfo_1->SpellVisual == 99 && spellInfo_2->SpellVisual == 0) ||
                                (spellInfo_2->SpellVisual == 99 && spellInfo_1->SpellVisual == 0)))
                        return false;

                    // Heart of the Wild and (Primal Instinct (Idol of Terror) triggering spell or Agility)
                    if (spellInfo_1->SpellIconID == 240 && spellInfo_2->SpellIconID == 240 && (
                                (spellInfo_1->SpellVisual == 0 && spellInfo_2->SpellVisual == 78) ||
                                (spellInfo_2->SpellVisual == 0 && spellInfo_1->SpellVisual == 78)))
                        return false;

                    // Personalized Weather (thunder effect should overwrite rainy aura)
                    if (spellInfo_1->SpellIconID == 2606 && spellInfo_2->SpellIconID == 2606)
                        return false;

                    // Brood Affliction: Bronze
                    if ((spellInfo_1->Id == 23170 && spellInfo_2->Id == 23171) ||
                            (spellInfo_2->Id == 23170 && spellInfo_1->Id == 23171))
                        return false;

                    // Regular and Night Elf Ghost
                    if ((spellInfo_1->Id == 8326 && spellInfo_2->Id == 20584) ||
                            (spellInfo_2->Id == 8326 && spellInfo_1->Id == 20584))
                        return false;

                    break;
                }
                case SPELLFAMILY_MAGE:
                    // Arcane Intellect and Insight
                    if (spellInfo_2->SpellIconID == 125 && spellInfo_1->Id == 18820)
                        return false;
                    break;
                case SPELLFAMILY_WARRIOR:
                {
                    // Scroll of Protection and Defensive Stance (multi-family check)
                    if (spellInfo_1->SpellIconID == 276 && spellInfo_1->SpellVisual == 196 && spellInfo_2->Id == 71)
                        return false;

                    // Improved Hamstring -> Hamstring (multi-family check)
                    if ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x2)) && spellInfo_1->Id == 23694)
                        return false;
                    break;
                }
                case SPELLFAMILY_DRUID:
                {
                    // Scroll of Stamina and Leader of the Pack (multi-family check)
                    if (spellInfo_1->SpellIconID == 312 && spellInfo_1->SpellVisual == 216 && spellInfo_2->Id == 24932)
                        return false;
                    break;
                }
                case SPELLFAMILY_ROGUE:
                {
                    // Garrote-Silence -> Garrote (multi-family check)
                    if (spellInfo_1->SpellIconID == 498 && spellInfo_1->SpellVisual == 0 && spellInfo_2->SpellIconID == 498)
                        return false;

                    break;
                }
                case SPELLFAMILY_HUNTER:
                {
                    // Concussive Shot and Imp. Concussive Shot (multi-family check)
                    if (spellInfo_1->Id == 19410 && spellInfo_2->Id == 5116)
                        return false;

                    // Improved Wing Clip -> Wing Clip (multi-family check)
                    if ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x40)) && spellInfo_1->Id == 19229)
                        return false;
                    break;
                }
                case SPELLFAMILY_PALADIN:
                {
                    // Unstable Currents and other -> *Sanctity Aura (multi-family check)
                    if (spellInfo_2->SpellIconID == 502 && spellInfo_1->SpellIconID == 502 && spellInfo_1->SpellVisual == 969)
                        return false;
                    break;
                }
            }
            break;
        case SPELLFAMILY_MAGE:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_MAGE)
            {
                // Explosion pyrotechnique / boule de feu
                if ((spellInfo_1->SpellIconID == 184 && spellInfo_2->SpellIconID == 185) ||
                        (spellInfo_2->SpellIconID == 184 && spellInfo_1->SpellIconID == 185))
                    return false;

                // Blizzard & Chilled (and some other stacked with blizzard spells
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x80)) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x100000))) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x80)) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x100000))))
                    return false;

                // Blink & Improved Blink
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x0000000000010000)) && (spellInfo_2->SpellVisual == 72 && spellInfo_2->SpellIconID == 1499)) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x0000000000010000)) && (spellInfo_1->SpellVisual == 72 && spellInfo_1->SpellIconID == 1499)))
                    return false;

                // Fireball & Pyroblast (Dots)
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x1)) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x400000))) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x1)) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x400000))))
                    return false;
            }
            // Detect Invisibility and Mana Shield (multi-family check)
            if (spellInfo_2->Id == 132 && spellInfo_1->SpellIconID == 209 && spellInfo_1->SpellVisual == 968)
                return false;

            // Combustion and Fire Protection Aura (multi-family check)
            if (spellInfo_1->Id == 11129 && spellInfo_2->SpellIconID == 33 && spellInfo_2->SpellVisual == 321)
                return false;

            // Arcane Intellect and Insight
            if (spellInfo_1->SpellIconID == 125 && spellInfo_2->Id == 18820)
                return false;

            break;
        case SPELLFAMILY_WARLOCK:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_WARLOCK)
            {
                // Siphon Life and Drain Life
                if ((spellInfo_1->SpellIconID == 152 && spellInfo_2->SpellIconID == 546) ||
                        (spellInfo_2->SpellIconID == 152 && spellInfo_1->SpellIconID == 546))
                    return false;

                // Corruption and (Curse of Agony or Curse of Doom)
                if ((spellInfo_1->SpellIconID == 313 && (spellInfo_2->SpellIconID == 544  || spellInfo_2->SpellIconID == 91)) ||
                        (spellInfo_2->SpellIconID == 313 && (spellInfo_1->SpellIconID == 544  || spellInfo_1->SpellIconID == 91)))
                    return false;
            }
            // Detect Invisibility and Mana Shield (multi-family check)
            if (spellInfo_1->Id == 132 && spellInfo_2->SpellIconID == 209 && spellInfo_2->SpellVisual == 968)
                return false;
            break;
        case SPELLFAMILY_WARRIOR:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_WARRIOR)
            {
                // Rend and Deep Wound
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x20)) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x1000000000))) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x20)) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x1000000000))))
                    return false;

                // Battle Shout and Rampage
                if ((spellInfo_1->SpellIconID == 456 && spellInfo_2->SpellIconID == 2006) ||
                        (spellInfo_2->SpellIconID == 456 && spellInfo_1->SpellIconID == 2006))
                    return false;

                // Cri demoralisant et cri de guerre
                if ((spellInfo_2->SpellVisual == 246 && spellInfo_1->SpellVisual == 210) || (spellInfo_1->SpellVisual == 246 && spellInfo_2->SpellVisual == 210))
                    return false;
            }

            // Hamstring -> Improved Hamstring (multi-family check)
            if ((spellInfo_1->SpellFamilyFlags & UI64LIT(0x2)) && spellInfo_2->Id == 23694)
                return false;

            // Defensive Stance and Scroll of Protection (multi-family check)
            if (spellInfo_1->Id == 71 && spellInfo_2->SpellIconID == 276 && spellInfo_2->SpellVisual == 196)
                return false;

            // Bloodlust and Bloodthirst (multi-family check)
            if (spellInfo_2->Id == 2825 && spellInfo_1->SpellIconID == 38 && spellInfo_1->SpellVisual == 0)
                return false;

            break;
        case SPELLFAMILY_PRIEST:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_PRIEST)
            {
                //Greater Heal Renew (8/8 transcendence) (and Renew.)
                if (spellId_1==22009 || spellId_2==22009)
                    return false;

                // Shadow Vulnerability / Devouring Plague
                if (spellInfo_1->SpellIconID == spellInfo_2->SpellIconID /* == 9 */ &&
                        ((spellInfo_1->Id == 15258 &&  spellInfo_2->SpellFamilyFlags == 0x2000000) ||
                         (spellInfo_2->Id == 15258 &&  spellInfo_1->SpellFamilyFlags == 0x2000000)))
                    return false;

                //Devouring Plague and Shadow Vulnerability
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x2000000)) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x800000000))) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x2000000)) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x800000000))))
                    return false;

                //StarShards and Shadow Word: Pain
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x200000)) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x8000))) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x200000)) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x8000))))
                    return false;
            }
            break;
        case SPELLFAMILY_DRUID:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_DRUID)
            {
                // Cat Form and Feline Swiftness Passive* (1.x specific conflict)
                if (spellInfo_1->SpellIconID == 493 && spellInfo_2->SpellIconID == 493)
                    return false;

                //Omen of Clarity and Blood Frenzy
                if (((spellInfo_1->SpellFamilyFlags == UI64LIT(0x0) && spellInfo_1->SpellIconID == 108) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x20000000000000))) ||
                        ((spellInfo_2->SpellFamilyFlags == UI64LIT(0x0) && spellInfo_2->SpellIconID == 108) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x20000000000000))))
                    return false;
            }

            // Leader of the Pack and Scroll of Stamina (multi-family check)
            if (spellInfo_1->Id == 24932 && spellInfo_2->SpellIconID == 312 && spellInfo_2->SpellVisual == 216)
                return false;

            break;
        case SPELLFAMILY_ROGUE:
            // Garrote -> Garrote-Silence (multi-family check)
            if (spellInfo_1->SpellIconID == 498 && spellInfo_2->SpellIconID == 498 && spellInfo_2->SpellVisual == 0)
                return false;
            break;
        case SPELLFAMILY_HUNTER:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_HUNTER)
            {
                // Rapid Fire & Quick Shots
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x20)) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x20000000000))) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x20)) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x20000000000))))
                    return false;

                // Serpent Sting & (Immolation/Explosive Trap Effect)
                if (((spellInfo_1->SpellFamilyFlags & UI64LIT(0x4)) && (spellInfo_2->SpellFamilyFlags & UI64LIT(0x00000004000))) ||
                        ((spellInfo_2->SpellFamilyFlags & UI64LIT(0x4)) && (spellInfo_1->SpellFamilyFlags & UI64LIT(0x00000004000))))
                    return false;

                // Bestial Wrath
                if (spellInfo_1->SpellIconID == 1680 && spellInfo_2->SpellIconID == 1680)
                    return false;
            }

            // Wing Clip -> Improved Wing Clip (multi-family check)
            if ((spellInfo_1->SpellFamilyFlags & UI64LIT(0x40)) && spellInfo_2->Id == 19229)
                return false;

            // Concussive Shot and Imp. Concussive Shot (multi-family check)
            if (spellInfo_2->Id == 19410 && spellInfo_1->Id == 5116)
                return false;
            break;
        case SPELLFAMILY_PALADIN:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_PALADIN)
            {
                // Paladin Seals
                if (IsSealSpell(spellInfo_1) && IsSealSpell(spellInfo_2))
                    return true;
                // Concentration Aura and Improved Concentration Aura and Aura Mastery
                if ((spellInfo_1->SpellIconID == 1487) && (spellInfo_2->SpellIconID == 1487))
                    return false;
            }

            // Combustion and Fire Protection Aura (multi-family check)
            if (spellInfo_2->Id == 11129 && spellInfo_1->SpellIconID == 33 && spellInfo_1->SpellVisual == 321)
                return false;

            // *Sanctity Aura -> Unstable Currents and other (multi-family check)
            if (spellInfo_1->SpellIconID == 502 && spellInfo_2->SpellFamilyName == SPELLFAMILY_GENERIC && spellInfo_2->SpellIconID == 502 && spellInfo_2->SpellVisual == 969)
                return false;

            // *Seal of Command and Band of Eternal Champion (multi-family check)
            if (spellInfo_1->SpellIconID == 561 && spellInfo_1->SpellVisual == 7992 && spellId_2 == 35081)
                return false;
            break;
        case SPELLFAMILY_SHAMAN:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_SHAMAN)
            {
                // Windfury weapon
                if (spellInfo_1->SpellIconID == 220 && spellInfo_2->SpellIconID == 220 &&
                        !spellInfo_1->IsFitToFamilyMask(spellInfo_2->SpellFamilyFlags))
                    return false;
            }
            // Bloodlust and Bloodthirst (multi-family check)
            if (spellInfo_1->Id == 2825 && spellInfo_2->SpellIconID == 38 && spellInfo_2->SpellVisual == 0)
                return false;
            break;
        default:
            break;
    }

    // more generic checks
    if (spellInfo_1->SpellIconID == spellInfo_2->SpellIconID &&
            spellInfo_1->SpellIconID != 0 && spellInfo_1->SpellIconID != 1 && // SpellIconID 1 se stack avec tout ...
            spellInfo_1->SpellFamilyName == spellInfo_2->SpellFamilyName &&
            spellInfo_1->SpellVisual == spellInfo_2->SpellVisual &&
            // Generic peut etre, mais un peu debile .. :O
            // Exception :
            spellInfo_1->SpellIconID != 516 && // Sprint ameliore
            IsPositiveSpell(spellInfo_1) == IsPositiveSpell(spellInfo_2) // Jugement n'ecrase pas le sceau en dudu pala-pala
       )
    {
        bool isModifier = false;
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (spellInfo_1->EffectApplyAuraName[i] == SPELL_AURA_ADD_FLAT_MODIFIER ||
                    spellInfo_1->EffectApplyAuraName[i] == SPELL_AURA_ADD_PCT_MODIFIER  ||
                    spellInfo_2->EffectApplyAuraName[i] == SPELL_AURA_ADD_FLAT_MODIFIER ||
                    spellInfo_2->EffectApplyAuraName[i] == SPELL_AURA_ADD_PCT_MODIFIER)
                isModifier = true;
        }

        if (!isModifier)
        {
            DETAIL_LOG("[STACK][%u/%u] Meme icone et non modifier.", spellId_1, spellId_2);
            return true;
        }
    }

    if (IsRankSpellDueToSpell(spellInfo_1, spellId_2))
    {
        DETAIL_LOG("[STACK][%u/%u] IsRankSpellDueToSpell", spellId_1, spellId_2);
        return true;
    }

    if (spellInfo_1->SpellFamilyName == 0 || spellInfo_2->SpellFamilyName == 0)
        return false;

    if (spellInfo_1->SpellFamilyName != spellInfo_2->SpellFamilyName)
        return false;

    // Nostalrius: potions fonctionnent autrement.
    if (spellInfo_1->SpellFamilyName == SPELLFAMILY_POTION)
        return false;

    bool dummy_only = true;
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (spellInfo_1->Effect[i] != spellInfo_2->Effect[i] ||
                spellInfo_1->EffectItemType[i] != spellInfo_2->EffectItemType[i] ||
                spellInfo_1->EffectMiscValue[i] != spellInfo_2->EffectMiscValue[i] ||
                spellInfo_1->EffectApplyAuraName[i] != spellInfo_2->EffectApplyAuraName[i])
            return false;

        // ignore dummy only spells
        if (spellInfo_1->Effect[i] && spellInfo_1->Effect[i] != SPELL_EFFECT_DUMMY && spellInfo_1->EffectApplyAuraName[i] != SPELL_AURA_DUMMY)
            dummy_only = false;
    }
    if (dummy_only)
        return false;

    DETAIL_LOG("[STACK][%u/%u] not dummy only.", spellId_1, spellId_2);
    return true;
}

bool SpellMgr::IsProfessionOrRidingSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return false;

    if (spellInfo->Effect[1] != SPELL_EFFECT_SKILL)
        return false;

    uint32 skill = spellInfo->EffectMiscValue[1];

    return IsProfessionOrRidingSkill(skill);
}

bool SpellMgr::IsProfessionSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return false;

    if (spellInfo->Effect[EFFECT_INDEX_1] != SPELL_EFFECT_SKILL)
        return false;

    uint32 skill = spellInfo->EffectMiscValue[EFFECT_INDEX_1];

    return IsProfessionSkill(skill);
}

bool SpellMgr::IsPrimaryProfessionSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return false;

    if (spellInfo->Effect[EFFECT_INDEX_1] != SPELL_EFFECT_SKILL)
        return false;

    uint32 skill = spellInfo->EffectMiscValue[EFFECT_INDEX_1];

    return IsPrimaryProfessionSkill(skill);
}

bool SpellMgr::IsPrimaryProfessionFirstRankSpell(uint32 spellId) const
{
    return IsPrimaryProfessionSpell(spellId) && GetSpellRank(spellId) == 1;
}

bool SpellMgr::IsSkillBonusSpell(uint32 spellId) const
{
    SkillLineAbilityMapBounds bounds = GetSkillLineAbilityMapBounds(spellId);

    for (SkillLineAbilityMap::const_iterator _spell_idx = bounds.first; _spell_idx != bounds.second; ++_spell_idx)
    {
        SkillLineAbilityEntry const *pAbility = _spell_idx->second;
        if (!pAbility || pAbility->learnOnGetSkill != ABILITY_LEARNED_ON_GET_PROFESSION_SKILL)
            continue;

        if (pAbility->req_skill_value > 0)
            return true;
    }

    return false;
}

SpellEntry const* SpellMgr::SelectAuraRankForLevel(SpellEntry const* spellInfo, uint32 level) const
{
    // fast case
    if (level + 10 >= spellInfo->spellLevel)
        return spellInfo;

    // ignore selection for passive spells
    if (IsPassiveSpell(spellInfo))
        return spellInfo;

    bool needRankSelection = false;
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        // for simple aura in check apply to any non caster based targets, in rank search mode to any explicit targets
        if (((spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AURA &&
                (IsExplicitPositiveTarget(spellInfo->EffectImplicitTargetA[i]) ||
                 IsAreaEffectPossitiveTarget(Targets(spellInfo->EffectImplicitTargetA[i])))) ||
                spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AREA_AURA_PARTY) &&
                IsPositiveEffect(spellInfo, SpellEffectIndex(i)))
        {
            needRankSelection = true;
            break;
        }
    }

    // not required (rank check more slow so check it here)
    if (!needRankSelection || GetSpellRank(spellInfo->Id) == 0)
        return spellInfo;

    for (uint32 nextSpellId = spellInfo->Id; nextSpellId != 0; nextSpellId = GetPrevSpellInChain(nextSpellId))
    {
        SpellEntry const *nextSpellInfo = sSpellMgr.GetSpellEntry(nextSpellId);
        if (!nextSpellInfo)
            break;

        // if found appropriate level
        if (level + 10 >= spellInfo->spellLevel)
            return nextSpellInfo;

        // one rank less then
    }

    // not found
    return nullptr;
}

typedef UNORDERED_MAP<uint32, uint32> AbilitySpellPrevMap;

static void LoadSpellChains_AbilityHelper(SpellChainMap& chainMap, AbilitySpellPrevMap const& prevRanks, uint32 spell_id, uint32 prev_id, uint32 deep = 30)
{
    // spell already listed in chains store
    SpellChainMap::const_iterator chain_itr = chainMap.find(spell_id);
    if (chain_itr != chainMap.end())
    {
        MANGOS_ASSERT(chain_itr->second.prev == prev_id && "LoadSpellChains_AbilityHelper: Conflicting data in talents or spell abilities dbc");
        return;
    }

    // prev rank listed in main chain table (can fill correct data directly)
    SpellChainMap::const_iterator prev_chain_itr = chainMap.find(prev_id);
    if (prev_chain_itr != chainMap.end())
    {
        SpellChainNode node;
        node.prev  = prev_id;
        node.first = prev_chain_itr->second.first;
        node.rank  = prev_chain_itr->second.rank + 1;
        node.req   = 0;
        chainMap[spell_id] = node;
        return;
    }

    // prev spell not listed in prev ranks store, so it first rank
    AbilitySpellPrevMap::const_iterator prev_itr = prevRanks.find(prev_id);
    if (prev_itr == prevRanks.end())
    {
        SpellChainNode prev_node;
        prev_node.prev  = 0;
        prev_node.first = prev_id;
        prev_node.rank  = 1;
        prev_node.req   = 0;
        chainMap[prev_id] = prev_node;

        SpellChainNode node;
        node.prev  = prev_id;
        node.first = prev_id;
        node.rank  = 2;
        node.req   = 0;
        chainMap[spell_id] = node;
        return;
    }

    if (deep == 0)
    {
        MANGOS_ASSERT(false && "LoadSpellChains_AbilityHelper: Infinity cycle in spell ability data");
        return;
    }

    // prev rank listed, so process it first
    LoadSpellChains_AbilityHelper(chainMap, prevRanks, prev_id, prev_itr->second, deep - 1);

    // prev rank must be listed now
    prev_chain_itr = chainMap.find(prev_id);
    if (prev_chain_itr == chainMap.end())
        return;

    SpellChainNode node;
    node.prev  = prev_id;
    node.first = prev_chain_itr->second.first;
    node.rank  = prev_chain_itr->second.rank + 1;
    node.req   = 0;
    chainMap[spell_id] = node;
}

void SpellMgr::LoadSpellChains()
{
    mSpellChains.clear();                                   // need for reload case
    mSpellChainsNext.clear();                               // need for reload case

    // load known data for talents
    for (unsigned int i = 0; i < sTalentStore.GetNumRows(); ++i)
    {
        TalentEntry const *talentInfo = sTalentStore.LookupEntry(i);
        if (!talentInfo)
            continue;

        // not add ranks for 1 ranks talents (if exist non ranks spells then it will included in table data)
        if (!talentInfo->RankID[1])
            continue;

        for (int j = 0; j < MAX_TALENT_RANK; j++)
        {
            uint32 spell_id = talentInfo->RankID[j];
            if (!spell_id)
                continue;

            if (!sSpellMgr.GetSpellEntry(spell_id))
            {
                //sLog.outErrorDb("Talent %u not exist as spell",spell_id);
                continue;
            }

            SpellChainNode node;
            node.prev  = (j > 0) ? talentInfo->RankID[j - 1] : 0;
            node.first = talentInfo->RankID[0];
            node.rank  = j + 1;
            node.req   = 0;

            mSpellChains[spell_id] = node;
        }
    }

    // load known data from spell abilities
    {
        // we can calculate ranks only after full data generation
        AbilitySpellPrevMap prevRanks;
        for (SkillLineAbilityMap::const_iterator ab_itr = mSkillLineAbilityMap.begin(); ab_itr != mSkillLineAbilityMap.end(); ++ab_itr)
        {
            uint32 spell_id = ab_itr->first;

            // some forward spells not exist and can be ignored (some outdated data)
            SpellEntry const* spell_entry = sSpellMgr.GetSpellEntry(spell_id);
            if (!spell_entry)                                   // no cases
                continue;

            // ignore spell without forwards (non ranked or missing info in skill abilities)
            uint32 forward_id = ab_itr->second->forward_spellid;

            // by some strange reason < 3.x clients not have forward spell for 2366
            if (spell_id == 2366)                           // Herb Gathering, Apprentice
                forward_id = 2368;

            // Seal of Righteousness (20154) make double in spellbook
            if (spell_id == 20154)
                continue;

            if (!forward_id)
                continue;

            // some forward spells not exist and can be ignored (some outdated data)
            SpellEntry const* forward_entry = sSpellMgr.GetSpellEntry(forward_id);
            if (!forward_entry)
                continue;

            // some forward spells still exist but excluded from real use as ranks and not listed in skill abilities now
            SkillLineAbilityMapBounds bounds = mSkillLineAbilityMap.equal_range(forward_id);
            if (bounds.first == bounds.second)
                continue;

            // spell already listed in chains store
            SpellChainMap::const_iterator chain_itr = mSpellChains.find(forward_id);
            if (chain_itr != mSpellChains.end())
            {
                MANGOS_ASSERT(chain_itr->second.prev == spell_id && "Conflicting data in talents or spell abilities dbc");
                continue;
            }

            // spell already listed in prev ranks store
            AbilitySpellPrevMap::const_iterator prev_itr = prevRanks.find(forward_id);
            if (prev_itr != prevRanks.end())
            {
                MANGOS_ASSERT(prev_itr->second == spell_id && "Conflicting data in talents or spell abilities dbc");
                continue;
            }

            // prev rank listed in main chain table (can fill correct data directly)
            SpellChainMap::const_iterator prev_chain_itr = mSpellChains.find(spell_id);
            if (prev_chain_itr != mSpellChains.end())
            {
                SpellChainNode node;
                node.prev  = spell_id;
                node.first = prev_chain_itr->second.first;
                node.rank  = prev_chain_itr->second.rank + 1;
                node.req   = 0;

                mSpellChains[forward_id] = node;
                continue;
            }

            // need temporary store for later rank calculation
            prevRanks[forward_id] = spell_id;
        }

        while (!prevRanks.empty())
        {
            uint32 spell_id = prevRanks.begin()->first;
            uint32 prev_id  = prevRanks.begin()->second;
            prevRanks.erase(prevRanks.begin());

            LoadSpellChains_AbilityHelper(mSpellChains, prevRanks, spell_id, prev_id);
        }
    }

    // load custom case
    QueryResult *result = WorldDatabase.Query("SELECT spell_id, prev_spell, first_spell, rank, req_spell FROM spell_chain");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 spell chain records");
        sLog.outErrorDb("`spell_chains` table is empty!");
        return;
    }

    uint32 dbc_count = mSpellChains.size();
    uint32 new_count = 0;
    uint32 req_count = 0;

    BarGoLink bar(result->GetRowCount());
    do
    {
        bar.step();
        Field *fields = result->Fetch();

        uint32 spell_id = fields[0].GetUInt32();

        SpellChainNode node;
        node.prev  = fields[1].GetUInt32();
        node.first = fields[2].GetUInt32();
        node.rank  = fields[3].GetUInt8();
        node.req   = fields[4].GetUInt32();

        if (!sSpellMgr.GetSpellEntry(spell_id))
        {
            sLog.outErrorDb("Spell %u listed in `spell_chain` does not exist", spell_id);
            continue;
        }

        SpellChainMap::iterator chain_itr = mSpellChains.find(spell_id);
        if (chain_itr != mSpellChains.end())
        {
            if (chain_itr->second.rank != node.rank)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` expected rank %u by DBC data.",
                                spell_id, node.prev, node.first, node.rank, node.req, chain_itr->second.rank);
                continue;
            }

            if (chain_itr->second.prev != node.prev)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` expected prev %u by DBC data.",
                                spell_id, node.prev, node.first, node.rank, node.req, chain_itr->second.prev);
                continue;
            }

            if (chain_itr->second.first != node.first)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` expected first %u by DBC data.",
                                spell_id, node.prev, node.first, node.rank, node.req, chain_itr->second.first);
                continue;
            }

            // update req field by table data
            if (node.req)
            {
                chain_itr->second.req = node.req;
                ++req_count;
                continue;
            }

            // in other case redundant
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) already added (talent or spell ability with forward) and non need in `spell_chain`",
                            spell_id, node.prev, node.first, node.rank, node.req);
            continue;
        }

        if (node.prev != 0 && !sSpellMgr.GetSpellEntry(node.prev))
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has nonexistent previous rank spell.",
                            spell_id, node.prev, node.first, node.rank, node.req);
            continue;
        }

        if (!sSpellMgr.GetSpellEntry(node.first))
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not existing first rank spell.",
                            spell_id, node.prev, node.first, node.rank, node.req);
            continue;
        }

        // check basic spell chain data integrity (note: rank can be equal 0 or 1 for first/single spell)
        if ((spell_id == node.first) != (node.rank <= 1) ||
                (spell_id == node.first) != (node.prev == 0) ||
                (node.rank <= 1) != (node.prev == 0))
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not compatible chain data.",
                            spell_id, node.prev, node.first, node.rank, node.req);
            continue;
        }

        if (node.req != 0 && !sSpellMgr.GetSpellEntry(node.req))
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not existing required spell.",
                            spell_id, node.prev, node.first, node.rank, node.req);
            continue;
        }

        // talents not required data in spell chain for work, but must be checked if present for integrity
        if (TalentSpellPos const* pos = GetTalentSpellPos(spell_id))
        {
            if (node.rank != pos->rank + 1)
            {
                sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong rank.",
                                spell_id, node.prev, node.first, node.rank, node.req);
                continue;
            }

            if (TalentEntry const* talentEntry = sTalentStore.LookupEntry(pos->talent_id))
            {
                if (node.first != talentEntry->RankID[0])
                {
                    sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong first rank spell.",
                                    spell_id, node.prev, node.first, node.rank, node.req);
                    continue;
                }

                if (node.rank > 1 && node.prev != talentEntry->RankID[node.rank - 1 - 1])
                {
                    sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong prev rank spell.",
                                    spell_id, node.prev, node.first, node.rank, node.req);
                    continue;
                }

                if (node.req != talentEntry->DependsOnSpell)
                {
                    sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong required spell.",
                                    spell_id, node.prev, node.first, node.rank, node.req);
                    continue;
                }
            }
        }

        mSpellChains[spell_id] = node;

        ++new_count;
    }
    while (result->NextRow());

    delete result;

    // additional integrity checks
    for (SpellChainMap::const_iterator i = mSpellChains.begin(); i != mSpellChains.end(); ++i)
    {
        if (i->second.prev)
        {
            SpellChainMap::const_iterator i_prev = mSpellChains.find(i->second.prev);
            if (i_prev == mSpellChains.end())
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not found previous rank spell in table.",
                                i->first, i->second.prev, i->second.first, i->second.rank, i->second.req);
            }
            else if (i_prev->second.first != i->second.first)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has different first spell in chain compared to previous rank spell (prev: %u, first: %u, rank: %d, req: %u).",
                                i->first, i->second.prev, i->second.first, i->second.rank, i->second.req,
                                i_prev->second.prev, i_prev->second.first, i_prev->second.rank, i_prev->second.req);
            }
            else if (i_prev->second.rank + 1 != i->second.rank)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has different rank compared to previous rank spell (prev: %u, first: %u, rank: %d, req: %u).",
                                i->first, i->second.prev, i->second.first, i->second.rank, i->second.req,
                                i_prev->second.prev, i_prev->second.first, i_prev->second.rank, i_prev->second.req);
            }
        }

        if (i->second.req)
        {
            SpellChainMap::const_iterator i_req = mSpellChains.find(i->second.req);
            if (i_req == mSpellChains.end())
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not found required rank spell in table.",
                                i->first, i->second.prev, i->second.first, i->second.rank, i->second.req);
            }
            else if (i_req->second.first == i->second.first)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has required rank spell from same spell chain (prev: %u, first: %u, rank: %d, req: %u).",
                                i->first, i->second.prev, i->second.first, i->second.rank, i->second.req,
                                i_req->second.prev, i_req->second.first, i_req->second.rank, i_req->second.req);
            }
            else if (i_req->second.req)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has required rank spell with required spell (prev: %u, first: %u, rank: %d, req: %u).",
                                i->first, i->second.prev, i->second.first, i->second.rank, i->second.req,
                                i_req->second.prev, i_req->second.first, i_req->second.rank, i_req->second.req);
            }
        }
    }

    // fill next rank cache
    for (SpellChainMap::const_iterator i = mSpellChains.begin(); i != mSpellChains.end(); ++i)
    {
        uint32 spell_id = i->first;
        SpellChainNode const& node = i->second;

        if (node.prev)
            mSpellChainsNext.insert(SpellChainMapNext::value_type(node.prev, spell_id));

        if (node.req)
            mSpellChainsNext.insert(SpellChainMapNext::value_type(node.req, spell_id));
    }

    // check single rank redundant cases (single rank talents not added by default so this can be only custom cases)
    for (SpellChainMap::const_iterator i = mSpellChains.begin(); i != mSpellChains.end(); ++i)
    {
        // skip non-first ranks, and spells with additional reqs
        if (i->second.rank > 1 || i->second.req)
            continue;

        if (mSpellChainsNext.find(i->first) == mSpellChainsNext.end())
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has single rank data, so redundant.",
                            i->first, i->second.prev, i->second.first, i->second.rank, i->second.req);
        }
    }

    sLog.outString();
    sLog.outString(">> Loaded %u spell chain records (%u from DBC data with %u req field updates, and %u loaded from table)", dbc_count + new_count, dbc_count, req_count, new_count);
}

void SpellMgr::LoadSpellLearnSkills()
{
    mSpellLearnSkills.clear();                              // need for reload case

    // search auto-learned skills and add its to map also for use in unlearn spells/talents
    uint32 dbc_count = 0;
    BarGoLink bar(sSpellMgr.GetMaxSpellId());
    for (uint32 spell = 0; spell < sSpellMgr.GetMaxSpellId(); ++spell)
    {
        bar.step();
        SpellEntry const* entry = sSpellMgr.GetSpellEntry(spell);

        if (!entry)
            continue;

        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (entry->Effect[i] == SPELL_EFFECT_SKILL)
            {
                SpellLearnSkillNode dbc_node;
                dbc_node.skill    = entry->EffectMiscValue[i];
                dbc_node.step     = entry->CalculateSimpleValue(SpellEffectIndex(i));
                if (dbc_node.skill != SKILL_RIDING)
                    dbc_node.value = 1;
                else
                    dbc_node.value = dbc_node.step * 75;
                dbc_node.maxvalue = dbc_node.step * 75;

                mSpellLearnSkills[spell] = dbc_node;
                ++dbc_count;
                break;
            }
        }
    }

    sLog.outString();
    sLog.outString(">> Loaded %u Spell Learn Skills from DBC", dbc_count);
}

void SpellMgr::LoadSpellLearnSpells()
{
    mSpellLearnSpells.clear();                              // need for reload case

    //                                                0      1        2
    QueryResult *result = WorldDatabase.Query("SELECT entry, SpellID, Active FROM spell_learn_spell");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 spell learn spells");
        sLog.outErrorDb("`spell_learn_spell` table is empty!");
        return;
    }

    uint32 count = 0;

    BarGoLink bar(result->GetRowCount());
    do
    {
        bar.step();
        Field *fields = result->Fetch();

        uint32 spell_id    = fields[0].GetUInt32();

        SpellLearnSpellNode node;
        node.spell      = fields[1].GetUInt32();
        node.active     = fields[2].GetBool();
        node.autoLearned = false;

        if (!sSpellMgr.GetSpellEntry(spell_id))
        {
            sLog.outErrorDb("Spell %u listed in `spell_learn_spell` does not exist", spell_id);
            continue;
        }

        if (!sSpellMgr.GetSpellEntry(node.spell))
        {
            sLog.outErrorDb("Spell %u listed in `spell_learn_spell` learning nonexistent spell %u", spell_id, node.spell);
            continue;
        }

        if (GetTalentSpellCost(node.spell))
        {
            sLog.outErrorDb("Spell %u listed in `spell_learn_spell` attempt learning talent spell %u, skipped", spell_id, node.spell);
            continue;
        }

        mSpellLearnSpells.insert(SpellLearnSpellMap::value_type(spell_id, node));

        ++count;
    }
    while (result->NextRow());

    delete result;

    // search auto-learned spells and add its to map also for use in unlearn spells/talents
    uint32 dbc_count = 0;
    for (uint32 spell = 0; spell < sSpellMgr.GetMaxSpellId(); ++spell)
    {
        SpellEntry const* entry = sSpellMgr.GetSpellEntry(spell);

        if (!entry)
            continue;

        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (entry->Effect[i] == SPELL_EFFECT_LEARN_SPELL)
            {
                SpellLearnSpellNode dbc_node;
                dbc_node.spell       = entry->EffectTriggerSpell[i];
                dbc_node.active      = true;                // all dbc based learned spells is active (show in spell book or hide by client itself)

                // ignore learning nonexistent spells (broken/outdated/or generic learning spell 483
                if (!sSpellMgr.GetSpellEntry(dbc_node.spell))
                    continue;

                // talent or passive spells or skill-step spells auto-casted and not need dependent learning,
                // pet teaching spells don't must be dependent learning (casted)
                // other required explicit dependent learning
                dbc_node.autoLearned = entry->EffectImplicitTargetA[i] == TARGET_PET || GetTalentSpellCost(spell) > 0 || IsPassiveSpell(entry) || IsSpellHaveEffect(entry, SPELL_EFFECT_SKILL_STEP);

                SpellLearnSpellMapBounds db_node_bounds = GetSpellLearnSpellMapBounds(spell);

                bool found = false;
                for (SpellLearnSpellMap::const_iterator itr = db_node_bounds.first; itr != db_node_bounds.second; ++itr)
                {
                    if (itr->second.spell == dbc_node.spell)
                    {
                        sLog.outErrorDb("Spell %u auto-learn spell %u in spell.dbc then the record in `spell_learn_spell` is redundant, please fix DB.",
                                        spell, dbc_node.spell);
                        found = true;
                        break;
                    }
                }

                if (!found)                                 // add new spell-spell pair if not found
                {
                    mSpellLearnSpells.insert(SpellLearnSpellMap::value_type(spell, dbc_node));
                    ++dbc_count;
                }
            }
        }
    }

    sLog.outString();
    sLog.outString(">> Loaded %u spell learn spells + %u found in DBC", count, dbc_count);
}

void SpellMgr::LoadSpellScriptTarget()
{
    mSpellScriptTarget.clear();                             // need for reload case

    uint32 count = 0;

    QueryResult *result = WorldDatabase.Query("SELECT entry,type,targetEntry FROM spell_script_target");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 SpellScriptTarget. DB table `spell_script_target` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 spellId     = fields[0].GetUInt32();
        uint32 type        = fields[1].GetUInt32();
        uint32 targetEntry = fields[2].GetUInt32();

        SpellEntry const* spellProto = sSpellMgr.GetSpellEntry(spellId);

        if (!spellProto)
        {
            sLog.outErrorDb("Table `spell_script_target`: spellId %u listed for TargetEntry %u does not exist.", spellId, targetEntry);
            continue;
        }

        bool targetfound = false;
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (spellProto->EffectImplicitTargetA[i] == TARGET_SCRIPT ||
                    spellProto->EffectImplicitTargetB[i] == TARGET_SCRIPT ||
                    spellProto->EffectImplicitTargetA[i] == TARGET_SCRIPT_COORDINATES ||
                    spellProto->EffectImplicitTargetB[i] == TARGET_SCRIPT_COORDINATES ||
                    spellProto->EffectImplicitTargetA[i] == TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT ||
                    spellProto->EffectImplicitTargetB[i] == TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT ||
                    spellProto->EffectImplicitTargetA[i] == TARGET_AREAEFFECT_INSTANT ||
                    spellProto->EffectImplicitTargetB[i] == TARGET_AREAEFFECT_INSTANT ||
                    spellProto->EffectImplicitTargetA[i] == TARGET_AREAEFFECT_CUSTOM ||
                    spellProto->EffectImplicitTargetB[i] == TARGET_AREAEFFECT_CUSTOM ||
                    spellProto->EffectImplicitTargetA[i] == TARGET_AREAEFFECT_GO_AROUND_DEST ||
                    spellProto->EffectImplicitTargetB[i] == TARGET_AREAEFFECT_GO_AROUND_DEST)
            {
                targetfound = true;
                break;
            }
        }
        if (!targetfound)
        {
            sLog.outErrorDb("Table `spell_script_target`: spellId %u listed for TargetEntry %u does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).", spellId, targetEntry);
            continue;
        }

        if (type >= MAX_SPELL_TARGET_TYPE)
        {
            sLog.outErrorDb("Table `spell_script_target`: target type %u for TargetEntry %u is incorrect.", type, targetEntry);
            continue;
        }

        // Checks by target type
        switch (type)
        {
            case SPELL_TARGET_TYPE_GAMEOBJECT:
            {
                if (!targetEntry)
                    break;

                if (!sGOStorage.LookupEntry<GameObjectInfo>(targetEntry))
                {
                    if (!sObjectMgr.IsExistingGameObjectId(targetEntry))
                        sLog.outErrorDb("Table `spell_script_target`: gameobject template entry %u does not exist.", targetEntry);
                    continue;
                }
                break;
            }
            default:
                if (!targetEntry)
                {
                    sLog.outErrorDb("Table `spell_script_target`: target entry == 0 for not GO target type (%u).", type);
                    continue;
                }
                if (const CreatureInfo* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(targetEntry))
                {
                    if (spellId == 30427 && !cInfo->SkinLootId)
                    {
                        sLog.outErrorDb("Table `spell_script_target` has creature %u as a target of spellid 30427, but this creature has no skinlootid. Gas extraction will not work!", cInfo->Entry);
                        continue;
                    }
                }
                else
                {
                    if (!sObjectMgr.IsExistingCreatureId(targetEntry))
                        sLog.outErrorDb("Table `spell_script_target`: creature template entry %u does not exist.", targetEntry);
                    continue;
                }
                break;
        }

        mSpellScriptTarget.insert(SpellScriptTarget::value_type(spellId, SpellTargetEntry(SpellTargetType(type), targetEntry)));

        ++count;
    }
    while (result->NextRow());

    delete result;

    // Check all spells
    /* Disabled (lot errors at this moment)
    for(uint32 i = 1; i < sSpellMgr.GetMaxSpellId; ++i)
    {
        SpellEntry const * spellInfo = sSpellMgr.GetSpellEntry(i);
        if(!spellInfo)
            continue;

        bool found = false;
        for(int j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if( spellInfo->EffectImplicitTargetA[j] == TARGET_SCRIPT || spellInfo->EffectImplicitTargetA[j] != TARGET_SELF && spellInfo->EffectImplicitTargetB[j] == TARGET_SCRIPT )
            {
                SpellScriptTarget::const_iterator lower = GetBeginSpellScriptTarget(spellInfo->Id);
                SpellScriptTarget::const_iterator upper = GetEndSpellScriptTarget(spellInfo->Id);
                if(lower==upper)
                {
                    sLog.outErrorDb("Spell (ID: %u) has effect EffectImplicitTargetA/EffectImplicitTargetB = %u (TARGET_SCRIPT), but does not have record in `spell_script_target`",spellInfo->Id,TARGET_SCRIPT);
                    break;                                  // effects of spell
                }
            }
        }
    }
    */

    sLog.outString();
    sLog.outString(">> Loaded %u Spell Script Targets", count);
}

void SpellMgr::LoadSpellPetAuras()
{
    mSpellPetAuraMap.clear();                                  // need for reload case

    uint32 count = 0;

    //                                                0      1    2
    QueryResult *result = WorldDatabase.Query("SELECT spell, pet, aura FROM spell_pet_auras");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell pet auras", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 spell = fields[0].GetUInt32();
        uint32 pet = fields[1].GetUInt32();
        uint32 aura = fields[2].GetUInt32();

        SpellPetAuraMap::iterator itr = mSpellPetAuraMap.find(spell);
        if (itr != mSpellPetAuraMap.end())
            itr->second.AddAura(pet, aura);
        else
        {
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spell);
            if (!spellInfo)
            {
                sLog.outErrorDb("Spell %u listed in `spell_pet_auras` does not exist", spell);
                continue;
            }
            int i = 0;
            for (; i < MAX_EFFECT_INDEX; ++i)
                if ((spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AURA &&
                        spellInfo->EffectApplyAuraName[i] == SPELL_AURA_DUMMY) ||
                        spellInfo->Effect[i] == SPELL_EFFECT_DUMMY)
                    break;

            if (i == MAX_EFFECT_INDEX)
            {
                sLog.outError("Spell %u listed in `spell_pet_auras` does not have dummy aura or dummy effect", spell);
                continue;
            }

            SpellEntry const* spellInfo2 = sSpellMgr.GetSpellEntry(aura);
            if (!spellInfo2)
            {
                sLog.outErrorDb("Aura %u listed in `spell_pet_auras` does not exist", aura);
                continue;
            }

            PetAura pa(pet, aura, spellInfo->EffectImplicitTargetA[i] == TARGET_PET, spellInfo->CalculateSimpleValue(SpellEffectIndex(i)));
            mSpellPetAuraMap[spell] = pa;
        }

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell pet auras", count);
}

/// Some checks for spells, to prevent adding deprecated/broken spells for trainers, spell book, etc
bool SpellMgr::IsSpellValid(SpellEntry const* spellInfo, Player* pl, bool msg)
{
    // not exist
    if (!spellInfo)
        return false;

    bool need_check_reagents = false;

    // check effects
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch (spellInfo->Effect[i])
        {
            case 0:
                continue;

            // craft spell for crafting nonexistent item (break client recipes list show)
            case SPELL_EFFECT_CREATE_ITEM:
            {
                if (!ObjectMgr::GetItemPrototype(spellInfo->EffectItemType[i]))
                {
                    if (msg)
                    {
                        if (pl)
                            ChatHandler(pl).PSendSysMessage("Craft spell %u create item (Entry: %u) but item does not exist in item_template.", spellInfo->Id, spellInfo->EffectItemType[i]);
                        else
                            sLog.outErrorDb("Craft spell %u create item (Entry: %u) but item does not exist in item_template.", spellInfo->Id, spellInfo->EffectItemType[i]);
                    }
                    return false;
                }

                need_check_reagents = true;
                break;
            }
            case SPELL_EFFECT_LEARN_SPELL:
            {
                SpellEntry const* spellInfo2 = sSpellMgr.GetSpellEntry(spellInfo->EffectTriggerSpell[i]);
                if (!IsSpellValid(spellInfo2, pl, msg))
                {
                    if (msg)
                    {
                        if (pl)
                            ChatHandler(pl).PSendSysMessage("Spell %u learn to broken spell %u, and then...", spellInfo->Id, spellInfo->EffectTriggerSpell[i]);
                        else
                            sLog.outErrorDb("Spell %u learn to invalid spell %u, and then...", spellInfo->Id, spellInfo->EffectTriggerSpell[i]);
                    }
                    return false;
                }
                break;
            }
        }
    }

    if (need_check_reagents)
    {
        for (int j = 0; j < MAX_SPELL_REAGENTS; ++j)
        {
            if (spellInfo->Reagent[j] > 0 && !ObjectMgr::GetItemPrototype(spellInfo->Reagent[j]))
            {
                if (msg)
                {
                    if (pl)
                        ChatHandler(pl).PSendSysMessage("Craft spell %u requires reagent item (Entry: %u) but item does not exist in item_template.", spellInfo->Id, spellInfo->Reagent[j]);
                    else
                        sLog.outErrorDb("Craft spell %u requires reagent item (Entry: %u) but item does not exist in item_template.", spellInfo->Id, spellInfo->Reagent[j]);
                }
                return false;
            }
        }
    }

    return true;
}

void SpellMgr::LoadSpellAreas()
{
    mSpellAreaMap.clear();                                  // need for reload case
    mSpellAreaForQuestMap.clear();
    mSpellAreaForActiveQuestMap.clear();
    mSpellAreaForQuestEndMap.clear();
    mSpellAreaForAuraMap.clear();

    uint32 count = 0;

    //                                                0      1     2            3                   4          5           6         7       8
    QueryResult *result = WorldDatabase.Query("SELECT spell, area, quest_start, quest_start_active, quest_end, aura_spell, racemask, gender, autocast FROM spell_area");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell area requirements", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 spell = fields[0].GetUInt32();
        SpellArea spellArea;
        spellArea.spellId             = spell;
        spellArea.areaId              = fields[1].GetUInt32();
        spellArea.questStart          = fields[2].GetUInt32();
        spellArea.questStartCanActive = fields[3].GetBool();
        spellArea.questEnd            = fields[4].GetUInt32();
        spellArea.auraSpell           = fields[5].GetInt32();
        spellArea.raceMask            = fields[6].GetUInt32();
        spellArea.gender              = Gender(fields[7].GetUInt8());
        spellArea.autocast            = fields[8].GetBool();

        if (!sSpellMgr.GetSpellEntry(spell))
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` does not exist", spell);
            continue;
        }

        {
            bool ok = true;
            SpellAreaMapBounds sa_bounds = GetSpellAreaMapBounds(spellArea.spellId);
            for (SpellAreaMap::const_iterator itr = sa_bounds.first; itr != sa_bounds.second; ++itr)
            {
                if (spellArea.spellId != itr->second.spellId)
                    continue;
                if (spellArea.areaId != itr->second.areaId)
                    continue;
                if (spellArea.questStart != itr->second.questStart)
                    continue;
                if (spellArea.auraSpell != itr->second.auraSpell)
                    continue;
                if ((spellArea.raceMask & itr->second.raceMask) == 0)
                    continue;
                if (spellArea.gender != itr->second.gender)
                    continue;

                // duplicate by requirements
                ok = false;
                break;
            }

            if (!ok)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` already listed with similar requirements.", spell);
                continue;
            }

        }

        if (spellArea.areaId && !AreaEntry::GetById(spellArea.areaId))
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong area (%u) requirement", spell, spellArea.areaId);
            continue;
        }

        if (spellArea.questStart && !sObjectMgr.GetQuestTemplate(spellArea.questStart))
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong start quest (%u) requirement", spell, spellArea.questStart);
            continue;
        }

        if (spellArea.questEnd)
        {
            if (!sObjectMgr.GetQuestTemplate(spellArea.questEnd))
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have wrong end quest (%u) requirement", spell, spellArea.questEnd);
                continue;
            }

            if (spellArea.questEnd == spellArea.questStart && !spellArea.questStartCanActive)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have quest (%u) requirement for start and end in same time", spell, spellArea.questEnd);
                continue;
            }
        }

        if (spellArea.auraSpell)
        {
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(abs(spellArea.auraSpell));
            if (!spellInfo)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have wrong aura spell (%u) requirement", spell, abs(spellArea.auraSpell));
                continue;
            }

            switch (spellInfo->EffectApplyAuraName[EFFECT_INDEX_0])
            {
                case SPELL_AURA_DUMMY:
                case SPELL_AURA_GHOST:
                    break;
                default:
                    sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell requirement (%u) without dummy/phase/ghost aura in effect 0", spell, abs(spellArea.auraSpell));
                    continue;
            }

            if (uint32(abs(spellArea.auraSpell)) == spellArea.spellId)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell (%u) requirement for itself", spell, abs(spellArea.auraSpell));
                continue;
            }

            // not allow autocast chains by auraSpell field (but allow use as alternative if not present)
            if (spellArea.autocast && spellArea.auraSpell > 0)
            {
                bool chain = false;
                SpellAreaForAuraMapBounds saBound = GetSpellAreaForAuraMapBounds(spellArea.spellId);
                for (SpellAreaForAuraMap::const_iterator itr = saBound.first; itr != saBound.second; ++itr)
                {
                    if (itr->second->autocast && itr->second->auraSpell > 0)
                    {
                        chain = true;
                        break;
                    }
                }

                if (chain)
                {
                    sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell (%u) requirement that itself autocast from aura", spell, spellArea.auraSpell);
                    continue;
                }

                SpellAreaMapBounds saBound2 = GetSpellAreaMapBounds(spellArea.auraSpell);
                for (SpellAreaMap::const_iterator itr2 = saBound2.first; itr2 != saBound2.second; ++itr2)
                {
                    if (itr2->second.autocast && itr2->second.auraSpell > 0)
                    {
                        chain = true;
                        break;
                    }
                }

                if (chain)
                {
                    sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell (%u) requirement that itself autocast from aura", spell, spellArea.auraSpell);
                    continue;
                }
            }
        }

        if (spellArea.raceMask && (spellArea.raceMask & RACEMASK_ALL_PLAYABLE) == 0)
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong race mask (%u) requirement", spell, spellArea.raceMask);
            continue;
        }

        if (spellArea.gender != GENDER_NONE && spellArea.gender != GENDER_FEMALE && spellArea.gender != GENDER_MALE)
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong gender (%u) requirement", spell, spellArea.gender);
            continue;
        }

        SpellArea const* sa = &mSpellAreaMap.insert(SpellAreaMap::value_type(spell, spellArea))->second;

        // for search by current zone/subzone at zone/subzone change
        if (spellArea.areaId)
            mSpellAreaForAreaMap.insert(SpellAreaForAreaMap::value_type(spellArea.areaId, sa));

        // for search at quest start/reward
        if (spellArea.questStart)
        {
            if (spellArea.questStartCanActive)
                mSpellAreaForActiveQuestMap.insert(SpellAreaForQuestMap::value_type(spellArea.questStart, sa));
            else
                mSpellAreaForQuestMap.insert(SpellAreaForQuestMap::value_type(spellArea.questStart, sa));
        }

        // for search at quest start/reward
        if (spellArea.questEnd)
            mSpellAreaForQuestEndMap.insert(SpellAreaForQuestMap::value_type(spellArea.questEnd, sa));

        // for search at aura apply
        if (spellArea.auraSpell)
            mSpellAreaForAuraMap.insert(SpellAreaForAuraMap::value_type(abs(spellArea.auraSpell), sa));

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell area requirements", count);
}

SpellCastResult SpellMgr::GetSpellAllowedInLocationError(SpellEntry const *spellInfo, Unit const* caster, Player const* player)
{
    // bg spell checks

    // Spell casted only on battleground
    if ((spellInfo->AttributesEx3 & SPELL_ATTR_EX3_BATTLEGROUND))
        if (!player || !player->InBattleGround())
            return SPELL_FAILED_ONLY_BATTLEGROUNDS;

    uint32 mapId = 0;
    if (caster)
        mapId = caster->GetMapId();
    else if (player)
        mapId = player->GetMapId();

    switch (spellInfo->Id)
    {
                            // Alterac Valley
        case 22564:                                         // recall
        case 22563:                                         // recall
        case 23538:                                         // Battle Standard
        case 23539:
        {
            if (!player)
                return SPELL_FAILED_REQUIRES_AREA;

            BattleGround* bg = player->GetBattleGround();

            return player->GetMapId() == 30 && bg
                   && bg->GetStatus() != STATUS_WAIT_JOIN ? SPELL_CAST_OK : SPELL_FAILED_REQUIRES_AREA;
        }
        case 23333:                                         // Warsong Flag
        case 23335:                                         // Silverwing Flag
            return player && player->GetMapId() == 489 && player->InBattleGround() ? SPELL_CAST_OK : SPELL_FAILED_REQUIRES_AREA;
        case 2584:                                          // Waiting to Resurrect
        {
            return player && player->InBattleGround() ? SPELL_CAST_OK : SPELL_FAILED_ONLY_BATTLEGROUNDS;
        }
        case 22011:                                         // Spirit Heal Channel
        case 22012:                                         // Spirit Heal
        case 24171:                                         // Resurrection Impact Visual
        {
            MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(mapId);
            if (!mapEntry)
                return SPELL_FAILED_REQUIRES_AREA;
            return mapEntry->IsBattleGround() ? SPELL_CAST_OK : SPELL_FAILED_ONLY_BATTLEGROUNDS;
        }
    }

    if (caster)
    {
        SpellAreaMapBounds saBounds = GetSpellAreaMapBounds(spellInfo->Id);
        if (saBounds.first != saBounds.second)
        {
            // Performance optimization:
            // Compute zone/area only if necessay. Not at every spell cast.
            uint32 zone, area;
            caster->GetZoneAndAreaId(zone, area);
            for (SpellAreaMap::const_iterator itr = saBounds.first; itr != saBounds.second; ++itr)
                if (itr->second.IsFitToRequirements(player, zone, area))
                    return SPELL_CAST_OK;
            return SPELL_FAILED_REQUIRES_AREA;
        }
    }
    return SPELL_CAST_OK;
}

SpellCastResult SpellMgr::GetSpellAllowedInLocationError(SpellEntry const *spellInfo, uint32 zone_id, uint32 area_id, Player const* player)
{
    // DB base check (if non empty then must fit at least single for allow)
    SpellAreaMapBounds saBounds = GetSpellAreaMapBounds(spellInfo->Id);
    if (saBounds.first != saBounds.second)
    {
        for (SpellAreaMap::const_iterator itr = saBounds.first; itr != saBounds.second; ++itr)
        {
            if (itr->second.IsFitToRequirements(player, zone_id, area_id))
                return SPELL_CAST_OK;
        }
        return SPELL_FAILED_REQUIRES_AREA;
    }
    return GetSpellAllowedInLocationError(spellInfo, nullptr /* zone/area already checked */, player);
}

void SpellMgr::LoadSkillLineAbilityMap()
{
    mSkillLineAbilityMap.clear();

    BarGoLink bar(sSkillLineAbilityStore.GetNumRows());
    uint32 count = 0;

    for (uint32 i = 0; i < sSkillLineAbilityStore.GetNumRows(); ++i)
    {
        bar.step();
        SkillLineAbilityEntry const *SkillInfo = sSkillLineAbilityStore.LookupEntry(i);
        if (!SkillInfo)
            continue;

        mSkillLineAbilityMap.insert(SkillLineAbilityMap::value_type(SkillInfo->spellId, SkillInfo));
        ++count;
    }

    sLog.outString();
    sLog.outString(">> Loaded %u SkillLineAbility MultiMap Data", count);
}

void SpellMgr::LoadSkillRaceClassInfoMap()
{
    mSkillRaceClassInfoMap.clear();

    BarGoLink bar(sSkillRaceClassInfoStore.GetNumRows());
    uint32 count = 0;

    for (uint32 i = 0; i < sSkillRaceClassInfoStore.GetNumRows(); ++i)
    {
        bar.step();
        SkillRaceClassInfoEntry const *skillRCInfo = sSkillRaceClassInfoStore.LookupEntry(i);
        if (!skillRCInfo)
            continue;

        // not all skills really listed in ability skills list
        if (!sSkillLineStore.LookupEntry(skillRCInfo->skillId))
            continue;

        mSkillRaceClassInfoMap.insert(SkillRaceClassInfoMap::value_type(skillRCInfo->skillId, skillRCInfo));

        ++count;
    }

    sLog.outString();
    sLog.outString(">> Loaded %u SkillRaceClassInfo MultiMap Data", count);
}

void SpellMgr::CheckUsedSpells(char const* table)
{
    uint32 countSpells = 0;
    uint32 countMasks = 0;

    //                                                 0       1               2               3         4           5             6          7          8         9    10
    QueryResult *result = WorldDatabase.PQuery("SELECT spellid,SpellFamilyName,SpellFamilyMask,SpellIcon,SpellVisual,SpellCategory,EffectType,EffectAura,EffectIdx,Name,Code FROM %s", table);

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb("`%s` table is empty!", table);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 spell       = fields[0].GetUInt32();
        int32  family      = fields[1].GetInt32();
        uint64 familyMask  = fields[2].GetUInt64();
        int32  spellIcon   = fields[3].GetInt32();
        int32  spellVisual = fields[4].GetInt32();
        int32  category    = fields[5].GetInt32();
        int32  effectType  = fields[6].GetInt32();
        int32  auraType    = fields[7].GetInt32();
        int32  effectIdx   = fields[8].GetInt32();
        std::string name   = fields[9].GetCppString();
        std::string code   = fields[10].GetCppString();

        // checks of correctness requirements itself

        if (family < -1 || family > SPELLFAMILY_UNK3)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellFamily value(%u), skipped.", table, spell, family);
            continue;
        }

        // TODO: spellIcon check need dbc loading
        if (spellIcon < -1)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellIcon value(%u), skipped.", table, spell, spellIcon);
            continue;
        }

        // TODO: spellVisual check need dbc loading
        if (spellVisual < -1)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellVisual value(%u), skipped.", table, spell, spellVisual);
            continue;
        }

        // TODO: for spellCategory better check need dbc loading
        if (category < -1 || (category >= 0 && sSpellCategoryStore.find(category) == sSpellCategoryStore.end()))
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellCategory value(%u), skipped.", table, spell, category);
            continue;
        }

        if (effectType < -1 || effectType >= TOTAL_SPELL_EFFECTS)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellEffect type value(%u), skipped.", table, spell, effectType);
            continue;
        }

        if (auraType < -1 || auraType >= TOTAL_AURAS)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellAura type value(%u), skipped.", table, spell, auraType);
            continue;
        }

        if (effectIdx < -1 || effectIdx >= 3)
        {
            sLog.outError("Table '%s' for spell %u have wrong EffectIdx value(%u), skipped.", table, spell, effectIdx);
            continue;
        }

        // now checks of requirements

        if (spell)
        {
            ++countSpells;

            SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(spell);
            if (!spellEntry)
            {
                sLog.outError("Spell %u '%s' not exist but used in %s.", spell, name.c_str(), code.c_str());
                continue;
            }

            if (family >= 0 && spellEntry->SpellFamilyName != uint32(family))
            {
                sLog.outError("Spell %u '%s' family(%u) <> %u but used in %s.", spell, name.c_str(), spellEntry->SpellFamilyName, family, code.c_str());
                continue;
            }

            if (familyMask != UI64LIT(0xFFFFFFFFFFFFFFFF))
            {
                if (familyMask == UI64LIT(0x0000000000000000))
                {
                    if (spellEntry->SpellFamilyFlags)
                    {
                        sLog.outError("Spell %u '%s' not fit to (" UI64FMTD ") but used in %s.",
                                      spell, name.c_str(), familyMask, code.c_str());
                        continue;
                    }

                }
                else
                {
                    if (!spellEntry->IsFitToFamilyMask(familyMask))
                    {
                        sLog.outError("Spell %u '%s' not fit to (" I64FMT ") but used in %s.", spell, name.c_str(), familyMask, code.c_str());
                        continue;
                    }

                }
            }

            if (spellIcon >= 0 && spellEntry->SpellIconID != uint32(spellIcon))
            {
                sLog.outError("Spell %u '%s' icon(%u) <> %u but used in %s.", spell, name.c_str(), spellEntry->SpellIconID, spellIcon, code.c_str());
                continue;
            }

            if (spellVisual >= 0 && spellEntry->SpellVisual != uint32(spellVisual))
            {
                sLog.outError("Spell %u '%s' visual(%u) <> %u but used in %s.", spell, name.c_str(), spellEntry->SpellVisual, spellVisual, code.c_str());
                continue;
            }

            if (category >= 0 && spellEntry->Category != uint32(category))
            {
                sLog.outError("Spell %u '%s' category(%u) <> %u but used in %s.", spell, name.c_str(), spellEntry->Category, category, code.c_str());
                continue;
            }

            if (effectIdx >= EFFECT_INDEX_0)
            {
                if (effectType >= 0 && spellEntry->Effect[effectIdx] != uint32(effectType))
                {
                    sLog.outError("Spell %u '%s' effect%d <> %u but used in %s.", spell, name.c_str(), effectIdx + 1, effectType, code.c_str());
                    continue;
                }

                if (auraType >= 0 && spellEntry->EffectApplyAuraName[effectIdx] != uint32(auraType))
                {
                    sLog.outError("Spell %u '%s' aura%d <> %u but used in %s.", spell, name.c_str(), effectIdx + 1, auraType, code.c_str());
                    continue;
                }

            }
            else
            {
                if (effectType >= 0 && !IsSpellHaveEffect(spellEntry, SpellEffects(effectType)))
                {
                    sLog.outError("Spell %u '%s' not have effect %u but used in %s.", spell, name.c_str(), effectType, code.c_str());
                    continue;
                }

                if (auraType >= 0 && !IsSpellHaveAura(spellEntry, AuraType(auraType)))
                {
                    sLog.outError("Spell %u '%s' not have aura %u but used in %s.", spell, name.c_str(), auraType, code.c_str());
                    continue;
                }
            }
        }
        else
        {
            ++countMasks;

            bool found = false;
            for (uint32 spellId = 1; spellId < sSpellMgr.GetMaxSpellId(); ++spellId)
            {
                SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(spellId);
                if (!spellEntry)
                    continue;

                if (family >= 0 && spellEntry->SpellFamilyName != uint32(family))
                    continue;

                if (familyMask != UI64LIT(0xFFFFFFFFFFFFFFFF))
                {
                    if (familyMask == UI64LIT(0x0000000000000000))
                    {
                        if (spellEntry->SpellFamilyFlags)
                            continue;
                    }
                    else
                    {
                        if (!spellEntry->IsFitToFamilyMask(familyMask))
                            continue;
                    }
                }

                if (spellIcon >= 0 && spellEntry->SpellIconID != uint32(spellIcon))
                    continue;

                if (spellVisual >= 0 && spellEntry->SpellVisual != uint32(spellVisual))
                    continue;

                if (category >= 0 && spellEntry->Category != uint32(category))
                    continue;

                if (effectIdx >= 0)
                {
                    if (effectType >= 0 && spellEntry->Effect[effectIdx] != uint32(effectType))
                        continue;

                    if (auraType >= 0 && spellEntry->EffectApplyAuraName[effectIdx] != uint32(auraType))
                        continue;
                }
                else
                {
                    if (effectType >= 0 && !IsSpellHaveEffect(spellEntry, SpellEffects(effectType)))
                        continue;

                    if (auraType >= 0 && !IsSpellHaveAura(spellEntry, AuraType(auraType)))
                        continue;
                }

                found = true;
                break;
            }

            if (!found)
            {
                if (effectIdx >= 0)
                    sLog.outError("Spells '%s' not found for family %i (" I64FMT ") icon(%i) visual(%i) category(%i) effect%d(%i) aura%d(%i) but used in %s",
                                  name.c_str(), family, familyMask, spellIcon, spellVisual, category, effectIdx + 1, effectType, effectIdx + 1, auraType, code.c_str());
                else
                    sLog.outError("Spells '%s' not found for family %i (" I64FMT ") icon(%i) visual(%i) category(%i) effect(%i) aura(%i) but used in %s",
                                  name.c_str(), family, familyMask, spellIcon, spellVisual, category, effectType, auraType, code.c_str());
                continue;
            }
        }

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Checked %u spells and %u spell masks", countSpells, countMasks);
}

bool SpellArea::IsFitToRequirements(Player const* player, uint32 newZone, uint32 newArea) const
{
    if (gender != GENDER_NONE)
    {
        // not in expected gender
        if (!player || gender != player->getGender())
            return false;
    }

    if (raceMask)
    {
        // not in expected race
        if (!player || !(raceMask & player->getRaceMask()))
            return false;
    }

    if (areaId)
    {
        // not in expected zone
        if (newZone != areaId && newArea != areaId)
            return false;
    }

    if (questStart)
    {
        // not in expected required quest state
        if (!player || (!questStartCanActive || !player->IsActiveQuest(questStart)) && !player->GetQuestRewardStatus(questStart))
            return false;
    }

    if (questEnd)
    {
        // not in expected forbidden quest state
        if (!player || player->GetQuestRewardStatus(questEnd))
            return false;
    }

    if (auraSpell)
    {
        // not have expected aura
        if (!player)
            return false;
        if (auraSpell > 0)
            // have expected aura
            return player->HasAura(auraSpell, EFFECT_INDEX_0);
        else
            // not have expected aura
            return !player->HasAura(-auraSpell, EFFECT_INDEX_0);
    }

    return true;
}

void SpellMgr::LoadSpellAffects()
{
    mSpellAffectMap.clear();                                // need for reload case

    uint32 count = 0;

    //                                                0      1         2
    QueryResult *result = WorldDatabase.Query("SELECT entry, effectId, SpellFamilyMask FROM spell_affect");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell affect definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();
        uint8 effectId = fields[1].GetUInt8();

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(entry);

        if (!spellInfo)
        {
            sLog.outErrorDb("Spell %u listed in `spell_affect` does not exist", entry);
            continue;
        }

        if (effectId >= MAX_EFFECT_INDEX)
        {
            sLog.outErrorDb("Spell %u listed in `spell_affect` have invalid effect index (%u)", entry, effectId);
            continue;
        }

        if (spellInfo->Effect[effectId] != SPELL_EFFECT_APPLY_AURA || (
                    spellInfo->EffectApplyAuraName[effectId] != SPELL_AURA_ADD_FLAT_MODIFIER &&
                    spellInfo->EffectApplyAuraName[effectId] != SPELL_AURA_ADD_PCT_MODIFIER  &&
                    spellInfo->EffectApplyAuraName[effectId] != SPELL_AURA_ADD_TARGET_TRIGGER &&
                    spellInfo->EffectApplyAuraName[effectId] != SPELL_AURA_OVERRIDE_CLASS_SCRIPTS))
        {
            sLog.outErrorDb("Spell %u listed in `spell_affect` have not SPELL_AURA_ADD_FLAT_MODIFIER (%u) or SPELL_AURA_ADD_PCT_MODIFIER (%u) or SPELL_AURA_ADD_TARGET_TRIGGER (%u) or SPELL_AURA_OVERRIDE_CLASS_SCRIPTS (%u) for effect index (%u)", entry, SPELL_AURA_ADD_FLAT_MODIFIER, SPELL_AURA_ADD_PCT_MODIFIER, SPELL_AURA_ADD_TARGET_TRIGGER, SPELL_AURA_OVERRIDE_CLASS_SCRIPTS, effectId);
            continue;
        }

        uint64 spellAffectMask = fields[2].GetUInt64();

        // Spell.dbc have own data for low part of SpellFamilyMask
        if (spellInfo->EffectItemType[effectId])
        {
            if (static_cast<uint64>(spellInfo->EffectItemType[effectId]) == spellAffectMask)
            {
                sLog.outErrorDb("Spell %u listed in `spell_affect` have redundant (same with EffectItemType%d) data for effect index (%u) and not needed, skipped.", entry, effectId + 1, effectId);
                continue;
            }
        }

        mSpellAffectMap.insert(SpellAffectMap::value_type((entry << 8) + effectId, spellAffectMask));

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell affect definitions", count);

    for (uint32 id = 0; id < sSpellMgr.GetMaxSpellId(); ++id)
    {
        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(id);
        if (!spellInfo)
            continue;

        for (int effectId = 0; effectId < MAX_EFFECT_INDEX; ++effectId)
        {
            if (spellInfo->Effect[effectId] != SPELL_EFFECT_APPLY_AURA || (
                        spellInfo->EffectApplyAuraName[effectId] != SPELL_AURA_ADD_FLAT_MODIFIER &&
                        spellInfo->EffectApplyAuraName[effectId] != SPELL_AURA_ADD_PCT_MODIFIER  &&
                        spellInfo->EffectApplyAuraName[effectId] != SPELL_AURA_ADD_TARGET_TRIGGER))
                continue;

            if (spellInfo->EffectItemType[effectId] != 0)
                continue;

            if (mSpellAffectMap.find((id << 8) + effectId) !=  mSpellAffectMap.end())
                continue;

            sLog.outErrorDb("Spell %u (%s) misses spell_affect for effect %u", id, spellInfo->SpellName[sWorld.GetDefaultDbcLocale()], effectId);
        }
    }
}

void SpellMgr::LoadFacingCasterFlags()
{
    mSpellFacingFlagMap.clear();
    uint32 count = 0;

    //                                                0              1
    QueryResult *result = WorldDatabase.Query("SELECT entry, facingcasterflag FROM spell_facing");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded %u facing caster flags", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry              = fields[0].GetUInt32();
        uint32 FacingCasterFlags  = fields[1].GetUInt32();

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(entry);
        if (!spellInfo)
        {
            sLog.outErrorDb("Spell %u listed in `spell_facing` does not exist", entry);
            continue;
        }
        mSpellFacingFlagMap[entry]    = FacingCasterFlags;

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u facing caster flags", count);
}

void SpellMgr::LoadSpells()
{
    uint32 oldMSTime = WorldTimer::getMSTime();
    sLog.outString("Loading spells ...");

    // Getting the maximum ID.
    QueryResult* result = WorldDatabase.Query("SELECT MAX(ID) FROM spell_template");

    if (!result)
    {
        sLog.outString(">> Loaded 0 spells. DB table `spell_template` is empty.");
        return;
    }
    auto fields = result->Fetch();
    uint32 maxEntry = fields[0].GetUInt32() + 1;
    delete result;

    // Actually loading the spells.
    result = WorldDatabase.Query("SELECT * FROM spell_template");

    if (!result)
    {
        sLog.outString(">> Loaded 0 spells. DB table `spell_template` is empty.");
        return;
    }
    
    mSpellEntryMap.resize(maxEntry, nullptr);

    do
    {
        fields = result->Fetch();

        SpellEntry* spell = new SpellEntry();

        uint32 spellId = fields[0].GetUInt32();

        spell->Id = spellId;
        spell->School = fields[1].GetUInt32();
        spell->Category = fields[2].GetUInt32();
        //spell->castUI = fields[3].GetUInt32(); not used
        spell->Dispel = fields[4].GetUInt32();
        spell->Mechanic = fields[5].GetUInt32();
        spell->Attributes = fields[6].GetUInt32();
        spell->AttributesEx = fields[7].GetUInt32();
        spell->AttributesEx2 = fields[8].GetUInt32();
        spell->AttributesEx3 = fields[9].GetUInt32();
        spell->AttributesEx4 = fields[10].GetUInt32();
        spell->Stances = fields[11].GetUInt32();
        spell->StancesNot = fields[12].GetUInt32();
        spell->Targets = fields[13].GetUInt32();
        spell->TargetCreatureType = fields[14].GetUInt32();
        spell->RequiresSpellFocus = fields[15].GetUInt32();
        spell->CasterAuraState = fields[16].GetUInt32();
        spell->TargetAuraState = fields[17].GetUInt32();
        spell->CastingTimeIndex = fields[18].GetUInt32();
        spell->RecoveryTime = fields[19].GetUInt32();
        spell->CategoryRecoveryTime = fields[20].GetUInt32();
        spell->InterruptFlags = fields[21].GetUInt32();
        spell->AuraInterruptFlags = fields[22].GetUInt32();
        spell->ChannelInterruptFlags = fields[23].GetUInt32();
        spell->procFlags = fields[24].GetUInt32();
        spell->procChance = fields[25].GetUInt32();
        spell->procCharges = fields[26].GetUInt32();
        spell->maxLevel = fields[27].GetUInt32();
        spell->baseLevel = fields[28].GetUInt32();
        spell->spellLevel = fields[29].GetUInt32();
        spell->DurationIndex = fields[30].GetUInt32();
        spell->powerType = fields[31].GetUInt32();
        spell->manaCost = fields[32].GetUInt32();
        spell->manaCostPerlevel = fields[33].GetUInt32();
        spell->manaPerSecond = fields[34].GetUInt32();
        spell->manaPerSecondPerLevel = fields[35].GetUInt32();
        spell->rangeIndex = fields[36].GetUInt32();
        spell->speed = fields[37].GetFloat();
        //spell->modalNextSpell = fields[38].GetUInt32(); not used
        spell->StackAmount = fields[39].GetUInt32();
        spell->Totem[0] = fields[40].GetUInt32();
        spell->Totem[1] = fields[41].GetUInt32();
        spell->Reagent[0] = fields[42].GetInt32();
        spell->Reagent[1] = fields[43].GetInt32();
        spell->Reagent[2] = fields[44].GetInt32();
        spell->Reagent[3] = fields[45].GetInt32();
        spell->Reagent[4] = fields[46].GetInt32();
        spell->Reagent[5] = fields[47].GetInt32();
        spell->Reagent[6] = fields[48].GetInt32();
        spell->Reagent[7] = fields[49].GetInt32();
        spell->ReagentCount[0] = fields[50].GetUInt32();
        spell->ReagentCount[1] = fields[51].GetUInt32();
        spell->ReagentCount[2] = fields[52].GetUInt32();
        spell->ReagentCount[3] = fields[53].GetUInt32();
        spell->ReagentCount[4] = fields[54].GetUInt32();
        spell->ReagentCount[5] = fields[55].GetUInt32();
        spell->ReagentCount[6] = fields[56].GetUInt32();
        spell->ReagentCount[7] = fields[57].GetUInt32();
        spell->EquippedItemClass = fields[58].GetInt32();
        spell->EquippedItemSubClassMask = fields[59].GetInt32();
        spell->EquippedItemInventoryTypeMask = fields[60].GetInt32();
        spell->Effect[0] = fields[61].GetUInt32();
        spell->Effect[1] = fields[62].GetUInt32();
        spell->Effect[2] = fields[63].GetUInt32();
        spell->EffectDieSides[0] = fields[64].GetInt32();
        spell->EffectDieSides[1] = fields[65].GetInt32();
        spell->EffectDieSides[2] = fields[66].GetInt32();
        spell->EffectBaseDice[0] = fields[67].GetUInt32();
        spell->EffectBaseDice[1] = fields[68].GetUInt32();
        spell->EffectBaseDice[2] = fields[69].GetUInt32();
        spell->EffectDicePerLevel[0] = fields[70].GetFloat();
        spell->EffectDicePerLevel[1] = fields[71].GetFloat();
        spell->EffectDicePerLevel[2] = fields[72].GetFloat();
        spell->EffectRealPointsPerLevel[0] = fields[73].GetFloat();
        spell->EffectRealPointsPerLevel[1] = fields[74].GetFloat();
        spell->EffectRealPointsPerLevel[2] = fields[75].GetFloat();
        spell->EffectBasePoints[0] = fields[76].GetInt32();
        spell->EffectBasePoints[1] = fields[77].GetInt32();
        spell->EffectBasePoints[2] = fields[78].GetInt32();
        spell->EffectMechanic[0] = fields[79].GetUInt32();
        spell->EffectMechanic[1] = fields[80].GetUInt32();
        spell->EffectMechanic[2] = fields[81].GetUInt32();
        spell->EffectImplicitTargetA[0] = fields[82].GetUInt32();
        spell->EffectImplicitTargetA[1] = fields[83].GetUInt32();
        spell->EffectImplicitTargetA[2] = fields[84].GetUInt32();
        spell->EffectImplicitTargetB[0] = fields[85].GetUInt32();
        spell->EffectImplicitTargetB[1] = fields[86].GetUInt32();
        spell->EffectImplicitTargetB[2] = fields[87].GetUInt32();
        spell->EffectRadiusIndex[0] = fields[88].GetUInt32();
        spell->EffectRadiusIndex[1] = fields[89].GetUInt32();
        spell->EffectRadiusIndex[2] = fields[90].GetUInt32();
        spell->EffectApplyAuraName[0] = fields[91].GetUInt32();
        spell->EffectApplyAuraName[1] = fields[92].GetUInt32();
        spell->EffectApplyAuraName[2] = fields[93].GetUInt32();
        spell->EffectAmplitude[0] = fields[94].GetUInt32();
        spell->EffectAmplitude[1] = fields[95].GetUInt32();
        spell->EffectAmplitude[2] = fields[96].GetUInt32();
        spell->EffectMultipleValue[0] = fields[97].GetFloat();
        spell->EffectMultipleValue[1] = fields[98].GetFloat();
        spell->EffectMultipleValue[2] = fields[99].GetFloat();
        spell->EffectChainTarget[0] = fields[100].GetUInt32();
        spell->EffectChainTarget[1] = fields[101].GetUInt32();
        spell->EffectChainTarget[2] = fields[102].GetUInt32();
        spell->EffectItemType[0] = fields[103].GetUInt32();
        spell->EffectItemType[1] = fields[104].GetUInt32();
        spell->EffectItemType[2] = fields[105].GetUInt32();
        spell->EffectMiscValue[0] = fields[106].GetInt32();
        spell->EffectMiscValue[1] = fields[107].GetInt32();
        spell->EffectMiscValue[2] = fields[108].GetInt32();
        spell->EffectTriggerSpell[0] = fields[109].GetUInt32();
        spell->EffectTriggerSpell[1] = fields[110].GetUInt32();
        spell->EffectTriggerSpell[2] = fields[111].GetUInt32();
        spell->EffectPointsPerComboPoint[0] = fields[112].GetFloat();
        spell->EffectPointsPerComboPoint[1] = fields[113].GetFloat();
        spell->EffectPointsPerComboPoint[2] = fields[114].GetFloat();
        spell->SpellVisual = fields[115].GetUInt32();
        //spell->SpellVisual2 = fields[116].GetUInt32(); not used
        spell->SpellIconID = fields[117].GetUInt32();
        spell->activeIconID = fields[118].GetUInt32();
        spell->spellPriority = fields[119].GetUInt32();
        spell->SpellName[0] = new char[strlen(fields[120].GetString()) + 1];
        strcpy(spell->SpellName[0], fields[120].GetString());
        spell->SpellName[1] = new char[strlen(fields[121].GetString()) + 1];
        strcpy(spell->SpellName[1], fields[121].GetString());
        spell->SpellName[2] = new char[strlen(fields[122].GetString()) + 1];
        strcpy(spell->SpellName[2], fields[122].GetString());
        spell->SpellName[3] = new char[strlen(fields[123].GetString()) + 1];
        strcpy(spell->SpellName[3], fields[123].GetString());
        spell->SpellName[4] = new char[strlen(fields[124].GetString()) + 1];
        strcpy(spell->SpellName[4], fields[124].GetString());
        spell->SpellName[5] = new char[strlen(fields[125].GetString()) + 1];
        strcpy(spell->SpellName[5], fields[125].GetString());
        spell->SpellName[6] = new char[strlen(fields[126].GetString()) + 1];
        strcpy(spell->SpellName[6], fields[126].GetString());
        spell->SpellName[7] = new char[strlen(fields[127].GetString()) + 1];
        strcpy(spell->SpellName[7], fields[127].GetString());
        //spell->SpellNameFlag = fields[128].GetUInt32(); not used
        spell->Rank[0] = new char[strlen(fields[129].GetString()) + 1];
        strcpy(spell->Rank[0], fields[129].GetString());
        spell->Rank[1] = new char[strlen(fields[130].GetString()) + 1];
        strcpy(spell->Rank[1], fields[130].GetString());
        spell->Rank[2] = new char[strlen(fields[131].GetString()) + 1];
        strcpy(spell->Rank[2], fields[131].GetString());
        spell->Rank[3] = new char[strlen(fields[132].GetString()) + 1];
        strcpy(spell->Rank[3], fields[132].GetString());
        spell->Rank[4] = new char[strlen(fields[133].GetString()) + 1];
        strcpy(spell->Rank[4], fields[133].GetString());
        spell->Rank[5] = new char[strlen(fields[134].GetString()) + 1];
        strcpy(spell->Rank[5], fields[134].GetString());
        spell->Rank[6] = new char[strlen(fields[135].GetString()) + 1];
        strcpy(spell->Rank[6], fields[135].GetString());
        spell->Rank[7] = new char[strlen(fields[136].GetString()) + 1];
        strcpy(spell->Rank[7], fields[136].GetString());
        /* not used
        spell->RankFlags = fields[137].GetUInt32();
        spell->Description[0] = new char[strlen(fields[138].GetString()) + 1];
        strcpy(spell->Description[0], fields[138].GetString());
        spell->Description[1] = new char[strlen(fields[139].GetString()) + 1];
        strcpy(spell->Description[1], fields[139].GetString());
        spell->Description[2] = new char[strlen(fields[140].GetString()) + 1];
        strcpy(spell->Description[2], fields[140].GetString());
        spell->Description[3] = new char[strlen(fields[141].GetString()) + 1];
        strcpy(spell->Description[3], fields[141].GetString());
        spell->Description[4] = new char[strlen(fields[142].GetString()) + 1];
        strcpy(spell->Description[4], fields[142].GetString());
        spell->Description[5] = new char[strlen(fields[143].GetString()) + 1];
        strcpy(spell->Description[5], fields[143].GetString());
        spell->Description[6] = new char[strlen(fields[144].GetString()) + 1];
        strcpy(spell->Description[6], fields[144].GetString());
        spell->Description[7] = new char[strlen(fields[145].GetString()) + 1];
        strcpy(spell->Description[7], fields[145].GetString());
        spell->DescriptionFlags = fields[146].GetUInt32();
        spell->ToolTip[0] = new char[strlen(fields[147].GetString()) + 1];
        strcpy(spell->ToolTip[0], fields[147].GetString());
        spell->ToolTip[1] = new char[strlen(fields[148].GetString()) + 1];
        strcpy(spell->ToolTip[1], fields[148].GetString());
        spell->ToolTip[2] = new char[strlen(fields[149].GetString()) + 1];
        strcpy(spell->ToolTip[2], fields[149].GetString());
        spell->ToolTip[3] = new char[strlen(fields[150].GetString()) + 1];
        strcpy(spell->ToolTip[3], fields[150].GetString());
        spell->ToolTip[4] = new char[strlen(fields[151].GetString()) + 1];
        strcpy(spell->ToolTip[4], fields[151].GetString());
        spell->ToolTip[5] = new char[strlen(fields[152].GetString()) + 1];
        strcpy(spell->ToolTip[5], fields[152].GetString());
        spell->ToolTip[6] = new char[strlen(fields[153].GetString()) + 1];
        strcpy(spell->ToolTip[6], fields[153].GetString());
        spell->ToolTip[7] = new char[strlen(fields[154].GetString()) + 1];
        strcpy(spell->ToolTip[7], fields[154].GetString());
        spell->ToolTipFlags = fields[155].GetUInt32();
        */
        spell->ManaCostPercentage = fields[156].GetUInt32();
        spell->StartRecoveryCategory = fields[157].GetUInt32();
        spell->StartRecoveryTime = fields[158].GetUInt32();
        spell->MaxTargetLevel = fields[159].GetUInt32();
        spell->SpellFamilyName = fields[160].GetUInt32();
        spell->SpellFamilyFlags = fields[161].GetUInt64();
        spell->MaxAffectedTargets = fields[162].GetUInt32();
        spell->DmgClass = fields[163].GetUInt32();
        spell->PreventionType = fields[164].GetUInt32();
        //spell->StanceBarOrder = fields[165].GetInt32();
        spell->DmgMultiplier[0] = fields[166].GetFloat();
        spell->DmgMultiplier[1] = fields[167].GetFloat();
        spell->DmgMultiplier[2] = fields[168].GetFloat();
        //spell->MinFactionId = fields[169].GetUInt32();
        //spell->MinReputation = fields[170].GetUInt32();
        //spell->RequiredAuraVision = fields[171].GetUInt32();
        spell->Custom = 0;

        spell->InitCachedValues();
        mSpellEntryMap[spellId] = spell;

    } while (result->NextRow());

    delete result;

    sLog.outString(">> Loaded %u spells in %ums.", mSpellEntryMap.size(), WorldTimer::getMSTimeDiffToNow(oldMSTime));
}
