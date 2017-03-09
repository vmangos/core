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
SDName: Boss_Celebras_the_Cursed
SD%Complete: 100
SDComment:
SDCategory: Maraudon
EndScriptData */

#include "scriptPCH.h"

#define SPELL_WRATH                 21807
#define SPELL_ENTANGLINGROOTS       12747
#define SPELL_CORRUPT_FORCES        21968

#define GO_CELEBRAS_BLUE_AURA       178964

struct celebras_the_cursedAI : public ScriptedAI
{
    celebras_the_cursedAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 Wrath_Timer;
    uint32 EntanglingRoots_Timer;
    uint32 CorruptForces_Timer;

    void Reset()
    {
        Wrath_Timer = 8000;
        EntanglingRoots_Timer = 2000;
        CorruptForces_Timer = 30000;
    }

    void JustDied(Unit* Killer)
    {
        m_creature->SummonCreature(13716, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + 1, 0, TEMPSUMMON_TIMED_DESPAWN, 600000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Wrath
        if (Wrath_Timer < diff)
        {
            Unit* target = NULL;
            target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
            if (target)
                DoCastSpellIfCan(target, SPELL_WRATH);
            Wrath_Timer = 8000;
        }
        else Wrath_Timer -= diff;

        //EntanglingRoots
        if (EntanglingRoots_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_ENTANGLINGROOTS);
            EntanglingRoots_Timer = 20000;
        }
        else EntanglingRoots_Timer -= diff;

        //CorruptForces
        if (CorruptForces_Timer < diff)
        {
            m_creature->InterruptNonMeleeSpells(false);
            DoCastSpellIfCan(m_creature, SPELL_CORRUPT_FORCES);
            CorruptForces_Timer = 20000;
        }
        else CorruptForces_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_celebras_the_cursed(Creature* pCreature)
{
    return new celebras_the_cursedAI(pCreature);
}

struct celebrasSpiritAI : public npc_escortAI
{
    celebrasSpiritAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Event_Timer = 0;
        Point = 0;
        underEvent = false;
        SetEscortPaused(true);
        isFirstWaypoint = false;
        isWaitingTomeRead = false;
        isLinked = false;
        auraGUID = 0;
        isQuestCompleted = false;
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 Event_Timer;
    uint32 Point;
    uint64 playerGUID;
    uint64 auraGUID;
    bool underEvent;
    bool isFirstWaypoint;
    bool isWaitingTomeRead;
    bool isLinked;
    bool isQuestCompleted;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
        SetEscortPaused(true);
    }

    void WaypointReached(uint32 i)
    {
        std::list<GameObject*> scepterList;
        switch (i)
        {
            case 1:
                m_creature->SetOrientation(5.342044f);
                m_creature->MonsterSay("For so long I have drifted in my cursed from. You have freed me... Your hard work shall be repaid.", 0, 0);
                SetRun(false);
                Event_Timer = 8000;
                SetEscortPaused(true);
                Point = i;
                break;

            case 3:
                m_creature->MonsterSay("Please do as I instruct you.", 0, 0);
                Event_Timer = 4000;
                Point = i;
                break;

            case 4:
                m_creature->SetOrientation(3.009412f);
                SetEscortPaused(true);
                break;

            case 5:
                //trigger => Player click on the book
                if (GameObject* pGo = m_creature->FindNearestGameObject(GO_CELEBRAS_BLUE_AURA, 250.0f))
                {
                    pGo->SetRespawnTime(6*MINUTE);
                    pGo->Refresh();
                }
                m_creature->MonsterSay("Shal myrinan ishnu daldorah...", 0, 0);
                if (GameObject* obj = m_creature->SummonGameObject(178964, 652.463013f, 74.085098f, -85.335297f, 3.054616f, 0, 0, 0, 0, -1, false))
                    auraGUID = obj->GetGUID();
                Event_Timer = 4000;
                SetEscortPaused(true);
                Point = i;
                break;

            case 6:
                m_creature->MonsterSay("My scepter will once again become whole!", 0, 0);

                GetGameObjectListWithEntryInGrid(scepterList, m_creature, 178560, 40.0f);
                for (std::list<GameObject*>::iterator it = scepterList.begin(); it != scepterList.end(); ++it)
                    (*it)->UseDoorOrButton(0, false);
                scepterList.clear();

                Point = i;
                break;
            case 9:
                SetEscortPaused(true);
                if (GameObject* pAura = m_creature->GetMap()->GetGameObject(auraGUID))
                    pAura->Delete();
                Event_Timer = 3000;
                Point = i;
                break;
            case 13:
                SetEscortPaused(true);
                Event_Timer = 3000;
                Point = i;
                break;
            default:
                break;
        }
    }

    void QuestCompleted(Player* pPlayer, Quest const* pQuest)
    {
        if (!underEvent)
        {
            isQuestCompleted = false;
            playerGUID = pPlayer->GetGUID();
            m_creature->MonsterSay("You wish to learn of the stone? Follow me.", 0, 0);
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            Event_Timer = 5000;
            SetRun();
            underEvent = true;
            isFirstWaypoint = true;
        }
    }

    void BookRead()
    {
        SetEscortPaused(false);
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
        if (Event_Timer <= uiDiff)
        {
            if (isFirstWaypoint)
            {
                Start(true, NULL, NULL, false);
                isFirstWaypoint = false;
            }

            switch (Point)
            {
                case 1:
                    SetEscortPaused(false);
                    SetRun(false);
                    break;
                case 3:
                    if (!isWaitingTomeRead)
                    {
                        m_creature->SetOrientation(3.009412f);
                        isWaitingTomeRead = true;
                        m_creature->MonsterSay("Read this tome I have placed before you, and speak the words aloud.", 0, 0);
                        //CastSpell Renew druid
                        m_creature->SummonGameObject(178965, 652.175f, 74.069f, -85.334327f, 5.6635f, 0, 0, 0, 0, -1, false);
                        isLinked = true;
                        Event_Timer = 4000;
                        SetEscortPaused(true);
                        m_creature->SetOrientation(3.009412f);
                    }
                    else if (isLinked)
                    {
                        m_creature->MonsterSay("Together, the two parts shall become one, one again.", 0, 0);
                        isLinked = false;
                    }
                    break;
                case 5:
                    SetEscortPaused(false);
                    break;
                case 9:
                    SetEscortPaused(false);
                    break;
                case 13:
                    if (!isQuestCompleted)
                    {
                        isQuestCompleted = true;
                        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

                        if (Player* player = m_creature->GetMap()->GetPlayer(playerGUID))
                        {
                            if (player->GetQuestStatus(7046) == QUEST_STATUS_INCOMPLETE)
                                player->AreaExploredOrEventHappens(7046);


                            if (m_creature->isQuestGiver())
                            {
                                player->PrepareQuestMenu(m_creature->GetGUID());
                                player->SEND_GOSSIP_MENU(player->GetGossipTextId(m_creature), m_creature->GetGUID());
                            }
                        }

                        Event_Timer = 0;
                        Point = 0;
                        underEvent = false;
                        SetEscortPaused(true);
                        isFirstWaypoint = false;
                        isWaitingTomeRead = false;
                        isLinked = false;
                        auraGUID = 0;
                        playerGUID = 0;
                        Stop();
                    }
                    break;
                default:
                    break;
            }
        }
        else
            Event_Timer -= uiDiff;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

bool GossipHello_spirit_celebras(Player* pPlayer, Creature* pCreature)
{
    ScriptedInstance* m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

    if (pCreature->isQuestGiver())
    {
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    }
    return true;
}

bool GOHello_go_book_celebras(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(7046) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->Say("Shal myrinan ishnu daldorah...", 0);
        pGo->Delete();

        std::list<Creature*> celebrasList;
        GetCreatureListWithEntryInGrid(celebrasList, pPlayer, 13716, 40.0f);
        for (std::list<Creature*>::iterator it = celebrasList.begin(); it != celebrasList.end(); ++it)
        {
            if (celebrasSpiritAI* pcelebrasSpirit = dynamic_cast<celebrasSpiritAI*>((*it)->AI()))
                pcelebrasSpirit->BookRead();
        }
        celebrasList.clear();
    }
    return true;
}

bool QuestAccept_celebras_spirit(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (pQuest->GetQuestId() != 7046)
        return false;
    if (celebrasSpiritAI* pcelebrasSpirit = dynamic_cast<celebrasSpiritAI*>(pQuestGiver->AI()))
        pcelebrasSpirit->QuestCompleted(pPlayer, pQuest);
    return true;
}


CreatureAI* GetAI_celebras_spirit(Creature* pCreature)
{
    return new celebrasSpiritAI(pCreature);
}

void AddSC_boss_celebras_the_cursed()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "celebras_the_cursed";
    newscript->GetAI = &GetAI_celebras_the_cursed;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "celebras_spirit";
    newscript->GetAI = &GetAI_celebras_spirit;
    newscript->pGossipHello =  &GossipHello_spirit_celebras;
    newscript->pQuestAcceptNPC = &QuestAccept_celebras_spirit;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_book_celebras";
    newscript->pGOHello = &GOHello_go_book_celebras;
    newscript->RegisterSelf();
}
