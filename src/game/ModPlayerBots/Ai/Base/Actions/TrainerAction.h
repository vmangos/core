/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#ifndef _PLAYERBOT_TRAINERACTION_H
#define _PLAYERBOT_TRAINERACTION_H

#include "Action.h"
#include "ChatHelper.h"

class Creature;
class PlayerbotAI;

class TrainerAction : public Action
{
public:
    TrainerAction(PlayerbotAI* botAI) : Action(botAI, "trainer") {}

    bool Execute(Event event) override;
};

class MaintenanceAction : public Action
{
public:
    MaintenanceAction(PlayerbotAI* botAI) : Action(botAI, "maintenance") {}
    bool Execute(Event event) override;
};

class RemoveGlyphAction : public Action
{
public:
    RemoveGlyphAction(PlayerbotAI* botAI) : Action(botAI, "remove glyph") {}
    bool Execute(Event event) override;
};

class AutoGearAction : public Action
{
public:
    AutoGearAction(PlayerbotAI* botAI) : Action(botAI, "autogear") {}
    bool Execute(Event event) override;
};

#endif
