/*
 * PlayerBots Store Stubs - vMaNGOS Compatibility
 * 
 * This file provides singleton/stub implementations for TrinityCore-specific
 * data stores that are referenced throughout the ModPlayerBots codebase.
 * Using extern declarations in Preinclude.h with implementations in a separate
 * .cpp file avoids ODR (One Definition Rule) violations.
 * 
 * TODO: These are temporary stubs to get a clean build. Proper implementations
 *       should be created that actually query vMAngOS data structures
 *       for area/taxi node lookups. Currently returns empty entries
 *       or delegates to ObjectMgr where possible.
 */

#include "Policies/SingletonImp.h"

#include <array>
#include <memory>
#include <mutex>
#include <unordered_map>

#include "Common.h"
#include "ObjectMgr.h"
#include "DBCStores.h"
#include "Map.h"
#include "SharedDefines.h"

// Include forward declarations from StoreStubs.h
#include "TrinityStubs/StoreStubs.h"

// ============================================================================
// AreaTable Store Stub - TrinityCore compatibility
// ============================================================================
namespace
{
struct CachedAreaEntry
{
    AreaTableEntry entry = {};
    std::array<std::string, MAX_LOCALE> names = {};

    explicit CachedAreaEntry(AreaEntry const& area)
    {
        memset(&entry, 0, sizeof(entry));
        entry.ID = area.Id;
        entry.map_id = area.MapId;
        entry.zone = area.ZoneId;
        entry.explore_flag = area.ExploreFlag;
        entry.flags = area.Flags;
        entry.area_level = area.AreaLevel;
        entry.area_team = area.Team;

        names[LOCALE_enUS] = area.Name ? area.Name : "";
        entry.area_name[LOCALE_enUS] = names[LOCALE_enUS].empty() ? nullptr : &names[LOCALE_enUS][0];

        for (int32 dbLocale = 0; dbLocale < MAX_DBC_LOCALE; ++dbLocale)
        {
            LocaleConstant locale = GetDbcLocaleFromDbLocale(DBLocaleConstant(dbLocale));
            if (locale == LOCALE_enUS)
                continue;

            sObjectMgr.GetAreaLocaleString(area.Id, dbLocale, &names[locale]);
            entry.area_name[locale] = names[locale].empty() ? nullptr : &names[locale][0];
        }
    }
};

using AreaEntryCache = std::unordered_map<uint32, std::unique_ptr<CachedAreaEntry> >;

AreaEntryCache& GetAreaEntryCache()
{
    static AreaEntryCache cache;
    return cache;
}

std::mutex& GetAreaEntryCacheLock()
{
    static std::mutex lock;
    return lock;
}
}

AreaTableEntry const* PB_GetAreaEntry(uint32 areaId)
{
    AreaEntry const* area = AreaEntry::GetById(areaId);
    if (!area)
        return nullptr;

    std::lock_guard<std::mutex> guard(GetAreaEntryCacheLock());
    AreaEntryCache& cache = GetAreaEntryCache();
    AreaEntryCache::iterator itr = cache.find(areaId);
    if (itr == cache.end())
        itr = cache.insert(std::make_pair(areaId, std::unique_ptr<CachedAreaEntry>(new CachedAreaEntry(*area)))).first;

    return &itr->second->entry;
}

AreaTableEntry const* PB_AreaTableStoreStub::LookupEntry(uint32 id) const
{
    return PB_GetAreaEntry(id);
}

// Define singleton instance
PB_AreaTableStoreStub sAreaTableStore;

// ============================================================================
// TaxiNodes Store Stub - TrinityCore compatibility
// ============================================================================
// vMaNGOS uses ObjectMgr::GetTaxiNodeEntry instead of sTaxiNodesStore
// Provide a stub that delegates to ObjectMgr

TaxiNodesEntry const* PB_GetTaxiNodeEntry(uint32 nodeId)
{
    return sObjectMgr.GetTaxiNodeEntry(nodeId);
}

TaxiNodesEntry const* PB_TaxiNodesStoreStub::LookupEntry(uint32 id) const
{
    return PB_GetTaxiNodeEntry(id);
}

TaxiNodesEntry const* PB_TaxiNodesStoreStub::GetTaxiNodeEntry(uint32 id) const
{
    return PB_GetTaxiNodeEntry(id);
}

uint32 PB_TaxiNodesStoreStub::GetNumRows() const
{
    return sObjectMgr.GetMaxTaxiNodeId();
}

// Define singleton instance
PB_TaxiNodesStoreStub sTaxiNodesStore;
