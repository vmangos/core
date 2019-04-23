/*
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

#ifndef MANGOS_GUARD_MGR_H
#define MANGOS_GUARD_MGR_H

#include "Common.h"
#include "SharedDefines.h"
#include "Platform/Define.h"
#include "Policies/Singleton.h"
#include <unordered_map>

#define GUARD_POST_MAX_CHARGES 10

class Creature;
class Player;

struct AreaGuardInfo
{
    AreaGuardInfo(uint32 creature_id_ally, uint32 creature_id_horde) : creatureIdAlliance(creature_id_ally), creatureIdHorde(creature_id_horde), cooldown(0), charges(GUARD_POST_MAX_CHARGES) {}
    uint32 const creatureIdAlliance;
    uint32 const creatureIdHorde;
    uint32 cooldown;
    uint32 charges;
};

class GuardMgr
{
    public:
        GuardMgr();
        ~GuardMgr() {}
        void Update(uint32 diff);
        uint32 GetTextId(uint32 factionTemplateId, uint32 areaId, uint32 displayId) const;
        bool SummonGuard(Creature* pCivilian, Player* pEnemy);
    private:
        std::unordered_map<uint32, AreaGuardInfo> m_mAreaGuardInfo;
        uint32 m_uiRechargeTimer;
};

#define sGuardMgr MaNGOS::Singleton<GuardMgr>::Instance()

#endif
