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

/* ScriptData
SDName: Boss_Loatheb
SD%Complete: 100
SDComment:
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    SPELL_CORRUPTED_MIND  = 29198,
    SPELL_POISON_AURA     = 29865,
    SPELL_INEVITABLE_DOOM = 29204,
    SPELL_REMOVE_CURSE    = 30281
};

#define ADD_1X 2957.040f
#define ADD_1Y -3997.590f
#define ADD_1Z 274.280f

#define ADD_2X 2909.130f
#define ADD_2Y -4042.970f
#define ADD_2Z 274.280f

#define ADD_3X 2861.102f
#define ADD_3Y -3997.901f
#define ADD_3Z 274.280f

struct boss_loathebAI : public ScriptedAI
{
    boss_loathebAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint32 m_uiCorruptedMindTimer;
    uint32 m_uiPoisonAuraTimer;
    uint32 m_uiInevitableDoomTimer;
    uint32 m_uiInevitableDoom5minsTimer;
    uint32 m_uiRemoveCurseTimer;
    uint32 m_uiSummonTimer;

    void Reset()
    {
        m_uiCorruptedMindTimer = 4000;
        m_uiPoisonAuraTimer = 2500;
        m_uiInevitableDoomTimer = 120000;
        m_uiInevitableDoom5minsTimer = 300000;
        m_uiRemoveCurseTimer = 30000;
        m_uiSummonTimer = 8000;
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_LOATHEB, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_LOATHEB, DONE);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Corrupted Mind
        if (m_uiCorruptedMindTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_CORRUPTED_MIND);
            m_uiCorruptedMindTimer = 62000;
        }
        else
            m_uiCorruptedMindTimer -= uiDiff;

        // Poison Aura
        if (m_uiPoisonAuraTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_POISON_AURA);
            m_uiPoisonAuraTimer = 60000;
        }
        else
            m_uiPoisonAuraTimer -= uiDiff;

        // Inevitable Doom
        if (m_uiInevitableDoomTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_INEVITABLE_DOOM);
            m_uiInevitableDoomTimer = 120000;
        }
        else
            m_uiInevitableDoomTimer -= uiDiff;

        // Inevitable Doom 5mins
        if (m_uiInevitableDoom5minsTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_INEVITABLE_DOOM);
            m_uiInevitableDoom5minsTimer = 15000;
        }
        else
            m_uiInevitableDoom5minsTimer -= uiDiff;

        // Remove Curse
        if (m_uiRemoveCurseTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, SPELL_REMOVE_CURSE);
            m_uiRemoveCurseTimer = 30000;
        }
        else
            m_uiRemoveCurseTimer -= uiDiff;

        // Summon
        if (m_uiSummonTimer < uiDiff)
        {
            Unit* pSummonedSpores = NULL;

            pSummonedSpores = m_creature->SummonCreature(16286, ADD_1X, ADD_1Y, ADD_1Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 80000);
            pSummonedSpores = m_creature->SummonCreature(16286, ADD_2X, ADD_2Y, ADD_2Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 80000);
            pSummonedSpores = m_creature->SummonCreature(16286, ADD_3X, ADD_3Y, ADD_3Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 80000);
            if (pSummonedSpores)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    pSummonedSpores->AddThreat(pTarget);
            }

            m_uiSummonTimer = 28000;
        }
        else
            m_uiSummonTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_loatheb(Creature* pCreature)
{
    return new boss_loathebAI(pCreature);
}

void AddSC_boss_loatheb()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_loatheb";
    NewScript->GetAI = &GetAI_boss_loatheb;
    NewScript->RegisterSelf();
}
