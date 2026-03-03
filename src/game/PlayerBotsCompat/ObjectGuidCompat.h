#pragma once

// Extend vMaNGOS ObjectGuid with Trinity-compatible LowType
#include "ObjectGuid.h"

// Since vMaNGOS ObjectGuid doesn't have LowType, we can't add it directly
// Instead, we provide a global typedef that can be used
namespace ObjectGuidCompat {
    typedef uint32 LowType;
}

// For code that expects ObjectGuid::LowType, we can't directly add it
// because we can't modify the vMaNGOS ObjectGuid class
// Usage: replace ObjectGuid::LowType with uint32 or ObjectGuidCompat::LowType
