#include "FlightMasterCache.h"

#include "GridSearchers.h"

void FlightMasterCache::AddHordeFlightMaster(uint32 entry, WorldPosition pos)
{
    hordeFlightMasterCache[entry] = pos;
}

void FlightMasterCache::AddAllianceFlightMaster(uint32 entry, WorldPosition pos)
{
    allianceFlightMasterCache[entry] = pos;
}

Creature* FlightMasterCache::GetNearestFlightMaster(Player* bot)
{
    std::map<uint32, WorldPosition>& flightMasterCache =
        (bot->GetTeamId() == TEAM_ALLIANCE) ? allianceFlightMasterCache : hordeFlightMasterCache;

    Creature* nearestFlightMaster = nullptr;
    float nearestDistance = std::numeric_limits<float>::max();

    WorldPosition botPos(bot);

    for (auto const& cacheEntry : flightMasterCache)
    {
        uint32 entry = cacheEntry.first;
        WorldPosition pos = cacheEntry.second;

        if (pos.getMapId() != bot->GetMapId())
            continue;

        float distance = botPos.sqDistance2d(pos);
        if (distance >= nearestDistance)
            continue;

        Creature* flightMaster = GetClosestCreatureWithEntry(bot, entry, 200.0f);
        if (flightMaster)
        {
            nearestDistance = distance;
            nearestFlightMaster = flightMaster;
        }
    }

    return nearestFlightMaster;
}
