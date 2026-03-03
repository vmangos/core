/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "FishingAction.h"

const uint32 FISHING_SPELL = 7620;
const uint32 FISHING_POLE = 6256;
const uint32 FISHING_BOBBER = 35591;

WorldPosition FindWaterRadial(Player* /*bot*/, float x, float y, float z, Map* map, uint32 /*phaseMask*/, float /*minDistance*/, float /*maxDistance*/, float /*increment*/, bool /*checkLOS*/, int /*numDirections*/)
{
    return WorldPosition(map ? map->GetId() : 0, x, y, z);
}

bool FishingAction::Execute(Event /*event*/) { return false; }
bool FishingAction::isUseful() { return false; }

bool EquipFishingPoleAction::Execute(Event /*event*/) { return false; }
bool EquipFishingPoleAction::isUseful() { return false; }

bool MoveNearWaterAction::Execute(Event /*event*/) { return false; }
bool MoveNearWaterAction::isUseful() { return false; }
bool MoveNearWaterAction::isPossible() { return false; }

bool UseBobberAction::Execute(Event /*event*/) { return false; }
bool UseBobberAction::isUseful() { return false; }

bool EndMasterFishingAction::Execute(Event /*event*/) { return false; }
bool EndMasterFishingAction::isUseful() { return false; }

bool RemoveBobberStrategyAction::Execute(Event /*event*/) { return false; }
