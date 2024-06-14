#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Config/Config.h"
#include "Opcodes.h"
#include "MovementAnticheat.h"
#include "Chat.h"
#include "Player.h"
#include "GameObject.h"
#include "WorldSession.h"
#include "MoveSpline.h"
#include "World.h"
#include "MovementPacketSender.h"
#include "Geometry.h"
#include "AccountMgr.h"
#include "BattleGround.h"

using namespace Geometry;

const char* GetMovementCheatName(CheatType flagId)
{
    switch (flagId)
    {
        case CHEAT_TYPE_TIME_BACK:
            return "ReverseTime";
        case CHEAT_TYPE_NULL_CLIENT_TIME:
            return "NullClientTime";
        case CHEAT_TYPE_SKIPPED_HEARTBEATS:
            return "SkippedHeartbeats";
        case CHEAT_TYPE_TIME_DESYNC:
            return "TimeDesync";
        case CHEAT_TYPE_NUM_DESYNC:
            return "NumDesyncs";
        case CHEAT_TYPE_OVERSPEED_DIST:
            return "OverspeedDist";
        case CHEAT_TYPE_OVERSPEED_JUMP:
            return "OverspeedJump";
        case CHEAT_TYPE_JUMP_SPEED_CHANGE:
            return "JumpSpeedChange";
        case CHEAT_TYPE_MULTI_JUMP:
            return "MultiJump";
        case CHEAT_TYPE_WALL_CLIMB:
            return "WallClimb";
        case CHEAT_TYPE_PVE_FLYHACK:
            return "PvEUnreachable";
        case CHEAT_TYPE_FLY_HACK_SWIM:
            return "FlyHackSwim";
        case CHEAT_TYPE_NO_FALL_TIME:
            return "NoFallTime";
        case CHEAT_TYPE_BAD_FALL_RESET:
            return "BadFallReset";
        case CHEAT_TYPE_BAD_FALL_STOP:
            return "BadFallStop";
        case CHEAT_TYPE_BAD_MOVE_START:
            return "BadMoveStart";
        case CHEAT_TYPE_TELEPORT:
            return "TeleportHack";
        case CHEAT_TYPE_TELEPORT_TRANSPORT:
            return "TeleToTransport";
        case CHEAT_TYPE_FAKE_TRANSPORT:
            return "FakeTransport";
        case CHEAT_TYPE_WATER_WALK:
            return "WaterWalk";
        case CHEAT_TYPE_SLOW_FALL:
            return "SlowFall";
        case CHEAT_TYPE_HOVER:
            return "Hover";
        case CHEAT_TYPE_FIXED_Z:
            return "FixedZ";
        case CHEAT_TYPE_ROOT_MOVE:
            return "MovementRooted";
        case CHEAT_TYPE_SELF_ROOT:
            return "SelfRoot";
        case CHEAT_TYPE_WRONG_ACK_DATA:
            return "WrongAckData";
        case CHEAT_TYPE_PENDING_ACK_DELAY:
            return "PendingAckDelay";
        case CHEAT_TYPE_EXPLORE:
            return "Exploration";
        case CHEAT_TYPE_EXPLORE_HIGH_LEVEL:
            return "ExploreHighLevelArea";
        case CHEAT_TYPE_FORBIDDEN_AREA:
            return "ForbiddenArea";
        case CHEAT_TYPE_BOTTING:
            return "Botting";
    }

    return "UnknownCheat";
}

MovementAnticheat::MovementAnticheat(Player* _me) : me(_me), m_session(_me->GetSession())
{
}

MovementInfo& MovementAnticheat::GetLastMovementInfo()
{
    return me->m_movementInfo;
}

MovementInfo const& MovementAnticheat::GetLastMovementInfo() const
{
    return me->m_movementInfo;
}

uint32 MovementAnticheat::Update(Player* pPlayer, uint32 diff, std::stringstream& reason)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED))
        return CHEAT_ACTION_NONE;

    // Every X seconds, combine detected cheats
    if (m_updateCheckTimer >= diff)
    {
        m_updateCheckTimer -= diff;
        return CHEAT_ACTION_NONE;
    }

    return Finalize(pPlayer, reason);
}

uint32 MovementAnticheat::Finalize(Player* pPlayer, std::stringstream& reason)
{
    if (m_overspeedDistance > 0)
    {
        if (m_maxOverspeedDistance < m_overspeedDistance)
            m_maxOverspeedDistance = m_overspeedDistance;

        m_cheatOccuranceTick[CHEAT_TYPE_OVERSPEED_DIST] = uint32(m_overspeedDistance);
    }
    if (m_clientDesync > 0)
    {
        if (m_maxClientDesync < static_cast<uint32>(m_clientDesync))
            m_maxClientDesync = m_clientDesync;

        m_cheatOccuranceTick[CHEAT_TYPE_TIME_DESYNC] = m_clientDesync;
    }

    m_updateCheckTimer = CHEATS_UPDATE_INTERVAL;

    // Add up penalties for all cheats detected
    uint32 result = ComputeCheatAction(reason);

    // Log data
    if (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_LOG_DATA) && pPlayer && pPlayer->IsInWorld())
    {
        sLog.Player(m_session, LOG_ANTICHEAT, "Movement", LOG_LVL_BASIC, "DesyncMs %d DesyncDist %f Cheats %s",
            m_clientDesync, m_overspeedDistance, reason.rdbuf()->in_avail() ? reason.str().c_str() : "");
    }

    if ((result & (CHEAT_ACTION_KICK | CHEAT_ACTION_BAN_ACCOUNT | CHEAT_ACTION_BAN_IP_ACCOUNT)) && !m_packetLog.empty())
    {
        AddMessageToPacketLog("End of packet log. Penalty: " + std::to_string(result) + ", Detected cheats: " + reason.str());
        std::string fileName = "movement_log_" +  m_session->GetUsername() + "_" + std::to_string(time(nullptr)) + ".pkt";
        SniffFile packetDump(fileName.c_str());
        std::lock_guard<std::mutex> guard(m_packetLogMutex);
        packetDump.WriteToFile(m_packetLog);
    }

    // Reset to zero tick counts
    m_cheatOccuranceTick.fill(0);

    m_clientDesync = 0;
    m_overspeedDistance = 0.0f;
    return result;
}

void MovementAnticheat::AddCheats(uint32 cheats, uint32 count)
{
    if (!cheats)
        return;

    if (sWorld.getConfig(CONFIG_UINT32_AC_MOVEMENT_PACKET_LOG_SIZE) ||
       (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_NOTIFY_CHEATERS) && m_session->GetPlayer()))
    {
        std::string cheatNames;
        for (uint32 i = 0; i < CHEATS_COUNT; ++i)
        {
            if (cheats & (1 << i))
            {
                if (!cheatNames.empty())
                    cheatNames += ", ";
                cheatNames += GetMovementCheatName(CheatType(i));
            }
        }

        if (!cheatNames.empty())
        {
            if (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_NOTIFY_CHEATERS))
                ChatHandler(m_session->GetPlayer()).PSendSysMessage("[AntiCheat] Detected cheats: %s", cheatNames.c_str());

            // Print detected cheats in place inside packet log.
            if (sWorld.getConfig(CONFIG_UINT32_AC_MOVEMENT_PACKET_LOG_SIZE))
                AddMessageToPacketLog("Detected cheats: " + cheatNames);
        }
    }

    for (uint32 i = 0; i < CHEATS_COUNT; ++i)
        if (cheats & (1 << i))
            StoreCheat(i, count);
}

void MovementAnticheat::StoreCheat(uint32 type, uint32 count)
{
    m_cheatOccuranceTotal[type] += count;
    m_cheatOccuranceTick[type] += count;
}

uint32 MovementAnticheat::ComputeCheatAction(std::stringstream& reason)
{
    uint32 action = CHEAT_ACTION_NONE;

    auto AddPenaltyForCheat = [&action, &reason, this](bool total, CheatType cheatType, eConfigBoolValues enabledConfig, eConfigUInt32Values thresholdConfig, eConfigUInt32Values penaltyConfig)
    { 
        if (sWorld.getConfig(enabledConfig))
        {
            ASSERT(cheatType < CHEATS_COUNT);
            uint32 count = total ? m_cheatOccuranceTotal[cheatType] : m_cheatOccuranceTick[cheatType];
            uint32 threshold = sWorld.getConfig(thresholdConfig);
            uint32 penalty = sWorld.getConfig(penaltyConfig);

            if (threshold && count >= threshold)
            {
                if (!reason.str().empty())
                    reason << "/";
                reason << GetMovementCheatName(cheatType) << (total ? "(Total:" : "(Tick:") << count << ")";
                action |= penalty;

                if (total)
                    m_cheatOccuranceTotal[cheatType] = 0;
            }
        }
    };

    AddPenaltyForCheat(false, CHEAT_TYPE_TIME_BACK, CONFIG_BOOL_AC_MOVEMENT_CHEAT_REVERSE_TIME_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_REVERSE_TIME_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_REVERSE_TIME_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_NULL_CLIENT_TIME, CONFIG_BOOL_AC_MOVEMENT_CHEAT_NULL_TIME_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_NULL_TIME_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_NULL_TIME_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_SKIPPED_HEARTBEATS, CONFIG_BOOL_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_THRESHOLD_TICK, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_SKIPPED_HEARTBEATS, CONFIG_BOOL_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_THRESHOLD_TOTAL, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_TIME_DESYNC, CONFIG_BOOL_AC_MOVEMENT_CHEAT_TIME_DESYNC_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_TIME_DESYNC_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_TIME_DESYNC_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_NUM_DESYNC, CONFIG_BOOL_AC_MOVEMENT_CHEAT_NUM_DESYNCS_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_NUM_DESYNCS_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_NUM_DESYNCS_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_OVERSPEED_DIST, CONFIG_BOOL_AC_MOVEMENT_CHEAT_OVERSPEED_DISTANCE_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_DISTANCE_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_DISTANCE_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_OVERSPEED_JUMP, CONFIG_BOOL_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_JUMP_SPEED_CHANGE, CONFIG_BOOL_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_MULTI_JUMP, CONFIG_BOOL_AC_MOVEMENT_CHEAT_MULTI_JUMP_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_MULTI_JUMP_THRESHOLD_TICK, CONFIG_UINT32_AC_MOVEMENT_CHEAT_MULTI_JUMP_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_MULTI_JUMP, CONFIG_BOOL_AC_MOVEMENT_CHEAT_MULTI_JUMP_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_MULTI_JUMP_THRESHOLD_TOTAL, CONFIG_UINT32_AC_MOVEMENT_CHEAT_MULTI_JUMP_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_WALL_CLIMB, CONFIG_BOOL_AC_MOVEMENT_CHEAT_WALL_CLIMB_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WALL_CLIMB_THRESHOLD_TICK, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WALL_CLIMB_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_WALL_CLIMB, CONFIG_BOOL_AC_MOVEMENT_CHEAT_WALL_CLIMB_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WALL_CLIMB_THRESHOLD_TOTAL, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WALL_CLIMB_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_PVE_FLYHACK, CONFIG_BOOL_AC_MOVEMENT_CHEAT_UNREACHABLE_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_UNREACHABLE_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_UNREACHABLE_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_FLY_HACK_SWIM, CONFIG_BOOL_AC_MOVEMENT_CHEAT_FLY_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FLY_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FLY_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_NO_FALL_TIME, CONFIG_BOOL_AC_MOVEMENT_CHEAT_NO_FALL_TIME_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_NO_FALL_TIME_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_NO_FALL_TIME_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_BAD_FALL_RESET, CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_FALL_RESET_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_RESET_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_RESET_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_BAD_FALL_STOP, CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_FALL_STOP_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_STOP_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_STOP_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_BAD_MOVE_START, CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_MOVE_START_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_MOVE_START_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_MOVE_START_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_TELEPORT, CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELEPORT_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELEPORT_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELEPORT_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_TELEPORT_TRANSPORT, CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_FAKE_TRANSPORT, CONFIG_BOOL_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_WATER_WALK, CONFIG_BOOL_AC_MOVEMENT_CHEAT_WATER_WALK_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WATER_WALK_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WATER_WALK_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_SLOW_FALL, CONFIG_BOOL_AC_MOVEMENT_CHEAT_SLOW_FALL_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SLOW_FALL_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SLOW_FALL_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_HOVER, CONFIG_BOOL_AC_MOVEMENT_CHEAT_HOVER_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_HOVER_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_HOVER_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_FIXED_Z, CONFIG_BOOL_AC_MOVEMENT_CHEAT_FIXED_Z_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FIXED_Z_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FIXED_Z_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_ROOT_MOVE, CONFIG_BOOL_AC_MOVEMENT_CHEAT_ROOT_MOVE_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_ROOT_MOVE_THRESHOLD_TICK, CONFIG_UINT32_AC_MOVEMENT_CHEAT_ROOT_MOVE_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_ROOT_MOVE, CONFIG_BOOL_AC_MOVEMENT_CHEAT_ROOT_MOVE_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_ROOT_MOVE_THRESHOLD_TOTAL, CONFIG_UINT32_AC_MOVEMENT_CHEAT_ROOT_MOVE_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_SELF_ROOT, CONFIG_BOOL_AC_MOVEMENT_CHEAT_SELF_ROOT_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SELF_ROOT_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_SELF_ROOT_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_WRONG_ACK_DATA, CONFIG_BOOL_AC_MOVEMENT_CHEAT_WRONG_ACK_DATA_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WRONG_ACK_DATA_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_WRONG_ACK_DATA_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_PENDING_ACK_DELAY, CONFIG_BOOL_AC_MOVEMENT_CHEAT_PENDING_ACK_DELAY_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_PENDING_ACK_DELAY_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_PENDING_ACK_DELAY_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_EXPLORE, CONFIG_BOOL_AC_MOVEMENT_CHEAT_EXPLORE_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_PENALTY);
    AddPenaltyForCheat(true, CHEAT_TYPE_EXPLORE_HIGH_LEVEL, CONFIG_BOOL_AC_MOVEMENT_CHEAT_EXPLORE_HIGH_LEVEL_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_HIGH_LEVEL_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_HIGH_LEVEL_PENALTY);
    AddPenaltyForCheat(false, CHEAT_TYPE_FORBIDDEN_AREA, CONFIG_BOOL_AC_MOVEMENT_CHEAT_FORBIDDEN_AREA_ENABLED, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FORBIDDEN_AREA_THRESHOLD, CONFIG_UINT32_AC_MOVEMENT_CHEAT_FORBIDDEN_AREA_PENALTY);

    if (m_bottingCheckStartTime && WorldTimer::getMSTimeDiffToNow(m_bottingCheckStartTime) > sWorld.getConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_PERIOD))
    {
        if (HasEnoughBottingData())
        {
            eConfigUInt32Values minTurnsConfig;
            switch (m_turnType)
            {
                case TURN_MOUSE:
                    minTurnsConfig = CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_TURNS_MOUSE;
                    break;
                case TURN_KEYBOARD:
                    minTurnsConfig = CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_TURNS_KEYBOARD;
                    break;
                case TURN_ABNORMAL:
                    minTurnsConfig = CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_TURNS_ABNORMAL;
                    break;
                default:
                    minTurnsConfig = CONFIG_UINT32_VALUE_COUNT;
                    break;
            }
            if (minTurnsConfig != CONFIG_UINT32_VALUE_COUNT)
                AddPenaltyForCheat(true, CHEAT_TYPE_BOTTING, CONFIG_BOOL_AC_MOVEMENT_CHEAT_BOTTING_ENABLED, minTurnsConfig, CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_PENALTY);
        }
        ResetBottingStats();
    }

    return action;
}

void MovementAnticheat::AddMessageToPacketLog(std::string message)
{
    WorldPacket data(SMSG_NOTIFICATION, message.size() + 1);
    data << message;
    LogMovementPacket(false, data);
}

bool MovementAnticheat::IsLoggedOpcode(uint16 opcode)
{
    switch (opcode)
    {
        case CMSG_WORLD_TELEPORT:
        case CMSG_TELEPORT_TO_UNIT:
        case CMSG_REPOP_REQUEST:
        case CMSG_RESURRECT_RESPONSE:
        case CMSG_RECLAIM_CORPSE:
        case MSG_MOVE_START_FORWARD:
        case MSG_MOVE_START_BACKWARD:
        case MSG_MOVE_STOP:
        case MSG_MOVE_START_STRAFE_LEFT:
        case MSG_MOVE_START_STRAFE_RIGHT:
        case MSG_MOVE_STOP_STRAFE:
        case MSG_MOVE_JUMP:
        case MSG_MOVE_START_TURN_LEFT:
        case MSG_MOVE_START_TURN_RIGHT:
        case MSG_MOVE_STOP_TURN:
        case MSG_MOVE_START_PITCH_UP:
        case MSG_MOVE_START_PITCH_DOWN:
        case MSG_MOVE_STOP_PITCH:
        case MSG_MOVE_SET_RUN_MODE:
        case MSG_MOVE_SET_WALK_MODE:
        case MSG_MOVE_TOGGLE_LOGGING:
        case MSG_MOVE_TELEPORT:
        case MSG_MOVE_TELEPORT_CHEAT:
        case MSG_MOVE_TELEPORT_ACK:
        case MSG_MOVE_TOGGLE_FALL_LOGGING:
        case MSG_MOVE_FALL_LAND:
        case MSG_MOVE_START_SWIM:
        case MSG_MOVE_STOP_SWIM:
        case MSG_MOVE_SET_RUN_SPEED_CHEAT:
        case MSG_MOVE_SET_RUN_SPEED:
        case MSG_MOVE_SET_RUN_BACK_SPEED_CHEAT:
        case MSG_MOVE_SET_RUN_BACK_SPEED:
        case MSG_MOVE_SET_WALK_SPEED_CHEAT:
        case MSG_MOVE_SET_WALK_SPEED:
        case MSG_MOVE_SET_SWIM_SPEED_CHEAT:
        case MSG_MOVE_SET_SWIM_SPEED:
        case MSG_MOVE_SET_SWIM_BACK_SPEED_CHEAT:
        case MSG_MOVE_SET_SWIM_BACK_SPEED:
        case MSG_MOVE_SET_ALL_SPEED_CHEAT:
        case MSG_MOVE_SET_TURN_RATE_CHEAT:
        case MSG_MOVE_SET_TURN_RATE:
        case MSG_MOVE_TOGGLE_COLLISION_CHEAT:
        case MSG_MOVE_SET_FACING:
        case MSG_MOVE_SET_PITCH:
        case MSG_MOVE_WORLDPORT_ACK:
        case SMSG_MOVE_WATER_WALK:
        case SMSG_MOVE_LAND_WALK:
        case MSG_MOVE_SET_RAW_POSITION_ACK:
        case CMSG_MOVE_SET_RAW_POSITION:
        case CMSG_FORCE_RUN_SPEED_CHANGE_ACK:
        case CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_SWIM_SPEED_CHANGE_ACK:
        case CMSG_FORCE_MOVE_ROOT_ACK:
        case CMSG_FORCE_MOVE_UNROOT_ACK:
        case MSG_MOVE_ROOT:
        case MSG_MOVE_UNROOT:
        case MSG_MOVE_HEARTBEAT:
        case SMSG_MOVE_KNOCK_BACK:
        case CMSG_MOVE_KNOCK_BACK_ACK:
        case MSG_MOVE_KNOCK_BACK:
        case SMSG_MOVE_FEATHER_FALL:
        case SMSG_MOVE_NORMAL_FALL:
        case SMSG_MOVE_SET_HOVER:
        case SMSG_MOVE_UNSET_HOVER:
        case CMSG_MOVE_HOVER_ACK:
        case MSG_MOVE_HOVER:
        case MSG_MOVE_TOGGLE_GRAVITY_CHEAT:
        case MSG_MOVE_FEATHER_FALL:
        case MSG_MOVE_WATER_WALK:
        case CMSG_MOVE_SPLINE_DONE:
        case CMSG_MOVE_FALL_RESET:
        case CMSG_MOVE_TIME_SKIPPED:
        case CMSG_MOVE_FEATHER_FALL_ACK:
        case CMSG_MOVE_WATER_WALK_ACK:
        case CMSG_SET_ACTIVE_MOVER:
        case CMSG_MOVE_NOT_ACTIVE_MOVER:
        case CMSG_MOVE_START_SWIM_CHEAT:
        case CMSG_MOVE_STOP_SWIM_CHEAT:
        case CMSG_FORCE_WALK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_TURN_RATE_CHANGE_ACK:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        case MSG_MOVE_TIME_SKIPPED:
#endif
            return true;
    }
    return false;
}

void MovementAnticheat::LogMovementPacket(bool isClientPacket, WorldPacket const& packet)
{
    if (uint32 maxLogSize = sWorld.getConfig(CONFIG_UINT32_AC_MOVEMENT_PACKET_LOG_SIZE))
    {
        std::lock_guard<std::mutex> guard(m_packetLogMutex);
        if (m_packetLog.size() >= maxLogSize)
            m_packetLog.pop_front();

        m_packetLog.push_back(LoggedPacket(isClientPacket, packet));
    }
}

void MovementAnticheat::HandleCommand(ChatHandler* handler) const
{
    handler->PSendSysMessage("MaxSpaceDesync=%f", m_maxOverspeedDistance);
    handler->PSendSysMessage("MaxTimeDesync=%u", m_maxClientDesync);

    handler->SendSysMessage("Cheats detected: ");
    for (uint32 i = 0; i < CHEATS_COUNT; ++i)
        if (m_cheatOccuranceTotal[i])
            handler->PSendSysMessage("%2u x %s (cheat %u - 0x%x)", m_cheatOccuranceTotal[i], GetMovementCheatName(CheatType(i)), i, 1 << i);
}

void MovementAnticheat::Init()
{
    m_cheatOccuranceTick.fill(0);
    m_cheatOccuranceTotal.fill(0);

    m_overspeedDistance  = 0.f;
    m_maxOverspeedDistance = 0.f;
    m_clientDesync    = 0;
    m_maxClientDesync = 0;

    m_jumpCount = 0;
    m_jumpFlagCount = 0;
    m_jumpFlagTime = 0;
    m_knockBack = false;

    m_updateCheckTimer = CHEATS_UPDATE_INTERVAL;
}

void MovementAnticheat::InitNewPlayer(Player* pPlayer)
{
    me = pPlayer;
    m_jumpCount = 0;
    m_jumpFlagCount = 0;
    m_jumpFlagTime = 0;
    m_knockBack = false;
}

void MovementAnticheat::ResetJumpCounters()
{
    m_jumpCount = 0;
    m_jumpFlagCount = 0;
    m_jumpFlagTime = 0;
}

void MovementAnticheat::OnKnockBack(Player* pPlayer, float speedxy, float speedz, float cos, float sin)
{
    if (me != pPlayer)
        InitNewPlayer(pPlayer);

    m_knockBack = true;
    m_jumpFlagCount = 0;
    m_jumpFlagTime = 0;
}

void MovementAnticheat::OnUnreachable(Unit* attacker)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED) ||
        !sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_UNREACHABLE_ENABLED) ||
        (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_PLAYERS_ONLY) && (m_session->GetSecurity() != SEC_PLAYER)))
        return;

    if (IsInKnockBack() ||
        (attacker->GetCharmerOrOwnerGuid() == me->GetObjectGuid()) ||
        (me->GetTransport()))
        return;

    float waterLevel = (me->GetTerrain()->GetWaterLevel(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()) + 5.0f);
    if (me->GetPositionZ() < waterLevel)
        return;
    if (attacker->GetPositionZ() < waterLevel)
        return;

    AddCheats(1 << CHEAT_TYPE_PVE_FLYHACK);
}

void MovementAnticheat::OnExplore(AreaEntry const* pArea)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED) ||
        (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_PLAYERS_ONLY) && (m_session->GetSecurity() != SEC_PLAYER)))
        return;

    if (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_EXPLORE_ENABLED))
        AddCheats(1 << CHEAT_TYPE_EXPLORE);

    if (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_EXPLORE_HIGH_LEVEL_ENABLED) &&
        (static_cast<int32>(me->GetLevel() + 10) < pArea->AreaLevel))
        AddCheats(1 << CHEAT_TYPE_EXPLORE_HIGH_LEVEL);
}

void MovementAnticheat::OnWrongAckData()
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED) ||
        !sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WRONG_ACK_DATA_ENABLED) ||
        (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_PLAYERS_ONLY) && (m_session->GetSecurity() != SEC_PLAYER)))
        return;

    AddCheats(1 << CHEAT_TYPE_WRONG_ACK_DATA);
}

void MovementAnticheat::OnFailedToAckChange()
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED) ||
        !sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_PENDING_ACK_DELAY_ENABLED) ||
        (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_PLAYERS_ONLY) && (m_session->GetSecurity() != SEC_PLAYER)))
        return;

    AddCheats(1 << CHEAT_TYPE_PENDING_ACK_DELAY);
}

UnitMoveType MovementAnticheat::GetMoveTypeForMovementInfo(MovementInfo const& movementInfo) const
{
    UnitMoveType type = MOVE_RUN;
    if (movementInfo.HasMovementFlag(MOVEFLAG_SWIMMING))
        type = movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD) ? MOVE_SWIM_BACK : MOVE_SWIM;
    else if (movementInfo.HasMovementFlag(MOVEFLAG_WALK_MODE))
        type = MOVE_WALK;
    else if (movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING))
        type = movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD) ? MOVE_RUN_BACK : MOVE_RUN;

    return type;
}

bool ShouldRejectMovement(uint32 cheatFlags)
{
    if ((cheatFlags & (1 << CHEAT_TYPE_OVERSPEED_JUMP)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_JUMP_SPEED_CHANGE)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_MULTI_JUMP)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_MULTI_JUMP_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_WALL_CLIMB)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WALL_CLIMB_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_FLY_HACK_SWIM)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FLY_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_TELEPORT)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELEPORT_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_TELEPORT_TRANSPORT)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_FAKE_TRANSPORT)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_WATER_WALK)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WATER_WALK_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_SLOW_FALL)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SLOW_FALL_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_HOVER)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_HOVER_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_FIXED_Z)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FIXED_Z_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_ROOT_MOVE)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_ROOT_MOVE_REJECT))
        return true;

    if ((cheatFlags & (1 << CHEAT_TYPE_SELF_ROOT)) &&
        sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SELF_ROOT_REJECT))
        return true;

    return false;
}

void MovementAnticheat::OnDeath()
{
    m_deathTime = WorldTimer::getMSTime();
}

uint32 MovementAnticheat::HandlePositionTests(Player* pPlayer, MovementInfo& movementInfo, uint16 opcode)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED) ||
        (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_PLAYERS_ONLY) && (m_session->GetSecurity() != SEC_PLAYER)) ||
        !pPlayer->movespline->Finalized())
        return 0;
    
    if (pPlayer != me)
        InitNewPlayer(pPlayer);

    if (opcode == CMSG_MOVE_FEATHER_FALL_ACK)
        GetLastMovementInfo().jump.startClientTime = movementInfo.jump.startClientTime = movementInfo.ctime;

    uint32 cheatFlags = 0x0;
#define APPEND_CHEAT(t) cheatFlags |= (1 << t)
#define HAS_CHEAT(t) (cheatFlags & (1 << t))

    if (movementInfo.ctime == 0)
        APPEND_CHEAT(CHEAT_TYPE_NULL_CLIENT_TIME);

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    // Not allowed to change jump speed while jumping
    if ((movementInfo.moveFlags & (MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR)) &&
        (GetLastMovementInfo().moveFlags & (MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR)) &&
        (movementInfo.jump.xyspeed > GetLastMovementInfo().jump.xyspeed + 0.0001f) &&
        (GetLastMovementInfo().jump.xyspeed > 0.0001f) &&
        (!IsInKnockBack()))
        APPEND_CHEAT(CHEAT_TYPE_JUMP_SPEED_CHANGE);
#endif

    if (opcode == MSG_MOVE_JUMP && movementInfo.jump.xyspeed > (me->GetSpeed(GetMoveTypeForMovementInfo(GetLastMovementInfo())) + 0.0001f))
        APPEND_CHEAT(CHEAT_TYPE_OVERSPEED_JUMP);

    if (CheckMultiJump(opcode))
        APPEND_CHEAT(CHEAT_TYPE_MULTI_JUMP);

    if (opcode == MSG_MOVE_STOP_SWIM && (movementInfo.moveFlags & MOVEFLAG_SWIMMING))
        APPEND_CHEAT(CHEAT_TYPE_FLY_HACK_SWIM);

    if (uint32 flags = CheckTimeDesync(movementInfo))
        cheatFlags |= flags;

    bool teleportDetected;
    if (teleportDetected = CheckTeleport(movementInfo))
        APPEND_CHEAT(CHEAT_TYPE_TELEPORT);

    if (CheckForbiddenArea(movementInfo))
        APPEND_CHEAT(CHEAT_TYPE_FORBIDDEN_AREA);

    if (CheckFakeTransport(movementInfo))
        APPEND_CHEAT(CHEAT_TYPE_FAKE_TRANSPORT);

    if (CheckTeleportToTransport(movementInfo))
        APPEND_CHEAT(CHEAT_TYPE_TELEPORT_TRANSPORT);

    if (CheckWallClimb(movementInfo, opcode))
        APPEND_CHEAT(CHEAT_TYPE_WALL_CLIMB);

    if (CheckNoFallTime(movementInfo, opcode))
        APPEND_CHEAT(CHEAT_TYPE_NO_FALL_TIME);

    if (opcode == CMSG_MOVE_FALL_RESET &&
        CheckFallReset(movementInfo))
        APPEND_CHEAT(CHEAT_TYPE_BAD_FALL_RESET);

    if (CheckFallStop(movementInfo, opcode))
        APPEND_CHEAT(CHEAT_TYPE_BAD_FALL_STOP);

    if (CheckMoveStart(movementInfo, opcode))
        APPEND_CHEAT(CHEAT_TYPE_BAD_MOVE_START);

    // Distance computation related. No need to do it if teleport detected.
    if (!teleportDetected)
    {
        if (uint32 flags = CheckSpeedHack(movementInfo, opcode))
            cheatFlags |= flags;
    }

    if (IsFallEndOpcode(opcode) || 
        movementInfo.HasMovementFlag(MOVEFLAG_ROOT))
        m_knockBack = false;

    CheckBotting(opcode, movementInfo);

    AddCheats(cheatFlags);

    if (ShouldRejectMovement(cheatFlags))
    {
        // Movement flags get verified first. Don't undo them if they passed.
        if (IsFlagAckOpcode(opcode))
        {
            me->m_movementInfo.moveFlags = movementInfo.moveFlags;
            me->m_movementInfo.CorrectData(me);
        }     
        
        if (HAS_CHEAT(CHEAT_TYPE_OVERSPEED_JUMP) &&
            sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_REJECT))
        {
            UnitMoveType moveType = GetMoveTypeForMovementInfo(GetLastMovementInfo());
            float speedRate = me->GetSpeed(moveType) / baseMoveSpeed[moveType];
            MovementPacketSender::SendSpeedChangeToAll(me, moveType, speedRate);
        }

        me->ResolvePendingMovementChanges(true, true);
        me->RemoveUnitMovementFlag(MOVEFLAG_MASK_XZ);
        if (!GetLastMovementInfo().HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
            ResetJumpCounters();
        me->SendHeartBeat(true);

        if (HAS_CHEAT(CHEAT_TYPE_FAKE_TRANSPORT) &&
            sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_REJECT))
        {
            // Force logout player to sync transport positions.
            m_session->LogoutRequest(time(nullptr) - 20);
        }

        return WorldTimer::getMSTime() + 100 + std::min(1000u, sWorld.GetCurrentDiff() + m_session->GetLatency());
    }

    return 0;
#undef APPEND_CHEAT
#undef HAS_CHEAT
}

uint32 MovementAnticheat::HandleFlagTests(Player* pPlayer, MovementInfo& movementInfo, uint16 opcode)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED) ||
        (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_PLAYERS_ONLY) && (m_session->GetSecurity() != SEC_PLAYER)))
        return 0;
    
    if (me != pPlayer)
        InitNewPlayer(pPlayer);

    auto const currentMoveFlags = movementInfo.moveFlags;
    uint32 removeMoveFlags = 0;

    uint32 cheatFlags = 0x0;
#define APPEND_CHEAT(t) cheatFlags |= (1 << t)

    // Client is rooted, but there is no root server side.
    if ((currentMoveFlags & MOVEFLAG_ROOT) &&
        !(GetLastMovementInfo().moveFlags & MOVEFLAG_ROOT) &&
        !me->HasPendingMovementChange(ROOT) &&
        !me->HasUnitState(UNIT_STAT_ROOT | UNIT_STAT_PENDING_ROOT | UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED | UNIT_STAT_ROOT_ON_LANDING) &&
        (opcode != CMSG_FORCE_MOVE_ROOT_ACK))
    {
        APPEND_CHEAT(CHEAT_TYPE_SELF_ROOT);
        removeMoveFlags |= MOVEFLAG_ROOT;
    }

    // Moving while rooted. We do not apply root flag until ack, so should be no false positives.
    if ((currentMoveFlags & MOVEFLAG_MASK_MOVING) &&
        ((currentMoveFlags & MOVEFLAG_ROOT) || (GetLastMovementInfo().moveFlags & MOVEFLAG_ROOT)) &&
        !me->HasPendingMovementChange(ROOT) &&
        (opcode != CMSG_FORCE_MOVE_UNROOT_ACK))
    {
        APPEND_CHEAT(CHEAT_TYPE_ROOT_MOVE);
        removeMoveFlags |= MOVEFLAG_MASK_MOVING;
        movementInfo.moveFlags |= MOVEFLAG_ROOT;
    }

    // This flag is only for creatures.
    if ((currentMoveFlags & MOVEFLAG_FIXED_Z) &&
        !me->HasCheatOption(PLAYER_CHEAT_FIXED_Z))
    {
        APPEND_CHEAT(CHEAT_TYPE_FIXED_Z);
        removeMoveFlags |= MOVEFLAG_FIXED_Z;
    }

    // This flag is only for creatures.
    if ((currentMoveFlags & MOVEFLAG_LEVITATING) &&
        !me->HasCheatOption(PLAYER_CHEAT_FLY))
    {
        APPEND_CHEAT(CHEAT_TYPE_FLY_HACK_SWIM);
        removeMoveFlags |= MOVEFLAG_LEVITATING;
    }

    if ((currentMoveFlags & MOVEFLAG_SWIMMING) &&
        (currentMoveFlags & MOVEFLAG_FLYING) &&
        !me->IsTaxiFlying() &&
        !me->HasCheatOption(PLAYER_CHEAT_FLY))
    {
        APPEND_CHEAT(CHEAT_TYPE_FLY_HACK_SWIM);
        removeMoveFlags |= MOVEFLAG_SWIMMING | MOVEFLAG_FLYING;
    }

    if ((currentMoveFlags & MOVEFLAG_WATERWALKING) &&
        !(GetLastMovementInfo().moveFlags & MOVEFLAG_WATERWALKING) &&
        !me->HasAuraType(SPELL_AURA_WATER_WALK) &&
        !me->HasAuraType(SPELL_AURA_GHOST) &&
        !me->HasPendingMovementChange(WATER_WALK) &&
        (opcode != CMSG_MOVE_WATER_WALK_ACK))
    {
        APPEND_CHEAT(CHEAT_TYPE_WATER_WALK);
        removeMoveFlags |= MOVEFLAG_WATERWALKING;
    }

    if ((currentMoveFlags & MOVEFLAG_SAFE_FALL) &&
        !(GetLastMovementInfo().moveFlags & MOVEFLAG_SAFE_FALL) &&
        !me->HasAuraType(SPELL_AURA_FEATHER_FALL) &&
        !me->HasPendingMovementChange(FEATHER_FALL) &&
        (opcode != CMSG_MOVE_FEATHER_FALL_ACK))
    {
        APPEND_CHEAT(CHEAT_TYPE_SLOW_FALL);
        removeMoveFlags |= MOVEFLAG_SAFE_FALL;
    }

    if ((currentMoveFlags & MOVEFLAG_HOVER) &&
        !(GetLastMovementInfo().moveFlags & MOVEFLAG_HOVER) &&
        !me->HasAuraType(SPELL_AURA_HOVER) &&
        !me->HasPendingMovementChange(SET_HOVER) &&
        (opcode != CMSG_MOVE_HOVER_ACK))
    {
        APPEND_CHEAT(CHEAT_TYPE_HOVER);
        removeMoveFlags |= MOVEFLAG_HOVER;
    }
#undef APPEND_CHEAT

    AddCheats(cheatFlags);

    if (ShouldRejectMovement(cheatFlags) &&
        me->movespline->Finalized() &&
       !me->IsBeingTeleported())
    {
        me->RemoveUnitMovementFlag(removeMoveFlags);
        me->ResolvePendingMovementChanges(true, true);
        me->SendHeartBeat(true);
        return WorldTimer::getMSTime() + 100 + std::min(1000u, sWorld.GetCurrentDiff() + m_session->GetLatency());
    }
    else if (removeMoveFlags)
        movementInfo.RemoveMovementFlag(removeMoveFlags);

    return 0;
}

bool MovementAnticheat::HandleSplineDone(Player* pPlayer, MovementInfo const& movementInfo, uint32 splineId)
{
    if (me != pPlayer)
        InitNewPlayer(pPlayer);

    if (splineId == m_lastSplineId)
    {
        AddMessageToPacketLog("HandleSplineDone: spline id == last spline id == " + std::to_string(splineId));
        sLog.Player(m_session, LOG_ANTICHEAT, "Movement", LOG_LVL_MINIMAL, "HandleSplineDone: Player sent spline done opcode for spline id %u twice",
            splineId);
        return false;
    }

    m_lastSplineId = splineId;

    float distance = Geometry::GetDistance3D(movementInfo.GetTransportGuid() ? movementInfo.GetTransportPos() : movementInfo.GetPos(), me->movespline->FinalDestination());
    if (distance > 10.0f)
    {
        AddMessageToPacketLog("HandleSplineDone: distance to spline destination is " + std::to_string(distance));
        sLog.Player(m_session, LOG_ANTICHEAT, "Movement", LOG_LVL_MINIMAL, "HandleSplineDone: Player sent spline done opcode with position that is %g yards away from destination",
            distance);
        return false;
    }

    if (!movementInfo.HasMovementFlag(MOVEFLAG_FALLINGFAR | MOVEFLAG_JUMPING))
        ResetJumpCounters();

    return true;
}

#define JUMP_FLAG_THRESHOLD 3
#define MIN_FALLING_TIME 1000u

bool MovementAnticheat::CheckNoFallTime(MovementInfo const& movementInfo, uint16 opcode)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_NO_FALL_TIME_ENABLED))
        return false;

    if (opcode == CMSG_MOVE_FALL_RESET || movementInfo.HasMovementFlag(MOVEFLAG_FIXED_Z))
    {
        m_jumpFlagCount = 0;
        m_jumpFlagTime = 0;
        return false;
    }

    if (!GetLastMovementInfo().ctime ||
        !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
    {
        m_jumpFlagCount = 0;
        m_jumpFlagTime = 0;
    }

    if (movementInfo.HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
    {
        m_jumpFlagCount++;

        if (!m_jumpFlagTime)
            m_jumpFlagTime = movementInfo.ctime;
    }

    if (!movementInfo.fallTime &&
        m_jumpFlagCount >= JUMP_FLAG_THRESHOLD &&
       (m_jumpFlagTime + MIN_FALLING_TIME) < movementInfo.ctime)
    {
        m_jumpFlagCount = 0;
        m_jumpFlagTime = 0;
        return true;
    }

    if (!movementInfo.HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
    {
        m_jumpFlagCount = 0;
        m_jumpFlagTime = 0;
    }

    return false;
}

bool MovementAnticheat::CheckFallReset(MovementInfo const& movementInfo) const
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_FALL_RESET_ENABLED))
        return false;

    // older clients spam fall reset opcode with fixed z flag
    if (movementInfo.HasMovementFlag(MOVEFLAG_FIXED_Z))
        return false;

    if (GetLastMovementInfo().ctime)
    {
        if (!GetLastMovementInfo().HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
            return true;
    }
    
    return movementInfo.fallTime != 0 || movementInfo.jump.zspeed != 0.0f;
}

bool MovementAnticheat::CheckFallStop(MovementInfo const& movementInfo, uint16 opcode)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_FALL_STOP_ENABLED))
        return false;

    if (!GetLastMovementInfo().ctime)
        return false;

    if (IsFallEndOpcode(opcode))
        return false;

    if (opcode == CMSG_FORCE_MOVE_ROOT_ACK)
        return false;

    if (movementInfo.HasMovementFlag(MOVEFLAG_ROOT))
        return false;

    if (!movementInfo.HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR) &&
        GetLastMovementInfo().HasMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR))
        return true;

    return false;
}

bool MovementAnticheat::CheckMoveStart(MovementInfo const& movementInfo, uint16 opcode)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_MOVE_START_ENABLED))
        return false;

    if (!GetLastMovementInfo().ctime)
        return false;

    if (IsFallEndOpcode(opcode))
        return false;

    if (IsAnyMoveAckOpcode(opcode))
        return false;

    if (opcode == MSG_MOVE_START_FORWARD)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_FORWARD))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_FORWARD) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_FORWARD))
            return true;
    }
    
    if (opcode == MSG_MOVE_START_BACKWARD)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_BACKWARD))
            return true;
    }

    if (opcode == MSG_MOVE_START_PITCH_DOWN)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_PITCH_DOWN))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_PITCH_DOWN) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_PITCH_DOWN))
            return true;
    }

    if (opcode == MSG_MOVE_START_PITCH_UP)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_PITCH_UP))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_PITCH_UP) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_PITCH_UP))
            return true;
    }

    if (opcode == MSG_MOVE_START_STRAFE_LEFT)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_STRAFE_LEFT))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_STRAFE_LEFT) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_STRAFE_LEFT))
            return true;
    }

    if (opcode == MSG_MOVE_START_STRAFE_RIGHT)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_STRAFE_RIGHT))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_STRAFE_RIGHT) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_STRAFE_RIGHT))
            return true;
    }

    if (opcode == MSG_MOVE_START_SWIM)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_SWIMMING))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_SWIMMING) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_SWIMMING))
            return true;
    }

    if (opcode == MSG_MOVE_START_TURN_LEFT)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_TURN_LEFT))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_TURN_LEFT) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_TURN_LEFT))
            return true;
    }

    if (opcode == MSG_MOVE_START_TURN_RIGHT)
    {
        if (!movementInfo.HasMovementFlag(MOVEFLAG_TURN_RIGHT))
            return true;
    }
    else
    {
        if (movementInfo.HasMovementFlag(MOVEFLAG_TURN_RIGHT) &&
           !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_TURN_RIGHT))
            return true;
    }

    return false;
}

uint32 MovementAnticheat::CheckTimeDesync(MovementInfo const& movementInfo)
{
    uint32 cheatFlags = 0x0;
#define APPEND_CHEAT(t) cheatFlags |= (1 << t)

    if (GetLastMovementInfo().ctime)
    {
        if (GetLastMovementInfo().moveFlags & MOVEFLAG_MASK_MOVING)
        {
            int32 currentDesync = (int32)WorldTimer::getMSTimeDiff(GetLastMovementInfo().ctime, movementInfo.ctime) - WorldTimer::getMSTimeDiff(GetLastMovementInfo().stime, movementInfo.stime);
            m_clientDesync += currentDesync;
            if (currentDesync > 1000)
                APPEND_CHEAT(CHEAT_TYPE_NUM_DESYNC);
        }
        // Client going back in time?
        if (movementInfo.ctime < GetLastMovementInfo().ctime)
            APPEND_CHEAT(CHEAT_TYPE_TIME_BACK);
    }

    return cheatFlags;
#undef APPEND_CHEAT
}

bool MovementAnticheat::CheckMultiJump(uint16 opcode)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_MULTI_JUMP_ENABLED))
        return false;

    switch (opcode)
    {
        case MSG_MOVE_JUMP:
        {
            m_jumpCount++;
            if (m_jumpCount > 1)
                return true;
            break;
        }
        case MSG_MOVE_FALL_LAND:
        case MSG_MOVE_START_SWIM:
        {
            m_jumpCount = 0;
            break;
        }
    }

    return false;
}

#define NO_WALL_CLIMB_CHECK_MOVE_FLAGS (MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR | MOVEFLAG_SWIMMING | MOVEFLAG_FLYING | MOVEFLAG_PITCH_UP | MOVEFLAG_PITCH_DOWN | MOVEFLAG_ONTRANSPORT | MOVEFLAG_SPLINE_ELEVATION)
#define NO_WALL_CLIMB_CHECK_UNIT_FLAGS (UNIT_FLAG_UNK_0 | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_CONFUSED | UNIT_FLAG_FLEEING | UNIT_FLAG_POSSESSED)

bool MovementAnticheat::CheckWallClimb(MovementInfo const& movementInfo, uint16 opcode) const
{
    // Not currently handled cases.
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WALL_CLIMB_ENABLED) ||
       (GetLastMovementInfo().moveFlags & NO_WALL_CLIMB_CHECK_MOVE_FLAGS) ||
       (movementInfo.moveFlags & NO_WALL_CLIMB_CHECK_MOVE_FLAGS) ||
       (me->HasFlag(UNIT_FIELD_FLAGS, NO_WALL_CLIMB_CHECK_UNIT_FLAGS)) ||
        IsInKnockBack() || me->IsTaxiFlying() || !GetLastMovementInfo().ctime)
        return false;
    
    float const deltaXY = GetDistance2D(GetLastMovementInfo().pos, movementInfo.pos);
    if (deltaXY < 0.5f)
        return false;

    float const deltaZ = movementInfo.pos.z - GetLastMovementInfo().pos.z;
    if (deltaZ < 1.0f)
        return false;

    float const angleRad = atan(deltaZ / deltaXY);
    //float const angleDeg = angleRad * (360 / (M_PI_F * 2));

    float const maxClimbAngle = sWorld.getConfig(CONFIG_FLOAT_AC_MOVEMENT_CHEAT_WALL_CLIMB_ANGLE);
    if (angleRad > maxClimbAngle)
    {
        if (angleRad > (maxClimbAngle + 0.2f))
            return true;

        // check height with and without vmaps and compare
        // if player is stepping over model like stairs, that can increase wall climb angle
        float const height1 = me->GetMap()->GetHeight(movementInfo.pos.x, movementInfo.pos.y, movementInfo.pos.z, false);
        float const height2 = me->GetMap()->GetHeight(movementInfo.pos.x, movementInfo.pos.y, movementInfo.pos.z, true);
        if (std::abs(height1 - height2) < 0.5f)
            return true;
    }

    return false;
}

bool MovementAnticheat::CheckForbiddenArea(MovementInfo const& movementInfo) const
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FORBIDDEN_AREA_ENABLED))
        return false;

    switch(me->GetMapId())
    {
        case 30: // Alterac Valley
        {
            if (BattleGround* bg = me->GetBattleGround())
            {
                if (bg->GetStatus() == STATUS_WAIT_JOIN)
                {
                    // Outside of starting area before BG has started.
                    if (me->GetTeam() == ALLIANCE && movementInfo.pos.x < 770.0f)
                        return true;
                    if (me->GetTeam() == HORDE && movementInfo.pos.y > -540.0f)
                        return true;
                }
            }
            break;
        }
        case 489: // Warsong Gulch
        {
            // Only way to get this high is with engineering items malfunction.
            if (!(movementInfo.moveFlags & (MOVEFLAG_FALLINGFAR | MOVEFLAG_JUMPING)) && movementInfo.pos.z > 380.0f)
                return true;

            if (BattleGround* bg = me->GetBattleGround())
            {
                if (bg->GetStatus() == STATUS_WAIT_JOIN)
                {
                    // Outside of starting area before BG has started.
                    if (me->GetTeam() == ALLIANCE && movementInfo.pos.x < 1490.0f)
                        return true;
                    if (me->GetTeam() == HORDE && movementInfo.pos.x > 957.0f)
                        return true;
                }
            }
            break;
        }
        case 529: // Arathi Basin
        {
            if (BattleGround* bg = me->GetBattleGround())
            {
                if (bg->GetStatus() == STATUS_WAIT_JOIN)
                {
                    // Outside of starting area before BG has started.
                    if (me->GetTeam() == ALLIANCE && movementInfo.pos.x < 1270.0f)
                        return true;
                    if (me->GetTeam() == HORDE && movementInfo.pos.x > 730.0f)
                        return true;
                }
            }
            break;
        }
    }

    return false;
}

uint32 MovementAnticheat::CheckSpeedHack(MovementInfo const& movementInfo, uint16 opcode)
{
    if ((opcode == CMSG_MOVE_KNOCK_BACK_ACK) ||
        (opcode == CMSG_MOVE_SPLINE_DONE) ||
        IsInKnockBack() ||
        !GetLastMovementInfo().ctime ||
        me->IsTaxiFlying() || 
        me->IsBeingTeleported())
        return 0;

    uint32 cheatFlags = 0x0;
#define APPEND_CHEAT(t) cheatFlags |= (1 << t)

    int32 clientTimeDiff = movementInfo.ctime - GetLastMovementInfo().ctime;
    if (sWorld.getConfig(CONFIG_INT32_AC_ANTICHEAT_MAX_ALLOWED_DESYNC) && clientTimeDiff > sWorld.getConfig(CONFIG_INT32_AC_ANTICHEAT_MAX_ALLOWED_DESYNC))
        clientTimeDiff = sWorld.getConfig(CONFIG_INT32_AC_ANTICHEAT_MAX_ALLOWED_DESYNC);

    if (sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SPEED_HACK_ENABLED))
    {
        float intX, intY, intZ, intO;

        // Check vs extrapolation
        if (me->ExtrapolateMovement(GetLastMovementInfo(), clientTimeDiff, intX, intY, intZ, intO))
        {
            auto const intDX = intX - movementInfo.pos.x;
            auto const intDY = intY - movementInfo.pos.y;
            auto const intDZ = intZ - movementInfo.pos.z;

            auto interpolDist = pow(intDX, 2) + pow(intDY, 2);
            if ((movementInfo.moveFlags | GetLastMovementInfo().moveFlags) & MOVEFLAG_JUMPING)
                interpolDist += pow(intDZ, 2);
            interpolDist = sqrt(interpolDist);

            float allowedDX = pow(intX - GetLastMovementInfo().pos.x, 2);
            float allowedDY = pow(intY - GetLastMovementInfo().pos.y, 2);
            float allowedDXY = sqrt(allowedDX + allowedDY);
            float realDistance2D_sq = pow(movementInfo.pos.x - GetLastMovementInfo().pos.x, 2) + pow(movementInfo.pos.y - GetLastMovementInfo().pos.y, 2);

            if (realDistance2D_sq > (allowedDY + allowedDX) * 1.1f)
                m_overspeedDistance += sqrt(realDistance2D_sq) - sqrt(allowedDY + allowedDX);
        }
        // Simple calculation for transports
        else if (!movementInfo.t_guid.IsEmpty() && (movementInfo.moveFlags & MOVEFLAG_ONTRANSPORT) &&
                 !GetLastMovementInfo().t_guid.IsEmpty() && (GetLastMovementInfo().moveFlags & MOVEFLAG_ONTRANSPORT))
        {
            float const distanceTraveled = GetDistance2D(GetLastMovementInfo().t_pos, movementInfo.t_pos);
            float const timeFactor = float(1 * IN_MILLISECONDS) / float(std::max(1, clientTimeDiff));
            if (distanceTraveled > 0)
            {
                float const distanceAllowed1 = me->GetSpeedForMovementInfo(movementInfo) / timeFactor;
                float const distanceAllowed2 = me->GetSpeedForMovementInfo(GetLastMovementInfo()) / timeFactor;
                float const distanceAllowed = std::max(distanceAllowed1, distanceAllowed2);
                if (distanceTraveled > distanceAllowed * 2.0f)
                    m_overspeedDistance += (distanceTraveled - distanceAllowed);
            }
        }
    }

    // Client should send heartbeats every 500ms
    if ((clientTimeDiff > 1000) && (GetLastMovementInfo().moveFlags & MOVEFLAG_MASK_MOVING))
        APPEND_CHEAT(CHEAT_TYPE_SKIPPED_HEARTBEATS);

    return cheatFlags;
#undef APPEND_CHEAT
}

bool MovementAnticheat::CheckFakeTransport(MovementInfo const& movementInfo)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_ENABLED))
        return false;

    // Do not allow bypassing anticheat by pretending to be on a transport.
    if (movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT) &&
        GetLastMovementInfo().ctime && !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        GameObject* pTransport = me->GetMap()->GetGameObject(movementInfo.t_guid);

        if (!pTransport || !pTransport->IsTransport() || !pTransport->IsWithinDist(me, 70.0f, false))
            return true;
    }
    return false;
}

bool MovementAnticheat::CheckTeleportToTransport(MovementInfo const& movementInfo) const
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_ENABLED))
        return false;

    // To transport tele hack detection
    if (movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT) &&
        GetLastMovementInfo().ctime && !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        float dist2d = (movementInfo.pos.x - GetLastMovementInfo().pos.x) * (movementInfo.pos.x - GetLastMovementInfo().pos.x);
        dist2d += (movementInfo.pos.y - GetLastMovementInfo().pos.y) * (movementInfo.pos.y - GetLastMovementInfo().pos.y);
        if (dist2d > 100 * 100)
            return true;
    }
    return false;
}

bool MovementAnticheat::HasEnoughBottingData()
{
    uint32 const totalTime = WorldTimer::getMSTimeDiffToNow(m_bottingCheckStartTime);

    // player is mostly afk, start over in this case
    if (totalTime > ((m_movementPacketsCount - m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING]) * 5000))
        return false;

    if (m_movementPacketsCount < sWorld.getConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_PACKETS))
        return false;

    // if more than 25% of packets are turns with mouse, then likely not a bot, as bots dont move camera this much
    if (m_turnType == TURN_MOUSE && (m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING] > (m_movementPacketsCount / 4)))
        return false;
    if (m_turnType == TURN_KEYBOARD && (m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING] > (m_movementPacketsCount / 2)))
        return false;

    return true;
}

void MovementAnticheat::ResetBottingStats()
{
    m_bottingCheckStartTime = WorldTimer::getMSTime();
    m_movementPacketsCount = 0;
    m_turnType = TURN_NONE;
    m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING] = 0;
}

void MovementAnticheat::CheckBotting(uint16 opcode, MovementInfo const& movementInfo)
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BOTTING_ENABLED))
        return;

    // we dont care about involuntary opcodes
    if (IsAnyMoveAckOpcode(opcode))
        return;

    // if we were being moved by server previously, skip this packet
    if (!GetLastMovementInfo().ctime)
        return;

    bool turning;
    switch (opcode)
    {
        case MSG_MOVE_START_STRAFE_LEFT:
        case MSG_MOVE_START_STRAFE_RIGHT:
        {
            // bots dont strafe
            ResetBottingStats();
            return;
        }
        case MSG_MOVE_JUMP:
        {
            // bots dont jump backwards or use it to interrupt casting
            if (movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD) || me->IsNonMeleeSpellCasted())
            {
                ResetBottingStats();
                return;
            }
            turning = false;
            break;
        }
        case MSG_MOVE_SET_FACING:
        {
            if (m_turnType != TURN_MOUSE && m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING])
            {
                ResetBottingStats();
                m_turnType = TURN_MOUSE;
            }
            turning = true;
            break;
        }
        case MSG_MOVE_START_TURN_LEFT:
        case MSG_MOVE_START_TURN_RIGHT:
        {
            if (m_turnType != TURN_KEYBOARD && m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING])
            {
                ResetBottingStats();
                m_turnType = TURN_KEYBOARD;
            }
            turning = true;
            break;
        }
        case MSG_MOVE_START_FORWARD:
        case MSG_MOVE_START_BACKWARD:
        {
            if (std::abs(GetLastMovementInfo().pos.o - movementInfo.pos.o) < 0.1f)
            {
                turning = false;
                break;
            }

            // if consistently turning this way then its certainly a cheater
            if (m_turnType != TURN_ABNORMAL && m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING])
            {
                ResetBottingStats();
                m_turnType = TURN_ABNORMAL;
            }
            turning = true;
            break;
        }
        default:
        {
            turning = false;
            break;
        }
    }

    if (turning)
    {
        if (Unit* pVictim = me->GetVictim())
        {
            // bots do not turn in combat while already facing victim
            if (pVictim->IsInCombat() && !pVictim->IsMoving() && me->HasInArc(pVictim, M_PI_F / 2.0f))
            {
                ResetBottingStats();
                return;
            }
        }

        // we store turns count here
        m_cheatOccuranceTotal[CHEAT_TYPE_BOTTING]++;
    }
    
    m_movementPacketsCount++;
}

bool MovementAnticheat::CheckTeleport(MovementInfo const& movementInfo) const
{
    if (!sWorld.getConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELEPORT_ENABLED) ||
        me->IsLaunched() || me->IsTaxiFlying() || me->IsBeingTeleported())
        return false;

    if (!IsTeleportAllowed3D(movementInfo))
        return true;

    // check moving in given axis without appropriate move flags
    // during fall collision with cliffs can change xy so skip that case
    if (GetLastMovementInfo().ctime &&
       !GetLastMovementInfo().HasMovementFlag(MOVEFLAG_MASK_XZ | MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR) &&
       !movementInfo.HasMovementFlag(MOVEFLAG_MASK_XZ | MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR) &&
        GetLastMovementInfo().HasMovementFlag(MOVEFLAG_ONTRANSPORT) == movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        float const distance2d = movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT) ?
            GetDistance2D(GetLastMovementInfo().t_pos, movementInfo.t_pos) :
            GetDistance2D(GetLastMovementInfo().pos, movementInfo.pos);
        
        if (distance2d > 1.0f)
            return true;

        // swimming flag only included in check because of 1.14
        // vanilla clients do not have a descend/ascend flag
        if (!GetLastMovementInfo().HasMovementFlag(MOVEFLAG_SWIMMING) &&
            !movementInfo.HasMovementFlag(MOVEFLAG_SWIMMING))
        {
            float const distanceZ = movementInfo.HasMovementFlag(MOVEFLAG_ONTRANSPORT) ?
                std::abs(GetLastMovementInfo().t_pos.z - movementInfo.t_pos.z) :
                std::abs(GetLastMovementInfo().pos.z - movementInfo.pos.z);
            
            if (distanceZ > 2.0f)
                return true;
        }
    }

    return false;
}

bool MovementAnticheat::IsInTransportArea() const
{
    // Undercity Lift
    if ((me->GetCachedZoneId() == 1497 && me->GetCachedAreaId() == 1497) ||
    // Deeprun Tram
        (me->GetCachedZoneId() == 2257) ||
    // Thousand Needles Lift
        (me->GetCachedZoneId() == 400 && me->GetCachedAreaId() == 485))
    return true;

    return false;
}

#define ALLOWED_TRANSPORT_DISTANCE 100.0f

bool MovementAnticheat::IsTeleportAllowed3D(MovementInfo const& movementInfo) const
{
    if (me->m_transport || me->HasMovementFlag(MOVEFLAG_ONTRANSPORT))
        return true;

    float const distance = GetDistance3D(me->GetPosition(), movementInfo.pos);
    float const maxDistance = sWorld.getConfig(CONFIG_FLOAT_AC_MOVEMENT_CHEAT_TELEPORT_DISTANCE) * std::max(1.0f, me->GetSpeedRate(GetMoveTypeForMovementInfo(movementInfo)) * 0.2f);

    if (distance > maxDistance)
    {
        // Exclude elevators
        if (IsInTransportArea())
            return distance < ALLOWED_TRANSPORT_DISTANCE;

        return false;
    }

    return true;
}
