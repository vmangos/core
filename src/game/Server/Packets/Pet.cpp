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
