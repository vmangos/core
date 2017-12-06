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

#include "TemporarySummon.h"
#include "Log.h"
#include "CreatureAI.h"

TemporarySummon::TemporarySummon(ObjectGuid summoner) :
    Creature(CREATURE_SUBTYPE_TEMPORARY_SUMMON), m_type(TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN), m_timer(0), m_lifetime(0), m_summoner(summoner),
    m_forceTargetUpdateTimer(1000), m_unSummonInformed(false)
{
}

void TemporarySummon::Update(uint32 update_diff,  uint32 diff)
{
    switch (m_type)
    {
        case TEMPSUMMON_MANUAL_DESPAWN:
            break;
        case TEMPSUMMON_TIMED_DESPAWN:
        {
            if (m_timer <= update_diff)
            {
                UnSummon();
                return;
            }

            m_timer -= update_diff;
            break;
        }
        case TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT:
        {
            if (!isInCombat())
            {
                if (m_timer <= update_diff)
                {
                    UnSummon();
                    return;
                }

                m_timer -= update_diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;

            break;
        }
        case TEMPSUMMON_CORPSE_TIMED_DESPAWN:
        {
            if (IsCorpse())
            {
                if (m_timer <= update_diff)
                {
                    UnSummon();
                    return;
                }

                m_timer -= update_diff;
            }
            break;
        }
        case TEMPSUMMON_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (isDead())
            {
                UnSummon();
                return;
            }

            break;
        }
        case TEMPSUMMON_DEAD_DESPAWN:
        {
            if (IsDespawned())
            {
                UnSummon();
                return;
            }
            break;
        }
        case TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (isDead())
            {
                UnSummon();
                return;
            }

            if (!isInCombat())
            {
                if (m_timer <= update_diff)
                {
                    UnSummon();
                    return;
                }
                else
                    m_timer -= update_diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;
            break;
        }
        case TEMPSUMMON_TIMED_OR_DEAD_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (IsDespawned())
            {
                UnSummon();
                return;
            }

            if (!isInCombat() && isAlive())
            {
                if (m_timer <= update_diff)
                {
                    UnSummon();
                    return;
                }
                else
                    m_timer -= update_diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;
            break;
        }
        case TEMPSUMMON_TIMED_COMBAT_OR_CORPSE_DESPAWN:
        {
            if (isDead())
            {
                UnSummon();
                return;
            }
            if (m_timer <= update_diff)
            {
                if (!isInCombat())
                {
                    UnSummon();
                    return;
                }
                else
                    m_timer = 0;
            }
            else
                m_timer -= update_diff;
            break;
        }
        case TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN:
        {
            if (IsDespawned())
            {
                UnSummon();
                return;
            }

            // Reset timer when the mob dies
            if (!isAlive() && !m_justDied)
            {
                m_justDied = true;
                m_timer = m_lifetime;
            }

            if (m_timer <= update_diff)
            {
                // Prevent despawn while the mob is still in combat
                if (!isInCombat())
                {
                    UnSummon();
                    return;
                }
                else
                    m_timer = 0;
            }
            else
                m_timer -= update_diff;
            break;
        }
        default:
            UnSummon();
            sLog.outError("Temporary summoned creature (entry: %u) have unknown type %u of ", GetEntry(), m_type);
            break;
    }

    if (isAlive() && isInCombat())
    {
        if (m_forceTargetUpdateTimer <= diff)
        {
            m_forceTargetUpdateTimer = 3000;
            ForceValuesUpdateAtIndex(UNIT_FIELD_TARGET);
        }
        else
            m_forceTargetUpdateTimer -= diff;
    }
    else {
        m_forceTargetUpdateTimer = 1000;
    }

    Creature::Update(update_diff, diff);
}

void TemporarySummon::Summon(TempSummonType type, uint32 lifetime)
{
    m_type = type;
    m_timer = lifetime;
    m_lifetime = lifetime;

    AIM_Initialize();
    GetMap()->Add((Creature*)this);
}

void TemporarySummon::UnSummon(uint32 delayDespawnTime /*= 0*/)
{
    if (delayDespawnTime)
    {
        m_type = TEMPSUMMON_TIMED_DESPAWN;
        m_timer = delayDespawnTime;
    }
    else
    {
        CombatStop();

        InformSummonerOfDespawn();

        AddObjectToRemoveList();
    }
}

void TemporarySummon::InformSummonerOfDespawn()
{
    if (m_unSummonInformed)
        return;

    m_unSummonInformed = true;
    if (WorldObject* pSummoner = GetMap()->GetWorldObject(GetSummonerGuid()))
    {
        pSummoner->DecrementSummonCounter();

        if (Creature* cOwner = pSummoner->ToCreature())
            if (cOwner->AI())
                cOwner->AI()->SummonedCreatureDespawn(this);
    }
}

void TemporarySummon::CleanupsBeforeDelete()
{
    InformSummonerOfDespawn();

    Creature::CleanupsBeforeDelete();
}

TemporarySummon::~TemporarySummon()
{
    // If this object is deleted before being unsummoned, log an error.
    // By this stage it is too late to correctly unsummon the unit, since
    // we have already been removed from the map.
    if (!m_unSummonInformed)
        sLog.outError("TemporarySummon %s deleted before being unsummed - summoner will retain incorrect count", GetGuidStr().c_str());
}

void TemporarySummon::SaveToDB()
{
}
