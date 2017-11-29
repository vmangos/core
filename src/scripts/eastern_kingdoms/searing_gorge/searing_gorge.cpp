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
SDName: Searing_Gorge
SD%Complete: 80
SDComment: Quest support: 3377, 3441 (More accurate info on Kalaran needed). Lothos Riftwaker teleport to Molten Core.
SDCategory: Searing Gorge
EndScriptData */

/* ContentData
npc_kalaran_windblade
npc_lothos_riftwaker
npc_zamael_lunthistle
EndContentData */

#include "scriptPCH.h"

/*######
## npc_kalaran_windblade
######*/

bool GossipHello_npc_kalaran_windblade(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(3441) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Tell me what drives this vengance?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_kalaran_windblade(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Continue please", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(1954, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let me confer with my colleagues", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(1955, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(3441);
            break;
    }
    return true;
}

/*######
## npc_lothos_riftwaker
######*/

bool GossipHello_npc_lothos_riftwaker(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if ((sWorld.GetWowPatch() > WOW_PATCH_102) && (pPlayer->GetQuestRewardStatus(7487) || pPlayer->GetQuestRewardStatus(7848)))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleport me to the Molten Core", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_lothos_riftwaker(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        if (pPlayer->TeleportTo(409, 1096.0f, -467.0f, -104.6f, 3.64f))
            if (!pPlayer->isAlive())
            {
                pPlayer->ResurrectPlayer(0.5f, false);
                pPlayer->SpawnCorpseBones();
            }
    }

    return true;
}

/*######
## npc_zamael_lunthistle
######*/

bool GossipHello_npc_zamael_lunthistle(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(3377) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Tell me your story", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    pPlayer->SEND_GOSSIP_MENU(1920, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_zamael_lunthistle(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please continue...", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(1921, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Goodbye", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(1922, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(3377);
            break;
    }
    return true;
}
/*######
## npc_dorius_stonetender
######*/

enum
{
    SAY_DORIUS_AGGRO_1              = -1000993,
    SAY_DORIUS_AGGRO_2              = -1000994,

    NPC_DARK_IRON_STEELSHIFTER      = 8337,
    MAX_STEELSHIFTERS               = 4,

    QUEST_ID_SUNTARA_STONES         = 3367,
};

struct npc_dorius_stonetenderAI : public npc_escortAI
{
    npc_dorius_stonetenderAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void Reset() override { }

    void Aggro(Unit* pWho) override
    {
        DoScriptText(urand(0, 1) ? SAY_DORIUS_AGGRO_1 : SAY_DORIUS_AGGRO_2, m_creature, pWho);
    }

    void WaypointReached(uint32 uiPointId) override
    {
        switch (uiPointId)
        {
            case 20:
                // ToDo: research if there is any text here!
                float fX, fY, fZ;
                for (uint8 i = 0; i < MAX_STEELSHIFTERS; ++i)
                {
                    m_creature->GetNearPoint(m_creature, fX, fY, fZ, 0, 15.0f, i * M_PI_F / 2);
                    m_creature->SummonCreature(NPC_DARK_IRON_STEELSHIFTER, fX, fY, fZ, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);
                }
                break;
            case 33:
                // ToDo: research if there is any event and text here!
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_ID_SUNTARA_STONES, m_creature);
                m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
                break;
        }
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() == NPC_DARK_IRON_STEELSHIFTER)
            pSummoned->AI()->AttackStart(m_creature);
    }

    void UpdateEscortAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_dorius_stonetender(Creature* pCreature)
{
    return new npc_dorius_stonetenderAI(pCreature);
}

bool QuestAccept_npc_dorius_stonetender(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ID_SUNTARA_STONES)
    {
        if (npc_dorius_stonetenderAI* pStonetenderAI = dynamic_cast<npc_dorius_stonetenderAI*>(pCreature->AI()))
        {
            // ToDo: research if there is any text here
            pCreature->SetStandState(UNIT_STAND_STATE_STAND);
            pCreature->SetFactionTemporary(FACTION_ESCORT_A_NEUTRAL_PASSIVE, TEMPFACTION_RESTORE_RESPAWN);
            pStonetenderAI->Start(false, pPlayer->GetGUID(), pQuest);
        }
        return true;
    }

    return false;
}


/*######
## Quest 3566
######*/

enum
{
    QUEST_RISE_OBSIDION     = 3566,

    SAY_DORIUS1             = -1084001,
    SAY_DORIUS2             = -1084002,
    SAY_DORIUS3             = -1084003,
    SAY_DORIUS4             = -1084004,
    SAY_DORIUS5             = -1084005,
    SAY_DORIUS6             = -1084006,
    EMOTE_DORIUS7           = -1084007,
    SAY_LATHORIC1           = -1084008,
    SAY_LATHORIC2           = -1084009,

    NPC_DORIUS              = 8421,
    NPC_LATHORIC_THE_BLACK  = 8391,
    NPC_OBSIDION            = 8400,

    SPELL_GROUND_SMASH      = 12734,
    SPELL_KNOCK_AWAY        = 10101,
};


struct npc_obsidionAI : public ScriptedAI
{
    int32 m_nextText;
    uint32 m_uiTalkTimer;
    uint32 m_uiGroundSmashTimer;
    uint32 m_uiKnockAwayTimer;
    GuidList m_playerList;
    ObjectGuid m_Dorius;
    bool m_IsEventRunning;


    npc_obsidionAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    void Reset() override
    {
        m_uiGroundSmashTimer = 8000;
        m_uiKnockAwayTimer = 12000;
        m_playerList.clear();
        m_IsEventRunning = false;
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_PASSIVE);

        if (Creature* cr = m_creature->GetMap()->GetCreature(m_Dorius))
            cr->DeleteLater();
        m_Dorius.Clear();

    }

    void StartEvent()
    {
        m_uiTalkTimer = 5000;
        m_nextText = SAY_DORIUS1;
        m_IsEventRunning = true;

        if (Creature* pDorius = m_creature->SummonCreature(NPC_DORIUS, -6460.25f, -1244.86f, 180.36f, 3.04f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 3 * MINUTE * IN_MILLISECONDS))
            m_Dorius = pDorius->GetObjectGuid();
    }


    void SummonedCreatureDespawn(Creature* creature) override
    {
        if (creature->GetEntry() == NPC_LATHORIC_THE_BLACK && (!m_creature->isAlive() || !m_creature->isInCombat()))
            Reset();
    }

    void JustRespawned() override
    {
        Reset();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_IsEventRunning)
            return;

        // talking, only if not in combat
        if (!m_creature->isInCombat())
        {
            if (m_nextText == SAY_LATHORIC1)
            {
               if (Creature* dorius = m_creature->GetMap()->GetCreature(m_Dorius))
                    if (dorius->GetEntry() != NPC_LATHORIC_THE_BLACK)
                        dorius->UpdateEntry(NPC_LATHORIC_THE_BLACK);
            }

            if (m_nextText >= SAY_LATHORIC2 && m_nextText <= SAY_DORIUS1)
            {
                if (m_uiTalkTimer < uiDiff)
                {
                    if (Creature* dorius = m_creature->GetMap()->GetCreature(m_Dorius))
                        DoScriptText(m_nextText, dorius);
                    m_nextText--;
                    m_uiTalkTimer = 6000;
                }
                else
                    m_uiTalkTimer -= uiDiff;
            }

            if (m_nextText < SAY_LATHORIC2) // finished talking, start fighting
            {
                for (GuidList::const_iterator it = m_playerList.begin(); it != m_playerList.end(); ++it)
                {
                    if (Player* player = m_creature->GetMap()->GetPlayer(*it))
                    {
                        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);

                        AttackStart(player);
                        if (Creature* lathoric = m_creature->GetMap()->GetCreature(m_Dorius))
                            lathoric->AI()->AttackStart(player);
                        break;
                    }
                }
            }
       }

        // fighting
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiGroundSmashTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_GROUND_SMASH) == CAST_OK)
                m_uiGroundSmashTimer = 8000;
        }
        else
            m_uiGroundSmashTimer -= uiDiff;


        if (m_uiKnockAwayTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_KNOCK_AWAY) == CAST_OK)
                m_uiKnockAwayTimer = 12000;
        }
        else
            m_uiKnockAwayTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};


bool GossipHello_npc_dying_archaeologist(Player* pPlayer, Creature* pCreature)
{
    if (Creature* Obsidion = GetClosestCreatureWithEntry(pCreature, NPC_OBSIDION, VISIBLE_RANGE))
        return false; /// everything is ok

    pPlayer->PrepareQuestMenu(pCreature->GetObjectGuid(), QUEST_RISE_OBSIDION);
    pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pCreature->GetObjectGuid());

    return true;
}


bool QuestAccept_npc_dying_archaeologist(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_RISE_OBSIDION)
    {
        if (Creature* Obsidion = GetClosestCreatureWithEntry(pCreature, NPC_OBSIDION, VISIBLE_RANGE))
        {
            if (npc_obsidionAI* pObsidionAI = dynamic_cast<npc_obsidionAI*>(Obsidion->AI()))
            {
                if (pObsidionAI->m_IsEventRunning || !Obsidion->isAlive())
                    return false;
                pObsidionAI->StartEvent();
                pObsidionAI->m_playerList.push_back(pPlayer->GetObjectGuid());

                if (Group* pGroup = pPlayer->GetGroup())
                    for (GroupReference* pRef = pGroup->GetFirstMember(); pRef != NULL; pRef = pRef->next())
                        if (Player* pMember = pRef->getSource())
                            pObsidionAI->m_playerList.push_back(pMember->GetObjectGuid());

            }
        }
        else
            return true; // If Obsidion dead --> Dont start quest "Rise Obsidion"
    }
    return false;
}


CreatureAI* GetAI_npc_dorius(Creature* pCreature)
{
    return new npc_obsidionAI(pCreature);
}


/*######
##
######*/

void AddSC_searing_gorge()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_kalaran_windblade";
    newscript->pGossipHello =  &GossipHello_npc_kalaran_windblade;
    newscript->pGossipSelect = &GossipSelect_npc_kalaran_windblade;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lothos_riftwaker";
    newscript->pGossipHello =  &GossipHello_npc_lothos_riftwaker;
    newscript->pGossipSelect = &GossipSelect_npc_lothos_riftwaker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_zamael_lunthistle";
    newscript->pGossipHello =  &GossipHello_npc_zamael_lunthistle;
    newscript->pGossipSelect = &GossipSelect_npc_zamael_lunthistle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_dorius_stonetender";
    newscript->GetAI = &GetAI_npc_dorius_stonetender;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_dorius_stonetender;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_obsidion";
    newscript->GetAI = &GetAI_npc_dorius;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_dying_archaeologist";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_dying_archaeologist;
    newscript->pGossipHello = &GossipHello_npc_dying_archaeologist;
    newscript->RegisterSelf();
}
