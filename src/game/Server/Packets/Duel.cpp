#include "Duel.h"

void WorldPackets::Duel::DuelAccepted::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerGuid;
}

void WorldPackets::Duel::DuelCancelled::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerGuid;
}

// --- Server Packets ---

size_t WorldPackets::Duel::DuelOutOfBounds::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Duel::DuelOutOfBounds::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Duel::DuelInBounds::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Duel::DuelInBounds::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Duel::DuelComplete::EstimateFinalSize() const
{
    return sizeof(started);
}

void WorldPackets::Duel::DuelComplete::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << started;
}

size_t WorldPackets::Duel::DuelWinner::EstimateFinalSize() const
{
    return sizeof(fled) +
           winnerName.size() + sizeof(char) + /*null terminator*/
           loserName.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Duel::DuelWinner::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << fled; // 0 = just won; 1 = fled
    buffer << winnerName;
    buffer << loserName;
}

size_t WorldPackets::Duel::DuelCountdown::EstimateFinalSize() const
{
    return sizeof(countdown);
}

void WorldPackets::Duel::DuelCountdown::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << countdown; // seconds
}
