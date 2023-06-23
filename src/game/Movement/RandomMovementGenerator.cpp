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

#include "Creature.h"
#include "RandomMovementGenerator.h"
#include "Util.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"

#define MAX_RANDOM_POINTS 10

void RandomMovementGenerator::_setRandomLocation(Creature &creature)
{
    if (creature.CanFly())
    {
        //typedef std::vector<Vector3> PointsArray;
        Movement::PointsArray path;
        uint32 ptsPerCycle = ceil(i_wanderDistance * 2);
        static uint32 const nbCyclesPerPacket = 1;
        for (uint32 i = 0; i <= nbCyclesPerPacket * ptsPerCycle; ++i)
            path.push_back(Vector3(i_startPosition.x + i_wanderDistance * cos(i * 2 * M_PI / ptsPerCycle), i_startPosition.y + i_wanderDistance * sin(i * 2 * M_PI / ptsPerCycle), i_startPosition.z));
        Movement::MoveSplineInit init(creature, "RandomMovementGenerator (CanFly)");
        init.SetFly();
        init.SetWalk(false);
        init.MovebyPath(path);
        init.SetFirstPointId(1);
        init.Launch();
        i_nextMoveTime.Reset(0);
        return;
    }

    if (i_randomPoints.empty())
        return;

    G3D::Vector3 dest;
    if (i_randomPoints.size() < MAX_RANDOM_POINTS)
    {
        if (!creature.GetRandomPoint(i_startPosition.x, i_startPosition.y, i_startPosition.z, i_wanderDistance, dest.x, dest.y, dest.z))
            return;

        i_randomPoints.push_back(dest);
    }
    else
    {
        dest = SelectRandomContainerElement(i_randomPoints);
    }

    creature.AddUnitState(UNIT_STAT_ROAMING_MOVE);
    Movement::MoveSplineInit init(creature, "RandomMovementGenerator");
    init.MoveTo(dest.x, dest.y, dest.z, MOVE_PATHFINDING | MOVE_EXCLUDE_STEEP_SLOPES);
    init.SetWalk(!creature.HasExtraFlag(CREATURE_FLAG_EXTRA_ALWAYS_RUN));
    init.Launch();

    if (i_wanderSteps) // Creature has yet to do steps before pausing
    {
        --i_wanderSteps;
        i_nextMoveTime.Reset(50);
    }
    else
    {
        // Creature has made all its steps, time for a little break
        i_nextMoveTime.Reset(urand(4, 10) * IN_MILLISECONDS); // Retails seems to use rounded numbers so we do as well
        i_wanderSteps = urand(0, ((i_wanderDistance <= 1.0f) ? 2 : 8));
    }
}

void RandomMovementGenerator::Initialize(Creature &creature)
{
    if (!creature.IsAlive())
        return;

    if (i_randomPoints.empty())
    {
        i_randomPoints.reserve(MAX_RANDOM_POINTS + 1);
        for (uint32 i = 0; i < MAX_RANDOM_POINTS; ++i)
        {
            G3D::Vector3 point;
            if (creature.GetRandomPoint(i_startPosition.x, i_startPosition.y, i_startPosition.z, i_wanderDistance, point.x, point.y, point.z))
                i_randomPoints.push_back(point);
        }

        if (i_randomPoints.empty())
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to generate random points for %s!", creature.GetGuidStr().c_str());
    
        i_randomPoints.push_back(i_startPosition);
    }

    creature.AddUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    i_nextMoveTime.Reset(1000);
}

void RandomMovementGenerator::Reset(Creature &creature)
{
    Initialize(creature);
}

void RandomMovementGenerator::Interrupt(Creature &creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}

void RandomMovementGenerator::Finalize(Creature &creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}

bool RandomMovementGenerator::Update(Creature &creature, uint32 const& diff)
{
    if (i_expireTime)
    {
        if (i_expireTime <= diff)
            return false;
        else
            i_expireTime -= diff;
    }

    creature.GetMotionMaster()->SetNeedAsyncUpdate();
    return true;
}

void RandomMovementGenerator::UpdateAsync(Creature &creature, uint32 diff)
{
    // Lock async updates for safety, see Unit::asyncMovesplineLock doc
    std::unique_lock<std::mutex> guard(creature.asyncMovesplineLock);
    if (creature.HasUnitState(UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_DISTRACTED))
    {
        i_nextMoveTime.Reset(0);  // Expire the timer
        creature.ClearUnitState(UNIT_STAT_ROAMING_MOVE);
    }
    else if (creature.IsNoMovementSpellCasted())
    {
        if (!creature.IsStopped())
            creature.StopMoving();
    }
    else if (creature.movespline->Finalized())
    {
        i_nextMoveTime.Update(diff);
        if (i_nextMoveTime.Passed())
            _setRandomLocation(creature);
    }
}

bool RandomMovementGenerator::GetResetPosition(Creature& c, float& x, float& y, float& z)
{
    // use current if in range
    if (c.IsWithinDist2d(i_startPosition.x, i_startPosition.y, i_wanderDistance))
        c.GetPosition(x, y, z);
    else
    {
        x = i_startPosition.x;
        y = i_startPosition.y;
        z = i_startPosition.z;
    }

    return true;
}
