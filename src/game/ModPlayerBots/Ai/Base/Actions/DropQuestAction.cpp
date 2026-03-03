/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "DropQuestAction.h"

#include "Event.h"

bool DropQuestAction::Execute(Event /*event*/)
{
    return false;
}

bool CleanQuestLogAction::Execute(Event /*event*/)
{
    return false;
}

void CleanQuestLogAction::DropQuestType(uint8& /*numQuest*/, uint8 /*wantNum*/, bool /*isGreen*/, bool /*hasProgress*/, bool /*isComplete*/) {}

bool CleanQuestLogAction::HasProgress(Player* /*bot*/, Quest const* /*quest*/)
{
    return false;
}
