#ifndef MANGOS_PACKETS_DUEL_H
#define MANGOS_PACKETS_DUEL_H

#include "Packet.h"
#include "ObjectGuid.h"

namespace WorldPackets { namespace Duel
{
    class DuelAccepted final : public ClientPacket
    {
    public:
        ObjectGuid playerGuid;

        explicit DuelAccepted() : ClientPacket(CMSG_DUEL_ACCEPTED) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class DuelCancelled final : public ClientPacket
    {
    public:
        ObjectGuid playerGuid;

        explicit DuelCancelled() : ClientPacket(CMSG_DUEL_CANCELLED) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class DuelOutOfBounds final : public ServerPacket
    {
    public:
        explicit DuelOutOfBounds() : ServerPacket(SMSG_DUEL_OUTOFBOUNDS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class DuelInBounds final : public ServerPacket
    {
    public:
        explicit DuelInBounds() : ServerPacket(SMSG_DUEL_INBOUNDS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Duel

#endif // MANGOS_PACKETS_DUEL_H
