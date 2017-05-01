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
SDName: Blasted_Lands
SD%Complete: 90
SDComment: Quest support: 2784, 2801, 3628. Missing some texts for Fallen Hero. Teleporter to Rise of the Defiler missing group support.
SDCategory: Blasted Lands
EndScriptData */

/* ContentData
npc_deathly_usher
npc_fallen_hero_of_horde
EndContentData */

#include "scriptPCH.h"

/*######
## npc_deathly_usher
######*/

#define GOSSIP_ITEM_USHER "I wish to to visit the Rise of the Defiler."

#define SPELL_TELEPORT_SINGLE           12885
#define SPELL_TELEPORT_SINGLE_IN_GROUP  13142
#define SPELL_TELEPORT_GROUP            27686

bool GossipHello_npc_deathly_usher(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(3628) == QUEST_STATUS_INCOMPLETE && pPlayer->HasItemCount(10757, 1))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_USHER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_deathly_usher(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pCreature->CastSpell(pPlayer, SPELL_TELEPORT_SINGLE, true);
    }

    return true;
}

/*######
## npc_fallen_hero_of_horde
######*/

#define GOSSIP_ITEM_FALLEN "Continue..."

#define GOSSIP_ITEM_FALLEN1 "What could be worse than death?"
#define GOSSIP_ITEM_FALLEN2 "Subordinates?"
#define GOSSIP_ITEM_FALLEN3 "What are the stones of binding?"
#define GOSSIP_ITEM_FALLEN4 "You can count on me, Hero"
#define GOSSIP_ITEM_FALLEN5 "I shall"

#define NPC_ENTRY_CORPORAL_SPLITHOOF 7750

#define QUEST_ENTRY_HEROES_OF_OLD1 2702
#define QUEST_ENTRY_HEROES_OF_OLD2 2701

bool GossipHello_npc_fallen_hero_of_horde(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(2784) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Why are you here?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(2801) == QUEST_STATUS_INCOMPLETE && pPlayer->GetTeam() == HORDE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Continue story...", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    if (pPlayer->GetQuestStatus(2801) == QUEST_STATUS_INCOMPLETE && pPlayer->GetTeam() == ALLIANCE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Why are you here?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    bool bCantakeQuest = false;
    if (Quest const* pQuest = sObjectMgr.GetQuestTemplate(QUEST_ENTRY_HEROES_OF_OLD2))
        bCantakeQuest = pPlayer->CanTakeQuest(pQuest, false);
    if ((bCantakeQuest ||
        pPlayer->IsCurrentQuest(QUEST_ENTRY_HEROES_OF_OLD2) ||
        pPlayer->IsCurrentQuest(QUEST_ENTRY_HEROES_OF_OLD1)) &&
        !GetClosestCreatureWithEntry(pPlayer, NPC_ENTRY_CORPORAL_SPLITHOOF, DEFAULT_VISIBILITY_DISTANCE))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I must talk to Corporal Splithoof.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_fallen_hero_of_horde(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 11);
            pPlayer->SEND_GOSSIP_MENU(1392, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+11:
            pPlayer->SEND_GOSSIP_MENU(1411, pCreature->GetGUID());
            if (pPlayer->GetQuestStatus(2784) == QUEST_STATUS_INCOMPLETE)
                pPlayer->AreaExploredOrEventHappens(2784);
            if (pPlayer->GetTeam() == ALLIANCE)
            {
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                pPlayer->SEND_GOSSIP_MENU(1411, pCreature->GetGUID());
            }
            break;

        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 21);
            pPlayer->SEND_GOSSIP_MENU(1451, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+21:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 22);
            pPlayer->SEND_GOSSIP_MENU(1452, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+22:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 23);
            pPlayer->SEND_GOSSIP_MENU(1453, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+23:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 24);
            pPlayer->SEND_GOSSIP_MENU(1454, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+24:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 25);
            pPlayer->SEND_GOSSIP_MENU(1455, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+25:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_FALLEN5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 26);
            pPlayer->SEND_GOSSIP_MENU(1456, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+26:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(2801);
            break;

        case GOSSIP_ACTION_INFO_DEF+3:
            // Start the quest_start_scripts that summons Splithoof
            if (!GetClosestCreatureWithEntry(pPlayer, NPC_ENTRY_CORPORAL_SPLITHOOF, DEFAULT_VISIBILITY_DISTANCE))
                if (Quest const* pQuest = sObjectMgr.GetQuestTemplate(QUEST_ENTRY_HEROES_OF_OLD1))
                    if (uint32 uiQuestScript = pQuest->GetQuestStartScript())
                        pPlayer->GetMap()->ScriptsStart(sQuestStartScripts, uiQuestScript, pCreature, pPlayer);
            pPlayer->CLOSE_GOSSIP_MENU();
            break;
    }
    return true;
}

struct ThadiusGrimshadeAI : public ScriptedAI
{
    ThadiusGrimshadeAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        underEvent = false;
        m_uiBeginTimer = 3000;
        m_uiTranceTimer = 8000;
        grimshadeGUID = 0;
        underTrance = false;
        underSpeak = false;
        m_uiSpeakTimer = 8000;
        sentence = false;
        createObject = false;
        isStun = false;
        playerGUID = 0;
        Reset();
    }

    bool underEvent;
    bool underTrance;
    bool underSpeak;
    bool sentence;
    bool createObject;
    bool isStun;
    uint32 m_uiSpeakTimer;
    uint32 m_uiBeginTimer;
    uint32 m_uiTranceTimer;
    uint64 grimshadeGUID;
    uint64 playerGUID;

    void Reset()
    {
    }

    void QuestCompleted(Player* pPlayer, Quest const* pQuest)
    {
        if (!underEvent)
        {
            playerGUID = pPlayer->GetGUID();
            underEvent = true;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (underEvent)
        {
            if (!createObject)
            {
                if (GameObject* pGo = m_creature->SummonGameObject(144069, -10999.166992f, -3484.187012f, 103.127243f, 2.592681f))
                    grimshadeGUID = pGo->GetGUID();
                createObject = true;
            }
            if (m_uiBeginTimer < uiDiff)
                underTrance = true;
            else
                m_uiBeginTimer -= uiDiff;

        }

        if (underTrance)
        {
            if (!isStun)
            {
                m_creature->HandleEmote(EMOTE_STATE_STUN);
                isStun = true;
            }
            if (m_uiTranceTimer < uiDiff)
                underSpeak = true;
            else
                m_uiTranceTimer -= uiDiff;

        }

        if (underSpeak)
        {
            if (!sentence)
            {
                m_creature->MonsterSay("...Cage...temple...trolls...", 0, 0);
                sentence = true;
            }
            if (m_uiSpeakTimer < uiDiff)
            {
                m_creature->HandleEmote(EMOTE_STATE_NONE);
                if (GameObject* pVision = m_creature->GetMap()->GetGameObject(grimshadeGUID))
                    pVision->Delete();

                underEvent = false;
                m_uiBeginTimer = 3000;
                m_uiTranceTimer = 3000;
                grimshadeGUID = 0;
                underTrance = false;
                underSpeak = false;
                m_uiSpeakTimer = 3000;
                sentence = false;
                createObject = false;
                isStun = false;

                if (Player* player = m_creature->GetMap()->GetPlayer(playerGUID))
                {
                    if (player->GetQuestStatus(2992) == QUEST_STATUS_INCOMPLETE)
                        player->AreaExploredOrEventHappens(2992);
                }
            }
            else
                m_uiSpeakTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_thadius_grimshade(Creature* pCreature)
{
    return new ThadiusGrimshadeAI(pCreature);
}

bool QuestAccept_npc_Thadius_Grimshade(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (pQuest->GetQuestId() != 2992)
        return false;

    if (ThadiusGrimshadeAI* pThadius = dynamic_cast<ThadiusGrimshadeAI*>(pQuestGiver->AI()))
        pThadius->QuestCompleted(pPlayer, pQuest);
    return true;
}
bool GOHello_go_stone_of_binding(Player* pPlayer, GameObject* pGo)
{
// 141812 <= 7668 Servant of Razelikh   // 141857 <= 7669 Servant of Grol
// 141858 <= 7670 Servant of Allistarj  // 141859 <= 7671 Servant of Sevine
    Creature* pCreature = NULL;
    switch(pGo->GetEntry())
    {
        case 141812:
            pCreature = pGo->FindNearestCreature(7668, 30.000000, true);//servant of razelikh
            break;
        case 141857:
            pCreature = pGo->FindNearestCreature(7669, 30.000000, true);//servant of grol
            break;
        case 141858:
            pCreature = pGo->FindNearestCreature(7670, 30.000000, true);//servant of allistarj
            break;
        case 141859:
            pCreature = pGo->FindNearestCreature(7671, 30.000000, true);//servant of sevine
            break;
    }
    if (pCreature)
        pCreature->CastSpell(pCreature, 12938, true);
    return false;
}
void AddSC_blasted_lands()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_deathly_usher";
    newscript->pGossipHello =  &GossipHello_npc_deathly_usher;
    newscript->pGossipSelect = &GossipSelect_npc_deathly_usher;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_thadius_grimshade";
    newscript->GetAI = &GetAI_thadius_grimshade;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_Thadius_Grimshade;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_fallen_hero_of_horde";
    newscript->pGossipHello =  &GossipHello_npc_fallen_hero_of_horde;
    newscript->pGossipSelect = &GossipSelect_npc_fallen_hero_of_horde;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_stone_of_binding";
    newscript->pGOHello = &GOHello_go_stone_of_binding;
    newscript->RegisterSelf();
}
