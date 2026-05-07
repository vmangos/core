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

void WorldSession::HandlePetitionBuyOpcode(WorldPackets::Petition::PetitionBuy const& packet)
{
    // prevent cheating
    Creature* pCreature = GetPlayer()->GetNPCIfCanInteractWith(packet.guidNPC, UNIT_NPC_FLAG_PETITIONER);
    if (!pCreature)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: HandlePetitionBuyOpcode - %s not found or you can't interact with him.", packet.guidNPC.GetString().c_str());
        return;
    }

    if (!pCreature->IsTabardDesigner())
        return;

    if (HasTrialRestrictions())
    {
        SendNotification(LANG_RESTRICTED_ACCOUNT);
        return;
    }

    // remove fake death
    if (GetPlayer()->HasUnitState(UNIT_STATE_FEIGN_DEATH))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    // if tabard designer, then trying to buy a guild charter.
    // do not let if already in guild.
    if (_player->GetGuildId())
        return;

    // Cannot buy a petition if the owner already has one
    if (Petition* petition = sGuildMgr.GetPetitionByOwnerGuid(_player->GetObjectGuid()))
        return;

    uint32 charterid = GUILD_CHARTER;
    uint32 cost = GUILD_CHARTER_COST;

    if (sGuildMgr.GetGuildByName(packet.name))
    {
        SendGuildCommandResult(GUILD_CREATE_S, packet.name, ERR_GUILD_NAME_EXISTS_S);
        return;
    }
    if (sObjectMgr.IsReservedName(packet.name) || !ObjectMgr::IsValidCharterName(packet.name))
    {
        SendGuildCommandResult(GUILD_CREATE_S, packet.name, ERR_GUILD_NAME_INVALID);
        return;
    }

    // Check guild petition name (use whisper type - 6)
    if (AntispamInterface *a = sAnticheatMgr->GetAntispam())
    {
        if (a->filterMessage(packet.name))
        {
            sWorld.LogChat(this, "Guild", "Attempt to create guild petition with spam name");
            SendGuildCommandResult(GUILD_CREATE_S, packet.name, ERR_GUILD_NAME_INVALID);
            return;
        }
    }

    ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(charterid);
    if (!pProto)
    {
        _player->SendBuyError(BUY_ERR_CANT_FIND_ITEM, nullptr, charterid, 0);
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
        _player->SendEquipError(msg, nullptr, nullptr, charterid);
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

    sGuildMgr.CreatePetition(petitionId, _player, charter->GetObjectGuid(), packet.name);

    _player->SaveInventoryAndGoldToDB();
}

void WorldSession::HandlePetitionShowSignOpcode(WorldPackets::Petition::PetitionShowSignatures const& packet)
{
    // if guild petition and has guild => error, return;
    if (_player->GetGuildId())
        return;

    Item *charter = _player->GetItemByGuid(packet.itemGuid);
    if (!charter)
        return;

    uint32 petitionGuid = charter->GetEnchantmentId(EnchantmentSlot(0));
    Petition *petition = sGuildMgr.GetPetitionById(petitionGuid);

    if (!petition)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PetitionHandler] No petition exists for petition ID %u, yet charter exists with guid %u for owner %s",
            petitionGuid, packet.itemGuid.GetCounter(), _player->GetGuidStr().c_str());

        return;
    }

    uint8 signs = petition->GetSignatureCount();

    WorldPacket data(SMSG_PETITION_SHOW_SIGNATURES, (8 + 8 + 4 + 1 + signs * 12));
    data << packet.itemGuid;                        // item guid
    data << _player->GetObjectGuid();               // owner guid
    data << petitionGuid;                           // petition guid
    data << signs;                                  // sign's count

    petition->BuildSignatureData(data);

    SendPacket(&data);
}

void WorldSession::HandlePetitionQueryOpcode(WorldPackets::Petition::QueryPetition const& packet)
{
    Petition* petition = sGuildMgr.GetPetitionById(packet.petitionGuid);
    if (!petition)
        return;

    auto response = std::make_unique<WorldPackets::Petition::PetitionQueryResponse>();
    response->petitionGuid = packet.petitionGuid;
    response->ownerGuid = ObjectGuid(petition->GetOwnerGuid());
    response->name = petition->GetName();
    response->flags = 1;
    response->minSignatures = 9;
    response->maxSignatures = 9;
    SendPacket(std::move(response));
}

void WorldSession::HandlePetitionRenameOpcode(WorldPackets::Petition::PetitionRename const& packet)
{
    Item *charter = _player->GetItemByGuid(packet.itemGuid);
    if (!charter)
        return;

    if (sGuildMgr.GetGuildByName(packet.newName))
    {
        SendGuildCommandResult(GUILD_CREATE_S, packet.newName, ERR_GUILD_NAME_EXISTS_S);
        return;
    }
    if (sObjectMgr.IsReservedName(packet.newName) || !ObjectMgr::IsValidCharterName(packet.newName))
    {
        SendGuildCommandResult(GUILD_CREATE_S, packet.newName, ERR_GUILD_NAME_INVALID);
        return;
    }

    uint32 petitionGuid = charter->GetEnchantmentId(EnchantmentSlot(0));
    Petition* petition = sGuildMgr.GetPetitionById(petitionGuid);
    if (!petition)
        return;

    if (petition->Rename(packet.newName))
    {
        auto renameResult = std::make_unique<WorldPackets::Petition::PetitionRenameResult>();
        renameResult->itemGuid = packet.itemGuid;
        renameResult->newName = packet.newName;
        SendPacket(std::move(renameResult));
    }
}

void WorldSession::HandlePetitionSignOpcode(WorldPackets::Petition::PetitionSign const& packet)
{
    Petition* petition = sGuildMgr.GetPetitionByCharterGuid(packet.itemGuid);

    if (!petition)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PetitionHandler] No petition exists for charter with guid %u for signer %s",
            packet.itemGuid.GetCounter(), _player->GetGuidStr().c_str());
        return;
    }

    if (petition->IsComplete()) // reached maximum number of signatures for this petition
        return;

    if (petition->GetOwnerGuid() == _player->GetObjectGuid())
    {
        auto signPacket = std::make_unique<WorldPackets::Petition::PetitionSignResults>();
        signPacket->itemGuid = packet.itemGuid;
        signPacket->playerGuid = _player->GetObjectGuid();
        signPacket->result = PETITION_SIGN_CANT_SIGN_OWN;
        SendPacket(std::move(signPacket));
        return;
    }

    if (HasTrialRestrictions())
    {
        SendNotification(LANG_RESTRICTED_ACCOUNT);
        return;
    }

    // not let enemies sign guild charter
    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD) &&
            GetPlayer()->GetTeam() != petition->GetTeam())
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

    uint8 signs = petition->GetSignatureCount();

    // Client hard limit at 9 signatures
    if (signs >= 9)
        return;

    //client doesn't allow to sign petition two times by one character, but not check sign by another character from same account
    //not allow sign another player from already sign player account
    if (PetitionSignature* signature = petition->GetSignatureForPlayer(_player))
    {
        auto signPacket = std::make_unique<WorldPackets::Petition::PetitionSignResults>();
        signPacket->itemGuid = packet.itemGuid;
        signPacket->playerGuid = _player->GetObjectGuid();
        signPacket->result = PETITION_SIGN_ALREADY_SIGNED;

        // close at signer side
        SendPacket(std::move(signPacket));

        // Update for owner if online. Note: Unsure if this is the correct message,
        // but sending SMSG_PETITION_SIGN_RESULTS does nothing for the owner here
        if (Player* owner = sObjectMgr.GetPlayer(petition->GetOwnerGuid()))
            owner->GetSession()->SendGuildCommandResult(GUILD_INVITE_S, _player->GetName(), ERR_ALREADY_INVITED_TO_GUILD_S);
        return;
    }

    if (petition->AddNewSignature(_player))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "PETITION SIGN: %u by %s", petition->GetId(), _player->GetGuidStr().c_str());

        auto signPacket = std::make_unique<WorldPackets::Petition::PetitionSignResults>();
        signPacket->itemGuid = packet.itemGuid;
        signPacket->playerGuid = _player->GetObjectGuid();
        signPacket->result = PETITION_SIGN_OK;

        // close at signer side
        SendPacket(std::move(signPacket));

        // update signs count on charter, required testing...
        //Item *item = _player->GetItemByGuid(petitionguid));
        //if (item)
        //    item->SetUInt32Value(ITEM_FIELD_ENCHANTMENT+1, signs);

        // update for owner if online
        if (Player* owner = sObjectMgr.GetPlayer(petition->GetOwnerGuid()))
        {
            auto ownerPacket = std::make_unique<WorldPackets::Petition::PetitionSignResults>();
            ownerPacket->itemGuid = packet.itemGuid;
            ownerPacket->playerGuid = _player->GetObjectGuid();
            ownerPacket->result = PETITION_SIGN_OK;
            owner->GetSession()->SendPacket(std::move(ownerPacket));
        }
    }
}

void WorldSession::HandlePetitionDeclineOpcode(WorldPackets::Petition::PetitionDecline const& packet)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Petition %s declined by %s", packet.itemGuid.GetString().c_str(), _player->GetGuidStr().c_str());

    Petition* petition = sGuildMgr.GetPetitionByCharterGuid(packet.itemGuid);

    if (!petition)
        return;

    // TODO: Check if this is actually used
    Player* owner = sObjectMgr.GetPlayer(petition->GetOwnerGuid());
    if (owner)                                              // petition owner online
    {
        auto declineResult = std::make_unique<WorldPackets::Petition::PetitionDeclineResult>();
        declineResult->playerGuid = _player->GetObjectGuid();
        owner->GetSession()->SendPacket(std::move(declineResult));
    }
}

void WorldSession::HandleOfferPetitionOpcode(WorldPackets::Petition::OfferPetition const& packet)
{
    Player* player = ObjectAccessor::FindPlayer(packet.playerGuid);
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

    if (player->GetSession()->HasTrialRestrictions())
    {
        SendNotification(LANG_RESTRICTED_ACCOUNT);
        return;
    }

    Item const* charter = _player->GetItemByGuid(packet.itemGuid);
    if (!charter)
        return;

    uint32 petitionGuid = charter->GetEnchantmentId(EnchantmentSlot(0));

    Petition const* petition = sGuildMgr.GetPetitionById(petitionGuid);
    if (!petition)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PetitionHandler] No petition exists for charter with guid %u for signer %s",
            charter->GetObjectGuid().GetCounter(), _player->GetGuidStr().c_str());
        return;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "OFFER PETITION: petition %u to %s", petitionGuid, player->GetName());

    // Get petition signs count
    uint8 signs = petition->GetSignatureCount();

    // Send response
    WorldPacket data(SMSG_PETITION_SHOW_SIGNATURES, (8 + 8 + 4 + 1 + signs * 12));
    data << charter->GetObjectGuid();                       // item guid
    data << _player->GetObjectGuid();                       // owner guid
    data << uint32(petitionGuid);                           // petition guid
    data << uint8(signs);                                   // sign's count

    petition->BuildSignatureData(data);
    player->GetSession()->SendPacket(&data);
}

void WorldSession::HandleTurnInPetitionOpcode(WorldPackets::Petition::TurnInPetition const& packet)
{
    Item *charter = _player->GetItemByGuid(packet.itemGuid);
    if (!charter)
        return;

    uint32 petitionGuid = charter->GetEnchantmentId(EnchantmentSlot(0));
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Petition %u turned in by %s", petitionGuid, _player->GetGuidStr().c_str());

    Petition* petition = sGuildMgr.GetPetitionById(petitionGuid);
    if (!petition)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PetitionHandler] No petition exists for charter with guid %u for guild master %s",
            packet.itemGuid.GetCounter(), _player->GetGuidStr().c_str());
        return;
    }

    if (HasTrialRestrictions())
    {
        SendNotification(LANG_RESTRICTED_ACCOUNT);
        return;
    }

    // Collect petition info data
    if (_player->GetGuildId())
    {
        auto turnInPacket = std::make_unique<WorldPackets::Petition::TurnInPetitionResults>();
        turnInPacket->result = PETITION_SIGN_ALREADY_IN_GUILD; // already in guild
        _player->GetSession()->SendPacket(std::move(turnInPacket));
        return;
    }

    if (_player->GetObjectGuid() != petition->GetOwnerGuid())
        return;

    if (!petition->IsComplete())
    {
        auto turnInPacket = std::make_unique<WorldPackets::Petition::TurnInPetitionResults>();
        turnInPacket->result = PETITION_SIGN_NEED_MORE; // need more signatures...
        SendPacket(std::move(turnInPacket));
        return;
    }

    if (sGuildMgr.GetGuildByName(petition->GetName()))
    {
        SendGuildCommandResult(GUILD_CREATE_S, petition->GetName(), ERR_GUILD_NAME_EXISTS_S);
        return;
    }

    // OK!

    Guild* guild = new Guild;
    if (!guild->Create(petition, _player))
    {
        delete guild;
        return;
    }

    // register guild
    sGuildMgr.AddGuild(guild);

    sGuildMgr.DeletePetition(petition);
    petition = nullptr; // deleted in GuildMgr::DeletePetition

    // Delete the charter item now. Deleting the charter deletes the petition
    // if it still exists, so we do not want to do it before the guild is
    // created.
    _player->DestroyItem(charter->GetBagSlot(), charter->GetSlot(), true);

    // created
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "TURN IN PETITION %u", petitionGuid);

    auto turnInPacket = std::make_unique<WorldPackets::Petition::TurnInPetitionResults>();
    turnInPacket->result = PETITION_SIGN_OK;
    SendPacket(std::move(turnInPacket));
}

void WorldSession::HandlePetitionShowListOpcode(WorldPackets::Petition::PetitionShow const& packet)
{
    SendPetitionShowList(packet.petitionerNpcGuid);
}

void WorldSession::SendPetitionShowList(ObjectGuid guid)
{
    Creature* pCreature = GetPlayer()->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_PETITIONER);
    if (!pCreature)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "WORLD: HandlePetitionShowListOpcode - %s not found or you can't interact with him.", guid.GetString().c_str());
        return;
    }

    // remove fake death
    if (GetPlayer()->HasUnitState(UNIT_STATE_FEIGN_DEATH))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    WorldPackets::Petition::PetitionShowListEntry entry;
    entry.index = 1;
    entry.charterEntry = GUILD_CHARTER;
    entry.charterDisplayId = CHARTER_DISPLAY_ID;
    entry.charterCost = GUILD_CHARTER_COST;
    entry.entryFlags = 1; // must be `&1` to show it in the UI

    auto showList = std::make_unique<WorldPackets::Petition::PetitionShowList>();
    showList->npcGuid = guid;
    showList->entries = { entry };
    SendPacket(std::move(showList));
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Sent SMSG_PETITION_SHOWLIST");
}
