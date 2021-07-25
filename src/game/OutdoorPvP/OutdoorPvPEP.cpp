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

#include "OutdoorPvP/OutdoorPvPEP.h"
#include "WorldPacket.h"
#include "Player.h"
#include "GameObject.h"
#include "ObjectMgr.h"
#include "ZoneScriptMgr.h"
#include "Language.h"
#include "World.h"
#include "WaypointManager.h"
#include "CreatureGroups.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2

OPvPCapturePointEP_EWT::OPvPCapturePointEP_EWT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_TowerState(EP_TS_N), m_UnitsSummonedSide(0)
{
    SetCapturePointData(EPCapturePoints[EP_EWT].entry, EPCapturePoints[EP_EWT].map, EPCapturePoints[EP_EWT].x, EPCapturePoints[EP_EWT].y, EPCapturePoints[EP_EWT].z, EPCapturePoints[EP_EWT].o, EPCapturePoints[EP_EWT].rot0, EPCapturePoints[EP_EWT].rot1, EPCapturePoints[EP_EWT].rot2, EPCapturePoints[EP_EWT].rot3);
    AddObject(EP_EWT_FLAG1, EPTowerFlags[EP_EWT_FLAG1].entry, EPTowerFlags[EP_EWT_FLAG1].map, EPTowerFlags[EP_EWT_FLAG1].x, EPTowerFlags[EP_EWT_FLAG1].y, EPTowerFlags[EP_EWT_FLAG1].z, EPTowerFlags[EP_EWT_FLAG1].o, EPTowerFlags[EP_EWT_FLAG1].rot0, EPTowerFlags[EP_EWT_FLAG1].rot1, EPTowerFlags[EP_EWT_FLAG1].rot2, EPTowerFlags[EP_EWT_FLAG1].rot3);
    AddObject(EP_EWT_FLAG2, EPTowerFlags[EP_EWT_FLAG2].entry, EPTowerFlags[EP_EWT_FLAG2].map, EPTowerFlags[EP_EWT_FLAG2].x, EPTowerFlags[EP_EWT_FLAG2].y, EPTowerFlags[EP_EWT_FLAG2].z, EPTowerFlags[EP_EWT_FLAG2].o, EPTowerFlags[EP_EWT_FLAG2].rot0, EPTowerFlags[EP_EWT_FLAG2].rot1, EPTowerFlags[EP_EWT_FLAG2].rot2, EPTowerFlags[EP_EWT_FLAG2].rot3);
}

void OPvPCapturePointEP_EWT::ChangeState()
{
    // if changing from controlling alliance to horde or vice versa
    if (m_OldState == OBJECTIVESTATE_ALLIANCE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = 0;
    }
    else if (m_OldState == OBJECTIVESTATE_HORDE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_State)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = EP_TS_A;
            artkit = 2;
            animation = 1;
            SummonSupportUnitAtNorthpassTower(ALLIANCE);
            DelCreature(EP_EWT_BUFFER);
            AddCreature(EP_EWT_BUFFER, EPBufferNPCs[EP_BUFFER_EWT_A].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_EWT_A].map, EPBufferNPCs[EP_BUFFER_EWT_A].x, EPBufferNPCs[EP_BUFFER_EWT_A].y, EPBufferNPCs[EP_BUFFER_EWT_A].z, EPBufferNPCs[EP_BUFFER_EWT_A].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_EWT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = ALLIANCE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_EWT_TAKEN_A));
            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = EP_TS_H;
            artkit = 1;
            animation = 0;
            SummonSupportUnitAtNorthpassTower(HORDE);
            DelCreature(EP_EWT_BUFFER);
            AddCreature(EP_EWT_BUFFER, EPBufferNPCs[EP_BUFFER_EWT_H].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_EWT_H].map, EPBufferNPCs[EP_BUFFER_EWT_H].x, EPBufferNPCs[EP_BUFFER_EWT_H].y, EPBufferNPCs[EP_BUFFER_EWT_H].z, EPBufferNPCs[EP_BUFFER_EWT_H].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_EWT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = HORDE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_EWT_TAKEN_H));
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = EP_TS_N;
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_ALLIANCE_CHALLENGE:
        case OBJECTIVESTATE_HORDE_ALLIANCE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_A;
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_HORDE_CHALLENGE:
        case OBJECTIVESTATE_ALLIANCE_HORDE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_H;
            break;
        }
    }

    GameObject* flag = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid());
    GameObject* flag2 = m_PvP->GetGameObject(m_Objects[EP_EWT_FLAG1]);
    GameObject* flag3 = m_PvP->GetGameObject(m_Objects[EP_EWT_FLAG2]);
    if (flag)
    {
        flag->SetGoArtKit(artkit);
        flag->SendGameObjectCustomAnim(animation);
    }
    else
        sLog.outBasic("[OPvPCapturePointEP_EWT::ChangeState] no flag");

    if (flag2)
    {
        flag2->SetGoArtKit(artkit);
        flag2->SendGameObjectCustomAnim(animation);
    }
    if (flag3)
    {
        flag3->SetGoArtKit(artkit);
        flag3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // complete quest objective
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_EWT_CM, 0);
}

void OPvPCapturePointEP_EWT::SendChangePhase()
{
    // send this too, sometimes the slider disappears, dunno why :(
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
    // send these updates to only the ones in this objective
    uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
    // send this too, sometimes it resets :S
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
}

uint32 OPvPCapturePointEP_EWT::FillInitialWorldStates(WorldPacket& data)
{
    data << EP_EWT_A << uint32(bool(m_TowerState & EP_TS_A));
    data << EP_EWT_H << uint32(bool(m_TowerState & EP_TS_H));
    data << EP_EWT_N_A << uint32(bool(m_TowerState & EP_TS_N_A));
    data << EP_EWT_N_H << uint32(bool(m_TowerState & EP_TS_N_H));
    data << EP_EWT_N << uint32(bool(m_TowerState & EP_TS_N));
    return 5;
}

void OPvPCapturePointEP_EWT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(EP_EWT_A , bool(m_TowerState & EP_TS_A));
    m_PvP->SendUpdateWorldState(EP_EWT_H , bool(m_TowerState & EP_TS_H));
    m_PvP->SendUpdateWorldState(EP_EWT_N_A , bool(m_TowerState & EP_TS_N_A));
    m_PvP->SendUpdateWorldState(EP_EWT_N_H , bool(m_TowerState & EP_TS_N_H));
    m_PvP->SendUpdateWorldState(EP_EWT_N , bool(m_TowerState & EP_TS_N));
}

bool OPvPCapturePointEP_EWT::HandlePlayerEnter(Player* plr)
{
    if (OPvPCapturePoint::HandlePlayerEnter(plr))
    {
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        return true;
    }
    return false;
}

void OPvPCapturePointEP_EWT::HandlePlayerLeave(Player* plr)
{
    plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 0);
    OPvPCapturePoint::HandlePlayerLeave(plr);
}

void OPvPCapturePointEP_EWT::SummonSupportUnitAtNorthpassTower(uint32 team)
{
    if (m_UnitsSummonedSide != team)
    {
        m_UnitsSummonedSide = team;
        const creature_type * ct = nullptr;
        if (team == ALLIANCE)
            ct = EP_EWT_Summons_A;
        else
            ct = EP_EWT_Summons_H;

        for (uint8 i = 0; i < EP_EWT_NUM_CREATURES; ++i)
        {
            DelCreature(i);
            AddCreature(i, ct[i].entry, ct[i].teamval, ct[i].map, ct[i].x, ct[i].y, ct[i].z, ct[i].o, 1000000);

            if (i == 0)
            {
                if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[i]))
                {
                    pCreature->CastSpell(pCreature, SPELL_SPIRIT_SPAWN_IN, true);
                    pCreature->SetWalk(false);
                    DoScriptText(BCT_EP_EWT_SPAWN_YELL, pCreature, pCreature, CHAT_TYPE_ZONE_YELL);
                    pCreature->GetMotionMaster()->Clear(false, true);
                    pCreature->GetMotionMaster()->MoveWaypoint(0, PATH_FROM_SPECIAL, 7200, 0, 176350, false);
                }
            }
            if (i > 0)
            {
                if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[i]))
                {
                    pCreature->CastSpell(pCreature, SPELL_SPIRIT_SPAWN_IN, true);
                    if (Creature* pCommander = m_PvP->GetCreature(m_Creatures[0]))
                    {
                        float angle = (float(i) * (M_PI / (4 / static_cast<float>(2)))) + pCommander->GetOrientation();
                        pCreature->JoinCreatureGroup(pCommander, 5.0f, angle - M_PI, OPTION_FORMATION_MOVE); // Perfect Circle around the Pallid.
                    }
                }
            }
        }
    }
}

// NPT
OPvPCapturePointEP_NPT::OPvPCapturePointEP_NPT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_TowerState(EP_TS_N), m_SummonedGOSide(0)
{
    SetCapturePointData(EPCapturePoints[EP_NPT].entry, EPCapturePoints[EP_NPT].map, EPCapturePoints[EP_NPT].x, EPCapturePoints[EP_NPT].y, EPCapturePoints[EP_NPT].z, EPCapturePoints[EP_NPT].o, EPCapturePoints[EP_NPT].rot0, EPCapturePoints[EP_NPT].rot1, EPCapturePoints[EP_NPT].rot2, EPCapturePoints[EP_NPT].rot3);
    AddObject(EP_NPT_FLAG1, EPTowerFlags[EP_NPT_FLAG1].entry, EPTowerFlags[EP_NPT_FLAG1].map, EPTowerFlags[EP_NPT_FLAG1].x, EPTowerFlags[EP_NPT_FLAG1].y, EPTowerFlags[EP_NPT_FLAG1].z, EPTowerFlags[EP_NPT_FLAG1].o, EPTowerFlags[EP_NPT_FLAG1].rot0, EPTowerFlags[EP_NPT_FLAG1].rot1, EPTowerFlags[EP_NPT_FLAG1].rot2, EPTowerFlags[EP_NPT_FLAG1].rot3);
    AddObject(EP_NPT_FLAG2, EPTowerFlags[EP_NPT_FLAG2].entry, EPTowerFlags[EP_NPT_FLAG2].map, EPTowerFlags[EP_NPT_FLAG2].x, EPTowerFlags[EP_NPT_FLAG2].y, EPTowerFlags[EP_NPT_FLAG2].z, EPTowerFlags[EP_NPT_FLAG2].o, EPTowerFlags[EP_NPT_FLAG2].rot0, EPTowerFlags[EP_NPT_FLAG2].rot1, EPTowerFlags[EP_NPT_FLAG2].rot2, EPTowerFlags[EP_NPT_FLAG2].rot3);
}

void OPvPCapturePointEP_NPT::ChangeState()
{
    // if changing from controlling alliance to horde or vice versa
    if (m_OldState == OBJECTIVESTATE_ALLIANCE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = 0;
    }
    else if (m_OldState == OBJECTIVESTATE_HORDE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_State)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = EP_TS_A;
            artkit = 2;
            animation = 1;
            SummonCuringShrine(ALLIANCE);
            DelCreature(EP_NPT_BUFFER);
            AddCreature(EP_NPT_BUFFER, EPBufferNPCs[EP_BUFFER_NPT_A].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_NPT_A].map, EPBufferNPCs[EP_BUFFER_NPT_A].x, EPBufferNPCs[EP_BUFFER_NPT_A].y, EPBufferNPCs[EP_BUFFER_NPT_A].z, EPBufferNPCs[EP_BUFFER_NPT_A].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_NPT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = ALLIANCE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_NPT_TAKEN_A));
            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = EP_TS_H;
            artkit = 1;
            animation = 0;
            SummonCuringShrine(HORDE);
            DelCreature(EP_NPT_BUFFER);
            AddCreature(EP_NPT_BUFFER, EPBufferNPCs[EP_BUFFER_NPT_H].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_NPT_H].map, EPBufferNPCs[EP_BUFFER_NPT_H].x, EPBufferNPCs[EP_BUFFER_NPT_H].y, EPBufferNPCs[EP_BUFFER_NPT_H].z, EPBufferNPCs[EP_BUFFER_NPT_H].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_NPT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = HORDE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_NPT_TAKEN_H));
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = EP_TS_N;
            m_SummonedGOSide = 0;
            DelObject(EP_NPT_CURING_SHRINE);
            DelObject(EP_NPT_BANNER_AURA);
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_ALLIANCE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_A;
            break;
        }
        case OBJECTIVESTATE_HORDE_ALLIANCE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_A;
            m_SummonedGOSide = 0;
            DelObject(EP_NPT_CURING_SHRINE);
            DelObject(EP_NPT_BANNER_AURA);
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_HORDE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_H;
            break;
        }
        case OBJECTIVESTATE_ALLIANCE_HORDE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_H;
            m_SummonedGOSide = 0;
            DelObject(EP_NPT_CURING_SHRINE);
            DelObject(EP_NPT_BANNER_AURA);
            break;
        }
    }

    GameObject* flag = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid());
    GameObject* flag2 = m_PvP->GetGameObject(m_Objects[EP_NPT_FLAG1]);
    GameObject* flag3 = m_PvP->GetGameObject(m_Objects[EP_NPT_FLAG2]);
    if (flag)
    {
        flag->SetGoArtKit(artkit);
        flag->SendGameObjectCustomAnim(animation);
    }
    else
        sLog.outBasic("[OPvPCapturePointEP_EWT::ChangeState] no flag");

    if (flag2)
    {
        flag2->SetGoArtKit(artkit);
        flag2->SendGameObjectCustomAnim(animation);
    }
    if (flag3)
    {
        flag3->SetGoArtKit(artkit);
        flag3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // complete quest objective
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_NPT_CM, 0);

}

void OPvPCapturePointEP_NPT::SendChangePhase()
{
    // send this too, sometimes the slider disappears, dunno why :(
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
    // send these updates to only the ones in this objective
    uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
    // send this too, sometimes it resets :S
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
}

uint32 OPvPCapturePointEP_NPT::FillInitialWorldStates(WorldPacket& data)
{
    data << EP_NPT_A << uint32(bool(m_TowerState & EP_TS_A));
    data << EP_NPT_H << uint32(bool(m_TowerState & EP_TS_H));
    data << EP_NPT_N_A << uint32(bool(m_TowerState & EP_TS_N_A));
    data << EP_NPT_N_H << uint32(bool(m_TowerState & EP_TS_N_H));
    data << EP_NPT_N << uint32(bool(m_TowerState & EP_TS_N));
    return 5;
}

void OPvPCapturePointEP_NPT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(EP_NPT_A , bool(m_TowerState & EP_TS_A));
    m_PvP->SendUpdateWorldState(EP_NPT_H , bool(m_TowerState & EP_TS_H));
    m_PvP->SendUpdateWorldState(EP_NPT_N_A , bool(m_TowerState & EP_TS_N_A));
    m_PvP->SendUpdateWorldState(EP_NPT_N_H , bool(m_TowerState & EP_TS_N_H));
    m_PvP->SendUpdateWorldState(EP_NPT_N , bool(m_TowerState & EP_TS_N));
}

bool OPvPCapturePointEP_NPT::HandlePlayerEnter(Player* plr)
{
    if (OPvPCapturePoint::HandlePlayerEnter(plr))
    {
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        return true;
    }
    return false;
}

void OPvPCapturePointEP_NPT::HandlePlayerLeave(Player* plr)
{
    plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 0);
    OPvPCapturePoint::HandlePlayerLeave(plr);
}

void OPvPCapturePointEP_NPT::SummonCuringShrine(uint32 team)
{
    if (m_SummonedGOSide != team)
    {
        m_SummonedGOSide = team;
        DelObject(EP_NPT_CURING_SHRINE);
        DelObject(EP_NPT_BANNER_AURA);
        AddObject(EP_NPT_CURING_SHRINE, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].entry, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].map, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].x, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].y, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].z, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].o, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot0, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot1, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot2, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot3);
        AddObject(EP_NPT_BANNER_AURA, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].entry, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].map, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].x, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].y, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].z, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].o, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot0, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot1, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot2, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot3);
    }
}

// CGT
OPvPCapturePointEP_CGT::OPvPCapturePointEP_CGT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_SpiritOfVictorySpawned(0), m_TowerState(EP_TS_N), m_GraveyardSide(TEAM_NONE)
{
    UnLinkGraveYard();
    SetCapturePointData(EPCapturePoints[EP_CGT].entry, EPCapturePoints[EP_CGT].map, EPCapturePoints[EP_CGT].x, EPCapturePoints[EP_CGT].y, EPCapturePoints[EP_CGT].z, EPCapturePoints[EP_CGT].o, EPCapturePoints[EP_CGT].rot0, EPCapturePoints[EP_CGT].rot1, EPCapturePoints[EP_CGT].rot2, EPCapturePoints[EP_CGT].rot3);
    AddObject(EP_CGT_FLAG1, EPTowerFlags[EP_CGT_FLAG1].entry, EPTowerFlags[EP_CGT_FLAG1].map, EPTowerFlags[EP_CGT_FLAG1].x, EPTowerFlags[EP_CGT_FLAG1].y, EPTowerFlags[EP_CGT_FLAG1].z, EPTowerFlags[EP_CGT_FLAG1].o, EPTowerFlags[EP_CGT_FLAG1].rot0, EPTowerFlags[EP_CGT_FLAG1].rot1, EPTowerFlags[EP_CGT_FLAG1].rot2, EPTowerFlags[EP_CGT_FLAG1].rot3);
    AddObject(EP_CGT_FLAG2, EPTowerFlags[EP_CGT_FLAG2].entry, EPTowerFlags[EP_CGT_FLAG2].map, EPTowerFlags[EP_CGT_FLAG2].x, EPTowerFlags[EP_CGT_FLAG2].y, EPTowerFlags[EP_CGT_FLAG2].z, EPTowerFlags[EP_CGT_FLAG2].o, EPTowerFlags[EP_CGT_FLAG2].rot0, EPTowerFlags[EP_CGT_FLAG2].rot1, EPTowerFlags[EP_CGT_FLAG2].rot2, EPTowerFlags[EP_CGT_FLAG2].rot3);
}

void OPvPCapturePointEP_CGT::ChangeState()
{
    // if changing from controlling alliance to horde or vice versa
    if (m_OldState == OBJECTIVESTATE_ALLIANCE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = 0;
    }
    else if (m_OldState == OBJECTIVESTATE_HORDE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_State)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = EP_TS_A;
            artkit = 2;
            animation = 1;
            LinkGraveYard(ALLIANCE);
            SummonSpiritOfVictory(ALLIANCE);
            DelCreature(EP_CGT_BUFFER);
            AddCreature(EP_CGT_BUFFER, EPBufferNPCs[EP_BUFFER_CGT_A].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_CGT_A].map, EPBufferNPCs[EP_BUFFER_CGT_A].x, EPBufferNPCs[EP_BUFFER_CGT_A].y, EPBufferNPCs[EP_BUFFER_CGT_A].z, EPBufferNPCs[EP_BUFFER_CGT_A].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_CGT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = ALLIANCE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_CGT_TAKEN_A));
            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = EP_TS_H;
            artkit = 1;
            animation = 0;
            LinkGraveYard(HORDE);
            SummonSpiritOfVictory(HORDE);
            DelCreature(EP_CGT_BUFFER);
            AddCreature(EP_CGT_BUFFER, EPBufferNPCs[EP_BUFFER_CGT_H].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_CGT_H].map, EPBufferNPCs[EP_BUFFER_CGT_H].x, EPBufferNPCs[EP_BUFFER_CGT_H].y, EPBufferNPCs[EP_BUFFER_CGT_H].z, EPBufferNPCs[EP_BUFFER_CGT_H].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_CGT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = HORDE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_CGT_TAKEN_H));
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            DelCreature(EP_CGT_SPIRITOFVICTORY);
            m_SpiritOfVictorySpawned = 0;
            UnLinkGraveYard();
            m_TowerState = EP_TS_N;
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_ALLIANCE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_A;
            break;
        }
        case OBJECTIVESTATE_HORDE_ALLIANCE_CHALLENGE:
        {
            DelCreature(EP_CGT_SPIRITOFVICTORY);
            m_SpiritOfVictorySpawned = 0;
            UnLinkGraveYard();
            m_TowerState = EP_TS_N_A;
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_HORDE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_H;
            break;
        }
        case OBJECTIVESTATE_ALLIANCE_HORDE_CHALLENGE:
        {
            DelCreature(EP_CGT_SPIRITOFVICTORY);
            m_SpiritOfVictorySpawned = 0;
            UnLinkGraveYard();
            m_TowerState = EP_TS_N_H;
            break;
        }
    }

    GameObject* flag = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid());
    GameObject* flag2 = m_PvP->GetGameObject(m_Objects[EP_CGT_FLAG1]);
    GameObject* flag3 = m_PvP->GetGameObject(m_Objects[EP_CGT_FLAG2]);
    if (flag)
    {
        flag->SetGoArtKit(artkit);
        flag->SendGameObjectCustomAnim(animation);
    }
    else
        sLog.outBasic("[OPvPCapturePointEP_EWT::ChangeState] no flag");

    if (flag2)
    {
        flag2->SetGoArtKit(artkit);
        flag2->SendGameObjectCustomAnim(animation);
    }
    if (flag3)
    {
        flag3->SetGoArtKit(artkit);
        flag3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // complete quest objective
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_CGT_CM, 0);
}

void OPvPCapturePointEP_CGT::SendChangePhase()
{
    // send this too, sometimes the slider disappears, dunno why :(
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
    // send these updates to only the ones in this objective
    uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
    // send this too, sometimes it resets :S
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
}

uint32 OPvPCapturePointEP_CGT::FillInitialWorldStates(WorldPacket& data)
{
    data << EP_CGT_A << uint32(bool(m_TowerState & EP_TS_A));
    data << EP_CGT_H << uint32(bool(m_TowerState & EP_TS_H));
    data << EP_CGT_N_A << uint32(bool(m_TowerState & EP_TS_N_A));
    data << EP_CGT_N_H << uint32(bool(m_TowerState & EP_TS_N_H));
    data << EP_CGT_N << uint32(bool(m_TowerState & EP_TS_N));
    return 5;
}

void OPvPCapturePointEP_CGT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(EP_CGT_A , bool(m_TowerState & EP_TS_A));
    m_PvP->SendUpdateWorldState(EP_CGT_H , bool(m_TowerState & EP_TS_H));
    m_PvP->SendUpdateWorldState(EP_CGT_N_A , bool(m_TowerState & EP_TS_N_A));
    m_PvP->SendUpdateWorldState(EP_CGT_N_H , bool(m_TowerState & EP_TS_N_H));
    m_PvP->SendUpdateWorldState(EP_CGT_N , bool(m_TowerState & EP_TS_N));
}

bool OPvPCapturePointEP_CGT::HandlePlayerEnter(Player* plr)
{
    if (OPvPCapturePoint::HandlePlayerEnter(plr))
    {
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        return true;
    }
    return false;
}

void OPvPCapturePointEP_CGT::HandlePlayerLeave(Player* plr)
{
    plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 0);
    OPvPCapturePoint::HandlePlayerLeave(plr);
}

void OPvPCapturePointEP_CGT::LinkGraveYard(Team team)
{
    if (m_GraveyardSide != team)
    {
        m_GraveyardSide = team;
        sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, EP_GraveYardZone, team, false);
        sObjectMgr.AddGraveYardLink(EP_GraveYardId, EP_GraveYardZone, team, false);
    }
}

void OPvPCapturePointEP_CGT::UnLinkGraveYard()
{
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, EP_GraveYardZone, ALLIANCE, false);
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, EP_GraveYardZone, HORDE, false);
}

void OPvPCapturePointEP_CGT::SummonSpiritOfVictory(uint32 team)
{
    if (m_SpiritOfVictorySpawned != team)
    {
        m_SpiritOfVictorySpawned = team;
        DelCreature(EP_CGT_SPIRITOFVICTORY);
        AddCreature(EP_CGT_SPIRITOFVICTORY, EP_CGT_SpiritOfVictory[team == ALLIANCE ? 0 : 1].entry, team, EP_CGT_SpiritOfVictory[team == ALLIANCE ? 0 : 1].map, EP_CGT_SpiritOfVictory[team == ALLIANCE ? 0 : 1].x, EP_CGT_SpiritOfVictory[team == ALLIANCE ? 0 : 1].y, EP_CGT_SpiritOfVictory[team == ALLIANCE ? 0 : 1].z, EP_CGT_SpiritOfVictory[team == ALLIANCE ? 0 : 1].o);

        if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_CGT_SPIRITOFVICTORY]))
        {
            pCreature->CastSpell(pCreature, SPELL_SPIRIT_SPAWN_IN, true);
            pCreature->RemoveAllAuras();
            pCreature->AddAura(team == ALLIANCE ? 31954 : 31951);
        }
    }
}

// PWT
OPvPCapturePointEP_PWT::OPvPCapturePointEP_PWT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_FlightMasterSpawned(0), m_TowerState(EP_TS_N)
{
    SetCapturePointData(EPCapturePoints[EP_PWT].entry, EPCapturePoints[EP_PWT].map, EPCapturePoints[EP_PWT].x, EPCapturePoints[EP_PWT].y, EPCapturePoints[EP_PWT].z, EPCapturePoints[EP_PWT].o, EPCapturePoints[EP_PWT].rot0, EPCapturePoints[EP_PWT].rot1, EPCapturePoints[EP_PWT].rot2, EPCapturePoints[EP_PWT].rot3);
    AddObject(EP_PWT_FLAG1, EPTowerFlags[EP_PWT_FLAG1].entry, EPTowerFlags[EP_PWT_FLAG1].map, EPTowerFlags[EP_PWT_FLAG1].x, EPTowerFlags[EP_PWT_FLAG1].y, EPTowerFlags[EP_PWT_FLAG1].z, EPTowerFlags[EP_PWT_FLAG1].o, EPTowerFlags[EP_PWT_FLAG1].rot0, EPTowerFlags[EP_PWT_FLAG1].rot1, EPTowerFlags[EP_PWT_FLAG1].rot2, EPTowerFlags[EP_PWT_FLAG1].rot3);
    AddObject(EP_PWT_FLAG2, EPTowerFlags[EP_PWT_FLAG2].entry, EPTowerFlags[EP_PWT_FLAG2].map, EPTowerFlags[EP_PWT_FLAG2].x, EPTowerFlags[EP_PWT_FLAG2].y, EPTowerFlags[EP_PWT_FLAG2].z, EPTowerFlags[EP_PWT_FLAG2].o, EPTowerFlags[EP_PWT_FLAG2].rot0, EPTowerFlags[EP_PWT_FLAG2].rot1, EPTowerFlags[EP_PWT_FLAG2].rot2, EPTowerFlags[EP_PWT_FLAG2].rot3);
}

void OPvPCapturePointEP_PWT::ChangeState()
{
    // if changing from controlling alliance to horde or vice versa
    if (m_OldState == OBJECTIVESTATE_ALLIANCE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = 0;
    }
    else if (m_OldState == OBJECTIVESTATE_HORDE && m_OldState != m_State)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_State)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = EP_TS_A;
            artkit = 2;
            animation = 1;
            SummonFlightMaster(ALLIANCE);
            DelCreature(EP_PWT_BUFFER);
            AddCreature(EP_PWT_BUFFER, EPBufferNPCs[EP_BUFFER_PWT_A].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_PWT_A].map, EPBufferNPCs[EP_BUFFER_PWT_A].x, EPBufferNPCs[EP_BUFFER_PWT_A].y, EPBufferNPCs[EP_BUFFER_PWT_A].z, EPBufferNPCs[EP_BUFFER_PWT_A].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_PWT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = ALLIANCE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_PWT_TAKEN_A));
            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = EP_TS_H;
            artkit = 1;
            animation = 0;
            SummonFlightMaster(HORDE);
            DelCreature(EP_PWT_BUFFER);
            AddCreature(EP_PWT_BUFFER, EPBufferNPCs[EP_BUFFER_PWT_H].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_PWT_H].map, EPBufferNPCs[EP_BUFFER_PWT_H].x, EPBufferNPCs[EP_BUFFER_PWT_H].y, EPBufferNPCs[EP_BUFFER_PWT_H].z, EPBufferNPCs[EP_BUFFER_PWT_H].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_PWT_BUFFER]))
            {
                pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, true);
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
            }
            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = HORDE;
            if (m_OldState != m_State) sWorld.SendZoneText(EP_GraveYardZone, sObjectMgr.GetBroadcastText(BCT_EP_PWT_TAKEN_H));
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = EP_TS_N;
            DelCreature(EP_PWT_FLIGHTMASTER);
            m_FlightMasterSpawned = 0;
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_ALLIANCE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_A;
            break;
        }
        case OBJECTIVESTATE_HORDE_ALLIANCE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_A;
            DelCreature(EP_PWT_FLIGHTMASTER);
            m_FlightMasterSpawned = 0;
            break;
        }
        case OBJECTIVESTATE_NEUTRAL_HORDE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_H;
            break;
        }
        case OBJECTIVESTATE_ALLIANCE_HORDE_CHALLENGE:
        {
            m_TowerState = EP_TS_N_H;
            DelCreature(EP_PWT_FLIGHTMASTER);
            m_FlightMasterSpawned = 0;
            break;
        }
    }

    GameObject* flag = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid());
    GameObject* flag2 = m_PvP->GetGameObject(m_Objects[EP_PWT_FLAG1]);
    GameObject* flag3 = m_PvP->GetGameObject(m_Objects[EP_PWT_FLAG2]);
    if (flag)
    {
        flag->SetGoArtKit(artkit);
        flag->SendGameObjectCustomAnim(animation);
    }
    else
        sLog.outBasic("[OPvPCapturePointEP_PWT::ChangeState] no flag");

    if (flag2)
    {
        flag2->SetGoArtKit(artkit);
        flag2->SendGameObjectCustomAnim(animation);
    }
    if (flag3)
    {
        flag3->SetGoArtKit(artkit);
        flag3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // complete quest objective
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_PWT_CM, 0);
}

void OPvPCapturePointEP_PWT::SendChangePhase()
{
    // send this too, sometimes the slider disappears, dunno why :(
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
    // send these updates to only the ones in this objective
    uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
    // send this too, sometimes it resets :S
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
}

uint32 OPvPCapturePointEP_PWT::FillInitialWorldStates(WorldPacket& data)
{
    data << EP_PWT_A << uint32(bool(m_TowerState & EP_TS_A));
    data << EP_PWT_H << uint32(bool(m_TowerState & EP_TS_H));
    data << EP_PWT_N_A << uint32(bool(m_TowerState & EP_TS_N_A));
    data << EP_PWT_N_H << uint32(bool(m_TowerState & EP_TS_N_H));
    data << EP_PWT_N << uint32(bool(m_TowerState & EP_TS_N));
    return 5;
}

void OPvPCapturePointEP_PWT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(EP_PWT_A , bool(m_TowerState & EP_TS_A));
    m_PvP->SendUpdateWorldState(EP_PWT_H , bool(m_TowerState & EP_TS_H));
    m_PvP->SendUpdateWorldState(EP_PWT_N_A , bool(m_TowerState & EP_TS_N_A));
    m_PvP->SendUpdateWorldState(EP_PWT_N_H , bool(m_TowerState & EP_TS_N_H));
    m_PvP->SendUpdateWorldState(EP_PWT_N , bool(m_TowerState & EP_TS_N));
}

bool OPvPCapturePointEP_PWT::HandlePlayerEnter(Player* plr)
{
    if (OPvPCapturePoint::HandlePlayerEnter(plr))
    {
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        uint32 phase = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, phase);
        plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        return true;
    }
    return false;
}

void OPvPCapturePointEP_PWT::HandlePlayerLeave(Player* plr)
{
    plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 0);
    OPvPCapturePoint::HandlePlayerLeave(plr);
}

void OPvPCapturePointEP_PWT::SummonFlightMaster(uint32 team)
{
    if (m_FlightMasterSpawned != team)
    {
        m_FlightMasterSpawned = team;
        DelCreature(EP_PWT_FLIGHTMASTER);
        AddCreature(EP_PWT_FLIGHTMASTER, EP_PWT_FlightMaster.entry, team, EP_PWT_FlightMaster.map, EP_PWT_FlightMaster.x, EP_PWT_FlightMaster.y, EP_PWT_FlightMaster.z, EP_PWT_FlightMaster.o);

        if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_PWT_FLIGHTMASTER]))
        {
            pCreature->CastSpell(pCreature, SPELL_SPIRIT_SPAWN_IN, true);
            pCreature->SetFactionTemplateId(team == ALLIANCE ? 774 : 775);
            pCreature->RemoveAllAuras();
            pCreature->AddAura(team == ALLIANCE ? 17327 : 31309);
        }
    }
}

// ep
OutdoorPvPEP::OutdoorPvPEP()
{
    m_TypeId = OUTDOOR_PVP_EP;
    memset(EP_Controls, 0, sizeof(EP_Controls));
    m_AllianceTowersControlled = 0;
    m_HordeTowersControlled = 0;
}

bool OutdoorPvPEP::SetupZoneScript()
{
    for (uint32 i : EPBuffZones)
        RegisterZone(i);

    AddCapturePoint(new OPvPCapturePointEP_EWT(this));
    AddCapturePoint(new OPvPCapturePointEP_PWT(this));
    AddCapturePoint(new OPvPCapturePointEP_CGT(this));
    AddCapturePoint(new OPvPCapturePointEP_NPT(this));
    return true;
}

void OutdoorPvPEP::Update(uint32 diff)
{
    OutdoorPvP::Update(diff);
    if (m_objective_changed)
    {
        m_AllianceTowersControlled = 0;
        m_HordeTowersControlled = 0;
        for (uint32 i : EP_Controls)
        {
            if (i == ALLIANCE)
                ++m_AllianceTowersControlled;
            else if (i == HORDE)
                ++m_HordeTowersControlled;
            SendUpdateWorldState(EP_UI_TOWER_COUNT_A, m_AllianceTowersControlled);
            SendUpdateWorldState(EP_UI_TOWER_COUNT_H, m_HordeTowersControlled);
            BuffTeams();
        }
    }
}

void OutdoorPvPEP::OnPlayerEnter(Player* plr)
{
    // add buffs
    if (plr->GetTeam() == ALLIANCE)
    {
        if (m_AllianceTowersControlled && m_AllianceTowersControlled < 5)
            plr->CastSpell(plr, EP_AllianceBuffs[m_AllianceTowersControlled - 1], true);
    }
    else
    {
        if (m_HordeTowersControlled && m_HordeTowersControlled < 5)
            plr->CastSpell(plr, EP_HordeBuffs[m_HordeTowersControlled - 1], true);
    }
    OutdoorPvP::OnPlayerEnter(plr);
}

void OutdoorPvPEP::OnPlayerLeave(Player* plr)
{
    // remove buffs
    if (plr->GetTeam() == ALLIANCE)
    {
        for (uint32 i : EP_AllianceBuffs)
            plr->RemoveAurasDueToSpell(i);
    }
    else
    {
        for (uint32 i : EP_HordeBuffs)
            plr->RemoveAurasDueToSpell(i);
    }
    OutdoorPvP::OnPlayerLeave(plr);
}

void OutdoorPvPEP::BuffTeams()
{
    for (const auto plr : m_players[0])
    {
        {
            for (uint32 i : EP_AllianceBuffs)
                plr->RemoveAurasDueToSpell(i);

            if (m_AllianceTowersControlled && m_AllianceTowersControlled < 5)
                plr->CastSpell(plr, EP_AllianceBuffs[m_AllianceTowersControlled - 1], true);
        }
    }
    for (const auto plr : m_players[1])
    {
        {
            for (uint32 i : EP_HordeBuffs)
                plr->RemoveAurasDueToSpell(i);

            if (m_HordeTowersControlled && m_HordeTowersControlled < 5)
                plr->CastSpell(plr, EP_HordeBuffs[m_HordeTowersControlled - 1], true);
        }
    }
}

uint32 OutdoorPvPEP::FillInitialWorldStates(WorldPacket& data)
{
    data << EP_UI_TOWER_COUNT_A << m_AllianceTowersControlled;
    data << EP_UI_TOWER_COUNT_H << m_HordeTowersControlled;
    data << EP_UI_TOWER_SLIDER_DISPLAY << uint32(0);
    data << EP_UI_TOWER_SLIDER_POS << uint32(50);
    data << EP_UI_TOWER_SLIDER_N << uint32(100);
    uint32 count = 5;
    for (const auto& itr : m_capturePoints)
        count += itr.second->FillInitialWorldStates(data);
    return count;
}

void OutdoorPvPEP::SendRemoveWorldStates(Player* plr)
{
    plr->SendUpdateWorldState(EP_UI_TOWER_COUNT_A, 0);
    plr->SendUpdateWorldState(EP_UI_TOWER_COUNT_H, 0);
    plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 0);
    plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, 0);
    plr->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, 0);

    plr->SendUpdateWorldState(EP_EWT_A, 0);
    plr->SendUpdateWorldState(EP_EWT_H, 0);
    plr->SendUpdateWorldState(EP_EWT_N, 0);
    plr->SendUpdateWorldState(EP_EWT_N_A, 0);
    plr->SendUpdateWorldState(EP_EWT_N_H, 0);

    plr->SendUpdateWorldState(EP_PWT_A, 0);
    plr->SendUpdateWorldState(EP_PWT_H, 0);
    plr->SendUpdateWorldState(EP_PWT_N, 0);
    plr->SendUpdateWorldState(EP_PWT_N_A, 0);
    plr->SendUpdateWorldState(EP_PWT_N_H, 0);

    plr->SendUpdateWorldState(EP_NPT_A, 0);
    plr->SendUpdateWorldState(EP_NPT_H, 0);
    plr->SendUpdateWorldState(EP_NPT_N, 0);
    plr->SendUpdateWorldState(EP_NPT_N_A, 0);
    plr->SendUpdateWorldState(EP_NPT_N_H, 0);

    plr->SendUpdateWorldState(EP_CGT_A, 0);
    plr->SendUpdateWorldState(EP_CGT_H, 0);
    plr->SendUpdateWorldState(EP_CGT_N, 0);
    plr->SendUpdateWorldState(EP_CGT_N_A, 0);
    plr->SendUpdateWorldState(EP_CGT_N_H, 0);
}

class OutdoorPvP_eastern_plaguelands : public ZoneScript_Script
{
public:

    OutdoorPvP_eastern_plaguelands()
        : ZoneScript_Script()
    {
    }
    uint32 GetMapId() const
    {
        return 0;
    }
    ZoneScript* GetZoneScript() const
    {
        return new OutdoorPvPEP();
    }
};

void AddSC_outdoorpvp_ep()
{
    sZoneScriptMgr.AddScript(new OutdoorPvP_eastern_plaguelands());
}

#endif
