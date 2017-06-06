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

#define DEBUG_WORLD_EVENT = true;

enum ScourgeInvasion
{
    /****************** SPELLS ******************/
    SPELL_COMMUNICATION_NAXXRAMAS = 28395, // Periodically triggers SPELL_COMMUNICATION_TRIGGER
    SPELL_COMMUNICATION_TRIGGER = 28373, // Send visual on all nearby targets
    SPELL_DUMMY_PYLON = 28351, // [Communique, Camp-to-Relay, Death]. Effect DUMMY
    SPELL_ZAP_CRYSTAL = 28032, // [Zap Crystal]. 15 damage.
    SPELL_DAMAGE_CRYSTAL = 28041, // [Damage Crystal]. 100 damage.
    SPELL_CAMP_RECEIVES_COMMUNIQUE = 28449, // [Camp Receives Communique]. Effect DUMMY.
    SPELL_ENGINEER_REPAIR = 28078,
    SPELL_PURPLE_VISUAL = 28126,
    SPELL_DMG_BOOST_AT_PYLON_DEATH = 28681, // [Soul Revival] Increases all damage caused by 10%.
    SPELL_COMMUNIQUE_NECROPOLIS_TO_PROXIES = 28373, // Communique, Necropolis-to-Proxies

    // Trash spells
    SPELL_ENRAGE = 8599,
    SPELL_CONTAGION_OF_ROT = 7102,
    SPELL_SUNDER_ARMOR = 11971,
    SPELL_DEMORALIZING_SHOUT = 27579,
    SPELL_BONE_SHARDS = 17014,
    SPELL_CLEAVE = 15496,
    SPELL_SHADOW_WORD_PAIN = 589,

    // naxx_event_rewards_giver
    SPELL_CREATE_INF_MARK = 28319, // Create Lesser Mark of the Dawn
    SPELL_CREATE_MARK = 28320, // Create Mark of the Dawn
    SPELL_CREATE_SUP_MARK = 28321, // Create Greater Mark of the Dawn

    // High level mobs
    SPELL_FEAR = 12542,
    SPELL_MINDFLAY = 16568,
    SPELL_SCOURGE_STRIKE = 28265,
    SPELL_ARCANE_BOLT = 13748,
    SPELL_RIBBON_OF_SOULS = 16243,
    
    // Cultist Engineer
    SPELL_KILL_SUMMONER_SUMMON_BOSS = 28250, // Reagents, 1 Necrotic Rune
    SPELL_SUMMON_BOSS = 31315, // Reagents, 8 Necrotic Rune

    // Spawn effects
    SPELL_SPAWN_SMOKE_1 = 4335,
    SPELL_SPAWN_SMOKE_2 = 29802,
    SPELL_SPIRIT_SPAWN_IN = 17321,
    SPELL_TELEPORT_VISUAL = 41236,

    // Unused
    SPELL_CREATE_CRYSTAL = 28344, // (NECROTIC_SHARD = 16136) CIRCLE - Gob 181136 CASTS this
    SPELL_SUMMON_NAXXRAMAS_GHOST = 28389,
    SPELL_VISUAL_VOILE_TENEBRES = 28350,

    /****************** NPC ******************/
    NPC_NECROTIC_SHARD = 16136,
    NPC_DAMAGED_NECROTIC_SHARD = 16172,
    NPC_CULTIST_ENGINEER = 16230,
    NPC_SHADOW_OF_DOOM = 16143,

    // Necropolis Helpers
    NPC_NECROPOLIS_PROXY = 16398,
    NPC_NECROPOLIS_HEALTH = 16421,
    NPC_NECROPOLIS_CONTROLLER = 16214,
    NPC_NECROPOLIS_RELAY = 16386,

    // Thrash
    NPC_SKELETAL_SHOCKTROOPER = 16299,
    NPC_GHOUL_BERSERKER = 16141,
    NPC_SPECTRAL_SOLDIER = 16298,

    // Rare spawns
    NPC_LUMBERING_HORROR = 14697,
    NPC_BONE_WITCH = 16380,
    NPC_SPIRIT_OF_THE_DAMNED = 16379,

    NPC_ARGENT_DAWN_REW_GIVER_1H = 16384, // Argent Dawn Initiate <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_2H = 16435, // Argent Dawn Cleric <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_3H = 16436, // Argent Dawn Priest <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_1A = 16395, // Argent Dawn Paladin <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_2A = 16433, // Argent Dawn Crusader <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_3A = 16434, // Argent Dawn Champion <The Argent Dawn>

    // Low level mobs
    NPC_SKELETAL_TROOPER = 16438,
    NPC_SPECTRAL_SPIRIT = 16437,
    NPC_SPECTRAL_APPARITATION = 16423,

    /****************** OTHER ******************/
    ITEM_NECROTIC_RUNE = 22484,

    GOBJ_SUMMON_CIRCLE = 181227,
    GOBJ_NECROPOLIS = 181223,
    MODELID_PYLON_RESET = 16135,
    MODELID_PYLON_DAMAGED = 16136,

    FACTIONID_GHOULS = 38,
    FACTIONID_FRIENDLY = 35,

    ENGINEER_MOD_HEALTH_PER_SEC = 15,

#ifdef DEBUG_WORLD_EVENT
    NECROPOLIS_RESPAWN_TIME = 60 * 5, // 5 min
    NECROPOLIS_ATTACK_TIMER = 10,
    DELAY_ELITE_RESPAWN = 10,
#else
    NECROPOLIS_RESPAWN_TIME = 4 * 24 * 60 * 60, // 4 days
    // The change of zone takes 4 hours
    NECROPOLIS_ATTACK_TIMER = 4 * 60 * 60,
    DELAY_ELITE_RESPAWN = 1 * 60 * 60, // 1 hour
#endif

    ZONEID_WINTERSPRING = 618,
    ZONEID_AZSHARA = 16,
    ZONEID_EASTERN_PLAGUELANDS = 139,
    ZONEID_BLASTED_LANDS = 4,
    ZONEID_BURNING_STEPPES = 46,
    ZONEID_TANARIS = 440,

    GAME_EVENT_SCOURGE_INVASION = 110,

    WORLDSTATE_WINTERSPRING = 0x08D3, // 2259
    WORLDSTATE_AZSHARA = 0x08D4, // 2260
    WORLDSTATE_EASTERN_PLAGUELANDS = 0x08D8, // 2264
    WORLDSTATE_BLASTED_LANDS = 0x08D5, // 2261
    WORLDSTATE_BURNING_STEPPES = 0x08D6, // 2262
    WORLDSTATE_TANARIS = 0x08D7, // 2263

    WORLDSTATE_SI_BATTLES_WON = 2219,

    // unused
    WORLDSTATE_SI_AZSHARA_REMAINING = 2279, // The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    WORLDSTATE_SI_BLASTED_LANDS_REMAINING = 2280,// The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    WORLDSTATE_SI_BURNING_STEPPES_REMAINING = 2281, // If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    WORLDSTATE_SI_EASTERN_PLAGUELANDS = 2282, // The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    WORLDSTATE_SI_TANARIS = 2283, // It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    WORLDSTATE_SI_WINTERGRASP = 2284, // Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault. Your assistance would help them greatly.$B$BNumber of Necropolises remaining: $2284W
};

enum ScourgeInvasionEngineerAI
{
    ENGINEER_AI_ACTION_SET_PYLON,
    ENGINEER_AI_ACTION_ATTACK_START,
};
