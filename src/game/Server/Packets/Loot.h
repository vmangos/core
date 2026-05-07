#ifndef MANGOS_PACKETS_LOOT_H
#define MANGOS_PACKETS_LOOT_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"

#include <vector>

namespace WorldPackets { namespace Loot
{
    class AutoStoreLootItem final : public ClientPacket
    {
    public:
        uint8 lootSlot;

        explicit AutoStoreLootItem() : ClientPacket(CMSG_AUTOSTORE_LOOT_ITEM), lootSlot(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class LootUnit final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit LootUnit() : ClientPacket(CMSG_LOOT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class LootRelease final : public ClientPacket
    {
    public:
        ObjectGuid guid; // not used by server (uses internally stored guid instead)

        explicit LootRelease() : ClientPacket(CMSG_LOOT_RELEASE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class LootRoll final : public ClientPacket
    {
    public:
        ObjectGuid lootedTarget;
        uint32 itemSlot = 0;
        uint8 rollType = 0;

        explicit LootRoll() : ClientPacket(CMSG_LOOT_ROLL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class LootMasterGive final : public ClientPacket
    {
    public:
        ObjectGuid lootGuid;
        uint8 slotId = 0;
        ObjectGuid playerGuid;

        explicit LootMasterGive() : ClientPacket(CMSG_LOOT_MASTER_GIVE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class LootClearMoney final : public ServerPacket
    {
    public:
        explicit LootClearMoney() : ServerPacket(SMSG_LOOT_CLEAR_MONEY) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LootMoneyNotify final : public ServerPacket
    {
    public:
        uint32 amount = 0;

        explicit LootMoneyNotify() : ServerPacket(SMSG_LOOT_MONEY_NOTIFY) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LootStartRoll final : public ServerPacket
    {
    public:
        ObjectGuid lootedTargetGuid;         // creature guid being looted
        uint32 itemSlot = 0;                 // item slot in loot
        uint32 itemEntryId = 0;              // the itemEntryId for the item that shall be rolled for
        uint32 randomSuffix = 0;             // randomSuffix - not used
        uint32 itemRandomPropId = 0;         // item random property ID
        uint32 countdownTime = 0;            // the countdown time to choose "need" or "greed"

        explicit LootStartRoll() : ServerPacket(SMSG_LOOT_START_ROLL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LootRollResponse final : public ServerPacket
    {
    public:
        ObjectGuid lootedTargetGuid;         // creature guid being looted
        uint32 itemSlot = 0;
        ObjectGuid rollerGuid;               // the player who rolled
        uint32 itemEntryId = 0;              // the itemEntryId for the item that shall be rolled for
        uint32 randomSuffix = 0;             // randomSuffix - not used
        uint32 itemRandomPropId = 0;         // Item random property ID
        uint8 rollNumber = 0;                // 0: "Need for..." > 127: "you passed on..."
        uint8 rollType = 0;                  // 0: need, 1: need roll, 2: greed roll

        explicit LootRollResponse() : ServerPacket(SMSG_LOOT_ROLL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LootRollWon final : public ServerPacket
    {
    public:
        ObjectGuid lootedTargetGuid;         // creature guid being looted
        uint32 itemSlot = 0;                 // item slot in loot
        uint32 itemEntryId = 0;              // the itemEntryId for the item that shall be rolled for
        uint32 randomSuffix = 0;             // randomSuffix - not used
        uint32 itemRandomPropId = 0;         // Item random property
        ObjectGuid winnerGuid;               // guid of the player who won
        uint8 rollNumber = 0;                // rollnumber related to SMSG_LOOT_ROLL
        uint8 rollType = 0;                  // Rolltype related to SMSG_LOOT_ROLL

        explicit LootRollWon() : ServerPacket(SMSG_LOOT_ROLL_WON) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LootAllPassed final : public ServerPacket
    {
    public:
        ObjectGuid lootedTargetGuid;         // creature guid being looted
        uint32 itemSlot = 0;                 // item slot in loot
        uint32 itemEntryId = 0;              // The itemEntryId for the item that shall be rolled for
        uint32 itemRandomPropId = 0;         // Item random property ID
        uint32 randomSuffixId = 0;           // Item random suffix ID - not used

        explicit LootAllPassed() : ServerPacket(SMSG_LOOT_ALL_PASSED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Loot

#endif // MANGOS_PACKETS_LOOT_H
