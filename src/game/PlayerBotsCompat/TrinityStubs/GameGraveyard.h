#pragma once

#ifndef PB_GAME_GRAVEYARD_H
#define PB_GAME_GRAVEYARD_H

#include "Common.h"
#include "DBCStructure.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"

// Forward declarations
class Player;

// Compatibility shim for Trinity's GameGraveyard.h
// Maps to vMaNGOS ObjectMgr::GetClosestGraveYard/GetClosestGraveYardForArea

struct GraveyardStruct
{
    uint32 Map;
    float x;
    float y;
    float z;
};

class GameGraveyard
{
public:
    // Get closest graveyard for a player
    GraveyardStruct const* GetClosestGraveyard(Player const* player, TeamId teamId);

    // Get closest graveyard for a position (with area/zone info)
    GraveyardStruct const* GetClosestGraveyard(uint32 mapId, float x, float y, float z,
                                                TeamId teamId, uint32 areaId, uint32 zoneId,
                                                bool isDeathKnight = false);

private:
    // Convert WorldSafeLocsEntry to GraveyardStruct
    GraveyardStruct const* ConvertToGraveyard(WorldSafeLocsEntry const* entry);
};

// Global singleton instance (defined in GameGraveyard.cpp)
extern GameGraveyard* sGraveyard;

#endif // PB_GAME_GRAVEYARD_H
