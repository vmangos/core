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
#include "../Common.h"
#include "ObjectMgr.h"
#include "DBCStores.h"
#include "SharedDefines.h"

// Include forward declarations from StoreStubs.h
#include "TrinityStubs/StoreStubs.h"

// ============================================================================
// AreaTable Store Stub - TrinityCore compatibility
// ============================================================================
// TODO: Vanilla vMaNGOS doesn't have sAreaTableStore - TrinityCore does
//       Implement proper area lookup by querying vMaNGOS terrain/map data structures.
//       Currently returns empty entry to avoid crashes.

AreaTableEntry const* PB_GetAreaEntry(uint32 areaId)
{
    static AreaTableEntry emptyEntry;
    memset(&emptyEntry, 0, sizeof(AreaTableEntry));
    return &emptyEntry;
}

PB_AreaTableStoreStub::PB_AreaTableStoreStub()
{
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

PB_TaxiNodesStoreStub::PB_TaxiNodesStoreStub()
{
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
