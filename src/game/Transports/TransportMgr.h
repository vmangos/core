/*
 * Copyright (C) 2008-2014 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef TRANSPORTMGR_H
#define TRANSPORTMGR_H

#include <G3D/Quat.h>
#include "spline.h"
#include "DBCStores.h"

struct KeyFrame;
struct GameObjectInfo;
struct TransportTemplate;
class Transport;
class Map;

typedef Movement::Spline<double>                 TransportSpline;
typedef std::vector<KeyFrame>                    KeyFrameVec;
typedef UNORDERED_MAP<uint32, TransportTemplate> TransportTemplates;
typedef std::set<Transport*>                     TransportSet;
typedef UNORDERED_MAP<uint32, TransportSet>      TransportMap;
typedef UNORDERED_MAP<uint32, std::set<uint32> > TransportInstanceMap;

struct KeyFrame
{
    explicit KeyFrame(TaxiPathNodeEntry const& _node) : Index(0), Node(&_node), InitialOrientation(0.0f),
        DistSinceStop(-1.0f), DistUntilStop(-1.0f), DistFromPrev(-1.0f), TimeFrom(0.0f), TimeTo(0.0f),
        Teleport(false), Update(false), ArriveTime(0), DepartureTime(0), Spline(NULL), NextDistFromPrev(0.0f), NextArriveTime(0)
    {
    }

    uint32 Index;
    TaxiPathNodeEntry const* Node;
    float InitialOrientation;
    float DistSinceStop;
    float DistUntilStop;
    float DistFromPrev;
    float TimeFrom;
    float TimeTo;
    bool Teleport;
    bool Update;
    uint32 ArriveTime;
    uint32 DepartureTime;
    TransportSpline* Spline;

    // Data needed for next frame
    float NextDistFromPrev;
    uint32 NextArriveTime;

    bool IsTeleportFrame() const { return Teleport; }
    bool IsUpdateFrame() const { return Update; }
    bool IsStopFrame() const { return Node->actionFlag == 2; }
};

struct TransportTemplate
{
    TransportTemplate() : inInstance(false), pathTime(0), accelTime(0.0f), accelDist(0.0f), entry(0) { }
    ~TransportTemplate();

    std::set<uint32> mapsUsed;
    bool inInstance;
    uint32 pathTime;
    KeyFrameVec keyFrames;
    float accelTime;
    float accelDist;
    uint32 entry;
};


class TransportMgr
{
        friend void LoadDBCStores(std::string const&);

    public:
        static TransportMgr* instance()
        {
            static TransportMgr instance;
            return &instance;
        }

        void Unload();

        void LoadTransportTemplates();

        // Creates a transport using given GameObject template entry
        Transport* CreateTransport(uint32 entry, uint32 guid = 0, Map* map = NULL);

        // Spawns all continent transports, used at core startup
        void SpawnContinentTransports();

        // creates all transports for instance
        void CreateInstanceTransports(Map* map);

        TransportTemplate const* GetTransportTemplate(uint32 entry) const
        {
            TransportTemplates::const_iterator itr = _transportTemplates.find(entry);
            if (itr != _transportTemplates.end())
                return &itr->second;
            return NULL;
        }

    private:
        TransportMgr();
        ~TransportMgr();
        TransportMgr(TransportMgr const&);
        TransportMgr& operator=(TransportMgr const&);

        // Generates and precaches a path for transport to avoid generation each time transport instance is created
        void GeneratePath(GameObjectInfo const* goInfo, TransportTemplate* transport);

        // Container storing transport templates
        TransportTemplates _transportTemplates;

        // Container storing transport entries to create for instanced maps
        TransportInstanceMap _instanceTransports;
};

#define sTransportMgr TransportMgr::instance()

#endif // TRANSPORTMGR_H
