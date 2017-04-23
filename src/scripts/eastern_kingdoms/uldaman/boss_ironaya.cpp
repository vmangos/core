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
SDName: Boss_Ironaya
SD%Complete: 100
SDComment:
SDCategory: Uldaman
EndScriptData */

#include "scriptPCH.h"
#include "uldaman.h"

#define SAY_AGGRO -1070000

struct boss_ironayaAI : public ScriptedAI
{
    boss_ironayaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        instance = (ScriptedInstance*)pCreature->GetInstanceData();
        hasMoved = false;
        Reset();
    }

    ScriptedInstance* instance;

    uint32 Arcing_Timer;
    bool hasCastedWstomp;
    bool hasCastedKnockaway;
    bool hasMoved;

    void Reset()
    {
        hasCastedKnockaway = false;
        hasCastedWstomp = false;
    }

    void Aggro(Unit *who)
    {
        DoScriptText(SAY_AGGRO, m_creature);
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 diff)
    {
        if (m_creature->getFaction() == FACTION_AWAKE && !hasMoved)
        {
            if (Unit* target = Unit::GetUnit(*me, instance->GetData64(0)))
            {
                AttackStart(target);
            }
            hasMoved = true;
        }

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            return;
        }

        //If we are <50% hp do knockaway ONCE
        if (!hasCastedKnockaway && m_creature->GetHealthPercent() < 50.0f)
        {
            m_creature->CastSpell(m_creature->getVictim(), SPELL_KNOCKAWAY, false);

            // current aggro target is knocked away pick new target
            Unit* Target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0);

            if (!Target || Target == m_creature->getVictim())
            {
                Target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 1);
            }

            if (Target)
            {
                m_creature->TauntApply(Target);
            }

            //Shouldn't cast this again
            hasCastedKnockaway = true;
        }

        //Arcing_Timer
        if (Arcing_Timer < diff)
        {
            DoCastSpellIfCan(m_creature, SPELL_ARCINGSMASH);
            Arcing_Timer = 13000;
        }
        else Arcing_Timer -= diff;

        if (!hasCastedWstomp && m_creature->GetHealthPercent() < 25.0f)
        {
            DoCastSpellIfCan(m_creature, SPELL_WSTOMP);
            hasCastedWstomp = true;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_ironaya(Creature* pCreature)
{
    return new boss_ironayaAI(pCreature);
}

void AddSC_boss_ironaya()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_ironaya";
    newscript->GetAI = &GetAI_boss_ironaya;
    newscript->RegisterSelf();
}
