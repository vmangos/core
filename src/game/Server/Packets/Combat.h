#ifndef MANGOS_PACKETS_COMBAT_H
#define MANGOS_PACKETS_COMBAT_H

#include "Packet.h"
#include "ObjectGuid.h"

namespace WorldPackets { namespace Combat
{
    class AttackSwing final : public ClientPacket
    {
    public:
        ObjectGuid targetGuid;

        explicit AttackSwing() : ClientPacket(CMSG_ATTACKSWING) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetSheathed final : public ClientPacket
    {
    public:
        uint32 sheathed = 0;

        explicit SetSheathed() : ClientPacket(CMSG_SETSHEATHED) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class AttackSwingNotInRange final : public ServerPacket
    {
    public:
        explicit AttackSwingNotInRange() : ServerPacket(SMSG_ATTACKSWING_NOTINRANGE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AttackSwingNotStanding final : public ServerPacket
    {
    public:
        explicit AttackSwingNotStanding() : ServerPacket(SMSG_ATTACKSWING_NOTSTANDING) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AttackSwingDeadTarget final : public ServerPacket
    {
    public:
        explicit AttackSwingDeadTarget() : ServerPacket(SMSG_ATTACKSWING_DEADTARGET) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AttackSwingCantAttack final : public ServerPacket
    {
    public:
        explicit AttackSwingCantAttack() : ServerPacket(SMSG_ATTACKSWING_CANT_ATTACK) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class CancelCombat final : public ServerPacket
    {
    public:
        explicit CancelCombat() : ServerPacket(SMSG_CANCEL_COMBAT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AttackSwingBadFacing final : public ServerPacket
    {
    public:
        explicit AttackSwingBadFacing() : ServerPacket(SMSG_ATTACKSWING_BADFACING) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AttackStop final : public ServerPacket
    {
    public:
        ObjectGuid attackerGuid;
        ObjectGuid victimGuid;
        bool isDead = false;

        explicit AttackStop() : ServerPacket(SMSG_ATTACKSTOP) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Combat

#endif // MANGOS_PACKETS_COMBAT_H
