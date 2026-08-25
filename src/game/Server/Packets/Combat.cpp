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

void WorldPackets::Combat::MeleeAttackingStateUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint32(hitInfo);
    buffer << attackerGuid.WriteAsPackedClientBuildAware();
    buffer << victimGuid.WriteAsPackedClientBuildAware();
    buffer << int32(totalDamage);
    buffer << uint8(subDamage.size());
    for (auto const& itr : subDamage)
    {
        buffer << int32(GetFirstSchoolInMask(itr.damageSchoolMask));
        buffer << float(itr.damage);
        buffer << int32(itr.damage);
        buffer << int32(itr.absorb);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
        buffer << int32(itr.resist);
#endif
    }
    buffer << uint32(victimState);
    buffer << uint32(attackerState);
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_5_1
    buffer << uint32(meleeSpellDamage);
#endif
    buffer << uint32(meleeSpellId);
    buffer << int32(blockedAmount);

    if ((hitInfo & HITINFO_DEBUG) && debugInfo.has_value())
    {
        buffer << debugInfo->debugField1;
        buffer << debugInfo->debugField2;
        buffer << debugInfo->debugField3;
        buffer << debugInfo->debugField4;
        buffer << debugInfo->debugField5;
        buffer << debugInfo->debugField6;
        buffer << debugInfo->debugField7;
        buffer << debugInfo->debugField8;
        buffer << debugInfo->debugField9;
        for (auto const& pair : debugInfo->debugPairs)
        {
            buffer << float(pair.first);
            buffer << float(pair.second);
        }
        buffer << debugInfo->debugField10;
    }
}
