#ifndef MANGOS_PACKETS_GROUP_H
#define MANGOS_PACKETS_GROUP_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "nonstd/optional.hpp"

namespace WorldPackets { namespace Group
{
    class GroupInvite final : public ClientPacket
    {
    public:
        std::string memberName;

        explicit GroupInvite() : ClientPacket(CMSG_GROUP_INVITE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GroupUninvite final : public ClientPacket
    {
    public:
        std::string memberName;

        explicit GroupUninvite() : ClientPacket(CMSG_GROUP_UNINVITE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GroupUninviteGuid final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit GroupUninviteGuid() : ClientPacket(CMSG_GROUP_UNINVITE_GUID) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class RequestPartyMemberStats final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit RequestPartyMemberStats() : ClientPacket(CMSG_REQUEST_PARTY_MEMBER_STATS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class LootMethod final : public ClientPacket
    {
    public:
        uint32 lootMethod = 0;
        ObjectGuid lootMaster;
        uint32 lootThreshold = 0;

        explicit LootMethod() : ClientPacket(CMSG_LOOT_METHOD) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MinimapPing final : public ClientPacket
    {
    public:
        float x = 0.0f;
        float y = 0.0f;

        explicit MinimapPing() : ClientPacket(MSG_MINIMAP_PING) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class RandomRoll final : public ClientPacket
    {
    public:
        uint32 minimum = 0;
        uint32 maximum = 0;

        explicit RandomRoll() : ClientPacket(MSG_RANDOM_ROLL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GroupChangeSubGroup final : public ClientPacket
    {
    public:
        std::string name;
        uint8 groupNr = 0;

        explicit GroupChangeSubGroup() : ClientPacket(CMSG_GROUP_CHANGE_SUB_GROUP) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GroupSwapSubGroup final : public ClientPacket
    {
    public:
        std::string name;
        std::string nameSwapWith;

        explicit GroupSwapSubGroup() : ClientPacket(CMSG_GROUP_SWAP_SUB_GROUP) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GroupSetLeader final : public ClientPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
        ObjectGuid guid;
#else
        std::string name;
#endif

        explicit GroupSetLeader() : ClientPacket(CMSG_GROUP_SET_LEADER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GroupAssistantLeader final : public ClientPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
        ObjectGuid guid;
#else
        std::string name;
#endif
        uint8 flag = 0;

        explicit GroupAssistantLeader() : ClientPacket(CMSG_GROUP_ASSISTANT_LEADER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    class RaidTargetUpdate final : public ClientPacket
    {
    public:
        uint8      iconId = 0;
        ObjectGuid guid; // only valid when iconId != 0xFF (icon update, not request)

        explicit RaidTargetUpdate() : ClientPacket(MSG_RAID_TARGET_UPDATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class RaidReadyCheck final : public ClientPacket
    {
    public:
        // packet can be used in two ways: request: `hasValue() = false`, response: `hasValue() = true`
        nonstd::optional<uint8> state;

        explicit RaidReadyCheck() : ClientPacket(MSG_RAID_READY_CHECK) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

}} // namespace WorldPackets::Group

#endif // MANGOS_PACKETS_GROUP_H
