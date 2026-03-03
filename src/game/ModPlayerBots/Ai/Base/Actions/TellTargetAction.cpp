/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "TellTargetAction.h"

#include "Event.h"
#include "Playerbots.h"
#include "Threat/ThreatManager.h"

bool TellTargetAction::Execute(Event event)
{
    Unit* target = context->GetValue<Unit*>("current target")->Get();
    if (target)
    {
        std::ostringstream out;
        out << "Attacking " << target->GetName();
        botAI->TellMaster(out);

        context->GetValue<Unit*>("old target")->Set(target);
    }

    return true;
}

bool TellAttackersAction::Execute(Event event)
{
    botAI->TellMaster("--- Attackers ---");

    GuidVector attackers = context->GetValue<GuidVector>("attackers")->Get();
    int32 count = 0;
    for (ObjectGuid const guid : attackers)
    {
        Unit* unit = botAI->GetUnit(guid);
        if (!unit || !unit->IsAlive())
            continue;

        botAI->TellMaster(std::to_string(++count) + std::string(".") + unit->GetName());
    }

    botAI->TellMaster("--- Threat ---");

    HostileReference* ref = bot->GetHostileRefManager().getFirst();
    if (!ref)
        return true;

    while (ref)
    {
        ThreatManager* threatMgr = ref->GetSource();
        Unit* unit = threatMgr->getOwner();
        float threat = ref->getThreat();

        std::ostringstream out;
        out << unit->GetName() << " (" << threat << ")";
        botAI->TellMaster(out);

        ref = ref->next();
    }

    return true;
}
