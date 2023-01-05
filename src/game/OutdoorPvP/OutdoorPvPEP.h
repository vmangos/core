/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.TrinityCore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef OUTDOOR_PVP_EP_
#define OUTDOOR_PVP_EP_

#include "ZoneScript.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2

enum EP_WorldStates 
{
    EASTWALL_TOWER_ALLIANCE                 = 2354, // Blue Tower icon on map
    EASTWALL_TOWER_HORDE                    = 2356, // Red Tower icon on map
    EASTWALL_TOWER_ALLIANCE_PROGRESSING     = 2357, // Blue Tower icon on map
    EASTWALL_TOWER_HORDE_PROGRESSING        = 2358, // Red Tower icon on map
    EASTWALL_TOWER_ALLIANCE_CONTESTED       = 2359, // Grey Tower icon on map
    EASTWALL_TOWER_HORDE_CONTESTED          = 2360, // Grey Tower icon on map
    EASTWALL_TOWER_NEUTRAL                  = 2361, // Grey Tower icon on map

    NORTHPASS_TOWER_ALLIANCE                = 2372, // Blue Tower icon on map
    NORTHPASS_TOWER_HORDE                   = 2373, // Red Tower icon on map
    NORTHPASS_TOWER_ALLIANCE_PROGRESSING    = 2364, // Blue Tower icon on map
    NORTHPASS_TOWER_HORDE_PROGRESSING       = 2365, // Red Tower icon on map
    NORTHPASS_TOWER_ALLIANCE_CONTESTED      = 2362, // Grey Tower icon on map
    NORTHPASS_TOWER_HORDE_CONTESTED         = 2363, // Grey Tower icon on map
    NORTHPASS_TOWER_NEUTRAL                 = 2352, // Grey Tower icon on map

    PLAGUEWOOD_TOWER_ALLIANCE               = 2370, // Blue Tower icon on map
    PLAGUEWOOD_TOWER_HORDE                  = 2371, // Red Tower icon on map
    PLAGUEWOOD_TOWER_ALLIANCE_PROGRESSING   = 2368, // Blue Tower icon on map
    PLAGUEWOOD_TOWER_HORDE_PROGRESSING      = 2369, // Red Tower icon on map
    PLAGUEWOOD_TOWER_ALLIANCE_CONTESTED     = 2366, // Grey Tower icon on map
    PLAGUEWOOD_TOWER_HORDE_CONTESTED        = 2353, // WORLDSTATE 2367 is not working client side ".debug send worldstate 2367 1"
    PLAGUEWOOD_TOWER_NEUTRAL                = 2353, // Grey Tower icon on map

    CROWN_GUARD_TOWER_ALLIANCE              = 2378, // Blue Tower icon on map
    CROWN_GUARD_TOWER_HORDE                 = 2379, // Red Tower icon on map
    CROWN_GUARD_TOWER_ALLIANCE_PROGRESSING  = 2376, // Blue Tower icon on map
    CROWN_GUARD_TOWER_HORDE_PROGRESSING     = 2377, // Red Tower icon on map
    CROWN_GUARD_TOWER_ALLIANCE_CONTESTED    = 2374, // Grey Tower icon on map
    CROWN_GUARD_TOWER_HORDE_CONTESTED       = 2375, // Grey Tower icon on map
    CROWN_GUARD_TOWER_NEUTRAL               = 2355, // Grey Tower icon on map

    EP_UI_TOWER_SLIDER_DISPLAY  = 2426,
    EP_UI_TOWER_SLIDER_POS      = 2427,
    EP_UI_TOWER_SLIDER_N        = 2428,

    EP_UI_TOWER_COUNT_ALLIANCE  = 2327,
    EP_UI_TOWER_COUNT_HORDE     = 2328,
};

enum EP_Summons
{
    EP_EWT_COMMANDER = 0,
    EP_EWT_SOLDIER1,
    EP_EWT_SOLDIER2,
    EP_EWT_SOLDIER3,
    EP_EWT_SOLDIER4,
    EP_PWT_FLIGHTMASTER,
    EP_PWT_BUFFER,
    EP_CGT_BUFFER,
    EP_EWT_BUFFER,
    EP_NPT_BUFFER,
    EP_PWT_FLARE,
    EP_CGT_FLARE,
    EP_EWT_FLARE,
    EP_NPT_FLARE,
    EP_CGT_SPIRITOFVICTORY,
};

enum EP_GoSummons
{
    EP_CGT_FLAG1            = 0,
    EP_CGT_FLAG2            = 1,
    EP_EWT_FLAG1            = 2,
    EP_EWT_FLAG2            = 3,
    EP_PWT_FLAG1            = 4,
    EP_PWT_FLAG2            = 5,
    EP_NPT_FLAG1            = 6,
    EP_NPT_FLAG2            = 7,
    EP_NPT_CURING_SHRINE    = 8,
    EP_NPT_BANNER_AURA      = 9,
    EP_CGT_BANNER_AURA      = 10
};

enum EP_BroadCastTexts
{
    BCT_EP_PWT_TAKEN_A      = 13629, // |cffffff00The Plaguewood Tower has been taken by the Alliance!| r
    BCT_EP_NPT_TAKEN_A      = 13630, // |cffffff00Northpass Tower has been taken by the Alliance!| r
    BCT_EP_EWT_TAKEN_A      = 13631, // |cffffff00Eastwall Tower has been taken by the Alliance!| r
    BCT_EP_CGT_TAKEN_A      = 13632, // |cffffff00Crown Guard Tower has been taken by the Alliance!| r
    BCT_EP_CGT_TAKEN_H      = 13633, // |cffffff00Crown Guard Tower has been taken by the Horde!| r
    BCT_EP_PWT_TAKEN_H      = 13634, // |cffffff00The Plaguewood Tower has been taken by the Horde!| r
    BCT_EP_NPT_TAKEN_H      = 13635, // |cffffff00Northpass Tower has been taken by the Horde!| r
    BCT_EP_EWT_TAKEN_H      = 13636, // |cffffff00Eastwall Tower has been taken by the Horde!| r
    BCT_EP_ALL_TAKEN_H      = 13637, // |cffff0000All four towers are now in control of the Horde!| r
    BCT_EP_ALL_TAKEN_A      = 13638, // |cff33ccffAll four towers are now in control of the Alliance!| r
    BCT_EP_EWT_SPAWN_SAY    = 14746  // The Northpass tower needs our aid!  Once again, let us charge and do proud or liege!
};

enum EP_Sounds
{
    SOUND_PVPFLAGCAPTUREDALLIANCE   = 8173, // 17794 Creature
    SOUND_PVPFLAGCAPTUREDHORDE      = 8213, // 17795 Creature
    SOUND_TUGOFWAR_VICTORY_HORDE    = 9283, // 17795 Creature
    SOUND_PVPVICTORYHORDE           = 8454, // 182106 GameObject
    SOUND_PVPVICTORYALLIANCE        = 8455, // 182106 GameObject
};

enum EP_Spells
{
    SPELL_TXT_TOWOW_TOWER_KILL_CREDIT_DND       = 32061, // Casted by Players which have the Quest on Eastwall Capture Quest Doodad. 
    SPELL_TOWER_CAPTURE_TEST_DND                = 30882, // Casted by Alliance Tower Buffer and Horde Tower Buffer on all Players within 100 yards (77) Script Effect. 
    SPELL_TOWER_CAPTURE_DND                     = 31929, // Casted by Players.
    SPELL_SPIRIT_SPAWN_IN                       = 17321, // Casted by Spirit of Victory.
    SPELL_SPIRIT_PARTICLES                      = 17327,
    SPELL_SPIRIT_PARTICLES_RED_BIG              = 31309,
    SPELL_SPIRIT_PARTICLES_SUPER_BIG_DND        = 31954,
    SPELL_SPIRIT_PARTICLES_RED_SUPER_BIG_DND    = 31951,
    SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_1      = 30880,
    SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_2      = 30683,
    SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_3      = 30682,
    SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_4      = 29520,
    SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_1   = 11413,
    SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_2   = 11414,
    SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_3   = 11415,
    SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_4   = 1386
};

enum EP_NPCs
{
    NPC_SPIRIT_OF_VICTORY       = 18039,
    NPC_WILLIAM_KIELAR          = 17209,
    NPC_ALLIANCE_TOWER_BUFFER   = 17794,
    NPC_HORDE_TOWER_BUFFER      = 17795,
    NPC_LORDAERON_COMMANDER     = 17635,
    NPC_LORDAERON_SOLDIER       = 17647,
    NPC_LORDAERON_VETERAN       = 17995,
    NPC_LORDAERON_FIGHTER       = 17996
};

enum EP_Towers
{
    EP_EWT          = 0,    // plaguelands 03
    EP_NPT,                 // plaguelands 01
    EP_PWT,                 // plaguelands 04
    EP_CGT,                 // plaguelands 02
    EP_TOWER_NUM,
    EP_FLAG_NUM     = 8
};

enum EP_Flares
{
    EP_FLARE_CGT_A = 0,
    EP_FLARE_CGT_H,
    EP_FLARE_EWT_A,
    EP_FLARE_EWT_H,
    EP_FLARE_NPT_A,
    EP_FLARE_NPT_H,
    EP_FLARE_PWT_A,
    EP_FLARE_PWT_H,
    EP_FLARE_NUM = 8
};

enum EP_Buffers
{
    EP_BUFFER_CGT_A = 0,
    EP_BUFFER_EWT_A,
    EP_BUFFER_PWT_A,
    EP_BUFFER_NPT_A,
    EP_BUFFER_CGT_H,
    EP_BUFFER_EWT_H,
    EP_BUFFER_PWT_H,
    EP_BUFFER_NPT_H
};

enum EP_TowerStates
{
    TOWERSTATE_NEUTRAL                  = 1,
    TOWERSTATE_ALLIANCE_CONTESTED       = 2,
    TOWERSTATE_HORDE_CONTESTED          = 4,
    TOWERSTATE_ALLIANCE_PROGRESSING     = 8,
    TOWERSTATE_HORDE_PROGRESSING        = 16,
    TOWERSTATE_ALLIANCE                 = 32,
    TOWERSTATE_HORDE                    = 64
};

enum EP_Gobjects
{
    GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS03   = 182097,
    GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS01   = 181899,
    GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS04   = 182098,
    GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS02   = 182096,
    GOBJECT_TOWER_BANNER                                        = 182106,
    GOBJECT_CURING_SHRINE_ALLIANCE                              = 181682,
    GOBJECT_ALLIANCE_BANNER_AURA                                = 180100,
    GOBJECT_CURING_SHRINE_HORDE                                 = 181955,
    GOBJECT_HORDE_BANNER_AURA                                   = 180101,
    GOBJECT_HORDE_BANNER_AURA_LARGE                             = 180422,
    GOBJECT_ALLIANCE_BANNER_AURA_LARGE                          = 180421,
    GOBJECT_FLAG_FLARE_ALLIANCE                                 = 181852,
    GOBJECT_FLAG_FLARE_HORDE                                    = 181853
};

uint32 const EP_AllianceBuffs[4] = { SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_1, SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_2, SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_3, SPELL_ALLIANCE_ECHOES_OF_LORDAERON_RANK_4 };

uint32 const EP_HordeBuffs[4] = { SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_1, SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_2, SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_3, SPELL_HORDE_ECHOES_OF_LORDAERON_RANK_4 };

uint32 const EP_Zone = 139; // Eastern Plaguelands.
uint32 const TFV_area = 2258; // The Fungal Vale.

uint32 const EP_GraveYardId = 927;

uint8 const EPBuffZonesNum = 3;

uint32 const EP_EWT_CM = 17690;
uint32 const EP_CGT_CM = 17689;
uint32 const EP_NPT_CM = 17696;
uint32 const EP_PWT_CM = 17698;

uint32 const EPBuffZones[EPBuffZonesNum] = { 139, 2017, 2057 };

uint32 const EPTowerPlayerEnterEvents[EP_TOWER_NUM] = { 10691, 10699, 10701, 10705 };

uint32 const EPTowerPlayerLeaveEvents[EP_TOWER_NUM] = { 10692, 10698, 10700, 10704 };

uint8 const EP_EWT_NUM_CREATURES = 5;

// All positions below are sniffed.

const creature_type EPBufferNPCs[8] =
{
    { NPC_ALLIANCE_TOWER_BUFFER, 469, 0, 1860.59f, -3730.8f, 197.854f, 2.54818f },
    { NPC_ALLIANCE_TOWER_BUFFER, 469, 0, 2574.12f, -4795.33f, 145.871f, 5.11381f },
    { NPC_ALLIANCE_TOWER_BUFFER, 469, 0, 2962.6f, -3041.96f, 155.835f, 3.00197f },
    { NPC_ALLIANCE_TOWER_BUFFER, 469, 0, 3180.54f, -4379.31f, 175.275f, 3.57792f },
    { NPC_HORDE_TOWER_BUFFER, 67, 0, 1860.48f, -3731.34f, 197.778f, 2.42601f },
    { NPC_HORDE_TOWER_BUFFER, 67, 0, 2574.0f, -4794.79f, 145.881f, 1.95477f },
    { NPC_HORDE_TOWER_BUFFER, 67, 0, 2963.02f, -3041.9f, 155.965f, 4.27606f },
    { NPC_HORDE_TOWER_BUFFER, 67, 0, 3180.48f, -4379.07f, 174.995f, 2.74017f }
};

const go_type EPCapturePoints[EP_TOWER_NUM] =
{
    { GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS03, 0, 2574.51f, -4794.89f, 144.704f, -1.45003f, -0.097056f, 0.095578f, -0.656229f, 0.742165f },
    { GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS01, 0, 3181.08f, -4379.36f, 174.123f, -2.03472f, -0.065392f, 0.119494f, -0.842275f, 0.521553f },
    { GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS04, 0, 2962.71f, -3042.31f, 154.789f, 2.08426f, -0.074807f, -0.113837f, 0.855928f, 0.49883f },
    { GOBJECT_DOODAD_BATTLEFIELDBANNER_STATE_BASE_PLAGUELANDS02, 0, 1860.85f, -3731.23f, 196.716f, -2.53214f, 0.033967f, -0.131914f, 0.944741f, -0.298177f }
};

const go_type EPTowerFlags[EP_FLAG_NUM] =
{
    { GOBJECT_TOWER_BANNER, 0, 1838.42f, -3703.56f, 167.713f, 0.890117f, 0.0f, 0.0f, 0.43051f, 0.902586f },
    { GOBJECT_TOWER_BANNER, 0, 1877.6f, -3716.76f, 167.188f, 1.74533f, 0.0f, 0.0f, 0.766044f, 0.642789f },
    { GOBJECT_TOWER_BANNER, 0, 2539.61f, -4801.55f, 115.766f, 2.00713f, 0.0f, 0.0f, 0.843391f, 0.5373f },
    { GOBJECT_TOWER_BANNER, 0, 2569.6f, -4772.93f, 115.399f, 2.72271f, 0.0f, 0.0f, 0.978148f, 0.207912f },
    { GOBJECT_TOWER_BANNER, 0, 2975.5f, -3060.36f, 125.108f, 5.23599f, 0.0f, 0.0f, -0.5f, 0.866025f },
    { GOBJECT_TOWER_BANNER, 0, 2992.63f, -3022.95f, 125.593f, 3.03684f, 0.0f, 0.0f, 0.998629f, 0.0523532f },
    { GOBJECT_TOWER_BANNER, 0, 3148.17f, -4365.51f, 145.029f, 1.53589f, 0.0f, 0.0f, 0.694658f, 0.71934f },
    { GOBJECT_TOWER_BANNER, 0, 3188.76f, -4358.5f, 144.555f, 1.97222f, 0.0f, 0.0f, 0.833885f, 0.551938f }
};

const go_type EPTowerFlares[EP_FLARE_NUM] =
{
    { GOBJECT_FLAG_FLARE_ALLIANCE, 0, 1855.66f, -3725.0f, 197.044f, 1.53589f, 0.0f, 0.0f, 0.694658f, 0.71934f },    // Flag Flaref, Alliance" in Crown Guard Tower.
    { GOBJECT_FLAG_FLARE_HORDE, 0, 1853.12f, -3722.62f, 197.406f, 0.628317f, 0.0f, 0.0f, 0.309016f, 0.951057f },    // Flag Flaref, Horde" in Crown Guard Tower.
    { GOBJECT_FLAG_FLARE_ALLIANCE, 0, 2563.26f, -4795.15f, 145.852f, 1.81514f, 0.0f, 0.0f, 0.788011f, 0.615662f },  // Flag Flaref, Alliance" in Eastwall Tower.
    { GOBJECT_FLAG_FLARE_HORDE, 0, 2565.27f, -4797.59f, 147.846f, 3.05433f, 0.0f, 0.0f, 0.999048f, 0.0436193f },    // Flag Flaref, Horde" in Eastwall Tower.
    { GOBJECT_FLAG_FLARE_ALLIANCE, 0, 3171.86f, -4377.2f, 174.898f, 0.174532f, 0.0f, 0.0f, 0.0871553f, 0.996195f }, // Flag Flaref, Alliance" in Northpass Tower.
    { GOBJECT_FLAG_FLARE_HORDE, 0, 3169.76f, -4375.13f, 175.458f, 2.70526f, 0.0f, 0.0f, 0.976295f, 0.216442f },     // Flag Flaref, Horde" in Northpass Tower.
    { GOBJECT_FLAG_FLARE_ALLIANCE, 0, 2971.41f, -3038.36f, 157.492f, 5.35816f, 0.0f, 0.0f, -0.446198f, 0.894935f }, // Flag Flaref, Alliance" in Plaguewood.
    { GOBJECT_FLAG_FLARE_HORDE, 0, 2973.17f, -3037.19f, 156.443f, 1.97222f, 0.0f, 0.0f, 0.833885f, 0.551938f }      // Flag Flaref, Horde" in Plaguewood.
};

const go_type EP_NPT_LordaeronShrine[4] =
{
    { GOBJECT_CURING_SHRINE_ALLIANCE, 0, 3167.72f, -4355.91f, 138.785f, 1.69297f, 0.0f, 0.0f, 0.748956f, 0.66262f },
    { GOBJECT_ALLIANCE_BANNER_AURA, 0, 3167.72f, -4355.91f, 138.785f, 1.69297f, 0.0f, 0.0f, 0.748956f, 0.66262f },
    { GOBJECT_CURING_SHRINE_HORDE, 0, 3167.5f, -4356.25f, 138.821f, 1.69297f, 0.0f, 0.0f, 0.748956f, 0.66262f },
    { GOBJECT_HORDE_BANNER_AURA, 0, 3167.5f, -4356.25f, 138.821f, 1.69297f, 0.0f, 0.0f, 0.748956f, 0.66262f }
};

const go_type EP_CGT_BannerAuraGraveYard[2] =
{
    { GOBJECT_HORDE_BANNER_AURA_LARGE, 0, 1985.47f, -3653.88f, 120.172f, 1.46608f, 0.0f, 0.0f, 0.66913f, 0.743145f },
    { GOBJECT_ALLIANCE_BANNER_AURA_LARGE, 0, 1985.47f, -3653.88f, 120.172f, 1.46608f, 0.0f, 0.0f, 0.66913f, 0.743145f }
};

const creature_type EP_EWT_Summons_A[EP_EWT_NUM_CREATURES] =
{
    { NPC_LORDAERON_COMMANDER, 469, 0, 2532.85f, -4764.92f, 103.617f, 2.35619f },
    { NPC_LORDAERON_SOLDIER, 469, 0, 2533.33f, -4769.31f, 104.396f, 2.37365f },
    { NPC_LORDAERON_SOLDIER, 469, 0, 2537.34f, -4773.92f, 105.941f, 2.21657f },
    { NPC_LORDAERON_SOLDIER, 469, 0, 2537.77f, -4765.94f, 104.432f, 2.3911f },
    { NPC_LORDAERON_SOLDIER, 469, 0, 2542.57f, -4770.22f, 106.145f, 2.42601f }
};

const creature_type EP_EWT_Summons_H[EP_EWT_NUM_CREATURES] =
{
    { NPC_LORDAERON_VETERAN, 67, 0, 2532.85f, -4764.92f, 103.617f, 2.35619f },
    { NPC_LORDAERON_FIGHTER, 67, 0, 2533.33f, -4769.31f, 104.396f, 2.37365f },
    { NPC_LORDAERON_FIGHTER, 67, 0, 2537.34f, -4773.92f, 105.941f, 2.21657f },
    { NPC_LORDAERON_FIGHTER, 67, 0, 2537.77f, -4765.94f, 104.432f, 2.3911f },
    { NPC_LORDAERON_FIGHTER, 67, 0, 2542.57f, -4770.22f, 106.145f, 2.42601f }
};

const creature_type EP_PWT_FlightMaster = { NPC_WILLIAM_KIELAR, 0, 0, 2987.5f, -3049.11f, 120.126f, 5.75959f };

const creature_type EP_CGT_SpiritOfVictory = { NPC_SPIRIT_OF_VICTORY, 0, 0, 1856.58f, -3714.72f, 194.637f, 0.762214f };

class OutdoorPvPEP;

class OPvPCapturePointEP_EWT : public OPvPCapturePoint
{
    friend class OutdoorPvPEP;

    public:

        OPvPCapturePointEP_EWT(OutdoorPvP * pvp);

        void ChangeState();

        void SendChangePhase();

        uint32 FillInitialWorldStates(WorldPacket& data);

        // used when player is activated/inactivated in the area
        bool HandlePlayerEnter(Player* plr);
        void HandlePlayerLeave(Player* plr);

    protected:

        void SummonSquadAtEastWallTower(uint32 team);

        void UpdateTowerState();

    protected:

        uint32 m_TowerState;

        uint32 m_UnitsSummonedSide;
};

class OPvPCapturePointEP_NPT : public OPvPCapturePoint
{
    friend class OutdoorPvPEP;

    public:

        OPvPCapturePointEP_NPT(OutdoorPvP * pvp);

        void ChangeState();

        void SendChangePhase();

        uint32 FillInitialWorldStates(WorldPacket& data);

        // used when player is activated/inactivated in the area
        bool HandlePlayerEnter(Player* plr);
        void HandlePlayerLeave(Player* plr);

    protected:

        void SummonCuringShrine(uint32 team);

        void UpdateTowerState();

    protected:

        uint32 m_TowerState;

        uint32 m_SummonedShrineSide;
};

class OPvPCapturePointEP_CGT : public OPvPCapturePoint
{
    friend class OutdoorPvPEP;

    public:

        OPvPCapturePointEP_CGT(OutdoorPvP * pvp);

        void ChangeState();

        void SendChangePhase();

        uint32 FillInitialWorldStates(WorldPacket& data);

        // used when player is activated/inactivated in the area
        bool HandlePlayerEnter(Player* plr);
        void HandlePlayerLeave(Player* plr);

    protected:

        void LinkGraveYard(Team team);

        void UnLinkGraveYard();

        void SummonSpiritOfVictory(uint32 team);

        void SummonBannerAura(uint32 team);

        void UpdateTowerState();

    protected:

        uint32 m_TowerState;

        uint32 m_SpiritOfVictorySpawned;

        Team m_GraveyardSide;

        uint32 m_SummonedBannerSide;
};

class OPvPCapturePointEP_PWT : public OPvPCapturePoint
{
    friend class OutdoorPvPEP;

    public:

        OPvPCapturePointEP_PWT(OutdoorPvP * pvp);

        void ChangeState();

        void SendChangePhase();

        uint32 FillInitialWorldStates(WorldPacket& data);

        // used when player is activated/inactivated in the area
        bool HandlePlayerEnter(Player* plr);
        void HandlePlayerLeave(Player* plr);

    protected:

        void SummonFlightMaster(uint32 team);

        void UpdateTowerState();

    protected:

        uint32 m_FlightMasterSpawned;

        uint32 m_TowerState;
};

class OutdoorPvPEP : public OutdoorPvP
{
    friend class OPvPCapturePointEP_EWT;
    friend class OPvPCapturePointEP_NPT;
    friend class OPvPCapturePointEP_PWT;
    friend class OPvPCapturePointEP_CGT;

    public:

        OutdoorPvPEP();

        bool SetupZoneScript();

        void OnPlayerEnter(Player* plr);
        void OnPlayerLeave(Player* plr);

        void Update(uint32 diff);

        uint32 FillInitialWorldStates(WorldPacket& data);

        void SendRemoveWorldStates(Player* plr);

        void BuffTeams();
        void TowerBuff(Creature* pCreature);

    private:

        // how many towers are controlled
        uint32 EP_Controls[EP_TOWER_NUM];

        uint32 m_AllianceTowersControlled;
        uint32 m_HordeTowersControlled;
};

#endif

#endif
