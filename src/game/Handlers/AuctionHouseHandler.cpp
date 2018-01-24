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

#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "World.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "Player.h"
#include "UpdateMask.h"
#include "AuctionHouseMgr.h"
#include "Mail.h"
#include "Util.h"
#include "Chat.h"
#include "Anticheat.h"

// please DO NOT use iterator++, because it is slower than ++iterator!!!
// post-incrementation is always slower than pre-incrementation !

// void called when player click on auctioneer npc
void WorldSession::HandleAuctionHelloOpcode(WorldPacket & recv_data)
{
    ObjectGuid auctioneerGuid;                              // NPC guid
    recv_data >> auctioneerGuid;

    Creature *unit = GetPlayer()->GetNPCIfCanInteractWith(auctioneerGuid, UNIT_NPC_FLAG_AUCTIONEER);
    if (!unit)
    {
        DEBUG_LOG("WORLD: HandleAuctionHelloOpcode - %s not found or you can't interact with him.", auctioneerGuid.GetString().c_str());
        return;
    }

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    SendAuctionHello(unit);
}

// this void causes that auction window is opened
void WorldSession::SendAuctionHello(Unit* unit)
{
    // always return pointer
    AuctionHouseEntry const* ahEntry = AuctionHouseMgr::GetAuctionHouseEntry(unit);

    WorldPacket data(MSG_AUCTION_HELLO, 12);
    data << unit->GetObjectGuid();
    data << uint32(ahEntry->houseId);
    SendPacket(&data);
}

// call this method when player bids, creates, or deletes auction
void WorldSession::SendAuctionCommandResult(AuctionEntry *auc, AuctionAction Action, AuctionError ErrorCode, InventoryResult invError)
{
    WorldPacket data(SMSG_AUCTION_COMMAND_RESULT, 16);
    data << uint32(auc ? auc->Id : 0);
    data << uint32(Action);
    data << uint32(ErrorCode);

    switch (ErrorCode)
    {
        case AUCTION_OK:
            if (Action == AUCTION_BID_PLACED)
                data << uint32(auc->GetAuctionOutBid());    // new AuctionOutBid?
            break;
        case AUCTION_ERR_INVENTORY:
            data << uint32(invError);
            break;
        case AUCTION_ERR_HIGHER_BID:
            data << ObjectGuid(HIGHGUID_PLAYER, auc->bidder); // new bidder guid
            data << uint32(auc->bid);                       // new bid
            data << uint32(auc->GetAuctionOutBid());        // new AuctionOutBid?
            break;
        default:
            break;
    }

    SendPacket(&data);
}

// this function sends notification, if bidder is online
void WorldSession::SendAuctionBidderNotification(AuctionEntry* auction, bool won)
{
    WorldPacket data(SMSG_AUCTION_BIDDER_NOTIFICATION, (8 * 4));
    data << uint32(auction->GetHouseId());
    data << uint32(auction->Id);
    data << ObjectGuid(HIGHGUID_PLAYER, auction->bidder);

    // if 0, client shows ERR_AUCTION_WON_S, else ERR_AUCTION_OUTBID_S
    data << uint32(won ? 0 : auction->bid);
    data << uint32(auction->GetAuctionOutBid());            // AuctionOutBid?
    data << uint32(auction->itemTemplate);

    Item *item = sAuctionMgr.GetAItem(auction->itemGuidLow);
    uint32 randomId = item ? item->GetItemRandomPropertyId() : 0;

    data << uint32(randomId);                               // random property (value > 0) or suffix (value < 0)

    SendPacket(&data);
}

// this void causes on client to display: "Your auction sold"
void WorldSession::SendAuctionOwnerNotification(AuctionEntry* auction, bool sold)
{
    WorldPacket data(SMSG_AUCTION_OWNER_NOTIFICATION, (7 * 4));
    data << uint32(auction->Id);
    data << uint32(auction->bid);                           // if 0, client shows ERR_AUCTION_EXPIRED_S, else ERR_AUCTION_SOLD_S (works only when guid==0)
    data << uint32(auction->GetAuctionOutBid());            // AuctionOutBid?

    ObjectGuid guid = ObjectGuid();
    if (!sold)                                               // not sold yet
        guid = ObjectGuid(HIGHGUID_PLAYER, auction->bidder);// bidder==0 and !sold for expired auctions, so it will show error message properly

    // if guid!=0, client updates auctions with new bid, outbid and bidderGuid, else it shows error messages as described above
    data << guid;                                           // bidder guid
    data << uint32(auction->itemTemplate);                  // item entry

    Item *item = sAuctionMgr.GetAItem(auction->itemGuidLow);
    uint32 randomId = item ? item->GetItemRandomPropertyId() : 0;

    data << uint32(randomId);                               // random property (value > 0) or suffix (value < 0)
    SendPacket(&data);
}

// shows ERR_AUCTION_REMOVED_S
void WorldSession::SendAuctionRemovedNotification(AuctionEntry* auction)
{
    WorldPacket data(SMSG_AUCTION_REMOVED_NOTIFICATION, (3 * 4));
    data << uint32(auction->Id);
    data << uint32(auction->itemTemplate);

    Item *item = sAuctionMgr.GetAItem(auction->itemGuidLow);
    uint32 randomId = item ? item->GetItemRandomPropertyId() : 0;

    data << uint32(randomId);                               // random property (value > 0) or suffix (value < 0)

    SendPacket(&data);
}

// this function sends mail to old bidder
void WorldSession::SendAuctionOutbiddedMail(AuctionEntry *auction)
{
    ObjectGuid oldBidder_guid = ObjectGuid(HIGHGUID_PLAYER, auction->bidder);
    Player *oldBidder = sObjectMgr.GetPlayer(oldBidder_guid);

    uint32 oldBidder_accId = 0;
    if (!oldBidder)
        oldBidder_accId = sObjectMgr.GetPlayerAccountIdByGUID(oldBidder_guid);

    // old bidder exist
    if (oldBidder || oldBidder_accId)
    {
        std::ostringstream msgAuctionOutbiddedSubject;
        msgAuctionOutbiddedSubject << auction->itemTemplate << ":0:" << AUCTION_OUTBIDDED;

        if (oldBidder)
            oldBidder->GetSession()->SendAuctionBidderNotification(auction, false);

        MailDraft(msgAuctionOutbiddedSubject.str())
        .SetMoney(auction->bid)
        .SendMailTo(MailReceiver(oldBidder, oldBidder_guid), auction, MAIL_CHECK_MASK_COPIED);
    }
}

// this function sends mail, when auction is cancelled to old bidder
void WorldSession::SendAuctionCancelledToBidderMail(AuctionEntry* auction)
{
    ObjectGuid bidder_guid = ObjectGuid(HIGHGUID_PLAYER, auction->bidder);
    Player *bidder = sObjectMgr.GetPlayer(bidder_guid);

    uint32 bidder_accId = 0;
    if (!bidder)
        bidder_accId = sObjectMgr.GetPlayerAccountIdByGUID(bidder_guid);

    // bidder exist
    if (bidder || bidder_accId)
    {
        std::ostringstream msgAuctionCancelledSubject;
        msgAuctionCancelledSubject << auction->itemTemplate << ":0:" << AUCTION_CANCELLED_TO_BIDDER;

        if (bidder)
            bidder->GetSession()->SendAuctionRemovedNotification(auction);

        MailDraft(msgAuctionCancelledSubject.str())
        .SetMoney(auction->bid)
        .SendMailTo(MailReceiver(bidder, bidder_guid), auction, MAIL_CHECK_MASK_COPIED);
    }
}

AuctionHouseEntry const* WorldSession::GetCheckedAuctionHouseForAuctioneer(ObjectGuid guid)
{
    Unit* auctioneer = NULL;

    // GM case
    if (guid == GetPlayer()->GetObjectGuid())
    {
        // command case will return only if player have real access to command
        // using special access modes (1,-1) done at mode set in command, so not need recheck
        if (GetPlayer()->GetAuctionAccessMode() == 0 && !ChatHandler(GetPlayer()).FindCommand("auction"))
        {
            DEBUG_LOG("%s attempt open auction in cheating way.", guid.GetString().c_str());
            return NULL;
        }

        auctioneer = GetPlayer();
    }
    // auctioneer case
    else
    {
        auctioneer = GetPlayer()->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_AUCTIONEER);
        if (!auctioneer)
        {
            DEBUG_LOG("Auctioneeer %s accessed in cheating way.", guid.GetString().c_str());
            return NULL;
        }
    }

    // always return pointer
    return AuctionHouseMgr::GetAuctionHouseEntry(auctioneer);
}

// this void creates new auction and adds auction to some auctionhouse
void WorldSession::HandleAuctionSellItem(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: HandleAuctionSellItem");

    ObjectGuid auctioneerGuid;
    ObjectGuid itemGuid;
    uint32 etime, bid, buyout;

    recv_data >> auctioneerGuid;
    recv_data >> itemGuid;
    recv_data >> bid;
    recv_data >> buyout;
    recv_data >> etime;

    if (!bid || !etime)
        return;                                             // check for cheaters

    // Client limit
    if (bid > 2000000000 || buyout > 2000000000)
    {
        ProcessAnticheatAction("GoldDupe", "Putting too high auction price", CHEAT_ACTION_LOG);
        return;
    }
    if (buyout && bid > buyout)
    {
        ProcessAnticheatAction("GoldDupe", "bid > buyout", CHEAT_ACTION_LOG);
        return;
    }

    if (!sWorld.getConfig(CONFIG_BOOL_GM_ALLOW_TRADES) && GetSecurity() > SEC_PLAYER)
        return;

    Player *pl = GetPlayer();

    AuctionHouseEntry const* auctionHouseEntry = GetCheckedAuctionHouseForAuctioneer(auctioneerGuid);
    if (!auctionHouseEntry)
        return;

    // always return pointer
    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(auctionHouseEntry);

    uint32 limit = sWorld.getConfig(CONFIG_UINT32_ACCOUNT_CONCURRENT_AUCTION_LIMIT);
    if (!!limit && auctionHouse->GetAccountAuctionCount(GetAccountId()) >= limit)
    {
        ChatHandler(this).SendSysMessage("You have reached the limit of active auctions on your account.");
        SendAuctionCommandResult(NULL, AUCTION_STARTED, AUCTION_ERR_DATABASE);
        return;
    }

    // client send time in minutes, convert to common used sec time
    etime *= MINUTE;

    // client understand only 3 auction time
    switch (etime)
    {
        case 1*MIN_AUCTION_TIME:
            break;
        case 4*MIN_AUCTION_TIME:
            break;
        case 12*MIN_AUCTION_TIME:
            break;
        default:
            return;
    }

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    if (!itemGuid)
        return;

    Item *it = pl->GetItemByGuid(itemGuid);

    // do not allow to sell already auctioned items
    if (sAuctionMgr.GetAItem(itemGuid.GetCounter()))
    {
        sLog.outError("AuctionError, %s is sending %s, but item is already in another auction", pl->GetGuidStr().c_str(), itemGuid.GetString().c_str());
        SendAuctionCommandResult(NULL, AUCTION_STARTED, AUCTION_ERR_INVENTORY, EQUIP_ERR_ITEM_NOT_FOUND);
        return;
    }

    // prevent sending bag with items (cheat: can be placed in bag after adding equipped empty bag to auction)
    if (!it)
    {
        SendAuctionCommandResult(NULL, AUCTION_STARTED, AUCTION_ERR_INVENTORY, EQUIP_ERR_ITEM_NOT_FOUND);
        return;
    }

    if (!it->CanBeTraded())
    {
        SendAuctionCommandResult(NULL, AUCTION_STARTED, AUCTION_ERR_INVENTORY, EQUIP_ERR_ITEM_NOT_FOUND);
        return;
    }

    if ((it->GetProto()->Flags & ITEM_FLAG_CONJURED) || it->GetUInt32Value(ITEM_FIELD_DURATION))
    {
        SendAuctionCommandResult(NULL, AUCTION_STARTED, AUCTION_ERR_INVENTORY, EQUIP_ERR_ITEM_NOT_FOUND);
        return;
    }

    // check money for deposit
    uint32 deposit = AuctionHouseMgr::GetAuctionDeposit(auctionHouseEntry, etime, it);

    if (pl->GetMoney() < deposit)
    {
        SendAuctionCommandResult(NULL, AUCTION_STARTED, AUCTION_ERR_NOT_ENOUGH_MONEY);
        return;
    }

    if (GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
    {
        sLog.outCommand(GetAccountId(), "GM %s (Account: %u) create auction: %s (Entry: %u Count: %u)",
                        GetPlayerName(), GetAccountId(), it->GetProto()->Name1, it->GetEntry(), it->GetCount());
    }

    pl->ModifyMoney(-int32(deposit));

    uint32 auction_time = uint32(etime * sWorld.getConfig(CONFIG_FLOAT_RATE_AUCTION_TIME));

    AuctionEntry *AH = new AuctionEntry;
    AH->Id = sObjectMgr.GenerateAuctionID();
    AH->itemGuidLow = it->GetObjectGuid().GetCounter();
    AH->itemTemplate = it->GetEntry();
    AH->owner = pl->GetGUIDLow();
    AH->ownerAccount = pl->GetSession()->GetAccountId();
    AH->startbid = bid;
    AH->bidder = 0;
    AH->bid = 0;
    AH->buyout = buyout;
    AH->lockedIpAddress = GetRemoteAddress().c_str();
    AH->depositTime = time(NULL);
    AH->expireTime = time(NULL) + auction_time;
    AH->deposit = deposit;
    AH->auctionHouseEntry = auctionHouseEntry;

    sLog.out(LOG_MONEY_TRADES, "[AuctionHouse]: Player %s listing %s (%u) at auctioneer %s. Initial bid: %u, buyout: %u, duration: %u, auctionhouse: %u",
                pl->GetShortDescription().c_str(), it->GetGuidStr().c_str(), it->GetEntry(), 
                auctioneerGuid.GetString().c_str(), bid, buyout, auction_time, AH->GetHouseId());

    // Log this transaction
    PlayerTransactionData data;
    data.type = "PlaceAuction";
    data.parts[0].lowGuid = AH->owner;
    data.parts[0].itemsEntries[0] = AH->itemTemplate;
    data.parts[0].itemsCount[0] = it->GetCount();
    data.parts[0].itemsGuid[0] = it->GetGUIDLow();
    data.parts[0].money = bid;
    data.parts[1].lowGuid = auctioneerGuid.GetCounter();
    data.parts[1].money = buyout;
    sWorld.LogTransaction(data);

    auctionHouse->AddAuction(AH);

    sAuctionMgr.AddAItem(it);
    pl->MoveItemFromInventory(it->GetBagSlot(), it->GetSlot(), true);

    CharacterDatabase.BeginTransaction(pl->GetGUIDLow());
    it->DeleteFromInventoryDB();
    it->SaveToDB();                                         // recursive and not have transaction guard into self, not in inventiory and can be save standalone
    AH->SaveToDB();
    pl->SaveInventoryAndGoldToDB();
    CharacterDatabase.CommitTransaction();

    SendAuctionCommandResult(AH, AUCTION_STARTED, AUCTION_OK);
}

// this function is called when client bids or buys out auction
void WorldSession::HandleAuctionPlaceBid(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: HandleAuctionPlaceBid");

    ObjectGuid auctioneerGuid;
    uint32 auctionId;
    uint32 price;
    recv_data >> auctioneerGuid;
    recv_data >> auctionId >> price;

    if (!sWorld.getConfig(CONFIG_BOOL_GM_ALLOW_TRADES) && GetSecurity() > SEC_PLAYER)
        return;

    if (!auctionId || !price)
        return;                                             // check for cheaters

    AuctionHouseEntry const* auctionHouseEntry = GetCheckedAuctionHouseForAuctioneer(auctioneerGuid);
    if (!auctionHouseEntry)
        return;

    // always return pointer
    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(auctionHouseEntry);

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    AuctionEntry *auction = auctionHouse->GetAuction(auctionId);
    Player *pl = GetPlayer();

    if (!auction)
    {
        // item not found; auction may have expired, or been bought out
        SendAuctionCommandResult(nullptr, AUCTION_BID_PLACED, AUCTION_ERR_ITEM_NOT_FOUND);

        return;
    }

    if (auction->owner == pl->GetGUIDLow())
    {
        // you cannot bid your own auction:
        SendAuctionCommandResult(nullptr, AUCTION_BID_PLACED, AUCTION_ERR_BID_OWN);
        return;
    }

    ObjectGuid ownerGuid = ObjectGuid(HIGHGUID_PLAYER, auction->owner);

    // impossible have online own another character (use this for speedup check in case online owner)
    Player* auction_owner = sObjectMgr.GetPlayer(ownerGuid);
    if (!auction_owner && sObjectMgr.GetPlayerAccountIdByGUID(ownerGuid) == pl->GetSession()->GetAccountId())
    {
        // you cannot bid your another character auction:
        SendAuctionCommandResult(NULL, AUCTION_BID_PLACED, AUCTION_ERR_BID_OWN);
        return;
    }

    // cheating
    if (price < auction->startbid)
        return;

    // cheating or client lags
    if (price <= auction->bid)
    {
        // client test but possible in result lags
        SendAuctionCommandResult(auction, AUCTION_BID_PLACED, AUCTION_ERR_HIGHER_BID);
        return;
    }

    // price too low for next bid if not buyout
    if ((price < auction->buyout || auction->buyout == 0) &&
            price < auction->bid + auction->GetAuctionOutBid())
    {
        // client test but possible in result lags
        SendAuctionCommandResult(auction, AUCTION_BID_PLACED, AUCTION_ERR_BID_INCREMENT);
        return;
    }

    if (price > pl->GetMoney())
    {
        // you don't have enough money!, client tests!
        // SendAuctionCommandResult(auction->auctionId, AUCTION_ERR_INVENTORY, EQUIP_ERR_NOT_ENOUGH_MONEY);
        return;
    }

    if ((price < auction->buyout) || (auction->buyout == 0))// bid
    {
        if (pl->GetGUIDLow() == auction->bidder)
            pl->LogModifyMoney(-int32(price - auction->bid), "AuctionBid", ObjectGuid(HIGHGUID_PLAYER, auction->owner), auction->itemTemplate);
        else
        {
            pl->LogModifyMoney(-int32(price), "AuctionBid", ObjectGuid(HIGHGUID_PLAYER, auction->owner), auction->itemTemplate);
            if (auction->bidder)                            // return money to old bidder if present
                SendAuctionOutbiddedMail(auction);
        }

        auction->bidder = pl->GetGUIDLow();
        auction->bid = price;

        if (auction_owner)
            auction_owner->GetSession()->SendAuctionOwnerNotification(auction, false);

        // after this update we should save player's money ...
        CharacterDatabase.PExecute("UPDATE auction SET buyguid = '%u', lastbid = '%u' WHERE id = '%u'", auction->bidder, auction->bid, auction->Id);

        SendAuctionCommandResult(auction, AUCTION_BID_PLACED, AUCTION_OK);
    }
    else                                                    // buyout
    {
        if (pl->GetGUIDLow() == auction->bidder)
            pl->LogModifyMoney(-int32(auction->buyout - auction->bid), "AuctionBuyout", ObjectGuid(HIGHGUID_PLAYER, auction->owner), auction->itemTemplate);
        else
        {
            pl->LogModifyMoney(-int32(auction->buyout), "AuctionBuyout", ObjectGuid(HIGHGUID_PLAYER, auction->owner), auction->itemTemplate);
            if (auction->bidder)                            // return money to old bidder if present
                SendAuctionOutbiddedMail(auction);
        }

        auction->bidder = pl->GetGUIDLow();
        auction->bid = auction->buyout;

        PlayerTransactionData data;
        data.type = "Buyout";
        data.parts[0].lowGuid = auction->owner;
        data.parts[0].itemsEntries[0] = auction->itemTemplate;
        Item* item = sAuctionMgr.GetAItem(auction->itemGuidLow);
        data.parts[0].itemsCount[0] = item ? item->GetCount() : 0;
        data.parts[0].itemsGuid[0] = auction->itemGuidLow;
        data.parts[1].lowGuid = auction->bidder;
        data.parts[1].money = auction->bid;
        sWorld.LogTransaction(data);

        sAuctionMgr.SendAuctionSuccessfulMail(auction);
        sAuctionMgr.SendAuctionWonMail(auction);

        SendAuctionCommandResult(auction, AUCTION_BID_PLACED, AUCTION_OK);

        sAuctionMgr.RemoveAItem(auction->itemGuidLow);
        auctionHouse->RemoveAuction(auction);
        auction->DeleteFromDB();

        delete auction;
    }
    CharacterDatabase.BeginTransaction(pl->GetGUIDLow());
    pl->SaveInventoryAndGoldToDB();
    CharacterDatabase.CommitTransaction();
}

// this void is called when auction_owner cancels his auction
void WorldSession::HandleAuctionRemoveItem(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: HandleAuctionRemoveItem");

    ObjectGuid auctioneerGuid;
    uint32 auctionId;
    recv_data >> auctioneerGuid;
    recv_data >> auctionId;
    //DEBUG_LOG("Cancel AUCTION AuctionID: %u", auctionId);

    AuctionHouseEntry const* auctionHouseEntry = GetCheckedAuctionHouseForAuctioneer(auctioneerGuid);
    if (!auctionHouseEntry)
        return;

    // always return pointer
    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(auctionHouseEntry);

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    AuctionEntry *auction = auctionHouse->GetAuction(auctionId);
    Player *pl = GetPlayer();

    if (auction && auction->owner == pl->GetGUIDLow())
    {
        Item *pItem = sAuctionMgr.GetAItem(auction->itemGuidLow);
        if (pItem)
        {
            if (auction->bidder > 0)                        // If we have a bidder, we have to send him the money he paid
            {
                uint32 auctionCut = auction->GetAuctionCut();
                if (pl->GetMoney() < auctionCut)            // player doesn't have enough money, maybe message needed
                    return;

                SendAuctionCancelledToBidderMail(auction);
                pl->ModifyMoney(-int32(auctionCut));
            }
            // Return the item by mail
            std::ostringstream msgAuctionCanceledOwner;
            msgAuctionCanceledOwner << auction->itemTemplate << ":0:" << AUCTION_CANCELED;

            // item will deleted or added to received mail list
            MailDraft(msgAuctionCanceledOwner.str())
            .AddItem(pItem)
            .SendMailTo(pl, auction, MAIL_CHECK_MASK_COPIED);
        }
        else
        {
            sLog.outError("Auction id: %u has nonexistent item (item guid : %u)!!!", auction->Id, auction->itemGuidLow);
            SendAuctionCommandResult(NULL, AUCTION_REMOVED, AUCTION_ERR_INVENTORY, EQUIP_ERR_ITEM_NOT_FOUND);
            return;
        }
    }
    else
    {
        SendAuctionCommandResult(NULL, AUCTION_REMOVED, AUCTION_ERR_DATABASE);
        // this code isn't possible ... maybe there should be ASSERT
        sLog.outError("CHEATER : %u, he tried to cancel auction (id: %u) of another player, or auction is NULL", pl->GetGUIDLow(), auctionId);
        return;
    }

    // inform player, that auction is removed
    SendAuctionCommandResult(auction, AUCTION_REMOVED, AUCTION_OK);
    // Now remove the auction
    CharacterDatabase.BeginTransaction(pl->GetGUIDLow());
    auction->DeleteFromDB();
    pl->SaveInventoryAndGoldToDB();
    CharacterDatabase.CommitTransaction();
    sAuctionMgr.RemoveAItem(auction->itemGuidLow);
    auctionHouse->RemoveAuction(auction);
    delete auction;
}


class AuctionHouseClientQueryTask : public AsyncTask, public AuctionHouseClientQuery
{
public:
    AuctionHouseClientQueryTask(AuctionClientQueryType type) : _queryType(type)
    {
    }
    void run()
    {
        if (WorldSession* sess = sWorld.FindSession(accountId))
        {
            sess->SetReceivedAHListRequest(false);

            Player *player = sess->GetPlayer();
            if (!player || !player->IsInWorld())
                return;

            WorldPacket data(0, 12);
            uint32 count = 0;
            uint32 totalcount = 0;
            size_t countPos = data.wpos();
            data << uint32(count);
            switch (_queryType)
            {
                case AUCTION_QUERY_LIST:
                {
                    data.SetOpcode(SMSG_AUCTION_LIST_RESULT);
                    auctionHouse->BuildListAuctionItems(data, player, *this, count, totalcount);

                    break;
                }
                case AUCTION_QUERY_LIST_BIDDER:
                {
                    data.SetOpcode(SMSG_AUCTION_BIDDER_LIST_RESULT);
                    for (std::vector<uint32>::iterator itr = outbiddedAuctionIds.begin(); itr != outbiddedAuctionIds.end(); ++itr)
                    {
                        --outbiddedCount;
                        AuctionEntry *auction = auctionHouse->GetAuction(*itr);
                        if (auction)
                        {
                            ++totalcount;

                            if (count < 50 && totalcount > listfrom)
                                if (auction->BuildAuctionInfo(data))
                                    ++count;
                        }
                    }

                    auctionHouse->BuildListBidderItems(data, player, listfrom, count, totalcount);
                    break;
                }
                case AUCTION_QUERY_LIST_OWNER:
                {
                    data.SetOpcode(SMSG_AUCTION_OWNER_LIST_RESULT);
                    auctionHouse->BuildListOwnerItems(data, player, listfrom, count, totalcount);
                    break;
                }
                default:
                {
                    sLog.outError("[AsyncAuctionQuery] Invalid query type %u", _queryType);
                    return;
                }
            }

            data.put<uint32>(countPos, count);
            data << uint32(totalcount);

            sess->SendPacket(&data);
        }
    }
    AuctionHouseObject* auctionHouse;
    AuctionClientQueryType _queryType;
};

// called when player lists his bids
void WorldSession::HandleAuctionListBidderItems(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: HandleAuctionListBidderItems");
    if (ReceivedAHListRequest())
        return;

    ObjectGuid auctioneerGuid;                              // NPC guid
    uint32 listfrom;                                        // page of auctions
    uint32 outbiddedCount;                                  // count of outbidded auctions

    recv_data >> auctioneerGuid;
    recv_data >> listfrom;                                  // where to start listing from
    recv_data >> outbiddedCount;
    if (recv_data.size() != (16 + outbiddedCount * 4))
    {
        sLog.outError("Client sent bad opcode!!! with count: %u and size : %u (must be: %u)", outbiddedCount, (uint32)recv_data.size(), (16 + outbiddedCount * 4));
        outbiddedCount = 0;
    }

    AuctionHouseEntry const* auctionHouseEntry = GetCheckedAuctionHouseForAuctioneer(auctioneerGuid);
    if (!auctionHouseEntry)
        return;

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    AuctionHouseClientQueryTask* task = new AuctionHouseClientQueryTask(AUCTION_QUERY_LIST_BIDDER);
    task->auctionHouse = sAuctionMgr.GetAuctionsMap(auctionHouseEntry);
    uint32 outbiddedAuctionId;
    for (int i = outbiddedCount; i > 0; --i)
    {
        recv_data >> outbiddedAuctionId;
        task->outbiddedAuctionIds.push_back(outbiddedAuctionId);
    }

    task->accountId = GetAccountId();
    task->listfrom = listfrom;
    task->outbiddedCount = outbiddedCount;
    SetReceivedAHListRequest(true);
    sWorld.AddAsyncTask(task);
}

// this void sends player info about his auctions
void WorldSession::HandleAuctionListOwnerItems(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: HandleAuctionListOwnerItems");
    if (ReceivedAHListRequest())
        return;

    ObjectGuid auctioneerGuid;
    uint32 listfrom;

    recv_data >> auctioneerGuid;
    recv_data >> listfrom;

    AuctionHouseEntry const* auctionHouseEntry = GetCheckedAuctionHouseForAuctioneer(auctioneerGuid);
    if (!auctionHouseEntry)
        return;

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    AuctionHouseClientQueryTask* task = new AuctionHouseClientQueryTask(AUCTION_QUERY_LIST_OWNER);
    task->auctionHouse = sAuctionMgr.GetAuctionsMap(auctionHouseEntry);;
    task->accountId = GetAccountId();
    task->listfrom = listfrom;
    SetReceivedAHListRequest(true);
    sWorld.AddAsyncTask(task);
}

void WorldSession::HandleAuctionListItems(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: HandleAuctionListItems");
    if (ReceivedAHListRequest())
        return;

    ObjectGuid auctioneerGuid;
    std::string searchedname;
    AuctionHouseClientQueryTask* task = new AuctionHouseClientQueryTask(AUCTION_QUERY_LIST);
    task->accountId = GetAccountId();

    recv_data >> auctioneerGuid;
    recv_data >> task->listfrom;                                  // start, used for page control listing by 50 elements
    recv_data >> searchedname;

    recv_data >> task->levelmin >> task->levelmax;
    recv_data >> task->auctionSlotID >> task->auctionMainCategory >> task->auctionSubCategory >> task->quality;
    recv_data >> task->usable;

    AuctionHouseEntry const* auctionHouseEntry = GetCheckedAuctionHouseForAuctioneer(auctioneerGuid);
    if (!auctionHouseEntry)
    {
        delete task;
        return;
    }

    // always return pointer
    task->auctionHouse = sAuctionMgr.GetAuctionsMap(auctionHouseEntry);

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    //DEBUG_LOG("Auctionhouse search %s list from: %u, searchedname: %s, levelmin: %u, levelmax: %u, auctionSlotID: %u, auctionMainCategory: %u, auctionSubCategory: %u, quality: %u, usable: %u",
    //  auctioneerGuid.GetString().c_str(), listfrom, searchedname.c_str(), levelmin, levelmax, auctionSlotID, auctionMainCategory, auctionSubCategory, quality, usable);

    // converting string that we try to find to lower case
    if (!Utf8toWStr(searchedname, task->wsearchedname))
    {
        delete task;
        return;
    }

    wstrToLower(task->wsearchedname);
    SetReceivedAHListRequest(true);
    sWorld.AddAsyncTask(task);
}
