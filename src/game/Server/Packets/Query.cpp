#include "Query.h"

void WorldPackets::Query::QueryPlayerName::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerGuid;
}

void WorldPackets::Query::QueryCreature::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> entry;
    recv_data >> guid;
}

void WorldPackets::Query::QueryGameObject::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> entryID;
    recv_data >> guid;
}

void WorldPackets::Query::QueryPageText::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> pageID;
    if (recv_data.rpos() < recv_data.size())
    { // optional, see 5875 at 0x0056485D
        recv_data.read_skip<uint64>(); // object guid, not used
    }
}

void WorldPackets::Query::Whois::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> charName;
}

void WorldPackets::Query::ItemNameQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemId;
    recv_data.read_skip<uint64>(); // guid, not used
}

void WorldPackets::Query::QueryTimeResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << time;
}

void WorldPackets::Query::NameQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
    buffer << name;
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    buffer << realmName;
#endif
    buffer << race;
    buffer << gender;
    buffer << class_;
}

void WorldPackets::Query::PageTextQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << pageId;
    buffer << text;
    buffer << nextPageId;
}


