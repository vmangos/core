#ifndef MANGOS_BattleBotWaypoints_H
#define MANGOS_BattleBotWaypoints_H

#include "SharedDefines.h"

struct RecordedMovementPacket
{
    RecordedMovementPacket(uint16 opcode_, uint32 timeDiff_, uint32 moveFlags_, float x, float y, float z, float o) :
        opcode(opcode_), timeDiff(timeDiff_), moveFlags(moveFlags_), position(x, y, z, o) {};
    uint16 opcode = 0;
    uint32 timeDiff = 0;
    uint32 moveFlags = 0;
    Position position;
};

extern std::vector<RecordedMovementPacket> vAllianceGraveyardJumpPath;
extern std::vector<RecordedMovementPacket> vHordeGraveyardJumpPath;

Position const WS_WAITING_POS_HORDE_1 = { 944.981f, 1423.478f, 345.434f, 6.18f };
Position const WS_WAITING_POS_HORDE_2 = { 948.488f, 1459.834f, 343.066f, 6.27f };
Position const WS_WAITING_POS_ALLIANCE_1 = { 1510.502f, 1493.385f, 351.995f, 3.1f };
Position const WS_WAITING_POS_ALLIANCE_2 = { 1496.578f, 1457.900f, 344.442f, 3.1f };
Position const WS_FLAG_POS_HORDE = { 915.958f, 1433.925f, 346.193f, 0.0f };
Position const WS_FLAG_POS_ALLIANCE = { 1539.219f, 1481.747f, 352.458f, 0.0f };
Position const AB_WAITING_POS_HORDE = { 706.607f, 707.211f, -17.271f, 0.77f };
Position const AB_WAITING_POS_ALLIANCE = { 1286.054f, 1282.500f, -15.697f, 3.95f };
Position const AV_WAITING_POS_HORDE = { -871.196f, -558.407f, 57.239f, 2.14f };
Position const AV_WAITING_POS_ALLIANCE = { 793.627f, -493.814f, 99.689f, 3.09f };

class BattleBotAI;
typedef void(*BattleBotWaypointFunc) (BattleBotAI* pAI);

struct BattleBotWaypoint
{
    BattleBotWaypoint(float x_, float y_, float z_, BattleBotWaypointFunc func) :
        x(x_), y(y_), z(z_), pFunc(func) {};
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    BattleBotWaypointFunc pFunc = nullptr;
};

typedef std::vector<BattleBotWaypoint> BattleBotPath;

extern std::vector<BattleBotPath*> const vPaths_WS;
extern std::vector<BattleBotPath*> const vPaths_AB;
extern std::vector<BattleBotPath*> const vPaths_AV;

#endif
