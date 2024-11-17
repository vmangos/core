/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

#include "scriptPCH.h"
#include "molten_core.h"
#include "Utilities/EventMap.h"

enum Golemagg : uint32
{
    // Auras (set in db - creature_template)
    // SPELL_MAGMASPLASH         = 13879,
    // SPELL_GOLEMAGG_TRUST_AURA = 20556,
    // SPELL_DOUBLE_ATTACK       = 18943,

    // Spells
    SPELL_PYROBLAST      = 20228,
    SPELL_EARTHQUAKE     = 19798,
    SPELL_GOLEMAGG_TRUST = 20553,
    SPELL_ATTRACK_RAGER  = 20544,

    // Events
    EVENT_PYROBLAST      = 1,
    EVENT_EARTHQUAKE     = 2,
    EVENT_GOLEMAGG_TRUST = 3
};

struct boss_golemaggAI : public ScriptedAI
{
    explicit boss_golemaggAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = static_cast<ScriptedInstance*>(pCreature->GetInstanceData());
        boss_golemaggAI::Reset();
    }

    EventMap m_CombatEvents{};
    ScriptedInstance* m_pInstance{};
    std::list<ObjectGuid> m_addList;

    bool m_bEnraged = false;

    void Reset() override
    {
        m_bEnraged = false;
        m_CombatEvents.Reset();
        m_addList.clear();

        if (m_pInstance && m_creature->IsAlive())
        {
            m_pInstance->SetData(TYPE_GOLEMAGG, NOT_STARTED);
        }

        std::list<Creature*> addList;
        GetCreatureListWithEntryInGrid(addList, m_creature, NPC_CORE_RAGER, 250.0f);
        if (!addList.empty())
        {
            for (const auto& itr : addList)
            {
                if (itr->GetDeathState() == ALIVE)
                {
                    itr->DealDamage(itr, itr->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
                }

                itr->Respawn();
            }
        }
    }

    void Aggro(Unit*) override
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_GOLEMAGG, IN_PROGRESS);
        }

        // Store add guids
        std::list<Creature*> adds;
        GetCreatureListWithEntryInGrid(adds, m_creature, NPC_CORE_RAGER, 150.0f);
        m_addList.clear();
        for (const auto& itr : adds)
        {
            m_addList.push_back(itr->GetObjectGuid());
        }

        ScheduleCombatEvents();
    }

    void EnterEvadeMode() override
    {
        KillAdds(true);
        ScriptedAI::EnterEvadeMode();
    }

    void JustDied(Unit*) override
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_GOLEMAGG, DONE);
        }

        KillAdds(false);
    }

    void KillAdds(bool respawn)
    {
        if (!m_addList.empty())
        {
            for (const auto& itr : m_addList)
            {
                if (auto coreRager = m_creature->GetMap()->GetCreature(itr))
                {
                    coreRager->DisappearAndDie();
                    if (respawn)
                    {
                        coreRager->Respawn();
                    }
                }
            }
        }
    }

    void DamageTaken(Unit*, uint32& uiDamage) override
    {
        if (!m_bEnraged)
        {
            // At 10% health, Golemagg will Earthquake,
            // dealing Physical damage to all players every couple seconds.
            if (m_creature->GetHealthPercent() < 10.f)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_ATTRACK_RAGER) == CAST_OK)
                {
                    m_bEnraged = true;
                    m_CombatEvents.ScheduleEvent(EVENT_EARTHQUAKE, Seconds(5));
                }
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        {
            return;
        }

        m_CombatEvents.Update(uiDiff);
        UpdateEvents();

        DoMeleeAttackIfReady();
    }

    void ScheduleCombatEvents()
    {
        m_CombatEvents.ScheduleEvent(EVENT_PYROBLAST,      Seconds(7));
        m_CombatEvents.ScheduleEvent(EVENT_GOLEMAGG_TRUST, Seconds(10));
    }

    void UpdateEvents()
    {
        while (const uint32 eventId = m_CombatEvents.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_PYROBLAST:
                {
                    // Golemagg Pyroblasts a random player,
                    // dealing Fire damage and leaving an additional Fire DOT on them.
                    if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    {
                        if (DoCastSpellIfCan(pTarget, SPELL_PYROBLAST) == CAST_OK)
                        {
                            m_CombatEvents.Repeat(Seconds(7));
                            return;
                        }
                    }

                    // Cast Failed: Try again in 1s
                    m_CombatEvents.Repeat(Seconds(1));
                    return;
                }
                case EVENT_EARTHQUAKE:
                {
                    if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_EARTHQUAKE) == CAST_OK)
                    {
                        m_CombatEvents.Repeat(Seconds(5));
                        return;
                    }

                    // Cast Failed: Try again in 1s
                    m_CombatEvents.Repeat(Seconds(1));
                    return;
                }
                case EVENT_GOLEMAGG_TRUST:
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_GOLEMAGG_TRUST) == CAST_OK)
                    {
                        m_CombatEvents.Repeat(Seconds(2));
                        return;
                    }
                    // Cast Failed: Try again in 1s
                    m_CombatEvents.Repeat(Seconds(1));
                    return;
                }
            }
        }
    }
};

CreatureAI* GetAI_boss_golemagg(Creature* pCreature)
{
    return new boss_golemaggAI(pCreature);
}

enum CoreRager : uint32
{
    // Spells
    // SPELL_TRASH    = 3391, // Custom?
    SPELL_MANGLE      = 19820,
    SPELL_FULL_HEAL   = 17683,

    // Texts
    EMOTE_LOWHP       = 7865,

    // Events
    EVENT_MANGLE      = 1,
    EVENT_TRASH       = 2,
    EVENT_CHECK_LEASH = 3
};

struct mob_core_ragerAI : public ScriptedAI
{
    explicit mob_core_ragerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = static_cast<ScriptedInstance*>(pCreature->GetInstanceData());
        Reset();
    }

    EventMap m_CombatEvents{};
    ScriptedInstance* m_pInstance{};

    void Reset() override
    {
        m_CombatEvents.Reset();
    }

    void Aggro(Unit*) override
    {
        ScheduleCombatEvents();
    }

    void DamageTaken(Unit*, uint32& uiDamage) override
    {
        if (!m_pInstance)
        {
            return;
        }

        if (m_pInstance->GetData(TYPE_GOLEMAGG) == DONE)
        {
            return;
        }

        if (m_creature->HealthBelowPctDamaged(50, uiDamage))
        {
            uiDamage = 0;
            DoScriptText(EMOTE_LOWHP, m_creature);
            SpellCastResult result = DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FULL_HEAL);
            if (result != CAST_OK)
            {
                m_creature->SetHealth(m_creature->GetMaxHealth());
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        {
            return;
        }

        m_CombatEvents.Update(uiDiff);
        UpdateEvents();

        DoMeleeAttackIfReady();
    }

    void ScheduleCombatEvents()
    {
        // m_CombatEvents.ScheduleEvent(EVENT_TRASH,    Seconds(1));
        m_CombatEvents.ScheduleEvent(EVENT_MANGLE,      Seconds(7));
        m_CombatEvents.ScheduleEvent(EVENT_CHECK_LEASH, Seconds(3));
    }

    void UpdateEvents()
    {
        while (const uint32 eventId = m_CombatEvents.ExecuteEvent())
        {
            switch (eventId)
            {
                /*
                case EVENT_TRASH:
                {
                    if (!m_creature->HasAura(SPELL_TRASH))
                    {
                        m_creature->CastSpell(m_creature, SPELL_TRASH, true);
                    }

                    m_CombatEvents.Repeat(Seconds(urand(1, 10)));
                    return;
                }
                */
                case EVENT_MANGLE:
                {
                    if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MANGLE) == CAST_OK)
                    {
                        m_CombatEvents.Repeat(Seconds(10));
                        return;
                    }

                    // Cast Failed: Try again in 1s
                    m_CombatEvents.Repeat(Seconds(1));
                    return;
                }
                case EVENT_CHECK_LEASH:
                {
                    if (Creature* pGolemagg = m_pInstance->instance->GetCreature(m_pInstance->GetData64(DATA_GOLEMAGG)))
                    {
                        if (m_creature->GetDistance2d(pGolemagg) > 100.f)
                        {
                            if (auto pGolemaggAI = dynamic_cast<boss_golemaggAI*>(pGolemagg->AI()))
                            {
                                pGolemaggAI->EnterEvadeMode();
                            }
                        }
                    }

                    m_CombatEvents.Repeat(Seconds(3));
                    return;
                }
            }
        }
    }
};

CreatureAI* GetAI_mob_core_rager(Creature* pCreature)
{
    return new mob_core_ragerAI(pCreature);
}

void AddSC_boss_golemagg()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_golemagg";
    newscript->GetAI = &GetAI_boss_golemagg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_core_rager";
    newscript->GetAI = &GetAI_mob_core_rager;
    newscript->RegisterSelf();
}
