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

#ifndef MANGOS_WORLDSTATES_H
#define MANGOS_WORLDSTATES_H

#include "Platform/Define.h"
#include "Progression.h"
#include "ByteBuffer.h"

enum WorldStates 
{
    // Ahn'Qiraj War Effort

    WS_WE_SHARED_COPPERBAR_REQUIRE              = 1998,
    WS_WE_SHARED_PURPLELOTUS_REQUIRE            = 2055,
    WS_WE_SHARED_THICKLEATHER_REQUIRE           = 2071,
    WS_WE_SHARED_SPOTYELLOW_REQUIRE             = 2103,
    WS_WE_SHARED_RUNEBANDAGE_REQUIRE            = 2090,

    WS_WE_ALLIANCE_COPPERBAR_CURRENT            = 1997,
    WS_WE_ALLIANCE_PURPLELOTUS_CURRENT          = 2053,
    WS_WE_ALLIANCE_THICKLEATHER_CURRENT         = 2069,
    WS_WE_ALLIANCE_SPOTYELLOW_CURRENT           = 2101,
    WS_WE_ALLIANCE_RUNEBANDAGE_CURRENT          = 2088,
    WS_WE_ALLIANCE_IRONBAR_CURRENT              = 2002,
    WS_WE_ALLIANCE_IRONBAR_REQUIRE              = 2003,
    WS_WE_ALLIANCE_THORIUMBAR_CURRENT           = 2011,
    WS_WE_ALLIANCE_THORIUMBAR_REQUIRE           = 2012,
    WS_WE_ALLIANCE_ARTHASTEAR_CURRENT           = 2057,
    WS_WE_ALLIANCE_ARTHASTEAR_REQUIRE           = 2058,
    WS_WE_ALLIANCE_STRANGLEKELP_CURRENT         = 2047,
    WS_WE_ALLIANCE_STRANGLEKELP_REQUIRE         = 2048,
    WS_WE_ALLIANCE_LIGHTLEATHER_CURRENT         = 2060,
    WS_WE_ALLIANCE_LIGHTLEATHER_REQUIRE         = 2061,
    WS_WE_ALLIANCE_MEDIUMLEATHER_CURRENT        = 2063,
    WS_WE_ALLIANCE_MEDIUMLEATHER_REQUIRE        = 2064,
    WS_WE_ALLIANCE_ROASTRAPTOR_CURRENT          = 2098,
    WS_WE_ALLIANCE_ROASTRAPTOR_REQUIRE          = 2099,
    WS_WE_ALLIANCE_RBOWALBA_CURRENT             = 2092,
    WS_WE_ALLIANCE_RBOWALBA_REQUIRE             = 2093,
    WS_WE_ALLIANCE_LINENBANDAGE_CURRENT         = 2076,
    WS_WE_ALLIANCE_LINENBANDAGE_REQUIRE         = 2077,
    WS_WE_ALLIANCE_SILKBANDAGE_CURRENT          = 2082,
    WS_WE_ALLIANCE_SILKBANDAGE_REQUIRE          = 2083,

    WS_WE_HORDE_COPPERBAR_CURRENT               = 2018,
    WS_WE_HORDE_PURPLELOTUS_CURRENT             = 2054,
    WS_WE_HORDE_THICKLEATHER_CURRENT            = 2070,
    WS_WE_HORDE_SPOTYELLOW_CURRENT              = 2102,
    WS_WE_HORDE_RUNEBANDAGE_CURRENT             = 2089,
    WS_WE_HORDE_TINBAR_CURRENT                  = 2005,
    WS_WE_HORDE_TINBAR_REQUIRE                  = 2006,
    WS_WE_HORDE_MITHRILBAR_CURRENT              = 2008,
    WS_WE_HORDE_MITRHILBAR_REQUIRE              = 2009,
    WS_WE_HORDE_PEACEBLOOM_CURRENT              = 2021, // Yes, these Peacebloom are intentionally out of order. Thanks Big B
    WS_WE_HORDE_PEACEBLOOM_REQUIRE              = 2020,
    WS_WE_HORDE_FIREBLOOM_CURRENT               = 2050,
    WS_WE_HORDE_FIREBLOOM_REQUIRE               = 2051,
    WS_WE_HORDE_HEAVYLEATHER_CURRENT            = 2066,
    WS_WE_HORDE_HEAVYLEATHER_REQUIRE            = 2067,
    WS_WE_HORDE_RUGGEDLEATHER_CURRENT           = 2073,
    WS_WE_HORDE_RUGGEDLEATHER_REQUIRE           = 2074,
    WS_WE_HORDE_LEANWOLF_CURRENT                = 2095,
    WS_WE_HORDE_LEANWOLF_REQUIRE                = 2096,
    WS_WE_HORDE_BAKEDSALMON_CURRENT             = 2105,
    WS_WE_HORDE_BAKEDSALMON_REQUIRE             = 2106,
    WS_WE_HORDE_WOOLBANDAGE_CURRENT             = 2079,
    WS_WE_HORDE_WOOLBANDAGE_REQUIRE             = 2080,
    WS_WE_HORDE_MAGEBANDAGE_CURRENT             = 2085,
    WS_WE_HORDE_MAGEBANDAGE_REQUIRE             = 2086,

    WS_WE_TRANSITION_DAYS_REMAINING             = 2113,

    // Scourge Invasion

    WS_SI_WINTERSPRING_INVADED                  = 2259, // Icon on map.
    WS_SI_AZSHARA_INVADED                       = 2260, // Icon on map.
    WS_SI_EASTERN_PLAGUELANDS_INVADED           = 2264, // Icon on map.
    WS_SI_BLASTED_LANDS_INVADED                 = 2261, // Icon on map.
    WS_SI_BURNING_STEPPES_INVADED               = 2262, // Icon on map.
    WS_SI_TANARIS_INVADED                       = 2263, // Icon on map.

    WS_SI_BATTLES_WON                           = 2219, // We have won $2219W battles against the Scourge.  Gird yourself, $n, for this war is far from over. & We have won $2219W battles against the Scourge.  Take heart, $n.  While many battles lie ahead, heroes, heroes from every realm have risen to fight them. & We have won $2219W battles against the Scourge.  Stand firm, $n!  We must persevere!
    WS_SI_AZSHARA_REMAINING                     = 2279, // The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    WS_SI_BLASTED_LANDS_REMAINING               = 2280, // The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    WS_SI_BURNING_STEPPES_REMAINING             = 2281, // If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    WS_SI_PLAGUELANDS_REMAINING                 = 2282, // The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    WS_SI_TANARIS_REMAINING                     = 2283, // It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    WS_SI_WINTERSPRING_REMAINING                = 2284, // Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault. Your assistance would help them greatly.$B$BNumber of Necropolises remaining: $2284W

    // Silithus Outdoor PvP

    WS_OPVP_SI_GATHERED_A                       = 2313,
    WS_OPVP_SI_GATHERED_H                       = 2314,
    WS_OPVP_SI_SILITHYST_MAX                    = 2317,

    // Eastern Plaguelands Outdoor PvP

    WS_EASTWALL_TOWER_ALLIANCE                  = 2354, // Blue Tower icon on map
    WS_EASTWALL_TOWER_HORDE                     = 2356, // Red Tower icon on map
    WS_EASTWALL_TOWER_ALLIANCE_PROGRESSING      = 2357, // Blue Tower icon on map
    WS_EASTWALL_TOWER_HORDE_PROGRESSING         = 2358, // Red Tower icon on map
    WS_EASTWALL_TOWER_ALLIANCE_CONTESTED        = 2359, // Grey Tower icon on map
    WS_EASTWALL_TOWER_HORDE_CONTESTED           = 2360, // Grey Tower icon on map
    WS_EASTWALL_TOWER_NEUTRAL                   = 2361, // Grey Tower icon on map

    WS_NORTHPASS_TOWER_ALLIANCE                 = 2372, // Blue Tower icon on map
    WS_NORTHPASS_TOWER_HORDE                    = 2373, // Red Tower icon on map
    WS_NORTHPASS_TOWER_ALLIANCE_PROGRESSING     = 2364, // Blue Tower icon on map
    WS_NORTHPASS_TOWER_HORDE_PROGRESSING        = 2365, // Red Tower icon on map
    WS_NORTHPASS_TOWER_ALLIANCE_CONTESTED       = 2362, // Grey Tower icon on map
    WS_NORTHPASS_TOWER_HORDE_CONTESTED          = 2363, // Grey Tower icon on map
    WS_NORTHPASS_TOWER_NEUTRAL                  = 2352, // Grey Tower icon on map

    WS_PLAGUEWOOD_TOWER_ALLIANCE                = 2370, // Blue Tower icon on map
    WS_PLAGUEWOOD_TOWER_HORDE                   = 2371, // Red Tower icon on map
    WS_PLAGUEWOOD_TOWER_ALLIANCE_PROGRESSING    = 2368, // Blue Tower icon on map
    WS_PLAGUEWOOD_TOWER_HORDE_PROGRESSING       = 2369, // Red Tower icon on map
    WS_PLAGUEWOOD_TOWER_ALLIANCE_CONTESTED      = 2366, // Grey Tower icon on map
    WS_PLAGUEWOOD_TOWER_HORDE_CONTESTED         = 2367, // No Tower icon on map, 2367 is not working client side ".debug send worldstate 2367 1"
    WS_PLAGUEWOOD_TOWER_NEUTRAL                 = 2353, // Grey Tower icon on map

    WS_CROWN_GUARD_TOWER_ALLIANCE               = 2378, // Blue Tower icon on map
    WS_CROWN_GUARD_TOWER_HORDE                  = 2379, // Red Tower icon on map
    WS_CROWN_GUARD_TOWER_ALLIANCE_PROGRESSING   = 2376, // Blue Tower icon on map
    WS_CROWN_GUARD_TOWER_HORDE_PROGRESSING      = 2377, // Red Tower icon on map
    WS_CROWN_GUARD_TOWER_ALLIANCE_CONTESTED     = 2374, // Grey Tower icon on map
    WS_CROWN_GUARD_TOWER_HORDE_CONTESTED        = 2375, // Grey Tower icon on map
    WS_CROWN_GUARD_TOWER_NEUTRAL                = 2355, // Grey Tower icon on map

    WS_UI_TOWER_SLIDER_DISPLAY                  = 2426,
    WS_UI_TOWER_SLIDER_POSITION                 = 2427,
    WS_UI_TOWER_SLIDER_N                        = 2428,

    WS_UI_TOWER_COUNT_ALLIANCE                  = 2327,
    WS_UI_TOWER_COUNT_HORDE                     = 2328,
};

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
inline void WriteInitialWorldStatePair(ByteBuffer& data, uint32 state, int32 value)
#else
inline void WriteInitialWorldStatePair(ByteBuffer& data, uint16 state, int16 value)
#endif
{
    data << state;
    data << value;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
inline void WriteUpdateWorldStatePair(ByteBuffer& data, uint32 state, int32 value)
#else
inline void WriteUpdateWorldStatePair(ByteBuffer& data, uint16 state, int16 value)
#endif
{
    data << state;
    data << value;
}

#endif
