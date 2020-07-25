#ifndef ROBOT_STRATEGY_TEST_H
#define ROBOT_STRATEGY_TEST_H

#include "Strategy_Group.h"

class Strategy_Group_Test :public Strategy_Group
{
public:
	Strategy_Group_Test(Player* pmMe) :Strategy_Group(pmMe)
	{
		InitialStrategy();
	}

	void InitialStrategy();
};
#endif
