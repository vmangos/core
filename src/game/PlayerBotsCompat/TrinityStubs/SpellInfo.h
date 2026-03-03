#pragma once

#ifndef PB_SPELL_INFO_H
#define PB_SPELL_INFO_H

// SpellInfo.h - Trinity compatibility shim for vMaNGOS
// Maps Trinity's SpellInfo to vMaNGOS's SpellEntry
//
// NOTE: The forward declaration of SpellInfo may conflict if included before this file.
// This header provides the type alias SpellInfo -> SpellEntry.
// Code should prefer using SpellEntry directly where possible.

#include "SpellMgr.h"

// Only define the type alias if SpellInfo is not already declared as a class
// ChatHelper.h has a forward declaration: class SpellInfo;
#if !defined(SPELLINFO_DECLARED_AS_CLASS)
using SpellInfo = SpellEntry;
#endif

// SpellInfo Effects mapping - Trinity uses Effects[] array with struct
// vMaNGOS uses Effect[] and EffectTriggerSpell[] fields directly
//
// In Trinity: spellInfo->Effects[i].Effect, spellInfo->Effects[i].TriggerSpell
// In vMaNGOS: spellInfo->Effect[i], spellInfo->EffectTriggerSpell[i]
//
// To maintain compatibility, we define a wrapper for Effects access
// Note: This is a temporary compatibility shim - code should be migrated to use vMaNGOS SpellEntry fields directly

struct PB_SpellEffectInfo {
    uint32 Effect;
    uint32 TriggerSpell;
    
    PB_SpellEffectInfo(uint32 effect, uint32 triggerSpell) 
        : Effect(effect), TriggerSpell(triggerSpell) {}
};

// For spellInfo->Effects[i] compatibility, we'll provide a wrapper
// Note: This is a temporary compatibility shim - code should be migrated to use vMaNGOS SpellEntry fields directly
inline PB_SpellEffectInfo PB_GetSpellEffect(const SpellEntry* spell, uint8 i) {
    if (i >= MAX_SPELL_EFFECTS || !spell)
        return PB_SpellEffectInfo(0, 0);
    return PB_SpellEffectInfo(spell->Effect[i], spell->EffectTriggerSpell[i]);
}

#endif // PB_SPELL_INFO_H

