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

#include "UpdateFields.h"
#include "Log.h"
#include "ObjectGuid.h"
#include <array>

#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
#include "UpdateFields_1_12_1.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_11_2
#include "UpdateFields_1_11_2.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_10_2
#include "UpdateFields_1_10_2.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_9_4
#include "UpdateFields_1_9_4.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_8_4
#include "UpdateFields_1_8_4.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_7_1
#include "UpdateFields_1_7_1.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
#include "UpdateFields_1_6_1.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_5_1
#include "UpdateFields_1_5_1.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_4_2
#include "UpdateFields_1_4_2.cpp"
#elif SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_3_1
#include "UpdateFields_1_3_1.cpp"
#else
#include "UpdateFields_1_2_4.cpp"
#endif

template<std::size_t SIZE>
static std::array<uint16, SIZE> SetupUpdateFieldFlagsArray(uint8 objectTypeMask)
{
    std::array<uint16, SIZE> flagsArray;
    flagsArray.fill(0);
    for (auto const& itr : g_updateFieldsData)
    {
        if ((itr.objectTypeMask & objectTypeMask) == 0)
            continue;

        for (uint16 i = itr.offset; i < itr.offset + itr.size; i++)
        {
            flagsArray.at(i) = itr.flags;
        }
    }
    return flagsArray;
}

template<std::size_t SIZE>
static std::array<bool, SIZE> SetupGuidFieldStartArray(uint8 objectTypeMask)
{
    std::array<bool, SIZE> guidStartArray;
    guidStartArray.fill(false);
    for (auto const& itr : g_updateFieldsData)
    {
        if ((itr.objectTypeMask & objectTypeMask) == 0)
            continue;

        if (itr.valueType != UF_TYPE_GUID)
            continue;

        // Guid fields and guid arrays are consecutive uint32 pairs.
        for (uint16 i = itr.offset; i + 1 < itr.offset + itr.size; i += 2)
        {
            guidStartArray.at(i) = true;
        }
    }
    return guidStartArray;
}

static std::array<uint16, CONTAINER_END> const g_containerUpdateFieldFlags = SetupUpdateFieldFlagsArray<CONTAINER_END>(TYPEMASK_OBJECT | TYPEMASK_ITEM | TYPEMASK_CONTAINER);
static std::array<uint16, PLAYER_END> const g_playerUpdateFieldFlags = SetupUpdateFieldFlagsArray<PLAYER_END>(TYPEMASK_OBJECT | TYPEMASK_UNIT | TYPEMASK_PLAYER);
static std::array<uint16, GAMEOBJECT_END> const g_gameObjectUpdateFieldFlags = SetupUpdateFieldFlagsArray<GAMEOBJECT_END>(TYPEMASK_OBJECT | TYPEMASK_GAMEOBJECT);
static std::array<uint16, DYNAMICOBJECT_END> const g_dynamicObjectUpdateFieldFlags = SetupUpdateFieldFlagsArray<DYNAMICOBJECT_END>(TYPEMASK_OBJECT | TYPEMASK_DYNAMICOBJECT);
static std::array<uint16, CORPSE_END> const g_corpseUpdateFieldFlags = SetupUpdateFieldFlagsArray<CORPSE_END>(TYPEMASK_OBJECT | TYPEMASK_CORPSE);

static std::array<bool, CONTAINER_END> const g_containerGuidFieldStart = SetupGuidFieldStartArray<CONTAINER_END>(TYPEMASK_OBJECT | TYPEMASK_ITEM | TYPEMASK_CONTAINER);
static std::array<bool, PLAYER_END> const g_playerGuidFieldStart = SetupGuidFieldStartArray<PLAYER_END>(TYPEMASK_OBJECT | TYPEMASK_UNIT | TYPEMASK_PLAYER);
static std::array<bool, GAMEOBJECT_END> const g_gameObjectGuidFieldStart = SetupGuidFieldStartArray<GAMEOBJECT_END>(TYPEMASK_OBJECT | TYPEMASK_GAMEOBJECT);
static std::array<bool, DYNAMICOBJECT_END> const g_dynamicObjectGuidFieldStart = SetupGuidFieldStartArray<DYNAMICOBJECT_END>(TYPEMASK_OBJECT | TYPEMASK_DYNAMICOBJECT);
static std::array<bool, CORPSE_END> const g_corpseGuidFieldStart = SetupGuidFieldStartArray<CORPSE_END>(TYPEMASK_OBJECT | TYPEMASK_CORPSE);

uint16 const* UpdateFields::GetUpdateFieldFlagsArray(uint8 objectTypeId)
{
    switch (objectTypeId)
    {
        case TYPEID_ITEM:
        case TYPEID_CONTAINER:
        {
            return g_containerUpdateFieldFlags.data();
        }
        case TYPEID_UNIT:
        case TYPEID_PLAYER:
        {
            return g_playerUpdateFieldFlags.data();
        }
        case TYPEID_GAMEOBJECT:
        {
            return g_gameObjectUpdateFieldFlags.data();
        }
        case TYPEID_DYNAMICOBJECT:
        {
            return g_dynamicObjectUpdateFieldFlags.data();
        }
        case TYPEID_CORPSE:
        {
            return g_corpseUpdateFieldFlags.data();
        }
    }
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unhandled object type id (%hhu) in GetUpdateFieldFlagsArray!", objectTypeId);
    return 0;
}

bool const* UpdateFields::GetGuidFieldStartArray(uint8 objectTypeId)
{
    switch (objectTypeId)
    {
        case TYPEID_ITEM:
        case TYPEID_CONTAINER:
        {
            return g_containerGuidFieldStart.data();
        }
        case TYPEID_UNIT:
        case TYPEID_PLAYER:
        {
            return g_playerGuidFieldStart.data();
        }
        case TYPEID_GAMEOBJECT:
        {
            return g_gameObjectGuidFieldStart.data();
        }
        case TYPEID_DYNAMICOBJECT:
        {
            return g_dynamicObjectGuidFieldStart.data();
        }
        case TYPEID_CORPSE:
        {
            return g_corpseGuidFieldStart.data();
        }
    }
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unhandled object type id (%hhu) in GetGuidFieldStartArray!", objectTypeId);
    return nullptr;
}

UpdateFieldData const* UpdateFields::GetUpdateFieldDataByName(char const* name)
{
    for (const auto& itr : g_updateFieldsData)
    {
        if (strcmp(itr.name, name) == 0)
            return &itr;
    }
    return nullptr;
}

UpdateFieldData const* UpdateFields::GetUpdateFieldDataByTypeMaskAndOffset(uint8 objectTypeMask, uint16 offset)
{
    for (auto const& itr : g_updateFieldsData)
    {
        if ((itr.objectTypeMask & objectTypeMask) == 0)
            continue;

        if (offset == itr.offset || (offset > itr.offset && offset < (itr.offset + itr.size)))
            return &itr;
    }
    return nullptr;
}
