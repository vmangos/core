#include "RaidAq40Actions.h"

#include "RaidAq40Helpers.h"
#include "../../RaidBossHelpers.h"

#include <algorithm>

char* strstri(char const* str1, char const* str2);

using namespace Aq40Helpers;

bool Aq40SkeramMoveFromArcaneExplosionAction::Execute(Event event)
{
    Unit* boss = GetSkeram(botAI);
    if (!boss)
        return false;

    float const distance = bot->GetExactDist2d(boss);
    float const distanceToTravel = SKERAM_ARCANE_EXPLOSION_DISTANCE - distance;
    if (distanceToTravel <= 0.0f)
        return false;

    bot->AttackStop();
    bot->InterruptNonMeleeSpells(false);
    return MoveAway(boss, distanceToTravel + 2.0f);
}

bool Aq40SkeramAttackSplitTargetAction::Execute(Event event)
{
    Unit* target = GetNearestAliveByEntry(botAI, NPC_THE_PROPHET_SKERAM);
    if (!target)
        return false;

    MarkTargetWithSkull(bot, target);
    return Attack(target);
}

bool Aq40SkeramCcMindControlAction::Execute(Event event)
{
    Player* target = GetNearestCharmedRaidPlayer(botAI);
    if (!target || botAI->IsHeal(bot))
        return false;

    static std::string const ccActions[] = {"polymorph", "sap", "blind", "hibernate", "scatter shot", "repentance", "hammer of justice"};

    if (bot->GetVictim() != target)
        Attack(target);

    for (std::string const& ccAction : ccActions)
    {
        if (botAI->DoSpecificAction(ccAction, event, true))
            return true;
    }

    return bot->GetVictim() == target;
}

bool Aq40SkeramMoveToAssignedPlatformAction::Execute(Event event)
{
    Unit* nearestSkeram = GetNearestAliveByEntry(botAI, NPC_THE_PROPHET_SKERAM);
    if (!nearestSkeram)
        return false;

    if (bot->GetExactDist2d(nearestSkeram) <= 12.0f)
        return false;

    return MoveNear(nearestSkeram, 8.0f);
}

bool Aq40SkeramInterruptArcaneExplosionAction::Execute(Event event)
{
    Unit* boss = GetSkeram(botAI);
    if (!boss)
        return false;

    if (bot->GetVictim() != boss)
        Attack(boss);

    static std::string const interruptActions[] = {"pummel", "shield bash", "kick", "counterspell", "earth shock", "silence"};
    for (std::string const& interruptAction : interruptActions)
    {
        if (botAI->DoSpecificAction(interruptAction, event, true))
            return true;
    }

    return false;
}

bool Aq40SkeramMoveFromMeleeClumpAction::Execute(Event event)
{
    return MoveFromGroup(SKERAM_MELEE_STACK_RADIUS);
}

bool Aq40BugTrioAttackKriAction::Execute(Event event)
{
    Unit* target = GetPriorityBugTrioTarget(botAI);
    if (!target)
        return false;

    if (target->GetEntry() == NPC_LORD_KRI)
        MarkTargetWithSkull(bot, target);
    else if (target->GetEntry() == NPC_PRINCESS_YAUJ)
        MarkTargetWithCross(bot, target);
    else if (target->GetEntry() == NPC_VEM)
        MarkTargetWithStar(bot, target);

    return Attack(target);
}

bool Aq40BugTrioInterruptYaujAction::Execute(Event event)
{
    Unit* yauj = GetPrincessYauj(botAI);
    if (!yauj)
        return false;

    if (bot->GetVictim() != yauj)
        Attack(yauj);

    static std::string const interruptActions[] = {"pummel", "shield bash", "kick", "counterspell", "earth shock",
                                                   "silence"};
    for (std::string const& interruptAction : interruptActions)
    {
        if (botAI->DoSpecificAction(interruptAction, event, true))
            return true;
    }

    return bot->GetVictim() == yauj;
}

bool Aq40BugTrioMoveFromKriCloudAction::Execute(Event event)
{
    Unit* kri = GetLordKri(botAI);
    if (!kri)
        return false;

    float const distance = bot->GetExactDist2d(kri);
    if (distance >= 10.0f)
        return false;

    return MoveAway(kri, 12.0f - distance);
}

bool Aq40BugTrioAoeSpawnBugsAction::Execute(Event event)
{
    if (Unit* brood = GetNearestYaujBrood(botAI))
        return Attack(brood);

    return false;
}

bool Aq40BugTrioSpreadFromFearAction::Execute(Event event)
{
    Unit* yauj = GetPrincessYauj(botAI);
    if (!yauj)
        return false;

    return MoveAway(yauj, 6.0f);
}

bool Aq40SarturaKiteToPerimeterAction::Execute(Event event)
{
    Unit* sartura = GetSartura(botAI);
    if (!sartura)
        return false;

    bot->AttackStop();
    bot->InterruptNonMeleeSpells(false);
    return MoveAway(sartura, 16.0f);
}

bool Aq40SarturaAttackGuardAction::Execute(Event event)
{
    Unit* guard = GetNearestSarturaRoyalGuard(botAI);
    if (!guard)
        return false;

    MarkTargetWithCross(bot, guard);
    return Attack(guard);
}

bool Aq40SarturaMoveFromTunnelAction::Execute(Event event)
{
    Unit* sartura = GetSartura(botAI);
    if (!sartura)
        return false;

    return MoveNear(sartura, 18.0f);
}

bool Aq40FankrissAttackWormAction::Execute(Event event)
{
    Unit* worm = GetNearestSpawnOfFankriss(botAI);
    if (!worm)
        return false;

    MarkTargetWithSkull(bot, worm);
    return Attack(worm);
}

bool Aq40FankrissGatherHatchlingsAction::Execute(Event event)
{
    Unit* worm = GetNearestSpawnOfFankriss(botAI);
    if (!worm)
        return false;

    if (botAI->IsTank(bot))
        return Attack(worm);

    return MoveNear(worm, 10.0f);
}

bool Aq40FankrissHelpTeleportedPlayerAction::Execute(Event event)
{
    Unit* fankriss = GetFankriss(botAI);
    Player* target = GetNearestRaidMemberFarFromBoss(botAI, fankriss, FANKRISS_TELEPORT_DISTANCE);
    if (!fankriss || !target)
        return false;

    return MoveNear(target, 6.0f);
}

bool Aq40FankrissSwapTanksAction::Execute(Event event)
{
    Unit* fankriss = GetFankriss(botAI);
    if (!fankriss)
        return false;

    if (botAI->IsAssistTankOfIndex(bot, 0))
        return Attack(fankriss);

    if (botAI->IsMainTank(bot))
    {
        bot->AttackStop();
        return MoveAway(fankriss, 8.0f);
    }

    return false;
}

bool Aq40ViscidusCleansePoisonAction::Execute(Event event)
{
    static std::string const poisonCleanseActions[] = {"cleanse", "cure poison", "abolish poison", "purify"};
    for (std::string const& actionName : poisonCleanseActions)
    {
        if (botAI->DoSpecificAction(actionName, event, true))
            return true;
    }

    return false;
}

bool Aq40ViscidusUseFrostAttacksAction::Execute(Event event)
{
    Unit* viscidus = GetViscidus(botAI);
    if (!viscidus)
        return false;

    static std::string const frostSpells[] = {"frostbolt", "frost shock", "icy touch", "cone of cold", "ice lance"};
    for (std::string const& spellName : frostSpells)
    {
        if (botAI->CanCastSpell(spellName, viscidus) && botAI->CastSpell(spellName, viscidus))
            return true;
    }

    return Attack(viscidus);
}

bool Aq40ViscidusMeleeShatterAction::Execute(Event event)
{
    Unit* viscidus = GetViscidus(botAI);
    if (!viscidus)
        return false;

    return Attack(viscidus);
}

bool Aq40ViscidusAttackNearestGlobAction::Execute(Event event)
{
    Unit* glob = GetNearestViscidusGlob(botAI);
    if (!glob)
        return false;

    MarkTargetWithSkull(bot, glob);
    return Attack(glob);
}

bool Aq40HuhuranTranqShotAction::Execute(Event event)
{
    Unit* huhuran = GetHuhuran(botAI);
    if (!huhuran || bot->getClass() != CLASS_HUNTER)
        return false;

    return botAI->CanCastSpell("Tranquilizing Shot", huhuran) && botAI->CastSpell("Tranquilizing Shot", huhuran);
}

bool Aq40HuhuranMoveToSoakerRingAction::Execute(Event event)
{
    Unit* huhuran = GetHuhuran(botAI);
    if (!huhuran)
        return false;

    return MoveNear(huhuran, 10.0f);
}

bool Aq40HuhuranSpreadOuterRingAction::Execute(Event event)
{
    Unit* huhuran = GetHuhuran(botAI);
    if (!huhuran)
        return false;

    if (bot->GetExactDist2d(huhuran) < 18.0f)
        return MoveAway(huhuran, 10.0f);

    return MoveFromGroup(8.0f);
}

bool Aq40HuhuranSelectiveWyvernDispelAction::Execute(Event event)
{
    Unit* mainTank = AI_VALUE(Unit*, "main tank");
    if (!mainTank)
        return false;

    static std::string const dispels[] = {"cleanse", "abolish poison", "cure poison", "purify"};
    for (std::string const& dispel : dispels)
    {
        if (botAI->CanCastSpell(dispel, mainTank) && botAI->CastSpell(dispel, mainTank))
            return true;
    }

    return false;
}

bool Aq40TwinsMoveFromVeklorMeleeAction::Execute(Event event)
{
    Unit* veklor = GetVeklor(botAI);
    if (!veklor)
        return false;

    Unit* assignedEmperor = GetAssignedTwinEmperor(botAI, bot);
    if (assignedEmperor && assignedEmperor != veklor)
        return MoveNear(assignedEmperor, 8.0f);

    return MoveAway(veklor, 8.0f);
}

bool Aq40TwinsPickUpEmperorAfterTeleportAction::Execute(Event event)
{
    Unit* assignedEmperor = GetAssignedTwinEmperor(botAI, bot);
    if (!assignedEmperor)
        return false;

    float desiredDistance = botAI->IsTank(bot) || botAI->IsMelee(bot) ? 6.0f : 18.0f;
    if (bot->GetExactDist2d(assignedEmperor) > desiredDistance + 2.0f)
        return MoveNear(assignedEmperor, desiredDistance);

    return Attack(assignedEmperor);
}

bool Aq40TwinsControlMutateBugAction::Execute(Event event)
{
    Unit* bug = GetNearestMutatedTwinBug(botAI);
    if (!bug)
        return false;

    MarkTargetWithSkull(bot, bug);
    return Attack(bug);
}

bool Aq40TwinsKillExplodeBugAction::Execute(Event event)
{
    Unit* bug = GetNearestExplodingTwinBug(botAI);
    if (!bug)
        return false;

    MarkTargetWithCross(bot, bug);
    return Attack(bug);
}

bool Aq40TwinsAttackAssignedEmperorAction::Execute(Event event)
{
    Unit* assignedEmperor = GetAssignedTwinEmperor(botAI, bot);
    if (!assignedEmperor)
        return false;

    if (assignedEmperor->GetEntry() == NPC_VEKNILASH)
        MarkTargetWithSkull(bot, assignedEmperor);
    else
        MarkTargetWithCross(bot, assignedEmperor);

    if (botAI->IsMelee(bot) && assignedEmperor->GetEntry() == NPC_VEKLOR)
        return MoveAway(assignedEmperor, 10.0f);

    return Attack(assignedEmperor);
}

bool Aq40OuroMoveFromFrontalAction::Execute(Event event)
{
    Unit* ouro = GetOuro(botAI);
    if (!ouro)
        return false;

    float const distance = bot->GetExactDist2d(ouro);
    return MoveAway(ouro, std::max(4.0f, OURO_FRONTAL_DANGER_DISTANCE - distance + 4.0f));
}

bool Aq40OuroRegroupCenterAction::Execute(Event event)
{
    if (Unit* trigger = GetOuroTrigger(botAI))
        return MoveNear(trigger, botAI->IsTank(bot) ? 4.0f : 8.0f);

    if (Unit* ouro = GetOuro(botAI))
        return MoveNear(ouro, 8.0f);

    return false;
}

bool Aq40OuroSpreadForResurfacingAction::Execute(Event event)
{
    if (Unit* trigger = GetOuroTrigger(botAI))
    {
        float const distance = bot->GetExactDist2d(trigger);
        if (distance < OURO_RESURFACE_SPREAD_DISTANCE)
            return MoveAway(trigger, OURO_RESURFACE_SPREAD_DISTANCE - distance + 4.0f);
    }

    return MoveFromGroup(10.0f);
}

bool Aq40OuroKillScarabsAction::Execute(Event event)
{
    Unit* scarab = GetNearestOuroScarab(botAI);
    if (!scarab)
        return false;

    MarkTargetWithSkull(bot, scarab);
    return Attack(scarab);
}

bool Aq40OuroBurnAction::Execute(Event event)
{
    Unit* ouro = GetOuro(botAI);
    return ouro && Attack(ouro);
}

bool Aq40CthunSpreadRingAction::Execute(Event event)
{
    Unit* cthun = GetEyeOfCthun(botAI);
    if (!cthun)
        cthun = GetCthunBody(botAI);

    if (cthun && bot->GetExactDist2d(cthun) < 18.0f)
        return MoveAway(cthun, 6.0f);

    return MoveFromGroup(CTHUN_SPREAD_DISTANCE);
}

bool Aq40CthunRotateDarkGlareAction::Execute(Event event)
{
    Unit* eye = GetEyeOfCthun(botAI);
    if (!eye)
        return false;

    bot->AttackStop();
    bot->InterruptNonMeleeSpells(false);
    if (bot->GetExactDist2d(eye) < 24.0f)
        return MoveAway(eye, 8.0f);

    return MoveFromGroup(10.0f);
}

bool Aq40CthunAttackEyeTentacleAction::Execute(Event event)
{
    Unit* tentacle = GetNearestEyeTentacle(botAI);
    if (!tentacle)
        tentacle = GetNearestClawTentacle(botAI);
    if (!tentacle)
        return false;

    MarkTargetWithSkull(bot, tentacle);
    return Attack(tentacle);
}

bool Aq40CthunAttackGiantEyeAction::Execute(Event event)
{
    Unit* tentacle = GetNearestGiantEyeTentacle(botAI);
    if (!tentacle)
        return false;

    MarkTargetWithSkull(bot, tentacle);
    return Attack(tentacle);
}

bool Aq40CthunAttackGiantClawAction::Execute(Event event)
{
    Unit* tentacle = GetNearestGiantClawTentacle(botAI);
    if (!tentacle)
        return false;

    MarkTargetWithCross(bot, tentacle);
    return Attack(tentacle);
}

bool Aq40CthunStomachAttackFleshAction::Execute(Event event)
{
    Unit* flesh = GetNearestFleshTentacle(botAI);
    if (!flesh)
        return false;

    MarkTargetWithSkull(bot, flesh);
    return Attack(flesh);
}

bool Aq40CthunBurnBodyAction::Execute(Event event)
{
    Unit* cthun = GetCthunBody(botAI);
    return cthun && Attack(cthun);
}

bool Aq40TrashMarkKillOrderAction::Execute(Event event)
{
    Unit* target = GetNearestCthunTrashPriorityTarget(botAI);
    if (!target)
        return false;

    MarkTargetWithSkull(bot, target);
    return Attack(target);
}

bool Aq40TrashBackpullAction::Execute(Event event)
{
    Unit* mainTank = AI_VALUE(Unit*, "main tank");
    if (mainTank && mainTank != bot && !botAI->IsTank(bot))
        return MoveNear(mainTank, 10.0f);

    if (Unit* target = GetNearestCthunTrashPriorityTarget(botAI))
        return MoveAway(target, 8.0f);

    return false;
}

bool Aq40TrashSpreadAction::Execute(Event event)
{
    if (Unit* target = GetNearestCthunTrashPriorityTarget(botAI))
    {
        if (bot->GetExactDist2d(target) < 10.0f && !botAI->IsTank(bot))
            return MoveAway(target, 6.0f);
    }

    return MoveFromGroup(8.0f);
}

bool Aq40TrashStackForMeteorAction::Execute(Event event)
{
    Unit* mainTank = AI_VALUE(Unit*, "main tank");
    return mainTank ? MoveNear(mainTank, 8.0f) : false;
}

bool Aq40TrashFocusMindslayerAction::Execute(Event event)
{
    Unit* target = GetNearestCthunTrashPriorityTarget(botAI);
    if (!target)
        return false;

    if (target->GetEntry() == NPC_QIRAJI_MINDSLAYER)
        MarkTargetWithSkull(bot, target);
    else if (target->GetEntry() == NPC_QIRAJI_CHAMPION)
        MarkTargetWithCross(bot, target);

    return Attack(target);
}
