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

#include "TotemAI.h"
#include "Totem.h"
#include "Creature.h"
#include "DBCStores.h"
#include "SpellMgr.h"

#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"

int TotemAI::Permissible(const Creature *creature)
{
    if (creature->IsTotem())
        return PERMIT_BASE_PROACTIVE;

    return PERMIT_BASE_NO;
}

TotemAI::TotemAI(Creature *c) : CreatureAI(c)
{
    c->addUnitState(UNIT_STAT_IGNORE_MOVE_LOS);

    if (Totem const* pTotem = c->ToTotem())
    {
        m_spellId = pTotem->GetSpell();
        m_totemType = pTotem->GetTotemType();
    }  
    else
    {
        m_spellId = m_creature->GetCreatureInfo()->spells[0];
        SpellEntry const* totemSpell = sSpellMgr.GetSpellEntry(m_spellId);
        if (totemSpell && GetSpellCastTime(totemSpell))
            m_totemType = TOTEM_ACTIVE;
        else
        {
            m_totemType = TOTEM_PASSIVE;

            if (totemSpell && IsSpellAppliesAura(totemSpell))
                c->CastSpell(c, totemSpell, true);
        }
            
    }
}

void TotemAI::UpdateAI(const uint32 /*diff*/)
{
    if (m_totemType != TOTEM_ACTIVE)
        return;

    if (!m_creature->isAlive() || m_creature->IsNonMeleeSpellCasted(false))
        return;

    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(m_spellId);
    if (!spellInfo)
        return;

    SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(spellInfo->rangeIndex);
    float max_range = GetSpellMaxRange(srange);

    Unit* victim = m_creature->GetMap()->GetUnit(m_victimGuid);
    Unit* owner = m_creature->GetCharmerOrOwner();

    // Check owner's attackers for targets.
    if (!victim && owner)
        victim = owner->getAttackerForHelper();

    // Search for another target if current is invalid.
    if (!victim || !m_creature->IsWithinDistInMap(victim, max_range) ||
            !m_creature->IsValidAttackTarget(victim) || !victim->isVisibleForOrDetect(m_creature, m_creature, false))
    {
        victim = nullptr;

        MaNGOS::NearestAttackableUnitInObjectRangeCheck u_check(m_creature, m_creature, owner, max_range);
        MaNGOS::UnitLastSearcher<MaNGOS::NearestAttackableUnitInObjectRangeCheck> checker(victim, u_check);
        Cell::VisitAllObjects(m_creature, checker, max_range);
    }

    if (victim)
    {
        m_victimGuid = victim->GetObjectGuid();

        m_creature->SetInFront(victim);                      // client change orientation by self
        m_creature->CastSpell(victim, m_spellId, false);
    }
    else
        m_victimGuid.Clear();
}