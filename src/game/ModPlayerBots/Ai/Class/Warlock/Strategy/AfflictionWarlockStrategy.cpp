/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "AfflictionWarlockStrategy.h"
#include "Playerbots.h"

// ===== Action Node Factory =====
class AfflictionWarlockStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    AfflictionWarlockStrategyActionNodeFactory()
    {
        creators["corruption"] = &corruption;
        creators["corruption on attacker"] = &corruption;
        creators["curse of agony"] = &curse_of_agony;
        creators["siphon life"] = &siphon_life;
        creators["drain life"] = &drain_life;
        creators["shadow bolt"] = &shadow_bolt;
        creators["drain soul"] = &drain_soul;
        creators["life tap"] = &life_tap;
        creators["rain of fire"] = &rain_of_fire;
    }

private:
    static ActionNode* corruption(PlayerbotAI*) { return new ActionNode("corruption", {}, {}, {}); }
    static ActionNode* corruption_on_attacker(PlayerbotAI*) { return new ActionNode("corruption on attacker", {}, {}, {}); }
    static ActionNode* curse_of_agony(PlayerbotAI*) { return new ActionNode("curse of agony", {}, {}, {}); }
    static ActionNode* siphon_life(PlayerbotAI*) { return new ActionNode("siphon life", {}, {}, {}); }
    static ActionNode* drain_life(PlayerbotAI*) { return new ActionNode("drain life", {}, {}, {}); }
    static ActionNode* shadow_bolt(PlayerbotAI*) { return new ActionNode("shadow bolt", {}, {}, {}); }
    static ActionNode* drain_soul(PlayerbotAI*) { return new ActionNode("drain soul", {}, {}, {}); }
    static ActionNode* life_tap(PlayerbotAI*) { return new ActionNode("life tap", {}, {}, {}); }
    static ActionNode* rain_of_fire(PlayerbotAI*) { return new ActionNode("rain of fire", {}, {}, {}); }
};

// ===== Single Target Strategy =====
AfflictionWarlockStrategy::AfflictionWarlockStrategy(PlayerbotAI* botAI) : GenericWarlockStrategy(botAI)
{
    actionNodeFactories.Add(new AfflictionWarlockStrategyActionNodeFactory());
}

// ===== Default Actions =====
std::vector<NextAction> AfflictionWarlockStrategy::getDefaultActions()
{
    return {
       NextAction("corruption", 5.5f),
       NextAction("curse of agony", 5.4f),
       NextAction("siphon life", 5.3f),
       NextAction("shadow bolt", 5.2f),
       NextAction("drain life", 5.1f),
       NextAction("shoot", 5.0f)
    };
}

// ===== Trigger Initialization ===
void AfflictionWarlockStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    GenericWarlockStrategy::InitTriggers(triggers);

    // Main DoT triggers for high uptime
    triggers.push_back(
        new TriggerNode(
            "corruption on attacker",
            {
                NextAction("corruption on attacker", 19.5f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "corruption",
            {
                NextAction("corruption", 18.0f)
            }
        )
    );

    // Drain Soul as execute if target is low HP // Shadow Trance for free casts
    triggers.push_back(
        new TriggerNode(
            "shadow trance",
            {
                NextAction("shadow bolt", 16.0f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "target critical health",
            {
                NextAction("drain soul", 15.5f)
            }
        )
    );

    // Life Tap as filler
    triggers.push_back(
        new TriggerNode(
            "life tap",
            {
                NextAction("life tap", 5.1f)
            }
        )
    );

    triggers.push_back(
        new TriggerNode(
            "enemy too close for spell",
            {
                NextAction("flee", 39.0f)
            }
        )
    );
}
