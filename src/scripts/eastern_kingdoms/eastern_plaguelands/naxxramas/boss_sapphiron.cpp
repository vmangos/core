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
SDName: Boss_Sapphiron
SD%Complete: 0
SDComment: Place Holder
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    EMOTE_BREATH       = -1533082,
    EMOTE_ENRAGE       = -1533083,

    SPELL_ICEBOLT      = 28522,
    SPELL_FROST_BREATH = 29318,
    SPELL_FROST_AURA   = 28531,
    SPELL_LIFE_DRAIN   = 28542,
    SPELL_BLIZZARD     = 28547,
    SPELL_BESERK       = 26662
};

struct boss_sapphironAI : public ScriptedAI
{
    boss_sapphironAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint32 Icebolt_Count;
    uint32 Icebolt_Timer;
    uint32 FrostBreath_Timer;
    uint32 FrostAura_Timer;
    uint32 LifeDrain_Timer;
    uint32 Blizzard_Timer;
    uint32 Fly_Timer;
    uint32 Beserk_Timer;
    uint32 phase;
    bool landoff;
    uint32 land_Timer;

    void Reset()
    {
        FrostAura_Timer = 2000;
        FrostBreath_Timer = 2500;
        LifeDrain_Timer = 24000;
        Blizzard_Timer = 20000;
        Fly_Timer = 45000;
        Icebolt_Timer = 4000;
        land_Timer = 2000;
        Beserk_Timer = 0;
        phase = 1;
        Icebolt_Count = 0;
        landoff = false;

        //m_creature->ApplySpellMod(SPELL_FROST_AURA, SPELLMOD_DURATION, -1);
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, DONE);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (phase == 1)
        {
            if (FrostAura_Timer < uiDiff)
            {
                DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_AURA);
                FrostAura_Timer = 5000;
            }
            else FrostAura_Timer -= uiDiff;

            if (LifeDrain_Timer < uiDiff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    DoCastSpellIfCan(target, SPELL_LIFE_DRAIN);

                LifeDrain_Timer = 24000;
            }
            else LifeDrain_Timer -= uiDiff;

            if (Blizzard_Timer < uiDiff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    DoCastSpellIfCan(target, SPELL_BLIZZARD);

                Blizzard_Timer = 20000;
            }
            else Blizzard_Timer -= uiDiff;

            if (m_creature->GetHealthPercent() > 10.0f)
            {
                if (Fly_Timer < uiDiff)
                {
                    phase = 2;
                    m_creature->InterruptNonMeleeSpells(false);
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_LIFTOFF);
                    m_creature->GetMotionMaster()->Clear(false);
                    m_creature->GetMotionMaster()->MoveIdle();
                    DoCastSpellIfCan(m_creature, 11010);
                    m_creature->SetHover(true);
                    DoCastSpellIfCan(m_creature, 18430);
                    Icebolt_Timer = 4000;
                    Icebolt_Count = 0;
                    landoff = false;
                }
                else Fly_Timer -= uiDiff;
            }
        }

        if (phase == 2)
        {
            if (Icebolt_Timer < uiDiff && Icebolt_Count < 5)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    DoCastSpellIfCan(target, SPELL_ICEBOLT);

                ++Icebolt_Count;
                Icebolt_Timer = 4000;
            }
            else Icebolt_Timer -= uiDiff;

            if (Icebolt_Count == 5 && !landoff)
            {
                if (FrostBreath_Timer < uiDiff)
                {
                    DoScriptText(EMOTE_BREATH, m_creature);
                    DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BREATH);
                    land_Timer = 2000;
                    landoff = true;
                    FrostBreath_Timer = 6000;
                }
                else FrostBreath_Timer -= uiDiff;
            }

            if (landoff)
            {
                if (land_Timer < uiDiff)
                {
                    phase = 1;
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_LAND);
                    m_creature->SetHover(false);
                    m_creature->GetMotionMaster()->Clear(false);
                    m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
                    Fly_Timer = 67000;
                }
                else land_Timer -= uiDiff;
            }
        }

        if (m_creature->GetHealthPercent() <= 10.0f)
        {
            if (Beserk_Timer < uiDiff)
            {
                DoScriptText(EMOTE_ENRAGE, m_creature);
                DoCastSpellIfCan(m_creature, SPELL_BESERK);
                Beserk_Timer = 300000;
            }
            else Beserk_Timer -= uiDiff;
        }

        if (phase != 2)
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_sapphiron(Creature* pCreature)
{
    return new boss_sapphironAI(pCreature);
}

void AddSC_boss_sapphiron()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_sapphiron";
    NewScript->GetAI = &GetAI_boss_sapphiron;
    NewScript->RegisterSelf();
}
