#include "RaidAq40Multipliers.h"

#include "RaidAq40Helpers.h"

using namespace Aq40Helpers;

float Aq40BugTrioAoeMultiplier::GetValue(Action* action)
{
    if (!IsInAq40(botAI))
        return 1.0f;

    if (!action || action->getName() != "dps aoe")
        return 1.0f;

    if (!GetLordKri(botAI) && !GetPrincessYauj(botAI) && !GetVem(botAI))
        return 1.0f;

    return GetNearestYaujBrood(botAI) ? 1.0f : 0.0f;
}

float Aq40ViscidusPriorityMultiplier::GetValue(Action* action)
{
    if (!IsInAq40(botAI) || !action)
        return 1.0f;

    if (GetNearestViscidusGlob(botAI) && action->getName() == "dps assist")
        return 0.0f;

    if (GetViscidus(botAI) && !GetNearestViscidusGlob(botAI) && action->getName() == "dps aoe")
        return 0.0f;

    return 1.0f;
}

float Aq40TwinEmperorsTargetMultiplier::GetValue(Action* action)
{
    if (!IsInAq40(botAI) || !action)
        return 1.0f;

    Unit* assignedEmperor = GetAssignedTwinEmperor(botAI, botAI->GetBot());
    Unit* currentTarget = botAI->GetBot()->GetVictim();
    if (!assignedEmperor)
        return 1.0f;

    if (action->getName() == "dps assist" && currentTarget &&
        (currentTarget->GetEntry() == NPC_VEKNILASH || currentTarget->GetEntry() == NPC_VEKLOR) &&
        currentTarget->GetEntry() != assignedEmperor->GetEntry())
        return 0.0f;

    if (action->getName() == "dps assist" && botAI->IsMelee(botAI->GetBot()) && !botAI->IsTank(botAI->GetBot()))
    {
        Unit* veklor = GetVeklor(botAI);
        if (veklor && botAI->GetBot()->GetExactDist2d(veklor) < TWINS_VEKLOR_MELEE_DISTANCE)
            return 0.0f;
    }

    return 1.0f;
}

float Aq40CthunPriorityMultiplier::GetValue(Action* action)
{
    if (!IsInAq40(botAI) || !action)
        return 1.0f;

    if (action->getName() == "dps assist")
    {
        if (GetNearestCthunSurfaceTentacle(botAI) || GetNearestFleshTentacle(botAI))
        {
            Unit* currentTarget = botAI->GetBot()->GetVictim();
            if (currentTarget && currentTarget->GetEntry() == NPC_CTHUN)
                return 0.0f;
        }

        if (GetNearestAliveByEntry(botAI, NPC_ANUBISATH_SENTINEL))
            return 0.0f;
    }

    if (action->getName() == "dps aoe" && IsCthunVulnerable(botAI))
        return 0.0f;

    return 1.0f;
}
