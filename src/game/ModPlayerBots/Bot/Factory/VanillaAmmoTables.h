#ifndef _PLAYERBOT_VANILLAAMMOTABLES_H
#define _PLAYERBOT_VANILLAAMMOTABLES_H

#include <array>

#include "SharedDefines.h"

struct VanillaAmmoEntry
{
    uint32 minLevel;
    uint32 itemId;
};

namespace VanillaAmmoTables
{
inline constexpr std::array<VanillaAmmoEntry, 7> bulletTable = {{
    {60, 13377},  // Thorium Shells (+26.0 DPS)
    {55, 8069},   // Impact Shot (+22.0 DPS)
    {40, 8068},   // Accurate Slugs (+13.0 DPS)
    {40, 10513},  // Solid Shot (+7.5 DPS)
    {25, 4385},   // Heavy Shot (+3.5 DPS)
    {10, 2519},   // Light Shot (+2.0 DPS)
    {1, 2516},    // Rough Bullet (+1.0 DPS)
}};

inline constexpr std::array<VanillaAmmoEntry, 6> arrowTable = {{
    {60, 12654},  // Doomshot (+20.0 DPS)
    {55, 15996},  // Jagged Arrow (+22.0 DPS)
    {40, 8067},   // Feathered Arrow (+13.0 DPS)
    {25, 3030},   // Razor Arrow (+3.5 DPS)
    {10, 2515},   // Sharp Arrow (+2.0 DPS)
    {1, 2512},    // Rough Arrow (+1.0 DPS)
}};

inline constexpr std::array<VanillaAmmoEntry, 6> bulletBagTable = {{
    {60, 19349},  // Gnoll Skin Ammo Pouch (18 slots, 15%)
    {55, 14545},  // Ribbly's Bandolier (16 slots, 15%)
    {40, 19319},  // Thick Leather Ammo Pouch (16 slots, 13%)
    {25, 7371},   // Heavy Shot Pouch (14 slots, 11%)
    {10, 2663},   // Bandolier of the Night Watch (10 slots, 10%)
    {1, 2102},    // Small Shot Pouch (6 slots, 10%)
}};

inline constexpr std::array<VanillaAmmoEntry, 6> arrowBagTable = {{
    {60, 18703},  // Ancient Sinew Wrapped String (18 slots, 15%)
    {55, 14544},  // Harpy Hide Quiver (16 slots, 15%)
    {40, 11362},  // Quickdraw Quiver (16 slots, 13%)
    {30, 7372},   // Heavy Quiver (14 slots, 11%)
    {10, 2662},   // Quiver of the Night Watch (10 slots, 10%)
    {1, 2101},    // Small Quiver (6 slots, 10%)
}};

template <std::size_t N>
uint32 SelectItemIdForLevel(std::array<VanillaAmmoEntry, N> const& table, uint32 level)
{
    uint32 entry = table.back().itemId;
    for (VanillaAmmoEntry const& candidate : table)
    {
        if (level >= candidate.minLevel)
        {
            entry = candidate.itemId;
            break;
        }
    }

    return entry;
}

inline uint32 GetAmmoItemId(uint32 ammoSubClass, uint32 level)
{
    switch (ammoSubClass)
    {
        case ITEM_SUBCLASS_BULLET:
            return SelectItemIdForLevel(bulletTable, level);
        case ITEM_SUBCLASS_ARROW:
            return SelectItemIdForLevel(arrowTable, level);
        default:
            return 0;
    }
}

inline uint32 GetAmmoBagItemId(uint32 ammoSubClass, uint32 level)
{
    switch (ammoSubClass)
    {
        case ITEM_SUBCLASS_BULLET:
            return SelectItemIdForLevel(bulletBagTable, level);
        case ITEM_SUBCLASS_ARROW:
            return SelectItemIdForLevel(arrowBagTable, level);
        default:
            return 0;
    }
}
}

#endif
