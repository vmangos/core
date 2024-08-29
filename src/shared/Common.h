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

#ifndef MANGOSSERVER_COMMON_H
#define MANGOSSERVER_COMMON_H

// config.h needs to be included 1st
#ifdef HAVE_CONFIG_H
#ifdef PACKAGE
#undef PACKAGE
#endif //PACKAGE
#ifdef PACKAGE_BUGREPORT
#undef PACKAGE_BUGREPORT
#endif //PACKAGE_BUGREPORT
#ifdef PACKAGE_NAME
#undef PACKAGE_NAME
#endif //PACKAGE_NAME
#ifdef PACKAGE_STRING
#undef PACKAGE_STRING
#endif //PACKAGE_STRING
#ifdef PACKAGE_TARNAME
#undef PACKAGE_TARNAME
#endif //PACKAGE_TARNAME
#ifdef PACKAGE_VERSION
#undef PACKAGE_VERSION
#endif //PACKAGE_VERSION

# include "config.h"
#undef PACKAGE
#undef PACKAGE_BUGREPORT
#undef PACKAGE_NAME
#undef PACKAGE_STRING
#undef PACKAGE_TARNAME
#undef PACKAGE_VERSION
#endif //HAVE_CONFIG_H

#include "Platform/Define.h"

#include "Platform/CompilerDefs.h"
#include "Platform/Define.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <cmath>
#include <cerrno>
#include <csignal>
#include <cassert>

#include <set>
#include <list>
#include <string>
#include <map>
#include <unordered_map>
#include <queue>
#include <sstream>
#include <algorithm>
#include <chrono>

typedef std::chrono::system_clock Clock;
typedef std::chrono::time_point<std::chrono::system_clock, std::chrono::milliseconds> TimePoint;

#if COMPILER == COMPILER_MICROSOFT

#  include <cfloat>

#  define I32FMT "%08I32X"
#  define I64FMT "%016I64X"

#else

#  define stricmp strcasecmp
#  define strnicmp strncasecmp

#  define I32FMT "%08X"
#  if ACE_SIZEOF_LONG == 8
#    define I64FMT "%016lX"
#  else
#    define I64FMT "%016llX"
#  endif /* ACE_SIZEOF_LONG == 8 */

#endif

#include <cinttypes>

#define UI64FMTD "%" PRIu64
#define SI64FMTD "%" PRId64

#define SIZEFMTD "%zu"

/// Will always return a finite float. If the provided float is infinite it will return 0
inline float finiteAlways(float f) { return std::isfinite(f) ? f : 0.0f; }

#define atol(a) strtoul(a, nullptr, 10)

// used for creating values for respawn for example
#define MAKE_PAIR64(l, h)  uint64( uint32(l) | ( uint64(h) << 32 ) )
#define PAIR64_HIPART(x)   (uint32)((uint64(x) >> 32) & uint64(0x00000000FFFFFFFF))
#define PAIR64_LOPART(x)   (uint32)(uint64(x)         & uint64(0x00000000FFFFFFFF))

#define MAKE_PAIR32(l, h)  uint32( uint16(l) | ( uint32(h) << 16 ) )
#define PAIR32_HIPART(x)   (uint16)((uint32(x) >> 16) & 0x0000FFFF)
#define PAIR32_LOPART(x)   (uint16)(uint32(x)         & 0x0000FFFF)

#include "Progression.h"

enum TimeConstants
{
    MINUTE = 60,
    HOUR   = MINUTE*60,
    DAY    = HOUR*24,
    WEEK   = DAY*7,
    MONTH  = DAY*30,
    YEAR   = MONTH*12,
    IN_MILLISECONDS = 1000
};

enum AccountTypes
{
    SEC_PLAYER         = 0,
    SEC_MODERATOR      = 1,
    SEC_TICKETMASTER   = 2,
    SEC_GAMEMASTER     = 3,
    SEC_BASIC_ADMIN    = 4,
    SEC_DEVELOPER      = 5,
    SEC_ADMINISTRATOR  = 6,
    SEC_CONSOLE        = 7                                  // must be always last in list, accounts must have less security level always also
};

// Used in mangosd/realmd
enum RealmFlags
{
    REALM_FLAG_NONE         = 0x00,
    REALM_FLAG_INVALID      = 0x01,
    REALM_FLAG_OFFLINE      = 0x02,
    REALM_FLAG_SPECIFYBUILD = 0x04,                         // client will show realm version in RealmList screen in form "RealmName (major.minor.revision.build)"
    REALM_FLAG_UNK1         = 0x08,
    REALM_FLAG_UNK2         = 0x10,
    REALM_FLAG_NEW_PLAYERS  = 0x20,
    REALM_FLAG_RECOMMENDED  = 0x40,
    REALM_FLAG_FULL         = 0x80
};

// Index returned by GetSessionDbcLocale.
enum LocaleConstant
{
    LOCALE_enUS = 0, // also enGB
    LOCALE_koKR = 1,
    LOCALE_frFR = 2,
    LOCALE_deDE = 3,
    LOCALE_zhCN = 4,
    LOCALE_zhTW = 5,
    LOCALE_esES = 6,

    // no official vanilla clients for these exist
    // the locale strings first appear in the binary in 2.2.0
    LOCALE_esMX = 7, // unused text column exists for this index in dbc files
    LOCALE_ruRU = 8  // did not exist in any way, but has fan made client now (english texts replaced with russian)
};

// Index returned by GetSessionDbLocaleIndex.
enum DBLocaleConstant : int
{
    DB_LOCALE_enUS = -1,
    DB_LOCALE_frFR = 0,
    DB_LOCALE_deDE = 1,
    DB_LOCALE_koKR = 2,
    DB_LOCALE_zhCN = 3,
    DB_LOCALE_zhTW = 4,
    DB_LOCALE_esES = 5,
    DB_LOCALE_esMX = 6,
    DB_LOCALE_ruRU = 7
};

#define MAX_DBC_LOCALE 8
#define MAX_LOCALE 9

LocaleConstant GetLocaleByName(std::string const& name);
LocaleConstant GetDbcLocaleFromDbLocale(DBLocaleConstant localeIndex);

extern char const* localeNames[MAX_LOCALE];

struct LocaleNameStr
{
    char const* name;
    LocaleConstant locale;
};

// used for iterate all names including alternative
extern LocaleNameStr const fullLocaleNameList[];

//operator new[] based version of strdup() function! Release memory by using operator delete[] !
inline char* mangos_strdup(char const* source)
{
    char* dest = new char[strlen(source) + 1];
    strcpy(dest, source);
    return dest;
}

// we always use stdlibc++ std::max/std::min, undefine some not C++ standard defines (Win API and some pother platforms)
#ifdef max
#  undef max
#endif

#ifdef min
#  undef min
#endif

#ifndef M_PI
#  define M_PI          3.14159265358979323846
#endif

#ifndef M_PI_F
#  define M_PI_F        float(M_PI)
#endif

#define BATCHING_INTERVAL 400 // TODO, why is this here? What is "Spell.*Delay" in the config used for then?

#endif
