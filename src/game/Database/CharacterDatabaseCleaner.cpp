/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

#include "Common.h"
#include "CharacterDatabaseCleaner.h"
#include "World.h"
#include "Database/DatabaseEnv.h"
#include "DBCStores.h"
#include "SpellMgr.h"

void CharacterDatabaseCleaner::CleanDatabase()
{
    // config to disable
    if (!sWorld.getConfig(CONFIG_BOOL_CLEAN_CHARACTER_DB))
        return;

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Cleaning character database...");

    // check flags which clean ups are necessary
    std::unique_ptr<QueryResult> result = CharacterDatabase.PQuery("SELECT cleaning_flags FROM saved_variables");
    if (!result)
        return;
    uint32 flags = (*result)[0].GetUInt32();

    // clean up
    if (flags & CLEANING_FLAG_CHARACTERS)
        CleanOrphanedCharacterData();
    if (flags & CLEANING_FLAG_PETS)
        CleanOrphanedPetData();
    if (flags & CLEANING_FLAG_ITEMS)
        CleanOrphanedItemData();
    if (flags & CLEANING_FLAG_SKILLS)
        CleanCharacterSkills();
    if (flags & CLEANING_FLAG_SPELLS)
        CleanCharacterSpell();
    CharacterDatabase.Execute("UPDATE saved_variables SET cleaning_flags = 0");
}

void CharacterDatabaseCleaner::RemoveOrphanedRows(char const* tableName1, char const* columnName1, char const* tableName2, char const* columnName2)
{
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Deleting orphaned rows in table `%s`...", tableName1);
    CharacterDatabase.DirectPExecute("DELETE t1 FROM `%s` t1 LEFT JOIN `%s` t2 ON t1.`%s` = t2.`%s` WHERE t2.`%s` IS NULL", tableName1, tableName2, columnName1, columnName2, columnName2);
}

void CharacterDatabaseCleaner::CheckUnique(char const* column, char const* table, bool (*check)(uint32))
{
    std::unique_ptr<QueryResult> result = CharacterDatabase.PQuery("SELECT DISTINCT %s FROM %s", column, table);
    if (!result)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Table %s is empty.", table);
        return;
    }

    bool found = false;
    std::ostringstream ss;
    BarGoLink bar(result->GetRowCount());
    do
    {
        bar.step();

        Field* fields = result->Fetch();

        uint32 id = fields[0].GetUInt32();

        if (!check(id))
        {
            if (!found)
            {
                ss << "DELETE FROM " << table << " WHERE " << column << " IN (";
                found = true;
            }
            else
                ss << ",";
            ss << id;
        }
    }
    while (result->NextRow());

    if (found)
    {
        ss << ")";
        CharacterDatabase.Execute(ss.str().c_str());
    }
}

void CharacterDatabaseCleaner::CleanOrphanedCharacterData()
{
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting cleanup of orphaned character data.");
    //RemoveOrphanedRows("auction", "seller_guid", "characters", "guid");
    //RemoveOrphanedRows("auction", "buyer_guid", "characters", "guid");
    RemoveOrphanedRows("character_account_data", "guid", "characters", "guid");
    RemoveOrphanedRows("character_action", "guid", "characters", "guid");
    RemoveOrphanedRows("character_aura", "guid", "characters", "guid");
    //RemoveOrphanedRows("character_aura", "caster_guid", "characters", "guid");
    RemoveOrphanedRows("character_battleground_data", "guid", "characters", "guid");
    RemoveOrphanedRows("character_deleted_items", "player_guid", "characters", "guid");
    RemoveOrphanedRows("character_forgotten_skills", "guid", "characters", "guid");
    RemoveOrphanedRows("character_gifts", "guid", "characters", "guid");
    RemoveOrphanedRows("character_homebind", "guid", "characters", "guid");
    RemoveOrphanedRows("character_honor_cp", "guid", "characters", "guid");
    RemoveOrphanedRows("character_instance", "guid", "characters", "guid");
    RemoveOrphanedRows("character_inventory", "guid", "characters", "guid");
    RemoveOrphanedRows("character_pet", "owner_guid", "characters", "guid");
    RemoveOrphanedRows("character_queststatus", "guid", "characters", "guid");
    RemoveOrphanedRows("character_reputation", "guid", "characters", "guid");
    RemoveOrphanedRows("character_skills", "guid", "characters", "guid");
    RemoveOrphanedRows("character_social", "guid", "characters", "guid");
    RemoveOrphanedRows("character_social", "friend", "characters", "guid");
    RemoveOrphanedRows("character_spell", "guid", "characters", "guid");
    RemoveOrphanedRows("character_spell_cooldown", "guid", "characters", "guid");
    //RemoveOrphanedRows("character_stats", "guid", "characters", "guid");
    RemoveOrphanedRows("corpse", "player_guid", "characters", "guid");
    RemoveOrphanedRows("gm_tickets", "guid", "characters", "guid");
    //RemoveOrphanedRows("gm_tickets", "closed_by", "characters", "guid");
    //RemoveOrphanedRows("gm_tickets", "assigned_to", "characters", "guid");
    //RemoveOrphanedRows("groups", "leader_guid", "characters", "guid");
    //RemoveOrphanedRows("groups", "main_tank_guid", "characters", "guid");
    //RemoveOrphanedRows("groups", "main_assistant_guid", "characters", "guid");
    //RemoveOrphanedRows("groups", "looter_guid", "characters", "guid");
    RemoveOrphanedRows("group_instance", "leader_guid", "characters", "guid");
    RemoveOrphanedRows("group_member", "member_guid", "characters", "guid");
    //RemoveOrphanedRows("guild", "leader_guid", "characters", "guid");
    //RemoveOrphanedRows("guild_eventlog", "player_guid1", "characters", "guid");
    //RemoveOrphanedRows("guild_eventlog", "player_guid2", "characters", "guid");
    RemoveOrphanedRows("guild_member", "guid", "characters", "guid");
    RemoveOrphanedRows("item_instance", "owner_guid", "characters", "guid");
    //RemoveOrphanedRows("item_instance", "creator_guid", "characters", "guid");
    //RemoveOrphanedRows("item_instance", "gift_creator_guid", "characters", "guid");
    RemoveOrphanedRows("item_loot", "owner_guid", "characters", "guid");
    //RemoveOrphanedRows("mail", "sender_guid", "characters", "guid");
    RemoveOrphanedRows("mail", "receiver_guid", "characters", "guid");
    RemoveOrphanedRows("mail_items", "receiver_guid", "characters", "guid");
    RemoveOrphanedRows("petition", "owner_guid", "characters", "guid");
    RemoveOrphanedRows("petition_sign", "owner_guid", "characters", "guid");
    RemoveOrphanedRows("petition_sign", "player_guid", "characters", "guid");
    //RemoveOrphanedRows("pet_aura", "caster_guid", "characters", "guid");
}

void CharacterDatabaseCleaner::CleanOrphanedPetData()
{
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting cleanup of orphaned pet data.");
    RemoveOrphanedRows("pet_aura", "guid", "character_pet", "id");
    RemoveOrphanedRows("pet_spell", "guid", "character_pet", "id");
    RemoveOrphanedRows("pet_spell_cooldown", "guid", "character_pet", "id");
}

void CharacterDatabaseCleaner::CleanOrphanedItemData()
{
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Starting cleanup of orphaned item data.");
    RemoveOrphanedRows("auction", "item_guid", "item_instance", "guid");
    //RemoveOrphanedRows("character_aura", "item_guid", "item_instance", "guid");
    RemoveOrphanedRows("character_gifts", "item_guid", "item_instance", "guid");
    RemoveOrphanedRows("character_inventory", "item_guid", "item_instance", "guid");
    //RemoveOrphanedRows("character_inventory", "bag", "item_instance", "guid");
    RemoveOrphanedRows("item_loot", "guid", "item_instance", "guid");
    RemoveOrphanedRows("mail_items", "item_guid", "item_instance", "guid");
    RemoveOrphanedRows("petition", "charter_guid", "item_instance", "guid");
    //RemoveOrphanedRows("pet_aura", "item_guid", "item_instance", "guid");
}

bool CharacterDatabaseCleaner::SkillCheck(uint32 skill)
{
    return sSkillLineStore.LookupEntry(skill);
}

void CharacterDatabaseCleaner::CleanCharacterSkills()
{
    CheckUnique("skill", "character_skills", &SkillCheck);
}

bool CharacterDatabaseCleaner::SpellCheck(uint32 spell_id)
{
    return sSpellMgr.IsExistingSpellId(spell_id);
}

void CharacterDatabaseCleaner::CleanCharacterSpell()
{
    CheckUnique("spell", "character_spell", &SpellCheck);
}
