/*
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

#ifndef _TRADE_DATA_H
#define _TRADE_DATA_H

#include "Common.h"
#include "ObjectGuid.h"

class Player;
class Item;

enum TradeSlots
{
    TRADE_SLOT_COUNT            = 7,
    TRADE_SLOT_TRADED_COUNT     = 6,
    TRADE_SLOT_NONTRADED        = 6,
    TRADE_SLOT_INVALID          = -1
};

struct TransactionPart;

class TradeData
{
public:                                                 // constructors
    TradeData(Player* player, Player* trader) :
        m_player(player), m_trader(trader), m_accepted(false), m_acceptProccess(false),
        m_money(0), m_spell(0), m_lastModificationTime(0), m_scamPreventionDelay(0) {}

public:                                                 // access functions

    Player* GetTrader() const { return m_trader; }
    TradeData* GetTraderData() const;

    Item* GetItem(TradeSlots slot) const;
    bool HasItem(ObjectGuid item_guid) const;

    uint32 GetSpell() const { return m_spell; }
    Item*  GetSpellCastItem() const;
    bool HasSpellCastItem() const { return !m_spellCastItem.IsEmpty(); }

    uint32 GetMoney() const { return m_money; }

    bool IsAccepted() const { return m_accepted; }
    bool IsInAcceptProcess() const { return m_acceptProccess; }

    TradeSlots GetTradeSlotForItem(ObjectGuid itemGuid) const;

    void FillTransactionLog(TransactionPart& log) const;

    time_t GetLastModificationTime() const { return m_lastModificationTime; }
    void SetLastModificationTime(time_t t) { m_lastModificationTime = t; }

    time_t GetScamPreventionDelay() const { return m_scamPreventionDelay; }
    void SetScamPreventionDelay(time_t t) { m_scamPreventionDelay = t; }
public:                                                 // access functions

    void SetItem(TradeSlots slot, Item* item);
    void SetSpell(uint32 spellId, Item* castItem = nullptr);
    void SetMoney(uint32 money);

    void SetAccepted(bool state, bool crosssend = false);

    // must be called only from accept handler helper functions
    void SetInAcceptProcess(bool state) { m_acceptProccess = state; }

private:                                                // internal functions

    void Update(bool for_trader = true);

private:                                                // fields

    Player*    m_player;                                // Player who own of this TradeData
    Player*    m_trader;                                // Player who trade with m_player

    bool       m_accepted;                              // m_player press accept for trade list
    bool       m_acceptProccess;                        // one from player/trader press accept and this processed

    uint32     m_money;                                 // m_player place money to trade

    uint32     m_spell;                                 // m_player apply spell to non-traded slot item
    ObjectGuid m_spellCastItem;                         // applied spell casted by item use

    ObjectGuid m_items[TRADE_SLOT_COUNT];               // traded itmes from m_player side including non-traded slot

    time_t     m_lastModificationTime;                  // to prevent scam (change gold before the other validates)
    time_t     m_scamPreventionDelay;                    // to prevent scam, set a delay in milliseconds (CANNOT be less than or equal to 10ms) before accepting trade.
};

#endif
