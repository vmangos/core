#ifndef MANGOS_PACKETS_COMBAT_H
#define MANGOS_PACKETS_COMBAT_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "DamageStructs.h"

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

    class AttackStart final : public ServerPacket
    {
    public:
        ObjectGuid attackerGuid;
        ObjectGuid victimGuid;

        explicit AttackStart() : ServerPacket(SMSG_ATTACKSTART) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PartyKillLog final : public ServerPacket
    {
    public:
        ObjectGuid killerGuid; // player with the killing blow
        ObjectGuid victimGuid;

        explicit PartyKillLog() : ServerPacket(SMSG_PARTYKILLLOG) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class EnvironmentalDamageLog final : public ServerPacket
    {
    public:
        ObjectGuid victimGuid;
        uint8 damageType = 0; // type of environmental damage
        uint32 damage = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        uint32 absorb = 0;
        int32 resist = 0;
#endif

        explicit EnvironmentalDamageLog() : ServerPacket(SMSG_ENVIRONMENTALDAMAGELOG) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_FEIGN_DEATH_RESISTED: empty body; sent when feign death is resisted
    class FeignDeathResisted final : public ServerPacket
    {
    public:
        explicit FeignDeathResisted() : ServerPacket(SMSG_FEIGN_DEATH_RESISTED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellDamageShield final : public ServerPacket
    {
    public:
        ObjectGuid victimGuid;  // unit that has the shield aura
        ObjectGuid attackerGuid; // unit that attacked the shield bearer
        uint32 damage = 0;
        uint32 school = 0;  // spell school of the shield damage

        explicit SpellDamageShield() : ServerPacket(SMSG_SPELLDAMAGESHIELD) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class MeleeAttackingStateUpdate final : public ServerPacket
    {
    public:
        uint32 hitInfo = 0;
        ObjectGuid attackerGuid;
        ObjectGuid victimGuid;
        int32 totalDamage = 0;
        std::vector<SubDamageInfo> subDamage;
        uint32 victimState = 0;
        uint32 attackerState = 0;
        uint32 meleeSpellDamage = 0;
        uint32 meleeSpellId = 0;
        int32 blockedAmount = 0;

        struct DebugMeleeAttackingStateInfo
        {
            uint32 debugField1 = 0;
            float debugField2 = 0;
            float debugField3 = 0;
            float debugField4 = 0;
            float debugField5 = 0;
            float debugField6 = 0;
            float debugField7 = 0;
            float debugField8 = 0;
            float debugField9 = 0;
            std::pair<float, float> debugPairs[5] = {};
            uint32 debugField10 = 0;
        };
        nonstd::optional<DebugMeleeAttackingStateInfo> debugInfo;

        explicit MeleeAttackingStateUpdate() : ServerPacket(SMSG_ATTACKERSTATEUPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Combat

#endif // MANGOS_PACKETS_COMBAT_H
