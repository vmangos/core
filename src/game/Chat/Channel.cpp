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

Channel::Channel(const std::string& name, const std::string& originalName, LocaleConstant locale)
    : m_announce(true), m_moderate(false), m_name(name), m_flags(0), m_channelId(0),
        m_securityLevel(0), m_area_dependant(true), m_levelRestricted(true)
{
    // set special flags if built-in channel
    ChatChannelsEntry const* ch = GetChannelEntryFor(originalName);
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
        m_localized_names = new std::string[MAX_DBC_LOCALE];
        m_localized_names[locale] = originalName;
    }
    else                                                    // it's custom channel
    {
        normalizePlayerName(m_name);
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

Channel::~Channel()
{
    if (m_channelId != 0)
        delete[] m_localized_names;
}

void Channel::SetLocalName(LocaleConstant locale, std::string localname)
{
    if (m_channelId != 0)
        m_localized_names[locale] = localname;
}

std::string Channel::GetLocalName(LocaleConstant locale)
{
    if (m_channelId != 0)
        return m_localized_names[locale];
    else
        return "";
}

void Channel::Join(ObjectGuid p, const char* name, const char *pass)
{
    WorldPacket data;
    if (IsOn(p))
    {
        if (!IsConstant())                                  // non send error message for built-in channels
        {
            MakePlayerAlreadyMember(&data, p, name);
            SendToOne(&data, p);
        }
        return;
    }

    if (IsBanned(p))
    {
        MakeBanned(&data, name);
        SendToOne(&data, p);
        return;
    }

    if (m_password.length() > 0 && strcmp(pass, m_password.c_str()))
    {
        MakeWrongPassword(&data, name);
        SendToOne(&data, p);
        return;
    }

    PlayerPointer plr = GetPlayer(p);

    if (m_securityLevel && (!plr.get() || plr->GetSession()->GetSecurity() < m_securityLevel))
    {
        MakeWrongPassword(&data, name);
        SendToOne(&data, p);
        return;
    }

    if (plr && plr->ToPlayer())
    {
        if (GetChannelId() == CHANNEL_ID_TRADE || GetChannelId() == CHANNEL_ID_GUILD_RECRUITMENT)
        {
            uint32 zoneid = GetAreaIdByLocalizedName(name);
            if (zoneid != CAPITAL_ZONE_ID)
            {
                sLog.outError("Player \"%s\" tried to join channel \"%s\" without beeing in a capital city: zoneid=%u", plr->GetName(), name, zoneid);
                return;
            }
        }

        SetLocalName(plr->GetSession()->GetSessionDbcLocale(), name);
        if (plr->GetGuildId() && (GetFlags() == 0x38))
            return;

        plr->ToPlayer()->JoinedChannel(this);
    }

    if (m_announce && (!plr.get() || plr->GetSession()->GetSecurity() < SEC_GAMEMASTER || !sWorld.getConfig(CONFIG_BOOL_SILENTLY_GM_JOIN_TO_CHANNEL)))
    {
        MakeJoined(&data, p, name);
        SendToAll(&data);
    }

    data.clear();

    PlayerInfo& pinfo = m_players[p];
    pinfo.player = p;
    pinfo.flags = MEMBER_FLAG_NONE;

    MakeYouJoined(&data, name);
    SendToOne(&data, p);

    JoinNotify(p, name);

    // if no owner first logged will become
    if (HasFlag(CHANNEL_FLAG_CUSTOM) && !IsConstant() && !m_ownerGuid)
    {
        SetOwner(p, name, (m_players.size() > 1 ? true : false));
        m_players[p].SetModerator(true);
    }
}

void Channel::Leave(ObjectGuid p, const char* name, bool send)
{
    if (!IsOn(p))
    {
        if (send)
        {
            WorldPacket data;
            MakeNotMember(&data, name);
            SendToOne(&data, p);
        }
    }
    else
    {
        PlayerPointer plr = GetPlayer(p);

        if (send)
        {
            WorldPacket data;
            MakeYouLeft(&data, name);
            SendToOne(&data, p);
            plr->LeftChannel(this);
            data.clear();
        }

        bool changeowner = m_players[p].IsOwner();

        m_players.erase(p);
        if (m_announce && (!plr.get() || plr->GetSession()->GetSecurity() < SEC_GAMEMASTER || !sWorld.getConfig(CONFIG_BOOL_SILENTLY_GM_JOIN_TO_CHANNEL)))
        {
            WorldPacket data;
            MakeLeft(&data, p, name);
            SendToAll(&data);
        }

        LeaveNotify(p, name);

        if (changeowner)
        {
            ObjectGuid newowner = !m_players.empty() ? m_players.begin()->second.player : ObjectGuid();
            SetOwner(newowner, name);
        }
    }
}

void Channel::KickOrBan(ObjectGuid good, const char *badname, bool ban, const char *chanName)
{
    AccountTypes sec = SEC_PLAYER;
    PlayerPointer gplr = GetPlayer(good);
    if (gplr)
        sec = gplr->GetSession()->GetSecurity();

    if (!IsOn(good))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, good);
    }
    else if (!m_players[good].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data, chanName);
        SendToOne(&data, good);
    }
    else
    {
        Player *bad = sObjectMgr.GetPlayer(badname);
        if (bad == NULL || !IsOn(bad->GetObjectGuid()))
        {
            WorldPacket data;
            MakePlayerNotFound(&data, badname, chanName);
            SendToOne(&data, good);
        }
        else if (sec < SEC_GAMEMASTER && bad->GetObjectGuid() == m_ownerGuid && good != m_ownerGuid)
        {
            WorldPacket data;
            MakeNotOwner(&data, chanName);
            SendToOne(&data, good);
        }
        else
        {
            bool changeowner = (m_ownerGuid == bad->GetObjectGuid());

            WorldPacket data;

            if (ban && !IsBanned(bad->GetObjectGuid()))
            {
                m_banned.insert(bad->GetObjectGuid());
                MakePlayerBanned(&data, bad->GetObjectGuid(), good, chanName);
            }
            else
                MakePlayerKicked(&data, bad->GetObjectGuid(), good, chanName);

            SendToAll(&data);
            m_players.erase(bad->GetObjectGuid());
            bad->LeftChannel(this);

            if (changeowner)
            {
                ObjectGuid newowner = !m_players.empty() ? good : ObjectGuid();
                SetOwner(newowner, chanName);
            }
        }
    }
}

void Channel::UnBan(ObjectGuid good, const char *badname, const char *chanName)
{
    uint32 sec = 0;
    PlayerPointer gplr = GetPlayer(good);
    if (gplr)
        sec = gplr->GetSession()->GetSecurity();

    if (!IsOn(good))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, good);
    }
    else if (!m_players[good].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data, chanName);
        SendToOne(&data, good);
    }
    else
    {
        Player *bad = sObjectMgr.GetPlayer(badname);
        if (bad == NULL || !IsBanned(bad->GetObjectGuid()))
        {
            WorldPacket data;
            MakePlayerNotFound(&data, badname, chanName);
            SendToOne(&data, good);
        }
        else
        {
            m_banned.erase(bad->GetObjectGuid());

            WorldPacket data;
            MakePlayerUnbanned(&data, bad->GetObjectGuid(), good, chanName);
            SendToAll(&data);
        }
    }
}

void Channel::Password(ObjectGuid p, const char *pass, const char *chanName)
{
    uint32 sec = 0;
    PlayerPointer plr = GetPlayer(p);
    if (plr)
        sec = plr->GetSession()->GetSecurity();

    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
    }
    else if (!m_players[p].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data, chanName);
        SendToOne(&data, p);
    }
    else
    {
        m_password = pass;

        WorldPacket data;
        MakePasswordChanged(&data, p, chanName);
        SendToAll(&data);
    }
}

void Channel::SetMode(ObjectGuid p, const char *p2n, bool mod, bool set, const char *chanName)
{
    PlayerPointer plr = GetPlayer(p);
    if (!plr.get())
        return;

    uint32 sec = plr->GetSession()->GetSecurity();

    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
    }
    else if (!m_players[p].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data, chanName);
        SendToOne(&data, p);
    }
    else
    {
        PlayerPointer newp = GetPlayer(p2n);
        if (!newp.get())
        {
            WorldPacket data;
            MakePlayerNotFound(&data, p2n, chanName);
            SendToOne(&data, p);
            return;
        }

        PlayerInfo inf = m_players[newp->GetObjectGuid()];
        if (p == m_ownerGuid && newp->GetObjectGuid() == m_ownerGuid && mod)
            return;

        if (!IsOn(newp->GetObjectGuid()))
        {
            WorldPacket data;
            MakePlayerNotFound(&data, p2n, chanName);
            SendToOne(&data, p);
            return;
        }

        // allow make moderator from another team only if both is GMs
        // at this moment this only way to show channel post for GM from another team
        if ((plr->GetSession()->GetSecurity() < SEC_GAMEMASTER || newp->GetSession()->GetSecurity() < SEC_GAMEMASTER) &&
                plr->GetTeam() != newp->GetTeam() && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
        {
            WorldPacket data;
            MakePlayerNotFound(&data, p2n, chanName);
            SendToOne(&data, p);
            return;
        }

        if (m_ownerGuid == newp->GetObjectGuid() && m_ownerGuid != p)
        {
            WorldPacket data;
            MakeNotOwner(&data, chanName);
            SendToOne(&data, p);
            return;
        }

        if (mod)
        {
            if (HasFlag(CHANNEL_FLAG_GENERAL) && newp->GetSession()->GetSecurity() < SEC_GAMEMASTER)
                return;

            SetModerator(newp->GetObjectGuid(), set, chanName);
        }
        else
            SetMute(newp->GetObjectGuid(), set, chanName);
    }
}

void Channel::SetOwner(ObjectGuid p, const char *newname, const char * chanName)
{
    PlayerPointer plr = GetPlayer(p);
    if (!plr.get())
        return;

    uint32 sec = plr->GetSession()->GetSecurity();

    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
        return;
    }

    if (sec < SEC_GAMEMASTER && p != m_ownerGuid)
    {
        WorldPacket data;
        MakeNotOwner(&data, chanName);
        SendToOne(&data, p);
        return;
    }

    Player *newp = sObjectMgr.GetPlayer(newname);
    if (!newp || !IsOn(newp->GetObjectGuid()))
    {
        WorldPacket data;
        MakePlayerNotFound(&data, newname, chanName);
        SendToOne(&data, p);
        return;
    }

    if (newp->GetTeam() != plr->GetTeam() && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
    {
        WorldPacket data;
        MakePlayerNotFound(&data, newname, chanName);
        SendToOne(&data, p);
        return;
    }

    if (HasFlag(CHANNEL_FLAG_GENERAL) && newp->GetSession()->GetSecurity() < SEC_GAMEMASTER)
        return;

    m_players[newp->GetObjectGuid()].SetModerator(true);
    SetOwner(newp->GetObjectGuid(), chanName);
}

void Channel::SendWhoOwner(ObjectGuid p, const char * chanName)
{
    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
    }
    else
    {
        WorldPacket data;
        MakeChannelOwner(&data, chanName);
        SendToOne(&data, p);
    }
}

void Channel::List(PlayerPointer player, const char * chanName)
{
    ObjectGuid p = player->GetObjectGuid();

    MasterPlayer* masterPlayer = player->ToMasterPlayer();
    Player* asPlayer = player->ToPlayer();

    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
    }
    else
    {
        WorldPacket data(SMSG_CHANNEL_LIST, 1 + (GetName().size() + 1) + 1 + 4 + m_players.size() * (8 + 1));
        data << uint8(1);                                   // channel type?
        data << GetName();                                  // channel name
        data << uint8(GetFlags());                          // channel flags?

        size_t pos = data.wpos();
        data << uint32(0);                                  // size of list, placeholder

        AccountTypes gmLevelInWhoList = (AccountTypes)sWorld.getConfig(CONFIG_UINT32_GM_LEVEL_IN_WHO_LIST);

        uint32 count  = 0;
        for (PlayerList::const_iterator i = m_players.begin(); i != m_players.end(); ++i)
        {
            if (masterPlayer)
            {
                MasterPlayer* plr = sObjectAccessor.FindMasterPlayer(i->first);
                // PLAYER can't see MODERATOR, GAME MASTER, ADMINISTRATOR characters
                // MODERATOR, GAME MASTER, ADMINISTRATOR can see all
                if (plr && (masterPlayer->GetSession()->GetSecurity() > SEC_PLAYER || plr->GetSession()->GetSecurity() <= gmLevelInWhoList) &&
                        plr->IsVisibleGloballyFor(masterPlayer))
                {
                    data << ObjectGuid(i->first);
                    data << uint8(i->second.flags);             // flags seems to be changed...
                    ++count;
                }
            }
            else
            {
                Player *plr = sObjectMgr.GetPlayer(i->first);

                // PLAYER can't see MODERATOR, GAME MASTER, ADMINISTRATOR characters
                // MODERATOR, GAME MASTER, ADMINISTRATOR can see all
                if (plr && (asPlayer->GetSession()->GetSecurity() > SEC_PLAYER || plr->GetSession()->GetSecurity() <= gmLevelInWhoList) &&
                        plr->IsVisibleGloballyFor(asPlayer))
                {
                    data << ObjectGuid(i->first);
                    data << uint8(i->second.flags);             // flags seems to be changed...
                    ++count;
                }
            }
        }

        data.put<uint32>(pos, count);

        SendToOne(&data, p);
    }
}

void Channel::Announce(ObjectGuid p, const char* chanName)
{
    uint32 sec = 0;
    PlayerPointer plr = GetPlayer(p);
    if (plr)
        sec = plr->GetSession()->GetSecurity();

    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
    }
    else if (!m_players[p].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data, chanName);
        SendToOne(&data, p);
    }
    else
    {
        m_announce = !m_announce;

        WorldPacket data;
        if (m_announce)
            MakeAnnouncementsOn(&data, p, chanName);
        else
            MakeAnnouncementsOff(&data, p, chanName);
        SendToAll(&data);
    }
}

void Channel::Moderate(ObjectGuid p, const char* chanName)
{
    uint32 sec = 0;
    PlayerPointer plr = GetPlayer(p);
    if (plr)
        sec = plr->GetSession()->GetSecurity();

    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
    }
    else if (!m_players[p].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data, chanName);
        SendToOne(&data, p);
    }
    else
    {
        m_moderate = !m_moderate;

        WorldPacket data;
        if (m_moderate)
            MakeModerationOn(&data, p, chanName);
        else
            MakeModerationOff(&data, p, chanName);
        SendToAll(&data);
    }
}

void Channel::Say(ObjectGuid p, const char *what, const char* chanName, uint32 lang, bool skipCheck)
{
    if (!what)
        return;
    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
        lang = LANG_UNIVERSAL;

    uint32 sec = 0;
    PlayerPointer plr = GetPlayer(p);
    int32 playerRank = 0;

    if (plr)
        sec = plr->GetSession()->GetSecurity();

    if (!skipCheck && !IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
    }
    else if (!skipCheck && m_players[p].IsMuted())
    {
        WorldPacket data;
        MakeMuted(&data, chanName);
        SendToOne(&data, p);
    }
    else if (!skipCheck && m_moderate && !m_players[p].IsModerator() && sec < SEC_GAMEMASTER)
    {
        WorldPacket data;
        MakeNotModerator(&data, chanName);
        SendToOne(&data, p);
    }
    else if (GetChannelId() == 0)
    {
        uint32 messageLength = strlen(what) + 1;
        WorldPacket data(SMSG_MESSAGECHAT, 1 + 4 + 8 + 4 + GetName().size() + 1 + 8 + 4 + messageLength + 1);
        data << uint8(CHAT_MSG_CHANNEL);
        data << uint32(lang);
        data << GetName().c_str();
        data << uint32(0);
        data << ObjectGuid(p);
        data << uint32(messageLength);
        data << what;
        data << uint8(plr ? plr->chatTag() : 0);

        if (!skipCheck && plr &&
            plr->GetSession()->GetAccountFlags() & ACCOUNT_FLAG_MUTED_FROM_PUBLIC_CHANNELS &&
            plr->GetSession()->GetAccountMaxLevel() < sWorld.getConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL))
            plr->GetSession()->SendPacket(&data);
        else
            SendToAll(&data, (!skipCheck && !m_players[p].IsModerator()) ? p : ObjectGuid());
    }
    else
    {
        for (PlayerList::const_iterator i = m_players.begin(); i != m_players.end(); ++i)
        {
            if (Player* plrtarget = sObjectMgr.GetPlayer(i->first))
            {
                if (!plrtarget->GetSocial()->HasIgnore(p))
                {
                    uint32 messageLength = strlen(what) + 1;
                    std::string localizedChannelName = GetLocalName(plrtarget->GetSession()->GetSessionDbcLocale());
                    WorldPacket data(SMSG_MESSAGECHAT, 1 + 4 + 8 + 4 + localizedChannelName.size() + 1 + 8 + 4 + messageLength + 1);
                    data << uint8(CHAT_MSG_CHANNEL);
                    data << uint32(lang);
                    data << localizedChannelName.c_str();
                    data << uint32(0);
                    data << ObjectGuid(p);
                    data << uint32(messageLength);
                    data << what;
                    data << uint8(plr ? plr->chatTag() : 0);
                    plrtarget->GetSession()->SendPacket(&data);
                }
            }
        }
    }
}

void Channel::Invite(ObjectGuid p, const char *newname, const char *chanName)
{
    if (!IsOn(p))
    {
        WorldPacket data;
        MakeNotMember(&data, chanName);
        SendToOne(&data, p);
        return;
    }

    PlayerPointer newp = GetPlayer(newname);
    if (!newp)
    {
        WorldPacket data;
        MakePlayerNotFound(&data, newname, chanName);
        SendToOne(&data, p);
        return;
    }

    PlayerPointer plr = GetPlayer(p);
    if (!plr.get())
        return;

    if (newp->GetTeam() != plr->GetTeam() && !sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
    {
        WorldPacket data;
        MakeInviteWrongFaction(&data, chanName);
        SendToOne(&data, p);
        return;
    }

    if (IsOn(newp->GetObjectGuid()))
    {
        WorldPacket data;
        MakePlayerAlreadyMember(&data, newp->GetObjectGuid(), chanName);
        SendToOne(&data, p);
        return;
    }

    WorldPacket data;
    if (!newp->GetSocial()->HasIgnore(p))
    {
        MakeInvite(&data, p, chanName);
        SendToOne(&data, newp->GetObjectGuid());
        data.clear();
    }
    MakePlayerInvited(&data, newp->GetName(), chanName);
    SendToOne(&data, p);
}

void Channel::SetOwner(ObjectGuid guid, const char * chanName, bool exclaim)
{
    PlayerPointer newp = GetPlayer(guid);
    if (!newp)
        return;

    if (HasFlag(CHANNEL_FLAG_GENERAL) && newp->GetSession()->GetSecurity() < SEC_GAMEMASTER)
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
        MakeModeChange(&data, m_ownerGuid, oldFlag, chanName);
        SendToAll(&data);

        if (exclaim)
        {
            MakeOwnerChanged(&data, m_ownerGuid, chanName);
            SendToAll(&data);
        }
    }
}

void Channel::SendToAll(WorldPacket *data, ObjectGuid p)
{
    for (PlayerList::const_iterator i = m_players.begin(); i != m_players.end(); ++i)
    {
        if (PlayerPointer plr = GetPlayer(i->first))
            if (!plr->GetSocial()->HasIgnore(p))
                plr->GetSession()->SendPacket(data);
    }
}

void Channel::SendToOne(WorldPacket *data, ObjectGuid who)
{
    PlayerPointer plr = GetPlayer(who);
    if (plr)
        plr->GetSession()->SendPacket(data);
}

void Channel::Voice(ObjectGuid /*guid1*/, ObjectGuid /*guid2*/, const char * /*chanName*/)
{

}

void Channel::DeVoice(ObjectGuid /*guid1*/, ObjectGuid /*guid2*/, const char * /*chanName*/)
{

}

// done
void Channel::MakeNotifyPacket(WorldPacket *data, uint8 notify_type, std::string chanName)
{
    data->Initialize(SMSG_CHANNEL_NOTIFY, 1 + chanName.size() + 1);
    *data << uint8(notify_type);
    *data << chanName;
}

// done 0x00
void Channel::MakeJoined(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_JOINED_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x01
void Channel::MakeLeft(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_LEFT_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x02
void Channel::MakeYouJoined(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_YOU_JOINED_NOTICE, chanName);
    *data << uint8(GetFlags());
    *data << uint32(GetChannelId());
    *data << uint32(0);
}

// done 0x03
void Channel::MakeYouLeft(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_YOU_LEFT_NOTICE, chanName);
    *data << uint32(GetChannelId());
    *data << uint8(0);                                      // can be 0x00 and 0x01
}

// done 0x04
void Channel::MakeWrongPassword(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_WRONG_PASSWORD_NOTICE, chanName);
}

// done 0x05
void Channel::MakeNotMember(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_NOT_MEMBER_NOTICE, chanName);
}

// done 0x06
void Channel::MakeNotModerator(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_NOT_MODERATOR_NOTICE, chanName);
}

// done 0x07
void Channel::MakePasswordChanged(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PASSWORD_CHANGED_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x08
void Channel::MakeOwnerChanged(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_OWNER_CHANGED_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x09
void Channel::MakePlayerNotFound(WorldPacket *data, const std::string& name, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_NOT_FOUND_NOTICE, chanName);
    *data << name;
}

// done 0x0A
void Channel::MakeNotOwner(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_NOT_OWNER_NOTICE, chanName);
}

// done 0x0B
void Channel::MakeChannelOwner(WorldPacket *data, std::string chanName)
{
    std::string name = "";

    if (!sObjectMgr.GetPlayerNameByGUID(m_ownerGuid, name) || name.empty())
        name = "PLAYER_NOT_FOUND";

    MakeNotifyPacket(data, CHAT_CHANNEL_OWNER_NOTICE, chanName);
    *data << ((IsConstant() || !m_ownerGuid) ? "Nobody" : name);
}

// done 0x0C
void Channel::MakeModeChange(WorldPacket *data, ObjectGuid guid, uint8 oldflags, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_MODE_CHANGE_NOTICE, chanName);
    *data << ObjectGuid(guid);
    *data << uint8(oldflags);
    *data << uint8(GetPlayerFlags(guid));
}

// done 0x0D
void Channel::MakeAnnouncementsOn(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_ANNOUNCEMENTS_ON_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x0E
void Channel::MakeAnnouncementsOff(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_ANNOUNCEMENTS_OFF_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x0F
void Channel::MakeModerationOn(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_MODERATION_ON_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x10
void Channel::MakeModerationOff(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_MODERATION_OFF_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x11
void Channel::MakeMuted(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_MUTED_NOTICE, chanName);
}

// done 0x12
void Channel::MakePlayerKicked(WorldPacket *data, ObjectGuid bad, ObjectGuid good, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_KICKED_NOTICE, chanName);
    *data << ObjectGuid(bad);
    *data << ObjectGuid(good);
}

// done 0x13
void Channel::MakeBanned(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_BANNED_NOTICE, chanName);
}

// done 0x14
void Channel::MakePlayerBanned(WorldPacket *data, ObjectGuid bad, ObjectGuid good, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_BANNED_NOTICE, chanName);
    *data << ObjectGuid(bad);
    *data << ObjectGuid(good);
}

// done 0x15
void Channel::MakePlayerUnbanned(WorldPacket *data, ObjectGuid bad, ObjectGuid good, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_UNBANNED_NOTICE, chanName);
    *data << ObjectGuid(bad);
    *data << ObjectGuid(good);
}

// done 0x16
void Channel::MakePlayerNotBanned(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_NOT_BANNED_NOTICE, chanName);
    *data << ObjectGuid(guid);                              // should be string!!
}

// done 0x17
void Channel::MakePlayerAlreadyMember(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_ALREADY_MEMBER_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x18
void Channel::MakeInvite(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_INVITE_NOTICE, chanName);
    *data << ObjectGuid(guid);
}

// done 0x19
void Channel::MakeInviteWrongFaction(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_INVITE_WRONG_FACTION_NOTICE, chanName);
}

// done 0x1A
void Channel::MakeWrongFaction(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_WRONG_FACTION_NOTICE, chanName);
}

// done 0x1B
void Channel::MakeInvalidName(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_INVALID_NAME_NOTICE, chanName);
}

// done 0x1C
void Channel::MakeNotModerated(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_NOT_MODERATED_NOTICE, chanName);
}

// done 0x1D
void Channel::MakePlayerInvited(WorldPacket *data, const std::string& name, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_INVITED_NOTICE, chanName);
    *data << name;
}

// done 0x1E
void Channel::MakePlayerInviteBanned(WorldPacket *data, ObjectGuid guid, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_PLAYER_INVITE_BANNED_NOTICE, chanName);
    *data << ObjectGuid(guid);                              // should be string!!
}

// done 0x1F
void Channel::MakeThrottled(WorldPacket *data, std::string chanName)
{
    MakeNotifyPacket(data, CHAT_THROTTLED_NOTICE, chanName);
}

void Channel::JoinNotify(ObjectGuid guid, const char* chanName)
{
}

void Channel::LeaveNotify(ObjectGuid guid, const char* chanName)
{
}

PlayerPointer Channel::GetPlayer(ObjectGuid guid)
{
    if (m_area_dependant)
    {
        Player* plr = sObjectAccessor.FindPlayerNotInWorld(guid);
        return PlayerPointer(plr ? new PlayerWrapper<Player>(plr) : NULL);
    }
    MasterPlayer* plr = sObjectAccessor.FindMasterPlayer(guid);
    return PlayerPointer(plr ? new PlayerWrapper<MasterPlayer>(plr) : NULL);
}

PlayerPointer Channel::GetPlayer(const char* name)
{
    if (m_area_dependant)
    {
        Player* plr = sObjectAccessor.FindPlayerByNameNotInWorld(name);
        return PlayerPointer(plr ? new PlayerWrapper<Player>(plr) : NULL);
    }
    MasterPlayer* plr = sObjectAccessor.FindMasterPlayer(name);
    return PlayerPointer(plr ? new PlayerWrapper<MasterPlayer>(plr) : NULL);
}
