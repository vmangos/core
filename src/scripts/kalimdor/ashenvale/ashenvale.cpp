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
SDName: Ashenvale
SD%Complete: 70
SDComment: Quest support: 976, 6482, 6544, 6641
SDCategory: Ashenvale Forest
EndScriptData */

/* ContentData
npc_muglash
npc_ruul_snowhoof
npc_torek
npc_feero_ironhand
EndContentData */

#include "scriptPCH.h"

/*####
# npc_muglash
####*/

enum
{
    SAY_MUG_START1          = -1000501,
    SAY_MUG_START2          = -1000502,
    SAY_MUG_BRAZIER         = -1000503,
    SAY_MUG_BRAZIER_WAIT    = -1000504,
    SAY_MUG_ON_GUARD        = -1000505,
    SAY_MUG_REST            = -1000506,
    SAY_MUG_DONE            = -1000507,
    SAY_MUG_GRATITUDE       = -1000508,
    SAY_MUG_PATROL          = -1000509,
    SAY_MUG_RETURN          = -1000510,

    SAY_MUG_Q_COMPETENCE    = -1780221,
    SAY_MUG_IMPATIENT       = -1780222,

    QUEST_VORSHA            = 6641,

    GO_NAGA_BRAZIER         = 178247,
    GO_BRAZIER_GUID         = 47873,

    NPC_MUGLASH             = 12717,

    NPC_WRATH_RIDER         = 3713,
    NPC_WRATH_SORCERESS     = 3717,
    NPC_WRATH_RAZORTAIL     = 3712,

    NPC_WRATH_PRIESTESS     = 3944,
    NPC_WRATH_MYRMIDON      = 3711,
    NPC_WRATH_SEAWITCH      = 3715,

    NPC_VORSHA              = 12940
};

static float m_afFirstNagaCoord[3][3] =
{
    {3603.504150f, 1122.631104f, 1.635f},                   // rider
    {3589.293945f, 1148.664063f, 5.565f},                   // sorceress
    {3609.925537f, 1168.759521f, -1.168f}                   // razortail
};

static float m_afSecondNagaCoord[3][3] =
{
    {3609.925537f, 1168.759521f, -1.168f},                  // witch
    {3645.652100f, 1139.425415f, 1.322f},                   // priest
    {3583.602051f, 1128.405762f, 2.347f}                    // myrmidon
};

static float m_fVorshaCoord[] = {3633.056885f, 1172.924072f, -5.388f};

struct npc_muglashAI : public npc_escortAI
{
    npc_muglashAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        m_uiWaveId = 0;
        muglashImpatience = 0;
        m_bIsBrazierExtinguished = false;
        Reset();
    }

    bool m_bIsBrazierExtinguished;

    uint32 m_uiWaveId;
    uint32 muglashImpatience;
    uint32 m_uiEventTimer;
    uint32 impatienceTimer;

    void Reset()
    {
        m_uiEventTimer = 10000;
        impatienceTimer = 30000;
        muglashImpatience = 0;

        if (!HasEscortState(STATE_ESCORT_ESCORTING))
        {
            m_uiWaveId = 0;
            m_bIsBrazierExtinguished = false;
        }
    }

    void Aggro(Unit* pWho)
    {
        if (HasEscortState(STATE_ESCORT_PAUSED))
        {
            if (urand(0, 1))
                return;

            DoScriptText(SAY_MUG_ON_GUARD, m_creature);
        }
    }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 0:
                if (Player* pPlayer = GetPlayerForEscort())
                    DoScriptText(SAY_MUG_START2, m_creature, pPlayer);
                break;
            case 24:
                if (Player* pPlayer = GetPlayerForEscort())
                    DoScriptText(SAY_MUG_BRAZIER, m_creature, pPlayer);

                if (GameObject* pGo = GetClosestGameObjectWithEntry(m_creature, GO_NAGA_BRAZIER, INTERACTION_DISTANCE * 2))
                {
                    //some kind of event flag? Update to player/group only?
                    pGo->SetGoState(GO_STATE_READY);
                    pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                    SetEscortPaused(true);
                }
                break;
            case 25:
                DoScriptText(SAY_MUG_GRATITUDE, m_creature);

                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_VORSHA, m_creature);
                break;
            case 26:
                DoScriptText(SAY_MUG_PATROL, m_creature);
                break;
            case 27:
                DoScriptText(SAY_MUG_RETURN, m_creature);
                break;
        }
    }

    void DoWaveSummon()
    {
        switch (m_uiWaveId)
        {
            case 1:
                m_creature->SummonCreature(NPC_WRATH_RIDER,     m_afFirstNagaCoord[0][0], m_afFirstNagaCoord[0][1], m_afFirstNagaCoord[0][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                m_creature->SummonCreature(NPC_WRATH_SORCERESS, m_afFirstNagaCoord[1][0], m_afFirstNagaCoord[1][1], m_afFirstNagaCoord[1][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                m_creature->SummonCreature(NPC_WRATH_RAZORTAIL, m_afFirstNagaCoord[2][0], m_afFirstNagaCoord[2][1], m_afFirstNagaCoord[2][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                break;
            case 2:
                m_creature->SummonCreature(NPC_WRATH_PRIESTESS, m_afSecondNagaCoord[0][0], m_afSecondNagaCoord[0][1], m_afSecondNagaCoord[0][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                m_creature->SummonCreature(NPC_WRATH_MYRMIDON,  m_afSecondNagaCoord[1][0], m_afSecondNagaCoord[1][1], m_afSecondNagaCoord[1][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                m_creature->SummonCreature(NPC_WRATH_SEAWITCH,  m_afSecondNagaCoord[2][0], m_afSecondNagaCoord[2][1], m_afSecondNagaCoord[2][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                break;
            case 3:
                m_creature->SummonCreature(NPC_VORSHA, m_fVorshaCoord[0], m_fVorshaCoord[1], m_fVorshaCoord[2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
                break;
            case 4:
                DoScriptText(SAY_MUG_DONE, m_creature);
                m_creature->HandleEmote(EMOTE_ONESHOT_CHEER);
                break;
            case 5:
                SetEscortPaused(false);
                break;
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->AI()->AttackStart(m_creature);
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (HasEscortState(STATE_ESCORT_PAUSED))
            {
                if (m_bIsBrazierExtinguished)
                {
                    if (m_uiEventTimer < uiDiff)
                    {
                        ++m_uiWaveId;
                        DoWaveSummon();

                        switch(m_uiWaveId)
                        {
                            case 3:
                                m_uiEventTimer = 0;
                                break;
                            case 4:
                                m_uiEventTimer = 2000;
                                break;
                            default:
                                m_uiEventTimer = 9000;
                        }
                    }
                    else
                        m_uiEventTimer -= uiDiff;
                }
                else
                {
                    if (impatienceTimer < uiDiff)
                    {
                        muglashImpatience++;

                        if (1 == muglashImpatience)
                        {
                            DoScriptText(SAY_MUG_Q_COMPETENCE, m_creature);
                            impatienceTimer = 30000;
                        }
                        else if (2 == muglashImpatience)
                        {
                            DoScriptText(SAY_MUG_IMPATIENT, m_creature);

                            // Reset brazier to no interact
                            if (GameObject* pGo = GetClosestGameObjectWithEntry(m_creature, GO_NAGA_BRAZIER, INTERACTION_DISTANCE * 2))
                                pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);

                            impatienceTimer = 3000;
                        }
                        else
                        {
                            // Muglash too impatient. Fail quest and reset.
                            JustDied(nullptr);
                            ResetEscort();
                        }

                    }
                    else
                        impatienceTimer -= uiDiff;
                }
            }

            return;
        }

        DoMeleeAttackIfReady();
    }
};

bool QuestAccept_npc_muglash(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_VORSHA)
    {
        if (npc_muglashAI* pEscortAI = dynamic_cast<npc_muglashAI*>(pCreature->AI()))
        {
            DoScriptText(SAY_MUG_START1, pCreature);
            pCreature->setFaction(FACTION_ESCORT_H_PASSIVE);

            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
        }

        // Ensure Brazier can be extinguished
        if (GameObject* go_naga_brazier = GetClosestGameObjectWithEntry(pCreature, GO_NAGA_BRAZIER, 1000))
        {
            go_naga_brazier->ResetDoorOrButton();
            go_naga_brazier->SetGoState(GO_STATE_READY);
        }

    }

    return true;
}

CreatureAI* GetAI_npc_muglash(Creature* pCreature)
{
    return new npc_muglashAI(pCreature);
}

bool GOHello_go_naga_brazier(Player* pPlayer, GameObject* pGo)
{
    if (Creature* pCreature = GetClosestCreatureWithEntry(pGo, NPC_MUGLASH, INTERACTION_DISTANCE * 2))
    {
        if (npc_muglashAI* pEscortAI = dynamic_cast<npc_muglashAI*>(pCreature->AI()))
        {
            DoScriptText(SAY_MUG_BRAZIER_WAIT, pCreature);

            pEscortAI->m_bIsBrazierExtinguished = true;
            return false;
        }
    }

    return true;
}

/*####
# npc_ruul_snowhoof
####*/

enum
{
    QUEST_FREEDOM_TO_RUUL   = 6482,
    NPC_T_URSA              = 3921,
    NPC_T_TOTEMIC           = 3922,
    NPC_T_PATHFINDER        = 3926,
    SAY_RUUL_END            = -1780189,
    BEAR_AURA               = 20514
};

struct npc_ruul_snowhoofAI : public npc_escortAI
{
    npc_ruul_snowhoofAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        m_creature->AddAura(BEAR_AURA);
    }

    void WaypointReached(uint32 uiPointId)
    {
        //m_creature->MonsterYell("DEBUG : WayPoint reached", 0); //The hell, still skipping waypoints 13/02/2015
        //sLog.outString("DEBUG : Ruul : WayPoint n° %u", uiPointId);
        switch (uiPointId)
        {
            case 13:
                m_creature->SummonCreature(NPC_T_TOTEMIC, 3449.218018f, -587.825073f, 174.978867f, 4.714445f, TEMPSUMMON_DEAD_DESPAWN, 60000);
                m_creature->SummonCreature(NPC_T_URSA, 3446.384521f, -587.830872f, 175.186279f, 4.714445f, TEMPSUMMON_DEAD_DESPAWN, 60000);
                m_creature->SummonCreature(NPC_T_PATHFINDER, 3444.218994f, -587.835327f, 175.380600f, 4.714445f, TEMPSUMMON_DEAD_DESPAWN, 60000);
                break;
            case 19:
                m_creature->SummonCreature(NPC_T_TOTEMIC, 3508.344482f, -492.024261f, 186.929031f, 4.145029f, TEMPSUMMON_DEAD_DESPAWN, 60000);
                m_creature->SummonCreature(NPC_T_URSA, 3506.265625f, -490.531006f, 186.740128f, 4.239277f, TEMPSUMMON_DEAD_DESPAWN, 60000);
                m_creature->SummonCreature(NPC_T_PATHFINDER, 3503.682373f, -489.393799f, 186.629684f, 4.349232f, TEMPSUMMON_DEAD_DESPAWN, 60000);
                break;
            case 25:
                m_creature->RemoveAurasDueToSpell(BEAR_AURA);
                DoScriptText(SAY_RUUL_END, m_creature);
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_FREEDOM_TO_RUUL, m_creature);
                break;
        }
    }

    void JustSummoned(Creature* summoned)
    {
        summoned->AI()->AttackStart(m_creature);
    }
};

bool QuestAccept_npc_ruul_snowhoof(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_FREEDOM_TO_RUUL)
    {
        pCreature->setFaction(106);//supposed to be able to get killed by alliance players.
        pCreature->SetStandState(UNIT_STAND_STATE_STAND);

        if (npc_ruul_snowhoofAI* pEscortAI = dynamic_cast<npc_ruul_snowhoofAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

CreatureAI* GetAI_npc_ruul_snowhoofAI(Creature* pCreature)
{
    return new npc_ruul_snowhoofAI(pCreature);
}

/*####
# npc_torek
####*/

enum
{
    SAY_READY                   = -1000106,
    SAY_MOVE                    = -1000107,
    SAY_PREPARE                 = -1000108,
    SAY_WIN                     = -1000109,
    SAY_END                     = -1000110,

    SPELL_REND                  = 11977,
    SPELL_THUNDERCLAP           = 8078,

    QUEST_TOREK_ASSULT          = 6544,

    NPC_SPLINTERTREE_RAIDER     = 12859,
    NPC_DURIEL                  = 12860,
    NPC_SILVERWING_SENTINEL     = 12896,
    NPC_SILVERWING_WARRIOR      = 12897
};

struct npc_torekAI : public npc_escortAI
{
    npc_torekAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiRend_Timer;
    uint32 m_uiThunderclap_Timer;

    void Reset()
    {
        m_uiRend_Timer = 5000;
        m_uiThunderclap_Timer = 8000;
    }
    void JustDied(Unit* pKiller)
    {
        std::list<Creature*> lCrea;
        m_creature->GetCreatureListWithEntryInGrid(lCrea, NPC_SPLINTERTREE_RAIDER, 40.0f);
        for (std::list<Creature*>::iterator it = lCrea.begin(); it != lCrea.end(); ++it)
            (*it)->DisappearAndDie();
        npc_escortAI::JustDied(pKiller);
    }
    void WaypointReached(uint32 uiPointId)
    {
        Player* pPlayer = GetPlayerForEscort();

        if (!pPlayer)
            return;

        switch (uiPointId)
        {
            case 1:
                DoScriptText(SAY_MOVE, m_creature, pPlayer);
                break;
            case 8:
                DoScriptText(SAY_PREPARE, m_creature, pPlayer);
                break;
            case 19:
                //TODO: verify location and creatures amount.
                m_creature->SummonCreature(NPC_DURIEL, 1776.73f, -2049.06f, 109.83f, 1.54f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                m_creature->SummonCreature(NPC_SILVERWING_SENTINEL, 1774.64f, -2049.41f, 109.83f, 1.40f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                m_creature->SummonCreature(NPC_SILVERWING_WARRIOR, 1778.73f, -2049.50f, 109.83f, 1.67f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
                break;
            case 20:
                DoScriptText(SAY_WIN, m_creature, pPlayer);
                pPlayer->GroupEventHappens(QUEST_TOREK_ASSULT, m_creature);
                break;
            case 21:
                DoScriptText(SAY_END, m_creature, pPlayer);
                break;
            case 22:
                std::list<Creature*> lCrea;
                m_creature->GetCreatureListWithEntryInGrid(lCrea, NPC_SPLINTERTREE_RAIDER, 40.0f);
                for (std::list<Creature*>::iterator it = lCrea.begin(); it != lCrea.end(); ++it)
                    (*it)->DisappearAndDie();
                break;
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->AI()->AttackStart(m_creature);
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiRend_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_REND);
            m_uiRend_Timer = 20000;
        }
        else
            m_uiRend_Timer -= uiDiff;

        if (m_uiThunderclap_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, SPELL_THUNDERCLAP);
            m_uiThunderclap_Timer = 30000;
        }
        else
            m_uiThunderclap_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

bool QuestAccept_npc_torek(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_TOREK_ASSULT)
    {
        //TODO: find companions, make them follow Torek, at any time (possibly done by mangos/database in future?)
        DoScriptText(SAY_READY, pCreature, pPlayer);

        if (npc_torekAI* pEscortAI = dynamic_cast<npc_torekAI*>(pCreature->AI()))
            pEscortAI->Start(true, pPlayer->GetGUID(), pQuest);
    }

    return true;
}

CreatureAI* GetAI_npc_torek(Creature* pCreature)
{
    return new npc_torekAI(pCreature);
}

/*####
 # npc_feero_ironhand
 ####*/

enum
{
    SAY_QUEST_START = -1000817,
    SAY_FIRST_AMBUSH_START = -1000818,
    SAY_FIRST_AMBUSH_END = -1000819,
    SAY_SECOND_AMBUSH_START = -1000820,
    SAY_SCOUT_SECOND_AMBUSH = -1000821,
    SAY_SECOND_AMBUSH_END = -1000822,
    SAY_FINAL_AMBUSH_START = -1000823,
    SAY_BALIZAR_FINAL_AMBUSH = -1000824,
    SAY_FINAL_AMBUSH_ATTACK = -1000825,
    SAY_QUEST_END = -1000826,

    QUEST_SUPPLIES_TO_AUBERDINE = 976,

    NPC_DARK_STRAND_ASSASSIN = 3879,
    NPC_FORSAKEN_SCOUT = 3893,

    NPC_ALIGAR_THE_TORMENTOR = 3898,
    NPC_BALIZAR_THE_UMBRAGE = 3899,
    NPC_CAEDAKAR_THE_VICIOUS = 3900,
};

/*
 * Notes about the event:
 * The summon coords and event sequence are guesswork based on the comments from wowhead and wowwiki
 */

// Distance, Angle or Offset
static const float aSummonPositions[2][2] =
{
    {30.0f, 1.25f},
    {15.0f, 0.95f}//30.0f is in the tree and gets stuck with fathfinding
};

// Hardcoded positions for the last 3 mobs
static const float aEliteSummonPositions[3][4] =
{
    {4243.12f, 108.22f, 38.12f, 3.62f},
    {4240.95f, 114.04f, 38.35f, 3.56f},
    {4235.78f, 118.09f, 38.08f, 4.12f}
};

struct npc_feero_ironhandAI : public npc_escortAI
{
    npc_feero_ironhandAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    uint8 m_uiCreaturesCount;
    bool m_bIsAttacked;

    void Reset()
    {
        if (!HasEscortState(STATE_ESCORT_ESCORTING))
        {
            m_uiCreaturesCount = 0;
            m_bIsAttacked = false;
        }
    }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
            case 14:
                // Prepare the first ambush
                DoScriptText(SAY_FIRST_AMBUSH_START, m_creature);
                for (uint8 i = 0; i < 4; ++i)
                    DoSpawnMob(NPC_DARK_STRAND_ASSASSIN, aSummonPositions[0][0], aSummonPositions[0][1] - M_PI_F / 4 * i);
                break;
            case 20:
                // Prepare the second ambush
                DoScriptText(SAY_SECOND_AMBUSH_START, m_creature);
                for (uint8 i = 0; i < 3; ++i)
                    DoSpawnMob(NPC_FORSAKEN_SCOUT, aSummonPositions[1][0], aSummonPositions[1][1] - M_PI_F / 3 * i);
                break;
            case 29:
                // Final ambush
                DoScriptText(SAY_FINAL_AMBUSH_START, m_creature);
                m_creature->SummonCreature(NPC_BALIZAR_THE_UMBRAGE, aEliteSummonPositions[0][0], aEliteSummonPositions[0][1], aEliteSummonPositions[0][2], aEliteSummonPositions[0][3], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                m_creature->SummonCreature(NPC_ALIGAR_THE_TORMENTOR, aEliteSummonPositions[1][0], aEliteSummonPositions[1][1], aEliteSummonPositions[1][2], aEliteSummonPositions[1][3], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                m_creature->SummonCreature(NPC_CAEDAKAR_THE_VICIOUS, aEliteSummonPositions[2][0], aEliteSummonPositions[2][1], aEliteSummonPositions[2][2], aEliteSummonPositions[2][3], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                break;
            case 30:
                // Complete the quest
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_SUPPLIES_TO_AUBERDINE, m_creature);
                break;
        }
    }

    void AttackedBy(Unit* pWho)
    {
        // Yell only at the first attack
        if (!m_bIsAttacked)
        {
            if (pWho->ToCreature() && pWho->ToCreature()->GetEntry() == NPC_BALIZAR_THE_UMBRAGE)
            {
                DoScriptText(SAY_FINAL_AMBUSH_ATTACK, m_creature);
                m_bIsAttacked = true;
            }
        }
    }

    // Summon mobs at calculated points
    void DoSpawnMob(uint32 uiEntry, float fDistance, float fAngle)
    {
        float fX, fY, fZ;
        m_creature->GetNearPoint(m_creature, fX, fY, fZ, 0, fDistance, fAngle);

        m_creature->SummonCreature(uiEntry, fX, fY, fZ, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
    }

    void SummonedCreatureJustDied(Creature* pSummoned)
    {
        --m_uiCreaturesCount;

        if (!m_uiCreaturesCount)
        {
            switch (pSummoned->GetEntry())
            {
                case NPC_DARK_STRAND_ASSASSIN:
                    DoScriptText(SAY_FIRST_AMBUSH_END, m_creature);
                    break;
                case NPC_FORSAKEN_SCOUT:
                    DoScriptText(SAY_SECOND_AMBUSH_END, m_creature);
                    break;
                case NPC_ALIGAR_THE_TORMENTOR:
                case NPC_BALIZAR_THE_UMBRAGE:
                case NPC_CAEDAKAR_THE_VICIOUS:
                    DoScriptText(SAY_QUEST_END, m_creature);
                    break;
            }
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        if (pSummoned->GetEntry() == NPC_FORSAKEN_SCOUT)
        {
            // Only one of the scouts yells
            if (m_uiCreaturesCount == 1)
                DoScriptText(SAY_SCOUT_SECOND_AMBUSH, pSummoned, m_creature);
        }
        else if (pSummoned->GetEntry() == NPC_BALIZAR_THE_UMBRAGE)
            DoScriptText(SAY_BALIZAR_FINAL_AMBUSH, pSummoned);

        ++m_uiCreaturesCount;
        if (Player* pPlayer = GetPlayerForEscort())
            pSummoned->AI()->AttackStart(pPlayer);
    }
};

CreatureAI* GetAI_npc_feero_ironhand(Creature* pCreature)
{
    return new npc_feero_ironhandAI(pCreature);
}

bool QuestAccept_npc_feero_ironhand(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_SUPPLIES_TO_AUBERDINE)
    {
        DoScriptText(SAY_QUEST_START, pCreature, pPlayer);
        pCreature->setFaction(FACTION_ESCORT_A_NEUTRAL_PASSIVE);

        if (npc_feero_ironhandAI* pEscortAI = dynamic_cast<npc_feero_ironhandAI*>(pCreature->AI()))
            pEscortAI->Start(true, pPlayer->GetGUID(), pQuest);
    }

    return true;
}
//Alita King Of The Foulweed
enum
{
    NPC_ENRAGED_FOULWEALD               = 12921,
    NPC_CHIEF_MURGUT                    = 12918,
    GO_KARANG_S_BANNER                  = 178205,
    GO_KARANG_LIGHT                     = 178207,
    GO_MOUND                            = 300131,
    SPELL_CORRUPTED_STRENGTH            = 6821,
    SPELL_DESTROY_KARANG_S_BANNER_1     = 20786,
    SPELL_DESTROY_KARANG_S_BANNER_2     = 20783,

    SAY_ATTACK_BANNER                   = -1780210
};
static float foulwealdSpawnCoords[4][3] =
{
    {2237.48f, -1524.45f, 89.7827f},
    {2202.16f, -1544.48f,  87.796f},
    {2235.44f, -1578.43f, 86.4944f},
    {2260.9f, -1547.91f, 89.1733f}
};

void DefineFoulwealdMound(Creature * crea, uint64 gobjGUID);

struct go_foulweald_totem_moundAI: public GameObjectAI
{
    go_foulweald_totem_moundAI(GameObject* pGo) : GameObjectAI(pGo)
    {
        reset();
    }
    void reset()
    {
        eventPhase = 0;
        phaseTimer = 170000;
    }

    uint64 guidCurrentEnragedFoulweald[2];
    uint8 eventPhase; //0 nothing, 1 repoping enraged foulwealds, 2 wait, 3 chief_murgut, 4 done
    uint32 phaseTimer;

    bool EventStart(uint64 playerGuid)
    {
        if (eventPhase != 0)
            return false;
        eventPhase = 1;
        Creature* foulweald = NULL;
        for (int i = 0; i < 2; i++)
        {
            if (foulweald = me->SummonCreature(NPC_ENRAGED_FOULWEALD, foulwealdSpawnCoords[i][0], foulwealdSpawnCoords[i][1], foulwealdSpawnCoords[i][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 420000))
            {
                guidCurrentEnragedFoulweald[i] = foulweald->GetGUID();
                float x, y, z;
                me->GetPosition(x, y, z);
                foulweald->GetMotionMaster()->MovePoint(1, x, y, z, true);
                foulweald->SetHomePosition(x, y, z, 0);
                foulweald->SetRespawnDelay(425000);
                DefineFoulwealdMound(foulweald, me->GetGUID());
            }
            foulweald = NULL;
        }
        return true;
    }
    void EventEnded()
    {
        if (GameObject* pGo = me->FindNearestGameObject(GO_KARANG_S_BANNER, 10))
            pGo->AddObjectToRemoveList();
        reset();
    }
    void EnragedFoulwealdJustDied(uint64 creatureGUID)
    {
        if (eventPhase != 1)
            return;
        Creature* foulweald;
        int pos = 0;
        for (int i = 0; i < 2; i++)
        {
            if (creatureGUID == guidCurrentEnragedFoulweald[i])
            {
                pos = urand(0, 3);
                if (foulweald = me->SummonCreature(NPC_ENRAGED_FOULWEALD, foulwealdSpawnCoords[pos][0], foulwealdSpawnCoords[pos][1], foulwealdSpawnCoords[pos][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 420000))
                {
                    guidCurrentEnragedFoulweald[i] = foulweald->GetGUID();
                    float x, y, z;
                    me->GetPosition(x, y, z);
                    foulweald->GetMotionMaster()->MovePoint(1, x, y, z, true);
                    foulweald->SetHomePosition(x, y, z, 0);
                    foulweald->SetRespawnDelay(425000);
                    DefineFoulwealdMound(foulweald, me->GetGUID());
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (eventPhase == 0 || eventPhase > 4)
            return;

        if (phaseTimer < uiDiff)
        {
            eventPhase++;
            switch (eventPhase)
            {
                case 2:
                    phaseTimer = 10000;
                    break;
                case 3:
                    if (Creature* murgut = me->SummonCreature(NPC_CHIEF_MURGUT, foulwealdSpawnCoords[3][0], foulwealdSpawnCoords[3][1], foulwealdSpawnCoords[3][2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 120000))
                    {
                        float x, y, z;
                        me->GetPosition(x, y, z);
                        murgut->GetMotionMaster()->MovePoint(1, x, y, z, true);
                        murgut->SetHomePosition(x, y, z, 0);
                        murgut->SetRespawnDelay(125000);
                        if (GameObject* pGo = me->FindNearestGameObject(GO_KARANG_S_BANNER, 10))
                        {
                            pGo->GetPosition(x, y, z);
                            me->SummonGameObject(178207, x, y, z, 0, 0, 0, 0, 0, 120);
                        }
                    }
                    phaseTimer = 120000;
                    break;
                case 4:
                    EventEnded();
                    break;
            }
        }
        else
            phaseTimer -= uiDiff;
    }
};
GameObjectAI* GetAIgo_foulweald_totem_mound(GameObject *pGo)
{
    return new go_foulweald_totem_moundAI(pGo);
}

struct npc_enraged_foulwealdAI : public ScriptedAI
{
    npc_enraged_foulwealdAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    void Reset()
    {
        m_creature->AddAura(SPELL_CORRUPTED_STRENGTH);
        timer = 0;
    }
    uint32 timer;
    uint64 guidMound;
    void JustDied(Unit* pKiller)
    {
        if (GameObject* gobj = m_creature->GetMap()->GetGameObject(guidMound))
        {
            if (go_foulweald_totem_moundAI* pMoundAI = dynamic_cast<go_foulweald_totem_moundAI*>(gobj->AI()))
                pMoundAI->EnragedFoulwealdJustDied(m_creature->GetGUID());
        }
    }

    void MovementInform(uint32 uiType, uint32 uiPointId)
    {
        if (uiType != POINT_MOTION_TYPE || uiPointId != 2)
            return;
        HitBanner();
    }
    void AttackStart(Unit * unit)
    {
        if (m_creature->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            return;
        ScriptedAI::AttackStart(unit);
    }
    bool HitBanner()
    {
        if (GameObject* pGo = m_creature->FindNearestGameObject(GO_KARANG_S_BANNER, CONTACT_DISTANCE + 1))
        {
            float x, y, z;
            pGo->GetPosition(x, y, z);
            m_creature->CastSpell(x, y, z, SPELL_DESTROY_KARANG_S_BANNER_1, false);
            DoScriptText(SAY_ATTACK_BANNER, m_creature);
            timer = 10000;
            return true;
        }
        return false;
    }
    void UpdateAI(const uint32 uiDiff)
    {
        if (m_creature->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            return;


        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (timer < uiDiff)
            {
                if (!HitBanner())
                {
                    if (GameObject* pGo = m_creature->FindNearestGameObject(GO_KARANG_S_BANNER, 30))
                    {
                        float fX, fY, fZ;
                        pGo->GetContactPoint(m_creature, fX, fY, fZ, CONTACT_DISTANCE);
                        m_creature->GetMotionMaster()->MovePoint(2, fX, fY, fZ, MOVE_PATHFINDING);
                        timer = 10000;
                    }
                }
            }
            else
                timer -= uiDiff;
            return;
        }
        DoMeleeAttackIfReady();
    }
    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_DESTROY_KARANG_S_BANNER_2)
        {
            if (GameObject* pGo = m_creature->FindNearestGameObject(GO_MOUND, 3))
            {
                if (go_foulweald_totem_moundAI* pMoundAI = dynamic_cast<go_foulweald_totem_moundAI*>(pGo->AI()))
                    pMoundAI->EventEnded();
            }
        }
    }
    void SetMoundGuid(uint64 moundGuid)
    {
        guidMound = moundGuid;
    }
};

CreatureAI* GetAI_npc_enraged_foulweald(Creature* pCreature)
{
    return new npc_enraged_foulwealdAI(pCreature);
}
bool ProcessEventId_event_king_of_the_foulweald(uint32 eventId, Object* source, Object* target, bool isStart)
{
    if (!target || !source)
        return true;

    if (go_foulweald_totem_moundAI* pMoundAI = dynamic_cast<go_foulweald_totem_moundAI*>(((GameObject*) target)->AI()))
        pMoundAI->EventStart(source->GetGUID());
    return true;//return the result of EventStart or true? true because otherwise it'll get the event in the DB.
}

void DefineFoulwealdMound(Creature * crea, uint64 gobjGUID)
{
    if (npc_enraged_foulwealdAI* foulwealdAI = dynamic_cast<npc_enraged_foulwealdAI*>(crea->AI()))
        foulwealdAI->SetMoundGuid(gobjGUID);
}
void AddSC_ashenvale()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_muglash";
    newscript->GetAI = &GetAI_npc_muglash;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_muglash;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_naga_brazier";
    newscript->pGOHello = &GOHello_go_naga_brazier;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ruul_snowhoof";
    newscript->GetAI = &GetAI_npc_ruul_snowhoofAI;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_ruul_snowhoof;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_torek";
    newscript->GetAI = &GetAI_npc_torek;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_torek;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_feero_ironhand";
    newscript->GetAI = &GetAI_npc_feero_ironhand;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_feero_ironhand;
    newscript->RegisterSelf();

    //Alita
    newscript = new Script;
    newscript->Name = "event_king_of_the_foulweald";
    newscript->pProcessEventId = &ProcessEventId_event_king_of_the_foulweald;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_enraged_foulweald";
    newscript->GetAI = &GetAI_npc_enraged_foulweald;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_foulweald_totem_mound";
    newscript->GOGetAI = &GetAIgo_foulweald_totem_mound;
    newscript->RegisterSelf();
}
