#include "PartyBotAI.h"
#include "PartyBotAI.h"
#include "PartyBotRaidStrats.h"

enum ProtectionPotionSpellId {
    GREATER_FIRE_PROTECTION_POTION_SPELL = 17574,
};

enum ProtectionPotionItemId {

    GREATER_FIRE_PROTECTION_POTION_ITEM = 13457,
};

bool PartyBotAI::RaidStratsIsInRaid()
{
    if (me->GetMap()->IsRaid())
    {
        return true;
    }
        return false;
}

void PartyBotAI::PartyBotAI::RaidStratsIsZGPotions()
{
    if (me->GetZoneId() != 1977)
    {
        return;
    }

    //High Priestess Jeklik
    if (me->GetAreaId() == 3378)
    {
        // GFPP for all
        if (!me->HasAura(GREATER_FIRE_PROTECTION_POTION_SPELL))
        {
            if (CanUsePotionsOrRune(GREATER_FIRE_PROTECTION_POTION_ITEM))
            {
                UsePotionsOrRune(GREATER_FIRE_PROTECTION_POTION_ITEM);
                return;
            }
        }
    }
}