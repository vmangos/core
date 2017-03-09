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
SDName: Boss_Ambassador_Flamelash
SD%Complete: 100
SDComment:
SDCategory: Blackrock Depths
EndScriptData */

#include "scriptPCH.h"

#define __SPELL_FIREBLAST            15573
// Ivina : remplace le 15573 car il a une trop grosse probabilite de proc.
// Le proc = cast instant d'un fireblast supplementaire.
// Il fait souvent 3 ou 4 blast a 1k en meme temps, ce qui est abuse pour le lvl 55.
enum
{
    SPELL_FIREBLAST         = 25028,
    NPC_FLAMELASH_SPIRIT    = 9178,
};


struct boss_ambassador_flamelashAI : public ScriptedAI
{
    boss_ambassador_flamelashAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 FireBlast_Timer;
    uint32 Spirit_Timer;

    void Reset()
    {
        FireBlast_Timer = 2000;
        Spirit_Timer = urand(15000, 20000);
    }

    void SummonSpirits(Unit* victim)
    {
        if (victim)
            if (Creature* summoned = DoSpawnCreature(NPC_FLAMELASH_SPIRIT, 10.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60000))
                if (summoned->AI())
                    summoned->AI()->AttackStart(victim);
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //FireBlast_Timer
        if (FireBlast_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FIREBLAST) == CAST_OK)
                FireBlast_Timer = 8000;
        }
        else
            FireBlast_Timer -= diff;

        //Spirit_Timer
        if (Spirit_Timer < diff)
        {
            Spirit_Timer = 30000;
            // Summon 4 spirits
            for (int i = 0; i < 4; ++i)
                SummonSpirits(m_creature->getVictim());
        }
        else
            Spirit_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_ambassador_flamelash(Creature* pCreature)
{
    return new boss_ambassador_flamelashAI(pCreature);
}

void AddSC_boss_ambassador_flamelash()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_ambassador_flamelash";
    newscript->GetAI = &GetAI_boss_ambassador_flamelash;
    newscript->RegisterSelf();
}
