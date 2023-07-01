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
SDName: Stranglethorn_Vale
SD%Complete: 100
SDComment: Quest support: 592
SDCategory: Stranglethorn Vale
EndScriptData */

/* ContentData
mob_yenniku
EndContentData */

#include "scriptPCH.h"

/*######
## mob_yenniku
######*/

struct mob_yennikuAI : public ScriptedAI
{
    mob_yennikuAI(Creature *c) : ScriptedAI(c)
    {
        bReset = false;
        Reset();
    }

    uint32 Reset_Timer;
    bool bReset;

    void Reset() override
    {
        Reset_Timer = 0;
        m_creature->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
    }

    void SpellHit(SpellCaster* caster, SpellEntry const* spell) override
    {
        if (caster->GetTypeId() == TYPEID_PLAYER)
        {
            //Yenniku's Release
            if (!bReset && ((Player*)caster)->GetQuestStatus(592) == QUEST_STATUS_INCOMPLETE && spell->Id == 3607)
            {
                m_creature->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STUN);
                m_creature->CombatStop();                   //stop combat
                m_creature->DeleteThreatList();             //unsure of this
                m_creature->SetFactionTemplateId(83);                 //horde generic

                bReset = true;
                Reset_Timer = 60000;
            }
        }
    }

    void Aggro(Unit *who) override { }

    void UpdateAI(uint32 const diff) override
    {
        if (bReset)
        {
            if (Reset_Timer < diff)
            {
                EnterEvadeMode();
                bReset = false;
                m_creature->SetFactionTemplateId(28);                     //troll, bloodscalp
            }
            else
                Reset_Timer -= diff;
        }

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_yenniku(Creature *_Creature)
{
    return new mob_yennikuAI(_Creature);
}

struct mob_assistant_kryll : public ScriptedAI
{
    mob_assistant_kryll(Creature *c) : ScriptedAI(c)
    {
        Reset();
    }

    uint32 Speach_Timer;    

    void Reset() override
    {
        Speach_Timer = 360000;
    }

    void UpdateAI(uint32 const diff) override
    {
        if (Speach_Timer < diff)
        {
            switch (urand(0, 2))
            {
                case 0:
                    m_creature->MonsterSay("Psst... go to Booty Bay, Kryll needs hands...");
                    break;
                case 1:
                    m_creature->MonsterSay("Kryll needs your help in Booty Bay!");
                    break;
                case 2:
                    m_creature->MonsterSay("Kryll's invention may drastically change your life... Help him in Booty Bay!");
                    break;
            }
            Speach_Timer = urand(15, 40)*60*1000;
        }
        else
            Speach_Timer -= diff;
    }
};

CreatureAI* GetAI_mob_assistant_kryll(Creature *_Creature)
{
    return new mob_assistant_kryll(_Creature);
}

struct go_transpolyporterAI: public GameObjectAI
{
    go_transpolyporterAI(GameObject* pGo) : GameObjectAI(pGo) { }

    bool OnUse(Unit* user) override
    {
        if (user && user->IsPlayer())
        {
            if (((Player*) user)->HasItemCount(9173, 1, false))
                return false;
        }
        return true;
    }
};

GameObjectAI* GetAIgo_transpolyporter(GameObject *pGo)
{
    return new go_transpolyporterAI(pGo);
}

/*######
## npc_pats_hellfire_guy
######*/

enum PatsHellfireGuyData
{
    SPELL_HELLFIRE_CAST_VISUAL = 24207
};

struct npc_pats_hellfire_guyAI : public ScriptedAI
{
    npc_pats_hellfire_guyAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiCastDelay;

    void Reset() override
    {
        m_uiCastDelay = 2000;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiCastDelay)
        {
            if (m_uiCastDelay <= uiDiff)
            {
                m_creature->CastSpell(m_creature, SPELL_HELLFIRE_CAST_VISUAL, false);
                m_uiCastDelay = 0;
            }
            else
                m_uiCastDelay -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_pats_hellfire_guy(Creature *pCreature)
{
    return new npc_pats_hellfire_guyAI(pCreature);
}

/*
 * Witch Doctor Unbagwa
 */

enum WitchDoctorUnbagwaData
{
    NPC_ENRAGED_SILVERBACK_GORILLA  = 1511,
    NPC_KONDA                       = 1516,
    NPC_MOKK_THE_SAVAGE             = 1514,

    QUEST_STRANHLETHORN_FEVER       = 349,

    MAX_WAVE_COUNT                  = 3
};

float const ApesSummon[4] =
{
    -13773.6231f, -3.8856f, 41.5641f, 5.7f
};

struct npc_witch_doctor_unbagwaAI : ScriptedAI
{
    explicit npc_witch_doctor_unbagwaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_witch_doctor_unbagwaAI::Reset();
        npc_witch_doctor_unbagwaAI::ResetCreature();
    }

    uint8 m_uiWaveCount;
    uint8 m_uiAttackersCount;
    uint32 m_uiMobWaveTimer;
    bool m_bStartEvent;
    bool m_bResetEvent;

    void Reset() override { }

    void ResetCreature() override
    {
        m_bStartEvent = false;
        m_bResetEvent = false;
        m_uiWaveCount = 1;
        m_uiAttackersCount = 0;
        m_uiMobWaveTimer = 10000;
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->ClearTemporaryFaction();
    }

    void SummonedCreatureDespawn(Creature* pCreature) override
    {
        if (!m_bStartEvent || !pCreature->IsAlive())
            return;

        m_bResetEvent = true;

        if (m_uiAttackersCount > 0)
            --m_uiAttackersCount;
        
        if (!m_uiAttackersCount)
            ResetCreature();
    }

    void SummonedCreatureJustDied(Creature* /*pCreature*/) override
    {
        if (!m_bStartEvent)
            return;

        if (m_uiAttackersCount > 0)
            --m_uiAttackersCount;

        if (!m_uiAttackersCount && (m_bResetEvent || m_uiWaveCount > MAX_WAVE_COUNT))         
            ResetCreature();
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (!m_bStartEvent)
            return;

        m_creature->AddThreat(pSummoned, 5.0f);
        pSummoned->AI()->AttackStart(m_creature);
    }

    void StartEvent()
    {
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->SetFactionTemporary(FACTION_ESCORT_N_NEUTRAL_PASSIVE, TEMPFACTION_NONE);
        m_bStartEvent = true;
        m_bResetEvent = false;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_bStartEvent)
        {
            if (!m_uiAttackersCount)
            {
                if (m_uiMobWaveTimer < uiDiff)
                {
                    switch (m_uiWaveCount)
                    {
                        case 1: m_uiAttackersCount = 3; break;
                        case 2: m_uiAttackersCount = 5; break;
                        case 3: m_uiAttackersCount = 6; break;
                    }

                    uint32 uiAttackersEntry = NPC_ENRAGED_SILVERBACK_GORILLA;
                    for (uint8 i = 0; i < m_uiAttackersCount; ++i)
                    {
                        if (m_uiWaveCount > 1 && i == m_uiAttackersCount - 1)
                        {
                            switch (m_uiWaveCount)
                            {
                            case 2: uiAttackersEntry = NPC_KONDA; break;
                            case 3: uiAttackersEntry = NPC_MOKK_THE_SAVAGE; break;
                            }
                        }
                        m_creature->SummonCreature(uiAttackersEntry,
                            ApesSummon[0] + frand(-3, 3),
                            ApesSummon[1] + frand(-3, 3),
                            ApesSummon[2],
                            ApesSummon[3],
                            TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 3 * MINUTE * IN_MILLISECONDS);
                    }

                    m_uiMobWaveTimer = 10000;
                    ++m_uiWaveCount;
                }
                else
                    m_uiMobWaveTimer -= uiDiff;
            }
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

bool QuestRewarded_npc_witch_doctor_unbagwa(Player* /*pPlayer*/, Creature* pCreature, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_STRANHLETHORN_FEVER)
    {
        if (auto pUnbagwaAI = static_cast<npc_witch_doctor_unbagwaAI*>(pCreature->AI()))
            pUnbagwaAI->StartEvent();
    }

    return true;
}

CreatureAI* GetAI_npc_witch_doctor_unbagwa(Creature* pCreature)
{
    return new npc_witch_doctor_unbagwaAI(pCreature);
}

void AddSC_stranglethorn_vale()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "mob_yenniku";
    newscript->GetAI = &GetAI_mob_yenniku;
    newscript->RegisterSelf();
    /*
    newscript = new Script;
    newscript->Name = "mob_assistant_kryll";
    newscript->GetAI = &GetAI_mob_assistant_kryll;
    newscript->RegisterSelf();
    */
    newscript = new Script;
    newscript->Name = "go_transpolyporter";
    newscript->GOGetAI = &GetAIgo_transpolyporter;
    //newscript->pGOHello = &GOHello_go_transpolyporter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_pats_hellfire_guy";
    newscript->GetAI = &GetAI_npc_pats_hellfire_guy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_witch_doctor_unbagwa";
    newscript->GetAI = &GetAI_npc_witch_doctor_unbagwa;
    newscript->pQuestRewardedNPC = QuestRewarded_npc_witch_doctor_unbagwa;
    newscript->RegisterSelf();
}
