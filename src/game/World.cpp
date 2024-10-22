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

/** \file
    \ingroup world
*/

#include "World.h"
#include "Database/DatabaseEnv.h"
#include "Config/Config.h"
#include "Platform/Define.h"
#include "SystemConfig.h"
#include "Log.h"
#include "Opcodes.h"
#include "WorldSession.h"
#include "WorldPacket.h"
#include "Weather.h"
#include "Player.h"
#include "Group.h"
#include "AccountMgr.h"
#include "AuctionHouseMgr.h"
#include "ObjectMgr.h"
#include "CreatureEventAIMgr.h"
#include "GuildMgr.h"
#include "SpellMgr.h"
#include "Chat.h"
#include "DBCStores.h"
#include "MassMailMgr.h"
#include "LootMgr.h"
#include "ItemEnchantmentMgr.h"
#include "MapManager.h"
#include "ScriptMgr.h"
#include "CreatureAIRegistry.h"
#include "Policies/SingletonImp.h"
#include "BattleGroundMgr.h"
#include "VMapFactory.h"
#include "GameEventMgr.h"
#include "PoolManager.h"
#include "Database/DatabaseImpl.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "MapPersistentStateMgr.h"
#include "WaypointManager.h"
#include "GMTicketMgr.h"
#include "Util.h"
#include "CharacterDatabaseCleaner.h"
#include "LFGMgr.h"
#include "AutoBroadCastMgr.h"
#include "AuctionHouseBotMgr.h"
#include "Transports/TransportMgr.h"
#include "PlayerBotMgr.h"
#include "ZoneScriptMgr.h"
#include "CharacterDatabaseCache.h"
#include "CreatureGroups.h"
#include "MoveMap.h"
#include "SpellModMgr.h"
#include "Anticheat.h"
#include "MovementBroadcaster.h"
#include "HonorMgr.h"
#include "Anticheat/Anticheat.h"
#include "ThreadPool.h"
#include "AuraRemovalMgr.h"
#include "InstanceStatistics.h"
#include "GuardMgr.h"
#include "TransportMgr.h"
#include "IO/Multithreading/CreateThread.h"

#include <chrono>

INSTANTIATE_SINGLETON_1(World);

volatile bool World::m_stopEvent = false;
uint8 World::m_ExitCode = SHUTDOWN_EXIT_CODE;
volatile uint32 World::m_worldLoopCounter = 0;

float World::m_MaxVisibleDistanceOnContinents = DEFAULT_VISIBILITY_DISTANCE;
float World::m_MaxVisibleDistanceInInstances  = DEFAULT_VISIBILITY_INSTANCE;
float World::m_MaxVisibleDistanceInBG         = DEFAULT_VISIBILITY_BG;

float World::m_MaxVisibleDistanceInFlight     = DEFAULT_VISIBILITY_DISTANCE;
float World::m_VisibleUnitGreyDistance        = 0;
float World::m_VisibleObjectGreyDistance      = 0;

float  World::m_relocation_lower_limit_sq     = 10.f * 10.f;
uint32 World::m_relocation_ai_notify_delay    = 1000u;

uint32 World::m_currentMSTime = 0;
TimePoint World::m_currentTime = TimePoint();
uint32 World::m_currentDiff = 0;

void LoadGameObjectModelList();

World& GetSWorld()
{
    return sWorld;
}

// World constructor
World::World():
    m_playerLimit(0),
    m_allowMovement(true),
    m_gameTime(time(nullptr)),
    m_timeZoneOffset(0),
    m_gameDay((m_gameTime + m_timeZoneOffset) / DAY),
    m_startTime(m_gameTime),
    m_wowPatch(WOW_PATCH_102),
    m_defaultDbcLocale(LOCALE_enUS),
    m_timeRate(1.0f),
    m_canProcessAsyncPackets(false)
{
    m_ShutdownMask = 0;
    m_ShutdownTimer = 0;
    m_maxActiveSessionCount = 0;
    m_maxQueuedSessionCount = 0;
    m_MaintenanceTimeChecker = 0;
    m_anticrashRearmTimer = 0;

    m_defaultDbcLocale = LOCALE_enUS;
    m_availableDbcLocaleMask = 0;

    for (uint32 & value : m_configUint32Values)
        value = 0;

    for (int32 & value : m_configInt32Values)
        value = 0;

    for (float & value : m_configFloatValues)
        value = 0.0f;

    for (bool & value : m_configBoolValues)
        value = false;

    m_timeRate = 1.0f;
    m_charDbWorkerThread    = nullptr;
}

// World destructor
World::~World()
{
    // Empty the kicked session set
    while (!m_sessions.empty())
    {
        // not remove from queue, prevent loading new sessions
        delete m_sessions.begin()->second;
        m_sessions.erase(m_sessions.begin());
    }

    CliCommandHolder* command = nullptr;
    while (cliCmdQueue.next(command))
        delete command;

    VMAP::VMapFactory::clear();

    if (m_charDbWorkerThread)
    {
        if (m_charDbWorkerThread->joinable())
            m_charDbWorkerThread->join();
        m_charDbWorkerThread.reset(nullptr);
    }

    if (m_lfgQueueThread)
    {
        if (m_lfgQueueThread->joinable())
            m_lfgQueueThread->join();
        m_lfgQueueThread.reset(nullptr);
    }

    if (m_asyncPacketsThread)
    {
        if (m_asyncPacketsThread->joinable())
            m_asyncPacketsThread->join();
        m_asyncPacketsThread.reset(nullptr);
    }

    //TODO free addSessQueue
}

void World::Shutdown()
{
    sPlayerBotMgr.DeleteAll();
    KickAll();                                     // save and kick all players
    UpdateSessions(1);                             // real players unload required UpdateSessions call

    if (m_charDbWorkerThread && m_charDbWorkerThread->joinable())
        m_charDbWorkerThread->join();

    if (m_lfgQueueThread && m_lfgQueueThread->joinable())
        m_lfgQueueThread->join();

    if (m_asyncPacketsThread && m_asyncPacketsThread->joinable())
        m_asyncPacketsThread->join();

    sAnticheatMgr->StopWardenUpdateThread();
}

/// Find a session by its accountId. Might return nullptr if not found.
WorldSession* World::FindSession(uint32 accountId) const
{
    SessionMap::const_iterator itr = m_sessions.find(accountId);

    if (itr != m_sessions.end())
        return itr->second;                                 // also can return nullptr for kicked session

    return nullptr;
}

/// Remove a given session by its accountId
bool World::RemoveSession(uint32 accountId)
{
    // Find the session, kick the user, but we can't delete session at this moment to prevent iterator invalidation
    SessionMap::const_iterator itr = m_sessions.find(accountId);

    if (itr != m_sessions.end() && itr->second)
    {
        if (itr->second->PlayerLoading())
            return false;

        itr->second->KickPlayer();
    }

    return true;
}

void World::AddSession(WorldSession* s)
{
    addSessQueue.add(s);
}

void World::AddSessionToSessionsMap(WorldSession* sess)
{
    m_sessions[sess->GetAccountId()] = sess;
}

void World::AddSession_(WorldSession* s)
{
    MANGOS_ASSERT(s);

    // NOTE - Still there is race condition in WorldSession* being used in the Sockets

    // kick already loaded player with same account (if any) and remove session
    // if player is in loading and want to load again, return
    if (!RemoveSession(s->GetAccountId()))
    {
        s->KickPlayer();
        delete s;                                           // session not added yet in session list, so not listed in queue
        return;
    }

    // decrease session counts only at not reconnection case
    bool decrease_session = true;

    // if session already exist, prepare to it deleting at next world update
    // NOTE - KickPlayer() should be called on "old" in RemoveSession()
    {
        SessionMap::const_iterator old = m_sessions.find(s->GetAccountId());

        if (old != m_sessions.end())
        {
            // prevent decrease sessions count if session queued
            if (RemoveQueuedSession(old->second))
                decrease_session = false;

            // don't allow resetting consecutive play time on double login to same account
            s->SetPreviousPlayedTime(old->second->GetConsecutivePlayTime(time(nullptr)));

            // player is not kept in world so session can be deleted
            if (!old->second->ForcePlayerLogoutDelay())
                delete old->second;
        }
        else
        {
            auto itr = m_accountsPlayHistory.find(s->GetAccountId());
            if (itr != m_accountsPlayHistory.end())
            {
                if ((time(nullptr) - itr->second.logoutTime) < PLAY_TIME_LIMIT_FULL)
                    s->SetPreviousPlayedTime(itr->second.playedTime);
                else
                    itr->second.playedTime = 0;
            }
        }
    }

    m_sessions[s->GetAccountId()] = s;

    uint32 activeSessions = GetActiveSessionCount();
    uint32 playerLimit = GetPlayerAmountLimit();
    uint32 queuedSessions = GetQueuedSessionCount();             //number of players in the queue

    //so we don't count the user trying to
    //login as a session and queue the socket that we are using
    if (decrease_session && activeSessions)
        --activeSessions;

    if (playerLimit > 0 && activeSessions >= playerLimit && !CanSkipQueue(s))
    {
        AddQueuedSession(s);
        UpdateMaxSessionCounters();
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "PlayerQueue: Account id %u is in Queue Position (%u).", s->GetAccountId(), ++queuedSessions);
        return;
    }

    // Checked for 1.12.2
    WorldPacket packet(SMSG_AUTH_RESPONSE, 1 + 4 + 1 + 4);
    packet << uint8(AUTH_OK);
    packet << uint32(0);                                    // BillingTimeRemaining
                                                            // BillingPlanFlags
    packet << uint8(s->HasTrialRestrictions() ? (BILLING_FLAG_TRIAL | BILLING_FLAG_RESTRICTED) : BILLING_FLAG_NONE); 
    packet << uint32(0);                                    // BillingTimeRested
    s->SendPacket(&packet);

    UpdateMaxSessionCounters();

    // Only init warden after session has been added
    s->InitWarden();

    // Updates the population
    if (playerLimit > 0)
    {
        float popu = float(GetActiveSessionCount());        // updated number of users on the server
        popu /= playerLimit;
        popu *= 2;

        static SqlStatementID id;

        SqlStatement stmt = LoginDatabase.CreateStatement(id, "UPDATE `realmlist` SET `population` = ? WHERE `id` = ?");
        stmt.PExecute(popu, realmID);

        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Server Population (%f).", popu);
    }
}

uint32 World::GetQueuedSessionPos(WorldSession* sess)
{
    uint32 position = 1;

    for (Queue::const_iterator iter = m_QueuedSessions.begin(); iter != m_QueuedSessions.end(); ++iter, ++position)
        if ((*iter) == sess)
            return position;

    return 0;
}

void World::AddQueuedSession(WorldSession* sess)
{
    sess->SetInQueue(true);
    m_QueuedSessions.push_back(sess);

    // [-ZERO] Possible wrong
    // The 1st SMSG_AUTH_RESPONSE needs to contain other info too.
    WorldPacket packet(SMSG_AUTH_RESPONSE, 1 + 4 + 1 + 4 + 4);
    packet << uint8(AUTH_WAIT_QUEUE);
    packet << uint32(0);                                    // BillingTimeRemaining
                                                            // BillingPlanFlags
    packet << uint8(sess->HasTrialRestrictions() ? (BILLING_FLAG_TRIAL | BILLING_FLAG_RESTRICTED) : BILLING_FLAG_NONE); 
    packet << uint32(0);                                    // BillingTimeRested
    packet << uint32(GetQueuedSessionPos(sess));            // position in queue
    sess->SendPacket(&packet);

    //sess->SendAuthWaitQue (GetQueuePos (sess));
}

bool World::RemoveQueuedSession(WorldSession* sess)
{
    // sessions count including queued to remove (if removed_session set)
    uint32 sessions = GetActiveSessionCount();

    uint32 position = 1;
    Queue::iterator iter = m_QueuedSessions.begin();

    // search to remove and count skipped positions
    bool found = false;

    for (; iter != m_QueuedSessions.end(); ++iter, ++position)
    {
        if (*iter == sess)
        {
            sess->SetInQueue(false);
            iter = m_QueuedSessions.erase(iter);
            found = true;                                   // removing queued session
            break;
        }
    }

    // iter point to next socked after removed or end()
    // position store position of removed socket and then new position next socket after removed

    // if session not queued then we need decrease sessions count
    if (!found && sessions)
        --sessions;

    uint32 loggedInSessions = uint32(m_sessions.size() - m_QueuedSessions.size());
    if (loggedInSessions > getConfig(CONFIG_UINT32_PLAYER_HARD_LIMIT))
        return found;
    
    // accept first in queue
    if ((!m_playerLimit || (int32)sessions <= m_playerLimit) && !m_QueuedSessions.empty())
    {
        WorldSession* pop_sess = m_QueuedSessions.front();
        pop_sess->SetInQueue(false);
        pop_sess->m_idleTime = WorldTimer::getMSTime();
        pop_sess->SendAuthWaitQue(0);
        pop_sess->InitWarden();
        m_QueuedSessions.pop_front();

        // update iter to point first queued socket or end() if queue is empty now
        iter = m_QueuedSessions.begin();
        position = 1;
    }

    // update position from iter to end()
    // iter point to first not updated socket, position store new position
    for (; iter != m_QueuedSessions.end(); ++iter, ++position)
        (*iter)->SendAuthWaitQue(position);

    return found;
}

// Initialize config values
void World::LoadConfigSettings(bool reload)
{
    if (reload)
    {
        if (!sConfig.Reload())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "World settings reload fail: can't read settings from %s.", sConfig.GetFilename().c_str());
            return;
        }
    }

    // Read the version of the configuration file and warn the user in case of emptiness or mismatch
    uint32 confVersion = sConfig.GetIntDefault("ConfVersion", 0);
    if (!confVersion)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "*****************************************************************************");
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, " WARNING: mangosd.conf does not include a ConfVersion variable.");
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "          Your configuration file may be out of date!");
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "*****************************************************************************");
        Log::WaitBeforeContinueIfNeed();
    }
    else
    {
        if (confVersion < _MANGOSDCONFVERSION)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "*****************************************************************************");
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, " WARNING: Your mangosd.conf version indicates your conf file is out of date!");
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "          Please check for updates, as your current default values may cause");
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "          unexpected behavior.");
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "*****************************************************************************");
            Log::WaitBeforeContinueIfNeed();
        }
    }

    // Set the available content patch.
    m_wowPatch = sConfig.GetIntDefault("WowPatch", WOW_PATCH_102);

    if (m_wowPatch > MAX_CONTENT_PATCH)
        m_wowPatch = MAX_CONTENT_PATCH;

    // Read the player limit and the Message of the day from the config file
    SetPlayerLimit(sConfig.GetIntDefault("PlayerLimit", DEFAULT_PLAYER_LIMIT), true);
    SetMotd(sConfig.GetStringDefault("Motd", "Welcome to the Massive Network Game Object Server.") + std::string("\n") + std::string(GetPatchName()) + std::string(" is now live!"));

    // Read all rates from the config file
    setConfigPos(CONFIG_FLOAT_RATE_HEALTH,               "Rate.Health", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_POWER_MANA,           "Rate.Mana", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_POWER_RAGE_INCOME,       "Rate.Rage.Income", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_POWER_RAGE_LOSS,      "Rate.Rage.Loss", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_POWER_FOCUS,             "Rate.Focus", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_LOYALTY,              "Rate.Loyalty", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_POWER_ENERGY,            "Rate.Energy", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_POOR,       "Rate.Drop.Item.Poor",       1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_NORMAL,     "Rate.Drop.Item.Normal",     1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_UNCOMMON,   "Rate.Drop.Item.Uncommon",   1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_RARE,       "Rate.Drop.Item.Rare",       1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_EPIC,       "Rate.Drop.Item.Epic",       1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_LEGENDARY,  "Rate.Drop.Item.Legendary",  1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_ARTIFACT,   "Rate.Drop.Item.Artifact",   1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_ITEM_REFERENCED, "Rate.Drop.Item.Referenced", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DROP_MONEY,           "Rate.Drop.Money", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_XP_KILL,                 "Rate.XP.Kill",    1.0f);
    setConfig(CONFIG_FLOAT_RATE_XP_KILL_ELITE,           "Rate.XP.Kill.Elite",    1.0f);
    setConfig(CONFIG_FLOAT_RATE_XP_QUEST,                "Rate.XP.Quest",   1.0f);
    setConfig(CONFIG_FLOAT_RATE_XP_EXPLORE,              "Rate.XP.Explore", 1.0f);
    setConfigMin(CONFIG_FLOAT_RATE_XP_PERSONAL_MIN,      "Rate.XP.Personal.Min", 1.0f, 0.0f);
    setConfigMin(CONFIG_FLOAT_RATE_XP_PERSONAL_MAX,      "Rate.XP.Personal.Max", 1.0f, 0.0f);
    setConfig(CONFIG_FLOAT_RATE_REPUTATION_GAIN,           "Rate.Reputation.Gain", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_REPUTATION_LOWLEVEL_KILL,  "Rate.Reputation.LowLevel.Kill", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_REPUTATION_LOWLEVEL_QUEST, "Rate.Reputation.LowLevel.Quest", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_NORMAL_DAMAGE,               "Rate.Creature.Normal.Damage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_DAMAGE,          "Rate.Creature.Elite.Elite.Damage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_RAREELITE_DAMAGE,      "Rate.Creature.Elite.RAREELITE.Damage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_WORLDBOSS_DAMAGE,      "Rate.Creature.Elite.WORLDBOSS.Damage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_RARE_DAMAGE,           "Rate.Creature.Elite.RARE.Damage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_NORMAL_HP,                   "Rate.Creature.Normal.HP", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_HP,              "Rate.Creature.Elite.Elite.HP", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_RAREELITE_HP,          "Rate.Creature.Elite.RAREELITE.HP", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_WORLDBOSS_HP,          "Rate.Creature.Elite.WORLDBOSS.HP", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_RARE_HP,               "Rate.Creature.Elite.RARE.HP", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_NORMAL_SPELLDAMAGE,          "Rate.Creature.Normal.SpellDamage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_ELITE_SPELLDAMAGE,     "Rate.Creature.Elite.Elite.SpellDamage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_RAREELITE_SPELLDAMAGE, "Rate.Creature.Elite.RAREELITE.SpellDamage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_WORLDBOSS_SPELLDAMAGE, "Rate.Creature.Elite.WORLDBOSS.SpellDamage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_ELITE_RARE_SPELLDAMAGE,      "Rate.Creature.Elite.RARE.SpellDamage", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CREATURE_AGGRO,              "Rate.Creature.Aggro", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_REST_INGAME,                    "Rate.Rest.InGame", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_REST_OFFLINE_IN_TAVERN_OR_CITY, "Rate.Rest.Offline.InTavernOrCity", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_REST_OFFLINE_IN_WILDERNESS,     "Rate.Rest.Offline.InWilderness", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_DAMAGE_FALL,                 "Rate.Damage.Fall", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_AUCTION_TIME,                "Rate.Auction.Time", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_AUCTION_DEPOSIT,                "Rate.Auction.Deposit", 1.0f);
    setConfig(CONFIG_FLOAT_RATE_AUCTION_CUT,                    "Rate.Auction.Cut", 1.0f);
    setConfigPos(CONFIG_UINT32_AUCTION_DEPOSIT_MIN,             "Auction.Deposit.Min", 0);
    setConfig(CONFIG_UINT32_ACCOUNT_CONCURRENT_AUCTION_LIMIT,   "Auction.AccountConcurrentLimit", 0);
    setConfig(CONFIG_FLOAT_RATE_WAR_EFFORT_RESOURCE,            "Rate.WarEffortResourceComplete", 0.0f);
    setConfig(CONFIG_UINT32_WAR_EFFORT_AUTOCOMPLETE_PERIOD,     "WarEffortResourceCompletePeriod", 86400);
    setConfigPos(CONFIG_FLOAT_RATE_MINING_AMOUNT,       "Rate.Mining.Amount", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_MINING_NEXT,         "Rate.Mining.Next", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_INSTANCE_RESET_TIME, "Rate.InstanceResetTime", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_TALENT,              "Rate.Talent", 1.0f);
    setConfigPos(CONFIG_FLOAT_RATE_CORPSE_DECAY_LOOTED, "Rate.Corpse.Decay.Looted", 0.0f);
    setConfig(CONFIG_UINT32_RESPEC_BASE_COST,           "Rate.RespecBaseCost", 1);
    setConfig(CONFIG_UINT32_RESPEC_MULTIPLICATIVE_COST, "Rate.RespecMultiplicativeCost", 5);
    setConfig(CONFIG_UINT32_RESPEC_MIN_MULTIPLIER,      "Rate.RespecMinMultiplier", 2);
    setConfig(CONFIG_UINT32_RESPEC_MAX_MULTIPLIER,      "Rate.RespecMaxMultiplier", 10);

    setConfigMinMax(CONFIG_FLOAT_RATE_TARGET_POS_RECALCULATION_RANGE, "TargetPosRecalculateRange", 1.5f, CONTACT_DISTANCE, ATTACK_DISTANCE);

    setConfig(CONFIG_BOOL_DURABILITY_LOSS_ENABLE, "DurabilityLoss.Enable", true);
    setConfigPos(CONFIG_FLOAT_RATE_DURABILITY_LOSS_DAMAGE, "DurabilityLossChance.Damage", 0.5f);

    setConfigPos(CONFIG_FLOAT_LISTEN_RANGE_SAY,       "ListenRange.Say",       25.0f);
    setConfigPos(CONFIG_FLOAT_LISTEN_RANGE_YELL,      "ListenRange.Yell",     300.0f);
    setConfigPos(CONFIG_FLOAT_LISTEN_RANGE_TEXTEMOTE, "ListenRange.TextEmote", 25.0f);

    setConfigPos(CONFIG_FLOAT_GROUP_XP_DISTANCE, "MaxGroupXPDistance", 74.0f);

    setConfigPos(CONFIG_FLOAT_CREATURE_FAMILY_ASSISTANCE_RADIUS,      "CreatureFamilyAssistanceRadius",     10.0f);
    setConfigPos(CONFIG_FLOAT_CREATURE_FAMILY_FLEE_ASSISTANCE_RADIUS, "CreatureFamilyFleeAssistanceRadius", 30.0f);
    setConfig(CONFIG_FLOAT_THREAT_RADIUS, "ThreatRadius", 50.0f);
    setConfig(CONFIG_FLOAT_MAX_CREATURE_ATTACK_RADIUS, "MaxCreaturesAttackRadius", 40.0f);
    setConfig(CONFIG_FLOAT_MAX_PLAYERS_STEALTH_DETECT_RANGE, "MaxPlayersStealthDetectRange", 30.0f);
    setConfig(CONFIG_FLOAT_MAX_CREATURES_STEALTH_DETECT_RANGE, "MaxCreaturesStealthDetectRange", 30.0f);

    // Read other configuration items from the config file
    setConfig(CONFIG_UINT32_LOGIN_PER_TICK, "LoginPerTick", 0);
    setConfig(CONFIG_UINT32_PLAYER_HARD_LIMIT, "PlayerHardLimit", 0);
    setConfig(CONFIG_UINT32_LOGIN_QUEUE_GRACE_PERIOD_SECS, "LoginQueue.GracePeriodSecs", 0);
    setConfig(CONFIG_UINT32_CHARACTER_SCREEN_MAX_IDLE_TIME, "CharacterScreenMaxIdleTime", 0);
    setConfig(CONFIG_UINT32_ASYNC_QUERIES_TICK_TIMEOUT, "AsyncQueriesTickTimeout", 0);
    setConfigMinMax(CONFIG_UINT32_COMPRESSION_LEVEL, "Compression.Level", 1, 1, 9);
    setConfig(CONFIG_UINT32_COMPRESSION_UPDATE_SIZE, "Compression.Update.Size", 128);
    setConfig(CONFIG_UINT32_COMPRESSION_MOVEMENT_COUNT, "Compression.Movement.Count", 300);
    setConfig(CONFIG_BOOL_ADDON_CHANNEL, "AddonChannel", true);
    setConfig(CONFIG_BOOL_CLEAN_CHARACTER_DB, "CleanCharacterDB", true);
    setConfig(CONFIG_BOOL_GRID_UNLOAD, "GridUnload", true);
    setConfig(CONFIG_BOOL_CLEANUP_TERRAIN, "CleanupTerrain", true);
    setConfigPos(CONFIG_UINT32_INTERVAL_SAVE, "PlayerSave.Interval", 15 * MINUTE * IN_MILLISECONDS);
    setConfigMinMax(CONFIG_UINT32_MIN_LEVEL_STAT_SAVE, "PlayerSave.Stats.MinLevel", 0, 0, MAX_LEVEL);
    setConfig(CONFIG_BOOL_STATS_SAVE_ONLY_ON_LOGOUT, "PlayerSave.Stats.SaveOnlyOnLogout", true);

    setConfigMin(CONFIG_UINT32_INTERVAL_GRIDCLEAN, "GridCleanUpDelay", 5 * MINUTE * IN_MILLISECONDS, MIN_GRID_DELAY);
    if (reload)
        sMapMgr.SetGridCleanUpDelay(getConfig(CONFIG_UINT32_INTERVAL_GRIDCLEAN));

    setConfigMin(CONFIG_UINT32_INTERVAL_MAPUPDATE, "MapUpdateInterval", 100, MIN_MAP_UPDATE_DELAY);
    if (reload)
        sMapMgr.SetMapUpdateInterval(getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE));

    setConfig(CONFIG_UINT32_INTERVAL_CHANGEWEATHER, "ChangeWeatherInterval", 10 * MINUTE * IN_MILLISECONDS);

    if (configNoReload(reload, CONFIG_UINT32_PORT_WORLD, "WorldServerPort", DEFAULT_WORLDSERVER_PORT))
        setConfig(CONFIG_UINT32_PORT_WORLD, "WorldServerPort", DEFAULT_WORLDSERVER_PORT);

    if (configNoReload(reload, CONFIG_UINT32_GAME_TYPE, "GameType", 0))
        setConfig(CONFIG_UINT32_GAME_TYPE, "GameType", 0);

    if (configNoReload(reload, CONFIG_UINT32_REALM_ZONE, "RealmZone", REALM_ZONE_DEVELOPMENT))
        setConfig(CONFIG_UINT32_REALM_ZONE, "RealmZone", REALM_ZONE_DEVELOPMENT);

    m_timeZoneOffset = sConfig.GetIntDefault("TimeZoneOffset", 0) * HOUR;

    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_ACCOUNTS,            "AllowTwoSide.Accounts", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHAT,    "AllowTwoSide.Interaction.Chat", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHANNEL, "AllowTwoSide.Interaction.Channel", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP,   "AllowTwoSide.Interaction.Group", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GUILD,   "AllowTwoSide.Interaction.Guild", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_TRADE,   "AllowTwoSide.Interaction.Trade", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_AUCTION, "AllowTwoSide.Interaction.Auction", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_MAIL,    "AllowTwoSide.Interaction.Mail", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_WHO_LIST,            "AllowTwoSide.WhoList", false);
    setConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_ADD_FRIEND,          "AllowTwoSide.AddFriend", false);

    setConfig(CONFIG_UINT32_STRICT_PLAYER_NAMES,  "StrictPlayerNames",  0);
    setConfig(CONFIG_UINT32_STRICT_CHARTER_NAMES, "StrictCharterNames", 0);
    setConfig(CONFIG_UINT32_STRICT_PET_NAMES,     "StrictPetNames",     0);

    setConfigMinMax(CONFIG_UINT32_MIN_PLAYER_NAME,  "MinPlayerName",  2, 1, MAX_PLAYER_NAME);
    setConfigMinMax(CONFIG_UINT32_MIN_CHARTER_NAME, "MinCharterName", 2, 1, MAX_CHARTER_NAME);
    setConfigMinMax(CONFIG_UINT32_MIN_PET_NAME,     "MinPetName",     2, 1, MAX_PET_NAME);

    setConfig(CONFIG_BOOL_WORLD_AVAILABLE, "WorldAvailable", true);
    setConfig(CONFIG_UINT32_CHARACTERS_CREATING_DISABLED, "CharactersCreatingDisabled", 0);
    setConfigMinMax(CONFIG_UINT32_CHARACTERS_PER_REALM, "CharactersPerRealm", 10, 1, 10);
    setConfigMin(CONFIG_UINT32_CHARACTERS_PER_ACCOUNT, "CharactersPerAccount", 50, getConfig(CONFIG_UINT32_CHARACTERS_PER_REALM));
    setConfig(CONFIG_BOOL_LIMIT_PLAY_TIME, "LimitPlayTime", false);
    setConfig(CONFIG_BOOL_RESTRICT_UNVERIFIED_ACCOUNTS, "RestrictUnverifiedAccounts", false);

    setConfig(CONFIG_BOOL_SKIP_CINEMATICS, "SkipCinematics", false);
    setConfig(CONFIG_BOOL_OBJECT_HEALTH_VALUE_SHOW, "ShowHealthValues", false);
    if (configNoReload(reload, CONFIG_UINT32_MAX_PLAYER_LEVEL, "MaxPlayerLevel", PLAYER_MAX_LEVEL))
        setConfigMinMax(CONFIG_UINT32_MAX_PLAYER_LEVEL, "MaxPlayerLevel", PLAYER_MAX_LEVEL, 1, PLAYER_STRONG_MAX_LEVEL);
    setConfigMinMax(CONFIG_UINT32_START_PLAYER_LEVEL, "StartPlayerLevel", 1, 1, getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL));
    setConfigMinMax(CONFIG_UINT32_START_PLAYER_MONEY, "StartPlayerMoney", 0, 0, MAX_MONEY_AMOUNT);
    setConfig(CONFIG_UINT32_MIN_HONOR_KILLS, "MinHonorKills", 0);

    // If min honor kills is at 0, decide based on patch.
    if (getConfig(CONFIG_UINT32_MIN_HONOR_KILLS) == 0)
    {
        if (GetWowPatch() >= WOW_PATCH_110)
            setConfig(CONFIG_UINT32_MIN_HONOR_KILLS, MIN_HONOR_KILLS_POST_1_10);
        else
            setConfig(CONFIG_UINT32_MIN_HONOR_KILLS, MIN_HONOR_KILLS_PRE_1_10);
    }

    setConfigMinMax(CONFIG_FLOAT_RP_DECAY, "RpDecay", 0.2f, 0.0f, 1.0f);
    setConfigMinMax(CONFIG_UINT32_MAINTENANCE_DAY, "MaintenanceDay", 4, 0, 6);
    setConfig(CONFIG_BOOL_AUTO_HONOR_RESTART, "AutoHonorRestart", true);
    setConfig(CONFIG_BOOL_ALL_TAXI_PATHS, "AllFlightPaths", false);
    setConfig(CONFIG_BOOL_CAST_UNSTUCK, "CastUnstuck", true);
    setConfig(CONFIG_UINT32_MAX_SPELL_CASTS_IN_CHAIN, "MaxSpellCastsInChain", 10);

    setConfig(CONFIG_BOOL_INSTANCE_IGNORE_LEVEL, "Instance.IgnoreLevel", false);
    setConfig(CONFIG_BOOL_INSTANCE_IGNORE_RAID,  "Instance.IgnoreRaid", false);
    setConfig(CONFIG_UINT32_INSTANCE_RESET_TIME_HOUR, "Instance.ResetTimeHour", 4);
    setConfig(CONFIG_UINT32_INSTANCE_UNLOAD_DELAY,    "Instance.UnloadDelay", 30 * MINUTE * IN_MILLISECONDS);
    setConfig(CONFIG_UINT32_INSTANCE_PER_HOUR_LIMIT, "Instance.PerHourLimit", MAX_INSTANCE_PER_ACCOUNT_PER_HOUR);

    setConfig(CONFIG_UINT32_MAX_PRIMARY_TRADE_SKILL, "MaxPrimaryTradeSkill", 2);
    setConfigMinMax(CONFIG_UINT32_MIN_PETITION_SIGNS, "MinPetitionSigns", 9, 0, 9);

    setConfig(CONFIG_UINT32_GM_LOGIN_STATE,       "GM.LoginState",    2);
    setConfig(CONFIG_UINT32_GM_VISIBLE_STATE,     "GM.Visible",       2);
    setConfig(CONFIG_UINT32_GM_ACCEPT_TICKETS,    "GM.AcceptTickets", 2);
    setConfig(CONFIG_UINT32_GM_CHAT,              "GM.Chat",          2);
    setConfig(CONFIG_UINT32_GM_WISPERING_TO,      "GM.WhisperingTo",  2);
    setConfig(CONFIG_BOOL_GM_CHEAT_GOD,           "GM.CheatGod",      true);
    setConfig(CONFIG_UINT32_GM_LEVEL_IN_GM_LIST,  "GM.InGMList.Level",  SEC_ADMINISTRATOR);
    setConfig(CONFIG_UINT32_GM_LEVEL_IN_WHO_LIST, "GM.InWhoList.Level", SEC_ADMINISTRATOR);
    setConfig(CONFIG_BOOL_GM_LOG_TRADE,           "GM.LogTrade", false);
    setConfigMinMax(CONFIG_UINT32_START_GM_LEVEL, "GM.StartLevel", 1, getConfig(CONFIG_UINT32_START_PLAYER_LEVEL), MAX_LEVEL);
    setConfig(CONFIG_BOOL_DIE_COMMAND_CREDIT,     "GM.CreditOnDie", true);
    setConfig(CONFIG_BOOL_GM_LOWER_SECURITY,      "GM.LowerSecurity", false);
    setConfig(CONFIG_BOOL_GM_ALLOW_TRADES,        "GM.AllowTrades", true);
    setConfig(CONFIG_BOOL_GMS_ALLOW_PUBLIC_CHANNELS,         "GM.AllowPublicChannels", false);
    setConfig(CONFIG_BOOL_GM_JOIN_OPPOSITE_FACTION_CHANNELS, "GM.JoinOppositeFactionChannels", false);
    if (getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_CHAT))
        setConfig(CONFIG_BOOL_GM_JOIN_OPPOSITE_FACTION_CHANNELS, false);
    setConfig(CONFIG_BOOL_GMTICKETS_ENABLE,           "GMTickets.Enable", true);
    setConfig(CONFIG_UINT32_GMTICKETS_MINLEVEL,       "GMTickets.MinLevel", 0);
    setConfig(CONFIG_UINT32_GMTICKETS_ADMIN_SECURITY, "GMTickets.Admin.Security", SEC_CONSOLE);

    setConfig(CONFIG_UINT32_GROUP_VISIBILITY, "Visibility.GroupMode", 0);

    setConfig(CONFIG_UINT32_MAIL_DELIVERY_DELAY, "MailDeliveryDelay", HOUR);

    setConfigMin(CONFIG_UINT32_MASS_MAILER_SEND_PER_TICK, "MassMailer.SendPerTick", 10, 1);

    setConfigMin(CONFIG_UINT32_RETURNED_MAIL_PR_TICK, "Mail.ReturnedMail.PerTick", 5, 1);

    setConfig(CONFIG_UINT32_BANLIST_RELOAD_TIMER, "BanListReloadTimer", 60);
    setConfigPos(CONFIG_UINT32_UPTIME_UPDATE, "UpdateUptimeInterval", 10);
    if (reload)
    {
        m_timers[WUPDATE_UPTIME].SetInterval(getConfig(CONFIG_UINT32_UPTIME_UPDATE)*MINUTE * IN_MILLISECONDS);
        m_timers[WUPDATE_UPTIME].Reset();
    }

    setConfig(CONFIG_UINT32_SKILL_CHANCE_ORANGE, "SkillChance.Orange", 100);
    setConfig(CONFIG_UINT32_SKILL_CHANCE_YELLOW, "SkillChance.Yellow", 75);
    setConfig(CONFIG_UINT32_SKILL_CHANCE_GREEN,  "SkillChance.Green",  25);
    setConfig(CONFIG_UINT32_SKILL_CHANCE_GREY,   "SkillChance.Grey",   0);

    setConfigPos(CONFIG_UINT32_SKILL_CHANCE_MINING_STEPS,   "SkillChance.MiningSteps",   75);
    setConfigPos(CONFIG_UINT32_SKILL_CHANCE_SKINNING_STEPS, "SkillChance.SkinningSteps", 75);

    setConfigPos(CONFIG_UINT32_SKILL_GAIN_CRAFTING,  "SkillGain.Crafting",  1);
    setConfigPos(CONFIG_UINT32_SKILL_GAIN_DEFENSE,   "SkillGain.Defense",   1);
    setConfigPos(CONFIG_UINT32_SKILL_GAIN_GATHERING, "SkillGain.Gathering", 1);
    setConfig(CONFIG_UINT32_SKILL_GAIN_WEAPON,       "SkillGain.Weapon",    1);

    setConfig(CONFIG_BOOL_SKILL_FAIL_LOOT_FISHING,         "SkillFail.Loot.Fishing", false);
    setConfig(CONFIG_BOOL_SKILL_FAIL_GAIN_FISHING,         "SkillFail.Gain.Fishing", false);
    setConfig(CONFIG_BOOL_SKILL_FAIL_POSSIBLE_FISHINGPOOL, "SkillFail.Possible.FishingPool", true);

    setConfig(CONFIG_UINT32_MAX_OVERSPEED_PINGS, "MaxOverspeedPings", 2);
    if (getConfig(CONFIG_UINT32_MAX_OVERSPEED_PINGS) != 0 && getConfig(CONFIG_UINT32_MAX_OVERSPEED_PINGS) < 2)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MaxOverspeedPings (%i) must be in range 2..infinity (or 0 to disable check). Set to 2.", getConfig(CONFIG_UINT32_MAX_OVERSPEED_PINGS));
        setConfig(CONFIG_UINT32_MAX_OVERSPEED_PINGS, 2);
    }

    setConfig(CONFIG_BOOL_SAVE_RESPAWN_TIME_IMMEDIATELY, "SaveRespawnTimeImmediately", true);
    setConfig(CONFIG_BOOL_WEATHER, "ActivateWeather", true);

    setConfig(CONFIG_BOOL_ALWAYS_MAX_SKILL_FOR_LEVEL, "AlwaysMaxSkillForLevel", false);

    setConfig(CONFIG_UINT32_CHATFLOOD_MESSAGE_COUNT, "ChatFlood.MessageCount", 10);
    setConfig(CONFIG_UINT32_CHATFLOOD_MESSAGE_DELAY, "ChatFlood.MessageDelay", 1);
    setConfig(CONFIG_UINT32_CHATFLOOD_MUTE_TIME,     "ChatFlood.MuteTime", 10);

    setConfig(CONFIG_BOOL_EVENT_ANNOUNCE, "Event.Announce", false);
    setConfig(CONFIG_UINT32_AUTOBROADCAST_INTERVAL, "AutoBroadcast.Timer", 1800000);

    setConfig(CONFIG_UINT32_CREATURE_FAMILY_ASSISTANCE_DELAY, "CreatureFamilyAssistanceDelay", 1500);
    setConfig(CONFIG_UINT32_CREATURE_FAMILY_FLEE_DELAY,       "CreatureFamilyFleeDelay",       7000);

    setConfig(CONFIG_UINT32_WORLD_BOSS_LEVEL_DIFF, "WorldBossLevelDiff", 3);

    setConfig(CONFIG_INT32_QUEST_LOW_LEVEL_HIDE_DIFF, "Quests.LowLevelHideDiff", 4);
    setConfig(CONFIG_INT32_QUEST_HIGH_LEVEL_HIDE_DIFF, "Quests.HighLevelHideDiff", 7);

    setConfig(CONFIG_BOOL_QUEST_IGNORE_RAID, "Quests.IgnoreRaid", false);

    setConfig(CONFIG_BOOL_DETECT_POS_COLLISION, "DetectPosCollision", true);

    setConfig(CONFIG_BOOL_SILENTLY_GM_JOIN_TO_CHANNEL, "Channel.SilentlyGMJoin", false);
    setConfig(CONFIG_BOOL_STRICT_LATIN_IN_GENERAL_CHANNELS, "Channel.StrictLatinInGeneral", false);

    setConfig(CONFIG_BOOL_CHAT_FAKE_MESSAGE_PREVENTING, "ChatFakeMessagePreventing", true);

    setConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_SEVERITY, "ChatStrictLinkChecking.Severity", 2);
    setConfig(CONFIG_UINT32_CHAT_STRICT_LINK_CHECKING_KICK,     "ChatStrictLinkChecking.Kick", 0);

    setConfig(CONFIG_BOOL_SEND_LOOT_ROLL_UPON_RECONNECT, "SendLootRollUponReconnect", false);

    setConfig(CONFIG_UINT32_BONES_EXPIRE_MINUTES,      "Bones.ExpireMinutes", 60);
    setConfig(CONFIG_UINT32_CORPSES_UPDATE_MINUTES,    "Corpses.UpdateMinutes", 20);
    setConfigPos(CONFIG_UINT32_CORPSE_DECAY_NORMAL,    "Corpse.Decay.NORMAL",    300);
    setConfigPos(CONFIG_UINT32_CORPSE_DECAY_RARE,      "Corpse.Decay.RARE",      900);
    setConfigPos(CONFIG_UINT32_CORPSE_DECAY_ELITE,     "Corpse.Decay.ELITE",     600);
    setConfigPos(CONFIG_UINT32_CORPSE_DECAY_RAREELITE, "Corpse.Decay.RAREELITE", 1200);
    setConfigPos(CONFIG_UINT32_CORPSE_DECAY_WORLDBOSS, "Corpse.Decay.WORLDBOSS", 3600);
    m_timers[WUPDATE_CORPSES].SetInterval(getConfig(CONFIG_UINT32_CORPSES_UPDATE_MINUTES) * MINUTE * IN_MILLISECONDS);

    setConfig(CONFIG_INT32_DEATH_SICKNESS_LEVEL,          "Death.SicknessLevel", 11);
    setConfig(CONFIG_BOOL_DEATH_CORPSE_RECLAIM_DELAY_PVP, "Death.CorpseReclaimDelay.PvP", true);
    setConfig(CONFIG_BOOL_DEATH_CORPSE_RECLAIM_DELAY_PVE, "Death.CorpseReclaimDelay.PvE", true);
    setConfig(CONFIG_BOOL_DEATH_BONES_WORLD,              "Death.Bones.World", true);
    setConfig(CONFIG_BOOL_DEATH_BONES_BG,                 "Death.Bones.Battleground", true);
    setConfigMinMax(CONFIG_FLOAT_GHOST_RUN_SPEED_WORLD,   "Death.Ghost.RunSpeed.World", 1.0f, 0.1f, 10.0f);
    setConfigMinMax(CONFIG_FLOAT_GHOST_RUN_SPEED_BG,      "Death.Ghost.RunSpeed.Battleground", 1.0f, 0.1f, 10.0f);

    setConfig(CONFIG_UINT32_PVP_POOL_SIZE_PER_FACTION, "PvP.PoolSizePerFaction", 0);

    setConfig(CONFIG_UINT32_AV_MIN_PLAYERS_IN_QUEUE, "Alterac.MinPlayersInQueue", 0);
    setConfig(CONFIG_UINT32_AV_INITIAL_MAX_PLAYERS,  "Alterac.InitMaxPlayers", 0);
    setConfig(CONFIG_BOOL_BATTLEGROUND_CAST_DESERTER,                  "Battleground.CastDeserter", true);
    setConfigMinMax(CONFIG_UINT32_BATTLEGROUND_QUEUE_ANNOUNCER_JOIN,   "Battleground.QueueAnnouncer.Join", 0, 0, 2);
    setConfig(CONFIG_BOOL_BATTLEGROUND_QUEUE_ANNOUNCER_START,          "Battleground.QueueAnnouncer.Start", false);
    setConfig(CONFIG_UINT32_BATTLEGROUND_INVITATION_TYPE,              "Battleground.InvitationType", 0);
    setConfig(CONFIG_UINT32_BATTLEGROUND_PREMATURE_FINISH_TIMER,       "BattleGround.PrematureFinishTimer", 5 * MINUTE * IN_MILLISECONDS);
    setConfig(CONFIG_UINT32_BATTLEGROUND_PREMADE_GROUP_WAIT_FOR_MATCH, "BattleGround.PremadeGroupWaitForMatch", 0);
    setConfig(CONFIG_UINT32_BATTLEGROUND_PREMADE_QUEUE_GROUP_MIN_SIZE, "BattleGround.PremadeQueue.MinGroupSize", 6);
    setConfig(CONFIG_BOOL_BATTLEGROUND_RANDOMIZE,                      "BattleGround.RandomizeQueues", false);
    setConfig(CONFIG_UINT32_BATTLEGROUND_GROUP_LIMIT,                  "BattleGround.GroupQueueLimit", 40);
    setConfig(CONFIG_BOOL_TAG_IN_BATTLEGROUNDS,                        "BattleGround.TagInBattleGrounds", true);
    setConfigMinMax(CONFIG_UINT32_BATTLEGROUND_QUEUES_COUNT,           "BattleGround.QueuesCount", 0, 0, 3);

    // If max bg queues is at 0, decide based on patch.
    if (getConfig(CONFIG_UINT32_BATTLEGROUND_QUEUES_COUNT) == 0)
    {
        if (GetWowPatch() >= WOW_PATCH_109)
            setConfig(CONFIG_UINT32_BATTLEGROUND_QUEUES_COUNT, 3);
        else
            setConfig(CONFIG_UINT32_BATTLEGROUND_QUEUES_COUNT, 1);
    }

    setConfig(CONFIG_BOOL_OUTDOORPVP_EP_ENABLE, "OutdoorPvP.EP.Enable", true);
    setConfig(CONFIG_BOOL_OUTDOORPVP_SI_ENABLE, "OutdoorPvP.SI.Enable", true);

    setConfig(CONFIG_BOOL_PLAYER_COMMANDS, "PlayerCommands", true);
    setConfig(CONFIG_UINT32_INSTANT_LOGOUT, "InstantLogout", SEC_MODERATOR);
    setConfig(CONFIG_BOOL_FORCE_LOGOUT_DELAY, "ForceLogoutDelay", true);
    setConfigMin(CONFIG_UINT32_GROUP_OFFLINE_LEADER_DELAY, "Group.OfflineLeaderDelay", 300, 0);
    setConfigMin(CONFIG_UINT32_GUILD_EVENT_LOG_COUNT, "Guild.EventLogRecordsCount", GUILD_EVENTLOG_MAX_RECORDS, GUILD_EVENTLOG_MAX_RECORDS);

    setConfig(CONFIG_UINT32_MIRRORTIMER_FATIGUE_MAX, "MirrorTimer.Fatigue.Max", 60);
    setConfig(CONFIG_UINT32_MIRRORTIMER_BREATH_MAX, "MirrorTimer.Breath.Max", 60);
    setConfig(CONFIG_UINT32_MIRRORTIMER_ENVIRONMENTAL_MAX, "MirrorTimer.Environmental.Max", 1);
    setConfig(CONFIG_UINT32_ENVIRONMENTAL_DAMAGE_MIN, "EnvironmentalDamage.Min", 605);
    setConfigMin(CONFIG_UINT32_ENVIRONMENTAL_DAMAGE_MAX, "EnvironmentalDamage.Max", 610, getConfig(CONFIG_UINT32_ENVIRONMENTAL_DAMAGE_MIN));

    setConfig(CONFIG_BOOL_PET_UNSUMMON_AT_MOUNT,      "PetUnsummonAtMount", false);
    setConfigMinMax(CONFIG_UINT32_PET_DEFAULT_LOYALTY, "PetDefaultLoyalty", 1, 1, 6);

    setConfig(CONFIG_UINT32_ANTIFLOOD_SANCTION,       "Antiflood.Sanction", CHEAT_ACTION_KICK);

    setConfig(CONFIG_BOOL_LFG_MATCHMAKING, "LFG.Matchmaking", false);
    setConfig(CONFIG_UINT32_LFG_MATCHMAKING_TIMER, "LFG.MatchmakingTimer", 600);

    setConfig(CONFIG_BOOL_VISIBILITY_FORCE_ACTIVE_OBJECTS, "Visibility.ForceActiveObjects", true);
    m_relocation_ai_notify_delay = sConfig.GetIntDefault("Visibility.AIRelocationNotifyDelay", 1000u);
    m_relocation_lower_limit_sq  = pow(sConfig.GetFloatDefault("Visibility.RelocationLowerLimit", 10), 2);

    m_VisibleUnitGreyDistance = sConfig.GetFloatDefault("Visibility.Distance.Grey.Unit", 1);
    if (m_VisibleUnitGreyDistance >  MAX_VISIBILITY_DISTANCE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.Grey.Unit can't be greater %f", MAX_VISIBILITY_DISTANCE);
        m_VisibleUnitGreyDistance = MAX_VISIBILITY_DISTANCE;
    }
    m_VisibleObjectGreyDistance = sConfig.GetFloatDefault("Visibility.Distance.Grey.Object", 10);
    if (m_VisibleObjectGreyDistance >  MAX_VISIBILITY_DISTANCE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.Grey.Object can't be greater %f", MAX_VISIBILITY_DISTANCE);
        m_VisibleObjectGreyDistance = MAX_VISIBILITY_DISTANCE;
    }

    //visibility on continents
    m_MaxVisibleDistanceOnContinents      = sConfig.GetFloatDefault("Visibility.Distance.Continents",     DEFAULT_VISIBILITY_DISTANCE);
    if (m_MaxVisibleDistanceOnContinents < 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.Continents can't be less max aggro radius %f", 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO));
        m_MaxVisibleDistanceOnContinents = 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO);
    }
    else if (m_MaxVisibleDistanceOnContinents + m_VisibleUnitGreyDistance >  MAX_VISIBILITY_DISTANCE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.Continents can't be greater %f", MAX_VISIBILITY_DISTANCE - m_VisibleUnitGreyDistance);
        m_MaxVisibleDistanceOnContinents = MAX_VISIBILITY_DISTANCE - m_VisibleUnitGreyDistance;
    }

    //visibility in instances
    m_MaxVisibleDistanceInInstances        = sConfig.GetFloatDefault("Visibility.Distance.Instances",       DEFAULT_VISIBILITY_INSTANCE);
    if (m_MaxVisibleDistanceInInstances < 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.Instances can't be less max aggro radius %f", 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO));
        m_MaxVisibleDistanceInInstances = 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO);
    }
    else if (m_MaxVisibleDistanceInInstances + m_VisibleUnitGreyDistance >  MAX_VISIBILITY_DISTANCE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.Instances can't be greater %f", MAX_VISIBILITY_DISTANCE - m_VisibleUnitGreyDistance);
        m_MaxVisibleDistanceInInstances = MAX_VISIBILITY_DISTANCE - m_VisibleUnitGreyDistance;
    }

    //visibility in BG
    m_MaxVisibleDistanceInBG        = sConfig.GetFloatDefault("Visibility.Distance.BG",       DEFAULT_VISIBILITY_BG);
    if (m_MaxVisibleDistanceInBG < 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.BG can't be less max aggro radius %f", 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO));
        m_MaxVisibleDistanceInBG = 45 * getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO);
    }
    else if (m_MaxVisibleDistanceInBG + m_VisibleUnitGreyDistance >  MAX_VISIBILITY_DISTANCE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.BG can't be greater %f", MAX_VISIBILITY_DISTANCE - m_VisibleUnitGreyDistance);
        m_MaxVisibleDistanceInBG = MAX_VISIBILITY_DISTANCE - m_VisibleUnitGreyDistance;
    }

    m_MaxVisibleDistanceInFlight    = sConfig.GetFloatDefault("Visibility.Distance.InFlight",      DEFAULT_VISIBILITY_DISTANCE);
    if (m_MaxVisibleDistanceInFlight + m_VisibleObjectGreyDistance > MAX_VISIBILITY_DISTANCE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Visibility.Distance.InFlight can't be greater %f", MAX_VISIBILITY_DISTANCE - m_VisibleObjectGreyDistance);
        m_MaxVisibleDistanceInFlight = MAX_VISIBILITY_DISTANCE - m_VisibleObjectGreyDistance;
    }

    // Load the CharDelete related config options
    setConfigMinMax(CONFIG_UINT32_CHARDELETE_METHOD, "CharDelete.Method", 0, 0, 1);
    setConfigMinMax(CONFIG_UINT32_CHARDELETE_MIN_LEVEL, "CharDelete.MinLevel", 0, 0, getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL));
    setConfigPos(CONFIG_UINT32_CHARDELETE_KEEP_DAYS, "CharDelete.KeepDays", 30);

    if (configNoReload(reload, CONFIG_UINT32_GUID_RESERVE_SIZE_CREATURE, "GuidReserveSize.Creature", 100))
        setConfigPos(CONFIG_UINT32_GUID_RESERVE_SIZE_CREATURE,   "GuidReserveSize.Creature",   100);
    if (configNoReload(reload, CONFIG_UINT32_GUID_RESERVE_SIZE_GAMEOBJECT, "GuidReserveSize.GameObject", 100))
        setConfigPos(CONFIG_UINT32_GUID_RESERVE_SIZE_GAMEOBJECT, "GuidReserveSize.GameObject", 100);

    // Read the "Honor" directory from the config file (basically these are PvP ranking logs)
    std::string honorPath = sConfig.GetStringDefault("HonorDir", "./");

    // for empty string use current dir as for absent case
    if (honorPath.empty())
        honorPath = "./";
    // normalize dir path to path/ or path\ form
    else if (honorPath.at(honorPath.length() - 1) != '/' && honorPath.at(honorPath.length() - 1) != '\\')
        honorPath.append("/");

    if (reload)
    {
        if (honorPath != m_honorPath)
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HonorDir option can't be changed at mangosd.conf reload, using current value (%s).", m_honorPath.c_str());
    }
    else
    {
        m_honorPath = honorPath;
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Using HonorDir %s", m_honorPath.c_str());
    }

    // Read the "Data" directory from the config file
    std::string dataPath = sConfig.GetStringDefault("DataDir", "./");

    // for empty string use current dir as for absent case
    if (dataPath.empty())
        dataPath = "./";
    // normalize dir path to path/ or path\ form
    else if (dataPath.at(dataPath.length() - 1) != '/' && dataPath.at(dataPath.length() - 1) != '\\')
        dataPath.append("/");

    if (reload)
    {
        if (dataPath != m_dataPath)
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "DataDir option can't be changed at mangosd.conf reload, using current value (%s).", m_dataPath.c_str());
    }
    else
    {
        m_dataPath = dataPath;
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Using DataDir %s", m_dataPath.c_str());
    }

    setConfig(CONFIG_BOOL_VMAP_INDOOR_CHECK, "vmap.enableIndoorCheck", true);
    bool enableLOS = sConfig.GetBoolDefault("vmap.enableLOS", false);
    bool enableHeight = sConfig.GetBoolDefault("vmap.enableHeight", false);
    bool disableModelUnload = sConfig.GetBoolDefault("Collision.Models.Unload", false);

    if (!enableHeight)
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "VMAP height use disabled! Creatures movements and other things will be in broken state.");

    VMAP::VMapFactory::createOrGetVMapManager()->setEnableLineOfSightCalc(enableLOS);
    VMAP::VMapFactory::createOrGetVMapManager()->setEnableHeightCalc(enableHeight);
    VMAP::VMapFactory::createOrGetVMapManager()->setUseManagedPtrs(!disableModelUnload);

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WORLD: VMap support included. LineOfSight:%i, getHeight:%i, indoorCheck:%i", enableLOS, enableHeight, getConfig(CONFIG_BOOL_VMAP_INDOOR_CHECK) ? 1 : 0);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WORLD: VMap data directory is: %svmaps", m_dataPath.c_str());
    setConfig(CONFIG_BOOL_MMAP_ENABLED, "mmap.enabled", true);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "WORLD: mmap pathfinding %sabled", getConfig(CONFIG_BOOL_MMAP_ENABLED) ? "en" : "dis");

    setConfig(CONFIG_UINT32_EMPTY_MAPS_UPDATE_TIME, "MapUpdate.Empty.UpdateTime", 0);
    setConfigMinMax(CONFIG_UINT32_MAP_OBJECTSUPDATE_THREADS, "MapUpdate.ObjectsUpdate.MaxThreads", 4, 1, 20);
    setConfigMinMax(CONFIG_UINT32_MAP_OBJECTSUPDATE_TIMEOUT, "MapUpdate.ObjectsUpdate.Timeout", 100, 10, 2000);
    setConfigMinMax(CONFIG_UINT32_MAP_VISIBILITYUPDATE_THREADS, "MapUpdate.VisibilityUpdate.MaxThreads", 4, 1, 20);
    setConfigMinMax(CONFIG_UINT32_MAP_VISIBILITYUPDATE_TIMEOUT, "MapUpdate.VisibilityUpdate.Timeout", 100, 10, 2000);
    setConfigMinMax(CONFIG_UINT32_MAPUPDATE_INSTANCED_UPDATE_THREADS, "MapUpdate.Instanced.UpdateThreads", 2, 0, 20);
    setConfigMinMax(CONFIG_UINT32_MTCELLS_THREADS, "MapUpdate.Continents.MTCells.Threads", 0, 0, 20);
    setConfigMinMax(CONFIG_UINT32_MTCELLS_SAFEDISTANCE, "MapUpdate.Continents.MTCells.SafeDistance", 1066, 0, 34112);
    setConfigMinMax(CONFIG_UINT32_MAPUPDATE_UPDATE_PACKETS_DIFF, "MapUpdate.UpdatePacketsDiff", 100, 1, 10000);
    setConfigMinMax(CONFIG_UINT32_MAPUPDATE_UPDATE_PLAYERS_DIFF, "MapUpdate.UpdatePlayersDiff", 100, 1, 10000);
    setConfigMinMax(CONFIG_UINT32_MAPUPDATE_UPDATE_CELLS_DIFF, "MapUpdate.UpdateCellsDiff", 100, 1, 10000);
    setConfigMinMax(CONFIG_UINT32_INACTIVE_PLAYERS_SKIP_UPDATES, "Continents.InactivePlayers.SkipUpdates", 0, 0, 100);
    setConfig(CONFIG_UINT32_MAPUPDATE_TICK_LOWER_GRID_ACTIVATION_DISTANCE, "MapUpdate.ReduceGridActivationDist.Tick", 0);
    setConfig(CONFIG_UINT32_MAPUPDATE_TICK_INCREASE_GRID_ACTIVATION_DISTANCE, "MapUpdate.IncreaseGridActivationDist.Tick", 0);
    setConfig(CONFIG_UINT32_MAPUPDATE_MIN_GRID_ACTIVATION_DISTANCE, "MapUpdate.MinGridActivationDistance", 0);
    setConfig(CONFIG_UINT32_MAPUPDATE_TICK_LOWER_VISIBILITY_DISTANCE, "MapUpdate.ReduceVisDist.Tick", 0);
    setConfig(CONFIG_UINT32_MAPUPDATE_TICK_INCREASE_VISIBILITY_DISTANCE, "MapUpdate.IncreaseVisDist.Tick", 0);
    setConfig(CONFIG_UINT32_MAPUPDATE_MIN_VISIBILITY_DISTANCE, "MapUpdate.MinVisibilityDistance", 0);
    setConfig(CONFIG_BOOL_CONTINENTS_INSTANCIATE, "Continents.Instanciate", false);
    setConfig(CONFIG_UINT32_CONTINENTS_MOTIONUPDATE_THREADS, "Continents.MotionUpdate.Threads", 0);
    setConfig(CONFIG_BOOL_TERRAIN_PRELOAD_CONTINENTS, "Terrain.Preload.Continents", true);
    setConfig(CONFIG_BOOL_TERRAIN_PRELOAD_INSTANCES, "Terrain.Preload.Instances", true);

    setConfig(CONFIG_BOOL_ENABLE_MOVEMENT_EXTRAPOLATION_CHARGE, "Movement.ExtrapolateChargePosition", true);
    setConfig(CONFIG_BOOL_ENABLE_MOVEMENT_EXTRAPOLATION_PET, "Movement.ExtrapolatePetPosition", true);
    setConfig(CONFIG_UINT32_MOVEMENT_CHANGE_ACK_TIME, "Movement.PendingAckResponseTime", 4000);
    setConfigMinMax(CONFIG_UINT32_MAX_POINTS_PER_MVT_PACKET, "Movement.MaxPointsPerPacket", 80, 5, 10000);
    setConfigMinMax(CONFIG_UINT32_RELOCATION_VMAP_CHECK_TIMER, "Movement.RelocationVmapsCheckDelay", 0, 0, 2000);

    sPlayerBotMgr.LoadConfig();
    setConfig(CONFIG_BOOL_PLAYER_BOT_SHOW_IN_WHO_LIST, "PlayerBot.ShowInWhoList", false);
    setConfig(CONFIG_UINT32_PARTY_BOT_MAX_BOTS, "PartyBot.MaxBots", 0);
    setConfig(CONFIG_BOOL_PARTY_BOT_SKIP_CHECKS, "PartyBot.SkipChecks", false);
    setConfigMinMax(CONFIG_UINT32_PARTY_BOT_AUTO_EQUIP, "PartyBot.AutoEquip", PLAYER_BOT_AUTO_EQUIP_RANDOM_GEAR, PLAYER_BOT_AUTO_EQUIP_STARTING_GEAR, PLAYER_BOT_AUTO_EQUIP_PREMADE_GEAR);
    setConfigMinMax(CONFIG_UINT32_BATTLE_BOT_AUTO_EQUIP, "BattleBot.AutoEquip", PLAYER_BOT_AUTO_EQUIP_RANDOM_GEAR, PLAYER_BOT_AUTO_EQUIP_STARTING_GEAR, PLAYER_BOT_AUTO_EQUIP_PREMADE_GEAR);
    setConfig(CONFIG_UINT32_PARTY_BOT_RANDOM_GEAR_LEVEL_DIFFERENCE, "PartyBot.RandomGearLevelDifference", 10);

    setConfigMinMax(CONFIG_UINT32_SPELL_EFFECT_DELAY, "Spell.EffectDelay", 400, 0, 1000);
    setConfigMinMax(CONFIG_UINT32_SPELL_PROC_DELAY, "Spell.ProcDelay", 400, 0, 1000);
    setConfigMinMax(CONFIG_UINT32_DEBUFF_LIMIT, "DebuffLimit", 0, 0, 40);

    // If max debuff slots is at 0, decide based on patch.
    if (getConfig(CONFIG_UINT32_DEBUFF_LIMIT) == 0)
    {
        if (GetWowPatch() >= WOW_PATCH_107)
            setConfig(CONFIG_UINT32_DEBUFF_LIMIT, 16);
        else
            setConfig(CONFIG_UINT32_DEBUFF_LIMIT, 8);
    }

    setConfig(CONFIG_UINT32_ANTICRASH_OPTIONS, "Anticrash.Options", 0);
    setConfig(CONFIG_UINT32_ANTICRASH_REARM_TIMER, "Anticrash.Rearm.Timer", 0);

    setConfig(CONFIG_UINT32_PERFLOG_SLOW_WORLD_UPDATE, "PerformanceLog.SlowWorldUpdate", 100);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_MAPSYSTEM_UPDATE, "PerformanceLog.SlowMapSystemUpdate", 100);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_UPDATE, "PerformanceLog.SlowMapUpdate", 100);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_ASYNC_QUERIES, "PerformanceLog.SlowAsynQueries", 100);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_UNIQUE_SESSION_UPDATE, "PerformanceLog.SlowUniqueSessionUpdate", 20);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_PACKET, "PerformanceLog.SlowPackets", 20);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_MAP_PACKETS, "PerformanceLog.SlowMapPackets", 60);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_SESSIONS_UPDATE, "PerformanceLog.SlowSessionsUpdate", 0);
    setConfig(CONFIG_UINT32_PERFLOG_SLOW_PACKET_BCAST, "PerformanceLog.SlowPacketBroadcast", 0);
    setConfig(CONFIG_UINT32_LOG_MONEY_TRADES_TRESHOLD, "LogMoneyTreshold", 10000);

    setConfig(CONFIG_FLOAT_DYN_RESPAWN_CHECK_RANGE, "DynamicRespawn.Range", -1.0f);
    setConfig(CONFIG_FLOAT_DYN_RESPAWN_MAX_REDUCTION_RATE, "DynamicRespawn.MaxReductionRate", 0.0f);
    setConfig(CONFIG_FLOAT_DYN_RESPAWN_PERCENT_PER_PLAYER, "DynamicRespawn.PercentPerPlayer", 0.0f);
    setConfig(CONFIG_UINT32_DYN_RESPAWN_MIN_RESPAWN_TIME, "DynamicRespawn.MinRespawnTime", 0);
    setConfig(CONFIG_UINT32_DYN_RESPAWN_MIN_RESPAWN_TIME_ELITE, "DynamicRespawn.MinEliteRespawnTime", 0);
    setConfig(CONFIG_UINT32_DYN_RESPAWN_MIN_RESPAWN_TIME_INDOORS, "DynamicRespawn.MinIndoorRespawnTime", 0);
    setConfig(CONFIG_UINT32_DYN_RESPAWN_AFFECT_RESPAWN_TIME_BELOW, "DynamicRespawn.AffectRespawnTimeBelow", 0);
    setConfig(CONFIG_UINT32_DYN_RESPAWN_AFFECT_LEVEL_BELOW, "DynamicRespawn.AffectLevelBelow", 0);
    setConfig(CONFIG_UINT32_DYN_RESPAWN_PLAYERS_THRESHOLD, "DynamicRespawn.PlayersThreshold", 0);
    setConfig(CONFIG_UINT32_DYN_RESPAWN_PLAYERS_LEVELDIFF, "DynamicRespawn.PlayersMaxLevelDiff", 0);

    setConfig(CONFIG_UINT32_CHANNEL_INVITE_MIN_LEVEL, "ChannelInvite.MinLevel", 10);
    setConfig(CONFIG_BOOL_WHISPER_RESTRICTION, "WhisperRestriction", false);
    setConfig(CONFIG_UINT32_WORLD_CHAN_MIN_LEVEL, "WorldChan.MinLevel", 0);
    setConfig(CONFIG_UINT32_WORLD_CHAN_CD, "WorldChan.Cooldown", 0);
    setConfig(CONFIG_UINT32_WORLD_CHAN_CD_MAX_LEVEL, "WorldChan.CooldownMaxLevel", 0);
    setConfig(CONFIG_UINT32_WORLD_CHAN_CD_SCALING, "WorldChan.CooldownScaling", 0);
    setConfig(CONFIG_UINT32_WORLD_CHAN_CD_USE_ACCOUNT_MAX_LEVEL, "WorldChan.CooldownUseAccountLevel", 0);
    setConfig(CONFIG_UINT32_PUB_CHANS_MUTE_VANISH_LEVEL, "PublicChansMute.BypassLevel", 61);
    setConfig(CONFIG_UINT32_SAY_MIN_LEVEL, "SayMinLevel", 0);
    setConfig(CONFIG_UINT32_YELL_MIN_LEVEL, "YellMinLevel", 0);
    setConfig(CONFIG_UINT32_SAY_EMOTE_MIN_LEVEL, "SayEmoteMinLevel", 0);
    setConfig(CONFIG_UINT32_WHISP_DIFF_ZONE_MIN_LEVEL, "WhisperDiffZone.MinLevel", 0);
    setConfig(CONFIG_UINT32_YELLRANGE_LINEARSCALE_MAXLEVEL, "YellRange.LinearScale.MaxLevel", 0);
    setConfig(CONFIG_UINT32_YELLRANGE_QUADRATICSCALE_MAXLEVEL, "YellRange.QuadraticScale.MaxLevel", 0);
    setConfig(CONFIG_UINT32_YELLRANGE_MIN, "YellRange.Min", 0);

    setConfig(CONFIG_BOOL_LOGSDB_BATTLEGROUNDS, "LogsDB.Battlegrounds", false);
    setConfig(CONFIG_BOOL_LOGSDB_CHARACTERS, "LogsDB.Characters", false);
    setConfig(CONFIG_BOOL_LOGSDB_LEVELUP, "LogsDB.LevelUp", false);
    setConfig(CONFIG_BOOL_LOGSDB_GM, "LogsDB.GM", false);
    setConfig(CONFIG_BOOL_LOGSDB_CHAT, "LogsDB.Chat", false);
    setConfig(CONFIG_BOOL_LOGSDB_LOOT, "LogsDB.Loot", false);
    setConfig(CONFIG_BOOL_LOGSDB_TRADES, "LogsDB.Trades", false);
    setConfig(CONFIG_BOOL_LOGSDB_TRANSACTIONS, "LogsDB.Transactions", false);
    setConfig(CONFIG_BOOL_SMARTLOG_DEATH, "Smartlog.Death", false);
    setConfig(CONFIG_BOOL_SMARTLOG_LONGCOMBAT, "Smartlog.LongCombat", false);
    setConfig(CONFIG_UINT32_LONGCOMBAT, "Smartlog.LongCombatDuration", 30 * MINUTE);

    setConfig(CONFIG_UINT32_ITEM_INSTANTSAVE_QUALITY, "Item.InstantSaveQuality", ITEM_QUALITY_ARTIFACT);
    setConfig(CONFIG_BOOL_PREVENT_ITEM_DATAMINING, "Item.PreventDataMining", true);

    setConfig(CONFIG_UINT32_MAILSPAM_EXPIRE_SECS, "MailSpam.ExpireSecs", 0);
    setConfig(CONFIG_UINT32_MAILSPAM_MAX_MAILS, "MailSpam.MaxMails", 2);
    setConfig(CONFIG_UINT32_MAILSPAM_LEVEL, "MailSpam.Level", 1);
    setConfig(CONFIG_UINT32_MAILSPAM_MONEY, "MailSpam.Money", 0);
    setConfig(CONFIG_BOOL_MAILSPAM_ITEM, "MailSpam.Item", false);
    setConfig(CONFIG_UINT32_COD_FORCE_TAG_MAX_LEVEL, "Mails.COD.ForceTag.MaxLevel", 0);

    setConfigMinMax(CONFIG_UINT32_ASYNC_TASKS_THREADS_COUNT,       "AsyncTasks.Threads", 1, 1, 20);
    setConfig(CONFIG_BOOL_KICK_PLAYER_ON_BAD_PACKET,               "Network.KickOnBadPacket", false);
    setConfig(CONFIG_UINT32_PACKET_BCAST_THREADS,                  "Network.PacketBroadcast.Threads", 0);
    setConfig(CONFIG_UINT32_PACKET_BCAST_FREQUENCY,                "Network.PacketBroadcast.Frequency", 50);
    setConfig(CONFIG_UINT32_PBCAST_DIFF_LOWER_VISIBILITY_DISTANCE, "Network.PacketBroadcast.ReduceVisDistance.DiffAbove", 0);
    
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "* Anticrash : options 0x%x rearm after %usec", getConfig(CONFIG_UINT32_ANTICRASH_OPTIONS), getConfig(CONFIG_UINT32_ANTICRASH_REARM_TIMER) / 1000);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "* Pathfinding : [%s]", getConfig(CONFIG_BOOL_MMAP_ENABLED) ? "ON" : "OFF");

    // Update packet broadcaster config
    if (reload)
    {
        m_broadcaster->UpdateConfiguration(getConfig(CONFIG_UINT32_PACKET_BCAST_THREADS),
        std::chrono::milliseconds(getConfig(CONFIG_UINT32_PACKET_BCAST_FREQUENCY)));
    }

    // PvP options
    setConfig(CONFIG_BOOL_ACCURATE_PVP_EQUIP_REQUIREMENTS, "PvP.AccurateEquipRequirements", true);
    setConfig(CONFIG_BOOL_ACCURATE_PVP_PURCHASE_REQUIREMENTS, "PvP.AccuratePurchaseRequirements", true);
    setConfig(CONFIG_BOOL_ACCURATE_PVP_TIMELINE, "PvP.AccurateTimeline", true);
    setConfig(CONFIG_BOOL_ACCURATE_PVP_REWARDS, "PvP.AccurateRewards", true);
    setConfig(CONFIG_BOOL_ENABLE_DK, "PvP.DishonorableKills", true);
    setConfig(CONFIG_BOOL_ENABLE_CITY_PROTECTOR, "PvP.CityProtector", true);

    // Progression settings
    setConfig(CONFIG_BOOL_ACCURATE_PETS, "Progression.AccuratePetStatistics", true);
    setConfig(CONFIG_BOOL_ACCURATE_LFG, "Progression.AccurateLFGAvailability", true);
    setConfig(CONFIG_BOOL_ACCURATE_PVE_EVENTS, "Progression.AccuratePVEEvents", true);
    setConfig(CONFIG_BOOL_ACCURATE_SPELL_EFFECTS, "Progression.AccurateSpellEffects", true);
    setConfig(CONFIG_BOOL_NO_RESPEC_PRICE_DECAY, "Progression.NoRespecPriceDecay", true);
    setConfig(CONFIG_BOOL_NO_QUEST_XP_TO_GOLD, "Progression.NoQuestXpToGold", true);
    setConfig(CONFIG_BOOL_RESTORE_DELETED_ITEMS, "Progression.RestoreDeletedItems", true);
    setConfig(CONFIG_BOOL_UNLINKED_AUCTION_HOUSES, "Progression.UnlinkedAuctionHouses", true);

    // Movement Anticheat
    setConfig(CONFIG_BOOL_AC_MOVEMENT_ENABLED, "Anticheat.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_PLAYERS_ONLY, "Anticheat.PlayersOnly", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_NOTIFY_CHEATERS, "Anticheat.NotifyCheaters", false);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_BAN_DURATION, "Anticheat.BanDuration", 86400);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_LOG_DATA, "Anticheat.LogData", false);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_PACKET_LOG_SIZE, "Anticheat.PacketLogSize", 100);
    setConfig(CONFIG_INT32_AC_ANTICHEAT_MAX_ALLOWED_DESYNC, "Anticheat.MaxAllowedDesync", 0);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_REVERSE_TIME_ENABLED, "Anticheat.ReverseTime.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_REVERSE_TIME_THRESHOLD, "Anticheat.ReverseTime.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_REVERSE_TIME_PENALTY, "Anticheat.ReverseTime.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_NULL_TIME_ENABLED, "Anticheat.NullTime.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_NULL_TIME_THRESHOLD, "Anticheat.NullTime.Threshold", 2);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_NULL_TIME_PENALTY, "Anticheat.NullTime.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_ENABLED, "Anticheat.SkippedHeartbeats.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_THRESHOLD_TICK, "Anticheat.SkippedHeartbeats.Threshold.Total", 2);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_THRESHOLD_TOTAL, "Anticheat.SkippedHeartbeats.Threshold.Total", 10);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_SKIPPED_HEARTBEATS_PENALTY, "Anticheat.SkippedHeartbeats.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TIME_DESYNC_ENABLED, "Anticheat.TimeDesync.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_TIME_DESYNC_THRESHOLD, "Anticheat.TimeDesync.Threshold", 5000);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_TIME_DESYNC_PENALTY, "Anticheat.TimeDesync.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_NUM_DESYNCS_ENABLED, "Anticheat.NumDesyncs.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_NUM_DESYNCS_THRESHOLD, "Anticheat.NumDesyncs.Threshold", 5);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_NUM_DESYNCS_PENALTY, "Anticheat.NumDesyncs.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SPEED_HACK_ENABLED, "Anticheat.SpeedHack.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_OVERSPEED_DISTANCE_ENABLED, "Anticheat.OverpspeedDistance.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_DISTANCE_THRESHOLD, "Anticheat.OverpspeedDistance.Threshold", 30);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_DISTANCE_PENALTY, "Anticheat.OverpspeedDistance.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_ENABLED, "Anticheat.OverspeedJump.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_REJECT, "Anticheat.OverspeedJump.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_THRESHOLD, "Anticheat.OverspeedJump.Threshold", 3);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_OVERSPEED_JUMP_PENALTY, "Anticheat.OverspeedJump.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_ENABLED, "Anticheat.JumpSpeedChange.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_REJECT, "Anticheat.JumpSpeedChange.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_THRESHOLD, "Anticheat.JumpSpeedChange.Threshold", 3);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_JUMP_SPEED_CHANGE_PENALTY, "Anticheat.JumpSpeedChange.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_MULTI_JUMP_ENABLED, "Anticheat.MultiJump.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_MULTI_JUMP_REJECT, "Anticheat.MultiJump.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_MULTI_JUMP_THRESHOLD_TICK, "Anticheat.MultiJump.Threshold.Tick", 2);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_MULTI_JUMP_THRESHOLD_TOTAL, "Anticheat.MultiJump.Threshold.Total", 10);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_MULTI_JUMP_PENALTY, "Anticheat.MultiJump.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WALL_CLIMB_ENABLED, "Anticheat.WallClimb.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WALL_CLIMB_REJECT, "Anticheat.WallClimb.Reject", true);
    setConfig(CONFIG_FLOAT_AC_MOVEMENT_CHEAT_WALL_CLIMB_ANGLE, "Anticheat.WallClimb.Angle", 1.0f);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_WALL_CLIMB_THRESHOLD_TICK, "Anticheat.WallClimb.Threshold.Tick", 3);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_WALL_CLIMB_THRESHOLD_TOTAL, "Anticheat.WallClimb.Threshold.Total", 30);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_WALL_CLIMB_PENALTY, "Anticheat.WallClimb.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_UNREACHABLE_ENABLED, "Anticheat.Unreachable.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_UNREACHABLE_THRESHOLD, "Anticheat.Unreachable.Threshold", 40);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_UNREACHABLE_PENALTY, "Anticheat.Unreachable.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FLY_ENABLED, "Anticheat.FlyHack.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FLY_REJECT, "Anticheat.FlyHack.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FLY_THRESHOLD, "Anticheat.FlyHack.Threshold", 3);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FLY_PENALTY, "Anticheat.FlyHack.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_NO_FALL_TIME_ENABLED, "Anticheat.NoFallTime.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_NO_FALL_TIME_THRESHOLD, "Anticheat.NoFallTime.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_NO_FALL_TIME_PENALTY, "Anticheat.NoFallTime.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_FALL_RESET_ENABLED, "Anticheat.BadFallReset.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_RESET_THRESHOLD, "Anticheat.BadFallReset.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_RESET_PENALTY, "Anticheat.BadFallReset.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_FALL_STOP_ENABLED, "Anticheat.BadFallStop.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_STOP_THRESHOLD, "Anticheat.BadFallStop.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_FALL_STOP_PENALTY, "Anticheat.BadFallStop.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BAD_MOVE_START_ENABLED, "Anticheat.BadMoveStart.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_MOVE_START_THRESHOLD, "Anticheat.BadMoveStart.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BAD_MOVE_START_PENALTY, "Anticheat.BadMoveStart.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELEPORT_ENABLED, "Anticheat.Teleport.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELEPORT_REJECT, "Anticheat.Teleport.Reject", true);
    setConfig(CONFIG_FLOAT_AC_MOVEMENT_CHEAT_TELEPORT_DISTANCE, "Anticheat.Teleport.Distance", 40.0f);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELEPORT_THRESHOLD, "Anticheat.Teleport.Threshold", 3);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELEPORT_PENALTY, "Anticheat.Teleport.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_BAN_ACCOUNT);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_ENABLED, "Anticheat.TeleportToTransport.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_REJECT, "Anticheat.TeleportToTransport.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_THRESHOLD, "Anticheat.TeleportToTransport.Threshold", 2);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_TELE_TO_TRANSPORT_PENALTY, "Anticheat.TeleportToTransport.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_ENABLED, "Anticheat.FakeTransport.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_REJECT, "Anticheat.FakeTransport.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_THRESHOLD, "Anticheat.FakeTransport.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FAKE_TRANSPORT_PENALTY, "Anticheat.FakeTransport.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WATER_WALK_ENABLED, "Anticheat.WaterWalk.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WATER_WALK_REJECT, "Anticheat.WaterWalk.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_WATER_WALK_THRESHOLD, "Anticheat.WaterWalk.Threshold", 5);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_WATER_WALK_PENALTY, "Anticheat.WaterWalk.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SLOW_FALL_ENABLED, "Anticheat.SlowFall.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SLOW_FALL_REJECT, "Anticheat.SlowFall.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_SLOW_FALL_THRESHOLD, "Anticheat.SlowFall.Threshold", 5);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_SLOW_FALL_PENALTY, "Anticheat.SlowFall.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_HOVER_ENABLED, "Anticheat.Hover.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_HOVER_REJECT, "Anticheat.Hover.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_HOVER_THRESHOLD, "Anticheat.Hover.Threshold", 5);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_HOVER_PENALTY, "Anticheat.Hover.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FIXED_Z_ENABLED, "Anticheat.FixedZ.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FIXED_Z_REJECT, "Anticheat.FixedZ.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FIXED_Z_THRESHOLD, "Anticheat.FixedZ.Threshold", 5);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FIXED_Z_PENALTY, "Anticheat.FixedZ.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_ROOT_MOVE_ENABLED, "Anticheat.RootMove.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_ROOT_MOVE_REJECT, "Anticheat.RootMove.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_ROOT_MOVE_THRESHOLD_TICK, "Anticheat.RootMove.Threshold.Tick", 5);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_ROOT_MOVE_THRESHOLD_TOTAL, "Anticheat.RootMove.Threshold.Total", 30);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_ROOT_MOVE_PENALTY, "Anticheat.RootMove.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SELF_ROOT_ENABLED, "Anticheat.SelfRoot.Enable", true);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_SELF_ROOT_REJECT, "Anticheat.SelfRoot.Reject", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_SELF_ROOT_THRESHOLD, "Anticheat.SelfRoot.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_SELF_ROOT_PENALTY, "Anticheat.SelfRoot.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_WRONG_ACK_DATA_ENABLED, "Anticheat.WrongAckData.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_WRONG_ACK_DATA_THRESHOLD, "Anticheat.WrongAckData.Threshold", 3);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_WRONG_ACK_DATA_PENALTY, "Anticheat.WrongAckData.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_PENDING_ACK_DELAY_ENABLED, "Anticheat.PendingAckDelay.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_PENDING_ACK_DELAY_THRESHOLD, "Anticheat.PendingAckDelay.Threshold", 3);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_PENDING_ACK_DELAY_PENALTY, "Anticheat.PendingAckDelay.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_EXPLORE_ENABLED, "Anticheat.ExploreArea.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_THRESHOLD, "Anticheat.ExploreArea.Threshold", 100);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_PENALTY, "Anticheat.ExploreArea.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_EXPLORE_HIGH_LEVEL_ENABLED, "Anticheat.ExploreHighLevelArea.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_HIGH_LEVEL_THRESHOLD, "Anticheat.ExploreHighLevelArea.Threshold", 50);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_EXPLORE_HIGH_LEVEL_PENALTY, "Anticheat.ExploreHighLevelArea.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS | CHEAT_ACTION_KICK);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_FORBIDDEN_AREA_ENABLED, "Anticheat.ForbiddenArea.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FORBIDDEN_AREA_THRESHOLD, "Anticheat.ForbiddenArea.Threshold", 1);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_FORBIDDEN_AREA_PENALTY, "Anticheat.ForbiddenArea.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);
    setConfig(CONFIG_BOOL_AC_MOVEMENT_CHEAT_BOTTING_ENABLED, "Anticheat.Botting.Enable", true);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_PERIOD, "Anticheat.Botting.Period", 300000);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_PACKETS, "Anticheat.Botting.MinPackets", 160);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_TURNS_MOUSE, "Anticheat.Botting.MinTurnsMouse", 20);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_TURNS_KEYBOARD, "Anticheat.Botting.MinTurnsKeyboard", 80);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_MIN_TURNS_ABNORMAL, "Anticheat.Botting.MinTurnsAbnormal", 5);
    setConfig(CONFIG_UINT32_AC_MOVEMENT_CHEAT_BOTTING_PENALTY, "Anticheat.Botting.Penalty", CHEAT_ACTION_LOG | CHEAT_ACTION_REPORT_GMS);

    // Warden Anticheat
    setConfig(CONFIG_BOOL_AC_WARDEN_WIN_ENABLED, "Warden.WinEnabled", true);
    setConfig(CONFIG_BOOL_AC_WARDEN_OSX_ENABLED, "Warden.OSXEnabled", true);
    setConfig(CONFIG_BOOL_AC_WARDEN_PLAYERS_ONLY, "Warden.PlayersOnly", false);
    setConfig(CONFIG_UINT32_AC_WARDEN_NUM_SCANS, "Warden.NumScans", 10);
    setConfig(CONFIG_UINT32_AC_WARDEN_CLIENT_RESPONSE_DELAY, "Warden.ClientResponseDelay", 30);
    setConfig(CONFIG_UINT32_AC_WARDEN_SCAN_FREQUENCY, "Warden.ScanFrequency", 15);
    setConfigMinMax(CONFIG_UINT32_AC_WARDEN_DEFAULT_PENALTY, "Warden.DefaultPenalty", WARDEN_ACTION_LOG, WARDEN_ACTION_LOG, WARDEN_ACTION_BAN);
    setConfig(CONFIG_UINT32_AC_WARDEN_CLIENT_BAN_DURATION, "Warden.BanDuration", 86400);
    m_wardenModuleDirectory = sConfig.GetStringDefault("Warden.ModuleDir", "warden_modules");

    setConfig(CONFIG_UINT32_CREATURE_SUMMON_LIMIT, "MaxCreatureSummonLimit", DEFAULT_CREATURE_SUMMON_LIMIT);

    // Smartlog data
    sLog.InitSmartlogEntries(sConfig.GetStringDefault("Smartlog.ExtraEntries", ""));
    sLog.InitSmartlogGuids(sConfig.GetStringDefault("Smartlog.ExtraGuids", ""));
}

void CharactersDatabaseWorkerThread()
{
    time_t lastCheckTime = 0;
    CharacterDatabase.ThreadStart();
    while (!sWorld.IsStopped())
    {
        std::this_thread::sleep_for(std::chrono::seconds(1));
        time_t const now = time(nullptr);
        if ((lastCheckTime + 30 * MINUTE) < now)
        {
            if (CharacterDatabase.HasAsyncQuery())
                continue;
            Player::DeleteOldCharacters();
            sObjectMgr.ReturnOrDeleteOldMails(true);
            lastCheckTime = now;
        }
    }
    CharacterDatabase.ThreadEnd();
}

char const* World::GetPatchName() const
{
    switch(GetWowPatch())
    {
        case 0:
            return "Patch 1.2: Mysteries of Maraudon";
        case 1:
            return "Patch 1.3: Ruins of the Dire Maul";
        case 2:
            return "Patch 1.4: The Call to War";
        case 3:
            return "Patch 1.5: Battlegrounds";
        case 4:
            return "Patch 1.6: Assault on Blackwing Lair";
        case 5:
            return "Patch 1.7: Rise of the Blood God";
        case 6:
            return "Patch 1.8: Dragons of Nightmare";
        case 7:
            return "Patch 1.9: The Gates of Ahn'Qiraj";
        case 8:
            return "Patch 1.10: Storms of Azeroth";
        case 9:
            return "Patch 1.11: Shadow of the Necropolis";
        case 10:
            return "Patch 1.12: Drums of War";
    }

    return "Invalid Patch!";
}

// Initialize the World
void World::SetInitialWorldSettings()
{
    // Initialize the random number generator
    srand((unsigned int)time(nullptr));

    // Time server startup
    uint32 uStartTime = WorldTimer::getMSTime();

    // Initialize config settings
    LoadConfigSettings();

    // Check the existence of the map files for all races start areas.
    if (!MapManager::ExistMapAndVMap(0, -6240.32f, 331.033f) ||
            !MapManager::ExistMapAndVMap(0, -8949.95f, -132.493f) ||
            !MapManager::ExistMapAndVMap(1, -618.518f, -4251.67f) ||
            !MapManager::ExistMapAndVMap(0, 1676.35f, 1677.45f) ||
            !MapManager::ExistMapAndVMap(1, 10311.3f, 832.463f) ||
            !MapManager::ExistMapAndVMap(1, -2917.58f, -257.98f))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Correct *.map files not found in path '%smaps' or *.vmtree/*.vmtile files in '%svmaps'. Please place *.map and vmap files in appropriate directories or correct the DataDir value in the mangosd.conf file.", m_dataPath.c_str(), m_dataPath.c_str());
        Log::WaitBeforeContinueIfNeed();
        exit(1);
    }

    // Loading strings. Getting no records means core load has to be canceled because no error message can be output.
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading MaNGOS strings...");
    if (!sObjectMgr.LoadMangosStrings())
    {
        Log::WaitBeforeContinueIfNeed();
        exit(1);                                            // Error message displayed in function already
    }

    // Loads existing IDs in the database.
    sObjectMgr.LoadAllIdentifiers();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Instance Statistics...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sInstanceStatistics.LoadFromDB();

    // Chargements des variables (necessaire pour le OutdoorJcJ)
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading saved variables ...");
    sObjectMgr.LoadSavedVariable();


    // Update the realm entry in the database with the realm type from the config file
    // No SQL injection as values are treated as integers

    // not send custom type REALM_FFA_PVP to realm list
    uint32 server_type = IsFFAPvPRealm() ? REALM_TYPE_PVP : getConfig(CONFIG_UINT32_GAME_TYPE);
    uint32 realm_zone = getConfig(CONFIG_UINT32_REALM_ZONE);
    LoginDatabase.PExecute("UPDATE `realmlist` SET `icon` = %u, `timezone` = %u WHERE `id` = '%u'", server_type, realm_zone, realmID);

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading GM security access ...");
    sAccountMgr.Load();

    // Remove the bones (they should not exist in DB though) and old corpses after a restart
    CharacterDatabase.PExecute("DELETE FROM `corpse` WHERE `corpse_type` = '0' OR `time` < (UNIX_TIMESTAMP()-'%u')", 3 * DAY);

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading spells ...");
    sSpellMgr.LoadSpells();

    sObjectMgr.LoadFactions();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading sounds ...");
    sObjectMgr.LoadSoundEntries();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading taxi nodes ...");
    sObjectMgr.LoadTaxiNodes();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading area triggers ...");
    sObjectMgr.LoadAreaTriggers();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading skill line abilities ...");
    sObjectMgr.LoadSkillLineAbility();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading mail text templates ...");
    sObjectMgr.LoadMailTemplate();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading pet spell data ...");
    sObjectMgr.LoadPetSpellData();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading world safe locs facing values ...");
    sObjectMgr.LoadWorldSafeLocsFacing();

    // Load the DBC files
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Initialize data stores...");

#ifdef _WIN32
    std::string dbcPath = m_dataPath + std::to_string(SUPPORTED_CLIENT_BUILD) + std::string("\\");
#else
    std::string dbcPath = m_dataPath + std::to_string(SUPPORTED_CLIENT_BUILD) + std::string("/");
#endif

    LoadDBCStores(dbcPath);
    DetectDBCLang();
    sObjectMgr.SetDBCLocaleIndex(GetDefaultDbcLocale());    // Get once for all the locale index of DBC language (console/broadcasts)

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Script Names...");
    sScriptMgr.LoadScriptNames();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading MapTemplate...");
    sObjectMgr.LoadMapTemplate();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading AreaTemplate...");
    sObjectMgr.LoadAreaTemplate();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading `spell_mod` and `spell_effect_mod`...");
    sSpellModMgr.LoadSpellMods();
    sSpellMgr.AssignInternalSpellFlags();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading SkillLineAbilityMultiMaps Data...");
    sSpellMgr.LoadSkillLineAbilityMaps();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading SkillRaceClassInfoMultiMap Data...");
    sSpellMgr.LoadSkillRaceClassInfoMap();

    // Clean up and pack instances
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Cleaning up instances...");
    sMapPersistentStateMgr.CleanupInstances();              // must be called before `creature_respawn`/`gameobject_respawn` tables

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Packing instances...");
    sMapPersistentStateMgr.PackInstances();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Packing groups...");
    sObjectMgr.PackGroupIds();                              // must be after CleanupInstances

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Scheduling normal instance reset...");
    sMapPersistentStateMgr.ScheduleInstanceResets();        // Must be after cleanup and packing

    // Init highest guids before any guid using table loading to prevent using not initialized guids in some code.
    sObjectMgr.SetHighestGuids();                           // must be after packing instances
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Broadcast Texts...");
    sObjectMgr.LoadBroadcastTexts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Page Texts...");
    sObjectMgr.LoadPageTexts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Game Object Templates...");     // must be after LoadPageTexts
    std::set<uint32> transportDisplayIds = sObjectMgr.LoadGameobjectInfo();
    MMAP::MMapFactory::createOrGetMMapManager()->loadAllGameObjectModels(transportDisplayIds);

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Transport templates...");
    sTransportMgr.LoadTransportTemplates();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Spell Chain Data...");
    sSpellMgr.LoadSpellChains();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Spell Elixir types...");
    sSpellMgr.LoadSpellElixirs();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Spell Learn Skills...");
    sSpellMgr.LoadSpellLearnSkills();                       // must be after LoadSpellChains

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Spell Learn Spells...");
    sSpellMgr.LoadSpellLearnSpells();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Spell Proc Event conditions...");
    sSpellMgr.LoadSpellProcEvents();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Spell Proc Item Enchant...");
    sSpellMgr.LoadSpellProcItemEnchant();                   // must be after LoadSpellChains

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Aggro Spells Definitions...");
    sSpellMgr.LoadSpellThreats();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Spell Enchant Charges...");
    sSpellMgr.LoadSpellEnchantCharges();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading NPC Texts...");
    sObjectMgr.LoadNPCText();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Item Random Enchantments Table...");
    LoadRandomEnchantmentsTable();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Items...");                     // must be after LoadRandomEnchantmentsTable and LoadPageTexts
    sObjectMgr.LoadItemPrototypes();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Item Texts...");
    sObjectMgr.LoadItemTexts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature Display Info Addon...");
    sObjectMgr.LoadCreatureDisplayInfoAddon();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Equipment templates...");
    sObjectMgr.LoadEquipmentTemplates();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature spells...");
    sObjectMgr.LoadCreatureSpells();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature class level stats...");
    sObjectMgr.LoadCreatureClassLevelStats();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature templates...");
    sObjectMgr.LoadCreatureTemplates();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading SpellsScriptTarget...");
    sSpellMgr.LoadSpellScriptTarget();                      // must be after LoadCreatureTemplates and LoadGameobjectInfo

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading ItemRequiredTarget...");
    sObjectMgr.LoadItemRequiredTarget();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Reputation Reward Rates...");
    sObjectMgr.LoadReputationRewardRate();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature Reputation OnKill Data...");
    sObjectMgr.LoadReputationOnKill();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Reputation Spillover Data...");
    sObjectMgr.LoadReputationSpilloverTemplate();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Points Of Interest Data...");
    sObjectMgr.LoadPointsOfInterest();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Pet Create Spells...");
    sObjectMgr.LoadPetCreateSpells();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature Data...");
    sObjectMgr.LoadCreatures();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature Addon Data...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sObjectMgr.LoadCreatureAddons();                        // must be after LoadCreatureTemplates() and LoadCreatures()
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Creature Addon Data loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature Groups ...");
    sCreatureGroupsManager->Load();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Gameobject Data...");
    sObjectMgr.LoadGameobjects();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Gameobject Requirements...");
    sObjectMgr.LoadGameobjectsRequirements();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Gameobject Display Info Addon...");
    sObjectMgr.LoadGameObjectDisplayInfoAddon();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading CreatureLinking Data...");      // must be after Creatures
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sCreatureLinkingMgr.LoadFromDB();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Objects Pooling Data...");
    sPoolMgr.LoadFromDB();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Weather Data...");
    sWeatherMgr.LoadWeatherZoneChances();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Quests...");
    sObjectMgr.LoadQuests();                                // must be loaded after DBCs, creature_template, item_template, gameobject tables

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Quests Relations...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sObjectMgr.LoadQuestRelations();                        // must be after quest load
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Quests Relations loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Quests Greetings...");          // must be loaded after creature_template
    sObjectMgr.LoadQuestGreetings();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Trainer Greetings...");
    sObjectMgr.LoadTrainerGreetings();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Game Event Data...");           // must be after sPoolMgr.LoadFromDB and quests to properly load pool events and quests for events, but before area trigger teleports
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sGameEventMgr.LoadFromDB();
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Game Event Data loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    // Load Conditions
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Conditions ...");
    sObjectMgr.LoadConditions();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Creature Respawn Data...");     // must be after LoadCreatures()
    sMapPersistentStateMgr.LoadCreatureRespawnTimes();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Gameobject Respawn Data...");   // must be after LoadGameobjects()
    sMapPersistentStateMgr.LoadGameobjectRespawnTimes();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading SpellArea Data...");            // must be after quest load
    sSpellMgr.LoadSpellAreas();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading AreaTrigger teleports...");
    sObjectMgr.LoadAreaTriggerTeleports();                  // must be after item template load

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Quest Area Triggers...");
    sObjectMgr.LoadQuestAreaTriggers();                     // must be after LoadQuests

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Tavern Area Triggers...");
    sObjectMgr.LoadTavernAreaTriggers();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Battleground Entrance Area Triggers...");
    sObjectMgr.LoadBattlegroundEntranceTriggers();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading AreaTrigger script names...");
    sScriptMgr.LoadAreaTriggerScripts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading event id script names...");
    sScriptMgr.LoadEventIdScripts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Graveyard-zone links...");
    sObjectMgr.LoadGraveyardZones();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading spell target destination coordinates...");
    sSpellMgr.LoadSpellTargetPositions();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading spell pet auras...");
    sSpellMgr.LoadSpellPetAuras();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Player Create Info & Level Stats...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sObjectMgr.LoadPlayerInfo();
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Player Create Info & Level Stats loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Exploration BaseXP Data...");
    sObjectMgr.LoadExplorationBaseXP();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Pet Name Parts...");
    sObjectMgr.LoadPetNames();

    CharacterDatabaseCleaner::CleanDatabase();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading character cache data...");
    sObjectMgr.LoadPlayerCacheData();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading the max pet number...");
    sObjectMgr.LoadPetNumber();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading pet level stats...");
    sObjectMgr.LoadPetLevelInfo();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Player Corpses...");
    sObjectMgr.LoadCorpses();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Loot Tables...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    LootIdSet ids_set;
    LoadLootTables(ids_set);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Loot Tables loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Skill Fishing base level requirements...");
    sObjectMgr.LoadFishingBaseSkillLevel();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Npc Text Id...");
    sObjectMgr.LoadNpcGossips();                            // must be after load Creature and LoadNPCText

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Gossip scripts...");
    sScriptMgr.LoadGossipScripts();                         // must be before gossip menu options

    sObjectMgr.LoadGossipMenus();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Vendors...");
    sObjectMgr.LoadVendorTemplates();                       // must be after load ItemTemplate
    sObjectMgr.LoadVendors();                               // must be after load CreatureTemplate, VendorTemplate, and ItemTemplate

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Trainers...");
    sObjectMgr.LoadTrainerTemplates();                      // must be after load CreatureTemplate
    sObjectMgr.LoadTrainers();                              // must be after load CreatureTemplate, TrainerTemplate

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Waypoint scripts...");          // before loading from creature_movement
    sScriptMgr.LoadCreatureMovementScripts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Waypoints...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sWaypointMgr.Load();

    // Loading localization data
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Localization strings...");
    sObjectMgr.LoadBroadcastTextLocales();
    sObjectMgr.LoadCreatureLocales();                       // must be after CreatureInfo loading
    sObjectMgr.LoadGameObjectLocales();                     // must be after GameobjectInfo loading
    sObjectMgr.LoadItemLocales();                           // must be after ItemPrototypes loading
    sObjectMgr.LoadQuestLocales();                          // must be after QuestTemplates loading
    sObjectMgr.LoadPageTextLocales();                       // must be after PageText loading
    sObjectMgr.LoadGossipMenuItemsLocales();                // must be after gossip menu items loading
    sObjectMgr.LoadPointOfInterestLocales();                // must be after POI loading
    sObjectMgr.LoadAreaLocales();
    sObjectMgr.LoadAreaTriggerLocales();
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Localization strings loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    // Load dynamic data tables from the database
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Auctions...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sAuctionMgr.LoadAuctionHouses();
    sAuctionMgr.LoadAuctionItems();
    sAuctionMgr.LoadAuctions();
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Auctions loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Guilds...");
    sGuildMgr.LoadGuilds();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Petitions...");
    sGuildMgr.LoadPetitions();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Groups...");
    sObjectMgr.LoadGroups();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading ReservedNames...");
    sObjectMgr.LoadReservedPlayersNames();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading GameObjects for quests...");
    sObjectMgr.LoadGameObjectForQuests();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading BattleMasters...");
    sBattleGroundMgr.LoadBattleMastersEntry();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading BattleGround event indexes...");
    sBattleGroundMgr.LoadBattleEventIndexes();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading GameTeleports...");
    sObjectMgr.LoadGameTele();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Taxi path transitions...");
    sObjectMgr.LoadTaxiPathTransitions();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading GM tickets and surveys...");
    sTicketMgr->Initialize();
    sTicketMgr->LoadTickets();
    sTicketMgr->LoadSurveys();

    // Handle outdated emails (delete/return)
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Returning old mails...");
    sObjectMgr.ReturnOrDeleteOldMails(false);

    // Load and initialize scripts
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Scripts...");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sScriptMgr.LoadQuestStartScripts();                     // must be after load Creature/Gameobject(Template/Data) and QuestTemplate
    sScriptMgr.LoadQuestEndScripts();                       // must be after load Creature/Gameobject(Template/Data) and QuestTemplate
    sScriptMgr.LoadSpellScripts();                          // must be after load Creature/Gameobject(Template/Data)
    sScriptMgr.LoadCreatureSpellScripts();
    sScriptMgr.LoadGameObjectScripts();                     // must be after load Creature/Gameobject(Template/Data)
    sScriptMgr.LoadEventScripts();                          // must be after load Creature/Gameobject(Template/Data)
    sScriptMgr.LoadGenericScripts();
    sScriptMgr.LoadCreatureEventAIScripts();
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">>> Scripts loaded");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Checking all script texts...");         // must be after Load*Scripts calls
    sScriptMgr.CheckAllScriptTexts();
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading CreatureEventAI Events...");
    sEventAIMgr.LoadCreatureEventAI_Events();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Initializing Scripts...");
    sScriptMgr.Initialize();
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading aura removal on map change definitions");
    sAuraRemovalMgr.LoadFromDB();

    // Initialize game time and timers
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "DEBUG:: Initialize game time and timers");
    m_gameTime = time(nullptr);
    m_startTime = m_gameTime;
    m_gameDay = (m_gameTime + m_timeZoneOffset) / DAY;

    tm local;
    time_t curr;
    time(&curr);
    local = *(localtime(&curr));                            // dereference and assign
    char isoDate[128];
    sprintf(isoDate, "%04d-%02d-%02d %02d:%02d:%02d",
            local.tm_year + 1900, local.tm_mon + 1, local.tm_mday, local.tm_hour, local.tm_min, local.tm_sec);

    LoginDatabase.PExecute("INSERT INTO `uptime` (`realmid`, `starttime`, `startstring`, `revision`) VALUES('%u', " UI64FMTD ", '%s', '%s')",
                           realmID, uint64(m_startTime), isoDate, REVISION_HASH);


    m_timers[WUPDATE_AUCTIONS].SetInterval(MINUTE * IN_MILLISECONDS);
    m_timers[WUPDATE_UPTIME].SetInterval(getConfig(CONFIG_UINT32_UPTIME_UPDATE)*MINUTE * IN_MILLISECONDS);
    //Update "uptime" table based on configuration entry in minutes.
    m_timers[WUPDATE_CORPSES].SetInterval(20 * MINUTE * IN_MILLISECONDS);
    m_timers[WUPDATE_SAVE_VAR].SetInterval(MINUTE * IN_MILLISECONDS);

    // Update groups with offline leader after delay in seconds
    m_timers[WUPDATE_GROUPS].SetInterval(IN_MILLISECONDS);

    // Initialize static helper structures
    AIRegistry::Initialize();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading GameObject models ...");
    LoadGameObjectModelList();

    // loads GO data
    sTransportMgr.LoadTransportAnimationAndRotation();

    // Initialize MapManager
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting Map System");
    sMapMgr.Initialize();

    // Initialize Battlegrounds
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting BattleGround System");
    sBattleGroundMgr.CreateInitialBattleGrounds();
    CheckLootTemplates_Reference(ids_set);

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting ZoneScripts");
    sZoneScriptMgr.InitZoneScripts();

    //Not sure if this can be moved up in the sequence (with static data loading) as it uses MapManager
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading Transports...");
    sTransportMgr.SpawnContinentTransports();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Deleting expired bans...");
    LoginDatabase.Execute("DELETE FROM `ip_banned` WHERE `unbandate`<=UNIX_TIMESTAMP() AND `unbandate`<>`bandate`");

    sHonorMaintenancer.Initialize();
    sHonorMaintenancer.DoMaintenance();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting Game Event system...");
    uint32 nextGameEvent = sGameEventMgr.Initialize();
    m_timers[WUPDATE_EVENTS].SetInterval(nextGameEvent);    //depend on next event

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading disabled spells");
    sObjectMgr.LoadSpellDisabledEntrys();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading anticheat library");
    sAnticheatMgr->LoadAnticheatData();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading auto broadcast");
    sAutoBroadCastMgr.Load();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading AH bot");
    sAuctionHouseBotMgr.Load();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Caching player phases (obsolete)");
    sObjectMgr.LoadPlayerPhaseFromDb();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Caching player pets ...");
    sCharacterDatabaseCache.LoadAll();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading PlayerBot ..."); // Requires Players cache
    sPlayerBotMgr.Load();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading faction change ...");
    sObjectMgr.LoadFactionChangeReputations();
    sObjectMgr.LoadFactionChangeSpells();
    sObjectMgr.LoadFactionChangeItems();
    sObjectMgr.LoadFactionChangeQuests();
    sObjectMgr.LoadFactionChangeMounts();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading loot-disabled map list");
    sObjectMgr.LoadMapLootDisabled();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading `cinematic_waypoints`");
    sObjectMgr.LoadCinematicsWaypoints();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading spell groups ...");
    sSpellMgr.LoadSpellGroups();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading spell group stack rules ...");
    sSpellMgr.LoadSpellGroupStackRules();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading RBAC for chat commands...");
    ChatHandler::LoadRbacPermissions();

    sObjectMgr.LoadPlayerPremadeTemplates();

    if (getConfig(CONFIG_BOOL_RESTORE_DELETED_ITEMS))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Restoring deleted items to players ...");
        sObjectMgr.RestoreDeletedItems();
    }

    if (GetWowPatch() >= WOW_PATCH_103 || !getConfig(CONFIG_BOOL_ACCURATE_LFG))
    {
        m_lfgQueueThread = IO::Multithreading::CreateThreadPtr("LfgUpdate", [&] { m_lfgQueue.Update(); });
    }

    sAnticheatMgr->StartWardenUpdateThread();

    m_broadcaster =
        std::make_unique<MovementBroadcaster>(getConfig(CONFIG_UINT32_PACKET_BCAST_THREADS),
                                              std::chrono::milliseconds(getConfig(CONFIG_UINT32_PACKET_BCAST_FREQUENCY)));

    m_charDbWorkerThread = IO::Multithreading::CreateThreadPtr("CharDB", [](){ CharactersDatabaseWorkerThread(); });
    m_asyncPacketsThread = IO::Multithreading::CreateThreadPtr("AsyncPacket", [this](){ ProcessAsyncPackets(); });

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "==========================================================");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Current content is set to %s.", GetPatchName());
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Supported client build is set to %u.", SUPPORTED_CLIENT_BUILD);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "==========================================================");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "World initialized.");

    uint32 uStartInterval = WorldTimer::getMSTimeDiff(uStartTime, WorldTimer::getMSTime());
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SERVER STARTUP TIME: %i minutes %i seconds", uStartInterval / 60000, (uStartInterval % 60000) / 1000);
}

void World::DetectDBCLang()
{
    uint32 m_lang_confid = sConfig.GetIntDefault("DBC.Locale", 255);

    if (m_lang_confid != 255 && m_lang_confid >= MAX_DBC_LOCALE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Incorrect DBC.Locale! Must be >= 0 and < %d (set to 0)", MAX_DBC_LOCALE);
        m_lang_confid = LOCALE_enUS;
    }

    ChrRacesEntry const* race = sChrRacesStore.LookupEntry(RACE_HUMAN);
    MANGOS_ASSERT(race);

    std::string availableLocalsStr;

    uint32 default_locale = MAX_DBC_LOCALE;
    for (int i = MAX_DBC_LOCALE - 1; i >= 0; --i)
    {
        if (strlen(race->name[i]) > 0)                      // check by race names
        {
            default_locale = i;
            m_availableDbcLocaleMask |= (1 << i);
            availableLocalsStr += localeNames[i];
            availableLocalsStr += " ";
        }
    }

    if (default_locale != m_lang_confid && m_lang_confid < MAX_DBC_LOCALE &&
            (m_availableDbcLocaleMask & (1 << m_lang_confid)))
        default_locale = m_lang_confid;

    if (default_locale >= MAX_DBC_LOCALE)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to determine your DBC Locale! (corrupt DBC?)");
        Log::WaitBeforeContinueIfNeed();
        exit(1);
    }

    m_defaultDbcLocale = LocaleConstant(default_locale);

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Using %s DBC Locale as default. All available DBC locales: %s", localeNames[m_defaultDbcLocale], availableLocalsStr.empty() ? "<none>" : availableLocalsStr.c_str());
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
}

// Only processes packets while session update, the messager, and cli commands processing are NOT running
void World::ProcessAsyncPackets()
{
    do
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(20));
        std::lock_guard<std::mutex> lock(m_asyncPacketsMutex);

        if (IsStopped())
            return;

        if (!m_canProcessAsyncPackets)
            continue;

        for (auto const& itr : m_sessions)
        {
            WorldSession* pSession = itr.second;

            MapSessionFilter updater(pSession);
            updater.SetProcessType(PACKET_PROCESS_ASYNC);
            pSession->ProcessPackets(updater);

            if (!m_canProcessAsyncPackets)
                break;
        }
    } while (!IsStopped());
}

// Update the World !
void World::Update(uint32 diff)
{
    m_currentMSTime = WorldTimer::getMSTime();
    m_currentTime = std::chrono::time_point_cast<std::chrono::milliseconds>(Clock::now());
    m_currentDiff = diff;
    
    // Update the different timers
    for (auto& timer : m_timers)
    {
        if (timer.GetCurrent() >= 0)
            timer.Update(diff);
        else
            timer.SetCurrent(0);
    }

    // Update the game time and check for shutdown time
    _UpdateGameTime();

    // Update mass mailer tasks if any
    sMassMailMgr.Update();

    // <ul><li> Handle auctions when the timer has passed
    if (m_timers[WUPDATE_AUCTIONS].Passed())
    {
        m_timers[WUPDATE_AUCTIONS].Reset();

        sAuctionHouseBotMgr.Update();
        // Handle expired auctions
        sAuctionMgr.Update();
    }

    {
        m_canProcessAsyncPackets = false;
        std::lock_guard<std::mutex> lock(m_asyncPacketsMutex);

        GetMessager().Execute(this);

        // <li> Handle session updates
        uint32 updateSessionsTime = WorldTimer::getMSTime();
        UpdateSessions(diff);
        updateSessionsTime = WorldTimer::getMSTimeDiffToNow(updateSessionsTime);
        if (getConfig(CONFIG_UINT32_PERFLOG_SLOW_SESSIONS_UPDATE) && updateSessionsTime > getConfig(CONFIG_UINT32_PERFLOG_SLOW_SESSIONS_UPDATE))
            sLog.Out(LOG_PERFORMANCE, LOG_LVL_MINIMAL, "Update sessions: %ums", updateSessionsTime);

        m_canProcessAsyncPackets = true;
    }

    // <li> Update uptime table
    if (m_timers[WUPDATE_UPTIME].Passed())
    {
        uint32 tmpDiff = uint32(m_gameTime - m_startTime);
        uint32 onlineClientsNum = GetActiveSessionCount();
        uint32 maxClientsNum = GetMaxActiveSessionCount();

        m_timers[WUPDATE_UPTIME].Reset();
        LoginDatabase.PExecute("UPDATE `uptime` SET `uptime` = %u, `onlineplayers` = %u, `maxplayers` = %u WHERE `realmid` = %u AND `starttime` = " UI64FMTD, tmpDiff, onlineClientsNum, maxClientsNum, realmID, uint64(m_startTime));
    }

    // Update objects (maps, transport, creatures,...)
    uint32 updateMapSystemTime = WorldTimer::getMSTime();
    
    // TODO: find a better place for this
    if (!m_updateThreads)
    {
        m_updateThreads = std::unique_ptr<ThreadPool>(new ThreadPool(
                    "WorldUpdate",
                    getConfig(CONFIG_UINT32_ASYNC_TASKS_THREADS_COUNT),
                    ThreadPool::ClearMode::UPPON_COMPLETION));
        m_updateThreads->start<ThreadPool::MySQL<>>();
    }
    std::unique_lock<std::mutex> lock(m_asyncTaskQueueMutex);
    _asyncTasks.swap(_asyncTasksBusy);
    std::future<void> job = m_updateThreads->processWorkload(_asyncTasksBusy);
    _asyncTasks.clear();
    lock.unlock();
    
    sMapMgr.Update(diff);
    sBattleGroundMgr.Update(diff);
    sGuardMgr.Update(diff);
    sZoneScriptMgr.Update(diff);

    // Update groups with offline leaders
    if (m_timers[WUPDATE_GROUPS].Passed())
    {
        m_timers[WUPDATE_GROUPS].Reset();
        if (uint32 const delay = getConfig(CONFIG_UINT32_GROUP_OFFLINE_LEADER_DELAY))
        {
            for (ObjectMgr::GroupMap::const_iterator i = sObjectMgr.GetGroupMapBegin(); i != sObjectMgr.GetGroupMapEnd(); ++i)
                i->second->UpdateOfflineLeader(m_gameTime, delay);
        }
    }

    uint32 asyncWaitBegin = WorldTimer::getMSTime();

    if (job.valid())
        job.wait();

    updateMapSystemTime = WorldTimer::getMSTimeDiffToNow(updateMapSystemTime);
    if (getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAPSYSTEM_UPDATE) && updateMapSystemTime > getConfig(CONFIG_UINT32_PERFLOG_SLOW_MAPSYSTEM_UPDATE))
        sLog.Out(LOG_PERFORMANCE, LOG_LVL_MINIMAL, "Update map system: %ums [%ums for async]", updateMapSystemTime, WorldTimer::getMSTimeDiffToNow(asyncWaitBegin));

    // Save internal variables (table variables) : DB update
    if (m_timers[WUPDATE_SAVE_VAR].Passed())
    {
        m_timers[WUPDATE_SAVE_VAR].Reset();
        sObjectMgr.SaveVariables();
    }

    // execute callbacks from sql queries that were queued recently
    uint32 asyncQueriesTime = WorldTimer::getMSTime();
    UpdateResultQueue();
    asyncQueriesTime = WorldTimer::getMSTimeDiffToNow(asyncQueriesTime);
    if (getConfig(CONFIG_UINT32_PERFLOG_SLOW_ASYNC_QUERIES) && asyncQueriesTime > getConfig(CONFIG_UINT32_PERFLOG_SLOW_ASYNC_QUERIES))
        sLog.Out(LOG_PERFORMANCE, LOG_LVL_MINIMAL, "Update async queries: %ums", asyncQueriesTime);

    // Erase old corpses
    if (m_timers[WUPDATE_CORPSES].Passed())
    {
        m_timers[WUPDATE_CORPSES].Reset();

        sObjectAccessor.RemoveOldCorpses();
    }

    // Process Game events when necessary
    if (m_timers[WUPDATE_EVENTS].Passed())
    {
        m_timers[WUPDATE_EVENTS].Reset();                   // to give time for Update() to be processed
        uint32 nextGameEvent = sGameEventMgr.Update();
        m_timers[WUPDATE_EVENTS].SetInterval(nextGameEvent);
        m_timers[WUPDATE_EVENTS].Reset();
    }

    // </ul>
    // Move all creatures with "delayed move" and remove and delete all objects with "delayed remove"
    sMapMgr.RemoveAllObjectsInRemoveList();

    // update the instance reset times
    sMapPersistentStateMgr.Update();

    // Maintenance checker
    if (m_MaintenanceTimeChecker < diff)
    {
        sHonorMaintenancer.CheckMaintenanceDay();
        m_MaintenanceTimeChecker = 60000;
    }
    else
        m_MaintenanceTimeChecker -= diff;

    // Update PlayerBotMgr
    sPlayerBotMgr.Update(diff);
    // Update AutoBroadcast
    sAutoBroadCastMgr.Update(diff);
    // Update ban list if necessary
    sAccountMgr.Update(diff);

    {
        m_canProcessAsyncPackets = false;
        std::lock_guard<std::mutex> lock(m_asyncPacketsMutex);

        // And last, but not least handle the issued cli commands
        ProcessCliCommands();

        m_canProcessAsyncPackets = true;
    }

    //cleanup unused GridMap objects as well as VMaps
    if (getConfig(CONFIG_BOOL_CLEANUP_TERRAIN))
        sTerrainMgr.Update(diff);
}

// Send a packet to all players (except self if mentioned)
void World::SendGlobalMessage(WorldPacket* packet, WorldSession* self, uint32 team)
{
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            if (session != self)
            {
                Player* player = session->GetPlayer();
                if (player && player->IsInWorld() && (team == TEAM_NONE || player->GetTeam() == team))
                    session->SendPacket(packet);
            }
        }
    }
}

namespace MaNGOS
{
class WorldWorldTextBuilder
{
public:
    typedef std::vector<WorldPacket*> WorldPacketList;
    explicit WorldWorldTextBuilder(int32 textId, va_list* args = nullptr) : i_textId(textId), i_args(args) {}
    void operator()(WorldPacketList& data_list, int32 loc_idx)
    {
        char const* text = sObjectMgr.GetMangosString(i_textId, loc_idx);

        if (i_args)
        {
            // we need copy va_list before use or original va_list will corrupted
            va_list ap;
            va_copy(ap, *i_args);

            char str [2048];
            vsnprintf(str, 2048, text, ap);
            va_end(ap);

            do_helper(data_list, &str[0]);
        }
        else
            do_helper(data_list, (char*)text);
    }
private:
    char* lineFromMessage(char*& pos)
    {
        char* start = strtok(pos, "\n");
        pos = nullptr;
        return start;
    }
    void do_helper(WorldPacketList& data_list, char* text)
    {
        char* pos = text;

        while (char* line = lineFromMessage(pos))
        {
            WorldPacket* data = new WorldPacket();
            ChatHandler::BuildChatPacket(*data, CHAT_MSG_SYSTEM, line);
            data_list.push_back(data);
        }
    }

    int32 i_textId;
    va_list* i_args;
};
class WorldBroadcastTextBuilder
{
public:
    typedef std::vector<WorldPacket*> WorldPacketList;
    explicit WorldBroadcastTextBuilder(uint32 textId) : i_textId(textId) {}
    void operator()(WorldPacketList& data_list, uint32 loc_idx)
    {
        char const* text = sObjectMgr.GetBroadcastText(i_textId, loc_idx);
        do_helper(data_list, (char*)text);
    }
private:
    char* lineFromMessage(char*& pos)
    {
        char* start = strtok(pos, "\n");
        pos = nullptr;
        return start;
    }
    void do_helper(WorldPacketList& data_list, char* text)
    {
        char* pos = text;

        while (char* line = lineFromMessage(pos))
        {
            WorldPacket* data = new WorldPacket();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            ChatHandler::BuildChatPacket(*data, CHAT_MSG_BG_SYSTEM_NEUTRAL, line);
#else
            ChatHandler::BuildChatPacket(*data, CHAT_MSG_SYSTEM, line);
#endif
            data_list.push_back(data);
        }
    }

    uint32 i_textId;
};
}                                                           // namespace MaNGOS

// Send a System Message to all players (except self if mentioned)
void World::SendWorldText(int32 string_id, ...)
{
    va_list ap;
    va_start(ap, string_id);

    MaNGOS::WorldWorldTextBuilder wt_builder(string_id, &ap);
    MaNGOS::LocalizedPacketListDo<MaNGOS::WorldWorldTextBuilder> wt_do(wt_builder);
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            Player* player = session->GetPlayer();
            if (player && player->IsInWorld())
                wt_do(player);
        }
    }

    va_end(ap);
}

// Send a System Message to all players in the same battleground or queue (except self if mentioned)
void World::SendWorldTextToBGAndQueue(int32 string_id, uint32 queuedPlayerLevel, uint32 queueType, ...)
{
    auto queueTypeId = static_cast<BattleGroundQueueTypeId>(queueType);
    BattleGroundTypeId bgTypeId = BattleGroundMgr::BgTemplateId(queueTypeId);
    BattleGroundBracketId queuedPlayerBracket = Player::GetBattleGroundBracketIdFromLevel(bgTypeId, queuedPlayerLevel);

    va_list ap;
    va_start(ap, queueType);

    MaNGOS::WorldWorldTextBuilder wt_builder(string_id, &ap);
    MaNGOS::LocalizedPacketListDo<MaNGOS::WorldWorldTextBuilder> wt_do(wt_builder);
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            Player* player = session->GetPlayer();
            if (player && player->IsInWorld())
            {
                // Always announce it to all GMs.
                if (session->GetSecurity() > SEC_PLAYER)
                {
                    wt_do(player);
                    continue;
                }

                // If player is queued or already inside a BG matching the BG type.
                if (player->InBattleGroundQueueForBattleGroundQueueType(queueTypeId) ||
                    (player->InBattleGround() && player->GetBattleGroundTypeId() == bgTypeId))
                {
                    // If player bracket matches the queued player bracket.
                    if (player->GetBattleGroundBracketIdFromLevel(bgTypeId) == queuedPlayerBracket)
                        wt_do(player);
                }

            }
        }
    }

    va_end(ap);
}

void World::SendBroadcastTextToWorld(uint32 textId)
{
    MaNGOS::WorldBroadcastTextBuilder wt_builder(textId);
    MaNGOS::LocalizedPacketListDo<MaNGOS::WorldBroadcastTextBuilder> wt_do(wt_builder);
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            Player* player = session->GetPlayer();
            if (player && player->IsInWorld())
                wt_do(player);
        }
    }
}

void World::SendGMTicketText(char const* text)
{
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            if (session->GetSecurity() > SEC_PLAYER)
            {
                Player* player = session->GetPlayer();
                if (player && player->IsInWorld() && player->IsAcceptTickets())
                    ChatHandler(player).SendSysMessage(text);
            }
        }
    }
}

void World::SendGMTicketText(int32 string_id, ...)
{
    va_list ap;
    va_start(ap, string_id);

    MaNGOS::WorldWorldTextBuilder wt_builder(string_id, &ap);
    MaNGOS::LocalizedPacketListDo<MaNGOS::WorldWorldTextBuilder> wt_do(wt_builder);
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            if (session->GetSecurity() > SEC_PLAYER)
            {
                Player* player = session->GetPlayer();
                if (player && player->IsInWorld() && player->IsAcceptTickets())
                {
                    wt_do(player);
                }
            }
        }
    }

    va_end(ap);
}

void World::SendGMText(int32 string_id, ...)
{
    va_list ap;
    va_start(ap, string_id);

    MaNGOS::WorldWorldTextBuilder wt_builder(string_id, &ap);
    MaNGOS::LocalizedPacketListDo<MaNGOS::WorldWorldTextBuilder> wt_do(wt_builder);
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            if (session->GetSecurity() > SEC_PLAYER)
            {
                Player* player = session->GetPlayer();
                if (player && player->IsInWorld())
                {
                    wt_do(player);
                }
            }
        }
    }

    va_end(ap);
}

// DEPRICATED, only for debug purpose. Send a System Message to all players (except self if mentioned)
void World::SendGlobalText(char const* text, WorldSession* self)
{
    WorldPacket data;

    // need copy to prevent corruption by strtok call in LineFromMessage original string
    char* buf = mangos_strdup(text);
    char* pos = buf;

    while (char* line = ChatHandler::LineFromMessage(pos))
    {
        ChatHandler::BuildChatPacket(data, CHAT_MSG_SYSTEM, line);
        SendGlobalMessage(&data, self);
    }

    delete [] buf;
}

// Send a packet to all players (or players selected team) in the zone (except self if mentioned)
void World::SendZoneMessage(uint32 zone, WorldPacket* packet, WorldSession* self, uint32 team)
{
    for (const auto& itr : m_sessions)
    {
        if (WorldSession* session = itr.second)
        {
            if (session != self)
            {
                Player* player = session->GetPlayer();
                if (player && player->IsInWorld() &&
                   (player->GetZoneId() == zone) &&
                   (team == TEAM_NONE || player->GetTeam() == team))
                {
                    session->SendPacket(packet);
                }
            }
        }
    }
}

// Send a System Message to all players in the zone (except self if mentioned)
void World::SendZoneText(uint32 zone, char const* text, WorldSession* self, uint32 team)
{
    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_SYSTEM, text);
    SendZoneMessage(zone, &data, self, team);
}

// Kick (and save) all players
void World::KickAll()
{
    m_QueuedSessions.clear();                               // prevent send queue update packet and login queued sessions

    // session not removed at kick and will removed in next update tick
    for (const auto& itr : m_sessions)
        itr.second->KickPlayer();
    for (const auto& itr : m_disconnectedSessions)
        (*itr).KickPlayer();
}

// Kick (and save) all players with security level less `sec`
void World::KickAllLess(AccountTypes sec)
{
    // session not removed at kick and will removed in next update tick
    for (const auto& itr : m_sessions)
        if (WorldSession* session = itr.second)
            if (session->GetSecurity() < sec)
                session->KickPlayer();
}

void World::WarnAccount(uint32 accountId, std::string from, std::string reason, char const* type)
{
    LoginDatabase.escape_string(from);
    reason = std::string(type) + ": " + reason;
    LoginDatabase.escape_string(reason);

    LoginDatabase.PExecute("INSERT INTO `account_banned` (`id`, `bandate`, `unbandate`, `bannedby`, `banreason`, `active`, `realm`) VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+1, '%s', '%s', '0', %u)",
            accountId, from.c_str(), reason.c_str(), realmID);
}

void World::BanAccount(uint32 accountId, uint32 duration, std::string reason, std::string const& author)
{
    LoginDatabase.escape_string(reason);
    std::string safe_author = author;
    LoginDatabase.escape_string(safe_author);

    //No SQL injection as strings are escaped
    LoginDatabase.PExecute("INSERT INTO `account_banned` (`id`, `bandate`, `unbandate`, `bannedby`, `banreason`, `active`, `realm`) VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+%u, '%s', '%s', '1', %u)",
        accountId, duration, safe_author.c_str(), reason.c_str(), realmID);

    if (duration > 0)
        sAccountMgr.BanAccount(accountId, time(nullptr) + duration);
    else
        sAccountMgr.BanAccount(accountId, 0xFFFFFFFF);

    if (WorldSession* sess = FindSession(accountId))
    {
        if (std::string(sess->GetPlayerName()) != author)
        {
            sess->LogoutPlayer(true);
            sess->KickPlayer();
        }
    }
}

class BanQueryHolder : public SqlQueryHolder
{
public:
    BanQueryHolder(BanMode mode, std::string banTarget, uint32 duration, std::string reason, uint32 realmId, std::string author,
        uint32 authorAccountId)
        : m_mode(mode), m_duration(duration), m_reason(reason), m_realmId(realmId), 
          m_author(author), m_banTarget(banTarget), m_accountId(authorAccountId)
    {
    }

    BanMode GetBanMode() const { return m_mode; }
    uint32 GetDuration() const { return m_duration; }
    std::string& GetReason() { return m_reason; }
    uint32 GetRealmId() const { return m_realmId; }
    std::string& GetAuthor() { return m_author; }
    std::string& GetBanTarget() { return m_banTarget; }
    uint32 GetAuthorAccountId() const { return m_accountId; }

private:
    BanMode m_mode;
    uint32 m_duration;
    std::string m_reason;
    uint32 m_realmId;
    std::string m_author;
    std::string m_banTarget;
    uint32 m_accountId;
};

// Not thread-safe, performed in async unsafe callback
class BanAccountHandler
{
public:
    void HandleAccountSelectResult(std::unique_ptr<QueryResult>, SqlQueryHolder* queryHolder)
    {
        BanQueryHolder* holder = dynamic_cast<BanQueryHolder*>(queryHolder);
        if (!holder)
            return;

        BanReturn banResult = BAN_SUCCESS;

        WorldSession* session = sWorld.FindSession(holder->GetAuthorAccountId());

        std::unique_ptr<QueryResult> result = holder->TakeResult(0);
        if (!result)
        {
            if (session)
                ChatHandler(session).SendBanResult(holder->GetBanMode(), BAN_NOTFOUND, holder->GetBanTarget(), holder->GetDuration(), holder->GetReason());
            delete holder;
            return;
        }

        // Disconnect all affected players (for IP it can be several)
        do
        {
            Field* fieldsAccount = result->Fetch();
            uint32 account = fieldsAccount->GetUInt32();

            if (holder->GetBanMode() != BAN_IP)
            {
                //No SQL injection as strings are escaped
                LoginDatabase.PExecute("INSERT INTO `account_banned` (`id`, `bandate`, `unbandate`, `bannedby`, `banreason`, `active`, `realm`) VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+%u, '%s', '%s', '1', %u)",
                    account, holder->GetDuration(), holder->GetAuthor().c_str(), holder->GetReason().c_str(), holder->GetRealmId());
                if (holder->GetDuration() > 0)
                    sAccountMgr.BanAccount(account, time(nullptr) + holder->GetDuration());
                else
                    sAccountMgr.BanAccount(account, 0xFFFFFFFF);
            }
            // Don't immediately kick if we're banning ourselves (destroys session, crash)
            if (account != holder->GetAuthorAccountId())
            {
                if (WorldSession* sess = sWorld.FindSession(account))
                {
                    sess->LogoutPlayer(true);
                    sess->KickPlayer();
                }
            }
        } while (result->NextRow());

        banResult = BAN_SUCCESS;

        if (session)
        {
            ChatHandler(session).SendBanResult(holder->GetBanMode(), banResult, holder->GetBanTarget(), holder->GetDuration(), holder->GetReason());
        }

        holder->DeleteAllResults();
        delete holder;
    }
} banHandler;

// Ban an account or ban an IP address, duration_secs if it is positive used, otherwise permban
BanReturn World::BanAccount(BanMode mode, std::string nameOrIP, uint32 duration_secs, std::string reason, std::string author)
{
    LoginDatabase.escape_string(nameOrIP);
    LoginDatabase.escape_string(reason);
    std::string safe_author = author;
    LoginDatabase.escape_string(safe_author);

    PlayerCacheData const* authorData = sObjectMgr.GetPlayerDataByName(author);

    BanQueryHolder* holder = new BanQueryHolder(mode, nameOrIP, duration_secs, reason, realmID, safe_author,
        authorData ? authorData->uiAccount : 0);

    holder->SetSize(1);

    DatabaseType* db = nullptr;
    // Update the database with ban information
    switch (mode)
    {
        case BAN_IP:
            //No SQL injection as strings are escaped
            db = &LoginDatabase;

            holder->SetPQuery(0, "SELECT `id` FROM `account` WHERE `last_ip` = '%s'", nameOrIP.c_str());
            LoginDatabase.PExecute("INSERT INTO `ip_banned` VALUES ('%s',UNIX_TIMESTAMP(),UNIX_TIMESTAMP()+%u,'%s','%s')", nameOrIP.c_str(), duration_secs, safe_author.c_str(), reason.c_str());

            if (duration_secs > 0)
                sAccountMgr.BanIP(nameOrIP, time(nullptr) + duration_secs);
            else
                sAccountMgr.BanIP(nameOrIP, 0xFFFFFFFF);
            break;
        case BAN_ACCOUNT:
            //No SQL injection as string is escaped
            db = &LoginDatabase;
            holder->SetPQuery(0, "SELECT `id` FROM `account` WHERE `username` = '%s'", nameOrIP.c_str());
            break;
        case BAN_CHARACTER:
        {
            db = &CharacterDatabase;
            if (uint32 guid = sObjectMgr.GetPlayerGuidByName(nameOrIP))
                holder->SetPQuery(0, "SELECT `account` FROM `characters` WHERE `guid` = %u", guid);
            break;
        }
        default:
            delete holder;

            return BAN_SYNTAX_ERROR;
    }

    db->DelayQueryHolderUnsafe(&banHandler, &BanAccountHandler::HandleAccountSelectResult, holder);

    return BAN_INPROGRESS;
}

// Remove a ban from an account or IP address
bool World::RemoveBanAccount(BanMode mode, std::string const& source, std::string const& message, std::string nameOrIP)
{
    if (mode == BAN_IP)
    {
        LoginDatabase.escape_string(nameOrIP);
        LoginDatabase.PExecute("DELETE FROM `ip_banned` WHERE `ip` = '%s'", nameOrIP.c_str());
        sAccountMgr.UnbanIP(nameOrIP);
    }
    else
    {
        uint32 account = 0;
        if (mode == BAN_ACCOUNT)
            account = sAccountMgr.GetId(nameOrIP);
        else if (mode == BAN_CHARACTER)
            account = sObjectMgr.GetPlayerAccountIdByPlayerName(nameOrIP);

        if (!account)
            return false;

        //NO SQL injection as account is uint32
        LoginDatabase.PExecute("UPDATE `account_banned` SET `active` = '0' WHERE `id` = '%u'", account);
        WarnAccount(account, source, message, "UNBAN");
        sAccountMgr.UnbanAccount(account);
    }
    return true;
}

// Update the game time
void World::_UpdateGameTime()
{
    // update the time
    time_t thisTime = time(nullptr);
    uint32 elapsed = uint32(thisTime - m_gameTime);
    m_gameTime = thisTime;
    m_gameDay = (m_gameTime + m_timeZoneOffset) / DAY;

    // if there is a shutdown timer
    if (!m_stopEvent && m_ShutdownTimer > 0 && elapsed > 0)
    {
        // ... and it is overdue, stop the world (set m_stopEvent)
        if (m_ShutdownTimer <= elapsed)
        {
            if (!(m_ShutdownMask & SHUTDOWN_MASK_IDLE) || GetActiveAndQueuedSessionCount() == 0)
                m_stopEvent = true;                         // exist code already set
            else
                m_ShutdownTimer = 1;                        // minimum timer value to wait idle state
        }
        // ... else decrease it and if necessary display a shutdown countdown to the users
        else
        {
            m_ShutdownTimer -= elapsed;

            ShutdownMsg();
        }
    }
}

// Shutdown the server
void World::ShutdownServ(uint32 time, uint32 options, uint8 exitcode)
{
    // ignore if server shutdown at next tick
    if (m_stopEvent)
        return;

    m_ShutdownMask = options;
    m_ExitCode = exitcode;

    // If the shutdown time is 0, set m_stopEvent (except if shutdown is 'idle' with remaining sessions)
    if (time == 0)
    {
        if (!(options & SHUTDOWN_MASK_IDLE) || GetActiveAndQueuedSessionCount() == 0)
            m_stopEvent = true;                             // exist code already set
        else
            m_ShutdownTimer = 1;                            //So that the session count is re-evaluated at next world tick
    }
    // Else set the shutdown timer and warn users
    else
    {
        m_ShutdownTimer = time;
        ShutdownMsg(true);
    }
}

// Display a shutdown message to the user(s)
void World::ShutdownMsg(bool show, Player* player)
{
    // not show messages for idle shutdown mode
    if (m_ShutdownMask & SHUTDOWN_MASK_IDLE)
        return;

    // Display a message every 12 hours, hours, 5 minutes, minute, 5 seconds and finally seconds
    if (show ||
            (m_ShutdownTimer < 10) ||
            // < 30 sec; every 5 sec
            (m_ShutdownTimer < 30        && (m_ShutdownTimer % 5) == 0) ||
            // < 5 min ; every 1 min
            (m_ShutdownTimer < 5 * MINUTE  && (m_ShutdownTimer % MINUTE) == 0) ||
            // < 30 min ; every 5 min
            (m_ShutdownTimer < 30 * MINUTE && (m_ShutdownTimer % (5 * MINUTE)) == 0) ||
            // < 12 h ; every 1 h
            (m_ShutdownTimer < 12 * HOUR   && (m_ShutdownTimer % HOUR) == 0) ||
            // > 12 h ; every 12 h
            (m_ShutdownTimer > 12 * HOUR   && (m_ShutdownTimer % (12 * HOUR)) == 0))
    {
        std::string str = secsToTimeString(m_ShutdownTimer);

        ServerMessageType msgid = (m_ShutdownMask & SHUTDOWN_MASK_RESTART) ? SERVER_MSG_RESTART_TIME : SERVER_MSG_SHUTDOWN_TIME;

        SendServerMessage(msgid, str.c_str(), player);
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Server is %s in %s", (m_ShutdownMask & SHUTDOWN_MASK_RESTART ? "restart" : "shutting down"), str.c_str());
    }
}

// Cancel a planned server shutdown
void World::ShutdownCancel()
{
    // nothing cancel or too later
    if (!m_ShutdownTimer || m_stopEvent)
        return;

    ServerMessageType msgid = (m_ShutdownMask & SHUTDOWN_MASK_RESTART) ? SERVER_MSG_RESTART_CANCELLED : SERVER_MSG_SHUTDOWN_CANCELLED;

    m_ShutdownMask = 0;
    m_ShutdownTimer = 0;
    m_ExitCode = SHUTDOWN_EXIT_CODE;                       // to default value
    SendServerMessage(msgid);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Server %s cancelled.", (m_ShutdownMask & SHUTDOWN_MASK_RESTART ? "restart" : "shutdown"));
}

// Send a server message to the user(s)
void World::SendServerMessage(ServerMessageType type, char const* text, Player* player)
{
    WorldPacket data(SMSG_SERVER_MESSAGE, 50);              // guess size
    data << uint32(type);
    data << text;

    if (player)
        player->GetSession()->SendPacket(&data);
    else
        SendGlobalMessage(&data);
}

void World::UpdateSessions(uint32 diff)
{
    // Update player limit if needed
    int32 hardPlayerLimit = getConfig(CONFIG_UINT32_PLAYER_HARD_LIMIT);
    if (hardPlayerLimit)
        m_playerLimit = std::min(hardPlayerLimit, m_playerLimit);
    uint32 loggedInSessions = uint32(m_sessions.size() - m_QueuedSessions.size());
    if (m_playerLimit >= 0 && static_cast <int32> (loggedInSessions) < hardPlayerLimit)
        if (uint32 acceptNow = getConfig(CONFIG_UINT32_LOGIN_PER_TICK))
        {
            m_playerLimit = std::min(m_playerLimit + acceptNow, loggedInSessions + acceptNow);
            if (hardPlayerLimit && m_playerLimit > hardPlayerLimit)
            {
                m_playerLimit = hardPlayerLimit;
                acceptNow = 0;
            }
            for (uint32 i = 0; i < acceptNow && !m_QueuedSessions.empty(); ++i)
            {
                // accept first in queue
                WorldSession* pop_sess = m_QueuedSessions.front();
                pop_sess->SetInQueue(false);
                pop_sess->m_idleTime = WorldTimer::getMSTime();
                pop_sess->SendAuthWaitQue(0);
                pop_sess->InitWarden();
                m_QueuedSessions.pop_front();
            }

            // update position from iter to end()
            // iter point to first not updated socket, position store new position
            int position = 1;
            for (Queue::iterator iter = m_QueuedSessions.begin(); iter != m_QueuedSessions.end(); ++iter, ++position)
                (*iter)->SendAuthWaitQue(position);
        }

    // Add new sessions
    WorldSession* sess;
    while (addSessQueue.next(sess))
        AddSession_(sess);

    // Then send an update signal to remaining ones
    time_t timeNow = time(nullptr);
    for (SessionMap::iterator itr = m_sessions.begin(), next; itr != m_sessions.end(); itr = next)
    {
        next = itr;
        ++next;
        // and remove not active sessions from the list
        WorldSession* pSession = itr->second;
        WorldSessionFilter updater(pSession);

        if (!pSession->Update(updater))
        {
            if (pSession->PlayerLoading())
                sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[CRASH] World::UpdateSession attempt to delete session %u loading a player.", pSession->GetAccountId());
            
            AccountPlayHistory& history = m_accountsPlayHistory[pSession->GetAccountId()];
            if (!RemoveQueuedSession(pSession))
                history.logoutTime = timeNow;
            history.playedTime += (timeNow - pSession->GetCreateTime());

            m_sessions.erase(itr);
            delete pSession;
        }
    }
    // Update disconnected sessions
    for (SessionSet::iterator itr = m_disconnectedSessions.begin(), next; itr != m_disconnectedSessions.end(); itr = next)
    {
        next = itr;
        ++next;
        WorldSession* pSession = *itr;

        if (!pSession->UpdateDisconnected(diff))
        {
            delete pSession;
            m_disconnectedSessions.erase(itr);
        }
    }
}

// This handles the issued and queued CLI/RA commands
void World::ProcessCliCommands()
{
    CliCommandHolder* command;
    while (cliCmdQueue.next(command))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "CLI command under processing...");
        CliCommandHolder::Print* zprint = command->m_print;
        void* callbackArg = command->m_callbackArg;
        CliHandler handler(command->m_cliAccountId, command->m_cliAccessLevel, callbackArg, zprint);
        handler.ParseCommands(command->m_command);

        if (command->m_commandFinished)
            command->m_commandFinished(callbackArg, !handler.HasSentErrorMessage());

        delete command;
    }
}

void World::InitResultQueue()
{
}

void World::UpdateResultQueue()
{
    //process async result queues
    CharacterDatabase.ProcessResultQueue(getConfig(CONFIG_UINT32_ASYNC_QUERIES_TICK_TIMEOUT));
    WorldDatabase.ProcessResultQueue(getConfig(CONFIG_UINT32_ASYNC_QUERIES_TICK_TIMEOUT));
    LoginDatabase.ProcessResultQueue(getConfig(CONFIG_UINT32_ASYNC_QUERIES_TICK_TIMEOUT));
}

void World::UpdateRealmCharCount(uint32 accountId)
{
    CharacterDatabase.AsyncPQuery(this, &World::_UpdateRealmCharCount, accountId,
                                  "SELECT COUNT(`guid`) FROM `characters` WHERE `account` = '%u'", accountId);
}

void World::_UpdateRealmCharCount(std::unique_ptr<QueryResult> resultCharCount, uint32 accountId)
{
    if (resultCharCount)
    {
        Field* fields = resultCharCount->Fetch();
        uint32 charCount = fields[0].GetUInt32();

        LoginDatabase.PExecute("REPLACE INTO `realmcharacters` (`numchars`, `acctid`, `realmid`) VALUES (%u, %u, %u)", charCount, accountId, realmID);
    }
}

void World::SetPlayerLimit(int32 limit, bool needUpdate)
{
    if (limit < -SEC_ADMINISTRATOR)
        limit = -SEC_ADMINISTRATOR;

    // lock update need
    bool db_update_need = needUpdate || (limit < 0) != (m_playerLimit < 0) || (limit < 0 && m_playerLimit < 0 && limit != m_playerLimit);

    m_playerLimit = limit;

    if (db_update_need)
        LoginDatabase.PExecute("UPDATE `realmlist` SET `allowedSecurityLevel` = '%u' WHERE `id` = '%u'",
                               uint32(GetPlayerSecurityLimit()), realmID);
}

void World::UpdateMaxSessionCounters()
{
    m_maxActiveSessionCount = std::max(m_maxActiveSessionCount, uint32(m_sessions.size() - m_QueuedSessions.size()));
    m_maxQueuedSessionCount = std::max(m_maxQueuedSessionCount, uint32(m_QueuedSessions.size()));
}

void World::setConfig(eConfigUInt32Values index, char const* fieldname, uint32 defvalue)
{
    setConfig(index, sConfig.GetIntDefault(fieldname, defvalue));
}

void World::setConfig(eConfigInt32Values index, char const* fieldname, int32 defvalue)
{
    setConfig(index, sConfig.GetIntDefault(fieldname, defvalue));
}

void World::setConfig(eConfigFloatValues index, char const* fieldname, float defvalue)
{
    setConfig(index, sConfig.GetFloatDefault(fieldname, defvalue));
}

void World::setConfig(eConfigBoolValues index, char const* fieldname, bool defvalue)
{
    setConfig(index, sConfig.GetBoolDefault(fieldname, defvalue));
}

void World::setConfigPos(eConfigUInt32Values index, char const* fieldname, uint32 defvalue)
{
    setConfig(index, fieldname, defvalue);
    if (int32(getConfig(index)) < 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%i) can't be negative. Using %u instead.", fieldname, int32(getConfig(index)), defvalue);
        setConfig(index, defvalue);
    }
}

void World::setConfigPos(eConfigFloatValues index, char const* fieldname, float defvalue)
{
    setConfig(index, fieldname, defvalue);
    if (getConfig(index) < 0.0f)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%f) can't be negative. Using %f instead.", fieldname, getConfig(index), defvalue);
        setConfig(index, defvalue);
    }
}

void World::setConfigMin(eConfigUInt32Values index, char const* fieldname, uint32 defvalue, uint32 minvalue)
{
    setConfig(index, fieldname, defvalue);
    if (getConfig(index) < minvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%u) must be >= %u. Using %u instead.", fieldname, getConfig(index), minvalue, minvalue);
        setConfig(index, minvalue);
    }
}

void World::setConfigMin(eConfigInt32Values index, char const* fieldname, int32 defvalue, int32 minvalue)
{
    setConfig(index, fieldname, defvalue);
    if (getConfig(index) < minvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%i) must be >= %i. Using %i instead.", fieldname, getConfig(index), minvalue, minvalue);
        setConfig(index, minvalue);
    }
}

void World::setConfigMin(eConfigFloatValues index, char const* fieldname, float defvalue, float minvalue)
{
    setConfig(index, fieldname, defvalue);
    if (getConfig(index) < minvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%f) must be >= %f. Using %f instead.", fieldname, getConfig(index), minvalue, minvalue);
        setConfig(index, minvalue);
    }
}

void World::setConfigMinMax(eConfigUInt32Values index, char const* fieldname, uint32 defvalue, uint32 minvalue, uint32 maxvalue)
{
    setConfig(index, fieldname, defvalue);
    if (getConfig(index) < minvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%u) must be in range %u...%u. Using %u instead.", fieldname, getConfig(index), minvalue, maxvalue, minvalue);
        setConfig(index, minvalue);
    }
    else if (getConfig(index) > maxvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%u) must be in range %u...%u. Using %u instead.", fieldname, getConfig(index), minvalue, maxvalue, maxvalue);
        setConfig(index, maxvalue);
    }
}

void World::setConfigMinMax(eConfigInt32Values index, char const* fieldname, int32 defvalue, int32 minvalue, int32 maxvalue)
{
    setConfig(index, fieldname, defvalue);
    if (getConfig(index) < minvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%i) must be in range %i...%i. Using %i instead.", fieldname, getConfig(index), minvalue, maxvalue, minvalue);
        setConfig(index, minvalue);
    }
    else if (getConfig(index) > maxvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%i) must be in range %i...%i. Using %i instead.", fieldname, getConfig(index), minvalue, maxvalue, maxvalue);
        setConfig(index, maxvalue);
    }
}

void World::setConfigMinMax(eConfigFloatValues index, char const* fieldname, float defvalue, float minvalue, float maxvalue)
{
    setConfig(index, fieldname, defvalue);
    if (getConfig(index) < minvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%f) must be in range %f...%f. Using %f instead.", fieldname, getConfig(index), minvalue, maxvalue, minvalue);
        setConfig(index, minvalue);
    }
    else if (getConfig(index) > maxvalue)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s (%f) must be in range %f...%f. Using %f instead.", fieldname, getConfig(index), minvalue, maxvalue, maxvalue);
        setConfig(index, maxvalue);
    }
}

bool World::configNoReload(bool reload, eConfigUInt32Values index, char const* fieldname, uint32 defvalue)
{
    if (!reload)
        return true;

    uint32 val = sConfig.GetIntDefault(fieldname, defvalue);
    if (val != getConfig(index))
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s option can't be changed at mangosd.conf reload, using current value (%u).", fieldname, getConfig(index));

    return false;
}

bool World::configNoReload(bool reload, eConfigInt32Values index, char const* fieldname, int32 defvalue)
{
    if (!reload)
        return true;

    int32 val = sConfig.GetIntDefault(fieldname, defvalue);
    if (val != getConfig(index))
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s option can't be changed at mangosd.conf reload, using current value (%i).", fieldname, getConfig(index));

    return false;
}

bool World::configNoReload(bool reload, eConfigFloatValues index, char const* fieldname, float defvalue)
{
    if (!reload)
        return true;

    float val = sConfig.GetFloatDefault(fieldname, defvalue);
    if (val != getConfig(index))
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s option can't be changed at mangosd.conf reload, using current value (%f).", fieldname, getConfig(index));

    return false;
}

bool World::configNoReload(bool reload, eConfigBoolValues index, char const* fieldname, bool defvalue)
{
    if (!reload)
        return true;

    bool val = sConfig.GetBoolDefault(fieldname, defvalue);
    if (val != getConfig(index))
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "%s option can't be changed at mangosd.conf reload, using current value (%s).", fieldname, getConfig(index) ? "'true'" : "'false'");

    return false;
}

void World::InvalidatePlayerDataToAllClient(ObjectGuid guid)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    WorldPacket data(SMSG_INVALIDATE_PLAYER, 8);
    data << guid;
    SendGlobalMessage(&data);
#endif
}

void World::SetSessionDisconnected(WorldSession* sess)
{
    SessionMap::iterator itr = m_sessions.find(sess->GetAccountId());
    ASSERT(itr != m_sessions.end());

    AccountPlayHistory& history = m_accountsPlayHistory[sess->GetAccountId()];
    history.logoutTime = time(nullptr);
    history.playedTime += (history.logoutTime - sess->GetCreateTime());

    m_sessions.erase(itr);
    m_disconnectedSessions.insert(sess);
}

void World::AddAsyncTask(std::function<void()> task) {
    std::lock_guard<std::mutex> lock(m_asyncTaskQueueMutex);
    _asyncTasks.push_back(std::move(task));
}

void World::LogMoneyTrade(ObjectGuid sender, ObjectGuid receiver, uint32 amount, const char* type, uint32 dataInt)
{
    if (!LogsDatabase || !getConfig(CONFIG_BOOL_LOGSDB_TRADES))
        return;
    static SqlStatementID insLogMoney;
    SqlStatement logStmt = LogsDatabase.CreateStatement(insLogMoney, "INSERT INTO `logs_trade` SET `sender`=?, `senderType`=?, `senderEntry`=?, `receiver`=?, `amount`=?, `type`=?, `data`=?");
    logStmt.addUInt32(sender.GetCounter());
    logStmt.addUInt32(sender.GetHigh());
    logStmt.addUInt32(sender.GetEntry());
    logStmt.addUInt32(receiver.GetCounter());
    logStmt.addUInt32(amount);
    logStmt.addString(type);
    logStmt.addUInt32(dataInt);
    logStmt.Execute();
}

void World::LogChat(WorldSession* sess, char const* type, char const* msg, PlayerPointer target, uint32 chanId, char const* chanStr)
{
    ASSERT(sess);
    PlayerPointer plr = sess->GetPlayerPointer();
    ASSERT(plr);

    if (target)
        sLog.Player(sess, LOG_CHAT, LOG_LVL_MINIMAL, "[%s] %s:%u -> %s:%u : %s", type, plr->GetName(), plr->GetObjectGuid().GetCounter(), target->GetName(), target->GetObjectGuid().GetCounter(), msg);
    else if (chanId)
        sLog.Player(sess, LOG_CHAT, LOG_LVL_MINIMAL, "[%s:%u] %s:%u : %s", type, chanId, plr->GetName(), plr->GetObjectGuid().GetCounter(), msg);
    else if (chanStr)
        sLog.Player(sess, LOG_CHAT, LOG_LVL_MINIMAL, "[%s:%s] %s:%u : %s", type, chanStr, plr->GetName(), plr->GetObjectGuid().GetCounter(), msg);
    else
        sLog.Player(sess, LOG_CHAT, LOG_LVL_MINIMAL, "[%s] %s:%u : %s", type, plr->GetName(), plr->GetObjectGuid().GetCounter(), msg);
}

void World::LogTransaction(PlayerTransactionData const& data)
{
    if (!LogsDatabase || !getConfig(CONFIG_BOOL_LOGSDB_TRANSACTIONS))
        return;

    static SqlStatementID insLogTransaction;
    SqlStatement logStmt = LogsDatabase.CreateStatement(insLogTransaction,
        "INSERT INTO `logs_transactions` SET `type`=?, `guid1`=?, `money1`=?, `spell1`=?, `items1`=?, "
        "`guid2`=?, `money2`=?, `spell2`=?, `items2`=?");
    logStmt.addString(data.type);
    for (const auto& part : data.parts)
    {
        logStmt.addUInt32(part.lowGuid);
        logStmt.addUInt32(part.money);
        logStmt.addUInt32(part.spell);
        std::stringstream items;
        for (int i = 0; i < TransactionPart::MAX_TRANSACTION_ITEMS; ++i)
        {
            if (part.itemsEntries[i])
            {
                if (i != 0)
                    items << ";";
                items << uint32(part.itemsEntries[i]) << ":" << uint32(part.itemsCount[i]) << ":" << part.itemsGuid[i];
            }
        }
        logStmt.addString(items.str());
    }
    logStmt.Execute();
}

bool World::CanSkipQueue(WorldSession const* sess)
{
    if (sess->GetSecurity() > SEC_PLAYER)
        return true;
    uint32 grace_period = getConfig(CONFIG_UINT32_LOGIN_QUEUE_GRACE_PERIOD_SECS);
    if (!grace_period)
        return false;
    auto prev_logout = m_accountsPlayHistory.find(sess->GetAccountId());
    if (prev_logout == m_accountsPlayHistory.end())
        return false;
    time_t now = time(nullptr);
    return (now - prev_logout->second.logoutTime) < grace_period;
}

uint32 World::InsertLog(std::string const& message, AccountTypes sec)
{
    uint32 key = m_logMessages.size();
    ArchivedLogMessage& s = m_logMessages[key];
    s.msg = message;
    s.sec = sec;
    return key;
}

World::ArchivedLogMessage* World::GetLog(uint32 logId, AccountTypes my_sec)
{
    LogMessagesMap::iterator it = m_logMessages.find(logId);
    if (it == m_logMessages.end() || it->second.sec > my_sec)
        return nullptr;
    return &(it->second);
}

void World::SetWorldUpdateTimer(WorldTimers timer, uint32 current)
{
    if (timer >= WUPDATE_COUNT)
        return;

    m_timers[timer].SetCurrent(current);
}

time_t World::GetWorldUpdateTimer(WorldTimers timer)
{
    if (timer >= WUPDATE_COUNT)
        return 0;

    return m_timers[timer].GetCurrent();
}

time_t World::GetWorldUpdateTimerInterval(WorldTimers timer)
{
    if (timer >= WUPDATE_COUNT)
        return 0;

    return m_timers[timer].GetInterval();
}

void SessionPacketSendTask::operator()()
{
    if (WorldSession* session = sWorld.FindSession(m_accountId))
    {
        session->SendPacket(&m_data);
    }
}
