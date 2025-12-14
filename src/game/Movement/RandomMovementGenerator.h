/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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

#ifndef MANGOS_RANDOMMOTIONGENERATOR_H
#define MANGOS_RANDOMMOTIONGENERATOR_H

#include "MovementGenerator.h"
#include "G3D/Vector3.h"

class RandomMovementGenerator
: public MovementGeneratorMedium< Creature, RandomMovementGenerator >
{
    public:
        explicit RandomMovementGenerator(Creature const& creature, bool use_current_position = false, float wander_distance = 0.0f, uint32 expire_time = 0) : 
            i_nextMoveTime(1000), i_wanderDistance(5.0f), i_expireTime(expire_time), i_wanderSteps(0)
        {
            if (use_current_position)
                creature.GetPosition(i_startPosition.x, i_startPosition.y, i_startPosition.z);
            else
                creature.GetRespawnCoord(i_startPosition.x, i_startPosition.y, i_startPosition.z, nullptr, &i_wanderDistance);

            if (wander_distance > 0.0f)
                i_wanderDistance = wander_distance;
        }

        void _setRandomLocation(Creature&);
        void Initialize(Creature&);
        void Finalize(Creature&);
        void Interrupt(Creature&);
        void Reset(Creature&);
        bool Update(Creature&, uint32 const&);
        void UpdateAsync(Creature&, uint32 diff);
        MovementGeneratorType GetMovementGeneratorType() const { return RANDOM_MOTION_TYPE; }
        bool GetResetPosition(Creature&, float& x, float& y, float& z);

        void AddPauseTime(int32 waitTimeDiff)
        {
            if (i_nextMoveTime.GetExpiry() < waitTimeDiff)
                i_nextMoveTime.Reset(waitTimeDiff);
        }
        
    private:
        ShortTimeTracker i_nextMoveTime;
        G3D::Vector3 i_startPosition;
        float i_wanderDistance;
        uint32 i_expireTime;
        uint8 i_wanderSteps;
};

#endif
