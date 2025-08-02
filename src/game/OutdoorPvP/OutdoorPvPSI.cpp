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
#include "ObjectMgr.h"
#include "ZoneScriptMgr.h"
#include "Language.h"
#include "World.h"
#include "GameEventMgr.h"
#include "ScriptMgr.h"

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
    WriteInitialWorldStatePair(data, WS_OPVP_SI_GATHERED_A, m_Gathered_A);
    WriteInitialWorldStatePair(data, WS_OPVP_SI_GATHERED_H, m_Gathered_H);
    WriteInitialWorldStatePair(data, WS_OPVP_SI_SILITHYST_MAX, m_MaxRessources);
    return 3;
}

void OutdoorPvPSI::SendRemoveWorldStates(Player* plr)
{
    plr->SendUpdateWorldState(WS_OPVP_SI_GATHERED_A, 0);
    plr->SendUpdateWorldState(WS_OPVP_SI_GATHERED_H, 0);
    plr->SendUpdateWorldState(WS_OPVP_SI_SILITHYST_MAX, 0);
}

void OutdoorPvPSI::UpdateWorldState()
{
    SendUpdateWorldState(WS_OPVP_SI_GATHERED_A, m_Gathered_A);
    SendUpdateWorldState(WS_OPVP_SI_GATHERED_H, m_Gathered_H);
    SendUpdateWorldState(WS_OPVP_SI_SILITHYST_MAX, m_MaxRessources);
    sObjectMgr.SetSavedVariable(uint32(WS_OPVP_SI_GATHERED_A),    m_Gathered_A);
    sObjectMgr.SetSavedVariable(uint32(WS_OPVP_SI_GATHERED_H),    m_Gathered_H);
    sObjectMgr.SetSavedVariable(uint32(WS_OPVP_SI_SILITHYST_MAX), m_MaxRessources);
}

bool OutdoorPvPSI::SetupZoneScript()
{
    for (uint32 i : OutdoorPvPSIBuffZones)
        RegisterZone(i);
    // On reprend les donnees precedentes (avant dernier reboot)
    m_MaxRessources = sObjectMgr.GetSavedVariable(uint32(WS_OPVP_SI_SILITHYST_MAX), SI_MAX_RESOURCES_DEFAULT);

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

static std::vector<uint32> const sAllianceDustBags = { 9496, 9497, 9498, 9499, 9500, 9501, 9502, 9503, 9504, 9507, 9508 };
static std::vector<uint32> const sHordeDustBags = { 13566, 13567, 13568, 13582, 13583, 13584, 13585, 13587, 13588, 13589, 13590, 13591 };

void OutdoorPvPSI::SpawnDustBags(uint32 resource, std::vector<uint32> const& allBags, std::set<uint32>& spawnedBags)
{
    uint32 neededBags = resource / 15;
    if (neededBags > spawnedBags.size())
    {
        for (auto const& dbGuid : allBags)
        {
            if (spawnedBags.find(dbGuid) == spawnedBags.end())
            {
                if (GetMap()->LoadGameObjectSpawn(dbGuid))
                {
                    spawnedBags.insert(dbGuid);
                    if (spawnedBags.size() >= neededBags)
                        break;
                }
            }
        }
    }
}

void OutdoorPvPSI::ResetResourceCount()
{
    m_Gathered_A = 0;
    m_Gathered_H = 0;

    for (auto const& dbGuid : m_allianceDustBags)
    {
        ObjectGuid guid = ObjectGuid(HIGHGUID_GAMEOBJECT, SI_DUST_BAG, dbGuid);
        if (GameObject* pGo = GetMap()->GetGameObject(guid))
            pGo->AddObjectToRemoveList();
    }
    m_allianceDustBags.clear();

    for (auto const& dbGuid : m_hordeDustBags)
    {
        ObjectGuid guid = ObjectGuid(HIGHGUID_GAMEOBJECT, SI_DUST_BAG, dbGuid);
        if (GameObject* pGo = GetMap()->GetGameObject(guid))
            pGo->AddObjectToRemoveList();
    }
    m_hordeDustBags.clear();
}

enum
{
    NPC_ANNOUNCER_HORDE        = 17079,
    NPC_ANNOUNCER_ALLIANCE     = 17080,

    BCT_SILITHYST_HORDE_25     = 13476,
    BCT_SILITHYST_HORDE_50     = 13477,
    BCT_SILITHYST_HORDE_75     = 13478,
    BCT_SILITHYST_HORDE_100    = 13469,

    BCT_SILITHYST_ALLIANCE_25  = 13479,
    BCT_SILITHYST_ALLIANCE_50  = 13480,
    BCT_SILITHYST_ALLIANCE_75  = 13481,
    BCT_SILITHYST_ALLIANCE_100 = 13470,
};

static void DoSilithystYell(Player* pPlayer, uint32 creatureId, uint32 textId)
{
    if (Creature* pCreature = pPlayer->FindNearestCreature(creatureId, MAX_VISIBILITY_DISTANCE))
        DoScriptText(textId, pCreature);
    else
        sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Silithus PvP Event yeller npc %u not found!", creatureId);
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

                if (m_Gathered_A == (m_MaxRessources / 4))
                    DoSilithystYell(plr, NPC_ANNOUNCER_ALLIANCE, BCT_SILITHYST_ALLIANCE_25);
                else if (m_Gathered_A == (m_MaxRessources / 2))
                    DoSilithystYell(plr, NPC_ANNOUNCER_ALLIANCE, BCT_SILITHYST_ALLIANCE_50);
                else if (m_Gathered_A == (m_MaxRessources - (m_MaxRessources / 4)))
                    DoSilithystYell(plr, NPC_ANNOUNCER_ALLIANCE, BCT_SILITHYST_ALLIANCE_75);
                else if (m_Gathered_A == m_MaxRessources)
                    DoSilithystYell(plr, NPC_ANNOUNCER_ALLIANCE, BCT_SILITHYST_ALLIANCE_100);

                if (m_Gathered_A >= m_MaxRessources)
                {
                    TeamApplyBuff(TEAM_ALLIANCE, SI_CENARION_FAVOR);
                    sWorld.SendZoneText(OutdoorPvPSIBuffZones[0], sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_SI_CAPTURE_A));
                    m_LastController = ALLIANCE;
                    ResetResourceCount();
                    sLog.Out(LOG_BG, LOG_LVL_DETAIL, "[Silithus] Under Alliance control");
                    //sGameEventMgr.SetSilithusPVPEventCompleted(true);
                    //sGameEventMgr.UpdateSilithusPVP();
                }
                else
                {
                    SpawnDustBags(m_Gathered_A, sAllianceDustBags, m_allianceDustBags);
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

                if (m_Gathered_H == (m_MaxRessources / 4))
                    DoSilithystYell(plr, NPC_ANNOUNCER_HORDE, BCT_SILITHYST_HORDE_25);
                else if (m_Gathered_H == (m_MaxRessources / 2))
                    DoSilithystYell(plr, NPC_ANNOUNCER_HORDE, BCT_SILITHYST_HORDE_50);
                else if (m_Gathered_H == (m_MaxRessources - (m_MaxRessources / 4)))
                    DoSilithystYell(plr, NPC_ANNOUNCER_HORDE, BCT_SILITHYST_HORDE_75);
                else if (m_Gathered_H == m_MaxRessources)
                    DoSilithystYell(plr, NPC_ANNOUNCER_HORDE, BCT_SILITHYST_HORDE_100);

                if (m_Gathered_H >= m_MaxRessources)
                {
                    TeamApplyBuff(TEAM_HORDE, SI_CENARION_FAVOR);
                    sWorld.SendZoneText(OutdoorPvPSIBuffZones[0], sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_SI_CAPTURE_H));
                    m_LastController = HORDE;
                    ResetResourceCount();
                    sLog.Out(LOG_BG, LOG_LVL_DETAIL, "[Silithus] Under Horde control");
                    //sGameEventMgr.SetSilithusPVPEventCompleted(true);
                    //sGameEventMgr.UpdateSilithusPVP();
                }
                else
                {
                    SpawnDustBags(m_Gathered_H, sHordeDustBags, m_hordeDustBags);
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

    sLog.Out(LOG_BG, LOG_LVL_DETAIL, "%s [%u:%u:'%s'] added a Silithyst to its faction",
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
        sLog.Out(LOG_BG, LOG_LVL_DETAIL, "%s [%u:%u:'%s'] dropped a silithyst",
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
