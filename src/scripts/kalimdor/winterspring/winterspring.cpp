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
SDName: Winterspring
SD%Complete: 90
SDComment: Quest support: Obtain Cache of Mau'ari
SDCategory: Winterspring
EndScriptData */

/* ContentData
npc_rivern_frostwind
npc_witch_doctor_mauari
EndContentData */

#include "scriptPCH.h"

/*######
## npc_artorius_the_amiable
######*/

/*######
## npc_artorius_the_doombringer
######*/

enum
{
    SPELL_FOOLS_PLIGHT              = 23504,
        
    SPELL_DEMONIC_FRENZY            = 23257,
    SPELL_DEMONIC_DOOM              = 23298,
    SPELL_STINGING_TRAUMA           = 23299,
    
    EMOTE_POISON                    = -1000651,

    NPC_ARTORIUS_THE_AMIABLE        = 14531,
    NPC_ARTORIUS_THE_DOOMBRINGER    = 14535,
    NPC_THE_CLEANER                 = 14503,
    
    QUEST_STAVE_OF_THE_ANCIENTS     = 7636
};

struct npc_artoriusAI : public ScriptedAI
{
    npc_artoriusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_bTransform      = false;
        m_uiDespawn_Timer = 0;
        Reset();
    }

    uint32 m_uiTransform_Timer;
    uint32 m_uiTransformEmote_Timer;
    bool m_bTransform;

    ObjectGuid m_hunterGuid;
    uint32 m_uiDemonic_Doom_Timer;
    uint32 m_uiDemonic_Frenzy_Timer;
    uint32 m_uiDespawn_Timer;

    void Reset() override 
    {
        switch (m_creature->GetEntry())
        {
            case NPC_ARTORIUS_THE_AMIABLE:
                m_creature->SetRespawnDelay(35*MINUTE);
                m_creature->SetRespawnTime(35*MINUTE);
                m_creature->SetHomePosition(7909.71f, -4598.67f, 710.008f, 0.606013f);
                m_creature->NearTeleportTo(7909.71f, -4598.67f, 710.008f, 0.606013f);
                if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() != WAYPOINT_MOTION_TYPE) 
                { 
                    m_creature->SetDefaultMovementType(WAYPOINT_MOTION_TYPE); 
                    m_creature->GetMotionMaster()->Initialize(); 
                }
            
                m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

                m_uiTransform_Timer      = 10000;
                m_uiTransformEmote_Timer = 5000;
                m_bTransform             = false;
                m_uiDespawn_Timer        = 0;
                break;
            case NPC_ARTORIUS_THE_DOOMBRINGER:
                 if (!m_uiDespawn_Timer)
                    m_uiDespawn_Timer = 20*MINUTE*IN_MILLISECONDS;

                m_hunterGuid.Clear();
                m_uiDemonic_Doom_Timer   = 7500;
                m_uiDemonic_Frenzy_Timer = urand(5000, 8000);
                break;
        }
    }

    /** Artorius the Amiable */
    void Transform()
    {
        m_creature->UpdateEntry(NPC_ARTORIUS_THE_DOOMBRINGER);
        m_creature->SetHomePosition(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation());
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);
        m_creature->GetMotionMaster()->Initialize();
        Reset();
    }
    
    void BeginEvent(ObjectGuid playerGuid)
    {
        m_hunterGuid = playerGuid;
        m_creature->GetMotionMaster()->Clear(false);
        m_creature->GetMotionMaster()->MoveIdle();
        m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);
        m_bTransform = true;        
    }

    /** Artorius the Doombringer */
    void Aggro(Unit* pWho) override 
    {
        if (pWho->GetClass() == CLASS_HUNTER && (m_hunterGuid.IsEmpty() || m_hunterGuid == pWho->GetObjectGuid())/*&& pWho->GetQuestStatus(QUEST_STAVE_OF_THE_ANCIENTS) == QUEST_STATUS_INCOMPLETE*/)
        {
            m_hunterGuid = pWho->GetObjectGuid();
        }
        else
            DemonDespawn();
    }    
    
    void JustDied(Unit* /*pKiller*/) override
    {
        m_creature->SetHomePosition(7909.71f, -4598.67f, 710.008f, 0.606013f);

        // DRSS
        uint32 m_respawn_delay_Timer = 3*HOUR;
        if (sWorld.GetActiveSessionCount() > BLIZZLIKE_REALM_POPULATION)
            m_respawn_delay_Timer *= float(BLIZZLIKE_REALM_POPULATION) / float(sWorld.GetActiveSessionCount());

        m_creature->SetRespawnDelay(m_respawn_delay_Timer);
        m_creature->SetRespawnTime(m_respawn_delay_Timer);
        m_creature->SaveRespawnTime();
    }
    
    void DemonDespawn(bool triggered = true)
    {
        m_creature->SetHomePosition(7909.71f, -4598.67f, 710.008f, 0.606013f);
        m_creature->SetRespawnDelay(15*MINUTE);
        m_creature->SetRespawnTime(15*MINUTE);
        m_creature->SaveRespawnTime();
        
        if (triggered)
        {
            Creature* pCleaner = m_creature->SummonCreature(NPC_THE_CLEANER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetAngle(m_creature), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 20*MINUTE*IN_MILLISECONDS);
            if (pCleaner)
            {
                ThreatList const& tList = m_creature->GetThreatManager().getThreatList();
                
                for (const auto itr : tList)
                {
                    if (Unit* pUnit = m_creature->GetMap()->GetUnit(itr->getUnitGuid()))
                    {
                        if (pUnit->IsAlive())
                        {
                            pCleaner->SetInCombatWith(pUnit);
                            pCleaner->AddThreat(pUnit);
                            pCleaner->AI()->AttackStart(pUnit);
                        }
                    }
                }
            }
        }
        
        m_creature->ForcedDespawn();
    }
    
    void SpellHit(SpellCaster*, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == 13555 || pSpell->Id == 25295)             // Serpent Sting (Rank 8 or Rank 9)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_STINGING_TRAUMA, CF_TRIGGERED) == CAST_OK)
                DoScriptText(EMOTE_POISON, m_creature);
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        /** Artorius the Amiable */
        if (m_bTransform)
        {
            if (m_uiTransformEmote_Timer)
            {
                if (m_uiTransformEmote_Timer <= uiDiff)
                {
                    m_creature->HandleEmote(EMOTE_ONESHOT_ROAR);
                    m_uiTransformEmote_Timer = 0;
                }
                else
                    m_uiTransformEmote_Timer -= uiDiff;
            }

            if (m_uiTransform_Timer < uiDiff)
            {
                m_bTransform = false;
                Transform();
            }
            else
                m_uiTransform_Timer -= uiDiff;
        }

        /** Artorius the Doombringer */
        if (m_uiDespawn_Timer)
        {
            if (m_uiDespawn_Timer <= uiDiff)
            {
                if (m_creature->IsAlive() && !m_creature->IsInCombat())
                    DemonDespawn(false);
            }
            else
                m_uiDespawn_Timer -= uiDiff;
        }
    
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_creature->GetThreatManager().getThreatList().size() > 1 /*|| pHunter->IsDead()*/)
            DemonDespawn();

        if (m_uiDemonic_Frenzy_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_DEMONIC_FRENZY) == CAST_OK)
                m_uiDemonic_Frenzy_Timer = urand(15000, 20000);
        }
        else
            m_uiDemonic_Frenzy_Timer -= uiDiff;    

        if (m_uiDemonic_Doom_Timer < uiDiff)
        {
            m_uiDemonic_Doom_Timer = 7500;
            // only attempt to cast this once every 7.5 seconds to give the hunter some leeway
            // LOWER max range for lag...
            if (m_creature->IsWithinDistInMap(m_creature->GetVictim(), 25))
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_DEMONIC_DOOM);
        }
        else
            m_uiDemonic_Doom_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }

    void OnScriptEventHappened(uint32 uiEvent, uint32 uiData, WorldObject* pInvoker) override
    {
        if (pInvoker && pInvoker->IsPlayer())
            BeginEvent(pInvoker->GetObjectGuid());
    }
};

CreatureAI* GetAI_npc_artorius(Creature* pCreature)
{
    return new npc_artoriusAI(pCreature);
}

/*######
## npc_umi_yeti
######*/

enum
{
    SPELL_UNSUMMON_YETI         = 17163
};

struct npc_umi_yetiAI : public ScriptedAI
{
    npc_umi_yetiAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
    }

    void MoveInLineOfSight(Unit *) override
    {
    }

    void SpellHit(SpellCaster*, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_UNSUMMON_YETI)
        {
            m_creature->GetMotionMaster()->MoveIdle();
            m_creature->ForcedDespawn(1000);
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
    }
};

CreatureAI* GetAI_npc_umi_yeti(Creature* pCreature)
{
    return new npc_umi_yetiAI(pCreature);
}

void AddSC_winterspring()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_artorius";
    newscript->GetAI = &GetAI_npc_artorius;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_umi_yeti";
    newscript->GetAI = &GetAI_npc_umi_yeti;
    newscript->RegisterSelf();
}
