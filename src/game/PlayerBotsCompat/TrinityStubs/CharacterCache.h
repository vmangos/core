#pragma once

#include "ObjectMgr.h"

class CharacterCache
{
public:
    uint32 GetCharacterAccountIdByGuid(ObjectGuid guid) const
    {
        return sObjectMgr.GetPlayerAccountIdByGUID(guid);
    }

    bool GetCharacterNameByGuid(ObjectGuid guid, std::string& name) const
    {
        return sObjectMgr.GetPlayerNameByGUID(guid, name);
    }

    ObjectGuid GetCharacterGuidByName(std::string const& name) const
    {
        return sObjectMgr.GetPlayerGuidByName(name);
    }

    uint32 GetCharacterGuildIdByGuid(ObjectGuid guid) const
    {
        return Player::GetGuildIdFromDB(guid);
    }
};

static CharacterCache sCharacterCache_instance;
#define sCharacterCache (&sCharacterCache_instance)
