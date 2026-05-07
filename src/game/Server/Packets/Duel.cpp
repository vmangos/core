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

void WorldPackets::Duel::DuelOutOfBounds::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Duel::DuelInBounds::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}
