#ifndef MANGOS_PACKETS_LOOT_H
#define MANGOS_PACKETS_LOOT_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"

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
}} // namespace WorldPackets::Loot

#endif // MANGOS_PACKETS_LOOT_H
