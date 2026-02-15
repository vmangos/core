#include "Channel.h"

void WorldPackets::Channel::JoinChannel::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> channelPassword;
}

void WorldPackets::Channel::LeaveChannel::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
}

void WorldPackets::Channel::ChannelList::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
}

void WorldPackets::Channel::ChannelPassword::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> password;
}

void WorldPackets::Channel::ChannelSetOwner::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelOwner::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
}

void WorldPackets::Channel::ChannelModerator::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelUnmoderator::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelMute::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelUnmute::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelInvite::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelKick::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelBan::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelUnban::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
    recv_data >> playerName;
}

void WorldPackets::Channel::ChannelAnnouncements::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
}

void WorldPackets::Channel::ChannelModerate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> channelName;
}
