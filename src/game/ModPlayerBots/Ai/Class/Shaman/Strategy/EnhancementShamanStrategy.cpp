/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "EnhancementShamanStrategy.h"

#include "Playerbots.h"

// ===== Action Node Factory =====
class EnhancementShamanStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    EnhancementShamanStrategyActionNodeFactory()
    {
        creators["stormstrike"] = &stormstrike;
        creators["lightning bolt"] = &lightning_bolt;
        creators["earth shock"] = &earth_shock;
        creators["flame shock"] = &flame_shock;
        creators["lightning shield"] = &lightning_shield;
    }

private:
    static ActionNode* stormstrike(PlayerbotAI*) { return new ActionNode("stormstrike", {}, {}, {}); }
    static ActionNode* lightning_bolt(PlayerbotAI*) { return new ActionNode("lightning bolt", {}, {}, {}); }
    static ActionNode* earth_shock(PlayerbotAI*) { return new ActionNode("earth shock", {}, {}, {}); }
    static ActionNode* flame_shock(PlayerbotAI*) { return new ActionNode("flame shock", {}, {}, {}); }
    static ActionNode* lightning_shield(PlayerbotAI*) { return new ActionNode("lightning shield", {}, {}, {}); }
};

// ===== Single Target Strategy =====
EnhancementShamanStrategy::EnhancementShamanStrategy(PlayerbotAI* botAI) : GenericShamanStrategy(botAI)
{
    actionNodeFactories.Add(new EnhancementShamanStrategyActionNodeFactory());
}

// ===== Default Actions =====
std::vector<NextAction> EnhancementShamanStrategy::getDefaultActions()
{
    return {
       NextAction("stormstrike", 5.5f),
       NextAction("earth shock", 5.3f),
       NextAction("melee", 5.0f)
    };
}

// ===== Trigger Initialization ===
void EnhancementShamanStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    GenericShamanStrategy::InitTriggers(triggers);

    // Damage Triggers
    triggers.push_back(
        new TriggerNode(
            "enemy out of melee",
            {
                NextAction("reach melee", 40.0f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "flame shock",
            {
                NextAction("flame shock", 19.0f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "lightning shield",
            {
                NextAction("lightning shield", 18.5f)
            }
        )
    );
}
