#ifndef MANGOS_PACKETS_TAXI_H
#define MANGOS_PACKETS_TAXI_H

#include "Packet.h"
#include "ObjectGuid.h"

namespace WorldPackets { namespace Taxi
{
    class TaxiNodeStatusQuery final : public ClientPacket
    {
    public:
        ObjectGuid creatureGuidNearTaxi;

        explicit TaxiNodeStatusQuery() : ClientPacket(CMSG_TAXINODE_STATUS_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TaxiQueryAvailableNodes final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit TaxiQueryAvailableNodes() : ClientPacket(CMSG_TAXIQUERYAVAILABLENODES) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ActivateTaxi final : public ClientPacket
    {
    public:
        ObjectGuid flightmasterGuid;
        uint32     node1 = 0;
        uint32     node2 = 0;

        explicit ActivateTaxi() : ClientPacket(CMSG_ACTIVATETAXI) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    class ActivateTaxiExpress final : public ClientPacket
    {
    public:
        ObjectGuid          flightmasterGuid;
        uint32              totalcost = 0;
        std::vector<uint32> nodes;

        explicit ActivateTaxiExpress() : ClientPacket(CMSG_ACTIVATETAXIEXPRESS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    // --- Server Packets ---

    class TaxiNodeStatus final : public ServerPacket
    {
    public:
        ObjectGuid guid;
        bool known = false;

        explicit TaxiNodeStatus() : ServerPacket(SMSG_TAXINODE_STATUS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class NewTaxiPath final : public ServerPacket
    {
    public:
        explicit NewTaxiPath() : ServerPacket(SMSG_NEW_TAXI_PATH) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Taxi

#endif // MANGOS_PACKETS_TAXI_H
