/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "DKTriggers.h"

#include <string>

#include "GenericTriggers.h"
#include "Playerbots.h"
#include "SharedDefines.h"

bool DKPresenceTrigger::IsActive()
{
    Unit* target = GetTarget();
    return !botAI->HasAura("blood presence", target) && !botAI->HasAura("unholy presence", target) &&
           !botAI->HasAura("frost presence", target);
}

bool PestilenceGlyphTrigger::IsActive()
{
    if (!SpellTrigger::IsActive())
    {
        return false;
    }
    if (!bot->HasAura(63334))
    {
        return false;
    }
    SpellAuraHolder* blood_plague = botAI->GetAura("blood plague", GetTarget(), true, true);
    SpellAuraHolder* frost_fever = botAI->GetAura("frost fever", GetTarget(), true, true);
    if ((blood_plague && blood_plague->GetAuraDuration() <= 3000) || (frost_fever && frost_fever->GetAuraDuration() <= 3000))
    {
        return true;
    }
    return false;
}

// Based on runeSlotTypes
bool HighBloodRuneTrigger::IsActive()
{
    return false;
}

bool HighFrostRuneTrigger::IsActive()
{
    return false;
}

bool HighUnholyRuneTrigger::IsActive()
{
    return false;
}

bool NoRuneTrigger::IsActive()
{
    return false;
}

bool DesolationTrigger::IsActive()
{
    return bot->HasAura(66817) && BuffTrigger::IsActive();
}

bool DeathAndDecayCooldownTrigger::IsActive()
{
    return SpellTrigger::IsActive();
}
