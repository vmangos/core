/*
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

#include "BasicAI.h"
#include "Creature.h"
#include "Player.h"
#include "Map.h"
#include "GuardMgr.h"

BasicAI::BasicAI(Creature* c) : CreatureAI(c), m_bCanSummonGuards(c->CanSummonGuards())
{}

int BasicAI::Permissible(Creature const* creature)
{
    return PERMIT_BASE_NORMAL;
}

bool BasicAI::IsProximityAggroAllowedFor(Unit* pTarget) const
{
    if (!m_creature->GetVictim())
        return true;

    // Allow this case for summoning guards against player we are in combat with.
    if (m_creature->GetVictim() == pTarget)
        return true;

    if (m_creature->GetMap()->IsDungeon())
        return true;

    if (Player* pNearPlayer = pTarget->ToPlayer())
    {
        if (Player* pVictimPlayer = m_creature->GetVictim()->ToPlayer())
        {
            if (pNearPlayer->GetGroup() &&
                pNearPlayer->GetGroup() == pVictimPlayer->GetGroup())
                return true;
        }
    }

    return false;
}

void BasicAI::MoveInLineOfSight(Unit* pWho)
{
    // Check this now to prevent calling expensive functions (IsInAccessablePlaceFor / IsWithinLOSInMap)
    if (!IsProximityAggroAllowedFor(pWho))
        return;

    bool const canInitiateAttack = pWho != m_creature->GetVictim() && m_creature->CanInitiateAttack();
    bool const canSummonGuard = pWho->IsPlayer() && CanSummonGuards();

    if (!canInitiateAttack && !canSummonGuard)
        return;

    if (!m_creature->CanFly() && m_creature->GetDistanceZ(pWho) > CREATURE_Z_ATTACK_RANGE)
        return;

    float const maxDistance = canInitiateAttack ? m_creature->GetAttackDistance(pWho) : m_creature->GetDetectionRange();

    if (m_creature->IsWithinDistInMap(pWho, maxDistance, true, false) &&
        pWho->IsTargetableBy(m_creature) && m_creature->IsHostileTo(pWho) &&
        m_creature->IsWithinLOSInMap(pWho) && pWho->IsInAccessablePlaceFor(m_creature))
    {
        if (canInitiateAttack)
            m_creature->EnterCombatWithTarget(pWho);
        else if (canSummonGuard)
            SummonGuard(pWho);
    }
}

void BasicAI::JustRespawned()
{
    if (m_creature->CanSummonGuards())
        m_bCanSummonGuards = true;

    CreatureAI::JustRespawned();
}

void BasicAI::SummonedCreatureDespawn(Creature* pSummon)
{
    if (m_creature->CanSummonGuards() && pSummon->IsGuard())
        m_bCanSummonGuards = true;
}

void BasicAI::UpdateAI(uint32 const uiDiff)
{
    if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        return;

    if (!m_CreatureSpells.empty())
        UpdateSpellsList(uiDiff);

    DoMeleeAttackIfReady();
}

void BasicAI::SummonGuard(Unit* pEnemy)
{
    m_bCanSummonGuards = !sGuardMgr.SummonGuard(m_creature, pEnemy);
}
