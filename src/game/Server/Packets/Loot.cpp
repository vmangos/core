#include "Loot.h"

void WorldPackets::Loot::AutoStoreLootItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> lootSlot;
}

void WorldPackets::Loot::LootUnit::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Loot::LootRelease::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Loot::LootRoll::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> lootedTarget;
    recv_data >> itemSlot;
    recv_data >> rollType;
}

void WorldPackets::Loot::LootMasterGive::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> lootGuid;
    recv_data >> slotId;
    recv_data >> playerGuid;
}
