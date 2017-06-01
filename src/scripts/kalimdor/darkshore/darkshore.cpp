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
SDName: Darkshore
SD%Complete: 100
SDComment: Quest support: 731, 2078, 5321, 4740
SDCategory: Darkshore
EndScriptData */

/* ContentData
npc_kerlonian
npc_prospector_remtravel
npc_threshwackonator
npc_chasseur_grisebrume
EndContentData */

#include "scriptPCH.h"

/*####
# npc_kerlonian
####*/

enum
{
    SAY_KER_START               = -1000434,

    EMOTE_KER_SLEEP_1           = -1000435,
    EMOTE_KER_SLEEP_2           = -1000436,
    EMOTE_KER_SLEEP_3           = -1000437,

    SAY_KER_SLEEP_1             = -1000438,
    SAY_KER_SLEEP_2             = -1000439,
    SAY_KER_SLEEP_3             = -1000440,
    SAY_KER_SLEEP_4             = -1000441,

    EMOTE_KER_AWAKEN            = -1000445,

    SAY_KER_ALERT_1             = -1000442,
    SAY_KER_ALERT_2             = -1000443,

    SAY_KER_END                 = -1000444,

    SPELL_SLEEP_VISUAL          = 25148,
    SPELL_AWAKEN                = 17536,
    QUEST_SLEEPER_AWAKENED      = 5321,
    NPC_LILADRIS                = 11219                     //attackers entries unknown
};

//TODO: make concept similar as "ringo" -escort. Find a way to run the scripted attacks, _if_ player are choosing road.
struct npc_kerlonianAI : public FollowerAI
{
    npc_kerlonianAI(Creature* pCreature) : FollowerAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiFallAsleepTimer;

    void Reset() override
    {
        m_uiFallAsleepTimer = urand(10000, 45000);
    }

    void MoveInLineOfSight(Unit *pWho) override
    {
        FollowerAI::MoveInLineOfSight(pWho);

        if (!m_creature->getVictim() && !HasFollowState(STATE_FOLLOW_COMPLETE) && pWho->GetEntry() == NPC_LILADRIS)
        {
            if (m_creature->IsWithinDistInMap(pWho, INTERACTION_DISTANCE * 5))
            {
                if (Player* pPlayer = GetLeaderForFollower())
                {
                    if (pPlayer->GetQuestStatus(QUEST_SLEEPER_AWAKENED) == QUEST_STATUS_INCOMPLETE)
                        pPlayer->GroupEventHappens(QUEST_SLEEPER_AWAKENED, m_creature);

                    DoScriptText(SAY_KER_END, m_creature);
                }

                SetFollowComplete();
            }
        }
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell) override
    {
        if (HasFollowState(STATE_FOLLOW_INPROGRESS | STATE_FOLLOW_PAUSED) && pSpell->Id == SPELL_AWAKEN)
            ClearSleeping();
    }

    void SetSleeping()
    {
        SetFollowPaused(true);

        switch (urand(0, 2))
        {
            case 0:
                DoScriptText(EMOTE_KER_SLEEP_1, m_creature);
                break;
            case 1:
                DoScriptText(EMOTE_KER_SLEEP_2, m_creature);
                break;
            case 2:
                DoScriptText(EMOTE_KER_SLEEP_3, m_creature);
                break;
        }

        switch (urand(0, 3))
        {
            case 0:
                DoScriptText(SAY_KER_SLEEP_1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_KER_SLEEP_2, m_creature);
                break;
            case 2:
                DoScriptText(SAY_KER_SLEEP_3, m_creature);
                break;
            case 3:
                DoScriptText(SAY_KER_SLEEP_4, m_creature);
                break;
        }

        m_creature->SetStandState(UNIT_STAND_STATE_SLEEP);
        m_creature->CastSpell(m_creature, SPELL_SLEEP_VISUAL, false);
    }

    void ClearSleeping()
    {
        m_creature->RemoveAurasDueToSpell(SPELL_SLEEP_VISUAL);
        m_creature->SetStandState(UNIT_STAND_STATE_STAND);

        DoScriptText(EMOTE_KER_AWAKEN, m_creature);

        SetFollowPaused(false);
    }

    void UpdateFollowerAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (!HasFollowState(STATE_FOLLOW_INPROGRESS))
                return;

            if (!HasFollowState(STATE_FOLLOW_PAUSED))
            {
                if (m_uiFallAsleepTimer < uiDiff)
                {
                    SetSleeping();
                    m_uiFallAsleepTimer = urand(25000, 90000);
                }
                else
                    m_uiFallAsleepTimer -= uiDiff;
            }

            return;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_kerlonian(Creature* pCreature)
{
    return new npc_kerlonianAI(pCreature);
}

bool QuestAccept_npc_kerlonian(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_SLEEPER_AWAKENED)
    {
        if (npc_kerlonianAI* pKerlonianAI = dynamic_cast<npc_kerlonianAI*>(pCreature->AI()))
        {
            pCreature->SetStandState(UNIT_STAND_STATE_STAND);
            DoScriptText(SAY_KER_START, pCreature, pPlayer);
            pKerlonianAI->StartFollow(pPlayer, FACTION_ESCORT_N_FRIEND_PASSIVE, pQuest);
        }
    }

    return true;
}

/*####
# npc_prospector_remtravel
####*/

enum
{
    SAY_REM_START               = -1000327,
    SAY_REM_AGGRO               = -1000339,
    SAY_REM_RAMP1_1             = -1000328,
    SAY_REM_RAMP1_2             = -1000329,
    SAY_REM_BOOK                = -1000330,
    SAY_REM_TENT1_1             = -1000331,
    SAY_REM_TENT1_2             = -1000332,
    SAY_REM_MOSS                = -1000333,
    EMOTE_REM_MOSS              = -1000334,
    SAY_REM_MOSS_PROGRESS       = -1000335,
    SAY_REM_PROGRESS            = -1000336,
    SAY_REM_REMEMBER            = -1000337,
    EMOTE_REM_END               = -1000338,

    QUEST_ABSENT_MINDED_PT2     = 731,
    NPC_GRAVEL_SCOUT            = 2158,
    NPC_GRAVEL_BONE             = 2159,
    NPC_GRAVEL_GEO              = 2160
};

struct npc_prospector_remtravelAI : public npc_escortAI
{
    npc_prospector_remtravelAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void WaypointReached(uint32 i) override
    {
        Player* pPlayer = GetPlayerForEscort();

        if (!pPlayer)
            return;

        switch (i)
        {
            case 0:
                DoScriptText(SAY_REM_START, m_creature, pPlayer);
                break;
            case 5:
                DoScriptText(SAY_REM_RAMP1_1, m_creature, pPlayer);
                break;
            case 6:
                DoSpawnCreature(NPC_GRAVEL_SCOUT, -10.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                DoSpawnCreature(NPC_GRAVEL_BONE, -10.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                break;
            case 9:
                DoScriptText(SAY_REM_RAMP1_2, m_creature, pPlayer);
                break;
            case 14:
                //depend quest rewarded?
                DoScriptText(SAY_REM_BOOK, m_creature, pPlayer);
                break;
            case 15:
                DoScriptText(SAY_REM_TENT1_1, m_creature, pPlayer);
                break;
            case 16:
                DoSpawnCreature(NPC_GRAVEL_SCOUT, -10.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                DoSpawnCreature(NPC_GRAVEL_BONE, -10.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                break;
            case 17:
                DoScriptText(SAY_REM_TENT1_2, m_creature, pPlayer);
                break;
            case 26:
                DoScriptText(SAY_REM_MOSS, m_creature, pPlayer);
                break;
            case 27:
                DoScriptText(EMOTE_REM_MOSS, m_creature, pPlayer);
                break;
            case 28:
                DoScriptText(SAY_REM_MOSS_PROGRESS, m_creature, pPlayer);
                break;
            case 29:
                DoSpawnCreature(NPC_GRAVEL_SCOUT, -15.0f, 3.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                DoSpawnCreature(NPC_GRAVEL_BONE, -15.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                DoSpawnCreature(NPC_GRAVEL_GEO, -15.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                break;
            case 31:
                DoScriptText(SAY_REM_PROGRESS, m_creature, pPlayer);
                break;
            case 41:
                DoScriptText(SAY_REM_REMEMBER, m_creature, pPlayer);
                break;
            case 42:
                DoScriptText(EMOTE_REM_END, m_creature, pPlayer);
                pPlayer->GroupEventHappens(QUEST_ABSENT_MINDED_PT2, m_creature);
                break;
        }
    }

    void Reset() override { }

    void Aggro(Unit* who) override
    {
        if (urand(0, 1))
            DoScriptText(SAY_REM_AGGRO, m_creature, who);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        //unsure if it should be any
        //pSummoned->AI()->AttackStart(m_creature);
    }
};

CreatureAI* GetAI_npc_prospector_remtravel(Creature* pCreature)
{
    return new npc_prospector_remtravelAI(pCreature);
}

bool QuestAccept_npc_prospector_remtravel(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ABSENT_MINDED_PT2)
    {
        pCreature->setFaction(FACTION_ESCORT_A_NEUTRAL_PASSIVE);

        if (npc_prospector_remtravelAI* pEscortAI = dynamic_cast<npc_prospector_remtravelAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest, true);
    }

    return true;
}

/*####
# npc_threshwackonator
####*/

enum
{
    EMOTE_START             = -1000325,
    SAY_AT_CLOSE            = -1000326,
    QUEST_GYROMAST_REV      = 2078,
    NPC_GELKAK              = 6667,
    FACTION_HOSTILE         = 14
};

#define GOSSIP_ITEM_INSERT_KEY  "[PH] Insert key"

struct npc_threshwackonatorAI : public FollowerAI
{
    npc_threshwackonatorAI(Creature* pCreature) : FollowerAI(pCreature)
    {
        Reset();
    }

    void Reset() override {}

    void MoveInLineOfSight(Unit* pWho) override
    {
        FollowerAI::MoveInLineOfSight(pWho);

        if (!m_creature->getVictim() && !HasFollowState(STATE_FOLLOW_COMPLETE) && pWho->GetEntry() == NPC_GELKAK)
        {
            if (m_creature->IsWithinDistInMap(pWho, 10.0f))
            {
                DoScriptText(SAY_AT_CLOSE, pWho);
                DoAtEnd();
            }
        }
    }

    void DoAtEnd()
    {
        m_creature->setFaction(FACTION_HOSTILE);

        if (Player* pHolder = GetLeaderForFollower())
            m_creature->AI()->AttackStart(pHolder);

        SetFollowComplete();
    }
};

CreatureAI* GetAI_npc_threshwackonator(Creature* pCreature)
{
    return new npc_threshwackonatorAI(pCreature);
}

bool GossipHello_npc_threshwackonator(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_GYROMAST_REV) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_INSERT_KEY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_threshwackonator(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();

        if (npc_threshwackonatorAI* pThreshAI = dynamic_cast<npc_threshwackonatorAI*>(pCreature->AI()))
        {
            DoScriptText(EMOTE_START, pCreature);
            pThreshAI->StartFollow(pPlayer);
        }
    }

    return true;
}

/*####
# npc_therylune
####*/

enum
{
    SAY_THERYLUNE_START              = -1000905,
    SAY_THERYLUNE_FINISH             = -1000906,

    NPC_THERYSIL                     = 3585,

    QUEST_ID_THERYLUNE_ESCAPE        = 945,
};

struct npc_theryluneAI : public npc_escortAI
{
    npc_theryluneAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }


    void Reset() override {}

    void WaypointReached(uint32 uiPointId) override
    {
        switch (uiPointId)
        {
            case 17:
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_ID_THERYLUNE_ESCAPE, m_creature);
                break;
            case 19:
                if (Player* pPlayer = GetPlayerForEscort())
                    DoScriptText(SAY_THERYLUNE_FINISH, m_creature, pPlayer);
                SetRun();
                break;
        }
    }
};

CreatureAI* GetAI_npc_therylune(Creature* pCreature)
{
    return new npc_theryluneAI(pCreature);
}

bool QuestAccept_npc_therylune(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ID_THERYLUNE_ESCAPE)
    {
        if (npc_theryluneAI* pEscortAI = dynamic_cast<npc_theryluneAI*>(pCreature->AI()))
        {
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
            DoScriptText(SAY_THERYLUNE_START, pCreature, pPlayer);
            pCreature->SetFactionTemporary(79, TEMPFACTION_RESTORE_RESPAWN);
        }
    }

    return true;
}
/*######
# npc_volcor
######*/

enum
{
    SAY_START                       = -1000789,
    SAY_END                         = -1000790,
    SAY_FIRST_AMBUSH                = -1000791,
    SAY_AGGRO_1                     = -1000792,
    SAY_AGGRO_2                     = -1000793,
    SAY_AGGRO_3                     = -1000794,

    SAY_ESCAPE                      = -1780209,

    NPC_BLACKWOOD_SHAMAN            = 2171,
    NPC_BLACKWOOD_URSA              = 2170,

    SPELL_MOONSTALKER_FORM          = 10849,

    WAYPOINT_ID_QUEST_STEALTH       = 16,
    FACTION_FRIENDLY                = 35,

    QUEST_ESCAPE_THROUGH_FORCE      = 994,
    QUEST_ESCAPE_THROUGH_STEALTH    = 995,
};

struct SummonLocation
{
    float m_fX, m_fY, m_fZ, m_fO;
};

// Spawn locations
static const SummonLocation aVolcorSpawnLocs[] =
{
    {4630.2f, 22.6f, 70.1f, 2.4f},
    {4603.8f, 53.5f, 70.4f, 5.4f},
    {4627.5f, 100.4f, 62.7f, 5.8f},
    {4692.8f, 75.8f, 56.7f, 3.1f},
    {4747.8f, 152.8f, 54.6f, 2.4f},
    {4711.7f, 109.1f, 53.5f, 2.4f},
};
// Escape Through Stealth
static SummonLocation aVolcorLocations[] =
{
    {4604.54f, -5.17f, 69.51f, 0.0f},
    {4604.26f, -2.02f, 69.42f, 0.0f },
    {4607.75f, 3.79f, 70.13f, 0.0f },
    {4607.75f, 3.79f, 70.13f, 0.0f },
    {4619.77f, 27.47f, 70.40f, 0.0f },
    {4640.33f, 33.74f, 68.22f, 0.0f }
};
struct npc_volcorAI : public npc_escortAI
{
    npc_volcorAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiQuestId;

    void Reset() override
    {
        if (!HasEscortState(STATE_ESCORT_ESCORTING))
        {
            m_uiQuestId = 0;
            StealthDialogueStep = 0;
            StealthDialogueTimer = 0;
        }
    }
    uint16 StealthDialogueStep;
    uint32 StealthDialogueTimer;
    void Aggro(Unit* /*pWho*/) override
    {
        // shouldn't always use text on agro
        switch (urand(0, 4))
        {
            case 0:
                DoScriptText(SAY_AGGRO_1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_AGGRO_2, m_creature);
                break;
            case 2:
                DoScriptText(SAY_AGGRO_3, m_creature);
                break;
        }
    }

    void JustRespawned() override
    {
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
        m_creature->SetHomePosition(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0.0f);

        npc_escortAI::JustRespawned();
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // No combat for this quest
        if (m_uiQuestId == QUEST_ESCAPE_THROUGH_STEALTH)
            return;

        npc_escortAI::MoveInLineOfSight(pWho);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        pSummoned->AI()->AttackStart(m_creature);
    }
    void MovementInform(uint32 uiMoveType, uint32 uiPointId) override
    {
        npc_escortAI::MovementInform(uiMoveType, uiPointId);

        if (uiMoveType != POINT_MOTION_TYPE)
            return;
        if (Player* pPlayer = GetPlayerForEscort())
        {
            if (m_uiQuestId == QUEST_ESCAPE_THROUGH_STEALTH && pPlayer->GetQuestStatus(QUEST_ESCAPE_THROUGH_STEALTH) == QUEST_STATUS_INCOMPLETE)
            {
                if (uiPointId < 5)
                    m_creature->GetMotionMaster()->MovePoint(uiPointId + 1, aVolcorLocations[uiPointId + 1].m_fX, aVolcorLocations[uiPointId + 1].m_fY, aVolcorLocations[uiPointId + 1].m_fZ, true);
                else if (uiPointId == 5)
                {
                    if (Player* pPlayer = GetPlayerForEscort())
                        pPlayer->GroupEventHappens(QUEST_ESCAPE_THROUGH_STEALTH, m_creature);
                    m_creature->DisappearAndDie();
                }
            }
        }
    }

    // Wrapper to handle start function for both quests
    void StartEscort(Player* pPlayer, const Quest* pQuest)
    {
        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
        m_creature->SetFacingToObject(pPlayer);
        m_uiQuestId = pQuest->GetQuestId();

        if (pQuest->GetQuestId() == QUEST_ESCAPE_THROUGH_STEALTH)
        {
            // Note: faction may not be correct, but only this way works fine
            m_creature->SetFactionTemporary(FACTION_FRIENDLY, TEMPFACTION_RESTORE_RESPAWN);

            Start(true, pPlayer->GetGUID(), pQuest);
            SetEscortPaused(true);
        }
        else
            Start(false, pPlayer->GetGUID(), pQuest);
    }

    void WaypointReached(uint32 uiPointId) override
    {
        if (m_uiQuestId == QUEST_ESCAPE_THROUGH_STEALTH)
            return;

        switch (uiPointId)
        {
            case 2:
                DoScriptText(SAY_START, m_creature);
                break;
            case 5:
                m_creature->SummonCreature(NPC_BLACKWOOD_SHAMAN, aVolcorSpawnLocs[0].m_fX, aVolcorSpawnLocs[0].m_fY, aVolcorSpawnLocs[0].m_fZ, aVolcorSpawnLocs[0].m_fO, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                m_creature->SummonCreature(NPC_BLACKWOOD_URSA, aVolcorSpawnLocs[1].m_fX, aVolcorSpawnLocs[1].m_fY, aVolcorSpawnLocs[1].m_fZ, aVolcorSpawnLocs[1].m_fO, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                break;
            case 6:
                DoScriptText(SAY_FIRST_AMBUSH, m_creature);
                break;
            case 11:
                m_creature->SummonCreature(NPC_BLACKWOOD_SHAMAN, aVolcorSpawnLocs[2].m_fX, aVolcorSpawnLocs[2].m_fY, aVolcorSpawnLocs[2].m_fZ, aVolcorSpawnLocs[2].m_fO, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                m_creature->SummonCreature(NPC_BLACKWOOD_URSA, aVolcorSpawnLocs[3].m_fX, aVolcorSpawnLocs[3].m_fY, aVolcorSpawnLocs[3].m_fZ, aVolcorSpawnLocs[3].m_fO, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
            // no break
            case 13:
                m_creature->SummonCreature(NPC_BLACKWOOD_URSA, aVolcorSpawnLocs[4].m_fX, aVolcorSpawnLocs[4].m_fY, aVolcorSpawnLocs[4].m_fZ, aVolcorSpawnLocs[4].m_fO, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                m_creature->SummonCreature(NPC_BLACKWOOD_URSA, aVolcorSpawnLocs[5].m_fX, aVolcorSpawnLocs[5].m_fY, aVolcorSpawnLocs[5].m_fZ, aVolcorSpawnLocs[5].m_fO, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                break;
            case 15:
                DoScriptText(SAY_END, m_creature);
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_ESCAPE_THROUGH_FORCE, m_creature);
                SetEscortPaused(true);
                m_creature->ForcedDespawn();
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
                break;
        }
    }
    void UpdateAI(const uint32 uiDiff) override
    {
        if (Player* pPlayer = GetPlayerForEscort())
        {
            if (StealthDialogueStep < 4 && m_uiQuestId == QUEST_ESCAPE_THROUGH_STEALTH && pPlayer->GetQuestStatus(QUEST_ESCAPE_THROUGH_STEALTH) == QUEST_STATUS_INCOMPLETE)
            {
                if (StealthDialogueTimer < uiDiff)
                {
                    switch (StealthDialogueStep)
                    {
                        case 0:
                            m_creature->HandleEmote(EMOTE_ONESHOT_BOW);
                            StealthDialogueTimer = 1000;
                            StealthDialogueStep++;
                            break;
                        case 1:
                            if (Player* pPlayer = GetPlayerForEscort())
                                DoScriptText(SAY_ESCAPE, m_creature, pPlayer);
                            StealthDialogueTimer = 4000;
                            StealthDialogueStep++;
                            break;
                        case 2:
                            DoCastSpellIfCan(m_creature, SPELL_MOONSTALKER_FORM);
                            StealthDialogueTimer = 4000;
                            StealthDialogueStep++;
                            break;
                        case 3:
                            m_creature->GetMotionMaster()->MovePoint(0, aVolcorLocations[0].m_fX, aVolcorLocations[0].m_fY, aVolcorLocations[0].m_fZ, true);
                            StealthDialogueTimer = 30000;
                            StealthDialogueStep++;
                            break;
                    }
                }
                else
                    StealthDialogueTimer -= uiDiff;
            }
        }
        npc_escortAI::UpdateAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_volcor(Creature* pCreature)
{
    return new npc_volcorAI(pCreature);
}

bool QuestAccept_npc_volcor(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ESCAPE_THROUGH_FORCE || pQuest->GetQuestId() == QUEST_ESCAPE_THROUGH_STEALTH)
    {
        if (npc_volcorAI* pEscortAI = dynamic_cast<npc_volcorAI*>(pCreature->AI()))
            pEscortAI->StartEscort(pPlayer, pQuest);
    }

    return true;
}
//Alita
/*####
# npc_captured_rabid_thistle_bear
####*/

enum
{
    SPELL_TRAPPED_BEAR              = 9439,
    NPC_CAPTURED_RABID_THISTLE_BEAR = 11836,
    SPELL_RAGE                      = 3150
};

struct npc_rabid_thistle_bearAI : public FollowerAI
{
    npc_rabid_thistle_bearAI(Creature* pCreature) : FollowerAI(pCreature)
    {
        Reset();
        Captured_Timer = -1;
    }
    int32 Rage_Timer;
    int32 Captured_Timer;
    void Reset() override
    {
        Rage_Timer = 5000;
    }
    void UpdateFollowerAI(const uint32 diff) override
    {
        int32 SignedDiff = diff;
        if (Captured_Timer >= 0)
        {
            if (Captured_Timer < SignedDiff)
            {
                Captured_Timer = -1;
                m_creature->DisappearAndDie();
            }
            else
                Captured_Timer -= SignedDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (Rage_Timer < SignedDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_RAGE) == CAST_OK)
                Rage_Timer = 60000;
        }
        else
            Rage_Timer -= SignedDiff;
        DoMeleeAttackIfReady();
    }
    void StartFollowing(Player* pPlayer)
    {
        Captured_Timer = 180000;
        //Captured_Timer = 10000;
        StartFollow(pPlayer);
    }
    void JustRespawned() override
    {
        FollowerAI::JustRespawned();
        Captured_Timer = -1;
    }
};
CreatureAI* GetAI_npc_rabid_thistle_bear(Creature* pCreature)
{
    return new npc_rabid_thistle_bearAI(pCreature);
}

bool EffectDummyCreature_npc_rabid_thistle_bear(Unit* pCaster, uint32 uiSpellId, SpellEffectIndex effIndex, Creature* pCreatureTarget)
{
    //always check spellid and effectindex
    if (uiSpellId == SPELL_TRAPPED_BEAR && effIndex == EFFECT_INDEX_0 && pCaster->GetTypeId() == TYPEID_PLAYER)
    {
        pCreatureTarget->UpdateEntry(NPC_CAPTURED_RABID_THISTLE_BEAR);
        pCaster->ToPlayer()->KilledMonsterCredit(pCreatureTarget->GetEntry(), pCreatureTarget->GetObjectGuid());
        if (npc_rabid_thistle_bearAI* pBearAI = dynamic_cast<npc_rabid_thistle_bearAI*>(pCreatureTarget->AI()))
        {
            pBearAI->EnterEvadeMode();
            pBearAI->StartFollowing(pCaster->ToPlayer());
        }
        //always return true when we are handling this spell and effect
        return true;
    }
    return false;
}

/*####
# npc_tharnariun_treetender
####*/

enum
{
    SAY_THARNARIUN_CLEANSED = -1780226,
    QUEST_PLAGUED_LANDS = 2118,
    SPELL_THARNARIUN_HEAL = 9457
};

struct npc_tharnariun_treetenderAI : public ScriptedAI
{
    npc_tharnariun_treetenderAI(Creature *c) : ScriptedAI(c)
    {
        Reset();
    }

    bool m_bPlaguedLandsEvent;
    uint32 m_uiPlaguedLandsTimer;
    uint8 PlaguedLandsCount;
    Player* pPlaguedLandsPlayer = nullptr;
    Creature* pPlaguedLandsBear = nullptr;

    void Reset()
    {
        m_bPlaguedLandsEvent = false;
        PlaguedLandsCount = 0;
        pPlaguedLandsPlayer = nullptr;
        pPlaguedLandsBear = nullptr;
    }

    void StartPlaguedLandsEvent(Player* pPlayer)
    {
        pPlaguedLandsPlayer = pPlayer;
        m_bPlaguedLandsEvent = true;
        PlaguedLandsCount = 1;
        m_uiPlaguedLandsTimer = 1100;
    }

    void UpdateAI(const uint32 diff)
    {
        if (m_bPlaguedLandsEvent)
        { 
            if (m_uiPlaguedLandsTimer < diff)
            {
                switch (PlaguedLandsCount)
                {
                    case 1:
                    {
                        DoScriptText(SAY_THARNARIUN_CLEANSED, m_creature);
                        m_uiPlaguedLandsTimer = 100;
                        PlaguedLandsCount++;
                        break;
                    }
                    case 2:
                    {
                        m_creature->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION);
                        m_uiPlaguedLandsTimer = 100;
                        PlaguedLandsCount++;
                        break;
                    }
                    case 3:
                    {
                        if (pPlaguedLandsPlayer)
                            pPlaguedLandsBear = pPlaguedLandsPlayer->FindNearestCreature(NPC_CAPTURED_RABID_THISTLE_BEAR, 10);

                        if (pPlaguedLandsBear)
                        {
                            pPlaguedLandsBear->CastSpell(pPlaguedLandsBear, SPELL_THARNARIUN_HEAL, true);
                            m_uiPlaguedLandsTimer = 3500;
                            PlaguedLandsCount++;
                            break;
                        }
                        else
                        {
                            m_bPlaguedLandsEvent = false;
                        }
                    }
                    case 4:
                    {
                        if (pPlaguedLandsBear)
                            pPlaguedLandsBear->DisappearAndDie();

                        m_bPlaguedLandsEvent = false;
                        break;
                    }
                    default:
                    {
                        m_bPlaguedLandsEvent = false;
                        break;
                    }
                }
            }
            else m_uiPlaguedLandsTimer -= diff;
        }

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_tharnariun_treetender(Creature *_Creature)
{
    return new npc_tharnariun_treetenderAI(_Creature);
}

bool QuestComplete_npc_tharnariun_treetender(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if (pQuest->GetQuestId() == QUEST_PLAGUED_LANDS)
    {
        if (auto pTharnariunAI = static_cast<npc_tharnariun_treetenderAI*>(pQuestGiver->AI()))
            pTharnariunAI->StartPlaguedLandsEvent(pPlayer); // event that plays on completion of quest Plagued Lands
    }
    return false;
}

/*####
# npc_terenthis
####*/

enum
{
    NPC_SENTINEL_SELARIN = 3694
};

bool QuestComplete_npc_terenthis(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuestGiver)
        return false;

    if (!pPlayer)
        return false;

    if ((pQuest->GetQuestId() == QUEST_ESCAPE_THROUGH_FORCE) || (pQuest->GetQuestId() == QUEST_ESCAPE_THROUGH_STEALTH))
    {
        if (pQuestGiver->FindNearestCreature(NPC_SENTINEL_SELARIN, 40))
            return true; // prevent starting db script if sentinel is already spawned
        else if (Creature* pSentinel = pQuestGiver->SummonCreature(NPC_SENTINEL_SELARIN, 6409.01f, 381.597f, 13.7997f, 1, TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN, 120000))
        {
            pSentinel->SetWalk(false);
            return false; // let quest_end_script take over from here
        }
        else
            return true; // prevent starting db script if sentinel was not spawned
    }
    return false;
}

/*####
# npc_sentinel_aynasha
####*/

enum
{
    SAY_AYNASHA_START           = -1780184,
    SAY_AYNASHA_ARROWS          = -1780185,
    SAY_AYNASHA_END1            = -1780186,
    SAY_AYNASHA_END2            = -1780187,
    SAY_AYNASHA_END3            = -1780188,

    SPELL_AYNASHAS_BOW          = 19767,
    QUEST_ONE_SHOT_ONE_KILL     = 5713,
    NPC_BLACKWOOD_TRACKER       = 11713,
    NPC_MAROSH_THE_DEVIOUS      = 11714
};


struct npc_sentinel_aynashaAI : public Scripted_NoMovementAI
{
    npc_sentinel_aynashaAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
    {
        m_uiPlayerGUID = 0;
        m_uiWaveTimer = 0;
        WaveNB = 0;
        Reset();
    }

    uint32 m_uiWaveTimer;
    uint8 WaveNB;
    uint32 m_uiSpell_AynashasBowTimer;
    uint64 m_uiPlayerGUID;

    void Reset() override
    {
        m_uiSpell_AynashasBowTimer = 0;
    }
    void JustDied(Unit* pKiller) override
    {
        if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_uiPlayerGUID))
        {
            if (pPlayer->GetQuestStatus(QUEST_ONE_SHOT_ONE_KILL) == QUEST_STATUS_INCOMPLETE)
                pPlayer->SetQuestStatus(QUEST_ONE_SHOT_ONE_KILL, QUEST_STATUS_FAILED);
        }
        QuestEnded();
    }
    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (WaveNB == 4 && pSummoned->GetEntry() == NPC_MAROSH_THE_DEVIOUS)
        {
            m_uiWaveTimer = 20000;
            if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_uiPlayerGUID))
                DoScriptText(SAY_AYNASHA_END1, m_creature, pPlayer);
            WaveNB++;
        }
    }
    void CallWave()
    {
        Creature* pSummoned = nullptr;
        switch (WaveNB)
        {
            case 1:
                for (int i = 0; i < 2; i++)
                {
                    if (pSummoned = m_creature->SummonCreature(NPC_BLACKWOOD_TRACKER, 4369.772949f, -10.731376f, 67.225563f, 4.52f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 360000))
                    {
                        pSummoned->GetMotionMaster()->MovePoint(0, 4386.507324f, -62.792439f, 86.935783f, true);
                        pSummoned->SetHomePosition(4386.507324f, -62.792439f, 86.935783f, 2.32f);
                    }
                }
                DoScriptText(SAY_AYNASHA_START, m_creature);
                break;
            case 2:
                for (int i = 0; i < 3; i++)
                {
                    if (pSummoned = m_creature->SummonCreature(NPC_BLACKWOOD_TRACKER, 4369.772949f, -10.731376f, 67.225563f, 4.52f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 360000))
                    {
                        pSummoned->GetMotionMaster()->MovePoint(0, 4386.507324f, -62.792439f, 86.935783f, true);
                        pSummoned->SetHomePosition(4386.507324f, -62.792439f, 86.935783f, 2.32f);
                    }
                }
                break;
            case 3:
                if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_uiPlayerGUID))
                    DoScriptText(SAY_AYNASHA_ARROWS, m_creature, pPlayer);
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
                if (pSummoned = m_creature->SummonCreature(NPC_MAROSH_THE_DEVIOUS, 4391.23584f, -8.533378f, 69.560616f, 4.516503f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 360000))
                {
                    pSummoned->GetMotionMaster()->MovePoint(0, 4386.507324f, -62.792439f, 86.935783f, true);
                    pSummoned->SetHomePosition(4386.507324f, -62.792439f, 86.935783f, 2.32f);
                }
                break;
            default:
                sLog.outDebug("Sentinel Aynasha wants to have an extra wave.");
        }
    }
    void UpdateAI(const uint32 uiDiff) override
    {
        if (WaveNB > 0 && WaveNB < 4)
        {
            if (m_uiWaveTimer < uiDiff)
            {
                CallWave();
                m_uiWaveTimer = 60000;
                WaveNB++;
            }
            else
                m_uiWaveTimer -= uiDiff;
        }
        else if (WaveNB == 5)
        {
            Player* pPlayer = nullptr;
            if (m_uiWaveTimer < uiDiff)
            {
                if (pPlayer = m_creature->GetMap()->GetPlayer(m_uiPlayerGUID))
                {
                    if (pPlayer->GetQuestStatus(QUEST_ONE_SHOT_ONE_KILL) == QUEST_STATUS_INCOMPLETE)
                        pPlayer->GroupEventHappens(QUEST_ONE_SHOT_ONE_KILL, m_creature);
                }
                QuestEnded();
            }
            else
            {
                if (m_uiWaveTimer >= 5000 && m_uiWaveTimer < 5000 + uiDiff)
                {
                    DoScriptText(SAY_AYNASHA_END2, m_creature);
                    m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                }
                else if (m_uiWaveTimer >= 2000 && m_uiWaveTimer < 2000 + uiDiff)
                {
                    if (pPlayer = m_creature->GetMap()->GetPlayer(m_uiPlayerGUID))
                        DoScriptText(SAY_AYNASHA_END3, m_creature, pPlayer);
                }

                m_uiWaveTimer -= uiDiff;
            }
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (WaveNB < 4)
        {
            if (m_uiSpell_AynashasBowTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_AYNASHAS_BOW) == CAST_OK)
                    m_uiSpell_AynashasBowTimer = 2000;
            }
            else
                m_uiSpell_AynashasBowTimer -= uiDiff;
        }
    }
    void QuestStarted(Player* pPlayer)
    {
        m_uiPlayerGUID = pPlayer->GetGUID();
        WaveNB = 1;
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
    }
    void QuestEnded()
    {
        m_uiPlayerGUID = 0;
        m_uiWaveTimer = 0;
        WaveNB = 0;
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
    }
};

CreatureAI* GetAI_npc_sentinel_aynasha(Creature* pCreature)
{
    return new npc_sentinel_aynashaAI(pCreature);
}

bool QuestAccept_npc_sentinel_aynasha(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ONE_SHOT_ONE_KILL)
    {
        if (npc_sentinel_aynashaAI* pSentinelAynashaAI = dynamic_cast<npc_sentinel_aynashaAI*>(pCreature->AI()))
            pSentinelAynashaAI->QuestStarted(pPlayer);
    }

    return true;
}

//would have thought taking it out of quest_template would have been necessary
//but turns out the quest adds the item afterwards with its check(so never adds),
//so it's fine to leave it in quest_template.
bool QuestAcceptGO_beached_sea(Player* player, GameObject* pGo, const Quest* pQuest)
{
    uint32 id = 0;
    uint32 count = 1;
    // Beached Sea turtle (12289)
    if (pQuest->GetQuestId() == 4722 ||  pQuest->GetQuestId() == 4727 ||  pQuest->GetQuestId() == 4732)
        id = 12289;
    //Beached Sea turtle, different item. (12292)
    else if (pQuest->GetQuestId() == 4725 || pQuest->GetQuestId() == 4731)
        id = 12292;
    //Beached Sea Creature (12242)
    else if (pQuest->GetQuestId() == 4723 || pQuest->GetQuestId() == 4728 || pQuest->GetQuestId() == 4730 || pQuest->GetQuestId() == 4733)
        id = 12242;
    if (!id)
        return true;
    //uint32 curItemCount = player->GetItemCount(id, true); //the whole point is to NOT check.
    ItemPosCountVec dest;
    uint8 msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, id, count /*- curItemCount*/);
    if (msg == EQUIP_ERR_OK)
    {
        Item* item = player->StoreNewItem(dest, id, true);
        player->SendNewItem(item, count /*- curItemCount*/, true, false);
    }
    return true;
}

/*
 *
 */

 /*###
 #npc_murkdeep
 ###*/

enum
{
    NPC_MURLOC_COATRUNNER   = 2202,
    NPC_MURLOC_WARRIOR      = 2205,
    NPC_MURLOC_HUNTER       = 2206,
    NPC_MURKDEEP            = 10323,

    GO_BONFIRE              = 61927,

    AREATRIGGER_MURKDEEP    = 1966,

    QUEST_WANTED_MURKDEEP   = 4740,

    SPELL_SUNDER_ARMOR      = 11971,
    SPELL_NET               = 6533
};

static const float m_fSummonPoints[3][3] =
{
    { 4984.772f, 596.975f, -1.172f },
    { 4989.618f, 599.530f, -1.291f },
    { 4979.620f, 593.845f, -0.881f }
};

struct npc_murkdeepAI : public ScriptedAI
{
    npc_murkdeepAI(Creature * pCreature) : ScriptedAI(pCreature)
    {
        npc_murkdeepAI::Reset();

        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
    }

    ObjectGuid m_playerGuid;
    ObjectGuid m_bonfireGuid;
    bool m_bEventState;
    uint8 m_uiEventPhase;
    uint32 m_uiEventTimer;
    uint32 m_uiSunderArmorTimer;
    uint32 m_uiNetTimer;

    void Reset() override
    {
        m_uiEventPhase = 0;
        m_bEventState = false;

        m_uiSunderArmorTimer = urand(0, 5);
        m_uiNetTimer = urand(0, 20);
    }

    void BeginEvent(Player *pPlayer)
    {
        if (!pPlayer)
            return;

        m_uiEventPhase = 1;
        m_uiEventTimer = 1000;
        m_bEventState = true;

        m_playerGuid = pPlayer->GetObjectGuid();

        GameObject* bonfire = GetClosestGameObjectWithEntry(m_creature, GO_BONFIRE, DEFAULT_VISIBILITY_DISTANCE);
        if (bonfire)
            m_bonfireGuid = bonfire->GetObjectGuid();
    }

    void JustSummoned(Creature* pWho) override
    {
        Player* player = GetPlayer();

        if (player)
        {
            pWho->AI()->AttackStart(player);
        }
        else
        {
            pWho->ForcedDespawn();
            pWho->RemoveCorpse();
            m_bEventState = false;
        }
    }

    Player* GetPlayer() const
    {
        Player* player = m_creature->GetMap()->GetPlayer(m_playerGuid);
        if (!player)
            return nullptr;

        GameObject* bonfire = m_creature->GetMap()->GetGameObject(m_bonfireGuid);
        if (!bonfire)
            return nullptr;

        if (player->IsInRange(bonfire, 0.0f, 50.0f) && player->isAlive())
            return player;

        return nullptr;
    }

    void DoSummon() const
    {
        switch (m_uiEventPhase)
        {
        case 1:
            for (uint8 i = 0; i < 3; ++i)
                m_creature->SummonCreature(NPC_MURLOC_COATRUNNER,
                    m_fSummonPoints[i][0],
                    m_fSummonPoints[i][1],
                    m_fSummonPoints[i][2],
                    m_creature->GetOrientation(),
                    TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 10 * MINUTE*IN_MILLISECONDS);
            break;
        case 2:
            for (uint8 i = 0; i < 2; ++i)
                m_creature->SummonCreature(NPC_MURLOC_WARRIOR,
                    m_fSummonPoints[i][0], m_fSummonPoints[i][1],
                    m_fSummonPoints[i][2],
                    m_creature->GetOrientation(),
                    TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 10 * MINUTE*IN_MILLISECONDS);
            break;
        case 3:
            m_creature->SummonCreature(NPC_MURLOC_HUNTER,
                m_fSummonPoints[1][0],
                m_fSummonPoints[1][1],
                m_fSummonPoints[1][2],
                m_creature->GetOrientation(),
                TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 10 * MINUTE*IN_MILLISECONDS);
            break;
        }
    }

    void DoAttack(const uint32 uiDiff)
    {
        // TODO - add (or not) Flee at 15% hp as it was set in EventAI

        if (m_uiSunderArmorTimer < uiDiff)
        {
            SpellAuraHolder* holder = m_creature->getVictim()->GetSpellAuraHolder(SPELL_SUNDER_ARMOR);
            if (!holder || holder->GetStackAmount() < 5)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SUNDER_ARMOR) == CAST_OK)
                    m_uiSunderArmorTimer = urand(5000, 9000);
            }
            else
                m_uiSunderArmorTimer = 5000;
        }
        else
            m_uiSunderArmorTimer -= uiDiff;

        if (m_uiNetTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_NET) == CAST_OK)
                m_uiNetTimer = urand(9000, 15000);
        }
        else
            m_uiNetTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (!m_uiEventPhase && m_bEventState && m_creature->GetVisibility() == VISIBILITY_OFF)
            {
                m_creature->ForcedDespawn();
                m_creature->RemoveCorpse();
            }

            if (m_uiEventPhase)
            {
                if (!m_bEventState)
                {
                    m_creature->ForcedDespawn();
                    m_creature->RemoveCorpse();
                }

                if (m_uiEventTimer < uiDiff)
                {
                    switch (m_uiEventPhase)
                    {
                    case 1:
                        DoSummon();
                        m_uiEventTimer = 30000;
                        ++m_uiEventPhase;
                        break;
                    case 2:
                        DoSummon();
                        m_uiEventTimer = 30000;
                        ++m_uiEventPhase;
                        break;
                    case 3:
                        DoSummon();
                        m_creature->SetVisibility(VISIBILITY_ON);
                        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);

                        Player* player = GetPlayer();
                        if (player)
                        {
                            AttackStart(player);
                        }
                        else
                        {
                            m_creature->ForcedDespawn();
                            m_creature->RemoveCorpse();
                        }
                        m_uiEventPhase = 0;
                        break;
                    }
                }
                else
                    m_uiEventTimer -= uiDiff;
            }

            return;
        }

        DoAttack(uiDiff);
    }
};

CreatureAI* GetAI_npc_murkdeep(Creature* pCreature)
{
    return new npc_murkdeepAI(pCreature);
}

bool at_murloc_camp(Player* pPlayer, AreaTriggerEntry const *pAt)
{
    if (pAt->id == AREATRIGGER_MURKDEEP)
    {
        if (pPlayer->isGameMaster() || pPlayer->isDead())
            return false;

        if (pPlayer && pPlayer->GetQuestStatus(QUEST_WANTED_MURKDEEP) == QUEST_STATUS_INCOMPLETE)
        {
            Creature *pCreature = GetClosestCreatureWithEntry(pPlayer, NPC_MURKDEEP, DEFAULT_VISIBILITY_DISTANCE);
            if (pCreature && pCreature->isAlive())
                return false;

            pCreature = pPlayer->SummonCreature(NPC_MURKDEEP, 
                m_fSummonPoints[0][0], 
                m_fSummonPoints[0][1], 
                m_fSummonPoints[0][2], 
                pPlayer->GetAngle(m_fSummonPoints[0][0], m_fSummonPoints[0][1]), 
                TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30 * MINUTE*IN_MILLISECONDS, true);

            if (pCreature)
            {
                if (auto pMurkdeepAI = dynamic_cast<npc_murkdeepAI*>(pCreature->AI()))
                    pMurkdeepAI->BeginEvent(pPlayer);
            }
        }
    }

    return false;
}

void AddSC_darkshore()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_kerlonian";
    newscript->GetAI = &GetAI_npc_kerlonian;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_kerlonian;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_prospector_remtravel";
    newscript->GetAI = &GetAI_npc_prospector_remtravel;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_prospector_remtravel;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_threshwackonator";
    newscript->GetAI = &GetAI_npc_threshwackonator;
    newscript->pGossipHello = &GossipHello_npc_threshwackonator;
    newscript->pGossipSelect = &GossipSelect_npc_threshwackonator;
    newscript->RegisterSelf();

    //import SD2
    newscript = new Script;
    newscript->Name = "npc_therylune";
    newscript->GetAI = &GetAI_npc_therylune;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_therylune;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_volcor";
    newscript->GetAI = &GetAI_npc_volcor;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_volcor;
    newscript->RegisterSelf();

    //Alita
    newscript = new Script;
    newscript->Name = "npc_rabid_thistle_bear";
    newscript->GetAI = &GetAI_npc_rabid_thistle_bear;
    newscript->pEffectDummyCreature = &EffectDummyCreature_npc_rabid_thistle_bear;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tharnariun_treetender";
    newscript->GetAI = &GetAI_npc_tharnariun_treetender;
    newscript->pQuestRewardedNPC = &QuestComplete_npc_tharnariun_treetender;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_terenthis";
    newscript->pQuestRewardedNPC = &QuestComplete_npc_terenthis;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_sentinel_aynasha";
    newscript->GetAI = &GetAI_npc_sentinel_aynasha;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_sentinel_aynasha;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_beached_quest";
    newscript->pGOQuestAccept = &QuestAcceptGO_beached_sea;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_murkdeep";
    newscript->GetAI = &GetAI_npc_murkdeep;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_murloc_camp";
    newscript->pAreaTrigger = &at_murloc_camp;
    newscript->RegisterSelf();
}
