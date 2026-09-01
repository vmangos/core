#ifndef MANGOS_PACKETS_SPELL_H
#define MANGOS_PACKETS_SPELL_H

#include "Duration.h"
#include "Packet.h"
#include "SpellCastTargetsInfo.h"
#include "ObjectGuid.h"
#include "SpellDefines.h"
#include "nonstd/optional.hpp"
#include <vector>

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
        uint32 spellId = 0;
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

    struct SpellLogMissEntry
    {
        ObjectGuid targetGuid;
        SpellMissInfo missInfo = SPELL_MISS_NONE;
    };

    class SpellLogMiss final : public ServerPacket
    {
    public:
        uint32 spellId = 0;
        ObjectGuid casterGuid;
        std::vector<SpellLogMissEntry> missEntries;

        explicit SpellLogMiss() : ServerPacket(SMSG_SPELLLOGMISS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ProcResist final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        ObjectGuid targetGuid;
        uint32 spellId = 0;
        uint8 logFormat = 0; // 0=default, 1=debug

        explicit ProcResist() : ServerPacket(SMSG_PROCRESIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellOrDamageImmune final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        ObjectGuid targetGuid;
        uint32 spellId = 0;
        uint8 logFormat = 0; // 0=default, 1=debug

        explicit SpellOrDamageImmune() : ServerPacket(SMSG_SPELLORDAMAGE_IMMUNE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    class SpellHealLog final : public ServerPacket
    {
    public:
        ObjectGuid targetGuid;
        ObjectGuid healerGuid;
        uint32 spellId = 0;
        uint32 healAmount = 0;
        bool isCritical = false;

        explicit SpellHealLog() : ServerPacket(SMSG_SPELLHEALLOG) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellEnergizeLog final : public ServerPacket
    {
    public:
        ObjectGuid targetGuid;
        ObjectGuid casterGuid;
        uint32 spellId = 0;
        uint32 powerType = 0; // Powers enum value
        uint32 amount = 0;

        explicit SpellEnergizeLog() : ServerPacket(SMSG_SPELLENERGIZELOG) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class SpellNonMeleeDamageLog final : public ServerPacket
    {
    public:
        ObjectGuid targetGuid;
        ObjectGuid attackerGuid;
        uint32 spellId = 0;
        uint32 damage = 0;
        uint8 school = 0;       // damage school
        uint32 absorbedDamage = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
        int32 resist = 0;
#endif
        bool periodicLog = false; // if true, client shows spell name in log
        bool unused = false;
        uint32 blocked = 0;
        uint32 hitInfo = 0;
        uint8 extendedData = 0; // flag to use extended data (always 0)

        explicit SpellNonMeleeDamageLog() : ServerPacket(SMSG_SPELLNONMELEEDAMAGELOG) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct SpellCooldownEntry
    {
        uint32 spellId = 0;
        Milliseconds cooldown{};
    };

    class SpellCooldown final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        std::vector<SpellCooldownEntry> cooldownEntries;

        explicit SpellCooldown() : ServerPacket(SMSG_SPELL_COOLDOWN) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ClearCooldown final : public ServerPacket
    {
    public:
        uint32 spellId = 0;
        ObjectGuid targetGuid;

        explicit ClearCooldown() : ServerPacket(SMSG_CLEAR_COOLDOWN) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class CooldownCheat final : public ServerPacket
    {
    public:
        ObjectGuid targetGuid;

        explicit CooldownCheat() : ServerPacket(SMSG_COOLDOWN_CHEAT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class CooldownEvent final : public ServerPacket
    {
    public:
        uint32 spellId = 0;
        ObjectGuid casterGuid;

        explicit CooldownEvent() : ServerPacket(SMSG_COOLDOWN_EVENT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SupercededSpell final : public ServerPacket
    {
    public:
        uint32 oldSpellId = 0; // spell being replaced/superseded
        uint32 newSpellId = 0; // new spell that supersedes it

        explicit SupercededSpell() : ServerPacket(SMSG_SUPERCEDED_SPELL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LearnedSpell final : public ServerPacket
    {
    public:
        uint32 spellId = 0;       // sent as uint16
        uint16 actionBarSlot = 0; // unused on client

        explicit LearnedSpell() : ServerPacket(SMSG_LEARNED_SPELL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class RemovedSpell final : public ServerPacket
    {
    public:
        uint32 spellId = 0;    // sent as uint16

        explicit RemovedSpell() : ServerPacket(SMSG_REMOVED_SPELL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_SET_FLAT_SPELL_MODIFIER / SMSG_SET_PCT_SPELL_MODIFIER
    class SetSpellModifier final : public ServerPacket
    {
    public:
        uint8 effectIndex = 0; // which spell effect index (0-63)
        uint8 modOp = 0;       // SpellModOp enum value
        int32 value = 0;       // flat or percent modifier value

        explicit SetSpellModifier(uint16 opcode) : ServerPacket(opcode) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellStart final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        ObjectGuid unitCasterGuid;
        uint32 spellId = 0;
        uint16 castFlags = 0;
        uint32 castTimer = 0;
        SpellCastTargets targets;
        uint32 ammoDisplayId = 0;
        uint32 ammoInventoryType = 0;

        explicit SpellStart() : ServerPacket(SMSG_SPELL_START) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellGo final : public ServerPacket
    {
    public:
        struct SpellGoMissTarget
        {
            SpellGoMissTarget(ObjectGuid target, uint8 miss, uint8 reflect) : targetGuid(target), missCondition(miss), reflectResult(reflect) {};
            ObjectGuid targetGuid;
            uint8 missCondition = 0;
            uint8 reflectResult = 0;
        };

        ObjectGuid casterGuid;
        ObjectGuid unitCasterGuid;
        uint32 spellId = 0;
        uint16 castFlags = 0;
        std::vector<ObjectGuid> hitTargets;
        std::vector<SpellGoMissTarget> missTargets;
        SpellCastTargets targets;
        uint32 ammoDisplayId = 0;
        uint32 ammoInventoryType = 0;

        explicit SpellGo() : ServerPacket(SMSG_SPELL_GO) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellLogExecute final : public ServerPacket
    {
    public:
        struct ExecuteLogInfo
        {
            ExecuteLogInfo() {}
            ExecuteLogInfo(ObjectGuid _targetGuid) : targetGuid(_targetGuid) {}

            ObjectGuid targetGuid;

            union
            {
                struct
                {
                    uint32 power;
                    uint32 amount;
                    float multiplier;
                } powerDrain;

                struct
                {
                    uint32 count;
                } extraAttacks;

                struct
                {
                    uint32 itemEntry;
                } createItem;

                struct
                {
                    uint32 spellId;
                } interruptCast;

                struct
                {
                    uint32 itemEntry;
                } feedPet;

                struct
                {
                    int32 itemEntry;
                    int32 unk;
                } durabilityDamage;

                struct
                {
                    uint32 amount;
                    uint8 critical;
                } heal;

                struct
                {
                    uint32 amount;
                    uint32 powerType;
                } energize;
            };
        };

        ObjectGuid casterGuid;
        SpellEntry const* pSpellEntry = nullptr;
        std::vector<WorldPackets::Spell::SpellLogExecute::ExecuteLogInfo> executeLogInfos[MAX_EFFECT_INDEX];

        explicit SpellLogExecute() : ServerPacket(SMSG_SPELLLOGEXECUTE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellFailedOther final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        uint32 spellId = 0;

        explicit SpellFailedOther() : ServerPacket(SMSG_SPELL_FAILED_OTHER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ChannelStart final : public ServerPacket
    {
    public:
        uint32 spellId = 0;
        uint32 duration = 0;

        explicit ChannelStart() : ServerPacket(MSG_CHANNEL_START) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ChannelUpdate final : public ServerPacket
    {
    public:
        uint32 duration = 0;

        explicit ChannelUpdate() : ServerPacket(MSG_CHANNEL_UPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    class SpellUpdateChainTargets final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        uint32 spellId = 0;
        std::vector<ObjectGuid> targets;

        explicit SpellUpdateChainTargets() : ServerPacket(SMSG_SPELL_UPDATE_CHAIN_TARGETS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class ResurrectRequest final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        std::string casterName;
        bool sickness = false; // warns it will cause ressurrection sickness
        bool delayed = false; // if false ignore delay sent with SMSG_CORPSE_RECLAIM_DELAY

        explicit ResurrectRequest() : ServerPacket(SMSG_RESURRECT_REQUEST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SpellDelayed final : public ServerPacket
    {
    public:
        ObjectGuid casterGuid;
        uint32 delayTime = 0;

        explicit SpellDelayed() : ServerPacket(SMSG_SPELL_DELAYED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class InitialSpells final : public ServerPacket
    {
    public:
        struct KnownSpell
        {
            KnownSpell(uint16 spellId_, int16 unk_) : spellId(spellId_), unk(unk_) {};
            uint16 spellId = 0;
            int16 unk = 0;
        };
        struct CurrentCooldown
        {
            CurrentCooldown(uint16 spellId_, uint16 itemId_, uint16 category_, int32 recoveryTime_, int32 categoryRecoveryTime_) :
                spellId(spellId_), itemId(itemId_), category(category_), recoveryTime(recoveryTime_), categoryRecoveryTime(categoryRecoveryTime_) {};
            uint16 spellId = 0;
            uint16 itemId = 0;
            uint16 category = 0;
            int32 recoveryTime = 0;
            int32 categoryRecoveryTime = 0;
        };
        uint8 talentSpec = 0; // always 0
        std::vector<KnownSpell> knownSpells;
        std::vector<CurrentCooldown> cooldowns;

        explicit InitialSpells() : ServerPacket(SMSG_INITIAL_SPELLS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Spell

#endif // MANGOS_PACKETS_SPELL_H
