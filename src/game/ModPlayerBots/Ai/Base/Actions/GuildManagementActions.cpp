/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "GuildManagementActions.h"

#include "Event.h"
#include "Guild/Guild.h"
#include "Guild/GuildMgr.h"
#include "ObjectAccessor.h"
#include "PlayerbotAI.h"
#include "Playerbots.h"

namespace
{
std::string NormalizeName(std::string name)
{
    if (!normalizePlayerName(name))
        return "";

    return name;
}

bool CanRunGuildAction(Player* bot)
{
    return bot && bot->GetSession() && bot->GetGuildId() && bot->IsInWorld();
}

bool IsValidGuildInviteTarget(Player* bot, Player* member)
{
    if (!bot || !member || member->GetGuildId() || member->GetGuildIdInvited())
        return false;

    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD) && member->GetTeam() != bot->GetTeam())
        return false;

    return true;
}
}  // namespace

Player* GuidManageAction::GetPlayer(Event event)
{
    std::string name = NormalizeName(event.getParam());
    if (name.empty())
        return nullptr;

    return ObjectAccessor::FindPlayerByName(name.c_str());
}

void GuidManageAction::SendPacket(WorldPacket const& packet)
{
    if (!bot || !bot->GetSession())
        return;

    WorldPacket copy(packet);
    switch (opcode)
    {
        case CMSG_GUILD_INVITE:
            bot->GetSession()->HandleGuildInviteOpcode(copy);
            break;
        case CMSG_GUILD_PROMOTE:
            bot->GetSession()->HandleGuildPromoteOpcode(copy);
            break;
        case CMSG_GUILD_DEMOTE:
            bot->GetSession()->HandleGuildDemoteOpcode(copy);
            break;
        case CMSG_GUILD_REMOVE:
            bot->GetSession()->HandleGuildRemoveOpcode(copy);
            break;
        default:
            break;
    }
}

bool GuidManageAction::Execute(Event event)
{
    if (!CanRunGuildAction(bot))
        return false;

    Guild* guild = sGuildMgr.GetGuildById(bot->GetGuildId());
    if (!guild)
        return false;

    Player* member = GetPlayer(event);
    if (!member || !PlayerIsValid(member))
        return false;

    WorldPacket packet(opcode);
    packet << member->GetName();
    SendPacket(packet);

    return true;
}

bool GuidManageAction::PlayerIsValid(Player* /*member*/) { return false; }

uint8 GuidManageAction::GetRankId(Player* member)
{
    if (!member)
        return 0;

    return member->GetRank();
}

bool GuildInviteAction::isUseful()
{
    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    return guild && guild->HasRankRight(bot->GetRank(), GR_RIGHT_INVITE);
}

bool GuildInviteAction::PlayerIsValid(Player* member)
{
    if (!isUseful() || !member)
        return false;

    return IsValidGuildInviteTarget(bot, member);
}

bool GuildPromoteAction::isUseful()
{
    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    return guild && guild->HasRankRight(bot->GetRank(), GR_RIGHT_PROMOTE);
}

bool GuildPromoteAction::PlayerIsValid(Player* member)
{
    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    if (!guild || !member || member->GetGuildId() != bot->GetGuildId() || member == bot)
        return false;

    MemberSlot* slot = guild->GetMemberSlot(member->GetGUID());
    if (!slot)
        return false;

    return bot->GetRank() + 1 < slot->RankId;
}

bool GuildDemoteAction::isUseful()
{
    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    return guild && guild->HasRankRight(bot->GetRank(), GR_RIGHT_DEMOTE);
}

bool GuildDemoteAction::PlayerIsValid(Player* member)
{
    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    if (!guild || !member || member->GetGuildId() != bot->GetGuildId() || member == bot)
        return false;

    MemberSlot* slot = guild->GetMemberSlot(member->GetGUID());
    if (!slot)
        return false;

    return bot->GetRank() < slot->RankId && slot->RankId < guild->GetLowestRank();
}

bool GuildRemoveAction::isUseful()
{
    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    return guild && guild->HasRankRight(bot->GetRank(), GR_RIGHT_REMOVE);
}

bool GuildRemoveAction::PlayerIsValid(Player* member)
{
    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    if (!guild || !member || member->GetGuildId() != bot->GetGuildId() || member == bot)
        return false;

    MemberSlot* slot = guild->GetMemberSlot(member->GetGUID());
    if (!slot)
        return false;

    return slot->RankId != GR_GUILDMASTER && bot->GetRank() < slot->RankId;
}

bool GuildManageNearbyAction::Execute(Event /*event*/)
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

        if (!IsValidGuildInviteTarget(bot, player))
            continue;

        WorldPacket packet(CMSG_GUILD_INVITE);
        packet << player->GetName();
        bot->GetSession()->HandleGuildInviteOpcode(packet);
        botAI->GetAiObjectContext()->GetValue<time_t>("last said", "guild manage nearby")->Set(time(nullptr) + urand(90, 240));
        return true;
    }

    return false;
}

bool GuildManageNearbyAction::isUseful()
{
    if (!sPlayerbotAIConfig.randomBotGuildNearby || !sRandomPlayerbotMgr.IsRandomBot(bot))
        return false;

    if (botAI->HasRealPlayerMaster() || bot->IsInCombat() || bot->InBattleground() || bot->InBattlegroundQueue())
        return false;

    Guild* guild = CanRunGuildAction(bot) ? sGuildMgr.GetGuildById(bot->GetGuildId()) : nullptr;
    if (!guild || !guild->HasRankRight(bot->GetRank(), GR_RIGHT_INVITE))
        return false;

    return AI_VALUE2(time_t, "last said", "guild manage nearby") <= time(nullptr);
}

bool GuildLeaveAction::Execute(Event /*event*/)
{
    if (!isUseful() || !bot->GetSession())
        return false;

    WorldPacket packet(CMSG_GUILD_LEAVE);
    bot->GetSession()->HandleGuildLeaveOpcode(packet);
    return true;
}

bool GuildLeaveAction::isUseful()
{
    if (!bot || !bot->GetGuildId() || botAI->IsRealPlayer())
        return false;

    if (botAI->HasRealPlayerMaster())
        return false;

    return true;
}
