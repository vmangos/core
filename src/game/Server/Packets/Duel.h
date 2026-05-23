#ifndef MANGOS_PACKETS_DUEL_H
#define MANGOS_PACKETS_DUEL_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>

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

    class DuelComplete final : public ServerPacket
    {
    public:
        bool started = false; // false if interrupted, true if actually completed

        explicit DuelComplete() : ServerPacket(SMSG_DUEL_COMPLETE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class DuelWinner final : public ServerPacket
    {
    public:
        bool fled = false; // true = loser fled, false = loser was defeated
        std::string winnerName;
        std::string loserName;

        explicit DuelWinner() : ServerPacket(SMSG_DUEL_WINNER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class DuelCountdown final : public ServerPacket
    {
    public:
        uint32 countdown = 0; // countdown in seconds

        explicit DuelCountdown() : ServerPacket(SMSG_DUEL_COUNTDOWN) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
}} // namespace WorldPackets::Duel

#endif // MANGOS_PACKETS_DUEL_H
