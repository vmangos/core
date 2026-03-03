#ifndef _PLAYERBOTS_STUBS_H
#define _PLAYERBOTS_STUBS_H

#include <memory>
#include <string>
#include <cstdint>

class Player;
class WorldPacket;

#if !defined(MANGOS_PLAYERBOTAI_H)
class PlayerBotAI
{
public:
    virtual ~PlayerBotAI() = default;

    virtual void BeforeAddToMap(Player* player) {}
    virtual void OnPacketReceived(const WorldPacket* packet) {}
    virtual void Remove() {}
};
#endif

#if !defined(_PLAYERBOTMGR_H)
enum PlayerBotState
{
    PB_STATE_OFFLINE,
    PB_STATE_LOADING,
    PB_STATE_ONLINE
};

struct PlayerBotEntry
{
    uint64_t playerGUID;
    std::string name;
    uint32_t accountId;

    uint32_t chance;
    uint8_t state;
    bool isChatBot;
    bool customBot;
    bool requestRemoval;
    std::unique_ptr<PlayerBotAI> ai;

    PlayerBotEntry(uint64_t guid, uint32_t account, uint32_t chance_)
        : playerGUID(guid), accountId(account), chance(chance_), state(PB_STATE_OFFLINE), isChatBot(false), customBot(false), requestRemoval(false), ai(nullptr)
    {}

    PlayerBotEntry()
        : playerGUID(0), accountId(0), chance(100), state(PB_STATE_OFFLINE), isChatBot(false), customBot(false), requestRemoval(false), ai(nullptr)
    {}
};
#endif

#endif // _PLAYERBOTS_STUBS_H
