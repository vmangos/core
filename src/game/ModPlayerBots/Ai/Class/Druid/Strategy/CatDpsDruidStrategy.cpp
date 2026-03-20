/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "CatDpsDruidStrategy.h"

#include "AiObjectContext.h"

class CatDpsDruidStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    CatDpsDruidStrategyActionNodeFactory()
    {
        creators["faerie fire (feral)"] = &faerie_fire_feral;
        creators["melee"] = &melee;
        creators["cat form"] = &cat_form;
        creators["claw"] = &claw;
        creators["rake"] = &rake;
        creators["ferocious bite"] = &ferocious_bite;
        creators["rip"] = &rip;
        creators["pounce"] = &pounce;
        creators["ravage"] = &ravage;
    }

private:
    static ActionNode* faerie_fire_feral([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "faerie fire (feral)",
            /*P*/ {},
            /*A*/ {},
            /*C*/ {}
        );
    }

    static ActionNode* melee([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "melee",
            /*P*/ {},
            /*A*/ {},
            /*C*/ {}
        );
    }

    static ActionNode* cat_form([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "cat form",
            /*P*/ { NextAction("caster form") },
            /*A*/ { NextAction("bear form") },
            /*C*/ {}
        );
    }

    static ActionNode* claw([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "claw",
            /*P*/ {},
            /*A*/ { NextAction("melee") },
            /*C*/ {}
        );
    }

    static ActionNode* rake([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "rake",
            /*P*/ {},
            /*A*/ {},
            /*C*/ {}
        );
    }

    static ActionNode* ferocious_bite([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "ferocious bite",
            /*P*/ {},
            /*A*/ { NextAction("rip") },
            /*C*/ {}
        );
    }

    static ActionNode* rip([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "rip",
            /*P*/ {},
            /*A*/ {},
            /*C*/ {}
        );
    }

    static ActionNode* pounce([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "pounce",
            /*P*/ {},
            /*A*/ { NextAction("ravage") },
            /*C*/ {}
        );
    }

    static ActionNode* ravage([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode(
            "ravage",
            /*P*/ {},
            /*A*/ { NextAction("shred") },
            /*C*/ {}
        );
    }
};

CatDpsDruidStrategy::CatDpsDruidStrategy(PlayerbotAI* botAI) : FeralDruidStrategy(botAI)
{
    actionNodeFactories.Add(new CatDpsDruidStrategyActionNodeFactory());
}

std::vector<NextAction> CatDpsDruidStrategy::getDefaultActions()
{
    return {
        NextAction("claw", ACTION_NORMAL + 0.2f),
        NextAction("tiger's fury", ACTION_NORMAL + 0.1f),
        NextAction("melee", ACTION_DEFAULT)
    };
}

void CatDpsDruidStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    FeralDruidStrategy::InitTriggers(triggers);

    // Default priority
    triggers.push_back(
        new TriggerNode(
            "almost full energy available",
            {
                NextAction("shred", ACTION_DEFAULT + 0.4f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "combo points not full",
            {
                NextAction("shred", ACTION_DEFAULT + 0.4f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "almost full energy available",
            {
                NextAction("claw", ACTION_DEFAULT + 0.3f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "combo points not full and high energy",
            {
                NextAction("claw", ACTION_DEFAULT + 0.3f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "almost full energy available",
            {
                NextAction("claw", ACTION_DEFAULT + 0.2f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "combo points not full and high energy",
            {
                NextAction("claw", ACTION_DEFAULT + 0.2f)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "faerie fire (feral)",
            {
                NextAction("faerie fire (feral)", ACTION_DEFAULT + 0.0f)
            }
        )
    );

    // Main spell
    triggers.push_back(
        new TriggerNode(
            "cat form", {
                NextAction("cat form", ACTION_HIGH + 8)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "combo points available",
            {
                NextAction("rip", ACTION_HIGH + 6)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "ferocious bite time",
            {
                NextAction("ferocious bite", ACTION_HIGH + 5)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "target with combo points almost dead",
            {
                NextAction("ferocious bite", ACTION_HIGH + 4)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "combo points not full",
            {
                NextAction("claw", ACTION_HIGH + 3)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "rake",
            {
                NextAction("rake", ACTION_HIGH + 2)
            }
        )
    );
    triggers.push_back(
        new TriggerNode(
            "medium threat",
            {
                NextAction("cower", ACTION_HIGH + 1)
            }
        )
    );

    // AOE
    triggers.push_back(
        new TriggerNode(
            "light aoe",
            {
                NextAction("rake on attacker", ACTION_HIGH + 2)
            }
        )
    );
    // Reach target
    triggers.push_back(
        new TriggerNode(
            "enemy out of melee",
            {
                NextAction("dash", ACTION_HIGH + 9)
            }
        )
    );
}

void CatAoeDruidStrategy::InitTriggers(std::vector<TriggerNode*>& triggers) {}
