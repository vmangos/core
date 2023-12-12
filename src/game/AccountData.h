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

#ifndef _ACCDATA_H
#define _ACCDATA_H

#include "Common.h"
#include "Policies/Singleton.h"
#include <string>

namespace OldAccountData // 1.8 and earlier
{
    enum AccountDataType
    {
        GLOBAL_CONFIG_CACHE             = 0,                    // 0x01 g
        GLOBAL_BINDINGS_CACHE           = 1,                    // 0x04 g
        GLOBAL_MACROS_CACHE             = 2,                    // 0x08 g
        PER_CHARACTER_LAYOUT_CACHE      = 3,                    // 0x10 p
        PER_CHARACTER_CHAT_CACHE        = 4,                    // 0x20 p
        NUM_ACCOUNT_DATA_TYPES          = 5
    };

    constexpr uint32 GLOBAL_CACHE_MASK = 0xD;
    constexpr uint32 PER_CHARACTER_CACHE_MASK = 0x30;
}

namespace NewAccountData // 1.9 and later
{
    enum AccountDataType
    {
        GLOBAL_CONFIG_CACHE             = 0,                    // 0x01 g
        PER_CHARACTER_CONFIG_CACHE      = 1,                    // 0x02 p
        GLOBAL_BINDINGS_CACHE           = 2,                    // 0x04 g
        PER_CHARACTER_BINDINGS_CACHE    = 3,                    // 0x08 p
        GLOBAL_MACROS_CACHE             = 4,                    // 0x10 g
        PER_CHARACTER_MACROS_CACHE      = 5,                    // 0x20 p
        PER_CHARACTER_LAYOUT_CACHE      = 6,                    // 0x40 p
        PER_CHARACTER_CHAT_CACHE        = 7,                    // 0x80 p
        NUM_ACCOUNT_DATA_TYPES          = 8
    };

    constexpr uint32 GLOBAL_CACHE_MASK = 0x15;
    constexpr uint32 PER_CHARACTER_CACHE_MASK = 0xEA;
}

inline NewAccountData::AccountDataType ConvertOldAccountDataToNew(uint32 index)
{
    switch (index)
    {
        case OldAccountData::GLOBAL_CONFIG_CACHE:
            return NewAccountData::GLOBAL_CONFIG_CACHE;
        case OldAccountData::GLOBAL_BINDINGS_CACHE:
            return NewAccountData::GLOBAL_BINDINGS_CACHE;
        case OldAccountData::GLOBAL_MACROS_CACHE:
            return NewAccountData::GLOBAL_MACROS_CACHE;
        case OldAccountData::PER_CHARACTER_LAYOUT_CACHE:
            return NewAccountData::PER_CHARACTER_LAYOUT_CACHE;
        case OldAccountData::PER_CHARACTER_CHAT_CACHE:
            return NewAccountData::PER_CHARACTER_CHAT_CACHE;
    }
    return NewAccountData::NUM_ACCOUNT_DATA_TYPES;
}

inline OldAccountData::AccountDataType ConvertNewAccountDataToOld(uint32 index)
{
    switch (index)
    {
        case NewAccountData::GLOBAL_CONFIG_CACHE:
            return OldAccountData::GLOBAL_CONFIG_CACHE;
        case NewAccountData::GLOBAL_BINDINGS_CACHE:
            return OldAccountData::GLOBAL_BINDINGS_CACHE;
        case NewAccountData::GLOBAL_MACROS_CACHE:
            return OldAccountData::GLOBAL_MACROS_CACHE;
        case NewAccountData::PER_CHARACTER_LAYOUT_CACHE:
            return OldAccountData::PER_CHARACTER_LAYOUT_CACHE;
        case NewAccountData::PER_CHARACTER_CHAT_CACHE:
            return OldAccountData::PER_CHARACTER_CHAT_CACHE;
    }
    return OldAccountData::NUM_ACCOUNT_DATA_TYPES;
}

struct AccountData
{
    AccountData() : timestamp(0), data("") {}

    time_t timestamp;
    std::string data;
};

#endif
