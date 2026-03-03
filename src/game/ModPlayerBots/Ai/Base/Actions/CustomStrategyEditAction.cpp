/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "CustomStrategyEditAction.h"

#include "Event.h"
#include "PlayerbotAI.h"

bool CustomStrategyEditAction::Execute(Event /*event*/)
{
    botAI->TellError("Custom strategy editing is not available in Vanilla compatibility mode");
    return false;
}

bool CustomStrategyEditAction::PrintHelp()
{
    botAI->TellError("Custom strategy editing is not available in Vanilla compatibility mode");
    return false;
}

bool CustomStrategyEditAction::PrintActionLine(uint32 /*idx*/, std::string const /*command*/) { return false; }
bool CustomStrategyEditAction::Print(std::string const /*name*/) { return false; }
bool CustomStrategyEditAction::Edit(std::string const /*name*/, uint32 /*idx*/, std::string const /*command*/) { return false; }
