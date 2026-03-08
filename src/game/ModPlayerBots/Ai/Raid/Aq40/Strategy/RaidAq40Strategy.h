#ifndef _PLAYERBOT_RAIDAQ40STRATEGY_H
#define _PLAYERBOT_RAIDAQ40STRATEGY_H

#include "AiObjectContext.h"
#include "Multiplier.h"
#include "Strategy.h"

class RaidAq40Strategy : public Strategy
{
public:
    RaidAq40Strategy(PlayerbotAI* botAI) : Strategy(botAI) {}
    std::string const getName() override { return "aq40"; }
    void InitTriggers(std::vector<TriggerNode*>& triggers) override;
    void InitMultipliers(std::vector<Multiplier*>& multipliers) override;
};

#endif
