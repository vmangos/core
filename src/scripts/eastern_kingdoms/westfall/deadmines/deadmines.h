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

enum DeadMines
{
    // TYPE_* are the index of m_auiEncounter and of the saved instance data: never renumber them
    TYPE_RHAHKZOR             = 0,
    TYPE_SNEED                = 1,
    TYPE_GILNID               = 2,
    TYPE_DEFIAS_ENDDOOR       = 3,
    INSTANCE_DM_MAX_ENCOUNTER = 4,

    DATA_DEFIAS_DOOR = 2, // GetData64

    // Texts
    INST_SAY_ALARM1 = 1148, // You there! Check out that noise.
    INST_SAY_ALARM2 = 1149, // We're under attack! A vast, ye swabs! Repel the invaders!

    // NPCs
    NPC_MR_SMITE         = 646,
    NPC_SNEEDS_SHREDDER  = 642,
    NPC_SNEED            = 643,
    NPC_RHAHKZOR         = 644,
    NPC_GILNID           = 1763,
    NPC_EDWIN_VAN_CLEEF  = 639,
    NPC_DEFIAS_OVERSEER  = 634,

    // GOs
    GO_DOOR1         = 13965,
    GO_DOOR2         = 16400,
    GO_DOOR3         = 16399,
    GUN_POWDER_EVENT = 5000, // EventID
    GO_IRON_CLAD     = 16397,
    GO_DEFIAS_CANNON = 16398,
    GO_DMF_CHEST     = 180024,

    // Quests
    QUEST_FORTUNE_AWAITS = 7938,

    // creature.guid: boss-death patrols (creature_linking FLAG_CANT_SPAWN_IF_BOSS_ALIVE), spawn delayed in C++
    GUID_RHAHK_PATROL_OVERSEER = 79189,
    GUID_RHAHK_PATROL_EVOKER   = 79188,
    GUID_SNEED_PATROL_EVOKER   = 79177,
    GUID_SNEED_PATROL_OVERSEER = 79170,

    // creature.guid: Iron Clad Door alarm runners (random entry Defias Pirate / Defias Squallshaper)
    GUID_IRON_DOOR_ALARM_1 = 79289,
    GUID_IRON_DOOR_ALARM_2 = 79290,
    GUID_IRON_DOOR_ALARM_3 = 79292
};
