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

class FindDeadTankPlayer : public FindDeadPlayer
{
public:
    FindDeadTankPlayer(PlayerbotAI* botAI, PartyMemberValue* value, bool mainTankOnly)
        : FindDeadPlayer(value), botAI(botAI), mainTankOnly(mainTankOnly)
    {
    }

    bool Check(Unit* unit) override
    {
        Player* player = unit->ToPlayer();
        if (!player || !FindDeadPlayer::Check(unit))
            return false;

        return mainTankOnly ? botAI->IsMainTank(player) : botAI->IsTank(player);
    }

private:
    PlayerbotAI* botAI;
    bool mainTankOnly;
};

Unit* PartyMemberToResurrect::Calculate()
{
    FindDeadPlayer finder(this);
    return FindPartyMember(finder);
}

Unit* ImportantPartyMemberToResurrect::Calculate()
{
    FindDeadTankPlayer deadMainTankFinder(botAI, this, true);
    if (Unit* target = FindPartyMember(deadMainTankFinder))
        return target;

    FindDeadTankPlayer deadTankFinder(botAI, this, false);
    return FindPartyMember(deadTankFinder);
}
