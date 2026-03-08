/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "Log.h"
#include "Timer.h"
#include "DatabaseEnv.h"
#include "Database/Field.h"
#include "World.h"
// Required import due to poor implementation by AC
#include "Database/QueryResult.h"

#include "PlayerbotDungeonRepository.h"

std::vector<DungeonSuggestion> const PlayerbotDungeonRepository::GetDungeonSuggestions()
{
    return m_dungeonSuggestions;
}

void PlayerbotDungeonRepository::LoadDungeonSuggestions()
{
    LOG_INFO("server.loading", "Loading playerbots dungeon suggestions...");
    uint32 oldMSTime = getMSTime();

    m_dungeonSuggestions.clear();

    uint32 count = 0;
    std::unique_ptr<QueryResult> result = PlayerbotsDatabase.Query(
        "SELECT d.name, d.difficulty, d.min_level, d.max_level, "
        "COALESCE(a.abbrevation, ''), COALESCE(s.strategy, '') "
        "FROM playerbots_dungeon_suggestion_definition d "
        "LEFT JOIN playerbots_dungeon_suggestion_abbrevation a ON a.definition_slug = d.slug "
        "LEFT JOIN playerbots_dungeon_suggestion_strategy s "
        "ON s.definition_slug = d.slug AND s.difficulty = d.difficulty");
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            std::string const name = fields[0].GetCppString();
            uint8 const difficulty = fields[1].GetUInt8();
            uint8 const min_level = fields[2].GetUInt8();
            uint8 const max_level = fields[3].GetUInt8();
            std::string const abbrevation = fields[4].GetCppString();
            std::string const strategy = fields[5].GetCppString();

            DungeonSuggestion const row = {name, difficulty, min_level, max_level, abbrevation, strategy};

            m_dungeonSuggestions.push_back(row);
            ++count;
        } while (result->NextRow());
    }

    LOG_INFO("server.loading", "%u playerbots dungeon suggestions loaded in %u ms", count,
             GetMSTimeDiffToNow(oldMSTime));
}
