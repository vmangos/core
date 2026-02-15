#ifndef MANGOS_PACKETS_NPC_H
#define MANGOS_PACKETS_NPC_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>

namespace WorldPackets { namespace Npc
{
    class GossipHello final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;

        explicit GossipHello() : ClientPacket(CMSG_GOSSIP_HELLO) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class NpcTextQuery final : public ClientPacket
    {
    public:
        uint32 textID = 0;
        ObjectGuid guid;

        explicit NpcTextQuery() : ClientPacket(CMSG_NPC_TEXT_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TrainerList final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit TrainerList() : ClientPacket(CMSG_TRAINER_LIST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TrainerBuySpell final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 spellId = 0;

        explicit TrainerBuySpell() : ClientPacket(CMSG_TRAINER_BUY_SPELL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BinderActivate final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;

        explicit BinderActivate() : ClientPacket(CMSG_BINDER_ACTIVATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BankerActivate final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit BankerActivate() : ClientPacket(CMSG_BANKER_ACTIVATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TabardVendorActivate final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit TabardVendorActivate() : ClientPacket(MSG_TABARDVENDOR_ACTIVATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SpiritHealerActivate final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit SpiritHealerActivate() : ClientPacket(CMSG_SPIRIT_HEALER_ACTIVATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class RepairItem final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;
        ObjectGuid itemGuid;

        explicit RepairItem() : ClientPacket(CMSG_REPAIR_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ListStabledPets final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;

        explicit ListStabledPets() : ClientPacket(MSG_LIST_STABLED_PETS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class StablePet final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;

        explicit StablePet() : ClientPacket(CMSG_STABLE_PET) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class UnstablePet final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;
        uint32 petNumber = 0;

        explicit UnstablePet() : ClientPacket(CMSG_UNSTABLE_PET) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BuyStableSlot final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;

        explicit BuyStableSlot() : ClientPacket(CMSG_BUY_STABLE_SLOT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class StableSwapPet final : public ClientPacket
    {
    public:
        ObjectGuid npcGuid;
        uint32 petNumber = 0;

        explicit StableSwapPet() : ClientPacket(CMSG_STABLE_SWAP_PET) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GossipSelectOption final : public ClientPacket
    {
    public:
        ObjectGuid  guid;
        uint32      gossipListId = 0;
        std::string code;

        explicit GossipSelectOption() : ClientPacket(CMSG_GOSSIP_SELECT_OPTION) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
}} // namespace WorldPackets::Npc

#endif // MANGOS_PACKETS_NPC_H
