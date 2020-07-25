#ifndef ROBOT_STRATEGY_DOCTOR_WEAVIL_H
#define ROBOT_STRATEGY_DOCTOR_WEAVIL_H

#include "Strategy_Group.h"

class Strategy_Group_DoctorWeavil :public Strategy_Group
{
public:
    Strategy_Group_DoctorWeavil(Player* pmMe) :Strategy_Group(pmMe)
    {
        InitialStrategy();
    }

    bool DPS() override;
    bool Tank() override;
};
#endif
