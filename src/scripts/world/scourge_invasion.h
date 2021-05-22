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
    NPC_RENATO_GALLINA                                  = 1432,
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
    EVENT_PALLID_RANDOM_SAY                 = 53,
    EVENT_PALLID_SUMMON_FLAMESHOCKER        = 54
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

static const Position SW_TRADE_DISTRICT_STORMWIND_ELITE_GUARDS[8] =
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

static const Position UNDERCITY_FLAMESHOCKERS[66] =
{
    { 1404.49f, 432.129f, -54.7424f, 5.9107f },
    { 1417.01f, 119.062f, -62.3026f, 3.22786f },
    { 1434.53f, 131.441f, -62.2917f, 0.882077f },
    { 1442.66f, 396.132f, -57.9763f, 2.84291f },
    { 1455.49f, 86.7537f, -62.2866f, 5.83611f },
    { 1462.49f, 317.128f, -51.3326f, 2.70358f },
    { 1482.57f, 69.618f, -62.2946f, 2.83437f },
    { 1483.45f, 80.421f, -62.2959f, 1.09499f },
    { 1495.21f, 184.053f, -62.1624f, 5.74852f },
    { 1497.94f, 51.2258f, -62.3911f, 4.1402f },
    { 1500.49f, 180.242f, -62.1587f, 5.58234f },
    { 1506.89f, 174.72f, -62.1718f, 4.58057f },
    { 1512.64f, 84.9075f, -59.0589f, 5.82821f },
    { 1533.24f, 270.22f, -62.1776f, 5.67374f },
    { 1534.92f, 138.913f, -62.0883f, 3.71521f },
    { 1541.1f, 141.025f, -62.1679f, 0.329631f },
    { 1554.61f, 284.047f, -60.7696f, 4.41502f },
    { 1563.22f, 257.983f, -43.1026f, 0.844992f },
    { 1565.56f, 303.974f, -62.1778f, 5.77325f },
    { 1575.9f, 274.201f, -43.1027f, 3.24562f },
    { 1576.08f, 282.027f, -43.1024f, 6.00673f },
    { 1577.36f, 233.352f, -62.0759f, 5.9909f },
    { 1580.18f, 255.386f, -61.9099f, 2.09563f },
    { 1582.26f, 308.043f, -62.1778f, 3.07928f },
    { 1584.51f, 277.861f, -43.1027f, 0.397455f },
    { 1590.83f, 205.322f, -43.1027f, 3.08159f },
    { 1591.17f, 231.8f, -52.1506f, 2.42399f },
    { 1595.54f, 246.853f, -52.1454f, 2.5846f },
    { 1595.74f, 251.684f, -62.09f, 5.99746f },
    { 1598.92f, 225.028f, -62.0992f, 2.95413f },
    { 1600.96f, 207.208f, -55.0367f, 4.91309f },
    { 1606.54f, 239.628f, -52.0687f, 3.36831f },
    { 1608.12f, 204.48f, -43.1027f, 3.84246f },
    { 1611.26f, 228.25f, -62.0159f, 4.80257f },
    { 1623.98f, 241.997f, -43.9914f, 3.99528f },
    { 1628.86f, 239.077f, -43.2539f, 0.24089f },
    { 1633.6f, 417.747f, -62.1775f, 5.60891f },
    { 1637.05f, 188.483f, -62.1812f, 4.83542f },
    { 1644.84f, 195.952f, -62.1816f, 2.98433f },
    { 1648.83f, 189.909f, -62.1806f, 3.26767f },
    { 1648.95f, 141.741f, -62.1511f, 0.529594f },
    { 1651.24f, 200.692f, -62.1802f, 4.24818f },
    { 1657.7f, 145.003f, -62.1577f, 3.55144f },
    { 1662.68f, 335.826f, -62.1716f, 5.58389f },
    { 1668.19f, 164.036f, -62.1268f, 3.48712f },
    { 1669.05f, 152.464f, -62.151f, 0.17757f },
    { 1683.28f, 412.398f, -62.2978f, 2.8369f },
    { 1690.36f, 183.155f, -62.1689f, 3.70233f },
    { 1694.36f, 66.5781f, -62.2057f, 0.571195f },
    { 1697.95f, 288.708f, -62.1544f, 1.85996f },
    { 1700.03f, 236.256f, -62.1776f, 2.95846f },
    { 1700.87f, 181.282f, -62.0883f, 0.0523886f },
    { 1706.22f, 169.632f, -60.7444f, 5.73263f },
    { 1715.96f, 239.588f, -62.1776f, 3.24285f },
    { 1716.38f, 294.724f, -62.1841f, 5.70928f },
    { 1721.95f, 194.377f, -62.162f, 5.49723f },
    { 1722.49f, 377.847f, -60.4845f, 0.359429f },
    { 1724.21f, 372.755f, -60.4847f, 6.25642f },
    { 1727.52f, 368.675f, -60.4843f, 0.59253f },
    { 1730.54f, 220.98f, -62.1776f, 1.91049f },
    { 1741.05f, 97.3672f, -62.2827f, 1.84603f },
    { 1755.09f, 130.621f, -62.2955f, 3.29871f },
    { 1759.49f, 346.079f, -62.2596f, 2.53395f },
    { 1765.64f, 331.448f, -62.2279f, 2.98766f },
    { 1769.06f, 132.345f, -62.2104f, 4.73408f },
    { 1769.15f, 152.628f, -62.2958f, 1.82906f }
};

static const Position STORMWIND_FLAMESHOCKERS[27] =
{
    { -8998.35f, 886.722f, 105.443f, 4.78926f },
    { -8933.35f, 957.716f, 117.311f, 3.2351f },
    { -8883.49f, 579.81f, 92.9957f, 4.18675f },
    { -8866.22f, 636.57f, 96.1207f, 0.479134f },
    { -8853.97f, 660.937f, 96.9975f, 0.959985f },
    { -8849.48f, 651.768f, 96.6f, 5.13262f },
    { -8845.74f, 643.004f, 96.1428f, 2.31032f },
    { -8839.2f, 626.771f, 93.9394f, 3.33691f },
    { -8839.18f, 709.56f, 97.623f, 1.62297f },
    { -8838.98f, 671.879f, 98.1214f, 2.44023f },
    { -8833.34f, 622.748f, 93.7479f, 3.56396f },
    { -8829.06f, 629.108f, 94.0903f, 2.13262f },
    { -8820.12f, 577.062f, 94.6927f, 0.277407f },
    { -8810.19f, 580.752f, 95.9053f, 3.23575f },
    { -8806.82f, 683.233f, 100.235f, 3.36048f },
    { -8726.62f, 445.972f, 97.6747f, 2.32343f },
    { -8717.51f, 448.182f, 97.1518f, 5.587f },
    { -8703.61f, 403.269f, 100.222f, 2.9338f },
    { -8696.55f, 400.598f, 101.163f, 5.81667f },
    { -8687.1f, 396.243f, 101.936f, 2.92615f },
    { -8637.41f, 434.592f, 102.484f, 3.13903f },
    { -8583.68f, 889.096f, 87.161f, 5.43977f },
    { -8582.88f, 889.074f, 86.3035f, 5.65733f },
    { -8582.38f, 889.034f, 86.5379f, 5.58543f },
    { -8581.58f, 888.225f, 87.3136f, 5.61088f },
    { -8577.76f, 885.1f, 87.3152f, 5.88914f },
    { -8401.73f, 574.539f, 91.4437f, 3.2893f }
};
