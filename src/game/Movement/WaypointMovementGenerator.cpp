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
#include "ObjectMgr.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "WaypointManager.h"
#include "WorldPacket.h"
#include "ScriptMgr.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "CreatureGroups.h"

#include <cassert>

//-----------------------------------------------//
void WaypointMovementGenerator<Creature>::LoadPath(Creature &creature, int32 pathId, WaypointPathOrigin wpOrigin, uint32 overwriteEntry)
{
    DETAIL_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "LoadPath: loading waypoint path for %s", creature.GetGuidStr().c_str());

    if (!overwriteEntry)
        overwriteEntry = creature.GetEntry();

    if (wpOrigin == PATH_NO_PATH && pathId == 0)
        i_path = sWaypointMgr.GetDefaultPath(overwriteEntry, creature.GetGUIDLow(), &m_PathOrigin);
    else
    {
        m_PathOrigin = wpOrigin == PATH_NO_PATH ? PATH_FROM_ENTRY : wpOrigin;
        i_path = sWaypointMgr.GetPathFromOrigin(overwriteEntry, creature.GetGUIDLow(), pathId, m_PathOrigin);
    }
    m_pathId = pathId;

    // No movement found for entry nor guid
    if (!i_path)
    {
        sLog.outErrorDb("WaypointMovementGenerator::LoadPath: %s doesn't have waypoint path %i", creature.GetGuidStr().c_str(), pathId);
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

void WaypointMovementGenerator<Creature>::InitializeWaypointPath(Creature& u, int32 id, uint32 startPoint, WaypointPathOrigin wpSource, uint32 initialDelay, uint32 overwriteEntry, bool repeat)
{
    m_isWandering = false;
    m_repeating = repeat;
    LoadPath(u, id, wpSource, overwriteEntry);

    if (startPoint)
    {
        if (i_path && !i_path->empty() && (i_path->find(startPoint) != i_path->end()))
        {
            i_currentNode = startPoint;
            m_lastReachedWaypoint = startPoint - 1;
        }
        else
            sLog.outError("WaypointMovementGenerator::InitializeWaypointPath: %s tries to start movement from invalid point id %u", u.GetGuidStr().c_str(), startPoint);
    }

    i_nextMoveTime.Reset(initialDelay);
    // Start moving if possible
    StartMove(u);
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
        creature.GetMap()->ScriptsStart(sCreatureMovementScripts, node.script_id, &creature, &creature);
    }

    // Inform script
    if (creature.AI())
    {
        uint32 type = WAYPOINT_MOTION_TYPE;
        if (m_PathOrigin == PATH_FROM_SPECIAL && m_pathId > 0)
            type = WAYPOINT_SPECIAL_REACHED + m_pathId;
        creature.AI()->MovementInform(type, i_currentNode);
    }

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

        // Inform AI
        if (creature.AI() && m_PathOrigin == PATH_FROM_SPECIAL &&  m_pathId > 0)
        {
            if (!reachedLast)
                creature.AI()->MovementInform(WAYPOINT_SPECIAL_STARTED + m_pathId, currPoint->first);
            else
                creature.AI()->MovementInform(WAYPOINT_SPECIAL_FINISHED_LAST + m_pathId, currPoint->first);

            if (creature.IsDead() || !creature.IsInWorld()) // Might have happened with above calls
                return;
        }

        i_currentNode = currPoint->first;
    }

    m_isArrivalDone = false;

    creature.AddUnitState(UNIT_STAT_ROAMING_MOVE);

    WaypointNode const& nextNode = currPoint->second;

    // will contain generated path
    PointsArray genPath;
    genPath.reserve(20);    // little optimization

    PathFinder pf(&creature);

    // compute path to next node and put it in the path
    pf.calculate(nextNode.x, nextNode.y, nextNode.z, true);
    genPath.insert(genPath.end(), pf.getPath().begin(), pf.getPath().end());

    // make sure to reset spline index as its new path
    m_nextNodeSplineIdx = -1;

    // if creature should not stop at current node reach
    if (!nextNode.delay)
    {
        // we'll add path to node after this one too to make animation more smoother
        m_nextNodeSplineIdx = genPath.size() - 1;
        auto nodeAfterItr = currPoint;
        ++nodeAfterItr;
        if (nodeAfterItr == i_path->end())
            nodeAfterItr = i_path->begin();

        auto const& nodeAfter = nodeAfterItr->second;
        Vector3 nodeAfterCoord(nodeAfter.x, nodeAfter.y, nodeAfter.z);

        // startPoint should contain current node destination that we are about to reach
        Vector3 startPoint = genPath.back();

        // we add artificially a point in the direction of next destination to avoid client making shortcut and avoiding current node destination
        Vector3 intPoint = startPoint.lerp(nodeAfterCoord, 0.1f);
        genPath.push_back(intPoint);
        creature.UpdateAllowedPositionZ(intPoint.x, intPoint.y, intPoint.z);

        // avoid computing path for near nodes
        if ((nodeAfterCoord - startPoint).squaredMagnitude() > 10)
        {
            // compute path to next node from intermediate point and add it to generated path
            pf.calculate(intPoint, nodeAfterCoord, true);
            genPath.insert(genPath.end(), pf.getPath().begin() + 1, pf.getPath().end());
        }
        else
        {
            // add only node coord as we are near enough of it
            genPath.push_back(nodeAfterCoord);
        }
    }

    // send path to client
    Movement::MoveSplineInit init(creature, "WaypointMovementGenerator<Creature>::StartMove");
    
    if (m_PathOrigin == PATH_FROM_SPECIAL)
        init.MoveTo(nextNode.x, nextNode.y, nextNode.z, MOVE_STRAIGHT_PATH);
    else
        init.MovebyPath(genPath);

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

    if (Stopped())
    {
        if (CanMove(diff))
            StartMove(creature);
    }
    else
    {
        if (creature.IsStopped())
            Stop(STOP_TIME_FOR_PLAYER);
        else if (creature.movespline->Finalized() || (m_nextNodeSplineIdx >= 0 && creature.movespline->currentPathIdx() >= m_nextNodeSplineIdx))
        {
            // we arrived to a node either by movespline finalized or node reached while creature continue to move
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
    oss << "(Loaded path " << m_pathId << " from " << WaypointManager::GetOriginString(m_PathOrigin) << ")\n";
}

void WaypointMovementGenerator<Creature>::AddToWaypointPauseTime(int32 waitTimeDiff)
{
    if (!i_nextMoveTime.Passed())
    {
        // Prevent <= 0, the code in Update requires to catch the change from moving to not moving
        int32 newWaitTime = i_nextMoveTime.GetExpiry() + waitTimeDiff;
        i_nextMoveTime.Reset(newWaitTime > 0 ? newWaitTime : 1);
    }
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
    player.SetFallInformation(0, player.GetPositionZ());

    // remove flag to prevent send object build movement packets for flight state and crash (movement generator already not at top of stack)
    player.ClearUnitState(UNIT_STAT_TAXI_FLIGHT);
    player.RemoveUnitMovementFlag(MOVEFLAG_FLYING);

    player.Unmount();
    player.RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);
    player.TaxiStepFinished();

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
        sLog.outError("[PatrolMovementGenerator] Creature is not allowed for this generator.");
        return false;
    }
    std::map<ObjectGuid, CreatureGroupMember*>::const_iterator it = group->GetMembers().find(creature.GetObjectGuid());
    if (it == group->GetMembers().end())
    {
        sLog.outError("[PatrolMovementGenerator] Creature not found in patrol members.");
        return false;
    }
    _leaderGuid = group->GetLeaderGuid();
    _groupMember = it->second;
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

    if (creature.movespline->Finalized())
        StartMove(creature);
    return true;
}

bool PatrolMovementGenerator::GetResetPosition(Creature& creature, float& x, float& y, float& z)
{
    Creature* leader = creature.GetMap()->GetCreature(_leaderGuid);
    if (!leader)
        return false;
    _groupMember->ComputeRelativePosition(leader->GetOrientation(), x, y);
    x += leader->GetPositionX();
    y += leader->GetPositionY();
    z = leader->GetPositionZ();
    creature.UpdateGroundPositionZ(x, y, z);
    creature.GetMap()->GetWalkHitPosition(leader->GetTransport(), leader->GetPositionX(), leader->GetPositionY(), leader->GetPositionZ(), x, y, z);
    return true;
}

void PatrolMovementGenerator::StartMove(Creature& creature)
{
    Creature* leader = creature.GetMap()->GetCreature(_leaderGuid);
    if (!leader || leader->movespline->Finalized())
        return;

    switch (leader->GetMotionMaster()->GetCurrentMovementGeneratorType())
    {
        case WAYPOINT_MOTION_TYPE:
        case HOME_MOTION_TYPE:
        case POINT_MOTION_TYPE:
            break;
        default:
            return;
    }
    // Calcul de la prochaine position
    uint32 leaderTimeBeforeNextWP = leader->movespline->timeElapsed(); // Temps restant pour le leader.
    if (!leaderTimeBeforeNextWP)
        return;
    uint32 totalLeaderPoints = leader->movespline->CountSplinePoints();
    Vector3 last = leader->movespline->GetPoint(totalLeaderPoints);
    Vector3 direction = last - leader->movespline->GetPoint(totalLeaderPoints - 1);
    float angle = atan2(direction.y, direction.x);
    float x, y, z;
    _groupMember->ComputeRelativePosition(angle, x, y);
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
