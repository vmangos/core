#include "PartyBotAI.h"
#include "PartyBotAI.h"
#include "PartyBotRaidStrats.h"

const uint16 ARCANE_BRILLIANCE = 23028;
const uint16 ARCANE_INTELLECT = 10157;
const uint16 DIVINE_SPIRIT = 27841;
const uint16 PRAYER_OF_SPIRIT = 27681;

enum class RaidStratsPotionItemId {
    ELEXIR_OF_FORTITUDE = 3825,
    MAJOR_TROLLS_BLOOD_POTION = 20004,
    ELIXIR_OF_SUPERIOR_DEFENSE = 13445,
    ELIXIR_OF_THE_MONGOOSE = 13452,
    ELIXIR_OF_GIANTS = 9206,
    MAGEBLOOD_POTION = 20007,
    GIFT_OF_ARTHAS = 9088,
    ELIXIR_OF_GREATER_INTELLECT = 9179,
    ELIXIR_OF_THE_SAGES = 13447,
    ELIXIR_OF_SHADOW_POWER = 9264,
    GREATER_ARCANE_ELIXIR = 13454,
    WINTERFALL_FIREWATER = 12820,
    ELIXIR_OF_FROST_POWER = 17708,

    GREATER_FROST_PROTECTION_POTION = 13456,
    GREATER_FIRE_PROTECTION_POTION = 13457,
    GREATER_NATURE_PROTECTION_POTION = 13458,
    GREATER_SHADOW_PROTECTION_POTION = 13459,
    GREATER_HOLY_PROTECTION_POTION = 13460,
    GREATER_ARCANE_PROTECTION_POTION = 13461,
    FLASK_OF_CHROMATIC_RESISTANCE = 13513,
};

enum class RaidStratsPotionAuraId {
    ELEXIR_OF_FORTITUDE = 3593,
    MAJOR_TROLLS_BLOOD_POTION = 24361,
    ELIXIR_OF_SUPERIOR_DEFENSE = 11348,
    ELIXIR_OF_THE_MONGOOSE = 17538,
    ELIXIR_OF_GIANTS = 11405,
    MAGEBLOOD_POTION = 24363,
    GIFT_OF_ARTHAS = 11371,
    ELIXIR_OF_GREATER_INTELLECT = 11396,
    ELIXIR_OF_THE_SAGES = 17535,
    ELIXIR_OF_SHADOW_POWER = 11474,
    GREATER_ARCANE_ELIXIR = 17539,
    WINTERFALL_FIREWATER = 17038,
    ELIXIR_OF_FROST_POWER = 21920,

    GREATER_FIRE_PROTECTION_POTION = 17543,
    GREATER_FROST_PROTECTION_POTION = 17544,
    GREATER_HOLY_PROTECTION_POTION = 17545,
    GREATER_NATURE_PROTECTION_POTION = 17546,
    GREATER_SHADOW_PROTECTION_POTION = 17548,
    GREATER_ARCANE_PROTECTION_POTION = 17549,
    FLASK_OF_CHROMATIC_RESISTANCE = 17629,
};

bool PartyBotAI::RaidStratsIsInRaid()
{
    if (me->GetMap()->IsRaid())
    {
        return true;
    }
        return false;
}

void PartyBotAI::RaidStratsDefaultPotionsInRaid()
{
    // Elixir of Fortitude
    if (!me->HasAura((int)RaidStratsPotionAuraId::ELEXIR_OF_FORTITUDE))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELEXIR_OF_FORTITUDE))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::ELEXIR_OF_FORTITUDE);
            return;
        }
    }
    
    // Major Troll's Blood Potion
    if (!me->HasAura((int)RaidStratsPotionAuraId::MAJOR_TROLLS_BLOOD_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::MAJOR_TROLLS_BLOOD_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::MAJOR_TROLLS_BLOOD_POTION);
            return;
        }
    }
    
    if (m_role == ROLE_TANK || m_role == ROLE_MELEE_DPS || me->GetClass() == CLASS_HUNTER)
    {
        //Elixir of Superior Defense
        if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_SUPERIOR_DEFENSE))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SUPERIOR_DEFENSE))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SUPERIOR_DEFENSE);
                return;
            }
        }

        //Elixir of the Mongoose
        if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_THE_MONGOOSE))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_MONGOOSE))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_MONGOOSE);
                return;
            }
        }

        //Elixir of Giants
        if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_GIANTS))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GIANTS))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GIANTS);
                return;
            }
        }

        //Winterfall Firewater
        if (!me->HasAura((int)RaidStratsPotionAuraId::WINTERFALL_FIREWATER))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::WINTERFALL_FIREWATER))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::WINTERFALL_FIREWATER);
                return;
            }
        }

        if (m_role == ROLE_TANK)
        {
            //Gift of Arthas
            if (!me->HasAura((int)RaidStratsPotionAuraId::GIFT_OF_ARTHAS))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GIFT_OF_ARTHAS))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::GIFT_OF_ARTHAS);
                    return;
                }
            }
        }
    }

    if ((m_role == ROLE_RANGE_DPS || m_role == ROLE_HEALER) && me->GetClass() != CLASS_HUNTER)
    {
        //Mageblood Potion
        if (!me->HasAura((int)RaidStratsPotionAuraId::MAGEBLOOD_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::MAGEBLOOD_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::MAGEBLOOD_POTION);
                return;
            }
        }

        //Elixir of Greater Intellect if no mage
        if (!me->HasAura(ARCANE_BRILLIANCE) && !me->HasAura(ARCANE_INTELLECT) && !me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_GREATER_INTELLECT))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GREATER_INTELLECT))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GREATER_INTELLECT);
                return;
            }
        }

        //Elixir of the Sages
        if (!me->HasAura(DIVINE_SPIRIT) && !me->HasAura(PRAYER_OF_SPIRIT) && !me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_THE_SAGES))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_SAGES))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_SAGES);
                return;
            }
        }
        
        if ((m_role == ROLE_RANGE_DPS && me->GetClass() == CLASS_PRIEST) || me->GetClass() == CLASS_WARLOCK)
        {
            //Elixir of Shadow Power
            if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_SHADOW_POWER))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SHADOW_POWER))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SHADOW_POWER);
                    return;
                }
            }            
        }

        if (me->GetClass() == CLASS_MAGE)
        {
            //Elixir of Frost Power
            if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_FROST_POWER))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_FROST_POWER))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_FROST_POWER);
                    return;
                }
            }
        }

        if (m_role != ROLE_HEALER)
        {
            //Greater Arcane Elixir
            if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_ARCANE_ELIXIR))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_ELIXIR))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_ELIXIR);
                    return;
                }
            }
        }
    }
}

void PartyBotAI::RaidStratsInZGProtectionPotions()
{
    if (me->GetZoneId() != 1977)
    {
        return;
    }

    //High Priest Venoxis
    if (me->GetAreaId() == 3377)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_NATURE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION);
                return;
            }
        }
    }

    //High Priestess Jeklik
    if (me->GetAreaId() == 3378)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_FIRE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION);
                return;
            }
        }
        if (me->GetPowerType() == POWER_MANA && !me->HasAura((int)RaidStratsPotionAuraId::GREATER_ARCANE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION);
                return;
            }
        }
    }

    //High Priestess Mar'li
    if (me->GetAreaId() == 3379)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_NATURE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION);
                return;
            }
        }
    }

    //Jin'do the Hexxer
    if (me->GetAreaId() == 3383)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_SHADOW_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION);
                return;
            }
        }
    }

    //Hakkar
    if (me->GetAreaId() == 3384)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_NATURE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION);
                return;
            }
        }

        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_SHADOW_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION);
                return;
            }
        }
    }

    //Gahz'ranka
    if (me->GetAreaId() == 3419)
    {
        if (me->GetPowerType() == POWER_MANA && !me->HasAura((int)RaidStratsPotionAuraId::GREATER_FROST_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FROST_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FROST_PROTECTION_POTION);
                return;
            }
        }
    }
}

void PartyBotAI::RaidStratsInZGBosses() {

    //Bloodlord Mandokir
    const uint16 THREATENING_GAZE = 24314;
    if (me->GetAreaId() == 3380 && me->HasAura(THREATENING_GAZE))
    {
        me->InterruptNonMeleeSpells(false);
        me->AttackStop();
        me->StopMoving();
        me->ClearTarget();
    }
}