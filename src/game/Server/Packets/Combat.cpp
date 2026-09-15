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

size_t WorldPackets::Combat::AttackSwingNotInRange::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Combat::AttackSwingNotInRange::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Combat::AttackSwingNotStanding::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Combat::AttackSwingNotStanding::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Combat::AttackSwingDeadTarget::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Combat::AttackSwingDeadTarget::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Combat::AttackSwingCantAttack::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Combat::AttackSwingCantAttack::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Combat::CancelCombat::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Combat::CancelCombat::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Combat::AttackSwingBadFacing::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Combat::AttackSwingBadFacing::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Combat::AttackStop::EstimateFinalSize() const
{
    return sizeof(uint8) + sizeof(attackerGuid) + /*packed*/
           sizeof(uint8) + sizeof(victimGuid) + /*packed*/
           sizeof(uint32) /*isDead, is 32bit on client*/;
}

void WorldPackets::Combat::AttackStop::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << attackerGuid.WriteAsPackedClientBuildAware();
    buffer << victimGuid.WriteAsPackedClientBuildAware();
    buffer << static_cast<uint32>(isDead); // is 32bit on client
}

size_t WorldPackets::Combat::AttackStart::EstimateFinalSize() const
{
    return sizeof(attackerGuid) +
           sizeof(victimGuid);
}

void WorldPackets::Combat::AttackStart::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << attackerGuid;
    buffer << victimGuid;
}

size_t WorldPackets::Combat::PartyKillLog::EstimateFinalSize() const
{
    return sizeof(killerGuid) +
           sizeof(victimGuid);
}

void WorldPackets::Combat::PartyKillLog::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << killerGuid;
    buffer << victimGuid;
}

size_t WorldPackets::Combat::EnvironmentalDamageLog::EstimateFinalSize() const
{
    return sizeof(victimGuid) +
           sizeof(damageType) +
           sizeof(damage)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
           + sizeof(absorb)
           + sizeof(resist)
#endif
           ;
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

size_t WorldPackets::Combat::FeignDeathResisted::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Combat::FeignDeathResisted::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Combat::SpellDamageShield::EstimateFinalSize() const
{
    return sizeof(victimGuid) +
           sizeof(attackerGuid) +
           sizeof(damage) +
           sizeof(school);
}

void WorldPackets::Combat::SpellDamageShield::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << victimGuid;
    buffer << attackerGuid;
    buffer << damage;
    buffer << school;
}

size_t WorldPackets::Combat::MeleeAttackingStateUpdate::EstimateFinalSize() const
{
    size_t size = sizeof(hitInfo) +
                  sizeof(uint8) + sizeof(attackerGuid) + /*packed*/
                  sizeof(uint8) + sizeof(victimGuid) + /*packed*/
                  sizeof(totalDamage) +
                  sizeof(uint8) + /*sub damage count*/
                  subDamage.size() * (sizeof(int32) + /*damage school*/
                                      sizeof(float) + /*damage as float*/
                                      sizeof(int32) + /*damage*/
                                      sizeof(int32)   /*absorb*/
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
                                      + sizeof(int32) /*resist*/
#endif
                                     ) +
                  sizeof(victimState) +
                  sizeof(attackerState) +
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_5_1
                  sizeof(meleeSpellDamage) +
#endif
                  sizeof(meleeSpellId) +
                  sizeof(blockedAmount);

    if ((hitInfo & HITINFO_DEBUG) && debugInfo.has_value())
        size += sizeof(DebugMeleeAttackingStateInfo::armor) +
                sizeof(DebugMeleeAttackingStateInfo::critChance) +
                sizeof(DebugMeleeAttackingStateInfo::combatRoll) +
                sizeof(DebugMeleeAttackingStateInfo::missChance) +
                sizeof(DebugMeleeAttackingStateInfo::dodgeChance) +
                sizeof(DebugMeleeAttackingStateInfo::parryChance) +
                sizeof(DebugMeleeAttackingStateInfo::blockChance) +
                sizeof(DebugMeleeAttackingStateInfo::glanceChance) +
                sizeof(DebugMeleeAttackingStateInfo::crushChance) +
                sizeof(DebugMeleeAttackingStateInfo::damage) +
                sizeof(DebugMeleeAttackingStateInfo::debugField10);

    return size;
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
        buffer << debugInfo->armor;
        buffer << debugInfo->critChance;
        buffer << debugInfo->combatRoll;
        buffer << debugInfo->missChance;
        buffer << debugInfo->dodgeChance;
        buffer << debugInfo->parryChance;
        buffer << debugInfo->blockChance;
        buffer << debugInfo->glanceChance;
        buffer << debugInfo->crushChance;
        for (auto const& pair : debugInfo->damage)
        {
            buffer << float(pair.first); // min
            buffer << float(pair.second); // max
        }
        buffer << debugInfo->debugField10;
    }
}
