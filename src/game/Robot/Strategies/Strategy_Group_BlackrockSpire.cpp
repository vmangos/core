#include "Strategy_Group_BlackrockSpire.h"
#include "Script_Warrior.h"
#include "Script_Hunter.h"
#include "Script_Shaman.h"
#include "Script_Paladin.h"
#include "Script_Warlock.h"
#include "Script_Priest.h"
#include "Script_Rogue.h"
#include "Script_Mage.h"
#include "Script_Druid.h"
#include "RobotConfig.h"
#include "RobotManager.h"
#include "Group.h"
#include "MotionMaster.h"
#include "TargetedMovementGenerator.h"
#include "GridNotifiers.h"
#include "Map.h"
#include "Pet.h"

std::string Strategy_Group_BlackrockSpire::GetGroupRoleName()
{
    if (!me)
    {
        return "";
    }
    switch (me->groupRole)
    {
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_DPS:
    {
        return "dps";
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank1:
    {
        return "tank1";
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank2:
    {
        return "tank2";
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank3:
    {
        return "tank3";
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer1:
    {
        return "healer1";
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer2:
    {
        return "healer2";
    }
    default:
    {
        break;
    }
    }
    return "dps";
}

void Strategy_Group_BlackrockSpire::SetGroupRole(std::string pmRoleName)
{
    if (!me)
    {
        return;
    }
    if (pmRoleName == "dps")
    {
        me->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_DPS;
    }
    else if (pmRoleName == "tank1")
    {
        me->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank1;
    }
    else if (pmRoleName == "tank2")
    {
        me->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank2;
    }
    else if (pmRoleName == "tank3")
    {
        me->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank3;
    }
    else if (pmRoleName == "healer1")
    {
        me->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer1;
    }
    else if (pmRoleName == "healer2")
    {
        me->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer2;
    }
}

void Strategy_Group_BlackrockSpire::InitialStrategy()
{
    Strategy_Group::InitialStrategy();
}

Player* Strategy_Group_BlackrockSpire::GetMainTank()
{
    if (!me)
    {
        return NULL;
    }
    if (Group* myGroup = me->GetGroup())
    {
        Player* tank1 = NULL;
        Player* tank2 = NULL;
        Player* tank3 = NULL;
        for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
        {
            if (Player* member = groupRef->getSource())
            {
                if (member->groupRole == GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank1)
                {
                    tank1 = member;
                }
                else if (member->groupRole == GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank2)
                {
                    tank2 = member;
                }
                else if (member->groupRole == GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank3)
                {
                    tank3 = member;
                }
            }
        }
        if (tank1)
        {
            if (tank1->IsAlive())
            {
                if (me->GetDistance(tank1) < ATTACK_RANGE_LIMIT)
                {
                    return tank1;
                }
            }
        }
        if (tank2)
        {
            if (tank2->IsAlive())
            {
                if (me->GetDistance(tank2) < ATTACK_RANGE_LIMIT)
                {
                    return tank2;
                }
            }
        }
        if (tank3)
        {
            if (tank3->IsAlive())
            {
                if (me->GetDistance(tank3) < ATTACK_RANGE_LIMIT)
                {
                    return tank3;
                }
            }
        }
    }

    return NULL;
}

bool Strategy_Group_BlackrockSpire::DPS()
{
    return Strategy_Group::DPS();
}

bool Strategy_Group_BlackrockSpire::Heal()
{
    return Strategy_Group::Heal();
}

bool Strategy_Group_BlackrockSpire::Engage(Unit* pmTarget)
{
    if (!me)
    {
        return false;
    }
    if (!me->IsAlive())
    {
        return false;
    }
    switch (me->groupRole)
    {
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_DPS:
    {
        return sb->DPS(pmTarget, Chasing());
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer1:
    {
        return Heal();
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer2:
    {
        return Heal();
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank1:
    {
        return Tank(pmTarget);
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank2:
    {
        return Tank(pmTarget);
    }
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank3:
    {
        return Tank(pmTarget);
    }
    default:
    {
        break;
    }
    }

    return false;
}

bool Strategy_Group_BlackrockSpire::Tank(Unit* pmTarget)
{
    if (!me)
    {
        return false;
    }
    if (!me->IsAlive())
    {
        return false;
    }
    switch (me->groupRole)
    {
    case GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank1:
    {
        sb->ClearTarget();
        sb->ChooseTarget(pmTarget);
        return sb->Tank(pmTarget, Chasing());
    }
    default:
    {
        break;
    }
    }

    return false;
}

bool Strategy_Group_BlackrockSpire::Tank()
{
    return Strategy_Group::Tank();
}

void Strategy_Group_BlackrockSpire::Update(uint32 pmDiff)
{
    return Strategy_Group::Update(pmDiff);
}
