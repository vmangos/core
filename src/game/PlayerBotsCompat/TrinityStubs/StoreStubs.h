/*
 * PlayerBots Store Stubs - vMAngOS Compatibility
 * 
 * This file provides declarations for TrinityCore-specific data stores
 * that are referenced throughout the ModPlayerBots codebase.
 */

#ifndef _PLAYERBOT_STORE_STUBS_H
#define _PLAYERBOT_STORE_STUBS_H

#include "Common.h"

// Forward declarations for types used in stubs
class AreaTableEntry;
class TaxiNodesEntry;

// Trinity-style area store adapter backed by vanilla AreaEntry data.
AreaTableEntry const* PB_GetAreaEntry(uint32 areaId);

class PB_AreaTableStoreStub
{
public:
    PB_AreaTableStoreStub() {}
    AreaTableEntry const* LookupEntry(uint32 id) const;
};

// Stub for sTaxiNodesStore - vMAngOS uses ObjectMgr::GetTaxiNodeEntry instead.
TaxiNodesEntry const* PB_GetTaxiNodeEntry(uint32 nodeId);

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

#endif // _PLAYERBOT_STORE_STUBS_H
