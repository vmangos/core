/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "FrostMageStrategy.h"

#include "Playerbots.h"

// ===== Action Node Factory =====
class FrostMageStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    FrostMageStrategyActionNodeFactory()
    {
        creators["cold snap"] = &cold_snap;
        creators["ice barrier"] = &ice_barrier;
        creators["frostbolt"] = &frostbolt;
        creators["fire blast"] = &fire_blast;
        creators["fireball"] = &fireball;
    }

private:
    static ActionNode* cold_snap(PlayerbotAI*) { return new ActionNode("cold snap", {}, {}, {}); }
    static ActionNode* ice_barrier(PlayerbotAI*) { return new ActionNode("ice barrier", {}, {}, {}); }
    static ActionNode* frostbolt(PlayerbotAI*) { return new ActionNode("frostbolt", {}, {}, {}); }
    static ActionNode* fire_blast(PlayerbotAI*) { return new ActionNode("fire blast", {}, {}, {}); }
    static ActionNode* fireball(PlayerbotAI*) { return new ActionNode("fireball", {}, {}, {}); }
};

// ===== Single Target Strategy =====
FrostMageStrategy::FrostMageStrategy(PlayerbotAI* botAI) : GenericMageStrategy(botAI)
{
    actionNodeFactories.Add(new FrostMageStrategyActionNodeFactory());
}

// ===== Default Actions =====
std::vector<NextAction> FrostMageStrategy::getDefaultActions()
{
    return {
        NextAction("frostbolt", 5.4f),
        NextAction("fire blast", 5.2f),
        NextAction("shoot", 5.1f),
        NextAction("fireball", 5.0f)
    };
}

// ===== Trigger Initialization ===
void FrostMageStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    GenericMageStrategy::InitTriggers(triggers);

    // Defensive triggers
    triggers.push_back(
        new TriggerNode(
            "medium health",
            {
                NextAction("ice barrier", 29.0f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "being attacked",
            {
                NextAction("ice barrier", 29.0f)
            }
        )
    );

    // Frozen target triggers (shatter combo)
    triggers.push_back(
        new TriggerNode(
            "frostbite on target",
            {
                NextAction("frostbolt", 19.0f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "frost nova on target",
            {
                NextAction("frostbolt", 19.0f)
            }
        )
    );
}
