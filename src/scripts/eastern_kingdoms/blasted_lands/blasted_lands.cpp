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
SDName: Blasted_Lands
SD%Complete: 90
SDCategory: Blasted Lands
EndScriptData */

/* ContentData
go_stone_of_binding
EndContentData */

#include "scriptPCH.h"

bool GOHello_go_stone_of_binding(Player* pPlayer, GameObject* pGo)
{
    // 141812 <= 7668 Servant of Razelikh
    // 141857 <= 7669 Servant of Grol
    // 141858 <= 7670 Servant of Allistarj
    // 141859 <= 7671 Servant of Sevine

    switch(pGo->GetEntry())
    {
        case 141812:
            pGo->CastSpell(nullptr, 10805, true); //servant of razelikh
            break;
        case 141857:
            pGo->CastSpell(nullptr, 10834, true); //servant of grol
            break;
        case 141858:
            pGo->CastSpell(nullptr, 10836, true); //servant of allistarj
            break;
        case 141859:
            pGo->CastSpell(nullptr, 10835, true); //servant of sevine
            break;
    }
    return false;
}

void AddSC_blasted_lands()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_stone_of_binding";
    newscript->pGOHello = &GOHello_go_stone_of_binding;
    newscript->RegisterSelf();
}
