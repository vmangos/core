#include "Auth/AuthCrypt.h"

#include "NodeSession.h"
#include "NodesMgr.h"
#include "MapSocket.h"
#include "MapSocketMgr.h"
#include "MangosSocketImpl.h"
#include "NodesOpcodes.h"
#include "ObjectMgr.h"

template class MangosSocket<NodeSession, MapSocket, NoCrypt>;

int MapSocket::ProcessIncoming(WorldPacket* new_pct)
{
    MANGOS_ASSERT(new_pct);

    // manage memory ;)
    ACE_Auto_Ptr<WorldPacket> aptr(new_pct);

    const ACE_UINT16 opcode = new_pct->GetOpcode();

    if (opcode >= MAX_NODES_OPCODES)
    {
        sLog.outError("NodeSession: received nonexistent opcode 0x%.4X", opcode);
        return -1;
    }

    if (closing_)
        return -1;

    new_pct->FillPacketTime(WorldTimer::getMSTime());

    switch (opcode)
    {
        case MMSG_HELLO:
        case NMSG_HELLO:
        {
            aptr.release();
            if (!m_Session) // Register Master -> Node session here
                m_Session = new NodeSession(this);
            m_Session->QueuePacket(new_pct);
            break;
        }
        default:
        {
            ACE_GUARD_RETURN(LockType, Guard, m_SessionLock, -1);

            if (m_Session != NULL)
            {
                // OK, give the packet to WorldSession
                aptr.release();
                // WARNINIG here we call it with locks held.
                // Its possible to cause deadlock if QueuePacket calls back
                m_Session->QueuePacket(new_pct);
                return 0;
            }
            else
            {
                sLog.outError("MapSocket::ProcessIncoming: No session created (opcode:%u)", uint32(opcode));
                return -1;
            }
        }
    }
    return 0;
}

int MapSocket::iSendPacket(const WorldPacket& pct)
{
    if (m_OutBuffer->space() < pct.size() + sizeof(ClientPktHeader))
    {
        errno = ENOBUFS;
        return -1;
    }

    ClientPktHeader header;

    header.cmd = pct.GetOpcode();
    header.size = pct.size() + 4;

    EndianConvertReverse(header.size);
    EndianConvert(header.cmd);

    m_Crypt.EncryptSend((uint8*) & header, sizeof(header));

    if (m_OutBuffer->copy((char*) & header, sizeof(header)) == -1)
        ACE_ASSERT(false);

    if (!pct.empty())
        if (m_OutBuffer->copy((char*) pct.contents(), pct.size()) == -1)
            ACE_ASSERT(false);

    return 0;
}

int MapSocket::OnSocketOpen()
{
    return sMapSocketMgr->OnSocketOpen(this);
}

int MapSocket::SendStartupPacket()
{
    // Send startup packet.
    if (m_isServerSocket)
    {
        WorldPacket packet(MMSG_HELLO, 10);
        packet << sNodesMgr->GetServerName();
        // Send item GUIDs range
        uint32 firstGuid, lastGuid;
        sObjectMgr.GenerateItemLowGuidRange(firstGuid, lastGuid);
        packet << firstGuid << lastGuid;
        // Send pets GUIDs range
        sObjectMgr.GeneratePetNumberRange(firstGuid, lastGuid);
        packet << firstGuid << lastGuid;
        return SendPacket(packet);
    }
    return 0;
}
