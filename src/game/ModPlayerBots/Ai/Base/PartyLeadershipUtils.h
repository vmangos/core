#ifndef _PLAYERBOT_PARTYLEADERSHIPUTILS_H
#define _PLAYERBOT_PARTYLEADERSHIPUTILS_H

#include "Playerbots.h"

class Player;
class PlayerbotAI;

namespace PartyLeadership
{
inline bool IsActiveRealPlayer(Player* player)
{
    if (!player || !player->IsInWorld() || player->IsDuringRemoveFromWorld())
        return false;

    PlayerbotAI* playerAI = GET_PLAYERBOT_AI(player);
    return !playerAI || playerAI->IsRealPlayer();
}

inline bool IsEligibleRandombotPartyLeader(PlayerbotAI* botAI)
{
    if (!botAI)
        return false;

    Player* bot = botAI->GetBot();
    Group* group = bot ? bot->GetGroup() : nullptr;
    if (!bot || !group)
        return false;

    if (!sRandomPlayerbotMgr.IsRandomBot(bot))
        return false;

    if (botAI->IsRealPlayer() || botAI->IsAlt())
        return false;

    if (!group->IsLeader(bot->GetObjectGuid()))
        return false;

    if (group->isRaidGroup() || group->isBGGroup() || group->isLFGGroup())
        return false;

    return true;
}

inline bool HasActiveRealPlayerInGroup(Player* bot)
{
    Group* group = bot ? bot->GetGroup() : nullptr;
    if (!bot || !group)
        return false;

    for (GroupReference* gref = group->GetFirstMember(); gref; gref = gref->next())
    {
        Player* member = gref->GetSource();
        if (!member || !member->IsInSameRaidWith(bot))
            continue;

        if (IsActiveRealPlayer(member))
            return true;
    }

    return false;
}
}

#endif
