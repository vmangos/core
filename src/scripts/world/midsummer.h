/*
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

#pragma once

enum MidsummerSpells
{
    // Alliance faction should be 774 and Horde 775.
    SPELL_FESTIVAL_FLAMEKEEPER_DWARF_MALE           = 29245, // Transform (16990).
    SPELL_FESTIVAL_FLAMEKEEPER_HUMAN_FEMALE         = 29246, // Transform (16988).
    SPELL_FESTIVAL_FLAMEKEEPER_TAUREN_FEMALE        = 29244, // Transform (16987).
    SPELL_FESTIVAL_FLAMEKEEPER_TROLL_MALE           = 29243, // Transform (16989).

    SPELL_TEST_RIBBON_POLE_CHANNEL_TRIGGER          = 29710, // Casted on clicking 181605 (Ribbon Pole). (77) Script Effect.
    SPELL_SUMMON_RIBBON_POLE_CRITTER                = 29708, // Summon Wild NPC_RIBBON_POLE_DEBUG_TARGET (17066).
    SPELL_TEST_RIBBON_POLE_CHANNEL_1                = 29705, // Casted on Player and NPC_RIBBON_POLE_DEBUG_TARGET (17066).
    SPELL_TEST_RIBBON_POLE_CHANNEL_2                = 29726,
    SPELL_TEST_RIBBON_POLE_CHANNEL_3                = 29727,

    // ITEM Burning Blossom [23247]
    SPELL_TOSS_FUEL_ON_BONFIRE                      = 28806, // triggers 29338, 29437.

    // NPC Midsummer Bonfire [16592]
    SPELL_FIRE_FESTIVAL_FURY                        = 29846, // AoE crit buff after throwing 3 Burning Blossoms in a short time?
                                                             // Both [x] spells below are being casted together on Death.
    SPELL_BONFIRE_SUPERBUFF                         = 28803, // [1] Triggers SPELL_FIRE_FESTIVAL_FURY (29846)
    SPELL_SUMMON_MIDSUMMER_BONFIRE_FUEL_COUNTER     = 28860, // [2] Summon Wild (16592)
    SPELL_DAMAGE_BONFIRE_DND                        = 29831, /* 50 Fire damage on self after hit by 28806 from Burning Blossom.
                                                                But 28806 has only 42 healt...
                                                                */

    // OBJECT Fire Festival Fury Trap [181431]
    SPELL_FIRE_FESTIVAL_FORTITUDE                   = 29235, // Buffer for Stamina buff in citys. https://classicdb.ch/?object=181431

    // *** Not sniffed, probably not used?
    SPELL_SUMMON_MIDSUMMER_BONFIRE_BUNNIES          = 28784, // Summons 16606, 16592, 181371. Casted by 181288 (Midsummer Bonfire)?
};

enum MidsummerNPC
{
    // Invisible NPCs
    NPC_RIBBON_POLE_DEBUG_TARGET                    = 17066,
    NPC_MIDSUMMER_BONFIRE                           = 16592,
    NPC_MIDSUMMER_BONFIRE_DESPAWNER                 = 16606,
};

enum MidsummerMisc
{
    ITEM_BURNING_BLOSSOM                            = 23247,

    GOBJ_RIBBON_POLE                                = 181605, // The visible Pole.

    // *** Invisible Objects, not in any sniffs (from cmangos)
    GOBJ_TEST_RIBBON_POLE_TRAP                      = 181604, // casts SPELL_SUMMON_RIBBON_POLE_CRITTER (29708).
    GOBJ_MIDSUMMER_BONFIRE_CAMPFIRE_SPELL_FOCUS     = 181377,
    GOBJ_MIDSUMMER_BONFIRE_SPELL_FOCUS              = 181371,
    GOBJ_MIDSUMMER_BONFIRE_SPAWN_TRAP               = 181290,
    GOBJ_MIDSUMMER_BONFIRE_SPAWN_TRAP_2             = 181375,
    GOBJ_MIDSUMMER_BONFIRE_CAMPFIRE_DAMAGE_TRAP     = 181376,
    GOBJ_MIDSUMMER_BONFIRE                          = 181288, // This is necessary as target for ITEM BURNING BLOSSOM.
    GOBJ_FIRE_FESTIVAL_FURY_TRAP                    = 181431 // These are spread over the city's to buff players.
};
