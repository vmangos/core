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

#include "TradeData.h"
#include "TransactionLog.h"
#include "Player.h"

TradeData* TradeData::GetTraderData() const
{
    return m_trader->GetTradeData();
}

Item* TradeData::GetItem(TradeSlots slot) const
{
    return m_items[slot] ? m_player->GetItemByGuid(m_items[slot]) : nullptr;
}

bool TradeData::HasItem(ObjectGuid item_guid) const
{
    for (const auto& item : m_items)
        if (item == item_guid)
            return true;
    return false;
}

TradeSlots TradeData::GetTradeSlotForItem(ObjectGuid itemGuid) const
{
    for (uint8 i = 0; i < TRADE_SLOT_COUNT; ++i)
        if (m_items[i] == itemGuid)
            return TradeSlots(i);

    return TRADE_SLOT_INVALID;
}

void TradeData::FillTransactionLog(TransactionPart& log) const
{
    log.money = m_money;
    log.lowGuid = m_player->GetGUIDLow();
    log.spell = m_spell;
    for (int i = 0; i < log.MAX_TRANSACTION_ITEMS && i < TRADE_SLOT_COUNT; ++i)
    {
        if (Item* item = GetItem(TradeSlots(i)))
        {
            log.itemsCount[i] = item->GetCount();
            log.itemsEntries[i] = item->GetEntry();
            log.itemsGuid[i] = item->GetGUIDLow();
        }
    }
}

Item* TradeData::GetSpellCastItem() const
{
    return m_spellCastItem ?  m_player->GetItemByGuid(m_spellCastItem) : nullptr;
}

void TradeData::SetItem(TradeSlots slot, Item* item)
{
    ObjectGuid itemGuid = item ? item->GetObjectGuid() : ObjectGuid();

    if (m_items[slot] == itemGuid)
        return;

    m_items[slot] = itemGuid;

    SetAccepted(false);
    GetTraderData()->SetAccepted(false);

    Update();

    // need remove possible trader spell applied to changed item
    if (slot == TRADE_SLOT_NONTRADED)
        GetTraderData()->SetSpell(0);

    // need remove possible player spell applied (possible move reagent)
    SetSpell(0);
}

void TradeData::SetSpell(uint32 spellId, Item* castItem /*= nullptr*/)
{
    ObjectGuid itemGuid = castItem ? castItem->GetObjectGuid() : ObjectGuid();

    if (m_spell == spellId && m_spellCastItem == itemGuid)
        return;

    m_spell = spellId;
    m_spellCastItem = itemGuid;

    SetAccepted(false);
    GetTraderData()->SetAccepted(false);

    Update(true);                                           // send spell info to item owner
    Update(false);                                          // send spell info to caster self
}

void TradeData::SetMoney(uint32 money)
{
    if (m_money == money)
        return;

    m_money = money;

    SetAccepted(false);
    GetTraderData()->SetAccepted(false);

    Update();
}

void TradeData::Update(bool for_trader /*= true*/)
{
    if (for_trader)
        m_trader->GetSession()->SendUpdateTrade(true);      // player state for trader
    else
        m_player->GetSession()->SendUpdateTrade(false);     // player state for player
}

void TradeData::SetAccepted(bool state, bool crosssend /*= false*/)
{
    m_accepted = state;

    if (!state)
    {
        if (crosssend)
            m_trader->GetSession()->SendTradeStatus(TRADE_STATUS_BACK_TO_TRADE);
        else
            m_player->GetSession()->SendTradeStatus(TRADE_STATUS_BACK_TO_TRADE);
    }
}
