/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.TrinityCore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef OUTDOOR_PVP_H_
#define OUTDOOR_PVP_H_

#include "SharedDefines.h"
#include "ObjectGuid.h"

class GameObject;
class SpellEntry;

enum OutdoorPvPTypes
{
    OUTDOOR_PVP_HP = 1,
    OUTDOOR_PVP_NA = 2,
    OUTDOOR_PVP_TF = 3,
    OUTDOOR_PVP_ZM = 4,
    OUTDOOR_PVP_SI = 5,
    OUTDOOR_PVP_EP = 6,
};

#define MAX_OUTDOORPVP_TYPES 7

const uint8 CapturePointArtKit[3] = {2, 1, 21};

enum ObjectiveStates
{
    OBJECTIVESTATE_NEUTRAL = 0,
    OBJECTIVESTATE_ALLIANCE,
    OBJECTIVESTATE_HORDE,
    OBJECTIVESTATE_NEUTRAL_ALLIANCE_CHALLENGE,
    OBJECTIVESTATE_NEUTRAL_HORDE_CHALLENGE,
    OBJECTIVESTATE_ALLIANCE_HORDE_CHALLENGE,
    OBJECTIVESTATE_HORDE_ALLIANCE_CHALLENGE,
};

#define OTHER_TEAM(a) (a == TEAM_ALLIANCE ? TEAM_HORDE : TEAM_ALLIANCE)

// struct for go spawning
struct go_type
{
    uint32 entry;
    uint32 map;
    float x;
    float y;
    float z;
    float o;
    float rot0;
    float rot1;
    float rot2;
    float rot3;
};

// struct for creature spawning
struct creature_type
{
    uint32 entry;
    uint32 teamval;
    uint32 map;
    float x;
    float y;
    float z;
    float o;
};

// some class predefs
class Player;
class GameObject;
class WorldPacket;
class Creature;
class Unit;
struct GossipMenuItems;
class OutdoorPvP;
class Map;

typedef std::set<Player*> PlayerSet;

class OPvPCapturePoint
{
    public:

        explicit OPvPCapturePoint(OutdoorPvP * pvp);
        virtual ~OPvPCapturePoint() {}

        virtual uint32 FillInitialWorldStates(WorldPacket & /*data*/) { return 0; }

        // send world state update to all players present
        void SendUpdateWorldState(uint32 field, uint32 value);

        // send kill notify to players in the controlling faction
        void SendObjectiveComplete(uint32 id, uint64 guid);

        // used when player is activated/inactivated in the area
        virtual bool HandlePlayerEnter(Player * plr);
        virtual void HandlePlayerLeave(Player * plr);

        // checks if player is in range of a capture credit marker
        bool IsInsideObjective(Player * plr) const;

        virtual bool HandleCustomSpell(Player *plr, uint32 spellId, GameObject * go);

        virtual int32 HandleOpenGo(Player *plr, uint64 guid);

        // returns true if the state of the objective has changed, in this case, the OutdoorPvP must send a world state ui update.
        virtual bool Update(uint32 diff);

        virtual void ChangeState() = 0;

        virtual void ChangeTeam(TeamId /*oldTeam*/) {}

        virtual void SendChangePhase();

        virtual bool HandleGossipOption(Player *plr, uint64 guid, uint32 gossipid);

        virtual bool HandleDropFlag(Player * plr, uint32 spellId);

        virtual void DeleteSpawns();

        uint32 m_capturePointGUID;

        GameObject *m_capturePoint;

        void AddGO(uint32 type, uint32 guid, uint32 entry = 0);
        void AddCre(uint32 type, uint32 guid, uint32 entry = 0);

        bool SetCapturePointData(uint32 entry, uint32 map, float x, float y, float z, float o = 0,
            float rotation0 = 0, float rotation1 = 0, float rotation2 = 0, float rotation3 = 0);

    protected:

        bool AddObject(uint32 type, uint32 entry, uint32 map, float x, float y, float z, float o,
            float rotation0, float rotation1, float rotation2, float rotation3);
        bool AddCreature(uint32 type, uint32 entry, uint32 teamval, uint32 map, float x, float y, float z, float o, uint32 spawntimedelay = 0);

        bool DelCreature(uint32 type);
        bool DelObject(uint32 type);

        bool DelCapturePoint();

        // active players in the area of the objective, 0 - alliance, 1 - horde
        PlayerSet m_activePlayers[2];

        // total shift needed to capture the objective
        float m_maxValue;
        float m_minValue;

        // maximum speed of capture
        float m_maxSpeed;

        // the status of the objective
        float m_value;

        TeamId m_team;

        // objective states
        ObjectiveStates m_OldState;
        ObjectiveStates m_State;

        // neutral value on capture bar
        uint32 m_neutralValuePct;

        // pointer to the OutdoorPvP this objective belongs to
        OutdoorPvP* m_PvP;

        // map to store the various gameobjects and creatures spawned by the objective
        //        type , guid
        std::map<uint32,uint64> m_Objects;
        std::map<uint32,uint64> m_Creatures;
        std::map<uint64,uint32> m_ObjectTypes;
        std::map<uint64,uint32> m_CreatureTypes;
};

class ZoneScript
{
    friend class ZoneScriptMgr;

    public:

        // ctor
        ZoneScript();

        // dtor
        virtual ~ZoneScript();

		// Renvoit le nombre de WS
        virtual uint32 FillInitialWorldStates(WorldPacket& /*data*/) { return 0; }

        // called when a player triggers an areatrigger
        virtual bool HandleAreaTrigger(Player* /*plr*/, uint32 /*trigger*/) { return false; }

        // called on custom spell
        virtual bool HandleCustomSpell(Player* /*plr*/, uint32 /*spellId*/, GameObject* /*go*/) { return false; }

        // called on go use
        virtual bool HandleOpenGo(Player* /*plr*/, uint64 /*guid*/) { return false; }

        // setup stuff
        virtual bool SetupZoneScript() {return true;}

        virtual void OnGameObjectCreate(GameObject *) {}
        virtual void OnGameObjectRemove(GameObject *) {}
        virtual void OnCreatureRemove(Creature *) {}
        virtual void OnPlayerDeath(Player *) {}
        virtual void OnObjectCreate(GameObject *) {}
        virtual void OnCreatureCreate(Creature * /*creature*/)      {}
        virtual void OnCreatureEnterCombat(Creature * /*creature*/) {}
        virtual void OnCreatureEvade(Creature * /*creature*/)       {}
        virtual void OnCreatureRespawn(Creature * /*crea*/)         {}
        virtual void OnCreatureDeath(Creature * /*creature*/)       {}
        virtual void OnCreatureSpellHit(Unit* /*caster*/,Creature* /*receiver*/, const SpellEntry*)    {}
        virtual void OnPlayerEnter(Player *);
        virtual void OnPlayerLeave(Player *);
        
        // send world state update to all players present
        void SendUpdateWorldState(uint32 field, uint32 value);

        // called by ZoneScriptMgr
        virtual void Update(uint32 diff);

        // awards rewards for player kill
        virtual void HandleKill(Player* /*killer*/, Unit* /*killed*/) {}
        virtual void AwardKillBonus(Player* /*plr*/) {}
        virtual bool HandleDropFlag(Player* /*plr*/, uint32 /*spellId*/) { return false; }
        virtual bool HandleGossipOption(Player* /*plr*/, uint64 /*guid*/, uint32 /*gossipid*/) {return false; }
        void TeamApplyBuff(TeamId team, uint32 spellId, uint32 spellId2 = 0);
        Map* GetMap() const { return m_pMap; }
        void SetMap(Map* pMap) { m_pMap = pMap; }
        Creature* GetCreature(ObjectGuid guid);
        GameObject* GetGameObject(ObjectGuid guid);

        virtual void OnUnitDeath(Unit* /*pKiller*/, Unit* /*pVictim*/, SpellEntry const* /*spellProto*/) {}
    protected:

        PlayerSet m_players[2];
        Map* m_pMap;

        // world state stuff
        virtual void SendRemoveWorldStates(Player * /*plr*/) {}
        void BroadcastPacket(WorldPacket & data) const;

        void RegisterZone(uint32 zoneid);
        bool HasPlayer(Player *plr) const;
        void TeamCastSpell(TeamId team, int32 spellId);
};

// base class for specific outdoor pvp handlers
class OutdoorPvP : public ZoneScript
{
    friend class ZoneScriptMgr;

    public:

        // ctor
        OutdoorPvP();

        // dtor
        virtual ~OutdoorPvP();

        // deletes all gos/creatures spawned by the pvp
        void DeleteSpawns();

        typedef std::map<uint32/*lowguid*/, OPvPCapturePoint*> OPvPCapturePointMap;

		// Renvoit le nombre de WS
        uint32 FillInitialWorldStates(WorldPacket & /*data*/) override { return 0; }

        // called when a player triggers an areatrigger
        bool HandleAreaTrigger(Player * plr, uint32 trigger) override;

        // called on custom spell
        bool HandleCustomSpell(Player *plr, uint32 spellId, GameObject * go) override;

        // called on go use
        bool HandleOpenGo(Player *plr, uint64 guid) override;

        //  stuff
        bool SetupZoneScript() override { return true; }

        void OnGameObjectCreate(GameObject *go) override;
        void OnGameObjectRemove(GameObject *go) override;
        void OnCreatureCreate(Creature *) override {}

        // called by OutdoorPvPMgr, updates the objectives and if needed, sends new worldstateui information
        void Update(uint32 diff) override;
        bool m_objective_changed;

        // handle npc/player kill
        void HandleKill(Player* killer, Unit* killed) override;
        virtual void HandleKillImpl(Player* /*killer*/, Unit* /*killed*/) {}

        // checks if player is in range of a capture credit marker
        bool IsInsideObjective(Player* plr) const;

        // awards rewards for player kill
        void AwardKillBonus(Player* /*plr*/) override {}

        uint32 GetTypeId() const { return m_TypeId; }

        bool HandleDropFlag(Player* plr, uint32 spellId) override;
        bool HandleGossipOption(Player* plr, uint64 guid, uint32 gossipid) override;

        void OnPlayerEnter(Player* pPlayer) override;
        void OnPlayerLeave(Player* pPlayer) override;

    protected:

        // the map of the objectives belonging to this outdoorpvp
        OPvPCapturePointMap m_capturePoints;
        uint32 m_TypeId;

        // world state stuff
        void SendRemoveWorldStates(Player * /*plr*/) override {}

        void AddCapturePoint(OPvPCapturePoint* cp)
        {
            m_capturePoints[cp->m_capturePointGUID] = cp;
        }

        OPvPCapturePoint* GetCapturePoint(uint32 lowguid) const
        {
            OPvPCapturePointMap::const_iterator itr = m_capturePoints.find(lowguid);
            if (itr != m_capturePoints.end())
                return itr->second;
            return nullptr;
        }
};

#endif /*OUTDOOR_PVP_H_*/
