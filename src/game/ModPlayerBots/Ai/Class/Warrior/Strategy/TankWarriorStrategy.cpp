/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "TankWarriorStrategy.h"

#include "Playerbots.h"

class TankWarriorStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    TankWarriorStrategyActionNodeFactory()
    {
        creators["charge"] = &charge;
        creators["sunder armor"] = &sunder_armor;
        creators["taunt"] = &taunt;
        creators["taunt spell"] = &taunt;
        creators["last stand"] = &last_stand;
    }

private:
    static ActionNode* last_stand(PlayerbotAI* botAI)
    {
        return new ActionNode(
            "last stand",
            /*P*/ {},
            /*A*/ { NextAction("intimidating shout") },
            /*C*/ {}
        );
    }

    static ActionNode* sunder_armor(PlayerbotAI* botAI)
    {
        return new ActionNode(
            "sunder armor",
            /*P*/ {},
            /*A*/ { NextAction("melee") },
            /*C*/ {}
        );
    }

    static ActionNode* charge(PlayerbotAI* botAI)
    {
        return new ActionNode(
            "charge",
            /*P*/ {},
            /*A*/ { NextAction("reach melee") },
            /*C*/ {}
        );
    }

    static ActionNode* taunt(PlayerbotAI* botAI)
    {
        return new ActionNode(
            "taunt",
            /*P*/ {},
            /*A*/ {},
            /*C*/ {}
        );
    }
};

TankWarriorStrategy::TankWarriorStrategy(PlayerbotAI* botAI) : GenericWarriorStrategy(botAI)
{
    actionNodeFactories.Add(new TankWarriorStrategyActionNodeFactory());
}

std::vector<NextAction> TankWarriorStrategy::getDefaultActions()
{
    return {
        NextAction("shield slam", ACTION_NORMAL + 0.5f),
        NextAction("revenge", ACTION_NORMAL + 0.4f),
        NextAction("sunder armor", ACTION_NORMAL + 0.3f),
        NextAction("heroic strike", ACTION_NORMAL + 0.2f),
        NextAction("demoralizing shout", ACTION_NORMAL + 0.1f),
        NextAction("melee", ACTION_DEFAULT)
    };
}

void TankWarriorStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    GenericWarriorStrategy::InitTriggers(triggers);

    // Stance — must be in defensive stance
    triggers.push_back(
        new TriggerNode(
            "defensive stance",
            {
                NextAction("defensive stance", ACTION_HIGH + 9)
            }
        )
    );
    // Shout buff
    triggers.push_back(
        new TriggerNode(
            "battle shout",
            {
                NextAction("battle shout", ACTION_HIGH + 8)
            }
        )
    );
    // Gap closer
    triggers.push_back(
        new TriggerNode(
            "enemy out of melee",
            {
                NextAction("charge", ACTION_MOVE + 10)
            }
        )
    );
    // Rage generation
    triggers.push_back(
        new TriggerNode(
            "bloodrage",
            {
                NextAction("bloodrage", ACTION_HIGH + 2)
            }
        )
    );
    // Threat — sunder armor when stacks not full
    triggers.push_back(
        new TriggerNode(
            "sunder armor",
            {
                NextAction("sunder armor", ACTION_HIGH + 2)
            }
        )
    );
    // Threat — revenge proc (high threat, low rage)
    triggers.push_back(
        new TriggerNode(
            "revenge",
            {
                NextAction("revenge", ACTION_HIGH + 3)
            }
        )
    );
    // Threat — shield slam and sunder on medium rage
    triggers.push_back(
        new TriggerNode(
            "medium rage available",
            {
                NextAction("shield slam", ACTION_HIGH + 2),
                NextAction("sunder armor", ACTION_HIGH + 1)
            }
        )
    );
    // Rage dump — heroic strike on high rage
    triggers.push_back(
        new TriggerNode(
            "high rage available",
            {
                NextAction("heroic strike", ACTION_HIGH)
            }
        )
    );
    // AoE threat — thunder clap
    triggers.push_back(
        new TriggerNode(
            "thunder clap and rage",
            {
                NextAction("thunder clap", ACTION_HIGH + 4)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "medium rage available",
            {
                NextAction("thunder clap", ACTION_HIGH + 1)
            }
        )
    );
    // Mitigation — shield block
    triggers.push_back(
        new TriggerNode(
            "shield block",
            {
                NextAction("shield block", ACTION_INTERRUPT + 1)
            }
        )
    );
    // Taunt — regain aggro immediately
    triggers.push_back(
        new TriggerNode(
            "lose aggro",
            {
                NextAction("taunt", ACTION_INTERRUPT + 1)
            }
        )
    );
    // Interrupts
    triggers.push_back(
        new TriggerNode(
            "shield bash",
            {
                NextAction("shield bash", ACTION_INTERRUPT)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "shield bash on enemy healer",
            {
                NextAction("shield bash on enemy healer", ACTION_INTERRUPT)
            }
        )
    );
    // Snare / stun
    triggers.push_back(
        new TriggerNode(
            "concussion blow",
            {
                NextAction("concussion blow", ACTION_INTERRUPT)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "disarm",
            {
                NextAction("disarm", ACTION_HIGH + 1)
            }
        )
    );
    // Bleeds
    triggers.push_back(
        new TriggerNode(
            "rend",
            {
                NextAction("rend", ACTION_NORMAL + 1)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "rend on attacker",
            {
                NextAction("rend on attacker", ACTION_NORMAL + 1)
            }
        )
    );
    // AoE taunt
    triggers.push_back(
        new TriggerNode(
            "high aoe",
            {
                NextAction("challenging shout", ACTION_HIGH + 3)
            }
        )
    );
    // Defensives
    triggers.push_back(
        new TriggerNode(
            "low health",
            {
                NextAction("shield wall", ACTION_MEDIUM_HEAL)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "critical health",
            {
                NextAction("last stand", ACTION_EMERGENCY + 3)
            }
        )
    );
    // Protect party
    triggers.push_back(
        new TriggerNode(
            "protect party member",
            {
                NextAction("intervene", ACTION_EMERGENCY)
            }
        )
    );
}
