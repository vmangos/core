/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
 *
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

#ifndef _VMAPDEFINITIONS_H
#define _VMAPDEFINITIONS_H

#define LIQUID_TILE_SIZE (533.333f / 128.f)

namespace VMAP
{
    char const VMAP_MAGIC[] = "VMAP_7.0";                   // used in final vmap files
    char const RAW_VMAP_MAGIC[] = "VMAPs05";                // used in extracted vmap files with raw data
    char const GAMEOBJECT_MODELS[] = "temp_gameobject_models";

    // defined in TileAssembler.cpp currently...
    bool readChunk(FILE* rf, char* dest, char const* compare, uint32 len);
}

#ifndef NO_CORE_FUNCS
#include "Log.h"
#elif defined MMAP_GENERATOR
#include <cassert>
#define MANGOS_ASSERT(x) assert(x)
#define sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, ...) 0
#define sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, ...) 0
#define LOG_FILTER_MAP_LOADING true
#define DEBUG_FILTER_LOG(F,...) do{ if (F) sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, __VA_ARGS__); } while(0)
#else
#include <cassert>
#define MANGOS_ASSERT(x) assert(x)
#define sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, ...) do{ printf(__VA_ARGS__); printf("\n"); } while(0)
#define sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, ...) do{ printf(__VA_ARGS__); printf("\n"); } while(0)
#define LOG_FILTER_MAP_LOADING true
#define DEBUG_FILTER_LOG(F,...) do{ if (F) sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, __VA_ARGS__); } while(0)
#endif

#endif // _VMAPDEFINITIONS_H
