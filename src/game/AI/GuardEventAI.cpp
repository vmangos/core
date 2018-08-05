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

#include "GuardEventAI.h"

GuardEventAI::GuardEventAI(Creature* pCreature) : CreatureEventAI(pCreature)
{}

int GuardEventAI::Permissible(const Creature *creature)
{
    if ((creature->GetAIName() == "GuardEventAI") || (creature->IsGuard() && (creature->GetAIName() == "EventAI")))
        return PERMIT_BASE_SPECIAL;

    return PERMIT_BASE_NO;
}

// Returns whether the Unit is currently attacking other players or friendly npcs.
bool GuardEventAI::IsAttackingPlayerOrFriendly(const Unit* pWho) const
{
    if (pWho->isAttackingPlayer())
        return true;

    if (Unit* pVictim = pWho->getVictim())
    {
        if (m_creature->IsFriendlyTo(pVictim) || pVictim->isTaxi())
            return true;
    }

    return false;
}

void GuardEventAI::MoveInLineOfSight(Unit *pWho)
{
    if (!pWho)
        return;

    if (m_creature->getVictim())
        return;

    // Check for OOC LOS Event
    if (!m_bEmptyList)
        UpdateEventsOn_MoveInLineOfSight(pWho);

    // Ignore Z for flying creatures
    if (!m_creature->CanFly() && pWho->IsCreature() && m_creature->GetDistanceZ(pWho) > CREATURE_Z_ATTACK_RANGE)
        return;

    float attackRadius = m_creature->GetAttackDistance(pWho);

    bool isAttackingFriend = false;

    if (pWho->IsPlayer() && !m_creature->IsFriendlyTo(pWho))
    {
        // Assignment, not a typo.
        if (isAttackingFriend = IsAttackingPlayerOrFriendly(pWho))
            if ((attackRadius < 30.0f))
                attackRadius = 30.0f;
    }

    if (!m_creature->IsWithinDistInMap(pWho, attackRadius))
        return;

    if (m_creature->CanInitiateAttack() && pWho->isTargetableForAttack() &&
        (pWho->IsHostileToPlayers() || m_creature->IsHostileTo(pWho) || isAttackingFriend) &&
        pWho->isInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
    {
        AttackStart(pWho);
    }
}

void GuardEventAI::EnterCombat(Unit *pWho)
{
    CreatureEventAI::EnterCombat(pWho);
    m_creature->CallForHelp(30.0f);
}

void GuardEventAI::JustDied(Unit *pKiller)
{
    CreatureEventAI::JustDied(pKiller);

    if (Player* pPlayerKiller = pKiller->GetCharmerOrOwnerPlayerOrPlayerItself())
        m_creature->SendZoneUnderAttackMessage(pPlayerKiller);
}