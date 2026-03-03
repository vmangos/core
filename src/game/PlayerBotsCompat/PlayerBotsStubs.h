#ifndef _PLAYERBOTS_STUBS_H
#define _PLAYERBOTS_STUBS_H

#include <memory>
#include <string>
#include <cstdint>

class Player;
class WorldPacket;

class PlayerBotAI
{
public:
    virtual ~PlayerBotAI() = default;

    virtual void BeforeAddToMap(Player* player) {}
    virtual void OnPacketReceived(const WorldPacket* packet) {}
    virtual void Remove() {}
};

enum PlayerBotState
{
    PB_STATE_OFFLINE,
    PB_STATE_LOADING,
    PB_STATE_ONLINE
};

struct PlayerBotEntry
{
    uint64 playerGUID;
    std::string name;
    uint32 accountId;

    uint32 chance;
    uint8 state;
    bool isChatBot;
    bool customBot;
    bool requestRemoval;
    std::unique_ptr<PlayerBotAI> ai;

    PlayerBotEntry(uint64 guid, uint32 account, uint32 chance_)
        : playerGUID(guid), accountId(account), chance(chance_), state(PB_STATE_OFFLINE), isChatBot(false), customBot(false), requestRemoval(false), ai(nullptr)
    {}

    PlayerBotEntry()
        : playerGUID(0), accountId(0), chance(100), state(PB_STATE_OFFLINE), isChatBot(false), customBot(false), requestRemoval(false), ai(nullptr)
    {}
};

#endif // _PLAYERBOTS_STUBS_H
