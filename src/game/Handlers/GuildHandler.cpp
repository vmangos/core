/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "ObjectMgr.h"
#include "Log.h"
#include "Opcodes.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "GossipDef.h"
#include "SocialMgr.h"
#include "Language.h"
#include "Anticheat.h"

void WorldSession::HandleGuildQueryOpcode(WorldPackets::Guild::GuildQuery const& packet)
{
    if (Guild* guild = sGuildMgr.GetGuildById(packet.guildId))
    {
        guild->SendQueryResponse(this);
        return;
    }

    SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
}

void WorldSession::HandleGuildCreateOpcode(WorldPackets::Guild::GuildCreate const& packet)
{
    if (GetPlayer()->GetGuildId())                          // already in guild
        return;

    if (HasTrialRestrictions())
    {
        SendNotification(LANG_RESTRICTED_ACCOUNT);
        return;
    }

    if (utf8length(packet.desiredGuildName).value_or(GUILD_NAME_MAX_LENGTH + 1) > GUILD_NAME_MAX_LENGTH)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to set guild name to string longer than client limit.", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
        return;
    }

    Guild *guild = new Guild;
    if (!guild->Create(GetPlayer(), packet.desiredGuildName))
    {
        delete guild;
        return;
    }

    sGuildMgr.AddGuild(guild);
}

void WorldSession::HandleGuildInviteOpcode(WorldPackets::Guild::GuildInvite const& packet)
{
    Player* player = nullptr;
    if (normalizePlayerName(const_cast<std::string&>(packet.invitedName)))
        player = ObjectAccessor::FindPlayerByName(packet.invitedName.c_str());

    if (!player)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.invitedName, ERR_GUILD_PLAYER_NOT_FOUND_S);
        return;
    }

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (player->GetSession()->HasTrialRestrictions())
    {
        SendNotification(LANG_RESTRICTED_ACCOUNT);
        return;
    }

    // OK result but not send invite
    if (player->GetSocial()->HasIgnore(GetPlayer()->GetObjectGuid()))
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.invitedName, ERR_GUILD_IGNORING_YOU_S);
        return;
    }

    // not let enemies sign guild charter
    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD) && player->GetTeam() != GetPlayer()->GetTeam())
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.invitedName, ERR_GUILD_NOT_ALLIED);
        return;
    }

    if (player->GetGuildId())
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.invitedName, ERR_ALREADY_IN_GUILD_S);
        return;
    }

    if (player->GetGuildIdInvited())
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.invitedName, ERR_ALREADY_INVITED_TO_GUILD_S);
        return;
    }

    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_INVITE))
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player %s Invited %s to Join his Guild", GetPlayer()->GetName(), packet.invitedName.c_str());

    player->SetGuildIdInvited(GetPlayer()->GetGuildId());
    // Put record into guildlog
    guild->LogGuildEvent(GUILD_EVENT_LOG_INVITE_PLAYER, GetPlayer()->GetObjectGuid(), player->GetObjectGuid());

    auto invitePacket = std::make_unique<WorldPackets::Guild::GuildInviteNotification>();
    invitePacket->inviterName = GetPlayer()->GetName();
    invitePacket->guildName = guild->GetName();
    player->GetSession()->SendPacket(std::move(invitePacket));
}

void WorldSession::HandleGuildRemoveOpcode(WorldPackets::Guild::GuildRemove const& packet)
{
    if (!normalizePlayerName(const_cast<std::string&>(packet.playerName)))
        return;

    Player* player = GetPlayer();
    if (!player->IsInWorld())
        return;

    Guild* guild = sGuildMgr.GetGuildById(player->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_REMOVE))
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    MemberSlot* slot = guild->GetMemberSlot(packet.playerName);
    if (!slot)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_PLAYER_NOT_IN_GUILD_S);
        return;
    }

    if (slot->RankId == GR_GUILDMASTER)
    {
        SendGuildCommandResult(GUILD_QUIT_S, "", ERR_GUILD_LEADER_LEAVE);
        return;
    }

    // do not allow to kick player with same or higher rights
    if (GetPlayer()->GetRank() >= slot->RankId)
    {
        SendGuildCommandResult(GUILD_QUIT_S, packet.playerName, ERR_GUILD_RANK_TOO_HIGH_S);
        return;
    }

    ObjectGuid memberGuid = slot->guid; // $slot will get removed in 'DelMember', but we need it for 'LogGuildEvent'.
    // possible last member removed, do cleanup, and no need events
    if (guild->DelMember(memberGuid))
    {
        guild->Disband();
        delete guild;
        return;
    }

    // Put record into guild log
    guild->LogGuildEvent(GUILD_EVENT_LOG_UNINVITE_PLAYER, player->GetObjectGuid(), memberGuid);

    guild->BroadcastEvent(GE_REMOVED, packet.playerName.c_str(), player->GetName());
}

void WorldSession::HandleGuildAcceptOpcode(NullClientPacket const& /*packet*/)
{
    Guild* guild;
    Player* player = GetPlayer();

    guild = sGuildMgr.GetGuildById(player->GetGuildIdInvited());
    if (!guild || player->GetGuildId())
        return;

    // not let enemies sign guild charter
    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD) && player->GetTeam() != sObjectMgr.GetPlayerTeamByGUID(guild->GetLeaderGuid()))
        return;

    if (guild->AddMember(GetPlayer()->GetObjectGuid(), guild->GetLowestRank()) != GuildAddStatus::OK)
        return;
    // Put record into guild log
    guild->LogGuildEvent(GUILD_EVENT_LOG_JOIN_GUILD, GetPlayer()->GetObjectGuid());

    guild->BroadcastEvent(GE_JOINED, player->GetObjectGuid(), player->GetName());
}

void WorldSession::HandleGuildDeclineOpcode(NullClientPacket const& /*packet*/)
{
    if (_player->GetGuildId() || !_player->GetGuildIdInvited())
        return;

    if (Guild* guild = sGuildMgr.GetGuildById(_player->GetGuildIdInvited()))
    {
        if (ObjectGuid inviterGuid = guild->GetGuildInviter(_player->GetObjectGuid()))
        {
            if (Player const* pInviter = ObjectAccessor::FindPlayer(inviterGuid))
            {
                auto declinePacket = std::make_unique<WorldPackets::Guild::GuildDeclineNotification>();
                declinePacket->playerName = _player->GetName();
                pInviter->GetSession()->SendPacket(std::move(declinePacket));
            }
        }
    }

    _player->SetGuildIdInvited(0);
}

void WorldSession::HandleGuildInfoOpcode(NullClientPacket const& /*packet*/)
{
    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    auto guildInfoPacket = std::make_unique<WorldPackets::Guild::GuildInfo>();
    guildInfoPacket->guildName = guild->GetName();
    guildInfoPacket->createdDay = guild->GetCreatedDay();
    guildInfoPacket->createdMonth = guild->GetCreatedMonth();
    guildInfoPacket->createdYear = guild->GetCreatedYear();
    guildInfoPacket->memberCount = guild->GetMemberSize();
    guildInfoPacket->accountCount = guild->GetAccountsNumber();
    SendPacket(std::move(guildInfoPacket));
}

void WorldSession::HandleGuildRosterOpcode(NullClientPacket const& /*packet*/)
{
    if (Guild* guild = sGuildMgr.GetGuildById(_player->GetGuildId()))
        guild->SendGuildRoster(this);
}

void WorldSession::HandleGuildPromoteOpcode(WorldPackets::Guild::GuildPromote const& packet)
{
    if (!normalizePlayerName(const_cast<std::string&>(packet.playerName)))
        return;

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }
    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_PROMOTE))
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    MemberSlot* slot = guild->GetMemberSlot(packet.playerName);
    if (!slot)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_PLAYER_NOT_IN_GUILD_S);
        return;
    }

    if (slot->guid == GetPlayer()->GetObjectGuid())
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_NAME_INVALID);
        return;
    }

    // allow to promote only to lower rank than member's rank
    // guildmaster's rank = 0
    // GetPlayer()->GetRank() + 1 is highest rank that current player can promote to
    if (GetPlayer()->GetRank() + 1 >= slot->RankId)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_RANK_TOO_HIGH_S);
        return;
    }

    uint32 newRankId = slot->RankId - 1;                    //when promoting player, rank is decreased

    slot->ChangeRank(newRankId);
    // Put record into guild log
    guild->LogGuildEvent(GUILD_EVENT_LOG_PROMOTE_PLAYER, GetPlayer()->GetObjectGuid(), slot->guid, newRankId);

    guild->BroadcastEvent(GE_PROMOTION, _player->GetName(), packet.playerName.c_str(), guild->GetRankName(newRankId).c_str());
}

void WorldSession::HandleGuildDemoteOpcode(WorldPackets::Guild::GuildDemote const& packet)
{
    if (!normalizePlayerName(const_cast<std::string&>(packet.playerName)))
        return;

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());

    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_DEMOTE))
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    MemberSlot* slot = guild->GetMemberSlot(packet.playerName);

    if (!slot)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_PLAYER_NOT_IN_GUILD_S);
        return;
    }

    if (slot->guid == GetPlayer()->GetObjectGuid())
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_NAME_INVALID);
        return;
    }

    // do not allow to demote same or higher rank
    if (GetPlayer()->GetRank() >= slot->RankId)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_RANK_TOO_HIGH_S);
        return;
    }

    // do not allow to demote lowest rank
    if (slot->RankId >= guild->GetLowestRank())
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_RANK_TOO_LOW_S);
        return;
    }

    uint32 newRankId = slot->RankId + 1;                    //when demoting player, rank is increased

    slot->ChangeRank(newRankId);
    // Put record into guild log
    guild->LogGuildEvent(GUILD_EVENT_LOG_DEMOTE_PLAYER, GetPlayer()->GetObjectGuid(), slot->guid, newRankId);

    guild->BroadcastEvent(GE_DEMOTION, _player->GetName(), packet.playerName.c_str(), guild->GetRankName(slot->RankId).c_str());
}

void WorldSession::HandleGuildLeaveOpcode(NullClientPacket const& /*packet*/)
{
    Guild* guild = sGuildMgr.GetGuildById(_player->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (_player->GetObjectGuid() == guild->GetLeaderGuid() && guild->GetMemberSize() > 1)
    {
        SendGuildCommandResult(GUILD_QUIT_S, "", ERR_GUILD_LEADER_LEAVE);
        return;
    }

    if (_player->GetObjectGuid() == guild->GetLeaderGuid())
    {
        guild->Disband();
        delete guild;
        return;
    }

    SendGuildCommandResult(GUILD_QUIT_S, guild->GetName(), ERR_PLAYER_NO_MORE_IN_GUILD);

    if (guild->DelMember(_player->GetObjectGuid()))
    {
        guild->Disband();
        delete guild;
        return;
    }

    // Put record into guild log
    guild->LogGuildEvent(GUILD_EVENT_LOG_LEAVE_GUILD, _player->GetObjectGuid());

    guild->BroadcastEvent(GE_LEFT, _player->GetObjectGuid(), _player->GetName());
}

void WorldSession::HandleGuildDisbandOpcode(NullClientPacket const& /*packet*/)
{
    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (GetPlayer()->GetObjectGuid() != guild->GetLeaderGuid())
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    guild->Disband();
    delete guild;
}

void WorldSession::HandleGuildLeaderOpcode(WorldPackets::Guild::GuildLeader const& packet)
{
    Player* oldLeader = GetPlayer();

    if (!normalizePlayerName(const_cast<std::string&>(packet.playerName)))
        return;

    Guild* guild = sGuildMgr.GetGuildById(oldLeader->GetGuildId());

    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (oldLeader->GetObjectGuid() != guild->GetLeaderGuid())
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    MemberSlot* oldSlot = guild->GetMemberSlot(oldLeader->GetObjectGuid());
    if (!oldSlot)
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    MemberSlot* slot = guild->GetMemberSlot(packet.playerName);
    if (!slot)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_PLAYER_NOT_IN_GUILD_S);
        return;
    }

    guild->SetLeader(slot->guid);
    oldSlot->ChangeRank(GR_OFFICER);

    guild->BroadcastEvent(GE_LEADER_CHANGED, oldLeader->GetName(), packet.playerName.c_str());
}

void WorldSession::HandleGuildMOTDOpcode(WorldPackets::Guild::GuildMOTD const& packet)
{
    if (utf8length(packet.motd).value_or(GUILD_MOTD_MAX_LENGTH + 1) > GUILD_MOTD_MAX_LENGTH)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to set guild motd to string longer than client limit.", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
        return;
    }

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }
    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_SETMOTD))
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    guild->SetMOTD(packet.motd);
    guild->BroadcastEvent(GE_MOTD, packet.motd.c_str());
}

void WorldSession::HandleGuildSetPublicNoteOpcode(WorldPackets::Guild::GuildSetPublicNote const& packet)
{
    if (!normalizePlayerName(const_cast<std::string&>(packet.playerName)))
        return;

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());

    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_EPNOTE))
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    MemberSlot* slot = guild->GetMemberSlot(packet.playerName);
    if (!slot)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_PLAYER_NOT_IN_GUILD_S);
        return;
    }

    if (utf8length(packet.note).value_or(GUILD_NOTE_MAX_LENGTH + 1) > GUILD_NOTE_MAX_LENGTH)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to set guild player note to string longer than client limit.", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
        return;
    }

    slot->SetPNOTE(packet.note);

    guild->SendGuildRoster(this);
}

void WorldSession::HandleGuildSetOfficerNoteOpcode(WorldPackets::Guild::GuildSetOfficerNote const& packet)
{
    if (!normalizePlayerName(const_cast<std::string&>(packet.playerName)))
        return;

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());

    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }
    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_EOFFNOTE))
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    MemberSlot* slot = guild->GetMemberSlot(packet.playerName);
    if (!slot)
    {
        SendGuildCommandResult(GUILD_INVITE_S, packet.playerName, ERR_GUILD_PLAYER_NOT_IN_GUILD_S);
        return;
    }

    if (utf8length(packet.note).value_or(GUILD_NOTE_MAX_LENGTH + 1) > GUILD_NOTE_MAX_LENGTH)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to set guild officer note to string longer than client limit.", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
        return;
    }

    slot->SetOFFNOTE(packet.note);

    guild->SendGuildRoster(this);
}

void WorldSession::HandleGuildRankOpcode(WorldPackets::Guild::GuildRank const& packet)
{
    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (GetPlayer()->GetObjectGuid() != guild->GetLeaderGuid())
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    if (utf8length(packet.rankName).value_or(GUILD_RANK_MAX_LENGTH + 1) > GUILD_RANK_MAX_LENGTH)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to set guild rank name to string longer than client limit.", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
        return;
    }

    guild->SetRankName(packet.rankId, packet.rankName);

    uint32 newRights = packet.rights;
    if (packet.rankId == GR_GUILDMASTER)                    // prevent loss leader rights
        newRights = GR_RIGHT_ALL;

    guild->SetRankRights(packet.rankId, newRights);

    guild->SendQueryResponse(this);
    guild->SendGuildRoster();                                        // broadcast for tab rights update
}

void WorldSession::HandleGuildAddRankOpcode(WorldPackets::Guild::GuildAddRank const& packet)
{
    if (utf8length(packet.rankName).value_or(GUILD_RANK_MAX_LENGTH + 1) > GUILD_RANK_MAX_LENGTH)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to set guild rank name to string longer than client limit.", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
        return;
    }

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (GetPlayer()->GetObjectGuid() != guild->GetLeaderGuid())
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    if (guild->GetRanksSize() >= GUILD_RANKS_MAX_COUNT)     // client not let create more 10 than ranks
        return;

    guild->CreateRank(packet.rankName, GR_RIGHT_GCHATLISTEN | GR_RIGHT_GCHATSPEAK);

    guild->SendQueryResponse(this);
    guild->SendGuildRoster();                                        // broadcast for tab rights update
}

void WorldSession::HandleGuildDelRankOpcode(NullClientPacket const& /*packet*/)
{
    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (GetPlayer()->GetObjectGuid() != guild->GetLeaderGuid())
    {
        SendGuildCommandResult(GUILD_INVITE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    guild->DelRank();

    guild->SendQueryResponse(this);
    guild->SendGuildRoster();                                        // broadcast for tab rights update
}

void WorldSession::SendGuildCommandResult(uint32 typecmd, std::string const& str, uint32 cmdresult)
{
    auto packet = std::make_unique<WorldPackets::Guild::GuildCommandResult>();
    packet->command = typecmd;
    packet->str = str;
    packet->result = cmdresult;
    SendPacket(std::move(packet));
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
void WorldSession::HandleGuildChangeInfoTextOpcode(WorldPackets::Guild::GuildChangeInfoText const& packet)
{
    if (utf8length(packet.infoText).value_or(GUILD_INFO_MAX_LENGTH + 1) > GUILD_INFO_MAX_LENGTH)
    {
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to set guild info to string longer than client limit.", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
        return;
    }

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    if (!guild->HasRankRight(GetPlayer()->GetRank(), GR_RIGHT_MODIFY_GUILD_INFO))
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_PERMISSIONS);
        return;
    }

    guild->SetGINFO(packet.infoText);
}
#endif

void WorldSession::HandleSaveGuildEmblemOpcode(WorldPackets::Guild::SaveGuildEmblem const& packet)
{
    Creature* pCreature = GetPlayer()->GetNPCIfCanInteractWith(packet.vendorGuid, UNIT_NPC_FLAG_TABARDDESIGNER);
    if (!pCreature)
    {
        //[-ZERO] fails silently, not "That's not an emblem vendor!"
        SendSaveGuildEmblem(ERR_GUILDEMBLEM_FAIL_NO_MESSAGE);
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: HandleSaveGuildEmblemOpcode - %s not found or you can't interact with him.", packet.vendorGuid.GetString().c_str());
        return;
    }

    // remove fake death
    if (GetPlayer()->HasUnitState(UNIT_STATE_FEIGN_DEATH))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    Guild* guild = sGuildMgr.GetGuildById(GetPlayer()->GetGuildId());
    if (!guild)
    {
        //"You are not part of a guild!";
        SendSaveGuildEmblem(ERR_GUILDEMBLEM_NOGUILD);
        return;
    }

    if (guild->GetLeaderGuid() != GetPlayer()->GetObjectGuid())
    {
        //"Only guild leaders can create emblems."
        SendSaveGuildEmblem(ERR_GUILDEMBLEM_NOTGUILDMASTER);
        return;
    }

    if (GetPlayer()->GetMoney() < 10 * GOLD)
    {
        //"You can't afford to do that."
        SendSaveGuildEmblem(ERR_GUILDEMBLEM_NOTENOUGHMONEY);
        return;
    }

    GetPlayer()->ModifyMoney(-10 * GOLD);
    guild->SetEmblem(packet.emblemStyle, packet.emblemColor, packet.borderStyle, packet.borderColor, packet.backgroundColor);

    //"Guild Emblem saved."
    SendSaveGuildEmblem(ERR_GUILDEMBLEM_SUCCESS);

    guild->SendQueryResponse(this);
}

void WorldSession::SendSaveGuildEmblem(uint32 msg)
{
    auto emblemResult = std::make_unique<WorldPackets::Guild::SaveGuildEmblemResult>();
    emblemResult->error = msg;
    SendPacket(std::move(emblemResult));
}
