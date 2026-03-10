/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "EquipAction.h"

#include "Event.h"
#include <utility>

#include "ItemCountValue.h"
#include "ItemUsageValue.h"
#include "ItemVisitors.h"
#include "Playerbots.h"
#include "StatsWeightCalculator.h"
#include "ItemPackets.h"

bool EquipAction::Execute(Event event)
{
    std::string const text = event.getParam();
    ItemIds ids = chat->parseItems(text);
    EquipItems(ids);
    return true;
}

void EquipAction::EquipItems(ItemIds ids)
{
    for (ItemIds::iterator i = ids.begin(); i != ids.end(); ++i)
    {
        FindItemByIdVisitor visitor(*i);
        EquipItem(&visitor);
    }
}

uint8 EquipAction::GetSmallestBagSlot()
{
    int8 curBag = 0;
    uint32 curSlots = 0;
    for (uint8 bag = INVENTORY_SLOT_BAG_START; bag < INVENTORY_SLOT_BAG_END; ++bag)
    {
        Bag const* const pBag = static_cast<Bag const*>(bot->GetItemByPos(INVENTORY_SLOT_BAG_0, bag));
        if (pBag)
        {
            if (curBag > 0 && curSlots < pBag->GetBagSize())
                continue;

            curBag = bag;
            curSlots = pBag->GetBagSize();
        }
        else
        {
            return bag;
        }
    }

    return curBag;
}

void EquipAction::EquipItem(FindItemVisitor* visitor)
{
    IterateItems(visitor);
    std::vector<Item*> items = visitor->GetResult();
    if (!items.empty())
        EquipItem(*items.begin());
}

void EquipAction::EquipItem(Item* item)
{
    uint8 bagIndex = item->GetBagSlot();
    uint8 slot = item->GetSlot();
    ItemTemplate const* itemProto = item->GetTemplate();
    uint32 itemId = itemProto->ItemId;
    uint8 invType = itemProto->InventoryType;

    if (invType == INVTYPE_AMMO)
    {
        bot->SetAmmo(itemId);
        std::ostringstream out;
        out << "equipping " << chat->FormatItem(itemProto);
        botAI->TellMaster(out);
        return;
    }

    bool equippedBag = false;
    if (itemProto->Class == ITEM_CLASS_CONTAINER)
    {
        uint8 newBagSlot = GetSmallestBagSlot();
        if (newBagSlot > 0)
        {
            uint16 src = ((bagIndex << 8) | slot);
            uint16 dst = ((INVENTORY_SLOT_BAG_0 << 8) | newBagSlot);
            bot->SwapItem(src, dst);
            equippedBag = true;
        }
    }

    if (!equippedBag)
    {
        if (invType == INVTYPE_RANGED || invType == INVTYPE_THROWN || invType == INVTYPE_RANGEDRIGHT)
        {
            WorldPacket packet(CMSG_AUTOEQUIP_ITEM_SLOT, 2);
            ObjectGuid itemGuid = item->GetGUID();
            packet << itemGuid << uint8(EQUIPMENT_SLOT_RANGED);

            WorldPackets::Item::AutoEquipItemSlot nicePacket(std::move(packet));
            nicePacket.Read();
            bot->GetSession()->HandleAutoEquipItemSlotOpcode(nicePacket);

            std::ostringstream out;
            out << "Equipping " << chat->FormatItem(itemProto) << " in ranged slot";
            botAI->TellMaster(out);
            return;
        }

        uint8 dstSlot = botAI->FindEquipSlot(itemProto, NULL_SLOT, true);
        bool isWeapon = itemProto->Class == ITEM_CLASS_WEAPON;
        bool canDualWield = bot->CanDualWield();
        bool isTwoHander = invType == INVTYPE_2HWEAPON;
        Item* currentMHItem = bot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
        bool have2HWeaponEquipped =
            currentMHItem && currentMHItem->GetTemplate()->InventoryType == INVTYPE_2HWEAPON;

        if (isWeapon && canDualWield)
        {
            Item* mainHandItem = bot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
            Item* offHandItem = bot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);

            StatsWeightCalculator calculator(bot);
            calculator.SetItemSetBonus(false);
            calculator.SetOverflowPenalty(false);

            int32 newItemRandomProp = item->GetItemRandomPropertyId();
            float newItemScore = calculator.CalculateItem(itemId, newItemRandomProp);
            float mainHandScore =
                mainHandItem ? calculator.CalculateItem(mainHandItem->GetTemplate()->ItemId, mainHandItem->GetItemRandomPropertyId()) : 0.0f;
            float offHandScore =
                offHandItem ? calculator.CalculateItem(offHandItem->GetTemplate()->ItemId, offHandItem->GetItemRandomPropertyId()) : 0.0f;

            bool canGoMain = invType == INVTYPE_WEAPON || invType == INVTYPE_WEAPONMAINHAND || isTwoHander;
            bool canGoOff = invType == INVTYPE_WEAPON || invType == INVTYPE_WEAPONOFFHAND;

            bool mainHandCanGoOff = false;
            if (mainHandItem)
            {
                ItemTemplate const* mhProto = mainHandItem->GetTemplate();
                mainHandCanGoOff =
                    mhProto->InventoryType == INVTYPE_WEAPON || mhProto->InventoryType == INVTYPE_WEAPONOFFHAND;
            }

            bool betterThanMH = newItemScore > mainHandScore;
            bool mhConditionOK = invType != INVTYPE_2HWEAPON || !have2HWeaponEquipped;

            if (canGoMain && betterThanMH && mhConditionOK)
            {
                WorldPacket eqPacket(CMSG_AUTOEQUIP_ITEM_SLOT, 2);
                ObjectGuid newItemGuid = item->GetGUID();
                eqPacket << newItemGuid << uint8(EQUIPMENT_SLOT_MAINHAND);
                WorldPackets::Item::AutoEquipItemSlot nicePacket(std::move(eqPacket));
                nicePacket.Read();
                bot->GetSession()->HandleAutoEquipItemSlotOpcode(nicePacket);

                if (mainHandItem && mainHandCanGoOff && (!offHandItem || mainHandScore > offHandScore))
                {
                    ItemTemplate const* oldMHProto = mainHandItem->GetTemplate();

                    WorldPacket offhandPacket(CMSG_AUTOEQUIP_ITEM_SLOT, 2);
                    ObjectGuid oldMHGuid = mainHandItem->GetGUID();
                    offhandPacket << oldMHGuid << uint8(EQUIPMENT_SLOT_OFFHAND);
                    WorldPackets::Item::AutoEquipItemSlot movePacket(std::move(offhandPacket));
                    movePacket.Read();
                    bot->GetSession()->HandleAutoEquipItemSlotOpcode(movePacket);

                    std::ostringstream moveMsg;
                    moveMsg << "Main hand upgrade found. Moving " << chat->FormatItem(oldMHProto) << " to offhand";
                    botAI->TellMaster(moveMsg);
                }

                std::ostringstream out;
                out << "Equipping " << chat->FormatItem(itemProto) << " in main hand";
                botAI->TellMaster(out);
                return;
            }
            else if (canGoOff && newItemScore > offHandScore)
            {
                WorldPacket eqPacket(CMSG_AUTOEQUIP_ITEM_SLOT, 2);
                ObjectGuid newItemGuid = item->GetGUID();
                eqPacket << newItemGuid << uint8(EQUIPMENT_SLOT_OFFHAND);
                WorldPackets::Item::AutoEquipItemSlot nicePacket(std::move(eqPacket));
                nicePacket.Read();
                bot->GetSession()->HandleAutoEquipItemSlotOpcode(nicePacket);

                std::ostringstream out;
                out << "Equipping " << chat->FormatItem(itemProto) << " in offhand";
                botAI->TellMaster(out);
                return;
            }
            else if (isTwoHander)
            {
                return;
            }
        }

        if (dstSlot == EQUIPMENT_SLOT_FINGER1 ||
            dstSlot == EQUIPMENT_SLOT_TRINKET1 ||
            (dstSlot == EQUIPMENT_SLOT_MAINHAND && canDualWield &&
                invType != INVTYPE_2HWEAPON && !have2HWeaponEquipped))
        {
            Item* const equippedItems[2] = {
                bot->GetItemByPos(INVENTORY_SLOT_BAG_0, dstSlot),
                bot->GetItemByPos(INVENTORY_SLOT_BAG_0, dstSlot + 1)
            };

            if (equippedItems[0])
            {
                if (equippedItems[1])
                {
                    StatsWeightCalculator calc(bot);
                    calc.SetItemSetBonus(false);
                    calc.SetOverflowPenalty(false);

                    float newItemScore = calc.CalculateItem(itemId, item->GetItemRandomPropertyId());
                    float firstItemScore = calc.CalculateItem(
                        equippedItems[0]->GetTemplate()->ItemId, equippedItems[0]->GetItemRandomPropertyId());
                    float secondItemScore = calc.CalculateItem(
                        equippedItems[1]->GetTemplate()->ItemId, equippedItems[1]->GetItemRandomPropertyId());

                    bool betterThanFirst = newItemScore > firstItemScore;
                    bool betterThanSecond = newItemScore > secondItemScore;

                    if (!betterThanFirst && !betterThanSecond)
                        return;

                    if (betterThanFirst && betterThanSecond)
                    {
                        if (firstItemScore > secondItemScore)
                            dstSlot++;
                    }
                    else if (betterThanSecond)
                    {
                        dstSlot++;
                    }
                }
                else
                {
                    dstSlot++;
                }
            }
        }

        WorldPacket packet(CMSG_AUTOEQUIP_ITEM_SLOT, 2);
        ObjectGuid itemGuid = item->GetGUID();
        packet << itemGuid << dstSlot;
        WorldPackets::Item::AutoEquipItemSlot nicePacket(std::move(packet));
        nicePacket.Read();
        bot->GetSession()->HandleAutoEquipItemSlotOpcode(nicePacket);
    }

    std::ostringstream out;
    out << "Equipping " << chat->FormatItem(itemProto);
    botAI->TellMaster(out);
}

ItemIds EquipAction::SelectInventoryItemsToEquip()
{
    CollectItemsVisitor visitor;
    IterateItems(&visitor, ITERATE_ITEMS_IN_BAGS);

    ItemIds items;
    for (auto i = visitor.items.begin(); i != visitor.items.end(); ++i)
    {
        Item* item = *i;
        if (!item)
            continue;

        ItemTemplate const* itemTemplate = item->GetTemplate();
        if (!itemTemplate || itemTemplate->InventoryType == INVTYPE_NON_EQUIP)
            continue;

        int32 randomProperty = item->GetItemRandomPropertyId();
        uint32 itemId = itemTemplate->ItemId;
        std::string itemUsageParam = std::to_string(itemId);
        if (randomProperty != 0)
            itemUsageParam += "," + std::to_string(randomProperty);

        ItemUsage usage = AI_VALUE2(ItemUsage, "item upgrade", itemUsageParam);
        if (usage == ITEM_USAGE_EQUIP || usage == ITEM_USAGE_REPLACE || usage == ITEM_USAGE_BAD_EQUIP)
            items.insert(itemId);
    }

    return items;
}

bool EquipUpgradesPacketAction::Execute(Event event)
{
    if (!sPlayerbotAIConfig.autoEquipUpgradeLoot && !sRandomPlayerbotMgr.IsRandomBot(bot))
        return false;

    std::string const source = event.GetSource();
    if (source == "trade status")
    {
        WorldPacket p(event.getPacket());
        p.rpos(0);
        uint32 status;
        p >> status;

        if (status != TRADE_STATUS_TRADE_ACCEPT)
            return false;
    }
    else if (source == "item push result")
    {
        WorldPacket p(event.getPacket());
        p.rpos(0);
        ObjectGuid playerGuid;
        uint32 received, created, sendChatMessage, itemSlot, itemId;
        uint8 bagSlot;

        p >> playerGuid;
        p >> received;
        p >> created;
        p >> sendChatMessage;
        p >> bagSlot;
        p >> itemSlot;
        p >> itemId;

        ItemTemplate const* itemProto = sObjectMgr.GetItemTemplate(itemId);
        if (!itemProto || itemProto->InventoryType == INVTYPE_NON_EQUIP)
            return false;
    }

    ItemIds items = SelectInventoryItemsToEquip();
    EquipItems(items);
    return true;
}

bool EquipUpgradeAction::Execute(Event /*event*/)
{
    ItemIds items = SelectInventoryItemsToEquip();
    EquipItems(items);
    return true;
}
