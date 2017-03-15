/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

#include "IdleMovementGenerator.h"
#include "CreatureAI.h"
#include "Creature.h"

IdleMovementGenerator si_idleMovement;

void
IdleMovementGenerator::Reset(Unit& /*owner*/)
{
}

void
DistractMovementGenerator::Initialize(Unit& owner)
{
    // Distracted creatures stand up if not standing
    if (!owner.IsStandState())
        owner.SetStandState(UNIT_STAND_STATE_STAND);

    owner.addUnitState(UNIT_STAT_DISTRACTED);
}

void
DistractMovementGenerator::Finalize(Unit& owner)
{
    // If this is a creature, then return orientation to original position (for idle movement creatures)
    if (owner.GetTypeId() == TYPEID_UNIT && owner.ToCreature())
    {
        float angle = owner.ToCreature()->GetHomePositionO();
        owner.SetFacingTo(angle);
    }

    owner.clearUnitState(UNIT_STAT_DISTRACTED);
}

void
DistractMovementGenerator::Reset(Unit& owner)
{
    Initialize(owner);
}

void
DistractMovementGenerator::Interrupt(Unit& /*owner*/)
{
}

bool
DistractMovementGenerator::Update(Unit& /*owner*/, const uint32& time_diff)
{
    if (time_diff > m_timer)
        return false;

    m_timer -= time_diff;
    return true;
}

void
AssistanceDistractMovementGenerator::Finalize(Unit &unit)
{
    unit.clearUnitState(UNIT_STAT_DISTRACTED);
    if (Unit* victim = unit.getVictim())
    {
        if (unit.isAlive())
        {
            unit.AttackStop(true);
            ((Creature*)&unit)->AI()->AttackStart(victim);
        }
    }
}
