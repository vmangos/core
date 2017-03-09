/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Boss_Rend_Blackhand
SD%Complete: 100
SDComment: Intro event NYI
SDCategory: Blackrock Spire
EndScriptData */

#include "scriptPCH.h"

/*
In DB : change creature_template et creature_equip_template
*/
enum
{
    NPC_RENDBLACKHAND     = 10429,
    SPELL_MORTALSTRIKE    = 16856,
    SPELL_CLEAVE          = 15284,
    SPELL_WHIRLWIND       = 13736,
    SPELL_FRENZY          = 8269
};

struct boss_rend_blackhandAI : public ScriptedAI
{
    boss_rend_blackhandAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiMortalStrikeTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiFrenzyTimer;
    uint32 m_uiCloseCombatCheckTimer;
    uint32 m_uiCloseCombatCount;
    uint32 m_uiWhirlWindTimer;

    void Reset()
    {
        m_uiMortalStrikeTimer       = 1000;
        m_uiCleaveTimer             = 4000;
        m_uiFrenzyTimer             = 0;
        m_uiCloseCombatCheckTimer   = 1000;
        m_uiCloseCombatCount        = 0;
        m_uiWhirlWindTimer          = 0;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        // Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // WhirlWind Check
        if (m_uiCloseCombatCheckTimer < uiDiff)
        {
            m_uiCloseCombatCount = 0;
            ThreatList const& tList = m_creature->getThreatManager().getThreatList();
            for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
            {
                Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
                if (pUnit && (pUnit->GetTypeId() == TYPEID_PLAYER) && (pUnit->GetDistance2d(m_creature) < 7.0f))
                    m_uiCloseCombatCount++;
            }
            m_uiCloseCombatCheckTimer = 2000;
        }
        else
            m_uiCloseCombatCheckTimer -= uiDiff;

        if (m_uiCloseCombatCount > 3)
        {
            if (m_uiWhirlWindTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_WHIRLWIND) == CAST_OK)
                    m_uiWhirlWindTimer = 1500;
            }
            else
                m_uiWhirlWindTimer -= uiDiff;
        }
        else
        {
            // Mortal Strike
            if (m_uiMortalStrikeTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORTALSTRIKE) == CAST_OK)
                    m_uiMortalStrikeTimer = urand(6000, 10000);
            }
            else
                m_uiMortalStrikeTimer -= uiDiff;

            // Cleave
            if (m_uiCleaveTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                    m_uiCleaveTimer = urand(4000, 6000);
            }
            else
                m_uiCleaveTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }

        // Frenzy
        if (m_creature->GetHealthPercent() <= 25.0f)
        {
            if (m_uiFrenzyTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_FRENZY) == CAST_OK)
                    m_uiFrenzyTimer = 110000;
            }
            else
                m_uiFrenzyTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_boss_rend_blackhand(Creature* pCreature)
{
    return new boss_rend_blackhandAI(pCreature);
}

void AddSC_boss_rend_blackhand()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_rend_blackhand";
    newscript->GetAI = &GetAI_boss_rend_blackhand;
    newscript->RegisterSelf();
}
