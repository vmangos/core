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

#include "CyclicMovementGenerator.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"

void CyclicMovementGenerator<Creature>::LoadPath(uint32 guid, uint32 entry, WaypointPathOrigin wpOrigin)
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
    if (!i_path || i_path->size() < 2)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "CyclicMovementGenerator::LoadPath: GUID %u Entry %u doesn't have waypoint path", guid, entry);
        return;
    }
}

void CyclicMovementGenerator<Creature>::Initialize(Creature& creature)
{
    creature.AddUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
}

void CyclicMovementGenerator<Creature>::InitializeWaypointPath(Creature& creature, WaypointPathOrigin wpSource, uint32 overwriteGuid, uint32 overwriteEntry)
{
    if (!overwriteGuid)
        overwriteGuid = creature.GetGUIDLow();
    if (!overwriteEntry)
        overwriteEntry = creature.GetEntry();

    LoadPath(overwriteGuid, overwriteEntry, wpSource);

    if (i_path && !i_path->empty())
        _setTargetLocation(creature);
}

void CyclicMovementGenerator<Creature>::Reset(Creature& creature)
{
    creature.AddUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
}

void CyclicMovementGenerator<Creature>::_setTargetLocation(Creature & owner)
{
    if (owner.HasUnitState(UNIT_STAT_CAN_NOT_MOVE))
        return;

    WaypointNode const& firstNode = i_path->at(0);
    if (owner.GetDistance(firstNode.x, firstNode.y, firstNode.z) > 10)
    {
        PathFinder path(&owner);
        path.calculate(firstNode.x, firstNode.y, firstNode.z, true);

        Movement::MoveSplineInit init(owner, "CyclicMovementGenerator");
        if (owner.CanFly())
            init.SetFly();
        init.SetWalk(!owner.HasExtraFlag(CREATURE_FLAG_EXTRA_ALWAYS_RUN));
        init.Move(&path);
        init.Launch();
    }
    else
    {
        PointsArray genPath;
        genPath.resize(i_path->size());
        for (auto const& node : *i_path)
            genPath[node.first] = G3D::Vector3(node.second.x, node.second.y, node.second.z);

        Movement::MoveSplineInit init(owner, "CyclicMovementGenerator");
        if (owner.CanFly())
            init.SetFly();
        init.SetWalk(!owner.HasExtraFlag(CREATURE_FLAG_EXTRA_ALWAYS_RUN));
        init.MovebyPath(genPath);
        init.SetFirstPointId(1);
        init.Launch();
    }
}

bool CyclicMovementGenerator<Creature>::Update(Creature &owner, uint32 const& /*time_diff*/)
{
    if (!i_path || i_path->size() < 2)
        return false;

    if (owner.movespline->Finalized())
        _setTargetLocation(owner);

    return true;
}

void CyclicMovementGenerator<Creature>::Finalize(Creature& creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}

void CyclicMovementGenerator<Creature>::Interrupt(Creature &creature)
{
    creature.ClearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.HasUnitState(UNIT_STAT_RUNNING), false);
}
