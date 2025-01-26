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
#include <iostream>

#include "ace/OS_NS_unistd.h"

INSTANTIATE_SINGLETON_1(Log);

namespace
{
uint16 GetConsoleColor()
{
#if PLATFORM == PLATFORM_WINDOWS
    // Capture initial text color for using as a default
    CONSOLE_SCREEN_BUFFER_INFO info;
    if (!GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &info))
    {
        // default to white on error
        return FOREGROUND_BLUE | FOREGROUND_GREEN | FOREGROUND_RED;
    }

    return info.wAttributes & 0xF;
#else
    return 0;
#endif
}
}

extern char const* g_mainLogFileName;

Log::Log() :
    m_includeTime(false), m_logsTimestamp(GetTimestampStr()), m_defaultColor(GetConsoleColor())
{
    for (int i = 0; i < LOG_TYPE_MAX; ++i)
    {
        logFiles[i] = nullptr;
    }

    // Common log files data
    m_logsDir = sConfig.GetStringDefault("LogsDir", "");
    if (!m_logsDir.empty())
    {
        if ((m_logsDir.at(m_logsDir.length() - 1) != '/') && (m_logsDir.at(m_logsDir.length() - 1) != '\\'))
            m_logsDir.append("/");
    }

    bool const log_file_timestamp = sConfig.GetBoolDefault("LogFile.TimeStamp", false);

    // Open specific log files
    logFiles[LOG_BASIC] = OpenLogFile("LogFile.Basic", g_mainLogFileName, log_file_timestamp, true);

    // Main log file settings
    m_wardenDebug = sConfig.GetBoolDefault("Warden.DebugLog", false);
    m_includeTime = sConfig.GetBoolDefault("LogTime", false);
    m_consoleLevel = LogLevel(sConfig.GetIntDefault("LogLevel.Console", 2));
    m_fileLevel = LogLevel(sConfig.GetIntDefault("LogLevel.File", 2));
    m_dbLevel = LogLevel(sConfig.GetIntDefault("LogLevel.DB", 2));

    // Smartlog data
    InitSmartlogEntries(sConfig.GetStringDefault("Smartlog.ExtraEntries", ""));
    InitSmartlogGuids(sConfig.GetStringDefault("Smartlog.ExtraGuids", ""));

    m_logFilter = 0;
    for (int i = 0; i < LOG_FILTER_COUNT; ++i)
        if (*logFilterData[i].name)
            if (sConfig.GetBoolDefault(logFilterData[i].configName, logFilterData[i].defaultState))
                m_logFilter |= (1 << i);
}

void Log::OpenWorldLogFiles()
{
    bool const log_file_timestamp = sConfig.GetBoolDefault("LogFile.TimeStamp", false);
    logFiles[LOG_CHAT] = OpenLogFile("LogFile.Chat", "Chat.log", log_file_timestamp, false);
    logFiles[LOG_BG] = OpenLogFile("BgLogFile", "Bg.log", log_file_timestamp, false);
    logFiles[LOG_CHAR] = OpenLogFile("LogFile.Char", "Char.log", log_file_timestamp, false);
    logFiles[LOG_HONOR] = OpenLogFile("LogFile.Honor", "", log_file_timestamp, false);
    logFiles[LOG_RA] = OpenLogFile("LogFile.Ra", "Ra.log", log_file_timestamp, false);
    logFiles[LOG_DBERROR] = OpenLogFile("LogFile.DBError", "DBErrors.log", log_file_timestamp, true);
    logFiles[LOG_DBERRFIX] = OpenLogFile("LogFile.DBErrorFix", "DBErrorFixes.sql", log_file_timestamp, true);
    logFiles[LOG_LOOTS] = OpenLogFile("LootsLogFile", "Loot.log", log_file_timestamp, false);
    logFiles[LOG_LEVELUP] = OpenLogFile("LevelupLogFile", "LevelUp.log", log_file_timestamp, false);
    logFiles[LOG_PERFORMANCE] = OpenLogFile("LogFile.Performance", "Perf.log", log_file_timestamp, false);
    logFiles[LOG_MONEY_TRADES] = OpenLogFile("LogFile.Trades", "", log_file_timestamp, false);
    logFiles[LOG_GM] = sConfig.GetBoolDefault("GmLogPerAccount", false) ?
        OpenLogFile("LogFile.Gm", "", log_file_timestamp, false) : nullptr;
    logFiles[LOG_GM_CRITICAL] = OpenLogFile("LogFile.CriticalCommands", "gm_critical.log", log_file_timestamp, false);
    logFiles[LOG_ANTICHEAT] = OpenLogFile("LogFile.Anticheat", "Anticheat.log", log_file_timestamp, false);
    logFiles[LOG_SCRIPTS] = OpenLogFile("LogFile.Scripts", "Scripts.log", log_file_timestamp, false);
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
        m_smartlogExtraEntries.insert(entry);
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
        m_smartlogExtraGuids.insert(entry);
    }
}

void Log::SetColor(FILE* where, Color color) const
{
    if (color == RESET)
    {
        ResetColor(where);
        return;
    }

#if PLATFORM == PLATFORM_WINDOWS

    static constexpr WORD WinColorFG[] =
    {
        0,                                                  // RESET, unused
        0,                                                  // BLACK
        FOREGROUND_RED,                                     // RED
        FOREGROUND_GREEN,                                   // GREEN
        FOREGROUND_RED | FOREGROUND_GREEN,                  // BROWN
        FOREGROUND_BLUE,                                    // BLUE
        FOREGROUND_RED | FOREGROUND_BLUE,// MAGENTA
        FOREGROUND_GREEN | FOREGROUND_BLUE,                 // CYAN
        FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE,// WHITE
                                                            // YELLOW
        FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_INTENSITY,
        // RED_BOLD
        FOREGROUND_RED | FOREGROUND_INTENSITY,
        // GREEN_BOLD
        FOREGROUND_GREEN | FOREGROUND_INTENSITY,
        FOREGROUND_BLUE | FOREGROUND_INTENSITY,             // BLUE_BOLD
                                                            // MAGENTA_BOLD
        FOREGROUND_RED | FOREGROUND_BLUE | FOREGROUND_INTENSITY,
        // CYAN_BOLD
        FOREGROUND_GREEN | FOREGROUND_BLUE | FOREGROUND_INTENSITY,
        // WHITE_BOLD
        FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE | FOREGROUND_INTENSITY
    };

    static_assert(sizeof(WinColorFG) / sizeof(WinColorFG[0]) == COLOR_COUNT,
        "WinColorFG size must match COLOR_COUNT");

    HANDLE hConsole = GetStdHandle(where == stdout ? STD_OUTPUT_HANDLE : STD_ERROR_HANDLE);
    SetConsoleTextAttribute(hConsole, WinColorFG[color]);
#else

    enum ANSITextAttr
    {
        TA_NORMAL = 0,
        TA_BOLD = 1,
        TA_BLINK = 5,
        TA_REVERSE = 7
    };

    enum ANSIFgTextAttr
    {
        FG_BLACK = 30, FG_RED, FG_GREEN, FG_BROWN, FG_BLUE,
        FG_MAGENTA, FG_CYAN, FG_WHITE, FG_YELLOW
    };

    enum ANSIBgTextAttr
    {
        BG_BLACK = 40, BG_RED, BG_GREEN, BG_BROWN, BG_BLUE,
        BG_MAGENTA, BG_CYAN, BG_WHITE
    };

    static uint8 UnixColorFG[COLOR_COUNT] =
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

    fprintf(where, "\x1b[%d%sm", UnixColorFG[color], (color >= YELLOW && color < COLOR_COUNT ? ";1" : ""));
#endif
}

void Log::ResetColor(FILE* where) const
{
#if PLATFORM == PLATFORM_WINDOWS
    HANDLE hConsole = GetStdHandle(where == stdout ? STD_OUTPUT_HANDLE : STD_ERROR_HANDLE);
    SetConsoleTextAttribute(hConsole, m_defaultColor);
#else
    fprintf(where, "\x1b[%dm", m_defaultColor);
#endif
}

void Log::SetConsoleLevel(LogLevel level)
{
    if (level < LOG_LVL_ERROR)
        level = LOG_LVL_ERROR;
    else if (level > LOG_LVL_DEBUG)
        level = LOG_LVL_DEBUG;

    m_consoleLevel = level;

    printf("Console log level set to %u\n", m_consoleLevel);
}

void Log::SetFileLevel(LogLevel level)
{
    int32 newLevel = atoi((char*)level);

    if (newLevel < LOG_LVL_ERROR)
        newLevel = LOG_LVL_ERROR;
    else if (newLevel > LOG_LVL_DEBUG)
        newLevel = LOG_LVL_DEBUG;

    m_fileLevel = LogLevel(newLevel);

    printf("File log level set to %u\n", m_fileLevel);
}

FILE* Log::OpenLogFile(char const* configFileName, char const* defaultFileName, bool timestampFile, bool overwriteOnOpen) const
{
    std::string logfn = sConfig.GetStringDefault(configFileName, defaultFileName);
    if (logfn.empty())
        return nullptr;

    char const* mode;
    if (timestampFile)
    {
        mode = "w";
        size_t dot_pos = logfn.find_last_of('.');
        if (dot_pos != logfn.npos)
            logfn.insert(dot_pos, m_logsTimestamp);
        else
            logfn += m_logsTimestamp;
    }
    else if (overwriteOnOpen)
        mode = "w";
    else
        mode = "a";

    return fopen((m_logsDir + logfn).c_str(), mode);
}

void Log::OutTimestamp(FILE* file)
{
    time_t t = time(nullptr);
    tm* aTm = localtime(&t);
    //       YYYY   year
    //       MM     month (2 digits 01-12)
    //       DD     day (2 digits 01-31)
    //       HH     hour (2 digits 00-23)
    //       MM     minutes (2 digits 00-59)
    //       SS     seconds (2 digits 00-59)
    fprintf(file, "%-4d-%02d-%02d %02d:%02d:%02d ", aTm->tm_year + 1900, aTm->tm_mon + 1, aTm->tm_mday, aTm->tm_hour, aTm->tm_min, aTm->tm_sec);
}

void Log::OutTime(FILE* where)
{
    time_t t = time(nullptr);
    tm* aTm = localtime(&t);
    //       YYYY   year
    //       MM     month (2 digits 01-12)
    //       DD     day (2 digits 01-31)
    //       HH     hour (2 digits 00-23)
    //       MM     minutes (2 digits 00-59)
    //       SS     seconds (2 digits 00-59)
    fprintf(where, "%02d:%02d:%02d ", aTm->tm_hour, aTm->tm_min, aTm->tm_sec);
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
    snprintf(buf, 20, "_%04d-%02d-%02d_%02d-%02d-%02d", aTm->tm_year + 1900, aTm->tm_mon + 1, aTm->tm_mday, aTm->tm_hour, aTm->tm_min, aTm->tm_sec);
    return std::string(buf);
}

#define LOG_TO_FILE_HELPER(logLevel,logType,format,ap) \
if (logFiles[logType] && m_fileLevel >= logLevel)                             \
{                                                                             \
    if (logType != LOG_DBERRFIX)                                              \
    {                                                                         \
        OutTimestamp(logFiles[logType]);                                      \
        if (logLevel == LOG_LVL_ERROR)                                        \
            fputs("ERROR: ", logFiles[logType]);                              \
    }                                                                         \
    va_start(ap, format);                                                     \
    vfprintf(logFiles[logType], format, ap);                                  \
    fputs("\n", logFiles[logType]);                                           \
    fflush(logFiles[logType]);                                                \
    va_end(ap);                                                               \
}                                                                             \

#define LOG_TO_CONSOLE_HELPER(logLevel,logType,format,ap) \
if (logType != LOG_PERFORMANCE && logType != LOG_DBERRFIX && m_consoleLevel >= logLevel) \
{                                                                             \
    auto const where = logLevel == LOG_LVL_ERROR ? stderr : stdout;           \
    SetColor(where, g_logColors[logLevel]);                                   \
    if (m_includeTime)                                                        \
        OutTime(where);                                                       \
    if (logLevel == LOG_LVL_ERROR)                                            \
        fprintf(where, "ERROR: ");                                            \
                                                                              \
    va_start(ap, format);                                                     \
    vutf8printf(where, format, &ap);                                          \
    va_end(ap);                                                               \
                                                                              \
    ResetColor(where);                                                        \
    fprintf(where, "\n");                                                     \
    fflush(where);                                                            \
                                                                              \
    if (logType != LOG_BASIC)                                                 \
    LOG_TO_FILE_HELPER(logLevel, LOG_BASIC, format, ap);                      \
}                                                                             \

void Log::Out(LogType logType, LogLevel logLevel, char const* format, ...)
{
    ASSERT(logType >= 0 && logType < LOG_TYPE_MAX&& logLevel >= 0 && logLevel <= LOG_LVL_DEBUG);

    if (!format)
        return;

    // neither console nor file gets this?  we're done
    if (m_consoleLevel < logLevel && !(logFiles[logType] && m_fileLevel >= logLevel))
        return;

    va_list ap;

    LOG_TO_CONSOLE_HELPER(logLevel, logType, format, ap);
    LOG_TO_FILE_HELPER(logLevel, logType, format, ap);
}

void Log::OutConsole(LogType logType, LogLevel logLevel, std::string const& log) const
{
    // LOG_PERFORMANCE and LOG_DBERRFIX should never be logged to the console
    if (logType == LOG_PERFORMANCE || logType == LOG_DBERRFIX)
        return;

    if (m_consoleLevel < logLevel)
        return;

    auto const where = logLevel == LOG_LVL_ERROR ? stderr : stdout;

    SetColor(where, g_logColors[logLevel]);

    if (m_includeTime)
        OutTime(where);

    if (logLevel == LOG_LVL_ERROR)
        fprintf(where, "ERROR: ");

    utf8printf(where, log.c_str());

    ResetColor(where);

    fprintf(where, "\n");
    fflush(where);

    // If we are writing to the console for a log other than the basic console log,
    // also write it to the basic logfile (Server.log).  This will help the basic
    // logfile more closely resemble the console output.
    if (logType != LOG_BASIC)
        OutFile(LOG_BASIC, logLevel, log);
}

void Log::OutFile(LogType logType, LogLevel logLevel, std::string const& str) const
{
    if (!logFiles[logType] || m_fileLevel < logLevel)
        return;

    // LOG_DBERRFIX should not get timestamp, but all others should
    if (logType != LOG_DBERRFIX)
    {
        OutTimestamp(logFiles[logType]);

        if (logLevel == LOG_LVL_ERROR)
            fputs("ERROR: ", logFiles[logType]);
    }

    fputs(str.c_str(), logFiles[logType]);
    fputs("\n", logFiles[logType]);
    fflush(logFiles[logType]);
}

bool Log::IsSmartLog(uint32 entry, uint32 guid) const
{
    return m_smartlogExtraEntries.find(entry) != m_smartlogExtraEntries.end() ||
        m_smartlogExtraGuids.find(guid) != m_smartlogExtraGuids.end();
}

void Log::WaitBeforeContinueIfNeed()
{
    int mode = sConfig.GetIntDefault("WaitAtStartupError", 0);

    if (mode < 0)
    {
        printf("\nPress <Enter> for continue\n");

        std::string line;
        std::getline(std::cin, line);
    }
    else if (mode > 0)
    {
        printf("\nWait %d secs for continue.\n", mode);
        BarGoLink bar(mode);
        for (int i = 0; i < mode; ++i)
        {
            bar.step();
            ACE_OS::sleep(1);
        }
    }
}
