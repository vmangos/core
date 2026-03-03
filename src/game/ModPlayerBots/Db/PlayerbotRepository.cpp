/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PlayerbotRepository.h"

#include <iostream>

#include "Playerbots.h"

void PlayerbotRepository::Load(PlayerbotAI* botAI)
{
    uint32 guid = botAI->GetBot()->GetGUIDLow();

    // vMaNGOS: Use PQuery instead of prepared statements
    std::unique_ptr<QueryResult> result = PlayerbotsDatabase.PQuery("SELECT key, value FROM playerbot_db_store WHERE guid = %u", guid);

    if (result)
    {
        std::vector<std::string> values;
        do
        {
            Field* fields = result->Fetch();
            std::string const key = fields[0].GetCppString();
            std::string const value = fields[1].GetCppString();

            if (key == "value")
                values.push_back(value);
            else if (key == "co")
            {
                botAI->ClearStrategies(BOT_STATE_COMBAT);
                botAI->ChangeStrategy("+chat", BOT_STATE_COMBAT);
                botAI->ChangeStrategy(value, BOT_STATE_COMBAT);
            }
            else if (key == "nc")
            {
                botAI->ClearStrategies(BOT_STATE_NON_COMBAT);
                botAI->ChangeStrategy("+chat", BOT_STATE_NON_COMBAT);
                botAI->ChangeStrategy(value, BOT_STATE_NON_COMBAT);
            }
            else if (key == "dead")
                botAI->ChangeStrategy(value, BOT_STATE_DEAD);
        } while (result->NextRow());

        botAI->GetAiObjectContext()->Load(values);
    }
}

void PlayerbotRepository::Save(PlayerbotAI* botAI)
{
    uint32 guid = botAI->GetBot()->GetGUIDLow();

    Reset(botAI);

    // vMaNGOS: Use PExecute instead of prepared statements
    PlayerbotsDatabase.PExecute("DELETE FROM playerbot_db_store WHERE guid = %u", guid);

    std::vector<std::string> data = botAI->GetAiObjectContext()->Save();
    for (std::vector<std::string>::iterator i = data.begin(); i != data.end(); ++i)
    {
        SaveValue(guid, "value", *i);
    }

    SaveValue(guid, "co", FormatStrategies("co", botAI->GetStrategies(BOT_STATE_COMBAT)));
    SaveValue(guid, "nc", FormatStrategies("nc", botAI->GetStrategies(BOT_STATE_NON_COMBAT)));
    SaveValue(guid, "dead", FormatStrategies("dead", botAI->GetStrategies(BOT_STATE_DEAD)));
}

std::string const PlayerbotRepository::FormatStrategies(std::string const type, std::vector<std::string> strategies)
{
    std::ostringstream out;
    for (std::vector<std::string>::iterator i = strategies.begin(); i != strategies.end(); ++i)
        out << "+" << (*i).c_str() << ",";

    std::string const res = out.str();
    return res.substr(0, res.size() - 1);
}

void PlayerbotRepository::Reset(PlayerbotAI* botAI)
{
    uint32 guid = botAI->GetBot()->GetGUIDLow();

    // vMaNGOS: Use PExecute instead of prepared statements
    PlayerbotsDatabase.PExecute("DELETE FROM playerbot_db_store WHERE guid = %u", guid);
}

void PlayerbotRepository::SaveValue(uint32 guid, std::string const key, std::string const value)
{
    // vMaNGOS: Use PExecute instead of prepared statements
    // Escape the key and value strings to prevent SQL injection
    std::string escapedKey = key;
    std::string escapedValue = value;
    PlayerbotsDatabase.PExecute("INSERT INTO playerbot_db_store (guid, key, value) VALUES (%u, '%s', '%s')",
                              guid, escapedKey.c_str(), escapedValue.c_str());
}
