#include "ModPlayerBots/Mgr/Guild/GuildTaskMgr.h"

void GuildTaskMgr::Update(Player* /*owner*/, Player* /*guildMaster*/) {}

bool GuildTaskMgr::HandleConsoleCommand(ChatHandler* /*handler*/, char const* /*args*/)
{
    return false;
}

bool GuildTaskMgr::IsGuildTaskItem(uint32_t /*itemId*/, uint32_t /*guildId*/)
{
    return false;
}

bool GuildTaskMgr::CheckItemTask(uint32_t /*itemId*/, uint32_t /*obtained*/, Player* /*owner*/, Player* /*bot*/,
                                 bool /*byMail*/)
{
    return false;
}

void GuildTaskMgr::CheckKillTask(Player* /*owner*/, Unit* /*victim*/) {}

void GuildTaskMgr::CheckKillTaskInternal(Player* /*owner*/, Unit* /*victim*/) {}

bool GuildTaskMgr::CheckTaskTransfer(std::string const /*text*/, Player* /*owner*/, Player* /*bot*/)
{
    return false;
}
