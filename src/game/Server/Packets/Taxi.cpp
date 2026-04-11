#include "Taxi.h"

void WorldPackets::Taxi::TaxiNodeStatusQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> creatureGuidNearTaxi; // Normal clients would send the GUID of the flightmaster
}

void WorldPackets::Taxi::TaxiQueryAvailableNodes::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Taxi::ActivateTaxi::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> flightmasterGuid;
    recv_data >> node1;
    recv_data >> node2;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
void WorldPackets::Taxi::ActivateTaxiExpress::ReadFromWorldPacket(WorldPacket& recv_data)
{
    uint32 node_count;
    recv_data >> flightmasterGuid;
    recv_data >> totalcost;
    recv_data >> node_count;
    for (uint32 i = 0; i < node_count; ++i)
    {
        uint32 node;
        recv_data >> node;
        nodes.push_back(node);
    }
}
#endif

void WorldPackets::Taxi::TaxiNodeStatus::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << guid;
    buffer << known;
}

void WorldPackets::Taxi::NewTaxiPath::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}


