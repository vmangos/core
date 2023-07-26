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

#ifndef MANGOS_CYCLICMOVEMENTGENERATOR_H
#define MANGOS_CYCLICMOVEMENTGENERATOR_H

#include "MovementGenerator.h"
#include "WaypointManager.h"

class Creature;

template < class T >
class CyclicMovementGenerator;

template <>
class CyclicMovementGenerator<Creature>
: public MovementGeneratorMedium< Creature, CyclicMovementGenerator<Creature> >
{
    public:

        CyclicMovementGenerator(Creature &) : i_path(nullptr), m_PathOrigin(PATH_NO_PATH) { }
        ~CyclicMovementGenerator() { i_path = nullptr; }

        void InitializeWaypointPath(Creature& creature, WaypointPathOrigin wpSource, uint32 overwriteGuid, uint32 overwriteEntry);
        void Initialize(Creature &);
        void Finalize(Creature &);
        void Interrupt(Creature &);
        void Reset(Creature &);
        bool Update(Creature &, uint32 const&);
        MovementGeneratorType GetMovementGeneratorType() const { return CYCLIC_MOTION_TYPE; }

    private:
        void LoadPath(uint32 guid, uint32 entry, WaypointPathOrigin wpOrigin);
        void _setTargetLocation(Creature &);
        WaypointPath const* i_path;
        WaypointPathOrigin m_PathOrigin;
};
#endif
