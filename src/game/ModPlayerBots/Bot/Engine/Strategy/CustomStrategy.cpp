/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "CustomStrategy.h"

#include <regex>
#include <stdexcept>

#include "Database/DatabaseEnv.h"
#include "Playerbots.h"

std::map<std::string, std::string> CustomStrategy::actionLinesCache;

NextAction toNextAction(std::string const action)
{
    std::vector<std::string> tokens = split(action, '!');

    if (tokens[0].empty())
        throw std::invalid_argument("Invalid action");

    if (tokens.size() == 2)
        return NextAction(tokens[0], atof(tokens[1].c_str()));

    if (tokens.size() == 1)
        return NextAction(tokens[0], ACTION_NORMAL);

    LOG_ERROR("playerbots", "Invalid action %s", action.c_str());

    throw std::invalid_argument("Invalid action");
}

std::vector<NextAction> toNextActionArray(const std::string actions)
{
    const std::vector<std::string> tokens = split(actions, ',');
    std::vector<NextAction> res = {};

    for (const std::string token : tokens)
    {
        res.push_back(toNextAction(token));
    }

    return res;
}

TriggerNode* toTriggerNode(std::string const actionLine)
{
    std::vector<std::string> tokens = split(actionLine, '>');
    if (tokens.size() == 2)
        return new TriggerNode(tokens[0], toNextActionArray(tokens[1]));

    LOG_ERROR("playerbots", "Invalid action line %s", actionLine.c_str());
    return nullptr;
}

CustomStrategy::CustomStrategy(PlayerbotAI* botAI) : Strategy(botAI), Qualified() {}

void CustomStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    if (actionLines.empty())
    {
        if (actionLinesCache[qualifier].empty())
            {
            LoadActionLines((uint32)botAI->GetBot()->GetGUIDLow());
            if (actionLines.empty())
                LoadActionLines(0);
        }
        else
        {
            std::vector<std::string> tokens = split(actionLinesCache[qualifier], '\n');
            std::regex tpl("\\(nullptr,\\s*'.+',\\s*'(.+)'\\)(,|;)");
            for (std::vector<std::string>::iterator i = tokens.begin(); i != tokens.end(); ++i)
            {
                std::string const line = *i;
                for (std::sregex_iterator j = std::sregex_iterator(line.begin(), line.end(), tpl);
                     j != std::sregex_iterator(); ++j)
                {
                    std::smatch match = *j;
                    std::string const actionLine = match[1].str();
                    if (!actionLine.empty())
                        actionLines.push_back(actionLine);
                }
            }
        }
    }

    for (std::vector<std::string>::iterator i = actionLines.begin(); i != actionLines.end(); ++i)
    {
        if (TriggerNode* tn = toTriggerNode(*i))
            triggers.push_back(tn);
    }
}

void CustomStrategy::LoadActionLines(uint32 owner)
{
    std::string qualifierEscaped = qualifier;
    CharacterDatabase.escape_string(qualifierEscaped);
    
    auto result = CharacterDatabase.PQuery(
        "SELECT action_line FROM playerbots_custom_strategy WHERE owner = %u AND name = '%s' ORDER BY idx",
        owner, qualifierEscaped.c_str());
    
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            std::string const action = fields[0].GetCppString();
            actionLines.push_back(action);
        } while (result->NextRow());
    }
}

void CustomStrategy::Reset()
{
    actionLines.clear();
    actionLinesCache[qualifier].clear();
}
