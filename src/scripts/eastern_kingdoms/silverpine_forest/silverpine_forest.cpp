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
SDName: Silverpine_Forest
SD%Complete: 100
SDComment: Quest support: 435, 452, 1886
SDCategory: Silverpine Forest
EndScriptData */

/* ContentData
npc_astor_hadren
npc_deathstalker_erland
npc_deathstalker_faerleia
EndContentData */

#include "scriptPCH.h"

/*######
## npc_astor_hadren
######*/

struct npc_astor_hadrenAI : public ScriptedAI
{
    npc_astor_hadrenAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        m_creature->setFaction(68);
    }

    void JustDied(Unit *who)
    {
        m_creature->setFaction(68);
    }
};

CreatureAI* GetAI_npc_astor_hadren(Creature *_creature)
{
    return new npc_astor_hadrenAI(_creature);
}

bool GossipHello_npc_astor_hadren(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(1886) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "You're Astor Hadren, right?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(623, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_astor_hadren(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF + 1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "You've got something I need, Astor. And I'll be taking it now.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(624, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 2:
            pPlayer->CLOSE_GOSSIP_MENU();
            pCreature->setFaction(21);
            ((npc_astor_hadrenAI*)pCreature->AI())->AttackStart(pPlayer);
            break;
    }
    return true;
}

/*#####
## npc_deathstalker_erland
#####*/

enum
{
    SAY_START_1         = -1000306,
    SAY_START_2         = -1000307,
    SAY_AGGRO_1         = -1000308,
    SAY_AGGRO_2         = -1000309,
    SAY_AGGRO_3         = -1000310,
    SAY_PROGRESS        = -1000311,
    SAY_END             = -1000312,
    SAY_RANE            = -1000313,
    SAY_RANE_REPLY      = -1000314,
    SAY_CHECK_NEXT      = -1000315,
    SAY_QUINN           = -1000316,
    SAY_QUINN_REPLY     = -1000317,
    SAY_BYE             = -1000318,

    QUEST_ERLAND        = 435,
    NPC_RANE            = 1950,
    NPC_QUINN           = 1951
};

struct npc_deathstalker_erlandAI : public npc_escortAI
{
    npc_deathstalker_erlandAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        uiRaneGUID = 0;
        uiQuinnGUID = 0;
        Reset();
    }

    uint64 uiRaneGUID;
    uint64 uiQuinnGUID;

    void MoveInLineOfSight(Unit* pUnit)
    {
        if (HasEscortState(STATE_ESCORT_ESCORTING))
        {
            if (!uiRaneGUID && pUnit->GetEntry() == NPC_RANE)
            {
                if (m_creature->IsWithinDistInMap(pUnit, 30.0f))
                    uiRaneGUID = pUnit->GetGUID();
            }
            if (!uiQuinnGUID && pUnit->GetEntry() == NPC_QUINN)
            {
                if (m_creature->IsWithinDistInMap(pUnit, 30.0f))
                    uiQuinnGUID = pUnit->GetGUID();
            }
        }

        npc_escortAI::MoveInLineOfSight(pUnit);
    }

    void WaypointReached(uint32 i)
    {
        Player* pPlayer = GetPlayerForEscort();

        if (!pPlayer)
            return;

        switch (i)
        {
            case 0:
                DoScriptText(SAY_START_2, m_creature, pPlayer);
                break;
            case 13:
                DoScriptText(SAY_END, m_creature, pPlayer);
                pPlayer->GroupEventHappens(QUEST_ERLAND, m_creature);
                break;
            case 14:
                if (Unit* pRane = m_creature->GetMap()->GetUnit(uiRaneGUID))
                    DoScriptText(SAY_RANE, pRane, m_creature);
                break;
            case 15:
                DoScriptText(SAY_RANE_REPLY, m_creature);
                break;
            case 16:
                DoScriptText(SAY_CHECK_NEXT, m_creature);
                break;
            case 24:
                DoScriptText(SAY_QUINN, m_creature);
                break;
            case 25:
                if (Unit* pQuinn = m_creature->GetMap()->GetUnit(uiQuinnGUID))
                    DoScriptText(SAY_QUINN_REPLY, pQuinn, m_creature);
                break;
            case 26:
                DoScriptText(SAY_BYE, m_creature);
                break;
        }
    }

    void Reset()
    {
        if (!HasEscortState(STATE_ESCORT_ESCORTING))
        {
            uiRaneGUID = 0;
            uiQuinnGUID = 0;
        }
    }

    void Aggro(Unit* who)
    {
        switch (urand(0, 2))
        {
            case 0:
                DoScriptText(SAY_AGGRO_1, m_creature, who);
                break;
            case 1:
                DoScriptText(SAY_AGGRO_2, m_creature, who);
                break;
            case 2:
                DoScriptText(SAY_AGGRO_3, m_creature, who);
                break;
        }
    }
};

bool QuestAccept_npc_deathstalker_erland(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ERLAND)
    {
        DoScriptText(SAY_START_1, pCreature);

        if (npc_deathstalker_erlandAI* pEscortAI = dynamic_cast<npc_deathstalker_erlandAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

CreatureAI* GetAI_npc_deathstalker_erland(Creature* pCreature)
{
    return new npc_deathstalker_erlandAI(pCreature);
}

/*#####
## npc_deathstalker_faerleia
#####*/

enum
{
    QUEST_PYREWOOD_AMBUSH    = 452,

    // cast it after every wave
    SPELL_DRINK_POTION       = 3359,

    SAY_START                = -1000553,
    SAY_COMPLETED            = -1000554,

    // 1st wave
    NPC_COUNCILMAN_SMITHERS  = 2060,
    // 2nd wave
    NPC_COUNCILMAN_THATHER   = 2061,
    NPC_COUNCILMAN_HENDRICKS = 2062,
    // 3rd wave
    NPC_COUNCILMAN_WILHELM   = 2063,
    NPC_COUNCILMAN_HARTIN    = 2064,
    NPC_COUNCILMAN_HIGARTH   = 2066,
    // final wave
    NPC_COUNCILMAN_COOPER    = 2065,
    NPC_COUNCILMAN_BRUNSWICK = 2067,
    NPC_LORD_MAYOR_MORRISON  = 2068
};

struct SpawnPoint
{
    float fX;
    float fY;
    float fZ;
    float fO;
};

SpawnPoint SpawnPoints[] =
{
    { -397.45f, 1509.56f, 18.87f, 4.73f },
    { -398.35f, 1510.75f, 18.87f, 4.76f },
    { -396.41f, 1511.06f, 18.87f, 4.74f }
};

static float m_afMoveCoords[] = { -410.69f, 1498.04f, 19.77f };

struct npc_deathstalker_faerleiaAI : ScriptedAI
{
    explicit npc_deathstalker_faerleiaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_deathstalker_faerleiaAI::Reset();
        m_bEventStarted = false;
    }

    void Reset() override
    {
    }

    uint64 m_uiPlayerGUID;
    uint32 m_uiWaveTimer;
    uint32 m_uiSummonCount;
    uint8  m_uiWaveCount;
    bool   m_bEventStarted;

    void StartEvent(uint64 uiPlayerGUID)
    {
        if (m_bEventStarted) return;

        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

        m_uiPlayerGUID  = uiPlayerGUID;
        m_bEventStarted = true;
        m_uiWaveTimer   = 10000;
        m_uiSummonCount = 0;
        m_uiWaveCount   = 0;
    }

    void FinishEvent()
    {
        m_uiPlayerGUID = 0;
        m_bEventStarted = false;
    }

    void JustRespawned() override
    {
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_uiPlayerGUID))
            pPlayer->SendQuestFailed(QUEST_PYREWOOD_AMBUSH);

        FinishEvent();
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (!m_bEventStarted) return;

        ++m_uiSummonCount;

        // put them on correct waypoints later on
        float fX, fY, fZ;
        bool found = false;

        for (uint8 i = 0; i < 10; ++i)
        {
            if (pSummoned->GetRandomPoint(m_afMoveCoords[0], m_afMoveCoords[1], m_afMoveCoords[2], 4.0f, fX, fY, fZ))
            {
                found = true;
                break;
            }
        }
        
        if (found)
            pSummoned->GetMotionMaster()->MovePoint(99, fX, fY, fZ, MOVE_PATHFINDING);
        else
            pSummoned->GetMotionMaster()->MovePoint(99, m_afMoveCoords[0], m_afMoveCoords[1], m_afMoveCoords[2], MOVE_PATHFINDING);
    }

    void SummonedCreatureJustDied(Creature* /*pKilled*/) override
    {
        if (!m_bEventStarted) return;

        --m_uiSummonCount;

        if (!m_uiSummonCount)
        {
            DoCastSpellIfCan(m_creature, SPELL_DRINK_POTION);

            // final wave
            if (m_uiWaveCount == 4)
            {
                DoScriptText(SAY_COMPLETED, m_creature);
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

                if (Player* pPlayer = (m_creature->GetMap()->GetPlayer(m_uiPlayerGUID)))
                    pPlayer->GroupEventHappens(QUEST_PYREWOOD_AMBUSH, m_creature);

                FinishEvent();
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_bEventStarted && !m_uiSummonCount)
        {
            if (m_uiWaveTimer < uiDiff)
            {
                switch (m_uiWaveCount)
                {
                    case 0:
                        m_creature->SummonCreature(NPC_COUNCILMAN_SMITHERS,  SpawnPoints[1].fX, SpawnPoints[1].fY, SpawnPoints[1].fZ, SpawnPoints[1].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_uiWaveTimer = 10000;
                        break;
                    case 1:
                        m_creature->SummonCreature(NPC_COUNCILMAN_THATHER,   SpawnPoints[2].fX, SpawnPoints[2].fY, SpawnPoints[2].fZ, SpawnPoints[2].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_creature->SummonCreature(NPC_COUNCILMAN_HENDRICKS, SpawnPoints[1].fX, SpawnPoints[1].fY, SpawnPoints[1].fZ, SpawnPoints[1].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_uiWaveTimer = 10000;
                        break;
                    case 2:
                        m_creature->SummonCreature(NPC_COUNCILMAN_WILHELM,   SpawnPoints[1].fX, SpawnPoints[1].fY, SpawnPoints[1].fZ, SpawnPoints[1].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_creature->SummonCreature(NPC_COUNCILMAN_HARTIN,    SpawnPoints[0].fX, SpawnPoints[0].fY, SpawnPoints[0].fZ, SpawnPoints[0].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_creature->SummonCreature(NPC_COUNCILMAN_HIGARTH,   SpawnPoints[2].fX, SpawnPoints[2].fY, SpawnPoints[2].fZ, SpawnPoints[2].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_uiWaveTimer  = 8000;
                        break;
                    case 3:
                        m_creature->SummonCreature(NPC_COUNCILMAN_COOPER,    SpawnPoints[1].fX, SpawnPoints[1].fY, SpawnPoints[1].fZ, SpawnPoints[1].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_creature->SummonCreature(NPC_COUNCILMAN_BRUNSWICK, SpawnPoints[2].fX, SpawnPoints[2].fY, SpawnPoints[2].fZ, SpawnPoints[2].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        m_creature->SummonCreature(NPC_LORD_MAYOR_MORRISON,  SpawnPoints[0].fX, SpawnPoints[0].fY, SpawnPoints[0].fZ, SpawnPoints[0].fO, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000);
                        break;
                }

                ++m_uiWaveCount;
            }
            else
                m_uiWaveTimer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

bool QuestAccept_npc_deathstalker_faerleia(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_PYREWOOD_AMBUSH)
    {
        DoScriptText(SAY_START, pCreature, pPlayer);

        if (auto pFaerleiaAI = dynamic_cast<npc_deathstalker_faerleiaAI*>(pCreature->AI()))
            pFaerleiaAI->StartEvent(pPlayer->GetGUID());
    }
    return true;
}

CreatureAI* GetAI_npc_deathstalker_faerleia(Creature* pCreature)
{
    return new npc_deathstalker_faerleiaAI(pCreature);
}

/*
 * Pyrewood Council support
 */

enum
{
    NPC_FAERLEIA        = 2058
};

struct npc_councilmanAI : ScriptedAI
{
    explicit npc_councilmanAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_councilmanAI::Reset();
    }

    void Reset() override
    {

    }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (uiType != POINT_MOTION_TYPE) return;

        if (uiPointId == 99)
        {
            if (auto pFaerleia = m_creature->FindNearestCreature(NPC_FAERLEIA, 30.0f))
                m_creature->AddThreat(pFaerleia);
        }
    }

    void EnterEvadeMode() override
    {
        // should happen only if all players and questgiver are dead
        // thus nothing to do in world any longer
        m_creature->ForcedDespawn();
    }
};

CreatureAI* GetAI_npc_councilman(Creature* pCreature)
{
    return new npc_councilmanAI(pCreature);
}

/*
 *
 */

enum
{
    PYREWOOD_WATCHER       = 1891,
    MOONRAGE_WATCHER       = 1892,
    PYREWOOD_SENTRY        = 1894,
    MOONRAGE_SENTRY        = 1893,
    PYREWOOD_ELDER         = 1895,
    MOONRAGE_ELDER         = 1896,
    PYREWOOD_ARMORER       = 3528,
    MOONRAGE_ARMORER       = 3529,
    PYREWOOD_TAILOR        = 3530,
    MOONRAGE_TAILER        = 3531,
    PYREWOOD_LEATHERWORKER = 3532,
    MOONRAGE_LEATHERWORKER = 3533,

    SPELL_DEFENSIVE_STANCE = 7164,
    SPELL_SHIELD_BLOCK     = 12169,
    SPELL_BACKSTAB         = 15657,
    SPELL_DISARM           = 6713,
    SPELL_EXPOSE_WEAKNESS  = 7140,
    SPELL_SHOOT_PYREWOOD   = 6660,
    SPELL_LESSER_HEAL      = 2053,
};

//#define DEBUG_WORGEN_TRANSFO

struct npc_human_worgenAI : public ScriptedAI
{
    npc_human_worgenAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiTransformAnimTimer = 0;
        Reset();
        m_uiOriginalEntry = m_creature->GetEntry();
        switch (m_creature->GetEntry())
        {
            case PYREWOOD_WATCHER:
                m_uiWorgenEntry = MOONRAGE_WATCHER;
                break;
            case PYREWOOD_SENTRY:
                m_uiWorgenEntry = MOONRAGE_SENTRY;
                break;
            case PYREWOOD_ELDER:
                m_uiWorgenEntry = MOONRAGE_ELDER;
                break;
            case PYREWOOD_ARMORER:
                m_uiWorgenEntry = MOONRAGE_ARMORER;
                break;
            case PYREWOOD_TAILOR:
                m_uiWorgenEntry = MOONRAGE_TAILER;
                break;
            case PYREWOOD_LEATHERWORKER:
                m_uiWorgenEntry = MOONRAGE_LEATHERWORKER;
                break;
            default:
                return;
        }
    }

    uint32 m_uiOriginalEntry;
    uint32 m_uiWorgenEntry;
    uint32 m_bIsInDefenseStance;
    uint32 m_uiShieldBlock_Timer;
    uint32 m_uiBackstab_Timer;
    uint32 m_uiDisarm_Timer;
    uint32 m_uiExposeWeakness_Timer;
    uint32 m_uiShoot_Timer;
    uint32 m_uiWolfSound_Timer;
    uint32 m_uiHeal_Timer;
    uint32 m_uiTransformAnimTimer;
#ifdef DEBUG_WORGEN_TRANSFO
    uint32 m_uiDebugTransfoTimer;
#endif

    bool IsWorgen() const
    {
        return m_creature->GetEntry() == m_uiWorgenEntry;
    }
    void Reset()
    {
        m_bIsInDefenseStance     = false;
        m_uiShieldBlock_Timer    = 3000;
        m_uiShoot_Timer          = 3000;
        m_uiExposeWeakness_Timer = 3800;
        m_uiDisarm_Timer         = 9200;
        m_uiBackstab_Timer       = 7000;
        m_uiHeal_Timer           = 8800;
        m_uiWolfSound_Timer      = urand(60000, 600000);
#ifdef DEBUG_WORGEN_TRANSFO
        m_uiDebugTransfoTimer    = 20000;
#endif
    }

    void UpdateAI(const uint32 uiDiff)
    {
        time_t rawtime;
        time(&rawtime);
        struct tm * timeinfo = localtime(&rawtime);
        bool worgenTime = ((timeinfo->tm_hour >= 21) || (timeinfo->tm_hour >= 0 && timeinfo->tm_hour < 9));
#ifdef DEBUG_WORGEN_TRANSFO
        worgenTime = IsWorgen();
        if (m_uiDebugTransfoTimer < uiDiff)
        {
            worgenTime = !IsWorgen();
            m_uiDebugTransfoTimer = 15000;
        }
        else
            m_uiDebugTransfoTimer -= uiDiff;
#endif
        if (m_uiTransformAnimTimer)
        {
            if (m_uiTransformAnimTimer <= uiDiff)
            {
                m_uiTransformAnimTimer = 0;
                m_creature->CastSpell(m_creature, 24085, true);
            }
            else
                m_uiTransformAnimTimer -= uiDiff;
        }
        if (worgenTime && !IsWorgen())
        {
            m_creature->UpdateEntry(m_uiWorgenEntry);
            m_creature->PlayDirectSound(6017);
            m_creature->SetTempPacified(1000);
            m_uiTransformAnimTimer = 100;
            Reset();
        }
        else if (!worgenTime && IsWorgen())
        {
            m_creature->UpdateEntry(m_uiOriginalEntry);
            m_creature->PlayDirectSound(6017);
            m_creature->SetTempPacified(1000);
            m_uiTransformAnimTimer = 100;
            Reset();
        }

        if (IsWorgen())
        {
            if (m_uiWolfSound_Timer < uiDiff)
            {
                m_creature->PlayDirectSound(6017);
                m_uiWolfSound_Timer = urand(60000, 600000);
            }
            else
                m_uiWolfSound_Timer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        switch (m_creature->GetEntry())
        {
            case PYREWOOD_WATCHER:
                break;
            case PYREWOOD_SENTRY:
                if (!m_bIsInDefenseStance)
                {
                    DoCastSpellIfCan(m_creature, SPELL_DEFENSIVE_STANCE, true);
                    m_bIsInDefenseStance = true;
                }

                if (m_creature->GetHealthPercent() <= 15.0f)
                    m_creature->DoFlee();

                if (m_uiShieldBlock_Timer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_SHIELD_BLOCK, true) == CAST_OK)
                        m_uiShieldBlock_Timer = 8100;
                }
                else
                    m_uiShieldBlock_Timer -= uiDiff;

                break;
            case PYREWOOD_ELDER:

                if (m_uiHeal_Timer < uiDiff)
                {
                    if (m_creature->GetHealthPercent() < 80.0f)
                    {
                        if (DoCastSpellIfCan(m_creature, SPELL_LESSER_HEAL, true) == CAST_OK)
                            m_uiHeal_Timer = 8800;
                    }
                }
                else
                    m_uiHeal_Timer -= uiDiff;

                break;
            case PYREWOOD_ARMORER:
                break;
            case PYREWOOD_TAILOR:
                if (m_uiBackstab_Timer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_BACKSTAB) == CAST_OK)
                        m_uiBackstab_Timer = 8100;
                }
                else
                    m_uiBackstab_Timer -= uiDiff;

                if (m_uiDisarm_Timer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DISARM) == CAST_OK)
                        m_uiDisarm_Timer = 7100;
                }
                else
                    m_uiDisarm_Timer -= uiDiff;

                if (m_uiExposeWeakness_Timer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_EXPOSE_WEAKNESS) == CAST_OK)
                        m_uiExposeWeakness_Timer = 9100;
                }
                else
                    m_uiExposeWeakness_Timer -= uiDiff;

                break;
            case PYREWOOD_LEATHERWORKER:
                break;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_human_worgen(Creature *_creature)
{
    return new npc_human_worgenAI(_creature);
}

/*
 * Dusty Spellbooks
 */

enum
{
    NPC_MOONRAGE_DARKRUNNER     = 1770,

    QUEST_ARUGAL_FOLLY          = 422,
};

#define DARKRUNNER_SAY "The Sons of Arugal will rise against all who challenge the power of the Moonrage!"

struct go_dusty_spellbooksAI : GameObjectAI
{
    explicit go_dusty_spellbooksAI(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_bJustUsed = false;
        m_uiJustUsedTimer = 0;
    }

    bool m_bJustUsed;
    uint32 m_uiJustUsedTimer;

    bool OnUse(Unit* pCaster) override
    {
        auto pPlayer = pCaster->ToPlayer();

        if (!pPlayer) return true;

        if (!(pPlayer->GetQuestStatus(QUEST_ARUGAL_FOLLY) == QUEST_STATUS_INCOMPLETE)) return true;

        if (!m_bJustUsed)
        {
            if (auto pCreature = me->SummonCreature(NPC_MOONRAGE_DARKRUNNER, 875.38f, 1232.43f, 52.6f, 3.16f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 90000))
            {
                pCreature->MonsterSay(DARKRUNNER_SAY);
                pCreature->AddThreat(pCaster);
                m_bJustUsed = true;
                m_uiJustUsedTimer = 1000;
            }            
        }

        return true;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_bJustUsed) return;

        if (m_uiJustUsedTimer < uiDiff)
        {
            m_bJustUsed = false;
        }
        else
            m_uiJustUsedTimer -= uiDiff;
    }
};

GameObjectAI* GetAI_go_dusty_spellbooks(GameObject* pGo)
{
    return new go_dusty_spellbooksAI(pGo);
}

void AddSC_silverpine_forest()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_human_worgen";
    newscript->GetAI = &GetAI_npc_human_worgen;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_astor_hadren";
    newscript->pGossipHello =  &GossipHello_npc_astor_hadren;
    newscript->pGossipSelect = &GossipSelect_npc_astor_hadren;
    newscript->GetAI = &GetAI_npc_astor_hadren;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_deathstalker_erland";
    newscript->GetAI = &GetAI_npc_deathstalker_erland;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_deathstalker_erland;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_deathstalker_faerleia";
    newscript->GetAI = &GetAI_npc_deathstalker_faerleia;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_deathstalker_faerleia;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_councilman";
    newscript->GetAI = &GetAI_npc_councilman;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_dusty_spellbooks";
    newscript->GOGetAI = &GetAI_go_dusty_spellbooks;
    newscript->RegisterSelf();
}
