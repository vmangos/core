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
SDName: Dustwallow_Marsh
SD%Complete: 95
SDComment: Quest support: 558, 1173, 1273, 1324. Vendor Nat Pagle
SDCategory: Dustwallow Marsh
EndScriptData */

/* ContentData
npc_lady_jaina_proudmoore
npc_morokk
npc_nat_pagle
npc_ogron
npc_private_hendel
npc_cassa_crimsonwing
EndContentData */

#include "scriptPCH.h"

/*######
## npc_lady_jaina_proudmoore
######*/

enum
{
    QUEST_JAINAS_AUTOGRAPH = 558,
    SPELL_JAINAS_AUTOGRAPH = 23122
};

#define GOSSIP_ITEM_JAINA "I know this is rather silly but i have a young ward who is a bit shy and would like your autograph."

bool GossipHello_npc_lady_jaina_proudmoore(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_JAINAS_AUTOGRAPH) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_JAINA, GOSSIP_SENDER_MAIN, GOSSIP_SENDER_INFO);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_lady_jaina_proudmoore(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_SENDER_INFO)
    {
        pPlayer->SEND_GOSSIP_MENU(7012, pCreature->GetGUID());
        pPlayer->CastSpell(pPlayer, SPELL_JAINAS_AUTOGRAPH, false);
    }
    return true;
}

/*######
## npc_morokk
######*/

enum
{
    SAY_MOR_CHALLENGE               = -1000499,
    SAY_MOR_SCARED                  = -1000500,

    QUEST_CHALLENGE_MOROKK          = 1173,

    FACTION_MOR_HOSTILE             = 168,
    FACTION_MOR_RUNNING             = 35
};

struct npc_morokkAI : public npc_escortAI
{
    npc_morokkAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        m_bIsSuccess = false;
        Reset();
    }

    bool m_bIsSuccess;

    void Reset() {}

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 0:
                SetEscortPaused(true);
                break;
            case 1:
                if (m_bIsSuccess)
                    DoScriptText(SAY_MOR_SCARED, m_creature);
                else
                {
                    m_creature->SetDeathState(JUST_DIED);
                    m_creature->Respawn();
                }
                break;
        }
    }

    void AttackedBy(Unit* pAttacker)
    {
        if (m_creature->getVictim())
            return;

        if (m_creature->IsFriendlyTo(pAttacker))
            return;

        AttackStart(pAttacker);
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
    {
        if (HasEscortState(STATE_ESCORT_ESCORTING))
        {
            if (m_creature->GetHealthPercent() < 30.0f)
            {
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_CHALLENGE_MOROKK, m_creature);

                m_creature->setFaction(FACTION_MOR_RUNNING);

                m_bIsSuccess = true;
                EnterEvadeMode();

                uiDamage = 0;
            }
        }
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (HasEscortState(STATE_ESCORT_PAUSED))
            {
                if (Player* pPlayer = GetPlayerForEscort())
                {
                    m_bIsSuccess = false;
                    DoScriptText(SAY_MOR_CHALLENGE, m_creature, pPlayer);
                    m_creature->setFaction(FACTION_MOR_HOSTILE);
                    AttackStart(pPlayer);
                }

                SetEscortPaused(false);
            }

            return;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_morokk(Creature* pCreature)
{
    return new npc_morokkAI(pCreature);
}

bool QuestAccept_npc_morokk(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_CHALLENGE_MOROKK)
    {
        if (npc_morokkAI* pEscortAI = dynamic_cast<npc_morokkAI*>(pCreature->AI()))
            pEscortAI->Start(true, pPlayer->GetGUID(), pQuest);

        return true;
    }

    return false;
}
/*######
## npc_nat_pagle
######*/

enum
{
    QUEST_NATS_MEASURING_TAPE = 8227
};

bool GossipHello_npc_nat_pagle(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pCreature->isVendor() && pPlayer->GetQuestRewardStatus(QUEST_NATS_MEASURING_TAPE))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
        pPlayer->SEND_GOSSIP_MENU(7640, pCreature->GetGUID());
    }
    else
        pPlayer->SEND_GOSSIP_MENU(7638, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_nat_pagle(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_TRADE)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());

    return true;
}

/*######
## npc_ogron
######*/

enum
{
    SAY_OGR_START                       = -1000452,
    SAY_OGR_SPOT                        = -1000453,
    SAY_OGR_RET_WHAT                    = -1000454,
    SAY_OGR_RET_SWEAR                   = -1000455,
    SAY_OGR_REPLY_RET                   = -1000456,
    SAY_OGR_RET_TAKEN                   = -1000457,
    SAY_OGR_TELL_FIRE                   = -1000458,
    SAY_OGR_RET_NOCLOSER                = -1000459,
    SAY_OGR_RET_NOFIRE                  = -1000460,
    SAY_OGR_RET_HEAR                    = -1000461,
    SAY_OGR_CAL_FOUND                   = -1000462,
    SAY_OGR_CAL_MERCY                   = -1000463,
    SAY_OGR_HALL_GLAD                   = -1000464,
    EMOTE_OGR_RET_ARROW                 = -1000465,
    SAY_OGR_RET_ARROW                   = -1000466,
    SAY_OGR_CAL_CLEANUP                 = -1000467,
    SAY_OGR_NODIE                       = -1000468,
    SAY_OGR_SURVIVE                     = -1000469,
    SAY_OGR_RET_LUCKY                   = -1000470,
    SAY_OGR_THANKS                      = -1000471,

    QUEST_QUESTIONING                   = 1273,

    FACTION_GENERIC_FRIENDLY            = 35,
    FACTION_THER_HOSTILE                = 151,

    NPC_REETHE                          = 4980,
    NPC_CALDWELL                        = 5046,
    NPC_HALLAN                          = 5045,
    NPC_SKIRMISHER                      = 5044,

    SPELL_FAKE_SHOT                     = 7105,

    PHASE_INTRO                         = 0,
    PHASE_GUESTS                        = 1,
    PHASE_FIGHT                         = 2,
    PHASE_COMPLETE                      = 3
};

static float m_afSpawn[] = { -3383.501953f, -3203.383301f, 36.149f};
static float m_afMoveTo[] = { -3371.414795f, -3212.179932f, 34.210f};

struct npc_ogronAI : public npc_escortAI
{
    npc_ogronAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        lCreatureList.clear();
        m_uiPhase = 0;
        m_uiPhaseCounter = 0;
        Reset();
    }

    std::list<Creature*> lCreatureList;

    uint32 m_uiPhase;
    uint32 m_uiPhaseCounter;
    uint32 m_uiGlobalTimer;

    void Reset()
    {
        m_uiGlobalTimer = 5000;

        if (HasEscortState(STATE_ESCORT_PAUSED) && m_uiPhase == PHASE_FIGHT)
            m_uiPhase = PHASE_COMPLETE;

        if (!HasEscortState(STATE_ESCORT_ESCORTING))
        {
            lCreatureList.clear();
            m_uiPhase = 0;
            m_uiPhaseCounter = 0;
        }
    }

    void MoveInLineOfSight(Unit* pWho)
    {
        if (HasEscortState(STATE_ESCORT_ESCORTING) && pWho->GetEntry() == NPC_REETHE && lCreatureList.empty())
            lCreatureList.push_back((Creature*)pWho);

        npc_escortAI::MoveInLineOfSight(pWho);
    }

    Creature* GetCreature(uint32 uiCreatureEntry)
    {
        if (!lCreatureList.empty())
        {
            for (std::list<Creature*>::iterator itr = lCreatureList.begin(); itr != lCreatureList.end(); ++itr)
            {
                if ((*itr)->GetEntry() == uiCreatureEntry && (*itr)->isAlive())
                    return (*itr);
            }
        }

        return NULL;
    }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 9:
                DoScriptText(SAY_OGR_SPOT, m_creature);
                break;
            case 10:
                if (Creature* pReethe = GetCreature(NPC_REETHE))
                    DoScriptText(SAY_OGR_RET_WHAT, pReethe);
                break;
            case 11:
                SetEscortPaused(true);
                break;
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        lCreatureList.push_back(pSummoned);

        pSummoned->setFaction(FACTION_GENERIC_FRIENDLY);

        if (pSummoned->GetEntry() == NPC_CALDWELL)
            pSummoned->GetMotionMaster()->MovePoint(0, m_afMoveTo[0], m_afMoveTo[1], m_afMoveTo[2]);
        else
        {
            if (Creature* pCaldwell = GetCreature(NPC_CALDWELL))
            {
                //will this conversion work without compile warning/error?
                size_t iSize = lCreatureList.size();
                pSummoned->GetMotionMaster()->MoveFollow(pCaldwell, 0.5f, (M_PI / 2) * (int)iSize);
            }
        }
    }

    void DoStartAttackMe()
    {
        if (!lCreatureList.empty())
        {
            for (std::list<Creature*>::iterator itr = lCreatureList.begin(); itr != lCreatureList.end(); ++itr)
            {
                if ((*itr)->GetEntry() == NPC_REETHE)
                    continue;

                if ((*itr)->isAlive())
                {
                    (*itr)->setFaction(FACTION_THER_HOSTILE);
                    (*itr)->AI()->AttackStart(m_creature);
                }
            }
        }
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (HasEscortState(STATE_ESCORT_PAUSED))
            {
                if (m_uiGlobalTimer < uiDiff)
                {
                    m_uiGlobalTimer = 5000;

                    switch (m_uiPhase)
                    {
                        case PHASE_INTRO:
                        {
                            switch (m_uiPhaseCounter)
                            {
                                case 0:
                                    if (Creature* pReethe = GetCreature(NPC_REETHE))
                                        DoScriptText(SAY_OGR_RET_SWEAR, pReethe);
                                    break;
                                case 1:
                                    DoScriptText(SAY_OGR_REPLY_RET, m_creature);
                                    break;
                                case 2:
                                    if (Creature* pReethe = GetCreature(NPC_REETHE))
                                        DoScriptText(SAY_OGR_RET_TAKEN, pReethe);
                                    break;
                                case 3:
                                    DoScriptText(SAY_OGR_TELL_FIRE, m_creature);
                                    if (Creature* pReethe = GetCreature(NPC_REETHE))
                                        DoScriptText(SAY_OGR_RET_NOCLOSER, pReethe);
                                    break;
                                case 4:
                                    if (Creature* pReethe = GetCreature(NPC_REETHE))
                                        DoScriptText(SAY_OGR_RET_NOFIRE, pReethe);
                                    break;
                                case 5:
                                    if (Creature* pReethe = GetCreature(NPC_REETHE))
                                        DoScriptText(SAY_OGR_RET_HEAR, pReethe);

                                    m_creature->SummonCreature(NPC_CALDWELL, m_afSpawn[0], m_afSpawn[1], m_afSpawn[2], 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000);
                                    m_creature->SummonCreature(NPC_HALLAN, m_afSpawn[0], m_afSpawn[1], m_afSpawn[2], 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000);
                                    m_creature->SummonCreature(NPC_SKIRMISHER, m_afSpawn[0], m_afSpawn[1], m_afSpawn[2], 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000);
                                    m_creature->SummonCreature(NPC_SKIRMISHER, m_afSpawn[0], m_afSpawn[1], m_afSpawn[2], 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000);

                                    m_uiPhase = PHASE_GUESTS;
                                    break;
                            }
                            break;
                        }
                        case PHASE_GUESTS:
                        {
                            switch (m_uiPhaseCounter)
                            {
                                case 6:
                                    if (Creature* pCaldwell = GetCreature(NPC_CALDWELL))
                                        DoScriptText(SAY_OGR_CAL_FOUND, pCaldwell);
                                    break;
                                case 7:
                                    if (Creature* pCaldwell = GetCreature(NPC_CALDWELL))
                                        DoScriptText(SAY_OGR_CAL_MERCY, pCaldwell);
                                    break;
                                case 8:
                                    if (Creature* pHallan = GetCreature(NPC_HALLAN))
                                    {
                                        DoScriptText(SAY_OGR_HALL_GLAD, pHallan);

                                        if (Creature* pReethe = GetCreature(NPC_REETHE))
                                            pHallan->CastSpell(pReethe, SPELL_FAKE_SHOT, false);
                                    }
                                    break;
                                case 9:
                                    if (Creature* pReethe = GetCreature(NPC_REETHE))
                                    {
                                        DoScriptText(EMOTE_OGR_RET_ARROW, pReethe);
                                        DoScriptText(SAY_OGR_RET_ARROW, pReethe);
                                    }
                                    break;
                                case 10:
                                    if (Creature* pCaldwell = GetCreature(NPC_CALDWELL))
                                        DoScriptText(SAY_OGR_CAL_CLEANUP, pCaldwell);

                                    DoScriptText(SAY_OGR_NODIE, m_creature);
                                    break;
                                case 11:
                                    DoStartAttackMe();
                                    m_uiPhase = PHASE_FIGHT;
                                    break;
                            }
                            break;
                        }
                        case PHASE_COMPLETE:
                        {
                            switch (m_uiPhaseCounter)
                            {
                                case 12:
                                    if (Player* pPlayer = GetPlayerForEscort())
                                        pPlayer->GroupEventHappens(QUEST_QUESTIONING, m_creature);

                                    DoScriptText(SAY_OGR_SURVIVE, m_creature);
                                    break;
                                case 13:
                                    if (Creature* pReethe = GetCreature(NPC_REETHE))
                                        DoScriptText(SAY_OGR_RET_LUCKY, pReethe);
                                    break;
                                case 14:
                                    DoScriptText(SAY_OGR_THANKS, m_creature);
                                    SetRun();
                                    SetEscortPaused(false);
                                    break;
                            }
                            break;
                        }
                    }

                    if (m_uiPhase != PHASE_FIGHT)
                        ++m_uiPhaseCounter;
                }
                else
                    m_uiGlobalTimer -= uiDiff;
            }

            return;
        }

        DoMeleeAttackIfReady();
    }
};

bool QuestAccept_npc_ogron(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_QUESTIONING)
    {
        if (npc_ogronAI* pEscortAI = dynamic_cast<npc_ogronAI*>(pCreature->AI()))
        {
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest, true);
            pCreature->setFaction(FACTION_ESCORT_N_FRIEND_PASSIVE);
            DoScriptText(SAY_OGR_START, pCreature, pPlayer);
        }
    }

    return true;
}

CreatureAI* GetAI_npc_ogron(Creature* pCreature)
{
    return new npc_ogronAI(pCreature);
}

/*######
## npc_private_hendel
######*/

enum
{
    SAY_PROGRESS_1_TER          = -1000411,
    SAY_PROGRESS_2_HEN          = -1000412,
    SAY_PROGRESS_3_TER          = -1000413,
    SAY_PROGRESS_4_TER          = -1000414,
    EMOTE_SURRENDER             = -1000415,

    QUEST_MISSING_DIPLO_PT16    = 1324,
    FACTION_HOSTILE             = 168,                      //guessed, may be different

    NPC_SENTRY                  = 5184,                     //helps hendel
    NPC_JAINA                   = 4968,                     //appears once hendel gives up
    NPC_TERVOSH                 = 4967
};

//TODO: develop this further, end event not created
struct npc_private_hendelAI : public ScriptedAI
{
    npc_private_hendelAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        if (m_creature->getFaction() != m_creature->GetCreatureInfo()->faction_A)
            m_creature->setFaction(m_creature->GetCreatureInfo()->faction_A);
    }

    void AttackedBy(Unit* pAttacker)
    {
        if (m_creature->getVictim())
            return;

        if (m_creature->IsFriendlyTo(pAttacker))
            return;

        AttackStart(pAttacker);
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
    {
        if (uiDamage > m_creature->GetHealth() || m_creature->GetHealthPercent() < 20.0f)
        {
            uiDamage = 0;

            if (Player* pPlayer = pDoneBy->GetCharmerOrOwnerPlayerOrPlayerItself())
                pPlayer->GroupEventHappens(QUEST_MISSING_DIPLO_PT16, m_creature);

            DoScriptText(EMOTE_SURRENDER, m_creature);
            EnterEvadeMode();
        }
    }
};

bool QuestAccept_npc_private_hendel(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_MISSING_DIPLO_PT16)
        pCreature->setFaction(FACTION_HOSTILE);

    return true;
}

CreatureAI* GetAI_npc_private_hendel(Creature* pCreature)
{
    return new npc_private_hendelAI(pCreature);
}

/*######
## npc_cassa_crimsonwing
######*/

enum
{
    QUEST_SURVEY_ALCAZ          = 11142,
    SPELL_ALCAZ_SURVEY          = 42295
};

#define GOSSIP_RIDE             "<Ride the gryphons to Survey Alcaz Island>"

bool GossipHello_npc_cassa_crimsonwing(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_SURVEY_ALCAZ) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_RIDE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_cassa_crimsonwing(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pPlayer->CastSpell(pPlayer, SPELL_ALCAZ_SURVEY, false);
    }
    return true;
}

/*####
# Alita
# npc_stinky_ignatz
####*/

enum
{
    QUEST_STINKYS_ESCAPE_A   = 1222,
    QUEST_STINKYS_ESCAPE_H   = 1270,
    SAY_IGNATZ_START         = -1780190,
    SAY_IGNATZ_1             = -1780191,
    SAY_IGNATZ_2             = -1780192,
    SAY_IGNATZ_3             = -1780193,
    SAY_IGNATZ_4             = -1780194,
    SAY_IGNATZ_END           = -1780195,
    GOBJ_BOGBEAN_PLANT       = 20939
};

struct npc_stinky_ignatzAI : public npc_escortAI
{
    npc_stinky_ignatzAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        currWaypoint = 0;
        timer = 21000;
        Reset();
    }

    void Reset() {}

    void JustRespawned()
    {
        currWaypoint = 0;
        timer = 21000;
        npc_escortAI::JustRespawned();
    }

    uint32 currWaypoint;
    uint32 timer;

    void WaypointReached(uint32 uiPointId)
    {
        currWaypoint = uiPointId;

        switch (uiPointId)
        {
            case 0:
                DoScriptText(SAY_IGNATZ_START, m_creature);
                break;
            case 8:
                DoScriptText(SAY_IGNATZ_1, m_creature);
                break;
            case 16:
                timer = 4000;
                if (GameObject* pGo = m_creature->FindNearestGameObject(GOBJ_BOGBEAN_PLANT, 40.0f))
                    if (!pGo->isSpawned())
                        pGo->Respawn();
                break;
            case 18:
                timer = 2000;
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
                break;
            case 24:
                if (Player* pPlayer = GetPlayerForEscort())
                {
                    DoScriptText(SAY_IGNATZ_END, m_creature, pPlayer);
                    if (pPlayer->GetQuestStatus(QUEST_STINKYS_ESCAPE_A) == QUEST_STATUS_INCOMPLETE)
                        pPlayer->GroupEventHappens(QUEST_STINKYS_ESCAPE_A, m_creature);
                    else if (pPlayer->GetQuestStatus(QUEST_STINKYS_ESCAPE_H) == QUEST_STATUS_INCOMPLETE)
                        pPlayer->GroupEventHappens(QUEST_STINKYS_ESCAPE_H, m_creature);
                }
                break;
        }
    }
    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (timer < 20000)
            {
                switch (currWaypoint)
                {
                    case 16 :
                        if (timer < uiDiff)
                        {
                            if (Player* pPlayer = GetPlayerForEscort())
                                DoScriptText(SAY_IGNATZ_3, m_creature, pPlayer);
                            timer = 21000;
                        }
                        else
                        {
                            if (timer >= 1000 && timer < 1000 + uiDiff)
                                DoScriptText(SAY_IGNATZ_2, m_creature);
                            timer -= uiDiff;
                        }
                        break;
                    case 18 :
                        if (timer < uiDiff)
                        {
                            DoScriptText(SAY_IGNATZ_4, m_creature);
                            timer = 21000;
                        }
                        else
                        {
                            if (timer >= 1000 && timer < 1000 + uiDiff)
                            {
                                if (GameObject* pGo = m_creature->FindNearestGameObject(GOBJ_BOGBEAN_PLANT, 10.000000))
                                    pGo->Despawn();
                                m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                            }
                            timer -= uiDiff;
                        }
                        break;
                }
            }
        }
        //DoMeleeAttackIfReady();
        npc_escortAI::UpdateAI(uiDiff);
    }
};

bool QuestAccept_npc_stinky_ignatz(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_STINKYS_ESCAPE_A || pQuest->GetQuestId() == QUEST_STINKYS_ESCAPE_H)
    {
        pCreature->setFaction(113);
        pCreature->SetStandState(UNIT_STAND_STATE_STAND);
        if (npc_stinky_ignatzAI* pEscortAI = dynamic_cast<npc_stinky_ignatzAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

CreatureAI* GetAI_npc_stinky_ignatz(Creature* pCreature)
{
    return new npc_stinky_ignatzAI(pCreature);
}

/*
 * Tabetha
 */

enum
{
    GO_MANA_RIFT = 103680,

    NPC_MANA_SURGE = 6550
};

static const float ManaSurgesSpawnPoint[3] =
{
    -4019.22f,	-3383.91f,	38.2265f
};

struct npc_tabethaAI : ScriptedAI
{
    explicit npc_tabethaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_tabethaAI::Reset();
    }

    uint32  m_uiManaSurgeSpawnTimer;
    uint32  m_uiManaSurgesEventTimer;
    uint8   m_uiWaveCount;
    uint8   m_uiManaSurgesCount;

    bool m_uiManaSurgesInProcess;
    bool m_uiManaRiftRespawned;

    void Reset() override
    {
        m_uiManaSurgeSpawnTimer = urand(1000, 5000);
        m_uiManaSurgesEventTimer = 10 * MINUTE*IN_MILLISECONDS + 100;
        m_uiWaveCount = 1;
        m_uiManaSurgesCount = 0;

        m_uiManaSurgesInProcess = false;
        m_uiManaRiftRespawned = false;
    }

    void StartManaSurges()
    {
        if (!m_uiManaSurgesInProcess)
        {
            m_uiManaSurgesInProcess = true;
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (pSummoned && pSummoned->GetEntry() == NPC_MANA_SURGE)
            --m_uiManaSurgesCount;
    }

    void SpawnManaSurge(uint8 count)
    {
        for (uint8 i = 0; i < count; ++i)
        {
            if (Creature* pManaSurge =
                m_creature->SummonCreature(
                    NPC_MANA_SURGE,
                    ManaSurgesSpawnPoint[0] + frand(-3, 3),
                    ManaSurgesSpawnPoint[1] + frand(-3, 3),
                    ManaSurgesSpawnPoint[2],
                    frand(0, 10),
                    TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,
                    10 * MINUTE*IN_MILLISECONDS))
            {
                ++m_uiManaSurgesCount;
            }
        }
    }

    void DespawnManaSurges() const
    {
        std::list<Creature*> manaSurges;
        GetCreatureListWithEntryInGrid(manaSurges, m_creature, NPC_MANA_SURGE, 75.0f);

        if (manaSurges.empty()) return;

        for (auto itr = manaSurges.begin(); itr != manaSurges.end(); ++itr)
            if ((*itr)->isAlive())
                (*itr)->ForcedDespawn();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_uiManaSurgesInProcess) return;

        // respawn Mana Rift
        if (!m_uiManaRiftRespawned)
        {
            if (GameObject* pManaRift = GetClosestGameObjectWithEntry(m_creature, GO_MANA_RIFT, 50.0f))
            {
                pManaRift->SetLootState(GO_READY);
                pManaRift->SetRespawnTime(10 * MINUTE);
                pManaRift->Refresh();

                m_uiManaRiftRespawned = true;
            }
        }

        // spawn Mana Surges
        if (m_uiManaSurgesCount == 0)
        {
            if (m_uiManaSurgeSpawnTimer < uiDiff)
            {
                switch (m_uiWaveCount)
                {
                case 1:
                case 2:
                    SpawnManaSurge(2);
                    break;
                case 3:
                case 4:
                    SpawnManaSurge(3);
                    break;
                case 5:
                case 6:
                    SpawnManaSurge(4);
                    break;
                default:
                    SpawnManaSurge(5);
                    break;
                }

                ++m_uiWaveCount;
                m_uiManaSurgeSpawnTimer = urand(1000, 5000);
            }
            else
                m_uiManaSurgeSpawnTimer -= uiDiff;
        }

        // reset event
        if (m_uiManaSurgesEventTimer < uiDiff)
        {
            DespawnManaSurges();
            Reset();
        }
        else
            m_uiManaSurgesEventTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_tabetha(Creature* pCreature)
{
    return new npc_tabethaAI(pCreature);
}

enum
{
    QUEST_MANA_SURGES = 1957
};

bool QuestAccept_npc_tabetha(Player* pPlayer, Creature* pCreature, Quest const *pQuest)
{
    if (pPlayer && pCreature && pQuest->GetQuestId() == QUEST_MANA_SURGES)
    {
        if (auto pTabethaAI = dynamic_cast<npc_tabethaAI*>(pCreature->AI()))
        {
            pTabethaAI->StartManaSurges();
        }
    }

    return true;
}

/*
 * Emberstrife
 */

enum
{
    EMOTE_GENERIC_FRENZY_KILL   = -1000001,
    EMOTE_GENERIC_IS_WEAKENED   = -1531011,

    SPELL_FRENZY                = 8269,
    SPELL_CLEAVE                = 19983,
    SPELL_FLAME_BREATH          = 9573
};

struct npc_emberstrifeAI : ScriptedAI
{
    explicit npc_emberstrifeAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_emberstrifeAI::Reset();
    }

    uint32 m_uiCleaveTimer;
    uint32 m_uiFrenzyTimer;
    uint32 m_uiFlameBreathTimer;
    bool m_bWeakened;

    void Reset() override
    {
        m_uiCleaveTimer = urand(6000, 8000);
        m_uiFrenzyTimer = 0;
        m_uiFlameBreathTimer = urand(8000, 12000);
        m_bWeakened = false;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        // Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!m_bWeakened && m_creature->GetHealthPercent() < 11)
        {
            m_bWeakened = true;
            DoScriptText(EMOTE_GENERIC_IS_WEAKENED, m_creature);
        }

        // Cleave
        if (m_uiCleaveTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                m_uiCleaveTimer = urand(6000, 8000);
        }
        else
            m_uiCleaveTimer -= uiDiff;

        // Flame Breath
        if (m_uiFlameBreathTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FLAME_BREATH) == CAST_OK)
                m_uiFlameBreathTimer = urand(8000, 12000);
        }
        else
            m_uiFlameBreathTimer -= uiDiff;

        // Frenzy
        if (m_creature->GetHealthPercent() < 60.0f)
        {
            if (m_uiFrenzyTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_FRENZY) == CAST_OK)
                {
                    DoScriptText(EMOTE_GENERIC_FRENZY_KILL, m_creature);
                    m_uiFrenzyTimer = 2 * MINUTE * IN_MILLISECONDS + 500;
                }
            }
            else
                m_uiFrenzyTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_emberstrife(Creature* pCreature)
{
    return new npc_emberstrifeAI(pCreature);
}

/*
 * Unforged Seal of Ascension (Emberstrife support)
 */

struct go_unforged_sealAI : GameObjectAI
{
    explicit go_unforged_sealAI(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiDespawnTimer = 3 * MINUTE * IN_MILLISECONDS;
    }

    uint32 m_uiDespawnTimer;

    bool OnUse(Unit* /*pCaster*/) override
    {
        me->Delete();

        return true;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiDespawnTimer < uiDiff)
            me->Delete();
        else
            m_uiDespawnTimer -= uiDiff;
    }
};

GameObjectAI* GetAI_go_unforged_seal(GameObject* pGo)
{
    return new go_unforged_sealAI(pGo);
}

/*
 * Forged Seal of Ascension (Emberstrife support)
 */

struct go_forged_sealAI : GameObjectAI
{
    explicit go_forged_sealAI(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiDespawnTimer = 3 * MINUTE * IN_MILLISECONDS;
    }

    uint32 m_uiDespawnTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiDespawnTimer < uiDiff)
            me->Delete();
        else
            m_uiDespawnTimer -= uiDiff;
    }
};

GameObjectAI* GetAI_go_forged_seal(GameObject* pGo)
{
    return new go_forged_sealAI(pGo);
}

/*######
##
######*/

void AddSC_dustwallow_marsh()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_lady_jaina_proudmoore";
    newscript->pGossipHello = &GossipHello_npc_lady_jaina_proudmoore;
    newscript->pGossipSelect = &GossipSelect_npc_lady_jaina_proudmoore;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_morokk";
    newscript->GetAI = &GetAI_npc_morokk;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_morokk;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_nat_pagle";
    newscript->pGossipHello = &GossipHello_npc_nat_pagle;
    newscript->pGossipSelect = &GossipSelect_npc_nat_pagle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ogron";
    newscript->GetAI = &GetAI_npc_ogron;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_ogron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_private_hendel";
    newscript->GetAI = &GetAI_npc_private_hendel;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_private_hendel;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_stinky_ignatz";
    newscript->GetAI = &GetAI_npc_stinky_ignatz;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_stinky_ignatz;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tabetha";
    newscript->GetAI = &GetAI_npc_tabetha;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_tabetha;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_emberstrife";
    newscript->GetAI = &GetAI_npc_emberstrife;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_unforged_seal";
    newscript->GOGetAI = &GetAI_go_unforged_seal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_forged_seal";
    newscript->GOGetAI = &GetAI_go_forged_seal;
    newscript->RegisterSelf();
}
