/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "LogLevelAction.h"

#include "Event.h"
#include "PlayerbotAI.h"

bool LogLevelAction::Execute(Event /*event*/)
{
    botAI->TellMaster("Log level command is limited in this Vanilla compatibility build.");
    return true;
}

std::string const LogLevelAction::logLevel2string(LogLevel level)
{
    switch (level)
    {
        case LOG_LVL_DEBUG:
            return "debug";
        case LOG_LVL_DETAIL:
            return "detail";
        case LOG_LVL_BASIC:
            return "basic";
        case LOG_LVL_MINIMAL:
            return "minimal";
        case LOG_LVL_ERROR:
        default:
            return "error";
    }
}

LogLevel LogLevelAction::string2logLevel(std::string const level)
{
    if (level == "debug")
        return LOG_LVL_DEBUG;
    if (level == "detail")
        return LOG_LVL_DETAIL;
    if (level == "basic")
        return LOG_LVL_BASIC;
    if (level == "minimal")
        return LOG_LVL_MINIMAL;
    return LOG_LVL_ERROR;
}
