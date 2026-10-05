#include "Item.h"
#include "ItemDefines.h"
#include "SpellEntry.h"

void WorldPackets::Item::QueryItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemEntry;
    recv_data >> itemGuid;
}

void WorldPackets::Item::ReadItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> bag;
    recv_data >> slot;
}

void WorldPackets::Item::AutoEquipItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> srcbag;
    recv_data >> srcslot;
}

void WorldPackets::Item::AutoStoreBagItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> srcbag;
    recv_data >> srcslot;
    recv_data >> dstbag;
}

void WorldPackets::Item::SwapItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> dstbag;
    recv_data >> dstslot;
    recv_data >> srcbag;
    recv_data >> srcslot;
}

void WorldPackets::Item::SwapInvItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> srcslot;
    recv_data >> dstslot;
}

void WorldPackets::Item::SplitItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> srcbag;
    recv_data >> srcslot;
    recv_data >> dstbag;
    recv_data >> dstslot;
    recv_data >> count;
}

void WorldPackets::Item::AutoEquipItemSlot::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemGuid;
    recv_data >> dstslot;
}

void WorldPackets::Item::DestroyItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    uint8 data1, data2, data3;
    recv_data >> bag;
    recv_data >> slot;
    recv_data >> count;
    recv_data >> data1;
    recv_data >> data2;
    recv_data >> data3;
}

void WorldPackets::Item::AutoBankItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> srcbag;
    recv_data >> srcslot;
}

void WorldPackets::Item::AutoStoreBankItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> srcbag;
    recv_data >> srcslot;
}

void WorldPackets::Item::SetAmmo::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> item;
}

void WorldPackets::Item::SellItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> vendorGuid;
    recv_data >> itemGuid;
    recv_data >> count;
}

void WorldPackets::Item::ListInventory::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Item::BuyBankSlot::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Item::BuyItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> vendorGuid;
    recv_data >> item;
    recv_data >> count;
    recv_data >> unk1;
}

void WorldPackets::Item::BuyItemInSlot::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> vendorGuid;
    recv_data >> item;
    recv_data >> bagGuid;
    recv_data >> bagslot;
    recv_data >> count;
}

void WorldPackets::Item::WrapItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> giftBag;
    recv_data >> giftSlot;
    recv_data >> itemBag;
    recv_data >> itemSlot;
}

void WorldPackets::Item::BuybackItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> vendorGuid;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    recv_data >> slot;
#endif
}

size_t WorldPackets::Item::BuyBankSlotResult::EstimateFinalSize() const
{
    return sizeof(result);
}

void WorldPackets::Item::BuyBankSlotResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

size_t WorldPackets::Item::ItemNameQueryResponse::EstimateFinalSize() const
{
    return sizeof(itemId) +
           name.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Item::ItemNameQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemId;
    buffer << name;
}

size_t WorldPackets::Item::ReadItemOk::EstimateFinalSize() const
{
    return sizeof(itemGuid) * 2;
}

void WorldPackets::Item::ReadItemOk::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << itemGuid;
}

size_t WorldPackets::Item::ReadItemFailed::EstimateFinalSize() const
{
    return sizeof(itemGuid) * 2 +
           sizeof(reason);
}

void WorldPackets::Item::ReadItemFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << reason;
    buffer << itemGuid;
}

size_t WorldPackets::Item::ItemEnchantTimeUpdate::EstimateFinalSize() const
{
    return sizeof(itemGuid) +
           sizeof(slot) +
           sizeof(duration)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
           + sizeof(playerGuid)
#endif
           ;
}

void WorldPackets::Item::ItemEnchantTimeUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << slot;
    buffer << duration;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    buffer << playerGuid;
#endif
}

size_t WorldPackets::Item::OpenContainer::EstimateFinalSize() const
{
    return sizeof(itemGuid);
}

void WorldPackets::Item::OpenContainer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
}

size_t WorldPackets::Item::BuyFailed::EstimateFinalSize() const
{
    return sizeof(vendorGuid) +
           sizeof(itemEntry) +
           sizeof(reason);
}

void WorldPackets::Item::BuyFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << vendorGuid;
    buffer << itemEntry;
    buffer << reason;
}

size_t WorldPackets::Item::SellItemResponse::EstimateFinalSize() const
{
    return sizeof(vendorGuid) +
           sizeof(itemGuid) +
           sizeof(reason);
}

void WorldPackets::Item::SellItemResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << vendorGuid;
    buffer << itemGuid;
    buffer << reason;
}

size_t WorldPackets::Item::BuyItemResponse::EstimateFinalSize() const
{
    return sizeof(vendorGuid) +
           sizeof(vendorSlot) +
           sizeof(newCount) +
           sizeof(purchaseCount);
}

void WorldPackets::Item::BuyItemResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << vendorGuid;
    buffer << vendorSlot;
    buffer << newCount;
    buffer << purchaseCount;
}

size_t WorldPackets::Item::InventoryChangeFailure::EstimateFinalSize() const
{
    if (reason == static_cast<uint8>(EQUIP_ERR_OK))
        return sizeof(reason);

    return sizeof(reason) +
           ((reason == static_cast<uint8>(EQUIP_ERR_CANT_EQUIP_LEVEL_I)) ? sizeof(requiredLevel) : 0) +
           sizeof(item1Guid) +
           sizeof(item2Guid) +
           sizeof(bagSlot);
}

void WorldPackets::Item::InventoryChangeFailure::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
    if (reason != static_cast<uint8>(EQUIP_ERR_OK))
    {
        if (reason == static_cast<uint8>(EQUIP_ERR_CANT_EQUIP_LEVEL_I))
            buffer << requiredLevel;
        buffer << item1Guid;
        buffer << item2Guid;
        buffer << bagSlot;
    }
}

size_t WorldPackets::Item::ItemPushResult::EstimateFinalSize() const
{
    return sizeof(playerGuid) +
           sizeof(received) +
           sizeof(created) +
           sizeof(showInChat) +
           sizeof(bagSlot) +
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
           sizeof(itemSlot) +
#endif
           sizeof(itemEntry) +
           sizeof(suffixFactor) +
           sizeof(randomPropertyId)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
           + sizeof(count)
#endif
           ;
}

void WorldPackets::Item::ItemPushResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
    buffer << received;
    buffer << created;
    buffer << showInChat;
    buffer << bagSlot;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    buffer << itemSlot;
#endif
    buffer << itemEntry;
    buffer << suffixFactor;
    buffer << randomPropertyId;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    buffer << count;
#endif
}

size_t WorldPackets::Item::ItemCooldown::EstimateFinalSize() const
{
    return sizeof(itemGuid) +
           sizeof(spellId);
}

void WorldPackets::Item::ItemCooldown::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << spellId;
}

size_t WorldPackets::Item::EnchantmentLog::EstimateFinalSize() const
{
    return sizeof(casterGuid) +
           sizeof(ownerGuid) +
           sizeof(itemEntry) +
           sizeof(spellId) +
           sizeof(uint8) /*showAffiliation*/;
}

void WorldPackets::Item::EnchantmentLog::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << casterGuid;
    buffer << ownerGuid;
    buffer << itemEntry;
    buffer << spellId;
    buffer << uint8(showAffiliation ? 1 : 0);
}
