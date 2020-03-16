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
#include <random>

void BattleBotWaypoints::Think(Player* me)
{
    // Warsong Gulch
    if (me->GetMapId() == 489)
    {
        if (BattleGround* bg = me->GetBattleGround())
        {
            if (bg->GetStatus() == STATUS_WAIT_JOIN)
            {
                if (me->GetTeam() == ALLIANCE)
                {
                    me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_ALLIANCE.x, WS_WAITING_POS_ALLIANCE.y, WS_WAITING_POS_ALLIANCE.z, );
                }
                if (me->GetTeam() == HORDE)
                {
                    me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_HORDE.x, WS_WAITING_POS_HORDE.y, WS_WAITING_POS_HORDE.z);
                }
            }
            if (bg->GetStatus() == STATUS_IN_PROGRESS)
            {
                if (me->GetTeam() == ALLIANCE)
                {
                    me->GetMotionMaster()->MovePoint(0, WS_FLAG_POS_HORDE.x, WS_FLAG_POS_HORDE.y, WS_FLAG_POS_HORDE.z);
                }
                if (me->GetTeam() == HORDE)
                {
                    me->GetMotionMaster()->MovePoint(0, WS_FLAG_POS_ALLIANCE.x, WS_FLAG_POS_ALLIANCE.y, WS_FLAG_POS_ALLIANCE.z);
                }
            }
        }
    }

    // Arathi Basin
    if (me->GetMapId() == 529)
    {
        if (BattleGround* bg = me->GetBattleGround())
        {
            if (bg->GetStatus() == STATUS_WAIT_JOIN)
            {
                if (me->GetTeam() == ALLIANCE)
                {

                }
                if (me->GetTeam() == HORDE)
                {

                }
            }
            if (bg->GetStatus() == STATUS_IN_PROGRESS)
            {

            }
        }
    }

    // alterac valley
    if (me->GetMapId() == 30)
    {
        if (BattleGround* bg = me->GetBattleGround())
        {
            if (bg->GetStatus() == STATUS_WAIT_JOIN)
            {
                if (me->GetTeam() == ALLIANCE)
                {

                }
                if (me->GetTeam() == HORDE)
                {

                }
            }
            if (bg->GetStatus() == STATUS_IN_PROGRESS)
            {

            }
        }
    }
};