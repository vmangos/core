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

/// \addtogroup u2w
/// @{
/// \file

#ifndef __WORLDSESSION_H
#define __WORLDSESSION_H

#include "Common.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"
#include "AuctionHouseMgr.h"
#include "Item.h"
#include "GossipDef.h"
#include "MapNodes/AbstractPlayer.h"

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
class WardenInterface;
class BigNumber;
class BehaviorAnalyzer;
class NodeSession;
class MasterPlayer;

struct OpcodeHandler;
struct PlayerBotEntry;

enum ClientOSType
{
    CLIENT_OS_UNKNOWN,
    CLIENT_OS_WIN,
    CLIENT_OS_MAC
};

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
     * PACKET_PROCESS_DB_QUERY
     * Does not write anything. Can be processed in any environment.
     * Reads static data (usually data from World DB)
     */
    PACKET_PROCESS_DB_QUERY,
    PACKET_PROCESS_MASTER_SAFE,
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

enum PacketDumpType
{
    PACKET_DUMP_SKIP_FREQUENT_OPCODES       = 0x1,
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
        explicit PacketFilter(WorldSession * pSession) : m_pSession(pSession), m_processLogout(false), m_processType(PACKET_PROCESS_MAX_TYPE) {}
        virtual ~PacketFilter() {}

        virtual bool Process(WorldPacket *) { return true; }
        inline bool ProcessLogout() const { return m_processLogout; }
        inline PacketProcessing PacketProcessType() const { return m_processType; }
        inline void SetProcessType(PacketProcessing t) { m_processType = t; }

    protected:
        WorldSession * const m_pSession;
        bool m_processLogout;
        PacketProcessing m_processType;
};
//process only thread-safe packets in Map::Update()
class MapSessionFilter : public PacketFilter
{
    public:
        explicit MapSessionFilter(WorldSession * pSession) : PacketFilter(pSession)
        {
            m_processLogout = false;
            m_processType = PACKET_PROCESS_MAP;
        }
        ~MapSessionFilter() {}

        virtual bool Process(WorldPacket * packet);
};

//class used to filer only thread-unsafe packets from queue
//in order to update only be used in World::UpdateSessions()
class WorldSessionFilter : public PacketFilter
{
    public:
        explicit WorldSessionFilter(WorldSession * pSession) : PacketFilter(pSession)
        {
            m_processLogout = true;
            m_processType = PACKET_PROCESS_WORLD;
        }
        ~WorldSessionFilter() {}
};

class ForwardToMaster_Exception {};
class ForwardToNode_Exception {};

typedef std::map<uint8, std::string> ClientIdentifiersMap;

class WorldSessionScript
{
public:
    WorldSessionScript() {}
    virtual ~WorldSessionScript() {}
    virtual void OnWardenData(uint32 dataType, uint32 notMovedSecs, Player* owner) {}
    virtual void OnUnitKilled(ObjectGuid unitEntry) {}
    virtual void OnLoot(ObjectGuid guid, LootType lootType) {}
    virtual void OnPacket(uint32 opcode) {}
    virtual void OnSpellCasted(uint32 spellId) {}
    virtual void OnLogin(Player const* owner) {}
    virtual void OnWhispered(ObjectGuid from) {}
    virtual void OnQuestKillUpdated(ObjectGuid guid) {}
};

typedef std::map<std::string, WorldSessionScript*> SessionScriptsMap;
#define ALL_SESSION_SCRIPTS(session, what) for (SessionScriptsMap::iterator it = session->scripts.begin(); it != session->scripts.end(); ++it) it->second->what;

/// Player session in the World
class MANGOS_DLL_SPEC WorldSession
{
    friend class CharacterHandler;
    public:
        WorldSession(uint32 id, WorldSocket *sock, AccountTypes sec, time_t mute_time, LocaleConstant locale);
        ~WorldSession();

        bool PlayerLoading() const { return m_playerLoading; }
        bool PlayerLogout() const { return m_playerLogout; }
        bool PlayerLogoutWithSave() const { return m_playerLogout && m_playerSave; }

        bool CharacterScreenIdleKick(uint32 diff);

        void SizeError(WorldPacket const& packet, uint32 size) const;

        void SendPacket(WorldPacket const* packet);
        void SendNotification(const char *format,...) ATTR_PRINTF(2,3);
        void SendNotification(int32 string_id,...);
        void SendPetNameInvalid(uint32 error, const std::string& name);
        void SendPartyResult(PartyOperation operation, const std::string& member, PartyResult res);
        void SendAreaTriggerMessage(const char* Text, ...) ATTR_PRINTF(2,3);
        void SendQueryTimeResponse();

        AccountTypes GetSecurity() const { return _security; }
        uint32 GetAccountId() const { return _accountId; }
        std::string GetUsername() const { return m_username; }
        void SetUsername(std::string const& s) { m_username = s; }
        Player* GetPlayer() const { return _player; }
        char const* GetPlayerName() const;
        void SetSecurity(AccountTypes security) { _security = security; }
        std::string const& GetRemoteAddress() const { return m_Address; }
        std::string const& GetClientHash() const { return _clientHash; }
        void SetPlayer(Player *plr) { _player = plr; }
        void SetMasterPlayer(MasterPlayer *plr) { m_masterPlayer = plr; }
        void LoginPlayer(ObjectGuid playerGuid);
        WorldSocket* GetSocket() { return m_Socket; }

        /// Session in auth.queue currently
        void SetInQueue(bool state) { m_inQueue = state; }

        /// Is the user engaged in a log out process?
        bool isLogingOut() const { return _logoutTime || m_playerLogout; }

        /// Engage the logout process for the user
        void LogoutRequest(time_t requestTime)
        {
            _logoutTime = requestTime;
        }

        /// Is logout cooldown expired?
        bool ShouldLogOut(time_t currTime) const
        {
            return (_logoutTime > 0 && currTime >= _logoutTime + 20);
        }

        void LogoutPlayer(bool Save);
        void KickPlayer();
        // Session can be safely deleted if returns false
        bool ForcePlayerLogoutDelay();

        void QueuePacket(WorldPacket* new_packet, NodeSession* from_node = NULL);

        bool Update(PacketFilter& updater);
        /**
         * @brief Returns true iif we can process packets (ie logged in Player, not a bot, etc ...)
         */
        bool CanProcessPackets() const;
        void ProcessPackets(PacketFilter& updater);

        /// Handle the authentication waiting queue (to be completed)
        void SendAuthWaitQue(uint32 position);

        void SendNameQueryOpcode(Player* p);
        void SendNameQueryOpcodeFromDB(ObjectGuid guid);
        static void SendNameQueryOpcodeFromDBCallBack(QueryResult *result, uint32 accountId);

        void SendTrainerList(ObjectGuid guid);
        void SendTrainerList(ObjectGuid guid, const std::string& strTitle );
        void SendTrainingSuccess(ObjectGuid guid, uint32 spellId);
        void SendTrainingFailure(ObjectGuid guid, uint32 serviceId, uint32 errorCode);

        void SendListInventory(ObjectGuid guid, uint8 menu_type = VENDOR_MENU_ALL);
        bool CheckBanker(ObjectGuid guid);
        void SendShowBank(ObjectGuid guid);
        bool CheckMailBox(ObjectGuid guid);
        void SendTabardVendorActivate(ObjectGuid guid);
        void SendSpiritResurrect();
        void SendBindPoint(Creature* npc);

        void SendAttackStop(Unit const* enemy);

        void SendBattlegGroundList(ObjectGuid guid, BattleGroundTypeId bgTypeId);

        void SendTradeStatus(TradeStatus status);
        void SendUpdateTrade(bool trader_state = true);
        void SendCancelTrade();

        void SendPetitionQueryOpcode(uint32 petitionguid);

        //pet
        void SendPetNameQuery(ObjectGuid guid, uint32 petnumber);
        void SendStablePet(ObjectGuid guid);
        void SendStableResult(uint8 res);
        bool CheckStableMaster(ObjectGuid guid);

        void LoadTutorialsData();
        void SendTutorialsData();
        void SaveTutorialsData();
        uint32 GetTutorialInt(uint32 intId)
        {
            ASSERT(intId < ACCOUNT_TUTORIALS_COUNT);
            return m_Tutorials[intId];
        }

        void SetTutorialInt(uint32 intId, uint32 value)
        {
            if(m_Tutorials[intId] != value)
            {
                m_Tutorials[intId] = value;
                if(m_tutorialState == TUTORIALDATA_UNCHANGED)
                    m_tutorialState = TUTORIALDATA_CHANGED;
            }
        }

        bool SendItemInfo( uint32 itemid, WorldPacket data );

        //auction
        void SendAuctionHello(Unit *unit);
        void SendAuctionCommandResult(AuctionEntry *auc, AuctionAction Action, AuctionError ErrorCode, InventoryResult invError = EQUIP_ERR_OK);
        void SendAuctionBidderNotification(AuctionEntry *auction, bool won);
        void SendAuctionOwnerNotification(AuctionEntry *auction, bool sold);
        void SendAuctionRemovedNotification(AuctionEntry* auction);
        void SendAuctionOutbiddedMail(AuctionEntry *auction);
        void SendAuctionCancelledToBidderMail(AuctionEntry *auction);
        AuctionHouseEntry const* GetCheckedAuctionHouseForAuctioneer(ObjectGuid guid);

        //Item Enchantment
        void SendEnchantmentLog(ObjectGuid targetGuid, ObjectGuid casterGuid, uint32 itemId, uint32 spellId);
        void SendItemEnchantTimeUpdate(ObjectGuid playerGuid, ObjectGuid itemGuid, uint32 slot, uint32 duration);

        //Taxi
        void SendTaxiStatus(ObjectGuid guid);
        void SendTaxiMenu( Creature* unit );
        void SendDoFlight( uint32 mountDisplayId, uint32 path, uint32 pathNode = 0 );
        bool SendLearnNewTaxiNode( Creature* unit );

        // Guild Team
        void SendGuildCommandResult(uint32 typecmd, const std::string& str, uint32 cmdresult);
        void SendPetitionShowList(ObjectGuid& guid);
        void SendSaveGuildEmblem( uint32 msg );
        void SendBattleGroundJoinError(uint8 err);

        // Meetingstone
        void SendMeetingstoneFailed(uint8 status);
        void SendMeetingstoneSetqueue(uint32 areaid, uint8 status);

        void BuildPartyMemberStatsChangedPacket(Player *player, WorldPacket *data);
        void BuildPartyMemberStatsPacket(Player* player, WorldPacket* data, uint32 updateMask, bool sendAllAuras);

        void DoLootRelease(ObjectGuid lguid);

        // Account mute time
        time_t m_muteTime;

        // Locales
        LocaleConstant GetSessionDbcLocale() const { return m_sessionDbcLocale; }
        int GetSessionDbLocaleIndex() const { return m_sessionDbLocaleIndex; }
        const char *GetMangosString(int32 entry) const;

        uint32 GetLatency() const { return m_latency; }
        void SetLatency(uint32 latency) { m_latency = latency; }
        uint32 GetGameBuild() const { return _gameBuild; }
        void SetGameBuild(uint32 v) { _gameBuild = v; }
        ClientOSType GetOS() const { return _clientOS; }
        void SetOS(ClientOSType os) { _clientOS = os; }
        uint32 getDialogStatus(Player *pPlayer, Object* questgiver, uint32 defstatus);
        uint32 GetAccountMaxLevel() const { return _characterMaxLevel; }
        void SetAccountMaxLevel(uint32 l) { _characterMaxLevel = l; }

        bool IsReplaying() const { return _pcktReading != nullptr; }
        ObjectGuid GetRecorderGuid() const { return _recorderGuid; }
        void ReplaySkipTime(int32 delay) { _pcktReadTimer += delay; }
        void SetReplaySpeedRate(float r) { _pcktReadSpeedRate = r; }
        void SetDumpPacket(const char* file);
        void SetPacketsDumpFlags(uint32 flags) { _pcktDumpFlags = flags; }
        void SetReadPacket(const char* file);
        void SetDumpRecvPackets(const char* file);

        FILE* _pcktReading;
        FILE* _pcktWriting;
        FILE* _pcktRecvDump;
        uint32 _pcktDumpFlags;
        float  _pcktReadSpeedRate;
        uint32 _pcktReadTimer;
        uint32 _pcktReadLastUpdate;
        ObjectGuid _recorderGuid;

        // Bot system
        std::stringstream _chatBotHistory;
        PlayerBotEntry* GetBot() { return m_bot; }
        void SetBot(PlayerBotEntry* b) { m_bot = b; }

        // Player online / socket offline system
        void SetDisconnectedSession(); // Remove from World::m_session. Used when an account gets disconnected.
        bool UpdateDisconnected(uint32 diff);
        bool IsConnected() const { return m_connected; }
        void KickDisconnectedFromWorld() { m_disconnectTimer = 0; }
        bool m_connected;
        uint32 m_disconnectTimer;

        // Warden / Anticheat
        void InitWarden(BigNumber* K);
        bool AllowPacket(uint16 opcode);
        void ProcessAnticheatAction(const char* detector, const char* reason, uint32 action, uint32 banTime = 0 /* Perm ban */);
        uint32 GetLastReceivedPacketTime() const { return m_lastReceivedPacketTime; }
        void AddClientIdentifier(uint32 i, std::string str);
        ClientIdentifiersMap const& GetClientIdentifiers() const { return _clientIdentifiers; }
        void ComputeClientHash();
        bool IsClientHashComputed() const { return _clientHashComputeStep != HASH_NOT_COMPUTED; }

        WardenInterface* GetWarden() const { return m_warden; }

        void AddScript(std::string name, WorldSessionScript* script)
        {
            scripts[name] = script;
        }
        WorldSessionScript* GetScriptByName(std::string name)
        {
            SessionScriptsMap::iterator it = scripts.find(name);
            if (it == scripts.end())
                return NULL;
            return it->second;
        }
        SessionScriptsMap scripts;

        void ClearIncomingPacketsByType(PacketProcessing type);
        inline bool HasRecentPacket(PacketProcessing type) const { return _receivedPacketType[type]; }

        void SetReceivedWhoRequest(bool v) { m_who_recvd = v; }
        bool ReceivedWhoRequest() const { return m_who_recvd; }
        bool m_who_recvd;

        void SetReceivedAHListRequest(bool v) { m_ah_list_recvd = v; }
        bool ReceivedAHListRequest() const { return m_ah_list_recvd; }
        bool m_ah_list_recvd;

        void AddonDetected(std::string const& addon) { _addons.insert(addon); }
        std::set<std::string> const& GetAddons() const { return _addons; }
        void SetScheduleBan(const char* reason, uint32 atLevel)
        {
            _scheduleBanReason  = reason;
            _scheduleBanLevel   = atLevel;
        }
        bool ShouldBeBanned(uint32 currentLevel) const;
        std::string const& GetScheduleBanReason() const { return _scheduleBanReason; }
        std::string _scheduleBanReason;
        uint32      _scheduleBanLevel;

        void SetAccountFlags(uint32 f) { _accountFlags = f; }
        uint32 GetAccountFlags() const { return _accountFlags; }
        uint32      _accountFlags;

        uint32 m_idleTime;

    public:                                                 // opcodes handlers

        void Handle_NULL(WorldPacket& recvPacket);          // not used
        void Handle_EarlyProccess( WorldPacket& recvPacket);// just mark packets processed in WorldSocket::OnRead
        void Handle_ServerSide(WorldPacket& recvPacket);    // sever side only, can't be accepted from client
        void Handle_Deprecated(WorldPacket& recvPacket);    // never used anymore by client

        void HandleCharEnumOpcode(WorldPacket& recvPacket);
        void HandleCharDeleteOpcode(WorldPacket& recvPacket);
        void HandleCharCreateOpcode(WorldPacket& recvPacket);
        void HandlePlayerLoginOpcode(WorldPacket& recvPacket);
        void HandleCharEnum(QueryResult * result);
        void HandlePlayerLogin(LoginQueryHolder * holder);

        // played time
        void HandlePlayedTime(WorldPacket& recvPacket);

        // new
        void HandleMoveUnRootAck(WorldPacket& recvPacket);
        void HandleMoveRootAck(WorldPacket& recvPacket);

        // new inspect
        void HandleInspectOpcode(WorldPacket& recvPacket);

        // new party stats
        void HandleInspectHonorStatsOpcode(WorldPacket& recvPacket);

        void HandleMoveWaterWalkAck(WorldPacket& recvPacket);
        void HandleFeatherFallAck(WorldPacket &recv_data);

        void HandleMoveHoverAck( WorldPacket & recv_data );

        void HandleMountSpecialAnimOpcode(WorldPacket &recvdata);

        // character view
        void HandleShowingHelmOpcode(WorldPacket& recv_data);
        void HandleShowingCloakOpcode(WorldPacket& recv_data);

        // repair
        void HandleRepairItemOpcode(WorldPacket& recvPacket);

        // Knockback
        void HandleMoveKnockBackAck(WorldPacket& recvPacket);

        void HandleMoveTeleportAckOpcode(WorldPacket& recvPacket);
        void HandleForceSpeedChangeAckOpcodes( WorldPacket & recv_data );

        void HandlePingOpcode(WorldPacket& recvPacket);
        void HandleAuthSessionOpcode(WorldPacket& recvPacket);
        void HandleRepopRequestOpcode(WorldPacket& recvPacket);
        void HandleAutostoreLootItemOpcode(WorldPacket& recvPacket);
        void HandleLootMoneyOpcode(WorldPacket& recvPacket);
        void HandleLootOpcode(WorldPacket& recvPacket);
        void HandleLootReleaseOpcode(WorldPacket& recvPacket);
        void HandleLootMasterGiveOpcode(WorldPacket& recvPacket);
        void HandleWhoOpcode(WorldPacket& recvPacket);
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
        static void HandleAddFriendOpcodeCallBack(QueryResult *result, uint32 accountId);
        void HandleDelFriendOpcode(WorldPacket& recvPacket);
        void HandleAddIgnoreOpcode(WorldPacket& recvPacket);
        static void HandleAddIgnoreOpcodeCallBack(QueryResult *result, uint32 accountId);
        void HandleDelIgnoreOpcode(WorldPacket& recvPacket);
        void HandleBugOpcode(WorldPacket& recvPacket);
        void HandleSetAmmoOpcode(WorldPacket& recvPacket);
        void HandleItemNameQueryOpcode(WorldPacket& recvPacket);

        void HandleAreaTriggerOpcode(WorldPacket& recvPacket);

        void HandleSetFactionAtWarOpcode( WorldPacket & recv_data );
        void HandleSetWatchedFactionOpcode(WorldPacket & recv_data);
        void HandleSetFactionInactiveOpcode(WorldPacket & recv_data);

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

        void HandleMoveWorldportAckOpcode(WorldPacket& recvPacket);
        void HandleMoveWorldportAckOpcode();                // for server-side calls

        void HandleMovementOpcodes(WorldPacket& recvPacket);
        void HandleSetActiveMoverOpcode(WorldPacket &recv_data);
        void HandleMoveNotActiveMoverOpcode(WorldPacket &recv_data);
        void HandleMoveTimeSkippedOpcode(WorldPacket &recv_data);

        void HandleRequestRaidInfoOpcode( WorldPacket & recv_data );

        void HandleGroupInviteOpcode(WorldPacket& recvPacket);
        void HandleGroupAcceptOpcode(WorldPacket& recvPacket);
        void HandleGroupDeclineOpcode(WorldPacket& recvPacket);
        void HandleGroupUninviteOpcode(WorldPacket& recvPacket);
        void HandleGroupUninviteGuidOpcode(WorldPacket& recvPacket);
        void HandleGroupSetLeaderOpcode(WorldPacket& recvPacket);
        void HandleGroupDisbandOpcode(WorldPacket& recvPacket);
        void HandleLootMethodOpcode(WorldPacket& recvPacket);
        void HandleLootRoll( WorldPacket &recv_data );
        void HandleRequestPartyMemberStatsOpcode( WorldPacket &recv_data );
        void HandleRaidTargetUpdateOpcode( WorldPacket & recv_data );
        void HandleRaidReadyCheckOpcode( WorldPacket & recv_data );
        void HandleGroupRaidConvertOpcode( WorldPacket & recv_data );
        void HandleGroupChangeSubGroupOpcode( WorldPacket & recv_data );
        void HandleGroupSwapSubGroupOpcode( WorldPacket & recv_data );
        void HandleGroupAssistantLeaderOpcode( WorldPacket & recv_data );

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
        void HandleMoveSplineDoneOpcode(WorldPacket& recvPacket);

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
        void HandleAuctionListItems( WorldPacket & recv_data );
        void HandleAuctionListBidderItems( WorldPacket & recv_data );
        void HandleAuctionSellItem( WorldPacket & recv_data );
        void HandleAuctionRemoveItem( WorldPacket & recv_data );
        void HandleAuctionListOwnerItems( WorldPacket & recv_data );
        void HandleAuctionPlaceBid( WorldPacket & recv_data );

        void HandleGetMailList( WorldPacket & recv_data );
        void HandleSendMail( WorldPacket & recv_data );
        class AsyncMailSendRequest;
        void HandleSendMailCallback(AsyncMailSendRequest* req);
        void HandleMailTakeMoney( WorldPacket & recv_data );
        void HandleMailTakeItem( WorldPacket & recv_data );
        void HandleMailMarkAsRead( WorldPacket & recv_data );
        void HandleMailReturnToSender( WorldPacket & recv_data );
        void HandleMailDelete( WorldPacket & recv_data );
        void HandleItemTextQuery( WorldPacket & recv_data);
        void HandleMailCreateTextItem(WorldPacket & recv_data );
        void HandleQueryNextMailTime(WorldPacket & recv_data );
        void HandleCancelChanneling(WorldPacket & recv_data );

        void SendItemPageInfo( ItemPrototype *itemProto );
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
        void HandleAutoEquipItemSlotOpcode(WorldPacket & recvPacket);
        void HandleSwapItem( WorldPacket & recvPacket);
        void HandleBuybackItem(WorldPacket & recvPacket);
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
        void HandleQuestgiverCancel(WorldPacket& recv_data );
        void HandleQuestLogSwapQuest(WorldPacket& recv_data );
        void HandleQuestLogRemoveQuest(WorldPacket& recv_data);
        void HandleQuestConfirmAccept(WorldPacket& recv_data);
        void HandleQuestgiverCompleteQuest(WorldPacket& recv_data);
        void HandleQuestgiverQuestAutoLaunch(WorldPacket& recvPacket);
        void HandlePushQuestToParty(WorldPacket& recvPacket);
        void HandleQuestPushResult(WorldPacket& recvPacket);

        bool processChatmessageFurtherAfterSecurityChecks(std::string&, uint32);
        void SendPlayerNotFoundNotice(std::string name);
        void SendWrongFactionNotice();
        void SendChatRestrictedNotice();
        void HandleMessagechatOpcode(WorldPacket& recvPacket);
        void HandleTextEmoteOpcode(WorldPacket& recvPacket);
        void HandleChatIgnoredOpcode(WorldPacket& recvPacket);

        void HandleReclaimCorpseOpcode( WorldPacket& recvPacket );
        void HandleCorpseQueryOpcode( WorldPacket& recvPacket );
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

        void HandleTutorialFlagOpcode ( WorldPacket & recv_data );
        void HandleTutorialClearOpcode( WorldPacket & recv_data );
        void HandleTutorialResetOpcode( WorldPacket & recv_data );

        //Pet
        void HandlePetAction( WorldPacket & recv_data );
        void HandlePetStopAttack(WorldPacket& recv_data);
        void HandlePetNameQueryOpcode( WorldPacket & recv_data );
        void HandlePetSetAction( WorldPacket & recv_data );
        void HandlePetAbandon( WorldPacket & recv_data );
        void HandlePetRename( WorldPacket & recv_data );
        void HandlePetCancelAuraOpcode( WorldPacket& recvPacket );
        void HandlePetUnlearnOpcode( WorldPacket& recvPacket );
        void HandlePetSpellAutocastOpcode( WorldPacket& recvPacket );
        void HandlePetCastSpellOpcode( WorldPacket& recvPacket );

        void HandleSetActionBarTogglesOpcode(WorldPacket& recv_data);

        void HandleCharRenameOpcode(WorldPacket& recv_data);
        static void HandleChangePlayerNameOpcodeCallBack(QueryResult *result, uint32 accountId, std::string newname);

        //BattleGround
		void HandleBattlefieldJoinOpcode( WorldPacket &recv_data );
        void HandleBattlemasterHelloOpcode(WorldPacket &recv_data);
        void HandleBattlemasterJoinOpcode(WorldPacket &recv_data);
        void HandleBattleGroundPlayerPositionsOpcode(WorldPacket& recv_data);
        void HandlePVPLogDataOpcode( WorldPacket &recv_data );
        void HandleBattlefieldStatusOpcode(WorldPacket &recv_data);
        void HandleBattleFieldPortOpcode( WorldPacket &recv_data );
        void HandleBattlefieldListOpcode( WorldPacket &recv_data );
        void HandleLeaveBattlefieldOpcode( WorldPacket &recv_data );

        void HandleWardenDataOpcode(WorldPacket& recv_data);
        void HandleWorldTeleportOpcode(WorldPacket& recv_data);
        void HandleMoveSetRawPosition(WorldPacket& recv_data);
        void HandleMinimapPingOpcode(WorldPacket& recv_data);
        void HandleRandomRollOpcode(WorldPacket& recv_data);
        void HandleFarSightOpcode(WorldPacket& recv_data);
        void HandleWhoisOpcode(WorldPacket& recv_data);
        void HandleResetInstancesOpcode(WorldPacket& recv_data);

        void HandleAreaSpiritHealerQueryOpcode(WorldPacket& recv_data);
        void HandleAreaSpiritHealerQueueOpcode(WorldPacket& recv_data);
        void HandleSelfResOpcode(WorldPacket& recv_data);
        void HandleRequestPetInfoOpcode(WorldPacket& recv_data);
    private:
        // private trade methods
        void moveItems(Item* myItems[], Item* hisItems[]);
        bool CanUseBank(ObjectGuid bankerGUID = ObjectGuid()) const;
        ObjectGuid m_currentBankerGUID;

        bool VerifyMovementInfo(MovementInfo const& movementInfo, ObjectGuid const& guid) const;
        bool VerifyMovementInfo(MovementInfo const& movementInfo) const;
        void HandleMoverRelocation(MovementInfo& movementInfo);

        void ExecuteOpcode( OpcodeHandler const& opHandle, WorldPacket* packet );

        // logging helper
        void LogUnexpectedOpcode(WorldPacket *packet, const char * reason);
        void LogUnprocessedTail(WorldPacket *packet);

        Player *_player;
        ObjectGuid _clientMoverGuid;
        WorldSocket *m_Socket;
        std::string m_Address;

        AccountTypes _security;
        uint32 _accountId;

        time_t _logoutTime;
        bool m_inQueue;                                     // session wait in auth.queue
        bool m_playerLoading;                               // code processed in LoginPlayer
        bool m_playerLogout;                                // code processed in LogoutPlayer
        bool m_playerRecentlyLogout;
        bool m_playerSave;
        LocaleConstant m_sessionDbcLocale;
        int m_sessionDbLocaleIndex;
        uint32 m_latency;
        uint32 m_Tutorials[ACCOUNT_TUTORIALS_COUNT];
        TutorialDataState m_tutorialState;
        ACE_Based::LockedQueue<WorldPacket*, ACE_Thread_Mutex> _recvQueue[PACKET_PROCESS_MAX_TYPE];
        bool _receivedPacketType[PACKET_PROCESS_MAX_TYPE];

        WardenInterface* m_warden;
        std::string m_username;
        uint32 _floodPacketsCount[FLOOD_MAX_OPCODES_TYPE];
        PlayerBotEntry* m_bot;
        uint32 m_lastReceivedPacketTime;
        ClientIdentifiersMap _clientIdentifiers;
        std::string     _clientHash;
        ClientOSType    _clientOS;
        uint32          _gameBuild;
        uint32          _charactersCount;
        uint32          _characterMaxLevel;
        enum ClientHashStep
        {
            HASH_NOT_COMPUTED,
            HASH_COMPUTED,
            HASH_NOTIFIED,
        };
        ClientHashStep  _clientHashComputeStep;

        std::set<std::string> _addons;

        /// Clustering system
    public:
        uint32 GenerateItemLowGuid();
        uint32 GeneratePetNumber();
        NodeSession* GetMasterSession() const { return m_masterSession; }
        void SetMasterSession(NodeSession* s) { m_masterSession = s; }
        NodeSession* GetNodeSession() const { return m_nodeSession; }
        void SetNodeSession(NodeSession* s) { m_nodeSession = s; }
        bool IsNode() const { return m_nodeSession == nullptr; }
        bool IsMaster() const { return m_masterSession == nullptr; }
        MasterPlayer* GetMasterPlayer() const { return m_masterPlayer; }
        PlayerPointer GetPlayerPointer() const
        {
            if (_player)
                return PlayerPointer(new PlayerWrapper<Player>(_player));
            if (GetMasterPlayer())
                return PlayerPointer(new PlayerWrapper<MasterPlayer>(GetMasterPlayer()));
            return PlayerPointer(nullptr);
        }

        /**
         * @brief Interrupts current packet handler and forwards packet to Master.
         * If we are the master, the function returns without doing anything.
         */
        void ForwardPacketToMaster();
        /**
         * @brief Interrupts current packet handler and forwards packet to Node.
         * If we are the node, the function returns without doing anything.
         */
        void ForwardPacketToNode();
        /**
         * @brief Will login current player to given node.
         * The player should not be on a map, SMSG_TRANSFER_PENDING has already been sent
         * @param s
         */
        void LoginPlayerToNode(NodeSession* s);
    protected:
        NodeSession*    m_masterSession;
        NodeSession*    m_nodeSession;
        MasterPlayer*   m_masterPlayer;
        /// End of clustering system
};
#endif
/// @}
