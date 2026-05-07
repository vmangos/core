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

void WorldPackets::Guild::GuildInviteNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << inviterName;
    buffer << guildName;
}

void WorldPackets::Guild::GuildDeclineNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerName;
}

void WorldPackets::Guild::GuildCommandResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << command;
    buffer << str;
    buffer << result;
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

void WorldPackets::Guild::SaveGuildEmblemResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << error;
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

void WorldPackets::Guild::GuildEvent::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << event;
    buffer << static_cast<uint8>(params.size());
    for (auto const& str : params)
        buffer << str;
    if (!affectedPlayerGuid.IsEmpty())
        buffer << affectedPlayerGuid;
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
