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
    recv_data >> guid;
}
