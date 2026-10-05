#include "Npc.h"

void WorldPackets::Npc::GossipHello::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
}

void WorldPackets::Npc::NpcTextQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> textID;
    recv_data >> guid;
}

void WorldPackets::Npc::TrainerList::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Npc::TrainerBuySpell::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> spellId;
}

void WorldPackets::Npc::BinderActivate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
}

void WorldPackets::Npc::BankerActivate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Npc::TabardVendorActivate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Npc::SpiritHealerActivate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Npc::RepairItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
    recv_data >> itemGuid;
}

void WorldPackets::Npc::ListStabledPets::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
}

void WorldPackets::Npc::StablePet::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
}

void WorldPackets::Npc::UnstablePet::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
    recv_data >> petNumber;
}

void WorldPackets::Npc::BuyStableSlot::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
}

void WorldPackets::Npc::StableSwapPet::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> npcGuid;
    recv_data >> petNumber;
}

void WorldPackets::Npc::GossipSelectOption::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> gossipListId;
    if (!recv_data.empty())
    {
        recv_data >> code;
    }
}

// --- Server Packets ---

size_t WorldPackets::Npc::GossipComplete::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Npc::GossipComplete::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Npc::ShowBank::EstimateFinalSize() const
{
    return sizeof(bankerGuid);
}

void WorldPackets::Npc::ShowBank::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << bankerGuid;
}

size_t WorldPackets::Npc::StableResult::EstimateFinalSize() const
{
    return sizeof(result);
}

void WorldPackets::Npc::StableResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

size_t WorldPackets::Npc::TrainerBuySucceeded::EstimateFinalSize() const
{
    return sizeof(trainerGuid) +
           sizeof(spellId);
}

void WorldPackets::Npc::TrainerBuySucceeded::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << trainerGuid;
    buffer << spellId;
}

size_t WorldPackets::Npc::TrainerBuyFailed::EstimateFinalSize() const
{
    return sizeof(trainerGuid) +
           sizeof(serviceId) +
           sizeof(errorCode);
}

void WorldPackets::Npc::TrainerBuyFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << trainerGuid;
    buffer << serviceId;
    buffer << errorCode;
}

size_t WorldPackets::Npc::TabardVendorActivateResponse::EstimateFinalSize() const
{
    return sizeof(tabardVendorNpcGuid);
}

void WorldPackets::Npc::TabardVendorActivateResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << tabardVendorNpcGuid;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
size_t WorldPackets::Npc::AreaSpiritHealerTime::EstimateFinalSize() const
{
    return sizeof(spiritHealerGuid) +
           sizeof(nextResurrectTime);
}

void WorldPackets::Npc::AreaSpiritHealerTime::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << spiritHealerGuid;
    buffer << nextResurrectTime;
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
size_t WorldPackets::Npc::BinderConfirm::EstimateFinalSize() const
{
    return sizeof(binderGuid);
}

void WorldPackets::Npc::BinderConfirm::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << binderGuid;
}
#endif
