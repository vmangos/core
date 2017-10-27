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

#include "Map.h"
#include "MapManager.h"
#include "Player.h"
#include "GridNotifiers.h"
#include "Log.h"
#include "GridStates.h"
#include "CellImpl.h"
#include "InstanceData.h"
#include "GridNotifiersImpl.h"
#include "Transport.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "World.h"
#include "Group.h"
#include "MapRefManager.h"
#include "DBCEnums.h"
#include "MapPersistentStateMgr.h"
#include "VMapFactory.h"
#include "BattleGroundMgr.h"
#include "DynamicTree.h"
#include "RegularGrid.h"
#include "PathFinder.h"
#include "Detour/Include/DetourNavMesh.h"
#include "Detour/Include/DetourNavMeshQuery.h"
#include "MoveMap.h"
#include "SocialMgr.h"
#include "Chat.h"
#include "MovementBroadcaster.h"
#include "PlayerBroadcaster.h"
#include "GridSearchers.h"
#include "AuraRemovalMgr.h"

#define MAX_GRID_LOAD_TIME      50

Map::~Map()
{
    UnloadAll(true);

    if (!m_scriptSchedule.empty())
        sScriptMgr.DecreaseScheduledScriptCount(m_scriptSchedule.size());

    if (m_persistentState)
        m_persistentState->SetUsedByMapState(NULL);         // field pointer can be deleted after this

    if (i_data)
    {
        delete i_data;
        i_data = NULL;
    }

    //release reference count
    if (m_TerrainData->Release())
        sTerrainMgr.UnloadTerrain(m_TerrainData->GetMapId());
}

void Map::LoadMapAndVMap(int gx, int gy)
{
    if (m_bLoadedGrids[gx][gx])
        return;

    GridMap * pInfo = m_TerrainData->Load(gx, gy);
    if (pInfo)
        m_bLoadedGrids[gx][gy] = true;
}

Map::Map(uint32 id, time_t expiry, uint32 InstanceId)
    : i_mapEntry(sMapStorage.LookupEntry<MapEntry>(id)),
      i_id(id), i_InstanceId(InstanceId), m_unloadTimer(0),
      m_VisibleDistance(DEFAULT_VISIBILITY_DISTANCE), m_persistentState(NULL),
      m_activeNonPlayersIter(m_activeNonPlayers.end()), _transportsUpdateIter(_transports.end()),
      i_gridExpiry(expiry), m_TerrainData(sTerrainMgr.LoadTerrain(id)),
      i_data(NULL), i_script_id(0), m_unloading(false), m_crashed(false),
      _processingSendObjUpdates(false), _processingUnitsRelocation(false),
      m_updateFinished(false), m_updateDiffMod(0), m_GridActivationDistance(DEFAULT_VISIBILITY_DISTANCE),
      _lastPlayersUpdate(WorldTimer::getMSTime()), _lastMapUpdate(WorldTimer::getMSTime()),
      _lastCellsUpdate(WorldTimer::getMSTime()), _inactivePlayersSkippedUpdates(0),
      _objUpdatesThreads(0), _unitRelocationThreads(0), _lastPlayerLeftTime(0),
      m_lastMvtSpellsUpdate(0)
{
    m_CreatureGuids.Set(sObjectMgr.GetFirstTemporaryCreatureLowGuid());
    m_GameObjectGuids.Set(sObjectMgr.GetFirstTemporaryGameObjectLowGuid());

    for (unsigned int j = 0; j < MAX_NUMBER_OF_GRIDS; ++j)
    {
        for (unsigned int idx = 0; idx < MAX_NUMBER_OF_GRIDS; ++idx)
        {
            //z code
            m_bLoadedGrids[idx][j] = false;
            setNGrid(NULL, idx, j);
        }
    }

    //lets initialize visibility distance for map
    Map::InitVisibilityDistance();

    //add reference for TerrainData object
    m_TerrainData->AddRef();

    m_persistentState = sMapPersistentStateMgr.AddPersistentState(i_mapEntry, GetInstanceId(), 0, IsDungeon());
    m_persistentState->SetUsedByMapState(this);
}

// Nostalrius
// Active objects system
class ActiveObjectsGridLoader
{
public:
    ActiveObjectsGridLoader(Map* _map) : map(_map) {}
    bool operator()(GameObjectDataPair const& dataPair)
    {
        if (!(dataPair.second.spawnFlags & SPAWN_FLAG_ACTIVE) || dataPair.second.mapid != map->GetId())
            return false;
        // Instanciated continents case
        if (map->IsContinent() && map->GetInstanceId() && map->GetInstanceId() != dataPair.second.instanciatedContinentInstanceId)
            return false;
        Cell c(MaNGOS::ComputeCellPair(dataPair.second.posX, dataPair.second.posY));
        map->LoadGrid(c, true);
        return false;
    }
    bool operator()(CreatureDataPair const& dataPair)
    {
        if (!(dataPair.second.spawnFlags & SPAWN_FLAG_ACTIVE) || dataPair.second.mapid != map->GetId())
            return false;
        // Instanciated continents case
        if (map->IsContinent() && map->GetInstanceId() && map->GetInstanceId() != dataPair.second.instanciatedContinentInstanceId)
            return false;
        Cell c(MaNGOS::ComputeCellPair(dataPair.second.posX, dataPair.second.posY));
        map->LoadGrid(c, true);
        return false;
    }
    Map* map;
};


void Map::SpawnActiveObjects()
{
    if (MapPersistentState* state = GetPersistentState())
        state->InitPools();
    ActiveObjectsGridLoader loader(this);
    sObjectMgr.DoGOData(loader);
    sObjectMgr.DoCreatureData(loader);
}

void Map::InitVisibilityDistance()
{
    //init visibility for continents
    m_VisibleDistance = World::GetMaxVisibleDistanceOnContinents();
    m_GridActivationDistance = World::GetMaxVisibleDistanceOnContinents();
}

// Template specialization of utility methods
template<class T>
void Map::AddToGrid(T* obj, NGridType *grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).template AddGridObject<T>(obj);
}

template<>
void Map::AddToGrid(Player* obj, NGridType *grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).AddWorldObject(obj);
}

template<>
void Map::AddToGrid(Corpse *obj, NGridType *grid, Cell const& cell)
{
    // add to world object registry in grid
    if (obj->GetType() != CORPSE_BONES)
        (*grid)(cell.CellX(), cell.CellY()).AddWorldObject(obj);
    // add to grid object store
    else
        (*grid)(cell.CellX(), cell.CellY()).AddGridObject(obj);
}

template<>
void Map::AddToGrid(Creature* obj, NGridType *grid, Cell const& cell)
{
    // add to world object registry in grid
    if (obj->IsPet())
    {
        (*grid)(cell.CellX(), cell.CellY()).AddWorldObject<Creature>(obj);
        obj->SetCurrentCell(cell);
    }
    // add to grid object store
    else
    {
        (*grid)(cell.CellX(), cell.CellY()).AddGridObject<Creature>(obj);
        obj->SetCurrentCell(cell);
    }
}

template<class T>
void Map::RemoveFromGrid(T* obj, NGridType *grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).template RemoveGridObject<T>(obj);
}

template<>
void Map::RemoveFromGrid(Player* obj, NGridType *grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).RemoveWorldObject(obj);
}

template<>
void Map::RemoveFromGrid(Corpse *obj, NGridType *grid, Cell const& cell)
{
    // remove from world object registry in grid
    if (obj->GetType() != CORPSE_BONES)
        (*grid)(cell.CellX(), cell.CellY()).RemoveWorldObject(obj);
    // remove from grid object store
    else
        (*grid)(cell.CellX(), cell.CellY()).RemoveGridObject(obj);
}

template<>
void Map::RemoveFromGrid(Creature* obj, NGridType *grid, Cell const& cell)
{
    // remove from world object registry in grid
    if (obj->IsPet())
        (*grid)(cell.CellX(), cell.CellY()).RemoveWorldObject<Creature>(obj);
    // remove from grid object store
    else
        (*grid)(cell.CellX(), cell.CellY()).RemoveGridObject<Creature>(obj);
}

void Map::DeleteFromWorld(Player* player)
{
    sObjectAccessor.RemoveObject(player);
    delete player;
}

void
Map::EnsureGridCreated(const GridPair &p)
{
    if (!getNGrid(p.x_coord, p.y_coord))
    {
        setNGrid(new NGridType(p.x_coord * MAX_NUMBER_OF_GRIDS + p.y_coord, p.x_coord, p.y_coord, i_gridExpiry, sWorld.getConfig(CONFIG_BOOL_GRID_UNLOAD)),
                 p.x_coord, p.y_coord);

        // build a linkage between this map and NGridType
        buildNGridLinkage(getNGrid(p.x_coord, p.y_coord));

        getNGrid(p.x_coord, p.y_coord)->SetGridState(GRID_STATE_IDLE);

        //z coord
        int gx = (MAX_NUMBER_OF_GRIDS - 1) - p.x_coord;
        int gy = (MAX_NUMBER_OF_GRIDS - 1) - p.y_coord;
        ASSERT(gx < MAX_NUMBER_OF_GRIDS);
        ASSERT(gy < MAX_NUMBER_OF_GRIDS);

        if (!m_bLoadedGrids[gx][gy])
            LoadMapAndVMap(gx, gy);
    }
}

void
Map::EnsureGridLoadedAtEnter(const Cell &cell, Player *player)
{
    NGridType *grid;

    if (EnsureGridLoaded(cell))
    {
        grid = getNGrid(cell.GridX(), cell.GridY());

        if (player)
            DEBUG_FILTER_LOG(LOG_FILTER_PLAYER_MOVES, "Player %s enter cell[%u,%u] triggers of loading grid[%u,%u] on map %u", player->GetName(), cell.CellX(), cell.CellY(), cell.GridX(), cell.GridY(), i_id);
        else
            DEBUG_FILTER_LOG(LOG_FILTER_PLAYER_MOVES, "Active object nearby triggers of loading grid [%u,%u] on map %u", cell.GridX(), cell.GridY(), i_id);

        ResetGridExpiry(*getNGrid(cell.GridX(), cell.GridY()), 0.1f);
        grid->SetGridState(GRID_STATE_ACTIVE);
    }
    else
        grid = getNGrid(cell.GridX(), cell.GridY());

    if (player)
        AddToGrid(player, grid, cell);
}

bool Map::EnsureGridLoaded(const Cell &cell)
{
    EnsureGridCreated(GridPair(cell.GridX(), cell.GridY()));
    NGridType *grid = getNGrid(cell.GridX(), cell.GridY());

    if (grid == NULL)
    {
        sLog.outInfo("[Map%u][CRASH] Grid [%u:%u] NOT loaded !!", i_id, cell.GridX(), cell.GridY());
        throw new std::string("Crash AT EnsureGridLoaded");
        ASSERT(false);
    }

    if (!isGridObjectDataLoaded(cell.GridX(), cell.GridY()))
    {
        //it's important to set it loaded before loading!
        //otherwise there is a possibility of infinity chain (grid loading will be called many times for the same grid)
        //possible scenario:
        //active object A(loaded with loader.LoadN call and added to the  map)
        //summons some active object B, while B added to map grid loading called again and so on..
        ASSERT(!m_unloading && "Trying to load grid while unloading the whole map !");
        setGridObjectDataLoaded(true, cell.GridX(), cell.GridY());
        ObjectGridLoader loader(*grid, this, cell);
        loader.LoadN();

        // Add resurrectable corpses to world object list in grid
        sObjectAccessor.AddCorpsesToGrid(GridPair(cell.GridX(), cell.GridY()), (*grid)(cell.CellX(), cell.CellY()), this);
        //Balance();
        return true;
    }

    return false;
}

void Map::LoadGrid(const Cell& cell, bool no_unload)
{
    EnsureGridLoaded(cell);

    if (no_unload)
        getNGrid(cell.GridX(), cell.GridY())->setUnloadExplicitLock(true);
}

bool Map::Add(Player *player)
{
    player->GetMapRef().link(this, player);
    player->SetMap(this);

    // update player state for other player and visa-versa
    CellPair p = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());
    Cell cell(p);
    EnsureGridLoadedAtEnter(cell, player);
    player->AddToWorld();
    player->LoadMapCellsAround(GetGridActivationDistance());

    // Order matters! Send the world first, and the player then
    // so that closed doors are closed when the player appears.
    // Send init first    => Can walk through doors at login
    // Send objects first => Can not take quests at relogin
    SendInitTransports(player);
    SendInitSelf(player);
    // Clear m_visibleGUIDs in case 2 players entered a map at the same time,
    // one could stay invisible from the other until re-zoning.
    // Inspired from the TrinityCore way.
    if (player->IsBeingTeleportedFar())
        player->m_visibleGUIDs.clear();
    NGridType* grid = getNGrid(cell.GridX(), cell.GridY());
    player->GetViewPoint().Event_AddedToWorld(&(*grid)(cell.CellX(), cell.CellY()));
    UpdateObjectVisibility(player, cell, p);

    if (i_data)
        i_data->OnPlayerEnter(player);

    // Remove any buffs defined in instance_aura_removal for the new map
    sAuraRemovalMgr.PlayerEnterMap(i_id, player);

    player->GetSession()->ClearIncomingPacketsByType(PACKET_PROCESS_MOVEMENT);
    player->m_broadcaster->SetInstanceId(GetInstanceId());
    return true;
}

void Map::ExistingPlayerLogin(Player* player)
{
    // Reset visibility list
    for (ObjectGuidSet::const_iterator it = player->m_visibleGUIDs.begin(); it != player->m_visibleGUIDs.end(); ++it)
        if (Player* other = GetPlayer(*it))
            other->m_broadcaster->RemoveListener(player);
    player->m_visibleGUIDs.clear();

    SendInitTransports(player);
    SendInitSelf(player);
    CellPair p = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());
    Cell cell(p);
    NGridType* grid = getNGrid(cell.GridX(), cell.GridY());
    player->GetViewPoint().Event_AddedToWorld(&(*grid)(cell.CellX(), cell.CellY()));
    UpdateObjectVisibility(player, cell, p);

    // Refresh aura durations
    for (Unit::SpellAuraHolderMap::const_iterator it = player->GetSpellAuraHolderMap().begin(); it != player->GetSpellAuraHolderMap().end(); ++it)
        it->second->UpdateAuraDuration();
}

template<class T>
void
Map::Add(T *obj)
{
    MANGOS_ASSERT(obj);

    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.outError("Map::Add: Object (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    obj->SetMap(this);

    Cell cell(p);
    if (obj->isActiveObject() && !IsUnloading())
        EnsureGridLoadedAtEnter(cell);
    else
        EnsureGridCreated(GridPair(cell.GridX(), cell.GridY()));

    NGridType *grid = getNGrid(cell.GridX(), cell.GridY());
    MANGOS_ASSERT(grid != NULL);

    AddToGrid(obj, grid, cell);
    obj->AddToWorld();

    if (obj->isActiveObject() && !IsUnloading())
        AddToActive(obj);

    DEBUG_LOG("%s enters grid[%u,%u]", obj->GetObjectGuid().GetString().c_str(), cell.GridX(), cell.GridY());

    obj->GetViewPoint().Event_AddedToWorld(&(*grid)(cell.CellX(), cell.CellY()));
    UpdateObjectVisibility(obj, cell, p);
}

template<>
void Map::Add(Transport* obj)
{
    MANGOS_ASSERT(obj);
    //TODO: Needs clean up. An object should not be added to map twice.
    if (obj->IsInWorld())
        return;

    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.outError("Map::Add: Transport (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return; // Should delete object
    }

    obj->SetMap(this);
    obj->AddToWorld();

    if (obj->isActiveObject() && !IsUnloading())
        AddToActive(obj);

    //DEBUG_LOG("%s enters grid[%u,%u]", obj->GetObjectGuid().GetString().c_str(), cell.GridX(), cell.GridY());

    //obj->GetViewPoint().Event_AddedToWorld(&(*grid)(cell.CellX(), cell.CellY()));
    _transports.insert(obj);

    // Broadcast creation to players
    obj->SendCreateUpdateToMap();

    return;
}

void Map::MessageBroadcast(Player *player, WorldPacket *msg, bool to_self)
{
    CellPair p = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.outError("Map::MessageBroadcast: Player (GUID: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", player->GetGUIDLow(), player->GetPositionX(), player->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    Cell cell(p);
    cell.SetNoCreate();

    if (!loaded(GridPair(cell.data.Part.grid_x, cell.data.Part.grid_y)))
        return;

    MaNGOS::MessageDeliverer post_man(*player, msg, to_self);
    TypeContainerVisitor<MaNGOS::MessageDeliverer, WorldTypeMapContainer > message(post_man);
    cell.Visit(p, message, *this, *player, GetVisibilityDistance());
}

void Map::MessageBroadcast(WorldObject *obj, WorldPacket *msg)
{
    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.outError("Map::MessageBroadcast: Object (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    Cell cell(p);
    cell.SetNoCreate();

    if (!loaded(GridPair(cell.data.Part.grid_x, cell.data.Part.grid_y)))
        return;

    //TODO: currently on continents when Visibility.Distance.InFlight > Visibility.Distance.Continents
    //we have alot of blinking mobs because monster move packet send is broken...
    MaNGOS::ObjectMessageDeliverer post_man(msg);
    TypeContainerVisitor<MaNGOS::ObjectMessageDeliverer, WorldTypeMapContainer > message(post_man);
    cell.Visit(p, message, *this, *obj, GetVisibilityDistance());
}

void Map::MessageDistBroadcast(Player *player, WorldPacket *msg, float dist, bool to_self, bool own_team_only)
{
    CellPair p = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.outError("Map::MessageBroadcast: Player (GUID: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", player->GetGUIDLow(), player->GetPositionX(), player->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    Cell cell(p);
    cell.SetNoCreate();

    if (!loaded(GridPair(cell.data.Part.grid_x, cell.data.Part.grid_y)))
        return;

    MaNGOS::MessageDistDeliverer post_man(*player, msg, dist, to_self, own_team_only);
    TypeContainerVisitor<MaNGOS::MessageDistDeliverer , WorldTypeMapContainer > message(post_man);
    cell.Visit(p, message, *this, *player, dist);
}

void Map::MessageDistBroadcast(WorldObject *obj, WorldPacket *msg, float dist)
{
    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.outError("Map::MessageBroadcast: Object (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    Cell cell(p);
    cell.SetNoCreate();

    if (!loaded(GridPair(cell.data.Part.grid_x, cell.data.Part.grid_y)))
        return;

    MaNGOS::ObjectMessageDistDeliverer post_man(*obj, msg, dist);
    TypeContainerVisitor<MaNGOS::ObjectMessageDistDeliverer, WorldTypeMapContainer > message(post_man);
    cell.Visit(p, message, *this, *obj, dist);
}

bool Map::loaded(const GridPair &p) const
{
    return (getNGrid(p.x_coord, p.y_coord) && isGridObjectDataLoaded(p.x_coord, p.y_coord));
}

void Map::UpdateSync(const uint32 diff)
{
    // Needs to be updated here.
    // Can lead to map <-> map teleports
    for (_transportsUpdateIter = _transports.begin(); _transportsUpdateIter != _transports.end();)
    {
        WorldObject* obj = *_transportsUpdateIter;
        ++_transportsUpdateIter;

        if (!obj->IsInWorld())
            continue;

        obj->Update(diff, diff);
    }
}

inline void Map::UpdateCellsAroundObject(uint32 now, uint32 diff, WorldObject const* object)
{
    if (!object || !object->IsInWorld() || !object->IsPositionValid())
        return;

    MaNGOS::ObjectUpdater updater(diff, now);
    TypeContainerVisitor<MaNGOS::ObjectUpdater, GridTypeMapContainer  > grid_object_update(updater);
    TypeContainerVisitor<MaNGOS::ObjectUpdater, WorldTypeMapContainer > world_object_update(updater);

    //lets update mobs/objects in ALL visible cells around player!
    CellArea area = Cell::CalculateCellArea(object->GetPositionX(), object->GetPositionY(), GetGridActivationDistance());

    for (uint32 x = area.low_bound.x_coord; x <= area.high_bound.x_coord; ++x)
    {
        for (uint32 y = area.low_bound.y_coord; y <= area.high_bound.y_coord; ++y)
        {
            // marked cells are those that have been visited
            // don't visit the same cell twice
            uint32 cell_id = (y * TOTAL_NUMBER_OF_CELLS_PER_MAP) + x;
            if (!isCellMarked(cell_id))
            {
                markCell(cell_id);
                CellPair pair(x, y);
                Cell cell(pair);
                cell.SetNoCreate();
                Visit(cell, grid_object_update);
                Visit(cell, world_object_update);
            }
        }
    }
}

inline void Map::MarkCellsAroundObject(WorldObject const* object)
{
    if (!object || !object->IsInWorld() || !object->IsPositionValid())
        return;

    CellArea area = Cell::CalculateCellArea(object->GetPositionX(), object->GetPositionY(), GetGridActivationDistance());

    for (uint32 x = area.low_bound.x_coord; x <= area.high_bound.x_coord; ++x)
    {
        for (uint32 y = area.low_bound.y_coord; y <= area.high_bound.y_coord; ++y)
        {
            uint32 cell_id = (y * TOTAL_NUMBER_OF_CELLS_PER_MAP) + x;
            markCell(cell_id);
        }
    }
}


inline void Map::UpdateActiveCellsCallback(uint32 diff, uint32 now, uint32 threadId, uint32 totalThreads, uint32 step)
{
    MaNGOS::ObjectUpdater updater(diff, now);
    TypeContainerVisitor<MaNGOS::ObjectUpdater, GridTypeMapContainer  > grid_object_update(updater);
    TypeContainerVisitor<MaNGOS::ObjectUpdater, WorldTypeMapContainer > world_object_update(updater);

    int safeDistCells = sWorld.getConfig(CONFIG_UINT32_MTCELLS_SAFEDISTANCE) / SIZE_OF_GRID_CELL + 1;
    totalThreads *= 2;
    threadId = 2 * threadId + step;
    for (int y = 0; y < TOTAL_NUMBER_OF_CELLS_PER_MAP; ++y)
    {
        // Skip grids not for this thread
        if ((y / safeDistCells) % totalThreads != threadId)
            continue;
        for (int x = 0; x < TOTAL_NUMBER_OF_CELLS_PER_MAP; ++x)
        {
            uint32 cellId = (y * TOTAL_NUMBER_OF_CELLS_PER_MAP) + x;
            if (!isCellMarked(cellId))
                continue;
            CellPair pair(x, y);
            Cell cell(pair);
            cell.SetNoCreate();
            Visit(cell, grid_object_update);
            Visit(cell, world_object_update);
        }
    }
}

class MapAsynchCellsWorker : public ACE_Based::Runnable
{
public:
    MapAsynchCellsWorker(int i, int nthreads, uint32 _diff, uint32 _now, uint32 _step, Map* m) : threadIdx(i), nThreads(nthreads), now(_now), diff(_diff), map(m), step(_step)
    {
    }

    virtual void run()
    {
        map->UpdateActiveCellsCallback(diff, now, threadIdx, nThreads, step);
    }
    int threadIdx;
    int nThreads;
    uint32 diff, now, step;
    Map* map;
};


inline void Map::UpdateActiveCellsAsynch(uint32 now, uint32 diff)
{
    resetMarkedCells();

    // Mark all cells that need update
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
        MarkCellsAroundObject(m_mapRefIter->getSource());

    for (m_activeNonPlayersIter = m_activeNonPlayers.begin(); m_activeNonPlayersIter != m_activeNonPlayers.end(); ++m_activeNonPlayersIter)
        MarkCellsAroundObject(*m_activeNonPlayersIter);

    const int nthreads = sWorld.getConfig(CONFIG_UINT32_MTCELLS_THREADS);
    // Step 1
    std::vector<ACE_Based::Thread*> threads;
    for (int i = 0; i < (nthreads - 1); ++i)
        threads.push_back(new ACE_Based::Thread(new MapAsynchCellsWorker(i, nthreads, diff, now, 0, this)));
    UpdateActiveCellsCallback(diff, now, nthreads-1, nthreads, 0);
    for (int i = 0; i < threads.size(); ++i)
    {
        threads[i]->wait();
        delete threads[i];
    }
    // Step 2
    threads.clear();
    for (int i = 0; i < (nthreads - 1); ++i)
        threads.push_back(new ACE_Based::Thread(new MapAsynchCellsWorker(i, nthreads, diff, now, 1, this)));
    UpdateActiveCellsCallback(diff, now, nthreads-1, nthreads, 1);
    for (int i = 0; i < threads.size(); ++i)
    {
        threads[i]->wait();
        delete threads[i];
    }
}

inline void Map::UpdateActiveCellsSynch(uint32 now, uint32 diff)
{
    resetMarkedCells();
    // the player iterator is stored in the map object
    // to make sure calls to Map::Remove don't invalidate it
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* plr = m_mapRefIter->getSource();
        UpdateCellsAroundObject(now, diff, plr);
    }

    // non-player active objects
    for (m_activeNonPlayersIter = m_activeNonPlayers.begin(); m_activeNonPlayersIter != m_activeNonPlayers.end();)
    {
        // skip not in world
        WorldObject* obj = *m_activeNonPlayersIter;

        // step before processing, in this case if Map::Remove remove next object we correctly
        // step to next-next, and if we step to end() then newly added objects can wait next update.
        ++m_activeNonPlayersIter;
        UpdateCellsAroundObject(now, diff, obj);
    }
}

class UnitsMovementUpdater : public ACE_Based::Runnable
{
public:
    UnitsMovementUpdater(int i, int nthreads, std::set<Unit*>& _updates, uint32 _diff) : threadIdx(i), nThreads(nthreads), updates(_updates), diff(_diff)
    {
    }

    virtual void run()
    {
        int i = 0;
        for (std::set<Unit*>::iterator iter = updates.begin(); iter != updates.end(); ++iter)
            if (((++i) % nThreads) == threadIdx)
                if ((*iter)->IsInWorld())
                    (*iter)->GetMotionMaster()->UpdateMotionAsync(diff);
    }
    int threadIdx;
    int nThreads;
    std::set<Unit*>& updates;
    uint32 diff;
};

inline void Map::UpdateCells(uint32 map_diff)
{
    uint32 now = WorldTimer::getMSTime();
    uint32 diff = WorldTimer::getMSTimeDiff(_lastCellsUpdate, now);
    if (diff < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_UPDATE_CELLS_DIFF))
        return;
    _lastCellsUpdate = now;

    /// update active cells around players and active objects
    if (IsContinent() && sWorld.getConfig(CONFIG_UINT32_MTCELLS_THREADS))
        UpdateActiveCellsAsynch(now, diff);
    else
        UpdateActiveCellsSynch(now, diff);

    int nthreads = sWorld.getConfig(CONFIG_UINT32_CONTINENTS_MOTIONUPDATE_THREADS);
    if (IsContinent() && nthreads)
    {
        std::vector<ACE_Based::Thread*> threads;
        for (int i = 0; i < nthreads; ++i)
            threads.push_back(new ACE_Based::Thread(new UnitsMovementUpdater(i, nthreads, unitsMvtUpdate, diff)));
        for (int i = 0; i < threads.size(); ++i)
        {
            threads[i]->wait();
            delete threads[i];
        }
    }
    unitsMvtUpdate.clear();
}


void Map::ProcessSessionPackets(PacketProcessing type)
{
    uint32 beginTime = WorldTimer::getMSTime();
    /// update worldsessions for existing players
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* plr = m_mapRefIter->getSource();
        if (plr && plr->IsInWorld())
        {
            WorldSession* pSession = plr->GetSession();
            MapSessionFilter updater(pSession);
            updater.SetProcessType(type);
            pSession->ProcessPackets(updater);
        }
    }
    beginTime = WorldTimer::getMSTimeDiffToNow(beginTime);
    if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_PACKETS) && beginTime > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_PACKETS))
        sLog.out(LOG_PERFORMANCE, "Map %u inst %u: %3ums to update packets type %u", GetId(), GetInstanceId(), beginTime, type);
}

void Map::UpdateSessionsMovementAndSpellsIfNeeded()
{
    uint32 now = WorldTimer::getMSTime();
    uint32 diff = WorldTimer::getMSTimeDiff(m_lastMvtSpellsUpdate, now);

    if (diff < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_UPDATE_PACKETS_DIFF))
        return;

    ProcessSessionPackets(PACKET_PROCESS_MOVEMENT);
    ProcessSessionPackets(PACKET_PROCESS_SPELLS);
    m_lastMvtSpellsUpdate = WorldTimer::getMSTime();
}

void Map::UpdatePlayers()
{
    uint32 now = WorldTimer::getMSTime();
    uint32 diff = WorldTimer::getMSTimeDiff(_lastPlayersUpdate, now);

    if (diff < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_UPDATE_PLAYERS_DIFF))
        return;

    ++_inactivePlayersSkippedUpdates;
    bool updateInactivePlayers = _inactivePlayersSkippedUpdates > sWorld.getConfig(CONFIG_UINT32_INACTIVE_PLAYERS_SKIP_UPDATES);
    if (!IsContinent())
        updateInactivePlayers = true;
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* plr = m_mapRefIter->getSource();
        if (!plr || !plr->IsInWorld())
            continue;
        if (!updateInactivePlayers && (!plr->isInCombat() && !plr->GetSession()->HasRecentPacket(PACKET_PROCESS_SPELLS) && !plr->HasScheduledEvent()))
        {
            plr->AddSkippedUpdateTime(diff);
            continue;
        }
        WorldObject::UpdateHelper helper(plr);
        helper.UpdateRealTime(now, diff + plr->GetSkippedUpdateTime());
        plr->ResetSkippedUpdateTime();
    }
    if (updateInactivePlayers)
        _inactivePlayersSkippedUpdates = 0;
    _lastPlayersUpdate = now;
}

void Map::DoUpdate(uint32 maxDiff)
{
    uint32 now = WorldTimer::getMSTime();
    uint32 diff = WorldTimer::getMSTimeDiff(_lastMapUpdate, now);
    if (diff > maxDiff)
        diff = maxDiff;
    _lastMapUpdate = now;
    if (HavePlayers())
        _lastPlayerLeftTime = now;
    Update(diff);
}

void Map::Update(uint32 t_diff)
{
    uint32 updateMapTime = WorldTimer::getMSTime();
    uint32 timeDiff = 0;
    _dynamicTree.update(t_diff);

    ProcessSessionPackets(PACKET_PROCESS_DB_QUERY); // TODO: Move somewhere else ?
    UpdateSessionsMovementAndSpellsIfNeeded();
    /// update worldsessions for existing players
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* plr = m_mapRefIter->getSource();
        if (plr && plr->IsInWorld())
        {
            WorldSession * pSession = plr->GetSession();
            MapSessionFilter updater(pSession);

            pSession->Update(updater);
        }
    }
    uint32 sessionsUpdateTime = WorldTimer::getMSTimeDiffToNow(updateMapTime);

    /// update players at tick
    UpdateSessionsMovementAndSpellsIfNeeded();
    UpdatePlayers();
    uint32 playersUpdateTime = WorldTimer::getMSTimeDiffToNow(updateMapTime) - sessionsUpdateTime;

    UpdateCells(t_diff);
    uint32 activeCellsUpdateTime = WorldTimer::getMSTimeDiffToNow(updateMapTime) - playersUpdateTime - sessionsUpdateTime;

    // Send world objects and item update field changes
    SendObjectUpdates();
    uint32 objectsUpdateTime = WorldTimer::getMSTimeDiffToNow(updateMapTime) - activeCellsUpdateTime - playersUpdateTime - sessionsUpdateTime;

    UpdateVisibilityForRelocations();
    uint32 visibilityUpdateTime = WorldTimer::getMSTimeDiffToNow(updateMapTime) - objectsUpdateTime - activeCellsUpdateTime - playersUpdateTime - sessionsUpdateTime;

    UpdateSessionsMovementAndSpellsIfNeeded();
    UpdatePlayers();
    uint32 playersUpdateTime2 = WorldTimer::getMSTimeDiffToNow(updateMapTime) - objectsUpdateTime - activeCellsUpdateTime - playersUpdateTime - sessionsUpdateTime - visibilityUpdateTime;

    updateMapTime = WorldTimer::getMSTimeDiffToNow(updateMapTime);

    uint32 additionnalWaitTime = 0;
    uint32 additionnalUpdateCounts = 0;
    if (_updateIdx >= 0)
    {
        additionnalWaitTime = WorldTimer::getMSTime();
        sMapMgr.MarkContinentUpdateFinished(_updateIdx);
        while (!sMapMgr.IsContinentUpdateFinished())
        {
            ACE_Based::Thread::Sleep(10);
            if (sMapMgr.IsContinentUpdateFinished())
                break;

            UpdateSessionsMovementAndSpellsIfNeeded();
            UpdatePlayers();
            ++additionnalUpdateCounts;
        }
        additionnalWaitTime = WorldTimer::getMSTimeDiffToNow(additionnalWaitTime);
    }
    // Don't unload grids if it's battleground, since we may have manually added GOs,creatures, those doesn't load from DB at grid re-load !
    // This isn't really bother us, since as soon as we have instanced BG-s, the whole map unloads as the BG gets ended
    if (!IsBattleGround())
    {
        for (GridRefManager<NGridType>::iterator i = GridRefManager<NGridType>::begin(); i != GridRefManager<NGridType>::end();)
        {
            NGridType *grid = i->getSource();
            GridInfo *info = i->getSource()->getGridInfoRef();
            ++i;                                                // The update might delete the map and we need the next map before the iterator gets invalid
            MANGOS_ASSERT(grid->GetGridState() >= 0 && grid->GetGridState() < MAX_GRID_STATE);
            sMapMgr.UpdateGridState(grid->GetGridState(), *this, *grid, *info, grid->getX(), grid->getY(), t_diff);
        }
    }

    ///- Process necessary scripts
    ScriptsProcess();

    if (i_data)
        i_data->Update(t_diff);

    bool packetBroadcastSlow = sWorld.GetBroadcaster()->IsMapSlow(GetInstanceId());
    if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_UPDATE) && updateMapTime > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_UPDATE))
        sLog.out(LOG_PERFORMANCE, "Update single map %3u inst %2u: %3ums "
            "[sess %3ums|players %3ums|cells %3ums|sendObjUpdates %3ums"
            "|relocations %3ums|players2 %3ums|wait%2u %3ums] %s",
            GetId(), GetInstanceId(), updateMapTime,
                 sessionsUpdateTime, playersUpdateTime, activeCellsUpdateTime, objectsUpdateTime,
                 visibilityUpdateTime, playersUpdateTime2, additionnalUpdateCounts, additionnalWaitTime,
                packetBroadcastSlow ? "SLOWBCAST" : "");
    // Continent only
    if (IsContinent())
    {
        if (sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_LOWER_GRID_ACTIVATION_DISTANCE) && updateMapTime > sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_LOWER_GRID_ACTIVATION_DISTANCE))
        {
            --m_GridActivationDistance;
            if (m_GridActivationDistance < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_MIN_GRID_ACTIVATION_DISTANCE))
                m_GridActivationDistance = sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_MIN_GRID_ACTIVATION_DISTANCE);
        }
        else if (sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_INCREASE_GRID_ACTIVATION_DISTANCE) && updateMapTime < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_INCREASE_GRID_ACTIVATION_DISTANCE))
        {
            ++m_GridActivationDistance;
            if (m_GridActivationDistance > World::GetMaxVisibleDistanceOnContinents())
                m_GridActivationDistance = World::GetMaxVisibleDistanceOnContinents();
        }
        if (packetBroadcastSlow ||
            (sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_LOWER_VISIBILITY_DISTANCE) &&
            updateMapTime > sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_LOWER_VISIBILITY_DISTANCE)))
        {
            --m_VisibleDistance;
            if (m_VisibleDistance < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_MIN_VISIBILITY_DISTANCE))
                m_VisibleDistance = sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_MIN_VISIBILITY_DISTANCE);
        }
        else if (sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_INCREASE_VISIBILITY_DISTANCE) && updateMapTime < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_TICK_INCREASE_VISIBILITY_DISTANCE))
        {
            ++m_VisibleDistance;
            if (m_VisibleDistance > World::GetMaxVisibleDistanceOnContinents())
                m_VisibleDistance = World::GetMaxVisibleDistanceOnContinents();
        }
    }
    m_updateFinished = true;
}

void Map::Remove(Player *player, bool remove)
{
    if (i_data)
        i_data->OnPlayerLeave(player);

    if (remove)
        player->CleanupsBeforeDelete();
    else
        player->RemoveFromWorld();

    // this may be called during Map::Update
    // after decrement+unlink, ++m_mapRefIter will continue correctly
    // when the first element of the list is being removed
    // nocheck_prev will return the padding element of the RefManager
    // instead of NULL in the case of prev
    if (m_mapRefIter == player->GetMapRef())
        m_mapRefIter = m_mapRefIter->nocheck_prev();
    player->GetMapRef().unlink();
    CellPair p = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());
    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        // invalid coordinates
        player->ResetMap();

        if (remove)
            DeleteFromWorld(player);

        return;
    }

    Cell cell(p);

    if (!getNGrid(cell.data.Part.grid_x, cell.data.Part.grid_y))
    {
        sLog.outError("Map::Remove() i_grids was NULL x:%d, y:%d", cell.data.Part.grid_x, cell.data.Part.grid_y);
        return;
    }

    DEBUG_FILTER_LOG(LOG_FILTER_PLAYER_MOVES, "Remove player %s from grid[%u,%u]", player->GetName(), cell.GridX(), cell.GridY());
    NGridType *grid = getNGrid(cell.GridX(), cell.GridY());
    MANGOS_ASSERT(grid != NULL);

    RemoveFromGrid(player, grid, cell);

    SendRemoveTransports(player);
    UpdateObjectVisibility(player, cell, p);

    player->ClearUpdateMask(true);
    RemoveRelocatedUnit(player);
    RemoveUnitFromMovementUpdate(player);
    player->m_needUpdateVisibility = false;

    for (ObjectGuidSet::const_iterator it = player->m_visibleGUIDs.begin(); it != player->m_visibleGUIDs.end(); ++it)
        if (Player* other = GetPlayer(*it))
            other->m_broadcaster->RemoveListener(player);

    player->ResetMap();
    if (remove)
        DeleteFromWorld(player);
}

template<class T>
void
Map::Remove(T *obj, bool remove)
{
    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.outError("Map::Remove: Object (GUID: %u TypeId:%u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    Cell cell(p);
    if (!loaded(GridPair(cell.data.Part.grid_x, cell.data.Part.grid_y)))
        return;

    DEBUG_LOG("Remove object (GUID: %u TypeId:%u) from grid[%u,%u]", obj->GetGUIDLow(), obj->GetTypeId(), cell.data.Part.grid_x, cell.data.Part.grid_y);
    NGridType *grid = getNGrid(cell.GridX(), cell.GridY());
    MANGOS_ASSERT(grid != NULL);

    if (obj->isActiveObject())
        RemoveFromActive(obj);

    if (remove)
        obj->CleanupsBeforeDelete();
    else
        obj->RemoveFromWorld();

    UpdateObjectVisibility(obj, cell, p);                   // i think will be better to call this function while object still in grid, this changes nothing but logically is better(as for me)
    RemoveFromGrid(obj, grid, cell);

    obj->ResetMap();
    if (remove)
    {
        // if option set then object already saved at this moment
        if (!sWorld.getConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY))
            obj->SaveRespawnTime();

        // Note: In case resurrectable corpse and pet its removed from global lists in own destructor
        delete obj;
    }
}

template<>
void Map::Remove(Transport* obj, bool remove)
{
    if (obj->isActiveObject())
        RemoveFromActive(obj);
    if (remove)
        obj->CleanupsBeforeDelete();
    else
        obj->RemoveFromWorld();

    obj->SendOutOfRangeUpdateToMap();

    if (_transportsUpdateIter != _transports.end())
    {
        TransportsContainer::iterator itr = _transports.find(obj);
        if (itr == _transports.end())
            return;
        if (itr == _transportsUpdateIter)
            ++_transportsUpdateIter;
        _transports.erase(itr);
    }
    else
        _transports.erase(obj);

    obj->ResetMap();

    if (remove)
    {
        // if option set then object already saved at this moment
        if (!sWorld.getConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY))
            obj->SaveRespawnTime();

        delete obj;
    }
}

void
Map::PlayerRelocation(Player *player, float x, float y, float z, float orientation)
{
    MANGOS_ASSERT(player);

    CellPair old_val = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());
    CellPair new_val = MaNGOS::ComputeCellPair(x, y);

    Cell old_cell(old_val);
    Cell new_cell(new_val);
    bool same_cell = (new_cell == old_cell);

    player->Relocate(x, y, z, orientation);

    if (old_cell.DiffGrid(new_cell) || old_cell.DiffCell(new_cell))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_PLAYER_MOVES, "Player %s relocation grid[%u,%u]cell[%u,%u]->grid[%u,%u]cell[%u,%u]", player->GetName(), old_cell.GridX(), old_cell.GridY(), old_cell.CellX(), old_cell.CellY(), new_cell.GridX(), new_cell.GridY(), new_cell.CellX(), new_cell.CellY());

        NGridType* oldGrid = getNGrid(old_cell.GridX(), old_cell.GridY());
        RemoveFromGrid(player, oldGrid, old_cell);
        if (!old_cell.DiffGrid(new_cell))
            AddToGrid(player, oldGrid, new_cell);
        else
            EnsureGridLoadedAtEnter(new_cell, player);

        NGridType* newGrid = getNGrid(new_cell.GridX(), new_cell.GridY());
        player->GetViewPoint().Event_GridChanged(&(*newGrid)(new_cell.CellX(), new_cell.CellY()));
    }

    player->OnRelocated();

    NGridType* newGrid = getNGrid(new_cell.GridX(), new_cell.GridY());
    if (!same_cell && newGrid->GetGridState() != GRID_STATE_ACTIVE)
    {
        ResetGridExpiry(*newGrid, 0.1f);
        newGrid->SetGridState(GRID_STATE_ACTIVE);
    }
}


void Map::DoPlayerGridRelocation(Player *player, float x, float y, float z, float orientation)
{
    MANGOS_ASSERT(player);

    CellPair old_val = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());
    CellPair new_val = MaNGOS::ComputeCellPair(x, y);

    Cell old_cell(old_val);
    Cell new_cell(new_val);
    bool same_cell = (new_cell == old_cell);

    if (old_cell.DiffGrid(new_cell) || old_cell.DiffCell(new_cell))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_PLAYER_MOVES, "Player %s relocation grid[%u,%u]cell[%u,%u]->grid[%u,%u]cell[%u,%u]", player->GetName(), old_cell.GridX(), old_cell.GridY(), old_cell.CellX(), old_cell.CellY(), new_cell.GridX(), new_cell.GridY(), new_cell.CellX(), new_cell.CellY());

        NGridType* oldGrid = getNGrid(old_cell.GridX(), old_cell.GridY());
        RemoveFromGrid(player, oldGrid, old_cell);
        if (!old_cell.DiffGrid(new_cell))
            AddToGrid(player, oldGrid, new_cell);
        else
            EnsureGridLoadedAtEnter(new_cell, player);

        NGridType* newGrid = getNGrid(new_cell.GridX(), new_cell.GridY());
        player->GetViewPoint().Event_GridChanged(&(*newGrid)(new_cell.CellX(), new_cell.CellY()));
    }

    NGridType* newGrid = getNGrid(new_cell.GridX(), new_cell.GridY());
    if (!same_cell && newGrid->GetGridState() != GRID_STATE_ACTIVE)
    {
        ResetGridExpiry(*newGrid, 0.1f);
        newGrid->SetGridState(GRID_STATE_ACTIVE);
    }
}

void Map::CreatureRelocation(Creature *creature, float x, float y, float z, float ang)
{
    MANGOS_ASSERT(CheckGridIntegrity(creature, false));

    Cell old_cell = creature->GetCurrentCell();
    Cell new_cell(MaNGOS::ComputeCellPair(x, y));

    // do move or do move to respawn or remove creature if previous all fail
    if (CreatureCellRelocation(creature, new_cell))
    {
        // update pos
        creature->Relocate(x, y, z, ang);
        creature->OnRelocated();
    }
    // if creature can't be move in new cell/grid (not loaded) move it to repawn cell/grid
    // creature coordinates will be updated and notifiers send
    else if (!CreatureRespawnRelocation(creature))
    {
        // ... or unload (if respawn grid also not loaded)
        DEBUG_FILTER_LOG(LOG_FILTER_CREATURE_MOVES, "Creature (GUID: %u Entry: %u ) can't be move to unloaded respawn grid.", creature->GetGUIDLow(), creature->GetEntry());
    }

    MANGOS_ASSERT(CheckGridIntegrity(creature, true));
}

bool Map::CreatureCellRelocation(Creature *c, Cell new_cell)
{
    Cell const& old_cell = c->GetCurrentCell();
    if (old_cell.DiffGrid(new_cell))
    {
        if ((!c->isActiveObject() || IsUnloading()) && !loaded(new_cell.gridPair()))
        {
            DEBUG_FILTER_LOG(LOG_FILTER_CREATURE_MOVES, "Creature (GUID: %u Entry: %u) attempt move from grid[%u,%u]cell[%u,%u] to unloaded grid[%u,%u]cell[%u,%u].", c->GetGUIDLow(), c->GetEntry(), old_cell.GridX(), old_cell.GridY(), old_cell.CellX(), old_cell.CellY(), new_cell.GridX(), new_cell.GridY(), new_cell.CellX(), new_cell.CellY());
            return false;
        }
        EnsureGridLoadedAtEnter(new_cell);
    }

    if (old_cell != new_cell)
    {
        DEBUG_FILTER_LOG(LOG_FILTER_CREATURE_MOVES, "Creature (GUID: %u Entry: %u) moved in grid[%u,%u] from cell[%u,%u] to cell[%u,%u].", c->GetGUIDLow(), c->GetEntry(), old_cell.GridX(), old_cell.GridY(), old_cell.CellX(), old_cell.CellY(), new_cell.CellX(), new_cell.CellY());
        NGridType* oldGrid = getNGrid(old_cell.GridX(), old_cell.GridY());
        NGridType* newGrid = getNGrid(new_cell.GridX(), new_cell.GridY());
        RemoveFromGrid(c, oldGrid, old_cell);
        AddToGrid(c, newGrid, new_cell);
        c->GetViewPoint().Event_GridChanged(&(*newGrid)(new_cell.CellX(), new_cell.CellY()));
    }
    return true;
}

bool Map::CreatureRespawnRelocation(Creature *c, bool forGridUnload)
{
    float resp_x, resp_y, resp_z, resp_o;
    c->GetRespawnCoord(resp_x, resp_y, resp_z, &resp_o);

    CellPair resp_val = MaNGOS::ComputeCellPair(resp_x, resp_y);
    Cell resp_cell(resp_val);

    // in some AI EnterEvadeMode() calls a relocation
    if (forGridUnload)
        c->AI()->EnterEvadeMode();
    c->GetMotionMaster()->Clear();

    DEBUG_FILTER_LOG(LOG_FILTER_CREATURE_MOVES, "Creature (GUID: %u Entry: %u) will moved from grid[%u,%u]cell[%u,%u] to respawn grid[%u,%u]cell[%u,%u].", c->GetGUIDLow(), c->GetEntry(), c->GetCurrentCell().GridX(), c->GetCurrentCell().GridY(), c->GetCurrentCell().CellX(), c->GetCurrentCell().CellY(), resp_cell.GridX(), resp_cell.GridY(), resp_cell.CellX(), resp_cell.CellY());

    // teleport it to respawn point (like normal respawn if player see)
    if (CreatureCellRelocation(c, resp_cell))
    {
        c->Relocate(resp_x, resp_y, resp_z, resp_o);
        c->GetMotionMaster()->Initialize();                 // prevent possible problems with default move generators
        c->OnRelocated();
        return true;
    }
    else
        return false;
}

bool Map::UnloadGrid(const uint32 &x, const uint32 &y, bool pForce)
{
    NGridType *grid = getNGrid(x, y);
    MANGOS_ASSERT(grid != NULL);

    {
        if (!pForce && ActiveObjectsNearGrid(x, y))
            return false;

        DEBUG_LOG("Unloading grid[%u,%u] for map %u", x, y, i_id);
        ObjectGridUnloader unloader(*grid);

        // Finish remove and delete all creatures with delayed remove before moving to respawn grids
        // Must know real mob position before move
        RemoveAllObjectsInRemoveList();

        // move creatures to respawn grids if this is diff.grid or to remove list
        unloader.MoveToRespawnN();

        // Finish remove and delete all creatures with delayed remove before unload
        RemoveAllObjectsInRemoveList();

        unloader.UnloadN();
        delete getNGrid(x, y);
        setNGrid(NULL, x, y);
    }

    int gx = (MAX_NUMBER_OF_GRIDS - 1) - x;
    int gy = (MAX_NUMBER_OF_GRIDS - 1) - y;

    // unload GridMap - it is reference-countable so will be deleted safely when lockCount < 1
    // also simply set Map's pointer to corresponding GridMap object to NULL
    if (m_bLoadedGrids[gx][gy])
    {
        m_bLoadedGrids[gx][gy] = false;
        m_TerrainData->Unload(gx, gy);
    }

    DEBUG_LOG("Unloading grid[%u,%u] for map %u finished", x, y, i_id);
    return true;
}

void Map::UnloadAll(bool pForce)
{
    m_unloading = true;
    for (GridRefManager<NGridType>::iterator i = GridRefManager<NGridType>::begin(); i != GridRefManager<NGridType>::end();)
    {
        NGridType &grid(*i->getSource());
        ++i;
        UnloadGrid(grid.getX(), grid.getY(), pForce);       // deletes the grid and removes it from the GridRefManager
    }
    for (TransportsContainer::iterator itr = _transports.begin(); itr != _transports.end();)
    {
        Transport* transport = *itr;
        ++itr;

        Remove<Transport>(transport, true);
    }
}

bool Map::CheckGridIntegrity(Creature* c, bool moved) const
{
    Cell const& cur_cell = c->GetCurrentCell();

    CellPair xy_val = MaNGOS::ComputeCellPair(c->GetPositionX(), c->GetPositionY());
    Cell xy_cell(xy_val);
    if (xy_cell != cur_cell)
    {
        sLog.outError("Creature (GUIDLow: %u) X: %f Y: %f (%s) in grid[%u,%u]cell[%u,%u] instead grid[%u,%u]cell[%u,%u]",
                      c->GetGUIDLow(),
                      c->GetPositionX(), c->GetPositionY(), (moved ? "final" : "original"),
                      cur_cell.GridX(), cur_cell.GridY(), cur_cell.CellX(), cur_cell.CellY(),
                      xy_cell.GridX(),  xy_cell.GridY(),  xy_cell.CellX(),  xy_cell.CellY());
        return true;                                        // not crash at error, just output error in debug mode
    }

    return true;
}

const char* Map::GetMapName() const
{
    return i_mapEntry ? i_mapEntry->name : "UNNAMEDMAP\x0";
}

void Map::UpdateObjectVisibility(WorldObject* obj, Cell cell, CellPair cellpair)
{
    // Update visibility of objects in cells within draw distance
    cell.SetNoCreate();
    MaNGOS::VisibleChangesNotifier notifier(*obj);
    TypeContainerVisitor<MaNGOS::VisibleChangesNotifier, WorldTypeMapContainer > player_notifier(notifier);
    cell.Visit(cellpair, player_notifier, *this, *obj, GetVisibilityDistance());

    // Update visibility of active objects within the map.
    // Important performance note: if continents are not instantiated
    // the list of active objects can be large (~360 total in the world)
    if (Player *player = obj->ToPlayer())
        UpdateActiveObjectVisibility(player);
}

void Map::UpdateActiveObjectVisibility(Player *player)
{
    // Params for compressed data set - will only be compressed if packet size > 100 (multiple units)
    ObjectGuidSet guids;
    UpdateData data;
    std::set<WorldObject*> visibleNow;

    UpdateActiveObjectVisibility(player, guids, data, visibleNow);

    if (data.HasData())
        data.Send(player->GetSession());
}

// Not compressed
void Map::UpdateActiveObjectVisibility(Player *player, ObjectGuidSet &visibleGuids)
{
    for (m_activeNonPlayersIter = m_activeNonPlayers.begin(); m_activeNonPlayersIter != m_activeNonPlayers.end();)
    {
        WorldObject *obj = *m_activeNonPlayersIter;
        if (obj->IsInWorld())
        {
            player->UpdateVisibilityOf(player->GetCamera().GetBody(), obj);
            visibleGuids.erase(obj->GetObjectGuid());
        }

        ++m_activeNonPlayersIter;
    }
}

// Support for compressed data packet
void Map::UpdateActiveObjectVisibility(Player *player, ObjectGuidSet &visibleGuids, UpdateData &data, std::set<WorldObject*> &visibleNow)
{
    for (m_activeNonPlayersIter = m_activeNonPlayers.begin(); m_activeNonPlayersIter != m_activeNonPlayers.end();)
    {
        WorldObject *obj = *m_activeNonPlayersIter;
        if (obj->IsInWorld())
        {
            // TODO: Why is this templated? Why not just base class WorldObject for the target...?
            player->UpdateVisibilityOf(player->GetCamera().GetBody(), obj, data, visibleNow);
            visibleGuids.erase(obj->GetObjectGuid());
        }

        ++m_activeNonPlayersIter;
    }
}

void Map::SendInitSelf(Player * player)
{
    DETAIL_LOG("Creating player data for himself %u", player->GetGUIDLow());

    UpdateData data;

    bool hasTransport = false;

    // attach to player data current transport data
    if (Transport* transport = player->GetTransport())
    {
        hasTransport = true;
        transport->BuildCreateUpdateBlockForPlayer(&data, player);
    }

    // build data for self presence in world at own client (one time for map)
    player->BuildCreateUpdateBlockForPlayer(&data, player);

    // build other passengers at transport also (they always visible and marked as visible and will not send at visibility update at add to map
    if (Transport* transport = player->GetTransport())
        for (Transport::PassengerSet::const_iterator itr = transport->GetPassengers().begin(); itr != transport->GetPassengers().end(); ++itr)
            if (player != (*itr) && player->IsInVisibleList(*itr))
            {
                hasTransport = true;
                (*itr)->BuildCreateUpdateBlockForPlayer(&data, player);
            }

    data.Send(player->GetSession(), hasTransport);
}

void Map::SendInitTransports(Player * player)
{
    // Hack to send out transports
    UpdateData transData;
    bool hasTransport = false;
    for (TransportsContainer::const_iterator i = _transports.begin(); i != _transports.end(); ++i)
        if (*i != player->GetTransport())
        {
            hasTransport = true;
            (*i)->BuildCreateUpdateBlockForPlayer(&transData, player);
        }

    transData.Send(player->GetSession(), hasTransport);
}

void Map::SendRemoveTransports(Player * player)
{
    // Hack to send out transports
    UpdateData transData;
    bool hasTransport = false;
    for (TransportsContainer::const_iterator i = _transports.begin(); i != _transports.end(); ++i)
        if (*i != player->GetTransport())
        {
            hasTransport = true;
            (*i)->BuildOutOfRangeUpdateBlock(&transData);
        }

    transData.Send(player->GetSession(), hasTransport);
}

inline void Map::setNGrid(NGridType *grid, uint32 x, uint32 y)
{
    if (x >= MAX_NUMBER_OF_GRIDS || y >= MAX_NUMBER_OF_GRIDS)
    {
        sLog.outError("map::setNGrid() Invalid grid coordinates found: %d, %d!", x, y);
        MANGOS_ASSERT(false);
    }
    i_grids[x][y] = grid;
}

void Map::AddObjectToRemoveList(WorldObject *obj)
{
    MANGOS_ASSERT(obj->GetMapId() == GetId() && obj->GetInstanceId() == GetInstanceId());

    obj->CleanupsBeforeDelete();                            // remove or simplify at least cross referenced links
    i_objectsToRemove_lock.acquire();
    i_objectsToRemove.insert(obj);
    i_objectsToRemove_lock.release();
}

void Map::RemoveAllObjectsInRemoveList()
{
    if (i_objectsToRemove.empty())
        return;

    i_objectsToRemove_lock.acquire();
    while (!i_objectsToRemove.empty())
    {
        WorldObject* obj = *i_objectsToRemove.begin();
        i_objectsToRemove.erase(i_objectsToRemove.begin());

        switch (obj->GetTypeId())
        {
            case TYPEID_CORPSE:
            {
                Corpse* corpse = GetCorpse(obj->GetObjectGuid());
                if (!corpse)
                    sLog.outError("Try delete corpse/bones %u that not in map", obj->GetGUIDLow());
                else
                    Remove(corpse, true);
                break;
            }
            case TYPEID_DYNAMICOBJECT:
                Remove((DynamicObject*)obj, true);
                break;
            case TYPEID_GAMEOBJECT:
            {
                GameObject* go = obj->ToGameObject();
                if (Transport* transport = go->ToTransport())
                    Remove(transport, true);
                else
                    Remove(go, true);
                break;
            }
            case TYPEID_UNIT:
                Remove((Creature*)obj, true);
                break;
            default:
                sLog.outError("Non-grid object (TypeId: %u) in grid object removing list, ignored.", obj->GetTypeId());
                break;
        }
    }
    i_objectsToRemove_lock.release();
}

uint32 Map::GetPlayersCountExceptGMs() const
{
    uint32 count = 0;
    for (MapRefManager::const_iterator itr = m_mapRefManager.begin(); itr != m_mapRefManager.end(); ++itr)
        if (!itr->getSource()->isGameMaster())
            ++count;
    return count;
}

void Map::SendToPlayers(WorldPacket const* data) const
{
    for (MapRefManager::const_iterator itr = m_mapRefManager.begin(); itr != m_mapRefManager.end(); ++itr)
        itr->getSource()->GetSession()->SendPacket(data);
}

bool Map::ActiveObjectsNearGrid(uint32 x, uint32 y) const
{
    MANGOS_ASSERT(x < MAX_NUMBER_OF_GRIDS);
    MANGOS_ASSERT(y < MAX_NUMBER_OF_GRIDS);

    CellPair cell_min(x * MAX_NUMBER_OF_CELLS, y * MAX_NUMBER_OF_CELLS);
    CellPair cell_max(cell_min.x_coord + MAX_NUMBER_OF_CELLS, cell_min.y_coord + MAX_NUMBER_OF_CELLS);

    //we must find visible range in cells so we unload only non-visible cells...
    float viewDist = GetVisibilityDistance();
    int cell_range = (int)ceilf(viewDist / SIZE_OF_GRID_CELL) + 1;

    cell_min << cell_range;
    cell_min -= cell_range;
    cell_max >> cell_range;
    cell_max += cell_range;

    for (MapRefManager::const_iterator iter = m_mapRefManager.begin(); iter != m_mapRefManager.end(); ++iter)
    {
        Player* plr = iter->getSource();

        CellPair p = MaNGOS::ComputeCellPair(plr->GetPositionX(), plr->GetPositionY());
        if ((cell_min.x_coord <= p.x_coord && p.x_coord <= cell_max.x_coord) &&
                (cell_min.y_coord <= p.y_coord && p.y_coord <= cell_max.y_coord))
            return true;
    }

    for (ActiveNonPlayers::const_iterator iter = m_activeNonPlayers.begin(); iter != m_activeNonPlayers.end(); ++iter)
    {
        WorldObject* obj = *iter;

        CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
        if ((cell_min.x_coord <= p.x_coord && p.x_coord <= cell_max.x_coord) &&
                (cell_min.y_coord <= p.y_coord && p.y_coord <= cell_max.y_coord))
            return true;
    }

    return false;
}

void Map::AddToActive(WorldObject* obj)
{
    m_activeNonPlayers.insert(obj);

    // also not allow unloading spawn grid to prevent creating creature clone at load
    if (obj->GetTypeId() == TYPEID_UNIT)
    {
        Creature* c = (Creature*)obj;

        if (!c->IsPet() && c->HasStaticDBSpawnData())
        {
            float x, y, z;
            c->GetRespawnCoord(x, y, z);
            GridPair p = MaNGOS::ComputeGridPair(x, y);
            if (getNGrid(p.x_coord, p.y_coord))
                getNGrid(p.x_coord, p.y_coord)->incUnloadActiveLock();
            else
            {
                GridPair p2 = MaNGOS::ComputeGridPair(c->GetPositionX(), c->GetPositionY());
                sLog.outError("Active creature (GUID: %u Entry: %u) added to grid[%u,%u] but spawn grid[%u,%u] not loaded.",
                              c->GetGUIDLow(), c->GetEntry(), p.x_coord, p.y_coord, p2.x_coord, p2.y_coord);
            }
        }
    }
}

void Map::RemoveFromActive(WorldObject* obj)
{
    // Map::Update for active object in proccess. Only erase and dec grid active lock if the
    // obj is actually active
    ActiveNonPlayers::iterator itr = m_activeNonPlayers.find(obj);
    if (itr != m_activeNonPlayers.end())
    {
        if (m_activeNonPlayersIter != m_activeNonPlayers.end() && itr == m_activeNonPlayersIter)
            ++m_activeNonPlayersIter;

        m_activeNonPlayers.erase(itr);


        // also allow unloading spawn grid
        if (obj->GetTypeId() == TYPEID_UNIT)
        {
            Creature* c = (Creature*)obj;

            if (!c->IsPet() && c->HasStaticDBSpawnData())
            {
                float x, y, z;
                c->GetRespawnCoord(x, y, z);
                GridPair p = MaNGOS::ComputeGridPair(x, y);
                if (getNGrid(p.x_coord, p.y_coord))
                    getNGrid(p.x_coord, p.y_coord)->decUnloadActiveLock();
                else
                {
                    GridPair p2 = MaNGOS::ComputeGridPair(c->GetPositionX(), c->GetPositionY());
                    sLog.outError("Active creature (GUID: %u Entry: %u) removed from grid[%u,%u] but spawn grid[%u,%u] not loaded.",
                        c->GetGUIDLow(), c->GetEntry(), p.x_coord, p.y_coord, p2.x_coord, p2.y_coord);
                }
            }
        }
    }
}

void Map::CreateInstanceData(bool load)
{
    if (i_data)
        return;

    if (!i_mapEntry->scriptId)
        return;

    i_script_id = i_mapEntry->scriptId;

    i_data = sScriptMgr.CreateInstanceData(this);
    if (!i_data)
        return;

    if (load)
    {
        // TODO: make a global storage for this
        QueryResult* result;

        if (Instanceable())
            result = CharacterDatabase.PQuery("SELECT data FROM instance WHERE id = '%u'", i_InstanceId);
        else
            result = CharacterDatabase.PQuery("SELECT data FROM world WHERE map = '%u'", GetId());

        if (result)
        {
            Field* fields = result->Fetch();
            const char* data = fields[0].GetString();
            if (data)
            {
                DEBUG_LOG("Loading instance data for `%s` (Map: %u Instance: %u)", sScriptMgr.GetScriptName(i_script_id), GetId(), i_InstanceId);
                i_data->Load(data);
            }
            else
                i_data->Create();

            delete result;
        }
        else
        {
            // for non-instanceable map always add data to table if not found, later code expected that for map in `word` exist always after load
            if (!Instanceable())
                CharacterDatabase.PExecute("INSERT INTO world VALUES ('%u', '')", GetId());
            i_data->Create();
        }
    }
    else
    {
        DEBUG_LOG("New instance data, \"%s\" ,initialized!", sScriptMgr.GetScriptName(i_script_id));
        i_data->Initialize();
        i_data->Create();
    }
}

void Map::TeleportAllPlayersToHomeBind()
{
    while (HavePlayers())
    {
        if (Player* plr = m_mapRefManager.getFirst()->getSource())
        {
            // Teleport to specified location and removes the player from this map (if the map exists).
            plr->TeleportToHomebind();
            // just in case, remove the player from the list explicitly here as well to prevent a possible infinite loop
            // note that this remove is not needed if the code works well in other places
            plr->GetMapRef().unlink();
        }
    }
}

template void Map::Add(Corpse *);
template void Map::Add(Creature *);
template void Map::Add(GameObject *);
template void Map::Add(DynamicObject *);

template void Map::Remove(Corpse *, bool);
template void Map::Remove(Creature *, bool);
template void Map::Remove(GameObject *, bool);
template void Map::Remove(DynamicObject *, bool);

/* ******* World Maps ******* */

WorldPersistentState* WorldMap::GetPersistanceState() const
{
    return dynamic_cast<WorldPersistentState*>(Map::GetPersistentState());
}

/* ******* Dungeon Instance Maps ******* */

DungeonMap::DungeonMap(uint32 id, time_t expiry, uint32 InstanceId)
    : Map(id, expiry, InstanceId),
      m_resetAfterUnload(false), m_unloadWhenEmpty(false)
{
    MANGOS_ASSERT(i_mapEntry->IsDungeon());

    //lets initialize visibility distance for dungeons
    DungeonMap::InitVisibilityDistance();

    // the timer is started by default, and stopped when the first player joins
    // this make sure it gets unloaded if for some reason no player joins
    m_unloadTimer = std::max(sWorld.getConfig(CONFIG_UINT32_INSTANCE_UNLOAD_DELAY), (uint32)MIN_UNLOAD_DELAY);
}

DungeonMap::~DungeonMap()
{
}

void DungeonMap::InitVisibilityDistance()
{
    //init visibility distance for instances
    m_VisibleDistance = World::GetMaxVisibleDistanceInInstances();
    m_GridActivationDistance = World::GetMaxVisibleDistanceInInstances();
}

/*
    Do map specific checks to see if the player can enter
*/
bool DungeonMap::CanEnter(Player *player)
{
    if (player->GetMapRef().getTarget() == this)
    {
        sLog.outError("InstanceMap::CanEnter - player %s(%u) already in map %d,%d!", player->GetName(), player->GetGUIDLow(), GetId(), GetInstanceId());
        MANGOS_ASSERT(false);
        return false;
    }

    // cannot enter if the instance is full (player cap), GMs don't count
    uint32 maxPlayers = GetMaxPlayers();
    if (!player->isGameMaster() && GetPlayersCountExceptGMs() >= maxPlayers)
    {
        DETAIL_LOG("MAP: Instance '%u' of map '%s' cannot have more than '%u' players. Player '%s' rejected", GetInstanceId(), GetMapName(), maxPlayers, player->GetName());
        player->SendTransferAborted(GetId(), TRANSFER_ABORT_MAX_PLAYERS);
        return false;
    }

    if (m_resetAfterUnload)
    {
        sLog.outInfo("[DungeonReset] %s attempted to enter map %u, instance %u during reset", player->GetName(), i_InstanceId);
        return false;
    }

    // cannot enter while players in the instance are in combat
    Group *pGroup = player->GetGroup();
    if (pGroup && pGroup->InCombatToInstance(GetInstanceId()) && player->isAlive() && player->GetMapId() != GetId())
    {
		
        if (GetId() == 249 || GetId() == 531 || GetId() == 533)        // Hack : Ustaag <Nostalrius> : concerne uniquement Onyxia's Lair
        {
            player->SendTransferAborted(GetId(), TRANSFER_ABORT_ZONE_IN_COMBAT);
            return false;
        }
    }

    return Map::CanEnter(player);
}

/*
    Do map specific checks and add the player to the map if successful.
*/
bool DungeonMap::Add(Player *player)
{
    // TODO: Not sure about checking player level: already done in HandleAreaTriggerOpcode
    // GMs still can teleport player in instance.
    // Is it needed?

    if (!CanEnter(player))
        return false;

    // check for existing instance binds
    InstancePlayerBind *playerBind = player->GetBoundInstance(GetId());
    if (playerBind && playerBind->perm)
    {
        // cannot enter other instances if bound permanently
        if (playerBind->state != GetPersistanceState())
        {
            sLog.outError("InstanceMap::Add: player %s(%d) is permanently bound to instance %d,%d,%d,%d,%d but he is being put in instance %d,%d,%d,%d,%d",
                          player->GetName(), player->GetGUIDLow(), playerBind->state->GetMapId(),
                          playerBind->state->GetInstanceId(),
                          playerBind->state->GetPlayerCount(), playerBind->state->GetGroupCount(),
                          playerBind->state->CanReset(),
                          GetPersistanceState()->GetMapId(), GetPersistanceState()->GetInstanceId(),
                          GetPersistanceState()->GetPlayerCount(),
                          GetPersistanceState()->GetGroupCount(), GetPersistanceState()->CanReset());
            MANGOS_ASSERT(false);
        }
    }
    else
    {
        Group *pGroup = player->GetGroup();
        if (pGroup)
        {
            // solo saves should be reset when entering a group
            InstanceGroupBind *groupBind = pGroup->GetBoundInstance(GetId());
            if (playerBind)
            {
                sLog.outError("InstanceMap::Add: %s is being put in instance %d,%d,%d,%d,%d but he is in group (Id: %d) and is bound to instance %d,%d,%d,%d,%d!",
                              player->GetObjectGuid().GetString().c_str(), playerBind->state->GetMapId(), playerBind->state->GetInstanceId(),
                              playerBind->state->GetPlayerCount(), playerBind->state->GetGroupCount(),
                              playerBind->state->CanReset(), pGroup->GetId(),
                              playerBind->state->GetMapId(), playerBind->state->GetInstanceId(),
                              playerBind->state->GetPlayerCount(), playerBind->state->GetGroupCount(), playerBind->state->CanReset());

                if (groupBind)
                    sLog.outError("InstanceMap::Add: the group (Id: %d) is bound to instance %d,%d,%d,%d,%d",
                                  pGroup->GetId(),
                                  groupBind->state->GetMapId(), groupBind->state->GetInstanceId(),
                                  groupBind->state->GetPlayerCount(), groupBind->state->GetGroupCount(), groupBind->state->CanReset());

                // no reason crash if we can fix state
                player->UnbindInstance(GetId());
            }

            // bind to the group or keep using the group save
            if (!groupBind)
                pGroup->BindToInstance(GetPersistanceState(), false);
            else
            {
                // cannot jump to a different instance without resetting it
                if (groupBind->state != GetPersistentState())
                {
                    sLog.outError("InstanceMap::Add: %s is being put in instance %d,%d but he is in group (Id: %d) which is bound to instance %d,%d!",
                                  player->GetObjectGuid().GetString().c_str(), GetPersistentState()->GetMapId(),
                                  GetPersistentState()->GetInstanceId(),
                                  pGroup->GetId(), groupBind->state->GetMapId(),
                                  groupBind->state->GetInstanceId());

                    sLog.outError("MapSave players: %d, group count: %d",
                                  GetPersistanceState()->GetPlayerCount(), GetPersistanceState()->GetGroupCount());

                    if (groupBind->state)
                        sLog.outError("GroupBind save players: %d, group count: %d", groupBind->state->GetPlayerCount(), groupBind->state->GetGroupCount());
                    else
                        sLog.outError("GroupBind save NULL");
                    MANGOS_ASSERT(false);
                }
                // if the group/leader is permanently bound to the instance
                // players also become permanently bound when they enter
                if (groupBind->perm)
                {
                    WorldPacket data(SMSG_INSTANCE_SAVE_CREATED, 4);
                    data << uint32(0);
                    player->GetSession()->SendPacket(&data);
                    player->BindToInstance(GetPersistanceState(), true);
                }
            }
        }
        else
        {
            // set up a solo bind or continue using it
            if (!playerBind)
                player->BindToInstance(GetPersistanceState(), false);
            else
                // cannot jump to a different instance without resetting it
                MANGOS_ASSERT(playerBind->state == GetPersistentState());
        }
    }

    // for normal instances cancel the reset schedule when the
    // first player enters (no players yet)
    SetResetSchedule(false);
    player->AddInstanceEnterTime(GetInstanceId(), time(NULL));

    DETAIL_LOG("MAP: Player '%s' is entering instance '%u' of map '%s'", player->GetName(), GetInstanceId(), GetMapName());
    // initialize unload state
    m_unloadTimer = 0;
    m_resetAfterUnload = false;
    m_unloadWhenEmpty = false;

    // this will acquire the same mutex so it cannot be in the previous block
    Map::Add(player);

    return true;
}

void DungeonMap::Update(uint32 t_diff)
{
    Map::Update(t_diff);
}

void DungeonMap::Remove(Player *player, bool remove)
{
    DETAIL_LOG("MAP: Removing player '%s' from instance '%u' of map '%s' before relocating to other map", player->GetName(), GetInstanceId(), GetMapName());

    //if last player set unload timer
    if (!m_unloadTimer && m_mapRefManager.getSize() == 1)
        m_unloadTimer = m_unloadWhenEmpty ? MIN_UNLOAD_DELAY : std::max(sWorld.getConfig(CONFIG_UINT32_INSTANCE_UNLOAD_DELAY), (uint32)MIN_UNLOAD_DELAY);

    Map::Remove(player, remove);

    // for normal instances schedule the reset after all players have left
    SetResetSchedule(true);
}

/*
    Returns true if there are no players in the instance
*/
bool DungeonMap::Reset(InstanceResetMethod method)
{
    // note: since the map may not be loaded when the instance needs to be reset
    // the instance must be deleted from the DB by InstanceSaveManager

    if (HavePlayers())
    {
        if (method == INSTANCE_RESET_ALL)
        {
            // notify the players to leave the instance so it can be reset
            for (MapRefManager::iterator itr = m_mapRefManager.begin(); itr != m_mapRefManager.end(); ++itr)
                itr->getSource()->SendResetFailedNotify(GetId());
        }
        else
        {
            if (method == INSTANCE_RESET_GLOBAL)
            {
                // set the homebind timer for players inside (1 minute)
                for (MapRefManager::iterator itr = m_mapRefManager.begin(); itr != m_mapRefManager.end(); ++itr)
                    itr->getSource()->m_InstanceValid = false;
            }

            // the unload timer is not started
            // instead the map will unload immediately after the players have left
            m_unloadWhenEmpty = true;
            m_resetAfterUnload = true;
        }
    }
    else
    {
        // unloaded at next update
        m_unloadTimer = MIN_UNLOAD_DELAY;
        m_resetAfterUnload = true;
    }

    return m_mapRefManager.isEmpty();
}

void DungeonMap::PermBindAllPlayers(Player *player)
{
    Group *group = player->GetGroup();
    // group members outside the instance group don't get bound
    for (MapRefManager::iterator itr = m_mapRefManager.begin(); itr != m_mapRefManager.end(); ++itr)
    {
        Player* plr = itr->getSource();
        // players inside an instance cannot be bound to other instances
        // some players may already be permanently bound, in this case nothing happens
        InstancePlayerBind *bind = plr->GetBoundInstance(GetId());
        if (!bind || !bind->perm)
        {
            plr->BindToInstance(GetPersistanceState(), true);
            WorldPacket data(SMSG_INSTANCE_SAVE_CREATED, 4);
            data << uint32(0);
            plr->GetSession()->SendPacket(&data);
        }

        // if the leader is not in the instance the group will not get a perm bind
        if (group && group->GetLeaderGuid() == plr->GetObjectGuid())
            group->BindToInstance(GetPersistanceState(), true);
    }
}

void DungeonMap::UnloadAll(bool pForce)
{
    if (HavePlayers())
    {
        sLog.outError("DungeonMap::UnloadAll: there are still players in the instance at unload, should not happen!");
        MapRefManager::iterator itr = m_mapRefManager.begin();
        while (itr != m_mapRefManager.end())
        {
            Player* plr = itr->getSource();
            ASSERT(plr->GetHomeBindMap() != GetId());
            plr->TeleportToHomebind();
            itr = m_mapRefManager.begin();
        }
    }

    if (m_resetAfterUnload == true)
        GetPersistanceState()->DeleteRespawnTimesAndData();

    Map::UnloadAll(pForce);
}

void DungeonMap::SendResetWarnings(uint32 timeLeft) const
{
    for (MapRefManager::const_iterator itr = m_mapRefManager.begin(); itr != m_mapRefManager.end(); ++itr)
        itr->getSource()->SendInstanceResetWarning(GetId(), timeLeft);
}

void DungeonMap::SetResetSchedule(bool on)
{
    // only for normal instances
    // the reset time is only scheduled when there are no players inside
    // it is assumed that the reset time will rarely (if ever) change while the reset is scheduled
    ASSERT(GetPersistanceState()->GetInstanceId() == GetInstanceId());
    ASSERT(GetPersistanceState()->GetMapId() == GetId());
    if (!HavePlayers() && !IsRaid())
        sMapPersistentStateMgr.GetScheduler().ScheduleReset(on, GetPersistanceState()->GetResetTime(), DungeonResetEvent(RESET_EVENT_NORMAL_DUNGEON, GetId(), GetInstanceId()));
}

uint32 DungeonMap::GetMaxPlayers() const
{
    return i_mapEntry->maxPlayers;
}

DungeonPersistentState* DungeonMap::GetPersistanceState() const
{
    return dynamic_cast<DungeonPersistentState*>(Map::GetPersistentState());
}


/* ******* Battleground Instance Maps ******* */

BattleGroundMap::BattleGroundMap(uint32 id, time_t expiry, uint32 InstanceId)
    : Map(id, expiry, InstanceId), m_bg(NULL)
{
    //lets initialize visibility distance for BG
    BattleGroundMap::InitVisibilityDistance();
}

BattleGroundMap::~BattleGroundMap()
{
}

void BattleGroundMap::Update(uint32 diff)
{
    if (!GetBG())
        return;
    Map::Update(diff);

    GetBG()->Update(diff);
}

BattleGroundPersistentState* BattleGroundMap::GetPersistanceState() const
{
    return dynamic_cast<BattleGroundPersistentState*>(Map::GetPersistentState());
}


void BattleGroundMap::InitVisibilityDistance()
{
    //init visibility distance for BG
    m_VisibleDistance = World::GetMaxVisibleDistanceInBG();
    m_GridActivationDistance = World::GetMaxVisibleDistanceInBG();
}

bool BattleGroundMap::CanEnter(Player * player)
{
    if (player->GetMapRef().getTarget() == this)
    {
        sLog.outError("BGMap::CanEnter - player %u already in map!", player->GetGUIDLow());
        MANGOS_ASSERT(false);
        return false;
    }

    if (player->GetBattleGroundId() != GetInstanceId())
        return false;

    // player number limit is checked in bgmgr, no need to do it here

    return Map::CanEnter(player);
}

bool BattleGroundMap::Add(Player * player)
{
    if (!CanEnter(player))
        return false;

    // reset instance validity, battleground maps do not homebind
    player->m_InstanceValid = true;

    return Map::Add(player);
}

void BattleGroundMap::Remove(Player *player, bool remove)
{
    DETAIL_LOG("MAP: Removing player '%s' from bg '%u' of map '%s' before relocating to other map", player->GetName(), GetInstanceId(), GetMapName());
    Map::Remove(player, remove);
}

void BattleGroundMap::SetUnload()
{
    m_unloadTimer = MIN_UNLOAD_DELAY;
}

void BattleGroundMap::UnloadAll(bool pForce)
{
    while (HavePlayers())
    {
        if (Player * plr = m_mapRefManager.getFirst()->getSource())
        {
            plr->TeleportTo(plr->GetBattleGroundEntryPoint());
            // TeleportTo removes the player from this map (if the map exists) -> calls BattleGroundMap::Remove -> invalidates the iterator.
            // just in case, remove the player from the list explicitly here as well to prevent a possible infinite loop
            // note that this remove is not needed if the code works well in other places
            plr->GetMapRef().unlink();
        }
    }

    Map::UnloadAll(pForce);
}

/// Put scripts in the execution queue
void Map::ScriptsStart(ScriptMapMap const& scripts, uint32 id, Object* source, Object* target)
{
    ///- Find the script map
    ScriptMapMap::const_iterator s = scripts.find(id);
    if (s == scripts.end())
        return;

    // prepare static data
    ObjectGuid sourceGuid = source->GetObjectGuid();
    ObjectGuid targetGuid = target ? target->GetObjectGuid() : ObjectGuid();
    ObjectGuid ownerGuid  = source->isType(TYPEMASK_ITEM) ? ((Item*)source)->GetOwnerGuid() : ObjectGuid();

    ///- Schedule script execution for all scripts in the script map
    ScriptMap const *s2 = &(s->second);
    bool immedScript = false;
    m_scriptSchedule_lock.acquire();
    for (ScriptMap::const_iterator iter = s2->begin(); iter != s2->end(); ++iter)
    {
        ScriptAction sa;
        sa.sourceGuid = sourceGuid;
        sa.targetGuid = targetGuid;
        sa.ownerGuid  = ownerGuid;

        sa.script = &iter->second;
        m_scriptSchedule.insert(ScriptScheduleMap::value_type(time_t(sWorld.GetGameTime() + iter->first), sa));
        if (iter->first == 0)
            immedScript = true;

        sScriptMgr.IncreaseScheduledScriptsCount();
    }
    m_scriptSchedule_lock.release();
}

void Map::ScriptCommandStart(ScriptInfo const& script, uint32 delay, Object* source, Object* target)
{
    // NOTE: script record _must_ exist until command executed

    // prepare static data
    ObjectGuid sourceGuid = source->GetObjectGuid();
    ObjectGuid targetGuid = target ? target->GetObjectGuid() : ObjectGuid();
    ObjectGuid ownerGuid  = source->isType(TYPEMASK_ITEM) ? ((Item*)source)->GetOwnerGuid() : ObjectGuid();

    ScriptAction sa;
    sa.sourceGuid = sourceGuid;
    sa.targetGuid = targetGuid;
    sa.ownerGuid  = ownerGuid;

    sa.script = &script;
    m_scriptSchedule_lock.acquire();
    m_scriptSchedule.insert(ScriptScheduleMap::value_type(time_t(sWorld.GetGameTime() + delay), sa));
    sScriptMgr.IncreaseScheduledScriptsCount();
    m_scriptSchedule_lock.release();
}

/// Process queued scripts
void Map::ScriptsProcess()
{
    m_scriptSchedule_lock.acquire();
    if (m_scriptSchedule.empty())
    {
        m_scriptSchedule_lock.release();
        return;
    }

    ///- Process overdue queued scripts
    ScriptScheduleMap::iterator iter = m_scriptSchedule.begin();
    // ok as multimap is a *sorted* associative container
    while (!m_scriptSchedule.empty() && (iter->first <= sWorld.GetGameTime()))
    {
        ScriptAction step = iter->second;
        m_scriptSchedule_lock.release();

        Object* source = NULL;

        if (step.sourceGuid)
        {
            switch (step.sourceGuid.GetHigh())
            {
                case HIGHGUID_ITEM:
                    // case HIGHGUID_CONTAINER: ==HIGHGUID_ITEM
                {
                    if (Player* player = HashMapHolder<Player>::Find(step.ownerGuid))
                        source = player->GetItemByGuid(step.sourceGuid);
                    break;
                }
                case HIGHGUID_UNIT:
                    source = GetCreature(step.sourceGuid);
                    break;
                case HIGHGUID_PET:
                    source = GetPet(step.sourceGuid);
                    break;
                case HIGHGUID_PLAYER:
                    source = HashMapHolder<Player>::Find(step.sourceGuid);
                    break;
                case HIGHGUID_GAMEOBJECT:
                    source = GetGameObject(step.sourceGuid);
                    break;
                case HIGHGUID_CORPSE:
                    source = HashMapHolder<Corpse>::Find(step.sourceGuid);
                    break;
                default:
                    sLog.outError("*_script source with unsupported guid %s", step.sourceGuid.GetString().c_str());
                    break;
            }
        }

        if (source && !source->IsInWorld())
            source = NULL;

        Object* target = NULL;

        if (step.targetGuid)
        {
            switch (step.targetGuid.GetHigh())
            {
                case HIGHGUID_UNIT:
                    target = GetCreature(step.targetGuid);
                    break;
                case HIGHGUID_PET:
                    target = GetPet(step.targetGuid);
                    break;
                case HIGHGUID_PLAYER:
                    target = HashMapHolder<Player>::Find(step.targetGuid);
                    break;
                case HIGHGUID_GAMEOBJECT:
                    target = GetGameObject(step.targetGuid);
                    break;
                case HIGHGUID_CORPSE:
                    target = HashMapHolder<Corpse>::Find(step.targetGuid);
                    break;
                default:
                    sLog.outError("*_script target with unsupported guid %s", step.targetGuid.GetString().c_str());
                    break;
            }
        }

        if (target && !target->IsInWorld())
            target = NULL;

        switch (step.script->command)
        {
            case SCRIPT_COMMAND_TALK:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_TALK (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_TALK (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pBuddy = NULL;

                // flag_target_player_as_source     0x01
                // flag_original_source_as_target   0x02
                // flag_buddy_as_target             0x04

                // If target is player (and not already the source) but should be the source
                if (target && target->GetTypeId() == TYPEID_PLAYER && step.script->talk.flags & 0x01)
                {
                    if (source->GetTypeId() != TYPEID_PLAYER)
                        pSource = (WorldObject*)target;
                }

                // If step has a buddy entry defined, search for it.
                if (step.script->talk.creatureEntry)
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->talk.creatureEntry, true, step.script->talk.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pBuddy, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->talk.searchRadius);
                }

                // If buddy found, then use it
                if (pBuddy)
                {
                    // pBuddy can be target of talk
                    if (step.script->talk.flags & 0x04)
                        target = (Object*)pBuddy;
                    else
                    {
                        // If not target of talk, then set pBuddy as source
                        // Useless when source is already flagged to be player, and should maybe produce error.
                        if (!(step.script->talk.flags & 0x01))
                            pSource = (WorldObject*)pBuddy;
                    }
                }

                // If we should talk to the original source instead of target
                if (step.script->talk.flags & 0x02)
                    target = source;

                Unit* unitTarget = target && target->isType(TYPEMASK_UNIT) ? static_cast<Unit*>(target) : NULL;
                int32 textId = step.script->talk.textId[0];

                // May have text for random
                if (step.script->talk.textId[1])
                {
                    int i = 2;
                    for (; i < MAX_TEXT_ID; ++i)
                    {
                        if (!step.script->talk.textId[i])
                            break;
                    }

                    // Use one random
                    textId = step.script->talk.textId[rand() % i];
                }

                switch (step.script->talk.chatType)
                {
                    case CHAT_TYPE_SAY:
                        pSource->MonsterSay(textId, step.script->talk.language, unitTarget);
                        break;
                    case CHAT_TYPE_YELL:
                        pSource->MonsterYell(textId, step.script->talk.language, unitTarget);
                        break;
                    case CHAT_TYPE_TEXT_EMOTE:
                        pSource->MonsterTextEmote(textId, unitTarget);
                        break;
                    case CHAT_TYPE_BOSS_EMOTE:
                        pSource->MonsterTextEmote(textId, unitTarget, true);
                        break;
                    case CHAT_TYPE_WHISPER:
                        if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        {
                            sLog.outError("SCRIPT_COMMAND_TALK (script id %u) attempt to whisper (%u) to %s, skipping.", step.script->id, step.script->talk.chatType, unitTarget ? unitTarget->GetGuidStr().c_str() : "<no target>");
                            break;
                        }
                        pSource->MonsterWhisper(textId, unitTarget);
                        break;
                    case CHAT_TYPE_BOSS_WHISPER:
                        if (!unitTarget || unitTarget->GetTypeId() != TYPEID_PLAYER)
                        {
                            sLog.outError("SCRIPT_COMMAND_TALK (script id %u) attempt to whisper (%u) to %s, skipping.", step.script->id, step.script->talk.chatType, unitTarget ? unitTarget->GetGuidStr().c_str() : "<no target>");
                            break;
                        }
                        pSource->MonsterWhisper(textId, unitTarget, true);
                        break;
                    case CHAT_TYPE_ZONE_YELL:
                        pSource->MonsterYellToZone(textId, step.script->talk.language, unitTarget);
                        break;
                    default:
                        break;                              // must be already checked at load
                }
                break;
            }
            case SCRIPT_COMMAND_EMOTE:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_EMOTE (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_EMOTE (script id %u) call for non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }
                // When creatureEntry is not defined, GameObject can not be source
                else if (!step.script->emote.creatureEntry)
                {
                    if (!source->isType(TYPEMASK_UNIT))
                    {
                        sLog.outError("SCRIPT_COMMAND_EMOTE (script id %u) are missing datalong2 (creature entry). Unsupported call for non-unit (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                        break;
                    }
                }

                WorldObject* pSource = (WorldObject*)source;
                
                // flag_target_as_source            0x01

                // If target is Unit* and should do the emote (or should be source of searcher below)
                if (target && target->isType(TYPEMASK_UNIT) && step.script->emote.flags & 0x01)
                {
                    pSource = (WorldObject*)target;
                }
                // Step has flag SCRIPT_FLAG_BUDDY_BY_GUID, so we look for the creature with guid as defined in searchRadius
                else if (step.script->emote.flags & 0x10) 
                {
                    pSource = pSource->GetMap()->GetCreature(ObjectGuid(HIGHGUID_UNIT, step.script->emote.creatureEntry, step.script->emote.searchRadius));
                    if (!pSource)
                    {
                        sLog.outError("SCRIPT_COMMAND_EMOTE (script id %u) had flag SCRIPT_FLAG_BUDDY_BY_GUID, but could not find buddy with entry %u, guid %u", step.script->id, step.script->emote.creatureEntry, step.script->emote.searchRadius);
                        break;
                    }
                }
                // If step has a buddy entry defined, but not flag SCRIPT_FLAG_BUDDY_BY_GUID, search for it.
                else if (step.script->emote.creatureEntry)
                {
                    Creature* pBuddy = NULL;
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->emote.creatureEntry, true, step.script->emote.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pBuddy, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->emote.searchRadius);

                    // If buddy found, then use it or break (break since we must assume pBuddy was defined for a reason)
                    if (pBuddy)
                        pSource = (WorldObject*)pBuddy;
                    else
                        break;
                }
                
                // find the emote
                std::vector<uint32> emotes;
                emotes.push_back(step.script->emote.emoteId);
                for (int i = 0; i < MAX_EMOTE_ID; ++i)
                {
                    if (!step.script->emote.randomEmotes[i])
                        continue;
                    emotes.push_back(uint32(step.script->emote.randomEmotes[i]));
                }

                // Must be safe cast to Unit*
                ((Unit*)pSource)->HandleEmote(emotes[urand(0, emotes.size() - 1)]);
                break;
            }
            case SCRIPT_COMMAND_FIELD_SET:
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_FIELD_SET (script id %u) call for NULL object.", step.script->id);
                    break;
                }

                if (step.script->setField.fieldId <= OBJECT_FIELD_ENTRY || step.script->setField.fieldId >= source->GetValuesCount())
                {
                    sLog.outError("SCRIPT_COMMAND_FIELD_SET (script id %u) call for wrong field %u (max count: %u) in object (TypeId: %u).",
                                  step.script->id, step.script->setField.fieldId, source->GetValuesCount(), source->GetTypeId());
                    break;
                }

                source->SetUInt32Value(step.script->setField.fieldId, step.script->setField.fieldValue);
                break;
            case SCRIPT_COMMAND_MOVE_TO:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_MOVE_TO (script id %u) call for NULL creature.", step.script->id);
                    break;
                }

                if (source->GetTypeId() != TYPEID_UNIT)
                {
                    sLog.outError("SCRIPT_COMMAND_MOVE_TO (script id %u) call for non-creature (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                Unit * unit = (Unit*)source;
                if (step.script->moveTo.travelTime != 0)
                {
                    float speed = unit->GetDistance(step.script->x, step.script->y, step.script->z) / ((float)step.script->moveTo.travelTime * 0.001f);
                    unit->MonsterMoveWithSpeed(step.script->x, step.script->y, step.script->z, speed);
                }
                else
                    unit->GetMotionMaster()->MovePoint(0, step.script->x, step.script->y, step.script->z, MOVE_PATHFINDING);
                break;
            }
            case SCRIPT_COMMAND_FLAG_SET:
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_FLAG_SET (script id %u) call for NULL object.", step.script->id);
                    break;
                }
                if (step.script->setFlag.fieldId <= OBJECT_FIELD_ENTRY || step.script->setFlag.fieldId >= source->GetValuesCount())
                {
                    sLog.outError("SCRIPT_COMMAND_FLAG_SET (script id %u) call for wrong field %u (max count: %u) in object (TypeId: %u).",
                                  step.script->id, step.script->setFlag.fieldId, source->GetValuesCount(), source->GetTypeId());
                    break;
                }

                source->SetFlag(step.script->setFlag.fieldId, step.script->setFlag.fieldValue);
                break;
            case SCRIPT_COMMAND_FLAG_REMOVE:
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_FLAG_REMOVE (script id %u) call for NULL object.", step.script->id);
                    break;
                }
                if (step.script->removeFlag.fieldId <= OBJECT_FIELD_ENTRY || step.script->removeFlag.fieldId >= source->GetValuesCount())
                {
                    sLog.outError("SCRIPT_COMMAND_FLAG_REMOVE (script id %u) call for wrong field %u (max count: %u) in object (TypeId: %u).",
                                  step.script->id, step.script->removeFlag.fieldId, source->GetValuesCount(), source->GetTypeId());
                    break;
                }

                source->RemoveFlag(step.script->removeFlag.fieldId, step.script->removeFlag.fieldValue);
                break;
            case SCRIPT_COMMAND_TELEPORT_TO:
            {
                // accept player in any one from target/source arg
                if (!target && !source)
                {
                    sLog.outError("SCRIPT_COMMAND_TELEPORT_TO (script id %u) call for NULL object.", step.script->id);
                    break;
                }

                // must be only Player
                if ((!target || target->GetTypeId() != TYPEID_PLAYER) && (!source || source->GetTypeId() != TYPEID_PLAYER))
                {
                    sLog.outError("SCRIPT_COMMAND_TELEPORT_TO (script id %u) call for non-player (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
                    break;
                }

                Player* pSource = target && target->GetTypeId() == TYPEID_PLAYER ? (Player*)target : (Player*)source;

                pSource->TeleportTo(step.script->teleportTo.mapId, step.script->x, step.script->y, step.script->z, step.script->o);
                break;
            }
            case SCRIPT_COMMAND_QUEST_EXPLORED:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!target)
                {
                    sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for NULL target.", step.script->id);
                    break;
                }

                // when script called for item spell casting then target == (unit or GO) and source is player
                WorldObject* worldObject;
                Player* player;

                if (target->GetTypeId() == TYPEID_PLAYER)
                {
                    if (source->GetTypeId() != TYPEID_UNIT && source->GetTypeId() != TYPEID_GAMEOBJECT && source->GetTypeId() != TYPEID_PLAYER)
                    {
                        sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for non-creature, non-gameobject or non-player (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                        break;
                    }

                    worldObject = (WorldObject*)source;
                    player = (Player*)target;
                }
                else
                {
                    if (target->GetTypeId() != TYPEID_UNIT && target->GetTypeId() != TYPEID_GAMEOBJECT && target->GetTypeId() != TYPEID_PLAYER)
                    {
                        sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for non-creature, non-gameobject or non-player (TypeId: %u), skipping.", step.script->id, target->GetTypeId());
                        break;
                    }

                    if (source->GetTypeId() != TYPEID_PLAYER)
                    {
                        sLog.outError("SCRIPT_COMMAND_QUEST_EXPLORED (script id %u) call for non-player (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                        break;
                    }

                    worldObject = (WorldObject*)target;
                    player = (Player*)source;
                }

                // quest id and flags checked at script loading
                if ((worldObject->GetTypeId() != TYPEID_UNIT || ((Unit*)worldObject)->isAlive()) &&
                        (step.script->questExplored.distance == 0 || worldObject->IsWithinDistInMap(player, float(step.script->questExplored.distance))))
                    player->AreaExploredOrEventHappens(step.script->questExplored.questId);
                else
                    player->FailQuest(step.script->questExplored.questId);

                break;
            }
            case SCRIPT_COMMAND_KILL_CREDIT:
            {
                // accept player in any one from target/source arg
                if (!target && !source)
                {
                    sLog.outError("SCRIPT_COMMAND_KILL_CREDIT (script id %u) call for NULL object.", step.script->id);
                    break;
                }

                // must be only Player
                if ((!target || target->GetTypeId() != TYPEID_PLAYER) && (!source || source->GetTypeId() != TYPEID_PLAYER))
                {
                    sLog.outError("SCRIPT_COMMAND_KILL_CREDIT (script id %u) call for non-player (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
                    break;
                }

                Player* pSource = target && target->GetTypeId() == TYPEID_PLAYER ? (Player*)target : (Player*)source;

                if (step.script->killCredit.isGroupCredit)
                    pSource->RewardPlayerAndGroupAtEvent(step.script->killCredit.creatureEntry, pSource);
                else
                    pSource->KilledMonsterCredit(step.script->killCredit.creatureEntry);

                break;
            }
            case SCRIPT_COMMAND_RESPAWN_GAMEOBJECT:
            {
                if (!step.script->respawnGo.goGuid)         // checked at load
                    break;

                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) call for NULL world object.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) call for non-WorldObject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* summoner = (WorldObject*)source;
                if (!summoner->IsInWorld())
                {
                    sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) call for non-in-world WorldObject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                int32 time_to_despawn = step.script->respawnGo.despawnDelay < 5 ? 5 : step.script->respawnGo.despawnDelay;

                uint32 guidlow = step.script->respawnGo.goGuid;
                GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
                if (!goData)
                    break;                                  // checked at load

                GameObject *go = summoner->GetMap()->GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
                if (!go)
                {
                    sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) failed for gameobject(guid: %u).", step.script->id, guidlow);
                    break;
                }

                if (go->GetGoType() == GAMEOBJECT_TYPE_FISHINGNODE ||
                        go->GetGoType() == GAMEOBJECT_TYPE_DOOR        ||
                        go->GetGoType() == GAMEOBJECT_TYPE_BUTTON      ||
                        go->GetGoType() == GAMEOBJECT_TYPE_TRAP)
                {
                    sLog.outError("SCRIPT_COMMAND_RESPAWN_GAMEOBJECT (script id %u) can not be used with gameobject of type %u (guid: %u).", step.script->id, uint32(go->GetGoType()), step.script->respawnGo.goGuid);
                    break;
                }

                if (go->isSpawned())
                    break;                                  //gameobject already spawned

                go->SetLootState(GO_READY);
                go->SetRespawnTime(time_to_despawn);        //despawn object in ? seconds

                go->GetMap()->Add(go);
                break;
            }
            case SCRIPT_COMMAND_TEMP_SUMMON_CREATURE:
            {
                if (!step.script->summonCreature.creatureEntry)
                {
                    sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (script id %u) call for NULL creature.", step.script->id);
                    break;
                }

                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (script id %u) call for NULL world object.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON_CREATURE (script id %u) call for non-WorldObject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* summoner = (WorldObject*)source;

                float x = step.script->x;
                float y = step.script->y;
                float z = step.script->z;
                float o = step.script->o;

                if (step.script->summonCreature.flags & SUMMON_CREATURE_UNIQUE || step.script->summonCreature.flags & SUMMON_CREATURE_UNIQUE_TEMP)
                {
                    float dist = step.script->summonCreature.uniqueDistance ? step.script->summonCreature.uniqueDistance : (summoner->GetDistance(x, y, z) + 50.0f) * 2;
                    std::list<Creature*> foundCreatures;

                    GetCreatureListWithEntryInGrid(foundCreatures, summoner, step.script->summonCreature.creatureEntry, dist);

                    if (!foundCreatures.empty())
                    {
                        uint32 exAmount = 0;
                        uint32 reqAmount = step.script->summonCreature.uniqueLimit ? step.script->summonCreature.uniqueLimit : 1;

                        if (step.script->summonCreature.flags & SUMMON_CREATURE_UNIQUE)
                            exAmount = foundCreatures.size();
                        else
                            exAmount = count_if(foundCreatures.begin(), foundCreatures.end(), [&](Creature* c) { return c->IsTemporarySummon(); });

                        if (exAmount >= reqAmount)
                            break;
                    }
                }

                float orientation = o;
                
                if ((step.script->summonCreature.facingLogic == 1) || (step.script->summonCreature.facingLogic == 2))
                {
                    WorldObject* facingTarget = ((step.script->summonCreature.facingLogic == 2) && target && target->isType(TYPEMASK_WORLDOBJECT)) ? (WorldObject*)target : summoner;

                    float dx = facingTarget->GetPositionX() - x;
                    float dy = facingTarget->GetPositionY() - y;

                    orientation = atan2(dy, dx);
                    orientation = (orientation >= 0) ? orientation : 2 * M_PI_F + orientation;
                }

                Creature* pCreature = summoner->SummonCreature(step.script->summonCreature.creatureEntry, x, y, z, orientation,
                    TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, step.script->summonCreature.despawnDelay, step.script->summonCreature.flags & SUMMON_CREATURE_ACTIVE);

                if (!pCreature)
                {
                    sLog.outError("SCRIPT_COMMAND_TEMP_SUMMON (script id %u) failed for creature (entry: %u).", step.script->id, step.script->summonCreature.creatureEntry);
                    break;
                }

                if (step.script->summonCreature.setRun == 1)
                    pCreature->SetWalk(false);

                break;
            }
            case SCRIPT_COMMAND_OPEN_DOOR:
            {
                if (!step.script->openDoor.goGuid)          // checked at load
                    break;

                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) call for NULL unit.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_UNIT))         // must be any Unit (creature or player)
                {
                    sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) call for non-unit (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                Unit* caster = (Unit*)source;
                if (!caster->IsInWorld())
                {
                    sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) call for non-in-world unit (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                int32 time_to_close = step.script->openDoor.resetDelay < 3 ? 3 : step.script->openDoor.resetDelay; // Ustaag <Nostalrius> : duree minimale de reset fixee a 3 sec au lieu de 15

                uint32 guidlow = step.script->openDoor.goGuid;
                GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
                if (!goData)                                // checked at load
                    break;

                GameObject *door = caster->GetMap()->GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
                if (!door)
                {
                    sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) failed for gameobject(guid: %u).", step.script->id, step.script->openDoor.goGuid);
                    break;
                }

                if (door->GetGoType() != GAMEOBJECT_TYPE_DOOR)
                {
                    sLog.outError("SCRIPT_COMMAND_OPEN_DOOR (script id %u) failed for non-door(GoType: %u).", step.script->id, door->GetGoType());
                    break;
                }

                if (door->GetGoState() != GO_STATE_READY)
                    break;                                  //door already  open

                door->UseDoorOrButton(time_to_close);

                if (target && target->isType(TYPEMASK_GAMEOBJECT) && ((GameObject*)target)->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
                    ((GameObject*)target)->UseDoorOrButton(time_to_close);

                break;
            }
            case SCRIPT_COMMAND_CLOSE_DOOR:
            {
                if (!step.script->closeDoor.goGuid)         // checked at load
                    break;

                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) call for NULL unit.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_UNIT))         // must be any Unit (creature or player)
                {
                    sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) call for non-unit (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                Unit* caster = (Unit*)source;
                if (!caster->IsInWorld())
                {
                    sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) call for non-in-world unit (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                int32 time_to_open = step.script->closeDoor.resetDelay < 3 ? 3 : step.script->closeDoor.resetDelay; // Ustaag <Nostalrius> : duree minimale de reset fixee a 3 sec au lieu de 15

                uint32 guidlow = step.script->closeDoor.goGuid;
                GameObjectData const* goData = sObjectMgr.GetGOData(guidlow);
                if (!goData)                                // checked at load
                    break;

                GameObject *door = caster->GetMap()->GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, goData->id, guidlow));
                if (!door)
                {
                    sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) failed for gameobject(guid: %u).", step.script->id, guidlow);
                    break;
                }
                if (door->GetGoType() != GAMEOBJECT_TYPE_DOOR)
                {
                    sLog.outError("SCRIPT_COMMAND_CLOSE_DOOR (script id %u) failed for non-door(GoType: %u).", step.script->id, door->GetGoType());
                    break;
                }

                if (door->GetGoState() == GO_STATE_READY)
                    break;                                  //door already closed

                door->UseDoorOrButton(time_to_open);

                if (target && target->isType(TYPEMASK_GAMEOBJECT) && ((GameObject*)target)->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
                    ((GameObject*)target)->UseDoorOrButton(time_to_open);

                break;
            }
            case SCRIPT_COMMAND_ACTIVATE_OBJECT:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT must have source caster.");
                    break;
                }

                if (!source->isType(TYPEMASK_UNIT))
                {
                    sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT source caster isn't unit (TypeId: %u), skipping.", source->GetTypeId());
                    break;
                }

                if (!target)
                {
                    sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT call for NULL gameobject.");
                    break;
                }

                if (target->GetTypeId() != TYPEID_GAMEOBJECT)
                {
                    sLog.outError("SCRIPT_COMMAND_ACTIVATE_OBJECT call for non-gameobject (TypeId: %u), skipping.", target->GetTypeId());
                    break;
                }

                Unit* caster = (Unit*)source;

                GameObject *go = (GameObject*)target;

                go->Use(caster);
                break;
            }
            case SCRIPT_COMMAND_REMOVE_AURA:
            {
                Object* cmdTarget = step.script->removeAura.isSourceTarget ? source : target;

                if (!cmdTarget)
                {
                    sLog.outError("SCRIPT_COMMAND_REMOVE_AURA (script id %u) call for NULL %s.", step.script->id, step.script->removeAura.isSourceTarget ? "source" : "target");
                    break;
                }

                if (!cmdTarget->isType(TYPEMASK_UNIT))
                {
                    sLog.outError("SCRIPT_COMMAND_REMOVE_AURA (script id %u) %s isn't unit (TypeId: %u), skipping.", step.script->id, step.script->removeAura.isSourceTarget ? "source" : "target", cmdTarget->GetTypeId());
                    break;
                }

                ((Unit*)cmdTarget)->RemoveAurasDueToSpell(step.script->removeAura.spellId);
                break;
            }
            case SCRIPT_COMMAND_CAST_SPELL:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_CAST_SPELL (script id %u) must have source caster.", step.script->id);
                    break;
                }

                Object* cmdTarget = step.script->castSpell.flags & 0x01 ? source : target;

                if (!cmdTarget)
                {
                    sLog.outError("SCRIPT_COMMAND_CAST_SPELL (script id %u) call for NULL %s.", step.script->id, step.script->castSpell.flags & 0x01 ? "source" : "target");
                    break;
                }

                if (!cmdTarget->isType(TYPEMASK_UNIT))
                {
                    sLog.outError("SCRIPT_COMMAND_CAST_SPELL (script id %u) %s isn't unit (TypeId: %u), skipping.", step.script->id, step.script->castSpell.flags & 0x01 ? "source" : "target", cmdTarget->GetTypeId());
                    break;
                }

                Unit* spellTarget = (Unit*)cmdTarget;

                Object* cmdSource = step.script->castSpell.flags & 0x02 ? target : source;

                if (!cmdSource)
                {
                    sLog.outError("SCRIPT_COMMAND_CAST_SPELL (script id %u) call for NULL %s.", step.script->id, step.script->castSpell.flags & 0x02 ? "target" : "source");
                    break;
                }

                if (!cmdSource->isType(TYPEMASK_UNIT))
                {
                    sLog.outError("SCRIPT_COMMAND_CAST_SPELL (script id %u) %s isn't unit (TypeId: %u), skipping.", step.script->id, step.script->castSpell.flags & 0x02 ? "target" : "source", cmdSource->GetTypeId());
                    break;
                }

                Unit* spellSource = (Unit*)cmdSource;

                //TODO: when GO cast implemented, code below must be updated accordingly to also allow GO spell cast
                spellSource->CastSpell(spellTarget, step.script->castSpell.spellId, (step.script->castSpell.flags & 0x04) != 0);

                break;
            }
            case SCRIPT_COMMAND_PLAY_SOUND:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) call for NULL creature.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) call for non-world object (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;

                // bitmask: 0/1=anyone/target, 0/2=with distance dependent
                Player* pTarget = NULL;

                if (step.script->playSound.flags & 1)
                {
                    if (!target)
                    {
                        sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) in targeted mode call for NULL target.", step.script->id);
                        break;
                    }

                    if (target->GetTypeId() != TYPEID_PLAYER)
                    {
                        sLog.outError("SCRIPT_COMMAND_PLAY_SOUND (script id %u) in targeted mode call for non-player (TypeId: %u), skipping.", step.script->id, target->GetTypeId());
                        break;
                    }

                    pTarget = (Player*)target;
                }

                // bitmask: 0/1=anyone/target, 0/2=with distance dependent
                if (step.script->playSound.flags & 2)
                    pSource->PlayDistanceSound(step.script->playSound.soundId, pTarget);
                else
                    pSource->PlayDirectSound(step.script->playSound.soundId, pTarget);

                break;
            }
            case SCRIPT_COMMAND_CREATE_ITEM:
            {
                if (!target && !source)
                {
                    sLog.outError("SCRIPT_COMMAND_CREATE_ITEM (script id %u) call for NULL object.", step.script->id);
                    break;
                }

                // only Player
                if ((!target || target->GetTypeId() != TYPEID_PLAYER) && (!source || source->GetTypeId() != TYPEID_PLAYER))
                {
                    sLog.outError("SCRIPT_COMMAND_CREATE_ITEM (script id %u) call for non-player (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
                    break;
                }

                Player* pReceiver = target && target->GetTypeId() == TYPEID_PLAYER ? (Player*)target : (Player*)source;

                if (Item* pItem = pReceiver->StoreNewItemInInventorySlot(step.script->createItem.itemEntry, step.script->createItem.amount))
                    pReceiver->SendNewItem(pItem, step.script->createItem.amount, true, false);

                break;
            }
            case SCRIPT_COMMAND_DESPAWN_CREATURE:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_DESPAWN_CREATURE (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_DESPAWN_CREATURE (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->despawn.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->despawn.creatureEntry, true, step.script->despawn.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->despawn.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_DESPAWN_CREATURE (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                pOwner->ForcedDespawn(step.script->despawn.despawnDelay);

                break;
            }
            case SCRIPT_COMMAND_PLAY_MOVIE:
                break;                                      // must be skipped at loading
            case SCRIPT_COMMAND_MOVEMENT:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_MOVEMENT (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_MOVEMENT (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pMover = NULL;

                if (!step.script->movement.creatureEntry)   // No buddy defined, so try use source (or target where source is player)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't move source being non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pMover = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pMover = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->movement.creatureEntry, true, step.script->movement.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pMover, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->movement.searchRadius);
                }

                if (!pMover)
                {
                    sLog.outError("SCRIPT_COMMAND_MOVEMENT (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                // Consider add additional checks for cases where creature should not change movementType
                // (pet? in combat? already using same MMgen as script try to apply?)

                switch (step.script->movement.movementType)
                {
                    case IDLE_MOTION_TYPE:
                        pMover->GetMotionMaster()->MoveIdle();
                        break;
                    case RANDOM_MOTION_TYPE:
                        pMover->GetMotionMaster()->MoveRandom();
                        break;
                    case WAYPOINT_MOTION_TYPE:
                        pMover->GetMotionMaster()->MoveWaypoint();
                        break;
                }

                break;
            }
            case SCRIPT_COMMAND_SET_ACTIVEOBJECT:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_SET_ACTIVEOBJECT (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_SET_ACTIVEOBJECT (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->activeObject.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->activeObject.creatureEntry, true, step.script->activeObject.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->activeObject.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_SET_ACTIVEOBJECT (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                pOwner->SetActiveObjectState(step.script->activeObject.activate);
                break;
            }
            case SCRIPT_COMMAND_SET_FACTION:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_SET_FACTION (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_SET_FACTION (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->faction.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->faction.creatureEntry, true, step.script->faction.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->faction.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_SET_FACTION (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                if (step.script->faction.factionId)
                    pOwner->SetFactionTemporary(step.script->faction.factionId, step.script->faction.flags);
                else
                    pOwner->ClearTemporaryFaction();

                break;
            }
            case SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->morph.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->morph.creatureEntry, true, step.script->morph.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->morph.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                if (!step.script->morph.creatureOrModelEntry)
                    pOwner->DeMorph();
                else if (step.script->morph.flags & 0x01)
                    pOwner->SetDisplayId(step.script->morph.creatureOrModelEntry);
                else
                {
                    CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(step.script->morph.creatureOrModelEntry);
                    uint32 display_id = Creature::ChooseDisplayId(ci);

                    pOwner->SetDisplayId(display_id);
                }

                break;
            }
            case SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->mount.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->mount.creatureEntry, true, step.script->mount.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->mount.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
                    break;
                }

                if (!step.script->mount.creatureOrModelEntry)
                    pOwner->Unmount();
                else if (step.script->mount.flags & 0x01)
                    pOwner->Mount(step.script->mount.creatureOrModelEntry);
                else
                {
                    CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(step.script->mount.creatureOrModelEntry);
                    uint32 display_id = Creature::ChooseDisplayId(ci);

                    pOwner->Mount(display_id);
                }

                break;
            }
            case SCRIPT_COMMAND_SET_RUN:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_SET_RUN (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_SET_RUN (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->run.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->run.creatureEntry, true, step.script->run.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->run.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_SET_RUN (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                pOwner->SetWalk(!step.script->run.run);

                break;
            }
            case SCRIPT_COMMAND_ATTACK_START:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;

                // flag_original_source_as_target   0x02
                // flag_buddy_as_target             0x04

                // If step has a buddy entry defined, search for it.
                if (step.script->attack.creatureEntry)
                {
                    Creature* pBuddy = NULL;
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->attack.creatureEntry, true, step.script->attack.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pBuddy, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->attack.searchRadius);

                    // If buddy found, then use it
                    if (pBuddy)
                    {
                        if (step.script->attack.flags & 0x04)
                        {
                            // pBuddy is target of attack
                            target = (Object*)pBuddy;
                        }
                        else
                        {
                            // If not target of attack, then set pBuddy as source, the attacker
                            pSource = (WorldObject*)pBuddy;
                        }
                    }
                    else
                    {
                        // No buddy found, so don't do anything
                        break;
                    }
                }

                // If we should attack the original source instead of target
                if (step.script->attack.flags & 0x02)
                    target = source;

                Unit* unitTarget = target && target->isType(TYPEMASK_UNIT) ? static_cast<Unit*>(target) : NULL;
                Creature* pAttacker = pSource && pSource->GetTypeId() == TYPEID_UNIT ? static_cast<Creature*>(pSource) : NULL;

                if (pAttacker && unitTarget)
                {
                    if (pAttacker->IsFriendlyTo(unitTarget))
                    {
                        sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) attacker is friendly to target, can not attack.", step.script->id);
                        break;
                    }

                    pAttacker->AI()->AttackStart(unitTarget);
                    break;
                }

                sLog.outError("SCRIPT_COMMAND_ATTACK_START (script id %u) unexpected error, attacker or victim could not be found, no action.", step.script->id);
                break;
            }
            case SCRIPT_COMMAND_GO_LOCK_STATE:
            {
                if ((!source || !source->isType(TYPEMASK_WORLDOBJECT)) && (!target || !target->isType(TYPEMASK_WORLDOBJECT)))
                {
                    sLog.outError("SCRIPT_COMMAND_GO_LOCK_STATE (script id %u) call for non-worldobject (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source ? source->GetTypeId() : 0, target ? target->GetTypeId() : 0);
                    break;
                }

                WorldObject* pSearcher = source && source->isType(TYPEMASK_WORLDOBJECT) ? (WorldObject*)source : (WorldObject*)target;
                GameObject* pGo = NULL;

                MaNGOS::NearestGameObjectEntryInObjectRangeCheck u_check(*pSearcher, step.script->goLockState.goEntry, step.script->goLockState.searchRadius);
                MaNGOS::GameObjectLastSearcher<MaNGOS::NearestGameObjectEntryInObjectRangeCheck> searcher(pGo, u_check);

                Cell::VisitGridObjects(pSearcher, searcher, step.script->goLockState.searchRadius);

                /* flag lockState
                 * go_lock          0x01
                 * go_unlock        0x02
                 * go_nonInteract   0x04
                 * go_Interact      0x08
                 */
                if (pGo)
                {
                    // Lock or Unlock
                    if (step.script->goLockState.lockState & 0x01)
                        pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
                    else if (step.script->goLockState.lockState & 0x02)
                        pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
                    // Set Non Interactable or Set Interactable
                    if (step.script->goLockState.lockState & 0x04)
                        pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                    else if (step.script->goLockState.lockState & 0x08)
                        pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                }
                break;
            }
            case SCRIPT_COMMAND_STAND_STATE:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_STAND_STATE (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_STAND_STATE (script id %u) call for non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }
                // When creatureEntry is not defined, GameObject can not be source
                else if (!step.script->standState.creatureEntry)
                {
                    if (!source->isType(TYPEMASK_UNIT))
                    {
                        sLog.outError("SCRIPT_COMMAND_STAND_STATE (script id %u) are missing datalong2 (creature entry). Unsupported call for non-unit (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                        break;
                    }
                }

                WorldObject* pSource = (WorldObject*)source;

                // flag_target_as_source            0x01

                // If target is Unit* and should change it's stand state (or should be source of searcher below)
                if (target && target->isType(TYPEMASK_UNIT) && step.script->standState.flags & 0x01)
                    pSource = (WorldObject*)target;

                // If step has a buddy entry defined, search for it.
                if (step.script->standState.creatureEntry)
                {
                    Creature* pBuddy = NULL;
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->standState.creatureEntry, true, step.script->standState.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pBuddy, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->standState.searchRadius);

                    // If buddy found, then use it or break (break since we must assume pBuddy was defined for a reason)
                    if (pBuddy)
                        pSource = (WorldObject*)pBuddy;
                    else
                        break;
                }

                // Must be safe cast to Unit* here
                ((Unit*)pSource)->SetStandState(step.script->standState.stand_state);
                break;
            }
            case SCRIPT_COMMAND_MODIFY_NPC_FLAGS:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_MODIFY_NPC_FLAGS (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_MODIFY_NPC_FLAGS (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->npcFlag.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->npcFlag.creatureEntry, true, step.script->npcFlag.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->npcFlag.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_MODIFY_NPC_FLAGS (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                // Add Flags
                if (step.script->npcFlag.change_flag & 0x01)
                {
                    pOwner->SetFlag(UNIT_NPC_FLAGS, step.script->npcFlag.flag);
                }
                // Remove Flags
                else if (step.script->npcFlag.change_flag & 0x02)
                {
                    pOwner->RemoveFlag(UNIT_NPC_FLAGS, step.script->npcFlag.flag);
                }
                // Toggle Flags
                else
                {
                    if (pOwner->HasFlag(UNIT_NPC_FLAGS, step.script->npcFlag.flag))
                    {
                        pOwner->RemoveFlag(UNIT_NPC_FLAGS, step.script->npcFlag.flag);
                    }
                    else
                    {
                        pOwner->SetFlag(UNIT_NPC_FLAGS, step.script->npcFlag.flag);
                    }
                }

                break;
            }
            case SCRIPT_COMMAND_SEND_TAXI_PATH:
            {
                Player* pPlayer = nullptr;

                if (target && target->IsPlayer())
                    pPlayer = (Player*)target;
                else if (source && source->IsPlayer())
                    pPlayer = (Player*)source;
                
                // only Player
                if (!pPlayer)
                {
                    sLog.outError("SCRIPT_COMMAND_SEND_TAXI_PATH (script id %u) call for non-player, skipping.", step.script->id);
                    break;
                }
                
                pPlayer->ActivateTaxiPathTo(step.script->sendTaxiPath.taxiPathId, 0, true);
                break;
            }
            case SCRIPT_COMMAND_TERMINATE_SCRIPT:
            {
                bool result = false;

                if (step.script->terminateScript.creatureEntry)
                {
                    if (!source && !target)
                    {
                        sLog.outError("SCRIPT_COMMAND_TERMINATE_SCRIPT (script id %u) call for NULL object, skipping.", step.script->id);
                        break;
                    }

                    WorldObject* pSearcher = source ? (WorldObject*) source : (WorldObject*) target;
                    if (pSearcher->GetTypeId() == TYPEID_PLAYER && target && target->GetTypeId() != TYPEID_PLAYER)
                    {
                        pSearcher = (WorldObject*) target;
                    }


                    Creature* pCreatureBuddy = NULL;
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSearcher, step.script->terminateScript.creatureEntry, true, step.script->terminateScript.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pCreatureBuddy, u_check);
                    Cell::VisitGridObjects(pSearcher, searcher, step.script->terminateScript.searchRadius);

                    if (!(step.script->terminateScript.flags & 0x01) && !pCreatureBuddy)
                        result = true; // when npc was not found alive
                    else if (step.script->terminateScript.flags & 0x01 && pCreatureBuddy)
                        result = true; // when npc was found alive
                }
                else
                    result = true;

                if (result) // Terminate further steps of this script
                {
                    uint32 id = iter->second.script->id;
                    ObjectGuid sourceGuid = iter->second.sourceGuid;
                    ObjectGuid targetGuid = iter->second.targetGuid;
                    ObjectGuid ownerGuid = iter->second.ownerGuid;

                    for (ScriptScheduleMap::iterator rmItr = m_scriptSchedule.begin(); rmItr != m_scriptSchedule.end();)
                    {
                        if (rmItr->second.IsSameScript(id, sourceGuid, targetGuid, ownerGuid))
                        {
                            m_scriptSchedule.erase(rmItr++);
                            sScriptMgr.DecreaseScheduledScriptCount();
                        }
                        else
                        {
                            ++rmItr;
                        }
                    }
                    iter = m_scriptSchedule.begin();
                    continue;
                }

                break;
            }
            case SCRIPT_COMMAND_ENTER_EVADE_MODE:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_ENTER_EVADE_MODE (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_ENTER_EVADE_MODE (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pOwner = NULL;

                // No buddy defined, so try use source (or target if source is not creature)
                if (!step.script->enterEvadeMode.creatureEntry)
                {
                    if (pSource->GetTypeId() != TYPEID_UNIT)
                    {
                        // we can't be non-creature, so see if target is creature
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                            pOwner = (Creature*)target;
                    }
                    else if (pSource->GetTypeId() == TYPEID_UNIT)
                        pOwner = (Creature*)pSource;
                }
                else                                        // If step has a buddy entry defined, search for it
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->enterEvadeMode.creatureEntry, true, step.script->enterEvadeMode.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pOwner, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->enterEvadeMode.searchRadius);
                }

                if (!pOwner)
                {
                    sLog.outError("SCRIPT_COMMAND_ENTER_EVADE_MODE (script id %u) call for non-creature (TypeIdSource: %u)(TypeIdTarget: %u), skipping.", step.script->id, source->GetTypeId(), target ? target->GetTypeId() : 0);
                    break;
                }

                if (pOwner->AI())
                    pOwner->AI()->EnterEvadeMode();

                break;
            }
            case SCRIPT_COMMAND_TERMINATE_COND:
            {
                if (!target && !source)
                {
                    sLog.outError("SCRIPT_COMMAND_TERMINATE_COND (script id %u) call for NULL object, skipping.", step.script->id);
                    break;
                }

                Player* player = NULL;
                WorldObject* second = (WorldObject*) source;
                // First case: target is player
                if (target && target->GetTypeId() == TYPEID_PLAYER)
                {
                    player = static_cast<Player*>(target);
                }
                // Second case: source is player
                else if (source && source->GetTypeId() == TYPEID_PLAYER)
                {
                    player = static_cast<Player*>(source);
                    second = (WorldObject*) target;
                }

                bool terminateResult;
                if (step.script->terminateCond.flags & 0x01)
                {
                    terminateResult = !sObjectMgr.IsPlayerMeetToCondition(step.script->terminateCond.conditionId, player, player->GetMap(), second, CONDITION_FROM_DBSCRIPTS);
                }
                else
                {
                    terminateResult = sObjectMgr.IsPlayerMeetToCondition(step.script->terminateCond.conditionId, player, player->GetMap(), second, CONDITION_FROM_DBSCRIPTS);
                }

                if (player && terminateResult && step.script->terminateCond.failQuest)
                {
                    player->GroupEventFailHappens(step.script->terminateCond.failQuest);
                }
                if (terminateResult) // Terminate further steps of this script
                {
                    uint32 id = iter->second.script->id;
                    ObjectGuid sourceGuid = iter->second.sourceGuid;
                    ObjectGuid targetGuid = iter->second.targetGuid;
                    ObjectGuid ownerGuid = iter->second.ownerGuid;

                    for (ScriptScheduleMap::iterator rmItr = m_scriptSchedule.begin(); rmItr != m_scriptSchedule.end();)
                    {
                        if (rmItr->second.IsSameScript(id, sourceGuid, targetGuid, ownerGuid))
                        {
                            m_scriptSchedule.erase(rmItr++);
                            sScriptMgr.DecreaseScheduledScriptCount();
                        }
                        else
                        {
                            ++rmItr;
                        }
                    }
                    iter = m_scriptSchedule.begin();
                    continue;
                }

                break;
            }
            case SCRIPT_COMMAND_TURN_TO:
            {
                if (!source)
                {
                    sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call for NULL source.", step.script->id);
                    break;
                }

                if (!source->isType(TYPEMASK_WORLDOBJECT))
                {
                    sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call for unsupported non-worldobject (TypeId: %u), skipping.", step.script->id, source->GetTypeId());
                    break;
                }

                WorldObject* pSource = (WorldObject*)source;
                Creature* pCreatureTarget = nullptr;

                if (step.script->turnTo.creatureEntry)
                {
                    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*pSource, step.script->turnTo.creatureEntry, true, step.script->turnTo.searchRadius);
                    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pCreatureTarget, u_check);

                    Cell::VisitGridObjects(pSource, searcher, step.script->turnTo.searchRadius);

                    if (!pCreatureTarget)
                        break;
                }

                if (step.script->turnTo.facingLogic == 0)
                {
                    if (step.script->turnTo.isSourceTarget)
                    {
                        if (target && (target->GetTypeId() == TYPEID_UNIT || target->GetTypeId() == TYPEID_PLAYER) && target->IsInWorld())
                        {
                            Unit* pTarget = target->ToUnit();

                            if (!step.script->turnTo.creatureEntry)
                            {
                                // the target (probably player) faces the source of the script
                                if (pSource && pTarget)
                                    pTarget->SetFacingToObject(pSource);
                            }
                            else
                            {
                                // search for a creature and make the target (probably player) face it
                                if (pTarget)
                                    pTarget->SetFacingToObject(pCreatureTarget);
                            }
                        }
                        else
                        {
                            sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=0 and datalong2!=0 but script target is not Unit.", step.script->id);
                            break;
                        }
                    }
                    else
                    {
                        if (target && target->isType(TYPEMASK_WORLDOBJECT) && target->IsInWorld())
                        {
                            WorldObject* pTarget = (WorldObject*)target;

                            if (!step.script->turnTo.creatureEntry)
                            {
                                if (source->GetTypeId() != TYPEID_UNIT)
                                {
                                    sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=0 and datalong2=0 but script source is not Unit.", step.script->id);
                                    break;
                                }

                                // unit that is the source of the script faces the target (probably player)
                                Unit* pUnitSource = source->ToUnit();

                                if (pTarget && pUnitSource)
                                    pUnitSource->SetFacingToObject(pTarget);
                            }
                            else
                            {
                                // search for a creature and make it face the target (probably player)
                                if (pTarget)
                                    pCreatureTarget->SetFacingToObject(pTarget);
                            }
                        }
                        else
                        {
                            sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=0 and datalong2=0 but script target is invalid.", step.script->id);
                            break;
                        }
                    }
                }
                else if (step.script->turnTo.facingLogic == 1)
                {
                    if (step.script->turnTo.creatureEntry)
                    {
                        // search for a creature and set its facing to the orientation specified
                        pCreatureTarget->SetFacingTo(step.script->o);
                    }
                    else if (step.script->turnTo.isSourceTarget)
                    {
                        // setting target's (probably player) facing to the orientation specified
                        if (target && (target->GetTypeId() == TYPEID_UNIT || target->GetTypeId() == TYPEID_PLAYER) && target->IsInWorld())
                        {
                            Unit* pTarget = target->ToUnit();

                            if (pTarget)
                                pTarget->SetFacingTo(step.script->o);
                        }
                        else
                        {
                            sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=1 and datalong2!=0 but script target is not Unit.", step.script->id);
                            break;
                        }
                    }
                    else if (source->GetTypeId() == TYPEID_UNIT)
                    {
                        // setting the script source's facing to the orientation specified
                        Unit* pUnitSource = source->ToUnit();

                        if (pUnitSource)
                            pUnitSource->SetFacingTo(step.script->o);
                    }
                    else
                    {
                        sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=1 and datalong2=0 but script source is not Unit.", step.script->id);
                        break;
                    }
                }
                else if (step.script->turnTo.facingLogic == 2)
                {
                    if (step.script->turnTo.creatureEntry)
                    {
                        if (step.script->turnTo.isSourceTarget)
                        {
                            // searches for a creature and makes it face the source of the script
                            pCreatureTarget->SetFacingToObject(pSource);
                        }
                        else if (source->GetTypeId() == TYPEID_UNIT)
                        {
                            // searches for a creature and makes unit that is the source of the script face it
                            Unit* pUnitSource = source->ToUnit();

                            if (pUnitSource)
                                pUnitSource->SetFacingToObject(pCreatureTarget);
                        }
                        else
                        {
                            sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=2 and datalong2=0 but script source is not Unit.", step.script->id);
                            break;
                        }
                    }
                    else
                    {
                        sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) call with datalong=2 but no creature entry specified.", step.script->id);
                        break;
                    }
                }
                else
                {
                    sLog.outError("SCRIPT_COMMAND_TURN_TO (script id %u) unsupported call with value datalong=%i.", step.script->id, step.script->turnTo.facingLogic);
                    break;
                }
                break;
            }
            default:
                sLog.outError("Unknown SCRIPT_COMMAND_ %u called for script id %u.", step.script->command, step.script->id);
                break;
        }

        m_scriptSchedule_lock.acquire();
        iter = m_scriptSchedule.begin();
        if (iter->second.script == step.script)
            m_scriptSchedule.erase(iter);
        iter = m_scriptSchedule.begin();

        sScriptMgr.DecreaseScheduledScriptCount();
    }
    m_scriptSchedule_lock.release();
}

/**
 * Function return player that in world at CURRENT map
 *
 * Note: This is function preferred if you sure that need player only placed at specific map
 *       This is not true for some spell cast targeting and most packet handlers
 *
 * @param guid must be player guid (HIGHGUID_PLAYER)
 */
Player* Map::GetPlayer(ObjectGuid guid)
{
    Player* plr = ObjectAccessor::FindPlayer(guid);         // return only in world players
    return plr && plr->GetMap() == this ? plr : NULL;
}

/**
 * Function return corpse that at CURRENT map
 *
 * Note: corpse can be NOT IN WORLD, so can't be used corpse->GetMap() without pre-check corpse->isInWorld()
 *
 * @param guid must be corpse guid (HIGHGUID_CORPSE)
 */
Corpse* Map::GetCorpse(ObjectGuid guid)
{
    Corpse * ret = ObjectAccessor::GetCorpseInMap(guid, GetId());
    return ret && ret->GetInstanceId() == GetInstanceId() ? ret : NULL;
}

/**
 * Function return non-player unit object that in world at CURRENT map, so creature, or pet
 *
 * @param guid must be non-player unit guid (HIGHGUID_PET HIGHGUID_UNIT)
 */
Creature* Map::GetAnyTypeCreature(ObjectGuid guid)
{
    switch (guid.GetHigh())
    {
        case HIGHGUID_UNIT:
            return GetCreature(guid);
        case HIGHGUID_PET:
            return GetPet(guid);
        default:
            break;
    }

    return NULL;
}

Transport* Map::GetTransport(ObjectGuid guid)
{
    if (!guid.IsMOTransport())
        return NULL;

    GameObject* go = GetGameObject(guid);
    return go ? go->ToTransport() : NULL;
}

/**
 * Function return dynamic object that in world at CURRENT map
 *
 * @param guid must be dynamic object guid (HIGHGUID_DYNAMICOBJECT)
 */
DynamicObject* Map::GetDynamicObject(ObjectGuid guid)
{
    return m_objectsStore.find<DynamicObject>(guid, (DynamicObject*)NULL);
}

/**
 * Function return unit in world at CURRENT map
 *
 * Note: in case player guid not always expected need player at current map only.
 *       For example in spell casting can be expected any in world player targeting in some cases
 *
 * @param guid must be unit guid (HIGHGUID_PLAYER HIGHGUID_PET HIGHGUID_UNIT)
 */
Unit* Map::GetUnit(ObjectGuid guid)
{
    if (guid.IsPlayer())
        return GetPlayer(guid);

    return GetAnyTypeCreature(guid);
}

/**
 * Function return world object in world at CURRENT map, so any except transports
 */
WorldObject* Map::GetWorldObject(ObjectGuid guid)
{
    switch (guid.GetHigh())
    {
        case HIGHGUID_PLAYER:
            return GetPlayer(guid);
        case HIGHGUID_GAMEOBJECT:
            return GetGameObject(guid);
        case HIGHGUID_UNIT:
            return GetCreature(guid);
        case HIGHGUID_PET:
            return GetPet(guid);
        case HIGHGUID_DYNAMICOBJECT:
            return GetDynamicObject(guid);
        case HIGHGUID_CORPSE:
        {
            // corpse special case, it can be not in world
            Corpse* corpse = GetCorpse(guid);
            return corpse && corpse->IsInWorld() ? corpse : NULL;
        }
        case HIGHGUID_MO_TRANSPORT:
        case HIGHGUID_TRANSPORT:
        default:
            break;
    }

    return NULL;
}

class ObjectUpdatePacketBuilder : public ACE_Based::Runnable
{
public:
    ObjectUpdatePacketBuilder(std::set<Object*>::iterator& a, std::set<Object*>::iterator& b, uint32 now) : begin(a), end(b), beginTime(now), current(a)
    {
    }

    virtual void run()
    {
        WorldDatabase.ThreadStart(); // Not needed if we don't do SQL queries from this thread ...
        DoUpdateObjects();
        WorldDatabase.ThreadEnd();
    }
    void DoUpdateObjects()
    {
        uint32 timeout = sWorld.getConfig(CONFIG_UINT32_MAP_OBJECTSUPDATE_TIMEOUT);
        UpdateDataMapType update_players; // Player -> UpdateData

        for (; current != end; ++current)
        {
            if (WorldTimer::getMSTimeDiffToNow(beginTime) > timeout)
                break;
            (*current)->BuildUpdateData(update_players);
        }

        for (UpdateDataMapType::iterator iter = update_players.begin(); iter != update_players.end(); ++iter)
            iter->second.Send(iter->first->GetSession());
    }
    std::set<Object*>::iterator begin;
    std::set<Object*>::iterator current;
    std::set<Object*>::iterator end;
    uint32 beginTime;
};

//#define MAP_SENDOBJECTUPDATES_PROFILE

void Map::SendObjectUpdates()
{
    // VERY HEAVY LOAD in case of a lot of players at the same place
    // ~2ms / object if 500 players in the visible area around
    uint32 now = WorldTimer::getMSTime();
    uint32 objectsCount = i_objectsToClientUpdate.size();
    if (!objectsCount)
        return;
    _processingSendObjUpdates = true;

    // Compute maximum number of threads
    uint32 threads = 1;
    if (IsContinent())
    {
        threads = sWorld.getConfig(CONFIG_UINT32_MAP_OBJECTSUPDATE_THREADS);
        if (!threads)
            threads = 1;
    }
    if (!_objUpdatesThreads)
        _objUpdatesThreads = 1;
    if (threads < _objUpdatesThreads)
        _objUpdatesThreads = threads;
    if (threads > objectsCount)
        threads = objectsCount;

    uint32 step = objectsCount / threads;
    uint32 i = 0;
    ACE_Based::Thread** updaters = threads > 1 ? new ACE_Based::Thread*[threads - 1] : NULL;
    ObjectUpdatePacketBuilder** objUpdaters = new ObjectUpdatePacketBuilder*[threads];
    std::set<Object*>::iterator itBegin = i_objectsToClientUpdate.begin();
    std::set<Object*>::iterator itEnd = i_objectsToClientUpdate.begin();
    ASSERT(step > 0);
    ASSERT(threads >= 1);
    for (uint32 i = 0; i < threads; ++i)
    {
        itBegin = itEnd;
        if (i == (threads - 1))
            itEnd = i_objectsToClientUpdate.end();
        else
        {
            for (uint32 j = 0; j < step; ++j)
                ++itEnd;
        }
        objUpdaters[i] = new ObjectUpdatePacketBuilder(itBegin, itEnd, now);
        objUpdaters[i]->incReference();

        if (i == (threads - 1)) // Do not create a useless supplementary thread
            objUpdaters[i]->DoUpdateObjects();
        else
            updaters[i] = new ACE_Based::Thread(objUpdaters[i]);
    }
    for (uint32 i = 0; i < (threads - 1); ++i)
        updaters[i]->wait();
    for (uint32 i = 0; i < threads; ++i)
    {
        /* std::set::erase
         * Iterators, pointers and references referring to elements removed by the function are invalidated.
         * All other iterators, pointers and references keep their validity.
         */
        i_objectsToClientUpdate.erase(objUpdaters[i]->begin, objUpdaters[i]->current);
        objUpdaters[i]->decReference();
        if (i != (threads - 1))
            delete updaters[i];
    }

    // If we timeout, use more threads !
    if (i_objectsToClientUpdate.size())
        ++_objUpdatesThreads;
    else
        --_objUpdatesThreads;

    _processingSendObjUpdates = false;
    delete[] updaters;
    delete[] objUpdaters;
#ifdef MAP_SENDOBJECTUPDATES_PROFILE
    uint32 diff = WorldTimer::getMSTimeDiffToNow(now);
    if (diff > 50)
        sLog.outString("SendObjectUpdates in %04u ms [%u threads. %3u/%3u]", diff, threads, objectsCount - i_objectsToClientUpdate.size(), objectsCount);
#endif
}

class VisibilityUpdater : public ACE_Based::Runnable
{
public:
    VisibilityUpdater(std::set<Unit*>::iterator& a, std::set<Unit*>::iterator& b, uint32 now) : begin(a), end(b), beginTime(now), current(a)
    {
    }

    virtual void run()
    {
        WorldDatabase.ThreadStart();
        DoUpdateVisibility();
        WorldDatabase.ThreadEnd();
    }
    void DoUpdateVisibility()
    {
        uint32 timeout = sWorld.getConfig(CONFIG_UINT32_MAP_VISIBILITYUPDATE_TIMEOUT);
        for (; current != end; ++current)
        {
            if (WorldTimer::getMSTimeDiffToNow(beginTime) > timeout)
                break;
            (*current)->ProcessRelocationVisibilityUpdates();
        }
    }
    std::set<Unit*>::iterator begin;
    std::set<Unit*>::iterator current;
    std::set<Unit*>::iterator end;
    uint32 beginTime;
};

//#define MAP_UPDATEVISIBILITY_PROFILE

void Map::UpdateVisibilityForRelocations()
{
    // VERY HEAVY LOAD in case of a lot of players at the same place
    uint32 now = WorldTimer::getMSTime();
    uint32 objectsCount = i_unitsRelocated.size();
    if (!objectsCount)
        return;
    _processingUnitsRelocation = true;

    // Compute number of threads to spawn
    uint32 threads = 1;
    if (IsContinent())
    {
        threads = sWorld.getConfig(CONFIG_UINT32_MAP_VISIBILITYUPDATE_THREADS);
        if (!threads)
            threads = 1;
    }
    if (!_unitRelocationThreads)
        _unitRelocationThreads = 1;
    if (threads < _unitRelocationThreads)
        _unitRelocationThreads = threads;
    if (threads > objectsCount)
        threads = objectsCount;

    uint32 step = objectsCount / threads;
    uint32 i = 0;
    ACE_Based::Thread** updaters = threads > 1 ? new ACE_Based::Thread*[threads - 1] : NULL;
    VisibilityUpdater** visUpdaters = new VisibilityUpdater*[threads];
    std::set<Unit*>::iterator itBegin = i_unitsRelocated.begin();
    std::set<Unit*>::iterator itEnd = i_unitsRelocated.begin();
    ASSERT(step > 0);
    for (uint32 i = 0; i < threads; ++i)
    {
        itBegin = itEnd;
        if (i == (threads - 1))
            itEnd = i_unitsRelocated.end();
        else
        {
            for (uint32 j = 0; j < step; ++j)
                ++itEnd;
        }
        visUpdaters[i] = new VisibilityUpdater(itBegin, itEnd, now);
        visUpdaters[i]->incReference();
        if (i == (threads - 1))
            visUpdaters[i]->DoUpdateVisibility();
        else
            updaters[i] = new ACE_Based::Thread(visUpdaters[i]);
    }
    for (uint32 i = 0; i < threads - 1; ++i)
        updaters[i]->wait();
    for (uint32 i = 0; i < threads; ++i)
    {
        i_unitsRelocated.erase(visUpdaters[i]->begin, visUpdaters[i]->current);
        visUpdaters[i]->decReference();
        if (i != (threads - 1))
            delete updaters[i];
    }

    if (i_unitsRelocated.size())
        ++_unitRelocationThreads;
    else
        --_unitRelocationThreads;

    _processingUnitsRelocation = false;
    delete[] updaters;
    delete[] visUpdaters;

#ifdef MAP_UPDATEVISIBILITY_PROFILE
    uint32 diff = WorldTimer::getMSTimeDiffToNow(now);
    if (diff > 50)
        sLog.outString("VisibilityUpdate in %04u ms [%u threads/done %u/%u]", diff, threads, objectsCount - i_unitsRelocated.size(), objectsCount);
#endif
}

uint32 Map::GenerateLocalLowGuid(HighGuid guidhigh)
{
    // TODOLOCK
    // TODO: for map local guid counters possible force reload map instead shutdown server at guid counter overflow
    m_guidGenerators_lock.acquire();
    uint32 guid = 0;
    switch (guidhigh)
    {
        case HIGHGUID_UNIT:
            guid = m_CreatureGuids.Generate();
            break;
        case HIGHGUID_GAMEOBJECT:
            guid = m_GameObjectGuids.Generate();
            break;
        case HIGHGUID_DYNAMICOBJECT:
            guid = m_DynObjectGuids.Generate();
            break;
        case HIGHGUID_PET:
            guid = m_PetGuids.Generate();
            break;
        default:
            MANGOS_ASSERT(0);
    }
    m_guidGenerators_lock.release();
    return guid;
}

/**
 * Helper structure for building static chat information
 *
 */
class StaticMonsterChatBuilder
{
public:
    StaticMonsterChatBuilder(CreatureInfo const* cInfo, ChatMsg msgtype, int32 textId, uint32 language, Unit* target, uint32 senderLowGuid = 0)
        : i_cInfo(cInfo), i_msgtype(msgtype), i_textId(textId), i_language(language), i_target(target)
    {
        // 0 lowguid not used in core, but accepted fine in this case by client
        i_senderGuid = i_cInfo->GetObjectGuid(senderLowGuid);
    }
    void operator()(WorldPacket& data, int32 loc_idx)
    {
        char const* text = sObjectMgr.GetMangosString(i_textId, loc_idx);

        std::string nameForLocale = "";
        if (loc_idx >= 0)
        {
            CreatureLocale const *cl = sObjectMgr.GetCreatureLocale(i_cInfo->Entry);
            if (cl)
            {
                if (cl->Name.size() > (size_t)loc_idx && !cl->Name[loc_idx].empty())
                    nameForLocale = cl->Name[loc_idx];
            }
        }

        if (nameForLocale.empty())
            nameForLocale = i_cInfo->Name;

        WorldObject::BuildMonsterChat(&data, i_senderGuid, i_msgtype, text, i_language, nameForLocale.c_str(), i_target ? i_target->GetObjectGuid() : ObjectGuid());
    }

private:
    ObjectGuid i_senderGuid;
    CreatureInfo const* i_cInfo;
    ChatMsg i_msgtype;
    int32 i_textId;
    uint32 i_language;
    Unit* i_target;
};


/**
 * Function simulates yell of creature
 *
 * @param guid must be creature guid of whom to Simulate the yell, non-creature guids not supported at this moment
 * @param textId Id of the simulated text
 * @param language language of the text
 * @param target, can be NULL
 */
void Map::MonsterYellToMap(ObjectGuid guid, int32 textId, uint32 language, Unit* target)
{
    if (guid.IsAnyTypeCreature())
    {
        CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(guid.GetEntry());
        if (!cInfo)
        {
            sLog.outError("Map::MonsterYellToMap: Called for nonexistent creature entry in guid: %s", guid.GetString().c_str());
            return;
        }

        MonsterYellToMap(cInfo, textId, language, target, guid.GetCounter());
    }
    else
    {
        sLog.outError("Map::MonsterYellToMap: Called for non creature guid: %s", guid.GetString().c_str());
        return;
    }
}


/**
 * Function simulates yell of creature
 *
 * @param cinfo must be entry of Creature of whom to Simulate the yell
 * @param textId Id of the simulated text
 * @param language language of the text
 * @param target, can be NULL
 * @param senderLowGuid provide way proper show yell for near spawned creature with known lowguid,
 *        0 accepted by client else if this not important
 */
void Map::MonsterYellToMap(CreatureInfo const* cinfo, int32 textId, uint32 language, Unit* target, uint32 senderLowGuid /*= 0*/)
{
    StaticMonsterChatBuilder say_build(cinfo, CHAT_MSG_MONSTER_YELL, textId, language, target, senderLowGuid);
    MaNGOS::LocalizedPacketDo<StaticMonsterChatBuilder> say_do(say_build);

    Map::PlayerList const& pList = GetPlayers();
    for (PlayerList::const_iterator itr = pList.begin(); itr != pList.end(); ++itr)
        say_do(itr->getSource());
}

/**
 * Function to play sound to all players in map
 *
 * @param soundId Played Sound
 */
void Map::PlayDirectSoundToMap(uint32 soundId)
{
    WorldPacket data(SMSG_PLAY_SOUND, 4);
    data << uint32(soundId);

    Map::PlayerList const& pList = GetPlayers();
    for (PlayerList::const_iterator itr = pList.begin(); itr != pList.end(); ++itr)
        itr->getSource()->SendDirectMessage(&data);
}


// NOSTALRIUS: GameObjectCollision
bool Map::isInLineOfSight(float x1, float y1, float z1, float x2, float y2, float z2, bool checkDynLos) const
{
    ASSERT(MaNGOS::IsValidMapCoord(x1, y1, z1));
    ASSERT(MaNGOS::IsValidMapCoord(x2, y2, z2));

    return VMAP::VMapFactory::createOrGetVMapManager()->isInLineOfSight(GetId(), x1, y1, z1, x2, y2, z2)
    && (!checkDynLos || CheckDynamicTreeLoS(x1, y1, z1, x2, y2, z2));
}

bool Map::GetLosHitPosition(float srcX, float srcY, float srcZ, float& destX, float& destY, float& destZ, float modifyDist) const
{
    ASSERT(MaNGOS::IsValidMapCoord(srcX, srcY, srcZ));
    ASSERT(MaNGOS::IsValidMapCoord(destX, destY, destZ));

    // at first check all static objects
    float tempX, tempY, tempZ = 0.0f;
    bool result0 = VMAP::VMapFactory::createOrGetVMapManager()->getObjectHitPos(GetId(), srcX, srcY, srcZ, destX, destY, destZ, tempX, tempY, tempZ, modifyDist);
    if (result0)
    {
        DEBUG_LOG("Map::GetHitPosition vmaps corrects gained with static objects! new dest coords are X:%f Y:%f Z:%f", destX, destY, destZ);
        destX = tempX;
        destY = tempY;
        destZ = tempZ;
    }
    // at second all dynamic objects, if static check has an hit, then we can calculate only to this closer point
    Vector3 startPos = Vector3(srcX, srcY, srcZ);
    Vector3 dstPos = Vector3(destX, destY, destZ);
    Vector3 resultPos;
    bool result1 = GetDynamicObjectHitPos(startPos, dstPos, resultPos, modifyDist);
    if (result1)
    {
        DEBUG_LOG("Map::GetHitPosition vmaps corrects gained with dynamic objects! new dest coords are X:%f Y:%f Z:%f", destX, destY, destZ);
        destX = resultPos.x;
        destY = resultPos.y;
        destZ = resultPos.z;
    }

    return result0;
}

bool Map::GetWalkHitPosition(Transport* transport, float srcX, float srcY, float srcZ, float& destX, float& destY, float& destZ, uint32 moveAllowedFlags, float zSearchDist, bool locatedOnSteepSlope) const
{
    if (!MaNGOS::IsValidMapCoord(srcX, srcY, srcZ))
    {
        sLog.outError("Map::GetWalkHitPosition invalid source coordinates,"
            "x1: %f y1: %f z1: %f, x2: %f, y2: %f, z2: %f on map %d",
            srcX, srcY, srcZ, destX, destY, destZ, GetId());
        return false;
    }

    if (!MaNGOS::IsValidMapCoord(destX, destY, destZ))
    {
        sLog.outError("Map::GetWalkHitPosition invalid destination coordinates,"
            "x1: %f y1: %f z1: %f, x2: %f, y2: %f, z2: %f on map %u",
            srcX, srcY, srcZ, destX, destY, destZ, GetId());
        return false;
    }

    MMAP::MMapManager* mmap = MMAP::MMapFactory::createOrGetMMapManager();
    const dtNavMeshQuery* m_navMeshQuery = transport ? mmap->GetModelNavMeshQuery(transport->GetDisplayId()) : mmap->GetNavMeshQuery(GetId());
    if (!m_navMeshQuery)
    {
        DETAIL_LOG("WalkHitPos: No nav mesh loaded !");
        return false;
    }

    /// Find navmesh position near source
    float point[3] = {srcY, srcZ, srcX};
    // Warning : Coord order is Y,Z,X
    float closestPoint[3] = {0.0f, 0.0f, 0.0f};
    float endPosition[3] = {destY, destZ, destX};
    if (transport)
    {
        transport->CalculatePassengerOffset(point[2], point[0], point[1]);
        transport->CalculatePassengerOffset(endPosition[2], endPosition[0], endPosition[1]);
    }
    dtQueryFilter filter;
    filter.setIncludeFlags(moveAllowedFlags);

    if (!locatedOnSteepSlope)
        filter.setExcludeFlags(NAV_STEEP_SLOPES);

    dtPolyRef startRef = PathInfo::FindWalkPoly(m_navMeshQuery, point, filter, closestPoint, zSearchDist);
    if (!startRef)
    {
        DETAIL_LOG("WalkHitPos: Start poly not found");
        return false;
    }
    filter.setExcludeFlags(NAV_STEEP_SLOPES);

    /// Walk on the surface found
    dtPolyRef visited[50] = {0};
    int visitedCount = 0;
    float t = 0.0f;
    float hitNormal[3] = {0}; // Normal of wall hit. Not always defined by raycast (if no wall hit)
    dtStatus result = m_navMeshQuery->raycast(startRef, closestPoint, endPosition, &filter, &t, hitNormal, visited, &visitedCount, 50);
    if (dtStatusFailed(result) || !visitedCount)
    {
        DETAIL_LOG("WalkHitPos: Navmesh raycast failed");
        return false;
    }
    for (int i = 0; i < 3; ++i)
        endPosition[i] += hitNormal[i] * 0.5f;
    if (dtStatusFailed(m_navMeshQuery->closestPointOnPoly(visited[visitedCount - 1], endPosition, endPosition, NULL)))
        return false;

    /// Compute complete path, and at each path step, check for dynamic LoS collision
    // Rq: This is non-sense on Transports, since we are using position offsets ...
    float pathPoints[MAX_POINT_PATH_LENGTH * VERTEX_SIZE];
    int pointCount = 0;
    result = m_navMeshQuery->findStraightPath(
        closestPoint,         // start position
        endPosition,           // end position
        visited,                 // current path
        visitedCount,       // length of current path
        pathPoints,         // [out] path corner points
        NULL,
        NULL,
        (int*)&pointCount,
        20,                  // maximum number of points/polygons to use
        DT_STRAIGHTPATH_ALL_CROSSINGS);
    if (dtStatusFailed(result))
        return false;
    // Add 1y height, because navmesh height is not very precise.
    Vector3 dstPos = Vector3(srcX, srcY, srcZ + 1.0f);
    for (int i = 0; i < pointCount; ++i)
    {
        Vector3 startPos = dstPos;
        dstPos = Vector3(pathPoints[i * VERTEX_SIZE + 2], pathPoints[i * VERTEX_SIZE], pathPoints[i * VERTEX_SIZE + 1]);
        dstPos.z += 1.0f;
        if (!transport && GetDynamicObjectHitPos(startPos, dstPos, dstPos, -0.1f))
            break;
    }
    if (transport)
        transport->CalculatePassengerPosition(dstPos.x, dstPos.y, dstPos.z);
    destX = dstPos.x;
    destY = dstPos.y;
    destZ = dstPos.z;
    if (!MaNGOS::IsValidMapCoord(destX, destY, destZ))
        return false;

    /// Finalize Z-position using vmaps (more accurate)
    if (transport)
        destZ += 0.5f;
    else
        destZ = GetHeight(destX, destY, destZ);
    return true;
}


bool Map::GetWalkRandomPosition(Transport* transport, float &x, float &y, float &z, float maxRadius, uint32 moveAllowedFlags) const
{
    ASSERT(MaNGOS::IsValidMapCoord(x, y, z));

    // Trouver le navMeshQuery
    MMAP::MMapManager* mmap = MMAP::MMapFactory::createOrGetMMapManager();
    const dtNavMeshQuery* m_navMeshQuery = transport ? mmap->GetModelNavMeshQuery(transport->GetDisplayId()) : mmap->GetNavMeshQuery(GetId());
    float radius = maxRadius * rand_norm_f();
    if (!m_navMeshQuery)
        return false;
    // Trouver une position valide a cote.
    float point[3] = {y, z, x};
    if (transport)
        transport->CalculatePassengerOffset(point[2], point[0], point[1]);

    // ATTENTION : Positions en Y,Z,X
    float closestPoint[3] = {0.0f, 0.0f, 0.0f};
    dtQueryFilter filter;
    filter.setIncludeFlags(moveAllowedFlags);
    filter.setExcludeFlags(NAV_STEEP_SLOPES);
    dtPolyRef startRef = PathInfo::FindWalkPoly(m_navMeshQuery, point, filter, closestPoint);
    if (!startRef)
        return false;

    dtPolyRef randomPosRef = 0;
    dtStatus result = m_navMeshQuery->findRandomPointAroundCircle(startRef, closestPoint, maxRadius, &filter, rand_norm_f, &randomPosRef, point);
    if (dtStatusFailed(result) || !MaNGOS::IsValidMapCoord(point[2], point[0], point[1]))
        return false;

    // Random point may be at a bigger distance than allowed
    float d = sqrt(pow(x - point[2], 2) + pow(y - point[0], 2));
    float endPosition[3] = {y + radius*(y - point[0]) / d, z, x + radius*(x - point[2]) / d};
    float t = 0.0f;
    dtPolyRef visited[10] = {0};
    int visitedCount = 0;
    float hitNormal[3] = {0}; // Normal of wall hit.
    result = m_navMeshQuery->raycast(startRef, closestPoint, endPosition, &filter, &t, hitNormal, visited, &visitedCount, 10);
    if (dtStatusFailed(result) || !visitedCount)
        return false;
    for (int i = 0; i < 3; ++i)
                endPosition[i] += hitNormal[i] * 0.5f;
    result = m_navMeshQuery->closestPointOnPoly(visited[visitedCount - 1], endPosition, endPosition, NULL);
    if (dtStatusFailed(result) || !MaNGOS::IsValidMapCoord(endPosition[2], endPosition[0], endPosition[1]))
        return false;

    if (transport)
        transport->CalculatePassengerPosition(endPosition[2], endPosition[0], endPosition[1]);
    if (!MaNGOS::IsValidMapCoord(endPosition[2], endPosition[0], endPosition[1]))
        return false;
    x = endPosition[2];
    y = endPosition[0];
    z = endPosition[1];
    // 2. On precise avec les vmaps (la premiere etape permet en gros de selectionner l'etage)
    if (transport)
        z += 0.5f; // Allow us a little error (mmaps not very precise regarding height computations)
    else
    {
        float vmapH = GetHeight(x, y, z);
        if (vmapH > z)
            z = vmapH;
    }
    return true;
}


float Map::GetHeight(float x, float y, float z, bool vmap/*=true*/, float maxSearchDist/*=DEFAULT_HEIGHT_SEARCH*/) const
{
    ASSERT(MaNGOS::IsValidMapCoord(x, y, z));
    return std::max<float>(GetTerrain()->GetHeightStatic(x, y, z, vmap, maxSearchDist), GetDynamicTreeHeight(x, y, z, maxSearchDist));
}

VMAP::ModelInstance* Map::FindCollisionModel(float x1, float y1, float z1, float x2, float y2, float z2)
{
    ASSERT(MaNGOS::IsValidMapCoord(x1, y1, z1));
    ASSERT(MaNGOS::IsValidMapCoord(x2, y2, z2));
    return VMAP::VMapFactory::createOrGetVMapManager()->FindCollisionModel(GetId(), x1, y1, z1, x2, y2, z2);
}


void Map::CrashUnload()
{
    /// Logout players
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* player = m_mapRefIter->getSource();
        if (player)
        {
            WorldSession* session = player->GetSession();
            sLog.out(LOG_CHAR, "Account: %d (IP: %s) Logout Character:[%s] (guid: %u)", session->GetAccountId(), session->GetRemoteAddress().c_str(), player->GetName() , player->GetGUIDLow());
            sWorld.LogCharacter(player, "Logout");
            session->SetPlayer(NULL);
            player->SaveInventoryAndGoldToDB(); // Prevent possible exploits
            player->UninviteFromGroup();

            if (player->GetSocial())
                sSocialMgr.RemovePlayerSocial(player->GetGUIDLow());
            if (false)
                delete player; // May crash if player is corrupted
            else
                sObjectAccessor.RemoveObject(player);


            // Go back to character selection
            WorldPacket data(SMSG_LOGOUT_COMPLETE, 0);
            session->SendPacket(&data);
            session->LogoutPlayer(false);
        }
    }
    //UnloadAll(true);

    if (!m_scriptSchedule.empty())
        sScriptMgr.DecreaseScheduledScriptCount(m_scriptSchedule.size());

    if (m_persistentState)
    {
        m_persistentState->SetUsedByMapState(NULL);         // field pointer can be deleted after this
        m_persistentState = NULL;
    }

    if (i_data)
        i_data->SaveToDB();

    //release reference count
    if (m_TerrainData->Release())
        sTerrainMgr.UnloadTerrain(m_TerrainData->GetMapId());
}


void Map::BindToInstanceOrRaid(Player* player, time_t objectResetTime, bool permBindToRaid)
{
    // TODO: do instance binding anyway if the charmer/owner is offline
    if (IsDungeon())
    {
        if (IsRaid())
        {
            if (permBindToRaid)
                ((DungeonMap *)this)->PermBindAllPlayers(player);
        }
        else
        {
            DungeonPersistentState* save = ((DungeonMap*)this)->GetPersistanceState();
            // the reset time is set but not added to the scheduler
            // until the players leave the instance
            time_t resettime = objectResetTime + 2 * HOUR;
            if (save->GetResetTime() < resettime)
                save->SetResetTime(resettime);
        }
    }
}


void Map::PrintInfos(ChatHandler& handler)
{
    handler.PSendSysMessage("Performance infos on Map (%u, %u)", GetId(), GetInstanceId());
    handler.PSendSysMessage("%u non player active", m_activeNonPlayers.size());
    handler.PSendSysMessage("%u objects to client update [%u threads]", i_objectsToClientUpdate.size(), _objUpdatesThreads);
    handler.PSendSysMessage("%u objects relocated [%u threads]", i_unitsRelocated.size(), _unitRelocationThreads);
    handler.PSendSysMessage("%u scripts scheduled", m_scriptSchedule.size());
    handler.PSendSysMessage("Vis:%.1f Act:%.1f", m_VisibleDistance, m_GridActivationDistance);
}
