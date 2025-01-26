#include "TileWorker.h"
#include "MapBuilder.h"
#include "Maps/GridMapDefines.h"

inline static void calcTriNormal(const float* v0, const float* v1, const float* v2, float* norm)
{
    float e0[3], e1[3];
    rcVsub(e0, v1, v0);
    rcVsub(e1, v2, v0);
    rcVcross(norm, e0, e1);
    rcVnormalize(norm);
}

inline static unsigned int nextPow2(unsigned int v)
{
    v--;
    v |= v >> 1;
    v |= v >> 2;
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v++;
    return v;
}

inline static unsigned int ilog2(unsigned int v)
{
    unsigned int r;
    unsigned int shift;
    r = (v > 0xffff) << 4; v >>= r;
    shift = (v > 0xff) << 3; v >>= shift; r |= shift;
    shift = (v > 0xf) << 2; v >>= shift; r |= shift;
    shift = (v > 0x3) << 1; v >>= shift; r |= shift;
    r |= (v >> 1);
    return r;
}

static void filterRemoveUselessAreas(rcHeightfield& filter)
{
    const int w = filter.width;
    const int h = filter.height;
    for (int y = 0; y < h; ++y)
        for (int x = 0; x < w; ++x)
            for (rcSpan* span = filter.spans[x + y * w]; span; span = span->next)
                switch (span->area)
                {
                case AREA_GROUND_MODEL:
                    span->area = AREA_GROUND;
                    break;
                case AREA_STEEP_SLOPE_MODEL:
                    span->area = AREA_STEEP_SLOPE;
                    break;
                }
}

static void filterWalkableLowHeightSpansWith(rcHeightfield& filter, rcHeightfield& out, int min, int max)
{
    const int w = out.width;
    const int h = out.height;

    // Remove walkable flag from spans which do not have enough
    // space above them for the agent to stand there.
    for (int y = 0; y < h; ++y)
    {
        for (int x = 0; x < w; ++x)
        {
            for (rcSpan* spanOut = out.spans[x + y * w]; spanOut; spanOut = spanOut->next)
                for (rcSpan* spanFilter = filter.spans[x + y * w]; spanFilter; spanFilter = spanFilter->next)
                    if (spanOut->area == AREA_GROUND) // No steep slopes here.
                    {
                        const int bot = (int)(spanOut->smax);
                        const int top = (int)(spanFilter->smin);
                        if ((top - bot) <= max && (top - bot) >= 0)
                        {
                            if ((top - bot) >= min)
                                spanOut->area = spanFilter->area;
                            else if (spanFilter->area == AREA_WATER)
                                spanOut->area = AREA_WATER_TRANSITION;
                        }
                    }
        }
    }
}

static bool IsModelArea(int area)
{
    switch (area)
    {
    case AREA_GROUND_MODEL:
    case AREA_STEEP_SLOPE_MODEL:
        return true;
    }
    return false;
}

static void filterLedgeSpans(const int walkableHeight, const int walkableClimbTransition, const int walkableClimbTerrain,
    rcHeightfield& heightfield)
{
    const int w = heightfield.width;
    const int h = heightfield.height;
    const int MAX_HEIGHT = 0xffff;

    for (int y = 0; y < h; ++y)
    {
        for (int x = 0; x < w; ++x)
        {
            for (rcSpan* span = heightfield.spans[x + y * w]; span; span = span->next)
            {
                // Skip non walkable spans.
                if (span->area == RC_NULL_AREA)
                    continue;

                const int bot = (int)(span->smax);
                const int top = span->next ? (int)(span->next->smin) : MAX_HEIGHT;

                // Find neighbours minimum height.
                int minNeighborHeight = MAX_HEIGHT;

                // Min and max height of accessible neighbours.
                int accessibleNeighborMinHeight = span->smax;
                int accessibleNeighborMaxHeight = span->smax;
                bool hasAllNbTerrain = true;
                bool hasAllNbModel = true;

                for (int dir = 0; dir < 4; ++dir)
                {
                    int dx = x + rcGetDirOffsetX(dir);
                    int dy = y + rcGetDirOffsetY(dir);
                    // Skip neighbours which are out of bounds.
                    if (dx < 0 || dy < 0 || dx >= w || dy >= h)
                    {
                        // This was commented out previously. It's supposed to prevent adjacent terrain polys from having
                        // radically different vert height values due to bad model design. Smooths out many paths like Thousand Needles bridges
                        minNeighborHeight = rcMin(minNeighborHeight, -walkableClimbTerrain - bot);
                        continue;
                    }

                    // From minus infinity to the first span.
                    rcSpan* neighborSpan = heightfield.spans[dx + dy * w];
                    int nbot = -walkableClimbTerrain;
                    int ntop = neighborSpan ? (int)neighborSpan->smin : MAX_HEIGHT;
                    // Skip neighbour if the gap between the spans is too small.
                    if (rcMin(top, ntop) - rcMax(bot, nbot) > walkableHeight)
                        minNeighborHeight = rcMin(minNeighborHeight, nbot - bot);

                    // Rest of the spans.
                    for (neighborSpan = heightfield.spans[dx + dy * w]; neighborSpan; neighborSpan = neighborSpan->next)
                    {
                        if (neighborSpan->area == RC_NULL_AREA)
                            continue;
                        nbot = (int)neighborSpan->smax;
                        ntop = neighborSpan->next ? (int)neighborSpan->next->smin : MAX_HEIGHT;
                        // Skip neightbour if the gap between the spans is too small.
                        if (rcMin(top, ntop) - rcMax(bot, nbot) > walkableHeight)
                        {
                            minNeighborHeight = rcMin(minNeighborHeight, nbot - bot);
                            // Find min/max accessible neighbour height.
                            if (rcAbs(nbot - bot) <= walkableClimbTerrain)
                            {
                                if (nbot < accessibleNeighborMinHeight) accessibleNeighborMinHeight = nbot;
                                if (nbot > accessibleNeighborMaxHeight) accessibleNeighborMaxHeight = nbot;
                                if (!IsModelArea(neighborSpan->area))
                                    hasAllNbModel = false;
                                else
                                    hasAllNbTerrain = false;
                            }
                        }
                    }
                }

                // The current span is close to a ledge if the drop to any
                // neighbour span is less than the walkableClimb.
                bool modelToTerrainTransition = (IsModelArea(span->area) && !hasAllNbModel) || (!IsModelArea(span->area) && !hasAllNbTerrain);
                int currentMaxClimb = walkableClimbTerrain;
                // Model -> Terrain or Terrain -> Model
                if (modelToTerrainTransition)
                    currentMaxClimb = walkableClimbTransition;
                if (minNeighborHeight < -currentMaxClimb)
                    span->area = RC_NULL_AREA;


                // If the difference between all neighbours is too large,
                // we are at steep slope, mark the span as it
                else if ((accessibleNeighborMaxHeight - accessibleNeighborMinHeight) > currentMaxClimb)
                {
                    if (modelToTerrainTransition)
                        span->area = RC_NULL_AREA;
                    else
                        span->area = AREA_STEEP_SLOPE;
                }
            }
        }
    }
}

static void from_json(const json& j, rcConfig& config)
{
    config.tileSize               = MMAP::VERTEX_PER_TILE;
    config.borderSize             = j["borderSize"].get<int>();
    config.cs                     = MMAP::BASE_UNIT_DIM;
    config.ch                     = MMAP::BASE_UNIT_DIM;
    config.walkableSlopeAngle     = j["walkableSlopeAngle"].get<float>();
    config.walkableHeight         = j["walkableHeight"].get<int>();
    config.walkableClimb          = j["walkableClimb"].get<int>();
    config.walkableRadius         = j["walkableRadius"].get<int>();
    config.maxEdgeLen             = j["maxEdgeLen"].get<int>();
    config.maxSimplificationError = j["maxSimplificationError"].get<float>();
    config.minRegionArea          = rcSqr(j["minRegionArea"].get<int>());
    config.mergeRegionArea        = rcSqr(j["mergeRegionArea"].get<int>());
    config.maxVertsPerPoly        = DT_VERTS_PER_POLYGON;
    config.detailSampleDist       = j["detailSampleDist"].get<float>();
    config.detailSampleMaxError   = j["detailSampleMaxError"].get<float>();
}

namespace MMAP
{
    void TileWorker::WorkerThread()
    {
        while (true)
        {
            TileInfo tileInfo;

            if (m_mapBuilder->m_cancel.load())
            {
                return;
            }

            if (m_mapBuilder->m_tileQueue.WaitAndPop(tileInfo))
            {
                dtNavMesh* navMesh = dtAllocNavMesh();
                if (!navMesh->init(&tileInfo.m_navMeshParams))
                {
                    printf("[Map %03i] Failed creating navmesh for tile %i,%i !\n", tileInfo.m_mapId, tileInfo.m_tileX, tileInfo.m_tileY);
                    dtFreeNavMesh(navMesh);
                    return;
                }

                buildTile(tileInfo.m_mapId, tileInfo.m_tileX, tileInfo.m_tileY, navMesh, tileInfo.m_curTile, tileInfo.m_tileCount);

                dtFreeNavMesh(navMesh);
            }
        }
    }

    bool TileWorker::duDumpPolyMeshToObj(rcPolyMesh& pmesh, uint32 mapID, uint32 tileY, uint32 tileX)
    {
        char fname[256];
        sprintf(fname, "meshes/map%03u%02u%02unavmesh.obj", mapID, tileY, tileX);
        FILE* objFile = fopen(fname, "wb");
        if (!objFile)
        {
            printf("duDumpPolyMeshToObj: Can't open file.\n");
            return false;
        }

        const int nvp = pmesh.nvp;
        const float cs = pmesh.cs;
        const float ch = pmesh.ch;
        const float* orig = pmesh.bmin;

        fprintf(objFile, "# MMAP Navmesh\n");
        fprintf(objFile, "o NavMesh\n");
        //fprintf(objFile, "mltlib colors.mtl\n");//Load materials file for coloring the mesh - TODO: add coloring for climblimits etc 

        fprintf(objFile, "\n");

        for (int i = 0; i < pmesh.nverts; ++i)
        {
            const unsigned short* v = &pmesh.verts[i * 3];
            const float x = orig[0] + v[0] * cs;
            const float y = orig[1] + (v[1] + 1) * ch + 0.1f;
            const float z = orig[2] + v[2] * cs;

            fprintf(objFile, "v %f %f %f\n", x, y, z);
        }

        fprintf(objFile, "\n");

        for (int i = 0; i < pmesh.npolys; ++i)
        {
            const unsigned short* p = &pmesh.polys[i * nvp * 2];
            for (int j = 2; j < nvp; ++j)
            {
                if (p[j] == RC_MESH_NULL_IDX) break;
                fprintf(objFile, "f %d %d %d\n", p[0] + 1, p[j - 1] + 1, p[j] + 1);
            }
        }
        fclose(objFile);

        return true;
    }

    bool TileWorker::duDumpPolyMeshDetailToObj(rcPolyMeshDetail& dmesh, uint32 mapID, uint32 tileY, uint32 tileX)
    {

        char fname[256];
        sprintf(fname, "meshes/map%03u%02u%02unavmeshdetail.obj", mapID, tileY, tileX);
        FILE* objFile = fopen(fname, "wb");

        if (!objFile)
        {
            printf("duDumpPolyMeshDetailToObj: Can't open file.\n");
            return false;
        }

        fprintf(objFile, "# MMAP Navmesh\n");
        fprintf(objFile, "o NavMesh\n");

        fprintf(objFile, "\n");

        for (int i = 0; i < dmesh.nverts; ++i)
        {
            const float* v = &dmesh.verts[i * 3];
            fprintf(objFile, "v %f %f %f\n", v[0], v[1], v[2]);
        }

        fprintf(objFile, "\n");

        for (int i = 0; i < dmesh.nmeshes; ++i)
        {
            const unsigned int* m = &dmesh.meshes[i * 4];
            const unsigned int bverts = m[0];
            const unsigned int btris = m[2];
            const unsigned int ntris = m[3];
            const unsigned char* tris = &dmesh.tris[btris * 4];
            for (unsigned int j = 0; j < ntris; ++j)
            {
                fprintf(objFile, "f %d %d %d\n",
                    (int)(bverts + tris[j * 4 + 0]) + 1,
                    (int)(bverts + tris[j * 4 + 1]) + 1,
                    (int)(bverts + tris[j * 4 + 2]) + 1);
            }
        }
        fclose(objFile);

        return true;
    }

    bool TileWorker::shouldSkipTile(uint32 mapID, uint32 tileX, uint32 tileY)
    {
        char fileName[255];
        sprintf(fileName, "mmaps/%03u%02i%02i.mmtile", mapID, tileY, tileX);
        FILE* file = fopen(fileName, "rb");
        if (!file)
        {
            return false;
        }

        MmapTileHeader header;
        int count = fread(&header, sizeof(MmapTileHeader), 1, file);
        fclose(file);
        if (count != 1)
        {
            return false;
        }

        if (header.mmapMagic != MMAP_MAGIC || header.dtVersion != uint32(DT_NAVMESH_VERSION))
        {
            return false;
        }

        if (header.mmapVersion != MMAP_VERSION)
        {
            return false;
        }

        return true;
    }

    void TileWorker::buildTile(uint32 mapID, uint32 tileX, uint32 tileY, dtNavMesh* navMesh, uint32 curTile, uint32 tileCount)
    {
        if (shouldSkipTile(mapID, tileX, tileY))
        {
            return;
        }

        printf("[Map %03i] Building tile [%02u,%02u] (%02u / %02u)    \n", mapID, tileX, tileY, curTile, tileCount);

        MeshData meshData;

        // get heightmap data
        m_terrainBuilder->loadMap(mapID, tileX, tileY, meshData);

        // remove unused vertices
        TerrainBuilder::cleanVertices(meshData.solidVerts, meshData.solidTris);
        TerrainBuilder::cleanVertices(meshData.liquidVerts, meshData.liquidTris);

        m_terrainBuilder->loadVMap(mapID, tileX, tileY, meshData); // get model data
        //TerrainBuilder::cleanVertices(meshData.solidVerts, meshData.solidTris);

        // if there is no data, give up now
        if (!meshData.solidVerts.size() && !meshData.liquidVerts.size())
            return;
        // gather all mesh data for final data check, and bounds calculation
        G3D::Array<float> allVerts;
        allVerts.append(meshData.liquidVerts);
        allVerts.append(meshData.solidVerts);

        if (!allVerts.size())
            return;

        // get bounds of current tile
        float bmin[3], bmax[3];
        m_mapBuilder->getTileBounds(tileX, tileY, allVerts.getCArray(), allVerts.size() / 3, bmin, bmax);

        // offmesh.txt
        m_terrainBuilder->loadOffMeshConnections(mapID, tileX, tileY, meshData, m_mapBuilder->m_offMeshFilePath);

        // build navmesh tile
        buildMoveMapTile(mapID, tileX, tileY, meshData, bmin, bmax, navMesh);
        m_terrainBuilder->unloadVMap(mapID, tileX, tileY);
    }

    void TileWorker::buildMoveMapTile(uint32 mapID, uint32 tileX, uint32 tileY, MeshData& meshData, float bmin[3], float bmax[3], dtNavMesh* navMesh)
    {
        // console output
        char tileString[20];
        sprintf(tileString, "[Map %03i] [%02i,%02i]: ", mapID, tileX, tileY);
        printf("%s Building movemap tiles...                          \r", tileString);

        IntermediateValues iv;

        float* tVerts = meshData.solidVerts.getCArray();
        int tVertCount = meshData.solidVerts.size() / 3;
        int* tTris = meshData.solidTris.getCArray();
        int tTriCount = meshData.solidTris.size() / 3;

        float* lVerts = meshData.liquidVerts.getCArray();
        int lVertCount = meshData.liquidVerts.size() / 3;
        int* lTris = meshData.liquidTris.getCArray();
        int lTriCount = meshData.liquidTris.size() / 3;
        uint8* lTriAreas = meshData.liquidType.getCArray();

        rcConfig config;
        memset(&config, 0, sizeof(rcConfig));
        json jsonTileConfig = getTileConfig(mapID, tileX, tileY);
        int const quickFromConfig = jsonTileConfig["quick"].get<int>();
        if (quickFromConfig >= 0)
            m_quick = quickFromConfig == 0 ? false : true;
        config = jsonTileConfig;

        rcVcopy(config.bmin, bmin);
        rcVcopy(config.bmax, bmax);

        bool continent = (mapID <= 1);
        // Should be able to pass here .go xyz -4930 -999 502 0
        float agentHeight = 1.5f;
        float agentRadius = 0.2f; // Check here: .go xyz -4985 -861 501 0
        // Fences should not be passable
        static const float agentMaxClimbModelTerrainTransition = 1.2f;
        static const float agentMaxClimbTerrain = 1.8f;

        if (!continent)
            agentRadius = 0.3f;

        config.ch = 0.1f;
        // .go xyz 9612 410 1328
        // Prevent z overflow at big heights. We need at least 0.16 to handle teldrassil.
        if (continent)
            config.ch = 0.25f;

        if (config.walkableHeight == 0)
            config.walkableHeight = (int)ceilf(agentHeight / config.ch);
        if (config.walkableClimb == 0)
            config.walkableClimb = (int)floorf(agentMaxClimbModelTerrainTransition / config.ch); // For models
        uint32 walkableClimbTerrain = (int)floorf(agentMaxClimbTerrain / config.ch);
        uint32 walkableClimbModelTransition = (int)floorf(agentMaxClimbModelTerrainTransition / config.ch);
        if (config.walkableRadius == 0)
            config.walkableRadius = (int)ceilf(agentRadius / config.cs);
        if (config.maxEdgeLen == 0)
            config.maxEdgeLen = (int)(12 / config.cs);
        if (config.borderSize == 0)
            config.borderSize = config.walkableRadius + 3;

        config.width = config.tileSize + config.borderSize * 2;
        config.height = config.tileSize + config.borderSize * 2;

        int inWaterGround = config.walkableHeight;
        int stepForGroundInheriteWater = (int)ceilf(30.0f / config.ch);

        // allocate subregions : tiles
        Tile* tiles = new Tile[TILES_PER_MAP * TILES_PER_MAP];

        // Initialize per tile config.
        rcConfig tileCfg;
        memcpy(&tileCfg, &config, sizeof(rcConfig));
        tileCfg.width = config.tileSize + config.borderSize * 2;
        tileCfg.height = config.tileSize + config.borderSize * 2;

        // build all tiles
        for (int y = 0; y < TILES_PER_MAP; ++y)
        {
            for (int x = 0; x < TILES_PER_MAP; ++x)
            {
                Tile& tile = tiles[x + y * TILES_PER_MAP];
                Tile liquidsTile;

                // Calculate the per tile bounding box.
                tileCfg.bmin[0] = config.bmin[0] + x * float(config.tileSize * config.cs);
                tileCfg.bmin[2] = config.bmin[2] + y * float(config.tileSize * config.cs);
                tileCfg.bmax[0] = config.bmin[0] + (x + 1) * float(config.tileSize * config.cs);
                tileCfg.bmax[2] = config.bmin[2] + (y + 1) * float(config.tileSize * config.cs);

                tileCfg.bmin[0] -= tileCfg.borderSize * tileCfg.cs;
                tileCfg.bmin[2] -= tileCfg.borderSize * tileCfg.cs;
                tileCfg.bmax[0] += tileCfg.borderSize * tileCfg.cs;
                tileCfg.bmax[2] += tileCfg.borderSize * tileCfg.cs;

                // NOSTALRIUS - MMAPS TILE GENERATION
                /// 1. Alloc heightfield for walkable areas
                tile.solid = rcAllocHeightfield();
                if (!tile.solid || !rcCreateHeightfield(m_rcContext, *tile.solid, tileCfg.width, tileCfg.height, tileCfg.bmin, tileCfg.bmax, tileCfg.cs, tileCfg.ch))
                {
                    printf("%s Failed building heightfield!                       \n", tileString);
                    continue;
                }

                /// 2. Generate heightfield for water. Put all liquid geometry there
                // We need to build liquid heighfield to set poly swim flag under.
                liquidsTile.solid = rcAllocHeightfield();
                if (!liquidsTile.solid || !rcCreateHeightfield(m_rcContext, *liquidsTile.solid, tileCfg.width, tileCfg.height, tileCfg.bmin, tileCfg.bmax, tileCfg.cs, tileCfg.ch))
                {
                    printf("%s Failed building liquids heightfield!            \n", tileString);
                    continue;
                }
                rcRasterizeTriangles(m_rcContext, lVerts, lVertCount, lTris, lTriAreas, lTriCount, *liquidsTile.solid, 0);

                /// 3. Mark all triangles with correct flags:
                // Can't use rcMarkWalkableTriangles. We need something really more specific.
                // The trick is that we use different MaxClimb angle depending if:
                // - We are on a terrain
                // - We are on a model (WMO...)
                // - Also we want to remove under-terrain triangles
                unsigned char* areas = new unsigned char[tTriCount];
                memset(areas, AREA_NONE, tTriCount * sizeof(unsigned char));
                float norm[3];

                // allow modifying walkable slopes using config.json
                const float walkableSlopeAngleTerrain = config.walkableSlopeAngle;
                // Custom parameter (not part of rcConfig)
                const float walkableSlopeAngleVMaps = jsonTileConfig["walkableSlopeAngleVMaps"].get<float>();
                // Player slope angle is fix (client side controlled)
                const float playerClimbLimit = cosf(52.0f / 180.0f * RC_PI);
                const float maxClimbLimitTerrain = cosf(walkableSlopeAngleTerrain / 180.0f * RC_PI);
                const float maxClimbLimitVmaps = cosf(walkableSlopeAngleVMaps / 180.0f * RC_PI);

                for (int i = 0; i < tTriCount; ++i)
                {
                    const int* tri = &tTris[i * 3];
                    calcTriNormal(&tVerts[tri[0] * 3], &tVerts[tri[1] * 3], &tVerts[tri[2] * 3], norm);
                    bool terrain = meshData.IsTerrainTriangle(i);
                    // 3.1 Check if the face is walkable: different angle for different type of triangle
                    // NPCs, charges, ... can climb up to the HardLimit
                    // blinks, randomPosGenerator ... can climb up to playerClimbLimit
                    // With playerClimbLimit < HardLimit
                    float climbHardLimit = terrain ? maxClimbLimitTerrain : maxClimbLimitVmaps;
                    if (norm[1] > playerClimbLimit)
                        areas[i] = AREA_GROUND;
                    else if (norm[1] > climbHardLimit)
                        areas[i] = AREA_STEEP_SLOPE;
                    if (!terrain)
                    {
                        switch (areas[i])
                        {
                        case AREA_GROUND:
                            areas[i] = AREA_GROUND_MODEL;
                            break;
                        case AREA_STEEP_SLOPE:
                            areas[i] = AREA_STEEP_SLOPE_MODEL;
                            break;
                        }
                    }
                    // Now we remove underterrain triangles (actually set flags to 0)
                    // This prevents selecting wrong poly for a player in the server later.
                    if (!terrain && areas[i] && !m_quick)
                    {
                        // Get triangle corners (as usual, yzx positions)
                        // (actually we push these corners towards the center a bit to prevent collision with border models etc...)
                        float verts[9];
                        for (int c = 0; c < 3; ++c) // Corner
                            for (int v = 0; v < 3; ++v) // Coordinate
                                verts[3 * c + v] = (5 * tVerts[tri[c] * 3 + v] + tVerts[tri[(c + 1) % 3] * 3 + v] + tVerts[tri[(c + 2) % 3] * 3 + v]) / 7;
                        // A triangle is undermap if all corners are undermap

                        if (m_terrainBuilder->IsUnderMap(&verts[0]) && m_terrainBuilder->IsUnderMap(&verts[3]) && m_terrainBuilder->IsUnderMap(&verts[6]))
                        {
                            areas[i] = AREA_NONE;
                            continue;
                        }
                    }
                }
                /// 4. Every triangle is correctly marked now, we can rasterize everything
                SortAndRasterizeTriangles(m_rcContext, tVerts, tVertCount, tTris, areas, tTriCount, *tile.solid, 0);
                delete[] areas;

                /// 5. Don't walk over too high Obstacles.
                // We can pass higher terrain obstacles, or model obstacles.
                // But for terrain->vmap->terrain kind of obstacles, it's harder to climb.
                // (Why? No idea, ask Blizzard. Empirically confirmed on retail)
                // 5.1 walkableClimbTerrain >= walkableClimbModelTransition so do it first
                rcFilterLowHangingWalkableObstacles(m_rcContext, walkableClimbTerrain, *tile.solid);
                // 5.2 maps <-> vmaps transition
                filterLedgeSpans(tileCfg.walkableHeight, walkableClimbModelTransition, walkableClimbTerrain, *tile.solid);
                //rcFilterLedgeSpans(m_rcContext, tileCfg.walkableHeight, walkableClimbTerrain, *tile.solid); // Default recast code

                /// 6. Now we are happy because we have the correct flags.
                // Set's cleanup tmp flags used by the generator, so we don't have a too
                // complicated navmesh in the end.
                // (We dont care if a poly comes from Terrain or Model at runtime)
                filterRemoveUselessAreas(*tile.solid);
                rcFilterWalkableLowHeightSpans(m_rcContext, tileCfg.walkableHeight, *tile.solid);

                /// 7. Let's process water now.
                // When water is not deep, we have a transition area (AREA_WATER_TRANSITION)
                // Both ground and water creatures can be there.
                // Otherwise, the terrain in deeper waters is considered as actual swim/water terrain.
                filterWalkableLowHeightSpansWith(*liquidsTile.solid, *tile.solid, inWaterGround, stepForGroundInheriteWater);

                /// 8. Now let's move on with the last and more generic steps of navmesh generation.
                // compact heightfield spans
                tile.chf = rcAllocCompactHeightfield();
                if (!tile.chf || !rcBuildCompactHeightfield(m_rcContext, tileCfg.walkableHeight, walkableClimbTerrain, *tile.solid, *tile.chf))
                {
                    printf("%s Failed compacting heightfield!                     \n", tileString);
                    continue;
                }

                // build polymesh intermediates
                if (!rcErodeWalkableArea(m_rcContext, config.walkableRadius, *tile.chf))
                {
                    printf("%s Failed eroding area!                               \n", tileString);
                    continue;
                }

                if (!rcMedianFilterWalkableArea(m_rcContext, *tile.chf))
                {
                    printf("%s Failed filtering area!                             \n", tileString);
                    continue;
                }

                if (!rcBuildDistanceField(m_rcContext, *tile.chf))
                {
                    printf("%s Failed building distance field!                    \n", tileString);
                    continue;
                }

                if (!rcBuildRegions(m_rcContext, *tile.chf, tileCfg.borderSize, tileCfg.minRegionArea, tileCfg.mergeRegionArea))
                {
                    printf("%s Failed building regions!                           \n", tileString);
                    continue;
                }

                tile.cset = rcAllocContourSet();
                if (!tile.cset || !rcBuildContours(m_rcContext, *tile.chf, tileCfg.maxSimplificationError, tileCfg.maxEdgeLen, *tile.cset))
                {
                    printf("%s Failed building contours!                          \n", tileString);
                    continue;
                }

                // build polymesh
                tile.pmesh = rcAllocPolyMesh();
                if (!tile.pmesh || !rcBuildPolyMesh(m_rcContext, *tile.cset, tileCfg.maxVertsPerPoly, *tile.pmesh))
                {
                    printf("%s Failed building polymesh!                          \n", tileString);
                    continue;
                }

                tile.dmesh = rcAllocPolyMeshDetail();
                if (!tile.dmesh || !rcBuildPolyMeshDetail(m_rcContext, *tile.pmesh, *tile.chf, tileCfg.detailSampleDist, tileCfg.detailSampleMaxError, *tile.dmesh))
                {
                    printf("%s Failed building polymesh detail!                   \n", tileString);
                    continue;
                }

                // free those up
                // we may want to keep them in the future for debug
                // but right now, we don't have the code to merge them
                rcFreeHeightField(tile.solid);
                tile.solid = nullptr;
                rcFreeCompactHeightfield(tile.chf);
                tile.chf = nullptr;
                rcFreeContourSet(tile.cset);
                tile.cset = nullptr;
            }
        }

        // merge per tile poly and detail meshes
        rcPolyMesh** pmmerge = new rcPolyMesh * [TILES_PER_MAP * TILES_PER_MAP];
        rcPolyMeshDetail** dmmerge = new rcPolyMeshDetail * [TILES_PER_MAP * TILES_PER_MAP];

        int nmerge = 0;
        for (int y = 0; y < TILES_PER_MAP; ++y)
        {
            for (int x = 0; x < TILES_PER_MAP; ++x)
            {
                Tile& tile = tiles[x + y * TILES_PER_MAP];
                if (tile.pmesh)
                {
                    pmmerge[nmerge] = tile.pmesh;
                    dmmerge[nmerge] = tile.dmesh;
                    nmerge++;
                }
            }
        }

        iv.polyMesh = rcAllocPolyMesh();
        if (!iv.polyMesh)
        {
            delete[] tiles;
            delete[] pmmerge;
            delete[] dmmerge;
            printf("%s alloc iv.polyMesh FAILED!                          \r", tileString);
            return;
        }
        rcMergePolyMeshes(m_rcContext, pmmerge, nmerge, *iv.polyMesh);

        iv.polyMeshDetail = rcAllocPolyMeshDetail();
        if (!iv.polyMeshDetail)
        {
            printf("%s alloc m_dmesh FAILED!                              \r", tileString);
            delete[] tiles;
            delete[] pmmerge;
            delete[] dmmerge;
            return;
        }
        rcMergePolyMeshDetails(m_rcContext, dmmerge, nmerge, *iv.polyMeshDetail);

        // free things up
        delete[] pmmerge;
        delete[] dmmerge;
        delete[] tiles;

        // set polygons as walkable
        // TODO: special flags for DYNAMIC polygons, ie surfaces that can be turned on and off
        for (int i = 0; i < iv.polyMesh->npolys; ++i)
            if (iv.polyMesh->areas[i] != RC_NULL_AREA)
            {
                switch (iv.polyMesh->areas[i] & 0xF)
                {
                case AREA_NONE:
                    break;
                case AREA_GROUND:
                    iv.polyMesh->flags[i] |= NAV_GROUND;
                    break;
                case AREA_STEEP_SLOPE:
                    iv.polyMesh->flags[i] |= (NAV_GROUND | NAV_STEEP_SLOPES);
                    break;
                case AREA_WATER_TRANSITION:
                    iv.polyMesh->flags[i] |= (NAV_GROUND | NAV_WATER);
                    break;
                case AREA_WATER:
                    iv.polyMesh->flags[i] |= NAV_WATER;
                    break;
                case AREA_MAGMA:
                    iv.polyMesh->flags[i] |= NAV_MAGMA;
                    break;
                case AREA_SLIME:
                    iv.polyMesh->flags[i] |= NAV_SLIME;
                    break;
                default:
                    iv.polyMesh->flags[i] |= 0x1;
                    //printf("%s uses unknown area %u     \n", tileString, iv.polyMesh->areas[i]);
                    break;
                }
            }

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

        params.offMeshConVerts = meshData.offMeshConnections.getCArray();
        params.offMeshConCount = meshData.offMeshConnections.size() / 6;
        params.offMeshConRad = meshData.offMeshConnectionRads.getCArray();
        params.offMeshConDir = meshData.offMeshConnectionDirs.getCArray();
        params.offMeshConAreas = meshData.offMeshConnectionsAreas.getCArray();
        params.offMeshConFlags = meshData.offMeshConnectionsFlags.getCArray();

        params.walkableHeight = agentHeight;
        params.walkableRadius = agentRadius;
        params.walkableClimb = agentMaxClimbTerrain;
        params.tileX = (((bmin[0] + bmax[0]) / 2) - navMesh->getParams()->orig[0]) / GRID_SIZE;
        params.tileY = (((bmin[2] + bmax[2]) / 2) - navMesh->getParams()->orig[2]) / GRID_SIZE;
        params.tileLayer = 0;
        params.buildBvTree = true;
        rcVcopy(params.bmin, bmin);
        rcVcopy(params.bmax, bmax);
        params.cs = config.cs;
        params.ch = config.ch;

        // will hold final navmesh
        unsigned char* navData = nullptr;
        int navDataSize = 0;

        do
        {
            // these values are checked within dtCreateNavMeshData - handle them here
            // so we have a clear error message
            if (params.nvp > DT_VERTS_PER_POLYGON)
            {
                printf("%s Invalid verts-per-polygon value!                   \n", tileString);
                continue;
            }
            if (params.vertCount >= 0xffff)
            {
                printf("%s Too many vertices! (0x%8x)                         \n", tileString, params.vertCount);
                exit(0);
                continue;
            }
            if (!params.vertCount || !params.verts)
            {
                // occurs mostly when adjacent tiles have models
                // loaded but those models don't span into this tile

                // message is an annoyance
                //printf("%sNo vertices to build tile!              \n", tileString);
                continue;
            }
            if (!params.polyCount || !params.polys)
            {
                // we have flat tiles with no actual geometry - don't build those, its useless
                // keep in mind that we do output those into debug info
                // drop tiles with only exact count - some tiles may have geometry while having less tiles
                printf("%s No polygons to build on tile!                      \n", tileString);
                continue;
            }
            if (!params.detailMeshes || !params.detailVerts || !params.detailTris)
            {
                printf("%s No detail mesh to build tile!                      \n", tileString);
                continue;
            }

            printf("%s Building navmesh tile...                           \r", tileString);
            if (!dtCreateNavMeshData(&params, &navData, &navDataSize))
            {
                printf("%s Failed building navmesh tile!                      \n", tileString);
                continue;
            }

            dtTileRef tileRef = 0;
            printf("%s Adding tile to navmesh...                          \r", tileString);
            // DT_TILE_FREE_DATA tells detour to unallocate memory when the tile
            // is removed via removeTile()
            dtStatus dtResult = navMesh->addTile(navData, navDataSize, DT_TILE_FREE_DATA, 0, &tileRef);
            if (!tileRef || dtStatusFailed(dtResult))
            {
                printf("%s Failed adding tile to navmesh (0x%x)               \n", tileString, dtResult);
                continue;
            }

            // file output
            char fileName[255];
            sprintf(fileName, "mmaps/%03u%02i%02i.mmtile", mapID, tileY, tileX);
            FILE* file = fopen(fileName, "wb");
            if (!file)
            {
                char message[1024];
                sprintf(message, "[Map %03i] Failed to open %s for writing!             \n", mapID, fileName);
                perror(message);
                navMesh->removeTile(tileRef, nullptr, nullptr);
                continue;
            }

            printf("%s Writing to file...                                 \r", tileString);

            // write header
            MmapTileHeader header;
            header.size = uint32(navDataSize);
            header.usesLiquids = m_terrainBuilder->usesLiquids() ? 1 : 0;
            fwrite(&header, sizeof(MmapTileHeader), 1, file);

            // write data
            fwrite(navData, sizeof(unsigned char), navDataSize, file);
            fclose(file);

            if (m_debug)
            {
                //Generate 3D obj files
                //VMAP
                iv.generateObjFile(mapID, tileX, tileY, meshData);

                //MMAP  
                duDumpPolyMeshDetailToObj(*iv.polyMeshDetail, mapID, tileY, tileX);
                duDumpPolyMeshToObj(*iv.polyMesh, mapID, tileY, tileX);

                //iv.writeIV(mapID, tileX, tileY);
                // Write navmesh data
                char fname[256];
                sprintf(fname, "meshes/map%03u%02u%02u.nav", mapID, tileY, tileX);
                FILE* file = fopen(fname, "wb");
                if (file)
                {
                    fwrite(&navDataSize, sizeof(uint32), 1, file);
                    fwrite(navData, sizeof(unsigned char), navDataSize, file);
                    fclose(file);
                }
            }
            // now that tile is written to disk, we can unload it
            navMesh->removeTile(tileRef, nullptr, nullptr);
        } while (0);
    }

    json TileWorker::getDefaultConfig()
    {
        return
        {
            { "borderSize",              0     }, // placeholder
            { "detailSampleDist",        2.0f  },
            { "detailSampleMaxError",    0.5f  },
            { "maxEdgeLen",              0     }, // placeholder
            { "maxSimplificationError",  1.8f  },
            { "mergeRegionArea",         10    },
            { "minRegionArea",           30    },
            { "walkableClimb",           0     }, // placeholder
            { "walkableHeight",          0     }, // placeholder
            { "walkableRadius",          0     }, // placeholder
            { "walkableSlopeAngle",      75.0f }, // slope terrain
            { "walkableSlopeAngleVMaps", 61.0f }, // slope model (WMO...)
            { "quick",                   -1    }, // skip 'undermesh removal'
        };
    }

    json TileWorker::getMapIdConfig(uint32 mapId)
    {
        std::string key = std::to_string(mapId);

        json config = getDefaultConfig();
        if (m_config.find(key) != m_config.end())
            config.update(m_config.at(key));

        return config;
    }

    json TileWorker::getTileConfig(uint32 mapId, uint32 tileX, uint32 tileY)
    {
        std::string key = std::to_string(tileX) + std::to_string(tileY);

        json config = getMapIdConfig(mapId);
        if (config.find(key) != config.end())
            config.update(config.at(key));

        for (json::iterator it = config.begin(); it != config.end();) {
            if ((*it).is_object())
                it = config.erase(it);
            else
                ++it;
        }

        return config;
    }
}
