#include "RaidAq40Triggers.h"

#include "RaidAq40Helpers.h"

using namespace Aq40Helpers;

bool Aq40SkeramSplitTrigger::IsActive()
{
    if (!IsInAq40(botAI))
        return false;

    uint32 count = 0;
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (unit && unit->IsAlive() && unit->GetEntry() == NPC_THE_PROPHET_SKERAM)
            ++count;
    }

    return count > 1;
}

bool Aq40SkeramMindControlTrigger::IsActive()
{
    return IsInAq40(botAI) && GetNearestCharmedRaidPlayer(botAI);
}

bool Aq40SkeramBlinkTrigger::IsActive()
{
    if (!IsInAq40(botAI))
        return false;

    Unit* nearestSkeram = GetNearestAliveByEntry(botAI, NPC_THE_PROPHET_SKERAM);
    return nearestSkeram && bot->GetExactDist2d(nearestSkeram) > 20.0f;
}

bool Aq40SkeramArcaneExplosionTrigger::IsActive()
{
    Unit* boss = GetSkeram(botAI);
    return boss && IsSkeramCastingArcaneExplosion(botAI) &&
           bot->GetExactDist2d(boss) < SKERAM_ARCANE_EXPLOSION_DISTANCE;
}

bool Aq40SkeramTooManyMeleeTrigger::IsActive()
{
    if (!IsInAq40(botAI) || botAI->IsTank(bot) || botAI->IsHeal(bot) || !botAI->IsMelee(bot))
        return false;

    Unit* boss = GetSkeram(botAI);
    if (!boss || bot->GetExactDist2d(boss) > 10.0f)
        return false;

    return CountNearbyRaidMembers(botAI, boss, SKERAM_MELEE_STACK_RADIUS) >= 4;
}

bool Aq40BugTrioKillOrderTrigger::IsActive()
{
    if (!IsInAq40(botAI) || botAI->IsHeal(bot))
        return false;

    Unit* target = GetPriorityBugTrioTarget(botAI);
    return target && bot->GetVictim() != target;
}

bool Aq40BugTrioYaujHealTrigger::IsActive()
{
    return IsInAq40(botAI) && IsPrincessYaujCastingHeal(botAI);
}

bool Aq40BugTrioYaujFearTrigger::IsActive()
{
    Unit* yauj = GetPrincessYauj(botAI);
    return yauj && IsPrincessYaujCastingFear(botAI) && bot->GetExactDist2d(yauj) < 18.0f;
}

bool Aq40BugTrioKriCloudTrigger::IsActive()
{
    if (!IsInAq40(botAI))
        return false;

    Unit* kri = GetNearestUnitByEntry(botAI, NPC_LORD_KRI);
    if (!kri)
        return false;

    return bot->GetExactDist2d(kri) < 10.0f && (!kri->IsAlive() || kri->GetHealthPct() < 8.0f);
}

bool Aq40BugTrioYaujSpawnBugsTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestYaujBrood(botAI);
}

bool Aq40SarturaWhirlwindTrigger::IsActive()
{
    Unit* sartura = GetSartura(botAI);
    return sartura && !botAI->IsTank(bot) && bot->GetExactDist2d(sartura) < SARTURA_WHIRLWIND_DISTANCE &&
           IsSarturaWhirlwinding(botAI);
}

bool Aq40SarturaBeingChasedTrigger::IsActive()
{
    Unit* sartura = GetSartura(botAI);
    return sartura && !botAI->IsTank(bot) && sartura->GetVictim() == bot;
}

bool Aq40SarturaGuardAliveTrigger::IsActive()
{
    if (!IsInAq40(botAI) || botAI->IsHeal(bot))
        return false;

    Unit* guard = GetNearestSarturaRoyalGuard(botAI);
    return guard && bot->GetVictim() != guard;
}

bool Aq40SarturaNearTunnelTrigger::IsActive()
{
    Unit* sartura = GetSartura(botAI);
    return sartura && !botAI->IsTank(bot) && bot->GetExactDist2d(sartura) > SARTURA_TUNNEL_DISTANCE;
}

bool Aq40FankrissWormSpawnTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestSpawnOfFankriss(botAI);
}

bool Aq40FankrissHatchlingOverloadTrigger::IsActive()
{
    if (!IsInAq40(botAI) || !GetFankriss(botAI))
        return false;

    uint32 wormCount = 0;
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (unit && unit->IsAlive() && unit->GetEntry() == NPC_SPAWN_OF_FANKRISS)
            ++wormCount;
    }

    return wormCount >= 2;
}

bool Aq40FankrissMortalWoundSwapTrigger::IsActive()
{
    if (!IsInAq40(botAI) || !GetFankriss(botAI) || (!botAI->IsMainTank(bot) && !botAI->IsAssistTankOfIndex(bot, 0)))
        return false;

    Unit* mt = AI_VALUE(Unit*, "main tank");
    if (!mt)
        return false;

    SpellAuraHolder* aura = botAI->GetAura("mortal wound", mt, false, true);
    return aura && aura->GetStackAmount() >= 5;
}

bool Aq40FankrissTeleportedPlayerTrigger::IsActive()
{
    Unit* fankriss = GetFankriss(botAI);
    return fankriss && !botAI->IsTank(bot) && GetNearestRaidMemberFarFromBoss(botAI, fankriss, FANKRISS_TELEPORT_DISTANCE);
}

bool Aq40ViscidusPoisonVolleyTrigger::IsActive()
{
    return IsInAq40(botAI) && IsViscidusCastingPoisonVolley(botAI);
}

bool Aq40ViscidusToxinCloudTrigger::IsActive()
{
    Unit* viscidus = GetViscidus(botAI);
    return viscidus && !botAI->IsRanged(bot) && bot->GetExactDist2d(viscidus) < 10.0f;
}

bool Aq40ViscidusFreezePhaseTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetViscidus(botAI) && !GetNearestViscidusGlob(botAI);
}

bool Aq40ViscidusShatterPhaseTrigger::IsActive()
{
    return IsInAq40(botAI) && botAI->IsMelee(bot) && IsViscidusShatterPhase(botAI);
}

bool Aq40ViscidusGlobPhaseTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestViscidusGlob(botAI);
}

bool Aq40HuhuranFrenzyTrigger::IsActive()
{
    return IsInAq40(botAI) && bot->getClass() == CLASS_HUNTER && IsHuhuranFrenzied(botAI);
}

bool Aq40HuhuranBerserkSoonTrigger::IsActive()
{
    Unit* huhuran = GetHuhuran(botAI);
    return huhuran && IsAssignedSoaker(botAI, bot) && huhuran->GetHealthPct() <= 35.0f && bot->GetExactDist2d(huhuran) > 14.0f;
}

bool Aq40HuhuranBerserkTrigger::IsActive()
{
    Unit* huhuran = GetHuhuran(botAI);
    return huhuran && !IsAssignedSoaker(botAI, bot) && IsHuhuranBerserk(botAI);
}

bool Aq40HuhuranWyvernStingOnTankTrigger::IsActive()
{
    Unit* mainTank = AI_VALUE(Unit*, "main tank");
    return mainTank && botAI->GetAura("wyvern sting", mainTank, false, true);
}

bool Aq40HuhuranInnerRingMissingTrigger::IsActive()
{
    Unit* huhuran = GetHuhuran(botAI);
    if (!huhuran || !IsAssignedSoaker(botAI, bot))
        return false;

    return CountNearbyRaidMembers(botAI, huhuran, 12.0f) < 4 && bot->GetExactDist2d(huhuran) > 12.0f;
}

bool Aq40TwinsVeklorMeleeDangerTrigger::IsActive()
{
    Unit* veklor = GetVeklor(botAI);
    return veklor && !botAI->IsTank(bot) && botAI->IsMelee(bot) && bot->GetExactDist2d(veklor) < TWINS_VEKLOR_MELEE_DISTANCE;
}

bool Aq40TwinsTeleportTrigger::IsActive()
{
    Unit* assignedEmperor = GetAssignedTwinEmperor(botAI, bot);
    Unit* currentTarget = bot->GetVictim();
    if (!assignedEmperor || !GetVeklor(botAI) || !GetVeknilash(botAI))
        return false;

    if (currentTarget && (currentTarget->GetEntry() == NPC_VEKLOR || currentTarget->GetEntry() == NPC_VEKNILASH) &&
        currentTarget->GetEntry() != assignedEmperor->GetEntry())
        return true;

    Unit* otherEmperor = assignedEmperor->GetEntry() == NPC_VEKLOR ? GetVeknilash(botAI) : GetVeklor(botAI);
    return otherEmperor && bot->GetExactDist2d(assignedEmperor) > TWINS_ASSIGNED_REPOSITION_DISTANCE &&
           bot->GetExactDist2d(otherEmperor) + 5.0f < bot->GetExactDist2d(assignedEmperor);
}

bool Aq40TwinsBugMutateTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestMutatedTwinBug(botAI);
}

bool Aq40TwinsBugExplodeTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestExplodingTwinBug(botAI);
}

bool Aq40TwinsWrongEmperorTargetTrigger::IsActive()
{
    Unit* assignedEmperor = GetAssignedTwinEmperor(botAI, bot);
    Unit* currentTarget = bot->GetVictim();
    return assignedEmperor && currentTarget && (currentTarget->GetEntry() == NPC_VEKLOR || currentTarget->GetEntry() == NPC_VEKNILASH) &&
           currentTarget->GetEntry() != assignedEmperor->GetEntry();
}

bool Aq40OuroFrontalDangerTrigger::IsActive()
{
    Unit* ouro = GetOuro(botAI);
    return ouro && !botAI->IsTank(bot) && ouro->HasInArc(bot, CAST_ANGLE_IN_FRONT) &&
           bot->GetExactDist2d(ouro) < OURO_FRONTAL_DANGER_DISTANCE;
}

bool Aq40OuroSubmergeTrigger::IsActive()
{
    return IsInAq40(botAI) && IsOuroSubmerged(botAI) && !GetNearestOuroScarab(botAI);
}

bool Aq40OuroResurfacingTrigger::IsActive()
{
    Unit* trigger = GetOuroTrigger(botAI);
    return trigger && !botAI->IsTank(bot) && IsOuroSubmerged(botAI) && bot->GetExactDist2d(trigger) < OURO_RESURFACE_SPREAD_DISTANCE;
}

bool Aq40OuroScarabSpawnTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestOuroScarab(botAI);
}

bool Aq40OuroEnrageTrigger::IsActive()
{
    return IsInAq40(botAI) && !IsOuroSubmerged(botAI) && !GetNearestOuroScarab(botAI) && IsOuroEnraged(botAI);
}

bool Aq40CthunEyeBeamDangerTrigger::IsActive()
{
    Unit* eye = GetEyeOfCthun(botAI);
    return eye && !IsCthunDarkGlareActive(botAI) && CountNearbyRaidMembers(botAI, bot, CTHUN_SPREAD_DISTANCE, bot) >= 1;
}

bool Aq40CthunDarkGlareTrigger::IsActive()
{
    Unit* eye = GetEyeOfCthun(botAI);
    return eye && !botAI->IsTank(bot) && IsCthunDarkGlareActive(botAI) && bot->GetExactDist2d(eye) < CTHUN_DARK_GLARE_DISTANCE;
}

bool Aq40CthunEyeTentacleTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestEyeTentacle(botAI);
}

bool Aq40CthunClawTentacleTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestClawTentacle(botAI) && !GetNearestGiantClawTentacle(botAI);
}

bool Aq40CthunGiantEyeTentacleTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestGiantEyeTentacle(botAI);
}

bool Aq40CthunGiantClawTentacleTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && GetNearestGiantClawTentacle(botAI);
}

bool Aq40CthunSwallowedTrigger::IsActive()
{
    return IsInAq40(botAI) && IsPlayerInCthunStomach(bot);
}

bool Aq40CthunFleshTentacleTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && IsPlayerInCthunStomach(bot) && GetNearestFleshTentacle(botAI);
}

bool Aq40CthunVulnerabilityTrigger::IsActive()
{
    return IsInAq40(botAI) && !botAI->IsHeal(bot) && IsCthunVulnerable(botAI) && !GetNearestCthunSurfaceTentacle(botAI);
}

bool Aq40TrashSentinelPackTrigger::IsActive()
{
    return IsInAq40(botAI) && GetNearestAliveByEntry(botAI, NPC_ANUBISATH_SENTINEL);
}

bool Aq40TrashNullifyDangerTrigger::IsActive()
{
    Unit* nullifier = GetNearestAliveByEntry(botAI, NPC_OBSIDIAN_NULLIFIER);
    return nullifier && bot->GetPowerType() == POWER_MANA && bot->GetExactDist2d(nullifier) < 30.0f;
}

bool Aq40TrashFireNovaDangerTrigger::IsActive()
{
    Unit* warder = GetNearestAliveByEntry(botAI, NPC_ANUBISATH_WARDER);
    return warder && !botAI->IsTank(bot) && bot->GetExactDist2d(warder) < 12.0f;
}

bool Aq40TrashMindslayerMindControlTrigger::IsActive()
{
    return IsInAq40(botAI) && GetNearestAliveByEntry(botAI, NPC_QIRAJI_MINDSLAYER) && GetNearestCharmedRaidPlayer(botAI);
}

bool Aq40TrashSlayerWhirlwindTrigger::IsActive()
{
    Unit* slayer = GetNearestAliveByEntry(botAI, NPC_QIRAJI_SLAYER);
    return slayer && !botAI->IsTank(bot) && bot->GetExactDist2d(slayer) < 10.0f;
}

bool Aq40TrashPlagueTrigger::IsActive()
{
    return IsInAq40(botAI) && GetNearestAliveByEntry(botAI, NPC_QIRAJI_CHAMPION) && CountNearbyRaidMembers(botAI, bot, 8.0f, bot) >= 2;
}
