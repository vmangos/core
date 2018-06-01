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
    CONTAINER_FIELD_SLOT_1                     = ITEM_END + 0x02, // count=56
    CONTAINER_FIELD_SLOT_LAST                  = ITEM_END + 0x38,
    CONTAINER_END                              = ITEM_END + 0x3A,
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
    UNIT_FIELD_AURA_LAST                       = 0x58 + OBJECT_END,
    UNIT_FIELD_AURAFLAGS                       = 0x59 + OBJECT_END, // Size:6
    UNIT_FIELD_AURAFLAGS_01                    = 0x5a + OBJECT_END,
    UNIT_FIELD_AURAFLAGS_02                    = 0x5b + OBJECT_END,
    UNIT_FIELD_AURAFLAGS_03                    = 0x5c + OBJECT_END,
    UNIT_FIELD_AURAFLAGS_04                    = 0x5d + OBJECT_END,
    UNIT_FIELD_AURAFLAGS_05                    = 0x5e + OBJECT_END,
    UNIT_FIELD_AURALEVELS                      = 0x5f + OBJECT_END, // Size:12
    UNIT_FIELD_AURALEVELS_LAST                 = 0x6a + OBJECT_END,
    UNIT_FIELD_AURAAPPLICATIONS                = 0x6b + OBJECT_END, // Size:12
    UNIT_FIELD_AURAAPPLICATIONS_LAST           = 0x76 + OBJECT_END,
    UNIT_FIELD_AURASTATE                       = 0x77 + OBJECT_END, // Size:1
    UNIT_FIELD_BASEATTACKTIME                  = 0x78 + OBJECT_END, // Size:2
    UNIT_FIELD_OFFHANDATTACKTIME               = 0x79 + OBJECT_END, // Size:2
    UNIT_FIELD_RANGEDATTACKTIME                = 0x7a + OBJECT_END, // Size:1
    UNIT_FIELD_BOUNDINGRADIUS                  = 0x7b + OBJECT_END, // Size:1
    UNIT_FIELD_COMBATREACH                     = 0x7c + OBJECT_END, // Size:1
    UNIT_FIELD_DISPLAYID                       = 0x7d + OBJECT_END, // Size:1
    UNIT_FIELD_NATIVEDISPLAYID                 = 0x7e + OBJECT_END, // Size:1
    UNIT_FIELD_MOUNTDISPLAYID                  = 0x7f + OBJECT_END, // Size:1
    UNIT_FIELD_MINDAMAGE                       = 0x80 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXDAMAGE                       = 0x81 + OBJECT_END, // Size:1
    UNIT_FIELD_MINOFFHANDDAMAGE                = 0x82 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXOFFHANDDAMAGE                = 0x83 + OBJECT_END, // Size:1
    UNIT_FIELD_BYTES_1                         = 0x84 + OBJECT_END, // Size:1
    UNIT_FIELD_PETNUMBER                       = 0x85 + OBJECT_END, // Size:1
    UNIT_FIELD_PET_NAME_TIMESTAMP              = 0x86 + OBJECT_END, // Size:1
    UNIT_FIELD_PETEXPERIENCE                   = 0x87 + OBJECT_END, // Size:1
    UNIT_FIELD_PETNEXTLEVELEXP                 = 0x88 + OBJECT_END, // Size:1
    UNIT_DYNAMIC_FLAGS                         = 0x89 + OBJECT_END, // Size:1
    UNIT_CHANNEL_SPELL                         = 0x8a + OBJECT_END, // Size:1
    UNIT_MOD_CAST_SPEED                        = 0x8b + OBJECT_END, // Size:1 Represented as Int32 before 1.12, after that it's Float.
    UNIT_CREATED_BY_SPELL                      = 0x8c + OBJECT_END, // Size:1
    UNIT_NPC_FLAGS                             = 0x8d + OBJECT_END, // Size:1
    UNIT_NPC_EMOTESTATE                        = 0x8e + OBJECT_END, // Size:1
    UNIT_TRAINING_POINTS                       = 0x8f + OBJECT_END, // Size:1
    UNIT_FIELD_STAT0                           = 0x90 + OBJECT_END, // Size:1
    UNIT_FIELD_STAT1                           = 0x91 + OBJECT_END, // Size:1
    UNIT_FIELD_STAT2                           = 0x92 + OBJECT_END, // Size:1
    UNIT_FIELD_STAT3                           = 0x93 + OBJECT_END, // Size:1
    UNIT_FIELD_STAT4                           = 0x94 + OBJECT_END, // Size:1
    UNIT_FIELD_RESISTANCES                     = 0x95 + OBJECT_END, // Size:7
    UNIT_FIELD_RESISTANCES_01                  = 0x96 + OBJECT_END,
    UNIT_FIELD_RESISTANCES_02                  = 0x97 + OBJECT_END,
    UNIT_FIELD_RESISTANCES_03                  = 0x98 + OBJECT_END,
    UNIT_FIELD_RESISTANCES_04                  = 0x99 + OBJECT_END,
    UNIT_FIELD_RESISTANCES_05                  = 0x9a + OBJECT_END,
    UNIT_FIELD_RESISTANCES_06                  = 0x9b + OBJECT_END,
    UNIT_FIELD_BASE_MANA                       = 0x9c + OBJECT_END, // Size:1
    UNIT_FIELD_BASE_HEALTH                     = 0x9d + OBJECT_END, // Size:1
    UNIT_FIELD_BYTES_2                         = 0x9e + OBJECT_END, // Size:1
    UNIT_FIELD_ATTACK_POWER                    = 0x9f + OBJECT_END, // Size:1
    UNIT_FIELD_ATTACK_POWER_MODS               = 0xa0 + OBJECT_END, // Size:1
    UNIT_FIELD_ATTACK_POWER_MULTIPLIER         = 0xa1 + OBJECT_END, // Size:1
    UNIT_FIELD_RANGED_ATTACK_POWER             = 0xa2 + OBJECT_END, // Size:1
    UNIT_FIELD_RANGED_ATTACK_POWER_MODS        = 0xa3 + OBJECT_END, // Size:1
    UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER  = 0xa4 + OBJECT_END, // Size:1
    UNIT_FIELD_MINRANGEDDAMAGE                 = 0xa5 + OBJECT_END, // Size:1
    UNIT_FIELD_MAXRANGEDDAMAGE                 = 0xa6 + OBJECT_END, // Size:1
    UNIT_FIELD_POWER_COST_MODIFIER             = 0xa7 + OBJECT_END, // Size:7
    UNIT_FIELD_POWER_COST_MODIFIER_01          = 0xa8 + OBJECT_END,
    UNIT_FIELD_POWER_COST_MODIFIER_02          = 0xa9 + OBJECT_END,
    UNIT_FIELD_POWER_COST_MODIFIER_03          = 0xaa + OBJECT_END,
    UNIT_FIELD_POWER_COST_MODIFIER_04          = 0xab + OBJECT_END,
    UNIT_FIELD_POWER_COST_MODIFIER_05          = 0xac + OBJECT_END,
    UNIT_FIELD_POWER_COST_MODIFIER_06          = 0xad + OBJECT_END,
    UNIT_FIELD_POWER_COST_MULTIPLIER           = 0xae + OBJECT_END, // Size:7
    UNIT_FIELD_POWER_COST_MULTIPLIER_01        = 0xaf + OBJECT_END,
    UNIT_FIELD_POWER_COST_MULTIPLIER_02        = 0xb0 + OBJECT_END,
    UNIT_FIELD_POWER_COST_MULTIPLIER_03        = 0xb1 + OBJECT_END,
    UNIT_FIELD_POWER_COST_MULTIPLIER_04        = 0xb2 + OBJECT_END,
    UNIT_FIELD_POWER_COST_MULTIPLIER_05        = 0xb3 + OBJECT_END,
    UNIT_FIELD_POWER_COST_MULTIPLIER_06        = 0xb4 + OBJECT_END,
    UNIT_FIELD_PADDING                         = 0xb5 + OBJECT_END,
    UNIT_END                                   = 0xb6 + OBJECT_END,

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    PLAYER_DUEL_ARBITER                        = 0x00 + UNIT_END, // Size:2
    PLAYER_FLAGS                               = 0x02 + UNIT_END, // Size:1
    PLAYER_GUILDID                             = 0x03 + UNIT_END, // Size:1
    PLAYER_GUILDRANK                           = 0x04 + UNIT_END, // Size:1
    PLAYER_BYTES                               = 0x05 + UNIT_END, // Size:1
    PLAYER_BYTES_2                             = 0x06 + UNIT_END, // Size:1
    PLAYER_BYTES_3                             = 0x07 + UNIT_END, // Size:1
    PLAYER_DUEL_TEAM                           = 0x08 + UNIT_END, // Size:1
    PLAYER_GUILD_TIMESTAMP                     = 0x09 + UNIT_END, // Size:1
    PLAYER_QUEST_LOG_1_1                       = 0x0A + UNIT_END, // count = 20
    PLAYER_QUEST_LOG_1_2                       = 0x0B + UNIT_END,
    PLAYER_QUEST_LOG_1_3                       = 0x0C + UNIT_END,
    PLAYER_QUEST_LOG_LAST_1                    = 0x43 + UNIT_END,
    PLAYER_QUEST_LOG_LAST_2                    = 0x44 + UNIT_END,
    PLAYER_QUEST_LOG_LAST_3                    = 0x45 + UNIT_END,
    PLAYER_VISIBLE_ITEM_1_CREATOR              = 0x46 + UNIT_END, // Size:2, count = 19
    PLAYER_VISIBLE_ITEM_1_0                    = 0x48 + UNIT_END, // Size:8
    PLAYER_VISIBLE_ITEM_1_PROPERTIES           = 0x50 + UNIT_END, // Size:1
    PLAYER_VISIBLE_ITEM_1_PAD                  = 0x51 + UNIT_END, // Size:1
    PLAYER_VISIBLE_ITEM_LAST_CREATOR           = 0x11e + UNIT_END,
    PLAYER_VISIBLE_ITEM_LAST_0                 = 0x120 + UNIT_END,
    PLAYER_VISIBLE_ITEM_LAST_PROPERTIES        = 0x128 + UNIT_END,
    PLAYER_VISIBLE_ITEM_LAST_PAD               = 0x129 + UNIT_END,
    PLAYER_FIELD_INV_SLOT_HEAD                 = 0x12a + UNIT_END, // Size:46
    PLAYER_FIELD_PACK_SLOT_1                   = 0x158 + UNIT_END, // Size:32
    PLAYER_FIELD_PACK_SLOT_LAST                = 0x176 + UNIT_END,
    PLAYER_FIELD_BANK_SLOT_1                   = 0x178 + UNIT_END, // Size:48
    PLAYER_FIELD_BANK_SLOT_LAST                = 0x1a6 + UNIT_END,
    PLAYER_FIELD_BANKBAG_SLOT_1                = 0x1a8 + UNIT_END, // Size:12
    PLAYER_FIELD_BANKBAG_SLOT_LAST             = 0xab2 + UNIT_END,
    PLAYER_FIELD_VENDORBUYBACK_SLOT_1          = 0x1b4 + UNIT_END, // Size:24
    PLAYER_FIELD_VENDORBUYBACK_SLOT_LAST       = 0x1ca + UNIT_END,
    PLAYER_FIELD_KEYRING_SLOT_1                = 0x1cc + UNIT_END, // Size:64
    PLAYER_FIELD_KEYRING_SLOT_LAST             = 0x20a + UNIT_END,
    PLAYER_FARSIGHT                            = 0x20c + UNIT_END, // Size:2
    PLAYER_FIELD_COMBO_TARGET                  = 0x20e + UNIT_END, // Size:2
    PLAYER_XP                                  = 0x210 + UNIT_END, // Size:1
    PLAYER_NEXT_LEVEL_XP                       = 0x211 + UNIT_END, // Size:1
    PLAYER_SKILL_INFO_1_1                      = 0x212 + UNIT_END, // Size:384
    PLAYER_CHARACTER_POINTS1                   = 0x392 + UNIT_END, // Size:1
    PLAYER_CHARACTER_POINTS2                   = 0x393 + UNIT_END, // Size:1
    PLAYER_TRACK_CREATURES                     = 0x394 + UNIT_END, // Size:1
    PLAYER_TRACK_RESOURCES                     = 0x395 + UNIT_END, // Size:1
    PLAYER_BLOCK_PERCENTAGE                    = 0x396 + UNIT_END, // Size:1
    PLAYER_DODGE_PERCENTAGE                    = 0x397 + UNIT_END, // Size:1
    PLAYER_PARRY_PERCENTAGE                    = 0x398 + UNIT_END, // Size:1
    PLAYER_CRIT_PERCENTAGE                     = 0x399 + UNIT_END, // Size:1
    PLAYER_RANGED_CRIT_PERCENTAGE              = 0x39a + UNIT_END, // Size:1
    PLAYER_EXPLORED_ZONES_1                    = 0x39b + UNIT_END, // Size:64
    PLAYER_REST_STATE_EXPERIENCE               = 0x3db + UNIT_END, // Size:1
    PLAYER_FIELD_COINAGE                       = 0x3dc + UNIT_END, // Size:1
    PLAYER_FIELD_POSSTAT0                      = 0x3DD + UNIT_END, // Size:1
    PLAYER_FIELD_POSSTAT1                      = 0x3DE + UNIT_END, // Size:1
    PLAYER_FIELD_POSSTAT2                      = 0x3DF + UNIT_END, // Size:1
    PLAYER_FIELD_POSSTAT3                      = 0x3E0 + UNIT_END, // Size:1
    PLAYER_FIELD_POSSTAT4                      = 0x3E1 + UNIT_END, // Size:1
    PLAYER_FIELD_NEGSTAT0                      = 0x3E2 + UNIT_END, // Size:1
    PLAYER_FIELD_NEGSTAT1                      = 0x3E3 + UNIT_END, // Size:1
    PLAYER_FIELD_NEGSTAT2                      = 0x3E4 + UNIT_END, // Size:1
    PLAYER_FIELD_NEGSTAT3                      = 0x3E5 + UNIT_END, // Size:1,
    PLAYER_FIELD_NEGSTAT4                      = 0x3E6 + UNIT_END, // Size:1
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE    = 0x3E7 + UNIT_END, // Size:7
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE    = 0x3EE + UNIT_END, // Size:7
    PLAYER_FIELD_MOD_DAMAGE_DONE_POS           = 0x3F5 + UNIT_END, // Size:7
    PLAYER_FIELD_MOD_DAMAGE_DONE_NEG           = 0x3FC + UNIT_END, // Size:7
    PLAYER_FIELD_MOD_DAMAGE_DONE_PCT           = 0x403 + UNIT_END, // Size:7
    PLAYER_FIELD_BYTES                         = 0x40A + UNIT_END, // Size:1
    PLAYER_AMMO_ID                             = 0x40B + UNIT_END, // Size:1
    PLAYER_SELF_RES_SPELL                      = 0x40C + UNIT_END, // Size:1
    PLAYER_FIELD_PVP_MEDALS                    = 0x40D + UNIT_END, // Size:1
    PLAYER_FIELD_BUYBACK_PRICE_1               = 0x40E + UNIT_END, // count=12
    PLAYER_FIELD_BUYBACK_PRICE_LAST            = 0x419 + UNIT_END,
    PLAYER_FIELD_BUYBACK_TIMESTAMP_1           = 0x41A + UNIT_END, // count=12
    PLAYER_FIELD_BUYBACK_TIMESTAMP_LAST        = 0x425 + UNIT_END,
    PLAYER_FIELD_SESSION_KILLS                 = 0x426 + UNIT_END, // Size:1
    PLAYER_FIELD_YESTERDAY_KILLS               = 0x427 + UNIT_END, // Size:1
    PLAYER_FIELD_LAST_WEEK_KILLS               = 0x428 + UNIT_END, // Size:1
    PLAYER_FIELD_THIS_WEEK_KILLS               = 0x429 + UNIT_END, // Size:1
    PLAYER_FIELD_THIS_WEEK_CONTRIBUTION        = 0x42a + UNIT_END, // Size:1
    PLAYER_FIELD_LIFETIME_HONORABLE_KILLS      = 0x42b + UNIT_END, // Size:1
    PLAYER_FIELD_LIFETIME_DISHONORABLE_KILLS   = 0x42c + UNIT_END, // Size:1
    PLAYER_FIELD_YESTERDAY_CONTRIBUTION        = 0x42d + UNIT_END, // Size:1
    PLAYER_FIELD_LAST_WEEK_CONTRIBUTION        = 0x42e + UNIT_END, // Size:1
    PLAYER_FIELD_LAST_WEEK_RANK                = 0x42f + UNIT_END, // Size:1
    PLAYER_FIELD_BYTES2                        = 0x430 + UNIT_END, // Size:1
    PLAYER_FIELD_WATCHED_FACTION_INDEX         = 0x431 + UNIT_END, // Size:1
    PLAYER_FIELD_COMBAT_RATING_1               = 0x432 + UNIT_END, // Size:20

    PLAYER_END                                 = 0x446 + UNIT_END
#else
    PLAYER_SELECTION                           = 0x0 + UNIT_END,
    PLAYER_DUEL_ARBITER                        = 0x2 + UNIT_END,
    PLAYER_FLAGS                               = 0x4 + UNIT_END,
    PLAYER_GUILDID                             = 0x5 + UNIT_END,
    PLAYER_GUILDRANK                           = 0x6 + UNIT_END,
    PLAYER_BYTES                               = 0x7 + UNIT_END,
    PLAYER_BYTES_2                             = 0x8 + UNIT_END,
    PLAYER_BYTES_3                             = 0x9 + UNIT_END,
    PLAYER_DUEL_TEAM                           = 0xA + UNIT_END,
    PLAYER_GUILD_TIMESTAMP                     = 0xB + UNIT_END,
    PLAYER_QUEST_LOG_1_1                       = 0xC + UNIT_END,
    PLAYER_QUEST_LOG_1_2                       = 0xD + UNIT_END,
    PLAYER_QUEST_LOG_2_1                       = 0xF + UNIT_END,
    PLAYER_QUEST_LOG_2_2                       = 0x10 + UNIT_END,
    PLAYER_QUEST_LOG_3_1                       = 0x12 + UNIT_END,
    PLAYER_QUEST_LOG_3_2                       = 0x13 + UNIT_END,
    PLAYER_QUEST_LOG_4_1                       = 0x15 + UNIT_END,
    PLAYER_QUEST_LOG_4_2                       = 0x16 + UNIT_END,
    PLAYER_QUEST_LOG_5_1                       = 0x18 + UNIT_END,
    PLAYER_QUEST_LOG_5_2                       = 0x19 + UNIT_END,
    PLAYER_QUEST_LOG_6_1                       = 0x1B + UNIT_END,
    PLAYER_QUEST_LOG_6_2                       = 0x1C + UNIT_END,
    PLAYER_QUEST_LOG_7_1                       = 0x1E + UNIT_END,
    PLAYER_QUEST_LOG_7_2                       = 0x1F + UNIT_END,
    PLAYER_QUEST_LOG_8_1                       = 0x21 + UNIT_END,
    PLAYER_QUEST_LOG_8_2                       = 0x22 + UNIT_END,
    PLAYER_QUEST_LOG_9_1                       = 0x24 + UNIT_END,
    PLAYER_QUEST_LOG_9_2                       = 0x25 + UNIT_END,
    PLAYER_QUEST_LOG_10_1                      = 0x27 + UNIT_END,
    PLAYER_QUEST_LOG_10_2                      = 0x28 + UNIT_END,
    PLAYER_QUEST_LOG_11_1                      = 0x2A + UNIT_END,
    PLAYER_QUEST_LOG_11_2                      = 0x2B + UNIT_END,
    PLAYER_QUEST_LOG_12_1                      = 0x2D + UNIT_END,
    PLAYER_QUEST_LOG_12_2                      = 0x2E + UNIT_END,
    PLAYER_QUEST_LOG_13_1                      = 0x30 + UNIT_END,
    PLAYER_QUEST_LOG_13_2                      = 0x31 + UNIT_END,
    PLAYER_QUEST_LOG_14_1                      = 0x33 + UNIT_END,
    PLAYER_QUEST_LOG_14_2                      = 0x34 + UNIT_END,
    PLAYER_QUEST_LOG_15_1                      = 0x36 + UNIT_END,
    PLAYER_QUEST_LOG_15_2                      = 0x37 + UNIT_END,
    PLAYER_QUEST_LOG_16_1                      = 0x39 + UNIT_END,
    PLAYER_QUEST_LOG_16_2                      = 0x3A + UNIT_END,
    PLAYER_QUEST_LOG_17_1                      = 0x3C + UNIT_END,
    PLAYER_QUEST_LOG_17_2                      = 0x3D + UNIT_END,
    PLAYER_QUEST_LOG_18_1                      = 0x3F + UNIT_END,
    PLAYER_QUEST_LOG_18_2                      = 0x40 + UNIT_END,
    PLAYER_QUEST_LOG_19_1                      = 0x42 + UNIT_END,
    PLAYER_QUEST_LOG_19_2                      = 0x43 + UNIT_END,
    PLAYER_QUEST_LOG_20_1                      = 0x45 + UNIT_END,
    PLAYER_QUEST_LOG_20_2                      = 0x46 + UNIT_END,
    //260
    PLAYER_VISIBLE_ITEM_1_CREATOR              = 0x48 + UNIT_END,
    PLAYER_VISIBLE_ITEM_1_0                    = 0x4A + UNIT_END,
    PLAYER_VISIBLE_ITEM_1_PROPERTIES           = 0x52 + UNIT_END,
    //271
    PLAYER_VISIBLE_ITEM_1_PAD                  = 0x53 + UNIT_END,
    //272
    PLAYER_VISIBLE_ITEM_2_CREATOR              = 0x54 + UNIT_END,
    PLAYER_VISIBLE_ITEM_2_0                    = 0x56 + UNIT_END,
    PLAYER_VISIBLE_ITEM_2_PROPERTIES           = 0x5E + UNIT_END,
    //283
    PLAYER_VISIBLE_ITEM_2_PAD                  = 0x5F + UNIT_END,
    //284
    PLAYER_VISIBLE_ITEM_3_CREATOR              = 0x60 + UNIT_END,
    PLAYER_VISIBLE_ITEM_3_0                    = 0x62 + UNIT_END,
    PLAYER_VISIBLE_ITEM_3_PROPERTIES           = 0x6A + UNIT_END,
    //295
    PLAYER_VISIBLE_ITEM_3_PAD                  = 0x6B + UNIT_END,
    //296
    PLAYER_VISIBLE_ITEM_4_CREATOR              = 0x6C + UNIT_END,
    PLAYER_VISIBLE_ITEM_4_0                    = 0x6E + UNIT_END,
    PLAYER_VISIBLE_ITEM_4_PROPERTIES           = 0x76 + UNIT_END,
    //307
    PLAYER_VISIBLE_ITEM_4_PAD                  = 0x77 + UNIT_END,
    //308
    PLAYER_VISIBLE_ITEM_5_CREATOR              = 0x78 + UNIT_END,
    PLAYER_VISIBLE_ITEM_5_0                    = 0x7A + UNIT_END,
    PLAYER_VISIBLE_ITEM_5_PROPERTIES           = 0x82 + UNIT_END,
    //319
    PLAYER_VISIBLE_ITEM_5_PAD                  = 0x83 + UNIT_END,
    //320
    PLAYER_VISIBLE_ITEM_6_CREATOR              = 0x84 + UNIT_END,
    PLAYER_VISIBLE_ITEM_6_0                    = 0x86 + UNIT_END,
    PLAYER_VISIBLE_ITEM_6_PROPERTIES           = 0x8E + UNIT_END,
    //331
    PLAYER_VISIBLE_ITEM_6_PAD                  = 0x8F + UNIT_END,
    //332
    PLAYER_VISIBLE_ITEM_7_CREATOR              = 0x90 + UNIT_END,
    PLAYER_VISIBLE_ITEM_7_0                    = 0x92 + UNIT_END,
    PLAYER_VISIBLE_ITEM_7_PROPERTIES           = 0x9A + UNIT_END,
    //343
    PLAYER_VISIBLE_ITEM_7_PAD                  = 0x9B + UNIT_END,
    //344
    PLAYER_VISIBLE_ITEM_8_CREATOR              = 0x9C + UNIT_END,
    PLAYER_VISIBLE_ITEM_8_0                    = 0x9E + UNIT_END,
    PLAYER_VISIBLE_ITEM_8_PROPERTIES           = 0xA6 + UNIT_END,
    //355
    PLAYER_VISIBLE_ITEM_8_PAD                  = 0xA7 + UNIT_END,
    //356
    PLAYER_VISIBLE_ITEM_9_CREATOR              = 0xA8 + UNIT_END,
    PLAYER_VISIBLE_ITEM_9_0                    = 0xAA + UNIT_END,
    PLAYER_VISIBLE_ITEM_9_PROPERTIES           = 0xB2 + UNIT_END,
    //367
    PLAYER_VISIBLE_ITEM_9_PAD                  = 0xB3 + UNIT_END,
    //368
    PLAYER_VISIBLE_ITEM_10_CREATOR             = 0xB4 + UNIT_END,
    PLAYER_VISIBLE_ITEM_10_0                   = 0xB6 + UNIT_END,
    PLAYER_VISIBLE_ITEM_10_PROPERTIES          = 0xBE + UNIT_END,
    //379
    PLAYER_VISIBLE_ITEM_10_PAD                 = 0xBF + UNIT_END,
    //380
    PLAYER_VISIBLE_ITEM_11_CREATOR             = 0xC0 + UNIT_END,
    PLAYER_VISIBLE_ITEM_11_0                   = 0xC2 + UNIT_END,
    PLAYER_VISIBLE_ITEM_11_PROPERTIES          = 0xCA + UNIT_END,
    //391
    PLAYER_VISIBLE_ITEM_11_PAD                 = 0xCB + UNIT_END,
    //392
    PLAYER_VISIBLE_ITEM_12_CREATOR             = 0xCC + UNIT_END,
    PLAYER_VISIBLE_ITEM_12_0                   = 0xCE + UNIT_END,
    PLAYER_VISIBLE_ITEM_12_PROPERTIES          = 0xD6 + UNIT_END,
    //403
    PLAYER_VISIBLE_ITEM_12_PAD                 = 0xD7 + UNIT_END,
    //404
    PLAYER_VISIBLE_ITEM_13_CREATOR             = 0xD8 + UNIT_END,
    PLAYER_VISIBLE_ITEM_13_0                   = 0xDA + UNIT_END,
    PLAYER_VISIBLE_ITEM_13_PROPERTIES          = 0xE2 + UNIT_END,
    //415
    PLAYER_VISIBLE_ITEM_13_PAD                 = 0xE3 + UNIT_END,
    //416
    PLAYER_VISIBLE_ITEM_14_CREATOR             = 0xE4 + UNIT_END,
    PLAYER_VISIBLE_ITEM_14_0                   = 0xE6 + UNIT_END,
    PLAYER_VISIBLE_ITEM_14_PROPERTIES          = 0xEE + UNIT_END,
    //427
    PLAYER_VISIBLE_ITEM_14_PAD                 = 0xEF + UNIT_END,
    //428
    PLAYER_VISIBLE_ITEM_15_CREATOR             = 0xF0 + UNIT_END,
    PLAYER_VISIBLE_ITEM_15_0                   = 0xF2 + UNIT_END,
    PLAYER_VISIBLE_ITEM_15_PROPERTIES          = 0xFA + UNIT_END,
    //439
    PLAYER_VISIBLE_ITEM_15_PAD                 = 0xFB + UNIT_END,
    //440
    PLAYER_VISIBLE_ITEM_16_CREATOR             = 0xFC + UNIT_END,
    PLAYER_VISIBLE_ITEM_16_0                   = 0xFE + UNIT_END,
    PLAYER_VISIBLE_ITEM_16_PROPERTIES          = 0x106 + UNIT_END,
    //451
    PLAYER_VISIBLE_ITEM_16_PAD                 = 0x107 + UNIT_END,
    //452
    PLAYER_VISIBLE_ITEM_17_CREATOR             = 0x108 + UNIT_END,
    PLAYER_VISIBLE_ITEM_17_0                   = 0x10A + UNIT_END,
    PLAYER_VISIBLE_ITEM_17_PROPERTIES          = 0x112 + UNIT_END,
    //463
    PLAYER_VISIBLE_ITEM_17_PAD                 = 0x113 + UNIT_END,
    //464
    PLAYER_VISIBLE_ITEM_18_CREATOR             = 0x114 + UNIT_END,
    //466 ranged
    PLAYER_VISIBLE_ITEM_18_0                   = 0x116 + UNIT_END,
    PLAYER_VISIBLE_ITEM_18_PROPERTIES          = 0x11E + UNIT_END,
    //475
    PLAYER_VISIBLE_ITEM_18_PAD                 = 0x11F + UNIT_END,
    //476
    PLAYER_VISIBLE_ITEM_19_CREATOR             = 0x120 + UNIT_END,
    PLAYER_VISIBLE_ITEM_19_0                   = 0x122 + UNIT_END,
    PLAYER_VISIBLE_ITEM_19_PROPERTIES          = 0x12A + UNIT_END,
    //487
    PLAYER_VISIBLE_ITEM_19_PAD                 = 0x12B + UNIT_END,
    PLAYER_FIELD_INV_SLOT_HEAD                 = 0x12C + UNIT_END,
    PLAYER_FIELD_PACK_SLOT_1                   = 0x15A + UNIT_END,
    PLAYER_FIELD_PACK_SLOT_2                   = 0x15B + UNIT_END,
    PLAYER_FIELD_BANK_SLOT_1                   = 0x17A + UNIT_END,
    PLAYER_FIELD_BANKBAG_SLOT_1                = 0x1AA + UNIT_END,
    PLAYER_FIELD_VENDORBUYBACK_SLOT_1          = 0x1B6 + UNIT_END, // Size:24
    PLAYER_FIELD_VENDORBUYBACK_SLOT_LAST       = 0x1CC + UNIT_END,
    PLAYER_FIELD_KEYRING_SLOT_1                = 0x1CE + UNIT_END, // Size:64
    PLAYER_FIELD_KEYRING_SLOT_LAST             = 0x20C + UNIT_END,
    PLAYER_FARSIGHT                            = 0x1CE + UNIT_END + 64,
    PLAYER_FIELD_COMBO_TARGET                  = 0x1D0 + UNIT_END + 64,
    PLAYER_XP                                  = 0x1D2 + UNIT_END + 64,
    PLAYER_NEXT_LEVEL_XP                       = 0x1D3 + UNIT_END + 64,
    PLAYER_SKILL_INFO_1_1                      = 0x1D4 + UNIT_END + 64,
    PLAYER_CHARACTER_POINTS1                   = 0x354 + PLAYER_SELECTION + 64,
    PLAYER_CHARACTER_POINTS2                   = 0x355 + PLAYER_SELECTION + 64,
    PLAYER_TRACK_CREATURES                     = 0x356 + PLAYER_SELECTION + 64,
    PLAYER_TRACK_RESOURCES                     = 0x357 + PLAYER_SELECTION + 64,
    PLAYER_BLOCK_PERCENTAGE                    = 0x358 + PLAYER_SELECTION + 64,
    PLAYER_DODGE_PERCENTAGE                    = 0x359 + PLAYER_SELECTION + 64,
    PLAYER_PARRY_PERCENTAGE                    = 0x35A + PLAYER_SELECTION + 64,
    PLAYER_CRIT_PERCENTAGE                     = 0x35B + PLAYER_SELECTION + 64,
    PLAYER_RANGED_CRIT_PERCENTAGE              = 0x35C + PLAYER_SELECTION + 64,
    PLAYER_EXPLORED_ZONES_1                    = 0x35D + PLAYER_SELECTION + 64,
    PLAYER_REST_STATE_EXPERIENCE               = 0x39D + PLAYER_SELECTION + 64,
    PLAYER_FIELD_COINAGE                       = 0x39E + PLAYER_SELECTION + 64,
    PLAYER_FIELD_POSSTAT0                      = 0x39F + PLAYER_SELECTION + 64,
    PLAYER_FIELD_POSSTAT1                      = 0x3A0 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_POSSTAT2                      = 0x3A1 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_POSSTAT3                      = 0x3A2 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_POSSTAT4                      = 0x3A3 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_NEGSTAT0                      = 0x3A4 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_NEGSTAT1                      = 0x3A5 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_NEGSTAT2                      = 0x3A6 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_NEGSTAT3                      = 0x3A7 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_NEGSTAT4                      = 0x3A8 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE    = 0x3A9 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE_01 = 0x3AA + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE_02 = 0x3AB + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE_03 = 0x3AC + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE_04 = 0x3AD + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE_05 = 0x3AE + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSPOSITIVE_06 = 0x3AF + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE    = 0x3B0 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE_01 = 0x3B1 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE_02 = 0x3B2 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE_03 = 0x3B3 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE_04 = 0x3B4 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE_05 = 0x3B5 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_RESISTANCEBUFFMODSNEGATIVE_06 = 0x3B6 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_MOD_DAMAGE_DONE_POS           = 0x3B7 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_MOD_DAMAGE_DONE_NEG           = 0x3BE + PLAYER_SELECTION + 64,
    PLAYER_FIELD_MOD_DAMAGE_DONE_PCT           = 0x3C5 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_BYTES                         = 0x3CC + PLAYER_SELECTION + 64,
    PLAYER_AMMO_ID                             = 0x3CD + PLAYER_SELECTION + 64,
    PLAYER_SELF_RES_SPELL                      = 0x3CE + PLAYER_SELECTION + 64,
    PLAYER_FIELD_PVP_MEDALS                    = 0x3CF + PLAYER_SELECTION + 64,
    PLAYER_FIELD_BUYBACK_PRICE_1               = 0x3D0 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_BUYBACK_TIMESTAMP_1           = 0x3DC + PLAYER_SELECTION + 64,
    PLAYER_FIELD_SESSION_KILLS                 = 0x3E8 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_YESTERDAY_KILLS               = 0x3E9 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_LAST_WEEK_KILLS               = 0x3EA + PLAYER_SELECTION + 64,
    PLAYER_FIELD_THIS_WEEK_KILLS               = 0x3EB + PLAYER_SELECTION + 64,
    PLAYER_FIELD_THIS_WEEK_CONTRIBUTION        = 0x3EC + PLAYER_SELECTION + 64,
    PLAYER_FIELD_LIFETIME_HONORABLE_KILLS      = 0x3ED + PLAYER_SELECTION + 64,
    PLAYER_FIELD_LIFETIME_DISHONORABLE_KILLS   = 0x3EE + PLAYER_SELECTION + 64,
    PLAYER_FIELD_YESTERDAY_CONTRIBUTION        = 0x3EF + PLAYER_SELECTION + 64,
    PLAYER_FIELD_LAST_WEEK_CONTRIBUTION        = 0x3F0 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_LAST_WEEK_RANK                = 0x3F1 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_HONOR_BAR                     = 0x3F2 + PLAYER_SELECTION + 64,
    PLAYER_FIELD_WATCHED_FACTION_INDEX         = 0x3F3 + PLAYER_SELECTION + 64,

    PLAYER_END                                 = 0x3F4 + PLAYER_SELECTION + 64,
#endif
};

enum EGameObjectFields
{
    OBJECT_FIELD_CREATED_BY                    = OBJECT_END + 0x00,
    GAMEOBJECT_DISPLAYID                       = OBJECT_END + 0x02,
    GAMEOBJECT_FLAGS                           = OBJECT_END + 0x03,
    GAMEOBJECT_ROTATION                        = OBJECT_END + 0x04,
    GAMEOBJECT_STATE                           = OBJECT_END + 0x08,
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    GAMEOBJECT_POS_X                           = OBJECT_END + 0x09,
    GAMEOBJECT_POS_Y                           = OBJECT_END + 0x0A,
    GAMEOBJECT_POS_Z                           = OBJECT_END + 0x0B,
    GAMEOBJECT_FACING                          = OBJECT_END + 0x0C,
    GAMEOBJECT_DYN_FLAGS                       = OBJECT_END + 0x0D,
    GAMEOBJECT_FACTION                         = OBJECT_END + 0x0E,
    GAMEOBJECT_TYPE_ID                         = OBJECT_END + 0x0F,
    GAMEOBJECT_LEVEL                           = OBJECT_END + 0x10,
    GAMEOBJECT_ARTKIT                          = OBJECT_END + 0x11,
    GAMEOBJECT_ANIMPROGRESS                    = OBJECT_END + 0x12,
    GAMEOBJECT_PADDING                         = OBJECT_END + 0x13,
    GAMEOBJECT_END                             = OBJECT_END + 0x14,
#else
    GAMEOBJECT_TIMESTAMP                       = OBJECT_END + 0x09,
    GAMEOBJECT_POS_X                           = OBJECT_END + 0x0A,
    GAMEOBJECT_POS_Y                           = OBJECT_END + 0x0B,
    GAMEOBJECT_POS_Z                           = OBJECT_END + 0x0C,
    GAMEOBJECT_FACING                          = OBJECT_END + 0x0D,
    GAMEOBJECT_DYN_FLAGS                       = OBJECT_END + 0x0E,
    GAMEOBJECT_FACTION                         = OBJECT_END + 0x0F,
    GAMEOBJECT_TYPE_ID                         = OBJECT_END + 0x10,
    GAMEOBJECT_LEVEL                           = OBJECT_END + 0x11,
    GAMEOBJECT_END                             = OBJECT_END + 0x12,
#endif
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
#endif
