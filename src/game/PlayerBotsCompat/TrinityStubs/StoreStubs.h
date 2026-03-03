/*
 * PlayerBots Store Stubs - vMAngOS Compatibility
 * 
 * This file provides declarations for TrinityCore-specific data stores
 * that are referenced throughout the ModPlayerBots codebase.
 */

#ifndef _PLAYERBOT_STORE_STUBS_H
#define _PLAYERBOT_STORE_STUBS_H

// Forward declarations for types used in stubs
class AreaTableEntry;
class TaxiNodesEntry;

// Stub for sAreaTableStore (Trinity-specific) - Vanilla doesn't have this
// Provide a stub that returns empty entries to avoid crashes
inline AreaTableEntry const* PB_GetAreaEntry(uint32 areaId);

class PB_AreaTableStoreStub
{
public:
    PB_AreaTableStoreStub() {}
    AreaTableEntry const* LookupEntry(uint32 id) const;
};

// Stub for sTaxiNodesStore - vMAngOS uses ObjectMgr::GetTaxiNodeEntry instead
// Provide a stub that delegates to ObjectMgr
inline TaxiNodesEntry const* PB_GetTaxiNodeEntry(uint32 nodeId);

class PB_TaxiNodesStoreStub
{
public:
    PB_TaxiNodesStoreStub() {}
    TaxiNodesEntry const* LookupEntry(uint32 id) const;
    TaxiNodesEntry const* GetTaxiNodeEntry(uint32 id) const;
    uint32 GetNumRows() const;
};

// External instances defined in StoreStubs.cpp
extern PB_AreaTableStoreStub sAreaTableStore;
extern PB_TaxiNodesStoreStub sTaxiNodesStore;

// TODO: These are temporary stubs to get a clean build. Proper implementations
//       should be created that actually query vMAngOS data structures
//       for area/taxi node lookups. Currently returns empty entries
//       or delegates to ObjectMgr where possible.

#endif // _PLAYERBOT_STORE_STUBS_H
