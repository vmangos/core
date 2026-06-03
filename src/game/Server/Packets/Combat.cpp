#include "Combat.h"

void WorldPackets::Combat::AttackSwing::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> targetGuid;
}

void WorldPackets::Combat::SetSheathed::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> sheathed;
}

// --- Server Packets ---

void WorldPackets::Combat::AttackSwingNotInRange::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Combat::AttackSwingNotStanding::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Combat::AttackSwingDeadTarget::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Combat::AttackSwingCantAttack::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Combat::CancelCombat::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Combat::AttackSwingBadFacing::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Combat::AttackStop::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << attackerGuid.WriteAsPackedClientBuildAware();
    buffer << victimGuid.WriteAsPackedClientBuildAware();
    buffer << static_cast<uint32>(isDead); // is 32bit on client
}

void WorldPackets::Combat::AttackStart::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << attackerGuid;
    buffer << victimGuid;
}

void WorldPackets::Combat::PartyKillLog::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << killerGuid;
    buffer << victimGuid;
}

void WorldPackets::Combat::EnvironmentalDamageLog::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << victimGuid;
    buffer << damageType;
    buffer << damage;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    buffer << absorb;
    buffer << resist;
#endif
}

void WorldPackets::Combat::FeignDeathResisted::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Combat::SpellDamageShield::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << victimGuid;
    buffer << attackerGuid;
    buffer << damage;
    buffer << school;
}
