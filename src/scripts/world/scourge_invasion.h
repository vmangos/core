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

    // Mouth of Kel'Thuzad?
    SPELL_CANCEL_MOUTH_SPAWNS                   = 29500, // Not sure what it does.

    // GameObject Necropolis
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
    SPELL_PH_SUMMON_MINION_TRAP_GHOST_GHOUL     = 27883,

    // Scourge Invasion Minion, spawner, Ghost/Skeleton
    SPELL_PH_SUMMON_MINION_TRAP_GHOST_SKELETON  = 28186,

    // Scourge Invasion Minion, spawner, Ghoul/Skeleton
    SPELL_PH_SUMMON_MINION_TRAP_GHOUL_SKELETON  = 28187,

    // Minions Spells
    SPELL_ZAP_CRYSTAL                           = 28032, // 15 damage to a Necrotic Shard on death.
    SPELL_MINION_SPAWN_IN                       = 28234, // Pink Lightning.
    SPELL_SPIRIT_SPAWN_OUT                      = 17680, // Makes invisible.
    SPELL_MINION_DESPAWN_TIMER                  = 28090, // Triggers 28091 (Despawner, self) every 150 seconds. Triggers 17680 SPELL_SPIRIT_SPAWN_OUT via void Spell::EffectDummy.
    SPELL_CONTROLLER_TIMER                      = 28095, // Triggers 28091 (Despawner, self) every 60 seconds for 1 hour. (We don't know who is casting this yet)
    SPELL_DESPAWNER_SELF                        = 28091, // Trigger from Spell above.

    // Minion Abilities
    SPELL_SCOURGE_STRIKE                        = 28265, // Pink Lightning (Instakill).
    SPELL_ENRAGE                                = 8599,  // Used by 16141 (Ghoul Berserker)
    SPELL_BONE_SHARDS                           = 17014, // [shortest sniff CD: 16,583 seconds] Used by 16299 (Skeletal Shocktrooper)
    SPELL_INFECTED_BITE                         = 7367,  // [shortest sniff CD: 13,307 seconds] Used by 16141 (Ghoul Berserker)
    SPELL_DEMORALIZING_SHOUT                    = 16244, // [shortest sniff CD: 19,438 seconds] Used by 16298 (Spectral Soldier)
    SPELL_SUNDER_ARMOR                          = 21081, // [shortest sniff CD: 6,489 seconds] Used by 16298 (Spectral Soldier)
    SPELL_SHADOW_WORD_PAIN                      = 589,   // Used by 16438 (Skeletal Trooper)
    SPELL_DUAL_WIELD                            = 674,   // Used by Skeletal Soldier and Skeletal Shocktrooper.

    // Marks of the Dawn
    SPELL_CREATE_LESSER_MARK_OF_THE_DAWN        = 28319, // Create Lesser Mark of the Dawn.
    SPELL_CREATE_MARK_OF_THE_DAWN               = 28320, // Create Mark of the Dawn.
    SPELL_CREATE_GREATER_MARK_OF_THE_DAWN       = 28321, // Create Greater Mark of the Dawn.

    // Rare Minions
    SPELL_KNOCKDOWN                             = 16790, // Used by 14697 (Lumbering Horror)
    SPELL_TRAMPLE                               = 5568,  // Used by 14697 (Lumbering Horror)
    SPELL_AURA_OF_FEAR                          = 28313, // Used by 14697 (Lumbering Horror)
    SPELL_RIBBON_OF_SOULS                       = 16243, // [shortest sniff CD: 1,638 seconds] Used by 16379 (Spirit of the Damned)
    SPELL_PSYCHIC_SCREAM                        = 22884, // or 26042, used by 16379 (Spirit of the Damned)
    SPELL_MINION_DESPAWN_TIMER_UNCOMMON         = 28292, // Triggers 28091 (Despawner, self) every 10 minutes. Triggers 17680 SPELL_SPIRIT_SPAWN_OUT via void Spell::EffectDummy.
    SPELL_ARCANE_BOLT                           = 13748, /* 20720 Used by 16380 (Bone Witch)
                                                         https://classicdb.ch/?npc=16380#abilities says 13748 but 20720 is the only "Arcane Bolt" whichs requires no mana.
                                                         Danage is very high, so i guess it has a very long cd.
                                                         Spell description in the Bestiary is: Hurls a magical bolt at an enemy, inflicting Arcane damage.
                                                         */

    // Cultist Engineer
    SPELL_CREATE_SUMMONER_SHIELD                = 28132, // Summon Object - Temporary (181142),
                                                         // Casted exactly the same time with 28234 (Minion Spawn-in) on spawn.
    SPELL_BUTTRESS_CHANNEL                      = 28078, // Channeled by Cultist Engineer on Damaged Necrotic Shard shortly after spawning.
    SPELL_BUTTRESS_TRAP                         = 28054, // Unknown.
    SPELL_KILL_SUMMONER_SUMMON_BOSS             = 28250, // Reagents, 1 Necrotic Rune
                                                         
    // Probably used to spawn Shadow of Doom.   Casting sequence (All these [x] spells are being casted the following order within 1-2 seconds):
    SPELL_PH_KILL_SUMMONER_BUFF                 = 27852, // [1] Casted by Cultist on Player.
    SPELL_KILL_SUMMONER_WHO_WILL_SUMMON_BOSS    = 27894, // [2] Casted by Player on Cultist.
    SPELL_QUIET_SUICIDE                         = 3617,  // [3] Instakill, casted exactly same time as 31316 (Summon Boss Buff).
    SPELL_SUMMON_BOSS_BUFF                      = 31316, // [4] Summon Boss Buff, casted on Player
    SPELL_SUMMON_BOSS                           = 31315, /* [5] Reagents, 8 Necrotic Rune, Summon (Shadow of Doom) for 1 hour.
                                                             The question is: What happens after this hour if the shadow despawns?
                                                             Do the cultists respawn and channeling again on the damaged shard or
                                                             Does the Necrotic crystal respawn with no cultists / shadows?
                                                             */

    // Shadow of Doom
    SPELL_SPAWN_SMOKE                           = 10389, // Spawning Visual.
    SPELL_ZAP_CRYSTAL_CORPSE                    = 28056, // Casted on Shard if Shadow of Doom dies.
    SPELL_MINDFLAY                              = 16568,
    SPELL_FEAR                                  = 12542,

    // Pallid Horror - Patchwerk Terror (also uses: 28315)
    SPELL_SUMMON_CRACKED_NECROTIC_CRYSTAL       = 28424, // Alliance.
    SPELL_SUMMON_FAINT_NECROTIC_CRYSTAL         = 28699, // Horde.
    SPELL_DAMAGE_VS_GUARDS                      = 28364, // [shortest sniff CD: 11 seconds, longest 81 sec] hits 13839 (Royal Dreadguard)

    // Flameshocker (also uses: 28234, 17680)
    SPELL_FLAMESHOCKERS_TOUCH                   = 28314, // [shortest sniff CD: 30 seconds]
    SPELL_FLAMESHOCKERS_REVENGE                 = 28323, // On death. 
    SPELL_FLAMESHOCKERS_TOUCH2                  = 28329, // [shortest sniff CD: 30 seconds]
    SPELL_FLAMESHOCKER_IMMOLATE_VISUAL          = 28330

    /*
    These spells are not used by any NPCs or GameObjects.
    The [PH] in the name means it's a placeholder. Blizzard often adds that to the names of things they add to the game but haven't finalized.
    The fact that the [PH] is still there means the quest was never finished. (Google)
        SPELL_PH_SUMMON_MINION_PARENT_GHOST_GHOUL       = 28183,
        SPELL_PH_SUMMON_MINION_PARENT_GHOST_SKELETON    = 28184,
        SPELL_PH_SUMMON_MINION_PARENT_GHOUL_SKELETON    = 28185,
        SPELL_PH_GET_TOKEN                              = 27922, // Create Item "Necrotic Rune".
        SPELL_PH_BUTTRESS_ACTIVATOR                     = 28086,
        SPELL_PH_CRYSTAL_CORPSE_DESPAWN                 = 28020,
        SPELL_PH_CRYSTAL_CORPSE_TIMER                   = 28018, // Triggers 28020 ([PH] Crystal Corpse Despawn) after 2 hours.
        SPELL_PH_CYSTAL_BAZOOKA                         = 27849,
        SPELL_PH_SUMMON_BUTTRESS                        = 28024, // Summon (Cultist Engineer) for 1 hour.
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

    // 50 Zones cleared
    NPC_ARGENT_DAWN_INITIATE                            = 16384,
    NPC_ARGENT_DAWN_CLERIC                              = 16435,
    // 100 Zones cleared
    NPC_ARGENT_DAWN_PRIEST                              = 16436,
    NPC_ARGENT_DAWN_PALADIN                             = 16395,
    // 150 Zones cleared
    NPC_ARGENT_DAWN_CRUSADER                            = 16433,
    NPC_ARGENT_DAWN_CHAMPION                            = 16434,

    // Low level Minions
    NPC_SKELETAL_TROOPER                                = 16438,
    NPC_SPECTRAL_SPIRIT                                 = 16437,
    NPC_SKELETAL_SOLDIER                                = 16422,
    NPC_SPECTRAL_APPARITATION                           = 16423,

    // Stormwind - Undercity Attacks https://www.youtube.com/watch?v=c0QjLqHVPRU&t=17s
    NPC_PALLID_HORROR                                   = 16394,
    NPC_PATCHWORK_TERROR                                = 16382,
    NPC_CRACKED_NECROTIC_CRYSTAL                        = 16431,
    NPC_FAINT_NECROTIC_CRYSTAL                          = 16531,
    NPC_FLAMESHOCKER                                    = 16383,
    NPC_HIGHLORD_BOLVAR_FORDRAGON                       = 1748,
    NPC_LADY_SYLVANAS_WINDRUNNER                        = 10181,
    NPC_VARIMATHRAS                                     = 2425,
    NPC_ROYAL_DREADGUARD                                = 13839,
    NPC_STORMWIND_ROYAL_GUARD                           = 1756,
    NPC_UNDERCITY_ELITE_GUARDIAN                        = 16432,
    NPC_UNDERCITY_GUARDIAN                              = 5624,
    NPC_DEATHGUARD_ELITE                                = 7980,
    NPC_STORMWIND_CITY_GUARD                            = 68,
    NPC_STORMWIND_ELITE_GUARD                           = 16396,

    // Citizens
    NPC_MICHAEL_GARRETT                                 = 4551,
    NPC_HANNAH_AKELEY                                   = 4575,
    NPC_INNKEEPER_NORMAN                                = 6741,
    NPC_OFFICER_MALOOF                                  = 15766,
    NPC_STEPHANIE_TURNER                                = 6174,
    NPC_THOMAS_MILLER                                   = 3518,
    NPC_WILLIAM_MONTAGUE                                = 4549
};

enum ScourgeInvasionMisc
{
    ITEM_NECROTIC_RUNE                      = 22484,

    // Invisible Objects
    GOBJ_BUTTRESS_TRAP                      = 181112, // [Guessed] These objects cannot be sniffed and are not available in any database.

    GOBJ_SUMMON_MINION_TRAP_GHOST_GHOUL     = 181111, // Object is not in sniffed files or any database such as WoWHead, but spell 28196 (Create Minion Trap: Ghost/Skeleton) should probably summon them.
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

#ifdef DEBUG_WORLD_EVENT
    NECROPOLIS_ATTACK_TIMER = 60 * 5, // 5min from 
#else
    // The change of zone takes 4 hours
    //NECROPOLIS_ATTACK_TIMER                           = 60 * 60, // 1 hour
    NECROPOLIS_ATTACK_TIMER                             = 60 * 1, // 5 min
    CITY_ATTACK_TIMER                                   = 60 * 1, // 5 min
#endif

    ZONEID_WINTERSPRING                                 = 618,
    ZONEID_AZSHARA                                      = 16,
    ZONEID_EASTERN_PLAGUELANDS                          = 139,
    ZONEID_BLASTED_LANDS                                = 4,
    ZONEID_BURNING_STEPPES                              = 46,
    ZONEID_TANARIS                                      = 440,
    ZONEID_UNDERCITY                                    = 1497,
    ZONEID_STORMWIND                                    = 1519,

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
    GAME_EVENT_SCOURGE_INVASION_INVASIONS_DONE          = 99
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
    EVENT_MINION_ARCANE_BOLT                = 46,
    EVENT_MINION_PSYCHIC_SCREAM             = 47,
    EVENT_MINION_SCOURGE_STRIKE             = 48,
    EVENT_MINION_SHADOW_WORD_PAIN           = 49,

    // Pallid Horror Events 
    EVENT_PALLID_RANDOM_YELL                = 50,
    EVENT_PALLID_SPELL_DAMAGE_VS_GUARDS     = 51,
    EVENT_SYLVANAS_ANSWER_YELL              = 52,
    EVENT_PALLID_RANDOM_SAY                 = 53
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
    WORLDSTATE_SI_BLASTED_LANDS_REMAINING       = 2280, // The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    WORLDSTATE_SI_BURNING_STEPPES_REMAINING     = 2281, // If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    WORLDSTATE_SI_EASTERN_PLAGUELANDS           = 2282, // The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    WORLDSTATE_SI_TANARIS                       = 2283, // It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    WORLDSTATE_SI_WINTERSPRING                  = 2284, // Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault. Your assistance would help them greatly.$B$BNumber of Necropolises remaining: $2284W

    // Variables
    VARIABLE_SI_ATTACK_ZONE1                    = 110,
    VARIABLE_SI_ATTACK_ZONE2                    = 111,
    VARIABLE_SI_ATTACK_ZONE3                    = 112,
    VARIABLE_SI_ATTACK_ZONE4                    = 113,
    VARIABLE_SI_ATTACK_ZONE5                    = 114,
    VARIABLE_SI_ATTACK_ZONE6                    = 115,
    VARIABLE_SI_ATTACK_TIME1                    = 116,
    VARIABLE_SI_ATTACK_TIME2                    = 117,
    VARIABLE_SI_ATTACK_TIME3                    = 118,
    VARIABLE_SI_ATTACK_TIME4                    = 119,
    VARIABLE_SI_ATTACK_TIME5                    = 120,
    VARIABLE_SI_ATTACK_TIME6                    = 121,
    VARIABLE_SI_ATTACK_COUNT                    = 122,
    VARIABLE_SI_UNDERCITY_TIME                  = 123,
    VARIABLE_SI_STORMWIND_TIME                  = 124,

    VARIABLE_SI_WINTERSPRING_REMAINING          = 30,
    VARIABLE_SI_AZSHARA_REMAINING               = 31,
    VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING   = 32,
    VARIABLE_SI_BLASTED_LANDS_REMAINING         = 33,
    VARIABLE_SI_BURNING_STEPPES_REMAINING       = 34,
    VARIABLE_SI_TANARIS_REMAINING               = 35
};

enum ScourgeInvasionQuests
{
    QUEST_UNDER_THE_SHADOW                      = 9153,
    QUEST_CRACKED_NECROTIC_CRYSTAL              = 9292,
    QUEST_FAINT_NECROTIC_CRYSTAL                = 9310
};

enum ScourgeInvasionLang
{
    // Pallid Horror random yelling every 65-300 seconds
    LANG_PALLID_HORROR_YELL1                            = 12329, // What?  This not Naxxramas!  We not like this place... destroy!
    LANG_PALLID_HORROR_YELL2                            = 12327, // Raaarrrrggghhh!  We come for you!
    LANG_PALLID_HORROR_YELL3                            = 12326, // Kel'Thuzad say to tell you... DIE!
    LANG_PALLID_HORROR_YELL4                            = 12342, // Why you run away? We make your corpse into Scourge.
    LANG_PALLID_HORROR_YELL5                            = 12343, // No worry, we find you.
    LANG_PALLID_HORROR_YELL6                            = 12330, // You spare parts!  We make more Scourge in necropolis.
    LANG_PALLID_HORROR_YELL7                            = 12328, // Hahaha, your guards no match for Scourge!
    LANG_PALLID_HORROR_YELL8                            = 12325, // We come destroy puny ones!

    // Undercity Guardian
    LANG_UNDERCITY_GUARDIAN_ROGUES_QUARTER              = 12336, // Rogues' Quarter attacked by Scourge!  Help!
    LANG_UNDERCITY_GUARDIAN_MAGIC_QUARTER               = 12335, // Scourge attack Magic Quarter!
    LANG_UNDERCITY_GUARDIAN_TRADE_QUARTER               = 12353, // There Scourge outside Trade Quarter!
    LANG_UNDERCITY_GUARDIAN_SEWERS                      = 12334, // Scourge in sewers!  We need help!

    // Undercity Elite Guardian
    LANG_UNDERCITY_ELITE_GUARDIAN_1                     = 12354, // Scourge inside Trade Quarter!  Destroy!

    // Royal Dreadguard
    LANG_UNDERCITY_ROYAL_DREADGUARD_1                   = 12337, // The Scourge are at the entrance to the Royal Quarter!  Kill them!!

    // Varimathras
    LANG_UNDERCITY_VARIMATHRAS_1                        = 12333, // Dreadguard, hold your line.  Halt the advance of those Scourge!

    // Lady Sylvanas Windrunner
    LANG_UNDERCITY_SYLVANAS_1                           = 12331, // The Scourge attack against my court has been eliminated.  You may go about your business.
    LANG_UNDERCITY_SYLVANAS_2                           = 12332, // My Royal Dreadguard, you will deal with this matter as befits your station.  That, or you will wish that you had.

    // Citizens
    LANG_UNDERCITY_RANDOM_1                             = 12355, // Scourge spotted nearby!
    LANG_STORMWIND_RANDOM_1                             = 12366, // Scourge spotted nearby! Renato Gallina
    LANG_UNDERCITY_RANDOM_2                             = 12356, // I just saw a Scourge!  Kill it!
    LANG_STORMWIND_RANDOM_2                             = 12367, // I just saw a Scourge!  Kill it! Thomas Miller
    LANG_UNDERCITY_RANDOM_3                             = 12357, // Did you see that?  There's a Scourge over there! Michael Garrett, Hannah Akeley
    LANG_STORMWIND_RANDOM_3                             = 12368, // Did you see that?  There's a Scourge over there! Thomas Miller
    LANG_UNDERCITY_RANDOM_4                             = 12359, // There's one of the Scourge, right over there! Innkeeper Norman, Michael Garrett
    LANG_STORMWIND_RANDOM_4                             = 12370, // There's one of the Scourge, right over there!
    LANG_UNDERCITY_RANDOM_5                             = 12357, // Did you see that?  There's a Scourge over there! Michael Garrett, Hannah Akeley
    LANG_STORMWIND_RANDOM_5                             = 12368, // Did you see that?  There's a Scourge over there! Thomas Miller
    LANG_UNDERCITY_RANDOM_6                             = 12361, // Will these unrelenting Scourge attacks never end? Innkeeper Norman, William Montague
    LANG_STORMWIND_RANDOM_6                             = 12372, // Will these unrelenting Scourge attacks never end?
    LANG_UNDERCITY_RANDOM_7                             = 12360, // This has gone too far.  How dare the Scourge attack Undercity!  Destroy it before more come! Innkeeper Norman
    LANG_STORMWIND_RANDOM_7                             = 12371, // This has gone too far.  How dare the Scourge attack Stormwind!  Destroy it before more come! Stephanie Turner
    LANG_UNDERCITY_RANDOM_8                             = 12362, // Destroy the Scourge invader now, before it's too late! Michael Garrett
    LANG_STORMWIND_RANDOM_8                             = 12373, // Destroy the Scourge invader now, before it's too late! Officer Maloof
    LANG_UNDERCITY_RANDOM_9                             = 12358, // How can I get anything done with the Scourge running amok in here?! Innkeeper Norman
    LANG_STORMWIND_RANDOM_9                             = 12369, // How can I get anything done with the Scourge running amok around here?! Stephanie Turner

    // Stormwind City Guard
    LANG_STORMWIND_CITY_GUARD_1                         = 12310, // To arms!  Scourge spotted in the Cathedral of Light!
    LANG_STORMWIND_CITY_GUARD_2                         = 12311, // Scourge in the Trade District!  Have at them!
    LANG_STORMWIND_CITY_GUARD_3                         = 12315, // Light help us... the Scourge are in the Park!

    // Stormwind Royal Guard
    LANG_STORMWIND_CITY_GUARD_4                         = 12316, // The Scourge are at the castle entrance!  For Stormwind!  For King Anduin!

    // Highlord Bolvar Fordragon?
    LANG_STORMWIND_BOLVAR_1                             = 12317, // Hold the line!  Protect the King at all costs!
    LANG_STORMWIND_BOLVAR_2                             = 12318, // Good work, one and all!  The Scourge at the castle have been defeated.

    // Misc
    LANG_CULTIST_ENGINEER_OPTION                        = 12112, // Use 8 necrotic runes and disrupt his ritual.
    LANG_GIVE_MAGIC_ITEM_OPTION                         = 12302, // Give me one of your magic items.
    LANG_SHADOW_OF_DOOM_TEXT_0                          = 12420, // Our dark master has noticed your trifling, and sends me to bring a message... of doom!
    LANG_SHADOW_OF_DOOM_TEXT_1                          = 12421, // These heroics mean nothing, $c.  Your future is sealed and your soul is doomed to servitude!
    LANG_SHADOW_OF_DOOM_TEXT_2                          = 12422, // Your battle here is but the smallest mote of a world wide invasion, whelp!  It is time you learned of the powers you face!
    LANG_SHADOW_OF_DOOM_TEXT_3                          = 12243, // You will not stop our deepening shadow, $c.  Now... join us!  Join the ranks of the Chosen!
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_1         = 13121, // Spawn.
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_2         = 13125, // Spawn. 53 min between 2-3 in sniffs.
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_1          = 13165, // Despawn.
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_2          = 13164, // Despawn.
    LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_3          = 13163, // Despawn.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_1                    = 13126, // Random.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_2                    = 13124, // Random.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_3                    = 13122, // 180 seconds between 5-6 in sniffs.
    LANG_MOUTH_OF_KELTHUZAD_RANDOM_4                    = 13123, // Random. 30 min between 8-2 in sniffs.
    LANG_ARGENT_EMISSARY_OPTION_0                       = 12176, // What's happening?
    LANG_ARGENT_EMISSARY_OPTION_1                       = 12207, // What can I do?
    LANG_ARGENT_EMISSARY_OPTION_2                       = 12434, // Where are we battling the Scourge?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_0          = 12198, // Is Winterspring currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_1          = 12201, // Is Tanaris currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_2          = 12203, // Are the Blasted Lands currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_3          = 12205, // Are the Burning Steppes currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_4          = 12476, // Is Azshara currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_5          = 12477, // Are the Eastern Plaguelands currently under attack?
    LANG_ARGENT_EMISSARY_OPTION_3                       = 12398, // How many battles have we won?
    LANG_ARGENT_EMISSARY_OPTION                         = 12478, // I have another question.

    LANG_CULTIST_ENGINEER_GOSSIP                        = 8436, // 12111 - This cultist is in a deep trance...
    LANG_ARGENT_DAWN_GOSSIP_150_WINS                    = 8525, // 12299 - The battle is won. For the time being, the Scourge threat has been pushed back. Our resources can be channeled into aiding you, in thanks and preparation for the future.
    LANG_ARGENT_DAWN_GOSSIP_100_WINS                    = 8526, // 12300 - The battle goes well. The Scourge forces seem weakened. I believe it will only be a matter of time before we drive them from our shores. I will turn my magics to you, to aid in this struggle.
    LANG_ARGENT_DAWN_GOSSIP_50_WINS                     = 8527, // 12301 - The first steps of our fight against the Scourge go well. We have had some successes, and hopefully my assistance can aid you in bringing future success to the battle.
    LANG_ARGENT_EMISSARY_GOSSIP                         = 8434, // 12109 - The time has come for Horde and Alliance to look towards Northrend and the invasion of the Lich King. In recent days, territories across Kalimdor and the Eastern Kingdoms have come under attack. Will you take up arms to save your land from destruction at their hands?
    LANG_ARGENT_EMISSARY_AWNSER_0                       = 8471, // 12180 - The tides of war have come again. From the cold north, the Lich King's necropolises have laid siege to
    LANG_ARGENT_EMISSARY_AWNSER_1                       = 8486, // 12209 - The Scourge are establishing small staging points in the places under attack, receiving communications and other assistance from the necropolises that fly overhead. From what we can tell, the only way to root them out is by killing the ground forces that surround the points.
    LANG_ARGENT_EMISSARY_AWNSER_2                       = 8573, // 12435 - The Lich King brought only small forces to bear against each of Azeroth's capital cities, while their main forces periodically attack the following lands:$B$BAzshara, the Blasted Lands, the Burning Steppes, the Tanaris Desert, the Eastern Plaguelands and Winterspring.
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_0          = 8480, // 12199 - Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault.Your assistance would help them greatly.$B$BNumber of Necropolises remaining : $2284W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_1          = 8482, // 12202 - It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_2          = 8483, // 12204 - The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_3          = 8484, // 12206 - If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_4          = 8593, // 12474 - The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_5          = 8594, // 12475 - The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    LANG_ARGENT_EMISSARY_AWBSER_3_0                     = 8551, // 12399 - We have won $2219W battles against the Scourge.  Gird yourself, $n, for this war is far from over.
    LANG_ARGENT_EMISSARY_AWBSER_3_1                     = 8554, // 12402 - We have won $2219W battles against the Scourge.  Take heart, $n.  While many battles lie ahead, heroes, heroes from every realm have risen to fight them.
    LANG_ARGENT_EMISSARY_AWBSER_3_2                     = 8555, // 12403 - We have won $2219W battles against the Scourge.  Stand firm, $n!  We must persevere!
    LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE                = 8481  // For the time being, that area is free of Scourge influence. I fear it will only be a matter of time before they return.
};

struct Waypoint
{
    float x, y, z;
};

/*
UNDERCITY:
    We have tons of sniffs from Undercity attacks but none of them provided a fully useful path.
    It was so buggy on Classic, they sometimes walked through the slime/walls or was being teleported.
    I just used existing points and made a smoother path out from them to avoid glitches.
    Even do the guard spawns are all sniffed positions.

STORMWIND:
    Only 2 sniffs: One contains the spawning in the cathedral
*/

static Waypoint UC_ROYAL_QUARTER[82] =
{
    { 1596.72f, 423.488f, -46.3713f },
    { 1603.8f, 423.409f, -46.3814f },
    { 1615.01f, 423.43f, -53.2855f },
    { 1630.79f, 417.648f, -62.1775f },
    { 1642.62f, 413.764f, -61.6205f },
    { 1663.95f, 406.928f, -62.2001f },
    { 1679.64f, 402.133f, -62.2674f },
    { 1693.81f, 396.803f, -62.2956f },
    { 1703.9f, 384.448f, -62.2338f },
    { 1716.81f, 374.437f, -60.4845f },
    { 1725.09f, 361.466f, -60.4561f },
    { 1734.98f, 346.717f, -55.3936f },
    { 1720.8f, 335.518f, -49.0941f },
    { 1706.42f, 324.186f, -55.3923f },
    { 1715.06f, 313.223f, -60.4836f },
    { 1722.2f, 293.859f, -62.1816f },
    { 1726.99f, 277.646f, -61.6201f },
    { 1731.56f, 258.869f, -62.1777f },
    { 1730.53f, 236.534f, -62.1777f },
    { 1730.45f, 221.129f, -62.1777f },
    { 1727.79f, 206.641f, -61.6201f },
    { 1721.55f, 192.245f, -62.1567f },
    { 1710.23f, 174.474f, -60.748f },
    { 1703.03f, 162.592f, -60.7572f },
    { 1703.7f, 151.978f, -60.4547f },
    { 1693.09f, 140.75f, -55.2145f },
    { 1705.39f, 128.363f, -48.9765f },
    { 1718.51f, 115.25f, -55.2142f },
    { 1730.88f, 126.046f, -60.2606f },
    { 1730.82f, 115.161f, -60.183f },
    { 1716.92f, 103.729f, -60.2008f },
    { 1701.28f, 95.534f, -62.2142f },
    { 1693.78f, 80.3089f, -62.2901f },
    { 1675.76f, 75.0983f, -62.2695f },
    { 1641.9f, 66.6623f, -61.6205f },
    { 1621.2f, 62.7971f, -62.1758f },
    { 1606.1f, 64.2477f, -62.1757f },
    { 1585.06f, 65.8815f, -62.1757f },
    { 1566.75f, 63.2784f, -62.1759f },
    { 1549.34f, 66.7444f, -61.6205f },
    { 1528.12f, 75.3463f, -62.1931f },
    { 1515.81f, 76.2727f, -62.312f },
    { 1498.46f, 72.9253f, -62.2988f },
    { 1481.09f, 65.1825f, -62.2955f },
    { 1464.11f, 62.5269f, -62.2894f },
    { 1450.53f, 63.8461f, -62.2829f },
    { 1443.4f, 77.7421f, -62.281f },
    { 1437.17f, 95.2736f, -62.2835f },
    { 1431.24f, 109.49f, -62.2855f },
    { 1425.46f, 126.738f, -62.2903f },
    { 1428.19f, 147.362f, -62.2883f },
    { 1430.87f, 165.485f, -62.2873f },
    { 1422.51f, 193.802f, -61.6205f },
    { 1418.04f, 221.338f, -62.1757f },
    { 1417.87f, 250.625f, -62.1757f },
    { 1422.36f, 287.308f, -61.6205f },
    { 1431.02f, 310.52f, -62.1858f },
    { 1431.11f, 329.137f, -62.1858f },
    { 1431.76f, 340.716f, -62.1858f },
    { 1446.93f, 345.408f, -62.2555f },
    { 1457.68f, 352.131f, -62.1858f },
    { 1468.25f, 368.539f, -59.4315f },
    { 1456.45f, 382.704f, -59.2146f },
    { 1438.56f, 402.152f, -57.8187f },
    { 1425.19f, 415.942f, -56.564f },
    { 1412.51f, 427.689f, -54.9935f },
    { 1398.04f, 434.394f, -54.2124f },
    { 1377.36f, 438.503f, -52.7816f },
    { 1362.51f, 436.662f, -54.0348f },
    { 1343.87f, 430.783f, -56.1263f },
    { 1329.61f, 420.568f, -58.5133f },
    { 1317.72f, 406.919f, -61.6818f },
    { 1310.81f, 390.742f, -64.0786f },
    { 1305.81f, 371.942f, -67.2921f },
    { 1300.8f, 353.982f, -66.3732f },
    { 1287.07f, 349.808f, -65.0277f },
    { 1271.03f, 348.118f, -65.0273f },
    { 1260.78f, 335.246f, -65.0273f },
    { 1271.79f, 330.043f, -61.2514f },
    { 1285.68f, 329.953f, -60.0831f },
    { 1296.77f, 326.485f, -59.4742f },
    { 1293.68f, 320.572f, -57.4819f }
};

static Waypoint UC_TRADE_QUARTER[25] =
{
    { 1660.98f, 257.238f, -62.1777f },
    { 1659.01f, 234.474f, -62.1776f },
    { 1657.83f, 213.584f, -62.179f },
    { 1643.68f, 189.256f, -62.1817f },
    { 1614.92f, 175.086f, -62.1779f },
    { 1582.18f, 171.914f, -62.1777f },
    { 1554.78f, 185.782f, -62.1812f },
    { 1555.19f, 199.377f, -60.7729f },
    { 1572.48f, 216.876f, -58.8445f },
    { 1583.42f, 229.032f, -62.0874f },
    { 1579.97f, 239.346f, -62.0773f },
    { 1593.38f, 260.254f, -57.1617f },
    { 1595.97f, 250.856f, -52.3559f },
    { 1603.33f, 248.817f, -52.1495f },
    { 1629.47f, 238.688f, -43.1705f },
    { 1632.91f, 233.36f, -43.1027f },
    { 1608.15f, 202.839f, -43.1027f },
    { 1581.31f, 204.956f, -43.1025f },
    { 1560.33f, 225.354f, -43.1026f },
    { 1558.61f, 241.44f, -43.1027f },
    { 1561.27f, 255.781f, -43.1027f },
    { 1568.61f, 264.061f, -43.1027f },
    { 1578.92f, 273.572f, -43.1027f },
    { 1585.38f, 276.608f, -43.1027f },
    { 1605.34f, 276.451f, -43.1027f }
};

static Waypoint SW_STORMWIND_KEEP[36] =
{
    { -8571.98f, 891.327f, 90.7048f },
    { -8564.43f, 897.362f, 96.6816f },
    { -8543.69f, 868.857f, 96.678f },
    { -8537.53f, 877.229f, 100.872f },
    { -8549.34f, 876.808f, 106.524f },
    { -8528.83f, 850.217f, 106.519f },
    { -8566.04f, 819.702f, 106.519f },
    { -8561.33f, 812.55f, 106.519f },
    { -8574.4f, 801.162f, 106.519f },
    { -8581.51f, 807.43f, 106.519f },
    { -8621.97f, 775.794f, 96.6517f },
    { -8591.07f, 756.628f, 96.6506f },
    { -8580.26f, 738.55f, 96.7067f },
    { -8596.12f, 719.753f, 96.6506f },
    { -8578.3f, 693.895f, 97.0165f },
    { -8562.46f, 674.137f, 97.0165f },
    { -8537.19f, 689.571f, 97.6661f },
    { -8522.15f, 670.014f, 102.774f },
    { -8510.12f, 652.249f, 100.292f },
    { -8533.99f, 634.753f, 100.251f },
    { -8551.84f, 617.816f, 101.984f },
    { -8566.02f, 614.139f, 102.349f },
    { -8575.44f, 602.488f, 103.243f },
    { -8584.68f, 581.049f, 103.347f },
    { -8578.33f, 547.375f, 101.777f },
    { -8559.37f, 524.217f, 100.483f },
    { -8544.85f, 502.583f, 98.5454f },
    { -8535.21f, 487.29f, 101.279f },
    { -8539.38f, 477.864f, 102.922f },
    { -8548.45f, 468.814f, 104.483f },
    { -8533.58f, 448.952f, 104.917f },
    { -8518.46f, 430.065f, 106.586f },
    { -8497.76f, 404.19f, 108.386f },
    { -8477.23f, 378.372f, 112.258f },
    { -8457.71f, 353.894f, 120.084f },
    { -8441.52f, 333.366f, 122.579f }
};

enum CityAttack
{
    MAX_UNDERCITY_GUARDIANS = 3,
    MAX_UNDERCITY_ELITE_GUARDIANS = 6,
    MAX_ROYAL_DREADGUARDS_ENTRANCE = 1,
    MAX_ROYAL_DREADGUARDS_THRONE_ROOM = 4,
    MAX_UNDERCITY_GUARDIANS_MAGIC_QUARTER = 1,
    MAX_UNDERCITY_GUARDIANS_ROGUE_QUARTER = 1,
    MAX_STORMWIND_ELITE_GUARDS_TRADE_DISTRICT = 8,
    MAX_STORMWIND_CITY_GUARD_CATHEDRAL = 1,
};

// NPC positions are all sniffed.

static const Position UC_MAGIC_QUARTER_UNDERCITY_GUARDIANS[MAX_UNDERCITY_GUARDIANS_MAGIC_QUARTER] =
{
    { 1720.11f, 191.195f, -62.0651f, 1.02974f }
};

static const Position UC_ROGUE_QUARTER_UNDERCITY_GUARDIANS[MAX_UNDERCITY_GUARDIANS_ROGUE_QUARTER] =
{
    { 1472.94f, 63.9248f, -62.2098f, 0.401426f }
};

static const Position UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_ENTRANCE[MAX_ROYAL_DREADGUARDS_ENTRANCE] =
{
    { 1466.95f, 369.392f, -59.3685f, 4.41568f }
};

static const Position UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_THRONE_ROOM[MAX_ROYAL_DREADGUARDS_THRONE_ROOM] =
{
    { 1305.82f, 351.934f, -65.8778f, 1.69297f },
    { 1302.63f, 352.871f, -65.9109f, 1.309f },
    { 1299.49f, 353.789f, -65.9394f, 1.16937f },
    { 1295.97f, 354.728f, -65.9162f, 0.907571f }
};

static const Position UC_TRADE_QUARTER_UNDERCITY_GUARDIANS[MAX_UNDERCITY_GUARDIANS] =
{
    { 1649.6f, 197.414f, -62.0981f, 1.06465f },
    { 1651.49f, 192.836f, -62.0972f, 1.20428f },
    { 1645.86f, 196.746f, -62.0994f, 1.01229f }
};

// Some of them spawn in the Argent Dawn Tent.
static const Position UC_TRADE_QUARTER_UNDERCITY_ELITE_GUARDIANS[MAX_UNDERCITY_ELITE_GUARDIANS] =
{
    { 1632.55f, 233.419f, -43.0193f, 2.6529f },
    { 1633.06f, 246.891f, -43.0193f, 3.59538f },
    { 1576.53f, 243.989f, -61.994f, 4.76475f },
    { 1578.96f, 237.109f, -61.994f, 4.53786f },
    { 1635.93f, 240.378f, -43.0193f, 3.24631f },
    { 1583.21f, 241.365f, -61.994f, 4.45059f }
};

static const Position SW_CATHEDRAL_STORMWIND_CITY_GUARD[MAX_STORMWIND_CITY_GUARD_CATHEDRAL] =
{
    { -8534.62f, 854.091f, 106.601f, 2.09439f }
};

static const Position SW_TRADE_DISTRICT_STORMWIND_ELITE_GUARDS[MAX_STORMWIND_ELITE_GUARDS_TRADE_DISTRICT] =
{
    { -8828.65f, 640.132f, 94.4273f, 3.28122f },
    { -8837.81f, 628.258f, 94.0939f, 1.67552f },
    { -8832.66f, 629.215f, 94.1206f, 2.09439f },
    { -8827.45f, 633.287f, 94.3621f, 2.87979f },
    { -8841.72f, 631.157f, 94.6496f, 1.41372f },
    { -8844.74f, 635.272f, 95.2692f, 1.37881f },
    { -8845.08f, 614.403f, 93.0201f, 5.18363f },
    { -8848.65f, 612.322f, 93.0186f, 5.42797f }
};
