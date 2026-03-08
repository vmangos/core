#ifndef _PLAYERBOT_RAIDAQ40MULTIPLIERS_H
#define _PLAYERBOT_RAIDAQ40MULTIPLIERS_H

#include "Multiplier.h"

class Aq40BugTrioAoeMultiplier : public Multiplier
{
public:
    Aq40BugTrioAoeMultiplier(PlayerbotAI* botAI) : Multiplier(botAI, "aq40 bug trio aoe multiplier") {}
    float GetValue(Action* action) override;
};

class Aq40ViscidusPriorityMultiplier : public Multiplier
{
public:
    Aq40ViscidusPriorityMultiplier(PlayerbotAI* botAI) : Multiplier(botAI, "aq40 viscidus priority multiplier") {}
    float GetValue(Action* action) override;
};

class Aq40TwinEmperorsTargetMultiplier : public Multiplier
{
public:
    Aq40TwinEmperorsTargetMultiplier(PlayerbotAI* botAI) : Multiplier(botAI, "aq40 twin emperors target multiplier") {}
    float GetValue(Action* action) override;
};

class Aq40CthunPriorityMultiplier : public Multiplier
{
public:
    Aq40CthunPriorityMultiplier(PlayerbotAI* botAI) : Multiplier(botAI, "aq40 cthun priority multiplier") {}
    float GetValue(Action* action) override;
};

#endif
