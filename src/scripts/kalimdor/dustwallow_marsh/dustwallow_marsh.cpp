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
SDComment: Quest support: 558, 1324. Vendor Nat Pagle
SDCategory: Dustwallow Marsh
EndScriptData */

/* ContentData
npc_lady_jaina_proudmoore
npc_cassa_crimsonwing
EndContentData */

#include "scriptPCH.h"

//-----------------------------------------------------------------------------
// Full quest event implementation (Missing Diplomat part 14 id:1265).
// Author: Kampeador
//-----------------------------------------------------------------------------
static const Position tervoshSpawnPoint = { -3476.860840f, -4106.740723f, 17.107151f, 5.420159f };

enum
{
    QUEST_MISSING_DIPLO_PT14 = 1265, // quest id
    QUEST_MISSING_DIPLO_PT16 = 1324, // quest id
    TERVOSH_SPAWN_DURATION = 60000, // 60 sec blizzlike value
    TERVOSH_SAY_ON_QUEST_MD_PT14 = -1999914, // Go with grace, and may the Lady's magic protect you.
    NPC_SENTRY_POINT_GUARD = 5085, // all guards around Tervosh will salute.
    NPC_TERVOSH = 4967,

    SPELL_TELEPORT_VISUAL1 = 7141, // A visual spell effect when Tervosh arrives
    SPELL_TELEPORT_VISUAL2 = 7077, // A visual spell effect when Tervosh returns back
    SPELL_PROUDMOORES_DEFENSE = 7120, // player characters will receive a buff, once quest is completed

    // script phases:
    MDQP_PREPARE_TO_ARRIVE = 0, // Very rare. It occurs when a new player arrives during MDQP_TELEPORT_BACK in previous event.
    MDQP_ARRIVE = 1, // Tervosh arrives.
    MDQP_GUARDS_SALUTE = 2, // All Sentry Point guards withing 10 yards start facing Tervosh and use EMOTE_ONESHOT_SALUTE emote
    MDQP_GUARDS_RESTORE_MOVEMENT = 3, // Currently unused, core does this automatically.
    MDQP_WAITING = 4, // Wait for despawn
    MDQP_TELEPORT_BACK = 5  // Tervosh despawn during this phase
};

struct npc_archmage_tervoshAI : public ScriptedAI
{
    // this one is modified inside area-trigger script.
    bool m_eventStarted;
    // event timmers
    uint32 m_despawnDelayTimer; // once this timer expires, NPC will despawn.
    // event phase delay
    uint32 m_eventPhase;
    // guards salute timer
    uint32 m_nextPhaseDelayTimer;

    npc_archmage_tervoshAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    // used on area-trigger: if a new player arrives, reset event duration.
    void resetDespawnDelay() { m_despawnDelayTimer = TERVOSH_SPAWN_DURATION; }
    // returns the current phase in the event
    uint32 getCurrentPhase() const { return m_eventPhase; }

    void Reset() override
    {
        m_eventStarted = false;
        m_eventPhase = MDQP_ARRIVE;
        m_nextPhaseDelayTimer = 1000; // delay for the visual effect of the arrival
        m_despawnDelayTimer = TERVOSH_SPAWN_DURATION;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_eventStarted)
        {
            switch (m_eventPhase)
            {
            case MDQP_PREPARE_TO_ARRIVE:
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    m_creature->SetVisibility(VISIBILITY_ON);

                    // switch phase
                    m_nextPhaseDelayTimer = 1000; // delay for the visual effect of the arrival
                    m_eventPhase = MDQP_ARRIVE;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
            } break;
            case MDQP_ARRIVE:
            {
                // use a visual effect with 1 sec delay
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    m_creature->CastSpell(m_creature, SPELL_TELEPORT_VISUAL1, false);

                    // switch phase
                    m_nextPhaseDelayTimer = 2000; // salute guards 2 sec delay
                    m_eventPhase = MDQP_GUARDS_SALUTE;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
            } break;
            case MDQP_GUARDS_SALUTE:
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    // find all guards nearby
                    std::list<Creature*> guards;
                    // All guards salute withing 10 yards.
                    GetCreatureListWithEntryInGrid(guards, m_creature, NPC_SENTRY_POINT_GUARD, 10);

                    // make guards face private hendel
                    for (auto const& g : guards)
                    {
                        if (!g->IsInCombat() && g->IsAlive())
                        {
                            g->StopMoving(); // Movement will be restored automatically in the core
                            g->SetFacingToObject(m_creature);

                            g->HandleEmote(EMOTE_ONESHOT_SALUTE);
                        }
                    }

                    m_eventPhase = MDQP_WAITING;
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
            }break;
            case MDQP_WAITING:
            {
                // possible add a visual effect
                if (m_despawnDelayTimer < uiDiff)
                {
                    // cast a visual spell effect
                    m_creature->CastSpell(m_creature, SPELL_TELEPORT_VISUAL2, false);

                    // switch phase, delay despawn by 2 seconds, 1 sec teleport visual, 1 sec latency.
                    m_nextPhaseDelayTimer = 2000; // next quest phase in 2 secs
                    m_eventPhase = MDQP_TELEPORT_BACK;
                }
                else
                    m_despawnDelayTimer -= uiDiff;
            } break;

            case MDQP_TELEPORT_BACK:
            {
                if (m_nextPhaseDelayTimer < uiDiff)
                {
                    // despawn
                    static_cast<TemporarySummon*>(m_creature)->UnSummon();
                }
                else
                    m_nextPhaseDelayTimer -= uiDiff;
            } break;
            }
        }
        else
            ScriptedAI::UpdateAI(uiDiff);
    }
};

bool QuestRewarded_npc_archmage_tervosh(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (!pPlayer || !pCreature || !pQuest)
        return false;

    if (pQuest->GetQuestId() == QUEST_MISSING_DIPLO_PT14)
    {
        if (npc_archmage_tervoshAI* pTervoshAI = dynamic_cast<npc_archmage_tervoshAI*>(pCreature->AI()))
        {
            // Tervosh says: Go with grace, and may the Lady's magic protect you.
            DoScriptText(TERVOSH_SAY_ON_QUEST_MD_PT14, pCreature);

            // rare case: if two players are completing this quest at the same time, then only the last one will receive a buff.
            // i am pretty sure that, this bug existed on retail, so handle this case, by making cast triggered/instant.
            pCreature->CastSpell(pPlayer, SPELL_PROUDMOORES_DEFENSE, true);
        }
    }

    return true;
}

CreatureAI* GetAI_npc_archmage_tervosh(Creature* pCreature)
{
    return new npc_archmage_tervoshAI(pCreature);
}

bool AreaTrigger_at_sentry_point(Player* pPlayer, AreaTriggerEntry const* /*pAt*/)
{
    if (!pPlayer || !pPlayer->IsAlive() || pPlayer->IsGameMaster() ||
        pPlayer->GetQuestStatus(QUEST_MISSING_DIPLO_PT14) == QUEST_STATUS_COMPLETE ||
        pPlayer->GetQuestStatus(QUEST_MISSING_DIPLO_PT14) == QUEST_STATUS_NONE)
        return false;

    // set quest completed
    pPlayer->CompleteQuest(QUEST_MISSING_DIPLO_PT14);
    pPlayer->SendQuestCompleteEvent(QUEST_MISSING_DIPLO_PT14);

    // Check if Tervosh has already arrived.
    Creature* tervosh = GetClosestCreatureWithEntry(pPlayer, NPC_TERVOSH, 15.0f); // check better distance should be shorter as possible
    // Tervosh is not here, summon him.
    if (!tervosh)
    {
        // Summon Tervosh and force map cell active during the event.
        tervosh = pPlayer->SummonCreature(NPC_TERVOSH, tervoshSpawnPoint.x, tervoshSpawnPoint.y, tervoshSpawnPoint.z, tervoshSpawnPoint.o, TEMPSUMMON_MANUAL_DESPAWN, true);
        // something weird happened
        if (!tervosh)
            return false;

        // rare case: players from the opposite faction can attack the NPC during event. Set him unattackable like on official.
        tervosh->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_IMMUNE_TO_NPC);

        if (npc_archmage_tervoshAI* tervoshAI = dynamic_cast<npc_archmage_tervoshAI*>(tervosh->AI()))
            tervoshAI->m_eventStarted = true;
    }
    else if (npc_archmage_tervoshAI* tervoshAI = dynamic_cast<npc_archmage_tervoshAI*>(tervosh->AI()))
    {
        // If we're already waiting, let him wait longer
        if (tervoshAI->getCurrentPhase() == MDQP_WAITING)
        {
            tervoshAI->resetDespawnDelay();
        }
        else if (tervoshAI->getCurrentPhase() == MDQP_TELEPORT_BACK)
        {
            // very rare case:
            // players can arrive when Tervosh returns back.
            // spawn Tervosh with invisiblity flag, then make him visible with 3 seconds delay

            // Summon Tervosh and force map cell active during the event.
            tervosh = pPlayer->SummonCreature(NPC_TERVOSH, tervoshSpawnPoint.x, tervoshSpawnPoint.y, tervoshSpawnPoint.z, tervoshSpawnPoint.o, TEMPSUMMON_MANUAL_DESPAWN, true);
            // something weird happened
            if (!tervosh)
                return false;
            tervosh->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_IMMUNE_TO_NPC);
            tervosh->SetVisibility(VISIBILITY_OFF);
            // start the event.
            if (npc_archmage_tervoshAI* tervoshNewAI = dynamic_cast<npc_archmage_tervoshAI*>(tervosh->AI()))
            {
                // set inital phase to MDQP_PREPARE_TO_ARRIVE
                tervoshNewAI->m_nextPhaseDelayTimer = 3000;
                tervoshNewAI->m_eventPhase = MDQP_PREPARE_TO_ARRIVE;
                tervoshNewAI->m_eventStarted = true;
            }
        }
    }

    return true;
}

/*######
## npc_lady_jaina_proudmoore
######*/

enum
{
    QUEST_JAINAS_AUTOGRAPH       = 558,
    QUEST_MISSING_DIPLO_PT17     = 1267,
    NPC_SUMMONED_WATER_ELEMENTAL = 10955,
    SPELL_JAINA_FIREBALL         = 20678,
    SPELL_JAINA_FIREBLAST        = 20679,
    SPELL_JAINA_BLIZZARD         = 20680,
    SPELL_JAINA_WATER_ELEMENTAL  = 20681,
    SPELL_JAINA_TELEPORT         = 20682,
    SPELL_JAINAS_AUTOGRAPH       = 23122
};

#define GOSSIP_ITEM_JAINA "I know this is rather silly but i have a young ward who is a bit shy and would like your autograph."

struct npc_lady_jaina_proudmooreAI : public ScriptedAI
{
    npc_lady_jaina_proudmooreAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSpellTimer;
    uint32 m_uiSpecialTimer;

    void Reset() override
    {
        m_uiSpellTimer = 3000;
        m_uiSpecialTimer = 15000;
    }

    void EnterCombat(Unit* enemy) override
    {
        me->PlayDistanceSound(5882);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim() || m_creature->IsNonMeleeSpellCasted())
            return;

        if (m_uiSpecialTimer < uiDiff)
        {
            if (!urand(0, 4) && !m_creature->GetGuardianCountWithEntry(NPC_SUMMONED_WATER_ELEMENTAL))
            {
                if (DoCastSpellIfCan(m_creature, SPELL_JAINA_WATER_ELEMENTAL) == CAST_OK)
                    m_uiSpecialTimer = urand(10, 20)*IN_MILLISECONDS;
            }
            else
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_JAINA_TELEPORT) == CAST_OK)
                { 
                    m_uiSpecialTimer = urand(10, 30)*IN_MILLISECONDS;

                    if (m_creature->GetDistance2d(-4018.1f, -4525.24f) > 40.0f)
                    {
                        // If we don't remove target from threat list after teleporting,
                        // Jaina will try to chase him and evade despite having other targets.
                        Unit* pOldVictim = m_creature->GetVictim();
                        m_creature->_removeAttacker(pOldVictim);
                        m_creature->GetThreatManager().modifyThreatPercent(pOldVictim, -101.0f);
                    }
                }
            }
        }
        else
            m_uiSpecialTimer -= uiDiff;

        if (m_uiSpellTimer < uiDiff)
        {
            switch (urand(0, 4))
            {
                case 0:
                case 1:
                {
                    if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_JAINA_FIREBALL) == CAST_OK)
                        m_uiSpellTimer = urand(3, 10)*IN_MILLISECONDS;
                    break;
                }
                case 2:
                case 3:
                {
                    if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_JAINA_FIREBLAST) == CAST_OK)
                        m_uiSpellTimer = urand(3, 10)*IN_MILLISECONDS;
                    break;
                }
                case 4:
                {
                    if (Unit* pTarget = m_creature->SelectRandomUnfriendlyTarget(nullptr, 25.0f))
                    {
                        if (DoCastSpellIfCan(pTarget, SPELL_JAINA_BLIZZARD) == CAST_OK)
                            m_uiSpellTimer = urand(1, 3)*IN_MILLISECONDS;
                    }
                    break;
                }
            }
        }
        else
            m_uiSpellTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_lady_jaina_proudmoore(Creature* pCreature)
{
    return new npc_lady_jaina_proudmooreAI(pCreature);
}

bool GossipHello_npc_lady_jaina_proudmoore(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_JAINAS_AUTOGRAPH) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_JAINA, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    // Correct gossip text depends on The Missing Diplomat quest chain progression.
    if (pPlayer->GetQuestStatus(QUEST_MISSING_DIPLO_PT17) == QUEST_STATUS_COMPLETE)
        pPlayer->SEND_GOSSIP_MENU(3158, pCreature->GetGUID()); // Hendel is in our custody now...
    else if (pPlayer->GetQuestStatus(QUEST_MISSING_DIPLO_PT16) == QUEST_STATUS_COMPLETE)
        pPlayer->SendPreparedQuest(pCreature->GetGUID());
    else
        pPlayer->SEND_GOSSIP_MENU(3157, pCreature->GetGUID()); // I welcome you to Theramore...

    return true;
}

bool GossipSelect_npc_lady_jaina_proudmoore(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF)
    {
        pPlayer->SEND_GOSSIP_MENU(7012, pCreature->GetGUID());
        pPlayer->CastSpell(pPlayer, SPELL_JAINAS_AUTOGRAPH, false);
    }
    return true;
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
    SAY_IGNATZ_START         = 1610,
    SAY_IGNATZ_0             = 1611,
    SAY_IGNATZ_1             = 1612,
    SAY_IGNATZ_2             = 1614,
    SAY_IGNATZ_3             = 1615,
    SAY_IGNATZ_4             = 1617,
    SAY_IGNATZ_END           = 1618,
    SAY_IGNATZ_AGGRO_1       = 1630,
    SAY_IGNATZ_AGGRO_2       = 1631,
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

    void Reset() override {}

    void JustRespawned() override
    {
        currWaypoint = 0;
        timer = 21000;
        npc_escortAI::JustRespawned();
    }

    uint32 currWaypoint;
    uint32 timer;

    void WaypointReached(uint32 uiPointId) override
    {
        currWaypoint = uiPointId;

        switch (uiPointId)
        {
            case 0:
                DoScriptText(SAY_IGNATZ_START, m_creature);
                break;;
            case 4:
                DoScriptText(SAY_IGNATZ_0, m_creature);
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

    void Aggro(Unit* pWho) override
    {
        // not always
        if (urand(0, 2))
            return;

        if (currWaypoint < 15)
        {
            DoScriptText(SAY_IGNATZ_AGGRO_1, m_creature, pWho);
        }
        else
        {
            DoScriptText(SAY_IGNATZ_AGGRO_2, m_creature, pWho);
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
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

bool QuestAccept_npc_stinky_ignatz(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_STINKYS_ESCAPE_A || pQuest->GetQuestId() == QUEST_STINKYS_ESCAPE_H)
    {
        pCreature->SetFactionTemplateId(113);
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
 * Emberstrife
 */

enum
{
    EMOTE_GENERIC_FRENZY_KILL   = 7797,
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

    void UpdateAI(uint32 const uiDiff) override
    {
        // Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!m_bWeakened && m_creature->GetHealthPercent() < 11)
        {
            m_bWeakened = true;
            DoScriptText(EMOTE_GENERIC_IS_WEAKENED, m_creature);
        }

        // Cleave
        if (m_uiCleaveTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CLEAVE) == CAST_OK)
                m_uiCleaveTimer = urand(6000, 8000);
        }
        else
            m_uiCleaveTimer -= uiDiff;

        // Flame Breath
        if (m_uiFlameBreathTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FLAME_BREATH) == CAST_OK)
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
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_lady_jaina_proudmoore";
    newscript->GetAI = &GetAI_npc_lady_jaina_proudmoore;
    newscript->pGossipHello = &GossipHello_npc_lady_jaina_proudmoore;
    newscript->pGossipSelect = &GossipSelect_npc_lady_jaina_proudmoore;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_archmage_tervosh";
    newscript->GetAI = &GetAI_npc_archmage_tervosh;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_archmage_tervosh;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_sentry_point";
    newscript->pAreaTrigger = &AreaTrigger_at_sentry_point;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_stinky_ignatz";
    newscript->GetAI = &GetAI_npc_stinky_ignatz;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_stinky_ignatz;
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
