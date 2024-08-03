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

OPvPCapturePointEP_EWT::OPvPCapturePointEP_EWT(OutdoorPvP* pvp)
    : OPvPCapturePoint(pvp), m_TowerState(TOWERSTATE_NEUTRAL)
{
    SetCapturePointData(EP_CapturePoints[EASTWALL_TOWER].entry, EP_CapturePoints[EASTWALL_TOWER].map, EP_CapturePoints[EASTWALL_TOWER].x, EP_CapturePoints[EASTWALL_TOWER].y, EP_CapturePoints[EASTWALL_TOWER].z, EP_CapturePoints[EASTWALL_TOWER].o, EP_CapturePoints[EASTWALL_TOWER].rot0, EP_CapturePoints[EASTWALL_TOWER].rot1, EP_CapturePoints[EASTWALL_TOWER].rot2, EP_CapturePoints[EASTWALL_TOWER].rot3);
    AddObject(EASTWALL_TOWER_BANNER_1, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].entry, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].map, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].x, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].y, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].z, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].o, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].rot0, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].rot1, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].rot2, EP_TowerFlags[EASTWALL_TOWER_BANNER_1].rot3);
    AddObject(EASTWALL_TOWER_BANNER_2, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].entry, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].map, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].x, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].y, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].z, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].o, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].rot0, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].rot1, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].rot2, EP_TowerFlags[EASTWALL_TOWER_BANNER_2].rot3);
    ChangeState();
}

void OPvPCapturePointEP_EWT::ChangeState()
{
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EASTWALL_TOWER] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[EASTWALL_TOWER] = 0;
    }

    DelCreature(EASTWALL_TOWER_BUFFER);
    DelObject(EASTWALL_TOWER_FLAG_FLARE);

    switch (m_state)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = TOWERSTATE_ALLIANCE;
            PlaySound(SOUND_PVPVICTORYALLIANCE);
            AddObject(EASTWALL_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].entry, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].map, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].x, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].y, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].z, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].o, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].rot0, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].rot1, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].rot2, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_ALLIANCE].rot3);

            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = TOWERSTATE_HORDE;
            PlaySound(SOUND_PVPVICTORYHORDE);
            AddObject(EASTWALL_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].entry, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].map, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].x, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].y, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].z, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].o, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].rot0, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].rot1, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].rot2, EP_TowerFlares[FLAG_FLARE_EASTWALL_TOWER_HORDE].rot3);

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_PROGRESSING:
        {
            UpdateBannerArt(ARTKIT_ALLIANCE, ANIMATION_ALLIANCE);

            if (m_oldState == OBJECTIVESTATE_ALLIANCE)
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGALLIANCE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                SummonSquadAtEastWallTower(ALLIANCE);
                AddCreature(EASTWALL_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_ALLIANCE].entry, ALLIANCE, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_ALLIANCE].map, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_ALLIANCE].x, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_ALLIANCE].y, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_ALLIANCE].z, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_ALLIANCE].o);

                ((OutdoorPvPEP*)m_PvP)->EP_Controls[EASTWALL_TOWER] = ALLIANCE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EASTWALL_TOWER_ALLIANCE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_HORDE_PROGRESSING:
        {
            UpdateBannerArt(ARTKIT_HORDE, ANIMATION_HORDE);

            if (m_oldState == OBJECTIVESTATE_HORDE)
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGHORDE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDHORDE);
                SummonSquadAtEastWallTower(HORDE);
                AddCreature(EASTWALL_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_HORDE].entry, HORDE, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_HORDE].map, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_HORDE].x, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_HORDE].y, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_HORDE].z, EP_BufferNPCs[TOWER_BUFFER_EASTWALL_TOWER_HORDE].o);

                ((OutdoorPvPEP*)m_PvP)->EP_Controls[EASTWALL_TOWER] = HORDE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_EASTWALL_TOWER_HORDE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = TOWERSTATE_NEUTRAL;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);
            RemoveSquad();

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_ALLIANCE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);
            RemoveSquad();

            break;
        }
        case OBJECTIVESTATE_HORDE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_HORDE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);
            RemoveSquad();

            break;
        }
    }

    if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[EASTWALL_TOWER_BUFFER]))
    {
        pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, false);
    }

    UpdateTowerState();
}

void OPvPCapturePointEP_EWT::SendChangePhase()
{
    SendUpdateWorldState(WS_UI_TOWER_SLIDER_POSITION, m_valuePct);
}

uint32 OPvPCapturePointEP_EWT::FillInitialWorldStates(WorldPacket& data)
{
    WriteInitialWorldStatePair(data, WS_EASTWALL_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    WriteInitialWorldStatePair(data, WS_EASTWALL_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    WriteInitialWorldStatePair(data, WS_EASTWALL_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_EASTWALL_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_EASTWALL_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_EASTWALL_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_EASTWALL_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
    return 7;
}

void OPvPCapturePointEP_EWT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(WS_EASTWALL_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    m_PvP->SendUpdateWorldState(WS_EASTWALL_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    m_PvP->SendUpdateWorldState(WS_EASTWALL_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_EASTWALL_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_EASTWALL_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_EASTWALL_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_EASTWALL_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
}

void OPvPCapturePointEP_EWT::UpdateBannerArt(uint32 artkit, uint32 animation)
{
    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        if (pBanner1->GetGoArtKit() != artkit)
        {
            pBanner1->SetGoArtKit(artkit);
            pBanner1->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[EASTWALL_TOWER_BANNER_1]))
    {
        if (pBanner2->GetGoArtKit() != artkit)
        {
            pBanner2->SetGoArtKit(artkit);
            pBanner2->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[EASTWALL_TOWER_BANNER_2]))
    {
        if (pBanner3->GetGoArtKit() != artkit)
        {
            pBanner3->SetGoArtKit(artkit);
            pBanner3->SendGameObjectCustomAnim(animation);
        }
    }
}

void OPvPCapturePointEP_EWT::PlaySound(uint32 sound)
{
    if (!sound)
        return;

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->PlayDirectSound(sound);
    }
}

bool OPvPCapturePointEP_EWT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
        return true;
    }
    return false;
}

void OPvPCapturePointEP_EWT::HandlePlayerLeave(Player* pPlayer)
{
    OPvPCapturePoint::HandlePlayerLeave(pPlayer);
}

void OPvPCapturePointEP_EWT::RemoveSquad()
{
    for (uint8 i = 0; i < EP_SummonsNum; ++i)
    {
        DelCreature(i);
    }
}

void OPvPCapturePointEP_EWT::SummonSquadAtEastWallTower(uint32 team)
{
    const creature_type * ct = nullptr;
    if (team == ALLIANCE)
        ct = EP_EWT_Summons_A;
    else
        ct = EP_EWT_Summons_H;
    
    for (uint8 i = 0; i < EP_SummonsNum; ++i)
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
    
        AddCreature(i, ct[i].entry, ct[i].teamval, ct[i].map, ct[i].x, ct[i].y, ct[i].z, ct[i].o, 0, asActiveObject);
    
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

OPvPCapturePointEP_NPT::OPvPCapturePointEP_NPT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_TowerState(TOWERSTATE_NEUTRAL)
{
    SetCapturePointData(EP_CapturePoints[NORTHPASS_TOWER].entry, EP_CapturePoints[NORTHPASS_TOWER].map, EP_CapturePoints[NORTHPASS_TOWER].x, EP_CapturePoints[NORTHPASS_TOWER].y, EP_CapturePoints[NORTHPASS_TOWER].z, EP_CapturePoints[NORTHPASS_TOWER].o, EP_CapturePoints[NORTHPASS_TOWER].rot0, EP_CapturePoints[NORTHPASS_TOWER].rot1, EP_CapturePoints[NORTHPASS_TOWER].rot2, EP_CapturePoints[NORTHPASS_TOWER].rot3);
    AddObject(NORTHPASS_TOWER_BANNER_1, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].entry, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].map, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].x, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].y, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].z, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].o, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].rot0, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].rot1, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].rot2, EP_TowerFlags[NORTHPASS_TOWER_BANNER_1].rot3);
    AddObject(NORTHPASS_TOWER_BANNER_2, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].entry, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].map, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].x, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].y, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].z, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].o, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].rot0, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].rot1, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].rot2, EP_TowerFlags[NORTHPASS_TOWER_BANNER_2].rot3);
    ChangeState();
}

void OPvPCapturePointEP_NPT::ChangeState()
{
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[NORTHPASS_TOWER] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[NORTHPASS_TOWER] = 0;
    }

    DelCreature(NORTHPASS_TOWER_BUFFER);
    DelObject(NORTHPASS_TOWER_CURING_SHRINE);
    DelObject(NORTHPASS_TOWER_BANNER_AURA);
    DelObject(NORTHPASS_TOWER_FLAG_FLARE);

    switch (m_state)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = TOWERSTATE_ALLIANCE;
            PlaySound(SOUND_PVPVICTORYALLIANCE);
            SummonCuringShrine(ALLIANCE);
            AddObject(NORTHPASS_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].entry, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].map, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].x, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].y, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].z, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].o, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].rot0, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].rot1, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].rot2, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_ALLIANCE].rot3);

            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = TOWERSTATE_HORDE;
            PlaySound(SOUND_PVPVICTORYHORDE);
            SummonCuringShrine(HORDE);
            AddObject(NORTHPASS_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].entry, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].map, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].x, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].y, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].z, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].o, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].rot0, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].rot1, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].rot2, EP_TowerFlares[FLAG_FLARE_NORTHPASS_TOWER_HORDE].rot3);

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_PROGRESSING:
        {
            UpdateBannerArt(ARTKIT_ALLIANCE, ANIMATION_ALLIANCE);
            SummonCuringShrine(ALLIANCE);

            if (m_oldState == OBJECTIVESTATE_ALLIANCE)
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGALLIANCE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                AddCreature(NORTHPASS_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_ALLIANCE].entry, ALLIANCE, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_ALLIANCE].map, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_ALLIANCE].x, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_ALLIANCE].y, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_ALLIANCE].z, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_ALLIANCE].o);

                ((OutdoorPvPEP*)m_PvP)->EP_Controls[NORTHPASS_TOWER] = ALLIANCE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_NORTHPASS_TOWER_ALLIANCE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_HORDE_PROGRESSING:
        {
            UpdateBannerArt(ARTKIT_HORDE, ANIMATION_HORDE);
            SummonCuringShrine(HORDE);

            if (m_oldState == OBJECTIVESTATE_HORDE)
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGHORDE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDHORDE);
                AddCreature(NORTHPASS_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_HORDE].entry, HORDE, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_HORDE].map, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_HORDE].x, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_HORDE].y, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_HORDE].z, EP_BufferNPCs[TOWER_BUFFER_NORTHPASS_TOWER_HORDE].o);

                ((OutdoorPvPEP*)m_PvP)->EP_Controls[NORTHPASS_TOWER] = HORDE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_NORTHPASS_TOWER_HORDE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = TOWERSTATE_NEUTRAL;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_ALLIANCE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
        case OBJECTIVESTATE_HORDE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_HORDE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
    }

    if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[NORTHPASS_TOWER_BUFFER]))
    {
        pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, false);
    }

    UpdateTowerState();
}

void OPvPCapturePointEP_NPT::SendChangePhase()
{
    SendUpdateWorldState(WS_UI_TOWER_SLIDER_POSITION, m_valuePct);
}

uint32 OPvPCapturePointEP_NPT::FillInitialWorldStates(WorldPacket& data)
{
    WriteInitialWorldStatePair(data, WS_NORTHPASS_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    WriteInitialWorldStatePair(data, WS_NORTHPASS_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    WriteInitialWorldStatePair(data, WS_NORTHPASS_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_NORTHPASS_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_NORTHPASS_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_NORTHPASS_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_NORTHPASS_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
    return 7;
}

void OPvPCapturePointEP_NPT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(WS_NORTHPASS_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    m_PvP->SendUpdateWorldState(WS_NORTHPASS_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    m_PvP->SendUpdateWorldState(WS_NORTHPASS_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_NORTHPASS_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_NORTHPASS_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_NORTHPASS_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_NORTHPASS_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
}

void OPvPCapturePointEP_NPT::UpdateBannerArt(uint32 artkit, uint32 animation)
{
    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        if (pBanner1->GetGoArtKit() != artkit)
        {
            pBanner1->SetGoArtKit(artkit);
            pBanner1->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[NORTHPASS_TOWER_BANNER_1]))
    {
        if (pBanner2->GetGoArtKit() != artkit)
        {
            pBanner2->SetGoArtKit(artkit);
            pBanner2->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[NORTHPASS_TOWER_BANNER_2]))
    {
        if (pBanner3->GetGoArtKit() != artkit)
        {
            pBanner3->SetGoArtKit(artkit);
            pBanner3->SendGameObjectCustomAnim(animation);
        }
    }
}

void OPvPCapturePointEP_NPT::PlaySound(uint32 sound)
{
    if (!sound)
        return;

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->PlayDirectSound(sound);
    }
}

bool OPvPCapturePointEP_NPT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
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
    AddObject(NORTHPASS_TOWER_CURING_SHRINE, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].entry, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].map, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].x, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].y, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].z, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].o, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot0, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot1, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot2, EP_NPT_LordaeronShrine[team == ALLIANCE ? 0 : 2].rot3);
    AddObject(NORTHPASS_TOWER_BANNER_AURA, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].entry, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].map, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].x, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].y, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].z, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].o, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot0, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot1, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot2, EP_NPT_LordaeronShrine[team == ALLIANCE ? 1 : 3].rot3);
    if (GameObject* pGameObject = m_PvP->GetGameObject(m_Objects[NORTHPASS_TOWER_CURING_SHRINE]))
    {
        pGameObject->SetSpawnedByDefault(true);
    }
}

OPvPCapturePointEP_CGT::OPvPCapturePointEP_CGT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_TowerState(TOWERSTATE_NEUTRAL)
{
    UnLinkGraveYard();
    SetCapturePointData(EP_CapturePoints[CROWN_GUARD_TOWER].entry, EP_CapturePoints[CROWN_GUARD_TOWER].map, EP_CapturePoints[CROWN_GUARD_TOWER].x, EP_CapturePoints[CROWN_GUARD_TOWER].y, EP_CapturePoints[CROWN_GUARD_TOWER].z, EP_CapturePoints[CROWN_GUARD_TOWER].o, EP_CapturePoints[CROWN_GUARD_TOWER].rot0, EP_CapturePoints[CROWN_GUARD_TOWER].rot1, EP_CapturePoints[CROWN_GUARD_TOWER].rot2, EP_CapturePoints[CROWN_GUARD_TOWER].rot3);
    AddObject(CROWN_GUARD_TOWER_BANNER_1, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].entry, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].map, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].x, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].y, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].z, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].o, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].rot0, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].rot1, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].rot2, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_1].rot3);
    AddObject(CROWN_GUARD_TOWER_BANNER_2, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].entry, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].map, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].x, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].y, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].z, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].o, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].rot0, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].rot1, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].rot2, EP_TowerFlags[CROWN_GUARD_TOWER_BANNER_2].rot3);
    ChangeState();
}

void OPvPCapturePointEP_CGT::ChangeState()
{
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[CROWN_GUARD_TOWER] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[CROWN_GUARD_TOWER] = 0;
    }

    DelCreature(CROWN_GUARD_TOWER_BUFFER);
    DelObject(CROWN_GUARD_TOWER_BANNER_AURA);
    DelObject(CROWN_GUARD_TOWER_FLAG_FLARE);
    UnLinkGraveYard();

    switch (m_state)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = TOWERSTATE_ALLIANCE;
            PlaySound(SOUND_PVPVICTORYALLIANCE);
            LinkGraveYard(ALLIANCE);
            SummonBannerAura(ALLIANCE);
            AddObject(CROWN_GUARD_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].entry, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].map, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].x, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].y, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].z, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].o, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].rot0, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].rot1, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].rot2, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_ALLIANCE].rot3);

            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = TOWERSTATE_HORDE;
            PlaySound(SOUND_PVPVICTORYHORDE);
            LinkGraveYard(HORDE);
            SummonBannerAura(HORDE);
            AddObject(CROWN_GUARD_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].entry, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].map, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].x, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].y, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].z, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].o, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].rot0, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].rot1, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].rot2, EP_TowerFlares[FLAG_FLARE_CROWN_GUARD_TOWER_HORDE].rot3);

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_PROGRESSING:
        {
            SummonBannerAura(ALLIANCE);
            LinkGraveYard(ALLIANCE);
            UpdateBannerArt(ARTKIT_ALLIANCE, ANIMATION_ALLIANCE);

            if (m_oldState == OBJECTIVESTATE_ALLIANCE)
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGALLIANCE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                SummonSpiritOfVictory(ALLIANCE);
                AddCreature(CROWN_GUARD_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_ALLIANCE].entry, ALLIANCE, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_ALLIANCE].map, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_ALLIANCE].x, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_ALLIANCE].y, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_ALLIANCE].z, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_ALLIANCE].o);

                ((OutdoorPvPEP*)m_PvP)->EP_Controls[CROWN_GUARD_TOWER] = ALLIANCE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_CROWN_GUARD_TOWER_ALLIANCE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_HORDE_PROGRESSING:
        {
            SummonBannerAura(HORDE);
            LinkGraveYard(HORDE);
            UpdateBannerArt(ARTKIT_HORDE, ANIMATION_HORDE);

            if (m_oldState == OBJECTIVESTATE_HORDE)
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGHORDE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDHORDE);
                SummonSpiritOfVictory(HORDE);
                AddCreature(CROWN_GUARD_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_HORDE].entry, HORDE, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_HORDE].map, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_HORDE].x, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_HORDE].y, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_HORDE].z, EP_BufferNPCs[TOWER_BUFFER_CROWN_GUARD_TOWER_HORDE].o);

                ((OutdoorPvPEP*)m_PvP)->EP_Controls[CROWN_GUARD_TOWER] = HORDE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_CROWN_GUARD_TOWER_HORDE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = TOWERSTATE_NEUTRAL;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_ALLIANCE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
        case OBJECTIVESTATE_HORDE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_HORDE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
    }

    if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[CROWN_GUARD_TOWER_BUFFER]))
    {
        pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, false);
    }

    UpdateTowerState();
}

void OPvPCapturePointEP_CGT::SendChangePhase()
{
    SendUpdateWorldState(WS_UI_TOWER_SLIDER_POSITION, m_valuePct);
}

uint32 OPvPCapturePointEP_CGT::FillInitialWorldStates(WorldPacket& data)
{
    WriteInitialWorldStatePair(data, WS_CROWN_GUARD_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    WriteInitialWorldStatePair(data, WS_CROWN_GUARD_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    WriteInitialWorldStatePair(data, WS_CROWN_GUARD_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_CROWN_GUARD_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_CROWN_GUARD_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_CROWN_GUARD_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_CROWN_GUARD_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
    return 7;
}

void OPvPCapturePointEP_CGT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    m_PvP->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    m_PvP->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
}

void OPvPCapturePointEP_CGT::UpdateBannerArt(uint32 artkit, uint32 animation)
{
    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        if (pBanner1->GetGoArtKit() != artkit)
        {
            pBanner1->SetGoArtKit(artkit);
            pBanner1->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[CROWN_GUARD_TOWER_BANNER_1]))
    {
        if (pBanner2->GetGoArtKit() != artkit)
        {
            pBanner2->SetGoArtKit(artkit);
            pBanner2->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[CROWN_GUARD_TOWER_BANNER_2]))
    {
        if (pBanner3->GetGoArtKit() != artkit)
        {
            pBanner3->SetGoArtKit(artkit);
            pBanner3->SendGameObjectCustomAnim(animation);
        }
    }
}

void OPvPCapturePointEP_CGT::PlaySound(uint32 sound)
{
    if (!sound)
        return;

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->PlayDirectSound(sound);
    }
}

bool OPvPCapturePointEP_CGT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
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
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, EP_Zone, team, false);
    sObjectMgr.AddGraveYardLink(EP_GraveYardId, EP_Zone, team, false);
    sObjectMgr.RemoveGraveYardLink(EP_GraveYardId, TFV_area, team, false);
    sObjectMgr.AddGraveYardLink(EP_GraveYardId, TFV_area, team, false);
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
    AddObject(CROWN_GUARD_TOWER_BANNER_AURA, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].entry, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].map, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].x, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].y, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].z, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].o, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot0, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot1, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot2, EP_CGT_BannerAuraGraveYard[team == ALLIANCE ? 1 : 0].rot3);
}

void OPvPCapturePointEP_CGT::SummonSpiritOfVictory(uint32 team)
{
    DelCreature(CROWN_GUARD_TOWER_SPIRITOFVICTORY); // The only Creature to delete here.
    AddCreature(CROWN_GUARD_TOWER_SPIRITOFVICTORY, EP_CGT_SpiritOfVictory.entry, team, EP_CGT_SpiritOfVictory.map, EP_CGT_SpiritOfVictory.x, EP_CGT_SpiritOfVictory.y, EP_CGT_SpiritOfVictory.z, EP_CGT_SpiritOfVictory.o, 0, true);
    
    if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[CROWN_GUARD_TOWER_SPIRITOFVICTORY]))
    {
        pCreature->RemoveAllAuras();
        pCreature->AddAura(team == ALLIANCE ? SPELL_SPIRIT_PARTICLES_SUPER_BIG_DND : SPELL_SPIRIT_PARTICLES_RED_SUPER_BIG_DND);
        pCreature->GetMotionMaster()->Clear(false, true);
        pCreature->GetMotionMaster()->MoveWaypoint(0, PATH_FROM_SPECIAL, 1000, 0, 18039, false);
    }
}

OPvPCapturePointEP_PWT::OPvPCapturePointEP_PWT(OutdoorPvP *pvp)
    : OPvPCapturePoint(pvp), m_TowerState(TOWERSTATE_NEUTRAL)
{
    SetCapturePointData(EP_CapturePoints[PLAGUEWOOD_TOWER].entry, EP_CapturePoints[PLAGUEWOOD_TOWER].map, EP_CapturePoints[PLAGUEWOOD_TOWER].x, EP_CapturePoints[PLAGUEWOOD_TOWER].y, EP_CapturePoints[PLAGUEWOOD_TOWER].z, EP_CapturePoints[PLAGUEWOOD_TOWER].o, EP_CapturePoints[PLAGUEWOOD_TOWER].rot0, EP_CapturePoints[PLAGUEWOOD_TOWER].rot1, EP_CapturePoints[PLAGUEWOOD_TOWER].rot2, EP_CapturePoints[PLAGUEWOOD_TOWER].rot3);
    AddObject(PLAGUEWOOD_TOWER_BANNER_1, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].entry, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].map, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].x, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].y, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].z, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].o, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].rot0, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].rot1, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].rot2, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_1].rot3);
    AddObject(PLAGUEWOOD_TOWER_BANNER_2, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].entry, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].map, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].x, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].y, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].z, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].o, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].rot0, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].rot1, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].rot2, EP_TowerFlags[PLAGUEWOOD_TOWER_BANNER_2].rot3);
    ChangeState();
}

void OPvPCapturePointEP_PWT::ChangeState()
{
    // If changing from controlling alliance to horde or vice versa.
    if (m_oldState == OBJECTIVESTATE_ALLIANCE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[PLAGUEWOOD_TOWER] = 0;
    }
    else if (m_oldState == OBJECTIVESTATE_HORDE && m_oldState != m_state)
    {
        ((OutdoorPvPEP*)m_PvP)->EP_Controls[PLAGUEWOOD_TOWER] = 0;
    }

    DelCreature(PLAGUEWOOD_TOWER_BUFFER);
    DelCreature(PLAGUEWOOD_TOWER_FLIGHTMASTER);
    DelObject(PLAGUEWOOD_TOWER_FLAG_FLARE);

    switch (m_state)
    {
        case OBJECTIVESTATE_ALLIANCE:
        {
            m_TowerState = TOWERSTATE_ALLIANCE;
            PlaySound(SOUND_PVPVICTORYALLIANCE);
            SummonFlightMaster(ALLIANCE);
            AddObject(PLAGUEWOOD_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].entry, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].map, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].x, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].y, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].z, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].o, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].rot0, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].rot1, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].rot2, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_ALLIANCE].rot3);

            break;
        }
        case OBJECTIVESTATE_HORDE:
        {
            m_TowerState = TOWERSTATE_HORDE;
            PlaySound(SOUND_PVPVICTORYHORDE);
            SummonFlightMaster(HORDE);
            AddObject(PLAGUEWOOD_TOWER_FLAG_FLARE, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].entry, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].map, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].x, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].y, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].z, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].o, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].rot0, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].rot1, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].rot2, EP_TowerFlares[FLAG_FLARE_PLAGUEWOOD_TOWER_HORDE].rot3);

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_PROGRESSING:
        {
            UpdateBannerArt(ARTKIT_ALLIANCE, ANIMATION_ALLIANCE);
            SummonFlightMaster(ALLIANCE);

            if (m_oldState == OBJECTIVESTATE_ALLIANCE)
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGALLIANCE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_ALLIANCE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDALLIANCE);
                AddCreature(PLAGUEWOOD_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_ALLIANCE].entry, ALLIANCE, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_ALLIANCE].map, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_ALLIANCE].x, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_ALLIANCE].y, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_ALLIANCE].z, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_ALLIANCE].o);
                if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[PLAGUEWOOD_TOWER_BUFFER]))
                {
                    pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, false);
                }
                ((OutdoorPvPEP*)m_PvP)->EP_Controls[PLAGUEWOOD_TOWER] = ALLIANCE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_PLAGUEWOOD_TOWER_ALLIANCE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_HORDE_PROGRESSING:
        {
            UpdateBannerArt(ARTKIT_HORDE, ANIMATION_HORDE);
            SummonFlightMaster(HORDE);

            if (m_oldState == OBJECTIVESTATE_HORDE)
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPWARNINGHORDE);
            }
            else if (m_oldState <= OBJECTIVESTATE_HORDE_CONTESTED) // m_oldState was grey.
            {
                m_TowerState = TOWERSTATE_HORDE_PROGRESSING;
                PlaySound(SOUND_PVPFLAGCAPTUREDHORDE);
                AddCreature(PLAGUEWOOD_TOWER_BUFFER, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_HORDE].entry, HORDE, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_HORDE].map, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_HORDE].x, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_HORDE].y, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_HORDE].z, EP_BufferNPCs[TOWER_BUFFER_PLAGUEWOOD_TOWER_HORDE].o);
                if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[PLAGUEWOOD_TOWER_BUFFER]))
                {
                    pCreature->CastSpell(pCreature, SPELL_TOWER_CAPTURE_TEST_DND, false);
                }
                ((OutdoorPvPEP*)m_PvP)->EP_Controls[PLAGUEWOOD_TOWER] = HORDE;

                if (m_oldState != m_state)
                    ((OutdoorPvPEP*)m_PvP)->GetMap()->SendDefenseMessage(BCT_PLAGUEWOOD_TOWER_HORDE, EP_Zone);
            }
            break;
        }
        case OBJECTIVESTATE_NEUTRAL:
        {
            m_TowerState = TOWERSTATE_NEUTRAL;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
        case OBJECTIVESTATE_ALLIANCE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_ALLIANCE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
        case OBJECTIVESTATE_HORDE_CONTESTED:
        {
            m_TowerState = TOWERSTATE_HORDE_CONTESTED;
            UpdateBannerArt(ARTKIT_NEUTRAL, ANIMATION_NEUTRAL);

            break;
        }
    }

    UpdateTowerState();
}

void OPvPCapturePointEP_PWT::SendChangePhase()
{
    SendUpdateWorldState(WS_UI_TOWER_SLIDER_POSITION, m_valuePct);
}

uint32 OPvPCapturePointEP_PWT::FillInitialWorldStates(WorldPacket& data)
{
    WriteInitialWorldStatePair(data, WS_PLAGUEWOOD_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    WriteInitialWorldStatePair(data, WS_PLAGUEWOOD_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    WriteInitialWorldStatePair(data, WS_PLAGUEWOOD_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_PLAGUEWOOD_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    WriteInitialWorldStatePair(data, WS_PLAGUEWOOD_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_PLAGUEWOOD_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    WriteInitialWorldStatePair(data, WS_PLAGUEWOOD_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
    return 7;
}

void OPvPCapturePointEP_PWT::UpdateTowerState()
{
    m_PvP->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_ALLIANCE, bool(m_TowerState & TOWERSTATE_ALLIANCE));
    m_PvP->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_HORDE, bool(m_TowerState & TOWERSTATE_HORDE));
    m_PvP->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_ALLIANCE_PROGRESSING, bool(m_TowerState & TOWERSTATE_ALLIANCE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_HORDE_PROGRESSING, bool(m_TowerState & TOWERSTATE_HORDE_PROGRESSING));
    m_PvP->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_ALLIANCE_CONTESTED, bool(m_TowerState & TOWERSTATE_ALLIANCE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_HORDE_CONTESTED, bool(m_TowerState & TOWERSTATE_HORDE_CONTESTED));
    m_PvP->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_NEUTRAL, bool(m_TowerState & TOWERSTATE_NEUTRAL));
}

void OPvPCapturePointEP_PWT::UpdateBannerArt(uint32 artkit, uint32 animation)
{
    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        if (pBanner1->GetGoArtKit() != artkit)
        {
            pBanner1->SetGoArtKit(artkit);
            pBanner1->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner2 = m_PvP->GetGameObject(m_Objects[PLAGUEWOOD_TOWER_BANNER_1]))
    {
        if (pBanner2->GetGoArtKit() != artkit)
        {
            pBanner2->SetGoArtKit(artkit);
            pBanner2->SendGameObjectCustomAnim(animation);
        }
    }
    if (GameObject* pBanner3 = m_PvP->GetGameObject(m_Objects[PLAGUEWOOD_TOWER_BANNER_2]))
    {
        if (pBanner3->GetGoArtKit() != artkit)
        {
            pBanner3->SetGoArtKit(artkit);
            pBanner3->SendGameObjectCustomAnim(animation);
        }
    }
}

void OPvPCapturePointEP_PWT::PlaySound(uint32 sound)
{
    if (!sound)
        return;

    if (GameObject* pBanner1 = m_PvP->GetGameObject(m_capturePoint->GetObjectGuid()))
    {
        pBanner1->PlayDirectSound(sound);
    }
}

bool OPvPCapturePointEP_PWT::HandlePlayerEnter(Player* pPlayer)
{
    if (OPvPCapturePoint::HandlePlayerEnter(pPlayer))
    {
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
    AddCreature(PLAGUEWOOD_TOWER_FLIGHTMASTER, EP_PWT_FlightMaster.entry, team, EP_PWT_FlightMaster.map, EP_PWT_FlightMaster.x, EP_PWT_FlightMaster.y, EP_PWT_FlightMaster.z, EP_PWT_FlightMaster.o);
    
    if (Creature* pCreature = m_PvP->GetCreature(m_Creatures[PLAGUEWOOD_TOWER_FLIGHTMASTER]))
    {
        pCreature->SetFactionTemplateId(team == ALLIANCE ? 774 : 775);
        pCreature->RemoveAllAuras();
        pCreature->AddAura(team == ALLIANCE ? SPELL_SPIRIT_PARTICLES : SPELL_SPIRIT_PARTICLES_RED_BIG);
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
    for (uint32 i : EP_BuffZones)
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
            SendUpdateWorldState(WS_UI_TOWER_COUNT_ALLIANCE, m_AllianceTowersControlled);
            SendUpdateWorldState(WS_UI_TOWER_COUNT_HORDE, m_HordeTowersControlled);
            BuffTeams();
        }

        if (m_AllianceTowersControlled == 4)
            GetMap()->SendDefenseMessage(BCT_ALL_ALLIANCE, EP_Zone);
        else if (m_HordeTowersControlled == 4)
            GetMap()->SendDefenseMessage(BCT_ALL_HORDE, EP_Zone);
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

void OutdoorPvPEP::BuffTeams()
{
    for (auto const& guid : m_players[0])
    {
        if (Player* pPlayer = GetMap()->GetPlayer(guid))
        {
            for (uint32 i : EP_AllianceBuffs)
                pPlayer->RemoveAurasDueToSpell(i);

            if (m_AllianceTowersControlled && m_AllianceTowersControlled < 5)
                pPlayer->CastSpell(pPlayer, EP_AllianceBuffs[m_AllianceTowersControlled - 1], true);
        }
    }
    for (auto const& guid : m_players[1])
    {
        if (Player* pPlayer = GetMap()->GetPlayer(guid))
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
    WriteInitialWorldStatePair(data, WS_UI_TOWER_COUNT_ALLIANCE, m_AllianceTowersControlled);
    WriteInitialWorldStatePair(data, WS_UI_TOWER_COUNT_HORDE, m_HordeTowersControlled);
    WriteInitialWorldStatePair(data, WS_UI_TOWER_SLIDER_DISPLAY, 0);
    WriteInitialWorldStatePair(data, WS_UI_TOWER_SLIDER_POSITION, 50);
    WriteInitialWorldStatePair(data, WS_UI_TOWER_SLIDER_N, 100);
    uint32 count = 5;
    for (const auto& itr : m_capturePoints)
        count += itr.second->FillInitialWorldStates(data);
    return count;
}

void OutdoorPvPEP::SendRemoveWorldStates(Player* pPlayer)
{
    pPlayer->SendUpdateWorldState(WS_UI_TOWER_COUNT_ALLIANCE, 0);
    pPlayer->SendUpdateWorldState(WS_UI_TOWER_COUNT_HORDE, 0);
    pPlayer->SendUpdateWorldState(WS_UI_TOWER_SLIDER_DISPLAY, 0);
    pPlayer->SendUpdateWorldState(WS_UI_TOWER_SLIDER_POSITION, 0);
    pPlayer->SendUpdateWorldState(WS_UI_TOWER_SLIDER_N, 0);

    pPlayer->SendUpdateWorldState(WS_EASTWALL_TOWER_ALLIANCE, 0);
    pPlayer->SendUpdateWorldState(WS_EASTWALL_TOWER_HORDE, 0);
    pPlayer->SendUpdateWorldState(WS_EASTWALL_TOWER_ALLIANCE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_EASTWALL_TOWER_HORDE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_EASTWALL_TOWER_ALLIANCE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_EASTWALL_TOWER_HORDE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_EASTWALL_TOWER_NEUTRAL, 0);

    pPlayer->SendUpdateWorldState(WS_NORTHPASS_TOWER_ALLIANCE, 0);
    pPlayer->SendUpdateWorldState(WS_NORTHPASS_TOWER_HORDE, 0);
    pPlayer->SendUpdateWorldState(WS_NORTHPASS_TOWER_ALLIANCE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_NORTHPASS_TOWER_HORDE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_NORTHPASS_TOWER_ALLIANCE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_NORTHPASS_TOWER_HORDE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_NORTHPASS_TOWER_NEUTRAL, 0);

    pPlayer->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_ALLIANCE, 0);
    pPlayer->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_HORDE, 0);
    pPlayer->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_ALLIANCE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_HORDE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_ALLIANCE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_HORDE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_PLAGUEWOOD_TOWER_NEUTRAL, 0);

    pPlayer->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_ALLIANCE, 0);
    pPlayer->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_HORDE, 0);
    pPlayer->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_ALLIANCE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_HORDE_PROGRESSING, 0);
    pPlayer->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_ALLIANCE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_HORDE_CONTESTED, 0);
    pPlayer->SendUpdateWorldState(WS_CROWN_GUARD_TOWER_NEUTRAL, 0);
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
