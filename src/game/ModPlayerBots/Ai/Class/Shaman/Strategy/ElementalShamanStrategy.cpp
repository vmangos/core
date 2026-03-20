/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "ElementalShamanStrategy.h"

#include "Playerbots.h"

// ===== Action Node Factory =====
class ElementalShamanStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    ElementalShamanStrategyActionNodeFactory()
    {
        creators["flame shock"] = &flame_shock;
        creators["earth shock"] = &earth_shock;
        creators["chain lightning"] = &chain_lightning;
        creators["lightning bolt"] = &lightning_bolt;
        creators["elemental mastery"] = &elemental_mastery;
        creators["stoneclaw totem"] = &stoneclaw_totem;
    }

private:
    static ActionNode* flame_shock(PlayerbotAI*) { return new ActionNode("flame shock", {}, {}, {}); }
    static ActionNode* earth_shock(PlayerbotAI*) { return new ActionNode("earth shock", {}, {}, {}); }
    static ActionNode* chain_lightning(PlayerbotAI*) { return new ActionNode("chain lightning", {}, {}, {}); }
    static ActionNode* lightning_bolt(PlayerbotAI*) { return new ActionNode("lightning bolt", {}, {}, {}); }
    static ActionNode* elemental_mastery(PlayerbotAI*) { return new ActionNode("elemental mastery", {}, {}, {}); }
    static ActionNode* stoneclaw_totem(PlayerbotAI*) { return new ActionNode("stoneclaw totem", {}, {}, {}); }
};

// ===== Single Target Strategy =====
ElementalShamanStrategy::ElementalShamanStrategy(PlayerbotAI* botAI) : GenericShamanStrategy(botAI)
{
    actionNodeFactories.Add(new ElementalShamanStrategyActionNodeFactory());
}

// ===== Default Actions =====
std::vector<NextAction> ElementalShamanStrategy::getDefaultActions()
{
    return {
        NextAction("chain lightning", 5.3f),
        NextAction("lightning bolt", 5.1f),
        NextAction("earth shock", 5.0f)
    };
}

// ===== Trigger Initialization ===
void ElementalShamanStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    GenericShamanStrategy::InitTriggers(triggers);

    // Defensive Triggers
    triggers.push_back(
        new TriggerNode(
            "low health",
            {
                NextAction("stoneclaw totem", 40.0f)
            }
        )
    );

    // Cooldown Trigger
    triggers.push_back(
        new TriggerNode(
            "elemental mastery",
            {
                NextAction("elemental mastery", 29.0f)
            }
        )
    );

    // Damage Triggers
    triggers.push_back(
        new TriggerNode(
            "earth shock execute",
            {
                NextAction("earth shock", 5.5f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "flame shock",
            {
                NextAction("flame shock", 5.3f)
            }
        )
    );

    // Range Triggers
    triggers.push_back(
        new TriggerNode(
            "enemy too close for spell",
            {
                NextAction("flee", 39.0f)
            }
        )
    );
}
