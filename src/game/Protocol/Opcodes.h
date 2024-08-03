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

// List of Opcodes
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
#include "Opcodes_1_12_1.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
#include "Opcodes_1_11_2.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
#include "Opcodes_1_10_2.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
#include "Opcodes_1_9_4.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
#include "Opcodes_1_8_4.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
#include "Opcodes_1_7_1.h"
#else
#include "Opcodes_1_6_1.h"
#endif

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

struct OpcodeHandler
{
    char const* name;
    SessionStatus status;
    PacketProcessing packetProcessing;
    void (WorldSession::*handler)(WorldPacket& recvPacket);
};

typedef std::map< uint16, OpcodeHandler> OpcodeMap;

class Opcodes
{
    public:
        Opcodes();
        ~Opcodes();
    public:
        void BuildOpcodeList();
        void StoreOpcode(uint16 Opcode,char const* name, SessionStatus status, PacketProcessing process, void (WorldSession::*handler)(WorldPacket& recvPacket))
        {
            OpcodeHandler& ref = mOpcodeMap[Opcode];
            ref.name = name;
            ref.status = status;
            ref.packetProcessing = process;
            ref.handler = handler;
        }

        // Lookup opcode
        inline OpcodeHandler const* LookupOpcode(uint16 id) const
        {
            OpcodeMap::const_iterator itr = mOpcodeMap.find(id);
            if (itr != mOpcodeMap.end())
                return &itr->second;
            return nullptr;
        }

        // compatible with other mangos branches access

        inline OpcodeHandler const& operator[] (uint16 id) const
        {
            OpcodeMap::const_iterator itr = mOpcodeMap.find(id);
            if (itr != mOpcodeMap.end())
                return itr->second;
            return emptyHandler;
        }

        static OpcodeHandler const emptyHandler;

        OpcodeMap mOpcodeMap;

};

#define opcodeTable MaNGOS::Singleton<Opcodes>::Instance()

// Lookup opcode name for human understandable logging
inline char const* LookupOpcodeName(uint16 id)
{
    if (OpcodeHandler const* op = opcodeTable.LookupOpcode(id))
        return op->name;
    return "Received unknown opcode, it's more than max!";
}

#endif
// @}
