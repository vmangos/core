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
SDName: Boss_Ramstein_the_Gorger
SD%Complete: 70
SDComment:
SDCategory: Stratholme
EndScriptData */

#include "scriptPCH.h"
#include "stratholme.h"

#define SPELL_TRAMPLE       5568
#define SPELL_KNOCKOUT      17307

#define C_MINDLESS_UNDEAD   11030

struct boss_ramstein_the_gorgerAI : public ScriptedAI
{
    boss_ramstein_the_gorgerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Engaged = false;
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 Trample_Timer;
    uint32 Knockout_Timer;
    bool Engaged;

    void Reset()
    {
        Trample_Timer = 3000;
        Knockout_Timer = 12000;
        if (Engaged)
            m_pInstance->SetData(TYPE_RAMSTEIN, FAIL);
        Engaged = false;
    }

    void Aggro(Unit *who)
    {
        Engaged = true;
        if (m_pInstance)
            m_pInstance->SetData(TYPE_RAMSTEIN, IN_PROGRESS);
    }

    void JustDied(Unit* Killer)
    {
        for (uint8 i = 0; i < 25; ++i)
        {
            if (Creature* temp_skeleton =  m_creature->SummonCreature(C_MINDLESS_UNDEAD, 3969.35f + float(urand(1, 15)), -3391.87f + float(urand(1, 15)), 119.11f, 5.91f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1800000))
            {
                temp_skeleton->GetMotionMaster()->MovePoint(0, 4033.34f, -3419.75f, 116.35f);
                temp_skeleton->SetHomePosition(4033.34f, -3419.75f, 116.35f, 4.80f);
            }
        }

        if (m_pInstance)
            m_pInstance->SetData(TYPE_RAMSTEIN, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Trample
        if (Trample_Timer < diff)
        {
            DoCastSpellIfCan(m_creature, SPELL_TRAMPLE);
            Trample_Timer = 7000;
        }
        else Trample_Timer -= diff;

        //Knockout
        if (Knockout_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_KNOCKOUT) == CAST_OK)
            {
                m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), -100);
                Knockout_Timer = 10000;
            }
        }
        else Knockout_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_ramstein_the_gorger(Creature* pCreature)
{
    return new boss_ramstein_the_gorgerAI(pCreature);
}

void AddSC_boss_ramstein_the_gorger()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_ramstein_the_gorger";
    newscript->GetAI = &GetAI_boss_ramstein_the_gorger;
    newscript->RegisterSelf();
}
