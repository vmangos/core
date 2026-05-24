#ifndef MANGOS_PACKETS_CHANNEL_H
#define MANGOS_PACKETS_CHANNEL_H

#include "Packet.h"

namespace WorldPackets { namespace Channel
{
    class JoinChannel final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string channelPassword;

        explicit JoinChannel() : ClientPacket(CMSG_JOIN_CHANNEL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class LeaveChannel final : public ClientPacket
    {
    public:
        std::string channelName;

        explicit LeaveChannel() : ClientPacket(CMSG_LEAVE_CHANNEL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelList final : public ClientPacket
    {
    public:
        std::string channelName;

        explicit ChannelList() : ClientPacket(CMSG_CHANNEL_LIST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelPassword final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string password;

        explicit ChannelPassword() : ClientPacket(CMSG_CHANNEL_PASSWORD) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelSetOwner final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelSetOwner() : ClientPacket(CMSG_CHANNEL_SET_OWNER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelOwner final : public ClientPacket
    {
    public:
        std::string channelName;

        explicit ChannelOwner() : ClientPacket(CMSG_CHANNEL_OWNER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelModerator final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelModerator() : ClientPacket(CMSG_CHANNEL_MODERATOR) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelUnmoderator final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelUnmoderator() : ClientPacket(CMSG_CHANNEL_UNMODERATOR) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelMute final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelMute() : ClientPacket(CMSG_CHANNEL_MUTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelUnmute final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelUnmute() : ClientPacket(CMSG_CHANNEL_UNMUTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelInvite final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelInvite() : ClientPacket(CMSG_CHANNEL_INVITE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelKick final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelKick() : ClientPacket(CMSG_CHANNEL_KICK) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelBan final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelBan() : ClientPacket(CMSG_CHANNEL_BAN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelUnban final : public ClientPacket
    {
    public:
        std::string channelName;
        std::string playerName;

        explicit ChannelUnban() : ClientPacket(CMSG_CHANNEL_UNBAN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelAnnouncements final : public ClientPacket
    {
    public:
        std::string channelName;

        explicit ChannelAnnouncements() : ClientPacket(CMSG_CHANNEL_ANNOUNCEMENTS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChannelModerate final : public ClientPacket
    {
    public:
        std::string channelName;

        explicit ChannelModerate() : ClientPacket(CMSG_CHANNEL_MODERATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class ChannelNotify final : public ServerPacket
    {
    public:
        uint8 type = 0;
        std::string channelName;

        explicit ChannelNotify() : ServerPacket(SMSG_CHANNEL_NOTIFY) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
}} // namespace WorldPackets::Channel

#endif // MANGOS_PACKETS_CHANNEL_H
