/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "AcceptInvitationAction.h"

#include "Event.h"
#include "ObjectAccessor.h"
#include "PlayerbotAIConfig.h"
#include "PlayerbotSecurity.h"
#include "Playerbots.h"
#include "WorldPacket.h"

bool AcceptInvitationAction::Execute(Event event)
{
    Group* grp = bot->GetGroupInvite();
    if (!grp)
    {
        LOG_INFO("playerbots", "Invite accept failed: %s (%u) has no pending GroupInvite",
            bot->GetName(), bot->GetGUIDLow());
        return false;
    }

    WorldPacket packet = event.getPacket();
    std::string name;
    packet >> name;

    Player* inviter = ObjectAccessor::FindPlayer(grp->GetLeaderGuid());
    if (!inviter)
    {
        LOG_INFO("playerbots", "Invite accept failed: %s (%u) inviter lookup failed for '%s'",
            bot->GetName(), bot->GetGUIDLow(), name.c_str());
        return false;
    }

    if (!PlayerbotSecurity::IsFactionInteractionAllowed(bot, inviter))
    {
        bool const allowTwoSideGroup = sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP);
        LOG_INFO("playerbots",
            "Invite accept denied by faction policy: inviter=%s inviterGuidLow=%u inviterTeam=%u inviterSecurity=%u "
            "bot=%s botGuidLow=%u botTeam=%u allowTwoSideGroup=%u",
            inviter->GetName(), inviter->GetGUIDLow(), inviter->GetTeam(),
            inviter->GetSession() ? inviter->GetSession()->GetSecurity() : 0, bot->GetName(), bot->GetGUIDLow(),
            bot->GetTeam(), allowTwoSideGroup);
        WorldPacket data(SMSG_GROUP_DECLINE, 10);
        data << bot->GetName();
        inviter->SendDirectMessage(&data);
        bot->UninviteFromGroup();
        return false;
    }

    if (!botAI->GetSecurity()->CheckLevelFor(PLAYERBOT_SECURITY_INVITE, false, inviter))
    {
        LOG_INFO("playerbots", "Invite accept rejected by security: %s (%u) inviter=%s (%u)",
            bot->GetName(), bot->GetGUIDLow(), inviter->GetName(), inviter->GetGUIDLow());
        WorldPacket data(SMSG_GROUP_DECLINE, 10);
        data << bot->GetName();
        inviter->SendDirectMessage(&data);
        bot->UninviteFromGroup();
        return false;
    }

    if (bot->IsAFK())
        bot->ToggleAFK();

    WorldPacket p;
    uint32 roles_mask = 0;
    p << roles_mask;
    bot->GetSession()->HandleGroupAcceptOpcode(p);

    if (!bot->GetGroup() || !bot->GetGroup()->IsMember(inviter->GetGUID()))
    {
        LOG_INFO("playerbots", "Invite accept failed post-accept membership check: %s (%u) inviter=%s (%u)",
            bot->GetName(), bot->GetGUIDLow(), inviter->GetName(), inviter->GetGUIDLow());
        return false;
    }

    if (sRandomPlayerbotMgr.IsRandomBot(bot))
        botAI->SetMaster(inviter);
    // else
    // PlayerbotRepository::instance().Save(botAI);

    botAI->ResetStrategies();
    botAI->ChangeStrategy("+follow,-lfg,-bg", BOT_STATE_NON_COMBAT);
    botAI->Reset();

    botAI->TellMaster("Hello");

    if (bot->GetDistance(inviter) > sPlayerbotAIConfig.sightDistance || bot->GetWorldMask() != inviter->GetWorldMask())
    {
        Teleport(inviter, bot, true, inviter, "group invite");
    }
    return true;
}
