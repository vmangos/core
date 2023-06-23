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
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_state)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = EP_TS_A;
            artkit = 2;
            animation = 1;

            SummonSquadAtEastWallTower(ALLIANCE);

            DelCreature(EP_EWT_BUFFER);
            AddCreature(EP_EWT_BUFFER, EPBufferNPCs[EP_BUFFER_EWT_A].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_EWT_A].map, EPBufferNPCs[EP_BUFFER_EWT_A].x, EPBufferNPCs[EP_BUFFER_EWT_A].y, EPBufferNPCs[EP_BUFFER_EWT_A].z, EPBufferNPCs[EP_BUFFER_EWT_A].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_EWT_BUFFER]))
            {
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = ALLIANCE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_EWT_TAKEN_A, EP_Zone);

            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = EP_TS_H;
            artkit = 1;
            animation = 0;

            SummonSquadAtEastWallTower(HORDE);

            DelCreature(EP_EWT_BUFFER);
            AddCreature(EP_EWT_BUFFER, EPBufferNPCs[EP_BUFFER_EWT_H].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_EWT_H].map, EPBufferNPCs[EP_BUFFER_EWT_H].x, EPBufferNPCs[EP_BUFFER_EWT_H].y, EPBufferNPCs[EP_BUFFER_EWT_H].z, EPBufferNPCs[EP_BUFFER_EWT_H].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_EWT_BUFFER]))
            {
                pCreature->PlayDirectSound(SOUND_PVPWARNINGHORDELONG);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_EWT] = HORDE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_EWT_TAKEN_H, EP_Zone);

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

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->SetGoArtKit(artkit);
        pBanner1->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[EP_EWT_FLAG1]))
    {
        pBanner2->SetGoArtKit(artkit);
        pBanner2->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[EP_EWT_FLAG2]))
    {
        pBanner3->SetGoArtKit(artkit);
        pBanner3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // Complete quest objective.
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_EWT_CM, 0);
}

void OPvPCapturePointEP_EWT::SendChangePhase()
{
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
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
    m_PvP->SendUpdateWorldState(EP_EWT_N, bool(m_TowerState & EP_TS_N));
}

bool OPvPCapturePointEP_EWT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
        /*
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
        */
        return true;
    }
    return false;
}

void OPvPCapturePointEP_EWT::HandlePlayerLeave(Player* pPlayer)
{
    OPvPCapturePoint::HandlePlayerLeave(pPlayer);
}

void OPvPCapturePointEP_EWT::SummonSquadAtEastWallTower(uint32 team)
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

            bool asActiveObject = false;
            switch (ct[i].entry)
            {
                case NPC_LORDAERON_COMMANDER:
                case NPC_LORDAERON_SOLDIER:
                case NPC_LORDAERON_VETERAN:
                case NPC_LORDAERON_FIGHTER:
                    asActiveObject = true;
            }

            AddCreature(i, ct[i].entry, ct[i].teamval, ct[i].map, ct[i].x, ct[i].y, ct[i].z, ct[i].o, 1000000, asActiveObject);

            if (ct[i].entry == NPC_LORDAERON_SOLDIER || ct[i].entry == NPC_LORDAERON_FIGHTER)
            {
                if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[i]))
                {
                    if (Creature* pCommander = m_PvP->GetCreature(m_Creatures[0])) // 0 = Lordaeron Commander (Alliance) or Lordaeron Veteran (Horde).
                        pCreature->JoinCreatureGroup(pCommander, ATTACK_DISTANCE, pCommander->GetAngle(pCreature) - pCreature->GetOrientation(), OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER);
                }
            }
        }
    }
}

OPvPCapturePointEP_NPT::OPvPCapturePointEP_NPT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_TowerState(EP_TS_N), m_SummonedShrineSide(0)
{
    SetCapturePointData(EPCapturePoints[EP_NPT].entry, EPCapturePoints[EP_NPT].map, EPCapturePoints[EP_NPT].x, EPCapturePoints[EP_NPT].y, EPCapturePoints[EP_NPT].z, EPCapturePoints[EP_NPT].o, EPCapturePoints[EP_NPT].rot0, EPCapturePoints[EP_NPT].rot1, EPCapturePoints[EP_NPT].rot2, EPCapturePoints[EP_NPT].rot3);
    AddObject(EP_NPT_FLAG1, EPTowerFlags[EP_NPT_FLAG1].entry, EPTowerFlags[EP_NPT_FLAG1].map, EPTowerFlags[EP_NPT_FLAG1].x, EPTowerFlags[EP_NPT_FLAG1].y, EPTowerFlags[EP_NPT_FLAG1].z, EPTowerFlags[EP_NPT_FLAG1].o, EPTowerFlags[EP_NPT_FLAG1].rot0, EPTowerFlags[EP_NPT_FLAG1].rot1, EPTowerFlags[EP_NPT_FLAG1].rot2, EPTowerFlags[EP_NPT_FLAG1].rot3);
    AddObject(EP_NPT_FLAG2, EPTowerFlags[EP_NPT_FLAG2].entry, EPTowerFlags[EP_NPT_FLAG2].map, EPTowerFlags[EP_NPT_FLAG2].x, EPTowerFlags[EP_NPT_FLAG2].y, EPTowerFlags[EP_NPT_FLAG2].z, EPTowerFlags[EP_NPT_FLAG2].o, EPTowerFlags[EP_NPT_FLAG2].rot0, EPTowerFlags[EP_NPT_FLAG2].rot1, EPTowerFlags[EP_NPT_FLAG2].rot2, EPTowerFlags[EP_NPT_FLAG2].rot3);
}

void OPvPCapturePointEP_NPT::ChangeState()
{
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_state)
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
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = ALLIANCE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_NPT_TAKEN_A, EP_Zone);

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
                pCreature->PlayDirectSound(SOUND_PVPWARNINGHORDELONG);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_NPT] = HORDE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_NPT_TAKEN_H, EP_Zone);

            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = EP_TS_N;
            m_SummonedShrineSide = 0;
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
            m_SummonedShrineSide = 0;
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
            m_SummonedShrineSide = 0;
            DelObject(EP_NPT_CURING_SHRINE);
            DelObject(EP_NPT_BANNER_AURA);
            break;
        }
    }

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->SetGoArtKit(artkit);
        pBanner1->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[EP_NPT_FLAG1]))
    {
        pBanner2->SetGoArtKit(artkit);
        pBanner2->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[EP_NPT_FLAG2]))
    {
        pBanner3->SetGoArtKit(artkit);
        pBanner3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // Complete quest objective.
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_NPT_CM, 0);
}

void OPvPCapturePointEP_NPT::SendChangePhase()
{
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
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

bool OPvPCapturePointEP_NPT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
        /*
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
        */
        return true;
    }
    return false;
}

void OPvPCapturePointEP_NPT::HandlePlayerLeave(Player* pPlayer)
{
    OPvPCapturePoint::HandlePlayerLeave(pPlayer);
}

void OPvPCapturePointEP_NPT::SummonCuringShrine(uint32 team)
{
    if (m_SummonedShrineSide != team)
    {
        m_SummonedShrineSide = team;
        DelObject(EP_NPT_CURING_SHRINE);
        DelObject(EP_NPT_BANNER_AURA);
        AddObject(EP_NPT_CURING_SHRINE, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].entry, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].map, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].x, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].y, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].z, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].o, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot0, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot1, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot2, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot3);
        AddObject(EP_NPT_BANNER_AURA, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].entry, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].map, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].x, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].y, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].z, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].o, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot0, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot1, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot2, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot3);
    }
}

OPvPCapturePointEP_CGT::OPvPCapturePointEP_CGT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_SpiritOfVictorySpawned(0), m_TowerState(EP_TS_N), m_GraveyardSide(TEAM_NONE), m_SummonedBannerSide(0)
{
    UnLinkGraveYard();
    SetCapturePointData(EPCapturePoints[EP_CGT].entry, EPCapturePoints[EP_CGT].map, EPCapturePoints[EP_CGT].x, EPCapturePoints[EP_CGT].y, EPCapturePoints[EP_CGT].z, EPCapturePoints[EP_CGT].o, EPCapturePoints[EP_CGT].rot0, EPCapturePoints[EP_CGT].rot1, EPCapturePoints[EP_CGT].rot2, EPCapturePoints[EP_CGT].rot3);
    AddObject(EP_CGT_FLAG1, EPTowerFlags[EP_CGT_FLAG1].entry, EPTowerFlags[EP_CGT_FLAG1].map, EPTowerFlags[EP_CGT_FLAG1].x, EPTowerFlags[EP_CGT_FLAG1].y, EPTowerFlags[EP_CGT_FLAG1].z, EPTowerFlags[EP_CGT_FLAG1].o, EPTowerFlags[EP_CGT_FLAG1].rot0, EPTowerFlags[EP_CGT_FLAG1].rot1, EPTowerFlags[EP_CGT_FLAG1].rot2, EPTowerFlags[EP_CGT_FLAG1].rot3);
    AddObject(EP_CGT_FLAG2, EPTowerFlags[EP_CGT_FLAG2].entry, EPTowerFlags[EP_CGT_FLAG2].map, EPTowerFlags[EP_CGT_FLAG2].x, EPTowerFlags[EP_CGT_FLAG2].y, EPTowerFlags[EP_CGT_FLAG2].z, EPTowerFlags[EP_CGT_FLAG2].o, EPTowerFlags[EP_CGT_FLAG2].rot0, EPTowerFlags[EP_CGT_FLAG2].rot1, EPTowerFlags[EP_CGT_FLAG2].rot2, EPTowerFlags[EP_CGT_FLAG2].rot3);
}

void OPvPCapturePointEP_CGT::ChangeState()
{
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_state)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = EP_TS_A;
            artkit = 2;
            animation = 1;

            LinkGraveYard(ALLIANCE);
            SummonSpiritOfVictory(ALLIANCE);
            SummonBannerAura(ALLIANCE);

            DelCreature(EP_CGT_BUFFER);
            AddCreature(EP_CGT_BUFFER, EPBufferNPCs[EP_BUFFER_CGT_A].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_CGT_A].map, EPBufferNPCs[EP_BUFFER_CGT_A].x, EPBufferNPCs[EP_BUFFER_CGT_A].y, EPBufferNPCs[EP_BUFFER_CGT_A].z, EPBufferNPCs[EP_BUFFER_CGT_A].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_CGT_BUFFER]))
            {
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = ALLIANCE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_CGT_TAKEN_A, EP_Zone);

            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = EP_TS_H;
            artkit = 1;
            animation = 0;

            LinkGraveYard(HORDE);
            SummonSpiritOfVictory(HORDE);
            SummonBannerAura(HORDE);

            DelCreature(EP_CGT_BUFFER);
            AddCreature(EP_CGT_BUFFER, EPBufferNPCs[EP_BUFFER_CGT_H].entry, ALLIANCE, EPBufferNPCs[EP_BUFFER_CGT_H].map, EPBufferNPCs[EP_BUFFER_CGT_H].x, EPBufferNPCs[EP_BUFFER_CGT_H].y, EPBufferNPCs[EP_BUFFER_CGT_H].z, EPBufferNPCs[EP_BUFFER_CGT_H].o);
            if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_CGT_BUFFER]))
            {
                pCreature->PlayDirectSound(SOUND_PVPWARNINGHORDELONG);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_CGT] = HORDE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_CGT_TAKEN_H, EP_Zone);

            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            DelCreature(EP_CGT_SPIRITOFVICTORY);
            m_SpiritOfVictorySpawned = 0;
            m_SummonedBannerSide = 0;
            DelObject(EP_CGT_BANNER_AURA);
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
            m_SummonedBannerSide = 0;
            DelObject(EP_CGT_BANNER_AURA);
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
            m_SummonedBannerSide = 0;
            DelObject(EP_CGT_BANNER_AURA);
            UnLinkGraveYard();
            m_TowerState = EP_TS_N_H;
            break;
        }
    }

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->SetGoArtKit(artkit);
        pBanner1->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[EP_CGT_FLAG1]))
    {
        pBanner2->SetGoArtKit(artkit);
        pBanner2->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[EP_CGT_FLAG2]))
    {
        pBanner3->SetGoArtKit(artkit);
        pBanner3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // Complete quest objective.
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_CGT_CM, 0);
}

void OPvPCapturePointEP_CGT::SendChangePhase()
{
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
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

bool OPvPCapturePointEP_CGT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
        /*
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
        */
        return true;
    }
    return false;
}

void OPvPCapturePointEP_CGT::HandlePlayerLeave(Player* pPlayer)
{
    OPvPCapturePoint::HandlePlayerLeave(pPlayer);
}

void OPvPCapturePointEP_CGT::LinkGraveYard(Team team)
{
    if (m_GraveyardSide != team)
    {
        m_GraveyardSide = team;
        sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, EP_Zone, team, false);
        sObjectMgr.AddGraveYardLink(EP_GraveYardId, EP_Zone, team, false);
        sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, TFV_area, team, false);
        sObjectMgr.AddGraveYardLink(EP_GraveYardId, TFV_area, team, false);
    }
}

void OPvPCapturePointEP_CGT::UnLinkGraveYard()
{
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, EP_Zone, ALLIANCE, false);
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, EP_Zone, HORDE, false);
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, TFV_area, ALLIANCE, false);
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, TFV_area, HORDE, false);
}

void OPvPCapturePointEP_CGT::SummonBannerAura(uint32 team)
{
    if (m_SummonedBannerSide != team)
    {
        m_SummonedBannerSide = team;
        DelObject(EP_CGT_BANNER_AURA);
        AddObject(EP_CGT_BANNER_AURA, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].entry, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].map, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].x, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].y, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].z, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].o, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot0, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot1, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot2, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot3);
    }
}

void OPvPCapturePointEP_CGT::SummonSpiritOfVictory(uint32 team)
{
    if (m_SpiritOfVictorySpawned != team)
    {
        m_SpiritOfVictorySpawned = team;
        DelCreature(EP_CGT_SPIRITOFVICTORY);
        AddCreature(EP_CGT_SPIRITOFVICTORY, EP_CGT_SpiritOfVictory.entry, team, EP_CGT_SpiritOfVictory.map, EP_CGT_SpiritOfVictory.x, EP_CGT_SpiritOfVictory.y, EP_CGT_SpiritOfVictory.z, EP_CGT_SpiritOfVictory.o, 0, true);

        if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EP_CGT_SPIRITOFVICTORY]))
        {
            pCreature->CastSpell(pCreature, SPELL_SPIRIT_SPAWN_IN, true);
            pCreature->RemoveAllAuras();
            pCreature->AddAura(team == ALLIANCE ? SPELL_SPIRIT_PARTICLES_SUPER_BIG_DND : SPELL_SPIRIT_PARTICLES_RED_SUPER_BIG_DND);
            pCreature->GetMotionMaster()->Clear(false, true);
            pCreature->GetMotionMaster()->MoveWaypoint(0, PATH_FROM_SPECIAL, 1000, 0, 18039, false);
        }
    }
}

OPvPCapturePointEP_PWT::OPvPCapturePointEP_PWT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_FlightMasterSpawned(0), m_TowerState(EP_TS_N)
{
    SetCapturePointData(EPCapturePoints[EP_PWT].entry, EPCapturePoints[EP_PWT].map, EPCapturePoints[EP_PWT].x, EPCapturePoints[EP_PWT].y, EPCapturePoints[EP_PWT].z, EPCapturePoints[EP_PWT].o, EPCapturePoints[EP_PWT].rot0, EPCapturePoints[EP_PWT].rot1, EPCapturePoints[EP_PWT].rot2, EPCapturePoints[EP_PWT].rot3);
    AddObject(EP_PWT_FLAG1, EPTowerFlags[EP_PWT_FLAG1].entry, EPTowerFlags[EP_PWT_FLAG1].map, EPTowerFlags[EP_PWT_FLAG1].x, EPTowerFlags[EP_PWT_FLAG1].y, EPTowerFlags[EP_PWT_FLAG1].z, EPTowerFlags[EP_PWT_FLAG1].o, EPTowerFlags[EP_PWT_FLAG1].rot0, EPTowerFlags[EP_PWT_FLAG1].rot1, EPTowerFlags[EP_PWT_FLAG1].rot2, EPTowerFlags[EP_PWT_FLAG1].rot3);
    AddObject(EP_PWT_FLAG2, EPTowerFlags[EP_PWT_FLAG2].entry, EPTowerFlags[EP_PWT_FLAG2].map, EPTowerFlags[EP_PWT_FLAG2].x, EPTowerFlags[EP_PWT_FLAG2].y, EPTowerFlags[EP_PWT_FLAG2].z, EPTowerFlags[EP_PWT_FLAG2].o, EPTowerFlags[EP_PWT_FLAG2].rot0, EPTowerFlags[EP_PWT_FLAG2].rot1, EPTowerFlags[EP_PWT_FLAG2].rot2, EPTowerFlags[EP_PWT_FLAG2].rot3);
}

void OPvPCapturePointEP_PWT::ChangeState()
{
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = 0;
    }

    uint32 artkit = 21;
    uint32 animation = 2;

    switch (m_state)
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
                pCreature->PlayDirectSound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = ALLIANCE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_PWT_TAKEN_A, EP_Zone);

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
                pCreature->PlayDirectSound(SOUND_PVPWARNINGHORDELONG);
                ((OutdoorPvPEP*)m_PvP)->TowerBuff(pCreature);
            }

            ((OutdoorPvPEP*)m_PvP)->EP_Controls[EP_PWT] = HORDE;

            if (m_oldState != m_state)
                ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EP_PWT_TAKEN_H, EP_Zone);

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

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->SetGoArtKit(artkit);
        pBanner1->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[EP_PWT_FLAG1]))
    {
        pBanner2->SetGoArtKit(artkit);
        pBanner2->SendGameObjectCustomAnim(animation);
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[EP_PWT_FLAG2]))
    {
        pBanner3->SetGoArtKit(artkit);
        pBanner3->SendGameObjectCustomAnim(animation);
    }

    UpdateTowerState();

    // Complete quest objective.
    if (m_TowerState == EP_TS_A || m_TowerState == EP_TS_H)
        SendObjectiveComplete(EP_PWT_CM, 0);
}

void OPvPCapturePointEP_PWT::SendChangePhase()
{
    SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
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

bool OPvPCapturePointEP_PWT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
        /*
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 1);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, m_neutralValuePct);
        pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, m_valuePct);
        */
        return true;
    }
    return false;
}

void OPvPCapturePointEP_PWT::HandlePlayerLeave(Player* pPlayer)
{
    OPvPCapturePoint::HandlePlayerLeave(pPlayer);
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
            pCreature->SetFactionTemplateId(team == ALLIANCE ? 774 : 775);
            pCreature->RemoveAllAuras();
            pCreature->AddAura(team == ALLIANCE ? SPELL_SPIRIT_PARTICLES : SPELL_SPIRIT_PARTICLES_RED_BIG);
        }
    }
}

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

        if (m_AllianceTowersControlled == 4)
            GetMap()->SendDefenseMessage(BCT_EP_ALL_TAKEN_A, EP_Zone);
        else if (m_HordeTowersControlled == 4)
            GetMap()->SendDefenseMessage(BCT_EP_ALL_TAKEN_H, EP_Zone);
    }
    OutdoorPvP::Update(diff);
}

void OutdoorPvPEP::OnPlayerEnter(Player* pPlayer)
{
    // Add buffs.
    if (pPlayer->GetTeam() == ALLIANCE)
    {
        if (m_AllianceTowersControlled && m_AllianceTowersControlled < 5)
            pPlayer->CastSpell(pPlayer, EP_AllianceBuffs[m_AllianceTowersControlled - 1], true);
    }
    else
    {
        if (m_HordeTowersControlled && m_HordeTowersControlled < 5)
            pPlayer->CastSpell(pPlayer, EP_HordeBuffs[m_HordeTowersControlled - 1], true);
    }
    OutdoorPvP::OnPlayerEnter(pPlayer);
}

void OutdoorPvPEP::OnPlayerLeave(Player* pPlayer)
{
    // Remove buffs.
    if (pPlayer->GetTeam() == ALLIANCE)
    {
        for (uint32 i : EP_AllianceBuffs)
            pPlayer->RemoveAurasDueToSpell(i);
    }
    else
    {
        for (uint32 i : EP_HordeBuffs)
            pPlayer->RemoveAurasDueToSpell(i);
    }
    OutdoorPvP::OnPlayerLeave(pPlayer);
}

void OutdoorPvPEP::TowerBuff(Creature* pCreature)
{
    std::list<Player*> players;
    pCreature->GetAlivePlayerListInRange(pCreature, players, VISIBILITY_DISTANCE_NORMAL);
    for (const auto& pTarget : players)
    {
        if (!pTarget->IsFriendlyTo(pCreature))
            continue;

        if (pTarget->HasStealthAura())
            continue;

        pTarget->CastSpell(pTarget, SPELL_TOWER_CAPTURE_DND, true);
    }
}

void OutdoorPvPEP::BuffTeams()
{
    for (const auto pPlayer : m_players[0])
    {
        {
            for (uint32 i : EP_AllianceBuffs)
                pPlayer->RemoveAurasDueToSpell(i);

            if (m_AllianceTowersControlled && m_AllianceTowersControlled < 5)
                pPlayer->CastSpell(pPlayer, EP_AllianceBuffs[m_AllianceTowersControlled - 1], true);
        }
    }
    for (const auto pPlayer : m_players[1])
    {
        {
            for (uint32 i : EP_HordeBuffs)
                pPlayer->RemoveAurasDueToSpell(i);

            if (m_HordeTowersControlled && m_HordeTowersControlled < 5)
                pPlayer->CastSpell(pPlayer, EP_HordeBuffs[m_HordeTowersControlled - 1], true);
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

void OutdoorPvPEP::SendRemoveWorldStates(Player* pPlayer)
{
    pPlayer->SendUpdateWorldState(EP_UI_TOWER_COUNT_A, 0);
    pPlayer->SendUpdateWorldState(EP_UI_TOWER_COUNT_H, 0);
    pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_DISPLAY, 0);
    pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_POS, 0);
    pPlayer->SendUpdateWorldState(EP_UI_TOWER_SLIDER_N, 0);

    pPlayer->SendUpdateWorldState(EP_EWT_A, 0);
    pPlayer->SendUpdateWorldState(EP_EWT_H, 0);
    pPlayer->SendUpdateWorldState(EP_EWT_N, 0);
    pPlayer->SendUpdateWorldState(EP_EWT_N_A, 0);
    pPlayer->SendUpdateWorldState(EP_EWT_N_H, 0);

    pPlayer->SendUpdateWorldState(EP_PWT_A, 0);
    pPlayer->SendUpdateWorldState(EP_PWT_H, 0);
    pPlayer->SendUpdateWorldState(EP_PWT_N, 0);
    pPlayer->SendUpdateWorldState(EP_PWT_N_A, 0);
    pPlayer->SendUpdateWorldState(EP_PWT_N_H, 0);

    pPlayer->SendUpdateWorldState(EP_NPT_A, 0);
    pPlayer->SendUpdateWorldState(EP_NPT_H, 0);
    pPlayer->SendUpdateWorldState(EP_NPT_N, 0);
    pPlayer->SendUpdateWorldState(EP_NPT_N_A, 0);
    pPlayer->SendUpdateWorldState(EP_NPT_N_H, 0);

    pPlayer->SendUpdateWorldState(EP_CGT_A, 0);
    pPlayer->SendUpdateWorldState(EP_CGT_H, 0);
    pPlayer->SendUpdateWorldState(EP_CGT_N, 0);
    pPlayer->SendUpdateWorldState(EP_CGT_N_A, 0);
    pPlayer->SendUpdateWorldState(EP_CGT_N_H, 0);
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
