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
