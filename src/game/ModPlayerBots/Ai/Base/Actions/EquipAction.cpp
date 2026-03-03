/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "EquipAction.h"

#include "Event.h"

bool EquipAction::Execute(Event /*event*/) { return false; }
void EquipAction::EquipItems(ItemIds /*ids*/) {}
ItemIds EquipAction::SelectInventoryItemsToEquip() { return {}; }
void EquipAction::EquipItem(FindItemVisitor* /*visitor*/) {}
uint8 EquipAction::GetSmallestBagSlot() { return INVENTORY_SLOT_BAG_0; }
void EquipAction::EquipItem(Item* /*item*/) {}

bool EquipUpgradesTriggeredAction::Execute(Event /*event*/) { return false; }
bool EquipUpgradeAction::Execute(Event /*event*/) { return false; }
