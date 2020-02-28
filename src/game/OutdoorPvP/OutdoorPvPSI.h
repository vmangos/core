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

#ifndef OUTDOOR_PVP_SI_
#define OUTDOOR_PVP_SI_

#include "ZoneScript.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2

enum OutdoorPvPSISpells
{
    SI_SILITHYST_FLAG_GO_SPELL       = 29518,
    SI_SILITHYST_FLAG                = 29519,
    SI_TRACES_OF_SILITHYST           = 29534,
    SI_CENARION_FAVOR                = 30754
};

uint32 const SI_MAX_RESOURCES_DEFAULT = 200;
uint8 const OutdoorPvPSIBuffZonesNum = 3;
uint32 const OutdoorPvPSIBuffZones[OutdoorPvPSIBuffZonesNum] = { 1377, 3428, 3429 };
uint32 const SI_AREATRIGGER_H        = 4168;
uint32 const SI_AREATRIGGER_A        = 4162;
uint32 const SI_TURNIN_QUEST_CM_A    = 17090;
uint32 const SI_TURNIN_QUEST_CM_H    = 18199;
uint32 const SI_SILITHYST_MOUND      = 181597;

enum SI_WorldStates
{
    SI_GATHERED_A      = 2313,
    SI_GATHERED_H      = 2314,
    SI_SILITHYST_MAX   = 2317
};

class OutdoorPvPSI : public OutdoorPvP
{
    public:

        OutdoorPvPSI();

        bool SetupZoneScript();

        void OnPlayerEnter(Player* plr);
        void OnPlayerLeave(Player* plr);

        void Update(uint32 diff);

        uint32 FillInitialWorldStates(WorldPacket& data);

        void SendRemoveWorldStates(Player* plr);

        bool HandleAreaTrigger(Player* plr, uint32 trigger);

        bool HandleDropFlag(Player* plr, uint32 spellId);

        bool HandleCustomSpell(Player* plr, uint32 spellId, GameObject* go);

        void UpdateWorldState();

    private:

        uint32 m_Gathered_A;
        uint32 m_Gathered_H;
        uint32 m_MaxRessources;

        uint32 m_LastController;
};

#endif

#endif
