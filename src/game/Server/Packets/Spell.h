#ifndef MANGOS_PACKETS_SPELL_H
#define MANGOS_PACKETS_SPELL_H

#include "Packet.h"
#include "SpellCastTargetsInfo.h"
#include "ObjectGuid.h"

class SpellEntry;

namespace WorldPackets { namespace Spell
{
    class CastSpell final : public ClientPacket
    {
    public:
        uint32               spellId = 0;
        SpellCastTargets     targets;

        explicit CastSpell() : ClientPacket(CMSG_CAST_SPELL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class UseItem final : public ClientPacket
    {
    public:
        uint8 bagIndex;
        uint8 slot;
        uint8 spellSlot; // the position of the spell id on the item template
        SpellCastTargets targets;

        explicit UseItem() : ClientPacket(CMSG_USE_ITEM), bagIndex(0), slot(0), spellSlot(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class OpenItem final : public ClientPacket
    {
    public:
        uint8 bagIndex = 0;
        uint8 slot = 0;

        explicit OpenItem() : ClientPacket(CMSG_OPEN_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class CancelCast final : public ClientPacket
    {
    public:
        uint32 spellId = 0;

        explicit CancelCast() : ClientPacket(CMSG_CANCEL_CAST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class CancelAura final : public ClientPacket
    {
    public:
        uint32 spellId = 0;

        explicit CancelAura() : ClientPacket(CMSG_CANCEL_AURA) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class CancelChanneling final : public ClientPacket
    {
    public:
        uint32 spellId = 0; // not used by server

        explicit CancelChanneling() : ClientPacket(CMSG_CANCEL_CHANNELLING) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    // Simplified SMSG_CAST_RESULT for a basic spell failure (status=2) with no extra data.
    // For complex failures with additional payload (e.g. cooldown time, required area),
    // use the full Spell::SendCastResult() path in Spell.cpp instead.
    class CastResultSimpleFailure final : public ServerPacket
    {
    public:
        ::SpellEntry const* spellEntry; // SpellEntry pointers are always valid even when `.reload`
        uint8 reason;

        explicit CastResultSimpleFailure(::SpellEntry const* spellEntry, uint8 reason)
            : ServerPacket(SMSG_CAST_RESULT), spellEntry(spellEntry), reason(reason) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
}} // namespace WorldPackets::Spell

#endif // MANGOS_PACKETS_SPELL_H
