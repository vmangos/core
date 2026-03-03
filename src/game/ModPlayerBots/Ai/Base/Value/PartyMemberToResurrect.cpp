/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PartyMemberToResurrect.h"

#include "Playerbots.h"

class IsTargetOfResurrectSpell : public SpellEntryPredicate
{
public:
    bool Check(SpellEntry const* spellInfo) override
    {
        for (uint8 i = 0; i < 3; ++i)
        {
            if (spellInfo->Effect[i] == SPELL_EFFECT_RESURRECT ||
                spellInfo->Effect[i] == SPELL_EFFECT_RESURRECT_NEW ||
                spellInfo->Effect[i] == SPELL_EFFECT_SELF_RESURRECT)
                return true;
        }

        return false;
    }
};

class FindDeadPlayer : public FindPlayerPredicate
{
public:
    FindDeadPlayer(PartyMemberValue* value) : value(value) {}

    bool Check(Unit* unit) override
    {
        Player* player = unit->ToPlayer();
        return player && !player->IsRessurectRequested() && player->GetDeathState() == CORPSE &&
               !value->IsTargetOfSpellCast(player, predicate);
    }

private:
    PartyMemberValue* value;
    IsTargetOfResurrectSpell predicate;
};

Unit* PartyMemberToResurrect::Calculate()
{
    FindDeadPlayer finder(this);
    return FindPartyMember(finder);
}
