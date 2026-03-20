/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#ifndef _PLAYERBOT_PARTYTRIGGERS_H
#define _PLAYERBOT_PARTYTRIGGERS_H

#include "Trigger.h"

class PlayerbotAI;

class NoRealPlayerPartyTimeoutTrigger : public Trigger
{
public:
    NoRealPlayerPartyTimeoutTrigger(PlayerbotAI* botAI)
        : Trigger(botAI, "no real player party timeout", 5)
    {
    }

    bool IsActive() override;
};

#endif
