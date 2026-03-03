/*
 * Compatibility header for AzerothCore-style script system
 * This provides stub definitions for script classes used in mod-playerbots
 */

#ifndef PB_SCRIPT_COMPAT_H
#define PB_SCRIPT_COMPAT_H

#include "Common.h"
#include <string>
#include <vector>

class Player;
class WorldPacket;
class WorldSession;
class Unit;
class BattleGround;
class Group;
class Guild;
class Channel;

enum PlayerHook
{
    PLAYERHOOK_ON_LOGIN = 1,
    PLAYERHOOK_ON_AFTER_UPDATE,
    PLAYERHOOK_ON_BEFORE_CRITERIA_PROGRESS,
    PLAYERHOOK_ON_BEFORE_ACHI_COMPLETE,
    PLAYERHOOK_CAN_PLAYER_USE_PRIVATE_CHAT,
    PLAYERHOOK_CAN_PLAYER_USE_GROUP_CHAT,
    PLAYERHOOK_CAN_PLAYER_USE_GUILD_CHAT,
    PLAYERHOOK_CAN_PLAYER_USE_CHANNEL_CHAT,
    PLAYERHOOK_ON_GIVE_EXP,
    PLAYERHOOK_ON_BEFORE_TELEPORT
};

enum ServerHook
{
    SERVERHOOK_CAN_PACKET_RECEIVE = 1
};

enum WorldHook
{
    WORLDHOOK_ON_BEFORE_WORLD_INITIALIZED = 1,
    WORLDHOOK_ON_UPDATE
};

enum MiscHook
{
    MISCHOOK_ON_DESTRUCT_PLAYER = 1
};

class PlayerScript
{
public:
    PlayerScript(const char* name, std::vector<PlayerHook> hooks) : m_name(name), m_hooks(hooks) {}
    virtual ~PlayerScript() = default;

    virtual void OnPlayerLogin(Player* player) { (void)player; }
    virtual void OnPlayerAfterUpdate(Player* player, uint32 diff) { (void)player; (void)diff; }
    virtual bool OnPlayerBeforeTeleport(Player* player, uint32 mapid, float x, float y, float z,
                                        float orientation, uint32 options, Unit* target)
    {
        (void)player; (void)mapid; (void)x; (void)y; (void)z;
        (void)orientation; (void)options; (void)target;
        return true;
    }
    virtual void OnPlayerLogout(Player* player) { (void)player; }
    virtual void OnPlayerbotLogoutBots() {}
    virtual bool OnPlayerBeforeCriteriaProgress(Player* player, int32 criteria) { (void)player; (void)criteria; return true; }
    virtual bool OnPlayerBeforeAchiComplete(Player* player, uint32 achievement) { (void)player; (void)achievement; return true; }
    virtual bool OnPlayerCanUseChat(Player* player, uint32 type, uint32 lang, std::string& msg, Player* receiver) { (void)player; (void)type; (void)lang; (void)msg; (void)receiver; return true; }
    virtual bool OnPlayerCanUseChat(Player* player, uint32 type, uint32 lang, std::string& msg, Group* group) { (void)player; (void)type; (void)lang; (void)msg; (void)group; return true; }
    virtual bool OnPlayerCanUseChat(Player* player, uint32 type, uint32 lang, std::string& msg, Guild* guild) { (void)player; (void)type; (void)lang; (void)msg; (void)guild; return true; }
    virtual bool OnPlayerCanUseChat(Player* player, uint32 type, uint32 lang, std::string& msg, Channel* channel) { (void)player; (void)type; (void)lang; (void)msg; (void)channel; return true; }
    virtual void OnPlayerGiveXP(Player* player, uint32& amount, Unit* victim, uint8 xpSource) { (void)player; (void)amount; (void)victim; (void)xpSource; }

protected:
    const char* m_name;
    std::vector<PlayerHook> m_hooks;
};

class ServerScript
{
public:
    ServerScript(const char* name, std::vector<ServerHook> hooks) : m_name(name), m_hooks(hooks) {}
    virtual ~ServerScript() = default;

    virtual void OnStartup() {}
    virtual void OnShutdown() {}
    virtual void OnAfterUnloadAllMaps() {}
    virtual void OnAfterUnloadAllGridMaps() {}
    virtual bool CanPacketReceive(WorldSession* session, WorldPacket& packet) { (void)session; (void)packet; return true; }
    virtual void OnPacketSend(WorldSession* session, WorldPacket& packet) { (void)session; (void)packet; }
    virtual void OnPacketReceived(WorldSession* session, WorldPacket const& packet) { (void)session; (void)packet; }

protected:
    const char* m_name;
    std::vector<ServerHook> m_hooks;
};

class WorldScript
{
public:
    WorldScript(const char* name, std::vector<WorldHook> hooks) : m_name(name), m_hooks(hooks) {}
    WorldScript(const char* name) : m_name(name) {}
    virtual ~WorldScript() = default;

    virtual void OnAfterConfigLoad(bool reload) { (void)reload; }
    virtual void OnBeforeConfigLoad(bool reload) { (void)reload; }
    virtual void OnStartup() {}
    virtual void OnShutdown() {}
    virtual void OnUpdate(uint32 diff) { (void)diff; }
    virtual void OnAfterHour() {}
    virtual void OnBeforeWorldInitialized() {}

protected:
    const char* m_name;
    std::vector<WorldHook> m_hooks;
};

class MiscScript
{
public:
    MiscScript(const char* name, std::vector<MiscHook> hooks) : m_name(name), m_hooks(hooks) {}
    MiscScript(const char* name) : m_name(name) {}
    virtual ~MiscScript() = default;

    virtual void OnTick() {}
    virtual void OnDestructPlayer(Player* player) { (void)player; }

protected:
    const char* m_name;
    std::vector<MiscHook> m_hooks;
};

class BGScript
{
public:
    BGScript(const char* name) : m_name(name) {}
    virtual ~BGScript() = default;

    virtual void OnBattlegroundStart(BattleGround* bg) { (void)bg; }
    virtual void OnBattlegroundEnd(BattleGround* bg, uint32 winnerTeam) { (void)bg; (void)winnerTeam; }

protected:
    const char* m_name;
};

class PlayerbotScript
{
public:
    PlayerbotScript(const char* name) : m_name(name) {}
    virtual ~PlayerbotScript() = default;

    virtual bool OnPlayerbotCheckLFGQueue(int32 dummy) { (void)dummy; return true; }
    virtual void OnPlayerbotCheckKillTask(Player* player, Unit* victim) { (void)player; (void)victim; }
    virtual void OnPlayerbotCheckPetitionAccount(Player* player, bool& found) { (void)player; (void)found; }
    virtual bool OnPlayerbotCheckUpdatesToSend(Player* player) { (void)player; return true; }
    virtual void OnPlayerbotPacketSent(Player* player, WorldPacket const* packet) { (void)player; (void)packet; }
    virtual void OnPlayerbotUpdate(uint32 diff) { (void)diff; }
    virtual void OnPlayerbotUpdateSessions(Player* player) { (void)player; }
    virtual void OnPlayerbotLogout(Player* player) { (void)player; }
    virtual void OnPlayerbotLogoutBots() {}

protected:
    const char* m_name;
};

#endif // PB_SCRIPT_COMPAT_H
