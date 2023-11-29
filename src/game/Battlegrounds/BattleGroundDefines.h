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

#ifndef _BATTLEGROUND_DEFINES_H
#define _BATTLEGROUND_DEFINES_H

#include "Common.h"

// magic event-numbers
#define BG_EVENT_NONE 255

// those generic events should get a high event id
#define BG_EVENT_GHOST_GATE 253
#define BG_EVENT_DOOR 254

struct BattleGroundEventIdx
{
    uint8 event1;
    uint8 event2;
};

enum BattleGroundSounds
{
    SOUND_HORDE_WINS                = 8454,
    SOUND_ALLIANCE_WINS             = 8455,
    SOUND_BG_START                  = 3439
};

enum BattleGroundTexts
{
    BCT_BG_AV_A_WINS                   = 7335,
    BCT_BG_AV_H_WINS                   = 7336,

    BCT_BG_AV_START_ONE_MINUTE         = 10638,
    BCT_BG_AV_START_HALF_MINUTE        = 10639,
    BCT_BG_AV_HAS_BEGUN                = 10640,

    BCT_BG_WS_A_WINS                   = 9843,
    BCT_BG_WS_H_WINS                   = 9842,

    BCT_BG_WS_START_ONE_MINUTE         = 10015,
    BCT_BG_WS_START_HALF_MINUTE        = 10016,
    BCT_BG_WS_HAS_BEGUN                = 10014,

    BCT_BG_WS_CAPTURED_HF              = 9801,
    BCT_BG_WS_CAPTURED_AF              = 9802,
    BCT_BG_WS_DROPPED_HF               = 9806,
    BCT_BG_WS_DROPPED_AF               = 9805,
    BCT_BG_WS_RETURNED_AF              = 9808,
    BCT_BG_WS_RETURNED_HF              = 9809,
    BCT_BG_WS_PICKEDUP_HF              = 9807,
    BCT_BG_WS_PICKEDUP_AF              = 9804,
    BCT_BG_WS_F_PLACED                 = 9803,
    BCT_BG_WS_ALLIANCE_FLAG_RESPAWNED  = 10022,
    BCT_BG_WS_HORDE_FLAG_RESPAWNED     = 10023,

    BCT_BG_AB_A_WINS                   = 10633,
    BCT_BG_AB_H_WINS                   = 10634,

    BCT_BG_AB_START_ONE_MINUTE         = 10477,
    BCT_BG_AB_START_HALF_MINUTE        = 10478,
    BCT_BG_AB_HAS_BEGUN                = 10479,
    BCT_BG_AB_A_NEAR_VICTORY           = 10598,
    BCT_BG_AB_H_NEAR_VICTORY           = 10599,
};

enum BattleGroundCreatures
{
    NPC_AV_HERALD = 14848,
    NPC_WSG_HERALD = 14645
};

enum BattleGroundQuests
{
//    SPELL_WS_QUEST_REWARD           = 43483,
//    SPELL_AB_QUEST_REWARD           = 43484,
//    SPELL_AV_QUEST_REWARD           = 43475,
    SPELL_AV_QUEST_KILLED_BOSS      = 23658,
    SPELL_AB_QUEST_REWARD_4_BASES   = 24061,
    SPELL_AB_QUEST_REWARD_5_BASES   = 24064
};

enum BattleGroundMarks
{
    SPELL_WS_ALLY_WINNER            = 23661,
    SPELL_WS_HORDE_WINNER           = 23702,
    SPELL_AB_OLD_WINNER             = 24017,
    SPELL_WS_OLD_LOSER              = 24637,
    SPELL_WS_MARK_LOSER             = 24950,
    SPELL_WS_MARK_WINNER            = 24951,
    SPELL_AB_MARK_LOSER             = 24952,
    SPELL_AB_MARK_WINNER            = 24953,
    SPELL_AV_MARK_LOSER             = 24954,
    SPELL_AV_MARK_WINNER            = 24955,
};

enum BattleGroundTimeIntervals
{
    RESURRECTION_INTERVAL           = 30000,                // ms
    REMIND_INTERVAL                 = 30000,                // ms
    INVITATION_REMIND_TIME          = 60000,                // ms
    INVITE_ACCEPT_WAIT_TIME         = 80000,                // ms
    TIME_TO_AUTOREMOVE              = 120000,               // ms
    MAX_OFFLINE_TIME                = 30,                   // secs
    RESPAWN_IMMEDIATELY             = 0,                    // secs
    RESPAWN_2MINUTES                = 120,                  // secs
    BUFF_RESPAWN_TIME               = 180,                  // secs
    RESPAWN_NEVER                   = 31536000,             // secs (1 year)
};

enum BattleGroundStartTimeIntervals
{
    BG_START_DELAY_2M               = 120000,               // ms (2 minutes)
    BG_START_DELAY_1M               = 60000,                // ms (1 minute)
    BG_START_DELAY_30S              = 30000,                // ms (30 seconds)
    BG_START_DELAY_NONE             = 0,                    // ms
};

enum BattleGroundBuffObjects
{
    BG_OBJECTID_SPEEDBUFF_ENTRY     = 179871,
    BG_OBJECTID_REGENBUFF_ENTRY     = 179904,
    BG_OBJECTID_BERSERKERBUFF_ENTRY = 179905
};

uint32 const g_buffEntries[3] = { BG_OBJECTID_SPEEDBUFF_ENTRY, BG_OBJECTID_REGENBUFF_ENTRY, BG_OBJECTID_BERSERKERBUFF_ENTRY };

enum BattleGroundStatus
{
    STATUS_NONE         = 0,                                // first status, should mean bg is not instance
    STATUS_WAIT_QUEUE   = 1,                                // means bg is empty and waiting for queue
    STATUS_WAIT_JOIN    = 2,                                // this means, that BG has already started and it is waiting for more players
    STATUS_IN_PROGRESS  = 3,                                // means bg is running
    STATUS_WAIT_LEAVE   = 4                                 // means some faction has won BG and it is ending
};

struct BattleGroundPlayer
{
    Team    playerTeam;                                     // Player's team
};

// handle the queue types and bg types separately to enable joining queue for different sized arenas at the same time
enum BattleGroundQueueTypeId
{
    BATTLEGROUND_QUEUE_NONE     = 0,
    BATTLEGROUND_QUEUE_AV       = 1,
    BATTLEGROUND_QUEUE_WS       = 2,
    BATTLEGROUND_QUEUE_AB       = 3,
};
#define MAX_BATTLEGROUND_QUEUE_TYPES 4

enum BattleGroundBracketId                                  // bracketId for level ranges
{
    BG_BRACKET_ID_NONE           = -1,
    BG_BRACKET_ID_FIRST          = 0,                       // brackets start from specific BG min level and each include 10 levels range
    BG_BRACKET_ID_LAST           = 5,                       // so for start level 10 will be 10-19, 20-29, ...  all greater max bg level included in last bracket

    MAX_BATTLEGROUND_BRACKETS    = 6                        // used as one from values, so in enum
};

enum ScoreType
{
    SCORE_KILLING_BLOWS         = 1,
    SCORE_DEATHS                = 2,
    SCORE_HONORABLE_KILLS       = 3,
    SCORE_BONUS_HONOR           = 4,
    //WS
    SCORE_FLAG_CAPTURES         = 7,
    SCORE_FLAG_RETURNS          = 8,
    //AB
    SCORE_BASES_ASSAULTED       = 9,
    SCORE_BASES_DEFENDED        = 10,
    //AV
    SCORE_GRAVEYARDS_ASSAULTED  = 11,
    SCORE_GRAVEYARDS_DEFENDED   = 12,
    SCORE_TOWERS_ASSAULTED      = 13,
    SCORE_TOWERS_DEFENDED       = 14,
    SCORE_SECONDARY_OBJECTIVES  = 15
};

enum BattleGroundWinner
{
    WINNER_HORDE            = 0,
    WINNER_ALLIANCE         = 1,
    WINNER_NONE             = 2
};

enum BattleGroundTeamIndex
{
    BG_TEAM_ALLIANCE        = 0,
    BG_TEAM_HORDE           = 1
};

#define BG_TEAMS_COUNT  2

enum BattleGroundStartingEvents
{
    BG_STARTING_EVENT_NONE  = 0x00,
    BG_STARTING_EVENT_1     = 0x01,
    BG_STARTING_EVENT_2     = 0x02,
    BG_STARTING_EVENT_3     = 0x04,
    BG_STARTING_EVENT_4     = 0x08,
    BG_DOORS_DESPAWNED      = 0x10,
};

enum BattleGroundStartingEventsIds
{
    BG_STARTING_EVENT_FIRST     = 0,
    BG_STARTING_EVENT_SECOND    = 1,
    BG_STARTING_EVENT_THIRD     = 2,
    BG_STARTING_EVENT_FOURTH    = 3
};
#define BG_STARTING_EVENT_COUNT 4

enum BattleGroundCreatureSpawnMode
{
    DESPAWN_FORCED   = 0,
    RESPAWN_STOP     = 1,
    RESPAWN_START    = 2,
    RESPAWN_FORCED   = 3
};
#define BG_CREATURE_SPAWN_MODE_COUNT 4

enum BattleGroundJoinError
{
    BG_JOIN_ERR_OK = 0,
    BG_JOIN_ERR_OFFLINE_MEMBER = 1,
    BG_JOIN_ERR_GROUP_TOO_MANY = 2,
    BG_JOIN_ERR_MIXED_FACTION = 3,
    BG_JOIN_ERR_MIXED_LEVELS = 4,
    //BG_JOIN_ERR_MIXED_ARENATEAM = 5,
    BG_JOIN_ERR_GROUP_MEMBER_ALREADY_IN_QUEUE = 6,
    BG_JOIN_ERR_GROUP_DESERTER = 7,
    BG_JOIN_ERR_ALL_QUEUES_USED = 8,
    BG_JOIN_ERR_GROUP_NOT_ENOUGH = 9
};

#endif
