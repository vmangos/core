#include "Petition.h"

void WorldPackets::Petition::PetitionShow::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petitionerNpcGuid;
}

void WorldPackets::Petition::PetitionShowSignatures::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemGuid;
}

void WorldPackets::Petition::QueryPetition::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> petitionGuid;
    recv_data >> itemGuid;
}

void WorldPackets::Petition::PetitionDecline::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemGuid;
}

void WorldPackets::Petition::TurnInPetition::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemGuid;
}

void WorldPackets::Petition::PetitionRename::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemGuid;
    recv_data >> newName;
}

void WorldPackets::Petition::PetitionSign::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemGuid;
    recv_data.read_skip<int8>(); // argument of `/run SignPetition(123)` is never used in the official interface
}

void WorldPackets::Petition::OfferPetition::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemGuid;
    recv_data >> playerGuid;
}

void WorldPackets::Petition::PetitionBuy::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guidNPC;                                   // NPC GUID
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint64>();                          // 0
    recv_data >> name;                                      // name
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint32>();                          // 0
    recv_data.read_skip<uint16>();                          // 0
    recv_data.read_skip<uint8>();                           // 0
    recv_data.read_skip<uint32>();                          // index (unused)
    recv_data.read_skip<uint32>();                          // 0
}

void WorldPackets::Petition::PetitionSignResults::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << playerGuid;
    buffer << result;
}

void WorldPackets::Petition::TurnInPetitionResults::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

void WorldPackets::Petition::PetitionQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << petitionGuid;
    buffer << ownerGuid;
    buffer << name;
    buffer << uint8(0);                                     // bodyText
    buffer << flags;
    buffer << minSignatures;
    buffer << maxSignatures;
    buffer << uint32(0);                                    // deadLine
    buffer << uint32(0);                                    // issueDate
    buffer << uint32(0);                                    // allowedGuildID
    buffer << uint32(0);                                    // allowedClasses
    buffer << uint32(0);                                    // allowedRaces
    buffer << uint16(0);                                    // allowedGender
    buffer << uint32(0);                                    // allowedMinLevel
    buffer << uint32(0);                                    // allowedMaxLevel
    buffer << uint32(0);                                    // choicetext
    buffer << uint32(0);                                    // numChoices
}

void WorldPackets::Petition::PetitionRenameResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << newName;
}

void WorldPackets::Petition::PetitionDeclineResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}

void WorldPackets::Petition::PetitionShowList::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << npcGuid;
    buffer << count;
    buffer << index;
    buffer << charterEntry;
    buffer << charterDisplayId;
    buffer << charterCost;
    buffer << unknown;
}


