#ifndef PLAYERBOT_CHAT_HANDLER_COMPAT_H
#define PLAYERBOT_CHAT_HANDLER_COMPAT_H

#include "Common.h"
#include <string>

class Channel;
class Group;
class Player;
class Guild;

namespace PlayerbotChatHandlerCompat
{
bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 lang, std::string& msg, Player* receiver);
bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 lang, std::string& msg, Group* group);
bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 lang, std::string& msg, Guild* guild);
bool OnPlayerCanUseChat(Player* fromPlayer, uint32 type, uint32 lang, std::string& msg, Channel* channel);
}

#endif
