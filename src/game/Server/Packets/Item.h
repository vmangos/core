#ifndef MANGOS_PACKETS_ITEM_H
#define MANGOS_PACKETS_ITEM_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>
#include <vector>

namespace WorldPackets { namespace Item
{
    class QueryItem final : public ClientPacket
    {
    public:
        uint32 itemEntry; // db entry id
        ObjectGuid itemGuid;

        explicit QueryItem() : ClientPacket(CMSG_ITEM_QUERY_SINGLE), itemEntry(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ReadItem final : public ClientPacket
    {
    public:
        uint8 bag = 0;
        uint8 slot = 0;

        explicit ReadItem() : ClientPacket(CMSG_READ_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AutoEquipItem final : public ClientPacket
    {
    public:
        uint8 srcbag = 0;
        uint8 srcslot = 0;

        explicit AutoEquipItem() : ClientPacket(CMSG_AUTOEQUIP_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AutoStoreBagItem final : public ClientPacket
    {
    public:
        uint8 srcbag = 0;
        uint8 srcslot = 0;
        uint8 dstbag = 0;

        explicit AutoStoreBagItem() : ClientPacket(CMSG_AUTOSTORE_BAG_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SwapItem final : public ClientPacket
    {
    public:
        uint8 dstbag = 0;
        uint8 dstslot = 0;
        uint8 srcbag = 0;
        uint8 srcslot = 0;

        explicit SwapItem() : ClientPacket(CMSG_SWAP_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SwapInvItem final : public ClientPacket
    {
    public:
        uint8 srcslot = 0;
        uint8 dstslot = 0;

        explicit SwapInvItem() : ClientPacket(CMSG_SWAP_INV_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SplitItem final : public ClientPacket
    {
    public:
        uint8 srcbag = 0;
        uint8 srcslot = 0;
        uint8 dstbag = 0;
        uint8 dstslot = 0;
        uint8 count = 0;

        explicit SplitItem() : ClientPacket(CMSG_SPLIT_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AutoEquipItemSlot final : public ClientPacket
    {
    public:
        ObjectGuid itemGuid;
        uint8 dstslot = 0;

        explicit AutoEquipItemSlot() : ClientPacket(CMSG_AUTOEQUIP_ITEM_SLOT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class DestroyItem final : public ClientPacket
    {
    public:
        uint8 bag = 0;
        uint8 slot = 0;
        uint8 count = 0;

        explicit DestroyItem() : ClientPacket(CMSG_DESTROYITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AutoBankItem final : public ClientPacket
    {
    public:
        uint8 srcbag = 0;
        uint8 srcslot = 0;

        explicit AutoBankItem() : ClientPacket(CMSG_AUTOBANK_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AutoStoreBankItem final : public ClientPacket
    {
    public:
        uint8 srcbag = 0;
        uint8 srcslot = 0;

        explicit AutoStoreBankItem() : ClientPacket(CMSG_AUTOSTORE_BANK_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetAmmo final : public ClientPacket
    {
    public:
        uint32 item = 0;

        explicit SetAmmo() : ClientPacket(CMSG_SET_AMMO) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SellItem final : public ClientPacket
    {
    public:
        ObjectGuid vendorGuid;
        ObjectGuid itemGuid;
        uint8 count = 0;

        explicit SellItem() : ClientPacket(CMSG_SELL_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ListInventory final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit ListInventory() : ClientPacket(CMSG_LIST_INVENTORY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BuyBankSlot final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit BuyBankSlot() : ClientPacket(CMSG_BUY_BANK_SLOT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BuyItem final : public ClientPacket
    {
    public:
        ObjectGuid vendorGuid;
        uint32 item = 0;
        uint8 count = 0;
        uint8 unk1 = 0;

        explicit BuyItem() : ClientPacket(CMSG_BUY_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BuyItemInSlot final : public ClientPacket
    {
    public:
        ObjectGuid vendorGuid;
        ObjectGuid bagGuid;
        uint32 item = 0;
        uint8 bagslot = 0;
        uint8 count = 0;

        explicit BuyItemInSlot() : ClientPacket(CMSG_BUY_ITEM_IN_SLOT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class WrapItem final : public ClientPacket
    {
    public:
        uint8 giftBag = 0;
        uint8 giftSlot = 0;
        uint8 itemBag = 0;
        uint8 itemSlot = 0;

        explicit WrapItem() : ClientPacket(CMSG_WRAP_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BuybackItem final : public ClientPacket
    {
    public:
        ObjectGuid vendorGuid;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
        uint32 slot = 0;
#endif

        explicit BuybackItem() : ClientPacket(CMSG_BUYBACK_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class BuyBankSlotResult final : public ServerPacket
    {
    public:
        uint32 result = 0;

        explicit BuyBankSlotResult() : ServerPacket(SMSG_BUY_BANK_SLOT_RESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ItemNameQueryResponse final : public ServerPacket
    {
    public:
        uint32 itemId = 0;
        std::string name;

        explicit ItemNameQueryResponse() : ServerPacket(SMSG_ITEM_NAME_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ReadItemOk final : public ServerPacket
    {
    public:
        ObjectGuid itemGuid;

        explicit ReadItemOk() : ServerPacket(SMSG_READ_ITEM_OK) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ReadItemFailed final : public ServerPacket
    {
    public:
        ObjectGuid itemGuid;
        uint8 reason = 0;

        explicit ReadItemFailed() : ServerPacket(SMSG_READ_ITEM_FAILED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ItemEnchantTimeUpdate final : public ServerPacket
    {
    public:
        ObjectGuid itemGuid;
        uint32 slot = 0;
        uint32 duration = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        ObjectGuid playerGuid;
#endif

        explicit ItemEnchantTimeUpdate() : ServerPacket(SMSG_ITEM_ENCHANT_TIME_UPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class OpenContainer final : public ServerPacket
    {
    public:
        ObjectGuid itemGuid; // guid of the container to open in the UI

        explicit OpenContainer() : ServerPacket(SMSG_OPEN_CONTAINER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class BuyFailed final : public ServerPacket
    {
    public:
        ObjectGuid vendorGuid;
        uint32 itemEntry = 0;
        uint8 reason = 0; // BuyResult enum value

        explicit BuyFailed() : ServerPacket(SMSG_BUY_FAILED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SellItemResponse final : public ServerPacket
    {
    public:
        ObjectGuid vendorGuid;
        ObjectGuid itemGuid;
        uint8 reason = 0; // SellResult enum value

        explicit SellItemResponse() : ServerPacket(SMSG_SELL_ITEM) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class BuyItemResponse final : public ServerPacket
    {
    public:
        ObjectGuid vendorGuid;
        uint32 vendorSlot = 0;      // vendor slot, numbered from 1 at client
        uint32 newCount = 0;        // new stock count (0xFFFFFFFF if unlimited)
        uint32 purchaseCount = 0;   // number of items purchased

        explicit BuyItemResponse() : ServerPacket(SMSG_BUY_ITEM) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class InventoryChangeFailure final : public ServerPacket
    {
    public:
        uint8 reason = 0;          // InventoryResult enum value
        uint32 requiredLevel = 0;  // only used for EQUIP_ERR_CANT_EQUIP_LEVEL_I
        ObjectGuid item1Guid;      // first involved item guid (empty if no item)
        ObjectGuid item2Guid;      // second involved item guid (empty if no second item)
        uint8 bagSlot = 0;         // slot of target bag that has storing condition (can be InventorySlots or BankBagSlots)

        explicit InventoryChangeFailure() : ServerPacket(SMSG_INVENTORY_CHANGE_FAILURE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ItemPushResult final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid;
        uint32 received = 0;         // 0=looted, 1=from npc
        uint32 created = 0;          // 0=received, 1=created
        uint32 showInChat = 0;       // whether to show in chat
        uint8 bagSlot = 0;           // which bag slot the item went to
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        uint32 itemSlot = 0;         // item slot (0xFFFFFFFF if stacked on existing)
#endif
        uint32 itemEntry = 0;        // item entry id
        uint32 suffixFactor = 0;     // item suffix factor
        uint32 randomPropertyId = 0; // item random property id
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        uint32 count = 0;            // count of items added
#endif

        explicit ItemPushResult() : ServerPacket(SMSG_ITEM_PUSH_RESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ItemCooldown final : public ServerPacket
    {
    public:
        ObjectGuid itemGuid;
        uint32 spellId = 0;

        explicit ItemCooldown() : ServerPacket(SMSG_ITEM_COOLDOWN) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class EnchantmentLog final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid; // enchanter; empty means enchant has faded
        ObjectGuid ownerGuid;  // item owner
        uint32 itemEntry = 0;
        uint32 spellId = 0;
        bool showAffiliation = false; // only used if casterGuid is not empty

        explicit EnchantmentLog() : ServerPacket(SMSG_ENCHANTMENTLOG) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Item

#endif // MANGOS_PACKETS_ITEM_H
