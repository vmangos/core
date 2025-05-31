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

#ifndef MANGOS_MAPMANAGER_H
#define MANGOS_MAPMANAGER_H

#include "Common.h"
#include "Platform/Define.h"
#include "Policies/Singleton.h"
#include "GridStates.h"
#include <condition_variable>

class Map;
class BattleGround;

enum
{
    MAP0_TOP_NORTH      = 1,
    MAP0_MIDDLE_NORTH   = 2,
    MAP0_IRONFORGE_AREA = 3,
    MAP0_MIDDLE         = 4,    // Burning stepps, Redridge monts, Blasted lands
    MAP0_STORMWIND_AREA = 5,    // Stormwind, Elwynn forest, Redridge Mts
    MAP0_SOUTH          = 6,    // Southern phase of the continent

    MAP1_NORTH          = 11,   // Stonetalon, Ashenvale, Darkshore, Felwood, Moonglade, Winterspring, Azshara, Desolace
    MAP1_DUROTAR        = 12,   // Durotar
    MAP1_UPPER_MIDDLE   = 13,   // Mulgore, Barrens, Dustwallow Marsh
    MAP1_LOWER_MIDDLE   = 14,   // Feralas, 1K needles
    MAP1_VALLEY         = 15,   // Orc and Troll starting area
    MAP1_ORGRIMMAR      = 16,   // Orgrimmar (on its own)
    MAP1_SOUTH          = 17,   // Silithus, Un'goro and Tanaris

    MAP0_FIRST          = 1,
    MAP0_LAST           = 10,
    MAP1_FIRST          = 11,
    MAP1_LAST           = 20,
};

struct InstantiatedContinentBoundary
{
    float const* points; 
    int count; 
    float minY, maxY;
    float minX, maxX;

    InstantiatedContinentBoundary(float const* pts, int c, float minY_, float maxY_, float minX_, float maxX_) : points(pts), count(c), minY(minY_), maxY(maxY_), minX(minX_), maxX(maxX_) {}
};

inline InstantiatedContinentBoundary MakeBoundary(float const* pts, int count)
{
    float minX = pts[0], maxX = pts[0];
    float minY = pts[1], maxY = pts[1];

    for (int i = 1; i < count; ++i)
    {
        float x = pts[i * 2];
        float y = pts[i * 2 + 1];

        if (x < minX)
            minX = x;
        if (x > maxX)
            maxX = x;
        if (y < minY)
            minY = y;
        if (y > maxY)
            maxY = y;
    }

    return InstantiatedContinentBoundary(pts, count, minY, maxY, minX, maxX);
}

static float const topNorthSouthLimit[] = {2032.048340f, -6927.750000f, 1634.863403f, -6157.505371f, 1109.519775f, -5181.036133f, 1315.204712f, -4096.020508f, 1073.089233f, -3372.571533f, 825.833191f, -3125.778809f, 657.343994f, -2314.813232f, 424.736145f, -1888.283691f, 744.395813f, -1647.935425f, 1424.160645f, -654.948181f, 1447.065308f, -169.751358f, 1208.715454f, 189.748703f, 1596.240356f, 998.616699f, 1577.923706f, 1293.419922f, 1458.520264f, 1727.373291f, 1591.916138f, 3728.139404f};
static const InstantiatedContinentBoundary topNorthSouthBoundary(MakeBoundary(topNorthSouthLimit, sizeof(topNorthSouthLimit) / (2 * sizeof(float))));
static float const ironforgeAreaSouthLimit[] = {-7491.33f, 3093.74f, -7472.04f, -391.88f, -6366.68f, -730.10f, -6063.96f, -1411.76f, -6087.62f, -2190.21f, -6349.54f, -2533.66f, -6308.63f, -3049.32f, -6107.82f, -3345.30f, -6008.49f, -3590.52f, -5989.37f, -4312.29f, -5806.26f, -5864.11f};
static const InstantiatedContinentBoundary ironforgeAreaSouthBoundary(MakeBoundary(ironforgeAreaSouthLimit, sizeof(ironforgeAreaSouthLimit) / (2 * sizeof(float))));

static float const stormwindAreaNorthLimit[] = {-8004.25f, 3714.11f, -8075.00f, -179.00f, -8638.00f, 169.00f, -9044.00f, 35.00f, -9068.00f, -125.00f, -9094.00f, -147.00f, -9206.00f, -290.00f, -9097.00f, -510.00f, -8739.00f, -501.00f, -8725.50f, -1618.45f, -9810.40f, -1698.41f, -10049.60f, -1740.40f, -10670.61f, -1692.51f, -10908.48f, -1563.87f, -13006.40f, -1622.80f, -12863.23f, -4798.42f};
static const InstantiatedContinentBoundary stormwindAreaNorthBoundary(MakeBoundary(stormwindAreaNorthLimit, sizeof(stormwindAreaNorthLimit) / (2 * sizeof(float))));

static float const stormwindAreaSouthLimit[] = {-8725.337891f, 3535.624023f, -9525.699219f, 910.132568f, -9796.953125f, 839.069580f, -9946.341797f, 743.102844f, -10287.361328f, 760.076477f, -10083.828125f, 380.389893f, -10148.072266f, 80.056450f, -10014.583984f, -161.638519f, -9978.146484f, -361.638031f, -9877.489258f, -563.304871f, -9980.967773f, -1128.510498f, -9991.717773f, -1428.793213f, -9887.579102f, -1618.514038f, -10169.600586f, -1801.582031f, -9966.274414f, -2227.197754f, -9861.309570f, -2989.841064f, -9944.026367f, -3205.886963f, -9610.209961f, -3648.369385f, -7949.329590f, -4081.389404f, -7910.859375f, -5855.578125f};
static const InstantiatedContinentBoundary stormwindAreaSouthBoundary(MakeBoundary(stormwindAreaSouthLimit, sizeof(stormwindAreaSouthLimit) / (2 * sizeof(float))));

static float const northMiddleLimit[] = {-2280.00f, 4054.00f, -2401.00f, 2365.00f, -2432.00f, 1338.00f, -2286.00f, 769.00f, -2137.00f, 662.00f, -2044.54f, 489.86f, -1808.52f, 436.39f, -1754.85f, 504.55f, -1094.55f, 651.75f, -747.46f, 647.73f, -685.55f, 408.43f, -311.38f, 114.43f, -358.40f, -587.42f, -377.92f, -748.70f, -512.57f, -919.49f, -280.65f, -1008.87f, -81.29f, -930.89f, 284.31f, -1105.39f, 568.86f, -892.28f, 1211.09f, -1135.55f, 879.60f, -2110.18f, 788.96f, -2276.02f, 899.68f, -2625.56f, 1281.54f, -2689.42f, 1521.82f, -3047.85f, 1424.22f, -3365.69f, 1694.11f, -3615.20f, 2373.78f, -4019.96f, 2388.13f, -5124.35f, 2193.79f, -5484.38f, 1703.57f, -5510.53f, 1497.59f, -6376.56f, 1368.00f, -8530.00f};
static const InstantiatedContinentBoundary northMiddleBoundary(MakeBoundary(northMiddleLimit, sizeof(northMiddleLimit) / (2 * sizeof(float))));

static float const durotarSouthLimit[] = {2755.00f, -3766.00f, 2225.00f, -3596.00f, 1762.00f, -3746.00f, 1564.00f, -3943.00f, 1184.00f, -3915.00f, 737.00f, -3782.00f, -75.00f, -3742.00f, -263.00f, -3836.00f, -173.00f, -4064.00f, -81.00f, -4091.00f, -49.00f, -4089.00f, -16.00f, -4187.00f, -5.00f, -4192.00f, -14.00f, -4551.00f, -397.00f, -4601.00f, -522.00f, -4583.00f, -668.00f, -4539.00f, -790.00f, -4502.00f, -1176.00f, -4213.00f, -1387.00f, -4674.00f, -2243.00f, -6046.00f};
static const InstantiatedContinentBoundary durotarSouthBoundary(MakeBoundary(durotarSouthLimit, sizeof(durotarSouthLimit) / (2 * sizeof(float))));
static float const valleyoftrialsSouthLimit[] = {-324.00f, -3869.00f, -774.00f, -3992.00f, -965.00f, -4290.00f, -932.00f, -4349.00f, -828.00f, -4414.00f, -661.00f, -4541.00f, -521.00f, -4582.00f};
static const InstantiatedContinentBoundary valleyoftrialsSouthBoundary(MakeBoundary(valleyoftrialsSouthLimit, sizeof(valleyoftrialsSouthLimit) / (2 * sizeof(float))));
static float const middleToSouthLimit[] = {-2402.01f,     4255.70f,      -2475.933105f, 3199.568359f, // Desolace
                                           -2344.124023f, 1756.164307f,  -2826.438965f, 403.824738f, // Mulgore
                                           -3472.819580f, 182.522476f, // Feralas
                                           -4365.006836f, -1602.575439f, // the Barrens
                                           -4515.219727f, -1681.356079f, -4543.093750f, -1882.869385f, // Thousand Needles
                                           -4824.16f,     -2310.11f,     -5102.913574f, -2647.062744f, -5248.286621f, -3034.536377f, -5246.920898f, -3339.139893f, -5459.449707f, -4920.155273f, // Tanaris
                                           -5437.00f,     -5863.00f};
static const InstantiatedContinentBoundary middleToSouthBoundary(MakeBoundary(middleToSouthLimit, sizeof(middleToSouthLimit) / (2 * sizeof(float))));
static float const orgrimmarSouthLimit[] = {2132.5076f, -3912.2478f, 1944.4298f, -3855.2583f, 1735.6906f, -3834.2417f, 1654.3671f, -3380.9902f, 1593.9861f, -3975.5413f, 1400.9472f, -4242.2387f, 1436.3106f, -4007.8950f, 1393.3199f, -4196.0625f, 1445.2428f, -4373.9052f, 1407.2349f, -4429.4145f, 1464.7142f, -4545.2875f, 1584.1331f, -4596.8764f, 1716.8065f, -4601.1323f, 1875.8312f, -4788.7187f, 1979.7647f, -4883.4585f, 2219.1562f, -4854.3330f};
static const InstantiatedContinentBoundary orgrimmarSouthBoundary(MakeBoundary(orgrimmarSouthLimit, sizeof(orgrimmarSouthLimit) / (2 * sizeof(float))));
static float const feralasThousandNeedlesSouthLimit[] = {-6495.4995f, -4711.981f, -6674.9995f, -4515.0019f, -6769.5717f, -4122.4272f, -6838.2651f, -3874.2792f, -6851.1314f, -3659.1179f, -6624.6845f, -3063.3843f, -6416.9067f, -2570.1301f, -5959.8466f, -2287.2634f, -5947.9135f, -1866.5028f, -5947.9135f, -820.4881f, -5876.7114f, -3.5138f, -5876.7114f, 917.6407f, -6099.3603f, 1153.2884f, -6021.8989f, 1638.1809f, -6091.6176f, 2335.8892f, -6744.9946f, 2393.4855f, -6973.8608f, 3077.0281f, -7068.7241f, 4376.2304f, -7142.1211f, 4808.4331f};
static const InstantiatedContinentBoundary feralasThousandNeedlesSouthBoundary(MakeBoundary(feralasThousandNeedlesSouthLimit, sizeof(feralasThousandNeedlesSouthLimit) / (2 * sizeof(float))));

struct MapID
{
    explicit MapID(uint32 id) : nMapId(id), nInstanceId(0) {}
    MapID(uint32 id, uint32 instid) : nMapId(id), nInstanceId(instid) {}

    bool operator<(MapID const& val) const
    {
        if (nMapId == val.nMapId)
            return nInstanceId < val.nInstanceId;

        return nMapId < val.nMapId;
    }

    bool operator==(MapID const& val) const { return nMapId == val.nMapId && nInstanceId == val.nInstanceId; }

    uint32 nMapId;
    uint32 nInstanceId;
};

class ThreadPool;
struct ScheduledTeleportData;

class MapManager : public MaNGOS::Singleton<MapManager, MaNGOS::ClassLevelLockable<MapManager, std::recursive_mutex> >
{
    friend class MaNGOS::OperatorNew<MapManager>;

    using  LOCK_TYPE = std::recursive_mutex;
    using LOCK_TYPE_GUARD = std::unique_lock<LOCK_TYPE>;
    typedef MaNGOS::ClassLevelLockable<MapManager, std::recursive_mutex>::Lock Guard;

    public:
        typedef std::map<MapID, Map* > MapMapType;

        uint32 GetContinentInstanceId(uint32 mapId, float x, float y, bool* transitionArea = nullptr);
        Map* CreateMap(uint32, WorldObject const* obj);
        Map* CreateBgMap(uint32 mapid, BattleGround* bg);
        Map* CreateTestMap(uint32 mapid, bool instanced, float posX, float posY);
        void DeleteTestMap(Map* map);
        Map* FindMap(uint32 mapid, uint32 instanceId = 0) const;
        void ScheduleNewWorldOnFarTeleport(Player* pPlayer);
        void CancelInstanceCreationForPlayer(Player* pPlayer) { m_scheduledNewInstancesForPlayers.erase(pPlayer); }

        void UpdateGridState(grid_state_t state, Map& map, NGridType& ngrid, GridInfo& ginfo, uint32 const& x, uint32 const& y, uint32 const& t_diff);

        // only const version for outer users
        void DeleteInstance(uint32 mapid, uint32 instanceId);

        void Initialize(void);
        void Update(uint32);

        void SetGridCleanUpDelay(uint32 t)
        {
            if (t < MIN_GRID_DELAY)
                i_gridCleanUpDelay = MIN_GRID_DELAY;
            else
                i_gridCleanUpDelay = t;
        }

        void SetMapUpdateInterval(uint32 t)
        {
            if (t > MIN_MAP_UPDATE_DELAY)
                t = MIN_MAP_UPDATE_DELAY;

            i_timer.SetInterval(t);
            i_timer.Reset();
        }

        //void LoadGrid(int mapid, int instId, float x, float y, WorldObject const* obj, bool no_unload = false);
        void UnloadAll();

        static bool ExistMapAndVMap(uint32 mapid, float x, float y);
        static bool IsValidMAP(uint32 mapid);

        static bool IsValidMapCoord(uint32 mapid, float x,float y)
        {
            return IsValidMAP(mapid) && MaNGOS::IsValidMapCoord(x,y);
        }

        static bool IsValidMapCoord(uint32 mapid, float x,float y,float z)
        {
            return IsValidMAP(mapid) && MaNGOS::IsValidMapCoord(x,y,z);
        }

        static bool IsValidMapCoord(uint32 mapid, float x,float y,float z,float o)
        {
            return IsValidMAP(mapid) && MaNGOS::IsValidMapCoord(x,y,z,o);
        }

        static bool IsValidMapCoord(WorldLocation const& loc)
        {
            return IsValidMapCoord(loc.mapId,loc.x,loc.y,loc.z,loc.o);
        }

        void RemoveAllObjectsInRemoveList();

        bool CanPlayerEnter(uint32 mapid, Player* player);
        uint32 GenerateInstanceId() { return ++i_MaxInstanceId; }
        void InitMaxInstanceId();
        void InitializeVisibilityDistanceInfo();

        // statistics
        uint32 GetNumInstances();
        uint32 GetNumPlayersInInstances();

        //get list of all maps
        const MapMapType& Maps() const { return i_maps; }

        template<typename Do>
        void DoForAllMapsWithMapId(uint32 mapId, Do& _do);

        void ScheduleInstanceSwitch(Player* player, uint16 newInstance);
        void SwitchPlayersInstances();

        void ScheduleFarTeleport(Player* player, ScheduledTeleportData* data);
        void ExecuteDelayedPlayerTeleports();
        void ExecuteSingleDelayedTeleport(Player *player);
        void CancelDelayedPlayerTeleport(Player *player);
        void MarkContinentUpdateFinished();
        bool IsContinentUpdateFinished() const;

        bool waitContinentUpdateFinishedFor(std::chrono::milliseconds time) const;
        bool waitContinentUpdateFinishedUntil(std::chrono::high_resolution_clock::time_point time) const;
    private:

        // debugging code, should be deleted some day
        GridState* si_GridStates[MAX_GRID_STATE];
        int i_GridStateErrorCount = 0;

    private:

        MapManager();
        ~MapManager();

        MapManager(MapManager const&);
        MapManager& operator=(MapManager const&);

        void InitStateMachine();
        void DeleteStateMachine();

        Map* CreateInstance(uint32 id, Player* player);
        DungeonMap* CreateDungeonMap(uint32 id, uint32 InstanceId, DungeonPersistentState* save = nullptr);
        BattleGroundMap* CreateBattleGroundMap(uint32 id, uint32 InstanceId, BattleGround* bg);

        uint32 i_gridCleanUpDelay;
        MapMapType i_maps;
        IntervalTimer i_timer;

        uint32 i_MaxInstanceId;
        int             i_maxContinentThread = 0;

        mutable std::mutex      m_continentMutex;
        mutable std::condition_variable      m_continentCV;
        std::atomic<int> i_continentUpdateFinished{0};

        std::unique_ptr<ThreadPool> m_threads;
        std::unique_ptr<ThreadPool> m_continentThreads;
        std::unique_ptr<ThreadPool> m_instanceCreationThreads;
        bool asyncMapUpdating = false;

        // Instanced continent zones
        const static int LAST_CONTINENT_ID = 2;
        std::mutex    m_scheduledInstanceSwitches_lock[LAST_CONTINENT_ID];
        std::map<Player*, uint16 /* new instance */> m_scheduledInstanceSwitches[LAST_CONTINENT_ID]; // 2 continents

        // Handle creation of new maps for teleport while continents are being updated.
        void CreateNewInstancesForPlayers();
        std::unordered_set<Player*> m_scheduledNewInstancesForPlayers;

        std::mutex m_scheduledFarTeleportsLock;
        typedef std::map<Player*, ScheduledTeleportData*> ScheduledTeleportMap;
        ScheduledTeleportMap m_scheduledFarTeleports;

        void ExecuteSingleDelayedTeleport(ScheduledTeleportMap::iterator iter);
};

template<typename Do>
void MapManager::DoForAllMapsWithMapId(uint32 mapId, Do& _do)
{
    MapMapType::const_iterator start = i_maps.lower_bound(MapID(mapId, 0));
    MapMapType::const_iterator end = i_maps.lower_bound(MapID(mapId + 1, 0));
    for (auto itr = start; itr != end; ++itr)
        _do(itr->second);
}

#define sMapMgr MapManager::Instance()

#endif
