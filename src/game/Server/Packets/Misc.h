#ifndef MANGOS_PACKETS_MISC_H
#define MANGOS_PACKETS_MISC_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"
#include "nonstd/optional.hpp"
#include <string>
#include <vector>
#include <array>

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

    // --- Server Packets ---

    // SMSG_MEETINGSTONE_MEMBER_ADDED: notifies group members that a new player was added via LFG
    class MeetingstoneMemberAdded final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid; // guid of the player that was added

        explicit MeetingstoneMemberAdded() : ServerPacket(SMSG_MEETINGSTONE_MEMBER_ADDED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_MEETINGSTONE_IN_PROGRESS: empty body; sent periodically while the LFG queue is still searching
    class MeetingstoneInProgress final : public ServerPacket
    {
    public:
        explicit MeetingstoneInProgress() : ServerPacket(SMSG_MEETINGSTONE_IN_PROGRESS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_MEETINGSTONE_COMPLETE: empty body; sent when the LFG search completes successfully
    class MeetingstoneComplete final : public ServerPacket
    {
    public:
        explicit MeetingstoneComplete() : ServerPacket(SMSG_MEETINGSTONE_COMPLETE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

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

    class PvpCredit final : public ServerPacket
    {
    public:
        int32 honor = 0;          // Amount of honor gained
        ObjectGuid victimGuid;    // GUID of the killed unit (empty if no victim)
        int32 victimRank = 0;     // Rank of the victim (0 = no rank, 19 = racial leader)

        explicit PvpCredit() : ServerPacket(SMSG_PVP_CREDIT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct ForcedReactionEntry
    {
        uint32 factionId = 0;       // Faction ID (Faction.dbc)
        uint32 reputationRank = 0;  // Reputation rank
    };

    class SetForcedReactions final : public ServerPacket
    {
    public:
        std::vector<ForcedReactionEntry> forcedReactions;

        explicit SetForcedReactions() : ServerPacket(SMSG_SET_FORCED_REACTIONS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct FactionStandingEntry
    {
        uint32 reputationListId = 0; // Reputation list ID
        int32 standing = 0;          // Reputation standing
    };

    class SetFactionStanding final : public ServerPacket  // last check 2.4.0
    {
    public:
        std::vector<FactionStandingEntry> factionStandings;

        explicit SetFactionStanding() : ServerPacket(SMSG_SET_FACTION_STANDING) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct FactionInitEntry
    {
        uint8 flags = 0;    // Faction flags
        int32 standing = 0; // Reputation standing
    };

    class InitializeFactions final : public ServerPacket
    {
    public:
        static constexpr uint32 MAX_FACTION_COUNT = 64;
        std::array<FactionInitEntry, MAX_FACTION_COUNT> factions;

        explicit InitializeFactions() : ServerPacket(SMSG_INITIALIZE_FACTIONS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SetFactionVisible final : public ServerPacket
    {
    public:
        uint32 reputationListId = 0;

        explicit SetFactionVisible() : ServerPacket(SMSG_SET_FACTION_VISIBLE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PlayMusic final : public ServerPacket
    {
    public:
        uint32 musicId = 0;

        explicit PlayMusic() : ServerPacket(SMSG_PLAY_MUSIC) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PlaySound final : public ServerPacket
    {
    public:
        uint32 soundId = 0;

        explicit PlaySound() : ServerPacket(SMSG_PLAY_SOUND) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class Notification final : public ServerPacket
    {
    public:
        std::string message; // Notification message

        explicit Notification() : ServerPacket(SMSG_NOTIFICATION) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    /** Tell a client to invalidate all cached entries for a given player (like the name) */
    class InvalidatePlayer final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid;

        explicit InvalidatePlayer() : ServerPacket(SMSG_INVALIDATE_PLAYER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class DestroyObject final : public ServerPacket
    {
    public:
        ObjectGuid objectGuid; // guid of the object to destroy

        explicit DestroyObject() : ServerPacket(SMSG_DESTROY_OBJECT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AiReaction final : public ServerPacket
    {
    public:
        ObjectGuid unitGuid;
        uint32 reaction = 0; // AIReactionType enum value

        explicit AiReaction() : ServerPacket(SMSG_AI_REACTION) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ZoneUnderAttack final : public ServerPacket
    {
    public:
        uint32 areaId = 0; // area id that is under attack

        explicit ZoneUnderAttack() : ServerPacket(SMSG_ZONE_UNDER_ATTACK) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PlayObjectSound final : public ServerPacket
    {
    public:
        uint32 soundId = 0;
        ObjectGuid sourceGuid; // object that is playing the sound

        explicit PlayObjectSound() : ServerPacket(SMSG_PLAY_OBJECT_SOUND) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GameObjectSpawnAnim final : public ServerPacket
    {
    public:
        ObjectGuid gameObjectGuid;

        explicit GameObjectSpawnAnim() : ServerPacket(SMSG_GAMEOBJECT_SPAWN_ANIM) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GameObjectDespawnAnim final : public ServerPacket
    {
    public:
        ObjectGuid gameObjectGuid;

        explicit GameObjectDespawnAnim() : ServerPacket(SMSG_GAMEOBJECT_DESPAWN_ANIM) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class StopMirrorTimer final : public ServerPacket
    {
    public:
        uint32 timerType = 0; // mirror timer type to stop

        explicit StopMirrorTimer() : ServerPacket(SMSG_STOP_MIRROR_TIMER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // Note: Default UI handler for this is bugged, args don't match.
    // Use StartMirrorTimer (SMSG_START_MIRROR_TIMER) to avoid lua errors.
    class PauseMirrorTimer final : public ServerPacket
    {
    public:
        uint32 timerType = 0; // mirror timer type to pause/unpause
        bool paused = false;

        explicit PauseMirrorTimer() : ServerPacket(SMSG_PAUSE_MIRROR_TIMER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct TransferPendingTransportInfo
    {
        TransferPendingTransportInfo(uint32 transport, uint32 map) : transportEntry(transport), oldMapId(map) {};
        uint32 transportEntry = 0;
        uint32 oldMapId = 0;
    };

    class TransferPending final : public ServerPacket
    {
    public:
        uint32 mapId = 0;
        nonstd::optional<TransferPendingTransportInfo> transportInfo;

        explicit TransferPending() : ServerPacket(SMSG_TRANSFER_PENDING) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class NewWorld final : public ServerPacket
    {
    public:
        WorldLocation location;

        explicit NewWorld() : ServerPacket(SMSG_NEW_WORLD) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LogXpGain final : public ServerPacket
    {
    public:
        ObjectGuid victimGuid;   // empty if non-kill xp
        uint32 totalXp = 0;      // total xp given (including rested bonus)
        uint8 xpType = 0;        // 0=kill xp, 1=non-kill xp
        uint32 baseXp = 0;       // xp without rested bonus (only if kill xp)
        float groupBonus = 1.0f; // group bonus factor (1=none, 0=100% group bonus; only if kill xp)

        explicit LogXpGain() : ServerPacket(SMSG_LOG_XPGAIN) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LevelUpInfo final : public ServerPacket
    {
    public:
        uint32 level = 0;
        uint32 healthGain = 0;
        uint32 powerGains[5] = {}; // up to 5 powers
        uint32 statGains[5] = {};  // stat gains for STRENGTH..SPIRIT

        explicit LevelUpInfo() : ServerPacket(SMSG_LEVELUP_INFO) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class TriggerCinematic final : public ServerPacket
    {
    public:
        uint32 cinematicSequenceId = 0;

        explicit TriggerCinematic() : ServerPacket(SMSG_TRIGGER_CINEMATIC) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PlayerSkinned final : public ServerPacket
    {
    public:
        uint8 freeRepop = 0; // always 0 (whether player can repop for free)

        explicit PlayerSkinned() : ServerPacket(SMSG_PLAYER_SKINNED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_DURABILITY_DAMAGE_DEATH: empty body; sent when player loses durability on death
    class DurabilityDamageDeath final : public ServerPacket
    {
    public:
        explicit DurabilityDamageDeath() : ServerPacket(SMSG_DURABILITY_DAMAGE_DEATH) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    // SMSG_CANCEL_AUTO_REPEAT: empty body; tells client to cancel auto-repeat
    class CancelAutoRepeat final : public ServerPacket
    {
    public:
        explicit CancelAutoRepeat() : ServerPacket(SMSG_CANCEL_AUTO_REPEAT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ExplorationExperience final : public ServerPacket
    {
    public:
        uint32 areaId = 0;
        uint32 experience = 0;

        explicit ExplorationExperience() : ServerPacket(SMSG_EXPLORATION_EXPERIENCE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    class FactionAtWarChange final : public ServerPacket
    {
    public:
        uint32 reputationId = 0;
        uint8 flags = 0; // FACTION_FLAG_AT_WAR or 0 to clear

        explicit FactionAtWarChange() : ServerPacket(SMSG_SET_FACTION_ATWAR) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    class InstanceReset final : public ServerPacket
    {
    public:
        uint32 mapId = 0;

        explicit InstanceReset() : ServerPacket(SMSG_INSTANCE_RESET) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class InstanceResetFailed final : public ServerPacket
    {
    public:
        uint32 reason = 0; // InstanceResetFailReason enum value
        uint32 mapId = 0;

        explicit InstanceResetFailed() : ServerPacket(SMSG_INSTANCE_RESET_FAILED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class MountResult final : public ServerPacket
    {
    public:
        uint32 result = 0; // UnitMountResult enum value

        explicit MountResult() : ServerPacket(SMSG_MOUNTRESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class DismountResult final : public ServerPacket
    {
    public:
        uint32 result = 0; // UnitDismountResult enum value

        explicit DismountResult() : ServerPacket(SMSG_DISMOUNTRESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class RaidGroupOnly final : public ServerPacket
    {
    public:
        uint32 timer = 0;     // countdown timer; 0 means show error immediately
        uint32 errorCode = 0; // error used only when timer = 0

        explicit RaidGroupOnly() : ServerPacket(SMSG_RAID_GROUP_ONLY) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class SetRestStart final : public ServerPacket
    {
    public:
        uint32 restStateTime = 0; // rest state time (always 0 in original code)

        explicit SetRestStart() : ServerPacket(SMSG_SET_REST_START) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class BindpointUpdate final : public ServerPacket
    {
    public:
        WorldLocation location;
        uint32 areaId = 0;

        explicit BindpointUpdate() : ServerPacket(SMSG_BINDPOINTUPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PlayerBound final : public ServerPacket
    {
    public:
        ObjectGuid binderGuid;
        uint32 areaId = 0;

        explicit PlayerBound() : ServerPacket(SMSG_PLAYERBOUND) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LoginSetTimeSpeed final : public ServerPacket
    {
    public:
        uint32 gameTime = 0;
        float gameSpeedMinutesPerSecond = 0.0f; // game speed

        explicit LoginSetTimeSpeed() : ServerPacket(SMSG_LOGIN_SETTIMESPEED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class TransferAborted final : public ServerPacket
    {
    public:
        uint8 reason = 0; // transfer abort reason

        explicit TransferAborted() : ServerPacket(SMSG_TRANSFER_ABORTED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    class RaidInstanceMessage final : public ServerPacket
    {
    public:
        uint32 messageType = 0; // type of warning (RAID_INSTANCE_WELCOME, etc.)
        uint32 mapId = 0;
        uint32 resetTime = 0;   // time in seconds until reset

        explicit RaidInstanceMessage() : ServerPacket(SMSG_RAID_INSTANCE_MESSAGE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class SummonRequest final : public ServerPacket
    {
    public:
        ObjectGuid summonerGuid;
        uint32 zoneId = 0;           // summoner's zone
        uint32 autoDeclineDelay = 0; // time in ms before auto decline

        explicit SummonRequest() : ServerPacket(SMSG_SUMMON_REQUEST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class CorpseReclaimDelay final : public ServerPacket
    {
    public:
        uint32 delayMs = 0; // delay in milliseconds before corpse can be reclaimed

        explicit CorpseReclaimDelay() : ServerPacket(SMSG_CORPSE_RECLAIM_DELAY) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    class UpdateInstanceOwnership final : public ServerPacket
    {
    public:
        uint32 hasBeenSaved = 0; // whether the player has any permanent instance binds

        explicit UpdateInstanceOwnership() : ServerPacket(SMSG_UPDATE_INSTANCE_OWNERSHIP) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class UpdateLastInstance final : public ServerPacket
    {
    public:
        uint32 mapId = 0; // map id of the last visited instance

        explicit UpdateLastInstance() : ServerPacket(SMSG_UPDATE_LAST_INSTANCE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    // SMSG_EMOTE: sent to broadcast a unit's emote animation to nearby clients
    class EmoteNotify final : public ServerPacket
    {
    public:
        uint32 emoteId = 0;
        ObjectGuid unitGuid;

        explicit EmoteNotify() : ServerPacket(SMSG_EMOTE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    class ClientControlUpdate final : public ServerPacket
    {
    public:
        ObjectGuid moverGuid; // guid of the unit the player should control
        uint8 allowMove = 0;  // whether movement is allowed

        explicit ClientControlUpdate() : ServerPacket(SMSG_CLIENT_CONTROL_UPDATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
#endif

    class UpdateWorldState final : public ServerPacket
    {
    public:
        uint32 field = 0;  // world state field id (will be uint16 on older clients)
        uint32 value = 0;  // new value (will be uint16 on older clients)

        explicit UpdateWorldState() : ServerPacket(SMSG_UPDATE_WORLD_STATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Misc

#endif // MANGOS_PACKETS_MISC_H
