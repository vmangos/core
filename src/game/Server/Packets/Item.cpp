#include "Item.h"

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

void WorldPackets::Item::BuyBankSlotResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

void WorldPackets::Item::ItemNameQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemId;
    buffer << name;
}

void WorldPackets::Item::ReadItemOk::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << itemGuid;
}

void WorldPackets::Item::ReadItemFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << reason;
    buffer << itemGuid;
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


