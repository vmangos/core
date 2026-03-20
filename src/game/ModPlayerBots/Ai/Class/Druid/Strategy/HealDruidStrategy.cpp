/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "HealDruidStrategy.h"

#include "Playerbots.h"

class HealDruidStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    HealDruidStrategyActionNodeFactory() {}
};

HealDruidStrategy::HealDruidStrategy(PlayerbotAI* botAI) : GenericDruidStrategy(botAI)
{
    actionNodeFactories.Add(new HealDruidStrategyActionNodeFactory());
}

std::vector<NextAction> HealDruidStrategy::getDefaultActions()
{
    return {
        NextAction("healing touch", ACTION_NORMAL + 0.3f),
        NextAction("rejuvenation", ACTION_NORMAL + 0.2f),
        NextAction("regrowth", ACTION_NORMAL + 0.1f),
    };
}

void HealDruidStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    GenericDruidStrategy::InitTriggers(triggers);

    triggers.push_back(new TriggerNode(
        "party member to heal out of spell range",
        { NextAction("reach party member to heal", ACTION_CRITICAL_HEAL + 9) }));

    // CRITICAL
    triggers.push_back(
        new TriggerNode("party member critical health",
                        {
                                          NextAction("swiftmend on party", ACTION_CRITICAL_HEAL + 4),
                                          NextAction("regrowth on party", ACTION_CRITICAL_HEAL + 3),
                                          NextAction("rejuvenation on party", ACTION_CRITICAL_HEAL + 2),
                                          NextAction("healing touch on party", ACTION_CRITICAL_HEAL + 1),
                                          }));

    triggers.push_back(
        new TriggerNode("party member critical health",
                        { NextAction("nature's swiftness", ACTION_CRITICAL_HEAL + 4) }));

    triggers.push_back(new TriggerNode(
        "group heal setting",
        {
                          NextAction("rejuvenation on not full", ACTION_MEDIUM_HEAL + 2.2f),
                          NextAction("regrowth on party", ACTION_MEDIUM_HEAL + 2.1f),
                          }));

    triggers.push_back(
        new TriggerNode("medium group heal setting",
                        {
                        NextAction("tranquility", ACTION_CRITICAL_HEAL + 0.5f) }));

    // LOW
    triggers.push_back(
        new TriggerNode("party member low health",
                        {
                                          NextAction("regrowth on party", ACTION_MEDIUM_HEAL + 1.4f),
                                          NextAction("swiftmend on party", ACTION_MEDIUM_HEAL + 1.3f),
                                          NextAction("rejuvenation on party", ACTION_MEDIUM_HEAL + 1.2f),
                                          NextAction("healing touch on party", ACTION_MEDIUM_HEAL + 1.1f),
                                          }));

    // MEDIUM
    triggers.push_back(
        new TriggerNode("party member medium health",
                        {
                                          NextAction("rejuvenation on party", ACTION_MEDIUM_HEAL + 0.4f),
                                          NextAction("regrowth on party", ACTION_MEDIUM_HEAL + 0.3f),
                                          NextAction("healing touch on party", ACTION_MEDIUM_HEAL + 0.1f) }));

    // almost full
    triggers.push_back(
        new TriggerNode("party member almost full health",
                        { NextAction("rejuvenation on party", ACTION_LIGHT_HEAL + 0.3f),
                                          NextAction("regrowth on party", ACTION_LIGHT_HEAL + 0.1f) }));

    triggers.push_back(
        new TriggerNode("medium mana", { NextAction("innervate", ACTION_HIGH + 5) }));

    triggers.push_back(new TriggerNode("enemy too close for spell",
                                       { NextAction("flee", ACTION_MOVE + 9) }));
}
