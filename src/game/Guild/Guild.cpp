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

#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Player.h"
#include "Opcodes.h"
#include "ObjectMgr.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "Chat.h"
#include "SocialMgr.h"
#include "Util.h"
#include "Language.h"
#include "World.h"
#include "Anticheat.h"

//// MemberSlot ////////////////////////////////////////////
void MemberSlot::SetMemberStats(Player* player)
{
    Name   = player->GetName();
    Level  = player->GetLevel();
    Class  = player->GetClass();
    ZoneId = player->GetCachedZoneId();
}

void MemberSlot::UpdateLogoutTime()
{
    LogoutTime = time(nullptr);
}

void MemberSlot::SetPNOTE(std::string pnote)
{
    Pnote = pnote;

    // pnote now can be used for encoding to DB
    CharacterDatabase.escape_string(pnote);
    CharacterDatabase.PExecute("UPDATE `guild_member` SET `player_note` = '%s' WHERE `guid` = '%u'", pnote.c_str(), guid.GetCounter());
}

void MemberSlot::SetOFFNOTE(std::string offnote)
{
    OFFnote = offnote;

    // offnote now can be used for encoding to DB
    CharacterDatabase.escape_string(offnote);
    CharacterDatabase.PExecute("UPDATE `guild_member` SET `officer_note` = '%s' WHERE `guid` = '%u'", offnote.c_str(), guid.GetCounter());
}

void MemberSlot::ChangeRank(uint32 newRank)
{
    RankId = newRank;

    Player* player = sObjectMgr.GetPlayer(guid);
    // If player not online data in data field will be loaded from guild tabs no need to update it !!
    if (player)
        player->SetRank(newRank);

    CharacterDatabase.PExecute("UPDATE `guild_member` SET `rank`='%u' WHERE `guid`='%u'", newRank, guid.GetCounter());
}

//// Guild /////////////////////////////////////////////////

Guild::Guild() : m_Name(), MOTD(), GINFO()
{
    m_Id = 0;
    m_EmblemStyle = -1;
    m_EmblemColor = -1;
    m_BorderStyle = -1;
    m_BorderColor = -1;
    m_BackgroundColor = -1;
    m_accountsNumber = 0;

    m_CreatedYear = 0;
    m_CreatedMonth = 0;
    m_CreatedDay = 0;

    m_GuildEventLogNextGuid = 0;
}

Guild::~Guild()
{
}

bool Guild::Create(Petition* petition, Player* leader)
{
    if (!Create(leader, petition->GetName()))
        return false;

    PetitionSignatureList signatures = petition->GetSignatureList();
    for (const auto signature : signatures)
    {
        if (signature->GetSignatureGuid().IsEmpty())
            continue;

        AddMember(signature->GetSignatureGuid(), GetLowestRank(), petition->GetId());
    }

    return true;
}

bool Guild::Create(Player* leader, std::string gname)
{
    if (sGuildMgr.GetGuildByName(gname))
        return false;

    WorldSession* lSession = leader->GetSession();
    if (!lSession)
        return false;

    // Check guild name (use whisper type - 6)
    if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
    {
        if (a->filterMessage(gname))
        {
            sWorld.LogChat(lSession, "Guild", "Attempt to create guild with spam name");
            return false;
        }
    }

    m_LeaderGuid = leader->GetObjectGuid();
    m_Name = gname;
    GINFO.clear();
    MOTD = "No message set.";
    m_Id = sObjectMgr.GenerateGuildId();

    // creating data
    time_t now = time(0);
    tm local = *(localtime(&now));                          // dereference and assign
    m_CreatedDay   = local.tm_mday;
    m_CreatedMonth = local.tm_mon + 1;
    m_CreatedYear  = local.tm_year + 1900;

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "GUILD: creating guild %s to leader: %s", gname.c_str(), m_LeaderGuid.GetString().c_str());

    // gname already assigned to Guild::name, use it to encode string for DB
    CharacterDatabase.escape_string(gname);

    std::string dbGINFO = GINFO;
    std::string dbMOTD = MOTD;
    CharacterDatabase.escape_string(dbGINFO);
    CharacterDatabase.escape_string(dbMOTD);

    CharacterDatabase.BeginTransaction();
    // CharacterDatabase.PExecute("DELETE FROM guild WHERE guild_id='%u'", Id); - MAX(guild_id)+1 not exist
    CharacterDatabase.PExecute("DELETE FROM `guild_member` WHERE `guild_id`='%u'", m_Id);
    CharacterDatabase.PExecute("INSERT INTO `guild` (`guild_id`, `name`, `leader_guid`, `info`, `motd`, `create_date`, `emblem_style`, `emblem_color`, `border_style`, `border_color`, `background_color`) "
                               "VALUES('%u','%s','%u', '%s', '%s','" UI64FMTD "','%i','%i','%i','%i','%i')",
                               m_Id, gname.c_str(), m_LeaderGuid.GetCounter(), dbGINFO.c_str(), dbMOTD.c_str(), uint64(now), m_EmblemStyle, m_EmblemColor, m_BorderStyle, m_BorderColor, m_BackgroundColor);
    CharacterDatabase.CommitTransaction();

    CreateDefaultGuildRanks(lSession->GetSessionDbLocaleIndex());

    return AddMember(m_LeaderGuid, (uint32)GR_GUILDMASTER) == GuildAddStatus::OK;
}

void Guild::CreateDefaultGuildRanks(int locale_idx)
{
    CharacterDatabase.PExecute("DELETE FROM `guild_rank` WHERE `guild_id`='%u'", m_Id);

    CreateRank(sObjectMgr.GetMangosString(LANG_GUILD_MASTER, locale_idx),   GR_RIGHT_ALL);
    CreateRank(sObjectMgr.GetMangosString(LANG_GUILD_OFFICER, locale_idx),  GR_RIGHT_ALL);
    CreateRank(sObjectMgr.GetMangosString(LANG_GUILD_VETERAN, locale_idx),  GR_RIGHT_GCHATLISTEN | GR_RIGHT_GCHATSPEAK);
    CreateRank(sObjectMgr.GetMangosString(LANG_GUILD_MEMBER, locale_idx),   GR_RIGHT_GCHATLISTEN | GR_RIGHT_GCHATSPEAK);
    CreateRank(sObjectMgr.GetMangosString(LANG_GUILD_INITIATE, locale_idx), GR_RIGHT_GCHATLISTEN | GR_RIGHT_GCHATSPEAK);
}

void Guild::Rename(std::string& newName)
{
    m_Name = newName;

    std::string escaped = m_Name;
    CharacterDatabase.escape_string(escaped);

    CharacterDatabase.PExecute("UPDATE `guild` SET `name` = '%s' WHERE `guild_id` = '%u'", escaped.c_str(), m_Id);
}

GuildAddStatus Guild::AddMember(ObjectGuid plGuid, uint32 plRank, uint32 petitionId)
{
    Player* pl = sObjectAccessor.FindPlayerNotInWorld(plGuid);
    if (pl)
    {
        if (pl->GetGuildId() != 0)
            return GuildAddStatus::ALREADY_IN_GUILD;
    }
    else
    {
        if (members.find(plGuid) != members.end())
            return GuildAddStatus::ALREADY_IN_GUILD;
    }

    // remove all player signs from another petitions
    // this will be prevent attempt joining player to many guilds and corrupt guild data integrity
    Player::RemovePetitionsAndSigns(plGuid, petitionId);

    uint32 lowguid = plGuid.GetCounter();

    // fill player data
    MemberSlot newmember;

    newmember.guid = plGuid;

    if (pl)
    {
        newmember.accountId = pl->GetSession()->GetAccountId();
        newmember.Name   = pl->GetName();
        newmember.Level  = pl->GetLevel();
        newmember.Class  = pl->GetClass();
        newmember.ZoneId = pl->GetCachedZoneId();
    }
    else
    {
        PlayerCacheData const* data = sObjectMgr.GetPlayerDataByGUID(lowguid);
        if (!data)
            return GuildAddStatus::UNKNOWN_PLAYER;
        if (data->sName.empty())
            return GuildAddStatus::UNKNOWN_PLAYER;

        newmember.Name   = data->sName;
        newmember.Level  = data->uiLevel;
        newmember.Class  = data->uiClass;
        newmember.ZoneId = data->uiZoneId;
        newmember.accountId = data->uiAccount;

        if (newmember.Level < 1 || newmember.Level > PLAYER_STRONG_MAX_LEVEL ||
          !((1 << (newmember.Class - 1)) & CLASSMASK_ALL_PLAYABLE))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s has a broken data in field `characters` table, cannot add him to guild.", plGuid.GetString().c_str());
            return GuildAddStatus::PLAYER_DATA_ERROR;
        }
    }

    newmember.RankId  = plRank;
    newmember.OFFnote = (std::string)"";
    newmember.Pnote   = (std::string)"";
    newmember.LogoutTime = time(nullptr);
    members[lowguid] = newmember;
    sGuildMgr.GuildMemberAdded(GetId(), lowguid);

    std::string dbPnote   = newmember.Pnote;
    std::string dbOFFnote = newmember.OFFnote;
    CharacterDatabase.escape_string(dbPnote);
    CharacterDatabase.escape_string(dbOFFnote);

    CharacterDatabase.PExecute("INSERT INTO `guild_member` (`guild_id`, `guid`, `rank`, `player_note`, `officer_note`) VALUES ('%u', '%u', '%u','%s','%s')",
                               m_Id, lowguid, newmember.RankId, dbPnote.c_str(), dbOFFnote.c_str());

    // If player not in game data in data field will be loaded from guild tables, no need to update it!!
    if (pl)
    {
        pl->SetInGuild(m_Id);
        pl->SetRank(newmember.RankId);
        pl->SetGuildIdInvited(0);
    }

    UpdateAccountsNumber();

    return GuildAddStatus::OK;
}

void Guild::SetMOTD(std::string motd)
{
    MOTD = motd;

    // motd now can be used for encoding to DB
    CharacterDatabase.escape_string(motd);
    CharacterDatabase.PExecute("UPDATE `guild` SET `motd`='%s' WHERE `guild_id`='%u'", motd.c_str(), m_Id);
}

void Guild::SetGINFO(std::string ginfo)
{
    GINFO = ginfo;

    // ginfo now can be used for encoding to DB
    CharacterDatabase.escape_string(ginfo);
    CharacterDatabase.PExecute("UPDATE `guild` SET `info`='%s' WHERE `guild_id`='%u'", ginfo.c_str(), m_Id);
}

bool Guild::LoadGuildFromDB(const std::unique_ptr<QueryResult>& guildDataResult)
{
    if (!guildDataResult)
        return false;

    Field* fields = guildDataResult->Fetch();

    m_Id              = fields[0].GetUInt32();
    m_Name            = fields[1].GetCppString();
    m_LeaderGuid      = ObjectGuid(HIGHGUID_PLAYER, fields[2].GetUInt32());
    m_EmblemStyle     = fields[3].GetInt32();
    m_EmblemColor     = fields[4].GetInt32();
    m_BorderStyle     = fields[5].GetInt32();
    m_BorderColor     = fields[6].GetInt32();
    m_BackgroundColor = fields[7].GetInt32();
    GINFO             = fields[8].GetCppString();
    MOTD              = fields[9].GetCppString();
    time_t time       = fields[10].GetUInt64();

    if (time > 0)
    {
        tm local       = *(localtime(&time));               // dereference and assign
        m_CreatedDay   = local.tm_mday;
        m_CreatedMonth = local.tm_mon + 1;
        m_CreatedYear  = local.tm_year + 1900;
    }

    return true;
}

bool Guild::CheckGuildStructure()
{
    // Repair the structure of guild
    // If the guildmaster doesn't exist or isn't the member of guild
    // attempt to promote another member
    int32 GM_rights = GetRank(m_LeaderGuid);
    if (GM_rights == -1)
    {
        if (DelMember(m_LeaderGuid))
            return false;                                   // guild will disbanded and deleted in caller
    }
    else if (GM_rights != GR_GUILDMASTER)
        SetLeader(m_LeaderGuid);

    // Allow only 1 guildmaster, set other to officer
    for (auto& itr : members)
    {
        MemberSlot& member = itr.second;
        if (member.RankId == GR_GUILDMASTER && m_LeaderGuid != member.guid)
            member.ChangeRank(GR_OFFICER);
    }

    return true;
}

bool Guild::LoadRanksFromDB(const std::unique_ptr<QueryResult>& guildRanksResult)
{
    if (!guildRanksResult)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Guild %u has broken `guild_rank` data, creating new...", m_Id);
        CreateDefaultGuildRanks(0);
        return true;
    }

    Field* fields;
    bool broken_ranks = false;

    // GUILD RANKS are sequence starting from 0 = GUILD_MASTER (ALL PRIVILEGES) to max 9 (lowest privileges)
    // the lower rank id is considered higher rank - so promotion does rank-- and demotion does rank++
    // between ranks in sequence cannot be gaps - so 0,1,2,4 cannot be
    // min ranks count is 5 and max is 10.

    do
    {
        fields = guildRanksResult->Fetch();
        //condition that would be true when all ranks in QueryResult will be processed and guild without ranks is being processed
        if (!fields)
            break;

        uint32 guildId       = fields[0].GetUInt32();
        if (guildId < m_Id)
        {
            //there is in table guild_rank record which doesn't have guild_id in guild table, report error
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Guild %u does not exist but it has a record in guild_rank table, deleting it!", guildId);
            CharacterDatabase.PExecute("DELETE FROM `guild_rank` WHERE `guild_id` = '%u'", guildId);
            continue;
        }

        if (guildId > m_Id)                                 //we loaded all ranks for this guild already, break cycle
            break;

        uint32 rankID        = fields[1].GetUInt32();
        std::string rankName = fields[2].GetCppString();
        uint32 rankRights    = fields[3].GetUInt32();

        if (rankID != m_Ranks.size())                       // guild_rank.ids are sequence 0,1,2,3..
            broken_ranks =  true;

        // first rank is guildmaster, prevent loss leader rights
        if (m_Ranks.empty())
            rankRights |= GR_RIGHT_ALL;

        AddRank(rankName, rankRights);
    }
    while (guildRanksResult->NextRow());

    if (m_Ranks.size() < GUILD_RANKS_MIN_COUNT)             // if too few ranks, renew them
    {
        m_Ranks.clear();
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Guild %u has broken `guild_rank` data, creating new...", m_Id);
        CreateDefaultGuildRanks(0);                         // 0 is default locale_idx
        broken_ranks = false;
    }
    // guild_rank have wrong numbered ranks, repair
    if (broken_ranks)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Guild %u has broken `guild_rank` data, repairing...", m_Id);
        CharacterDatabase.BeginTransaction();
        CharacterDatabase.PExecute("DELETE FROM `guild_rank` WHERE `guild_id`='%u'", m_Id);
        for (size_t i = 0; i < m_Ranks.size(); ++i)
        {
            std::string name = m_Ranks[i].Name;
            uint32 rights = m_Ranks[i].Rights;
            CharacterDatabase.escape_string(name);
            CharacterDatabase.PExecute("INSERT INTO `guild_rank` (`guild_id`, `id`, `name`, `rights`) VALUES ('%u', '%u', '%s', '%u')", m_Id, uint32(i), name.c_str(), rights);
        }
        CharacterDatabase.CommitTransaction();
    }

    return true;
}

bool Guild::LoadMembersFromDB(const std::unique_ptr<QueryResult>& guildMembersResult)
{
    if (!guildMembersResult)
        return false;

    do
    {
        Field* fields = guildMembersResult->Fetch();
        // this condition will be true when all rows in QueryResult are processed and new guild without members is going to be loaded - prevent crash
        if (!fields)
            break;
        uint32 guildId       = fields[0].GetUInt32();
        if (guildId < m_Id)
        {
            // there is in table guild_member record which doesn't have guild_id in guild table, report error
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Guild %u does not exist but it has a record in guild_member table, deleting it!", guildId);
            CharacterDatabase.PExecute("DELETE FROM `guild_member` WHERE `guild_id` = '%u'", guildId);
            continue;
        }

        if (guildId > m_Id)
            // we loaded all members for this guild already, break cycle
            break;

        MemberSlot newmember;
        uint32 lowguid = fields[1].GetUInt32();
        newmember.guid = ObjectGuid(HIGHGUID_PLAYER, lowguid);
        newmember.RankId = fields[2].GetUInt32();
        // don't allow member to have not existing rank!
        if (newmember.RankId >= m_Ranks.size())
            newmember.RankId = GetLowestRank();

        newmember.Pnote                 = fields[3].GetCppString();
        newmember.OFFnote               = fields[4].GetCppString();

        newmember.Name                  = fields[5].GetCppString();
        newmember.Level                 = fields[6].GetUInt8();
        newmember.Class                 = fields[7].GetUInt8();
        newmember.ZoneId                = fields[8].GetUInt32();
        newmember.LogoutTime            = fields[9].GetUInt64();
        newmember.accountId             = fields[10].GetInt32();

        // this code will remove not existing character guids from guild
        if (newmember.Level < 1 || newmember.Level > PLAYER_STRONG_MAX_LEVEL) // can be at broken `data` field
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s has a broken data in field `characters`.`data`, deleting him from guild!", newmember.guid.GetString().c_str());
            CharacterDatabase.PExecute("DELETE FROM `guild_member` WHERE `guid` = '%u'", lowguid);
            continue;
        }
        if (!newmember.ZoneId)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s has broken zone-data", newmember.guid.GetString().c_str());
            // here it will also try the same, to get the zone from characters-table, but additional it tries to find
            // the zone through xy coords .. this is a bit redundant, but shouldn't be called often
            newmember.ZoneId = Player::GetZoneIdFromDB(newmember.guid);
        }
        if (!((1 << (newmember.Class - 1)) & CLASSMASK_ALL_PLAYABLE)) // can be at broken `class` field
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s has a broken data in field `characters`.`class`, deleting him from guild!", newmember.guid.GetString().c_str());
            CharacterDatabase.PExecute("DELETE FROM `guild_member` WHERE `guid` = '%u'", lowguid);
            continue;
        }
        if (newmember.Name.empty()) // no deleted characters
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s has no name, deleting him from guild!", newmember.guid.GetString().c_str());
            CharacterDatabase.PExecute("DELETE FROM `guild_member` WHERE `guid` = '%u'", lowguid);
            continue;
        }

        members[lowguid]      = newmember;
        sGuildMgr.GuildMemberAdded(GetId(), lowguid);

    }
    while (guildMembersResult->NextRow());

    if (members.empty())
        return false;

    UpdateAccountsNumber();

    return true;
}

void Guild::SetLeader(ObjectGuid guid)
{
    MemberSlot* slot = GetMemberSlot(guid);
    if (!slot)
        return;

    m_LeaderGuid = guid;
    slot->ChangeRank(GR_GUILDMASTER);

    CharacterDatabase.PExecute("UPDATE `guild` SET `leader_guid`='%u' WHERE `guild_id`='%u'", guid.GetCounter(), m_Id);
}

/**
 * Remove character from guild
 *
 * @param guid          Character that removed from guild
 * @param isDisbanding  Flag set if function called from Guild::Disband, so not need update DB in per-member mode only or leader update
 *
 * @return true, if guild need to be disband and erase (no members or can't setup leader)
 */
bool Guild::DelMember(ObjectGuid guid, bool isDisbanding)
{
    uint32 lowguid = guid.GetCounter();

    // guild master can be deleted when loading guild and guid doesn't exist in characters table
    // or when he is removed from guild by gm command
    if (m_LeaderGuid == guid && !isDisbanding)
    {
        MemberSlot* oldLeader = nullptr;
        MemberSlot* best = nullptr;
        ObjectGuid newLeaderGUID;
        for (auto& member : members)
        {
            if (member.first == lowguid)
            {
                oldLeader = &(member.second);
                continue;
            }

            if (!best || best->RankId > member.second.RankId)
            {
                best = &(member.second);
                newLeaderGUID = ObjectGuid(HIGHGUID_PLAYER, member.first);
            }
        }

        if (!best)
            return true;

        SetLeader(newLeaderGUID);

        // If player not online data in data field will be loaded from guild tabs no need to update it !!
        if (Player* newLeader = sObjectMgr.GetPlayer(newLeaderGUID))
            newLeader->SetRank(GR_GUILDMASTER);

        // when leader non-exist (at guild load with deleted leader only) not send broadcasts
        if (oldLeader)
        {
            BroadcastEvent(GE_LEADER_CHANGED, oldLeader->Name.c_str(), best->Name.c_str());
            BroadcastEvent(GE_LEFT, guid, oldLeader->Name.c_str());
        }
    }

    members.erase(lowguid);
    sGuildMgr.GuildMemberRemoved(lowguid);

    Player* player = sObjectMgr.GetPlayer(guid);
    // If player not online data in data field will be loaded from guild tabs no need to update it !!
    if (player)
    {
        player->SetInGuild(0);
        player->SetRank(0);
    }

    CharacterDatabase.PExecute("DELETE FROM `guild_member` WHERE `guid` = '%u'", lowguid);

    if (!isDisbanding)
        UpdateAccountsNumber();

    return members.empty();
}

void Guild::BroadcastToGuild(WorldSession* session, char const* msg, uint32 language)
{
    if (!session)
        return;

    MasterPlayer* pPlayer = session->GetMasterPlayer();
    if (!pPlayer || !HasRankRight(pPlayer->GetRank(), GR_RIGHT_GCHATSPEAK))
        return;

    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_GUILD, msg, Language(language), pPlayer->GetChatTag(), pPlayer->GetObjectGuid(), pPlayer->GetName());

    for (const auto& member : members)
    {
        if (!HasRankRight(member.second.RankId, GR_RIGHT_GCHATLISTEN))
            continue;

        MasterPlayer* pl = ObjectAccessor::FindMasterPlayer(ObjectGuid(HIGHGUID_PLAYER, member.first));

        if (pl && pl->GetSession() && !pl->GetSocial()->HasIgnore(session->GetMasterPlayer()->GetObjectGuid()))
            pl->GetSession()->SendPacket(&data);
    }
}

void Guild::BroadcastToOfficers(WorldSession* session, char const* msg, uint32 language)
{
    if (!session)
        return;

    MasterPlayer* pPlayer = session->GetMasterPlayer();
    if (!pPlayer || !HasRankRight(pPlayer->GetRank(), GR_RIGHT_OFFCHATSPEAK))
        return;

    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_OFFICER, msg, Language(language), pPlayer->GetChatTag(), pPlayer->GetObjectGuid(), pPlayer->GetName());

    for (const auto& member : members)
    {
        if (!HasRankRight(member.second.RankId, GR_RIGHT_OFFCHATLISTEN))
            continue;

        MasterPlayer* pl = ObjectAccessor::FindMasterPlayer(ObjectGuid(HIGHGUID_PLAYER, member.first));

        if (pl && pl->GetSession() && !pl->GetSocial()->HasIgnore(session->GetMasterPlayer()->GetObjectGuid()))
            pl->GetSession()->SendPacket(&data);
    }
}

void Guild::BroadcastPacket(WorldPacket* packet)
{
    for (const auto& member : members)
    {
        Player* player = ObjectAccessor::FindPlayer(ObjectGuid(HIGHGUID_PLAYER, member.first));
        if (player)
            player->GetSession()->SendPacket(packet);
    }
}

void Guild::BroadcastPacketToRank(WorldPacket* packet, uint32 rankId)
{
    for (const auto& member : members)
    {
        if (member.second.RankId == rankId)
        {
            Player* player = ObjectAccessor::FindPlayer(ObjectGuid(HIGHGUID_PLAYER, member.first));
            if (player)
                player->GetSession()->SendPacket(packet);
        }
    }
}

void Guild::CreateRank(std::string name_, uint32 rights)
{
    if (m_Ranks.size() >= GUILD_RANKS_MAX_COUNT)
        return;

    // ranks are sequence 0,1,2,... where 0 means guildmaster
    uint32 new_rank_id = m_Ranks.size();

    AddRank(name_, rights);

    // name now can be used for encoding to DB
    CharacterDatabase.escape_string(name_);
    CharacterDatabase.PExecute("INSERT INTO `guild_rank` (`guild_id`, `id`, `name`, `rights`) VALUES ('%u', '%u', '%s', '%u')", m_Id, new_rank_id, name_.c_str(), rights);
}

void Guild::AddRank(std::string const& name_, uint32 rights)
{
    m_Ranks.push_back(RankInfo(name_, rights));
}

void Guild::DelRank()
{
    // client won't allow to have less than GUILD_RANKS_MIN_COUNT ranks in guild
    if (m_Ranks.size() <= GUILD_RANKS_MIN_COUNT)
        return;

    // delete lowest guild_rank
    uint32 rank = GetLowestRank();
    CharacterDatabase.PExecute("DELETE FROM `guild_rank` WHERE `id`>='%u' AND `guild_id`='%u'", rank, m_Id);

    m_Ranks.pop_back();
}

std::string Guild::GetRankName(uint32 rankId)
{
    if (rankId >= m_Ranks.size())
        return "<unknown>";

    return m_Ranks[rankId].Name;
}

uint32 Guild::GetRankRights(uint32 rankId)
{
    if (rankId >= m_Ranks.size())
        return 0;

    return m_Ranks[rankId].Rights;
}

void Guild::SetRankName(uint32 rankId, std::string name_)
{
    if (rankId >= m_Ranks.size())
        return;

    m_Ranks[rankId].Name = name_;

    // name now can be used for encoding to DB
    CharacterDatabase.escape_string(name_);
    CharacterDatabase.PExecute("UPDATE `guild_rank` SET `name`='%s' WHERE `id`='%u' AND `guild_id`='%u'", name_.c_str(), rankId, m_Id);
}

void Guild::SetRankRights(uint32 rankId, uint32 rights)
{
    if (rankId >= m_Ranks.size())
        return;

    m_Ranks[rankId].Rights = rights;

    CharacterDatabase.PExecute("UPDATE `guild_rank` SET `rights`='%u' WHERE `id`='%u' AND `guild_id`='%u'", rights, rankId, m_Id);
}

/**
 * Disband guild including cleanup structures and DB
 *
 * Note: guild object need deleted after this in caller code.
 */
void Guild::Disband()
{
    BroadcastEvent(GE_DISBANDED);

    while (!members.empty())
    {
        MemberList::const_iterator itr = members.begin();
        DelMember(ObjectGuid(HIGHGUID_PLAYER, itr->first), true);
    }

    CharacterDatabase.BeginTransaction();
    CharacterDatabase.PExecute("DELETE FROM `guild` WHERE `guild_id` = '%u'", m_Id);
    CharacterDatabase.PExecute("DELETE FROM `guild_rank` WHERE `guild_id` = '%u'", m_Id);
    CharacterDatabase.PExecute("DELETE FROM `guild_eventlog` WHERE `guild_id` = '%u'", m_Id);
    CharacterDatabase.CommitTransaction();
    sGuildMgr.RemoveGuild(m_Id);
}

void Guild::Roster(WorldSession* session /*= nullptr*/)
{
    // we can only guess size
    WorldPacket data(SMSG_GUILD_ROSTER, (4 + MOTD.length() + 1 + GINFO.length() + 1 + 4 + m_Ranks.size() * 4 + members.size() * 50));
    int32 spaceLeft = GUILD_ROSTER_MAX_LENGTH;

    size_t count_pos = data.wpos();
    data << uint32(0); // members count placeholder
    spaceLeft -= sizeof(uint32);
    data << MOTD;
    spaceLeft -= (MOTD.length() + 1);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << GINFO;
    spaceLeft -= (GINFO.length() + 1);
#endif

    data << uint32(m_Ranks.size());
    spaceLeft -= sizeof(uint32);
    for (const auto& itr : m_Ranks)
        data << uint32(itr.Rights);
    spaceLeft -= (m_Ranks.size() * sizeof(uint32));

    uint32 count = 0;
    for (const auto& itr : members)
    {
        int32 spaceNeeded =
            sizeof(ObjectGuid) +          // player guid
            sizeof(uint8) +               // online indicator
            itr.second.Name.length() +    // name
            1 +                           // null byte for name
            sizeof(uint32) +              // rank id
            sizeof(uint8) +               // level
            sizeof(uint8) +               // class
            sizeof(uint32) +              // zone id
            sizeof(float) +               // last online time
            itr.second.Pnote.length() +   // player note
            1 +                           // null byte for player note
            itr.second.OFFnote.length() + // officer note
            1;                            // null byte for officer note

        spaceLeft -= spaceNeeded;
        if (spaceLeft <= 0)
            break;
        count++;
        
        if (Player* pl = ObjectAccessor::FindPlayer(ObjectGuid(HIGHGUID_PLAYER, itr.first)))
        {
            data << pl->GetObjectGuid();
            data << uint8(1);
            data << itr.second.Name;
            data << uint32(itr.second.RankId);
            data << uint8(pl->GetLevel());
            data << uint8(pl->GetClass());
            data << uint32(pl->GetCachedZoneId());
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
            data << uint8(0);
#endif
            data << itr.second.Pnote;
            data << ((session && HasRankRight(session->GetPlayer()->GetRank(), GR_RIGHT_VIEWOFFNOTE)) ? itr.second.OFFnote : "");
        }
        else
        {
            data << ObjectGuid(HIGHGUID_PLAYER, itr.first);
            data << uint8(0);
            data << itr.second.Name;
            data << uint32(itr.second.RankId);
            data << uint8(itr.second.Level);
            data << uint8(itr.second.Class);
            data << uint32(itr.second.ZoneId);
            data << float(float(time(nullptr) - itr.second.LogoutTime) / DAY);
            data << itr.second.Pnote;
            data << ((session && HasRankRight(session->GetPlayer()->GetRank(), GR_RIGHT_VIEWOFFNOTE)) ? itr.second.OFFnote : "");
        }
    }
    data.put<uint32>(count_pos, count);

    if (session)
        session->SendPacket(&data);
    else
        BroadcastPacket(&data);
}

void Guild::Query(WorldSession* session)
{
    WorldPacket data(SMSG_GUILD_QUERY_RESPONSE, (4 + 48 + 10 * 32 + 5 * 4)); // guess size; max: name(96), rankname(64)

    data << uint32(m_Id);
    data << m_Name;

    for (size_t i = 0 ; i < GUILD_RANKS_MAX_COUNT; ++i)     // show always 10 ranks
    {
        if (i < m_Ranks.size())
            data << m_Ranks[i].Name;
        else
            data << uint8(0);                               // null string
    }

    data << int32(m_EmblemStyle);
    data << int32(m_EmblemColor);
    data << int32(m_BorderStyle);
    data << int32(m_BorderColor);
    data << int32(m_BackgroundColor);

    session->SendPacket(&data);
}

void Guild::SetEmblem(int32 emblemStyle, int32 emblemColor, int32 borderStyle, int32 borderColor, int32 backgroundColor)
{
    m_EmblemStyle = emblemStyle;
    m_EmblemColor = emblemColor;
    m_BorderStyle = borderStyle;
    m_BorderColor = borderColor;
    m_BackgroundColor = backgroundColor;

    CharacterDatabase.PExecute("UPDATE `guild` SET `emblem_style`=%i, `emblem_color`=%i, `border_style`=%i, `border_color`=%i, `background_color`=%i WHERE `guild_id` = %u", m_EmblemStyle, m_EmblemColor, m_BorderStyle, m_BorderColor, m_BackgroundColor, m_Id);
}

/**
 * Return the number of accounts that are in the guild after possible update if required
 * A player may have many characters in the guild, but with the same account
 */
uint32 Guild::GetAccountsNumber()
{
    // not need recalculation
    if (m_accountsNumber)
        return m_accountsNumber;

    //We use a set to be sure each element will be unique
    std::set<uint32> accountsIdSet;
    for (const auto& member : members)
        accountsIdSet.insert(member.second.accountId);

    m_accountsNumber = accountsIdSet.size();

    return m_accountsNumber;
}

// *************************************************
// Guild Eventlog part
// *************************************************
// Display guild eventlog
void Guild::DisplayGuildEventLog(WorldSession* session)
{
    // NOSTALRIUS: Inexistant packet.
}

// Load guild eventlog from DB
void Guild::LoadGuildEventLogFromDB()
{
    //                                                      0           1             2               3               4           5
    std::unique_ptr<QueryResult> result = CharacterDatabase.PQuery("SELECT `log_guid`, `event_type`, `player_guid1`, `player_guid2`, `new_rank`, `timestamp` FROM `guild_eventlog` WHERE `guild_id`=%u ORDER BY `timestamp` DESC,`log_guid` DESC LIMIT %u", m_Id, GUILD_EVENTLOG_MAX_RECORDS);
    if (!result)
        return;
    bool isNextLogGuidSet = false;
    //uint32 configCount = sWorld.getConfig(CONFIG_UINT32_GUILD_EVENT_LOG_COUNT);
    // First event in list will be the oldest and the latest event is last event in list
    do
    {
        Field* fields = result->Fetch();
        if (!isNextLogGuidSet)
        {
            m_GuildEventLogNextGuid = fields[0].GetUInt32();
            isNextLogGuidSet = true;
        }
        // Fill entry
        GuildEventLogEntry NewEvent;
        NewEvent.eventType = fields[1].GetUInt8();
        NewEvent.playerGuid1 = fields[2].GetUInt32();
        NewEvent.playerGuid2 = fields[3].GetUInt32();
        NewEvent.newRank = fields[4].GetUInt8();
        NewEvent.timestamp = fields[5].GetUInt64();

        // There can be a problem if more events have same TimeStamp the ORDER can be broken when fields[0].GetUInt32() == configCount, but
        // events with same timestamp can appear when there is lag, and we naively suppose that mangos isn't laggy
        // but if problem appears, player will see set of guild events that have same timestamp in bad order

        // Add entry to list
        m_GuildEventLog.push_front(NewEvent);

    }
    while (result->NextRow());
}

// Add entry to guild eventlog
void Guild::LogGuildEvent(uint8 eventType, ObjectGuid playerGuid1, ObjectGuid playerGuid2, uint8 newRank)
{
    GuildEventLogEntry newEvent;
    // Create event
    newEvent.eventType = eventType;
    newEvent.playerGuid1 = playerGuid1.GetCounter();
    newEvent.playerGuid2 = playerGuid2.GetCounter();
    newEvent.newRank = newRank;
    newEvent.timestamp = time(nullptr);
    // Count new LogGuid
    m_GuildEventLogNextGuid = (m_GuildEventLogNextGuid + 1) % sWorld.getConfig(CONFIG_UINT32_GUILD_EVENT_LOG_COUNT);
    // Check max records limit
    if (m_GuildEventLog.size() >= GUILD_EVENTLOG_MAX_RECORDS)
        m_GuildEventLog.pop_front();
    // Add event to list
    m_GuildEventLog.push_back(newEvent);
    // Save event to DB
    CharacterDatabase.PExecute("REPLACE INTO `guild_eventlog` (`guild_id`, `log_guid`, `event_type`, `player_guid1`, `player_guid2`, `new_rank`, `timestamp`) VALUES ('%u','%u','%u','%u','%u','%u','" UI64FMTD "')",
                               m_Id, m_GuildEventLogNextGuid, uint32(newEvent.eventType), newEvent.playerGuid1, newEvent.playerGuid2, uint32(newEvent.newRank), newEvent.timestamp);
}

ObjectGuid Guild::GetGuildInviter(ObjectGuid playerGuid) const
{
    for (auto const& itr : m_GuildEventLog)
    {
        if (itr.eventType == GUILD_EVENT_LOG_INVITE_PLAYER &&
            itr.playerGuid2 == playerGuid)
            return itr.playerGuid1;
    }
    return ObjectGuid();
}

void Guild::BroadcastEvent(GuildEvents event, ObjectGuid guid, char const* str1 /*=nullptr*/, char const* str2 /*=nullptr*/, char const* str3 /*=nullptr*/)
{
    uint8 strCount = !str1 ? 0 : (!str2 ? 1 : (!str3 ? 2 : 3));

    WorldPacket data(SMSG_GUILD_EVENT, 1 + 1 + 1 * strCount + (guid.IsEmpty() ? 0 : 8));
    data << uint8(event);
    data << uint8(strCount);

    if (str3)
    {
        data << str1;
        data << str2;
        data << str3;
    }
    else if (str2)
    {
        data << str1;
        data << str2;
    }
    else if (str1)
        data << str1;

    if (!guid.IsEmpty())
        data << guid;

    BroadcastPacket(&data);
}
