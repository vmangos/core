/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef DEF_ULDAMAN_H
#define DEF_ULDAMAN_H

enum
{
    // Encounters
    ULDAMAN_ENCOUNTER_ALTAR_DOORS   = 0,
    ULDAMAN_ENCOUNTER_STONE_KEEPERS = 1,
    ULDAMAN_ENCOUNTER_ANCIENT_DOOR  = 2,
    ULDAMAN_ENCOUNTER_IRONAYA_DOOR  = 3,
    ULDAMAN_ENCOUNTER_ARCHAEDAS     = 4,
    ULDAMAN_MAX_ENCOUNTER           = 5,
    
    // Data
    DATA_IRONAYA         = 9,
    DATA_ALTAR_DOORS     = 10,
    DATA_ANCIENT_DOOR    = 11,
    DATA_IRONAYA_DOOR    = 12,
    DATA_STONE_KEEPERS   = 13,
    DATA_MINIONS         = 14,
    DATA_IRONAYA_SEAL    = 15,
    DATA_ARCHAEDAS       = 16,
    DATA_KEEPERS_ALTAR   = 17,
    DATA_ARCHAEDAS_ALTAR = 18,
    
    // Altar summoning ritual
    TIMER_ALTAR_SUMMON = 5000, // "Uldaman Boss Aggro" spellid=10340 has 5s cast
    NEEDED_SUMMONERS   = 3,    // 3 in vanilla, 1 since 3.0.8
    FACTION_AWAKE      = 14,   // aggressive
    FACTION_STONED     = 35,   // friendly
    
    // Game Objects
    GO_ALTAR_ARCHAEDAS                 = 133234,
    GO_ALTAR_KEEPERS                   = 130511,
    GO_IRONAYA_SEAL_DOOR               = 124372,
    GO_ARCHAEDAS_TEMPLE_DOOR           = 141869,
    GO_ALTAR_OF_THE_KEEPER_TEMPLE_DOOR = 124367,
    GO_ANCIENT_VAULT_DOOR              = 124369,
    GO_KEYSTONE                        = 124371,
    
    // Npcs
    NPC_ARCHAEDAS          = 2748,
    NPC_STONE_KEEPER       = 4857,
    NPC_EARTHEN_HALLSHAPER = 7077,
    NPC_EARTHEN_GUARDIAN   = 7076,
    NPC_IRONAYA            = 7228,
    NPC_EARTHEN_CUSTODIAN  = 7309,
    NPC_VAULT_WARDER       = 10120,
    
    //Spells
    // Archaedas
    SPELL_GROUND_TREMOR           = 6524,
    // Visuals for stone npcs
    SPELL_STONE_DWARF_AWAKEN      = 10254,
    SPELL_STONED                  = 10255,
    SPELL_AWAKEN_EARTHEN_DWARF    = 10259,
    SPELL_ARCHAEDAS_AWAKEN        = 10347,
    SPELL_AWAKEN_EARTHEN_GUARDIAN = 10252,
    SPELL_AWAKEN_VAULT_WARDER     = 10258,
    /* Not used here, supposed cast from altars summoning ritual objects
    TODO when summoning rituals GO will work.
    SPELL_ULDMANA_BOSS_AGGRO      = 10340,
    SPELL_ULDMANA_SUB_BOSS_AGGRO  = 11568,*/
    // Earthen Custodians
    SPELL_RECONSTRUCT             = 10260,
    // Ironaya
    SPELL_ARCINGSMASH             = 8374,
    SPELL_KNOCKAWAY               = 10101,
    SPELL_WSTOMP                  = 11876,
    // Jadespine Basilisk
    SPELL_CRYSTALLINE_SLUMBER     = 3636,
    // Vault Warder
    SPELL_TRAMPLE                 = 5568,
    // Others
    SPELL_SELF_DESTRUCT           = 9874,
    SPELL_ALTAR_SUMMONING_VISUAL  = 11206,
    
    /* For information, used in db scripts
    NPC_OBSIDIAN_SENTINEL         = 7023,
    SPELL_SPELL_REFLECTION        = 9941,
    SPELL_SUMMON_OBSIDIAN_SHARD   = 10061,
    SPELL_SPLINTERED_OBSIDIAN     = 10072,*/
};

#endif
