#include "BattleBotAI.h"
#include "BattleBotWaypoints.h"
#include "Player.h"
#include "Log.h"
#include "MotionMaster.h"
#include "ObjectMgr.h"
#include "PlayerBotMgr.h"
#include "WorldPacket.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "Chat.h"
#include "Battlegrounds/BattleGround.h"
#include "BattleGroundWS.h"
#include <random>

std::vector<RecordedMovementPacket> vAllianceGraveyardJumpPath =
{
    { MSG_MOVE_START_FORWARD, 0, 1, 1415.33f, 1554.79f, 343.156f, 2.34205f },
    { MSG_MOVE_START_TURN_LEFT, 187, 17, 1414.42f, 1555.73f, 343.121f, 2.34205f },
    { MSG_MOVE_HEARTBEAT, 500, 17, 1411.19f, 1556.42f, 343.355f, 3.52015f },
    { MSG_MOVE_STOP_TURN, 124, 1, 1410.44f, 1555.99f, 343.451f, 3.81232f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1407.7f, 1553.81f, 343.604f, 3.81232f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1404.96f, 1551.63f, 343.158f, 3.81232f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1402.22f, 1549.46f, 340.935f, 3.81232f },
    { MSG_MOVE_HEARTBEAT, 500, 8193, 1399.47f, 1547.28f, 338.344f, 3.81232f },
    { MSG_MOVE_HEARTBEAT, 500, 24577, 1396.73f, 1545.11f, 333.791f, 3.81232f },
    { MSG_MOVE_FALL_LAND, 402, 1, 1394.27f, 1543.15f, 326.633f, 3.81232f },
    { MSG_MOVE_HEARTBEAT, 500, 8193, 1391.53f, 1540.97f, 324.186f, 3.81232f },
    { MSG_MOVE_FALL_LAND, 197, 1, 1390.44f, 1540.12f, 321.966f, 3.81232f },
    { MSG_MOVE_STOP, 473, 0, 1387.85f, 1538.06f, 321.855f, 3.81232f },
};

std::vector<RecordedMovementPacket> vHordeGraveyardJumpPath =
{
    { MSG_MOVE_START_FORWARD, 0, 1, 1029.14f, 1387.49f, 340.836f, 6.23605f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1032.64f, 1387.33f, 340.57f, 6.23605f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1036.13f, 1387.16f, 340.638f, 6.23605f },
    { MSG_MOVE_START_TURN_LEFT, 154, 17, 1037.21f, 1387.11f, 340.699f, 6.23605f },
    { MSG_MOVE_STOP_TURN, 63, 1, 1037.65f, 1387.12f, 340.705f, 0.101309f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1041.13f, 1387.48f, 340.679f, 0.101309f },
    { MSG_MOVE_START_TURN_LEFT, 311, 17, 1043.3f, 1387.7f, 340.672f, 0.101309f },
    { MSG_MOVE_STOP_TURN, 93, 1, 1043.93f, 1387.83f, 340.67f, 0.320435f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1047.25f, 1388.93f, 340.558f, 0.320435f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1050.58f, 1390.04f, 340.305f, 0.320435f },
    { MSG_MOVE_START_TURN_LEFT, 451, 17, 1053.57f, 1391.03f, 340.038f, 0.320435f },
    { MSG_MOVE_STOP_TURN, 31, 1, 1053.78f, 1391.11f, 340.02f, 0.393477f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1057.01f, 1392.45f, 339.548f, 0.393477f },
    { MSG_MOVE_HEARTBEAT, 500, 8193, 1060.24f, 1393.79f, 337.843f, 0.393477f },
    { MSG_MOVE_HEARTBEAT, 500, 24577, 1063.47f, 1395.13f, 333.618f, 0.393477f },
    { MSG_MOVE_FALL_LAND, 497, 1, 1066.69f, 1396.47f, 324.635f, 0.393477f },
    { MSG_MOVE_START_TURN_LEFT, 297, 17, 1068.61f, 1397.26f, 324.331f, 0.393477f },
    { MSG_MOVE_STOP_TURN, 47, 1, 1068.9f, 1397.41f, 324.296f, 0.504218f },
    { MSG_MOVE_HEARTBEAT, 500, 1, 1071.97f, 1399.1f, 323.823f, 0.504218f },
    { MSG_MOVE_START_TURN_RIGHT, 124, 33, 1072.73f, 1399.52f, 323.799f, 0.504218f },
    { MSG_MOVE_STOP_TURN, 124, 1, 1073.54f, 1399.82f, 323.78f, 0.21205f },
    { MSG_MOVE_START_TURN_RIGHT, 219, 33, 1075.04f, 1400.14f, 323.761f, 0.21205f },
    { MSG_MOVE_STOP_TURN, 78, 1, 1075.58f, 1400.21f, 323.651f, 0.0282667f },
    { MSG_MOVE_STOP, 327, 0, 1077.87f, 1400.27f, 323.154f, 0.0282667f },
};

void BattleBotWaypoints::WaypointAI(Player* me)
{
    if (m_setWaypoint)
        return;

    if (!m_reachedWaypoint)
        return;

    ReachedWaypoint(me);
    GetBattleGround(me);
};

void BattleBotWaypoints::GetBattleGround(Player* me)
{
    BattleGround* bg = me->GetBattleGround();
    if (!bg)
        return;

    switch (me->GetMapId())
    {
        // Warsong Gulch
        case WS_MAP:
        {
            WarsongGulchAI(me, bg);
            break;
        }
        // Arathi Basin
        case AB_MAP:
        {
            ArathiBasinAI(me, bg);
            break;
        }
        // Alterac Valley
        case AV_MAP:
        {
            AlteracValleyAI(me, bg);
            break;
        }
        default:
            break;
    }
}

void BattleBotWaypoints::WarsongGulchAI(Player* me, BattleGround* bg)
{
    // Waiting to start bg
    if (bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (me->GetTeam() == ALLIANCE)
            SetNextWaypoint(me, WS_WAITING_POS_ALLIANCE.x, WS_WAITING_POS_ALLIANCE.y, WS_WAITING_POS_ALLIANCE.z);

        if (me->GetTeam() == HORDE)
            SetNextWaypoint(me, WS_WAITING_POS_HORDE.x, WS_WAITING_POS_HORDE.y, WS_WAITING_POS_HORDE.z);
    }

    // When bg is in progress
    if (bg->GetStatus() == STATUS_IN_PROGRESS)
    {
        if (((BattleGroundWS*)bg)->IsHordeFlagPickedup() || ((BattleGroundWS*)bg)->IsAllianceFlagPickedup())
        {
            SetWarsongObjective(me, bg, WarsongObjectives::WS_FLAG_CARRIER);
        }
        else
        {
            if (m_objective == WarsongObjectives::WS_IDLE)
            {
                int rnd = urand(0, 0);
                switch (rnd)
                {
                case 0:
                {
                    SetWarsongObjective(me, bg, WarsongObjectives::WS_FLAG);
                    break;
                }
                case 1:
                {
                    SetWarsongObjective(me, bg, WarsongObjectives::WS_POWERUP);
                    break;
                }
                case 2:
                {
                    SetWarsongObjective(me, bg, WarsongObjectives::WS_ROAM);
                    break;
                }
                }
            }
        }
    }
}

void BattleBotWaypoints::SetWarsongObjective(Player* me, BattleGround* bg, WarsongObjectives objective)
{
    if (objective == WarsongObjectives::WS_OBJECTIVE_INVALID)
        return;

    m_objective = objective;

    switch (objective)
    {
        case WarsongObjectives::WS_FLAG_CARRIER:
        {
            // Find flag carrier
            Map* pMap = me->GetMap();

            if (!pMap)
                return;

            Map::PlayerList const& PlayerList = pMap->GetPlayers();

            for (const auto& itr : PlayerList)
            {
                Player* pPlayer = itr.getSource();
                if (pPlayer->GetTeam() != me->GetTeam()) // Attack enemy flag carrier
                {
                    if (pPlayer->HasAura(WS_SPELL_WARSONG_FLAG) || pPlayer->HasAura(WS_SPELL_SILVERWING_FLAG))
                    {
                        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == FOLLOW_MOTION_TYPE)
                            me->GetMotionMaster()->MoveChase(pPlayer, 1.0f);

                        me->Attack(pPlayer, true);
                    }
                }
                else // Help team flag carrier
                {
                    if (pPlayer->HasAura(WS_SPELL_WARSONG_FLAG) || pPlayer->HasAura(WS_SPELL_SILVERWING_FLAG))
                    {
                        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == FOLLOW_MOTION_TYPE)
                            me->GetMotionMaster()->MoveChase(pPlayer, frand(1.0f, 5.0f));
                    }
                }
            }
            break;
        }
        case WarsongObjectives::WS_FLAG:
        {
            if (me->GetTeam() == ALLIANCE)
                SetNextWaypoint(me, WS_FLAG_POS_HORDE.x, WS_FLAG_POS_HORDE.y, WS_FLAG_POS_HORDE.z);

            if (me->GetTeam() == HORDE)
                SetNextWaypoint(me, WS_FLAG_POS_ALLIANCE.x, WS_FLAG_POS_ALLIANCE.y, WS_FLAG_POS_ALLIANCE.z);

            break;
        }
        case WarsongObjectives::WS_POWERUP:
        {
            //SetNextWaypoint(me, WS_FLAG_POS_ALLIANCE.x, WS_FLAG_POS_ALLIANCE.y, WS_FLAG_POS_ALLIANCE.z);
            break;
        }
        case WarsongObjectives::WS_ROAM:
        {

            break;
        }
        default:
            break;
    }
}

void BattleBotWaypoints::ArathiBasinAI(Player* me, BattleGround* bg)
{
    if (bg->GetStatus() == STATUS_WAIT_JOIN)
    {

    }
    if (bg->GetStatus() == STATUS_IN_PROGRESS)
    {

    }
}

void BattleBotWaypoints::AlteracValleyAI(Player* me, BattleGround* bg)
{
    if (bg->GetStatus() == STATUS_WAIT_JOIN)
    {

    }
    if (bg->GetStatus() == STATUS_IN_PROGRESS)
    {

    }
}

void BattleBotWaypoints::SetNextWaypoint(Player* me, float waypoint_x, float waypoint_y, float waypoint_z)
{
    if (!m_setWaypoint && m_reachedWaypoint)
    {
        currentWaypointX = waypoint_x;
        currentWaypointY = waypoint_y;
        currentWaypointZ = waypoint_z;
        m_setWaypoint = true;
        m_reachedWaypoint = false;
        StartMove(me, waypoint_x, waypoint_y, waypoint_z);
    }
}

void BattleBotWaypoints::StartMove(Player* me, float waypoint_x, float waypoint_y, float waypoint_z)
{
    if (me->IsMoving())
        return;

    me->StopMoving();
    me->GetMotionMaster()->MovementExpired();
    me->GetMotionMaster()->Clear();
    me->GetMotionMaster()->MovePoint(0, waypoint_x, waypoint_y, waypoint_z, MOVE_PATHFINDING);
}

bool BattleBotWaypoints::ReachedWaypoint(Player* me)
{
    if (!me->IsMoving())
        return false;

    if (2 > sqrt(((me->GetPositionX() - currentWaypointX) * (me->GetPositionX() - currentWaypointX)) + ((me->GetPositionY() - currentWaypointY) * (me->GetPositionY() - currentWaypointY)) + ((me->GetPositionZ() - currentWaypointZ) * (me->GetPositionZ() - currentWaypointZ))))
    {
        currentWaypointX = 0.f;
        currentWaypointY = 0.f;
        currentWaypointZ = 0.f;
        m_setWaypoint = false;
        m_reachedWaypoint = true;
        m_objective = WarsongObjectives::WS_IDLE;
        return true;
    }
    return false;
}
