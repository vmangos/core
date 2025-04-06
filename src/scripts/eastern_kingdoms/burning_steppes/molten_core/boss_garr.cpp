#include "scriptPCH.h"
#include "molten_core.h"
#include "Utilities/EventMap.h"

enum Garr : uint32
{
    // Spells
    SPELL_ANTIMAGICPULSE     = 19492,
    SPELL_MAGMASHACKLES      = 19496,
    SPELL_ENRAGE             = 19516, // stacks up to 10 times
    SPELL_SEPARATION_ANXIETY = 23487,
    SPELL_ERUPTION_TRIGGER   = 20482,
    SPELL_ENRAGE_TRIGGER     = 19515,

    // Texts
    EMOTE_MASSIVE_ERUPTION  = 8254,

    // Events
    EVENT_ANTIMAGICPULSE    = 1,
    EVENT_MAGMASHACKLES     = 2,
    EVENT_MASSIVE_ERUPTION  = 3
};

struct boss_garrAI : ScriptedAI
{
    explicit boss_garrAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = static_cast<ScriptedInstance*>(pCreature->GetInstanceData());
        Reset();
    }

    EventMap m_CombatEvents;
    ScriptedInstance* m_pInstance;
    std::vector<ObjectGuid> m_lFiresworn;

    void Reset() override
    {
        m_CombatEvents.Reset();
        m_lFiresworn.clear();

        if (m_creature->IsAlive() && m_pInstance && m_pInstance->GetData(TYPE_GARR) != DONE)
        {
            m_pInstance->SetData(TYPE_GARR, NOT_STARTED);
        }
    }

    void Aggro(Unit* /*pWho*/) override
    {
        if (!m_pInstance)
        {
            return;
        }

        if (m_pInstance->GetData(TYPE_GARR) == DONE)
        {
            m_creature->DeleteLater();
            return;
        }

        m_pInstance->SetData(TYPE_GARR, IN_PROGRESS);
        m_creature->SetInCombatWithZone();

        // Store add guids
        std::list<Creature*> adds;
        GetCreatureListWithEntryInGrid(adds, m_creature, NPC_FIRESWORN, 150.0f);
        m_lFiresworn.clear();
        for (const auto& itr : adds)
        {
            m_lFiresworn.push_back(itr->GetObjectGuid());

            if (Creature* pAdd = m_creature->GetMap()->GetCreature(itr->GetObjectGuid()))
            {
                DoCastSpellIfCan(pAdd, SPELL_SEPARATION_ANXIETY, CF_TRIGGERED | CF_AURA_NOT_PRESENT);
            }
        }

        ScheduleCombatEvents();
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_GARR, DONE);
        }
    }

    void SpellHit(SpellCaster* /*pCaster*/, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_ENRAGE_TRIGGER)
        {
            DoCastSpellIfCan(m_creature, SPELL_ENRAGE, CF_TRIGGERED);
        }
    }

    void FireswornJustDied(ObjectGuid addGuid)
    {
        // Remove add from guid list and cast enrage on self
        auto it = std::find(m_lFiresworn.begin(), m_lFiresworn.end(), addGuid);
        if (it != m_lFiresworn.end())
        {
            m_lFiresworn.erase(it);
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        {
            return;
        }

        m_CombatEvents.Update(diff);
        UpdateEvents();

        DoMeleeAttackIfReady();
    }

    void ScheduleCombatEvents()
    {
        m_CombatEvents.RescheduleEvent(EVENT_ANTIMAGICPULSE,   Seconds(15));
        m_CombatEvents.RescheduleEvent(EVENT_MAGMASHACKLES,    Seconds(10));
        m_CombatEvents.RescheduleEvent(EVENT_MASSIVE_ERUPTION, Minutes(6));
    }

    void UpdateEvents()
    {
        while (uint32 const eventId = m_CombatEvents.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_ANTIMAGICPULSE:
                {
                    // Garr lets out anti-magic pulses, removing a beneficial effect from players in the raid.
                    if (DoCastSpellIfCan(m_creature, SPELL_ANTIMAGICPULSE) == CAST_OK)
                    {
                        m_CombatEvents.Repeat(Seconds(urand(15, 20)));
                        return;
                    }

                    // Cast Failed: Try again in 1s
                    m_CombatEvents.Repeat(Seconds(1));
                    return;
                }
                case EVENT_MAGMASHACKLES:
                {
                    // Garr reduces the movement speed of nearby enemies by 60% for 15 seconds.
                    if (DoCastSpellIfCan(m_creature, SPELL_MAGMASHACKLES) == CAST_OK)
                    {
                        m_CombatEvents.Repeat(Seconds(urand(10, 15)));
                        return;
                    }

                    // Cast Failed: Try again in 1s
                    m_CombatEvents.Repeat(Seconds(1));
                    return;
                }
                case EVENT_MASSIVE_ERUPTION:
                {
                    // After 6 minutes, Garr will let his adds explode and deal massive damage.
                    // Every further 20s in fight, another add will explode.
                    if (!m_lFiresworn.empty())
                    {
                        uint32 const randomIndex = urand(0, m_lFiresworn.size() - 1);
                        if (auto pRandomFiresworn = m_creature->GetMap()->GetCreature(m_lFiresworn[randomIndex]))
                        {
                            if (!pRandomFiresworn->HasAuraType(SPELL_AURA_MOD_STUN))
                            {
                                DoScriptText(EMOTE_MASSIVE_ERUPTION, m_creature);
                                m_creature->CastSpell(pRandomFiresworn, SPELL_ERUPTION_TRIGGER, true);
                            }
                        }
                    }
                    m_CombatEvents.Repeat(Seconds(20));
                    return;
                }
            }
        }
    }
};

CreatureAI* GetAI_boss_garr(Creature* pCreature)
{
    return new boss_garrAI(pCreature);
}

enum GarrAdds : uint32
{
    // Spells
    SPELL_THRASH            = 3391,
    SPELL_IMMOLATE          = 15732,
    SPELL_ADD_ERUPTION      = 19497,
    SPELL_MASSIVE_ERUPTION  = 20483,

    // Events
    EVENT_IMMOLATE = 1
};

struct mob_fireswornAI : ScriptedAI
{
    explicit mob_fireswornAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = static_cast<ScriptedInstance*>(pCreature->GetInstanceData());
        mob_fireswornAI::Reset();
    }

    EventMap m_CombatEvents;
    ScriptedInstance* m_pInstance;

    bool m_bForceExplosion;

    void Reset() override
    {
        m_bForceExplosion = false;
        m_CombatEvents.Reset();
    }

    void Aggro(Unit* /*pWho*/) override
    {
        DoCastSpellIfCan(m_creature, SPELL_THRASH, CF_TRIGGERED | CF_AURA_NOT_PRESENT);
        m_creature->SetInCombatWithZone();
        ScheduleCombatEvents();
    }

    void JustDied(Unit*) override
    {
        if (!m_pInstance)
        {
            return;
        }

        // Garr gains 9% attack speed for every Firesworn slain.
        if (Creature* pGarr = m_pInstance->GetSingleCreatureFromStorage(NPC_GARR))
        {
            if (pGarr->IsAlive())
            {
                DoCastSpellIfCan(pGarr, SPELL_ENRAGE_TRIGGER, CF_TRIGGERED);
                if (auto pGarrAI = dynamic_cast<boss_garrAI*>(pGarr->AI()))
                {
                    pGarrAI->FireswornJustDied(m_creature->GetObjectGuid());
                }
            }
        }

        if (!m_bForceExplosion)
        {
            // On death, Firesworns will explode, dealing massive Fire damage and knocking players back.
            m_creature->CastSpell(m_creature, SPELL_ADD_ERUPTION, true);
        }
    }

    void SpellHit(SpellCaster* /*pCaster*/, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_ERUPTION_TRIGGER)
        {
            m_bForceExplosion = true;
            m_creature->CastSpell(m_creature, SPELL_MASSIVE_ERUPTION, true);
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        {
            return;
        }

        m_CombatEvents.Update(diff);
        UpdateEvents();

        DoMeleeAttackIfReady();
    }

    void ScheduleCombatEvents()
    {
        m_CombatEvents.RescheduleEvent(EVENT_IMMOLATE, Seconds(10));
    }

    void UpdateEvents()
    {
        while (const uint32 eventId = m_CombatEvents.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_IMMOLATE:
                {
                    if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_IMMOLATE) == CAST_OK)
                    {
                        m_CombatEvents.Repeat(Seconds(20));
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

CreatureAI* GetAI_mob_firesworn(Creature* pCreature)
{
    return new mob_fireswornAI(pCreature);
}

void AddSC_boss_garr()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_garr";
    newscript->GetAI = &GetAI_boss_garr;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_firesworn";
    newscript->GetAI = &GetAI_mob_firesworn;
    newscript->RegisterSelf();
}
