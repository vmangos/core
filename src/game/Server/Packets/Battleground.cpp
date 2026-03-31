#include "Battleground.h"

void WorldPackets::Battleground::BattlefieldListRequest::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    recv_data >> mapId;
#endif
}

void WorldPackets::Battleground::AreaSpiritHealerQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Battleground::AreaSpiritHealerQueue::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Battleground::BattlemasterHello::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Battleground::BattleFieldPort::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    recv_data >> mapId;
#endif
    recv_data >> action;
}

void WorldPackets::Battleground::LeaveBattlefield::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    recv_data >> mapId;
#endif
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
void WorldPackets::Battleground::BattlemasterJoin::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;          // battlemaster guid, or player guid if joining queue from BG portal
    recv_data >> mapId;
    recv_data >> instanceId;    // instance id, 0 if First Available selected
    recv_data >> joinAsGroup;   // join as group
}
#endif

void WorldPackets::Battleground::BattlefieldJoin::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mapId;
}
