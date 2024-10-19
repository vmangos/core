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
#include "Item.h"
#include "GossipDef.h"
#include "Chat/AbstractPlayer.h"
#include "SniffFile.h"
#include "ClientDefines.h"
#include "Crypto/BigNumber.h"
#include "AccountData.h"

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

enum PacketProcessing
{
    /*
     * Global systems safety.
     * Anywhere, it is safe to :
     * - Items: Generate new item GUID
     * On a single map (one thread), it is safe to:
     * - Call Player::TeleportTo
     * - Add a global Corpse in ObjectAccessor ON THE CURRENT MAP
    /*
     * PACKET_PROCESS_WORLD
     * Thread safe environment for this packet.
     */
    PACKET_PROCESS_WORLD = 0,                               //packet is not thread-safe - process it in World::UpdateSessions()
    /*
     * PACKET_PROCESS_MAP
     * Unsafe:
     * - Add / Remove players from other Maps
     * - Write Groups / Guilds / Loots
     * - Write any Object located in another Map
     * - Write Database global cache
     * Safe:
     * - Read current Map objects
     * - Read Groups / Guilds / Loots
     * - Iterate Groups / Guilds / Loots ...
     * - Call player->GetSession()->SendPacket() for any player
     * - Remove / Add players to current Map
     */
    PACKET_PROCESS_MAP,
    /*
     * PACKET_PROCESS_SPELLS
     * Same safety as PACKET_PROCESS_MAP
     * but is checked more frequently
     */
    PACKET_PROCESS_SPELLS,
    /*
     * PACKET_PROCESS_MOVEMENT
     * Same safety as PACKET_PROCESS_MAP
     * but is checked more frequently
     */
    PACKET_PROCESS_MOVEMENT,
    /*
     * PACKET_PROCESS_ASYNC
     * Handled whenever session update is not running.
     * Never at the same time as PACKET_PROCESS_WORLD.
     * Never while cli and gm commands are being executed.
     * Can be at the same time as maps are being updated.
     * Be careful touching the player.
     * Never touch the map.
     */
    PACKET_PROCESS_ASYNC,
    PACKET_PROCESS_MAX_TYPE,                                // no handler for this packet (server side, or not implemented)
    /*
     * PACKET_PROCESS_SELF_ITEMS
     * Only affects current player items.
     * Self:
     * - Write (and create) items
     * - Write quests
     * Map:
     * - Can modify shared items (loots for example)
     * Cross Maps:
     * - Read Groups
     * - No other modification / no read allowed
     */
    PACKET_PROCESS_SELF_ITEMS = PACKET_PROCESS_MAP,
    /*
    * PACKET_PROCESS_DB_QUERY
    * Does not write anything. Can be processed as long as containers are not being reloaded.
    * Reads static data (usually data from World DB)
    */
    PACKET_PROCESS_DB_QUERY = PACKET_PROCESS_ASYNC,
    /*
     * PACKET_PROCESS_CHANNEL
     * Allowed:
     * - Read / Iterate channels
     * - Modify channels
     * - Add / Remove channels
     */
    PACKET_PROCESS_CHANNEL = PACKET_PROCESS_WORLD,
    /*
     * PACKET_PROCESS_CHANNEL
     * Allowed:
     * - Read / Lookup Groups
     * - Modify Groups
     * - Add / Remove Groups
     * - Remove Group from any Player
     */
    PACKET_PROCESS_GROUP = PACKET_PROCESS_WORLD,
    /*
     * PACKET_PROCESS_CHANNEL
     * Allowed:
     * - Read / Lookup Guilds
     * - Modify Guilds
     * - Add / Remove Guilds
     * - Remove Guilds from any Player
     */
    PACKET_PROCESS_GUILD = PACKET_PROCESS_WORLD,
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
        WorldSession(uint32 id, WorldSocket *sock, AccountTypes sec, time_t mute_time, LocaleConstant locale);
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
        std::string const& GetRemoteAddress() const { return m_address; }
        void SetPlayer(Player* plr) { _player = plr; }
        void SetMasterPlayer(MasterPlayer* plr) { m_masterPlayer = plr; }
        void LoginPlayer(ObjectGuid playerGuid);
        WorldSocket* GetSocket() { return m_socket; }

        // Session in auth.queue currently
        void SetInQueue(bool state) { m_inQueue = state; }

        // Player online / socket offline system
        void SetDisconnectedSession(); // Remove from World::m_session. Used when an account gets disconnected.
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
        time_t GetPreviousPlayedTime() { return m_previousPlayTime; }
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
        time_t GetLastPubChanMsgTime() { return m_lastPubChannelMsgTime; }
        void SetLastPubChanMsgTime(time_t time) { m_lastPubChannelMsgTime = time; }

        // Bot system
        PlayerBotEntry* GetBot() { return m_bot.get(); }
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
        uint32 GetTutorialInt(uint32 intId)
        {
            ASSERT(intId < ACCOUNT_TUTORIALS_COUNT);
            return m_tutorials[intId];
        }
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
        void SendPetitionShowList(ObjectGuid& guid);
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

        void Handle_NULL(WorldPacket& recvPacket);          // not used
        void Handle_EarlyProccess(WorldPacket& recvPacket);// just mark packets processed in WorldSocket::OnRead
        void Handle_ServerSide(WorldPacket& recvPacket);    // sever side only, can't be accepted from client
        void Handle_Deprecated(WorldPacket& recvPacket);    // never used anymore by client

        void HandleCharEnumOpcode(WorldPacket& recvPacket);
        void HandleCharDeleteOpcode(WorldPacket& recvPacket);
        void HandleCharCreateOpcode(WorldPacket& recvPacket);
        void HandlePlayerLoginOpcode(WorldPacket& recvPacket);
        void HandleCharEnum(std::unique_ptr<QueryResult> result);
        void HandlePlayerLogin(LoginQueryHolder* holder);
        void HandlePlayedTime(WorldPacket& recvPacket);

        // Movement
        void HandleMoveRootAck(WorldPacket& recvPacket);
        void HandleMoveKnockBackAck(WorldPacket& recvPacket);
        void HandleMoveTeleportAckOpcode(WorldPacket& recvPacket);
        void HandleForceSpeedChangeAckOpcodes(WorldPacket& recv_data);
        void HandleMoveWorldportAckOpcode(WorldPacket& recvPacket);
        void HandleMoveWorldportAckOpcode();                // for server-side calls
        void HandleMovementOpcodes(WorldPacket& recvPacket);
        void HandleSetActiveMoverOpcode(WorldPacket& recv_data);
        void HandleMoveNotActiveMoverOpcode(WorldPacket& recv_data);
        void HandleMoveTimeSkippedOpcode(WorldPacket& recv_data);
        void HandleMovementFlagChangeToggleAck(WorldPacket& recvData);
        void HandleMoveSplineDoneOpcode(WorldPacket& recvPacket);
        void HandleMoveSetRawPosition(WorldPacket& recv_data);
        void HandleWorldTeleportOpcode(WorldPacket& recv_data);
        void HandleMountSpecialAnimOpcode(WorldPacket& recvdata);
        void HandleTeleportToUnitOpcode(WorldPacket& recvdata);

        void HandleInspectOpcode(WorldPacket& recvPacket);
        void HandleInspectHonorStatsOpcode(WorldPacket& recvPacket);
        void HandleShowingHelmOpcode(WorldPacket& recv_data);
        void HandleShowingCloakOpcode(WorldPacket& recv_data);
        void HandleRepairItemOpcode(WorldPacket& recvPacket);

        void HandlePingOpcode(WorldPacket& recvPacket);
        void HandleAuthSessionOpcode(WorldPacket& recvPacket);
        void HandleRepopRequestOpcode(WorldPacket& recvPacket);
        void HandleAutostoreLootItemOpcode(WorldPacket& recvPacket);
        void HandleLootMoneyOpcode(WorldPacket& recvPacket);
        void HandleLootOpcode(WorldPacket& recvPacket);
        void HandleLootReleaseOpcode(WorldPacket& recvPacket);
        void HandleLootMasterGiveOpcode(WorldPacket& recvPacket);
        void HandleWhoOpcode(WorldPacket& recvPacket);
        void HandleLFGOpcode(WorldPacket& recvPacket);
        void HandleLogoutRequestOpcode(WorldPacket& recvPacket);
        void HandlePlayerLogoutOpcode(WorldPacket& recvPacket);
        void HandleLogoutCancelOpcode(WorldPacket& recvPacket);
        void HandleGMTicketGetTicketOpcode(WorldPacket& recvPacket);
        void HandleGMTicketCreateOpcode(WorldPacket& recvPacket);
        void HandleGMTicketSystemStatusOpcode(WorldPacket& recvPacket);

        void HandleGMTicketDeleteTicketOpcode(WorldPacket& recvPacket);
        void HandleGMTicketUpdateTextOpcode(WorldPacket& recvPacket);
        void HandleGMSurveySubmitOpcode(WorldPacket& recvPacket);

        void HandleTogglePvP(WorldPacket& recvPacket);
        void HandleZoneUpdateOpcode(WorldPacket& recvPacket);
        void HandleSetTargetOpcode(WorldPacket& recvPacket);
        void HandleSetSelectionOpcode(WorldPacket& recvPacket);
        void HandleStandStateChangeOpcode(WorldPacket& recvPacket);
        void HandleEmoteOpcode(WorldPacket& recvPacket);
        void HandleFriendListOpcode(WorldPacket& recvPacket);
        void HandleAddFriendOpcode(WorldPacket& recvPacket);
        void HandleDelFriendOpcode(WorldPacket& recvPacket);
        void HandleAddIgnoreOpcode(WorldPacket& recvPacket);
        void HandleDelIgnoreOpcode(WorldPacket& recvPacket);
        void HandleBugOpcode(WorldPacket& recvPacket);
        void HandleSetAmmoOpcode(WorldPacket& recvPacket);
        void HandleItemNameQueryOpcode(WorldPacket& recvPacket);

        void HandleAreaTriggerOpcode(WorldPacket& recvPacket);
        void HandleSetFactionAtWarOpcode(WorldPacket& recv_data);
        void HandleSetWatchedFactionOpcode(WorldPacket& recv_data);
        void HandleSetFactionInactiveOpcode(WorldPacket& recv_data);

        void HandleUpdateAccountData(WorldPacket& recvPacket);
        void HandleRequestAccountData(WorldPacket& recvPacket);
        void HandleSetActionButtonOpcode(WorldPacket& recvPacket);

        void HandleGameObjectUseOpcode(WorldPacket& recPacket);
        void HandleMeetingStoneJoinOpcode(WorldPacket& recPacket);
        void HandleMeetingStoneLeaveOpcode(WorldPacket& recPacket);
        void HandleMeetingStoneInfoOpcode(WorldPacket& recPacket);

        void HandleNameQueryOpcode(WorldPacket& recvPacket);
        void HandleQueryTimeOpcode(WorldPacket& recvPacket);
        void HandleCreatureQueryOpcode(WorldPacket& recvPacket);
        void HandleGameObjectQueryOpcode(WorldPacket& recvPacket);

        void HandleRequestRaidInfoOpcode(WorldPacket& recv_data);
        void HandleGroupInviteOpcode(WorldPacket& recvPacket);
        void HandleGroupAcceptOpcode(WorldPacket& recvPacket);
        void HandleGroupDeclineOpcode(WorldPacket& recvPacket);
        void HandleGroupUninviteOpcode(WorldPacket& recvPacket);
        void HandleGroupUninviteGuidOpcode(WorldPacket& recvPacket);
        void HandleGroupSetLeaderOpcode(WorldPacket& recvPacket);
        void HandleGroupDisbandOpcode(WorldPacket& recvPacket);
        void HandleLootMethodOpcode(WorldPacket& recvPacket);
        void HandleLootRoll(WorldPacket& recv_data);
        void HandleRequestPartyMemberStatsOpcode(WorldPacket& recv_data);
        void HandleRaidTargetUpdateOpcode(WorldPacket& recv_data);
        void HandleRaidReadyCheckOpcode(WorldPacket& recv_data);
        void HandleGroupRaidConvertOpcode(WorldPacket& recv_data);
        void HandleGroupChangeSubGroupOpcode(WorldPacket& recv_data);
        void HandleGroupSwapSubGroupOpcode(WorldPacket& recv_data);
        void HandleGroupAssistantLeaderOpcode(WorldPacket& recv_data);

        void HandlePetitionBuyOpcode(WorldPacket& recv_data);
        void HandlePetitionShowSignOpcode(WorldPacket& recv_data);
        void HandlePetitionQueryOpcode(WorldPacket& recv_data);
        void HandlePetitionRenameOpcode(WorldPacket& recv_data);
        void HandlePetitionSignOpcode(WorldPacket& recv_data);
        void HandlePetitionDeclineOpcode(WorldPacket& recv_data);
        void HandleOfferPetitionOpcode(WorldPacket& recv_data);
        void HandleTurnInPetitionOpcode(WorldPacket& recv_data);

        void HandleGuildQueryOpcode(WorldPacket& recvPacket);
        void HandleGuildCreateOpcode(WorldPacket& recvPacket);
        void HandleGuildInviteOpcode(WorldPacket& recvPacket);
        void HandleGuildRemoveOpcode(WorldPacket& recvPacket);
        void HandleGuildAcceptOpcode(WorldPacket& recvPacket);
        void HandleGuildDeclineOpcode(WorldPacket& recvPacket);
        void HandleGuildInfoOpcode(WorldPacket& recvPacket);
        void HandleGuildRosterOpcode(WorldPacket& recvPacket);
        void HandleGuildPromoteOpcode(WorldPacket& recvPacket);
        void HandleGuildDemoteOpcode(WorldPacket& recvPacket);
        void HandleGuildLeaveOpcode(WorldPacket& recvPacket);
        void HandleGuildDisbandOpcode(WorldPacket& recvPacket);
        void HandleGuildLeaderOpcode(WorldPacket& recvPacket);
        void HandleGuildMOTDOpcode(WorldPacket& recvPacket);
        void HandleGuildSetPublicNoteOpcode(WorldPacket& recvPacket);
        void HandleGuildSetOfficerNoteOpcode(WorldPacket& recvPacket);
        void HandleGuildRankOpcode(WorldPacket& recvPacket);
        void HandleGuildAddRankOpcode(WorldPacket& recvPacket);
        void HandleGuildDelRankOpcode(WorldPacket& recvPacket);
        void HandleGuildChangeInfoTextOpcode(WorldPacket& recvPacket);
        void HandleSaveGuildEmblemOpcode(WorldPacket& recvPacket);

        void HandleTaxiNodeStatusQueryOpcode(WorldPacket& recvPacket);
        void HandleTaxiQueryAvailableNodes(WorldPacket& recvPacket);
        void HandleActivateTaxiOpcode(WorldPacket& recvPacket);
        void HandleActivateTaxiExpressOpcode(WorldPacket& recvPacket);

        void HandleTabardVendorActivateOpcode(WorldPacket& recvPacket);
        void HandleBankerActivateOpcode(WorldPacket& recvPacket);
        void HandleBuyBankSlotOpcode(WorldPacket& recvPacket);
        void HandleTrainerListOpcode(WorldPacket& recvPacket);
        void HandleTrainerBuySpellOpcode(WorldPacket& recvPacket);
        void HandlePetitionShowListOpcode(WorldPacket& recvPacket);
        void HandleGossipHelloOpcode(WorldPacket& recvPacket);
        void HandleGossipSelectOptionOpcode(WorldPacket& recvPacket);
        void HandleSpiritHealerActivateOpcode(WorldPacket& recvPacket);
        void HandleNpcTextQueryOpcode(WorldPacket& recvPacket);
        void HandleBinderActivateOpcode(WorldPacket& recvPacket);
        void HandleListStabledPetsOpcode(WorldPacket& recvPacket);
        void HandleStablePet(WorldPacket& recvPacket);
        void HandleUnstablePet(WorldPacket& recvPacket);
        void HandleBuyStableSlot(WorldPacket& recvPacket);
        void HandleStableRevivePet(WorldPacket& recvPacket);
        void HandleStableSwapPet(WorldPacket& recvPacket);

        void HandleDuelAcceptedOpcode(WorldPacket& recvPacket);
        void HandleDuelCancelledOpcode(WorldPacket& recvPacket);

        void HandleAcceptTradeOpcode(WorldPacket& recvPacket);
        void HandleBeginTradeOpcode(WorldPacket& recvPacket);
        void HandleBusyTradeOpcode(WorldPacket& recvPacket);
        void HandleCancelTradeOpcode(WorldPacket& recvPacket);
        void HandleClearTradeItemOpcode(WorldPacket& recvPacket);
        void HandleIgnoreTradeOpcode(WorldPacket& recvPacket);
        void HandleInitiateTradeOpcode(WorldPacket& recvPacket);
        void HandleSetTradeGoldOpcode(WorldPacket& recvPacket);
        void HandleSetTradeItemOpcode(WorldPacket& recvPacket);
        void HandleUnacceptTradeOpcode(WorldPacket& recvPacket);

        void HandleAuctionHelloOpcode(WorldPacket& recvPacket);
        void HandleAuctionListItems(WorldPacket& recv_data);
        void HandleAuctionListBidderItems(WorldPacket& recv_data);
        void HandleAuctionSellItem(WorldPacket& recv_data);
        void HandleAuctionRemoveItem(WorldPacket& recv_data);
        void HandleAuctionListOwnerItems(WorldPacket& recv_data);
        void HandleAuctionPlaceBid(WorldPacket& recv_data);

        void HandleGetMailList(WorldPacket& recv_data);
        void HandleSendMail(WorldPacket& recv_data);
        class AsyncMailSendRequest;
        void HandleSendMailCallback(AsyncMailSendRequest* req);
        void HandleMailTakeMoney(WorldPacket& recv_data);
        void HandleMailTakeItem(WorldPacket& recv_data);
        void HandleMailMarkAsRead(WorldPacket& recv_data);
        void HandleMailReturnToSender(WorldPacket& recv_data);
        void HandleMailDelete(WorldPacket& recv_data);
        void HandleItemTextQuery(WorldPacket& recv_data);
        void HandleMailCreateTextItem(WorldPacket& recv_data);
        void HandleQueryNextMailTime(WorldPacket& recv_data);
        void HandleCancelChanneling(WorldPacket& recv_data);

        void SendItemPageInfo(ItemPrototype *itemProto);
        void HandleSplitItemOpcode(WorldPacket& recvPacket);
        void HandleSwapInvItemOpcode(WorldPacket& recvPacket);
        void HandleDestroyItemOpcode(WorldPacket& recvPacket);
        void HandleAutoEquipItemOpcode(WorldPacket& recvPacket);
        void HandleItemQuerySingleOpcode(WorldPacket& recvPacket);
        void HandleSellItemOpcode(WorldPacket& recvPacket);
        void HandleBuyItemInSlotOpcode(WorldPacket& recvPacket);
        void HandleBuyItemOpcode(WorldPacket& recvPacket);
        void HandleListInventoryOpcode(WorldPacket& recvPacket);
        void HandleAutoStoreBagItemOpcode(WorldPacket& recvPacket);
        void HandleReadItemOpcode(WorldPacket& recvPacket);
        void HandleAutoEquipItemSlotOpcode(WorldPacket& recvPacket);
        void HandleSwapItem(WorldPacket& recvPacket);
        void HandleBuybackItem(WorldPacket& recvPacket);
        void HandleAutoBankItemOpcode(WorldPacket& recvPacket);
        void HandleAutoStoreBankItemOpcode(WorldPacket& recvPacket);
        void HandleWrapItemOpcode(WorldPacket& recvPacket);

        void HandleAttackSwingOpcode(WorldPacket& recvPacket);
        void HandleAttackStopOpcode(WorldPacket& recvPacket);
        void HandleSetSheathedOpcode(WorldPacket& recvPacket);

        void HandleUseItemOpcode(WorldPacket& recvPacket);
        void HandleOpenItemOpcode(WorldPacket& recvPacket);
        void HandleCastSpellOpcode(WorldPacket& recvPacket);
        void HandleCancelCastOpcode(WorldPacket& recvPacket);
        void HandleCancelAuraOpcode(WorldPacket& recvPacket);
        void HandleCancelGrowthAuraOpcode(WorldPacket& recvPacket);
        void HandleCancelAutoRepeatSpellOpcode(WorldPacket& recvPacket);
        void HandleSetActionBarTogglesOpcode(WorldPacket& recv_data);
        void HandleLearnTalentOpcode(WorldPacket& recvPacket);
        void HandleTalentWipeConfirmOpcode(WorldPacket& recvPacket);
        void HandleUnlearnSkillOpcode(WorldPacket& recvPacket);

        void HandleQuestgiverStatusQueryOpcode(WorldPacket& recvPacket);
        void HandleQuestgiverHelloOpcode(WorldPacket& recvPacket);
        void HandleQuestgiverAcceptQuestOpcode(WorldPacket& recvPacket);
        void HandleQuestgiverQueryQuestOpcode(WorldPacket& recvPacket);
        void HandleQuestgiverChooseRewardOpcode(WorldPacket& recvPacket);
        void HandleQuestgiverRequestRewardOpcode(WorldPacket& recvPacket);
        void HandleQuestQueryOpcode(WorldPacket& recvPacket);
        void HandleQuestgiverCancel(WorldPacket& recv_data);
        void HandleQuestLogSwapQuest(WorldPacket& recv_data);
        void HandleQuestLogRemoveQuest(WorldPacket& recv_data);
        void HandleQuestConfirmAccept(WorldPacket& recv_data);
        void HandleQuestgiverCompleteQuest(WorldPacket& recv_data);
        void HandleQuestgiverQuestAutoLaunch(WorldPacket& recvPacket);
        void HandlePushQuestToParty(WorldPacket& recvPacket);
        void HandleQuestPushResult(WorldPacket& recvPacket);

        bool CheckChatMessageValidity(char*, uint32, uint32);
        bool ProcessChatMessageAfterSecurityCheck(char*, uint32, uint32);
        static bool IsLanguageAllowedForChatType(uint32 lang, uint32 msgType);
        void SendPlayerNotFoundNotice(std::string const& name);
        void SendWrongFactionNotice();
        void SendChatRestrictedNotice();
        void HandleMessagechatOpcode(WorldPacket& recvPacket);
        void HandleTextEmoteOpcode(WorldPacket& recvPacket);
        void HandleChatIgnoredOpcode(WorldPacket& recvPacket);
        uint32_t ChatCooldown();

        void HandleReclaimCorpseOpcode(WorldPacket& recvPacket);
        void HandleCorpseQueryOpcode(WorldPacket& recvPacket);
        void HandleResurrectResponseOpcode(WorldPacket& recvPacket);
        void HandleSummonResponseOpcode(WorldPacket& recv_data);

        void HandleJoinChannelOpcode(WorldPacket& recvPacket);
        void HandleLeaveChannelOpcode(WorldPacket& recvPacket);
        void HandleChannelListOpcode(WorldPacket& recvPacket);
        void HandleChannelPasswordOpcode(WorldPacket& recvPacket);
        void HandleChannelSetOwnerOpcode(WorldPacket& recvPacket);
        void HandleChannelOwnerOpcode(WorldPacket& recvPacket);
        void HandleChannelModeratorOpcode(WorldPacket& recvPacket);
        void HandleChannelUnmoderatorOpcode(WorldPacket& recvPacket);
        void HandleChannelMuteOpcode(WorldPacket& recvPacket);
        void HandleChannelUnmuteOpcode(WorldPacket& recvPacket);
        void HandleChannelInviteOpcode(WorldPacket& recvPacket);
        void HandleChannelKickOpcode(WorldPacket& recvPacket);
        void HandleChannelBanOpcode(WorldPacket& recvPacket);
        void HandleChannelUnbanOpcode(WorldPacket& recvPacket);
        void HandleChannelAnnouncementsOpcode(WorldPacket& recvPacket);
        void HandleChannelModerateOpcode(WorldPacket& recvPacket);

        void HandleCompleteCinematic(WorldPacket& recvPacket);
        void HandleNextCinematicCamera(WorldPacket& recvPacket);

        void HandlePageQuerySkippedOpcode(WorldPacket& recvPacket);
        void HandlePageTextQueryOpcode(WorldPacket& recvPacket);

        void HandleTutorialFlagOpcode(WorldPacket& recv_data);
        void HandleTutorialClearOpcode(WorldPacket& recv_data);
        void HandleTutorialResetOpcode(WorldPacket& recv_data);

        //Pet
        void HandlePetAction(WorldPacket& recv_data);
        void HandlePetStopAttack(WorldPacket& recv_data);
        void HandlePetNameQueryOpcode(WorldPacket& recv_data);
        void HandlePetSetAction(WorldPacket& recv_data);
        void HandlePetAbandon(WorldPacket& recv_data);
        void HandlePetRename(WorldPacket& recv_data);
        void HandlePetCancelAuraOpcode(WorldPacket& recvPacket);
        void HandlePetUnlearnOpcode(WorldPacket& recvPacket);
        void HandlePetSpellAutocastOpcode(WorldPacket& recvPacket);
        void HandlePetCastSpellOpcode(WorldPacket& recvPacket);
        void HandleRequestPetInfoOpcode(WorldPacket& recv_data);

        void HandleCharRenameOpcode(WorldPacket& recv_data);
        static void HandleChangePlayerNameOpcodeCallBack(std::unique_ptr<QueryResult> result, uint32 accountId, std::string newname);

        //BattleGround
        void HandleBattlefieldJoinOpcode(WorldPacket& recv_data);
        void HandleBattlemasterHelloOpcode(WorldPacket& recv_data);
        void HandleBattlemasterJoinOpcode(WorldPacket& recv_data);
        void HandleBattleGroundPlayerPositionsOpcode(WorldPacket& recv_data);
        void HandlePVPLogDataOpcode(WorldPacket& recv_data);
        void HandleBattlefieldStatusOpcode(WorldPacket& recv_data);
        void HandleBattleFieldPortOpcode(WorldPacket& recv_data);
        void HandleBattlefieldListOpcode(WorldPacket& recv_data);
        void HandleLeaveBattlefieldOpcode(WorldPacket& recv_data);

        void HandleWardenDataOpcode(WorldPacket& recv_data);
        void HandleMinimapPingOpcode(WorldPacket& recv_data);
        void HandleRandomRollOpcode(WorldPacket& recv_data);
        void HandleFarSightOpcode(WorldPacket& recv_data);
        void HandleWhoisOpcode(WorldPacket& recv_data);
        void HandleResetInstancesOpcode(WorldPacket& recv_data);

        void HandleAreaSpiritHealerQueryOpcode(WorldPacket& recv_data);
        void HandleAreaSpiritHealerQueueOpcode(WorldPacket& recv_data);
        void HandleSelfResOpcode(WorldPacket& recv_data);
        
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
        WorldSocket* m_socket;
        std::string m_address;
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
