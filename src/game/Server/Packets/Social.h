#ifndef MANGOS_PACKETS_SOCIAL_H
#define MANGOS_PACKETS_SOCIAL_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "ClientDefines.h"

#include <vector>

namespace WorldPackets { namespace Social
{
    class FriendList final : public ServerPacket
    {
    public:
        struct Entry
        {
            ObjectGuid playerGuid; // player guid
            uint8 status = 0;      // online/offline/etc?
            uint32 area = 0;       // player area (only if online)
            uint32 level = 0;      // player level (only if online)
            uint32 class_ = 0;     // player class (only if online)
        };

        std::vector<Entry> friends;

        explicit FriendList() : ServerPacket(SMSG_FRIEND_LIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class IgnoreList final : public ServerPacket
    {
    public:
        std::vector<ObjectGuid> ignoredPlayers; // player guids of ignored players

        explicit IgnoreList() : ServerPacket(SMSG_IGNORE_LIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class FriendStatus final : public ServerPacket
    {
    public:
        uint8 result = 0;         // see enum FriendsResult
        ObjectGuid friendGuid;    // guid of the friend this status refers to

        // Extra data sent only for FRIEND_ADDED_ONLINE / FRIEND_ONLINE
        bool hasOnlineInfo = false;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        uint8 status = 0;         // online/afk/dnd
#endif
        uint32 area = 0;          // player area
        uint32 level = 0;         // player level
        uint32 class_ = 0;        // player class

        explicit FriendStatus() : ServerPacket(SMSG_FRIEND_STATUS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Social

#endif // MANGOS_PACKETS_SOCIAL_H
