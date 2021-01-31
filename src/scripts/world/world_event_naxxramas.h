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

#pragma once

 // Text nostalrius (nostalrius_string)
#define NOST_TEXT(id) (id+2000010000)

/*
* EVENT_AI UNUSED RN JUST A BACKUP!
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (801, 16386, 0, 8, 0, 100, 1, 28366, -1, 0, 0, 801, 0, 0, 'Necropolis Relay on Spell Hit by Communique, Proxy-to-Relay');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (802, 16386, 0, 8, 0, 100, 1, 28281, -1, 0, 0, 802, 0, 0, 'Necropolis Relay on Spell Hit by Communique, Camp-to-Relay');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (803, 16398, 0, 8, 0, 100, 1, 28373, -1, 0, 0, 803, 0, 0, 'Necropolis Proxy on Spell Hit by Communique, Necropolis-to-Proxies');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (804, 16398, 0, 8, 0, 100, 1, 28365, -1, 0, 0, 804, 0, 0, 'Necropolis Proxy on Spell Hit by Communique, Relay-to-Proxy');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (805, 16136, 0, 8, 0, 100, 1, 28326, -1, 0, 0, 805, 0, 0, 'Necrotic Shard on Spell Hit by Communique, Relay-to-Camp');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (806, 16386, 0, 8, 0, 100, 1, 28351, -1, 0, 0, 806, 0, 0, 'Necropolis Relay on Spell Hit by Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (807, 16398, 0, 8, 0, 100, 1, 28351, -1, 0, 0, 807, 0, 0, 'Necropolis Proxy on Spell Hit by Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (808, 16172, 0, 6, 0, 100, 0, 0, 0, 0, 0, 808, 0, 0, 'Damaged Necrotic Shard on Death Cast by Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (809, 16421, 0, 8, 0, 100, 1, 28351, -1, 0, 0, 809, 0, 0, 'Necropolis health on Spell Hit by Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (810, 16421, 0, 6, 0, 100, 0, 0, 0, 0, 0, 810, 0, 0, 'Necropolis health on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (811, 16401, 0, 8, 0, 100, 1, 28349, -1, 0, 0, 811, 0, 0, 'Necropolis health on Spell Hit by Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (812, 16172, 0, 8, 0, 100, 1, 28326, -1, 0, 0, 805, 0, 0, 'Necrotic Shard on Spell Hit by Communique, Relay-to-Camp');

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (801, 0, 15, 28326, 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay Cast Spell Communique, Relay-to-Camp');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (802, 0, 15, 28365, 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay Cast Spell Communique, Relay-to-Proxy');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (803, 0, 15, 28366, 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy Cast Spell Communique, Proxy-to-Relay');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (804, 0, 15, 28367, 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy Cast Spell Communique, Proxy-to-Necropolis');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (805, 0, 15, 28449, 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necrotic Shard Cast Spell Camp Receives Communique');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (806, 0, 18, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (806, 0, 15, 28351, 2, 0, 0, 16398, 5000, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay Cast Spell Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (807, 0, 18, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy - Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (807, 0, 15, 28351, 2, 0, 0, 16421, 5000, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy Cast Spell Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (808, 0, 15, 28351, 2, 0, 0, 16386, 5000, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard Cast Spell Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (809, 0, 15, 28386, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis health Cast Spell Zap Necropolis');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (810, 5, 81, 0, 0, 0, 0, 181223, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis GameObject Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (810, 5, 81, 0, 0, 0, 0, 181154, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis GameObject Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (810, 5, 81, 0, 0, 0, 0, 181172, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis GameObject Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (810, 5, 81, 0, 0, 0, 0, 181373, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis GameObject Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (810, 5, 81, 0, 0, 0, 0, 181374, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis GameObject Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (810, 0, 15, 28349, 2, 0, 0, 16401, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis - Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (810, 5, 81, 0, 0, 0, 0, 181215, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis GameObject Despawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (811, 0, 18, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'despawn NPC necropolis');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (811, 0, 14, 28395, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'remove Communique Timer, Necropolis');
*/

enum ScourgeInvasionSpells
{
    SPELL_SPIRIT_PARTICLES_PURPLE               = 28126, // Purple Minions Aura.

    // Object 181214 Necropolis critter spawner
    SPELL_SUMMON_NECROPOLIS_CRITTERS            = 27866, // Spawns NPCs Necropolis Health and Necropolis.

    // Necropolis Health -> Necropolis
    SPELL_DESPAWNER_OTHER                       = 28349, // Despawner GameObject Necropolis?

    // Necropolis Health
    SPELL_ZAP_NECROPOLIS                        = 28386, // There are always 3 Necrotic Shards spawns per Necropolis. This Spell is castet on the NPC "Necropolis Health" if a Shard dies and does 40 Physical damage.
                                                         // "Necropolis Health" has 42 health. 42 health / 3 Shards = 14 damage.
                                                         // We have set the armor value from the NPC "Necropolis Health" to 950 to reduce the damage from 40 to 14.

    // Necropolis -> Proxy
    SPELL_COMMUNIQUE_TIMER_NECROPOLIS           = 28395, // Periodically triggers 28373 Communique, Necropolis-to-Proxies every 15 seconds.
    SPELL_COMMUNIQUE_NECROPOLIS_TO_PROXIES      = 28373, // purple bolt Visual (BIG)

    // Proxy -> Necropolis
    SPELL_COMMUNIQUE_PROXY_TO_NECROPOLIS        = 28367, // Purple bolt Visual (SMALL)

    // Proxy -> Relay
    SPELL_COMMUNIQUE_PROXY_TO_RELAY             = 28366, // purple bolt Visual (BIG)

    // Relay -> Proxy
    SPELL_COMMUNIQUE_RELAY_TO_PROXY             = 28365, // Purple bolt Visual (SMALL)

    // Relay -> Shard
    SPELL_COMMUNIQUE_RELAY_TO_CAMP              = 28326, // Purple bolt Visual (BIG)

    // Shard
    CREATE_CRYSTAL                              = 28344, // Spawn a Necrotic Shard.
    CREATE_CRYSTAL_CORPSE                       = 27895, // Spawn a Damaged Necrotic Shard.
    SPELL_CAMP_RECEIVES_COMMUNIQUE              = 28449, // Impact Visual.
    SPELL_COMMUNIQUE_TIMER_CAMP                 = 28346, // Cast on npc_necrotic_shard on spawn? Periodically triggers 28345 Communique Trigger every 35 seconds.
    SPELL_COMMUNIQUE_TRIGGER                    = 28345, // Triggers 28281 SPELL_COMMUNIQUE_CAMP_TO_RELAY via void Spell::EffectDummy.
    SPELL_DAMAGE_CRYSTAL                        = 28041, // 100 damage triggered by (28056) after a Shadow of Doom dies.
    SPELL_SOUL_REVIVAL                          = 28681, // Increases all damage caused by 10%.
    CAMP_TYPE_GHOST_SKELETON                    = 28197, // Camp Type, triggers server side script wich spawns the corresponding Scourge Invasion Minion spawners.
    CAMP_TYPE_GHOST_GHOUL                       = 28198, // ""
    CAMP_TYPE_GHOUL_SKELETON                    = 28199, // ""

    // Shard -> Relay
    SPELL_COMMUNIQUE_CAMP_TO_RELAY              = 28281, // Purple bolt Visual (SMALL)
    SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH        = 28351, // Visual when Damaged Necrotic Shard dies.

    // Camp - Minion spawning system
    CHOOSE_CAMP_TYPE                            = 28201, // used by Necrotic Shard.
    FIND_CAMP_TYPE                              = 28203, // used by Scourge Invasion Minion, finder.
    SUMMON_MINION_PARENT_GHOST_GHOUL            = 28183,
    SUMMON_MINION_PARENT_GHOST_SKELETON         = 28184,
    SUMMON_MINION_PARENT_GHOUL_SKELETON         = 28185,

    // Minions Spells
    SPELL_ZAP_CRYSTAL                           = 28032, // 15 damage to a Shard on death.
    SPELL_SCOURGE_STRIKE                        = 28265, // Pink Lightning (Instakill).
    SPELL_MINION_SPAWN_IN                       = 28234, // Pink Lightning.
    SPELL_SPIRIT_SPAWN_OUT                      = 17680, // Makes invisible.
    SPELL_MINION_DESPAWN_TIMER                  = 28090, // Triggers 28091 (Despawner, self) in 150 seconds. Triggers 17680 SPELL_SPIRIT_SPAWN_OUT via void Spell::EffectDummy.
    CONTROLLER_TIMER                            = 28095, // Triggers 28091 (Despawner, self) in 60 seconds. (We don't know who is casting this yet)
    DESPAWNER_SELF                              = 28091, // Trigger from Spell above.

    // Minion abilities
    SPELL_ENRAGE                                = 8599,  // used by 16141 (Ghoul Berserker)
    SPELL_BONE_SHARDS                           = 17014, // used by 16299 (Skeletal Shocktrooper)
    SPELL_SHADOW_WORD_PAIN                      = 589,

    // naxx_event_rewards_giver
    SPELL_CREATE_INF_MARK                       = 28319, // Create Lesser Mark of the Dawn
    SPELL_CREATE_MARK                           = 28320, // Create Mark of the Dawn
    SPELL_CREATE_SUP_MARK                       = 28321, // Create Greater Mark of the Dawn

    // Rare Minions
    SPELL_ARCANE_BOLT                           = 13748,
    SPELL_RIBBON_OF_SOULS                       = 16243,

    // Cultist Engineer
    SPELL_BUTTRESS_CHANNEL                      = 28078, // Channeled by Cultist Engineer on Damaged Necrotic Shard.
    SPELL_KILL_SUMMONER_SUMMON_BOSS             = 28250, // Reagents, 1 Necrotic Rune
    SPELL_SUMMON_BOSS                           = 31315, // Reagents, 8 Necrotic Rune

    // Shadow of Doom
    SPELL_SPAWN_SMOKE                           = 10389, // Spawning Visual.
    SPELL_FEAR                                  = 12542,
    SPELL_MINDFLAY                              = 16568,
    SPELL_ZAP_CRYSTAL_CORPSE                    = 28056, // Casted on Shard if Doom dies. Triggers (28041)
};

enum ScourgeInvasionNPC
{
    NPC_NECROTIC_SHARD          = 16136,
    NPC_DAMAGED_NECROTIC_SHARD  = 16172,
    NPC_CULTIST_ENGINEER        = 16230,
    NPC_SHADOW_OF_DOOM          = 16143,

    // Camp Helpers
    SCOURGE_INVASION_MINION_FINDER                  = 16356, // casting 28203 (Find Camp Type).
    SCOURGE_INVASION_MINION_SPAWNER_GHOST_GHOUL     = 16306, // casting 28183 ([PH] Summon Minion parent (ghost/ghoul)).
    SCOURGE_INVASION_MINION_SPAWNER_GHOST_SKELETON  = 16336, // casting 28184 ([PH] Summon Minion parent (ghost/skeleton)).
    SCOURGE_INVASION_MINION_SPAWNER_GHOUL_SKELETON  = 16338, // casting 28185 ([PH] Summon Minion parent (ghoul/skeleton)).

    // Necropolis Helpers
    NPC_NECROPOLIS              = 16401,
    NPC_NECROPOLIS_HEALTH       = 16421,
    NPC_NECROPOLIS_PROXY        = 16398,
    NPC_NECROPOLIS_RELAY        = 16386,

    // Minions
    NPC_SKELETAL_SHOCKTROOPER   = 16299,
    NPC_GHOUL_BERSERKER         = 16141,
    NPC_SPECTRAL_SOLDIER        = 16298,

    // Rare Minions
    NPC_LUMBERING_HORROR        = 14697,
    NPC_BONE_WITCH              = 16380,
    NPC_SPIRIT_OF_THE_DAMNED    = 16379,

    NPC_ARGENT_DAWN_REW_GIVER_1H = 16384, // Argent Dawn Initiate <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_2H = 16435, // Argent Dawn Cleric <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_3H = 16436, // Argent Dawn Priest <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_1A = 16395, // Argent Dawn Paladin <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_2A = 16433, // Argent Dawn Crusader <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_3A = 16434, // Argent Dawn Champion <The Argent Dawn>

    // Low level Minions
    NPC_SKELETAL_TROOPER        = 16438,
    NPC_SPECTRAL_SPIRIT         = 16437,
    NPC_SKELETAL_SOLDIER        = 16422,
    NPC_SPECTRAL_APPARITATION   = 16423
};

enum ScourgeInvasionMisc
{
    ITEM_NECROTIC_RUNE          = 22484,

    GOBJ_SUMMON_CIRCLE          = 181227,
    GOBJ_NECROPOLIS             = 181223,

    MODELID_PYLON_RESET         = 16135,
    MODELID_PYLON_DAMAGED       = 16136,

    FACTIONID_GHOULS            = 38,
    FACTIONID_FRIENDLY          = 35,

    ENGINEER_MOD_HEALTH_PER_SEC = 15,

//#ifdef DEBUG_WORLD_EVENT
//    NECROPOLIS_ATTACK_TIMER = 60 * 5, // 5min from 
//#else
    // The change of zone takes 4 hours
    NECROPOLIS_ATTACK_TIMER     = 60 * 60, // 1 hour
//#endif
    ELITE_SPAWN_MINIMUM         = 1000*60*12, // 12min
    ELITE_SPAWN_MAXIMUM         = 1000*60*18, // 18 min
    ELITE_DESPAWN               = 1000*60*15, // 15 min

    ZONEID_WINTERSPRING         = 618,
    ZONEID_AZSHARA              = 16,
    ZONEID_EASTERN_PLAGUELANDS  = 139,
    ZONEID_BLASTED_LANDS        = 4,
    ZONEID_BURNING_STEPPES      = 46,
    ZONEID_TANARIS              = 440,

    GAME_EVENT_SCOURGE_INVASION = 17,
};

enum ScourgeInvasionWorldStatesVariables
{
    // Worldstates
    WORLDSTATE_WINTERSPRING         = 0x08D3, // 2259 - Icon on map
    WORLDSTATE_AZSHARA              = 0x08D4, // 2260 - Icon on map
    WORLDSTATE_EASTERN_PLAGUELANDS  = 0x08D8, // 2264 - Icon on map
    WORLDSTATE_BLASTED_LANDS        = 0x08D5, // 2261 - Icon on map
    WORLDSTATE_BURNING_STEPPES      = 0x08D6, // 2262 - Icon on map
    WORLDSTATE_TANARIS              = 0x08D7, // 2263 - Icon on map

    WORLDSTATE_SI_BATTLES_WON               = 2219, // We have won $2219W battles against the Scourge.  Gird yourself, $n, for this war is far from over. & We have won $2219W battles against the Scourge.  Take heart, $n.  While many battles lie ahead, heroes, heroes from every realm have risen to fight them. & We have won $2219W battles against the Scourge.  Stand firm, $n!  We must persevere!
    WORLDSTATE_SI_AZSHARA_REMAINING         = 2279, // The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    WORLDSTATE_SI_BLASTED_LANDS_REMAINING   = 2280,// The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    WORLDSTATE_SI_BURNING_STEPPES_REMAINING = 2281, // If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    WORLDSTATE_SI_EASTERN_PLAGUELANDS       = 2282, // The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    WORLDSTATE_SI_TANARIS                   = 2283, // It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    WORLDSTATE_SI_WINTERSPRING              = 2284, // Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault. Your assistance would help them greatly.$B$BNumber of Necropolises remaining: $2284W

    // Variables
    VARIABLE_NAXX_ATTACK_ZONE1 = 10,
    VARIABLE_NAXX_ATTACK_ZONE2 = 11,
    VARIABLE_NAXX_ATTACK_TIME1 = 12,
    VARIABLE_NAXX_ATTACK_TIME2 = 13,
    VARIABLE_NAXX_ATTACK_COUNT = 14,

    VARIABLE_NAXX_ELITE_ID          = 15,
    VARIABLE_NAXX_ELITE_PYLON       = 16,
    VARIABLE_NAXX_ELITE_SPAWNTIME   = 17,

    VARIABLE_SI_AZSHARA_REMAINING               = 18,
    VARIABLE_SI_BLASTED_LANDS_REMAINING         = 19,
    VARIABLE_SI_BURNING_STEPPES_REMAINING       = 20,
    VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING   = 21,
    VARIABLE_SI_TANARIS_REMAINING               = 22,
    VARIABLE_SI_WINTERSPRING_REMAINING          = 23
};

enum ScourgeInvasionQuests
{
    QUEST_UNDER_THE_SHADOW = 9153,
};

enum ScourgeInvasionEngineerAI
{
    ENGINEER_AI_ACTION_SET_PYLON,
    ENGINEER_AI_ACTION_ATTACK_START,
};

enum ScourgeInvasionLang
{
    LANG_CULTIST_ENGINEER_OPTION = 12112, // Use 8 necrotic runes and disrupt his ritual.
    LANG_GIVE_MAGIC_ITEM_OPTION = 12302, // Give me one of your magic items.
    //LANG_VICTORIES_COUNT_OPTION = NOST_TEXT(127), // Unused
    //LANG_TANARIS_ATTACKED_OPTION = NOST_TEXT(128), // Unused
    //LANG_AZSHARA_ATTACKED_OPTION = NOST_TEXT(129), // Unused
    //LANG_EP_ATTACKED_OPTION = NOST_TEXT(130), // Unused
    //LANG_WINTERSPRING_ATTACKED_OPTION = NOST_TEXT(131), // Unused
    //LANG_BL_ATTACKED_OPTION = NOST_TEXT(132), // Unused
    //LANG_BS_ATTACKED_OPTION = NOST_TEXT(133), // Unused
    //LANG_NO_ATTACK_OPTION = NOST_TEXT(134), // Unused
    LANG_SHADOW_OF_DOOM_TEST_0 = 12420, // 12420 - Our dark master has noticed your trifling, and sends me to bring a message... of doom!
    LANG_SHADOW_OF_DOOM_TEST_1 = 12422, // 12422 - Your battle here is but the smallest mote of a world wide invasion, whelp!  It is time you learned of the powers you face!
    LANG_ARGENT_EMISSARY_OPTION_0 = 12176, // 12176 - What's happening?
    LANG_ARGENT_EMISSARY_OPTION_1 = 12207, // 12207 - What can I do?
    LANG_ARGENT_EMISSARY_OPTION_2 = 12434, // 12434 - Where are we battling the Scourge?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_0 = 12198, // 12198 - Is Winterspring currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_1 = 12201, // 12201 - Is Tanaris currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_2 = 12203, // 12203 - Are the Blasted Lands currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_3 = 12205, // 12205 - Are the Burning Steppes currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_4 = 12476, // 12476 - Is Azshara currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_5 = 12477, // 12477 - Are the Eastern Plaguelands currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_3 = 12398, // 12398 - How many battles have we won?
    LANG_ARGENT_EMISSARY_OPTION = 12478, // 12478 - I have another question.

    LANG_CULTIST_ENGINEER_GOSSIP = 8436, // 12111 - This cultist is in a deep trance...
    LANG_ARGENT_DAWN_GOSSIP_0 = 8525, // 12299 - The battle is won. For the time being, the Scourge threat has been pushed back. Our resources can be channeled into aiding you, in thanks and preparation for the future.
    LANG_ARGENT_DAWN_GOSSIP_1 = 8526, // 12300 - The battle goes well. The Scourge forces seem weakened. I believe it will only be a matter of time before we drive them from our shores. I will turn my magics to you, to aid in this struggle.
    LANG_ARGENT_DAWN_GOSSIP_2 = 8527, // 12301 - The first steps of our fight against the Scourge go well. We have had some successes, and hopefully my assistance can aid you in bringing future success to the battle.
    LANG_ARGENT_EMISSARY_GOSSIP = 8434, // 12109 - The time has come for Horde and Alliance to look towards Northrend and the invasion of the Lich King. In recent days, territories across Kalimdor and the Eastern Kingdoms have come under attack. Will you take up arms to save your land from destruction at their hands?
    LANG_ARGENT_EMISSARY_AWNSER_0 = 8471, // 12180 - The tides of war have come again. From the cold north, the Lich King's necropolises have laid siege to
    LANG_ARGENT_EMISSARY_AWNSER_1 = 8486, // 12209 - The Scourge are establishing small staging points in the places under attack, receiving communications and other assistance from the necropolises that fly overhead. From what we can tell, the only way to root them out is by killing the ground forces that surround the points.
    LANG_ARGENT_EMISSARY_AWNSER_2 = 8573,  // 12435 - The Lich King brought only small forces to bear against each of Azeroth's capital cities, while their main forces periodically attack the following lands:$B$BAzshara, the Blasted Lands, the Burning Steppes, the Tanaris Desert, the Eastern Plaguelands and Winterspring.
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_0 = 8480, // 12199 - Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault.Your assistance would help them greatly.$B$BNumber of Necropolises remaining : $2284W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_1 = 8482, // 12202 - It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_2 = 8483, // 12204 - The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_3 = 8484, // 12206 - If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_4 = 8593, // 12474 - The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_5 = 8594, // 12475 - The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    LANG_ARGENT_EMISSARY_AWBSER_3_0 = 8551, // 12399 - We have won $2219W battles against the Scourge.  Gird yourself, $n, for this war is far from over.
    LANG_ARGENT_EMISSARY_AWBSER_3_1 = 8554, // 12402 - We have won $2219W battles against the Scourge.  Take heart, $n.  While many battles lie ahead, heroes, heroes from every realm have risen to fight them.
    LANG_ARGENT_EMISSARY_AWBSER_3_2 = 8555, // 12403 - We have won $2219W battles against the Scourge.  Stand firm, $n!  We must persevere!
    LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE = 8481, // For the time being, that area is free of Scourge influence. I fear it will only be a matter of time before they return.
};
