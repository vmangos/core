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

enum EObjectFields
{
    OBJECT_FIELD_GUID                          = 0x00, // Size:2
    OBJECT_FIELD_TYPE                          = 0x02, // Size:1
    OBJECT_FIELD_ENTRY                         = 0x03, // Size:1
    OBJECT_FIELD_SCALE_X                       = 0x04, // Size:1
    OBJECT_FIELD_PADDING                       = 0x05, // Size:1
    OBJECT_END                                 = 0x06,
};

enum EItemFields
{
    ITEM_FIELD_OWNER                           = OBJECT_END + 0x00, // Size:2
    ITEM_FIELD_CONTAINED                       = OBJECT_END + 0x02, // Size:2
    ITEM_FIELD_CREATOR                         = OBJECT_END + 0x04, // Size:2
    ITEM_FIELD_GIFTCREATOR                     = OBJECT_END + 0x06, // Size:2
    ITEM_FIELD_STACK_COUNT                     = OBJECT_END + 0x08, // Size:1
    ITEM_FIELD_DURATION                        = OBJECT_END + 0x09, // Size:1
    ITEM_FIELD_SPELL_CHARGES                   = OBJECT_END + 0x0A, // Size:5
    ITEM_FIELD_SPELL_CHARGES_01                = OBJECT_END + 0x0B,
    ITEM_FIELD_SPELL_CHARGES_02                = OBJECT_END + 0x0C,
    ITEM_FIELD_SPELL_CHARGES_03                = OBJECT_END + 0x0D,
    ITEM_FIELD_SPELL_CHARGES_04                = OBJECT_END + 0x0E,
    ITEM_FIELD_FLAGS                           = OBJECT_END + 0x0F, // Size:1
    ITEM_FIELD_ENCHANTMENT                     = OBJECT_END + 0x10, // count=21
    ITEM_FIELD_PROPERTY_SEED                   = OBJECT_END + 0x25, // Size:1
    ITEM_FIELD_RANDOM_PROPERTIES_ID            = OBJECT_END + 0x26, // Size:1
    ITEM_FIELD_ITEM_TEXT_ID                    = OBJECT_END + 0x27, // Size:1
    ITEM_FIELD_DURABILITY                      = OBJECT_END + 0x28, // Size:1
    ITEM_FIELD_MAXDURABILITY                   = OBJECT_END + 0x29, // Size:1
    ITEM_END                                   = OBJECT_END + 0x2A,
};

enum EContainerFields
{
    CONTAINER_FIELD_NUM_SLOTS                  = ITEM_END + 0x00, // Size:1
    CONTAINER_ALIGN_PAD                        = ITEM_END + 0x01, // Size:1
    CONTAINER_FIELD_SLOT_1                     = ITEM_END + 0x02,
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    CONTAINER_FIELD_SLOT_LAST                  = ITEM_END + 0x48, // count=72
    CONTAINER_FIELD_SLOT_END,
#else
    CONTAINER_FIELD_SLOT_LAST                  = ITEM_END + 0x28, // count=40
    CONTAINER_FIELD_SLOT_END,
#endif
    CONTAINER_END,
};

enum EUnitFields
{
    UNIT_FIELD_CHARM                           = 0x00 + OBJECT_END, // Size:2
    UNIT_FIELD_SUMMON                          = 0x02 + OBJECT_END, // Size:2
    UNIT_FIELD_CHARMEDBY                       = 0x04 + OBJECT_END, // Size:2
    UNIT_FIELD_SUMMONEDBY                      = 0x06 + OBJECT_END, // Size:2
    UNIT_FIELD_CREATEDBY                       = 0x08 + OBJECT_END, // Size:2
    UNIT_FIELD_TARGET                          = 0x0A + OBJECT_END, // Size:2
    UNIT_FIELD_PERSUADED                       = 0x0C + OBJECT_END, // Size:2
    UNIT_FIELD_CHANNEL_OBJECT                  = 0x0E + OBJECT_END, // Size:2
    UNIT_FIELD_HEALTH                          = 0x10 + OBJECT_END, // Size:1
    UNIT_FIELD_POWER1                          = 0x11 + OBJECT_END, // Size:1
    UNIT_FIELD_POWER2                          = 0x12 + OBJECT_END, // Size:1
    UNIT_FIELD_POWER3                          = 0x13 + OBJECT_END, // Size:1
    UNIT_FIELD_POWER4                          = 0x14 + OBJECT_END, // Size:1
    UNIT_FIELD_POWER5                          = 0x15 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXHEALTH                       = 0x16 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXPOWER1                       = 0x17 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXPOWER2                       = 0x18 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXPOWER3                       = 0x19 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXPOWER4                       = 0x1A + OBJECT_END, // Size:1
    UNIT_FIELD_MAXPOWER5                       = 0x1B + OBJECT_END, // Size:1
    UNIT_FIELD_LEVEL                           = 0x1C + OBJECT_END, // Size:1
    UNIT_FIELD_FACTIONTEMPLATE                 = 0x1D + OBJECT_END, // Size:1
    UNIT_FIELD_BYTES_0                         = 0x1E + OBJECT_END, // Size:1
    UNIT_VIRTUAL_ITEM_SLOT_DISPLAY             = 0x1F + OBJECT_END, // Size:3
    UNIT_VIRTUAL_ITEM_SLOT_DISPLAY_01          = 0x20 + OBJECT_END,
    UNIT_VIRTUAL_ITEM_SLOT_DISPLAY_02          = 0x21 + OBJECT_END,
    UNIT_VIRTUAL_ITEM_INFO                     = 0x22 + OBJECT_END, // Size:6
    UNIT_VIRTUAL_ITEM_INFO_01                  = 0x23 + OBJECT_END,
    UNIT_VIRTUAL_ITEM_INFO_02                  = 0x24 + OBJECT_END,
    UNIT_VIRTUAL_ITEM_INFO_03                  = 0x25 + OBJECT_END,
    UNIT_VIRTUAL_ITEM_INFO_04                  = 0x26 + OBJECT_END,
    UNIT_VIRTUAL_ITEM_INFO_05                  = 0x27 + OBJECT_END,
    UNIT_FIELD_FLAGS                           = 0x28 + OBJECT_END, // Size:1
    UNIT_FIELD_AURA                            = 0x29 + OBJECT_END, // Size:48
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    UNIT_FIELD_AURA_LAST                       = UNIT_FIELD_AURA + 47,
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    UNIT_FIELD_AURA_LAST                       = UNIT_FIELD_AURA + 63,
#else
    UNIT_FIELD_AURA_LAST                       = UNIT_FIELD_AURA + 55,
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    UNIT_FIELD_AURAFLAGS,                      // Size:6
    UNIT_FIELD_AURAFLAGS_01,
    UNIT_FIELD_AURAFLAGS_02,
    UNIT_FIELD_AURAFLAGS_03,
    UNIT_FIELD_AURAFLAGS_04,
    UNIT_FIELD_AURAFLAGS_05,
    #if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
    UNIT_FIELD_AURAFLAGS_06,
    UNIT_FIELD_AURAFLAGS_07,
    #endif
    UNIT_FIELD_AURALEVELS,                     // Size:12
    #if (SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4) || (SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_7_1)
    UNIT_FIELD_AURALEVELS_LAST                 = UNIT_FIELD_AURALEVELS + 11,
    #else
    UNIT_FIELD_AURALEVELS_LAST                 = UNIT_FIELD_AURALEVELS + 7,
    #endif
    UNIT_FIELD_AURAAPPLICATIONS,               // Size:12
    #if (SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4) || (SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_7_1)
    UNIT_FIELD_AURAAPPLICATIONS_LAST           = UNIT_FIELD_AURAAPPLICATIONS + 11,
    #else
    UNIT_FIELD_AURAAPPLICATIONS_LAST           = UNIT_FIELD_AURAAPPLICATIONS + 15,
    #endif
#else
    UNIT_FIELD_AURALEVELS,
    UNIT_FIELD_AURALEVELS_LAST                 = UNIT_FIELD_AURALEVELS + 9,
    UNIT_FIELD_AURAAPPLICATIONS,
    UNIT_FIELD_AURAAPPLICATIONS_LAST           = UNIT_FIELD_AURAAPPLICATIONS + 9,
    UNIT_FIELD_AURAFLAGS,
    UNIT_FIELD_AURAFLAGS_01,
    UNIT_FIELD_AURAFLAGS_02,
    UNIT_FIELD_AURAFLAGS_03,
    UNIT_FIELD_AURAFLAGS_04,
    UNIT_FIELD_AURAFLAGS_05,
    UNIT_FIELD_AURAFLAGS_06,
#endif
    UNIT_FIELD_AURASTATE,                      // Size:1
    UNIT_FIELD_BASEATTACKTIME,                 // Size:1
    UNIT_FIELD_OFFHANDATTACKTIME,              // Size:1
    UNIT_FIELD_RANGEDATTACKTIME,               // Size:1
    UNIT_FIELD_BOUNDINGRADIUS,                 // Size:1
    UNIT_FIELD_COMBATREACH,                    // Size:1
    UNIT_FIELD_DISPLAYID,                      // Size:1
    UNIT_FIELD_NATIVEDISPLAYID,                // Size:1
    UNIT_FIELD_MOUNTDISPLAYID,                 // Size:1
    UNIT_FIELD_MINDAMAGE,                      // Size:1
    UNIT_FIELD_MAXDAMAGE,                      // Size:1
    UNIT_FIELD_MINOFFHANDDAMAGE,               // Size:1
    UNIT_FIELD_MAXOFFHANDDAMAGE,               // Size:1
    UNIT_FIELD_BYTES_1,                        // Size:1
    UNIT_FIELD_PETNUMBER,                      // Size:1
    UNIT_FIELD_PET_NAME_TIMESTAMP,             // Size:1
    UNIT_FIELD_PETEXPERIENCE,                  // Size:1
    UNIT_FIELD_PETNEXTLEVELEXP,                // Size:1
    UNIT_DYNAMIC_FLAGS,                        // Size:1
    UNIT_CHANNEL_SPELL,                        // Size:1
    UNIT_MOD_CAST_SPEED,                       // Size:1 Represented as Int32 before 1.12, after that it's Float.
    UNIT_CREATED_BY_SPELL,                     // Size:1
    UNIT_NPC_FLAGS,                            // Size:1
    UNIT_NPC_EMOTESTATE,                       // Size:1
    UNIT_TRAINING_POINTS,                      // Size:1
    UNIT_FIELD_STAT0,                          // Size:1
    UNIT_FIELD_STAT1,                          // Size:1
    UNIT_FIELD_STAT2,                          // Size:1
    UNIT_FIELD_STAT3,                          // Size:1
    UNIT_FIELD_STAT4,                          // Size:1
    UNIT_FIELD_RESISTANCES,                    // Size:7
    UNIT_FIELD_RESISTANCES_01,
    UNIT_FIELD_RESISTANCES_02,
    UNIT_FIELD_RESISTANCES_03,
    UNIT_FIELD_RESISTANCES_04,
    UNIT_FIELD_RESISTANCES_05,
    UNIT_FIELD_RESISTANCES_06,
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    UNIT_FIELD_BASE_MANA,                      // Size:1
    UNIT_FIELD_BASE_HEALTH,                    // Size:1
    UNIT_FIELD_BYTES_2,                        // Size:1
    UNIT_FIELD_ATTACK_POWER,                   // Size:1
    UNIT_FIELD_ATTACK_POWER_MODS,              // Size:1
    UNIT_FIELD_ATTACK_POWER_MULTIPLIER,        // Size:1
#else
    UNIT_FIELD_ATTACK_POWER,                   // Size:1
    UNIT_FIELD_BASE_MANA,                      // Size:1
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    UNIT_FIELD_BASE_HEALTH,                    // Size:1
#endif
    UNIT_FIELD_ATTACK_POWER_MODS,              // Size:1
    UNIT_FIELD_BYTES_2,                        // Size:1
#endif
    UNIT_FIELD_RANGED_ATTACK_POWER,            // Size:1
    UNIT_FIELD_RANGED_ATTACK_POWER_MODS,       // Size:1
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER, // Size:1
#endif
    UNIT_FIELD_MINRANGEDDAMAGE,                // Size:1
    UNIT_FIELD_MAXRANGEDDAMAGE,                // Size:1
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    UNIT_FIELD_POWER_COST_MODIFIER,            // Size:7
    UNIT_FIELD_POWER_COST_MODIFIER_01,
    UNIT_FIELD_POWER_COST_MODIFIER_02,
    UNIT_FIELD_POWER_COST_MODIFIER_03,
    UNIT_FIELD_POWER_COST_MODIFIER_04,
    UNIT_FIELD_POWER_COST_MODIFIER_05,
    UNIT_FIELD_POWER_COST_MODIFIER_06,
    UNIT_FIELD_POWER_COST_MULTIPLIER,          // Size:7
    UNIT_FIELD_POWER_COST_MULTIPLIER_01,
    UNIT_FIELD_POWER_COST_MULTIPLIER_02,
    UNIT_FIELD_POWER_COST_MULTIPLIER_03,
    UNIT_FIELD_POWER_COST_MULTIPLIER_04,
    UNIT_FIELD_POWER_COST_MULTIPLIER_05,
    UNIT_FIELD_POWER_COST_MULTIPLIER_06,
#endif
    UNIT_FIELD_PADDING,
    UNIT_END,

#if SUPPORTED_CLIENT_BUILD < CLIENT_BUILD_1_12_1
    PLAYER_SELECTION                           = 0x00 + UNIT_END,
    PLAYER_SELECTION_END                       = PLAYER_SELECTION + 1,
    PLAYER_DUEL_ARBITER,
#else
    PLAYER_DUEL_ARBITER                        = 0x00 + UNIT_END, // Size:2
#endif
    
    PLAYER_DUEL_ARBITER_END,
    PLAYER_FLAGS,                              // Size:1
    PLAYER_GUILDID,                            // Size:1
    PLAYER_GUILDRANK,                          // Size:1
    PLAYER_BYTES,                              // Size:1
    PLAYER_BYTES_2,                            // Size:1
    PLAYER_BYTES_3,                            // Size:1
    PLAYER_DUEL_TEAM,                          // Size:1
    PLAYER_GUILD_TIMESTAMP,                    // Size:1
    PLAYER_QUEST_LOG_1_1,                      // 20x3
    PLAYER_QUEST_LOG_1_2,
    PLAYER_QUEST_LOG_1_3,
    PLAYER_QUEST_LOG_LAST_1                    = PLAYER_QUEST_LOG_1_3 + 55,
    PLAYER_QUEST_LOG_LAST_2,
    PLAYER_QUEST_LOG_LAST_3,
    PLAYER_VISIBLE_ITEM_1_CREATOR,             // Size:2 Count:19
    PLAYER_VISIBLE_ITEM_1_0                    = PLAYER_VISIBLE_ITEM_1_CREATOR + 2,     // Size:8
    PLAYER_VISIBLE_ITEM_1_PROPERTIES           = PLAYER_VISIBLE_ITEM_1_0 + 8,           // Size:1
    PLAYER_VISIBLE_ITEM_1_PAD,                 // Size:205
    PLAYER_VISIBLE_ITEM_1_PAD_END              = PLAYER_VISIBLE_ITEM_1_PAD + 204,
    PLAYER_VISIBLE_ITEM_LAST_CREATOR,
    PLAYER_VISIBLE_ITEM_LAST_0                 = PLAYER_VISIBLE_ITEM_LAST_CREATOR + 2,
    PLAYER_VISIBLE_ITEM_LAST_0_END             = PLAYER_VISIBLE_ITEM_LAST_0 + 7,
    PLAYER_VISIBLE_ITEM_LAST_PROPERTIES,
    PLAYER_VISIBLE_ITEM_LAST_PAD,
    PLAYER_FIELD_INV_SLOT_HEAD,                // Size:46
    PLAYER_FIELD_INV_SLOT_END                  = PLAYER_FIELD_INV_SLOT_HEAD + 45,
    PLAYER_FIELD_PACK_SLOT_1,                  // Size:2 Count:16
    PLAYER_FIELD_PACK_SLOT_LAST                = PLAYER_FIELD_PACK_SLOT_1 + 30,         // + (Count-1)*Size
    PLAYER_FIELD_PACK_SLOT_END,
    PLAYER_FIELD_BANK_SLOT_1,                  // Size:48
    PLAYER_FIELD_BANK_SLOT_LAST                = PLAYER_FIELD_BANK_SLOT_1 + 46,
    PLAYER_FIELD_BANK_SLOT_END,
    PLAYER_FIELD_BANKBAG_SLOT_1,               // Size:2 Count:6
    PLAYER_FIELD_BANKBAG_SLOT_LAST             = PLAYER_FIELD_BANKBAG_SLOT_1 + 10,      // + (Count-1)*Size
    PLAYER_FIELD_BANKBAG_SLOT_END,
    PLAYER_FIELD_VENDORBUYBACK_SLOT_1,         // Size:2 Count:12
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    PLAYER_FIELD_VENDORBUYBACK_SLOT_LAST       = PLAYER_FIELD_VENDORBUYBACK_SLOT_1 + 22,
#else
    PLAYER_FIELD_VENDORBUYBACK_SLOT_LAST       = PLAYER_FIELD_VENDORBUYBACK_SLOT_1,
#endif
    PLAYER_FIELD_VENDORBUYBACK_SLOT_END,
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    PLAYER_FIELD_KEYRING_SLOT_1 ,              // Size:2 Count:32
    PLAYER_FIELD_KEYRING_SLOT_LAST             = PLAYER_FIELD_KEYRING_SLOT_1 + 62,      // + (Count-1)*Size
    PLAYER_FIELD_KEYRING_SLOT_END,
#endif
    PLAYER_FARSIGHT,                           // Size:2
    PLAYER_FARSIGHT_END,
    PLAYER_FIELD_COMBO_TARGET,                 // Size:2
    PLAYER_FIELD_COMBO_TARGET_END,
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_7_1
    PLAYER_FIELD_BUYBACK_NPC,                  // Size:2
    PLAYER_FIELD_BUYBACK_NPC_END,
#endif
    PLAYER_XP,                                 // Size:1
    PLAYER_NEXT_LEVEL_XP,                      // Size:1
    PLAYER_SKILL_INFO_1_1,                     // Size:384
    PLAYER_CHARACTER_POINTS1                   = PLAYER_SKILL_INFO_1_1 + 384, // Size:1
    PLAYER_CHARACTER_POINTS2,                  // Size:1
    PLAYER_TRACK_CREATURES,                    // Size:1
    PLAYER_TRACK_RESOURCES,                    // Size:1
    PLAYER_BLOCK_PERCENTAGE,                   // Size:1
    PLAYER_DODGE_PERCENTAGE,                   // Size:1
    PLAYER_PARRY_PERCENTAGE,                   // Size:1
    PLAYER_CRIT_PERCENTAGE,                    // Size:1
    PLAYER_RANGED_CRIT_PERCENTAGE,             // Size:1
    PLAYER_EXPLORED_ZONES_1,                   // Size:64
    PLAYER_EXPLORED_ZONES_END                  = PLAYER_EXPLORED_ZONES_1 + 63,
    PLAYER_REST_STATE_EXPERIENCE,              // Size:1
    PLAYER_FIELD_COINAGE,                      // Size:1
    PLAYER_FIELD_POSSTAT0,                     // Size:1
    PLAYER_FIELD_POSSTAT1,                     // Size:1
    PLAYER_FIELD_POSSTAT2,                     // Size:1
    PLAYER_FIELD_POSSTAT3,                     // Size:1
    PLAYER_FIELD_POSSTAT4,                     // Size:1
    PLAYER_FIELD_NEGSTAT0,                     // Size:1
    PLAYER_FIELD_NEGSTAT1,                     // Size:1
    PLAYER_FIELD_NEGSTAT2,                     // Size:1
    PLAYER_FIELD_NEGSTAT3,                     // Size:1,
    PLAYER_FIELD_NEGSTAT4,                     // Size:1
    PLAYER_FIELD_RES_BUFF_MODS_POSITIVE,       // Size:7
    PLAYER_FIELD_RES_BUFF_MODS_POSITIVE_END    = PLAYER_FIELD_RES_BUFF_MODS_POSITIVE + 6,
    PLAYER_FIELD_RES_BUFF_MODS_NEGATIVE,       // Size:7
    PLAYER_FIELD_RES_BUFF_MODS_NEGATIVE_END    = PLAYER_FIELD_RES_BUFF_MODS_NEGATIVE + 6,
    PLAYER_FIELD_MOD_DAMAGE_DONE_POS,          // Size:7
    PLAYER_FIELD_MOD_DAMAGE_DONE_POS_END       = PLAYER_FIELD_MOD_DAMAGE_DONE_POS + 6,
    PLAYER_FIELD_MOD_DAMAGE_DONE_NEG,          // Size:7
    PLAYER_FIELD_MOD_DAMAGE_DONE_NEG_END       = PLAYER_FIELD_MOD_DAMAGE_DONE_NEG + 6,
    PLAYER_FIELD_MOD_DAMAGE_DONE_PCT,          // Size:7
    PLAYER_FIELD_MOD_DAMAGE_DONE_PCT_END       = PLAYER_FIELD_MOD_DAMAGE_DONE_PCT + 6,
    PLAYER_FIELD_BYTES,                        // Size:1
    PLAYER_AMMO_ID,                            // Size:1
    PLAYER_SELF_RES_SPELL,                     // Size:1
    PLAYER_FIELD_PVP_MEDALS,                   // Size:1
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    PLAYER_FIELD_BUYBACK_PRICE_1,              // Count:12
    PLAYER_FIELD_BUYBACK_PRICE_LAST            = PLAYER_FIELD_BUYBACK_PRICE_1 + 11,
    PLAYER_FIELD_BUYBACK_TIMESTAMP_1,          // Count:12
    PLAYER_FIELD_BUYBACK_TIMESTAMP_LAST        = PLAYER_FIELD_BUYBACK_TIMESTAMP_1 + 11,
#else
    PLAYER_FIELD_BUYBACK_ITEM_ID,
    PLAYER_FIELD_BUYBACK_RANDOM_PROPERTIES_ID,
    PLAYER_FIELD_BUYBACK_SEED,
    PLAYER_FIELD_BUYBACK_PRICE,
    PLAYER_FIELD_BUYBACK_DURABILITY,
    PLAYER_FIELD_BUYBACK_COUNT,
#endif
    PLAYER_FIELD_SESSION_KILLS,                // Size:1
    PLAYER_FIELD_YESTERDAY_KILLS,              // Size:1
    PLAYER_FIELD_LAST_WEEK_KILLS,              // Size:1
    PLAYER_FIELD_THIS_WEEK_KILLS,              // Size:1
    PLAYER_FIELD_THIS_WEEK_CONTRIBUTION,       // Size:1
    PLAYER_FIELD_LIFETIME_HONORABLE_KILLS,     // Size:1
    PLAYER_FIELD_LIFETIME_DISHONORABLE_KILLS,  // Size:1
    PLAYER_FIELD_YESTERDAY_CONTRIBUTION,       // Size:1
    PLAYER_FIELD_LAST_WEEK_CONTRIBUTION,       // Size:1
    PLAYER_FIELD_LAST_WEEK_RANK,               // Size:1
    PLAYER_FIELD_BYTES2,                       // Size:1
    PLAYER_FIELD_WATCHED_FACTION_INDEX,        // Size:1
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    PLAYER_FIELD_COMBAT_RATING_1,              // Size:20
    PLAYER_FIELD_COMBAT_RATING_END             = PLAYER_FIELD_COMBAT_RATING_1 + 19,
#endif
    PLAYER_END
};

enum EGameObjectFields
{
    OBJECT_FIELD_CREATED_BY                    = OBJECT_END + 0x00,
    GAMEOBJECT_DISPLAYID                       = OBJECT_END + 0x02,
    GAMEOBJECT_FLAGS                           = OBJECT_END + 0x03,
    GAMEOBJECT_ROTATION                        = OBJECT_END + 0x04,
    GAMEOBJECT_STATE                           = OBJECT_END + 0x08,
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_11_2
    GAMEOBJECT_TIMESTAMP,
#endif
    GAMEOBJECT_POS_X,
    GAMEOBJECT_POS_Y,
    GAMEOBJECT_POS_Z,
    GAMEOBJECT_FACING,
    GAMEOBJECT_DYN_FLAGS,
    GAMEOBJECT_FACTION,
    GAMEOBJECT_TYPE_ID,
    GAMEOBJECT_LEVEL,
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    GAMEOBJECT_ARTKIT,
    GAMEOBJECT_ANIMPROGRESS,
    GAMEOBJECT_PADDING,
#endif
    GAMEOBJECT_END
};

enum EDynamicObjectFields
{
    DYNAMICOBJECT_CASTER                       = OBJECT_END + 0x00,
    DYNAMICOBJECT_BYTES                        = OBJECT_END + 0x02,
    DYNAMICOBJECT_SPELLID                      = OBJECT_END + 0x03,
    DYNAMICOBJECT_RADIUS                       = OBJECT_END + 0x04,
    DYNAMICOBJECT_POS_X                        = OBJECT_END + 0x05,
    DYNAMICOBJECT_POS_Y                        = OBJECT_END + 0x06,
    DYNAMICOBJECT_POS_Z                        = OBJECT_END + 0x07,
    DYNAMICOBJECT_FACING                       = OBJECT_END + 0x08,
    DYNAMICOBJECT_PAD                          = OBJECT_END + 0x09,
    DYNAMICOBJECT_END                          = OBJECT_END + 0x0A,
};

enum ECorpseFields
{
    CORPSE_FIELD_OWNER                         = OBJECT_END + 0x00,
    CORPSE_FIELD_FACING                        = OBJECT_END + 0x02,
    CORPSE_FIELD_POS_X                         = OBJECT_END + 0x03,
    CORPSE_FIELD_POS_Y                         = OBJECT_END + 0x04,
    CORPSE_FIELD_POS_Z                         = OBJECT_END + 0x05,
    CORPSE_FIELD_DISPLAY_ID                    = OBJECT_END + 0x06,
    CORPSE_FIELD_ITEM                          = OBJECT_END + 0x07, // 19
    CORPSE_FIELD_BYTES_1                       = OBJECT_END + 0x1A,
    CORPSE_FIELD_BYTES_2                       = OBJECT_END + 0x1B,
    CORPSE_FIELD_GUILD                         = OBJECT_END + 0x1C,
    CORPSE_FIELD_FLAGS                         = OBJECT_END + 0x1D,
    CORPSE_FIELD_DYNAMIC_FLAGS                 = OBJECT_END + 0x1E,
    CORPSE_FIELD_PAD                           = OBJECT_END + 0x1F,
    CORPSE_END                                 = OBJECT_END + 0x20,
};

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
        case FIELD_ITEM_FIELD_FLAGS:
            return ITEM_FIELD_FLAGS;
        case FIELD_CORPSE_FIELD_FLAGS:
            return CORPSE_FIELD_FLAGS;
        case FIELD_CORPSE_FIELD_DYNAMIC_FLAGS:
            return CORPSE_FIELD_DYNAMIC_FLAGS;
        case FIELD_UNIT_FIELD_FLAGS:
            return UNIT_FIELD_FLAGS;
        case FIELD_UNIT_DYNAMIC_FLAGS:
            return UNIT_DYNAMIC_FLAGS;
        case FIELD_UNIT_NPC_FLAGS:
            return UNIT_NPC_FLAGS;
        case FIELD_UNIT_FIELD_RESISTANCES:
            return UNIT_FIELD_RESISTANCES;
        case FIELD_UNIT_FIELD_RESISTANCES_01:
            return UNIT_FIELD_RESISTANCES_01;
        case FIELD_UNIT_FIELD_RESISTANCES_02:
            return UNIT_FIELD_RESISTANCES_02;
        case FIELD_UNIT_FIELD_RESISTANCES_03:
            return UNIT_FIELD_RESISTANCES_03;
        case FIELD_UNIT_FIELD_RESISTANCES_04:
            return UNIT_FIELD_RESISTANCES_04;
        case FIELD_UNIT_FIELD_RESISTANCES_05:
            return UNIT_FIELD_RESISTANCES_05;
        case FIELD_UNIT_FIELD_RESISTANCES_06:
            return UNIT_FIELD_RESISTANCES_06;
        case FIELD_UNIT_FIELD_ATTACK_POWER:
            return UNIT_FIELD_ATTACK_POWER;
        case FIELD_PLAYER_FLAGS:
            return PLAYER_FLAGS;
    }

    return db_index;
}

#endif
