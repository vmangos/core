#pragma once

#ifndef PB_COMPAT_VANILLA
#error ArenaTeamMgr is a WotLK feature and is not available in Vanilla
#endif

// Stub for ArenaTeamMgr (WotLK feature)
// Arena teams were introduced in TBC/WotLK, not in Vanilla
namespace ArenaTeamMgr
{
    inline void* GetArenaTeamById(uint32 /*teamId*/) { return nullptr; }
    inline void* GetArenaTeamByGuid(uint64 /*guid*/) { return nullptr; }
}

class ArenaTeam
{
public:
    ArenaTeam() = default;
    uint32 GetId() const { return 0; }
    uint8 GetSlot() const { return 0; }
    std::string GetName() const { return ""; }
    uint32 GetCaptain() const { return 0; }
    uint8 GetRating() const { return 0; }
};
