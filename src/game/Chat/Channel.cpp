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

#include "Channel.h"
#include "ObjectMgr.h"
#include "World.h"
#include "SocialMgr.h"
#include "MasterPlayer.h"
#include "Chat.h"

Channel::Channel(std::string const& name)
    : m_area_dependant(true), m_announce(true), m_moderate(false), m_levelRestricted(true),
      m_name(name), m_flags(0), m_securityLevel(0), m_channelId(0)
{
    // set special flags if built-in channel
    ChatChannelsEntry const* ch = GetChannelEntryFor(name);
    if (ch)                                                 // it's built-in channel
    {
        m_channelId = ch->ChannelID;                        // only built-in channel have channel id != 0
        m_announce = false;                                 // no join/leave announces

        m_flags |= CHANNEL_FLAG_GENERAL;                    // for all built-in channels

        if (ch->flags & CHANNEL_DBC_FLAG_TRADE)             // for trade channel
            m_flags |= CHANNEL_FLAG_TRADE;

        if (ch->flags & CHANNEL_DBC_FLAG_ZONE_DEP)          // Determine if handled in Master or Node
            m_area_dependant = true;

        if (ch->flags & CHANNEL_DBC_FLAG_CITY_ONLY2)        // for city only channels
            m_flags |= CHANNEL_FLAG_CITY;

        if (ch->flags & CHANNEL_DBC_FLAG_LFG)               // for LFG channel
            m_flags |= CHANNEL_FLAG_LFG;
        else                                                // for all other channels
            m_flags |= CHANNEL_FLAG_NOT_LFG;
    }
    else                                                    // it's custom channel
    {
        if (!normalizePlayerName(m_name, (size_t)128))
        {
            m_name = "INVALIDCHANNEL";
            m_announce = false;
        }

        if (m_name == u8"World")
        {
            m_flags |= CHANNEL_FLAG_GENERAL;
            m_announce = false;
        }
        else if (m_name == u8"China" || m_name == u8"中国")
        {
            m_flags |= CHANNEL_FLAG_CUSTOM;
            m_announce = false;
        }
        else
        {
            m_flags |= CHANNEL_FLAG_CUSTOM;
            m_levelRestricted = false;
        }
    }
}

void Channel::Join(ObjectGuid guid, char const* password)
{
    WorldPacket data;
    if (IsOn(guid))
    {
        if (!IsConstant())                                  // non send error message for built-in channels
        {
            MakePlayerAlreadyMember(&data, guid);
            SendToOne(&data, guid);
        }
        return;
    }

    if (IsBanned(guid))
    {
        MakeBanned(&data);
        SendToOne(&data, guid);
        return;
    }

    if (m_password.length() > 0 && strcmp(password, m_password.c_str()) != 0)
    {
        MakeWrongPassword(&data);
        SendToOne(&data, guid);
        return;
    }

    PlayerPointer pPlayer = GetPlayer(guid);

    if (m_securityLevel && (!pPlayer.get() || pPlayer->GetSession()->GetSecurity() < m_securityLevel))
    {
        MakeWrongPassword(&data);
        SendToOne(&data, guid);
        return;
    }

    if (pPlayer && pPlayer->ToPlayer())
    {
        if (pPlayer->GetGuildId() && (GetFlags() == 0x38))
            return;

        pPlayer->ToPlayer()->JoinedChannel(this);
    }

    if (m_announce && (!pPlayer.get() || pPlayer->GetSession()->GetSecurity() < SEC_GAMEMASTER || !sWorld.getConfig(CONFIG_BOOL_SILENTLY_GM_JOIN_TO_CHANNEL)))
    {
        MakeJoined(&data, guid);
        SendToAll(&data);
    }

    data.clear();

    PlayerInfo& pinfo = m_players[guid];
    pinfo.player = guid;
    pinfo.flags = MEMBER_FLAG_NONE;

    MakeYouJoined(&data);
    SendToOne(&data, guid);

    JoinNotify(guid);

    // if no owner first logged will become
    if (HasFlag(CHANNEL_FLAG_CUSTOM) && !IsConstant() && !m_ownerGuid)
    {
        SetOwner(guid, (m_players.size() > 1));
        m_players[guid].SetModerator(true);
    }
}

void Channel::Leave(ObjectGuid guid, bool send)
{
    if (!IsOn(guid))
    {
        if (send)
        {
            WorldPacket data;
            MakeNotMember(&data);
            SendToOne(&data, guid);
        }
        return;
    }

    PlayerPointer pPlayer = GetPlayer(guid);

    // leave channel
    if (send)
    {
        WorldPacket data;
        MakeYouLeft(&data);
        SendToOne(&data, guid);
        pPlayer->LeftChannel(this);
        data.clear();
    }

    bool changeowner = m_players[guid].IsOwner();

    m_players.erase(guid);
    if (m_announce && (!pPlayer.get() || pPlayer->GetSession()->GetSecurity() < SEC_GAMEMASTER || !sWorld.getConfig(CONFIG_BOOL_SILENTLY_GM_JOIN_TO_CHANNEL)))
    {
        WorldPacket data;
        MakeLeft(&data, guid);
        SendToAll(&data);
    }

    LeaveNotify(guid);

    if (changeowner)
    {
        ObjectGuid newowner = !m_players.empty() ? m_players.begin()->second.player : ObjectGuid();
        SetOwner(newowner);
    }
}

void Channel::KickOrBan(ObjectGuid guid, char const* targetName, bool ban)
{
    AccountTypes sec = SEC_PLAYER;
    PlayerPointer gplr = GetPlayer(guid);
    if (gplr)
        sec = gplr->GetSession()->GetSecurity();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    if (!m_players[guid].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data);
        SendToOne(&data, guid);
        return;
    }

    Player* pTarget = sObjectMgr.GetPlayer(targetName);
    if (!pTarget)
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    ObjectGuid targetGuid = pTarget->GetObjectGuid();
    if (!IsOn(targetGuid))
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }
    
    bool changeowner = (m_ownerGuid == targetGuid);

    if (sec < SEC_GAMEMASTER && changeowner && guid != m_ownerGuid)
    {
        WorldPacket data;
        MakeNotOwner(&data);
        SendToOne(&data, guid);
        return;
    }

    // kick or ban player
    WorldPacket data;

    if (ban && !IsBanned(targetGuid))
    {
        m_banned.insert(targetGuid);
        MakePlayerBanned(&data, targetGuid, guid);
    }
    else
        MakePlayerKicked(&data, targetGuid, guid);

    SendToAll(&data);
    m_players.erase(targetGuid);
    pTarget->LeftChannel(this);

    if (changeowner)
    {
        ObjectGuid newowner = !m_players.empty() ? guid : ObjectGuid();
        SetOwner(newowner);
    }
}

void Channel::UnBan(ObjectGuid guid, char const* targetName)
{
    uint32 sec = 0;
    PlayerPointer gplr = GetPlayer(guid);
    if (gplr)
        sec = gplr->GetSession()->GetSecurity();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    if (!m_players[guid].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data);
        SendToOne(&data, guid);
        return;
    }

    Player* pTarget = sObjectMgr.GetPlayer(targetName);
    if (!pTarget)
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    ObjectGuid targetGuid = pTarget->GetObjectGuid();
    if (!IsBanned(targetGuid))
    {
        WorldPacket data;
        MakePlayerNotBanned(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    // unban player
    m_banned.erase(targetGuid);

    WorldPacket data;
    MakePlayerUnbanned(&data, targetGuid, guid);
    SendToAll(&data);
}

void Channel::Password(ObjectGuid guid, char const* password)
{
    uint32 sec = 0;
    PlayerPointer pPlayer = GetPlayer(guid);
    if (pPlayer)
        sec = pPlayer->GetSession()->GetSecurity();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    if (!m_players[guid].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data);
        SendToOne(&data, guid);
        return;
    }

    // set channel password
    m_password = password;

    WorldPacket data;
    MakePasswordChanged(&data, guid);
    SendToAll(&data);
}

void Channel::SetMode(ObjectGuid guid, char const* targetName, bool moderator, bool set)
{
    PlayerPointer pPlayer = GetPlayer(guid);
    if (!pPlayer.get())
        return;

    uint32 sec = pPlayer->GetSession()->GetSecurity();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }
    if (!m_players[guid].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data);
        SendToOne(&data, guid);
        return;
    }

    PlayerPointer pTarget = GetPlayer(targetName);
    if (!pTarget.get())
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    ObjectGuid targetGuid = pTarget->GetObjectGuid();
    if (moderator && guid == m_ownerGuid && targetGuid == m_ownerGuid)
        return;

    if (!IsOn(targetGuid))
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    // allow make moderator from another team only if both are GMs
    // at this moment this only way to show channel post for GM from another team
    if ((pPlayer->GetSession()->GetSecurity() < SEC_GAMEMASTER || pTarget->GetSession()->GetSecurity() < SEC_GAMEMASTER) &&
        pPlayer->GetTeam() != pTarget->GetTeam() && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    if (m_ownerGuid == targetGuid && m_ownerGuid != guid)
    {
        WorldPacket data;
        MakeNotOwner(&data);
        SendToOne(&data, guid);
        return;
    }

    // set channel moderator
    if (moderator)
    {
        if (HasFlag(CHANNEL_FLAG_GENERAL) && pTarget->GetSession()->GetSecurity() < SEC_GAMEMASTER)
            return;

        SetModerator(targetGuid, set);
    }
    else
        SetMute(targetGuid, set);
}

void Channel::SetOwner(ObjectGuid guid, char const* targetName)
{
    PlayerPointer pPlayer = GetPlayer(guid);
    if (!pPlayer.get())
        return;

    uint32 sec = pPlayer->GetSession()->GetSecurity();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    if (sec < SEC_GAMEMASTER && guid != m_ownerGuid)
    {
        WorldPacket data;
        MakeNotOwner(&data);
        SendToOne(&data, guid);
        return;
    }

    Player* pTarget = sObjectMgr.GetPlayer(targetName);
    if (!pTarget)
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    ObjectGuid targetGuid = pTarget->GetObjectGuid();
    if (!IsOn(targetGuid))
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    if (pTarget->GetTeam() != pPlayer->GetTeam() && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    if (HasFlag(CHANNEL_FLAG_GENERAL) && pTarget->GetSession()->GetSecurity() < SEC_GAMEMASTER)
        return;

    // set channel owner
    m_players[targetGuid].SetModerator(true);
    SetOwner(targetGuid);
}

void Channel::SendWhoOwner(ObjectGuid guid)
{
    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    // send channel owner
    WorldPacket data;
    MakeChannelOwner(&data);
    SendToOne(&data, guid);
}

void Channel::List(PlayerPointer player)
{
    ObjectGuid guid = player->GetObjectGuid();

    MasterPlayer* masterPlayer = player->ToMasterPlayer();
    Player* asPlayer = player->ToPlayer();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    // list players in channel
    WorldPacket data(SMSG_CHANNEL_LIST, (GetName().size() + 1) + 1 + 4 + m_players.size() * (8 + 1));   // guess size
    data << GetName();                                  // channel name
    data << uint8(GetFlags());                          // channel flags?

    size_t pos = data.wpos();
    data << int32(0);                                   // size of list, placeholder

    AccountTypes gmLevelInWhoList = (AccountTypes)sWorld.getConfig(CONFIG_UINT32_GM_LEVEL_IN_WHO_LIST);

    uint32 count = 0;
    for (const auto& itr : m_players)
    {
        if (masterPlayer)
        {
            MasterPlayer* pPlayer = sObjectAccessor.FindMasterPlayer(itr.first);
            // PLAYER can't see MODERATOR, GAME MASTER, ADMINISTRATOR characters
            // MODERATOR, GAME MASTER, ADMINISTRATOR can see all
            if (pPlayer && (masterPlayer->GetSession()->GetSecurity() > SEC_PLAYER || pPlayer->GetSession()->GetSecurity() <= gmLevelInWhoList) &&
                pPlayer->IsVisibleGloballyFor(masterPlayer))
            {
                data << ObjectGuid(itr.first);
                data << uint8(itr.second.flags);             // flags seems to be changed...
                ++count;
            }
        }
        else
        {
            Player* pPlayer = sObjectMgr.GetPlayer(itr.first);

            // PLAYER can't see MODERATOR, GAME MASTER, ADMINISTRATOR characters
            // MODERATOR, GAME MASTER, ADMINISTRATOR can see all
            if (pPlayer && (asPlayer->GetSession()->GetSecurity() > SEC_PLAYER || pPlayer->GetSession()->GetSecurity() <= gmLevelInWhoList) &&
                pPlayer->IsVisibleGloballyFor(asPlayer))
            {
                data << ObjectGuid(itr.first);
                data << uint8(itr.second.flags);             // flags seems to be changed...
                ++count;
            }
        }
    }

    data.put<int32>(pos, count);

    SendToOne(&data, guid);
}

void Channel::Announce(ObjectGuid guid)
{
    uint32 sec = 0;
    PlayerPointer pPlayer = GetPlayer(guid);
    if (pPlayer)
        sec = pPlayer->GetSession()->GetSecurity();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    if (!m_players[guid].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data);
        SendToOne(&data, guid);
        return;
    }

    // toggle channel announcement
    m_announce = !m_announce;

    WorldPacket data;
    if (m_announce)
        MakeAnnouncementsOn(&data, guid);
    else
        MakeAnnouncementsOff(&data, guid);

    SendToAll(&data);
}

void Channel::Moderate(ObjectGuid guid)
{
    uint32 sec = 0;
    PlayerPointer pPlayer = GetPlayer(guid);
    if (pPlayer)
        sec = pPlayer->GetSession()->GetSecurity();

    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    if (!m_players[guid].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data);
        SendToOne(&data, guid);
        return;
    }

    // toggle channel moderation
    m_moderate = !m_moderate;

    WorldPacket data;
    if (m_moderate)
        MakeModerationOn(&data, guid);
    else
        MakeModerationOff(&data, guid);

    SendToAll(&data);
}

void Channel::Say(ObjectGuid guid, char const* text, uint32 lang, bool skipCheck)
{
    if (!text)
        return;

    PlayerPointer pPlayer = GetPlayer(guid);
    uint32 const sec = pPlayer ? pPlayer->GetSession()->GetSecurity() : 0;
    uint8  const honor_rank = pPlayer ? pPlayer->ToPlayer()->GetHonorMgr().GetCurrentHonorRank() : 0;

    if (!skipCheck)
    {
        if (!IsOn(guid))
        {
            WorldPacket data;
            MakeNotMember(&data);
            SendToOne(&data, guid);
            return;
        }

        if (m_players[guid].IsMuted() || ((GetChannelId() == CHANNEL_ID_WORLD_DEFENSE) && (honor_rank < 15)))
        {
            WorldPacket data;
            MakeMuted(&data);
            SendToOne(&data, guid);
            return;
        }

        if (m_moderate && !m_players[guid].IsModerator() && sec < SEC_GAMEMASTER)
        {
            WorldPacket data;
            MakeNotModerator(&data);
            SendToOne(&data, guid);
            return;
        }
    }

    // send channel message
    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
        lang = LANG_UNIVERSAL;

    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_CHANNEL, text, Language(lang), pPlayer ? pPlayer->GetChatTag() : 0, guid, nullptr, ObjectGuid(), "", m_name.c_str(), honor_rank);

    if (!skipCheck && pPlayer &&
        pPlayer->GetSession()->GetAccountFlags() & ACCOUNT_FLAG_MUTED_FROM_PUBLIC_CHANNELS &&
        pPlayer->GetSession()->GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
        pPlayer->GetSession()->SendPacket(&data);
    else
        SendToAll(&data, (!skipCheck && !m_players[guid].IsModerator()) ? guid : ObjectGuid());
}

void Channel::Invite(ObjectGuid guid, char const* targetName)
{
    if (!IsOn(guid))
    {
        WorldPacket data;
        MakeNotMember(&data);
        SendToOne(&data, guid);
        return;
    }

    PlayerPointer pTarget = GetPlayer(targetName);
    if (!pTarget)
    {
        WorldPacket data;
        MakePlayerNotFound(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    ObjectGuid targetGuid = pTarget->GetObjectGuid();
    if (IsOn(targetGuid))
    {
        WorldPacket data;
        MakePlayerAlreadyMember(&data, targetGuid);
        SendToOne(&data, guid);
        return;
    }

    if (IsBanned(targetGuid))
    {
        WorldPacket data;
        MakePlayerInviteBanned(&data, targetName);
        SendToOne(&data, guid);
        return;
    }

    PlayerPointer pPlayer = GetPlayer(guid);
    if (!pPlayer.get())
        return;

    if (pTarget->GetTeam() != pPlayer->GetTeam() && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
    {
        WorldPacket data;
        MakeInviteWrongFaction(&data);
        SendToOne(&data, guid);
        return;
    }

    // invite player
    WorldPacket data;
    if (!pTarget->GetSocial()->HasIgnore(guid))
    {
        MakeInvite(&data, guid);
        SendToOne(&data, targetGuid);
        data.clear();
    }

    MakePlayerInvited(&data, pTarget->GetName());
    SendToOne(&data, guid);
}

void Channel::SetOwner(ObjectGuid guid, bool exclaim)
{
    PlayerPointer pPlayer = GetPlayer(guid);
    if (!pPlayer)
        return;

    if (HasFlag(CHANNEL_FLAG_GENERAL) && pPlayer->GetSession()->GetSecurity() < SEC_GAMEMASTER)
        return;

    if (m_ownerGuid)
    {
        // [] will re-add player after it possible removed
        PlayerList::iterator p_itr = m_players.find(m_ownerGuid);
        if (p_itr != m_players.end())
            p_itr->second.SetOwner(false);
    }

    m_ownerGuid = guid;

    if (m_ownerGuid)
    {
        uint8 oldFlag = GetPlayerFlags(m_ownerGuid);
        m_players[m_ownerGuid].SetOwner(true);

        WorldPacket data;
        MakeModeChange(&data, m_ownerGuid, oldFlag);
        SendToAll(&data);

        if (exclaim)
        {
            MakeOwnerChanged(&data, m_ownerGuid);
            SendToAll(&data);
        }
    }
}

void Channel::SendToAll(WorldPacket* data, ObjectGuid guid)
{
    for (const auto& itr : m_players)
    {
        if (PlayerPointer pPlayer = GetPlayer(itr.first))
            if (!pPlayer->GetSocial()->HasIgnore(guid))
                pPlayer->GetSession()->SendPacket(data);
    }
}

void Channel::SendToOne(WorldPacket* data, ObjectGuid who)
{
    PlayerPointer pPlayer = GetPlayer(who);
    if (pPlayer)
        pPlayer->GetSession()->SendPacket(data);
}

void Channel::Voice(ObjectGuid /*guid1*/, ObjectGuid /*guid2*/)
{

}

void Channel::DeVoice(ObjectGuid /*guid1*/, ObjectGuid /*guid2*/)
{

}

void Channel::MakeNotifyPacket(WorldPacket* data, uint8 notify_type)
{
    data->Initialize(SMSG_CHANNEL_NOTIFY, 1 + m_name.size() + 1);
    *data << uint8(notify_type);
    *data << m_name;
}

void Channel::MakeJoined(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_JOINED_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeLeft(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_LEFT_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeYouJoined(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_YOU_JOINED_NOTICE);
    *data << uint32(GetFlags());
    *data << uint32(0);                                     // the non-zero number will be appended to the channel name
    *data << uint8(0);                                      // CString max length 512, conditional read
}

void Channel::MakeYouLeft(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_YOU_LEFT_NOTICE);
    //*data << uint32(GetChannelId());                        //[-ZERO]
    //*data << uint8(0);                                      //[-ZERO] can be 0x00 and 0x01 (bool)
}

void Channel::MakeWrongPassword(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_WRONG_PASSWORD_NOTICE);
}

void Channel::MakeNotMember(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_NOT_MEMBER_NOTICE);
}

void Channel::MakeNotOnPacket(WorldPacket* data, std::string const& name)
{
    data->Initialize(SMSG_CHANNEL_NOTIFY, (1 + name.length() + 1));
    (*data) << (uint8)CHAT_NOT_MEMBER_NOTICE << name;
}

void Channel::MakeNotModerator(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_NOT_MODERATOR_NOTICE);
}

void Channel::MakePasswordChanged(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_PASSWORD_CHANGED_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeOwnerChanged(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_OWNER_CHANGED_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakePlayerNotFound(WorldPacket* data, std::string const& name)
{
    MakeNotifyPacket(data, CHAT_PLAYER_NOT_FOUND_NOTICE);
    *data << name;
}

void Channel::MakeNotOwner(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_NOT_OWNER_NOTICE);
}

void Channel::MakeChannelOwner(WorldPacket* data)
{
    std::string name;

    if (!sObjectMgr.GetPlayerNameByGUID(m_ownerGuid, name) || name.empty())
        name = "PLAYER_NOT_FOUND";

    MakeNotifyPacket(data, CHAT_CHANNEL_OWNER_NOTICE);
    *data << ((IsConstant() || !m_ownerGuid) ? "Nobody" : name);
}

void Channel::MakeModeChange(WorldPacket* data, ObjectGuid guid, uint8 oldflags)
{
    MakeNotifyPacket(data, CHAT_MODE_CHANGE_NOTICE);
    *data << ObjectGuid(guid);
    *data << uint8(oldflags);
    *data << uint8(GetPlayerFlags(guid));
}

void Channel::MakeAnnouncementsOn(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_ANNOUNCEMENTS_ON_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeAnnouncementsOff(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_ANNOUNCEMENTS_OFF_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeModerationOn(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_MODERATION_ON_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeModerationOff(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_MODERATION_OFF_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeMuted(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_MUTED_NOTICE);
}

void Channel::MakePlayerKicked(WorldPacket* data, ObjectGuid target, ObjectGuid source)
{
    MakeNotifyPacket(data, CHAT_PLAYER_KICKED_NOTICE);
    *data << ObjectGuid(target);
    *data << ObjectGuid(source);
}

void Channel::MakeBanned(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_BANNED_NOTICE);
}

void Channel::MakePlayerBanned(WorldPacket* data, ObjectGuid target, ObjectGuid source)
{
    MakeNotifyPacket(data, CHAT_PLAYER_BANNED_NOTICE);
    *data << ObjectGuid(target);
    *data << ObjectGuid(source);
}

void Channel::MakePlayerUnbanned(WorldPacket* data, ObjectGuid target, ObjectGuid source)
{
    MakeNotifyPacket(data, CHAT_PLAYER_UNBANNED_NOTICE);
    *data << ObjectGuid(target);
    *data << ObjectGuid(source);
}

void Channel::MakePlayerNotBanned(WorldPacket* data, std::string const& name)
{
    MakeNotifyPacket(data, CHAT_PLAYER_NOT_BANNED_NOTICE);
    *data << name;
}

void Channel::MakePlayerAlreadyMember(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_PLAYER_ALREADY_MEMBER_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeInvite(WorldPacket* data, ObjectGuid guid)
{
    MakeNotifyPacket(data, CHAT_INVITE_NOTICE);
    *data << ObjectGuid(guid);
}

void Channel::MakeInviteWrongFaction(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_INVITE_WRONG_FACTION_NOTICE);
}

void Channel::MakeWrongFaction(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_WRONG_FACTION_NOTICE);
}

void Channel::MakeInvalidName(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_INVALID_NAME_NOTICE);
}

void Channel::MakeNotModerated(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_NOT_MODERATED_NOTICE);
}

void Channel::MakePlayerInvited(WorldPacket* data, std::string const& name)
{
    MakeNotifyPacket(data, CHAT_PLAYER_INVITED_NOTICE);
    *data << name;
}

void Channel::MakePlayerInviteBanned(WorldPacket* data, std::string const& name)
{
    MakeNotifyPacket(data, CHAT_PLAYER_INVITE_BANNED_NOTICE);
    *data << name;
}

void Channel::MakeThrottled(WorldPacket* data)
{
    MakeNotifyPacket(data, CHAT_THROTTLED_NOTICE);
}

void Channel::JoinNotify(ObjectGuid guid)
{
}

void Channel::LeaveNotify(ObjectGuid guid)
{
}

PlayerPointer Channel::GetPlayer(ObjectGuid guid)
{
    if (m_area_dependant)
    {
        Player* pPlayer = sObjectAccessor.FindPlayerNotInWorld(guid);
        return PlayerPointer(pPlayer ? new PlayerWrapper<Player>(pPlayer) : nullptr);
    }
    MasterPlayer* pPlayer = sObjectAccessor.FindMasterPlayer(guid);
    return PlayerPointer(pPlayer ? new PlayerWrapper<MasterPlayer>(pPlayer) : nullptr);
}

PlayerPointer Channel::GetPlayer(char const* name)
{
    if (m_area_dependant)
    {
        Player* pPlayer = sObjectAccessor.FindPlayerByNameNotInWorld(name);
        return PlayerPointer(pPlayer ? new PlayerWrapper<Player>(pPlayer) : nullptr);
    }
    MasterPlayer* pPlayer = sObjectAccessor.FindMasterPlayer(name);
    return PlayerPointer(pPlayer ? new PlayerWrapper<MasterPlayer>(pPlayer) : nullptr);
}
