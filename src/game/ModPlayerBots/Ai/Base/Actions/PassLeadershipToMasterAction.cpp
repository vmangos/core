/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PassLeadershipToMasterAction.h"

#include "Event.h"
#include "PartyLeadershipUtils.h"
#include "Playerbots.h"

bool PassLeadershipToMasterAction::Execute(Event event)
{
    Group* group = bot->GetGroup();
    if (!group)
        return false;

    Player* master = botAI->GetActiveMaster();
    if (!PartyLeadership::IsActiveRealPlayer(master) || master == bot || !group->IsMember(master->GetGUID()))
    {
        master = botAI->FindNewMaster();
        if (master && master != bot)
            botAI->SetMaster(master);
    }

    if (master && master != bot && group->IsMember(master->GetGUID()))
    {
        group->ChangeLeader(master->GetGUID());

        if (!message.empty())
            botAI->TellMasterNoFacing(message);

        if (sRandomPlayerbotMgr.IsRandomBot(bot))
        {
            botAI->ResetStrategies();
            botAI->Reset();
        }

        return true;
    }

    return false;
}

bool PassLeadershipToMasterAction::isUseful()
{
    return botAI->IsAlt() && bot->GetGroup() && bot->GetGroup()->IsLeader(bot->GetGUID());
}

bool GiveLeaderAction::isUseful()
{
    if (!bot->GetGroup() || !bot->GetGroup()->IsLeader(bot->GetGUID()))
        return false;

    if (!sRandomPlayerbotMgr.IsRandomBot(bot))
        return botAI->HasActivePlayerMaster();

    if (!PartyLeadership::IsEligibleRandombotPartyLeader(botAI))
        return false;

    Player* activeMaster = botAI->GetActiveMaster();
    if (PartyLeadership::IsActiveRealPlayer(activeMaster) && activeMaster != bot &&
        bot->GetGroup()->IsMember(activeMaster->GetGUID()))
    {
        return true;
    }

    Player* fallbackMaster = botAI->FindNewMaster();
    return PartyLeadership::IsActiveRealPlayer(fallbackMaster) && fallbackMaster != bot &&
           bot->GetGroup()->IsMember(fallbackMaster->GetGUID());
}
