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

#ifndef MANGOS_BASICAI_H
#define MANGOS_BASICAI_H

#include "CreatureAI.h"

class BasicAI : public CreatureAI
{
    public:

        explicit BasicAI(Creature* c);

        void MoveInLineOfSight(Unit*) override;
        bool IsProximityAggroAllowedFor(Unit*) const;
        void UpdateAI(uint32 const) override;

        // Used for civillians that can summon guards.
        void JustRespawned() override;
        virtual void SummonedCreatureDespawn(Creature* /*pSummon*/) override;
        bool CanSummonGuards() const { return m_bCanSummonGuards; }
        void SummonGuard(Unit* /*pEnemy*/);

        static int Permissible(Creature const*);
    protected:
        bool m_bCanSummonGuards;
};

#endif
