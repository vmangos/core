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

    class GroupJoinedBattleground final : public ServerPacket
    {
    public:
        uint32 result = 0;

        explicit GroupJoinedBattleground() : ServerPacket(SMSG_GROUP_JOINED_BATTLEGROUND) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Battleground

#endif // MANGOS_PACKETS_BATTLEGROUND_H
