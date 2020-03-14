#ifndef MANGOS_PLAYERBOTAI_H
#define MANGOS_PLAYERBOTAI_H

#include "PlayerAI.h"
#include "WorldSession.h"

struct PlayerBotEntry;
class WorldSession;
class PlayerBotAI;

PlayerBotAI* CreatePlayerBotAI(std::string ainame);

class PlayerBotAI: public PlayerAI
{
    public:
        explicit PlayerBotAI(Player* pPlayer = nullptr) : PlayerAI(pPlayer), botEntry(nullptr) {}
        ~PlayerBotAI() override {}
        void Remove() override;

        virtual bool OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess);
        virtual void OnBotEntryLoad(PlayerBotEntry* entry) {}
        virtual void OnPacketReceived(WorldPacket const* /*packet*/) {} // server has sent a packet to this session
        virtual void SendFakePacket(uint16 /*opcode*/) {} // ai has scheduled delayed response to opcode
        void UpdateAI(uint32 const /*diff*/) override; // Handle delayed teleports
        virtual void OnPlayerLogin() {}
        virtual void BeforeAddToMap(Player* player) {} // me=nullptr at call
        // Helpers
        bool SpawnNewPlayer(WorldSession* sess, uint8 _class, uint32 _race, uint32 mapId, uint32 instanceId, float dx, float dy, float dz, float o, Player* pClone = nullptr);
        PlayerBotEntry* botEntry;
};

class PlayerCreatorAI: public PlayerBotAI
{
    public:
        explicit PlayerCreatorAI(Player* pPlayer, uint8 _race_, uint8 _class_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o) :
            PlayerBotAI(pPlayer), _race(_race_), _class(_class_), _mapId(mapId), _instanceId(instanceId), _x(x), _y(y), _z(z), _o(o)
        {
        }
        ~PlayerCreatorAI() override {}
        bool OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess) override
        {
            return SpawnNewPlayer(sess, _class, _race, _mapId, _instanceId, _x, _y, _z, _o);
        }
    protected:
        uint8 _race;
        uint8 _class;
        uint32 _mapId;
        uint32 _instanceId;
        float _x;
        float _y;
        float _z;
        float _o;
};

class PlayerBotFleeingAI : public PlayerBotAI
{
    public:
        PlayerBotFleeingAI() : PlayerBotAI() {}
        void OnPlayerLogin() override;
};

class MageOrgrimmarAttackerAI: public PlayerBotAI
{
    public:
        explicit MageOrgrimmarAttackerAI(Player* pPlayer = nullptr) : PlayerBotAI(pPlayer) {}
        ~MageOrgrimmarAttackerAI() override {}
        bool OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess) override;
        void UpdateAI(uint32 const /*diff*/) override;
};

class PopulateAreaBotAI: public PlayerBotAI
{
    public:
        explicit PopulateAreaBotAI(uint32 map, float x, float y, float z, uint32 team, float radius, Player* pPlayer = nullptr) : PlayerBotAI(pPlayer), _map(map), _x(x), _y(y), _z(z), _radius(radius), _team(team) {}
        ~PopulateAreaBotAI() override {}
        void BeforeAddToMap(Player* player) override; // me=nullptr at call
        void OnPlayerLogin() override;
    protected:
        uint32 _map;
        float _x, _y, _z;
        float _radius;
        uint32 _team;
};
#endif
