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
SDName: Boss_Darkmaster_Gandling
SD%Complete: 75
SDComment: Doors missing
SDCategory: Scholomance
EndScriptData */

#include "scriptPCH.h"
#include "scholomance.h"

#define SAY_GANDLING_SPAWN    -1289000
#define SAY_GANDLING_DEATH    -1289001

#define SPELL_ARCANEMISSILES           15790
#define SPELL_SHADOWSHIELD             22417                //Not right ID. But 12040 is wrong either.
#define SPELL_CURSE                    18702

#define ADD_1X 170.205
#define ADD_1Y 99.413
#define ADD_1Z 104.733
#define ADD_1O 3.16

#define ADD_2X 170.813
#define ADD_2Y 97.857
#define ADD_2Z 104.713
#define ADD_2O 3.16

#define ADD_3X 170.720
#define ADD_3Y 100.900
#define ADD_3Z 104.739
#define ADD_3O 3.16

#define ADD_4X 171.866
#define ADD_4Y 99.373
#define ADD_4Z 104.732
#define ADD_4O 3.16

struct boss_darkmaster_gandlingAI : public ScriptedAI
{
    boss_darkmaster_gandlingAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
        DoScriptText(SAY_GANDLING_SPAWN, m_creature);
        // display Christmas Hat Gandling during Feast of Winter Veil
        if (sGameEventMgr.IsActiveEvent(2))
            m_creature->SetDisplayId(15732);
    }

    ScriptedInstance* m_pInstance;

    uint32 ArcaneMissiles_Timer;
    uint32 ShadowShield_Timer;
    uint32 Curse_Timer;
    uint32 Teleport_Timer;
    bool bShadowPortalCasted;
    uint64 ShadowPortalTargetGUID;

    uint32 m_uiArcaneTriggerTimer;

    void Reset()
    {
        ArcaneMissiles_Timer = 4500;
        ShadowShield_Timer = 12000;
        Curse_Timer = 2000;
        Teleport_Timer = 16000;
        bShadowPortalCasted = false;
        ShadowPortalTargetGUID = 0;

        m_uiArcaneTriggerTimer = 0;
    }

    void JustDied(Unit *killer)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GANDLING, DONE);

        DoScriptText(SAY_GANDLING_DEATH, m_creature);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GANDLING, FAIL);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // hack fix Gandling Arcane Missiles periodic trigger
        if (m_creature->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
        {
            if (m_uiArcaneTriggerTimer <= diff)
            {
                m_creature->CastSpell(m_creature->getVictim(), 15791, true);
                m_uiArcaneTriggerTimer = 1000;
            }
            else
                m_uiArcaneTriggerTimer -= diff;
        }

        //ArcaneMissiles_Timer
        if (ArcaneMissiles_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ARCANEMISSILES) == CAST_OK)
            {
                ArcaneMissiles_Timer = urand(10000, 16000);
                m_uiArcaneTriggerTimer = 0;
            }
        }
        else ArcaneMissiles_Timer -= diff;

        //ShadowShield_Timer
        if (ShadowShield_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SHADOWSHIELD) == CAST_OK)
                ShadowShield_Timer = urand(10000, 12000);
        }
        else ShadowShield_Timer -= diff;

        //Curse_Timer
        if (Curse_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CURSE) == CAST_OK)
                Curse_Timer = urand(15000, 27000);
        }
        else Curse_Timer -= diff;

        //Teleporting Random Target to one of the six pre boss rooms and spawn 3-4 skeletons near the gamer.
        //We will only telport if gandling has more than 3% of hp so teleported gamers can always loot.
        if (m_creature->GetHealthPercent() > 3.0f)
        {
            if (Teleport_Timer < diff)
            {
                if (!bShadowPortalCasted)
                {
                    if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    {
                        if (pTarget->GetTypeId() == TYPEID_PLAYER)
                        {
                            ShadowPortalTargetGUID = pTarget->GetGUID();
                            m_creature->CastSpell(pTarget, 17950, false);     //Shadow Portal (visual)
                            bShadowPortalCasted = true;
                            Teleport_Timer = 2000;
                        }
                    }
                }
                else if (Unit* target = m_creature->GetMap()->GetUnit(ShadowPortalTargetGUID))
                {
                    m_creature->getThreatManager().modifyThreatPercent(target, -100);
                    ShadowPortalTargetGUID = 0;
                    bShadowPortalCasted = false;

                    if (target->isAlive())
                    {
                        switch (urand(0, 5))
                        {
                            case 0: // Pokelt
                                DoTeleportPlayer(target, 250.0696f, 0.3921f, 84.8408f, 3.149f);
                                m_pInstance->SetData(TYPE_BONEMINION0, IN_PROGRESS);
                                if (Creature* Summoned = m_creature->SummonCreature(30000, 229.229f, 5.39118f, 85.2283f, 0.0961165f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30000, 229.503f, 0.00814369f, 85.2283f, 0.0961165f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30000, 229.727f, -4.39616f, 85.2283f, 0.0961165f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                break;
                            case 1: // Theolen
                                DoTeleportPlayer(target, 181.4220f, -91.9481f, 84.8410f, 1.608f);
                                m_pInstance->SetData(TYPE_BONEMINION1, IN_PROGRESS);
                                if (Creature* Summoned = m_creature->SummonCreature(30001, 186.217f, -50.0985f, 85.2283f, 4.75432f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30001, 181.568f, -56.2009f, 84.841f, 4.75432f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30001, 188.325f, -55.6766f, 85.2283f, 4.75432f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30001, 173.013f, -56.4198f, 85.2283f, 4.75432f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                break;
                            case 2: // Malicia
                                DoTeleportPlayer(target, 95.1547f, -1.8173f, 85.2289f, 0.043f);
                                m_pInstance->SetData(TYPE_BONEMINION2, IN_PROGRESS);
                                if (Creature* Summoned = m_creature->SummonCreature(30002, 128.205f, 5.00569f, 85.2283f, 3.09949f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30002, 128.06f, -6.1269f, 85.2283f, 3.09949f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30002, 128.124f, -1.71736f, 85.3764f, 3.09949f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                break;
                            case 3: // Illucia
                                DoTeleportPlayer(target, 250.0696f, 0.3921f, 72.6722f, 3.149f);
                                m_pInstance->SetData(TYPE_BONEMINION3, IN_PROGRESS);
                                if (Creature* Summoned = m_creature->SummonCreature(30003, 235.598f, 0.588147f, 72.6727f, 2.92513f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30003, 235.51f, -5.92126f, 72.6727f, 0.331743f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30003, 229.127f, -3.10989f, 72.6727f, 3.17017f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                break;
                            case 4: // Alexei
                                DoTeleportPlayer(target, 181.4220f, -91.9481f, 70.7734f, 1.608f);
                                m_pInstance->SetData(TYPE_BONEMINION4, IN_PROGRESS);
                                if (Creature* Summoned = m_creature->SummonCreature(30004, 170.96f, -56.9603f, 75.3971f, 3.75058f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30004, 182.708f, -55.8739f, 75.3971f, 1.88447f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30004, 175.353f, -55.9977f, 75.3971f, 0.461331f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30004, 191.41f, -55.4289f, 75.3971f, 3.75058f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                break;
                            case 5: // Voracien
                                DoTeleportPlayer(target, 106.1541f, -1.8994f, 75.3663f, 0.043f);
                                m_pInstance->SetData(TYPE_BONEMINION5, IN_PROGRESS);
                                if (Creature* Summoned = m_creature->SummonCreature(30005, 138.599f, 4.62909f, 75.397f, 0.065487f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30005, 136.525f, -1.6351f, 75.397f, 0.065487f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                if (Creature* Summoned = m_creature->SummonCreature(30005, 139.392f, -7.35632f, 75.397f, 0.039568f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                                {
                                    Summoned->SetInCombatWith(target);
                                    Summoned->getThreatManager().addThreatDirectly(target, 100000.0f);
                                    Summoned->GetMotionMaster()->MoveChase(target);
                                }
                                break;
                        }
                    }
                    Teleport_Timer = urand(20000, 35000);
                }
            }
            else Teleport_Timer -= diff;
        }

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_darkmaster_gandling(Creature* pCreature)
{
    return new boss_darkmaster_gandlingAI(pCreature);
}

void AddSC_boss_darkmaster_gandling()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_darkmaster_gandling";
    newscript->GetAI = &GetAI_boss_darkmaster_gandling;
    newscript->RegisterSelf();
}
