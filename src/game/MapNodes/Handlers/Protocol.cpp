#include "NodeSession.h"
#include "WorldPacket.h"
#include "WorldSocket.h"
#include "WorldSession.h"
#include "World.h"
#include "NodesMgr.h"
#include "Log.h"
#include "Opcodes.h"


void NodeSession::HandleMasterHello(WorldPacket& pkt)
{
    pkt >> m_name;
    HandleAddFreeGuidsItems(pkt);
    HandleAddFreeGuidsPets(pkt);

    WorldPacket nodeHello(NMSG_HELLO, 10);
    nodeHello << sNodesMgr->GetServerName();
    SendPacket(&nodeHello);
    m_isReady = true;
    sLog.outString("[Cluster::Node] Ready to work with Master [%s]", GetName());
}

void NodeSession::HandleNodeHello(WorldPacket& pkt)
{
    pkt >> m_name;
    m_isReady = true;
    sLog.outString("[Cluster::Master] Ready to work with Node [%s]", GetName());
}

void NodeSession::ReadPacketForward(WorldPacket& rcvPacket, WorldPacket& forwardedPacket, uint32& session)
{
    const static int HEADER_SIZE = sizeof(uint32) + sizeof(uint16);
    uint16 opcode;
    rcvPacket >> session >> opcode;
    forwardedPacket.SetOpcode(opcode);
    forwardedPacket.reserve(rcvPacket.size() - HEADER_SIZE);
    forwardedPacket.append(rcvPacket.contents() + HEADER_SIZE, rcvPacket.wpos() - HEADER_SIZE);
}

void NodeSession::WritePacketForward(WorldPacket& sendPacket, WorldPacket const& forwardedPacket, uint32 const& session)
{
    sendPacket.reserve(sizeof(uint32) + sizeof(uint16) + forwardedPacket.size());
    sendPacket << session << forwardedPacket.GetOpcode();
    ByteBuffer const& bb = forwardedPacket;
    sendPacket.append(bb);
}

void NodeSession::SendPacketToGameClient(uint32 accountId, WorldPacket const* packet)
{
    ASSERT(IsConnectedToMaster());

    WorldPacket data(NMSG_SEND_PACKET_TO_CLIENT, 0);
    WritePacketForward(data, *packet, accountId);
    SendPacket(&data);
}

void NodeSession::ForwardClientPacket(uint32 accountId, WorldPacket const* packet)
{
    WorldPacket data(MSG_FORWARD_CLIENT_PACKET, 0);
    WritePacketForward(data, *packet, accountId);
    SendPacket(&data);
}

void NodeSession::HandleSendPacketToSession(WorldPacket& pkt)
{
    uint32 sessionId;
    WorldPacket newPkt;
    ReadPacketForward(pkt, newPkt, sessionId);

    m_socketsLock.acquire_read();
    SocketsMap::iterator it = m_accountSockets.find(sessionId);
    if (it != m_accountSockets.end())
        it->second->SendPacket(newPkt);
    m_socketsLock.release();
}

void NodeSession::HandleForwardClientPacket(WorldPacket& pkt)
{
    uint32 sessionId;
    WorldPacket* newPkt = new WorldPacket();
    ReadPacketForward(pkt, *newPkt, sessionId);
    WorldSession* sess = sWorld.FindSession(sessionId);
    if (!sess)
    {
        delete newPkt;
        return;
    }
    sess->QueuePacket(newPkt, this);
}
