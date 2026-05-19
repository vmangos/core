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

#if COMPILER != COMPILER_MICROSOFT
#include <strings.h>
#endif

char const* localeNames[MAX_LOCALE] = {
  "enUS",                                                   // also enGB
  "koKR",
  "frFR",
  "deDE",
  "zhCN",
  "zhTW",
  "esES",
  "esMX",
  "ruRU",
};

// used for search by name or iterate all names
LocaleNameStr const fullLocaleNameList[] =
{
    { "enUS", LOCALE_enUS },
    { "enGB", LOCALE_enUS },
    { "koKR", LOCALE_koKR },
    { "frFR", LOCALE_frFR },
    { "deDE", LOCALE_deDE },
    { "zhCN", LOCALE_zhCN },
    { "zhTW", LOCALE_zhTW },
    { "esES", LOCALE_esES },
    { "esMX", LOCALE_esMX },
    { "ruRU", LOCALE_ruRU },
    { NULL,   LOCALE_enUS }
};

bool StringStartsWithCaseInsensitive(std::string const& str, std::string const& prefix)
{
    std::size_t const n = prefix.length();
    if (str.length() < n)
        return false;
#if COMPILER == COMPILER_MICROSOFT
    return _strnicmp(str.c_str(), prefix.c_str(), n) == 0;
#else
    return strncasecmp(str.c_str(), prefix.c_str(), n) == 0;
#endif
}

LocaleConstant GetLocaleByName(std::string const& name)
{
    for(LocaleNameStr const* itr = &fullLocaleNameList[0]; itr->name; ++itr)
        if (name==itr->name)
            return itr->locale;

    return LOCALE_enUS;                                     // including enGB case
}

LocaleConstant GetDbcLocaleFromDbLocale(DBLocaleConstant localeIndex)
{
    switch (localeIndex)
    {
        case DB_LOCALE_enUS:
            return LOCALE_enUS;
        case DB_LOCALE_frFR:
            return LOCALE_frFR;
        case DB_LOCALE_deDE:
            return LOCALE_deDE;
        case DB_LOCALE_koKR:
            return LOCALE_koKR;
        case DB_LOCALE_zhCN:
            return LOCALE_zhCN;
        case DB_LOCALE_zhTW:
            return LOCALE_zhTW;
        case DB_LOCALE_esES:
            return LOCALE_esES;
        case DB_LOCALE_esMX:
            return LOCALE_esMX; // index exists in dbcs, but no actual client
        case DB_LOCALE_ruRU:
            return LOCALE_enUS; // there are no russian dbcs for vanilla
    }
    return LOCALE_enUS;
}
