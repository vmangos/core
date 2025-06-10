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

// \addtogroup mangosd Mangos Daemon
// @{
// \file

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Config/Config.h"
#include "ProgressBar.h"
#include "Log.h"
#include "Master.h"
#include "SystemConfig.h"
#include "revision.h"
#include <openssl/opensslv.h>
#include <openssl/crypto.h>
#include "ArgparserForServer.h"

#ifdef WIN32
#include "ServiceWin32.h"
char serviceName[] = "mangosd";
char serviceLongName[] = "MaNGOS world service";
char serviceDescription[] = "Massive Network Game Object Server";
/*
 * -1 - not in service mode
 *  0 - stopped
 *  1 - running
 *  2 - paused
 */
volatile int m_ServiceStatus = -1;
#else
#include "PosixDaemon.h"
#endif

DatabaseType WorldDatabase;                                 // Accessor to the world database
DatabaseType CharacterDatabase;                             // Accessor to the character database
DatabaseType LoginDatabase;                                 // Accessor to the realm/login database
DatabaseType LogsDatabase;                                  // Accessor to the logs database

uint32 realmID;                                             // Id of the realm
std::string realmName;                                      // Name of the realm

char const* g_mainLogFileName = "Server.log";

// Launch the mangos server
extern int main(int argc, char **argv)
{
    ServerStartupArguments args;
    {
        // parseResult is std::expected, where the error is the return code, that might be present when invalid args or "--help" is given
        auto parseResult = ParseServerStartupArguments(argc, argv);
        if (!parseResult)
            return parseResult.error();

        args = parseResult.value();
    }

    if (args.configFilePath.empty())
        args.configFilePath = _MANGOSD_CONFIG;

    if (!sConfig.LoadFromFile(args.configFilePath)) // must be done before (linux) service init
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Could not find or parse configuration file %s", args.configFilePath.c_str());
        Log::WaitBeforeContinueIfNeed();
        return EXIT_FAILURE;
    }

    sLog.OpenWorldLogFiles();

    switch (args.inputServiceMode)
    {
        case ServiceDaemonAction::NotSet:
            break;
#ifdef WIN32
            // windows service command need execute before config read
        case ServiceDaemonAction::Install:
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Installing service...");
            return WinServiceInstall() ? EXIT_SUCCESS : EXIT_FAILURE;
        case ServiceDaemonAction::Uninstall:
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Uninstalling service...");
            return WinServiceUninstall() ? EXIT_SUCCESS : EXIT_FAILURE;
        case ServiceDaemonAction::Start:
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting service...");
            return WinServiceRun() ? EXIT_SUCCESS : EXIT_FAILURE;
#else
            // posix daemon commands need apply after config read
    case ServiceDaemonAction::Start:
        startDaemon();
        break;
    case ServiceDaemonAction::Stop:
        stopDaemon();
        break;
#endif
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Core revision: %s [world-daemon]", _FULLVERSION);
    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "<Ctrl-C> to stop." );
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "\n\n"
        "MM     MM MM   MM         MM   MM  MMMMM   MMMMM   MMMMM\n"
        "MM     MM MM   MM         MM   MM MMM MMM MM   MM MMM MMM\n"
        " MM   MM  MMM MMM         MMM  MM MMM MMM MM   MM MMM\n"
        " MM   MM  MM M MM  MMMMM  MMMM MM MMM     MM   MM  MMM\n"
        "  MM MM   MM M MM M   MMM MM MMMM MMM     MM   MM   MMM\n"
        "  MM MM   MM M MM     MMM MM  MMM MMMMMMM MM   MM    MMM\n"
        "   MMM    MM   MM MMMMMMM MM   MM MM  MMM MM   MM     MMM\n"
        "   MMM    MM   MM MM  MMM MM   MM MMM MMM MM   MM MMM MMM\n"
        "    M     MM   MM MM  MMM MM   MM  MMMMMM  MMMMM   MMMMM\n"
        "                  MMMMMM\n"
        "                          https://github.com/vmangos\n\n");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Using configuration file %s", sConfig.GetFilename().c_str());
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Core Revision: " _FULLVERSION);
    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "%s (Library: %s)", OPENSSL_VERSION_TEXT, SSLeay_version(SSLEAY_VERSION));
    if (SSLeay() < 0x009080bfL )
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WARNING: Outdated version of OpenSSL lib. Logins to server may not work!");
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WARNING: Minimal required version [OpenSSL 0.9.8k]");
    }

    // Set progress bars show mode
    BarGoLink::SetOutputState(sConfig.GetBoolDefault("ShowProgressBars", true));

    // and run the 'Master'
    // TODO: Why do we need this 'Master'? Can't all of this be in the Main as for Realmd?
    return sMaster.Run();

    // at sMaster return function exist with codes
    // 0 - normal shutdown
    // 1 - shutdown at error
    // 2 - restart command used, this code can be used by restarter for restart mangosd
}

// @}
