#include "Spell.h"

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
