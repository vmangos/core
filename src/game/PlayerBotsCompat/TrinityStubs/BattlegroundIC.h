#pragma once

#ifndef PB_COMPAT_VANILLA
#error BattlegroundIC.h is a WotLK feature and is not available in Vanilla
#endif

#include "ObjectGuid.h"

// Stub for Isle of Conquest battleground (WotLK feature)
// Isle of Conquest was introduced in WotLK, not in Vanilla

#ifndef BATTLEGROUND_IC
#define BATTLEGROUND_IC BattleGroundTypeId(6)
#endif

#ifndef BATTLEGROUND_SA
#define BATTLEGROUND_SA BattleGroundTypeId(7)
#endif

// Mock class for compile compatibility
class BattlegroundIC
{
public:
    BattlegroundIC() = default;
};
