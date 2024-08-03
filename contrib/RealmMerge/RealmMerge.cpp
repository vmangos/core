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

#include <string>
#include <iostream>
#include "Database/DatabaseEnv.h"
#include "Log.h"

DatabaseType CharacterDatabase1;
DatabaseType CharacterDatabase2;
std::string g_db1Name;
std::string g_db2Name;

enum AtLoginFlags
{
    AT_LOGIN_NONE              = 0x00,
    AT_LOGIN_RENAME            = 0x01,
    AT_LOGIN_RESET_SPELLS      = 0x02,
    AT_LOGIN_RESET_TALENTS     = 0x04,
    //AT_LOGIN_CUSTOMIZE         = 0x08, -- used in post-3.x
    //AT_LOGIN_RESET_PET_TALENTS = 0x10, -- used in post-3.x
    AT_LOGIN_FIRST             = 0x20,
};

std::string MakeConnectionString()
{
    std::string mysql_host;
    std::string mysql_port;
    std::string mysql_user;
    std::string mysql_pass;
    std::string mysql_db;

    printf("Host: ");
    getline(std::cin, mysql_host);
    if (mysql_host.empty())
        mysql_host = "127.0.0.1";

    printf("Port: ");
    getline(std::cin, mysql_port);
    if (mysql_port.empty())
        mysql_port = "3306";

    printf("User: ");
    getline(std::cin, mysql_user);
    if (mysql_user.empty())
        mysql_user = "root";

    printf("Password: ");
    getline(std::cin, mysql_pass);
    if (mysql_pass.empty())
        mysql_pass = "root";

    return mysql_host + ";" + mysql_port + ";" + mysql_user + ";" + mysql_pass + ";";
}

char GetChar()
{
    fseek(stdin, 0, SEEK_END);
    char const chr = getchar();
    fseek(stdin, 0, SEEK_END);
    return chr;
}

std::string GetString()
{
    std::string text;
    fseek(stdin, 0, SEEK_END);
    getline(std::cin, text);
    fseek(stdin, 0, SEEK_END);
    return text;
}

struct UniqueKeyData
{
    std::set<uint32> existingKeys1;
    std::set<uint32> existingKeys2;
    std::map<uint32, uint32> replacedKeys;
    uint32 counter = 0;

    std::pair<uint32, bool> ReplaceKeyIfNeeded(uint32 key)
    {
        auto itr = replacedKeys.find(key);
        if (itr != replacedKeys.end())
            return std::make_pair(itr->second, false);

        if (existingKeys1.find(key) == existingKeys1.end())
            return std::make_pair(key, false);

        ++counter;
        while (existingKeys1.find(counter) != existingKeys1.end() ||
               existingKeys2.find(counter) != existingKeys2.end())
        {
            ++counter;
        }

        replacedKeys.insert({ key, counter });
        return std::make_pair(counter, true);
    }
};

bool UpdateCharacterGuids()
{
    std::set<std::string> characterNames1;
    std::map<uint32, std::string> characterNames2;
    UniqueKeyData characterGuids;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.characters...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `guid`, `name` FROM `characters`"));

    if (!result)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Database %s contains no characters.", g_db1Name.c_str());
        return false;
    }

    do
    {
        Field* fields = result->Fetch();

        uint32 guid = fields[0].GetUInt32();
        std::string name = fields[1].GetCppString();

        characterGuids.existingKeys1.insert(guid);
        characterNames1.insert(name);

    } while (result->NextRow());

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.characters...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `guid`, `name` FROM `characters`");

    if (!result)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Database %s contains no characters.", g_db2Name.c_str());
        return false;
    }

    do
    {
        Field* fields = result->Fetch();

        uint32 guid = fields[0].GetUInt32();
        std::string name = fields[1].GetCppString();

        characterGuids.existingKeys2.insert(guid);
        characterNames2.insert({ guid, name });

    } while (result->NextRow());

    if (INT32_MAX < int64(characterGuids.existingKeys1.size() + characterGuids.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of characters exceeds max value of int32.");
        return false;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating character names...");
    for (auto const& itr : characterNames2)
    {
        if (!itr.second.empty() && characterNames1.find(itr.second) != characterNames1.end())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Name of character %s (%u) is taken. Marking for rename.", itr.second.c_str(), itr.first);
            CharacterDatabase2.PExecute("UPDATE `characters` SET `name` = guid, `at_login_flags` = (`at_login_flags` | %u) WHERE `guid` = %u", AT_LOGIN_RENAME, itr.first);
        }
    }

    int64 const maxCharGuid1 = *characterGuids.existingKeys1.rbegin();
    int64 const maxCharGuid2 = *characterGuids.existingKeys2.rbegin();
    int64 const maxCharGuid = std::max(maxCharGuid1, maxCharGuid2);

    if (INT32_MAX > int64(maxCharGuid + maxCharGuid2))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating character guids (fast method)...");
        CharacterDatabase2.PExecute("UPDATE `auction` SET `seller_guid` = (`seller_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `auction` SET `buyer_guid` = (`buyer_guid` + %u) WHERE `buyer_guid` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `characters` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_account_data` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_action` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_aura` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_aura` SET `caster_guid` = (`caster_guid` + %u) WHERE `caster_guid` <= %u", maxCharGuid, maxCharGuid2);
        CharacterDatabase2.PExecute("UPDATE `character_battleground_data` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_deleted_items` SET `player_guid` = (`player_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_forgotten_skills` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_gifts` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_homebind` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_honor_cp` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_instance` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_inventory` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_pet` SET `owner_guid` = (`owner_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_queststatus` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_reputation` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_skills` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_social` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_social` SET `friend` = (`friend` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_spell` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_spell_cooldown` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `character_stats` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `corpse` SET `player_guid` = (`player_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `closed_by` = (`closed_by` + %u) WHERE `closed_by` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `assigned_to` = (`assigned_to` + %u) WHERE `assigned_to` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `groups` SET `leader_guid` = (`leader_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `groups` SET `main_tank_guid` = (`main_tank_guid` + %u) WHERE `main_tank_guid` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `groups` SET `main_assistant_guid` = (`main_assistant_guid` + %u) WHERE `main_assistant_guid` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `groups` SET `looter_guid` = (`looter_guid` + %u) WHERE `looter_guid` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `group_instance` SET `leader_guid` = (`leader_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `group_member` SET `member_guid` = (`member_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `guild` SET `leader_guid` = (`leader_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `guild_eventlog` SET `player_guid1` = (`player_guid1` + %u) WHERE `player_guid1` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `guild_eventlog` SET `player_guid2` = (`player_guid2` + %u) WHERE `player_guid2` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `guild_member` SET `guid` = (`guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `item_instance` SET `owner_guid` = (`owner_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `item_instance` SET `creator_guid` = (`creator_guid` + %u) WHERE `creator_guid` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `item_instance` SET `gift_creator_guid` = (`gift_creator_guid` + %u) WHERE `gift_creator_guid` != 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `item_loot` SET `owner_guid` = (`owner_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `mail` SET `sender_guid` = (`sender_guid` + %u) WHERE `mail_template_id` = 0", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `mail` SET `receiver_guid` = (`receiver_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `mail_items` SET `receiver_guid` = (`receiver_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `petition` SET `owner_guid` = (`owner_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `petition_sign` SET `owner_guid` = (`owner_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `petition_sign` SET `player_guid` = (`player_guid` + %u)", maxCharGuid);
        CharacterDatabase2.PExecute("UPDATE `pet_aura` SET `caster_guid` = (`caster_guid` + %u) WHERE `caster_guid` <= %u", maxCharGuid, maxCharGuid2);
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating character guids (slow method)...");
        for (auto const& guid : characterGuids.existingKeys2)
        {
            std::pair<uint32, bool> newGuid = characterGuids.ReplaceKeyIfNeeded(guid);
            if (newGuid.second)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Guid of character %u is taken. Updating to %u.", guid, newGuid.first);
                CharacterDatabase2.PExecute("UPDATE `auction` SET `seller_guid` = %u WHERE `seller_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `auction` SET `buyer_guid` = %u WHERE `buyer_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `characters` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_account_data` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_action` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_aura` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_aura` SET `caster_guid` = %u WHERE `caster_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_battleground_data` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_deleted_items` SET `player_guid` = %u WHERE `player_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_forgotten_skills` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_gifts` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_homebind` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_honor_cp` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_instance` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_inventory` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_pet` SET `owner_guid` = %u WHERE `owner_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_queststatus` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_reputation` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_skills` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_social` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_social` SET `friend` = %u WHERE `friend` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_spell` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_spell_cooldown` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `character_stats` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `corpse` SET `player_guid` = %u WHERE `player_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `closed_by` = %u WHERE `closed_by` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `assigned_to` = %u WHERE `assigned_to` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `groups` SET `leader_guid` = %u WHERE `leader_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `groups` SET `main_tank_guid` = %u WHERE `main_tank_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `groups` SET `main_assistant_guid` = %u WHERE `main_assistant_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `groups` SET `looter_guid` = %u WHERE `looter_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `group_instance` SET `leader_guid` = %u WHERE `leader_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `group_member` SET `member_guid` = %u WHERE `member_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `guild` SET `leader_guid` = %u WHERE `leader_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `guild_eventlog` SET `player_guid1` = %u WHERE `player_guid1` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `guild_eventlog` SET `player_guid2` = %u WHERE  `player_guid2` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `guild_member` SET `guid` = %u WHERE  `guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `item_instance` SET `owner_guid` = %u WHERE `owner_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `item_instance` SET `creator_guid` = %u WHERE `creator_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `item_instance` SET `gift_creator_guid` = %u WHERE `gift_creator_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `item_loot` SET `owner_guid` = %u WHERE `owner_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `mail` SET `sender_guid` = %u WHERE `sender_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `mail` SET `receiver_guid` = %u WHERE `receiver_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `mail_items` SET `receiver_guid` = %u WHERE `receiver_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `petition` SET `owner_guid` = %u WHERE `owner_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `petition_sign` SET `owner_guid` = %u WHERE `owner_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `petition_sign` SET `player_guid` = %u WHERE `player_guid` = %u", newGuid.first, guid);
                CharacterDatabase2.PExecute("UPDATE `pet_aura` SET `caster_guid` = %u WHERE `caster_guid` = %u", newGuid.first, guid);
            }
        }
    }

    // This table has auto increment primary key so update that too.
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.character_deleted_items...", g_db1Name.c_str());
    result = CharacterDatabase1.Query("SELECT MAX(`id`) FROM `character_deleted_items`");
    if (result)
    {
        uint32 maxId = 0;

        do
        {
            Field* fields = result->Fetch();

            maxId = fields[0].GetUInt32();

        } while (result->NextRow());

        CharacterDatabase2.PExecute("UPDATE `character_deleted_items` SET `id` = `id` + %u", maxId);
    }
    
    return true;
}

bool UpdateItemGuids()
{
    UniqueKeyData itemGuids;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.item_instance...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `guid` FROM `item_instance`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            itemGuids.existingKeys1.insert(guid);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.item_instance...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `guid` FROM `item_instance`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            itemGuids.existingKeys2.insert(guid);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(itemGuids.existingKeys1.size() + itemGuids.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of items exceeds max value of int32.");
        return false;
    }

    if (!itemGuids.existingKeys1.empty() && !itemGuids.existingKeys2.empty())
    {
        int64 const maxItemGuid1 = *itemGuids.existingKeys1.rbegin();
        int64 const maxItemGuid2 = *itemGuids.existingKeys2.rbegin();
        int64 const maxItemGuid = std::max(maxItemGuid1, maxItemGuid2);

        if (INT32_MAX > int64(maxItemGuid + maxItemGuid2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating item guids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `auction` SET `item_guid` = (`item_guid` + %u)", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `character_aura` SET `item_guid` = (`item_guid` + %u) WHERE `item_guid` != 0", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `character_gifts` SET `item_guid` = (`item_guid` + %u)", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `character_inventory` SET `item_guid` = (`item_guid` + %u)", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `character_inventory` SET `bag` = (`bag` + %u) WHERE `bag` != 0", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `item_instance` SET `guid` = (`guid` + %u)", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `item_loot` SET `guid` = (`guid` + %u)", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `mail_items` SET `item_guid` = (`item_guid` + %u)", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `petition` SET `charter_guid` = (`charter_guid` + %u)", maxItemGuid);
            CharacterDatabase2.PExecute("UPDATE `pet_aura` SET `item_guid` = (`item_guid` + %u) WHERE `item_guid` != 0", maxItemGuid);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating item guids (slow method)...");
            for (auto const& guid : itemGuids.existingKeys2)
            {
                std::pair<uint32, bool> newGuid = itemGuids.ReplaceKeyIfNeeded(guid);
                if (newGuid.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Guid of item %u is taken. Updating to %u.", guid, newGuid.first);
                    CharacterDatabase2.PExecute("UPDATE `auction` SET `item_guid` = %u WHERE `item_guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `character_aura` SET `item_guid` = %u WHERE `item_guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `character_gifts` SET `item_guid` = %u WHERE `item_guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `character_inventory` SET `item_guid` = %u WHERE `item_guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `character_inventory` SET `bag` = %u WHERE `bag` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `item_instance` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `item_loot` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `mail_items` SET `item_guid` = %u WHERE `item_guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `petition` SET `charter_guid` = %u WHERE `charter_guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `pet_aura` SET `item_guid` = %u WHERE `item_guid` = %u", newGuid.first, guid);
                }
            }
        }
    }

    return true;
}

bool UpdatePetitionGuids()
{
    UniqueKeyData petitionGuids;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.petition...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `petition_guid` FROM `petition`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            petitionGuids.existingKeys1.insert(guid);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.petition...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `petition_guid` FROM `petition`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            petitionGuids.existingKeys2.insert(guid);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(petitionGuids.existingKeys1.size() + petitionGuids.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of petitions exceeds max value of int32.");
        return false;
    }

    if (!petitionGuids.existingKeys1.empty() && !petitionGuids.existingKeys2.empty())
    {
        int64 const maxPetitionGuid1 = *petitionGuids.existingKeys1.rbegin();
        int64 const maxPetitionGuid2 = *petitionGuids.existingKeys2.rbegin();
        int64 const maxPetitionGuid = std::max(maxPetitionGuid1, maxPetitionGuid2);

        if (INT32_MAX > int64(maxPetitionGuid + maxPetitionGuid2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating petition guids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `petition` SET `petition_guid` = (`petition_guid` + %u)", maxPetitionGuid);
            CharacterDatabase2.PExecute("UPDATE `petition_sign` SET `petition_guid` = (`petition_guid` + %u)", maxPetitionGuid);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating petition guids (slow method)...");
            for (auto const& guid : petitionGuids.existingKeys2)
            {
                std::pair<uint32, bool> newGuid = petitionGuids.ReplaceKeyIfNeeded(guid);
                if (newGuid.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Guid of petition %u is taken. Updating to %u.", guid, newGuid.first);
                    CharacterDatabase2.PExecute("UPDATE `petition` SET `petition_guid` = %u WHERE `petition_guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `petition_sign` SET `petition_guid` = %u WHERE `petition_guid` = %u", newGuid.first, guid);
                }
            }
        }
    }

    return true;
}

bool UpdatePetGuids()
{
    UniqueKeyData petGuids;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.character_pet...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `id` FROM `character_pet`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            petGuids.existingKeys1.insert(guid);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.character_pet...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `id` FROM `character_pet`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            petGuids.existingKeys2.insert(guid);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(petGuids.existingKeys1.size() + petGuids.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of pets exceeds max value of int32.");
        return false;
    }

    if (!petGuids.existingKeys1.empty() && !petGuids.existingKeys2.empty())
    {
        int64 const maxPetGuid1 = *petGuids.existingKeys1.rbegin();
        int64 const maxPetGuid2 = *petGuids.existingKeys2.rbegin();
        int64 const maxPetGuid = std::max(maxPetGuid1, maxPetGuid2);

        if (INT32_MAX > int64(maxPetGuid + maxPetGuid2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating pet guids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `character_pet` SET `id` = (`id` + %u)", maxPetGuid);
            CharacterDatabase2.PExecute("UPDATE `pet_aura` SET `guid` = (`guid` + %u)", maxPetGuid);
            CharacterDatabase2.PExecute("UPDATE `pet_spell` SET `guid` = (`guid` + %u)", maxPetGuid);
            CharacterDatabase2.PExecute("UPDATE `pet_spell_cooldown` SET `guid` = (`guid` + %u)", maxPetGuid);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating pet guids (slow method)...");
            for (auto const& guid : petGuids.existingKeys2)
            {
                std::pair<uint32, bool> newGuid = petGuids.ReplaceKeyIfNeeded(guid);
                if (newGuid.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Guid of pet %u is taken. Updating to %u.", guid, newGuid.first);
                    CharacterDatabase2.PExecute("UPDATE `character_pet` SET `id` = %u WHERE `id` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `pet_aura` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `pet_spell` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                    CharacterDatabase2.PExecute("UPDATE `pet_spell_cooldown` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                }
            }
        }
    }

    return true;
}

bool UpdateCorpseGuids()
{
    UniqueKeyData corpseGuids;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.corpse...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `guid` FROM `corpse`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            corpseGuids.existingKeys1.insert(guid);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.corpse...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `guid` FROM `corpse`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guid = fields[0].GetUInt32();
            corpseGuids.existingKeys2.insert(guid);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(corpseGuids.existingKeys1.size() + corpseGuids.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of corpses exceeds max value of int32.");
        return false;
    }

    if (!corpseGuids.existingKeys1.empty() && !corpseGuids.existingKeys2.empty())
    {
        int64 const maxCorpseGuid1 = *corpseGuids.existingKeys1.rbegin();
        int64 const maxCorpseGuid2 = *corpseGuids.existingKeys2.rbegin();
        int64 const maxCorpseGuid = std::max(maxCorpseGuid1, maxCorpseGuid2);

        if (INT32_MAX > int64(maxCorpseGuid + maxCorpseGuid2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating corpse guids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `corpse` SET `guid` = (`guid` + %u)", maxCorpseGuid);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating corpse guids (slow method)...");
            for (auto const& guid : corpseGuids.existingKeys2)
            {
                std::pair<uint32, bool> newGuid = corpseGuids.ReplaceKeyIfNeeded(guid);
                if (newGuid.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Guid of corpse %u is taken. Updating to %u.", guid, newGuid.first);
                    CharacterDatabase2.PExecute("UPDATE `corpse` SET `guid` = %u WHERE `guid` = %u", newGuid.first, guid);
                }
            }
        }
    }

    return true;
}

bool UpdateGroupIds()
{
    UniqueKeyData groupIds;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.groups...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `group_id` FROM `groups`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 groupId = fields[0].GetUInt32();
            groupIds.existingKeys1.insert(groupId);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.groups...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `group_id` FROM `groups`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 groupId = fields[0].GetUInt32();
            groupIds.existingKeys2.insert(groupId);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(groupIds.existingKeys1.size() + groupIds.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of groups exceeds max value of int32.");
        return false;
    }

    if (!groupIds.existingKeys1.empty() && !groupIds.existingKeys2.empty())
    {
        int64 const maxGroupId1 = *groupIds.existingKeys1.rbegin();
        int64 const maxGroupId2 = *groupIds.existingKeys2.rbegin();
        int64 const maxGroupId = std::max(maxGroupId1, maxGroupId2);

        if (INT32_MAX > int64(maxGroupId + maxGroupId2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating group ids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `groups` SET `group_id` = (`group_id` + %u)", maxGroupId);
            CharacterDatabase2.PExecute("UPDATE `group_member` SET `group_id` = (`group_id` + %u)", maxGroupId);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating group ids (slow method)...");
            for (auto const& id : groupIds.existingKeys2)
            {
                std::pair<uint32, bool> newId = groupIds.ReplaceKeyIfNeeded(id);
                if (newId.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Id of group %u is taken. Updating to %u.", id, newId.first);
                    CharacterDatabase2.PExecute("UPDATE `groups` SET `group_id` = %u WHERE `group_id` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `group_member` SET `group_id` = %u WHERE `group_id` = %u", newId.first, id);
                }
            }
        }
    }

    return true;
}

bool UpdateGuildIds()
{
    UniqueKeyData guildIds;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.guild...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `guild_id` FROM `guild`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guildId = fields[0].GetUInt32();
            guildIds.existingKeys1.insert(guildId);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.guild...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `guild_id` FROM `guild`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 guildId = fields[0].GetUInt32();
            guildIds.existingKeys2.insert(guildId);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(guildIds.existingKeys1.size() + guildIds.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of guilds exceeds max value of int32.");
        return false;
    }

    if (!guildIds.existingKeys1.empty() && !guildIds.existingKeys2.empty())
    {
        int64 const maxGuildId1 = *guildIds.existingKeys1.rbegin();
        int64 const maxGuildId2 = *guildIds.existingKeys2.rbegin();
        int64 const maxGuildId = std::max(maxGuildId1, maxGuildId2);

        if (INT32_MAX > int64(maxGuildId + maxGuildId2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating guild ids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `guild` SET `guild_id` = (`guild_id` + %u)", maxGuildId);
            CharacterDatabase2.PExecute("UPDATE `guild_eventlog` SET `guild_id` = (`guild_id` + %u)", maxGuildId);
            CharacterDatabase2.PExecute("UPDATE `guild_member` SET `guild_id` = (`guild_id` + %u)", maxGuildId);
            CharacterDatabase2.PExecute("UPDATE `guild_rank` SET `guild_id` = (`guild_id` + %u)", maxGuildId);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating guild ids (slow method)...");
            for (auto const& id : guildIds.existingKeys2)
            {
                std::pair<uint32, bool> newId = guildIds.ReplaceKeyIfNeeded(id);
                if (newId.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Id of guild %u is taken. Updating to %u.", id, newId.first);
                    CharacterDatabase2.PExecute("UPDATE `guild` SET `guild_id` = %u WHERE `guild_id` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `guild_eventlog` SET `guild_id` = %u WHERE `guild_id` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `guild_member` SET `guild_id` = %u WHERE `guild_id` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `guild_rank` SET `guild_id` = %u WHERE `guild_id` = %u", newId.first, id);
                }
            }
        }
    }

    return true;
}

bool UpdateInstanceIds()
{
    UniqueKeyData instanceIds;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.instance...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `id` FROM `instance`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 instanceId = fields[0].GetUInt32();
            instanceIds.existingKeys1.insert(instanceId);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.instance...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `id` FROM `instance`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 instanceId = fields[0].GetUInt32();
            instanceIds.existingKeys2.insert(instanceId);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(instanceIds.existingKeys1.size() + instanceIds.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of instances exceeds max value of int32.");
        return false;
    }

    if (!instanceIds.existingKeys1.empty() && !instanceIds.existingKeys2.empty())
    {
        int64 const maxInstanceId1 = *instanceIds.existingKeys1.rbegin();
        int64 const maxInstanceId2 = *instanceIds.existingKeys2.rbegin();
        int64 const maxInstanceId = std::max(maxInstanceId1, maxInstanceId2);

        if (INT32_MAX > int64(maxInstanceId + maxInstanceId2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating instance ids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `character_battleground_data` SET `instance_id` = (`instance_id` + %u) WHERE `instance_id` != 0", maxInstanceId);
            CharacterDatabase2.PExecute("UPDATE `character_instance` SET `instance` = (`instance` + %u)", maxInstanceId);
            CharacterDatabase2.PExecute("UPDATE `corpse` SET `instance` = (`instance` + %u) WHERE `instance` != 0", maxInstanceId);
            CharacterDatabase2.PExecute("UPDATE `creature_respawn` SET `instance` = (`instance` + %u) WHERE `instance` != 0", maxInstanceId);
            CharacterDatabase2.PExecute("UPDATE `gameobject_respawn` SET `instance` = (`instance` + %u) WHERE `instance` != 0", maxInstanceId);
            CharacterDatabase2.PExecute("UPDATE `group_instance` SET `instance` = (`instance` + %u)", maxInstanceId);
            CharacterDatabase2.PExecute("UPDATE `instance` SET `id` = (`id` + %u)", maxInstanceId);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating instance ids (slow method)...");
            for (auto const& id : instanceIds.existingKeys2)
            {
                std::pair<uint32, bool> newId = instanceIds.ReplaceKeyIfNeeded(id);
                if (newId.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Id of instance %u is taken. Updating to %u.", id, newId.first);
                    CharacterDatabase2.PExecute("UPDATE `character_battleground_data` SET `instance_id` = %u WHERE `instance_id` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `character_instance` SET `instance` = %u WHERE `instance` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `corpse` SET `instance` = %u WHERE `instance` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `creature_respawn` SET `instance` = %u WHERE `instance` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `gameobject_respawn` SET `instance` = %u WHERE `instance` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `group_instance` SET `instance` = %u WHERE `instance` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `instance` SET `id` = %u WHERE `id` = %u", newId.first, id);
                }
            }
        }
    }

    return true;
}

bool UpdateMailIds()
{
    UniqueKeyData mailIds;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.mail...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `id` FROM `mail`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 mailId = fields[0].GetUInt32();
            mailIds.existingKeys1.insert(mailId);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.mail...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `id` FROM `mail`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 mailId = fields[0].GetUInt32();
            mailIds.existingKeys2.insert(mailId);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(mailIds.existingKeys1.size() + mailIds.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of mails exceeds max value of int32.");
        return false;
    }

    if (!mailIds.existingKeys1.empty() && !mailIds.existingKeys2.empty())
    {
        int64 const maxMailId1 = *mailIds.existingKeys1.rbegin();
        int64 const maxMailid2 = *mailIds.existingKeys2.rbegin();
        int64 const maxMailid = std::max(maxMailId1, maxMailid2);

        if (INT32_MAX > int64(maxMailid + maxMailid2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating mail ids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `mail` SET `id` = (`id` + %u)", maxMailid);
            CharacterDatabase2.PExecute("UPDATE `mail_items` SET `mail_id` = (`mail_id` + %u)", maxMailid);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating mail ids (slow method)...");
            for (auto const& id : mailIds.existingKeys2)
            {
                std::pair<uint32, bool> newId = mailIds.ReplaceKeyIfNeeded(id);
                if (newId.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Id of instance %u is taken. Updating to %u.", id, newId.first);
                    CharacterDatabase2.PExecute("UPDATE `mail` SET `id` = %u WHERE `id` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `mail_items` SET `mail_id` = %u WHERE `mail_id` = %u", newId.first, id);
                }
            }
        }
    }

    return true;
}

bool UpdateItemTextIds()
{
    UniqueKeyData itemTextIds;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.item_text...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `id` FROM `item_text`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 itemTextId = fields[0].GetUInt32();
            itemTextIds.existingKeys1.insert(itemTextId);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.mail...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `id` FROM `item_text`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 itemTextId = fields[0].GetUInt32();
            itemTextIds.existingKeys2.insert(itemTextId);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(itemTextIds.existingKeys1.size() + itemTextIds.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of item texts exceeds max value of int32.");
        return false;
    }

    if (!itemTextIds.existingKeys1.empty() && !itemTextIds.existingKeys2.empty())
    {
        int64 const maxItemTextId1 = *itemTextIds.existingKeys1.rbegin();
        int64 const maxItemTextId2 = *itemTextIds.existingKeys2.rbegin();
        int64 const maxItemTextId = std::max(maxItemTextId1, maxItemTextId2);

        if (INT32_MAX > int64(maxItemTextId + maxItemTextId2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating item text ids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `item_instance` SET `text` = (`text` + %u) WHERE `text` != 0", maxItemTextId);
            CharacterDatabase2.PExecute("UPDATE `item_text` SET `id` = (`id` + %u)", maxItemTextId);
            CharacterDatabase2.PExecute("UPDATE `mail` SET `item_text_id` = (`item_text_id` + %u) WHERE `item_text_id` != 0", maxItemTextId);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating item text ids (slow method)...");
            for (auto const& id : itemTextIds.existingKeys2)
            {
                std::pair<uint32, bool> newId = itemTextIds.ReplaceKeyIfNeeded(id);
                if (newId.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Id of item text %u is taken. Updating to %u.", id, newId.first);
                    CharacterDatabase2.PExecute("UPDATE `item_instance` SET `text` = %u WHERE `text` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `item_text` SET `id` = %u WHERE `id` = %u", newId.first, id);
                    CharacterDatabase2.PExecute("UPDATE `mail` SET `item_text_id` = %u WHERE `item_text_id` = %u", newId.first, id);
                }
            }
        }
    }

    return true;
}

bool UpdateAuctionIds()
{
    UniqueKeyData auctionIds;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.auction...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `id` FROM `auction`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 auctionId = fields[0].GetUInt32();
            auctionIds.existingKeys1.insert(auctionId);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.auction...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `id` FROM `auction`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 auctionId = fields[0].GetUInt32();
            auctionIds.existingKeys2.insert(auctionId);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(auctionIds.existingKeys1.size() + auctionIds.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of auctions exceeds max value of int32.");
        return false;
    }

    if (!auctionIds.existingKeys1.empty() && !auctionIds.existingKeys2.empty())
    {
        int64 const maxAuctionId1 = *auctionIds.existingKeys1.rbegin();
        int64 const maxAuctionId2 = *auctionIds.existingKeys2.rbegin();
        int64 const maxAuctionId = std::max(maxAuctionId1, maxAuctionId2);

        if (INT32_MAX > int64(maxAuctionId + maxAuctionId2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating auction ids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `auction` SET `id` = (`id` + %u)", maxAuctionId);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating auction ids (slow method)...");
            for (auto const& id : auctionIds.existingKeys2)
            {
                std::pair<uint32, bool> newId = auctionIds.ReplaceKeyIfNeeded(id);
                if (newId.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Id of auction %u is taken. Updating to %u.", id, newId.first);
                    CharacterDatabase2.PExecute("UPDATE `auction` SET `id` = %u WHERE `id` = %u", newId.first, id);
                }
            }
        }
    }

    return true;
}

bool UpdateTicketIds()
{
    UniqueKeyData ticketIds;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.gm_tickets...", g_db1Name.c_str());
    std::unique_ptr<QueryResult> result(CharacterDatabase1.Query("SELECT `ticket_id` FROM `gm_tickets`"));

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 ticketId = fields[0].GetUInt32();
            ticketIds.existingKeys1.insert(ticketId);

        } while (result->NextRow());
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading %s.gm_tickets...", g_db2Name.c_str());
    result = CharacterDatabase2.Query("SELECT `ticket_id` FROM `gm_tickets`");

    if (result)
    {
        do
        {
            Field* fields = result->Fetch();

            uint32 ticketId = fields[0].GetUInt32();
            ticketIds.existingKeys2.insert(ticketId);

        } while (result->NextRow());
    }

    if (INT32_MAX < int64(ticketIds.existingKeys1.size() + ticketIds.existingKeys2.size()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Databases cannot be merged because number of tickets exceeds max value of int32.");
        return false;
    }

    if (!ticketIds.existingKeys1.empty() && !ticketIds.existingKeys2.empty())
    {
        int64 const maxTicketId1 = *ticketIds.existingKeys1.rbegin();
        int64 const maxTicketId2 = *ticketIds.existingKeys2.rbegin();
        int64 const maxTicketId = std::max(maxTicketId1, maxTicketId2);

        if (INT32_MAX > int64(maxTicketId + maxTicketId2))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating ticket ids (fast method)...");
            CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `ticket_id` = (`ticket_id` + %u)", maxTicketId);
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Updating ticket ids (slow method)...");
            for (auto const& id : ticketIds.existingKeys2)
            {
                std::pair<uint32, bool> newId = ticketIds.ReplaceKeyIfNeeded(id);
                if (newId.second)
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Id of ticket %u is taken. Updating to %u.", id, newId.first);
                    CharacterDatabase2.PExecute("UPDATE `gm_tickets` SET `ticket_id` = %u WHERE `ticket_id` = %u", newId.first, id);
                }
            }
        }
    }

    return true;
}

char const* g_mainLogFileName = "RealmMerge.log";

//=======================================================
int main(int argc, char* argv[])
{
    puts("This tool resolves guid conflicts between character databases,");
    puts("to help you merge DB-2 into DB-1 and consolidate the realms.");
    puts("It will update keys in DB-2 and you have to manually export");
    puts("the database to a sql file afterwards and insert into DB-1.");
    puts("-------------------------------------------------------------");
    puts("");
    puts("Please enter your database connection info.");
    puts("");

    std::string connString = MakeConnectionString();

    printf("Database 1 Name: ");
    g_db1Name = GetString();
    if (g_db1Name.empty())
    {
        puts("Error: You did not enter a database name.");
        GetChar();
        return 1;
    }

    printf("Database 2 Name: ");
    g_db2Name = GetString();
    if (g_db2Name.empty())
    {
        puts("Error: You did not enter a database name.");
        GetChar();
        return 1;
    }

    if (!CharacterDatabase1.Initialize((connString + g_db1Name).c_str()))
    {
        puts("Error: Cannot connect to DB-1.");
        GetChar();
        return 1;
    }

    if (!CharacterDatabase2.Initialize((connString + g_db2Name).c_str()))
    {
        puts("Error: Cannot connect to DB-2.");
        GetChar();
        return 1;
    }

    time_t startTime = time(nullptr);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting work at %u...", startTime);

    if (!UpdateCharacterGuids())
    {
        GetChar();
        return 1;
    }
    
    if (!UpdateItemGuids())
    {
        GetChar();
        return 1;
    }

    if (!UpdatePetitionGuids())
    {
        GetChar();
        return 1;
    }

    if (!UpdatePetGuids())
    {
        GetChar();
        return 1;
    }

    if (!UpdateCorpseGuids())
    {
        GetChar();
        return 1;
    }

    if (!UpdateGroupIds())
    {
        GetChar();
        return 1;
    }

    if (!UpdateGuildIds())
    {
        GetChar();
        return 1;
    }

    if (!UpdateInstanceIds())
    {
        GetChar();
        return 1;
    }

    if (!UpdateMailIds())
    {
        GetChar();
        return 1;
    }

    if (!UpdateItemTextIds())
    {
        GetChar();
        return 1;
    }

    if (!UpdateAuctionIds())
    {
        GetChar();
        return 1;
    }

    if (!UpdateTicketIds())
    {
        GetChar();
        return 1;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Work done in %u seconds.", (time(nullptr) - startTime));

    GetChar();
    return 0;
}
