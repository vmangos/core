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
SDComment: Quest support: Lothos Riftwaker teleport to Molten Core.
SDCategory: Searing Gorge
EndScriptData */

/* ContentData
npc_zamael_lunthistle
EndContentData */

#include "scriptPCH.h"
#include "Group.h"

/*######
## npc_dorius_stonetender
######*/

enum DoriusStonetenderData
{
    SAY_DORIUS_AGGRO_1              = 4353,
    SAY_DORIUS_AGGRO_2              = 4351,
    SAY_DORIUS_INJURED_DWARF        = 4352,


    SAY_DORIUS_CATCH_MY_BREATH      = 4345,

    SAY_DORIUS_QUIT_SMOKING         = 4356,

    SAY_DORIUS_THIS_IS_THE_PLACE    = 4354,
    SAY_DORIUS_ONWARD               = 4355,

    SAY_DORIUS_RUN                  = 4357,

    SAY_DORIUS_NEED_A_BREATHER      = 4363,
    SAY_DORIUS_ARRRRRGH             = 4359,
    ACTION_DORIUS_POINTS            = 5944,

    SAY_DARK_IRON_MARKSMAN_HES_MINE = 4358,
    NPC_DARK_IRON_MARKSMAN          = 8338,

    NPC_DARK_IRON_STEELSHIFTER      = 8337,

    STEELSHIFTERS_COUNT_A           = 2,
    STEELSHIFTERS_COUNT_B           = 4,

    QUEST_ID_SUNTARA_STONES         = 3367
};

uint32 GAMEOBJECT_ID_SINGED_LETTER = 175704;
uint32 GAMEOBJECT_GUID_SINGED_LETTER = 10106;

struct npc_dorius_stonetenderAI : public npc_escortAI
{
    npc_dorius_stonetenderAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void SpawnSingedLetter()
    {
        if (auto pGo = m_creature->GetMap()->GetGameObject(ObjectGuid(HIGHGUID_GAMEOBJECT, GAMEOBJECT_ID_SINGED_LETTER, GAMEOBJECT_GUID_SINGED_LETTER)))
        {
            pGo->SetLootState(GO_READY);
            pGo->SetRespawnTime(1);
        }
    }

    void SpawnSteelshifterWave(int count)
    {
        float fX, fY, fZ;
        for (uint8 i = 0; i < count; ++i)
        {
            m_creature->GetNearPoint(m_creature, fX, fY, fZ, 0, 15.0f, i * M_PI_F / 2);
            m_creature->SummonCreature(NPC_DARK_IRON_STEELSHIFTER, fX, fY, fZ, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000);
        }
    }

    void SpawnMarksman()
    {
        // Spawns on the hill facing Dorius, to the north.
        float fX = -6369.524414f, fY = -1974.548340f, fZ = 256.675995f, fAng = 3.623531f;
        Creature* marksman = m_creature->SummonCreature(NPC_DARK_IRON_MARKSMAN, fX, fY, fZ, fAng, TEMPSUMMON_TIMED_DESPAWN, 10000, false, 10000);
        marksman->SetSheath(SHEATH_STATE_RANGED);
    }

    void Reset() override { }

    void ResetCreature() override
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
    }

    void JustStartedEscort() override
    {
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
    }

    void Aggro(Unit* pWho) override
    {
        switch (urand(0, 3))
        {
            case 0:
                DoScriptText(SAY_DORIUS_AGGRO_1, m_creature, pWho);
                break;
            case 1:
                DoScriptText(SAY_DORIUS_AGGRO_2, m_creature, pWho);
                break;
            case 2:
                DoScriptText(SAY_DORIUS_INJURED_DWARF, m_creature);
                break;
        }
    }

    void WaypointReached(uint32 uiPointId) override
    {
        switch (uiPointId)
        {
            case 11:
                DoScriptText(SAY_DORIUS_CATCH_MY_BREATH, m_creature);
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
                break;
            case 12:
                SpawnSteelshifterWave(STEELSHIFTERS_COUNT_A);
                break;
            case 15:
                if (Player* pPlayer = GetPlayerForEscort()) {
                    m_creature->HandleEmote(EMOTE_ONESHOT_POINT);
                    DoScriptText(SAY_DORIUS_THIS_IS_THE_PLACE, m_creature, pPlayer);
                }
                break;
            case 16:
                if (Player* pPlayer = GetPlayerForEscort())
                    m_creature->SetFacingToObject(pPlayer);
                DoScriptText(SAY_DORIUS_ONWARD, m_creature);
                break;
            case 20:
                if (Player* pPlayer = GetPlayerForEscort())
                    m_creature->SetFacingToObject(pPlayer);
                DoScriptText(SAY_DORIUS_QUIT_SMOKING, m_creature);
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
                break;
            case 21:
                SpawnSteelshifterWave(STEELSHIFTERS_COUNT_B);
                break;
            case 24:
                DoScriptText(SAY_DORIUS_RUN, m_creature);
                break;
            case 25:
                SetRun(true);
                break;
            case 38:
                DoScriptText(SAY_DORIUS_NEED_A_BREATHER, m_creature);
                SpawnMarksman();
                break;
            case 39:
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_ID_SUNTARA_STONES, m_creature);
                DoScriptText(SAY_DORIUS_ARRRRRGH, m_creature);
                m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
                DoScriptText(ACTION_DORIUS_POINTS, m_creature, m_creature);
                SpawnSingedLetter();
                break;
        }
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() == NPC_DARK_IRON_STEELSHIFTER)
            pSummoned->AI()->AttackStart(m_creature);

        if (pSummoned->GetEntry() == NPC_DARK_IRON_MARKSMAN) {
            pSummoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            pSummoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
            pSummoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
        }
    }

    void UpdateEscortAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_dorius_stonetender(Creature* pCreature)
{
    return new npc_dorius_stonetenderAI(pCreature);
}

bool QuestAccept_npc_dorius_stonetender(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ID_SUNTARA_STONES)
    {
        if (npc_dorius_stonetenderAI* pStonetenderAI = dynamic_cast<npc_dorius_stonetenderAI*>(pCreature->AI()))
        {
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

enum ObsidionData
{
    QUEST_RISE_OBSIDION     = 3566,

    SAY_DORIUS1             = 4393,
    SAY_DORIUS2             = 4394,
    SAY_DORIUS3             = 4395,
    SAY_DORIUS4             = 4396,
    SAY_DORIUS5             = 4397,
    SAY_DORIUS6             = 4398,
    EMOTE_DORIUS7           = 4399,
    SAY_LATHORIC1           = 4391,
    SAY_LATHORIC2           = 4392,

    NPC_DORIUS              = 8421,
    NPC_LATHORIC_THE_BLACK  = 8391,
    NPC_OBSIDION            = 8400,

    SPELL_GROUND_SMASH      = 12734,
    SPELL_KNOCK_AWAY        = 10101
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
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER | UNIT_FLAG_IMMUNE_TO_NPC);

        if (Creature* cr = m_creature->GetMap()->GetCreature(m_Dorius))
            cr->DeleteLater();
        m_Dorius.Clear();
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
        ScriptedAI::Aggro(pWho);
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
        if (creature->GetEntry() == NPC_LATHORIC_THE_BLACK && (!m_creature->IsAlive() || !m_creature->IsInCombat()))
            Reset();
    }

    void JustRespawned() override
    {
        Reset();
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_IsEventRunning)
            return;

        // talking, only if not in combat
        if (!m_creature->IsInCombat())
        {
            if (m_nextText == SAY_LATHORIC1)
            {
               if (Creature* dorius = m_creature->GetMap()->GetCreature(m_Dorius))
                    if (dorius->GetEntry() != NPC_LATHORIC_THE_BLACK)
                        dorius->UpdateEntry(NPC_LATHORIC_THE_BLACK);
            }

            if (m_nextText <= SAY_DORIUS6 && m_nextText >= SAY_LATHORIC1)
            {
                if (m_uiTalkTimer < uiDiff)
                {
                    if (Creature* dorius = m_creature->GetMap()->GetCreature(m_Dorius))
                        DoScriptText(m_nextText, dorius);
                    m_nextText++;
                    if (m_nextText > SAY_DORIUS6)
                        m_nextText = SAY_LATHORIC1;
                    if (m_nextText == SAY_DORIUS1)
                        m_nextText += 10; 
                    m_uiTalkTimer = 6000;
                }
                else
                    m_uiTalkTimer -= uiDiff;
            }

            if (m_nextText == SAY_LATHORIC2) // finished talking, start fighting
            {
                for (const auto& guid : m_playerList)
                {
                    if (Player* player = m_creature->GetMap()->GetPlayer(guid))
                    {
                        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);

                        AttackStart(player);
                        if (Creature* lathoric = m_creature->GetMap()->GetCreature(m_Dorius))
                        {
                            lathoric->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
                            lathoric->AI()->AttackStart(player);
                        }
                        break;
                    }
                }
            }
        }

        // fighting
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiGroundSmashTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_GROUND_SMASH) == CAST_OK)
                m_uiGroundSmashTimer = 8000;
        }
        else
            m_uiGroundSmashTimer -= uiDiff;

        if (m_uiKnockAwayTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_KNOCK_AWAY) == CAST_OK)
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

bool QuestAccept_npc_dying_archaeologist(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_RISE_OBSIDION)
    {
        if (Creature* Obsidion = GetClosestCreatureWithEntry(pCreature, NPC_OBSIDION, VISIBLE_RANGE))
        {
            if (npc_obsidionAI* pObsidionAI = dynamic_cast<npc_obsidionAI*>(Obsidion->AI()))
            {
                if (pObsidionAI->m_IsEventRunning || !Obsidion->IsAlive())
                    return false;
                pObsidionAI->StartEvent();
                pObsidionAI->m_playerList.push_back(pPlayer->GetObjectGuid());

                if (Group* pGroup = pPlayer->GetGroup())
                    for (GroupReference* pRef = pGroup->GetFirstMember(); pRef != nullptr; pRef = pRef->next())
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

void AddSC_searing_gorge()
{
    Script* newscript;

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
