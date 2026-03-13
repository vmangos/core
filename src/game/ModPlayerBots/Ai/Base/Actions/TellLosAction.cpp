/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "TellLosAction.h"
#include <istream>
#include <sstream>

#include "ChatHelper.h"
#include "DBCStores.h"
#include "Event.h"
#include "ItemTemplate.h"
#include "ObjectMgr.h"
#include "Playerbots.h"
#include "StatsWeightCalculator.h"
#include "World.h"

bool TellLosAction::Execute(Event event)
{
    std::string const param = event.getParam();

    if (param.empty() || param == "targets")
    {
        ListUnits("--- Targets ---", *context->GetValue<GuidVector>("possible targets"));
        ListUnits("--- Targets (All) ---", *context->GetValue<GuidVector>("all targets"));
    }

    if (param.empty() || param == "npcs")
    {
        ListUnits("--- NPCs ---", *context->GetValue<GuidVector>("nearest npcs"));
    }

    if (param.empty() || param == "corpses")
    {
        ListUnits("--- Corpses ---", *context->GetValue<GuidVector>("nearest corpses"));
    }

    if (param.empty() || param == "gos" || param == "game objects")
    {
        ListGameObjects("--- Game objects ---", *context->GetValue<GuidVector>("nearest game objects"));
    }

    if (param.empty() || param == "players")
    {
        ListUnits("--- Friendly players ---", *context->GetValue<GuidVector>("nearest friendly players"));
    }

    if (param.empty() || param == "triggers")
    {
        ListUnits("--- Triggers ---", *context->GetValue<GuidVector>("possible triggers"));
    }

    return true;
}

void TellLosAction::ListUnits(std::string const title, GuidVector units)
{
    Player* viewer = botAI->GetActiveMaster() ? botAI->GetActiveMaster() : botAI->GetMaster();
    botAI->TellMaster(title);

    for (ObjectGuid const guid : units)
    {
        if (Unit* unit = botAI->GetUnit(guid))
        {
            botAI->TellMaster(unit->GetNameForLocaleIdx(viewer && viewer->GetSession() ? viewer->GetSession()->GetSessionDbLocaleIndex() : -1));
        }
    }
}
void TellLosAction::ListGameObjects(std::string const title, GuidVector gos)
{
    Player* viewer = botAI->GetActiveMaster() ? botAI->GetActiveMaster() : botAI->GetMaster();
    botAI->TellMaster(title);

    for (ObjectGuid const guid : gos)
    {
        if (GameObject* go = botAI->GetGameObject(guid))
            botAI->TellMaster(chat->FormatGameobject(go, viewer));
    }
}

bool TellAuraAction::Execute(Event event)
{
    botAI->TellMaster("--- Auras ---");
    Unit::SpellAuraHolderMap& map = bot->GetSpellAuraHolderMap();
    for (Unit::SpellAuraHolderMap::iterator i = map.begin(); i != map.end(); ++i)
    {
        SpellAuraHolder* holder = i->second;
        if (!holder)
            continue;

        // vMaNGOS Vanilla compatibility - use SpellEntry instead of SpellInfo
        SpellEntry const* spellEntry = holder->GetSpellProto();
        if (!spellEntry)
            continue;

        const std::string auraName = spellEntry->SpellName[0];

        WorldObject* owner = holder->GetCaster();
        std::string owner_name = owner ? owner->GetName() : "unknown";
        float distance = bot->GetDistance2d(owner);

        Unit* caster = holder->GetCaster();
        std::string caster_name = caster ? caster->GetName() : "unknown";

        bool is_area = holder->IsAreaAura();
        int32 duration = holder->GetAuraDuration();
        int32 spellId = spellEntry->Id;
        bool isPositive = Spells::IsPositiveSpell(spellId, caster, bot);

        botAI->TellMaster("Info of Aura - name: " + auraName + " caster: " + caster_name +
                           " owner: " + owner_name + " distance: " + std::to_string(distance) +
                           " isArea: " + std::to_string(is_area) + " duration: " + std::to_string(duration) +
                           " spellId: " + std::to_string(spellId) + " isPositive: " + std::to_string(isPositive));

        // DYNOBJ_AURA_TYPE doesn't exist in Vanilla, skip dynamic object handling
        // if (type == DYNOBJ_AURA_TYPE) ...
    }
    return true;
}

bool TellEstimatedDpsAction::Execute(Event event)
{
    float dps = AI_VALUE(float, "estimated group dps");
    botAI->TellMaster("Estimated Group DPS: " + std::to_string(dps));
    return true;
}

bool TellCalculateItemAction::Execute(Event event)
{
    std::string const text = event.getParam();
    ItemWithRandomProperty item = chat->parseItemWithRandomProperty(text);
    StatsWeightCalculator calculator(bot);

    const ItemTemplate* proto = sObjectMgr.GetItemTemplate(item.itemId);
    if (!proto)
        return false;
    float score = calculator.CalculateItem(item.itemId, item.randomPropertyId);

    std::ostringstream out;
    out << "Calculated score of " << chat->FormatItem(proto) << " : " << score;
    botAI->TellMasterNoFacing(out.str());
    return true;
}
