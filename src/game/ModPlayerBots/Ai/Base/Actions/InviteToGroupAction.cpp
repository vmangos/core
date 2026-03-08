/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "InviteToGroupAction.h"

#include "Event.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "PlayerbotAI.h"
#include "Playerbots.h"

namespace
{
bool CanInviteToGroup(Player* inviter, Player* player)
{
    if (!inviter || !player || inviter == player)
        return false;

    if (!inviter->GetSession() || !player->GetSession())
        return false;

    if (!inviter->IsInWorld() || !player->IsInWorld())
        return false;

    if (player->GetGroup() || player->GetGroupInvite())
        return false;

    if (inviter->GetGroup() && !inviter->GetGroup()->IsLeader(inviter->GetGUID()))
        return false;

    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP) && inviter->GetTeam() != player->GetTeam())
        return false;

    return true;
}
}  // namespace

bool InviteToGroupAction::Invite(Player* inviter, Player* player)
{
    if (!CanInviteToGroup(inviter, player))
        return false;

    WorldPacket p;
    uint32 rolesMask = 0;
    p << player->GetName();
    p << rolesMask;
    inviter->GetSession()->HandleGroupInviteOpcode(p);
    return player->GetGroupInvite() || (player->GetGroup() && inviter->GetGroup() == player->GetGroup());
}

bool InviteNearbyToGroupAction::Execute(Event /*event*/)
{
    if (!isUseful())
        return false;

    GuidVector nearby = AI_VALUE(GuidVector, "nearest friendly players");
    for (ObjectGuid guid : nearby)
    {
        Player* player = ObjectAccessor::FindPlayer(guid);
        if (!player || player == bot || player->IsBot())
            continue;

        if (!bot->IsWithinDistInMap(player, sPlayerbotAIConfig.sightDistance))
            continue;

        if (!Invite(bot, player))
            continue;

        botAI->GetAiObjectContext()->GetValue<time_t>("last said", "invite nearby")->Set(time(nullptr) + urand(45, 120));
        return true;
    }

    return false;
}

bool InviteNearbyToGroupAction::isUseful()
{
    if (!sPlayerbotAIConfig.randomBotInvitePlayer || !sRandomPlayerbotMgr.IsRandomBot(bot))
        return false;

    if (botAI->HasRealPlayerMaster() || bot->IsInCombat() || bot->InBattleground() || bot->InBattlegroundQueue())
        return false;

    if (bot->GetGroup() && !bot->GetGroup()->IsLeader(bot->GetGUID()))
        return false;

    return AI_VALUE2(time_t, "last said", "invite nearby") <= time(nullptr);
}

std::vector<Player*> InviteGuildToGroupAction::getGuildMembers()
{
    std::vector<Player*> result;
    if (!bot->GetGuildId())
        return result;

    HashMapHolder<Player>::ReadGuard guard(HashMapHolder<Player>::GetLock());
    HashMapHolder<Player>::MapType const& map = sObjectAccessor.GetPlayers();
    for (auto const& itr : map)
    {
        Player* player = itr.second;
        if (!player || player == bot || !player->IsInWorld())
            continue;

        if (player->GetGuildId() != bot->GetGuildId())
            continue;

        if (player->GetGroup() || player->GetGroupInvite())
            continue;

        result.push_back(player);
    }

    return result;
}

bool InviteGuildToGroupAction::Execute(Event /*event*/)
{
    if (!isUseful())
        return false;

    for (Player* player : getGuildMembers())
    {
        if (!player || !bot->IsWithinDistInMap(player, sPlayerbotAIConfig.sightDistance))
            continue;

        PlayerbotAI* playerAI = GET_PLAYERBOT_AI(player);
        if (playerAI && playerAI->HasRealPlayerMaster())
            continue;

        if (!Invite(bot, player))
            continue;

        botAI->GetAiObjectContext()->GetValue<time_t>("last said", "invite guild")->Set(time(nullptr) + urand(60, 180));
        return true;
    }

    return false;
}

bool JoinGroupAction::Execute(Event event)
{
    Player* master = event.getOwner();
    if (!master)
        return false;
    return Invite(master, bot);
}

bool LfgAction::Execute(Event event)
{
    Player* owner = event.getOwner();
    if (owner)
        return Invite(owner, bot);

    if (!sPlayerbotAIConfig.randomBotInvitePlayer || !sRandomPlayerbotMgr.IsRandomBot(bot))
        return false;

    if (botAI->HasRealPlayerMaster() || bot->IsInCombat() || bot->InBattleground() || bot->InBattlegroundQueue())
        return false;

    if (bot->GetGroup() && !bot->GetGroup()->IsLeader(bot->GetGUID()))
        return false;

    if (AI_VALUE2(time_t, "last said", "invite nearby") > time(nullptr))
        return false;

    GuidVector nearby = AI_VALUE(GuidVector, "nearest friendly players");
    for (ObjectGuid guid : nearby)
    {
        Player* player = ObjectAccessor::FindPlayer(guid);
        if (!player || player == bot || player->IsBot())
            continue;

        if (!bot->IsWithinDistInMap(player, sPlayerbotAIConfig.sightDistance))
            continue;

        if (!Invite(bot, player))
            continue;

        botAI->GetAiObjectContext()->GetValue<time_t>("last said", "invite nearby")->Set(time(nullptr) + urand(45, 120));
        return true;
    }

    return false;
}
