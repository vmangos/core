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
#include "Database/DatabaseImpl.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "World.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "Player.h"

void WorldSession::SendNameQueryOpcode(Player* p)
{
    if (!p)
        return;

    // guess size
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    WorldPacket data(SMSG_NAME_QUERY_RESPONSE, (8 + 25 + 1 + 4 + 4 + 4));   // guess size
    data << ObjectGuid(p->GetObjectGuid());
    data << p->GetName();                                   // CString(48): played name
    data << uint8(0);                                       // CString(256): realm name for cross realm BG usage
#else
    WorldPacket data(SMSG_NAME_QUERY_RESPONSE, (8 + 25 + 4 + 4 + 4));   // guess size
    data << ObjectGuid(p->GetObjectGuid());
    data << p->GetName();                                   // CString(48): played name
#endif
    data << uint32(p->GetRace());
    data << uint32(p->GetGender());
    data << uint32(p->GetClass());

    SendPacket(&data);
}

void WorldSession::SendNameQueryOpcodeFromDB(ObjectGuid guid)
{
    // Avec la mise en cache...
    if (PlayerCacheData* pData = sObjectMgr.GetPlayerDataByGUID(guid.GetCounter()))
    {
        std::string name = pData->sName;

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
        WorldPacket data(SMSG_NAME_QUERY_RESPONSE, (8 + (name.size() + 1) + 1 + 4 + 4 + 4));
        data << ObjectGuid(HIGHGUID_PLAYER, pData->uiGuid);
        data << name;
        data << uint8(0);
#else
        WorldPacket data(SMSG_NAME_QUERY_RESPONSE, (8 + (name.size() + 1) + 4 + 4 + 4));
        data << ObjectGuid(HIGHGUID_PLAYER, pData->uiGuid);
        data << name;
#endif
        data << uint32(pData->uiRace);
        data << uint32(pData->uiGender);
        data << uint32(pData->uiClass);

        SendPacket(&data);
    }

    // Ancienne methode :
    /*
    CharacterDatabase.AsyncPQuery(&WorldSession::SendNameQueryOpcodeFromDBCallBack, GetAccountId(),
    //          0     1     2     3       4
        "SELECT guid, name, race, gender, class "
        "FROM characters WHERE guid = '%u'",
        guid.GetCounter());
    */
}

void WorldSession::SendNameQueryOpcodeFromDBCallBack(QueryResult* result, uint32 accountId)
{
    if (!result)
        return;

    WorldSession* session = sWorld.FindSession(accountId);
    if (!session)
    {
        delete result;
        return;
    }

    Field* fields = result->Fetch();
    uint32 lowguid      = fields[0].GetUInt32();
    std::string name = fields[1].GetCppString();
    uint8 pRace = 0, pGender = 0, pClass = 0;
    if (!name.empty())
    {
        pRace        = fields[2].GetUInt8();
        pGender      = fields[3].GetUInt8();
        pClass       = fields[4].GetUInt8();
    }

    // guess size
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    WorldPacket data(SMSG_NAME_QUERY_RESPONSE, (8 + (name.size() + 1) + 1 + 4 + 4 + 4));
    data << ObjectGuid(HIGHGUID_PLAYER, lowguid);
    data << name;
    data << uint8(0);                                       // realm name for cross realm BG usage
#else
    WorldPacket data(SMSG_NAME_QUERY_RESPONSE, (8 + (name.size() + 1) + 4 + 4 + 4));
    data << ObjectGuid(HIGHGUID_PLAYER, lowguid);
    data << name;
#endif
    data << uint32(pRace);                                  // race
    data << uint32(pGender);                                // gender
    data << uint32(pClass);                                 // class

    session->SendPacket(&data);
    delete result;
}

void WorldSession::HandleNameQueryOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;

    recv_data >> guid;

    Player* pChar = sObjectMgr.GetPlayer(guid);

    if (pChar)
        SendNameQueryOpcode(pChar);
    else
        SendNameQueryOpcodeFromDB(guid);
}

void WorldSession::HandleQueryTimeOpcode(WorldPacket& /*recv_data*/)
{
    SendQueryTimeResponse();
}

// Only _static_ data send in this packet !!!
void WorldSession::HandleCreatureQueryOpcode(WorldPacket& recv_data)
{
    uint32 entry;
    ObjectGuid guid;

    recv_data >> entry;
    recv_data >> guid;

    CreatureInfo const* ci = sObjectMgr.GetCreatureTemplate(entry);
    if (ci)
    {
        std::string const* name = &ci->name;
        std::string const* subName = &ci->subname;

        int loc_idx = GetSessionDbLocaleIndex();
        if (loc_idx >= 0)
        {
            CreatureLocale const* cl = sObjectMgr.GetCreatureLocale(entry);
            if (cl)
            {
                if (cl->Name.size() > size_t(loc_idx) && !cl->Name[loc_idx].empty())
                    name = &cl->Name[loc_idx];
                if (cl->SubName.size() > size_t(loc_idx) && !cl->SubName[loc_idx].empty())
                    subName = &cl->SubName[loc_idx];
            }
        }

        constexpr size_t fixedSize =
            sizeof(uint32) // entry
            + sizeof(char) // name
            + sizeof(char) // name2
            + sizeof(char) // name3
            + sizeof(char) // name4
            + sizeof(char) // subName
            + sizeof(uint32) // type_flags
            + sizeof(uint32) // type
            + sizeof(uint32) // pet_family
            + sizeof(uint32) // rank
            + sizeof(uint32) // unknown
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
            + sizeof(uint32) // pet_spell_list_id
#endif
            + sizeof(uint32)  // display_id
            + sizeof(uint8)  // civilian
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            + sizeof(uint8) // racial_leader
#endif
            ;

        size_t const nameLen = name->size();
        size_t const subNameLen = subName->size();

        // guess size
        WorldPacket data(SMSG_CREATURE_QUERY_RESPONSE, fixedSize + nameLen + subNameLen);
        data << uint32(entry);                              // creature entry
        data.append(name->c_str(), nameLen + 1);
        data << uint8(0) << uint8(0) << uint8(0);           // name2, name3, name4, always empty
        data.append(subName->c_str(), subNameLen + 1);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        data << uint32(ci->GetTypeFlags());
#else
        data << uint32(ci->static_flags1);
#endif
        data << uint32(ci->type);
        data << uint32(ci->pet_family);                     // CreatureFamily.dbc
        data << uint32(ci->rank);                           // Creature Rank (elite, boss, etc)
        data << uint32(0);                                  // unknown
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
        data << uint32(ci->pet_spell_list_id);              // Id from CreatureSpellData.dbc
#endif
        data << uint32(ci->display_id[0]);
        data << uint8(ci->civilian);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        data << uint8(ci->racial_leader);
#endif
        SendPacket(&data);
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: CMSG_CREATURE_QUERY - Guid: %s Entry: %u NO CREATURE INFO!",
                  guid.GetString().c_str(), entry);
        WorldPacket data(SMSG_CREATURE_QUERY_RESPONSE, 4);
        data << uint32(entry | 0x80000000);
        SendPacket(&data);
    }
}

// Only _static_ data send in this packet !!!
void WorldSession::HandleGameObjectQueryOpcode(WorldPacket& recv_data)
{
    uint32 entryID;
    recv_data >> entryID;
    ObjectGuid guid;
    recv_data >> guid;

    GameObjectInfo const* info = sObjectMgr.GetGameObjectTemplate(entryID);
    if (info)
    {
        char const* name = info->name.c_str();
        int loc_idx = GetSessionDbLocaleIndex();
        if (loc_idx >= 0)
        {
            GameObjectLocale const* gl = sObjectMgr.GetGameObjectLocale(entryID);
            if (gl)
            {
                if (gl->Name.size() > size_t(loc_idx) && !gl->Name[loc_idx].empty())
                    name = gl->Name[loc_idx].c_str();
            }
        }

        constexpr size_t fixedSize =
            sizeof(uint32) + // entryID
            sizeof(uint32) + // type
            sizeof(uint32) + // displayId
            sizeof(char) + // name
            sizeof(char) + // name2
            sizeof(char) + // name3
            sizeof(char) + // name4
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
            sizeof(char) + // name5
            sizeof(uint32) * 24; // data
#else
            sizeof(uint32) * 16; // data
#endif

        size_t const nameLen = strlen(name);

        WorldPacket data(SMSG_GAMEOBJECT_QUERY_RESPONSE, fixedSize + nameLen);
        data << uint32(entryID);
        data << uint32(info->type);
        data << uint32(info->displayId);
        data.append(name, nameLen + 1);
        data << uint8(0) << uint8(0) << uint8(0);   // name2, name3, name4
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
        data << info->icon;
        data.append(info->raw.data, 24);            // these are read as int32
#else
        data.append(info->raw.data, 16);            // these are read as int32
#endif    
        //data << float(info->size);                // [-ZERO] go size: not in Zero
        SendPacket(&data);
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: CMSG_GAMEOBJECT_QUERY - Guid: %s Entry: %u Missing gameobject info!",
                  guid.GetString().c_str(), entryID);
        WorldPacket data(SMSG_GAMEOBJECT_QUERY_RESPONSE, 4);
        data << uint32(entryID | 0x80000000);
        SendPacket(&data);
    }
}

void WorldSession::HandleCorpseQueryOpcode(WorldPacket& /*recv_data*/)
{
    Corpse* corpse = GetPlayer()->GetCorpse();

    if (!corpse)
    {
        WorldPacket data(MSG_CORPSE_QUERY, 1);
        data << uint8(0);                                   // corpse not found
        SendPacket(&data);
        return;
    }

    uint32 corpsemapid = corpse->GetMapId();
    float x = corpse->GetPositionX();
    float y = corpse->GetPositionY();
    float z = corpse->GetPositionZ();
    int32 mapid = corpsemapid;

    // if corpse at different map
    if (corpsemapid != _player->GetMapId())
    {
        // search entrance map for proper show entrance
        if (MapEntry const* temp = sMapStorage.LookupEntry<MapEntry>(mapid))
        {
            if (temp->IsDungeon() && temp->ghostEntranceMap >= 0)
            {
                // if corpse map have entrance
                if (TerrainInfo const* entranceMap = sTerrainMgr.LoadTerrain(temp->ghostEntranceMap))
                {
                    mapid = temp->ghostEntranceMap;
                    x = temp->ghostEntranceX;
                    y = temp->ghostEntranceY;
                    z = entranceMap->GetHeightStatic(x, y, MAX_HEIGHT);
                }
            }
        }
    }

    WorldPacket data(MSG_CORPSE_QUERY, 1 + (5 * 4));
    data << uint8(1);                                       // corpse found
    data << int32(mapid);
    data << float(x);
    data << float(y);
    data << float(z);
    data << uint32(corpsemapid);
    SendPacket(&data);
}

void WorldSession::HandleNpcTextQueryOpcode(WorldPacket& recv_data)
{
    uint32 textID;
    ObjectGuid guid;

    recv_data >> textID;
    recv_data >> guid;

    NpcText const* pGossip = sObjectMgr.GetNpcText(textID);

    WorldPacket data(SMSG_NPC_TEXT_UPDATE, 512);            // guess size
    data << textID;

    if (!pGossip)
    {
        for (uint32 i = 0; i < 8; ++i)
        {
            data << float(0);
            data << "Greetings $N";
            data << "Greetings $N";
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
            data << uint32(0);
        }
    }
    else
    {
        int loc_idx = GetSessionDbLocaleIndex();
        for (int i = 0; i < 8; ++i)
        {
            BroadcastText const* bct = sObjectMgr.GetBroadcastTextLocale(pGossip->Options[i].BroadcastTextID);
            if (bct)
            {
                std::string const& maleText = bct->GetText(loc_idx, GENDER_MALE, true);
                std::string const& femaleText = bct->GetText(loc_idx, GENDER_FEMALE, true);

                data << pGossip->Options[i].Probability;

                if (maleText.empty())
                    data << femaleText;
                else
                    data << maleText;

                if (femaleText.empty())
                    data << maleText;
                else
                    data << femaleText;

                data << bct->languageId;

                data << bct->emoteDelay1;
                data << bct->emoteId1;
                data << bct->emoteDelay2;
                data << bct->emoteId2;
                data << bct->emoteDelay3;
                data << bct->emoteId3;
            }
            else
            {
                data << float(0);
                data << "Greetings $N";
                data << "Greetings $N";
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
            }
        }
    }

    SendPacket(&data);
}

void WorldSession::HandlePageTextQueryOpcode(WorldPacket& recv_data)
{
    uint32 pageID;
    recv_data >> pageID;

    while (pageID)
    {
        PageText const* pPage = sPageTextStore.LookupEntry<PageText>(pageID);
        // guess size
        WorldPacket data(SMSG_PAGE_TEXT_QUERY_RESPONSE, 50);
        data << pageID;

        if (!pPage)
        {
            data << "Item page missing.";
            data << uint32(0);
            pageID = 0;
        }
        else
        {
            char const* text = pPage->text;

            int loc_idx = GetSessionDbLocaleIndex();
            if (loc_idx >= 0)
            {
                PageTextLocale const* pl = sObjectMgr.GetPageTextLocale(pageID);
                if (pl)
                {
                    if (pl->text.size() > size_t(loc_idx) && !pl->text[loc_idx].empty())
                        text = pl->text[loc_idx].c_str();
                }
            }

            data << text;
            data << uint32(pPage->next_page);
            pageID = pPage->next_page;
        }
        SendPacket(&data);
    }
}

void WorldSession::SendQueryTimeResponse()
{
    WorldPacket data(SMSG_QUERY_TIME_RESPONSE, 4);
    data << uint32(time(nullptr));
    SendPacket(&data);
}
