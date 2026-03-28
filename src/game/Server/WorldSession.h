/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef __WORLDSESSION_H
#define __WORLDSESSION_H

#include "Common.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"
#include "AuctionHouseMgr.h"
#include "ItemDefines.h"
#include "GossipDef.h"
#include "Chat/AbstractPlayer.h"
#include "SniffFile.h"
#include "ClientDefines.h"
#include "Crypto/BigNumber.h"
#include "AccountData.h"
#include "PacketProcessing.h"
#include "UpdateData.h"
#include "LockedQueue.h"
#include "Packets/AuctionHouse.h"
#include "Packets/Battleground.h"
#include "Packets/Channel.h"
#include "Packets/Character.h"
#include "Packets/Chat.h"
#include "Packets/Combat.h"
#include "Packets/Duel.h"
#include "Packets/GmTicket.h"
#include "Packets/Group.h"
#include "Packets/Guild.h"
#include "Packets/Item.h"
#include "Packets/Loot.h"
#include "Packets/Mail.h"
#include "Packets/Misc.h"
#include "Packets/Movement.h"
#include "Packets/Npc.h"
#include "Packets/Pet.h"
#include "Packets/Petition.h"
#include "Packets/Query.h"
#include "Packets/Quest.h"
#include "Packets/Skill.h"
#include "Packets/Spell.h"
#include "Packets/Taxi.h"
#include "Packets/Trade.h"

struct ItemPrototype;
struct AuctionEntry;
struct AuctionHouseEntry;

class ObjectGuid;
class Creature;
class Item;
class Object;
class Player;
class Unit;
class WorldPacket;
class WorldSocket;
class QueryResult;
class LoginQueryHolder;
class CharacterHandler;
class MovementInfo;
class WorldSession;
class Warden;
class MovementAnticheat;
class BigNumber;
class MasterPlayer;

struct OpcodeHandler;
struct PlayerBotEntry;

enum PartyOperation
{
    PARTY_OP_INVITE = 0,
    PARTY_OP_LEAVE = 2,
};

enum PartyResult
{
    ERR_PARTY_RESULT_OK                 = 0,
    ERR_BAD_PLAYER_NAME_S               = 1,    // "Cannot find '%s'."
    ERR_TARGET_NOT_IN_GROUP_S           = 2,    // "%s is not in your party."
    ERR_GROUP_FULL                      = 3,    // "Your party is full."
    ERR_ALREADY_IN_GROUP_S              = 4,    // "%s is already in a group."
    ERR_NOT_IN_GROUP                    = 5,    // "You aren't in a party."
    ERR_NOT_LEADER                      = 6,    // "You are not the party leader."
    ERR_PLAYER_WRONG_FACTION            = 7,
    ERR_IGNORING_YOU_S                  = 8,    // "%s is ignoring you."
    ERR_INTERNAL_BATTLEGROUND           = 10,   // Does not exist client-side
};

#define ACCOUNT_TUTORIALS_COUNT 8

enum TutorialDataState
{
    TUTORIALDATA_UNCHANGED = 0,
    TUTORIALDATA_CHANGED   = 1,
    TUTORIALDATA_NEW       = 2
};

enum BillingPlanFlags
{
    BILLING_FLAG_NONE         = 0x00,
    BILLING_FLAG_UNUSED       = 0x01,
    BILLING_FLAG_RECURRING    = 0x02,
    BILLING_FLAG_TRIAL        = 0x04,
    BILLING_FLAG_IGR          = 0x08,
    BILLING_FLAG_USAGE        = 0x10,
    BILLING_FLAG_TIME_MIXTURE = 0x20,
    BILLING_FLAG_RESTRICTED   = 0x40,
    BILLING_FLAG_ENABLE_CAIS  = 0x80
};

enum PlayTimeLimit : uint32
{
    PLAY_TIME_LIMIT_APPROACHING_PARTIAL = 2 * HOUR + 30 * MINUTE,
    PLAY_TIME_LIMIT_PARTIAL = 3 * HOUR,
    PLAY_TIME_LIMIT_APPROCHING_FULL = 4 * HOUR + 30 * MINUTE,
    PLAY_TIME_LIMIT_FULL = 5 * HOUR,
};

enum PlayTimeFlag : uint32
{
    PTF_APPROACHING_PARTIAL_PLAY_TIME = 0x1000,
    PTF_APPROACHING_NO_PLAY_TIME = 0x2000,
    PTF_UNHEALTHY_TIME = 0x80000000,
};

enum AntifloodOpcodeExecutionSpeed
{
    FLOOD_TOTAL_PACKETS = 0,
    FLOOD_SLOW_OPCODES,
    FLOOD_VERY_SLOW_OPCODES,
    FLOOD_MAX_OPCODES_TYPE,
};

enum AccountFlags
{
    ACCOUNT_FLAG_MUTED_FROM_PUBLIC_CHANNELS     = 0x1,
};

//class to deal with packet processing
//allows to determine if next packet is safe to be processed
class PacketFilter
{
    public:
        explicit PacketFilter(WorldSession* pSession) : m_pSession(pSession), m_processLogout(false), m_processType(PACKET_PROCESS_MAX_TYPE) {}
        virtual ~PacketFilter() {}

        virtual bool Process(std::unique_ptr<WorldPacket> const&) { return true; }
        inline bool ProcessLogout() const { return m_processLogout; }
        inline PacketProcessing PacketProcessType() const { return m_processType; }
        inline void SetProcessType(PacketProcessing t) { m_processType = t; }

    protected:
        WorldSession* const m_pSession;
        bool m_processLogout;
        PacketProcessing m_processType;
};
//process only thread-safe packets in Map::Update()
class MapSessionFilter : public PacketFilter
{
    public:
        explicit MapSessionFilter(WorldSession* pSession) : PacketFilter(pSession)
        {
            m_processLogout = false;
            m_processType = PACKET_PROCESS_MAP;
        }
        ~MapSessionFilter() override {}

        bool Process(std::unique_ptr<WorldPacket> const& packet) override;
};

//class used to filer only thread-unsafe packets from queue
//in order to update only be used in World::UpdateSessions()
class WorldSessionFilter : public PacketFilter
{
    public:
        explicit WorldSessionFilter(WorldSession* pSession) : PacketFilter(pSession)
        {
            m_processLogout = true;
            m_processType = PACKET_PROCESS_WORLD;
        }
        ~WorldSessionFilter() override {}
};

// Player session in the World
class WorldSession
{
    friend class CharacterHandler;
    public:
        WorldSession(uint32 id, std::shared_ptr<WorldSocket> sock, AccountTypes sec, time_t mute_time, LocaleConstant locale);
        ~WorldSession();

        uint32 GetGUID() const { return m_guid; }
        AccountTypes GetSecurity() const { return m_security; }
        uint32 GetAccountId() const { return m_accountId; }
        std::string GetUsername() const { return m_username; }
        void SetUsername(std::string const& s) { m_username = s; }
        uint32 GetLatency() const { return m_latency; }
        void SetLatency(uint32 latency) { m_latency = latency; }
        uint32 GetGameBuild() const { return m_gameBuild; }
        void SetGameBuild(uint32 v) { m_gameBuild = v; }
        ClientOSType GetOS() const { return m_clientOS; }
        void SetOS(ClientOSType os) { m_clientOS = os; }
        ClientPlatformType GetPlatform() const { return m_clientPlatform; }
        void SetPlatform(ClientPlatformType platform) { m_clientPlatform = platform; }
        uint32 GetDialogStatus(Player* pPlayer, Object* questgiver, uint32 defstatus);
        uint32 GetAccountMaxLevel() const { return m_characterMaxLevel; }
        void SetAccountFlags(uint32 f) { m_accountFlags = f; }
        uint32 GetAccountFlags() const { return m_accountFlags; }
        void SetVerifiedEmail(bool verified) { m_verifiedEmail = verified; }
        bool HasVerifiedEmail() const { return m_verifiedEmail; }
        bool HasTrialRestrictions() const;
        Player* GetPlayer() const { return _player; }
        char const* GetPlayerName() const;
        void SetSecurity(AccountTypes security) { m_security = security; }
        /// Might return "<BOT>" if player bot
        /// TODO rename me to GetRemoteIpString() when all the commits for native branch are done (otherwise too many files will be touched)
        std::string const& GetRemoteAddress() const { return m_remoteIpAddress; }
        void SetPlayer(Player* plr) { _player = plr; }
        void SetMasterPlayer(MasterPlayer* plr) { m_masterPlayer = plr; }
        void LoginPlayer(ObjectGuid playerGuid);
        std::shared_ptr<WorldSocket> GetSocket() { return m_socket; }

        // Session in auth.queue currently
        void SetInQueue(bool state) { m_inQueue = state; }

        // Player online / socket offline system
        void SetDisconnectedSession(); // Remove from World::m_Session. Used when an account gets disconnected.
        bool UpdateDisconnected(uint32 diff);
        bool IsConnected() const { return m_connected; }
        void KickDisconnectedFromWorld() { m_disconnectTimer = 0; }

        bool PlayerLoading() const { return m_playerLoading; }
        bool PlayerLogout() const { return m_playerLogout; }
        bool PlayerLogoutWithSave() const { return m_playerLogout && m_playerSave; }

        bool CharacterScreenIdleKick(uint32 diff);
        uint32 m_idleTime;

        // Played time limit
        time_t GetCreateTime() const { return m_createTime; }
        time_t GetConsecutivePlayTime(time_t now) const { return (now - m_createTime) + m_previousPlayTime; }
        time_t GetPreviousPlayedTime() const { return m_previousPlayTime; }
        void SetPreviousPlayedTime(time_t playedTime) { m_previousPlayTime = playedTime; }
        void CheckPlayedTimeLimit(time_t now);
        void SendPlayTimeWarning(PlayTimeFlag flag, int32 timeLeftInSeconds);

        // Is the user engaged in a log out process?
        bool IsLogingOut() const { return m_logoutTime || m_playerLogout; }

        // Engage the logout process for the user
        void LogoutRequest(time_t requestTime)
        {
            m_logoutTime = requestTime;
        }

        // Is logout cooldown expired?
        bool ShouldLogOut(time_t currTime) const
        {
            return (m_logoutTime > 0 && currTime >= m_logoutTime + 20);
        }

        void LogoutPlayer(bool Save);
        void KickPlayer();

        // Session can be safely deleted if returns false
        bool ForcePlayerLogoutDelay();

        void DoLootRelease(ObjectGuid lguid);

        // Account mute time
        time_t m_muteTime;
        time_t m_lastPubChannelMsgTime;

        // Locales
        LocaleConstant GetSessionDbcLocale() const { return m_sessionDbcLocale; }
        int GetSessionDbLocaleIndex() const { return m_sessionDbLocaleIndex; }
        char const* GetMangosString(int32 entry) const;

        // Public chat cooldown restriction functionality
        // Intentionally session-based to avoid login/logout hijinks
        time_t GetLastPubChanMsgTime() const { return m_lastPubChannelMsgTime; }
        void SetLastPubChanMsgTime(time_t time) { m_lastPubChannelMsgTime = time; }

        // Bot system
        PlayerBotEntry* GetBot() const { return m_bot.get(); }
        void SetBot(std::shared_ptr<PlayerBotEntry> const& b) { m_bot = b; }

        // Warden / Anticheat
        void InitWarden();
        void SetSessionKey(BigNumber const& sessionKey) { m_sessionKey = sessionKey; }
        Warden* GetWarden() const { return m_warden; }
        void InitCheatData(Player* pPlayer);
        MovementAnticheat* GetCheatData();
        void ProcessAnticheatAction(char const* detector, char const* reason, uint32 cheatAction, uint32 banSeconds = 0 /* Perm ban */);
        uint32 GetFingerprint() const { return 0; } // TODO
        void CleanupFingerprintHistory() {} // TODO
        bool HasUsedClickToMove() const;

        // Movement
        Unit* GetMoverFromGuid(ObjectGuid const& guid) const;
        ObjectGuid const& GetClientMoverGuid() const { return m_clientMoverGuid; }
        bool HasClientMovementControl() const { return !m_clientMoverGuid.IsEmpty(); }
        void RejectMovementPacketsFor(uint32 ms);

        void SetReceivedWhoRequest(bool v) { m_who_recvd = v; }
        bool ReceivedWhoRequest() const { return m_who_recvd; }
        bool m_who_recvd;

        void SetReceivedAHListRequest(bool v) { m_ah_list_recvd = v; }
        bool ReceivedAHListRequest() const { return m_ah_list_recvd; }
        bool m_ah_list_recvd;

        bool Update(PacketFilter& updater);
        void QueuePacket(std::unique_ptr<WorldPacket> new_packet);
        bool CanProcessPackets() const; // Returns true iif we can process packets (ie logged in Player, not a bot, etc ...
        void ProcessPackets(PacketFilter& updater);
        bool AllowPacket(uint16 opcode);
        void ClearIncomingPacketsByType(PacketProcessing type);
        inline bool HasRecentPacket(PacketProcessing type) const { return m_receivedPacketType[type]; }

        void StartSniffing()
        {
            if (!m_sniffFile)
            {
                std::string fileName = "packet_log_" + GetUsername() + "_" + std::to_string(time(nullptr)) + ".pkt";
                m_sniffFile = std::make_unique<SniffFile>(fileName.c_str());
                m_sniffFile->WriteHeader();
            }
        }
        void StopSniffing()
        {
            if (m_sniffFile)
                m_sniffFile.reset();
        }

    private:
        void SendPacketImpl(WorldPacket const* packet);
        void VerifyPacketWasCorrectlyRead(WorldPacket const& recvPacket, ClientPacket const& clientPacket) const;

    public:
        void SendPacket(WorldPacket const* packet);
        void SendMovementPacket(WorldPacket const* packet);
        void SendNotification(char const* format, ...) ATTR_PRINTF(2, 3);
        void SendNotification(int32 string_id, ...);
        void SendPetNameInvalid(uint32 error, std::string const& name);
        void SendPartyResult(PartyOperation operation, std::string const& member, PartyResult res);
        void SendAreaTriggerMessage(char const* Text, ...) ATTR_PRINTF(2, 3);
        void SendQueryTimeResponse();

        // Handle the authentication waiting queue (to be completed)
        void SendAuthWaitQue(uint32 position);

        void SendNameQueryOpcode(Player* p);
        void SendNameQueryOpcodeFromDB(ObjectGuid guid);
        static void SendNameQueryOpcodeFromDBCallBack(QueryResult* result, uint32 accountId);

        // Trainer
        void SendTrainerList(ObjectGuid guid);
        void SendTrainerList(ObjectGuid guid, std::string const& strTitle);
        void SendTrainingSuccess(ObjectGuid guid, uint32 spellId);
        void SendTrainingFailure(ObjectGuid guid, uint32 serviceId, uint32 errorCode);

        // NPC
        void SendListInventory(ObjectGuid guid, uint8 menu_type = VENDOR_MENU_ALL);
        bool CheckBanker(ObjectGuid guid);
        void SendShowBank(ObjectGuid guid);
        void SendTabardVendorActivate(ObjectGuid guid);
        void SendSpiritResurrect();
        void SendBindPoint(Creature* npc);
        void SendAttackStop(Unit const* enemy);

        // Mail
        bool CheckMailBox(ObjectGuid guid);
        void SendMailResult(uint32 mailId, MailResponseType mailAction, MailResponseResult mailError, uint32 equipError = 0, uint32 item_guid = 0, uint32 item_count = 0);
        void SendNewMail();

        // Trade
        void SendTradeStatus(TradeStatus status);
        void SendUpdateTrade(bool trader_state = true);
        void SendCancelTrade(TradeStatus status);

        // Pet
        void SendPetNameQuery(ObjectGuid guid, uint32 petNumber);
        void SendStablePet(ObjectGuid guid);
        void SendStableResult(uint8 res);
        bool CheckStableMaster(ObjectGuid guid);

        // Account Data
        AccountData* GetAccountData(NewAccountData::AccountDataType type) { return &m_accountData[type]; }
        void SetAccountData(NewAccountData::AccountDataType type, const std::string& data);
        void SendAccountDataTimes();
        void LoadGlobalAccountData();
        void LoadAccountData(std::unique_ptr<QueryResult> result, uint32 mask);

        void LoadTutorialsData();
        void SendTutorialsData();
        void SaveTutorialsData();
        uint32 GetTutorialInt(uint32 intId) const;
        void SetTutorialInt(uint32 intId, uint32 value)
        {
            if (m_tutorials[intId] != value)
            {
                m_tutorials[intId] = value;
                if (m_tutorialState == TUTORIALDATA_UNCHANGED)
                    m_tutorialState = TUTORIALDATA_CHANGED;
            }
        }

        // Auction
        void SendAuctionHello(Unit* unit);
        void SendAuctionCommandResult(AuctionEntry* auc, AuctionAction Action, AuctionError ErrorCode, InventoryResult invError = EQUIP_ERR_OK);
        void SendAuctionBidderNotification(AuctionEntry* auction, bool won);
        void SendAuctionOwnerNotification(AuctionEntry* auction, bool sold);
        void SendAuctionRemovedNotification(AuctionEntry* auction);
        void SendAuctionOutbiddedMail(AuctionEntry* auction);
        void SendAuctionCancelledToBidderMail(AuctionEntry* auction);
        AuctionHouseEntry const* GetCheckedAuctionHouseForAuctioneer(ObjectGuid guid);

        // Item Enchantment
        void SendItemEnchantTimeUpdate(ObjectGuid playerGuid, ObjectGuid itemGuid, uint32 slot, uint32 duration);

        // Taxi
        void SendTaxiStatus(ObjectGuid guid);
        void SendTaxiMenu(Creature* unit);
        void SendDoFlight(uint32 mountDisplayId, uint32 path, uint32 pathNode = 0);
        bool SendLearnNewTaxiNode(Creature* unit);

        // Guild Team
        void SendGuildCommandResult(uint32 typecmd, std::string const& str, uint32 cmdresult);
        void SendPetitionShowList(ObjectGuid guid);
        void SendSaveGuildEmblem(uint32 msg);

        // Battleground
        void SendBattleGroundJoinError(uint8 err);
        void SendBattleGroundList(ObjectGuid guid, BattleGroundTypeId bgTypeId);

        // Meetingstone
        void SendMeetingstoneFailed(uint8 status);
        void SendMeetingstoneSetqueue(uint32 areaid, uint8 status);

        // Group
        void BuildPartyMemberStatsChangedPacket(Player* player, WorldPacket* data);
        void BuildPartyMemberStatsPacket(Player* player, WorldPacket* data, uint32 updateMask, bool sendAllAuras);

    public:                                                 // opcodes handlers
        template<typename TClientPacket, void (WorldSession::*THandler)(TClientPacket const& packet)>
        void Handle_Generic(WorldPacket& recvPacket)
        {
            auto packet = TClientPacket();
            packet.ReadFromWorldPacket(recvPacket);
            VerifyPacketWasCorrectlyRead(recvPacket, packet);
            (this->*THandler)(packet);
        }

        void Handle_NULL(WorldPacket& recvPacket);          // not used
        void Handle_EarlyProccess(WorldPacket& recvPacket);// just mark packets processed in WorldSocket::OnRead
        void Handle_ServerSide(WorldPacket& recvPacket);    // sever side only, can't be accepted from client

        void HandleCharEnumOpcode(NullClientPacket const& packet);
        void HandleCharCreateOpcode(WorldPackets::Character::CharCreate const& packet);
        void HandleCharDeleteOpcode(WorldPackets::Character::CharDelete const& packet);
        void HandlePlayerLoginOpcode(WorldPackets::Character::PlayerLogin const& packet);
        void HandleCharEnum(std::unique_ptr<QueryResult> result);
        void HandlePlayerLogin(LoginQueryHolder* holder);
        void HandlePlayedTime(NullClientPacket const& packet);

        // Movement
        void HandleMoveRootAck(WorldPackets::Movement::MoveRootAck const& packet);
        void HandleMoveKnockBackAck(WorldPackets::Movement::MoveKnockBackAck const& packet);
        void HandleMoveTeleportAckOpcode(WorldPackets::Movement::MoveTeleportAck const& packet);
        void HandleForceSpeedChangeAckOpcodes(WorldPackets::Movement::MoveSpeedAck const& packet);
        void HandleMoveWorldportAckOpcode(NullClientPacket const& packet);
        void HandleMoveWorldportAck();                // for server-side calls
        void HandleMovementOpcodes(WorldPackets::Movement::MovementPacket const& packet);
        void HandleSetActiveMoverOpcode(WorldPackets::Misc::SetActiveMover const& packet);
        void HandleMoveNotActiveMoverOpcode(WorldPackets::Movement::MoveNotActiveMover const& packet);
        void HandleMoveTimeSkippedOpcode(WorldPackets::Movement::MoveTimeSkipped const& packet);
        void HandleMovementFlagChangeToggleAck(WorldPackets::Movement::MoveFlagChangeAck const& packet);
        void HandleMoveSplineDoneOpcode(WorldPackets::Movement::MoveSplineDone const& packet);
        void HandleMoveSetRawPosition(WorldPackets::Misc::MoveSetRawPosition const& packet);
        void HandleWorldTeleportOpcode(WorldPackets::Misc::WorldTeleport const& packet);
        void HandleMountSpecialAnimOpcode(NullClientPacket const& packet);
        void HandleTeleportToUnitOpcode(WorldPackets::Misc::TeleportToUnit const& packet);

        void HandleInspectOpcode(WorldPackets::Misc::Inspect const& packet);
        void HandleInspectHonorStatsOpcode(WorldPackets::Misc::InspectHonorStats const& packet);
        void HandleShowingHelmOpcode(NullClientPacket const& packet);
        void HandleShowingCloakOpcode(NullClientPacket const& packet);
        void HandleRepairItemOpcode(WorldPackets::Npc::RepairItem const& packet);

        void HandlePingOpcode(WorldPacket& recvPacket);
        void HandleAuthSessionOpcode(WorldPacket& recvPacket);
        void HandleRepopRequestOpcode(NullClientPacket const& packet);
        void HandleAutostoreLootItemOpcode(WorldPackets::Loot::AutoStoreLootItem const& packet);
        void HandleLootMoneyOpcode(NullClientPacket const& packet);
        void HandleLootOpcode(WorldPackets::Loot::LootUnit const& packet);
        void HandleLootReleaseOpcode(WorldPackets::Loot::LootRelease const& packet);
        void HandleLootMasterGiveOpcode(WorldPackets::Loot::LootMasterGive const& packet);
        void HandleWhoOpcode(WorldPackets::Misc::Who const& packet);
        void HandleLFGOpcode(NullClientPacket const& packet);
        void HandleLogoutRequestOpcode(NullClientPacket const& packet);
        void HandlePlayerLogoutOpcode(NullClientPacket const& packet);
        void HandleLogoutCancelOpcode(NullClientPacket const& packet);
        void HandleGMTicketGetTicketOpcode(NullClientPacket const& packet);
        void HandleGMTicketCreateOpcode(WorldPackets::GmTicket::GmTicketCreate const& packet);
        void HandleGMTicketSystemStatusOpcode(NullClientPacket const& packet);

        void HandleGMTicketDeleteTicketOpcode(NullClientPacket const& packet);
        void HandleGMTicketUpdateTextOpcode(WorldPackets::GmTicket::GmTicketUpdateText const& packet);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        void HandleGMSurveySubmitOpcode(WorldPackets::GmTicket::GMSurveySubmit const& packet);
#endif

        void HandleTogglePvP(WorldPackets::Misc::TogglePvP const& packet);
        void HandleZoneUpdateOpcode(WorldPackets::Misc::ZoneUpdate const& packet);
        void HandleSetSelectionOpcode(WorldPackets::Misc::SetSelection const& packet);
        void HandleStandStateChangeOpcode(WorldPackets::Misc::StandStateChange const& packet);
        void HandleEmoteOpcode(WorldPackets::Misc::Emote const& packet);
        void HandleFriendListOpcode(NullClientPacket const& packet);
        void HandleAddFriendOpcode(WorldPackets::Misc::AddFriend const& packet);
        void HandleDelFriendOpcode(WorldPackets::Misc::DelFriend const& packet);
        void HandleAddIgnoreOpcode(WorldPackets::Misc::AddIgnore const& packet);
        void HandleDelIgnoreOpcode(WorldPackets::Misc::DelIgnore const& packet);
        void HandleBugOpcode(WorldPackets::Misc::Bug const& packet);
        void HandleSetAmmoOpcode(WorldPackets::Item::SetAmmo const& packet);
        void HandleItemNameQueryOpcode(WorldPackets::Query::ItemNameQuery const& packet);

        void HandleAreaTriggerOpcode(WorldPackets::Misc::AreaTrigger const& packet);
        void HandleSetFactionAtWarOpcode(WorldPackets::Misc::SetFactionAtWar const& packet);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        void HandleSetWatchedFactionOpcode(WorldPackets::Misc::SetWatchedFaction const& packet);
        void HandleSetFactionInactiveOpcode(WorldPackets::Misc::SetFactionInactive const& packet);
#endif

        void HandleUpdateAccountData(WorldPackets::Misc::UpdateAccountData const& packet);
        void HandleRequestAccountData(WorldPackets::Misc::RequestAccountData const& packet);
        void HandleSetActionButtonOpcode(WorldPackets::Misc::SetActionButton const& packet);

        void HandleGameObjectUseOpcode(WorldPackets::Misc::GameObjectUse const& packet);
        void HandleMeetingStoneJoinOpcode(WorldPackets::Misc::MeetingStoneJoin const& packet);
        void HandleMeetingStoneLeaveOpcode(NullClientPacket const& packet);
        void HandleMeetingStoneInfoOpcode(NullClientPacket const& packet);

        void HandleQueryPlayerNameOpcode(WorldPackets::Query::QueryPlayerName const& packet);
        void HandleQueryTimeOpcode(NullClientPacket const& packet);
        void HandleCreatureQueryOpcode(WorldPackets::Query::QueryCreature const& packet);
        void HandleGameObjectQueryOpcode(WorldPackets::Query::QueryGameObject const& packet);

        void HandleRequestRaidInfoOpcode(NullClientPacket const& packet);
        void HandleGroupInviteOpcode(WorldPackets::Group::GroupInvite const& packet);
        void HandleGroupAcceptOpcode(NullClientPacket const& packet);
        void HandleGroupDeclineOpcode(NullClientPacket const& packet);
        void HandleGroupUninviteOpcode(WorldPackets::Group::GroupUninvite const& packet);
        void HandleGroupUninviteGuidOpcode(WorldPackets::Group::GroupUninviteGuid const& packet);
        void HandleGroupSetLeaderOpcode(WorldPackets::Group::GroupSetLeader const& packet);
        void HandleGroupDisbandOpcode(NullClientPacket const& packet);
        void HandleLootMethodOpcode(WorldPackets::Group::LootMethod const& packet);
        void HandleLootRoll(WorldPackets::Loot::LootRoll const& packet);
        void HandleRequestPartyMemberStatsOpcode(WorldPackets::Group::RequestPartyMemberStats const& packet);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        void HandleRaidTargetUpdateOpcode(WorldPackets::Group::RaidTargetUpdate const& packet);
        void HandleRaidReadyCheckOpcode(WorldPackets::Group::RaidReadyCheck const& packet);
#endif
        void HandleGroupRaidConvertOpcode(NullClientPacket const& packet);
        void HandleGroupChangeSubGroupOpcode(WorldPackets::Group::GroupChangeSubGroup const& packet);
        void HandleGroupSwapSubGroupOpcode(WorldPackets::Group::GroupSwapSubGroup const& packet);
        void HandleGroupAssistantLeaderOpcode(WorldPackets::Group::GroupAssistantLeader const& packet);

        void HandlePetitionBuyOpcode(WorldPackets::Petition::PetitionBuy const& packet);
        void HandlePetitionShowSignOpcode(WorldPackets::Petition::PetitionShowSignatures const& packet);
        void HandlePetitionQueryOpcode(WorldPackets::Petition::QueryPetition const& packet);
        void HandlePetitionRenameOpcode(WorldPackets::Petition::PetitionRename const& packet);
        void HandlePetitionSignOpcode(WorldPackets::Petition::PetitionSign const& packet);
        void HandlePetitionDeclineOpcode(WorldPackets::Petition::PetitionDecline const& packet);
        void HandleOfferPetitionOpcode(WorldPackets::Petition::OfferPetition const& packet);
        void HandleTurnInPetitionOpcode(WorldPackets::Petition::TurnInPetition const& packet);

        void HandleGuildQueryOpcode(WorldPackets::Guild::GuildQuery const& packet);
        void HandleGuildCreateOpcode(WorldPackets::Guild::GuildCreate const& packet);
        void HandleGuildInviteOpcode(WorldPackets::Guild::GuildInvite const& packet);
        void HandleGuildRemoveOpcode(WorldPackets::Guild::GuildRemove const& packet);
        void HandleGuildAcceptOpcode(NullClientPacket const& packet);
        void HandleGuildDeclineOpcode(NullClientPacket const& packet);
        void HandleGuildInfoOpcode(NullClientPacket const& packet);
        void HandleGuildRosterOpcode(NullClientPacket const& packet);
        void HandleGuildPromoteOpcode(WorldPackets::Guild::GuildPromote const& packet);
        void HandleGuildDemoteOpcode(WorldPackets::Guild::GuildDemote const& packet);
        void HandleGuildLeaveOpcode(NullClientPacket const& packet);
        void HandleGuildDisbandOpcode(NullClientPacket const& packet);
        void HandleGuildLeaderOpcode(WorldPackets::Guild::GuildLeader const& packet);
        void HandleGuildMOTDOpcode(WorldPackets::Guild::GuildMOTD const& packet);
        void HandleGuildSetPublicNoteOpcode(WorldPackets::Guild::GuildSetPublicNote const& packet);
        void HandleGuildSetOfficerNoteOpcode(WorldPackets::Guild::GuildSetOfficerNote const& packet);
        void HandleGuildRankOpcode(WorldPackets::Guild::GuildRank const& packet);
        void HandleGuildAddRankOpcode(WorldPackets::Guild::GuildAddRank const& packet);
        void HandleGuildDelRankOpcode(NullClientPacket const& packet);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        void HandleGuildChangeInfoTextOpcode(WorldPackets::Guild::GuildChangeInfoText const& packet);
#endif
        void HandleSaveGuildEmblemOpcode(WorldPackets::Guild::SaveGuildEmblem const& packet);

        void HandleTaxiNodeStatusQueryOpcode(WorldPackets::Taxi::TaxiNodeStatusQuery const& packet);
        void HandleTaxiQueryAvailableNodes(WorldPackets::Taxi::TaxiQueryAvailableNodes const& packet);
        void HandleActivateTaxiOpcode(WorldPackets::Taxi::ActivateTaxi const& packet);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        void HandleActivateTaxiExpressOpcode(WorldPackets::Taxi::ActivateTaxiExpress const& packet);
#endif

        void HandleTabardVendorActivateOpcode(WorldPackets::Npc::TabardVendorActivate const& packet);
        void HandleBankerActivateOpcode(WorldPackets::Npc::BankerActivate const& packet);
        void HandleBuyBankSlotOpcode(WorldPackets::Item::BuyBankSlot const& packet);
        void HandleTrainerListOpcode(WorldPackets::Npc::TrainerList const& packet);
        void HandleTrainerBuySpellOpcode(WorldPackets::Npc::TrainerBuySpell const& packet);
        void HandlePetitionShowListOpcode(WorldPackets::Petition::PetitionShow const& packet);
        void HandleGossipHelloOpcode(WorldPackets::Npc::GossipHello const& packet);
        void HandleGossipSelectOptionOpcode(WorldPackets::Npc::GossipSelectOption const& packet);
        void HandleSpiritHealerActivateOpcode(WorldPackets::Npc::SpiritHealerActivate const& packet);
        void HandleNpcTextQueryOpcode(WorldPackets::Npc::NpcTextQuery const& packet);
        void HandleBinderActivateOpcode(WorldPackets::Npc::BinderActivate const& packet);
        void HandleListStabledPetsOpcode(WorldPackets::Npc::ListStabledPets const& packet);
        void HandleStablePet(WorldPackets::Npc::StablePet const& packet);
        void HandleUnstablePet(WorldPackets::Npc::UnstablePet const& packet);
        void HandleBuyStableSlot(WorldPackets::Npc::BuyStableSlot const& packet);
        void HandleStableRevivePet(NullClientPacket const& packet);
        void HandleStableSwapPet(WorldPackets::Npc::StableSwapPet const& packet);

        void HandleDuelAcceptedOpcode(WorldPackets::Duel::DuelAccepted const& packet);
        void HandleDuelCancelledOpcode(WorldPackets::Duel::DuelCancelled const& packet);

        void HandleAcceptTradeOpcode(WorldPackets::Trade::AcceptTrade const& packet);
        void HandleBeginTradeOpcode(NullClientPacket const& packet);
        void HandleBusyTradeOpcode(NullClientPacket const& packet);
        void HandleCancelTradeOpcode(NullClientPacket const& packet);
        void HandleClearTradeItemOpcode(WorldPackets::Trade::ClearTradeItem const& packet);
        void HandleIgnoreTradeOpcode(NullClientPacket const& packet);
        void HandleInitiateTradeOpcode(WorldPackets::Trade::InitiateTrade const& packet);
        void HandleSetTradeGoldOpcode(WorldPackets::Trade::SetTradeGold const& packet);
        void HandleSetTradeItemOpcode(WorldPackets::Trade::SetTradeItem const& packet);
        void HandleUnacceptTradeOpcode(NullClientPacket const& packet);

        void HandleAuctionHelloOpcode(WorldPackets::AuctionHouse::AuctionHello const& packet);
        void HandleAuctionListItems(WorldPackets::AuctionHouse::AuctionListItems const& packet);
        void HandleAuctionListBidderItems(WorldPackets::AuctionHouse::AuctionListBidderItem const& packet);
        void HandleAuctionSellItem(WorldPackets::AuctionHouse::AuctionSellItem const& packet);
        void HandleAuctionRemoveItem(WorldPackets::AuctionHouse::AuctionRemoveItem const& packet);
        void HandleAuctionListOwnerItems(WorldPackets::AuctionHouse::AuctionListOwnerItems const& packet);
        void HandleAuctionPlaceBid(WorldPackets::AuctionHouse::AuctionPlaceBid const& packet);

        void HandleGetMailList(WorldPackets::Mail::GetMailList const& packet);
        void HandleSendMail(WorldPackets::Mail::SendMail const& packet);
        class AsyncMailSendRequest;
        void HandleSendMailRequest(AsyncMailSendRequest* req);
        void HandleSendMailCallback(AsyncMailSendRequest* req);
        void HandleMailTakeMoney(WorldPackets::Mail::MailTakeMoney const& packet);
        void HandleMailTakeItem(WorldPackets::Mail::MailTakeItem const& packet);
        void HandleMailMarkAsRead(WorldPackets::Mail::MailMarkAsRead const& packet);
        void HandleMailReturnToSender(WorldPackets::Mail::MailReturnToSender const& packet);
        void HandleMailDelete(WorldPackets::Mail::MailDelete const& packet);
        void HandleItemTextQuery(WorldPackets::Misc::ItemTextQuery const& packet);
        void HandleMailCreateTextItem(WorldPackets::Mail::MailCreateTextItem const& packet);
        void HandleQueryNextMailTime(NullClientPacket const& packet);
        void HandleCancelChanneling(WorldPackets::Spell::CancelChanneling const& packet);

        void HandleSplitItemOpcode(WorldPackets::Item::SplitItem const& packet);
        void HandleSwapInvItemOpcode(WorldPackets::Item::SwapInvItem const& packet);
        void HandleDestroyItemOpcode(WorldPackets::Item::DestroyItem const& packet);
        void HandleAutoEquipItemOpcode(WorldPackets::Item::AutoEquipItem const& packet);
        void HandleItemQuerySingleOpcode(WorldPackets::Item::QueryItem const& packet);
        void HandleSellItemOpcode(WorldPackets::Item::SellItem const& packet);
        void HandleBuyItemInSlotOpcode(WorldPackets::Item::BuyItemInSlot const& packet);
        void HandleBuyItemOpcode(WorldPackets::Item::BuyItem const& packet);
        void HandleListInventoryOpcode(WorldPackets::Item::ListInventory const& packet);
        void HandleAutoStoreBagItemOpcode(WorldPackets::Item::AutoStoreBagItem const& packet);
        void HandleReadItemOpcode(WorldPackets::Item::ReadItem const& packet);
        void HandleAutoEquipItemSlotOpcode(WorldPackets::Item::AutoEquipItemSlot const& packet);
        void HandleSwapItem(WorldPackets::Item::SwapItem const& packet);
        void HandleBuybackItem(WorldPackets::Item::BuybackItem const& packet);
        void HandleAutoBankItemOpcode(WorldPackets::Item::AutoBankItem const& packet);
        void HandleAutoStoreBankItemOpcode(WorldPackets::Item::AutoStoreBankItem const& packet);
        void HandleWrapItemOpcode(WorldPackets::Item::WrapItem const& packet);

        void HandleAttackSwingOpcode(WorldPackets::Combat::AttackSwing const& packet);
        void HandleAttackStopOpcode(NullClientPacket const& packet);
        void HandleSetSheathedOpcode(WorldPackets::Combat::SetSheathed const& packet);

        void HandleUseItemOpcode(WorldPackets::Spell::UseItem const& packet);
        void HandleOpenItemOpcode(WorldPackets::Spell::OpenItem const& packet);
        void HandleCastSpellOpcode(WorldPackets::Spell::CastSpell const& packet);
        void HandleCancelCastOpcode(WorldPackets::Spell::CancelCast const& packet);
        void HandleCancelAuraOpcode(WorldPackets::Spell::CancelAura const& packet);
        void HandleCancelGrowthAuraOpcode(NullClientPacket const& packet);
        void HandleCancelAutoRepeatSpellOpcode(NullClientPacket const& packet);
        void HandleSetActionBarTogglesOpcode(WorldPackets::Misc::SetActionBarToggles const& packet);
        void HandleLearnTalentOpcode(WorldPackets::Skill::LearnTalent const& packet);
        void HandleTalentWipeConfirmOpcode(WorldPackets::Skill::TalentWipeConfirm const& packet);
        void HandleUnlearnSkillOpcode(WorldPackets::Skill::UnlearnSkill const& packet);

        void HandleQuestgiverStatusQueryOpcode(WorldPackets::Quest::QuestgiverStatusQuery const& packet);
        void HandleQuestgiverHelloOpcode(WorldPackets::Quest::QuestgiverHello const& packet);
        void HandleQuestgiverAcceptQuestOpcode(WorldPackets::Quest::QuestgiverAcceptQuest const& packet);
        void HandleQuestgiverQueryQuestOpcode(WorldPackets::Quest::QuestgiverQueryQuest const& packet);
        void HandleQuestgiverChooseRewardOpcode(WorldPackets::Quest::QuestgiverChooseReward const& packet);
        void HandleQuestgiverRequestRewardOpcode(WorldPackets::Quest::QuestgiverRequestReward const& packet);
        void HandleQuestQueryOpcode(WorldPackets::Quest::QueryQuest const& packet);
        void HandleQuestgiverCancel(NullClientPacket const& packet);
        void HandleQuestLogSwapQuest(WorldPackets::Quest::QuestLogSwapQuest const& packet);
        void HandleQuestLogRemoveQuest(WorldPackets::Quest::QuestLogRemoveQuest const& packet);
        void HandleQuestConfirmAccept(WorldPackets::Quest::QuestConfirmAccept const& packet);
        void HandleQuestgiverCompleteQuest(WorldPackets::Quest::QuestgiverCompleteQuest const& packet);
        void HandleQuestgiverQuestAutoLaunch(NullClientPacket const& packet);
        void HandlePushQuestToParty(WorldPackets::Quest::PushQuestToParty const& packet);
        void HandleQuestPushResult(WorldPackets::Quest::QuestPushResult const& packet);

        bool SanitizeChatMessage(std::string& msg, uint32 lang, uint32 msgType);
        bool SanitizeChatMessageAndProcessCommand(std::string& msg, uint32 lang, uint32 msgType);
        static bool IsLanguageAllowedForChatType(uint32 lang, uint32 msgType);
        void SendPlayerNotFoundNotice(std::string const& name);
        void SendWrongFactionNotice();
        void SendChatRestrictedNotice();
        void HandleChatMessageOpcode(WorldPackets::Chat::ChatMessage const& packet);
        void HandleTextEmoteOpcode(WorldPackets::Misc::TextEmote const& packet);
        void HandleChatIgnoredOpcode(WorldPackets::Misc::ChatIgnored const& packet);
        uint32 ChatCooldown();

        void HandleReclaimCorpseOpcode(WorldPackets::Misc::ReclaimCorpse const& packet);
        void HandleCorpseQueryOpcode(NullClientPacket const& packet);
        void HandleResurrectResponseOpcode(WorldPackets::Misc::ResurrectResponse const& packet);
        void HandleSummonResponseOpcode(WorldPackets::Misc::SummonResponse const& packet);

        void HandleJoinChannelOpcode(WorldPackets::Channel::JoinChannel const& packet);
        void HandleLeaveChannelOpcode(WorldPackets::Channel::LeaveChannel const& packet);
        void HandleChannelListOpcode(WorldPackets::Channel::ChannelList const& packet);
        void HandleChannelPasswordOpcode(WorldPackets::Channel::ChannelPassword const& packet);
        void HandleChannelSetOwnerOpcode(WorldPackets::Channel::ChannelSetOwner const& packet);
        void HandleChannelOwnerOpcode(WorldPackets::Channel::ChannelOwner const& packet);
        void HandleChannelModeratorOpcode(WorldPackets::Channel::ChannelModerator const& packet);
        void HandleChannelUnmoderatorOpcode(WorldPackets::Channel::ChannelUnmoderator const& packet);
        void HandleChannelMuteOpcode(WorldPackets::Channel::ChannelMute const& packet);
        void HandleChannelUnmuteOpcode(WorldPackets::Channel::ChannelUnmute const& packet);
        void HandleChannelInviteOpcode(WorldPackets::Channel::ChannelInvite const& packet);
        void HandleChannelKickOpcode(WorldPackets::Channel::ChannelKick const& packet);
        void HandleChannelBanOpcode(WorldPackets::Channel::ChannelBan const& packet);
        void HandleChannelUnbanOpcode(WorldPackets::Channel::ChannelUnban const& packet);
        void HandleChannelAnnouncementsOpcode(WorldPackets::Channel::ChannelAnnouncements const& packet);
        void HandleChannelModerateOpcode(WorldPackets::Channel::ChannelModerate const& packet);

        void HandleCompleteCinematic(NullClientPacket const& packet);
        void HandleNextCinematicCamera(NullClientPacket const& packet);

        void HandlePageQuerySkippedOpcode(WorldPacket& recvPacket);
        void HandlePageTextQueryOpcode(WorldPackets::Query::QueryPageText const& packet);

        void HandleTutorialFlagOpcode(WorldPackets::Misc::TutorialFlag const& packet);
        void HandleTutorialClearOpcode(NullClientPacket const& packet);
        void HandleTutorialResetOpcode(NullClientPacket const& packet);

        //Pet
        void HandlePetAction(WorldPackets::Pet::PetAction const& packet);
        void HandlePetNameQueryOpcode(WorldPackets::Pet::QueryPetName const& packet);
        void HandlePetSetAction(WorldPackets::Pet::PetSetAction const& packet);
        void HandlePetAbandon(WorldPackets::Pet::PetAbandon const& packet);
        void HandlePetRename(WorldPackets::Pet::PetRename const& packet);
        void HandlePetCancelAuraOpcode(WorldPackets::Pet::PetCancelAura const& packet);
        void HandleRequestPetInfoOpcode(NullClientPacket const& packet);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        void HandlePetStopAttack(WorldPackets::Pet::PetStopAttack const& packet);
        void HandlePetUnlearnOpcode(WorldPackets::Pet::PetUnlearn const& packet);
        void HandlePetSpellAutocastOpcode(WorldPackets::Pet::PetSpellAutocast const& packet);
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        void HandlePetCastSpellOpcode(WorldPackets::Pet::PetCastSpell const& packet);
#endif

        void HandleCharRenameOpcode(WorldPackets::Character::CharRename const& packet);
        static void HandleChangePlayerNameOpcodeCallBack(std::unique_ptr<QueryResult> result, uint32 accountId, std::string newname);

        //BattleGround
        void HandleBattlefieldJoinOpcode(WorldPackets::Battleground::BattlefieldJoin const& packet);
        void HandleBattlemasterHelloOpcode(WorldPackets::Battleground::BattlemasterHello const& packet);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        void HandleBattlemasterJoinOpcode(WorldPackets::Battleground::BattlemasterJoin const& packet);
#endif
        void RequestBgJoinQueue(ObjectGuid battlemaster, uint32 instanceId, uint32 mapId, bool joinAsGroup);
        void HandleBattleGroundPlayerPositionsOpcode(NullClientPacket const& packet);
        void HandlePVPLogDataOpcode(NullClientPacket const& packet);
        void HandleBattlefieldStatusOpcode(NullClientPacket const& packet);
        void HandleBattleFieldPortOpcode(WorldPackets::Battleground::BattleFieldPort const& packet);
        void HandleBattlefieldListOpcode(WorldPackets::Battleground::BattlefieldListRequest const& packet);
        void HandleLeaveBattlefieldOpcode(WorldPackets::Battleground::LeaveBattlefield const& packet);

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
        void HandleWardenDataOpcode(WorldPackets::Misc::WardenData const& packet);
#endif
        void HandleMinimapPingOpcode(WorldPackets::Group::MinimapPing const& packet);
        void HandleRandomRollOpcode(WorldPackets::Group::RandomRoll const& packet);
        void HandleFarSightOpcode(WorldPackets::Misc::FarSight const& packet);
        void HandleWhoisOpcode(WorldPackets::Query::Whois const& packet);
        void HandleResetInstancesOpcode(NullClientPacket const& packet);

        void HandleAreaSpiritHealerQueryOpcode(WorldPackets::Battleground::AreaSpiritHealerQuery const& packet);
        void HandleAreaSpiritHealerQueueOpcode(WorldPackets::Battleground::AreaSpiritHealerQueue const& packet);
        void HandleSelfResOpcode(NullClientPacket const& packet);

    private:
        // private trade method
        void MoveItems(Item* myItems[], Item* hisItems[]);

        bool VerifyMovementInfo(MovementInfo const& movementInfo) const;
        void HandleMoverRelocation(Unit* pMover, MovementInfo& movementInfo);

        void ExecuteOpcode(OpcodeHandler const& opHandle, WorldPacket* packet);

        // logging helper
        void LogUnexpectedOpcode(WorldPacket* packet, char const*  reason);
        void LogUnprocessedTail(WorldPacket* packet);

        uint32 const m_guid; // unique identifier for each session
        std::shared_ptr<WorldSocket> m_socket;
        std::string m_remoteIpAddress; // might also be "<BOT>"
        LockedQueue<std::unique_ptr<WorldPacket>, std::mutex> m_recvQueue[PACKET_PROCESS_MAX_TYPE];
        bool m_receivedPacketType[PACKET_PROCESS_MAX_TYPE];
        uint32 m_floodPacketsCount[FLOOD_MAX_OPCODES_TYPE];
        bool m_connected;
        uint32 m_disconnectTimer;
        uint32 m_latency;

        uint32 m_accountId;
        std::string m_username;
        AccountTypes m_security;
        uint32 m_accountFlags;
        LocaleConstant m_sessionDbcLocale;
        int m_sessionDbLocaleIndex;
        ClientOSType m_clientOS;
        ClientPlatformType m_clientPlatform;
        uint32 m_gameBuild;
        bool m_verifiedEmail;
        std::shared_ptr<PlayerBotEntry> m_bot;
        std::unique_ptr<SniffFile> m_sniffFile;

        Warden* m_warden;
        MovementAnticheat* m_cheatData;

        Player* _player;
        ObjectGuid m_currentPlayerGuid;
        ObjectGuid m_clientMoverGuid;
        uint32 m_moveRejectTime;
        time_t m_createTime;                                // when session was created
        time_t m_previousPlayTime;                          // play time from previous session less than 5 hours ago
        time_t m_logoutTime;                                // when its time to log out character
        bool m_inQueue;                                     // session wait in auth.queue
        bool m_playerLoading;                               // code processed in LoginPlayer
        bool m_playerLogout;                                // code processed in LogoutPlayer
        bool m_playerRecentlyLogout;
        bool m_playerSave;
        uint32 m_exhaustionState;
        uint32 m_charactersCount;
        uint32 m_characterMaxLevel;
        BigNumber m_sessionKey;
        AccountData m_accountData[NewAccountData::NUM_ACCOUNT_DATA_TYPES];
        uint32 m_tutorials[ACCOUNT_TUTORIALS_COUNT];
        TutorialDataState m_tutorialState;

        // compressed moves packet does not exist in early clients
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
        MovementData m_movementPacketCompressor;
        std::mutex m_movementPacketCompressorMutex;
        void SendCompressedMovementPackets();
        // dynamically decide when to enable or disable compression
        uint32 m_movePacketsSentLastInterval = 0;
        uint32 m_movePacketsSentThisInterval = 0;
        time_t m_movePacketTrackingIntervalStart = 0;
#endif

        // Clustering system (TODO remove this)
    public:
        MasterPlayer* GetMasterPlayer() const { return m_masterPlayer; }
        PlayerPointer GetPlayerPointer() const
        {
            if (_player)
                return PlayerPointer(new PlayerWrapper<Player>(_player));
            if (GetMasterPlayer())
                return PlayerPointer(new PlayerWrapper<MasterPlayer>(GetMasterPlayer()));
            return PlayerPointer(nullptr);
        }
    protected:
        MasterPlayer*   m_masterPlayer;
        // End of clustering system
};
#endif
