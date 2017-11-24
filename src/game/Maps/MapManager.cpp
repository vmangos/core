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
#include "World.h"
#include "CellImpl.h"
#include "Corpse.h"
#include "ObjectMgr.h"
#include "ZoneScriptMgr.h"
#include "Map.h"

typedef MaNGOS::ClassLevelLockable<MapManager, ACE_Recursive_Thread_Mutex> MapManagerLock;
INSTANTIATE_SINGLETON_2(MapManager, MapManagerLock);
INSTANTIATE_CLASS_MUTEX(MapManager, ACE_Recursive_Thread_Mutex);

MapManager::MapManager()
    : i_gridCleanUpDelay(sWorld.getConfig(CONFIG_UINT32_INTERVAL_GRIDCLEAN)),
    i_MaxInstanceId(RESERVED_INSTANCES_LAST),
    i_GridStateErrorCount(0),
    i_continentUpdateFinished(NULL),
    i_maxContinentThread(0),
    asyncMapUpdating(false)
{
    i_timer.SetInterval(sWorld.getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE));
}

MapManager::~MapManager()
{
    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
        delete iter->second;

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

void MapManager::UpdateGridState(grid_state_t state, Map& map, NGridType& ngrid, GridInfo& ginfo, const uint32 &x, const uint32 &y, const uint32 &t_diff)
{
    // TODO: The grid state array itself is static and therefore 100% safe, however, the data
    // the state classes in it accesses is not, since grids are shared across maps (for example
    // in instances), so some sort of locking will be necessary later.

    si_GridStates[state]->Update(map, ngrid, ginfo, x, y, t_diff);
}

void MapManager::InitializeVisibilityDistanceInfo()
{
    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
        (*iter).second->InitVisibilityDistance();
}

Map* MapManager::CreateMap(uint32 id, const WorldObject* obj)
{
    MANGOS_ASSERT(obj);
    //if(!obj->IsInWorld()) sLog.outError("GetMap: called for map %d with object (typeid %d, guid %d, mapid %d, instanceid %d) who is not in world!", id, obj->GetTypeId(), obj->GetGUIDLow(), obj->GetMapId(), obj->GetInstanceId());
    Guard _guard(*this);

    Map * m = NULL;

    const MapEntry* entry = sMapStorage.LookupEntry<MapEntry>(id);
    if (!entry)
        return NULL;

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
        if (m == NULL)
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
        return NULL;

    return iter->second;
}

/*
    checks that do not require a map to be created
    will send transfer error messages on fail
*/
bool MapManager::CanPlayerEnter(uint32 mapid, Player* player)
{
    const MapEntry *entry = sMapStorage.LookupEntry<MapEntry>(mapid);
    if (!entry)
        return false;

    const char *mapName = entry->name;

    if (entry->IsDungeon())
    {
        if (entry->IsRaid())
        {
            // GMs can avoid raid limitations
            if (!player->isGameMaster() && !sWorld.getConfig(CONFIG_BOOL_INSTANCE_IGNORE_RAID))
            {
                // can only enter in a raid group
                Group* group = player->GetGroup();
                if (!group || !group->isRaidGroup())
                {
                    // probably there must be special opcode, because client has this string constant in GlobalStrings.lua
                    // TODO: this is not a good place to send the message
                    player->GetSession()->SendAreaTriggerMessage("You must be in a raid group to enter %s instance", mapName);
                    DEBUG_LOG("MAP: Player '%s' must be in a raid group to enter instance of '%s'", player->GetName(), mapName);
                    return false;
                }
            }
        }
        DungeonPersistentState* state = player->GetBoundInstanceSaveForSelfOrGroup(mapid);
        uint32 instanceId = state ? state->GetInstanceId() : 0;
        if (!player->CheckInstanceCount(instanceId))
        {
            DEBUG_LOG("MAP: Player '%s' can't enter instance %u on map %u. Has already entered too many instances.", player->GetName(), instanceId, mapid);
            player->SendTransferAborted(TRANSFER_ABORT_TOO_MANY_INSTANCES);
            return false;
        }

        // TODO: move this to a map dependent location
        /*if(i_data && i_data->IsEncounterInProgress())
        {
            DEBUG_LOG("MAP: Player '%s' can't enter instance '%s' while an encounter is in progress.", player->GetName(), GetMapName());
            player->SendTransferAborted(TRANSFER_ABORT_ZONE_IN_COMBAT);
            return(false);
        }*/
    }

    return true;
}

void MapManager::DeleteInstance(uint32 mapid, uint32 instanceId)
{
    Guard _guard(*this);

    MapMapType::iterator iter = i_maps.find(MapID(mapid, instanceId));
    if (iter != i_maps.end())
    {
        Map * pMap = iter->second;
        if (pMap->Instanceable())
        {
            i_maps.erase(iter);

            pMap->UnloadAll(true);
            delete pMap;
        }
    }
}

class MapAsyncUpdater : public ACE_Based::Runnable
{
public:
    MapAsyncUpdater(bool* updFinished, uint32 updateDiff) :
        updateFinished(updFinished), diff(updateDiff), loops(0)
    {
    }

    virtual void run()
    {
        WorldDatabase.ThreadStart();
        do
        {
            for (std::vector<Map*>::iterator it = maps.begin(); it != maps.end(); ++it)
            {
                if (loops && *updateFinished)
                    break;
                (*it)->DoUpdate(diff);
            }
            if (!(*updateFinished))
                ACE_Based::Thread::Sleep(5);
            ++loops;
        }
        while (!(*updateFinished));
        WorldDatabase.ThreadEnd();
    }
    std::vector<Map*> maps;
    volatile bool* updateFinished;
    uint32 diff;
    uint32 loops;
};

class ContinentAsyncUpdater : public ACE_Based::Runnable
{
public:
    ContinentAsyncUpdater(uint32 updateDiff, Map* m) : diff(updateDiff), map(m)
    {
    }

    virtual void run()
    {
        WorldDatabase.ThreadStart();
        map->DoUpdate(diff);
        WorldDatabase.ThreadEnd();
    }
    Map* map;
    uint32 diff;
};

void MapManager::Update(uint32 diff)
{
    i_timer.Update(diff);
    if (!i_timer.Passed())
        return;

    // Execute any teleports scheduled in the main thread prior to map update
    // eg. area triggers, world port acks
    ExecuteDelayedPlayerTeleports();

    uint32 mapsDiff = (uint32)i_timer.GetCurrent();
    bool updateFinished = false;
    asyncMapUpdating = true;
    std::vector<MapAsyncUpdater*> instanceUpdaters(sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_INSTANCED_UPDATE_THREADS));
    std::vector<ContinentAsyncUpdater*> continentsUpdaters;
    for (int i = 0; i < instanceUpdaters.size(); ++i)
        instanceUpdaters[i] = new MapAsyncUpdater(&updateFinished, mapsDiff); // Will be deleted at thread end

    int mapIdx = 0;
    int continentsIdx = 0;
    uint32 now = WorldTimer::getMSTime();
    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
    {
        // If this map has been empty for too long, we no longer update it.
        if (!iter->second->HavePlayers() && sWorld.getConfig(CONFIG_UINT32_EMPTY_MAPS_UPDATE_TIME))
        {
            if (WorldTimer::getMSTimeDiff(iter->second->GetLastPlayerLeftTime(), now) > sWorld.getConfig(CONFIG_UINT32_EMPTY_MAPS_UPDATE_TIME))
                continue;
        }
        iter->second->UpdateSync(mapsDiff);
        iter->second->MarkNotUpdated();
        iter->second->SetMapUpdateIndex(-1);
        if (iter->second->Instanceable())
        {
            if (instanceUpdaters.size())
            {
                instanceUpdaters[mapIdx % instanceUpdaters.size()]->maps.push_back(iter->second);
                ++mapIdx;
            }
            else
                iter->second->Update(mapsDiff);
        }
        else // One threat per continent part
        {
            iter->second->SetMapUpdateIndex(continentsIdx++);
            ContinentAsyncUpdater* task = new ContinentAsyncUpdater(mapsDiff, iter->second);
            continentsUpdaters.push_back(task);
        }
    }
    i_maxContinentThread = continentsIdx;
    i_continentUpdateFinished = new volatile bool[i_maxContinentThread];
    for (int i = 0; i < i_maxContinentThread; ++i)
        i_continentUpdateFinished[i] = false;

    std::vector<ACE_Based::Thread*> asyncUpdateThreads(instanceUpdaters.size() + continentsUpdaters.size());

    for (int tid = 0; tid < instanceUpdaters.size(); ++tid)
        asyncUpdateThreads[tid]                             = new ACE_Based::Thread(instanceUpdaters[tid]);
    for (int tid = 0; tid < continentsUpdaters.size(); ++tid)
        asyncUpdateThreads[tid + instanceUpdaters.size()]   = new ACE_Based::Thread(continentsUpdaters[tid]);

    // Finish continents updating
    for (int tid = instanceUpdaters.size(); tid < asyncUpdateThreads.size(); ++tid)
    {
        asyncUpdateThreads[tid]->wait();
        delete asyncUpdateThreads[tid];
    }

    updateFinished = true;
    SwitchPlayersInstances();

    // And then instances updating
    for (int tid = 0; tid < instanceUpdaters.size(); ++tid)
    {
        asyncUpdateThreads[tid]->wait();
        delete asyncUpdateThreads[tid];
    }
    delete[] i_continentUpdateFinished;
    i_continentUpdateFinished = NULL;
    asyncMapUpdating = false;

    // Execute far teleports after all map updates have finished
    ExecuteDelayedPlayerTeleports();

    MapMapType::iterator crashedMapsIter = i_maps.begin();
    while (crashedMapsIter != i_maps.end())
    {
        if (crashedMapsIter->second->IsCrashed())
        {
            sZoneScriptMgr.OnMapCrashed(crashedMapsIter->second);
            crashedMapsIter->second->CrashUnload();
            i_maps.erase(crashedMapsIter++);
        }
        else
            ++crashedMapsIter;
    }

    //remove all maps which can be unloaded
    MapMapType::iterator iter = i_maps.begin();
    while (iter != i_maps.end())
    {
        Map * pMap = iter->second;
        //check if map can be unloaded
        if (pMap->CanUnload((uint32)i_timer.GetCurrent()))
        {
            sZoneScriptMgr.OnMapCrashed(pMap);
            pMap->UnloadAll(true);
            delete pMap;

            i_maps.erase(iter++);
        }
        else
            ++iter;
    }

    i_timer.SetCurrent(0);
}

void MapManager::RemoveAllObjectsInRemoveList()
{
    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
        iter->second->RemoveAllObjectsInRemoveList();
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
    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
        iter->second->UnloadAll(true);

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

    QueryResult *result = CharacterDatabase.Query("SELECT MAX(id) FROM instance");
    if (result)
    {
        i_MaxInstanceId = result->Fetch()[0].GetUInt32();
        delete result;
    }
    if (i_MaxInstanceId < RESERVED_INSTANCES_LAST)
        i_MaxInstanceId = RESERVED_INSTANCES_LAST;
}

uint32 MapManager::GetNumInstances()
{
    uint32 ret = 0;
    for (MapMapType::iterator itr = i_maps.begin(); itr != i_maps.end(); ++itr)
    {
        Map *map = itr->second;
        if (!map->IsDungeon()) continue;
        ret += 1;
    }
    return ret;
}

uint32 MapManager::GetNumPlayersInInstances()
{
    Guard guard(*this);

    uint32 ret = 0;
    for (MapMapType::iterator itr = i_maps.begin(); itr != i_maps.end(); ++itr)
    {
        Map *map = itr->second;
        if (!map->IsDungeon()) continue;
        ret += map->GetPlayers().getSize();
    }
    return ret;
}

///// returns a new or existing Instance
///// in case of battlegrounds it will only return an existing map, those maps are created by bg-system
Map* MapManager::CreateInstance(uint32 id, Player * player)
{
    Guard _guard(*this);
    Map* map = NULL;
    Map * pNewMap = NULL;
    uint32 NewInstanceId = 0;                                   // instanceId of the resulting map
    bool newlyGeneratedInstanceId = false;
    const MapEntry* entry = sMapStorage.LookupEntry<MapEntry>(id);

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
    const MapEntry* entry = sMapStorage.LookupEntry<MapEntry>(mapid);
    if (!entry)
    {
        sLog.outError("CreateTestMap: no entry for map %d", mapid);
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

DungeonMap* MapManager::CreateDungeonMap(uint32 id, uint32 InstanceId, DungeonPersistentState *save)
{
    // make sure we have a valid map id
    const MapEntry* entry = sMapStorage.LookupEntry<MapEntry>(id);
    if (!entry)
    {
        sLog.outError("CreateDungeonMap: no entry for map %d", id);
        MANGOS_ASSERT(false);
    }

    DEBUG_LOG("MapInstanced::CreateInstanceMap: %s map instance %d for %d created", save ? "" : "new ", InstanceId, id);

    DungeonMap *map = new DungeonMap(id, i_gridCleanUpDelay, InstanceId);

    // Dungeons can have saved instance data
    bool load_data = save != NULL;
    map->CreateInstanceData(load_data);
    map->SpawnActiveObjects();
    return map;
}

BattleGroundMap* MapManager::CreateBattleGroundMap(uint32 id, uint32 InstanceId, BattleGround* bg)
{
    DEBUG_LOG("MapInstanced::CreateBattleGroundMap: instance:%d for map:%d and bgType:%d created.", InstanceId, id, bg->GetTypeID());

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

bool IsNorthTo(float x, float y, float const* limits, int count /* last case is limits[2*count - 1] */)
{
    int insideCount = 0;
    for (int i = 0; i < count - 1; ++i)
    {
        if ((limits[2*i + 1] < y && y < limits[2*i + 3]) || (limits[2*i + 1] > y && y > limits[2*i + 3]))
        {
            float threshold = limits[2*i] + (limits[2*i + 2] - limits[2*i]) * (y - limits[2*i + 1]) / (limits[2*i + 3] - limits[2*i + 1]);
            if (x > threshold)
                ++insideCount;
        }
    }
    return insideCount % 2 == 1;
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
        case 0:
        {
            const static float topNorthSouthLimit[] = {
                2032.048340f, -6927.750000f,
                1634.863403f, -6157.505371f,
                1109.519775f, -5181.036133f,
                1315.204712f, -4096.020508f,
                1073.089233f, -3372.571533f,
                 825.833191f, -3125.778809f,
                 657.343994f, -2314.813232f,
                 424.736145f, -1888.283691f,
                 744.395813f, -1647.935425f,
                1424.160645f,  -654.948181f,
                1447.065308f,  -169.751358f,
                1208.715454f,   189.748703f,
                1596.240356f,   998.616699f,
                1577.923706f,  1293.419922f,
                1458.520264f,  1727.373291f,
                1591.916138f,  3728.139404f
            };
            const static float ironforgeAreaSouthLimit[] = {
                -7491.33f,  3093.74f,
                -7472.04f,  -391.88f,
                -6366.68f,  -730.10f,
                -6063.96f, -1411.76f,
                -6087.62f, -2190.21f,
                -6349.54f, -2533.66f,
                -6308.63f, -3049.32f,
                -6107.82f, -3345.30f,
                -6008.49f, -3590.52f,
                -5989.37f, -4312.29f, 
                -5806.26f, -5864.11f
            };
            const static float stormwindAreaNorthLimit[] = {
                 -8004.25f,  3714.11f,
                 -8075.00f, -179.00f,
                 -8638.00f, 169.00f,
                 -9044.00f, 35.00f,
                 -9068.00f, -125.00f,
                 -9094.00f, -147.00f,
                 -9206.00f, -290.00f,
                 -9097.00f, -510.00f,
                 -8739.00f, -501.00f,
                 -8725.50f, -1618.45f,
                 -9810.40f, -1698.41f,
                -10049.60f, -1740.40f,
                -10670.61f, -1692.51f,
                -10908.48f, -1563.87f,
                -13006.40f, -1622.80f,
                -12863.23f, -4798.42f
            };
            const static float stormwindAreaSouthLimit[] = {
                 -8725.337891f,  3535.624023f,
                 -9525.699219f,   910.132568f,
                 -9796.953125f,   839.069580f,
                 -9946.341797f,   743.102844f,
                -10287.361328f,   760.076477f,
                -10083.828125f,   380.389893f,
                -10148.072266f,    80.056450f,
                -10014.583984f,  -161.638519f,
                 -9978.146484f,  -361.638031f,
                 -9877.489258f,  -563.304871f,
                 -9980.967773f, -1128.510498f,
                 -9991.717773f, -1428.793213f,
                 -9887.579102f, -1618.514038f,
                -10169.600586f, -1801.582031f,
                 -9966.274414f, -2227.197754f,
                 -9861.309570f, -2989.841064f,
                 -9944.026367f, -3205.886963f,
                 -9610.209961f, -3648.369385f,
                 -7949.329590f, -4081.389404f,
                 -7910.859375f, -5855.578125f
            };
            if (IsNorthTo(x, y, topNorthSouthLimit, sizeof(topNorthSouthLimit) / (2 * sizeof(float))))
                return MAP0_TOP_NORTH;
            if (x > -2521)
                return MAP0_MIDDLE_NORTH;
            if (IsNorthTo(x, y, ironforgeAreaSouthLimit, sizeof(ironforgeAreaSouthLimit) / (2 * sizeof(float))))
                return MAP0_IRONFORGE_AREA;
            if (IsNorthTo(x, y, stormwindAreaNorthLimit, sizeof(stormwindAreaNorthLimit) / (2 * sizeof(float))))
                return MAP0_MIDDLE;
            if (IsNorthTo(x, y, stormwindAreaSouthLimit, sizeof(stormwindAreaNorthLimit) / (2 * sizeof(float))))
                return MAP0_STORMWIND_AREA;
            return MAP0_SOUTH;
        }
        case 1:
        {
            const static float northMiddleLimit[] = {
                  -2280.00f,  4054.00f,
                  -2401.00f,  2365.00f,
                  -2432.00f,  1338.00f,
                  -2286.00f,   769.00f,
                  -2137.00f,   662.00f,
                  -2044.54f,   489.86f,
                  -1808.52f,   436.39f,
                  -1754.85f,   504.55f,
                  -1094.55f,   651.75f,
                   -747.46f,   647.73f,
                   -685.55f,   408.43f,
                   -311.38f,   114.43f,
                   -358.40f,  -587.42f,
                   -377.92f,  -748.70f,
                   -512.57f,  -919.49f,
                   -280.65f, -1008.87f,
                    -81.29f,  -930.89f,
                    284.31f, -1105.39f,
                    568.86f,  -892.28f,
                   1211.09f, -1135.55f,
                    879.60f, -2110.18f,
                    788.96f, -2276.02f,
                    899.68f, -2625.56f,
                   1281.54f, -2689.42f,
                   1521.82f, -3047.85f,
                   1424.22f, -3365.69f,
                   1694.11f, -3615.20f,
                   2373.78f, -4019.96f,
                   2388.13f, -5124.35f,
                   2193.79f, -5484.38f,
                   1703.57f, -5510.53f,
                   1497.59f, -6376.56f,
                   1368.00f, -8530.00f
            };
            const static float durotarSouthLimit[] = {
                    2755.00f, -3766.00f,
                    2225.00f, -3596.00f,
                    1762.00f, -3746.00f,
                    1564.00f, -3943.00f,
                    1184.00f, -3915.00f,
                     737.00f, -3782.00f,
                     -75.00f, -3742.00f,
                    -263.00f, -3836.00f,
                    -173.00f, -4064.00f,
                     -81.00f, -4091.00f,
                     -49.00f, -4089.00f,
                     -16.00f, -4187.00f,
                      -5.00f, -4192.00f,
                     -14.00f, -4551.00f,
                    -397.00f, -4601.00f,
                    -522.00f, -4583.00f,
                    -668.00f, -4539.00f,
                    -790.00f, -4502.00f,
                   -1176.00f, -4213.00f,
                   -1387.00f, -4674.00f,
                   -2243.00f, -6046.00f
            };
            const static float valleyoftrialsSouthLimit[] = {
                    -324.00f, -3869.00f,
                    -774.00f, -3992.00f,
                    -965.00f, -4290.00f,
                    -932.00f, -4349.00f,
                    -828.00f, -4414.00f,
                    -661.00f, -4541.00f,
                    -521.00f, -4582.00f
            };
            const static float middleToSouthLimit[] = {
                        -2402.01f,      4255.70f,
                    -2475.933105f,  3199.568359f, // Desolace
                    -2344.124023f,  1756.164307f,
                    -2826.438965f,   403.824738f, // Mulgore
                    -3472.819580f,   182.522476f, // Feralas
                    -4365.006836f, -1602.575439f, // the Barrens
                    -4515.219727f, -1681.356079f,
                    -4543.093750f, -1882.869385f, // Thousand Needles
                        -4824.16f,     -2310.11f,
                    -5102.913574f, -2647.062744f,
                    -5248.286621f, -3034.536377f,
                    -5246.920898f, -3339.139893f,
                    -5459.449707f, -4920.155273f, // Tanaris
                        -5437.00f,     -5863.00f
            };
            if (IsNorthTo(x, y, northMiddleLimit, sizeof(northMiddleLimit) / (2 * sizeof(float))))
                return MAP1_NORTH;
            if (IsNorthTo(x, y, durotarSouthLimit, sizeof(durotarSouthLimit) / (2 * sizeof(float))))
                return MAP1_DUROTAR;
            if (IsNorthTo(x, y, valleyoftrialsSouthLimit, sizeof(valleyoftrialsSouthLimit) / (2 * sizeof(float))))
                return MAP1_VALLEY;
            if (IsNorthTo(x, y, middleToSouthLimit, sizeof(middleToSouthLimit) / (2 * sizeof(float))))
                return MAP1_MIDDLE_EST;
            return MAP1_SOUTH;
        }
    }
    return 0;
}

void MapManager::ScheduleFarTeleport(Player *player, ScheduledTeleportData *data)
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
        ACE_Guard<ACE_Thread_Mutex> guard(m_scheduledFarTeleportsLock);
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
void MapManager::ExecuteSingleDelayedTeleport(Player *player)
{
    ACE_Guard<ACE_Thread_Mutex> guard(m_scheduledFarTeleportsLock);
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

void MapManager::CancelDelayedPlayerTeleport(Player *player)
{
    ACE_Guard<ACE_Thread_Mutex> guard(m_scheduledFarTeleportsLock);
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
    m_scheduledInstanceSwitches_lock[mapId].acquire();
    m_scheduledInstanceSwitches[mapId][player] = newInstance;
    m_scheduledInstanceSwitches_lock[mapId].release();
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
