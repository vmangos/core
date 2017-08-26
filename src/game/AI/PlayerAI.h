/*
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2010 MaNGOSZero <http://github.com/mangoszero/mangoszero/>
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

#ifndef MANGOS_PLAYERAI_H
#define MANGOS_PLAYERAI_H

#include "Common.h"
#include "Platform/Define.h"
#include "Policies/Singleton.h"
#include "Dynamic/ObjectRegistry.h"
#include "Dynamic/FactoryHolder.h"
#include "CreatureAI.h" // Pour 'enum CanCastResult'

class WorldObject;
class Unit;
class Creature;
class Player;
class SpellEntry;

class MANGOS_DLL_SPEC PlayerAI
{
    public:
        explicit PlayerAI(Player* pPlayer) : me(pPlayer), enablePositiveSpells(false) {}
        virtual ~PlayerAI();
        void SetPlayer(Player* player) { me = player; }
        virtual void Remove();

        // Called at World update tick
        virtual void UpdateAI(const uint32 /*diff*/);
        virtual void MovementInform(uint32 MovementType, uint32 Data = 0) {}

        ///== Helpeurs =====================================
        CanCastResult CanCastSpell(Unit* pTarget, const SpellEntry *pSpell, bool isTriggered, bool checkControlled = true);

        ///== Fields =======================================

        // Pointer to controlled by AI player
        Player* me;
        bool enablePositiveSpells;
};

class MANGOS_DLL_SPEC PlayerControlledAI: public PlayerAI
{
    public:
        explicit PlayerControlledAI(Player* pPlayer, Unit* caster = NULL);

        virtual ~PlayerControlledAI();

        // Called at World update tick
        virtual void UpdateAI(const uint32 /*diff*/);
        Unit* FindController();
        void UpdateTarget(Unit* victim);

        ///== Fields =======================================
        ObjectGuid controllerGuid;
        uint32 uiGlobalCD;
        std::vector<uint32> usableSpells;
        bool bIsMelee;
        bool isHealer;
        
};

#endif
