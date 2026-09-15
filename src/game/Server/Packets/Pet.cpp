#include "Pet.h"

void WorldPackets::Pet::QueryPetName::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petNumber;
    recv_data >> petGuid;
}

void WorldPackets::Pet::PetAction::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petGuid;
    recv_data >> data;
    recv_data >> targetGuid;
}

void WorldPackets::Pet::PetAbandon::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Pet::PetRename::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petGuid;
    recv_data >> name;
}

void WorldPackets::Pet::PetCancelAura::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> spellId;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
void WorldPackets::Pet::PetStopAttack::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petGuid;
}

void WorldPackets::Pet::PetUnlearn::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Pet::PetSpellAutocast::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> spellId;
    recv_data >> state;
}
#endif

void WorldPackets::Pet::PetSetAction::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petGuid;
    // Packet with 2 actions is 24 bytes: 8 bytes GUID + 2 actions * (4 bytes position + 4 bytes data)
    count = (recv_data.size() == (sizeof(uint64) + 2 * (sizeof(uint32) + sizeof(uint32)))) ? 2 : 1;
    for (uint8 i = 0; i < count; ++i)
    {
        recv_data >> actions[i].position;
        recv_data >> actions[i].data;
    }
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
void WorldPackets::Pet::PetCastSpell::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petGuid;
    recv_data >> spellId;
    recv_data >> targets;
}
#endif

// --- Server Packets ---

size_t WorldPackets::Pet::PetNameInvalid::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Pet::PetNameInvalid::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Pet::PetNameQueryResponse::EstimateFinalSize() const
{
    return sizeof(petNumber) +
           name.size() + sizeof(char) + /*null terminator*/
           sizeof(nameTimestamp);
}

void WorldPackets::Pet::PetNameQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << petNumber;
    buffer << name;
    buffer << nameTimestamp;
}

size_t WorldPackets::Pet::PetBroken::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Pet::PetBroken::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Pet::PetActionFeedback::EstimateFinalSize() const
{
    return sizeof(message);
}

void WorldPackets::Pet::PetActionFeedback::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << message;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
size_t WorldPackets::Pet::PetActionSound::EstimateFinalSize() const
{
    return sizeof(petGuid) +
           sizeof(soundId);
}

void WorldPackets::Pet::PetActionSound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << petGuid;
    buffer << soundId;
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
size_t WorldPackets::Pet::PetMode::EstimateFinalSize() const
{
    return sizeof(petGuid) +
           sizeof(reactState) +
           sizeof(commandState) +
           sizeof(flag1) +
           sizeof(enabledFlags);
}

void WorldPackets::Pet::PetMode::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << petGuid;
    buffer << reactState;
    buffer << commandState;
    buffer << flag1;
    buffer << enabledFlags;
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
size_t WorldPackets::Pet::PetUnlearnConfirm::EstimateFinalSize() const
{
    return sizeof(petGuid) +
           sizeof(cost);
}

void WorldPackets::Pet::PetUnlearnConfirm::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << petGuid;
    buffer << cost;
}
#endif

size_t WorldPackets::Pet::PetTameFailure::EstimateFinalSize() const
{
    return sizeof(reason);
}

void WorldPackets::Pet::PetTameFailure::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
}

size_t WorldPackets::Pet::PetCastFailed::EstimateFinalSize() const
{
    return sizeof(spellId) +
           sizeof(status) +
           sizeof(reason);
}

void WorldPackets::Pet::PetCastFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << spellId;
    buffer << status;
    buffer << reason;
}
