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
SDName: Feralas
SD%Complete: 100
SDComment: Quest support: 3520, 2767. Special vendor Gregan Brewspewer
SDCategory: Feralas
EndScriptData */

#include "scriptPCH.h"

/*######
## npc_gregan_brewspewer
######*/

bool GossipHello_npc_gregan_brewspewer(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pCreature->isVendor() && pPlayer->GetQuestStatus(3909) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Buy somethin', will ya?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(2433, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_gregan_brewspewer(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
        pPlayer->SEND_GOSSIP_MENU(2434, pCreature->GetGUID());
    }
    if (uiAction == GOSSIP_ACTION_TRADE)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
    return true;
}

/*######
## npc_oox22fe
######*/

enum
{
    SAY_OOX_START           = -1000287,
    SAY_OOX_AGGRO1          = -1000288,
    SAY_OOX_AGGRO2          = -1000289,
    SAY_OOX_AMBUSH          = -1000290,
    SAY_OOX_END             = -1000292,

    NPC_YETI                = 7848,
    NPC_GORILLA             = 5260,
    NPC_WOODPAW_REAVER      = 5255,
    NPC_WOODPAW_BRUTE       = 5253,
    NPC_WOODPAW_ALPHA       = 5258,
    NPC_WOODPAW_MYSTIC      = 5254,

    QUEST_RESCUE_OOX22FE    = 2767
};

struct npc_oox22feAI : public npc_escortAI
{
    npc_oox22feAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    void WaypointReached(uint32 i)
    {
        switch (i)
        {
            // First Ambush(3 Yetis)
            case 11:
                DoScriptText(SAY_OOX_AMBUSH, m_creature);
                m_creature->SummonCreature(NPC_YETI, -4841.01f, 1593.91f, 73.42f, 3.98f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                m_creature->SummonCreature(NPC_YETI, -4837.61f, 1568.58f, 78.21f, 3.13f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                m_creature->SummonCreature(NPC_YETI, -4841.89f, 1569.95f, 76.53f, 0.68f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                break;
            //Second Ambush(3 Gorillas)
            case 21:
                DoScriptText(SAY_OOX_AMBUSH, m_creature);
                m_creature->SummonCreature(NPC_GORILLA, -4595.81f, 2005.99f, 53.08f, 3.74f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                m_creature->SummonCreature(NPC_GORILLA, -4597.53f, 2008.31f, 52.70f, 3.78f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                m_creature->SummonCreature(NPC_GORILLA, -4599.37f, 2010.59f, 52.77f, 3.84f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                break;
            //Third Ambush(4 Gnolls)
            case 30:
                DoScriptText(SAY_OOX_AMBUSH, m_creature);
                m_creature->SummonCreature(NPC_WOODPAW_REAVER, -4425.14f, 2075.87f, 47.77f, 3.77f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                m_creature->SummonCreature(NPC_WOODPAW_BRUTE , -4426.68f, 2077.98f, 47.57f, 3.77f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                m_creature->SummonCreature(NPC_WOODPAW_MYSTIC, -4428.33f, 2080.24f, 47.43f, 3.87f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                m_creature->SummonCreature(NPC_WOODPAW_ALPHA , -4430.04f, 2075.54f, 46.83f, 3.81f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000);
                break;
            case 37:
                DoScriptText(SAY_OOX_END, m_creature);
                // Award quest credit
                if (Player* pPlayer = GetPlayerForEscort())
                    pPlayer->GroupEventHappens(QUEST_RESCUE_OOX22FE, m_creature);
                break;
        }
    }

    void Reset()
    {
        if (!HasEscortState(STATE_ESCORT_ESCORTING))
            m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
    }

    void Aggro(Unit* who)
    {
        //For an small probability the npc says something when he get aggro
        switch (urand(0, 9))
        {
            case 0:
                DoScriptText(SAY_OOX_AGGRO1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_OOX_AGGRO2, m_creature);
                break;
        }
    }

    void JustSummoned(Creature* summoned)
    {
        summoned->AI()->AttackStart(m_creature);
    }
};

CreatureAI* GetAI_npc_oox22fe(Creature* pCreature)
{
    return new npc_oox22feAI(pCreature);
}

bool QuestAccept_npc_oox22fe(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_RESCUE_OOX22FE)
    {
        DoScriptText(SAY_OOX_START, pCreature);
        //change that the npc is not lying dead on the ground
        pCreature->SetStandState(UNIT_STAND_STATE_STAND);

        if (pPlayer->GetTeam() == ALLIANCE)
            pCreature->setFaction(FACTION_ESCORT_A_PASSIVE);

        if (pPlayer->GetTeam() == HORDE)
            pCreature->setFaction(FACTION_ESCORT_H_PASSIVE);

        if (npc_oox22feAI* pEscortAI = dynamic_cast<npc_oox22feAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

/*######
## npc_screecher_spirit
######*/

bool GossipHello_npc_screecher_spirit(Player* pPlayer, Creature* pCreature)
{
    pPlayer->SEND_GOSSIP_MENU(2039, pCreature->GetGUID());
    pPlayer->TalkedToCreature(pCreature->GetEntry(), pCreature->GetGUID());
    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

    return true;
}
/*######
## npc_shay_leafrunner
######*/

enum
{
    SAY_ESCORT_START                    = -1001106,
    SAY_WANDER_1                        = -1001107,
    SAY_WANDER_2                        = -1001108,
    SAY_WANDER_3                        = -1001109,
    SAY_WANDER_4                        = -1001110,
    SAY_WANDER_DONE_1                   = -1001111,
    SAY_WANDER_DONE_2                   = -1001112,
    SAY_WANDER_DONE_3                   = -1001113,
    EMOTE_WANDER                        = -1001114,
    SAY_EVENT_COMPLETE_1                = -1001115,
    SAY_EVENT_COMPLETE_2                = -1001116,

    SPELL_SHAYS_BELL                    = 11402,
    NPC_ROCKBITER                       = 7765,
    QUEST_ID_WANDERING_SHAY             = 2845,
};

struct npc_shay_leafrunnerAI : public FollowerAI
{
    npc_shay_leafrunnerAI(Creature* pCreature) : FollowerAI(pCreature)
    {
        m_uiWanderTimer = 0;
        m_uiDespawnTimer = 0;
        Reset();
    }

    uint32 m_uiWanderTimer;
    uint32 m_uiDespawnTimer;
    bool m_bIsRecalled;
    bool m_bIsComplete;

    void Reset() override
    {
        m_bIsRecalled = false;
        m_bIsComplete = false;
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        FollowerAI::MoveInLineOfSight(pWho);

        if (!m_bIsComplete && pWho->GetEntry() == NPC_ROCKBITER && m_creature->IsWithinDistInMap(pWho, 20.0f))
        {
            Player* pPlayer = GetLeaderForFollower();
            if (!pPlayer)
                return;

            DoScriptText(SAY_EVENT_COMPLETE_1, m_creature);
            DoScriptText(SAY_EVENT_COMPLETE_2, pWho);

            // complete quest
            pPlayer->GroupEventHappens(QUEST_ID_WANDERING_SHAY, m_creature);
            SetFollowComplete(true);
            m_creature->ForcedDespawn(30000);
            m_bIsComplete = true;
            m_uiWanderTimer = 0;
            m_uiDespawnTimer = 0;

            // move to Rockbiter
            float fX, fY, fZ;
            pWho->GetContactPoint(m_creature, fX, fY, fZ, INTERACTION_DISTANCE);
            m_creature->GetMotionMaster()->MovePoint(0, fX, fY, fZ);
        }
        else if (m_bIsRecalled && pWho->GetTypeId() == TYPEID_PLAYER && pWho->IsWithinDistInMap(pWho, INTERACTION_DISTANCE))
        {
            if(HasFollowState(STATE_FOLLOW_INPROGRESS) || HasFollowState(STATE_FOLLOW_PAUSED))
                m_uiWanderTimer = 60000;

            m_bIsRecalled = false;

            switch (urand(0, 2))
            {
                case 0:
                    DoScriptText(SAY_WANDER_DONE_1, m_creature);
                    break;
                case 1:
                    DoScriptText(SAY_WANDER_DONE_2, m_creature);
                    break;
                case 2:
                    DoScriptText(SAY_WANDER_DONE_3, m_creature);
                    break;
            }
        }
    }
    void JustDied(Unit* killer)
    {
        m_uiWanderTimer = 0;
        m_uiDespawnTimer = 0;
        FollowerAI::JustDied(killer);
    }

    void BeforeStartFollow(Player* pPlayer, uint32 uiFactionForFollower, const Quest* pQuest)
    {
        StartFollow(pPlayer, uiFactionForFollower, pQuest, 5);
        m_uiWanderTimer = 30000;
        m_uiDespawnTimer = 910000;
    }

    void ResumeFollowing()
    {
        m_bIsRecalled = true;
        m_creature->SetWalk(false);
        SetFollowPaused(false);
    }

    void UpdateFollowerAI(const uint32 uiDiff)
    {
        if (m_uiDespawnTimer)
        {
            if (m_uiDespawnTimer <= uiDiff)
            {
                m_creature->DisappearAndDie();
                m_uiWanderTimer = 0;
                m_uiDespawnTimer = 0;
            }
            else
                m_uiDespawnTimer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (m_uiWanderTimer)
            {
                if (m_uiWanderTimer <= uiDiff)
                {
                    // set follow paused and wander in a random point
                    SetFollowPaused(true);
                    DoScriptText(EMOTE_WANDER, m_creature);
                    m_uiWanderTimer = 0;

                    switch (urand(0, 3))
                    {
                        case 0:
                            DoScriptText(SAY_WANDER_1, m_creature);
                            break;
                        case 1:
                            DoScriptText(SAY_WANDER_2, m_creature);
                            break;
                        case 2:
                            DoScriptText(SAY_WANDER_3, m_creature);
                            break;
                        case 3:
                            DoScriptText(SAY_WANDER_4, m_creature);
                            break;
                    }

                    float fX, fY, fZ;
                    m_creature->SetWalk(true);
                    m_creature->GetNearPoint(m_creature, fX, fY, fZ, 0, frand(25.0f, 40.0f), frand(0, 2 * M_PI_F));
                    m_creature->GetMotionMaster()->MovePoint(1, fX, fY, fZ, MOVE_PATHFINDING);
                }
                else
                    m_uiWanderTimer -= uiDiff;
            }

            return;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_shay_leafrunner(Creature* pCreature)
{
    return new npc_shay_leafrunnerAI(pCreature);
}

bool QuestAccept_npc_shay_leafrunner(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ID_WANDERING_SHAY)
    {
        DoScriptText(SAY_ESCORT_START, pCreature);
        if (npc_shay_leafrunnerAI* leafrunnerAI = dynamic_cast<npc_shay_leafrunnerAI*>(pCreature->AI()))
            leafrunnerAI->BeforeStartFollow(pPlayer, pPlayer->getFaction(), pQuest);
    }
    return true;
}

bool EffectDummyCreature_npc_shay_leafrunner(Unit* pCaster, uint32 uiSpellId, SpellEffectIndex uiEffIndex, Creature* pCreatureTarget)/*, ObjectGuid*/ /*originalCasterGuid*//*)*/
{
    if (uiSpellId == SPELL_SHAYS_BELL && uiEffIndex == EFFECT_INDEX_0)
    {
        if (pCaster->GetTypeId() != TYPEID_PLAYER)
            return true;

        if (npc_shay_leafrunnerAI* leafrunnerAI = dynamic_cast<npc_shay_leafrunnerAI*>(pCreatureTarget->AI()))
            leafrunnerAI->ResumeFollowing();

        return true;
    }

    return false;
}

enum
{
    SPELL_SPORE_CLOUD    =   22948,
    SPELL_ROOTS          =   12747,
    SPELL_THORN_VOLLEY   =   21748,
    SPELL_ENRAGE         =   8599,
    SPELL_INVOCATION     =   26446,
};

/******************/
struct MushgogAI : public ScriptedAI
{
    MushgogAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSporeCloud_Timer;
    uint32 m_uiRoots_Timer;
    uint32 m_uiThornVolley_Timer;
    uint32 m_uiInvocation_Timer;
    bool m_bEnrage;
    bool m_bAggro;

    void Reset()
    {
    	m_uiInvocation_Timer  = 1000;
        m_uiSporeCloud_Timer  = 6000;
        m_uiRoots_Timer       = 2000;
        m_uiThornVolley_Timer = 3500;
        m_bEnrage             = false;
        m_bAggro              = false;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
        if (!m_bAggro)
        {
            std::list<Creature*> m_AggroList;
            GetCreatureListWithEntryInGrid(m_AggroList, m_creature, 14395, 1800.0f);
            for (std::list<Creature*>::iterator it = m_AggroList.begin(); it != m_AggroList.end(); ++it)
            {
                if ((*it)->isAlive())
                     (*it)->MonsterYell("Leaf him alone Mushgog!");
            }
            m_bAggro = true;
        }
    }

    void JustDied(Unit* pKiller)
    {
    	uint32 chanceToSpawn = urand(0,5);
    	if (chanceToSpawn==0)
    	{
    		GameObject *pBlackLotus = m_creature->SummonGameObject(176589,
                                m_creature->GetPositionX(),
                                m_creature->GetPositionY()-5.0f,
                                m_creature->GetPositionZ()-0.5f,
                                0, 0, 0, 0, 0, -1, false);
    		pBlackLotus->SetSpawnedByDefault(false);
    		pBlackLotus->SetRespawnTime(9999999);
    	}
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiSporeCloud_Timer < uiDiff)
        {
            Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
            if (DoCastSpellIfCan(pTarget, SPELL_SPORE_CLOUD) == CAST_OK)
            	m_uiSporeCloud_Timer = urand(7500, 12000);
        }
        else
            m_uiSporeCloud_Timer -= uiDiff;

        if (m_uiRoots_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ROOTS) == CAST_OK)
            	m_uiRoots_Timer = urand(8000, 12000);
        }
        else
        	m_uiRoots_Timer -= uiDiff;

        if (m_uiThornVolley_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_THORN_VOLLEY) == CAST_OK)
            	m_uiThornVolley_Timer = urand(5000, 9000);
        }
        else
        	m_uiThornVolley_Timer -= uiDiff;

        if (m_creature->GetHealthPercent() < 20.0f && !m_bEnrage)
        {
            m_creature->CastSpell(m_creature, SPELL_ENRAGE, false);
            m_bEnrage = true;
        }

        /** Invoque player in front of him */
        if (m_uiInvocation_Timer < uiDiff)
        {
            if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                float x = m_creature->GetPositionX();
                float y = m_creature->GetPositionY();
                float z = m_creature->GetPositionZ() + 5;
                float orientation = pUnit->GetOrientation();

                if ( pUnit->GetPositionZ() > 142.0f)
                {
                	m_creature->SendSpellGo(pUnit, 25681);
                	pUnit->NearTeleportTo(x, y, z, orientation);
                	m_uiInvocation_Timer = urand(5000, 10000);
                }
            }
        }
        else
            m_uiInvocation_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

enum
{
    SPELL_POISON_BOLT     =   22937,
    SPELL_CHAIN_LIGHTNING =   16033,
};

struct TheRazzaAI : public ScriptedAI
{
    TheRazzaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiPoisonBolt_Timer;
    uint32 m_uiChainLightning_Timer;
    uint32 m_uiInvocation_Timer;
    bool m_bAggro;

    void Reset()
    {
    	m_uiInvocation_Timer     = 1000;
        m_uiPoisonBolt_Timer     = 5000;
        m_uiChainLightning_Timer = 9000;
        m_bAggro                 = false;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
        if (!m_bAggro)
        {
            std::list<Creature*> m_AggroList;
            GetCreatureListWithEntryInGrid(m_AggroList, m_creature, 14395, 1800.0f);
            for (std::list<Creature*>::iterator it = m_AggroList.begin(); it != m_AggroList.end(); ++it)
            {
                if ((*it)->isAlive())
                     (*it)->MonsterYell("Woohoo! They are into it now!");
            }
            m_bAggro = true;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiPoisonBolt_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_POISON_BOLT) == CAST_OK)
            	m_uiPoisonBolt_Timer = 6000;
        }
        else
        	m_uiPoisonBolt_Timer -= uiDiff;

        if (m_uiChainLightning_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CHAIN_LIGHTNING) == CAST_OK)
            	m_uiChainLightning_Timer = urand(4000, 7000);
        }
        else
        	m_uiChainLightning_Timer -= uiDiff;

        /** Invoque player in front of him */
        if (m_uiInvocation_Timer < uiDiff)
        {
            if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                float x = m_creature->GetPositionX();
                float y = m_creature->GetPositionY();
                float z = m_creature->GetPositionZ() + 5;
                float orientation = pUnit->GetOrientation();

                if ( pUnit->GetPositionZ() > 142.0f)
                {
                        m_creature->SendSpellGo(pUnit, 25681);
                        pUnit->NearTeleportTo(x, y, z, orientation);
                        m_uiInvocation_Timer = urand(5000, 10000);
                }
            }
        }
        else
            m_uiInvocation_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

enum
{
    SPELL_CLEAVE        =   15496,
    SPELL_MORTAL_STRIKE =   15708,
    SPELL_KNOCKDOWN     =   16033,
};

/******************/
struct SkarrTheUnbreakableAI : public ScriptedAI
{
	SkarrTheUnbreakableAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiCleave_Timer;
    uint32 m_uiMortalStrike_Timer;
    uint32 m_uiKnockdown_Timer;
    uint32 m_uiInvocation_Timer;
    bool m_bAggro;

    void Reset()
    {
    	m_uiInvocation_Timer    = 1000;
        m_uiCleave_Timer        = urand(7000,10000);
        m_uiMortalStrike_Timer  = urand(8000,12000);
        m_uiKnockdown_Timer     = urand(5000, 7000);
        m_bAggro                = false;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
        if (!m_bAggro)
        {
            std::list<Creature*> m_AggroList;
            GetCreatureListWithEntryInGrid(m_AggroList, m_creature, 14395, 1800.0f);
            for (std::list<Creature*>::iterator it = m_AggroList.begin(); it != m_AggroList.end(); ++it)
            {
                if ((*it)->isAlive())
                     (*it)->MonsterYell("Looks like Skarr has found his next challenger! Wouldn't want to be in that poor fool's shoes!");
            }
            m_bAggro = true;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiCleave_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
            	m_uiCleave_Timer = urand(7000,10000);
        }
        else
        	m_uiCleave_Timer -= uiDiff;

        if (m_uiMortalStrike_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORTAL_STRIKE) == CAST_OK)
            	m_uiMortalStrike_Timer = urand(9000, 15000);
        }
        else
        	m_uiMortalStrike_Timer -= uiDiff;

        if (m_uiKnockdown_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_KNOCKDOWN) == CAST_OK)
            	m_uiKnockdown_Timer = urand(10000, 13000);
        }
        else
        	m_uiKnockdown_Timer -= uiDiff;

        /** Invoque player in front of him */
        if (m_uiInvocation_Timer < uiDiff)
        {
            if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                float x = m_creature->GetPositionX();
                float y = m_creature->GetPositionY();
                float z = m_creature->GetPositionZ() + 5;
                float orientation = pUnit->GetOrientation();

                if ( pUnit->GetPositionZ() > 142.0f)
                {
                        m_creature->SendSpellGo(pUnit, 25681);
                        pUnit->NearTeleportTo(x, y, z, orientation);
                        m_uiInvocation_Timer = urand(5000, 10000);
                }
            }
        }
        else
            m_uiInvocation_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SkarrTheUnbreakable(Creature* pCreature)
{
    return new SkarrTheUnbreakableAI(pCreature);
}

CreatureAI* GetAI_TheRazza(Creature* pCreature)
{
    return new TheRazzaAI(pCreature);
}

CreatureAI* GetAI_Mushgog(Creature* pCreature)
{
    return new MushgogAI(pCreature);
}

/*######
## npc_kindal_moonweaver
######*/

enum
{
    NPC_CAPTURED_SPRITE_DARTER      = 7997,

    GO_CAGE_DOOR                    = 143979,

    QUEST_FREEDOM_FOR_ALL_CREATURES = 2969,

    REQUEST_SAVED_SPRITE_DARTER     = 6,

    SPELL_MANA_BURN                 = 11981,
    SPELL_SHOOT                     = 6660,
    SPELL_MULTI_SHOT                = 14443
};

struct sMovementInformation
{
    uint8 uiSPoint, uiEPoint;
};

static const sMovementInformation asMovementInfo[11] =
{
    { 2, 3 },
    { 2, 4 },
    { 2, 5 },
    { 0, 6 },
    { 0, 7 },
    { 0, 8 },
    { 1, 6 },
    { 1, 7 },
    { 1, 8 },
    { 1, 9 },
    { 1, 10 }
};

static const float m_fMovePoints[11][3] =
{
    { -4531.78f, 807.50f, 59.92f },
    { -4513.14f, 765.45f, 60.72f },
    { -4529.44f, 825.49f, 60.51f },
    { -4563.52f, 877.13f, 61.07f },
    { -4578.42f, 891.02f, 65.79f },
    { -4592.71f, 890.61f, 69.11f },
    { -4582.46f, 751.20f, 49.65f },
    { -4572.83f, 741.11f, 45.69f },
    { -4557.85f, 730.01f, 45.57f },
    { -4529.02f, 706.96f, 60.70f },
    { -4515.88f, 696.60f, 64.38f }
};

struct npc_kindal_moonweaverAI : public FollowerAI
{
    npc_kindal_moonweaverAI(Creature * pCreature) : FollowerAI(pCreature)
    {
        m_creature->SetSheath(SHEATH_STATE_UNARMED);
        npc_kindal_moonweaverAI::Reset();
    }

    uint8 m_uiSavedSpriteDarter;
    uint8 m_uiDiedSpriteDarter;
    uint32 m_uiShootTimer;
    uint32 m_uiMultiShotTimer;

    bool m_eventStarted;

    void Reset() override
    {
        if (!HasFollowState(STATE_FOLLOW_INPROGRESS))
            m_eventStarted = false;

        m_uiShootTimer = urand(5, 30);
        m_uiMultiShotTimer = urand(5, 30);
    }

    void JustDied(Unit* pWho) override
    {
        FollowerAI::JustDied(pWho);

        m_creature->SetRespawnTime(10);
    }

    void UpdateFollowerAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
            
        // EventAI also contained info so that Kindal flees at 15% hp; not sure if it's really needed for escort
        // TO DO - perhaps requires EventAI-like combat movement too (testing)
        
        // ranged
        if (m_creature->IsInRange(m_creature->getVictim(), 25.001f, 54.0f))
        {
            m_creature->SetSheath(SHEATH_STATE_RANGED);

            if (m_uiMultiShotTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MULTI_SHOT) == CAST_OK)
                    m_uiMultiShotTimer = urand(8000, 11000);
            }
            else
                m_uiMultiShotTimer -= uiDiff;

            if (m_uiShootTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHOOT) == CAST_OK)
                    m_uiShootTimer = urand(2300, 3900);
            }
            else
                m_uiShootTimer -= uiDiff;
        }

        // melee
        if (m_creature->IsInRange(m_creature->getVictim(), 0.0f, 25.0f))
        {
            m_creature->SetSheath(SHEATH_STATE_MELEE);

            DoMeleeAttackIfReady();
        }
    }

    void BeginEvent();
    void SpriteSaved();
    void SpriteDied();
    void EndEvent();
};

struct npc_captured_sprite_darterAI : public ScriptedAI
{
    npc_captured_sprite_darterAI(Creature * pCreature) : ScriptedAI(pCreature)
    {
        m_creature->SetActiveObjectState(true);
        npc_captured_sprite_darterAI::Reset();
    }

    bool m_bRun;
    bool m_bEventStart;
    uint8 m_uiRunPath;
    uint8 m_uiMovePoint;
    uint32 m_uiRunStart_Timer;
    uint32 m_uiManaBurnTimer;
    uint64 m_uiKindalGUID;
    uint64 m_uiGateGUID;

    void Reset() override
    {
        m_bRun = false;
        m_bEventStart = false;
        m_uiKindalGUID = 0;
        m_uiGateGUID = 0;
        m_uiMovePoint = 0;
        m_uiRunPath = urand(0, 10);
        m_uiRunStart_Timer = urand(0, 3000);
        m_uiManaBurnTimer = urand(3000, 6000);
    }

    void EnterEvadeMode() override
    {
        m_creature->RemoveAllAuras();
        m_creature->DeleteThreatList();
        m_creature->CombatStop(true);

        if (m_uiMovePoint)
            --m_uiMovePoint;

        if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
            m_creature->GetMotionMaster()->Clear();
    }

    void JustDied(Unit* /*pWho*/) override
    {
        if (m_creature->isDead())
        {
            if (Creature * pKindal = m_creature->GetMap()->GetCreature(m_uiKindalGUID))
            {
                if (auto pKindalAI = static_cast<npc_kindal_moonweaverAI*>(pKindal->AI()))
                    pKindalAI->SpriteDied();
            }
        }

        m_creature->ForcedDespawn(10 * IN_MILLISECONDS);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (!m_uiKindalGUID || !m_uiGateGUID)
                return;

            if (m_bEventStart && !m_bRun && m_uiGateGUID)
            {
                if (GameObject* pGoGate = m_creature->GetMap()->GetGameObject(m_uiGateGUID))
                {
                    if (pGoGate->GetGoState() == GO_STATE_ACTIVE)
                    {
                        if (m_uiRunStart_Timer < uiDiff)
                        {
                            m_creature->SetFactionTemporary(FACTION_ESCORT_N_FRIEND_PASSIVE, TEMPFACTION_RESTORE_RESPAWN);
                            m_bRun = true;
                        }
                        else
                            m_uiRunStart_Timer -= uiDiff;
                    }
                }
            }

            if (m_bRun)
            {
                if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() != POINT_MOTION_TYPE)
                {
                    switch (m_uiMovePoint)
                    {
                    case 0:
                        m_creature->GetMotionMaster()->Clear();
                        m_creature->GetMotionMaster()->MovePoint(0,
                            m_fMovePoints[asMovementInfo[m_uiRunPath].uiSPoint][0],
                            m_fMovePoints[asMovementInfo[m_uiRunPath].uiSPoint][1],
                            m_fMovePoints[asMovementInfo[m_uiRunPath].uiSPoint][2], MOVE_PATHFINDING);
                        ++m_uiMovePoint;
                        break;
                    case 1:
                        m_creature->GetMotionMaster()->Clear();
                        m_creature->GetMotionMaster()->MovePoint(1,
                            m_fMovePoints[asMovementInfo[m_uiRunPath].uiEPoint][0],
                            m_fMovePoints[asMovementInfo[m_uiRunPath].uiEPoint][1],
                            m_fMovePoints[asMovementInfo[m_uiRunPath].uiEPoint][2], MOVE_PATHFINDING);
                        ++m_uiMovePoint;
                        break;
                    case 2:
                        if (Creature* pKindal = m_creature->GetMap()->GetCreature(m_uiKindalGUID))
                        {
                            if (auto pKindalAI = static_cast<npc_kindal_moonweaverAI*>(pKindal->AI()))
                                pKindalAI->SpriteSaved();
                            m_creature->ForcedDespawn();
                        }
                        break;
                    }
                }
            }

            return;
        }

        if (m_creature->getVictim()->getPowerType() == POWER_MANA)
        {
            if (m_uiManaBurnTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MANA_BURN) == CAST_OK)
                    m_uiManaBurnTimer = urand(7000, 10000);
            }
            else
                m_uiManaBurnTimer -= uiDiff;            
        }

        DoMeleeAttackIfReady();
    }
};

void npc_kindal_moonweaverAI::BeginEvent()
{
    auto pGoGate = GetClosestGameObjectWithEntry(m_creature, GO_CAGE_DOOR, 100.0f);

    if (!pGoGate)
        return;

    m_uiSavedSpriteDarter = 0;
    m_uiDiedSpriteDarter = 0;
    m_eventStarted = true;

    pGoGate->SetGoState(GO_STATE_READY);

    std::list<Creature*> m_lSprites;
    GetCreatureListWithEntryInGrid(m_lSprites, pGoGate, NPC_CAPTURED_SPRITE_DARTER, 40.0f);

    if (!m_lSprites.empty())
    {
        for (auto iter = m_lSprites.begin(); iter != m_lSprites.end(); ++iter)
        {
            if (*iter)
                if (auto pSpriteAI = dynamic_cast<npc_captured_sprite_darterAI*>((*iter)->AI()))
                {
                    pSpriteAI->Reset();
                    pSpriteAI->m_uiKindalGUID = m_creature->GetObjectGuid();
                    pSpriteAI->m_uiGateGUID = pGoGate->GetObjectGuid();
                    pSpriteAI->m_bEventStart = true;
                }
        }
    }
}

void npc_kindal_moonweaverAI::SpriteSaved()
{
    ++m_uiSavedSpriteDarter;

    if (m_uiSavedSpriteDarter >= REQUEST_SAVED_SPRITE_DARTER)
    {
        if (Player* pPlayer = GetLeaderForFollower())
        {
            if (pPlayer->GetQuestStatus(QUEST_FREEDOM_FOR_ALL_CREATURES) == QUEST_STATUS_INCOMPLETE)
                pPlayer->GroupEventHappens(QUEST_FREEDOM_FOR_ALL_CREATURES, m_creature);
        }

        SetFollowComplete(true);
        EndEvent();
    }
}

void npc_kindal_moonweaverAI::SpriteDied()
{
    if (!m_eventStarted) return;

    ++m_uiDiedSpriteDarter;

    if (m_uiDiedSpriteDarter > 5)
    {
        if (Player* pPlayer = GetLeaderForFollower())
        {
            if (pPlayer->GetQuestStatus(QUEST_FREEDOM_FOR_ALL_CREATURES) == QUEST_STATUS_INCOMPLETE)
                pPlayer->FailQuest(QUEST_FREEDOM_FOR_ALL_CREATURES);
        }

        SetFollowComplete(false);
    }
}

void npc_kindal_moonweaverAI::EndEvent()
{
    if (HasFollowState(STATE_FOLLOW_POSTEVENT))
    {
        SetFollowComplete();
        m_creature->SetRespawnTime(10);
    }
}

CreatureAI * GetAI_npc_captured_sprite_darter(Creature * pCreature)
{
    return new npc_captured_sprite_darterAI(pCreature);
}

CreatureAI* GetAI_npc_kindal_moonweaver(Creature* pCreature)
{
    return new npc_kindal_moonweaverAI(pCreature);
}

bool QuestAccept_npc_kindal_moonweaver(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_FREEDOM_FOR_ALL_CREATURES)
    {
        if (auto pKindalAI = dynamic_cast<npc_kindal_moonweaverAI*>(pCreature->AI()))
        {
            pKindalAI->StartFollow(pPlayer, FACTION_ESCORT_N_FRIEND_PASSIVE, pQuest);
            pCreature->SetStandState(UNIT_STAND_STATE_STAND);
            pKindalAI->BeginEvent();
        }
    }

    return true;
}

/*######
## AddSC
######*/

void AddSC_feralas()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_mushgog";
    newscript->GetAI = &GetAI_Mushgog;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_skarrtheunbreakable";
    newscript->GetAI = &GetAI_SkarrTheUnbreakable;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_therazza";
    newscript->GetAI = &GetAI_TheRazza;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_gregan_brewspewer";
    newscript->pGossipHello = &GossipHello_npc_gregan_brewspewer;
    newscript->pGossipSelect = &GossipSelect_npc_gregan_brewspewer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_oox22fe";
    newscript->GetAI = &GetAI_npc_oox22fe;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_oox22fe;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_screecher_spirit";
    newscript->pGossipHello = &GossipHello_npc_screecher_spirit;
    newscript->RegisterSelf();

    //SD2 Wandering Shay
    newscript = new Script;
    newscript->Name = "npc_shay_leafrunner";
    newscript->GetAI = &GetAI_npc_shay_leafrunner;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_shay_leafrunner;
    newscript->pEffectDummyCreature = &EffectDummyCreature_npc_shay_leafrunner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_kindal_moonweaver";
    newscript->GetAI = &GetAI_npc_kindal_moonweaver;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_kindal_moonweaver;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_captured_sprite_darter";
    newscript->GetAI = &GetAI_npc_captured_sprite_darter;
    newscript->RegisterSelf();
}
