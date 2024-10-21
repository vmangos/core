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

/** \file
    \ingroup mangosd
*/

#include "WorldSocketMgr.h"
#include "Common.h"
#include "World.h"
#include "WorldRunnable.h"
#include "Timer.h"
#include "ObjectAccessor.h"
#include "MapManager.h"
#include "BattleGroundMgr.h"
#include "Master.h"
#include "TimePeriod.h"

#include "Database/DatabaseEnv.h"

// Target server framerate is 1000/WORLD_SLEEP_CONST
#define WORLD_SLEEP_CONST 50

#ifdef WIN32
#include "ServiceWin32.h"
extern int m_ServiceStatus;
#endif

// Heartbeat for the World
void WorldRunnable::operator()()
{
    // Init new SQL thread for the world database
    WorldDatabase.ThreadStart();                                // let thread do safe mySQL requests (one connection call enough)
    sWorld.InitResultQueue();

    Master::ArmAnticrash();
    uint32 anticrashRearmTimer = 0;

    // Set the platform's timer period
    const auto scoped_tp = set_time_period(std::chrono::milliseconds(1));

    // Aim for WORLD_SLEEP_CONST update times
    // If we update slower, update again immediately.
    // If we update faster, then slow down!
    auto prevTime = WorldTimer::getMSTime();
    uint32 currTime = 0u;

    // While we have not World::m_stopEvent, update the world
    while (!World::IsStopped())
    {
        ++World::m_worldLoopCounter;

        currTime = WorldTimer::getMSTime();
        auto diff = WorldTimer::getMSTimeDiff(prevTime, currTime);

        if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_WORLD_UPDATE) && diff > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_WORLD_UPDATE))
            sLog.Out(LOG_PERFORMANCE, LOG_LVL_MINIMAL, "Slow world update: %ums", diff);

        // ANTICRASH
        if (sWorld.GetAnticrashRearmTimer())
        {
            anticrashRearmTimer = sWorld.GetAnticrashRearmTimer();
            sWorld.SetAnticrashRearmTimer(0);
        }
        if (anticrashRearmTimer)
        {
            if (anticrashRearmTimer <= diff)
            {
                anticrashRearmTimer = 0;
                Master::ArmAnticrash();
                sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Anticrash rearmed");
            }
            else
                anticrashRearmTimer -= diff;
        }

        sWorld.Update(diff);

        // diff is the actual time since last tick
        // updateTime is the actual time taken to update this round
        // aim for WORLD_SLEEP_CONST tickrate

        // Update at the target 1000/WORLD_SLEEP_CONST framerate
        // Previous implementation attempted to smooth diffs out, but did not
        // account properly for the spikes which using a constant causes.
        // If a smoothing filter is desired, consider a moving average
        // or other simple filter.
        auto updateTime = WorldTimer::getMSTimeDiffToNow(currTime);
        prevTime = currTime;

        if (updateTime < WORLD_SLEEP_CONST)
            std::this_thread::sleep_for(std::chrono::milliseconds(WORLD_SLEEP_CONST - updateTime));

        #ifdef WIN32
            if (m_ServiceStatus == 0) World::StopNow(SHUTDOWN_EXIT_CODE);
            while (m_ServiceStatus == 2) Sleep(1000);
        #endif
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Shutting down world...");
    sWorld.Shutdown();

    // unload battleground templates before different singletons destroyed
    sBattleGroundMgr.DeleteAllBattleGrounds();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Stopping network threads...");
    sWorldSocketMgr->StopNetwork();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Unloading all maps...");
    sMapMgr.UnloadAll();                                    // unload all grids (including locked in memory)

    // End the database thread
    WorldDatabase.ThreadEnd();                              // free mySQL thread resources
}
