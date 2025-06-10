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

// \addtogroup realmd Realm Daemon
// @{
// \file

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "RealmList.h"
#include "ClientPatchCache.h"

#include "Config/Config.h"
#include "Log.h"
#include "Errors.h"
#include "AuthSocket.h"
#include "SystemConfig.h"
#include "revision.h"
#include "Util.h"
#include "migrations_list.h"
#include <openssl/opensslv.h>
#include <openssl/crypto.h>
#include "ArgparserForServer.h"
#include "ProxyProtocol/ProxyV2Reader.h"

#include "IO/Networking/AsyncSocketAcceptor.h"
#include "IO/Timer/AsyncSystemTimer.h"
#include "IO/Multithreading/CreateThread.h"

#ifdef ENABLE_MAILSENDER
#include "MailerService.h"
#include <curl/curl.h>
#endif

#ifdef WIN32
#include "ServiceWin32.h"

char serviceName[] = "realmd";
char serviceLongName[] = "MaNGOS realmd service";
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

bool StartDB();
void UnhookSignals();
void HookSignals();

// Global initialization
char const* g_mainLogFileName = "Realmd.log";   // Log file path for sLog
volatile bool stopEvent = false;                // Setting it to true stops the server
DatabaseType LoginDatabase;                     // Accessor to the realm server database

// Launch the realm server
extern int main(int argc, char** argv)
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
        args.configFilePath = _REALMD_CONFIG;

    if (!sConfig.LoadFromFile(args.configFilePath)) // must be done before (linux) service init
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Could not find or parse configuration file %s", args.configFilePath.c_str());
        Log::WaitBeforeContinueIfNeed();
        return EXIT_FAILURE;
    }

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

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Core revision: %s [realm-daemon]", _FULLVERSION);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "<Ctrl-C> to stop.\n");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Using configuration file %s.", sConfig.GetFilename().c_str());

    // Check the version of the configuration file
    uint32 confVersion = sConfig.GetIntDefault("ConfVersion", 0);
    if (confVersion < _REALMDCONFVERSION)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "*****************************************************************************");
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, " WARNING: Your realmd.conf version indicates your conf file is out of date!  ");
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "          Please check for updates, as your current default values may cause ");
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "          strange behavior.                                                  ");
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "*****************************************************************************");
        Log::WaitBeforeContinueIfNeed();
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "%s (Library: %s)", OPENSSL_VERSION_TEXT, SSLeay_version(SSLEAY_VERSION));
    if (SSLeay() < 0x009080bfL)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WARNING: Outdated version of OpenSSL lib. Logins to server may not work!");
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "WARNING: Minimal required version [OpenSSL 0.9.8k]");
    }

#ifdef ENABLE_MAILSENDER
    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Using CURL version %s", curl_version());

    // not checking the SendMail config option here to make sure config reloads will work (in the future?)
    MailerService mailer;
    MailerService::set_global_mailer(&mailer);
#endif

    // realmd PID file creation
    std::string pidfile = sConfig.GetStringDefault("PidFile", "");
    if (!pidfile.empty())
    {
        uint32 pid = CreatePIDFile(pidfile);
        if (!pid)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Cannot create PID file %s.\n", pidfile.c_str());
            Log::WaitBeforeContinueIfNeed();
            return 1;
        }

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Daemon PID: %u\n", pid);
    }

    // Initialize the database connection
    if (!StartDB())
    {
        Log::WaitBeforeContinueIfNeed();
        return 1;
    }

    // Ensure the table used for geolocking has some data in it, if enabled
    if (sConfig.GetBoolDefault("GeoLocking", false))
    {
        auto result = std::unique_ptr<QueryResult>(LoginDatabase.Query("SELECT 1 FROM `geoip` LIMIT 1"));

        if (!result)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "The geoip table cannot be empty when geolocking is enabled.");
            return 1;
        }
    }

    // Get the list of realms for the server
    sRealmList.Initialize(sConfig.GetIntDefault("RealmsStateUpdateDelay", 20));
    if (sRealmList.size() == 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "No valid realms specified.");
        Log::WaitBeforeContinueIfNeed();
        return 1;
    }
    if (ExpectedRealmdClientBuilds.size() == 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "No valid client builds specified.");
        Log::WaitBeforeContinueIfNeed();
        return 1;
    }

    (void)sRealmdPatchCache; // <-- This will initialize the singleton. Which will preload all known patches.
    (void)sAsyncSystemTimer; // <-- Pre-Initialize SystemTimer
    IO::Multithreading::RenameCurrentThread("Main");

    // cleanup query
    // set expired bans to inactive
    LoginDatabase.BeginTransaction();
    LoginDatabase.Execute("UPDATE `account_banned` SET `active` = 0 WHERE `unbandate`<=UNIX_TIMESTAMP() AND `unbandate`<>`bandate`");
    LoginDatabase.Execute("DELETE FROM `ip_banned` WHERE `unbandate`<=UNIX_TIMESTAMP() AND `unbandate`<>`bandate`");
    LoginDatabase.CommitTransaction();

    std::string bindIp = sConfig.GetStringDefault("BindIP", "0.0.0.0");
    uint16 bindPort = sConfig.GetIntDefault("RealmServerPort", DEFAULT_REALMSERVER_PORT);

    std::unique_ptr<IO::IoContext> ioCtx = IO::IoContext::CreateIoContext();
    if (ioCtx == nullptr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to create IoContext");
        Log::WaitBeforeContinueIfNeed();
        return 1;
    }

    // Launch the listening network socket
    std::unique_ptr<IO::Networking::AsyncSocketAcceptor> listener = IO::Networking::AsyncSocketAcceptor::CreateAndBindServer(ioCtx.get(), bindIp, bindPort);
    if (listener == nullptr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MaNGOS realmd can not bind to %s:%d  -  Is the port already in use?", bindIp.c_str(), bindPort);
        Log::WaitBeforeContinueIfNeed();
        return 1;
    }

    std::vector<std::string> trustedProxyIps = SplitStringByDelimiter(sConfig.GetStringDefault("TrustedProxyServers", ""), ',');

    listener->AutoAcceptSocketsUntilClose([ctx = ioCtx.get(), trustedProxyIps](IO::Networking::SocketDescriptor socketDescriptor)
    {
        // Create a socket and attach it to our global ioCtx
        auto authSocket = std::make_shared<AuthSocket>(std::move(IO::Networking::AsyncSocket(ctx, std::move(socketDescriptor))));

        if (IO::NetworkError initError = authSocket->m_socket.InitializeAndFixateMemoryLocation())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[%s] Failed to initialize AuthSocket %s", authSocket->m_socket.GetRemoteIpString().c_str(), initError.ToString().c_str());
            return; // implicit close()
        }


        // Check if the remote endpoint is actually a trusted proxy, so we can retrieve the real client ip
        if (!trustedProxyIps.empty() && std::find(trustedProxyIps.begin(), trustedProxyIps.end(), authSocket->m_socket.GetRemoteIpString()) != trustedProxyIps.end())
        {
            // parse proxy header
            ProxyProtocol::ReadProxyV2Handshake(&(authSocket->m_socket), [authSocket](nonstd::expected<IO::Networking::IpAddress, IO::NetworkError> const& maybeIp)
            {
                if (!maybeIp.has_value())
                {
                    sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[%s] Failed to parse proxy header. Error: %s", authSocket->m_socket.GetRemoteIpString().c_str(), maybeIp.error().ToString().c_str());
                    return; // implicit close()
                }
                authSocket->m_remoteIpAddressStringAfterProxy = maybeIp.value().ToString();
                sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] Connection accepted (proxy ip: %s)", authSocket->GetRemoteIpString().c_str(), authSocket->m_socket.GetRemoteIpString().c_str());
                authSocket->Start();
            });
        }
        else
        {
            // no proxy, we can start directly
            sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] Connection accepted", authSocket->GetRemoteIpString().c_str());
            authSocket->Start();
        }
    });

    // Catch termination signals
    HookSignals();

    // Handle affinity for multiple processors and process priority on Windows
#ifdef WIN32
    {
        HANDLE hProcess = ::GetCurrentProcess();

        uint32 Aff = sConfig.GetIntDefault("UseProcessors", 0);
        if (Aff > 0)
        {
            ULONG_PTR appAff;
            ULONG_PTR sysAff;

            if (::GetProcessAffinityMask(hProcess, &appAff, &sysAff))
            {
                ULONG_PTR curAff = Aff & appAff;            // remove non accessible processors

                if (!curAff)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Processors marked in UseProcessors bitmask (hex) %x not accessible for realmd. Accessible processors bitmask (hex): %x",Aff,appAff);
                }
                else
                {
                    if (::SetProcessAffinityMask(hProcess, curAff))
                        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Using processors (bitmask, hex): %x", curAff);
                    else
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't set used processors (hex): %x", curAff);
                }
            }
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        }

        bool Prio = sConfig.GetBoolDefault("ProcessPriority", false);

        // if(Prio && (m_ServiceStatus == -1)/* need set to default process priority class in service mode*/)
        if(Prio)
        {
            if (::SetPriorityClass(hProcess,HIGH_PRIORITY_CLASS))
                sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "realmd process priority class set to HIGH");
            else
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't set realmd process priority class.");
        }
    }
#endif

    //server has started up successfully => enable async DB requests
    LoginDatabase.AllowAsyncTransactions();

    // maximum counter for next ping
    uint32 numLoops = (sConfig.GetIntDefault("MaxPingTime", 30) * (MINUTE * 1000000 / 100000)); // TODO make this loop like mangosd
    uint32 loopCounter = 0;

    auto ioThread = IO::Multithreading::CreateThread("MainIoCtx", [&ioCtx]()
    {
        ioCtx->RunUntilShutdown();
    });

#ifndef WIN32
    detachDaemon();
#endif
    // Wait for termination signal
    while (!stopEvent)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));

        if ((++loopCounter) == numLoops) // TODO make this loop like mangosd
        {
            loopCounter = 0;
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Ping MySQL to keep connection alive");
            LoginDatabase.Ping();
        }

#ifdef WIN32
        if (m_ServiceStatus == 0) stopEvent = true;
        while (m_ServiceStatus == 2) Sleep(1000);
#endif
    }

    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Waiting for IO thread to finish");

    listener->ClosePortAndStopAcceptingNewConnections();
    sAsyncSystemTimer.RemoveAllTimersAndStopThread();

    ioCtx->Shutdown();
    ioThread.join();

    // Wait for the delay thread to exit
    LoginDatabase.HaltDelayThread();

    // Remove signal handling before leaving
    UnhookSignals();

    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Halting process...");
    return 0;
}

// Handle termination signals
/** Put the global variable stopEvent to 'true' if a termination signal is caught **/
void OnSignal(int s)
{
    switch (s)
    {
        case SIGINT:
        case SIGTERM:
            stopEvent = true;
            break;
#ifdef _WIN32
        case SIGBREAK:
            stopEvent = true;
            break;
#endif
    }

    ::signal(s, OnSignal);
}

// Initialize connection to the database
bool StartDB()
{
    std::string dbstring = sConfig.GetStringDefault("LoginDatabaseInfo", "");
    if (dbstring.empty())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Database not specified");
        return false;
    }

    // Remove password from DB string for log output
    // format: 127.0.0.1;3306;mangos;mangos;characters
    // In a properly formatted string, token 4 is the password
    std::string dbStringLog = dbstring;

    if (std::count(dbStringLog.begin(), dbStringLog.end(), ';') == 4)
    {
        // Have correct number of tokens, can replace
        std::string::iterator start = dbStringLog.end(), end = dbStringLog.end();

        int occurrence = 0;
        for (std::string::iterator itr = dbStringLog.begin(); itr != dbStringLog.end(); ++itr)
        {
            if (*itr == ';')
                ++occurrence;

            if (occurrence == 3 && start == dbStringLog.end())
                start = itr + 1;
            else if (occurrence == 4 && end == dbStringLog.end())
                end = itr;

            if (start != dbStringLog.end() && end != dbStringLog.end())
                break;
        }

        dbStringLog.replace(start, end, "*");
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Incorrectly formatted database connection string for logon database");
        return false;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Database: %s", dbStringLog.c_str());
    if (!LoginDatabase.Initialize(dbstring.c_str()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Cannot connect to database");
        return false;
    }

    if (!LoginDatabase.CheckRequiredMigrations(MIGRATIONS_LOGON))
    {
        // Wait for already started DB delay threads to end
        LoginDatabase.HaltDelayThread();
        return false;
    }

    return true;
}

// Define hook 'OnSignal' for all termination signals
void HookSignals()
{
    ::signal(SIGINT, OnSignal);
    ::signal(SIGTERM, OnSignal);
#ifdef _WIN32
    ::signal(SIGBREAK, OnSignal);
#endif
}

// Unhook the signals before leaving
void UnhookSignals()
{
    ::signal(SIGINT, nullptr);
    ::signal(SIGTERM, nullptr);
#ifdef _WIN32
    ::signal(SIGBREAK, nullptr);
#endif
}

// @}
