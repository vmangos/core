#include "Duel.h"

void WorldPackets::Duel::DuelAccepted::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerGuid;
}

void WorldPackets::Duel::DuelCancelled::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerGuid;
}
