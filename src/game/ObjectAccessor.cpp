/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Policies/SingletonImp.h"
#include "Player.h"
#include "WorldPacket.h"
#include "Item.h"
#include "Corpse.h"
#include "GridNotifiers.h"
#include "MapManager.h"
#include "Map.h"
#include "CellImpl.h"
#include "GridNotifiersImpl.h"
#include "ObjectGuid.h"
#include "World.h"

#include <cmath>

typedef MaNGOS::ClassLevelLockable<ObjectAccessor, ACE_Thread_Mutex> ObjectAccessorLock;
INSTANTIATE_SINGLETON_2(ObjectAccessor, ObjectAccessorLock);
INSTANTIATE_CLASS_MUTEX(ObjectAccessor, ACE_Thread_Mutex);

ObjectAccessor::ObjectAccessor() {}
ObjectAccessor::~ObjectAccessor()
{
    for (Player2CorpsesMapType::const_iterator itr = i_player2corpse.begin(); itr != i_player2corpse.end(); ++itr)
    {
        if (itr->first.IsCorpse())
            continue;
        itr->second->RemoveFromWorld();
        delete itr->second;
    }
}

Unit*
ObjectAccessor::GetUnit(WorldObject const &u, ObjectGuid guid)
{
    if (!guid)
        return NULL;

    if (guid.IsPlayer())
        return FindPlayer(guid);

    if (!u.IsInWorld())
        return NULL;

    return u.GetMap()->GetAnyTypeCreature(guid);
}

Corpse* ObjectAccessor::GetCorpseInMap(ObjectGuid guid, uint32 mapid)
{
    Corpse * ret = HashMapHolder<Corpse>::Find(guid);
    if (!ret)
        return NULL;
    if (ret->GetMapId() != mapid)
        return NULL;

    return ret;
}

Player* ObjectAccessor::FindPlayerNotInWorld(ObjectGuid guid)
{
    if (!guid)
        return nullptr;
    return HashMapHolder<Player>::Find(guid);
}

Player* ObjectAccessor::FindPlayer(ObjectGuid guid)
{
    Player * plr = FindPlayerNotInWorld(guid);
    if (!plr || !plr->IsInWorld())
        return nullptr;

    return plr;
}

Player* ObjectAccessor::FindPlayerByNameNotInWorld(const char *name)
{
    std::string cppname(name);
    if (!normalizePlayerName(cppname))
        return nullptr;

    NameToPlayerPtr::iterator it = playerNameToPlayerPointer.find(cppname);
    if (it != playerNameToPlayerPointer.end())
        return it->second;

    return NULL;
}

Player* ObjectAccessor::FindPlayerByName(const char *name)
{
    Player* player = FindPlayerByNameNotInWorld(name);
    if (!player || !player->IsInWorld())
        return nullptr;
    return player;
}

MasterPlayer* ObjectAccessor::FindMasterPlayer(const char *name)
{
    std::string cppname(name);
    if (!normalizePlayerName(cppname))
        return nullptr;

    NameToMasterPlayerPtr::iterator it = playerNameToMasterPlayerPointer.find(cppname);
    if (it != playerNameToMasterPlayerPointer.end())
        return it->second;

    return NULL;
}

MasterPlayer* ObjectAccessor::FindMasterPlayer(ObjectGuid guid)
{
    if (!guid)
        return NULL;

    return HashMapHolder<MasterPlayer>::Find(guid);;
}


PlayerPointer ObjectAccessor::FindPlayerPointer(ObjectGuid guid)
{
    Player* player = FindPlayerNotInWorld(guid);
    if (player)
        return PlayerPointer(new PlayerWrapper<Player>(player));
    MasterPlayer* mplr = FindMasterPlayer(guid);
    if (mplr)
        return PlayerPointer(new PlayerWrapper<MasterPlayer>(mplr));
    return PlayerPointer(NULL);
}

PlayerPointer ObjectAccessor::FindPlayerPointer(const char* name)
{
    Player* player = FindPlayerByNameNotInWorld(name);
    if (player)
        return PlayerPointer(new PlayerWrapper<Player>(player));
    MasterPlayer* mplr = FindMasterPlayer(name);
    if (mplr)
        return PlayerPointer(new PlayerWrapper<MasterPlayer>(mplr));
    return PlayerPointer(NULL);
}

void
ObjectAccessor::SaveAllPlayers()
{
    HashMapHolder<Player>::ReadGuard g(HashMapHolder<Player>::GetLock());
    HashMapHolder<Player>::MapType& m = sObjectAccessor.GetPlayers();
    for (HashMapHolder<Player>::MapType::iterator itr = m.begin(); itr != m.end(); ++itr)
        itr->second->SaveToDB();
}

void ObjectAccessor::KickPlayer(ObjectGuid guid)
{
    if (Player* p = HashMapHolder<Player>::Find(guid))
    {
        WorldSession* s = p->GetSession();
        s->KickPlayer();                            // mark session to remove at next session list update
        s->LogoutPlayer(false);                     // logout player without waiting next session list update
    }
}

Corpse*
ObjectAccessor::GetCorpseForPlayerGUID(ObjectGuid guid)
{
    ASSERT(guid.IsPlayer());

    Guard guard(i_corpseGuard);

    Player2CorpsesMapType::iterator iter = i_player2corpse.find(guid);
    if (iter == i_player2corpse.end())
        return NULL;

    MANGOS_ASSERT(iter->second->GetType() != CORPSE_BONES);

    return iter->second;
}

void
ObjectAccessor::RemoveCorpse(Corpse *corpse)
{
    MANGOS_ASSERT(corpse && corpse->GetType() != CORPSE_BONES);

    Guard guard(i_corpseGuard);
    Player2CorpsesMapType::iterator iter = i_player2corpse.find(corpse->GetOwnerGuid());
    if (iter == i_player2corpse.end())
        return;

    // build mapid*cellid -> guid_set map
    CellPair cell_pair = MaNGOS::ComputeCellPair(corpse->GetPositionX(), corpse->GetPositionY());
    uint32 cell_id = (cell_pair.y_coord * TOTAL_NUMBER_OF_CELLS_PER_MAP) + cell_pair.x_coord;

    sObjectMgr.DeleteCorpseCellData(corpse->GetMapId(), cell_id, corpse->GetOwnerGuid().GetCounter());
    corpse->RemoveFromWorld();

    i_player2corpse.erase(iter);
}

void
ObjectAccessor::AddCorpse(Corpse *corpse)
{
    MANGOS_ASSERT(corpse && corpse->GetType() != CORPSE_BONES);

    Guard guard(i_corpseGuard);
    MANGOS_ASSERT(i_player2corpse.find(corpse->GetOwnerGuid()) == i_player2corpse.end());
    i_player2corpse[corpse->GetOwnerGuid()] = corpse;

    // build mapid*cellid -> guid_set map
    CellPair cell_pair = MaNGOS::ComputeCellPair(corpse->GetPositionX(), corpse->GetPositionY());
    uint32 cell_id = (cell_pair.y_coord * TOTAL_NUMBER_OF_CELLS_PER_MAP) + cell_pair.x_coord;

    sObjectMgr.AddCorpseCellData(corpse->GetMapId(), cell_id, corpse->GetOwnerGuid().GetCounter(), corpse->GetInstanceId());
}

void
ObjectAccessor::AddCorpsesToGrid(GridPair const& gridpair, GridType& grid, Map* map)
{
    Guard guard(i_corpseGuard);
    for (Player2CorpsesMapType::iterator iter = i_player2corpse.begin(); iter != i_player2corpse.end(); ++iter)
    {
        if (!iter->first.IsPlayer())
            continue;

        if (iter->second->GetGrid() == gridpair)
        {
            // verify, if the corpse in our instance (add only corpses which are)
            if (map->Instanceable())
            {
                if (iter->second->GetInstanceId() == map->GetInstanceId())
                    grid.AddWorldObject(iter->second);
            }
            else
                grid.AddWorldObject(iter->second);
        }
    }
}

void ObjectAccessor::ConvertCorpseForPlayer(ObjectGuid player_guid, Player* looter)
{
    ASSERT(player_guid.IsPlayer());

    Corpse *corpse = GetCorpseForPlayerGUID(player_guid);
    if (!corpse)
        return;

    // remove corpse from player_guid -> corpse map
    RemoveCorpse(corpse);

    // remove resurrectable corpse from grid object registry (loaded state checked into call)
    // do not load the map if it's not loaded
    Map *map = sMapMgr.FindMap(corpse->GetMapId(), corpse->GetInstanceId());

    // If the corpse is not in the same map as the player, then we cannot safely remove
    // the corpse now. Instead, add it to a list in the map for delayed processing.
    // This is because the map the corpse belongs to may be peforming grid operations
    // such as visibility updates and removing it here will destroy the grid ref,
    // causing a crash.
    if (map)
    {
        map->AddCorpseToRemove(corpse, looter ? looter->GetObjectGuid() : ObjectGuid());
    }
    else
    {
        // all references to the corpse should be removed at this point if it is
        // not being deleted in the map itself
        // remove corpse from DB
        corpse->DeleteFromDB();

        delete corpse;
    }
}

void ObjectAccessor::RemoveOldCorpses()
{
    time_t now = time(NULL);
    Player2CorpsesMapType::iterator next;
    for (Player2CorpsesMapType::iterator itr = i_player2corpse.begin(); itr != i_player2corpse.end(); itr = next)
    {
        next = itr;
        ++next;

        if (!itr->second->IsExpired(now))
            continue;
        ConvertCorpseForPlayer(itr->first);
    }
}

ObjectAccessor::NameToPlayerPtr ObjectAccessor::playerNameToPlayerPointer;
ObjectAccessor::NameToMasterPlayerPtr ObjectAccessor::playerNameToMasterPlayerPointer;

void ObjectAccessor::AddObject(Player *player)
{
    HashMapHolder<Player>::Insert(player);
    playerNameToPlayerPointer[player->GetName()] = player;
}
void ObjectAccessor::RemoveObject(Player *player)
{
    HashMapHolder<Player>::Remove(player);
    playerNameToPlayerPointer.erase(player->GetName());
}
void ObjectAccessor::AddObject(MasterPlayer *player)
{
    HashMapHolder<MasterPlayer>::Insert(player);
    playerNameToMasterPlayerPointer[player->GetName()] = player;
}
void ObjectAccessor::RemoveObject(MasterPlayer *player)
{
    HashMapHolder<MasterPlayer>::Remove(player);
    playerNameToMasterPlayerPointer.erase(player->GetName());
}
/// Define the static member of HashMapHolder

template <class T> typename HashMapHolder<T>::MapType HashMapHolder<T>::m_objectMap;
template <class T> ACE_RW_Thread_Mutex HashMapHolder<T>::i_lock;

/// Global definitions for the hashmap storage

template class HashMapHolder<Player>;
template class HashMapHolder<Corpse>;
template class HashMapHolder<Transport>;
template class HashMapHolder<MasterPlayer>;
