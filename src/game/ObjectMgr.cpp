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

#include "ObjectMgr.h"
#include "Database/DatabaseEnv.h"
#include "Database/DatabaseImpl.h"
#include "Database/SQLStorageImpl.h"
#include "Policies/SingletonImp.h"

#include "SQLStorages.h"
#include "Log.h"
#include "MapManager.h"
#include "ObjectGuid.h"
#include "ScriptMgr.h"
#include "SpellMgr.h"
#include "UpdateMask.h"
#include "World.h"
#include "Group.h"
#include "Transport.h"
#include "ProgressBar.h"
#include "Language.h"
#include "PoolManager.h"
#include "GameEventMgr.h"
#include "Spell.h"
#include "Chat.h"
#include "AccountMgr.h"
#include "MapPersistentStateMgr.h"
#include "SpellAuras.h"
#include "Util.h"
#include "WaypointManager.h"
#include "GossipDef.h"
#include "Mail.h"
#include "Formulas.h"
#include "InstanceData.h"
#include "CharacterDatabaseCache.h"
#include "HardcodedEvents.h"

#include <limits>

INSTANTIATE_SINGLETON_1(ObjectMgr);

bool normalizePlayerName(std::string& name)
{
    if (name.empty())
        return false;

    wchar_t wstr_buf[MAX_INTERNAL_PLAYER_NAME + 1];
    size_t wstr_len = MAX_INTERNAL_PLAYER_NAME;

    if (!Utf8toWStr(name, &wstr_buf[0], wstr_len))
        return false;

    wstr_buf[0] = wcharToUpper(wstr_buf[0]);
    for (size_t i = 1; i < wstr_len; ++i)
        wstr_buf[i] = wcharToLower(wstr_buf[i]);

    if (!WStrToUtf8(wstr_buf, wstr_len, name))
        return false;

    return true;
}

LanguageDesc lang_description[LANGUAGES_COUNT] =
{
    { LANG_ADDON,           0, 0                       },
    { LANG_UNIVERSAL,       0, 0                       },
    { LANG_ORCISH,        669, SKILL_LANG_ORCISH       },
    { LANG_DARNASSIAN,    671, SKILL_LANG_DARNASSIAN   },
    { LANG_TAURAHE,       670, SKILL_LANG_TAURAHE      },
    { LANG_DWARVISH,      672, SKILL_LANG_DWARVEN      },
    { LANG_COMMON,        668, SKILL_LANG_COMMON       },
    { LANG_DEMONIC,       815, SKILL_LANG_DEMON_TONGUE },
    { LANG_TITAN,         816, SKILL_LANG_TITAN        },
    { LANG_THALASSIAN,    813, SKILL_LANG_THALASSIAN   },
    { LANG_DRACONIC,      814, SKILL_LANG_DRACONIC     },
    { LANG_KALIMAG,       817, SKILL_LANG_OLD_TONGUE   },
    { LANG_GNOMISH,      7340, SKILL_LANG_GNOMISH      },
    { LANG_TROLL,        7341, SKILL_LANG_TROLL        },
    { LANG_GUTTERSPEAK, 17737, SKILL_LANG_GUTTERSPEAK  },
};

LanguageDesc const* GetLanguageDescByID(uint32 lang)
{
    for (int i = 0; i < LANGUAGES_COUNT; ++i)
    {
        if (uint32(lang_description[i].lang_id) == lang)
            return &lang_description[i];
    }

    return NULL;
}

template<typename T>
T IdGenerator<T>::Generate()
{
    if (m_nextGuid >= std::numeric_limits<T>::max() - 1)
    {
        sLog.outError("%s guid overflow!! Can't continue, shutting down server. ", m_name);
        World::StopNow(ERROR_EXIT_CODE);
    }
    return m_nextGuid++;
}

template uint32 IdGenerator<uint32>::Generate();
template uint64 IdGenerator<uint64>::Generate();

ObjectMgr::ObjectMgr() :
    m_FirstTemporaryCreatureGuid(1),
    m_FirstTemporaryGameObjectGuid(1),
    m_GuildIds("Guild ids"),
    m_MailIds("Mail ids"),
    m_GroupIds("Group ids"),
    m_PetitionIds("Petition ids"),
    // Nostalrius
    DBCLocaleIndex(0),
    m_OldMailCounter(0)
{}

ObjectMgr::~ObjectMgr()
{
    for (QuestMap::iterator i = mQuestTemplates.begin(); i != mQuestTemplates.end(); ++i)
        delete i->second;

    for (PetLevelInfoMap::iterator i = petInfo.begin(); i != petInfo.end(); ++i)
        delete[] i->second;

    // free only if loaded
    for (int class_ = 0; class_ < MAX_CLASSES; ++class_)
        delete[] playerClassInfo[class_].levelInfo;

    for (int race = 0; race < MAX_RACES; ++race)
        for (int class_ = 0; class_ < MAX_CLASSES; ++class_)
            delete[] playerInfo[race][class_].levelInfo;

    // free objects
    for (GroupMap::iterator itr = mGroupMap.begin(); itr != mGroupMap.end(); ++itr)
        delete itr->second;

    for (CacheVendorItemMap::iterator itr = m_mCacheVendorTemplateItemMap.begin(); itr != m_mCacheVendorTemplateItemMap.end(); ++itr)
        itr->second.Clear();

    for (CacheVendorItemMap::iterator itr = m_mCacheVendorItemMap.begin(); itr != m_mCacheVendorItemMap.end(); ++itr)
        itr->second.Clear();

    for (CacheTrainerSpellMap::iterator itr = m_mCacheTrainerSpellMap.begin(); itr != m_mCacheTrainerSpellMap.end(); ++itr)
        itr->second.Clear();

    for (PlayerCacheDataMap::iterator itr = m_playerCacheData.begin(); itr != m_playerCacheData.end(); ++itr)
        delete itr->second;
}

void ObjectMgr::LoadAllIdentifiers()
{
    m_ItemIdSet.clear();

    Field* fields;
    QueryResult* result = WorldDatabase.Query("SELECT DISTINCT entry FROM item_template");

    if (result)
    {
        do
        {
            fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();
            m_ItemIdSet.insert(id);
        } while (result->NextRow());
        delete result;
    }
    
    m_QuestIdSet.clear();
    result = WorldDatabase.Query("SELECT DISTINCT entry FROM quest_template");

    if (result)
    {
        do
        {
            fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();
            m_QuestIdSet.insert(id);
        } while (result->NextRow());
        delete result;
    }

    m_CreatureIdSet.clear();
    result = WorldDatabase.Query("SELECT DISTINCT entry FROM creature_template");

    if (result)
    {
        do
        {
            fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();
            m_CreatureIdSet.insert(id);
        } while (result->NextRow());
        delete result;
    }

    m_GameObjectIdSet.clear();
    result = WorldDatabase.Query("SELECT DISTINCT entry FROM gameobject_template");

    if (result)
    {
        do
        {
            fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();
            m_GameObjectIdSet.insert(id);
        } while (result->NextRow());
        delete result;
    }

    m_CreatureGuidSet.clear();
    result = WorldDatabase.Query("SELECT DISTINCT guid FROM creature");

    if (result)
    {
        do
        {
            fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();
            m_CreatureGuidSet.insert(id);
        } while (result->NextRow());
        delete result;
    }

    m_GameObjectGuidSet.clear();
    result = WorldDatabase.Query("SELECT DISTINCT guid FROM gameobject");

    if (result)
    {
        do
        {
            fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();
            m_GameObjectGuidSet.insert(id);
        } while (result->NextRow());
        delete result;
    }
}

// Nostalrius
void ObjectMgr::LoadSpellDisabledEntrys()
{
    m_DisabledSpells.clear();                                // need for reload case

    QueryResult* result = WorldDatabase.Query("SELECT entry FROM spell_disabled");

    uint32 total_count = 0;

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded %u disabled spells", total_count);
        return;
    }

    Field* fields;
    do
    {
        fields = result->Fetch();
        uint32 spellid = fields[0].GetUInt32();
        if (!sSpellMgr.GetSpellEntry(spellid))
        {
            sLog.outError("Spell entry %u from `spell_disabled` doesn't exist, ignoring.", spellid);
            continue;
        }
        m_DisabledSpells.insert(spellid);
        ++total_count;
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u disabled spells from `spell_disabled`", total_count);
    delete result;
}
/*
DROP TABLE IF EXISTS map_loot_disabled;
CREATE TABLE `map_loot_disabled` (
  `mapid` int(11) default 0,
  `comment` varchar(255),
  PRIMARY KEY (`mapid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
*/
void ObjectMgr::LoadMapLootDisabled()
{
    m_DisabledMapLoots.clear();                                // need for reload case

    QueryResult* result = WorldDatabase.Query("SELECT mapid FROM map_loot_disabled");

    uint32 total_count = 0;

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded %u disabled maps loot", total_count);
        return;
    }

    Field* fields;
    do
    {
        fields = result->Fetch();
        uint32 mapid = fields[0].GetUInt32();
        m_DisabledMapLoots.insert(mapid);
        ++total_count;
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u disabled spells from `map_loot_disabled`", total_count);
    delete result;
}

void ObjectMgr::LoadCinematicsWaypoints()
{
    m_CinematicWaypoints.clear();

    QueryResult* result = WorldDatabase.Query("SELECT cinematic,timer,posx,posy,posz FROM cinematic_waypoints");

    uint32 total_count = 0;

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded %u disabled cinematic Waypoints", total_count);
        return;
    }

    Field* fields;
    do
    {
        fields = result->Fetch();
        CinematicWaypointEntry tmp;

        tmp.cinematic_id = fields[0].GetUInt32();
        tmp.time         = fields[1].GetUInt32();
        tmp.position.x   = fields[2].GetFloat();
        tmp.position.y   = fields[3].GetFloat();
        tmp.position.z   = fields[4].GetFloat();

        m_CinematicWaypoints.push_back(tmp);
        ++total_count;
    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u cinematic Waypoints from `cinematic_waypoints`", total_count);
}

Position const* ObjectMgr::GetCinematicPosition(uint32 cinematicId, uint32 elapsed_time)
{
    // On cherche un waypoint :
    // 1- Qui correspond a la cinematic_id
    // 2- Qui soit le plus grand possible
    // 3- Avec un time < elapsed_time (sinon on reste toujours au meme)
    Position const* tmpBestPos = NULL;
    uint32 tmpBestTimer  = 0;
    std::vector<CinematicWaypointEntry>::const_iterator it;
    for (it = m_CinematicWaypoints.begin(); it != m_CinematicWaypoints.end(); ++it)
    {
        if (cinematicId == it->cinematic_id)
        {
            if (it->time < elapsed_time)
            {
                if (it->time > tmpBestTimer)
                {
                    tmpBestTimer = it->time;
                    tmpBestPos   = &(it->position);
                }
            }
        }
    }
    return tmpBestPos;
}

Position const* ObjectMgr::GetCinematicInitialPosition(uint32 cinematicId)
{
    std::vector<CinematicWaypointEntry>::const_iterator it;
    for (it = m_CinematicWaypoints.begin(); it != m_CinematicWaypoints.end(); ++it)
    {
        if (cinematicId == it->cinematic_id)
        {
            if (it->time == 0)
                return &(it->position);
        }
    }
    // Non trouve
    sLog.outError("Impossible de trouver le point de depart de la cinematique %u", cinematicId);
    return NULL;
}

// Systeme de phasing
// ALTER TABLE characters ADD COLUMN world_phase_mask int(11) unsigned not null default 0;
void ObjectMgr::LoadPlayerPhaseFromDb()
{
    m_PlayerPhases.clear();

    QueryResult* result = CharacterDatabase.Query("SELECT guid, world_phase_mask FROM characters");

    uint32 total_count = 0;

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded %u characters phases", total_count);
        return;
    }

    Field* fields;
    do
    {
        fields = result->Fetch();

        uint32 guid = fields[0].GetUInt32();
        uint32 mask = fields[1].GetUInt32();
        m_PlayerPhases[guid] = mask;
        ++total_count;
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u character phases", total_count);
    delete result;
}

uint32 ObjectMgr::GetPlayerWorldMaskByGUID(const uint64 guid)
{
    return m_PlayerPhases[GUID_LOPART(guid)];
}
void ObjectMgr::SetPlayerWorldMask(const uint64 guid, uint32 newWorldMask)
{
    if (m_PlayerPhases[GUID_LOPART(guid)] == newWorldMask)
        return;

    m_PlayerPhases[GUID_LOPART(guid)] = newWorldMask;
    //CharacterDatabase.PQuery("UPDATE characters SET world_phase_mask = %u WHERE guid = %u", newWorldMask, GUID_LOPART(guid));
}
/*
# Pour le moment dans la DB World. Il serait plus judicieux de la deplacer dans characters ... ?
CREATE TABLE `variables` (
  `index` int(10) unsigned NOT NULL default '0',
  `value` int(10) unsigned NOT NULL default '0',
  `comment` varchar(255),
  PRIMARY KEY  (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
*/
uint32 ObjectMgr::GetSavedVariable(uint32 index, uint32 defaultValue, bool *exist)
{
    SavedVariablesVector::iterator it;
    for (it = m_SavedVariables.begin(); it != m_SavedVariables.end(); ++it)
    {
        if (it->uiIndex == index)
        {
            if (exist)
                (*exist) = true;
            return it->uiValue;
        }
    }
    if (exist)
        (*exist) = false;
    return defaultValue;
}

SavedVariable& ObjectMgr::_InsertVariable(uint32 index, uint32 value, bool saved)
{
    SavedVariable tmp;
    tmp.uiIndex      = index;
    tmp.uiValue      = value;
    tmp.bSavedInDb   = saved;

    m_SavedVariables.push_back(tmp);
    return m_SavedVariables[m_SavedVariables.size()-1];
}

void ObjectMgr::_SaveVariable(const SavedVariable& toSave)
{
    // Must do this in a transaction, else if worker threads > 1 we could do one before the other
    // when order is important...
    WorldDatabase.BeginTransaction();
    WorldDatabase.PExecute("DELETE FROM `variables` WHERE `index` = %u", toSave.uiIndex);
    WorldDatabase.PExecute("INSERT INTO `variables` (`index`, `value`) VALUES (%u, %u)", toSave.uiIndex, toSave.uiValue);
    WorldDatabase.CommitTransaction();
}

void ObjectMgr::InitSavedVariable(uint32 index, uint32 value)
{
    SavedVariablesVector::iterator it;
    // Deja enregistree ?
    for (it = m_SavedVariables.begin(); it != m_SavedVariables.end(); ++it)
        if (it->uiIndex == index)
            return;
    
    // If we are there, it means that the variable does not exist.
    SavedVariable& variable = _InsertVariable(index, value, true);
    _SaveVariable(variable);
}

void ObjectMgr::SetSavedVariable(uint32 index, uint32 value, bool autoSave)
{
    for (auto it = m_SavedVariables.begin(); it != m_SavedVariables.end(); ++it)
    {
        if (it->uiIndex == index)
        {
            // Si la valeur n'a pas change
            if (it->uiValue == value)
                return;

            it->uiValue = value;
            if (autoSave)
                _SaveVariable(*it);
            else
                it->bSavedInDb = false;
            return;
        }
    }
    // Si on est la, c'est que la variable n'existe pas.
    SavedVariable& variable = _InsertVariable(index, value, autoSave);
    if (autoSave)
        _SaveVariable(variable);
}

void ObjectMgr::LoadVariable(uint32 index, uint32* variable, uint32 defaultValue, uint32 maxValue, uint32 minValue)
{
    bool inIndex = false;
    (*variable) = GetSavedVariable(index, defaultValue, &inIndex);
    uint32 originalValue = (*variable);
    if (maxValue != 0 && (*variable) > maxValue)
        (*variable) = defaultValue;
    if ((*variable) < minValue)
        (*variable) = defaultValue;
    if (!inIndex)
        _InsertVariable(index, (*variable), true);
    if (originalValue != (*variable))
        SetSavedVariable(index, (*variable), true);
}
void ObjectMgr::SaveVariables()
{
    SavedVariablesVector::iterator it;
    for (it = m_SavedVariables.begin(); it != m_SavedVariables.end(); ++it)
    {
        if (!it->bSavedInDb)
            _SaveVariable(*it);
    }
}

void ObjectMgr::LoadSavedVariable()
{
    m_SavedVariables.clear();

    QueryResult* result = WorldDatabase.Query("SELECT `index`,`value` FROM variables");

    uint32 total_count = 0;

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded %u saved variables", total_count);
        return;
    }

    Field* fields;
    do
    {
        fields = result->Fetch();
        _InsertVariable(fields[0].GetUInt32(), fields[1].GetUInt32(), true);
        ++total_count;
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u saved variables", total_count);
    delete result;
}

// Mise en cache de donnees des joueurs
void ObjectMgr::LoadPlayerCacheData()
{
    m_playerCacheData.clear();
    m_playerNameToGuid.clear();

    QueryResult* result = CharacterDatabase.Query(
        //      0     1     2      3       4        5     6      7     8    9           10          11          12           13
        "SELECT guid, race, class, gender, account, name, level, zone, map, position_x, position_y, position_z, orientation, taxi_path FROM characters;");

    uint32 total_count = 0;

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> 0 cached player data ...");
        return;
    }

    Field* fields;
    do
    {
        fields = result->Fetch();
        // guid, race, class, gender, account, name
        std::string name = fields[5].GetCppString();
        if (normalizePlayerName(name))
        {
            PlayerCacheData* data = InsertPlayerInCache(fields[0].GetUInt32(), fields[1].GetUInt32(), fields[2].GetUInt32(),
                fields[3].GetUInt32(), fields[4].GetUInt32(), name, fields[6].GetUInt32(), fields[7].GetUInt32());

            UpdatePlayerCachedPosition(data, fields[8].GetUInt32(), fields[9].GetFloat(), fields[10].GetFloat(),
                fields[11].GetFloat(), fields[12].GetFloat(), !fields[13].GetCppString().empty());
        }
        ++total_count;
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u players in cache.", total_count);
    delete result;
}

PlayerCacheData* ObjectMgr::GetPlayerDataByGUID(uint32 guidLow) const
{
    auto itr = m_playerCacheData.find(guidLow);
    if (itr != m_playerCacheData.end())
        return itr->second;
    return nullptr;
}

PlayerCacheData* ObjectMgr::GetPlayerDataByName(const std::string& name) const
{
    if (ObjectGuid guid = GetPlayerGuidByName(name))
        return GetPlayerDataByGUID(guid.GetCounter());
    return nullptr;
}

ObjectGuid ObjectMgr::GetPlayerGuidByName(const std::string& name) const
{
    auto itr = m_playerNameToGuid.find(name);
    if (itr != m_playerNameToGuid.end())
        return ObjectGuid(HIGHGUID_PLAYER, itr->second);
    return ObjectGuid();
}

bool ObjectMgr::GetPlayerNameByGUID(ObjectGuid guid, std::string &name) const
{
    if (auto pData = sObjectMgr.GetPlayerDataByGUID(guid.GetCounter()))
    {
        name = pData->sName;
        return true;
    }
    return false;
}

Team ObjectMgr::GetPlayerTeamByGUID(ObjectGuid guid) const
{
    if (auto player = GetPlayer(guid))
        return Player::TeamForRace(player->getRace());

    if (auto pData = sObjectMgr.GetPlayerDataByGUID(guid.GetCounter()))
        return Player::TeamForRace(pData->uiRace);

    return TEAM_NONE;
}

uint8 ObjectMgr::GetPlayerClassByGUID(ObjectGuid guid) const
{
    // prevent DB access for online player
    if (Player* player = GetPlayer(guid))
    {
        return player->getClass();
    }

    uint32 lowguid = guid.GetCounter();

    if (PlayerCacheData* data = GetPlayerDataByGUID(lowguid))
    {
        return data->uiClass;
    }
    else
    {
        QueryResult* result = CharacterDatabase.PQuery("SELECT class FROM characters WHERE guid = '%u'", lowguid);

        if (result)
        {
            uint8 pClass = (*result)[0].GetUInt8();
            delete result;
            return pClass;
        }
    }
    return 0;
}

uint32 ObjectMgr::GetPlayerAccountIdByGUID(ObjectGuid guid) const
{
    if (auto player = GetPlayer(guid))
        return player->GetSession()->GetAccountId();

    if (auto pData = sObjectMgr.GetPlayerDataByGUID(guid.GetCounter()))
        return pData->uiAccount;

    return 0;
}

uint32 ObjectMgr::GetPlayerAccountIdByPlayerName(const std::string& name) const
{
    if (auto pData = sObjectMgr.GetPlayerDataByName(name))
        return pData->uiAccount;
    return 0;
}

PlayerCacheData* ObjectMgr::InsertPlayerInCache(Player *pPlayer)
{
    auto pSession = pPlayer->GetSession();
    if (!pSession)
        return nullptr;
    auto accountId = pSession->GetAccountId();

    return InsertPlayerInCache(pPlayer->GetGUIDLow(), pPlayer->getRace(), pPlayer->getClass(), pPlayer->getGender(), accountId, pPlayer->GetName(), pPlayer->getLevel(), pPlayer->GetCachedZoneId());
}

void ObjectMgr::UpdatePlayerCachedPosition(Player *pPlayer)
{
    auto iter = m_playerCacheData.find(pPlayer->GetGUIDLow());
    PlayerCacheData* data = nullptr;
    if (iter == m_playerCacheData.end())
        data = InsertPlayerInCache(pPlayer);
    else
        data = iter->second;

    if (!data)
        return;

    UpdatePlayerCachedPosition(data, pPlayer->GetMapId(), pPlayer->GetPositionX(), pPlayer->GetPositionY(),
        pPlayer->GetPositionZ(), pPlayer->GetOrientation(), pPlayer->IsTaxiFlying());
}

void ObjectMgr::UpdatePlayerCachedPosition(uint32 lowGuid, uint32 mapId, float posX, float posY, float posZ, float o, bool inFlight)
{
    auto iter = m_playerCacheData.find(lowGuid);
    if (iter == m_playerCacheData.end())
        return;

    UpdatePlayerCachedPosition(iter->second, mapId, posX, posY, posZ, o, inFlight);
}

void ObjectMgr::UpdatePlayerCachedPosition(PlayerCacheData* data, uint32 mapId, float posX, float posY, float posZ, float o, bool inFlight)
{
    data->uiMapId = mapId;
    data->fPosX = posX;
    data->fPosY = posY;
    data->fPosZ = posZ;
    data->fOrientation = o;
    data->bInFlight = inFlight;
}

void ObjectMgr::UpdatePlayerCache(Player* pPlayer)
{
    auto iter = m_playerCacheData.find(pPlayer->GetGUIDLow());
    PlayerCacheData* data = nullptr;
    if (iter == m_playerCacheData.end())
        data = InsertPlayerInCache(pPlayer);
    else
        data = iter->second;

    if (!data)
        return;
    if (pPlayer->GetSession())
        UpdatePlayerCache(data, pPlayer->getRace(), pPlayer->getClass(), pPlayer->getGender(), pPlayer->GetSession()->GetAccountId(), pPlayer->GetName(), pPlayer->getLevel(), pPlayer->GetCachedZoneId());

    UpdatePlayerCachedPosition(data, pPlayer->GetMapId(), pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), pPlayer->GetOrientation(), pPlayer->IsTaxiFlying());
}

void ObjectMgr::UpdatePlayerCache(PlayerCacheData* data, uint32 race, uint32 _class, uint32 gender, uint32 accountId, const std::string& name, uint32 level, uint32 zoneId)
{
    data->uiAccount = accountId;
    data->uiRace = race;
    data->uiClass = _class;
    data->uiGender = gender;
    data->uiLevel = level;
    data->sName = name;
    data->uiZoneId = zoneId;
}

PlayerCacheData* ObjectMgr::InsertPlayerInCache(uint32 lowGuid, uint32 race, uint32 _class, uint32 gender, uint32 accountId, const std::string& name, uint32 level, uint32 zoneId)
{
    auto data = new PlayerCacheData;
    data->uiGuid = lowGuid;
    UpdatePlayerCache(data, race, _class, gender, accountId, name, level, zoneId);

    m_playerCacheData[lowGuid] = data;
    m_playerNameToGuid[name] = lowGuid;

    return data;
}

void ObjectMgr::DeletePlayerFromCache(uint32 lowGuid)
{
    auto itr = m_playerCacheData.find(lowGuid);
    if (itr != m_playerCacheData.end())
    {
        auto itr2 = m_playerNameToGuid.find(itr->second->sName);
        if (itr2 != m_playerNameToGuid.end())
            m_playerNameToGuid.erase(itr2);
        m_playerCacheData.erase(itr);
    }
}

void ObjectMgr::ChangePlayerNameInCache(uint32 guidLow, const std::string& oldName, const std::string& newName)
{
    auto itr = m_playerCacheData.find(guidLow);
    if (itr != m_playerCacheData.end())
    {
        m_playerNameToGuid.erase(oldName);
        m_playerNameToGuid[newName] = guidLow;
        itr->second->sName = newName;
    }
}

void ObjectMgr::GetPlayerDataForAccount(uint32 accountId, std::list<PlayerCacheData*>& data) const
{
    for (auto iter = m_playerCacheData.cbegin(); iter != m_playerCacheData.cend(); ++iter)
    {
        if (iter->second->uiAccount == accountId)
            data.push_back(iter->second);
    }
}

Group* ObjectMgr::GetGroupById(uint32 id) const
{
    GroupMap::const_iterator itr = mGroupMap.find(id);
    if (itr != mGroupMap.end())
        return itr->second;

    return NULL;
}

Group* ObjectMgr::GetGroupByMember(ObjectGuid memberGuid)
{
    for (GroupMap::const_iterator itr = mGroupMap.begin(); itr != mGroupMap.end(); ++itr)
        if (itr->second->IsMember(memberGuid))
            return itr->second;
    return NULL;
}

CreatureInfo const* ObjectMgr::GetCreatureTemplate(uint32 id)
{
    return sCreatureStorage.LookupEntry<CreatureInfo>(id);
}

void ObjectMgr::LoadCreatureLocales()
{
    mCreatureLocaleMap.clear();                              // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT entry,name_loc1,subname_loc1,name_loc2,subname_loc2,name_loc3,subname_loc3,name_loc4,subname_loc4,name_loc5,subname_loc5,name_loc6,subname_loc6,name_loc7,subname_loc7,name_loc8,subname_loc8 FROM locales_creature");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 creature locale strings. DB table `locales_creature` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 entry = fields[0].GetUInt32();

        if (!GetCreatureTemplate(entry))
        {
            ERROR_DB_STRICT_LOG("Table `locales_creature` has data for not existed creature entry %u, skipped.", entry);
            continue;
        }

        CreatureLocale& data = mCreatureLocaleMap[entry];

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[1 + 2 * (i - 1)].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Name.size() <= idx)
                        data.Name.resize(idx + 1);

                    data.Name[idx] = str;
                }
            }
            str = fields[1 + 2 * (i - 1) + 1].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.SubName.size() <= idx)
                        data.SubName.resize(idx + 1);

                    data.SubName[idx] = str;
                }
            }
        }
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu creature locale strings", (unsigned long)mCreatureLocaleMap.size());
}

void ObjectMgr::LoadGossipMenuItemsLocales()
{
    mGossipMenuItemsLocaleMap.clear();                      // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT menu_id,id,"
                          "option_text_loc1,box_text_loc1,option_text_loc2,box_text_loc2,"
                          "option_text_loc3,box_text_loc3,option_text_loc4,box_text_loc4,"
                          "option_text_loc5,box_text_loc5,option_text_loc6,box_text_loc6,"
                          "option_text_loc7,box_text_loc7,option_text_loc8,box_text_loc8 "
                          "FROM locales_gossip_menu_option");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 gossip_menu_option locale strings. DB table `locales_gossip_menu_option` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint16 menuId   = fields[0].GetUInt16();
        uint16 id       = fields[1].GetUInt16();

        GossipMenuItemsMapBounds bounds = GetGossipMenuItemsMapBounds(menuId);

        bool found = false;
        if (bounds.first != bounds.second)
        {
            for (GossipMenuItemsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
            {
                if (itr->second.id == id)
                {
                    found = true;
                    break;
                }
            }
        }

        if (!found)
        {
            ERROR_DB_STRICT_LOG("Table `locales_gossip_menu_option` has data for nonexistent gossip menu %u item %u, skipped.", menuId, id);
            continue;
        }

        GossipMenuItemsLocale& data = mGossipMenuItemsLocaleMap[MAKE_PAIR32(menuId, id)];

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[2 + 2 * (i - 1)].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.OptionText.size() <= idx)
                        data.OptionText.resize(idx + 1);

                    data.OptionText[idx] = str;
                }
            }
            str = fields[2 + 2 * (i - 1) + 1].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.BoxText.size() <= idx)
                        data.BoxText.resize(idx + 1);

                    data.BoxText[idx] = str;
                }
            }
        }
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu gossip_menu_option locale strings", (unsigned long)mGossipMenuItemsLocaleMap.size());
}

void ObjectMgr::LoadPointOfInterestLocales()
{
    mPointOfInterestLocaleMap.clear();                              // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT entry,icon_name_loc1,icon_name_loc2,icon_name_loc3,icon_name_loc4,icon_name_loc5,icon_name_loc6,icon_name_loc7,icon_name_loc8 FROM locales_points_of_interest");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString("");
        sLog.outString(">> Loaded 0 points_of_interest locale strings. DB table `locales_points_of_interest` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 entry = fields[0].GetUInt32();

        if (!GetPointOfInterest(entry))
        {
            ERROR_DB_STRICT_LOG("Table `locales_points_of_interest` has data for nonexistent POI entry %u, skipped.", entry);
            continue;
        }

        PointOfInterestLocale& data = mPointOfInterestLocaleMap[entry];

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[i].GetCppString();
            if (str.empty())
                continue;

            int idx = GetOrNewIndexForLocale(LocaleConstant(i));
            if (idx >= 0)
            {
                if (data.IconName.size() <= size_t(idx))
                    data.IconName.resize(idx + 1);

                data.IconName[idx] = str;
            }
        }
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u points_of_interest locale strings", mPointOfInterestLocaleMap.size());
}

struct SQLCreatureLoader : public SQLStorageLoaderBase<SQLCreatureLoader, SQLStorage>
{
    template<class D>
    void convert_from_str(uint32 /*field_pos*/, char const* src, D& dst)
    {
        dst = D(sScriptMgr.GetScriptId(src));
    }
};

void ObjectMgr::LoadCreatureTemplates()
{
    SQLCreatureLoader loader;
    loader.LoadProgressive(sCreatureStorage, sWorld.GetWowPatch());

    sLog.outString(">> Loaded %u creature definitions", sCreatureStorage.GetRecordCount());
    sLog.outString();

    CheckCreatureTemplates();
}

void ObjectMgr::CheckCreatureTemplates()
{
    // check data correctness
    for (uint32 i = 1; i < sCreatureStorage.GetMaxEntry(); ++i)
    {
        CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i);
        if (!cInfo)
            continue;

        FactionTemplateEntry const* factionTemplate = GetFactionTemplateEntry(cInfo->faction_A);
        if (!factionTemplate)
            sLog.outErrorDb("Creature (Entry: %u) has nonexistent faction_A template (%u)", cInfo->Entry, cInfo->faction_A);

        factionTemplate = GetFactionTemplateEntry(cInfo->faction_H);
        if (!factionTemplate)
            sLog.outErrorDb("Creature (Entry: %u) has nonexistent faction_H template (%u)", cInfo->Entry, cInfo->faction_H);

        for (int k = 0; k < MAX_KILL_CREDIT; ++k)
        {
            if (cInfo->KillCredit[k])
            {
                if (!GetCreatureTemplate(cInfo->KillCredit[k]))
                {
                    sLog.outErrorDb("Creature (Entry: %u) has nonexistent creature entry in `KillCredit%d` (%u)", cInfo->Entry, k + 1, cInfo->KillCredit[k]);
                    sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `KillCredit%d`=0 WHERE entry=%u;", k + 1, cInfo->Entry);
                    const_cast<CreatureInfo*>(cInfo)->KillCredit[k] = 0;
                }
            }
        }

        // used later for scale
        CreatureDisplayInfoEntry const* displayScaleEntry = NULL;

        for (int i = 0; i < MAX_CREATURE_MODEL; ++i)
        {
            if (cInfo->ModelId[i])
            {
                CreatureDisplayInfoEntry const* displayEntry = sCreatureDisplayInfoStore.LookupEntry(cInfo->ModelId[i]);
                if (!displayEntry)
                {
                    sLog.outErrorDb("Creature (Entry: %u) has nonexistent modelid_%d (%u), can crash client", cInfo->Entry, i + 1, cInfo->ModelId[i]);
                    sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `modelid_%d`=0 WHERE entry=%u;", i + 1, cInfo->Entry);
                    const_cast<CreatureInfo*>(cInfo)->ModelId[i] = 0;
                }
                else if (!displayScaleEntry)
                    displayScaleEntry = displayEntry;

                CreatureModelInfo const* minfo = sCreatureModelStorage.LookupEntry<CreatureModelInfo>(cInfo->ModelId[i]);
                if (!minfo)
                    sLog.outErrorDb("Creature (Entry: %u) are using modelid_%d (%u), but creature_model_info are missing for this model.", cInfo->Entry, i + 1, cInfo->ModelId[i]);
            }
        }

        if (!displayScaleEntry)
            sLog.outErrorDb("Creature (Entry: %u) has nonexistent modelid in modelid_1/modelid_2", cInfo->Entry);

        // use below code for 0-checks for unit_class
        if (!cInfo->unit_class)
            ERROR_DB_STRICT_LOG("Creature (Entry: %u) not has proper unit_class(%u) for creature_template", cInfo->Entry, cInfo->unit_class);
        else if (((1 << (cInfo->unit_class - 1)) & CLASSMASK_ALL_CREATURES) == 0)
            sLog.outErrorDb("Creature (Entry: %u) has invalid unit_class(%u) for creature_template", cInfo->Entry, cInfo->unit_class);

        if (cInfo->dmgschool >= MAX_SPELL_SCHOOL)
        {
            sLog.outErrorDb("Creature (Entry: %u) has invalid spell school value (%u) in `dmgschool`", cInfo->Entry, cInfo->dmgschool);
            sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `dmgschool`=%u WHERE entry=%u;", SPELL_SCHOOL_NORMAL, cInfo->Entry);
            const_cast<CreatureInfo*>(cInfo)->dmgschool = SPELL_SCHOOL_NORMAL;
        }

        if (cInfo->baseattacktime == 0)
        {
            sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `baseattacktime`=%u WHERE entry=%u;", BASE_ATTACK_TIME, cInfo->Entry);
            const_cast<CreatureInfo*>(cInfo)->baseattacktime  = BASE_ATTACK_TIME;
        }

        if (cInfo->rangeattacktime == 0)
        {
            sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `rangeattacktime`=%u WHERE entry=%u;", BASE_ATTACK_TIME, cInfo->Entry);
            const_cast<CreatureInfo*>(cInfo)->rangeattacktime = BASE_ATTACK_TIME;
        }

        if ((cInfo->npcflag & UNIT_NPC_FLAG_TRAINER) && cInfo->trainer_type >= MAX_TRAINER_TYPE)
            sLog.outErrorDb("Creature (Entry: %u) has wrong trainer type %u", cInfo->Entry, cInfo->trainer_type);

        if (cInfo->type && !sCreatureTypeStore.LookupEntry(cInfo->type))
        {
            sLog.outErrorDb("Creature (Entry: %u) has invalid creature type (%u) in `type`", cInfo->Entry, cInfo->type);
            sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `type`=%u WHERE entry=%u;", CREATURE_TYPE_HUMANOID, cInfo->Entry);
            const_cast<CreatureInfo*>(cInfo)->type = CREATURE_TYPE_HUMANOID;
        }

        // must exist or used hidden but used in data horse case
        if (cInfo->family && !sCreatureFamilyStore.LookupEntry(cInfo->family) && cInfo->family != CREATURE_FAMILY_HORSE_CUSTOM)
        {
            sLog.outErrorDb("Creature (Entry: %u) has invalid creature family (%u) in `family`", cInfo->Entry, cInfo->family);
            sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `family`=%u WHERE entry=%u;", 0, cInfo->Entry);
            const_cast<CreatureInfo*>(cInfo)->family = 0;
        }

        if (cInfo->InhabitType <= 0 || cInfo->InhabitType > INHABIT_ANYWHERE)
        {
            sLog.outErrorDb("Creature (Entry: %u) has wrong value (%u) in `InhabitType`, creature will not correctly walk/swim", cInfo->Entry, cInfo->InhabitType);
            sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `InhabitType`=%u WHERE entry=%u;", INHABIT_ANYWHERE, cInfo->Entry);
            const_cast<CreatureInfo*>(cInfo)->InhabitType = INHABIT_ANYWHERE;
        }

        if (cInfo->PetSpellDataId)
        {
            CreatureSpellDataEntry const* spellDataId = sCreatureSpellDataStore.LookupEntry(cInfo->PetSpellDataId);
            if (!spellDataId)
                sLog.outErrorDb("Creature (Entry: %u) has non-existing PetSpellDataId (%u)", cInfo->Entry, cInfo->PetSpellDataId);
        }

        if (cInfo->spells_template)
        {
            CreatureSpellsTemplate const* spellsTemplate = GetCreatureSpellsTemplate((cInfo->spells_template));
            if (!spellsTemplate)
            {
                sLog.outErrorDb("Creature (Entry: %u) has non-existing spells template (%u)", cInfo->Entry, cInfo->spells_template);
                const_cast<CreatureInfo*>(cInfo)->spells_template = 0;
            }
        }

        for (int j = 0; j < CREATURE_MAX_SPELLS; ++j)
        {
            if (cInfo->spells[j] && !sSpellMgr.GetSpellEntry(cInfo->spells[j]))
            {
                sLog.outErrorDb("Creature (Entry: %u) has non-existing Spell%d (%u), set to 0", cInfo->Entry, j + 1, cInfo->spells[j]);
                sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `spell%u`=0 WHERE entry=%u;", j + 1, cInfo->Entry);
                const_cast<CreatureInfo*>(cInfo)->spells[j] = 0;
            }
        }

        if (cInfo->MovementType >= MAX_DB_MOTION_TYPE)
        {
            sLog.outErrorDb("Creature (Entry: %u) has wrong movement generator type (%u), ignore and set to IDLE.", cInfo->Entry, cInfo->MovementType);
            sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `MovementType`=%u WHERE entry=%u;", IDLE_MOTION_TYPE, cInfo->Entry);
            const_cast<CreatureInfo*>(cInfo)->MovementType = IDLE_MOTION_TYPE;
        }

        if (cInfo->equipmentId > 0)                         // 0 no equipment
        {
            if (!GetEquipmentInfo(cInfo->equipmentId) && !GetEquipmentInfoRaw(cInfo->equipmentId))
            {
                sLog.outErrorDb("Table `creature_template` have creature (Entry: %u) with equipment_id %u not found in table `creature_equip_template` or `creature_equip_template_raw`, set to no equipment.", cInfo->Entry, cInfo->equipmentId);
                sLog.out(LOG_DBERRFIX, "UPDATE creature_template SET `equipment_id`=0 WHERE entry=%u;", cInfo->Entry);
                const_cast<CreatureInfo*>(cInfo)->equipmentId = 0;
            }
        }

        if (cInfo->vendorId > 0)
        {
            if (!(cInfo->npcflag & UNIT_NPC_FLAG_VENDOR))
                sLog.outErrorDb("Table `creature_template` have creature (Entry: %u) with vendor_id %u but not have flag UNIT_NPC_FLAG_VENDOR (%u), vendor items will ignored.", cInfo->Entry, cInfo->vendorId, UNIT_NPC_FLAG_VENDOR);
        }

        /// if not set custom creature scale then load scale from CreatureDisplayInfo.dbc
        if (cInfo->scale <= 0.0f)
        {
            if (displayScaleEntry)
                const_cast<CreatureInfo*>(cInfo)->scale = displayScaleEntry->scale;
            else
                const_cast<CreatureInfo*>(cInfo)->scale = DEFAULT_OBJECT_SCALE;
        }
    }
}
void ObjectMgr::ConvertCreatureAddonAuras(CreatureDataAddon* addon, char const* table, char const* guidEntryStr)
{
    // Now add the auras, format "spell1 spell2 ..."
    char *p, *s;
    std::vector<int> val;
    s = p = (char*)reinterpret_cast<char const*>(addon->auras);
    if (p)
    {
        while (p[0] != 0)
        {
            ++p;
            if (p[0] == ' ')
            {
                val.push_back(atoi(s));
                s = ++p;
            }
        }
        if (p != s)
            val.push_back(atoi(s));

        // free char* loaded memory
        delete[](char*)reinterpret_cast<char const*>(addon->auras);
    }

    // empty list
    if (val.empty())
    {
        addon->auras = NULL;
        return;
    }

    // replace by new structures array
    const_cast<uint32*&>(addon->auras) = new uint32[val.size() + 1];

    uint32 i = 0;
    for (uint32 j = 0; j < val.size(); ++j)
    {
        uint32& cAura = const_cast<uint32&>(addon->auras[i]);
        cAura = uint32(val[j]);

        SpellEntry const *AdditionalSpellInfo = sSpellMgr.GetSpellEntry(cAura);
        if (!AdditionalSpellInfo)
        {
            sLog.outErrorDb("Creature (%s: %u) has wrong spell %u defined in `auras` field in `%s`.", guidEntryStr, addon->guidOrEntry, cAura, table);
            continue;
        }

        if (std::find(&addon->auras[0], &addon->auras[i], cAura) != &addon->auras[i])
        {
            sLog.outErrorDb("Creature (%s: %u) has duplicate spell %u defined in `auras` field in `%s`.", guidEntryStr, addon->guidOrEntry, cAura, table);
            continue;
        }

        ++i;
    }

    // fill terminator element (after last added)
    const_cast<uint32&>(addon->auras[i]) = 0;
}

void ObjectMgr::LoadCreatureAddons(SQLStorage& creatureaddons, char const* entryName, char const* comment)
{
    creatureaddons.LoadProgressive(sWorld.GetWowPatch());

    sLog.outString(">> Loaded %u %s", creatureaddons.GetRecordCount(), comment);
    sLog.outString();

    // check data correctness and convert 'auras'
    for (uint32 i = 1; i < creatureaddons.GetMaxEntry(); ++i)
    {
        CreatureDataAddon const* addon = creatureaddons.LookupEntry<CreatureDataAddon>(i);
        if (!addon)
            continue;

        if (addon->mount)
        {
            if (!sCreatureDisplayInfoStore.LookupEntry(addon->mount))
            {
                sLog.outErrorDb("Creature (%s %u) have invalid displayInfoId for mount (%u) defined in `%s`.", entryName, addon->guidOrEntry, addon->mount, creatureaddons.GetTableName());
                const_cast<CreatureDataAddon*>(addon)->mount = 0;
            }
        }

        if (addon->sheath_state > SHEATH_STATE_RANGED)
            sLog.outErrorDb("Creature (%s %u) has unknown sheath state (%u) defined in `%s`.", entryName, addon->guidOrEntry, addon->sheath_state, creatureaddons.GetTableName());

        if (!sEmotesStore.LookupEntry(addon->emote))
        {
            sLog.outErrorDb("Creature (%s %u) have invalid emote (%u) defined in `%s`.", entryName, addon->guidOrEntry, addon->emote, creatureaddons.GetTableName());
            const_cast<CreatureDataAddon*>(addon)->emote = 0;
        }

        ConvertCreatureAddonAuras(const_cast<CreatureDataAddon*>(addon), creatureaddons.GetTableName(), entryName);
    }
}

void ObjectMgr::LoadCreatureAddons()
{
    LoadCreatureAddons(sCreatureInfoAddonStorage, "Entry", "creature template addons");

    // check entry ids
    for (uint32 i = 1; i < sCreatureInfoAddonStorage.GetMaxEntry(); ++i)
        if (CreatureDataAddon const* addon = sCreatureInfoAddonStorage.LookupEntry<CreatureDataAddon>(i))
            if (!sCreatureStorage.LookupEntry<CreatureInfo>(addon->guidOrEntry))
                sLog.outErrorDb("Creature (Entry: %u) does not exist but has a record in `%s`", addon->guidOrEntry, sCreatureInfoAddonStorage.GetTableName());

    LoadCreatureAddons(sCreatureDataAddonStorage, "GUID", "creature addons");

    // check entry ids
    for (uint32 i = 1; i < sCreatureDataAddonStorage.GetMaxEntry(); ++i)
        if (CreatureDataAddon const* addon = sCreatureDataAddonStorage.LookupEntry<CreatureDataAddon>(i))
            if (mCreatureDataMap.find(addon->guidOrEntry) == mCreatureDataMap.end())
                if (!sObjectMgr.IsExistingCreatureGuid(addon->guidOrEntry))
                    sLog.outErrorDb("Creature (GUID: %u) does not exist but has a record in `creature_addon`", addon->guidOrEntry);
}

EquipmentInfo const* ObjectMgr::GetEquipmentInfo(uint32 entry)
{
    return sEquipmentStorage.LookupEntry<EquipmentInfo>(entry);
}

EquipmentInfoRaw const* ObjectMgr::GetEquipmentInfoRaw(uint32 entry)
{
    return sEquipmentStorageRaw.LookupEntry<EquipmentInfoRaw>(entry);
}

void ObjectMgr::LoadEquipmentTemplates()
{
    sEquipmentStorage.LoadProgressive(sWorld.GetWowPatch(), true);

    for (uint32 i = 0; i < sEquipmentStorage.GetMaxEntry(); ++i)
    {
        EquipmentInfo const* eqInfo = sEquipmentStorage.LookupEntry<EquipmentInfo>(i);

        if (!eqInfo)
            continue;

        for (uint8 j = 0; j < 3; ++j)
        {
            if (!eqInfo->equipentry[j])
                continue;

            ItemPrototype const *itemProto = GetItemPrototype(eqInfo->equipentry[j]);
            if (!itemProto)
            {
                sLog.outErrorDb("Unknown item (entry=%u) in creature_equip_template.equipentry%u for entry = %u, forced to 0.", eqInfo->equipentry[j], j + 1, i);
                const_cast<EquipmentInfo*>(eqInfo)->equipentry[j] = 0;
                continue;
            }

            if (itemProto->InventoryType != INVTYPE_WEAPON &&
                    itemProto->InventoryType != INVTYPE_SHIELD &&
                    itemProto->InventoryType != INVTYPE_RANGED &&
                    itemProto->InventoryType != INVTYPE_2HWEAPON &&
                    itemProto->InventoryType != INVTYPE_WEAPONMAINHAND &&
                    itemProto->InventoryType != INVTYPE_WEAPONOFFHAND &&
                    itemProto->InventoryType != INVTYPE_HOLDABLE &&
                    itemProto->InventoryType != INVTYPE_THROWN &&
                    itemProto->InventoryType != INVTYPE_RANGEDRIGHT &&
                    itemProto->InventoryType != INVTYPE_RELIC)
            {
                sLog.outErrorDb("Item (entry=%u) in creature_equip_template.equipentry%u for entry = %u is not equipable in a hand, forced to 0.", eqInfo->equipentry[j], j + 1, i);
                const_cast<EquipmentInfo*>(eqInfo)->equipentry[j] = 0;
            }
        }
    }

    sLog.outString(">> Loaded %u equipment template", sEquipmentStorage.GetRecordCount());
    sLog.outString();

    sEquipmentStorageRaw.LoadProgressive(sWorld.GetWowPatch(), false);
    for (uint32 i = 1; i < sEquipmentStorageRaw.GetMaxEntry(); ++i)
        if (sEquipmentStorageRaw.LookupEntry<EquipmentInfoRaw>(i))
            if (sEquipmentStorage.LookupEntry<EquipmentInfo>(i))
                sLog.outErrorDb("Table 'creature_equip_template_raw` have redundant data for ID %u ('creature_equip_template` already have data)", i);

    sLog.outString(">> Loaded %u equipment template (deprecated format)", sEquipmentStorageRaw.GetRecordCount());
    sLog.outString();
}

CreatureModelInfo const* ObjectMgr::GetCreatureModelInfo(uint32 modelid)
{
    return sCreatureModelStorage.LookupEntry<CreatureModelInfo>(modelid);
}

// generally for models having another model for the other team (totems)
uint32 ObjectMgr::GetCreatureModelOtherTeamModel(uint32 modelId)
{
    if (const CreatureModelInfo *modelInfo = GetCreatureModelInfo(modelId))
        return modelInfo->modelid_other_team;

    return 0;
}

CreatureModelInfo const* ObjectMgr::GetCreatureModelRandomGender(uint32 display_id)
{
    CreatureModelInfo const *minfo = GetCreatureModelInfo(display_id);
    if (!minfo)
        return NULL;

    // If a model for another gender exists, 50% chance to use it
    if (minfo->modelid_other_gender != 0 && urand(0, 1) == 0)
    {
        CreatureModelInfo const *minfo_tmp = GetCreatureModelInfo(minfo->modelid_other_gender);
        if (!minfo_tmp)
        {
            sLog.outErrorDb("Model (Entry: %u) has modelid_other_gender %u not found in table `creature_model_info`. ", minfo->modelid, minfo->modelid_other_gender);
            return minfo;                                   // not fatal, just use the previous one
        }
        else
            return minfo_tmp;
    }
    else
        return minfo;
}

void ObjectMgr::LoadCreatureModelInfo()
{
    sCreatureModelStorage.Load();

    // post processing
    for (uint32 i = 1; i < sCreatureModelStorage.GetMaxEntry(); ++i)
    {
        CreatureModelInfo const *minfo = sCreatureModelStorage.LookupEntry<CreatureModelInfo>(i);
        if (!minfo)
            continue;

        if (!sCreatureDisplayInfoStore.LookupEntry(minfo->modelid))
            sLog.outErrorDb("Table `creature_model_info` has model for nonexistent model id (%u).", minfo->modelid);

        if (minfo->gender > GENDER_NONE)
        {
            sLog.outErrorDb("Table `creature_model_info` has invalid gender (%u) for model id (%u).", uint32(minfo->gender), minfo->modelid);
            const_cast<CreatureModelInfo*>(minfo)->gender = GENDER_MALE;
        }

        if (minfo->modelid_other_gender)
        {
            if (minfo->modelid_other_gender == minfo->modelid)
            {
                sLog.outErrorDb("Table `creature_model_info` has redundant modelid_other_gender model (%u) defined for model id %u.", minfo->modelid_other_gender, minfo->modelid);
                const_cast<CreatureModelInfo*>(minfo)->modelid_other_gender = 0;
            }
            else if (!sCreatureDisplayInfoStore.LookupEntry(minfo->modelid_other_gender))
            {
                sLog.outErrorDb("Table `creature_model_info` has nonexistent modelid_other_gender model (%u) defined for model id %u.", minfo->modelid_other_gender, minfo->modelid);
                const_cast<CreatureModelInfo*>(minfo)->modelid_other_gender = 0;
            }
        }

        if (minfo->modelid_other_team)
        {
            if (minfo->modelid_other_team == minfo->modelid)
            {
                sLog.outErrorDb("Table `creature_model_info` has redundant modelid_other_team model (%u) defined for model id %u.", minfo->modelid_other_team, minfo->modelid);
                const_cast<CreatureModelInfo*>(minfo)->modelid_other_team = 0;
            }
            else if (!sCreatureDisplayInfoStore.LookupEntry(minfo->modelid_other_team))
            {
                sLog.outErrorDb("Table `creature_model_info` has nonexistent modelid_other_team model (%u) defined for model id %u.", minfo->modelid_other_team, minfo->modelid);
                const_cast<CreatureModelInfo*>(minfo)->modelid_other_team = 0;
            }
        }
    }

    // character races expected have model info data in table
    for (uint32 race = 1; race < sChrRacesStore.GetNumRows(); ++race)
    {
        ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(race);
        if (!raceEntry)
            continue;

        if (!((1 << (race - 1)) & RACEMASK_ALL_PLAYABLE))
            continue;

        if (CreatureModelInfo const *minfo = GetCreatureModelInfo(raceEntry->model_f))
        {
            if (minfo->gender != GENDER_FEMALE)
                sLog.outErrorDb("Table `creature_model_info` have wrong gender %u for character race %u female model id %u", minfo->gender, race, raceEntry->model_f);

            if (minfo->modelid_other_gender != raceEntry->model_m)
                sLog.outErrorDb("Table `creature_model_info` have wrong other gender model id %u for character race %u female model id %u", minfo->modelid_other_gender, race, raceEntry->model_f);

            if (minfo->bounding_radius <= 0.0f)
            {
                sLog.outErrorDb("Table `creature_model_info` have wrong bounding_radius %f for character race %u female model id %u, use %f instead", minfo->bounding_radius, race, raceEntry->model_f, DEFAULT_WORLD_OBJECT_SIZE);
                const_cast<CreatureModelInfo*>(minfo)->bounding_radius = DEFAULT_WORLD_OBJECT_SIZE;
            }

            if (minfo->combat_reach != 1.5f)
            {
                sLog.outErrorDb("Table `creature_model_info` have wrong combat_reach %f for character race %u female model id %u, expected always 1.5f", minfo->combat_reach, race, raceEntry->model_f);
                const_cast<CreatureModelInfo*>(minfo)->combat_reach = 1.5f;
            }
        }
        else
            sLog.outErrorDb("Table `creature_model_info` expect have data for character race %u female model id %u", race, raceEntry->model_f);

        if (CreatureModelInfo const *minfo = GetCreatureModelInfo(raceEntry->model_m))
        {
            if (minfo->gender != GENDER_MALE)
                sLog.outErrorDb("Table `creature_model_info` have wrong gender %u for character race %u male model id %u", minfo->gender, race, raceEntry->model_m);

            if (minfo->modelid_other_gender != raceEntry->model_f)
                sLog.outErrorDb("Table `creature_model_info` have wrong other gender model id %u for character race %u male model id %u", minfo->modelid_other_gender, race, raceEntry->model_m);

            if (minfo->bounding_radius <= 0.0f)
            {
                sLog.outErrorDb("Table `creature_model_info` have wrong bounding_radius %f for character race %u male model id %u, use %f instead", minfo->bounding_radius, race, raceEntry->model_f, DEFAULT_WORLD_OBJECT_SIZE);
                const_cast<CreatureModelInfo*>(minfo)->bounding_radius = DEFAULT_WORLD_OBJECT_SIZE;
            }

            if (minfo->combat_reach != 1.5f)
            {
                sLog.outErrorDb("Table `creature_model_info` have wrong combat_reach %f for character race %u male model id %u, expected always 1.5f", minfo->combat_reach, race, raceEntry->model_m);
                const_cast<CreatureModelInfo*>(minfo)->combat_reach = 1.5f;
            }
        }
        else
            sLog.outErrorDb("Table `creature_model_info` expect have data for character race %u male model id %u", race, raceEntry->model_m);

    }

    sLog.outString(">> Loaded %u creature model based info", sCreatureModelStorage.GetRecordCount());
    sLog.outString();
}

void ObjectMgr::LoadCreatureSpells()
{
    // First we need to collect all script ids.
    std::set<uint32> spellScriptSet;

    QueryResult *result = WorldDatabase.Query("SELECT id FROM creature_spells_scripts");
    
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();;
            spellScriptSet.insert(id);
        } while (result->NextRow());

        delete result;
    }

    std::set<uint32> spellScriptSetFull = spellScriptSet;

    // Now we load creature_spells.
    mCreatureSpellsMap.clear(); // for reload case

                                 //       0       1           2               3            4               5                  6                 7                  8             9
    result = WorldDatabase.Query("SELECT entry, spellId_1, probability_1, castTarget_1, castFlags_1, delayInitialMin_1, delayInitialMax_1, delayRepeatMin_1, delayRepeatMax_1, scriptId_1, "
                                 //              10           11             12            13              14                15                 16                17             18
                                               "spellId_2, probability_2, castTarget_2, castFlags_2, delayInitialMin_2, delayInitialMax_2, delayRepeatMin_2, delayRepeatMax_2, scriptId_2, "
                                 //              19           20             21            22              23                24                 25                26             27
                                               "spellId_3, probability_3, castTarget_3, castFlags_3, delayInitialMin_3, delayInitialMax_3, delayRepeatMin_3, delayRepeatMax_3, scriptId_3, "
                                 //              28           29             30            31              32                33                 34                35             36
                                               "spellId_4, probability_4, castTarget_4, castFlags_4, delayInitialMin_4, delayInitialMax_4, delayRepeatMin_4, delayRepeatMax_4, scriptId_4, "
                                 //              37           38             39            40              41                42                 43                44             45
                                               "spellId_5, probability_5, castTarget_5, castFlags_5, delayInitialMin_5, delayInitialMax_5, delayRepeatMin_5, delayRepeatMax_5, scriptId_5, "
                                 //              46           47             48            49              50                51                 52                53             54
                                               "spellId_6, probability_6, castTarget_6, castFlags_6, delayInitialMin_6, delayInitialMax_6, delayRepeatMin_6, delayRepeatMax_6, scriptId_6, "
                                 //              55           56             57            58              59                60                 61                62             63
                                               "spellId_7, probability_7, castTarget_7, castFlags_7, delayInitialMin_7, delayInitialMax_7, delayRepeatMin_7, delayRepeatMax_7, scriptId_7, "
                                 //              64           65             66            67              68                69                 70                71             72
                                               "spellId_8, probability_8, castTarget_8, castFlags_8, delayInitialMin_8, delayInitialMax_8, delayRepeatMin_8, delayRepeatMax_8, scriptId_8 FROM creature_spells");
    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString(">> Loaded 0 creature spell templates. DB table `creature_spells` is empty.");
        return;
    }


    BarGoLink bar(result->GetRowCount());

    do
    {
        Field* fields = result->Fetch();
        bar.step();

        uint32 entry = fields[0].GetUInt32();;

        CreatureSpellsTemplate spellsTemplate;

        for (uint8 i = 0; i < 8; i++)
        {
            uint16 spellId = fields[1 + i * 9].GetUInt16();
            if (spellId)
            {
                if (!sSpellMgr.GetSpellEntry(spellId))
                {
                    sLog.outErrorDb("Entry %u in table `creature_spells` has non-existent spell %u used as spellId_%u, skipping spell.", entry, spellId, i);
                    continue;
                }

                uint8 probability      = fields[2 + i * 9].GetUInt8();

                if ((probability == 0) || (probability > 100))
                {
                    sLog.outErrorDb("Entry %u in table `creature_spells` has invalid probability_%u value %u, setting it to 100 instead.", entry, i, probability);
                    probability = 100;
                }

                uint8 castTarget       = fields[3 + i * 9].GetUInt8();
                uint8 castFlags        = fields[4 + i * 9].GetUInt8();

                // in the database we store timers as seconds
                // based on screenshot of blizzard creature spells editor
                uint32 delayInitialMin = fields[5 + i * 9].GetUInt16() * IN_MILLISECONDS;
                uint32 delayInitialMax = fields[6 + i * 9].GetUInt16() * IN_MILLISECONDS;

                if (delayInitialMin > delayInitialMax)
                {
                    sLog.outErrorDb("Entry %u in table `creature_spells` has invalid initial timers (Min_%u = %u, Max_%u = %u), skipping spell.", entry, i, delayInitialMin, i, delayInitialMax);
                    continue;
                }

                uint32 delayRepeatMin  = fields[7 + i * 9].GetUInt16() * IN_MILLISECONDS;
                uint32 delayRepeatMax  = fields[8 + i * 9].GetUInt16() * IN_MILLISECONDS;

                if (delayRepeatMin > delayRepeatMax)
                {
                    sLog.outErrorDb("Entry %u in table `creature_spells` has invalid repeat timers (Min_%u = %u, Max_%u = %u), skipping spell.", entry, i, delayRepeatMin, i, delayRepeatMax);
                    continue;
                }

                uint32 scriptId = fields[9 + i * 9].GetUInt32();

                if (scriptId)
                {
                    if (spellScriptSetFull.find(scriptId) == spellScriptSetFull.end())
                    {
                        sLog.outErrorDb("Entry %u in table `creature_spells` has non-existent scriptId_%u = %u, setting it to 0 instead.", entry, i, scriptId);
                        scriptId = 0;
                    }
                    else
                        spellScriptSet.erase(scriptId);
                }

                spellsTemplate.emplace_back(spellId, probability, castTarget, castFlags, delayInitialMin, delayInitialMax, delayRepeatMin, delayRepeatMax, scriptId);
            }
        }

        if (!spellsTemplate.empty())
            mCreatureSpellsMap.insert(CreatureSpellsMap::value_type(entry, spellsTemplate));

    } while (result->NextRow());

    delete result;

    for (std::set<uint32>::const_iterator itr = spellScriptSet.begin(); itr != spellScriptSet.end(); ++itr)
        sLog.outErrorDb("Table `creature_spells_scripts` contains unused script, id %u.", *itr);

    sLog.outString(">> Loaded %lu creature spell templates.", (unsigned long)mCreatureSpellsMap.size());
    sLog.outString();
}

void ObjectMgr::LoadCreatures(bool reload)
{
    uint32 count = 0;
    //                                                0                       1   2    3
    QueryResult *result = WorldDatabase.Query("SELECT creature.guid, creature.id, map, modelid,"
                          //   4             5           6           7            8               9                10            11            12
                          "equipment_id, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, spawndist, currentwaypoint,"
                          //   13         14       15          16          17
                          "curhealth, curmana, DeathState, MovementType, event,"
                          //   18                        19                                 20          21                  22                 23
                          "pool_creature.pool_entry, pool_creature_template.pool_entry, spawnFlags, visibilitymod, creature.patch_min, creature.patch_max  "
                          "FROM creature "
                          "LEFT OUTER JOIN game_event_creature ON creature.guid = game_event_creature.guid "
                          "LEFT OUTER JOIN pool_creature ON creature.guid = pool_creature.guid "
                          "LEFT OUTER JOIN pool_creature_template ON creature.id = pool_creature_template.id");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 creature. DB table `creature` is empty.");
        return;
    }

    // build single time for check creature data

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 guid         = fields[ 0].GetUInt32();
        uint32 entry        = fields[ 1].GetUInt32();
        uint8 patch_min     = fields[22].GetUInt8();
        uint8 patch_max     = fields[23].GetUInt8();
        bool existsInPatch  = true;

        if ((patch_min > patch_max) || (patch_max > 10))
        {
            sLog.outErrorDb("Table `creature` GUID %u (entry %u) has invalid values min_patch=%u, max_patch=%u.", guid, entry, patch_min, patch_max);
            sLog.out(LOG_DBERRFIX, "UPDATE creature SET min_patch=0, max_patch=10 WHERE guid=%u AND id=%u;", guid, entry);
            patch_min = 0;
            patch_max = 10;
        }

        if (!((sWorld.GetWowPatch() >= patch_min) && (sWorld.GetWowPatch() <= patch_max)))
            existsInPatch = false;

        CreatureInfo const* cInfo = GetCreatureTemplate(entry);
        if (!cInfo)
        {
            if (existsInPatch) // don't print error when it is not loaded for the current patch
            {
                sLog.outErrorDb("Table `creature` has creature (GUID: %u) with non existing creature entry %u, skipped.", guid, entry);
                sLog.out(LOG_DBERRFIX, "DELETE FROM creature WHERE guid=%u;", guid);
            }
            continue;
        }

        bool alreadyPresent = reload && mCreatureDataMap.find(guid) != mCreatureDataMap.end();
        CreatureData& data = mCreatureDataMap[guid];

        data.id                 = entry;
        data.mapid              = fields[ 2].GetUInt32();
        data.modelid_override   = fields[ 3].GetUInt32();
        data.equipmentId        = fields[ 4].GetUInt32();
        data.posX               = fields[ 5].GetFloat();
        data.posY               = fields[ 6].GetFloat();
        data.posZ               = fields[ 7].GetFloat();
        data.orientation        = fields[ 8].GetFloat();
        data.spawntimesecsmin   = fields[ 9].GetUInt32();
        data.spawntimesecsmax   = fields[10].GetUInt32();
        data.spawndist          = fields[11].GetFloat();
        data.currentwaypoint    = fields[12].GetUInt32();
        data.curhealth          = fields[13].GetUInt32();
        data.curmana            = fields[14].GetUInt32();
        data.is_dead            = fields[15].GetBool();
        data.movementType       = fields[16].GetUInt8();
        data.spawnFlags         = fields[20].GetUInt32();
        data.visibilityModifier = fields[21].GetFloat();
        data.instanciatedContinentInstanceId = sMapMgr.GetContinentInstanceId(data.mapid, data.posX, data.posY);
        int16 gameEvent         = fields[17].GetInt16();
        int16 GuidPoolId        = fields[18].GetInt16();
        int16 EntryPoolId       = fields[19].GetInt16();

        MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(data.mapid);
        if (!mapEntry)
        {
            sLog.outErrorDb("Table `creature` have creature (GUID: %u) that spawned at nonexistent map (Id: %u), skipped.", guid, data.mapid);
            sLog.out(LOG_DBERRFIX, "DELETE FROM creature WHERE guid=%u AND id=%u;", guid, data.id);
            continue;
        }

        if (!existsInPatch)
            data.spawnFlags |= SPAWN_FLAG_DISABLED;

        if (data.spawntimesecsmax < data.spawntimesecsmin)
        {
            sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with `spawntimesecsmax` (%u) value lower than `spawntimesecsmin` (%u), it will be adjusted to %u.",
                guid, data.id, uint32(data.spawntimesecsmax), uint32(data.spawntimesecsmin), uint32(data.spawntimesecsmin));
            data.spawntimesecsmax = data.spawntimesecsmin;
        }

        if (data.modelid_override > 0 && !sCreatureDisplayInfoStore.LookupEntry(data.modelid_override))
        {
            sLog.outErrorDb("Table `creature` GUID %u (entry %u) has model for nonexistent model id (%u), set to 0.", guid, data.id, data.modelid_override);
            sLog.out(LOG_DBERRFIX, "UPDATE creature SET modelid=0 WHERE guid=%u AND id=%u;", guid, data.id);
            data.modelid_override = 0;
        }

        if (data.equipmentId > 0)                           // -1 no equipment, 0 use default
        {
            if (!GetEquipmentInfo(data.equipmentId) && !GetEquipmentInfoRaw(data.equipmentId))
            {
                sLog.outErrorDb("Table `creature` have creature (Entry: %u) with equipment_id %u not found in table `creature_equip_template` or `creature_equip_template_raw`, set to no equipment.", data.id, data.equipmentId);
                data.equipmentId = -1;
            }
        }

        if (cInfo->RegenHealth && data.curhealth < cInfo->minhealth)
        {
            sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with `creature_template`.`RegenHealth`=1 and low current health (%u), `creature_template`.`minhealth`=%u.", guid, data.id, data.curhealth, cInfo->minhealth);
            sLog.out(LOG_DBERRFIX, "UPDATE creature SET curhealth=%u WHERE guid=%u AND id=%u;", cInfo->minhealth, guid, data.id);
            data.curhealth = cInfo->minhealth;
        }

        if (cInfo->flags_extra & CREATURE_FLAG_EXTRA_INSTANCE_BIND)
        {
            if (!mapEntry || !mapEntry->IsDungeon())
                sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_INSTANCE_BIND (%u) but creature are not in instance.",
                                guid, data.id, CREATURE_FLAG_EXTRA_INSTANCE_BIND);
        }

        if (cInfo->flags_extra & CREATURE_FLAG_EXTRA_AGGRO_ZONE)
        {
            if (!mapEntry || !mapEntry->IsDungeon())
                sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with `creature_template`.`flags_extra` including CREATURE_FLAG_EXTRA_AGGRO_ZONE (%u) but creature are not in instance.",
                                guid, data.id, CREATURE_FLAG_EXTRA_AGGRO_ZONE);
        }

        if (data.curmana < cInfo->minmana)
        {
            sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with low current mana (%u), `creature_template`.`minmana`=%u.", guid, data.id, data.curmana, cInfo->minmana);
            sLog.out(LOG_DBERRFIX, "UPDATE creature SET curmana=%u WHERE guid=%u AND id=%u;", cInfo->minmana, guid, data.id);
            data.curmana = cInfo->minmana;
        }

        if (data.spawndist < 0.0f)
        {
            sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with `spawndist`< 0, set to 0.", guid, data.id);
            sLog.out(LOG_DBERRFIX, "UPDATE creature SET spawndist=0 WHERE guid=%u AND id=%u;", guid, data.id);
            data.spawndist = 0.0f;
        }
        else if (data.movementType == RANDOM_MOTION_TYPE)
        {
            if (data.spawndist == 0.0f)
            {
                sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with `MovementType`=1 (random movement) but with `spawndist`=0, replace by idle movement type (0).", guid, data.id);
                sLog.out(LOG_DBERRFIX, "UPDATE creature SET MovementType=%u WHERE guid=%u AND id=%u;", IDLE_MOTION_TYPE, guid, data.id);
                data.movementType = IDLE_MOTION_TYPE;
            }
        }
        else if (data.movementType == IDLE_MOTION_TYPE)
        {
            if (data.spawndist != 0.0f)
            {
                sLog.outErrorDb("Table `creature` have creature (GUID: %u Entry: %u) with `MovementType`=0 (idle) have `spawndist`<>0, set to 0.", guid, data.id);
                sLog.out(LOG_DBERRFIX, "UPDATE creature SET spawndist=0 WHERE guid=%u AND id=%u;", guid, data.id);
                data.spawndist = 0.0f;
            }
        }

        if (!alreadyPresent && existsInPatch && gameEvent == 0 && GuidPoolId == 0 && EntryPoolId == 0) // if not this is to be managed by GameEvent System or Pool system
            AddCreatureToGrid(guid, &data);
        ++count;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu creatures", (unsigned long)mCreatureDataMap.size());
}

void ObjectMgr::AddCreatureToGrid(uint32 guid, CreatureData const* data)
{
    CellPair cell_pair = MaNGOS::ComputeCellPair(data->posX, data->posY);
    uint32 cell_id = (cell_pair.y_coord * TOTAL_NUMBER_OF_CELLS_PER_MAP) + cell_pair.x_coord;

    mMapObjectGuids_lock.acquire();
    CellObjectGuids& cell_guids = mMapObjectGuids[data->mapid][cell_id];
    cell_guids.creatures.insert(guid);
    mMapObjectGuids_lock.release();
}

void ObjectMgr::RemoveCreatureFromGrid(uint32 guid, CreatureData const* data)
{
    CellPair cell_pair = MaNGOS::ComputeCellPair(data->posX, data->posY);
    uint32 cell_id = (cell_pair.y_coord * TOTAL_NUMBER_OF_CELLS_PER_MAP) + cell_pair.x_coord;

    mMapObjectGuids_lock.acquire();
    CellObjectGuids& cell_guids = mMapObjectGuids[data->mapid][cell_id];
    cell_guids.creatures.erase(guid);
    mMapObjectGuids_lock.release();
}

void ObjectMgr::LoadGameobjects(bool reload)
{
    uint32 count = 0;

    //                                                0                           1   2    3           4           5           6
    QueryResult *result = WorldDatabase.Query("SELECT gameobject.guid, gameobject.id, map, position_x, position_y, position_z, orientation,"
                          //   7          8          9          10            11                12              13       14      15
                          "rotation0, rotation1, rotation2, rotation3, spawntimesecsmin, spawntimesecsmax, animprogress, state, event, "
                          //   16                          17                                   18          19                20                     21
                          "pool_gameobject.pool_entry, pool_gameobject_template.pool_entry, spawnFlags, visibilitymod, gameobject.patch_min, gameobject.patch_max "
                          "FROM gameobject "
                          "LEFT OUTER JOIN game_event_gameobject ON gameobject.guid = game_event_gameobject.guid "
                          "LEFT OUTER JOIN pool_gameobject ON gameobject.guid = pool_gameobject.guid "
                          "LEFT OUTER JOIN pool_gameobject_template ON gameobject.id = pool_gameobject_template.id");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 gameobjects. DB table `gameobject` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 guid         = fields[ 0].GetUInt32();
        uint32 entry        = fields[ 1].GetUInt32();
        uint8 patch_min     = fields[20].GetUInt8();
        uint8 patch_max     = fields[21].GetUInt8();

        if ((patch_min > patch_max) || (patch_max > 10))
        {
            sLog.outErrorDb("Table `gameobject` GUID %u (entry %u) has invalid values min_patch=%u, max_patch=%u.", guid, entry, patch_min, patch_max);
            sLog.out(LOG_DBERRFIX, "UPDATE gameobject SET min_patch=0, max_patch=10 WHERE guid=%u AND id=%u;", guid, entry);
            patch_min = 0;
            patch_max = 10;
        }

        if (!((sWorld.GetWowPatch() >= patch_min) && (sWorld.GetWowPatch() <= patch_max)))
            continue;

        GameObjectInfo const* gInfo = GetGameObjectInfo(entry);
        if (!gInfo)
        {
            sLog.outErrorDb("Table `gameobject` has gameobject (GUID: %u) with non existing gameobject entry %u, skipped.", guid, entry);
            sLog.out(LOG_DBERRFIX, "DELETE FROM gameobject WHERE guid=%u;", guid);
            continue;
        }

        if (gInfo->displayId && !sGameObjectDisplayInfoStore.LookupEntry(gInfo->displayId))
        {
            sLog.outErrorDb("Gameobject (GUID: %u Entry %u GoType: %u) have invalid displayId (%u), not loaded.", guid, entry, gInfo->type, gInfo->displayId);
            continue;
        }

        bool alreadyPresent = reload && mGameObjectDataMap.find(guid) != mGameObjectDataMap.end();
        GameObjectData& data = mGameObjectDataMap[guid];

        data.id               = entry;
        data.mapid            = fields[ 2].GetUInt32();
        data.posX             = fields[ 3].GetFloat();
        data.posY             = fields[ 4].GetFloat();
        data.posZ             = fields[ 5].GetFloat();
        data.orientation      = fields[ 6].GetFloat();
        data.rotation0        = fields[ 7].GetFloat();
        data.rotation1        = fields[ 8].GetFloat();
        data.rotation2        = fields[ 9].GetFloat();
        data.rotation3        = fields[10].GetFloat();
        data.spawntimesecsmin = fields[11].GetInt32();
        data.spawntimesecsmax = fields[12].GetInt32();
        data.spawnFlags       = fields[18].GetUInt32();
        data.visibilityModifier = fields[19].GetFloat();
        data.instanciatedContinentInstanceId = sMapMgr.GetContinentInstanceId(data.mapid, data.posX, data.posY);

        MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(data.mapid);
        if (!mapEntry)
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) that spawned at nonexistent map (Id: %u), skip", guid, data.id, data.mapid);
            continue;
        }

        if (data.spawntimesecsmin == 0 && gInfo->IsDespawnAtAction())
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with `spawntimesecs` (0) value, but gameobejct marked as despawnable at action.", guid, data.id);

        if (data.spawntimesecsmax < data.spawntimesecsmin)
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with `spawntimesecsmax` (%u) value lower than `spawntimesecsmin` (%u), it will be adjusted to %u.",
                guid, data.id, uint32(data.spawntimesecsmax), uint32(data.spawntimesecsmin), uint32(data.spawntimesecsmin));
            data.spawntimesecsmax = data.spawntimesecsmin;
        }

        data.animprogress   = fields[13].GetUInt32();

        uint32 go_state     = fields[14].GetUInt32();
        if (go_state >= MAX_GO_STATE)
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with invalid `state` (%u) value, skip", guid, data.id, go_state);
            continue;
        }
        data.go_state       = GOState(go_state);

        int16 gameEvent     = fields[15].GetInt16();
        int16 GuidPoolId    = fields[16].GetInt16();
        int16 EntryPoolId   = fields[17].GetInt16();

        if (data.rotation0 < -1.0f || data.rotation0 > 1.0f)
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with invalid rotation0 (%f) value, skip", guid, data.id, data.rotation0);
            continue;
        }

        if (data.rotation1 < -1.0f || data.rotation1 > 1.0f)
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with invalid rotation1 (%f) value, skip", guid, data.id, data.rotation1);
            continue;
        }

        if (data.rotation2 < -1.0f || data.rotation2 > 1.0f)
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with invalid rotation2 (%f) value, skip", guid, data.id, data.rotation2);
            continue;
        }

        if (data.rotation3 < -1.0f || data.rotation3 > 1.0f)
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with invalid rotation3 (%f) value, skip", guid, data.id, data.rotation3);
            continue;
        }

        if (!MapManager::IsValidMapCoord(data.mapid, data.posX, data.posY, data.posZ, data.orientation))
        {
            sLog.outErrorDb("Table `gameobject` have gameobject (GUID: %u Entry: %u) with invalid coordinates, skip", guid, data.id);
            sLog.out(LOG_DBERRFIX, "DELETE FROM gameobject WHERE guid=%u;", guid);
            continue;
        }

        if (!alreadyPresent && gameEvent == 0 && GuidPoolId == 0 && EntryPoolId == 0) // if not this is to be managed by GameEvent System or Pool system
            AddGameobjectToGrid(guid, &data);
        ++count;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu gameobjects", (unsigned long)mGameObjectDataMap.size());
}

void ObjectMgr::AddGameobjectToGrid(uint32 guid, GameObjectData const* data)
{
    CellPair cell_pair = MaNGOS::ComputeCellPair(data->posX, data->posY);
    uint32 cell_id = (cell_pair.y_coord * TOTAL_NUMBER_OF_CELLS_PER_MAP) + cell_pair.x_coord;

    mMapObjectGuids_lock.acquire();
    CellObjectGuids& cell_guids = mMapObjectGuids[data->mapid][cell_id];
    cell_guids.gameobjects.insert(guid);
    mMapObjectGuids_lock.release();
}

void ObjectMgr::RemoveGameobjectFromGrid(uint32 guid, GameObjectData const* data)
{
    CellPair cell_pair = MaNGOS::ComputeCellPair(data->posX, data->posY);
    uint32 cell_id = (cell_pair.y_coord * TOTAL_NUMBER_OF_CELLS_PER_MAP) + cell_pair.x_coord;

    mMapObjectGuids_lock.acquire();
    CellObjectGuids& cell_guids = mMapObjectGuids[data->mapid][cell_id];
    cell_guids.gameobjects.erase(guid);
    mMapObjectGuids_lock.release();
}

// name must be checked to correctness (if received) before call this function
/*
ObjectGuid ObjectMgr::GetPlayerGuidByName(std::string name) const
{
    ObjectGuid guid;

    CharacterDatabase.escape_string(name);

    // Player name safe to sending to DB (checked at login) and this function using
    QueryResult *result = CharacterDatabase.PQuery("SELECT guid FROM characters WHERE name = '%s'", name.c_str());
    if (result)
    {
        guid = ObjectGuid(HIGHGUID_PLAYER, (*result)[0].GetUInt32());

        delete result;
    }

    return guid;
}

bool ObjectMgr::GetPlayerNameByGUID(ObjectGuid guid, std::string &name) const
{
    // prevent DB access for online player
    if(Player* player = GetPlayer(guid))
    {
        name = player->GetName();
        return true;
    }

    uint32 lowguid = guid.GetCounter();

    QueryResult *result = CharacterDatabase.PQuery("SELECT name FROM characters WHERE guid = '%u'", lowguid);

    if(result)
    {
        name = (*result)[0].GetCppString();
        delete result;
        return true;
    }

    return false;
}

Team ObjectMgr::GetPlayerTeamByGUID(ObjectGuid guid) const
{
    // prevent DB access for online player
    if (Player* player = GetPlayer(guid))
        return Player::TeamForRace(player->getRace());

    uint32 lowguid = guid.GetCounter();

    QueryResult *result = CharacterDatabase.PQuery("SELECT race FROM characters WHERE guid = '%u'", lowguid);

    if (result)
    {
        uint8 race = (*result)[0].GetUInt8();
        delete result;
        return Player::TeamForRace(race);
    }

    return TEAM_NONE;
}

uint32 ObjectMgr::GetPlayerAccountIdByGUID(ObjectGuid guid) const
{
    // prevent DB access for online player
    if(Player* player = GetPlayer(guid))
        return player->GetSession()->GetAccountId();

    uint32 lowguid = guid.GetCounter();

    QueryResult *result = CharacterDatabase.PQuery("SELECT account FROM characters WHERE guid = '%u'", lowguid);
    if (result)
    {
        uint32 acc = (*result)[0].GetUInt32();
        delete result;
        return acc;
    }

    return 0;
}

uint32 ObjectMgr::GetPlayerAccountIdByPlayerName(const std::string& name) const
{
    QueryResult *result = CharacterDatabase.PQuery("SELECT account FROM characters WHERE name = '%s'", name.c_str());
    if(result)
    {
        uint32 acc = (*result)[0].GetUInt32();
        delete result;
        return acc;
    }

    return 0;
}*/

void ObjectMgr::LoadItemLocales()
{
    mItemLocaleMap.clear();                                 // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT entry,name_loc1,description_loc1,name_loc2,description_loc2,name_loc3,description_loc3,name_loc4,description_loc4,name_loc5,description_loc5,name_loc6,description_loc6,name_loc7,description_loc7,name_loc8,description_loc8 FROM locales_item");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 Item locale strings. DB table `locales_item` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 entry = fields[0].GetUInt32();

        if (!GetItemPrototype(entry))
        {
            ERROR_DB_STRICT_LOG("Table `locales_item` has data for nonexistent item entry %u, skipped.", entry);
            continue;
        }

        ItemLocale& data = mItemLocaleMap[entry];

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[1 + 2 * (i - 1)].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Name.size() <= idx)
                        data.Name.resize(idx + 1);

                    data.Name[idx] = str;
                }
            }

            str = fields[1 + 2 * (i - 1) + 1].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Description.size() <= idx)
                        data.Description.resize(idx + 1);

                    data.Description[idx] = str;
                }
            }
        }
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu Item locale strings", (unsigned long)mItemLocaleMap.size());
}

struct SQLItemLoader : public SQLStorageLoaderBase<SQLItemLoader, SQLStorage>
{
    template<class D>
    void convert_from_str(uint32 /*field_pos*/, char const* src, D& dst)
    {
        dst = D(sScriptMgr.GetScriptId(src));
    }
};

void ObjectMgr::LoadItemPrototypes()
{
    SQLItemLoader loader;
    loader.LoadProgressive(sItemStorage, sWorld.GetWowPatch());
    mQuestStartingItems.clear();
    sLog.outString(">> Loaded %u item prototypes", sItemStorage.GetRecordCount());
    sLog.outString();

    // check data correctness
    for (uint32 i = 1; i < sItemStorage.GetMaxEntry(); ++i)
    {
        ItemPrototype const* proto = sItemStorage.LookupEntry<ItemPrototype >(i);
        if (!proto)
            continue;

        if (proto->Class >= MAX_ITEM_CLASS)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong Class value (%u)", i, proto->Class);
            const_cast<ItemPrototype*>(proto)->Class = ITEM_CLASS_JUNK;
        }

        if (proto->SubClass >= MaxItemSubclassValues[proto->Class])
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong Subclass value (%u) for class %u", i, proto->SubClass, proto->Class);
            const_cast<ItemPrototype*>(proto)->SubClass = 0;// exist for all item classes
        }

        if (proto->Quality >= MAX_ITEM_QUALITY)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong Quality value (%u)", i, proto->Quality);
            const_cast<ItemPrototype*>(proto)->Quality = ITEM_QUALITY_NORMAL;
        }

        if (proto->BuyCount <= 0)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong BuyCount value (%u), set to default(1).", i, proto->BuyCount);
            const_cast<ItemPrototype*>(proto)->BuyCount = 1;
        }

        if (proto->InventoryType >= MAX_INVTYPE)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong InventoryType value (%u)", i, proto->InventoryType);
            const_cast<ItemPrototype*>(proto)->InventoryType = INVTYPE_NON_EQUIP;
        }

        if (proto->InventoryType != INVTYPE_NON_EQUIP)
        {
            if (proto->Flags & ITEM_FLAG_LOOTABLE)
            {
                sLog.outErrorDb("Item container (Entry: %u) has not allowed for containers flag ITEM_FLAG_LOOTABLE (%u), flag removed.", i, ITEM_FLAG_LOOTABLE);
                const_cast<ItemPrototype*>(proto)->Flags &= ~ITEM_FLAG_LOOTABLE;
            }
        }
        else if (proto->InventoryType != INVTYPE_BAG)
        {
            if (proto->ContainerSlots > 0)
            {
                sLog.outErrorDb("Non-container item (Entry: %u) has ContainerSlots (%u), set to 0.", i, proto->ContainerSlots);
                const_cast<ItemPrototype*>(proto)->ContainerSlots = 0;
            }
        }

        if (proto->RequiredSkill >= MAX_SKILL_TYPE)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong RequiredSkill value (%u)", i, proto->RequiredSkill);
            const_cast<ItemPrototype*>(proto)->RequiredSkill = 0;
        }

        {
            // can be used in equip slot, as page read use in inventory, or spell casting at use
            bool req = proto->InventoryType != INVTYPE_NON_EQUIP || proto->PageText;
            if (!req)
            {
                for (int j = 0; j < MAX_ITEM_PROTO_SPELLS; ++j)
                {
                    if (proto->Spells[j].SpellId)
                    {
                        req = true;
                        break;
                    }
                }
            }

            if (req)
            {
                if (!(proto->AllowableClass & CLASSMASK_ALL_PLAYABLE))
                    sLog.outErrorDb("Item (Entry: %u) not have in `AllowableClass` any playable classes (%u) and can't be equipped or use.", i, proto->AllowableClass);

                if (!(proto->AllowableRace & RACEMASK_ALL_PLAYABLE))
                    sLog.outErrorDb("Item (Entry: %u) not have in `AllowableRace` any playable races (%u) and can't be equipped or use.", i, proto->AllowableRace);
            }
        }

        if (proto->RequiredSpell && !sSpellMgr.GetSpellEntry(proto->RequiredSpell))
        {
            sLog.outErrorDb("Item (Entry: %u) have wrong (nonexistent) spell in RequiredSpell (%u)", i, proto->RequiredSpell);
            const_cast<ItemPrototype*>(proto)->RequiredSpell = 0;
        }

        if (proto->RequiredReputationRank >= MAX_REPUTATION_RANK)
            sLog.outErrorDb("Item (Entry: %u) has wrong reputation rank in RequiredReputationRank (%u), item can't be used.", i, proto->RequiredReputationRank);

        if (proto->RequiredReputationFaction)
        {
            if (!GetFactionEntry(proto->RequiredReputationFaction))
            {
                sLog.outErrorDb("Item (Entry: %u) has wrong (not existing) faction in RequiredReputationFaction (%u)", i, proto->RequiredReputationFaction);
                const_cast<ItemPrototype*>(proto)->RequiredReputationFaction = 0;
            }

            if (proto->RequiredReputationRank == MIN_REPUTATION_RANK)
                sLog.outErrorDb("Item (Entry: %u) has min. reputation rank in RequiredReputationRank (0) but RequiredReputationFaction > 0, faction setting is useless.", i);
        }
        // else if(proto->RequiredReputationRank > MIN_REPUTATION_RANK)
        //    sLog.outErrorDb("Item (Entry: %u) has RequiredReputationFaction ==0 but RequiredReputationRank > 0, rank setting is useless.",i);

        if (proto->Stackable == 0)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong value in stackable (%u), replace by default 1.", i, proto->Stackable);
            const_cast<ItemPrototype*>(proto)->Stackable = 1;
        }
        else if (proto->Stackable > 255)
        {
            sLog.outErrorDb("Item (Entry: %u) has too large value in stackable (%u), replace by hardcoded upper limit (255).", i, proto->Stackable);
            const_cast<ItemPrototype*>(proto)->Stackable = 255;
        }

        if (proto->ContainerSlots)
        {
            if (proto->ContainerSlots > MAX_BAG_SIZE)
            {
                sLog.outErrorDb("Item (Entry: %u) has too large value in ContainerSlots (%u), replace by hardcoded limit (%u).", i, proto->ContainerSlots, MAX_BAG_SIZE);
                const_cast<ItemPrototype*>(proto)->ContainerSlots = MAX_BAG_SIZE;
            }
        }

        for (int j = 0; j < MAX_ITEM_PROTO_STATS; ++j)
        {
            // for ItemStatValue != 0
            if (proto->ItemStat[j].ItemStatValue && proto->ItemStat[j].ItemStatType >= MAX_ITEM_MOD)
            {
                sLog.outErrorDb("Item (Entry: %u) has wrong stat_type%d (%u)", i, j + 1, proto->ItemStat[j].ItemStatType);
                const_cast<ItemPrototype*>(proto)->ItemStat[j].ItemStatType = 0;
            }
        }

        for (int j = 0; j < MAX_ITEM_PROTO_DAMAGES; ++j)
        {
            if (proto->Damage[j].DamageType >= MAX_SPELL_SCHOOL)
            {
                sLog.outErrorDb("Item (Entry: %u) has wrong dmg_type%d (%u)", i, j + 1, proto->Damage[j].DamageType);
                const_cast<ItemPrototype*>(proto)->Damage[j].DamageType = 0;
            }
        }

        // normal spell list
        {
            for (int j = 0; j < MAX_ITEM_PROTO_SPELLS; ++j)
            {
                if (proto->Spells[j].SpellTrigger >= MAX_ITEM_SPELLTRIGGER)
                {
                    sLog.outErrorDb("Item (Entry: %u) has wrong item spell trigger value in spelltrigger_%d (%u)", i, j + 1, proto->Spells[j].SpellTrigger);
                    const_cast<ItemPrototype*>(proto)->Spells[j].SpellId = 0;
                    const_cast<ItemPrototype*>(proto)->Spells[j].SpellTrigger = ITEM_SPELLTRIGGER_ON_USE;
                }
                // on hit can be sued only at weapon
                else if (proto->Spells[j].SpellTrigger == ITEM_SPELLTRIGGER_CHANCE_ON_HIT)
                {
                    if (proto->Class != ITEM_CLASS_WEAPON)
                        sLog.outErrorDb("Item (Entry: %u) isn't weapon (Class: %u) but has on hit spelltrigger_%d (%u), it will not triggered.", i, proto->Class, j + 1, proto->Spells[j].SpellTrigger);
                }

                if (proto->Spells[j].SpellId)
                {
                    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(proto->Spells[j].SpellId);
                    if (!spellInfo)
                    {
                        sLog.outErrorDb("Item (Entry: %u) has wrong (not existing) spell in spellid_%d (%u)", i, j + 1, proto->Spells[j].SpellId);
                        const_cast<ItemPrototype*>(proto)->Spells[j].SpellId = 0;
                    }
                }
            }
        }

        if (proto->Bonding >= MAX_BIND_TYPE)
            sLog.outErrorDb("Item (Entry: %u) has wrong Bonding value (%u)", i, proto->Bonding);

        if (proto->PageText)
        {
            if (!sPageTextStore.LookupEntry<PageText>(proto->PageText))
                sLog.outErrorDb("Item (Entry: %u) has non existing first page (Id:%u)", i, proto->PageText);
        }

        if (proto->LockID && !sLockStore.LookupEntry(proto->LockID))
            sLog.outErrorDb("Item (Entry: %u) has wrong LockID (%u)", i, proto->LockID);

        if (proto->Sheath >= MAX_SHEATHETYPE)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong Sheath (%u)", i, proto->Sheath);
            const_cast<ItemPrototype*>(proto)->Sheath = SHEATHETYPE_NONE;
        }

        if (proto->RandomProperty && !sItemRandomPropertiesStore.LookupEntry(GetItemEnchantMod(proto->RandomProperty)))
        {
            sLog.outErrorDb("Item (Entry: %u) has unknown (wrong or not listed in `item_enchantment_template`) RandomProperty (%u)", i, proto->RandomProperty);
            const_cast<ItemPrototype*>(proto)->RandomProperty = 0;
        }

        if (proto->ItemSet && !sItemSetStore.LookupEntry(proto->ItemSet))
        {
            sLog.outErrorDb("Item (Entry: %u) have wrong ItemSet (%u)", i, proto->ItemSet);
            const_cast<ItemPrototype*>(proto)->ItemSet = 0;
        }

        if (proto->Area && !AreaEntry::GetById(proto->Area))
            sLog.outErrorDb("Item (Entry: %u) has wrong Area (%u)", i, proto->Area);

        if (proto->Map && !sMapStorage.LookupEntry<MapEntry>(proto->Map))
            sLog.outErrorDb("Item (Entry: %u) has wrong Map (%u)", i, proto->Map);

        if (proto->BagFamily)
        {
            ItemBagFamilyEntry const* bf = sItemBagFamilyStore.LookupEntry(proto->BagFamily);
            if (!bf)
            {
                sLog.outErrorDb("Item (Entry: %u) has bag family %u not listed in ItemBagFamily.dbc, setted it to 0", i, proto->BagFamily);
                const_cast<ItemPrototype*>(proto)->BagFamily = 0;
            }
        }

        if (proto->DisenchantID)
        {
            if (proto->Quality > ITEM_QUALITY_EPIC || proto->Quality < ITEM_QUALITY_UNCOMMON)
            {
                sLog.outErrorDb("Item (Entry: %u) has wrong quality (%u) for disenchanting, remove disenchanting loot id.", i, proto->Quality);
                const_cast<ItemPrototype*>(proto)->DisenchantID = 0;
            }
            else if (proto->Class != ITEM_CLASS_WEAPON && proto->Class != ITEM_CLASS_ARMOR)
            {
                sLog.outErrorDb("Item (Entry: %u) has wrong item class (%u) for disenchanting, remove disenchanting loot id.", i, proto->Class);
                const_cast<ItemPrototype*>(proto)->DisenchantID = 0;
            }
        }

        if (proto->FoodType >= MAX_PET_DIET)
        {
            sLog.outErrorDb("Item (Entry: %u) has wrong FoodType value (%u)", i, proto->FoodType);
            const_cast<ItemPrototype*>(proto)->FoodType = 0;
        }

        if (proto->ExtraFlags)
        {
            if (proto->ExtraFlags & ~ITEM_EXTRA_ALL)
                sLog.outErrorDb("Item (Entry: %u) has wrong ExtraFlags (%u) with unused bits set", i, proto->ExtraFlags);

            if (proto->ExtraFlags & ITEM_EXTRA_REAL_TIME_DURATION)
            {
                if (proto->Duration == 0)
                {
                    sLog.outErrorDb("Item (Entry: %u) has redundant real-time duration flag in ExtraFlags, item not have duration", i);
                    const_cast<ItemPrototype*>(proto)->ExtraFlags &= ~ITEM_EXTRA_REAL_TIME_DURATION;
                }
            }
        }


        if (proto->StartQuest > 0)
        // Item starts a quest, insert it into the quest->startItem map
        {
            if (mQuestStartingItems.find(proto->StartQuest) == mQuestStartingItems.end())
                mQuestStartingItems.insert( std::pair<uint32, uint32>(proto->StartQuest, proto->ItemId) );
            else
                sLog.outErrorDb("Item #%u also starts quest #%u.", i, proto->StartQuest);
        }
    }

    // check some dbc referenced items (avoid duplicate reports)
    std::set<uint32> notFoundOutfit;
    for (uint32 i = 1; i < sCharStartOutfitStore.GetNumRows(); ++i)
    {
        CharStartOutfitEntry const* entry = sCharStartOutfitStore.LookupEntry(i);
        if (!entry)
            continue;

        for (int j = 0; j < MAX_OUTFIT_ITEMS; ++j)
        {
            if (entry->ItemId[j] <= 0)
                continue;

            uint32 item_id = entry->ItemId[j];

            if (!GetItemPrototype(item_id))
                notFoundOutfit.insert(item_id);
        }
    }

    for (std::set<uint32>::const_iterator itr = notFoundOutfit.begin(); itr != notFoundOutfit.end(); ++itr)
        sLog.outErrorDb("Item (Entry: %u) not exist in `item_template` but referenced in `CharStartOutfit.dbc`", *itr);
}

void ObjectMgr::LoadItemRequiredTarget()
{
    m_ItemRequiredTarget.clear();                           // needed for reload case

    uint32 count = 0;

    QueryResult *result = WorldDatabase.Query("SELECT entry,type,targetEntry FROM item_required_target");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 ItemRequiredTarget. DB table `item_required_target` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 uiItemId      = fields[0].GetUInt32();
        uint32 uiType        = fields[1].GetUInt32();
        uint32 uiTargetEntry = fields[2].GetUInt32();

        ItemPrototype const* pItemProto = sItemStorage.LookupEntry<ItemPrototype>(uiItemId);

        if (!pItemProto)
        {
            if (!IsExistingItemId(uiItemId))
                sLog.outErrorDb("Table `item_required_target`: Entry %u listed for TargetEntry %u does not exist in `item_template`.", uiItemId, uiTargetEntry);
            continue;
        }

        bool bIsItemSpellValid = false;

        for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        {
            if (SpellEntry const* pSpellInfo = sSpellMgr.GetSpellEntry(pItemProto->Spells[i].SpellId))
            {
                if (pItemProto->Spells[i].SpellTrigger == ITEM_SPELLTRIGGER_ON_USE ||
                        pItemProto->Spells[i].SpellTrigger == ITEM_SPELLTRIGGER_ON_NO_DELAY_USE)
                {
                    SpellScriptTargetBounds bounds = sSpellMgr.GetSpellScriptTargetBounds(pSpellInfo->Id);
                    if (bounds.first != bounds.second)
                        break;

                    for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
                    {
                        if (pSpellInfo->EffectImplicitTargetA[j] == TARGET_CHAIN_DAMAGE ||
                                pSpellInfo->EffectImplicitTargetB[j] == TARGET_CHAIN_DAMAGE ||
                                pSpellInfo->EffectImplicitTargetA[j] == TARGET_UNIT_TARGET_ANY ||
                                pSpellInfo->EffectImplicitTargetB[j] == TARGET_UNIT_TARGET_ANY)
                        {
                            bIsItemSpellValid = true;
                            break;
                        }
                    }
                    if (bIsItemSpellValid)
                        break;
                }
            }
        }

        if (!bIsItemSpellValid)
        {
            sLog.outErrorDb("Table `item_required_target`: Spell used by item %u does not have implicit target TARGET_CHAIN_DAMAGE(6), TARGET_DUELVSPLAYER(25), already listed in `spell_script_target` or doesn't have item spelltrigger.", uiItemId);
            continue;
        }

        if (!uiType || uiType > MAX_ITEM_REQ_TARGET_TYPE)
        {
            sLog.outErrorDb("Table `item_required_target`: Type %u for TargetEntry %u is incorrect.", uiType, uiTargetEntry);
            continue;
        }

        if (!uiTargetEntry)
        {
            sLog.outErrorDb("Table `item_required_target`: TargetEntry == 0 for Type (%u).", uiType);
            continue;
        }

        if (!sCreatureStorage.LookupEntry<CreatureInfo>(uiTargetEntry))
        {
            sLog.outErrorDb("Table `item_required_target`: creature template entry %u does not exist.", uiTargetEntry);
            continue;
        }

        m_ItemRequiredTarget.insert(ItemRequiredTargetMap::value_type(uiItemId, ItemRequiredTarget(ItemRequiredTargetType(uiType), uiTargetEntry)));

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u Item required targets", count);
}

void ObjectMgr::LoadPetLevelInfo()
{
    // Loading levels data
    {
        //                                                 0               1      2   3     4    5    6    7     8    9
        QueryResult *result  = WorldDatabase.Query("SELECT creature_entry, level, hp, mana, str, agi, sta, inte, spi, armor FROM pet_levelstats");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);
            bar.step();

            sLog.outString();
            sLog.outString(">> Loaded %u level pet stats definitions", count);
            sLog.outErrorDb("Error loading `pet_levelstats` table or empty table.");
            return;
        }

        BarGoLink bar(result->GetRowCount());

        do
        {
            Field* fields = result->Fetch();

            uint32 creature_id = fields[0].GetUInt32();
            if (!sCreatureStorage.LookupEntry<CreatureInfo>(creature_id))
            {
                sLog.outErrorDb("Wrong creature id %u in `pet_levelstats` table, ignoring.", creature_id);
                continue;
            }

            uint32 current_level = fields[1].GetUInt32();
            if (current_level > sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
            {
                if (current_level > STRONG_MAX_LEVEL)       // hardcoded level maximum
                    sLog.outErrorDb("Wrong (> %u) level %u in `pet_levelstats` table, ignoring.", STRONG_MAX_LEVEL, current_level);
                else
                {
                    DETAIL_LOG("Unused (> MaxPlayerLevel in mangosd.conf) level %u in `pet_levelstats` table, ignoring.", current_level);
                    ++count;                                // make result loading percent "expected" correct in case disabled detail mode for example.
                }
                continue;
            }
            else if (current_level < 1)
            {
                sLog.outErrorDb("Wrong (<1) level %u in `pet_levelstats` table, ignoring.", current_level);
                continue;
            }

            PetLevelInfo*& pInfoMapEntry = petInfo[creature_id];

            if (pInfoMapEntry == NULL)
                pInfoMapEntry =  new PetLevelInfo[sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL)];

            // data for level 1 stored in [0] array element, ...
            PetLevelInfo* pLevelInfo = &pInfoMapEntry[current_level - 1];

            pLevelInfo->health = fields[2].GetUInt16();
            pLevelInfo->mana   = fields[3].GetUInt16();
            pLevelInfo->armor  = fields[9].GetUInt16();

            for (int i = 0; i < MAX_STATS; i++)
                pLevelInfo->stats[i] = fields[i + 4].GetUInt16();

            bar.step();
            ++count;
        }
        while (result->NextRow());

        delete result;

        sLog.outString();
        sLog.outString(">> Loaded %u level pet stats definitions", count);
    }

    // Fill gaps and check integrity
    for (PetLevelInfoMap::iterator itr = petInfo.begin(); itr != petInfo.end(); ++itr)
    {
        PetLevelInfo* pInfo = itr->second;

        // fatal error if no level 1 data
        if (!pInfo || pInfo[0].health == 0)
        {
            sLog.outErrorDb("Creature %u does not have pet stats data for Level 1!", itr->first);
            Log::WaitBeforeContinueIfNeed();
            exit(1);
        }

        // fill level gaps
        for (uint32 level = 1; level < sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL); ++level)
        {
            if (pInfo[level].health == 0)
            {
                sLog.outErrorDb("Creature %u has no data for Level %i pet stats data, using data of Level %i.", itr->first, level + 1, level);
                pInfo[level] = pInfo[level - 1];
            }
        }
    }
}

PetLevelInfo const* ObjectMgr::GetPetLevelInfo(uint32 creature_id, uint32 level) const
{
    if (level > sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
        level = sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL);

    PetLevelInfoMap::const_iterator itr = petInfo.find(creature_id);
    if (itr == petInfo.end())
        return NULL;

    return &itr->second[level - 1];                         // data for level 1 stored in [0] array element, ...
}

void ObjectMgr::LoadPlayerInfo()
{
    // Load playercreate
    {
        //                                                0     1      2    3     4           5           6
        QueryResult *result = WorldDatabase.Query("SELECT race, class, map, zone, position_x, position_y, position_z, orientation FROM playercreateinfo");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);

            sLog.outString();
            sLog.outString(">> Loaded %u player create definitions", count);
            sLog.outErrorDb("Error loading `playercreateinfo` table or empty table.");
            Log::WaitBeforeContinueIfNeed();
            exit(1);
        }

        BarGoLink bar(result->GetRowCount());

        do
        {
            Field* fields = result->Fetch();

            uint32 current_race  = fields[0].GetUInt32();
            uint32 current_class = fields[1].GetUInt32();
            uint32 mapId         = fields[2].GetUInt32();
            uint32 areaId        = fields[3].GetUInt32();
            float  positionX     = fields[4].GetFloat();
            float  positionY     = fields[5].GetFloat();
            float  positionZ     = fields[6].GetFloat();
            float  orientation   = fields[7].GetFloat();

            ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(current_race);
            if (!rEntry || !((1 << (current_race - 1)) & RACEMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Wrong race %u in `playercreateinfo` table, ignoring.", current_race);
                continue;
            }

            ChrClassesEntry const* cEntry = sChrClassesStore.LookupEntry(current_class);
            if (!cEntry || !((1 << (current_class - 1)) & CLASSMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Wrong class %u in `playercreateinfo` table, ignoring.", current_class);
                continue;
            }

            // accept DB data only for valid position (and non instanceable)
            if (!MapManager::IsValidMapCoord(mapId, positionX, positionY, positionZ, orientation))
            {
                sLog.outErrorDb("Wrong home position for class %u race %u pair in `playercreateinfo` table, ignoring.", current_class, current_race);
                continue;
            }

            if (sMapStorage.LookupEntry<MapEntry>(mapId)->Instanceable())
            {
                sLog.outErrorDb("Home position in instanceable map for class %u race %u pair in `playercreateinfo` table, ignoring.", current_class, current_race);
                continue;
            }

            PlayerInfo* pInfo = &playerInfo[current_race][current_class];

            pInfo->mapId       = mapId;
            pInfo->areaId      = areaId;
            pInfo->positionX   = positionX;
            pInfo->positionY   = positionY;
            pInfo->positionZ   = positionZ;
            pInfo->orientation = orientation;

            pInfo->displayId_m = rEntry->model_m;
            pInfo->displayId_f = rEntry->model_f;

            bar.step();
            ++count;
        }
        while (result->NextRow());

        delete result;

        sLog.outString();
        sLog.outString(">> Loaded %u player create definitions", count);
    }

    // Load playercreate items
    {
        //                                                0     1      2       3
        QueryResult *result = WorldDatabase.Query("SELECT race, class, itemid, amount FROM playercreateinfo_item");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);

            bar.step();

            sLog.outString();
            sLog.outString(">> Loaded %u custom player create items", count);
        }
        else
        {
            BarGoLink bar(result->GetRowCount());

            do
            {
                Field* fields = result->Fetch();

                uint32 current_race = fields[0].GetUInt32();
                uint32 current_class = fields[1].GetUInt32();

                ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(current_race);
                if (!rEntry || !((1 << (current_race - 1)) & RACEMASK_ALL_PLAYABLE))
                {
                    sLog.outErrorDb("Wrong race %u in `playercreateinfo_item` table, ignoring.", current_race);
                    continue;
                }

                ChrClassesEntry const* cEntry = sChrClassesStore.LookupEntry(current_class);
                if (!cEntry || !((1 << (current_class - 1)) & CLASSMASK_ALL_PLAYABLE))
                {
                    sLog.outErrorDb("Wrong class %u in `playercreateinfo_item` table, ignoring.", current_class);
                    continue;
                }

                PlayerInfo* pInfo = &playerInfo[current_race][current_class];

                uint32 item_id = fields[2].GetUInt32();

                if (!GetItemPrototype(item_id))
                {
                    sLog.outErrorDb("Item id %u (race %u class %u) in `playercreateinfo_item` table but not listed in `item_template`, ignoring.", item_id, current_race, current_class);
                    continue;
                }

                uint32 amount  = fields[3].GetUInt32();

                if (!amount)
                {
                    sLog.outErrorDb("Item id %u (class %u race %u) have amount==0 in `playercreateinfo_item` table, ignoring.", item_id, current_race, current_class);
                    continue;
                }

                pInfo->item.push_back(PlayerCreateInfoItem(item_id, amount));

                bar.step();
                ++count;
            }
            while (result->NextRow());

            delete result;

            sLog.outString();
            sLog.outString(">> Loaded %u custom player create items", count);
        }
    }

    // Load playercreate spells
    {
        //                                                0     1      2
        QueryResult *result = WorldDatabase.Query("SELECT race, class, Spell FROM playercreateinfo_spell");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);

            sLog.outString();
            sLog.outString(">> Loaded %u player create spells", count);
            sLog.outErrorDb("Error loading `playercreateinfo_spell` table or empty table.");
        }
        else
        {
            BarGoLink bar(result->GetRowCount());

            do
            {
                Field* fields = result->Fetch();

                uint32 current_race = fields[0].GetUInt32();
                uint32 current_class = fields[1].GetUInt32();

                ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(current_race);
                if (!rEntry || !((1 << (current_race - 1)) & RACEMASK_ALL_PLAYABLE))
                {
                    sLog.outErrorDb("Wrong race %u in `playercreateinfo_spell` table, ignoring.", current_race);
                    continue;
                }

                ChrClassesEntry const* cEntry = sChrClassesStore.LookupEntry(current_class);
                if (!cEntry || !((1 << (current_class - 1)) & CLASSMASK_ALL_PLAYABLE))
                {
                    sLog.outErrorDb("Wrong class %u in `playercreateinfo_spell` table, ignoring.", current_class);
                    continue;
                }

                uint32 spell_id = fields[2].GetUInt32();
                if (!sSpellMgr.GetSpellEntry(spell_id))
                {
                    sLog.outErrorDb("Non existing spell %u in `playercreateinfo_spell` table, ignoring.", spell_id);
                    continue;
                }

                PlayerInfo* pInfo = &playerInfo[current_race][current_class];
                pInfo->spell.push_back(spell_id);

                bar.step();
                ++count;
            }
            while (result->NextRow());

            delete result;

            sLog.outString();
            sLog.outString(">> Loaded %u player create spells", count);
        }
    }

    // Load playercreate actions
    {
        //                                                0     1      2       3       4
        QueryResult *result = WorldDatabase.Query("SELECT race, class, button, action, type FROM playercreateinfo_action");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);

            sLog.outString();
            sLog.outString(">> Loaded %u player create actions", count);
            sLog.outErrorDb("Error loading `playercreateinfo_action` table or empty table.");
        }
        else
        {
            BarGoLink bar(result->GetRowCount());

            do
            {
                Field* fields = result->Fetch();

                uint32 current_race = fields[0].GetUInt32();
                uint32 current_class = fields[1].GetUInt32();

                ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(current_race);
                if (!rEntry || !((1 << (current_race - 1)) & RACEMASK_ALL_PLAYABLE))
                {
                    sLog.outErrorDb("Wrong race %u in `playercreateinfo_action` table, ignoring.", current_race);
                    continue;
                }

                ChrClassesEntry const* cEntry = sChrClassesStore.LookupEntry(current_class);
                if (!cEntry || !((1 << (current_class - 1)) & CLASSMASK_ALL_PLAYABLE))
                {
                    sLog.outErrorDb("Wrong class %u in `playercreateinfo_action` table, ignoring.", current_class);
                    continue;
                }

                uint8 action_button  = fields[2].GetUInt8();
                uint32 action = fields[3].GetUInt32();
                uint8 action_type = fields[4].GetUInt8();

                if (!Player::IsActionButtonDataValid(action_button, action, action_type, NULL))
                    continue;

                PlayerInfo* pInfo = &playerInfo[current_race][current_class];
                pInfo->action.push_back(PlayerCreateInfoAction(action_button, action, action_type));

                bar.step();
                ++count;
            }
            while (result->NextRow());

            delete result;

            sLog.outString();
            sLog.outString(">> Loaded %u player create actions", count);
        }
    }

    // Loading levels data (class only dependent)
    {
        //                                                 0      1      2       3
        QueryResult *result  = WorldDatabase.Query("SELECT class, level, basehp, basemana FROM player_classlevelstats");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);

            sLog.outString();
            sLog.outString(">> Loaded %u level health/mana definitions", count);
            sLog.outErrorDb("Error loading `player_classlevelstats` table or empty table.");
            Log::WaitBeforeContinueIfNeed();
            exit(1);
        }

        BarGoLink bar(result->GetRowCount());

        do
        {
            Field* fields = result->Fetch();

            uint32 current_class = fields[0].GetUInt32();
            if (current_class >= MAX_CLASSES)
            {
                sLog.outErrorDb("Wrong class %u in `player_classlevelstats` table, ignoring.", current_class);
                continue;
            }

            uint32 current_level = fields[1].GetUInt32();
            if (current_level == 0)
            {
                sLog.outErrorDb("Wrong level %u in `player_classlevelstats` table, ignoring.", current_level);
                continue;
            }
            else if (current_level > sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
            {
                if (current_level > STRONG_MAX_LEVEL)       // hardcoded level maximum
                    sLog.outErrorDb("Wrong (> %u) level %u in `player_classlevelstats` table, ignoring.", STRONG_MAX_LEVEL, current_level);
                else
                {
                    DETAIL_LOG("Unused (> MaxPlayerLevel in mangosd.conf) level %u in `player_classlevelstats` table, ignoring.", current_level);
                    ++count;                                // make result loading percent "expected" correct in case disabled detail mode for example.
                }
                continue;
            }

            PlayerClassInfo* pClassInfo = &playerClassInfo[current_class];

            if (!pClassInfo->levelInfo)
                pClassInfo->levelInfo = new PlayerClassLevelInfo[sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL)];

            PlayerClassLevelInfo* pClassLevelInfo = &pClassInfo->levelInfo[current_level - 1];

            pClassLevelInfo->basehealth = fields[2].GetUInt16();
            pClassLevelInfo->basemana   = fields[3].GetUInt16();

            bar.step();
            ++count;
        }
        while (result->NextRow());

        delete result;

        sLog.outString();
        sLog.outString(">> Loaded %u level health/mana definitions", count);
    }

    // Fill gaps and check integrity
    for (int class_ = 0; class_ < MAX_CLASSES; ++class_)
    {
        // skip nonexistent classes
        if (!sChrClassesStore.LookupEntry(class_))
            continue;

        PlayerClassInfo* pClassInfo = &playerClassInfo[class_];

        // fatal error if no level 1 data
        if (!pClassInfo->levelInfo || pClassInfo->levelInfo[0].basehealth == 0)
        {
            sLog.outErrorDb("Class %i Level 1 does not have health/mana data!", class_);
            Log::WaitBeforeContinueIfNeed();
            exit(1);
        }

        // fill level gaps
        for (uint32 level = 1; level < sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL); ++level)
        {
            if (pClassInfo->levelInfo[level].basehealth == 0)
            {
                sLog.outErrorDb("Class %i Level %i does not have health/mana data. Using stats data of level %i.", class_, level + 1, level);
                pClassInfo->levelInfo[level] = pClassInfo->levelInfo[level - 1];
            }
        }
    }

    // Loading levels data (class/race dependent)
    {
        //                                                 0     1      2      3    4    5    6    7
        QueryResult *result  = WorldDatabase.Query("SELECT race, class, level, str, agi, sta, inte, spi FROM player_levelstats");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);

            sLog.outString();
            sLog.outString(">> Loaded %u level stats definitions", count);
            sLog.outErrorDb("Error loading `player_levelstats` table or empty table.");
            Log::WaitBeforeContinueIfNeed();
            exit(1);
        }

        BarGoLink bar(result->GetRowCount());

        do
        {
            Field* fields = result->Fetch();

            uint32 current_race = fields[0].GetUInt32();
            uint32 current_class = fields[1].GetUInt32();

            ChrRacesEntry const* rEntry = sChrRacesStore.LookupEntry(current_race);
            if (!rEntry || !((1 << (current_race - 1)) & RACEMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Wrong race %u in `player_levelstats` table, ignoring.", current_race);
                continue;
            }

            ChrClassesEntry const* cEntry = sChrClassesStore.LookupEntry(current_class);
            if (!cEntry || !((1 << (current_class - 1)) & CLASSMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Wrong class %u in `player_levelstats` table, ignoring.", current_class);
                continue;
            }

            uint32 current_level = fields[2].GetUInt32();
            if (current_level > sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
            {
                if (current_level > STRONG_MAX_LEVEL)       // hardcoded level maximum
                    sLog.outErrorDb("Wrong (> %u) level %u in `player_levelstats` table, ignoring.", STRONG_MAX_LEVEL, current_level);
                else
                {
                    DETAIL_LOG("Unused (> MaxPlayerLevel in mangosd.conf) level %u in `player_levelstats` table, ignoring.", current_level);
                    ++count;                                // make result loading percent "expected" correct in case disabled detail mode for example.
                }
                continue;
            }

            PlayerInfo* pInfo = &playerInfo[current_race][current_class];

            if (!pInfo->levelInfo)
                pInfo->levelInfo = new PlayerLevelInfo[sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL)];

            PlayerLevelInfo* pLevelInfo = &pInfo->levelInfo[current_level - 1];

            for (int i = 0; i < MAX_STATS; ++i)
                pLevelInfo->stats[i] = fields[i + 3].GetUInt8();

            bar.step();
            ++count;
        }
        while (result->NextRow());

        delete result;

        sLog.outString();
        sLog.outString(">> Loaded %u level stats definitions", count);
    }

    // Fill gaps and check integrity
    for (int race = 1; race < MAX_RACES; ++race)
    {
        // skip nonexistent races
        if (!((1 << (race - 1)) & RACEMASK_ALL_PLAYABLE) || !sChrRacesStore.LookupEntry(race))
            continue;

        for (int class_ = 1; class_ < MAX_CLASSES; ++class_)
        {
            // skip nonexistent classes
            if (!((1 << (class_ - 1)) & CLASSMASK_ALL_PLAYABLE) || !sChrClassesStore.LookupEntry(class_))
                continue;

            PlayerInfo* pInfo = &playerInfo[race][class_];

            // skip non loaded combinations
            if (!pInfo->displayId_m || !pInfo->displayId_f)
                continue;

            // fatal error if no level 1 data
            if (!pInfo->levelInfo || pInfo->levelInfo[0].stats[0] == 0)
            {
                sLog.outErrorDb("Race %i Class %i Level 1 does not have stats data!", race, class_);
                Log::WaitBeforeContinueIfNeed();
                exit(1);
            }

            // fill level gaps
            for (uint32 level = 1; level < sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL); ++level)
            {
                if (pInfo->levelInfo[level].stats[0] == 0)
                {
                    sLog.outErrorDb("Race %i Class %i Level %i does not have stats data. Using stats data of level %i.", race, class_, level + 1, level);
                    pInfo->levelInfo[level] = pInfo->levelInfo[level - 1];
                }
            }
        }
    }

    // Loading xp per level data
    {
        mPlayerXPperLevel.resize(sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL));
        for (uint32 level = 0; level < sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL); ++level)
            mPlayerXPperLevel[level] = 0;

        //                                                 0    1
        QueryResult *result  = WorldDatabase.Query("SELECT lvl, xp_for_next_level FROM player_xp_for_level");

        uint32 count = 0;

        if (!result)
        {
            BarGoLink bar(1);

            sLog.outString();
            sLog.outString(">> Loaded %u xp for level definitions", count);
            sLog.outErrorDb("Error loading `player_xp_for_level` table or empty table.");
            Log::WaitBeforeContinueIfNeed();
            exit(1);
        }

        BarGoLink bar(result->GetRowCount());

        do
        {
            Field* fields = result->Fetch();

            uint32 current_level = fields[0].GetUInt32();
            uint32 current_xp    = fields[1].GetUInt32();

            if (current_level >= sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
            {
                if (current_level > STRONG_MAX_LEVEL)       // hardcoded level maximum
                    sLog.outErrorDb("Wrong (> %u) level %u in `player_xp_for_level` table, ignoring.", STRONG_MAX_LEVEL, current_level);
                else
                {
                    DETAIL_LOG("Unused (> MaxPlayerLevel in mangosd.conf) level %u in `player_xp_for_levels` table, ignoring.", current_level);
                    ++count;                                // make result loading percent "expected" correct in case disabled detail mode for example.
                }
                continue;
            }
            //PlayerXPperLevel
            mPlayerXPperLevel[current_level] = current_xp;
            bar.step();
            ++count;
        }
        while (result->NextRow());

        delete result;

        sLog.outString();
        sLog.outString(">> Loaded %u xp for level definitions", count);
    }

    // fill level gaps
    for (uint32 level = 1; level < sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL); ++level)
    {
        if (mPlayerXPperLevel[level] == 0)
        {
            sLog.outErrorDb("Level %i does not have XP for level data. Using data of level [%i] + 100.", level + 1, level);
            mPlayerXPperLevel[level] = mPlayerXPperLevel[level - 1] + 100;
        }
    }
}

void ObjectMgr::GetPlayerClassLevelInfo(uint32 class_, uint32 level, PlayerClassLevelInfo* info) const
{
    if (level < 1 || class_ >= MAX_CLASSES)
        return;

    PlayerClassInfo const* pInfo = &playerClassInfo[class_];

    if (level > sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
        level = sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL);

    *info = pInfo->levelInfo[level - 1];
}

void ObjectMgr::GetPlayerLevelInfo(uint32 race, uint32 class_, uint32 level, PlayerLevelInfo* info) const
{
    if (level < 1 || race   >= MAX_RACES || class_ >= MAX_CLASSES)
        return;

    PlayerInfo const* pInfo = &playerInfo[race][class_];
    if (pInfo->displayId_m == 0 || pInfo->displayId_f == 0)
        return;

    if (level <= sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
        *info = pInfo->levelInfo[level - 1];
    else
        BuildPlayerLevelInfo(race, class_, level, info);
}

void ObjectMgr::BuildPlayerLevelInfo(uint8 race, uint8 _class, uint8 level, PlayerLevelInfo* info) const
{
    // base data (last known level)
    *info = playerInfo[race][_class].levelInfo[sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL) - 1];

    for (int lvl = sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL) - 1; lvl < level; ++lvl)
    {
        switch (_class)
        {
            case CLASS_WARRIOR:
                info->stats[STAT_STRENGTH]  += (lvl > 23 ? 2 : (lvl > 1  ? 1 : 0));
                info->stats[STAT_STAMINA]   += (lvl > 23 ? 2 : (lvl > 1  ? 1 : 0));
                info->stats[STAT_AGILITY]   += (lvl > 36 ? 1 : (lvl > 6 && (lvl % 2) ? 1 : 0));
                info->stats[STAT_INTELLECT] += (lvl > 9 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_SPIRIT]    += (lvl > 9 && !(lvl % 2) ? 1 : 0);
                break;
            case CLASS_PALADIN:
                info->stats[STAT_STRENGTH]  += (lvl > 3  ? 1 : 0);
                info->stats[STAT_STAMINA]   += (lvl > 33 ? 2 : (lvl > 1 ? 1 : 0));
                info->stats[STAT_AGILITY]   += (lvl > 38 ? 1 : (lvl > 7 && !(lvl % 2) ? 1 : 0));
                info->stats[STAT_INTELLECT] += (lvl > 6 && (lvl % 2) ? 1 : 0);
                info->stats[STAT_SPIRIT]    += (lvl > 7 ? 1 : 0);
                break;
            case CLASS_HUNTER:
                info->stats[STAT_STRENGTH]  += (lvl > 4  ? 1 : 0);
                info->stats[STAT_STAMINA]   += (lvl > 4  ? 1 : 0);
                info->stats[STAT_AGILITY]   += (lvl > 33 ? 2 : (lvl > 1 ? 1 : 0));
                info->stats[STAT_INTELLECT] += (lvl > 8 && (lvl % 2) ? 1 : 0);
                info->stats[STAT_SPIRIT]    += (lvl > 38 ? 1 : (lvl > 9 && !(lvl % 2) ? 1 : 0));
                break;
            case CLASS_ROGUE:
                info->stats[STAT_STRENGTH]  += (lvl > 5  ? 1 : 0);
                info->stats[STAT_STAMINA]   += (lvl > 4  ? 1 : 0);
                info->stats[STAT_AGILITY]   += (lvl > 16 ? 2 : (lvl > 1 ? 1 : 0));
                info->stats[STAT_INTELLECT] += (lvl > 8 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_SPIRIT]    += (lvl > 38 ? 1 : (lvl > 9 && !(lvl % 2) ? 1 : 0));
                break;
            case CLASS_PRIEST:
                info->stats[STAT_STRENGTH]  += (lvl > 9 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_STAMINA]   += (lvl > 5  ? 1 : 0);
                info->stats[STAT_AGILITY]   += (lvl > 38 ? 1 : (lvl > 8 && (lvl % 2) ? 1 : 0));
                info->stats[STAT_INTELLECT] += (lvl > 22 ? 2 : (lvl > 1 ? 1 : 0));
                info->stats[STAT_SPIRIT]    += (lvl > 3  ? 1 : 0);
                break;
            case CLASS_SHAMAN:
                info->stats[STAT_STRENGTH]  += (lvl > 34 ? 1 : (lvl > 6 && (lvl % 2) ? 1 : 0));
                info->stats[STAT_STAMINA]   += (lvl > 4 ? 1 : 0);
                info->stats[STAT_AGILITY]   += (lvl > 7 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_INTELLECT] += (lvl > 5 ? 1 : 0);
                info->stats[STAT_SPIRIT]    += (lvl > 4 ? 1 : 0);
                break;
            case CLASS_MAGE:
                info->stats[STAT_STRENGTH]  += (lvl > 9 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_STAMINA]   += (lvl > 5  ? 1 : 0);
                info->stats[STAT_AGILITY]   += (lvl > 9 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_INTELLECT] += (lvl > 24 ? 2 : (lvl > 1 ? 1 : 0));
                info->stats[STAT_SPIRIT]    += (lvl > 33 ? 2 : (lvl > 2 ? 1 : 0));
                break;
            case CLASS_WARLOCK:
                info->stats[STAT_STRENGTH]  += (lvl > 9 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_STAMINA]   += (lvl > 38 ? 2 : (lvl > 3 ? 1 : 0));
                info->stats[STAT_AGILITY]   += (lvl > 9 && !(lvl % 2) ? 1 : 0);
                info->stats[STAT_INTELLECT] += (lvl > 33 ? 2 : (lvl > 2 ? 1 : 0));
                info->stats[STAT_SPIRIT]    += (lvl > 38 ? 2 : (lvl > 3 ? 1 : 0));
                break;
            case CLASS_DRUID:
                info->stats[STAT_STRENGTH]  += (lvl > 38 ? 2 : (lvl > 6 && (lvl % 2) ? 1 : 0));
                info->stats[STAT_STAMINA]   += (lvl > 32 ? 2 : (lvl > 4 ? 1 : 0));
                info->stats[STAT_AGILITY]   += (lvl > 38 ? 2 : (lvl > 8 && (lvl % 2) ? 1 : 0));
                info->stats[STAT_INTELLECT] += (lvl > 38 ? 3 : (lvl > 4 ? 1 : 0));
                info->stats[STAT_SPIRIT]    += (lvl > 38 ? 3 : (lvl > 5 ? 1 : 0));
        }
    }
}

void ObjectMgr::LoadGroups()
{
    // -- loading groups --
    uint32 count = 0;
    //                                                    0         1              2           3           4              5      6      7      8      9      10     11     12     13      14          15
    QueryResult *result = CharacterDatabase.Query("SELECT mainTank, mainAssistant, lootMethod, looterGuid, lootThreshold, icon1, icon2, icon3, icon4, icon5, icon6, icon7, icon8, isRaid, leaderGuid, groupId FROM groups");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u group definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();
        Field *fields = result->Fetch();
        ++count;
        Group *group = new Group;
        if (!group->LoadGroupFromDB(fields))
        {
            group->Disband();
            delete group;
            continue;
        }
        AddGroup(group);
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u group definitions", count);

    // -- loading members --
    count = 0;
    //                                       0           1          2         3
    result = CharacterDatabase.Query("SELECT memberGuid, assistant, subgroup, groupId FROM group_member ORDER BY groupId");
    if (!result)
    {
        BarGoLink bar2(1);
        bar2.step();
    }
    else
    {
        Group* group = NULL;                                // used as cached pointer for avoid relookup group for each member

        BarGoLink bar2(result->GetRowCount());
        do
        {
            bar2.step();
            Field *fields = result->Fetch();
            count++;

            uint32 memberGuidlow = fields[0].GetUInt32();
            ObjectGuid memberGuid = ObjectGuid(HIGHGUID_PLAYER, memberGuidlow);
            bool   assistent     = fields[1].GetBool();
            uint8  subgroup      = fields[2].GetUInt8();
            uint32 groupId       = fields[3].GetUInt32();
            if (!group || group->GetId() != groupId)
            {
                group = GetGroupById(groupId);
                if (!group)
                {
                    sLog.outErrorDb("Incorrect entry in group_member table : no group with Id %d for member %s!",
                                    groupId, memberGuid.GetString().c_str());
                    CharacterDatabase.PExecute("DELETE FROM group_member WHERE memberGuid = '%u'", memberGuidlow);
                    continue;
                }
            }

            if (!group->LoadMemberFromDB(memberGuidlow, subgroup, assistent))
            {
                sLog.outErrorDb("Incorrect entry in group_member table : member %s cannot be added to group (Id: %u)!",
                                memberGuid.GetString().c_str(), groupId);
                CharacterDatabase.PExecute("DELETE FROM group_member WHERE memberGuid = '%u'", memberGuidlow);
            }
        }
        while (result->NextRow());
        delete result;
    }

    // clean groups
    // TODO: maybe delete from the DB before loading in this case
    for (GroupMap::iterator itr = mGroupMap.begin(); itr != mGroupMap.end();)
    {
        if (itr->second->GetMembersCount() < 2)
        {
            itr->second->Disband();
            delete itr->second;
            mGroupMap.erase(itr++);
        }
        else
            ++itr;
    }

    // -- loading instances --
    count = 0;
    result = CharacterDatabase.Query(
                 //      0                          1    2         3          4
                 "SELECT group_instance.leaderGuid, map, instance, permanent, resettime, "
                 // 5
                 "(SELECT COUNT(*) FROM character_instance WHERE guid = group_instance.leaderGuid AND instance = group_instance.instance AND permanent = 1 LIMIT 1), "
                 // 6
                 " groups.groupId "
                 "FROM group_instance LEFT JOIN instance ON instance = id LEFT JOIN groups ON groups.leaderGUID = group_instance.leaderGUID ORDER BY leaderGuid"
             );

    if (!result)
    {
        BarGoLink bar2(1);
        bar2.step();
    }
    else
    {
        Group* group = NULL;                                // used as cached pointer for avoid relookup group for each member

        BarGoLink bar2(result->GetRowCount());
        do
        {
            bar2.step();
            Field *fields = result->Fetch();
            count++;

            uint32 leaderGuidLow = fields[0].GetUInt32();
            uint32 mapId = fields[1].GetUInt32();
            uint32 groupId = fields[6].GetUInt32();

            if (!group || group->GetId() != groupId)
            {
                // find group id in map by leader low guid
                group = GetGroupById(groupId);
                if (!group)
                {
                    sLog.outErrorDb("Incorrect entry in group_instance table : no group with leader %d", leaderGuidLow);
                    continue;
                }
            }

            MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(mapId);
            if (!mapEntry || !mapEntry->IsDungeon())
            {
                sLog.outErrorDb("Incorrect entry in group_instance table : no dungeon map %d", mapId);
                continue;
            }

            DungeonPersistentState *state = (DungeonPersistentState*)sMapPersistentStateMgr.AddPersistentState(mapEntry, fields[2].GetUInt32(), (time_t)fields[4].GetUInt64(), (fields[5].GetUInt32() == 0), true);
            group->BindToInstance(state, fields[3].GetBool(), true);
        }
        while (result->NextRow());
        delete result;
    }

    sLog.outString();
    sLog.outString(">> Loaded %u group-instance binds total", count);

    sLog.outString();
    sLog.outString(">> Loaded %u group members total", count);
}

void ObjectMgr::LoadQuests()
{
    // For reload case
    for (QuestMap::const_iterator itr = mQuestTemplates.begin(); itr != mQuestTemplates.end(); ++itr)
        delete itr->second;

    mQuestTemplates.clear();

    m_ExclusiveQuestGroups.clear();

    //                                                0      1       2           3         4           5     6                7              8              9
    QueryResult *result = WorldDatabase.PQuery("SELECT entry, Method, ZoneOrSort, MinLevel, QuestLevel, Type, RequiredClasses, RequiredRaces, RequiredSkill, RequiredSkillValue,"
                          //   10                   11                 12                     13                   14                     15                   16                17
                          "RepObjectiveFaction, RepObjectiveValue, RequiredMinRepFaction, RequiredMinRepValue, RequiredMaxRepFaction, RequiredMaxRepValue, SuggestedPlayers, LimitTime,"
                          //   18          19            20           21           22              23                24         25            26
                          "QuestFlags, SpecialFlags, PrevQuestId, NextQuestId, ExclusiveGroup, NextQuestInChain, SrcItemId, SrcItemCount, SrcSpell,"
                          //   27     28       29          30               31                32       33              34              35              36
                          "Title, Details, Objectives, OfferRewardText, RequestItemsText, EndText, ObjectiveText1, ObjectiveText2, ObjectiveText3, ObjectiveText4,"
                          //   37          38          39          40          41             42             43             44
                          "ReqItemId1, ReqItemId2, ReqItemId3, ReqItemId4, ReqItemCount1, ReqItemCount2, ReqItemCount3, ReqItemCount4,"
                          //   45            46            47            48            49               50               51               52
                          "ReqSourceId1, ReqSourceId2, ReqSourceId3, ReqSourceId4, ReqSourceCount1, ReqSourceCount2, ReqSourceCount3, ReqSourceCount4,"
                          //   53                  54                  55                  56                  57                     58                     59                     60
                          "ReqCreatureOrGOId1, ReqCreatureOrGOId2, ReqCreatureOrGOId3, ReqCreatureOrGOId4, ReqCreatureOrGOCount1, ReqCreatureOrGOCount2, ReqCreatureOrGOCount3, ReqCreatureOrGOCount4,"
                          //   61             62             63             64
                          "ReqSpellCast1, ReqSpellCast2, ReqSpellCast3, ReqSpellCast4,"
                          //   65                66                67                68                69                70
                          "RewChoiceItemId1, RewChoiceItemId2, RewChoiceItemId3, RewChoiceItemId4, RewChoiceItemId5, RewChoiceItemId6,"
                          //   71                   72                   73                   74                   75                   76
                          "RewChoiceItemCount1, RewChoiceItemCount2, RewChoiceItemCount3, RewChoiceItemCount4, RewChoiceItemCount5, RewChoiceItemCount6,"
                          //   77          78          79          80          81             82             83             84
                          "RewItemId1, RewItemId2, RewItemId3, RewItemId4, RewItemCount1, RewItemCount2, RewItemCount3, RewItemCount4,"
                          //   85              86              87              88              89              90            91            92            93            94
                          "RewRepFaction1, RewRepFaction2, RewRepFaction3, RewRepFaction4, RewRepFaction5, RewRepValue1, RewRepValue2, RewRepValue3, RewRepValue4, RewRepValue5,"
                          //   95             96                97        98            99                 100               101         102     103     104
                          "RewOrReqMoney, RewMoneyMaxLevel, RewSpell, RewSpellCast, RewMailTemplateId, RewMailDelaySecs, PointMapId, PointX, PointY, PointOpt,"
                          //   105            106            107            108            109                 110                 111                 112
                          "DetailsEmote1, DetailsEmote2, DetailsEmote3, DetailsEmote4, DetailsEmoteDelay1, DetailsEmoteDelay2, DetailsEmoteDelay3, DetailsEmoteDelay4,"
                          //   113              114            115                116                117                118
                          "IncompleteEmote, CompleteEmote, OfferRewardEmote1, OfferRewardEmote2, OfferRewardEmote3, OfferRewardEmote4,"
                          //   119                     120                     121                     122
                          "OfferRewardEmoteDelay1, OfferRewardEmoteDelay2, OfferRewardEmoteDelay3, OfferRewardEmoteDelay4,"
                          //   123          124         125
                          "StartScript, CompleteScript, MaxLevel"
                          " FROM quest_template t1 WHERE patch=(SELECT max(patch) FROM quest_template t2 WHERE t1.entry=t2.entry && patch <= %u)", sWorld.GetWowPatch());
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 quests definitions");
        sLog.outErrorDb("`quest_template` table is empty!");
        return;
    }

    // create multimap previous quest for each existing quest
    // some quests can have many previous maps set by NextQuestId in previous quest
    // for example set of race quests can lead to single not race specific quest
    BarGoLink bar(result->GetRowCount());
    do
    {
        bar.step();
        Field *fields = result->Fetch();

        Quest * newQuest = new Quest(fields);
        mQuestTemplates[newQuest->GetQuestId()] = newQuest;
    }
    while (result->NextRow());

    delete result;

    // Post processing

    std::map<uint32, uint32> usedMailTemplates;

    for (QuestMap::iterator iter = mQuestTemplates.begin(); iter != mQuestTemplates.end(); ++iter)
    {
        Quest * qinfo = iter->second;

        // additional quest integrity checks (GO, creature_template and item_template must be loaded already)

        if (qinfo->GetQuestMethod() >= QUEST_METHOD_LIMIT)
            sLog.outErrorDb("Quest %u has `Method` = %u, expected values are 0, 1 or 2.", qinfo->GetQuestId(), qinfo->GetQuestMethod());

        if (qinfo->m_SpecialFlags > QUEST_SPECIAL_FLAG_DB_ALLOWED)
            sLog.outErrorDb("Quest %u has `SpecialFlags` = %u, above max flags not allowed for database.", qinfo->GetQuestId(), qinfo->m_SpecialFlags);

        if (qinfo->HasQuestFlag(QUEST_FLAGS_AUTO_REWARDED))
        {
            // at auto-reward can be rewarded only RewChoiceItemId[0]
            for (int j = 1; j < QUEST_REWARD_CHOICES_COUNT; ++j)
            {
                if (uint32 id = qinfo->RewChoiceItemId[j])
                {
                    sLog.outErrorDb("Quest %u has `RewChoiceItemId%d` = %u but item from `RewChoiceItemId%d` can't be rewarded with quest flag QUEST_FLAGS_AUTO_REWARDED.",
                                    qinfo->GetQuestId(), j + 1, id, j + 1);
                    // no changes, quest ignore this data
                }
            }
        }

        // client quest log visual (area case)
        if (qinfo->ZoneOrSort > 0)
        {
            if (!AreaEntry::GetById(qinfo->ZoneOrSort))
            {
                sLog.outErrorDb("Quest %u has `ZoneOrSort` = %u (zone case) but zone with this id does not exist.",
                                qinfo->GetQuestId(), qinfo->ZoneOrSort);
                // no changes, quest not dependent from this value but can have problems at client
            }
        }
        // client quest log visual (sort case)
        if (qinfo->ZoneOrSort < 0)
        {
            QuestSortEntry const* qSort = sQuestSortStore.LookupEntry(-int32(qinfo->ZoneOrSort));
            if (!qSort)
            {
                sLog.outErrorDb("Quest %u has `ZoneOrSort` = %i (sort case) but quest sort with this id does not exist.",
                                qinfo->GetQuestId(), qinfo->ZoneOrSort);
                // no changes, quest not dependent from this value but can have problems at client (note some may be 0, we must allow this so no check)
            }

            //check for proper RequiredSkill value (skill case)
            if (uint32 skill_id = SkillByQuestSort(-int32(qinfo->ZoneOrSort)))
            {
                if (qinfo->RequiredSkill != skill_id)
                {
                    sLog.outErrorDb("Quest %u has `ZoneOrSort` = %i but `RequiredSkill` does not have a corresponding value (%u).",
                                    qinfo->GetQuestId(), qinfo->ZoneOrSort, skill_id);
                    //override, and force proper value here?
                }
            }
        }

        // RequiredClasses, can be 0/CLASSMASK_ALL_PLAYABLE to allow any class
        if (qinfo->RequiredClasses)
        {
            if (!(qinfo->RequiredClasses & CLASSMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Quest %u does not contain any playable classes in `RequiredClasses` (%u), value set to 0 (all classes).", qinfo->GetQuestId(), qinfo->RequiredClasses);
                qinfo->RequiredClasses = 0;
            }
        }

        // RequiredRaces, can be 0/RACEMASK_ALL_PLAYABLE to allow any race
        if (qinfo->RequiredRaces)
        {
            if (!(qinfo->RequiredRaces & RACEMASK_ALL_PLAYABLE))
            {
                sLog.outErrorDb("Quest %u does not contain any playable races in `RequiredRaces` (%u), value set to 0 (all races).", qinfo->GetQuestId(), qinfo->RequiredRaces);
                qinfo->RequiredRaces = 0;
            }
        }

        // RequiredSkill, can be 0
        if (qinfo->RequiredSkill)
        {
            if (!sSkillLineStore.LookupEntry(qinfo->RequiredSkill))
            {
                sLog.outErrorDb("Quest %u has `RequiredSkill` = %u but this skill does not exist",
                                qinfo->GetQuestId(), qinfo->RequiredSkill);
            }
        }

        if (qinfo->RequiredSkillValue)
        {
            if (qinfo->RequiredSkillValue > sWorld.GetConfigMaxSkillValue())
            {
                sLog.outErrorDb("Quest %u has `RequiredSkillValue` = %u but max possible skill is %u, quest can't be done.",
                                qinfo->GetQuestId(), qinfo->RequiredSkillValue, sWorld.GetConfigMaxSkillValue());
                // no changes, quest can't be done for this requirement
            }
        }
        // else Skill quests can have 0 skill level, this is ok

        if (qinfo->RepObjectiveFaction && !GetFactionEntry(qinfo->RepObjectiveFaction))
        {
            sLog.outErrorDb("Quest %u has `RepObjectiveFaction` = %u but faction template %u does not exist, quest can't be done.",
                            qinfo->GetQuestId(), qinfo->RepObjectiveFaction, qinfo->RepObjectiveFaction);
            // no changes, quest can't be done for this requirement
        }

        if (qinfo->RequiredMinRepFaction && !GetFactionEntry(qinfo->RequiredMinRepFaction))
        {
            sLog.outErrorDb("Quest %u has `RequiredMinRepFaction` = %u but faction template %u does not exist, quest can't be done.",
                            qinfo->GetQuestId(), qinfo->RequiredMinRepFaction, qinfo->RequiredMinRepFaction);
            // no changes, quest can't be done for this requirement
        }

        if (qinfo->RequiredMaxRepFaction && !GetFactionEntry(qinfo->RequiredMaxRepFaction))
        {
            sLog.outErrorDb("Quest %u has `RequiredMaxRepFaction` = %u but faction template %u does not exist, quest can't be done.",
                            qinfo->GetQuestId(), qinfo->RequiredMaxRepFaction, qinfo->RequiredMaxRepFaction);
            // no changes, quest can't be done for this requirement
        }

        if (qinfo->RequiredMinRepValue && qinfo->RequiredMinRepValue > ReputationMgr::Reputation_Cap)
        {
            sLog.outErrorDb("Quest %u has `RequiredMinRepValue` = %d but max reputation is %u, quest can't be done.",
                            qinfo->GetQuestId(), qinfo->RequiredMinRepValue, ReputationMgr::Reputation_Cap);
            // no changes, quest can't be done for this requirement
        }

        if (qinfo->RequiredMinRepValue && qinfo->RequiredMaxRepValue && qinfo->RequiredMaxRepValue <= qinfo->RequiredMinRepValue)
        {
            sLog.outErrorDb("Quest %u has `RequiredMaxRepValue` = %d and `RequiredMinRepValue` = %d, quest can't be done.",
                            qinfo->GetQuestId(), qinfo->RequiredMaxRepValue, qinfo->RequiredMinRepValue);
            // no changes, quest can't be done for this requirement
        }

        if (!qinfo->RepObjectiveFaction && qinfo->RepObjectiveValue > 0)
        {
            sLog.outErrorDb("Quest %u has `RepObjectiveValue` = %d but `RepObjectiveFaction` is 0, value has no effect",
                            qinfo->GetQuestId(), qinfo->RepObjectiveValue);
            // warning
        }

        if (!qinfo->RequiredMinRepFaction && qinfo->RequiredMinRepValue > 0)
        {
            sLog.outErrorDb("Quest %u has `RequiredMinRepValue` = %d but `RequiredMinRepFaction` is 0, value has no effect",
                            qinfo->GetQuestId(), qinfo->RequiredMinRepValue);
            // warning
        }

        if (!qinfo->RequiredMaxRepFaction && qinfo->RequiredMaxRepValue > 0)
        {
            sLog.outErrorDb("Quest %u has `RequiredMaxRepValue` = %d but `RequiredMaxRepFaction` is 0, value has no effect",
                            qinfo->GetQuestId(), qinfo->RequiredMaxRepValue);
            // warning
        }

        if (qinfo->SrcItemId)
        {
            if (!sItemStorage.LookupEntry<ItemPrototype>(qinfo->SrcItemId))
            {
                sLog.outErrorDb("Quest %u has `SrcItemId` = %u but item with entry %u does not exist, quest can't be done.",
                                qinfo->GetQuestId(), qinfo->SrcItemId, qinfo->SrcItemId);
                qinfo->SrcItemId = 0;                       // quest can't be done for this requirement
            }
            else if (qinfo->SrcItemCount == 0)
            {
                sLog.outErrorDb("Quest %u has `SrcItemId` = %u but `SrcItemCount` = 0, set to 1 but need fix in DB.",
                                qinfo->GetQuestId(), qinfo->SrcItemId);
                qinfo->SrcItemCount = 1;                    // update to 1 for allow quest work for backward compatibility with DB
            }
        }
        else if (qinfo->SrcItemCount > 0)
        {
            sLog.outErrorDb("Quest %u has `SrcItemId` = 0 but `SrcItemCount` = %u, useless value.",
                            qinfo->GetQuestId(), qinfo->SrcItemCount);
            qinfo->SrcItemCount = 0;                        // no quest work changes in fact
        }

        if (qinfo->SrcSpell)
        {
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(qinfo->SrcSpell);
            if (!spellInfo)
            {
                sLog.outErrorDb("Quest %u has `SrcSpell` = %u but spell %u doesn't exist, quest can't be done.",
                                qinfo->GetQuestId(), qinfo->SrcSpell, qinfo->SrcSpell);
                qinfo->SrcSpell = 0;                        // quest can't be done for this requirement
            }
            else if (!SpellMgr::IsSpellValid(spellInfo))
            {
                sLog.outErrorDb("Quest %u has `SrcSpell` = %u but spell %u is broken, quest can't be done.",
                                qinfo->GetQuestId(), qinfo->SrcSpell, qinfo->SrcSpell);
                qinfo->SrcSpell = 0;                        // quest can't be done for this requirement
            }
        }

        for (int j = 0; j < QUEST_ITEM_OBJECTIVES_COUNT; ++j)
        {
            if (uint32 id = qinfo->ReqItemId[j])
            {
                if (qinfo->ReqItemCount[j] == 0)
                {
                    sLog.outErrorDb("Quest %u has `ReqItemId%d` = %u but `ReqItemCount%d` = 0, quest can't be done.",
                                    qinfo->GetQuestId(), j + 1, id, j + 1);
                    // no changes, quest can't be done for this requirement
                }

                qinfo->SetSpecialFlag(QUEST_SPECIAL_FLAG_DELIVER);

                if (!sItemStorage.LookupEntry<ItemPrototype>(id))
                {
                    sLog.outErrorDb("Quest %u has `ReqItemId%d` = %u but item with entry %u does not exist, quest can't be done.",
                                    qinfo->GetQuestId(), j + 1, id, id);
                    qinfo->ReqItemCount[j] = 0;             // prevent incorrect work of quest
                }
            }
            else if (qinfo->ReqItemCount[j] > 0)
            {
                sLog.outErrorDb("Quest %u has `ReqItemId%d` = 0 but `ReqItemCount%d` = %u, quest can't be done.",
                                qinfo->GetQuestId(), j + 1, j + 1, qinfo->ReqItemCount[j]);
                qinfo->ReqItemCount[j] = 0;                 // prevent incorrect work of quest
            }
        }

        for (int j = 0; j < QUEST_SOURCE_ITEM_IDS_COUNT; ++j)
        {
            if (uint32 id = qinfo->ReqSourceId[j])
            {
                if (!sItemStorage.LookupEntry<ItemPrototype>(id))
                {
                    sLog.outErrorDb("Quest %u has `ReqSourceId%d` = %u but item with entry %u does not exist, quest can't be done.",
                                    qinfo->GetQuestId(), j + 1, id, id);
                    // no changes, quest can't be done for this requirement
                }
            }
            else
            {
                if (qinfo->ReqSourceCount[j] > 0)
                {
                    sLog.outErrorDb("Quest %u has `ReqSourceId%d` = 0 but `ReqSourceCount%d` = %u.",
                                    qinfo->GetQuestId(), j + 1, j + 1, qinfo->ReqSourceCount[j]);
                    // no changes, quest ignore this data
                }
            }
        }

        for (int j = 0; j < QUEST_OBJECTIVES_COUNT; ++j)
        {
            if (uint32 id = qinfo->ReqSpell[j])
            {
                SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(id);
                if (!spellInfo)
                {
                    sLog.outErrorDb("Quest %u has `ReqSpellCast%d` = %u but spell %u does not exist, quest can't be done.",
                                    qinfo->GetQuestId(), j + 1, id, id);
                    continue;
                }

                if (!qinfo->ReqCreatureOrGOId[j])
                {
                    bool found = false;
                    for (int k = 0; k < MAX_EFFECT_INDEX; ++k)
                    {
                        if ((spellInfo->Effect[k] == SPELL_EFFECT_QUEST_COMPLETE && uint32(spellInfo->EffectMiscValue[k]) == qinfo->QuestId) ||
                                spellInfo->Effect[k] == SPELL_EFFECT_SEND_EVENT)
                        {
                            found = true;
                            break;
                        }
                    }

                    if (found)
                    {
                        if (!qinfo->HasSpecialFlag(QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT))
                        {
                            sLog.outErrorDb("Spell (id: %u) have SPELL_EFFECT_QUEST_COMPLETE or SPELL_EFFECT_SEND_EVENT for quest %u and ReqCreatureOrGOId%d = 0, but quest not have flag QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT. Quest flags or ReqCreatureOrGOId%d must be fixed, quest modified to enable objective.", spellInfo->Id, qinfo->QuestId, j + 1, j + 1);

                            // this will prevent quest completing without objective
                            const_cast<Quest*>(qinfo)->SetSpecialFlag(QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT);
                        }
                    }
                    else
                    {
                        sLog.outErrorDb("Quest %u has `ReqSpellCast%d` = %u and ReqCreatureOrGOId%d = 0 but spell %u does not have SPELL_EFFECT_QUEST_COMPLETE or SPELL_EFFECT_SEND_EVENT effect for this quest, quest can't be done.",
                                        qinfo->GetQuestId(), j + 1, id, j + 1, id);
                        // no changes, quest can't be done for this requirement
                    }
                }
            }
        }

        for (int j = 0; j < QUEST_OBJECTIVES_COUNT; ++j)
        {
            int32 id = qinfo->ReqCreatureOrGOId[j];
            if (id < 0 && !sGOStorage.LookupEntry<GameObjectInfo>(-id))
            {
                sLog.outErrorDb("Quest %u has `ReqCreatureOrGOId%d` = %i but gameobject %u does not exist, quest can't be done.",
                                qinfo->GetQuestId(), j + 1, id, uint32(-id));
                qinfo->ReqCreatureOrGOId[j] = 0;            // quest can't be done for this requirement
            }

            if (id > 0 && !sCreatureStorage.LookupEntry<CreatureInfo>(id))
            {
                sLog.outErrorDb("Quest %u has `ReqCreatureOrGOId%d` = %i but creature with entry %u does not exist, quest can't be done.",
                                qinfo->GetQuestId(), j + 1, id, uint32(id));
                qinfo->ReqCreatureOrGOId[j] = 0;            // quest can't be done for this requirement
            }

            if (id)
            {
                // In fact SpeakTo and Kill are quite same: either you can speak to mob:SpeakTo or you can't:Kill/Cast

                qinfo->SetSpecialFlag(QuestSpecialFlags(QUEST_SPECIAL_FLAG_KILL_OR_CAST | QUEST_SPECIAL_FLAG_SPEAKTO));

                if (!qinfo->ReqCreatureOrGOCount[j])
                {
                    sLog.outErrorDb("Quest %u has `ReqCreatureOrGOId%d` = %u but `ReqCreatureOrGOCount%d` = 0, quest can't be done.",
                                    qinfo->GetQuestId(), j + 1, id, j + 1);
                    // no changes, quest can be incorrectly done, but we already report this
                }
            }
            else if (qinfo->ReqCreatureOrGOCount[j] > 0)
            {
                sLog.outErrorDb("Quest %u has `ReqCreatureOrGOId%d` = 0 but `ReqCreatureOrGOCount%d` = %u.",
                                qinfo->GetQuestId(), j + 1, j + 1, qinfo->ReqCreatureOrGOCount[j]);
                // no changes, quest ignore this data
            }
        }

        bool choice_found = false;
        for (int j = QUEST_REWARD_CHOICES_COUNT - 1; j >= 0; --j)
        {
            if (uint32 id = qinfo->RewChoiceItemId[j])
            {
                if (!sItemStorage.LookupEntry<ItemPrototype>(id))
                {
                    sLog.outErrorDb("Quest %u has `RewChoiceItemId%d` = %u but item with entry %u does not exist, quest will not reward this item.",
                                    qinfo->GetQuestId(), j + 1, id, id);
                    qinfo->RewChoiceItemId[j] = 0;          // no changes, quest will not reward this
                }
                else
                    choice_found = true;

                if (!qinfo->RewChoiceItemCount[j])
                {
                    sLog.outErrorDb("Quest %u has `RewChoiceItemId%d` = %u but `RewChoiceItemCount%d` = 0, quest can't be done.",
                                    qinfo->GetQuestId(), j + 1, id, j + 1);
                    // no changes, quest can't be done
                }
            }
            else if (choice_found)                          // 1.12.1 client (but not later) crash if have gap in item reward choices
            {
                sLog.outErrorDb("Quest %u has `RewChoiceItemId%d` = 0 but `RewChoiceItemId%d` = %u, client can crash at like data.",
                                qinfo->GetQuestId(), j + 1, j + 2, qinfo->RewChoiceItemId[j + 1]);
                // fill gap by clone later filled choice
                qinfo->RewChoiceItemId[j] = qinfo->RewChoiceItemId[j + 1];
                qinfo->RewChoiceItemCount[j] = qinfo->RewChoiceItemCount[j + 1];
            }
            else if (qinfo->RewChoiceItemCount[j] > 0)
            {
                sLog.outErrorDb("Quest %u has `RewChoiceItemId%d` = 0 but `RewChoiceItemCount%d` = %u.",
                                qinfo->GetQuestId(), j + 1, j + 1, qinfo->RewChoiceItemCount[j]);
                // no changes, quest ignore this data
            }
        }

        for (int j = 0; j < QUEST_REWARDS_COUNT; ++j)
        {
            if (uint32 id = qinfo->RewItemId[j])
            {
                if (!sItemStorage.LookupEntry<ItemPrototype>(id))
                {
                    sLog.outErrorDb("Quest %u has `RewItemId%d` = %u but item with entry %u does not exist, quest will not reward this item.",
                                    qinfo->GetQuestId(), j + 1, id, id);
                    qinfo->RewItemId[j] = 0;                // no changes, quest will not reward this item
                }

                if (!qinfo->RewItemCount[j])
                {
                    sLog.outErrorDb("Quest %u has `RewItemId%d` = %u but `RewItemCount%d` = 0, quest will not reward this item.",
                                    qinfo->GetQuestId(), j + 1, id, j + 1);
                    // no changes
                }
            }
            else if (qinfo->RewItemCount[j] > 0)
            {
                sLog.outErrorDb("Quest %u has `RewItemId%d` = 0 but `RewItemCount%d` = %u.",
                                qinfo->GetQuestId(), j + 1, j + 1, qinfo->RewItemCount[j]);
                // no changes, quest ignore this data
            }
        }

        for (int j = 0; j < QUEST_REPUTATIONS_COUNT; ++j)
        {
            if (qinfo->RewRepFaction[j])
            {
                if (!qinfo->RewRepValue[j])
                {
                    sLog.outErrorDb("Quest %u has `RewRepFaction%d` = %u but `RewRepValue%d` = 0, quest will not reward this reputation.",
                                    qinfo->GetQuestId(), j + 1, qinfo->RewRepValue[j], j + 1);
                    // no changes
                }

                if (!GetFactionEntry(qinfo->RewRepFaction[j]))
                {
                    sLog.outErrorDb("Quest %u has `RewRepFaction%d` = %u but raw faction (faction.dbc) %u does not exist, quest will not reward reputation for this faction.",
                                    qinfo->GetQuestId(), j + 1, qinfo->RewRepFaction[j] , qinfo->RewRepFaction[j]);
                    qinfo->RewRepFaction[j] = 0;            // quest will not reward this
                }
            }
            else if (qinfo->RewRepValue[j] != 0)
            {
                sLog.outErrorDb("Quest %u has `RewRepFaction%d` = 0 but `RewRepValue%d` = %i.",
                                qinfo->GetQuestId(), j + 1, j + 1, qinfo->RewRepValue[j]);
                // no changes, quest ignore this data
            }
        }

        if (qinfo->RewSpell)
        {
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(qinfo->RewSpell);

            if (!spellInfo)
            {
                sLog.outErrorDb("Quest %u has `RewSpell` = %u but spell %u does not exist, spell removed as display reward.",
                                qinfo->GetQuestId(), qinfo->RewSpell, qinfo->RewSpell);
                qinfo->RewSpell = 0;                        // no spell reward will display for this quest
            }
            else if (!SpellMgr::IsSpellValid(spellInfo))
            {
                sLog.outErrorDb("Quest %u has `RewSpell` = %u but spell %u is broken, quest will not have a spell reward.",
                                qinfo->GetQuestId(), qinfo->RewSpell, qinfo->RewSpell);
                qinfo->RewSpell = 0;                        // no spell reward will display for this quest
            }
            else if (GetTalentSpellCost(qinfo->RewSpell))
            {
                sLog.outErrorDb("Quest %u has `RewSpell` = %u but spell %u is talent, quest will not have a spell reward.",
                                qinfo->GetQuestId(), qinfo->RewSpell, qinfo->RewSpell);
                qinfo->RewSpell = 0;                        // no spell reward will display for this quest
            }
        }

        if (qinfo->RewSpellCast)
        {
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(qinfo->RewSpellCast);

            if (!spellInfo)
            {
                sLog.outErrorDb("Quest %u has `RewSpellCast` = %u but spell %u does not exist, quest will not have a spell reward.",
                                qinfo->GetQuestId(), qinfo->RewSpellCast, qinfo->RewSpellCast);
                qinfo->RewSpellCast = 0;                    // no spell will be casted on player
            }
            else if (!SpellMgr::IsSpellValid(spellInfo))
            {
                sLog.outErrorDb("Quest %u has `RewSpellCast` = %u but spell %u is broken, quest will not have a spell reward.",
                                qinfo->GetQuestId(), qinfo->RewSpellCast, qinfo->RewSpellCast);
                qinfo->RewSpellCast = 0;                    // no spell will be casted on player
            }
            else if (GetTalentSpellCost(qinfo->RewSpellCast))
            {
                sLog.outErrorDb("Quest %u has `RewSpell` = %u but spell %u is talent, quest will not have a spell reward.",
                                qinfo->GetQuestId(), qinfo->RewSpellCast, qinfo->RewSpellCast);
                qinfo->RewSpellCast = 0;                    // no spell will be casted on player
            }
        }

        if (qinfo->RewMailTemplateId)
        {
            if (!sMailTemplateStore.LookupEntry(qinfo->RewMailTemplateId))
            {
                sLog.outErrorDb("Quest %u has `RewMailTemplateId` = %u but mail template  %u does not exist, quest will not have a mail reward.",
                                qinfo->GetQuestId(), qinfo->RewMailTemplateId, qinfo->RewMailTemplateId);
                qinfo->RewMailTemplateId = 0;               // no mail will send to player
                qinfo->RewMailDelaySecs = 0;                // no mail will send to player
            }
            else if (usedMailTemplates.find(qinfo->RewMailTemplateId) != usedMailTemplates.end())
            {
                std::map<uint32, uint32>::const_iterator used_mt_itr = usedMailTemplates.find(qinfo->RewMailTemplateId);
                sLog.outErrorDb("Quest %u has `RewMailTemplateId` = %u but mail template  %u already used for quest %u, quest will not have a mail reward.",
                                qinfo->GetQuestId(), qinfo->RewMailTemplateId, qinfo->RewMailTemplateId, used_mt_itr->second);
                qinfo->RewMailTemplateId = 0;               // no mail will send to player
                qinfo->RewMailDelaySecs = 0;                // no mail will send to player
            }
            else
                usedMailTemplates[qinfo->RewMailTemplateId] = qinfo->GetQuestId();
        }

        if (qinfo->NextQuestInChain)
        {
            QuestMap::iterator qNextItr = mQuestTemplates.find(qinfo->NextQuestInChain);
            if (qNextItr == mQuestTemplates.end())
            {
                sLog.outErrorDb("Quest %u has `NextQuestInChain` = %u but quest %u does not exist, quest chain will not work.",
                                qinfo->GetQuestId(), qinfo->NextQuestInChain , qinfo->NextQuestInChain);
                qinfo->NextQuestInChain = 0;
            }
            else
                qNextItr->second->prevChainQuests.push_back(qinfo->GetQuestId());
        }

        // fill additional data stores
        if (qinfo->PrevQuestId)
        {
            if (mQuestTemplates.find(abs(qinfo->GetPrevQuestId())) == mQuestTemplates.end())
                sLog.outErrorDb("Quest %d has PrevQuestId %i, but no such quest", qinfo->GetQuestId(), qinfo->GetPrevQuestId());
            else
                qinfo->prevQuests.push_back(qinfo->PrevQuestId);
        }

        if (qinfo->NextQuestId)
        {
            QuestMap::iterator qNextItr = mQuestTemplates.find(abs(qinfo->GetNextQuestId()));
            if (qNextItr == mQuestTemplates.end())
                sLog.outErrorDb("Quest %d has NextQuestId %i, but no such quest", qinfo->GetQuestId(), qinfo->GetNextQuestId());
            else
            {
                int32 signedQuestId = qinfo->NextQuestId < 0 ? -int32(qinfo->GetQuestId()) : int32(qinfo->GetQuestId());
                qNextItr->second->prevQuests.push_back(signedQuestId);
            }
        }

        if (qinfo->ExclusiveGroup)
            m_ExclusiveQuestGroups.insert(ExclusiveQuestGroupsMap::value_type(qinfo->ExclusiveGroup, qinfo->GetQuestId()));

        if (qinfo->LimitTime)
            qinfo->SetSpecialFlag(QUEST_SPECIAL_FLAG_TIMED);
    }

    // check QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT for spell with SPELL_EFFECT_QUEST_COMPLETE
    for (uint32 i = 0; i < sSpellMgr.GetMaxSpellId(); ++i)
    {
        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(i);
        if (!spellInfo)
            continue;

        for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if (spellInfo->Effect[j] != SPELL_EFFECT_QUEST_COMPLETE)
                continue;

            uint32 quest_id = spellInfo->EffectMiscValue[j];

            Quest const* quest = GetQuestTemplate(quest_id);

            // some quest referenced in spells not exist (outdated spells)
            if (!quest)
                continue;

            if (!quest->HasSpecialFlag(QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT))
            {
                sLog.outDetail("Spell (id: %u) have SPELL_EFFECT_QUEST_COMPLETE for quest %u , but quest does not have SpecialFlags QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT (2) set. Quest SpecialFlags should be corrected to enable this objective.", spellInfo->Id, quest_id);

                // The below forced alteration has been disabled because of spell 33824 / quest 10162.
                // A startup error will still occur with proper data in quest_template, but it will be possible to sucessfully complete the quest with the expected data.

                // this will prevent quest completing without objective
                // const_cast<Quest*>(quest)->SetSpecialFlag(QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT);
            }
        }
    }

    sLog.outString();
    sLog.outString(">> Loaded %lu quests definitions", (unsigned long)mQuestTemplates.size());
}

uint32 ObjectMgr::GetQuestStartingItemID(uint32 quest_id) const
{
    auto questItemPair = mQuestStartingItems.find(quest_id);

    if (questItemPair != mQuestStartingItems.end())
        return questItemPair->second;

    return 0;
}

void ObjectMgr::LoadQuestLocales()
{
    mQuestLocaleMap.clear();                                // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT entry,"
                          "Title_loc1,Details_loc1,Objectives_loc1,OfferRewardText_loc1,RequestItemsText_loc1,EndText_loc1,ObjectiveText1_loc1,ObjectiveText2_loc1,ObjectiveText3_loc1,ObjectiveText4_loc1,"
                          "Title_loc2,Details_loc2,Objectives_loc2,OfferRewardText_loc2,RequestItemsText_loc2,EndText_loc2,ObjectiveText1_loc2,ObjectiveText2_loc2,ObjectiveText3_loc2,ObjectiveText4_loc2,"
                          "Title_loc3,Details_loc3,Objectives_loc3,OfferRewardText_loc3,RequestItemsText_loc3,EndText_loc3,ObjectiveText1_loc3,ObjectiveText2_loc3,ObjectiveText3_loc3,ObjectiveText4_loc3,"
                          "Title_loc4,Details_loc4,Objectives_loc4,OfferRewardText_loc4,RequestItemsText_loc4,EndText_loc4,ObjectiveText1_loc4,ObjectiveText2_loc4,ObjectiveText3_loc4,ObjectiveText4_loc4,"
                          "Title_loc5,Details_loc5,Objectives_loc5,OfferRewardText_loc5,RequestItemsText_loc5,EndText_loc5,ObjectiveText1_loc5,ObjectiveText2_loc5,ObjectiveText3_loc5,ObjectiveText4_loc5,"
                          "Title_loc6,Details_loc6,Objectives_loc6,OfferRewardText_loc6,RequestItemsText_loc6,EndText_loc6,ObjectiveText1_loc6,ObjectiveText2_loc6,ObjectiveText3_loc6,ObjectiveText4_loc6,"
                          "Title_loc7,Details_loc7,Objectives_loc7,OfferRewardText_loc7,RequestItemsText_loc7,EndText_loc7,ObjectiveText1_loc7,ObjectiveText2_loc7,ObjectiveText3_loc7,ObjectiveText4_loc7,"
                          "Title_loc8,Details_loc8,Objectives_loc8,OfferRewardText_loc8,RequestItemsText_loc8,EndText_loc8,ObjectiveText1_loc8,ObjectiveText2_loc8,ObjectiveText3_loc8,ObjectiveText4_loc8"
                          " FROM locales_quest"
                                             );

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 Quest locale strings. DB table `locales_quest` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 entry = fields[0].GetUInt32();

        if (!GetQuestTemplate(entry))
        {
            ERROR_DB_STRICT_LOG("Table `locales_quest` has data for nonexistent quest entry %u, skipped.", entry);
            continue;
        }

        QuestLocale& data = mQuestLocaleMap[entry];

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[1 + 10 * (i - 1)].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Title.size() <= idx)
                        data.Title.resize(idx + 1);

                    data.Title[idx] = str;
                }
            }
            str = fields[1 + 10 * (i - 1) + 1].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Details.size() <= idx)
                        data.Details.resize(idx + 1);

                    data.Details[idx] = str;
                }
            }
            str = fields[1 + 10 * (i - 1) + 2].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Objectives.size() <= idx)
                        data.Objectives.resize(idx + 1);

                    data.Objectives[idx] = str;
                }
            }
            str = fields[1 + 10 * (i - 1) + 3].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.OfferRewardText.size() <= idx)
                        data.OfferRewardText.resize(idx + 1);

                    data.OfferRewardText[idx] = str;
                }
            }
            str = fields[1 + 10 * (i - 1) + 4].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.RequestItemsText.size() <= idx)
                        data.RequestItemsText.resize(idx + 1);

                    data.RequestItemsText[idx] = str;
                }
            }
            str = fields[1 + 10 * (i - 1) + 5].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.EndText.size() <= idx)
                        data.EndText.resize(idx + 1);

                    data.EndText[idx] = str;
                }
            }
            for (int k = 0; k < 4; ++k)
            {
                str = fields[1 + 10 * (i - 1) + 6 + k].GetCppString();
                if (!str.empty())
                {
                    int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                    if (idx >= 0)
                    {
                        if ((int32)data.ObjectiveText[k].size() <= idx)
                            data.ObjectiveText[k].resize(idx + 1);

                        data.ObjectiveText[k][idx] = str;
                    }
                }
            }
        }
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu Quest locale strings", (unsigned long)mQuestLocaleMap.size());
}

void ObjectMgr::LoadPetCreateSpells()
{
    QueryResult *result = WorldDatabase.Query("SELECT entry, Spell1, Spell2, Spell3, Spell4 FROM petcreateinfo_spell");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 pet create spells");
        //sLog.outErrorDb("`petcreateinfo_spell` table is empty!");
        return;
    }

    uint32 count = 0;

    BarGoLink bar(result->GetRowCount());

    mPetCreateSpell.clear();

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 creature_id = fields[0].GetUInt32();

        if (!creature_id)
        {
            sLog.outErrorDb("Creature id %u listed in `petcreateinfo_spell` not exist.", creature_id);
            continue;
        }

        CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(creature_id);
        if (!cInfo)
        {
            sLog.outErrorDb("Creature id %u listed in `petcreateinfo_spell` not exist.", creature_id);
            continue;
        }

        if (CreatureSpellDataEntry const* petSpellEntry = cInfo->PetSpellDataId ? sCreatureSpellDataStore.LookupEntry(cInfo->PetSpellDataId) : NULL)
        {
            sLog.outErrorDb("Creature id %u listed in `petcreateinfo_spell` have set `PetSpellDataId` field and will use its instead, skip.", creature_id);
            continue;
        }

        PetCreateSpellEntry PetCreateSpell;

        bool have_spell = false;
        bool have_spell_db = false;
        for (int i = 0; i < 4; ++i)
        {
            PetCreateSpell.spellid[i] = fields[i + 1].GetUInt32();

            if (!PetCreateSpell.spellid[i])
                continue;

            have_spell_db = true;

            SpellEntry const* i_spell = sSpellMgr.GetSpellEntry(PetCreateSpell.spellid[i]);
            if (!i_spell)
            {
                sLog.outErrorDb("Spell %u listed in `petcreateinfo_spell` does not exist", PetCreateSpell.spellid[i]);
                PetCreateSpell.spellid[i] = 0;
                continue;
            }

            have_spell = true;
        }

        if (!have_spell_db)
        {
            sLog.outErrorDb("Creature %u listed in `petcreateinfo_spell` have only 0 spell data, why it listed?", creature_id);
            continue;
        }

        if (!have_spell)
            continue;

        mPetCreateSpell[creature_id] = PetCreateSpell;
        ++count;
    }
    while (result->NextRow());

    delete result;

    // cache spell->learn spell map for use in next loop
    std::map<uint32, uint32> learnCache;
    for (uint32 spell_id = 1; spell_id < sSpellMgr.GetMaxSpellId(); ++spell_id)
    {
        SpellEntry const *spellproto = sSpellMgr.GetSpellEntry(spell_id);
        if (!spellproto)
            continue;

        if (spellproto->Effect[0] != SPELL_EFFECT_LEARN_SPELL && spellproto->Effect[0] != SPELL_EFFECT_LEARN_PET_SPELL)
            continue;

        if (!spellproto->EffectTriggerSpell[0])
            continue;

        learnCache[spellproto->EffectTriggerSpell[0]] = spellproto->Id;
    }

    // fill data from DBC as more correct source if available
    uint32 dcount = 0;
    for (uint32 cr_id = 1; cr_id < sCreatureStorage.GetMaxEntry(); ++cr_id)
    {
        CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(cr_id);
        if (!cInfo)
            continue;

        CreatureSpellDataEntry const* petSpellEntry = cInfo->PetSpellDataId ? sCreatureSpellDataStore.LookupEntry(cInfo->PetSpellDataId) : NULL;
        if (!petSpellEntry)
            continue;

        PetCreateSpellEntry PetCreateSpell;
        for (int i = 0; i < MAX_CREATURE_SPELL_DATA_SLOT; ++i)
        {
            uint32 petspell_id = petSpellEntry->spellId[i];
            if (petspell_id)
            {
                // in dbc stored spell for pet use, but for teaching work we need learn spell ids
                std::map<uint32, uint32>::const_iterator cache_itr = learnCache.find(petspell_id);
                if (cache_itr != learnCache.end())
                    petspell_id = cache_itr->second;
            }

            PetCreateSpell.spellid[i] = petspell_id;
        }

        mPetCreateSpell[cr_id] = PetCreateSpell;
        ++dcount;
    }

    sLog.outString();
    sLog.outString(">> Loaded %u pet create spells from table and %u from DBC", count, dcount);
}

void ObjectMgr::LoadItemTexts()
{
    QueryResult *result = CharacterDatabase.Query("SELECT id, text FROM item_text");

    uint32 count = 0;

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u item pages", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    Field* fields;
    do
    {
        bar.step();

        fields = result->Fetch();

        mItemTexts[ fields[0].GetUInt32() ] = fields[1].GetCppString();

        ++count;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u item texts", count);
}

void ObjectMgr::LoadPageTexts()
{
    sPageTextStore.Load();
    sLog.outString(">> Loaded %u page texts", sPageTextStore.GetRecordCount());
    sLog.outString();

    for (uint32 i = 1; i < sPageTextStore.GetMaxEntry(); ++i)
    {
        // check data correctness
        PageText const* page = sPageTextStore.LookupEntry<PageText>(i);
        if (!page)
            continue;

        if (page->Next_Page && !sPageTextStore.LookupEntry<PageText>(page->Next_Page))
        {
            sLog.outErrorDb("Page text (Id: %u) has not existing next page (Id:%u)", i, page->Next_Page);
            continue;
        }

        // detect circular reference
        std::set<uint32> checkedPages;
        for (PageText const* pageItr = page; pageItr; pageItr = sPageTextStore.LookupEntry<PageText>(pageItr->Next_Page))
        {
            if (!pageItr->Next_Page)
                break;
            checkedPages.insert(pageItr->Page_ID);
            if (checkedPages.find(pageItr->Next_Page) != checkedPages.end())
            {
                std::ostringstream ss;
                ss << "The text page(s) ";
                for (std::set<uint32>::iterator itr = checkedPages.begin(); itr != checkedPages.end(); ++itr)
                    ss << *itr << " ";
                ss << "create(s) a circular reference, which can cause the server to freeze. Changing Next_Page of page "
                   << pageItr->Page_ID << " to 0";
                sLog.outErrorDb("%s", ss.str().c_str());
                const_cast<PageText*>(pageItr)->Next_Page = 0;
                break;
            }
        }
    }
}

void ObjectMgr::LoadPageTextLocales()
{
    mPageTextLocaleMap.clear();                             // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT entry,text_loc1,text_loc2,text_loc3,text_loc4,text_loc5,text_loc6,text_loc7,text_loc8 FROM locales_page_text");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 PageText locale strings. DB table `locales_page_text` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 entry = fields[0].GetUInt32();

        if (!sPageTextStore.LookupEntry<PageText>(entry))
        {
            ERROR_DB_STRICT_LOG("Table `locales_page_text` has data for nonexistent page text entry %u, skipped.", entry);
            continue;
        }

        PageTextLocale& data = mPageTextLocaleMap[entry];

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[i].GetCppString();
            if (str.empty())
                continue;

            int idx = GetOrNewIndexForLocale(LocaleConstant(i));
            if (idx >= 0)
            {
                if ((int32)data.Text.size() <= idx)
                    data.Text.resize(idx + 1);

                data.Text[idx] = str;
            }
        }

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu PageText locale strings", (unsigned long)mPageTextLocaleMap.size());
}

struct SQLMapLoader : public SQLStorageLoaderBase<SQLMapLoader, SQLStorage>
{
    template<class D>
    void convert_from_str(uint32 /*field_pos*/, char const* src, D& dst)
    {
        dst = D(sScriptMgr.GetScriptId(src));
    }
};

void ObjectMgr::LoadMapTemplate()
{
    SQLMapLoader loader;
    loader.LoadProgressive(sMapStorage, sWorld.GetWowPatch());

    for (auto itr = sMapStorage.begin<MapEntry>(); itr < sMapStorage.end<MapEntry>(); ++itr)
    {
        if (itr->IsDungeon() && itr->parent > 0)
        {
            // check existence
            MapEntry const* parentEntry = sMapStorage.LookupEntry<MapEntry>(itr->parent);
            if (!parentEntry)
            {
                sLog.outErrorDb("ObjectMgr::LoadMapTemplate: bad parent map id %u for instance template %u template!",
                    itr->parent, itr->id);
                const_cast<MapEntry*>(*itr)->parent = 0;
                continue;
            }

            if (parentEntry->IsContinent())
            {
                sLog.outErrorDb("ObjectMgr::LoadMapTemplate: parent point to continent map id %u for instance template %u template, ignored, need be set only for non-continent parents!",
                                parentEntry->id, itr->id);
                const_cast<MapEntry*>(*itr)->parent = 0;
                continue;
            }
        }

        // if ghost entrance coordinates provided, can't be not exist for instance without ground entrance
        if (itr->ghostEntranceMap >= 0)
        {
            if (!MapManager::IsValidMapCoord(itr->ghostEntranceMap, itr->ghostEntranceX, itr->ghostEntranceY))
            {
                sLog.outErrorDb("ObjectMgr::LoadMapTemplate: ghost entrance coordinates invalid for instance template %u template, ignored, need be set only for non-continent parents!", itr->id);
                sMapStorage.EraseEntry(itr->id);
                continue;
            }

            MapEntry const* ghostEntry = sMapStorage.LookupEntry<MapEntry>(itr->ghostEntranceMap);
            if (!ghostEntry)
            {
                sLog.outErrorDb("ObjectMgr::LoadMapTemplate: bad ghost entrance for instance template %u template!", itr->id);
                sMapStorage.EraseEntry(itr->id);
                continue;
            }

            if (!ghostEntry->IsContinent())
            {
                sLog.outErrorDb("ObjectMgr::LoadMapTemplate: ghost entrance not at continent map id %u for instance template %u template, ignored, need be set only for non-continent parents!", ghostEntry->id, itr->id);
                sMapStorage.EraseEntry(itr->id);
                continue;
            }
        }

        // the reset_delay must be at least one day
        if (itr->resetDelay)
            const_cast<MapEntry*>(*itr)->resetDelay = std::max((uint32)1, (uint32)(itr->resetDelay * sWorld.getConfig(CONFIG_FLOAT_RATE_INSTANCE_RESET_TIME)));
    }

    sLog.outString(">> Loaded %u Map Template definitions", sMapStorage.GetRecordCount());
    sLog.outString();
}

struct SQLWorldLoader : public SQLStorageLoaderBase<SQLWorldLoader, SQLStorage>
{
    template<class D>
    void convert_from_str(uint32 /*field_pos*/, char const* src, D& dst)
    {
        dst = D(sScriptMgr.GetScriptId(src));
    }
};

void ObjectMgr::LoadNPCText()
{
    mNpcTextMap.clear();                           // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT ID, "
        "Probability0, Probability1, Probability2, Probability3, Probability4, Probability5, Probability6, Probability7, "
        "BroadcastTextID0, BroadcastTextID1, BroadcastTextID2, BroadcastTextID3, BroadcastTextID4, BroadcastTextID5, BroadcastTextID6, BroadcastTextID7"
        " FROM npc_text");

    int count = 0;
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u npc texts", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        ++count;

        Field *fields = result->Fetch();

        bar.step();

        uint32 textID = fields[0].GetUInt32();
        if (!textID)
        {
            sLog.outErrorDb("Table `npc_text` has record wit reserved id 0, ignore.");
            continue;
        }

        NpcText& npcText = mNpcTextMap[textID];

        for (uint8 i = 0; i < MAX_NPC_TEXT_OPTIONS; ++i)
        {
            npcText.Options[i].Probability = fields[1 + i].GetFloat();
            npcText.Options[i].BroadcastTextID = fields[9 + i].GetUInt32();
        }

        for (uint8 i = 0; i < MAX_NPC_TEXT_OPTIONS; i++)
        {
            if (npcText.Options[i].BroadcastTextID)
            {
                if (!GetBroadcastTextLocale(npcText.Options[i].BroadcastTextID))
                {
                    sLog.outErrorDb("NPCText (ID: %u) has a non-existing or incompatible BroadcastText (ID: %u, Index: %u)", textID, npcText.Options[i].BroadcastTextID, i);
                    npcText.Options[i].BroadcastTextID = 0;
                }
            }
        }

        for (uint8 i = 0; i < MAX_NPC_TEXT_OPTIONS; i++)
        {
            if (npcText.Options[i].Probability > 0 && npcText.Options[i].BroadcastTextID == 0)
            {
                sLog.outErrorDb("NPCText (ID: %u) has a probability (Index: %u) set, but no BroadcastTextID to go with it", textID, i);
                npcText.Options[i].Probability = 0;
            }
        }
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u npc texts", count);
    delete result;
}

class SingleMailReturner
{
public:
    SingleMailReturner() : returnToLowGuid(0) {}
    uint32 returnToLowGuid; // Items deleted if null
    time_t basetime;
    uint32 messageID;
    ObjectGuid receiverGuid;
    uint32 itemTextId;

    void Callback(QueryResult* result)
    {
        uint32 item_guid = 0;
        if (result)
        {
            Field *fields2 = result->Fetch();

            item_guid = fields2[0].GetUInt32();
            delete result;
        }
        if (!sObjectAccessor.FindPlayerNotInWorld(receiverGuid)) // Do not process online players!
        {
            if (!returnToLowGuid) // Delete mail and items
            {
                // mail open and then not returned
                if (item_guid)
                {
                    CharacterDatabase.PExecute("DELETE FROM item_instance WHERE guid = '%u'", item_guid);
                    CharacterDatabase.PExecute("DELETE FROM mail_items WHERE mail_id = '%u'", messageID);
                }
                if (itemTextId)
                    CharacterDatabase.PExecute("DELETE FROM item_text WHERE id = '%u'", itemTextId);

                CharacterDatabase.PExecute("DELETE FROM mail WHERE id = '%u'", messageID);
            }
            else                // Return to sender
            {
                // mail will be returned:
                CharacterDatabase.PExecute("UPDATE mail SET sender = '%u', receiver = '%u', expire_time = '" UI64FMTD "', deliver_time = '" UI64FMTD "',cod = '0', checked = '%u' WHERE id = '%u'",
                                           receiverGuid.GetCounter(), returnToLowGuid, (uint64)(basetime + 30 * DAY), (uint64)basetime, MAIL_CHECK_MASK_RETURNED, messageID);
                if (item_guid)
                {
                    // update receiver in mail items for its proper delivery, and in instance_item for avoid lost item at sender delete
                    CharacterDatabase.PExecute("UPDATE mail_items SET receiver = %u WHERE item_guid = '%u'", returnToLowGuid, item_guid);
                    CharacterDatabase.PExecute("UPDATE item_instance SET owner_guid = %u WHERE guid = '%u'", returnToLowGuid, item_guid);
                }
            }
        }
        delete this;
    }
};

class OldMailsReturner
{
public:
    OldMailsReturner() : serverUp(false), basetime(0) {}
    bool serverUp;
    time_t basetime;
    void Callback(QueryResult* result)
    {
        if (!result)
        {
            sObjectMgr.ResetOldMailCounter();
            if (!serverUp)
            {
                BarGoLink bar(1);
                bar.step();
                sLog.outString();
                sLog.outString(">> Only expired mails (need to be return or delete) or DB table `mail` is empty.");
            }
            delete this;
            return;                                             // any mails need to be returned or deleted
        }

        BarGoLink bar(result->GetRowCount());
        uint32 skippedCount = 0;
        Field *fields;

        do
        {
            bar.step();

            fields = result->Fetch();
            Mail *m = new Mail;
            m->messageID = fields[0].GetUInt32();
            m->messageType = fields[1].GetUInt8();
            m->sender = fields[2].GetUInt32();
            m->receiverGuid = ObjectGuid(HIGHGUID_PLAYER, fields[3].GetUInt32());
            bool has_items = fields[5].GetBool();
            m->expire_time = (time_t)fields[6].GetUInt64();
            m->deliver_time = 0;
            m->COD = fields[7].GetUInt32();
            m->checked = fields[8].GetUInt32();
            m->mailTemplateId = fields[9].GetInt16();

            if (serverUp && sObjectAccessor.FindPlayerNotInWorld(m->receiverGuid))
            {
                // Online player. We wait for him to logout to send the mail back (ie next call)
                ++skippedCount;
                delete m;
                continue;
            }
            //delete or return mail:
            if (has_items)
            {
                SingleMailReturner* returner = new SingleMailReturner();
                // if it is mail from non-player, or if it's already return mail, it shouldn't be returned, but deleted
                if (m->messageType != MAIL_NORMAL || (m->checked & (MAIL_CHECK_MASK_COD_PAYMENT | MAIL_CHECK_MASK_RETURNED)))
                    returner->returnToLowGuid = 0;
                else
                {
                    returner->basetime = basetime;
                    returner->returnToLowGuid = m->sender;
                }
                returner->receiverGuid = m->receiverGuid;
                returner->itemTextId = m->itemTextId;
                returner->messageID = m->messageID;
                CharacterDatabase.AsyncPQueryUnsafe(returner, &SingleMailReturner::Callback, "SELECT item_guid FROM mail_items WHERE mail_id='%u'", m->messageID);
                delete m;
                continue;
            }

            if (m->itemTextId)
                CharacterDatabase.PExecute("DELETE FROM item_text WHERE id = '%u'", m->itemTextId);

            // deletemail = true;
            // delmails << m->messageID << ", ";
            CharacterDatabase.PExecute("DELETE FROM mail WHERE id = '%u'", m->messageID);
            delete m;
            
        }
        while (result->NextRow());
        sObjectMgr.IncrementOldMailCounter(skippedCount);
        delete result;
        delete this;
    }
};

//not very fast function but it is called only once a day, or on starting-up
void ObjectMgr::ReturnOrDeleteOldMails(bool serverUp)
{
    time_t basetime = time(NULL);
    DEBUG_LOG("Returning mails current time: hour: %d, minute: %d, second: %d ", localtime(&basetime)->tm_hour, localtime(&basetime)->tm_min, localtime(&basetime)->tm_sec);
    //delete all old mails without item and without body immediately, if starting server
    if (!serverUp)
        CharacterDatabase.PExecute("DELETE FROM mail WHERE expire_time < '" UI64FMTD "' AND has_items = '0' AND itemTextId = 0", (uint64)basetime);
    OldMailsReturner* cb = new OldMailsReturner();
    cb->serverUp = serverUp;
    cb->basetime = basetime;
    uint32 limit = serverUp ? 5 : 1000;
    CharacterDatabase.AsyncPQueryUnsafe(cb, &OldMailsReturner::Callback, "SELECT id,messageType,sender,receiver,itemTextId,has_items,expire_time,cod,checked,mailTemplateId FROM mail WHERE expire_time < '" UI64FMTD "' ORDER BY expire_time LIMIT %u,%u", (uint64)basetime, m_OldMailCounter, limit);
}

void ObjectMgr::LoadQuestAreaTriggers()
{
    mQuestAreaTriggerMap.clear();                           // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT id,quest FROM areatrigger_involvedrelation");

    uint32 count = 0;

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u quest trigger points", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        ++count;
        bar.step();

        Field *fields = result->Fetch();

        uint32 trigger_ID = fields[0].GetUInt32();
        uint32 quest_ID   = fields[1].GetUInt32();

        AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(trigger_ID);
        if (!atEntry)
        {
            sLog.outErrorDb("Table `areatrigger_involvedrelation` has area trigger (ID: %u) not listed in `AreaTrigger.dbc`.", trigger_ID);
            continue;
        }

        Quest const* quest = GetQuestTemplate(quest_ID);
        if (!quest)
        {
            if (!sObjectMgr.IsExistingQuestId(quest_ID))
                sLog.outErrorDb("Table `areatrigger_involvedrelation` has record (id: %u) for not existing quest %u", trigger_ID, quest_ID);
            continue;
        }

        if (!quest->HasSpecialFlag(QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT))
        {
            sLog.outErrorDb("Table `areatrigger_involvedrelation` has record (id: %u) for not quest %u, but quest not have flag QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT. Trigger or quest flags must be fixed, quest modified to require objective.", trigger_ID, quest_ID);

            // this will prevent quest completing without objective
            const_cast<Quest*>(quest)->SetSpecialFlag(QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT);

            // continue; - quest modified to required objective and trigger can be allowed.
        }

        mQuestAreaTriggerMap[trigger_ID] = quest_ID;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u quest trigger points", count);
}

void ObjectMgr::LoadTavernAreaTriggers()
{
    mTavernAreaTriggerSet.clear();                          // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT id FROM areatrigger_tavern");

    uint32 count = 0;

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u tavern triggers", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        ++count;
        bar.step();

        Field *fields = result->Fetch();

        uint32 Trigger_ID      = fields[0].GetUInt32();

        AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(Trigger_ID);
        if (!atEntry)
        {
            sLog.outErrorDb("Table `areatrigger_tavern` has area trigger (ID:%u) not listed in `AreaTrigger.dbc`.", Trigger_ID);
            continue;
        }

        mTavernAreaTriggerSet.insert(Trigger_ID);
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u tavern triggers", count);
}

void ObjectMgr::LoadBattlegroundEntranceTriggers()
{
    mBGEntranceTriggers.clear();                                  // need for reload case

    uint32 count = 0;

    //                                                0   1     2            3         4                5                6                7
    QueryResult *result = WorldDatabase.Query("SELECT id, team, bg_template, exit_map, exit_position_x, exit_position_y, exit_position_z, exit_orientation FROM areatrigger_bg_entrance");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u Battleground entrance area triggers", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        ++count;

        uint32 Trigger_ID = fields[0].GetUInt32();

        BattlegroundEntranceTrigger bget;


        uint32 team             = fields[1].GetUInt32();
        uint8 bgTypeId          = fields[2].GetUInt8();

        bget.exit_mapId         = fields[3].GetUInt32();
        bget.exit_X             = fields[4].GetFloat();
        bget.exit_Y             = fields[5].GetFloat();
        bget.exit_Z             = fields[6].GetFloat();
        bget.exit_Orientation   = fields[7].GetFloat();

        AreaTriggerEntry const* bgetEntry = sAreaTriggerStore.LookupEntry(Trigger_ID);
        if (!bgetEntry)
        {
            sLog.outErrorDb("Table `areatrigger_bg_entrance` has area trigger (ID:%u) not listed in `AreaTrigger.dbc`.", Trigger_ID);
            continue;
        }

        if (team != ALLIANCE && team != HORDE)
        {
            sLog.outError("Table `areatrigger_bg_entrance` has team (ID:%u) that is not Horde or Alliance for area trigger (ID:%u).", team, Trigger_ID);
            continue;
        }
        bget.team = Team(team);

        if (bgTypeId >= MAX_BATTLEGROUND_TYPE_ID)
        {
            sLog.outErrorDb("Table `areatrigger_bg_entrance` has nonexistent battleground type (ID:%u) for area trigger (ID:%u), ignored.", bgTypeId, Trigger_ID);
            continue;
        }
        bget.bgTypeId = BattleGroundTypeId(bgTypeId);

        MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(bget.exit_mapId);
        if (!mapEntry)
        {
            sLog.outErrorDb("Table `areatrigger_bg_entrance` has nonexistent exit map (ID: %u) for area trigger (ID:%u).", bget.exit_mapId, Trigger_ID);
            continue;
        }

        if (bget.exit_X == 0 && bget.exit_Y == 0 && bget.exit_Z == 0)
        {
            sLog.outErrorDb("Table `areatrigger_bg_entrance` has area trigger (ID:%u) without battleground exit coordinates.", Trigger_ID);
            continue;
        }

        mBGEntranceTriggers[Trigger_ID] = bget;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u battleground entrance area trigger definitions", count);
}

uint32 ObjectMgr::GetNearestTaxiNode(float x, float y, float z, uint32 mapid, Team team)
{
    bool found = false;
    float dist = 0.0f;
    uint32 id = 0;

    for (uint32 i = 1; i < sTaxiNodesStore.GetNumRows(); ++i)
    {
        TaxiNodesEntry const* node = sTaxiNodesStore.LookupEntry(i);
        if (!node || node->map_id != mapid || !node->MountCreatureID[team == ALLIANCE ? 1 : 0])
            continue;

        uint8  field   = (uint8)((i - 1) / 32);
        uint32 submask = 1 << ((i - 1) % 32);

        // skip not taxi network nodes
        if ((sTaxiNodesMask[field] & submask) == 0)
            continue;

        float dist2 = (node->x - x) * (node->x - x) + (node->y - y) * (node->y - y) + (node->z - z) * (node->z - z);
        if (found)
        {
            if (dist2 < dist)
            {
                dist = dist2;
                id = i;
            }
        }
        else
        {
            found = true;
            dist = dist2;
            id = i;
        }
    }

    return id;
}

void ObjectMgr::GetTaxiPath(uint32 source, uint32 destination, uint32 &path, uint32 &cost)
{
    TaxiPathSetBySource::iterator src_i = sTaxiPathSetBySource.find(source);
    if (src_i == sTaxiPathSetBySource.end())
    {
        path = 0;
        cost = 0;
        return;
    }

    TaxiPathSetForSource& pathSet = src_i->second;

    TaxiPathSetForSource::iterator dest_i = pathSet.find(destination);
    if (dest_i == pathSet.end())
    {
        path = 0;
        cost = 0;
        return;
    }

    cost = dest_i->second.price;
    path = dest_i->second.ID;
}

uint32 ObjectMgr::GetTaxiMountDisplayId(uint32 id, Team team, bool allowed_alt_team /* = false */)
{
    uint16 mount_entry = 0;

    // select mount creature id
    TaxiNodesEntry const* node = sTaxiNodesStore.LookupEntry(id);
    if (node)
    {
        if (team == ALLIANCE)
        {
            mount_entry = node->MountCreatureID[1];
            if (!mount_entry && allowed_alt_team)
                mount_entry = node->MountCreatureID[0];
        }
        else if (team == HORDE)
        {
            mount_entry = node->MountCreatureID[0];

            if (!mount_entry && allowed_alt_team)
                mount_entry = node->MountCreatureID[1];
        }
    }

    CreatureInfo const *mount_info = GetCreatureTemplate(mount_entry);
    if (!mount_info)
        return 0;

    uint16 mount_id = Creature::ChooseDisplayId(mount_info);
    if (!mount_id)
        return 0;

    CreatureModelInfo const *minfo = GetCreatureModelRandomGender(mount_id);
    if (minfo)
        mount_id = minfo->modelid;

    return mount_id;
}

void ObjectMgr::LoadGraveyardZones()
{
    mGraveYardMap.clear();                                  // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT id,ghost_zone,faction FROM game_graveyard_zone");

    uint32 count = 0;

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u graveyard-zone links", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        ++count;
        bar.step();

        Field *fields = result->Fetch();

        uint32 safeLocId = fields[0].GetUInt32();
        uint32 zoneId = fields[1].GetUInt32();
        uint32 team   = fields[2].GetUInt32();

        WorldSafeLocsEntry const* entry = sWorldSafeLocsStore.LookupEntry(safeLocId);
        if (!entry)
        {
            sLog.outErrorDb("Table `game_graveyard_zone` has record for not existing graveyard (WorldSafeLocs.dbc id) %u, skipped.", safeLocId);
            continue;
        }

        const auto *areaEntry = AreaEntry::GetById(zoneId);
        if (!areaEntry)
        {
            sLog.outErrorDb("Table `game_graveyard_zone` has record for not existing zone id (%u), skipped.", zoneId);
            continue;
        }

        if (!areaEntry->IsZone())
        {
            sLog.outErrorDb("Table `game_graveyard_zone` has record subzone id (%u) instead of zone, skipped.", zoneId);
            continue;
        }

        if (team != TEAM_NONE && team != HORDE && team != ALLIANCE)
        {
            sLog.outErrorDb("Table `game_graveyard_zone` has record for non player faction (%u), skipped.", team);
            continue;
        }

        if (!AddGraveYardLink(safeLocId, zoneId, Team(team), false))
            sLog.outErrorDb("Table `game_graveyard_zone` has a duplicate record for Graveyard (ID: %u) and Zone (ID: %u), skipped.", safeLocId, zoneId);
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u graveyard-zone links", count);
}

WorldSafeLocsEntry const *ObjectMgr::GetClosestGraveYard(float x, float y, float z, uint32 MapId, Team team)
{
    // search for zone associated closest graveyard
    uint32 zoneId = sTerrainMgr.GetZoneId(MapId, x, y, z);

    // Simulate std. algorithm:
    //   found some graveyard associated to (ghost_zone,ghost_map)
    //
    //   if mapId == graveyard.mapId (ghost in plain zone or city or battleground) and search graveyard at same map
    //     then check faction
    //   if mapId != graveyard.mapId (ghost in instance) and search any graveyard associated
    //     then check faction
    GraveYardMapBounds bounds = mGraveYardMap.equal_range(zoneId);

    if (bounds.first == bounds.second)
        return nullptr;

    // at corpse map
    bool foundNear = false;
    float distNear = 0.0f;
    WorldSafeLocsEntry const* entryNear = nullptr;

    // at entrance map for corpse map
    bool foundEntr = false;
    float distEntr = 0.0f;
    WorldSafeLocsEntry const* entryEntr = nullptr;

    // some where other
    WorldSafeLocsEntry const* entryFar = nullptr;

    MapEntry const* tempEntry = sMapStorage.LookupEntry<MapEntry>(MapId);

    for (GraveYardMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        GraveYardData const& data = itr->second;

        WorldSafeLocsEntry const* entry = sWorldSafeLocsStore.LookupEntry(data.safeLocId);
        if (!entry)
        {
            sLog.outErrorDb("Table `game_graveyard_zone` has record for not existing graveyard (WorldSafeLocs.dbc id) %u, skipped.", data.safeLocId);
            continue;
        }

        // skip enemy faction graveyard
        // team == 0 case can be at call from .neargrave
        if (data.team != TEAM_NONE && team != TEAM_NONE && data.team != team)
            continue;

        // find now nearest graveyard at other (continent) map
        if (MapId != entry->map_id)
        {
            // if find graveyard at different map from where entrance placed (or no entrance data), use any first
            if (!tempEntry ||
                    tempEntry->ghostEntranceMap < 0 ||
                    uint32(tempEntry->ghostEntranceMap) != entry->map_id ||
                    (tempEntry->ghostEntranceX == 0.0f && tempEntry->ghostEntranceY == 0.0f))
            {
                // not have any coordinates for check distance anyway
                entryFar = entry;
                continue;
            }

            // at entrance map calculate distance (2D);
            float dist2 = (entry->x - tempEntry->ghostEntranceX) * (entry->x - tempEntry->ghostEntranceX)
                          + (entry->y - tempEntry->ghostEntranceY) * (entry->y - tempEntry->ghostEntranceY);
            if (foundEntr)
            {
                if (dist2 < distEntr)
                {
                    distEntr = dist2;
                    entryEntr = entry;
                }
            }
            else
            {
                foundEntr = true;
                distEntr = dist2;
                entryEntr = entry;
            }
        }
        // find now nearest graveyard at same map
        else
        {
            float dist2 = (entry->x - x) * (entry->x - x) + (entry->y - y) * (entry->y - y) + (entry->z - z) * (entry->z - z);
            if (foundNear)
            {
                if (dist2 < distNear)
                {
                    distNear = dist2;
                    entryNear = entry;
                }
            }
            else
            {
                foundNear = true;
                distNear = dist2;
                entryNear = entry;
            }
        }
    }

    if (entryNear)
        return entryNear;

    if (entryEntr)
        return entryEntr;

    return entryFar;
}

GraveYardData const* ObjectMgr::FindGraveYardData(uint32 id, uint32 zoneId) const
{
    GraveYardMapBounds bounds = mGraveYardMap.equal_range(zoneId);

    for (GraveYardMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second.safeLocId == id)
            return &itr->second;
    }

    return NULL;
}

bool ObjectMgr::AddGraveYardLink(uint32 id, uint32 zoneId, Team team, bool inDB)
{
    if (FindGraveYardData(id, zoneId))
        return false;

    // add link to loaded data
    GraveYardData data;
    data.safeLocId = id;
    data.team = team;

    mGraveYardMap.insert(GraveYardMap::value_type(zoneId, data));

    // add link to DB
    if (inDB)
    {
        WorldDatabase.PExecuteLog("INSERT INTO game_graveyard_zone ( id,ghost_zone,faction) "
                                  "VALUES ('%u', '%u','%u')", id, zoneId, uint32(team));
    }

    return true;
}

void ObjectMgr::LoadAreaTriggerTeleports()
{
    mAreaTriggers.clear();                                  // need for reload case

    uint32 count = 0;

    QueryResult *result = WorldDatabase.PQuery(
        //      0   1               2              3               4                    5
        "SELECT id, required_level, required_item, required_item2, required_quest_done, required_failed_text, "
        //  6                    7                     8           9                  10            11
        "target_map, target_position_x, target_position_y, target_position_z, target_orientation, required_event, "
        //  12                  13
        "required_pvp_rank, required_team "
        "FROM areatrigger_teleport t1 WHERE patch=(SELECT max(patch) FROM areatrigger_teleport t2 WHERE t1.id=t2.id && patch <= %u)", sWorld.GetWowPatch());
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u area trigger teleport definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        ++count;

        uint32 Trigger_ID = fields[0].GetUInt32();

        AreaTrigger at;

        at.requiredLevel      = fields[1].GetUInt8();
        at.requiredItem       = fields[2].GetUInt32();
        at.requiredItem2      = fields[3].GetUInt32();
        at.requiredQuest      = fields[4].GetUInt32();
        at.requiredFailedText = fields[5].GetCppString();
        at.target_mapId       = fields[6].GetUInt32();
        at.target_X           = fields[7].GetFloat();
        at.target_Y           = fields[8].GetFloat();
        at.target_Z           = fields[9].GetFloat();
        at.target_Orientation = fields[10].GetFloat();
        at.required_event     = fields[11].GetInt32();
        at.required_pvp_rank  = fields[12].GetUInt8();
        at.required_team      = fields[13].GetUInt16();

        AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(Trigger_ID);
        if (!atEntry)
        {
            sLog.outErrorDb("Table `areatrigger_teleport` has area trigger (ID:%u) not listed in `AreaTrigger.dbc`.", Trigger_ID);
            continue;
        }


        uint16 eventId = abs(at.required_event);
        if (eventId && !sGameEventMgr.IsValidEvent(eventId))
        {
            sLog.outErrorDb("Table `areatrigger_teleport` has nonexistent event %u defined for trigger %u, ignoring", eventId, Trigger_ID);
            at.required_event = 0;
        }

        if (at.requiredItem)
        {
            ItemPrototype const *pProto = GetItemPrototype(at.requiredItem);
            if (!pProto)
            {
                sLog.outError("Table `areatrigger_teleport` has nonexistent key item %u for trigger %u, removing key requirement.", at.requiredItem, Trigger_ID);
                at.requiredItem = 0;
            }
        }

        if (at.requiredItem2)
        {
            ItemPrototype const *pProto = GetItemPrototype(at.requiredItem2);
            if (!pProto)
            {
                sLog.outError("Table `areatrigger_teleport` has nonexistent second key item %u for trigger %u, remove key requirement.", at.requiredItem2, Trigger_ID);
                at.requiredItem2 = 0;
            }
        }

        if (at.requiredQuest)
        {
            QuestMap::iterator qReqItr = mQuestTemplates.find(at.requiredQuest);
            if (qReqItr == mQuestTemplates.end())
            {
                sLog.outErrorDb("Table `areatrigger_teleport` has nonexistent required quest %u for trigger %u, remove quest done requirement.", at.requiredQuest, Trigger_ID);
                at.requiredQuest = 0;
            }
        }

        MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(at.target_mapId);
        if (!mapEntry)
        {
            sLog.outErrorDb("Table `areatrigger_teleport` has nonexistent target map (ID: %u) for Area trigger (ID:%u).", at.target_mapId, Trigger_ID);
            continue;
        }

        if (at.target_X == 0 && at.target_Y == 0 && at.target_Z == 0)
        {
            sLog.outErrorDb("Table `areatrigger_teleport` has area trigger (ID:%u) without target coordinates.", Trigger_ID);
            continue;
        }

        mAreaTriggers[Trigger_ID] = at;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u area trigger teleport definitions", count);
}

/*
 * Searches for the areatrigger which teleports players out of the given map (only direct to continent)
 */
AreaTrigger const* ObjectMgr::GetGoBackTrigger(uint32 map_id) const
{  
    MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(map_id);
    if (!mapEntry || !mapEntry->IsDungeon())
        return nullptr;

    for (AreaTriggerMap::const_iterator itr = mAreaTriggers.begin(); itr != mAreaTriggers.end(); ++itr)
    {
        if (itr->second.target_mapId == uint32(mapEntry->ghostEntranceMap))
        {
            AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(itr->first);
            if (atEntry && atEntry->mapid == map_id)
                return &itr->second;
        }
    }
    return nullptr;
}

/**
 * Searches for the areatrigger which teleports players to the given map
 */
AreaTrigger const* ObjectMgr::GetMapEntranceTrigger(uint32 Map) const
{
    for (AreaTriggerMap::const_iterator itr = mAreaTriggers.begin(); itr != mAreaTriggers.end(); ++itr)
    {
        if (itr->second.target_mapId == Map)
        {
            AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(itr->first);
            if (atEntry)
                return &itr->second;
        }
    }
    return NULL;
}

void ObjectMgr::PackGroupIds()
{
    // this routine renumbers groups in such a way so they start from 1 and go up

    // obtain set of all groups
    std::set<uint32> groupIds;

    // all valid ids are in the instance table
    // any associations to ids not in this table are assumed to be
    // cleaned already in CleanupInstances
    QueryResult *result = CharacterDatabase.Query("SELECT groupId FROM groups ORDER BY groupId ASC");
    if (result)
    {
        do
        {
            Field *fields = result->Fetch();

            uint32 id = fields[0].GetUInt32();

            if (id == 0)
            {
                CharacterDatabase.BeginTransaction();
                CharacterDatabase.PExecute("DELETE FROM groups WHERE groupId = '%u'", id);
                CharacterDatabase.PExecute("DELETE FROM group_member WHERE groupId = '%u'", id);
                CharacterDatabase.CommitTransaction();
                continue;
            }

            groupIds.insert(id);
        }
        while (result->NextRow());
        delete result;
    }

    BarGoLink bar(groupIds.size() + 1);
    bar.step();

    uint32 groupId = 1;
    // we do assume std::set is sorted properly on integer value
    for (std::set<uint32>::iterator i = groupIds.begin(); i != groupIds.end(); ++i)
    {
        if (*i != groupId)
        {
            // remap group id
            CharacterDatabase.BeginTransaction();
            CharacterDatabase.PExecute("UPDATE groups SET groupId = '%u' WHERE groupId = '%u'", groupId, *i);
            CharacterDatabase.PExecute("UPDATE group_member SET groupId = '%u' WHERE groupId = '%u'", groupId, *i);
            CharacterDatabase.CommitTransaction();
        }

        ++groupId;
        bar.step();
    }

    m_GroupIds.Set(groupId);

    sLog.outString(">> Group Ids remapped, next group id is %u", groupId);
    sLog.outString();
}

void ObjectMgr::SetHighestGuids()
{
    QueryResult *result = CharacterDatabase.Query("SELECT MAX(guid) FROM characters");
    if (result)
    {
        m_CharGuids.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    result = WorldDatabase.Query("SELECT MAX(guid) FROM creature");
    if (result)
    {
        m_FirstTemporaryCreatureGuid = (*result)[0].GetUInt32() + 1;
        delete result;
    }

    result = CharacterDatabase.Query("SELECT MAX(guid) FROM item_instance");
    if (result)
    {
        m_ItemGuids.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    // Cleanup other tables from nonexistent guids (>=m_hiItemGuid)
    CharacterDatabase.BeginTransaction();
    CharacterDatabase.PExecute("DELETE FROM character_inventory WHERE item >= '%u'", m_ItemGuids.GetNextAfterMaxUsed());
    CharacterDatabase.PExecute("DELETE FROM mail_items WHERE item_guid >= '%u'", m_ItemGuids.GetNextAfterMaxUsed());
    CharacterDatabase.PExecute("DELETE FROM auction WHERE itemguid >= '%u'", m_ItemGuids.GetNextAfterMaxUsed());
    CharacterDatabase.CommitTransaction();

    result = WorldDatabase.Query("SELECT MAX(guid) FROM gameobject");
    if (result)
    {
        m_FirstTemporaryGameObjectGuid = (*result)[0].GetUInt32() + 1;
        delete result;
    }

    result = CharacterDatabase.Query("SELECT id FROM auction");
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            m_AuctionsIds.insert(fields[0].GetUInt32());
        } while (result->NextRow());
        delete result;
    }
    m_NextAuctionId = 1;

    result = CharacterDatabase.Query("SELECT MAX(id) FROM mail");
    if (result)
    {
        m_MailIds.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    result = CharacterDatabase.Query("SELECT MAX(id) FROM item_text");
    if (result)
    {
        m_ItemTextIds.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    result = CharacterDatabase.Query("SELECT MAX(guid) FROM corpse");
    if (result)
    {
        m_CorpseGuids.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    result = CharacterDatabase.Query("SELECT MAX(guildid) FROM guild");
    if (result)
    {
        m_GuildIds.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    result = CharacterDatabase.Query("SELECT MAX(groupId) FROM groups");
    if (result)
    {
        m_GroupIds.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    result = CharacterDatabase.Query("SELECT MAX(petitionguid) FROM petition");
    if (result)
    {
        m_PetitionIds.Set((*result)[0].GetUInt32() + 1);
        delete result;
    }

    // setup reserved ranges for static guids spawn
    m_StaticCreatureGuids.Set(m_FirstTemporaryCreatureGuid);
    m_FirstTemporaryCreatureGuid += sWorld.getConfig(CONFIG_UINT32_GUID_RESERVE_SIZE_CREATURE);

    m_StaticGameObjectGuids.Set(m_FirstTemporaryGameObjectGuid);
    m_FirstTemporaryGameObjectGuid += sWorld.getConfig(CONFIG_UINT32_GUID_RESERVE_SIZE_GAMEOBJECT);
}

uint32 ObjectMgr::CreateItemText(std::string text)
{
    uint32 newItemTextId = GenerateItemTextID();
    //insert new itempage to container
    mItemTexts[ newItemTextId ] = text;
    //save new itempage
    CharacterDatabase.escape_string(text);
    //any Delete query needed, itemTextId is maximum of all ids
    std::ostringstream query;
    query << "INSERT INTO item_text (id,text) VALUES ( '" << newItemTextId << "', '" << text << "')";
    CharacterDatabase.Execute(query.str().c_str());         //needs to be run this way, because mail body may be more than 1024 characters
    return newItemTextId;
}

void ObjectMgr::LoadGameObjectLocales()
{
    mGameObjectLocaleMap.clear();                           // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT entry,"
                          "name_loc1,name_loc2,name_loc3,name_loc4,name_loc5,name_loc6,name_loc7,name_loc8 FROM locales_gameobject");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 gameobject locale strings. DB table `locales_gameobject` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 entry = fields[0].GetUInt32();

        if (!GetGameObjectInfo(entry))
        {
            ERROR_DB_STRICT_LOG("Table `locales_gameobject` has data for nonexistent gameobject entry %u, skipped.", entry);
            continue;
        }

        GameObjectLocale& data = mGameObjectLocaleMap[entry];

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[i].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Name.size() <= idx)
                        data.Name.resize(idx + 1);

                    data.Name[idx] = str;
                }
            }
        }

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %lu gameobject locale strings", (unsigned long)mGameObjectLocaleMap.size());
}

struct SQLGameObjectLoader : public SQLStorageLoaderBase<SQLGameObjectLoader, SQLHashStorage>
{
    template<class D>
    void convert_from_str(uint32 /*field_pos*/, char const* src, D& dst)
    {
        dst = D(sScriptMgr.GetScriptId(src));
    }
};

inline void CheckGOLockId(GameObjectInfo const* goInfo, uint32 dataN, uint32 N)
{
    if (sLockStore.LookupEntry(dataN))
        return;

    sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data%d=%u but lock (Id: %u) not found.",
                    goInfo->id, goInfo->type, N, dataN, dataN);
}

inline void CheckGOLinkedTrapId(GameObjectInfo const* goInfo, uint32 dataN, uint32 N)
{
    if (GameObjectInfo const* trapInfo = sGOStorage.LookupEntry<GameObjectInfo>(dataN))
    {
        if (trapInfo->type != GAMEOBJECT_TYPE_TRAP)
            sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data%d=%u but GO (Entry %u) have not GAMEOBJECT_TYPE_TRAP (%u) type.",
                            goInfo->id, goInfo->type, N, dataN, dataN, GAMEOBJECT_TYPE_TRAP);
    }
    else
        // too many error reports about nonexistent trap templates
        ERROR_DB_STRICT_LOG("Gameobject (Entry: %u GoType: %u) have data%d=%u but trap GO (Entry %u) not exist in `gameobject_template`.",
                            goInfo->id, goInfo->type, N, dataN, dataN);
}

inline void CheckGOSpellId(GameObjectInfo const* goInfo, uint32 dataN, uint32 N)
{
    if (sSpellMgr.GetSpellEntry(dataN))
        return;

    sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data%d=%u but Spell (Entry %u) not exist.",
                    goInfo->id, goInfo->type, N, dataN, dataN);
}

inline void CheckAndFixGOChairHeightId(GameObjectInfo const* goInfo, uint32 const& dataN, uint32 N)
{
    if (dataN <= (UNIT_STAND_STATE_SIT_HIGH_CHAIR - UNIT_STAND_STATE_SIT_LOW_CHAIR))
        return;

    sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data%d=%u but correct chair height in range 0..%i.",
                    goInfo->id, goInfo->type, N, dataN, UNIT_STAND_STATE_SIT_HIGH_CHAIR - UNIT_STAND_STATE_SIT_LOW_CHAIR);

    // prevent client and server unexpected work
    const_cast<uint32&>(dataN) = 0;
}

inline void CheckGONoDamageImmuneId(GameObjectInfo const* goInfo, uint32 dataN, uint32 N)
{
    // 0/1 correct values
    if (dataN <= 1)
        return;

    sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data%d=%u but expected boolean (0/1) noDamageImmune field value.",
                    goInfo->id, goInfo->type, N, dataN);
}

inline void CheckGOConsumable(GameObjectInfo const* goInfo, uint32 dataN, uint32 N)
{
    // 0/1 correct values
    if (dataN <= 1)
        return;

    sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data%d=%u but expected boolean (0/1) consumable field value.",
                    goInfo->id, goInfo->type, N, dataN);
}

void ObjectMgr::LoadGameobjectInfo()
{
    SQLGameObjectLoader loader;
    loader.LoadProgressive(sGOStorage, sWorld.GetWowPatch());
    CheckGameObjectInfos();
    sLog.outString(">> Loaded %u game object templates", sGOStorage.GetRecordCount());
    sLog.outString();
}

void ObjectMgr::CheckGameObjectInfos()
{
    // some checks
    for (auto itr = sGOStorage.begin<GameObjectInfo>(); itr != sGOStorage.end<GameObjectInfo>(); ++itr)
    {
        if (itr->size <= 0.0f)                           // prevent use too small scales
        {
            ERROR_DB_STRICT_LOG("Gameobject (Entry: %u GoType: %u) have too small size=%f",
                itr->id, itr->type, itr->size);
            const_cast<GameObjectInfo*>(*itr)->size =  DEFAULT_OBJECT_SCALE;
        }

        // some GO types have unused go template, check goInfo->displayId at GO spawn data loading or ignore

        switch (itr->type)
        {
            case GAMEOBJECT_TYPE_DOOR:                      //0
            {
                if (itr->door.lockId)
                    CheckGOLockId(*itr, itr->door.lockId, 1);
                CheckGONoDamageImmuneId(*itr, itr->door.noDamageImmune, 3);
                break;
            }
            case GAMEOBJECT_TYPE_BUTTON:                    //1
            {
                if (itr->button.lockId)
                    CheckGOLockId(*itr, itr->button.lockId, 1);
                if (itr->button.linkedTrapId)              // linked trap
                    CheckGOLinkedTrapId(*itr, itr->button.linkedTrapId, 3);
                CheckGONoDamageImmuneId(*itr, itr->button.noDamageImmune, 4);
                break;
            }
            case GAMEOBJECT_TYPE_QUESTGIVER:                //2
            {
                if (itr->questgiver.lockId)
                    CheckGOLockId(*itr, itr->questgiver.lockId, 0);
                CheckGONoDamageImmuneId(*itr, itr->questgiver.noDamageImmune, 5);
                break;
            }
            case GAMEOBJECT_TYPE_CHEST:                     //3
            {
                if (itr->chest.lockId)
                    CheckGOLockId(*itr, itr->chest.lockId, 0);

                CheckGOConsumable(*itr, itr->chest.consumable, 3);

                if (itr->chest.linkedTrapId)              // linked trap
                    CheckGOLinkedTrapId(*itr, itr->chest.linkedTrapId, 7);
                break;
            }
            case GAMEOBJECT_TYPE_TRAP:                      //6
            {
                if (itr->trap.lockId)
                    CheckGOLockId(*itr, itr->trap.lockId, 0);
                /* disable check for while, too many nonexistent spells
                if (goInfo->trap.spellId)                   // spell
                    CheckGOSpellId(goInfo,goInfo->trap.spellId,3);
                */
                break;
            }
            case GAMEOBJECT_TYPE_CHAIR:                     //7
                CheckAndFixGOChairHeightId(*itr, itr->chair.height, 1);
                break;
            case GAMEOBJECT_TYPE_SPELL_FOCUS:               //8
            {
                if (itr->spellFocus.focusId)
                {
                    if (!sSpellFocusObjectStore.LookupEntry(itr->spellFocus.focusId))
                        sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data0=%u but SpellFocus (Id: %u) not exist.",
                            itr->id, itr->type, itr->spellFocus.focusId, itr->spellFocus.focusId);
                }

                if (itr->spellFocus.linkedTrapId)        // linked trap
                    CheckGOLinkedTrapId(*itr, itr->spellFocus.linkedTrapId, 2);
                break;
            }
            case GAMEOBJECT_TYPE_GOOBER:                    //10
            {
                if (itr->goober.lockId)
                    CheckGOLockId(*itr, itr->goober.lockId, 0);

                CheckGOConsumable(*itr, itr->goober.consumable, 3);

                if (itr->goober.pageId)                  // pageId
                {
                    if (!sPageTextStore.LookupEntry<PageText>(itr->goober.pageId))
                        sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data7=%u but PageText (Entry %u) not exist.",
                            itr->id, itr->type, itr->goober.pageId, itr->goober.pageId);
                }
                /* disable check for while, too many nonexistent spells
                if (goInfo->goober.spellId)                 // spell
                    CheckGOSpellId(goInfo,goInfo->goober.spellId,10);
                */
                CheckGONoDamageImmuneId(*itr, itr->goober.noDamageImmune, 11);
                if (itr->goober.linkedTrapId)            // linked trap
                    CheckGOLinkedTrapId(*itr, itr->goober.linkedTrapId, 12);
                break;
            }
            case GAMEOBJECT_TYPE_AREADAMAGE:                //12
            {
                if (itr->areadamage.lockId)
                    CheckGOLockId(*itr, itr->areadamage.lockId, 0);
                break;
            }
            case GAMEOBJECT_TYPE_CAMERA:                    //13
            {
                if (itr->camera.lockId)
                    CheckGOLockId(*itr, itr->camera.lockId, 0);
                break;
            }
            case GAMEOBJECT_TYPE_MO_TRANSPORT:              //15
            {
                if (itr->moTransport.taxiPathId)
                {
                    if (itr->moTransport.taxiPathId >= sTaxiPathNodesByPath.size() || sTaxiPathNodesByPath[itr->moTransport.taxiPathId].empty())
                        sLog.outErrorDb("Gameobject (Entry: %u GoType: %u) have data0=%u but TaxiPath (Id: %u) not exist.",
                            itr->id, itr->type, itr->moTransport.taxiPathId, itr->moTransport.taxiPathId);
                }
                break;
            }
            case GAMEOBJECT_TYPE_SUMMONING_RITUAL:          //18
            {
                /* disable check for while, too many nonexistent spells
                // always must have spell
                CheckGOSpellId(goInfo,goInfo->summoningRitual.spellId,1);
                */
                break;
            }
            case GAMEOBJECT_TYPE_SPELLCASTER:               //22
            {
                // always must have spell
                CheckGOSpellId(*itr, itr->spellcaster.spellId, 0);
                break;
            }
            case GAMEOBJECT_TYPE_FLAGSTAND:                 //24
            {
                if (itr->flagstand.lockId)
                    CheckGOLockId(*itr, itr->flagstand.lockId, 0);
                CheckGONoDamageImmuneId(*itr, itr->flagstand.noDamageImmune, 5);
                break;
            }
            case GAMEOBJECT_TYPE_FISHINGHOLE:               //25
            {
                if (itr->fishinghole.lockId)
                    CheckGOLockId(*itr, itr->fishinghole.lockId, 4);
                break;
            }
            case GAMEOBJECT_TYPE_FLAGDROP:                  //26
            {
                if (itr->flagdrop.lockId)
                    CheckGOLockId(*itr, itr->flagdrop.lockId, 0);
                CheckGONoDamageImmuneId(*itr, itr->flagdrop.noDamageImmune, 3);
                break;
            }
        }
    }
}


void ObjectMgr::LoadGameobjectsRequirements()
{
    uint32 count = 0;
    QueryResult *result = WorldDatabase.Query("SELECT guid, reqType, reqGuid FROM gameobject_requirement");
    _gobjRequirements.clear();

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u gameobject requirements", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();
        uint32 guid = fields[0].GetUInt32();
        if (!GetGOData(guid))
        {
            if (!sObjectMgr.IsExistingGameObjectGuid(guid))
                sLog.outErrorDb("Table `gameobject_requirement` has data for invalid game object guid (%u)", guid);
            continue;
        }

        GameObjectUseRequirement entry;
        entry.reqType = GameObjectUseRequirement::GameObjectUseRequireType(fields[1].GetUInt8());
        uint32 reqGuidLow = fields[2].GetUInt32();
        switch (entry.reqType)
        {
            case GameObjectUseRequirement::GOBJ_REQUIRE_DEAD_CREATURE:
                if (CreatureData const* data = GetCreatureData(reqGuidLow))
                    entry.guid = ObjectGuid(HIGHGUID_UNIT, data->id, reqGuidLow);
                else
                {
                    sLog.outErrorDb("Table `gameobject_requirement` has not found creature guid (%u)", reqGuidLow);
                    continue;
                }
                break;
            case GameObjectUseRequirement::GOBJ_REQUIRE_ACTIVE_OBJECT:
                if (GameObjectData const* data = GetGOData(reqGuidLow))
                    entry.guid = ObjectGuid(HIGHGUID_GAMEOBJECT, data->id, reqGuidLow);
                else
                {
                    sLog.outErrorDb("Table `gameobject_requirement` has not found game object guid (%u)", reqGuidLow);
                    continue;
                }
                break;
            default:
                sLog.outErrorDb("Table `gameobject_requirement` has invalid reqType (%u)", entry.reqType);
                break;
        }

        _gobjRequirements[guid] = entry;
        ++count;
    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u GameObjects requirements", count);
}

GameObjectUseRequirement const* ObjectMgr::GetGameObjectUseRequirement(ObjectGuid guid) const
{
    std::map<uint32, GameObjectUseRequirement>::const_iterator it = _gobjRequirements.find(guid.GetCounter());
    if (it != _gobjRequirements.end())
        return &it->second;
    return NULL;
}

void ObjectMgr::LoadExplorationBaseXP()
{
    uint32 count = 0;
    QueryResult *result = WorldDatabase.Query("SELECT level,basexp FROM exploration_basexp");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u BaseXP definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();
        uint32 level  = fields[0].GetUInt32();
        uint32 basexp = fields[1].GetUInt32();
        mBaseXPTable[level] = basexp;
        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u BaseXP definitions", count);
}

uint32 ObjectMgr::GetBaseXP(uint32 level) const
{
    BaseXPMap::const_iterator itr = mBaseXPTable.find(level);
    return itr != mBaseXPTable.end() ? itr->second : 0;
}

uint32 ObjectMgr::GetXPForLevel(uint32 level) const
{
    if (level < mPlayerXPperLevel.size())
        return mPlayerXPperLevel[level];
    return 0;
}

void ObjectMgr::LoadPetNames()
{
    uint32 count = 0;
    QueryResult *result = WorldDatabase.Query("SELECT word,entry,half FROM pet_name_generation");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u pet name parts", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();
        std::string word = fields[0].GetString();
        uint32 entry     = fields[1].GetUInt32();
        bool   half      = fields[2].GetBool();
        if (half)
            PetHalfName1[entry].push_back(word);
        else
            PetHalfName0[entry].push_back(word);
        ++count;
    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u pet name parts", count);
}

void ObjectMgr::LoadPetNumber()
{
    m_NextPetNumber = 1;
}

uint32 ObjectMgr::GeneratePetNumber()
{
    m_NextPetNumber = sCharacterDatabaseCache.GetNextAvailablePetNumber(m_NextPetNumber);
    return m_NextPetNumber++;
}

std::string ObjectMgr::GeneratePetName(uint32 entry)
{
    std::vector<std::string> & list0 = PetHalfName0[entry];
    std::vector<std::string> & list1 = PetHalfName1[entry];

    if (list0.empty() || list1.empty())
    {
        CreatureInfo const *cinfo = GetCreatureTemplate(entry);
        char const* petname = GetPetName(cinfo->family, sWorld.GetDefaultDbcLocale());
        if (!petname)
            petname = cinfo->Name;
        return std::string(petname);
    }

    return *(list0.begin() + urand(0, list0.size() - 1)) + *(list1.begin() + urand(0, list1.size() - 1));
}

void ObjectMgr::LoadCorpses()
{
    uint32 count = 0;
    //                                                    0            1       2                  3                  4                  5                   6
    QueryResult *result = CharacterDatabase.Query("SELECT corpse.guid, player, corpse.position_x, corpse.position_y, corpse.position_z, corpse.orientation, corpse.map, "
                          //   7     8            9     10      11    12     13           14            15              16       17
                          "time, corpse_type, instance, gender, race, class, playerBytes, playerBytes2, equipmentCache, guildId, playerFlags FROM corpse "
                          "JOIN characters ON player = characters.guid "
                          "LEFT JOIN guild_member ON player=guild_member.guid WHERE corpse_type <> 0");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u corpses", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();

        uint32 guid = fields[0].GetUInt32();

        Corpse *corpse = new Corpse;
        if (!corpse->LoadFromDB(guid, fields))
        {
            delete corpse;
            continue;
        }

        sObjectAccessor.AddCorpse(corpse);

        ++count;
    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u corpses", count);
}

void ObjectMgr::LoadFactions()
{
    sLog.outString("Loading factions ...");

    // Getting the maximum ID.
    QueryResult* result = WorldDatabase.Query("SELECT MAX(ID) FROM faction");

    if (!result)
    {
        sLog.outString(">> Loaded 0 factions. DB table `faction` is empty.");
        return;
    }
    auto fields = result->Fetch();
    uint32 maxFactionEntry = fields[0].GetUInt32() + 1;
    delete result;

    // Actually loading the factions.
    result = WorldDatabase.Query("SELECT * FROM faction");

    if (!result)
    {
        sLog.outString(">> Loaded 0 factions. DB table `faction` is empty.");
        return;
    }

    mFactions.resize(maxFactionEntry, nullptr);

    do
    {
        fields = result->Fetch();

        FactionEntry* faction = new FactionEntry();

        uint32 factionId = fields[0].GetUInt32();

        faction->ID = factionId;
        faction->reputationListID = fields[1].GetInt32();
        faction->BaseRepRaceMask[0] = fields[2].GetUInt32();
        faction->BaseRepRaceMask[1] = fields[3].GetUInt32();
        faction->BaseRepRaceMask[2] = fields[4].GetUInt32();
        faction->BaseRepRaceMask[3] = fields[5].GetUInt32();
        faction->BaseRepClassMask[0] = fields[6].GetUInt32();
        faction->BaseRepClassMask[1] = fields[7].GetUInt32();
        faction->BaseRepClassMask[2] = fields[8].GetUInt32();
        faction->BaseRepClassMask[3] = fields[9].GetUInt32();
        faction->BaseRepValue[0] = fields[10].GetInt32();
        faction->BaseRepValue[1] = fields[11].GetInt32();
        faction->BaseRepValue[2] = fields[12].GetInt32();
        faction->BaseRepValue[3] = fields[13].GetInt32();
        faction->ReputationFlags[0] = fields[14].GetUInt32();
        faction->ReputationFlags[1] = fields[15].GetUInt32();
        faction->ReputationFlags[2] = fields[16].GetUInt32();
        faction->ReputationFlags[3] = fields[17].GetUInt32();
        faction->team = fields[18].GetUInt32();
        faction->name[0] = new char[strlen(fields[19].GetString()) + 1];
        strcpy(faction->name[0], fields[19].GetString());
        faction->name[1] = new char[strlen(fields[20].GetString()) + 1];
        strcpy(faction->name[1], fields[20].GetString());
        faction->name[2] = new char[strlen(fields[21].GetString()) + 1];
        strcpy(faction->name[2], fields[21].GetString());
        faction->name[3] = new char[strlen(fields[22].GetString()) + 1];
        strcpy(faction->name[3], fields[22].GetString());
        faction->name[4] = new char[strlen(fields[23].GetString()) + 1];
        strcpy(faction->name[4], fields[23].GetString());
        faction->name[5] = new char[strlen(fields[24].GetString()) + 1];
        strcpy(faction->name[5], fields[24].GetString());
        faction->name[6] = new char[strlen(fields[25].GetString()) + 1];
        strcpy(faction->name[6], fields[25].GetString());
        faction->name[7] = new char[strlen(fields[26].GetString()) + 1];
        strcpy(faction->name[7], fields[26].GetString());

        mFactions[factionId] = faction;

    } while (result->NextRow());

    delete result;

    // Getting the maximum ID.
    result = WorldDatabase.Query("SELECT MAX(ID) FROM faction_template");

    if (!result)
    {
        sLog.outString(">> Loaded 0 faction templates. DB table `faction_template` is empty.");
        return;
    }
    fields = result->Fetch();
    uint32 maxFactionTemplateEntry = fields[0].GetUInt32() + 1;
    delete result;

    // Actually loading the faction templates.
    result = WorldDatabase.Query("SELECT * FROM faction_template");

    if (!result)
    {
        sLog.outString(">> Loaded 0 faction templates. DB table `faction_template` is empty.");
        return;
    }

    mFactionTemplates.resize(maxFactionTemplateEntry, nullptr);

    do
    {
        fields = result->Fetch();

        FactionTemplateEntry* faction = new FactionTemplateEntry();

        uint32 factionId = fields[0].GetUInt32();

        faction->ID = factionId;
        faction->faction = fields[1].GetUInt32();
        faction->factionFlags = fields[2].GetUInt32();
        faction->ourMask = fields[3].GetUInt32();
        faction->friendlyMask = fields[4].GetUInt32();
        faction->hostileMask = fields[5].GetUInt32();
        faction->enemyFaction[0] = fields[6].GetUInt32();
        faction->enemyFaction[1] = fields[7].GetUInt32();
        faction->enemyFaction[2] = fields[8].GetUInt32();
        faction->enemyFaction[3] = fields[9].GetUInt32();
        faction->friendFaction[0] = fields[10].GetInt32();
        faction->friendFaction[1] = fields[11].GetInt32();
        faction->friendFaction[2] = fields[12].GetInt32();
        faction->friendFaction[3] = fields[13].GetInt32();

        mFactionTemplates[factionId] = faction;

    } while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u factions and %u faction templates.", maxFactionEntry, maxFactionTemplateEntry);
}

void ObjectMgr::LoadReputationRewardRate()
{
    m_RepRewardRateMap.clear();                             // for reload case

    uint32 count = 0;
    QueryResult *result = WorldDatabase.Query("SELECT faction, quest_rate, creature_rate, spell_rate FROM reputation_reward_rate");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded `reputation_reward_rate`, table is empty!");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();

        uint32 factionId        = fields[0].GetUInt32();

        RepRewardRate repRate;

        repRate.quest_rate      = fields[1].GetFloat();
        repRate.creature_rate   = fields[2].GetFloat();
        repRate.spell_rate      = fields[3].GetFloat();

        FactionEntry const *factionEntry = GetFactionEntry(factionId);
        if (!factionEntry)
        {
            sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `reputation_reward_rate`", factionId);
            continue;
        }

        if (repRate.quest_rate < 0.0f)
        {
            sLog.outErrorDb("Table reputation_reward_rate has quest_rate with invalid rate %f, skipping data for faction %u", repRate.quest_rate, factionId);
            continue;
        }

        if (repRate.creature_rate < 0.0f)
        {
            sLog.outErrorDb("Table reputation_reward_rate has creature_rate with invalid rate %f, skipping data for faction %u", repRate.creature_rate, factionId);
            continue;
        }

        if (repRate.spell_rate < 0.0f)
        {
            sLog.outErrorDb("Table reputation_reward_rate has spell_rate with invalid rate %f, skipping data for faction %u", repRate.spell_rate, factionId);
            continue;
        }

        m_RepRewardRateMap[factionId] = repRate;

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u reputation_reward_rate", count);
}

void ObjectMgr::LoadReputationOnKill()
{
    uint32 count = 0;

    //                                                0            1                     2
    QueryResult *result = WorldDatabase.Query("SELECT creature_id, RewOnKillRepFaction1, RewOnKillRepFaction2,"
                          //   3             4             5                   6             7             8                   9
                          "IsTeamAward1, MaxStanding1, RewOnKillRepValue1, IsTeamAward2, MaxStanding2, RewOnKillRepValue2, TeamDependent "
                          "FROM creature_onkill_reputation");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 creature award reputation definitions. DB table `creature_onkill_reputation` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 creature_id = fields[0].GetUInt32();

        ReputationOnKillEntry repOnKill;
        repOnKill.repfaction1          = fields[1].GetUInt32();
        repOnKill.repfaction2          = fields[2].GetUInt32();
        repOnKill.is_teamaward1        = fields[3].GetBool();
        repOnKill.reputation_max_cap1  = fields[4].GetUInt32();
        repOnKill.repvalue1            = fields[5].GetInt32();
        repOnKill.is_teamaward2        = fields[6].GetBool();
        repOnKill.reputation_max_cap2  = fields[7].GetUInt32();
        repOnKill.repvalue2            = fields[8].GetInt32();
        repOnKill.team_dependent       = fields[9].GetUInt8();

        if (!GetCreatureTemplate(creature_id))
        {
            if (!sObjectMgr.IsExistingCreatureId(creature_id))
                sLog.outErrorDb("Table `creature_onkill_reputation` have data for nonexistent creature entry (%u), skipped", creature_id);
            continue;
        }

        if (repOnKill.repfaction1)
        {
            FactionEntry const *factionEntry1 = GetFactionEntry(repOnKill.repfaction1);
            if (!factionEntry1)
            {
                sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `creature_onkill_reputation`", repOnKill.repfaction1);
                continue;
            }
        }

        if (repOnKill.repfaction2)
        {
            FactionEntry const *factionEntry2 = GetFactionEntry(repOnKill.repfaction2);
            if (!factionEntry2)
            {
                sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `creature_onkill_reputation`", repOnKill.repfaction2);
                continue;
            }
        }

        mRepOnKill[creature_id] = repOnKill;

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u creature award reputation definitions", count);
}

void ObjectMgr::LoadReputationSpilloverTemplate()
{
    m_RepSpilloverTemplateMap.clear();                      // for reload case

    uint32 count = 0;
    QueryResult *result = WorldDatabase.Query("SELECT faction, faction1, rate_1, rank_1, faction2, rate_2, rank_2, faction3, rate_3, rank_3, faction4, rate_4, rank_4 FROM reputation_spillover_template");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded `reputation_spillover_template`, table is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();

        uint32 factionId                = fields[0].GetUInt32();

        RepSpilloverTemplate repTemplate;

        repTemplate.faction[0]          = fields[1].GetUInt32();
        repTemplate.faction_rate[0]     = fields[2].GetFloat();
        repTemplate.faction_rank[0]     = fields[3].GetUInt32();
        repTemplate.faction[1]          = fields[4].GetUInt32();
        repTemplate.faction_rate[1]     = fields[5].GetFloat();
        repTemplate.faction_rank[1]     = fields[6].GetUInt32();
        repTemplate.faction[2]          = fields[7].GetUInt32();
        repTemplate.faction_rate[2]     = fields[8].GetFloat();
        repTemplate.faction_rank[2]     = fields[9].GetUInt32();
        repTemplate.faction[3]          = fields[10].GetUInt32();
        repTemplate.faction_rate[3]     = fields[11].GetFloat();
        repTemplate.faction_rank[3]     = fields[12].GetUInt32();

        FactionEntry const *factionEntry = GetFactionEntry(factionId);

        if (!factionEntry)
        {
            sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `reputation_spillover_template`", factionId);
            continue;
        }

        for (uint32 i = 0; i < MAX_SPILLOVER_FACTIONS; ++i)
        {
            if (repTemplate.faction[i])
            {
                FactionEntry const *factionSpillover = GetFactionEntry(repTemplate.faction[i]);

                if (!factionSpillover)
                {
                    sLog.outErrorDb("Spillover faction (faction.dbc) %u does not exist but is used in `reputation_spillover_template` for faction %u, skipping", repTemplate.faction[i], factionId);
                    continue;
                }

                if (factionSpillover->reputationListID < 0)
                {
                    sLog.outErrorDb("Spillover faction (faction.dbc) %u for faction %u in `reputation_spillover_template` can not be listed for client, and then useless, skipping", repTemplate.faction[i], factionId);
                    continue;
                }

                if (repTemplate.faction_rank[i] >= MAX_REPUTATION_RANK)
                {
                    sLog.outErrorDb("Rank %u used in `reputation_spillover_template` for spillover faction %u is not valid, skipping", repTemplate.faction_rank[i], repTemplate.faction[i]);
                    continue;
                }
            }
        }

        FactionEntry const *factionEntry0 = GetFactionEntry(repTemplate.faction[0]);
        if (repTemplate.faction[0] && !factionEntry0)
        {
            sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `reputation_spillover_template`", repTemplate.faction[0]);
            continue;
        }
        FactionEntry const *factionEntry1 = GetFactionEntry(repTemplate.faction[1]);
        if (repTemplate.faction[1] && !factionEntry1)
        {
            sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `reputation_spillover_template`", repTemplate.faction[1]);
            continue;
        }
        FactionEntry const *factionEntry2 = GetFactionEntry(repTemplate.faction[2]);
        if (repTemplate.faction[2] && !factionEntry2)
        {
            sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `reputation_spillover_template`", repTemplate.faction[2]);
            continue;
        }
        FactionEntry const *factionEntry3 = GetFactionEntry(repTemplate.faction[3]);
        if (repTemplate.faction[3] && !factionEntry3)
        {
            sLog.outErrorDb("Faction (faction.dbc) %u does not exist but is used in `reputation_spillover_template`", repTemplate.faction[3]);
            continue;
        }

        m_RepSpilloverTemplateMap[factionId] = repTemplate;

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u reputation_spillover_template", count);
}

void ObjectMgr::LoadPointsOfInterest()
{
    mPointsOfInterest.clear();                              // need for reload case

    uint32 count = 0;

    //                                                0      1  2  3      4     5
    QueryResult *result = WorldDatabase.Query("SELECT entry, x, y, icon, flags, data, icon_name FROM points_of_interest");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 Points of Interest definitions. DB table `points_of_interest` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 point_id = fields[0].GetUInt32();

        PointOfInterest POI;
        POI.x                    = fields[1].GetFloat();
        POI.y                    = fields[2].GetFloat();
        POI.icon                 = fields[3].GetUInt32();
        POI.flags                = fields[4].GetUInt32();
        POI.data                 = fields[5].GetUInt32();
        POI.icon_name            = fields[6].GetCppString();

        if (!MaNGOS::IsValidMapCoord(POI.x, POI.y))
        {
            sLog.outErrorDb("Table `points_of_interest` (Entry: %u) have invalid coordinates (X: %f Y: %f), ignored.", point_id, POI.x, POI.y);
            continue;
        }

        mPointsOfInterest[point_id] = POI;

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u Points of Interest definitions", count);
}

void ObjectMgr::LoadWeatherZoneChances()
{
    uint32 count = 0;

    //                                                0     1                   2                   3                    4                   5                   6                    7                 8                 9                  10                  11                  12
    QueryResult *result = WorldDatabase.Query("SELECT zone, spring_rain_chance, spring_snow_chance, spring_storm_chance, summer_rain_chance, summer_snow_chance, summer_storm_chance, fall_rain_chance, fall_snow_chance, fall_storm_chance, winter_rain_chance, winter_snow_chance, winter_storm_chance FROM game_weather");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 weather definitions. DB table `game_weather` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 zone_id = fields[0].GetUInt32();

        WeatherZoneChances& wzc = mWeatherZoneMap[zone_id];

        for (int season = 0; season < WEATHER_SEASONS; ++season)
        {
            wzc.data[season].rainChance  = fields[season * (MAX_WEATHER_TYPE - 1) + 1].GetUInt32();
            wzc.data[season].snowChance  = fields[season * (MAX_WEATHER_TYPE - 1) + 2].GetUInt32();
            wzc.data[season].stormChance = fields[season * (MAX_WEATHER_TYPE - 1) + 3].GetUInt32();

            if (wzc.data[season].rainChance > 100)
            {
                wzc.data[season].rainChance = 25;
                sLog.outErrorDb("Weather for zone %u season %u has wrong rain chance > 100%%", zone_id, season);
            }

            if (wzc.data[season].snowChance > 100)
            {
                wzc.data[season].snowChance = 25;
                sLog.outErrorDb("Weather for zone %u season %u has wrong snow chance > 100%%", zone_id, season);
            }

            if (wzc.data[season].stormChance > 100)
            {
                wzc.data[season].stormChance = 25;
                sLog.outErrorDb("Weather for zone %u season %u has wrong storm chance > 100%%", zone_id, season);
            }
        }

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u weather definitions", count);
}

void ObjectMgr::DeleteCreatureData(uint32 guid)
{
    // remove mapid*cellid -> guid_set map
    CreatureData const* data = GetCreatureData(guid);
    if (data)
        RemoveCreatureFromGrid(guid, data);

    mCreatureDataMap.erase(guid);
}

void ObjectMgr::DeleteGOData(uint32 guid)
{
    // remove mapid*cellid -> guid_set map
    GameObjectData const* data = GetGOData(guid);
    if (data)
        RemoveGameobjectFromGrid(guid, data);

    mGameObjectDataMap.erase(guid);
}

void ObjectMgr::AddCorpseCellData(uint32 mapid, uint32 cellid, uint32 player_guid, uint32 instance)
{
    // corpses are always added to spawn mode 0 and they are spawned by their instance id
    mMapObjectGuids_lock.acquire();
    CellObjectGuids& cell_guids = mMapObjectGuids[mapid][cellid];
    cell_guids.corpses[player_guid] = instance;
    mMapObjectGuids_lock.release();
}

void ObjectMgr::DeleteCorpseCellData(uint32 mapid, uint32 cellid, uint32 player_guid)
{
    // corpses are always added to spawn mode 0 and they are spawned by their instance id
    CellObjectGuids& cell_guids = mMapObjectGuids[mapid][cellid];
    cell_guids.corpses.erase(player_guid);
}

void ObjectMgr::LoadQuestRelationsHelper(QuestRelationsMap& map, char const* table)
{
    map.clear();                                            // need for reload case

    uint32 count = 0;

    QueryResult *result = WorldDatabase.PQuery("SELECT id,quest FROM %s t1 WHERE patch=(SELECT max(patch) FROM %s t2 WHERE t1.id=t2.id && t1.quest=t2.quest && patch <= %u)", table, table, sWorld.GetWowPatch());

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 quest relations from %s. DB table `%s` is empty.", table, table);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 id    = fields[0].GetUInt32();
        uint32 quest = fields[1].GetUInt32();

        if (mQuestTemplates.find(quest) == mQuestTemplates.end())
        {
            sLog.outErrorDb("Table `%s: Quest %u listed for entry %u does not exist.", table, quest, id);
            continue;
        }

        map.insert(QuestRelationsMap::value_type(id, quest));

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u quest relations from %s", count, table);
}

void ObjectMgr::LoadGameobjectQuestRelations()
{
    LoadQuestRelationsHelper(m_GOQuestRelations, "gameobject_questrelation");

    for (QuestRelationsMap::iterator itr = m_GOQuestRelations.begin(); itr != m_GOQuestRelations.end(); ++itr)
    {
        GameObjectInfo const* goInfo = GetGameObjectInfo(itr->first);
        if (!goInfo)
            sLog.outErrorDb("Table `gameobject_questrelation` have data for nonexistent gameobject entry (%u) and existing quest %u", itr->first, itr->second);
        else if (goInfo->type != GAMEOBJECT_TYPE_QUESTGIVER)
            sLog.outErrorDb("Table `gameobject_questrelation` have data gameobject entry (%u) for quest %u, but GO is not GAMEOBJECT_TYPE_QUESTGIVER", itr->first, itr->second);
    }
}

void ObjectMgr::LoadGameobjectInvolvedRelations()
{
    LoadQuestRelationsHelper(m_GOQuestInvolvedRelations, "gameobject_involvedrelation");

    for (QuestRelationsMap::iterator itr = m_GOQuestInvolvedRelations.begin(); itr != m_GOQuestInvolvedRelations.end(); ++itr)
    {
        GameObjectInfo const* goInfo = GetGameObjectInfo(itr->first);
        if (!goInfo)
            sLog.outErrorDb("Table `gameobject_involvedrelation` have data for nonexistent gameobject entry (%u) and existing quest %u", itr->first, itr->second);
        else if (goInfo->type != GAMEOBJECT_TYPE_QUESTGIVER)
            sLog.outErrorDb("Table `gameobject_involvedrelation` have data gameobject entry (%u) for quest %u, but GO is not GAMEOBJECT_TYPE_QUESTGIVER", itr->first, itr->second);
    }
}

void ObjectMgr::LoadCreatureQuestRelations()
{
    LoadQuestRelationsHelper(m_CreatureQuestRelations, "creature_questrelation");

    for (QuestRelationsMap::iterator itr = m_CreatureQuestRelations.begin(); itr != m_CreatureQuestRelations.end(); ++itr)
    {
        CreatureInfo const* cInfo = GetCreatureTemplate(itr->first);
        if (!cInfo)
            sLog.outErrorDb("Table `creature_questrelation` have data for nonexistent creature entry (%u) and existing quest %u", itr->first, itr->second);
        else if (!(cInfo->npcflag & UNIT_NPC_FLAG_QUESTGIVER))
            sLog.outDetail("Table `creature_questrelation` has creature entry (%u) for quest %u, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER", itr->first, itr->second);
    }
}

void ObjectMgr::LoadCreatureInvolvedRelations()
{
    LoadQuestRelationsHelper(m_CreatureQuestInvolvedRelations, "creature_involvedrelation");

    for (QuestRelationsMap::iterator itr = m_CreatureQuestInvolvedRelations.begin(); itr != m_CreatureQuestInvolvedRelations.end(); ++itr)
    {
        CreatureInfo const* cInfo = GetCreatureTemplate(itr->first);
        if (!cInfo)
            sLog.outErrorDb("Table `creature_involvedrelation` have data for nonexistent creature entry (%u) and existing quest %u", itr->first, itr->second);
        else if (!(cInfo->npcflag & UNIT_NPC_FLAG_QUESTGIVER))
            sLog.outDetail("Table `creature_involvedrelation` has creature entry (%u) for quest %u, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER", itr->first, itr->second);
    }
}

void ObjectMgr::LoadReservedPlayersNames()
{
    m_ReservedNames.clear();                                // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT name FROM reserved_name");

    uint32 count = 0;

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u reserved player names", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    Field* fields;
    do
    {
        bar.step();
        fields = result->Fetch();
        std::string name = fields[0].GetCppString();

        std::wstring wstr;
        if (!Utf8toWStr(name, wstr))
        {
            sLog.outError("Table `reserved_name` have invalid name: %s", name.c_str());
            continue;
        }

        wstrToLower(wstr);

        m_ReservedNames.insert(wstr);
        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u reserved player names", count);
}

bool ObjectMgr::IsReservedName(const std::string& name) const
{
    std::wstring wstr;
    if (!Utf8toWStr(name, wstr))
        return false;

    wstrToLower(wstr);

    return m_ReservedNames.find(wstr) != m_ReservedNames.end();
}

enum LanguageType
{
    LT_BASIC_LATIN    = 0x0000,
    LT_EXTENDEN_LATIN = 0x0001,
    LT_CYRILLIC       = 0x0002,
    LT_EAST_ASIA      = 0x0004,
    LT_ANY            = 0xFFFF
};

static LanguageType GetRealmLanguageType(bool create)
{
    switch (sWorld.getConfig(CONFIG_UINT32_REALM_ZONE))
    {
        case REALM_ZONE_UNKNOWN:                            // any language
        case REALM_ZONE_DEVELOPMENT:
        case REALM_ZONE_TEST_SERVER:
        case REALM_ZONE_QA_SERVER:
            return LT_ANY;
        case REALM_ZONE_UNITED_STATES:                      // extended-Latin
        case REALM_ZONE_OCEANIC:
        case REALM_ZONE_LATIN_AMERICA:
        case REALM_ZONE_ENGLISH:
        case REALM_ZONE_GERMAN:
        case REALM_ZONE_FRENCH:
        case REALM_ZONE_SPANISH:
            return LT_EXTENDEN_LATIN;
        case REALM_ZONE_KOREA:                              // East-Asian
        case REALM_ZONE_TAIWAN:
        case REALM_ZONE_CHINA:
            return LT_EAST_ASIA;
        case REALM_ZONE_RUSSIAN:                            // Cyrillic
            return LT_CYRILLIC;
        default:
            return create ? LT_BASIC_LATIN : LT_ANY;        // basic-Latin at create, any at login
    }
}

bool isValidString(const std::wstring& wstr, uint32 strictMask, bool numericOrSpace, bool create = false)
{
    if (strictMask == 0)                                    // any language, ignore realm
    {
        if (isExtendedLatinString(wstr, numericOrSpace))
            return true;
        if (isCyrillicString(wstr, numericOrSpace))
            return true;
        if (isEastAsianString(wstr, numericOrSpace))
            return true;
        return false;
    }

    if (strictMask & 0x2)                                   // realm zone specific
    {
        LanguageType lt = GetRealmLanguageType(create);
        if (lt & LT_EXTENDEN_LATIN)
            if (isExtendedLatinString(wstr, numericOrSpace))
                return true;
        if (lt & LT_CYRILLIC)
            if (isCyrillicString(wstr, numericOrSpace))
                return true;
        if (lt & LT_EAST_ASIA)
            if (isEastAsianString(wstr, numericOrSpace))
                return true;
    }

    if (strictMask & 0x1)                                   // basic Latin
    {
        if (isBasicLatinString(wstr, numericOrSpace))
            return true;
    }

    return false;
}

uint8 ObjectMgr::CheckPlayerName(const std::string& name, bool create)
{
    std::wstring wname;
    if (!Utf8toWStr(name, wname))
        return CHAR_NAME_INVALID_CHARACTER;

    if (wname.size() > MAX_PLAYER_NAME)
        return CHAR_NAME_TOO_LONG;

    uint32 minName = sWorld.getConfig(CONFIG_UINT32_MIN_PLAYER_NAME);
    if (wname.size() < minName)
        return CHAR_NAME_TOO_SHORT;

    uint32 strictMask = sWorld.getConfig(CONFIG_UINT32_STRICT_PLAYER_NAMES);
    if (!isValidString(wname, strictMask, false, create))
        return CHAR_NAME_MIXED_LANGUAGES;

    return CHAR_NAME_SUCCESS;
}

bool ObjectMgr::IsValidCharterName(const std::string& name)
{
    std::wstring wname;
    if (!Utf8toWStr(name, wname))
        return false;

    if (wname.size() > MAX_CHARTER_NAME)
        return false;

    uint32 minName = sWorld.getConfig(CONFIG_UINT32_MIN_CHARTER_NAME);
    if (wname.size() < minName)
        return false;

    uint32 strictMask = sWorld.getConfig(CONFIG_UINT32_STRICT_CHARTER_NAMES);

    return isValidString(wname, strictMask, true);
}

PetNameInvalidReason ObjectMgr::CheckPetName(const std::string& name)
{
    std::wstring wname;
    if (!Utf8toWStr(name, wname))
        return PET_NAME_INVALID;

    if (wname.size() > MAX_PET_NAME)
        return PET_NAME_TOO_LONG;

    uint32 minName = sWorld.getConfig(CONFIG_UINT32_MIN_PET_NAME);
    if (wname.size() < minName)
        return PET_NAME_TOO_SHORT;

    uint32 strictMask = sWorld.getConfig(CONFIG_UINT32_STRICT_PET_NAMES);
    if (!isValidString(wname, strictMask, false))
        return PET_NAME_MIXED_LANGUAGES;

    return PET_NAME_SUCCESS;
}

int ObjectMgr::GetIndexForLocale(LocaleConstant loc)
{
    if (loc == LOCALE_enUS)
        return -1;

    for (size_t i = 0; i < m_LocalForIndex.size(); ++i)
        if (m_LocalForIndex[i] == loc)
            return i;

    return -1;
}

LocaleConstant ObjectMgr::GetLocaleForIndex(int i)
{
    if (i < 0 || i >= (int32)m_LocalForIndex.size())
        return LOCALE_enUS;

    return m_LocalForIndex[i];
}

int ObjectMgr::GetOrNewIndexForLocale(LocaleConstant loc)
{
    if (loc == LOCALE_enUS)
        return -1;

    for (size_t i = 0; i < m_LocalForIndex.size(); ++i)
        if (m_LocalForIndex[i] == loc)
            return i;

    m_LocalForIndex.push_back(loc);
    return m_LocalForIndex.size() - 1;
}

void ObjectMgr::LoadGameObjectForQuests()
{
    mGameObjectForQuestSet.clear();                         // need for reload case

    if (!sGOStorage.GetMaxEntry())
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded 0 GameObjects for quests");
        return;
    }

    BarGoLink bar(sGOStorage.GetRecordCount());
    uint32 count = 0;

    // collect GO entries for GO that must activated
    for (auto itr = sGOStorage.begin<GameObjectInfo>(); itr < sGOStorage.end<GameObjectInfo>(); ++itr)
    {
        bar.step();

        switch (itr->type)
        {
            case GAMEOBJECT_TYPE_QUESTGIVER:
            {
                if (m_GOQuestRelations.find(itr->id) != m_GOQuestRelations.end() ||
                        m_GOQuestInvolvedRelations.find(itr->id) != m_GOQuestInvolvedRelations.end())
                {
                    mGameObjectForQuestSet.insert(itr->id);
                    ++count;
                }

                break;
            }
            case GAMEOBJECT_TYPE_CHEST:
            {
                // scan GO chest with loot including quest items
                uint32 loot_id = itr->GetLootId();

                // always activate to quest, GO may not have loot, OR find if GO has loot for quest.
                if (itr->chest.questId || LootTemplates_Gameobject.HaveQuestLootFor(loot_id))
                {
                    mGameObjectForQuestSet.insert(itr->id);
                    ++count;
                }
                break;
            }
            case GAMEOBJECT_TYPE_GENERIC:
            {
                if (itr->_generic.questID)               // quest related objects, has visual effects
                {
                    mGameObjectForQuestSet.insert(itr->id);
                    count++;
                }
                break;
            }
            case GAMEOBJECT_TYPE_SPELL_FOCUS:
            {
                if (itr->spellFocus.questID)             // quest related objects, has visual effect
                {
                    mGameObjectForQuestSet.insert(itr->id);
                    count++;
                }
                break;
            }
            case GAMEOBJECT_TYPE_GOOBER:
            {
                if (itr->goober.questId)                 //quests objects
                {
                    mGameObjectForQuestSet.insert(itr->id);
                    count++;
                }
                break;
            }
            default:
                break;
        }
    }

    sLog.outString();
    sLog.outString(">> Loaded %u GameObjects for quests", count);
}

void ObjectMgr::LoadSoundEntries()
{
    sLog.outString("Loading sounds ...");

    // Getting the maximum ID.
    QueryResult* result = WorldDatabase.Query("SELECT MAX(ID) FROM sound_entries");

    if (!result)
    {
        sLog.outString(">> Loaded 0 sounds. DB table `sound_entries` is empty.");
        return;
    }
    auto fields = result->Fetch();
    uint32 maxSoundEntry = fields[0].GetUInt32() + 1;
    delete result;

    // Actually loading the sounds.
    result = WorldDatabase.Query("SELECT * FROM sound_entries");

    if (!result)
    {
        sLog.outString(">> Loaded 0 sounds. DB table `sound_entries` is empty.");
        return;
    }

    mSoundEntries.resize(maxSoundEntry, nullptr);

    do
    {
        fields = result->Fetch();

        SoundEntriesEntry* sound = new SoundEntriesEntry();
        uint32 soundId = fields[0].GetUInt32();

        sound->Id = soundId;
        sound->Name = fields[1].GetCppString();

        mSoundEntries[soundId] = sound;

    } while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u sound entries.", maxSoundEntry);
}

void ObjectMgr::LoadBroadcastTexts()
{
    mBroadcastTextLocaleMap.clear(); // for reload case

                                 //                    0     1         2         3      4        5        6         7         8          9            10           11
    QueryResult *result = WorldDatabase.Query("SELECT ID, MaleText, FemaleText, Sound, Type, Language, EmoteId0, EmoteId1, EmoteId2, EmoteDelay0, EmoteDelay1, EmoteDelay2 FROM broadcast_text");
    if (!result)
    {
        sLog.outString(">> Loaded 0 broadcast texts. DB table `broadcast_text` is empty.");
        return;
    }

    mBroadcastTextLocaleMap.rehash(result->GetRowCount());

    do
    {
        Field* fields = result->Fetch();

        BroadcastText bct;

        bct.Id = fields[0].GetUInt32();
        bct.MaleText[LOCALE_enUS] = fields[1].GetString() ? fields[1].GetString() : std::string();
        bct.FemaleText[LOCALE_enUS] = fields[2].GetString() ? fields[2].GetString() : std::string();
        bct.SoundId = fields[3].GetUInt32();
        bct.Type = fields[4].GetUInt32();
        bct.Language = fields[5].GetUInt32();
        bct.EmoteId0 = fields[6].GetUInt32();
        bct.EmoteId1 = fields[7].GetUInt32();
        bct.EmoteId2 = fields[8].GetUInt32();
        bct.EmoteDelay0 = fields[9].GetUInt32();
        bct.EmoteDelay1 = fields[10].GetUInt32();
        bct.EmoteDelay2 = fields[11].GetUInt32();
        

        if (bct.SoundId)
        {
            if (!GetSoundEntry(bct.SoundId))
            {
                sLog.outErrorDb("BroadcastText (Id: %u) in table `broadcast_text` has SoundId %u but sound does not exist.", bct.Id, bct.SoundId);
                bct.SoundId = 0;
            }
        }

        if (!GetLanguageDescByID(bct.Language))
        {
            sLog.outErrorDb("BroadcastText (Id: %u) in table `broadcast_text` using Language %u but Language does not exist.", bct.Id, bct.Language);
            bct.Language = LANG_UNIVERSAL;
        }

        if (bct.Type > CHAT_TYPE_ZONE_YELL)
        {
            sLog.outErrorDb("BroadcastText (Id: %u) in table `broadcast_text` has Type %u but this Chat Type does not exist.", bct.Id, bct.Type);
            bct.Type = CHAT_TYPE_SAY;
        }

        if (bct.EmoteId0)
        {
            if (!sEmotesStore.LookupEntry(bct.EmoteId0))
            {
                sLog.outErrorDb("BroadcastText (Id: %u) in table `broadcast_text` has EmoteId0 %u but emote does not exist.", bct.Id, bct.EmoteId0);
                bct.EmoteId0 = 0;
            }
        }

        if (bct.EmoteId1)
        {
            if (!sEmotesStore.LookupEntry(bct.EmoteId1))
            {
                sLog.outErrorDb("BroadcastText (Id: %u) in table `broadcast_text` has EmoteId1 %u but emote does not exist.", bct.Id, bct.EmoteId1);
                bct.EmoteId1 = 0;
            }
        }

        if (bct.EmoteId2)
        {
            if (!sEmotesStore.LookupEntry(bct.EmoteId2))
            {
                sLog.outErrorDb("BroadcastText (Id: %u) in table `broadcast_text` has EmoteId2 %u but emote does not exist.", bct.Id, bct.EmoteId2);
                bct.EmoteId2 = 0;
            }
        }

        mBroadcastTextLocaleMap[bct.Id] = bct;
    } while (result->NextRow());

    sLog.outString(">> Loaded %lu broadcast texts.", (unsigned long)mBroadcastTextLocaleMap.size());
    sLog.outString();
    delete result;
}

void ObjectMgr::LoadBroadcastTextLocales()
{
    //                                                 0        1              2              3              4              5              6              7              8              9                10               11               12               13               14               15               16
    QueryResult *result = WorldDatabase.Query("SELECT Id, MaleText_loc1, MaleText_loc2, MaleText_loc3, MaleText_loc4, MaleText_loc5, MaleText_loc6, MaleText_loc7, MaleText_loc8, FemaleText_loc1, FemaleText_loc2, FemaleText_loc3, FemaleText_loc4, FemaleText_loc5, FemaleText_loc6, FemaleText_loc7, FemaleText_loc8 FROM locales_broadcast_text");

    if (!result)
    {
        sLog.outString(">> Loaded 0 broadcast text locales. DB table `locales_broadcast_text` is empty.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field* fields = result->Fetch();

        uint32 id = fields[0].GetUInt32();
        BroadcastTextLocaleMap::iterator bct = mBroadcastTextLocaleMap.find(id);

        if (bct == mBroadcastTextLocaleMap.end())
        {
            sLog.outErrorDb("BroadcastText (Id: %u) in table `locales_broadcast_text` does not exist. Skipped!", id);
            continue;
        }

        BroadcastText& data = mBroadcastTextLocaleMap[id];

        // Load MaleText
        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[i].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    // 0 -> default, idx in to idx+1
                    if ((int32)data.MaleText.size() <= idx + 1)
                        data.MaleText.resize(idx + 2);

                    data.MaleText[idx + 1] = str;
                }
            }
        }

        // Load FemaleText
        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[8 + i].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    // 0 -> default, idx in to idx+1
                    if ((int32)data.FemaleText.size() <= idx + 1)
                        data.FemaleText.resize(idx + 2);

                    data.FemaleText[idx + 1] = str;
                }
            }
        }

        ++count;
    } while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u broadcast text locales.", count);
    delete result;
}

const char *ObjectMgr::GetBroadcastText(uint32 id, int locale_index, uint8 gender, bool forceGender) const
{
    if (BroadcastText const* bct = GetBroadcastTextLocale(id))
    {
        if ((gender == GENDER_FEMALE || gender == GENDER_NONE) && (forceGender || !bct->FemaleText[LOCALE_enUS].empty()))
        {
            if ((int32)bct->FemaleText.size() > locale_index + 1 && !bct->FemaleText[locale_index + 1].empty())
                return bct->FemaleText[locale_index + 1].c_str();
            else
                return bct->FemaleText[0].c_str();
        }
        // else if (gender == GENDER_MALE)
        {
            if ((int32)bct->MaleText.size() > locale_index + 1 && !bct->MaleText[locale_index + 1].empty())
                return bct->MaleText[locale_index + 1].c_str();
            else
                return bct->MaleText[0].c_str();
        }
    }

    sLog.outErrorDb("Broadcast text id %i not found in DB.", id);
    return "<error>";
}

bool ObjectMgr::LoadMangosStrings(DatabaseType& db, char const* table, int32 min_value, int32 max_value, bool extra_content)
{
    int32 start_value = min_value;
    int32 end_value   = max_value;
    // some string can have negative indexes range
    if (start_value < 0)
    {
        if (end_value >= start_value)
        {
            sLog.outErrorDb("Table '%s' attempt loaded with invalid range (%d - %d), strings not loaded.", table, min_value, max_value);
            return false;
        }

        // real range (max+1,min+1) exaple: (-10,-1000) -> -999...-10+1
        std::swap(start_value, end_value);
        ++start_value;
        ++end_value;
    }
    else
    {
        if (start_value >= end_value)
        {
            sLog.outErrorDb("Table '%s' attempt loaded with invalid range (%d - %d), strings not loaded.", table, min_value, max_value);
            return false;
        }
    }

    // cleanup affected map part for reloading case
    for (MangosStringLocaleMap::iterator itr = mMangosStringLocaleMap.begin(); itr != mMangosStringLocaleMap.end();)
    {
        if (itr->first >= start_value && itr->first < end_value)
            mMangosStringLocaleMap.erase(itr++);
        else
            ++itr;
    }

    QueryResult *result = db.PQuery("SELECT entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8 %s FROM %s", extra_content ? ",sound,type,language,emote" : "", table);

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        if (min_value == MIN_MANGOS_STRING_ID)              // error only in case internal strings
            sLog.outErrorDb(">> Loaded 0 mangos strings. DB table `%s` is empty. Cannot continue.", table);
        else
            sLog.outString(">> Loaded 0 string templates. DB table `%s` is empty.", table);
        return false;
    }

    uint32 count = 0;

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        int32 entry = fields[0].GetInt32();

        if (entry == 0)
        {
            sLog.outErrorDb("Table `%s` contain reserved entry 0, ignored.", table);
            continue;
        }
        else if (entry < start_value || entry >= end_value)
        {
            sLog.outErrorDb("Table `%s` contain entry %i out of allowed range (%d - %d), ignored.", table, entry, min_value, max_value);
            continue;
        }

        MangosStringLocale& data = mMangosStringLocaleMap[entry];

        if (data.Content.size() > 0)
        {
            sLog.outErrorDb("Table `%s` contain data for already loaded entry  %i (from another table?), ignored.", table, entry);
            continue;
        }

        data.Content.resize(1);
        ++count;

        // 0 -> default, idx in to idx+1
        data.Content[0] = fields[1].GetCppString();

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[i + 1].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    // 0 -> default, idx in to idx+1
                    if ((int32)data.Content.size() <= idx + 1)
                        data.Content.resize(idx + 2);

                    data.Content[idx + 1] = str;
                }
            }
        }


        // Load additional string content if necessary
        if (extra_content)
        {
            data.SoundId     = fields[10].GetUInt32();
            data.Type        = fields[11].GetUInt32();
            data.LanguageId  = Language(fields[12].GetUInt32());
            data.Emote       = fields[13].GetUInt32();

            if (data.SoundId && !GetSoundEntry(data.SoundId))
            {
                sLog.outErrorDb("Entry %i in table `%s` has soundId %u but sound does not exist.", entry, table, data.SoundId);
                data.SoundId = 0;
            }

            if (!GetLanguageDescByID(data.LanguageId))
            {
                sLog.outErrorDb("Entry %i in table `%s` using Language %u but Language does not exist.", entry, table, uint32(data.LanguageId));
                data.LanguageId = LANG_UNIVERSAL;
            }

            if (data.Type > CHAT_TYPE_ZONE_YELL)
            {
                sLog.outErrorDb("Entry %i in table `%s` has Type %u but this Chat Type does not exist.", entry, table, data.Type);
                data.Type = CHAT_TYPE_SAY;
            }

            if (data.Emote && !sEmotesStore.LookupEntry(data.Emote))
            {
                sLog.outErrorDb("Entry %i in table `%s` has Emote %u but emote does not exist.", entry, table, data.Emote);
                data.Emote = EMOTE_ONESHOT_NONE;
            }
        }
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    if (min_value == MIN_MANGOS_STRING_ID)
        sLog.outString(">> Loaded %u MaNGOS strings from table %s", count, table);
    else
        sLog.outString(">> Loaded %u string templates from %s", count, table);

    return true;
}

const char *ObjectMgr::GetMangosString(int32 entry, int locale_idx) const
{
    // locale_idx==-1 -> default, locale_idx >= 0 in to idx+1
    // Content[0] always exist if exist MangosStringLocale
    if (MangosStringLocale const *msl = GetMangosStringLocale(entry))
    {
        if ((int32)msl->Content.size() > locale_idx + 1 && !msl->Content[locale_idx + 1].empty())
            return msl->Content[locale_idx + 1].c_str();
        else
            return msl->Content[0].c_str();
    }

    if (entry > 0)
        sLog.outErrorDb("Entry %i not found in `mangos_string` table.", entry);
    else
        sLog.outErrorDb("Mangos string entry %i not found in DB.", entry);
    return "<error>";
}

bool ObjectMgr::LoadQuestGreetings()
{
    for (uint32 i = 0; i < QUESTGIVER_TYPE_MAX; i++)
        mQuestGreetingLocaleMap[i].clear(); // need for reload case

    QueryResult *result = WorldDatabase.Query("SELECT entry,type,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,Emote,EmoteDelay FROM quest_greeting");

    if (!result)
    {
        sLog.outString(">> Loaded 0 quest greetings. DB table `quest_greeting` is empty.");
        return false;
    }

    uint32 count = 0;

    do
    {
        Field *fields = result->Fetch();
        uint32 entry = fields[0].GetUInt32();
        uint8 type = fields[1].GetUInt8();

        switch (type)
        {
            case QUESTGIVER_CREATURE:
            {
                if (!ObjectMgr::GetCreatureTemplate(entry))
                {
                    sLog.outErrorDb("Table `quest_greeting` have entry for nonexistent creature template (Entry: %u), ignore", entry);
                    continue;
                }
                break;
            }
            case QUESTGIVER_GAMEOBJECT:
            {
                if (!ObjectMgr::GetGameObjectInfo(entry))
                {
                    sLog.outErrorDb("Table `quest_greeting` have entry for nonexistent gameobject template (Entry: %u), ignore", entry);
                    continue;
                }
                break;
            }
            default:
            {
                sLog.outErrorDb("Table `quest_greeting` have entry with invalid type (Type: %u), ignore", type);
                continue;
            }
        }

        QuestGreetingLocale& data = mQuestGreetingLocaleMap[type][entry];

        data.Content.resize(1);
        ++count;

        // 0 -> default, idx in to idx+1
        data.Content[0] = fields[2].GetCppString();

        for (int i = 1; i < MAX_LOCALE; ++i)
        {
            std::string str = fields[i + 2].GetCppString();
            if (!str.empty())
            {
                int idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    // 0 -> default, idx in to idx+1
                    if ((int32)data.Content.size() <= idx + 1)
                        data.Content.resize(idx + 2);

                    data.Content[idx + 1] = str;
                }
            }
        }

        data.Emote = fields[11].GetUInt16();
        data.EmoteDelay = fields[12].GetUInt32();

        if (data.Emote && !sEmotesStore.LookupEntry(data.Emote))
        {
            sLog.outErrorDb("Entry %i in table `quest_greeting` has Emote %u but emote does not exist.", entry, data.Emote);
            data.Emote = EMOTE_ONESHOT_NONE;
        }
    } while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u quest greetings.", count);

    return true;
}

void ObjectMgr::LoadFishingBaseSkillLevel()
{
    mFishingBaseForArea.clear();                            // for reload case

    uint32 count = 0;
    QueryResult *result = WorldDatabase.Query("SELECT entry,skill FROM skill_fishing_base_level");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded `skill_fishing_base_level`, table is empty!");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();
        uint32 entry  = fields[0].GetUInt32();
        int32 skill   = fields[1].GetInt32();

        const auto *fArea = AreaEntry::GetById(entry);
        if (!fArea)
        {
            sLog.outErrorDb("AreaId %u defined in `skill_fishing_base_level` does not exist", entry);
            continue;
        }

        mFishingBaseForArea[entry] = skill;
        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u areas for fishing base skill level", count);
}

SkillRangeType GetSkillRangeType(SkillLineEntry const *pSkill, bool racial)
{
    switch (pSkill->categoryId)
    {
        case SKILL_CATEGORY_LANGUAGES:
            return SKILL_RANGE_LANGUAGE;
        case SKILL_CATEGORY_WEAPON:
            if (pSkill->id != SKILL_FIST_WEAPONS)
                return SKILL_RANGE_LEVEL;
            else
                return SKILL_RANGE_MONO;
        case SKILL_CATEGORY_ARMOR:
        case SKILL_CATEGORY_CLASS:
            if (pSkill->id != SKILL_POISONS && pSkill->id != SKILL_LOCKPICKING)
                return SKILL_RANGE_MONO;
            else
                return SKILL_RANGE_LEVEL;
        case SKILL_CATEGORY_SECONDARY:
        case SKILL_CATEGORY_PROFESSION:
            // not set skills for professions and racial abilities
            if (IsProfessionSkill(pSkill->id))
                return SKILL_RANGE_RANK;
            else if (racial)
                return SKILL_RANGE_NONE;
            else
                return SKILL_RANGE_MONO;
        default:
        case SKILL_CATEGORY_ATTRIBUTES:                     //not found in dbc
        case SKILL_CATEGORY_GENERIC:                        //only GENERIC(DND)
            return SKILL_RANGE_NONE;
    }
}

void ObjectMgr::LoadGameTele()
{
    m_GameTeleMap.clear();                                  // for reload case

    uint32 count = 0;
    QueryResult *result = WorldDatabase.Query("SELECT id, position_x, position_y, position_z, orientation, map, name FROM game_tele");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded `game_tele`, table is empty!");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        bar.step();

        Field *fields = result->Fetch();

        uint32 id         = fields[0].GetUInt32();

        GameTele gt;

        gt.position_x     = fields[1].GetFloat();
        gt.position_y     = fields[2].GetFloat();
        gt.position_z     = fields[3].GetFloat();
        gt.orientation    = fields[4].GetFloat();
        gt.mapId          = fields[5].GetUInt32();
        gt.name           = fields[6].GetCppString();

        if (!MapManager::IsValidMapCoord(gt.mapId, gt.position_x, gt.position_y, gt.position_z, gt.orientation))
        {
            sLog.outErrorDb("Wrong position for id %u (name: %s) in `game_tele` table, ignoring.", id, gt.name.c_str());
            continue;
        }

        if (!Utf8toWStr(gt.name, gt.wnameLow))
        {
            sLog.outErrorDb("Wrong UTF8 name for id %u in `game_tele` table, ignoring.", id);
            continue;
        }

        wstrToLower(gt.wnameLow);

        m_GameTeleMap[id] = gt;

        ++count;
    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u GameTeleports", count);
}

GameTele const* ObjectMgr::GetGameTele(const std::string& name) const
{
    // explicit name case
    std::wstring wname;
    if (!Utf8toWStr(name, wname))
        return NULL;

    // converting string that we try to find to lower case
    wstrToLower(wname);

    // Alternative first GameTele what contains wnameLow as substring in case no GameTele location found
    const GameTele* alt = NULL;
    for (GameTeleMap::const_iterator itr = m_GameTeleMap.begin(); itr != m_GameTeleMap.end(); ++itr)
        if (itr->second.wnameLow == wname)
            return &itr->second;
        else if (alt == NULL && itr->second.wnameLow.find(wname) != std::wstring::npos)
            alt = &itr->second;

    return alt;
}

bool ObjectMgr::AddGameTele(GameTele& tele)
{
    // find max id
    uint32 new_id = 0;
    for (GameTeleMap::const_iterator itr = m_GameTeleMap.begin(); itr != m_GameTeleMap.end(); ++itr)
        if (itr->first > new_id)
            new_id = itr->first;

    // use next
    ++new_id;

    if (!Utf8toWStr(tele.name, tele.wnameLow))
        return false;

    wstrToLower(tele.wnameLow);

    m_GameTeleMap[new_id] = tele;

    return WorldDatabase.PExecuteLog("INSERT INTO game_tele (id,position_x,position_y,position_z,orientation,map,name) VALUES (%u,%f,%f,%f,%f,%u,'%s')",
                                     new_id, tele.position_x, tele.position_y, tele.position_z, tele.orientation, tele.mapId, tele.name.c_str());
}

bool ObjectMgr::DeleteGameTele(const std::string& name)
{
    // explicit name case
    std::wstring wname;
    if (!Utf8toWStr(name, wname))
        return false;

    // converting string that we try to find to lower case
    wstrToLower(wname);

    for (GameTeleMap::iterator itr = m_GameTeleMap.begin(); itr != m_GameTeleMap.end(); ++itr)
    {
        if (itr->second.wnameLow == wname)
        {
            WorldDatabase.PExecuteLog("DELETE FROM game_tele WHERE name = '%s'", itr->second.name.c_str());
            m_GameTeleMap.erase(itr);
            return true;
        }
    }

    return false;
}

void ObjectMgr::LoadTrainers(char const* tableName, bool isTemplates)
{
    CacheTrainerSpellMap& trainerList = isTemplates ? m_mCacheTrainerTemplateSpellMap : m_mCacheTrainerSpellMap;

    // For reload case
    for (CacheTrainerSpellMap::iterator itr = trainerList.begin(); itr != trainerList.end(); ++itr)
        itr->second.Clear();
    trainerList.clear();

    std::set<uint32> skip_trainers;

    QueryResult *result = WorldDatabase.PQuery("SELECT entry, spell,spellcost,reqskill,reqskillvalue,reqlevel FROM %s", tableName);

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded `%s`, table is empty!", tableName);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    std::set<uint32> talentIds;

    uint32 count = 0;
    do
    {
        bar.step();

        Field* fields = result->Fetch();

        uint32 entry  = fields[0].GetUInt32();
        uint32 spell  = fields[1].GetUInt32();

        SpellEntry const *spellinfo = sSpellMgr.GetSpellEntry(spell);
        if (!spellinfo)
        {
            sLog.outErrorDb("Table `%s` (Entry: %u ) has non existing spell %u, ignore", tableName, entry, spell);
            continue;
        }

        if (spellinfo->Effect[0] != SPELL_EFFECT_LEARN_SPELL)
        {
            sLog.outErrorDb("Table `%s` for trainer (Entry: %u) has non-learning spell %u, ignore", tableName, entry, spell);
            for (uint32 spell2 = 1; spell2 < sSpellMgr.GetMaxSpellId(); ++spell2)
            {
                if (SpellEntry const* spellEntry2 = sSpellMgr.GetSpellEntry(spell2))
                {
                    if (spellEntry2->Effect[0] == SPELL_EFFECT_LEARN_SPELL && spellEntry2->EffectTriggerSpell[0] == spell)
                    {
                        sLog.outErrorDb("  ... possible must be used spell %u instead", spell2);
                        break;
                    }
                }
            }
            continue;
        }

        if (!SpellMgr::IsSpellValid(spellinfo))
        {
            sLog.outErrorDb("Table `%s` (Entry: %u) has broken learning spell %u, ignore", tableName, entry, spell);
            continue;
        }

        if (GetTalentSpellCost(spell))
        {
            if (talentIds.find(spell) == talentIds.end())
            {
                sLog.outErrorDb("Table `%s` has talent as learning spell %u, ignore", tableName, spell);
                talentIds.insert(spell);
            }
            continue;
        }

        if (!isTemplates)
        {
            CreatureInfo const* cInfo = GetCreatureTemplate(entry);

            if (!cInfo)
            {
                sLog.outErrorDb("Table `%s` have entry for nonexistent creature template (Entry: %u), ignore", tableName, entry);
                continue;
            }

            if (!(cInfo->npcflag & UNIT_NPC_FLAG_TRAINER))
            {
                if (skip_trainers.find(entry) == skip_trainers.end())
                {
                    sLog.outErrorDb("Table `%s` have data for creature (Entry: %u) without trainer flag, ignore", tableName, entry);
                    skip_trainers.insert(entry);
                }
                continue;
            }

            if (TrainerSpellData const* tSpells = cInfo->trainerId ? GetNpcTrainerTemplateSpells(cInfo->trainerId) : NULL)
            {
                if (tSpells->spellList.find(spell) != tSpells->spellList.end())
                {
                    sLog.outErrorDb("Table `%s` (Entry: %u) has spell %u listed in trainer template %u, ignore", tableName, entry, spell, cInfo->trainerId);
                    continue;
                }
            }
        }

        TrainerSpellData& data = trainerList[entry];

        TrainerSpell& trainerSpell = data.spellList[spell];
        trainerSpell.spell         = spell;
        trainerSpell.spellCost     = fields[2].GetUInt32();
        trainerSpell.reqSkill      = fields[3].GetUInt32();
        trainerSpell.reqSkillValue = fields[4].GetUInt32();
        trainerSpell.reqLevel      = fields[5].GetUInt32();

        if (trainerSpell.reqLevel)
        {
            if (trainerSpell.reqLevel == spellinfo->spellLevel)
                ERROR_DB_STRICT_LOG("Table `%s` (Entry: %u) has redundant reqlevel %u (=spell level) for spell %u", tableName, entry, trainerSpell.reqLevel, spell);
        }
        else
            trainerSpell.reqLevel = spellinfo->spellLevel;

        if (SpellMgr::IsProfessionSpell(spellinfo->EffectTriggerSpell[0]))
            data.trainerType = 2;

        ++count;

    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %d trainer %sspells", count, isTemplates ? "template " : "");
}

void ObjectMgr::LoadTrainerTemplates()
{
    LoadTrainers("npc_trainer_template", true);

    // post loading check
    std::set<uint32> trainer_ids;

    for (CacheTrainerSpellMap::const_iterator tItr = m_mCacheTrainerTemplateSpellMap.begin(); tItr != m_mCacheTrainerTemplateSpellMap.end(); ++tItr)
        trainer_ids.insert(tItr->first);

    for (uint32 i = 1; i < sCreatureStorage.GetMaxEntry(); ++i)
    {
        if (CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i))
        {
            if (cInfo->trainerId)
            {
                if (m_mCacheTrainerTemplateSpellMap.find(cInfo->trainerId) != m_mCacheTrainerTemplateSpellMap.end())
                    trainer_ids.erase(cInfo->trainerId);
                else
                    sLog.outErrorDb("Creature (Entry: %u) has trainer_id = %u for nonexistent trainer template", cInfo->Entry, cInfo->trainerId);
            }
        }
    }

    for (std::set<uint32>::const_iterator tItr = trainer_ids.begin(); tItr != trainer_ids.end(); ++tItr)
        sLog.outErrorDb("Table `npc_trainer_template` has trainer template %u not used by any trainers ", *tItr);
}

void ObjectMgr::LoadVendors(char const* tableName, bool isTemplates)
{
    CacheVendorItemMap& vendorList = isTemplates ? m_mCacheVendorTemplateItemMap : m_mCacheVendorItemMap;

    // For reload case
    for (CacheVendorItemMap::iterator itr = vendorList.begin(); itr != vendorList.end(); ++itr)
        itr->second.Clear();
    vendorList.clear();

    std::set<uint32> skip_vendors;

    QueryResult *result = WorldDatabase.PQuery("SELECT entry, item, maxcount, incrtime FROM %s WHERE (item NOT IN (SELECT entry FROM forbidden_items WHERE (AfterOrBefore = 0 && patch <= %u) || (AfterOrBefore = 1 && patch >= %u)))", tableName, sWorld.GetWowPatch(), sWorld.GetWowPatch());
    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded `%s`, table is empty!", tableName);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    uint32 count = 0;
    do
    {
        bar.step();
        Field* fields = result->Fetch();

        uint32 entry        = fields[0].GetUInt32();
        uint32 item_id      = fields[1].GetUInt32();
        uint32 maxcount     = fields[2].GetUInt32();
        uint32 incrtime     = fields[3].GetUInt32();

        if (!IsVendorItemValid(isTemplates, tableName, entry, item_id, maxcount, incrtime, NULL, &skip_vendors))
            continue;

        VendorItemData& vList = vendorList[entry];

        vList.AddItem(item_id, maxcount, incrtime);
        ++count;

    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u vendor %sitems", count, isTemplates ? "template " : "");
}


void ObjectMgr::LoadVendorTemplates()
{
    LoadVendors("npc_vendor_template", true);

    // post loading check
    std::set<uint32> vendor_ids;

    for (CacheVendorItemMap::const_iterator vItr = m_mCacheVendorTemplateItemMap.begin(); vItr != m_mCacheVendorTemplateItemMap.end(); ++vItr)
        vendor_ids.insert(vItr->first);

    for (uint32 i = 1; i < sCreatureStorage.GetMaxEntry(); ++i)
    {
        if (CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i))
        {
            if (cInfo->vendorId)
            {
                if (m_mCacheVendorTemplateItemMap.find(cInfo->vendorId) !=  m_mCacheVendorTemplateItemMap.end())
                    vendor_ids.erase(cInfo->vendorId);
                else
                    sLog.outErrorDb("Creature (Entry: %u) has vendor_id = %u for nonexistent vendor template", cInfo->Entry, cInfo->vendorId);
            }
        }
    }

    // We need to use a query to get all used vendor ids because of progression.
    // It might be used by a creature that is not loaded in this patch.
    QueryResult* result = WorldDatabase.Query("SELECT vendor_id FROM creature_template WHERE vendor_id > 0");

    Field* fields;

    if (result)
    {
        do
        {
            fields = result->Fetch();
            uint32 vendorId = fields[0].GetUInt32();
            if (vendor_ids.find(vendorId) != vendor_ids.end())
                vendor_ids.erase(vendorId);
        } while (result->NextRow());
        delete result;
    }

    for (std::set<uint32>::const_iterator vItr = vendor_ids.begin(); vItr != vendor_ids.end(); ++vItr)
        sLog.outErrorDb("Table `npc_vendor_template` has vendor template %u not used by any vendors ", *vItr);
}

void ObjectMgr::LoadNpcGossips()
{

    m_mCacheNpcTextIdMap.clear();

    QueryResult* result = WorldDatabase.Query("SELECT npc_guid, textid FROM npc_gossip");
    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded `npc_gossip`, table is empty!");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    uint32 count = 0;
    uint32 guid, textid;
    do
    {
        bar.step();

        Field* fields = result->Fetch();

        guid   = fields[0].GetUInt32();
        textid = fields[1].GetUInt32();

        if (!GetCreatureData(guid))
        {
            if (!sObjectMgr.IsExistingCreatureGuid(guid))
                sLog.outErrorDb("Table `npc_gossip` have nonexistent creature (GUID: %u) entry, ignore. ", guid);
            continue;
        }
        if (!GetNpcText(textid))
        {
            sLog.outErrorDb("Table `npc_gossip` for creature (GUID: %u) have wrong Textid (%u), ignore. ", guid, textid);
            continue;
        }

        m_mCacheNpcTextIdMap[guid] = textid ;
        ++count;

    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %d NpcTextId ", count);
}

void ObjectMgr::LoadGossipMenu()
{
    m_mGossipMenusMap.clear();

    //                                                0      1        2
    QueryResult* result = WorldDatabase.Query("SELECT entry, text_id, condition_id FROM gossip_menu");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded gossip_menu, table is empty!");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    uint32 count = 0;

    do
    {
        bar.step();

        Field* fields = result->Fetch();

        GossipMenus gMenu;

        gMenu.entry             = fields[0].GetUInt32();
        gMenu.text_id           = fields[1].GetUInt32();
        gMenu.conditionId       = fields[2].GetUInt16();

        if (!GetNpcText(gMenu.text_id))
        {
            sLog.outErrorDb("Table gossip_menu entry %u are using non-existing text_id %u", gMenu.entry, gMenu.text_id);
            continue;
        }

        if (gMenu.conditionId)
        {
            const ConditionEntry* condition = sConditionStorage.LookupEntry<ConditionEntry>(gMenu.conditionId);
            if (!condition)
            {
                sLog.outErrorDb("Table gossip_menu for menu %u, text-id %u has condition_id %u that does not exist in `conditions`, ignoring", gMenu.entry, gMenu.text_id, gMenu.conditionId);
                gMenu.conditionId = 0;
            }
        }

        m_mGossipMenusMap.insert(GossipMenusMap::value_type(gMenu.entry, gMenu));

        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u gossip_menu entries", count);

    // post loading tests
    for (uint32 i = 1; i < sCreatureStorage.GetMaxEntry(); ++i)
        if (CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i))
            if (cInfo->GossipMenuId)
                if (m_mGossipMenusMap.find(cInfo->GossipMenuId) == m_mGossipMenusMap.end())
                    sLog.outErrorDb("Creature (Entry: %u) has gossip_menu_id = %u for nonexistent menu", cInfo->Entry, cInfo->GossipMenuId);

    for (auto itr = sGOStorage.begin<GameObjectInfo>(); itr < sGOStorage.end<GameObjectInfo>(); ++itr)
        if (uint32 menuid = itr->GetGossipMenuId())
            if (m_mGossipMenusMap.find(menuid) == m_mGossipMenusMap.end())
                ERROR_DB_STRICT_LOG("Gameobject (Entry: %u) has gossip_menu_id = %u for nonexistent menu", itr->id, menuid);
}

void ObjectMgr::LoadGossipMenuItems()
{
    m_mGossipMenuItemsMap.clear();

    QueryResult* result = WorldDatabase.Query(
                              "SELECT menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, "
                              "action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, BoxBroadcastTextID, "
                              "condition_id "
                              "FROM gossip_menu_option ORDER BY menu_id, id");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded gossip_menu_option, table is empty!");
        return;
    }

    // prepare data for unused menu ids
    std::set<uint32> menu_ids;                              // for later integrity check
    if (!sLog.HasLogFilter(LOG_FILTER_DB_STRICTED_CHECK))   // check unused menu ids only in strict mode
    {
        for (GossipMenusMap::const_iterator itr = m_mGossipMenusMap.begin(); itr != m_mGossipMenusMap.end(); ++itr)
            if (itr->first)
                menu_ids.insert(itr->first);

        for (auto itr = sGOStorage.begin<GameObjectInfo>(); itr < sGOStorage.end<GameObjectInfo>(); ++itr)
            if (uint32 menuid = itr->GetGossipMenuId())
                menu_ids.erase(menuid);
    }

    // loading
    BarGoLink bar(result->GetRowCount());

    uint32 count = 0;

    std::set<uint32> gossipScriptSet;

    for (ScriptMapMap::const_iterator itr = sGossipScripts.begin(); itr != sGossipScripts.end(); ++itr)
        gossipScriptSet.insert(itr->first);

    // prepare menuid -> CreatureInfo map for fast access
    typedef  std::multimap<uint32, const CreatureInfo*> Menu2CInfoMap;
    Menu2CInfoMap menu2CInfoMap;
    for (uint32 i = 1;  i < sCreatureStorage.GetMaxEntry(); ++i)
        if (CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i))
            if (cInfo->GossipMenuId)
                menu2CInfoMap.insert(Menu2CInfoMap::value_type(cInfo->GossipMenuId, cInfo));

    do
    {
        bar.step();

        Field* fields = result->Fetch();

        GossipMenuItems gMenuItem;

        gMenuItem.menu_id               = fields[0].GetUInt32();
        gMenuItem.id                    = fields[1].GetUInt32();
        gMenuItem.option_icon           = fields[2].GetUInt8();
        gMenuItem.option_text           = fields[3].GetCppString();
        gMenuItem.OptionBroadcastTextID = fields[4].GetUInt32();

        gMenuItem.option_id             = fields[5].GetUInt32();
        gMenuItem.npc_option_npcflag    = fields[6].GetUInt32();
        gMenuItem.action_menu_id        = fields[7].GetInt32();
        gMenuItem.action_poi_id         = fields[8].GetUInt32();
        gMenuItem.action_script_id      = fields[9].GetUInt32();
        gMenuItem.box_coded             = fields[10].GetUInt8() != 0;
        //gMenuItem.box_money             = fields[11].GetUInt32();
        gMenuItem.box_text              = fields[12].GetCppString();
        gMenuItem.BoxBroadcastTextID    = fields[13].GetUInt32();

        gMenuItem.conditionId           = fields[14].GetUInt16();

        if (gMenuItem.menu_id)                              // == 0 id is special and not have menu_id data
        {
            if (m_mGossipMenusMap.find(gMenuItem.menu_id) == m_mGossipMenusMap.end())
            {
                sLog.outErrorDb("Gossip menu option (MenuId: %u) for nonexistent menu", gMenuItem.menu_id);
                continue;
            }
        }

        if ((gMenuItem.option_id == GOSSIP_OPTION_GOSSIP) && (gMenuItem.action_menu_id > 0))
        {
            if (m_mGossipMenusMap.find(gMenuItem.action_menu_id) == m_mGossipMenusMap.end())
                sLog.outErrorDb("Gossip menu option (MenuId: %u Id: %u) have action_menu_id = %u for nonexistent menu", gMenuItem.menu_id, gMenuItem.id, gMenuItem.action_menu_id);
            else if (!sLog.HasLogFilter(LOG_FILTER_DB_STRICTED_CHECK))
                menu_ids.erase(gMenuItem.action_menu_id);
        }

        if (gMenuItem.option_icon >= GOSSIP_ICON_MAX)
        {
            sLog.outErrorDb("Table gossip_menu_option for menu %u, id %u has unknown icon id %u. Replacing with GOSSIP_ICON_CHAT", gMenuItem.menu_id, gMenuItem.id, gMenuItem.option_icon);
            gMenuItem.option_icon = GOSSIP_ICON_CHAT;
        }

        if (gMenuItem.OptionBroadcastTextID)
        {
            if (!GetBroadcastTextLocale(gMenuItem.OptionBroadcastTextID))
            {
                sLog.outErrorDb("Table `gossip_menu_option` for MenuId %u, OptionID %u has non-existing or incompatible OptionBroadcastTextID %u, ignoring.", gMenuItem.menu_id, gMenuItem.id, gMenuItem.OptionBroadcastTextID);
                gMenuItem.OptionBroadcastTextID = 0;
            }
        }

        if (gMenuItem.BoxBroadcastTextID)
        {
            if (!GetBroadcastTextLocale(gMenuItem.BoxBroadcastTextID))
            {
                sLog.outErrorDb("Table `gossip_menu_option` for MenuId %u, OptionID %u has non-existing or incompatible BoxBroadcastTextId %u, ignoring.", gMenuItem.menu_id, gMenuItem.id, gMenuItem.BoxBroadcastTextID);
                gMenuItem.BoxBroadcastTextID = 0;
            }
        }

        if (gMenuItem.option_id == GOSSIP_OPTION_NONE)
            sLog.outErrorDb("Table gossip_menu_option for menu %u, id %u use option id GOSSIP_OPTION_NONE. Option will never be used", gMenuItem.menu_id, gMenuItem.id);

        if (gMenuItem.option_id >= GOSSIP_OPTION_MAX)
            sLog.outErrorDb("Table gossip_menu_option for menu %u, id %u has unknown option id %u. Option will not be used", gMenuItem.menu_id, gMenuItem.id, gMenuItem.option_id);

        if (gMenuItem.menu_id && (gMenuItem.npc_option_npcflag || !sLog.HasLogFilter(LOG_FILTER_DB_STRICTED_CHECK)))
        {
            bool found_menu_uses = false;
            bool found_flags_uses = false;

            std::pair<Menu2CInfoMap::const_iterator, Menu2CInfoMap::const_iterator> tm_bounds = menu2CInfoMap.equal_range(gMenuItem.menu_id);
            for (Menu2CInfoMap::const_iterator it2 = tm_bounds.first; !found_flags_uses && it2 != tm_bounds.second; ++it2)
            {
                CreatureInfo const* cInfo = it2->second;

                found_menu_uses = true;

                // some from creatures with gossip menu can use gossip option base at npc_flags
                if (gMenuItem.npc_option_npcflag & cInfo->npcflag)
                    found_flags_uses = true;

                // unused check data preparing part
                if (!sLog.HasLogFilter(LOG_FILTER_DB_STRICTED_CHECK))
                    menu_ids.erase(gMenuItem.menu_id);
            }

            if (found_menu_uses && !found_flags_uses)
                sLog.outDetail("Table gossip_menu_option for menu %u, id %u has `npc_option_npcflag` = %u but creatures using this menu does not have corresponding`npcflag`. Option will not accessible in game.", gMenuItem.menu_id, gMenuItem.id, gMenuItem.npc_option_npcflag);
        }

        if (gMenuItem.action_poi_id && !GetPointOfInterest(gMenuItem.action_poi_id))
        {
            sLog.outErrorDb("Table gossip_menu_option for menu %u, id %u use non-existing action_poi_id %u, ignoring", gMenuItem.menu_id, gMenuItem.id, gMenuItem.action_poi_id);
            gMenuItem.action_poi_id = 0;
        }

        if (gMenuItem.action_script_id)
        {
            if (gMenuItem.option_id != GOSSIP_OPTION_GOSSIP)
            {
                sLog.outErrorDb("Table gossip_menu_option for menu %u, id %u have action_script_id %u but option_id is not GOSSIP_OPTION_GOSSIP, ignoring", gMenuItem.menu_id, gMenuItem.id, gMenuItem.action_script_id);
                continue;
            }

            if (sGossipScripts.find(gMenuItem.action_script_id) == sGossipScripts.end())
            {
                sLog.outErrorDb("Table gossip_menu_option for menu %u, id %u have action_script_id %u that does not exist in `gossip_scripts`, ignoring", gMenuItem.menu_id, gMenuItem.id, gMenuItem.action_script_id);
                continue;
            }

            gossipScriptSet.erase(gMenuItem.action_script_id);
        }

        if (gMenuItem.conditionId)
        {
            const ConditionEntry* condition = sConditionStorage.LookupEntry<ConditionEntry>(gMenuItem.conditionId);
            if (!condition)
            {
                sLog.outErrorDb("Table gossip_menu_option for menu %u, id %u has condition_id %u that does not exist in `conditions`, ignoring", gMenuItem.menu_id, gMenuItem.id, gMenuItem.conditionId);
                gMenuItem.conditionId = 0;
            }
        }

        m_mGossipMenuItemsMap.insert(GossipMenuItemsMap::value_type(gMenuItem.menu_id, gMenuItem));

        ++count;

    }
    while (result->NextRow());

    delete result;

    for (std::set<uint32>::const_iterator itr = gossipScriptSet.begin(); itr != gossipScriptSet.end(); ++itr)
        sLog.outErrorDb("Table `gossip_scripts` contain unused script, id %u.", *itr);

    if (!sLog.HasLogFilter(LOG_FILTER_DB_STRICTED_CHECK))
    {
        for (std::set<uint32>::const_iterator itr = menu_ids.begin(); itr != menu_ids.end(); ++itr)
            sLog.outErrorDb("Table `gossip_menu` contain unused (in creature or GO or menu options) menu id %u.", *itr);
    }

    sLog.outString();
    sLog.outString(">> Loaded %u gossip_menu_option entries", count);
}

void ObjectMgr::AddVendorItem(uint32 entry, uint32 item, uint32 maxcount, uint32 incrtime)
{
    VendorItemData& vList = m_mCacheVendorItemMap[entry];
    vList.AddItem(item, maxcount, incrtime);

    WorldDatabase.PExecuteLog("INSERT INTO npc_vendor (entry,item,maxcount,incrtime) VALUES('%u','%u','%u','%u')", entry, item, maxcount, incrtime);
}

bool ObjectMgr::RemoveVendorItem(uint32 entry, uint32 item)
{
    CacheVendorItemMap::iterator  iter = m_mCacheVendorItemMap.find(entry);
    if (iter == m_mCacheVendorItemMap.end())
        return false;

    if (!iter->second.FindItem(item))
        return false;

    iter->second.RemoveItem(item);
    WorldDatabase.PExecuteLog("DELETE FROM npc_vendor WHERE entry='%u' AND item='%u'", entry, item);
    return true;
}

bool ObjectMgr::IsVendorItemValid(bool isTemplate, char const* tableName, uint32 vendor_entry, uint32 item_id, uint32 maxcount, uint32 incrtime, Player* pl, std::set<uint32>* skip_vendors) const
{
    char const* idStr = isTemplate ? "vendor template" : "vendor";
    CreatureInfo const* cInfo = NULL;

    if (!isTemplate)
    {
        cInfo = GetCreatureTemplate(vendor_entry);
        if (!cInfo)
        {
            if (pl)
                ChatHandler(pl).SendSysMessage(LANG_COMMAND_VENDORSELECTION);
            else
                sLog.outErrorDb("Table `%s` has data for nonexistent creature (Entry: %u), ignoring", tableName, vendor_entry);
            return false;
        }

        if (!(cInfo->npcflag & UNIT_NPC_FLAG_VENDOR))
        {
            if (!skip_vendors || skip_vendors->count(vendor_entry) == 0)
            {
                if (pl)
                    ChatHandler(pl).SendSysMessage(LANG_COMMAND_VENDORSELECTION);
                else
                    sLog.outErrorDb("Table `%s` has data for creature (Entry: %u) without vendor flag, ignoring", tableName, vendor_entry);

                if (skip_vendors)
                    skip_vendors->insert(vendor_entry);
            }
            return false;
        }
    }

    if (!GetItemPrototype(item_id))
    {
        if (pl)
            ChatHandler(pl).PSendSysMessage(LANG_ITEM_NOT_FOUND, item_id);
        else
            sLog.outErrorDb("Table `%s` for %s %u contain nonexistent item (%u), ignoring",
                            tableName, idStr, vendor_entry, item_id);
        return false;
    }

    if (maxcount > 0 && incrtime == 0)
    {
        if (pl)
            ChatHandler(pl).PSendSysMessage("MaxCount!=0 (%u) but IncrTime==0", maxcount);
        else
            sLog.outErrorDb("Table `%s` has `maxcount` (%u) for item %u of %s %u but `incrtime`=0, ignoring",
                            tableName, maxcount, item_id, idStr, vendor_entry);
        return false;
    }
    else if (maxcount == 0 && incrtime > 0)
    {
        if (pl)
            ChatHandler(pl).PSendSysMessage("MaxCount==0 but IncrTime<>=0");
        else
            sLog.outErrorDb("Table `%s` has `maxcount`=0 for item %u of %s %u but `incrtime`<>0, ignoring",
                            tableName, item_id, idStr, vendor_entry);
        return false;
    }

    VendorItemData const* vItems = isTemplate ? GetNpcVendorTemplateItemList(vendor_entry) : GetNpcVendorItemList(vendor_entry);
    VendorItemData const* tItems = isTemplate ? NULL : GetNpcVendorTemplateItemList(vendor_entry);

    if (!vItems && !tItems)
        return true;                                        // later checks for non-empty lists

    if (vItems && vItems->FindItem(item_id))
    {
        if (pl)
            ChatHandler(pl).PSendSysMessage(LANG_ITEM_ALREADY_IN_LIST, item_id);
        else
            sLog.outErrorDb("Table `%s` has duplicate items %u for %s %u, ignoring",
                            tableName, item_id, idStr, vendor_entry);
        sLog.outErrorDb("Table `npc_vendor` has duplicate items %u for vendor (Entry: %u), ignoring",
                        item_id, vendor_entry);
        return false;
    }

    if (!isTemplate)
    {
        if (tItems && tItems->GetItem(item_id))
        {
            if (pl)
                ChatHandler(pl).PSendSysMessage(LANG_ITEM_ALREADY_IN_LIST, item_id);
            else
            {
                if (!cInfo->vendorId)
                    sLog.outErrorDb("Table `%s` has duplicate items %u for %s %u, ignoring",
                                    tableName, item_id, idStr, vendor_entry);
                else
                    sLog.outErrorDb("Table `%s` has duplicate items %u for %s %u (or possible in vendor template %u), ignoring",
                                    tableName, item_id, idStr, vendor_entry, cInfo->vendorId);
            }
            return false;
        }
    }

    uint32 countItems = vItems ? vItems->GetItemCount() : 0;
    countItems += tItems ? tItems->GetItemCount() : 0;

    if (countItems >= MAX_VENDOR_ITEMS)
    {
        if (pl)
            ChatHandler(pl).SendSysMessage(LANG_COMMAND_ADDVENDORITEMITEMS);
        else
            sLog.outErrorDb("Table `%s` has too many items (%u >= %i) for %s %u, ignoring",
                            tableName, countItems, MAX_VENDOR_ITEMS, idStr, vendor_entry);
        return false;
    }

    return true;
}

void ObjectMgr::AddGroup(Group* group)
{
    mGroupMap[group->GetId()] = group ;
}

void ObjectMgr::RemoveGroup(Group* group)
{
    mGroupMap.erase(group->GetId());
}

// Functions for scripting access
bool LoadMangosStrings(DatabaseType& db, char const* table, int32 start_value, int32 end_value, bool extra_content)
{
    // MAX_DB_SCRIPT_STRING_ID is max allowed negative value for scripts (scrpts can use only more deep negative values
    // start/end reversed for negative values
    if (end_value >= start_value)
    {
        sLog.outErrorDb("Table '%s' attempt loaded with reserved by mangos range (%d - %d), strings not loaded.", table, start_value, end_value + 1);
        return false;
    }

    return sObjectMgr.LoadMangosStrings(db, table, start_value, end_value, extra_content);
}

CreatureInfo const* GetCreatureTemplateStore(uint32 entry)
{
    return sCreatureStorage.LookupEntry<CreatureInfo>(entry);
}

Quest const* GetQuestTemplateStore(uint32 entry)
{
    return sObjectMgr.GetQuestTemplate(entry);
}

bool FindCreatureData::operator()(CreatureDataPair const& dataPair)
{
    // skip wrong entry ids
    if (i_id && dataPair.second.id != i_id)
        return false;

    if (!i_anyData)
        i_anyData = &dataPair;

    // without player we can't find more stricted cases, so use fouded
    if (!i_player)
        return true;

    // skip diff. map cases
    if (dataPair.second.mapid != i_player->GetMapId())
        return false;

    float new_dist = i_player->GetDistance2d(dataPair.second.posX, dataPair.second.posY);

    if (!i_mapData || new_dist < i_mapDist)
    {
        i_mapData = &dataPair;
        i_mapDist = new_dist;
    }

    // skip not spawned (in any state),
    uint16 pool_id = sPoolMgr.IsPartOfAPool<Creature>(dataPair.first);
    if (pool_id && !i_player->GetMap()->GetPersistentState()->IsSpawnedPoolObject<Creature>(dataPair.first))
        return false;

    if (!i_spawnedData || new_dist < i_spawnedDist)
    {
        i_spawnedData = &dataPair;
        i_spawnedDist = new_dist;
    }

    return false;
}

CreatureDataPair const* FindCreatureData::GetResult() const
{
    if (i_spawnedData)
        return i_spawnedData;

    if (i_mapData)
        return i_mapData;

    return i_anyData;
}

bool FindGOData::operator()(GameObjectDataPair const& dataPair)
{
    // skip wrong entry ids
    if (i_id && dataPair.second.id != i_id)
        return false;

    if (!i_anyData)
        i_anyData = &dataPair;

    // without player we can't find more stricted cases, so use fouded
    if (!i_player)
        return true;

    // skip diff. map cases
    if (dataPair.second.mapid != i_player->GetMapId())
        return false;

    float new_dist = i_player->GetDistance2d(dataPair.second.posX, dataPair.second.posY);

    if (!i_mapData || new_dist < i_mapDist)
    {
        i_mapData = &dataPair;
        i_mapDist = new_dist;
    }

    // skip not spawned (in any state)
    uint16 pool_id = sPoolMgr.IsPartOfAPool<GameObject>(dataPair.first);
    if (pool_id && !i_player->GetMap()->GetPersistentState()->IsSpawnedPoolObject<GameObject>(dataPair.first))
        return false;

    if (!i_spawnedData || new_dist < i_spawnedDist)
    {
        i_spawnedData = &dataPair;
        i_spawnedDist = new_dist;
    }

    return false;
}

GameObjectDataPair const* FindGOData::GetResult() const
{
    if (i_mapData)
        return i_mapData;

    if (i_spawnedData)
        return i_spawnedData;

    return i_anyData;
}

uint32 ObjectMgr::AddGOData(uint32 entry, uint32 mapId, float x, float y, float z, float o, uint32 spawntimedelay, float rotation0, float rotation1, float rotation2, float rotation3)
{
    GameObjectInfo const* goinfo = GetGameObjectInfo(entry);
    if (!goinfo)
        return 0;

    Map* map = const_cast<Map*>(sMapMgr.FindMap(mapId));
    if (!map)
        return 0;

    uint32 guid = map->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT);
    GameObjectData& data = NewGOData(guid);
    data.id             = entry;
    data.mapid          = mapId;
    data.posX           = x;
    data.posY           = y;
    data.posZ           = z;
    data.orientation    = o;
    data.rotation0      = rotation0;
    data.rotation1      = rotation1;
    data.rotation2      = rotation2;
    data.rotation3      = rotation3;
    data.spawntimesecsmin = spawntimedelay;
    data.spawntimesecsmax = spawntimedelay;
    data.animprogress   = 100;
    data.go_state       = GO_STATE_READY;
    data.spawnFlags     = 0;

    AddGameobjectToGrid(guid, &data);

    // Spawn if necessary (loaded grids only)
    // We use spawn coords to spawn
    if (!map->Instanceable() && map->IsLoaded(x, y))
    {
        GameObject *go = new GameObject;
        if (!go->LoadFromDB(guid, map))
        {
            sLog.outError("AddGOData: cannot add gameobject entry %u to map", entry);
            delete go;
            return 0;
        }
        map->Add(go);
    }

    DEBUG_LOG("AddGOData: dbguid %u entry %u map %u x %f y %f z %f o %f", guid, entry, mapId, x, y, z, o);

    return guid;
}

bool ObjectMgr::MoveCreData(uint32 guid, uint32 mapId, const Position& pos)
{
    CreatureData& data = NewOrExistCreatureData(guid);
    if (!data.id)
        return false;

    RemoveCreatureFromGrid(guid, &data);
    if (data.posX == pos.x && data.posY == pos.y && data.posZ == pos.z)
        return true;
    data.posX = pos.x;
    data.posY = pos.y;
    data.posZ = pos.z;
    data.orientation = pos.o;
    AddCreatureToGrid(guid, &data);

    // Spawn if necessary (loaded grids only)
    if (Map* map = const_cast<Map*>(sMapMgr.FindMap(mapId)))
    {
        // We use spawn coords to spawn
        if (!map->Instanceable() && map->IsLoaded(data.posX, data.posY))
        {
            Creature *creature = new Creature;
            if (!creature->LoadFromDB(guid, map))
            {
                sLog.outError("AddCreature: cannot add creature entry %u to map", guid);
                delete creature;
                return false;
            }
            map->Add(creature);
        }
    }
    return true;
}

uint32 ObjectMgr::AddCreData(uint32 entry, uint32 /*team*/, uint32 mapId, float x, float y, float z, float o, uint32 spawntimedelay)
{
    CreatureInfo const *cInfo = GetCreatureTemplate(entry);
    if (!cInfo)
        return 0;
    Map* map = const_cast<Map*>(sMapMgr.FindMap(mapId));
    if (!map)
        return 0;

    uint32 level = cInfo->minlevel == cInfo->maxlevel ? cInfo->minlevel : urand(cInfo->minlevel, cInfo->maxlevel); // Only used for extracting creature base stats

    uint32 guid = map->GenerateLocalLowGuid(HIGHGUID_UNIT);
    CreatureData& data = NewOrExistCreatureData(guid);
    data.id = entry;
    data.mapid = mapId;
    data.equipmentId = cInfo->equipmentId;
    data.posX = x;
    data.posY = y;
    data.posZ = z;
    data.orientation = o;
    data.spawntimesecsmin = spawntimedelay;
    data.spawntimesecsmax = spawntimedelay;
    data.spawndist = 0;
    data.currentwaypoint = 0;
    data.curhealth = cInfo->maxhealth;
    data.curmana = cInfo->maxmana;
    data.is_dead = false;
    data.movementType = cInfo->MovementType;


    AddCreatureToGrid(guid, &data);

    // Spawn if necessary (loaded grids only)
    // We use spawn coords to spawn
    if (!map->Instanceable() && !map->IsRemovalGrid(x, y))
    {
        Creature* creature = new Creature;
        if (!creature->LoadFromDB(guid, map))
        {
            sLog.outError("AddCreature: cannot add creature entry %u to map", entry);
            delete creature;
            return 0;
        }
        map->Add(creature);
    }

    return guid;
}


void ObjectMgr::RemoveGraveYardLink(uint32 id, uint32 zoneId, Team team, bool inDB)
{
    GraveYardMap::iterator graveLow  = mGraveYardMap.lower_bound(zoneId);
    GraveYardMap::iterator graveUp   = mGraveYardMap.upper_bound(zoneId);
    if (graveLow == graveUp)
    {
        //sLog.outErrorDb("Table `game_graveyard_zone` incomplete: Zone %u Team %u does not have a linked graveyard.",zoneId,team);
        return;
    }

    bool found = false;

    GraveYardMap::iterator itr;

    for (itr = graveLow; itr != graveUp; ++itr)
    {
        GraveYardData & data = itr->second;

        // skip not matching safezone id
        if (data.safeLocId != id)
            continue;

        // skip enemy faction graveyard at same map (normal area, city, or battleground)
        // team == 0 case can be at call from .neargrave
        if (data.team != 0 && team != 0 && data.team != team)
            continue;

        found = true;
        break;
    }

    // no match, return
    if (!found)
        return;

    // remove from links
    mGraveYardMap.erase(itr);

    // remove link from DB
    if (inDB)
        WorldDatabase.PExecute("DELETE FROM game_graveyard_zone WHERE id = '%u' AND ghost_zone = '%u' AND faction = '%u'", id, zoneId, team);

    return;
}

void ObjectMgr::LoadFactionChangeReputations()
{
    factionchange_reputations.clear();
    QueryResult* result = WorldDatabase.Query("SELECT alliance_id, horde_id FROM player_factionchange_reputations");

    if (!result)
    {
        sLog.outString(">> Loaded 0 faction change reputation pairs. DB table `player_factionchange_reputations` is empty.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field *fields = result->Fetch();

        uint32 alliance = fields[0].GetUInt32();
        uint32 horde = fields[1].GetUInt32();

        if (!GetFactionEntry(alliance) || !GetFactionEntry(horde))
        {
            sLog.outErrorDb("Couple %u/%u erreur. Sort inexistant. Supprime de la DB", alliance, horde);
        }
        else
            factionchange_reputations[alliance] = horde;

        ++count;
    }
    while (result->NextRow());

    delete result;
    sLog.outString(">> Loaded %u reputations changes.", count);
}


void ObjectMgr::LoadFactionChangeSpells()
{
    factionchange_spells.clear();
    QueryResult* result = WorldDatabase.Query("SELECT alliance_id, horde_id FROM player_factionchange_spells");

    if (!result)
    {
        sLog.outErrorDb(">> Loaded 0 faction change spell pairs. DB table `player_factionchange_spells` is empty.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field *fields = result->Fetch();

        uint32 alliance = fields[0].GetUInt32();
        uint32 horde = fields[1].GetUInt32();

        if (!sSpellMgr.GetSpellEntry(alliance) || !sSpellMgr.GetSpellEntry(horde))
        {
            sLog.outErrorDb("Couple %u/%u erreur. Sort inexistant. Supprime de la DB", alliance, horde);
        }
        else
            factionchange_spells[alliance] = horde;

        ++count;
    }
    while (result->NextRow());

    delete result;
    sLog.outString(">> %u equivalences de sorts Alliance/Horde chargees", count);
}


void ObjectMgr::LoadFactionChangeItems()
{
    factionchange_items.clear();
    QueryResult* result = WorldDatabase.Query("SELECT alliance_id, horde_id FROM player_factionchange_items");

    if (!result)
    {
        sLog.outErrorDb(">> Loaded 0 faction change item pairs. DB table `player_factionchange_spells` is empty.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field *fields = result->Fetch();

        uint32 alliance = fields[0].GetUInt32();
        uint32 horde = fields[1].GetUInt32();

        if (!GetItemPrototype(alliance) || !GetItemPrototype(horde))
        {
            if (!IsExistingItemId(alliance) || !IsExistingItemId(horde))
                sLog.outErrorDb("Couple %u/%u erreur. Item inexistant. Supprime de la DB", alliance, horde);
        }
        else
            factionchange_items[alliance] = horde;

        ++count;
    }
    while (result->NextRow());

    delete result;
    sLog.outString(">> %u equivalences d'items Alliance/Horde chargees", count);
}

void ObjectMgr::LoadFactionChangeQuests()
{
    factionchange_quests.clear();
    QueryResult* result = WorldDatabase.Query("SELECT alliance_id, horde_id FROM player_factionchange_quests");

    if (!result)
    {
        sLog.outErrorDb(">> Loaded 0 change quests pairs. DB table `player_factionchange_quests` is empty.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field *fields = result->Fetch();

        uint32 alliance = fields[0].GetUInt32();
        uint32 horde = fields[1].GetUInt32();

        if (!GetQuestTemplate(alliance) || !GetQuestTemplate(horde))
        {
            if (!IsExistingQuestId(alliance) || !IsExistingQuestId(horde))
                sLog.outErrorDb("Couple %u/%u erreur. Quete inexistante. Supprime de la DB", alliance, horde);
        }
        else
            factionchange_quests[alliance] = horde;

        ++count;
    }
    while (result->NextRow());

    delete result;
    sLog.outString(">> %u equivalences de quetes Alliance/Horde chargees", count);
}

void ObjectMgr::LoadFactionChangeMounts()
{
    factionchange_mounts.clear();
    QueryResult* result = WorldDatabase.Query("SELECT RaceId, MountNum, ItemEntry FROM player_factionchange_mounts");

    if (!result)
    {
        sLog.outErrorDb(">> Loaded 0 entries. The table `player_factionchange_mounts` is empty.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field *fields = result->Fetch();

        uint8 RaceId     = fields[0].GetUInt8();
        uint8 MountNum   = fields[1].GetUInt8();
        uint32 ItemEntry = fields[2].GetUInt32();

        if (!GetItemPrototype(ItemEntry))
        {
            if (!IsExistingItemId(ItemEntry))
                sLog.outErrorDb("Couple %u/%u/%u erreur. Quete inexistante. Supprime de la DB", RaceId, MountNum, ItemEntry);
        }
        else
        {
            FactionChangeMountData data;
            data.RaceId     = Races(RaceId);
            data.MountNum   = MountNum;
            data.ItemEntry  = ItemEntry;
            factionchange_mounts.push_back(data);
            ++count;
        }
    }
    while (result->NextRow());

    delete result;
    sLog.outString(">> %u montures de races chargees", count);
}
void ObjectMgr::RestoreDeletedItems()
{
    QueryResult* result = CharacterDatabase.Query("SELECT id, player_guid, item_entry, stack_count FROM character_deleted_items");

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Restored 0 prevously deleted items.");
        return;
    }

    uint32 count = 0;

    do
    {
        Field *fields = result->Fetch();

        uint32 id = fields[0].GetUInt32();
        uint32 memberGuidlow = fields[1].GetUInt32();
        uint32 itemEntry = fields[2].GetUInt32();
        uint32 stackCount = fields[3].GetUInt32();
        
        if (ItemPrototype const* itemProto = GetItemPrototype(itemEntry))
        {
            ObjectGuid memberGuid = ObjectGuid(HIGHGUID_PLAYER, memberGuidlow);
            Player* pPlayer = ObjectAccessor::FindPlayerNotInWorld(memberGuid);

            if (Item* restoredItem = Item::CreateItem(itemEntry, stackCount ? stackCount : 1, pPlayer ? pPlayer : (const Player *) 0))
            {
                // save new item before send
                restoredItem->SaveToDB();

                // subject
                std::string subject = itemProto->Name1;

                // text
                std::string textFormat = GetMangosString(LANG_RESTORED_ITEM, LOCALE_enUS);
                
                MailDraft(subject, textFormat)
                    .AddItem(restoredItem)
                    .SendMailTo(MailReceiver(memberGuid), MailSender(MAIL_NORMAL, memberGuid.GetCounter(), MAIL_STATIONERY_GM), MAIL_CHECK_MASK_COPIED, 0, 30 * DAY);

                CharacterDatabase.PExecute("DELETE FROM character_deleted_items WHERE id = %u", id);

                count++;
            }
        }
    } while (result->NextRow());

    delete result;
    sLog.outString();
    sLog.outString(">> Restored %u previously deleted items to players.", count);
}
uint32 GetRealMountEntry(uint32 entry)
{
    switch (entry)
    {
        case 50101:
            return 1132;
        case 50102:
            return 8591;
        case 50103:
            return 15277;
        case 50104:
            return 13332;
        case 50105:
            return 5655;
        case 50106:
            return 5873;
        case 50107:
            return 8631;
        case 50108:
            return 8595;
    }
    return entry;
}

bool ObjectMgr::GetMountDataByEntry(uint32 itemEntry, Races& race, uint8& mountNum) const
{
    // Mount custom Nostalrius encore dans la DB.
    itemEntry = GetRealMountEntry(itemEntry);
    for (FactionChangeMountsData::const_iterator it = factionchange_mounts.begin(); it != factionchange_mounts.end(); ++it)
    {
        if (it->ItemEntry == itemEntry)
        {
            race = it->RaceId;
            mountNum = it->MountNum;
            return true;
        }
    }
    return false;
}

uint32 ObjectMgr::GetMountItemEntry(Races race, uint8 num) const
{
    for (FactionChangeMountsData::const_iterator it = factionchange_mounts.begin(); it != factionchange_mounts.end(); ++it)
        if (it->RaceId == race && it->MountNum == num)
            return it->ItemEntry;

    return false;
}

uint32 ObjectMgr::GetRandomMountForRace(Races race) const
{
    // 1- Compter le nombre total de montures de cette race
    uint32 count = 0;
    for (FactionChangeMountsData::const_iterator it = factionchange_mounts.begin(); it != factionchange_mounts.end(); ++it)
        if (it->RaceId == race)
            ++count;
    // 2- Quelques verifs / Generer index aleatoire
    if (!count)
        return 0;
    count -= urand(0, count - 1);
    // 3- Reboucler
    for (FactionChangeMountsData::const_iterator it = factionchange_mounts.begin(); it != factionchange_mounts.end(); ++it)
    {
        if (it->RaceId == race)
        {
            if (count == 0)
                return it->ItemEntry;
            --count;
        }
    }
    // 4- Un soucis ... ?
    return 0;
}

Races ObjectMgr::GetOppositeRace(Races origRace) const
{
    switch (origRace)
    {
        case RACE_HUMAN:
            return RACE_ORC;
        case RACE_ORC:
            return RACE_HUMAN;
        case RACE_DWARF:
            return RACE_TROLL;
        case RACE_NIGHTELF:
            return RACE_UNDEAD;
        case RACE_UNDEAD:
            return RACE_NIGHTELF;
        case RACE_TAUREN:
            return RACE_TAUREN;
        case RACE_GNOME:
            return RACE_TAUREN;
        case RACE_TROLL:
            return RACE_DWARF;
        default:
            return RACE_GOBLIN;
    }
}

void ObjectMgr::LoadConditions()
{
    SQLWorldLoader loader;
    loader.Load(sConditionStorage);

    for (uint32 i = 0; i < sConditionStorage.GetMaxEntry(); ++i)
    {
        ConditionEntry* condition = const_cast<ConditionEntry*>(sConditionStorage.LookupEntry<ConditionEntry>(i));
        if (!condition)
            continue;

        if (!condition->IsValid())
        {
            sLog.outErrorDb("ObjectMgr::LoadConditions: invalid condition_entry %u, skip", i);
            sConditionStorage.EraseEntry(i);
            continue;
        }
    }

    sLog.outString(">> Loaded %u Condition definitions", sConditionStorage.GetRecordCount());
    sLog.outString();
}


// Check if a player meets condition conditionId
bool ObjectMgr::IsConditionSatisfied(uint16 conditionId, WorldObject const* target, Map const* map, WorldObject const* source, ConditionSource conditionSourceType) const
{
    if (const ConditionEntry* condition = sConditionStorage.LookupEntry<ConditionEntry>(conditionId))
        return condition->Meets(target, map, source, conditionSourceType);

    return false;
}

uint32 ObjectMgr::GenerateAuctionID()
{
    std::set<uint32>::const_iterator it = m_AuctionsIds.lower_bound(m_NextAuctionId);
    while (it != m_AuctionsIds.end() && *it == m_NextAuctionId)
    {
        ++m_NextAuctionId;
        ++it;
    }
    m_AuctionsIds.insert(m_NextAuctionId);
    return m_NextAuctionId++;
}

void ObjectMgr::FreeAuctionID(uint32 id)
{
    m_AuctionsIds.erase(id);
}

void ObjectMgr::GeneratePetNumberRange(uint32& first, uint32& last)
{
    first = GeneratePetNumber();
    uint32 prev = first;
    for (int i = 0; i < 1000; ++i)
    {
        uint32 nextGuid = GeneratePetNumber();
        // End of this range
        if (nextGuid != (prev + 1))
        {
            last = prev + 1;
            return;
        }
        prev = nextGuid;
    }
    last = first + 1000;
}

void ObjectMgr::LoadAreaTemplate()
{
    sAreaStorage.Load();

    for (auto itr = sAreaStorage.begin<AreaEntry>(); itr != sAreaStorage.end<AreaEntry>() ; ++itr)
        if (itr->IsZone() && itr->MapId != 0 && itr->MapId != 1)
            sAreaFlagByMapId.insert(AreaFlagByMapId::value_type(itr->MapId, itr->ExploreFlag));
}

void ObjectMgr::LoadAreaLocales()
{
    mAreaLocaleMap.clear();

    QueryResult* result = WorldDatabase.Query("SELECT Entry, NameLoc1, NameLoc2, NameLoc3, NameLoc4, NameLoc5, NameLoc6, NameLoc7, NameLoc8 FROM locales_area");

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString(">> Loaded 0 area locale strings. DB table `locales_area` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        auto fields = result->Fetch();
        bar.step();

        auto entry = fields[0].GetUInt32();

        if (!AreaEntry::GetById(entry))
        {
            ERROR_DB_STRICT_LOG("Table `locales_area` has data for nonexistent area entry %u, skipped.", entry);
            continue;
        }

        AreaLocale& data = mAreaLocaleMap[entry];

        for (uint8 i = 1; i < MAX_LOCALE; ++i)
        {
            auto str = fields[i].GetCppString();
            if (!str.empty())
            {
                int8 idx = GetOrNewIndexForLocale(LocaleConstant(i));
                if (idx >= 0)
                {
                    if ((int32)data.Name.size() <= idx)
                        data.Name.resize(idx + 1);

                    data.Name[idx] = str;
                }
            }
        }
    }
    while (result->NextRow());

    delete result;

    sLog.outString(">> Loaded " SIZEFMTD " area locale strings", mAreaLocaleMap.size());
    sLog.outString();
}

void ObjectMgr::GetAreaLocaleString(uint32 entry, int32 loc_idx, std::string* namePtr) const
{
    if (loc_idx >= 0)
    {
        if (const auto *al = GetAreaLocale(entry))
            if (namePtr && al->Name.size() > size_t(loc_idx) && !al->Name[loc_idx].empty())
                *namePtr = al->Name[loc_idx].c_str();
    }
}
