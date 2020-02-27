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
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Map.h"
#include "MapManager.h"
#include "Group.h"
#include "WorldPacket.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2

OPvPCapturePoint::OPvPCapturePoint(OutdoorPvP* pvp):
    m_capturePointGUID(0), m_capturePoint(nullptr), m_maxValue(0), m_minValue(0), m_maxSpeed(0),
    m_value(0), m_team(TEAM_NEUTRAL), m_OldState(OBJECTIVESTATE_NEUTRAL),
    m_State(OBJECTIVESTATE_NEUTRAL), m_neutralValuePct(0), m_PvP(pvp)
{
}

bool OPvPCapturePoint::HandlePlayerEnter(Player* plr)
{
    if (m_capturePoint)
    {
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldState1, 1);
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldstate2, (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f));
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldstate3, m_neutralValuePct);
    }
    return m_activePlayers[plr->GetTeamId()].insert(plr).second;
}

void OPvPCapturePoint::HandlePlayerLeave(Player* plr)
{
    if (m_capturePoint)
        plr->SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldState1, 0);
    m_activePlayers[plr->GetTeamId()].erase(plr);
}

void OPvPCapturePoint::SendChangePhase()
{
    if (!m_capturePoint)
        return;

    // send this too, sometimes the slider disappears, dunno why :(
    SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldState1, 1);
    // send these updates to only the ones in this objective
    SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldstate2, (uint32)ceil((m_value + m_maxValue) / (2 * m_maxValue) * 100.0f));
    // send this too, sometimes it resets :S
    SendUpdateWorldState(m_capturePoint->GetGOInfo()->capturePoint.worldstate3, m_neutralValuePct);
}

void OPvPCapturePoint::AddGO(uint32 type, uint32 guid, uint32 entry)
{
    if (!entry)
    {
        GameObjectData const* data = sObjectMgr.GetGOData(guid);
        if (!data)
            return;
        entry = data->id;
    }
    m_Objects[type] = MAKE_NEW_GUID(guid, entry, HIGHGUID_GAMEOBJECT);
    m_ObjectTypes[m_Objects[type]] = type;
}

void OPvPCapturePoint::AddCre(uint32 type, uint32 guid, uint32 entry)
{
    if (!entry)
    {
        CreatureData const* data = sObjectMgr.GetCreatureData(guid);
        if (!data)
            return;
        entry = data->creature_id[0];
    }
    m_Creatures[type] = MAKE_NEW_GUID(guid, entry, HIGHGUID_UNIT);
    m_CreatureTypes[m_Creatures[type]] = type;
}

bool OPvPCapturePoint::AddObject(uint32 type, uint32 entry, uint32 map, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3)
{
    if (uint32 guid = sObjectMgr.AddGOData(entry, map, x, y, z, o, 0, rotation0, rotation1, rotation2, rotation3))
    {
        AddGO(type, guid, entry);
        return true;
    }

    return false;
}

bool OPvPCapturePoint::AddCreature(uint32 type, uint32 entry, uint32 team, uint32 map, float x, float y, float z, float o, uint32 spawntimedelay)
{
    if (uint32 guid = sObjectMgr.AddCreData(entry, team, map, x, y, z, o, spawntimedelay))
    {
        AddCre(type, guid, entry);
        return true;
    }

    return false;
}

bool OPvPCapturePoint::SetCapturePointData(uint32 entry, uint32 map, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3)
{
    DEBUG_LOG("Creating capture point %u", entry);

    // check info existence
    GameObjectInfo const* goinfo = ObjectMgr::GetGameObjectInfo(entry);
    if (!goinfo || goinfo->type != GAMEOBJECT_TYPE_CAPTURE_POINT)
    {
        sLog.outError("OutdoorPvP: GO %u is not capture point!", entry);
        return false;
    }

    m_capturePointGUID = sObjectMgr.AddGOData(entry, map, x, y, z, o, 0, rotation0, rotation1, rotation2, rotation3);
    if (!m_capturePointGUID)
        return false;

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
        DEBUG_LOG("opvp creature type %u was already deleted", type);
        return false;
    }

    Creature* cr = m_PvP->GetCreature(m_Creatures[type]);
    if (!cr)
    {
        // can happen when closing the core
        m_Creatures[type] = 0;
        return false;
    }
    DEBUG_LOG("deleting opvp creature type %u", type);
    uint32 guid = cr->GetDBTableGUIDLow();
    // Don't save respawn time
    cr->SetRespawnTime(0);
    cr->RemoveCorpse();
    // explicit removal from map
    // beats me why this is needed, but with the recent removal "cleanup" some creatures stay in the map if "properly" deleted
    // so this is a big fat workaround, if AddObjectToRemoveList and DoDelayedMovesAndRemoves worked correctly, this wouldn't be needed
    //if (Map* map = sMapMgr->FindMap(cr->GetMapId()))
    //    map->Remove(cr,false);
    // delete respawn time for this creature
    CharacterDatabase.PExecute("DELETE FROM creature_respawn WHERE guid = '%u'", guid);
    cr->AddObjectToRemoveList();
    sObjectMgr.DeleteCreatureData(guid);
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
    uint32 guid = obj->GetDBTableGUIDLow();
    obj->SetRespawnTime(0);                                 // not save respawn time
    obj->Delete();
    sObjectMgr.DeleteGOData(guid);
    m_ObjectTypes[m_Objects[type]] = 0;
    m_Objects[type] = 0;
    return true;
}

bool OPvPCapturePoint::DelCapturePoint()
{
    sObjectMgr.DeleteGOData(m_capturePointGUID);
    m_capturePointGUID = 0;

    if (m_capturePoint)
    {
        m_capturePoint->SetRespawnTime(0);                                 // not save respawn time
        m_capturePoint->Delete();
    }

    return true;
}

void OPvPCapturePoint::DeleteSpawns()
{
    for (const auto& itr : m_Objects)
        DelObject(itr.first);
    for (const auto& itr : m_Creatures)
        DelCreature(itr.first);
    DelCapturePoint();
}

void OutdoorPvP::DeleteSpawns()
{
    for (const auto& itr : m_capturePoints)
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
    // `Map`s should already be unloaded at this point
    // DeleteSpawns();
    for (const auto& itr : m_capturePoints)
        delete itr.second;
}

void OutdoorPvP::OnPlayerLeave(Player* plr)
{
    // inform the objectives of the leaving
    for (const auto& itr : m_capturePoints)
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
    for (const auto& itr : m_capturePoints)
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

    for (const auto& playersPerTeam : m_activePlayers)
    {
        for (PlayerSet::const_iterator itr = playersPerTeam.cbegin(); itr != playersPerTeam.cend();)
        {
            Player* player = *itr;
            ++itr;
            if (!m_capturePoint->IsWithinDistInMap(player, radius) || !player->IsOutdoorPvPActive())
                HandlePlayerLeave(player);
        }
    }

    std::list<Player*> players;
    MaNGOS::AnyPlayerInObjectRangeCheck checker(m_capturePoint, radius, false);
    MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, checker);
    Cell::VisitWorldObjects(m_capturePoint, searcher, radius);

    for (const auto& player : players)
    {
        if (player->IsOutdoorPvPActive())
        {
            if (m_activePlayers[player->GetTeamId()].insert(player).second)
                HandlePlayerEnter(player);
        }
    }

    // get the difference of numbers
    float fact_diff = ((float)m_activePlayers[0].size() - (float)m_activePlayers[1].size()) * diff / OUTDOORPVP_OBJECTIVE_UPDATE_INTERVAL;
    if (!fact_diff)
        return false;

    uint32 Challenger = 0;
    float maxDiff = m_maxSpeed * diff;

    if (fact_diff < 0)
    {
        // horde is in majority, but it's already horde-controlled -> no change
        if (m_State == OBJECTIVESTATE_HORDE && m_value <= -m_maxValue)
            return false;

        if (fact_diff < -maxDiff)
            fact_diff = -maxDiff;

        Challenger = HORDE;
    }
    else
    {
        // ally is in majority, but it's already ally-controlled -> no change
        if (m_State == OBJECTIVESTATE_ALLIANCE && m_value >= m_maxValue)
            return false;

        if (fact_diff > maxDiff)
            fact_diff = maxDiff;

        Challenger = ALLIANCE;
    }

    float oldValue = m_value;
    TeamId oldTeam = m_team;

    m_OldState = m_State;

    m_value += fact_diff;

    if (m_value < -m_minValue) // red
    {
        if (m_value < -m_maxValue)
            m_value = -m_maxValue;
        m_State = OBJECTIVESTATE_HORDE;
        m_team = TEAM_HORDE;
    }
    else if (m_value > m_minValue) // blue
    {
        if (m_value > m_maxValue)
            m_value = m_maxValue;
        m_State = OBJECTIVESTATE_ALLIANCE;
        m_team = TEAM_ALLIANCE;
    }
    else if (oldValue * m_value <= 0) // grey, go through mid point
    {
        // if challenger is ally, then n->a challenge
        if (Challenger == ALLIANCE)
            m_State = OBJECTIVESTATE_NEUTRAL_ALLIANCE_CHALLENGE;
        // if challenger is horde, then n->h challenge
        else if (Challenger == HORDE)
            m_State = OBJECTIVESTATE_NEUTRAL_HORDE_CHALLENGE;
        m_team = TEAM_NEUTRAL;
    }
    else // grey, did not go through mid point
    {
        // old phase and current are on the same side, so one team challenges the other
        if (Challenger == ALLIANCE && (m_OldState == OBJECTIVESTATE_HORDE || m_OldState == OBJECTIVESTATE_NEUTRAL_HORDE_CHALLENGE))
            m_State = OBJECTIVESTATE_HORDE_ALLIANCE_CHALLENGE;
        else if (Challenger == HORDE && (m_OldState == OBJECTIVESTATE_ALLIANCE || m_OldState == OBJECTIVESTATE_NEUTRAL_ALLIANCE_CHALLENGE))
            m_State = OBJECTIVESTATE_ALLIANCE_HORDE_CHALLENGE;
        m_team = TEAM_NEUTRAL;
    }

    if (m_value != oldValue)
        SendChangePhase();

    if (m_OldState != m_State)
    {
        //sLog.outError("%u->%u", m_OldState, m_State);
        if (oldTeam != m_team)
            ChangeTeam(oldTeam);
        ChangeState();
        return true;
    }

    return false;
}

void OPvPCapturePoint::SendUpdateWorldState(uint32 field, uint32 value)
{
    for (const auto& playerPerTeam : m_activePlayers)
    {
        // send to all players present in the area
        for (PlayerSet::iterator itr = playerPerTeam.begin(); itr != playerPerTeam.end(); ++itr)
            (*itr)->SendUpdateWorldState(field, value);
    }
}

void OPvPCapturePoint::SendObjectiveComplete(uint32 id, uint64 guid)
{
    uint32 team;
    switch (m_State)
    {
        case OBJECTIVESTATE_ALLIANCE:
            team = 0;
            break;
        case OBJECTIVESTATE_HORDE:
            team = 1;
            break;
        default:
            return;
    }

    // send to all players present in the area
    for (const auto itr : m_activePlayers[team])
        itr->KilledMonsterCredit(id, guid);
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

            // skip if too far away
            if (!pGroupGuy->IsAtGroupRewardDistance(killed))
                continue;

            // creature kills must be notified, even if not inside objective / not outdoor pvp active
            // player kills only count if active and inside objective
            if ((pGroupGuy->IsOutdoorPvPActive() && IsInsideObjective(pGroupGuy)) || killed->GetTypeId() == TYPEID_UNIT)
                HandleKillImpl(pGroupGuy, killed);
        }
    }
    else
    {
        // creature kills must be notified, even if not inside objective / not outdoor pvp active
        if (killer && ((killer->IsOutdoorPvPActive() && IsInsideObjective(killer)) || killed->GetTypeId() == TYPEID_UNIT))
            HandleKillImpl(killer, killed);
    }
}

bool OutdoorPvP::IsInsideObjective(Player* plr) const
{
    for (const auto& itr : m_capturePoints)
        if (itr.second->IsInsideObjective(plr))
            return true;

    return false;
}

bool OPvPCapturePoint::IsInsideObjective(Player* plr) const
{
    return m_activePlayers[plr->GetTeamId()].find(plr) != m_activePlayers[plr->GetTeamId()].end();
}

bool OutdoorPvP::HandleCustomSpell(Player* plr, uint32 spellId, GameObject* go)
{
    for (const auto& itr : m_capturePoints)
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
    for (const auto& itr : m_capturePoints)
        if (itr.second->HandleOpenGo(plr, guid) >= 0)
            return true;

    return false;
}

bool OutdoorPvP::HandleGossipOption(Player* plr, uint64 guid, uint32 id)
{
    for (const auto& itr : m_capturePoints)
        if (itr.second->HandleGossipOption(plr, guid, id))
            return true;

    return false;
}

bool OutdoorPvP::HandleDropFlag(Player* plr, uint32 id)
{
    for (const auto& itr : m_capturePoints)
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


void OutdoorPvP::OnGameObjectCreate(GameObject* go)
{
    if (OPvPCapturePoint *cp = GetCapturePoint(go->GetDBTableGUIDLow()))
    {
        if (go->GetGoType() != GAMEOBJECT_TYPE_CAPTURE_POINT)
            sLog.outError("OutdoorPvP : GameObject %u n'est pas de type GAMEOBJECT_TYPE_CAPTURE_POINT (%u)", go->GetEntry(), GAMEOBJECT_TYPE_CAPTURE_POINT);
        cp->m_capturePoint = go;
    }
}

void OutdoorPvP::OnGameObjectRemove(GameObject* go)
{
    if (go->GetGoType() != GAMEOBJECT_TYPE_CAPTURE_POINT)
        return;

    if (OPvPCapturePoint *cp = GetCapturePoint(go->GetDBTableGUIDLow()))
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
    m_players[plr->GetTeamId()].insert(plr);
}

void ZoneScript::OnPlayerLeave(Player* plr)
{
    // remove the world state information from the player (we can't keep everyone up to date, so leave out those who are not in the concerning zones)
    if (!plr->GetSession()->PlayerLogout())
        SendRemoveWorldStates(plr);
    m_players[plr->GetTeamId()].erase(plr);
    DEBUG_LOG("Player %s left a ZoneScript zone", plr->GetName());
}

void ZoneScript::SendUpdateWorldState(uint32 field, uint32 value)
{
    for (const auto& playerPerTeam : m_players)
        for (PlayerSet::iterator itr = playerPerTeam.begin(); itr != playerPerTeam.end(); ++itr)
            (*itr)->SendUpdateWorldState(field, value);
}

void ZoneScript::BroadcastPacket(WorldPacket& data) const
{
    // This is faster than sWorld.SendZoneMessage
    for (const auto& playerPerTeam : m_players)
        for (PlayerSet::const_iterator itr = playerPerTeam.begin(); itr != playerPerTeam.end(); ++itr)
            (*itr)->GetSession()->SendPacket(&data);
}

void ZoneScript::RegisterZone(uint32 zoneId)
{
    sZoneScriptMgr.AddZone(zoneId, this);
}

bool ZoneScript::HasPlayer(Player* plr) const
{
    return m_players[plr->GetTeamId()].find(plr) != m_players[plr->GetTeamId()].end();
}

void ZoneScript::TeamCastSpell(TeamId team, int32 spellId)
{
    if (spellId > 0)
        for (const auto itr : m_players[team])
            itr->CastSpell(itr, (uint32)spellId, true);
    else
        for (const auto itr : m_players[team])
            itr->RemoveAurasDueToSpell((uint32) - spellId); // by stack?
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
