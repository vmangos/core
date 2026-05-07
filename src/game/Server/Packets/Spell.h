#ifndef MANGOS_PACKETS_SPELL_H
#define MANGOS_PACKETS_SPELL_H

#include "Packet.h"
#include "SpellCastTargetsInfo.h"
#include "ObjectGuid.h"
#include "nonstd/optional.hpp"

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

    class CastResult final : public ServerPacket
    {
    public:
        ::SpellEntry const* spellEntry;
        uint8 result = 0;
        uint8 failureReason = 0;
        nonstd::optional<uint32> failureArg1; // optional argument 1
        nonstd::optional<uint32> failureArg2; // optional argument 2

        explicit CastResult() : ServerPacket(SMSG_CAST_RESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PlaySpellVisual final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        uint32 spellVisualId = 0; // SpellVisualKit.dbc index

        explicit PlaySpellVisual() : ServerPacket(SMSG_PLAY_SPELL_VISUAL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    class PlaySpellImpact final : public ServerPacket
    {
    public:
        ObjectGuid targetGuid;
        uint32 spellVisualId = 0; // spell visual id

        explicit PlaySpellImpact() : ServerPacket(SMSG_PLAY_SPELL_IMPACT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

}} // namespace WorldPackets::Spell

#endif // MANGOS_PACKETS_SPELL_H
