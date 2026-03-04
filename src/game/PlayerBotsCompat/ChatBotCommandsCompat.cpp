#include "Chat/Chat.h"

namespace
{
bool BotCommandUnavailable(ChatHandler* handler)
{
    handler->SendSysMessage("Legacy PlayerBots commands are disabled in this build.");
    return false;
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
