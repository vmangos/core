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

enum ScourgeInvasionSpells
{
    SPELL_SPIRIT_PARTICLES_PURPLE               = 28126, // Purple Minions Aura.

    // Object 181214 Necropolis critter spawner
    SPELL_SUMMON_NECROPOLIS_CRITTERS            = 27866, // Spawns NPCs Necropolis Health and Necropolis.

    // Necropolis Health -> Necropolis
    SPELL_DESPAWNER_OTHER                       = 28349, // Casted by the NPC "Necropolis health" after getting hit by,
                                                         // on the NPC "Necropolis" which destroys itself and the Necropolis Object.

    // Necropolis Health
    SPELL_ZAP_NECROPOLIS                        = 28386, // There are always 3 Necrotic Shards spawns per Necropolis. This Spell is castet on the NPC "Necropolis Health" if a Shard dies and does 40 Physical damage.
                                                         // NPC "Necropolis Health" has 42 health. 42 health / 3 Shards = 14 damage.
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
    SPELL_CREATE_CRYSTAL                        = 28344, // Spawn a Necrotic Shard.
    SPELL_CREATE_CRYSTAL_CORPSE                 = 27895, // Summon (Damaged Necrotic Shard).
    SPELL_CAMP_RECEIVES_COMMUNIQUE              = 28449, // Impact Visual.
    SPELL_COMMUNIQUE_TIMER_CAMP                 = 28346, // Cast on npc_necrotic_shard on spawn? Periodically triggers 28345 Communique Trigger every 35 seconds.
    SPELL_COMMUNIQUE_TRIGGER                    = 28345, // Triggers 28281 SPELL_COMMUNIQUE_CAMP_TO_RELAY via void Spell::EffectDummy.
    SPELL_DAMAGE_CRYSTAL                        = 28041, // 100 Damage (Physical). Casted on itself, if 16143 (Shadow of Doom) spawns.
    SPELL_SOUL_REVIVAL                          = 28681, // Increases all damage caused by 10%.
    SPELL_CAMP_TYPE_GHOST_SKELETON              = 28197, // Camp Type, tells the NPC "Scourge Invasion Minion, finder" which Camp type the Shard has.
    SPELL_CAMP_TYPE_GHOST_GHOUL                 = 28198, // ""
    SPELL_CAMP_TYPE_GHOUL_SKELETON              = 28199, // ""
    SPELL_MINION_SPAWNER_SMALL                  = 27887, // Triggers 27885 (Disturb Minion Trap, small) every 5 seconds. Activates up to 3 unknown Objects wich spawns the Minions.
    SPELL_MINION_SPAWNER_BUTTRESS               = 27888, // Triggers 27886 (Disturb Minion Trap, Buttress) every 1 hour. Activates unknown Objects, They may also spawn the Cultists.
    SPELL_CHOOSE_CAMP_TYPE                      = 28201, // casted by Necrotic Shard.

    // Shard -> Relay
    SPELL_COMMUNIQUE_CAMP_TO_RELAY              = 28281, // Purple bolt Visual (SMALL)
    SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH        = 28351, // Visual when Damaged Necrotic Shard dies.

    // Camp - Minion spawning system
    SPELL_FIND_CAMP_TYPE                        = 28203, // casted by Scourge Invasion Minion, finder.

    // Scourge Invasion Minion, spawner, Ghost/Ghoul
    SPELL_PH_SUMMON_MINION_PARENT_GHOST_GHOUL   = 28183,

    // Scourge Invasion Minion, spawner, Ghost/Skeleton
    SPELL_PH_SUMMON_MINION_PARENT_GHOST_SKELETON = 28184,

    //Scourge Invasion Minion, spawner, Ghoul/Skeleton
    SPELL_PH_SUMMON_MINION_PARENT_GHOUL_SKELETON = 28185,

    SPELL_PH_SUMMON_MINION_TRAP_GHOST_GHOUL     = 27883,
    SPELL_PH_SUMMON_MINION_TRAP_GHOST_SKELETON  = 28186,
    SPELL_PH_SUMMON_MINION_TRAP_GHOUL_SKELETON  = 28187,

    // Minions Spells
    SPELL_ZAP_CRYSTAL                           = 28032, // 15 damage to a Necrotic Shard on death.
    SPELL_SCOURGE_STRIKE                        = 28265, // Pink Lightning (Instakill).
    SPELL_MINION_SPAWN_IN                       = 28234, // Pink Lightning.
    SPELL_SPIRIT_SPAWN_OUT                      = 17680, // Makes invisible.
    SPELL_MINION_DESPAWN_TIMER                  = 28090, // Triggers 28091 (Despawner, self) every 150 seconds. Triggers 17680 SPELL_SPIRIT_SPAWN_OUT via void Spell::EffectDummy.
    SPELL_CONTROLLER_TIMER                      = 28095, // Triggers 28091 (Despawner, self) every 60 seconds for 1 hour. (We don't know who is casting this yet)
    SPELL_DESPAWNER_SELF                        = 28091, // Trigger from Spell above.

    // Minion abilities
    SPELL_ENRAGE                                = 8599,  // Used by 16141 (Ghoul Berserker)
    SPELL_BONE_SHARDS                           = 17014, // [shortest sniff CD: 16,583 seconds] Used by 16299 (Skeletal Shocktrooper)
    SPELL_INFECTED_BITE                         = 7367,  // [shortest sniff CD: 13,307 seconds] Used by 16141 (Ghoul Berserker)
    SPELL_DAZED                                 = 1604,  // [shortest sniff CD: 1,965 seconds] Used by 16141 (Ghoul Berserker), 16299 (Skeletal Shocktrooper)
    SPELL_DEMORALIZING_SHOUT                    = 16244, // [shortest sniff CD: 19,438 seconds] Used by 16298 (Spectral Soldier)
    SPELL_SUNDER_ARMOR                          = 21081, // [shortest sniff CD: 6,489 seconds] Used by 16298 (Spectral Soldier)

    // naxx_event_rewards_giver
    SPELL_CREATE_INF_MARK                       = 28319, // Create Lesser Mark of the Dawn
    SPELL_CREATE_MARK                           = 28320, // Create Mark of the Dawn
    SPELL_CREATE_SUP_MARK                       = 28321, // Create Greater Mark of the Dawn

    // Rare Minions
    SPELL_KNOCKDOWN                             = 16790, // Used by 14697 (Lumbering Horror)
    SPELL_TRAMPLE                               = 5568,  // Used by 14697 (Lumbering Horror)
    SPELL_AURA_OF_FEAR                          = 28313, // Used by 14697 (Lumbering Horror)
    SPELL_RIBBON_OF_SOULS                       = 16243, // [shortest sniff CD: 1,638 seconds] Used by 16379 (Spirit of the Damned)
    SPELL_MINION_DESPAWN_TIMER_UNCOMMON         = 28292, // Triggers 28091 (Despawner, self) every 10 minutes. Triggers 17680 SPELL_SPIRIT_SPAWN_OUT via void Spell::EffectDummy.

    // Cultist Engineer
    SPELL_CREATE_SUMMONER_SHIELD                = 28132, // Summon Object - Temporary (181142),
                                                         // Casted exactly the same time with 28234 (Minion Spawn-in) on spawn.
    SPELL_BUTTRESS_CHANNEL                      = 28078, // Channeled by Cultist Engineer on Damaged Necrotic Shard shortly after spawning.
    SPELL_BUTTRESS_TRAP                         = 28054, // Unknown.
    SPELL_KILL_SUMMONER_SUMMON_BOSS             = 28250, // Reagents, 1 Necrotic Rune
                                                         
    // Probably spells used to spawn Shadow of Doom.        Casting sequence (All those spells are casted within 1-2 seconds):
    SPELL_PH_KILL_SUMMONER_BUFF                 = 27852, // [1] Casted by Cultist on Player.
    SPELL_KILL_SUMMONER_WHO_WILL_SUMMON_BOSS    = 27894, // [2] Casted by Player on Cultist.
    SPELL_QUIET_SUICIDE                         = 3617,  // [3] Instakill, casted exactly same time as 31316 (Summon Boss Buff).
    SPELL_SUMMON_BOSS_BUFF                      = 31316, // [4] Summon Boss Buff, casted on Player
    SPELL_SUMMON_BOSS                           = 31315, // [5] Reagents, 8 Necrotic Rune, Summon (Shadow of Doom) for 1 hour.

    // Shadow of Doom
    SPELL_SPAWN_SMOKE                           = 10389, // Spawning Visual.
    SPELL_ZAP_CRYSTAL_CORPSE                    = 28056, // Casted on Shard if Shadow of Doom dies.
    SPELL_MINDFLAY                              = 16568,
    SPELL_FEAR                                  = 12542,

    /*
    This spells are not ued by any NPC or object in the sniff files.
    The [PH] in the name means it's a placeholder. Blizzard often adds that to the names of things they add to the game but haven't finalized.
    The fact that the [PH] is still there means the quest was never finished. (Google)
        SPELL_PH_GET_TOKEN                          = 27922, // Create Item "Necrotic Rune".
        SPELL_PH_BUTTRESS_ACTIVATOR                 = 28086,
        SPELL_PH_CRYSTAL_CORPSE_DESPAWN             = 28020,
        SPELL_PH_CRYSTAL_CORPSE_TIMER               = 28018, // Triggers 28020 ([PH] Crystal Corpse Despawn) after 2 hours.
        SPELL_PH_CYSTAL_BAZOOKA                     = 27849,
        SPELL_PH_SUMMON_BUTTRESS                    = 28024, // Summon (Cultist Engineer) for 1 hour.
    */
};

enum ScourgeInvasionNPC
{
    // Mouth of Kel'Thuzad
    NPC_MOUTH_OF_KELTHUZAD                              = 16995,

    // Visible NPCs
    NPC_NECROTIC_SHARD                                  = 16136,
    NPC_DAMAGED_NECROTIC_SHARD                          = 16172,
    NPC_CULTIST_ENGINEER                                = 16230,
    NPC_SHADOW_OF_DOOM                                  = 16143,

    // Camp Helpers (invisible)
    NPC_SCOURGE_INVASION_MINION_FINDER                  = 16356, // casting 28203 (Find Camp Type).
    NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_GHOUL     = 16306,
    NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_SKELETON  = 16336,
    NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOUL_SKELETON  = 16338,

    // Necropolis Helpers (invisible)
    NPC_NECROPOLIS                                      = 16401,
    NPC_NECROPOLIS_HEALTH                               = 16421,
    NPC_NECROPOLIS_PROXY                                = 16398,
    NPC_NECROPOLIS_RELAY                                = 16386,

    // Minions
    NPC_SKELETAL_SHOCKTROOPER                           = 16299,
    NPC_GHOUL_BERSERKER                                 = 16141,
    NPC_SPECTRAL_SOLDIER                                = 16298,

    // Rare Minions
    NPC_LUMBERING_HORROR                                = 14697,
    NPC_BONE_WITCH                                      = 16380,
    NPC_SPIRIT_OF_THE_DAMNED                            = 16379,

    NPC_ARGENT_DAWN_REW_GIVER_1H                        = 16384, // Argent Dawn Initiate <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_2H                        = 16435, // Argent Dawn Cleric <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_3H                        = 16436, // Argent Dawn Priest <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_1A                        = 16395, // Argent Dawn Paladin <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_2A                        = 16433, // Argent Dawn Crusader <The Argent Dawn>
    NPC_ARGENT_DAWN_REW_GIVER_3A                        = 16434, // Argent Dawn Champion <The Argent Dawn>

    // Low level Minions
    NPC_SKELETAL_TROOPER                                = 16438,
    NPC_SPECTRAL_SPIRIT                                 = 16437,
    NPC_SKELETAL_SOLDIER                                = 16422,
    NPC_SPECTRAL_APPARITATION                           = 16423
};

enum ScourgeInvasionMisc
{
    ITEM_NECROTIC_RUNE                      = 22484,

    // Invisible Objects
    GOBJ_BUTTRESS_TRAP                      = 181112, // [Guessed] Object is not in Sniffs or any Database such as WoWHead.

    GOBJ_SUMMON_MINION_TRAP_GHOST_GHOUL     = 181111, // Object is not in Sniffs or any Database such as WoWHead, but spell 28196 (Create Minion Trap: Ghost/Skeleton) summons it.
    GOBJ_SUMMON_MINION_TRAP_GHOST_SKELETON  = 181155, // ""
    GOBJ_SUMMON_MINION_TRAP_GHOUL_SKELETON  = 181156, // ""

    // Visible Objects
    GOBJ_SUMMON_CIRCLE                      = 181136,
    GOBJ_SUMMONER_SHIELD                    = 181142,

    GOBJ_UNDEAD_FIRE                        = 181173,
    GOBJ_UNDEAD_FIRE_AURA                   = 181174,
    GOBJ_SKULLPILE_01                       = 181191,
    GOBJ_SKULLPILE_02                       = 181192,
    GOBJ_SKULLPILE_03                       = 181193,
    GOBJ_SKULLPILE_04                       = 181194,

    GOBJ_NECROPOLIS_TINY                    = 181154, // Necropolis (scale 1.0)
    GOBJ_NECROPOLIS_SMALL                   = 181373, // Necropolis (scale 1.5)
    GOBJ_NECROPOLIS_MEDIUM                  = 181374, // Necropolis (scale 2.0)
    GOBJ_NECROPOLIS_BIG                     = 181215, // Necropolis (scale 2.5)
    GOBJ_NECROPOLIS_HUGE                    = 181223, // Necropolis (scale 3.5)
    GOBJ_NECROPOLIS_CITY                    = 181172, // Necropolis at the Citys (scale 2.5)

//#ifdef DEBUG_WORLD_EVENT
//    NECROPOLIS_ATTACK_TIMER = 60 * 5, // 5min from 
//#else
    // The change of zone takes 4 hours
    //NECROPOLIS_ATTACK_TIMER     = 60 * 60, // 1 hour
    NECROPOLIS_ATTACK_TIMER     = 60 * 5, // 5min from 
//#endif

    ZONEID_WINTERSPRING         = 618,
    ZONEID_AZSHARA              = 16,
    ZONEID_EASTERN_PLAGUELANDS  = 139,
    ZONEID_BLASTED_LANDS        = 4,
    ZONEID_BURNING_STEPPES      = 46,
    ZONEID_TANARIS              = 440,

    GAME_EVENT_SCOURGE_INVASION                         = 17,
    GAME_EVENT_SCOURGE_INVASION_WINTERSPRING            = 90,
    GAME_EVENT_SCOURGE_INVASION_TANARIS                 = 91,
    GAME_EVENT_SCOURGE_INVASION_AZSHARA                 = 92,
    GAME_EVENT_SCOURGE_INVASION_BLASTED_LANDS           = 93,
    GAME_EVENT_SCOURGE_INVASION_EASTERN_PLAGUELANDS     = 94,
    GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES         = 95,
    GAME_EVENT_SCOURGE_INVASION_50_INVASIONS            = 96,
    GAME_EVENT_SCOURGE_INVASION_100_INVASIONS           = 97,
    GAME_EVENT_SCOURGE_INVASION_150_INVASIONS           = 98,
    GAME_EVENT_SCOURGE_INVASION_INVASIONS_DONE          = 99,
};

enum ScourgeInvasionNPCEvents
{
    EVENT_SHARD_MINION_SPAWNER_SMALL        = 1,
    EVENT_SHARD_MINION_SPAWNER_BUTTRESS     = 2,
    EVENT_SPAWNER_SUMMON_MINION             = 3,
    EVENT_SHARD_FIND_DAMAGED_SHARD          = 4,
    EVENT_CULTIST_CHANNELING                = 5,
    EVENT_MOUTH_OF_KELTHUZAD_YELL           = 6,
    EVENT_MOUTH_OF_KELTHUZAD_ZONE_START     = 7,
    EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP      = 8,
    EVENT_MOUTH_OF_KELTHUZAD_UPDATE         = 9,

    // Shadow of Doom Events
    EVENT_DOOM_MINDFLAY                     = 20,
    EVENT_DOOM_FEAR                         = 21,
    EVENT_DOOM_START_ATTACK                 = 22,

    // Rare Events 
    EVENT_RARE_KNOCKDOWN                    = 31,
    EVENT_RARE_TRAMPLE                      = 32,
    EVENT_RARE_RIBBON_OF_SOULS              = 33,

    // Minion Events
    EVENT_MINION_ENRAGE                     = 40,
    EVENT_MINION_BONE_SHARDS                = 41,
    EVENT_MINION_INFECTED_BITE              = 42,
    EVENT_MINION_DAZED                      = 43,
    EVENT_MINION_DEMORALIZING_SHOUT         = 44,
    EVENT_MINION_SUNDER_ARMOR               = 45,
};

enum ScourgeInvasionWorldStatesVariables
{
    // Worldstates
    WORLDSTATE_WINTERSPRING                     = 0x08D3, // 2259 - Icon on map
    WORLDSTATE_AZSHARA                          = 0x08D4, // 2260 - Icon on map
    WORLDSTATE_EASTERN_PLAGUELANDS              = 0x08D8, // 2264 - Icon on map
    WORLDSTATE_BLASTED_LANDS                    = 0x08D5, // 2261 - Icon on map
    WORLDSTATE_BURNING_STEPPES                  = 0x08D6, // 2262 - Icon on map
    WORLDSTATE_TANARIS                          = 0x08D7, // 2263 - Icon on map

    WORLDSTATE_SI_BATTLES_WON                   = 2219, // We have won $2219W battles against the Scourge.  Gird yourself, $n, for this war is far from over. & We have won $2219W battles against the Scourge.  Take heart, $n.  While many battles lie ahead, heroes, heroes from every realm have risen to fight them. & We have won $2219W battles against the Scourge.  Stand firm, $n!  We must persevere!
    WORLDSTATE_SI_AZSHARA_REMAINING             = 2279, // The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    WORLDSTATE_SI_BLASTED_LANDS_REMAINING       = 2280,// The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    WORLDSTATE_SI_BURNING_STEPPES_REMAINING     = 2281, // If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    WORLDSTATE_SI_EASTERN_PLAGUELANDS           = 2282, // The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    WORLDSTATE_SI_TANARIS                       = 2283, // It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    WORLDSTATE_SI_WINTERSPRING                  = 2284, // Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault. Your assistance would help them greatly.$B$BNumber of Necropolises remaining: $2284W

    // Variables
    VARIABLE_NAXX_ATTACK_ZONE1                  = 110,
    VARIABLE_NAXX_ATTACK_ZONE2                  = 111,
    VARIABLE_NAXX_ATTACK_ZONE3                  = 112,
    VARIABLE_NAXX_ATTACK_ZONE4                  = 113,
    VARIABLE_NAXX_ATTACK_ZONE5                  = 114,
    VARIABLE_NAXX_ATTACK_ZONE6                  = 115,
    VARIABLE_NAXX_ATTACK_TIME1                  = 116,
    VARIABLE_NAXX_ATTACK_TIME2                  = 117,
    VARIABLE_NAXX_ATTACK_COUNT                  = 118,

    VARIABLE_NAXX_ELITE_ID                      = 20,
    VARIABLE_NAXX_ELITE_PYLON                   = 21,
    VARIABLE_NAXX_ELITE_SPAWNTIME               = 22,

    VARIABLE_SI_WINTERSPRING_REMAINING          = 30,
    VARIABLE_SI_AZSHARA_REMAINING               = 31,
    VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING   = 32,
    VARIABLE_SI_BLASTED_LANDS_REMAINING         = 33,
    VARIABLE_SI_BURNING_STEPPES_REMAINING       = 34,
    VARIABLE_SI_TANARIS_REMAINING               = 35,

    VARIABLE_AZSHARA_NECROPOLIS_REMAINING               = 16,
    VARIABLE_BLASTED_LANDS_NECROPOLIS_REMAINING         = 4,
    VARIABLE_BURNING_STEPPES_NECROPOLIS_REMAINING       = 46,
    VARIABLE_EASTERN_PLAGUELANDS_NECROPOLIS_REMAINING   = 139,
    VARIABLE_TANARIS_NECROPOLIS_REMAINING               = 440,
    VARIABLE_WINTERSPRING_NECROPOLIS_REMAINING          = 618,
};

enum ScourgeInvasionQuests
{
    QUEST_UNDER_THE_SHADOW                      = 9153,
};

enum ScourgeInvasionLang
{
    LANG_CULTIST_ENGINEER_OPTION                        = 12112, // Use 8 necrotic runes and disrupt his ritual.
    LANG_GIVE_MAGIC_ITEM_OPTION                         = 12302, // Give me one of your magic items.
    //LANG_VICTORIES_COUNT_OPTION                       = NOST_TEXT(127), // Unused
    //LANG_TANARIS_ATTACKED_OPTION                      = NOST_TEXT(128), // Unused
    //LANG_AZSHARA_ATTACKED_OPTION                      = NOST_TEXT(129), // Unused
    //LANG_EP_ATTACKED_OPTION                           = NOST_TEXT(130), // Unused
    //LANG_WINTERSPRING_ATTACKED_OPTION                 = NOST_TEXT(131), // Unused
    //LANG_BL_ATTACKED_OPTION                           = NOST_TEXT(132), // Unused
    //LANG_BS_ATTACKED_OPTION                           = NOST_TEXT(133), // Unused
    //LANG_NO_ATTACK_OPTION                             = NOST_TEXT(134), // Unused
    LANG_SHADOW_OF_DOOM_TEXT_0                          = 12420, // 12420 - Our dark master has noticed your trifling, and sends me to bring a message... of doom!
    LANG_SHADOW_OF_DOOM_TEXT_1                          = 12421, // 12421 - These heroics mean nothing, $c.  Your future is sealed and your soul is doomed to servitude!
    LANG_SHADOW_OF_DOOM_TEXT_2                          = 12422, // 12422 - Your battle here is but the smallest mote of a world wide invasion, whelp!  It is time you learned of the powers you face!
    LANG_SHADOW_OF_DOOM_TEXT_3                          = 12243, // 12243 - You will not stop our deepening shadow, $c.  Now... join us!  Join the ranks of the Chosen!
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_1         = 13121, // Spawn.
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_2         = 13125, // Spawn. 53 min between 2-3 in sniffs.
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_1          = 13165, // Despawn.
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_2          = 13164, // Despawn.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_1                    = 13126, // Random.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_2                    = 13124, // Random.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_3                    = 13122, // 180 seconds between 5-6 in sniffs.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_4                    = 13163, // Random.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_5                    = 13123, // Random. 30 min between 8-2 in sniffs.
    LANG_ARGENT_EMISSARY_OPTION_0                       = 12176, // 12176 - What's happening?
    LANG_ARGENT_EMISSARY_OPTION_1                       = 12207, // 12207 - What can I do?
    LANG_ARGENT_EMISSARY_OPTION_2                       = 12434, // 12434 - Where are we battling the Scourge?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_0          = 12198, // 12198 - Is Winterspring currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_1          = 12201, // 12201 - Is Tanaris currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_2          = 12203, // 12203 - Are the Blasted Lands currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_3          = 12205, // 12205 - Are the Burning Steppes currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_4          = 12476, // 12476 - Is Azshara currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_5          = 12477, // 12477 - Are the Eastern Plaguelands currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_3                       = 12398, // 12398 - How many battles have we won?
    LANG_ARGENT_EMISSARY_OPTION                         = 12478, // 12478 - I have another question.

    LANG_CULTIST_ENGINEER_GOSSIP                        = 8436, // 12111 - This cultist is in a deep trance...
    LANG_ARGENT_DAWN_GOSSIP_0                           = 8525, // 12299 - The battle is won. For the time being, the Scourge threat has been pushed back. Our resources can be channeled into aiding you, in thanks and preparation for the future.
    LANG_ARGENT_DAWN_GOSSIP_1                           = 8526, // 12300 - The battle goes well. The Scourge forces seem weakened. I believe it will only be a matter of time before we drive them from our shores. I will turn my magics to you, to aid in this struggle.
    LANG_ARGENT_DAWN_GOSSIP_2                           = 8527, // 12301 - The first steps of our fight against the Scourge go well. We have had some successes, and hopefully my assistance can aid you in bringing future success to the battle.
    LANG_ARGENT_EMISSARY_GOSSIP                         = 8434, // 12109 - The time has come for Horde and Alliance to look towards Northrend and the invasion of the Lich King. In recent days, territories across Kalimdor and the Eastern Kingdoms have come under attack. Will you take up arms to save your land from destruction at their hands?
    LANG_ARGENT_EMISSARY_AWNSER_0                       = 8471, // 12180 - The tides of war have come again. From the cold north, the Lich King's necropolises have laid siege to
    LANG_ARGENT_EMISSARY_AWNSER_1                       = 8486, // 12209 - The Scourge are establishing small staging points in the places under attack, receiving communications and other assistance from the necropolises that fly overhead. From what we can tell, the only way to root them out is by killing the ground forces that surround the points.
    LANG_ARGENT_EMISSARY_AWNSER_2                       = 8573,  // 12435 - The Lich King brought only small forces to bear against each of Azeroth's capital cities, while their main forces periodically attack the following lands:$B$BAzshara, the Blasted Lands, the Burning Steppes, the Tanaris Desert, the Eastern Plaguelands and Winterspring.
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_0          = 8480, // 12199 - Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault.Your assistance would help them greatly.$B$BNumber of Necropolises remaining : $2284W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_1          = 8482, // 12202 - It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_2          = 8483, // 12204 - The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_3          = 8484, // 12206 - If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_4          = 8593, // 12474 - The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_5          = 8594, // 12475 - The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    LANG_ARGENT_EMISSARY_AWBSER_3_0                     = 8551, // 12399 - We have won $2219W battles against the Scourge.  Gird yourself, $n, for this war is far from over.
    LANG_ARGENT_EMISSARY_AWBSER_3_1                     = 8554, // 12402 - We have won $2219W battles against the Scourge.  Take heart, $n.  While many battles lie ahead, heroes, heroes from every realm have risen to fight them.
    LANG_ARGENT_EMISSARY_AWBSER_3_2                     = 8555, // 12403 - We have won $2219W battles against the Scourge.  Stand firm, $n!  We must persevere!
    LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE                = 8481, // For the time being, that area is free of Scourge influence. I fear it will only be a matter of time before they return.
};
