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

#include <memory>

#include "Common.h"
#include "Master.h"
#include "WorldSocket.h"
#include "WorldRunnable.h"
#include "World.h"
#include "Log.h"
#include "Timer.h"
#include "Policies/SingletonImp.h"
#include "SystemConfig.h"
#include "Config/Config.h"
#include "Database/DatabaseEnv.h"
#include "CliRunnable.h"
#include "remote/RemoteAccess/RASocket.h"
#include "remote/soap/MaNGOSsoap.h"
#include "Util.h"
#include "MassMailMgr.h"
#include "DBCStores.h"
#include "WorldSocketMgr.h"
#include "IO/Context/IoContext.h"
#include "IO/Multithreading/CreateThread.h"
#include "IO/Networking/AsyncSocketAcceptor.h"
#include "IO/Timer/AsyncSystemTimer.h"

#include "revision.h"
#include "migrations_list.h"

#ifndef WIN32
#include "PosixDaemon.h"
#endif
#include <signal.h>

#ifdef WIN32
#include "ServiceWin32.h"
extern volatile int m_ServiceStatus;
#endif

INSTANTIATE_SINGLETON_1(Master);

volatile uint32 Master::m_masterLoopCounter = 0;
volatile bool Master::m_handleSigvSignals = false;

void freezeDetector(uint32 _delaytime)
{
    if (!_delaytime)
        return;
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting up anti-freeze thread (%u seconds max stuck time)...", _delaytime / 1000);
    uint32 loops = 0;
    uint32 lastchange = 0;
    while (!World::IsStopped())
    {
        std::this_thread::sleep_for(std::chrono::seconds(1));

        uint32 curtime = WorldTimer::getMSTime();
        //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "anti-freeze: time=%u, counters=[%u; %u]",curtime,Master::m_masterLoopCounter,World::m_worldLoopCounter);

        // normal work
        if (loops != World::m_worldLoopCounter)
        {
            lastchange = curtime;
            loops = World::m_worldLoopCounter;
        }
        // possible freeze
#ifdef NDEBUG
        else if (WorldTimer::getMSTimeDiff(lastchange, curtime) > _delaytime)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "World Thread hangs, kicking out server!");
            std::terminate();              // bang crash
        }
#endif
    }
    // Fix crash au shutdown du serv. sLog n'existe plus ici.
    //sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Anti-freeze thread exiting without problems.");
}

std::unique_ptr<IO::Networking::AsyncSocketAcceptor> SetupRemoteAccessServer(IO::IoContext* ioCtx)
{
    std::string raBindIp = sConfig.GetStringDefault("Ra.IP", "0.0.0.0");
    uint16 raBindPort = sConfig.GetIntDefault("Ra.Port", 3443);

    std::unique_ptr<IO::Networking::AsyncSocketAcceptor> raServer = IO::Networking::AsyncSocketAcceptor::CreateAndBindServer(ioCtx, raBindIp, raBindPort);
    if (!raServer)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MaNGOS RA can not bind to port %d on %s", raBindPort, raBindIp.c_str());
        return nullptr;
    }
    raServer->AutoAcceptSocketsUntilClose([ioCtx](IO::Networking::SocketDescriptor socketDescriptor)
    {
        // Create a socket and attach it to our global ioCtx
        std::make_shared<RASocket>(std::move(IO::Networking::AsyncSocket(ioCtx, std::move(socketDescriptor))))->Start();
    });
    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Starting Remote access listener on %s:%d", raBindIp.c_str(), raBindPort);

    return raServer;
}

Master::Master()
{
}

Master::~Master()
{
}

// Main function
int Master::Run()
{
    // worldd PID file creation
    std::string pidFilePath = sConfig.GetStringDefault("PidFile", "");
    if (!pidFilePath.empty())
    {
        uint32 pid = CreatePIDFile(pidFilePath);
        if (!pid)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Cannot create PID file %s.\n", pidFilePath.c_str());
            Log::WaitBeforeContinueIfNeed();
            return 1;
        }

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Daemon PID: %u\n", pid);
    }

    // Start the databases
    if (!_StartDB())
    {
        Log::WaitBeforeContinueIfNeed();
        return 1;
    }

    std::unique_ptr<IO::IoContext> ioCtxUniquePtr = IO::IoContext::CreateIoContext();
    IO::IoContext* ioCtx = ioCtxUniquePtr.get();
    std::vector<std::thread> ioCtxRunners;
    int ioNetworkThreadCount = sConfig.GetIntDefault("Network.Threads", 1);
    if (ioNetworkThreadCount <= 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Config 'Network.Threads' must be greater than 0");
        World::StopNow(ERROR_EXIT_CODE);
        return 1;
    }
    for (int32 i = 0; i < ioNetworkThreadCount; ++i)
    {
        ioCtxRunners.emplace_back(IO::Multithreading::CreateThread("IO[" + std::to_string(i) + "]", [ioCtx]()
        {
            ioCtx->RunUntilShutdown();
        }));
    }

    // Initialize the World
    sWorld.SetInitialWorldSettings();

#ifndef WIN32
    detachDaemon();
#endif
    // server loaded successfully => enable async DB requests
    // this is done to forbid any async transactions during server startup!
    CharacterDatabase.AllowAsyncTransactions();
    WorldDatabase.AllowAsyncTransactions();
    LoginDatabase.AllowAsyncTransactions();
    LogsDatabase.AllowAsyncTransactions();

    // Catch termination signals
    _HookSignals();

    // Launch WorldRunnable thread
    std::thread world_thread = IO::Multithreading::CreateThread("WorldRunnable", WorldRunnable());
    // world_thread.setPriority(ACE_Based::Highest); // TODO

    // set realmbuilds depend on mangosd expected builds, and set server online
    {
        std::string builds = AcceptableClientBuildsListStr();
        LoginDatabase.escape_string(builds);

        LoginDatabase.PExecute("UPDATE `realmlist` SET `realmflags` = `realmflags` & ~(%u), `population` = 0, `realmbuilds` = '%s'  WHERE `id` = '%u'", REALM_FLAG_OFFLINE, builds.c_str(), realmID);
    }

    std::unique_ptr<std::thread> cliThread = nullptr;

#ifdef WIN32
    if (sConfig.GetBoolDefault("Console.Enable", true) && (m_ServiceStatus == -1)/* need disable console in service mode*/)
#else
    if (sConfig.GetBoolDefault("Console.Enable", true))
#endif
    {
        // Launch CliRunnable thread
        cliThread = IO::Multithreading::CreateThreadPtr("CLI", CliRunnable());
    }

    std::unique_ptr<IO::Networking::AsyncSocketAcceptor> remoteAccessServer = nullptr;
    if (sConfig.GetBoolDefault("Ra.Enable", false))
        remoteAccessServer = SetupRemoteAccessServer(ioCtx);

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
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Processors marked in UseProcessors bitmask (hex) %x not accessible for mangosd. Accessible processors bitmask (hex): %x",Aff,appAff);
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
                sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "mangosd process priority class set to HIGH");
            else
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't set mangosd process priority class.");
        }
    }
#endif

    (void)sAsyncSystemTimer; // <-- Pre-Initialize SystemTimer
    IO::Multithreading::RenameCurrentThread("Main");

    // Start soap serving thread
    std::unique_ptr<std::thread> soap_thread = nullptr;

    if (sConfig.GetBoolDefault("SOAP.Enabled", false))
    {
        std::string soapBindIp = sConfig.GetStringDefault("SOAP.IP", "127.0.0.1");
        uint16 soapBindPort = sConfig.GetIntDefault("SOAP.Port", 7878);
        soap_thread = StartSoapThread(soapBindIp, soapBindPort);
    }

    // Start up freeze catcher thread
    std::unique_ptr<std::thread> freeze_thread = nullptr;
    if (uint32 freeze_delay = sConfig.GetIntDefault("MaxCoreStuckTime", 0))
    {
        freeze_thread = IO::Multithreading::CreateThreadPtr("FreezeDetector", std::bind(&freezeDetector, freeze_delay * 1000));
    }

    // Launch the world listener socket
    std::string bindIp = sConfig.GetStringDefault("BindIP", "0.0.0.0");
    uint16 bindPort = sWorld.getConfig(CONFIG_UINT32_PORT_WORLD);
    int socketOutByteBufferSize = sConfig.GetIntDefault("Network.SystemSendBuffer", -1);
    bool doExplicitTcpNoDelay = sConfig.GetBoolDefault("Network.TcpNoDelay", true);
    std::vector<std::string> trustedProxyIps = SplitStringByDelimiter(sConfig.GetStringDefault("Network.TrustedProxyServers", ""), ',');

    WorldSocketMgrOptions socketOptions
    {
        bindIp,
        bindPort,
        socketOutByteBufferSize,
        doExplicitTcpNoDelay,
        trustedProxyIps,
    };

    if (!sWorldSocketMgr.StartWorldNetworking(ioCtx, socketOptions))
    {
        Log::WaitBeforeContinueIfNeed();
        World::StopNow(ERROR_EXIT_CODE);
    }

    world_thread.join(); // <-- This will block until the world stops

    _UnhookSignals(); // Remove signal handling before leaving

    if (freeze_thread)
        freeze_thread->join();

    if (soap_thread)
        soap_thread->join();

    // Set server offline in realmlist
    LoginDatabase.DirectPExecute("UPDATE realmlist SET realmflags = realmflags | %u WHERE id = '%u'", REALM_FLAG_OFFLINE, realmID);

    sWorldSocketMgr.StopWorldNetworking();

    if (remoteAccessServer)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Stop remote access...");
        remoteAccessServer->ClosePortAndStopAcceptingNewConnections();
        remoteAccessServer.reset();
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Stop system timers...");
    sAsyncSystemTimer.RemoveAllTimersAndStopThread();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Stop IO context...");
    ioCtx->Shutdown();
    for (std::thread& thread : ioCtxRunners)
        thread.join();

    // Clean account database before leaving
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Cleaning character database...");
    clearOnlineAccounts();

    // send all still queued mass mails (before DB connections shutdown)
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Sending queued mail...");
    sMassMailMgr.Update(true);

    // Wait for DB delay threads to end
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Closing database connections...");
    CharacterDatabase.StopServer();
    WorldDatabase.StopServer();
    LoginDatabase.StopServer();
    LogsDatabase.StopServer();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Halting process...");

    if (cliThread)
    {

#ifdef WIN32
        // this only way to terminate CLI thread exist at Win32 (alt. way exist only in Windows Vista API)
        //_exit(1);
        // send keyboard input to safely unblock the CLI thread
        INPUT_RECORD b[5];
        HANDLE hStdIn = ::GetStdHandle(STD_INPUT_HANDLE);
        b[0].EventType = KEY_EVENT;
        b[0].Event.KeyEvent.bKeyDown = TRUE;
        b[0].Event.KeyEvent.uChar.AsciiChar = 'X';
        b[0].Event.KeyEvent.wVirtualKeyCode = 'X';
        b[0].Event.KeyEvent.wRepeatCount = 1;

        b[1].EventType = KEY_EVENT;
        b[1].Event.KeyEvent.bKeyDown = FALSE;
        b[1].Event.KeyEvent.uChar.AsciiChar = 'X';
        b[1].Event.KeyEvent.wVirtualKeyCode = 'X';
        b[1].Event.KeyEvent.wRepeatCount = 1;

        b[2].EventType = KEY_EVENT;
        b[2].Event.KeyEvent.bKeyDown = TRUE;
        b[2].Event.KeyEvent.dwControlKeyState = 0;
        b[2].Event.KeyEvent.uChar.AsciiChar = '\r';
        b[2].Event.KeyEvent.wVirtualKeyCode = VK_RETURN;
        b[2].Event.KeyEvent.wRepeatCount = 1;
        b[2].Event.KeyEvent.wVirtualScanCode = 0x1c;

        b[3].EventType = KEY_EVENT;
        b[3].Event.KeyEvent.bKeyDown = FALSE;
        b[3].Event.KeyEvent.dwControlKeyState = 0;
        b[3].Event.KeyEvent.uChar.AsciiChar = '\r';
        b[3].Event.KeyEvent.wVirtualKeyCode = VK_RETURN;
        b[3].Event.KeyEvent.wVirtualScanCode = 0x1c;
        b[3].Event.KeyEvent.wRepeatCount = 1;
        DWORD numb;
        ::WriteConsoleInput(hStdIn, b, 4, &numb);
#else
        ::fclose(stdin);
#endif
        if (cliThread->joinable())
            cliThread->join();
    }

    // Exit the process with specified return value
    return World::GetExitCode();
}

bool StartDB(const std::string& name, DatabaseType& database, char const** migrations)
{
    // Get database info from configuration file
    std::string dbstring = sConfig.GetStringDefault((name + "Database.Info").c_str(), "");
    int nConnections = sConfig.GetIntDefault((name + "Database.Connections").c_str(), 1);
    int nAsyncConnections = sConfig.GetIntDefault((name + "Database.WorkerThreads").c_str(), 1);
    if (dbstring.empty())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s database not specified in configuration file", name.c_str());
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
                start = ++itr;
            else if (occurrence == 4 && end == dbStringLog.end())
                end = itr;

            if (start != dbStringLog.end() && end != dbStringLog.end())
                break;
        }

        dbStringLog.replace(start, end, "*");
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Incorrectly formatted database connection string for database %s", name.c_str());
        return false;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "%s Database: %s, sync threads: %i, workers: %i", name.c_str(), dbStringLog.c_str(), nConnections, nAsyncConnections);

    // Initialise the world database
    if (!database.Initialize(dbstring.c_str(), nConnections, nAsyncConnections))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Cannot connect to world database %s", name.c_str());
        return false;
    }

    return database.CheckRequiredMigrations(migrations);
}
// Initialize connection to the databases
bool Master::_StartDB()
{
    // Get the realm Id from the configuration file
    realmID = sConfig.GetIntDefault("RealmID", 0);
    if (!realmID)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Realm ID not defined in configuration file");
        return false;
    }

    if (!StartDB("World", WorldDatabase, MIGRATIONS_WORLD) ||
        !StartDB("Character", CharacterDatabase, MIGRATIONS_CHARACTERS) ||
        !StartDB("Login", LoginDatabase, MIGRATIONS_LOGON) ||
        !StartDB("Logs", LogsDatabase, MIGRATIONS_LOGS))
    {
        WorldDatabase.HaltDelayThread();
        CharacterDatabase.HaltDelayThread();
        LoginDatabase.HaltDelayThread();
        LogsDatabase.HaltDelayThread();
        return false;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Realm running as realm ID %d", realmID);

    // Clean the database before starting
    clearOnlineAccounts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    return true;
}

// Clear 'online' status for all accounts with characters in this realm
void Master::clearOnlineAccounts()
{
    // Cleanup online status for characters hosted at current realm
    // TODO: Only accounts with characters logged on *this* realm should have online status reset. Move the online column from 'account' to 'realmcharacters'?
    LoginDatabase.PExecute("UPDATE `account` SET `current_realm` = 0 WHERE `current_realm` = '%u'", realmID);

    CharacterDatabase.Execute("UPDATE `characters` SET `online` = 0 WHERE `online`<>0");

    // Battleground instance ids reset at server restart
    CharacterDatabase.Execute("UPDATE `character_battleground_data` SET `instance_id` = 0");
}

#include "ObjectAccessor.h"
#include "Language.h"
void CreateCrashDump()
{
#ifndef WIN32
    if (!::fork()) // Create child process
    {
        ::abort(); // Crash the app immediately
    }
#endif
}

// Handle termination signals
void Master::SigvSignalHandler()
{
    if (m_handleSigvSignals)
        _OnSignal(SIGSEGV);
    exit(1);
}

void Master::_OnSignal(int s)
{
    switch (s)
    {
        case SIGINT:
            World::StopNow(RESTART_EXIT_CODE);
            break;
        case SIGTERM:
#ifdef _WIN32
            case SIGBREAK:
#endif
            World::StopNow(SHUTDOWN_EXIT_CODE);
            break;
        case SIGSEGV:
            ::signal(SIGSEGV, nullptr);
            if (!m_handleSigvSignals)
                return;
            m_handleSigvSignals = false; // Disarm anti-crash

            std::exception_ptr exc = std::current_exception();
            sWorld.SetAnticrashRearmTimer(sWorld.getConfig(CONFIG_UINT32_ANTICRASH_REARM_TIMER));
            uint32 anticrashOptions = sWorld.getConfig(CONFIG_UINT32_ANTICRASH_OPTIONS);

            // Log crash stack
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Received SIGSEGV");
            MaNGOS::Errors::PrintStacktrace();

            if (anticrashOptions & ANTICRASH_GENERATE_COREDUMP)
                CreateCrashDump();

            if (anticrashOptions & ANTICRASH_OPTION_ANNOUNCE_PLAYERS)
            {
                if (anticrashOptions & ANTICRASH_OPTION_SAVEALL)
                    sWorld.SendWorldText(LANG_SYSTEMMESSAGE, "Server has crashed. Now saving online players ...");
                else
                    sWorld.SendWorldText(LANG_SYSTEMMESSAGE, "Crash server occurred :(");

                std::this_thread::sleep_for(std::chrono::milliseconds(500));
            }

            if (anticrashOptions & ANTICRASH_OPTION_SAVEALL)
            {
                CharacterDatabase.ThreadStart();
                sObjectAccessor.SaveAllPlayers();
                std::this_thread::sleep_for(std::chrono::seconds(25));
            }

            std::rethrow_exception(exc); // Crash for real now.
            return;
    }

    ::signal(s, _OnSignal);
}

void Master::_HookSignals()
{
    ::signal(SIGINT, _OnSignal);
    ::signal(SIGTERM, _OnSignal);
    ::signal(SIGSEGV, _OnSignal);
#ifdef _WIN32
    ::signal(SIGBREAK, _OnSignal);
#endif
    ArmAnticrash();
}

void Master::ArmAnticrash()
{
    //::signal(SIGSEGV, _OnSignal);
    m_handleSigvSignals = true;
}

// Unhook the signals before leaving
void Master::_UnhookSignals()
{
    ::signal(SIGINT, nullptr);
    ::signal(SIGTERM, nullptr);
    ::signal(SIGSEGV, nullptr);
#ifdef _WIN32
    ::signal(SIGBREAK, nullptr);
#endif
    m_handleSigvSignals = false;
}
