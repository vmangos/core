#include "UseMeetingStoneAction.h"
#include "VehicleActions.h"
#include "WhoAction.h"
#include "WipeAction.h"
#include "WorldBuffAction.h"

bool SummonAction::Execute(Event)
{
    return false;
}

bool SummonAction::Teleport(Player*, Player*, bool)
{
    return false;
}

bool SummonAction::SummonUsingGos(Player*, Player*, bool)
{
    return false;
}

bool SummonAction::SummonUsingNpcs(Player*, Player*, bool)
{
    return false;
}

bool UseMeetingStoneAction::Execute(Event)
{
    return false;
}

bool EnterVehicleAction::Execute(Event)
{
    return false;
}

bool EnterVehicleAction::EnterVehicle(Unit*, bool)
{
    return false;
}

bool LeaveVehicleAction::Execute(Event)
{
    return false;
}

bool WhoAction::Execute(Event)
{
    return false;
}

std::string const WhoAction::QueryTrade(std::string const)
{
    return "";
}

std::string const WhoAction::QuerySkill(std::string const)
{
    return "";
}

std::string const WhoAction::QuerySpec(std::string const)
{
    return "";
}

bool WipeAction::Execute(Event)
{
    return false;
}

bool WorldBuffAction::Execute(Event)
{
    return false;
}

std::vector<uint32> WorldBuffAction::NeedWorldBuffs(Unit*)
{
    return {};
}
