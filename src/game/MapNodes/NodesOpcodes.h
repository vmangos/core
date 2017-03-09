#pragma once

#include <unordered_map>
#include <unordered_set>
#include "Common.h"

enum NodesOpcodesList
{
    /// Protocol initialization
    NMSG_HELLO,
    MMSG_HELLO,
    /// GUIDs synchronization
    NMSG_REQUEST_FREE_GUIDS_ITEMS,
    NMSG_REQUEST_FREE_GUIDS_PETS,
    MMSG_ADD_FREE_GUIDS_ITEMS,
    MMSG_ADD_FREE_GUIDS_PETS,
    /// Packets forwarding
    NMSG_SEND_PACKET_TO_CLIENT,
    MSG_FORWARD_CLIENT_PACKET,
    /// Session transfert
    MMSG_LOAD_SESSION,
    MMSG_LOAD_PLAYER_FROM_DB,
    MSG_LOAD_PLAYER_SERIALIZED,
    MMSG_SESSION_SOCKET_LOST,
    NMSG_LOGOUT_COMPLETE,
    /// Cache synchronization
    MSG_SYNC_PET_CACHE, // TODO
    MAX_NODES_OPCODES,
};

enum NodePacketType
{
    FROM_NODE       = 0x1,
    FROM_MASTER     = 0x2,
    BOTH            = FROM_NODE | FROM_MASTER,
};

enum NodeOpcodeProcessing
{
    NODE_PROCESS_REALTIME,
    NODE_PROCESS_SAFE,
    NODE_PROCESS_UNSAFE,
    NODE_MAX_PROCESS_TYPE,
};

class WorldPacket;
class NodeSession;

struct NodeOpcodeHandler
{
    char const* name;
    NodeOpcodeProcessing packetProcessing;
    NodePacketType type;
    void (NodeSession::*handler)(WorldPacket& recvPacket);
};

typedef std::unordered_map<uint16, NodeOpcodeHandler> NodeOpcodeMap;
typedef std::unordered_set<uint16> OpcodesToNodeSet;

class NodesOpcodes
{
public:
    void BuildOpcodeList();
    void StoreOpcode(uint16 opcode, char const* name, NodePacketType type, NodeOpcodeProcessing process, void (NodeSession::*handler)(WorldPacket& recvPacket))
    {
        NodeOpcodeHandler& ref = mOpcodeMap[opcode];
        ref.name = name;
        ref.type = type;
        ref.packetProcessing = process;
        ref.handler = handler;
    }
    inline NodeOpcodeHandler const* LookupOpcode(uint16 id) const
    {
        NodeOpcodeMap::const_iterator itr = mOpcodeMap.find(id);
        if (itr != mOpcodeMap.end())
            return &itr->second;
        return NULL;
    }
    static NodesOpcodes* instance()
    {
        static NodesOpcodes si;
        return &si;
    }
    bool IsOpcodeForwardedToNode(uint16 opcode) const { return mOpcodesToNode.find(opcode) != mOpcodesToNode.end(); }
    bool IsOpcodeHandledByMaster(uint16 opcode) const { return mMasterOpcode.find(opcode) != mMasterOpcode.end(); }
protected:
    NodeOpcodeMap mOpcodeMap;
    OpcodesToNodeSet mOpcodesToNode; // These packets will be forwarded to Node server
    OpcodesToNodeSet mMasterOpcode; // These packets will be handled by Master while connected to Node
};


#define sNodesOpcodes (NodesOpcodes::instance())
