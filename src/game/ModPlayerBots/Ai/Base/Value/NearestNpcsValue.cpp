/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "NearestNpcsValue.h"

#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Playerbots.h"
#include "Vehicle.h"

void NearestNpcsValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnitInObjectRangeCheck u_check(bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool NearestNpcsValue::AcceptUnit(Unit* unit) { return !unit->IsPlayer(); }

void NearestHostileNpcsValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnitInObjectRangeCheck u_check(bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool NearestHostileNpcsValue::AcceptUnit(Unit* unit)
{
    if (!unit || !unit->IsInWorld() || unit->IsDuringRemoveFromWorld())
        return false;

    if (unit->IsPlayer())
        return false;

    return unit->IsHostileTo(bot);
}

void NearestVehiclesValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnitInObjectRangeCheck u_check(bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool NearestVehiclesValue::AcceptUnit(Unit* unit)
{
    // Vanilla doesn't have vehicles - always return false
    return false;
}

void NearestTriggersValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(bot, bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool NearestTriggersValue::AcceptUnit(Unit* unit) { return !unit->IsPlayer(); }

void NearestTotemsValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnitInObjectRangeCheck u_check(bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool NearestTotemsValue::AcceptUnit(Unit* unit)
{
    if (!unit || unit->GetTypeId() != TYPEID_UNIT)
        return false;
    Creature* creature = (Creature*)unit;
    return creature->IsTotem();
}
