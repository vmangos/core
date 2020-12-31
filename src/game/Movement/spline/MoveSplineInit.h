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

#ifndef MANGOSSERVER_MOVESPLINEINIT_H
#define MANGOSSERVER_MOVESPLINEINIT_H

#include "MoveSplineInitArgs.h"
#include "PathFinder.h"
#include "MotionMaster.h"

class Unit;

namespace Movement
{
    /*  Initializes and launches spline movement
     */
    class MoveSplineInit
    {
        public:

            explicit MoveSplineInit(Unit& m, char const* movementType = "Unknown");

            /* Final pass of initialization that launches spline movement.
             * @return duration - estimated travel time
             */
            int32 Launch();

            /* Adds final facing animation
             * sets unit's facing to specified point/angle after all path done
             * you can have only one final facing: previous will be overriden
             */
            void SetFacing(float angle);
            void SetFacing(Vector3 const& point);
            void SetFacingGUID(uint64 guid);

            /* Initializes movement by path
             * @param path - array of points, shouldn't be empty
             * @param pointId - Id of fisrt point of the path. Example: when third path point will be done it will notify that pointId + 3 done
             */
            void MovebyPath(PointsArray const& path, int32 pointId = 0);
            void Move(PathFinder const* pfinder);

            /* Initializes simple A to B mition, A is current unit's position, B is destination
             */
            void MoveTo(Vector3 const& destination, uint32 options = 0);
            void MoveTo(float x, float y, float z, uint32 options = 0);

            /* Sets Id of fisrt point of the path. When N-th path point will be done ILisener will notify that pointId + N done
             * Needed for waypoint movement where path splitten into parts
             */
            void SetFirstPointId(int32 pointId) { args.path_Idx_offset = pointId; }

            /* Enables CatmullRom spline interpolation mode, enables flying animation. Disabled by default
             */
            void SetFly();
            /* Enables walk mode. Disabled by default
             */
            void SetWalk(bool enable);
            /* Makes movement cyclic. Disabled by default
             */
            void SetCyclic();
            /* Enables falling mode. Disabled by default
             */
            void SetFall();
            void SetStop();

            /* Sets the velocity (in case you want to have custom movement velocity)
             * if no set, speed will be selected based on unit's speeds and current movement mode
             * Has no effect if falling mode enabled
             * velocity shouldn't be negative
             */
            void SetVelocity(float velocity);

            /* Sets the transport guid used for computation
             * If used, all positions should be offsets relative to transport center position
             */
            void SetTransport(uint32 transportLowGuid);

            PointsArray& Path() { return args.path; }

        protected:

            MoveSplineInitArgs args;
            Unit&  unit;
            char const* movementType;
    };

    inline void MoveSplineInit::SetStop() { args.flags.done = true; }
    inline void MoveSplineInit::SetFly() { args.flags.flying = true;}
    inline void MoveSplineInit::SetWalk(bool enable) { args.flags.runmode = !enable;}
    inline void MoveSplineInit::SetCyclic() { args.flags.cyclic = true;}
    inline void MoveSplineInit::SetFall() { args.flags.falling = true;}
    inline void MoveSplineInit::SetVelocity(float vel) { args.velocity = vel;}
    inline void MoveSplineInit::SetTransport(uint32 guid) { args.transportGuid = guid;}

    inline void MoveSplineInit::MovebyPath(PointsArray const& controls, int32 path_offset)
    {
        args.path_Idx_offset = path_offset;
        args.path.assign(controls.begin(), controls.end());
    }

    inline void MoveSplineInit::MoveTo(float x, float y, float z, uint32 options)
    {
        Vector3 v(x, y, z);
        MoveTo(v, options);
    }

    inline void MoveSplineInit::MoveTo(Vector3 const& dest, uint32 options)
    {
        if (options & MOVE_PATHFINDING)
        {
            PathFinder path(&unit);
            if (options & MOVE_EXCLUDE_STEEP_SLOPES)
                path.ExcludeSteepSlopes();
            path.setUseStrightPath(options & MOVE_STRAIGHT_PATH);
            path.calculate(dest.x, dest.y, dest.z, options & MOVE_FORCE_DESTINATION);
            Move(&path);
        }
        else
        {
            args.path_Idx_offset = 0;
            args.path.resize(2);
            args.path[1] = dest;
        }
    }

    inline void MoveSplineInit::SetFacing(Vector3 const& spot)
    {
        args.facing.f.x = spot.x;
        args.facing.f.y = spot.y;
        args.facing.f.z = spot.z;
        args.flags.EnableFacingPoint();
    }
}
#endif // MANGOSSERVER_MOVESPLINEINIT_H
