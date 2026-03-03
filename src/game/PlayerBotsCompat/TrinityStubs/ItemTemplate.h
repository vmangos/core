#pragma once

#ifndef PB_ITEM_TEMPLATE_H
#define PB_ITEM_TEMPLATE_H

// ItemTemplate.h - Trinity compatibility shim for vMaNGOS
// Maps Trinity's ItemTemplate to vMaNGOS's ItemPrototype
//
// NOTE: This header only provides the type alias. Method name mappings
// (GetTemplate -> GetProto) are handled by macros in Preinclude.h.

#include "ItemPrototype.h"

namespace PB {
    // Type alias for Trinity compatibility
    using ItemTemplate = ItemPrototype;
}

// Global namespace alias for direct usage
using ItemTemplate = ItemPrototype;

#endif // PB_ITEM_TEMPLATE_H
