#include "GameGraveyard.h"
#include "ObjectMgr.h"
#include "Objects/Player.h"

GraveyardStruct const* GameGraveyard::ConvertToGraveyard(WorldSafeLocsEntry const* entry)
{
    if (!entry)
        return nullptr;

    static GraveyardStruct graveyard;
    graveyard.Map = entry->map_id;
    graveyard.x = entry->x;
    graveyard.y = entry->y;
    graveyard.z = entry->z;
    return &graveyard;
}

GraveyardStruct const* GameGraveyard::GetClosestGraveyard(Player const* player, TeamId teamId)
{
    if (!player)
        return nullptr;

    // Convert TeamId to Team
    Team team = (teamId == TEAM_ALLIANCE) ? ALLIANCE : HORDE;

    WorldSafeLocsEntry const* entry = sObjectMgr.GetClosestGraveYard(
        player->GetPositionX(),
        player->GetPositionY(),
        player->GetPositionZ(),
        player->GetMapId(),
        team);

    return ConvertToGraveyard(entry);
}

GraveyardStruct const* GameGraveyard::GetClosestGraveyard(uint32 mapId, float x, float y, float z,
                                                            TeamId teamId, uint32 areaId, uint32 zoneId,
                                                            bool isDeathKnight)
{
    // Convert TeamId to Team
    Team team = (teamId == TEAM_ALLIANCE) ? ALLIANCE : HORDE;

    // Try area-specific first
    WorldSafeLocsEntry const* entry = sObjectMgr.GetClosestGraveYardForArea(
        areaId, x, y, z, mapId, team);

    if (!entry)
    {
        // Fall back to zone-specific
        entry = sObjectMgr.GetClosestGraveYardForArea(
            zoneId, x, y, z, mapId, team);
    }

    if (!entry)
    {
        // Final fallback to position-based
        entry = sObjectMgr.GetClosestGraveYard(x, y, z, mapId, team);
    }

    return ConvertToGraveyard(entry);
}

// Singleton instance
static GameGraveyard sGraveyardInstance;
GameGraveyard* sGraveyard = &sGraveyardInstance;
