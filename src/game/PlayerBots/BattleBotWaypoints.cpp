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