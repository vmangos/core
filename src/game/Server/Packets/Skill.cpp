#include "Skill.h"

void WorldPackets::Skill::LearnTalent::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> talent_id;
    recv_data >> requested_rank;
}

void WorldPackets::Skill::UnlearnSkill::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> skillId;
}

void WorldPackets::Skill::TalentWipeConfirm::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> trainerGuid;
}

size_t WorldPackets::Skill::TalentWipeConfirmResponse::EstimateFinalSize() const
{
    return sizeof(trainerGuid) +
           sizeof(cost);
}

void WorldPackets::Skill::TalentWipeConfirmResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << trainerGuid;
    buffer << cost;
}

size_t WorldPackets::Skill::SetProficiency::EstimateFinalSize() const
{
    return sizeof(itemClass) +
           sizeof(itemSubclassMask);
}

void WorldPackets::Skill::SetProficiency::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemClass;
    buffer << itemSubclassMask;
}
