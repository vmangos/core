#include "Common.h"
#include "Policies/SingletonImp.h"
#include "PlayerBotMgr.h"
#include "ObjectMgr.h"
#include "World.h"
#include "WorldSession.h"
#include "AccountMgr.h"
#include "Config/Config.h"
#include "Chat.h"
#include "Player.h"
#include "Group.h"
#include "PlayerBotAI.h"
#include "PartyBotAI.h"
#include "BattleBotAI.h"
#include "BattleBotWaypoints.h"
#include "BattleGroundMgr.h"
#include "Language.h"
#include "Spell.h"
#include "MoveMapSharedDefines.h"

INSTANTIATE_SINGLETON_1(PlayerBotMgr);


PlayerBotMgr::PlayerBotMgr()
{
    m_totalChance = 0;
    m_maxAccountId = 0;

    // Config
    m_confMinRandomBots         = 3;
    m_confMaxRandomBots         = 10;
    m_confRandomBotsRefresh     = 60000;
    m_confUpdateDiff            = 10000;
    m_confEnableRandomBots      = false;
    m_confDebug                 = false;
    m_confBattleBotAutoJoin     = false;

    // Time
    m_elapsedTime = 0;
    m_lastBotsRefresh = 0;
    m_lastUpdate = 0;
    m_lastBattleBotQueueUpdate = 0;
}

PlayerBotMgr::~PlayerBotMgr()
{

}

void PlayerBotMgr::LoadConfig()
{
    m_confEnableRandomBots = sConfig.GetBoolDefault("RandomBot.Enable", false);
    m_confMinRandomBots = sConfig.GetIntDefault("RandomBot.MinBots", 3);
    m_confMaxRandomBots = sConfig.GetIntDefault("RandomBot.MaxBots", 10);
    m_confRandomBotsRefresh = sConfig.GetIntDefault("RandomBot.Refresh", 60000);
    m_confAllowSaving = sConfig.GetBoolDefault("PlayerBot.AllowSaving", false);
    m_confDebug = sConfig.GetBoolDefault("PlayerBot.Debug", false);
    m_confUpdateDiff = sConfig.GetIntDefault("PlayerBot.UpdateMs", 10000);
    m_confBattleBotAutoJoin = sConfig.GetBoolDefault("BattleBot.AutoJoin", false);

    if (!sWorld.getConfig(CONFIG_BOOL_FORCE_LOGOUT_DELAY))
        m_tempBots.clear();
}

void PlayerBotMgr::Load()
{
    // 1- Clean
    DeleteAll();
    m_bots.clear();
    m_tempBots.clear();
    m_totalChance = 0;

    // 2- Configuration
    LoadConfig();

    // 3- Load usable account ID
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery(
                              "SELECT MAX(`id`)"
                              " FROM `account`");
    if (!result)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Playerbot: unable to load max account id.");
        return;
    }
    Field* fields = result->Fetch();
    m_maxAccountId = fields[0].GetUInt32() + 10000;

    // 4- LoadFromDB
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> [PlayerBotMgr] Loading Bots ...");
    result = CharacterDatabase.PQuery(
                 "SELECT char_guid, chance, ai"
                 " FROM playerbot");
    if (!result)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Table `playerbot` is empty.");
    else
    {
        do
        {
            fields = result->Fetch();
            uint32 guid = fields[0].GetUInt32();
            uint32 acc = GenBotAccountId();
            uint32 chance = fields[1].GetUInt32();

            std::shared_ptr<PlayerBotEntry> entry = std::make_shared<PlayerBotEntry>(guid, acc, chance);
            entry->ai.reset(CreatePlayerBotAI(fields[2].GetCppString()));
            entry->ai->botEntry = entry.get();
            if (!sObjectMgr.GetPlayerNameByGUID(guid, entry->name))
                entry->name = "<Unknown>";
            entry->ai->OnBotEntryLoad(entry.get());
            m_bots.insert({ entry->playerGUID, entry });
            m_totalChance += chance;
        }
        while (result->NextRow());
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "%u bots loaded", m_bots.size());
    }

    // 5- Check config/DB
    if (m_confMinRandomBots >= m_bots.size() && !m_bots.empty())
        m_confMinRandomBots = m_bots.size() - 1;
    if (m_confMaxRandomBots > m_bots.size())
        m_confMaxRandomBots = m_bots.size();
    if (m_confMaxRandomBots <= m_confMinRandomBots)
        m_confMaxRandomBots = m_confMinRandomBots + 1;

    // 6- Start initial bots
    if (m_confEnableRandomBots)
    {
        for (uint32 i = 0; i < m_confMinRandomBots; i++)
            AddRandomBot();
    }

    // 7- Fill stats info
    m_stats.confMaxOnline = m_confMaxRandomBots;
    m_stats.confMinOnline = m_confMinRandomBots;
    m_stats.totalBots = m_bots.size();
    m_stats.confRandomBotsRefresh = m_confRandomBotsRefresh;
    m_stats.confUpdateDiff = m_confUpdateDiff;

    // 8- Show stats if debug
    if (m_confDebug)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[PlayerBotMgr] Between %u and %u bots online", m_confMinRandomBots, m_confMaxRandomBots);
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[PlayerBotMgr] %u now loading", m_stats.loadingCount);
    }
}

void PlayerBotMgr::DeleteAll()
{
    m_stats.onlineCount = 0;
    m_stats.loadingCount = 0;

    for (auto i = m_bots.begin(); i != m_bots.end(); i++)
    {
        if (i->second->state != PB_STATE_OFFLINE)
        {
            OnBotLogout(i->second.get());
            m_totalChance += i->second->chance;
        }
    }
    m_tempBots.clear();

    if (m_confDebug)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[PlayerBotMgr] Deleting all bots [OK]");
}

void PlayerBotMgr::OnBotLogin(PlayerBotEntry *e)
{
    e->state = PB_STATE_ONLINE;
    if (m_confDebug)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[PlayerBot][Login]  '%s' GUID:%u Acc:%u", e->name.c_str(), e->playerGUID, e->accountId);
}
void PlayerBotMgr::OnBotLogout(PlayerBotEntry *e)
{
    e->state = PB_STATE_OFFLINE;
    if (m_confDebug)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[PlayerBot][Logout] '%s' GUID:%u Acc:%u", e->name.c_str(), e->playerGUID, e->accountId);
}

void PlayerBotMgr::OnPlayerInWorld(Player* player)
{
    if (PlayerBotEntry* e = player->GetSession()->GetBot())
    {
        player->SetAI(e->ai.get());
        e->ai->SetPlayer(player);
        e->ai->OnPlayerLogin();
    }
}

void PlayerBotMgr::Update(uint32 diff)
{
    // Temporary bots.
    std::map<uint32, uint32>::iterator it;
    for (it = m_tempBots.begin(); it != m_tempBots.end(); ++it)
    {
        if (it->second < diff)
            it->second = 0;
        else
            it->second -= diff;
    }
    it = m_tempBots.begin();
    while (it != m_tempBots.end())
    {
        if (!it->second)
        {
            // Update of "chatBot" too.
            for (auto iter = m_bots.begin(); iter != m_bots.end(); ++iter)
                if (iter->second->accountId == it->first)
                {
                    iter->second->state = PB_STATE_OFFLINE; // Will get logged out at next WorldSession::Update call
                    m_bots.erase(iter);
                    break;
                }
            m_tempBots.erase(it);
            it = m_tempBots.begin();
        }
        else
            ++it;
    }

    m_elapsedTime += diff;
    if (!((m_elapsedTime - m_lastUpdate) > m_confUpdateDiff))
        return; // No need to update
    m_lastUpdate = m_elapsedTime;

    for (auto iter = m_bots.begin(); iter != m_bots.end();)
    {
        if (!m_confEnableRandomBots && !iter->second->customBot)
        {
            ++iter;
            continue;
        }

        if (iter->second->state == PB_STATE_ONLINE)
        {
            if (iter->second->requestRemoval)
            {
                bool keepLoggedIn = false;
                if (iter->second->ai)
                {
                    if (CombatBotBaseAI* partyBot = dynamic_cast<CombatBotBaseAI*>(iter->second->ai.get()))
                        keepLoggedIn = partyBot->m_leaderGuid == partyBot->me->GetObjectGuid();
                }

                if (iter->second->ai && iter->second->ai->me && !keepLoggedIn)
                    iter->second->ai->me->RemoveFromGroup();

                DeleteBot(iter);

                if (WorldSession* sess = sWorld.FindSession(iter->second->accountId))
                {
                    if (!keepLoggedIn)
                        sess->LogoutPlayer(m_confAllowSaving);
                    else
                        sess->SetBot(nullptr);
                }

                iter->second->requestRemoval = false;

                if (iter->second->customBot)
                    iter = m_bots.erase(iter);
                else
                    ++iter;
                continue;
            }
        }

        // Connection of pending bots
        if (iter->second->state != PB_STATE_LOADING)
        {
            ++iter;
            continue;
        }

        WorldSession* sess = sWorld.FindSession(iter->second->accountId);

        if (!sess)
        {
            // This may happen : just wait for the World to add the session.
            ++iter;
            continue;
        }

        Player* pPlayer = sess->GetPlayer();
        if (pPlayer || iter->second->ai->OnSessionLoaded(iter->second.get(), sess))
        {
            OnBotLogin(iter->second.get());
            m_stats.loadingCount--;

            if (pPlayer)
                OnPlayerInWorld(pPlayer);

            if (iter->second->isChatBot)
                m_stats.onlineChat++;
            else
                m_stats.onlineCount++;
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "PLAYERBOT: Unable to load session id %u", iter->second->accountId);
            DeleteBot(iter);

            if (iter->second->customBot)
                iter = m_bots.erase(iter);
            else
                ++iter;
            continue;
        }

        ++iter;
    }

    if (m_confBattleBotAutoJoin && (m_lastBattleBotQueueUpdate <= (sWorld.GetGameTime() - 10)))
    {
        m_lastBattleBotQueueUpdate = sWorld.GetGameTime();
        for (uint32 queueType = BATTLEGROUND_QUEUE_AV; queueType < MAX_BATTLEGROUND_QUEUE_TYPES; ++queueType)
        {
            bool hasPlayerInQueue[MAX_BATTLEGROUND_BRACKETS] = {};
            uint32 queuedAllianceCount[MAX_BATTLEGROUND_BRACKETS] = {};
            uint32 queuedHordeCount[MAX_BATTLEGROUND_BRACKETS] = {};
            BattleGroundQueue const& bgQueue = sBattleGroundMgr.m_battleGroundQueues[queueType];
            for (auto const& itr : bgQueue.m_queuedPlayers)
            {
                if (itr.second.groupInfo->isInvitedToBgInstanceGuid)
                    continue;

                if (Player* pPlayer = sObjectAccessor.FindPlayer(itr.first))
                {
                    BattleGroundTypeId bgTypeId = itr.second.groupInfo->bgTypeId;
                    BattleGroundBracketId bgBracketId = pPlayer->GetBattleGroundBracketIdFromLevel(bgTypeId);
                    if (bgBracketId == BG_BRACKET_ID_NONE)
                        continue;

                    if (itr.second.groupInfo->groupTeam == ALLIANCE)
                        ++queuedAllianceCount[bgBracketId];
                    else
                        ++queuedHordeCount[bgBracketId];

                    if (!pPlayer->IsBot())
                        hasPlayerInQueue[bgBracketId] = true;
                }
            }

            for (uint32 bracketId = BG_BRACKET_ID_FIRST; bracketId < MAX_BATTLEGROUND_BRACKETS; ++bracketId)
            {
                if (!hasPlayerInQueue[bracketId])
                    continue;

                if (!queuedAllianceCount[bracketId] && !queuedHordeCount[bracketId])
                    continue;

                BattleGroundTypeId bgTypeId = BattleGroundMgr::BgTemplateId(BattleGroundQueueTypeId(queueType));
                BattleGround* bg = sBattleGroundMgr.GetBattleGroundTemplate(bgTypeId);
                ASSERT(bg);

                uint32 const minLevel = bg->GetMinLevel() + 10 * bracketId;
                ASSERT(minLevel <= PLAYER_MAX_LEVEL);
                uint32 const maxLevel = std::min<uint32>(minLevel + 9, PLAYER_MAX_LEVEL);

                for (uint32 i = queuedAllianceCount[bracketId]; i < bg->GetMinPlayersPerTeam(); ++i)
                {
                    uint32 const botLevel = urand(minLevel, maxLevel);
                    AddBattleBot(BattleGroundQueueTypeId(queueType), ALLIANCE, botLevel, true);
                }
                for (uint32 i = queuedHordeCount[bracketId]; i < bg->GetMinPlayersPerTeam(); ++i)
                {
                    uint32 const botLevel = urand(minLevel, maxLevel);
                    AddBattleBot(BattleGroundQueueTypeId(queueType), HORDE, botLevel, true);
                }
            }
        }
    }

    if (m_confEnableRandomBots)
    {
        uint32 updatesCount = (m_elapsedTime - m_lastBotsRefresh) / m_confRandomBotsRefresh;
        for (uint32 i = 0; i < updatesCount; ++i)
        {
            AddOrRemoveBot();
            m_lastBotsRefresh += m_confRandomBotsRefresh;
        }
    }
}

/*
Toutes les X minutes, ajoute ou enleve un bot.
*/
bool PlayerBotMgr::AddOrRemoveBot()
{
    uint32 alea = urand(m_confMinRandomBots, m_confMaxRandomBots);
    /*
    10 --- --- --- --- --- --- --- --- --- --- 20 bots
                NumActuel
    [alea ici : remove    ][    ici, add    ]
    */
    if (alea > m_stats.onlineCount)
        return AddRandomBot();
    else
        return DeleteRandomBot();

}

bool PlayerBotMgr::AddBot(PlayerBotAI* ai)
{
    // Find a correct accountid ?
    std::shared_ptr<PlayerBotEntry> e = std::make_shared<PlayerBotEntry>();
    e->ai.reset(ai);
    e->accountId = GenBotAccountId();
    e->playerGUID = sObjectMgr.GeneratePlayerLowGuid();
    e->customBot = true;
    ai->botEntry = e.get();
    m_bots.insert({ e->playerGUID, e });
    return AddBot(e->playerGUID, false);
}

bool PlayerBotMgr::AddBot(uint32 playerGUID, bool chatBot, PlayerBotAI* pAI)
{
    uint32 accountId = 0;
    auto iter = m_bots.find(playerGUID);
    if (iter == m_bots.end())
        accountId = sObjectMgr.GetPlayerAccountIdByGUID(playerGUID);
    else
        accountId = iter->second->accountId;

    if (!accountId)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Player account %u not found...", playerGUID);
        return false;
    }

    WorldSession* session = sWorld.FindSession(accountId);
    if (session)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[PlayerBotMgr] Account %u is already online! Assuming direct control", accountId);
        //sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[PlayerBotMgr] Account %u is already online!", accountId);
        //return false;
    }

    std::shared_ptr<PlayerBotEntry> e;
    if (iter != m_bots.end())
    {
        e = iter->second;

        if (pAI) // new AI
        {
            e->ai.reset(pAI);
            e->customBot = true;
        }
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[PlayerBotMgr] Adding temporary PlayerBot with GUID %u.", playerGUID);
        e = std::make_shared<PlayerBotEntry>();
        e->state        = PB_STATE_LOADING;
        e->playerGUID   = playerGUID;
        e->chance       = 10;
        e->accountId    = accountId;
        e->isChatBot    = chatBot;
        if (pAI)
        {
            e->ai.reset(pAI);
            e->customBot = true;
        }
        else
        {
            e->ai.reset(new PlayerBotAI(nullptr));
            e->customBot = false;
        }
        m_bots.insert({ playerGUID , e });
    }

    e->ai->botEntry = e.get();
    e->state = PB_STATE_LOADING;
    if (!session)
    {
        session = new WorldSession(accountId, nullptr, sAccountMgr.GetSecurity(accountId), 0, LOCALE_enUS);
        sWorld.AddSession(session);
    }
    session->SetBot(e);
    m_stats.loadingCount++;
    if (chatBot)
        AddTempBot(accountId, 20000);

    return true;
}

bool PlayerBotMgr::AddRandomBot()
{
    uint32 alea = urand(0, m_totalChance);
    bool done = false;
    for (auto it = m_bots.begin(); it != m_bots.end() && !done; it++)
    {
        if (it->second->state != PB_STATE_OFFLINE)
            continue;
        if (it->second->customBot)
            continue;
        uint32 chance = it->second->chance;

        if (chance >= alea)
        {
            AddBot(it->first);
            done = true;
        }
        alea -= chance;
    }
    return done;
}

void PlayerBotMgr::AddTempBot(uint32 account, uint32 time)
{
    m_tempBots[account] = time;
}

void PlayerBotMgr::RefreshTempBot(uint32 account)
{
    if (m_tempBots.find(account) != m_tempBots.end())
    {
        uint32& delay = m_tempBots[account];
        if (delay < 1000)
            delay = 1000;
    }
}

bool PlayerBotMgr::DeleteBot(uint32 playerGUID)
{
    auto iter = m_bots.find(playerGUID);
    if (iter == m_bots.end())
        return false;

    return DeleteBot(iter);
}

bool PlayerBotMgr::DeleteBot(std::map<uint64, std::shared_ptr<PlayerBotEntry>>::iterator iter)
{
    if (iter->second->state == PB_STATE_LOADING)
        m_stats.loadingCount--;
    else if (iter->second->state == PB_STATE_ONLINE)
        m_stats.onlineCount--;

    OnBotLogout(iter->second.get());
    return true;
}

bool PlayerBotMgr::DeleteRandomBot()
{
    if (m_stats.onlineCount < 1)
        return false;
    uint32 idDelete = urand(0, m_stats.onlineCount);
    uint32 onlinePassed = 0;
    std::map<uint32, PlayerBotEntry*>::iterator iter;
    for (auto iter = m_bots.begin(); iter != m_bots.end(); iter++)
    {
        if (!iter->second->customBot && !iter->second->isChatBot && iter->second->state == PB_STATE_ONLINE)
        {
            onlinePassed++;
            if (onlinePassed == idDelete)
            {
                OnBotLogout(iter->second.get());
                m_stats.onlineCount--;
                return true;
            }
        }
    }
    return false;
}

uint8 SelectRandomRaceForClass(uint8 playerClass, Team playerTeam)
{
    std::vector<uint32> validRaces;
    for (uint32 raceId = 1; raceId < MAX_RACES; ++raceId)
    {
        if (playerTeam == ALLIANCE)
        {
            if (!((1 << (raceId - 1)) & RACEMASK_ALLIANCE))
                continue;
        }
        else if (playerTeam == HORDE)
        {
            if (!((1 << (raceId - 1)) & RACEMASK_HORDE))
                continue;
        }

        if (sObjectMgr.GetPlayerInfo(raceId, playerClass))
            validRaces.push_back(raceId);
    }

    if (validRaces.empty())
        return 0;

    return SelectRandomContainerElement(validRaces);
}

void PlayerBotMgr::AddBattleBot(BattleGroundQueueTypeId queueType, Team botTeam, uint32 botLevel, bool temporary)
{
    std::vector<uint32> availableClasses = { CLASS_WARRIOR, CLASS_HUNTER, CLASS_ROGUE, CLASS_MAGE, CLASS_WARLOCK, CLASS_PRIEST, CLASS_DRUID };
    if (botTeam == HORDE)
        availableClasses.push_back(CLASS_SHAMAN);
    else
        availableClasses.push_back(CLASS_PALADIN);

    uint8 botClass = SelectRandomContainerElement(availableClasses);
    uint8 botRace = SelectRandomRaceForClass(botClass, botTeam);
    if (!botRace)
        return;

    // Spawn bot on GM Island
    uint32 const instanceId = sMapMgr.GetContinentInstanceId(1, 16224.356f, 16284.763f);
    BattleBotAI* ai = new BattleBotAI(botRace, botClass, botLevel, 1, instanceId, 16224.356f, 16284.763f, 13.175f, 4.56f, queueType, temporary);
    AddBot(ai);

    if (botTeam == ALLIANCE)
    {
        if (temporary)
        {
            sWorld.SendWorldTextToBGAndQueue(LANG_ALLIANCE_BATTLEBOT_TEMP_ADDED, botLevel, queueType, botLevel, queueType);
            sLog.Out(LOG_BG, LOG_LVL_BASIC, "[PlayerBotMgr] Adding temporary level %u alliance battlebot to bg queue %u.", botLevel, queueType);
        }
        else
        {
            sWorld.SendWorldTextToBGAndQueue(LANG_ALLIANCE_BATTLEBOT_ADDED, botLevel, queueType, botLevel, queueType);
            sLog.Out(LOG_BG, LOG_LVL_BASIC, "[PlayerBotMgr] Adding level %u alliance battlebot to bg queue %u.", botLevel, queueType);
        }
    }
    else
    {
        if (temporary)
        {
            sWorld.SendWorldTextToBGAndQueue(LANG_HORDE_BATTLEBOT_TEMP_ADDED, botLevel, queueType, botLevel, queueType);
            sLog.Out(LOG_BG, LOG_LVL_BASIC, "[PlayerBotMgr] Adding temporary level %u horde battlebot to bg queue %u.", botLevel, queueType);
        }
        else
        {
            sWorld.SendWorldTextToBGAndQueue(LANG_HORDE_BATTLEBOT_ADDED, botLevel, queueType, botLevel, queueType);
            sLog.Out(LOG_BG, LOG_LVL_BASIC, "[PlayerBotMgr] Adding level %u horde battlebot to bg queue %u.", botLevel, queueType);
        }
    }
}

void PlayerBotMgr::DeleteBattleBots()
{
    for (auto const& itr : m_bots)
    {
        if (dynamic_cast<BattleBotAI*>(itr.second->ai.get()))
            itr.second->requestRemoval = true;
    }
    m_confBattleBotAutoJoin = false;
}

bool PlayerBotMgr::ForceAccountConnection(WorldSession* sess)
{
    if (sess->GetBot())
        return sess->GetBot()->state != PB_STATE_OFFLINE;

    // Temporary bots.
    return m_tempBots.find(sess->GetAccountId()) != m_tempBots.end();
}

bool PlayerBotMgr::IsPermanentBot(uint32 playerGUID)
{
    auto iter = m_bots.find(playerGUID);
    return iter != m_bots.end();
}

bool PlayerBotMgr::IsChatBot(uint32 playerGuid)
{
    auto iter = m_bots.find(playerGuid);
    return iter != m_bots.end() && iter->second->isChatBot;
}

void PlayerBotMgr::AddAllBots()
{
    for (auto it = m_bots.begin(); it != m_bots.end(); it++)
    {
        if (!it->second->isChatBot && it->second->state == PB_STATE_OFFLINE)
            AddBot(it->first);
    }
}

bool ChatHandler::HandleBotReloadCommand(char * args)
{
    sPlayerBotMgr.Load();
    SendSysMessage("PlayerBot system reloaded");
    return true;
}

bool ChatHandler::HandleBotAddRandomCommand(char * args)
{
    uint32 count = 1;
    char* sCount = strtok((char*)args, " ");
    if (sCount)
        count = uint32(atoi(sCount));
    for (uint32 i = 0; i < count; ++i)
        sPlayerBotMgr.AddRandomBot();
    PSendSysMessage("%u bots added", count);
    return true;
}

bool ChatHandler::HandleBotStopCommand(char * args)
{
    sPlayerBotMgr.DeleteAll();
    SendSysMessage("All the bots have been unloaded.");
    return true;
}

bool ChatHandler::HandleBotAddAllCommand(char * args)
{
    sPlayerBotMgr.AddAllBots();
    SendSysMessage("All bots have been loaded.");
    return true;
}

bool ChatHandler::HandleBotAddCommand(char* args)
{
    uint32 guid = 0;
    char *charname = nullptr;
    if (*args)
    {
        charname = strtok((char*)args, " ");
        if (charname && strcmp(charname, "") == 0)
            return false;

        guid = sObjectMgr.GetPlayerGuidByName(charname).GetCounter();
        if (!guid)
        {
            PSendSysMessage("Player not found : '%s'", charname);
            SetSentErrorMessage(true);
            return false;
        }
    }
    if (!guid || !sPlayerBotMgr.AddBot(guid))
    {
        SendSysMessage("[PlayerBotMgr] Unable to load bot.");
        return true;
    }
    PSendSysMessage("[PlayerBotMgr] Bot added : '%s', GUID=%u", charname ? charname : "NULL", guid);
    return true;
}

bool ChatHandler::HandleBotDeleteCommand(char * args)
{
    char *charname = strtok((char*)args, " ");

    if (!charname || strcmp(charname, "") == 0)
    {
        SendSysMessage("Syntax : $playerName");
        SetSentErrorMessage(true);
        return false;
    }
    uint32 lowGuid = sObjectMgr.GetPlayerGuidByName(charname).GetCounter();
    if (!lowGuid)
    {
        PSendSysMessage("Unable to find player: '%s'", charname);
        SetSentErrorMessage(true);
        return false;
    }
    if (sPlayerBotMgr.DeleteBot(lowGuid))
    {
        PSendSysMessage("Bot %s (GUID:%u) disconnected.", charname, lowGuid);
        return true;
    }
    else
    {
        PSendSysMessage("Bot %s (GUID:%u) : unable to disconnect.", charname, lowGuid);
        SetSentErrorMessage(true);
        return false;
    }
}

bool ChatHandler::HandleBotInfoCommand(char * args)
{
    uint32 online = sWorld.GetActiveSessionCount();

    PlayerBotStats stats = sPlayerBotMgr.GetStats();
    SendSysMessage("-- PlayerBot stats --");
    PSendSysMessage("Min:%u Max:%u Total:%u", stats.confMinOnline, stats.confMaxOnline, stats.totalBots);
    PSendSysMessage("Loading : %u, Online : %u, Chat : %u", stats.loadingCount, stats.onlineCount, stats.onlineChat);
    PSendSysMessage("%up + %ub = %u",
                    (online - stats.onlineCount), stats.onlineCount, online);
    return true;
}

bool ChatHandler::HandleBotStartCommand(char * args)
{
    sPlayerBotMgr.Start();
    return true;
}

bool ChatHandler::PartyBotAddRequirementCheck(Player const* pPlayer, Player const* pTarget)
{
    if (pPlayer->IsTaxiFlying())
    {
        SendSysMessage("Cannot add bots while flying.");
        return false;
    }

    // Spawning bots inside BG will cause server crash on BG end.
    if (pPlayer->InBattleGround())
    {
        SendSysMessage("Cannot add bots inside battlegrounds.");
        return false;
    }

    if (pPlayer->GetGroup() && (pPlayer->GetGroup()->IsFull() || sWorld.getConfig(CONFIG_UINT32_PARTY_BOT_MAX_BOTS) &&
        (pPlayer->GetGroup()->GetMembersCount() - 1 >= sWorld.getConfig(CONFIG_UINT32_PARTY_BOT_MAX_BOTS))))
    {
        SendSysMessage("Cannot add more bots. Group is full.");
        return false;
    }

    if (Map const* pMap = pPlayer->GetMap())
    {
        if (pMap->IsDungeon() &&
            pMap->GetPlayers().getSize() >= pMap->GetMapEntry()->maxPlayers)
        {
            SendSysMessage("Cannot add more bots. Instance is full.");
            return false;
        }
    }

    if (pTarget && pTarget->GetTeam() != pPlayer->GetTeam())
    {
        SendSysMessage("Cannot clone enemy faction characters.");
        return false;
    }

    // Restrictions when the command is made public to avoid abuse.
    if (GetSession()->GetSecurity() <= SEC_PLAYER && !sWorld.getConfig(CONFIG_BOOL_PARTY_BOT_SKIP_CHECKS))
    {
        if (pPlayer->IsDead())
        {
            SendSysMessage("Cannot add bots while dead.");
            return false;
        }

        if (pPlayer->IsInCombat())
        {
            SendSysMessage("Cannot add bots while in combat.");
            return false;
        }

        if (pPlayer->GetMap()->IsDungeon())
        {
            SendSysMessage("Cannot add bots while inside instances.");
            return false;
        }

        // Clone command.
        if (pTarget)
        {
            if (pTarget->IsDead())
            {
                SendSysMessage("Cannot clone dead characters.");
                return false;
            }

            if (pTarget->IsInCombat())
            {
                SendSysMessage("Cannot clone characters that are in combat.");
                return false;
            }

            if (pTarget->GetLevel() > pPlayer->GetLevel() + 10)
            {
                SendSysMessage("Cannot clone higher level characters.");
                return false;
            }
        }
    }

    return true;
}

bool ChatHandler::HandlePartyBotAddCommand(char* args)
{
    Player* pPlayer = m_session->GetPlayer();
    if (!pPlayer)
        return false;

    if (!PartyBotAddRequirementCheck(pPlayer, nullptr))
    {
        SetSentErrorMessage(true);
        return false;
    }

    if (!args)
    {
        SendSysMessage("Incorrect syntax. Expected role or class.");
        SetSentErrorMessage(true);
        return false;
    }

    uint8 botClass = 0;
    uint32 botLevel = pPlayer->GetLevel();
    CombatBotRoles botRole = ROLE_INVALID;

    if (char* arg1 = ExtractArg(&args))
    {
        std::string option = arg1;
        if (option == "warrior")
            botClass = CLASS_WARRIOR;
        else if (option == "paladin" && pPlayer->GetTeam() == ALLIANCE)
            botClass = CLASS_PALADIN;
        else if (option == "hunter")
            botClass = CLASS_HUNTER;
        else if (option == "rogue")
            botClass = CLASS_ROGUE;
        else if (option == "priest")
            botClass = CLASS_PRIEST;
        else if (option == "shaman" && pPlayer->GetTeam() == HORDE)
            botClass = CLASS_SHAMAN;
        else if (option == "mage")
            botClass = CLASS_MAGE;
        else if (option == "warlock")
            botClass = CLASS_WARLOCK;
        else if (option == "druid")
            botClass = CLASS_DRUID;
        else if (option == "dps")
        {
            botClass = PickRandomValue(CLASS_WARRIOR, CLASS_HUNTER, CLASS_ROGUE, CLASS_MAGE, CLASS_WARLOCK);
            botRole = CombatBotBaseAI::IsMeleeDamageClass(botClass) ? ROLE_MELEE_DPS : ROLE_RANGE_DPS;
        }
        else if (option == "healer")
        {
            std::vector<uint32> dpsClasses = { CLASS_PRIEST, CLASS_DRUID };
            if (pPlayer->GetTeam() == HORDE)
                dpsClasses.push_back(CLASS_SHAMAN);
            else
                dpsClasses.push_back(CLASS_PALADIN);
            botClass = SelectRandomContainerElement(dpsClasses);
            botRole = ROLE_HEALER;
        }
        else if (option == "tank")
        {
            botClass = CLASS_WARRIOR;
            botRole = ROLE_TANK;
        }

        // Prevent setting a custom level for bots unless the account is a GM or skipping checks is enabled.
        if (GetSession()->GetSecurity() > SEC_PLAYER || sWorld.getConfig(CONFIG_BOOL_PARTY_BOT_SKIP_CHECKS))
            ExtractUInt32(&args, botLevel);
    }

    if (!botClass)
    {
        SendSysMessage("Incorrect syntax. Expected role or class.");
        SetSentErrorMessage(true);
        return false;
    }

    uint8 botRace = SelectRandomRaceForClass(botClass, pPlayer->GetTeam());
    if (!botRace)
    {
        SendSysMessage("Unable to select race for bot.");
        SetSentErrorMessage(true);
        return false;
    }

    float x, y, z;
    pPlayer->GetNearPoint(pPlayer, x, y, z, 0, 5.0f, frand(0.0f, 6.0f));

    PartyBotAI* ai = new PartyBotAI(pPlayer, nullptr, botRole, botRace, botClass, botLevel, pPlayer->GetMapId(), pPlayer->GetMap()->GetInstanceId(), x, y, z, pPlayer->GetOrientation());

    if (sPlayerBotMgr.AddBot(ai))
        SendSysMessage("New party bot added.");
    else
    {
        SendSysMessage("Error spawning bot.");
        SetSentErrorMessage(true);
        return false;
    }

    return true;
}

bool ChatHandler::HandlePartyBotCloneCommand(char* args)
{
    Player* pPlayer = m_session->GetPlayer();
    if (!pPlayer)
        return false;

    Player* pTarget = GetSelectedPlayer();
    if (!pTarget)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    if (!PartyBotAddRequirementCheck(pPlayer, pTarget))
    {
        SetSentErrorMessage(true);
        return false;
    }

    uint8 botRace = pTarget->GetRace();
    uint8 botClass = pTarget->GetClass();

    float x, y, z;
    pPlayer->GetNearPoint(pPlayer, x, y, z, 0, 5.0f, frand(0.0f, 6.0f));

    PartyBotAI* ai = new PartyBotAI(pPlayer, pTarget, ROLE_INVALID, botRace, botClass, pPlayer->GetLevel(), pPlayer->GetMapId(), pPlayer->GetMap()->GetInstanceId(), x, y, z, pPlayer->GetOrientation());
    if (sPlayerBotMgr.AddBot(ai))
        SendSysMessage("New party bot added.");
    else
    {
        SendSysMessage("Error spawning bot.");
        SetSentErrorMessage(true);
        return false;
    }

    return true;
}

bool ChatHandler::HandlePartyBotLoadHelper(Player* pPlayer, std::string name, bool warnAlreadyBot)
{
    ObjectGuid guid = sObjectMgr.GetPlayerGuidByName(name).GetCounter();
    if (!guid)
    {
        SendSysMessage(LANG_PLAYER_NOT_FOUND);
        SetSentErrorMessage(true);
        return false;
    }

    if (Player* pPlayer = sObjectAccessor.FindPlayerNotInWorld(guid))
    {
        if (pPlayer->GetSession()->GetBot())
        {
            if (warnAlreadyBot)
            {
                SendSysMessage("Player is already a bot!");
                SetSentErrorMessage(true);
            }
            return false;
        }
        //SendSysMessage("Player is already online!");
        //SetSentErrorMessage(true);
        //return false;
    }

    float x, y, z;
    pPlayer->GetNearPoint(pPlayer, x, y, z, 0, 5.0f, frand(0.0f, 6.0f));

    PartyBotAI* pAI = new PartyBotAI(pPlayer, pPlayer->GetMapId(), pPlayer->GetMap()->GetInstanceId(), x, y, z, pPlayer->GetOrientation());

    if (!sPlayerBotMgr.AddBot(guid, false, pAI))
    {
        delete pAI;
        SendSysMessage("Error spawning bot.");
        SetSentErrorMessage(true);
        return false;
    }

    return true;
}

bool ChatHandler::HandlePartyBotLoadCommand(char* args)
{
    Player* pPlayer = m_session->GetPlayer();
    if (!pPlayer)
        return false;

    std::string name = ExtractPlayerNameFromLink(&args);
    if (name.empty())
    {
        name = pPlayer->GetName();
        SendSysMessage("Using current player as bot name to load");
        //SendSysMessage(LANG_PLAYER_NOT_FOUND);
        //SetSentErrorMessage(true);
        //return false;
    }

    if (HandlePartyBotLoadHelper(pPlayer, name))
    {
        PSendSysMessage("Loading %s as party bot.", name.c_str());
        return true;
    }

    return false;
}

bool ChatHandler::HandlePartyBotLoadPartyCommand(char* args)
{
    Player* pPlayer = m_session->GetPlayer();
    if (!pPlayer)
        return false;

    int32 count = 40;
    ExtractInt32(&args, count);
    if (count == 0)
    {
        SendSysMessage("Provide batch size greater than 0.");
        SetSentErrorMessage(true);
        return false;
    }

    if (Group* pGroup = pPlayer->GetGroup())
    {
        for (Group::member_citerator itr = pGroup->GetMemberSlots().begin(); itr != pGroup->GetMemberSlots().end(); ++itr)
        {
            if (itr->guid != pGroup->GetLeaderGuid())
            {
                if (HandlePartyBotLoadHelper(pPlayer, itr->name, false))
                {
                    count = count - 1;
                    if (count == 0)
                        break;
                }
            }
        }

        SendSysMessage("Loading party as party bots.");
        return true;
    }

    SendSysMessage("You are not in a group.");
    SetSentErrorMessage(true);
    return false;
}

bool ChatHandler::HandlePartyBotSetRoleCommand(char* args)
{
    if (!args)
        return false;

    Player* pTarget = GetSelectedPlayer();
    if (!pTarget)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    CombatBotRoles role = ROLE_INVALID;
    std::string roleStr = args;

    if (roleStr == "tank")
        role = ROLE_TANK;
    else if (roleStr == "dps")
        role = CombatBotBaseAI::IsMeleeDamageClass(pTarget->GetClass()) ? ROLE_MELEE_DPS : ROLE_RANGE_DPS;
    else if (roleStr == "meleedps")
        role = ROLE_MELEE_DPS;
    else if (roleStr == "rangedps")
        role = ROLE_RANGE_DPS;
    else if (roleStr == "healer")
        role = ROLE_HEALER;

    if (role == ROLE_INVALID)
        return false;

    if (pTarget->AI())
    {
        if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
        {
            pAI->m_role = role;
            pAI->ResetSpellData();
            pAI->PopulateSpellData();
            PSendSysMessage("%s is now a %s.", pTarget->GetName(), roleStr.c_str());
            return true;
        }
    }

    SendSysMessage("Target is not a party bot.");
    SetSentErrorMessage(true);
    return false;
}

bool ChatHandler::HandlePartyBotAttackStartCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    Unit* pTarget = GetSelectedUnit();
    if (!pTarget || (pTarget == pPlayer))
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        SendSysMessage("You are not in a group.");
        SetSentErrorMessage(true);
        return false;
    }

    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            if (pMember->IsValidAttackTarget(pTarget))
            {
                pAI->AttackStart(pTarget);
            }
        }
    }

    PSendSysMessage("%d party bots are now attacking %s.", matchingBots.size(), pTarget->GetName());
    return true;
}

void StopPartyBotAttackHelper(PartyBotAI* pAI, Player* pBot)
{
    pBot->AttackStop(true);
    pBot->InterruptNonMeleeSpells(false);
    if (!pBot->IsStopped())
        pBot->StopMoving();
    if (pBot->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
        pBot->GetMotionMaster()->Clear();
    if (pAI->m_updateTimer.GetExpiry() < 3000)
        pAI->m_updateTimer.Reset(3000);
}

bool ChatHandler::HandlePartyBotAttackStopCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    Unit* pTarget = GetSelectedUnit();

    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            if (pTarget == nullptr || !pMember->IsValidAttackTarget(pTarget) || pMember->GetVictim() == pTarget)
            {
                StopPartyBotAttackHelper(pAI, pMember);
            }
        }
    }

    // TODO: valid attack targets can be different per member (e.g. MC on pPlayer).  Size represents those considered, not stopped.
    if (pTarget && pPlayer->IsValidAttackTarget(pTarget))
        PSendSysMessage("%d party bots have stopped attacking %s.", matchingBots.size() , pTarget->GetName());
    else
        PSendSysMessage("%d party bots have stopped attacking.", matchingBots.size());
    return true;
}

bool ChatHandler::HandlePartyBotAoECommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    Unit* pTarget = GetSelectedUnit();
    if (!pTarget || !pPlayer->IsValidAttackTarget(pTarget, true))
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        SendSysMessage("You are not in a group.");
        SetSentErrorMessage(true);
        return false;
    }

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == pPlayer)
                continue;

            if (pMember->AI())
            {
                if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pMember->AI()))
                {

                    for (auto const& pSpell : pAI->m_spells.raw.spells)
                    {
                        if (pSpell && pSpell->IsAreaOfEffectSpell() &&
                           !pSpell->IsPositiveSpell() &&
                           !pSpell->HasAura(AuraType::SPELL_AURA_MOD_FEAR) &&
                            pSpell->IsTargetInRange(pMember, pTarget))
                        {
                            if (pMember->GetCurrentSpell(CURRENT_GENERIC_SPELL) &&
                               !pMember->GetCurrentSpell(CURRENT_GENERIC_SPELL)->m_spellInfo->IsAreaOfEffectSpell())
                                pMember->InterruptSpell(CURRENT_GENERIC_SPELL);

                            if (pMember->CastSpell(pTarget, pSpell, false) == SPELL_CAST_OK)
                                break;
                        }
                    }
                }
            }
        }
    }

    PSendSysMessage("All party bots are casting AoE spells at %s.", pTarget->GetName());
    return true;
}

static std::map<std::string, RaidTargetIcon> raidTargetIcons =
{
    { "star",     RAID_TARGET_ICON_STAR     },
    { "circle",   RAID_TARGET_ICON_CIRCLE   },
    { "diamond",  RAID_TARGET_ICON_DIAMOND  },
    { "triangle", RAID_TARGET_ICON_TRIANGLE },
    { "moon",     RAID_TARGET_ICON_MOON     },
    { "square",   RAID_TARGET_ICON_SQUARE   },
    { "cross",    RAID_TARGET_ICON_CROSS    },
    { "skull",    RAID_TARGET_ICON_SKULL    },
};

bool ChatHandler::HandlePartyBotControlMarkCommand(char* args)
{
    std::string mark = args;
    auto itrMark = raidTargetIcons.find(mark);
    if (itrMark == raidTargetIcons.end())
    {
        SendSysMessage("Unknown target mark. Valid names are: star, circle, diamond, triangle, moon, square, cross, skull");
        SetSentErrorMessage(true);
        return false;
    }

    Player* pPlayer = GetSession()->GetPlayer();
    Player* pTarget = GetSelectedPlayer();

    if (pTarget && (pTarget != pPlayer))
    {
        if (pTarget->AI())
        {
            if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
            {
                PSendSysMessage("%s will crowd control %s.", pTarget->GetName(), args);
                pAI->m_marksToCC.push_back(itrMark->second);
                return true;
            }
        }
        SendSysMessage("Target is not a party bot.");
        SetSentErrorMessage(true);
        return false;
    }

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        SendSysMessage("You are not in a group.");
        SetSentErrorMessage(true);
        return false;
    }

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == pPlayer)
                continue;

            if (pMember->AI())
            {
                if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pMember->AI()))
                {
                    pAI->m_marksToCC.push_back(itrMark->second);
                }
            }
        }
    }

    PSendSysMessage("All party bots will crowd control %s.", args);
    return true;
}

bool ChatHandler::HandlePartyBotFocusMarkCommand(char* args)
{
    std::string mark = args;
    auto itrMark = raidTargetIcons.find(mark);
    if (itrMark == raidTargetIcons.end())
    {
        SendSysMessage("Unknown target mark. Valid names are: star, circle, diamond, triangle, moon, square, cross, skull");
        SetSentErrorMessage(true);
        return false;
    }

    Player* pPlayer = GetSession()->GetPlayer();
    Player* pTarget = GetSelectedPlayer();

    if (pTarget && (pTarget != pPlayer))
    {
        if (pTarget->AI())
        {
            if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
            {
                if (std::find(pAI->m_marksToFocus.begin(), pAI->m_marksToFocus.end(), itrMark->second) != pAI->m_marksToFocus.end())
                {
                    PSendSysMessage("%s already have focus %s.", pTarget->GetName(), args);
                    return false;
                }

                PSendSysMessage("%s will focus %s.", pTarget->GetName(), args);
                pAI->m_marksToFocus.push_back(itrMark->second);
                return true;
            }
        }
        SendSysMessage("Target is not a party bot.");
        SetSentErrorMessage(true);
        return false;
    }

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        SendSysMessage("You are not in a group.");
        SetSentErrorMessage(true);
        return false;
    }

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == pPlayer)
                continue;

            if (pMember->AI())
            {
                if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pMember->AI()))
                {
                    if (std::find(pAI->m_marksToFocus.begin(), pAI->m_marksToFocus.end(), itrMark->second) != pAI->m_marksToFocus.end())
                    {
                        // Already have focus mark
                        continue;
                    }
                    pAI->m_marksToFocus.push_back(itrMark->second);
                }
            }
        }
    }

    PSendSysMessage("All party bots will focus %s.", args);
    return true;
}

bool ChatHandler::HandlePartyBotClearMarksCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    Player* pTarget = GetSelectedPlayer();

    if (pTarget && (pTarget != pPlayer))
    {
        if (pTarget->AI())
        {
            if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
            {
                PSendSysMessage("All mark assignments cleared for %s.", pTarget->GetName());
                pAI->m_marksToCC.clear();
                pAI->m_marksToFocus.clear();
                return true;
            }
        }
        SendSysMessage("Target is not a party bot.");
        SetSentErrorMessage(true);
        return false;
    }

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        SendSysMessage("You are not in a group.");
        SetSentErrorMessage(true);
        return false;
    }

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == pPlayer)
                continue;

            if (pMember->AI())
            {
                if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pMember->AI()))
                {
                    pAI->m_marksToCC.clear();
                    pAI->m_marksToFocus.clear();
                }
            }
        }
    }

    SendSysMessage("Mark assignments cleared for all bots.");
    return true;
}

bool HandlePartyBotComeToMeHelper(Player* pBot, Player* pPlayer, bool pathing)
{
    if (pBot->AI() && pBot->IsAlive() && pBot->IsInMap(pPlayer) && !pBot->HasUnitState(UNIT_STATE_NO_FREE_MOVE))
    {
        if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pBot->AI()))
        {
            if (pBot->GetVictim())
                StopPartyBotAttackHelper(pAI, pBot);

            if (pBot->GetStandState() != UNIT_STAND_STATE_STAND)
                pBot->SetStandState(UNIT_STAND_STATE_STAND);

            pBot->InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_MOVEMENT);
            if (pathing)
                pBot->MonsterMoveWithSpeed(pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), -10.0f, pBot->GetSpeed(MOVE_RUN), MOVE_PATHFINDING | MOVE_RUN_MODE);
            else
                pBot->MonsterMove(pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ());
            return true;
        }
    }

    return false;
}

bool ChatHandler::HandlePartyBotComeToMeCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            HandlePartyBotComeToMeHelper(pMember, pPlayer, false);
        }
    }
    PSendSysMessage("%d party bots are coming to your position.", matchingBots.size());
    return true;
}

bool ChatHandler::HandlePartyBotPathToMeCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            HandlePartyBotComeToMeHelper(pMember, pPlayer, true);
        }
    }
    PSendSysMessage("%d party bots are pathing to your position.", matchingBots.size());
    return true;
}

bool HandlePartyBotUseGObjectHelper(Player* pTarget, GameObject* pGo)
{
    if (pTarget->AI())
    {
        if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
        {
            if (pTarget->IsWithinDist(pGo, INTERACTION_DISTANCE))
            {
                pGo->Use(pTarget);
                return true;
            }
        }
    }

    return false;
}

bool ChatHandler::HandlePartyBotUseGObjectCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    Player* pTarget = GetSelectedPlayer();

    GameObject* pGo = getSelectedGameObject();
    if (!pGo)
    {
        SendSysMessage(LANG_COMMAND_NOGAMEOBJECTFOUND);
        return false;
    }

    bool ok = false;

    if (pTarget && pTarget != pPlayer)
    {
        if (ok = HandlePartyBotUseGObjectHelper(pTarget, pGo))
            PSendSysMessage("%s has used the object.", pTarget->GetName());
        else
            PSendSysMessage("%s is not in range or is not a party bot.", pTarget->GetName());
        return ok;
    }
    else if (Group* pGroup = pPlayer->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Player* pMember = itr->getSource())
                ok = HandlePartyBotUseGObjectHelper(pMember, pGo) || ok;
        }

        if (ok)
            SendSysMessage("All party bots in range have used the object.");
        else
            SendSysMessage("There are no party bots in range of the object.");
        return ok;
    }

    SendSysMessage("You are not in a group.");
    SetSentErrorMessage(true);
    return false;
}

static uint8 ClassFromString(const std::string& optionStr)
{
    if (optionStr == "warrior")
        return CLASS_WARRIOR;
    if (optionStr == "paladin")
        return CLASS_PALADIN;
    if (optionStr == "hunter")
        return CLASS_HUNTER;
    if (optionStr == "rogue")
        return CLASS_ROGUE;
    if (optionStr == "priest")
        return CLASS_PRIEST;
    if (optionStr == "shaman")
        return CLASS_SHAMAN;
    if (optionStr == "mage")
        return CLASS_MAGE;
    if (optionStr == "warlock")
        return CLASS_WARLOCK;
    if (optionStr == "druid")
        return CLASS_DRUID;
    return 0;
}

static std::set<CombatBotRoles> RolesFromString(const std::string& optionStr)
{
    std::set<CombatBotRoles> roles;

    if (optionStr == "tank")
        roles.insert(ROLE_TANK);
    else if (optionStr == "meleedps")
        roles.insert(ROLE_MELEE_DPS);
    else if (optionStr == "melee")
    {
        roles.insert(ROLE_TANK);
        roles.insert(ROLE_MELEE_DPS);
    }
    else if (optionStr == "healer")
        roles.insert(ROLE_HEALER);
    else if (optionStr == "rangedps")
        roles.insert(ROLE_RANGE_DPS);
    else if (optionStr == "ranged")
    {
        roles.insert(ROLE_HEALER);
        roles.insert(ROLE_RANGE_DPS);
    }

    return roles;
}

std::set<PartyBotAI*> ChatHandler::MembersFromString(char* args)
{
    std::set<PartyBotAI*> matchedMembers;

    // Get the selected target and AI
    Player* pPlayer = GetSession()->GetPlayer();
    Player* pPlayerTarget = nullptr;
    if (pPlayer->GetSelectionGuid())
        pPlayerTarget = GetSelectedPlayer();
    Player* pTarget = nullptr;

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        // SendSysMessage("You are not in a group.");
        // SetSentErrorMessage(true);
        return matchedMembers;
    }

    bool matchAll = false;
    bool matchSelected = false;
    bool matchUnselected = false;
    uint8 matchClassValue = 0;
    std::set<CombatBotRoles> matchRoleValues;
    bool matchSomething = false;

    std::string optionStr = (args ? std::string(args) : "");
    if (optionStr.empty())
        pTarget = pPlayerTarget;
    else
    {
        if (optionStr == "all")
            matchAll = true;
        else if (optionStr == "me")
            pTarget = pPlayer;
        else if (optionStr == "target")
        {
            if (!pPlayerTarget)
            {
                // SendSysMessage("Option invalid, select a target.");
                // SetSentErrorMessage(true);
                return matchedMembers;
            }
            else
                pTarget = pPlayerTarget;
        }
        else if (optionStr == "selected")
            matchSelected = true;
        else if (optionStr == "unselected")
            matchUnselected = true;
        else
        {
            matchClassValue = ClassFromString(optionStr);
            matchRoleValues = RolesFromString(optionStr);

            matchSomething = (matchClassValue || !matchRoleValues.empty());
            if (!matchSomething)
            {
                Player* pMatchTarget = nullptr;
                if (pPlayer->GetSelectionGuid())
                    pMatchTarget = GetSelectedPlayer();

                if (pMatchTarget == nullptr)
                {
                    // SendSysMessage("Option invalid, select a target or use warrior||paladin||etc||tank||meleedps||rangedps||healer||all.");
                    // SetSentErrorMessage(true);
                    return matchedMembers;
                }
                else
                {
                    bool classAndRole = optionStr == "cr" || optionStr == "classrole" || optionStr == "roleclass";
                    if (optionStr == "c" || optionStr == "class" || classAndRole)
                        matchClassValue = pMatchTarget->GetClass();
                    if (optionStr == "r" || optionStr == "role" || classAndRole)
                    {
                        if (pMatchTarget->AI())
                        {
                            PartyBotAI* pMatchAI = dynamic_cast<PartyBotAI*>(pMatchTarget->AI()); // TODO: Unchecked
                            matchRoleValues = {pMatchAI->GetRole()};
                        }
                        else
                        {
                            // SendSysMessage("Unable to match role when target is not a party bot.");
                            // SetSentErrorMessage(true);
                            return matchedMembers;
                        }
                    }
                    matchSomething = (matchClassValue || !matchRoleValues.empty());
                    if (!matchSomething)
                    {
                        // SendSysMessage("Option invalid and ignored, provide c||r||cr to match selected target on class||role||both.");
                        // SetSentErrorMessage(true);
                        return matchedMembers;
                    }
                }
            }
        }
    }

    if (pTarget)
    {
        if (pTarget->AI())
        {
            PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()); // TODO: Unchecked
            matchedMembers.insert(pAI);
        }
        //PSendSysMessage("Added %s, selected size now %d.", pTarget->GetName(), selectedBots.size());
        return matchedMembers;
    }

    std::set<uint32 /*bot guid*/>& selectedBots = sPlayerBotMgr.m_selectedBots[pPlayer->GetGUIDLow()];
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // If "me" was specified then that's resolved above
            if (pMember == pPlayer)
                continue;
                    
            if (matchSelected && selectedBots.find(pMember->GetGUIDLow()) == selectedBots.end())
                continue;

            if (matchUnselected && selectedBots.find(pMember->GetGUIDLow()) != selectedBots.end())
                continue;

            if (matchClassValue && pMember->GetClass() != matchClassValue)
                continue;

            if (pMember->AI())
            {
                if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pMember->AI()))
                {
                    if (!matchRoleValues.empty() && matchRoleValues.find(pAI->GetRole()) == matchRoleValues.end())
                        continue;

                    matchedMembers.insert(pAI);
                }
            }
        }
    }

    return matchedMembers;
}

bool ChatHandler::HandlePartyBotSelectHelper(char* args, bool add)
{
    Player* pPlayer = GetSession()->GetPlayer();
    std::set<uint32>& selectedBots = sPlayerBotMgr.m_selectedBots[pPlayer->GetGUIDLow()];
    int8 count = 0;

    // Extract the matching set of PartyBotAIs based on args
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    
    // Handle "unselect all" and "select unselected" cases separately
    bool matchAll = (std::string(args) == "all");
    bool matchUnselected = (std::string(args) == "unselected");
    if ((matchAll && !add) || (matchUnselected && add))
        selectedBots.clear();
    if (matchAll && !add)
    {
        PSendSysMessage("Removed all party bots, selected size now 0.");
        return true;
    }

    // Add or remove matching bots
    for (auto pAI : matchingBots)
    {
        if (add)
            selectedBots.insert(pAI->me->GetObjectGuid());
        else
            selectedBots.erase(pAI->me->GetObjectGuid());
    }

    // Send feedback to user
    PSendSysMessage("Considered %d party bots, selected size now %d.", matchingBots.size(), selectedBots.size());
    return true;
}

bool ChatHandler::HandlePartyBotStayHelper(char* args, bool stay)
{
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            pAI->m_stay = stay;
            pMember->StopMoving();
            pMember->GetMotionMaster()->MoveIdle();
        }
    }

    if (stay)
        PSendSysMessage("Staying %d party bots.", matchingBots.size());
    else
        PSendSysMessage("Unstaying %d party bots.", matchingBots.size());

    return true;
}

bool ChatHandler::HandlePartyBotSelectCommand(char* args)
{
    return HandlePartyBotSelectHelper(args, true);
}

bool ChatHandler::HandlePartyBotUnselectCommand(char* args)
{
    return HandlePartyBotSelectHelper(args, false);
}

bool ChatHandler::HandlePartyBotMoveSectorCommand(char* args)
{
    float r1, r2, arcangle;

    // Extract arguments
    if (sscanf(args, "%f %f %f", &r1, &r2, &arcangle) != 3)
    {
        SendSysMessage("Usage: .partybot movesector <r1> <r2> <arcangle>");
        SetSentErrorMessage(true);
        return false;
    }

    Player* pPlayer = GetSession()->GetPlayer();
    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        SendSysMessage("You are not in a group.");
        SetSentErrorMessage(true);
        return false;
    }

    std::set<uint32 /*bot guid*/>& selectedBots = sPlayerBotMgr.m_selectedBots[pPlayer->GetGUIDLow()];
    uint32 botCount = static_cast<uint32>(selectedBots.size());
    if (botCount == 0)
    {
        SendSysMessage("No bots selected.");
        SetSentErrorMessage(true);
        return false;
    }

    // --- Generate spaced points in arcsector ---
    std::vector<std::pair<float, float>> arcPoints;

    auto generateArcSectorPoints = [&](uint32 n)
    {
        std::vector<std::pair<float, float>> result;
        if (n == 0)
            return result;

        uint32 radialSteps = static_cast<uint32>(std::ceil(std::sqrt(n)));
        uint32 angularSteps = static_cast<uint32>(std::ceil(static_cast<float>(n) / radialSteps));

        float radiusStep = (r2 - r1) / std::max(1u, radialSteps);
        float angleStep = arcangle / std::max(1u, angularSteps);

        float baseAngle = pPlayer->GetOrientation();

        for (uint32 r = 0; r < radialSteps; ++r)
        {
            for (uint32 a = 0; a < angularSteps; ++a)
            {
                float radius = r1 + (r + frand(0.0f, 1.0f)) * radiusStep;
                float angle = baseAngle - arcangle / 2.0f + (a + frand(0.0f, 1.0f)) * angleStep;

                float x = pPlayer->GetPositionX() + radius * std::cos(angle);
                float y = pPlayer->GetPositionY() + radius * std::sin(angle);

                result.emplace_back(x, y);
            }
        }

        // Truncate if we have more than needed
        if (result.size() > n)
            result.resize(n);

        return result;
    };


    arcPoints = generateArcSectorPoints(botCount);

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "PartyBot move sector: generated %d points for %d selected bots.", arcPoints.size(), botCount);

    // --- Assign points to bots ---
    uint32 index = 0;
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (selectedBots.find(pMember->GetGUIDLow()) != selectedBots.end())
            {
                if (pMember->AI() && pMember->IsAlive() && pMember->IsInMap(pPlayer) && !pMember->HasUnitState(UNIT_STATE_NO_FREE_MOVE))
                {
                    if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pMember->AI()))
                    {
                        if (index >= arcPoints.size())
                            break;

                        float x = arcPoints[index].first;
                        float y = arcPoints[index].second;
                        float z = pPlayer->GetPositionZ();

                        pPlayer->UpdateAllowedPositionZ(x, y, z);
                        pMember->GetMap()->GetWalkHitPosition(nullptr, pMember->GetPositionX(), pMember->GetPositionY(), pMember->GetPositionZ(), x, y, z, NAV_GROUND | NAV_WATER, r2);
                        pMember->GetMotionMaster()->MovePoint(pMember->GetGUIDLow(), x, y, z, MOVE_PATHFINDING, pMember->GetSpeed(MOVE_RUN));
                        ++index;
                    }
                }
            }
        }
    }

    return true;
}

bool ChatHandler::HandlePartyBotMoveFollowCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            if (pMember->IsAlive() && pMember->IsInMap(pPlayer) && !pMember->HasUnitState(UNIT_STATE_NO_FREE_MOVE))
            {
                if (pMember->GetVictim())
                    StopPartyBotAttackHelper(pAI, pMember);

                if (pMember->GetStandState() != UNIT_STAND_STATE_STAND)
                    pMember->SetStandState(UNIT_STAND_STATE_STAND);

                pMember->InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_MOVEMENT);
                if (pAI->GetRole() == ROLE_TANK)
                    pMember->GetMotionMaster()->MoveFollow(pPlayer, frand(2.0f, 2.5f), frand(-1.0f, 1.0f));
                else if (pAI->GetRole() == ROLE_MELEE_DPS)
                    pMember->GetMotionMaster()->MoveFollow(pPlayer, frand(3.0f, 4.0f), M_PI_F + frand(-0.5f, 0.5f));
                else
                    pMember->GetMotionMaster()->MoveFollow(pPlayer, frand(5.0f, 6.0f), M_PI_F + frand(-0.5f, 0.5f));
            }
        }
    }
    PSendSysMessage("%d party bots are following you.", matchingBots.size());
    return true;
}

bool ChatHandler::HandlePartyBotLosCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    if (CombatBotBaseAI::GroupData* data = CombatBotBaseAI::GetGroupData(pPlayer))
    {
        if (data->losPosition.IsEmpty())
        {
            data->losPosition = pPlayer->GetPosition();
            SendSysMessage("LoS position set.");
        }
        else
        {
            data->losPosition = Position();
            SendSysMessage("LoS position cleared.");
        }
        return true;
    }

    SendSysMessage("LoS position not updated");
    return false;
}

bool ChatHandler::HandlePartyBotStayCommand(char* args)
{
    return HandlePartyBotStayHelper(args, true);
}

bool ChatHandler::HandlePartyBotUnstayCommand(char* args)
{
    return HandlePartyBotStayHelper(args, false);
}

bool HandlePartyBotPauseApplyHelper(Player* pTarget, uint32 duration)
{
    if (pTarget->AI())
    {
        if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
        {
            pAI->m_updateTimer.Reset(duration);

            if (duration)
            {
                if (!pTarget->IsTaxiFlying())
                {
                    pTarget->StopMoving();
                    pTarget->GetMotionMaster()->MoveIdle();
                }

                if (Pet* pPet = pTarget->GetPet())
                {
                    pPet->GetCharmInfo()->SetReactState(REACT_PASSIVE);
                    pPet->AttackStop();
                }
            }

            return true;
        }
    }

    return false;
}

bool ChatHandler::HandlePartyBotPauseHelper(char* args, bool pause)
{
    // Default values
    char* switchStr = nullptr;
    char* durationArg = nullptr;
    uint32 duration = 0;
    const uint32 DEFAULT_DURATION = 5 * MINUTE * IN_MILLISECONDS;

    // Extract the first argument (potentially the switch)
    char* arg1 = ExtractArg(&args);

    // Check if the first argument is non-numeric (i.e., it's the switch)
    if (arg1 && !isdigit(arg1[0]))
    {
        // If it's non-numeric, assign it to the switch
        switchStr = arg1;

        // Extract the second argument (duration) if it exists
        durationArg = ExtractArg(&args);
    }
    else if (arg1)
    {
        // If the first argument is numeric, it's the duration
        durationArg = arg1;
    }

    if (durationArg && isdigit(durationArg[0]))
        duration = std::stoul(durationArg); // Convert string to uint32
    else
        duration = DEFAULT_DURATION;

    if (!pause)
        duration = 0;

    std::set<PartyBotAI*> matchingBots = MembersFromString(switchStr);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            HandlePartyBotPauseApplyHelper(pMember, duration);
        }
    }

    if (pause)
        PSendSysMessage("%d party bots paused for %u seconds.", matchingBots.size(), (duration / IN_MILLISECONDS));
    else
        PSendSysMessage("%d party bots unpaused.", matchingBots.size());

    return true;
}

bool ChatHandler::HandlePartyBotPauseCommand(char* args)
{
    return HandlePartyBotPauseHelper(args, true);
}

bool ChatHandler::HandlePartyBotUnpauseCommand(char* args)
{
    return HandlePartyBotPauseHelper(args, false);
}

bool ChatHandler::HandlePartyBotPullCommand(char* args)
{
    Player* pPlayer = GetSession()->GetPlayer();
    Unit* pTarget = GetSelectedUnit();
    if (!pTarget || !pPlayer->IsValidAttackTarget(pTarget, true))
    {
        SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
        SetSentErrorMessage(true);
        return false;
    }

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
    {
        SendSysMessage("You are not in a group.");
        SetSentErrorMessage(true);
        return false;
    }

    uint32 duration;
    if (!ExtractUInt32(&args, duration))
        duration = 10 * IN_MILLISECONDS;

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == pPlayer)
                continue;

            if (pMember->AI())
            {
                if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pMember->AI()))
                {
                    if (pAI->m_role == ROLE_MELEE_DPS || pAI->m_role == ROLE_RANGE_DPS)
                    {
                        HandlePartyBotPauseApplyHelper(pMember, duration);
                        continue;
                    }
                    else if (pAI->m_role == ROLE_TANK)
                    {
                        if (pMember->IsValidAttackTarget(pTarget))
                            pAI->AttackStart(pTarget);
                    }
                }
            }
        }
    }

    PSendSysMessage("Tank party bots are pulling %s, DPS party bots are paused for %d seconds.", pTarget->GetName(), (duration / IN_MILLISECONDS));
    return true;
}

bool ChatHandler::HandlePartyBotChangeSealCommand(char* args)
{
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            if (pMember->GetClass() == CLASS_PALADIN)
            {
                SpellEntry const* currentSeal = pAI->m_spells.paladin.pSeal;

                auto const& seals = std::vector<SpellEntry const*>{
                    pAI->m_spells.paladin.pSealOfFury,
                    pAI->m_spells.paladin.pSealOfRighteousness,
                    pAI->m_spells.paladin.pSealOfCommand,
                    pAI->m_spells.paladin.pSealOfLight,
                    pAI->m_spells.paladin.pSealOfWisdom,
                };

                auto it = std::find(seals.begin(), seals.end(), currentSeal);
                if (it == seals.end())
                    it = seals.begin();

                std::size_t count = seals.size();
                for (std::size_t i = 1; i <= count; ++i)
                {
                    auto nextIndex = (std::distance(seals.begin(), it) + i) % count;
                    if (seals[nextIndex])
                    {
                        pAI->m_spells.paladin.pSeal = seals[nextIndex];
                        pMember->PMonsterSay("Now using %s", pAI->m_spells.paladin.pSeal->SpellName[0].c_str());
                        break;
                    }
                }
            }
        }
    }

    return true;
}

bool ChatHandler::HandlePartyBotChangeAuraCommand(char* args)
{
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        if (Player* pMember = pAI->me)
        {
            if (pMember->GetClass() == CLASS_PALADIN)
            {
                SpellEntry const* currentAura = pAI->m_spells.paladin.pAura;

                auto const& auras = std::vector<SpellEntry const*>{
                    pAI->m_spells.paladin.pDevotionAura,
                    pAI->m_spells.paladin.pConcentrationAura,
                    pAI->m_spells.paladin.pRetributionAura,
                    pAI->m_spells.paladin.pSanctityAura,
                    pAI->m_spells.paladin.pShadowResistanceAura,
                    pAI->m_spells.paladin.pFrostResistanceAura,
                    pAI->m_spells.paladin.pFireResistanceAura,
                };

                auto it = std::find(auras.begin(), auras.end(), currentAura);
                if (it == auras.end())
                    it = auras.begin();

                std::size_t count = auras.size();
                for (std::size_t i = 1; i <= count; ++i)
                {
                    auto nextIndex = (std::distance(auras.begin(), it) + i) % count;
                    if (auras[nextIndex])
                    {
                        pAI->m_spells.paladin.pAura = auras[nextIndex];
                        pMember->PMonsterSay("Now using %s", pAI->m_spells.paladin.pAura->SpellName[0].c_str());
                        break;
                    }
                }
            }
        }
    }

    return true;
}

bool ChatHandler::HandlePartyBotUnequipCommand(char* args)
{
    Player* pTarget = GetSelectedPlayer();
    if (!pTarget)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    char* cId = ExtractKeyFromLink(&args, "Hitem");
    if (!cId)
        return false;

    uint32 itemId = 0;
    if (!ExtractUInt32(&cId, itemId))
        return false;

    uint32 count = pTarget->GetItemCount(itemId, false);
    if (!count)
    {
        SendSysMessage("Target does not have that item.");
        SetSentErrorMessage(true);
        return false;
    }

    if (pTarget->AI())
    {
        if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
        {
            pTarget->DestroyItemCount(itemId, count, true);
            return true;
        }
    }

    SendSysMessage("Target is not a party bot.");
    SetSentErrorMessage(true);
    return false;
}

bool ChatHandler::HandlePartyBotRemoveCommand(char* args)
{
    std::set<PartyBotAI*> matchingBots = MembersFromString(args);
    for (PartyBotAI* pAI : matchingBots)
    {
        pAI->botEntry->requestRemoval = true;
    }

    PSendSysMessage("%d party bots removed.", matchingBots.size());
    return true;
}

bool ChatHandler::HandleBattleBotAddAlteracCommand(char* args)
{
    return HandleBattleBotAddCommand(args, BATTLEGROUND_QUEUE_AV);
}

bool ChatHandler::HandleBattleBotAddArathiCommand(char* args)
{
    return HandleBattleBotAddCommand(args, BATTLEGROUND_QUEUE_AB);
}

bool ChatHandler::HandleBattleBotAddWarsongCommand(char* args)
{
    return HandleBattleBotAddCommand(args, BATTLEGROUND_QUEUE_WS);
}

bool ChatHandler::HandleBattleBotAddCommand(char* args, uint8 bg)
{
    if (!*args)
    {
        SendSysMessage("Incorrect syntax. Expected faction");
        SetSentErrorMessage(true);
        return false;
    }

    Team botTeam = HORDE;
    uint32 botLevel = sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL);
    bool isTemporary = false;
    std::string option;
    if (char* arg1 = ExtractArg(&args))
    {
        option = arg1;
        if (option == "horde")
            botTeam = HORDE;
        else if (option == "alliance")
            botTeam = ALLIANCE;
        else
        {
            SendSysMessage("Incorrect syntax. Expected faction");
            SetSentErrorMessage(true);
            return false;
        }

        
        ExtractUInt32(&args, botLevel);

        
        if (char* tempStr = ExtractArg(&args))
        {
            if (strcmp(tempStr, "temp") == 0)
                isTemporary = true;
        }
    }

    sPlayerBotMgr.AddBattleBot(BattleGroundQueueTypeId(bg), botTeam, botLevel, isTemporary);
    return true;
}

bool ChatHandler::HandleBattleBotRemoveCommand(char* args)
{
    Player* pTarget = GetSelectedPlayer();
    if (!pTarget)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    if (pTarget->AI())
    {
        if (BattleBotAI* pAI = dynamic_cast<BattleBotAI*>(pTarget->AI()))
        {
            pAI->botEntry->requestRemoval = true;
            return true;
        }
    }

    SendSysMessage("Target is not a battle bot.");
    SetSentErrorMessage(true);
    return false;
}

bool ChatHandler::HandleBattleBotRemoveAllCommand(char* args)
{
    sPlayerBotMgr.DeleteBattleBots();
    SendSysMessage("Removed all battlebots.");
    return true;
}

#define SPELL_RED_GLOW 20370

void ShowBattleBotPathHelper(Map* pMap, BattleBotPath* pPath, uint32 id)
{
    for (const auto& point : *pPath)
    {
        if (Creature* pWaypoint = pMap->SummonCreature(VISUAL_WAYPOINT, point.x, point.y, point.z, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 120000, true))
        {
            // Show path id as level to distinguish individual paths.
            pWaypoint->SetUInt32Value(UNIT_FIELD_LEVEL, id);

            // Mark points that have script attached.
            if (point.pFunc)
                pWaypoint->CastSpell(pWaypoint, SPELL_RED_GLOW, true);
        }
    }
}

bool ChatHandler::HandleBattleBotShowPathCommand(char* args)
{
    Player* pTarget = GetSelectedPlayer();
    if (!pTarget)
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    if (pTarget->AI())
    {
        if (BattleBotAI* pAI = dynamic_cast<BattleBotAI*>(pTarget->AI()))
        {
            if (pAI->m_currentPath)
                ShowBattleBotPathHelper(pTarget->GetMap(), pAI->m_currentPath, 1);
            else
                SendSysMessage("Target is not following a path.");

            return true;
        }
    }

    SendSysMessage("Target is not a battle bot.");
    SetSentErrorMessage(true);
    return false;
}

bool ChatHandler::HandleBattleBotShowAllPathsCommand(char* args)
{
    Player* pPlayer = m_session->GetPlayer();
    BattleGround* pBG = pPlayer->GetBattleGround();
    if (!pBG)
    {
        SendSysMessage("You are not in a battleground.");
        return false;
    }

    std::vector<BattleBotPath*> const* pPaths;

    switch (pBG->GetTypeID())
    {
        case BATTLEGROUND_AB:
        {
            pPaths = &vPaths_AB;
            break;
        }
        case BATTLEGROUND_AV:
        {
            pPaths = &vPaths_AV;
            break;
        }
        case BATTLEGROUND_WS:
        {
            pPaths = &vPaths_WS;
            break;
        }
        default:
            break;
    }

    uint32 id = 1;
    for (const auto& path : *pPaths)
    {
        ShowBattleBotPathHelper(pPlayer->GetMap(), path, id++);
    }

    PSendSysMessage("Showing %u paths for battleground.", id);
    return true;
}
