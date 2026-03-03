/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "NearestNonBotPlayersValue.h"

#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Playerbots.h"

void NearestNonBotPlayersValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnitInObjectRangeCheck u_check(bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool NearestNonBotPlayersValue::AcceptUnit(Unit* unit)
{
    ObjectGuid guid = unit->GetObjectGuid();
    return guid.IsPlayer() && !GET_PLAYERBOT_AI(((Player*)unit)) &&
           (!((Player*)unit)->IsGameMaster() || ((Player*)unit)->IsGMVisible());
}
