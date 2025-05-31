/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "MapManager.h"
#include "MapPersistentStateMgr.h"
#include "Policies/SingletonImp.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "GridDefines.h"
#include "CellImpl.h"
#include "World.h"
#include "Player.h"
#include "Group.h"
#include "ZoneScriptMgr.h"
#include "Map.h"
#include "BattleGround.h"
#include "ThreadPool.h"

typedef MaNGOS::ClassLevelLockable<MapManager, std::recursive_mutex> MapManagerLock;
INSTANTIATE_SINGLETON_2(MapManager, MapManagerLock);
INSTANTIATE_CLASS_MUTEX(MapManager, std::recursive_mutex);

MapManager::MapManager()
    :
    i_gridCleanUpDelay(sWorld.getConfig(CONFIG_UINT32_INTERVAL_GRIDCLEAN)),
    i_MaxInstanceId(RESERVED_INSTANCES_LAST),
    m_threads(new ThreadPool(sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_INSTANCED_UPDATE_THREADS))),
    m_instanceCreationThreads(new ThreadPool(1))
{
    i_timer.SetInterval(sWorld.getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE));
    m_threads->start<ThreadPool::MySQL<>>();
    m_instanceCreationThreads->start<>();
}

MapManager::~MapManager()
{
    for (const auto& itr : i_maps)
        delete itr.second;

    DeleteStateMachine();
}

void
MapManager::Initialize()
{
    InitStateMachine();
    InitMaxInstanceId();
    for (auto itr = sMapStorage.begin<MapEntry>(); itr < sMapStorage.end<MapEntry>(); ++itr)
    {
        bool load = false;
        if (itr->IsContinent() && sWorld.getConfig(CONFIG_BOOL_TERRAIN_PRELOAD_CONTINENTS))
            load = true;
        if (itr->Instanceable() && sWorld.getConfig(CONFIG_BOOL_TERRAIN_PRELOAD_INSTANCES))
            load = true;
        if (!load)
            continue;
        TerrainInfo* terrain = sTerrainMgr.LoadTerrain(itr->id);
        terrain->AddRef(); // So it won't be deleted
        terrain->LoadAll();
    }
}

void MapManager::InitStateMachine()
{
    si_GridStates[GRID_STATE_INVALID] = new InvalidState;
    si_GridStates[GRID_STATE_ACTIVE] = new ActiveState;
    si_GridStates[GRID_STATE_IDLE] = new IdleState;
    si_GridStates[GRID_STATE_REMOVAL] = new RemovalState;
}

void MapManager::DeleteStateMachine()
{
    delete si_GridStates[GRID_STATE_INVALID];
    delete si_GridStates[GRID_STATE_ACTIVE];
    delete si_GridStates[GRID_STATE_IDLE];
    delete si_GridStates[GRID_STATE_REMOVAL];
}

void MapManager::UpdateGridState(grid_state_t state, Map& map, NGridType& ngrid, GridInfo& ginfo, uint32 const& x, uint32 const& y, uint32 const& t_diff)
{
    // TODO: The grid state array itself is static and therefore 100% safe, however, the data
    // the state classes in it accesses is not, since grids are shared across maps (for example
    // in instances), so some sort of locking will be necessary later.

    si_GridStates[state]->Update(map, ngrid, ginfo, x, y, t_diff);
}

void MapManager::InitializeVisibilityDistanceInfo()
{
    for (const auto& itr : i_maps)
        itr.second->InitVisibilityDistance();
}

Map* MapManager::CreateMap(uint32 id, WorldObject const* obj)
{
    MANGOS_ASSERT(obj);
    //if (!obj->IsInWorld()) sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GetMap: called for map %d with object (typeid %d, guid %d, mapid %d, instanceid %d) who is not in world!", id, obj->GetTypeId(), obj->GetGUIDLow(), obj->GetMapId(), obj->GetInstanceId());
    Guard _guard(*this);

    Map* m = nullptr;

    MapEntry const* entry = sMapStorage.LookupEntry<MapEntry>(id);
    if (!entry)
        return nullptr;

    if (entry->Instanceable())
    {
        MANGOS_ASSERT(obj->GetTypeId() == TYPEID_PLAYER);
        //create DungeonMap object
        if (obj->GetTypeId() == TYPEID_PLAYER)
            m = CreateInstance(id, (Player*)obj);
    }
    else
    {
        //create regular non-instanceable map
        uint32 instanceId = obj->GetInstanceId();
        if (instanceId >= RESERVED_INSTANCES_LAST)
            instanceId = 0;
        if (id > 1) // Not a continent => Never instanciate this (deeprun tram, etc ...)
            instanceId = 0;
        m = FindMap(id, instanceId);
        if (m == nullptr)
        {
            m = new WorldMap(id, i_gridCleanUpDelay, instanceId);
            //add map into container
            i_maps[MapID(id, instanceId)] = m;

            // non-instanceable maps always expected have saved state
            m->CreateInstanceData(true);
            m->SpawnActiveObjects();
            sZoneScriptMgr.MapLoaded(id, m);
        }
    }

    return m;
}

Map* MapManager::CreateBgMap(uint32 mapid, BattleGround* bg)
{
    sTerrainMgr.LoadTerrain(mapid);

    Guard _guard(*this);
    return CreateBattleGroundMap(mapid, sMapMgr.GenerateInstanceId(), bg);
}

Map* MapManager::FindMap(uint32 mapid, uint32 instanceId) const
{
    Guard guard(*this);

    MapMapType::const_iterator iter = i_maps.find(MapID(mapid, instanceId));
    if (iter == i_maps.end())
        return nullptr;

    return iter->second;
}

/*
    checks that do not require a map to be created
    will send transfer error messages on fail
*/
bool MapManager::CanPlayerEnter(uint32 mapid, Player* player)
{
    MapEntry const* entry = sMapStorage.LookupEntry<MapEntry>(mapid);
    if (!entry)
        return false;

    char const* mapName = entry->name;

    if (entry->IsDungeon())
    {
        if (entry->IsRaid())
        {
            // GMs can avoid raid limitations
            if (!player->IsGameMaster() && !player->HasCheatOption(PLAYER_CHEAT_TRIGGER_PASS) &&
                !sWorld.getConfig(CONFIG_BOOL_INSTANCE_IGNORE_RAID))
            {
                // can only enter in a raid group
                Group* group = player->GetGroup();
                if (!group || !group->isRaidGroup())
                {
                    // TODO: this is not a good place to send the message
                    player->SendRaidGroupOnlyError(0, ERR_RAID_GROUP_REQUIRED);
                    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MAP: Player '%s' must be in a raid group to enter instance of '%s'", player->GetName(), mapName);
                    return false;
                }
            }
        }
        DungeonPersistentState* state = player->GetBoundInstanceSaveForSelfOrGroup(mapid);
        uint32 instanceId = state ? state->GetInstanceId() : 0;
        if (!player->CheckInstanceCount(instanceId))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MAP: Player '%s' can't enter instance %u on map %u. Has already entered too many instances.", player->GetName(), instanceId, mapid);
            player->SendTransferAborted(TRANSFER_ABORT_TOO_MANY_INSTANCES);
            return false;
        }
    }

    return true;
}

void MapManager::DeleteInstance(uint32 mapid, uint32 instanceId)
{
    Guard _guard(*this);

    MapMapType::iterator iter = i_maps.find(MapID(mapid, instanceId));
    if (iter != i_maps.end())
    {
        Map* pMap = iter->second;
        if (pMap->Instanceable())
        {
            i_maps.erase(iter);

            pMap->UnloadAll(true);
            delete pMap;
        }
    }
}

void MapManager::ScheduleNewWorldOnFarTeleport(Player* pPlayer)
{
    WorldLocation const& dest = pPlayer->GetTeleportDest();
    MapEntry const* pMapEntry = sMapStorage.LookupEntry<MapEntry>(dest.mapId);
    MANGOS_ASSERT(pMapEntry);

    if (pMapEntry->IsDungeon())
    {
        DungeonPersistentState* pSave = pPlayer->GetBoundInstanceSaveForSelfOrGroup(pMapEntry->id);
        if (!pSave || !FindMap(pMapEntry->id, pSave->GetInstanceId()))
        {
            m_scheduledNewInstancesForPlayers.insert(pPlayer);
            return;
        }
    }

    // map already created
    pPlayer->SendNewWorld();
}

void MapManager::CreateNewInstancesForPlayers()
{
    do
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(20));
        std::unordered_set<Player*> players;
        std::swap(players, m_scheduledNewInstancesForPlayers);

        for (auto const& player : players)
        {
            WorldLocation const& dest = player->GetTeleportDest();
            if (!player->IsBeingTeleportedFar())
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Scheduled instance creation for map %u for player %u but he is no longer being teleported!", dest.mapId, player->GetGUIDLow());
                continue;
            }

            MapEntry const* pMapEntry = sMapStorage.LookupEntry<MapEntry>(dest.mapId);
            MANGOS_ASSERT(pMapEntry->IsDungeon());

            DungeonMap* pMap = static_cast<DungeonMap*>(CreateInstance(dest.mapId, player));
            if (pMap->CanEnter(player))
            {
                pMap->ForceLoadGridsAroundPosition(dest.x, dest.y);
                pMap->BindPlayerOrGroupOnEnter(player);
                player->SendNewWorld();
            } 
            else
            {
                WorldLocation oldLoc;
                player->GetPosition(oldLoc);
                player->HandleReturnOnTeleportFail(oldLoc);
            }
        } 
    } while (asyncMapUpdating);
}

void MapManager::Update(uint32 diff)
{
    i_timer.Update(diff);
    if (!i_timer.Passed())
        return;

    // Execute any teleports scheduled in the main thread prior to map update
    // eg. area triggers, world port acks
    ExecuteDelayedPlayerTeleports();

    uint32 mapsDiff = (uint32)i_timer.GetCurrent();
    asyncMapUpdating = true;

    int continentsIdx = 0;
    uint32 now = WorldTimer::getMSTime();

    uint32 inactiveTimeLimit = sWorld.getConfig(CONFIG_UINT32_EMPTY_MAPS_UPDATE_TIME);
    std::vector<std::function<void()>> continentsUpdaters;
    std::vector<std::function<void()>> instancesUpdaters;

    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
    {
        // If this map has been empty for too long, we no longer update it.
        if (!iter->second->ShouldUpdateMap(now, inactiveTimeLimit))
            continue;

        iter->second->UpdateSync(mapsDiff);
        iter->second->MarkNotUpdated();
        if (iter->second->Instanceable())
        {
            if (m_threads->status() == ThreadPool::Status::READY)
                instancesUpdaters.emplace_back([iter,mapsDiff](){
                    iter->second->DoUpdate(mapsDiff);
                });
            else
                iter->second->DoUpdate(mapsDiff);
        }
        else // One threat per continent part
        {
            continentsUpdaters.emplace_back([iter,mapsDiff](){
                Map *m = iter->second;
                if (!m->IsUpdateFinished() || !sMapMgr.IsContinentUpdateFinished())
                    m->DoUpdate(mapsDiff);
            });
            continentsIdx++;
        }
    }

    std::vector<std::function<void()>> instanceCreators;
    instanceCreators.emplace_back([this]() {CreateNewInstancesForPlayers();});
    std::future<void> instances = m_instanceCreationThreads->processWorkload(std::move(instanceCreators),
        ThreadPool::Callable());
    
    i_maxContinentThread = continentsIdx;
    i_continentUpdateFinished.store(0);

    if (!m_continentThreads || m_continentThreads->size() < continentsUpdaters.size())
    {
        m_continentThreads.reset(new ThreadPool(continentsUpdaters.size()));
        m_continentThreads->start<>();
    }
    std::future<void> continents = m_continentThreads->processWorkload(std::move(continentsUpdaters),
                                                                       ThreadPool::Callable());

    std::chrono::high_resolution_clock::time_point start;
    do {
        start = std::chrono::high_resolution_clock::now();
        std::future<void> f = m_threads->processWorkload(instancesUpdaters,
                                                         ThreadPool::Callable());

        if (f.valid())
            f.wait();
        else
            break;
    }while(!sMapMgr.waitContinentUpdateFinishedUntil(start + std::chrono::milliseconds(sWorld.getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE))));

    if (continents.valid())
        continents.wait();

    SwitchPlayersInstances();
    asyncMapUpdating = false;

    if (instances.valid())
        instances.wait();

    // Execute far teleports after all map updates have finished
    ExecuteDelayedPlayerTeleports();

    MapMapType::iterator crashedMapsIter = i_maps.begin();
    while (crashedMapsIter != i_maps.end())
    {
        if (crashedMapsIter->second->IsCrashed())
        {
            sZoneScriptMgr.OnMapCrashed(crashedMapsIter->second);
            crashedMapsIter->second->CrashUnload();
            crashedMapsIter = i_maps.erase(crashedMapsIter);
        }
        else
            ++crashedMapsIter;
    }

    //remove all maps which can be unloaded
    MapMapType::iterator iter = i_maps.begin();
    while (iter != i_maps.end())
    {
        Map* pMap = iter->second;
        //check if map can be unloaded
        if (pMap->CanUnload((uint32)i_timer.GetCurrent()))
        {
            sZoneScriptMgr.OnMapCrashed(pMap);
            pMap->UnloadAll(true);
            delete pMap;

            iter = i_maps.erase(iter);
        }
        else
            ++iter;
    }

    i_timer.SetCurrent(0);
}

void MapManager::RemoveAllObjectsInRemoveList()
{
    for (const auto& itr : i_maps)
        itr.second->RemoveAllObjectsInRemoveList();
}

bool MapManager::ExistMapAndVMap(uint32 mapid, float x, float y)
{
    GridPair p = MaNGOS::ComputeGridPair(x, y);

    int gx = 63 - p.x_coord;
    int gy = 63 - p.y_coord;

    return GridMap::ExistMap(mapid, gx, gy) && GridMap::ExistVMap(mapid, gx, gy);
}

bool MapManager::IsValidMAP(uint32 mapid)
{
    return sMapStorage.LookupEntry<MapEntry>(mapid);
}

void MapManager::UnloadAll()
{
    for (const auto& itr : i_maps)
        itr.second->UnloadAll(true);

    // Execute any delayed teleports scheduled during unloading. Must be done before
    // the maps are deleted
    ExecuteDelayedPlayerTeleports();

    while (!i_maps.empty())
    {
        delete i_maps.begin()->second;
        i_maps.erase(i_maps.begin());
    }

    TerrainManager::Instance().UnloadAll();
}

void MapManager::InitMaxInstanceId()
{
    i_MaxInstanceId = RESERVED_INSTANCES_LAST;

    std::unique_ptr<QueryResult> result = CharacterDatabase.Query("SELECT MAX(`id`) FROM `instance`");
    if (result)
    {
        i_MaxInstanceId = result->Fetch()[0].GetUInt32();
    }
    if (i_MaxInstanceId < RESERVED_INSTANCES_LAST)
        i_MaxInstanceId = RESERVED_INSTANCES_LAST;
}

uint32 MapManager::GetNumInstances()
{
    uint32 ret = 0;
    for (const auto& itr : i_maps)
    {
        Map* map = itr.second;
        if (!map->IsDungeon()) continue;
        ret += 1;
    }
    return ret;
}

uint32 MapManager::GetNumPlayersInInstances()
{
    Guard guard(*this);

    uint32 ret = 0;
    for (const auto& itr : i_maps)
    {
        Map* map = itr.second;
        if (!map->IsDungeon()) continue;
        ret += map->GetPlayers().getSize();
    }
    return ret;
}

// returns a new or existing Instance
// in case of battlegrounds it will only return an existing map, those maps are created by bg-system
Map* MapManager::CreateInstance(uint32 id, Player* player)
{
    Guard _guard(*this);
    Map* map = nullptr;
    Map* pNewMap = nullptr;
    uint32 NewInstanceId = 0;                                   // instanceId of the resulting map
    bool newlyGeneratedInstanceId = false;
    MapEntry const* entry = sMapStorage.LookupEntry<MapEntry>(id);

    if (entry->IsBattleGround())
    {
        // find existing bg map for player
        NewInstanceId = player->GetBattleGroundId();
        MANGOS_ASSERT(NewInstanceId);
        map = FindMap(id, NewInstanceId);
        MANGOS_ASSERT(map);
    }
    else if (DungeonPersistentState* pSave = player->GetBoundInstanceSaveForSelfOrGroup(id))
    {
        // solo/perm/group
        NewInstanceId = pSave->GetInstanceId();
        map = FindMap(id, NewInstanceId);
        // it is possible that the save exists but the map doesn't
        if (!map)
            pNewMap = CreateDungeonMap(id, NewInstanceId, pSave);
    }
    else
    {
        // if no instanceId via group members or instance saves is found
        // the instance will be created for the first time
        NewInstanceId = GenerateInstanceId();
        newlyGeneratedInstanceId = true;
        pNewMap = CreateDungeonMap(id, NewInstanceId);
    }

    //add a new map object into the registry
    if (pNewMap)
    {
        i_maps[MapID(id, NewInstanceId)] = pNewMap;
        map = pNewMap;
    }

    return map;
}


Map* MapManager::CreateTestMap(uint32 mapid, bool instanced, float posX, float posY)
{
    if (!instanced)
    {
        // Continents are actually instanced
        uint32 instanceId = sMapMgr.GetContinentInstanceId(mapid, posX, posY);
        if (Map* map = FindMap(mapid, instanceId))
            return map;
        Map* map = new WorldMap(mapid, i_gridCleanUpDelay);
        //add map into container
        i_maps[MapID(mapid, instanceId)] = map;

        // non-instanceable maps always expected have saved state
        map->CreateInstanceData(true);
        sZoneScriptMgr.MapLoaded(mapid, map);
        return map;
    }

    // make sure we have a valid map id
    MapEntry const* entry = sMapStorage.LookupEntry<MapEntry>(mapid);
    if (!entry)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CreateTestMap: no entry for map %d", mapid);
        MANGOS_ASSERT(false);
    }
    uint32 instanceId = GenerateInstanceId();
    Map* map;
    if (entry->IsDungeon())
    {
        DungeonMap *dmap = new DungeonMap(mapid, i_gridCleanUpDelay, instanceId);
        dmap->CreateInstanceData(false);
        map = dmap;
    }
    else
        map = new WorldMap(mapid, i_gridCleanUpDelay, instanceId);

    //map->SpawnActiveObjects();
    i_maps[MapID(mapid, instanceId)] = map;
    return map;
}

void MapManager::DeleteTestMap(Map* map)
{
    i_maps.erase(MapID(map->GetId(), map->GetInstanceId()));
    delete map;
}

DungeonMap* MapManager::CreateDungeonMap(uint32 id, uint32 InstanceId, DungeonPersistentState* save)
{
    // make sure we have a valid map id
    MapEntry const* entry = sMapStorage.LookupEntry<MapEntry>(id);
    if (!entry)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "CreateDungeonMap: no entry for map %d", id);
        MANGOS_ASSERT(false);
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MapInstanced::CreateInstanceMap: %s map instance %d for %d created", save ? "" : "new ", InstanceId, id);

    DungeonMap *map = new DungeonMap(id, i_gridCleanUpDelay, InstanceId);

    // Dungeons can have saved instance data
    bool load_data = save != nullptr;
    map->CreateInstanceData(load_data);
    map->SpawnActiveObjects();
    return map;
}

BattleGroundMap* MapManager::CreateBattleGroundMap(uint32 id, uint32 InstanceId, BattleGround* bg)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "MapInstanced::CreateBattleGroundMap: instance:%d for map:%d and bgType:%d created.", InstanceId, id, bg->GetTypeID());

    BattleGroundMap *map = new BattleGroundMap(id, i_gridCleanUpDelay, InstanceId);
    MANGOS_ASSERT(map->IsBattleGround());
    map->SetBG(bg);
    bg->SetBgMap(map);

    //add map into map container
    i_maps[MapID(id, InstanceId)] = map;

    // BGs/Arenas not have saved instance data
    map->CreateInstanceData(false);
    map->SpawnActiveObjects();
    return map;
}

bool IsNorthTo(float x, float y, InstantiatedContinentBoundary const& icb)
{
    if (y < icb.minY || y > icb.maxY)
        return false;

    if (x > icb.maxX)
        return true;

    if (x < icb.minX) // we checking from south to north, so this check most likely wont be needed
        return false;

    int insideCount = 0;
    for (int i = 0; i < icb.count - 1; ++i)
    {
        if ((icb.points[2 * i + 1] < y && y < icb.points[2 * i + 3]) || (icb.points[2 * i + 1] > y && y > icb.points[2 * i + 3]))
        {
            float threshold = icb.points[2 * i] + (icb.points[2 * i + 2] - icb.points[2 * i]) * (y - icb.points[2 * i + 1]) / (icb.points[2 * i + 3] - icb.points[2 * i + 1]);
            if (x > threshold)
                ++insideCount;
        }
    }
    return insideCount & 1;
}

uint32 MapManager::GetContinentInstanceId(uint32 mapId, float x, float y, bool* transitionArea)
{
    if (transitionArea)
        *transitionArea = false;

    if (!sWorld.getConfig(CONFIG_BOOL_CONTINENTS_INSTANCIATE))
        return 0;

    // Y = horizontal axis on wow ...
    switch (mapId)
    {
    case MAP_EASTERN_KINGDOMS:
        {
            if (IsNorthTo(x, y, topNorthSouthBoundary))
                return MAP0_TOP_NORTH;
            if (x > -2521)
                return MAP0_MIDDLE_NORTH;
            if (IsNorthTo(x, y, ironforgeAreaSouthBoundary))
                return MAP0_IRONFORGE_AREA;
            if (IsNorthTo(x, y, stormwindAreaNorthBoundary))
                return MAP0_MIDDLE;
            if (IsNorthTo(x, y, stormwindAreaSouthBoundary))
                return MAP0_STORMWIND_AREA;
            return MAP0_SOUTH;
        }
    case MAP_KALIMDOR:
        {
            if (IsNorthTo(x, y, northMiddleBoundary))
                return MAP1_NORTH;
            if (IsNorthTo(x, y, orgrimmarSouthBoundary))
                return MAP1_ORGRIMMAR;
            if (IsNorthTo(x, y, durotarSouthBoundary))
                return MAP1_DUROTAR;
            if (IsNorthTo(x, y, valleyoftrialsSouthBoundary))
                return MAP1_VALLEY;
            if (IsNorthTo(x, y, middleToSouthBoundary))
                return MAP1_UPPER_MIDDLE;
            if (IsNorthTo(x, y, feralasThousandNeedlesSouthBoundary))
                return MAP1_LOWER_MIDDLE;
            return MAP1_SOUTH;
        }
    }
    return 0;
}

void MapManager::ScheduleFarTeleport(Player* player, ScheduledTeleportData* data)
{
    // If we're not in the middle of an async update, it's safe to execute the
    // teleport immediately.
    if (!asyncMapUpdating)
    {
        player->ExecuteTeleportFar(data);
        delete data;
    }
    else
    {
        std::unique_lock<std::mutex> guard(m_scheduledFarTeleportsLock);
        player->SetPendingFarTeleport(true);
        m_scheduledFarTeleports[player] = data;
    }
}

// Execute all delayed teleports at the end of a map update
void MapManager::ExecuteDelayedPlayerTeleports()
{
    ScheduledTeleportMap::iterator iter;
    for (iter = m_scheduledFarTeleports.begin(); iter != m_scheduledFarTeleports.end(); ++iter)
    {
        ExecuteSingleDelayedTeleport(iter);
    }

    m_scheduledFarTeleports.clear();
}

// Execute a single delayed teleport for the given player (if there are any). It should
// only be necessary to call this in teleports performed outside of an update (i.e.
// player logout and login).
void MapManager::ExecuteSingleDelayedTeleport(Player* player)
{
    std::unique_lock<std::mutex> guard(m_scheduledFarTeleportsLock);
    ScheduledTeleportMap::iterator iter = m_scheduledFarTeleports.find(player);

    if (iter != m_scheduledFarTeleports.end())
    {
        ExecuteSingleDelayedTeleport(iter);

        m_scheduledFarTeleports.erase(iter);
    }
}

void MapManager::ExecuteSingleDelayedTeleport(ScheduledTeleportMap::iterator iter)
{
    // Execute the teleport. If it fails, clear the semaphore
    if (!iter->first->ExecuteTeleportFar(iter->second))
        iter->first->SetSemaphoreTeleportFar(false);

    iter->first->SetPendingFarTeleport(false);

    delete iter->second; // don't leak tele data
}

void MapManager::CancelDelayedPlayerTeleport(Player* player)
{
    std::unique_lock<std::mutex> guard(m_scheduledFarTeleportsLock);
    ScheduledTeleportMap::iterator iter = m_scheduledFarTeleports.find(player);

    if (iter != m_scheduledFarTeleports.end())
    {
        iter->first->SetPendingFarTeleport(false);
        delete iter->second;

        m_scheduledFarTeleports.erase(iter);
    }
}

void MapManager::ScheduleInstanceSwitch(Player* player, uint16 newInstance)
{
    uint8 mapId = player->GetMap()->GetId();
    ASSERT(mapId < LAST_CONTINENT_ID);
    std::unique_lock<std::mutex> lock(m_scheduledInstanceSwitches_lock[mapId]);
    m_scheduledInstanceSwitches[mapId][player] = newInstance;
}

void MapManager::SwitchPlayersInstances()
{
    std::map<Player*, uint16>::iterator it;
    for (int continent = 0; continent < LAST_CONTINENT_ID; ++continent)
    {
        for (it = m_scheduledInstanceSwitches[continent].begin(); it != m_scheduledInstanceSwitches[continent].end(); ++it)
        {
            Player* player = it->first;
            if (player->IsInWorld() && player->GetMapId() == continent)
                player->SwitchInstance(it->second);
        }
        m_scheduledInstanceSwitches[continent].clear();
    }
}

void MapManager::MarkContinentUpdateFinished()
{
    ASSERT(i_continentUpdateFinished < i_maxContinentThread);
    std::unique_lock<std::mutex> lock(m_continentMutex);
    i_continentUpdateFinished++;
    if (IsContinentUpdateFinished())
        m_continentCV.notify_all();
}

bool MapManager::IsContinentUpdateFinished() const
{
    return i_continentUpdateFinished == i_maxContinentThread;
}

bool MapManager::waitContinentUpdateFinishedFor(std::chrono::milliseconds time) const
{
    std::unique_lock<std::mutex> lock(m_continentMutex);
    return m_continentCV.wait_for(lock,time,std::bind(&MapManager::IsContinentUpdateFinished,this));
}

bool MapManager::waitContinentUpdateFinishedUntil(std::chrono::high_resolution_clock::time_point time) const
{
    std::unique_lock<std::mutex> lock(m_continentMutex);
    return m_continentCV.wait_until(lock,time,std::bind(&MapManager::IsContinentUpdateFinished,this));
}
