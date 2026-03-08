#include "Chat.h"
#include "PlayerbotCommandScript.h"
#include "ModPlayerBots/Bot/Factory/PlayerbotFactory.h"
#include "ModPlayerBots/Bot/Debug/PerfMonitor.h"
#include "ModPlayerBots/Bot/PlayerbotMgr.h"
#include "ModPlayerBots/Bot/RandomPlayerbotMgr.h"
#include "ModPlayerBots/Mgr/Guild/GuildTaskMgr.h"
#include "ModPlayerBots/PlayerbotAIConfig.h"
#if !PB_DISABLE_BG_BOT_LOGIC
#include "ModPlayerBots/Ai/Base/Actions/BattleGroundTactics.h"
#endif

bool ChatHandler::HandleRandomPlayerbotCommand(char* args)
{
    return RandomPlayerbotMgr::HandlePlayerbotConsoleCommand(this, args);
}

bool ChatHandler::HandleAutogearCommand(char* /*args*/)
{
    WorldSession* session = GetSession();
    if (!session)
    {
        PSendSysMessage("This command requires an active player session.");
        return false;
    }

    Player* caller = session->GetPlayer();
    Player* target = caller;

    if (Player* selected = GetSelectedPlayer())
    {
        if (selected != caller && session->GetSecurity() < SEC_GAMEMASTER)
        {
            PSendSysMessage("Only GMs can use autogear on another player.");
            return false;
        }

        target = selected;
    }

    if (!sPlayerbotAIConfig.autoGearCommand)
    {
        PSendSysMessage("Autogear is disabled in the playerbots configuration.");
        return false;
    }

    uint32 gearScoreLimit = sPlayerbotAIConfig.autoGearScoreLimit == 0
                                ? 0
                                : PlayerbotFactory::CalcMixedGearScore(sPlayerbotAIConfig.autoGearScoreLimit,
                                                                       sPlayerbotAIConfig.autoGearQualityLimit);

    PlayerbotFactory factory(target, target->GetLevel(), sPlayerbotAIConfig.autoGearQualityLimit, gearScoreLimit);
    factory.InitEquipment(true);
    factory.InitAmmo();

    if (target->GetLevel() >= sPlayerbotAIConfig.minEnchantingBotLevel)
        factory.ApplyEnchantAndGemsNew();

    target->DurabilityRepairAll(false, 1.0f);

    if (target == caller)
        PSendSysMessage("Autogeared %s.", target->GetName());
    else
        PSendSysMessage("Autogeared %s for %s.", target->GetName(), caller->GetName());

    return true;
}

bool ChatHandler::HandleGuildTaskCommand(char* args)
{
    return GuildTaskMgr::HandleConsoleCommand(this, args);
}

bool ChatHandler::HandlePerfMonCommand(char* args)
{
    if (!args)
        args = const_cast<char*>("");

    if (!strcmp(args, "reset"))
    {
        sPerfMonitor.Reset();
        return true;
    }

    if (!strcmp(args, "tick"))
    {
        sPerfMonitor.PrintStats(true, false);
        return true;
    }

    if (!strcmp(args, "stack"))
    {
        sPerfMonitor.PrintStats(false, true);
        return true;
    }

    if (!strcmp(args, "toggle"))
    {
        sPlayerbotAIConfig.perfMonEnabled = !sPlayerbotAIConfig.perfMonEnabled;
        if (sPlayerbotAIConfig.perfMonEnabled)
            LOG_INFO("playerbots", "Performance monitor enabled");
        else
            LOG_INFO("playerbots", "Performance monitor disabled");
        return true;
    }

    sPerfMonitor.PrintStats();
    return true;
}

bool ChatHandler::HandleDebugBGCommand(char* args)
{
#if !PB_DISABLE_BG_BOT_LOGIC
    return BGTactics::HandleConsoleCommand(this, args);
#else
    (void)args;
    return false;
#endif
}

bool ChatHandler::HandleSetSecurityKeyCommand(char* args)
{
    if (!args || !*args)
    {
        PSendSysMessage("Usage: .playerbots account setKey <securityKey>");
        return false;
    }

    WorldSession* session = GetSession();
    if (!session)
    {
        PSendSysMessage("This command requires an active player session.");
        return false;
    }

    Player* player = session->GetPlayer();
    PlayerbotMgr* mgr = PlayerbotsMgr::instance().GetPlayerbotMgr(player);
    if (!mgr)
    {
        PSendSysMessage("PlayerbotMgr instance not found.");
        return false;
    }

    mgr->HandleSetSecurityKeyCommand(player, std::string(args));
    return true;
}

bool ChatHandler::HandleLinkAccountCommand(char* args)
{
    if (!args || !*args)
    {
        PSendSysMessage("Usage: .playerbots account link <accountName> <securityKey>");
        return false;
    }

    WorldSession* session = GetSession();
    if (!session)
    {
        PSendSysMessage("This command requires an active player session.");
        return false;
    }

    char* accountName = strtok(args, " ");
    char* key = strtok(nullptr, " ");
    if (!accountName || !key)
    {
        PSendSysMessage("Usage: .playerbots account link <accountName> <securityKey>");
        return false;
    }

    Player* player = session->GetPlayer();
    PlayerbotMgr* mgr = PlayerbotsMgr::instance().GetPlayerbotMgr(player);
    if (!mgr)
    {
        PSendSysMessage("PlayerbotMgr instance not found.");
        return false;
    }

    mgr->HandleLinkAccountCommand(player, accountName, key);
    return true;
}

bool ChatHandler::HandleViewLinkedAccountsCommand(char* /*args*/)
{
    WorldSession* session = GetSession();
    if (!session)
    {
        PSendSysMessage("This command requires an active player session.");
        return false;
    }

    Player* player = session->GetPlayer();
    PlayerbotMgr* mgr = PlayerbotsMgr::instance().GetPlayerbotMgr(player);
    if (!mgr)
    {
        PSendSysMessage("PlayerbotMgr instance not found.");
        return false;
    }

    mgr->HandleViewLinkedAccountsCommand(player);
    return true;
}

bool ChatHandler::HandleUnlinkAccountCommand(char* args)
{
    if (!args || !*args)
    {
        PSendSysMessage("Usage: .playerbots account unlink <accountName>");
        return false;
    }

    WorldSession* session = GetSession();
    if (!session)
    {
        PSendSysMessage("This command requires an active player session.");
        return false;
    }

    char* accountName = strtok(args, " ");
    if (!accountName)
    {
        PSendSysMessage("Usage: .playerbots account unlink <accountName>");
        return false;
    }

    Player* player = session->GetPlayer();
    PlayerbotMgr* mgr = PlayerbotsMgr::instance().GetPlayerbotMgr(player);
    if (!mgr)
    {
        PSendSysMessage("PlayerbotMgr instance not found.");
        return false;
    }

    mgr->HandleUnlinkAccountCommand(player, accountName);
    return true;
}

void AddPlayerbotsCommandscripts()
{
}
