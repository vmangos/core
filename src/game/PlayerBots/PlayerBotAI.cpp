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

#include "PlayerBotMgr.h"
#include "PlayerBotAI.h"
#include "Player.h"
#include "Log.h"
#include "SocialMgr.h"
#include "MotionMaster.h"
#include "ObjectMgr.h"
#include "MoveSpline.h"
#include "Opcodes.h"
#include "WorldPacket.h"

bool PlayerBotAI::OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess)
{
    sess->LoginPlayer(entry->playerGUID);
    return true;
}

void PlayerBotAI::UpdateAI(uint32 const diff)
{
    if (me->IsBeingTeleportedNear())
    {
        WorldPacket data(MSG_MOVE_TELEPORT_ACK, 10);
        data << me->GetObjectGuid();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        data << uint32(0) << uint32(0);
#else
        data << uint32(0);
#endif
        me->GetSession()->HandleMoveTeleportAckOpcode(data);
    }
    if (me->IsBeingTeleportedFar())
        me->GetSession()->HandleMoveWorldportAckOpcode();
}

void PlayerBotAI::Remove()
{
    if (me)
    {
        if (me->AI() == this)
            me->SetAI(nullptr);
        me = nullptr;
    }
}

void PlayerBotFleeingAI::OnPlayerLogin()
{
    me->GetMotionMaster()->MoveFleeing(me);
    me->SetCheatGod(true);
}

// MageOrgrimmarAttackerAI event
enum
{
    SPELL_FROST_NOVA = 122,
    SPELL_FIREBOLT = 133,
    AURA_REGEN_MANA = 430,
};


bool PlayerBotAI::SpawnNewPlayer(WorldSession* sess, uint8 class_, uint32 race_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o, Player* pClone)
{
    ASSERT(botEntry);
    std::string name = sObjectMgr.GeneratePetName(1863); // Succubus name
    normalizePlayerName(name);
    uint8 gender = pClone ? pClone->GetByteValue(UNIT_FIELD_BYTES_0, UNIT_BYTES_0_OFFSET_GENDER) : urand(0, 1);
    uint8 skin = pClone ? pClone->GetByteValue(PLAYER_BYTES, PLAYER_BYTES_OFFSET_SKIN_ID) : urand(0, 5);
    uint8 face = pClone ? pClone->GetByteValue(PLAYER_BYTES, PLAYER_BYTES_OFFSET_FACE_ID) : urand(0, 5);
    uint8 hairStyle = pClone ? pClone->GetByteValue(PLAYER_BYTES, PLAYER_BYTES_OFFSET_HAIR_STYLE_ID) : urand(0, 5);
    uint8 hairColor = pClone ? pClone->GetByteValue(PLAYER_BYTES, PLAYER_BYTES_OFFSET_HAIR_COLOR_ID) : urand(0, 5);
    uint8 facialHair = pClone ? pClone->GetByteValue(PLAYER_BYTES_2, PLAYER_BYTES_2_OFFSET_FACIAL_STYLE) : urand(0, 5);
    Player* newChar = new Player(sess);
    uint32 guid = botEntry->playerGUID;
    if (!newChar->Create(guid, name, race_, class_, gender, skin, face, hairStyle, hairColor, facialHair))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "PlayerBotAI::SpawnNewPlayer: Unable to create a player!");
        delete newChar;
        return false;
    }
    newChar->SetLocationMapId(mapId);
    newChar->SetLocationInstanceId(instanceId);
    newChar->SetAutoInstanceSwitch(false);
    newChar->GetMotionMaster()->Initialize();
    // Set instance
    if (instanceId && mapId > 1) // Not a continent
    {
        DungeonPersistentState* state = (DungeonPersistentState*)sMapPersistentStateMgr
                .AddPersistentState(sMapStorage.LookupEntry<MapEntry>(mapId), instanceId, time(nullptr) + 3600, false, true);
        newChar->BindToInstance(state, true, true);
    }
    // Generate position
    Map* map = sMapMgr.FindMap(mapId, instanceId);
    if (!map)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "PlayerBotAI::SpawnNewPlayer: Map (%u, %u) not found!", mapId, instanceId);
        delete newChar;
        return false;
    }
    newChar->Relocate(x, y, z, o);
    sObjectMgr.InsertPlayerInCache(newChar);
    newChar->SetMap(map);
    newChar->SaveRecallPosition();
    newChar->CreatePacketBroadcaster();
    MasterPlayer* mPlayer = new MasterPlayer(sess);
    mPlayer->LoadPlayer(newChar);
    mPlayer->SetSocial(sSocialMgr.LoadFromDB(nullptr, newChar->GetObjectGuid()));
    if (!newChar->GetMap()->Add(newChar))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "PlayerBotAI::SpawnNewPlayer: Unable to add player to map!");
        delete newChar;
        return false;
    }
    sess->SetPlayer(newChar);
    sess->SetMasterPlayer(mPlayer);
    sObjectAccessor.AddObject(newChar);
    newChar->SetCanModifyStats(true);
    newChar->UpdateAllStats();
    return true;
}
bool MageOrgrimmarAttackerAI::OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess)
{
    return SpawnNewPlayer(sess, CLASS_MAGE, RACE_GNOME, 1, 0, 1017.0f, -4450, 12, 0.65f);
}

void MageOrgrimmarAttackerAI::UpdateAI(uint32 const diff)
{
    PlayerBotAI::UpdateAI(diff);
    if (me->GetLevel() != 60)
        me->GiveLevel(60);
    // DEATH
    if (!me->IsAlive())
    {
        sPlayerBotMgr.DeleteBot(me->GetGUIDLow());
        /*
        if (me->GetDeathState() < CORPSE)
            return;
        if (me->GetDeathState() == CORPSE && me->GetDeathTimer() && me->GetDeathTimer() < (6 * MINUTE * IN_MILLISECONDS - 30000))
        {
            me->SetHealth(1);
            me->RepopAtGraveyard();
        }
        else if (me->GetDeathState() == CORPSE && !me->GetDeathTimer())
        {
            me->ResurrectPlayer(0.5f);
            me->SpawnCorpseBones();
        }
        */
        return;
    }
    // COMBAT AI
    if (me->IsNonMeleeSpellCasted(false) || (me->HasAura(AURA_REGEN_MANA) && me->GetPower(POWER_MANA) != me->GetMaxPower(POWER_MANA)))
        return;
    float range = me->IsInCombat() ? 30.0f : frand(15, 30);
    Unit* target = me->SelectNearestTarget(range);
    if (target && !me->IsWithinLOSInMap(target))
        target = nullptr;
    // OOM ?
    if (me->GetPower(POWER_MANA) < 40 && target && me->IsInCombat())
    {
        if (me->Attack(target, true))
            me->GetMotionMaster()->MoveChase(target);
        return;
    }
    // Stop chase if has mana
    if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
        me->GetMotionMaster()->MovementExpired();
    bool nearTarget = target && target->CanReachWithMeleeAutoAttack(me);
    if (me->IsSpellReady(SPELL_FROST_NOVA) && me->GetPower(POWER_MANA) > 50)
        if (nearTarget)
            me->CastSpell(me, SPELL_FROST_NOVA, false);
    if (nearTarget && target->HasUnitState(UNIT_STAT_CAN_NOT_MOVE))
    {
        // already runing
        if (!me->movespline->Finalized())
            return;
        // Try to kit
        float x, y, z;
        me->GetPosition(x, y, z);
        float d = me->GetDistance(target);
        d += me->GetObjectBoundingRadius();
        d += target->GetObjectBoundingRadius();
        x += (x - target->GetPositionX()) * 5.0f / d;
        y += (y - target->GetPositionY()) * 5.0f / d;
        me->UpdateGroundPositionZ(x, y, z);
        me->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING | MOVE_EXCLUDE_STEEP_SLOPES);
        return;
    }

    if (target && me->GetPower(POWER_MANA) > 50)
    {
        uint32 spellId = SPELL_FIREBOLT;
        me->SetFacingToObject(target);
        if (!me->movespline->Finalized())
            me->StopMoving();

        /*float z = me->GetPositionZ();
        me->UpdateGroundPositionZ(me->GetPositionX(), me->GetPositionY(), z);
        me->Relocate(me->GetPositionX(), me->GetPositionY(), z);
        me->m_movementInfo.moveFlags = 0;
        me->SendHeartBeat();*/

        me->CastSpell(target, spellId, false);
        return;
    }
    // OUT OF COMBAT REGEN
    if (!me->IsInCombat() && me->GetPower(POWER_MANA) < 150)
    {
        if (!me->movespline->Finalized())
            me->StopMoving();
        me->CastSpell(target, AURA_REGEN_MANA, false);
        return;
    }
    // MOVEMENT AI
    float x, y, z = 0; // Where to go
    float r = 10;
    if (me->movespline->Finalized())
    {
        if (me->GetPositionX() < 1000.0f)
        {
            x = 1176;
            y = -4404;
        }
        else if (me->GetPositionX() + 10 < 1176.0f)
        {
            x = 1176;
            y = -4404;
        }
        else if (me->GetPositionX() + 10 < 1357.0f)
        {
            switch (urand(0, 2))
            {
                case 0:
                    x = 1357;
                    y = -4376;
                    break;
                case 1:
                    x = 1354;
                    y = -4412;
                    break;
                case 2:
                    x = 1346;
                    y = -4339;
                    break;
            }
        }
        else if (me->GetPositionX() + 10 < 1421.0f)
        {
            // Porte orgri
            x = 1427;
            y = -4362;
            z = 25.0f;
            r = 4;
        }
        else
        {
            switch (urand(0, 2))
            {
                case 0:
                    x = 1516;
                    y = -4410;
                    z = 17.0f;
                    r = 4;
                    break;
                case 1:
                    x = 1538;
                    y = -4347;
                    z = 18;
                    r = 3;
                    break;
                case 2:
                    x = 1617;
                    y = -4426;
                    z = 12;
                    r = 4;
                    break;
            }
        }
        if (!z)
        {
            z = me->GetPositionZ();
            me->UpdateGroundPositionZ(x, y, z);
        }
        r = 20;
        if (!me->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, r))
            return;
    }
    else
    {
        return;
        if (urand(0, 20) == 0) // random move
        {
            me->GetPosition(x, y, z);
            r = frand(0, 2);
            float angle = me->GetOrientation() + frand(-M_PI_F / 2, M_PI_F / 2);
            x += r * cos(angle);
            y += r * sin(angle);
            if (!me->GetMap()->GetWalkHitPosition(nullptr, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), x, y, z))
                return;
        }
        else
            return;
    }
    me->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING | MOVE_EXCLUDE_STEEP_SLOPES);
}

void PopulateAreaBotAI::BeforeAddToMap(Player* player)
{
    if (player->GetInstanceId() || player->GetTeam() != _team)
        return;
    if (player->GetMapId() != _map || !player->IsWithinDist3d(_x, _y, _z, _radius * 2))
    {
        float x = _x;
        float y = _y;
        float z = _z;
        Map* map = sMapMgr.CreateMap(_map, player);
        while (!map->GetWalkRandomPosition(nullptr, x, y, z, _radius));
        player->Relocate(x, y, z);
        player->SetLocationMapId(_map);
    }
}

void PopulateAreaBotAI::OnPlayerLogin()
{
    if (urand(0, 1))
        me->GetMotionMaster()->MoveConfused();
}

PlayerBotAI* CreatePlayerBotAI(std::string ainame)
{
    if (ainame == "MageOrgrimmarAttackerAI")
        return new MageOrgrimmarAttackerAI();
    if (ainame == "IronforgePopulationAI")
        return new PopulateAreaBotAI(0, -4928.5f, -946.6f, 501.6f, ALLIANCE, 100.0f);
    if (ainame == "StormwindPopulationAI")
        return new PopulateAreaBotAI(0, -8829.5f, 625.6f, 93.9f, ALLIANCE, 50.0f);
    if (ainame == "OrgrimmarPopulationAI")
        return new PopulateAreaBotAI(1, 1568, -4405.87f, 8.13f, HORDE, 150.0f);
    if (ainame == "PlayerBotFleeingAI")
        return new PlayerBotFleeingAI();
    return new PlayerBotAI();
}
