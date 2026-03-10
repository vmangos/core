#pragma once

#include "Common.h"

// Trinity-shaped area adapter used by ModPlayerBots compatibility code.
struct AreaTableEntry
{
    uint32 ID;
    uint32 map_id;
    uint32 zone;
    uint32 explore_flag;
    uint32 flags;
    uint32 area_level;
    uint32 area_team;
    char* area_name[9];
    uint32 string;

    // Minimal interface for compatibility
    uint32 GetID() const { return ID; }
    uint32 GetMapId() const { return map_id; }
    uint32 GetZoneId() const { return zone; }
    const char* GetAreaName() const { return area_name && area_name[0] ? area_name[0] : ""; }
};
