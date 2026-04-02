#ifndef MANGOS_PACKETS_SPELL_H
#define MANGOS_PACKETS_SPELL_H

#include "Packet.h"
#include "SpellCastTargetsInfo.h"
#include "ObjectGuid.h"

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
}} // namespace WorldPackets::Spell

#endif // MANGOS_PACKETS_SPELL_H
