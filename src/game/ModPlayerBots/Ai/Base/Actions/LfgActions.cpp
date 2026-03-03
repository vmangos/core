/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "LfgActions.h"

#include "Event.h"

bool LfgJoinAction::Execute(Event /*event*/) { return false; }

uint32 LfgJoinAction::GetRoles() { return 0; }

bool LfgJoinAction::JoinLFG() { return false; }

bool LfgRoleCheckAction::Execute(Event /*event*/) { return false; }

bool LfgAcceptAction::Execute(Event /*event*/) { return false; }

bool LfgLeaveAction::Execute(Event /*event*/) { return false; }

bool LfgLeaveAction::isUseful() { return false; }

bool LfgTeleportAction::Execute(Event /*event*/) { return false; }

bool LfgJoinAction::isUseful() { return false; }
