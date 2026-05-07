#include "Social.h"

void WorldPackets::Social::FriendList::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(friends.size()); // friends count
    for (auto const& entry : friends)
    {
        buffer << entry.playerGuid;    // player guid
        buffer << entry.status;        // online/offline/etc?
        if (entry.status)              // if online
        {
            buffer << entry.area;      // player area
            buffer << entry.level;     // player level
            buffer << entry.class_;    // player class
        }
    }
}

void WorldPackets::Social::IgnoreList::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(ignoredPlayers.size()); // ignored count
    for (auto const& guid : ignoredPlayers)
        buffer << guid;                     // player guid
}

void WorldPackets::Social::FriendStatus::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
    buffer << friendGuid;

    if (hasOnlineInfo)
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        buffer << status;
#endif
        buffer << area;
        buffer << level;
        buffer << class_;
    }
}
