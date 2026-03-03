/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "IsBehindValue.h"
#include <cmath>

#include "Geometry.h"
#include "Playerbots.h"

bool IsBehindValue::Calculate()
{
    Unit* target = AI_VALUE(Unit*, qualifier);
    if (!target)
        return false;

    float targetOrientation = target->GetOrientation();

    float deltaAngle = Geometry::NormalizeOrientation(targetOrientation - target->GetAngle(bot));
    if (deltaAngle > M_PI)
        deltaAngle -= 2.0f * M_PI; // -PI..PI

    return fabs(deltaAngle) > M_PI_2;
}
