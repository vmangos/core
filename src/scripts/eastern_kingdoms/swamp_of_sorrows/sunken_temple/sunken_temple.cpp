/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
 *
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
SDName: Sunken_Temple
SD%Complete: 100
SDComment: Quest support: 8733
SDCategory: Sunken Temple
EndScriptData */

/* ContentData
at_shade_of_eranikus
npc_malfurion_stormrage
event_antalarion_statue_activation
EndContentData */

#include "scriptPCH.h"
#include "sunken_temple.h"

enum
{
    QUEST_THE_CHARGE_OF_DRAGONFLIGHTS = 8555,
    QUEST_ERANIKUS_TYRANT_OF_DREAMS   = 8733
};

/*######
## npc_malfurion_stormrage
######*/

enum
{
    EMOTE_MALFURION1              = -1109000,
    SAY_MALFURION1                = -1109001,
    SAY_MALFURION2                = -1109002,
    SAY_MALFURION3                = -1109003,
    SAY_MALFURION4                = -1109004,

    MAX_MALFURION_TEMPLE_SPEECHES = 7
};

struct npc_malfurionAI : public ScriptedAI
{
    npc_malfurionAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiSpeech   = 0;
        m_uiSayTimer = 3000;
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);

        // Prevents interference with Waking Legends
        m_inDungeon = m_creature->GetMap()->IsDungeon();

        if (m_inDungeon)
        {
            // If in temple, spawn invisible, emote "Walls Tremble"
            m_creature->SetVisibility(VISIBILITY_OFF);
            DoScriptText(EMOTE_MALFURION1, m_creature);
        }
    }

    uint32 m_uiSayTimer;
    uint32 m_uiSpeech;
    bool m_inDungeon;

    void Reset() override {}

    void UpdateAI(uint32 const uiDiff) override
    {
        // We are in Sunken Temple
        if (m_inDungeon)
        {
            if (m_uiSpeech < MAX_MALFURION_TEMPLE_SPEECHES)
            {
                if (m_uiSayTimer <= uiDiff)
                {
                    switch (m_uiSpeech)
                    {
                        case 0:
                            m_creature->SetVisibility(VISIBILITY_ON);
                            m_creature->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
                            // Resurrection visual
                            m_creature->CastSpell(m_creature, 20761, true);
                            m_uiSayTimer = 1500;
                            break;

                        case 1:
                            m_creature->HandleEmoteCommand(EMOTE_ONESHOT_BOW);
                            m_uiSayTimer = 2000;
                            break;

                        case 2:
                            DoScriptText(SAY_MALFURION1, m_creature);
                            m_uiSayTimer = 10000;
                            break;

                        case 3:
                            DoScriptText(SAY_MALFURION2, m_creature);
                            m_uiSayTimer = 10000;
                            break;

                        case 4:
                            DoScriptText(SAY_MALFURION3, m_creature);
                            m_uiSayTimer = 8000;
                            break;

                        case 5:
                            DoScriptText(SAY_MALFURION4, m_creature);
                            m_uiSayTimer = 5000;
                            break;
                        
                        case 6:
                            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);
                            break;
                    }

                    ++m_uiSpeech;
                }
                else
                    m_uiSayTimer -= uiDiff;
            }
        }
    }
};

CreatureAI* GetAI_npc_malfurion(Creature* pCreature)
{
    return new npc_malfurionAI(pCreature);
}

// Summon Malfurion trigger (AQ scepter quest)
bool AreaTrigger_at_shade_of_eranikus(Player* pPlayer, AreaTriggerEntry const* pAt)
{
    if (!pPlayer || !pPlayer->IsAlive() || !pAt)
        return false;

    if (pAt->id != AREATRIGGER_MALFURION)
        return false;

    // Don't spawn if player did not complete Charge of Dragonflights, or already on/done with Malfurion quest
    if (!pPlayer->GetQuestRewardStatus(QUEST_THE_CHARGE_OF_DRAGONFLIGHTS)
        || pPlayer->GetQuestStatus(QUEST_ERANIKUS_TYRANT_OF_DREAMS) != QUEST_STATUS_NONE
        || pPlayer->GetQuestRewardStatus(QUEST_ERANIKUS_TYRANT_OF_DREAMS))
        return false;

    // Check if Malfurion already spawned
    if (Creature* cMalfurion = GetClosestCreatureWithEntry(pPlayer, NPC_MALFURION, 50.0f))
        return true;

    // Summon for real now
    if (Creature* cMalfurion = pPlayer->SummonCreature(NPC_MALFURION, pAt->x, pAt->y - 15, pAt->z, 1.52f, TEMPSUMMON_CORPSE_DESPAWN, 0))
        return true;
    
    return false;
}

/*######
## go_atalai_light
######*/

struct go_atalai_lightAI: public GameObjectAI
{
    go_atalai_lightAI(GameObject* pGo) : GameObjectAI(pGo) {}

    bool OnUse(Unit* pUser) override
    {
        ScriptedInstance* pInstance = (ScriptedInstance*)me->GetInstanceData();

        if (!pInstance || pInstance->GetData(TYPE_ATALARION) == DONE)
            return false;

        pInstance->SetData64(me->GetEntry(), me->GetGUID());
        pInstance->SetData(TYPE_ATALARION, IN_PROGRESS);

        return true;
    }
};

GameObjectAI* GetAIgo_atalai_light(GameObject *pGo)
{
    return new go_atalai_lightAI(pGo);
}

void AddSC_sunken_temple()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "npc_malfurion_stormrage";
    pNewScript->GetAI = &GetAI_npc_malfurion;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "at_shade_of_eranikus";
    pNewScript->pAreaTrigger = &AreaTrigger_at_shade_of_eranikus;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "go_atalai_light";
    pNewScript->GOGetAI = &GetAIgo_atalai_light;
    pNewScript->RegisterSelf();
}
