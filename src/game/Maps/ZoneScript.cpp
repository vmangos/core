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

#include "ZoneScript.h"
#include "ZoneScriptMgr.h"
#include "ObjectMgr.h"
#include "Map.h"
#include "MapManager.h"
#include "Group.h"
#include "WorldPacket.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "TemporarySummon.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2

OPvPCapturePoint::OPvPCapturePoint(OutdoorPvP* pvp):
    m_capturePointGUID(0), m_capturePoint(nullptr), m_maxValue(0.0f), m_minValue(0.0f), m_maxSpeed(0.0f),
    m_value(0.0f), m_team(TEAM_NEUTRAL), m_oldState(OBJECTIVESTATE_NEUTRAL),
    m_state(OBJECTIVESTATE_NEUTRAL), m_neutralValuePct(0), m_valuePct(0), m_factDiff(0), m_PvP(pvp)
{
}

Map* OPvPCapturePoint::GetMap() const
{
    return m_PvP->GetMap();
}

bool OPvPCapturePoint::HandlePlayerEnter(Player* plr)
{
    if (m_capturePoint)
    {
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldState1, 1);
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldstate3, m_neutralValuePct);
        /* IMPORTANT!
        EP_UI_TOWER_SLIDER_POS: Should always be sent last and only when the value (m_valuePct) has been updated.
                                
            ------------------------------------------------------------
                              (m_minValue)(-m_minValue)
                  (m_maxValue)     [240]    [-240]     (-m_maxValue)
            Alliance [1200]<=========|===[0]===|=========>[-1200] Horde
                              Blue       Grey      Red
            ------------------------------------------------------------
            
            The Client does auto handle the direction indicator:
            If the previous value was 0 and the new value 1 , the indicator points to the left (Alliance).
            If the previous value was 0 and the new value -1 , the indicator points to the right (Horde).
            If the previous value was 0 and the new value 0 , the indicator gets deleted (Possibly if the number of horde players and alliance players are the same, or Slider is at 0/100).
            If any other UI element gets updated (SendUpdateWorldState) after the Slider it gets also deleted.
            The reason for this is client-specific and has nothing to do with the core.
        */
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldstate2, m_valuePct);
    }
    return m_activePlayers[plr->GetTeamId()].insert(plr->GetObjectGuid()).second;
}

void OPvPCapturePoint::HandlePlayerLeave(Player* plr)
{
    if (m_capturePoint)
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldState1, 0);
    m_activePlayers[plr->GetTeamId()].erase(plr->GetObjectGuid());
}

void OPvPCapturePoint::SendChangePhase()
{
    if (!m_capturePoint)
        return;

    SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldstate2, m_valuePct);
}

bool OPvPCapturePoint::AddObject(uint32 type, uint32 entry, uint32 mapId, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3)
{
    GameObjectInfo const* goInfo = sObjectMgr.GetGameObjectInfo(entry);
    if (!goInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid GameObject entry %u in OPvPCapturePoint::AddObject!", entry);
        return false;
    }

    Map* map = GetMap();
    if (map->GetId() != mapId)
        map = const_cast<Map*>(sMapMgr.FindMap(mapId, sMapMgr.GetContinentInstanceId(mapId, x, y)));
    if (!map)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid Map id %u in OPvPCapturePoint::AddObject!", mapId);
        return false;
    }

    if (GameObject* pGo = map->SummonGameObject(entry, x, y, z, o, rotation0, rotation1, rotation2, rotation3, 0, WORLD_DEFAULT_OBJECT))
    {
        m_Objects[type] = pGo->GetObjectGuid();
        m_ObjectTypes[m_Objects[type]] = type;
        return true;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to create GameObject with entry %u in OPvPCapturePoint::AddObject!", entry);
    return false;
}

bool OPvPCapturePoint::AddCreature(uint32 type, uint32 entry, uint32 team, uint32 mapId, float x, float y, float z, float o, uint32 spawntimedelay, bool asActiveObject)
{
    CreatureInfo const* cInfo = sObjectMgr.GetCreatureTemplate(entry);
    if (!cInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid Creature entry %u in OPvPCapturePoint::AddCreature!", entry);
        return false;
    }

    Map* map = GetMap();
    if (map->GetId() != mapId)
        map = const_cast<Map*>(sMapMgr.FindMap(mapId, sMapMgr.GetContinentInstanceId(mapId, x, y)));
    if (!map)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid Map id %u in OPvPCapturePoint::AddCreature!", mapId);
        return false;
    }

    if (Creature* pCreature = map->SummonCreature(entry, x, y, z, o, TEMPSUMMON_MANUAL_DESPAWN, spawntimedelay, asActiveObject))
    {
        m_Creatures[type] = pCreature->GetObjectGuid();
        m_CreatureTypes[m_Creatures[type]] = type;
        return true;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to create Creature with entry %u in OPvPCapturePoint::AddCreature!", entry);
    return false;
}

bool OPvPCapturePoint::SetCapturePointData(uint32 entry, uint32 mapId, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3)
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Creating capture point %u", entry);

    // check info existence
    GameObjectInfo const* goinfo = ObjectMgr::GetGameObjectInfo(entry);
    if (!goinfo || goinfo->type != GAMEOBJECT_TYPE_CAPTURE_POINT)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "OutdoorPvP: GO %u is not capture point!", entry);
        return false;
    }

    GameObjectInfo const* goInfo = sObjectMgr.GetGameObjectInfo(entry);
    if (!goInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid GameObject entry %u in OPvPCapturePoint::SetCapturePointData!", entry);
        return false;
    }

    Map* map = GetMap(); 
    if (map->GetId() != mapId)
        map = const_cast<Map*>(sMapMgr.FindMap(mapId, sMapMgr.GetContinentInstanceId(mapId, x, y)));
    if (!map)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid Map id %u in OPvPCapturePoint::SetCapturePointData!", mapId);
        return false;
    }

    GameObject* pGo = map->SummonGameObject(entry, x, y, z, o, rotation0, rotation1, rotation2, rotation3, 0, WORLD_DEFAULT_OBJECT);
    if (!pGo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to create GameObject with entry %u in OPvPCapturePoint::SetCapturePointData!", entry);
        return false;
    }

    m_capturePoint = pGo;
    m_capturePointGUID = pGo->GetGUIDLow();

    // get the needed values from goinfo
    m_maxValue = (float)goinfo->capturePoint.maxTime;
    m_maxSpeed = m_maxValue / (goinfo->capturePoint.minTime ? goinfo->capturePoint.minTime : 60);
    m_neutralValuePct = goinfo->capturePoint.neutralPercent;
    m_minValue = m_maxValue * float(m_neutralValuePct) / 100.0f;

    return true;
}

bool OPvPCapturePoint::DelCreature(uint32 type)
{
    if (!m_Creatures[type])
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "opvp creature type %u was already deleted", type);
        return false;
    }

    Creature* cr = m_PvP->GetCreature(m_Creatures[type]);
    if (!cr)
    {
        // Can happen when closing the core.
        m_Creatures[type] = 0;
        return false;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "deleting opvp creature type %u", type);
    MANGOS_ASSERT(cr->IsTemporarySummon());
    static_cast<TemporarySummon*>(cr)->UnSummon();

    m_CreatureTypes[m_Creatures[type]] = 0;
    m_Creatures[type] = 0;
    return true;
}

bool OPvPCapturePoint::DelObject(uint32 type)
{
    if (!m_Objects[type])
        return false;

    GameObject* obj = m_PvP->GetGameObject(m_Objects[type]);
    if (!obj)
    {
        m_Objects[type] = 0;
        return false;
    }
    obj->SetRespawnTime(0);                 // Not save respawn time.
    obj->Delete();
    m_ObjectTypes[m_Objects[type]] = 0;
    m_Objects[type] = 0;
    return true;
}

bool OPvPCapturePoint::DelCapturePoint()
{
    m_capturePointGUID = 0;

    if (m_capturePoint)
    {
        m_capturePoint->SetRespawnTime(0);  // Not save respawn time.
        m_capturePoint->Delete();
    }

    return true;
}

void OPvPCapturePoint::DeleteSpawns()
{
    for (auto const& itr : m_Objects)
        DelObject(itr.first);
    for (auto const& itr : m_Creatures)
        DelCreature(itr.first);
    DelCapturePoint();
}

void OutdoorPvP::DeleteSpawns()
{
    for (auto const& itr : m_capturePoints)
    {
        itr.second->DeleteSpawns();
        delete itr.second;
    }
    m_capturePoints.clear();
}

OutdoorPvP::OutdoorPvP() : ZoneScript(), m_objective_changed(false), m_TypeId(0)
{
}

OutdoorPvP::~OutdoorPvP()
{
    // `Map`s should already be unloaded at this point.
    // DeleteSpawns();
    for (auto const& itr : m_capturePoints)
        delete itr.second;
}

void OutdoorPvP::OnPlayerLeave(Player* plr)
{
    // Inform the objectives of the leaving.
    for (auto const& itr : m_capturePoints)
        itr.second->HandlePlayerLeave(plr);
    ZoneScript::OnPlayerLeave(plr);
}

void OutdoorPvP::OnPlayerEnter(Player* pPlayer)
{
    ZoneScript::OnPlayerEnter(pPlayer);
}

void OutdoorPvP::Update(uint32 diff)
{
    m_objective_changed = false;
    for (auto const& itr : m_capturePoints)
    {
        if (itr.second->Update(diff))
            m_objective_changed = true;
    }
}

bool OPvPCapturePoint::Update(uint32 diff)
{
    if (!m_capturePoint)
        return false;

    float radius = (float)m_capturePoint->GetGOInfo()->capturePoint.radius;

    for (auto& playersPerTeam : m_activePlayers)
    {
        for (ObjectGuidSet::iterator itr = playersPerTeam.begin(); itr != playersPerTeam.end();)
        {
            Player* player = GetMap()->GetPlayer(*itr);
            if (!player || !m_capturePoint->IsWithinDistInMap(player, radius) || !player->IsOutdoorPvPActive())
            {
                if (player && m_capturePoint)
                    player->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldState1, 0);
                itr = playersPerTeam.erase(itr);
                continue;
            }
            
            ++itr;
        }
    }

    std::list<Player*> players;
    MaNGOS::AnyPlayerInObjectRangeCheck checker(m_capturePoint, radius, true);
    MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, checker);
    Cell::VisitWorldObjects(m_capturePoint, searcher, radius);

    for (auto const& player : players)
    {
        if (player->IsInWorld() && player->IsOutdoorPvPActive() && !IsInsideObjective(player))
        {
            if (m_activePlayers[player->GetTeamId()].insert(player->GetObjectGuid()).second)
                HandlePlayerEnter(player);
        }
    }

    // Get the difference of numbers.
    float fact_diff = ((float)m_activePlayers[0].size() - (float)m_activePlayers[1].size()) * diff / OUTDOORPVP_OBJECTIVE_UPDATE_INTERVAL;

    uint32 Challenger = 0;
    float maxDiff = m_maxSpeed * diff;

    if (fact_diff < 0.0f)
    {
        if (m_value <= -m_maxValue)
            return false;

        if (fact_diff < -maxDiff)
            fact_diff = -maxDiff;

        Challenger = HORDE;
    }
    else if (fact_diff > 0.0f)
    {
        if (m_value >= m_maxValue)
            return false;

        if (fact_diff > maxDiff)
            fact_diff = maxDiff;

        Challenger = ALLIANCE;
    }
    else // 0.0f?
    {
        Challenger = TEAM_NONE;
    }

    uint32 OldValuePct = m_valuePct;
    uint32 OldFactDiff = m_factDiff;
    TeamId oldTeam = m_team;

    m_oldState = m_state;

    m_value += fact_diff;

    /*  The Slider
    ------------------------------------------------------------
                      (m_minValue)(-m_minValue)
          (m_maxValue)     [240]    [-240]     (-m_maxValue)
    Alliance [1200]<=========|===[0]===|=========>[-1200] Horde
                      Blue       Grey      Red
    ------------------------------------------------------------*/

    // RED
    if (m_value <= -m_minValue) // m_value is in the red bar, between -240 (-m_minValue) and -1200 (-m_maxValue).
    {
        if (m_value <= -m_maxValue) // m_value at max red -1200 (-m_maxValue).
        {
            m_value = -m_maxValue;
            m_state = OBJECTIVESTATE_HORDE;
        }
        else // m_value is below max red -1200 (-m_maxValue).
        {
            m_state = OBJECTIVESTATE_HORDE_PROGRESSING;
        }

        m_team = TEAM_HORDE;
    }
    // BLUE
    else if (m_value >= m_minValue) // m_value is in the blue bar, between 240 (m_minValue) and 1200 (m_maxValue).
    {
        if (m_value >= m_maxValue) // m_value at max blue 1200 (m_maxValue).
        {
            m_value = m_maxValue;
            m_state = OBJECTIVESTATE_ALLIANCE;
        }
        else // m_value is below max blue 1200 (-m_maxValue).
        {
            m_state = OBJECTIVESTATE_ALLIANCE_PROGRESSING;
        }

        m_team = TEAM_ALLIANCE;
    }
    // GREY
    else if (m_value > -m_minValue && m_value < m_minValue) // m_value higher than -240 (begin of the red bar) and lower than 240 (begin of the blue bar).
    {
        if (Challenger == ALLIANCE)
            m_state = OBJECTIVESTATE_ALLIANCE_CONTESTED;
        else if (Challenger == HORDE)
            m_state = OBJECTIVESTATE_HORDE_CONTESTED;
        else // TEAM_NONE
            m_state = OBJECTIVESTATE_NEUTRAL;

        m_team = TEAM_NEUTRAL;
    }

    m_valuePct = (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f);
    m_factDiff = (m_activePlayers[0].size() - m_activePlayers[1].size());

    if (m_oldState != m_state)
    {
        if (oldTeam != m_team)
            ChangeTeam(oldTeam);
        ChangeState();
        return true;
    }
    else if (m_valuePct != OldValuePct || OldFactDiff != m_factDiff && !m_factDiff) // Only send World Updates if the Slider value actually changes or Faction difference changed to avoid sending unnecessary packets.
        SendChangePhase();

    return false;
}

void OPvPCapturePoint::SendUpdateWorldState(uint32 field, uint32 value)
{
    for (auto const& playerPerTeam : m_activePlayers)
    {
        // Send to all players present in the area.
        for (auto const& guid : playerPerTeam)
            if (Player* pPlayer = GetMap()->GetPlayer(guid))
                pPlayer->SendUpdateWorldState(field, value);
    }
}

void OutdoorPvP::HandleKill(Player* killer, Unit* killed)
{
    if (Group* pGroup = killer->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            Player* pGroupGuy = itr->getSource();

            if (!pGroupGuy)
                continue;

            // Skip if too far away.
            if (!pGroupGuy->IsAtGroupRewardDistance(killed))
                continue;

            // Creature kills must be notified, even if not inside objective / not outdoor pvp active.
            // Player kills only count if active and inside objective.
            if ((pGroupGuy->IsOutdoorPvPActive() && IsInsideObjective(pGroupGuy)) || killed->GetTypeId() == TYPEID_UNIT)
                HandleKillImpl(pGroupGuy, killed);
        }
    }
    else
    {
        // Creature kills must be notified, even if not inside objective / not outdoor pvp active.
        if (killer && ((killer->IsOutdoorPvPActive() && IsInsideObjective(killer)) || killed->GetTypeId() == TYPEID_UNIT))
            HandleKillImpl(killer, killed);
    }
}

bool OutdoorPvP::IsInsideObjective(Player* plr) const
{
    for (auto const& itr : m_capturePoints)
        if (itr.second->IsInsideObjective(plr))
            return true;

    return false;
}

bool OPvPCapturePoint::IsInsideObjective(Player* plr) const
{
    return m_activePlayers[plr->GetTeamId()].find(plr->GetObjectGuid()) != m_activePlayers[plr->GetTeamId()].end();
}

bool OutdoorPvP::HandleCustomSpell(Player* plr, uint32 spellId, GameObject* go)
{
    for (auto const& itr : m_capturePoints)
        if (itr.second->HandleCustomSpell(plr, spellId, go))
            return true;

    return false;
}

bool OPvPCapturePoint::HandleCustomSpell(Player* plr, uint32 /*spellId*/, GameObject* /*go*/)
{
    if (!plr->IsOutdoorPvPActive())
        return false;
    return false;
}

bool OutdoorPvP::HandleOpenGo(Player* plr, uint64 guid)
{
    for (auto const& itr : m_capturePoints)
        if (itr.second->HandleOpenGo(plr, guid) >= 0)
            return true;

    return false;
}

bool OutdoorPvP::HandleGossipOption(Player* plr, uint64 guid, uint32 id)
{
    for (auto const& itr : m_capturePoints)
        if (itr.second->HandleGossipOption(plr, guid, id))
            return true;

    return false;
}

bool OutdoorPvP::HandleDropFlag(Player* plr, uint32 id)
{
    for (auto const& itr : m_capturePoints)
        if (itr.second->HandleDropFlag(plr, id))
            return true;

    return false;
}

bool OPvPCapturePoint::HandleGossipOption(Player* /*plr*/, uint64 /*guid*/, uint32 /*id*/)
{
    return false;
}

bool OPvPCapturePoint::HandleDropFlag(Player* /*plr*/, uint32 /*id*/)
{
    return false;
}

int32 OPvPCapturePoint::HandleOpenGo(Player* /*plr*/, uint64 guid)
{
    std::map<uint64, uint32>::iterator itr = m_ObjectTypes.find(guid);
    if (itr != m_ObjectTypes.end())
        return itr->second;
    return -1;
}

bool OutdoorPvP::HandleAreaTrigger(Player* /*plr*/, uint32 /*trigger*/)
{
    return false;
}

void OutdoorPvP::OnGameObjectRemove(GameObject* go)
{
    if (go->GetGoType() != GAMEOBJECT_TYPE_CAPTURE_POINT)
        return;

    if (OPvPCapturePoint *cp = GetCapturePoint(go->GetGUIDLow()))
        cp->m_capturePoint = nullptr;
}

#endif

ZoneScript::ZoneScript() : m_pMap(nullptr)
{
}

ZoneScript::~ZoneScript()
{
}

void ZoneScript::Update(uint32 diff)
{
}

void ZoneScript::OnPlayerEnter(Player* plr)
{
    m_players[plr->GetTeamId()].insert(plr->GetObjectGuid());
}

void ZoneScript::OnPlayerLeave(Player* plr)
{
    // Remove the world state information from the player (we can't keep everyone up to date, so leave out those who are not in the concerning zones).
    if (!plr->GetSession()->PlayerLogout())
        SendRemoveWorldStates(plr);
    m_players[plr->GetTeamId()].erase(plr->GetObjectGuid());
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Player %s left a ZoneScript zone", plr->GetName());
}

void ZoneScript::SendUpdateWorldState(uint32 field, uint32 value)
{
    for (auto const& playerPerTeam : m_players)
        for (auto const& guid : playerPerTeam)
            if (Player* pPlayer = GetMap()->GetPlayer(guid))
                pPlayer->SendUpdateWorldState(field, value);
}

void ZoneScript::BroadcastPacket(WorldPacket& data) const
{
    // This is faster than sWorld.SendZoneMessage.
    for (auto const& playerPerTeam : m_players)
        for (auto const& guid : playerPerTeam)
            if (Player* pPlayer = GetMap()->GetPlayer(guid))
                pPlayer->GetSession()->SendPacket(&data);
}

void ZoneScript::RegisterZone(uint32 zoneId)
{
    sZoneScriptMgr.AddZone(zoneId, this);
}

bool ZoneScript::HasPlayer(Player* plr) const
{
    return m_players[plr->GetTeamId()].find(plr->GetObjectGuid()) != m_players[plr->GetTeamId()].end();
}

void ZoneScript::TeamCastSpell(TeamId team, int32 spellId)
{
    if (spellId > 0)
    {
        for (auto const& guid : m_players[team])
            if (Player* pPlayer = GetMap()->GetPlayer(guid))
                pPlayer->CastSpell(pPlayer, (uint32)spellId, true);
    }
    else
    {
        for (auto const& guid : m_players[team])
            if (Player* pPlayer = GetMap()->GetPlayer(guid))
                pPlayer->RemoveAurasDueToSpell((uint32)-spellId); // By stack?
    }
}

void ZoneScript::TeamApplyBuff(TeamId team, uint32 spellId, uint32 spellId2)
{
    TeamCastSpell(team, spellId);
    TeamCastSpell(OTHER_TEAM(team), spellId2 ? -(int32)spellId2 : -(int32)spellId);
}

Creature* ZoneScript::GetCreature(ObjectGuid guid)
{
    ASSERT(m_pMap);
    return m_pMap->GetCreature(guid);
}

GameObject* ZoneScript::GetGameObject(ObjectGuid guid)
{
    ASSERT(m_pMap);
    return m_pMap->GetGameObject(guid);
}
