#ifndef ROBOT_STRATEGY_BASE_H
#define ROBOT_STRATEGY_BASE_H

#ifndef ANGLE_RANGE
# define ANGLE_RANGE M_PI / 16
#endif

#include "Script_Base.h"
#include "Player.h"

class Strategy_Base
{
public:
    Strategy_Base(Player* pmMe);
    virtual void Update(uint32 pmDiff);

public:
    Player* me;
    Script_Base* sb;
    Unit* engageTarget;

    int eatDelay;
    int drinkDelay;
    int32 engageDelay;
};
#endif
