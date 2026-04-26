#ifndef MANGOS_PACKETS_GROUP_H
#define MANGOS_PACKETS_GROUP_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "nonstd/optional.hpp"

#include <string>
#include <vector>

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

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    class RequestPartyMemberStats final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit RequestPartyMemberStats() : ClientPacket(CMSG_REQUEST_PARTY_MEMBER_STATS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

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

    class RaidReadyCheckFromClient final : public ClientPacket
    {
    public:
        // packet can be used in two ways:
        // - The leader will initiate a request when `hasValue() = false`
        // - All the players in the group will respond with `hasValue() = true`
        nonstd::optional<uint8> state;

        explicit RaidReadyCheckFromClient() : ClientPacket(MSG_RAID_READY_CHECK) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    // --- Server Packets ---

    class PartyCommandResult final : public ServerPacket
    {
    public:
        uint32 operation = 0;
        std::string memberName; // max len 48
        uint32 result = 0;

        explicit PartyCommandResult() : ServerPacket(SMSG_PARTY_COMMAND_RESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GroupInviteNotification final : public ServerPacket
    {
    public:
        std::string inviterName;

        explicit GroupInviteNotification() : ServerPacket(SMSG_GROUP_INVITE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GroupDeclineNotification final : public ServerPacket
    {
    public:
        std::string playerName;

        explicit GroupDeclineNotification() : ServerPacket(SMSG_GROUP_DECLINE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GroupUninviteNotification final : public ServerPacket
    {
    public:
        explicit GroupUninviteNotification() : ServerPacket(SMSG_GROUP_UNINVITE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GroupDestroyed final : public ServerPacket
    {
    public:
        explicit GroupDestroyed() : ServerPacket(SMSG_GROUP_DESTROYED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    /// Asks the player if ready or not
    class RaidReadyCheckFromServer_Request final : public ServerPacket
    {
    public:
        explicit RaidReadyCheckFromServer_Request() : ServerPacket(MSG_RAID_READY_CHECK) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    /// Will be sent to leader
    class RaidReadyCheckFromServer_Response final : public ServerPacket
    {
    public:
        ObjectGuid senderGuid;  // guid of the player who answered
        uint8 state = 0;        // ready state

        explicit RaidReadyCheckFromServer_Response() : ServerPacket(MSG_RAID_READY_CHECK) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // Delta update: a single icon was changed (mode byte = 0)
    class RaidTargetUpdateDelta final : public ServerPacket
    {
    public:
        uint8 iconId = 0;
        ObjectGuid targetGuid;

        explicit RaidTargetUpdateDelta() : ServerPacket(MSG_RAID_TARGET_UPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // Full icon list (mode byte = 1): sent when a client requests or after group list reset
    class RaidTargetUpdateAll final : public ServerPacket
    {
    public:
        struct IconEntry
        {
            uint8 iconId = 0;
            ObjectGuid targetGuid;
        };

        std::vector<IconEntry> icons;

        explicit RaidTargetUpdateAll() : ServerPacket(MSG_RAID_TARGET_UPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    // SMSG_GROUP_SET_LEADER: server notifies the group of the new leader (by name)
    class GroupSetLeaderNotification final : public ServerPacket
    {
    public:
        std::string leaderName;

        explicit GroupSetLeaderNotification() : ServerPacket(SMSG_GROUP_SET_LEADER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_GROUP_LIST: full list of group members sent to a single member
    // Will sent 0 in all fields if the player is leaving a group
    class GroupList final : public ServerPacket
    {
    public:
        struct Member
        {
            std::string name;
            ObjectGuid  guid;
            uint8       onlineStatus = 0;     // see GroupMemberStatus flags returned by GetGroupMemberStatus(...)
            uint8       groupAndAssistantFlag = 0; // (subgroup | (assistant ? 0x80 : 0))
        };

        uint8 groupType = 0;                  // group type flags
        uint8 ownGroupAndAssistantFlag = 0;   // (subgroup | (assistant ? 0x80 : 0)) of the recipient
        std::vector<Member> members;          // other members (recipient excluded)

        ObjectGuid leaderGuid;                // guid of the group leader

        // Fields below are only sent when at least one other member is listed.
        uint8 lootMethod = 0;                 // see LootMethod
        ObjectGuid looterGuid;                // master looter guid (only used for MASTER_LOOT; sent as 0 otherwise)
        uint8 lootThreshold = 0;              // item quality threshold

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        uint8 dungeonDifficulty = 0;          // dungeon difficulty (unused in 1.x)
#endif

        explicit GroupList() : ServerPacket(SMSG_GROUP_LIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_LOOT_MASTER_LIST: list of players eligible to receive master loot
    class LootMasterList final : public ServerPacket
    {
    public:
        std::vector<ObjectGuid> eligibleLooters; // guids of players that may receive the loot

        explicit LootMasterList() : ServerPacket(SMSG_LOOT_MASTER_LIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Group

#endif // MANGOS_PACKETS_GROUP_H
