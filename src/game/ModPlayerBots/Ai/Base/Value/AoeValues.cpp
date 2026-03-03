/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "AoeValues.h"

#include "Playerbots.h"
#include "ServerFacade.h"
#include "SpellAuraEffects.h"

GuidVector FindMaxDensity(Player* bot)
{
    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    GuidVector units = *botAI->GetAiObjectContext()->GetValue<GuidVector>("possible targets");

    std::map<ObjectGuid, GuidVector> groups;
    uint32 maxCount = 0;
    ObjectGuid maxGroup;
    for (GuidVector::iterator i = units.begin(); i != units.end(); ++i)
    {
        Unit* unit = botAI->GetUnit(*i);
        if (!unit)
            continue;

        for (GuidVector::iterator j = units.begin(); j != units.end(); ++j)
        {
            Unit* other = botAI->GetUnit(*j);
            if (!other)
                continue;

            float d = ServerFacade::instance().GetDistance2d(unit, other);
            if (ServerFacade::instance().IsDistanceLessOrEqualThan(d, sPlayerbotAIConfig.aoeRadius * 2))
                groups[*i].push_back(*j);
        }

        if (maxCount < groups[*i].size())
        {
            maxCount = groups[*i].size();
            maxGroup = *i;
        }
    }

    if (!maxCount)
        return GuidVector();

    return groups[maxGroup];
}

WorldLocation AoePositionValue::Calculate()
{
    GuidVector group = FindMaxDensity(bot);
    if (group.empty())
        return WorldLocation();

    // Note: don't know where these values come from or even used.
    float x1 = 0.f;
    float y1 = 0.f;
    float x2 = 0.f;
    float y2 = 0.f;
    for (GuidVector::iterator i = group.begin(); i != group.end(); ++i)
    {
        Unit* unit = GET_PLAYERBOT_AI(bot)->GetUnit(*i);
        if (!unit)
            continue;

        if (i == group.begin() || x1 > unit->GetPositionX())
            x1 = unit->GetPositionX();

        if (i == group.begin() || x2 < unit->GetPositionX())
            x2 = unit->GetPositionX();

        if (i == group.begin() || y1 > unit->GetPositionY())
            y1 = unit->GetPositionY();

        if (i == group.begin() || y2 < unit->GetPositionY())
            y2 = unit->GetPositionY();
    }

    float x = (x1 + x2) / 2;
    float y = (y1 + y2) / 2;
    float z = bot->GetPositionZ() + CONTACT_DISTANCE;
    ;
    bot->UpdateAllowedPositionZ(x, y, z);
    return WorldLocation(bot->GetMapId(), x, y, z, 0);
}

uint8 AoeCountValue::Calculate() { return FindMaxDensity(bot).size(); }

bool HasAreaDebuffValue::Calculate()
{
    for (uint32 auraType = SPELL_AURA_BIND_SIGHT; auraType < TOTAL_AURAS; auraType++)
    {
        Unit::AuraList const& auras = botAI->GetBot()->GetAurasByType((AuraType)auraType);

        if (auras.empty())
            continue;

        for (Aura const* aura : auras)
        {
            SpellInfo const* proto = aura ? aura->GetSpellProto() : nullptr;

            if (!proto)
                continue;

            for (int j = 0; j < MAX_SPELL_EFFECTS; j++)
            {
                if (proto->Effect[j] == SPELL_EFFECT_TRIGGER_SPELL)
                {
                    uint32 trigger_spell_id = proto->EffectTriggerSpell[j];
                    if (trigger_spell_id == 29767)  // Overload
                    {
                        return true;
                    }
                }
            }

            if (!proto->IsPositiveSpell() && aura->IsPeriodic() && proto->HasAreaAuraEffect())
            {
                return true;
            }
        }
    }

    return false;
}

Aura* AreaDebuffValue::Calculate()
{
    Unit::AuraList const& aurasPeriodicDamage = bot->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
    Unit::AuraList const& aurasPeriodicDamagePercent = bot->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE_PERCENT);
    Unit::AuraList const& aurasPeriodicTriggerSpell = bot->GetAurasByType(SPELL_AURA_PERIODIC_TRIGGER_SPELL);
    Unit::AuraList const& aurasDummy = bot->GetAurasByType(SPELL_AURA_DUMMY);
    for (Unit::AuraList const* list : {&aurasPeriodicDamage, &aurasPeriodicDamagePercent, &aurasPeriodicTriggerSpell,
                                       &aurasDummy})
    {
        for (Aura* aura : *list)
        {
            if (!aura)
                continue;

            SpellInfo const* proto = aura->GetSpellProto();
            if (proto && !proto->IsPositiveSpell() && proto->HasAreaAuraEffect())
                return aura;
        }
    }
    return nullptr;
}
