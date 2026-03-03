/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "TravelAction.h"

#include "Playerbots.h"

bool TravelAction::Execute(Event event)
{
    TravelTarget* target = AI_VALUE(TravelTarget*, "travel target");
    if (target)
        target->setStatus(TRAVEL_STATUS_WORK);
    return false;
}

bool TravelAction::isUseful()
{
    return false && AI_VALUE(TravelTarget*, "travel target")->isActive() &&
           (!AI_VALUE(GuidPosition, "rpg target") || !AI_VALUE(ObjectGuid, "pull target"));
}

bool MoveToDarkPortalAction::Execute(Event event)
{
    botAI->TellError("Dark Portal travel is disabled in Vanilla port.");
    return false;
}

bool MoveToDarkPortalAction::isUseful() { return bot->GetLevel() > 54; }

bool DarkPortalAzerothAction::Execute(Event event)
{
    botAI->TellError("Dark Portal travel is disabled in Vanilla port.");
    return false;
}

bool DarkPortalAzerothAction::isUseful() { return bot->GetLevel() > 57; }

bool MoveFromDarkPortalAction::Execute(Event event)
{
    RESET_AI_VALUE(GuidPosition, "rpg target");
    botAI->TellError("Dark Portal travel is disabled in Vanilla port.");
    return false;
}
