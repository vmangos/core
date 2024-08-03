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
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "Log.h"
#include "Opcodes.h"
#include "Player.h"
#include "Item.h"
#include "Spell.h"
#include "SocialMgr.h"
#include "Language.h"
#include "Map.h"

void WorldSession::SendTradeStatus(TradeStatus status)
{
    WorldPacket data;

    switch (status)
    {
        case TRADE_STATUS_BEGIN_TRADE:
            data.Initialize(SMSG_TRADE_STATUS, 4 + 8);
            data << uint32(status);
            data << uint64(0);
            break;
        case TRADE_STATUS_OPEN_WINDOW:
            data.Initialize(SMSG_TRADE_STATUS, 4 + 4);
            data << uint32(status);
            break;
        case TRADE_STATUS_CLOSE_WINDOW:
            data.Initialize(SMSG_TRADE_STATUS, 4 + 4 + 1 + 4);
            data << uint32(status);
            data << uint32(0);
            data << uint8(0);
            data << uint32(0);
            break;
        case TRADE_STATUS_ONLY_CONJURED:
            data.Initialize(SMSG_TRADE_STATUS, 4 + 1);
            data << uint32(status);
            data << uint8(0);
            break;
        default:
            data.Initialize(SMSG_TRADE_STATUS, 4);
            data << uint32(status);
            break;
    }

    SendPacket(&data);
}

void WorldSession::HandleIgnoreTradeOpcode(WorldPacket& /*recvPacket*/)
{
    _player->TradeCancel(true, TRADE_STATUS_IGNORE_YOU);
}

void WorldSession::HandleBusyTradeOpcode(WorldPacket& /*recvPacket*/)
{
    _player->TradeCancel(true, TRADE_STATUS_BUSY);
}

void WorldSession::SendUpdateTrade(bool trader_state /*= true*/)
{
    TradeData* view_trade = trader_state ? _player->GetTradeData()->GetTraderData() : _player->GetTradeData();

    WorldPacket data(SMSG_TRADE_STATUS_EXTENDED, (100));    // guess size
    data << uint8(trader_state ? 1 : 0);                    // send trader or own trade windows state (last need for proper show spell apply to non-trade slot)
    data << uint32(TRADE_SLOT_COUNT);                       // trade slots count/number?, = next field in most cases
    data << uint32(TRADE_SLOT_COUNT);                       // trade slots count/number?, = prev field in most cases
    data << uint32(view_trade->GetMoney());                 // trader gold
    data << uint32(view_trade->GetSpell());                 // spell casted on lowest slot item

    for (uint8 i = 0; i < TRADE_SLOT_COUNT; ++i)
    {
        data << uint8(i);                                   // trade slot number, if not specified, then end of packet

        if (Item* item = view_trade->GetItem(TradeSlots(i)))
        {
            data << uint32(item->GetProto()->ItemId);       // entry
            data << uint32(item->GetProto()->DisplayInfoID);// display id
            data << uint32(item->GetCount());               // stack count

            // wrapped: hide stats but show giftcreator name
            data << uint32(item->HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED) ? 1 : 0);
            data << item->GetGuidValue(ITEM_FIELD_GIFTCREATOR);

            data << uint32(item->GetEnchantmentId(PERM_ENCHANTMENT_SLOT));
            data << item->GetGuidValue(ITEM_FIELD_CREATOR);
            data << uint32(item->GetSpellCharges());        // charges
            data << uint32(item->GetItemSuffixFactor());    // SuffixFactor
            data << uint32(item->GetItemRandomPropertyId());// random properties id
            data << uint32(item->GetProto()->LockID);       // lock id
            // max durability
            data << uint32(item->GetUInt32Value(ITEM_FIELD_MAXDURABILITY));
            // durability
            data << uint32(item->GetUInt32Value(ITEM_FIELD_DURABILITY));
        }
        else
        {
            for (uint8 j = 0; j < 15; ++j)
                data << uint32(0);
        }
    }

    SendPacket(&data);
}

//==============================================================
// transfer the items to the players

void WorldSession::MoveItems(Item* myItems[], Item* hisItems[])
{
    Player* trader = _player->GetTrader();
    if (!trader)
        return;

    for (int i = 0; i < TRADE_SLOT_TRADED_COUNT; ++i)
    {
        ItemPosCountVec traderDst;
        ItemPosCountVec playerDst;
        bool traderCanTrade = (myItems[i] == nullptr || trader->CanStoreItem(NULL_BAG, NULL_SLOT, traderDst, myItems[i], false) == EQUIP_ERR_OK);
        bool playerCanTrade = (hisItems[i] == nullptr || _player->CanStoreItem(NULL_BAG, NULL_SLOT, playerDst, hisItems[i], false) == EQUIP_ERR_OK);
        if (traderCanTrade && playerCanTrade)
        {
            // Ok, if trade item exists and can be stored
            // If we trade in both directions we had to check, if the trade will work before we actually do it
            // A roll back is not possible after we stored it
            if (myItems[i])
            {
                // logging
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "partner storing: %s", myItems[i]->GetGuidStr().c_str());
                if (_player->GetSession()->GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
                {
                    sLog.Player(this, LOG_GM, LOG_LVL_BASIC,
                        "GM %s (Account: %u) trade: %s (Entry: %d Count: %u) to player: %s (Account: %u)",
                        _player->GetName(), _player->GetSession()->GetAccountId(),
                        myItems[i]->GetProto()->Name1, myItems[i]->GetEntry(), myItems[i]->GetCount(),
                        trader->GetName(), trader->GetSession()->GetAccountId());
                }

                // store
                trader->MoveItemToInventory(traderDst, myItems[i], true, true);

                // If saving is disabled for player who receives the item, it must be deleted from db, or it enables duping.
                if (trader->IsSavingDisabled())
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Item guid %u traded to character %u with disabled saving. Deleting from DB.", myItems[i]->GetGUIDLow(), trader->GetGUIDLow());
                    myItems[i]->DeleteFromInventoryDB();
                    myItems[i]->DeleteAllFromDB();
                }
            }

            if (hisItems[i])
            {
                // logging
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "player storing: %s", hisItems[i]->GetGuidStr().c_str());
                if (trader->GetSession()->GetSecurity() > SEC_PLAYER && sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
                {
                    sLog.Player(this, LOG_GM, LOG_LVL_BASIC,
                        "GM %s (Account: %u) trade: %s (Entry: %d Count: %u) to player: %s (Account: %u)",
                        trader->GetName(), trader->GetSession()->GetAccountId(),
                        hisItems[i]->GetProto()->Name1, hisItems[i]->GetEntry(), hisItems[i]->GetCount(),
                        _player->GetName(), _player->GetSession()->GetAccountId());
                }

                // store
                _player->MoveItemToInventory(playerDst, hisItems[i], true, true);

                // If saving is disabled for player who receives the item, it must be deleted from db, or it enables duping.
                if (_player->IsSavingDisabled())
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Item guid %u traded to character %u with disabled saving. Deleting from DB.", hisItems[i]->GetGUIDLow(), _player->GetGUIDLow());
                    hisItems[i]->DeleteFromInventoryDB();
                    hisItems[i]->DeleteAllFromDB();
                }
            }
        }
        else
        {
            // in case of fatal error log error message
            // return the already removed items to the original owner
            if (myItems[i])
            {
                if (!traderCanTrade)
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "trader can't store item: %s", myItems[i]->GetGuidStr().c_str());
                if (_player->CanStoreItem(NULL_BAG, NULL_SLOT, playerDst, myItems[i], false) == EQUIP_ERR_OK)
                    _player->MoveItemToInventory(playerDst, myItems[i], true, true);
                else
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "player can't take item back: %s", myItems[i]->GetGuidStr().c_str());
            }
            // return the already removed items to the original owner
            if (hisItems[i])
            {
                if (!playerCanTrade)
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "player can't store item: %s", hisItems[i]->GetGuidStr().c_str());
                if (trader->CanStoreItem(NULL_BAG, NULL_SLOT, traderDst, hisItems[i], false) == EQUIP_ERR_OK)
                    trader->MoveItemToInventory(traderDst, hisItems[i], true, true);
                else
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "trader can't take item back: %s", hisItems[i]->GetGuidStr().c_str());
            }
        }
    }
}

//==============================================================
static void setAcceptTradeMode(TradeData* myTrade, TradeData* hisTrade, Item **myItems, Item **hisItems)
{
    myTrade->SetInAcceptProcess(true);
    hisTrade->SetInAcceptProcess(true);

    // store items in local list and set 'in-trade' flag
    for (int i = 0; i < TRADE_SLOT_TRADED_COUNT; ++i)
    {
        if (Item* item = myTrade->GetItem(TradeSlots(i)))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "player trade %s bag: %u slot: %u", item->GetGuidStr().c_str(), item->GetBagSlot(), item->GetSlot());
            //Can return nullptr
            myItems[i] = item;
            myItems[i]->SetInTrade();
        }

        if (Item* item = hisTrade->GetItem(TradeSlots(i)))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "partner trade %s bag: %u slot: %u", item->GetGuidStr().c_str(), item->GetBagSlot(), item->GetSlot());
            hisItems[i] = item;
            hisItems[i]->SetInTrade();
        }
    }
}

static void clearAcceptTradeMode(TradeData* myTrade, TradeData* hisTrade)
{
    myTrade->SetInAcceptProcess(false);
    hisTrade->SetInAcceptProcess(false);
}

static void clearAcceptTradeMode(Item **myItems, Item **hisItems)
{
    // clear 'in-trade' flag
    for (int i = 0; i < TRADE_SLOT_TRADED_COUNT; ++i)
    {
        if (myItems[i])
            myItems[i]->SetInTrade(false);
        if (hisItems[i])
            hisItems[i]->SetInTrade(false);
    }
}

void WorldSession::HandleAcceptTradeOpcode(WorldPacket& recvPacket)
{
    recvPacket.read_skip<uint32>();

    TradeData* my_trade = _player->m_trade;
    if (!my_trade)
        return;

    double lastModificationTimeInMS = difftime(time(nullptr), my_trade->GetLastModificationTime()) * 1000;
    if (lastModificationTimeInMS < my_trade->GetScamPreventionDelay()) // if we are not outside the delay period since last modification
    {
        SendTradeStatus(TRADE_STATUS_BACK_TO_TRADE);
        return;
    }

    my_trade->SetLastModificationTime(time(nullptr)); // Update it

    Player* trader = my_trade->GetTrader();

    TradeData* his_trade = trader->m_trade;
    if (!his_trade)
        return;

    Item *myItems[TRADE_SLOT_TRADED_COUNT]  = { nullptr, nullptr, nullptr, nullptr, nullptr, nullptr };
    Item *hisItems[TRADE_SLOT_TRADED_COUNT] = { nullptr, nullptr, nullptr, nullptr, nullptr, nullptr };

    // set before checks to properly undo at problems (it already set in to client)
    my_trade->SetAccepted(true);

    if (_player->GetDistance3dToCenter(trader) > TRADE_DISTANCE)
    {
        SendTradeStatus(TRADE_STATUS_TARGET_TO_FAR);
        return;
    }

    // not accept case incorrect money amount
    if (my_trade->GetMoney() > _player->GetMoney())
    {
        SendNotification(LANG_NOT_ENOUGH_GOLD);
        my_trade->SetAccepted(false, true);
        return;
    }

    // not accept case incorrect money amount
    if (his_trade->GetMoney() > trader->GetMoney())
    {
        trader->GetSession()->SendNotification(LANG_NOT_ENOUGH_GOLD);
        his_trade->SetAccepted(false, true);
        return;
    }
    if (!sWorld.getConfig(CONFIG_BOOL_GM_ALLOW_TRADES) &&
            (trader->GetSession()->GetSecurity() > SEC_PLAYER ||
            GetSecurity() > SEC_PLAYER))
    {
        SendTradeStatus(TRADE_STATUS_TRADE_CANCELED);
        return;
    }

    // not accept if some items now can't be trade (cheating)
    for (int i = 0; i < TRADE_SLOT_TRADED_COUNT; ++i)
    {
        if (Item* item = my_trade->GetItem(TradeSlots(i)))
        {
            if (!item->CanBeTraded())
            {
                SendTradeStatus(TRADE_STATUS_TRADE_CANCELED);
                return;
            }
        }

        if (Item* item  = his_trade->GetItem(TradeSlots(i)))
        {
            if (!item->CanBeTraded())
            {
                SendTradeStatus(TRADE_STATUS_TRADE_CANCELED);
                return;
            }
        }
    }

    if (his_trade->IsAccepted())
    {
        PlayerTransactionData log;
        log.type = "Trade";
        my_trade->FillTransactionLog(log.parts[0]);
        his_trade->FillTransactionLog(log.parts[1]);
        sWorld.LogTransaction(log);

        setAcceptTradeMode(my_trade, his_trade, myItems, hisItems);

        Spell* my_spell = nullptr;
        SpellCastTargets my_targets;

        Spell* his_spell = nullptr;
        SpellCastTargets his_targets;

        // not accept if spell can't be casted now (cheating)
        if (uint32 my_spell_id = my_trade->GetSpell())
        {
            SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(my_spell_id);
            Item* castItem = my_trade->GetSpellCastItem();

            if (!spellEntry || !his_trade->GetItem(TRADE_SLOT_NONTRADED) ||
                    (my_trade->HasSpellCastItem() && !castItem))
            {
                clearAcceptTradeMode(my_trade, his_trade);
                clearAcceptTradeMode(myItems, hisItems);

                my_trade->SetSpell(0);
                return;
            }

            my_spell = new Spell(_player, spellEntry, true);
            my_spell->SetCastItem(castItem);
            my_targets.setTradeItemTarget(_player);
            my_spell->m_targets = my_targets;

            SpellCastResult res = my_spell->CheckCast(true);
            if (res != SPELL_CAST_OK)
            {
                my_spell->SendCastResult(res);

                clearAcceptTradeMode(my_trade, his_trade);
                clearAcceptTradeMode(myItems, hisItems);

                my_spell->Delete();
                my_trade->SetSpell(0);
                return;
            }
        }

        // not accept if spell can't be casted now (cheating)
        if (uint32 his_spell_id = his_trade->GetSpell())
        {
            SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(his_spell_id);
            Item* castItem = his_trade->GetSpellCastItem();

            if (!spellEntry || !my_trade->GetItem(TRADE_SLOT_NONTRADED) ||
                    (his_trade->HasSpellCastItem() && !castItem))
            {
                if (my_spell)
                    my_spell->Delete();
                his_trade->SetSpell(0);

                clearAcceptTradeMode(my_trade, his_trade);
                clearAcceptTradeMode(myItems, hisItems);
                return;
            }

            his_spell = new Spell(trader, spellEntry, true);
            his_spell->SetCastItem(castItem);
            his_targets.setTradeItemTarget(trader);
            his_spell->m_targets = his_targets;

            SpellCastResult res = his_spell->CheckCast(true);
            if (res != SPELL_CAST_OK)
            {
                his_spell->SendCastResult(res);

                clearAcceptTradeMode(my_trade, his_trade);
                clearAcceptTradeMode(myItems, hisItems);

                if (my_spell)
                    my_spell->Delete();
                his_spell->Delete();

                his_trade->SetSpell(0);
                return;
            }
        }

        // inform partner client
        trader->GetSession()->SendTradeStatus(TRADE_STATUS_TRADE_ACCEPT);

        // test if item will fit in each inventory
        bool hisCanCompleteTrade = (trader->CanStoreItems(myItems, TRADE_SLOT_TRADED_COUNT) == EQUIP_ERR_OK);
        bool myCanCompleteTrade = (_player->CanStoreItems(hisItems, TRADE_SLOT_TRADED_COUNT) == EQUIP_ERR_OK);

        clearAcceptTradeMode(myItems, hisItems);

        // in case of missing space report error
        if (!myCanCompleteTrade)
        {
            clearAcceptTradeMode(my_trade, his_trade);

            SendNotification(LANG_NOT_FREE_TRADE_SLOTS);
            trader->GetSession()->SendNotification(LANG_NOT_PARTNER_FREE_TRADE_SLOTS);
            my_trade->SetAccepted(false);
            his_trade->SetAccepted(false);
            his_trade->SetLastModificationTime(time(nullptr));
            if (my_spell)
                my_spell->Delete();
            if (his_spell)
                his_spell->Delete();
            return;
        }
        else if (!hisCanCompleteTrade)
        {
            clearAcceptTradeMode(my_trade, his_trade);

            SendNotification(LANG_NOT_PARTNER_FREE_TRADE_SLOTS);
            trader->GetSession()->SendNotification(LANG_NOT_FREE_TRADE_SLOTS);
            my_trade->SetAccepted(false);
            his_trade->SetAccepted(false);
            his_trade->SetLastModificationTime(time(nullptr));
            if (my_spell)
                my_spell->Delete();
            if (his_spell)
                his_spell->Delete();
            return;
        }

        // execute trade: 1. remove
        for (int i = 0; i < TRADE_SLOT_TRADED_COUNT; ++i)
        {
            if (Item* item = myItems[i])
            {
                if (!item->GetGuidValue(ITEM_FIELD_GIFTCREATOR).IsEmpty())
                    item->SetGuidValue(ITEM_FIELD_GIFTCREATOR, _player->GetObjectGuid());
                _player->MoveItemFromInventory(item->GetBagSlot(), item->GetSlot(), true);
            }
            if (Item* item = hisItems[i])
            {
                if (!item->GetGuidValue(ITEM_FIELD_GIFTCREATOR).IsEmpty())
                    item->SetGuidValue(ITEM_FIELD_GIFTCREATOR, trader->GetObjectGuid());
                trader->MoveItemFromInventory(item->GetBagSlot(), item->GetSlot(), true);
            }
        }

        // execute trade: 2. store
        MoveItems(myItems, hisItems);

        // logging money
        if (sWorld.getConfig(CONFIG_BOOL_GM_LOG_TRADE))
        {
            if (_player->GetSession()->GetSecurity() > SEC_PLAYER && my_trade->GetMoney() > 0)
            {
                sLog.Player(this, LOG_GM, LOG_LVL_BASIC,
                    "GM %s (Account: %u) give money (Amount: %u) to player: %s (Account: %u)",
                    _player->GetName(), _player->GetSession()->GetAccountId(),
                    my_trade->GetMoney(),
                    trader->GetName(), trader->GetSession()->GetAccountId());
            }
            if (trader->GetSession()->GetSecurity() > SEC_PLAYER && his_trade->GetMoney() > 0)
            {
                sLog.Player(this, LOG_GM, LOG_LVL_BASIC,
                    "GM %s (Account: %u) give money (Amount: %u) to player: %s (Account: %u)",
                    trader->GetName(), trader->GetSession()->GetAccountId(),
                    his_trade->GetMoney(),
                    _player->GetName(), _player->GetSession()->GetAccountId());
            }
        }

        // update money
        _player->ModifyMoney(-int32(my_trade->GetMoney()));
        _player->LogModifyMoney(his_trade->GetMoney(), "Trade", trader->GetObjectGuid());
        trader->ModifyMoney(-int32(his_trade->GetMoney()));
        trader->LogModifyMoney(my_trade->GetMoney(), "Trade", _player->GetObjectGuid());

        if (my_spell)
            my_spell->prepare(std::move(my_targets));

        if (his_spell)
            his_spell->prepare(std::move(his_targets));

        // cleanup
        clearAcceptTradeMode(my_trade, his_trade);
        delete _player->m_trade;
        _player->m_trade = nullptr;
        delete trader->m_trade;
        trader->m_trade = nullptr;

        // desynchronized with the other saves here, let players save gold per their own serialized transaction
        _player->SaveInventoryAndGoldToDB();
        trader->SaveInventoryAndGoldToDB();

        trader->GetSession()->SendTradeStatus(TRADE_STATUS_TRADE_COMPLETE);
        SendTradeStatus(TRADE_STATUS_TRADE_COMPLETE);
    }
    else
        trader->GetSession()->SendTradeStatus(TRADE_STATUS_TRADE_ACCEPT);
}

void WorldSession::HandleUnacceptTradeOpcode(WorldPacket& /*recvPacket*/)
{
    TradeData* my_trade = _player->m_trade;
    if (!my_trade)
        return;

    my_trade->SetAccepted(false, true);
}

void WorldSession::HandleBeginTradeOpcode(WorldPacket& /*recvPacket*/)
{
    TradeData* my_trade = _player->m_trade;
    if (!my_trade)
        return;

    my_trade->GetTrader()->GetSession()->SendTradeStatus(TRADE_STATUS_OPEN_WINDOW);
    SendTradeStatus(TRADE_STATUS_OPEN_WINDOW);
}

void WorldSession::SendCancelTrade(TradeStatus status)
{
    if (m_playerRecentlyLogout)
        return;

    SendTradeStatus(status);
}

void WorldSession::HandleCancelTradeOpcode(WorldPacket& /*recvPacket*/)
{
    // sent also after LOGOUT COMPLETE
    if (_player)                                            // needed because STATUS_LOGGEDIN_OR_RECENTLY_LOGGOUT
        _player->TradeCancel(true);
}

void WorldSession::HandleInitiateTradeOpcode(WorldPacket& recvPacket)
{
    ObjectGuid otherGuid;
    recvPacket >> otherGuid;

    if (GetPlayer()->m_trade)
        return;

    if (!GetPlayer()->IsAlive())
    {
        SendTradeStatus(TRADE_STATUS_YOU_DEAD);
        return;
    }

    if (GetPlayer()->HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
    {
        SendTradeStatus(TRADE_STATUS_YOU_STUNNED);
        return;
    }

    if (IsLogingOut())
    {
        SendTradeStatus(TRADE_STATUS_YOU_LOGOUT);
        return;
    }

    if (GetPlayer()->IsTaxiFlying() || !GetPlayer()->FindMap())
    {
        SendTradeStatus(TRADE_STATUS_TARGET_TO_FAR);
        return;
    }

    Player* pOther = GetPlayer()->GetMap()->GetPlayer(otherGuid);

    if (!pOther)
    {
        SendTradeStatus(TRADE_STATUS_NO_TARGET);
        return;
    }

    if (pOther == GetPlayer() || pOther->m_trade)
    {
        SendTradeStatus(TRADE_STATUS_BUSY);
        return;
    }

    if (!pOther->IsAlive())
    {
        SendTradeStatus(TRADE_STATUS_TARGET_DEAD);
        return;
    }

    if (pOther->IsTaxiFlying())
    {
        SendTradeStatus(TRADE_STATUS_TARGET_TO_FAR);
        return;
    }

    if (pOther->HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
    {
        SendTradeStatus(TRADE_STATUS_TARGET_STUNNED);
        return;
    }

    if (pOther->GetSession()->IsLogingOut())
    {
        SendTradeStatus(TRADE_STATUS_TARGET_LOGOUT);
        return;
    }

    if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_TRADE) && pOther->GetTeam() != _player->GetTeam())
    {
        SendTradeStatus(TRADE_STATUS_WRONG_FACTION);
        return;
    }

    if (_player->GetDistance3dToCenter(pOther) > TRADE_DISTANCE)
    {
        SendTradeStatus(TRADE_STATUS_TARGET_TO_FAR);
        return;
    }

    if (HasTrialRestrictions() || pOther->GetSession()->HasTrialRestrictions())
    {
        SendTradeStatus(TRADE_STATUS_TRIAL_ACCOUNT);
        return;
    }

    // OK start trade
    _player->m_trade = new TradeData(_player, pOther);
    pOther->m_trade = new TradeData(pOther, _player);
    
    // Set the scam prevention, a delay  of 200 ms should suffice
    _player->m_trade->SetScamPreventionDelay(200);
    pOther->m_trade->SetScamPreventionDelay(200);

    WorldPacket data(SMSG_TRADE_STATUS, 12);
    data << uint32(TRADE_STATUS_BEGIN_TRADE);
    data << ObjectGuid(_player->GetObjectGuid());
    pOther->GetSession()->SendPacket(&data);
}

void WorldSession::HandleSetTradeGoldOpcode(WorldPacket& recvPacket)
{
    uint32 gold;
    recvPacket >> gold;

    TradeData* my_trade = _player->GetTradeData();
    if (!my_trade || !my_trade->GetTrader())
        return;
    TradeData* his_trade = my_trade->GetTrader()->m_trade;
    if (!his_trade)
        return;
    if (gold > _player->GetMoney())
        return;

    // gold can be incorrect, but this is checked at trade finished.
    his_trade->SetAccepted(false);
    his_trade->SetLastModificationTime(time(nullptr));
    my_trade->SetLastModificationTime(time(nullptr));
    my_trade->SetMoney(gold);
}

void WorldSession::HandleSetTradeItemOpcode(WorldPacket& recvPacket)
{
    // send update
    uint8 tradeSlot;
    uint8 bag;
    uint8 slot;

    recvPacket >> tradeSlot;
    recvPacket >> bag;
    recvPacket >> slot;

    TradeData* my_trade = _player->GetTradeData();
    if (!my_trade || !my_trade->GetTrader())
        return;
    TradeData* his_trade = my_trade->GetTrader()->m_trade;
    if (!his_trade)
        return;

    // invalid slot number
    if (tradeSlot >= TRADE_SLOT_COUNT)
    {
        SendTradeStatus(TRADE_STATUS_TRADE_CANCELED);
        return;
    }

    // check cheating, can't fail with correct client operations
    Item* item = _player->GetItemByPos(bag, slot);
    if (!item || (tradeSlot != TRADE_SLOT_NONTRADED && !item->CanBeTraded()))
    {
        SendTradeStatus(TRADE_STATUS_TRADE_CANCELED);
        return;
    }

    // prevent trading item from bank slot
    if (_player->IsBankPos(bag, slot)) 
    {
        SendTradeStatus(TRADE_STATUS_TRADE_CANCELED);
        return;
    }

    // prevent place single item into many trade slots using cheating and client bugs
    if (my_trade->HasItem(item->GetObjectGuid()))
    {
        // cheating attempt
        SendTradeStatus(TRADE_STATUS_TRADE_CANCELED);
        return;
    }

    his_trade->SetAccepted(false);
    his_trade->SetLastModificationTime(time(nullptr));
    my_trade->SetLastModificationTime(time(nullptr));
    my_trade->SetItem(TradeSlots(tradeSlot), item);
}

void WorldSession::HandleClearTradeItemOpcode(WorldPacket& recvPacket)
{
    uint8 tradeSlot;
    recvPacket >> tradeSlot;

    TradeData* my_trade = _player->GetTradeData();
    if (!my_trade || !my_trade->GetTrader())
        return;
    TradeData* his_trade = my_trade->GetTrader()->m_trade;
    if (!his_trade)
        return;

    // invalid slot number
    if (tradeSlot >= TRADE_SLOT_COUNT)
        return;

    his_trade->SetAccepted(false);
    his_trade->SetLastModificationTime(time(nullptr));
    my_trade->SetLastModificationTime(time(nullptr));
    my_trade->SetItem(TradeSlots(tradeSlot), nullptr);
}
