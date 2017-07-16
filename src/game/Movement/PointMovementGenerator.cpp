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

#include "PointMovementGenerator.h"
#include "Errors.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "GameObjectAI.h"
#include "TemporarySummon.h"
#include "World.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Anticheat.h"

//----- Point Movement Generator
template<class T>
void PointMovementGenerator<T>::Initialize(T &unit)
{
    if (!unit.IsStopped())
        unit.StopMoving();

    unit.addUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    Movement::MoveSplineInit init(unit, "PointMovementGenerator<T>::Initialize");
    init.MoveTo(i_x, i_y, i_z, _options);
    if (speed > 0.0f)
        init.SetVelocity(speed);
    if (_options & MOVE_WALK_MODE)
        init.SetWalk(true);
    if (_options & MOVE_RUN_MODE)
        init.SetWalk(false);
    if (_options & MOVE_FLY_MODE)
        init.SetFly();
    if (_options & MOVE_FALLING)
        init.SetFall();
    if (_options & MOVE_CYCLIC)
        init.SetCyclic();
    if (_finalO > -7.0f)
        init.SetFacing(_finalO);
    init.Launch();
}

template<class T>
void PointMovementGenerator<T>::Finalize(T &unit)
{
    unit.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    MovementInform(unit);
}

template<class T>
void PointMovementGenerator<T>::Interrupt(T &unit)
{
    unit.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
}

template<class T>
void PointMovementGenerator<T>::Reset(T &unit)
{
    if (!unit.IsStopped())
        unit.StopMoving();

    unit.addUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
}

template<class T>
bool PointMovementGenerator<T>::Update(T &unit, const uint32 &diff)
{
    if (!&unit)
        return false;

    if (unit.hasUnitState(UNIT_STAT_CAN_NOT_MOVE))
    {
        unit.clearUnitState(UNIT_STAT_ROAMING_MOVE);
        return true;
    }

    unit.addUnitState(UNIT_STAT_ROAMING_MOVE);

    if (!unit.movespline->Finalized() && _recalculateSpeed)
    {
        _recalculateSpeed = false;
        Initialize(unit);
    }
    return !unit.movespline->Finalized();
}

template<>
void PointMovementGenerator<Player>::MovementInform(Player&)
{
}

template <>
void PointMovementGenerator<Creature>::MovementInform(Creature &unit)
{
    if (!unit.isAlive())
        return;

    if (unit.AI())
        unit.AI()->MovementInform(POINT_MOTION_TYPE, id);

    if (unit.IsTemporarySummon())
    {
        TemporarySummon* pSummon = (TemporarySummon*)(&unit);
        if (pSummon->GetSummonerGuid().IsCreature())
        {
            if (Creature* pSummoner = unit.GetMap()->GetCreature(pSummon->GetSummonerGuid()))
                if (pSummoner->AI())
                    pSummoner->AI()->SummonedMovementInform(&unit, POINT_MOTION_TYPE, id);
        }
        else
        {
            if (GameObject* pSummoner = unit.GetMap()->GetGameObject(pSummon->GetSummonerGuid()))
                if (pSummoner->AI())
                    pSummoner->AI()->SummonedMovementInform(&unit, POINT_MOTION_TYPE, id);
        }
    }
}

template void PointMovementGenerator<Player>::Initialize(Player&);
template void PointMovementGenerator<Creature>::Initialize(Creature&);
template void PointMovementGenerator<Player>::Finalize(Player&);
template void PointMovementGenerator<Creature>::Finalize(Creature&);
template void PointMovementGenerator<Player>::Interrupt(Player&);
template void PointMovementGenerator<Creature>::Interrupt(Creature&);
template void PointMovementGenerator<Player>::Reset(Player&);
template void PointMovementGenerator<Creature>::Reset(Creature&);
template bool PointMovementGenerator<Player>::Update(Player &, const uint32 &diff);
template bool PointMovementGenerator<Creature>::Update(Creature&, const uint32 &diff);

void AssistanceMovementGenerator::Initialize(Creature& unit)
{
    if (unit.hasUnitState(UNIT_STAT_CAN_NOT_REACT | UNIT_STAT_CAN_NOT_MOVE))
        return;

    if (!unit.IsStopped())
        unit.StopMoving();

    unit.addUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    Movement::MoveSplineInit init(unit, "AssistanceMovementGenerator::Initialize");
    init.MoveTo(i_x, i_y, i_z, (_options & (MOVE_PATHFINDING | MOVE_FORCE_DESTINATION)));
    init.SetWalk(true);
    init.SetVelocity(unit.GetFleeingSpeed());
    init.Launch();
}

void AssistanceMovementGenerator::Finalize(Creature &unit)
{
    unit.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);

    unit.SetNoCallAssistance(false);
    unit.CallAssistance();
    if (unit.isAlive())
        unit.GetMotionMaster()->MoveSeekAssistanceDistract(sWorld.getConfig(CONFIG_UINT32_CREATURE_FAMILY_ASSISTANCE_DELAY));
}

bool EffectMovementGenerator::Update(Unit &unit, const uint32 &)
{
    return !unit.movespline->Finalized();
}

void EffectMovementGenerator::Finalize(Unit &unit)
{
    if (unit.GetTypeId() != TYPEID_UNIT)
        return;

    if (((Creature&)unit).AI() && unit.movespline->Finalized())
        ((Creature&)unit).AI()->MovementInform(EFFECT_MOTION_TYPE, m_Id);
    unit.RestoreMovement();
}

//----- Charge Movement Generator
template<class T>
void ChargeMovementGenerator<T>::Initialize(T &unit)
{
    if (!unit.IsStopped())
        unit.StopMoving();
    if (path.getPathType() & PATHFIND_NOPATH)
        return;
    unit.addUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    unit.m_movementInfo.moveFlags = unit.m_movementInfo.moveFlags & ~MOVEFLAG_MASK_MOVING_OR_TURN;
    Movement::MoveSplineInit init(unit, "ChargeMovementGenerator<T>::Initialize");
    init.Move(&path);
    init.SetVelocity(_speed);
    init.SetWalk(false);
    init.SetFacingGUID(unit.GetTargetGuid());
    init.Launch();
}

template<class T>
void ChargeMovementGenerator<T>::Finalize(T &unit)
{
    unit.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    if (unit.hasUnitState(UNIT_STAT_PENDING_ROOT))
        unit.addUnitState(UNIT_STAT_ROOT);
    if (unit.hasUnitState(UNIT_STAT_PENDING_STUNNED))
        unit.addUnitState(UNIT_STAT_STUNNED);
    if (unit.hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT))
        unit.SetMovement(MOVE_ROOT);
    if (_triggerAttack)
        if (!unit.IsPlayer() || victimGuid == unit.ToPlayer()->GetSelectionGuid())
            if (Unit* victim = unit.GetMap()->GetUnit(victimGuid))
                unit.Attack(victim, true);
    unit.RestoreMovement();
}

template<class T>
void ChargeMovementGenerator<T>::ComputePath(T& attacker, Unit& victim)
{
    Vector3 attackPos; // attacker position
    Vector3 victimPos; // victim position
    Vector3 chargeVect; // vector of the charge
    Vector3 victimSpd; // speed vector of victim
    float o;

    if (Transport* t = attacker.GetTransport())
        path.SetTransport(t);

    if (_speed == 0)
        _speed = attacker.GetSpeed(MOVE_RUN) * 4;
    if (_speed > 24.0f)
        _speed = 24.0f;

    attacker.GetPosition(attackPos.x, attackPos.y, attackPos.z);
    victim.GetPosition(victimPos.x, victimPos.y, victimPos.z);
    chargeVect = victimPos - attackPos;
    chargeVect = chargeVect.direction(); // unit vector

    // Base path is to current victim position
    path.calculate(victimPos.x, victimPos.y, victimPos.z, false);

    // Improved path to victim future estimated position
    if (Player* victimPlayer = victim.ToPlayer())
    {
        PlayerAnticheatInterface* data = victimPlayer->GetCheatData();
        if ((data->InterpolateMovement(victimPlayer->m_movementInfo, 1000, victimSpd.x, victimSpd.y, victimSpd.z, o)) &&
                (data->InterpolateMovement(victimPlayer->m_movementInfo, 0, victimPos.x, victimPos.y, victimPos.z, o)))
        {
            // Victim speed per sec.
            victimSpd -= victimPos;
            // We get only the component of the speed in the direction of charge vector
            float victimSpeed = victimSpd.dot(chargeVect); // dot product
            if (abs(victimSpeed) > 0.1f)
            {
                float currDistance = path.Length();
                uint32 pathTravelTime;
                // Equation when matching collision distance, to get collision time:
                // _speed * t = currDistance + victimSpeed * t
                // t = currDistance / (_speed - victimSpeed)
                if (_speed > 2 * victimSpeed) // we don't want to reach target if target speed is more than half charge speed
                    pathTravelTime = (uint32)(1000 * currDistance / (_speed - victimSpeed));
                else
                    pathTravelTime = (uint32)(1000 * 2 * currDistance / _speed);

                pathTravelTime *= 0.45f; // Attenuation factor (empirical)
                _interpolateDelay = (WorldTimer::getMSTime() - victimPlayer->m_movementInfo.time) + pathTravelTime;
                if (_interpolateDelay > 1500) _interpolateDelay = 1500;
                if (data->InterpolateMovement(victimPlayer->m_movementInfo, _interpolateDelay, victimPos.x, victimPos.y, victimPos.z, o))
                {
                    victim.UpdateAllowedPositionZ(victimPos.x, victimPos.y, victimPos.z);
                    path.calculate(victimPos.x, victimPos.y, victimPos.z, false);
                    path.UpdateForMelee(&victim, attacker.GetMeleeReach());
                }
            }
            else
                path.UpdateForMelee(&victim, attacker.GetMeleeReach());
        }
    }
    else
    {
        // TODO: PvE victim position prediction?
        // Relocate last path point to hitbox rather than exact position of victim
        path.UpdateForMelee(&victim, attacker.GetMeleeReach());
    }
}

template<class T>
void ChargeMovementGenerator<T>::Interrupt(T &unit)
{
    unit.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    if (unit.hasUnitState(UNIT_STAT_PENDING_ROOT))
        unit.addUnitState(UNIT_STAT_ROOT);
    if (unit.hasUnitState(UNIT_STAT_PENDING_STUNNED))
        unit.addUnitState(UNIT_STAT_STUNNED);
    if (unit.hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT))
        unit.SetMovement(MOVE_ROOT);
}

template<class T>
void ChargeMovementGenerator<T>::Reset(T &unit)
{
    unit.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    if (unit.hasUnitState(UNIT_STAT_PENDING_ROOT))
        unit.addUnitState(UNIT_STAT_ROOT);
    if (unit.hasUnitState(UNIT_STAT_PENDING_STUNNED))
        unit.addUnitState(UNIT_STAT_STUNNED);
    if (unit.hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT))
        unit.SetMovement(MOVE_ROOT);
}

template<class T>
bool ChargeMovementGenerator<T>::Update(T &unit, const uint32 &diff)
{
    if (!&unit)
        return false;

    if (_scheduleStopMoving)
    {
        unit.StopMoving();
        return false;
    }

    unit.addUnitState(UNIT_STAT_ROAMING_MOVE);

    if (!unit.movespline->Finalized() && _recalculateSpeed)
    {
        _recalculateSpeed = false;
        path.calculate(path.getEndPosition().x, path.getEndPosition().y, path.getEndPosition().z, false);
        Initialize(unit);
    }
    return !unit.movespline->Finalized();
}

template void ChargeMovementGenerator<Player>::ComputePath(Player& attacker, Unit& victim);
template void ChargeMovementGenerator<Creature>::ComputePath(Creature& attacker, Unit& victim);
template void ChargeMovementGenerator<Player>::Initialize(Player&);
template void ChargeMovementGenerator<Creature>::Initialize(Creature&);
template void ChargeMovementGenerator<Player>::Finalize(Player&);
template void ChargeMovementGenerator<Creature>::Finalize(Creature&);
template void ChargeMovementGenerator<Player>::Interrupt(Player&);
template void ChargeMovementGenerator<Creature>::Interrupt(Creature&);
template void ChargeMovementGenerator<Player>::Reset(Player&);
template void ChargeMovementGenerator<Creature>::Reset(Creature&);
template bool ChargeMovementGenerator<Player>::Update(Player &, const uint32 &diff);
template bool ChargeMovementGenerator<Creature>::Update(Creature&, const uint32 &diff);
