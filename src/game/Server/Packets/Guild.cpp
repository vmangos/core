#include "Guild.h"

void WorldPackets::Guild::GuildCreate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> desiredGuildName;
}

void WorldPackets::Guild::GuildQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guildId;
}

void WorldPackets::Guild::GuildInvite::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> invitedName;
}

void WorldPackets::Guild::GuildRemove::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerName;
}

void WorldPackets::Guild::GuildPromote::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerName;
}

void WorldPackets::Guild::GuildDemote::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerName;
}

void WorldPackets::Guild::GuildLeader::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerName;
}

void WorldPackets::Guild::GuildMOTD::ReadFromWorldPacket(WorldPacket& recv_data)
{
    if (!recv_data.empty())
        recv_data >> motd;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
void WorldPackets::Guild::GuildChangeInfoText::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> infoText;
}
#endif

void WorldPackets::Guild::SaveGuildEmblem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> vendorGuid;
    recv_data >> emblemStyle;
    recv_data >> emblemColor;
    recv_data >> borderStyle;
    recv_data >> borderColor;
    recv_data >> backgroundColor;
}

void WorldPackets::Guild::GuildSetPublicNote::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerName;
    recv_data >> note;
}

void WorldPackets::Guild::GuildSetOfficerNote::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerName;
    recv_data >> note;
}

void WorldPackets::Guild::GuildAddRank::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> rankName;
}

void WorldPackets::Guild::GuildRank::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> rankId;
    recv_data >> rights;
    recv_data >> rankName;
}

size_t WorldPackets::Guild::GuildInviteNotification::EstimateFinalSize() const
{
    return inviterName.size() + sizeof(char) + /*null terminator*/
           guildName.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Guild::GuildInviteNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << inviterName;
    buffer << guildName;
}

size_t WorldPackets::Guild::GuildDeclineNotification::EstimateFinalSize() const
{
    return playerName.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Guild::GuildDeclineNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerName;
}

size_t WorldPackets::Guild::GuildCommandResult::EstimateFinalSize() const
{
    return sizeof(command) +
           str.size() + sizeof(char) + /*null terminator*/
           sizeof(result);
}

void WorldPackets::Guild::GuildCommandResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << command;
    buffer << str;
    buffer << result;
}

size_t WorldPackets::Guild::GuildInfo::EstimateFinalSize() const
{
    return guildName.size() + sizeof(char) + /*null terminator*/
           sizeof(createdDay) +
           sizeof(createdMonth) +
           sizeof(createdYear) +
           sizeof(memberCount) +
           sizeof(accountCount);
}

void WorldPackets::Guild::GuildInfo::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << guildName;
    buffer << createdDay;
    buffer << createdMonth;
    buffer << createdYear;
    buffer << memberCount;
    buffer << accountCount;
}

size_t WorldPackets::Guild::SaveGuildEmblemResult::EstimateFinalSize() const
{
    return sizeof(error);
}

void WorldPackets::Guild::SaveGuildEmblemResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << error;
}

size_t WorldPackets::Guild::GuildQueryResponse::EstimateFinalSize() const
{
    return sizeof(guildId) +
           guildName.size() + sizeof(char) + /*null terminator*/
           sizeof(char) * 10 + /*rank name null terminators*/
           rankNames[0].size() +
           rankNames[1].size() +
           rankNames[2].size() +
           rankNames[3].size() +
           rankNames[4].size() +
           rankNames[5].size() +
           rankNames[6].size() +
           rankNames[7].size() +
           rankNames[8].size() +
           rankNames[9].size() +
           sizeof(emblemStyle) +
           sizeof(emblemColor) +
           sizeof(borderStyle) +
           sizeof(borderColor) +
           sizeof(backgroundColor);
}

void WorldPackets::Guild::GuildQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << guildId;
    buffer << guildName;
    for (auto const& rankName : rankNames)
        buffer << rankName;

    // Emblem
    buffer << emblemStyle;
    buffer << emblemColor;
    buffer << borderStyle;
    buffer << borderColor;
    buffer << backgroundColor;
}

size_t WorldPackets::Guild::GuildEvent::EstimateFinalSize() const
{
    size_t size = sizeof(event) +
                  sizeof(uint8) + /*params count*/
                  (affectedPlayerGuid.IsEmpty() ? 0 : sizeof(affectedPlayerGuid));

    for (auto const& str : params)
        size += str.size() + sizeof(char) /*null terminator*/;

    return size;
}

void WorldPackets::Guild::GuildEvent::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << event;
    buffer << static_cast<uint8>(params.size());
    for (auto const& str : params)
        buffer << str;
    if (!affectedPlayerGuid.IsEmpty())
        buffer << affectedPlayerGuid;
}

size_t WorldPackets::Guild::GuildRoster::EstimateFinalSize() const
{
    size_t size = sizeof(uint32) + /*roster members count*/
                  motd.size() + sizeof(char) + /*null terminator*/
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
                  guildInfo.size() + sizeof(char) + /*null terminator*/
#endif
                  sizeof(uint32) + /*rank rights count*/
                  rankRights.size() * sizeof(uint32);

    for (auto const& member : rosterMembers)
        size += sizeof(GuildRosterMember::guid) +
                sizeof(GuildRosterMember::presenceFlags) +
                member.name.size() + sizeof(char) + /*null terminator*/
                sizeof(GuildRosterMember::rankId) +
                sizeof(GuildRosterMember::level) +
                sizeof(GuildRosterMember::classId) +
                sizeof(GuildRosterMember::zoneId) +
                sizeof(GuildRosterMember::lastOnlineTime) +
                member.publicNote.size() + sizeof(char) + /*null terminator*/
                member.officerNote.size() + sizeof(char) /*null terminator*/;

    return size;
}

void WorldPackets::Guild::GuildRoster::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << static_cast<uint32>(rosterMembers.size());
    buffer << motd;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buffer << guildInfo;
#endif

    buffer << static_cast<uint32>(rankRights.size());
    for (auto const& rights : rankRights)
        buffer << rights;

    for (auto const& member : rosterMembers)
    {
        buffer << member.guid;
        buffer << member.presenceFlags;
        buffer << member.name;
        buffer << member.rankId;
        buffer << member.level;
        buffer << member.classId;
        buffer << member.zoneId;
        if (!member.presenceFlags) // member is offline
            buffer << member.lastOnlineTime;
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
        else
            buffer << uint8(0);
#endif
        buffer << member.publicNote;
        buffer << member.officerNote;
    }
}
