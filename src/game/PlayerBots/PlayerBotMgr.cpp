#include "Common.h"
#include "Policies/SingletonImp.h"
#include "PlayerBotMgr.h"
#include "ObjectMgr.h"
#include "World.h"
#include "WorldSession.h"
#include "AccountMgr.h"
#include "Opcodes.h"
#include "Config/Config.h"
#include "Chat.h"
#include "Player.h"
#include "PlayerBotAI.h"
#include "PartyBotAI.h"
#include "Anticheat.h"
#include "Language.h"

INSTANTIATE_SINGLETON_1(PlayerBotMgr);


PlayerBotMgr::PlayerBotMgr()
{
    totalChance = 0;
    _maxAccountId = 0;

    /* Config */
    confMinBots         = 4;
    confMaxBots         = 8;
    confBotsRefresh     = 30000;
    confUpdateDiff      = 10000;
    enable              = false;
    confDebug           = false;
    forceLogoutDelay    = true;

    /* Time */
    m_elapsedTime = 0;
    m_lastBotsRefresh = 0;
    m_lastUpdate = 0;
}

PlayerBotMgr::~PlayerBotMgr()
{

}

void PlayerBotMgr::LoadConfig()
{
    enable              = sConfig.GetBoolDefault("PlayerBot.Enable", false);
    confMinBots         = sConfig.GetIntDefault("PlayerBot.MinBots", 3);
    confMaxBots         = sConfig.GetIntDefault("PlayerBot.MaxBots", 10);
    confBotsRefresh     = sConfig.GetIntDefault("PlayerBot.Refresh", 60000);
    confDebug           = sConfig.GetBoolDefault("PlayerBot.Debug", false);
    confUpdateDiff      = sConfig.GetIntDefault("PlayerBot.UpdateMs", 10000);
    forceLogoutDelay    = sConfig.GetBoolDefault("PlayerBot.ForceLogoutDelay", true);
    if (!forceLogoutDelay)
        m_tempBots.clear();
}

void PlayerBotMgr::load()
{
    // 1- clean
    deleteAll();
    m_bots.clear();
    m_tempBots.clear();
    totalChance = 0;

    // 2- Configuration
    LoadConfig();

    // 3- Load usable account ID
    QueryResult* result = LoginDatabase.PQuery(
                              "SELECT MAX(id)"
                              " FROM account");
    if (!result)
    {
        sLog.outError("Playerbot: unable to load max account id.");
        return;
    }
    Field* fields = result->Fetch();
    _maxAccountId = fields[0].GetUInt32() + 10000;
    delete result;

    // 4- LoadFromDB
    sLog.outString(">> [PlayerBotMgr] Loading Bots ...");
    result = CharacterDatabase.PQuery(
                 "SELECT char_guid, chance, ai"
                 " FROM playerbot");
    if (!result)
        sLog.outString("DB playerbot vide.");
    else
    {
        do
        {
            fields = result->Fetch();
            uint32 guid = fields[0].GetUInt32();
            uint32 acc = GenBotAccountId();
            uint32 chance = fields[1].GetUInt32();

            PlayerBotEntry* entry = new PlayerBotEntry(guid,
                    acc, chance);
            entry->ai = CreatePlayerBotAI(fields[2].GetCppString());
            entry->ai->botEntry = entry;
            if (!sObjectMgr.GetPlayerNameByGUID(guid, entry->name))
                entry->name = "<Unknown>";
            entry->ai->OnBotEntryLoad(entry);
            m_bots[entry->playerGUID] = entry;
            totalChance += chance;
        }
        while (result->NextRow());
        delete result;
        sLog.outString("%u bots charges", m_bots.size());
    }

    // 5- Check config/DB
    if (confMinBots >= m_bots.size() && !m_bots.empty())
        confMinBots = m_bots.size() - 1;
    if (confMaxBots > m_bots.size())
        confMaxBots = m_bots.size();
    if (confMaxBots <= confMinBots)
        confMaxBots = confMinBots + 1;

    // 6- Start initial bots
    if (enable)
    {
        for (uint32 i = 0; i < confMinBots; i++)
            addRandomBot();
    }

    //7 - Remplir les stats
    m_stats.confMaxOnline = confMaxBots;
    m_stats.confMinOnline = confMinBots;
    m_stats.totalBots = m_bots.size();
    m_stats.confBotsRefresh = confBotsRefresh;
    m_stats.confUpdateDiff = confUpdateDiff;

    //8- Afficher les stats si débug
    if (confDebug)
    {
        sLog.outString("[PlayerBotMgr] Between %u and %u bots online", confMinBots, confMaxBots);
        sLog.outString("[PlayerBotMgr] %u now loading", m_stats.loadingCount);
    }
}

void PlayerBotMgr::deleteAll()
{
    m_stats.onlineCount = 0;
    m_stats.loadingCount = 0;

    std::map<uint32, PlayerBotEntry*>::iterator i;
    for (i = m_bots.begin(); i != m_bots.end(); i++)
    {
        if (i->second->state != PB_STATE_OFFLINE)
        {
            OnBotLogout(i->second);
            totalChance += i->second->chance;
        }
    }
    m_tempBots.clear();

    if (confDebug)
        sLog.outString("[PlayerBotMgr] Deleting all bots [OK]");
}

void PlayerBotMgr::OnBotLogin(PlayerBotEntry *e)
{
    e->state = PB_STATE_ONLINE;
    if (confDebug)
        sLog.outString("[PlayerBot][Login]  '%s' GUID:%u Acc:%u", e->name.c_str(), e->playerGUID, e->accountId);
}
void PlayerBotMgr::OnBotLogout(PlayerBotEntry *e)
{
    e->state = PB_STATE_OFFLINE;
    if (confDebug)
        sLog.outString("[PlayerBot][Logout] '%s' GUID:%u Acc:%u", e->name.c_str(), e->playerGUID, e->accountId);
}

void PlayerBotMgr::OnPlayerInWorld(Player* player)
{
    if (PlayerBotEntry* e = player->GetSession()->GetBot())
    {
        player->setAI(e->ai);
        e->ai->SetPlayer(player);
        e->ai->OnPlayerLogin();
    }
}

void PlayerBotMgr::update(uint32 diff)
{
    // Bots temporaires
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
            // Update des "chatBot" aussi.
            for (std::map<uint32, PlayerBotEntry*>::iterator iter = m_bots.begin(); iter != m_bots.end(); ++iter)
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
    if (!((m_elapsedTime - m_lastUpdate) > confUpdateDiff))
        return; //Pas besoin d'update
    m_lastUpdate = m_elapsedTime;

    /* Connection des bots en attente */
    std::map<uint32, PlayerBotEntry*>::iterator iter;
    for (iter = m_bots.begin(); iter != m_bots.end(); ++iter)
    {
        if (!enable && !iter->second->customBot)
            continue;

        if (iter->second->state == PB_STATE_ONLINE)
        {
            if (!iter->second->m_pendingResponses.empty())
            {
                for (const auto opcode : iter->second->m_pendingResponses)
                {
                    iter->second->ai->SendFakePacket(opcode);
                }
                iter->second->m_pendingResponses.clear();
            }

            if (iter->second->requestRemoval)
            {
                if (iter->second->ai && iter->second->ai->me)
                    iter->second->ai->me->RemoveFromGroup();
                if (iter->second->ai && iter->second->ai->me)
                    sPlayerBotMgr.deleteBot(iter->second->ai->me->GetGUIDLow());
                if (WorldSession* sess = sWorld.FindSession(iter->second->accountId))
                    sess->LogoutPlayer(false);

                iter->second->requestRemoval = false;
                continue;
            }
        }

        if (iter->second->state != PB_STATE_LOADING)
            continue;

        WorldSession* sess = sWorld.FindSession(iter->second->accountId);

        if (!sess)
        {
            // This may happen : just wait for the World to add the session.
            //sLog.outString("/!\\ PlayerBot in queue but Session not in World ... Account : %u, GUID : %u", iter->second->accountId, iter->second->playerGUID);
            continue;
        }
        if (iter->second->ai->OnSessionLoaded(iter->second, sess))
        {
            OnBotLogin(iter->second);
            m_stats.loadingCount--;

            if (iter->second->isChatBot)
                m_stats.onlineChat++;
            else
                m_stats.onlineCount++;
        }
        else
            sLog.outError("PLAYERBOT: Unable to load session id %u", iter->second->accountId);
    }
    if (!enable)
        return;
    uint32 updatesCount = (m_elapsedTime - m_lastBotsRefresh) / confBotsRefresh;
    for (uint32 i = 0; i < updatesCount; ++i)
    {
        addOrRemoveBot();
        m_lastBotsRefresh += confBotsRefresh;
    }
}

/*
Toutes les X minutes, ajoute ou enleve un bot.
*/
bool PlayerBotMgr::addOrRemoveBot()
{
    uint32 alea = urand(confMinBots, confMaxBots);
    /*
    10 --- --- --- --- --- --- --- --- --- --- 20 bots
                NumActuel
    [alea ici : remove    ][    ici, add    ]
    */
    if (alea > m_stats.onlineCount)
        return addRandomBot();
    else
        return deleteRandomBot();

}

bool PlayerBotMgr::addBot(PlayerBotAI* ai)
{
    // Find a correct accountid ?
    PlayerBotEntry* e = new PlayerBotEntry();
    e->ai = ai;
    e->accountId = GenBotAccountId();
    e->playerGUID = sObjectMgr.GeneratePlayerLowGuid();
    e->customBot = true;
    ai->botEntry = e;
    m_bots[e->playerGUID] = e;
    addBot(e->playerGUID, false);
    return true;
}

bool PlayerBotMgr::addBot(uint32 playerGUID, bool chatBot)
{
    uint32 accountId = 0;
    PlayerBotEntry *e = nullptr;
    std::map<uint32, PlayerBotEntry*>::iterator iter = m_bots.find(playerGUID);
    if (iter == m_bots.end())
        accountId = sObjectMgr.GetPlayerAccountIdByGUID(playerGUID);
    else
        accountId = iter->second->accountId;
    if (!accountId)
    {
        DETAIL_LOG("Compte du joueur %u introuvable ...", playerGUID);
        return false;
    }

    if (iter != m_bots.end())
        e = iter->second;
    else
    {
        DETAIL_LOG("Adding temporary PlayerBot.");
        e = new PlayerBotEntry();
        e->state        = PB_STATE_LOADING;
        e->playerGUID   = playerGUID;
        e->chance       = 10;
        e->accountId    = accountId;
        e->isChatBot    = chatBot;
        e->ai           = new PlayerBotAI(nullptr);
        m_bots[playerGUID] = e;
    }

    e->state = PB_STATE_LOADING;
    WorldSession* session = new WorldSession(accountId, nullptr, sAccountMgr.GetSecurity(accountId), 0, LOCALE_enUS);
    session->SetBot(e);
    sWorld.AddSession(session);
    m_stats.loadingCount++;
    if (chatBot)
        AddTempBot(accountId, 20000);
    return true;
}

bool PlayerBotMgr::addRandomBot()
{
    uint32 alea = urand(0, totalChance);
    std::map<uint32, PlayerBotEntry*>::iterator it;
    bool done = false;
    for (it = m_bots.begin(); it != m_bots.end() && !done; it++)
    {
        if (it->second->state != PB_STATE_OFFLINE)
            continue;
        if (it->second->customBot)
            continue;
        uint32 chance = it->second->chance;

        if (chance >= alea)
        {
            addBot(it->first);
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

bool PlayerBotMgr::deleteBot(uint32 playerGUID)
{
    std::map<uint32, PlayerBotEntry*>::iterator iter = m_bots.find(playerGUID);
    if (iter == m_bots.end())
        return false;

    if (iter->second->state == PB_STATE_LOADING)
        m_stats.loadingCount--;
    else if (iter->second->state == PB_STATE_ONLINE)
        m_stats.onlineCount--;

    OnBotLogout(iter->second);
    return true;
}

bool PlayerBotMgr::deleteRandomBot()
{
    if (m_stats.onlineCount < 1)
        return false;
    uint32 idDelete = urand(0, m_stats.onlineCount);
    uint32 onlinePassed = 0;
    std::map<uint32, PlayerBotEntry*>::iterator iter;
    for (iter = m_bots.begin(); iter != m_bots.end(); iter++)
    {
        if (!iter->second->customBot && !iter->second->isChatBot && iter->second->state == PB_STATE_ONLINE)
        {
            onlinePassed++;
            if (onlinePassed == idDelete)
            {
                OnBotLogout(iter->second);
                m_stats.onlineCount--;
                return true;
            }
        }
    }
    return false;
}

bool PlayerBotMgr::ForceAccountConnection(WorldSession* sess)
{
    if (sess->GetBot())
        return sess->GetBot()->state != PB_STATE_OFFLINE;

    // Bots temporaires
    return m_tempBots.find(sess->GetAccountId()) != m_tempBots.end();
}

bool PlayerBotMgr::IsPermanentBot(uint32 playerGUID)
{
    std::map<uint32, PlayerBotEntry*>::iterator iter = m_bots.find(playerGUID);
    return iter != m_bots.end();
}

bool PlayerBotMgr::IsChatBot(uint32 playerGuid)
{
    std::map<uint32, PlayerBotEntry*>::iterator iter = m_bots.find(playerGuid);
    return iter != m_bots.end() && iter->second->isChatBot;
}

void PlayerBotMgr::addAllBots()
{
    std::map<uint32, PlayerBotEntry*>::iterator it;
    for (it = m_bots.begin(); it != m_bots.end(); it++)
    {
        if (!it->second->isChatBot && it->second->state == PB_STATE_OFFLINE)
            addBot(it->first);
    }
}

bool ChatHandler::HandleBotReloadCommand(char * args)
{
    sPlayerBotMgr.load();
    SendSysMessage("PlayerBot recharge");
    return true;
}

bool ChatHandler::HandleBotAddRandomCommand(char * args)
{
    uint32 count = 1;
    char* sCount = strtok((char*)args, " ");
    if (sCount)
        count = uint32(atoi(sCount));
    for (uint32 i = 0; i < count; ++i)
        sPlayerBotMgr.addRandomBot();
    PSendSysMessage("%u bots added", count);
    return true;
}

bool ChatHandler::HandleBotStopCommand(char * args)
{
    sPlayerBotMgr.deleteAll();
    SendSysMessage("Tous les bots ont ete decharges.");
    return true;
}

bool ChatHandler::HandleBotAddAllCommand(char * args)
{
    sPlayerBotMgr.addAllBots();
    SendSysMessage("Tous les bots ont ete connecte");
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
    if (!guid || !sPlayerBotMgr.addBot(guid))
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
        SendSysMessage("Syntaxe : $nomDuJoueur");
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
    if (sPlayerBotMgr.deleteBot(lowGuid))
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

uint8 SelectRandomRaceForClass(uint8 playerClass, Team playerTeam)
{
    switch (playerClass)
    {
        case CLASS_WARRIOR:
        {
            if (playerTeam == ALLIANCE)
            {
                std::vector<uint32> races = { RACE_HUMAN, RACE_DWARF, RACE_NIGHTELF, RACE_GNOME };
                return SelectRandomContainerElement(races);
            }
            else
            {
                std::vector<uint32> races = { RACE_ORC, RACE_UNDEAD, RACE_TAUREN, RACE_TROLL };
                return SelectRandomContainerElement(races);
            }
            break;
        }
        case CLASS_PALADIN:
        {
            return urand(0, 1) ? RACE_HUMAN : RACE_DWARF;
        }
        case CLASS_HUNTER:
        {
            if (playerTeam == ALLIANCE)
            {
                std::vector<uint32> races = { RACE_DWARF, RACE_NIGHTELF };
                return SelectRandomContainerElement(races);
            }
            else
            {
                std::vector<uint32> races = { RACE_ORC, RACE_TAUREN, RACE_TROLL };
                return SelectRandomContainerElement(races);
            }
            break;
        }
        case CLASS_ROGUE:
        {
            if (playerTeam == ALLIANCE)
            {
                std::vector<uint32> races = { RACE_HUMAN, RACE_DWARF, RACE_NIGHTELF, RACE_GNOME };
                return SelectRandomContainerElement(races);
            }
            else
            {
                std::vector<uint32> races = { RACE_ORC, RACE_UNDEAD, RACE_TROLL };
                return SelectRandomContainerElement(races);
            }
            break;
        }
        case CLASS_PRIEST:
        {
            if (playerTeam == ALLIANCE)
            {
                std::vector<uint32> races = { RACE_HUMAN, RACE_DWARF, RACE_NIGHTELF };
                return SelectRandomContainerElement(races);
            }
            else
            {
                std::vector<uint32> races = { RACE_UNDEAD, RACE_TROLL };
                return SelectRandomContainerElement(races);
            }
            break;
        }
        case CLASS_SHAMAN:
        {
            std::vector<uint32> races = { RACE_ORC, RACE_TAUREN, RACE_TROLL };
            return SelectRandomContainerElement(races);
        }
        case CLASS_MAGE:
        {
            if (playerTeam == ALLIANCE)
            {
                std::vector<uint32> races = { RACE_HUMAN, RACE_GNOME };
                return SelectRandomContainerElement(races);
            }
            else
            {
                std::vector<uint32> races = { RACE_UNDEAD, RACE_TROLL };
                return SelectRandomContainerElement(races);
            }
            break;
        }
        case CLASS_WARLOCK:
        {
            if (playerTeam == ALLIANCE)
            {
                std::vector<uint32> races = { RACE_HUMAN, RACE_GNOME };
                return SelectRandomContainerElement(races);
            }
            else
            {
                std::vector<uint32> races = { RACE_ORC, RACE_UNDEAD };
                return SelectRandomContainerElement(races);
            }
            break;
        }
        case CLASS_DRUID:
        {
            return playerTeam == ALLIANCE ? RACE_NIGHTELF : RACE_TAUREN;
        }
    }

    return 0;
}

bool ChatHandler::HandlePartyBotAddCommand(char* args)
{
    Player* pPlayer = m_session->GetPlayer();
    if (!pPlayer)
        return false;

    if (pPlayer->InBattleGround())
    {
        SendSysMessage("Cannot add bots inside battlegrounds.");
        SetSentErrorMessage(true);
        return false;
    }

    if (pPlayer->GetGroup() && pPlayer->GetGroup()->IsFull())
    {
        SendSysMessage("Cannot add more bots. Group is full.");
        SetSentErrorMessage(true);
        return false;
    }

    if (Map const* pMap = pPlayer->GetMap())
    {
        if (pMap->IsDungeon() &&
            pMap->GetPlayers().getSize() >= pMap->GetMapEntry()->maxPlayers)
        {
            SendSysMessage("Cannot add more bots. Instance is full.");
            SetSentErrorMessage(true);
            return false;
        }
    }

    if (!args)
    {
        SendSysMessage("Incorrect syntax. Expected role or class.");
        SetSentErrorMessage(true);
        return false;
    }

    uint8 botClass = 0;
    PartyBotRole botRole = PB_ROLE_INVALID;

    std::string option = args;
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
    else if (option == "hunter")
        botClass = CLASS_HUNTER;
    else if (option == "dps")
    {
        std::vector<uint32> dpsClasses = { CLASS_WARRIOR, CLASS_HUNTER, CLASS_ROGUE, CLASS_MAGE, CLASS_WARLOCK };
        botClass = SelectRandomContainerElement(dpsClasses);
        botRole = PB_ROLE_DPS;
    }
    else if (option == "healer")
    {
        std::vector<uint32> dpsClasses = { CLASS_PRIEST, CLASS_DRUID };
        if (pPlayer->GetTeam() == HORDE)
            dpsClasses.push_back(CLASS_SHAMAN);
        else
            dpsClasses.push_back(CLASS_PALADIN);
        botClass = SelectRandomContainerElement(dpsClasses);
        botRole = PB_ROLE_HEALER;
    }
    else if (option == "tank")
    {
        botClass = CLASS_WARRIOR;
        botRole = PB_ROLE_TANK;
    }

    if (!botClass)
    {
        SendSysMessage("Incorrect syntax. Expected role or class.");
        SetSentErrorMessage(true);
        return false;
    }

    uint8 botRace = SelectRandomRaceForClass(botClass, pPlayer->GetTeam());

    float x, y, z;
    pPlayer->GetNearPoint(pPlayer, x, y, z, 0, 5.0f, frand(0.0f, 6.0f));

    PartyBotAI* ai = new PartyBotAI(pPlayer, nullptr, botRole, botRace, botClass, pPlayer->GetMapId(), pPlayer->GetMap()->GetInstanceId(), x, y, z, pPlayer->GetOrientation());
    sPlayerBotMgr.addBot(ai);
    
    SendSysMessage("New party bot added.");

    return true;
}

bool ChatHandler::HandlePartyBotCloneCommand(char* args)
{
    Player* pPlayer = m_session->GetPlayer();
    if (!pPlayer)
        return false;

    if (pPlayer->InBattleGround())
    {
        SendSysMessage("Cannot add bots inside battlegrounds.");
        SetSentErrorMessage(true);
        return false;
    }

    if (pPlayer->GetGroup() && pPlayer->GetGroup()->IsFull())
    {
        SendSysMessage("Cannot add more bots. Group is full.");
        SetSentErrorMessage(true);
        return false;
    }

    if (Map const* pMap = pPlayer->GetMap())
    {
        if (pMap->IsDungeon() &&
            pMap->GetPlayers().getSize() >= pMap->GetMapEntry()->maxPlayers)
        {
            SendSysMessage("Cannot add more bots. Instance is full.");
            SetSentErrorMessage(true);
            return false;
        }
    }

    Player* pTarget = GetSelectedPlayer();
    if (!pTarget || (pTarget->GetTeam() != pPlayer->GetTeam()))
    {
        SendSysMessage(LANG_NO_CHAR_SELECTED);
        SetSentErrorMessage(true);
        return false;
    }

    uint8 botRace = pTarget->GetRace();
    uint8 botClass = pTarget->GetClass();

    float x, y, z;
    pPlayer->GetNearPoint(pPlayer, x, y, z, 0, 5.0f, frand(0.0f, 6.0f));

    PartyBotAI* ai = new PartyBotAI(pPlayer, pTarget, PB_ROLE_INVALID, botRace, botClass, pPlayer->GetMapId(), pPlayer->GetMap()->GetInstanceId(), x, y, z, pPlayer->GetOrientation());
    sPlayerBotMgr.addBot(ai);

    SendSysMessage("New party bot clone added.");

    return true;
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

    PartyBotRole role = PB_ROLE_INVALID;
    std::string roleStr = args;

    if (roleStr == "tank")
        role = PB_ROLE_TANK;
    else if (roleStr == "dps")
        role = PB_ROLE_DPS;
    else if (roleStr == "healer")
        role = PB_ROLE_HEALER;

    if (role == PB_ROLE_INVALID)
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

bool ChatHandler::HandlePartyBotRemoveCommand(char* args)
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
        if (PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pTarget->AI()))
        {
            pAI->botEntry->requestRemoval = true;
            return true;
        }
    }

    SendSysMessage("Target is not a party bot.");
    SetSentErrorMessage(true);
    return false;
}
