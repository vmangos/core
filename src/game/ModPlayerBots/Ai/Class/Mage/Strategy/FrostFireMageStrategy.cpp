/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "FrostFireMageStrategy.h"
#include "Playerbots.h"

// ===== Action Node Factory =====
// Note: Frostfire Bolt doesn't exist in vanilla 1.12. This strategy uses Frostbolt as filler (behaves like Frost).
class FrostFireMageStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    FrostFireMageStrategyActionNodeFactory()
    {
        creators["frostbolt"] = &frostbolt;
        creators["fire blast"] = &fire_blast;
        creators["fireball"] = &fireball;
    }

private:
    static ActionNode* frostbolt(PlayerbotAI*) { return new ActionNode("frostbolt", {}, {}, {}); }
    static ActionNode* fire_blast(PlayerbotAI*) { return new ActionNode("fire blast", {}, {}, {}); }
    static ActionNode* fireball(PlayerbotAI*) { return new ActionNode("fireball", {}, {}, {}); }
};

// ===== Single Target Strategy =====
FrostFireMageStrategy::FrostFireMageStrategy(PlayerbotAI* botAI) : GenericMageStrategy(botAI)
{
    actionNodeFactories.Add(new FrostFireMageStrategyActionNodeFactory());
}

// ===== Default Actions =====
std::vector<NextAction> FrostFireMageStrategy::getDefaultActions()
{
    return {
        NextAction("frostbolt", 5.4f),
        NextAction("fire blast", 5.2f),
        NextAction("shoot", 5.1f),
        NextAction("fireball", 5.0f)
    };
}

// ===== Trigger Initialization =====
void FrostFireMageStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    GenericMageStrategy::InitTriggers(triggers);
}
