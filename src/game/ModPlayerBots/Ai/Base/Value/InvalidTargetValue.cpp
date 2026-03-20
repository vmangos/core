/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "InvalidTargetValue.h"

#include "AttackersValue.h"
#include "Playerbots.h"
#include "Unit.h"

bool InvalidTargetValue::Calculate()
{
    Unit* target = AI_VALUE(Unit*, qualifier);
    Unit* enemy = AI_VALUE(Unit*, "enemy player target");
    if (target && enemy && target == enemy && target->IsAlive())
        return false;

    if (target && qualifier == "current target")
    {
        bool diffMap = target->GetMapId() != bot->GetMapId();
        bool notSelectable = target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        bool nonAttackable = target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        bool nonAttackable2 = target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE_2);
        bool notVisible = !target->IsVisibleForOrDetect(bot, bot, true);
        bool dead = !target->IsAlive();
        bool poly = target->IsPolymorphed();
        bool charmed = target->IsCharmed();
        bool feared = target->HasAuraType(SPELL_AURA_MOD_FEAR);
        bool isolated = target->HasUnitState(UNIT_STATE_ISOLATED);
        bool friendly = target->IsFriendlyTo(bot);
        bool notValidTarget = !AttackersValue::IsValidTarget(target, bot);

        bool result = diffMap || notSelectable || nonAttackable || nonAttackable2 || notVisible ||
                      dead || poly || charmed || feared || isolated || friendly || notValidTarget;

        if (result)
        {
            LOG_DEBUG("playerbots", "DIAG InvalidTarget: bot=%s target=%s INVALID reason: "
                "diffMap=%u notSel=%u nonAtk=%u nonAtk2=%u notVis=%u dead=%u poly=%u charmed=%u feared=%u isolated=%u friendly=%u notValidTarget=%u",
                bot->GetName(), target->GetName(),
                (uint32)diffMap, (uint32)notSelectable, (uint32)nonAttackable, (uint32)nonAttackable2,
                (uint32)notVisible, (uint32)dead, (uint32)poly, (uint32)charmed, (uint32)feared,
                (uint32)isolated, (uint32)friendly, (uint32)notValidTarget);
        }

        return result;
    }

    return !target;
}
