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
SDName: Shadowfang_Keep
SD%Complete: 100
SDComment: npc_shadowfang_prisoner using escortAI for movement to door.
SDCategory: Shadowfang Keep
EndScriptData */

/* ContentData
npc_shadowfang_prisoner
npc_deathstalker_vincent
EndContentData */

#include "scriptPCH.h"
#include "shadowfang_keep.h"

/*######
## npc_shadowfang_prisoner
######*/

enum
{
    SAY_FREE_AS             = 1331,
    SAY_OPEN_DOOR_AS        = 1332,
    SAY_POST_DOOR_AS        = 1334,
    EMOTE_VANISH_AS         = 1343,
    SAY_FREE_AD             = 1320,
    SAY_OPEN_DOOR_AD        = 1321,
    SAY_POST1_DOOR_AD       = 1323,
    SAY_POST2_DOOR_AD       = 1324,
    EMOTE_UNLOCK_DOOR_AD    = 1322,

    SPELL_UNLOCK            = 6421,
    SPELL_FIRE              = 6422,
    NPC_ASH                 = 3850,
    NPC_ADA                 = 3849,

    GOSSIP_ITEM_DOOR        = 2802
};

struct npc_shadowfang_prisonerAI : public npc_escortAI
{
    npc_shadowfang_prisonerAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_uiNpcEntry = pCreature->GetEntry();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 m_uiNpcEntry;

    void WaypointReached(uint32 uiPoint)
    {
        switch (uiPoint)
        {
            case 0:
                if (m_uiNpcEntry == NPC_ASH)
                    DoScriptText(SAY_FREE_AS, m_creature);
                else
                    DoScriptText(SAY_FREE_AD, m_creature);
                break;
            case 10:
                if (m_uiNpcEntry == NPC_ASH)
                    DoScriptText(SAY_OPEN_DOOR_AS, m_creature);
                else
                    DoScriptText(SAY_OPEN_DOOR_AD, m_creature);
                break;
            case 11:
                if (m_uiNpcEntry == NPC_ASH)
                    DoCastSpellIfCan(m_creature, SPELL_UNLOCK);
                else
                {
                    DoScriptText(EMOTE_UNLOCK_DOOR_AD, m_creature);
                    m_creature->HandleEmoteCommand(EMOTE_STATE_USESTANDING);
                }
                break;
            case 12:
                 if (m_uiNpcEntry != NPC_ASH)
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_NONE);
                break;
            case 13:
                if (m_uiNpcEntry == NPC_ASH)
                    DoScriptText(SAY_POST_DOOR_AS, m_creature);
                else
                    DoScriptText(SAY_POST1_DOOR_AD, m_creature);

                if (m_pInstance)
                    m_pInstance->SetData(TYPE_FREE_NPC, DONE);
                break;
            case 14:
                if (m_uiNpcEntry == NPC_ASH)
                    DoCastSpellIfCan(m_creature, SPELL_FIRE);
                else
                {
                    DoScriptText(SAY_POST2_DOOR_AD, m_creature);
                    SetRun();
                }
                break;
            case 15:
                if (m_uiNpcEntry == NPC_ASH)
                    DoScriptText(EMOTE_VANISH_AS, m_creature);
                break;
        }
    }

    void Reset() {}

    //let's prevent Adamant from charging into Ashcrombe's cell
    //and beating the crap out of him and vice versa XD
    void AttackStart(Unit* pWho)
    {
        if (pWho)
        {
            if (pWho->GetEntry() == NPC_ASH || pWho->GetEntry() == NPC_ADA)
                return;
            else
                ScriptedAI::AttackStart(pWho);
        }
    }
};

CreatureAI* GetAI_npc_shadowfang_prisoner(Creature* pCreature)
{
    return new npc_shadowfang_prisonerAI(pCreature);
}

bool GossipHello_npc_shadowfang_prisoner(Player* pPlayer, Creature* pCreature)
{
    ScriptedInstance* pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());

    if (pInstance && pInstance->GetData(TYPE_FREE_NPC) != DONE && pInstance->GetData(TYPE_RETHILGORE) == DONE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_DOOR, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_shadowfang_prisoner(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();

        if (npc_shadowfang_prisonerAI* pEscortAI = dynamic_cast<npc_shadowfang_prisonerAI*>(pCreature->AI()))
            pEscortAI->Start();
    }
    return true;
}

/*######
## npc_deathstalker_vincent
######*/

enum
{
    SAY_VINCENT_DIE     = 1458,

    FACTION_FRIENDLY    = 35
};

struct npc_deathstalker_vincentAI : public ScriptedAI
{
    npc_deathstalker_vincentAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    void Reset()
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetData(TYPE_INTRO) == DONE && !m_creature->GetByteValue(UNIT_FIELD_BYTES_1, 0))
            m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (pDoneBy)
        {
            m_creature->SetInCombatWith(pDoneBy);
            pDoneBy->SetInCombatWith(m_creature);
        }

        if (m_creature->getStandState())
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);

        if (uiDamage >= m_creature->GetHealth())
        {
            m_creature->GetHealth() > 1 ? uiDamage = m_creature->GetHealth() - 1 : uiDamage = 0;
            m_creature->setFaction(FACTION_FRIENDLY);
            EnterEvadeMode();
            DoScriptText(SAY_VINCENT_DIE, m_creature);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_creature->isInCombat() && m_creature->getFaction() == FACTION_FRIENDLY)
            EnterEvadeMode();

        ScriptedAI::UpdateAI(uiDiff);
    }

    void EnterEvadeMode()
    {
        m_creature->RemoveAllAuras();
        m_creature->DeleteThreatList();
        m_creature->CombatStop(true);
        m_creature->LoadCreatureAddon();

        m_creature->SetLootRecipient(NULL);

        Reset();
    }
};

CreatureAI* GetAI_npc_deathstalker_vincent(Creature* pCreature)
{
    return new npc_deathstalker_vincentAI(pCreature);
}

void AddSC_shadowfang_keep()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_shadowfang_prisoner";
    newscript->pGossipHello =  &GossipHello_npc_shadowfang_prisoner;
    newscript->pGossipSelect = &GossipSelect_npc_shadowfang_prisoner;
    newscript->GetAI = &GetAI_npc_shadowfang_prisoner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_deathstalker_vincent";
    newscript->GetAI = &GetAI_npc_deathstalker_vincent;
    newscript->RegisterSelf();
}
