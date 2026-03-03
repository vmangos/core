/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "LootRollAction.h"

#include "Event.h"

bool LootRollAction::Execute(Event /*event*/) { return false; }

RollVote LootRollAction::CalculateRollVote(ItemTemplate const* /*proto*/) { return RollVote(0); }

bool CanBotUseToken(ItemTemplate const* /*proto*/, Player* /*bot*/) { return false; }

bool RollUniqueCheck(ItemTemplate const* /*proto*/, Player* /*bot*/) { return false; }

bool MasterLootRollAction::isUseful() { return false; }

bool MasterLootRollAction::Execute(Event /*event*/) { return false; }

bool RollAction::Execute(Event /*event*/) { return false; }
