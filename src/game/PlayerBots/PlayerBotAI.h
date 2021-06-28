/*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

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
        bool SpawnNewPlayer(WorldSession* sess, uint8 classId, uint32 raceId, uint32 mapId, uint32 instanceId, float dx, float dy, float dz, float o, Player* pClone = nullptr);
        PlayerBotEntry* botEntry;
};

class PlayerCreatorAI: public PlayerBotAI
{
    public:
        explicit PlayerCreatorAI(Player* pPlayer, uint8 _race_, uint8 _class_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o) :
            PlayerBotAI(pPlayer), m_race(_race_), m_class(_class_), m_mapId(mapId), m_instanceId(instanceId), m_x(x), m_y(y), m_z(z), m_o(o)
        {
        }
        ~PlayerCreatorAI() override {}
        bool OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess) override
        {
            return SpawnNewPlayer(sess, m_class, m_race, m_mapId, m_instanceId, m_x, m_y, m_z, m_o);
        }
    protected:
        uint8 m_race;
        uint8 m_class;
        uint32 m_mapId;
        uint32 m_instanceId;
        float m_x;
        float m_y;
        float m_z;
        float m_o;
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
