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
    buffer << bodyText;
    buffer << flags;
    buffer << minSignatures;
    buffer << maxSignatures;
    buffer << deadlineTimestamp;
    buffer << creationTimestamp;
    buffer << allowedGuildID;
    buffer << allowedClasses;
    buffer << allowedRaces;
    buffer << allowedGender;
    buffer << allowedMinLevel;
    buffer << allowedMaxLevel;
    buffer << static_cast<uint32>(choices.size());
    for (const auto& choice : choices)
        buffer << choice;
    buffer << defaultChoice;
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
    buffer << static_cast<uint8>(entries.size());
    for (const auto& entry : entries)
    {
        buffer << entry.index;
        buffer << entry.charterEntry;
        buffer << entry.charterDisplayId;
        buffer << entry.charterCost;
        buffer << entry.entryFlags;
    }
}


