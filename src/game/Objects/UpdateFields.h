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

#ifndef _UPDATEFIELDS_AUTO_H
#define _UPDATEFIELDS_AUTO_H


#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
#include "UpdateFields_1_12_1.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_11_2
#include "UpdateFields_1_11_2.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_10_2
#include "UpdateFields_1_10_2.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_9_4
#include "UpdateFields_1_9_4.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_8_4
#include "UpdateFields_1_8_4.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_7_1
#include "UpdateFields_1_7_1.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
#include "UpdateFields_1_6_1.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_5_1
#include "UpdateFields_1_5_1.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_4_2
#include "UpdateFields_1_4_2.h"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_3_1
#include "UpdateFields_1_3_1.h"
#else
#include "UpdateFields_1_2_4.h"
#endif

enum UpdateFields5875
{
    FIELD_GAMEOBJECT_FLAGS           = 9,
    FIELD_GAMEOBJECT_DYN_FLAGS       = 19,
    FIELD_ITEM_FIELD_FLAGS           = 21,
    FIELD_CORPSE_FIELD_FLAGS         = 35,
    FIELD_CORPSE_FIELD_DYNAMIC_FLAGS = 36,
    FIELD_UNIT_FIELD_FLAGS           = 46,
    FIELD_UNIT_DYNAMIC_FLAGS         = 143,
    FIELD_UNIT_NPC_FLAGS             = 147,
    FIELD_UNIT_FIELD_RESISTANCES     = 155,
    FIELD_UNIT_FIELD_RESISTANCES_01  = 156,
    FIELD_UNIT_FIELD_RESISTANCES_02  = 157,
    FIELD_UNIT_FIELD_RESISTANCES_03  = 158,
    FIELD_UNIT_FIELD_RESISTANCES_04  = 159,
    FIELD_UNIT_FIELD_RESISTANCES_05  = 160,
    FIELD_UNIT_FIELD_RESISTANCES_06  = 161,
    FIELD_UNIT_FIELD_ATTACK_POWER    = 165,
    FIELD_PLAYER_FLAGS               = 190,
};

// We use exact index of update fields in some script commands,
// but they change based on supported build, so fix them here.
inline uint32 GetIndexOfUpdateFieldForCurrentBuild(uint32 db_index)
{
    switch (db_index)
    {
        case FIELD_GAMEOBJECT_FLAGS:
            return GAMEOBJECT_FLAGS;
        case FIELD_GAMEOBJECT_DYN_FLAGS:
            return GAMEOBJECT_DYN_FLAGS;
        case FIELD_UNIT_FIELD_FLAGS:
            return UNIT_FIELD_FLAGS;
        case FIELD_UNIT_DYNAMIC_FLAGS:
            return UNIT_DYNAMIC_FLAGS;
        case FIELD_UNIT_NPC_FLAGS:
            return UNIT_NPC_FLAGS;
        case FIELD_UNIT_FIELD_RESISTANCES:
            return UNIT_FIELD_RESISTANCES;
        case FIELD_UNIT_FIELD_RESISTANCES_01:
            return UNIT_FIELD_RESISTANCES+1;
        case FIELD_UNIT_FIELD_RESISTANCES_02:
            return UNIT_FIELD_RESISTANCES+2;
        case FIELD_UNIT_FIELD_RESISTANCES_03:
            return UNIT_FIELD_RESISTANCES+3;
        case FIELD_UNIT_FIELD_RESISTANCES_04:
            return UNIT_FIELD_RESISTANCES+4;
        case FIELD_UNIT_FIELD_RESISTANCES_05:
            return UNIT_FIELD_RESISTANCES+5;
        case FIELD_UNIT_FIELD_RESISTANCES_06:
            return UNIT_FIELD_RESISTANCES+6;
        case FIELD_UNIT_FIELD_ATTACK_POWER:
            return UNIT_FIELD_ATTACK_POWER;
        case FIELD_PLAYER_FLAGS:
            return PLAYER_FLAGS;
    }

    return db_index;
}

#endif
