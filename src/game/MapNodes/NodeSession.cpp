#include "NodeSession.h"
#include "NodesMgr.h"
#include "WorldPacket.h"
#include "WorldSocket.h"
#include "ObjectMgr.h"
#include "World.h"

NodeSession::NodeSession(MapSocket* sock):
    m_socket(sock), m_lastReceivedPacketTime(0),
    itemGuidsGenerator(1000), petGuidsGenerator(1000),
    m_isConnectedToMaster(!sock->IsServerSide()), m_isReady(false)
{
    ASSERT(sock);
    sock->AddReference();
    sNodesMgr->RegisterNode(this);
}

void NodeSession::SendPacket(NodesOpcodesList opcode)
{
    WorldPacket pkt(opcode, 0);
    SendPacket(&pkt);
}

void NodeSession::SendPacket(NodesOpcodesList opcode, uint32 data1)
{
    WorldPacket pkt(opcode, 4);
    pkt << data1;
    SendPacket(&pkt);
}

void NodeSession::SendPacket(WorldPacket const* packet)
{
    if (m_socket && m_socket->SendPacket(*packet) == -1)
        m_socket->CloseSocket();
}

void NodeSession::QueuePacket(WorldPacket* newPacket)
{
    NodeOpcodeHandler const* handler = sNodesOpcodes->LookupOpcode(newPacket->GetOpcode());
    if (!handler || handler->packetProcessing > NODE_MAX_PROCESS_TYPE)
    {
        sLog.outError("[Cluster/Protocol] Invalid packet received: size: %u op: 0x%x [%s]",
            newPacket->size(), newPacket->GetOpcode(), handler ? handler->name : "<UNKNOWN>");
        delete newPacket;
        return;
    }
    //sLog.outString("[Cluster::%s][%s] Rcv %s [size %u]", sNodesMgr->GetServerName().c_str(), GetName(), handler->name, newPacket->size());
    m_lastReceivedPacketTime = newPacket->GetPacketTime();
    if (handler->packetProcessing == NODE_PROCESS_REALTIME)
    {
        ProcessPacket(newPacket);
        delete newPacket;
    }
    else
        m_recvQueue[handler->packetProcessing].add(newPacket);
}

bool NodeSession::SafeUpdate(uint32 diff)
{
    if (m_socket && m_socket->IsClosed())
    {
        m_socket->RemoveReference();
        m_socket = NULL;
        return false;
    }

    if (!m_isReady)
        return true;

    ProcessPacketsByType(NODE_PROCESS_UNSAFE);
    return true;
}

class MasterSessionFilter final : public PacketFilter
{
    public:
        MasterSessionFilter(WorldSession * pSession) : PacketFilter(pSession)
        {
            m_processLogout = false;
            m_processType = PACKET_PROCESS_MASTER_SAFE;
        }

        bool Process(WorldPacket * packet) { return true; }
};

void NodeSession::UnsafeUpdate(uint32 diff)
{
    if (!m_isReady)
        return;

    if (IsConnectedToMaster())
    {
        if (itemGuidsGenerator.ShouldRequestNewGuids())
            SendPacket(NMSG_REQUEST_FREE_GUIDS_ITEMS);
        if (petGuidsGenerator.ShouldRequestNewGuids())
            SendPacket(NMSG_REQUEST_FREE_GUIDS_PETS);
    }

    ProcessPacketsByType(NODE_PROCESS_SAFE);

    // Update corresponding sessions - to get packets handled !
    if (!IsConnectedToMaster())
    {
        m_socketsLock.acquire_read();
        for (SocketsMap::const_iterator it = m_accountSockets.begin(); it != m_accountSockets.end(); ++it)
            if (WorldSession* wsess = sWorld.FindSession(it->first))
            {
                PacketFilter f(wsess);
                f.SetProcessType(PACKET_PROCESS_MASTER_SAFE);
                wsess->Update(f);
                f.SetProcessType(PACKET_PROCESS_DB_QUERY);
                wsess->Update(f);
            }

        m_socketsLock.release();
    }
    // Lost sockets ?
    if (!IsConnectedToMaster())
    {
        m_socketsLock.acquire_write();
        for (SocketsMap::iterator it = m_accountSockets.begin(); it != m_accountSockets.end();)
        {
            SocketsMap::iterator current = it++;
            if (current->second->IsClosed())
            {
                current->second->RemoveReference();
                SendDisconnectedFromMaster(current->first);
                m_accountSockets.erase(current);
            }
        }
        m_socketsLock.release();
    }
}

void NodeSession::ProcessPacketsByType(uint32 type)
{
    WorldPacket* packet = NULL;
    while (m_socket && !m_socket->IsClosed() && m_recvQueue[type].next(packet))
        ProcessPacket(packet);
}

void NodeSession::ProcessPacket(WorldPacket* packet)
{
    NodeOpcodeHandler const* handler = sNodesOpcodes->LookupOpcode(packet->GetOpcode());
    ASSERT(handler);
    (this->*handler->handler)(*packet);
}


void NodeSession::Close()
{
    sLog.outString("[%s] Closing connection", GetName());
    // Will kick all connected users.
    // TODO: Go back to character selection screen ?
    m_socketsLock.acquire_write();
    for (SocketsMap::iterator it = m_accountSockets.begin(); it != m_accountSockets.end(); ++it)
    {
        it->second->CloseSocket();
        it->second->RemoveReference();
    }
    m_accountSockets.clear();
    m_socketsLock.release();
}
