/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "GuildManagementActions.h"

#include "Event.h"

Player* GuidManageAction::GetPlayer(Event /*event*/) { return nullptr; }

void GuidManageAction::SendPacket(WorldPacket const& /*packet*/) {}

bool GuidManageAction::Execute(Event /*event*/) { return false; }

bool GuidManageAction::PlayerIsValid(Player* /*member*/) { return false; }

uint8 GuidManageAction::GetRankId(Player* /*member*/) { return 0; }

bool GuildInviteAction::isUseful() { return false; }

bool GuildInviteAction::PlayerIsValid(Player* /*member*/) { return false; }

bool GuildPromoteAction::isUseful() { return false; }

bool GuildPromoteAction::PlayerIsValid(Player* /*member*/) { return false; }

bool GuildDemoteAction::isUseful() { return false; }

bool GuildDemoteAction::PlayerIsValid(Player* /*member*/) { return false; }

bool GuildRemoveAction::isUseful() { return false; }

bool GuildRemoveAction::PlayerIsValid(Player* /*member*/) { return false; }

bool GuildManageNearbyAction::Execute(Event /*event*/) { return false; }

bool GuildManageNearbyAction::isUseful() { return false; }

bool GuildLeaveAction::Execute(Event /*event*/) { return false; }

bool GuildLeaveAction::isUseful() { return false; }
