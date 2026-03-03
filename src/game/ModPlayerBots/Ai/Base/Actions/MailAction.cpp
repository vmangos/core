/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "MailAction.h"

#include "Event.h"
#include "ObjectGuid.h"
#include "Player.h"

ObjectGuid MailProcessor::FindMailbox(PlayerbotAI* /*botAI*/) { return ObjectGuid(); }

void MailProcessor::RemoveMail(Player* /*bot*/, uint32 /*id*/, ObjectGuid /*mailbox*/) {}

bool MailAction::Execute(Event /*event*/) { return false; }

std::map<std::string, MailProcessor*> MailAction::processors;
