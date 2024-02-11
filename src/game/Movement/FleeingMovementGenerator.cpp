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
#include "CreatureAI.h"
#include "FleeingMovementGenerator.h"
#include "ObjectAccessor.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "PathFinder.h"
#include "MoveMap.h"

#define SEARCH_RANDOM_RADIUS 5.0f
#define MIN_QUIET_DISTANCE 28.0f
#define MAX_QUIET_DISTANCE 43.0f-SEARCH_RANDOM_RADIUS

template<class T>
void FleeingMovementGenerator<T>::_setTargetLocation(T &owner)
{
    if (!&owner)
        return;

    // ignore in case other no reaction state
    if (owner.HasUnitState((UNIT_STAT_CAN_NOT_REACT | UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED) & ~UNIT_STAT_FLEEING))
        return;

    if (Player* pPlayer = owner.ToPlayer())
        if (pPlayer->IsBeingTeleported())
            return;

    float x, y, z;
    if (!_getPoint(owner, x, y, z))
        return;

    owner.AddUnitState(UNIT_STAT_FLEEING_MOVE);

    PathFinder path(&owner);
    path.SetTransport(owner.GetTransport());
    path.ExcludeSteepSlopes();
    path.setPathLengthLimit(30.0f);
    path.calculate(x, y, z);
    path.CutPathWithDynamicLoS();
    if (path.getPathType() & PATHFIND_NOPATH)
    {
        i_nextCheckTime.Reset(urand(1000, 1500));
        return;
    }

    Movement::MoveSplineInit init(owner, "FleeingMovementGenerator");
    init.Move(&path);
    init.SetWalk(_forceWalking);
    if (_customSpeed > 0)
        init.SetVelocity(_customSpeed);
    int32 traveltime = init.Launch();
    i_nextCheckTime.Reset(traveltime + urand(800, 1500));
    _forceUpdate = false;
}

template<class T>
bool FleeingMovementGenerator<T>::_getPoint(T &owner, float &x, float &y, float &z)
{
    if (!&owner)
        return false;

    float dist_from_caster, angle_to_caster;
    if (Unit* fright = ObjectAccessor::GetUnit(owner, i_frightGuid))
    {
        dist_from_caster = fright->GetDistance(&owner);
        if (dist_from_caster > 0.2f)
            angle_to_caster = fright->GetAngle(&owner);
        else
            angle_to_caster = frand(0, 2 * M_PI_F);
    }
    else
    {
        dist_from_caster = 0.0f;
        angle_to_caster = frand(0, 2 * M_PI_F);
    }

    float dist, angle;
    if (dist_from_caster < MIN_QUIET_DISTANCE)
    {
        dist = frand(0.4f, 1.3f) * (MIN_QUIET_DISTANCE - dist_from_caster);
        angle = angle_to_caster + frand(-M_PI_F / 8, M_PI_F / 8);
    }
    else if (dist_from_caster > MAX_QUIET_DISTANCE)
    {
        dist = frand(0.4f, 1.0f) * (MAX_QUIET_DISTANCE - MIN_QUIET_DISTANCE);
        angle = -angle_to_caster + frand(-M_PI_F / 4, M_PI_F / 4);
    }
    else    // we are inside quiet range
    {
        dist = frand(0.6f, 1.2f) * (MAX_QUIET_DISTANCE - MIN_QUIET_DISTANCE);
        angle = frand(0, 2 * M_PI_F);
    }

    // Nostalrius: pathfinding pour trouver la position de fear (seulement si disponible)
    owner.GetSafePosition(x, y, z);
    x += dist * cos(angle);
    y += dist * sin(angle);
    // If walking on the border of the map ... Fix crash.
    if (!MaNGOS::IsValidMapCoord(x, y, z))
        return false;
    float srcX, srcY, srcZ;
    owner.GetSafePosition(srcX, srcY, srcZ, owner.GetTransport());
    if (!owner.GetMap()->GetWalkHitPosition(owner.GetTransport(), srcX, srcY, srcZ, x, y, z, NAV_WATER | NAV_GROUND))
        owner.GetSafePosition(x, y, z);
    return owner.GetMap()->GetWalkRandomPosition(owner.GetTransport(), x, y, z, SEARCH_RANDOM_RADIUS);
}

template<class T>
void FleeingMovementGenerator<T>::Initialize(T &owner)
{
    owner.AddUnitState(UNIT_STAT_FLEEING | UNIT_STAT_FLEEING_MOVE);
    owner.StopMoving();
    owner.UpdateControl();

    if (owner.GetTypeId() == TYPEID_UNIT)
    {
        owner.SetWalk(_forceWalking, false);
        owner.SetTargetGuid(0);
    }

    _setTargetLocation(owner);
}

template<>
void FleeingMovementGenerator<Player>::Finalize(Player &owner)
{
    owner.ClearUnitState(UNIT_STAT_FLEEING | UNIT_STAT_FLEEING_MOVE);
    owner.StopMoving();
    owner.UpdateControl();
}

template<>
void FleeingMovementGenerator<Creature>::Finalize(Creature &owner)
{
    owner.SetWalk(!owner.HasUnitState(UNIT_STAT_RUNNING), false);
    owner.ClearUnitState(UNIT_STAT_FLEEING | UNIT_STAT_FLEEING_MOVE);
    owner.UpdateControl();
}

template<class T>
void FleeingMovementGenerator<T>::Interrupt(T &owner)
{
    // flee state still applied while movegen disabled
    owner.ClearUnitState(UNIT_STAT_FLEEING_MOVE);
}

template<class T>
void FleeingMovementGenerator<T>::Reset(T &owner)
{
    Initialize(owner);
}

template<class T>
bool FleeingMovementGenerator<T>::Update(T &owner, uint32 const&  time_diff)
{
    if (!&owner || !owner.IsAlive())
        return false;

    // ignore in case other no reaction state
    if (owner.HasUnitState((UNIT_STAT_CAN_NOT_REACT | UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED) & ~UNIT_STAT_FLEEING))
    {
        owner.ClearUnitState(UNIT_STAT_FLEEING_MOVE);
        return true;
    }

    i_nextCheckTime.Update(time_diff);
    if ((i_nextCheckTime.Passed() && owner.movespline->Finalized()) || _forceUpdate)
        _setTargetLocation(owner);

    if (owner.IsCreature())
        owner.ToCreature()->CallForHelp(10.0f);
    return true;
}

template void FleeingMovementGenerator<Player>::Initialize(Player &);
template void FleeingMovementGenerator<Creature>::Initialize(Creature &);
template bool FleeingMovementGenerator<Player>::_getPoint(Player &, float &, float &, float &);
template bool FleeingMovementGenerator<Creature>::_getPoint(Creature &, float &, float &, float &);
template void FleeingMovementGenerator<Player>::_setTargetLocation(Player &);
template void FleeingMovementGenerator<Creature>::_setTargetLocation(Creature &);
template void FleeingMovementGenerator<Player>::Interrupt(Player &);
template void FleeingMovementGenerator<Creature>::Interrupt(Creature &);
template void FleeingMovementGenerator<Player>::Reset(Player &);
template void FleeingMovementGenerator<Creature>::Reset(Creature &);
template bool FleeingMovementGenerator<Player>::Update(Player &, uint32 const&);
template bool FleeingMovementGenerator<Creature>::Update(Creature &, uint32 const&);

void TimedFleeingMovementGenerator::Initialize(Unit& owner)
{
    ASSERT(owner.GetTypeId() == TYPEID_UNIT);
    _forceWalking = false;
    FleeingMovementGenerator<Creature>::Initialize(*((Creature*)&owner));
}

void TimedFleeingMovementGenerator::Finalize(Unit &owner)
{
    owner.ClearUnitState(UNIT_STAT_FLEEING | UNIT_STAT_FLEEING_MOVE);
    owner.UpdateControl();

    if (owner.IsAlive() && !owner.HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_CONFUSED | UNIT_FLAG_FLEEING | UNIT_FLAG_POSSESSED))
    {
        if (Unit* victim = owner.GetVictim())
        {
            owner.AttackStop(true);
            ((Creature*)&owner)->AI()->AttackStart(victim);
        }
    }
}

bool TimedFleeingMovementGenerator::Update(Unit & owner, uint32 const&  time_diff)
{
    if (!owner.IsAlive())
        return false;

    // ignore in case other no reaction state
    if (owner.HasUnitState((UNIT_STAT_CAN_NOT_REACT | UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED) & ~UNIT_STAT_FLEEING))
    {
        owner.ClearUnitState(UNIT_STAT_FLEEING_MOVE);
        return true;
    }

    i_totalFleeTime.Update(time_diff);
    if (i_totalFleeTime.Passed())
        return false;

    // This calls grant-parent Update method hiden by FleeingMovementGenerator::Update(Creature &, uint32 const&) version
    // This is done instead of casting Unit& to Creature& and call parent method, then we can use Unit directly
    return MovementGeneratorMedium< Creature, FleeingMovementGenerator<Creature> >::Update(owner, time_diff);
}
