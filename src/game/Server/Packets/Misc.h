#ifndef MANGOS_PACKETS_MISC_H
#define MANGOS_PACKETS_MISC_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"
#include "nonstd/optional.hpp"
#include <string>
#include <vector>

namespace WorldPackets { namespace Misc
{
    class WorldTeleport final : public ClientPacket
    {
    public:
        uint32 timeMs;
        WorldLocation location;

        explicit WorldTeleport() : ClientPacket(CMSG_WORLD_TELEPORT), timeMs(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AddFriend final : public ClientPacket
    {
    public:
        std::string friendName;

        explicit AddFriend() : ClientPacket(CMSG_ADD_FRIEND) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class DelFriend final : public ClientPacket
    {
    public:
        ObjectGuid friendGuid;

        explicit DelFriend() : ClientPacket(CMSG_DEL_FRIEND) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AddIgnore final : public ClientPacket
    {
    public:
        std::string ignoreName;

        explicit AddIgnore() : ClientPacket(CMSG_ADD_IGNORE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class DelIgnore final : public ClientPacket
    {
    public:
        ObjectGuid ignoreGuid;

        explicit DelIgnore() : ClientPacket(CMSG_DEL_IGNORE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class StandStateChange final : public ClientPacket
    {
    public:
        uint32 animState = 0;

        explicit StandStateChange() : ClientPacket(CMSG_STANDSTATECHANGE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AreaTrigger final : public ClientPacket
    {
    public:
        uint32 triggerId = 0;

        explicit AreaTrigger() : ClientPacket(CMSG_AREATRIGGER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class Inspect final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit Inspect() : ClientPacket(CMSG_INSPECT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GameObjectUse final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit GameObjectUse() : ClientPacket(CMSG_GAMEOBJ_USE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class Emote final : public ClientPacket
    {
    public:
        uint32 emote = 0;

        explicit Emote() : ClientPacket(CMSG_EMOTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TextEmote final : public ClientPacket
    {
    public:
        uint32 textEmote = 0;
        uint32 emoteNum = 0;
        ObjectGuid guid;

        explicit TextEmote() : ClientPacket(CMSG_TEXT_EMOTE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetSelection final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit SetSelection() : ClientPacket(CMSG_SET_SELECTION) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetTarget final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit SetTarget() : ClientPacket(CMSG_SET_TARGET_OBSOLETE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };


    class FarSight final : public ClientPacket
    {
    public:
        uint8 op = 0;

        explicit FarSight() : ClientPacket(CMSG_FAR_SIGHT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TutorialFlag final : public ClientPacket
    {
    public:
        uint32 iFlag = 0;

        explicit TutorialFlag() : ClientPacket(CMSG_TUTORIAL_FLAG) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetActionButton final : public ClientPacket
    {
    public:
        uint8 button = 0;
        uint32 packetData = 0;

        explicit SetActionButton() : ClientPacket(CMSG_SET_ACTION_BUTTON) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class InspectHonorStats final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit InspectHonorStats() : ClientPacket(MSG_INSPECT_HONOR_STATS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetActiveMover final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit SetActiveMover() : ClientPacket(CMSG_SET_ACTIVE_MOVER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetFactionAtWar final : public ClientPacket
    {
    public:
        uint32 repListId = 0;
        uint8 flag = 0;

        explicit SetFactionAtWar() : ClientPacket(CMSG_SET_FACTION_ATWAR) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    class SetFactionInactive final : public ClientPacket
    {
    public:
        uint32 replistid = 0;
        uint8 inactive = 0;

        explicit SetFactionInactive() : ClientPacket(CMSG_SET_FACTION_INACTIVE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    class ZoneUpdate final : public ClientPacket
    {
    public:
        uint32 newZone = 0;

        explicit ZoneUpdate() : ClientPacket(CMSG_ZONEUPDATE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ReclaimCorpse final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit ReclaimCorpse() : ClientPacket(CMSG_RECLAIM_CORPSE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ChatIgnored final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit ChatIgnored() : ClientPacket(CMSG_CHAT_IGNORED) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ResurrectResponse final : public ClientPacket
    {
    public:
        ObjectGuid resurrectorGuid; // the guid of the player who rezzed me
        bool accept = false;

        explicit ResurrectResponse() : ClientPacket(CMSG_RESURRECT_RESPONSE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ItemTextQuery final : public ClientPacket
    {
    public:
        uint32 itemTextId = 0;
        uint32 mailId = 0;
        uint32 unk = 0;

        explicit ItemTextQuery() : ClientPacket(CMSG_ITEM_TEXT_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SummonResponse final : public ClientPacket
    {
    public:
        ObjectGuid summonerGuid;

        explicit SummonResponse() : ClientPacket(CMSG_SUMMON_RESPONSE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetActionBarToggles final : public ClientPacket
    {
    public:
        uint8 actionBar = 0;

        explicit SetActionBarToggles() : ClientPacket(CMSG_SET_ACTIONBAR_TOGGLES) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MeetingStoneJoin final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit MeetingStoneJoin() : ClientPacket(CMSG_MEETINGSTONE_JOIN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TeleportToUnit final : public ClientPacket
    {
    public:
        std::string playerName;

        explicit TeleportToUnit() : ClientPacket(CMSG_TELEPORT_TO_UNIT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class RequestAccountData final : public ClientPacket
    {
    public:
        uint32 type = 0;

        explicit RequestAccountData() : ClientPacket(CMSG_REQUEST_ACCOUNT_DATA) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class UpdateAccountData final : public ClientPacket
    {
    public:
        uint32             type = 0;
        uint32             decompressedSize = 0;
        std::vector<uint8> compressedData;

        explicit UpdateAccountData() : ClientPacket(CMSG_UPDATE_ACCOUNT_DATA) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    class SetWatchedFaction final : public ClientPacket
    {
    public:
        int32 repId = 0;

        explicit SetWatchedFaction() : ClientPacket(CMSG_SET_WATCHED_FACTION) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    class MoveSetRawPosition final : public ClientPacket
    {
    public:
        Position location;

        MoveSetRawPosition() : ClientPacket(OPCODE_WILL_BE_SET_IN_READ_FUNCTION) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TogglePvP final : public ClientPacket
    {
    public:
        nonstd::optional<bool> targetState;

        explicit TogglePvP() : ClientPacket(CMSG_TOGGLE_PVP) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class Who final : public ClientPacket
    {
    public:
        uint32                   levelMin = 0;
        uint32                   levelMax = 0;
        std::string              playerName;
        std::string              guildName;
        uint32                   raceMask = 0;
        uint32                   classMask = 0;
        std::vector<uint32>      zoneIds;
        std::vector<std::string> searchTerms;

        explicit Who() : ClientPacket(CMSG_WHO) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class Bug final : public ClientPacket
    {
    public:
        uint32      suggestion = 0;
        std::string content;
        std::string type;

        explicit Bug() : ClientPacket(CMSG_BUG) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
    class WardenData final : public ClientPacket
    {
    public:
        std::vector<uint8> data;

        explicit WardenData() : ClientPacket(CMSG_WARDEN_DATA) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    // --- Server Packets ---

    class LogoutComplete final : public ServerPacket
    {
    public:
        explicit LogoutComplete() : ServerPacket(SMSG_LOGOUT_COMPLETE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LogoutCancelAck final : public ServerPacket
    {
    public:
        explicit LogoutCancelAck() : ServerPacket(SMSG_LOGOUT_CANCEL_ACK) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class StandStateUpdate final : public ServerPacket
    {
    public:
        uint8 standState = 0;

        explicit StandStateUpdate() : ServerPacket(SMSG_STANDSTATE_UPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    class PlayTimeWarning final : public ServerPacket
    {
    public:
        uint32 flag = 0;
        int32 timeLeftInSeconds = 0;

        explicit PlayTimeWarning() : ServerPacket(SMSG_PLAY_TIME_WARNING) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class LogoutResponse final : public ServerPacket
    {
    public:
        uint32 reason = 0;
        uint8 instant = 0;

        explicit LogoutResponse() : ServerPacket(SMSG_LOGOUT_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PlayedTime final : public ServerPacket
    {
    public:
        uint32 totalPlayedTime = 0;
        uint32 levelPlayedTime = 0;

        explicit PlayedTime() : ServerPacket(SMSG_PLAYED_TIME) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class InspectResponse final : public ServerPacket
    {
    public:
        ObjectGuid guid;

        explicit InspectResponse() : ServerPacket(SMSG_INSPECT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class WhoisResponse final : public ServerPacket
    {
    public:
        std::string message; // max CString length allowed: 256

        explicit WhoisResponse() : ServerPacket(SMSG_WHOIS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class UpdateAccountDataResponse final : public ServerPacket
    {
    public:
        uint32 type = 0;
        uint32 decompressedLength = 0;
        std::vector<uint8> compressedData;

        explicit UpdateAccountDataResponse() : ServerPacket(SMSG_UPDATE_ACCOUNT_DATA) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class InspectHonorStatsResponse final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid;
        uint8 highestRank = 0;          // Highest Rank
        uint32 sessionKills = 0;        // Today Honorable and Dishonorable Kills
        uint16 yesterdayHK = 0;         // Yesterday Honorable Kills
        uint16 unknownOld1 = 0;         // Unknown (deprecated, yesterday dishonourable?)
        uint16 lastWeekHK = 0;          // Last Week Honorable Kills
        uint16 unknownOld2 = 0;         // Unknown (deprecated, last week dishonourable?)
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        uint16 thisWeekHK = 0;          // This Week Honorable kills
        uint16 unknownOld3 = 0;         // Unknown (deprecated, this week dishonourable?)
#endif
        uint32 lifetimeHK = 0;          // Lifetime Honorable Kills
        uint32 lifetimeDHK = 0;         // Lifetime Dishonorable Kills
        uint32 yesterdayHonor = 0;      // Yesterday Honor
        uint32 lastWeekHonor = 0;       // Last Week Honor
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        uint32 thisWeekHonor = 0;       // This Week Honor
#endif
        uint32 lastWeekRank = 0;        // Last Week Standing
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        uint8 rankBar = 0;              // Rank progress bar
#endif

        explicit InspectHonorStatsResponse() : ServerPacket(MSG_INSPECT_HONOR_STATS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    class WeatherUpdate final : public ServerPacket
    {
    public:
        uint32 weatherType = 0;
        float grade = 0.0f;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        uint32 soundId = 0;
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        bool instantChange = false;     // true = instant change, false = smooth change
#endif

        explicit WeatherUpdate() : ServerPacket(SMSG_WEATHER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class ServerMessage final : public ServerPacket
    {
    public:
        uint32 messageType = 0;
        std::string text;

        explicit ServerMessage() : ServerPacket(SMSG_SERVER_MESSAGE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class MeetingstoneJoinFailed final : public ServerPacket
    {
    public:
        uint8 reason = 0;

        explicit MeetingstoneJoinFailed() : ServerPacket(SMSG_MEETINGSTONE_JOINFAILED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class MeetingstoneSetQueue final : public ServerPacket
    {
    public:
        uint32 areaId = 0;

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_4_2
        uint64 idempotencyToken = 0; // Guess: Incrementing counter. Must change for every response. TODO: Maybe use ms timestamp to enforce a new id on every packet
#else
        uint8 status = 0;
#endif

        explicit MeetingstoneSetQueue() : ServerPacket(SMSG_MEETINGSTONE_SETQUEUE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Misc

#endif // MANGOS_PACKETS_MISC_H
