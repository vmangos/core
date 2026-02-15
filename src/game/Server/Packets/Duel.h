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
}} // namespace WorldPackets::Duel

#endif // MANGOS_PACKETS_DUEL_H
