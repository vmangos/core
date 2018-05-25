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

template<class T>
class MANGOS_DLL_SPEC RandomMovementGenerator
: public MovementGeneratorMedium< T, RandomMovementGenerator<T> >
{
    public:
        explicit RandomMovementGenerator(const Creature &creature, bool use_current_position = false, float wander_distance = 0.0f) : i_nextMoveTime(0), i_nextMove(0)
        {
            if (use_current_position)
            {
                creature.GetPosition(i_positionX, i_positionY, i_positionZ);
                i_wanderDistance = wander_distance > 0.0f ? wander_distance : 5.0f;
            }
            else
            {
                creature.GetRespawnCoord(i_positionX, i_positionY, i_positionZ, nullptr, &i_wanderDistance);
                if (wander_distance > 0.0f)
                    i_wanderDistance = wander_distance;
            }
        }

        void _setRandomLocation(T &);
        void Initialize(T &);
        void Finalize(T &);
        void Interrupt(T &);
        void Reset(T &);
        bool Update(T &, const uint32 &);
        void UpdateAsync(T &, uint32 diff);
        MovementGeneratorType GetMovementGeneratorType() const { return RANDOM_MOTION_TYPE; }

        bool GetResetPosition(T&, float& x, float& y, float& z);
    private:
        ShortTimeTracker i_nextMoveTime;
        uint32 i_nextMove;
        float i_positionX;
        float i_positionY;
        float i_positionZ;
        float i_positionO;
        float i_wanderDistance;
};

#endif
