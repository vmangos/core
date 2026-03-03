/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "ListSpellsAction.h"

#include "Event.h"

bool ListSpellsAction::Execute(Event /*event*/) { return false; }

std::vector<std::pair<uint32, std::string>> ListSpellsAction::GetSpellList(std::string /*filter*/)
{
    return std::vector<std::pair<uint32, std::string>>();
}

void ListSpellsAction::InitSpellCaches() {}
