/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "InviteToGroupAction.h"

#include "Event.h"

bool InviteToGroupAction::Invite(Player* inviter, Player* player)
{
    if (!inviter || !player || inviter == player)
        return false;

    WorldPacket p;
    uint32 rolesMask = 0;
    p << player->GetName();
    p << rolesMask;
    inviter->GetSession()->HandleGroupInviteOpcode(p);
    return true;
}

bool InviteNearbyToGroupAction::Execute(Event /*event*/) { return false; }

bool InviteNearbyToGroupAction::isUseful() { return false; }

std::vector<Player*> InviteGuildToGroupAction::getGuildMembers() { return std::vector<Player*>(); }

bool InviteGuildToGroupAction::Execute(Event /*event*/) { return false; }

bool JoinGroupAction::Execute(Event event)
{
    Player* master = event.getOwner();
    if (!master)
        return false;
    return Invite(master, bot);
}

bool LfgAction::Execute(Event /*event*/) { return false; }
