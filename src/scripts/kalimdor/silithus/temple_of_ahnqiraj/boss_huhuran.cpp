/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
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

/* ScriptData
SDName: Boss_Huhuran
SD%Complete: 100
SDComment:
SDCategory: Temple of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"

#define EMOTE_GENERIC_FRENZY_KILL   -1000001
#define EMOTE_GENERIC_BERSERK       -1000004

#define SPELL_FRENZY 26051
#define SPELL_BERSERK 26068
#define SPELL_POISONBOLT 26052
#define SPELL_NOXIOUSPOISON 26053
#define SPELL_WYVERNSTING 26180
#define SPELL_ACIDSPIT 26050

struct boss_huhuranAI : public ScriptedAI
{
    boss_huhuranAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 Frenzy_Timer;
    uint32 Wyvern_Timer;
    uint32 Spit_Timer;
    uint32 PoisonBolt_Timer;
    uint32 NoxiousPoison_Timer;
    uint32 FrenzyBack_Timer;

    bool Frenzy;
    bool Berserk;

    void Reset()
    {
        Frenzy_Timer = urand(25000, 35000);
        Wyvern_Timer = urand(18000, 28000);
        Spit_Timer = 8000;
        PoisonBolt_Timer = 4000;
        NoxiousPoison_Timer = urand(10000, 20000);
        FrenzyBack_Timer = 15000;

        Frenzy = false;
        Berserk = false;
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Frenzy_Timer
        if (!Frenzy && Frenzy_Timer < diff)
        {
            DoCastSpellIfCan(m_creature, SPELL_FRENZY);
            DoScriptText(EMOTE_GENERIC_FRENZY_KILL, m_creature);
            Frenzy = true;
            PoisonBolt_Timer = 3000;
            Frenzy_Timer = urand(25000, 35000);
        }
        else Frenzy_Timer -= diff;

        // Wyvern Timer
        if (Wyvern_Timer < diff)
        {
            if (Unit *target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(target, SPELL_WYVERNSTING) == CAST_OK)
                    Wyvern_Timer = urand(15000, 32000);
            }
        }
        else Wyvern_Timer -= diff;

        //Spit Timer
        if (Spit_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ACIDSPIT) == CAST_OK)
                Spit_Timer = urand(5000, 10000);
        }
        else Spit_Timer -= diff;

        //NoxiousPoison_Timer
        if (NoxiousPoison_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_NOXIOUSPOISON) == CAST_OK)
                NoxiousPoison_Timer = urand(12000, 24000);
        }
        else NoxiousPoison_Timer -= diff;

        //PoisonBolt only if frenzy or berserk
        if (Frenzy || Berserk)
        {
            if (PoisonBolt_Timer < diff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_POISONBOLT) == CAST_OK)
                    PoisonBolt_Timer = 3000;
            }
            else PoisonBolt_Timer -= diff;
        }

        //FrenzyBack_Timer
        if (Frenzy && FrenzyBack_Timer < diff)
        {
            m_creature->InterruptNonMeleeSpells(false);
            Frenzy = false;
            FrenzyBack_Timer = 15000;
        }
        else FrenzyBack_Timer -= diff;

        if (!Berserk && m_creature->GetHealthPercent() < 31.0f)
        {
            DoScriptText(EMOTE_GENERIC_BERSERK, m_creature);
            Berserk = true;
        }
        else if (Berserk)
            DoCastSpellIfCan(m_creature, SPELL_BERSERK, CAST_AURA_NOT_PRESENT);

        if (m_creature->isAttackReady() && m_creature->getVictim()->HasAura(SPELL_WYVERNSTING))
            m_creature->getVictim()->RemoveAurasDueToSpell(SPELL_WYVERNSTING);

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_huhuran(Creature* pCreature)
{
    return new boss_huhuranAI(pCreature);
}

void AddSC_boss_huhuran()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_huhuran";
    newscript->GetAI = &GetAI_boss_huhuran;
    newscript->RegisterSelf();
}
