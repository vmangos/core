#ifndef ROBOT_STRATEGY_BLACKROCK_SPIRE_H
#define ROBOT_STRATEGY_BLACKROCK_SPIRE_H

#include "Strategy_Group.h"

enum GroupRole_Blackrock_Spire :uint32
{
    GroupRole_Blackrock_Spire_DPS = 0,
    GroupRole_Blackrock_Spire_Tank1 = 1,
    GroupRole_Blackrock_Spire_Tank2 = 2,
    GroupRole_Blackrock_Spire_Tank3 = 3,
    GroupRole_Blackrock_Spire_Healer1 = 4,
    GroupRole_Blackrock_Spire_Healer2 = 5,
};

enum ActionType_Blackrock_Spire :uint32
{
    ActionType_Blackrock_Spire_None = 0,
};

class Strategy_Group_BlackrockSpire :public Strategy_Group
{
public:
    Strategy_Group_BlackrockSpire(Player* pmMe) :Strategy_Group(pmMe)
    {
        InitialStrategy();
    }

    void InitialStrategy();

    void Update(uint32 pmDiff) override;
    std::string GetGroupRoleName() override;
    void SetGroupRole(std::string pmRoleName) override;
    Player* GetMainTank() override;
    bool DPS() override;
    bool Engage(Unit* pmTarget);
    bool Heal() override;
    bool Tank() override;
    bool Tank(Unit* pmTarget) override;
};
#endif
