#include "NodeSession.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"

void NodeSession::HandleAddFreeGuidsItems(WorldPacket& pkt)
{
    itemGuidsGenerator.ReadFreeGuids(pkt);
}

void NodeSession::HandleAddFreeGuidsPets(WorldPacket& pkt)
{
    petGuidsGenerator.ReadFreeGuids(pkt);
}

void NodeSession::HandleRequestFreeGuidsItems(WorldPacket& pkt)
{
    WorldPacket packet(MMSG_ADD_FREE_GUIDS_ITEMS, 8);
    uint32 firstGuid, lastGuid;
    sObjectMgr.GenerateItemLowGuidRange(firstGuid, lastGuid);
    packet << firstGuid << lastGuid;
    SendPacket(&packet);
}

void NodeSession::HandleRequestFreeGuidsPets(WorldPacket& pkt)
{
    WorldPacket packet(MMSG_ADD_FREE_GUIDS_PETS, 8);
    uint32 firstGuid, lastGuid;
    sObjectMgr.GeneratePetNumberRange(firstGuid, lastGuid);
    packet << firstGuid << lastGuid;
    SendPacket(&packet);
}

uint32 NodeSession::GuidsGenerator::Generate()
{
    ASSERT(!m_freeGuids.empty());

    GuidsRange& guidRange = m_freeGuids.front();
    --m_freeGuidsCount;
    uint32 g = guidRange.first++;
    if (guidRange.first == guidRange.second)
        m_freeGuids.pop_front();
    return g;
}

void NodeSession::GuidsGenerator::ReadFreeGuids(WorldPacket& pkt)
{
    uint32 first, last;
    pkt >> first >> last;
    m_freeGuids.push_back(GuidsRange(first, last));
    m_freeGuidsCount += (last - first);
    m_newGuidsRequestSent = false;
}
