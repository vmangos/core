/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "GuildCreateActions.h"

#include "Event.h"

bool BuyPetitionAction::Execute(Event /*event*/) { return false; }

bool BuyPetitionAction::isUseful() { return false; }

bool BuyPetitionAction::canBuyPetition(Player* /*bot*/) { return false; }

bool PetitionOfferAction::Execute(Event /*event*/) { return false; }

bool PetitionOfferAction::isUseful() { return false; }

bool PetitionOfferNearbyAction::Execute(Event /*event*/) { return false; }

bool PetitionOfferNearbyAction::isUseful() { return false; }

bool PetitionTurnInAction::Execute(Event /*event*/) { return false; }

bool PetitionTurnInAction::isUseful() { return false; }

bool BuyTabardAction::Execute(Event /*event*/) { return false; }

bool BuyTabardAction::isUseful() { return false; }
