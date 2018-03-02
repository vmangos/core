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

OutdoorPvPSI::OutdoorPvPSI()
{
    m_TypeId = OUTDOOR_PVP_SI;
    m_Gathered_A = 0;
    m_Gathered_H = 0;
    m_MaxRessources = SI_MAX_RESOURCES_DEFAULT;
    m_LastController = 0;
}

uint32 OutdoorPvPSI::FillInitialWorldStates(WorldPacket &data)
{
    data << SI_GATHERED_A << m_Gathered_A;
    data << SI_GATHERED_H << m_Gathered_H;
    data << SI_SILITHYST_MAX << m_MaxRessources;
    return 3;
}

void OutdoorPvPSI::SendRemoveWorldStates(Player *plr)
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
    for (uint8 i = 0; i < OutdoorPvPSIBuffZonesNum; ++i)
        RegisterZone(OutdoorPvPSIBuffZones[i]);
    // On reprend les donnees precedentes (avant dernier reboot)
    m_MaxRessources = sObjectMgr.GetSavedVariable(uint32(SI_SILITHYST_MAX), SI_MAX_RESOURCES_DEFAULT);

    m_Gathered_A = 0;
    m_Gathered_H = 0;
    return true;
}

void OutdoorPvPSI::Update(uint32 /*diff*/)
{
}

void OutdoorPvPSI::OnPlayerEnter(Player * plr)
{
    if (plr->GetTeam() == m_LastController)
        plr->CastSpell(plr, SI_CENARION_FAVOR, true);
    OutdoorPvP::OnPlayerEnter(plr);
}

void OutdoorPvPSI::OnPlayerLeave(Player * plr)
{
    // remove buffs
    plr->RemoveAurasDueToSpell(SI_CENARION_FAVOR);
    OutdoorPvP::OnPlayerLeave(plr);
}

bool OutdoorPvPSI::HandleAreaTrigger(Player *plr, uint32 trigger)
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
            else // H2 dans le trigger A2
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
            else // A2 dans le trigger H2
                return true;
            break;
        default:
            return false;
    }
    plr->RemoveAurasDueToSpell(SI_SILITHYST_FLAG);                               /** Remove silithyst aura */
    UpdateWorldState();

    plr->CastSpell(plr, SI_TRACES_OF_SILITHYST, true);                           /** Reward animation */
    plr->GetHonorMgr().Add(19, BONUS);                                       /** Instant honor reward */
    plr->GetReputationMgr().ModifyReputation(sObjectMgr.GetFactionEntry(609), 10); /** Cenarian faction */

    sLog.out(LOG_BG, "%s [%u:%u:'%s'] added a Silithyst to its faction",
             plr->GetName(),
             plr->GetGUIDLow(),
             plr->GetSession()->GetAccountId(),
             plr->GetSession()->GetRemoteAddress().c_str());

    return true;
}

bool OutdoorPvPSI::HandleDropFlag(Player *plr, uint32 spellId)
{
    if (spellId == SI_SILITHYST_FLAG)
    {
        /** if it was dropped away from the player's turn-in point,
         * then create a silithyst mound. Ff it was dropped near the areatrigger,
         * then it was dispelled by the outdoorpvp, so do nothing
         */
        switch (plr->GetTeam())
        {
            case ALLIANCE:
            {
                AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(SI_AREATRIGGER_A);
                if (atEntry)
                {
                    // 5.0f is safe-distance
                    if (plr->GetDistance(atEntry->x, atEntry->y, atEntry->z) > 5.0f + atEntry->radius)
                    {
                        // he dropped it further, summon mound
                        if (GameObject* pGo = plr->SummonGameObject(
                                                  SI_SILITHYST_MOUND,
                                                  plr->GetPositionX(),
                                                  plr->GetPositionY(),
                                                  plr->GetPositionZ(),
                                                  plr->GetOrientation(),
                                                  0, 0, 0, 0, 25000, false))
                        {
                            pGo->SetRespawnTime(0);
                            sLog.out(LOG_BG, "%s [%u:%u:'%s'] dropped a silithyst",
                                     plr->GetName(),
                                     plr->GetGUIDLow(),
                                     plr->GetSession()->GetAccountId(),
                                     plr->GetSession()->GetRemoteAddress().c_str());
                        }
                    }
                }
            }
            break;
            case HORDE:
            {
                AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(SI_AREATRIGGER_H);
                if (atEntry)
                {
                    // 5.0f is safe-distance
                    if (plr->GetDistance(atEntry->x, atEntry->y, atEntry->z) > 5.0f + atEntry->radius)
                    {
                        // he dropped it further, summon mound
                        if (GameObject* pGo = plr->SummonGameObject(
                                                  SI_SILITHYST_MOUND,
                                                  plr->GetPositionX(),
                                                  plr->GetPositionY(),
                                                  plr->GetPositionZ(),
                                                  plr->GetOrientation(),
                                                  0, 0, 0, 0, 25000, false))
                        {
                            pGo->SetRespawnTime(0);
                            sLog.out(LOG_BG, "%s [%u:%u:'%s'] dropped a silithyst",
                                     plr->GetName(),
                                     plr->GetGUIDLow(),
                                     plr->GetSession()->GetAccountId(),
                                     plr->GetSession()->GetRemoteAddress().c_str());
                        }
                    }
                }
            }
            break;
        }
        return true;
    }
    return false;
}

/** Player taking a silithyst from geyser or from silithyst mound*/
bool OutdoorPvPSI::HandleCustomSpell(Player *plr, uint32 spellId, GameObject *go)
{
    if (!go || spellId != SI_SILITHYST_FLAG_GO_SPELL)
        return false;
    plr->CastSpell(plr, SI_SILITHYST_FLAG, true);

    /** If it was taken from silithyst mound, delete it */
    if (go->GetGOInfo()->id == SI_SILITHYST_MOUND)
    {
        go->SetRespawnTime(0);
        go->Delete();
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
