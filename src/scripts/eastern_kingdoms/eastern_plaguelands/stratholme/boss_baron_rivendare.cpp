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
SDName: Boss_Baron_Rivendare
SD%Complete: 70
SDComment: aura applied/defined in database
SDCategory: Stratholme
EndScriptData */

#include "scriptPCH.h"
#include "stratholme.h"

#define SAY_0    "Intruders! More pawns of the Argent Dawn, no doubt. I already count one of their number among my prisoners. Withdraw from my domain before she is executed!"
#define SAY_1    "You're still here? Your foolishness is amusing! The Argent Dawn wench needn't suffer in vain. Leave at once and she shall be spared!"
#define SAY_2    "I shall take great pleasure in taking this poor wretch's life! It's not too late, she needn't suffer in vain. Turn back and her death shall be merciful!"
#define SAY_3    "May this prisoner's death serve as a warning. None shall defy the Scourge and live!"
#define SAY_4    "So you see fit to toy with the Lich King's creations? Ramstein, be sure to give the intruders a proper greeting."
#define SAY_5    "Time to take matters into my own hands. Come. Enter my domain and challenge the might of the Scourge!"

#define ADD_1X 4017.403809f
#define ADD_1Y -3339.703369f
#define ADD_1Z 115.057655f
#define ADD_1O 5.487860f

#define ADD_2X 4013.189209f
#define ADD_2Y -3351.808350f
#define ADD_2Z 115.052254f
#define ADD_2O 0.134280f

#define ADD_3X 4017.738037f
#define ADD_3Y -3363.478016f
#define ADD_3Z 115.057274f
#define ADD_3O 0.723313f

#define ADD_4X 4048.877197f
#define ADD_4Y -3363.223633f
#define ADD_4Z 115.054253f
#define ADD_4O 3.627735f

#define ADD_5X 4051.777588f
#define ADD_5Y -3350.893311f
#define ADD_5Z 115.055351f
#define ADD_5O 3.066176f

#define ADD_6X 4048.375977f
#define ADD_6Y -3339.966309f
#define ADD_6Z 115.055222f
#define ADD_6O 2.457497f

#define SPELL_SHADOWBOLT    15537
#define SPELL_CLEAVE        15284
#define SPELL_MORTALSTRIKE  19643

#define SPELL_UNHOLY_AURA   17467
#define SPELL_RAISEDEAD     17473                           //triggers death pact (17471)

#define SPELL_RAISE_DEAD1   17475
#define SPELL_RAISE_DEAD2   17476
#define SPELL_RAISE_DEAD3   17477
#define SPELL_RAISE_DEAD4   17478
#define SPELL_RAISE_DEAD5   17479
#define SPELL_RAISE_DEAD6   17480

struct boss_baron_rivendareAI : public ScriptedAI
{
    boss_baron_rivendareAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Engaged = false;
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 ShadowBolt_Timer;
    uint32 Cleave_Timer;
    uint32 MortalStrike_Timer;
    uint32 SummonSkeletons_Timer;
    Creature *Summoned;
    bool Engaged;
    bool RaiseDeadCasted;

    void Reset()
    {
        ShadowBolt_Timer = 5000;
        Cleave_Timer = 8000;
        MortalStrike_Timer = 12000;
        SummonSkeletons_Timer = 15000;

        RaiseDeadCasted = false;

        if (Engaged)
            m_pInstance->SetData(TYPE_BARON, FAIL);
        Engaged = false;
    }

    void Aggro(Unit *who)
    {
        Engaged = true;
        if (m_pInstance)
            m_pInstance->SetData(TYPE_BARON, IN_PROGRESS);
    }

    void JustSummoned(Creature* summoned)
    {
        if (summoned && m_creature->getVictim())
            summoned->AI()->AttackStart(m_creature->getVictim());
    }

    void JustDied(Unit* Killer)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_BARON, DONE);
    }

    void SpellHitTarget(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == 17471) //Death Pact
        {
            if (pCaster->GetTypeId() != TYPEID_PLAYER)
                pCaster->getThreatManager().modifyThreatPercent(m_creature, -100);
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        GameObject* pCircle = m_creature->FindNearestGameObject(176631, 33.0f); // Menethil's Gift (cercle au milieu de la pièce du baron)

        if (!pCircle)
        {
            m_creature->MonsterYell("Cheater ! Un ban, ca vous dit ?", 0);
            EnterEvadeMode();
        }

        //ShadowBolt
        if (ShadowBolt_Timer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOWBOLT) == CAST_OK)
                    ShadowBolt_Timer = 10000;
        }
        else ShadowBolt_Timer -= diff;

        //Cleave
        if (Cleave_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                Cleave_Timer = urand(7000, 17000);
        }
        else Cleave_Timer -= diff;

        //MortalStrike
        if (MortalStrike_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORTALSTRIKE) == CAST_OK)
                MortalStrike_Timer = urand(10000, 25000);
        }
        else MortalStrike_Timer -= diff;

        //SummonSkeletons
        if (SummonSkeletons_Timer < diff)
        {
            if (!RaiseDeadCasted)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_RAISEDEAD) == CAST_OK)
                {
                    m_creature->MonsterTextEmote("Baron Rivendare raises an undead servant back to life!");
                    SummonSkeletons_Timer = 1000;
                    RaiseDeadCasted = true;
                }
            }
            else
            {
                m_creature->SummonCreature(11197, ADD_1X, ADD_1Y, ADD_1Z, ADD_1O, TEMPSUMMON_TIMED_DESPAWN, 13000);
                m_creature->SummonCreature(11197, ADD_2X, ADD_2Y, ADD_2Z, ADD_2O, TEMPSUMMON_TIMED_DESPAWN, 13000);
                m_creature->SummonCreature(11197, ADD_3X, ADD_3Y, ADD_3Z, ADD_3O, TEMPSUMMON_TIMED_DESPAWN, 13000);
                m_creature->SummonCreature(11197, ADD_4X, ADD_4Y, ADD_4Z, ADD_4O, TEMPSUMMON_TIMED_DESPAWN, 13000);
                m_creature->SummonCreature(11197, ADD_5X, ADD_5Y, ADD_5Z, ADD_5O, TEMPSUMMON_TIMED_DESPAWN, 13000);
                m_creature->SummonCreature(11197, ADD_6X, ADD_6Y, ADD_6Z, ADD_6O, TEMPSUMMON_TIMED_DESPAWN, 13000);

                SummonSkeletons_Timer = 15000;
                RaiseDeadCasted = false;
            }
        }
        else SummonSkeletons_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_baron_rivendare(Creature* pCreature)
{
    return new boss_baron_rivendareAI(pCreature);
}

void AddSC_boss_baron_rivendare()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_baron_rivendare";
    newscript->GetAI = &GetAI_boss_baron_rivendare;
    newscript->RegisterSelf();
}
