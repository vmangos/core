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

#ifndef _CHANNEL_H
#define _CHANNEL_H

#include "Common.h"
#include "ObjectGuid.h"
#include "WorldPacket.h"
#include "Opcodes.h"
#include "MapNodes/AbstractPlayer.h"

#include <list>
#include <map>
#include <string>

enum ChatNotify
{
    CHAT_JOINED_NOTICE                = 0x00,               //+ "%s joined channel.";
    CHAT_LEFT_NOTICE                  = 0x01,               //+ "%s left channel.";
    //CHAT_SUSPENDED_NOTICE             = 0x01,             // "%s left channel.";
    CHAT_YOU_JOINED_NOTICE            = 0x02,               //+ "Joined Channel: [%s]"; -- You joined
    //CHAT_YOU_CHANGED_NOTICE           = 0x02,             // "Changed Channel: [%s]";
    CHAT_YOU_LEFT_NOTICE              = 0x03,               //+ "Left Channel: [%s]"; -- You left
    CHAT_WRONG_PASSWORD_NOTICE        = 0x04,               //+ "Wrong password for %s.";
    CHAT_NOT_MEMBER_NOTICE            = 0x05,               //+ "Not on channel %s.";
    CHAT_NOT_MODERATOR_NOTICE         = 0x06,               //+ "Not a moderator of %s.";
    CHAT_PASSWORD_CHANGED_NOTICE      = 0x07,               //+ "[%s] Password changed by %s.";
    CHAT_OWNER_CHANGED_NOTICE         = 0x08,               //+ "[%s] Owner changed to %s.";
    CHAT_PLAYER_NOT_FOUND_NOTICE      = 0x09,               //+ "[%s] Player %s was not found.";
    CHAT_NOT_OWNER_NOTICE             = 0x0A,               //+ "[%s] You are not the channel owner.";
    CHAT_CHANNEL_OWNER_NOTICE         = 0x0B,               //+ "[%s] Channel owner is %s.";
    CHAT_MODE_CHANGE_NOTICE           = 0x0C,               //?
    CHAT_ANNOUNCEMENTS_ON_NOTICE      = 0x0D,               //+ "[%s] Channel announcements enabled by %s.";
    CHAT_ANNOUNCEMENTS_OFF_NOTICE     = 0x0E,               //+ "[%s] Channel announcements disabled by %s.";
    CHAT_MODERATION_ON_NOTICE         = 0x0F,               //+ "[%s] Channel moderation enabled by %s.";
    CHAT_MODERATION_OFF_NOTICE        = 0x10,               //+ "[%s] Channel moderation disabled by %s.";
    CHAT_MUTED_NOTICE                 = 0x11,               //+ "[%s] You do not have permission to speak.";
    CHAT_PLAYER_KICKED_NOTICE         = 0x12,               //? "[%s] Player %s kicked by %s.";
    CHAT_BANNED_NOTICE                = 0x13,               //+ "[%s] You are banned from that channel.";
    CHAT_PLAYER_BANNED_NOTICE         = 0x14,               //? "[%s] Player %s banned by %s.";
    CHAT_PLAYER_UNBANNED_NOTICE       = 0x15,               //? "[%s] Player %s unbanned by %s.";
    CHAT_PLAYER_NOT_BANNED_NOTICE     = 0x16,               //+ "[%s] Player %s is not banned.";
    CHAT_PLAYER_ALREADY_MEMBER_NOTICE = 0x17,               //+ "[%s] Player %s is already on the channel.";
    CHAT_INVITE_NOTICE                = 0x18,               //+ "%2$s has invited you to join the channel '%1$s'.";
    CHAT_INVITE_WRONG_FACTION_NOTICE  = 0x19,               //+ "Target is in the wrong alliance for %s.";
    CHAT_WRONG_FACTION_NOTICE         = 0x1A,               //+ "Wrong alliance for %s.";
    CHAT_INVALID_NAME_NOTICE          = 0x1B,               //+ "Invalid channel name";
    CHAT_NOT_MODERATED_NOTICE         = 0x1C,               //+ "%s is not moderated";
    CHAT_PLAYER_INVITED_NOTICE        = 0x1D,               //+ "[%s] You invited %s to join the channel";
    CHAT_PLAYER_INVITE_BANNED_NOTICE  = 0x1E,               //+ "[%s] %s has been banned.";
    CHAT_THROTTLED_NOTICE             = 0x1F,               //+ "[%s] The number of messages that can be sent to this channel is limited, please wait to send another message.";
};

enum ChannelIds
{
    CHANNEL_ID_GENERAL           = 1,
    CHANNEL_ID_TRADE             = 2,
    CHANNEL_ID_LOCAL_DEFENSE     = 22,
    CHANNEL_ID_WORLD_DEFENSE     = 23,
    CHANNEL_ID_LOOKING_FOR_GROUP = 24,
    CHANNEL_ID_GUILD_RECRUITMENT = 25
};

class Channel
{
    public:
    enum ChannelFlags
    {
        CHANNEL_FLAG_NONE       = 0x00,
        CHANNEL_FLAG_CUSTOM     = 0x01,
        // 0x02
        CHANNEL_FLAG_TRADE      = 0x04,
        CHANNEL_FLAG_NOT_LFG    = 0x08,
        CHANNEL_FLAG_GENERAL    = 0x10,
        CHANNEL_FLAG_CITY       = 0x20,
        CHANNEL_FLAG_LFG        = 0x40,
        CHANNEL_FLAG_VOICE      = 0x80,
        // General                  0x18 = 0x10 | 0x08
        // Trade                    0x3C = 0x20 | 0x10 | 0x08 | 0x04
        // LocalDefence             0x18 = 0x10 | 0x08
        // GuildRecruitment         0x38 = 0x20 | 0x10 | 0x08
        // LookingForGroup          0x50 = 0x40 | 0x10
    };

    enum ChannelDBCFlags
    {
        CHANNEL_DBC_FLAG_NONE       = 0x00000,
        CHANNEL_DBC_FLAG_INITIAL    = 0x00001,              // General, Trade, LocalDefense, LFG
        CHANNEL_DBC_FLAG_ZONE_DEP   = 0x00002,              // General, Trade, LocalDefense, GuildRecruitment
        CHANNEL_DBC_FLAG_GLOBAL     = 0x00004,              // WorldDefense
        CHANNEL_DBC_FLAG_TRADE      = 0x00008,              // Trade
        CHANNEL_DBC_FLAG_CITY_ONLY  = 0x00010,              // Trade, GuildRecruitment
        CHANNEL_DBC_FLAG_CITY_ONLY2 = 0x00020,              // Trade, GuildRecruitment
        CHANNEL_DBC_FLAG_DEFENSE    = 0x10000,              // LocalDefense, WorldDefense
        CHANNEL_DBC_FLAG_GUILD_REQ  = 0x20000,              // GuildRecruitment
        CHANNEL_DBC_FLAG_LFG        = 0x40000               // LookingForGroup
    };

    enum ChannelMemberFlags
    {
        MEMBER_FLAG_NONE        = 0x00,
        MEMBER_FLAG_OWNER       = 0x01,
        MEMBER_FLAG_MODERATOR   = 0x02,
        MEMBER_FLAG_VOICED      = 0x04,
        MEMBER_FLAG_MUTED       = 0x08,
        MEMBER_FLAG_CUSTOM      = 0x10,
        MEMBER_FLAG_MIC_MUTED   = 0x20,
        // 0x40
        // 0x80
    };

    struct PlayerInfo
    {
        ObjectGuid player;
        uint8 flags;

        bool HasFlag(uint8 flag) { return flags & flag; }
        void SetFlag(uint8 flag) { if(!HasFlag(flag)) flags |= flag; }
        bool IsOwner() { return flags & MEMBER_FLAG_OWNER; }
        void SetOwner(bool state)
        {
            if(state) flags |= MEMBER_FLAG_OWNER;
            else flags &= ~MEMBER_FLAG_OWNER;
        }
        bool IsModerator() { return flags & MEMBER_FLAG_MODERATOR; }
        void SetModerator(bool state)
        {
            if(state) flags |= MEMBER_FLAG_MODERATOR;
            else flags &= ~MEMBER_FLAG_MODERATOR;
        }
        bool IsMuted() { return flags & MEMBER_FLAG_MUTED; }
        void SetMuted(bool state)
        {
            if(state) flags |= MEMBER_FLAG_MUTED;
            else flags &= ~MEMBER_FLAG_MUTED;
        }
    };

        Channel(const std::string& name, const std::string& originalName, LocaleConstant locale);
        ~Channel();
        void SetLocalName(LocaleConstant locale, std::string localname);
        std::string GetLocalName(LocaleConstant locale);
        std::string GetName() const { return m_name; }
        uint32 GetChannelId() const { return m_channelId; }
        bool IsConstant() const { return m_channelId != 0; }
        bool IsAnnounce() const { return m_announce; }
        bool IsLevelRestricted() const { return m_levelRestricted; }
        bool IsLFG() const { return GetFlags() & CHANNEL_FLAG_LFG; }
        std::string GetPassword() const { return m_password; }
        void SetPassword(const std::string& npassword) { m_password = npassword; }
        void SetAnnounce(bool nannounce) { m_announce = nannounce; }
        uint32 GetNumPlayers() const { return m_players.size(); }
        uint8 GetFlags() const { return m_flags; }
        bool HasFlag(uint8 flag) { return m_flags & flag; }
        void SetSecurityLevel(uint8 sec) { m_securityLevel = sec; }
        uint8 GetSecurityLevel() const { return m_securityLevel; }

        void Join(ObjectGuid p, const char* name, const char *pass);
        void Leave(ObjectGuid p, const char *chanName, bool send = true);
        void Leave(ObjectGuid p, bool send = true) { Leave(p, m_name.c_str(), send); }
        void KickOrBan(ObjectGuid good, const char *badname, bool ban, const char *chanName);
        void Kick(ObjectGuid good, const char *badname, const char* chanName) { KickOrBan(good, badname, false, chanName); }
        void Ban(ObjectGuid good, const char *badname, const char* chanName) { KickOrBan(good, badname, true, chanName); }
        void UnBan(ObjectGuid good, const char *badname, const char* chanName);
        void Password(ObjectGuid p, const char *pass, const char* chanName);
        void SetMode(ObjectGuid p, const char *p2n, bool mod, bool set, const char* chanName);
        void SetOwner(ObjectGuid p, const char* chanName, bool exclaim = true);
        void SetOwner(ObjectGuid p, const char *newname, const char* chanName);
        void SendWhoOwner(ObjectGuid p, const char* chanName);
        void SetModerator(ObjectGuid p, const char *newname, const char* chanName) { SetMode(p, newname, true, true, chanName); }
        void UnsetModerator(ObjectGuid p, const char *newname, const char* chanName) { SetMode(p, newname, true, false, chanName); }
        void SetMute(ObjectGuid p, const char *newname, const char* chanName) { SetMode(p, newname, false, true, chanName); }
        void UnsetMute(ObjectGuid p, const char *newname, const char* chanName) { SetMode(p, newname, false, false, chanName); }
        void List(PlayerPointer p, const char* chanName);
        void Announce(ObjectGuid p, const char* chanName);
        void Moderate(ObjectGuid p, const char* chanName);
        void Say(ObjectGuid p, const char *what, const char* chanName, uint32 lang = LANG_UNIVERSAL, bool skipCheck = false);
        void Invite(ObjectGuid p, const char *newp, const char* chanName);
        void Voice(ObjectGuid guid1, ObjectGuid guid2, const char* chanName);
        void DeVoice(ObjectGuid guid1, ObjectGuid guid2, const char* chanName);
		bool IsPlayerOnChannel(ObjectGuid who) { return IsOn(who); }
        void JoinNotify(ObjectGuid guid, const char* chanName);                                       // invisible notify
        void LeaveNotify(ObjectGuid guid, const char* chanName);                                      // invisible notify

    private:
        // initial packet data (notify type and channel name)
        void MakeNotifyPacket(WorldPacket *data, uint8 notify_type, std::string ChanName);
        // type specific packet data
        void MakeJoined(WorldPacket *data, ObjectGuid guid, std::string ChanName);                    //+ 0x00
        void MakeLeft(WorldPacket *data, ObjectGuid guid, std::string ChanName);                      //+ 0x01
        void MakeYouJoined(WorldPacket *data, std::string ChanName);                                  //+ 0x02
        void MakeYouLeft(WorldPacket *data, std::string ChanName);                                    //+ 0x03
        void MakeWrongPassword(WorldPacket *data, std::string ChanName);                              //? 0x04
        void MakeNotMember(WorldPacket *data, std::string ChanName);                                  //? 0x05
        void MakeNotModerator(WorldPacket *data, std::string ChanName);                               //? 0x06
        void MakePasswordChanged(WorldPacket *data, ObjectGuid guid, std::string ChanName);           //+ 0x07
        void MakeOwnerChanged(WorldPacket *data, ObjectGuid guid, std::string ChanName);              //? 0x08
        void MakePlayerNotFound(WorldPacket *data, const std::string& name, std::string ChanName);    //+ 0x09
        void MakeNotOwner(WorldPacket *data, std::string ChanName);                                   //? 0x0A
        void MakeChannelOwner(WorldPacket *data, std::string ChanName);                               //? 0x0B
        void MakeModeChange(WorldPacket *data, ObjectGuid guid, uint8 oldflags, std::string ChanName);//+ 0x0C
        void MakeAnnouncementsOn(WorldPacket *data, ObjectGuid guid, std::string ChanName);           //+ 0x0D
        void MakeAnnouncementsOff(WorldPacket *data, ObjectGuid guid, std::string ChanName);          //+ 0x0E
        void MakeModerationOn(WorldPacket *data, ObjectGuid guid, std::string ChanName);              //+ 0x0F
        void MakeModerationOff(WorldPacket *data, ObjectGuid guid, std::string ChanName);             //+ 0x10
        void MakeMuted(WorldPacket *data, std::string ChanName);                                      //? 0x11
        void MakePlayerKicked(WorldPacket *data, ObjectGuid bad, ObjectGuid good, std::string ChanName);//? 0x12
        void MakeBanned(WorldPacket *data, std::string ChanName);                                     //? 0x13
        void MakePlayerBanned(WorldPacket *data, ObjectGuid bad, ObjectGuid good, std::string ChanName);//? 0x14
        void MakePlayerUnbanned(WorldPacket *data, ObjectGuid bad, ObjectGuid good, std::string ChanName);//? 0x15
        void MakePlayerNotBanned(WorldPacket *data, ObjectGuid guid, std::string ChanName);           //? 0x16
        void MakePlayerAlreadyMember(WorldPacket *data, ObjectGuid guid, std::string ChanName);       //+ 0x17
        void MakeInvite(WorldPacket *data, ObjectGuid guid, std::string ChanName);                    //? 0x18
        void MakeInviteWrongFaction(WorldPacket *data, std::string ChanName);                         //? 0x19
        void MakeWrongFaction(WorldPacket *data, std::string ChanName);                               //? 0x1A
        void MakeInvalidName(WorldPacket *data, std::string ChanName);                                //? 0x1B
        void MakeNotModerated(WorldPacket *data, std::string ChanName);                               //? 0x1C
        void MakePlayerInvited(WorldPacket *data, const std::string& name, std::string ChanName);     //+ 0x1D
        void MakePlayerInviteBanned(WorldPacket *data, ObjectGuid guid, std::string ChanName);        //? 0x1E
        void MakeThrottled(WorldPacket *data, std::string ChanName);                                  //? 0x1F

        void SendToAll(WorldPacket *data, ObjectGuid p = ObjectGuid());
        void SendToOne(WorldPacket *data, ObjectGuid who);

        bool IsOn(ObjectGuid who) const { return m_players.find(who) != m_players.end(); }
        bool IsBanned(ObjectGuid guid) const { return m_banned.find(guid) != m_banned.end(); }

        uint8 GetPlayerFlags(ObjectGuid p) const
        {
            PlayerList::const_iterator p_itr = m_players.find(p);
            if (p_itr == m_players.end())
                return 0;

            return p_itr->second.flags;
        }

        void SetModerator(ObjectGuid p, bool set, const char* chanName)
        {
            if (m_players[p].IsModerator() != set)
            {
                uint8 oldFlag = GetPlayerFlags(p);
                m_players[p].SetModerator(set);

                WorldPacket data;
                MakeModeChange(&data, p, oldFlag, chanName);
                SendToAll(&data);
            }
        }

        void SetMute(ObjectGuid p, bool set, const char* chanName)
        {
            if (m_players[p].IsMuted() != set)
            {
                uint8 oldFlag = GetPlayerFlags(p);
                m_players[p].SetMuted(set);

                WorldPacket data;
                MakeModeChange(&data, p, oldFlag, chanName);
                SendToAll(&data);
            }
        }

    private:
        bool        m_area_dependant; // Handled in Node side
        PlayerPointer GetPlayer(ObjectGuid guid);
        PlayerPointer GetPlayer(const char* name);
        bool        m_announce;
        bool        m_moderate;
        bool        m_levelRestricted;
        std::string m_name;
        std::string m_password;
        uint8       m_flags;
        uint8       m_securityLevel;
        uint32      m_channelId;
        ObjectGuid  m_ownerGuid;

        std::string *m_localized_names;

        typedef     std::map<ObjectGuid, PlayerInfo> PlayerList;
        PlayerList  m_players;
        typedef     std::set<ObjectGuid> BannedList;
        BannedList  m_banned;
};
#endif
