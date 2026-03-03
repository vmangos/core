/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "CheckMailAction.h"

#include "Event.h"

bool CheckMailAction::Execute(Event /*event*/)
{
    // Trinity mail APIs used by upstream playerbots are not available in Vanilla vMaNGOS.
    // Keep action as a no-op during the Vanilla compatibility phase.
    return false;
}

bool CheckMailAction::isUseful()
{
    return false;
}

void CheckMailAction::ProcessMail(Mail* /*mail*/, Player* /*owner*/) {}
