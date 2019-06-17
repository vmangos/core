#ifndef _HEADER_CHEATS
#define _HEADER_CHEATS

#include <array>

#include "Common.h"
#include "Player.h"
#include "Anticheat.h"

enum CheatType
{
    CHEAT_TYPE_WATER_WALK,
    CHEAT_TYPE_FORBIDDEN,
    CHEAT_TYPE_MULTIJUMP,
    CHEAT_TYPE_PVE_FLYHACK,
    CHEAT_TYPE_TIME_BACK,
    CHEAT_TYPE_OVERSPEED_JUMP,
    CHEAT_TYPE_JUMP_SPEED_CHANGE,
    CHEAT_TYPE_FLY_HACK_SWIM,
    CHEAT_TYPE_NULL_CLIENT_TIME,
    CHEAT_TYPE_ROOT_MOVE,
    CHEAT_TYPE_OVERSPEED_DIST,
    CHEAT_TYPE_DESYNC,
    CHEAT_TYPE_EXPLORE,
    CHEAT_TYPE_EXPLORE_HIGH_LEVEL,
    CHEAT_TYPE_OVERSPEED_Z,
    CHEAT_TYPE_SKIPPED_HEARTBEATS,
    CHEAT_TYPE_NUM_DESYNC,
    CHEAT_TYPE_FAKE_TRANSPORT,
    CHEAT_TYPE_TELE_TO_TRANSPORT,
    CHEAT_TYPE_SLOW_FALL,
    CHEAT_TYPE_FIXED_Z,
    CHEAT_TYPE_WRONG_ACK_DATA,
    CHEAT_TYPE_PENDING_ACK_DELAY,
    CHEATS_COUNT
};

#define CHEATS_UPDATE_INTERVAL      4000
const char* GetMovementCheatName(CheatType type);

class ChatHandler;
class WorldSession;
class WorldPacket;

class MovementCheatData: public MovementAnticheatInterface
{
    public:
        explicit MovementCheatData(Player* _me) : me(_me), m_session(_me->GetSession()) {}

        void Init() override;
        void InitNewPlayer(Player* pPlayer) override;
        void InitSpeeds(Unit* unit) override;

        void AddCheats(uint32 cheats, uint32 count = 1) override;
        void StoreCheat(uint32 type, uint32 count = 1);
        uint32 ComputeCheatAction(std::stringstream& reason) const;

        void OnUnreachable(Unit* attacker) override;
        void OnExplore(AreaEntry const* pArea) override;
        void OnTransport(Player* plMover, ObjectGuid transportGuid) override;

        void HandleCommand(ChatHandler* handler) const override;
        uint32 Update(uint32 diff, std::stringstream& reason) override;
        uint32 Finalize(std::stringstream& reason) override;
        bool HandleAnticheatTests(Player* pPlayer, MovementInfo& movementInfo, uint16 opcode) override;
        bool HandleSpeedChangeAck(Unit* pMover, MovementInfo& movementInfo, float speedReceived, uint32 movementCounter, UnitMoveType moveType, PlayerMovementPendingChange const& pendingChange, uint16 opcode) override;
        bool HandleMovementFlagChangeAck(Unit* pMover, MovementInfo& movementInfo, uint32 movementCounter, bool applyReceived, MovementChangeType changeTypeReceived, PlayerMovementPendingChange const& pendingChange) override;
        bool HandleKnockbackAck(Unit* pMover, MovementInfo& movementInfo, uint32 movementCounter, PlayerMovementPendingChange const& pendingChange) override;
        bool HandleRootUnrootAck(Unit* pMover, MovementInfo& movementInfo, uint32 movementCounter, bool applyReceived, PlayerMovementPendingChange const& pendingChange) override;
        bool IsTeleportAllowed(MovementInfo const& movementInfo, float& distance);
        bool CheckTeleport(Player* pPlayer, MovementInfo& movementInfo, uint32 opcode) override;
        void CheckMovementFlags(Player* pPlayer, MovementInfo& movementInfo) override;
        bool CheckForbiddenArea(MovementInfo& movementInfo) const;
        void CheckPendingMovementAcks();
        bool InterpolateMovement(MovementInfo const& mi, uint32 diffMs, float &x, float &y, float &z, float &o) override;
        bool GetMaxAllowedDist(MovementInfo const& mi, uint32 diffMs, float &dxy, float &dz);

        MovementInfo& GetLastMovementInfo();
        bool IsInKnockBack() const override { return m_knockBack; }
        void KnockBack(float speedxy, float speedz, float cos, float sin) override;
        float GetClientSpeed(UnitMoveType m) const { return m_clientSpeeds[m]; }

        uint32 updateCheckTimer = 0;
        uint32 cheatOccuranceTick[CHEATS_COUNT];    // per anticheat tick (not world/map tick)
        uint32 cheatOccuranceTotal[CHEATS_COUNT];

        bool m_knockBack = false;
        uint32 m_jumpCount = 0;
        int32 m_clientDesync = 0;
        uint32 m_maxClientDesync = 0;
        float m_jumpInitialSpeed = 0.0f;
        float m_overspeedDistance = 0.0f;
        float m_maxOverspeedDistance = 0.0f;
        std::array<float, MAX_MOVE_TYPE> m_clientSpeeds = {};
        Player* me;      
        WorldSession* m_session;
};

#endif
