/*
* Copyright (C) 2017-2018 Light's Hope <https://lightshope.org>
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

#include "PetEventAI.h"
#include "Pet.h"
#include "Player.h"

PetEventAI::PetEventAI(Creature* pCreature) : CreatureEventAI(pCreature)
{}

int PetEventAI::Permissible(Creature const* creature)
{
    if ((creature->GetAIName() == "PetEventAI") || (creature->IsPet() && (creature->GetAIName() == "EventAI")))
        return PERMIT_BASE_SPECIAL;

    return PERMIT_BASE_NO;
}

void PetEventAI::MoveInLineOfSight(Unit* pWho)
{
    if (m_creature->GetVictim())
        return;

    //Check for OOC LOS Event
    if (!m_bEmptyList)
        UpdateEventsOn_MoveInLineOfSight(pWho);

    if (m_creature->GetCharmInfo() && m_creature->GetCharmInfo()->IsReturning())
        return;

    if (m_creature->GetDistanceZ(pWho) > CREATURE_Z_ATTACK_RANGE)
        return;

    // World of Warcraft Client Patch 1.8.0 (2005-10-11)
    // - Guardians and pets in aggressive mode no longer attack civilians.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    if (m_creature->IsPet() && pWho->IsCreature() && static_cast<Creature*>(pWho)->IsCivilian())
        return;
#endif

    if (m_creature->CanInitiateAttack() && pWho->IsTargetableBy(m_creature))
    {
        float const attackRadius = m_creature->GetAttackDistance(pWho);
        if (m_creature->IsWithinDistInMap(pWho, attackRadius, true, SizeFactor::None) && m_creature->IsHostileTo(pWho) &&
            pWho->IsInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
            AttackStart(pWho);
    }
}

void PetEventAI::AttackStart(Unit* pWho)
{
    if (m_creature->IsPet() && !static_cast<Pet*>(m_creature)->IsEnabled())
        return;

    Unit* pOwner = m_creature->GetCharmerOrOwner();
    if (pWho == pOwner)
        return;

    if (m_creature->GetCharmInfo() && !m_creature->GetCharmInfo()->IsCommandAttack())
    {
        // Passive - passive pets can attack if told to
        if (m_creature->HasReactState(REACT_PASSIVE))
            return;

        // Player's pet should not attack PvP flagged target unless told to
        if (!m_creature->IsPvP() && pWho->IsPvP() && pOwner && pOwner->IsPlayer())
            return;

        // CC - mobs under crowd control can be attacked if owner commanded
        if (pWho->HasAuraPetShouldAvoidBreaking() && pOwner && pOwner->IsAlive())
            return;
    }

    if (m_creature->Attack(pWho, m_bMeleeAttack))
    {
        m_creature->AddThreat(pWho);
        m_creature->SetInCombatWith(pWho);
        pWho->SetInCombatWith(m_creature);

        if (pOwner && pOwner->IsPlayer())
        {
            if (!pOwner->IsInCombat())
            {
                if (m_creature->HasReactState(REACT_AGGRESSIVE))
                    m_creature->SendPetAIReaction();

                pOwner->SetInCombatWith(pWho);
                pWho->SetInCombatWith(pOwner);
            }
            
            if (!pOwner->IsPvP())
                pOwner->TogglePlayerPvPFlagOnAttackVictim(pWho);
        }

        if (m_bCombatMovement)
        {
            if (m_creature->GetCharmInfo())
                m_creature->GetCharmInfo()->SetIsReturning(false);
            m_creature->GetMotionMaster()->MoveChase(pWho);
        }   
    } 
}

Unit* PetEventAI::FindTargetForAttack() const
{
    if (Unit* pTaunter = m_creature->GetTauntTarget())
        return pTaunter;

    if (m_creature->CanHaveThreatList())
    {
        // Check for valid targets on threat list.
        if (!m_creature->GetThreatManager().isThreatListEmpty())
            if (Unit* pTarget = m_creature->GetThreatManager().getHostileTarget())
                if (!pTarget->HasAuraPetShouldAvoidBreaking())
                    return pTarget;
    }
    else if (!m_creature->GetAttackers().empty())
    {
        Unit* pAttacker = *(m_creature->GetAttackers().begin());
        if (pAttacker->IsInCombat() && m_creature->IsValidAttackTarget(pAttacker))
            return pAttacker;
    }

    Unit const* pOwner = m_creature->GetCharmerOrOwner();
    if (!pOwner)
        return nullptr;

    // Pet has no attackers, check for anyone attacking Owner.
    if (Unit* const pTarget = pOwner->GetAttackerForHelper())
    {
        // Prevent pets from breaking CC effects
        if (!pTarget->HasAuraPetShouldAvoidBreaking())
            return pTarget;
        else
        {
            // Main target is CC-ed, so pick another attacker.
            Unit::AttackerSet owner_attackers = pOwner->GetAttackers();
            for (const auto& itr : owner_attackers)
            {
                if (itr->IsInMap(m_creature) && m_creature->IsValidAttackTarget(itr) && !itr->HasAuraPetShouldAvoidBreaking())
                    return itr;
            }
        }
    }
    return nullptr;
}

void PetEventAI::UpdateAI(uint32 const uiDiff)
{
    //Must return if creature isn't alive. Normally select hostile target and get victim prevent this
    if (!m_creature->IsAlive())
        return;

    Unit const* pOwner = m_creature->GetCharmerOrOwner();
    bool const hasAliveOwner = pOwner && pOwner->IsAlive() && m_creature->GetCharmInfo();

    if (m_creature->IsInCombat() || (hasAliveOwner && pOwner->IsInCombat()))
        if (Unit* pVictim = FindTargetForAttack())
            if (pVictim != m_creature->GetVictim())
                AttackStart(pVictim);

    if (!m_bEmptyList)
        UpdateEventsOn_UpdateAI(uiDiff, m_creature->GetVictim());

    if (m_creature->GetVictim())
    {
        if (!m_CreatureSpells.empty())
            UpdateSpellsList(uiDiff);

        DoMeleeAttackIfReady();
    }
    else
    {
        if (m_creature->IsInCombat() && !(hasAliveOwner && pOwner->IsInCombat()))
            m_creature->OnLeaveCombat();

        if (hasAliveOwner && m_creature->GetCharmInfo()->HasCommandState(COMMAND_FOLLOW) && !m_creature->HasUnitState(UNIT_STAT_FOLLOW))
        {
            m_creature->GetMotionMaster()->MoveFollow(m_creature->GetCharmerOrOwner(), PET_FOLLOW_DIST,
                                                      m_creature->IsPet() ? static_cast<Pet*>(m_creature)->GetFollowAngle() : PET_FOLLOW_ANGLE);
            if (m_creature->GetCharmInfo())
                m_creature->GetCharmInfo()->SetIsReturning(true);
        }     
    }
}

void PetEventAI::OwnerAttackedBy(Unit* pAttacker)
{
    // Called when owner takes damage. This function helps keep pets from running off
    //  simply due to owner gaining aggro.

    // Prevent pet from disengaging from current target
    if (m_creature->GetVictim() && m_creature->GetVictim()->IsAlive())
        return;

    // If owner attacked by fire, attacker=owner. Don't attack our owner !
    if (!m_creature->IsValidAttackTarget(pAttacker))
        return;

    // Continue to evaluate and attack if necessary
    AttackStart(pAttacker);
}

void PetEventAI::OwnerAttacked(Unit* pTarget)
{
    // Called when owner attacks something. Allows defensive pets to know
    //  that they need to assist

    // Prevent pet from disengaging from current target
    if (m_creature->GetVictim() && m_creature->GetVictim()->IsAlive())
        return;

    if (!m_creature->IsValidAttackTarget(pTarget))
        return;

    // Continue to evaluate and attack if necessary
    AttackStart(pTarget);
}

void PetEventAI::MovementInform(uint32 moveType, uint32 data)
{
    CreatureEventAI::MovementInform(moveType, data);

    // Receives notification when pet reaches owner
    if (moveType == FOLLOW_MOTION_TYPE)
    {
        // If data is owner's GUIDLow then we've reached follow point,
        // otherwise we're probably chasing a creature.
        if (m_creature->GetCharmInfo() && m_creature->GetCharmInfo()->IsReturning() && data == m_creature->GetCharmerOrOwnerGuid().GetCounter())
        {
            m_creature->GetCharmInfo()->SetIsReturning(false);
        }
    }
}