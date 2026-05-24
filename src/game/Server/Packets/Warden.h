#ifndef MANGOS_PACKETS_WARDEN_H
#define MANGOS_PACKETS_WARDEN_H

#include "Packet.h"
#include "ByteBuffer.h"

#include <vector>

namespace WorldPackets { namespace Warden
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    class WardenData final : public ClientPacket
    {
    public:
        std::vector<uint8> data; // raw bytes received from the client (still encrypted)

        explicit WardenData() : ClientPacket(CMSG_WARDEN_DATA) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class WardenDataServer final : public ServerPacket
    {
    public:
        ByteBuffer encryptedData; // already-encrypted warden payload

        explicit WardenDataServer() : ServerPacket(SMSG_WARDEN_DATA) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

}} // namespace WorldPackets::Warden

#endif // MANGOS_PACKETS_WARDEN_H
