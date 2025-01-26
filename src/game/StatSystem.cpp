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

#include "SharedDefines.h"
#include "Creature.h"
#include "Pet.h"
#include "Player.h"
#include "SpellAuras.h"
#include "World.h"

/*#######################################
########                         ########
########   PLAYERS STAT SYSTEM   ########
########                         ########
#######################################*/

bool Player::UpdateStats(Stats stat)
{
    if (stat > STAT_SPIRIT)
        return false;

    // value = ((base_value * base_pct) + total_value) * total_pct
    float value  = GetTotalStatValue(stat);

    SetStat(stat, int32(value));

    switch (stat)
    {
        case STAT_STRENGTH:
            break;
        case STAT_AGILITY:
            UpdateArmor();
            UpdateAllCritPercentages();
            UpdateDodgePercentage();
            break;
        case STAT_STAMINA:
            UpdateMaxHealth();
            break;
        case STAT_INTELLECT:
            UpdateMaxPower(POWER_MANA);
            UpdateAllSpellCritChances();
            UpdateArmor();                                  //SPELL_AURA_MOD_RESISTANCE_OF_INTELLECT_PERCENT, only armor currently
            break;

        case STAT_SPIRIT:
            break;

        default:
            break;
    }
    // Need update (exist AP from stat auras)
    UpdateAttackPowerAndDamage();
    UpdateAttackPowerAndDamage(true);

    UpdateSpellDamageAndHealingBonus();
    UpdateManaRegen();

    return true;
}

void Player::UpdateSpellDamageAndHealingBonus()
{
    // Magic damage modifiers implemented in Unit::SpellDamageBonusDone
    // This information for client side use only
    // Get healing bonus for all schools
    // Get damage bonus for all schools
    for (int i = SPELL_SCHOOL_HOLY; i < MAX_SPELL_SCHOOL; ++i)
        SetStatInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_POS + i, SpellBaseDamageBonusDone(GetSchoolMask(i)));
}

bool Player::UpdateAllStats()
{
    for (int i = STAT_STRENGTH; i < MAX_STATS; ++i)
    {
        float value = GetTotalStatValue(Stats(i));
        SetStat(Stats(i), (int32)value);
    }

    UpdateAttackPowerAndDamage();
    UpdateAttackPowerAndDamage(true);
    UpdateMaxHealth();

    for (int i = POWER_MANA; i < MAX_POWERS; ++i)
        UpdateMaxPower(Powers(i));

    UpdateAllCritPercentages();
    UpdateAllSpellCritChances();
    UpdateDefenseBonusesMod();
    UpdateSpellDamageAndHealingBonus();
    UpdateManaRegen();

    for (int i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; ++i)
        UpdateResistances(i);

    return true;
}

void Player::UpdateResistances(uint32 school)
{
    if (school > SPELL_SCHOOL_NORMAL)
    {
        int32 value = school == SPELL_SCHOOL_HOLY ? 0 : GetTotalResistanceValue(SpellSchools(school));
        SetResistance(SpellSchools(school), value);
    }
    else
        UpdateArmor();
}

void Player::UpdateArmor()
{
    float dynamic = (GetStat(STAT_AGILITY) * 2.0f);

    // Add dynamic flat mods
    for (auto& i : GetAurasByType(SPELL_AURA_MOD_RESISTANCE_OF_STAT_PERCENT))
    {
        if (Modifier* mod = i->GetModifier())
        {
            if (mod->m_miscvalue & SPELL_SCHOOL_MASK_NORMAL)
                dynamic += (GetStat(STAT_INTELLECT) * (mod->m_amount * 0.01f));
        }
    }

    m_auraModifiersGroup[UNIT_MOD_ARMOR][TOTAL_VALUE] += dynamic;
    int32 value = GetTotalResistanceValue(SPELL_SCHOOL_NORMAL);

    SetArmor(value);
    m_auraModifiersGroup[UNIT_MOD_ARMOR][TOTAL_VALUE] -= dynamic;
}

float Player::GetHealthBonusFromStamina(float stamina)
{
    float baseStam = stamina < 20 ? stamina : 20;
    float moreStam = stamina - baseStam;

    return baseStam + (moreStam * 10.0f);
}

float Player::GetManaBonusFromIntellect(float intellect)
{
    float baseInt = intellect < 20 ? intellect : 20;
    float moreInt = intellect - baseInt;

    return baseInt + (moreInt * 15.0f);
}

void Player::UpdateMaxHealth()
{
    UnitMods unitMod = UNIT_MOD_HEALTH;

    float value = GetModifierValue(unitMod, BASE_VALUE) + GetCreateHealth();
    value *= GetModifierValue(unitMod, BASE_PCT);
    value += GetModifierValue(unitMod, TOTAL_VALUE) + GetHealthBonusFromStamina(GetStat(STAT_STAMINA));
    value *= GetModifierValue(unitMod, TOTAL_PCT);

    SetMaxHealth(std::max(1, int(value)));
}

void Player::UpdateMaxPower(Powers power)
{
    UnitMods unitMod = UnitMods(UNIT_MOD_POWER_START + power);

    uint32 create_power = GetCreatePowers(power);

    // ignore classes without mana
    float bonusPower = (power == POWER_MANA && create_power > 0) ? GetManaBonusFromIntellect(GetStat(STAT_INTELLECT)) : 0;

    float value = GetModifierValue(unitMod, BASE_VALUE) + create_power;
    value *= GetModifierValue(unitMod, BASE_PCT);
    value += GetModifierValue(unitMod, TOTAL_VALUE) +  bonusPower;
    value *= GetModifierValue(unitMod, TOTAL_PCT);

    SetMaxPower(power, uint32(value));
}

float Unit::GetAttackPowerFromStrengthAndAgility(bool ranged, float strength, float agility) const
{
    float val2 = 0.0f;
    float level = float(GetLevel());
    if (ranged)
    {
        switch (GetClass())
        {
            case CLASS_HUNTER:
                val2 = level * 2.0f + agility * 2.0f - 10.0f;
                break;
            case CLASS_ROGUE:
                val2 = level        + agility - 10.0f;
                break;
            case CLASS_WARRIOR:
                val2 = level        + agility - 10.0f;
                break;
            case CLASS_DRUID:
                switch (GetShapeshiftForm())
                {
                    case FORM_CAT:
                    case FORM_BEAR:
                    case FORM_DIREBEAR:
                        val2 = 0.0f;
                        break;
                    default:
                        val2 = agility - 10.0f;
                        break;
                }
                break;
            default:
                val2 = agility - 10.0f;
                break;
        }
    }
    else
    {
        switch (GetClass())
        {
            case CLASS_WARRIOR:
                val2 = level * 3.0f + strength * 2.0f    - 20.0f;
                break;
            case CLASS_PALADIN:
                val2 = level * 3.0f + strength * 2.0f    - 20.0f;
                break;
            case CLASS_ROGUE:
                val2 = level * 2.0f + strength + agility - 20.0f;
                break;
            case CLASS_HUNTER:
                val2 = level * 2.0f + strength + agility - 20.0f;
                break;
            case CLASS_SHAMAN:
                val2 = level * 2.0f + strength * 2.0f    - 20.0f;
                break;
            case CLASS_DRUID:
            {
                ShapeshiftForm form = GetShapeshiftForm();

                //Check if Predatory Strikes is skilled
                float mLevelMult = 0.0;
                switch (form)
                {
                    case FORM_CAT:
                    case FORM_BEAR:
                    case FORM_DIREBEAR:
                    {
                        Unit::AuraList const& mDummy = GetAurasByType(SPELL_AURA_DUMMY);
                        for (const auto itr : mDummy)
                        {
                            // Predatory Strikes
                            if (itr->GetSpellProto()->SpellIconID == 1563)
                            {
                                mLevelMult = itr->GetModifier()->m_amount / 100.0f;
                                break;
                            }
                        }
                        break;
                    }
                    default:
                        break;
                }

                switch (form)
                {
                    case FORM_CAT:
                       // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                       // - Cat Form - Each point of agility now adds 1 attack power.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
                        val2 = GetLevel() * mLevelMult + strength * 2.0f + agility - 20.0f;
                        break;
#endif
                    case FORM_BEAR:
                    case FORM_DIREBEAR:
                        val2 = GetLevel() * mLevelMult + strength * 2.0f - 20.0f;
                        break;
                    default:
                        val2 = strength * 2.0f - 20.0f;
                        break;
                }
                break;
            }
            case CLASS_MAGE:
                val2 = strength - 10.0f;
                break;
            case CLASS_PRIEST:
                val2 = strength - 10.0f;
                break;
            case CLASS_WARLOCK:
                val2 = strength - 10.0f;
                break;
        }
    }
    return val2;
}

void Player::UpdateAttackPowerAndDamage(bool ranged)
{
    AttackPowerModIndex unitMod = ranged ? RANGED_AP_MODS : MELEE_AP_MODS;

    uint16 index = UNIT_FIELD_ATTACK_POWER;
    uint16 index_mod = UNIT_FIELD_ATTACK_POWER_MODS;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    uint16 index_mult = UNIT_FIELD_ATTACK_POWER_MULTIPLIER;
#endif

    if (ranged)
    {
        index = UNIT_FIELD_RANGED_ATTACK_POWER;
        index_mod = UNIT_FIELD_RANGED_ATTACK_POWER_MODS;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        index_mult = UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER;
#endif  
    }

    float baseAttackPower = GetAttackPowerFromStrengthAndAgility(ranged, GetStat(STAT_STRENGTH), GetStat(STAT_AGILITY));

    // attack power mods are split into positive and negative field
    float attackPowerModPositive = GetAttackPowerModifierValue(unitMod, AP_MOD_POSITIVE_FLAT);
    float attackPowerModNegative = GetAttackPowerModifierValue(unitMod, AP_MOD_NEGATIVE_FLAT);

    SetInt32Value(index, (int32)baseAttackPower);               //UNIT_FIELD_(RANGED)_ATTACK_POWER field
    SetInt16Value(index_mod, 0, (int16)attackPowerModPositive); //UNIT_FIELD_(RANGED)_ATTACK_POWER_MODS field (positive)
    SetInt16Value(index_mod, 1, (int16)attackPowerModNegative); //UNIT_FIELD_(RANGED)_ATTACK_POWER_MODS field (negative)

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    float attackPowerMultiplier = GetAttackPowerModifierValue(unitMod, AP_MOD_PCT) - 1.0f;
    SetFloatValue(index_mult, attackPowerMultiplier);           //UNIT_FIELD_(RANGED)_ATTACK_POWER_MULTIPLIER field
#endif

    //automatically update weapon damage after attack power modification
    if (ranged)
        UpdateDamagePhysical(RANGED_ATTACK);
    else
    {
        UpdateDamagePhysical(BASE_ATTACK);
        if (CanDualWield() && HaveOffhandWeapon())          //allow update offhand damage only if player knows DualWield Spec and has equipped offhand weapon
            UpdateDamagePhysical(OFF_ATTACK);
    }
}

void Player::CalculateMinMaxDamage(WeaponAttackType attType, bool normalized, float& min_damage, float& max_damage, uint8 index) const
{
    UnitMods unitMod;

    switch (attType)
    {
        case BASE_ATTACK:
        default:
            unitMod = UNIT_MOD_DAMAGE_MAINHAND;
            break;
        case OFF_ATTACK:
            unitMod = UNIT_MOD_DAMAGE_OFFHAND;
            break;
        case RANGED_ATTACK:
            unitMod = UNIT_MOD_DAMAGE_RANGED;
            break;
    }

    float att_speed = GetAPMultiplier(attType, normalized) * m_modRecalcDamagePct[attType];

    float base_value  = GetModifierValue(unitMod, BASE_VALUE) + GetTotalAttackPowerValue(attType) / 14.0f * att_speed;
    float base_pct    = GetModifierValue(unitMod, BASE_PCT);
    float total_value = GetModifierValue(unitMod, TOTAL_VALUE);
    float total_pct   = GetModifierValue(unitMod, TOTAL_PCT);
    float total_phys  = GetTotalAuraModValue(UNIT_MOD_DAMAGE_PHYSICAL);

    float weapon_mindamage = GetWeaponDamageRange(attType, MINDAMAGE, index);
    float weapon_maxdamage = GetWeaponDamageRange(attType, MAXDAMAGE, index);

    if (IsAttackSpeedOverridenShapeShift()) // check if player is in shapeshift which doesnt use weapon
    {
        /* Druids don't use weapons so a weapon damage index > 0 
           should not affect their damage. Fixes crazy druid scaling
           when using melee weapons with two or more damage types on it */
        if (index > 0)
        {
            // Note that CalculateDamage will pull max_damage up to 5.0f, 
            // so they'll still get some extra damage...
            weapon_mindamage = 0.0f;
            weapon_maxdamage = 0.0f;
        }
        else 
        {
            uint32 lvl = GetLevel();
            if (lvl > 60)
                lvl = 60;

#pragma warning( push )
#pragma warning( disable : 4065)

            switch (GetShapeshiftForm())
            {
                // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                // - Cat Form - The base weapon damage of the form has been increased.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
                case FORM_CAT:
                    // guessed
                    weapon_mindamage = lvl * 0.60f * att_speed;
                    weapon_maxdamage = lvl * 1.00f * att_speed;
                    break;
#endif
                default:
                    weapon_mindamage = lvl * 0.85f * att_speed;
                    weapon_maxdamage = lvl * 1.25f * att_speed;
                    break;
            }

#pragma warning( pop ) 
            
            total_value = 0.0f;                             // remove benefit from weapon enchants
        }
    }
    else if (!CanUseEquippedWeapon(attType))                // check if player not in form but still can't use weapon (broken/etc)
    {
        weapon_mindamage = BASE_MINDAMAGE;
        weapon_maxdamage = BASE_MAXDAMAGE;
        total_value = 0.0f;
    }
    else if (attType == RANGED_ATTACK && index == 0)        // add ammo DPS to ranged damage
    {
        weapon_mindamage += GetAmmoDPS() * att_speed;
        weapon_maxdamage += GetAmmoDPS() * att_speed;
    }

    if (index != 0)
    {
        base_value = 0.0f;
        total_value = 0.0f;
        total_phys = 0.0f;
    }

    min_damage = ((base_value + weapon_mindamage) * base_pct + total_value + total_phys) * total_pct;
    max_damage = ((base_value + weapon_maxdamage) * base_pct + total_value + total_phys) * total_pct;
}

void Player::UpdateDamagePhysical(WeaponAttackType attType)
{
    float mindamage;
    float maxdamage;

    CalculateMinMaxDamage(attType, false, mindamage, maxdamage);

    switch (attType)
    {
        case BASE_ATTACK:
        default:
            SetStatFloatValue(UNIT_FIELD_MINDAMAGE, mindamage);
            SetStatFloatValue(UNIT_FIELD_MAXDAMAGE, maxdamage);
            break;
        case OFF_ATTACK:
            SetStatFloatValue(UNIT_FIELD_MINOFFHANDDAMAGE, mindamage);
            SetStatFloatValue(UNIT_FIELD_MAXOFFHANDDAMAGE, maxdamage);
            break;
        case RANGED_ATTACK:
            SetStatFloatValue(UNIT_FIELD_MINRANGEDDAMAGE, mindamage);
            SetStatFloatValue(UNIT_FIELD_MAXRANGEDDAMAGE, maxdamage);
            break;
    }
}

float Player::GetWeaponBasedAuraModifier(WeaponAttackType attType, AuraType auraType) const
{
    float amount = 0.0f;
    AuraList const& auras = GetAurasByType(auraType);
    if (auras.empty())
        return amount;

    Item* pWeapon = GetWeaponForAttack(attType);
    for (auto const& i : auras)
    {
        SpellEntry const* pSpellEntry = i->GetSpellProto();
        if (pSpellEntry->EquippedItemClass >= 0)
        {
            if (!pWeapon)
                continue;

            if (!pWeapon->IsFitToSpellRequirements(pSpellEntry))
                continue;
        }

        amount += i->GetModifier()->m_amount;
    }
    return amount;
}

void Player::UpdateDefenseBonusesMod()
{
    UpdateBlockPercentage();
    UpdateParryPercentage();
    UpdateDodgePercentage();
}

void Player::UpdateBlockPercentage()
{
    // No block
    float value = 0.0f;
    if (CanBlock())
    {
        // Base value
        value = 5.0f;
        // Modify value from defense skill
        value += (int32(GetDefenseSkillValue()) - int32(GetSkillMaxForLevel())) * 0.04f;
        // Increase from SPELL_AURA_MOD_BLOCK_PERCENT aura
        value += GetTotalAuraModifier(SPELL_AURA_MOD_BLOCK_PERCENT);
        value = value < 0.0f ? 0.0f : value;
    }
    SetStatFloatValue(PLAYER_BLOCK_PERCENTAGE, value);
}

void Player::UpdateCritPercentage(WeaponAttackType attType)
{
    BaseModGroup modGroup;
    uint16 index;

    switch (attType)
    {
        case RANGED_ATTACK:
            modGroup = RANGED_CRIT_PERCENTAGE;
            index = PLAYER_RANGED_CRIT_PERCENTAGE;
            break;
        case BASE_ATTACK:
            modGroup = CRIT_PERCENTAGE;
            index = PLAYER_CRIT_PERCENTAGE;
            break;
        case OFF_ATTACK:                                    // client have only main hand crit
        default:
            return;
    }

    float value = GetTotalPercentageModValue(modGroup);
    switch (GetClass())
    {
        case CLASS_DRUID:
            value += 0.9f;
            break;
        case CLASS_MAGE:
            value += 3.2f;
            break;
        case CLASS_PALADIN:
            value += 0.7f;
            break;
        case CLASS_PRIEST:
            value += 3.0f;
            break;
        case CLASS_SHAMAN:
            value += 1.7f;
            break;
        case CLASS_WARLOCK:
            value += 2.0f;
            break;
    }
    // Modify crit from weapon skill and maximized defense skill of same level victim difference
    value += (int32(GetWeaponSkillValue(attType)) - int32(GetSkillMaxForLevel())) * 0.04f;
    value = value < 0.0f ? 0.0f : value;
    SetStatFloatValue(index, value);
}

void Player::UpdateAllCritPercentages()
{
    float value = GetMeleeCritFromAgility();

    SetBaseModValue(CRIT_PERCENTAGE, PCT_MOD, value);
    SetBaseModValue(RANGED_CRIT_PERCENTAGE, PCT_MOD, value);

    UpdateCritPercentage(BASE_ATTACK);
    UpdateCritPercentage(RANGED_ATTACK);
}

void Player::UpdateParryPercentage()
{
    // No parry
    float value = 0.0f;
    if (CanParry())
    {
        // Base parry
        value  = 5.0f;
        // Modify value from defense skill
        value += (int32(GetDefenseSkillValue()) - int32(GetSkillMaxForLevel())) * 0.04f;
        // Parry from SPELL_AURA_MOD_PARRY_PERCENT aura
        value += GetWeaponBasedAuraModifier(BASE_ATTACK, SPELL_AURA_MOD_PARRY_PERCENT);
        value = value < 0.0f ? 0.0f : value;
    }
    SetStatFloatValue(PLAYER_PARRY_PERCENTAGE, value);
}

void Player::UpdateDodgePercentage()
{
    // Nostalrius : base dodge per class
    float value = 0.0f;
    switch (GetClass())
    {
        case CLASS_DRUID:
            value += 0.9f;
            break;
        case CLASS_MAGE:
            value += 3.2f;
            break;
        case CLASS_PALADIN:
            value += 0.7f;
            break;
        case CLASS_PRIEST:
            value += 3.0f;
            break;
        case CLASS_SHAMAN:
            value += 1.7f;
            break;
        case CLASS_WARLOCK:
            value += 2.0f;
            break;
    }
    // Dodge from agility
    value += GetDodgeFromAgility();
    // Modify value from defense skill
    value += (int32(GetDefenseSkillValue()) - int32(GetSkillMaxForLevel())) * 0.04f;
    // Dodge from SPELL_AURA_MOD_DODGE_PERCENT aura
    value += GetTotalAuraModifier(SPELL_AURA_MOD_DODGE_PERCENT);
    value = value < 0.0f ? 0.0f : value;
    SetStatFloatValue(PLAYER_DODGE_PERCENTAGE, value);
}

void Player::UpdateSpellCritChance(uint32 school)
{
    // For normal school set zero crit chance
    if (school == SPELL_SCHOOL_NORMAL)
    {
        m_SpellCritPercentage[1] = 0.0f;
        return;
    }
    // For others recalculate it from:
    float crit = 0.0f;
    // Crit from Intellect
    crit += GetSpellCritFromIntellect();
    // Increase crit from SPELL_AURA_MOD_SPELL_CRIT_CHANCE
    crit += GetTotalAuraModifier(SPELL_AURA_MOD_SPELL_CRIT_CHANCE);
    // Increase crit by school from SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL
    crit += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL, 1 << school);

    // Store crit value
    m_SpellCritPercentage[school] = crit;
}

void Player::UpdateAllSpellCritChances()
{
    for (int i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; ++i)
        UpdateSpellCritChance(i);
}

void Player::UpdateManaRegen()
{
    // Mana regen from spirit
    float power_regen = GetRegenMPPerSpirit();

    // Apply PCT bonus from SPELL_AURA_MOD_POWER_REGEN_PERCENT aura on spirit base regen
    power_regen *= GetTotalAuraMultiplierByMiscValue(SPELL_AURA_MOD_POWER_REGEN_PERCENT, POWER_MANA);

    // Mana regen from SPELL_AURA_MOD_POWER_REGEN aura
    float power_regen_mp5 = GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_POWER_REGEN, POWER_MANA) / 5.0f;

    // Set regen rate in cast state apply only on spirit based regen
    int32 modManaRegenInterrupt = GetTotalAuraModifier(SPELL_AURA_MOD_MANA_REGEN_INTERRUPT);
    if (modManaRegenInterrupt > 100)
        modManaRegenInterrupt = 100;

    m_modManaRegenInterrupt = power_regen_mp5 + power_regen * modManaRegenInterrupt / 100.0f;

    m_modManaRegen = power_regen_mp5 + power_regen;
}

void Player::_ApplyAllStatBonuses()
{
    SetCanModifyStats(false);

    _ApplyAllAuraMods();
    _ApplyAllItemMods();

    SetCanModifyStats(true);

    UpdateAllStats();
}

void Player::_RemoveAllStatBonuses()
{
    SetCanModifyStats(false);

    _RemoveAllItemMods();
    _RemoveAllAuraMods();

    SetCanModifyStats(true);

    UpdateAllStats();
}

/*#######################################
########                         ########
########    MOBS STAT SYSTEM     ########
########                         ########
#######################################*/

bool Creature::UpdateStats(Stats stat)
{
    if (stat > STAT_SPIRIT)
        return false;

    // value = ((base_value * base_pct) + total_value) * total_pct
    float value  = GetTotalStatValue(stat);

    SetStat(stat, int32(value));

    switch (stat)
    {
        case STAT_STRENGTH:
            UpdateAttackPowerAndDamage();
            break;
        case STAT_AGILITY:
            UpdateArmor();
            break;
        case STAT_STAMINA:
            UpdateMaxHealth();
            break;
        case STAT_INTELLECT:
            UpdateMaxPower(POWER_MANA);
            break;
        case STAT_SPIRIT:
        default:
            break;
    }

    if (GetMaxPower(POWER_MANA))
        UpdateManaRegen();

    return true;
}

bool Creature::UpdateAllStats()
{
    for (int i = STAT_STRENGTH; i < MAX_STATS; ++i)
    {
        float value = GetTotalStatValue(Stats(i));
        SetStat(Stats(i), (int32)value);
    }

    UpdateMaxHealth();
    UpdateAttackPowerAndDamage();
    UpdateAttackPowerAndDamage(true);

    for (int i = POWER_MANA; i < MAX_POWERS; ++i)
        UpdateMaxPower(Powers(i));

    for (int i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; ++i)
        UpdateResistances(i);

    if (GetMaxPower(POWER_MANA))
        UpdateManaRegen();

    return true;
}

void Creature::UpdateResistances(uint32 school)
{
    if (school > SPELL_SCHOOL_NORMAL)
    {
        int32 value = school == SPELL_SCHOOL_HOLY ? 0 : GetTotalResistanceValue(SpellSchools(school));
        SetResistance(SpellSchools(school), value);
    }
    else
        UpdateArmor();
}

void Creature::UpdateArmor()
{
    float dynamic = GetStat(STAT_AGILITY); // 1 agility = 1 armor for creatures

    m_auraModifiersGroup[UNIT_MOD_ARMOR][TOTAL_VALUE] += dynamic;
    int32 value = GetTotalResistanceValue(SPELL_SCHOOL_NORMAL);

    SetArmor(value);
    m_auraModifiersGroup[UNIT_MOD_ARMOR][TOTAL_VALUE] -= dynamic;
}

void Creature::UpdateMaxHealth()
{
    UnitMods unitMod = UNIT_MOD_HEALTH;
    float stamina = GetStat(STAT_STAMINA) - GetCreateStat(STAT_STAMINA);

    float value = GetModifierValue(unitMod, BASE_VALUE);
    if (IsPet())
        value += GetCreateHealth();
    value *= GetModifierValue(unitMod, BASE_PCT);
    value += GetModifierValue(unitMod, TOTAL_VALUE) + stamina * 10.0f;
    value *= GetModifierValue(unitMod, TOTAL_PCT);

    SetMaxHealth(std::max(1, int(value)));
}

void Creature::UpdateMaxPower(Powers power)
{
    UnitMods unitMod = UnitMods(UNIT_MOD_POWER_START + power);
    float intellect = (power == POWER_MANA) ? GetStat(STAT_INTELLECT) - GetCreateStat(STAT_INTELLECT) : 0.0f;

    float value  = GetModifierValue(unitMod, BASE_VALUE);
    if (IsPet())
        value += GetCreatePowers(power);
    value *= GetModifierValue(unitMod, BASE_PCT);
    value += GetModifierValue(unitMod, TOTAL_VALUE) + intellect * 15.0f;
    value *= GetModifierValue(unitMod, TOTAL_PCT);

    if (value < 0.0f)
        value = 0.0f;

    SetMaxPower(power, uint32(value));
}

void Creature::UpdateManaRegen()
{
    float ManaIncreaseRate = sWorld.getConfig(CONFIG_FLOAT_RATE_POWER_MANA);
    float intellect = std::max(1.0f, GetStat(STAT_INTELLECT));
    // Apply PCT bonus from SPELL_AURA_MOD_POWER_REGEN_PERCENT aura on spirit base regen
    float power_regen = GetTotalAuraMultiplierByMiscValue(SPELL_AURA_MOD_POWER_REGEN_PERCENT, POWER_MANA);
    // Mana regen from SPELL_AURA_MOD_POWER_REGEN aura
    float power_regen_mp5 = GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_POWER_REGEN, POWER_MANA) / 5.0f;
    
    m_manaRegen = (GetRegenMPPerSpirit() * power_regen + power_regen_mp5 + (0.6f * sqrt(intellect) / 5.0f)) * ManaIncreaseRate * 5.0f;
}

void Creature::UpdateAttackPowerAndDamage(bool ranged)
{
    AttackPowerModIndex unitMod = ranged ? RANGED_AP_MODS : MELEE_AP_MODS;

    uint16 index = UNIT_FIELD_ATTACK_POWER;
    uint16 index_mod = UNIT_FIELD_ATTACK_POWER_MODS;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    uint16 index_mult = UNIT_FIELD_ATTACK_POWER_MULTIPLIER;
#endif

    if (ranged)
    {
        index = UNIT_FIELD_RANGED_ATTACK_POWER;
        index_mod = UNIT_FIELD_RANGED_ATTACK_POWER_MODS;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        index_mult = UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER;
#endif
    }

    CreatureClassLevelStats const* pCLS = GetClassLevelStats();
    float baseAttackPower = ranged ? pCLS->ranged_attack_power : pCLS->attack_power;

    // attack power mods are split into positive and negative field
    float attackPowerModPositive = GetAttackPowerModifierValue(unitMod, AP_MOD_POSITIVE_FLAT);
    float attackPowerModNegative = GetAttackPowerModifierValue(unitMod, AP_MOD_NEGATIVE_FLAT);

    // Only apply AP bonus from stats when different than default value,
    // as the stats are already taken into account in the base AP values.
    if (GetCreateStat(STAT_STRENGTH) != GetStat(STAT_STRENGTH) ||
        GetCreateStat(STAT_AGILITY) != GetStat(STAT_AGILITY))
    {
        float defaultAPBonus = GetAttackPowerFromStrengthAndAgility(ranged, GetCreateStat(STAT_STRENGTH), GetCreateStat(STAT_AGILITY));
        float currentAPBonus = GetAttackPowerFromStrengthAndAgility(ranged, GetStat(STAT_STRENGTH), GetStat(STAT_AGILITY));

        float modFromStats = (currentAPBonus - defaultAPBonus);
        if (modFromStats > 0.0f)
            attackPowerModPositive += modFromStats;
        else
            attackPowerModNegative += modFromStats;
    }

    SetInt32Value(index, (int32)baseAttackPower);               //UNIT_FIELD_(RANGED)_ATTACK_POWER field
    SetInt16Value(index_mod, 0, (int16)attackPowerModPositive); //UNIT_FIELD_(RANGED)_ATTACK_POWER_MODS field (positive)
    SetInt16Value(index_mod, 1, (int16)attackPowerModNegative); //UNIT_FIELD_(RANGED)_ATTACK_POWER_MODS field (negative)

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    float attackPowerMultiplier = GetAttackPowerModifierValue(unitMod, AP_MOD_PCT) - 1.0f;
    SetFloatValue(index_mult, attackPowerMultiplier);           //UNIT_FIELD_(RANGED)_ATTACK_POWER_MULTIPLIER field
#endif

    //automatically update weapon damage after attack power modification
    if (ranged)
    {
        UpdateDamagePhysical(RANGED_ATTACK);
    }
    else
    {
        UpdateDamagePhysical(BASE_ATTACK);
        UpdateDamagePhysical(OFF_ATTACK);
    }
}

void Creature::UpdateDamagePhysical(WeaponAttackType attType)
{
    UnitMods unitMod;
    float databaseAttackPower;
    CreatureClassLevelStats const* pCLS = GetClassLevelStats();

    switch (attType)
    {
        case BASE_ATTACK:
        default:
            unitMod = UNIT_MOD_DAMAGE_MAINHAND;
            databaseAttackPower = pCLS->attack_power;
            break;
        case OFF_ATTACK:
            unitMod = UNIT_MOD_DAMAGE_OFFHAND;
            databaseAttackPower = pCLS->attack_power;
            break;
        case RANGED_ATTACK:
            unitMod = UNIT_MOD_DAMAGE_RANGED;
            databaseAttackPower = pCLS->ranged_attack_power;
            break;
    }

    float base_value  = GetModifierValue(unitMod, BASE_VALUE);
    float base_pct    = GetModifierValue(unitMod, BASE_PCT);
    float total_value = GetModifierValue(unitMod, TOTAL_VALUE);
    float total_pct   = GetModifierValue(unitMod, TOTAL_PCT);
    float total_phys  = GetTotalAuraModValue(UNIT_MOD_DAMAGE_PHYSICAL);

    float weapon_mindamage = GetWeaponDamageRange(attType, MINDAMAGE);
    float weapon_maxdamage = GetWeaponDamageRange(attType, MAXDAMAGE);

    // Disarm effects. Only applies to mobs with a weapon equipped. Sources suggest a 
    // ~60% damage reduction on mobs which can be disarmed and have a weapon
    // http://wowwiki.wikia.com/wiki/Attumen_the_Huntsman?oldid=1377353
    // http://wowwiki.wikia.com/wiki/Disarm?direction=prev&oldid=200198
    if (HasWeapon() && !CanUseEquippedWeapon(attType))
        total_pct *= 0.4f;

    /* AP for units is 30% of base damage.
     * ie if AP is reduced to 0, attack will be reduced of 30%
     * We have to ignore creatures that don't have AP set in database (we would divide by 0)
     */
    if (databaseAttackPower)
    {
        float attackPowerNow = GetTotalAttackPowerValue(attType);
        weapon_mindamage = weapon_mindamage * (0.7f + 0.3f * attackPowerNow / databaseAttackPower);
        weapon_maxdamage = weapon_maxdamage * (0.7f + 0.3f * attackPowerNow / databaseAttackPower);
    }

    float mindamage = ((base_value + weapon_mindamage) * base_pct + total_value + total_phys) * total_pct;
    float maxdamage = ((base_value + weapon_maxdamage) * base_pct + total_value + total_phys) * total_pct;

    uint16 fieldmin, fieldmax;

    switch (attType)
    {
        case RANGED_ATTACK:
            fieldmin = UNIT_FIELD_MINRANGEDDAMAGE;
            fieldmax = UNIT_FIELD_MAXRANGEDDAMAGE;
            break;
        case BASE_ATTACK:
            fieldmin = UNIT_FIELD_MINDAMAGE;
            fieldmax = UNIT_FIELD_MAXDAMAGE;
            break;
        case OFF_ATTACK:
            fieldmin = UNIT_FIELD_MINOFFHANDDAMAGE;
            fieldmax = UNIT_FIELD_MAXOFFHANDDAMAGE;
            break;
        default:
            return;
    }

    SetStatFloatValue(fieldmin, mindamage);
    SetStatFloatValue(fieldmax, maxdamage);
}

float Creature::GetWeaponBasedAuraModifier(WeaponAttackType attType, AuraType auraType) const
{
    float amount = 0.0f;
    AuraList const& auras = GetAurasByType(auraType);
    for (auto const& i : auras)
    {
        SpellEntry const* pSpellEntry = i->GetSpellProto();
        if (pSpellEntry->EquippedItemClass >= 0)
        {
            if (!GetVirtualItemDisplayId(attType))
                continue;

            if (!Item::IsFitToSpellRequirements(pSpellEntry, GetVirtualItemClass(attType), GetVirtualItemSubclass(attType), GetVirtualItemInventoryType(attType)))
                continue;
        }

        amount += i->GetModifier()->m_amount;
    }
    return amount;
}

/*#######################################
########                         ########
########    PETS STAT SYSTEM     ########
########                         ########
#######################################*/

bool Pet::UpdateAllStats()
{
    for (int i = STAT_STRENGTH; i < MAX_STATS; ++i)
        UpdateStats(Stats(i));

    for (int i = POWER_MANA; i < MAX_POWERS; ++i)
        UpdateMaxPower(Powers(i));

    for (int i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; ++i)
        UpdateResistances(i);

    if (GetMaxPower(POWER_MANA))
        UpdateManaRegen();

    return true;
}

void Pet::UpdateResistances(uint32 school)
{
    if (school > SPELL_SCHOOL_NORMAL)
        return Creature::UpdateResistances(school);
    else
        UpdateArmor();
}

void Pet::UpdateArmor()
{
    float amount = (GetStat(STAT_AGILITY) * (getPetType() == HUNTER_PET ? 2.0f : 1.0f));

    m_auraModifiersGroup[UNIT_MOD_ARMOR][TOTAL_VALUE] += amount;
    int32 value = GetTotalResistanceValue(SPELL_SCHOOL_NORMAL);

    SetArmor(value);
    m_auraModifiersGroup[UNIT_MOD_ARMOR][TOTAL_VALUE] -= amount;
}

void Pet::UpdateAttackPowerAndDamage(bool ranged)
{
    if (ranged)
        return;

    AttackPowerModIndex unitMod = MELEE_AP_MODS;

    float baseAttackPower  = (GetEntry() == 416) ? GetStat(STAT_STRENGTH) - 10.0f : 2 * GetStat(STAT_STRENGTH) - 20.0f;

    // attack power mods are split into positive and negative field
    float attackPowerModPositive = GetAttackPowerModifierValue(unitMod, AP_MOD_POSITIVE_FLAT);
    float attackPowerModNegative = GetAttackPowerModifierValue(unitMod, AP_MOD_NEGATIVE_FLAT);

    //UNIT_FIELD_(RANGED)_ATTACK_POWER field
    SetInt32Value(UNIT_FIELD_ATTACK_POWER, (int32)baseAttackPower);

    //UNIT_FIELD_(RANGED)_ATTACK_POWER_MODS field
    SetInt16Value(UNIT_FIELD_ATTACK_POWER_MODS, 0, (int16)attackPowerModPositive); // positive
    SetInt16Value(UNIT_FIELD_ATTACK_POWER_MODS, 1, (int16)attackPowerModNegative); // negative

    //UNIT_FIELD_(RANGED)_ATTACK_POWER_MULTIPLIER field
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    float attackPowerMultiplier = GetAttackPowerModifierValue(unitMod, AP_MOD_PCT) - 1.0f;
    SetFloatValue(UNIT_FIELD_ATTACK_POWER_MULTIPLIER, attackPowerMultiplier);
#endif

    //automatically update weapon damage after attack power modification
    UpdateDamagePhysical(BASE_ATTACK);
}

void Pet::UpdateDamagePhysical(WeaponAttackType attType)
{
    if (attType > BASE_ATTACK)
        return;

    UnitMods unitMod = UNIT_MOD_DAMAGE_MAINHAND;

    float base_value  = GetModifierValue(unitMod, BASE_VALUE);
    float base_pct    = GetModifierValue(unitMod, BASE_PCT);
    float total_value = GetModifierValue(unitMod, TOTAL_VALUE);
    float total_pct   = GetModifierValue(unitMod, TOTAL_PCT);
    float total_phys  = GetTotalAuraModValue(UNIT_MOD_DAMAGE_PHYSICAL);

    float weapon_mindamage = GetWeaponDamageRange(attType, MINDAMAGE);
    float weapon_maxdamage = GetWeaponDamageRange(attType, MAXDAMAGE);

    /* AP for units is 30% of base damage.
     * ie if AP is reduced to 0, attack will be reduced of 30%
     * We have to ignore creatures that don't have AP set in database (we would divide by 0)
     */
    // Compute base attack power
    float createAttackPower = getPetType() == HUNTER_PET ? 2.0f * GetCreateStat(STAT_STRENGTH) - 20.0f
                                                         : GetInt32Value(UNIT_FIELD_ATTACK_POWER);

    if (createAttackPower > 0)
    {
        float attackPowerNow = GetTotalAttackPowerValue(attType);
        weapon_mindamage = weapon_mindamage * (0.7f + 0.3f * attackPowerNow / createAttackPower);
        weapon_maxdamage = weapon_maxdamage * (0.7f + 0.3f * attackPowerNow / createAttackPower);
    }

    float mindamage = ((base_value + weapon_mindamage) * base_pct + total_value + total_phys) * total_pct;
    float maxdamage = ((base_value + weapon_maxdamage) * base_pct + total_value + total_phys) * total_pct;

    //  Pet's base damage changes depending on happiness
    if (getPetType() == HUNTER_PET)
    {
        switch (GetHappinessState())
        {
            case HAPPY:
                // 125% of normal damage
                mindamage = mindamage * 1.25f;
                maxdamage = maxdamage * 1.25f;
                break;
            case CONTENT:
                // 100% of normal damage, nothing to modify
                break;
            case UNHAPPY:
                // 75% of normal damage
                mindamage = mindamage * 0.75f;
                maxdamage = maxdamage * 0.75f;
                break;
        }
    }

    SetStatFloatValue(UNIT_FIELD_MINDAMAGE, mindamage);
    SetStatFloatValue(UNIT_FIELD_MAXDAMAGE, maxdamage);
}
