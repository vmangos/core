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
SDComment: Quest support: 435, 452
SDCategory: Silverpine Forest
EndScriptData */

/* ContentData
npc_deathstalker_erland
npc_deathstalker_faerleia
EndContentData */

#include "scriptPCH.h"
#include "Group.h"

namespace SilverpineUtils
{
    bool IsWorgenTime()
    {
        time_t rawtime;
        time(&rawtime);
        struct tm * timeinfo = localtime(&rawtime);
        return ((timeinfo->tm_hour >= 21) || (timeinfo->tm_hour >= 0 && timeinfo->tm_hour < 9));
    }
}
/*#####
## npc_deathstalker_erland
#####*/

enum DeathstalkerErlandData
{
    SAY_START_1         = 481,
    SAY_START_2         = 482,
    SAY_AGGRO_1         = 543,
    SAY_AGGRO_2         = 544,
    SAY_AGGRO_3         = 541,
    SAY_PROGRESS        = 483,
    SAY_END             = 484,
    SAY_RANE            = 534,
    SAY_RANE_REPLY      = 535,
    SAY_CHECK_NEXT      = 536,
    SAY_QUINN           = 537,
    SAY_QUINN_REPLY     = 539,
    SAY_BYE             = 538,

    QUEST_ERLAND        = 435,
    NPC_RANE            = 1950,
    NPC_QUINN           = 1951,
    FACTION_ESCORTEE    = 232
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

    void MoveInLineOfSight(Unit* pUnit) override
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

    void WaypointReached(uint32 i) override
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

    void Reset() override
    {
        if (!HasEscortState(STATE_ESCORT_ESCORTING))
        {
            uiRaneGUID = 0;
            uiQuinnGUID = 0;
        }
    }

    void Aggro(Unit* who) override
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

bool QuestAccept_npc_deathstalker_erland(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ERLAND)
    {
        DoScriptText(SAY_START_1, pCreature);
        pCreature->SetFactionTemporary(FACTION_ESCORTEE, TEMPFACTION_RESTORE_RESPAWN);

        if (npc_deathstalker_erlandAI* pEscortAI = dynamic_cast<npc_deathstalker_erlandAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

CreatureAI* GetAI_npc_deathstalker_erland(Creature* pCreature)
{
    return new npc_deathstalker_erlandAI(pCreature);
}

void AddSC_silverpine_forest()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_deathstalker_erland";
    newscript->GetAI = &GetAI_npc_deathstalker_erland;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_deathstalker_erland;
    newscript->RegisterSelf();
}
