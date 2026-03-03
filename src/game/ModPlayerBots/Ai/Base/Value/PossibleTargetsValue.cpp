/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PossibleTargetsValue.h"

#include "AttackersValue.h"
#include "CellImpl.h"
#include "DBCStructure.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Playerbots.h"
#include "SharedDefines.h"
#include "SpellAuraDefines.h"
#include "SpellAuraEffects.h"
#include "SpellMgr.h"
#include "Unit.h"

void PossibleTargetsValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(bot, bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool PossibleTargetsValue::AcceptUnit(Unit* unit) { return AttackersValue::IsPossibleTarget(unit, bot, range); }

void PossibleTriggersValue::FindUnits(std::list<Unit*>& targets)
{
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(bot, bot, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(bot, searcher, range);
}

bool PossibleTriggersValue::AcceptUnit(Unit* unit)
{
    if (!unit->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE))
    {
        return false;
    }
    Unit::AuraList const& aurasPeriodicTriggerSpell =
        unit->GetAurasByType(SPELL_AURA_PERIODIC_TRIGGER_SPELL);
    for (auto i = aurasPeriodicTriggerSpell.begin(); i != aurasPeriodicTriggerSpell.end(); ++i)
    {
        Aura* aur = *i;
        const SpellEntry* spellInfo = aur->GetSpellProto();
        if (!spellInfo)
            continue;
        for (int j = 0; j < MAX_SPELL_EFFECTS; j++)
        {
            if (spellInfo->Effect[j] == SPELL_EFFECT_TRIGGER_SPELL)
            {
                const SpellEntry* triggerSpellInfo = sSpellMgr.GetSpellEntry(spellInfo->EffectTriggerSpell[j]);
                if (!triggerSpellInfo)
                    continue;
                for (int k = 0; k < MAX_SPELL_EFFECTS; k++)
                {
                    if (triggerSpellInfo->Effect[k] == SPELL_EFFECT_SCHOOL_DAMAGE)
                    {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
