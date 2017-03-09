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
SDName: boss_timmy_the_cruel
SD%Complete: 100
SDComment:
SDCategory: Stratholme
EndScriptData */

#include "scriptPCH.h"

#define SAY_SPAWN               "TIMMY!"

#define SPELL_RAVENOUSCLAW      17470
#define SPELL_ENRAGE            8599

#define TIMMY_ENTRY             10808

struct boss_timmy_the_cruelAI : public ScriptedAI
{
    boss_timmy_the_cruelAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 RavenousClaw_Timer;

    void Reset()
    {
        RavenousClaw_Timer = 7000;
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //RavenousClaw
        if (RavenousClaw_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_RAVENOUSCLAW) == CAST_OK)
                RavenousClaw_Timer = 12000;
        }
        else RavenousClaw_Timer -= diff;

        if (m_creature->GetHealthPercent() < 10.0f && !m_creature->HasAura(SPELL_ENRAGE))
            m_creature->CastSpell(m_creature, SPELL_ENRAGE, true);

        DoMeleeAttackIfReady();
    }

    void CorpseRemoved(uint32 &respawnDelay)
    {
        m_creature->DeleteLater();
    }
};

CreatureAI* GetAI_boss_timmy_the_cruel(Creature* pCreature)
{
    return new boss_timmy_the_cruelAI(pCreature);
}

struct npc_gardien_cramoisiAI : public ScriptedAI
{
    npc_gardien_cramoisiAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        if (pCreature->GetDBTableGUIDLow() == 54070)
            bIsTimmySpawner = true;
        else
            bIsTimmySpawner = false;
    }

    uint32 uiDesarmerTimer;
    uint32 uiCoupBouclierTimer;
    uint32 uiShieldChargeTimer;
    bool bIsTimmySpawner;

    void Reset()
    {
        uiDesarmerTimer     = 6000;
        uiCoupBouclierTimer = 4000;
        uiShieldChargeTimer = 1000;
    }

    void JustDied(Unit* pKiller)
    {
        if (bIsTimmySpawner)
        {
            Creature* pTimmy = m_creature->SummonCreature(TIMMY_ENTRY,
                               3671.0f, -3187.67f, 126.0f, 1.84f, TEMPSUMMON_MANUAL_DESPAWN, 0
                                                         );
            if (pTimmy)
            {
                pTimmy->MonsterYell(SAY_SPAWN, 0, pKiller);
                pTimmy->SetRespawnTime(9999999);
            }
            bIsTimmySpawner = false;
            m_creature->DeleteLater();
        }
    }
    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (uiDesarmerTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), 6713) == CAST_OK)
                uiDesarmerTimer = 15000;
        }
        else
            uiDesarmerTimer -= diff;

        if (uiCoupBouclierTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), 11972) == CAST_OK)
                uiCoupBouclierTimer = 8000;
        }
        else
            uiCoupBouclierTimer -= diff;

        if (uiShieldChargeTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), 15749) == CAST_OK)
                uiShieldChargeTimer = 12000;
        }
        else
            uiShieldChargeTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_gardien_cramoisi(Creature* pCreature)
{
    return new npc_gardien_cramoisiAI(pCreature);
}

void AddSC_boss_timmy_the_cruel()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_timmy_the_cruel";
    newscript->GetAI = &GetAI_boss_timmy_the_cruel;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_gardien_cramoisi";
    newscript->GetAI = &GetAI_npc_gardien_cramoisi;
    newscript->RegisterSelf();
}
