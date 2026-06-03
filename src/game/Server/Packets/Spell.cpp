#include "Spell.h"
#include "Spells/Spell.h"
#include "SpellDefines.h"

void WorldPackets::Spell::CastSpell::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> spellId;
    recv_data >> targets;
}

void WorldPackets::Spell::UseItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> bagIndex;
    recv_data >> slot;
    recv_data >> spellSlot;
    recv_data >> targets;
}

void WorldPackets::Spell::OpenItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> bagIndex;
    recv_data >> slot;
}

void WorldPackets::Spell::CancelCast::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> spellId;
}

void WorldPackets::Spell::CancelAura::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> spellId;
}

void WorldPackets::Spell::CancelChanneling::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> spellId;
}

void WorldPackets::Spell::CastResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << spellId;
    buffer << result;
    if (result == static_cast<uint8>(SPELL_RESULT_STATUS_FAIL))
    {
        buffer << failureReason;
        if (failureArg1 || failureArg2)
            buffer << failureArg1.value_or(0);
        if (failureArg2)
            buffer << *failureArg2;
    }
}

void WorldPackets::Spell::PlaySpellVisual::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << casterGuid;
    buffer << spellVisualId;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
void WorldPackets::Spell::PlaySpellImpact::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << targetGuid;
    buffer << spellVisualId;
}
#endif

void WorldPackets::Spell::SpellLogMiss::AppendBodyTo(ByteBuffer& buffer) const
{
    bool constexpr useExtendedInfo = false; // Seems unused in client

    buffer << spellId;
    buffer << casterGuid;
    buffer << useExtendedInfo;
    buffer << static_cast<uint32>(missEntries.size());
    for (auto const& entry : missEntries)
    {
        buffer << entry.targetGuid;
        buffer << static_cast<uint8>(entry.missInfo);
        if (useExtendedInfo)
        {
            buffer << 0.0f;
            buffer << 0.0f;
        }
    }
}

void WorldPackets::Spell::ProcResist::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << casterGuid;
    buffer << targetGuid;
    buffer << spellId;
    buffer << logFormat;
}

void WorldPackets::Spell::SpellOrDamageImmune::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << casterGuid;
    buffer << targetGuid;
    buffer << spellId;
    buffer << logFormat;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
void WorldPackets::Spell::SpellHealLog::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << targetGuid.WriteAsPacked();
    buffer << healerGuid.WriteAsPacked();
    buffer << spellId;
    buffer << healAmount;
    buffer << isCritical;
}

void WorldPackets::Spell::SpellEnergizeLog::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << targetGuid.WriteAsPacked();
    buffer << casterGuid.WriteAsPacked();
    buffer << spellId;
    buffer << powerType;
    buffer << amount;
}
#endif

void WorldPackets::Spell::SpellNonMeleeDamageLog::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << targetGuid.WriteAsPackedClientBuildAware();
    buffer << attackerGuid.WriteAsPackedClientBuildAware();
    buffer << spellId;
    buffer << damage;
    buffer << school;
    buffer << absorbedDamage;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    buffer << resist;
#endif
    buffer << periodicLog;
    buffer << unused;
    buffer << blocked;
    buffer << hitInfo;
    buffer << extendedData;
}

void WorldPackets::Spell::SpellCooldown::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << casterGuid;
    for (auto const& cooldownEntry : cooldownEntries)
    {
        buffer << cooldownEntry.spellId;
        buffer << static_cast<uint32>(cooldownEntry.cooldown.count());
    }
}

void WorldPackets::Spell::ClearCooldown::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << spellId;
    buffer << targetGuid;
}

void WorldPackets::Spell::CooldownCheat::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << targetGuid;
}

void WorldPackets::Spell::CooldownEvent::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << spellId;
    buffer << casterGuid;
}

void WorldPackets::Spell::SupercededSpell::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << static_cast<uint16>(oldSpellId);
    buffer << static_cast<uint16>(newSpellId);
}

void WorldPackets::Spell::LearnedSpell::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << static_cast<uint16>(spellId);
    buffer << static_cast<int16>(actionBarSlot); // not used
}

void WorldPackets::Spell::RemovedSpell::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << static_cast<uint16>(spellId);
}

void WorldPackets::Spell::SetSpellModifier::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << effectIndex;
    buffer << modOp;
    buffer << value;
}
