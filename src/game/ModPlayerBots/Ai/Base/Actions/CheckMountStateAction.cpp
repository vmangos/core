/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "CheckMountStateAction.h"

#include "Event.h"
#include "PlayerbotAI.h"
#include "Playerbots.h"

std::unordered_map<uint32, PreferredMountCache> CheckMountStateAction::mountCache;
bool CheckMountStateAction::preferredMountTableChecked = false;

bool CheckMountStateAction::isUseful()
{
    return bot && bot->IsAlive() && !bot->IsInCombat() && !bot->IsMounted() &&
        GET_PLAYERBOT_AI(bot)->HasStrategy("mount", BOT_STATE_NON_COMBAT);
}

bool CheckMountStateAction::Execute(Event /*event*/)
{
    if (!isUseful())
        return false;

    return Mount();
}

bool CheckMountStateAction::Mount()
{
    std::vector<Item*> items = AI_VALUE2(std::vector<Item*>, "inventory items", "mount");
    if (!items.empty())
        return UseItemAuto(*items.begin());

    if (botAI->CanCastSpell(SPELL_TRAVEL_FORM, bot, true))
    {
        botAI->CastSpell(SPELL_TRAVEL_FORM, bot);
        return true;
    }

    return false;
}

float CheckMountStateAction::CalculateDismountDistance() const { return 0.0f; }
float CheckMountStateAction::CalculateMountDistance() const { return 0.0f; }
void CheckMountStateAction::Dismount() {}
bool CheckMountStateAction::ShouldFollowMasterMountState(Player* /*master*/, bool /*noAttackers*/, bool /*shouldMount*/) const { return false; }
bool CheckMountStateAction::ShouldDismountForMaster(Player* /*master*/) const { return false; }
int32 CheckMountStateAction::CalculateMasterMountSpeed(Player* /*master*/, const MountData& /*mountData*/) const { return 59; }
bool CheckMountStateAction::CheckForSwiftMount() const { return false; }
std::map<uint32, std::map<int32, std::vector<uint32>>> CheckMountStateAction::GetAllMountSpells() const { return {}; }
bool CheckMountStateAction::TryForms(Player* /*master*/, int32 /*masterMountType*/, int32 /*masterSpeed*/) const { return false; }
bool CheckMountStateAction::TryPreferredMount(Player* /*master*/) const { return false; }
uint32 CheckMountStateAction::GetMountType(Player* /*master*/) const { return 0; }
bool CheckMountStateAction::TryRandomMountFiltered(const std::map<int32, std::vector<uint32>>& /*spells*/, int32 /*masterSpeed*/) const { return false; }
