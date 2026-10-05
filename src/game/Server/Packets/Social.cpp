#include "Social.h"

size_t WorldPackets::Social::FriendList::EstimateFinalSize() const
{
    // Assumes every friend is online, the area/level/class fields may not be sent.
    return sizeof(uint8) + /*friends count*/
           friends.size() * (sizeof(Entry::playerGuid) +
                             sizeof(Entry::status) +
                             sizeof(Entry::area) +
                             sizeof(Entry::level) +
                             sizeof(Entry::class_));
}

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

size_t WorldPackets::Social::IgnoreList::EstimateFinalSize() const
{
    return sizeof(uint8) + /*ignored count*/
           ignoredPlayers.size() * sizeof(ObjectGuid);
}

void WorldPackets::Social::IgnoreList::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(ignoredPlayers.size()); // ignored count
    for (auto const& guid : ignoredPlayers)
        buffer << guid;                     // player guid
}

size_t WorldPackets::Social::FriendStatus::EstimateFinalSize() const
{
    if (!hasOnlineInfo)
        return sizeof(result) +
               sizeof(friendGuid);

    return sizeof(result) +
           sizeof(friendGuid) +
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
           sizeof(status) +
#endif
           sizeof(area) +
           sizeof(level) +
           sizeof(class_);
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
