/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#ifndef _PLAYERBOT_TAMEACTION_H
#define _PLAYERBOT_TAMEACTION_H

#include <string>
#include "Action.h"
#include "PlayerbotFactory.h"

class PlayerbotAI;

class TameAction : public Action
{
public:
    TameAction(PlayerbotAI* botAI) : Action(botAI, "tame") {}

    bool Execute(Event event) override;

private:
    bool RenamePet(const std::string& newName);
    bool AbandonPet();
};

#endif
