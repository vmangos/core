/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#include "Object.h"
#include "Player.h"
#include "BattleGround.h"
#include "BattleGroundWS.h"
#include "GameObject.h"
#include "ObjectMgr.h"
#include "BattleGroundMgr.h"
#include "WorldPacket.h"
#include "Language.h"
#include "World.h"

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
#include "ScriptMgr.h"
#endif

BattleGroundWS::BattleGroundWS()
{
    m_startMessageIds[BG_STARTING_EVENT_FIRST]  = 0;
    m_startMessageIds[BG_STARTING_EVENT_SECOND] = BCT_BG_WS_START_ONE_MINUTE;
    m_startMessageIds[BG_STARTING_EVENT_THIRD]  = BCT_BG_WS_START_HALF_MINUTE;
    m_startMessageIds[BG_STARTING_EVENT_FOURTH] = BCT_BG_WS_HAS_BEGUN;
}

BattleGroundWS::~BattleGroundWS()
{
}

void BattleGroundWS::Update(uint32 diff)
{
    if (GetStatus() == STATUS_IN_PROGRESS)
    {
        if (m_flagState[BG_TEAM_ALLIANCE] == BG_WS_FLAG_STATE_WAIT_RESPAWN)
        {
            m_flagsTimer[BG_TEAM_ALLIANCE] -= diff;

            if (m_flagsTimer[BG_TEAM_ALLIANCE] < 0)
            {
                m_flagsTimer[BG_TEAM_ALLIANCE] = 0;
                RespawnFlag(ALLIANCE, true);
            }
        }
        if (m_flagState[BG_TEAM_ALLIANCE] == BG_WS_FLAG_STATE_ON_GROUND)
        {
            m_flagsDropTimer[BG_TEAM_ALLIANCE] -= diff;

            if (m_flagsDropTimer[BG_TEAM_ALLIANCE] < 0)
            {
                m_flagsDropTimer[BG_TEAM_ALLIANCE] = 0;
                RespawnFlagAfterDrop(ALLIANCE);
            }
        }
        if (m_flagState[BG_TEAM_HORDE] == BG_WS_FLAG_STATE_WAIT_RESPAWN)
        {
            m_flagsTimer[BG_TEAM_HORDE] -= diff;

            if (m_flagsTimer[BG_TEAM_HORDE] < 0)
            {
                m_flagsTimer[BG_TEAM_HORDE] = 0;
                RespawnFlag(HORDE, true);
            }
        }
        if (m_flagState[BG_TEAM_HORDE] == BG_WS_FLAG_STATE_ON_GROUND)
        {
            m_flagsDropTimer[BG_TEAM_HORDE] -= diff;

            if (m_flagsDropTimer[BG_TEAM_HORDE] < 0)
            {
                m_flagsDropTimer[BG_TEAM_HORDE] = 0;
                RespawnFlagAfterDrop(HORDE);
            }
        }
    }
    // Execute this at the end, since it can delete the BattleGround object!
    BattleGround::Update(diff);
}

void BattleGroundWS::StartingEventCloseDoors()
{
}

void BattleGroundWS::StartingEventOpenDoors()
{
    OpenDoorEvent(BG_EVENT_DOOR);

    // TODO implement timer to despawn doors after a short while

    SpawnEvent(WS_EVENT_SPIRITGUIDES_SPAWN, 0, true, true);
    SpawnEvent(WS_EVENT_FLAG_A, 0, true, true);
    SpawnEvent(WS_EVENT_FLAG_H, 0, true, true);
    SpawnEvent(BG_EVENT_GHOST_GATE, 0, false, true);
}

void BattleGroundWS::AddPlayer(Player* player)
{
    BattleGround::AddPlayer(player);
    //create score and add it to map, default values are set in constructor
    BattleGroundWGScore* sc = new BattleGroundWGScore;

    m_playerScores[player->GetObjectGuid()] = sc;
}

void BattleGroundWS::RespawnFlag(Team team, bool captured)
{
    if (team == ALLIANCE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Respawn Alliance flag");
        m_flagState[BG_TEAM_ALLIANCE] = BG_WS_FLAG_STATE_ON_BASE;
        SpawnEvent(WS_EVENT_FLAG_A, 0, true, true);
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Respawn Horde flag");
        m_flagState[BG_TEAM_HORDE] = BG_WS_FLAG_STATE_ON_BASE;
        SpawnEvent(WS_EVENT_FLAG_H, 0, true, true);
    }

    if (captured)
    {
        //when map_update will be allowed for battlegrounds this code will be useless
        SpawnEvent(WS_EVENT_FLAG_A, 0, true, true);
        SpawnEvent(WS_EVENT_FLAG_H, 0, true, true);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        SendMessageToAll(BCT_BG_WS_F_PLACED, CHAT_MSG_BG_SYSTEM_NEUTRAL);
#else
        DoOrSimulateScriptTextForMap(BCT_BG_WS_F_PLACED, NPC_WSG_HERALD, GetBgMap());
#endif
        PlaySoundToAll(BG_WS_SOUND_FLAGS_RESPAWNED);        // flag respawned sound...
    }
}

void BattleGroundWS::RespawnFlagAfterDrop(Team team)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    RespawnFlag(team, false);
    UpdateWorldState(team == HORDE ? BG_WS_FLAG_TAKEN_HORDE : BG_WS_FLAG_TAKEN_ALLIANCE, 0);

    if (team == ALLIANCE)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        SendMessageToAll(BCT_BG_WS_ALLIANCE_FLAG_RESPAWNED, CHAT_MSG_BG_SYSTEM_NEUTRAL);
    else
        SendMessageToAll(BCT_BG_WS_HORDE_FLAG_RESPAWNED, CHAT_MSG_BG_SYSTEM_NEUTRAL);
#else
        DoOrSimulateScriptTextForMap(BCT_BG_WS_ALLIANCE_FLAG_RESPAWNED, NPC_WSG_HERALD, GetBgMap());
    else
        DoOrSimulateScriptTextForMap(BCT_BG_WS_HORDE_FLAG_RESPAWNED, NPC_WSG_HERALD, GetBgMap());
#endif

    PlaySoundToAll(BG_WS_SOUND_FLAGS_RESPAWNED);

    GameObject* obj = GetBgMap()->GetGameObject(GetDroppedFlagGuid(team));
    if (obj)
        obj->Delete();
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unknown dropped flag bg: %s", GetDroppedFlagGuid(team).GetString().c_str());

    ClearDroppedFlagGuid(team);
    ForceFlagAreaTrigger(team);
}

void BattleGroundWS::ForceFlagAreaTrigger(Team team)
{
    // Is the opposite flag carrier at flag spawn position ?
    Player* oppositeFlagKeeper = GetBgMap()->GetPlayer(team == ALLIANCE ? m_flagKeepers[BG_TEAM_HORDE] : m_flagKeepers[BG_TEAM_ALLIANCE]);
    AreaTriggerEntry const* atEntry = sObjectMgr.GetAreaTrigger(team == ALLIANCE ? AREATRIGGER_ALLIANCE_FLAG_SPAWN : AREATRIGGER_HORDE_FLAG_SPAWN);
    if (!atEntry || !oppositeFlagKeeper || !IsPointInAreaTriggerZone(atEntry, oppositeFlagKeeper->GetMapId(), oppositeFlagKeeper->GetPositionX(), oppositeFlagKeeper->GetPositionY(), oppositeFlagKeeper->GetPositionZ(), 2.0f))
        return;
    HandleAreaTrigger(oppositeFlagKeeper, atEntry->id);
}

void BattleGroundWS::EventPlayerCapturedFlag(Player* source)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    Team winner = TEAM_NONE;

    if (source->GetTeam() == ALLIANCE)
    {
        if (!IsHordeFlagPickedup())
            return;
        ClearHordeFlagPicker();                             // must be before aura remove to prevent 2 events (drop+capture) at the same time
        // horde flag in base (but not respawned yet)
        m_flagState[BG_TEAM_HORDE] = BG_WS_FLAG_STATE_WAIT_RESPAWN;
        // Drop Horde Flag from Player
        source->RemoveAurasDueToSpell(BG_WS_SPELL_WARSONG_FLAG);
        if (GetTeamScore(ALLIANCE) < BG_WS_MAX_TEAM_SCORE)
            AddPoint(ALLIANCE, 1);
        PlaySoundToAll(BG_WS_SOUND_FLAG_CAPTURED_ALLIANCE);
        RewardReputationToTeam(890, m_reputationCapture, ALLIANCE);
        UpdateWorldState(BG_WS_FLAG_TAKEN_HORDE, 0);
    }
    else
    {
        if (!IsAllianceFlagPickedup())
            return;
        ClearAllianceFlagPicker();                          // must be before aura remove to prevent 2 events (drop+capture) at the same time
        // alliance flag in base (but not respawned yet)
        m_flagState[BG_TEAM_ALLIANCE] = BG_WS_FLAG_STATE_WAIT_RESPAWN;
        // Drop Alliance Flag from Player
        source->RemoveAurasDueToSpell(BG_WS_SPELL_SILVERWING_FLAG);
        if (GetTeamScore(HORDE) < BG_WS_MAX_TEAM_SCORE)
            AddPoint(HORDE, 1);
        PlaySoundToAll(BG_WS_SOUND_FLAG_CAPTURED_HORDE);
        RewardReputationToTeam(889, m_reputationCapture, HORDE);
        UpdateWorldState(BG_WS_FLAG_TAKEN_ALLIANCE, 0);
    }
    //for flag capture is reward distributed according level range
    RewardHonorToTeam(BG_WSG_FlagCapturedHonor[GetBracketId()], source->GetTeam());

    // despawn flags
    SpawnEvent(WS_EVENT_FLAG_A, 0, false, true);
    SpawnEvent(WS_EVENT_FLAG_H, 0, false, true);

    if (source->GetTeam() == ALLIANCE)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        SendMessageToAll(BCT_BG_WS_CAPTURED_HF, CHAT_MSG_BG_SYSTEM_ALLIANCE, source);
    else
        SendMessageToAll(BCT_BG_WS_CAPTURED_AF, CHAT_MSG_BG_SYSTEM_HORDE, source);
#else
        DoOrSimulateScriptTextForMap(BCT_BG_WS_CAPTURED_HF, NPC_WSG_HERALD, GetBgMap(), nullptr, source);
    else
        DoOrSimulateScriptTextForMap(BCT_BG_WS_CAPTURED_AF, NPC_WSG_HERALD, GetBgMap(), nullptr, source);
#endif

    UpdateFlagState(source->GetTeam(), 1);                  // flag state none
    UpdateTeamScore(source->GetTeam());
    // only flag capture should be updated
    UpdatePlayerScore(source, SCORE_FLAG_CAPTURES, 1);      // +1 flag captures

    if (GetTeamScore(ALLIANCE) == BG_WS_MAX_TEAM_SCORE)
        winner = ALLIANCE;

    if (GetTeamScore(HORDE) == BG_WS_MAX_TEAM_SCORE)
        winner = HORDE;

    if (winner)
    {
        UpdateWorldState(BG_WS_FLAG_STATE_ALLIANCE, 1);
        UpdateWorldState(BG_WS_FLAG_STATE_HORDE, 1);
        EndBattleGround(winner);
    }
    else
        m_flagsTimer[GetOtherTeamIndex(GetTeamIndexByTeamId(source->GetTeam()))] = BG_WS_FLAG_RESPAWN_TIME;
}

void BattleGroundWS::EventPlayerDroppedFlag(Player* source)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
    {
        // if not running, do not cast things at the dropper player (prevent spawning the "dropped" flag), neither send unnecessary messages
        // just take off the aura
        if (source->GetTeam() == ALLIANCE)
        {
            if (!IsHordeFlagPickedup())
                return;
            if (GetHordeFlagPickerGuid() == source->GetObjectGuid())
            {
                ClearHordeFlagPicker();
                source->RemoveAurasDueToSpell(BG_WS_SPELL_WARSONG_FLAG);
            }
        }
        else
        {
            if (!IsAllianceFlagPickedup())
                return;
            if (GetAllianceFlagPickerGuid() == source->GetObjectGuid())
            {
                ClearAllianceFlagPicker();
                source->RemoveAurasDueToSpell(BG_WS_SPELL_SILVERWING_FLAG);
            }
        }
        return;
    }

    bool set = false;

    if (source->GetTeam() == ALLIANCE)
    {
        if (!IsHordeFlagPickedup())
            return;
        if (GetHordeFlagPickerGuid() == source->GetObjectGuid())
        {
            ClearHordeFlagPicker();
            source->RemoveAurasDueToSpell(BG_WS_SPELL_WARSONG_FLAG);
            m_flagState[BG_TEAM_HORDE] = BG_WS_FLAG_STATE_ON_GROUND;
            source->CastSpell(source, BG_WS_SPELL_WARSONG_FLAG_DROPPED, true);
            set = true;
        }
    }
    else
    {
        if (!IsAllianceFlagPickedup())
            return;
        if (GetAllianceFlagPickerGuid() == source->GetObjectGuid())
        {
            ClearAllianceFlagPicker();
            source->RemoveAurasDueToSpell(BG_WS_SPELL_SILVERWING_FLAG);
            m_flagState[BG_TEAM_ALLIANCE] = BG_WS_FLAG_STATE_ON_GROUND;
            source->CastSpell(source, BG_WS_SPELL_SILVERWING_FLAG_DROPPED, true);
            set = true;
        }
    }

    if (set)
    {
        UpdateFlagState(source->GetTeam(), 1);

        if (source->GetTeam() == ALLIANCE)
        {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            SendMessageToAll(BCT_BG_WS_DROPPED_HF, CHAT_MSG_BG_SYSTEM_HORDE, source);
#else
            DoOrSimulateScriptTextForMap(BCT_BG_WS_DROPPED_HF, NPC_WSG_HERALD, GetBgMap(), nullptr, source);
#endif
            UpdateWorldState(BG_WS_FLAG_TAKEN_HORDE, uint32(-1));
        }
        else
        {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            SendMessageToAll(BCT_BG_WS_DROPPED_AF, CHAT_MSG_BG_SYSTEM_ALLIANCE, source);
#else
            DoOrSimulateScriptTextForMap(BCT_BG_WS_DROPPED_AF, NPC_WSG_HERALD, GetBgMap(), nullptr, source);
#endif
            UpdateWorldState(BG_WS_FLAG_TAKEN_ALLIANCE, uint32(-1));
        }

        m_flagsDropTimer[GetOtherTeamIndex(GetTeamIndexByTeamId(source->GetTeam()))] = BG_WS_FLAG_DROP_TIME;
    }
}

void BattleGroundWS::EventPlayerClickedOnFlag(Player* source, GameObject* targetGo)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    int32 messageId = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    ChatMsg type;
#endif

    uint8 event = (sBattleGroundMgr.GetGameObjectEventIndex(targetGo->GetGUIDLow())).event1;

    //alliance flag picked up from base
    if (source->GetTeam() == HORDE && GetFlagState(ALLIANCE) == BG_WS_FLAG_STATE_ON_BASE
            && event == WS_EVENT_FLAG_A)
    {
        messageId = BCT_BG_WS_PICKEDUP_AF;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        type = CHAT_MSG_BG_SYSTEM_HORDE;
#endif
        PlaySoundToAll(BG_WS_SOUND_ALLIANCE_FLAG_PICKED_UP);
        SpawnEvent(WS_EVENT_FLAG_A, 0, false, true);
        SetAllianceFlagPicker(source->GetObjectGuid());
        m_flagState[BG_TEAM_ALLIANCE] = BG_WS_FLAG_STATE_ON_PLAYER;
        //update world state to show correct flag carrier
        UpdateFlagState(HORDE, BG_WS_FLAG_STATE_ON_PLAYER);
        UpdateWorldState(BG_WS_FLAG_TAKEN_ALLIANCE, 1);
        source->CastSpell(source, BG_WS_SPELL_SILVERWING_FLAG, true);
    }

    //horde flag picked up from base
    if (source->GetTeam() == ALLIANCE && GetFlagState(HORDE) == BG_WS_FLAG_STATE_ON_BASE
            && event == WS_EVENT_FLAG_H)
    {
        messageId = BCT_BG_WS_PICKEDUP_HF;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        type = CHAT_MSG_BG_SYSTEM_ALLIANCE;
#endif
        PlaySoundToAll(BG_WS_SOUND_HORDE_FLAG_PICKED_UP);
        SpawnEvent(WS_EVENT_FLAG_H, 0, false, true);
        SetHordeFlagPicker(source->GetObjectGuid());
        m_flagState[BG_TEAM_HORDE] = BG_WS_FLAG_STATE_ON_PLAYER;
        //update world state to show correct flag carrier
        UpdateFlagState(ALLIANCE, BG_WS_FLAG_STATE_ON_PLAYER);
        UpdateWorldState(BG_WS_FLAG_TAKEN_HORDE, 1);
        source->CastSpell(source, BG_WS_SPELL_WARSONG_FLAG, true);
    }

    //Alliance flag on ground(not in base) (returned or picked up again from ground!)
    if (GetFlagState(ALLIANCE) == BG_WS_FLAG_STATE_ON_GROUND &&
            source->IsWithinDistInMap(targetGo, 10) &&
            targetGo->GetEntry() == WS_ALLIANCE_FLAG_GROUND)
    {
        if (source->GetTeam() == ALLIANCE)
        {
            messageId = BCT_BG_WS_RETURNED_AF;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            type = CHAT_MSG_BG_SYSTEM_ALLIANCE;
#endif
            UpdateFlagState(HORDE, BG_WS_FLAG_STATE_WAIT_RESPAWN);
            RespawnFlag(ALLIANCE, false);
            PlaySoundToAll(BG_WS_SOUND_FLAG_RETURNED);
            UpdatePlayerScore(source, SCORE_FLAG_RETURNS, 1);
            ForceFlagAreaTrigger(ALLIANCE);
        }
        else
        {
            messageId = BCT_BG_WS_PICKEDUP_AF;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            type = CHAT_MSG_BG_SYSTEM_HORDE;
#endif
            PlaySoundToAll(BG_WS_SOUND_ALLIANCE_FLAG_PICKED_UP);
            SpawnEvent(WS_EVENT_FLAG_A, 0, false, true);
            SetAllianceFlagPicker(source->GetObjectGuid());
            source->CastSpell(source, BG_WS_SPELL_SILVERWING_FLAG, true);
            m_flagState[BG_TEAM_ALLIANCE] = BG_WS_FLAG_STATE_ON_PLAYER;
            UpdateFlagState(HORDE, BG_WS_FLAG_STATE_ON_PLAYER);
            UpdateWorldState(BG_WS_FLAG_TAKEN_ALLIANCE, 1);
        }
        //called in HandleGameObjectUseOpcode:
        //targetGo->Delete();
    }

    //Horde flag on ground(not in base) (returned or picked up again)
    if (GetFlagState(HORDE) == BG_WS_FLAG_STATE_ON_GROUND &&
            source->IsWithinDistInMap(targetGo, 10) &&
            targetGo->GetEntry() == WS_HORDE_FLAG_GROUND)
    {
        if (source->GetTeam() == HORDE)
        {
            messageId = BCT_BG_WS_RETURNED_HF;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            type = CHAT_MSG_BG_SYSTEM_HORDE;
#endif
            UpdateFlagState(ALLIANCE, BG_WS_FLAG_STATE_WAIT_RESPAWN);
            RespawnFlag(HORDE, false);
            PlaySoundToAll(BG_WS_SOUND_FLAG_RETURNED);
            UpdatePlayerScore(source, SCORE_FLAG_RETURNS, 1);
            ForceFlagAreaTrigger(HORDE);
        }
        else
        {
            messageId = BCT_BG_WS_PICKEDUP_HF;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            type = CHAT_MSG_BG_SYSTEM_ALLIANCE;
#endif
            PlaySoundToAll(BG_WS_SOUND_HORDE_FLAG_PICKED_UP);
            SpawnEvent(WS_EVENT_FLAG_H, 0, false, true);
            SetHordeFlagPicker(source->GetObjectGuid());
            source->CastSpell(source, BG_WS_SPELL_WARSONG_FLAG, true);
            m_flagState[BG_TEAM_HORDE] = BG_WS_FLAG_STATE_ON_PLAYER;
            UpdateFlagState(ALLIANCE, BG_WS_FLAG_STATE_ON_PLAYER);
            UpdateWorldState(BG_WS_FLAG_TAKEN_HORDE, 1);
        }
        //called in HandleGameObjectUseOpcode:
        //targetGo->Delete();
    }

    if (!messageId)
        return;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    SendMessageToAll(messageId, type, source);
#else
    DoOrSimulateScriptTextForMap(messageId, NPC_WSG_HERALD, GetBgMap(), nullptr, source);
#endif
}

void BattleGroundWS::RemovePlayer(Player* player, ObjectGuid guid)
{
    // sometimes flag aura not removed :(
    if (IsAllianceFlagPickedup() && m_flagKeepers[BG_TEAM_ALLIANCE] == guid)
    {
        if (!player)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGroundWS: Removing offline player who has the FLAG!!");
            ClearAllianceFlagPicker();
            RespawnFlag(ALLIANCE, false);
        }
        else
            EventPlayerDroppedFlag(player);
    }
    if (IsHordeFlagPickedup() && m_flagKeepers[BG_TEAM_HORDE] == guid)
    {
        if (!player)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleGroundWS: Removing offline player who has the FLAG!!");
            ClearHordeFlagPicker();
            RespawnFlag(HORDE, false);
        }
        else
            EventPlayerDroppedFlag(player);
    }
}

void BattleGroundWS::UpdateFlagState(Team team, uint32 value)
{
    if (team == ALLIANCE)
        UpdateWorldState(BG_WS_FLAG_STATE_ALLIANCE, value);
    else
        UpdateWorldState(BG_WS_FLAG_STATE_HORDE, value);
}

void BattleGroundWS::UpdateTeamScore(Team team)
{
    if (team == ALLIANCE)
        UpdateWorldState(BG_WS_FLAG_CAPTURES_ALLIANCE, GetTeamScore(team));
    else
        UpdateWorldState(BG_WS_FLAG_CAPTURES_HORDE, GetTeamScore(team));
}

bool BattleGroundWS::HandleAreaTrigger(Player* source, uint32 trigger)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return false;

    switch (trigger)
    {
        case 3686:                                          // Alliance elixir of speed spawn. Trigger not working, because located inside other areatrigger, can be replaced by IsWithinDist(object, dist) in BattleGround::Update().
        case 3687:                                          // Horde elixir of speed spawn. Trigger not working, because located inside other areatrigger, can be replaced by IsWithinDist(object, dist) in BattleGround::Update().
        case 3706:                                          // Alliance elixir of regeneration spawn
        case 3708:                                          // Horde elixir of regeneration spawn
        case 3707:                                          // Alliance elixir of berserk spawn
        case 3709:                                          // Horde elixir of berserk spawn
            return true;
        case AREATRIGGER_ALLIANCE_FLAG_SPAWN:               // Alliance Flag spawn
            if (m_flagState[BG_TEAM_HORDE] && !m_flagState[BG_TEAM_ALLIANCE])
                if (GetHordeFlagPickerGuid() == source->GetObjectGuid())
                    EventPlayerCapturedFlag(source);
            return true;
        case AREATRIGGER_HORDE_FLAG_SPAWN:                  // Horde Flag spawn
            if (m_flagState[BG_TEAM_ALLIANCE] && !m_flagState[BG_TEAM_HORDE])
                if (GetAllianceFlagPickerGuid() == source->GetObjectGuid())
                    EventPlayerCapturedFlag(source);
            return true;
        case 3669: // Warsong Gulch - Horde Exit
            // World of Warcraft Client Patch 1.7.0 (2005-09-13)
            // - Characters that use the Battlemaster to enter a Battleground will
            //   now port back to that Battlemaster when they leave the Battleground
            //   for any reason.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            if (source->GetTeam() == HORDE)
            {
                source->LeaveBattleground();
                return true;
            }
#endif
            return false;
        case 3671: // Warsong Gulch - Alliance Exit
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            if (source->GetTeam() == ALLIANCE)
            {
                source->LeaveBattleground();
                return true;
            }
#endif
            return false;
        /*case 3649:                                          // unk1
          case 3688:                                          // unk2
          case 4628:                                          // unk3
          case 4629:                                          // unk4
              break; */
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WARNING: Unhandled AreaTrigger in Battleground: %u", trigger);
            source->GetSession()->SendAreaTriggerMessage("Warning: Unhandled AreaTrigger in Battleground: %u", trigger);
            break;
    }
    return false;
}

bool BattleGroundWS::SetupBattleGround()
{
    return true;
}

void BattleGroundWS::Reset()
{
    //call parent's class reset
    BattleGround::Reset();

    // spiritguides and flags not spawned at beginning
    m_activeEvents[WS_EVENT_SPIRITGUIDES_SPAWN] = BG_EVENT_NONE;
    m_activeEvents[WS_EVENT_FLAG_A] = BG_EVENT_NONE;
    m_activeEvents[WS_EVENT_FLAG_H] = BG_EVENT_NONE;
    // ghost gates spawned at beginning
    m_activeEvents[BG_EVENT_GHOST_GATE] = 0;

    for (uint32 i = 0; i < BG_TEAMS_COUNT; ++i)
    {
        m_droppedFlagGuid[i].Clear();
        m_flagKeepers[i].Clear();
        m_flagState[i]       = BG_WS_FLAG_STATE_ON_BASE;
        m_teamScores[i]      = 0;
    }
    bool isBGWeekend = BattleGroundMgr::IsBgWeekend(GetTypeID());

    m_reputationCapture = (isBGWeekend) ? 45 : 35;

    // [-PROGRESSIVE] < 1.10
    if (sWorld.GetWowPatch() < WOW_PATCH_110 && sWorld.getConfig(CONFIG_BOOL_ACCURATE_PVP_REWARDS))
        m_reputationCapture = (isBGWeekend) ? 30 : 20;

    m_honorWinKills = (isBGWeekend) ? 3 : 1;
    m_honorEndKills = (isBGWeekend) ? 4 : 2;
}

void BattleGroundWS::EndBattleGround(Team winner)
{
    bool isBGWeekend = BattleGroundMgr::IsBgWeekend(GetTypeID());
    // Completing bonus during holidays. Factions reveive honor, win or lose.
    if (isBGWeekend)
    {
        RewardHonorToTeam(BG_WSG_WinMatchHonorBonusCompleteHolidays[GetBracketId()], ALLIANCE);
        RewardHonorToTeam(BG_WSG_WinMatchHonorBonusCompleteHolidays[GetBracketId()], HORDE);
    }
    //win reward
    if (winner == ALLIANCE)
    {
        RewardHonorToTeam(BG_WSG_WinMatchHonor[GetBracketId()], ALLIANCE);
        if (isBGWeekend)
            RewardHonorToTeam(BG_WSG_WinMatchHonorHolidays[GetBracketId()], ALLIANCE);
    }
    if (winner == HORDE)
    {
        RewardHonorToTeam(BG_WSG_WinMatchHonor[GetBracketId()], HORDE);
        if (isBGWeekend)
            RewardHonorToTeam(BG_WSG_WinMatchHonorHolidays[GetBracketId()], HORDE);
    }

    BattleGround::EndBattleGround(winner);
}

void BattleGroundWS::HandleKillPlayer(Player* pVictim, Player* pKiller)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    EventPlayerDroppedFlag(pVictim);

    BattleGround::HandleKillPlayer(pVictim, pKiller);
}

void BattleGroundWS::UpdatePlayerScore(Player* source, uint32 type, uint32 value)
{

    BattleGroundScoreMap::iterator itr = m_playerScores.find(source->GetObjectGuid());
    if (itr == m_playerScores.end())                        // player not found
        return;

    switch (type)
    {
        case SCORE_FLAG_CAPTURES:                           // flags captured
            ((BattleGroundWGScore*)itr->second)->flagCaptures += value;
            break;
        case SCORE_FLAG_RETURNS:                            // flags returned
            ((BattleGroundWGScore*)itr->second)->flagReturns += value;
            break;
        default:
            BattleGround::UpdatePlayerScore(source, type, value);
            break;
    }
}

WorldSafeLocsEntry const* BattleGroundWS::GetClosestGraveYard(Player* player)
{
    // repop players at the entrance GY if BG is not started yet
    if (player->GetTeam() == ALLIANCE)
    {
        if (GetStatus() == STATUS_IN_PROGRESS)
            return sWorldSafeLocsStore.LookupEntry(WS_GRAVEYARD_MAIN_ALLIANCE);
        return sWorldSafeLocsStore.LookupEntry(WS_GRAVEYARD_FLAGROOM_ALLIANCE);
    }

    if (GetStatus() == STATUS_IN_PROGRESS)
        return sWorldSafeLocsStore.LookupEntry(WS_GRAVEYARD_MAIN_HORDE);

    return sWorldSafeLocsStore.LookupEntry(WS_GRAVEYARD_FLAGROOM_HORDE);
}

void BattleGroundWS::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    FillInitialWorldState(data, count, BG_WS_FLAG_CAPTURES_ALLIANCE, GetTeamScore(ALLIANCE));
    FillInitialWorldState(data, count, BG_WS_FLAG_CAPTURES_HORDE, GetTeamScore(HORDE));

    if (m_flagState[BG_TEAM_ALLIANCE] == BG_WS_FLAG_STATE_ON_GROUND)
        FillInitialWorldState(data, count, BG_WS_FLAG_TAKEN_ALLIANCE, -1);
    else if (m_flagState[BG_TEAM_ALLIANCE] == BG_WS_FLAG_STATE_ON_PLAYER)
        FillInitialWorldState(data, count, BG_WS_FLAG_TAKEN_ALLIANCE, 1);
    else
        FillInitialWorldState(data, count, BG_WS_FLAG_TAKEN_ALLIANCE, 0);

    if (m_flagState[BG_TEAM_HORDE] == BG_WS_FLAG_STATE_ON_GROUND)
        FillInitialWorldState(data, count, BG_WS_FLAG_TAKEN_HORDE, -1);
    else if (m_flagState[BG_TEAM_HORDE] == BG_WS_FLAG_STATE_ON_PLAYER)
        FillInitialWorldState(data, count, BG_WS_FLAG_TAKEN_HORDE, 1);
    else
        FillInitialWorldState(data, count, BG_WS_FLAG_TAKEN_HORDE, 0);

    FillInitialWorldState(data, count, BG_WS_FLAG_CAPTURES_MAX, BG_WS_MAX_TEAM_SCORE);

    if (m_flagState[BG_TEAM_HORDE] == BG_WS_FLAG_STATE_ON_PLAYER)
        FillInitialWorldState(data, count, BG_WS_FLAG_STATE_ALLIANCE, 2);
    else
        FillInitialWorldState(data, count, BG_WS_FLAG_STATE_ALLIANCE, 1);

    if (m_flagState[BG_TEAM_ALLIANCE] == BG_WS_FLAG_STATE_ON_PLAYER)
        FillInitialWorldState(data, count, BG_WS_FLAG_STATE_HORDE, 2);
    else
        FillInitialWorldState(data, count, BG_WS_FLAG_STATE_HORDE, 1);
}
