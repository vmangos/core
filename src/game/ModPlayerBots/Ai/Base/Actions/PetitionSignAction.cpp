/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PetitionSignAction.h"

#include "ArenaTeam.h"
#include "Event.h"
#include "Playerbots.h"

bool PetitionSignAction::Execute(Event event)
{
    WorldPacket p(event.getPacket());
    p.rpos(0);
    ObjectGuid petitionGuid;
    ObjectGuid inviter;
    uint8 unk = 0;
    bool isArena = false;
    p >> petitionGuid >> inviter;

    std::ostringstream query;
    query << "SELECT `type` FROM `petition` WHERE `petitionguid` = " << petitionGuid.GetCounter();
    std::unique_ptr<QueryResult> result = CharacterDatabase.Query(query.str());
    if (!result)
    {
        return false;
    }

    Field* fields = result->Fetch();
    uint32 type = fields[0].GetUInt32();

    bool accept = true;

#if PB_HAS_ARENA_TEAMS
    if (type != 9)
    {
        isArena = true;
        uint8 slot = ArenaTeam::GetSlotByType(ArenaType(type));
        if (bot->GetArenaTeamId(slot))
        {
            // player is already in an arena team
            botAI->TellError("Sorry, I am already in such team");
            accept = false;
        }
    }
#else
    if (type != 9)
    {
        return false;
    }
#endif
    else
    {
        if (bot->GetGuildId())
        {
            botAI->TellError("Sorry, I am in a guild already");
            accept = false;
        }

        if (bot->GetGuildIdInvited())
        {
            botAI->TellError("Sorry, I am invited to a guild already");
            accept = false;
        }

        // check for same acc id
        /*if (QueryResult* result = CharacterDatabase.Query("SELECT playerguid FROM petition_sign WHERE player_account =
        {} AND petitionguid = {}'", bot->GetSession()->GetAccountId(), petitionGuid.GetCounter()))
        {
            botAI->TellError("Sorry, I already signed this pettition");
            accept = false;
        }
        */
    }

    Player* _inviter = ObjectAccessor::FindPlayer(inviter);
    if (!_inviter)
        return false;

    if (_inviter == bot)
        return false;

    if (!accept || !botAI->GetSecurity()->CheckLevelFor(PLAYERBOT_SECURITY_INVITE, false, _inviter, true))
    {
        WorldPacket data(MSG_PETITION_DECLINE);
        data << petitionGuid;
        bot->GetSession()->HandlePetitionDeclineOpcode(data);
        LOG_INFO("playerbots", "Bot <%s> declines %s invite", bot->GetName(), isArena ? "Arena" : "Guild");
        return false;
    }

    if (accept)
    {
        WorldPacket data(CMSG_PETITION_SIGN, 20);
        data << petitionGuid << unk;
        bot->GetSession()->HandlePetitionSignOpcode(data);
        bot->Say("Thanks for the invite!", LANG_UNIVERSAL);
        LOG_INFO("playerbots", "Bot <%s> accepts %s invite", bot->GetName(), isArena ? "Arena" : "Guild");
        return true;
    }

    return false;
}
