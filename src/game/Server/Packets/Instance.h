#ifndef MANGOS_PACKETS_INSTANCE_H
#define MANGOS_PACKETS_INSTANCE_H

#include "Packet.h"

#include <vector>

namespace WorldPackets { namespace Instance
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    class InstanceReset final : public ServerPacket
    {
    public:
        uint32 mapId = 0;

        explicit InstanceReset() : ServerPacket(SMSG_INSTANCE_RESET) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class InstanceResetFailed final : public ServerPacket
    {
    public:
        uint32 reason = 0; // InstanceResetFailReason enum value
        uint32 mapId = 0;

        explicit InstanceResetFailed() : ServerPacket(SMSG_INSTANCE_RESET_FAILED) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class UpdateInstanceOwnership final : public ServerPacket
    {
    public:
        uint32 hasBeenSaved = 0; // whether the player has any permanent instance binds

        explicit UpdateInstanceOwnership() : ServerPacket(SMSG_UPDATE_INSTANCE_OWNERSHIP) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class UpdateLastInstance final : public ServerPacket
    {
    public:
        uint32 mapId = 0; // map id of the last visited instance

        explicit UpdateLastInstance() : ServerPacket(SMSG_UPDATE_LAST_INSTANCE) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    class RaidInstanceMessage final : public ServerPacket
    {
    public:
        uint32 messageType = 0; // type of warning (RAID_INSTANCE_WELCOME, etc.)
        uint32 mapId = 0;
        uint32 resetTime = 0;   // time in seconds until reset

        explicit RaidInstanceMessage() : ServerPacket(SMSG_RAID_INSTANCE_MESSAGE) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class RaidInstanceInfo final : public ServerPacket
    {
    public:
        struct InstanceResetInfo
        {
            uint32 mapId = 0;
            uint32 resetTime = 0;
            uint32 instanceId = 0;
        };
        std::vector<InstanceResetInfo> resetInfos;

        explicit RaidInstanceInfo() : ServerPacket(SMSG_RAID_INSTANCE_INFO) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Instance

#endif // MANGOS_PACKETS_INSTANCE_H
