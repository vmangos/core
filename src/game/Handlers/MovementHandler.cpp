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

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "Player.h"
#include "MapManager.h"
#include "Transport.h"
#include "BattleGround.h"
#include "WaypointMovementGenerator.h"
#include "ConfusedMovementGenerator.h"
#include "MapPersistentStateMgr.h"
#include "World.h"
#include "Anticheat.h"
#include "packet_builder.h"
#include "MovementPacketSender.h"
#include "MoveSpline.h"
#include "Geometry.h"

void WorldSession::HandleMoveWorldportAckOpcode(WorldPacket& /*recvData*/)
{
    HandleMoveWorldportAckOpcode();
}

void WorldSession::HandleMoveWorldportAckOpcode()
{
    // ignore unexpected far teleports
    if (!GetPlayer()->IsBeingTeleportedFar())
        return;

    // get start teleport coordinates (will used later in fail case)
    WorldLocation oldLoc;
    GetPlayer()->GetPosition(oldLoc);

    // get the teleport destination
    WorldLocation &loc = GetPlayer()->GetTeleportDest();

    // possible errors in the coordinate validity check (only cheating case possible)
    if (!MapManager::IsValidMapCoord(loc))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandleMoveWorldportAckOpcode: %s was teleported far to a not valid location "
                      "(map:%u, x:%f, y:%f, z:%f) We port him to his homebind instead..",
                      GetPlayer()->GetGuidStr().c_str(), loc.mapId, loc.x, loc.y, loc.z);
        // stop teleportation else we would try this again and again in LogoutPlayer...
        GetPlayer()->SetSemaphoreTeleportFar(false);
        // and teleport the player to a valid place
        GetPlayer()->TeleportToHomebind();
        return;
    }

    // get the destination map entry, not the current one, this will fix homebind and reset greeting
    MapEntry const* mEntry = sMapStorage.LookupEntry<MapEntry>(loc.mapId);

    Map* map = nullptr;

    // prevent crash at attempt landing to not existed battleground instance
    if (mEntry->IsBattleGround())
    {
        if (GetPlayer()->GetBattleGroundId())
            map = sMapMgr.FindMap(loc.mapId, GetPlayer()->GetBattleGroundId());

        if (!map)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WorldSession::HandleMoveWorldportAckOpcode: %s was teleported far to nonexistent battleground instance "
                       " (map:%u, x:%f, y:%f, z:%f) Trying to port him to his previous place..",
                       GetPlayer()->GetGuidStr().c_str(), loc.mapId, loc.x, loc.y, loc.z);

            GetPlayer()->HandleReturnOnTeleportFail(oldLoc);
            return;
        }
    }

    // reset instance validity, except if going to an instance inside an instance
    if (!GetPlayer()->m_InstanceValid && !mEntry->IsDungeon())
        GetPlayer()->m_InstanceValid = true;

    // relocate the player to the teleport destination
    if (!map)
    {
        if (loc.mapId <= 1)
            GetPlayer()->SetLocationInstanceId(sMapMgr.GetContinentInstanceId(loc.mapId, loc.x, loc.y));
        map = sMapMgr.CreateMap(loc.mapId, GetPlayer());
    }

    GetPlayer()->SetMap(map);
    if (GenericTransport* t = GetPlayer()->GetTransport()) // Transport position may have changed while loading
        t->UpdatePassengerPosition(GetPlayer());
    else
        GetPlayer()->Relocate(loc.x, loc.y, loc.z, loc.o);

    GetPlayer()->SendInitialPacketsBeforeAddToMap();
    // the CanEnter checks are done in TeleporTo but conditions may change
    // while the player is in transit, for example the map may get full
    if (!GetPlayer()->GetMap()->Add(GetPlayer()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WorldSession::HandleMoveWorldportAckOpcode: %s was teleported far but couldn't be added to map "
                   " (map:%u, x:%f, y:%f, z:%f) Trying to port him to his previous place..",
                   GetPlayer()->GetGuidStr().c_str(), loc.mapId, loc.x, loc.y, loc.z);

        GetPlayer()->HandleReturnOnTeleportFail(oldLoc);
        return;
    }
    GetPlayer()->SetSemaphoreTeleportFar(false);

    // battleground state prepare (in case join to BG), at relogin/tele player not invited
    // only add to bg group and object, if the player was invited (else he entered through command)
    if (_player->InBattleGround())
    {
        // cleanup seting if outdated
        if (!mEntry->IsBattleGround())
        {
            // We're not in BG
            _player->SetBattleGroundId(0, BATTLEGROUND_TYPE_NONE);
            // reset destination bg team
            _player->SetBGTeam(TEAM_NONE);
        }
        // join to bg case
        else if (BattleGround *bg = _player->GetBattleGround())
        {
            if (_player->IsInvitedForBattleGroundInstance(_player->GetBattleGroundId()))
                bg->AddPlayer(_player);
        }
    }

    GetPlayer()->SendInitialPacketsAfterAddToMap();

    // flight fast teleport case
    if (GetPlayer()->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLIGHT_MOTION_TYPE)
    {
        // the movement could be expiring so check for destination (ritual of summoning / gm teleport)
        if (!_player->InBattleGround() && !_player->m_taxi.empty())
        {
            // short preparations to continue flight
            FlightPathMovementGenerator* flight = (FlightPathMovementGenerator*)(GetPlayer()->GetMotionMaster()->top());
            flight->Reset(*GetPlayer());
            return;
        }

        // battleground state prepare, stop flight
        GetPlayer()->GetMotionMaster()->MovementExpired();
        GetPlayer()->m_taxi.ClearTaxiDestinations();
    }

    if (mEntry->IsRaid())
    {
        if (time_t timeReset = sMapPersistentStateMgr.GetScheduler().GetResetTimeFor(mEntry->id))
        {
            uint32 timeleft = uint32(timeReset - time(nullptr));
            GetPlayer()->SendInstanceResetWarning(mEntry->id, timeleft);
        }
    }
    else if (!mEntry->IsDungeon())
    {
        MapEntry const* oldMapEntry = sMapStorage.LookupEntry<MapEntry>(oldLoc.mapId);
        if (oldMapEntry->IsDungeon())
            GetPlayer()->ResetPersonalInstanceOnLeaveDungeon(oldLoc.mapId);
    }

    GetPlayer()->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_ENTER_WORLD_CANCELS);

    // mount allow check
    if (!mEntry->IsMountAllowed())
        _player->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    // honorless target
    if (!GetPlayer()->pvpInfo.inPvPEnforcedArea)
        GetPlayer()->RemoveDelayedOperation(DELAYED_CAST_HONORLESS_TARGET);

    // resummon pet
    GetPlayer()->ResummonPetTemporaryUnSummonedIfAny();

    // stop drowning if not in water anymore
    GetPlayer()->UpdateTerainEnvironmentFlags();

    //lets process all delayed operations on successful teleport
    GetPlayer()->ProcessDelayedOperations();

    // Let the client know its new position by sending a heartbeat!
    // The Windows client figures this out by itself, but the MacOS one does
    // not.
    //
    // On a successful port, the camera of the MacOS client is facing south and
    // ignores any movement from the transport object. Triggering
    // `SMSG_STANDSTATE_UPDATE' with its current state resets the camera
    // (implemented in `WorldSession::HandleZoneUpdateOpcode').
    if (m_clientOS == CLIENT_OS_MAC && GetPlayer()->m_movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        GetPlayer()->SendHeartBeat(true);
    }
}

void WorldSession::HandleMoveTeleportAckOpcode(WorldPacket& recvData)
{
    ObjectGuid guid;
    recvData >> guid;
    uint32 movementCounter = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recvData >> movementCounter;
#endif
    uint32 time = 0;
    recvData >> time;

    Unit* pMover = _player->GetMover();
    Player* pPlayerMover = pMover->ToPlayer();

    if (!pPlayerMover || !pPlayerMover->IsBeingTeleportedNear())
        return;

    if (guid != pPlayerMover->GetObjectGuid())
        return;

    if (!pMover->FindPendingMovementTeleportChange(movementCounter))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMoveTeleportAckOpcode: Player %s from account id %u sent MSG_MOVE_TELEPORT_ACK with counter %u, but no pending teleport found (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), movementCounter, pMover->GetMovementCounter());
    }

    pPlayerMover->SetSplineDonePending(false);
    pPlayerMover->ExecuteTeleportNear();
}

void Player::ExecuteTeleportNear()
{
    if (!IsBeingTeleportedNear())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Player::ExecuteNearTeleport called without near teleport scheduled!");
        return;
    }

    SetSemaphoreTeleportNear(false);

    // send MSG_MOVE_TELEPORT to observers around both old and new position
    WorldLocation const& dest = GetTeleportDest();
    MovementPacketSender::SendTeleportToObservers(this, dest.x, dest.y, dest.z, dest.o);
    m_movementInfo.UpdateTime(WorldTimer::getMSTime());
    TeleportPositionRelocation(dest);
    MovementPacketSender::SendTeleportToObservers(this, dest.x, dest.y, dest.z, dest.o);

    // if player is sheeped make him wander around new position
    if (GetMotionMaster()->GetCurrentMovementGeneratorType() == CONFUSED_MOTION_TYPE)
    {
        ConfusedMovementGenerator<Player>* confuse = (ConfusedMovementGenerator<Player>*)(GetMotionMaster()->top());
        confuse->SetStartPosition(dest.x, dest.y, dest.z);
    }

    // resummon pet, if the destination is in another continent instance, let Player::SwitchInstance do it
    // because the client will request the name for the old pet guid and receive no answer
    // result would be a pet named "unknown"
    if (GetTemporaryUnsummonedPetNumber())
    {
        if (sWorld.getConfig(CONFIG_BOOL_CONTINENTS_INSTANCIATE) && GetMap()->IsContinent())
        {
            bool transition = false;
            if (sMapMgr.GetContinentInstanceId(GetMap()->GetId(), dest.x, dest.y, &transition) == GetInstanceId())
                ResummonPetTemporaryUnSummonedIfAny();
        }
        else
            ResummonPetTemporaryUnSummonedIfAny();
    }

    // lets process all delayed operations on successful teleport
    ProcessDelayedOperations();
}

void WorldSession::HandleMovementOpcodes(WorldPacket& recvData)
{
    uint32 opcode = recvData.GetOpcode();

    // Do not accept packets sent before this time.
    if (recvData.GetPacketTime() <= m_moveRejectTime)
        return;

    Unit* pMover = _player->GetConfirmedMover();
    if (!pMover)
        return;

    if (pMover->HasPendingSplineDone())
        return;

    // currently being moved by server
    if (!pMover->movespline->Finalized())
        return;
        
    Player* pPlayerMover = pMover->ToPlayer();

    // ignore, waiting processing in WorldSession::HandleMoveWorldportAckOpcode and WorldSession::HandleMoveTeleportAck
    if (pPlayerMover && pPlayerMover->IsBeingTeleported())
        return;

    /* extract packet */
    MovementInfo movementInfo = pPlayerMover ? pPlayerMover->m_movementInfo : MovementInfo();
    recvData >> movementInfo;
    movementInfo.UpdateTime(recvData.GetPacketTime());
    /*----------------*/

    if (!VerifyMovementInfo(movementInfo))
        return;

    if (pPlayerMover)
    {
        if ((m_moveRejectTime = _player->GetCheatData()->HandleFlagTests(pPlayerMover, movementInfo, opcode)) ||
            (m_moveRejectTime = _player->GetCheatData()->HandlePositionTests(pPlayerMover, movementInfo, opcode)))
        {
            return;
        }
    }

    // This is required for proper movement extrapolation
    if (opcode == MSG_MOVE_JUMP)
        pMover->SetJumpInitialSpeed(7.95797334f);
    else if (opcode == MSG_MOVE_FALL_LAND)
        pMover->SetJumpInitialSpeed(-9.645f);

    // fall damage generation (ignore in flight case that can be triggered also at lags in moment teleportation to another map).
    if (opcode == MSG_MOVE_FALL_LAND && pPlayerMover && !pPlayerMover->IsTaxiFlying())
        pPlayerMover->HandleFall(movementInfo);

    // TODO: remove it
    // reset knockback state when fall to ground or water
    if (pPlayerMover)
    {
        if (IsFallEndOpcode(opcode) && pPlayerMover->IsLaunched())
        {
            pPlayerMover->SetLaunched(false);
            pPlayerMover->SetXYSpeed(0.0f);
        }

        pPlayerMover->UpdateFallInformationIfNeed(movementInfo, opcode);
    }

    HandleMoverRelocation(pMover, movementInfo);

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    // this is here to accommodate 1.14 client behavior
    // it does not interrupt falling when rooted
    // verify that root is applied after having landed
    if (pMover->HasUnitState(UNIT_STAT_ROOT_ON_LANDING))
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_ROOT) || !pMover->ShouldBeRooted())
            pMover->ClearUnitState(UNIT_STAT_ROOT_ON_LANDING);
        else if (!movementInfo.HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMovementOpcodes: Player %s from account id %u has pending root on landing, but sent movement packet with opcode %u not containing root or falling flags!",
                _player->GetName(), _player->GetSession()->GetAccountId(), opcode);
            pMover->ClearUnitState(UNIT_STAT_ROOT_ON_LANDING);
            pMover->SetRootedReal(true);
            KickPlayer();
            return;
        }
    }
#endif

    // CMSG opcode has no handler in client, should not be sent to others.
    // It is sent by client when you jump and hit something on the way up,
    // thus stopping upward movement and causing you to descend sooner.
    if (opcode == CMSG_MOVE_FALL_RESET)
        return;

    // This opcode has no handler in this client build.
#if SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_9_4
    if (opcode == MSG_MOVE_FALL_LAND)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING))
            opcode = MSG_MOVE_STOP;
        else if (movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD))
            opcode = MSG_MOVE_START_BACKWARD;
        else if (movementInfo.HasMovementFlag(MOVEFLAG_FORWARD))
            opcode = MSG_MOVE_START_FORWARD;
        else if (movementInfo.HasMovementFlag(MOVEFLAG_STRAFE_LEFT))
            opcode = MSG_MOVE_START_STRAFE_LEFT;
        else if (movementInfo.HasMovementFlag(MOVEFLAG_STRAFE_RIGHT))
            opcode = MSG_MOVE_START_STRAFE_RIGHT;
        else
            opcode = MSG_MOVE_HEARTBEAT;
    }
#endif

    WorldPacket data(opcode, recvData.size());

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << m_clientMoverGuid.WriteAsPacked();
#else
    data << m_clientMoverGuid.GetRawValue();
#endif
    movementInfo.Write(data);

    pMover->SendMovementMessageToSet(std::move(data), true, _player);
}

/*
handles those packets:
CMSG_FORCE_RUN_SPEED_CHANGE_ACK
CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK
CMSG_FORCE_SWIM_SPEED_CHANGE_ACK
CMSG_FORCE_WALK_SPEED_CHANGE_ACK
CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK
CMSG_FORCE_TURN_RATE_CHANGE_ACK
*/
void WorldSession::HandleForceSpeedChangeAckOpcodes(WorldPacket& recvData)
{
    uint32 const opcode = recvData.GetOpcode();

    /* extract packet */
    ObjectGuid guid;
    recvData >> guid;
    uint32 movementCounter = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recvData >> movementCounter;
#endif
    MovementInfo movementInfo;
    recvData >> movementInfo;
    float  speedReceived;
    recvData >> speedReceived;
    movementInfo.UpdateTime(recvData.GetPacketTime());
    /*----------------*/

    UnitMoveType move_type;
    switch (opcode)
    {
        case CMSG_FORCE_WALK_SPEED_CHANGE_ACK:
            move_type = MOVE_WALK;
            break;
        case CMSG_FORCE_RUN_SPEED_CHANGE_ACK:
            move_type = MOVE_RUN;
            break;
        case CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK:
            move_type = MOVE_RUN_BACK;
            break;
        case CMSG_FORCE_SWIM_SPEED_CHANGE_ACK:
            move_type = MOVE_SWIM;
            break;
        case CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK:
            move_type = MOVE_SWIM_BACK;
            break;
        case CMSG_FORCE_TURN_RATE_CHANGE_ACK:
            move_type = MOVE_TURN_RATE;
            break;
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandleForceSpeedChangeAck: Unknown move type opcode: %u", opcode);
            return;
    }

    Unit* pMover = GetMoverFromGuid(guid);
    if (!pMover)
        return;

    // verify that indeed the client is replying with the changes that were send to him
    if (!pMover->HasPendingMovementChange())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleForceSpeedChangeAck: Player %s from account id %u sent opcode %u with counter %u, but no movement change ack was expected from this player (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), opcode, movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    if (!pMover->FindPendingMovementSpeedChange(speedReceived, movementCounter, move_type))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleForceSpeedChangeAck: Player %s from account id %u sent opcode %u with counter %u, but received data does not match pending change (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), opcode, movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    Player* const pPlayerMover = pMover->ToPlayer();

    // Check if position and movement flags are fine before speed update.
    bool canRelocate = recvData.GetPacketTime() > m_moveRejectTime && !pMover->HasPendingSplineDone() && VerifyMovementInfo(movementInfo);
    if (canRelocate && pPlayerMover)
    {
        if ((m_moveRejectTime = _player->GetCheatData()->HandleFlagTests(pPlayerMover, movementInfo, opcode)) ||
            (m_moveRejectTime = _player->GetCheatData()->HandlePositionTests(pPlayerMover, movementInfo, opcode)))
        {
            canRelocate = false;
        }
    }

    // the speed has to be applied before relocation
    // otherwise if the speed update was from an outdoors only aura
    // and after relocation we are now indoors, player will get
    // stuck with the faster speed from the aura after removal
    // because the speed never changed server side
    float const newSpeedRate = speedReceived / baseMoveSpeed[move_type];
    pMover->SetSpeedRateReal(move_type, newSpeedRate);

    if (canRelocate)
    {
        if ((pMover == _player->GetMover()) &&
            (!pPlayerMover || !pPlayerMover->IsBeingTeleported()))
        {
            if (pPlayerMover)
                pPlayerMover->UpdateFallInformationIfNeed(movementInfo, opcode);

            // Update position if it has changed.
            HandleMoverRelocation(pMover, movementInfo);
        }
        else
        {
            // Can only change flags and speed for not current active mover.
            pMover->m_movementInfo.moveFlags = movementInfo.moveFlags;
            pMover->m_movementInfo.CorrectData();
        }
    }

    // send the speed change to others (with updated position if all is fine)
    MovementPacketSender::SendSpeedChangeToObservers(pMover, move_type, speedReceived);
}

/*
handles those packets:
CMSG_MOVE_WATER_WALK_ACK
CMSG_MOVE_HOVER_ACK
CMSG_MOVE_FEATHER_FALL_ACK
*/
void WorldSession::HandleMovementFlagChangeToggleAck(WorldPacket& recvData)
{
    uint32 const opcode = recvData.GetOpcode();

    /* extract packet */
    ObjectGuid guid;
    recvData >> guid;
    uint32 movementCounter = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recvData >> movementCounter;
#endif
    MovementInfo movementInfo;
    recvData >> movementInfo;
    movementInfo.UpdateTime(recvData.GetPacketTime());
    uint32 applyInt;
    recvData >> applyInt;
    bool applyReceived = applyInt != 0u;
    /*----------------*/

    Unit* pMover = GetMoverFromGuid(guid);
    if (!pMover)
        return;

    // verify that indeed the client is replying with the changes that were send to him
    if (!pMover->HasPendingMovementChange())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMovementFlagChangeToggleAck: Player %s from account id %u sent opcode %u with counter %u, but no movement change ack was expected from this player (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), opcode, movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    MovementFlags mFlag = MOVEFLAG_NONE;
    MovementChangeType changeTypeReceived;

    switch (opcode)
    {
        case CMSG_MOVE_WATER_WALK_ACK:      changeTypeReceived = WATER_WALK; mFlag = MOVEFLAG_WATERWALKING; break;
        case CMSG_MOVE_HOVER_ACK:           changeTypeReceived = SET_HOVER; mFlag = MOVEFLAG_HOVER; break;
        case CMSG_MOVE_FEATHER_FALL_ACK:    changeTypeReceived = FEATHER_FALL; mFlag = MOVEFLAG_SAFE_FALL; break;
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMovementFlagChangeToggleAck: Unknown move type opcode: %u", opcode);
            return;
    }

    if (!pMover->FindPendingMovementFlagChange(movementCounter, applyReceived, changeTypeReceived))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMovementFlagChangeToggleAck: Player %s from account id %u sent opcode %u with counter %u, but received data does not match pending change (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), opcode, movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    if (opcode == CMSG_MOVE_FEATHER_FALL_ACK)
        pMover->SetJumpInitialSpeed(std::max(pMover->GetJumpInitialSpeed(), 7.0f));

    // Use fake loop here to handle movement position checks separately from change ACK.
    do
    {
        if (pMover->HasPendingSplineDone())
            break;

        // Do not accept packets sent before this time.
        if (recvData.GetPacketTime() <= m_moveRejectTime)
            break;

        if (!VerifyMovementInfo(movementInfo))
            break;

        Player* pPlayerMover = pMover->ToPlayer();

        if (pPlayerMover)
        {
            if ((m_moveRejectTime = _player->GetCheatData()->HandleFlagTests(pPlayerMover, movementInfo, opcode)) ||
                (m_moveRejectTime = _player->GetCheatData()->HandlePositionTests(pPlayerMover, movementInfo, opcode)))
            {
                break;
            }
        }

        if ((pMover == _player->GetMover()) &&
            (!pPlayerMover || !pPlayerMover->IsBeingTeleported()))
        {
            if (pPlayerMover)
                pPlayerMover->UpdateFallInformationIfNeed(movementInfo, opcode);

            // Update position if it has changed.
            HandleMoverRelocation(pMover, movementInfo);
        }
        else
        {
            // Can only change flags and speed for not current active mover.
            pMover->m_movementInfo.moveFlags = movementInfo.moveFlags;
            pMover->m_movementInfo.CorrectData();
        }
    } while (false);

    switch (changeTypeReceived)
    {
        case WATER_WALK:            pMover->SetWaterWalkingReal(applyReceived); break;
        case SET_HOVER:             pMover->SetHoverReal(applyReceived); break;
        case FEATHER_FALL:          pMover->SetFeatherFallReal(applyReceived); break;
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMovementFlagChangeToggleAck: Unknown move type opcode: %u", opcode);
            return;
    }

    if (mFlag != MOVEFLAG_NONE)
        MovementPacketSender::SendMovementFlagChangeToObservers(pMover, mFlag, applyReceived);
}

/*
handles those packets:
CMSG_FORCE_MOVE_ROOT_ACK
CMSG_FORCE_MOVE_UNROOT_ACK
*/
void WorldSession::HandleMoveRootAck(WorldPacket& recvData)
{
    uint32 const opcode = recvData.GetOpcode();

    /* extract packet */
    ObjectGuid guid;
    recvData >> guid;
    uint32 movementCounter = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recvData >> movementCounter;
#endif
    MovementInfo movementInfo;
    recvData >> movementInfo;
    movementInfo.UpdateTime(recvData.GetPacketTime());
    /*----------------*/

    Unit* pMover = GetMoverFromGuid(guid);
    if (!pMover)
        return;

    // verify that indeed the client is replying with the changes that were send to him
    if (!pMover->HasPendingMovementChange())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMoveRootAck: Player %s from account id %u sent opcode %u with counter %u, but no movement change ack was expected from this player (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), opcode, movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    bool applyReceived = (opcode == CMSG_FORCE_MOVE_ROOT_ACK);

    if (!pMover->FindPendingMovementRootChange(movementCounter, applyReceived))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMoveRootAck: Player %s from account id %u sent opcode %u with counter %u, but received data does not match pending change (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), opcode, movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    // Use fake loop here to handle movement position checks separately from change ACK.
    do
    {
        if (pMover->HasPendingSplineDone())
            break;

        // Do not accept packets sent before this time.
        if (recvData.GetPacketTime() <= m_moveRejectTime)
            break;

        if (!VerifyMovementInfo(movementInfo))
            break;

        Player* pPlayerMover = pMover->ToPlayer();

        if (pPlayerMover)
        {
            if ((m_moveRejectTime = _player->GetCheatData()->HandleFlagTests(pPlayerMover, movementInfo, opcode)) ||
                (m_moveRejectTime = _player->GetCheatData()->HandlePositionTests(pPlayerMover, movementInfo, opcode)))
            {
                break;
            }
        }

        if ((pMover == _player->GetMover()) &&
            (!pPlayerMover || !pPlayerMover->IsBeingTeleported()))
        {
            if (pPlayerMover)
                pPlayerMover->UpdateFallInformationIfNeed(movementInfo, opcode);

            // Update position if it has changed.
            HandleMoverRelocation(pMover, movementInfo);
        }
        else
        {
            // Can only change flags and speed for not current active mover.
            pMover->m_movementInfo.moveFlags = movementInfo.moveFlags;
            pMover->m_movementInfo.CorrectData();
        }
    } while (false);

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    if (applyReceived && !movementInfo.HasMovementFlag(MOVEFLAG_ROOT))
    {
        // workaround to fix anticheat false positives when using 1.14 client
        // modern client finishes falling to ground before applying the root
        if (!movementInfo.HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMoveRootAck: Player %s from account id %u sent root apply ack, but movement info does not have rooted movement flag!",
                _player->GetName(), _player->GetSession()->GetAccountId());
            KickPlayer();
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMoveRootAck: Player %s from account id %u sent root apply ack, but continues falling. Using 1.14 client?",
                _player->GetName(), _player->GetSession()->GetAccountId());
            pMover->AddUnitState(UNIT_STAT_ROOT_ON_LANDING);
            return;
        }
    }


    // we need to always clear this on root packet for 1.14
    pMover->ClearUnitState(UNIT_STAT_ROOT_ON_LANDING);
#endif

    pMover->SetRootedReal(applyReceived);
    MovementPacketSender::SendMovementFlagChangeToObservers(pMover, MOVEFLAG_ROOT, applyReceived);
}

void WorldSession::HandleMoveKnockBackAck(WorldPacket& recvData)
{
    /* extract packet */
    ObjectGuid guid;
    recvData >> guid;
    uint32 movementCounter = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recvData >> movementCounter;
#endif
    MovementInfo movementInfo;
    recvData >> movementInfo;
    movementInfo.UpdateTime(recvData.GetPacketTime());
    /*----------------*/

    Unit* pMover = GetMoverFromGuid(guid);
    if (!pMover)
        return;

    // verify that indeed the client is replying with the changes that were send to him
    if (!pMover->HasPendingMovementChange())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMoveKnockBackAck: Player %s from account id %u sent opcode %u with counter %u, but no movement change ack was expected from this player (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), recvData.GetOpcode(), movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    if (!pMover->FindPendingMovementKnockbackChange(movementInfo, movementCounter))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WorldSession::HandleMoveKnockBackAck: Player %s from account id %u sent opcode %u with counter %u, but received data does not match pending change (current counter is %u)",
            _player->GetName(), _player->GetSession()->GetAccountId(), recvData.GetOpcode(), movementCounter, pMover->GetMovementCounter());
        if (movementCounter == 0 || movementCounter > pMover->GetMovementCounter())
            _player->GetCheatData()->OnWrongAckData();
        return;
    }

    if (pMover->HasPendingSplineDone())
        return;

    if (!VerifyMovementInfo(movementInfo))
        return;

    // ignore, waiting processing in WorldSession::HandleMoveWorldportAckOpcode and WorldSession::HandleMoveTeleportAck
    if (pMover->IsPlayer() && static_cast<Player*>(pMover)->IsBeingTeleported())
        return;

    if (Player* pPlayerMover = pMover->ToPlayer())
    {
        if ((m_moveRejectTime = _player->GetCheatData()->HandleFlagTests(pPlayerMover, movementInfo, recvData.GetOpcode())) ||
            (m_moveRejectTime = _player->GetCheatData()->HandlePositionTests(pPlayerMover, movementInfo, recvData.GetOpcode())))
        {
            return;
        }

        pPlayerMover->SetFallInformation(0);
    }

    HandleMoverRelocation(pMover, movementInfo);

    MovementPacketSender::SendKnockBackToObservers(pMover, movementInfo.jump.cosAngle, movementInfo.jump.sinAngle, movementInfo.jump.xyspeed, movementInfo.jump.zspeed);
}

void WorldSession::HandleMoveSplineDoneOpcode(WorldPacket& recvData)
{
    MovementInfo movementInfo;
    uint32 splineId;

    recvData >> movementInfo;
    movementInfo.UpdateTime(recvData.GetPacketTime());

    recvData >> splineId;
    recvData >> Unused<float>();

    if (!VerifyMovementInfo(movementInfo))
        return;

    Unit* pMover = _player->GetMover();

    if (pMover->GetObjectGuid() != m_clientMoverGuid)
        return;

    if (pMover->movespline->GetId() != splineId)
        return;

    // must be after checking this is the newest spline id
    if (pMover->HasPendingSplineDone())
        pMover->SetSplineDonePending(false);
    else
        return;

    if (Player* pPlayerMover = pMover->ToPlayer())
    {
        // ignore, waiting processing in WorldSession::HandleMoveWorldportAckOpcode and WorldSession::HandleMoveTeleportAck
        if (pPlayerMover->IsBeingTeleported())
            return;

        // no need to reject future packets in this case
        if (!_player->GetCheatData()->HandleSplineDone(pPlayerMover, movementInfo, splineId))
            return;

        if (m_moveRejectTime = _player->GetCheatData()->HandleFlagTests(pPlayerMover, movementInfo, CMSG_MOVE_SPLINE_DONE))
            return;
    }

    HandleMoverRelocation(pMover, movementInfo);

    WorldPacket data(movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING) ? MSG_MOVE_HEARTBEAT : MSG_MOVE_STOP, recvData.size());

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << m_clientMoverGuid.WriteAsPacked();
#else
    data << m_clientMoverGuid.GetRawValue();
#endif
    movementInfo.Write(data);

    pMover->SendMovementMessageToSet(std::move(data), true, _player);
}

void WorldSession::HandleSetActiveMoverOpcode(WorldPacket& recvData)
{
    ObjectGuid guid;
    recvData >> guid;

    if (!guid.IsEmpty())
    {
        Unit* pMover = _player->GetMover();
        if (pMover->GetObjectGuid() != guid)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandleSetActiveMoverOpcode: incorrect mover guid: mover is %s and should be %s",
                pMover->GetGuidStr().c_str(), guid.GetString().c_str());
            m_clientMoverGuid = pMover->GetObjectGuid();
            return;
        }

        if (pMover->IsCreature())
        {
            if (pMover->IsRooted())
                MovementPacketSender::AddMovementFlagChangeToController(pMover, MOVEFLAG_ROOT, true);

            // Older clients do not send spline done opcode for splines that started before they took control.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
            pMover->SetSplineDonePending(false);
#endif
        }

        // mover swap after Eyes of the Beast, PetAI::UpdateAI handle the pet's return
        // Check if we actually have a pet before looking up
        if (_player->GetPetGuid() && _player->GetPetGuid() == m_clientMoverGuid)
        {
            if (Pet* pet = _player->GetPet())
            {
                pet->ClearUnitState(UNIT_STAT_POSSESSED);
                pet->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_POSSESSED);
                // out of range pet dismissed
                if (!pet->IsWithinDistInMap(_player, pet->GetMap()->GetGridActivationDistance()))
                    _player->RemovePet(PET_SAVE_REAGENTS);
            }
        }
    }

    m_clientMoverGuid = guid;
}

void WorldSession::HandleMoveNotActiveMoverOpcode(WorldPacket& recvData)
{
    ObjectGuid oldMoverGuid;
    MovementInfo movementInfo;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recvData >> oldMoverGuid;
    recvData >> movementInfo;
    m_clientMoverGuid = ObjectGuid();

    // Client sent not active mover, but maybe the mover is actually set?
    if (_player->GetObjectGuid() != oldMoverGuid &&
        _player->GetMover()->GetObjectGuid() == oldMoverGuid)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "HandleMoveNotActiveMover: incorrect mover guid: mover is %s and should be %s instead of %s",
                       _player->GetMover()->GetGuidStr().c_str(),
                       _player->GetGuidStr().c_str(),
                       oldMoverGuid.GetString().c_str());
        recvData.rpos(recvData.wpos());                   // prevent warnings spam
        return;
    }
#else
    recvData >> movementInfo;
    oldMoverGuid = m_clientMoverGuid;
    m_clientMoverGuid = ObjectGuid();
#endif

    // Do not accept packets sent before this time.
    if (recvData.GetPacketTime() <= m_moveRejectTime)
        return;

    if (!VerifyMovementInfo(movementInfo))
        return;

    Unit* pMover = _player->GetMap()->GetUnit(oldMoverGuid);

    if (!pMover)
        return;

    if (pMover->HasPendingSplineDone())
        return;

    if (!pMover->movespline->Finalized())
        return;

    Player* pPlayerMover = pMover->ToPlayer();

    // ignore, waiting processing in WorldSession::HandleMoveWorldportAckOpcode and WorldSession::HandleMoveTeleportAck
    if (pPlayerMover && pPlayerMover->IsBeingTeleported())
        return;
    
    if (pPlayerMover)
    {
        if ((m_moveRejectTime = _player->GetCheatData()->HandleFlagTests(pPlayerMover, movementInfo, recvData.GetOpcode())) ||
            (m_moveRejectTime = _player->GetCheatData()->HandlePositionTests(pPlayerMover, movementInfo, recvData.GetOpcode())))
        {
            return;
        }
    }

    HandleMoverRelocation(pMover, movementInfo);

    WorldPacket data(movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING) ? MSG_MOVE_HEARTBEAT : MSG_MOVE_STOP, recvData.size());

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << oldMoverGuid.WriteAsPacked();
#else
    data << oldMoverGuid.GetRawValue();
#endif
    movementInfo.Write(data);

    pMover->SendMovementMessageToSet(std::move(data), true, _player);
}

void WorldSession::HandleMountSpecialAnimOpcode(WorldPacket& /*recvdata*/)
{
    WorldPacket data(SMSG_MOUNTSPECIAL_ANIM, 8);
    data << GetPlayer()->GetObjectGuid();

    GetPlayer()->SendMovementMessageToSet(std::move(data), false);
}

void WorldSession::HandleSummonResponseOpcode(WorldPacket& recvData)
{
    if (!_player->IsAlive() || _player->IsInCombat())
        return;

    ObjectGuid summonerGuid;
    recvData >> summonerGuid;

    _player->SummonIfPossible(true);
}

void WorldSession::HandleMoveTimeSkippedOpcode(WorldPacket& recvData)
{
    ObjectGuid guid;
    recvData >> guid;
    uint32 lag;
    recvData >> lag;

    Unit* pMover = GetMoverFromGuid(guid);
    if (!pMover)
        return;

    if (pMover->m_movementInfo.ctime)
    {
        pMover->m_movementInfo.stime += lag;
        pMover->m_movementInfo.ctime += lag;
    }

    // fix an 1.12 client problem with transports
    if (_player->HasJustBoarded())
    {
        _player->SetJustBoarded(false);
        if (GenericTransport* pTransport = pMover->GetTransport())
        {
            pTransport->SendOutOfRangeUpdateToPlayer(_player);
            pTransport->SendCreateUpdateToPlayer(_player);
        }
    }
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    else
    {
        WorldPacket data(MSG_MOVE_TIME_SKIPPED, 12);
        data << pMover->GetPackGUID();
        data << lag;
        pMover->SendMovementMessageToSet(std::move(data), true, _player);
    }
#endif
}

// make sure this client is allowed to control the unit which guid is provided
Unit* WorldSession::GetMoverFromGuid(ObjectGuid const& guid) const
{
    if (guid == _player->GetMover()->GetObjectGuid())
        return _player->GetMover();
    if (guid == _player->GetObjectGuid())
        return _player;
    if (guid == m_clientMoverGuid)
        return _player->GetMap()->GetUnit(guid);

    return nullptr;
}

void WorldSession::RejectMovementPacketsFor(uint32 ms)
{
    uint32 timeout = WorldTimer::getMSTime() + ms;
    if (m_moveRejectTime < timeout)
        m_moveRejectTime = timeout;
}

bool WorldSession::VerifyMovementInfo(MovementInfo const& movementInfo) const
{
    if (!MaNGOS::IsValidMapCoord(movementInfo.GetPos().x, movementInfo.GetPos().y, movementInfo.GetPos().z, movementInfo.GetPos().o))
        return false;

    if (movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        // transports size limited
        // (also received at zeppelin/lift leave by some reason with t_* as absolute in continent coordinates, can be safely skipped)
        if (std::fabs(movementInfo.GetTransportPos().x) > 250 || std::fabs(movementInfo.GetTransportPos().y) > 250 || std::fabs(movementInfo.GetTransportPos().z) > 100)
            return false;

        if (!MaNGOS::IsValidMapCoord(movementInfo.GetPos().x + movementInfo.GetTransportPos().x, movementInfo.GetPos().y + movementInfo.GetTransportPos().y,
                                     movementInfo.GetPos().z + movementInfo.GetTransportPos().z, movementInfo.GetPos().o + movementInfo.GetTransportPos().o))
            return false;
    }

    return true;
}

void WorldSession::HandleMoverRelocation(Unit* pMover, MovementInfo& movementInfo)
{
    Player* const pPlayerMover = pMover->ToPlayer();

    movementInfo.sourceSessionGuid = GetGUID();
    movementInfo.CorrectData();

    // Prevent client from removing root flag.
    if (pMover->HasUnitMovementFlag(MOVEFLAG_ROOT) && !movementInfo.HasMovementFlag(MOVEFLAG_ROOT))
        movementInfo.AddMovementFlag(MOVEFLAG_ROOT);

    pMover->m_movementInfo = movementInfo;

    if (pMover->m_movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        if (!pMover->GetTransport())
        {
            if (GenericTransport* transport = pMover->GetMap()->GetTransport(pMover->m_movementInfo.GetTransportGuid()))
            {
                transport->AddPassenger(pMover);
                if (pPlayerMover)
                    pPlayerMover->SetJustBoarded(true); // fix a 1.12 client problem with transports
            }
        }
        else
        {
            if (pPlayerMover)
                pPlayerMover->SetJustBoarded(false);
            pMover->m_movementInfo.pos.x = pMover->m_movementInfo.GetTransportPos().x;
            pMover->m_movementInfo.pos.y = pMover->m_movementInfo.GetTransportPos().y;
            pMover->m_movementInfo.pos.z = pMover->m_movementInfo.GetTransportPos().z;
            pMover->m_movementInfo.pos.o = pMover->m_movementInfo.GetTransportPos().o;
            pMover->GetTransport()->CalculatePassengerPosition(pMover->m_movementInfo.pos.x, pMover->m_movementInfo.pos.y, pMover->m_movementInfo.pos.z, &pMover->m_movementInfo.pos.o);
        }
    }
    else if (pMover->GetTransport()) // if we were on a transport, leave
    {
        pMover->m_transport->RemovePassenger(pMover);
        pMover->m_transport = nullptr;
        pMover->m_movementInfo.ClearTransportData();
    }

    if (pPlayerMover)
    {
        if (pMover->m_movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING))
        {
            if (ObjectGuid const& lootGuid = pPlayerMover->GetLootGuid())
                if (!lootGuid.IsItem())
                    pPlayerMover->GetSession()->DoLootRelease(lootGuid);
        }

        pPlayerMover->SetPosition(pMover->m_movementInfo.GetPos().x, pMover->m_movementInfo.GetPos().y, pMover->m_movementInfo.GetPos().z, pMover->m_movementInfo.GetPos().o);

        // Nostalrius - antiundermap1
        if (pMover->m_movementInfo.HasMovementFlag(MOVEFLAG_FALLINGFAR))
        {
            float hauteur = pPlayerMover->GetMap()->GetHeight(pPlayerMover->GetPositionX(), pPlayerMover->GetPositionY(), pPlayerMover->GetPositionZ(), true);
            bool undermap = false;
            // Undermap
            if ((pPlayerMover->GetPositionZ() + 100.0f) < hauteur)
                undermap = true;
            if (pPlayerMover->GetPositionZ() < 250.0f && pPlayerMover->GetMapId() == 489)
                undermap = true;

            if (undermap)
                if (pPlayerMover->UndermapRecall())
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[UNDERMAP] %s [GUID %u]. MapId:%u %f %f %f", pPlayerMover->GetName(), pPlayerMover->GetGUIDLow(), pPlayerMover->GetMapId(), pPlayerMover->GetPositionX(), pPlayerMover->GetPositionY(), pPlayerMover->GetPositionZ());
        }
        else if (pPlayerMover->CanFreeMove())
            pPlayerMover->SaveNoUndermapPosition(pMover->m_movementInfo.GetPos().x, pMover->m_movementInfo.GetPos().y, pMover->m_movementInfo.GetPos().z + 3.0f, pMover->m_movementInfo.GetPos().o);
        
        // Antiundermap2: teleport to graveyard
        if (pMover->m_movementInfo.GetPos().z < -500.0f)
        {
            // NOTE: this is actually called many times while falling
            // even after the player has been teleported away
            // TODO: discard movement packets after the player is rooted
            if (pPlayerMover->IsAlive())
            {
                if (pPlayerMover->InBattleGround())
                    pPlayerMover->EnvironmentalDamage(DAMAGE_FALL_TO_VOID, pPlayerMover->GetHealth());
                else
                    pPlayerMover->EnvironmentalDamage(DAMAGE_FALL_TO_VOID, pPlayerMover->GetHealth() / 2);

                // player can be alive if GM and God
                if (!pPlayerMover->IsAlive())
                {
                    // change the death state to CORPSE to prevent the death timer from
                    // starting in the next player update
                    pPlayerMover->KillPlayer();
                    pPlayerMover->BuildPlayerRepop();
                }
            }

            // cancel the death timer here if started
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[UNDERMAP/Teleport] Player %s teleported.", pPlayerMover->GetName(), pPlayerMover->GetGUIDLow(), pPlayerMover->GetMapId(), pPlayerMover->GetPositionX(), pPlayerMover->GetPositionY(), pPlayerMover->GetPositionZ());
            pPlayerMover->RepopAtGraveyard();
        }
    }
    else
    {
        pMover->HandleInterruptsOnMovement(pMover->m_movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING)); // called inside SetPosition for players
        pMover->GetMap()->CreatureRelocation((Creature*)pMover, pMover->m_movementInfo.GetPos().x, pMover->m_movementInfo.GetPos().y, pMover->m_movementInfo.GetPos().z, pMover->m_movementInfo.GetPos().o);
    }
}

