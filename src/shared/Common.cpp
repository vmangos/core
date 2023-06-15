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
#include <map>

enum class Locale {
    enUS,
    koKR,
    frFR,
    deDE,
    zhCN,
    zhTW,
    esES,
    esMX,
    ruRU,
    MAX_LOCALE
};

constexpr Locale MAX_LOCALE = Locale::MAX_LOCALE;

const std::map<std::string_view, Locale> localeNames = {
    {"enUS", Locale::enUS},
    {"koKR", Locale::koKR},
    {"frFR", Locale::frFR},
    {"deDE", Locale::deDE},
    {"zhCN", Locale::zhCN},
    {"zhTW", Locale::zhTW},
    {"esES", Locale::esES},
    {"esMX", Locale::esMX},
    {"ruRU", Locale::ruRU}
};

std::optional<Locale> GetLocaleByName(std::string_view name) {
    auto it = localeNames.find(name);
    if (it == localeNames.end()) {
        return std::nullopt;
    }
    return it->second;
}

std::optional<Locale> GetDbcLocaleFromDbLocale(Locale localeIndex) noexcept {
    if (localeIndex < Locale::enUS || localeIndex >= MAX_LOCALE) {
        return std::nullopt;
    }
    return localeIndex;
}
