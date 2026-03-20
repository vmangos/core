/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "GenericMageStrategy.h"
#include "Bot/Factory/AiFactory.h"
#include "Playerbots.h"
#include "RangedCombatStrategy.h"

class GenericMageStrategyActionNodeFactory : public NamedObjectFactory<ActionNode>
{
public:
    GenericMageStrategyActionNodeFactory()
    {
        creators["frostbolt"] = &frostbolt;
        creators["fire blast"] = &fire_blast;
        creators["scorch"] = &scorch;
        creators["frost nova"] = &frost_nova;
        creators["cone of cold"] = &cone_of_cold;
        creators["combustion"] = &combustion;
        creators["evocation"] = &evocation;
        creators["blast wave"] = &blast_wave;
        creators["remove curse"] = &remove_curse;
        creators["remove curse on party"] = &remove_curse_on_party;
        creators["fireball"] = &fireball;
    }

private:
    static ActionNode* frostbolt([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("frostbolt",
                              /*P*/ {},
                              /*A*/ { NextAction("shoot") },
                              /*C*/ {});
    }

    static ActionNode* fire_blast([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("fire blast",
                              /*P*/ {},
                              /*A*/ {},
                              /*C*/ {});
    }

    static ActionNode* scorch([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("scorch",
                              /*P*/ {},
                              /*A*/ { NextAction("shoot") },
                              /*C*/ {});
    }

    static ActionNode* frost_nova([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("frost nova",
                              /*P*/ {},
                              /*A*/ {},
                              /*C*/ {});
    }

    static ActionNode* cone_of_cold([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("cone of cold",
                              /*P*/ {},
                              /*A*/ {},
                              /*C*/ {});
    }

    static ActionNode* combustion([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("combustion",
                              /*P*/ {},
                              /*A*/ {},
                              /*C*/ {});
    }

    static ActionNode* evocation([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("evocation",
                              /*P*/ {},
                              /*A*/ { NextAction("mana potion") },
                              /*C*/ {});
    }

    static ActionNode* blast_wave([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("blast wave",
                              /*P*/ {},
                              /*A*/ {},
                              /*C*/ {});
    }

    static ActionNode* remove_curse([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("remove curse",
                              /*P*/ {},
                              /*A*/ { NextAction("remove lesser curse") },
                              /*C*/ {});
    }

    static ActionNode* remove_curse_on_party([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("remove curse on party",
                              /*P*/ {},
                              /*A*/ { NextAction("remove lesser curse on party") },
                              /*C*/ {});
    }
    static ActionNode* fireball([[maybe_unused]] PlayerbotAI* botAI)
    {
        return new ActionNode("fireball",
                              /*P*/ {},
                              /*A*/ { NextAction("shoot") },
                              /*C*/ {});
    }
};

GenericMageStrategy::GenericMageStrategy(PlayerbotAI* botAI) : RangedCombatStrategy(botAI)
{
    actionNodeFactories.Add(new GenericMageStrategyActionNodeFactory());
}

void GenericMageStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    RangedCombatStrategy::InitTriggers(triggers);

    // Defensive Triggers
    triggers.push_back(new TriggerNode("critical health", { NextAction("ice block", 90.0f) }));
    triggers.push_back(new TriggerNode("low health", { NextAction("mana shield", 85.0f) }));
    triggers.push_back(new TriggerNode("fire ward", { NextAction("fire ward", 90.0f) }));
    triggers.push_back(new TriggerNode("frost ward", { NextAction("frost ward", 90.0f) }));
    triggers.push_back(new TriggerNode("enemy is close and no firestarter strategy", { NextAction("frost nova", 50.0f) }));
    triggers.push_back(new TriggerNode("enemy too close for spell and no firestarter strategy", { NextAction("blink back", 35.0f) }));

    // Mana Threshold Triggers
    Player* bot = botAI->GetBot();
    if (bot->HasSpell(10054))  // Mana Ruby
        triggers.push_back(new TriggerNode("high mana", { NextAction("use mana ruby", 90.0f) }));
    else if (bot->HasSpell(10053))  // Mana Citrine
        triggers.push_back(new TriggerNode("high mana", { NextAction("use mana citrine", 90.0f) }));
    else if (bot->HasSpell(3552))  // Mana Jade
        triggers.push_back(new TriggerNode("high mana", { NextAction("use mana jade", 90.0f) }));
    else if (bot->HasSpell(759))  // Mana Agate
        triggers.push_back(new TriggerNode("high mana", { NextAction("use mana agate", 90.0f) }));

    triggers.push_back(new TriggerNode("medium mana", { NextAction("mana potion", 90.0f) }));
    triggers.push_back(new TriggerNode("low mana", { NextAction("evocation", 90.0f) }));

    // Counterspell Triggers
    triggers.push_back(new TriggerNode("counterspell on enemy healer", { NextAction("counterspell on enemy healer", 40.0f) }));
}

void MageCureStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    triggers.push_back(new TriggerNode("remove curse", { NextAction("remove curse", 41.0f) }));
    triggers.push_back(new TriggerNode("remove curse on party", { NextAction("remove curse on party", 40.0f) }));
}

void MageBoostStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    Player* bot = botAI->GetBot();
    int tab = AiFactory::GetPlayerSpecTab(bot);

    if (tab == 0)  // Arcane
    {
        triggers.push_back(new TriggerNode("arcane power", { NextAction("arcane power", 29.0f) }));
    }
    else if (tab == 1)  // Fire
    {
        triggers.push_back(new TriggerNode("combustion", { NextAction("combustion", 18.0f) }));
    }
    else if (tab == 2)  // Frost
    {
        triggers.push_back(new TriggerNode("cold snap", { NextAction("cold snap", 28.0f) }));
    }
}

void MageCcStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    triggers.push_back(new TriggerNode("polymorph", { NextAction("polymorph", 30.0f) }));
}

void MageAoeStrategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    triggers.push_back(new TriggerNode("blizzard channel check", { NextAction("cancel channel", 26.0f) }));

    Player* bot = botAI->GetBot();
    int tab = AiFactory::GetPlayerSpecTab(bot);

    if (tab == 0)  // Arcane
    {
        triggers.push_back(new TriggerNode("flamestrike active and medium aoe", { NextAction("blizzard", 24.0f) }));
        triggers.push_back(new TriggerNode("medium aoe", {
                                                     NextAction("flamestrike", 23.0f),
                                                     NextAction("blizzard", 22.0f) }));
        triggers.push_back(new TriggerNode("light aoe", { NextAction("arcane explosion", 21.0f) }));
    }
    else if (tab == 1)  // Fire
    {
        triggers.push_back(
            new TriggerNode("medium aoe", {
                                      NextAction("blast wave", 38.0f),
                                      NextAction("flamestrike", 23.0f),
                                      NextAction("blizzard", 22.0f) }));

        triggers.push_back(new TriggerNode("flamestrike active and medium aoe", { NextAction("blizzard", 24.0f) }));
    }
    else if (tab == 2)  // Frost
    {
        triggers.push_back(new TriggerNode("flamestrike active and medium aoe", { NextAction("blizzard", 24.0f) }));
        triggers.push_back(new TriggerNode("medium aoe", {
                                                     NextAction("flamestrike", 23.0f),
                                                     NextAction("blizzard", 22.0f) }));
        triggers.push_back(new TriggerNode("light aoe", { NextAction("cone of cold", 21.0f) }));
    }
}
