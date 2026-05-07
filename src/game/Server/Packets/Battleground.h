#ifndef MANGOS_PACKETS_BATTLEGROUND_H
#define MANGOS_PACKETS_BATTLEGROUND_H

#include "Packet.h"
#include "ObjectGuid.h"

namespace WorldPackets { namespace Battleground
{
    class BattlefieldListRequest final : public ClientPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        uint32 mapId = 0;
#endif

        explicit BattlefieldListRequest() : ClientPacket(CMSG_BATTLEFIELD_LIST) {}

        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    class AreaSpiritHealerQuery final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit AreaSpiritHealerQuery() : ClientPacket(CMSG_AREA_SPIRIT_HEALER_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AreaSpiritHealerQueue final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit AreaSpiritHealerQueue() : ClientPacket(CMSG_AREA_SPIRIT_HEALER_QUEUE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    class BattlemasterHello final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit BattlemasterHello() : ClientPacket(CMSG_BATTLEMASTER_HELLO) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class BattleFieldPort final : public ClientPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        uint32 mapId = 0;
#endif
        uint8 action = 0;

        explicit BattleFieldPort() : ClientPacket(CMSG_BATTLEFIELD_PORT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    class LeaveBattlefield final : public ClientPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        uint32 mapId = 0;
#endif

        explicit LeaveBattlefield() : ClientPacket(CMSG_LEAVE_BATTLEFIELD) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    class BattlemasterJoin final : public ClientPacket
    {
    public:
        // battlemaster guid, or player guid if joining queue from BG portal
        ObjectGuid guid;
        uint32     mapId = 0;
        uint32     instanceId = 0;
        uint8      joinAsGroup = 0;

        explicit BattlemasterJoin() : ClientPacket(CMSG_BATTLEMASTER_JOIN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    class BattlefieldJoin final : public ClientPacket
    {
    public:
        uint32 mapId = 0;

        explicit BattlefieldJoin() : ClientPacket(CMSG_BATTLEFIELD_JOIN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    class GroupJoinedBattleground final : public ServerPacket
    {
    public:
        uint32 result = 0;

        explicit GroupJoinedBattleground() : ServerPacket(SMSG_GROUP_JOINED_BATTLEGROUND) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class BattlefieldStatus final : public ServerPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        uint32 queueSlot = 0;        // queue id (0...2) - player can be in 3 queues in time
#endif
        uint32 mapId = 0;
        uint8  bracketId = 0;        // battleground bracket id
        uint32 clientInstanceId = 0; // client-side battleground instance id
        uint32 statusId = 0;         // see enum BattleGroundStatus

        // Interpretation of time1/time2 depends on statusId:
        //   STATUS_WAIT_QUEUE  : time1 = average wait time (ms), time2 = time in queue (ms)
        //   STATUS_WAIT_JOIN   : time1 = time to remove from queue (ms)
        //   STATUS_IN_PROGRESS : time1 = time to auto-leave (ms), time2 = time since bg start (ms)
        uint32 time1 = 0;
        uint32 time2 = 0;

        explicit BattlefieldStatus() : ServerPacket(SMSG_BATTLEFIELD_STATUS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_BATTLEFIELD_STATUS for an empty/cleared queue slot
    class BattlefieldStatusEmpty final : public ServerPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        uint32 queueSlot = 0;        // queue id (0...2)
#endif

        explicit BattlefieldStatusEmpty() : ServerPacket(SMSG_BATTLEFIELD_STATUS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    class PvpLogData final : public ServerPacket
    {
    public:
        struct PlayerScore
        {
            ObjectGuid playerGuid;
            uint32 rank = 4;                 // honor rank (4 = none)
            uint32 killingBlows = 0;
            uint32 honorableKills = 0;
            uint32 deaths = 0;
            uint32 bonusHonor = 0;

            // Battleground specific extra fields appended after the common header.
            std::vector<uint32> extraFields; // is int32 in client, but we use uint32 for consistency
        };

        bool ended = false;                  // whether the battleground has ended
        uint8 winner = 0;                    // winning team (only meaningful when ended)
        std::vector<PlayerScore> playerScores;

        explicit PvpLogData() : ServerPacket(MSG_PVP_LOG_DATA) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class UpdateWorldState final : public ServerPacket
    {
    public:
        uint32 field = 0;  // world state field id
        uint32 value = 0;  // new value

        explicit UpdateWorldState() : ServerPacket(SMSG_UPDATE_WORLD_STATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    class BattlegroundPlayerJoined final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid; // guid of the player that joined the battleground

        explicit BattlegroundPlayerJoined() : ServerPacket(SMSG_BATTLEGROUND_PLAYER_JOINED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class BattlegroundPlayerLeft final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid; // guid of the player that left the battleground

        explicit BattlegroundPlayerLeft() : ServerPacket(SMSG_BATTLEGROUND_PLAYER_LEFT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class BattlefieldList final : public ServerPacket
    {
    public:
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        ObjectGuid battlemasterGuid;
#endif
        uint32 mapId = 0; // battleground map id
        uint8  bracketId = 0;
        std::vector<uint32> instanceIds; // list of available bg instance ids

        explicit BattlefieldList() : ServerPacket(SMSG_BATTLEFIELD_LIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_BATTLEFIELD_WIN: empty body; sent to the winning team
    class BattlefieldWin final : public ServerPacket
    {
    public:
        explicit BattlefieldWin() : ServerPacket(SMSG_BATTLEFIELD_WIN) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_BATTLEFIELD_LOSE: empty body; sent to the losing team
    class BattlefieldLose final : public ServerPacket
    {
    public:
        explicit BattlefieldLose() : ServerPacket(SMSG_BATTLEFIELD_LOSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Battleground

#endif // MANGOS_PACKETS_BATTLEGROUND_H
