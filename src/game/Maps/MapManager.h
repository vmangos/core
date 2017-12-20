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
#include "ace/Recursive_Thread_Mutex.h"
#include "ace/Thread_Mutex.h"
#include "Map.h"
#include "GridStates.h"

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

struct MANGOS_DLL_DECL MapID
{
    explicit MapID(uint32 id) : nMapId(id), nInstanceId(0) {}
    MapID(uint32 id, uint32 instid) : nMapId(id), nInstanceId(instid) {}

    bool operator<(const MapID& val) const
    {
        if(nMapId == val.nMapId)
            return nInstanceId < val.nInstanceId;

        return nMapId < val.nMapId;
    }

    bool operator==(const MapID& val) const { return nMapId == val.nMapId && nInstanceId == val.nInstanceId; }

    uint32 nMapId;
    uint32 nInstanceId;
};

struct ScheduledTeleportData;

class MANGOS_DLL_DECL MapManager : public MaNGOS::Singleton<MapManager, MaNGOS::ClassLevelLockable<MapManager, ACE_Recursive_Thread_Mutex> >
{
    friend class MaNGOS::OperatorNew<MapManager>;

    typedef ACE_Recursive_Thread_Mutex LOCK_TYPE;
    typedef ACE_Guard<LOCK_TYPE> LOCK_TYPE_GUARD;
    typedef MaNGOS::ClassLevelLockable<MapManager, ACE_Recursive_Thread_Mutex>::Lock Guard;

    public:
        typedef std::map<MapID, Map* > MapMapType;

        uint32 GetContinentInstanceId(uint32 mapId, float x, float y, bool* transitionArea = NULL);
        Map* CreateMap(uint32, const WorldObject* obj);
        Map* CreateBgMap(uint32 mapid, BattleGround* bg);
        Map* CreateTestMap(uint32 mapid, bool instanced, float posX, float posY);
        void DeleteTestMap(Map* map);
        Map* FindMap(uint32 mapid, uint32 instanceId = 0) const;


        void UpdateGridState(grid_state_t state, Map& map, NGridType& ngrid, GridInfo& ginfo, const uint32 &x, const uint32 &y, const uint32 &t_diff);

        // only const version for outer users
        void DeleteInstance(uint32 mapid, uint32 instanceId);

        void Initialize(void);
        void Update(uint32);

        void SetGridCleanUpDelay(uint32 t)
        {
            if( t < MIN_GRID_DELAY )
                i_gridCleanUpDelay = MIN_GRID_DELAY;
            else
                i_gridCleanUpDelay = t;
        }

        void SetMapUpdateInterval(uint32 t)
        {
            if( t > MIN_MAP_UPDATE_DELAY )
                t = MIN_MAP_UPDATE_DELAY;

            i_timer.SetInterval(t);
            i_timer.Reset();
        }

        //void LoadGrid(int mapid, int instId, float x, float y, const WorldObject* obj, bool no_unload = false);
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
            return IsValidMapCoord(loc.mapid,loc.coord_x,loc.coord_y,loc.coord_z,loc.orientation);
        }

        // modulos a radian orientation to the range of 0..2PI
        static float NormalizeOrientation(float o)
        {
            // fmod only supports positive numbers. Thus we have
            // to emulate negative numbers
            if(o < 0)
            {
                float mod = o *-1;
                mod = fmod(mod, 2.0f*M_PI_F);
                mod = -mod+2.0f*M_PI_F;
                return mod;
            }
            return fmod(o, 2.0f*M_PI_F);
        }

        void RemoveAllObjectsInRemoveList();

        bool CanPlayerEnter(uint32 mapid, Player* player);
        uint32 GenerateInstanceId() { return ++i_MaxInstanceId; }
        void InitMaxInstanceId();
        void InitializeVisibilityDistanceInfo();

        /* statistics */
        uint32 GetNumInstances();
        uint32 GetNumPlayersInInstances();


        //get list of all maps
        const MapMapType& Maps() const { return i_maps; }

        template<typename Do>
        void DoForAllMapsWithMapId(uint32 mapId, Do& _do);

        void ScheduleInstanceSwitch(Player* player, uint16 newInstance);
        void SwitchPlayersInstances();

        void ScheduleFarTeleport(Player *player, ScheduledTeleportData *data);
        void ExecuteDelayedPlayerTeleports();
        void ExecuteSingleDelayedTeleport(Player *player);
        void CancelDelayedPlayerTeleport(Player *player);

        void MarkContinentUpdateFinished(int idx)
        {
            ASSERT(idx < i_maxContinentThread);
            i_continentUpdateFinished[idx] = true;
        }
        bool IsContinentUpdateFinished()
        {
            // Check pointer rather than deref. Deleted after
            // continent and instance updates are finished
            if (i_continentUpdateFinished == NULL)
                return true;

            for (int i = 0; i < i_maxContinentThread; ++i)
                if (!i_continentUpdateFinished[i])
                    return false;
            return true;
        }
    private:

        // debugging code, should be deleted some day
        GridState* si_GridStates[MAX_GRID_STATE];
        int i_GridStateErrorCount;

    private:

        MapManager();
        ~MapManager();

        MapManager(const MapManager &);
        MapManager& operator=(const MapManager &);

        void InitStateMachine();
        void DeleteStateMachine();

        Map* CreateInstance(uint32 id, Player * player);
        DungeonMap* CreateDungeonMap(uint32 id, uint32 InstanceId, DungeonPersistentState *save = NULL);
        BattleGroundMap* CreateBattleGroundMap(uint32 id, uint32 InstanceId, BattleGround* bg);

        uint32 i_gridCleanUpDelay;
        MapMapType i_maps;
        IntervalTimer i_timer;

        uint32 i_MaxInstanceId;
        int             i_maxContinentThread;
        volatile bool*  i_continentUpdateFinished;
        bool asyncMapUpdating;

        // Instanced continent zones
        const static int LAST_CONTINENT_ID = 2;
        ACE_Thread_Mutex    m_scheduledInstanceSwitches_lock[LAST_CONTINENT_ID];
        std::map<Player*, uint16 /* new instance */> m_scheduledInstanceSwitches[LAST_CONTINENT_ID]; // 2 continents

        ACE_Thread_Mutex m_scheduledFarTeleportsLock;
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
