#pragma once

#ifndef PB_COMPAT_VANILLA
#error BattlegroundEY.h is a WotLK feature and is not available in Vanilla
#endif

#include "ObjectGuid.h"

// Stub for Eye of the Storm battleground (WotLK feature)
// Eye of the Storm was introduced in TBC, not in Vanilla

#ifndef BATTLEGROUND_EY
#define BATTLEGROUND_EY BattleGroundTypeId(4)
#endif

#ifndef BATTLEGROUND_RB
#define BATTLEGROUND_RB BattleGroundTypeId(5)
#endif

// Mock class for compile compatibility
class BattlegroundEY
{
public:
    BattlegroundEY() = default;
    
    ObjectGuid GetFlagPickerGUID() const { return ObjectGuid(); }
};
