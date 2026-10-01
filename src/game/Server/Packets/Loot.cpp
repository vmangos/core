#include "Loot.h"
#include "LootMgr.h"
#include "ObjectMgr.h"

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

size_t WorldPackets::Loot::LootClearMoney::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Loot::LootClearMoney::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Loot::LootMoneyNotify::EstimateFinalSize() const
{
    return sizeof(amount);
}

void WorldPackets::Loot::LootMoneyNotify::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << amount;
}

size_t WorldPackets::Loot::LootStartRoll::EstimateFinalSize() const
{
    return sizeof(lootedTargetGuid) +
           sizeof(itemSlot) +
           sizeof(itemEntryId) +
           sizeof(randomSuffix) +
           sizeof(itemRandomPropId) +
           sizeof(countdownTime);
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

size_t WorldPackets::Loot::LootRollResponse::EstimateFinalSize() const
{
    return sizeof(lootedTargetGuid) +
           sizeof(itemSlot) +
           sizeof(rollerGuid) +
           sizeof(itemEntryId) +
           sizeof(randomSuffix) +
           sizeof(itemRandomPropId) +
           sizeof(rollNumber) +
           sizeof(rollType);
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

size_t WorldPackets::Loot::LootRollWon::EstimateFinalSize() const
{
    return sizeof(lootedTargetGuid) +
           sizeof(itemSlot) +
           sizeof(itemEntryId) +
           sizeof(randomSuffix) +
           sizeof(itemRandomPropId) +
           sizeof(winnerGuid) +
           sizeof(rollNumber) +
           sizeof(rollType);
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

size_t WorldPackets::Loot::LootAllPassed::EstimateFinalSize() const
{
    return sizeof(lootedTargetGuid) +
           sizeof(itemSlot) +
           sizeof(itemEntryId) +
           sizeof(itemRandomPropId) +
           sizeof(randomSuffixId);
}

void WorldPackets::Loot::LootAllPassed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootedTargetGuid;
    buffer << itemSlot;
    buffer << itemEntryId;
    buffer << itemRandomPropId;
    buffer << randomSuffixId;
}

size_t WorldPackets::Loot::LootReleaseResponse::EstimateFinalSize() const
{
    return sizeof(lootedGuid) +
           sizeof(result);
}

void WorldPackets::Loot::LootReleaseResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootedGuid;
    buffer << result;
}

size_t WorldPackets::Loot::LootRemoved::EstimateFinalSize() const
{
    return sizeof(lootSlot);
}

void WorldPackets::Loot::LootRemoved::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootSlot;
}

size_t WorldPackets::Loot::LootResponse::EstimateFinalSize() const
{
    return sizeof(lootedGuid) +
           sizeof(lootType) +
           (lootType != 0 ? sizeof(gold) + sizeof(uint8) + items.size() *
               (sizeof(LootSlotItem::idx) +
                sizeof(LootSlotItem::itemId) +
                sizeof(LootSlotItem::count) +
                sizeof(LootSlotItem::displayId) +
                sizeof(LootSlotItem::unk) +
                sizeof(LootSlotItem::randomPropertyId) +
                sizeof(LootSlotItem::slotType))
               :
               sizeof(lootError));
}

ByteBuffer& operator<<(ByteBuffer& b, WorldPackets::Loot::LootResponse::LootSlotItem const& li)
{
    b << li.idx;
    b << li.itemId;
    b << li.count;                                  // nr of items of this type
    b << li.displayId;
    b << li.unk;
    b << li.randomPropertyId;
    b << li.slotType;
    return b;
}

void WorldPackets::Loot::LootResponse::AddItem(uint8 idx, LootItem const& item, uint8 slotType)
{
    LootSlotItem lootItem;
    lootItem.idx = idx;
    lootItem.itemId = item.itemid;
    lootItem.count = item.count;
    lootItem.displayId = sObjectMgr.GetItemPrototype(item.itemid)->DisplayInfoID;
    lootItem.randomPropertyId = item.randomPropertyId;
    lootItem.slotType = slotType;
    items.emplace_back(std::move(lootItem));
}

void WorldPackets::Loot::LootResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << lootedGuid;
    buffer << lootType;
    if (lootType)
    {
        buffer << gold;
        buffer << uint8(items.size());
        for (auto const& itr : items)
            buffer << itr;
    }
    else
        buffer << lootError;
}
