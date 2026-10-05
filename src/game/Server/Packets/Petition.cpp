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

size_t WorldPackets::Petition::PetitionSignResults::EstimateFinalSize() const
{
    return sizeof(itemGuid) +
           sizeof(playerGuid) +
           sizeof(result);
}

void WorldPackets::Petition::PetitionSignResults::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << playerGuid;
    buffer << result;
}

size_t WorldPackets::Petition::TurnInPetitionResults::EstimateFinalSize() const
{
    return sizeof(result);
}

void WorldPackets::Petition::TurnInPetitionResults::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

size_t WorldPackets::Petition::PetitionQueryResponse::EstimateFinalSize() const
{
    size_t size = sizeof(petitionGuid) +
                  sizeof(ownerGuid) +
                  name.size() + sizeof(char) + /*null terminator*/
                  bodyText.size() + sizeof(char) + /*null terminator*/
                  sizeof(flags) +
                  sizeof(minSignatures) +
                  sizeof(maxSignatures) +
                  sizeof(deadlineTimestamp) +
                  sizeof(creationTimestamp) +
                  sizeof(allowedGuildID) +
                  sizeof(allowedClasses) +
                  sizeof(allowedRaces) +
                  sizeof(allowedGender) +
                  sizeof(allowedMinLevel) +
                  sizeof(allowedMaxLevel) +
                  sizeof(uint32) + /*choices count*/
                  sizeof(defaultChoice);

    for (auto const& choice : choices)
        size += choice.size() + sizeof(char) /*null terminator*/;

    return size;
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

size_t WorldPackets::Petition::PetitionRenameResult::EstimateFinalSize() const
{
    return sizeof(itemGuid) +
           newName.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Petition::PetitionRenameResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemGuid;
    buffer << newName;
}

size_t WorldPackets::Petition::PetitionDeclineResult::EstimateFinalSize() const
{
    return sizeof(playerGuid);
}

void WorldPackets::Petition::PetitionDeclineResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}

size_t WorldPackets::Petition::PetitionShowList::EstimateFinalSize() const
{
    return sizeof(npcGuid) +
           sizeof(uint8) + /*entries count*/
           entries.size() * (sizeof(PetitionShowListEntry::index) +
                             sizeof(PetitionShowListEntry::charterEntry) +
                             sizeof(PetitionShowListEntry::charterDisplayId) +
                             sizeof(PetitionShowListEntry::charterCost) +
                             sizeof(PetitionShowListEntry::entryFlags));
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


