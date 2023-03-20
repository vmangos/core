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

#ifndef MANGOSSERVER_LOG_H
#define MANGOSSERVER_LOG_H

#include "Common.h"
#include "Policies/Singleton.h"

#include <unordered_set>

class Config;
class Player;
class WorldSession;
class ByteBuffer;

enum LogLevel
{
    LOG_LVL_ERROR = 0,
    LOG_LVL_MINIMAL,
    LOG_LVL_BASIC,
    LOG_LVL_DETAIL,
    LOG_LVL_DEBUG,
};

// bitmask (not forgot update logFilterData content)
enum LogFilters
{
    LOG_FILTER_TRANSPORT_MOVES    = 0x0001,                 // any related to transport moves
    LOG_FILTER_CREATURE_MOVES     = 0x0002,                 // creature move by cells
    LOG_FILTER_VISIBILITY_CHANGES = 0x0004,                 // update visibility for diff objects and players
    // reserved for future version
    LOG_FILTER_WEATHER            = 0x0010,                 // weather changes
    LOG_FILTER_PLAYER_STATS       = 0x0020,                 // player save data
    LOG_FILTER_SQL_TEXT           = 0x0040,                 // raw SQL text send to DB engine
    LOG_FILTER_PLAYER_MOVES       = 0x0080,                 // player moves by grid/cell
    LOG_FILTER_PERIODIC_AFFECTS   = 0x0100,                 // DoT/HoT apply trace
    LOG_FILTER_AI_AND_MOVEGENSS   = 0x0200,                 // AI/movement generators debug output
    LOG_FILTER_DAMAGE             = 0x0400,                 // Direct/Area damage trace
    LOG_FILTER_COMBAT             = 0x0800,                 // attack states/roll attack results/etc
    LOG_FILTER_SPELL_CAST         = 0x1000,                 // spell cast/aura apply/spell proc events
    LOG_FILTER_DB_STRICTED_CHECK  = 0x2000,                 // stricted DB data checks output (with possible false reports) for DB devs
    LOG_FILTER_PATHFINDING        = 0x4000,
    LOG_FILTER_HONOR              = 0x8000,                 // Honor
};

#define LOG_FILTER_COUNT            16

struct LogFilterData
{
    char const* name;
    char const* configName;
    bool defaultState;
};

// TODO: Get rid of these, in favor of additional log types
constexpr LogFilterData logFilterData[] =
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

static_assert(sizeof(logFilterData) / sizeof(logFilterData[0]) == LOG_FILTER_COUNT,
    "logFilterData size must match LOG_FILTER_COUNT");

enum Color
{
    RESET,
    BLACK,
    RED,
    GREEN,
    BROWN,
    BLUE,
    MAGENTA,
    CYAN,
    GREY,
    YELLOW,
    LRED,
    LGREEN,
    LBLUE,
    LMAGENTA,
    LCYAN,
    WHITE,
    COLOR_COUNT
};

constexpr Color g_logColors[] = {
    RED,    // error
    RESET,  // minimal
    RESET,  // basic
    YELLOW, // detail
    BLUE    // debug
};

enum LogType
{
    LOG_BASIC,
    LOG_CHAT,
    LOG_BG,
    LOG_CHAR,
    LOG_HONOR,
    LOG_RA,
    LOG_DBERROR,
    LOG_DBERRFIX,
    LOG_LOOTS,
    LOG_LEVELUP,
    LOG_PERFORMANCE,
    LOG_MONEY_TRADES,
    LOG_GM,
    LOG_GM_CRITICAL,
    LOG_ANTICHEAT,
    LOG_TYPE_MAX
};

class Log : public MaNGOS::Singleton<Log, MaNGOS::ClassLevelLockable<Log, std::mutex> >
{
    friend class MaNGOS::OperatorNew<Log>;
    Log();

    ~Log()
    {
        for (auto& logFile : logFiles)
        {
            if (logFile != nullptr)
            {
                fclose(logFile);
                logFile = nullptr;
            }
        } 
    }
    public:
        void InitSmartlogEntries(std::string const& str);
        void InitSmartlogGuids(std::string const& str);

        // for general server messages
        void Out(LogType logType, LogLevel logLevel, char const* format, ...) ATTR_PRINTF(4,5);

        // for player-specific messages
        void Player(WorldSession const* session, LogType logType, LogLevel logLevel, char const* format, ...) ATTR_PRINTF(5, 6);
        void Player(WorldSession const* session, LogType logType, char const* subTytpe, LogLevel logLevel, char const* format, ...) ATTR_PRINTF(6, 7);
        void OutWardenPlayer(WorldSession const* session, LogType logType, LogLevel logLevel, char const* format, ...) ATTR_PRINTF(5, 6);
        void Player(uint32 accountId, LogType logType, LogLevel logLevel, char const* format, ...) ATTR_PRINTF(5, 6);
        void Player(uint32 accountId, LogType logType, char const* subTytpe, LogLevel logLevel, char const* format, ...) ATTR_PRINTF(6, 7);

        bool IsSmartLog(uint32 entry, uint32 guid) const;

        uint32 GetConsoleLevel() const { return m_consoleLevel; }
        uint32 GetFileLevel() const { return m_fileLevel; }
        uint32 GetDbLevel() const { return m_dbLevel; }
        void SetConsoleLevel(LogLevel level);
        void SetFileLevel(LogLevel level);

        static std::string GetTimestampStr();
        bool HasLogFilter(uint32 filter) const { return m_logFilter & filter; }
        void SetLogFilter(LogFilters filter, bool on) { if (on) m_logFilter |= filter; else m_logFilter &= ~filter; }
        bool HasLogLevelOrHigher(LogLevel loglvl) const { return m_consoleLevel >= loglvl || (m_fileLevel >= loglvl && logFiles[LOG_BASIC]); }
        bool IsIncludeTime() const { return m_includeTime; }

        static void WaitBeforeContinueIfNeed();


    private:
        void OutConsole(LogType logType, LogLevel logLevel, std::string const& str) const;
        void OutFile(LogType logType, LogLevel logLevel, std::string const& str) const;
        void PlayerLogHeaderToConsole(uint32 accountId, WorldSession const* session, LogType logType, char const* subType);
        void PlayerLogHeaderToFile(uint32 accountId, WorldSession const* session, LogType logType, char const* subType);

        void SetColor(FILE* where, Color color) const;
        void ResetColor(FILE* where) const;

        static void outTime(FILE* where);
        static void outTimestamp(FILE* file);

        FILE* openLogFile(char const* configFileName, char const* defaultFileName, bool timestampFile, bool overwriteOnOpen) const;
        FILE* openGmlogPerAccount(uint32 account) const;

        FILE* logFiles[LOG_TYPE_MAX];

        // log/console control
        LogLevel m_consoleLevel;
        LogLevel m_fileLevel;
        LogLevel m_dbLevel;
        uint16 const m_defaultColor;

        // include timestamp in console output
        bool m_wardenDebug;
        bool m_includeTime;
        uint32 m_logFilter;

        // cache values for after initilization use (like gm log per account case)
        std::string m_logsDir;
        std::string const m_logsTimestamp;

        // char log control
        bool m_charLog_Dump;

        // gm log control
        std::string m_gmlog_filename_format;

        // smart log for logging events (e.g. deaths) of certain entities
        std::unordered_set<uint32> m_smartlogExtraEntries;
        std::unordered_set<uint32> m_smartlogExtraGuids;

};

#define sLog MaNGOS::Singleton<Log>::Instance()

#define DETAIL_FILTER_LOG(F,...)                        \
    do {                                                \
        if (sLog.HasLogLevelOrHigher(LOG_LVL_DETAIL) && !sLog.HasLogFilter(F)) \
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, __VA_ARGS__);                \
    } while(0)

#define DEBUG_FILTER_LOG(F,...)                         \
    do {                                                \
        if (sLog.HasLogLevelOrHigher(LOG_LVL_DEBUG) && !sLog.HasLogFilter(F)) \
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, __VA_ARGS__);                  \
    } while(0)

#endif
