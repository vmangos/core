/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "RandombotPartyStrategy.h"

void RandombotPartyStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    triggers.push_back(new TriggerNode("often", { NextAction("give leader", 4.0f) }));
    triggers.push_back(new TriggerNode("no real player party timeout", { NextAction("leave no real player party", 5.0f) }));
}
