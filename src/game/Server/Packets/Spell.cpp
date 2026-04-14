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

void WorldPackets::Spell::CastResultSimpleFailure::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << spellEntry->Id;
    buffer << static_cast<uint8>(SPELL_RESULT_STATUS_FAIL);
    buffer << reason;
}
