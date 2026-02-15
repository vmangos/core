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

#include "ObjectMgr.h"                                      // for normalizePlayerName
#include "ChannelMgr.h"
#include "Chat.h"
#include "World.h"

void WorldSession::HandleJoinChannelOpcode(WorldPackets::Channel::JoinChannel const& packet)
{
    std::string channelname = packet.channelName;

    // Channel name must begin with a letter.
    if (channelname.empty() || (uint8(channelname[0]) <= 127 && !isalpha(channelname[0])))
    {
        WorldPacket data(SMSG_CHANNEL_NOTIFY, 1 + channelname.size() + 1);
        data << uint8(CHAT_INVALID_NAME_NOTICE);
        data << channelname;
        SendPacket(&data);
        return;
    }

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetJoinChannel(channelname))
            chn->Join(player->GetObjectGuid(), packet.channelPassword.c_str());
    }

    if (player->GetSession()->GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_JOIN_OPPOSITE_FACTION_CHANNELS))
        if (ChannelMgr* cMgr = channelMgr(_player->GetTeam() == ALLIANCE ? HORDE : ALLIANCE))
            if (Channel *chn = cMgr->GetJoinChannel(channelname))
                if (!chn->GetSecurityLevel()) // Special both factions channel
                    chn->Join(player->GetObjectGuid(), packet.channelPassword.c_str());
}

void WorldSession::HandleLeaveChannelOpcode(WorldPackets::Channel::LeaveChannel const& packet)
{
    std::string channelname = packet.channelName;

    if (channelname.empty())
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(channelname, player))
            chn->Leave(player->GetObjectGuid(), true);

        cMgr->LeftChannel(channelname);
    }
    if (player->GetSession()->GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_JOIN_OPPOSITE_FACTION_CHANNELS))
        if (ChannelMgr* cMgr = channelMgr(player->GetTeam() == ALLIANCE ? HORDE : ALLIANCE))
        {
            if (Channel *chn = cMgr->GetChannel(channelname, player))
                chn->Leave(player->GetObjectGuid(), true);
            cMgr->LeftChannel(channelname);
        }
}

void WorldSession::HandleChannelListOpcode(WorldPackets::Channel::ChannelList const& packet)
{
    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->List(player);
    }
}

void WorldSession::HandleChannelPasswordOpcode(WorldPackets::Channel::ChannelPassword const& packet)
{
    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->Password(player->GetObjectGuid(), packet.password.c_str());
    }
}

void WorldSession::HandleChannelSetOwnerOpcode(WorldPackets::Channel::ChannelSetOwner const& packet)
{
    std::string newp = packet.playerName;

    if (!normalizePlayerName(newp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->SetOwner(player->GetObjectGuid(), newp.c_str());
    }
}

void WorldSession::HandleChannelOwnerOpcode(WorldPackets::Channel::ChannelOwner const& packet)
{
    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->SendWhoOwner(player->GetObjectGuid());
    }
}

void WorldSession::HandleChannelModeratorOpcode(WorldPackets::Channel::ChannelModerator const& packet)
{
    std::string otp = packet.playerName;

    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->SetModerator(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelUnmoderatorOpcode(WorldPackets::Channel::ChannelUnmoderator const& packet)
{
    std::string otp = packet.playerName;

    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->UnsetModerator(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelMuteOpcode(WorldPackets::Channel::ChannelMute const& packet)
{
    std::string otp = packet.playerName;

    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->SetMute(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelUnmuteOpcode(WorldPackets::Channel::ChannelUnmute const& packet)
{
    std::string otp = packet.playerName;

    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->UnsetMute(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelInviteOpcode(WorldPackets::Channel::ChannelInvite const& packet)
{
    std::string otp = packet.playerName;

    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (player->GetLevel() < sWorld.getConfig(CONFIG_UINT32_CHANNEL_INVITE_MIN_LEVEL))
        return;

    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->Invite(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelKickOpcode(WorldPackets::Channel::ChannelKick const& packet)
{
    std::string otp = packet.playerName;
    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->Kick(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelBanOpcode(WorldPackets::Channel::ChannelBan const& packet)
{
    std::string otp = packet.playerName;

    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->Ban(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelUnbanOpcode(WorldPackets::Channel::ChannelUnban const& packet)
{
    std::string otp = packet.playerName;

    if (!normalizePlayerName(otp))
        return;

    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->UnBan(player->GetObjectGuid(), otp.c_str());
    }
}

void WorldSession::HandleChannelAnnouncementsOpcode(WorldPackets::Channel::ChannelAnnouncements const& packet)
{
    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->Announce(player->GetObjectGuid());
    }
}

void WorldSession::HandleChannelModerateOpcode(WorldPackets::Channel::ChannelModerate const& packet)
{
    PlayerPointer player = GetPlayerPointer();
    if (ChannelMgr* cMgr = channelMgr(player->GetTeam()))
    {
        if (Channel *chn = cMgr->GetChannel(packet.channelName, player))
            chn->Moderate(player->GetObjectGuid());
    }
}

