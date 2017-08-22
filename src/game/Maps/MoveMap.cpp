/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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

#include "GridMap.h"
#include "Log.h"
#include "World.h"

#include "MoveMap.h"
#include "MoveMapSharedDefines.h"

namespace MMAP
{
// ######################## MMapFactory ########################
// our global singelton copy
MMapManager *g_MMapManager = NULL;

MMapManager* MMapFactory::createOrGetMMapManager()
{
    if (g_MMapManager == NULL)
        g_MMapManager = new MMapManager();

    return g_MMapManager;
}

void MMapFactory::clear()
{
    if (g_MMapManager)
    {
        delete g_MMapManager;
        g_MMapManager = NULL;
    }
}

// ######################## MMapManager ########################
MMapManager::~MMapManager()
{
    for (MMapDataSet::iterator i = loadedMMaps.begin(); i != loadedMMaps.end(); ++i)
        delete i->second;

    for (MMapDataSet::iterator i = loadedModels.begin(); i != loadedModels.end(); ++i)
        delete i->second;

    // by now we should not have maps loaded
    // if we had, tiles in MMapData->mmapLoadedTiles, their actual data is lost!
}

void MMapManager::CleanUpNavQuery(std::thread::id tid)
{
    std::shared_lock<std::shared_timed_mutex> rlock(loadedMMaps_lock);
    //DEBUG_LOG("Cleaning up any dtNavMeshQuery related to tid %u in loadedMMaps", tid);
    for (MMapDataSet::iterator itr = loadedMMaps.begin(); itr != loadedMMaps.end(); ++itr)
        RemoveThreadNavMeshQueries(tid, itr->second);

    rlock.unlock();

    std::unique_lock<std::shared_timed_mutex> wlock (loadedModels_lock);
    //DEBUG_LOG("Cleaning up any dtNavMeshQuery related to tid %u in loadedModels", tid);
    for (MMapDataSet::iterator itr = loadedModels.begin(); itr != loadedModels.end(); ++itr)
        RemoveThreadNavMeshQueries(tid, itr->second);

}

void MMapManager::CleanUpCurrentThreadNavQuery()
{
    CleanUpNavQuery(std::this_thread::get_id());
}

void MMapManager::RemoveThreadNavMeshQueries(std::thread::id tid, MMapData *mmap)
{
    // Speed up if the TID doesn't have any existing dtNavMeshQuery
    std::shared_lock<std::shared_timed_mutex> rlock(mmap->navMeshQueries_lock);
    NavMeshQuerySet::iterator itr = mmap->navMeshQueries.find(tid);
    if (itr == mmap->navMeshQueries.end())
        return;

    rlock.unlock();
    // Safe since running TID uniqueness is guaranteed
    std::unique_lock<std::shared_timed_mutex> wlock(mmap->navMeshQueries_lock);
    dtFreeNavMeshQuery(itr->second);
    mmap->navMeshQueries.erase(itr);
}

bool MMapManager::loadMapData(uint32 mapId)
{
    std::shared_lock<std::shared_timed_mutex> rlock(loadedMMaps_lock);
    // we already have this map loaded?
    if (loadedMMaps.find(mapId) != loadedMMaps.end())
    {
        return true;
    }
    rlock.unlock();

    // load and init dtNavMesh - read parameters from file
    uint32 pathLen = sWorld.GetDataPath().length() + strlen("mmaps/%03i.mmap") + 1;
    char *fileName = new char[pathLen];
    snprintf(fileName, pathLen, (sWorld.GetDataPath() + "mmaps/%03i.mmap").c_str(), mapId);

    FILE* file = fopen(fileName, "rb");
    if (!file)
    {
        DEBUG_LOG("MMAP:loadMapData: Error: Could not open mmap file '%s'", fileName);
        delete [] fileName;
        return false;
    }

    dtNavMeshParams params;
    fread(&params, sizeof(dtNavMeshParams), 1, file);
    fclose(file);

    dtNavMesh* mesh = dtAllocNavMesh();
    MANGOS_ASSERT(mesh);
    dtStatus r = mesh->init(&params);
    if (r != DT_SUCCESS)
    {
        dtFreeNavMesh(mesh);
        sLog.outError("MMAP:loadMapData: Failed to initialize dtNavMesh for mmap %03u from file %s with %u tiles. Result 0x%x.", mapId, fileName, params.maxTiles, r);
        delete [] fileName;
        return false;
    }

    delete [] fileName;

    DETAIL_LOG("MMAP:loadMapData: Loaded %03i.mmap", mapId);

    // store inside our map list
    MMapData* mmap_data = new MMapData(mesh);
    mmap_data->mmapLoadedTiles.clear();

    std::unique_lock<std::shared_timed_mutex> wlock(loadedMMaps_lock);
    if (loadedMMaps.find(mapId) == loadedMMaps.end())
        loadedMMaps.insert(std::pair<uint32, MMapData*>(mapId, mmap_data));
    else
        delete mmap_data;

    return true;
}

uint32 MMapManager::packTileID(int32 x, int32 y)
{
    return uint32(x << 16 | y);
}

bool MMapManager::loadMap(uint32 mapId, int32 x, int32 y)
{
    // make sure the mmap is loaded and ready to load tiles
    if (!loadMapData(mapId))
        return false;

    // get this mmap data
    std::shared_lock<std::shared_timed_mutex> rlock(loadedMMaps_lock);
    MMapData* mmap = loadedMMaps[mapId];
    rlock.unlock();
    MANGOS_ASSERT(mmap->navMesh);

    // check if we already have this tile loaded
    uint32 packedGridPos = packTileID(x, y);
    std::unique_lock<std::mutex> wlock(mmap->tilesLoading_lock);
    if (mmap->mmapLoadedTiles.find(packedGridPos) != mmap->mmapLoadedTiles.end())
        return false;

    // load this tile :: mmaps/MMMXXYY.mmtile
    uint32 pathLen = sWorld.GetDataPath().length() + strlen("mmaps/%03i%02i%02i.mmtile") + 1;
    char *fileName = new char[pathLen];
    snprintf(fileName, pathLen, (sWorld.GetDataPath() + "mmaps/%03i%02i%02i.mmtile").c_str(), mapId, x, y);

    FILE *file = fopen(fileName, "rb");
    if (!file)
    {
        DEBUG_LOG("MMAP:loadMap: Could not open mmtile file '%s'", fileName);
        delete [] fileName;
        return false;
    }
    delete [] fileName;

    // read header
    MmapTileHeader fileHeader;
    fread(&fileHeader, sizeof(MmapTileHeader), 1, file);

    if (fileHeader.mmapMagic != MMAP_MAGIC)
    {
        sLog.outError("MMAP:loadMap: Bad header in mmap %03u%02i%02i.mmtile", mapId, x, y);
        fclose(file);
        return false;
    }

    if (fileHeader.mmapVersion != MMAP_VERSION)
    {
        sLog.outError("MMAP:loadMap: %03u%02i%02i.mmtile was built with generator v%i, expected v%i",
                      mapId, x, y, fileHeader.mmapVersion, MMAP_VERSION);
        fclose(file);
        return false;
    }

    unsigned char* data = (unsigned char*)dtAlloc(fileHeader.size, DT_ALLOC_PERM);
    MANGOS_ASSERT(data);

    size_t result = fread(data, fileHeader.size, 1, file);
    if (!result)
    {
        sLog.outError("MMAP:loadMap: Bad header or data in mmap %03u%02i%02i.mmtile", mapId, x, y);
        fclose(file);
        return false;
    }

    fclose(file);

    dtMeshHeader* header = (dtMeshHeader*)data;
    dtTileRef tileRef = 0;

    // memory allocated for data is now managed by detour, and will be deallocated when the tile is removed
    dtStatus dResult = mmap->navMesh->addTile(data, fileHeader.size, DT_TILE_FREE_DATA, 0, &tileRef);
    if (dtStatusSucceed(dResult))
    {
        mmap->mmapLoadedTiles.insert(std::pair<uint32, dtTileRef>(packedGridPos, tileRef));
        ++loadedTiles;
        return true;
    }
    else
    {
        sLog.outError("MMAP:loadMap: Could not load %03u%02i%02i.mmtile into navmesh [result 0x%x]", mapId, x, y, dResult);
        dtFree(data);
        return false;
    }

    return false;
}

bool MMapManager::unloadMap(uint32 mapId, int32 x, int32 y)
{
    // check if we have this map loaded
    std::shared_lock<std::shared_timed_mutex> rlock(loadedMMaps_lock);
    if (loadedMMaps.find(mapId) == loadedMMaps.end())
    {
        // file may not exist, therefore not loaded
        DEBUG_LOG("MMAP:unloadMap: Asked to unload not loaded navmesh map. %03u%02i%02i.mmtile", mapId, x, y);
        return false;
    }

    MMapData* mmap = loadedMMaps[mapId];
    rlock.unlock();

    // check if we have this tile loaded
    uint32 packedGridPos = packTileID(x, y);
    std::unique_lock<std::mutex> guard(mmap->tilesLoading_lock);
    if (mmap->mmapLoadedTiles.find(packedGridPos) == mmap->mmapLoadedTiles.end())
    {
        // file may not exist, therefore not loaded
        DEBUG_LOG("MMAP:unloadMap: Asked to unload not loaded navmesh tile. %03u%02i%02i.mmtile", mapId, x, y);
        return false;
    }

    dtTileRef tileRef = mmap->mmapLoadedTiles[packedGridPos];

    // unload, and mark as non loaded
    if (DT_SUCCESS != mmap->navMesh->removeTile(tileRef, NULL, NULL))
    {
        // this is technically a memory leak
        // if the grid is later reloaded, dtNavMesh::addTile will return error but no extra memory is used
        // we cannot recover from this error - assert out
        sLog.outError("MMAP:unloadMap: Could not unload %03u%02i%02i.mmtile from navmesh", mapId, x, y);
        MANGOS_ASSERT(false);
    }
    else
    {
        mmap->mmapLoadedTiles.erase(packedGridPos);
        --loadedTiles;
        return true;
    }

    return false;
}

bool MMapManager::unloadMap(uint32 mapId)
{
    std::shared_lock<std::shared_timed_mutex> rlock(loadedMMaps_lock);
    if (loadedMMaps.find(mapId) == loadedMMaps.end())
    {
        // file may not exist, therefore not loaded
        DEBUG_LOG("MMAP:unloadMap: Asked to unload not loaded navmesh map %03u", mapId);
        return false;
    }

    // unload all tiles from given map
    MMapData* mmap = loadedMMaps[mapId];

    std::unique_lock<std::mutex> guard(mmap->tilesLoading_lock);
    for (MMapTileSet::iterator i = mmap->mmapLoadedTiles.begin(); i != mmap->mmapLoadedTiles.end(); ++i)
    {
        uint32 x = (i->first >> 16);
        uint32 y = (i->first & 0x0000FFFF);
        if (DT_SUCCESS != mmap->navMesh->removeTile(i->second, NULL, NULL))
            sLog.outError("MMAP:unloadMap: Could not unload %03u%02i%02i.mmtile from navmesh", mapId, x, y);
        else
            --loadedTiles;
    }

    delete mmap;
    loadedMMaps.erase(mapId);
    rlock.unlock();

    DETAIL_LOG("MMAP:unloadMap: Unloaded %03i.mmap", mapId);

    return true;
}

bool MMapManager::unloadMapInstance(uint32 mapId, std::thread::id instanceId)
{
    // check if we have this map loaded
    std::shared_lock<std::shared_timed_mutex> rlock(loadedMMaps_lock);
    if (loadedMMaps.find(mapId) == loadedMMaps.end())
    {
        // file may not exist, therefore not loaded
        DEBUG_LOG("MMAP:unloadMapInstance: Asked to unload not loaded navmesh map %03u", mapId);
        return false;
    }

    MMapData* mmap = loadedMMaps[mapId];
    rlock.unlock();
    std::unique_lock<std::shared_timed_mutex> wlock(mmap->navMeshQueries_lock);
    if (mmap->navMeshQueries.find(instanceId) == mmap->navMeshQueries.end())
    {
        DEBUG_LOG("MMAP:unloadMapInstance: Asked to unload not loaded dtNavMeshQuery mapId %03u instanceId %u", mapId, instanceId);
        return false;
    }

    dtNavMeshQuery* query = mmap->navMeshQueries[instanceId];

    dtFreeNavMeshQuery(query);
    mmap->navMeshQueries.erase(instanceId);
    wlock.unlock();
    DETAIL_LOG("MMAP:unloadMapInstance: Unloaded mapId %03u instanceId %u", mapId, instanceId);

    return true;
}

dtNavMesh const* MMapManager::GetNavMesh(uint32 mapId)
{
    dtNavMesh const* mesh = NULL;
    std::shared_lock<std::shared_timed_mutex> rlock(loadedMMaps_lock);
    MMapDataSet::const_iterator itr = loadedMMaps.find(mapId);

    if (itr != loadedMMaps.end())
        mesh = itr->second->navMesh;

    return mesh;
}

dtNavMeshQuery const* MMapManager::GetNavMeshQuery(uint32 mapId)
{
    std::shared_lock<std::shared_timed_mutex> mmaps_rlock(loadedMMaps_lock);
    if (loadedMMaps.find(mapId) == loadedMMaps.end())
        return nullptr;

    MMapData* mmap = loadedMMaps[mapId];
    mmaps_rlock.unlock();

    // We store dtNavMeshQueries by thread ID since they are not thread-safe. This poses a problem
    // since, over time, the TID is not unique, and we are left with stale queries. Furthermore, 
    // since the pool of IDs is so large, we allocate a significant amount of memory which may or
    // may not ever be used again. We must be sure to clean up the nav query once a thread exits.
    // Alive thread ID uniqueness is guaranteed for both Unix and Windows.
    std::thread::id tid = std::this_thread::get_id();

    std::shared_lock<std::shared_timed_mutex> rlock(mmap->navMeshQueries_lock);
    NavMeshQuerySet::iterator it = mmap->navMeshQueries.find(tid);
    dtNavMeshQuery* navMeshQuery = NULL;
    if (it == mmap->navMeshQueries.end())
    {
        rlock.unlock();
        // This is safe since thread IDs are unique - no other thread will be adding with the same ID,
        // therefore we can safely drop the lock and acquire it again without another thread inserting
        // with the same ID
        std::unique_lock<std::shared_timed_mutex> wlock(mmap->navMeshQueries_lock);

        // allocate mesh query
        navMeshQuery = dtAllocNavMeshQuery();
        MANGOS_ASSERT(navMeshQuery);
        if (DT_SUCCESS != navMeshQuery->init(mmap->navMesh, 2048, tid))
        {
            wlock.unlock();
            dtFreeNavMeshQuery(navMeshQuery);
            sLog.outError("MMAP:GetNavMeshQuery: Failed to initialize dtNavMeshQuery for mapId %03u thread %u", mapId, tid);
            return NULL;
        }

        DETAIL_LOG("MMAP:GetNavMeshQuery: created dtNavMeshQuery for mapId %03u thread %u", mapId, tid);
        mmap->navMeshQueries.insert(std::pair<std::thread::id, dtNavMeshQuery*>(tid, navMeshQuery));
    }
    else
        navMeshQuery = it->second;

    return navMeshQuery;
}

bool MMapManager::loadGameObject(uint32 displayId)
{
    // we already have this map loaded?
    std::shared_lock<std::shared_timed_mutex> rlock(loadedModels_lock);
    if (loadedModels.find(displayId) != loadedModels.end())
        return true;

    rlock.unlock();
    // load and init dtNavMesh - read parameters from file
    uint32 pathLen = sWorld.GetDataPath().length() + strlen("mmaps/go%04i.mmap") + 1;
    char *fileName = new char[pathLen];
    snprintf(fileName, pathLen, (sWorld.GetDataPath() + "mmaps/go%04i.mmap").c_str(), displayId);

    FILE* file = fopen(fileName, "rb");
    if (!file)
    {
        DEBUG_LOG("MMAP:loadGameObject: Error: Could not open mmap file %s", fileName);
        delete [] fileName;
        return false;
    }

    MmapTileHeader fileHeader;
    fread(&fileHeader, sizeof(MmapTileHeader), 1, file);

    if (fileHeader.mmapMagic != MMAP_MAGIC)
    {
        sLog.outError("MMAP:loadGameObject: Bad header in mmap %s", fileName);
        fclose(file);
        return false;
    }

    if (fileHeader.mmapVersion != MMAP_VERSION)
    {
        sLog.outError("MMAP:loadGameObject: %s was built with generator v%i, expected v%i",
                      fileName, fileHeader.mmapVersion, MMAP_VERSION);
        fclose(file);
        return false;
    }
    unsigned char* data = (unsigned char*)dtAlloc(fileHeader.size, DT_ALLOC_PERM);
    MANGOS_ASSERT(data);

    size_t result = fread(data, fileHeader.size, 1, file);
    if (!result)
    {
        sLog.outError("MMAP:loadGameObject: Bad header or data in mmap %s", fileName);
        fclose(file);
        return false;
    }

    fclose(file);

    dtNavMesh* mesh = dtAllocNavMesh();
    MANGOS_ASSERT(mesh);
    dtStatus r = mesh->init(data, fileHeader.size, DT_TILE_FREE_DATA);
    if (dtStatusFailed(r))
    {
        dtFreeNavMesh(mesh);
        sLog.outError("MMAP:loadGameObject: Failed to initialize dtNavMesh from file %s. Result 0x%x.", fileName, r);
        delete [] fileName;
        return false;
    }
    DETAIL_LOG("MMAP:loadGameObject: Loaded file %s [size=%u]", fileName, fileHeader.size);
    delete [] fileName;

    // Check again after load. We allow threads to load independently for performance if
    // none is found, but we only want one instance to be managed. Saves other threads
    // having to wait for the lock in GetModelNavMeshQuery while this thread loads
    MMapData* mmap_data = new MMapData(mesh);
    std::unique_lock<std::shared_timed_mutex> wlock(loadedModels_lock);
    if (loadedModels.find(displayId) == loadedModels.end())
        loadedModels.insert(std::pair<uint32, MMapData*>(displayId, mmap_data));
    else
        delete mmap_data;

    return true;
}

dtNavMeshQuery const* MMapManager::GetModelNavMeshQuery(uint32 displayId)
{
    std::shared_lock<std::shared_timed_mutex> rlock(loadedModels_lock);
    if (loadedModels.find(displayId) == loadedModels.end())
        return nullptr;

    MMapData* mmap = loadedModels[displayId];
    rlock.unlock();

    std::thread::id tid = std::this_thread::get_id();
    dtNavMeshQuery* navMeshQuery = nullptr;

    std::shared_lock<std::shared_timed_mutex> nav_rlock(mmap->navMeshQueries_lock);
    NavMeshQuerySet::iterator it = mmap->navMeshQueries.find(tid);
    if (it == mmap->navMeshQueries.end())
    {
        nav_rlock.unlock();
        // Safe to proceed without checking the ID again, see above in GetNavMeshQuery
        std::unique_lock<std::shared_timed_mutex> nav_wlock(mmap->navMeshQueries_lock);
        // allocate mesh query
        navMeshQuery = dtAllocNavMeshQuery();
        MANGOS_ASSERT(navMeshQuery);
        if (dtStatusFailed(navMeshQuery->init(mmap->navMesh, 2048, tid)))
        {
            dtFreeNavMeshQuery(navMeshQuery);
            nav_wlock.unlock();
            sLog.outError("MMAP:GetNavMeshQuery: Failed to initialize dtNavMeshQuery for displayid %03u tid %u", displayId, tid);
            return nullptr;
        }

        DETAIL_LOG("MMAP:GetNavMeshQuery: created dtNavMeshQuery for displayid %03u tid %u", displayId, tid);
        mmap->navMeshQueries.insert(std::pair<std::thread::id, dtNavMeshQuery*>(tid, navMeshQuery));
    }
    else
        navMeshQuery = it->second;

    return navMeshQuery;
}
}
