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

#include "ByteBuffer.h"
#include "TargetedMovementGenerator.h"
#include "Errors.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "Player.h"
#include "World.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Anticheat.h"
#include "Transport.h"
#include "TemporarySummon.h"
#include "GameObjectAI.h"

//-----------------------------------------------//
template<class T, typename D>
void TargetedMovementGeneratorMedium<T, D>::_setTargetLocation(T &owner)
{
    // Note: Any method that accesses the target's movespline here must be
    // internally locked by the target's spline lock
    if (!i_target.isValid() || !i_target->IsInWorld())
        return;

    if (owner.hasUnitState(UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_CONTROLLED))
        return;

    float x, y, z;
    bool losChecked = false;
    bool losResult = false;

    Transport* transport = NULL;
    bool isPet = (owner.GetTypeId() == TYPEID_UNIT && ((Creature*)&owner)->IsPet());
    if (isPet)
        transport = i_target.getTarget()->GetTransport();
    // prevent redundant micro-movement for pets, other followers.
    if (i_offset && i_target->IsWithinDistInMap(&owner, 1.4f * i_offset))
    {
        if (!owner.movespline->Finalized())
            return;

        owner.GetPosition(x, y, z);
    }
    else if (!i_offset)
    {
        if (owner.IsWithinMeleeRange(i_target.getTarget()))
        {
            losResult = owner.IsWithinLOSInMap(i_target.getTarget());
            losChecked = true;
            if (losResult)
                return;
        }

        // NOSTALRIUS: Eviter les collisions entre mobs.
        // Cette fonction prend un angle aleatoire.
        i_target->GetRandomAttackPoint(&owner, x, y, z);
    }
    else
    {
        // to at i_offset distance from target and i_angle from target facing
        float srcX, srcY, srcZ;
        i_target->GetSafePosition(srcX, srcY, srcZ, transport);
        if (transport)
            transport->CalculatePassengerPosition(srcX, srcY, srcZ);

        // TRANSPORT_VMAPS
        if (transport)
        {
            i_target->GetNearPoint2D(x, y, i_offset, i_angle + i_target->GetOrientation());
            z = srcZ;
        }
        else
            i_target->GetClosePoint(x, y, z, owner.GetObjectBoundingRadius(), i_offset, i_angle, &owner);

        if (!i_target->m_movementInfo.HasMovementFlag(MOVEFLAG_SWIMMING) && !i_target->IsInWater())
            if (!owner.GetMap()->GetWalkHitPosition(transport, srcX, srcY, srcZ, x, y, z))
                i_target->GetSafePosition(x, y, z);
    }

    _targetOnTransport = transport;
    i_target->GetPosition(_targetLastX, _targetLastY, _targetLastZ, transport);

    PathFinder path(&owner);

    // allow pets following their master to cheat while generating paths
    bool petFollowing = (isPet && owner.hasUnitState(UNIT_STAT_FOLLOW));
    Movement::MoveSplineInit init(owner, "TargetedMovementGenerator");
    path.SetTransport(transport);
    path.calculate(x, y, z, petFollowing);

    PathType pathType = path.getPathType();
    i_reachable = pathType & PATHFIND_NORMAL;
    if (!i_reachable && !!(pathType & PATHFIND_INCOMPLETE) && owner.hasUnitState(UNIT_STAT_ALLOW_INCOMPLETE_PATH))
    {
        i_reachable = true;
    }

    // Enforce stricter checking inside dungeons
    if (i_reachable && owner.GetMap() && owner.GetMap()->IsDungeon())
    {
        // Check dest coords to ensure reachability
        G3D::Vector3 dest = path.getActualEndPosition();
        if (!owner.CanReachWithMeleeAttackAtPosition(i_target.getTarget(), dest[0], dest[1], dest[2]))
            i_reachable = false;
    }

    i_recalculateTravel = false;
    if (this->GetMovementGeneratorType() == CHASE_MOTION_TYPE && !transport && owner.HasDistanceCasterMovement())
        if (path.UpdateForCaster(i_target.getTarget(), owner.GetMinChaseDistance(i_target.getTarget())))
        {
            if (!owner.movespline->Finalized())
                owner.StopMoving();
            return;
        }

    // Try to prevent redundant micro-moves
    float pathLength = path.Length();
    if (pathLength < 0.4f ||
            (pathLength < 4.0f && (i_target->GetPositionZ() - owner.GetPositionZ()) > 10.0f) || // He is flying too high for me. Moving a few meters wont change anything.
            (pathType & PATHFIND_NOPATH && !petFollowing) ||
            (pathType & PATHFIND_INCOMPLETE && !owner.hasUnitState(UNIT_STAT_ALLOW_INCOMPLETE_PATH) && !petFollowing) ||
            (!petFollowing && !i_reachable))
    {
        if (!losChecked)
            losResult = owner.IsWithinLOSInMap(i_target.getTarget());
        if (losResult)
        {
            if (!owner.movespline->Finalized())
                owner.StopMoving();
            return;
        }
    }

    D::_addUnitStateMove(owner);
    i_targetReached = false;

    init.Move(&path);
    if (petFollowing)
    {
        float dist = path.Length();
        init.SetWalk(false);
        if (dist > 15.0f)
        {
            Unit* pOwner = owner.GetCharmerOrOwner();
            if (pOwner && !pOwner->isInCombat() && !owner.isInCombat())
            {
                float distFactor = 1.0f;
                if (pOwner->IsMounted())
                    distFactor += 0.04 * (dist - 25.0f);
                else
                    distFactor += 0.04 * (dist - 15.0f);
                if (distFactor < 1.0f) distFactor = 1.0f;
                if (distFactor > 2.1f) distFactor = 2.1f;
                init.SetVelocity(distFactor * owner.GetSpeed(MOVE_RUN));
            }
        }
        else if (dist < 2.0f)
            init.SetWalk(true);
        float facing = i_target->GetOrientation();
        if (transport)
            facing -= transport->GetOrientation();
        init.SetFacing(facing);
    }
    else
        init.SetWalk(((D*)this)->EnableWalking());
    init.Launch();
    i_recheckDistance.Reset(500);
    // Fly-hack
    if (Player* player = i_target->ToPlayer())
    {
        float allowed_dist = owner.GetCombatReach(false) + i_target->GetCombatReach(false) + 5.0f;
        G3D::Vector3 dest = owner.movespline->FinalDestination();
        if ((player->GetPositionZ() - allowed_dist - 5.0f) > dest.z)
            player->GetCheatData()->Unreachable(&owner);
    }
}

template<>
void TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::UpdateFinalDistance(float /*fDistance*/)
{
    // nothing to do for Player
}

template<>
void TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::UpdateFinalDistance(float /*fDistance*/)
{
    // nothing to do for Player
}

template<>
void TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::UpdateFinalDistance(float fDistance)
{
    i_offset = fDistance;
    i_recalculateTravel = true;
}

template<>
void TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::UpdateFinalDistance(float fDistance)
{
    i_offset = fDistance;
    i_recalculateTravel = true;
}

template<class T, typename D>
bool TargetedMovementGeneratorMedium<T, D>::Update(T &owner, const uint32 & time_diff)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return false;

    if (!owner.isAlive())
        return true;

    if (owner.hasUnitState(UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_CONTROLLED))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    if (this->GetMovementGeneratorType() == CHASE_MOTION_TYPE && owner.hasUnitState(UNIT_STAT_NO_COMBAT_MOVEMENT))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    // don't stop creature movement for spells without interrupt movement flags
    if (owner.IsNoMovementSpellCasted())
    {
        if (!owner.IsStopped())
            owner.StopMoving();
        return true;
    }

    // prevent crash after creature killed pet
    if (static_cast<D*>(this)->_lostTarget(owner))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    bool interrupted = false;
    i_recheckDistance.Update(time_diff);
    if (i_recheckDistance.Passed())
    {
        i_recheckDistance.Reset(100);
        //More distance let have better performance, less distance let have more sensitive reaction at target move.
        if (!owner.movespline->Finalized() && i_target->IsWithinDist(&owner, 0.0f) && !i_offset)
        {
            owner.movespline->_Interrupt();
            interrupted = true;
        }
        else
        {
            float allowed_dist = owner.GetMaxChaseDistance(i_target.getTarget()) - 0.5f;
            bool targetMoved = false;
            G3D::Vector3 dest(_targetLastX, _targetLastY, _targetLastZ);
            if (Transport* ownerTransport = owner.GetTransport())
            {
                if (_targetOnTransport)
                    ownerTransport->CalculatePassengerPosition(dest.x, dest.y, dest.z);
                else
                    targetMoved = true;
            }
            else if (_targetOnTransport)
                targetMoved = true;

            if (!targetMoved)
                targetMoved = !i_target->IsWithinDist3d(dest.x, dest.y, dest.z, 0.5f);
            // Chase movement may be interrupted
            if (!targetMoved)
                if (owner.movespline->Finalized())
                    targetMoved = !owner.IsWithinDist3d(dest.x, dest.y, dest.z, allowed_dist - owner.GetObjectBoundingRadius());

            if (targetMoved)
            {
                i_recalculateTravel = true;
                owner.GetMotionMaster()->SetNeedAsyncUpdate();
            }
            else
            {
                // Fly-hack
                if (Player* player = i_target->ToPlayer())
                    if ((player->GetPositionZ() - allowed_dist - 5.0f) > dest.z)
                        player->GetCheatData()->Unreachable(&owner);
            }
        }
    }

    if (owner.movespline->Finalized())
    {
        if (owner.GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE || 
            owner.GetMotionMaster()->GetCurrentMovementGeneratorType() == FOLLOW_MOTION_TYPE)
            static_cast<D*>(this)->MovementInform(owner);

        if (i_angle == 0.f && !owner.HasInArc(0.01f, i_target.getTarget()))
            owner.SetInFront(i_target.getTarget());

        if (!i_targetReached)
        {
            i_targetReached = true;
            static_cast<D*>(this)->_reachTarget(owner);
        }
        if (interrupted)
            owner.StopMoving();
    }
    else if (i_recalculateTravel)
        owner.GetMotionMaster()->SetNeedAsyncUpdate();
    return true;
}

template<class T, typename D>
void TargetedMovementGeneratorMedium<T, D>::UpdateAsync(T &owner, uint32 /*diff*/)
{
    if (!i_recalculateTravel)
        return;
    // All these cases will be handled at next sync update
    if (!i_target.isValid() || !i_target->IsInWorld() || !owner.isAlive() || owner.hasUnitState(UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_CONTROLLED)
            || (this->GetMovementGeneratorType() == CHASE_MOTION_TYPE && owner.hasUnitState(UNIT_STAT_NO_COMBAT_MOVEMENT))
            || static_cast<D*>(this)->_lostTarget(owner)
            || owner.IsNoMovementSpellCasted())
        return;

    // Lock async updates for safety, see Unit::asyncMovesplineLock doc
    ACE_Guard<ACE_Thread_Mutex> guard(owner.asyncMovesplineLock);
    _setTargetLocation(owner);
}

//-----------------------------------------------//
template<class T>
void ChaseMovementGenerator<T>::_reachTarget(T &owner)
{
    if (owner.CanReachWithMeleeAttack(this->i_target.getTarget()))
        owner.Attack(this->i_target.getTarget(), true);
}

template<>
void ChaseMovementGenerator<Player>::Initialize(Player &owner)
{
    owner.addUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);
    i_recalculateTravel = true;
    owner.GetMotionMaster()->SetNeedAsyncUpdate();
}

template<>
void ChaseMovementGenerator<Creature>::Initialize(Creature &owner)
{
    owner.SetWalk(false, false);
    owner.addUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);
    i_recalculateTravel = true;
    owner.GetMotionMaster()->SetNeedAsyncUpdate();
}

template<class T>
void ChaseMovementGenerator<T>::Finalize(T &owner)
{
    owner.clearUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);
    //MovementInform(owner);
}

template<class T>
void ChaseMovementGenerator<T>::Interrupt(T &owner)
{
    owner.clearUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::Reset(T &owner)
{
    Initialize(owner);
}

template<class T>
void ChaseMovementGenerator<T>::MovementInform(T& /*unit*/)
{
}

template<>
void ChaseMovementGenerator<Creature>::MovementInform(Creature& unit)
{
    if (!unit.isAlive())
        return;

    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit.AI())
        unit.AI()->MovementInform(CHASE_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());

    if (unit.IsTemporarySummon())
    {
        TemporarySummon* pSummon = (TemporarySummon*)(&unit);
        if (pSummon->GetSummonerGuid().IsCreature())
        {
            if (Creature* pSummoner = unit.GetMap()->GetCreature(pSummon->GetSummonerGuid()))
                if (pSummoner->AI())
                    pSummoner->AI()->SummonedMovementInform(&unit, CHASE_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
        }
        else
        {
            if (GameObject* pSummoner = unit.GetMap()->GetGameObject(pSummon->GetSummonerGuid()))
                if (pSummoner->AI())
                    pSummoner->AI()->SummonedMovementInform(&unit, CHASE_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
        }
    }
}

//-----------------------------------------------//
template<>
bool FollowMovementGenerator<Creature>::EnableWalking() const
{
    return i_target.isValid() && i_target->IsWalking();
}

template<>
bool FollowMovementGenerator<Player>::EnableWalking() const
{
    return false;
}

template<>
void FollowMovementGenerator<Player>::_updateSpeed(Player &/*u*/)
{
    // nothing to do for Player
}

template<>
void FollowMovementGenerator<Creature>::_updateSpeed(Creature &u)
{
    if (!i_target.isValid() || i_target->GetObjectGuid() != u.GetOwnerGuid())
        return;

    u.UpdateSpeed(MOVE_RUN, true);
    u.UpdateSpeed(MOVE_WALK, true);
    u.UpdateSpeed(MOVE_SWIM, true);
}

template<>
void FollowMovementGenerator<Player>::Initialize(Player &owner)
{
    owner.addUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner);
}

template<>
void FollowMovementGenerator<Creature>::Initialize(Creature &owner)
{
    owner.addUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner);
}

template<class T>
void FollowMovementGenerator<T>::Finalize(T &owner)
{
    owner.clearUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
    //MovementInform(owner);
}

template<class T>
void FollowMovementGenerator<T>::Interrupt(T &owner)
{
    owner.clearUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
}

template<class T>
void FollowMovementGenerator<T>::Reset(T &owner)
{
    Initialize(owner);
}

template<class T>
void FollowMovementGenerator<T>::MovementInform(T& /*unit*/)
{
}

template<>
void FollowMovementGenerator<Creature>::MovementInform(Creature& unit)
{
    if (!unit.isAlive())
        return;

    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit.AI())
        unit.AI()->MovementInform(FOLLOW_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());

    if (unit.IsTemporarySummon())
    {
        TemporarySummon* pSummon = (TemporarySummon*)(&unit);
        if (pSummon->GetSummonerGuid().IsCreature())
        {
            if (Creature* pSummoner = unit.GetMap()->GetCreature(pSummon->GetSummonerGuid()))
                if (pSummoner->AI())
                    pSummoner->AI()->SummonedMovementInform(&unit, FOLLOW_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
        }
        else
        {
            if (GameObject* pSummoner = unit.GetMap()->GetGameObject(pSummon->GetSummonerGuid()))
                if (pSummoner->AI())
                    pSummoner->AI()->SummonedMovementInform(&unit, FOLLOW_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
        }
    }
}

//-----------------------------------------------//
template void TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::_setTargetLocation(Player &);
template void TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::_setTargetLocation(Player &);
template void TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::_setTargetLocation(Creature &);
template void TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::_setTargetLocation(Creature &);
template bool TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::Update(Player &, const uint32 &);
template bool TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::Update(Player &, const uint32 &);
template bool TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::Update(Creature &, const uint32 &);
template bool TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::Update(Creature &, const uint32 &);
template void TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::UpdateAsync(Player &, uint32);
template void TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::UpdateAsync(Player &, uint32);
template void TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::UpdateAsync(Creature &, uint32);
template void TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::UpdateAsync(Creature &, uint32);

template void ChaseMovementGenerator<Player>::_reachTarget(Player &);
template void ChaseMovementGenerator<Creature>::_reachTarget(Creature &);
template void ChaseMovementGenerator<Player>::Finalize(Player &);
template void ChaseMovementGenerator<Creature>::Finalize(Creature &);
template void ChaseMovementGenerator<Player>::Interrupt(Player &);
template void ChaseMovementGenerator<Creature>::Interrupt(Creature &);
template void ChaseMovementGenerator<Player>::Reset(Player &);
template void ChaseMovementGenerator<Creature>::Reset(Creature &);
template void ChaseMovementGenerator<Player>::MovementInform(Player&);

template void FollowMovementGenerator<Player>::Finalize(Player &);
template void FollowMovementGenerator<Creature>::Finalize(Creature &);
template void FollowMovementGenerator<Player>::Interrupt(Player &);
template void FollowMovementGenerator<Creature>::Interrupt(Creature &);
template void FollowMovementGenerator<Player>::Reset(Player &);
template void FollowMovementGenerator<Creature>::Reset(Creature &);
template void FollowMovementGenerator<Player>::MovementInform(Player&);
