/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "TellPvpStatsAction.h"

#include <map>

#include "ArenaTeam.h"
#include "ArenaTeamMgr.h"
#include "Event.h"
#include "Player.h"
#include "PlayerbotAI.h"
#include "PlayerbotTextMgr.h"
#include "Playerbots.h"
#include "SharedDefines.h"
#include "Language.h"

namespace
{
    inline char const* BracketName(uint8 slot)
    {
        switch (slot)
        {
            default:             return "5v5";
        }
    }
}

bool TellPvpStatsAction::Execute(Event event)
{
    if (!bot)
        return false;

    // Prefer to actual chat sender (whisper / say / etc.) if available.
    Player* requester = nullptr;

    if (Unit* owner = event.getOwner())
        requester = owner->ToPlayer();

    // Fallback to master if event owner is not available.
    if (!requester)
        requester = GetMaster();

    // If we still do not have a valid player to answer to, bail out.
    if (!requester)
        return false;

    botAI->TellMaster("Arena and Honor points are not available in Vanilla (WoW 1.12)");
    return true;

#if PB_HAS_ARENA_TEAMS
    // Arena Teams by slot
    bool anyTeam = false;
    for (uint8 slot = 0; slot < MAX_ARENA_SLOT; ++slot)
    {
        uint32 const teamId = bot->GetArenaTeamId(slot);
        if (!teamId)
            continue;

        if (ArenaTeam* team = sArenaTeamMgr->GetArenaTeamById(teamId))
        {
            anyTeam = true;
            std::map<std::string, std::string> placeholders;
            placeholders["%bracket"] = BracketName(slot);
            placeholders["%team_name"] = team->GetName();
            placeholders["%team_rating"] = std::to_string(team->GetRating());

            std::string const teamText = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pvp_arena_team",
                "[PVP] %bracket: <%team_name> (rating %team_rating)",
                placeholders);

            bot->Whisper(teamText, LANG_UNIVERSAL, requester);
        }
    }

    if (!anyTeam)
    {
        std::string const noTeamText = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pvp_no_arena_team",
            "[PVP] I have no Arena Team.",
            std::map<std::string, std::string>());

        bot->Whisper(noTeamText, LANG_UNIVERSAL, requester);
    }
#endif

    return true;
}
