/**
* Contains interface and calls that have to be implemented by the anticheat lib.
*/

#ifndef ANTICHEAT_H
#define ANTICHEAT_H

#include "Common.h"
#include "Unit.h"

enum CheatAction
{
    CHEAT_ACTION_NONE           = 0x00,
    CHEAT_ACTION_LOG            = 0x01,
    CHEAT_ACTION_REPORT_GMS     = 0x02,
    CHEAT_ACTION_KICK           = 0x04,
    CHEAT_ACTION_BAN_ACCOUNT    = 0x08,
    CHEAT_ACTION_BAN_IP_ACCOUNT = 0x10,
    CHEAT_ACTION_TELEPORT_BACK  = 0x20,
    CHEAT_ACTION_MUTE_PUB_CHANS = 0x40, // Mutes the account from public channels
    CHEAT_MAX_ACTIONS,
};

class WorldSession;
class WardenSanctionableAction;
class ChatHandler;
class WardenInterface;
class PlayerAnticheatInterface;
class AccountPersistentData;
struct AreaEntry;

// Generic class for Warden memory queries
/*class WardenMemoryQuery
{
public:
    WardenMemoryQuery(uint32 address, uint32 length): _address(address), _length(length) {}
    virtual ~WardenMemoryQuery() {}
    virtual void DataRead(uint8 const* data, WardenInterface* warden) = 0;
    virtual bool CanBeSent(WorldSession* session) { return true; }

    uint32 GetAddress() const { return _address; }
    uint32 GetLength() const { return _length; }
private:
    uint32 _address;
    uint32 _length;
};*/

class WardenInterface
{
    public:
        WardenInterface() {}
        virtual ~WardenInterface() {}
        virtual void HandleWardenDataOpcode(WorldPacket & recv_data) {}
        virtual void Update() {}

        //virtual void SendSpeedChange(UnitMoveType moveType, float newSpeed) {}
        //virtual void TrackingUpdateSent(uint32 field, uint32 value) {}

        virtual WorldSession* GetSession() { return NULL; }

        //virtual void HandleInfoCommand(ChatHandler* handler) {}

        // Must be reimplemented
        //virtual void AddMemoryQuery(WardenMemoryQuery* query) { query->DataRead(NULL, this); delete query; }
};

class PlayerAnticheatInterface
{
    public:
        PlayerAnticheatInterface() {}
        virtual ~PlayerAnticheatInterface() {}

        virtual void Init() {}
        virtual CheatAction Update(uint32 diff, std::stringstream& reason) { return CHEAT_ACTION_NONE; }
        virtual CheatAction Finalize(std::stringstream& reason) { return CHEAT_ACTION_NONE; }
        virtual bool IsInKnockBack() const { return false; }
        virtual void KnockBack(float speedxy, float speedz, float cos, float sin) {}


        virtual void AddCheats(uint32 cheats, uint32 count = 1) {}
        virtual void Unreachable(Unit* attacker) {}
        virtual void HandleCommand(ChatHandler* handler) {}
        virtual void OnExplore(AreaEntry const* p) {}
        virtual void OnTransport(Player* plMover, ObjectGuid transportGuid) {}

        virtual bool HandleAnticheatTests(MovementInfo& movementInfo, WorldSession* session, WorldPacket* packet) { return true; }
        virtual bool HandleSpeedChangeAck(MovementInfo& movementInfo, WorldSession* session, WorldPacket* packet, float newSpeed) { return true; }
        virtual void InitSpeeds(Unit* unit) {}

        virtual void OrderSent(WorldPacket const* data) {}

        virtual bool InterpolateMovement(MovementInfo const& mi, uint32 diffMs, float &x, float &y, float &z, float &o) { return true; }

        virtual bool CheckTeleport(uint32 opcode, MovementInfo& movementInfo) { return true; }
};

class AntispamInterface
{
public:
    virtual ~AntispamInterface() {}

    virtual void loadData() {}
    virtual void loadConfig() {}

    virtual std::string normalizeMessage(const std::string &msg, uint32 mask = 0) { return msg; }
    virtual uint8 filterMessage(const std::string &msg) { return 0; }

    virtual void addMessage(const std::string& msg, uint32 type, PlayerPointer from, PlayerPointer to) {}

    virtual bool isMuted(uint32 accountId, bool checkChatType = false, uint32 chatType = 0) const { return false; }
    virtual void mute(uint32 accountId) {}
    virtual void unmute(uint32 accountId) {}
    virtual void showMuted(WorldSession* session) {}
};

class AnticheatLibInterface
{
public:
    virtual ~AnticheatLibInterface() {}
    virtual WardenInterface* CreateWardenFor(WorldSession* client, BigNumber* K)
    {
        return new WardenInterface();
    }
    virtual PlayerAnticheatInterface* CreateAnticheatFor(Player* player)
    {
        return new PlayerAnticheatInterface();
    }
    virtual void LoadAnticheatData() {}
    virtual void LoadConfig() {}
    virtual void MapAccountUpdate(WorldSession* sess) {}
    virtual void SessionAdded(WorldSession* sess) {}
    virtual void OnPlayerLevelUp(Player* player) {}
    virtual void OnClientHashComputed(WorldSession* sess) {}

    // Antispam wrappers
    virtual AntispamInterface* GetAntispam() const { return nullptr; }
    virtual bool CanWhisper(AccountPersistentData const& data, MasterPlayer* player) { return true; }
};

#ifndef USE_ANTICHEAT

class AnticheatDefaultLib: public AnticheatLibInterface
{
};

#endif

AnticheatLibInterface* GetAnticheatLib();

#define sAnticheatLib (GetAnticheatLib())

#endif