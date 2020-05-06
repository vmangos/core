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
SDName: Areatrigger_Scripts
SD%Complete: 100
SDComment: Quest support: 6681
SDCategory: Areatrigger
EndScriptData */

/* ContentData
at_ravenholdt
EndContentData */

#include "scriptPCH.h"

/*######
## at_childrens_week_spot
######*/

uint32 TriggerOrphanSpell[6][3] =
{
    {3546, 14305, 1479},   // The Bough of the Eternals
    {3547, 14444, 1800},   // Lordaeron Throne Room
    {3548, 14305, 1558},   // The Stonewrought Dam
    {3549, 14444, 911},   // Gateway to the Frontier
    {3550, 14444, 910},   // Down at the Docks
    {3552, 14305, 1687}    // Spooky Lighthouse
};

bool AreaTrigger_at_childrens_week_spot(Player* pPlayer, AreaTriggerEntry const* pAt)
{
    for (const auto& i : TriggerOrphanSpell)
    {
        if (pAt->id == i[0] &&
                pPlayer->GetMiniPet() && pPlayer->GetMiniPet()->GetEntry() == i[1])
        {
            pPlayer->AreaExploredOrEventHappens(i[2]);
            return true;
        }
    }
    return false;
}

/*######
## at_ravenholdt
######*/

enum
{
    QUEST_MANOR_RAVENHOLDT  = 6681,
    NPC_RAVENHOLDT          = 13936
};

bool AreaTrigger_at_ravenholdt(Player* pPlayer, AreaTriggerEntry const* pAt)
{
    if (pPlayer->GetQuestStatus(QUEST_MANOR_RAVENHOLDT) == QUEST_STATUS_INCOMPLETE)
        pPlayer->KilledMonsterCredit(NPC_RAVENHOLDT);

    return false;
}

void AddSC_areatrigger_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "at_ravenholdt";
    newscript->pAreaTrigger = &AreaTrigger_at_ravenholdt;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_childrens_week_spot";
    newscript->pAreaTrigger = &AreaTrigger_at_childrens_week_spot;
    newscript->RegisterSelf();
}
