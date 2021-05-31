/*
 * Copyright (C) 2008-2014 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
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

#ifndef TRANSPORTS_H
#define TRANSPORTS_H

#include "GameObject.h"
#include "TransportMgr.h"
#include "MapManager.h"

struct CreatureData;

class GenericTransport : public GameObject
{
    public:
        GenericTransport();
        void CleanupsBeforeDelete() override;

        void AddPassenger(WorldObject* passenger);
        void RemovePassenger(WorldObject* passenger);

        void UpdatePosition(float x, float y, float z, float o);
        void UpdatePassengerPosition(WorldObject* object);

        typedef std::set<WorldObject*> PassengerSet;
        PassengerSet const& GetPassengers() const { return m_passengers; }

        /// This method transforms supplied transport offsets into global coordinates
        void CalculatePassengerPosition(float& x, float& y, float& z, float* o = nullptr) const
        {
            CalculatePassengerPosition(x, y, z, o, GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation());
        }

        /// This method transforms supplied global coordinates into local offsets
        void CalculatePassengerOffset(float& x, float& y, float& z, float* o = nullptr) const
        {
            CalculatePassengerOffset(x, y, z, o, GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation());
        }

        static void CalculatePassengerPosition(float& x, float& y, float& z, float* o, float transX, float transY, float transZ, float transO)
        {
            float inx = x, iny = y, inz = z;
            if (o)
                *o = MapManager::NormalizeOrientation(transO + *o);

            x = transX + inx * std::cos(transO) - iny * std::sin(transO);
            y = transY + iny * std::cos(transO) + inx * std::sin(transO);
            z = transZ + inz;
        }

        static void CalculatePassengerOffset(float& x, float& y, float& z, float* o, float transX, float transY, float transZ, float transO)
        {
            if (o)
                *o = MapManager::NormalizeOrientation(*o - transO);

            z -= transZ;
            y -= transY;    // y = searchedY * std::cos(o) + searchedX * std::sin(o)
            x -= transX;    // x = searchedX * std::cos(o) + searchedY * std::sin(o + pi)
            float inx = x, iny = y;
            y = (iny - inx * std::tan(transO)) / (std::cos(transO) + std::sin(transO) * std::tan(transO));
            x = (inx + iny * std::tan(transO)) / (std::cos(transO) + std::sin(transO) * std::tan(transO));
        }

        virtual uint32 GetPathProgress() const = 0;
    protected:
        void UpdatePassengerPositions(PassengerSet& passengers);
        PassengerSet m_passengers;
        PassengerSet::iterator m_passengerTeleportItr;
};

class ElevatorTransport : public GenericTransport
{
public:
    bool Create(uint32 guidlow, uint32 name_id, Map* map, float x, float y, float z, float ang,
        float rotation0 = 0.0f, float rotation1 = 0.0f, float rotation2 = 0.0f, float rotation3 = 0.0f, uint32 animprogress = GO_ANIMPROGRESS_DEFAULT, GOState go_state = GO_STATE_READY) override;
    void Update(uint32 update_diff, uint32 /*time_diff*/) override;

    uint32 GetPathProgress() const override;
private:
    uint32 m_pathProgress;
    TransportAnimation const* m_animationInfo;
    uint32 m_currentSeg;
};

class Transport : public GenericTransport
{
    friend Transport* TransportMgr::CreateTransport(uint32, uint32, Map*);

    Transport();
public:
    ~Transport() override;

    bool Create(uint32 guidlow, uint32 entry, uint32 mapid, float x, float y, float z, float ang, uint32 animprogress);

    void Update(uint32 update_diff, uint32 /*time_diff*/) override;

    void BuildUpdate(UpdateDataMapType& data_map);

    uint32 GetPathProgress() const override { return m_pathProgress; }
    uint32 GetPeriod() const { return GetUInt32Value(GAMEOBJECT_LEVEL); }
    void SetPeriod(uint32 period) { SetUInt32Value(GAMEOBJECT_LEVEL, period); }

    KeyFrameVec const& GetKeyFrames() const { return m_transportInfo->keyFrames; }

    TransportTemplate const* GetTransportTemplate() const { return m_transportInfo; }

    void SendOutOfRangeUpdateToMap();
    void SendCreateUpdateToMap();
private:
    void MoveToNextWaypoint();
    float CalculateSegmentPos(float perc);
    bool TeleportTransport(uint32 newMapid, float x, float y, float z, float o);
    void DoEventIfAny(KeyFrame const& node, bool departure);

    //! Helpers to know if stop frame was reached
    bool IsMoving() const { return m_isMoving; }
    void SetMoving(bool val) { m_isMoving = val; }

    TransportTemplate const* m_transportInfo;

    KeyFrameVec::const_iterator m_currentFrame;
    KeyFrameVec::const_iterator m_nextFrame;
    ShortTimeTracker m_positionChangeTimer;
    bool m_isMoving;
    bool m_pendingStop;

    uint32 m_pathProgress;
};

#endif
