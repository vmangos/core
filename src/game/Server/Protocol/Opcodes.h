/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

// \addtogroup u2w
// @{
// \file

#ifndef _OPCODES_H
#define _OPCODES_H

#include "Common.h"

// Note: this include need for be sure have full definition of class WorldSession
//       if this class definition not complite then VS for x64 release use different size for
//       struct OpcodeHandler in this header and Opcode.cpp and get totally wrong data from
//       table opcodeTable in source when Opcode.h included but WorldSession.h not included
#include "WorldSession.h"
#include "Opcodes_active.h"
#include "nonstd/expected.hpp"

inline bool IsAnyMoveAckOpcode(uint16 opcode)
{
    switch (opcode)
    {
        case MSG_MOVE_TELEPORT_ACK:
        case MSG_MOVE_WORLDPORT_ACK:
        case MSG_MOVE_SET_RAW_POSITION_ACK:
        case CMSG_FORCE_RUN_SPEED_CHANGE_ACK:
        case CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_SWIM_SPEED_CHANGE_ACK:
        case CMSG_FORCE_MOVE_ROOT_ACK:
        case CMSG_FORCE_MOVE_UNROOT_ACK:
        case CMSG_MOVE_KNOCK_BACK_ACK:
        case CMSG_MOVE_HOVER_ACK:
        case CMSG_MOVE_FEATHER_FALL_ACK:
        case CMSG_MOVE_WATER_WALK_ACK:
        case CMSG_FORCE_WALK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_TURN_RATE_CHANGE_ACK:
            return true;
    }

    return false;
}

inline bool IsFlagAckOpcode(uint16 opcode)
{
    switch (opcode)
    {
        case CMSG_FORCE_MOVE_ROOT_ACK:
        case CMSG_FORCE_MOVE_UNROOT_ACK:
        case CMSG_MOVE_WATER_WALK_ACK:
        case CMSG_MOVE_HOVER_ACK:
        case CMSG_MOVE_FEATHER_FALL_ACK:
            return true;
    }

    return false;
}

inline bool IsSpeedAckOpcode(uint16 opcode)
{
    switch (opcode)
    {
        case CMSG_FORCE_RUN_SPEED_CHANGE_ACK:
        case CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_SWIM_SPEED_CHANGE_ACK:
        case CMSG_FORCE_WALK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK:
        case CMSG_FORCE_TURN_RATE_CHANGE_ACK:
            return true;
    }

    return false;
}

inline bool IsStopOpcode(uint16 opcode)
{
    switch (opcode)
    {
        case MSG_MOVE_STOP:
        case MSG_MOVE_STOP_STRAFE:
        case MSG_MOVE_STOP_TURN:
        case MSG_MOVE_STOP_PITCH:
        case MSG_MOVE_STOP_SWIM:
            return true;
    }

    return false;
}

inline bool IsFallEndOpcode(uint16 opcode)
{
    switch (opcode)
    {
        case MSG_MOVE_FALL_LAND:
        case MSG_MOVE_START_SWIM:
            return true;
    }

    return false;
}

// Player state
enum SessionStatus
{
    STATUS_AUTHED = 0,                                      // Player authenticated (_player==nullptr, m_playerRecentlyLogout = false or will be reset before handler call)
    STATUS_LOGGEDIN,                                        // Player in game (_player!=nullptr, inWorld())
    STATUS_TRANSFER,                                        // Player transferring to another map (_player!=nullptr, !inWorld())
    STATUS_LOGGEDIN_OR_RECENTLY_LOGGEDOUT,                  // _player!= nullptr or _player==nullptr && m_playerRecentlyLogout)
    STATUS_NEVER,                                           // Opcode not accepted from client (deprecated or server side only)
    STATUS_UNHANDLED                                        // We don' handle this opcode yet
};

class WorldPacket;

struct OpcodeHandlerPacketImplDetails
{
    SessionStatus status;
    PacketProcessing packetProcessing;
    std::unique_ptr<ClientPacket> (*readPacket)(WorldPacket& recvPacket);
    void (WorldSession::*handler)(ClientPacket const& recvPacket);
};

enum class UnhandleReason
{
    Invalid,
    Unhandled,
    AlreadyHandledElsewhere, // should already be handled before the packet reaches this opcode map
    SendByServer,
};

struct OpcodeHandler
{
    char const* name = "<unknown opcode>";
    nonstd::expected<OpcodeHandlerPacketImplDetails, UnhandleReason> impl = nonstd::unexpected<UnhandleReason>(UnhandleReason::Unhandled);
};

// returns true if it's completely out of range
inline bool IsDefinitelyBogusOpcode(uint16 opcode) { return opcode >= NUM_MSG_TYPES; }

// Will work for any opcode, might return `<unknown opcode>` and without impl
OpcodeHandler const& LookupOpcodeHandler(uint16 id);
// Will work for any opcode, might return `<unknown opcode>`
char const* LookupOpcodeName(uint16 id);

#endif
// @}
