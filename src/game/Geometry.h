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

#ifndef _GEOMETRY
#define _GEOMETRY

#include "Common.h"

namespace Geometry
{
    // Return angle in range 0..2*pi
    inline float GetAngle(float ownX, float ownY, float targetX, float targetY)
    {
        float dx = ownX - targetX;
        float dy = ownY - targetY;

        float ang = atan2(dy, dx);
        ang = (ang >= 0) ? ang : 2 * M_PI_F + ang;
        return ang;
    }

    template<class T>
    float GetAngle(T const& ownPos, T const& targetPos)
    {
        return GetAngle(ownPos.x, ownPos.y, targetPos.x, targetPos.y);
    }

    inline float GetDistance2D(float ownX, float ownY, float targetX, float targetY)
    {
        float dx = ownX - targetX;
        float dy = ownY - targetY;
        float dist = sqrt((dx * dx) + (dy * dy));
        return (dist > 0 ? dist : 0);
    }

    template<class A, class B>
    float GetDistance2D(A const& from, B const& to)
    {
        return GetDistance2D(from.x, from.y, to.x, to.y);
    }

    inline float GetDistance3D(float ownX, float ownY, float ownZ, float targetX, float targetY, float targetZ)
    {
        float dx = ownX - targetX;
        float dy = ownY - targetY;
        float dz = ownZ - targetZ;
        float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
        return (dist > 0 ? dist : 0);
    }

    template<class A, class B>
    float GetDistance3D(A const& from, B const& to)
    {
        return GetDistance3D(from.x, from.y, from.z, to.x, to.y, to.z);
    }

    inline bool IsInRange2D(float ownX, float ownY, float targetX, float targetY, float minRange, float maxRange)
    {
        float dx = ownX - targetX;
        float dy = ownY - targetY;
        float distsq = dx * dx + dy * dy;

        // check only for real range
        if (minRange > 0.0f)
        {
            if (distsq < minRange * minRange)
                return false;
        }

        return distsq < maxRange * maxRange;
    }

    inline void GetNearPoint2DAroundPosition(float ownX, float ownY, float &x, float &y, float distance2d, float absAngle)
    {
        x = ownX + distance2d * cos(absAngle);
        y = ownY + distance2d * sin(absAngle);

        MaNGOS::NormalizeMapCoord(x);
        MaNGOS::NormalizeMapCoord(y);
    }

    // modulos a radian orientation to the range of 0..2PI
    inline float NormalizeOrientation(float o)
    {
        // fmod only supports positive numbers. Thus we have
        // to emulate negative numbers
        if (o < 0)
        {
            float mod = o *-1;
            mod = fmod(mod, 2.0f*M_PI_F);
            mod = -mod + 2.0f*M_PI_F;
            return mod;
        }
        return fmod(o, 2.0f*M_PI_F);
    }

    template<class A, class B>
    inline bool IsPointLeftOfLine(A const& lineStart, A const& lineEnd, B const& point)
    {
        return (lineEnd.x - lineStart.x) * (point.y - lineStart.y) - (lineEnd.y - lineStart.y) * (point.x - lineStart.x) > 0;
    }

    // Moves the second set of 2D coordinates closer to the first, or further if distance is negative.
    inline void Move2dPointTowards(float x1, float y1, float& x2, float& y2, float dist)
    {
        float dx = x1 - x2;
        float dy = y1 - y2;

        float len = sqrtf(dx * dx + dy * dy);
        if (len == 0.0f)
            return;

        float nx = dx / len;
        float ny = dy / len;

        x2 += nx * dist;
        y2 += ny * dist;
    }

    template<class A, class B>
    inline void Move2dPointTowards(A const& a, B& b, float dist)
    {
        Move2dPointTowards(a.x, a.y, b.x, b.y, dist);
    }
}

#endif
