#ifndef _MAP_TILE_WORKER_H
#define _MAP_TILE_WORKER_H

#include "MapTree.h"
#include "ModelInstance.h"
#include "TerrainBuilder.h"
#include "IntermediateValues.h"
#include "DetourNavMeshBuilder.h"
#include "DetourCommon.h"
#include <atomic>
#include <queue>
#include <condition_variable>
#include <thread>
#include <type_traits>

#include "json.hpp"
using json = nlohmann::json;

namespace MMAP
{
    struct TileInfo
    {
        TileInfo() : m_mapId(uint32(-1)), m_tileX(), m_tileY(), m_navMeshParams(), m_curTile(0), m_tileCount(0) {}

        uint32 m_mapId;
        uint32 m_tileX;
        uint32 m_tileY;
        uint32 m_curTile;
        uint32 m_tileCount;
        dtNavMeshParams m_navMeshParams;
    };

    template <typename T>
    class ProducerConsumerQueue
    {
    private:
        std::mutex _queueLock;
        std::queue<T> _queue;
        std::condition_variable _condition;
        std::atomic<bool> _shutdown;

    public:
        ProducerConsumerQueue() : _shutdown(false) { }

        void Push(const T& value)
        {
            std::lock_guard<std::mutex> lock(_queueLock);
            _queue.push(std::move(value));
            _condition.notify_one();
        }

        bool Empty()
        {
            std::lock_guard<std::mutex> lock(_queueLock);
            return _queue.empty();
        }

        bool Pop(T& value)
        {
            std::lock_guard<std::mutex> lock(_queueLock);
            if (_queue.empty() || _shutdown)
            {
                return false;
            }
            value = _queue.front();
            _queue.pop();
            return true;
        }

        bool WaitAndPop(T& value)
        {
            std::unique_lock<std::mutex> lock(_queueLock);
            while (_queue.empty() && !_shutdown)
            {
                _condition.wait(lock);
            }
            if (_queue.empty() || _shutdown)
            {
                return false;
            }
            value = _queue.front();
            _queue.pop();
            return true;
        }

        void Cancel()
        {
            std::unique_lock<std::mutex> lock(_queueLock);
            while (!_queue.empty())
            {
                T& value = _queue.front();
                DeleteQueuedObject(value);
                _queue.pop();
            }
            _shutdown = true;
            _condition.notify_all();
        }

    private:
        template<typename E = T>
        typename std::enable_if<std::is_pointer<E>::value>::type DeleteQueuedObject(E& obj) { delete obj; }

        template<typename E = T>
        typename std::enable_if<!std::is_pointer<E>::value>::type DeleteQueuedObject(E const& /*packet*/) { }
    };


    class MapBuilder;
    class TileWorker
    {
    public:
        TileWorker(MapBuilder* mapBuilder, bool skipLiquid, bool quick, bool enableDebug, json& jsonConfig) :
            m_mapBuilder(mapBuilder),
            m_terrainBuilder(nullptr),
            m_workerThread(&TileWorker::WorkerThread, this),
            m_rcContext(nullptr),
            m_quick(quick),
            m_debug(enableDebug),
            m_config(jsonConfig)
        {
            m_terrainBuilder = new TerrainBuilder(skipLiquid, quick);
            m_rcContext = new rcContext(false);
        }

        ~TileWorker()
        {
            WaitCompletion();

            delete m_terrainBuilder;
            delete m_rcContext;
        }

        void WaitCompletion()
        {
            if (m_workerThread.joinable())
            {
                m_workerThread.join();
            }
        }

        void WorkerThread();
        bool duDumpPolyMeshToObj(rcPolyMesh& pmesh, uint32 mapID, uint32 tileY, uint32 tileX);
        bool duDumpPolyMeshDetailToObj(rcPolyMeshDetail& dmesh, uint32 mapID, uint32 tileY, uint32 tileX);
        bool shouldSkipTile(uint32 mapID, uint32 tileX, uint32 tileY);
        void buildTile(uint32 mapID, uint32 tileX, uint32 tileY, dtNavMesh* navMesh, uint32 curTile, uint32 tileCount);
        void buildMoveMapTile(uint32 mapID, uint32 tileX, uint32 tileY, MeshData& meshData, float bmin[3], float bmax[3], dtNavMesh* navMesh);

        json getDefaultConfig();
        json getMapIdConfig(uint32 mapId);
        json getTileConfig(uint32 mapId, uint32 tileX, uint32 tileY);

        MMAP::MapBuilder* m_mapBuilder;
        TerrainBuilder*   m_terrainBuilder;
        std::thread       m_workerThread;
        rcContext*        m_rcContext;
        bool              m_quick;
        bool              m_debug;
        json              m_config;
    };
}

#endif
