/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#ifndef _PLAYERBOT_PARTYLEADERSHIPVALUES_H
#define _PLAYERBOT_PARTYLEADERSHIPVALUES_H

#include "Value.h"

class PlayerbotAI;

class PartyWithoutRealPlayerSinceValue : public ManualSetValue<time_t>
{
public:
    PartyWithoutRealPlayerSinceValue(PlayerbotAI* botAI)
        : ManualSetValue<time_t>(botAI, 0, "party without real player since")
    {
    }
};

#endif
