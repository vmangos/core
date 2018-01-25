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
#include "UpdateMask.h"
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

// config option SkipCinematics supported values
enum CinematicsSkipMode
{
    CINEMATICS_SKIP_NONE      = 0,
    CINEMATICS_SKIP_SAME_RACE = 1,
    CINEMATICS_SKIP_ALL       = 2,
};


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
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADFROM,            "SELECT guid, account, name, race, class, gender, level, xp, money, playerBytes, playerBytes2, playerFlags, "
                     "position_x, position_y, position_z, map, orientation, taximask, cinematic, totaltime, leveltime, rest_bonus, logout_time, is_logout_resting, resettalents_multiplier, "
                     "resettalents_time, trans_x, trans_y, trans_z, trans_o, transguid, extra_flags, stable_slots, at_login, zone, online, death_expire_time, taxi_path, "
                     "honorRankPoints, honorHighestRank, honorStanding, honorLastWeekHK, honorLastWeekCP, honorStoredHK, honorStoredDK, "
                     "watchedFaction, drunk, health, power1, power2, power3, power4, power5, exploredZones, equipmentCache, ammoId, actionBars, "
                     "world_phase_mask, customFlags FROM characters WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADGROUP,           "SELECT groupId FROM group_member WHERE memberGuid ='%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADBOUNDINSTANCES,  "SELECT id, permanent, map, resettime FROM character_instance LEFT JOIN instance ON instance = id WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADAURAS,           "SELECT caster_guid,item_guid,spell,stackcount,remaincharges,basepoints0,basepoints1,basepoints2,periodictime0,periodictime1,periodictime2,maxduration,remaintime,effIndexMask FROM character_aura WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSPELLS,          "SELECT spell,active,disabled FROM character_spell WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADQUESTSTATUS,     "SELECT quest,status,rewarded,explored,timer,mobcount1,mobcount2,mobcount3,mobcount4,itemcount1,itemcount2,itemcount3,itemcount4,reward_choice FROM character_queststatus WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADHONORCP,         "SELECT victimType,victim,cp,date,type FROM character_honor_cp WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADREPUTATION,      "SELECT faction,standing,flags FROM character_reputation WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADINVENTORY,       "SELECT * FROM (SELECT creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, text, bag, slot, item, itemEntry, generated_loot FROM character_inventory JOIN item_instance ON character_inventory.item = item_instance.guid WHERE character_inventory.guid = '%u') as t ORDER BY bag,slot", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADITEMLOOT,        "SELECT guid,itemid,amount,property FROM item_loot WHERE owner_guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADACTIONS,         "SELECT button,action,type FROM character_action WHERE guid = '%u' ORDER BY button", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSOCIALLIST,      "SELECT friend,flags FROM character_social WHERE guid = '%u' LIMIT 255", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADHOMEBIND,        "SELECT map,zone,position_x,position_y,position_z FROM character_homebind WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSPELLCOOLDOWNS,  "SELECT spell,item,time,cattime FROM character_spell_cooldown WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADGUILD,           "SELECT guildid,rank FROM guild_member WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADBGDATA,          "SELECT instance_id, team, join_x, join_y, join_z, join_o, join_map FROM character_battleground_data WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADSKILLS,          "SELECT skill, value, max FROM character_skills WHERE guid = '%u'", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADMAILS,           "SELECT id,messageType,sender,receiver,subject,itemTextId,expire_time,deliver_time,money,cod,checked,stationery,mailTemplateId,has_items FROM mail WHERE receiver = '%u' ORDER BY id DESC", m_guid.GetCounter());
    res &= SetPQuery(PLAYER_LOGIN_QUERY_LOADMAILEDITEMS,     "SELECT creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, text, mail_id, item_guid, itemEntry, generated_loot FROM mail_items JOIN item_instance ON item_guid = guid WHERE receiver = '%u'", m_guid.GetCounter());

    return res;
}

// don't call WorldSession directly
// it may get deleted before the query callbacks get executed
// instead pass an account id to this handler
class CharacterHandler
{
public:
    void HandleCharEnumCallback(QueryResult * result, uint32 account)
    {
        WorldSession * session = sWorld.FindSession(account);
        if (!session)
        {
            delete result;
            return;
        }
        session->HandleCharEnum(result);
    }
    void HandlePlayerLoginCallback(QueryResult * /*dummy*/, SqlQueryHolder * holder)
    {
        if (!holder) return;
        WorldSession *session = sWorld.FindSession(((LoginQueryHolder*)holder)->GetAccountId());
        if (!session)
        {
            delete holder;
            return;
        }
        session->HandlePlayerLogin((LoginQueryHolder*)holder);
    }
} chrHandler;

void WorldSession::HandleCharEnum(QueryResult * result)
{
    WorldPacket data(SMSG_CHAR_ENUM, 100);                  // we guess size

    uint8 num = 0;

    data << num;

    if (result)
    {
        do
        {
            uint32 guidlow = (*result)[0].GetUInt32();
            uint32 level   = (*result)[7].GetUInt32();
            if (_characterMaxLevel < level)
                _characterMaxLevel = level;

            DETAIL_LOG("Build enum data for char guid %u from account %u.", guidlow, GetAccountId());
            if (Player::BuildEnumData(result, &data))
                ++num;
        }
        while (result->NextRow());

        delete result;
    }

    data.put<uint8>(0, num);
    _charactersCount = num;

    SendPacket(&data);
}

void WorldSession::HandleCharEnumOpcode(WorldPacket & /*recv_data*/)
{
    /// get all the data necessary for loading all characters (along with their pets) on the account
    CharacterDatabase.AsyncPQuery(&chrHandler, &CharacterHandler::HandleCharEnumCallback, GetAccountId(),
                                  //           0               1                2                3                 4                  5                       6                        7
                                  "SELECT characters.guid, characters.name, characters.race, characters.class, characters.gender, characters.playerBytes, characters.playerBytes2, characters.level, "
                                  //   8                9               10                     11                     12                     13                    14
                                  "characters.zone, characters.map, characters.position_x, characters.position_y, characters.position_z, guild_member.guildid, characters.playerFlags, "
                                  //  15                    16                   17                     18                   19
                                  "characters.at_login, character_pet.entry, character_pet.modelid, character_pet.level, characters.equipmentCache "
                                  "FROM characters LEFT JOIN character_pet ON characters.guid=character_pet.owner AND character_pet.slot='%u' "
                                  "LEFT JOIN guild_member ON characters.guid = guild_member.guid "
                                  "WHERE characters.account = '%u' ORDER BY characters.guid "
                                  "LIMIT 0,10",
                                  PET_SAVE_AS_CURRENT, GetAccountId());
}

void WorldSession::HandleCharCreateOpcode(WorldPacket & recv_data)
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

    if (!classEntry || !raceEntry || !sWorld.getConfig(CONFIG_BOOL_ENABLE_CHAR_CREATION))
    {
        data << (uint8)CHAR_CREATE_FAILED;
        SendPacket(&data);
        sLog.outError("Class: %u or Race %u not found in DBC (Wrong DBC files?) or Cheater?", class_, race_);
        return;
    }

    // prevent character creating with invalid name
    if (!normalizePlayerName(name))
    {
        data << (uint8)CHAR_NAME_NO_NAME;
        SendPacket(&data);
        sLog.outError("Account:[%d] but tried to Create character with empty [name]", GetAccountId());
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

    if (_charactersCount >= sWorld.getConfig(CONFIG_UINT32_CHARACTERS_PER_REALM))
    {
        data << (uint8)CHAR_CREATE_SERVER_LIMIT;
        SendPacket(&data);
        return;
    }

    bool AllowTwoSideAccounts = !sWorld.IsPvPRealm() || sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_ACCOUNTS) || GetSecurity() > SEC_PLAYER;
    CinematicsSkipMode skipCinematics = CinematicsSkipMode(sWorld.getConfig(CONFIG_UINT32_SKIP_CINEMATICS));

    bool have_same_race = false;
    if (!AllowTwoSideAccounts || skipCinematics == CINEMATICS_SKIP_SAME_RACE)
    {
        std::list<PlayerCacheData*> characters;
        sObjectMgr.GetPlayerDataForAccount(GetAccountId(), characters);

        if (characters.size() > 0)
        {
            PlayerCacheData* cData = characters.front();
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

            // search same race for cinematic or same class if need
            // TODO: check if cinematic already shown? (already logged in?; cinematic field)
            std::list<PlayerCacheData*>::iterator iter = characters.begin();
            while (iter != characters.end() && skipCinematics == CINEMATICS_SKIP_SAME_RACE && !have_same_race)
            {
                acc_race = (*iter)->uiRace;

                have_same_race = race_ == acc_race;
                ++iter;
            }
        }
    }

    Player *pNewChar = new Player(this);
    if (!pNewChar->Create(sObjectMgr.GeneratePlayerLowGuid(), name, race_, class_, gender, skin, face, hairStyle, hairColor, facialHair, outfitId))
    {
        // Player not create (race/class problem?)
        delete pNewChar;

        data << (uint8)CHAR_CREATE_ERROR;
        SendPacket(&data);

        return;
    }

    MasterPlayer masterPlayer(this);
    masterPlayer.Create(pNewChar);
    if ((have_same_race && skipCinematics == CINEMATICS_SKIP_SAME_RACE) || skipCinematics == CINEMATICS_SKIP_ALL)
        pNewChar->setCinematic(1);                          // not show intro

    pNewChar->SetAtLoginFlag(AT_LOGIN_FIRST);               // First login

    // Player created, save it now
    pNewChar->SaveToDB();
    masterPlayer.SaveToDB();

    sObjectMgr.InsertPlayerInCache(pNewChar);
    sObjectMgr.UpdatePlayerCachedPosition(pNewChar);
    _charactersCount += 1;

    LoginDatabase.PExecute("DELETE FROM realmcharacters WHERE acctid= '%u' AND realmid = '%u'", GetAccountId(), realmID);
    LoginDatabase.PExecute("INSERT INTO realmcharacters (numchars, acctid, realmid) VALUES (%u, %u, %u)",  _charactersCount, GetAccountId(), realmID);

    data << (uint8)CHAR_CREATE_SUCCESS;
    SendPacket(&data);

    std::string IP_str = GetRemoteAddress();
    BASIC_LOG("Account: %d (IP: %s) Create Character:[%s] (guid: %u)", GetAccountId(), IP_str.c_str(), name.c_str(), pNewChar->GetGUIDLow());
    sLog.out(LOG_CHAR, "Account: %d (IP: %s) Create Character:[%s] (guid: %u)", GetAccountId(), IP_str.c_str(), name.c_str(), pNewChar->GetGUIDLow());
    sWorld.LogCharacter(pNewChar, "Create");
    delete pNewChar;                                        // created only to call SaveToDB()
}

void WorldSession::HandleCharDeleteOpcode(WorldPacket & recv_data)
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

    std::string IP_str = GetRemoteAddress();
    BASIC_LOG("Account: %d (IP: %s) Delete Character:[%s] (guid: %u)", GetAccountId(), IP_str.c_str(), name.c_str(), lowguid);
    sLog.out(LOG_CHAR, "Account: %d (IP: %s) Delete Character:[%s] (guid: %u)", GetAccountId(), IP_str.c_str(), name.c_str(), lowguid);

    // If the character is online (ALT-F4 logout for example)
    if (Player* onlinePlayer = sObjectAccessor.FindPlayer(guid))
        onlinePlayer->GetSession()->LogoutPlayer(true);

    Player::DeleteFromDB(guid, GetAccountId());

    WorldPacket data(SMSG_CHAR_DELETE, 1);
    data << (uint8)CHAR_DELETE_SUCCESS;
    SendPacket(&data);

    sWorld.LogCharacter(this, lowguid, name, "Delete");
}

void WorldSession::HandlePlayerLoginOpcode(WorldPacket & recv_data)
{
    ObjectGuid playerGuid;
    recv_data >> playerGuid;

    if (PlayerLoading() || GetPlayer() != NULL)
    {
        sLog.outError("Player tryes to login again, AccountId = %d", GetAccountId());
        return;
    }
    if (!playerGuid.IsPlayer())
        return;


    DEBUG_LOG("WORLD: Recvd Player Logon Message");

    LoginQueryHolder *holder = new LoginQueryHolder(GetAccountId(), playerGuid);
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
    LoginQueryHolder *holder = new LoginQueryHolder(GetAccountId(), loginPlayerGuid);
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
        sLog.outInfo("[CRASH] HandlePlayerLogin on session %u with player %s [loading=%u]", GetAccountId(), GetPlayerName(), m_playerLoading);
        delete holder;
        m_playerLoading = false;
        return;
    }
    ObjectGuid playerGuid = holder->GetGuid();
    ASSERT(playerGuid.IsPlayer());

    // If the character is online (ALT-F4 logout for example)
    Player *pCurrChar = sObjectAccessor.FindPlayer(playerGuid);
    MasterPlayer* pCurrMasterPlayer = sObjectAccessor.FindMasterPlayer(playerGuid);
    bool alreadyOnline = false;
    if (pCurrChar)
    {
        // Hacking attempt
        if (pCurrChar->GetSession()->GetAccountId() != GetAccountId())
        {
            KickPlayer();
            delete holder;
            m_playerLoading = false;
            return;
        }
        pCurrChar->GetSession()->SetPlayer(NULL);
        pCurrChar->SetSession(this);
        // Need to attach packet bcaster to the new socket
        pCurrChar->m_broadcaster->ChangeSocket(GetSocket());
        alreadyOnline = true;
        // If the character had a logout request, then he is articifially stunned (cf CMSG_LOGOUT_REQUEST handler). Fix it here.
        if (pCurrChar->CanFreeMove())
        {
            pCurrChar->SetMovement(MOVE_UNROOT);
            pCurrChar->SetStandState(UNIT_STAND_STATE_STAND);
            pCurrChar->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
        }
    }
    else
    {
        // Character found online but not in world ?
        if (HashMapHolder<Player>::Find(playerGuid))
        {
            sLog.outInfo("[CRASH] Trying to login already ingame character guid %u", playerGuid.GetCounter());
            KickPlayer();
            delete holder;
            m_playerLoading = false;
            return;
        }
        pCurrChar = new Player(this);
        pCurrChar->GetMotionMaster()->Initialize();
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
        pCurrMasterPlayer->GetSession()->SetMasterPlayer(NULL);
        pCurrMasterPlayer->SetSession(this);
        m_masterPlayer = pCurrMasterPlayer;
    }
    else
    {
        m_masterPlayer = new MasterPlayer(this);
        m_masterPlayer->LoadPlayer(GetPlayer());
        m_masterPlayer->LoadActions(holder->GetResult(PLAYER_LOGIN_QUERY_LOADACTIONS));
        m_masterPlayer->LoadSocial(holder->GetResult(PLAYER_LOGIN_QUERY_LOADSOCIALLIST));
        m_masterPlayer->LoadMails(holder->GetResult(PLAYER_LOGIN_QUERY_LOADMAILS));
        m_masterPlayer->LoadMailedItems(holder->GetResult(PLAYER_LOGIN_QUERY_LOADMAILEDITEMS));
    }
    m_masterPlayer->UpdateNextMailTimeAndUnreads();

    sObjectAccessor.AddObject(m_masterPlayer);

    WorldPacket data(SMSG_LOGIN_VERIFY_WORLD, 20);
    data << pCurrChar->GetMapId();
    data << pCurrChar->GetPositionX();
    data << pCurrChar->GetPositionY();
    data << pCurrChar->GetPositionZ();
    data << pCurrChar->GetOrientation();
    SendPacket(&data);

    data.Initialize(SMSG_ACCOUNT_DATA_TIMES, 128);
    for (int i = 0; i < 32; ++i)
        data << uint32(0);
    SendPacket(&data);

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

        DEBUG_LOG("WORLD: Sent motd (SMSG_MOTD)");
    }

    if (Guild* guild = sGuildMgr.GetGuildById(pCurrChar->GetGuildId()))
    {
        WorldPacket data(SMSG_GUILD_EVENT, (2 + guild->GetMOTD().size() + 1));
        data << uint8(GE_MOTD);
        data << uint8(1);
        data << guild->GetMOTD();
        SendPacket(&data);
        DEBUG_LOG("WORLD: Sent guild-motd (SMSG_GUILD_EVENT)");

        guild->BroadcastEvent(GE_SIGNED_ON, pCurrChar->GetObjectGuid(), pCurrChar->GetName());
    }

    if (!pCurrChar->isAlive())
        pCurrChar->SendCorpseReclaimDelay(true);

    pCurrChar->SendInitialPacketsBeforeAddToMap();
    GetMasterPlayer()->SendInitialActionButtons();

    //Show cinematic at the first time that player login
    if (!pCurrChar->getCinematic())
    {
        pCurrChar->setCinematic(1);

        if (ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(pCurrChar->getRace()))
            pCurrChar->SendCinematicStart(rEntry->CinematicSequence);
    }

    if (!alreadyOnline && !pCurrChar->GetMap()->Add(pCurrChar))
    {
        // normal delayed teleport protection not applied (and this correct) for this case (Player object just created)
        AreaTrigger const* at = sObjectMgr.GetGoBackTrigger(pCurrChar->GetMapId());
        if (at)
            pCurrChar->TeleportTo(at->target_mapId, at->target_X, at->target_Y, at->target_Z, pCurrChar->GetOrientation());
        else
            pCurrChar->TeleportToHomebind();

        sMapMgr.ExecuteSingleDelayedTeleport(pCurrChar);
    }

    if (alreadyOnline)
        pCurrChar->GetMap()->ExistingPlayerLogin(pCurrChar); // SendInitSelf ...
    else
        sObjectAccessor.AddObject(pCurrChar);

    //DEBUG_LOG("Player %s added to Map.",pCurrChar->GetName());
    pCurrChar->GetSocial()->SendFriendList();
    pCurrChar->GetSocial()->SendIgnoreList();

    pCurrChar->SendInitialPacketsAfterAddToMap();
    if (alreadyOnline)
        pCurrChar->SendInitWorldStates(pCurrChar->GetCachedZoneId());

    static SqlStatementID updChars;
    static SqlStatementID updAccount;

    SqlStatement stmt = CharacterDatabase.CreateStatement(updChars, "UPDATE characters SET online = 1 WHERE guid = ?");
    stmt.PExecute(pCurrChar->GetGUIDLow());

    stmt = LoginDatabase.CreateStatement(updAccount, "UPDATE account SET current_realm = ?, online = 1 WHERE id = ?");
    stmt.PExecute(realmID, GetAccountId());

    pCurrChar->SetInGameTime(WorldTimer::getMSTime());

    // announce group about member online (must be after add to player list to receive announce to self)
    if (Group *group = pCurrChar->GetGroup())
        group->UpdatePlayerOnlineStatus(pCurrChar);

    // friend status
    // TODO: Call it when node finished loading also
    if (GetMasterPlayer())
        sSocialMgr.SendFriendStatus(GetMasterPlayer(), FRIEND_ONLINE, GetMasterPlayer()->GetObjectGuid(), true);

    if (!alreadyOnline)
    {
        // Place character in world (and load zone) before some object loading
        pCurrChar->LoadCorpse();

        // setting Ghost+speed if dead
        if (pCurrChar->m_deathState != ALIVE)
        {
            // not blizz like, we must correctly save and load player instead...
            if (pCurrChar->getRace() == RACE_NIGHTELF)
                pCurrChar->CastSpell(pCurrChar, 20584, true);   // auras SPELL_AURA_INCREASE_SPEED(+speed in wisp form), SPELL_AURA_INCREASE_SWIM_SPEED(+swim speed in wisp form), SPELL_AURA_TRANSFORM (to wisp form)
            pCurrChar->CastSpell(pCurrChar, 8326, true);        // auras SPELL_AURA_GHOST, SPELL_AURA_INCREASE_SPEED(why?), SPELL_AURA_INCREASE_SWIM_SPEED(why?)

            pCurrChar->SetMovement(MOVE_WATER_WALK);
        }
    }

    // Load pet if any (if player not alive and in taxi flight or another then pet will remember as temporary unsummoned)
    if (alreadyOnline)
        pCurrChar->PetSpellInitialize();
    else
    {
        pCurrChar->ContinueTaxiFlight();
        pCurrChar->LoadPet();
    }

    // Set FFA PvP for non GM in non-rest mode
    if (sWorld.IsFFAPvPRealm() && !pCurrChar->isGameMaster() && !pCurrChar->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING))
        pCurrChar->SetFFAPvP(true);

    if (pCurrChar->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP))
        pCurrChar->SetContestedPvP();

    // Apply at_login requests
    if (pCurrChar->HasAtLoginFlag(AT_LOGIN_RESET_SPELLS))
    {
        pCurrChar->resetSpells();
        SendNotification(LANG_RESET_SPELLS);
    }

    if (pCurrChar->HasAtLoginFlag(AT_LOGIN_RESET_TALENTS))
    {
        pCurrChar->resetTalents(true);
        SendNotification(LANG_RESET_TALENTS);               // we can use SMSG_TALENTS_INVOLUNTARILY_RESET here
    }

    if (pCurrChar->HasAtLoginFlag(AT_LOGIN_FIRST))
        pCurrChar->RemoveAtLoginFlag(AT_LOGIN_FIRST);

    // show time before shutdown if shutdown planned.
    if (sWorld.IsShutdowning())
        sWorld.ShutdownMsg(true, pCurrChar);

    if (sWorld.getConfig(CONFIG_BOOL_ALL_TAXI_PATHS))
        pCurrChar->SetTaxiCheater(true);

    if (pCurrChar->isGameMaster())
        SendNotification(LANG_GM_ON);

    if (!pCurrChar->isGMVisible())
        SendNotification(LANG_INVISIBLE_INVISIBLE, pCurrChar->GetGMInvisibilityLevel());

    std::string IP_str = GetRemoteAddress();

    sLog.out(LOG_CHAR, "Account: %d (IP: %s) Login Character:[%s] (guid: %u)%s",
             GetAccountId(), IP_str.c_str(), pCurrChar->GetName(), pCurrChar->GetGUIDLow(), alreadyOnline ? " Player was already online" : "");
    sWorld.LogCharacter(pCurrChar, "Login");
    if (!alreadyOnline && !pCurrChar->IsStandState() && !pCurrChar->hasUnitState(UNIT_STAT_STUNNED))
        pCurrChar->SetStandState(UNIT_STAND_STATE_STAND);

    m_playerLoading = false;
    _clientMoverGuid = pCurrChar->GetObjectGuid();
    delete holder;
    if (alreadyOnline)
    {
        pCurrChar->UpdateControl();
        // Send "Release spirit" timer, etc ...
        if (pCurrChar->getDeathState() == CORPSE)
            pCurrChar->KillPlayer();
    }
    pCurrChar->restorePendingTeleport();

    sObjectMgr.UpdatePlayerCachedPosition(pCurrChar);

    if (sWorld.getConfig(CONFIG_BOOL_SEND_LOOT_ROLL_UPON_RECONNECT) && alreadyOnline)
        if (Group* pGroup = pCurrChar->GetGroup())
            pGroup->SendLootStartRollsForPlayer(pCurrChar);

    // Update warden speeds
    //if (GetWarden())
        //for (int i = 0; i < MAX_MOVE_TYPE; ++i)
            //GetWarden()->SendSpeedChange(UnitMoveType(i), pCurrChar->GetSpeed(UnitMoveType(i)));

    ALL_SESSION_SCRIPTS(this, OnLogin(pCurrChar));
}

void WorldSession::HandleSetFactionAtWarOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_SET_FACTION_ATWAR");

    uint32 repListID;
    uint8  flag;

    recv_data >> repListID;
    recv_data >> flag;

    GetPlayer()->GetReputationMgr().SetAtWar(repListID, flag);
}

void WorldSession::HandleTutorialFlagOpcode(WorldPacket & recv_data)
{
    uint32 iFlag;
    recv_data >> iFlag;

    uint32 wInt = (iFlag / 32);
    if (wInt >= 8)
    {
        //sLog.outError("CHEATER? Account:[%d] Guid[%u] tried to send wrong CMSG_TUTORIAL_FLAG", GetAccountId(),GetGUID());
        return;
    }
    uint32 rInt = (iFlag % 32);

    uint32 tutflag = GetTutorialInt(wInt);
    tutflag |= (1 << rInt);
    SetTutorialInt(wInt, tutflag);

    //DEBUG_LOG("Received Tutorial Flag Set {%u}.", iFlag);
}

void WorldSession::HandleTutorialClearOpcode(WorldPacket & /*recv_data*/)
{
    for (uint32 iI = 0; iI < 8; ++iI)
        SetTutorialInt(iI, 0xFFFFFFFF);
}

void WorldSession::HandleTutorialResetOpcode(WorldPacket & /*recv_data*/)
{
    for (uint32 iI = 0; iI < 8; iI++)
        SetTutorialInt(iI, 0x00000000);
}

void WorldSession::HandleSetWatchedFactionOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_SET_WATCHED_FACTION");
    int32 repId;
    recv_data >> repId;
    GetPlayer()->SetInt32Value(PLAYER_FIELD_WATCHED_FACTION_INDEX, repId);
}

void WorldSession::HandleSetFactionInactiveOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_SET_FACTION_INACTIVE");
    uint32 replistid;
    uint8 inactive;
    recv_data >> replistid >> inactive;

    _player->GetReputationMgr().SetInactive(replistid, inactive);
}

void WorldSession::HandleShowingHelmOpcode(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("CMSG_SHOWING_HELM for %s", _player->GetName());
    _player->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_HELM);
}

void WorldSession::HandleShowingCloakOpcode(WorldPacket & /*recv_data*/)
{
    DEBUG_LOG("CMSG_SHOWING_CLOAK for %s", _player->GetName());
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
                                  "SELECT guid, name FROM characters WHERE guid = %u AND account = %u AND (at_login & %u) = %u AND NOT EXISTS (SELECT NULL FROM characters WHERE name = '%s')",
                                  guid.GetCounter(), GetAccountId(), AT_LOGIN_RENAME, AT_LOGIN_RENAME, escaped_newname.c_str()
                                 );
}

void WorldSession::HandleChangePlayerNameOpcodeCallBack(QueryResult *result, uint32 accountId, std::string newname)
{
    WorldSession * session = sWorld.FindSession(accountId);
    if (!session)
    {
        delete result;
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

    delete result;

    CharacterDatabase.BeginTransaction();
    CharacterDatabase.PExecute("UPDATE characters set name = '%s', at_login = at_login & ~ %u WHERE guid ='%u'", newname.c_str(), uint32(AT_LOGIN_RENAME), guidLow);
    CharacterDatabase.CommitTransaction();

    sLog.out(LOG_CHAR, "Account: %d (IP: %s) Character:[%s] (guid:%u) Changed name to: %s", session->GetAccountId(), session->GetRemoteAddress().c_str(), oldname.c_str(), guidLow, newname.c_str());

    WorldPacket data(SMSG_CHAR_RENAME, 1 + 8 + (newname.size() + 1));
    data << uint8(RESPONSE_SUCCESS);
    data << guid;
    data << newname;
    session->SendPacket(&data);

    sObjectMgr.ChangePlayerNameInCache(guidLow, oldname, newname);
    sWorld.InvalidatePlayerDataToAllClient(guid);
}
