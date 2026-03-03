/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "EmoteAction.h"

#include "Event.h"

std::map<std::string, uint32> EmoteActionBase::emotes;
std::map<std::string, uint32> EmoteActionBase::textEmotes;

EmoteActionBase::EmoteActionBase(PlayerbotAI* botAI, std::string const name) : Action(botAI, name) {}

uint32 EmoteActionBase::GetNumberOfEmoteVariants(TextEmotes /*emote*/, uint8 /*race*/, uint8 /*gender*/) { return 1; }

bool EmoteActionBase::Emote(Unit* /*target*/, uint32 /*type*/, bool /*textEmote*/) { return false; }
bool EmoteActionBase::ReceiveEmote(Player* /*source*/, uint32 /*emote*/, bool /*verbal*/) { return false; }
Unit* EmoteActionBase::GetTarget() { return nullptr; }
void EmoteActionBase::InitEmotes() {}

EmoteAction::EmoteAction(PlayerbotAI* botAI) : EmoteActionBase(botAI, "emote") {}

bool EmoteAction::Execute(Event /*event*/) { return false; }
bool EmoteAction::isUseful() { return false; }

bool TalkAction::Execute(Event /*event*/) { return false; }
uint32 TalkAction::GetRandomEmote(Unit* /*unit*/, bool /*textEmote*/) { return 0; }
