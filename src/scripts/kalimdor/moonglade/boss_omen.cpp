/*
 * Copyright (C) 2010-2014 Anathema Script Engine project <http://valkyrie-wow.com/>
 */

#include "scriptPCH.h"
#include "boss_omen.h"

/*
 *
 */

boss_omenAI::boss_omenAI(Creature* pCreature) : ScriptedAI(pCreature)
{
    boss_omenAI::Reset();
}

void boss_omenAI::Reset()
{
    m_uiCleaveTimer = urand(8000, 12000);
    m_uiStarfallTimer = urand(8000, 12000);
}

void boss_omenAI::UpdateAI(const uint32 uiDiff)
{
    if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        return;

    if (m_uiCleaveTimer <= uiDiff)
    {
        if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
            m_uiCleaveTimer = urand(8000, 12000);
    }
    else
        m_uiCleaveTimer -= uiDiff;

    if (m_uiStarfallTimer <= uiDiff)
    {
        Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);

        if (DoCastSpellIfCan(target, SPELL_STARFALL) == CAST_OK)
            m_uiStarfallTimer = urand(8000, 12000);
    }
    else
        m_uiStarfallTimer -= uiDiff;

    DoMeleeAttackIfReady();
}

void boss_omenAI::SpellHit(Unit* /*pCaster*/, const SpellEntry* pSpellEntry)
{
    if (pSpellEntry->Id == SPELL_ELUNES_CANDLE)
    {
        // proofs required
        //if (m_uiStarfallTimer < 2000)
        //    m_uiStarfallTimer = 2000;

        DoCastSpellIfCan(m_creature, SPELL_SELF_DAMAGE, true);
    }      
}

void boss_omenAI::JustDied(Unit* /*pKiller*/)
{
    DoCastSpellIfCan(m_creature, SPELL_OMENS_MOONLIGHT);

    OmenData.m_uiNextRespawn = time(nullptr) + 15 * MINUTE;
    OmenData.m_bOmenAlive = false;
}

void boss_omenAI::OnFireworkLaunch(Unit* pSummoner)
{
    if (!OmenData.m_bOmenAlive)
    {
        ++OmenData.m_uiFireworksCount;

        if (OmenData.m_uiFireworksCount < 20)
            return;

        if (OmenData.m_uiNextRespawn < time(nullptr))
        {
            auto pOmen = pSummoner->SummonCreature(NPC_OMEN,
                OmenSummon.x,
                OmenSummon.y,
                OmenSummon.z,
                OmenSummon.o, TEMPSUMMON_DEAD_DESPAWN, 5 * MINUTE * IN_MILLISECONDS, true);

            if (pOmen)
            {
                OmenData.m_uiFireworksCount = 0;
                OmenData.m_bOmenAlive = true;
                pOmen->SetHomePosition(OmenHome.x, OmenHome.y, OmenHome.z, OmenHome.o);
                pOmen->GetMotionMaster()->MoveTargetedHome();

                sLog.outError("[Moonglade.Omen] Summoned.");
            }
            else
                sLog.outError("[Moonglade.Omen] Summon failed.");
        }
    }
}

CreatureAI* GetAI_boss_omen(Creature* creature)
{
    return new boss_omenAI(creature);
}

/*
 *
 */

struct npc_minion_of_omenAI : ScriptedAI
{
    explicit npc_minion_of_omenAI(Creature* creature) : ScriptedAI(creature)
    {

    }

    void Reset() override
    {

    }

    void SpellHit(Unit* /*pCaster*/, const SpellEntry* pSpellEntry) override
    {
        if (pSpellEntry->Id == SPELL_ELUNES_CANDLE)
        {
            DoCastSpellIfCan(m_creature, SPELL_FIREWORK_EFFECT);
        }
    }
};

CreatureAI* GetAI_npc_minion_of_omen(Creature* pCreature)
{
    return new npc_minion_of_omenAI(pCreature);
}

void AddSC_boss_omen()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_omen";
    pNewScript->GetAI = &GetAI_boss_omen;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_minion_of_omen";
    pNewScript->GetAI = &GetAI_npc_minion_of_omen;
    pNewScript->RegisterSelf();
}
