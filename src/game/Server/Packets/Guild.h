#ifndef MANGOS_PACKETS_GUILD_H
#define MANGOS_PACKETS_GUILD_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>
#include <vector>

namespace WorldPackets { namespace Guild
{
    class GuildCreate final : public ClientPacket
    {
    public:
        std::string desiredGuildName;

        explicit GuildCreate() : ClientPacket(CMSG_GUILD_CREATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildQuery final : public ClientPacket
    {
    public:
        uint32 guildId = 0;

        explicit GuildQuery() : ClientPacket(CMSG_GUILD_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildInvite final : public ClientPacket
    {
    public:
        std::string invitedName;

        explicit GuildInvite() : ClientPacket(CMSG_GUILD_INVITE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildRemove final : public ClientPacket
    {
    public:
        std::string playerName;

        explicit GuildRemove() : ClientPacket(CMSG_GUILD_REMOVE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildPromote final : public ClientPacket
    {
    public:
        std::string playerName;

        explicit GuildPromote() : ClientPacket(CMSG_GUILD_PROMOTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildDemote final : public ClientPacket
    {
    public:
        std::string playerName;

        explicit GuildDemote() : ClientPacket(CMSG_GUILD_DEMOTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildLeader final : public ClientPacket
    {
    public:
        std::string playerName;

        explicit GuildLeader() : ClientPacket(CMSG_GUILD_LEADER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildMOTD final : public ClientPacket
    {
    public:
        std::string motd;

        explicit GuildMOTD() : ClientPacket(CMSG_GUILD_MOTD) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    class GuildChangeInfoText final : public ClientPacket
    {
    public:
        std::string infoText;

        explicit GuildChangeInfoText() : ClientPacket(CMSG_GUILD_INFO_TEXT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    class SaveGuildEmblem final : public ClientPacket
    {
    public:
        ObjectGuid vendorGuid;
        int32 emblemStyle = 0;
        int32 emblemColor = 0;
        int32 borderStyle = 0;
        int32 borderColor = 0;
        int32 backgroundColor = 0;

        explicit SaveGuildEmblem() : ClientPacket(MSG_SAVE_GUILD_EMBLEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildSetPublicNote final : public ClientPacket
    {
    public:
        std::string playerName;
        std::string note;

        explicit GuildSetPublicNote() : ClientPacket(CMSG_GUILD_SET_PUBLIC_NOTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildSetOfficerNote final : public ClientPacket
    {
    public:
        std::string playerName;
        std::string note;

        explicit GuildSetOfficerNote() : ClientPacket(CMSG_GUILD_SET_OFFICER_NOTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildAddRank final : public ClientPacket
    {
    public:
        std::string rankName;

        explicit GuildAddRank() : ClientPacket(CMSG_GUILD_ADD_RANK) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GuildRank final : public ClientPacket
    {
    public:
        uint32 rankId = 0;
        uint32 rights = 0;
        std::string rankName;

        explicit GuildRank() : ClientPacket(CMSG_GUILD_RANK) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class GuildInviteNotification final : public ServerPacket
    {
    public:
        std::string inviterName;
        std::string guildName;

        explicit GuildInviteNotification() : ServerPacket(SMSG_GUILD_INVITE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GuildDeclineNotification final : public ServerPacket
    {
    public:
        std::string playerName;

        explicit GuildDeclineNotification() : ServerPacket(SMSG_GUILD_DECLINE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GuildCommandResult final : public ServerPacket
    {
    public:
        uint32 command = 0;
        std::string str;
        uint32 result = 0;

        explicit GuildCommandResult() : ServerPacket(SMSG_GUILD_COMMAND_RESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GuildInfo final : public ServerPacket
    {
    public:
        std::string guildName;
        uint32 createdDay = 0;
        uint32 createdMonth = 0;
        uint32 createdYear = 0;
        uint32 memberCount = 0;
        uint32 accountCount = 0;

        explicit GuildInfo() : ServerPacket(SMSG_GUILD_INFO) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SaveGuildEmblemResult final : public ServerPacket
    {
    public:
        uint32 error = 0;

        explicit SaveGuildEmblemResult() : ServerPacket(MSG_SAVE_GUILD_EMBLEM) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GuildQueryResponse final : public ServerPacket
    {
    public:
        uint32 guildId = 0;
        std::string guildName;
        std::string rankNames[10]; // always 10 ranks
        int32 emblemStyle = 0;
        int32 emblemColor = 0;
        int32 borderStyle = 0;
        int32 borderColor = 0;
        int32 backgroundColor = 0;

        explicit GuildQueryResponse() : ServerPacket(SMSG_GUILD_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GuildEvent final : public ServerPacket
    {
    public:
        uint8 event = 0;
        std::vector<std::string> params;
        ObjectGuid affectedPlayerGuid;

        explicit GuildEvent() : ServerPacket(SMSG_GUILD_EVENT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct GuildRosterMember
    {
        ObjectGuid guid;
        uint8 presenceFlags = 0;     // offline = 0, online = GRF_ONLINE, GRF_AFK, GRF_DND
        std::string name;
        uint32 rankId = 0;
        uint8 level = 0;
        uint8 classId = 0;
        uint32 zoneId = 0;
        float lastOnlineTime = 0.0f; // time in days since last login (only for offline members)
        std::string publicNote;
        std::string officerNote;     // empty if viewer has no permission
    };

    class GuildRoster final : public ServerPacket
    {
    public:
        std::string motd;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        std::string guildInfo;
#endif
        std::vector<uint32> rankRights;
        std::vector<GuildRosterMember> rosterMembers;

        explicit GuildRoster() : ServerPacket(SMSG_GUILD_ROSTER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Guild

#endif // MANGOS_PACKETS_GUILD_H
