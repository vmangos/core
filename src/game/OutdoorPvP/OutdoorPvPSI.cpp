/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.TrinityCore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "OutdoorPvP/OutdoorPvPSI.h"
#include "WorldPacket.h"
#include "Player.h"
#include "GameObject.h"
#include "MapManager.h"
#include "ObjectMgr.h"
#include "ZoneScriptMgr.h"
#include "Language.h"
#include "World.h"
#include "GameEventMgr.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2

OutdoorPvPSI::OutdoorPvPSI()
{
    m_TypeId = OUTDOOR_PVP_SI;
    m_Gathered_A = 0;
    m_Gathered_H = 0;
    m_MaxRessources = SI_MAX_RESOURCES_DEFAULT;
    m_LastController = 0;
}

uint32 OutdoorPvPSI::FillInitialWorldStates(WorldPacket& data)
{
    data << SI_GATHERED_A << m_Gathered_A;
    data << SI_GATHERED_H << m_Gathered_H;
    data << SI_SILITHYST_MAX << m_MaxRessources;
    return 3;
}

void OutdoorPvPSI::SendRemoveWorldStates(Player* plr)
{
    plr->SendUpdateWorldState(SI_GATHERED_A, 0);
    plr->SendUpdateWorldState(SI_GATHERED_H, 0);
    plr->SendUpdateWorldState(SI_SILITHYST_MAX, 0);
}

void OutdoorPvPSI::UpdateWorldState()
{
    SendUpdateWorldState(SI_GATHERED_A, m_Gathered_A);
    SendUpdateWorldState(SI_GATHERED_H, m_Gathered_H);
    SendUpdateWorldState(SI_SILITHYST_MAX, m_MaxRessources);
    sObjectMgr.SetSavedVariable(uint32(SI_GATHERED_A),    m_Gathered_A);
    sObjectMgr.SetSavedVariable(uint32(SI_GATHERED_H),    m_Gathered_H);
    sObjectMgr.SetSavedVariable(uint32(SI_SILITHYST_MAX), m_MaxRessources);
}

bool OutdoorPvPSI::SetupZoneScript()
{
    for (uint32 i : OutdoorPvPSIBuffZones)
        RegisterZone(i);
    // On reprend les donnees precedentes (avant dernier reboot)
    m_MaxRessources = sObjectMgr.GetSavedVariable(uint32(SI_SILITHYST_MAX), SI_MAX_RESOURCES_DEFAULT);

    m_Gathered_A = 0;
    m_Gathered_H = 0;
    return true;
}

void OutdoorPvPSI::Update(uint32 /*diff*/)
{
}

void OutdoorPvPSI::OnPlayerEnter(Player* plr)
{
    if (plr->GetTeam() == m_LastController)
        plr->CastSpell(plr, SI_CENARION_FAVOR, true);
    OutdoorPvP::OnPlayerEnter(plr);
}

void OutdoorPvPSI::OnPlayerLeave(Player* plr)
{
    OutdoorPvP::OnPlayerLeave(plr);
}

bool OutdoorPvPSI::HandleAreaTrigger(Player* plr, uint32 trigger)
{
    /** If the player doesn't have a silithyst */
    if (!plr->HasAura(SI_SILITHYST_FLAG))
        return false;

    /** If the silithyst event isn't launched */
    /*if (sGameEventMgr.GetSilithusPVPEventCompleted())
        return false;*/

    switch (trigger)
    {
        case SI_AREATRIGGER_A:
            if (plr->GetTeam() == ALLIANCE)
            {
                ++ m_Gathered_A;
                if (m_Gathered_A >= m_MaxRessources)
                {
                    TeamApplyBuff(TEAM_ALLIANCE, SI_CENARION_FAVOR);
                    sWorld.SendZoneText(OutdoorPvPSIBuffZones[0], sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_SI_CAPTURE_A));
                    m_LastController = ALLIANCE;
                    m_Gathered_A = 0;
                    m_Gathered_H = 0;
                    sLog.out(LOG_BG, "[Silithus] Under Alliance control");
                    //sGameEventMgr.SetSilithusPVPEventCompleted(true);
                    //sGameEventMgr.UpdateSilithusPVP();
                }
                // complete quest
                plr->KilledMonsterCredit(SI_TURNIN_QUEST_CM_A, ObjectGuid());
            }
            else
                return true;
            break;
        case SI_AREATRIGGER_H:
            if (plr->GetTeam() == HORDE)
            {
                ++ m_Gathered_H;
                if (m_Gathered_H >= m_MaxRessources)
                {
                    TeamApplyBuff(TEAM_HORDE, SI_CENARION_FAVOR);
                    sWorld.SendZoneText(OutdoorPvPSIBuffZones[0], sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_SI_CAPTURE_H));
                    m_LastController = HORDE;
                    m_Gathered_A = 0;
                    m_Gathered_H = 0;
                    sLog.out(LOG_BG, "[Silithus] Under Horde control");
                    //sGameEventMgr.SetSilithusPVPEventCompleted(true);
                    //sGameEventMgr.UpdateSilithusPVP();
                }
                // complete quest
                plr->KilledMonsterCredit(SI_TURNIN_QUEST_CM_H, ObjectGuid());
            }
            else
                return true;
            break;
        default:
            return false;
    }

    plr->RemoveAurasDueToSpell(SI_SILITHYST_FLAG); 
    //plr->CastSpell(plr, SILLITHUS_FLAG_CAPTURE_TEST, true);
    plr->CastSpell(plr, SI_TRACES_OF_SILITHYST, true);
    plr->CastSpell(plr, HONOR_POINTS_199, true);                // Honor reward
    plr->CastSpell(plr, SILITHYST_CAP_REWARD, true);            // Cenarian faction

    UpdateWorldState();

    sLog.out(LOG_BG, "%s [%u:%u:'%s'] added a Silithyst to its faction",
        plr->GetName(),
        plr->GetGUIDLow(),
        plr->GetSession()->GetAccountId(),
        plr->GetSession()->GetRemoteAddress().c_str());

    return true;
}

bool OutdoorPvPSI::HandleDropFlag(Player* plr, uint32 spellId)
{
    if (spellId != SI_SILITHYST_FLAG)
        return false;

    if (AreaTriggerEntry const* atEntry = sObjectMgr.GetAreaTrigger(plr->GetTeam() == ALLIANCE ? SI_AREATRIGGER_A : SI_AREATRIGGER_H))
        if (plr->IsWithinDist3d(atEntry->x, atEntry->y, atEntry->z, 5.0f))
            return false;

    plr->CastSpell(plr, SILLITHUS_FLAG_DROP, true);
    {
        sLog.out(LOG_BG, "%s [%u:%u:'%s'] dropped a silithyst",
            plr->GetName(),
            plr->GetGUIDLow(),
            plr->GetSession()->GetAccountId(),
            plr->GetSession()->GetRemoteAddress().c_str());
    }

    return true;
}

class OutdoorPvP_silithus : public ZoneScript_Script
{
public:

    OutdoorPvP_silithus()
        : ZoneScript_Script()
    {
    }
    uint32 GetMapId() const
    {
        return 1;
    }
    ZoneScript* GetZoneScript() const
    {
        return new OutdoorPvPSI();
    }
};

void AddSC_outdoorpvp_si()
{
    sZoneScriptMgr.AddScript(new OutdoorPvP_silithus());
}

#endif
