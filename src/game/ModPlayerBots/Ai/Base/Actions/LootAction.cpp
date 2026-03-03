/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "LootAction.h"

#include "Event.h"

bool LootAction::Execute(Event /*event*/) { return false; }

bool LootAction::isUseful() { return false; }

bool OpenLootAction::Execute(Event /*event*/) { return false; }

bool OpenLootAction::DoLoot(LootObject& /*lootObject*/) { return false; }

uint32 OpenLootAction::GetOpeningSpell(LootObject& /*lootObject*/) { return 0; }

uint32 OpenLootAction::GetOpeningSpell(LootObject& /*lootObject*/, GameObject* /*go*/) { return 0; }

bool OpenLootAction::CanOpenLock(LootObject& /*lootObject*/, SpellInfo const* /*spellInfo*/, GameObject* /*go*/)
{
    return false;
}

bool OpenLootAction::CanOpenLock(uint32 /*skillId*/, uint32 /*reqSkillValue*/) { return false; }

bool StoreLootAction::Execute(Event /*event*/) { return false; }

bool StoreLootAction::IsLootAllowed(uint32 /*itemid*/, PlayerbotAI* /*botAI*/) { return false; }

bool ReleaseLootAction::Execute(Event /*event*/) { return false; }
