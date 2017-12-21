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
SDName: Stonetalon_Mountains
SD%Complete: 95
SDComment: Quest support: 6523, 1090
SDCategory: Stonetalon Mountains
EndScriptData */

#include "scriptPCH.h"

/*######
## npc_kaya
######*/

enum
{
    NPC_GRIMTOTEM_RUFFIAN       = 11910,
    NPC_GRIMTOTEM_BRUTE         = 11912,
    NPC_GRIMTOTEM_SORCERER      = 11913,

    SAY_START                   = -1000357,
    SAY_AMBUSH                  = -1000358,
    SAY_END                     = -1000359,

    QUEST_PROTECT_KAYA          = 6523
};

struct npc_kayaAI : public npc_escortAI
{
    npc_kayaAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void Reset() { }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->AI()->AttackStart(m_creature);
    }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            //Ambush
            case 16:
                //note about event here:
                //apparently NPC say _after_ the ambush is over, and is most likely a bug at you-know-where.
                //we simplify this, and make say when the ambush actually start.
                DoScriptText(SAY_AMBUSH, m_creature);
                m_creature->SummonCreature(NPC_GRIMTOTEM_RUFFIAN, -50.75f, -500.77f, -46.13f, 0.4f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
                m_creature->SummonCreature(NPC_GRIMTOTEM_BRUTE, -40.05f, -510.89f, -46.05f, 1.7f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
                m_creature->SummonCreature(NPC_GRIMTOTEM_SORCERER, -32.21f, -499.20f, -45.35f, 2.8f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000);
                break;
            // Award quest credit
            case 18:
                DoScriptText(SAY_END, m_creature);

                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_PROTECT_KAYA, m_creature);
                break;
        }
    }
};

CreatureAI* GetAI_npc_kaya(Creature* pCreature)
{
    return new npc_kayaAI(pCreature);
}

bool QuestAccept_npc_kaya(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    //Casting Spell and Starting the Escort quest is buggy, so this is a hack. Use the spell when it is possible.

    if (pQuest->GetQuestId() == QUEST_PROTECT_KAYA)
    {
        pCreature->setFaction(FACTION_ESCORT_H_PASSIVE);
        DoScriptText(SAY_START, pCreature);

        if (npc_kayaAI* pEscortAI = dynamic_cast<npc_kayaAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

/*######
## npc_piznik (quest 1090 by Rockette)
######*/

#define QUEST_GERENOS_ORDERS 1090

struct npc_piznikAI : public ScriptedAI
{
    enum Phase
    {
        EVENT_PHASE_INIT,
        EVENT_PHASE_SECOND_WAVE,
        EVENT_PHASE_THIRD_WAVE,
        EVENT_PHASE_END
    };

    npc_piznikAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        InEvent = false;
        EventTimer = 0;
    }

    void Reset() override
    {
    }

    void JustSummoned(Creature* pSummoned) override
    {
        pSummoned->GetMotionMaster()->MovePoint(2, 959.93f, -261.39f, -5.75f,MOVE_PATHFINDING);
        pSummoned->SetHomePosition(959.931335f, -261.39f, -5.74659f,  5.32f);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (InEvent)
            if (Player *pPlayer = m_creature->GetMap()->GetPlayer(pGuid))
                pPlayer->FailQuest(QUEST_GERENOS_ORDERS);
        InEvent = false;
    }

    void StartEvent(Player *plr)
    {
        if (InEvent)
            return;
        InEvent = true;
        EventPhase = EVENT_PHASE_INIT;
        EventTimer = 0;
        pGuid = plr->GetObjectGuid();
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP);
        m_creature->SetFactionTemporary(495, TEMPFACTION_RESTORE_RESPAWN);
    }
    void AttackStart(Unit* pWho) override
    {
        if (InEvent)
             return;

        ScriptedAI::AttackStart(pWho);
    }
    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_creature->SelectHostileTarget() || m_creature->getVictim())
                DoMeleeAttackIfReady();
        else if(InEvent)
        {
            if (EventPhase == EVENT_PHASE_INIT)
            {
                m_creature->SummonCreature(3998, 935.6930f, -262.0789f, -2.1552f, 0.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                m_creature->SummonCreature(4001, 931.6735f, -261.3967f, -2.0203f, 6.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                EventPhase = EVENT_PHASE_SECOND_WAVE;
            }
            if (EventTimer > 60000 && EventPhase == EVENT_PHASE_SECOND_WAVE)
            {
                m_creature->SummonCreature(3998, 935.6930f, -262.0789f, -2.1552f, 0.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                m_creature->SummonCreature(4001, 931.6735f, -261.3967f, -2.0203f, 6.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                m_creature->SummonCreature(3998, 930.4216f, -266.4603f, -1.6689f, 0.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                EventPhase = EVENT_PHASE_THIRD_WAVE;
            }
            if (EventTimer > 120000 && EventPhase == EVENT_PHASE_THIRD_WAVE)
            {
                m_creature->SummonCreature(3998, 935.6930f, -262.0789f, -2.1552f, 0.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                m_creature->SummonCreature(4001, 931.6735f, -261.3967f, -2.0203f, 6.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                m_creature->SummonCreature(4003, 930.4216f, -266.4603f, -1.6689f, 0.5f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
                EventPhase = EVENT_PHASE_END;
            }
            if (EventTimer > 180000 && EventPhase == EVENT_PHASE_END)
            {
                if (Player *pPlayer = m_creature->GetMap()->GetPlayer(pGuid))
                    pPlayer->GroupEventHappens(QUEST_GERENOS_ORDERS, m_creature);
                InEvent = false;
                m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP);
                m_creature->RestoreFaction();
            }
            EventTimer += uiDiff;
        }
    }

    bool InEvent;
    uint32 EventTimer;
    Phase EventPhase;
    ObjectGuid pGuid;
};

CreatureAI* GetAI_npc_piznik(Creature* pCreature)
{
    return new npc_piznikAI(pCreature);
}

bool QuestAccept_npc_piznik(Player *pPlayer, Creature *pCreature, const Quest *pQuest)
{
    if (pQuest->GetQuestId() == QUEST_GERENOS_ORDERS)
    {
        if (npc_piznikAI *pPiznik = dynamic_cast<npc_piznikAI*>(pCreature->AI()))
            pPiznik->StartEvent(pPlayer);
    }
    return true;
}

/*######
## AddSC
######*/

void AddSC_stonetalon_mountains()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_kaya";
    newscript->GetAI = &GetAI_npc_kaya;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_kaya;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_piznik";
    newscript->GetAI = &GetAI_npc_piznik;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_piznik;
    newscript->RegisterSelf();
}
