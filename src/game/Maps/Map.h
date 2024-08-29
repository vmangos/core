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

#ifndef MANGOS_MAP_H
#define MANGOS_MAP_H

#include "Common.h"
#include "Policies/ThreadingModel.h"
#include "SharedDefines.h"
#include "GridDefines.h"
#include "Cell.h"
#include "Object.h"
#include "GridMap.h"
#include "GameSystem/GridRefManager.h"
#include "MapRefManager.h"
#include "Utilities/TypeList.h"
#include "vmap/DynamicTree.h"
#include "MoveSplineInitArgs.h"
#include "WorldSession.h"
#include "SQLStorages.h"
#include "ScriptCommands.h"
#include "CreatureLinkingMgr.h"

#include <bitset>
#include <list>
#include <set>
#include <mutex>
#include <shared_mutex>

using Movement::Vector3;

struct CreatureInfo;
class Creature;
class Unit;
class WorldPacket;
class InstanceData;
class CreatureGroup;
class MapPersistentState;
class WorldPersistentState;
class DungeonPersistentState;
class BattleGroundPersistentState;
class ChatHandler;
class BattleGround;
class WeatherSystem;
class GenericTransport;
class ElevatorTransport;
class Transport;

namespace VMAP
{
    class ModelInstance;
};

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push,N), also any gcc version not support it at some platform
#if defined(__GNUC__)
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

struct MapEntry
{
    uint32 id;
    uint32 parent;
    uint32 mapType;
    uint32 linkedZone;
    uint32 maxPlayers;
    uint32 resetDelay;
    int32 ghostEntranceMap;
    float ghostEntranceX;
    float ghostEntranceY;
    char*  name;
    uint32 scriptId;

    bool IsDungeon() const { return mapType == MAP_INSTANCE || mapType == MAP_RAID; }
    bool IsNonRaidDungeon() const { return mapType == MAP_INSTANCE; }
    bool Instanceable() const { return mapType == MAP_INSTANCE || mapType == MAP_RAID || mapType == MAP_BATTLEGROUND; }
    bool IsRaid() const { return mapType == MAP_RAID; }
    bool IsBattleGround() const { return mapType == MAP_BATTLEGROUND; }
    bool IsMountAllowed() const { return !IsDungeon() || id == 309 || id == 209 || id == 509 || id == 269; }
    bool IsContinent() const { return id == 0 || id == 1; }
};

typedef std::map<uint32, uint32> AreaFlagByMapId;
static AreaFlagByMapId sAreaFlagByMapId;

struct AreaEntry
{
    uint32 Id;
    uint32 MapId;
    uint32 ZoneId;
    uint32 ExploreFlag;
    uint32 Flags;
    int32  AreaLevel;
    char*  Name;
    uint32 Team;
    uint32 LiquidTypeId;

    bool IsZone() const { return ZoneId == 0; }

    static int32 GetFlagById(uint32 id)
    {
        const auto *areaEntry = sAreaStorage.LookupEntry<AreaEntry>(id);
        if (!areaEntry)
            return -1;

        return areaEntry->ExploreFlag;
    }

    static uint32 GetFlagByMapId(uint32 mapId)
    {
        auto itr = sAreaFlagByMapId.find(mapId);
        if (itr == sAreaFlagByMapId.end())
            return 0;
        return itr->second;
    }

    static const AreaEntry* GetById(uint32 id)
    {
        return sAreaStorage.LookupEntry<AreaEntry>(id);
    }

    static const AreaEntry* GetByAreaFlagAndMap(uint32 areaFlag, uint32 mapId)
    {
        AreaEntry const* areaEntry = nullptr;
        // 1.12.1 areatable have duplicates for areaflag
        for (auto itr = sAreaStorage.begin<AreaEntry>(); itr < sAreaStorage.end<AreaEntry>(); ++itr)
        {
            if (areaFlag && areaFlag == itr->ExploreFlag)
            {
                if (itr->MapId == mapId)
                    return *itr;

                areaEntry = *itr;
            }
        }

        if (areaEntry)
            return areaEntry;

        if (const auto *mapEntry = sMapStorage.LookupEntry<MapEntry>(mapId))
            return sAreaStorage.LookupEntry<AreaEntry>(mapEntry->linkedZone);

        return nullptr;
    }
};

#if defined(__GNUC__)
#pragma pack()
#else
#pragma pack(pop)
#endif

struct AreaLocale
{
    std::vector<std::string> Name;
};

#define MIN_UNLOAD_DELAY      1                             // immediate unload

typedef std::map<uint32, CreatureGroup*> CreatureGroupHolderType;
using MapMutexType = std::mutex; // can be replaced with a null mutex

// Instance IDs reserved for internal use (instanced continent parts, ...)
#define RESERVED_INSTANCES_LAST 100

enum TeleportLocation
{
    TELEPORT_LOCATION_HOMEBIND          = 0,
    TELEPORT_LOCATION_BG_ENTRY_POINT    = 1,
};

typedef bool(Map::*ScriptCommandFunction) (ScriptInfo const& script, WorldObject* source, WorldObject* target);

// Additional target part of a ScriptedEvent. 
struct ScriptedEventTarget
{
    ScriptedEventTarget(ObjectGuid object, uint32 failureCondition, uint32 failureScript, uint32 successCondition, uint32 successScript) :
        target(object), uiFailureCondition(failureCondition), uiFailureScript(failureScript), uiSuccessCondition(successCondition), uiSuccessScript(successScript) {}

    ObjectGuid target;
    uint32 uiFailureCondition;
    uint32 uiFailureScript;
    uint32 uiSuccessCondition;
    uint32 uiSuccessScript;
};

// Used for complex database scripts.
// - Can hold data.
// - Updated by the map every 1 second.
// - Can have success condition and script.
// - Can have failure condition and script.
// - Has 2 main targets.
// - Can have many extra target objects, with their own success/failure conditions and scripts.
// - Scripts can end the event at any point.
// - Event targets can be accessed by scripts.
struct ScriptedEvent
{
    ScriptedEvent(uint32 eventId, ObjectGuid source, ObjectGuid target, Map& map, time_t expireTime, uint32 failureCondition, uint32 failureScript, uint32 successCondition, uint32 successScript) :
        m_Source(source), m_Target(target), m_Map(map), m_uiEventId(eventId), m_tExpireTime(expireTime), m_bEnded(false), m_uiFailureCondition(failureCondition), m_uiFailureScript(failureScript), m_uiSuccessCondition(successCondition), m_uiSuccessScript(successScript) {}
    
    ObjectGuid m_Source;
    ObjectGuid m_Target;
    Map& m_Map;

    uint32 const m_uiEventId;
    time_t m_tExpireTime;
    bool m_bEnded;

    uint32 m_uiFailureCondition;
    uint32 m_uiFailureScript;
    uint32 m_uiSuccessCondition;
    uint32 m_uiSuccessScript;

    std::map<uint32, uint32> m_mData;
    std::vector<ScriptedEventTarget> m_vTargets;

    // Returns true when event has expired.
    bool UpdateEvent();

    void EndEvent(bool bSuccess);

    void SendEventToMainTargets(uint32 uiData);

    void SendEventToAdditionalTargets(uint32 uiData);

    void SendEventToAllTargets(uint32 uiData);

    void SetSourceObject(WorldObject* pSource)
    {
        if (pSource && pSource->IsInWorld() && (pSource->GetMap() == &m_Map))
        {
            m_Source = pSource->GetObjectGuid();
        }
    }

    void SetTargetObject(WorldObject* pTarget)
    {
        if (pTarget && pTarget->IsInWorld() && (pTarget->GetMap() == &m_Map))
        {
            m_Target = pTarget->GetObjectGuid();
        }
    }

    void AddOrUpdateExtraTarget(WorldObject* pObject, uint32 failureCondition, uint32 failureScript, uint32 successCondition, uint32 successScript)
    {
        if (!pObject || !pObject->IsInWorld() || (pObject->GetMap() != &m_Map))
            return;

        for (auto& target : m_vTargets)
        {
            // If target already exists, just update data.
            if (target.target == pObject->GetObjectGuid())
            {
                target.uiFailureCondition = failureCondition;
                target.uiFailureScript = failureScript;
                target.uiSuccessCondition = successCondition;
                target.uiSuccessScript = successScript;
                return;
            }
        }

        m_vTargets.emplace_back(pObject->GetObjectGuid(), failureCondition, failureScript, successCondition, successScript);
    }

    WorldObject* GetSourceObject() const;

    WorldObject* GetTargetObject() const;

    uint32 GetData(uint32 uiIndex) const
    {
        auto itr = m_mData.find(uiIndex);
        if (itr != m_mData.end())
            return itr->second;
        return 0;
    }

    void SetData(uint32 uiIndex, uint32 uiValue)
    {
        m_mData[uiIndex] = uiValue;
    }

    void IncrementData(uint32 uiIndex, uint32 uiValue)
    {
        m_mData[uiIndex] += uiValue;
    }

    void DecrementData(uint32 uiIndex, uint32 uiValue)
    {
        if (m_mData[uiIndex] < uiValue)
            m_mData[uiIndex] = 0;
        else
            m_mData[uiIndex] -= uiValue;
    }

    ScriptedEvent(ScriptedEvent const&) = delete;
};

class ThreadPool;

class Map : public GridRefManager<NGridType>
{
    friend class MapReference;
    friend class ObjectGridLoader;
    friend class ObjectWorldLoader;

    protected:
        Map(uint32 id, time_t, uint32 InstanceId);

    public:
        Map(const Map &) = delete;
        const Map & operator=(const Map &) = delete;
        virtual ~Map() override;
        void PrintInfos(ChatHandler& handler);
        void SpawnActiveObjects();
        // currently unused for normal maps
        bool CanUnload(uint32 diff)
        {
            if (!m_unloadTimer) return false;
            if (m_unloadTimer <= diff) return true;
            m_unloadTimer -= diff;
            return false;
        }

        void ExistingPlayerLogin(Player*);
        virtual bool Add(Player*);
        virtual void Remove(Player*, bool);
        template<class T> void Add(T*);
        template<class T> void Remove(T*, bool);

        static void DeleteFromWorld(Player* player);        // player object will deleted at call

        inline void UpdateCellsAroundObject(uint32 now, uint32 diff, WorldObject const* object);
        inline void UpdateActiveCellsSynch(uint32 now, uint32 diff);
        inline void MarkCellsAroundObject(WorldObject const* object);
        inline void UpdateActiveCellsAsynch(uint32 now, uint32 diff);
        inline void UpdateActiveCellsCallback(uint32 diff, uint32 now, uint32 threadId, uint32 totalThreads, uint32 step);
        inline void UpdateCells(uint32 diff);
        void UpdateSync(uint32 const);
        void UpdatePlayers();
        void DoUpdate(uint32 maxDiff);
        virtual void Update(uint32);
        void UpdateSessionsMovementAndSpellsIfNeeded();
        void ProcessSessionPackets(PacketProcessing type);

        void MessageBroadcast(Player const*, WorldPacket*, bool to_self);
        void MessageBroadcast(WorldObject const*, WorldPacket*);
        void MessageDistBroadcast(Player const*, WorldPacket*, float dist, bool to_self, bool own_team_only = false);
        void MessageDistBroadcast(WorldObject const*, WorldPacket*, float dist);

        float GetVisibilityDistance() const { return m_VisibleDistance; }
        float GetGridActivationDistance() const { return m_GridActivationDistance; }

        //function for setting up visibility distance for maps on per-type/per-Id basis
        virtual void InitVisibilityDistance();

        void PlayerRelocation(Player*, float x, float y, float z, float angl);
        // Used at extrapolation.
        void DoPlayerGridRelocation(Player*, float x, float y, float z, float angl);
        void CreatureRelocation(Creature* creature, float x, float y, float z, float orientation);

        template<class T, class CONTAINER> void Visit(Cell const& cell, TypeContainerVisitor<T, CONTAINER>& visitor);

        bool IsRemovalGrid(float x, float y) const
        {
            GridPair p = MaNGOS::ComputeGridPair(x, y);
            return !getNGrid(p.x_coord, p.y_coord) || getNGrid(p.x_coord, p.y_coord)->GetGridState() == GRID_STATE_REMOVAL;
        }

        bool IsLoaded(float x, float y) const
        {
            GridPair p = MaNGOS::ComputeGridPair(x, y);
            return loaded(p);
        }

        bool GetUnloadLock(GridPair const& p) const { return getNGrid(p.x_coord, p.y_coord)->getUnloadLock(); }
        void SetUnloadLock(GridPair const& p, bool on) { getNGrid(p.x_coord, p.y_coord)->setUnloadExplicitLock(on); }
        void LoadGrid(Cell const& cell, bool no_unload = false);
        bool UnloadGrid(uint32 const& x, uint32 const& y, bool pForce);
        virtual void UnloadAll(bool pForce);

        void ResetGridExpiry(NGridType& grid, float factor = 1) const
        {
            grid.ResetTimeTracker((time_t)((float)i_gridExpiry*factor));
        }

        time_t GetGridExpiry(void) const { return i_gridExpiry; }
        time_t GetCreateTime() const { return m_createTime; }
        uint32 GetId(void) const { return i_id; }

        // some calls like isInWater should not use vmaps due to processor power
        // can return INVALID_HEIGHT if under z+2 z coord not found height

        virtual void RemoveAllObjectsInRemoveList();

        bool CreatureRespawnRelocation(Creature* c, bool forGridUnload = false);        // used only in CreatureRelocation and ObjectGridUnloader

        static bool CheckGridIntegrity(Creature* c, bool moved);

        uint32 GetInstanceId() const { return i_InstanceId; }
        virtual bool CanEnter(Player* /*player*/) { return true; }
        char const* GetMapName() const;

        MapEntry const* GetMapEntry() const { return i_mapEntry; }
        bool Instanceable() const { return i_mapEntry && i_mapEntry->Instanceable(); }
        bool IsNonRaidDungeon() const { return i_mapEntry && i_mapEntry->IsNonRaidDungeon(); }
        bool IsDungeon() const { return i_mapEntry && i_mapEntry->IsDungeon(); }
        bool IsRaid() const { return i_mapEntry && i_mapEntry->IsRaid(); }
        bool IsBattleGround() const { return i_mapEntry && i_mapEntry->IsBattleGround(); }
        bool IsContinent() const { return i_mapEntry && i_mapEntry->IsContinent(); }

        // can't be nullptr for loaded map
        MapPersistentState* GetPersistentState() const { return m_persistentState; }

        void AddObjectToRemoveList(WorldObject* obj);

        void UpdateObjectVisibility(WorldObject* obj, Cell cell, CellPair cellpair);

        void UpdateActiveObjectVisibility(Player* player);
        void UpdateActiveObjectVisibility(Player* player, ObjectGuidSet& visibleGuids);
        void UpdateActiveObjectVisibility(Player* player, ObjectGuidSet& visibleGuids, UpdateData& data, std::set<WorldObject*>& visibleNow);

        void resetMarkedCells() { marked_cells.reset(); }
        bool isCellMarked(uint32 pCellId) { return marked_cells.test(pCellId); }
        void markCell(uint32 pCellId) { marked_cells.set(pCellId); }

        bool HavePlayers() const { return !m_mapRefManager.isEmpty(); }
        bool HaveRealPlayers() const; // no bots
        uint32 GetPlayersCountExceptGMs() const;
        bool ActiveObjectsNearGrid(uint32 x,uint32 y) const;

        // Send a Packet to all players in the map
        void SendToPlayers(WorldPacket const* data, Team team = TEAM_NONE) const;
        void SendDefenseMessage(int32 textId, uint32 zoneId) const;
        void SendMonsterTextToMap(int32 textId, Language language, ChatMsg chatMsg, uint32 creatureId, WorldObject const* pSource = nullptr, Unit const* pTarget = nullptr);

        // Send a Packet to all players in a zone
        bool SendToPlayersInZone(WorldPacket const* data, uint32 zoneId) const; // return false if no player found
        void PlayDirectSoundToMap(uint32 soundId, uint32 zoneId = 0) const;
        
        typedef MapRefManager PlayerList;
        PlayerList const& GetPlayers() const { return m_mapRefManager; }

        ScriptedEvent* GetScriptedMapEvent(uint32 id)
        {
            auto itr = m_mScriptedEvents.find(id);
            if (itr != m_mScriptedEvents.end())
                return &itr->second;
            return nullptr;
        }

        ScriptedEvent const* GetScriptedMapEvent(uint32 id) const
        {
            auto itr = m_mScriptedEvents.find(id);
            if (itr != m_mScriptedEvents.end())
                return &itr->second;
            return nullptr;
        }

        ScriptedEvent* StartScriptedEvent(uint32 id, WorldObject* source, WorldObject* target, uint32 timelimit, uint32 failureCondition, uint32 failureScript, uint32 successCondition, uint32 successScript);

        // Adds all commands that are part of the provided script id to the queue.
        void ScriptsStart(std::map<uint32, std::multimap<uint32, ScriptInfo> > const& scripts, uint32 id, ObjectGuid sourceGuid, ObjectGuid targetGuid);
        // Adds the provided command to the queue. Will be handled by ScriptsProcess.
        void ScriptCommandStart(ScriptInfo const& script, uint32 delay, ObjectGuid sourceGuid, ObjectGuid targetGuid);
        // Immediately executes the provided command.
        bool ScriptCommandStartDirect(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        // Removes all parts of script from the queue.
        void TerminateScript(ScriptAction const& step);

        // must called with AddToWorld
        void AddToActive(WorldObject* obj);
        // must called with RemoveFromWorld
        void RemoveFromActive(WorldObject* obj);

        void SetSummonLimitForObject(uint64 guid, uint32 limit);
        uint32 GetSummonLimitForObject(uint64 guid) const;
        uint32 GetSummonCountForObject(uint64 guid) const;
        void IncrementSummonCountForObject(uint64 guid);
        void DecrementSummonCountForObject(uint64 guid);
        Creature* SummonCreature(uint32 entry, float x, float y, float z, float ang, TempSummonType spwtype = TEMPSUMMON_DEAD_DESPAWN, uint32 despwtime = 25000, bool asActiveObject = false);
        Creature* LoadCreatureSpawn(uint32 dbGuid, bool delaySpawn = false);
        Creature* LoadCreatureSpawnWithGroup(uint32 leaderDbGuid, bool delaySpawn = false);

        Player* GetPlayer(ObjectGuid guid);
        GameObject* GetGameObject(ObjectGuid const& guid) { return GetObject<GameObject>(guid); }
        Creature* GetCreature(ObjectGuid const& guid) { return GetObject<Creature>(guid); }
        Pet* GetPet(ObjectGuid const& guid) { return GetObject<Pet>(guid); }
        Creature* GetAnyTypeCreature(ObjectGuid guid);      // normal creature or pet
        GenericTransport* GetTransport(ObjectGuid guid);
        ElevatorTransport* GetElevatorTransport(ObjectGuid);
        DynamicObject* GetDynamicObject(ObjectGuid guid) { return GetObject<DynamicObject>(guid); }
        Corpse* GetCorpse(ObjectGuid guid);                   // !!! find corpse can be not in world
        Unit* GetUnit(ObjectGuid guid);                       // only use if sure that need objects at current map, specially for player case
        WorldObject* GetWorldObject(ObjectGuid guid);         // only use if sure that need objects at current map, specially for player case
        WorldObject* GetWorldObjectOrPlayer(ObjectGuid guid); // Returns a world object from current map, or player anywhere.

        template <typename T> void InsertObject(ObjectGuid const& guid, T* ptr)
        {
            std::lock_guard<std::shared_timed_mutex> lock(m_objectsStore_lock);
            m_objectsStore.insert<T>(guid, ptr);
        }
        template <typename T> void EraseObject(ObjectGuid const& guid)
        {
            std::lock_guard<std::shared_timed_mutex> lock(m_objectsStore_lock);
            m_objectsStore.erase<T>(guid, (T*)nullptr);
        }
        template <typename T> T* GetObject(ObjectGuid const& guid)
        {
            std::shared_lock<std::shared_timed_mutex> lock(m_objectsStore_lock);
            return m_objectsStore.find<T>(guid, (T*)nullptr);
        }
        void AddUpdateObject(Object *obj);

        void RemoveUpdateObject(Object *obj);
        // May be called from a different map ...
        void AddRelocatedUnit(Unit* obj);
        void RemoveRelocatedUnit(Unit* obj);

        void AddUnitToMovementUpdate(Unit* unit);
        void RemoveUnitFromMovementUpdate(Unit* unit);
        // DynObjects currently
        uint32 GenerateLocalLowGuid(HighGuid guidhigh);

        //get corresponding TerrainData object for this particular map
        TerrainInfo const* GetTerrain() const { return m_TerrainData; }

        void CreateInstanceData(bool load);
        InstanceData* GetInstanceData() { return i_data; }
        InstanceData const* GetInstanceData() const { return i_data; }
        uint32 GetScriptId() const { return i_script_id; }
        
        // GameObjectCollision
        float GetHeight(float x, float y, float z, bool vmap = true, float maxSearchDist = DEFAULT_HEIGHT_SEARCH) const;
        bool isInLineOfSight(float x1, float y1, float z1, float x2, float y2, float z2, bool checkDynLos = true, bool ignoreM2Model = true) const;
        // First collision with object
        bool GetLosHitPosition(float srcX, float srcY, float srcZ, float& destX, float& destY, float& destZ, float modifyDist) const;
        // Use navemesh to walk
        bool GetWalkHitPosition(GenericTransport* t, float srcX, float srcY, float srcZ, float& destX, float& destY, float& destZ, 
            uint32 moveAllowedFlags = 0xF /*NAV_GROUND | NAV_WATER | NAV_MAGMA | NAV_SLIME*/, float zSearchDist = 20.0f, bool locatedOnSteepSlope = true) const;
        bool GetWalkRandomPosition(GenericTransport* t, float &x, float &y, float &z, float maxRadius, uint32 moveAllowedFlags = 0xF) const;
        bool GetSwimRandomPosition(float& x, float& y, float& z, float radius, GridMapLiquidData& liquid_status, bool randomRange = true) const;
        VMAP::ModelInstance* FindCollisionModel(float x1, float y1, float z1, float x2, float y2, float z2);
        GameObjectModel const* FindDynamicObjectCollisionModel(float x1, float y1, float z1, float x2, float y2, float z2);

        void Balance() { _dynamicTree.balance(); }
        void RemoveGameObjectModel(const GameObjectModel& model);
        void InsertGameObjectModel(const GameObjectModel& model);
        bool ContainsGameObjectModel(const GameObjectModel& model) const;
        bool GetDynamicObjectHitPos(Vector3 start, Vector3 end, Vector3& out, float finalDistMod) const;
        float GetDynamicTreeHeight(float x, float y, float z, float maxSearchDist) const;
        bool CheckDynamicTreeLoS(float x1, float y1, float z1, float x2, float y2, float z2, bool ignoreM2Model) const;
        bool IsUnloading() const { return m_unloading; }
        void MarkAsCrashed() { m_crashed = true; }
        bool IsCrashed() const { return m_crashed; }
        void CrashUnload();
        bool IsUpdateFinished() const { return m_updateFinished; }
        void MarkNotUpdated() { m_updateFinished = false; }
        void SetUpdateDiffMod(int32 d) { m_updateDiffMod = d; }
        uint32 GetUpdateDiffMod() const { return m_updateDiffMod; }
        TimePoint GetCurrentClockTime() const { return m_currentTime; }
        void BindToInstanceOrRaid(Player* player, time_t objectResetTime, bool permBindToRaid);

        // WeatherSystem
        WeatherSystem* GetWeatherSystem() const { return m_weatherSystem; }
        /** Set the weather in a zone on this map
         * @param zoneId set the weather for which zone
         * @param type What weather to set
         * @param grade how strong the weather should be
         * @param permanently set the weather permanently?
         */
        void SetWeather(uint32 zoneId, WeatherType type, float grade, bool permanently);

        // Get Holder for Creature Linking
        CreatureLinkingHolder* GetCreatureLinkingHolder() { return &m_creatureLinkingHolder; }

        // Teleport all players in that map to choosed location
        void TeleportAllPlayersTo(TeleportLocation loc);

        void AddCorpseToRemove(Corpse* corpse, ObjectGuid looter_guid);
        GameObject* SummonGameObject(uint32 entry, float x, float y, float z, float ang, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime, uint32 worldMask);

        bool ShouldUpdateMap(uint32 now, uint32 inactiveTimeLimit);
        void RemoveBones(Corpse* corpse);

    private:
        void LoadMapAndVMap(int gx, int gy);

        void SetTimer(uint32 t) { i_gridExpiry = t < MIN_GRID_DELAY ? MIN_GRID_DELAY : t; }

        static void SendInitSelf(Player* player);

        void SendInitTransports(Player* player);
        void SendRemoveTransports(Player* player);

        bool CreatureCellRelocation(Creature* creature, Cell const& new_cell);

        bool loaded(GridPair const&) const;
        void EnsureGridCreated(GridPair const&);
        bool EnsureGridLoaded(Cell const&);
        void EnsureGridLoadedAtEnter(Cell const&, Player* player = nullptr);

        void buildNGridLinkage(NGridType* pNGridType) { pNGridType->link(this); }

        template<class T> void AddType(T* obj);
        template<class T> void RemoveType(T* obj, bool);

        NGridType* getNGrid(uint32 x, uint32 y) const
        {
            MANGOS_ASSERT(x < MAX_NUMBER_OF_GRIDS);
            MANGOS_ASSERT(y < MAX_NUMBER_OF_GRIDS);
            return i_grids[x][y];
        }

        void setNGrid(NGridType* grid, uint32 x, uint32 y);
        void ScriptsProcess();
        bool FindScriptInitialTargets(WorldObject*& source, WorldObject*& target, ScriptAction const& step);
        bool FindScriptFinalTargets(WorldObject*& source, WorldObject*& target, ScriptInfo const& step);

        void SendObjectUpdates();
        void UpdateVisibilityForRelocations();

        bool                    _processingSendObjUpdates = false;
        uint32                  _objUpdatesThreads = 0;
        mutable std::mutex      i_objectsToClientUpdate_lock;
        std::unordered_set<Object *> i_objectsToClientUpdate;

        bool                    _processingUnitsRelocation = false;
        uint32                  _unitRelocationThreads = 0;
        mutable std::mutex      i_unitsRelocated_lock;
        std::unordered_set<Unit* > i_unitsRelocated;

        mutable std::mutex      unitsMvtUpdate_lock;
        std::unordered_set<Unit*> unitsMvtUpdate;

        mutable MapMutexType    _corpseRemovalLock;
        typedef std::list<std::pair<Corpse*, ObjectGuid>> CorpseRemoveList;
        CorpseRemoveList        _corpseToRemove;

        MapMutexType            _bonesLock;
        uint32                  _bonesCleanupTimer;
        std::list<Corpse*>      _bones;

        void RemoveCorpses(bool unload = false);
        void RemoveOldBones(uint32 const diff);

        std::unique_ptr<ThreadPool> m_objectThreads;
        std::unique_ptr<ThreadPool> m_motionThreads;
        std::unique_ptr<ThreadPool> m_visibilityThreads;
        std::unique_ptr<ThreadPool> m_cellThreads;

    protected:
        MapEntry const* i_mapEntry;
        uint32 i_id;
        uint32 i_InstanceId;
        uint32 m_unloadTimer = 0;
        float m_VisibleDistance;
        float m_GridActivationDistance;

        mutable std::shared_timed_mutex   _dynamicTree_lock;
        DynamicMapTree _dynamicTree;

        MapPersistentState* m_persistentState = nullptr;

        MapRefManager m_mapRefManager;
        MapRefManager::iterator m_mapRefIter;

        typedef std::set<WorldObject*> ActiveNonPlayers;
        ActiveNonPlayers m_activeNonPlayers;
        ActiveNonPlayers::iterator m_activeNonPlayersIter;

        typedef TypeUnorderedMapContainer<AllMapStoredObjectTypes, ObjectGuid> MapStoredObjectTypesContainer;
        mutable std::shared_timed_mutex         m_objectsStore_lock;
        MapStoredObjectTypesContainer   m_objectsStore;

        // Objects that must update even in inactive grids without activating them
        typedef std::set<GenericTransport*> TransportsContainer;
        TransportsContainer m_transports;
        TransportsContainer::iterator m_transportsUpdateIter;
        bool m_unloading = false;
        bool m_crashed = false;
        bool m_updateFinished = false;
        uint32 m_updateDiffMod;
        TimePoint m_currentTime;
        uint32 m_lastMvtSpellsUpdate = 0;
    private:
        time_t m_createTime; // time when map was created
        time_t i_gridExpiry;

        NGridType* i_grids[MAX_NUMBER_OF_GRIDS][MAX_NUMBER_OF_GRIDS];

        //Shared geodata object with map coord info...
        TerrainInfo * const m_TerrainData;
        bool m_bLoadedGrids[MAX_NUMBER_OF_GRIDS][MAX_NUMBER_OF_GRIDS];

        std::bitset<TOTAL_NUMBER_OF_CELLS_PER_MAP*TOTAL_NUMBER_OF_CELLS_PER_MAP> marked_cells;

        mutable std::mutex      i_objectsToRemove_lock;
        std::set<WorldObject *> i_objectsToRemove;

        typedef std::multimap<time_t, ScriptAction> ScriptScheduleMap;
        mutable MapMutexType      m_scriptSchedule_lock;
        ScriptScheduleMap m_scriptSchedule;

        InstanceData* i_data = nullptr;
        uint32 i_script_id = 0;

        // Map local low guid counters
        mutable std::mutex m_guidGenerators_lock;
        ObjectGuidGenerator<HIGHGUID_UNIT> m_CreatureGuids;
        ObjectGuidGenerator<HIGHGUID_GAMEOBJECT> m_GameObjectGuids;
        ObjectGuidGenerator<HIGHGUID_TRANSPORT> m_transportGuids;
        ObjectGuidGenerator<HIGHGUID_DYNAMICOBJECT> m_DynObjectGuids;
        ObjectGuidGenerator<HIGHGUID_PET> m_PetGuids;

        // Type specific code for add/remove to/from grid
        template<class T>
            void AddToGrid(T*, NGridType*, Cell const&);

        template<class T>
            void RemoveFromGrid(T*, NGridType*, Cell const&);

        // Custom
        uint32 _lastMapUpdate = 0;
        uint32 _lastPlayerLeftTime = 0;
        uint32 _lastPlayersUpdate;
        uint32 _inactivePlayersSkippedUpdates = 0;
        uint32 _lastCellsUpdate;

        int8 _updateIdx;

        // Elevators are not loaded normally.
        void LoadElevatorTransports();

        // Holder for information about linked mobs
        CreatureLinkingHolder m_creatureLinkingHolder;

        // WeatherSystem
        WeatherSystem* m_weatherSystem;

        // Creature summon limit
        std::unordered_map<uint64, uint32> m_mCreatureSummonLimit;
        std::unordered_map<uint64, uint32> m_mCreatureSummonCount;

        // Scripted Map Events
        std::map<uint32, ScriptedEvent> m_mScriptedEvents;
        void UpdateScriptedEvents();
        uint32 m_uiScriptedEventsTimer;

        // Functions to handle all db script commands.
        bool ScriptCommand_Talk(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_Emote(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_FieldSet(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_MoveTo(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_ModifyFlags(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_InterruptCasts(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_TeleportTo(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_QuestExplored(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_KillCredit(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RespawnGameObject(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SummonCreature(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_OpenDoor(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_CloseDoor(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_ActivateGameObject(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RemoveAura(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_CastSpell(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_PlaySound(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_CreateItem(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_DespawnCreature(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetEquipment(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetMovementType(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetActiveObject(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetFaction(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_Morph(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_Mount(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetRun(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_AttackStart(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_UpdateEntry(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetStandState(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_ModifyThreat(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SendTaxiPath(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_TerminateScript(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_TerminateCondition(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_Evade(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetHomePosition(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_TurnTo(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_MeetingStone(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetData(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetData64(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_StartScript(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RemoveItem(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RemoveGameObject(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetMeleeAttack(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetCombatMovement(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetPhase(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetPhaseRandom(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetPhaseRange(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_Flee(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_DealDamage(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_ZoneCombatPulse(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_CallForHelp(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetSheath(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_Invincibility(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_GameEvent(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_ServerVariable(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_CreatureSpells(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RemoveGuardians(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_AddSpellCooldown(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RemoveSpellCooldown(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetReactState(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_StartWaypoints(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_StartMapEvent(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_EndMapEvent(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_AddMapEventTarget(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RemoveMapEventTarget(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetMapEventData(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SendMapEvent(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetDefaultMovement(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_StartScriptForAll(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_EditMapEvent(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_FailQuest(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_RespawnCreature(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_AssistUnit(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_CombatStop(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_AddAura(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_AddThreat(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SummonObject(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetFly(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_JoinCreatureGroup(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_LeaveCreatureGroup(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetGoState(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_DespawnGameObject(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_LoadGameObject(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_QuestCredit(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetGossipMenu(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SendScriptEvent(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetPvP(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_ResetDoorOrButton(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_SetCommandState(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_PlayCustomAnim(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_StartScriptOnGroup(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_LoadCreatureSpawn(ScriptInfo const& script, WorldObject* source, WorldObject* target);
        bool ScriptCommand_StartScriptOnZone(ScriptInfo const& script, WorldObject* source, WorldObject* target);

        // Add any new script command functions to the array.
        ScriptCommandFunction const m_ScriptCommands[SCRIPT_COMMAND_MAX] =
        {
            &Map::ScriptCommand_Talk,                   // 0
            &Map::ScriptCommand_Emote,                  // 1
            &Map::ScriptCommand_FieldSet,               // 2
            &Map::ScriptCommand_MoveTo,                 // 3
            &Map::ScriptCommand_ModifyFlags,            // 4
            &Map::ScriptCommand_InterruptCasts,         // 5
            &Map::ScriptCommand_TeleportTo,             // 6
            &Map::ScriptCommand_QuestExplored,          // 7
            &Map::ScriptCommand_KillCredit,             // 8
            &Map::ScriptCommand_RespawnGameObject,      // 9
            &Map::ScriptCommand_SummonCreature,         // 10
            &Map::ScriptCommand_OpenDoor,               // 11
            &Map::ScriptCommand_CloseDoor,              // 12
            &Map::ScriptCommand_ActivateGameObject,     // 13
            &Map::ScriptCommand_RemoveAura,             // 14
            &Map::ScriptCommand_CastSpell,              // 15
            &Map::ScriptCommand_PlaySound,              // 16
            &Map::ScriptCommand_CreateItem,             // 17
            &Map::ScriptCommand_DespawnCreature,        // 18
            &Map::ScriptCommand_SetEquipment,           // 19
            &Map::ScriptCommand_SetMovementType,        // 20
            &Map::ScriptCommand_SetActiveObject,        // 21
            &Map::ScriptCommand_SetFaction,             // 22
            &Map::ScriptCommand_Morph,                  // 23
            &Map::ScriptCommand_Mount,                  // 24
            &Map::ScriptCommand_SetRun,                 // 25
            &Map::ScriptCommand_AttackStart,            // 26
            &Map::ScriptCommand_UpdateEntry,            // 27
            &Map::ScriptCommand_SetStandState,          // 28
            &Map::ScriptCommand_ModifyThreat,           // 29
            &Map::ScriptCommand_SendTaxiPath,           // 30
            &Map::ScriptCommand_TerminateScript,        // 31
            &Map::ScriptCommand_TerminateCondition,     // 32
            &Map::ScriptCommand_Evade,                  // 33
            &Map::ScriptCommand_SetHomePosition,        // 34
            &Map::ScriptCommand_TurnTo,                 // 35
            &Map::ScriptCommand_MeetingStone,           // 36
            &Map::ScriptCommand_SetData,                // 37
            &Map::ScriptCommand_SetData64,              // 38
            &Map::ScriptCommand_StartScript,            // 39
            &Map::ScriptCommand_RemoveItem,             // 40
            &Map::ScriptCommand_RemoveGameObject,       // 41
            &Map::ScriptCommand_SetMeleeAttack,         // 42
            &Map::ScriptCommand_SetCombatMovement,      // 43
            &Map::ScriptCommand_SetPhase,               // 44
            &Map::ScriptCommand_SetPhaseRandom,         // 45
            &Map::ScriptCommand_SetPhaseRange,          // 46
            &Map::ScriptCommand_Flee,                   // 47
            &Map::ScriptCommand_DealDamage,             // 48
            &Map::ScriptCommand_ZoneCombatPulse,        // 49
            &Map::ScriptCommand_CallForHelp,            // 50
            &Map::ScriptCommand_SetSheath,              // 51
            &Map::ScriptCommand_Invincibility,          // 52
            &Map::ScriptCommand_GameEvent,              // 53
            &Map::ScriptCommand_ServerVariable,         // 54
            &Map::ScriptCommand_CreatureSpells,         // 55
            &Map::ScriptCommand_RemoveGuardians,        // 56
            &Map::ScriptCommand_AddSpellCooldown,       // 57
            &Map::ScriptCommand_RemoveSpellCooldown,    // 58
            &Map::ScriptCommand_SetReactState,          // 59
            &Map::ScriptCommand_StartWaypoints,         // 60
            &Map::ScriptCommand_StartMapEvent,          // 61
            &Map::ScriptCommand_EndMapEvent,            // 62
            &Map::ScriptCommand_AddMapEventTarget,      // 63
            &Map::ScriptCommand_RemoveMapEventTarget,   // 64
            &Map::ScriptCommand_SetMapEventData,        // 65
            &Map::ScriptCommand_SendMapEvent,           // 66
            &Map::ScriptCommand_SetDefaultMovement,     // 67
            &Map::ScriptCommand_StartScriptForAll,      // 68
            &Map::ScriptCommand_EditMapEvent,           // 69
            &Map::ScriptCommand_FailQuest,              // 70
            &Map::ScriptCommand_RespawnCreature,        // 71
            &Map::ScriptCommand_AssistUnit,             // 72
            &Map::ScriptCommand_CombatStop,             // 73
            &Map::ScriptCommand_AddAura,                // 74
            &Map::ScriptCommand_AddThreat,              // 75
            &Map::ScriptCommand_SummonObject,           // 76
            &Map::ScriptCommand_SetFly,                 // 77
            &Map::ScriptCommand_JoinCreatureGroup,      // 78
            &Map::ScriptCommand_LeaveCreatureGroup,     // 79
            &Map::ScriptCommand_SetGoState,             // 80
            &Map::ScriptCommand_DespawnGameObject,      // 81
            &Map::ScriptCommand_LoadGameObject,         // 82
            &Map::ScriptCommand_QuestCredit,            // 83
            &Map::ScriptCommand_SetGossipMenu,          // 84
            &Map::ScriptCommand_SendScriptEvent,        // 85
            &Map::ScriptCommand_SetPvP,                 // 86
            &Map::ScriptCommand_ResetDoorOrButton,      // 87
            &Map::ScriptCommand_SetCommandState,        // 88
            &Map::ScriptCommand_PlayCustomAnim,         // 89
            &Map::ScriptCommand_StartScriptOnGroup,     // 90
            &Map::ScriptCommand_LoadCreatureSpawn,      // 91
            &Map::ScriptCommand_StartScriptOnZone,      // 92
        };

    public:
        CreatureGroupHolderType CreatureGroupHolder;
        uint32 GetLastPlayerLeftTime() const { return _lastPlayerLeftTime; }
};

class WorldMap : public Map
{
    using Map::GetPersistentState;                      // hide in subclass for overwrite

    public:
        WorldMap(uint32 id, time_t expiry, uint32 instance = 0) : Map(id, expiry, instance) {}
        ~WorldMap() override {}

        // can't be nullptr for loaded map
        WorldPersistentState* GetPersistanceState() const;
};

class DungeonMap : public Map
{
    using Map::GetPersistentState;                      // hide in subclass for overwrite

    public:
        DungeonMap(uint32 id, time_t, uint32 InstanceId);
        ~DungeonMap() override;
        bool Add(Player*) override;
        void Remove(Player*, bool) override;
        void Update(uint32) override;
        bool Reset(InstanceResetMethod method);
        void PermBindAllPlayers(Player* player);
        void UnloadAll(bool pForce) override;
        bool CanEnter(Player* player) override;
        void SendResetWarnings(uint32 timeLeft) const;
        void SetResetSchedule(bool on);
        uint32 GetMaxPlayers() const;

        // can't be nullptr for loaded map
        DungeonPersistentState* GetPersistanceState() const;
        void BindPlayerOrGroupOnEnter(Player* player);

        void InitVisibilityDistance() override;
        // Activated at raid expiration. No one can enter.
        bool IsUnloadingBeforeReset() const { return m_resetAfterUnload; }
    private:
        bool m_resetAfterUnload;
        bool m_unloadWhenEmpty;
};

class BattleGroundMap : public Map
{
    using Map::GetPersistentState;                      // hide in subclass for overwrite

    public:
        BattleGroundMap(uint32 id, time_t, uint32 InstanceId);
        ~BattleGroundMap() override;

        void Update(uint32) override;
        bool Add(Player*) override;
        void Remove(Player*, bool) override;
        bool CanEnter(Player* player) override;
        void SetUnload();
        void UnloadAll(bool pForce) override;

        void InitVisibilityDistance() override;
        BattleGround* GetBG() const { return m_bg; }
        void SetBG(BattleGround* bg) { m_bg = bg; }

        // can't be nullptr for loaded map
        BattleGroundPersistentState* GetPersistanceState() const;

    private:
        BattleGround* m_bg;
};

template<class T, class CONTAINER>
void Map::Visit(Cell const& cell, TypeContainerVisitor<T, CONTAINER>& visitor)
{
    uint32 const x = cell.GridX();
    uint32 const y = cell.GridY();
    uint32 const cell_x = cell.CellX();
    uint32 const cell_y = cell.CellY();

    if (!cell.NoCreate())
        EnsureGridLoaded(cell);

    NGridType* grid = getNGrid(x, y);
    if (grid && grid->isGridObjectDataLoaded())
        grid->Visit(cell_x, cell_y, visitor);
}
#endif
