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

// --- Server Packets ---

void WorldPackets::Loot::LootClearMoney::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Loot::LootMoneyNotify::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << amount;
}

void WorldPackets::Loot::LootStartRoll::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootedTargetGuid;
    buffer << itemSlot;
    buffer << itemEntryId;
    buffer << randomSuffix;
    buffer << itemRandomPropId;
    buffer << countdownTime;
}

void WorldPackets::Loot::LootRollResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootedTargetGuid;
    buffer << itemSlot;
    buffer << rollerGuid;
    buffer << itemEntryId;
    buffer << randomSuffix;
    buffer << itemRandomPropId;
    buffer << rollNumber;
    buffer << rollType;
}

void WorldPackets::Loot::LootRollWon::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootedTargetGuid;
    buffer << itemSlot;
    buffer << itemEntryId;
    buffer << randomSuffix;
    buffer << itemRandomPropId;
    buffer << winnerGuid;
    buffer << rollNumber;
    buffer << rollType;
}

void WorldPackets::Loot::LootAllPassed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootedTargetGuid;
    buffer << itemSlot;
    buffer << itemEntryId;
    buffer << itemRandomPropId;
    buffer << randomSuffixId;
}


