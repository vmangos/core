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
SDName: Boss_Warmaster_Voone
SD%Complete: 100
SDComment:
SDCategory: Blackrock Spire
EndScriptData */

#include "scriptPCH.h"

#define SPELL_SNAPKICK          15618
#define SPELL_CLEAVE            15284
#define SPELL_UPPERCUT          10966
#define SPELL_MORTALSTRIKE      15708
#define SPELL_PUMMEL            15615
#define SPELL_THROWAXE          16075
#define SPELL_UNARMED_PASSIVE   16076

struct boss_warmastervooneAI : public ScriptedAI
{
    boss_warmastervooneAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_snapKickTimer;
    uint32 m_cleaveTimer;
    uint32 m_uppercutTimer;
    uint32 m_mortalStrikeTimer;
    uint32 m_pummelTimer;
    uint32 m_throwAxeTimer;
    uint32 m_axesThrownCount;

    void Reset() override
    {
        m_snapKickTimer = 8000;
        m_cleaveTimer = 14000;
        m_uppercutTimer = 20000;
        m_mortalStrikeTimer = 12000;
        m_pummelTimer = 32000;
        m_throwAxeTimer = 1000;
        m_axesThrownCount = 0;
    }

    void SpellHitTarget(Unit* pTarget, SpellEntry const* pSpellEntry) override
    {
        if (pSpellEntry->Id == SPELL_THROWAXE)
        {
            switch (m_axesThrownCount)
            {
                case 0:
                {
                    m_creature->SetVirtualItem(BASE_ATTACK, 12348);
                    m_creature->SetVirtualItem(OFF_ATTACK, 0);
                    break;
                }
                case 1:
                {
                    m_creature->SetVirtualItem(BASE_ATTACK, 0);
                    m_creature->SetVirtualItem(OFF_ATTACK, 0);
                    m_creature->CastSpell(m_creature, SPELL_UNARMED_PASSIVE, true);
                    break;
                }
            }
            m_axesThrownCount++;
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        //m_snapKickTimer
        if (m_snapKickTimer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SNAPKICK);
            m_snapKickTimer = 6000;
        }
        else m_snapKickTimer -= diff;

        //m_cleaveTimer
        if (m_cleaveTimer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CLEAVE);
            m_cleaveTimer = 12000;
        }
        else m_cleaveTimer -= diff;

        //m_uppercutTimer
        if (m_uppercutTimer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_UPPERCUT);
            m_uppercutTimer = 14000;
        }
        else m_uppercutTimer -= diff;

        //m_mortalStrikeTimer
        if (m_mortalStrikeTimer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MORTALSTRIKE);
            m_mortalStrikeTimer = 10000;
        }
        else m_mortalStrikeTimer -= diff;

        //m_pummelTimer
        if (m_pummelTimer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_PUMMEL);
            m_pummelTimer = 16000;
        }
        else m_pummelTimer -= diff;

        if (!m_creature->HasAura(SPELL_UNARMED_PASSIVE))
        {
            //m_throwAxeTimer
            if (m_throwAxeTimer < diff)
            {
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_THROWAXE);
                m_throwAxeTimer = 8000;
            }
            else m_throwAxeTimer -= diff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_warmastervoone(Creature* pCreature)
{
    return new boss_warmastervooneAI(pCreature);
}

void AddSC_boss_warmastervoone()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_warmaster_voone";
    newscript->GetAI = &GetAI_boss_warmastervoone;
    newscript->RegisterSelf();
}
