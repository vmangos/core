/*
 * Copyright (C) 2017 Elysium Project <https://github.com/elysium-project>
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

#ifndef AURA_REMOVAL_MGR
#define AURA_REMOVAL_MGR

#include "Common.h"
#include "Policies/Singleton.h"
#include "SpellAuras.h"
#include "Timer.h"
#include <atomic>

enum AuraRemovalFlags
{
    AURA_REM_FLAG_EXCLUDE_HORDE     = 1,
    AURA_REM_FLAG_EXCLUDE_ALLIANCE  = 2,
};

struct AuraRemovalEntry
{
    uint32 auraEntry;
    uint32 flags;
};

#define AURA_REMOVAL_INTERVAL 60000
#define AURA_HOLDER_COUNT_SOFT_LIMIT 990000
#define AURA_HOLDER_COUNT_HARD_LIMIT 1000000

struct AuraReference
{
    SpellAuraHolder* aura = nullptr;
    std::atomic_int_fast8_t references{ 0 };
};

typedef std::array<AuraReference, AURA_HOLDER_COUNT_HARD_LIMIT> AuraReferenceArray;

class Player;
struct AuraPointer;

// Handles removal of auras from players on map changes, based on
// definitions in world-db table instance_buff_removal
class AuraRemovalManager
{
    friend struct AuraPointer;
public:
    AuraRemovalManager() {}
    
    // Deletion of unused aura holders
public:
    AuraReferenceArray const& GetAuraReferencesArray() { return m_auras; }
    uint32 GetTotalCreatedAurasCount() { return m_counter; }
    void Update(uint32 diff);
private:
    // incremented every time a new aura pointer is created
    // gets reset to 0 if soft limit is reached to prevent crash
    std::atomic<uint32> m_counter{ 0 };

    // highest the counter has ever reached
    // no need to check for unused auras above this (on update)
    uint32 m_maxCount{ 0 };

    // stores pointers to aura holders and number of references
    // unreferenced auras are deleted on update
    AuraReferenceArray m_auras;
    ShortTimeTracker m_timer{ AURA_REMOVAL_INTERVAL };

    // Instance Buff Removal
public:                                                 // Accessors
    void LoadFromDB();
    void PlayerEnterMap(uint32 mapId, Player* pPlayer);
private:
    // <map ID, aura ID>
    std::map<uint32, std::vector<AuraRemovalEntry>> m_data;
};

#define sAuraRemovalMgr MaNGOS::Singleton<AuraRemovalManager>::Instance()

struct AuraPointer
{
    SpellAuraHolder* aura;
    AuraPointer() : aura(nullptr)
    {
    }

    // Create pointer to newly created aura holder,
    // that has no other reference counted pointers.
    AuraPointer(SpellAuraHolder* ptr) : aura(ptr)
    {
        MANGOS_ASSERT(!ptr->m_globalId);
        do
        {
            ptr->m_globalId = sAuraRemovalMgr.m_counter++;
            MANGOS_ASSERT(ptr->m_globalId < AURA_HOLDER_COUNT_HARD_LIMIT);
        } while (sAuraRemovalMgr.m_auras[ptr->m_globalId].aura);

        sAuraRemovalMgr.m_auras[ptr->m_globalId].references = 1;
        sAuraRemovalMgr.m_auras[ptr->m_globalId].aura = aura;
    }

    // Move constructor.
    AuraPointer(AuraPointer&& other) : aura(other.aura)
    {
        other.aura = nullptr;
    }

    // Copy another reference counting pointer.
    // Just increase references.
    AuraPointer(AuraPointer const& other)
    {
        sAuraRemovalMgr.m_auras[other.aura->m_globalId].references++;
        aura = other.aura;
    }
    AuraPointer& operator=(AuraPointer const& other)
    {
        Clear();
        sAuraRemovalMgr.m_auras[other.aura->m_globalId].references++;
        aura = other.aura;
        return *this;
    }

    SpellAuraHolder* operator->() { return aura; }
    
    // Only allow creating pointer on stack.
    void* operator new(size_t size) = delete;

    // Remove reference on destruction.
    void Clear()
    {
        if (aura)
        {
            sAuraRemovalMgr.m_auras[aura->m_globalId].references--;
            aura = nullptr;
        }
    }
    ~AuraPointer()
    {
        Clear();
    }
};

#endif
