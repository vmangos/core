/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#ifndef _PLAYERBOT_RANDOMBOTPARTYSTRATEGY_H
#define _PLAYERBOT_RANDOMBOTPARTYSTRATEGY_H

#include "NonCombatStrategy.h"

class PlayerbotAI;

class RandombotPartyStrategy : public NonCombatStrategy
{
public:
    RandombotPartyStrategy(PlayerbotAI* botAI) : NonCombatStrategy(botAI) {}

    std::string const getName() override { return "randombot party"; }
    uint32 GetType() const override { return STRATEGY_TYPE_GENERIC; }
    void InitTriggers(std::vector<TriggerNode*>& triggers) override;
};

#endif
