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
SDName: Stormwind_City
SD%Complete: 100
SDComment: Quest support: 1640, 1447
SDCategory: Stormwind City
EndScriptData */

/* ContentData
npc_bartleby
npc_dashel_stonefist
EndContentData */

#include "scriptPCH.h"
#include <list>

/*######
## npc_bartleby
######*/

enum BartlebyData
{
    FACTION_ENEMY       = 168,
    QUEST_BEAT          = 1640
};

struct npc_bartlebyAI : public ScriptedAI
{
    npc_bartlebyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiNormalFaction = pCreature->GetFactionTemplateId();
        Reset();
    }

    uint32 m_uiNormalFaction;

    void Reset() override
    {
        if (m_creature->GetFactionTemplateId() != m_uiNormalFaction)
            m_creature->SetFactionTemplateId(m_uiNormalFaction);
    }

    void AttackedBy(Unit* pAttacker) override
    {
        if (!pAttacker || m_creature->GetVictim() || m_creature->IsFriendlyTo(pAttacker))
            return;

        AttackStart(pAttacker);
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage) override
    {
        if (!pDoneBy)
            return;

        if (uiDamage > m_creature->GetHealth() || ((m_creature->GetHealth() - uiDamage) * 100 / m_creature->GetMaxHealth() < 15))
        {
            uiDamage = 0;

            if (pDoneBy->GetTypeId() == TYPEID_PLAYER)
                ((Player*)pDoneBy)->AreaExploredOrEventHappens(QUEST_BEAT);

            EnterEvadeMode();
        }
    }
};

bool QuestAccept_npc_bartleby(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (!pPlayer || !pCreature || !pQuest)
        return false;

    if (pQuest->GetQuestId() == QUEST_BEAT)
    {
        pCreature->SetFactionTemplateId(FACTION_ENEMY);
        ((npc_bartlebyAI*)pCreature->AI())->AttackStart(pPlayer);
    }
    return true;
}

CreatureAI* GetAI_npc_bartleby(Creature* pCreature)
{
    return new npc_bartlebyAI(pCreature);
}

/*######
## npc_dashel_stonefist
######*/

//-----------------------------------------------------------------------------
// Full quest event implementation (Missing Diplomat part 8 id:1447).
// Author: Kampeador
//-----------------------------------------------------------------------------
enum DashelStonefistData
{
    // ids from "broadcast_text" table
    SAY_PROGRESS_1_DAS = 1961, // Now you're gonna get it good, "PlayerName".
    SAY_PROGRESS_2_DAS = 1712, // Okay, okay! Enough fighting. No one else needs to get hurt.
    SAY_PROGRESS_3_DAS = 1713, // It's okay, boys. Back off. You've done enough. I'll meet up with you later.
    SAY_PROGRESS_4_THU = 1716, // All right, boss. You sure though? Just seems like a waste of good practice.
    SAY_PROGRESS_5_THU = 1715, // Yeah, okay, boss. No problem.
    // quest id
    QUEST_MISSING_DIPLO_PT8 = 1447,
    // NPCs that helps Dashel
    NPC_OLD_TOWN_THUG = 4969,
    // factions
    FACTION_NEUTRAL = 189,
    FACTION_IRONFORGE = 122, // original faction taken from DB
    FACTION_FRIENDLY_TO_ALL = 35,
    // quest phases
    MDQP_NONE = 0, // Dashel returns his spawn point

    // Occur only if thugs are alive
    MDQP_SAY1 = 1,
    MDQP_SAY2 = 2,
    MDQP_SAY3 = 4,
    MDQP_THUG_WALK_AWAY_1 = 5,
    MDQP_THUG_WALK_AWAY_2 = 6,

    MDQP_QUEST_COMPLETE = 7 // Triggers quest complete
};

float aThugResetPosition[][3] = {
    { -8669.338867f, 448.362976f, 99.740005f },
    { -8686.397461f, 447.595703f, 99.994408f }
};

struct npc_dashel_stonefistAI : public ScriptedAI
{
    // old town thugs
    ObjectGuid m_thugs[2];
    // current event phase
    uint32 m_eventPhase;
    // check if an event has been started.
    bool m_dialogStarted;
    // player guid to trigger: quest completed
    ObjectGuid m_playerGuid;
    // timer to switch between phases
    uint32 m_nextPhaseDelayTimer;
    // used to check if 1 or more thugs are alive
    bool m_thugsAlive;
    // used to check if its a quest fight or not.
    bool m_questFightStarted;

    // if quest fight is active, then dialog event will be triggered
    inline void startQuestFight() { m_questFightStarted = true; }

    npc_dashel_stonefistAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_questFightStarted = false;
        Reset();
    }

    // Prevent Reset() call after Dashel has been defeated.
    void AttackedBy(Unit* pAttacker) override
    {
        if (!pAttacker || m_creature->GetVictim() || m_creature->IsFriendlyTo(pAttacker))
            return;

        AttackStart(pAttacker);
    }

    void Reset() override
    {
        if (m_questFightStarted)
        {
            // Reset() during quest fight -> quest failed.
            Player* player = m_creature->GetMap()->GetPlayer(m_playerGuid);
            if (player)
                player->GroupEventFailHappens(QUEST_MISSING_DIPLO_PT8);

            // remove thugs
            for (const auto& guid : m_thugs)
            {
                if (Creature* pThug = m_creature->GetMap()->GetCreature(guid))
                    if (pThug->IsAlive())
                        static_cast<TemporarySummon*>(pThug)->UnSummon();
            }
        }

        // clear thug guids
        for (auto& guid : m_thugs)
            guid.Clear();

        m_questFightStarted = false;
        m_eventPhase = MDQP_NONE;
        m_dialogStarted = false;
        m_nextPhaseDelayTimer = 3000; // MDQP_SAY1 phase delay
        m_thugsAlive = false;
        // restore some flags
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        // restore faction
        m_creature->SetFactionTemplateId(FACTION_IRONFORGE);
        // reset player guid
        m_playerGuid.Clear();
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage) override
    {
        if (m_questFightStarted)
        {
            if (uiDamage > m_creature->GetHealth() || m_creature->GetHealthPercent() < 20.0f)
            {
                uiDamage = 0;

                // Dashel says: Okay, okay! Enough fighting. No one else needs to get hurt.
                DoScriptText(SAY_PROGRESS_2_DAS, m_creature);

                m_creature->RemoveAllAuras();
                m_creature->SetFactionTemplateId(FACTION_FRIENDLY_TO_ALL);
                m_creature->DeleteThreatList();
                m_creature->CombatStop();

                if (MotionMaster* pMotionMaster = m_creature->GetMotionMaster())
                    pMotionMaster->MoveTargetedHome();

                // check if thugs are alive
                for (const auto& guid : m_thugs)
                {
                    if (Creature* pThug = m_creature->GetMap()->GetCreature(guid))
                    {
                        if (!pThug->IsAlive())
                            continue;

                        pThug->RemoveAllAuras();
                        pThug->DeleteThreatList();
                        pThug->CombatStop();

                        pThug->SetFactionTemplateId(FACTION_FRIENDLY_TO_ALL);

                        if (MotionMaster* pMotionMaster = pThug->GetMotionMaster())
                            pMotionMaster->MoveTargetedHome();

                        m_thugsAlive = true;
                    }
                }

                m_questFightStarted = false;
                m_dialogStarted = true;
                m_eventPhase = MDQP_NONE;
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        switch (m_eventPhase)
        {
            case MDQP_SAY1: // Occurs only if thugs are alive
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    // Dashel says: It's okay, boys. Back off. You've done enough.I'll meet up with you later.
                    DoScriptText(SAY_PROGRESS_3_DAS, m_creature);
                    // switch phase
                    m_nextPhaseDelayTimer = 3000;
                    m_eventPhase = MDQP_SAY2;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
                break;
            }
            case MDQP_SAY2: // Occurs only if thugs are alive
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    // recheck for safety, thugs can be killed by gm command, etc.
                    if (Creature* pThug = m_creature->GetMap()->GetCreature(m_thugs[0]))
                        if (pThug->IsAlive())
                            DoScriptText(SAY_PROGRESS_4_THU, pThug);

                    // switch phase
                    m_nextPhaseDelayTimer = 1500;
                    m_eventPhase = MDQP_SAY3;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
                break;
            }
            case MDQP_SAY3: // Occurs only if thugs are alive
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    // recheck for safety, thugs can be killed by gm command, etc.
                    if (Creature* pThug = m_creature->GetMap()->GetCreature(m_thugs[1]))
                        if (pThug->IsAlive())
                            DoScriptText(SAY_PROGRESS_5_THU, pThug);

                    // switch phase
                    m_nextPhaseDelayTimer = 1000;
                    m_eventPhase = MDQP_THUG_WALK_AWAY_1;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
                break;
            }
            case MDQP_THUG_WALK_AWAY_1: // Occurs only if thugs are alive
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    ResetThug(0);

                    m_nextPhaseDelayTimer = 1500;
                    m_eventPhase = MDQP_THUG_WALK_AWAY_2;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
                break;
            }
            case MDQP_THUG_WALK_AWAY_2: // Occurs only if thugs are alive
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    // Second thug goes away
                    ResetThug(1);

                    m_nextPhaseDelayTimer = 1000;
                    m_eventPhase = MDQP_QUEST_COMPLETE;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
                break;
            }
            case MDQP_QUEST_COMPLETE:
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    // Set quest completed
                    Player* player = m_creature->GetMap()->GetPlayer(m_playerGuid);
                    if (player)
                        player->GroupEventHappens(QUEST_MISSING_DIPLO_PT8, m_creature);

                    Reset();
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
                break;
            }
            default: // MDQP_NONE
                ScriptedAI::UpdateAI(uiDiff);
                break;
        }
    }

    void ResetThug(int thug)
    {
        if (thug >= 2)
            return;

        if (Creature* pThug = m_creature->GetMap()->GetCreature(m_thugs[thug]))
        {
            if (pThug->IsAlive())
            {
                pThug->GetMotionMaster()->MovePoint(0, aThugResetPosition[thug][0], aThugResetPosition[thug][1], aThugResetPosition[thug][2], MOVE_WALK_MODE);
                pThug->DespawnOrUnsummon(3000);
            }
        }
    }

    // Dashel returns to his spawn point
    void JustReachedHome() override
    {
        // switch to correct dialog phase, depends if thugs are alive.
        if (m_dialogStarted)
        {
            if (m_thugsAlive)
                m_eventPhase = MDQP_SAY1;
            else
                m_eventPhase = MDQP_QUEST_COMPLETE;
        }
    }

    void JustDied(Unit* pUnit) override
    {
        // case: something weird happened, killed by GM command, etc.
        if (m_dialogStarted || m_questFightStarted)
        {
            // remove thugs
            for (auto& guid : m_thugs)
            {
                if (Creature* pThug = m_creature->GetMap()->GetCreature(guid))
                    static_cast<TemporarySummon*>(pThug)->UnSummon();
                guid.Clear();
            }
        }
    }

    void SummonedCreatureJustDied(Creature *creature) override
    {
        // If the thug died for whatever reason, clear the pointer. Otherwise, if
        // combat is extended, the thug may despawn and we'll access a dangling
        // pointer
        for (auto& guid : m_thugs)
        {
            if (guid == creature->GetObjectGuid())
                guid.Clear();
        }
    }

    void SummonedCreatureDespawn(Creature* creature) override
    {
        for (auto& guid : m_thugs)
        {
            if (guid == creature->GetObjectGuid())
                guid.Clear();
        }
    }
};

bool QuestAccept_npc_dashel_stonefist(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (!pPlayer || !pCreature || !pQuest)
        return false;

    if (pQuest->GetQuestId() == QUEST_MISSING_DIPLO_PT8)
    {
        npc_dashel_stonefistAI* dashelStonefistAI = dynamic_cast<npc_dashel_stonefistAI*>(pCreature->AI());
        if (dashelStonefistAI)
        {
            // On official in some cases: he didn't say this phrase. I am not sure if it was a bug or a random feature.
            // Dashel says: Now you're gonna get it good, "PlayerName".
            DoScriptText(SAY_PROGRESS_1_DAS, pCreature, pPlayer);

            pCreature->SetFactionTemplateId(FACTION_NEUTRAL);
            pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

            dashelStonefistAI->m_playerGuid = pPlayer->GetObjectGuid();

            // spawn thugs and make them focus player.
            Creature* pThug1 = pCreature->SummonCreature(NPC_OLD_TOWN_THUG, -8676.075195f, 443.744019f, 99.632210f, 3.981758f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30000);

            if (!pThug1 || !pThug1->AI())
                return false;

            dashelStonefistAI->m_thugs[0] = pThug1->GetObjectGuid();

            pThug1->AI()->AttackStart(pPlayer);
            pThug1->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);

            // thug 2
            if (Creature* pThug2 = pCreature->SummonCreature(NPC_OLD_TOWN_THUG, -8685.416992f, 443.130829f, 99.526917f, 5.759635f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30000))
            {
                dashelStonefistAI->m_thugs[1] = pThug2->GetObjectGuid();
                pThug2->AI()->AttackStart(pPlayer);
                pThug2->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
            }
            // start quest fight.
            dashelStonefistAI->startQuestFight();
            // make Dashel focus player.
            dashelStonefistAI->AttackStart(pPlayer);
        }
        else
            return false;
    }
    return true;
}

CreatureAI* GetAI_npc_dashel_stonefist(Creature* pCreature)
{
    return new npc_dashel_stonefistAI(pCreature);
}

void AddSC_stormwind_city()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_bartleby";
    newscript->GetAI = &GetAI_npc_bartleby;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_bartleby;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_dashel_stonefist";
    newscript->GetAI = &GetAI_npc_dashel_stonefist;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_dashel_stonefist;
    newscript->RegisterSelf();
}
