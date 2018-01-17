/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef DEF_RUINS_OF_AHNQIRAJ_H
#define DEF_RUINS_OF_AHNQIRAJ_H

/* Juste un rappel : */
// enum EncounterState
// {
//    NOT_STARTED   = 0,
//    IN_PROGRESS   = 1,
//    FAIL          = 2,
//    DONE          = 3,
//    SPECIAL       = 4
// };

//#define DEBUG_MODE

struct SpawnLocations
{
    float x, y, z;
};

enum
{
    TYPE_KURINNAXX          = 0,
    TYPE_GENERAL_ANDOROV    = 1,
    TYPE_RAJAXX             = 2,
    INSTANCE_RUINS_AQ_MAX_ENCOUNTER           = 3,

    TYPE_BURU               = 4,
    TYPE_MOAM               = 5,
    TYPE_AYAMISS            = 6,
    TYPE_OSSIRIAN           = 7,
    TYPE_QIRAJI_GLADIATOR   = 8,
};

/* Ce type de data = le compte des mobs vivants dans chaque vague.
    L'instance fait le décompte grace a OnCreatureDeath */
#define WAVE_MAX 7
#define WAVE_OFFSET 10
#define WAVE_MEMBERS_INIT_COUNT 7
enum
{
    TYPE_WAVE1              = WAVE_OFFSET,
    TYPE_WAVE2              = WAVE_OFFSET+1,
    TYPE_WAVE3              = WAVE_OFFSET+2,
    TYPE_WAVE4              = WAVE_OFFSET+3,
    TYPE_WAVE5              = WAVE_OFFSET+4,
    TYPE_WAVE6              = WAVE_OFFSET+5,
    TYPE_WAVE7              = WAVE_OFFSET+6
};

enum
{
    DATA_KURINNAXX      = 0,
    DATA_RAJAXX         = 1,
    DATA_BURU           = 2,
    DATA_AYAMIS         = 3,
    DATA_MOAM           = 4,
    DATA_OSSIRIAN       = 5,
    DATA_ANDOROV        = 6,

    DATA_QEEZ           = 7,
    DATA_TUUBID         = 8,
    DATA_DRENN          = 9,
    DATA_XURREM         = 10,
    DATA_YEGGETH        = 11,
    DATA_PAKKON         = 12,
    DATA_ZERRAN         = 13,

    DATA_CRYSTAL        = 14,
    DATA_CRYSTAL_INIT   = 15,
    DATA_YEGGETH_SHIELD = 16,
};

enum
{
    NPC_MOAM            =   15340,
    NPC_AYAMISS         =   15369,
    NPC_OSSIRIAN        =   15339,
    NPC_BURU            =   15370,
    NPC_RAJAXX          =   15341,
    NPC_SWARMGUARD_NEEDLER = 15344,
    NPC_KURINNAXX       =   15348,
    NPC_COLONEL_ZERRAN  =   15385,
    NPC_MAJOR_YEGGETH   =   15386,
    NPC_QIRAJI_WARRIOR  =   15387,
    NPC_MAJOR_PAKKON    =   15388,
    NPC_CAPTAIN_DRENN   =   15389,
    NPC_CAPTAIN_XURREM  =   15390,
    NPC_CAPTAIN_TUUBID  =   15392,
    NPC_CAPTAIN_QEEZ    =   15391,
    NPC_KALDOREI_ELITE  =   15473,
    NPC_GENERAL_ANDOROV =   15471,

    // Crystal Weaknesses
    SPELL_FIRE_WEAKNESS         =   25177,
    SPELL_NATURE_WEAKNESS       =   25180,
    SPELL_FROST_WEAKNESS        =   25178,
    SPELL_ARCANE_WEAKNESS       =   25171,
    SPELL_SHADOW_WEAKNESS       =   25183,

    GO_OSSIRIAN_CRYSTAL = 180619,
    CRYSTAL_TRIGGER     = 15590
};

#ifdef DEBUG_MODE
enum
{
    AQ_RESPAWN_3_MINUTES    = 6,
    AQ_RESPAWN_5_MINUTES    = 60,
    AQ_RESPAWN_15_MINUTES   = 45,
    AQ_RESPAWN_FOUR_DAYS    = 345600
};
#else
enum
{
    AQ_RESPAWN_3_MINUTES    = 60,
    AQ_RESPAWN_5_MINUTES    = 300,
    AQ_RESPAWN_15_MINUTES   = 900,
    AQ_RESPAWN_FOUR_DAYS    = 345600
};
#endif

#endif
