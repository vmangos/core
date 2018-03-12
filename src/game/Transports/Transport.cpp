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

#include "Common.h"
#include "Transport.h"
#include "MapManager.h"
#include "ObjectMgr.h"
#include "Path.h"
#include "ScriptMgr.h"
#include "WorldPacket.h"
#include "DBCStores.h"
#include "World.h"
#include "GameObjectAI.h"
#include "MapReference.h"
#include "Player.h"
#include "Cell.h"
#include "CellImpl.h"
#include "Totem.h"
#include "GameObjectModel.h"
#include "ObjectAccessor.h"

Transport::Transport() : GameObject(),
    _transportInfo(NULL), _isMoving(true), _pendingStop(false),
    _passengerTeleportItr(_passengers.begin()), _pathProgress(0)
{
    // the path progress is the only value that seem to matter
    m_updateFlag = UPDATEFLAG_TRANSPORT;
}

Transport::~Transport()
{
    sObjectAccessor.RemoveObject(this);
    ASSERT(_passengers.empty());
}

bool Transport::Create(uint32 guidlow, uint32 entry, uint32 mapid, float x, float y, float z, float ang, uint32 animprogress)
{
    Relocate(x, y, z, ang);

    if (!IsPositionValid())
    {
        sLog.outError("Transport (GUID: %u) not created. Suggested coordinates isn't valid (X: %f Y: %f)",
                      guidlow, x, y);
        return false;
    }

    Object::_Create(guidlow, 0, HIGHGUID_MO_TRANSPORT);

    GameObjectInfo const* goinfo = ObjectMgr::GetGameObjectInfo(entry);

    if (!goinfo)
    {
        sLog.outErrorDb("Transport not created: entry in `gameobject_template` not found, guidlow: %u map: %u  (X: %f Y: %f Z: %f) ang: %f", guidlow, mapid, x, y, z, ang);
        return false;
    }

    m_goInfo = goinfo;

    TransportTemplate const* tInfo = sTransportMgr->GetTransportTemplate(entry);
    if (!tInfo)
    {
        sLog.outErrorDb("Transport %u (name: %s) will not be created, missing `transport_template` entry.", entry, goinfo->name);
        return false;
    }

    _transportInfo = tInfo;

    // initialize waypoints
    _nextFrame = tInfo->keyFrames.begin();
    _currentFrame = _nextFrame++;

    _pathProgress = time(NULL) % (tInfo->pathTime / 1000);
    _pathProgress *= 1000;
    SetObjectScale(goinfo->size);
    SetUInt32Value(GAMEOBJECT_FACTION, goinfo->faction);
    SetUInt32Value(GAMEOBJECT_FLAGS, goinfo->flags);
    SetPeriod(tInfo->pathTime);
    SetEntry(goinfo->id);
    SetDisplayId(goinfo->displayId);
    SetGoState(GO_STATE_READY);
    SetGoType(GAMEOBJECT_TYPE_MO_TRANSPORT);
    SetGoAnimProgress(animprogress);
    SetName(goinfo->name);
    UpdateRotationFields(0.0f, 1.0f);

    sObjectAccessor.AddObject(this);
    return true;
}

void Transport::CleanupsBeforeDelete()
{
    while (!_passengers.empty())
    {
        WorldObject* obj = *_passengers.begin();
        RemovePassenger(obj);
    }

    GameObject::CleanupsBeforeDelete();
}

void Transport::Update(uint32 diff, uint32)
{
    uint32 const positionUpdateDelay = 50;

    if (AI())
        AI()->UpdateAI(diff);
    else
        AIM_Initialize();

    if (GetKeyFrames().size() <= 1)
        return;

    if (IsMoving() || !_pendingStop)
        _pathProgress = (_pathProgress + diff) % GetPeriod();

    // Set current waypoint
    // Desired outcome: _currentFrame->DepartureTime < _pathProgress < _nextFrame->ArriveTime
    // ... arrive | ... delay ... | departure
    //      event /         event /
    for (;;)
    {
        if (_pathProgress >= _currentFrame->ArriveTime && _pathProgress < _currentFrame->DepartureTime)
        {
            SetMoving(false);
            break;  // its a stop frame and we are waiting
        }

        // not waiting anymore
        SetMoving(true);

        if (_pathProgress >= _currentFrame->DepartureTime && _pathProgress < _currentFrame->NextArriveTime)
            break;  // found current waypoint

        MoveToNextWaypoint();

        DEBUG_LOG("Transport %u (%s) moved to node %u %u %f %f %f", GetEntry(), GetName(), _currentFrame->Node->index, _currentFrame->Node->mapid, _currentFrame->Node->x, _currentFrame->Node->y, _currentFrame->Node->z);

        // Departure event
        if (_currentFrame->IsTeleportFrame())
        {
            if (TeleportTransport(_nextFrame->Node->mapid, _nextFrame->Node->x, _nextFrame->Node->y, _nextFrame->Node->z, _nextFrame->InitialOrientation))
                return; // Update more in new map thread
        }
        else if (_currentFrame->IsUpdateFrame())
        {
            SendOutOfRangeUpdateToMap();
            SendCreateUpdateToMap();
        }
    }

    // Set position
    _positionChangeTimer.Update(diff);
    if (_positionChangeTimer.Passed())
    {
        _positionChangeTimer.Reset(positionUpdateDelay);
        if (IsMoving() && _pathProgress)
        {
            float t = CalculateSegmentPos(float(_pathProgress) * 0.001f);
            G3D::Vector3 pos, dir;
            _currentFrame->Spline->evaluate_percent(_currentFrame->Index, t, pos);
            _currentFrame->Spline->evaluate_derivative(_currentFrame->Index, t, dir);
            UpdatePosition(pos.x, pos.y, pos.z, atan2(dir.y, dir.x) + M_PI);
        }
    }
}

void Transport::AddPassenger(WorldObject* passenger)
{
    if (!IsInWorld())
        return;

    if (_passengers.insert(passenger).second)
    {
        DEBUG_LOG("Object %s added to transport %s.", passenger->GetName(), GetName());
        passenger->SetTransport(this);
        passenger->m_movementInfo.AddMovementFlag(MOVEFLAG_ONTRANSPORT);
        passenger->m_movementInfo.t_guid = GetObjectGuid();
        if (!passenger->m_movementInfo.t_pos.x)
        {
            passenger->m_movementInfo.t_pos.x = passenger->GetPositionX();
            passenger->m_movementInfo.t_pos.y = passenger->GetPositionY();
            passenger->m_movementInfo.t_pos.z = passenger->GetPositionZ();
            passenger->m_movementInfo.t_pos.o = passenger->GetOrientation();
            CalculatePassengerOffset(passenger->m_movementInfo.t_pos.x, passenger->m_movementInfo.t_pos.y, passenger->m_movementInfo.t_pos.z, &passenger->m_movementInfo.t_pos.o);
        }
    }
}

void Transport::RemovePassenger(WorldObject* passenger)
{
    bool erased = false;
    if (_passengerTeleportItr != _passengers.end())
    {
        PassengerSet::iterator itr = _passengers.find(passenger);
        if (itr != _passengers.end())
        {
            if (itr == _passengerTeleportItr)
                ++_passengerTeleportItr;

            _passengers.erase(itr);
            erased = true;
        }
    }
    else
        erased = _passengers.erase(passenger) > 0;

    if (erased)
    {
        passenger->SetTransport(NULL);
        passenger->m_movementInfo.ClearTransportData();
        DEBUG_LOG("Object %s removed from transport %s.", passenger->GetName(), GetName());
    }
}

void Transport::UpdatePosition(float x, float y, float z, float o)
{
    Relocate(x, y, z, o);
    UpdateModelPosition();

    UpdatePassengerPositions(_passengers);
}

void Transport::MoveToNextWaypoint()
{
    // Set frames
    _currentFrame = _nextFrame++;
    if (_nextFrame == GetKeyFrames().end())
        _nextFrame = GetKeyFrames().begin();
    if (_currentFrame == GetKeyFrames().begin())
        _pathProgress = 0;
}

float Transport::CalculateSegmentPos(float now)
{
    KeyFrame const& frame = *_currentFrame;
    const float speed = float(m_goInfo->moTransport.moveSpeed);
    const float accel = float(m_goInfo->moTransport.accelRate);
    float timeSinceStop = frame.TimeFrom + (now - (1.0f / IN_MILLISECONDS) * frame.DepartureTime);
    float timeUntilStop = frame.TimeTo - (now - (1.0f / IN_MILLISECONDS) * frame.DepartureTime);
    float segmentPos, dist;
    float accelTime = _transportInfo->accelTime;
    float accelDist = _transportInfo->accelDist;
    // calculate from nearest stop, less confusing calculation...
    if (timeSinceStop < timeUntilStop)
    {
        if (timeSinceStop < accelTime)
            dist = 0.5f * accel * timeSinceStop * timeSinceStop;
        else
            dist = accelDist + (timeSinceStop - accelTime) * speed;
        segmentPos = dist - frame.DistSinceStop;
    }
    else
    {
        if (timeUntilStop < _transportInfo->accelTime)
            dist = 0.5f * accel * timeUntilStop * timeUntilStop;
        else
            dist = accelDist + (timeUntilStop - accelTime) * speed;
        segmentPos = frame.DistUntilStop - dist;
    }

    return segmentPos / frame.NextDistFromPrev;
}

bool Transport::TeleportTransport(uint32 newMapid, float x, float y, float z, float o)
{
    Map const* oldMap = GetMap();

    uint32 newInstanceId = sMapMgr.GetContinentInstanceId(newMapid, x, y);
    SetLocationInstanceId(newInstanceId);
    Map* newMap = sMapMgr.CreateMap(newMapid, this);
    GetMap()->Remove<Transport>(this, false);
    SetMap(newMap);

    for (_passengerTeleportItr = _passengers.begin(); _passengerTeleportItr != _passengers.end();)
    {
        WorldObject* obj = (*_passengerTeleportItr++);

        float destX, destY, destZ, destO;
        destX = obj->GetTransOffsetX();
        destY = obj->GetTransOffsetY();
        destZ = obj->GetTransOffsetZ();
        destO = obj->GetTransOffsetO();
        CalculatePassengerPosition(destX, destY, destZ, &destO, x, y, z, o);

        switch (obj->GetTypeId())
        {
            case TYPEID_UNIT:
                // Units teleport on transport not implemented.
                RemovePassenger(obj);
                break;
            case TYPEID_GAMEOBJECT:
            {
                GameObject* go = obj->ToGameObject();
                go->GetMap()->Remove(go, false);
                go->Relocate(destX, destY, destZ, destO);
                go->SetMap(newMap);
                newMap->Add(go);
                break;
            }
            case TYPEID_PLAYER:
            {
                // Remove some auras to prevent undermap
                Player* player = obj->ToPlayer();
                if (!player->IsInWorld())
                {
                    RemovePassenger(player);
                    break;
                }

                if (!player->isAlive())
                    player->ResurrectPlayer(1.0f);

                player->RemoveSpellsCausingAura(SPELL_AURA_MOD_CONFUSE);
                player->RemoveSpellsCausingAura(SPELL_AURA_MOD_FEAR);
                player->CombatStopWithPets(true);

                // No need for teleport packet if no map change
                // The client still shows the correct loading screen when one is needed (Grom'Gol-Undercity)
                if (newMapid == player->GetMapId())
                {
                    player->TeleportPositionRelocation(destX, destY, destZ, destO);
                    if (newInstanceId != player->GetInstanceId())
                        sMapMgr.ScheduleInstanceSwitch(player, newInstanceId);
                }
                else
                    player->TeleportTo(newMapid, destX, destY, destZ, destO,
                        TELE_TO_NOT_LEAVE_TRANSPORT);

                break;
            }
            case TYPEID_DYNAMICOBJECT:
                obj->AddObjectToRemoveList();
                break;
            default:
                break;
        }
    }

    Relocate(x, y, z, o);
    GetMap()->Add<Transport>(this);

    return newMap != oldMap;
}

void Transport::UpdatePassengerPositions(PassengerSet& passengers)
{
    for (PassengerSet::iterator itr = passengers.begin(); itr != passengers.end(); ++itr)
        UpdatePassengerPosition(*itr);
}
void Transport::UpdatePassengerPosition(WorldObject* passenger)
{
    // transport teleported but passenger not yet (can happen for players)
    if (passenger->FindMap() != GetMap())
        return;

    // Do not use Unit::UpdatePosition here, we don't want to remove auras
    // as if regular movement occurred
    float x, y, z, o;
    x = passenger->GetTransOffsetX();
    y = passenger->GetTransOffsetY();
    z = passenger->GetTransOffsetZ();
    o = passenger->GetTransOffsetO();
    CalculatePassengerPosition(x, y, z, &o);
    if (!MaNGOS::IsValidMapCoord(x, y, z))
    {
        sLog.outError("[TRANSPORTS] Object %s [guid %u] has invalid position on transport.", passenger->GetName(), passenger->GetGUIDLow());
        return;
    }
    switch (passenger->GetTypeId())
    {
        case TYPEID_UNIT:
        {
            Creature* creature = passenger->ToCreature();
            GetMap()->CreatureRelocation(creature, x, y, z, o);
            break;
        }
        case TYPEID_PLAYER:
            //relocate only passengers in world and skip any player that might be still logging in/teleporting
            if (passenger->IsInWorld())
                GetMap()->PlayerRelocation(passenger->ToPlayer(), x, y, z, o);

            break;
        case TYPEID_GAMEOBJECT:
            //GetMap()->GameObjectRelocation(passenger->ToGameObject(), x, y, z, o, false);
            break;
        case TYPEID_DYNAMICOBJECT:
            //GetMap()->DynamicObjectRelocation(passenger->ToDynObject(), x, y, z, o);
            break;
        default:
            break;
    }
}

void Transport::DoEventIfAny(KeyFrame const& node, bool departure)
{
}

void Transport::BuildUpdate(UpdateDataMapType& data_map)
{
    Map::PlayerList const& players = GetMap()->GetPlayers();
    if (players.isEmpty())
        return;

    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
        BuildUpdateDataForPlayer(itr->getSource(), data_map);

    ClearUpdateMask(true);
}


void Transport::SendOutOfRangeUpdateToMap()
{
    Map::PlayerList const& players = GetMap()->GetPlayers();
    if (!players.isEmpty())
    {
        UpdateData data;
        BuildOutOfRangeUpdateBlock(&data);
        WorldPacket packet;
        data.BuildPacket(&packet);
        for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
            if (itr->getSource()->GetTransport() != this)
                itr->getSource()->SendDirectMessage(&packet);
    }
}

void Transport::SendCreateUpdateToMap()
{
    Map::PlayerList const& players = GetMap()->GetPlayers();
    if (!players.isEmpty())
    {
        for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
            if (itr->getSource()->GetTransport() != this)
            {
                UpdateData data;
                BuildCreateUpdateBlockForPlayer(&data, itr->getSource());
                data.Send(itr->getSource()->GetSession());
            }
    }
}