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

    auto nameResponse = std::make_unique<WorldPackets::Query::NameQueryResponse>();
    nameResponse->playerGuid = p->GetObjectGuid();
    nameResponse->name = p->GetName();
    nameResponse->race = p->GetRace();
    nameResponse->gender = p->GetGender();
    nameResponse->class_ = p->GetClass();
    SendPacket(std::move(nameResponse));
}

void WorldSession::SendNameQueryOpcodeFromDB(ObjectGuid guid)
{
    // Using the cache...
    if (PlayerCacheData* pData = sObjectMgr.GetPlayerDataByGUID(guid.GetCounter()))
    {
        auto nameResponse = std::make_unique<WorldPackets::Query::NameQueryResponse>();
        nameResponse->playerGuid = ObjectGuid(HIGHGUID_PLAYER, pData->uiGuid);
        nameResponse->name = pData->sName;
        nameResponse->race = pData->uiRace;
        nameResponse->gender = pData->uiGender;
        nameResponse->class_ = pData->uiClass;
        SendPacket(std::move(nameResponse));
    }
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

    auto nameResponse = std::make_unique<WorldPackets::Query::NameQueryResponse>();
    nameResponse->playerGuid = ObjectGuid(HIGHGUID_PLAYER, lowguid);
    nameResponse->name = name;
    nameResponse->race = pRace;
    nameResponse->gender = pGender;
    nameResponse->class_ = pClass;
    session->SendPacket(std::move(nameResponse));

    delete result;
}

void WorldSession::HandleQueryPlayerNameOpcode(WorldPackets::Query::QueryPlayerName const& packet)
{
    Player* pChar = sObjectMgr.GetPlayer(packet.playerGuid);

    if (pChar)
        SendNameQueryOpcode(pChar);
    else
        SendNameQueryOpcodeFromDB(packet.playerGuid);
}

void WorldSession::HandleQueryTimeOpcode(NullClientPacket const& /*packet*/)
{
    SendQueryTimeResponse();
}

// Only _static_ data send in this packet !!!
void WorldSession::HandleCreatureQueryOpcode(WorldPackets::Query::QueryCreature const& packet)
{
    CreatureInfo const* ci = sObjectMgr.GetCreatureTemplate(packet.entry);
    if (ci)
    {
        auto response = std::make_unique<WorldPackets::Query::CreatureQueryResponse>();
        response->sessionDbLocaleIndex = GetSessionDbLocaleIndex();
        response->maybeCreatureInfo = ci;
        SendPacket(std::move(response));
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: CMSG_CREATURE_QUERY - Guid: %s Entry: %u NO CREATURE INFO!",
                  packet.guid.GetString().c_str(), packet.entry);
        auto response = std::make_unique<WorldPackets::Query::CreatureQueryResponse>();
        response->maybeCreatureInfo = nonstd::make_unexpected(packet.entry); // not found
        SendPacket(std::move(response));
    }
}

// Only _static_ data send in this packet !!!
void WorldSession::HandleGameObjectQueryOpcode(WorldPackets::Query::QueryGameObject const& packet)
{
    GameObjectInfo const* info = sObjectMgr.GetGameObjectTemplate(packet.entryID);
    if (info)
    {
        auto response = std::make_unique<WorldPackets::Query::GameObjectQueryResponse>();
        response->sessionDbLocaleIndex = GetSessionDbLocaleIndex();
        response->maybeGameObjectInfo = info;
        //data << float(info->size);                // [-ZERO] go size: not in Zero
        SendPacket(std::move(response));
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: CMSG_GAMEOBJECT_QUERY - Guid: %s Entry: %u Missing gameobject info!",
                  packet.guid.GetString().c_str(), packet.entryID);
        auto response = std::make_unique<WorldPackets::Query::GameObjectQueryResponse>();
        response->maybeGameObjectInfo = nonstd::make_unexpected(packet.entryID); // not found
        SendPacket(std::move(response));
    }
}

void WorldSession::HandleCorpseQueryOpcode(NullClientPacket const& /*packet*/)
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

void WorldSession::HandleNpcTextQueryOpcode(WorldPackets::Npc::NpcTextQuery const& packet)
{
    NpcText const* pGossip = sObjectMgr.GetNpcText(packet.textID);

    auto response = std::make_unique<WorldPackets::Query::NpcTextUpdate>();
    response->textId = packet.textID;

    if (!pGossip)
    {
        for (uint32 i = 0; i < 8; ++i)
        {
            response->options[i].probability = 0.0f;
            response->options[i].maleText = "Greetings $N";
            response->options[i].femaleText = "Greetings $N";
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

                response->options[i].probability = pGossip->Options[i].Probability;

                if (maleText.empty())
                    response->options[i].maleText = femaleText;
                else
                    response->options[i].maleText = maleText;

                if (femaleText.empty())
                    response->options[i].femaleText = maleText;
                else
                    response->options[i].femaleText = femaleText;

                response->options[i].language = bct->languageId;

                response->options[i].emoteDelay1 = bct->emoteDelay1;
                response->options[i].emote1 = bct->emoteId1;
                response->options[i].emoteDelay2 = bct->emoteDelay2;
                response->options[i].emote2 = bct->emoteId2;
                response->options[i].emoteDelay3 = bct->emoteDelay3;
                response->options[i].emote3 = bct->emoteId3;
            }
            else
            {
                response->options[i].probability = 0.0f;
                response->options[i].maleText = "Greetings $N";
                response->options[i].femaleText = "Greetings $N";
            }
        }
    }

    SendPacket(std::move(response));
}

void WorldSession::HandlePageTextQueryOpcode(WorldPackets::Query::QueryPageText const& packet)
{
    uint32 pageID = packet.pageID;
    while (pageID)
    {
        PageText const* pPage = sPageTextStore.LookupEntry<PageText>(pageID);
        auto pageResponse = std::make_unique<WorldPackets::Query::PageTextQueryResponse>();
        pageResponse->pageId = pageID;

        if (!pPage)
        {
            pageResponse->text = "Item page missing.";
            pageResponse->nextPageId = 0;
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

            pageResponse->text = text;
            pageResponse->nextPageId = pPage->next_page;
            pageID = pPage->next_page;
        }
        SendPacket(std::move(pageResponse));
    }
}

void WorldSession::SendQueryTimeResponse()
{
    auto packet = std::make_unique<WorldPackets::Query::QueryTimeResponse>();
    packet->time = static_cast<uint32>(time(nullptr));
    SendPacket(std::move(packet));
}
