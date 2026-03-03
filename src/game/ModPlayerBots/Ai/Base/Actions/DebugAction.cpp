/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "DebugAction.h"

#include "Event.h"
#include "PlayerbotAI.h"

bool DebugAction::Execute(Event /*event*/)
{
    botAI->TellError("Debug action is limited in Vanilla compatibility mode");
    return false;
}

void DebugAction::FakeSpell(uint32 /*spellId*/, Unit* /*truecaster*/, Unit* /*caster*/, ObjectGuid /*target*/,
                            GuidVector /*otherTargets*/, GuidVector /*missTargets*/, WorldPosition /*source*/,
                            WorldPosition /*dest*/, bool /*forceDest*/)
{
}

void DebugAction::addAura(uint32 /*spellId*/, Unit* /*target*/) {}
