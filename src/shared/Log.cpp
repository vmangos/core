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

#include "Common.h"
#include "Log.h"
#include "Policies/SingletonImp.h"
#include "Config/Config.h"
#include "Util.h"
#include "ByteBuffer.h"
#include "ProgressBar.h"

#include <stdarg.h>
#include <fstream>
#include <iostream>

#include "ace/OS_NS_unistd.h"

INSTANTIATE_SINGLETON_1(Log);

LogFilterData logFilterData[LOG_FILTER_COUNT] =
{
    { "transport_moves",     "LogFilter_TransportMoves",     true  },
    { "creature_moves",      "LogFilter_CreatureMoves",      true  },
    { "visibility_changes",  "LogFilter_VisibilityChanges",  true  },
    { "",                    "",                             true  },
    { "weather",             "LogFilter_Weather",            true  },
    { "player_stats",        "LogFilter_PlayerStats",        false },
    { "sql_text",            "LogFilter_SQLText",            false },
    { "player_moves",        "LogFilter_PlayerMoves",        false },
    { "periodic_effects",    "LogFilter_PeriodicAffects",    false },
    { "ai_and_movegens",     "LogFilter_AIAndMovegens",      false },
    { "damage",              "LogFilter_Damage",             false },
    { "combat",              "LogFilter_Combat",             false },
    { "spell_cast",          "LogFilter_SpellCast",          false },
    { "db_stricted_check",   "LogFilter_DbStrictedCheck",    true  },
    { "pathfinding",         "LogFilter_Pathfinding",        false },
    { "honor",               "LogFilter_Honor",              true  },
};

Log::Log() :
    m_colored(false), m_includeTime(false), m_wardenDebug(false), m_logsTimestamp(GetTimestampStr()),
    m_gmlog_per_account(sConfig.GetBoolDefault("GmLogPerAccount", false)),
    m_bIsChatLogFileActivated(sConfig.GetBoolDefault("ChatLogEnable", false))
{
    for (int i = 0; i < LOG_MAX_FILES; ++i)
    {
        logFiles[i] = nullptr;
        timestampPrefix[i] = true;
    }
    Initialize();
}

void Log::InitColors(std::string const& str)
{
    if (str.empty())
    {
        m_colored = false;
        return;
    }

    int color[LOG_TYPE_MAX];

    std::istringstream ss(str);

    for(int i = 0; i < LOG_TYPE_MAX; ++i)
    {
        ss >> color[i];

        if(!ss)
            return;

        if(color[i] < 0 || color[i] >= Color_count)
            return;
    }

    for(int i = 0; i < LOG_TYPE_MAX; ++i)
        m_colors[i] = Color(color[i]);

    m_colored = true;
}

void Log::InitSmartlogEntries(std::string const& str)
{
    m_smartlogExtraEntries.clear();

    if (str.empty())
        return;

    uint32 entry;
    std::istringstream ss(str);

    while (ss)
    {
        ss >> entry;
        m_smartlogExtraEntries.push_back(entry);
    }
}

void Log::InitSmartlogGuids(std::string const& str)
{
    m_smartlogExtraGuids.clear();

    if (str.empty())
        return;

    uint32 entry;
    std::istringstream ss(str);

    while (ss)
    {
        ss >> entry;
        m_smartlogExtraGuids.push_back(entry);
    }
}

void Log::SetColor(bool stdout_stream, Color color)
{
    #if PLATFORM == PLATFORM_WINDOWS

    static WORD WinColorFG[Color_count] =
    {
        0,                                                  // BLACK
        FOREGROUND_RED,                                     // RED
        FOREGROUND_GREEN,                                   // GREEN
        FOREGROUND_RED | FOREGROUND_GREEN,                  // BROWN
        FOREGROUND_BLUE,                                    // BLUE
        FOREGROUND_RED |                    FOREGROUND_BLUE,// MAGENTA
        FOREGROUND_GREEN | FOREGROUND_BLUE,                 // CYAN
        FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE,// WHITE
                                                            // YELLOW
        FOREGROUND_RED | FOREGROUND_GREEN |                   FOREGROUND_INTENSITY,
                                                            // RED_BOLD
        FOREGROUND_RED |                                      FOREGROUND_INTENSITY,
                                                            // GREEN_BOLD
        FOREGROUND_GREEN |                   FOREGROUND_INTENSITY,
        FOREGROUND_BLUE | FOREGROUND_INTENSITY,             // BLUE_BOLD
                                                            // MAGENTA_BOLD
        FOREGROUND_RED |                    FOREGROUND_BLUE | FOREGROUND_INTENSITY,
                                                            // CYAN_BOLD
        FOREGROUND_GREEN | FOREGROUND_BLUE | FOREGROUND_INTENSITY,
                                                            // WHITE_BOLD
        FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE | FOREGROUND_INTENSITY
    };

    HANDLE hConsole = GetStdHandle(stdout_stream ? STD_OUTPUT_HANDLE : STD_ERROR_HANDLE);
    SetConsoleTextAttribute(hConsole, WinColorFG[color]);
    #else

    enum ANSITextAttr
    {
        TA_NORMAL=0,
        TA_BOLD=1,
        TA_BLINK=5,
        TA_REVERSE=7
    };

    enum ANSIFgTextAttr
    {
        FG_BLACK=30, FG_RED,  FG_GREEN, FG_BROWN, FG_BLUE,
        FG_MAGENTA,  FG_CYAN, FG_WHITE, FG_YELLOW
    };

    enum ANSIBgTextAttr
    {
        BG_BLACK=40, BG_RED,  BG_GREEN, BG_BROWN, BG_BLUE,
        BG_MAGENTA,  BG_CYAN, BG_WHITE
    };

    static uint8 UnixColorFG[Color_count] =
    {
        FG_BLACK,                                           // BLACK
        FG_RED,                                             // RED
        FG_GREEN,                                           // GREEN
        FG_BROWN,                                           // BROWN
        FG_BLUE,                                            // BLUE
        FG_MAGENTA,                                         // MAGENTA
        FG_CYAN,                                            // CYAN
        FG_WHITE,                                           // WHITE
        FG_YELLOW,                                          // YELLOW
        FG_RED,                                             // LRED
        FG_GREEN,                                           // LGREEN
        FG_BLUE,                                            // LBLUE
        FG_MAGENTA,                                         // LMAGENTA
        FG_CYAN,                                            // LCYAN
        FG_WHITE                                            // LWHITE
    };

    fprintf((stdout_stream? stdout : stderr), "\x1b[%d%sm",UnixColorFG[color],(color>=YELLOW&&color<Color_count ?";1":""));
    #endif
}

void Log::ResetColor(bool stdout_stream)
{
    #if PLATFORM == PLATFORM_WINDOWS
    HANDLE hConsole = GetStdHandle(stdout_stream ? STD_OUTPUT_HANDLE : STD_ERROR_HANDLE);
    SetConsoleTextAttribute(hConsole, FOREGROUND_BLUE | FOREGROUND_GREEN | FOREGROUND_RED);
    #else
    fprintf((stdout_stream ? stdout : stderr), "\x1b[0m");
    #endif
}

void Log::SetLogLevel(char* level)
{
    int32 newLevel =atoi((char*)level);

    if (newLevel < LOG_LVL_MINIMAL)
        newLevel = LOG_LVL_MINIMAL;
    else if (newLevel > LOG_LVL_DEBUG)
        newLevel = LOG_LVL_DEBUG;

    m_consoleLevel = LogLevel(newLevel);

    printf("LogLevel is %d\n", m_consoleLevel);
}

void Log::SetLogFileLevel(char* level)
{
    int32 newLevel =atoi((char*)level);

    if (newLevel < LOG_LVL_MINIMAL)
        newLevel = LOG_LVL_MINIMAL;
    else if (newLevel > LOG_LVL_DEBUG)
        newLevel = LOG_LVL_DEBUG;

    m_fileLevel = LogLevel(newLevel);

    printf("LogFileLevel is %d\n", m_fileLevel);
}

void Log::Initialize()
{
    /// Common log files data
    m_logsDir = sConfig.GetStringDefault("LogsDir","");
    if (!m_logsDir.empty())
    {
        if ((m_logsDir.at(m_logsDir.length()-1)!='/') && (m_logsDir.at(m_logsDir.length()-1)!='\\'))
            m_logsDir.append("/");
    }

    /// Open specific log files

    // GM log settings for per account case
    m_gmlog_filename_format = sConfig.GetStringDefault("GMLogFile", "");
    if (!m_gmlog_filename_format.empty())
    {
        bool m_gmlog_timestamp = sConfig.GetBoolDefault("GmLogTimestamp",false);

        size_t dot_pos = m_gmlog_filename_format.find_last_of('.');
        if (dot_pos!=m_gmlog_filename_format.npos)
        {
            if (m_gmlog_timestamp)
                m_gmlog_filename_format.insert(dot_pos,m_logsTimestamp);

            m_gmlog_filename_format.insert(dot_pos,"_#%u");
        }
        else
        {
            m_gmlog_filename_format += "_#%u";

            if (m_gmlog_timestamp)
                m_gmlog_filename_format += m_logsTimestamp;
        }

        m_gmlog_filename_format = m_logsDir + m_gmlog_filename_format;
    }

    logFiles[LOG_BASIC]         = openLogFile("LogFile", "LogTimestamp", "w");
    logFiles[LOG_WORLDPACKET]   = openLogFile("WorldLogFile", "WorldLogTimestamp", "a");
    logFiles[LOG_CHAT]          = openLogFile("ChatLogFile", "ChatLogTimestamp", "a");
    logFiles[LOG_BG]            = openLogFile("BgLogFile", "BgLogTimestamp", "a");
    logFiles[LOG_CHAR]          = openLogFile("CharLogFile", "CharLogTimestamp", "a");
    logFiles[LOG_HONOR]         = openLogFile("HonorLogFile", "HonorLogTimestamp", "a");
    logFiles[LOG_RA]            = openLogFile("RaLogFile", nullptr, "a");
    logFiles[LOG_DBERROR]       = openLogFile("DBErrorLogFile", nullptr, "a");
    logFiles[LOG_DBERRFIX]      = openLogFile("DBErrorFixFile", nullptr, "w+");
    logFiles[LOG_CLIENT_IDS]    = openLogFile("ClientIdsLogFile", nullptr, "a");
    logFiles[LOG_LOOTS]         = openLogFile("LootsLogFile", nullptr, "a");
    logFiles[LOG_LEVELUP]       = openLogFile("LevelupLogFile", nullptr, "a");
    logFiles[LOG_PERFORMANCE]   = openLogFile("PerformanceLog.File", nullptr, "a");
    logFiles[LOG_GM]            = sConfig.GetBoolDefault("GmLogPerAccount", false) ?
                                  openLogFile("GMLogFile", "GmLogTimestamp", "a") : nullptr;
    logFiles[LOG_MONEY_TRADES]  = openLogFile("LogMoneyTrades", nullptr, "a");
    logFiles[LOG_GM_CRITICAL]   = openLogFile("CriticalCommandsLogFile", nullptr, "a");
    logFiles[LOG_CHAT_SPAM]     = openLogFile("ChatSpamLogFile", nullptr, "a");
    logFiles[LOG_ANTICHEAT]     = openLogFile("AnticheatLogFile", "AnticheatLogTimestamp", "a");
    logFiles[LOG_NOSTALRIUS]    = openLogFile("NostalriusLogFile", "NostalriusLogTimestamp", "a");

    timestampPrefix[LOG_DBERRFIX] = false;

    // Main log file settings
    m_wardenDebug  = sConfig.GetBoolDefault("Warden.DebugLog", false);
    m_includeTime  = sConfig.GetBoolDefault("LogTime", false);
    m_consoleLevel = LogLevel(sConfig.GetIntDefault("LogLevel", 0));
    m_fileLevel = LogLevel(sConfig.GetIntDefault("LogFileLevel", 0));
    InitColors(sConfig.GetStringDefault("LogColors", ""));

    // Smartlog data
    InitSmartlogEntries(sConfig.GetStringDefault("Smartlog.ExtraEntries", ""));
    InitSmartlogGuids(sConfig.GetStringDefault("Smartlog.ExtraGuids", ""));

    m_logFilter = 0;
    for(int i = 0; i < LOG_FILTER_COUNT; ++i)
        if (*logFilterData[i].name)
            if (sConfig.GetBoolDefault(logFilterData[i].configName, logFilterData[i].defaultState))
                m_logFilter |= (1 << i);

    // Char log settings
    m_charLog_Dump = sConfig.GetBoolDefault("CharLogDump", false);
}

FILE* Log::openLogFile(char const* configFileName,char const* configTimeStampFlag, char const* mode)
{
    std::string logfn=sConfig.GetStringDefault(configFileName, "");
    if (logfn.empty())
        return nullptr;

    if (configTimeStampFlag && sConfig.GetBoolDefault(configTimeStampFlag,false))
    {
        size_t dot_pos = logfn.find_last_of('.');
        if (dot_pos!=logfn.npos)
            logfn.insert(dot_pos,m_logsTimestamp);
        else
            logfn += m_logsTimestamp;
    }

    return fopen((m_logsDir+logfn).c_str(), mode);
}

FILE* Log::openGmlogPerAccount(uint32 account)
{
    if (m_gmlog_filename_format.empty())
        return nullptr;

    char namebuf[MANGOS_PATH_MAX];
    snprintf(namebuf,MANGOS_PATH_MAX,m_gmlog_filename_format.c_str(),account);
    return fopen(namebuf, "a");
}

void Log::outTimestamp(FILE* file)
{
    time_t t = time(nullptr);
    tm* aTm = localtime(&t);
    //       YYYY   year
    //       MM     month (2 digits 01-12)
    //       DD     day (2 digits 01-31)
    //       HH     hour (2 digits 00-23)
    //       MM     minutes (2 digits 00-59)
    //       SS     seconds (2 digits 00-59)
    fprintf(file,"%-4d-%02d-%02d %02d:%02d:%02d ",aTm->tm_year+1900,aTm->tm_mon+1,aTm->tm_mday,aTm->tm_hour,aTm->tm_min,aTm->tm_sec);
}

void Log::outTime(FILE* where)
{
    time_t t = time(nullptr);
    tm* aTm = localtime(&t);
    //       YYYY   year
    //       MM     month (2 digits 01-12)
    //       DD     day (2 digits 01-31)
    //       HH     hour (2 digits 00-23)
    //       MM     minutes (2 digits 00-59)
    //       SS     seconds (2 digits 00-59)
    fprintf(where, "%02d:%02d:%02d ",aTm->tm_hour,aTm->tm_min,aTm->tm_sec);
}

std::string Log::GetTimestampStr()
{
    time_t t = time(nullptr);
    tm* aTm = localtime(&t);
    //       YYYY   year
    //       MM     month (2 digits 01-12)
    //       DD     day (2 digits 01-31)
    //       HH     hour (2 digits 00-23)
    //       MM     minutes (2 digits 00-59)
    //       SS     seconds (2 digits 00-59)
    char buf[20];
    snprintf(buf,20,"_%04d-%02d-%02d_%02d-%02d-%02d",aTm->tm_year+1900,aTm->tm_mon+1,aTm->tm_mday,aTm->tm_hour,aTm->tm_min,aTm->tm_sec);
    return std::string(buf);
}

// the actual logging function.  nothing else should write log messages, except this
void Log::out(LogFile type, LogLevel l, char const* str, va_list ap)
{
    ASSERT(type >= 0 && type < LOG_MAX_FILES);

    if (!str)
        return;

    // neither console nor file gets this?  we're done
    if (m_consoleLevel < l && !(logFiles[type] && m_fileLevel >= l))
        return;

    // make buffer
    char buff[4096];
    vsnprintf(buff, sizeof(buff), str, ap);

    // LOG_PERFORMANCE and LOG_DBERRFIX should never be logged to the console
    if (type != LOG_PERFORMANCE && type != LOG_DBERRFIX && m_consoleLevel >= l)
    {
        if (m_colored)
        {
            LogType logType;
            if (l == LOG_LVL_DETAIL)
                logType = LogDetails;
            else if (l == LOG_LVL_DEBUG)
                logType = LogDebug;
            else if (type == LOG_ANTICHEAT)
                logType = LogAnticheat;
            else
                logType = LogNormal;

            SetColor(true, m_colors[logType]);
        }

        if (m_includeTime)
            outTime(stdout);

        utf8printf(stdout, buff);

        if (m_colored)
            ResetColor(true);

        printf("\n");
        fflush(stdout);
    }

    if (logFiles[type] && m_fileLevel >= l)
    {
        if (timestampPrefix[type])
            outTimestamp(logFiles[type]);

        fputs(buff, logFiles[type]);
        fputs("\n", logFiles[type]);
        fflush(logFiles[type]);
    }
}

void Log::out(LogFile type, char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    out(type, LOG_LVL_MINIMAL, str, ap);
    va_end(ap);
}

void Log::error(LogFile type, LogLevel l, char const* str, va_list ap)
{
    if (!str || !str[0])
        return;

    char format[4096];
    snprintf(format, sizeof(format), "ERROR: %s", str);
    out(type, l, format, ap);
}

void Log::outString()
{
    outString("");
}

void Log::outString(char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    out(LOG_BASIC, LOG_LVL_MINIMAL, str, ap);
    va_end(ap);
}

void Log::outBasic(char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    out(LOG_BASIC, LOG_LVL_MINIMAL, str, ap);
    va_end(ap);
}

void Log::outInfo(char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    out(LOG_NOSTALRIUS, LOG_LVL_MINIMAL, str, ap);
    va_end(ap);
}

void Log::outHonor(char const* str, ...)
{
    if (!str)
        return;

    if (!HasLogFilter(LOG_FILTER_HONOR))
    {
        va_list ap;
        va_start(ap, str);
        out(LOG_HONOR, LOG_LVL_MINIMAL, str, ap);
        va_end(ap);
    }
}

void Log::outError(char const* err, ...)
{
    va_list ap;
    va_start(ap, err);
    error(LOG_BASIC, LOG_LVL_MINIMAL, err, ap);
    va_end(ap);
}

void Log::outErrorDb()
{
    outErrorDb("");
}

void Log::outErrorDb(char const* err, ...)
{
    va_list ap;
    va_start(ap, err);
    error(LOG_DBERROR, LOG_LVL_MINIMAL, err, ap);
    va_end(ap);
}

void Log::outDetail(char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    out(LOG_BASIC, LOG_LVL_DETAIL, str, ap);
    va_end(ap);
}

void Log::outDebug(char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    out(LOG_BASIC, LOG_LVL_DEBUG, str, ap);
    va_end(ap);
}

void Log::outWarden(char const* wrd, ...)
{
    va_list ap;
    va_start(ap, wrd);
    out(LOG_ANTICHEAT, LOG_LVL_BASIC, wrd, ap);
    va_end(ap);
}

void Log::outWardenDebug(char const* wrd, ...)
{
    va_list ap;
    va_start(ap, wrd);
    out(LOG_ANTICHEAT, LOG_LVL_DEBUG, wrd, ap);
    va_end(ap);
}

void Log::outAnticheat(char const* detector, char const* player, char const* reason, char const* penalty)
{
    if (!detector || !player || !reason || !penalty)
        return;

    out(LOG_ANTICHEAT, false, "[%s] Player %s, Cheat: %s, Penalty: %s", detector, player, reason, penalty);
}

void Log::outCommand(uint32, char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    out(LOG_GM, LOG_LVL_DETAIL, str, ap);
    va_end(ap);
}

void Log::outWorldPacketDump(ACE_HANDLE socketHandle, uint32 opcode,
                             char const* opcodeName, ByteBuffer const* packet,
                             bool incoming)
{
    if (!logFiles[LOG_WORLDPACKET])
        return;

    outTimestamp(logFiles[LOG_WORLDPACKET]);

    fprintf(logFiles[LOG_WORLDPACKET],
            "\n%s:\nSOCKET: %p\nLENGTH: %zu\nOPCODE: %s (0x%.4X)\nDATA:\n",
            incoming ? "CLIENT" : "SERVER", socketHandle, packet->size(),
            opcodeName, opcode);

    size_t p = 0;
    while (p < packet->size())
    {
        for (size_t j = 0; j < 16 && p < packet->size(); ++j)
            fprintf(logFiles[LOG_WORLDPACKET], "%.2X ", (*packet)[p++]);

        fprintf(logFiles[LOG_WORLDPACKET], "\n");
    }

    fprintf(logFiles[LOG_WORLDPACKET], "\n\n");
    fflush(logFiles[LOG_WORLDPACKET]);
}

void Log::WaitBeforeContinueIfNeed()
{
    int mode = sConfig.GetIntDefault("WaitAtStartupError",0);

    if (mode < 0)
    {
        printf("\nPress <Enter> for continue\n");

        std::string line;
        std::getline (std::cin, line);
    }
    else if (mode > 0)
    {
        printf("\nWait %d secs for continue.\n",mode);
        BarGoLink bar(mode);
        for(int i = 0; i < mode; ++i)
        {
            bar.step();
            ACE_OS::sleep(1);
        }
    }
}
