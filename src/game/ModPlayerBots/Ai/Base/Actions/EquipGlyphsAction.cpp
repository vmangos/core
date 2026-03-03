/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "EquipGlyphsAction.h"

#include "Event.h"

bool EquipGlyphsAction::Execute(Event /*event*/)
{
    return false;
}

void EquipGlyphsAction::BuildGlyphCache() {}

EquipGlyphsAction::GlyphInfo const* EquipGlyphsAction::GetGlyphInfo(uint32 /*itemId*/)
{
    return nullptr;
}

bool EquipGlyphsAction::CollectGlyphs(std::vector<uint32> const& /*itemIds*/, std::vector<GlyphInfo const*>& /*out*/) const
{
    return false;
}
