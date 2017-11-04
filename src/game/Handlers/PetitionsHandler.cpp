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
#include "Language.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "ObjectMgr.h"
#include "Log.h"
#include "Opcodes.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "GossipDef.h"
#include "SocialMgr.h"
#include "Anticheat.h"

// Charters ID in item_template
#define GUILD_CHARTER               5863
#define GUILD_CHARTER_COST          1000                    // 10 S
#define CHARTER_DISPLAY_ID          16161

void WorldSession::HandlePetitionBuyOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received opcode CMSG_PETITION_BUY");

    ObjectGuid guidNPC;
    uint32 unk2;
    std::string name;

    recv_data >> guidNPC;                                   // NPC GUID
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint64>();                          // 0
    recv_data >> name;                                      // name
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint16>();                          // 0
    recv_data.read_skip<uint8>();                           // 0

    recv_data >> unk2;                                      // index
    recv_data.read_skip<uint32>();                          // 0

    DEBUG_LOG("Petitioner %s tried sell petition: name %s", guidNPC.GetString().c_str(), name.c_str());

    // prevent cheating
    Creature *pCreature = GetPlayer()->GetNPCIfCanInteractWith(guidNPC, UNIT_NPC_FLAG_PETITIONER);
    if (!pCreature)
    {
        DEBUG_LOG("WORLD: HandlePetitionBuyOpcode - %s not found or you can't interact with him.", guidNPC.GetString().c_str());
        return;
    }

    if (!pCreature->isTabardDesigner())
        return;

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    // if tabard designer, then trying to buy a guild charter.
    // do not let if already in guild.
    if (_player->GetGuildId())
        return;

    uint32 charterid = GUILD_CHARTER;
    uint32 cost = GUILD_CHARTER_COST;

    if (sGuildMgr.GetGuildByName(name))
    {
        SendGuildCommandResult(GUILD_CREATE_S, name, ERR_GUILD_NAME_EXISTS_S);
        return;
    }
    if (sObjectMgr.IsReservedName(name) || !ObjectMgr::IsValidCharterName(name))
    {
        SendGuildCommandResult(GUILD_CREATE_S, name, ERR_GUILD_NAME_INVALID);
        return;
    }

    // Check guild petition name (use whisper type - 6)
    if (AntispamInterface *a = sAnticheatLib->GetAntispam())
    {
        if (a->filterMessage(name))
        {
            sWorld.LogChat(this, "Guild", "Attempt to create guild petition with spam name" + name);
            SendGuildCommandResult(GUILD_CREATE_S, name, ERR_GUILD_NAME_INVALID);
            return;
        }
    }

    ItemPrototype const *pProto = ObjectMgr::GetItemPrototype(charterid);
    if (!pProto)
    {
        _player->SendBuyError(BUY_ERR_CANT_FIND_ITEM, NULL, charterid, 0);
        return;
    }

    if (_player->GetMoney() < cost)
    {
        //player hasn't got enough money
        _player->SendBuyError(BUY_ERR_NOT_ENOUGHT_MONEY, pCreature, charterid, 0);
        return;
    }

    ItemPosCountVec dest;
    InventoryResult msg = _player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, charterid, pProto->BuyCount);
    if (msg != EQUIP_ERR_OK)
    {
        _player->SendEquipError(msg, NULL, NULL, charterid);
        return;
    }

    _player->ModifyMoney(-(int32)cost);
    Item *charter = _player->StoreNewItem(dest, charterid, true);
    if (!charter)
        return;

    uint32 petitionId = sObjectMgr.GeneratePetitionID();
    charter->SetUInt32Value(ITEM_FIELD_ENCHANTMENT, petitionId);
    // ITEM_FIELD_ENCHANTMENT is guild
    // ITEM_FIELD_ENCHANTMENT+1 is current signatures count (showed on item)
    charter->SetState(ITEM_CHANGED, _player);
    _player->SendNewItem(charter, 1, true, false);

    // a petition is invalid, if both the owner and the type matches
    // we checked above, if this player is in an arenateam, so this must be data corruption
    QueryResult *result = CharacterDatabase.PQuery("SELECT petitionguid FROM petition WHERE ownerguid = '%u'", _player->GetGUIDLow());

    std::ostringstream ssInvalidPetitionGUIDs;

    if (result)
    {

        do
        {
            Field *fields = result->Fetch();
            ssInvalidPetitionGUIDs << "'" << fields[0].GetUInt32() << "' , ";
        }
        while (result->NextRow());

        delete result;
    }

    // delete petitions with the same guid as this one
    ssInvalidPetitionGUIDs << "'" << petitionId << "'";

    DEBUG_LOG("Invalid petition GUIDs: %s", ssInvalidPetitionGUIDs.str().c_str());
    CharacterDatabase.escape_string(name);
    CharacterDatabase.BeginTransaction();
    CharacterDatabase.PExecute("DELETE FROM petition WHERE petitionguid IN ( %s )",  ssInvalidPetitionGUIDs.str().c_str());
    CharacterDatabase.PExecute("DELETE FROM petition_sign WHERE petitionguid IN ( %s )", ssInvalidPetitionGUIDs.str().c_str());
    CharacterDatabase.PExecute("INSERT INTO petition (ownerguid, petitionguid, name) VALUES ('%u', '%u', '%s')",
                               _player->GetGUIDLow(), petitionId, name.c_str());
    CharacterDatabase.CommitTransaction();

    _player->SaveInventoryAndGoldToDB();
}

void WorldSession::HandlePetitionShowSignOpcode(WorldPacket & recv_data)
{
    // ok
    DEBUG_LOG("Received opcode CMSG_PETITION_SHOW_SIGNATURES");
    //recv_data.hexlike();

    uint8 signs = 0;
    ObjectGuid itemguid;
    recv_data >> itemguid;                                   // item guid

    // if guild petition and has guild => error, return;
    if (_player->GetGuildId())
        return;

    Item *charter = _player->GetItemByGuid(itemguid);
    if (!charter)
        return;

    uint32 petitionguid = charter->GetEnchantmentId(EnchantmentSlot(0));
    QueryResult* result = CharacterDatabase.PQuery("SELECT playerguid FROM petition_sign WHERE petitionguid = '%u'", petitionguid);

    // result==NULL also correct in case no sign yet
    if (result)
        signs = (uint8)result->GetRowCount();

    DEBUG_LOG("CMSG_PETITION_SHOW_SIGNATURES petition: %u", petitionguid);

    WorldPacket data(SMSG_PETITION_SHOW_SIGNATURES, (8 + 8 + 4 + 1 + signs * 12));
    data << ObjectGuid(itemguid);                           // item guid
    data << _player->GetObjectGuid();                       // owner guid
    data << uint32(petitionguid);                           // petition guid
    data << uint8(signs);                                   // sign's count

    for (uint8 i = 1; i <= signs; ++i)
    {
        Field *fields2 = result->Fetch();
        ObjectGuid signerGuid = ObjectGuid(HIGHGUID_PLAYER, fields2[0].GetUInt32());

        data << ObjectGuid(signerGuid);                     // Player GUID
        data << uint32(0);                                  // there 0 ...

        result->NextRow();
    }
    delete result;
    SendPacket(&data);
}

void WorldSession::HandlePetitionQueryOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received opcode CMSG_PETITION_QUERY");
    //recv_data.hexlike();

    uint32 petitionguid;
    ObjectGuid itemguid;
    recv_data >> petitionguid;                          // petition guid
    recv_data >> itemguid;                              // item guid
    DEBUG_LOG("CMSG_PETITION_QUERY Item %s Petition GUID %u", itemguid.GetString().c_str(), petitionguid);

    SendPetitionQueryOpcode(petitionguid);
}

void WorldSession::SendPetitionQueryOpcode(uint32 petitionguid)
{
    ObjectGuid ownerGuid;
    std::string name = "NO_NAME_FOR_GUID";
    uint8 signs = 0;

    QueryResult *result = CharacterDatabase.PQuery(
                              "SELECT ownerguid, name, "
                              "  (SELECT COUNT(playerguid) FROM petition_sign WHERE petition_sign.petitionguid = '%u') AS signs "
                              "FROM petition WHERE petitionguid = '%u'", petitionguid, petitionguid);

    if (result)
    {
        Field* fields = result->Fetch();
        ownerGuid = ObjectGuid(HIGHGUID_PLAYER, fields[0].GetUInt32());
        name      = fields[1].GetCppString();
        signs     = fields[2].GetUInt8();
        delete result;
    }
    else
    {
        DEBUG_LOG("CMSG_PETITION_QUERY failed for petition (GUID: %u)", petitionguid);
        return;
    }

    WorldPacket data(SMSG_PETITION_QUERY_RESPONSE, (4 + 8 + name.size() + 1 + 2 + 4 * 11));
    data << uint32(petitionguid);                           // petition guid
    data << ObjectGuid(ownerGuid);                          // charter owner guid
    data << name;                                           // name (guild/arena team)
    data << uint8(0);                                       // CString
    data << uint32(1);
    data << uint32(9);
    data << uint32(9);                                      // bypass client - side limitation, a different value is needed here for each petition
    data << uint32(0);                                      // 5
    data << uint32(0);                                      // 6
    data << uint32(0);                                      // 7
    data << uint32(0);                                      // 8
    data << uint32(0);                                      // 9
    data << uint16(0);                                      // 10 2 bytes field
    data << uint32(0);                                      // 11
    data << uint32(0);                                      // 12
    data << uint32(0);                                      // 13 count of next strings; if 0, no data for strings, only 1 uint32 below
    // for (int i=0; i<field13; ++i) data << chartSignersName[i];   Probably, names of the petition signers
    data << uint32(0);
    SendPacket(&data);
}

void WorldSession::HandlePetitionRenameOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received opcode MSG_PETITION_RENAME");   // ok
    //recv_data.hexlike();

    ObjectGuid itemGuid;
    std::string newname;

    recv_data >> itemGuid;                              // item
    recv_data >> newname;                               // new name

    Item *charter = _player->GetItemByGuid(itemGuid);
    if (!charter)
        return;

    if (sGuildMgr.GetGuildByName(newname))
    {
        SendGuildCommandResult(GUILD_CREATE_S, newname, ERR_GUILD_NAME_EXISTS_S);
        return;
    }
    if (sObjectMgr.IsReservedName(newname) || !ObjectMgr::IsValidCharterName(newname))
    {
        SendGuildCommandResult(GUILD_CREATE_S, newname, ERR_GUILD_NAME_INVALID);
        return;
    }

    std::string db_newname = newname;
    uint32 petitionguid = charter->GetEnchantmentId(EnchantmentSlot(0));
    CharacterDatabase.escape_string(db_newname);
    CharacterDatabase.PExecute("UPDATE petition SET name = '%s' WHERE petitionguid = '%u'",
                               db_newname.c_str(), petitionguid);

    DEBUG_LOG("Petition %s renamed to '%s'", petitionguid, newname.c_str());

    WorldPacket data(MSG_PETITION_RENAME, (8 + newname.size() + 1));
    data << ObjectGuid(itemGuid);
    data << newname;
    SendPacket(&data);
}

void WorldSession::HandlePetitionSignOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received opcode CMSG_PETITION_SIGN");    // ok
    //recv_data.hexlike();

    Field *fields;
    ObjectGuid itemGuid;
    uint8 unk;
    recv_data >> itemGuid;                              // item guid
    recv_data >> unk;

    uint32 itemLowGuid = itemGuid.GetCounter();
    QueryResult *result = CharacterDatabase.PQuery("SELECT enchantments FROM item_instance WHERE guid = '%u'", itemLowGuid);

    if (!result)
    {
        sLog.outError("any petition on server...");
        return;
    }

    uint32 petitionid = 0;
    fields = result->Fetch();
    std::stringstream ss(fields[0].GetCppString());
    ss >> petitionid;

    delete result;

    result = CharacterDatabase.PQuery(
                              "SELECT ownerguid, "
                              "  (SELECT COUNT(playerguid) FROM petition_sign WHERE petition_sign.petitionguid = '%u') AS signs "
                              "FROM petition WHERE petitionguid = '%u'", petitionid, petitionid);

    if (!result)
    {
        sLog.outError("any petition on server...");
        return;
    }

    fields = result->Fetch();
    uint32 ownerLowGuid = fields[0].GetUInt32();
    ObjectGuid ownerGuid = ObjectGuid(HIGHGUID_PLAYER, ownerLowGuid);
    uint8 signs = fields[1].GetUInt8();

    delete result;

    if (ownerGuid == _player->GetObjectGuid())
    {
        WorldPacket data(SMSG_PETITION_SIGN_RESULTS, (8 + 8 + 4));
        data << ObjectGuid(itemGuid);
        data << ObjectGuid(_player->GetObjectGuid());
        data << uint32(PETITION_SIGN_CANT_SIGN_OWN);
        SendPacket(&data);
        return;
    }
        

    // not let enemies sign guild charter
    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD) &&
            GetPlayer()->GetTeam() != sObjectMgr.GetPlayerTeamByGUID(ownerGuid))
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_NOT_ALLIED);
        return;
    }

    if (_player->GetGuildId())
    {
        SendGuildCommandResult(GUILD_INVITE_S, _player->GetName(), ERR_ALREADY_IN_GUILD_S);
        return;
    }
    if (_player->GetGuildIdInvited())
    {
        SendGuildCommandResult(GUILD_INVITE_S, _player->GetName(), ERR_ALREADY_INVITED_TO_GUILD_S);
        return;
    }

    if (++signs > 9)                                        // client signs maximum
        return;

    //client doesn't allow to sign petition two times by one character, but not check sign by another character from same account
    //not allow sign another player from already sign player account
    result = CharacterDatabase.PQuery("SELECT playerguid FROM petition_sign WHERE player_account = '%u' AND petitionguid = '%u'", GetAccountId(), petitionid);

    if (result)
    {
        delete result;
        WorldPacket data(SMSG_PETITION_SIGN_RESULTS, (8 + 8 + 4));
        data << ObjectGuid(itemGuid);
        data << ObjectGuid(_player->GetObjectGuid());
        data << uint32(PETITION_SIGN_ALREADY_SIGNED);

        // close at signer side
        SendPacket(&data);

        // update for owner if online
        if (Player *owner = sObjectMgr.GetPlayer(ownerGuid))
            owner->GetSession()->SendPacket(&data);
        return;
    }

    CharacterDatabase.PExecute("INSERT INTO petition_sign (ownerguid,petitionguid, playerguid, player_account) VALUES ('%u', '%u', '%u','%u')",
                               ownerLowGuid, petitionid, _player->GetGUIDLow(), GetAccountId());

    DEBUG_LOG("PETITION SIGN: %s by %s", petitionid, _player->GetGuidStr().c_str());

    WorldPacket data(SMSG_PETITION_SIGN_RESULTS, (8 + 8 + 4));
    data << ObjectGuid(itemGuid);
    data << ObjectGuid(_player->GetObjectGuid());
    data << uint32(PETITION_SIGN_OK);

    // close at signer side
    SendPacket(&data);

    // update signs count on charter, required testing...
    //Item *item = _player->GetItemByGuid(petitionguid));
    //if(item)
    //    item->SetUInt32Value(ITEM_FIELD_ENCHANTMENT+1, signs);

    // update for owner if online
    if (Player *owner = sObjectMgr.GetPlayer(ownerGuid))
        owner->GetSession()->SendPacket(&data);
}

void WorldSession::HandlePetitionDeclineOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received opcode MSG_PETITION_DECLINE");  // ok
    //recv_data.hexlike();

    ObjectGuid itemGuid;
    recv_data >> itemGuid;                              // item guid

    DEBUG_LOG("Petition %s declined by %s", itemGuid.GetString().c_str(), _player->GetGuidStr().c_str());

    uint32 petitionLowGuid = itemGuid.GetCounter();

    QueryResult *result = CharacterDatabase.PQuery("SELECT guid FROM character_inventory WHERE item = '%u'", petitionLowGuid);
    if (!result)
        return;

    Field *fields = result->Fetch();
    ObjectGuid ownerguid = ObjectGuid(HIGHGUID_PLAYER, fields[0].GetUInt32());
    delete result;

    Player *owner = sObjectMgr.GetPlayer(ownerguid);
    if (owner)                                              // petition owner online
    {
        WorldPacket data(MSG_PETITION_DECLINE, 8);
        data << _player->GetObjectGuid();
        owner->GetSession()->SendPacket(&data);
    }
}

void WorldSession::HandleOfferPetitionOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received opcode CMSG_OFFER_PETITION");   // ok
    //recv_data.hexlike();

    ObjectGuid itemGuid;
    ObjectGuid playerGuid;
    recv_data >> itemGuid;                              // item guid
    recv_data >> playerGuid;                            // player guid

    Player *player = ObjectAccessor::FindPlayer(playerGuid);
    if (!player)
        return;

    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD) && GetPlayer()->GetTeam() != player->GetTeam())
    {
        SendGuildCommandResult(GUILD_CREATE_S, "", ERR_GUILD_NOT_ALLIED);
        return;
    }

    if (player->GetGuildId())
    {
        SendGuildCommandResult(GUILD_INVITE_S, _player->GetName(), ERR_ALREADY_IN_GUILD_S);
        return;
    }

    if (player->GetGuildIdInvited())
    {
        SendGuildCommandResult(GUILD_INVITE_S, _player->GetName(), ERR_ALREADY_INVITED_TO_GUILD_S);
        return;
    }

    Item *charter = _player->GetItemByGuid(itemGuid);
    if (!charter)
        return;

    uint32 petitionguid = charter->GetEnchantmentId(EnchantmentSlot(0));
    DEBUG_LOG("OFFER PETITION: petition %s to %s", petitionguid, playerGuid.GetString().c_str());

    /// Get petition signs count
    uint8 signs = 0;
    QueryResult* result = CharacterDatabase.PQuery("SELECT playerguid FROM petition_sign WHERE petitionguid = '%u'", petitionguid);
    // result==NULL also correct charter without signs
    if (result)
        signs = (uint8)result->GetRowCount();

    /// Send response
    WorldPacket data(SMSG_PETITION_SHOW_SIGNATURES, (8 + 8 + 4 + 1 + signs * 12));
    data << ObjectGuid(itemGuid);                           // item guid
    data << ObjectGuid(_player->GetObjectGuid());           // owner guid
    data << uint32(petitionguid);                           // petition guid
    data << uint8(signs);                                   // sign's count

    for (uint8 i = 1; i <= signs; ++i)
    {
        Field *fields2 = result->Fetch();
        ObjectGuid signerGuid = ObjectGuid(HIGHGUID_PLAYER, fields2[0].GetUInt32());

        data << ObjectGuid(signerGuid);                     // Player GUID
        data << uint32(0);                                  // there 0 ...

        result->NextRow();
    }

    delete result;
    player->GetSession()->SendPacket(&data);
}

void WorldSession::HandleTurnInPetitionOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received opcode CMSG_TURN_IN_PETITION"); // ok
    //recv_data.hexlike();

    ObjectGuid itemGuid;
    recv_data >> itemGuid;

    Item *charter = _player->GetItemByGuid(itemGuid);
    if (!charter)
        return;

    uint32 petitionguid = charter->GetEnchantmentId(EnchantmentSlot(0));
    DEBUG_LOG("Petition %s turned in by %s", petitionguid, _player->GetGuidStr().c_str());

    /// Collect petition info data
    ObjectGuid ownerGuid;
    std::string name;

    // data
    QueryResult *result = CharacterDatabase.PQuery("SELECT ownerguid, name FROM petition WHERE petitionguid = '%u'", petitionguid);
    if (result)
    {
        Field *fields = result->Fetch();
        ownerGuid = ObjectGuid(HIGHGUID_PLAYER, fields[0].GetUInt32());
        name = fields[1].GetCppString();
        delete result;
    }
    else
    {
        sLog.outError("CMSG_TURN_IN_PETITION: petition table not have data for guid %u!", petitionguid);
        return;
    }

    if (_player->GetGuildId())
    {
        WorldPacket data(SMSG_TURN_IN_PETITION_RESULTS, 4);
        data << uint32(PETITION_SIGN_ALREADY_IN_GUILD); // already in guild
        _player->GetSession()->SendPacket(&data);
        return;
    }

    if (_player->GetObjectGuid() != ownerGuid)
        return;

    // signs
    result = CharacterDatabase.PQuery("SELECT playerguid FROM petition_sign WHERE petitionguid = '%u'", petitionguid);
    uint8 signs = result ? (uint8)result->GetRowCount() : 0;

    uint32 count = sWorld.getConfig(CONFIG_UINT32_MIN_PETITION_SIGNS);
    if (signs < count)
    {
        WorldPacket data(SMSG_TURN_IN_PETITION_RESULTS, 4);
        data << uint32(PETITION_SIGN_NEED_MORE); // need more signatures...
        SendPacket(&data);
        delete result;
        return;
    }

    if (sGuildMgr.GetGuildByName(name))
    {
        SendGuildCommandResult(GUILD_CREATE_S, name, ERR_GUILD_NAME_EXISTS_S);
        delete result;
        return;
    }

    // OK!

    // delete charter item
    _player->DestroyItem(charter->GetBagSlot(), charter->GetSlot(), true);

    Guild* guild = new Guild;
    if (!guild->Create(_player, name))
    {
        delete guild;
        delete result;
        return;
    }

    // register guild and add guildmaster
    sGuildMgr.AddGuild(guild);

    // add members
    for (uint8 i = 0; i < signs; ++i)
    {
        Field* fields = result->Fetch();

        ObjectGuid signGuid = ObjectGuid(HIGHGUID_PLAYER, fields[0].GetUInt32());
        if (signGuid.IsEmpty())
            continue;

        guild->AddMember(signGuid, guild->GetLowestRank());
        result->NextRow();
    }

    delete result;

    CharacterDatabase.BeginTransaction();
    CharacterDatabase.PExecute("DELETE FROM petition WHERE petitionguid = '%u'", petitionguid);
    CharacterDatabase.PExecute("DELETE FROM petition_sign WHERE petitionguid = '%u'", petitionguid);
    CharacterDatabase.CommitTransaction();

    // created
    DEBUG_LOG("TURN IN PETITION %s", petitionguid);

    WorldPacket data(SMSG_TURN_IN_PETITION_RESULTS, 4);
    data << uint32(PETITION_SIGN_OK);
    SendPacket(&data);
}

void WorldSession::HandlePetitionShowListOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("Received CMSG_PETITION_SHOWLIST");
    //recv_data.hexlike();

    ObjectGuid guid;
    recv_data >> guid;

    SendPetitionShowList(guid);
}

void WorldSession::SendPetitionShowList(ObjectGuid guid)
{
    Creature *pCreature = GetPlayer()->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_PETITIONER);
    if (!pCreature)
    {
        DEBUG_LOG("WORLD: HandlePetitionShowListOpcode - %s not found or you can't interact with him.", guid.GetString().c_str());
        return;
    }

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    uint8 count = 1;

    WorldPacket data(SMSG_PETITION_SHOWLIST, 8 + 1 + 4 * 6);
    data << ObjectGuid(guid);                               // npc guid
    data << count;                                          // count; allowed values 1-10
    data << uint32(1);                                      // index
    data << uint32(GUILD_CHARTER);                          // charter entry
    data << uint32(CHARTER_DISPLAY_ID);                     // charter display id
    data << uint32(GUILD_CHARTER_COST);                     // charter cost
    data << uint32(1);                                      // unknown
    //data << uint32(9);                                    // [-ZERO] required signs?
    //for(uint8 i = 0; i < count; ++i)
    //{
    //    data << uint32(i);                        // index
    //    data << uint32(GUILD_CHARTER);            // charter entry
    //    data << uint32(CHARTER_DISPLAY_ID);       // charter display id
    //    data << uint32(GUILD_CHARTER_COST+i);     // charter cost
    //    data << uint32(1);                        // unknown
    //}
    SendPacket(&data);
    DEBUG_LOG("Sent SMSG_PETITION_SHOWLIST");
}
