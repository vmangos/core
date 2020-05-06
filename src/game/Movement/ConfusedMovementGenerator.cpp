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

#include "ConfusedMovementGenerator.h"
#include "MapManager.h"
#include "Creature.h"
#include "Player.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "PathFinder.h"
#include "Transport.h"

template<class T>
void ConfusedMovementGenerator<T>::Initialize(T &unit)
{
    // set initial position
    unit.GetSafePosition(i_x, i_y, i_z, unit.GetTransport());

    if (!unit.movespline->Finalized())
        unit.StopMoving();
    unit.AddUnitState(UNIT_STAT_CONFUSED);
    unit.UpdateControl();
}

template<class T>
void ConfusedMovementGenerator<T>::Interrupt(T &unit)
{
}

template<class T>
void ConfusedMovementGenerator<T>::Reset(T &unit)
{
    unit.StopMoving();
    unit.AddUnitState(UNIT_STAT_CONFUSED);
    unit.UpdateControl();
}

template<class T>
bool ConfusedMovementGenerator<T>::Update(T &unit, uint32 const& diff)
{
    // ignore in case other no reaction state
    if (unit.HasUnitState((UNIT_STAT_CAN_NOT_REACT | UNIT_STAT_CAN_NOT_MOVE) & ~UNIT_STAT_CONFUSED))
        return true;

    if (!unit.movespline->Finalized())
        return true;

    float x = i_x, y = i_y, z = i_z;
    if (unit.GetTransport())
    {
        x += frand(-2, 2);
        y += frand(-2, 2);
    }
    else if (!(unit.GetRandomPoint(i_x, i_y, i_z, 4.0f, x, y, z)))
        return true;

    PathFinder path(&unit);
    path.SetTransport(unit.GetTransport());
    path.ExcludeSteepSlopes();
    path.setPathLengthLimit(4.0f);
    path.calculate(x, y, z, false, true);
    path.CutPathWithDynamicLoS();

    Movement::MoveSplineInit init(unit, "ConfusedMovementGenerator");
    init.Move(&path);
    init.SetWalk(true);
    init.Launch();
    return true;
}

template<>
void ConfusedMovementGenerator<Player>::Finalize(Player &unit)
{
    unit.ClearUnitState(UNIT_STAT_CONFUSED);
    unit.StopMoving();
    unit.UpdateControl();
}

template<>
void ConfusedMovementGenerator<Creature>::Finalize(Creature &unit)
{
    unit.ClearUnitState(UNIT_STAT_CONFUSED);
    unit.UpdateControl();
}

template void ConfusedMovementGenerator<Player>::Initialize(Player &player);
template void ConfusedMovementGenerator<Creature>::Initialize(Creature &creature);
template void ConfusedMovementGenerator<Player>::Interrupt(Player &player);
template void ConfusedMovementGenerator<Creature>::Interrupt(Creature &creature);
template void ConfusedMovementGenerator<Player>::Reset(Player &player);
template void ConfusedMovementGenerator<Creature>::Reset(Creature &creature);
template bool ConfusedMovementGenerator<Player>::Update(Player &player, uint32 const& diff);
template bool ConfusedMovementGenerator<Creature>::Update(Creature &creature, uint32 const& diff);
