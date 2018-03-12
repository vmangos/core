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
SDName: Boss_Sulfuron_Harbringer
SD%Complete: 80
SDComment: Adds NYI
SDCategory: Molten Core
EndScriptData */

/*
    Sulfuron should walk to a random point ~10 yds behind him before casting Flamespear
*/

#include "scriptPCH.h"
#include "molten_core.h"

#define SPELL_DARKSTRIKE            19777
#define SPELL_DEMORALIZINGSHOUT     19778
#define SPELL_INSPIRE               19779
#define SPELL_KNOCKDOWN             19780
#define SPELL_FLAMESPEAR            19781

//Adds Spells
#define SPELL_HEAL                  19775
#define SPELL_SHADOWWORDPAIN        19776
#define SPELL_DARKSTRIKE            19777
#define SPELL_IMMOLATE              20294

struct boss_sulfuronAI : public ScriptedAI
{
    boss_sulfuronAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    uint32 Darkstrike_Timer;
    uint32 DemoralizingShout_Timer;
    uint32 Inspire_Timer;
    uint32 Knockdown_Timer;
    uint32 Flamespear_Timer;
    ScriptedInstance* m_pInstance;

    void Reset()
    {
        Darkstrike_Timer        = 10000;                     //These times are probably wrong
        DemoralizingShout_Timer = 15000;
        Inspire_Timer           = 13000;
        Knockdown_Timer         = 6000;
        Flamespear_Timer        = 2000;

        if (m_pInstance && m_creature->isAlive())
            m_pInstance->SetData(TYPE_SULFURON, NOT_STARTED);
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SULFURON, IN_PROGRESS);
        m_creature->SetInCombatWithZone();
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SULFURON, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //DemoralizingShout_Timer
        if (DemoralizingShout_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DEMORALIZINGSHOUT) == CAST_OK)
                DemoralizingShout_Timer = urand(15000, 20000);
        }
        else DemoralizingShout_Timer -= diff;

        //Inspire_Timer
        if (Inspire_Timer < diff)
        {
            Creature* target = NULL;
            std::list<Creature*> pList = DoFindFriendlyMissingBuff(45.0f, SPELL_INSPIRE);
            if (!pList.empty())
            {
                std::list<Creature*>::iterator i = pList.begin();
                advance(i, (rand() % pList.size()));
                target = (*i);
            }

            if (target)
            {
                if (DoCastSpellIfCan(target, SPELL_INSPIRE) != CAST_OK)
                    return;
            }

            if (DoCastSpellIfCan(m_creature, SPELL_INSPIRE) == CAST_OK)
                Inspire_Timer = urand(20000, 26000);
        }
        else Inspire_Timer -= diff;

        //Knockdown_Timer
        if (Knockdown_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_KNOCKDOWN) == CAST_OK)
                Knockdown_Timer = urand(12000, 15000);
        }
        else Knockdown_Timer -= diff;

        //Flamespear_Timer
        if (Flamespear_Timer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(target, SPELL_FLAMESPEAR) == CAST_OK)
                    Flamespear_Timer = urand(12000, 16000);
            }
        }
        else Flamespear_Timer -= diff;

        //DarkStrike_Timer
        if (Darkstrike_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DARKSTRIKE) == CAST_OK)
                Darkstrike_Timer = urand(15000, 18000);
        }
        else Darkstrike_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

struct mob_flamewaker_priestAI : public ScriptedAI
{
    mob_flamewaker_priestAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    uint32 Heal_Timer;
    uint32 ShadowWordPain_Timer;
    uint32 Immolate_Timer;
    uint32 DarkStrike_Timer;

    ScriptedInstance* m_pInstance;

    void Reset()
    {
        Heal_Timer           = urand(10000, 15000);
        ShadowWordPain_Timer = 2000;
        Immolate_Timer       = urand(2500, 12000);
        DarkStrike_Timer     = urand(6000, 8000);
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == 1714 || pSpell->Id == 11719)
            m_creature->RemoveAurasDueToSpell(pSpell->Id);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Casting Heal to Sulfuron or other Guards.
        if (Heal_Timer < diff)
        {
            Unit* pUnit = m_creature->DoSelectLowestHpFriendly(60.0f, 1);
            if (!pUnit)
                return;

            if (DoCastSpellIfCan(pUnit, SPELL_HEAL) == CAST_OK)
                Heal_Timer = urand(5000, 10000);
        }
        else Heal_Timer -= diff;

        //ShadowWordPain_Timer
        if (ShadowWordPain_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOWWORDPAIN) == CAST_OK)
                ShadowWordPain_Timer = urand(18000, 26000);
        }
        else ShadowWordPain_Timer -= diff;

        //Immolate_Timer
        if (Immolate_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_IMMOLATE) == CAST_OK)
                Immolate_Timer = urand(15000, 25000);
        }
        else Immolate_Timer -= diff;

        //DarkStrike_Timer
        if (DarkStrike_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DARKSTRIKE) == CAST_OK)
                DarkStrike_Timer = urand(4000, 6000);
        }
        else DarkStrike_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_sulfuron(Creature* pCreature)
{
    return new boss_sulfuronAI(pCreature);
}

CreatureAI* GetAI_mob_flamewaker_priest(Creature* pCreature)
{
    return new mob_flamewaker_priestAI(pCreature);
}

void AddSC_boss_sulfuron()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_sulfuron";
    newscript->GetAI = &GetAI_boss_sulfuron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_flamewaker_priest";
    newscript->GetAI = &GetAI_mob_flamewaker_priest;
    newscript->RegisterSelf();
}
