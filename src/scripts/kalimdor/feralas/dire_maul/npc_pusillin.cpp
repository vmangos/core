/* Copyright (C) 2009 - 2010 Nostalrius <http://nostalrius.ath.cx/>
 * Auteur        : Daemon
 * All rights reserved */

#include "scriptPCH.h"
#include "dire_maul.h"

#define ME m_creature

enum
{
    TEXT_1 = 9349,
    TEXT_2 = 9353,
    TEXT_3 = 9357,
    TEXT_4 = 9360,
    TEXT_5 = 9363,
    MOVE_SPEED       =  20,
};
/*
INSERT INTO nostalrius_string (entry, content_default)
VALUES
(50, "Si vous voulez la clé, il va falloir m'attraper !"),
(51, "Poursuivez moi si vous l'osez, je m'enfuis sans hésiter !"),
(52, "Pourquoi voudriez vous me faire souffrir ? Venez. L'amitié peut nous réunir !"),
(53, "MEURS ? Vous faîtes pleurer Pusilin !"),
(54, "Dites bonjour à mes petits amis !");
*/
struct npc_pusillinAI : public ScriptedAI
{
    npc_pusillinAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_dire_maul*) pCreature->GetInstanceData();
        ME->SetObjectScale(0.5f);
        ME->setFaction(35);
        uiStep = 0;
        bInCombat = false;
        Reset();
    }

    instance_dire_maul* m_pInstance;
    uint32 uiStep;
    bool bInCombat;
    float fNextPositions[3];
    uint32 uiGlobalCD;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
        std::list<Creature*> m_impList;
        GetCreatureListWithEntryInGrid(m_impList, ME, 13276, 100.0f);
        for (std::list<Creature*>::iterator it = m_impList.begin(); it != m_impList.end(); ++it)
            (*it)->Attack(pWho,true);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!ME->SelectHostileTarget() || !ME->getVictim())
            return;

//        if (!ME->getVictim())
//            return;

        if (uiGlobalCD < uiDiff)
        {
            switch (urand(1, 3))
            {
                case 1: // Boule de feu
                    ME->CastSpell(ME->getVictim(), 15228, false);
                    uiGlobalCD = 6000;
                    break;
                case 2: // Trait de feu
                    ME->CastSpell(ME->getVictim(), 14145, false);
                    uiGlobalCD = 4000;
                    break;
                case 3: // Vague explosive
                    ME->CastSpell(ME->getVictim(), 22424, false);
                    uiGlobalCD = 9000;
                    break;
            }
        }
        else
            uiGlobalCD -= uiDiff;
        DoMeleeAttackIfReady();
    }
    bool PlayerOpenGossip(Player* player)
    {
        switch (uiStep)
        {
            case 0:
                player->ADD_GOSSIP_ITEM(0, "Game ? Are you crazy ?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(ME->GetEntry(), ME->GetGUID());
                break;
            case 1:
                player->ADD_GOSSIP_ITEM(0, "Why you little...", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(ME->GetEntry() + 1, ME->GetGUID());
                break;
            case 2:
                player->ADD_GOSSIP_ITEM(0, "Mark my words, I will catch you, imp. And when I do!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(ME->GetEntry() + 2, ME->GetGUID());
                break;
            case 3:
                player->ADD_GOSSIP_ITEM(0, "DIE!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(ME->GetEntry() + 3, ME->GetGUID());
                break;
            case 4:
                player->ADD_GOSSIP_ITEM(0, "Prepare to meet your maker.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(ME->GetEntry() + 4, ME->GetGUID());
                break;
        }
        return true;
    }
    bool PlayerSelectGossip(Player* pl)
    {
        switch (uiStep)
        {
            case 0:
                ME->MonsterSay(TEXT_1, 0, 0);
                ME->MonsterMoveWithSpeed(-145.0f, -296.9f, -4.12f, -10.0f, MOVE_SPEED, uint32(MOVE_PATHFINDING | MOVE_FORCE_DESTINATION));
                break;
            case 1:
                ME->MonsterSay(TEXT_2, 0, 0);
                ME->MonsterMoveWithSpeed(112.7f, -353.87f, -4.12f, -10.0f, MOVE_SPEED, uint32(MOVE_PATHFINDING | MOVE_FORCE_DESTINATION));
                break;
            case 2:
                ME->MonsterSay(TEXT_3, 0, 0);
                ME->MonsterMoveWithSpeed(50.99f, -632.68f, -25.12f, 10.0f, MOVE_SPEED, uint32(MOVE_PATHFINDING | MOVE_FORCE_DESTINATION));
                break;
            case 3:
                ME->MonsterSay(TEXT_4, 0, 0);
                ME->MonsterMoveWithSpeed(19.091084f, -704.739746f, -12.642583f, -10.0f, MOVE_SPEED, uint32(MOVE_PATHFINDING | MOVE_FORCE_DESTINATION));
                break;
            case 4:
                ME->SetHomePosition(18.19f, -701.15f, -12.64f, 0);
                ME->MonsterSay(TEXT_5, 0, 0);
                ME->setFaction(14);
                ME->SetObjectScale(0.7f);
                ME->CastSpell(ME, 22735, false); // Spirit of Runn Tum
                bInCombat = true;
                AttackStart(pl);
                Creature* tmp;
                if (tmp = ME->SummonCreature(13276, 6.562f, -712.43f, -12.64f, 4.25f, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    tmp->SetWalk(false);
                    tmp->SetHomePosition(18.19f, -701.15f, -12.64f, 0);
                    tmp->Attack(pl, true);
                }

                if (tmp = ME->SummonCreature(13276, 23.994f, -697.89f, -12.64f, 4.25f, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    tmp->SetWalk(false);
                    tmp->SetHomePosition(18.19f, -701.15f, -12.64f, 0);
                    tmp->Attack(pl, true);
                }

                if (tmp = ME->SummonCreature(13276, 22.216f, -688.01f, -12.64f, 4.25f, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    tmp->SetWalk(false);
                    tmp->SetHomePosition(18.19f, -701.15f, -12.64f, 0);
                    tmp->Attack(pl, true);
                }


                if (tmp = ME->SummonCreature(13276, 17.943f, -679.68f, -12.64f, 4.25f, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    tmp->SetWalk(false);
                    tmp->SetHomePosition(18.19f, -701.15f, -12.64f, 0);
                    tmp->Attack(pl, true);
                }

                if (tmp = ME->SummonCreature(13276, 9.540f, -671.08f, -12.64f, 4.25f, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    tmp->SetWalk(false);
                    tmp->SetHomePosition(18.19f, -701.15f, -12.64f, 0);
                    tmp->Attack(pl, true);
                }
                break;
        }
        uiStep++;
        return true;
    }
};

CreatureAI* GetAI_npc_pusillin(Creature* pCreature)
{
    return new npc_pusillinAI(pCreature);
}

bool GossipSelect_npc_pusillin(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    npc_pusillinAI* AI = ((npc_pusillinAI*)_Creature->AI());
    return AI->PlayerSelectGossip(player);
}

bool GossipHello_npc_pusillin(Player *player, Creature *_Creature)
{
    npc_pusillinAI* AI = ((npc_pusillinAI*)_Creature->AI());
    return AI->PlayerOpenGossip(player);
}

void AddSC_npc_pusillin()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "npc_pusillin";
    pNewScript->GetAI = &GetAI_npc_pusillin;
    pNewScript->pGossipHello   = &GossipHello_npc_pusillin;
    pNewScript->pGossipSelect  = &GossipSelect_npc_pusillin;
    pNewScript->RegisterSelf();
}
