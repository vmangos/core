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

#include "ChannelMgr.h"
#include "Policies/SingletonImp.h"
#include "World.h"
#include "Util.h"
#include "DBCStores.h"

INSTANTIATE_SINGLETON_1(AllianceChannelMgr);
INSTANTIATE_SINGLETON_1(HordeChannelMgr);

ChannelMgr* channelMgr(Team team)
{
    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
        return &MaNGOS::Singleton<AllianceChannelMgr>::Instance();        // cross-faction

    if (team == ALLIANCE)
        return &MaNGOS::Singleton<AllianceChannelMgr>::Instance();
    if (team == HORDE)
        return &MaNGOS::Singleton<HordeChannelMgr>::Instance();

    return nullptr;
}

ChannelMgr::~ChannelMgr()
{
    for (ChannelMap::iterator itr = channels.begin(); itr != channels.end(); ++itr)
        delete itr->second;

    channels.clear();
}

void ChannelMgr::SetJoinChannel(const std::string &name, PlayerPointer p, const std::string &pass, bool allowAreaDependantChans)
{
    std::wstring wname;
    uint32 zoneid = GetAreaIdByLocalizedName(name);
    std::string transName = TranslateChannel(name, zoneid);
    Utf8toWStr(transName, wname);
    wstrToLower(wname);

    if (channels.find(wname) == channels.end())
    {
        ChatChannelsEntry const* ch = GetChannelEntryFor(transName);
        if (!allowAreaDependantChans && ch && ch->flags & Channel::CHANNEL_DBC_FLAG_ZONE_DEP)
            return;
        LocaleConstant loc = (p == nullptr ? LOCALE_enUS : p->GetSession()->GetSessionDbcLocale());
        Channel *nchan = new Channel(transName, name, loc);
        channels[wname] = nchan;
    }
    if (p && !channels[wname]->IsPlayerOnChannel(p->GetObjectGuid()))
        channels[wname]->Join(p->GetObjectGuid(), name.c_str(), pass.c_str());
}

Channel *ChannelMgr::GetChannel(std::string name, PlayerPointer p, bool pkt)
{
    std::wstring wname;
    uint32 zoneid = GetAreaIdByLocalizedName(name);
    std::string transName = TranslateChannel(name, zoneid);
    Utf8toWStr(transName, wname);
    wstrToLower(wname);

    ChannelMap::const_iterator i = channels.find(wname);

    if (i == channels.end())
    {
        if (pkt)
        {
            WorldPacket data;
            MakeNotOnPacket(&data, name);
            p->GetSession()->SendPacket(&data);
        }

        return nullptr;
    }
    else
        return i->second;
}

void ChannelMgr::LeftChannel(std::string name, PlayerPointer p)
{
    std::wstring wname;
    uint32 zoneid = GetAreaIdByLocalizedName(name);
    if (zoneid == 0 && p)
        zoneid = p->GetCachedZoneId();
    std::string transName = TranslateChannel(name, zoneid);
    Utf8toWStr(transName, wname);
    wstrToLower(wname);

    ChannelMap::const_iterator i = channels.find(wname);

    if (i == channels.end())
        return;

    Channel* channel = i->second;

    if (channel->GetNumPlayers() == 0 && !channel->IsConstant() && !channel->GetSecurityLevel())
    {
        channels.erase(wname);
        delete channel;
    }
}

void ChannelMgr::MakeNotOnPacket(WorldPacket *data, std::string name)
{
    data->Initialize(SMSG_CHANNEL_NOTIFY, (1 + 10)); // we guess size
    (*data) << (uint8)CHAT_NOT_MEMBER_NOTICE << name;
}

std::string ChannelMgr::TranslateChannel(std::string channelName, uint32 zoneId)
{
    ChatChannelsEntry const* ch = GetChannelEntryFor(channelName);

    if (ch)
    {
        std::stringstream sstm;
        switch (ch->ChannelID)
        {
            case CHANNEL_ID_GENERAL:
                sstm << "MGeneral - " << zoneId;
                return sstm.str();
            case CHANNEL_ID_TRADE:
                return "MTrade";
            case CHANNEL_ID_LOCAL_DEFENSE:
                sstm << "MLDefense - " << zoneId;
                return sstm.str();
            case CHANNEL_ID_WORLD_DEFENSE:
                return "MWDefense";
            case CHANNEL_ID_LOOKING_FOR_GROUP:
                return "MLFG";
            case CHANNEL_ID_GUILD_RECRUITMENT:
                return "MGuild";        }
    }
    return channelName;
}


void ChannelMgr::CreateDefaultChannels()
{
    SetJoinChannel("Warden", nullptr, "");
    GetChannel("Warden", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("Anticrash", nullptr, "");
    GetChannel("Anticrash", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("Antiflood", nullptr, "");
    GetChannel("Antiflood", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("ItemsCheck", nullptr, "");
    GetChannel("ItemsCheck", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("GoldDupe", nullptr, "");
    GetChannel("GoldDupe", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("SAC", nullptr, "");
    GetChannel("SAC", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("MailsAC", nullptr, "");
    GetChannel("MailsAC", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("BotsDetector", nullptr, "");
    GetChannel("BotsDetector", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);
    SetJoinChannel("ChatSpam", nullptr, "");
    GetChannel("ChatSpam", nullptr)->SetSecurityLevel(SEC_MODERATOR);
    SetJoinChannel("LowLevelBots", nullptr, "");
    GetChannel("LowLevelBots", nullptr)->SetSecurityLevel(SEC_GAMEMASTER);

    for (ChannelMap::iterator it = channels.begin(); it != channels.end(); ++it)
        it->second->SetAnnounce(false);
}

void ChannelMgr::AnnounceBothFactionsChannel(std::string channelName, ObjectGuid playerGuid, const char* message)
{
    PlayerPointer plr = sObjectAccessor.FindPlayerPointer(playerGuid);
    if (Channel* c = channelMgr(HORDE)->GetChannel(channelName, plr))
        c->Say(playerGuid, message, channelName.c_str(), LANG_UNIVERSAL, true);
    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
        if (Channel* c = channelMgr(ALLIANCE)->GetChannel(channelName, plr))
            c->Say(playerGuid, message, channelName.c_str(), LANG_UNIVERSAL, true);
}
