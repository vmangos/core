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

#ifndef __MOVEMENT_INFO_H
#define __MOVEMENT_INFO_H

#include "Common.h"
#include "ByteBuffer.h"
#include "ObjectGuid.h"
#include "Timer.h"

// [-ZERO] Need check and update
// used in most movement packets (sent and received)
enum MovementFlags
{
    MOVEFLAG_NONE               = 0x00000000, // 0
    MOVEFLAG_FORWARD            = 0x00000001, // 1
    MOVEFLAG_BACKWARD           = 0x00000002, // 2
    MOVEFLAG_STRAFE_LEFT        = 0x00000004, // 3
    MOVEFLAG_STRAFE_RIGHT       = 0x00000008, // 4
    MOVEFLAG_TURN_LEFT          = 0x00000010, // 5
    MOVEFLAG_TURN_RIGHT         = 0x00000020, // 6
    MOVEFLAG_PITCH_UP           = 0x00000040, // 7
    MOVEFLAG_PITCH_DOWN         = 0x00000080, // 8
    MOVEFLAG_WALK_MODE          = 0x00000100, // 9 Walking
    MOVEFLAG_UNUSED10           = 0x00000200, // 10 ??
    MOVEFLAG_LEVITATING         = 0x00000400, // 11 ?? Seems not to work
    MOVEFLAG_FIXED_Z            = 0x00000800, // 12 Fixed height. Jump => Glide across the entire map
    MOVEFLAG_ROOT               = 0x00001000, // 13
    MOVEFLAG_JUMPING            = 0x00002000, // 14
    MOVEFLAG_FALLINGFAR         = 0x00004000, // 15
    MOVEFLAG_PENDING_STOP       = 0x00008000, // 16 Only used in older client versions
    MOVEFLAG_PENDING_UNSTRAFE   = 0x00010000, // 17 Only used in older client versions
    MOVEFLAG_PENDING_FORWARD    = 0x00020000, // 18 Only used in older client versions
    MOVEFLAG_PENDING_BACKWARD   = 0x00040000, // 19 Only used in older client versions
    MOVEFLAG_PENDING_STR_LEFT   = 0x00080000, // 20 Only used in older client versions
    MOVEFLAG_PENDING_STR_RGHT   = 0x00100000, // 21 Only used in older client versions
    MOVEFLAG_SWIMMING           = 0x00200000, // 22 Ok
    MOVEFLAG_SPLINE_ENABLED     = 0x00400000, // 23 Ok
    MOVEFLAG_MOVED              = 0x00800000, // 24 Only used in older client versions
    MOVEFLAG_FLYING             = 0x01000000, // 25 [-ZERO] is it really need and correct value
    MOVEFLAG_ONTRANSPORT        = 0x02000000, // 26 Used for flying on some creatures
    MOVEFLAG_SPLINE_ELEVATION   = 0x04000000, // 27 Used for flight paths
    MOVEFLAG_UNUSED28           = 0x08000000, // 28
    MOVEFLAG_WATERWALKING       = 0x10000000, // 29 Prevent unit from falling through water
    MOVEFLAG_SAFE_FALL          = 0x20000000, // 30 Active rogue safe fall spell (passive)
    MOVEFLAG_HOVER              = 0x40000000, // 31
    MOVEFLAG_UNUSED32           = 0x80000000, // 32

    // Can not be present with MOVEFLAG_ROOT (otherwise client freeze)
    MOVEFLAG_MASK_MOVING        =
        MOVEFLAG_FORWARD | MOVEFLAG_BACKWARD | MOVEFLAG_STRAFE_LEFT | MOVEFLAG_STRAFE_RIGHT |
        MOVEFLAG_PITCH_UP | MOVEFLAG_PITCH_DOWN | MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR |
        MOVEFLAG_SPLINE_ELEVATION,
    MOVEFLAG_MASK_MOVING_OR_TURN= MOVEFLAG_MASK_MOVING | MOVEFLAG_TURN_LEFT | MOVEFLAG_TURN_RIGHT,

    // MovementFlags mask that only contains flags for x/z translations
    // this is to avoid that a jumping character that stands still triggers melee-leeway
    MOVEFLAG_MASK_XZ = MOVEFLAG_FORWARD | MOVEFLAG_BACKWARD | MOVEFLAG_STRAFE_LEFT | MOVEFLAG_STRAFE_RIGHT
};

static char const* MoveFlagToString(uint32 flag)
{
    switch (flag)
    {
        case MOVEFLAG_NONE:
            return "None";
        case MOVEFLAG_FORWARD:
            return "Forward";
        case MOVEFLAG_BACKWARD:
            return "Backward";
        case MOVEFLAG_STRAFE_LEFT:
            return "Strafe Left";
        case MOVEFLAG_STRAFE_RIGHT:
            return "Strafe Right";
        case MOVEFLAG_TURN_LEFT:
            return "Turn Left";
        case MOVEFLAG_TURN_RIGHT:
            return "Turn Right";
        case MOVEFLAG_PITCH_UP:
            return "Pitch Up";
        case MOVEFLAG_PITCH_DOWN:
            return "Pitch Down";
        case MOVEFLAG_WALK_MODE:
            return "Walk Mode";
        case MOVEFLAG_UNUSED10:
            return "Unused10";
        case MOVEFLAG_LEVITATING:
            return "Levitating";
        case MOVEFLAG_FIXED_Z:
            return "Fixed Z";
        case MOVEFLAG_ROOT:
            return "Root";
        case MOVEFLAG_JUMPING:
            return "Jumping";
        case MOVEFLAG_FALLINGFAR:
            return "Falling Far";
        case MOVEFLAG_PENDING_STOP:
            return "Pending Stop";
        case MOVEFLAG_PENDING_UNSTRAFE:
            return "Pending Unstrafe";
        case MOVEFLAG_PENDING_FORWARD:
            return "Pending Forward";
        case MOVEFLAG_PENDING_BACKWARD:
            return "Pending Backward";
        case MOVEFLAG_PENDING_STR_LEFT:
            return "Pending Strafe Left";
        case MOVEFLAG_PENDING_STR_RGHT:
            return "Pending Strafe Right";
        case MOVEFLAG_SWIMMING:
            return "Swimming";
        case MOVEFLAG_SPLINE_ENABLED:
            return "Spline Enabled";
        case MOVEFLAG_MOVED:
            return "Moved";
        case MOVEFLAG_FLYING:
            return "Flying";
        case MOVEFLAG_ONTRANSPORT:
            return "On Transport";
        case MOVEFLAG_SPLINE_ELEVATION:
            return "Spline Elevation";
        case MOVEFLAG_UNUSED28:
            return "Unused28";
        case MOVEFLAG_WATERWALKING:
            return "Water Walking";
        case MOVEFLAG_SAFE_FALL:
            return "Safe Fall";
        case MOVEFLAG_HOVER:
            return "Hover";
        case MOVEFLAG_UNUSED32:
            return "Unused32";
    }
    return "UNKNOWN";
}

// used in SMSG_MONSTER_MOVE
enum SplineFlags
{
    // Valeurs correctes et testees pour la 1.12.1
    SPLINEFLAG_NONE           = 0x00000000,
    SPLINEFLAG_WALKMODE       = 0x00000100,
    SPLINEFLAG_FLYING         = 0x00000200,

    SPLINEFLAG_SPLINE         = 0x00002000,               // spline n*(float x,y,z)
};

class MovementInfo
{
    public:
        MovementInfo() : moveFlags(MOVEFLAG_NONE), stime(0), ctime(0),
            s_pitch(0.0f), fallTime(0), splineElevation(0.0f), sourceSessionGuid(0) {}

        // Read/Write methods
        void Read(ByteBuffer &data);
        void Write(ByteBuffer &data) const;
        void CorrectData();

        // Movement flags manipulations
        void AddMovementFlag(int f) { moveFlags |= f; }
        void RemoveMovementFlag(int f) { moveFlags &= ~f; }
        bool HasMovementFlag(int f) const { return moveFlags & f; }
        MovementFlags GetMovementFlags() const { return MovementFlags(moveFlags); }
        void SetMovementFlags(MovementFlags f) { moveFlags = f; }

        // Position manipulations
        Position const& GetPos() const { return pos; }
        void SetTransportData(ObjectGuid guid, float x, float y, float z, float o)
        {
            t_guid = guid;
            t_pos.x = x;
            t_pos.y = y;
            t_pos.z = z;
            t_pos.o = o;
        }
        void ClearTransportData()
        {
            t_guid = ObjectGuid();
            t_pos.x = 0.0f;
            t_pos.y = 0.0f;
            t_pos.z = 0.0f;
            t_pos.o = 0.0f;
        }
        ObjectGuid const& GetTransportGuid() const { return t_guid; }
        Position const& GetTransportPos() const { return t_pos; }
        Position& GetTransportPos() { return t_pos; }
        uint32 GetFallTime() const { return fallTime; }
        void ChangeOrientation(float o) { pos.o = o; }
        void ChangePosition(float x, float y, float z, float o) { pos.x = x; pos.y = y; pos.z = z; pos.o = o; }
        void UpdateTime(uint32 _time) { stime = _time; }
        void SetAsServerSide()
        { 
            uint32 const oldTime = stime;
            stime = WorldTimer::getMSTime();

            // Preserve order of server side packets.
            if (oldTime >= stime)
                stime = oldTime + 1;

            ctime = 0; // Not a client packet. Pauses extrapolation.
            sourceSessionGuid = 0;
        }
        bool WasSentBySession(uint32 sessionGuid) const
        {
            return ctime != 0 && sourceSessionGuid == sessionGuid;
        }

        struct JumpInfo
        {
            JumpInfo() : zspeed(0.f), sinAngle(0.f), cosAngle(0.f), xyspeed(0.f), startClientTime(0) {}
            float   zspeed, sinAngle, cosAngle, xyspeed;
            Position start;
            uint32 startClientTime;
        };

        JumpInfo const& GetJumpInfo() const { return jump; }
    //private:
        // common
        uint32  moveFlags;                                  // see enum MovementFlags
        uint32  stime; // Server time
        uint32  ctime; // Client time
        Position pos;
        // transport
        ObjectGuid t_guid;
        Position t_pos;
        // swimming and unknown
        float   s_pitch;
        // last fall time
        uint32  fallTime;
        // jumping
        JumpInfo jump;
        // spline
        float splineElevation;
        // client from which position came
        uint32 sourceSessionGuid;
};

inline ByteBuffer& operator<< (ByteBuffer& buf, MovementInfo const& mi)
{
    mi.Write(buf);
    return buf;
}

inline ByteBuffer& operator>> (ByteBuffer& buf, MovementInfo& mi)
{
    mi.Read(buf);
    return buf;
}

#endif
