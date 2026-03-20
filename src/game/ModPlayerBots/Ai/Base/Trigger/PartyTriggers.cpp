/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PartyTriggers.h"

#include "PartyLeadershipUtils.h"
#include "PlayerbotAIConfig.h"

bool NoRealPlayerPartyTimeoutTrigger::IsActive()
{
    time_t since = AI_VALUE(time_t, "party without real player since");

    if (!PartyLeadership::IsEligibleRandombotPartyLeader(botAI))
    {
        SET_AI_VALUE(time_t, "party without real player since", 0);
        return false;
    }

    if (sPlayerbotAIConfig.randomBotNoRealPlayerPartyTimeout == 0)
    {
        SET_AI_VALUE(time_t, "party without real player since", 0);
        return false;
    }

    if (PartyLeadership::HasActiveRealPlayerInGroup(bot))
    {
        SET_AI_VALUE(time_t, "party without real player since", 0);
        return false;
    }

    time_t now = time(nullptr);
    if (!since)
    {
        SET_AI_VALUE(time_t, "party without real player since", now);
        return false;
    }

    if (static_cast<uint32>(now - since) < sPlayerbotAIConfig.randomBotNoRealPlayerPartyTimeout)
        return false;

    return !bot->IsInCombat();
}
