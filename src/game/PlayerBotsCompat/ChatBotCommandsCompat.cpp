#include "Chat/Chat.h"
#include "Chat/Channel.h"
#include "Group.h"
#include "Guild/Guild.h"
#include "ModPlayerBots/Bot/PlayerbotAI.h"
#include "ModPlayerBots/Bot/PlayerbotMgr.h"
#include "ModPlayerBots/Bot/RandomPlayerbotMgr.h"
#include "PlayerBotsCompat/PlayerbotChatHandlerCompat.h"

namespace
{
bool BotCommandUnavailable(ChatHandler* handler)
{
    handler->SendSysMessage("Legacy PlayerBots commands are disabled in this build.");
    return false;
}
}

namespace PlayerbotChatHandlerCompat
{
bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 /*lang*/, std::string& msg, Player* receiver)
{
    if (!fromPlayer || !receiver || type != CHAT_MSG_WHISPER)
        return true;

    PlayerbotAI* botAI = PlayerbotsMgr::instance().GetPlayerbotAI(receiver);
    if (!botAI)
        return true;

    botAI->HandleCommand(type, msg, fromPlayer);
    return msg != "logout";
}

bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 /*lang*/, std::string& msg, Group* group)
{
    if (!fromPlayer || !group)
        return true;

    std::string const command(msg);
    for (GroupReference* itr = group->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        Player* member = itr->GetSource();
        if (!member)
            continue;

        if (PlayerbotAI* botAI = PlayerbotsMgr::instance().GetPlayerbotAI(member))
            botAI->HandleCommand(type, command, fromPlayer);
    }

    return true;
}

bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 /*lang*/, std::string& msg, Guild* guild)
{
    if (!fromPlayer || !guild || type != CHAT_MSG_GUILD)
        return true;

    std::string const command(msg);
    auto notifyBot = [&](Player* member)
    {
        if (PlayerbotAI* botAI = PlayerbotsMgr::instance().GetPlayerbotAI(member))
            botAI->HandleCommand(type, command, fromPlayer);
    };
    guild->BroadcastWorker(notifyBot);

    return true;
}

bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 /*lang*/, std::string& msg, Channel* channel)
{
    if (!fromPlayer || !channel)
        return true;

    if (PlayerbotMgr* playerbotMgr = PlayerbotsMgr::instance().GetPlayerbotMgr(fromPlayer))
    {
        if (channel->GetFlags() & 0x18)
            playerbotMgr->HandleCommand(type, msg);
    }

    sRandomPlayerbotMgr.HandleCommand(type, msg, fromPlayer);
    return true;
}
}

bool ChatHandler::HandleBotAddAllCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBotAddRandomCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBotAddCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBotDeleteCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBotInfoCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBotReloadCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBotStopCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBotStartCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::PartyBotAddRequirementCheck(Player const* /*pPlayer*/, Player const* /*pTarget*/)
{
    return false;
}
bool ChatHandler::HandlePartyBotAddCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotCloneCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotLoadCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotSetRoleCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotAttackStartCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotAttackStopCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotPullCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotAoECommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotStartCastingCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotStopCastingCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotToggleCastingCommand(bool /*allowCasting*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotControlMarkCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotFocusMarkCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotClearMarksCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotComeToMeCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotUseGObjectCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotPauseCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotUnpauseCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotUnequipCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandlePartyBotRemoveCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotAddCommand(char* /*args*/, uint8 /*bg*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotAddAlteracCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotAddArathiCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotAddWarsongCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotRemoveCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotRemoveAllCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotShowPathCommand(char* /*args*/) { return BotCommandUnavailable(this); }
bool ChatHandler::HandleBattleBotShowAllPathsCommand(char* /*args*/) { return BotCommandUnavailable(this); }
