/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
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

#include <fstream>
#include "MMapCommon.h"
#include "MapBuilder.h"
#include "MapTree.h"
#include "ModelInstance.h"
#include "Maps/GridMapDefines.h"
#include "DetourNavMeshBuilder.h"
#include "DetourCommon.h"

using namespace VMAP;

namespace MMAP
{
    MapBuilder::MapBuilder(char const* configInputPath,
                           bool skipLiquid,
                           bool skipContinents,
                           bool skipJunkMaps,
                           bool skipBattlegrounds,
                           bool debug,
                           bool quick,
                           const char* offMeshFilePath,
                           uint8 threads) :
        m_terrainBuilder(nullptr),
        m_debug(debug),
        m_offMeshFilePath(offMeshFilePath),
        m_skipContinents(skipContinents),
        m_skipJunkMaps(skipJunkMaps),
        m_skipBattlegrounds(skipBattlegrounds),
        m_quick(quick),
        m_rcContext(nullptr),
        m_threads(threads)
    {
        std::ifstream jsonConfig(configInputPath);
        if (jsonConfig)
            m_config = json::parse(jsonConfig);

        m_terrainBuilder = new TerrainBuilder(skipLiquid, quick);

        m_rcContext = new rcContext(false);

        discoverTiles();
    }

    MapBuilder::~MapBuilder()
    {
        delete m_terrainBuilder;
        delete m_rcContext;
    }

    void MapBuilder::discoverTiles()
    {
        std::vector<std::string> files;
        uint32 mapID, tileX, tileY, tileID, count = 0;
        char filter[12];

        printf("Discovering maps... ");
        getDirContents(files, "maps");
        for (uint32 i = 0; i < files.size(); ++i)
        {
            mapID = uint32(atoi(files[i].substr(0, 3).c_str()));
            if (m_tiles.find(mapID) == m_tiles.end())
            {
                m_tiles.emplace(mapID, std::set<uint32>{});
                count++;
            }
        }

        files.clear();
        getDirContents(files, "vmaps", "*.vmtree");
        for (uint32 i = 0; i < files.size(); ++i)
        {
            mapID = uint32(atoi(files[i].substr(0, 3).c_str()));
            if (m_tiles.find(mapID) == m_tiles.end())
            {
                m_tiles.emplace(mapID, std::set<uint32>{});
                count++;
            }
        }
        printf("found %u.\n", count);

        count = 0;
        printf("Discovering tiles... ");
        for (TileList::iterator itr = m_tiles.begin(); itr != m_tiles.end(); ++itr)
        {
            std::set<uint32>& tiles = (*itr).second;
            mapID = (*itr).first;

            sprintf(filter, "%03u*.vmtile", mapID);
            files.clear();
            getDirContents(files, "vmaps", filter);
            for (uint32 i = 0; i < files.size(); ++i)
            {
                tileX = uint32(atoi(files[i].substr(7, 2).c_str()));
                tileY = uint32(atoi(files[i].substr(4, 2).c_str()));
                tileID = StaticMapTree::packTileID(tileY, tileX);

                tiles.insert(tileID);
                count++;
            }

            sprintf(filter, "%03u*", mapID);
            files.clear();
            getDirContents(files, "maps", filter);
            for (uint32 i = 0; i < files.size(); ++i)
            {
                tileY = uint32(atoi(files[i].substr(3, 2).c_str()));
                tileX = uint32(atoi(files[i].substr(5, 2).c_str()));
                tileID = StaticMapTree::packTileID(tileX, tileY);

                if (tiles.insert(tileID).second)
                    count++;
            }
        }
        printf("found %u.\n\n", count);
    }

    std::set<uint32>& MapBuilder::getTileList(uint32 mapID)
    {
        TileList::iterator itr = m_tiles.find(mapID);
        if (itr != m_tiles.end())
            return (*itr).second;

        return m_tiles.emplace(mapID, std::set<uint32>{}).first->second;
    }

    void MapBuilder::buildSingleMap(uint32 mapID)
    {
        m_cancel.store(false);

        buildMap(mapID);

        std::vector<TileWorker*> workers;
        for (uint8 i = 0; i < m_threads; ++i)
        {
            workers.emplace_back(new TileWorker(this, false, m_quick, m_debug, m_config));
        }

        while (!m_tileQueue.Empty())
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }

        m_cancel.store(true);
        m_tileQueue.Cancel();

        for (auto& th : workers)
        {
            delete th;
        }

        printf("Done.");
    }

    void MapBuilder::buildAllMaps()
    {
        m_cancel.store(false);

        for (TileList::iterator it = m_tiles.begin(); it != m_tiles.end(); ++it)
        {
            uint32 mapID = (*it).first;
            if (!shouldSkipMap(mapID))
                buildMap(mapID);
        }

        std::vector<TileWorker*> workers;
        for (uint8 i = 0; i < m_threads; ++i)
        {
            workers.emplace_back(new TileWorker(this, false, m_quick, m_debug, m_config));
        }

        while (!m_tileQueue.Empty())
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }

        m_cancel.store(true);
        m_tileQueue.Cancel();

        for (auto& th : workers)
        {
            delete th;
        }

        printf("Done.");
    }

    void MapBuilder::getGridBounds(uint32 mapID, uint32& minX, uint32& minY, uint32& maxX, uint32& maxY)
    {
        maxX = INT_MAX;
        maxY = INT_MAX;
        minX = INT_MIN;
        minY = INT_MIN;

        float bmin[3] = { 0, 0, 0 };
        float bmax[3] = { 0, 0, 0 };

        MeshData meshData;

        // make sure we process maps which don't have tiles
        // initialize the static tree, which loads WDT models
        if (!m_terrainBuilder->loadVMap(mapID, 64, 64, meshData))
            return;

        // get the coord bounds of the model data
        if (meshData.solidVerts.size() + meshData.liquidVerts.size() == 0)
            return;

        // get the coord bounds of the model data
        if (meshData.solidVerts.size() && meshData.liquidVerts.size())
        {
            float lmin[3] = { 0, 0, 0 };
            float lmax[3] = { 0, 0, 0 };

            rcCalcBounds(meshData.solidVerts.getCArray(), meshData.solidVerts.size() / 3, bmin, bmax);
            rcCalcBounds(meshData.liquidVerts.getCArray(), meshData.liquidVerts.size() / 3, lmin, lmax);
            rcVmin(bmin, lmin);
            rcVmax(bmax, lmax);
        }
        else if (meshData.solidVerts.size())
            rcCalcBounds(meshData.solidVerts.getCArray(), meshData.solidVerts.size() / 3, bmin, bmax);
        else
            rcCalcBounds(meshData.liquidVerts.getCArray(), meshData.liquidVerts.size() / 3, bmin, bmax);

        // convert coord bounds to grid bounds
        maxX = 32 - bmin[0] / GRID_SIZE;
        maxY = 32 - bmin[2] / GRID_SIZE;
        minX = 32 - bmax[0] / GRID_SIZE;
        minY = 32 - bmax[2] / GRID_SIZE;
    }

    void MapBuilder::buildSingleTile(uint32 mapID, uint32 tileX, uint32 tileY)
    {
        m_cancel.store(false);

        // make sure we process maps which don't have tiles
        std::set<uint32>& tiles = getTileList(mapID);
        if (!tiles.size())
        {
            // convert coord bounds to grid bounds
            uint32 minX, minY, maxX, maxY;
            getGridBounds(mapID, minX, minY, maxX, maxY);

            // add all tiles within bounds to tile list.
            for (uint32 i = minX; i <= maxX; ++i)
                for (uint32 j = minY; j <= maxY; ++j)
                    if (i == tileX && j == tileY)
                        tiles.insert(StaticMapTree::packTileID(i, j));
        }

        if (!tiles.size())
            return;

        dtNavMesh* navMesh = nullptr;
        buildNavMesh(mapID, navMesh);
        if (!navMesh)
        {
            printf("[Map %03i] Failed creating navmesh!                   \n", mapID);
            return;
        }

        printf("Adding %i, %i, %i", mapID, tileX, tileY);

        TileInfo tileInfo;
        tileInfo.m_mapId = mapID;
        tileInfo.m_tileX = tileX;
        tileInfo.m_tileY = tileY;
        tileInfo.m_curTile = 0;
        tileInfo.m_tileCount = uint32(tiles.size());
        memcpy(&tileInfo.m_navMeshParams, navMesh->getParams(), sizeof(dtNavMeshParams));
        m_tileQueue.Push(tileInfo);

        std::vector<TileWorker*> workers;
        workers.emplace_back(new TileWorker(this, false, m_quick, m_debug, m_config));

        while (!m_tileQueue.Empty())
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }

        m_cancel.store(true);

        m_tileQueue.Cancel();

        for (auto& tileBuilder : workers)
        {
            delete tileBuilder;
        }

        dtFreeNavMesh(navMesh);

        printf("Building single tile finished.");
    }

    void MapBuilder::buildMap(uint32 mapID)
    {
        printf("Building map %03u:                                    \n", mapID);

        std::set<uint32>& tiles = getTileList(mapID);

        // make sure we process maps which don't have tiles
        if (!tiles.size())
        {
            // convert coord bounds to grid bounds
            uint32 minX, minY, maxX, maxY;
            getGridBounds(mapID, minX, minY, maxX, maxY);

            // add all tiles within bounds to tile list.
            for (uint32 i = minX; i <= maxX; ++i)
                for (uint32 j = minY; j <= maxY; ++j)
                    tiles.insert(StaticMapTree::packTileID(i, j));
        }

        if (!tiles.size())
            return;

        // build navMesh
        dtNavMesh* navMesh = nullptr;
        buildNavMesh(mapID, navMesh);
        if (!navMesh)
        {
            printf("[Map %03i] Failed creating navmesh!                   \n", mapID);
            return;
        }

        // now start building mmtiles for each tile
        printf("[Map %03i] We have %u tiles.                          \n", mapID, uint32(tiles.size()));

        uint32 currentTile = 0;
        for (std::set<uint32>::iterator it = tiles.begin(); it != tiles.end(); ++it)
        {
            currentTile++;
            uint32 tileX, tileY;

            // unpack tile coords
            StaticMapTree::unpackTileID((*it), tileX, tileY);

            TileInfo tileInfo;
            tileInfo.m_mapId = mapID;
            tileInfo.m_tileX = tileX;
            tileInfo.m_tileY = tileY;
            tileInfo.m_curTile = currentTile;
            tileInfo.m_tileCount = uint32(tiles.size());
            memcpy(&tileInfo.m_navMeshParams, navMesh->getParams(), sizeof(dtNavMeshParams));
            m_tileQueue.Push(tileInfo);
        }

        dtFreeNavMesh(navMesh);

        printf("[Map %03i] Complete!                             \n\n", mapID);
    }

    void MapBuilder::buildNavMesh(uint32 mapID, dtNavMesh*& navMesh)
    {
        std::set<uint32>& tiles = getTileList(mapID);

        /***          calculate bounds of map         ***/

        uint32 tileXMax = 0, tileYMax = 0, tileX, tileY;
        for (std::set<uint32>::iterator it = tiles.begin(); it != tiles.end(); ++it)
        {
            StaticMapTree::unpackTileID((*it), tileX, tileY);

            if (tileX > tileXMax)
                tileXMax = tileX;

            if (tileY > tileYMax)
                tileYMax = tileY;
        }

        // use Max because '32 - tileX' is negative for values over 32
        float bmin[3], bmax[3];
        getTileBounds(tileXMax, tileYMax, nullptr, 0, bmin, bmax);
        int maxTiles = tiles.size();

        /***       now create the navmesh       ***/

        // navmesh creation params
        dtNavMeshParams navMeshParams;
        memset(&navMeshParams, 0, sizeof(dtNavMeshParams));
        navMeshParams.tileWidth = GRID_SIZE;
        navMeshParams.tileHeight = GRID_SIZE;
        rcVcopy(navMeshParams.orig, bmin);
        navMeshParams.maxTiles = maxTiles;
        navMeshParams.maxPolys = 0; // Unused if DT_POLYREF64 set.

        navMesh = dtAllocNavMesh();
        printf("[Map %03i] Creating navMesh [maxTiles=%i]\n", mapID, maxTiles);
        if (!navMesh->init(&navMeshParams))
        {
            printf("[Map %03i] Failed creating navmesh!                   \n", mapID);
            return;
        }

        char fileName[25];
        sprintf(fileName, "mmaps/%03u.mmap", mapID);

        FILE* file = fopen(fileName, "wb");
        if (!file)
        {
            dtFreeNavMesh(navMesh);
            char message[1024];
            sprintf(message, "[Map %03i] Failed to open %s for writing!             \n", mapID, fileName);
            perror(message);
            return;
        }

        // now that we know navMesh params are valid, we can write them to file
        fwrite(&navMeshParams, sizeof(dtNavMeshParams), 1, file);
        fclose(file);
    }

    void MapBuilder::getTileBounds(uint32 tileX, uint32 tileY, float* verts, int vertCount, float* bmin, float* bmax)
    {
        // this is for elevation
        if (verts && vertCount)
            rcCalcBounds(verts, vertCount, bmin, bmax);
        else
        {
            bmin[1] = FLT_MIN;
            bmax[1] = FLT_MAX;
        }

        // this is for width and depth
        bmax[0] = (32 - int(tileX)) * GRID_SIZE;
        bmax[2] = (32 - int(tileY)) * GRID_SIZE;
        bmin[0] = bmax[0] - GRID_SIZE;
        bmin[2] = bmax[2] - GRID_SIZE;
    }

    bool MapBuilder::shouldSkipMap(uint32 mapID)
    {
        if (m_skipContinents)
            switch (mapID)
            {
                case 0:
                case 1:
                    return true;
                default:
                    break;
            }

        if (m_skipJunkMaps)
            switch (mapID)
            {
                //case 13:    // test.wdt
                //case 25:    // ScottTest.wdt
                //case 29:    // Test.wdt
                case 42:    // Colin.wdt
                case 169:   // EmeraldDream.wdt (unused, and very large)
                //case 451:   // development.wdt
                    return true;
            }

        if (m_skipBattlegrounds)
            switch (mapID)
            {
                case 30:    // AV
                case 37:    // ?
                case 489:   // WSG
                case 529:   // AB
                    return true;
                default:
                    break;
            }

        return false;
    }

    bool MapBuilder::isTransportMap(uint32 mapID)
    {
    #if 0
        switch (mapID)
        {
            // no transport maps
            default:
                return false;
        }
    #endif
        return false;
    }
    /**
     * Build navmesh for GameObject model.
     * Yup, transports are GameObjects and we need pathfinding there.
     * This is basically a copy-paste of buildMoveMapTile with slightly diff parameters
     * .. and without worrying about model/terrain, undermap or liquids.
     */
    void MapBuilder::buildGameObject(std::string modelName, uint32 displayId)
    {
        printf("Building GameObject model %s\n", modelName.c_str());
        WorldModel m;
        MeshData meshData;
        if (!m.readFile("vmaps/" + modelName))
        {
            printf("* Unable to open file\n");
            return;
        }

        // Load model data into navmesh
        vector<GroupModel> groupModels;
        m.getGroupModels(groupModels);

        // all M2s need to have triangle indices reversed
        bool isM2 = modelName.find(".m2") != modelName.npos || modelName.find(".M2") != modelName.npos;

        for (vector<GroupModel>::iterator it = groupModels.begin(); it != groupModels.end(); ++it)
        {
            // transform data
            vector<Vector3> tempVertices;
            vector<MeshTriangle> tempTriangles;
            WmoLiquid* liquid = nullptr;

            (*it).getMeshData(tempVertices, tempTriangles, liquid);

            int offset = meshData.solidVerts.size() / 3;

            TerrainBuilder::copyVertices(tempVertices, meshData.solidVerts);
            TerrainBuilder::copyIndices(tempTriangles, meshData.solidTris, offset, isM2);
        }
        // if there is no data, give up now
        if (!meshData.solidVerts.size())
        {
            printf("* no solid vertices found\n");
            return;
        }
        TerrainBuilder::cleanVertices(meshData.solidVerts, meshData.solidTris);

        // gather all mesh data for final data check, and bounds calculation
        G3D::Array<float> allVerts;
        allVerts.append(meshData.solidVerts);

        if (!allVerts.size())
            return;

        printf("* Model opened (%u vertices)\n", allVerts.size());

        float* tVerts = meshData.solidVerts.getCArray();
        int tVertCount = meshData.solidVerts.size() / 3;
        int* tTris = meshData.solidTris.getCArray();
        int tTriCount = meshData.solidTris.size() / 3;

        // get bounds of current tile
        rcConfig config;
        memset(&config, 0, sizeof(rcConfig));
        float agentHeight = 1.0f;
        float agentRadius = 0.5f;
        float agentMaxClimb = 2.0f;
        const static float BASE_UNIT_DIM = 0.13f;

        config.cs = BASE_UNIT_DIM;
        config.ch = BASE_UNIT_DIM;
        config.walkableSlopeAngle = 50.0f;
        config.walkableHeight = (int)ceilf(agentHeight / config.ch);
        config.walkableClimb = (int)floorf(agentMaxClimb / config.ch);
        config.walkableRadius = (int)ceilf(agentRadius / config.cs);
        config.maxEdgeLen = (int)(12 / config.cs);
        config.maxSimplificationError = 1.5f;
        config.minRegionArea = (int)rcSqr(30) / 2;
        config.mergeRegionArea = (int)rcSqr(10);
        config.maxVertsPerPoly = 6;
        config.detailSampleDist = config.cs*6.0f; // sampling distance to use when generating the detail mesh
        config.detailSampleMaxError = 0.0f;

        // this sets the dimensions of the heightfield - should maybe happen before border padding
        rcCalcBounds(tVerts, tVertCount, config.bmin, config.bmax);
        rcCalcGridSize(config.bmin, config.bmax, config.cs, &config.width, &config.height);

        Tile tile;
        tile.solid = rcAllocHeightfield();
        if (!tile.solid || !rcCreateHeightfield(m_rcContext, *tile.solid, config.width, config.height, config.bmin, config.bmax, config.cs, config.ch))
        {
            printf("* Failed building heightfield!            \n");
            return;
        }
        unsigned char* m_triareas = new unsigned char[tTriCount];
        memset(m_triareas, AREA_NONE, tTriCount*sizeof(unsigned char));
        rcMarkWalkableTriangles(m_rcContext, config.walkableSlopeAngle, tVerts, tVertCount, tTris, tTriCount, m_triareas);
        rcRasterizeTriangles(m_rcContext, tVerts, tVertCount, tTris, m_triareas, tTriCount, *tile.solid, config.walkableClimb);
        rcFilterLowHangingWalkableObstacles(m_rcContext, config.walkableClimb, *tile.solid);
        rcFilterLedgeSpans(m_rcContext, config.walkableHeight, config.walkableClimb, *tile.solid);
        rcFilterWalkableLowHeightSpans(m_rcContext, config.walkableHeight, *tile.solid);
        tile.chf = rcAllocCompactHeightfield();
        if (!tile.chf || !rcBuildCompactHeightfield(m_rcContext, config.walkableHeight, config.walkableClimb, *tile.solid, *tile.chf))
        {
            printf("Failed compacting heightfield!            \n");
            return;
        }
        // Erode the walkable area by agent radius.
        if (!rcErodeWalkableArea(m_rcContext, config.walkableRadius, *tile.chf))
        {
            printf("Failed eroding heightfield!            \n");
            return;
        }
        if (!rcBuildDistanceField(m_rcContext, *tile.chf))
        {
            printf("Failed building distance field!         \n");
            return;
        }

        if (!rcBuildRegions(m_rcContext, *tile.chf, 0, config.minRegionArea, config.mergeRegionArea))
        {
            printf("Failed building regions!                \n");
            return;
        }

        tile.cset = rcAllocContourSet();
        if (!tile.cset || !rcBuildContours(m_rcContext, *tile.chf, config.maxSimplificationError, config.maxEdgeLen, *tile.cset))
        {
            printf("Failed building contours!               \n");
            return;
        }

        // build polymesh
        tile.pmesh = rcAllocPolyMesh();
        if (!tile.pmesh || !rcBuildPolyMesh(m_rcContext, *tile.cset, config.maxVertsPerPoly, *tile.pmesh))
        {
            printf("Failed building polymesh!               \n");
            return;
        }

        tile.dmesh = rcAllocPolyMeshDetail();
        if (!tile.dmesh || !rcBuildPolyMeshDetail(m_rcContext, *tile.pmesh, *tile.chf, config.detailSampleDist, config.detailSampleMaxError, *tile.dmesh))
        {
            printf("Failed building polymesh detail!        \n");
            return;
        }
        rcFreeHeightField(tile.solid);
        tile.solid = nullptr;
        rcFreeCompactHeightfield(tile.chf);
        tile.chf = nullptr;
        rcFreeContourSet(tile.cset);
        tile.cset = nullptr;

        IntermediateValues iv;
        iv.polyMesh = tile.pmesh;
        iv.polyMeshDetail = tile.dmesh;
        for (int i = 0; i < iv.polyMesh->npolys; ++i)
        {
            if (iv.polyMesh->areas[i] & RC_WALKABLE_AREA)
                iv.polyMesh->flags[i] = iv.polyMesh->areas[i];
        }

        // Will be deleted by IntermediateValues
        tile.pmesh = nullptr;
        tile.dmesh = nullptr;
        // setup mesh parameters
        dtNavMeshCreateParams params;
        memset(&params, 0, sizeof(params));
        params.verts = iv.polyMesh->verts;
        params.vertCount = iv.polyMesh->nverts;
        params.polys = iv.polyMesh->polys;
        params.polyAreas = iv.polyMesh->areas;
        params.polyFlags = iv.polyMesh->flags;
        params.polyCount = iv.polyMesh->npolys;
        params.nvp = iv.polyMesh->nvp;
        params.detailMeshes = iv.polyMeshDetail->meshes;
        params.detailVerts = iv.polyMeshDetail->verts;
        params.detailVertsCount = iv.polyMeshDetail->nverts;
        params.detailTris = iv.polyMeshDetail->tris;
        params.detailTriCount = iv.polyMeshDetail->ntris;

        params.walkableHeight = agentHeight;  // agent height
        params.walkableRadius = agentRadius;  // agent radius
        params.walkableClimb = agentMaxClimb;    // keep less that walkableHeight (aka agent height)!
        rcVcopy(params.bmin, iv.polyMesh->bmin);
        rcVcopy(params.bmax, iv.polyMesh->bmax);
        params.cs = config.cs;
        params.ch = config.ch;
        params.buildBvTree = true;

        unsigned char* navData = nullptr;
        int navDataSize = 0;
        printf("* Building navmesh tile [%f %f %f to %f %f %f]\n",
                params.bmin[0], params.bmin[1], params.bmin[2],
                params.bmax[0], params.bmax[1], params.bmax[2]);
        printf(" %u triangles (%u vertices)\n", params.polyCount, params.vertCount);
        printf(" %u polygons (%u vertices)\n", params.detailTriCount, params.detailVertsCount);
        if (params.nvp > DT_VERTS_PER_POLYGON)
        {
            printf("Invalid verts-per-polygon value!        \n");
            return;
        }
        if (params.vertCount >= 0xffff)
        {
            printf("Too many vertices! (0x%8x)        \n", params.vertCount);
            return;
        }
        if (!params.vertCount || !params.verts)
        {
            printf("No vertices to build tile!              \n");
            return;
        }
        if (!params.polyCount || !params.polys)
        {
            // we have flat tiles with no actual geometry - don't build those, its useless
            // keep in mind that we do output those into debug info
            // drop tiles with only exact count - some tiles may have geometry while having less tiles
            printf("No polygons to build on tile!              \n");
            return;
        }
        if (!params.detailMeshes || !params.detailVerts || !params.detailTris)
        {
            printf("No detail mesh to build tile!           \n");
            return;
        }
        if (!dtCreateNavMeshData(&params, &navData, &navDataSize))
        {
            printf("Failed building navmesh tile!           \n");
            return;
        }
        char fileName[255];
        sprintf(fileName, "mmaps/go%04u.mmtile", displayId);
        FILE* file = fopen(fileName, "wb");
        if (!file)
        {
            char message[1024];
            sprintf(message, "Failed to open %s for writing!\n", fileName);
            perror(message);
            return;
        }

        printf("* Writing to file \"%s\" [size=%u]\n", fileName, navDataSize);

        // write header
        MmapTileHeader header;
        header.usesLiquids = false;
        header.size = uint32(navDataSize);
        fwrite(&header, sizeof(MmapTileHeader), 1, file);

        // write data
        fwrite(navData, sizeof(unsigned char), navDataSize, file);
        fclose(file);
        if (m_debug)
        {
            iv.generateObjFile(modelName, meshData);
            // Write navmesh data
            std::string fname = "meshes/" + modelName + ".nav";
            FILE* file = fopen(fname.c_str(), "wb");
            if (file)
            {
                fwrite(&navDataSize, sizeof(uint32), 1, file);
                fwrite(navData, sizeof(unsigned char), navDataSize, file);
                fclose(file);
            }
        }
    }
    void MapBuilder::buildTransports()
    {
        // List of MO Transport gameobjects
        buildGameObject("Transportship.wmo.vmo", 3015);
        buildGameObject("Transport_Zeppelin.wmo.vmo", 3031);
        // List of Transport gameobjects
        buildGameObject("Elevatorcar.m2.vmo", 360);
        buildGameObject("Undeadelevator.m2.vmo", 455);
        // buildGameObject("Undeadelevatordoor.m2.vmo", 462); // no model on which to path
        buildGameObject("Ironforgeelevator.m2.vmo", 561);
        // buildGameObject("Ironforgeelevatordoor.m2.vmo", 562); // no model on which to path
        buildGameObject("Gnomeelevatorcar01.m2.vmo", 807);
        buildGameObject("Gnomeelevatorcar02.m2.vmo", 808);
        buildGameObject("Gnomeelevatorcar03.m2.vmo", 827); // missing vmap - reusing 03
        buildGameObject("Gnomeelevatorcar03.m2.vmo", 852);
        buildGameObject("Gnomehutelevator.m2.vmo", 1587);
        buildGameObject("Burningsteppselevator.m2.vmo", 2454);
        buildGameObject("Subwaycar.m2.vmo", 3831);
    }

    bool MapBuilder::IsBusy()
    {
        return !m_tileQueue.Empty();
    }
}
