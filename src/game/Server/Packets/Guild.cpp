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
