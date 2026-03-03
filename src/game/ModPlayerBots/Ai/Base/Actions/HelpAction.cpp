/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "HelpAction.h"

#include "Event.h"
#include "PlayerbotAI.h"

HelpAction::HelpAction(PlayerbotAI* botAI) : Action(botAI, "help") { chatContext = nullptr; }

HelpAction::~HelpAction() {}

bool HelpAction::Execute(Event /*event*/)
{
    botAI->TellError("Help command is limited in this Vanilla compatibility build.");
    return true;
}

void HelpAction::TellChatCommands() {}

void HelpAction::TellStrategies() {}

std::string const HelpAction::CombineSupported(std::set<std::string> /*commands*/) { return ""; }
