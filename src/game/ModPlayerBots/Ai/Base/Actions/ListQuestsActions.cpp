/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "ListQuestsActions.h"

#include "Event.h"

bool ListQuestsAction::Execute(Event /*event*/) { return false; }

void ListQuestsAction::ListQuests(QuestListFilter /*filter*/, QuestTravelDetail /*travelDetail*/) {}

uint32 ListQuestsAction::ListQuests(bool /*completed*/, bool /*silent*/, QuestTravelDetail /*travelDetail*/)
{
    return 0;
}
