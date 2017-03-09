#pragma once

#include <memory>
#include "Common.h"
#include "SharedDefines.h" // For "Team"
#include "ObjectGuid.h"

// 2^n values
enum PlayerExtraFlags
{
    // gm abilities
    PLAYER_EXTRA_GM_ON              = 0x0001,
    PLAYER_EXTRA_GM_ACCEPT_TICKETS  = 0x0002,
    PLAYER_EXTRA_ACCEPT_WHISPERS    = 0x0004,
    PLAYER_EXTRA_TAXICHEAT          = 0x0008,
    PLAYER_EXTRA_GM_INVISIBLE       = 0x0010,
    PLAYER_EXTRA_GM_CHAT            = 0x0020,               // Show GM badge in chat messages
    PLAYER_EXTRA_AUCTION_NEUTRAL    = 0x0040,
    PLAYER_EXTRA_AUCTION_ENEMY      = 0x0080,               // overwrite PLAYER_EXTRA_AUCTION_NEUTRAL

    // other states
    PLAYER_EXTRA_PVP_DEATH          = 0x0100,               // store PvP death status until corpse creating.
    PLAYER_EXTRA_WHISP_RESTRICTION  = 0x0200
};

class MasterPlayer;
class Player;
class PlayerSocial;
class WorldSession;
class Channel;

class AbstractPlayer
{
public:
    virtual ~AbstractPlayer() {}
    virtual ObjectGuid GetObjectGuid() const = 0;
    virtual Team GetTeam() const = 0;
    virtual const char* GetName() const = 0;
    virtual uint32 GetZoneId() const = 0;
    virtual uint32 GetAreaId() const = 0;
    virtual uint8 getClass() const = 0;
    virtual uint8 getRace() const = 0;
    virtual uint32 getLevel() const = 0;
    virtual uint32 GetGuildId() const = 0;
    virtual bool isAFK() const = 0;
    virtual bool isDND() const = 0;
    virtual bool isGameMaster() const = 0;
    virtual uint8 chatTag() const = 0;
    virtual WorldSession* GetSession() const = 0;
    virtual PlayerSocial* GetSocial() const = 0;

    virtual void JoinedChannel(Channel *c) = 0;
    virtual void LeftChannel(Channel *c) = 0;

    virtual Player* ToPlayer() const = 0;
    virtual MasterPlayer* ToMasterPlayer() const = 0;
    virtual bool ok() const = 0;
};

template <typename T>
class PlayerWrapper final: public AbstractPlayer
{
public:
    PlayerWrapper(T& pl) : player(pl) {}
    PlayerWrapper(T* pl) : player(*pl) {}
    PlayerWrapper() : player(*((T*)NULL)) {}
    PlayerWrapper(PlayerWrapper<T> const& other) : player(other.player) {}

    virtual ObjectGuid GetObjectGuid() const;
    virtual Team GetTeam() const;
    virtual const char* GetName() const;
    virtual uint32 GetZoneId() const;
    virtual uint32 GetAreaId() const;
    virtual uint8 getClass() const;
    virtual uint8 getRace() const;
    virtual uint32 getLevel() const;
    virtual uint32 GetGuildId() const;
    virtual bool isAFK() const;
    virtual bool isDND() const;
    virtual bool isGameMaster() const;
    virtual uint8 chatTag() const;
    virtual WorldSession* GetSession() const;
    virtual PlayerSocial* GetSocial() const;

    virtual void JoinedChannel(Channel *c);
    virtual void LeftChannel(Channel *c);

    virtual Player* ToPlayer() const;
    virtual MasterPlayer* ToMasterPlayer() const;

    virtual bool ok() const;
protected:
    T& player;
};

typedef std::shared_ptr<AbstractPlayer> PlayerPointer;
