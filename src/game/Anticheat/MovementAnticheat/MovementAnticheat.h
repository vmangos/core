#ifndef _HEADER_CHEATS
#define _HEADER_CHEATS

#include "Common.h"
#include "UnitDefines.h"
#include "Anticheat.h"
#include "SniffFile.h"

#include <array>
#include <sstream>
#include <deque>
#include <mutex>

enum TurnType
{
    TURN_NONE,
    TURN_MOUSE,
    TURN_KEYBOARD,
    TURN_ABNORMAL
};

enum CheatType
{
    CHEAT_TYPE_TIME_BACK,
    CHEAT_TYPE_NULL_CLIENT_TIME,
    CHEAT_TYPE_SKIPPED_HEARTBEATS,
    CHEAT_TYPE_TIME_DESYNC,
    CHEAT_TYPE_NUM_DESYNC,
    CHEAT_TYPE_OVERSPEED_DIST,
    CHEAT_TYPE_OVERSPEED_JUMP,
    CHEAT_TYPE_JUMP_SPEED_CHANGE,
    CHEAT_TYPE_MULTI_JUMP,
    CHEAT_TYPE_WALL_CLIMB,
    CHEAT_TYPE_PVE_FLYHACK,
    CHEAT_TYPE_FLY_HACK_SWIM,
    CHEAT_TYPE_NO_FALL_TIME,
    CHEAT_TYPE_BAD_FALL_RESET,
    CHEAT_TYPE_BAD_FALL_STOP,
    CHEAT_TYPE_BAD_MOVE_START,
    CHEAT_TYPE_TELEPORT,
    CHEAT_TYPE_TELEPORT_TRANSPORT,
    CHEAT_TYPE_FAKE_TRANSPORT,
    CHEAT_TYPE_WATER_WALK,
    CHEAT_TYPE_SLOW_FALL,
    CHEAT_TYPE_HOVER,
    CHEAT_TYPE_FIXED_Z,
    CHEAT_TYPE_ROOT_MOVE,
    CHEAT_TYPE_SELF_ROOT,
    CHEAT_TYPE_WRONG_ACK_DATA,
    CHEAT_TYPE_PENDING_ACK_DELAY,
    CHEAT_TYPE_EXPLORE,
    CHEAT_TYPE_EXPLORE_HIGH_LEVEL,
    CHEAT_TYPE_FORBIDDEN_AREA,
    CHEAT_TYPE_BOTTING,
    CHEATS_COUNT
};

#define CHEATS_UPDATE_INTERVAL      4000
const char* GetMovementCheatName(CheatType type);

class Player;
class MovementInfo;
class ChatHandler;
class WorldSession;
class WorldPacket;

class MovementAnticheat
{
    public:
        explicit MovementAnticheat(Player* _me);

        void Init();
        void InitNewPlayer(Player* pPlayer);
        void ResetJumpCounters();

        void AddCheats(uint32 cheats, uint32 count = 1);
        void StoreCheat(uint32 type, uint32 count = 1);
        uint32 ComputeCheatAction(std::stringstream& reason);

        void HandleCommand(ChatHandler* handler) const;
        uint32 Update(Player* pPlayer, uint32 diff, std::stringstream& reason);
        uint32 Finalize(Player* pPlayer, std::stringstream& reason);

        // Public methods called from the movement handler upon received a packet.
        uint32 HandlePositionTests(Player* pPlayer, MovementInfo& movementInfo, uint16 opcode);
        uint32 HandleFlagTests(Player* pPlayer, MovementInfo& movementInfo, uint16 opcode);
        bool HandleSplineDone(Player* pPlayer, MovementInfo const& movementInfo, uint32 splineId);
        void LogMovementPacket(bool isClientPacket, WorldPacket const& packet);
        static bool IsLoggedOpcode(uint16 opcode);

        bool IsInKnockBack() const { return m_knockBack; }

        void OnKnockBack(Player* pPlayer, float speedxy, float speedz, float cos, float sin);
        void OnUnreachable(Unit* attacker);
        void OnExplore(AreaEntry const* pArea);
        void OnWrongAckData();
        void OnFailedToAckChange();
        void OnDeath();

    private:
        bool HasEnoughBottingData();
        void ResetBottingStats();
        void CheckBotting(uint16 opcode, MovementInfo const& movementInfo);
        bool CheckTeleport(MovementInfo const& movementInfo) const;
        bool IsTeleportAllowed3D(MovementInfo const& movementInfo) const;
        bool IsInTransportArea() const;
        bool CheckForbiddenArea(MovementInfo const& movementInfo) const;
        bool CheckMultiJump(uint16 opcode);
        bool CheckWallClimb(MovementInfo const& movementInfo, uint16 opcode) const;
        bool CheckNoFallTime(MovementInfo const& movementInfo, uint16 opcode);
        bool CheckFallReset(MovementInfo const& movementInfo) const;
        bool CheckFallStop(MovementInfo const& movementInfo, uint16 opcode);
        bool CheckMoveStart(MovementInfo const& movementInfo, uint16 opcode);
        bool CheckFakeTransport(MovementInfo const& movementInfo);
        bool CheckTeleportToTransport(MovementInfo const& movementInfo) const;
        uint32 CheckSpeedHack(MovementInfo const& movementInfo, uint16 opcode);
        uint32 CheckTimeDesync(MovementInfo const& movementInfo);

        void AddMessageToPacketLog(std::string message);

        MovementInfo& GetLastMovementInfo();
        MovementInfo const& GetLastMovementInfo() const;
        UnitMoveType GetMoveTypeForMovementInfo(MovementInfo const& movementInfo) const;

        bool m_knockBack = false;
        uint32 m_lastSplineId = 0;
        uint32 m_deathTime = 0;

        // Multi jump
        uint32 m_jumpCount = 0;

        // No fall time
        uint32 m_jumpFlagCount = 0;
        uint32 m_jumpFlagTime = 0;

        // Speed hack
        int32 m_clientDesync = 0;
        uint32 m_maxClientDesync = 0;
        float m_overspeedDistance = 0.0f;
        float m_maxOverspeedDistance = 0.0f;

        // Botting
        uint32 m_bottingCheckStartTime = 0;
        uint32 m_movementPacketsCount = 0;
        TurnType m_turnType = TURN_NONE;

        Player* me = nullptr; // current player object that checks run on, changes on mind control
        WorldSession* const m_session = nullptr; // session to which the cheat data belongs, does not change

        uint32 m_updateCheckTimer = 0;
        std::array<uint32, CHEATS_COUNT> m_cheatOccuranceTick = {};    // gets reset every anticheat update tick
        std::array<uint32, CHEATS_COUNT> m_cheatOccuranceTotal = {};   // gets reset when total treshold is reached
        std::deque<LoggedPacket> m_packetLog;
        std::mutex m_packetLogMutex;
};

#endif
