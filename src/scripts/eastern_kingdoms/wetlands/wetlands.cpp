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
SDName: Wetlands
SD%Complete: 100
SDComment: Quest support: 1249
SDCategory: Wetlands
EndScriptData */

/* ContentData
npc_mikhail
npc_tapoke_slim_jahn
EndContentData */

#include "scriptPCH.h"

/*######
## npc_tapoke_slim_jahn
######*/

//-----------------------------------------------------------------------------
// Full quest event implementation (Missing Diplomat part 11 id:1249).
// Author: Kampeador
//-----------------------------------------------------------------------------

// On elysium core, JustRespawned() isn't called on spawn. Only on respawn.
#define ELYSIUM_CORE_JUST_RESPAWNED

enum
{
    // ids from "script_texts" table
    SAY_PROGRESS_1_TAP = -1999906, // Oh, it's on now! But you thought I'd be alone too, huh?!
    SAY_PROGRESS_2_FRI = -1999907, // Whoa! This is way more than what I bargained for, you're on your own, Slim!
    SAY_PROGRESS_3_TAP = -1999908, // Okay, okay! No need to get all violent. I'll talk. I'll talk!
    SAY_PROGRESS_4_TAP = -1999909, // I have a few notes from the job back at my place. I'll get them and then meet you back in the inn.
    SAY_PROGRESS_5_MIC = -1999910, // I'm glad the commotions died down some around here. The last thing this place needs is another brawl.
    // quest id
    QUEST_MISSING_DIPLO_PT11 = 1249,
    // faction
    FACTION_NEUTRAL = 189,
    FACTION_FRIENDLY = 11, // taken from DB
    // spells
    SPELL_STEALTH = 1785,
    SPELL_CALL_FRIENDS = 16457, // summons 1x friend
    // NPC ids
    NPC_MIKHAIL = 4963, // Quest giver, starts an event
    NPC_SLIMS_FRIEND = 4971, // NPC that helps Tapoke Slim
    NPC_TAPOKE_SLIM_JAHN = 4962,
    // Waypoint Ids
    WAYPOINT_MAILBOX = 2,
    WAYPOINT_GATE = 6,
};

// TODO: fix correct gossip emotes during quest pickup
// TODO: Mikhail is not a vendor
// TODO: Gossip/quest giver flasg switch

struct npc_tapoke_slim_jahnAI : public npc_escortAI
{
    npc_tapoke_slim_jahnAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        m_slimsFriend = nullptr;
        m_mikhail = nullptr;

#ifdef ELYSIUM_CORE_JUST_RESPAWNED
        m_justCreated = true;
#endif
        Reset();
    }

    // flag defines, whether players have won the fight
    bool m_isBeaten;
    // defines, whether tapoke slim jahn summoned his friend
    bool m_friendSummoned;
    // event timmers
    uint32 m_nextDialogPhaseDelay;
    // missing diplomat quest event phase index
    uint32 m_mdDialogPhase;
    // Slim's friend
    Creature* m_slimsFriend;
    // Needed to properly reset Mikhail's quest giver flag, if something werd happend.
    Creature* m_mikhail;

#ifdef ELYSIUM_CORE_JUST_RESPAWNED  
    bool m_justCreated;
#endif

    void Reset()
    {
        m_nextDialogPhaseDelay = 0;
        m_mdDialogPhase = 0;
        m_isBeaten = false;

        if (!HasEscortState(STATE_ESCORT_ESCORTING))
            m_friendSummoned = false;
    }

    void JustDied(Unit*) override
    {
        // Something weird happend
        if (HasEscortState(STATE_ESCORT_ESCORTING))
        {
            // remove slim's friend
            if (m_slimsFriend)
            {
                static_cast<TemporarySummon*>(m_slimsFriend)->UnSummon();
                m_slimsFriend = nullptr;
            }

            // restore Milhail quest giver flag
            if (m_mikhail)
            {
                if (!m_mikhail->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
                {
                    // set quest giver flag and disable gossip
                    m_mikhail->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    m_mikhail->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                }
            }
        }
    }

    void JustRespawned()
    {
        npc_escortAI::JustRespawned(); // calls Reset()

                                       // restore quest giver flag and "announce" that Tapoke Slim Jahn has back.
        m_mikhail = GetClosestCreatureWithEntry(m_creature, NPC_MIKHAIL, 25.0f);
        if (m_mikhail)
        {
            if (!m_mikhail->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
            {
                // set quest giver flag and disable gossip
                m_mikhail->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                m_mikhail->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                // handle rare case.
                if (m_mikhail->isAlive())
                    DoScriptText(SAY_PROGRESS_5_MIC, m_mikhail);
            }
        }
    }

    void WaypointReached(uint32 uiPointId)
    {
        switch (uiPointId)
        {
        case WAYPOINT_MAILBOX:
        {
            // remove stealth and make tapoke slim running
            m_creature->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
            SetRun();
            // change faction
            m_creature->setFaction(FACTION_NEUTRAL);
        }break;
        case WAYPOINT_GATE:
        {
            // set quest failed if tapoke slim escaped
            Player* player = GetPlayerForEscort();
            if (player)
                player->GroupEventFailHappens(QUEST_MISSING_DIPLO_PT11);

            m_creature->ForcedDespawn(5000);
        }break;
        }
    }

    void Aggro(Unit* pWho)
    {
        Player* pPlayer = GetPlayerForEscort();

        if (HasEscortState(STATE_ESCORT_ESCORTING) && !m_friendSummoned)
        {
            // call a friend on aggro
            if (DoCastSpellIfCan(m_creature, SPELL_CALL_FRIENDS) == CAST_OK)
            {
                DoScriptText(SAY_PROGRESS_1_TAP, m_creature);
                m_friendSummoned = true;
            }
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        m_slimsFriend = pSummoned;

        // make Slim's friend attack player
        Player* player = GetPlayerForEscort();
        if (player)
            m_slimsFriend->AI()->AttackStart(player);
    }

    void AttackedBy(Unit* pAttacker)
    {
        if (m_creature->getVictim())
            return;

        if (m_creature->IsFriendlyTo(pAttacker))
            return;

        AttackStart(pAttacker);
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
#ifdef ELYSIUM_CORE_JUST_RESPAWNED
        if (m_justCreated)
        {
            m_justCreated = false;
            JustRespawned();
        }
#endif
        if (m_isBeaten)
        {
            if (m_nextDialogPhaseDelay < uiDiff)
            {
                switch (m_mdDialogPhase)
                {
                case 0:
                {
                    // Set him facing player.
                    Player* player = GetPlayerForEscort();
                    if (player)
                        m_creature->SetFacingToObject(player);
                    m_nextDialogPhaseDelay = 2000;
                }break;
                case 1: // Say_0
                {
                    // despawn Slims friend
                    if (m_slimsFriend)
                    {
                        static_cast<TemporarySummon*>(m_slimsFriend)->UnSummon();
                        m_slimsFriend = nullptr;
                    }

                    m_creature->HandleEmote(EMOTE_ONESHOT_BEG);
                    DoScriptText(SAY_PROGRESS_3_TAP, m_creature);
                    m_nextDialogPhaseDelay = 4000;
                }break;
                case 2: // Say_1
                {
                    m_creature->HandleEmote(EMOTE_ONESHOT_TALK);
                    DoScriptText(SAY_PROGRESS_4_TAP, m_creature);
                    m_nextDialogPhaseDelay = 6000;
                }break;
                case 3: // The End
                {
                    Player* player = GetPlayerForEscort();
                    if (player)
                        player->GroupEventHappens(QUEST_MISSING_DIPLO_PT11, m_creature);

                    // make illusion returning him back to the inn
                    Stop();

                    // despawn and respawn at inn
                    m_creature->ForcedDespawn(1000);
                    m_creature->SetRespawnDelay(2);

                    m_nextDialogPhaseDelay = 0;
                    m_mdDialogPhase = 0;
                    m_isBeaten = false;
                }break;
                }
                // move to the next phase
                ++m_mdDialogPhase;
            }
            else
                m_nextDialogPhaseDelay -= uiDiff;
        }
        else
            npc_escortAI::UpdateEscortAI(uiDiff);
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (!HasEscortState(STATE_ESCORT_ESCORTING))
            return;

        if (uiDamage > m_creature->GetHealth() || m_creature->GetHealthPercent() < 20.0f)
        {
            uiDamage = 0;

            m_nextDialogPhaseDelay = 0; //1000
            m_isBeaten = true;

            if (m_slimsFriend)
            {
                if (m_slimsFriend->isAlive())
                {
                    // stop combat
                    m_slimsFriend->CombatStop(true);
                    // remove all dots, etc
                    m_slimsFriend->RemoveAllAuras();
                    // clean thread list
                    m_slimsFriend->DeleteThreatList();
                    // make him unattackable
                    m_slimsFriend->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);

                    DoScriptText(SAY_PROGRESS_2_FRI, m_slimsFriend);
                }
            }

            // pause escort
            SetEscortPaused(true);

            // TEST
            Player* player = GetPlayerForEscort();
            if (player)

                m_creature->SetFacingToObject(player);

            // set faction to friendly
            m_creature->setFaction(FACTION_FRIENDLY);
            // remove all dots, etc
            m_creature->RemoveAllAuras();
            // clean thread list
            m_creature->DeleteThreatList();
            // stop combat
            m_creature->CombatStop(true);

            SetRun(false);


        }
    }
};

CreatureAI* GetAI_npc_tapoke_slim_jahn(Creature* pCreature)
{
    return new npc_tapoke_slim_jahnAI(pCreature);
}

/*######
## npc_mikhail
######*/

bool QuestAccept_npc_mikhail(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_MISSING_DIPLO_PT11)
    {
        Creature* pSlim = GetClosestCreatureWithEntry(pCreature, NPC_TAPOKE_SLIM_JAHN, 30.0f);

        if (!pSlim)
            return false;

        npc_tapoke_slim_jahnAI* tapokeSlimJahnAI = dynamic_cast<npc_tapoke_slim_jahnAI*>(pSlim->AI());
        if (tapokeSlimJahnAI)
        {
            // apply stealth
            pSlim->CastSpell(pSlim, SPELL_STEALTH, true);
            // players can't pickup a quest during event
            pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            // Mikhail has a specific gossip text during quest event
            pCreature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            // start escort
            tapokeSlimJahnAI->Start(false, pPlayer->GetGUID(), pQuest);
        }
    }
    return false;
}

bool GossipHello_npc_mikhail(Player* pPlayer, Creature* pCreature)
{
    // Correct gossip text, depends on whether player has duing The Missing Diplomat part 11 quest.
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    // Mikhail is not a quest giver during The Missing Diplomat quest event, he has a special gossip text instead.
    Creature* pSlim = GetClosestCreatureWithEntry(pCreature, NPC_TAPOKE_SLIM_JAHN, 30.0f);
    if (!pSlim)
        pPlayer->SEND_GOSSIP_MENU(1713, pCreature->GetGUID());
    else
    {
        npc_tapoke_slim_jahnAI* tapokeSlimJahnAI = dynamic_cast<npc_tapoke_slim_jahnAI*>(pSlim->AI());
        if (tapokeSlimJahnAI->HasEscortState(STATE_ESCORT_ESCORTING))
            pPlayer->SEND_GOSSIP_MENU(1713, pCreature->GetGUID());
        else
            pPlayer->SendPreparedQuest(pCreature->GetGUID());
    }

    return true;
}

/*######
## AddSC
######*/

void AddSC_wetlands()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_tapoke_slim_jahn";
    newscript->GetAI = &GetAI_npc_tapoke_slim_jahn;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_mikhail";
    newscript->pQuestAcceptNPC = &QuestAccept_npc_mikhail;
    newscript->RegisterSelf();
}
