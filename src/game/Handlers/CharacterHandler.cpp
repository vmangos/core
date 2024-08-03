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
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "SharedDefines.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "World.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "Auth/md5.h"
#include "ObjectAccessor.h"
#include "Group.h"
#include "Database/DatabaseImpl.h"
#include "PlayerDump.h"
#include "SocialMgr.h"
#include "Util.h"
#include "Language.h"
#include "Chat.h"
#include "Anticheat.h"
#include "MasterPlayer.h"
#include "PlayerBroadcaster.h"
#include "PlayerBotMgr.h"
#include "AccountMgr.h"

class LoginQueryHolder : public SqlQueryHolder
{
private:
    uint32 m_accountId;
    ObjectGuid m_guid;
public:
    LoginQueryHolder(uint32 accountId, ObjectGuid guid)
        : SqlQueryHolder(guid.GetCounter()), m_accountId(accountId), m_guid(guid) { }
    ~LoginQueryHolder()
    {
        // Queries should NOT be deleted by user
        DeleteAllResults();
    }
    ObjectGuid GetGuid() const
    {
        return m_guid;
    }
    uint32 GetAccountId() const
    {
        return m_accountId;
    }
    bool Initialize();
};

bool LoginQueryHolder::Initialize()
{
    SetSize(MAX_PLAYER_LOGIN_QUERY);

    bool res = true;

    // NOTE: all fields in `characters` must be read to prevent lost character data at next save in case wrong DB structure.
    // !!! NOTE: including unused `zone`,`online`
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADFROM,            "SELECT `guid`, `account`, `name`, `race`, `class`, `gender`, `level`, `xp`, `money`, `skin`, `face`, `hair_style`, `hair_color`, `facial_hair`, `bank_bag_slots`, `player_flags`, "
                     "`position_x`, `position_y`, `position_z`, `map`, `orientation`, `known_taxi_mask`, `played_time_total`, `played_time_level`, `rest_bonus`, `logout_time`, `is_logout_resting`, `reset_talents_multiplier`, "
                     "`reset_talents_time`, `transport_guid`, `transport_x`, `transport_y`, `transport_z`, `transport_o`, `extra_flags`, `stable_slots`, `at_login_flags`, `zone`, `online`, `death_expire_time`, `current_taxi_path`, "
                     "`honor_rank_points`, `honor_highest_rank`, `honor_standing`, `honor_last_week_hk`, `honor_last_week_cp`, `honor_stored_hk`, `honor_stored_dk`, "
                     "`watched_faction`, `drunk`, `health`, `power1`, `power2`, `power3`, `power4`, `power5`, `explored_zones`, `equipment_cache`, `ammo_id`, `action_bars`, "
                     "`world_phase_mask`, `create_time` FROM `characters` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADGROUP,           "SELECT `group_id` FROM `group_member` WHERE `member_guid` ='%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADBOUNDINSTANCES,  "SELECT `id`, `permanent`, `map`, `reset_time` FROM `character_instance` LEFT JOIN `instance` ON `instance` = `id` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADAURAS,           "SELECT `caster_guid`, `item_guid`, `spell`, `stacks`, `charges`, `base_points0`, `base_points1`, `base_points2`, `periodic_time0`, `periodic_time1`, `periodic_time2`, `max_duration`, `duration`, `effect_index_mask` FROM `character_aura` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSPELLS,          "SELECT `spell`, `active`, `disabled` FROM `character_spell` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADQUESTSTATUS,     "SELECT `quest`, `status`, `rewarded`, `explored`, `timer`, `mob_count1`, `mob_count2`, `mob_count3`, `mob_count4`, `item_count1`, `item_count2`, `item_count3`, `item_count4`, `reward_choice` FROM `character_queststatus` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADHONORCP,         "SELECT `victim_type`, `victim_id`, `cp`, `date`, `type` FROM `character_honor_cp` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADREPUTATION,      "SELECT `faction`, `standing`, `flags` FROM `character_reputation` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADINVENTORY,       "SELECT * FROM (SELECT `creator_guid`, `gift_creator_guid`, `count`, `duration`, `charges`, `flags`, `enchantments`, `random_property_id`, `durability`, `text`, `bag`, `slot`, `item_guid`, `item_instance`.`item_id`, `generated_loot` FROM `character_inventory` JOIN `item_instance` ON `character_inventory`.`item_guid` = `item_instance`.`guid` WHERE `character_inventory`.`guid` = '%u') as t ORDER BY `bag`, `slot`", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADITEMLOOT,        "SELECT `guid`, `item_id`, `amount`, `property` FROM `item_loot` WHERE `owner_guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADACTIONS,         "SELECT `button`, `action`, `type` FROM `character_action` WHERE `guid` = '%u' ORDER BY `button`", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSOCIALLIST,      "SELECT `friend`, `flags` FROM `character_social` WHERE `guid` = '%u' LIMIT 255", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADHOMEBIND,        "SELECT `map`, `zone`, `position_x`, `position_y`, `position_z` FROM `character_homebind` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSPELLCOOLDOWNS,  "SELECT `spell`, `spell_expire_time`, `category`, `category_expire_time`, `item_id` FROM `character_spell_cooldown` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADGUILD,           "SELECT `guild_id`, `rank` FROM `guild_member` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADBGDATA,          "SELECT `instance_id`, `team`, `join_x`, `join_y`, `join_z`, `join_o`, `join_map` FROM `character_battleground_data` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADACCOUNTDATA,     "SELECT `type`, `time`, `data` FROM `character_account_data` WHERE `guid`='%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSKILLS,          "SELECT `skill`, `value`, `max` FROM `character_skills` WHERE `guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADMAILS,           "SELECT `id`, `message_type`, `sender_guid`, `receiver_guid`, `subject`, `item_text_id`, `expire_time`, `deliver_time`, `money`, `cod`, `checked`, `stationery`, `mail_template_id`, `has_items` FROM `mail` WHERE `receiver_guid` = '%u' ORDER BY `id` DESC", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADMAILEDITEMS,     "SELECT `creator_guid`, `gift_creator_guid`, `count`, `duration`, `charges`, `flags`, `enchantments`, `random_property_id`, `durability`, `text`, `mail_id`, `item_guid`, `item_instance`.`item_id`, `generated_loot` FROM `mail_items` JOIN `item_instance` ON `item_guid` = `guid` WHERE `receiver_guid` = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_FORGOTTEN_SKILLS,    "SELECT `skill`, `value` FROM `character_forgotten_skills` WHERE `guid` = '%u'", m_guid.GetCounter());

    return res;
}

// don't call WorldSession directly
// it may get deleted before the query callbacks get executed
// instead pass an account id to this handler
class CharacterHandler
{
public:
    void HandleCharEnumCallback(std::unique_ptr<QueryResult> result, uint32 account)
    {
        WorldSession* session = sWorld.FindSession(account);
        if (!session)
        {
            return;
        }
        session->HandleCharEnum(std::move(result));
    }
    void HandlePlayerLoginCallback(std::unique_ptr<QueryResult> /*dummy*/, SqlQueryHolder* holder)
    {
        if (!holder)
            return;

        WorldSession* session = sWorld.FindSession(((LoginQueryHolder*)holder)->GetAccountId());
        if (!session)
        {
            delete holder;
            return;
        }
        session->HandlePlayerLogin((LoginQueryHolder*)holder);
    }
} chrHandler;

void WorldSession::HandleCharEnum(std::unique_ptr<QueryResult> result)
{
    WorldPacket data(SMSG_CHAR_ENUM, 100);                  // we guess size

    uint8 num = 0;
    data << num;

    if (result)
    {
        do
        {
            uint32 guidlow = (*result)[0].GetUInt32();
            uint32 level   = (*result)[10].GetUInt32();
            if (m_characterMaxLevel < level)
                m_characterMaxLevel = level;

            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Build enum data for char guid %u from account %u.", guidlow, GetAccountId());
            if (Player::BuildEnumData(result, &data))
                ++num;
        }
        while (result->NextRow());
    }
    
    data.put<uint8>(0, num);
    m_charactersCount = num;

    SendPacket(&data);
}

void WorldSession::HandleCharEnumOpcode(WorldPacket& /*recv_data*/)
{
    // get all the data necessary for loading all characters (along with their pets) on the account
    CharacterDatabase.AsyncPQuery(&chrHandler, &CharacterHandler::HandleCharEnumCallback, GetAccountId(),
                                  //           0                    1                    2                    3                     4                      5                    6                    7                          8                          9                           10
                                  "SELECT `characters`.`guid`, `characters`.`name`, `characters`.`race`, `characters`.`class`, `characters`.`gender`, `characters`.`skin`, `characters`.`face`, `characters`.`hair_style`, `characters`.`hair_color`, `characters`.`facial_hair`, `characters`.`level`, "
                                  //    11                   12                  13                         14                         15                         16                         17
                                  "`characters`.`zone`, `characters`.`map`, `characters`.`position_x`, `characters`.`position_y`, `characters`.`position_z`, `guild_member`.`guild_id`, `characters`.`player_flags`, "
                                  //    18                             19                       20                            21                       22
                                  "`characters`.`at_login_flags`, `character_pet`.`entry`, `character_pet`.`display_id`, `character_pet`.`level`, `characters`.`equipment_cache` "
                                  "FROM `characters` LEFT JOIN `character_pet` ON `characters`.`guid`=`character_pet`.`owner_guid` AND `character_pet`.`slot`='%u' "
                                  "LEFT JOIN `guild_member` ON `characters`.`guid` = `guild_member`.`guid` "
                                  "WHERE `characters`.`account` = '%u' ORDER BY `characters`.`guid` "
                                  "LIMIT 0,10",
                                  PET_SAVE_AS_CURRENT, GetAccountId());
}

void WorldSession::HandleCharCreateOpcode(WorldPacket& recv_data)
{
    std::string name;
    uint8 race_, class_;

    recv_data >> name;

    recv_data >> race_;
    recv_data >> class_;

    // extract other data required for player creating
    uint8 gender, skin, face, hairStyle, hairColor, facialHair, outfitId;
    recv_data >> gender >> skin >> face;
    recv_data >> hairStyle >> hairColor >> facialHair >> outfitId;

    WorldPacket data(SMSG_CHAR_CREATE, 1);                  // returned with diff.values in all cases

    if (GetSecurity() == SEC_PLAYER)
    {
        if (uint32 mask = sWorld.getConfig(CONFIG_UINT32_CHARACTERS_CREATING_DISABLED))
        {
            bool disabled = false;

            Team team = Player::TeamForRace(race_);
            switch (team)
            {
                case ALLIANCE:
                    disabled = mask & (1 << 0);
                    break;
                case HORDE:
                    disabled = mask & (1 << 1);
                    break;
            }

            if (disabled)
            {
                data << (uint8)CHAR_CREATE_DISABLED;
                SendPacket(&data);
                return;
            }
        }
    }

    ChrClassesEntry const* classEntry = sChrClassesStore.LookupEntry(class_);
    ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(race_);

    if (!classEntry || !raceEntry)
    {
        data << (uint8)CHAR_CREATE_FAILED;
        SendPacket(&data);
        std::stringstream oss;
        oss << "Attempt to create character of invalid Class (" << int(class_) << ") or Race (" << int(race_) << ")";
        ProcessAnticheatAction("PassiveAnticheat", oss.str().c_str(), CHEAT_ACTION_LOG);
        return;
    }

    if (raceEntry->HasFlag(CHRRACES_FLAGS_NOT_PLAYABLE))
    {
        data << (uint8)CHAR_CREATE_DISABLED;
        SendPacket(&data);
        std::stringstream oss;
        oss << "Attempt to create character of non-playable Race (" << int(race_) << ")";
        ProcessAnticheatAction("PassiveAnticheat", oss.str().c_str(), CHEAT_ACTION_LOG);
        return;
    }

    if (!Player::ValidateAppearance(race_, class_, gender, hairStyle, hairColor, face, facialHair, skin, true))
    {
        data << (uint8)CHAR_CREATE_FAILED;
        SendPacket(&data);
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to create character with invalid appearance attributes", CHEAT_ACTION_LOG);
        return;
    }

    // prevent character creating with invalid name
    if (!normalizePlayerName(name))
    {
        data << (uint8)CHAR_NAME_NO_NAME;
        SendPacket(&data);
        ProcessAnticheatAction("PassiveAnticheat", "Attempt to create character with invalid name", CHEAT_ACTION_LOG);
        return;
    }

    // check name limitations
    uint8 res = ObjectMgr::CheckPlayerName(name, true);
    if (res != CHAR_NAME_SUCCESS)
    {
        data << uint8(res);
        SendPacket(&data);
        return;
    }

    if (GetSecurity() == SEC_PLAYER && sObjectMgr.IsReservedName(name))
    {
        data << (uint8)CHAR_NAME_RESERVED;
        SendPacket(&data);
        return;
    }

    if (sObjectMgr.GetPlayerGuidByName(name))
    {
        data << (uint8)CHAR_CREATE_NAME_IN_USE;
        SendPacket(&data);
        return;
    }

    if (m_charactersCount >= sWorld.getConfig(CONFIG_UINT32_CHARACTERS_PER_REALM))
    {
        data << (uint8)CHAR_CREATE_SERVER_LIMIT;
        SendPacket(&data);
        return;
    }

    bool AllowTwoSideAccounts = !sWorld.IsPvPRealm() || sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_ACCOUNTS) || GetSecurity() > SEC_PLAYER;

    if (!AllowTwoSideAccounts)
    {
        std::vector<PlayerCacheData const*> characters;
        sObjectMgr.GetPlayerDataForAccount(GetAccountId(), characters);

        if (!characters.empty())
        {
            PlayerCacheData const* cData = characters.front();
            Team team_ = Player::TeamForRace(race_);

            uint8 acc_race = cData->uiRace;

            // need to check team only for first character
            // TODO: what to if account already has characters of both races?
            if (!AllowTwoSideAccounts)
            {
                if (acc_race == 0 || Player::TeamForRace(acc_race) != team_)
                {
                    data << (uint8)CHAR_CREATE_PVP_TEAMS_VIOLATION;
                    SendPacket(&data);
                    return;
                }
            }
        }
    }

    uint32 const guidLow = sObjectMgr.GeneratePlayerLowGuid();
    if (Player::SaveNewPlayer(this, guidLow, name, race_, class_, gender, skin, face, hairStyle, hairColor, facialHair))
    {
        m_charactersCount += 1;

        LoginDatabase.PExecute("REPLACE INTO `realmcharacters` (`numchars`, `acctid`, `realmid`) VALUES (%u, %u, %u)", m_charactersCount, GetAccountId(), realmID);

        data << (uint8)CHAR_CREATE_SUCCESS;
        SendPacket(&data);
    }
    else
    {
        data << (uint8)CHAR_CREATE_ERROR;
        SendPacket(&data);
    }
}

void WorldSession::HandleCharDeleteOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    // can't delete loaded character
    if (ObjectAccessor::FindPlayerNotInWorld(guid))
        return;

    uint32 accountId = 0;
    std::string name;

    // is guild leader
    if (sGuildMgr.GetGuildByLeader(guid))
    {
        WorldPacket data(SMSG_CHAR_DELETE, 1);
        data << (uint8)CHAR_DELETE_FAILED;
        SendPacket(&data);
        return;
    }

    uint32 lowguid = guid.GetCounter();

    PlayerCacheData* cacheData = sObjectMgr.GetPlayerDataByGUID(lowguid);
    if (!cacheData)
        return; // Character not found

    accountId = cacheData->uiAccount;
    name = cacheData->sName;

    // prevent deleting other players' characters using cheating tools
    if (accountId != GetAccountId())
        return;

    sLog.Player(this, LOG_CHAR, "Delete", LOG_LVL_BASIC, "Character %s guid %u", name.c_str(), guid);

    // If the character is online (ALT-F4 logout for example)
    if (Player* onlinePlayer = sObjectAccessor.FindPlayer(guid))
        onlinePlayer->GetSession()->LogoutPlayer(true);

    Player::DeleteFromDB(guid, GetAccountId());

    WorldPacket data(SMSG_CHAR_DELETE, 1);
    data << (uint8)CHAR_DELETE_SUCCESS;
    SendPacket(&data);
}

void WorldSession::HandlePlayerLoginOpcode(WorldPacket& recv_data)
{
    ObjectGuid playerGuid;
    recv_data >> playerGuid;

    if ((!sWorld.getConfig(CONFIG_BOOL_WORLD_AVAILABLE) && GetSecurity() == SEC_PLAYER) ||
        PlayerLoading() || GetPlayer() != nullptr || !playerGuid.IsPlayer())
    {
        WorldPacket data(SMSG_CHARACTER_LOGIN_FAILED, 1);
        data << (uint8)1;
        SendPacket(&data);
        return;
    }

    LoginQueryHolder* holder = new LoginQueryHolder(GetAccountId(), playerGuid);
    if (!holder->Initialize())
    {
        delete holder;                                      // delete all unprocessed queries
        return;
    }
    m_playerLoading = true;
    CharacterDatabase.DelayQueryHolderUnsafe(&chrHandler, &CharacterHandler::HandlePlayerLoginCallback, holder);
}

void WorldSession::LoginPlayer(ObjectGuid loginPlayerGuid)
{
    ASSERT(loginPlayerGuid.IsPlayer());
    LoginQueryHolder* holder = new LoginQueryHolder(GetAccountId(), loginPlayerGuid);
    if (!holder->Initialize())
    {
        delete holder;                                      // delete all unprocessed queries
        return;
    }
    m_playerLoading = true;
    CharacterDatabase.DelayQueryHolderUnsafe(&chrHandler, &CharacterHandler::HandlePlayerLoginCallback, holder);
}

void WorldSession::HandlePlayerLogin(LoginQueryHolder *holder)
{
    // The following fixes a crash. Use case:
    // Session1 created, requests login, kicked.
    // Session2 created, requests login, and receives 2 login callback.
    if (GetPlayer() || !m_playerLoading)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[CRASH] HandlePlayerLogin on session %u with player %s [loading=%u]", GetAccountId(), GetPlayerName(), m_playerLoading);
        delete holder;
        m_playerLoading = false;
        return;
    }

    ObjectGuid playerGuid = holder->GetGuid();
    ASSERT(playerGuid.IsPlayer());
    m_currentPlayerGuid = playerGuid;

    // If the character is online (ALT-F4 logout for example)
    Player* pCurrChar = sObjectAccessor.FindPlayer(playerGuid);
    MasterPlayer* pCurrMasterPlayer = sObjectAccessor.FindMasterPlayer(playerGuid);
    bool alreadyOnline = false;
    if (pCurrChar)
    {
        // Hacking attempt
        if (pCurrChar->GetSession()->GetAccountId() != GetAccountId())
        {
            ProcessAnticheatAction("PassiveAnticheat", "Attempt to login to character on different account", CHEAT_ACTION_LOG);
            KickPlayer();
            delete holder;
            m_playerLoading = false;
            return;
        }

        if (pCurrChar->FindMap() != sMapMgr.FindMap(pCurrChar->GetMapId(), pCurrChar->GetInstanceId()))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[CRASH] Dangling map pointer during login on character guid %u", playerGuid.GetCounter());
            KickPlayer();
            delete holder;
            m_playerLoading = false;
            return;
        }

        alreadyOnline = true;
        pCurrChar->GetSession()->SetPlayer(nullptr);
        pCurrChar->SetSession(this);

        // Need to attach packet bcaster to the new socket
        pCurrChar->m_broadcaster->ChangeSocket(GetSocket());

        // If the character had a logout request, then he is articifially stunned (in CMSG_LOGOUT_REQUEST handler). Fix it here.
        if (pCurrChar->CanFreeMove())
        {
            pCurrChar->SetRootedReal(false);
            pCurrChar->SetStandState(UNIT_STAND_STATE_STAND);
            pCurrChar->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
        }
    }
    else
    {
        // Character found online but not in world ?
        if (HashMapHolder<Player>::Find(playerGuid))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[CRASH] Trying to login already ingame character guid %u", playerGuid.GetCounter());
            KickPlayer();
            delete holder;
            m_playerLoading = false;
            return;
        }
        pCurrChar = new Player(this);
        pCurrChar->GetMotionMaster()->Initialize();

        if (GetBot() && !sPlayerBotMgr.IsSavingAllowed())
            pCurrChar->m_saveDisabled = true;
    }

    // "GetAccountId()==db stored account id" checked in LoadFromDB (prevent login not own character using cheating tools)
    if (alreadyOnline)
        pCurrChar->SendPacketsAtRelogin();
    else if (!pCurrChar->LoadFromDB(playerGuid, holder))
    {
        KickPlayer();                                       // disconnect client, player no set to session and it will not deleted or saved at kick
        delete pCurrChar;                                   // delete it manually
        delete holder;                                      // delete all unprocessed queries
        m_playerLoading = false;
        return;
    }

    ASSERT(pCurrChar->GetSession() == this);
    SetPlayer(pCurrChar);
    if (pCurrMasterPlayer)
    {
        pCurrMasterPlayer->GetSession()->SetMasterPlayer(nullptr);
        pCurrMasterPlayer->SetSession(this);
        m_masterPlayer = pCurrMasterPlayer;
    }
    else
    {
        m_masterPlayer = new MasterPlayer(this);
        m_masterPlayer->LoadPlayer(GetPlayer());
        m_masterPlayer->LoadActions(std::move(holder->TakeResult(PLAYER_LOGIN_QUERY_LOADACTIONS)));
        m_masterPlayer->LoadSocial(std::move(holder->TakeResult(PLAYER_LOGIN_QUERY_LOADSOCIALLIST)));
        m_masterPlayer->LoadMails(std::move(holder->TakeResult(PLAYER_LOGIN_QUERY_LOADMAILS)));
        m_masterPlayer->LoadMailedItems(std::move(holder->TakeResult(PLAYER_LOGIN_QUERY_LOADMAILEDITEMS)));
    }
    m_masterPlayer->UpdateNextMailTimeAndUnreads();

    sObjectAccessor.AddObject(m_masterPlayer);

    WorldPacket data(SMSG_LOGIN_VERIFY_WORLD, 20);
    data << pCurrChar->GetMapId();
    if (pCurrChar->GetTransport())
    {
        Position const& transportPosition = pCurrChar->m_movementInfo.GetTransportPos();
        data << transportPosition.x;
        data << transportPosition.y;
        data << transportPosition.z;
        data << transportPosition.o;
    }
    else
    {
        data << pCurrChar->GetPositionX();
        data << pCurrChar->GetPositionY();
        data << pCurrChar->GetPositionZ();
        data << pCurrChar->GetOrientation();
    }
    SendPacket(&data);

    // load player specific part before send times
    LoadAccountData(holder->TakeResult(PLAYER_LOGIN_QUERY_LOADACCOUNTDATA), NewAccountData::PER_CHARACTER_CACHE_MASK);
    SendAccountDataTimes();

    pCurrChar->GetSocial()->SendFriendList();
    pCurrChar->GetSocial()->SendIgnoreList();

    // Send MOTD (1.12.1 not have SMSG_MOTD, so do it in another way)
    {
        uint32 linecount = 0;
        std::string str_motd = sWorld.GetMotd();
        std::string::size_type pos, nextpos;
        std::string motd;

        pos = 0;
        while ((nextpos = str_motd.find('@', pos)) != std::string::npos)
        {
            if (nextpos != pos)
            {
                ChatHandler(pCurrChar).PSendSysMessage(str_motd.substr(pos, nextpos - pos).c_str());
                ++linecount;
            }
            pos = nextpos + 1;
        }

        if (pos < str_motd.length())
        {
            ChatHandler(pCurrChar).PSendSysMessage(str_motd.substr(pos).c_str());
            ++linecount;
        }
    }

    if (Guild* guild = sGuildMgr.GetGuildById(pCurrChar->GetGuildId()))
    {
        WorldPacket data(SMSG_GUILD_EVENT, (2 + guild->GetMOTD().size() + 1));
        data << uint8(GE_MOTD);
        data << uint8(1);
        data << guild->GetMOTD();
        SendPacket(&data);

        guild->BroadcastEvent(GE_SIGNED_ON, pCurrChar->GetObjectGuid(), pCurrChar->GetName());
    }

    if (char const* warning = sAccountMgr.GetWarningText(GetAccountId()))
    {
        ChatHandler(pCurrChar).PSendSysMessage(LANG_ACCOUNT_WARNED, warning);
        SendNotification("WARNING: %s", warning);
    }

    if (!pCurrChar->IsAlive())
        pCurrChar->SendCorpseReclaimDelay(true);

    pCurrChar->SendInitialPacketsBeforeAddToMap();
    GetMasterPlayer()->SendInitialActionButtons();

    // Show cinematic at the first time that player login
    if (pCurrChar->HasAtLoginFlag(AT_LOGIN_FIRST) && !sWorld.getConfig(CONFIG_BOOL_SKIP_CINEMATICS))
    {
        if (ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(pCurrChar->GetRace()))
            pCurrChar->SendCinematicStart(rEntry->CinematicSequence);
    }

    if (!alreadyOnline && !pCurrChar->GetMap()->Add(pCurrChar))
    {
        // normal delayed teleport protection not applied (and this correct) for this case (Player object just created)
        AreaTriggerTeleport const* at = sObjectMgr.GetGoBackTrigger(pCurrChar->GetMapId());
        if (at)
            pCurrChar->TeleportTo(at->destination, pCurrChar->GetOrientation());
        else if (pCurrChar->GetMapId() == 533)
            pCurrChar->TeleportTo(0, 3362.15f, -3379.35f, 144.782f, 6.28319f); // Naxxramas has no exit trigger
        else
            pCurrChar->TeleportToHomebind();

        sMapMgr.ExecuteSingleDelayedTeleport(pCurrChar);
    }

    if (alreadyOnline)
        pCurrChar->GetMap()->ExistingPlayerLogin(pCurrChar); // SendInitSelf ...
    else
        sObjectAccessor.AddObject(pCurrChar);

    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player %s added to Map.",pCurrChar->GetName());

    pCurrChar->SendInitialPacketsAfterAddToMap();
    if (alreadyOnline)
        pCurrChar->SendInitWorldStates(pCurrChar->GetCachedZoneId());

    static SqlStatementID updChars;
    static SqlStatementID updAccount;

    SqlStatement stmt = CharacterDatabase.CreateStatement(updChars, "UPDATE `characters` SET `online` = 1 WHERE `guid` = ?");
    stmt.PExecute(pCurrChar->GetGUIDLow());

    stmt = LoginDatabase.CreateStatement(updAccount, "UPDATE `account` SET current_realm = ?, online = 1 WHERE id = ?");
    stmt.PExecute(realmID, GetAccountId());

    pCurrChar->SetInGameTime(WorldTimer::getMSTime());

    // announce group about member online (must be after add to player list to receive announce to self)
    if (Group* group = pCurrChar->GetGroup())
        group->UpdatePlayerOnlineStatus(pCurrChar);

    // friend status
    // TODO: Call it when node finished loading also
    if (GetMasterPlayer())
    {
        GetMasterPlayer()->areaId = pCurrChar->GetCachedAreaId();
        GetMasterPlayer()->zoneId = pCurrChar->GetCachedZoneId();
        sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_ONLINE, GetMasterPlayer()->GetObjectGuid(), true);
    }

    if (!alreadyOnline)
    {
        // Place character in world (and load zone) before some object loading
        pCurrChar->LoadCorpse();

        // setting Ghost+speed if dead
        if (pCurrChar->m_deathState != ALIVE)
        {
            // not blizz like, we must correctly save and load player instead...
            if (pCurrChar->GetRace() == RACE_NIGHTELF)
                pCurrChar->CastSpell(pCurrChar, 20584, true);   // auras SPELL_AURA_INCREASE_SPEED(+speed in wisp form), SPELL_AURA_INCREASE_SWIM_SPEED(+swim speed in wisp form), SPELL_AURA_TRANSFORM (to wisp form)
            pCurrChar->CastSpell(pCurrChar, 8326, true);        // auras SPELL_AURA_GHOST, SPELL_AURA_INCREASE_SPEED(why?), SPELL_AURA_INCREASE_SWIM_SPEED(why?)

            pCurrChar->SetWaterWalking(true);
        }
    }

    // Load pet if any (if player not alive and in taxi flight or another then pet will remember as temporary unsummoned)
    if (alreadyOnline)
    {
        pCurrChar->PetSpellInitialize();
        pCurrChar->SendMirrorTimers(true);
    }
    else
    {
        pCurrChar->ContinueTaxiFlight();
        pCurrChar->LoadPet();
    }

    // Set FFA PvP for non GM in non-rest mode
    if (sWorld.IsFFAPvPRealm() && !pCurrChar->IsGameMaster() && !pCurrChar->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING))
        pCurrChar->SetFFAPvP(true);

    if (pCurrChar->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP))
        pCurrChar->UpdatePvPContested(true);

    // Apply at_login_flags requests
    if (pCurrChar->HasAtLoginFlag(AT_LOGIN_RESET_SPELLS))
    {
        pCurrChar->ResetSpells();
        SendNotification(LANG_RESET_SPELLS);
    }

    if (pCurrChar->HasAtLoginFlag(AT_LOGIN_RESET_TALENTS))
    {
        pCurrChar->ResetTalents(true);
        SendNotification(LANG_RESET_TALENTS);               // we can use SMSG_TALENTS_INVOLUNTARILY_RESET here
    }

    if (pCurrChar->HasAtLoginFlag(AT_LOGIN_FIRST))
        pCurrChar->RemoveAtLoginFlag(AT_LOGIN_FIRST);

    // show time before shutdown if shutdown planned.
    if (sWorld.IsShutdowning())
        sWorld.ShutdownMsg(true, pCurrChar);

    if (sWorld.getConfig(CONFIG_BOOL_ALL_TAXI_PATHS))
        pCurrChar->SetTaxiCheater(true);

    if (pCurrChar->IsGameMaster())
        SendNotification(LANG_GM_ON);

    if (!pCurrChar->IsGMVisible())
        SendNotification(LANG_INVISIBLE_INVISIBLE, pCurrChar->GetGMInvisibilityLevel());

    std::string IP_str = GetRemoteAddress();

    sLog.Player(this, LOG_CHAR, "Login", LOG_LVL_DETAIL, alreadyOnline ? "Player was already online" : "");
    
    if (!alreadyOnline && !pCurrChar->IsStandingUp() && !pCurrChar->HasUnitState(UNIT_STAT_STUNNED))
        pCurrChar->SetStandState(UNIT_STAND_STATE_STAND);

    m_playerLoading = false;
    delete holder;

    if (alreadyOnline)
    {
        pCurrChar->UpdateControl();
        // Send "Release spirit" timer, etc ...
        if (pCurrChar->GetDeathState() == CORPSE)
            pCurrChar->KillPlayer();
    }
    pCurrChar->RestorePendingTeleport();

    sObjectMgr.UpdatePlayerCachedPosition(pCurrChar);

    if (sWorld.getConfig(CONFIG_BOOL_SEND_LOOT_ROLL_UPON_RECONNECT) && alreadyOnline)
        if (Group* pGroup = pCurrChar->GetGroup())
            pGroup->SendLootStartRollsForPlayer(pCurrChar);
}

void WorldSession::HandleSetFactionAtWarOpcode(WorldPacket& recv_data)
{
    uint32 repListId;
    uint8  flag;

    recv_data >> repListId;
    recv_data >> flag;

    Player* pPlayer = GetPlayer();

    if (pPlayer->IsInCombat())
        return;

    pPlayer->GetReputationMgr().SetAtWar(repListId, flag);
}

void WorldSession::HandleTutorialFlagOpcode(WorldPacket& recv_data)
{
    uint32 iFlag;
    recv_data >> iFlag;

    uint32 wInt = (iFlag / 32);
    if (wInt >= 8)
        return;

    uint32 rInt = (iFlag % 32);

    uint32 tutflag = GetTutorialInt(wInt);
    tutflag |= (1 << rInt);
    SetTutorialInt(wInt, tutflag);
}

void WorldSession::HandleTutorialClearOpcode(WorldPacket& /*recv_data*/)
{
    for (uint32 iI = 0; iI < 8; ++iI)
        SetTutorialInt(iI, 0xFFFFFFFF);
}

void WorldSession::HandleTutorialResetOpcode(WorldPacket& /*recv_data*/)
{
    for (uint32 iI = 0; iI < 8; iI++)
        SetTutorialInt(iI, 0x00000000);
}

void WorldSession::HandleSetWatchedFactionOpcode(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    int32 repId;
    recv_data >> repId;
    GetPlayer()->SetInt32Value(PLAYER_FIELD_WATCHED_FACTION_INDEX, repId);
#endif
}

void WorldSession::HandleSetFactionInactiveOpcode(WorldPacket& recv_data)
{
    uint32 replistid;
    uint8 inactive;
    recv_data >> replistid >> inactive;

    _player->GetReputationMgr().SetInactive(replistid, inactive);
}

void WorldSession::HandleShowingHelmOpcode(WorldPacket& /*recv_data*/)
{
    _player->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_HELM);
}

void WorldSession::HandleShowingCloakOpcode(WorldPacket& /*recv_data*/)
{
    _player->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_CLOAK);
}

void WorldSession::HandleCharRenameOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    std::string newname;

    recv_data >> guid;
    recv_data >> newname;

    // prevent character rename to invalid name
    if (!normalizePlayerName(newname))
    {
        WorldPacket data(SMSG_CHAR_RENAME, 1);
        data << uint8(CHAR_NAME_NO_NAME);
        SendPacket(&data);
        return;
    }

    uint8 res = ObjectMgr::CheckPlayerName(newname, true);
    if (res != CHAR_NAME_SUCCESS)
    {
        WorldPacket data(SMSG_CHAR_RENAME, 1);
        data << uint8(res);
        SendPacket(&data);
        return;
    }

    // check name limitations
    if (GetSecurity() == SEC_PLAYER && sObjectMgr.IsReservedName(newname))
    {
        WorldPacket data(SMSG_CHAR_RENAME, 1);
        data << uint8(CHAR_NAME_RESERVED);
        SendPacket(&data);
        return;
    }

    std::string escaped_newname = newname;
    CharacterDatabase.escape_string(escaped_newname);

    // make sure that the character belongs to the current account, that rename at login is enabled
    // and that there is no character with the desired new name
    CharacterDatabase.AsyncPQuery(&WorldSession::HandleChangePlayerNameOpcodeCallBack,
                                  GetAccountId(), newname,
                                  "SELECT `guid`, `name` FROM `characters` WHERE `guid` = %u AND `account` = %u AND (`at_login_flags` & %u) = %u AND NOT EXISTS (SELECT NULL FROM `characters` WHERE `name` = '%s')",
                                  guid.GetCounter(), GetAccountId(), AT_LOGIN_RENAME, AT_LOGIN_RENAME, escaped_newname.c_str()
                                 );
}

void WorldSession::HandleChangePlayerNameOpcodeCallBack(std::unique_ptr<QueryResult> result, uint32 accountId, std::string newname)
{
    WorldSession* session = sWorld.FindSession(accountId);
    if (!session)
    {
        return;
    }

    if (!result)
    {
        WorldPacket data(SMSG_CHAR_RENAME, 1);
        data << uint8(CHAR_CREATE_ERROR);
        session->SendPacket(&data);
        return;
    }

    uint32 guidLow = result->Fetch()[0].GetUInt32();
    ObjectGuid guid = ObjectGuid(HIGHGUID_PLAYER, guidLow);
    std::string oldname = result->Fetch()[1].GetCppString();

    CharacterDatabase.BeginTransaction();
    CharacterDatabase.PExecute("UPDATE `characters` SET `name` = '%s', `at_login_flags` = `at_login_flags` & ~ %u WHERE `guid` ='%u'", newname.c_str(), uint32(AT_LOGIN_RENAME), guidLow);
    CharacterDatabase.CommitTransaction();

    sLog.Player(session->GetAccountId(), LOG_CHAR, LOG_LVL_BASIC,
        "Account: %d (IP: %s) Character:[%s] (guid:%u) Changed name to: %s",
        session->GetAccountId(), session->GetRemoteAddress().c_str(), oldname.c_str(), guidLow, newname.c_str());

    WorldPacket data(SMSG_CHAR_RENAME, 1 + 8 + (newname.size() + 1));
    data << uint8(RESPONSE_SUCCESS);
    data << guid;
    data << newname;
    session->SendPacket(&data);

    sObjectMgr.ChangePlayerNameInCache(guidLow, oldname, newname);
    sWorld.InvalidatePlayerDataToAllClient(guid);
}
