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

    void Reset()
    {
        Reset_Timer = 0;
        m_creature->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
    }

    void SpellHit(Unit *caster, const SpellEntry *spell)
    {
        if (caster->GetTypeId() == TYPEID_PLAYER)
        {
            //Yenniku's Release
            if (!bReset && ((Player*)caster)->GetQuestStatus(592) == QUEST_STATUS_INCOMPLETE && spell->Id == 3607)
            {
                m_creature->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STUN);
                m_creature->CombatStop();                   //stop combat
                m_creature->DeleteThreatList();             //unsure of this
                m_creature->setFaction(83);                 //horde generic

                bReset = true;
                Reset_Timer = 60000;
            }
        }
        return;
    }

    void Aggro(Unit *who) {}

    void UpdateAI(const uint32 diff)
    {
        if (bReset)
            if (Reset_Timer < diff)
            {
                EnterEvadeMode();
                bReset = false;
                m_creature->setFaction(28);                     //troll, bloodscalp
            }
            else Reset_Timer -= diff;

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
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

    void Reset()
    {
        Speach_Timer = 360000;
    }


    void UpdateAI(const uint32 diff)
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
    go_transpolyporterAI(GameObject* pGo) : GameObjectAI(pGo)
    {}

    bool OnUse(Unit* user)
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
## npc_molthor
######*/

enum
{
    NPC_HEART_OF_HAKKAR                 = 15069,

    GO_HEART_OF_HAKKAR_SPELL_EMITTER    = 180391,

    QUEST_THE_HEART_OF_HAKKAR           = 8183,

    SAY_MOLTHOR_1                       = -1000847,
    SAY_MOLTHOR_2                       = -1000848,
    SAY_MOLTHOR_3                       = -1000849
};

static const float heartPosition[4] = { -11818.55f, 1344.4f, 7.93f, 0.0f };
static const int emitterCount = 5;
static const float emitterPositions[emitterCount][4] = {
    { -11818.55f, 1344.40f,  7.93f, 0.0f }, // Zandalar Isle
    { -11771.92f, 1273.80f,  3.96f, 0.0f },
    { -11881.53f, 1250.42f,  6.72f, 0.0f },
    { -14335.85f,  513.95f,  8.86f, 0.0f }, // Booty Bay
    { -14421.20f,  475.50f, 11.54f, 0.0f }
};

struct npc_molthorAI : public npc_escortAI
{
    npc_molthorAI(Creature *pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    } 

    uint32 m_uiTimer;
    uint32 m_uiPhase;

    void Reset() override
    {
        m_uiTimer = 0;
        m_uiPhase = 0;
    }

    void WaypointReached(uint32 uiPointId)
    {
        if (uiPointId == 7)
        {
            SetEscortPaused(true);
            m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
            DoScriptText(SAY_MOLTHOR_2, m_creature);

            float x = heartPosition[0];
            float y = heartPosition[1];
            float z = heartPosition[2];
            float o = heartPosition[3];
            m_creature->SummonCreature(NPC_HEART_OF_HAKKAR, x, y, z, o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30000);

            m_uiTimer = 20000;
            m_uiPhase = 1;
        }
    }

    void SummonSpellEmitters()
    {
        Player *player = GetPlayerForEscort();
        if (!player)
            return;

        for (int i = 0; i < emitterCount; ++i)
        {
            float x = emitterPositions[i][0];
            float y = emitterPositions[i][1];
            float z = emitterPositions[i][2];
            float o = emitterPositions[i][3];

            GameObject *emitter = m_creature->SummonGameObject(GO_HEART_OF_HAKKAR_SPELL_EMITTER, x, y, z, o, 0.0f, 0.0f, 0.0f, 0.0f, 5000);
            if (emitter) {
                emitter->SetOwnerGuid(ObjectGuid()); // FIXME
                emitter->Use(player);
                emitter->SetOwnerGuid(m_creature->GetObjectGuid());
            }
        }
    }

    void UpdateEscortAI(const uint32 uiDiff) override
    {
        if (m_uiPhase)
        {
            if (m_uiTimer <= uiDiff)
            {
                switch (m_uiPhase)
                {
                    case 1:
                        m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                        m_creature->MonsterYellToZone(SAY_MOLTHOR_3, 0, GetPlayerForEscort());
                        SummonSpellEmitters();

                        m_uiTimer = 5000;
                        m_uiPhase = 2;
                        break;
                    case 2:
                        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                        m_creature->SetWalk(false);
                        SetEscortPaused(false);

                        m_uiTimer = 0;
                        m_uiPhase = 0;
                        break;
                }
            }
            else
                m_uiTimer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_molthor(Creature *pCreature)
{
    return new npc_molthorAI(pCreature);
}

bool QuestComplete_npc_molthor(Player *pPlayer, Creature *pCreature, const Quest *pQuest)
{
    npc_molthorAI *molthorAI = dynamic_cast<npc_molthorAI*>(pCreature->AI());

    if (pQuest->GetQuestId() == QUEST_THE_HEART_OF_HAKKAR && molthorAI)
    {
        molthorAI->Start(false, pPlayer->GetObjectGuid(), NULL, true);
        pCreature->MonsterSay(SAY_MOLTHOR_1);
    }

    return true;
}

/*######
## npc_heart_of_hakkar
######*/

enum
{
    SPELL_CREATE_HEART_OF_HAKKAR_RIFT           = 24202,
    SPELL_HEART_OF_HAKKAR_BANNING               = 24203,
    SPELL_HEART_OF_HAKKAR_IMPLODE               = 24204,
    SPELL_CREATE_HEART_OF_HAKKAR_EXPLOSION      = 24215,
    SPELL_RITUAL_CAST_VISUAL                    = 24217,
    SPELL_CREATE_HEART_OF_HAKKAR_SUMMON_CIRCLE  = 24602,

    NPC_SERVANT_OF_THE_HAND                     = 15080,

    GO_HEART_OF_HAKKAR_OBJECT                   = 180402
};

static const int servantCount = 4;
static const float servantPositions[servantCount][4] = {
    {-11817.5f, 1325.0f, 1.46f, 1.58f},
    {-11831.3f, 1331.3f, 1.84f, 0.75f},
    {-11834.8f, 1349.4f, 2.01f, 6.00f},
    {-11800.9f, 1335.2f, 1.26f, 2.65f}
};

struct npc_heart_of_hakkarAI : public ScriptedAI
{
    npc_heart_of_hakkarAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool m_bInitialized;
    uint32 m_uiTimer;

    void Reset() override
    {
        m_bInitialized = false;
        m_uiTimer = 0;
    }

    void SummonServants()
    {
        for (int i = 0; i < servantCount; ++i)
        {
            float x = servantPositions[i][0];
            float y = servantPositions[i][1];
            float z = servantPositions[i][2];
            float o = servantPositions[i][3];

            Creature *servant = m_creature->SummonCreature(NPC_SERVANT_OF_THE_HAND, x, y, z, o, TEMPSUMMON_TIMED_DESPAWN, 30000);

            if (servant)
            {
                servant->CastSpell(servant, SPELL_CREATE_HEART_OF_HAKKAR_SUMMON_CIRCLE, true);
                servant->CastSpell(servant, SPELL_RITUAL_CAST_VISUAL, true);
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_bInitialized)
        {
            m_creature->CastSpell(m_creature, SPELL_CREATE_HEART_OF_HAKKAR_RIFT, true);
            m_creature->CastSpell(m_creature, SPELL_HEART_OF_HAKKAR_BANNING, true);

            float x, y, z;
            m_creature->GetPosition(x, y, z);
            float o = m_creature->GetOrientation();
            m_creature->SummonGameObject(GO_HEART_OF_HAKKAR_OBJECT, x, y, z, o, 0.0f, 0.0f, 0.0f, 0.0f, 30000);

            SummonServants();

            m_bInitialized = true;
            m_uiTimer = 13000;
        }

        if (m_uiTimer)
        {
            if (m_uiTimer <= uiDiff)
            {
                m_creature->CastSpell(m_creature, SPELL_CREATE_HEART_OF_HAKKAR_EXPLOSION, true);
                m_creature->CastSpell(m_creature, SPELL_HEART_OF_HAKKAR_IMPLODE, true);
                m_creature->ForcedDespawn(2000);
                m_uiTimer = 0;
            }
            else
                m_uiTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_heart_of_hakkar(Creature *pCreature)
{
    return new npc_heart_of_hakkarAI(pCreature);
}

/*######
## npc_servant_of_the_hand
######*/

enum
{
    SPELL_TELEPORT_SPAWN_OUT = 24221
};

struct npc_servant_of_the_handAI : public ScriptedAI
{
    npc_servant_of_the_handAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSpawnOutTimer;

    void Reset() override
    {
        if (m_creature->IsTemporarySummon())
        {
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            m_uiSpawnOutTimer = urand(0, 1) ? 25500 : 26500;
        }
        else
            m_uiSpawnOutTimer = 0;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_uiSpawnOutTimer)
        {
            if (m_uiSpawnOutTimer <= uiDiff)
            {
                m_creature->CastSpell(m_creature, SPELL_TELEPORT_SPAWN_OUT, false);
                m_uiSpawnOutTimer = 0;
            }
            else
                m_uiSpawnOutTimer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
}; 

CreatureAI* GetAI_npc_servant_of_the_hand(Creature *pCreature)
{
    return new npc_servant_of_the_handAI(pCreature);
}


/*######
## npc_pats_hellfire_guy
######*/

enum
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

    void UpdateAI(const uint32 uiDiff) override
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

enum
{
    NPC_ENRAGED_SILVERBACK_GORILLA  = 1511,
    NPC_KONDA                       = 1516,
    NPC_MOKK_THE_SAVAGE             = 1514,

    QUEST_STRANHLETHORN_FEVER       = 349,

    MAX_WAVE_COUNT                  = 3
};

const float ApesSummon[4] =
{
    -13773.6231f, -3.8856f, 41.5641f, 5.7f
};

#define UNBAGWA_EVENT_START "Get ready everyone! Here come de apes!"

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

    void Reset() override
    {

    }

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

    void SummonedCreatureDespawn(Creature* /*pCreature*/) override
    {
        if (!m_bStartEvent)
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
        m_creature->MonsterYell(UNBAGWA_EVENT_START);
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->SetFactionTemporary(FACTION_ESCORT_N_NEUTRAL_PASSIVE, TEMPFACTION_NONE);
        m_bStartEvent = true;
    }

    void UpdateAI(const uint32 uiDiff) override
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

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

bool QuestRewarded_npc_witch_doctor_unbagwa(Player* /*pPlayer*/, Creature* pCreature, const Quest* pQuest)
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

/*
 *
 */

void AddSC_stranglethorn_vale()
{
    Script *newscript;

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
    newscript->Name = "npc_molthor";
    newscript->GetAI = &GetAI_npc_molthor;
    newscript->pQuestRewardedNPC = &QuestComplete_npc_molthor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_heart_of_hakkar";
    newscript->GetAI = &GetAI_npc_heart_of_hakkar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_servant_of_the_hand";
    newscript->GetAI = &GetAI_npc_servant_of_the_hand;
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
