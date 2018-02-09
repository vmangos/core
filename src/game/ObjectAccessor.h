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

#ifndef MANGOS_OBJECTACCESSOR_H
#define MANGOS_OBJECTACCESSOR_H

#include "Common.h"
#include "Platform/Define.h"
#include "Policies/Singleton.h"
#include <ace/Thread_Mutex.h>
#include <ace/RW_Thread_Mutex.h>
#include "Utilities/UnorderedMapSet.h"
#include "Policies/ThreadingModel.h"

#include "UpdateData.h"

#include "GridDefines.h"
#include "Object.h"
#include "Player.h"
#include "Corpse.h"
#include "Transport.h"
#include "MapNodes/MasterPlayer.h"
#include "MapNodes/AbstractPlayer.h"

#include <set>
#include <list>

class Unit;
class WorldObject;
class Map;

template <class T>
class HashMapHolder
{
    public:

        typedef UNORDERED_MAP<ObjectGuid, T*>   MapType;
        typedef ACE_RW_Thread_Mutex LockType;
        typedef ACE_Read_Guard<LockType> ReadGuard;
        typedef ACE_Write_Guard<LockType> WriteGuard;

        static void Insert(T* o)
        {
            WriteGuard guard(i_lock);
            m_objectMap[o->GetObjectGuid()] = o;
        }

        static void Remove(T* o)
        {
            WriteGuard guard(i_lock);
            m_objectMap.erase(o->GetObjectGuid());
        }

        static T* Find(ObjectGuid guid)
        {
            ReadGuard guard(i_lock);
            typename MapType::iterator itr = m_objectMap.find(guid);
            return (itr != m_objectMap.end()) ? itr->second : NULL;
        }

        static MapType& GetContainer() { return m_objectMap; }

        static LockType& GetLock() { return i_lock; }

    private:

        //Non instanceable only static
        HashMapHolder() {}

        static LockType i_lock;
        static MapType  m_objectMap;
};

class MANGOS_DLL_DECL ObjectAccessor : public MaNGOS::Singleton<ObjectAccessor, MaNGOS::ClassLevelLockable<ObjectAccessor, ACE_Thread_Mutex> >
{
    friend class MaNGOS::OperatorNew<ObjectAccessor>;

    ObjectAccessor();
    ~ObjectAccessor();
    ObjectAccessor(const ObjectAccessor &);
    ObjectAccessor& operator=(const ObjectAccessor &);

    public:
        typedef UNORDERED_MAP<ObjectGuid, Corpse*> Player2CorpsesMapType;

        // Search player at any map in world and other objects at same map with `obj`
        // Note: recommended use Map::GetUnit version if player also expected at same map only
        static Unit* GetUnit(WorldObject const& obj, ObjectGuid guid);

        // Player access
        static Player* FindPlayer(ObjectGuid guid);         // if need player at specific map better use Map::GetPlayer
        static Player* FindPlayerNotInWorld(ObjectGuid guid);
        static Player* FindPlayerByName(const char *name);
        static Player* FindPlayerByNameNotInWorld(const char *name);

        static MasterPlayer* FindMasterPlayer(ObjectGuid guid);
        static MasterPlayer* FindMasterPlayer(const char* name);

        /**
         * @brief These functions will attempt to return a Player* if available.
         * Else they will try to return a MasterPlayer*.
         * Otherwise, they return NULL
         * @param guid
         * @return IPlayerPointer
         */
        static PlayerPointer FindPlayerPointer(ObjectGuid guid);
        static PlayerPointer FindPlayerPointer(const char* name);

        static void KickPlayer(ObjectGuid guid);

        HashMapHolder<Player>::MapType& GetPlayers()
        {
            return HashMapHolder<Player>::GetContainer();
        }

        HashMapHolder<MasterPlayer>::MapType& GetMasterPlayers()
        {
            return HashMapHolder<MasterPlayer>::GetContainer();
        }

        void SaveAllPlayers();

        // Corpse access
        Corpse* GetCorpseForPlayerGUID(ObjectGuid guid);
        static Corpse* GetCorpseInMap(ObjectGuid guid, uint32 mapid);
        void RemoveCorpse(Corpse *corpse);
        void AddCorpse(Corpse* corpse);
        void AddCorpsesToGrid(GridPair const& gridpair,GridType& grid,Map* map);
        void ConvertCorpseForPlayer(ObjectGuid player_guid, Player* looter = nullptr);
        void RemoveOldCorpses();

        // For call from Player/Corpse AddToWorld/RemoveFromWorld only
        void AddObject(Corpse *object) { HashMapHolder<Corpse>::Insert(object); }
        void AddObject(Player *object);
        void AddObject(Transport* object) { HashMapHolder<Transport>::Insert(object); }
        void AddObject(MasterPlayer* object);
        void RemoveObject(Corpse *object) { HashMapHolder<Corpse>::Remove(object); }
        void RemoveObject(Player *object);
        void RemoveObject(Transport* object) { HashMapHolder<Transport>::Remove(object); }
        void RemoveObject(MasterPlayer *object);

    private:
        Player2CorpsesMapType   i_player2corpse;

        typedef ACE_Thread_Mutex LockType;
        typedef MaNGOS::GeneralLock<LockType > Guard;

        LockType i_playerGuard;
        LockType i_corpseGuard;

        typedef std::map<std::string, Player*> NameToPlayerPtr;
        typedef std::map<std::string, MasterPlayer*> NameToMasterPlayerPtr;
        static NameToPlayerPtr playerNameToPlayerPointer;
        static NameToMasterPlayerPtr playerNameToMasterPlayerPointer;
};

#define sObjectAccessor ObjectAccessor::Instance()

#endif
