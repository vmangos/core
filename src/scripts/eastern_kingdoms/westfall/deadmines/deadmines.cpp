/*
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

#include "scriptPCH.h"
#include "deadmines.h"

bool GOHello_go_door_lever_dm(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = static_cast<ScriptedInstance*>(pGo->GetInstanceData()))
    {
        if (pInstance->instance)
        {
            GameObject* pGoDoor = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_DEFIAS_DOOR));

            return !(pGoDoor && pGoDoor->GetGoState() == GO_STATE_ACTIVE);
        }
    }

    return false;
}

bool GOHello_go_defias_cannon(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = static_cast<ScriptedInstance*>(pGo->GetInstanceData()))
    {
        if (pInstance->GetData(TYPE_DEFIAS_ENDDOOR) == DONE)
        {
            return false;
        }

        pInstance->SetData(TYPE_DEFIAS_ENDDOOR, DONE);
    }

    return false;
}

bool GOHello_go_defias_gunpowder(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = static_cast<ScriptedInstance*>(pGo->GetInstanceData()))
    {
        // The instance summons the Overseer
        pInstance->SetData(GUN_POWDER_EVENT, 1);
        return true;
    }

    return false;
}

void AddSC_deadmines()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_door_lever_dm";
    newscript->pGOHello = &GOHello_go_door_lever_dm;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_defias_cannon";
    newscript->pGOHello = &GOHello_go_defias_cannon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_defias_gunpowder";
    newscript->pGOHello = &GOHello_go_defias_gunpowder;
    newscript->RegisterSelf();
}
