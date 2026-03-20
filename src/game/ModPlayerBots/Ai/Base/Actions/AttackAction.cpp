/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "AttackAction.h"

#include <unordered_map>

#include "CreatureAI.h"
#include "Event.h"
#include "LastMovementValue.h"
#include "LootObjectStack.h"
#include "PlayerbotAI.h"
#include "Playerbots.h"
#include "ServerFacade.h"
#include "SharedDefines.h"
#include "Unit.h"

bool AttackAction::Execute(Event /*event*/)
{
    Unit* target = GetTarget();
    if (!target)
        return false;

    if (!target->IsInWorld())
        return false;

    return Attack(target);
}

bool AttackMyTargetAction::Execute(Event /*event*/)
{
    Player* master = GetMaster();
    LOG_DEBUG("playerbots", "DIAG AttackMyTargetAction::Execute: bot=%s master=%s",
        bot->GetName(), master ? master->GetName() : "null");

    if (!master)
        return false;

    ObjectGuid guid = master->GetSelectionGuid();
    LOG_DEBUG("playerbots", "DIAG AttackMyTargetAction::Execute: bot=%s masterSelection=%s",
        bot->GetName(), guid ? std::to_string(guid.GetCounter()).c_str() : "none");

    if (!guid)
    {
        if (verbose)
            botAI->TellError("You have no target");

        return false;
    }

    botAI->GetAiObjectContext()->GetValue<GuidVector>("prioritized targets")->Set({guid});
    bool result = Attack(botAI->GetUnit(guid));
    LOG_DEBUG("playerbots", "DIAG AttackMyTargetAction::Execute: bot=%s Attack result=%u", bot->GetName(), (uint32)result);
    if (result)
        context->GetValue<ObjectGuid>("pull target")->Set(guid);

    return result;
}

bool AttackAction::Attack(Unit* target, bool /*with_pet*/ /*true*/)
{
    Unit* oldTarget = context->GetValue<Unit*>("current target")->Get();
    bool shouldMelee = bot->CanReachWithMeleeAutoAttack(target) || botAI->IsMelee(bot);

    bool sameTarget = oldTarget == target && bot->GetVictim() == target;
    bool inCombat = botAI->GetState() == BOT_STATE_COMBAT;
    bool sameAttackMode = bot->HasUnitState(UNIT_STATE_MELEE_ATTACKING) == shouldMelee;

    LOG_DEBUG("playerbots", "DIAG AttackAction::Attack: bot=%s target=%s shouldMelee=%u sameTarget=%u inCombat=%u sameAttackMode=%u victim=%s",
        bot->GetName(), target ? target->GetName() : "null",
        (uint32)shouldMelee, (uint32)sameTarget, (uint32)inCombat, (uint32)sameAttackMode,
        bot->GetVictim() ? bot->GetVictim()->GetName() : "null");

    if (bot->IsTaxiFlying())
    {
        if (verbose)
            botAI->TellError("I cannot attack in flight");

        return false;
    }

    if (!target)
    {
        if (verbose)
            botAI->TellError("I have no target");

        return false;
    }

    if (!target->IsInWorld())
    {
        if (verbose)
            botAI->TellError(std::string(target->GetName()) + " is no longer in the world.");

        return false;
    }

    // Check if bot OR target is in prohibited zone/area (skip for duels)
    if ((target->IsPlayer() || target->IsPet()) &&
        (!bot->m_duel || bot->m_duel->opponent != target) &&
        (sPlayerbotAIConfig.IsPvpProhibited(bot->GetZoneId(), bot->GetAreaId()) ||
        sPlayerbotAIConfig.IsPvpProhibited(target->GetZoneId(), target->GetAreaId())))
    {
        if (verbose)
            botAI->TellError("I cannot attack other players in PvP prohibited areas.");

        return false;
    }

    if (bot->IsFriendlyTo(target))
    {
        if (verbose)
            botAI->TellError(std::string(target->GetName()) + " is friendly to me.");

        return false;
    }

    if (target->IsDead())
    {
        if (verbose)
            botAI->TellError(std::string(target->GetName()) + " is dead.");

        return false;
    }

    if (sameTarget && inCombat)
    {
        // Already committed to this target in the correct attack mode - nothing to do.
        if (sameAttackMode && bot->GetVictim())
        {
            LOG_DEBUG("playerbots", "DIAG AttackAction::Attack: bot=%s SKIP already attacking same target correctly",
                bot->GetName());
            if (verbose)
                botAI->TellError("I am already attacking " + std::string(target->GetName()) + ".");

            return false;
        }

        // Fall through to re-attempt attack (attack mode needs switching).
    }

    if (!bot->IsValidAttackTarget(target))
    {
        LOG_INFO("playerbots", "DIAG AttackAction::Attack: bot=%s FAIL invalid attack target %s",
            bot->GetName(), target->GetName());
        if (verbose)
            botAI->TellError("I cannot attack an invalid target.");

        return false;
    }

    // if (bot->IsMounted() && bot->IsWithinLOSInMap(target))
    // {
    //     WorldPacket emptyPacket;
    //     bot->GetSession()->HandleCancelMountAuraOpcode(emptyPacket);
    // }

    ObjectGuid guid = target->GetGUID();
    bot->SetSelectionGuid(target->GetGUID());

        context->GetValue<Unit*>("old target")->Set(oldTarget);

    context->GetValue<Unit*>("current target")->Set(target);
    context->GetValue<LootObjectStack*>("available loot")->Get()->Add(guid);

    LastMovement& lastMovement = AI_VALUE(LastMovement&, "last movement");
    MovementGeneratorType currentMotionType = bot->GetMotionMaster()->GetCurrentMovementGeneratorType();
    bool moveControlled = (currentMotionType != IDLE_MOTION_TYPE &&
                          currentMotionType != WAYPOINT_MOTION_TYPE &&
                          currentMotionType != RANDOM_MOTION_TYPE);
    if (lastMovement.priority < MovementPriority::MOVEMENT_COMBAT && bot->IsMoving() && !moveControlled)
    {
        AI_VALUE(LastMovement&, "last movement").clear();
        bot->GetMotionMaster()->Clear(false);
        bot->StopMoving();
    }

    if (botAI->CanMove() && !bot->HasInArc(target, CAST_ANGLE_IN_FRONT))
        ServerFacade::instance().SetFacingTo(bot, target);

    bot->SetInCombatWithVictim(target, false, 0, true);
    target->SetInCombatWithAggressor(bot, false);

    // Seed the mob's threat table so it doesn't evade before the first melee swing.
    // SetInCombatWithAggressor sets combat state but doesn't add threat.
    if (target->CanHaveThreatList())
        target->AddThreat(bot, 1.0f);

    LOG_INFO("playerbots", "DIAG AttackAction::Attack: bot=%s SUCCESS - committed combat state, switching to BOT_STATE_COMBAT, attacking %s",
        bot->GetName(), target->GetName());
    botAI->ChangeEngine(BOT_STATE_COMBAT);

    bot->Attack(target, shouldMelee);
    /* prevent pet dead immediately in group */
    // if (bot->GetMap()->IsDungeon() && bot->GetGroup() && !target->IsInCombat())
    // {
    //     with_pet = false;
    // }
    // if (Pet* pet = bot->GetPet())
    // {
    //     if (with_pet)
    //     {
    //         pet->SetReactState(REACT_DEFENSIVE);
    //         pet->SetTarget(target->GetGUID());
    //         pet->GetCharmInfo()->SetIsCommandAttack(true);
    //         pet->AI()->AttackStart(target);
    //     }
    //     else
    //     {
    //         pet->SetReactState(REACT_PASSIVE);
    //         pet->GetCharmInfo()->SetIsCommandFollow(true);
    //         pet->GetCharmInfo()->IsReturning();
    //     }
    // }
    return true;
}

bool AttackDuelOpponentAction::isUseful() { return AI_VALUE(Unit*, "duel target"); }

bool AttackDuelOpponentAction::Execute(Event /*event*/) { return Attack(AI_VALUE(Unit*, "duel target")); }
