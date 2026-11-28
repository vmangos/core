/*
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

#pragma once

#include "Platform/Define.h"

class Map;

// Shared helpers for tests that need geometry data (pathfinding, line of sight, ...).
namespace TestMapUtils
{
    // Loads the vmap + mmap tiles for the grid containing (x, y) on the given map.
    void LoadMapTiles(uint32 mapId, float x, float y);

    // Returns a map suitable for tests: a fresh test map for instanceable maps, or the
    // already-loaded base map (instance 0) for continents. Returns nullptr for a continent
    // that is not loaded yet (no players on it) - the caller should skip the case then.
    Map* GetOrCreateTestMap(uint32 mapId, float posX, float posY);
}
