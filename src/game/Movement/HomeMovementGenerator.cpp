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

#include "HomeMovementGenerator.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "ObjectMgr.h"
#include "WorldPacket.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"

void HomeMovementGenerator<Creature>::Initialize(Creature & owner)
{
    _setTargetLocation(owner);
}

void HomeMovementGenerator<Creature>::Reset(Creature &)
{
}

void HomeMovementGenerator<Creature>::_setTargetLocation(Creature & owner)
{
    if (owner.HasUnitState(UNIT_STAT_CAN_NOT_MOVE))
        return;

    // Remove speed reductions from low hp
    owner.ModifyAuraState(AURA_STATE_HEALTHLESS_15_PERCENT, false);
    owner.ModifyAuraState(AURA_STATE_HEALTHLESS_10_PERCENT, false);
    owner.ModifyAuraState(AURA_STATE_HEALTHLESS_5_PERCENT, false);

    
    float x, y, z, o;
    bool setFacing = false;
    // at apply we can select more nice return points base at current movegen
    if (owner.GetMotionMaster()->empty() || !owner.GetMotionMaster()->top()->GetResetPosition(owner, x, y, z))
    {
        owner.GetRespawnCoord(x, y, z, &o);
        setFacing = true;
    }

    PathFinder path(&owner);
    path.calculate(x, y, z, true);
    if ((path.getPathType() & PATHFIND_NORMAL) && !((path.getPathType() & PATHFIND_NOT_USING_PATH) && (path.getPathType() & PATHFIND_DEST_FORCED)))
    {
        Movement::MoveSplineInit init(owner, "HomeMovementGenerator");

        if (setFacing)
            init.SetFacing(o);

        init.Move(&path);
        init.SetWalk(false);
        init.Launch();
    }
    else // too far away or no path
        owner.NearTeleportTo(x, y, z, setFacing ? o : owner.GetOrientation());
    
    arrived = false;

    owner.ClearUnitState(UNIT_STAT_ALL_DYN_STATES);
}

bool HomeMovementGenerator<Creature>::Update(Creature &owner, uint32 const& /*time_diff*/)
{
    arrived = owner.movespline->Finalized();
    return !arrived;
}

void HomeMovementGenerator<Creature>::Finalize(Creature& owner)
{
    if (arrived)
    {
        if (owner.GetTemporaryFactionFlags() & TEMPFACTION_RESTORE_REACH_HOME)
            owner.ClearTemporaryFaction();

        owner.SetWalk(!owner.HasUnitState(UNIT_STAT_RUNNING) && !owner.IsLevitating(), false);
        owner.LoadCreatureAddon(true);
        owner.AI()->JustReachedHome();
    }
}
