/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "GenericShamanStrategy.h"
#include "Playerbots.h"
#include "Strategy.h"
#include "Bot/Factory/AiFactory.h"

class GenericShamanStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    GenericShamanStrategyActionNodeFactory()
    {
        creators["flametongue totem"] = &flametongue_totem;
        creators["magma totem"] = &magma_totem;
        creators["searing totem"] = &searing_totem;
        creators["strength of earth totem"] = &strength_of_earth_totem;
        creators["stoneskin totem"] = &stoneskin_totem;
        creators["cleansing totem"] = &cleansing_totem;
        creators["mana spring totem"] = &mana_spring_totem;
        creators["healing stream totem"] = &healing_stream_totem;
        creators["grace of air totem"] = &grace_of_air_totem;
        creators["windfury totem"] = &windfury_totem;
        creators["grounding totem"] = &grounding_totem;
        creators["purge"] = &purge;
    }

private:
    // Passthrough totems are set up so lower level shamans will still cast totems.
    // Flametongue Totem -> Searing Totem
    // Magma Totem -> Searing Totem
    // Strength of Earth Totem -> Stoneskin Totem
    // Cleansing Totem -> Mana Spring Totem
    // Grace of Air Totem -> Windfury Totem -> Grounding Totem

    static ActionNode* flametongue_totem([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("flametongue totem",
                              /*P*/ {},
                              /*A*/ { NextAction("searing totem") },
                              /*C*/ {});
    }
    static ActionNode* magma_totem([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("magma totem",
                              /*P*/ {},
                              /*A*/ { NextAction("searing totem") },
                              /*C*/ {});
    }
    static ActionNode* searing_totem(PlayerbotAI*) { return new ActionNode("searing totem", {}, {}, {}); }
    static ActionNode* strength_of_earth_totem([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("strength of earth totem",
                              /*P*/ {},
                              /*A*/ { NextAction("stoneskin totem") },
                              /*C*/ {});
    }
    static ActionNode* stoneskin_totem(PlayerbotAI*) { return new ActionNode("stoneskin totem", {}, {}, {}); }
    static ActionNode* cleansing_totem([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("cleansing totem",
                              /*P*/ {},
                              /*A*/ { NextAction("mana spring totem") },
                              /*C*/ {});
    }
    static ActionNode* mana_spring_totem(PlayerbotAI*) { return new ActionNode("mana spring totem", {}, {}, {}); }
    static ActionNode* healing_stream_totem(PlayerbotAI*) { return new ActionNode("healing stream totem", {}, {}, {}); }
    static ActionNode* grace_of_air_totem([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("grace of air totem",
                              /*P*/ {},
                              /*A*/ { NextAction("windfury totem") },
                              /*C*/ {});
    }
    static ActionNode* windfury_totem([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("windfury totem",
                              /*P*/ {},
                              /*A*/ { NextAction("grounding totem") },
                              /*C*/ {});
    }
    static ActionNode* grounding_totem(PlayerbotAI*) { return new ActionNode("grounding totem", {}, {}, {}); }
    static ActionNode* purge(PlayerbotAI*) { return new ActionNode("purge", {}, {}, {}); }
};

GenericShamanStrategy::GenericShamanStrategy(PlayerbotAI* botAI) : CombatStrategy(botAI)
{
    actionNodeFactories.Add(new GenericShamanStrategyActionNodeFactory());
}

void GenericShamanStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    CombatStrategy::InitTriggers(triggers);

    triggers.push_back(new TriggerNode("purge", { NextAction("purge", ACTION_DISPEL), }));
    triggers.push_back(new TriggerNode("medium mana", { NextAction("mana potion", ACTION_DISPEL), }));
}

void ShamanCureStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    triggers.push_back(new TriggerNode("cure poison", { NextAction("cure poison", 21.0f), }));
    triggers.push_back(new TriggerNode("party member cure poison", { NextAction("cure poison on party", 21.0f), }));
    triggers.push_back(new TriggerNode("cure disease", { NextAction("cure disease", 31.0f), }));
    triggers.push_back(new TriggerNode("party member cure disease", { NextAction("cure disease on party", 30.0f), }));
}

void ShamanBoostStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    // No boost abilities available in vanilla 1.12
    // (Heroism/Bloodlust and Fire Elemental Totem are TBC+)
}

void ShamanAoeStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{

    Player* bot = botAI->GetBot();
    int tab = AiFactory::GetPlayerSpecTab(bot);

    if (tab == 0)  // Elemental
    {
        triggers.push_back(new TriggerNode("medium aoe",{ NextAction("fire nova totem", 23.0f), }));
        triggers.push_back(new TriggerNode("chain lightning no cd", { NextAction("chain lightning", 5.6f), }));
    }
    else if (tab == 1)  // Enhancement
    {
        triggers.push_back(new TriggerNode("medium aoe",{
                                                    NextAction("magma totem", 24.0f),
                                                    NextAction("fire nova totem", 23.0f), }));
    }
    else if (tab == 2)  // Restoration
    {
        // Handled by "Healer DPS" Strategy
    }
}
