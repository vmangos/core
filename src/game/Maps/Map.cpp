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
#include "MonsterChatBuilder.h"
#include "Weather.h"
#include "MovementBroadcaster.h"
#include "PlayerBroadcaster.h"
#include "GridSearchers.h"
#include "ThreadPool.h"
#include "AuraRemovalMgr.h"
#include "world/world_event_wareffort.h"
#include "CreatureGroups.h"
#include "Geometry.h"

Map::~Map()
{
    UnloadAll(true);

    if (!m_scriptSchedule.empty())
        sScriptMgr.DecreaseScheduledScriptCount(m_scriptSchedule.size());

    if (m_persistentState)
        m_persistentState->SetUsedByMapState(nullptr);         // field pointer can be deleted after this

    if (i_data)
    {
        delete i_data;
        i_data = nullptr;
    }

    //release reference count
    if (m_TerrainData->Release())
        sTerrainMgr.UnloadTerrain(m_TerrainData->GetMapId());

    if (!_corpseToRemove.empty())
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[MAP] Map %u (instance %u) deleted while there are still corpses to remove", GetId(), GetInstanceId());

    delete m_weatherSystem;
    m_weatherSystem = nullptr;
}

GenericTransport* Map::GetTransport(ObjectGuid guid)
{
    if (Transport* transport = HashMapHolder<Transport>::Find(guid))
        return transport;

    if (guid.GetEntry())
        return GetElevatorTransport(guid);

    return nullptr;
}

ElevatorTransport* Map::GetElevatorTransport(ObjectGuid guid)
{
    for (auto pTransport : m_transports)
    {
        if (pTransport->GetObjectGuid() == guid)
            return static_cast<ElevatorTransport*>(pTransport);
    }

    if (auto pTransport = GetGameObject(guid))
        return static_cast<ElevatorTransport*>(pTransport);

    return nullptr;
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
      m_VisibleDistance(DEFAULT_VISIBILITY_DISTANCE), m_persistentState(nullptr),
      m_activeNonPlayersIter(m_activeNonPlayers.end()), m_transportsUpdateIter(m_transports.end()),
      m_createTime(time(nullptr)), i_gridExpiry(expiry), m_TerrainData(sTerrainMgr.LoadTerrain(id)),
      i_data(nullptr), i_script_id(0), m_unloading(false), m_crashed(false),
      _processingSendObjUpdates(false), _processingUnitsRelocation(false),
      m_updateFinished(false), m_updateDiffMod(0), m_GridActivationDistance(DEFAULT_VISIBILITY_DISTANCE),
      _lastPlayersUpdate(WorldTimer::getMSTime()), _lastMapUpdate(WorldTimer::getMSTime()),
      _lastCellsUpdate(WorldTimer::getMSTime()), _inactivePlayersSkippedUpdates(0),
      _objUpdatesThreads(0), _unitRelocationThreads(0), _lastPlayerLeftTime(0),
      m_lastMvtSpellsUpdate(0), _bonesCleanupTimer(0), m_uiScriptedEventsTimer(1000)
{
    m_CreatureGuids.Set(sObjectMgr.GetFirstTemporaryCreatureLowGuid());
    m_GameObjectGuids.Set(sObjectMgr.GetFirstTemporaryGameObjectLowGuid());

    for (uint32 j = 0; j < MAX_NUMBER_OF_GRIDS; ++j)
    {
        for (uint32 idx = 0; idx < MAX_NUMBER_OF_GRIDS; ++idx)
        {
            //z code
            m_bLoadedGrids[idx][j] = false;
            setNGrid(nullptr, idx, j);
        }
    }

    //lets initialize visibility distance for map
    Map::InitVisibilityDistance();

    //add reference for TerrainData object
    m_TerrainData->AddRef();

    m_persistentState = sMapPersistentStateMgr.AddPersistentState(i_mapEntry, GetInstanceId(), 0, IsDungeon());
    m_persistentState->SetUsedByMapState(this);
    m_weatherSystem = new WeatherSystem(this);

    if (IsContinent())
    {
        int numObjThreads = (int)sWorld.getConfig(CONFIG_UINT32_MAP_OBJECTSUPDATE_THREADS);
        if (numObjThreads > 1)
        {
            m_objectThreads.reset(new ThreadPool(numObjThreads -1));
            m_objectThreads->start<ThreadPool::MySQL<ThreadPool::MultiQueue>>();
        }
        m_motionThreads.reset(new ThreadPool(sWorld.getConfig(CONFIG_UINT32_CONTINENTS_MOTIONUPDATE_THREADS)));
        m_visibilityThreads.reset(new ThreadPool(std::max((int)sWorld.getConfig(CONFIG_UINT32_MAP_VISIBILITYUPDATE_THREADS) -1,0)));
        m_cellThreads.reset(new ThreadPool(std::max((int)sWorld.getConfig(CONFIG_UINT32_MTCELLS_THREADS) - 1, 0)));
        m_visibilityThreads->start<ThreadPool::MySQL<ThreadPool::MultiQueue>>();
        m_cellThreads->start();
        m_motionThreads->start();
    }

    LoadElevatorTransports();
}

// Nostalrius
// Active objects system
class ActiveObjectsGridLoader
{
public:
    ActiveObjectsGridLoader(Map* _map) : map(_map) {}
    bool operator()(GameObjectDataPair const& dataPair)
    {
        if (!(dataPair.second.spawn_flags & SPAWN_FLAG_ACTIVE) || dataPair.second.position.mapId != map->GetId())
            return false;
        // Instanciated continents case
        if (map->IsContinent() && map->GetInstanceId() && map->GetInstanceId() != dataPair.second.instanciatedContinentInstanceId)
            return false;
        Cell c(MaNGOS::ComputeCellPair(dataPair.second.position.x, dataPair.second.position.y));
        map->LoadGrid(c, true);
        return false;
    }
    bool operator()(CreatureDataPair const& dataPair)
    {
        if (!(dataPair.second.spawn_flags & SPAWN_FLAG_ACTIVE) || dataPair.second.position.mapId != map->GetId())
            return false;
        // Instanciated continents case
        if (map->IsContinent() && map->GetInstanceId() && map->GetInstanceId() != dataPair.second.instanciatedContinentInstanceId)
            return false;
        Cell c(MaNGOS::ComputeCellPair(dataPair.second.position.x, dataPair.second.position.y));
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
void Map::AddToGrid(T* obj, NGridType* grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).template AddGridObject<T>(obj);
}

template<>
void Map::AddToGrid(GameObject* obj, NGridType* grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).AddGridObject<GameObject>(obj);
    obj->SetCurrentCell(cell);
}

template<>
void Map::AddToGrid(Player* obj, NGridType* grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).AddWorldObject(obj);
}

template<>
void Map::AddToGrid(Corpse* obj, NGridType* grid, Cell const& cell)
{
    // add to world object registry in grid
    if (obj->GetType() != CORPSE_BONES)
        (*grid)(cell.CellX(), cell.CellY()).AddWorldObject(obj);
    // add to grid object store
    else
        (*grid)(cell.CellX(), cell.CellY()).AddGridObject(obj);
}

template<>
void Map::AddToGrid(Creature* obj, NGridType* grid, Cell const& cell)
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
void Map::RemoveFromGrid(T* obj, NGridType* grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).template RemoveGridObject<T>(obj);
}

template<>
void Map::RemoveFromGrid(Player* obj, NGridType* grid, Cell const& cell)
{
    (*grid)(cell.CellX(), cell.CellY()).RemoveWorldObject(obj);
}

template<>
void Map::RemoveFromGrid(Corpse* obj, NGridType* grid, Cell const& cell)
{
    // remove from world object registry in grid
    if (obj->GetType() != CORPSE_BONES)
        (*grid)(cell.CellX(), cell.CellY()).RemoveWorldObject(obj);
    // remove from grid object store
    else
        (*grid)(cell.CellX(), cell.CellY()).RemoveGridObject(obj);
}

template<>
void Map::RemoveFromGrid(Creature* obj, NGridType* grid, Cell const& cell)
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
Map::EnsureGridCreated(GridPair const& p)
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
Map::EnsureGridLoadedAtEnter(Cell const& cell, Player* player)
{
    NGridType* grid;

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

bool Map::EnsureGridLoaded(Cell const& cell)
{
    EnsureGridCreated(GridPair(cell.GridX(), cell.GridY()));
    NGridType* grid = getNGrid(cell.GridX(), cell.GridY());

    if (grid == nullptr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[Map%u][CRASH] Grid [%u:%u] NOT loaded !!", i_id, cell.GridX(), cell.GridY());
        throw new std::string("Crash AT EnsureGridLoaded");
        ASSERT(false);
    }

    if (!grid->isGridObjectDataLoaded())
    {
        //it's important to set it loaded before loading!
        //otherwise there is a possibility of infinity chain (grid loading will be called many times for the same grid)
        //possible scenario:
        //active object A(loaded with loader.LoadN call and added to the  map)
        //summons some active object B, while B added to map grid loading called again and so on..
        ASSERT(!m_unloading && "Trying to load grid while unloading the whole map !");
        grid->setGridObjectDataLoaded(true);
        ObjectGridLoader loader(*grid, this, cell);
        loader.LoadN();

        // Add resurrectable corpses to world object list in grid
        sObjectAccessor.AddCorpsesToGrid(GridPair(cell.GridX(), cell.GridY()), (*grid)(cell.CellX(), cell.CellY()), this);
        //Balance();
        return true;
    }

    return false;
}

void Map::LoadGrid(Cell const& cell, bool no_unload)
{
    EnsureGridLoaded(cell);

    if (no_unload)
        getNGrid(cell.GridX(), cell.GridY())->setUnloadExplicitLock(true);
}

bool Map::Add(Player* player)
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

    player->SetSplineDonePending(false);
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
    EnsureGridLoaded(cell);
    NGridType* grid = getNGrid(cell.GridX(), cell.GridY());
    player->GetViewPoint().Event_AddedToWorld(&(*grid)(cell.CellX(), cell.CellY()));
    UpdateObjectVisibility(player, cell, p);

    // Refresh aura durations
    for (const auto& it : player->GetSpellAuraHolderMap())
        it.second->UpdateAuraDuration();
}

template<class T>
void
Map::Add(T* obj)
{
    MANGOS_ASSERT(obj);

    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::Add: Object (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    obj->SetMap(this);

    Cell cell(p);
    if (obj->isActiveObject() && !IsUnloading())
        EnsureGridLoadedAtEnter(cell);
    else
        EnsureGridCreated(GridPair(cell.GridX(), cell.GridY()));

    NGridType* grid = getNGrid(cell.GridX(), cell.GridY());
    MANGOS_ASSERT(grid != nullptr);

    AddToGrid(obj, grid, cell);
    obj->AddToWorld();

    if (obj->isActiveObject() && !IsUnloading())
        AddToActive(obj);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "%s enters grid[%u,%u]", obj->GetObjectGuid().GetString().c_str(), cell.GridX(), cell.GridY());

    obj->GetViewPoint().Event_AddedToWorld(&(*grid)(cell.CellX(), cell.CellY()));
    obj->SetIsNewObject(true);
    UpdateObjectVisibility(obj, cell, p);
    obj->SetIsNewObject(false);

    if (Creature* pCreature = obj->ToCreature())
        pCreature->CastSpawnSpell();
}

template<>
void Map::Add(GenericTransport* obj)
{
    MANGOS_ASSERT(obj);
    //TODO: Needs clean up. An object should not be added to map twice.
    if (obj->IsInWorld())
        return;

    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::Add: Transport (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return; // Should delete object
    }

    obj->SetMap(this);
    obj->AddToWorld();

    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "%s enters grid[%u,%u]", obj->GetObjectGuid().GetString().c_str(), cell.GridX(), cell.GridY());

    //obj->GetViewPoint().Event_AddedToWorld(&(*grid)(cell.CellX(), cell.CellY()));
    m_transports.insert(obj);

    // Make sure elevator position is right before sending create packet
    if (obj->GetGoType() == GAMEOBJECT_TYPE_TRANSPORT)
        obj->Update(0, 0);

    // Broadcast creation to players
    obj->SendCreateUpdateToMap();
}

template<>
void Map::Add(Transport* obj)
{
    Add<GenericTransport>(obj);
}

template<>
void Map::Add(ElevatorTransport* obj)
{
    Add<GenericTransport>(obj);
}

void Map::LoadElevatorTransports()
{
    ElevatorTransportMapBounds itrPair = sTransportMgr.GetElevatorTransportsForMap(GetId());
    for (auto itr = itrPair.first; itr != itrPair.second; itr++)
    {
        GameObjectData const* pData = sObjectMgr.GetGOData(itr->second);
        if (!pData)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Map::LoadElevatorTransports] Invalid elevator guid %u for map %u!", itr->second, itr->first);
            continue;
        }

        GameObjectInfo const* pInfo = sObjectMgr.GetGameObjectInfo(pData->id);
        if (!pInfo)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Map::LoadElevatorTransports] Missing gameobject template %u for guid %u!", pData->id, itr->second);
            continue;
        }

        if (pInfo->type != GAMEOBJECT_TYPE_TRANSPORT)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Map::LoadElevatorTransports] Non-elevator guid %u for map %u!", itr->second, itr->first);
            continue;
        }

        ElevatorTransport* pGo = new ElevatorTransport;
        if (!pGo->LoadFromDB(itr->second, this))
        {
            delete pGo;
            continue;
        }

        Add<ElevatorTransport>(pGo);
    }
}

void Map::MessageBroadcast(Player const* player, WorldPacket* msg, bool to_self)
{
    CellPair p = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::MessageBroadcast: Player (GUID: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", player->GetGUIDLow(), player->GetPositionX(), player->GetPositionY(), p.x_coord, p.y_coord);
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

void Map::MessageBroadcast(WorldObject const* obj, WorldPacket* msg)
{
    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::MessageBroadcast: Object (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
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

void Map::MessageDistBroadcast(Player const* player, WorldPacket* msg, float dist, bool to_self, bool own_team_only)
{
    CellPair p = MaNGOS::ComputeCellPair(player->GetPositionX(), player->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::MessageBroadcast: Player (GUID: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", player->GetGUIDLow(), player->GetPositionX(), player->GetPositionY(), p.x_coord, p.y_coord);
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

void Map::MessageDistBroadcast(WorldObject const* obj, WorldPacket* msg, float dist)
{
    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::MessageBroadcast: Object (GUID: %u TypeId: %u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
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

bool Map::loaded(GridPair const& p) const
{
    NGridType const* grid = getNGrid(p.x_coord, p.y_coord);
    return (grid && grid->isGridObjectDataLoaded());
}

void Map::UpdateSync(uint32 const diff)
{
    // Needs to be updated here.
    // Can lead to map <-> map teleports
    for (m_transportsUpdateIter = m_transports.begin(); m_transportsUpdateIter != m_transports.end();)
    {
        WorldObject* obj = *m_transportsUpdateIter;
        ++m_transportsUpdateIter;

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

inline void Map::UpdateActiveCellsAsynch(uint32 now, uint32 diff)
{
    resetMarkedCells();

    // Mark all cells that need update
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
        MarkCellsAroundObject(m_mapRefIter->getSource());

    for (m_activeNonPlayersIter = m_activeNonPlayers.begin(); m_activeNonPlayersIter != m_activeNonPlayers.end(); ++m_activeNonPlayersIter)
        MarkCellsAroundObject(*m_activeNonPlayersIter);

    const int nthreads = m_cellThreads->size();
    for (int step = 0; step < 2; step++)
    {
        for (int i = 0; i < nthreads; ++i)
            m_cellThreads << [this, diff, now, i, nthreads, step](){
                UpdateActiveCellsCallback(diff, now, i, nthreads+1, step);
            };
        std::future<void> job = m_cellThreads->processWorkload();
        UpdateActiveCellsCallback(diff, now, nthreads, nthreads+1, step);
        if (job.valid())
            job.wait();
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


inline void Map::UpdateCells(uint32 map_diff)
{
    uint32 now = WorldTimer::getMSTime();
    uint32 diff = WorldTimer::getMSTimeDiff(_lastCellsUpdate, now);

    if (diff < sWorld.getConfig(CONFIG_UINT32_MAPUPDATE_UPDATE_CELLS_DIFF))
        return;

    _lastCellsUpdate = now;
    m_currentTime = std::chrono::time_point_cast<std::chrono::milliseconds>(Clock::now());

    // update active cells around players and active objects
    if (IsContinent() && m_cellThreads->status() == ThreadPool::Status::READY)
        UpdateActiveCellsAsynch(now, diff);
    else
        UpdateActiveCellsSynch(now, diff);

    if (IsContinent() && m_motionThreads->status() == ThreadPool::Status::READY && !unitsMvtUpdate.empty())
    {
        for (std::unordered_set<Unit*>::iterator it = unitsMvtUpdate.begin(); it != unitsMvtUpdate.end(); it++)
            m_motionThreads << [it,diff](){
                 if ((*it)->IsInWorld())
                    (*it)->GetMotionMaster()->UpdateMotionAsync(diff);
            };
        m_motionThreads->processWorkload().wait();
    }
    unitsMvtUpdate.clear();
}


void Map::ProcessSessionPackets(PacketProcessing type)
{
    TimePoint beginTime = std::chrono::time_point_cast<std::chrono::milliseconds>(Clock::now());

    // update worldsessions for existing players
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* plr = m_mapRefIter->getSource();
        if (plr && plr->IsInWorld())
        {
            if (type == PACKET_PROCESS_SPELLS)
                plr->UpdateCooldowns(beginTime);

            WorldSession* pSession = plr->GetSession();
            MapSessionFilter updater(pSession);
            updater.SetProcessType(type);
            pSession->ProcessPackets(updater);
        }
    }

    auto elapsedTime = std::chrono::time_point_cast<std::chrono::milliseconds>(Clock::now()) - beginTime;
    if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_PACKETS) && elapsedTime.count() > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_PACKETS))
        sLog.Out(LOG_PERFORMANCE, LOG_LVL_BASIC, "Map %u inst %u: %3ums to update packets type %u", GetId(), GetInstanceId(), elapsedTime.count(), type);
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

    m_currentTime = std::chrono::time_point_cast<std::chrono::milliseconds>(Clock::now());

    ++_inactivePlayersSkippedUpdates;
    bool updateInactivePlayers = _inactivePlayersSkippedUpdates > sWorld.getConfig(CONFIG_UINT32_INACTIVE_PLAYERS_SKIP_UPDATES);
    if (!IsContinent())
        updateInactivePlayers = true;
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* plr = m_mapRefIter->getSource();
        if (!plr || !plr->IsInWorld())
            continue;
        if (!updateInactivePlayers && (!plr->IsInCombat() && !plr->GetSession()->HasRecentPacket(PACKET_PROCESS_SPELLS) && !plr->HasScheduledEvent()))
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
    m_currentTime = std::chrono::time_point_cast<std::chrono::milliseconds>(Clock::now());
    _dynamicTree.update(t_diff);

    UpdateSessionsMovementAndSpellsIfNeeded();
    // update worldsessions for existing players
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* plr = m_mapRefIter->getSource();
        if (plr && plr->IsInWorld())
        {
            WorldSession* pSession = plr->GetSession();
            MapSessionFilter updater(pSession);

            pSession->Update(updater);
        }
    }
    uint32 sessionsUpdateTime = WorldTimer::getMSTimeDiffToNow(updateMapTime);

    // update players at tick
    std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();
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

    RemoveCorpses();
    RemoveOldBones(t_diff);

    updateMapTime = WorldTimer::getMSTimeDiffToNow(updateMapTime);

    uint32 additionnalWaitTime = 0;
    uint32 additionnalUpdateCounts = 0;
    if (!Instanceable())
    {
        additionnalWaitTime = WorldTimer::getMSTime();
        sMapMgr.MarkContinentUpdateFinished();
        while (!sMapMgr.waitContinentUpdateFinishedUntil(start + std::chrono::milliseconds(sWorld.getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE))))
        {
            start = std::chrono::high_resolution_clock::now();
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
            NGridType* grid = i->getSource();
            GridInfo *info = i->getSource()->getGridInfoRef();
            ++i;                                                // The update might delete the map and we need the next map before the iterator gets invalid
            MANGOS_ASSERT(grid->GetGridState() >= 0 && grid->GetGridState() < MAX_GRID_STATE);
            sMapMgr.UpdateGridState(grid->GetGridState(), *this, *grid, *info, grid->getX(), grid->getY(), t_diff);
        }
    }

    // Process necessary scripts
    if (m_uiScriptedEventsTimer <= t_diff)
    {
        UpdateScriptedEvents();
        m_uiScriptedEventsTimer = 1000u;
    }
    else
        m_uiScriptedEventsTimer -= t_diff;

    ScriptsProcess();

    if (i_data)
        i_data->Update(t_diff);

    m_weatherSystem->UpdateWeathers(t_diff);

    bool packetBroadcastSlow = sWorld.GetBroadcaster()->IsMapSlow(GetInstanceId());
    if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_UPDATE) && updateMapTime > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_UPDATE))
        sLog.Out(LOG_PERFORMANCE, LOG_LVL_BASIC, "Update single map %3u inst %2u: %3ums "
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

void Map::UpdateScriptedEvents()
{
    for (auto itr = m_mScriptedEvents.begin(); itr != m_mScriptedEvents.end();)
    {
        if (itr->second.UpdateEvent())
            m_mScriptedEvents.erase(itr++);
        else
            ++itr;
    }
}

ScriptedEvent* Map::StartScriptedEvent(uint32 id, WorldObject* source, WorldObject* target, uint32 timelimit, uint32 failureCondition, uint32 failureScript, uint32 successCondition, uint32 successScript)
{
    if (m_mScriptedEvents.find(id) != m_mScriptedEvents.end())
        return nullptr;
    
    auto itr = m_mScriptedEvents.emplace(std::piecewise_construct, std::forward_as_tuple(id), std::forward_as_tuple(id, source ? source->GetObjectGuid() : ObjectGuid(), target ? target->GetObjectGuid() : ObjectGuid(), *this, time_t(sWorld.GetGameTime() + timelimit), failureCondition, failureScript, successCondition, successScript));

    return &itr.first->second;
}

bool ScriptedEvent::UpdateEvent()
{
    if (m_bEnded)
        return true;

    if (m_tExpireTime < sWorld.GetGameTime())
    {
        EndEvent(false);
        return true;
    }

    WorldObject* pSource = GetSourceObject();
    WorldObject* pTarget = GetTargetObject();

    if (m_uiFailureCondition && IsConditionSatisfied(m_uiFailureCondition, pTarget, &m_Map, pSource, CONDITION_FROM_MAP_EVENT))
    {
        EndEvent(false);
        return true;
    }
    else if (m_uiSuccessCondition && IsConditionSatisfied(m_uiSuccessCondition, pTarget, &m_Map, pSource, CONDITION_FROM_MAP_EVENT))
    {
        EndEvent(true);
        return true;
    }

    for (const auto& target : m_vTargets)
    {
        WorldObject* pObject = m_Map.GetWorldObject(target.target);

        if (!pObject || !pObject->IsInWorld())
            continue;

        if (target.uiFailureCondition && IsConditionSatisfied(target.uiFailureCondition, pObject, &m_Map, pSource, CONDITION_FROM_MAP_EVENT))
        {
            EndEvent(false);
            return true;
        }
        else if (target.uiSuccessCondition && IsConditionSatisfied(target.uiSuccessCondition, pObject, &m_Map, pSource, CONDITION_FROM_MAP_EVENT))
        {
            EndEvent(true);
            return true;
        }
    }

    return false;
}

void ScriptedEvent::EndEvent(bool bSuccess)
{
    m_bEnded = true;

    if (bSuccess && m_uiSuccessScript)
        m_Map.ScriptsStart(sGenericScripts, m_uiSuccessScript, m_Source, m_Target);
    else if (!bSuccess && m_uiFailureScript)
        m_Map.ScriptsStart(sGenericScripts, m_uiFailureScript, m_Source, m_Target);

    for (const auto& target : m_vTargets)
    {
        WorldObject* pObject = m_Map.GetWorldObject(target.target);

        if (!pObject || !pObject->IsInWorld())
            continue;

        if (bSuccess && target.uiSuccessScript)
            m_Map.ScriptsStart(sGenericScripts, target.uiSuccessScript, target.target, m_Target);
        else if (!bSuccess && target.uiFailureScript)
            m_Map.ScriptsStart(sGenericScripts, target.uiFailureScript, target.target, m_Target);
    }
}

WorldObject* ScriptedEvent::GetSourceObject() const
{
    return m_Map.GetWorldObjectOrPlayer(m_Source);

}
WorldObject* ScriptedEvent::GetTargetObject() const
{
    return m_Map.GetWorldObjectOrPlayer(m_Target);

}

void ScriptedEvent::SendEventToMainTargets(uint32 uiData)
{
    if (Creature* pCreatureSource = ToCreature(GetSourceObject()))
        if (pCreatureSource->AI())
            pCreatureSource->AI()->OnScriptEventHappened(m_uiEventId, uiData, nullptr);

    if (Creature* pCreatureTarget = ToCreature(GetTargetObject()))
        if (pCreatureTarget->AI())
            pCreatureTarget->AI()->OnScriptEventHappened(m_uiEventId, uiData, nullptr);
}

void ScriptedEvent::SendEventToAdditionalTargets(uint32 uiData)
{
    for (const auto& target : m_vTargets)
    {
        if (Creature* pCreature = ToCreature(m_Map.GetWorldObject(target.target)))
            if (pCreature->AI())
                pCreature->AI()->OnScriptEventHappened(m_uiEventId, uiData, nullptr);
    }

}
void ScriptedEvent::SendEventToAllTargets(uint32 uiData)
{
    SendEventToMainTargets(uiData);

    SendEventToAdditionalTargets(uiData);
}

void Map::Remove(Player* player, bool remove)
{
    if (i_data)
        i_data->OnPlayerLeave(player);

    m_mCreatureSummonCount.erase(player->GetGUID());
    m_mCreatureSummonLimit.erase(player->GetGUID());

    if (remove)
        player->CleanupsBeforeDelete();
    else
        player->RemoveFromWorld();

    // this may be called during Map::Update
    // after decrement+unlink, ++m_mapRefIter will continue correctly
    // when the first element of the list is being removed
    // nocheck_prev will return the padding element of the RefManager
    // instead of nullptr in the case of prev
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
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::Remove() i_grids was nullptr x:%d, y:%d", cell.data.Part.grid_x, cell.data.Part.grid_y);
        return;
    }

    DEBUG_FILTER_LOG(LOG_FILTER_PLAYER_MOVES, "Remove player %s from grid[%u,%u]", player->GetName(), cell.GridX(), cell.GridY());
    NGridType* grid = getNGrid(cell.GridX(), cell.GridY());
    MANGOS_ASSERT(grid != nullptr);

    RemoveFromGrid(player, grid, cell);

    if (!sWorld.IsStopped())
    {
        if (!remove)
            SendRemoveTransports(player);
        UpdateObjectVisibility(player, cell, p);
    }

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
Map::Remove(T* obj, bool remove)
{
    CellPair p = MaNGOS::ComputeCellPair(obj->GetPositionX(), obj->GetPositionY());
    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::Remove: Object (GUID: %u TypeId:%u) have invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), p.x_coord, p.y_coord);
        return;
    }

    Cell cell(p);
    if (!loaded(GridPair(cell.data.Part.grid_x, cell.data.Part.grid_y)))
        return;

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Remove object (GUID: %u TypeId:%u) from grid[%u,%u]", obj->GetGUIDLow(), obj->GetTypeId(), cell.data.Part.grid_x, cell.data.Part.grid_y);
    NGridType* grid = getNGrid(cell.GridX(), cell.GridY());
    MANGOS_ASSERT(grid != nullptr);

    m_mCreatureSummonCount.erase(obj->GetGUID());
    m_mCreatureSummonLimit.erase(obj->GetGUID());

    if (obj->isActiveObject())
        RemoveFromActive(obj);

    if (remove)
        obj->CleanupsBeforeDelete();
    else
        obj->RemoveFromWorld();

    if (!sWorld.IsStopped())
        UpdateObjectVisibility(obj, cell, p); // i think will be better to call this function while object still in grid, this changes nothing but logically is better(as for me)
    RemoveFromGrid(obj, grid, cell);

    if (remove)
        // if option set then object already saved at this moment
        if (!sWorld.getConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY))
            obj->SaveRespawnTime(); // requires map not being reset

    obj->ResetMap();
    
    if (remove) // Note: In case resurrectable corpse and pet its removed from global lists in own destructor
        delete obj;
}

template<>
void Map::Remove(GenericTransport* obj, bool remove)
{
    if (obj->isActiveObject())
        RemoveFromActive(obj);
    if (remove)
        obj->CleanupsBeforeDelete();
    else
        obj->RemoveFromWorld();

    obj->SendOutOfRangeUpdateToMap();

    if (m_transportsUpdateIter != m_transports.end())
    {
        TransportsContainer::iterator itr = m_transports.find(obj);
        if (itr == m_transports.end())
            return;
        if (itr == m_transportsUpdateIter)
            ++m_transportsUpdateIter;
        m_transports.erase(itr);
    }
    else
        m_transports.erase(obj);

    obj->ResetMap();

    if (remove)
    {
        // if option set then object already saved at this moment
        if (!sWorld.getConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY))
            obj->SaveRespawnTime();

        delete obj;
    }
}

template<>
void Map::Remove(Transport* obj, bool remove)
{
    Remove<GenericTransport>(obj, remove);
}

template<>
void Map::Remove(ElevatorTransport* obj, bool remove)
{
    Remove<GenericTransport>(obj, remove);
}

void
Map::PlayerRelocation(Player* player, float x, float y, float z, float orientation)
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


    // Ornate Spyglass case, the player's camera is at range in front of him
    // When the player turns, keep it in front of the player
    if (!player->m_movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING_OR_TURN))
        if (player->GetLongSight())
        {
            player->UpdateLongSight();
            player->GetCamera().UpdateVisibilityForOwner();
        }

    NGridType* newGrid = getNGrid(new_cell.GridX(), new_cell.GridY());
    if (!same_cell && newGrid->GetGridState() != GRID_STATE_ACTIVE)
    {
        ResetGridExpiry(*newGrid, 0.1f);
        newGrid->SetGridState(GRID_STATE_ACTIVE);
    }
}


void Map::DoPlayerGridRelocation(Player* player, float x, float y, float z, float orientation)
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

void Map::CreatureRelocation(Creature* creature, float x, float y, float z, float ang)
{
    MANGOS_ASSERT(CheckGridIntegrity(creature, false));

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

bool Map::CreatureCellRelocation(Creature* c, Cell const& new_cell)
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

bool Map::CreatureRespawnRelocation(Creature* c, bool forGridUnload)
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

bool Map::UnloadGrid(uint32 const& x, uint32 const& y, bool pForce)
{
    NGridType* grid = getNGrid(x, y);
    MANGOS_ASSERT(grid != nullptr);

    {
        if (!pForce && ActiveObjectsNearGrid(x, y))
            return false;

        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Unloading grid[%u,%u] for map %u", x, y, i_id);
        ObjectGridUnloader unloader(*grid);

        // Finish remove and delete all creatures with delayed remove before moving to respawn grids
        // Must know real mob position before move
        RemoveAllObjectsInRemoveList();

        // move creatures to respawn grids if this is diff.grid or to remove list
        unloader.MoveToRespawnN();

        // Finish remove and delete all creatures with delayed remove before unload
        RemoveAllObjectsInRemoveList();

        unloader.UnloadN();

        // Unloading a grid can also add creatures to the list of objects to be
        // removed, for example guardian pets. Remove these now to avoid they
        // wouldn't actually be removed because the grid is already unloaded.
        RemoveAllObjectsInRemoveList();

        delete getNGrid(x, y);
        setNGrid(nullptr, x, y);
    }

    int gx = (MAX_NUMBER_OF_GRIDS - 1) - x;
    int gy = (MAX_NUMBER_OF_GRIDS - 1) - y;

    // unload GridMap - it is reference-countable so will be deleted safely when lockCount < 1
    // also simply set Map's pointer to corresponding GridMap object to nullptr
    if (m_bLoadedGrids[gx][gy])
    {
        m_bLoadedGrids[gx][gy] = false;
        m_TerrainData->Unload(gx, gy);
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Unloading grid[%u,%u] for map %u finished", x, y, i_id);
    return true;
}

void Map::UnloadAll(bool pForce)
{
    m_unloading = true;
    RemoveCorpses(true);

    for (GridRefManager<NGridType>::iterator i = GridRefManager<NGridType>::begin(); i != GridRefManager<NGridType>::end();)
    {
        NGridType& grid(*i->getSource());
        ++i;
        UnloadGrid(grid.getX(), grid.getY(), pForce);       // deletes the grid and removes it from the GridRefManager
    }
    for (TransportsContainer::iterator itr = m_transports.begin(); itr != m_transports.end();)
    {
        GenericTransport* transport = *itr;
        ++itr;

        Remove<GenericTransport>(transport, true);
    }

    // Bones list should be empty at this point.
    if (!_bones.empty()) {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Non empty bones list, probably leaking. Please report.");
        _bones.clear();
    }
}

bool Map::CheckGridIntegrity(Creature* c, bool moved)
{
    Cell const& cur_cell = c->GetCurrentCell();

    CellPair xy_val = MaNGOS::ComputeCellPair(c->GetPositionX(), c->GetPositionY());
    Cell xy_cell(xy_val);
    if (xy_cell != cur_cell)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Creature (GUIDLow: %u) X: %f Y: %f (%s) in grid[%u,%u]cell[%u,%u] instead grid[%u,%u]cell[%u,%u]",
                      c->GetGUIDLow(),
                      c->GetPositionX(), c->GetPositionY(), (moved ? "final" : "original"),
                      cur_cell.GridX(), cur_cell.GridY(), cur_cell.CellX(), cur_cell.CellY(),
                      xy_cell.GridX(),  xy_cell.GridY(),  xy_cell.CellX(),  xy_cell.CellY());
        return true;                                        // not crash at error, just output error in debug mode
    }

    return true;
}

char const* Map::GetMapName() const
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
    if (Player* player = obj->ToPlayer())
        UpdateActiveObjectVisibility(player);
}

void Map::UpdateActiveObjectVisibility(Player* player)
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
void Map::UpdateActiveObjectVisibility(Player* player, ObjectGuidSet& visibleGuids)
{
    for (const auto obj : m_activeNonPlayers)
    {
        if (obj->IsInWorld())
        {
            player->UpdateVisibilityOf(player->GetCamera().GetBody(), obj);
            visibleGuids.erase(obj->GetObjectGuid());
        }
    }
}

// Support for compressed data packet
void Map::UpdateActiveObjectVisibility(Player* player, ObjectGuidSet& visibleGuids, UpdateData& data, std::set<WorldObject*>& visibleNow)
{
    for (const auto obj : m_activeNonPlayers)
    {
        if (obj->IsInWorld())
        {
            // TODO: Why is this templated? Why not just base class WorldObject for the target...?
            player->UpdateVisibilityOf(player->GetCamera().GetBody(), obj, data, visibleNow);
            visibleGuids.erase(obj->GetObjectGuid());
        }
    }
}

void Map::SendInitSelf(Player* player)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Creating player data for himself %u", player->GetGUIDLow());

    UpdateData data;

    bool hasTransport = false;

    // attach to player data current transport data
    if (GenericTransport* transport = player->GetTransport())
    {
        hasTransport = true;
        transport->BuildCreateUpdateBlockForPlayer(data, player);
    }

    // build data for self presence in world at own client (one time for map)
    player->BuildCreateUpdateBlockForPlayer(data, player);

    // build other passengers at transport also (they always visible and marked as visible and will not send at visibility update at add to map
    if (GenericTransport* transport = player->GetTransport())
        for (const auto itr : transport->GetPassengers())
            if (player != itr && player->IsInVisibleList(itr))
            {
                hasTransport = true;
                itr->BuildCreateUpdateBlockForPlayer(data, player);
            }

    data.Send(player->GetSession(), hasTransport);
}

void Map::SendInitTransports(Player* player)
{
    // Hack to send out transports
    UpdateData transData;
    bool hasTransport = false;
    for (const auto itr : m_transports)
    {
        if (itr != player->GetTransport())
        {
            hasTransport = true;
            itr->BuildCreateUpdateBlockForPlayer(transData, player);
        }
    }
    transData.Send(player->GetSession(), hasTransport);
}

void Map::SendRemoveTransports(Player* player)
{
    // Hack to send out transports
    UpdateData transData;
    bool hasTransport = false;
    for (const auto itr : m_transports)
    {
        if (itr != player->GetTransport())
        {
            hasTransport = true;
            itr->BuildOutOfRangeUpdateBlock(transData);
        }
    }
    transData.Send(player->GetSession(), hasTransport);
}

inline void Map::setNGrid(NGridType* grid, uint32 x, uint32 y)
{
    if (x >= MAX_NUMBER_OF_GRIDS || y >= MAX_NUMBER_OF_GRIDS)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "map::setNGrid() Invalid grid coordinates found: %d, %d!", x, y);
        MANGOS_ASSERT(false);
    }
    i_grids[x][y] = grid;
}

void Map::AddObjectToRemoveList(WorldObject* obj)
{
    MANGOS_ASSERT(obj->GetMapId() == GetId() && obj->GetInstanceId() == GetInstanceId());

    obj->CleanupsBeforeDelete();                            // remove or simplify at least cross referenced links
    std::lock_guard<std::mutex> lock(i_objectsToRemove_lock);
    i_objectsToRemove.insert(obj);
}

void Map::RemoveAllObjectsInRemoveList()
{
    if (i_objectsToRemove.empty())
        return;

    std::lock_guard<std::mutex> lock(i_objectsToRemove_lock);
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
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Try delete corpse/bones %u that not in map", obj->GetGUIDLow());
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
                if (GenericTransport* transport = go->ToTransport())
                {
                    if (transport->GetGoType() == GAMEOBJECT_TYPE_MO_TRANSPORT ||
                       (transport->GetGoType() == GAMEOBJECT_TYPE_TRANSPORT && m_transports.find(transport) != m_transports.end()))
                        Remove(transport, true);
                    else
                        Remove(go, true);
                }
                else
                    Remove(go, true);
                break;
            }
            case TYPEID_UNIT:
                Remove((Creature*)obj, true);
                break;
            default:
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Non-grid object (TypeId: %u) in grid object removing list, ignored.", obj->GetTypeId());
                break;
        }
    }
}

bool Map::HaveRealPlayers() const
{
    for (const auto& itr : m_mapRefManager)
        if (!itr.getSource()->IsBot())
            return true;
    return false;
}

uint32 Map::GetPlayersCountExceptGMs() const
{
    uint32 count = 0;
    for (const auto& itr : m_mapRefManager)
        if (!itr.getSource()->IsGameMaster())
            ++count;
    return count;
}

void Map::SendToPlayers(WorldPacket const* data, Team team) const
{
    for (const auto& itr : m_mapRefManager)
    {
        if (team == TEAM_NONE || itr.getSource()->GetTeam() == team)
            itr.getSource()->GetSession()->SendPacket(data);
    }
}

bool Map::SendToPlayersInZone(WorldPacket const* data, uint32 zoneId) const
{
    bool foundPlayer = false;
    for (const auto& itr : m_mapRefManager)
    {
        if (itr.getSource()->GetZoneId() == zoneId)
        {
            itr.getSource()->GetSession()->SendPacket(data);
            foundPlayer = true;
        }
    }
    return foundPlayer;
}

void Map::SendDefenseMessage(int32 textId, uint32 zoneId) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    for (const auto& itr : m_mapRefManager)
    {
        Player* pPlayer = itr.getSource();
        char const* text = textId > 0 ? sObjectMgr.GetBroadcastText(textId, pPlayer->GetSession()->GetSessionDbLocaleIndex(), pPlayer->GetGender()) : sObjectMgr.GetMangosString(textId, pPlayer->GetSession()->GetSessionDbLocaleIndex());
        
        WorldPacket data(SMSG_DEFENSE_MESSAGE);
        data << uint32(zoneId);
        data << uint32(strlen(text) + 1);
        data << text;

        pPlayer->GetSession()->SendPacket(&data);
    }
#endif
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

    for (const auto& iter : m_mapRefManager)
    {
        Player* plr = iter.getSource();

        CellPair p = MaNGOS::ComputeCellPair(plr->GetPositionX(), plr->GetPositionY());
        if ((cell_min.x_coord <= p.x_coord && p.x_coord <= cell_max.x_coord) &&
                (cell_min.y_coord <= p.y_coord && p.y_coord <= cell_max.y_coord))
            return true;
    }

    for (const auto obj : m_activeNonPlayers)
    {
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
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Active creature (GUID: %u Entry: %u) added to grid[%u,%u] but spawn grid[%u,%u] not loaded.",
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
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Active creature (GUID: %u Entry: %u) removed from grid[%u,%u] but spawn grid[%u,%u] not loaded.",
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
        std::unique_ptr<QueryResult> result;

        if (Instanceable())
            result = CharacterDatabase.PQuery("SELECT data FROM instance WHERE id = '%u'", i_InstanceId);
        else
            result = CharacterDatabase.PQuery("SELECT data FROM world WHERE map = '%u'", GetId());

        if (result)
        {
            Field* fields = result->Fetch();
            char const* data = fields[0].GetString();
            if (data)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Loading instance data for `%s` (Map: %u Instance: %u)", sScriptMgr.GetScriptName(i_script_id), GetId(), i_InstanceId);
                i_data->Load(data);
            }
            else
                i_data->Create();
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
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "New instance data, \"%s\" ,initialized!", sScriptMgr.GetScriptName(i_script_id));
        i_data->Initialize();
        i_data->Create();
    }
}

void Map::SetWeather(uint32 zoneId, WeatherType type, float grade, bool permanently)
{
    Weather* wth = m_weatherSystem->FindOrCreateWeather(zoneId);
    wth->SetWeather(WeatherType(type), grade, this, permanently);
}

void Map::TeleportAllPlayersTo(TeleportLocation loc)
{
    while (HavePlayers())
    {
        if (Player* plr = m_mapRefManager.getFirst()->getSource())
        {
            // Teleport to specified location and removes the player from this map (if the map exists).
            // Todo : we can add some specific location if needed (ex: map exit location for dungeon)
            switch (loc)
            {
                case TELEPORT_LOCATION_HOMEBIND:
                {
                    ASSERT(plr->GetHomeBindMap() != GetId());
                    plr->TeleportToHomebind();
                    break;
                }
                case TELEPORT_LOCATION_BG_ENTRY_POINT:
                {
                    plr->TeleportToBGEntryPoint();
                    break;
                }
                default:
                    break;
            }
            // just in case, remove the player from the list explicitly here as well to prevent a possible infinite loop
            // note that this remove is not needed if the code works well in other places
            plr->GetMapRef().unlink();
        }
    }
}

template void Map::Add(Corpse*);
template void Map::Add(Creature*);
template void Map::Add(GameObject*);
template void Map::Add(DynamicObject*);

template void Map::Remove(Corpse*, bool);
template void Map::Remove(Creature*, bool);
template void Map::Remove(GameObject*, bool);
template void Map::Remove(DynamicObject*, bool);

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
bool DungeonMap::CanEnter(Player* player)
{
    if (player->GetMapRef().getTarget() == this)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "InstanceMap::CanEnter - player %s(%u) already in map %d,%d!", player->GetName(), player->GetGUIDLow(), GetId(), GetInstanceId());
        MANGOS_ASSERT(false);
        return false;
    }

    // cannot enter if the instance is full (player cap), GMs don't count
    uint32 maxPlayers = GetMaxPlayers();
    if (!player->IsGameMaster() && GetPlayersCountExceptGMs() >= maxPlayers)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MAP: Instance '%u' of map '%s' cannot have more than '%u' players. Player '%s' rejected", GetInstanceId(), GetMapName(), maxPlayers, player->GetName());
        player->SendTransferAborted(TRANSFER_ABORT_MAX_PLAYERS);
        return false;
    }

    if (m_resetAfterUnload)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[DungeonReset] %s attempted to enter map %u, instance %u during reset", player->GetName(), i_InstanceId);
        player->SendTransferAborted(TRANSFER_ABORT_NOT_FOUND);
        return false;
    }

    // World of Warcraft Client Patch 1.11.0 (2006-06-20)
    // - Instituted an anti-exploit measure on certain encounters (almost 
    //   entirely raid bosses).These encounters will prevent people from
    //   zoning into the instance while that encounter is engaged.If you
    //   attempt to zone into the instance while that encounter is engaged,
    //   you will be resurrected at the outside entrance.We will be making
    //   adjustments to the entrances to Molten Core and Blackwing Lair to
    //   accommodate this change.Combat resurrections, soulstones,
    //   reincarnate, etc.will still work fine.This is primarily to combat
    //   graveyard rushing in instances.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    Group* pGroup = player->GetGroup();
    if (IsRaid() && GetInstanceData() && GetInstanceData()->IsEncounterInProgress() && 
        pGroup && pGroup->InCombatToInstance(GetInstanceId()) && player->IsAlive() && !player->IsGameMaster())
    {
        player->SendTransferAborted(TRANSFER_ABORT_ZONE_IN_COMBAT);
        return false;
    }
#endif

    return Map::CanEnter(player);
}

/*
    Do map specific checks and add the player to the map if successful.
*/
bool DungeonMap::Add(Player* player)
{
    // TODO: Not sure about checking player level: already done in HandleAreaTriggerOpcode
    // GMs still can teleport player in instance.
    // Is it needed?

    if (!CanEnter(player))
        return false;

    BindPlayerOrGroupOnEnter(player);

    // for normal instances cancel the reset schedule when the
    // first player enters (no players yet)
    SetResetSchedule(false);
    player->AddInstanceEnterTime(GetInstanceId(), time(nullptr));

    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MAP: Player '%s' is entering instance '%u' of map '%s'", player->GetName(), GetInstanceId(), GetMapName());
    // initialize unload state
    m_unloadTimer = 0;
    m_resetAfterUnload = false;
    m_unloadWhenEmpty = false;

    // this will acquire the same mutex so it cannot be in the previous block
    Map::Add(player);

    return true;
}

void DungeonMap::BindPlayerOrGroupOnEnter(Player* player)
{
    // check for existing instance binds
    InstancePlayerBind *playerBind = player->GetBoundInstance(GetId());
    if (playerBind && playerBind->perm)
    {
        // cannot enter other instances if bound permanently
        if (playerBind->state != GetPersistanceState())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "InstanceMap::Add: player %s(%d) is permanently bound to instance %d,%d,%d,%d,%d but he is being put in instance %d,%d,%d,%d,%d",
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
        Group* pGroup = player->GetGroup();
        if (pGroup)
        {
            // solo saves should be reset when entering a group
            InstanceGroupBind *groupBind = pGroup->GetBoundInstance(GetId());

            // bind to the group or keep using the group save
            if (!groupBind)
            {
                pGroup->BindToInstance(GetPersistanceState(), false);

                // the personal save has become a group save
                if (playerBind)
                {
                    // cannot jump to a different instance without resetting it
                    MANGOS_ASSERT(playerBind->state == GetPersistentState());
                    player->UnbindInstance(GetId());
                }

                // reset personal saves of other members now that group save is created
                for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
                {
                    if (Player* pMember = itr->getSource())
                    {
                        if (pMember == player)
                            continue;

                        if (pMember->GetMapId() != GetId())
                        {
                            InstancePlayerBind* memberBind = pMember->GetBoundInstance(GetId());
                            if (memberBind && !memberBind->perm)
                                pMember->UnbindInstance(GetId());
                        }
                    }
                }
            }
            else if (playerBind)
            {
                // cannot jump to a different instance without resetting it
                MANGOS_ASSERT(playerBind->state == GetPersistentState());
            }
            else
            {
                // cannot jump to a different instance without resetting it
                if (groupBind->state != GetPersistentState())
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "InstanceMap::Add: %s is being put in instance %d,%d but he is in group (Id: %d) which is bound to instance %d,%d!",
                        player->GetObjectGuid().GetString().c_str(), GetPersistentState()->GetMapId(),
                        GetPersistentState()->GetInstanceId(),
                        pGroup->GetId(), groupBind->state->GetMapId(),
                        groupBind->state->GetInstanceId());

                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MapSave players: %d, group count: %d",
                        GetPersistanceState()->GetPlayerCount(), GetPersistanceState()->GetGroupCount());

                    if (groupBind->state)
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GroupBind save players: %d, group count: %d", groupBind->state->GetPlayerCount(), groupBind->state->GetGroupCount());
                    else
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "GroupBind save nullptr");
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
}

void DungeonMap::Update(uint32 t_diff)
{
    Map::Update(t_diff);
}

void DungeonMap::Remove(Player* player, bool remove)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MAP: Removing player '%s' from instance '%u' of map '%s' before relocating to other map", player->GetName(), GetInstanceId(), GetMapName());

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
            for (const auto& itr : m_mapRefManager)
                itr.getSource()->SendResetFailedNotify();
        }
        else
        {
            if (method == INSTANCE_RESET_GLOBAL)
            {
                // set the homebind timer for players inside (1 minute)
                for (const auto& itr : m_mapRefManager)
                    itr.getSource()->m_InstanceValid = false;
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

void DungeonMap::PermBindAllPlayers(Player* player)
{
    Group* group = player->GetGroup();
    // group members outside the instance group don't get bound
    for (const auto& itr : m_mapRefManager)
    {
        Player* plr = itr.getSource();

        if (m_resetAfterUnload)
        {
            sLog.Player(plr->GetSession(), LOG_BASIC, LOG_LVL_ERROR, "Attempt to permanently save player to raid (map %u, instance %u) scheduled for reset on unload and already deleted from DB!", GetId(), GetInstanceId());
            plr->TeleportToHomebind();
            continue;
        }

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
    TeleportAllPlayersTo(TELEPORT_LOCATION_HOMEBIND);

    if (m_resetAfterUnload)
        GetPersistanceState()->DeleteRespawnTimesAndData();

    Map::UnloadAll(pForce);
}

void DungeonMap::SendResetWarnings(uint32 timeLeft) const
{
    for (const auto& itr : m_mapRefManager)
        itr.getSource()->SendInstanceResetWarning(GetId(), timeLeft);
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
    : Map(id, expiry, InstanceId), m_bg(nullptr)
{
    //lets initialize visibility distance for BG
    BattleGroundMap::InitVisibilityDistance();
}

BattleGroundMap::~BattleGroundMap()
{
    UnloadAll(true);
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

bool BattleGroundMap::CanEnter(Player* player)
{
    if (player->GetMapRef().getTarget() == this)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BGMap::CanEnter - player %u already in map!", player->GetGUIDLow());
        MANGOS_ASSERT(false);
        return false;
    }

    if (player->GetBattleGroundId() != GetInstanceId())
        return false;

    // player number limit is checked in bgmgr, no need to do it here

    return Map::CanEnter(player);
}

bool BattleGroundMap::Add(Player* player)
{
    if (!CanEnter(player))
        return false;

    // reset instance validity, battleground maps do not homebind
    player->m_InstanceValid = true;

    return Map::Add(player);
}

void BattleGroundMap::Remove(Player* player, bool remove)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "MAP: Removing player '%s' from bg '%u' of map '%s' before relocating to other map", player->GetName(), GetInstanceId(), GetMapName());
    Map::Remove(player, remove);
}

void BattleGroundMap::SetUnload()
{
    m_unloadTimer = MIN_UNLOAD_DELAY;
}

void BattleGroundMap::UnloadAll(bool pForce)
{
    TeleportAllPlayersTo(TELEPORT_LOCATION_BG_ENTRY_POINT);

    Map::UnloadAll(pForce);
}

// Put scripts in the execution queue
void Map::ScriptsStart(ScriptMapMap const& scripts, uint32 id, ObjectGuid sourceGuid, ObjectGuid targetGuid)
{
    // Find the script map
    ScriptMapMap::const_iterator s = scripts.find(id);
    if (s == scripts.end())
        return;

    // Schedule script execution for all scripts in the script map
    ScriptMap const* s2 = &(s->second);
    bool immedScript = false;
    
    std::lock_guard<MapMutexType> lock(m_scriptSchedule_lock);
    for (ScriptMap::const_iterator iter = s2->begin(); iter != s2->end(); ++iter)
    {
        ScriptAction sa;
        sa.sourceGuid = sourceGuid;
        sa.targetGuid = targetGuid;

        sa.script = &iter->second;
        m_scriptSchedule.insert(ScriptScheduleMap::value_type(time_t(sWorld.GetGameTime() + iter->first), sa));
        if (iter->first == 0)
            immedScript = true;

        sScriptMgr.IncreaseScheduledScriptsCount();
    }
}

void Map::ScriptCommandStart(ScriptInfo const& script, uint32 delay, ObjectGuid sourceGuid, ObjectGuid targetGuid)
{
    // NOTE: script record _must_ exist until command executed

    ScriptAction sa;
    sa.sourceGuid = sourceGuid;
    sa.targetGuid = targetGuid;

    sa.script = &script;
    std::lock_guard<std::mutex> lock(m_scriptSchedule_lock);
    m_scriptSchedule.insert(ScriptScheduleMap::value_type(time_t(sWorld.GetGameTime() + delay), sa));
    sScriptMgr.IncreaseScheduledScriptsCount();
}

bool Map::ScriptCommandStartDirect(ScriptInfo const& script, WorldObject* source, WorldObject* target)
{
    if ((script.command != SCRIPT_COMMAND_DISABLED) && 
        FindScriptFinalTargets(source, target, script) && 
        (!script.condition || IsConditionSatisfied(script.condition, target, this, source, CONDITION_FROM_DBSCRIPTS)))
        return (this->*(m_ScriptCommands[script.command]))(script, source, target);

    return (script.raw.data[4] & SF_GENERAL_ABORT_ON_FAILURE) != 0;
}

bool Map::FindScriptInitialTargets(WorldObject*& source, WorldObject*& target, ScriptAction const& step)
{
    source = GetWorldObjectOrPlayer(step.sourceGuid);

    if (source && !source->IsInWorld())
        source = nullptr;

    target = GetWorldObjectOrPlayer(step.targetGuid);

    if (target && !target->IsInWorld())
        target = nullptr;

    if ((step.script->raw.data[4] & SF_GENERAL_SKIP_MISSING_TARGETS) &&
        (!source && !step.sourceGuid.IsEmpty() || !target && !step.targetGuid.IsEmpty()))
        return false;

    return true;
}

bool Map::FindScriptFinalTargets(WorldObject*& source, WorldObject*& target, ScriptInfo const& script)
{
    // Used when searching for nearby object as target.
    WorldObject* original_source = source;

    // we swap target and source if data_flags & 0x1
    if (script.raw.data[4] & SF_GENERAL_SWAP_INITIAL_TARGETS)
        std::swap(source, target);

    // If we have a buddy lets find it.
    if (script.target_type)
    {
        if (!(target = GetTargetByType(source, target, this, script.target_type, script.target_param1, script.target_param2)))
        {
            if (!(script.raw.data[4] & SF_GENERAL_SKIP_MISSING_TARGETS))
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "FindScriptTargets: Failed to find target for script with id %u (target_param1: %u), (target_param2: %u), (target_type: %u).", script.id, script.target_param1, script.target_param2, script.target_type);
            return false;
        }
    }

    // we swap target and source again if data_flags & 0x2
    // this way we have all possible combinations with 3 targets
    if (script.raw.data[4] & SF_GENERAL_SWAP_FINAL_TARGETS)
        std::swap(source, target);

    // we replace the target with the source if data_flags & 0x4
    if (script.raw.data[4] & SF_GENERAL_TARGET_SELF)
        target = source;

    return true;
}

void Map::TerminateScript(ScriptAction const& step)
{
    for (auto rmItr = m_scriptSchedule.begin(); rmItr != m_scriptSchedule.end();)
    {
        if (rmItr->second.IsSameScript(step.script->id, step.sourceGuid, step.targetGuid))
        {
            m_scriptSchedule.erase(rmItr++);
            sScriptMgr.DecreaseScheduledScriptCount();
        }
        else
            ++rmItr;
    }
}

// Process queued scripts
void Map::ScriptsProcess()
{
    std::unique_lock<std::mutex> lock(m_scriptSchedule_lock);

    if (m_scriptSchedule.empty())
        return;

    // Process overdue queued scripts
    ScriptScheduleMap::iterator iter = m_scriptSchedule.begin();
    // ok as multimap is a *sorted* associative container
    while (!m_scriptSchedule.empty() && (iter->first <= sWorld.GetGameTime()))
    {
        ScriptAction const step = iter->second;
        lock.unlock();

        WorldObject* source = nullptr;
        WorldObject* target = nullptr;

        bool scriptResultOk = (step.script->command != SCRIPT_COMMAND_DISABLED) &&
                              FindScriptInitialTargets(source, target, step) &&
                              FindScriptFinalTargets(source, target, *step.script) &&
                              (!step.script->condition || IsConditionSatisfied(step.script->condition, target, this, source, CONDITION_FROM_DBSCRIPTS));

        if (scriptResultOk)
            scriptResultOk = (this->*(m_ScriptCommands[step.script->command]))(*step.script, source, target);
        else
            scriptResultOk = (step.script->raw.data[4] & SF_GENERAL_ABORT_ON_FAILURE) != 0;

        lock.lock();

        // Command returns true if we should abort script.
        if (scriptResultOk)
            TerminateScript(step);
        else
        {
            iter = m_scriptSchedule.begin();

            if (iter->second.script == step.script)
                m_scriptSchedule.erase(iter);

            sScriptMgr.DecreaseScheduledScriptCount();
        }

        iter = m_scriptSchedule.begin();
    }
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
    return plr && plr->GetMap() == this ? plr : nullptr;
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
    Corpse* ret = ObjectAccessor::GetCorpseInMap(guid, GetId());
    return ret && ret->GetInstanceId() == GetInstanceId() ? ret : nullptr;
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

    return nullptr;
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
 * Function returns world object in world at CURRENT map, so any except MO transports
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
            return corpse && corpse->IsInWorld() ? corpse : nullptr;
        }
        case HIGHGUID_TRANSPORT:
            return GetElevatorTransport(guid);
        case HIGHGUID_MO_TRANSPORT:
        default:
            break;
    }

    return nullptr;
}

/**
 * Function returns world object in world at CURRENT map, or player anywhere
 */
WorldObject* Map::GetWorldObjectOrPlayer(ObjectGuid guid)
{
    if (guid)
    {
        switch (guid.GetHigh())
        {
            case HIGHGUID_UNIT:
                return GetCreature(guid);
            case HIGHGUID_PET:
                return GetPet(guid);
            case HIGHGUID_PLAYER:
                return HashMapHolder<Player>::Find(guid);
            case HIGHGUID_GAMEOBJECT:
                return GetGameObject(guid);
            case HIGHGUID_CORPSE:
                return HashMapHolder<Corpse>::Find(guid);
        }
    }

    return nullptr;
}

void Map::AddUpdateObject(Object *obj)
{
    if (_processingSendObjUpdates)
        return;
    std::lock_guard<std::mutex> lock(i_objectsToClientUpdate_lock);
    i_objectsToClientUpdate.insert(obj);
}

void Map::RemoveUpdateObject(Object *obj)
{
    ASSERT(!_processingSendObjUpdates);
    std::lock_guard<std::mutex> lock(i_objectsToClientUpdate_lock);
    i_objectsToClientUpdate.erase( obj );
}

void Map::AddRelocatedUnit(Unit *obj)
{
    if (_processingUnitsRelocation)
        return;
    std::lock_guard<std::mutex> lock(i_unitsRelocated_lock);
    i_unitsRelocated.insert(obj);
}

void Map::RemoveRelocatedUnit(Unit *obj)
{
    ASSERT(!_processingUnitsRelocation);
    std::lock_guard<std::mutex> lock(i_unitsRelocated_lock);
    i_unitsRelocated.erase(obj);
}

void Map::AddUnitToMovementUpdate(Unit *unit)
{
    std::lock_guard<std::mutex> lock(unitsMvtUpdate_lock);
    unitsMvtUpdate.insert(unit);
}

void Map::RemoveUnitFromMovementUpdate(Unit *unit)
{
    std::lock_guard<std::mutex> lock(unitsMvtUpdate_lock);
    unitsMvtUpdate.erase(unit);
}


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
//#define FORCE_OLD_THREADCOUNT
#ifndef FORCE_OLD_THREADCOUNT
    int threads = m_objectThreads ? m_objectThreads->size() +1 : 1;
#else
    int threads = 1;
    if (IsContinent())
        threads = m_objectThreads ? m_objectThreads->size() +1 : 1;
    if (!_objUpdatesThreads)
        _objUpdatesThreads = 1;
    if (threads < _objUpdatesThreads)
        _objUpdatesThreads = threads;
#endif
    if (threads > objectsCount)
        threads = objectsCount;
    int step = objectsCount / threads;

    ASSERT(step > 0);
    ASSERT(threads >= 1);

    if (objectsCount % threads)
        step++;

    std::vector<std::unordered_set<Object*>::iterator> t;
    t.reserve(i_objectsToClientUpdate.size() + 1);
    for (std::unordered_set<Object*>::iterator it = i_objectsToClientUpdate.begin(); it != i_objectsToClientUpdate.end(); it++)
        t.push_back(it);
    t.push_back(i_objectsToClientUpdate.end());
    uint32 timeout = sWorld.getConfig(CONFIG_UINT32_MAP_OBJECTSUPDATE_TIMEOUT);
//#define FORCE_NO_ATOMIC_INT
#if ATOMIC_INT_LOCK_FREE == 2 && !defined(FORCE_NO_ATOMIC_INT)
    std::atomic_int ait(0);
    auto f = [&t, &ait, beginTime=now, timeout](){
        UpdateDataMapType update_players; // Player -> UpdateData
        int it;
        while ((it = ait++) < t.size() -1)
        {
            (*t[it])->BuildUpdateData(update_players);
            if (WorldTimer::getMSTimeDiffToNow(beginTime) > timeout)
                break;
        }

        for (UpdateDataMapType::iterator iter = update_players.begin(); iter != update_players.end(); ++iter)
            iter->second.Send(iter->first->GetSession());
    };
    std::future<void> job;
    if (m_objectThreads) {
        for (int i = 1; i < threads; i++)
            m_objectThreads << f;
        job = m_objectThreads->processWorkload();
    }

    f();

    if (job.valid())
        job.wait();
    if (ait >= i_objectsToClientUpdate.size()) //ait is increased before checks, so max value is `objectsCount + threads`
        i_objectsToClientUpdate.clear();
    else
        i_objectsToClientUpdate.erase(t.front(), t[ait]);
#else
    std::vector<int> counters;
    for (int i = 0; i < threads; i++)
        counters.push_back(i * step);
    auto f = [&t, &counters, step, beginTime=now, timeout](int id){
        UpdateDataMapType update_players; // Player -> UpdateData
        for (int &it = counters[id]; it < std::min((int)t.size() -1, step * (id + 1)); it++)
        {
            if (WorldTimer::getMSTimeDiffToNow(beginTime) > timeout)
                break;
            (*t[it])->BuildUpdateData(update_players);
        }
        for (UpdateDataMapType::iterator iter = update_players.begin(); iter != update_players.end(); ++iter)
            iter->second.Send(iter->first->GetSession());
    };
    std::future<void> job;
    if (m_objectThreads) {
        for (int i = 1; i < threads; i++)
            m_objectThreads << std::bind(f, i);
        job = m_objectThreads->processWorkload();
    }

    f(0);

    if (job.valid())
        job.wait();
    for (int i = 0; i < threads; i++)
        i_objectsToClientUpdate.erase(t[step * i], t[counters[i]]);
#endif

#ifdef FORCE_OLD_THREADCOUNT
    // If we timeout, use more threads !
    if (!i_objectsToClientUpdate.empty())
        ++_objUpdatesThreads;
    else
        --_objUpdatesThreads;
#endif

    _processingSendObjUpdates = false;
#ifdef MAP_SENDOBJECTUPDATES_PROFILE
    uint32 diff = WorldTimer::getMSTimeDiffToNow(now);
    if (diff > 50)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SendObjectUpdates in %04u ms [%u threads. %3u/%3u]", diff, threads, objectsCount - i_objectsToClientUpdate.size(), objectsCount);
#endif
}

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
        threads = m_visibilityThreads->size() + 1;
    if (!_unitRelocationThreads)
        _unitRelocationThreads = 1;
    if (threads < _unitRelocationThreads)
        _unitRelocationThreads = threads;
    if (threads > objectsCount)
        threads = objectsCount;
    uint32 step = objectsCount / threads;
    
    ASSERT(step > 0);

    std::vector<std::unordered_set<Unit*>::iterator> t;
    t.reserve(i_unitsRelocated.size());
    for (std::unordered_set<Unit*>::iterator it = i_unitsRelocated.begin(); it != i_unitsRelocated.end(); it++)
        t.emplace_back(it);
    std::atomic<int> ait(0);
    uint32 timeout = sWorld.getConfig(CONFIG_UINT32_MAP_VISIBILITYUPDATE_TIMEOUT);
    auto f = [&t, &ait, beginTime=now, timeout](){
        int it = ait++;
        while (it < t.size())
        {
            (*t[it])->ProcessRelocationVisibilityUpdates();
            if (WorldTimer::getMSTimeDiffToNow(beginTime) > timeout)
                break;
            it = ait++;
        }
    };
    for (uint32 i = 0; i < threads -1; ++i)
        m_visibilityThreads << f;

    std::future<void> job;
    if (m_visibilityThreads)
        job = m_visibilityThreads->processWorkload();

    f();
    if (job.valid())
        job.wait();
    if (ait >= i_unitsRelocated.size()) //ait is increased before checks, so max value is `objectsCount + threads`
        i_unitsRelocated.clear();
    else
        i_unitsRelocated.erase(t.front(), t[ait]);

    if (!i_unitsRelocated.empty())
        ++_unitRelocationThreads;
    else
        --_unitRelocationThreads;

    _processingUnitsRelocation = false;

#ifdef MAP_UPDATEVISIBILITY_PROFILE
    uint32 diff = WorldTimer::getMSTimeDiffToNow(now);
    if (diff > 50)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "VisibilityUpdate in %04u ms [%u threads/done %u/%u]", diff, threads, objectsCount - i_unitsRelocated.size(), objectsCount);
#endif
}

uint32 Map::GenerateLocalLowGuid(HighGuid guidhigh)
{
    // TODOLOCK
    // TODO: for map local guid counters possible force reload map instead shutdown server at guid counter overflow
    std::lock_guard<std::mutex> lock(m_guidGenerators_lock);
    uint32 guid = 0;
    switch (guidhigh)
    {
        case HIGHGUID_UNIT:
            guid = m_CreatureGuids.Generate();
            break;
        case HIGHGUID_TRANSPORT:
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
    return guid;
}

void Map::SendMonsterTextToMap(int32 textId, Language language, ChatMsg chatMsg, uint32 creatureId, WorldObject const* pSource, Unit const* pTarget)
{
    if (pSource)
    {
        MaNGOS::MonsterChatBuilder say_build(*pSource, chatMsg, textId, language, pTarget);
        MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> say_do(say_build);

        Map::PlayerList const& pList = GetPlayers();
        for (const auto& itr : pList)
            say_do(itr.getSource());
    }
    else
    {
        CreatureInfo const* cInfo = sObjectMgr.GetCreatureTemplate(creatureId);
        if (!cInfo)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SendMonsterTextToMap called with no source and invalid creature id!");
            return;
        }

        MaNGOS::StaticMonsterChatBuilder say_build(cInfo, chatMsg, textId, language, pTarget);
        MaNGOS::LocalizedPacketDo<MaNGOS::StaticMonsterChatBuilder> say_do(say_build);

        Map::PlayerList const& pList = GetPlayers();
        for (const auto& itr : pList)
            say_do(itr.getSource());
    }
}

/**
* Function to play sound to all players in map
*
* @param soundId Played Sound
* @param zoneId Id of the Zone to which the sound should be restricted
*/
void Map::PlayDirectSoundToMap(uint32 soundId, uint32 zoneId /*=0*/) const
{
    WorldPacket data(SMSG_PLAY_SOUND, 4);
    data << uint32(soundId);

    Map::PlayerList const& pList = GetPlayers();
    for (const auto& itr : pList)
        if (!zoneId || itr.getSource()->GetZoneId() == zoneId)
            itr.getSource()->SendDirectMessage(&data);
}

bool Map::isInLineOfSight(float x1, float y1, float z1, float x2, float y2, float z2, bool checkDynLos, bool ignoreM2Model) const
{
    ASSERT(MaNGOS::IsValidMapCoord(x1, y1, z1));
    ASSERT(MaNGOS::IsValidMapCoord(x2, y2, z2));

    return VMAP::VMapFactory::createOrGetVMapManager()->isInLineOfSight(GetId(), x1, y1, z1, x2, y2, z2, ignoreM2Model)
    && (!checkDynLos || CheckDynamicTreeLoS(x1, y1, z1, x2, y2, z2, ignoreM2Model));
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
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Map::GetHitPosition vmaps corrects gained with static objects! new dest coords are X:%f Y:%f Z:%f", destX, destY, destZ);
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
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Map::GetHitPosition vmaps corrects gained with dynamic objects! new dest coords are X:%f Y:%f Z:%f", resultPos.x, resultPos.y, resultPos.z);
        destX = resultPos.x;
        destY = resultPos.y;
        destZ = resultPos.z;
    }

    return result0 || result1;
}

bool Map::GetWalkHitPosition(GenericTransport* transport, float srcX, float srcY, float srcZ, float& destX, float& destY, float& destZ, uint32 moveAllowedFlags, float zSearchDist, bool locatedOnSteepSlope) const
{
    if (!MaNGOS::IsValidMapCoord(srcX, srcY, srcZ))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::GetWalkHitPosition invalid source coordinates,"
            "x1: %f y1: %f z1: %f, x2: %f, y2: %f, z2: %f on map %d",
            srcX, srcY, srcZ, destX, destY, destZ, GetId());
        return false;
    }

    if (!MaNGOS::IsValidMapCoord(destX, destY, destZ))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map::GetWalkHitPosition invalid destination coordinates,"
            "x1: %f y1: %f z1: %f, x2: %f, y2: %f, z2: %f on map %u",
            srcX, srcY, srcZ, destX, destY, destZ, GetId());
        return false;
    }

    MMAP::MMapManager* mmap = MMAP::MMapFactory::createOrGetMMapManager();
    dtNavMeshQuery const* m_navMeshQuery = transport ? mmap->GetModelNavMeshQuery(transport->GetDisplayId()) : mmap->GetNavMeshQuery(GetId());
    if (!m_navMeshQuery)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WalkHitPos: No nav mesh loaded !");
        return false;
    }

    // Find navmesh position near source
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
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WalkHitPos: Start poly not found");
        return false;
    }
    filter.setExcludeFlags(NAV_STEEP_SLOPES);

    // Walk on the surface found
    dtPolyRef visited[50] = {0};
    int visitedCount = 0;
    float t = 0.0f;
    float hitNormal[3] = {0}; // Normal of wall hit. Not always defined by raycast (if no wall hit)
    dtStatus result = m_navMeshQuery->raycast(startRef, closestPoint, endPosition, &filter, &t, hitNormal, visited, &visitedCount, 50);
    if (dtStatusFailed(result) || !visitedCount)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WalkHitPos: Navmesh raycast failed");
        return false;
    }

    // We hit a wall - calculate new endposition
    if ((t < 1) && (t > 0))
    {
        for (int i = 0; i < 3; ++i)
            endPosition[i] = point[i] + (endPosition[i] - point[i]) * hitNormal[i];
    }

    if (dtStatusFailed(m_navMeshQuery->closestPointOnPoly(visited[visitedCount - 1], endPosition, endPosition, nullptr)))
        return false;

    // Compute complete path, and at each path step, check for dynamic LoS collision
    // Rq: This is non-sense on Transports, since we are using position offsets ...
    float pathPoints[MAX_POINT_PATH_LENGTH * VERTEX_SIZE];
    int pointCount = 0;
    result = m_navMeshQuery->findStraightPath(
        closestPoint,         // start position
        endPosition,          // end position
        visited,              // current path
        visitedCount,         // length of current path
        pathPoints,           // [out] path corner points
        nullptr,
        nullptr,
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

    // Finalize Z-position using vmaps (more accurate)
    if (transport)
        destZ += 0.5f;
    else
        destZ = GetHeight(destX, destY, destZ);
    return true;
}

// This will generate a random point to all directions in water for the provided point in radius range.
bool Map::GetSwimRandomPosition(float& x, float& y, float& z, float radius, GridMapLiquidData& liquid_status, bool randomRange/* = true*/) const
{
    float const angle = rand_norm_f() * (M_PI_F * 2.0f);
    float const range = (randomRange ? rand_norm_f() : 1.f) * radius;

    float i_x = x + range * cos(angle);
    float i_y = y + range * sin(angle);

    // get real ground of new point
    // the code consider cylinder instead of sphere for possible z
    float ground = GetHeight(i_x, i_y, z);
    if (ground > INVALID_HEIGHT) // GetHeight can fail
    {
        float min_z = z - 0.7f * radius; // 0.7 to have a bit a "flat" cylinder, TODO which value looks nicest
        if (min_z < ground)
            min_z = ground + 0.5f; // Get some space to prevent under map

        float liquidLevel = liquid_status.level - 2.0f; // just to make the generated point is in water and not on surface or a bit above

        // if not enough space to fit the creature better is to return from here
        if (min_z > liquidLevel)
            return false;

        // Mobs underwater do not move along Z axis
        //float max_z = std::max(z + 0.7f * radius, min_z);
        //max_z = std::min(max_z, liquidLevel);
        x = i_x;
        y = i_y;
        if (min_z > z)
            z = min_z;
        return true;
    }
    return false;
}

bool Map::GetWalkRandomPosition(GenericTransport* transport, float &x, float &y, float &z, float maxRadius, uint32 moveAllowedFlags) const
{
    ASSERT(MaNGOS::IsValidMapCoord(x, y, z));

    // Find the navMeshQuery.
    MMAP::MMapManager* mmap = MMAP::MMapFactory::createOrGetMMapManager();
    dtNavMeshQuery const* m_navMeshQuery = transport ? mmap->GetModelNavMeshQuery(transport->GetDisplayId()) : mmap->GetNavMeshQuery(GetId());
    float radius = maxRadius * rand_norm_f();

    // Find a valid position nearby.
    float endPosition[3];
    float point[3] = { y, z, x };
    if (transport)
        transport->CalculatePassengerOffset(point[2], point[0], point[1]);

    if (m_navMeshQuery)
    {
        // ATTENTION : Positions are Y,Z,X
        float closestPoint[3] = { 0.0f, 0.0f, 0.0f };
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
        endPosition[0] = y + radius*(y - point[0]) / d;
        endPosition[1] = z;
        endPosition[2] = x + radius*(x - point[2]) / d;
        float t = 0.0f;
        dtPolyRef visited[10] = { 0 };
        int visitedCount = 0;
        float hitNormal[3] = { 0 }; // Normal of wall hit.
        result = m_navMeshQuery->raycast(startRef, closestPoint, endPosition, &filter, &t, hitNormal, visited, &visitedCount, 10);
        if (dtStatusFailed(result) || !visitedCount)
            return false;
        for (int i = 0; i < 3; ++i)
            endPosition[i] += hitNormal[i] * 0.5f;
        result = m_navMeshQuery->closestPointOnPoly(visited[visitedCount - 1], endPosition, endPosition, nullptr);
        if (dtStatusFailed(result) || !MaNGOS::IsValidMapCoord(endPosition[2], endPosition[0], endPosition[1]))
            return false;
    }
    else
    {
        Geometry::GetNearPoint2DAroundPosition(point[2], point[0], endPosition[2], endPosition[0], radius, frand(0, M_PI_F * 2));
        endPosition[1] = point[1];
    }

    if (transport)
        transport->CalculatePassengerPosition(endPosition[2], endPosition[0], endPosition[1]);
    if (!MaNGOS::IsValidMapCoord(endPosition[2], endPosition[0], endPosition[1]))
        return false;
    x = endPosition[2];
    y = endPosition[0];
    z = endPosition[1];
    // 2. We specify with the vmaps (the first step basically allows you to select the floor)
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

GameObjectModel const* Map::FindDynamicObjectCollisionModel(float x1, float y1, float z1, float x2, float y2, float z2)
{
    ASSERT(MaNGOS::IsValidMapCoord(x1, y1, z1));
    ASSERT(MaNGOS::IsValidMapCoord(x2, y2, z2));
    Vector3 const pos1 = Vector3(x1, y1, z1);
    Vector3 const pos2 = Vector3(x2, y2, z2);
    std::shared_lock<std::shared_timed_mutex> lock(_dynamicTree_lock);
    return _dynamicTree.getObjectHit(pos1, pos2);
}

void Map::RemoveGameObjectModel(const GameObjectModel &model)
{
    std::lock_guard<std::shared_timed_mutex> lock(_dynamicTree_lock);
    _dynamicTree.remove(model);
    _dynamicTree.balance();
}

void Map::InsertGameObjectModel(const GameObjectModel &model)
{
    std::lock_guard<std::shared_timed_mutex> lock(_dynamicTree_lock);
    _dynamicTree.insert(model);
    _dynamicTree.balance();
}

bool Map::ContainsGameObjectModel(const GameObjectModel &model) const
{
    std::shared_lock<std::shared_timed_mutex> lock(_dynamicTree_lock);
    return _dynamicTree.contains(model);
}

bool Map::GetDynamicObjectHitPos(Movement::Vector3 start, Movement::Vector3 end, Movement::Vector3 &out, float finalDistMod) const
{
    std::shared_lock<std::shared_timed_mutex> lock(_dynamicTree_lock);
    return _dynamicTree.getObjectHitPos(start, end, out, finalDistMod);
}

float Map::GetDynamicTreeHeight(float x, float y, float z, float maxSearchDist) const
{
    std::shared_lock<std::shared_timed_mutex> lock(_dynamicTree_lock);
    return _dynamicTree.getHeight(x, y, z, maxSearchDist);
}

bool Map::CheckDynamicTreeLoS(float x1, float y1, float z1, float x2, float y2, float z2, bool ignoreM2Model) const
{
    std::shared_lock<std::shared_timed_mutex> lock(_dynamicTree_lock);
    return _dynamicTree.isInLineOfSight(x1, y1, z1, x2, y2, z2, ignoreM2Model);
}


void Map::CrashUnload()
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Map %u (instance %u) crashed. Has players: %d", GetId(), GetInstanceId(), HavePlayers());
    // Logout players
    for (m_mapRefIter = m_mapRefManager.begin(); m_mapRefIter != m_mapRefManager.end(); ++m_mapRefIter)
    {
        Player* player = m_mapRefIter->getSource();
        if (player)
        {
            WorldSession* session = player->GetSession();
            sLog.Player(session, LOG_CHAR, "Logout", LOG_LVL_DETAIL, "");
            session->SetPlayer(nullptr);
            player->SaveInventoryAndGoldToDB(); // Prevent possible exploits
            player->UninviteFromGroup();

            if (player->GetSocial())
            {
                sSocialMgr.RemovePlayerSocial(player->GetGUIDLow());
                session->GetMasterPlayer()->SetSocial(nullptr);
            }

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
        m_persistentState->SetUsedByMapState(nullptr);         // field pointer can be deleted after this
        m_persistentState = nullptr;
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
            time_t resetTime = objectResetTime + 2 * HOUR;
            if (save->GetResetTime() < resetTime)
                save->SetResetTime(resetTime);
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

bool Map::ShouldUpdateMap(uint32 now, uint32 inactiveTimeLimit)
{
    auto update = true;

    if (!HavePlayers() && inactiveTimeLimit)
    {
        if (WorldTimer::getMSTimeDiff(_lastPlayerLeftTime, now) > inactiveTimeLimit)
            update = false;
    }

    // If we have corpses to be removed, we should force an update of the map.
    // Otherwise players may die elsewhere and generate another corpse while
    // this one still exists. If the server crashes before the map unloads,
    // they'll have two active corpses. We can't immediately remove the corpse
    // in AddCorpseToRemove because it can be called concurrently.
    if (!update)
    {
        std::lock_guard<MapMutexType> guard(_corpseRemovalLock);
        if (!_corpseToRemove.empty())
            update = true;
    }

    return update;
}

/**
 * Add a corpse to be removed, conditionally spawning bones in its place.
 * May be called from other maps or threads
 */
void Map::AddCorpseToRemove(Corpse* corpse, ObjectGuid looter_guid)
{
    std::lock_guard<MapMutexType> guard(_corpseRemovalLock);
    _corpseToRemove.emplace_back(corpse, looter_guid);
}

/**
* Remove bones from the list. Called from Corpse destructor.
*/
void Map::RemoveBones(Corpse* corpse)
{
    std::lock_guard<MapMutexType> guard(_bonesLock);
    _bones.remove(corpse);
}

/**
 * Remove any recovered corpses in the map.
 */
void Map::RemoveCorpses(bool unload)
{
    std::lock_guard<MapMutexType> guard(_corpseRemovalLock);
    for (auto iter = _corpseToRemove.begin(); iter != _corpseToRemove.end();)
    {
        auto corpse = iter->first;
        auto& looterGuid = iter->second;

        Remove(corpse, false);

        ObjectGuid const& player_guid = corpse->GetOwnerGuid();
        Player* owner = GetPlayer(player_guid);

        bool mapSpawnsBones = IsBattleGround() ? sWorld.getConfig(CONFIG_BOOL_DEATH_BONES_BG) : sWorld.getConfig(CONFIG_BOOL_DEATH_BONES_WORLD);
        // Create the bones only if the map and the grid is loaded at the corpse's location
        // Don't spawn bones if the map is unloading
        if ((looterGuid || mapSpawnsBones) && !unload && !IsRemovalGrid(corpse->GetPositionX(), corpse->GetPositionY()))
        {
            // Create bones, don't change Corpse
            Corpse* bones = new Corpse;
            bones->Create(corpse->GetGUIDLow());
            if (owner)
            {
                bones->SetFactionTemplate(owner->GetFactionTemplateEntry());
                if (looterGuid)
                {
                    // Notify the client that the corpse is gone
                    WorldPacket cdata(MSG_CORPSE_QUERY, 1);
                    cdata << uint8(0);
                    owner->GetSession()->SendPacket(&cdata);
                }
            }

            for (int i = 3; i < CORPSE_END; ++i)                    // don't overwrite guid and object type
                bones->SetUInt32Value(i, corpse->GetUInt32Value(i));

            bones->SetGrid(corpse->GetGrid());
            bones->Relocate(corpse->GetPositionX(), corpse->GetPositionY(), corpse->GetPositionZ(), corpse->GetOrientation());

            bones->SetUInt32Value(CORPSE_FIELD_FLAGS, CORPSE_FLAG_UNK2 | CORPSE_FLAG_BONES);
            bones->SetGuidValue(CORPSE_FIELD_OWNER, player_guid);

            for (int i = 0; i < EQUIPMENT_SLOT_END; ++i)
            {
                if (corpse->GetUInt32Value(CORPSE_FIELD_ITEM + i))
                    bones->SetUInt32Value(CORPSE_FIELD_ITEM + i, 0);
            }

            // add bones in grid store if grid loaded where corpse placed
            Add(bones);

            if (looterGuid)
            {
                // Now we must make bones lootable, and send player loot
                bones->SetFlag(CORPSE_FIELD_DYNAMIC_FLAGS, CORPSE_DYNFLAG_LOOTABLE);

                if (Player* looter = GetPlayer(looterGuid))
                {
                    bones->lootRecipient = looter;
                    looter->SendLoot(bones->GetObjectGuid(), LOOT_INSIGNIA, owner);
                }
            }

            // Only take the lock for a second
            {
                std::lock_guard<MapMutexType> guard(_bonesLock);
                _bones.push_back(bones);
            }
        }

        // Save player after corpse removal to prevent the player logging in
        // with no corpse but as a ghost, unless we are logging out in which
        // case a save is already scheduled
        if (owner && !IsBattleGround() && !owner->GetSession()->PlayerLogoutWithSave())
            owner->SaveToDB();

        corpse->DeleteFromDB();
        delete corpse;

        iter = _corpseToRemove.erase(iter);
    }
}

/**
 * Cleanup any old bones. We don't need to check every update, instead let
 * it be configurable
 */
void Map::RemoveOldBones(uint32 const diff)
{
    _bonesCleanupTimer += diff;
    if (_bonesCleanupTimer < sWorld.GetWorldUpdateTimerInterval(WUPDATE_CORPSES))
        return;

    _bonesCleanupTimer = 0u;

    time_t now = time(nullptr);
    std::lock_guard<MapMutexType> guard(_bonesLock);
    for (auto iter = _bones.begin(); iter != _bones.end();)
    {
        Corpse* bones = *iter;
        if (bones->IsExpired(now))
        {
            Remove(bones, true);
            iter = _bones.erase(iter);
        }
        else
            ++iter;
    }
}

GameObject* Map::SummonGameObject(uint32 entry, float x, float y, float z, float ang, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime, uint32 worldMask)
{
    GameObjectInfo const* goinfo = sObjectMgr.GetGameObjectInfo(entry);
    if (!goinfo)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Gameobject template %u not found in database!", entry);
        return nullptr;
    }
    GameObject* go = GameObject::CreateGameObject(entry);
    if (!go->Create(GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), entry, this, x, y, z, ang, rotation0, rotation1, rotation2, rotation3, 100, GO_STATE_READY))
    {
        delete go;
        return nullptr;
    }
    go->SetRespawnTime(respawnTime);
    go->SetSpawnedByDefault(false);

    Add(go);
    go->SetWorldMask(worldMask);
    return go;
}

Creature* Map::LoadCreatureSpawn(uint32 dbGuid, bool delaySpawn)
{
    CreatureData const* pSpawnData = sObjectMgr.GetCreatureData(dbGuid);
    if (!pSpawnData)
        return nullptr;

    if (GetId() != pSpawnData->position.mapId)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Attempt to load creature spawn guid %u on wrong map %u.", dbGuid, GetId());
        return nullptr;
    }

    Creature* pCreature;
    ObjectGuid guid = pSpawnData->GetObjectGuid(dbGuid);
    if (pCreature = GetCreature(guid))
        return pCreature;

    if (!IsLoaded(pSpawnData->position.x, pSpawnData->position.y))
        return nullptr;

    pCreature = new Creature();
    if (!pCreature->LoadFromDB(dbGuid, this, true))
    {
        delete pCreature;
        return nullptr;
    }

    if (delaySpawn)
    {
        pCreature->SetRespawnTime(pCreature->GetRespawnDelay());
        if (sWorld.getConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY) || pCreature->IsWorldBoss())
            pCreature->SaveRespawnTime();
    }
    
    Add(pCreature);
    return pCreature;
}

Creature* Map::LoadCreatureSpawnWithGroup(uint32 leaderDbGuid, bool delaySpawn)
{
    Creature* pLeader = LoadCreatureSpawn(leaderDbGuid, delaySpawn);
    if (!pLeader)
        return nullptr;

    if (CreatureGroup* pGroup = pLeader->GetCreatureGroup())
    {
        for (auto const& itr : pGroup->GetMembers())
            LoadCreatureSpawn(itr.first.GetCounter(), delaySpawn);

        if (!delaySpawn && pGroup->HasGroupFlag(OPTION_RESPAWN_TOGETHER) && pLeader->IsAlive())
            pGroup->RespawnAll(pLeader);
    }

    return pLeader;
}
