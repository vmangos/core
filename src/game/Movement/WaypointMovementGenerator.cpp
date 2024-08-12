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

#include <ctime>

#include "WaypointMovementGenerator.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "WaypointManager.h"
#include "WorldPacket.h"
#include "ScriptMgr.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "CreatureGroups.h"
#include "Map.h"

#include <cassert>

//-----------------------------------------------//
void WaypointMovementGenerator<Creature>::LoadPath(uint32 guid, uint32 entry, WaypointPathOrigin wpOrigin)
{
    DETAIL_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "LoadPath: loading waypoint path for GUID %u Entry %u", guid, entry);

    if (wpOrigin == PATH_NO_PATH)
        i_path = sWaypointMgr.GetDefaultPath(entry, guid, &m_PathOrigin);
    else
    {
        m_PathOrigin = wpOrigin == PATH_NO_PATH ? PATH_FROM_ENTRY : wpOrigin;
        i_path = sWaypointMgr.GetPathFromOrigin(entry, guid, 0, m_PathOrigin);
    }

    // No movement found for entry nor guid
    if (!i_path)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "WaypointMovementGenerator::LoadPath: GUID %u Entry %u doesn't have waypoint path", guid, entry);
        return;
    }

    if (i_path->empty())
    {
        return;
    }
    // Initialize the i_currentNode to point to the first node
    i_currentNode = i_path->begin()->first;
    m_lastReachedWaypoint = 0;
}

void WaypointMovementGenerator<Creature>::Initialize(Creature &creature)
{
    creature.AddUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
}

void WaypointMovementGenerator<Creature>::InitializeWaypointPath(Creature& creature, uint32 startPoint, WaypointPathOrigin wpSource, uint32 initialDelay, uint32 overwriteGuid, uint32 overwriteEntry, bool repeat)
{
    m_isWandering = false;
    m_repeating = repeat;

    if (!overwriteGuid)
        overwriteGuid = creature.GetGUIDLow();
    if (!overwriteEntry)
        overwriteEntry = creature.GetEntry();

    LoadPath(overwriteGuid, overwriteEntry, wpSource);

    if (startPoint)
    {
        if (i_path && !i_path->empty() && (i_path->find(startPoint) != i_path->end()))
        {
            i_currentNode = startPoint;
            m_lastReachedWaypoint = startPoint - 1;
        }
        else
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WaypointMovementGenerator::InitializeWaypointPath: %s tries to start movement from invalid point id %u", creature.GetGuidStr().c_str(), startPoint);
    }

    i_nextMoveTime.Reset(initialDelay);
    // Start moving if possible
    StartMove(creature);
}

void WaypointMovementGenerator<Creature>::Finalize(Creature &creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}

void WaypointMovementGenerator<Creature>::Interrupt(Creature &creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}

void WaypointMovementGenerator<Creature>::Reset(Creature &creature)
{
    creature.AddUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);

    if (m_isWandering)
    {
        // prevent a crash at empty waypoint path.
        if (!i_path || i_path->empty())
            return;

        const WaypointNode& node = i_path->at(m_lastReachedWaypoint);
        float const speed = creature.GetDistance(node.x, node.y, node.z) / (1000 * 0.001f);
        creature.MonsterMoveWithSpeed(node.x, node.y, node.z, node.orientation, speed, MOVE_FORCE_DESTINATION);
    }
    else
    {
        StartMoveNow(creature);
    }
}

bool WaypointMovementGenerator<Creature>::OnArrived(Creature& creature)
{
    if (!i_path || i_path->empty())
        return false;

    if (m_isWandering)
    {
        m_isWandering = false;
        Stop(1000);
        return false;
    }

    m_lastReachedWaypoint = i_currentNode;

    if (m_isArrivalDone)
        return true;

    creature.ClearUnitState(UNIT_STAT_ROAMING_MOVE);
    m_isArrivalDone = true;

    WaypointPath::const_iterator currPoint = i_path->find(i_currentNode);
    MANGOS_ASSERT(currPoint != i_path->end());
    WaypointNode const& node = currPoint->second;

    if (node.script_id)
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Creature movement start script %u at point %u for %s.", node.script_id, i_currentNode, creature.GetGuidStr().c_str());
        creature.GetMap()->ScriptsStart(sCreatureMovementScripts, node.script_id, creature.GetObjectGuid(), creature.GetObjectGuid());
    }

    // Inform script
    if (creature.AI())
        creature.AI()->MovementInform(WAYPOINT_MOTION_TYPE, i_currentNode);

    // Save last reached point in group in case of leader change
    if (CreatureGroup* pGroup = creature.GetCreatureGroup())
        if (pGroup->GetLeaderGuid() == creature.GetObjectGuid())
            pGroup->SetLastReachedWaypoint(m_lastReachedWaypoint);

    // Wait delay ms
    if (node.delay)
    {
        if (node.wander_distance)
        {
            m_isWandering = true;
            creature.GetMotionMaster()->MoveRandom(true, node.wander_distance, node.delay);
        }
        else
            Stop(node.delay);

        return false;
    }

    return true;
}

void WaypointMovementGenerator<Creature>::StartMove(Creature &creature)
{
    if (!i_path || i_path->empty())
        return;

    if (Stopped())
        return;

    WaypointPath::const_iterator currPoint = i_path->find(i_currentNode);
    MANGOS_ASSERT(currPoint != i_path->end());

    if (m_isArrivalDone)
    {
        bool reachedLast = false;
        ++currPoint;
        if (currPoint == i_path->end())
        {
            reachedLast = true;

            if (!m_repeating)
            {
                creature.SetHomePosition(i_path->at(i_currentNode).x, i_path->at(i_currentNode).y, i_path->at(i_currentNode).z, i_path->at(i_currentNode).orientation);
                creature.GetMotionMaster()->Initialize();
                return;
            }

            currPoint = i_path->begin();
        }

        i_currentNode = currPoint->first;
    }

    m_isArrivalDone = false;
    creature.AddUnitState(UNIT_STAT_ROAMING_MOVE);

    WaypointNode const& nextNode = currPoint->second;
    Movement::MoveSplineInit init(creature, "WaypointMovementGenerator<Creature>::StartMove");

    if (WaypointPath const* pSubpath = (nextNode.path_id ? sWaypointMgr.GetPathFromOrigin(nextNode.path_id, 0, 0, PATH_FROM_SPECIAL) : nullptr))
    {
        PointsArray genPath;
        genPath.resize(pSubpath->size());
        for (auto const& node : *pSubpath)
            genPath[node.first] = G3D::Vector3(node.second.x, node.second.y, node.second.z);

        if (creature.CanFly())
            init.SetFly();

        init.MovebyPath(genPath);
    }
    else
        init.MoveTo(nextNode.x, nextNode.y, nextNode.z, (m_PathOrigin == PATH_FROM_SPECIAL) ? MOVE_STRAIGHT_PATH : MOVE_PATHFINDING);

    if (nextNode.orientation != 100 && nextNode.delay != 0)
        init.SetFacing(nextNode.orientation);

    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING) && !creature.IsLevitating(), false);
    init.Launch();
}

bool WaypointMovementGenerator<Creature>::Update(Creature &creature, uint32 const& diff)
{
    // Waypoint movement can be switched on/off
    // This is quite handy for escort quests and other stuff
    bool shouldWait = false;
    if (creature.HasUnitState(UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_DISTRACTED) || !i_path || i_path->empty())
        shouldWait = true;

    // prevent a crash at empty waypoint path.
    if (shouldWait)
    {
        creature.ClearUnitState(UNIT_STAT_ROAMING_MOVE);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    // don't stop creature movement for spells without interrupt movement flags
    if (creature.IsNoMovementSpellCasted())
    {
        if (!creature.IsStopped())
        {
            creature.StopMoving();
            i_nextMoveTime.Reset(1);
            m_isArrivalDone = false;
        }

        creature.ClearUnitState(UNIT_STAT_ROAMING_MOVE);
        return true;
    }

    if (Stopped())
    {
        if (CanMove(diff))
            StartMove(creature);
    }
    else
    {
        if (creature.IsStopped())
            Stop(STOP_TIME_FOR_PLAYER);
        else if (creature.movespline->Finalized())
        {
            if (OnArrived(creature))        // fire script events
                StartMove(creature);        // restart movement if needed
        }
    }
    return true;
}

bool WaypointMovementGenerator<Creature>::GetResetPosition(Creature&, float& x, float& y, float& z)
{
    // prevent a crash at empty waypoint path.
    if (!i_path || i_path->empty())
        return false;

    const WaypointNode& node = i_path->at(m_lastReachedWaypoint);
    x = node.x;
    y = node.y;
    z = node.z;
    return true;
}

void WaypointMovementGenerator<Creature>::GetPathInformation(std::ostringstream& oss) const
{
    oss << "WaypointMovement: Last Reached WP: " << m_lastReachedWaypoint << " ";
    oss << "(Loaded path from " << WaypointManager::GetOriginString(m_PathOrigin) << ")\n";
}

bool WaypointMovementGenerator<Creature>::SetNextWaypoint(uint32 pointId)
{
    if (!i_path || i_path->empty())
        return false;

    WaypointPath::const_iterator currPoint = i_path->find(pointId);
    if (currPoint == i_path->end())
        return false;

    // Allow Moving with next tick
    // Handle allow movement this way to not interact with PAUSED state.
    // If this function is called while PAUSED, it will move properly when unpaused.
    i_nextMoveTime.Reset(1);
    m_isArrivalDone = false;

    // Set the point
    i_currentNode = pointId;
    return true;
}

//----------------------------------------------------//
uint32 FlightPathMovementGenerator::GetPathAtMapEnd() const
{
    if (i_currentNode >= i_path->size())
        return i_path->size();

    uint32 curMapId = (*i_path)[i_currentNode].mapid;

    for (uint32 i = i_currentNode; i < i_path->size(); ++i)
    {
        if ((*i_path)[i].mapid != curMapId)
            return i;
    }

    return i_path->size();
}

void FlightPathMovementGenerator::Initialize(Player &player)
{
    Reset(player);
}

void FlightPathMovementGenerator::Finalize(Player & player)
{
    // Reset fall information to prevent fall dmg at arrive
    player.SetFallInformation(0);

    // remove flag to prevent send object build movement packets for flight state and crash (movement generator already not at top of stack)
    player.ClearUnitState(UNIT_STAT_TAXI_FLIGHT);
    player.RemoveUnitMovementFlag(MOVEFLAG_FLYING);

    player.Unmount();
    player.RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);
    player.TaxiStepFinished(!MovementInProgress());

    if (player.GetTaxi().empty())
    {
        player.GetHostileRefManager().setOnlineOfflineState(true);
        if (player.pvpInfo.inPvPEnforcedArea)
        {
            player.CastSpell(&player, 2479, true);
            if (!player.IsPvP())
                player.UpdatePvP(true, true);
        }

        // update z position to ground and orientation for landing point
        // this prevent cheating with landing  point at lags
        // when client side flight end early in comparison server side
        player.StopMoving();
        player.GetTaxi().ClearTaxiDestinations();
    }
}

void FlightPathMovementGenerator::Interrupt(Player & player)
{
    player.ClearUnitState(UNIT_STAT_TAXI_FLIGHT);
    player.RemoveUnitMovementFlag(MOVEFLAG_FLYING);
}

#define PLAYER_FLIGHT_SPEED        32.0f

void FlightPathMovementGenerator::Reset(Player & player, float modSpeed)
{
    player.GetHostileRefManager().setOnlineOfflineState(false);
    player.AddUnitState(UNIT_STAT_TAXI_FLIGHT);
    player.SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);

    Movement::MoveSplineInit init(player, "FlightPathMovementGenerator::Reset");
    uint32 end = GetPathAtMapEnd();
    for (uint32 i = GetCurrentNode(); i != end; ++i)
    {
        G3D::Vector3 vertice((*i_path)[i].x, (*i_path)[i].y, (*i_path)[i].z);
        init.Path().push_back(vertice);
    }
    init.SetFirstPointId(GetCurrentNode());
    init.SetFly();
    init.SetVelocity(modSpeed * PLAYER_FLIGHT_SPEED);
    init.Launch();
}

bool FlightPathMovementGenerator::Update(Player &player, uint32 const& /*diff*/)
{
    int32 pointId = player.movespline->currentPathIdx();
    // currentPathIdx returns lastIdx + 1 at arrive
    while (static_cast <int32>(i_currentNode) < pointId)
    {
        //DoEventIfAny(player, (*i_path)[i_currentNode], true);
        //DoEventIfAny(player, (*i_path)[i_currentNode], false);
        ++i_currentNode;
        if (MovementInProgress() && (*i_path)[i_currentNode + 1].path != (*i_path)[i_currentNode].path)
        {
            player.GetTaxi().NextTaxiDestination();
            player.ModifyMoney(-(int32)player.GetTaxi().GetCurrentTaxiCost());
        }
    }

    return MovementInProgress();
}

void FlightPathMovementGenerator::SetCurrentNodeAfterTeleport()
{
    if (i_path->empty())
        return;

    uint32 map0 = (*i_path)[0].mapid;

    for (size_t i = 1; i < i_path->size(); ++i)
    {
        if ((*i_path)[i].mapid != map0)
        {
            i_currentNode = i;
            return;
        }
    }
}

void FlightPathMovementGenerator::DoEventIfAny(Player& player, TaxiPathNodeEntry const& node, bool departure)
{
    // Code Wotlk
    /*
    if (uint32 eventid = departure ? node.departureEventID : node.arrivalEventID)
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Taxi %s event %u of node %u of path %u for player %s", departure ? "departure" : "arrival", eventid, node.index, node.path, player.GetName());

        if (!sScriptMgr.OnProcessEvent(eventid, &player, &player, departure))
            player.GetMap()->ScriptsStart(sEventScripts, eventid, &player, &player);
    }
    */
}

bool FlightPathMovementGenerator::GetResetPosition(Player&, float& x, float& y, float& z)
{
    const TaxiPathNodeEntry& node = (*i_path)[i_currentNode];
    x = node.x;
    y = node.y;
    z = node.z;
    return true;
}

// ------------------------------------------------------
// -- PATROLS SYSTEM
bool PatrolMovementGenerator::InitPatrol(Creature& creature)
{
    CreatureGroup* group = creature.GetCreatureGroup();
    if (!group || !group->IsFormation() || group->GetLeaderGuid() == creature.GetObjectGuid())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PatrolMovementGenerator] %s is not allowed for this generator.", creature.GetObjectGuid().GetString().c_str());
        return false;
    }
    std::map<ObjectGuid, CreatureGroupMember>::const_iterator it = group->GetMembers().find(creature.GetObjectGuid());
    if (it == group->GetMembers().end())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PatrolMovementGenerator] %s not found in patrol members.", creature.GetObjectGuid().GetString().c_str());
        return false;
    }
    m_leaderGuid = group->GetLeaderGuid();
    m_groupMember = it->second;
    return true;
}

void PatrolMovementGenerator::Initialize(Creature &creature)
{
    if (!creature.IsAlive())
        return;

    creature.AddUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    StartMove(creature);
}

void PatrolMovementGenerator::Reset(Creature &creature)
{
    Initialize(creature);
}

void PatrolMovementGenerator::Interrupt(Creature &creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}

void PatrolMovementGenerator::Finalize(Creature &creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}

bool PatrolMovementGenerator::Update(Creature &creature, uint32 const& diff)
{
    if (creature.HasUnitState(UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_DISTRACTED))
    {
        creature.ClearUnitState(UNIT_STAT_ROAMING_MOVE);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    // don't stop creature movement for spells without interrupt movement flags
    if (creature.IsNoMovementSpellCasted())
    {
        if (!creature.IsStopped())
            creature.StopMoving();

        creature.ClearUnitState(UNIT_STAT_ROAMING_MOVE);
        return true;
    }

    if (creature.movespline->Finalized())
        StartMove(creature);

    return true;
}

bool PatrolMovementGenerator::GetResetPosition(Creature& creature, float& x, float& y, float& z)
{
    Creature* leader = creature.GetMap()->GetCreature(m_leaderGuid);
    if (!leader)
        return false;
    m_groupMember.ComputeRelativePosition(leader->GetOrientation(), x, y);
    x += leader->GetPositionX();
    y += leader->GetPositionY();
    z = leader->GetPositionZ();
    creature.UpdateGroundPositionZ(x, y, z);
    creature.GetMap()->GetWalkHitPosition(leader->GetTransport(), leader->GetPositionX(), leader->GetPositionY(), leader->GetPositionZ(), x, y, z);
    return true;
}

void PatrolMovementGenerator::StartMove(Creature& creature)
{
    Creature* leader = creature.GetMap()->GetCreature(m_leaderGuid);
    if (!leader || leader->movespline->Finalized())
        return;

    switch (leader->GetMotionMaster()->GetCurrentMovementGeneratorType())
    {
        case RANDOM_MOTION_TYPE:
        case WAYPOINT_MOTION_TYPE:
        case HOME_MOTION_TYPE:
        case POINT_MOTION_TYPE:
            break;
        default:
            return;
    }

    // Teleport when distance is too far away instead of running through terrain.
    if (creature.GetDistance3dToCenter(leader) >= DEFAULT_VISIBILITY_DISTANCE)
    {
        creature.NearTeleportTo(leader->GetPosition());
        return;
    }

    // Calculation of the next position.
    uint32 leaderTimeBeforeNextWP = leader->movespline->timeElapsed(); // Time remaining for the leader.
    if (!leaderTimeBeforeNextWP)
        return;

    uint32 totalLeaderPoints = leader->movespline->CountSplinePoints();
    Vector3 last = leader->movespline->GetPoint(totalLeaderPoints);
    Vector3 direction = last - leader->movespline->GetPoint(totalLeaderPoints - 1);

    if (direction.isZero())
        return;

    float angle = atan2(direction.y, direction.x);
    float x, y, z;
    m_groupMember.ComputeRelativePosition(angle, x, y);
    x += last.x;
    y += last.y;
    z = last.z;
    creature.UpdateGroundPositionZ(x, y, z);
    creature.GetMap()->GetWalkHitPosition(creature.GetTransport(), last.x, last.y, last.z, x, y, z);
    creature.AddUnitState(UNIT_STAT_ROAMING_MOVE);

    PathInfo p(&creature);
    p.calculate(x, y, z, true);
    if (p.Length() < 0.2f)
        return;

    // Increased speed if late, decreased if in a rotating ...
    float speed = p.Length() / float(leaderTimeBeforeNextWP) * 1000.0f;
    if (speed > creature.GetSpeed(MOVE_RUN) * 1.3f)
        speed = creature.GetSpeed(MOVE_RUN) * 1.3f;

    Movement::MoveSplineInit init(creature, "PatrolMovementGenerator::StartMove");
    init.Move(&p);
    init.SetWalk(creature.IsWalking() && !creature.IsLevitating());
    init.SetVelocity(speed);
    init.SetFacing(angle);
    init.Launch();
}
