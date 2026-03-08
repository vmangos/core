#pragma once

#include "ObjectMgr.h"

class CharacterCache
{
public:
    uint32 GetCharacterAccountIdByGuid(ObjectGuid guid) const
    {
        uint32 accountId = sObjectMgr.GetPlayerAccountIdByGUID(guid);
        if (!accountId)
        {
            ReloadCharacterCacheEntry(guid);
            accountId = sObjectMgr.GetPlayerAccountIdByGUID(guid);
        }

        return accountId;
    }

    bool GetCharacterNameByGuid(ObjectGuid guid, std::string& name) const
    {
        if (sObjectMgr.GetPlayerNameByGUID(guid, name))
            return true;

        ReloadCharacterCacheEntry(guid);
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

    void AddCharacterCacheEntry(Player* player) const
    {
        if (!player)
            return;

        sObjectMgr.UpdatePlayerCache(player);
    }

private:
    static void ReloadCharacterCacheEntry(ObjectGuid guid)
    {
        if (!guid)
            return;

        sObjectMgr.LoadPlayerCacheData(guid.GetCounter());
    }
};

static CharacterCache sCharacterCache_instance;
#define sCharacterCache (&sCharacterCache_instance)
