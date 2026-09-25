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

#include "TestMapUtils.h"
#include "GridDefines.h"
#include "Log.h"
#include "Map.h"
#include "MapManager.h"
#include "MoveMap.h"
#include "SQLStorages.h"
#include "VMapFactory.h"
#include "World.h"

namespace TestMapUtils
{
    void LoadMapTiles(uint32 mapId, float x, float y)
    {
        int gx = (int)(32 - x / SIZE_OF_GRIDS);
        int gy = (int)(32 - y / SIZE_OF_GRIDS);
        VMAP::VMapFactory::createOrGetVMapManager()->loadMap((sWorld.GetDataPath() + "vmaps").c_str(), mapId, gx, gy);
        MMAP::MMapFactory::createOrGetMMapManager()->loadMap(mapId, gx, gy);
    }

    Map* GetOrCreateTestMap(uint32 mapId, float posX, float posY)
    {
        MapEntry const* entry = sMapStorage.LookupEntry<MapEntry>(mapId);
        if (!entry)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "TestMapUtils: Invalid map ID %u", mapId);
            return nullptr;
        }

        if (entry->Instanceable())
        {
            // For instances we spin up a dedicated test map
            return sMapMgr.CreateTestMap(mapId, true, posX, posY);
        }

        // For continents only use a map that is already loaded (returns nullptr -> caller skips)
        return sMapMgr.FindMap(mapId, 0);
    }
}
