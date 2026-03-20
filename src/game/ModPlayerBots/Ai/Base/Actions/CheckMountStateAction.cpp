/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "CheckMountStateAction.h"

#include <algorithm>
#include <cmath>

#include "Event.h"
#include "PlayerbotAI.h"
#include "Playerbots.h"

namespace
{
bool IsTravelFormLike(ShapeshiftForm form)
{
    return form == FORM_TRAVEL || form == FORM_AQUA || form == FORM_GHOSTWOLF;
}

bool IsMountedOrFastForm(Player* player)
{
    return player && (player->IsMounted() || IsTravelFormLike(player->GetShapeshiftForm()));
}

int32 GetMountSpellSpeed(SpellInfo const* spellInfo)
{
    if (!spellInfo)
        return 0;

    int32 speed = 0;
    for (uint8 i = 0; i < 3; ++i)
    {
        switch (spellInfo->EffectApplyAuraName[i])
        {
            case SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED:
                speed = std::max(speed, spellInfo->EffectBasePoints[i] + 1);
                break;
            default:
                break;
        }
    }

    return speed;
}
}

std::unordered_map<uint32, PreferredMountCache> CheckMountStateAction::mountCache;
bool CheckMountStateAction::preferredMountTableChecked = false;

bool CheckMountStateAction::isUseful()
{
    if (!bot || !bot->IsAlive() || bot->IsInCombat())
        return false;

    if (!GET_PLAYERBOT_AI(bot)->HasStrategy("mount", BOT_STATE_NON_COMBAT))
        return false;

    Player* currentMaster = botAI->GetMaster();
    if (!currentMaster || currentMaster == bot)
        return !bot->IsMounted() && !IsTravelFormLike(bot->GetShapeshiftForm());

    return currentMaster->GetMapId() == bot->GetMapId();
}

bool CheckMountStateAction::Execute(Event /*event*/)
{
    if (!isUseful())
        return false;

    master = botAI->GetMaster();
    masterInShapeshiftForm = master ? master->GetShapeshiftForm() : FORM_NONE;
    botInShapeshiftForm = bot->GetShapeshiftForm();

    if (!master || master == bot)
        return Mount();

    bool noAttackers = !bot->IsInCombat() && !master->IsInCombat();
    bool shouldMount = IsMountedOrFastForm(master) || bot->GetDistance(master) > CalculateMountDistance();

    if ((bot->IsMounted() || IsTravelFormLike(botInShapeshiftForm)) && ShouldDismountForMaster(master))
    {
        Dismount();
        return true;
    }

    if (bot->IsMounted() || IsTravelFormLike(botInShapeshiftForm))
        return false;

    if (!ShouldFollowMasterMountState(master, noAttackers, shouldMount))
        return false;

    return Mount();
}

bool CheckMountStateAction::Mount()
{
    if (TryPreferredMount(master))
        return true;

    MountData mountData;
    mountData.allSpells = GetAllMountSpells();
    mountData.swiftMount = CheckForSwiftMount();
    mountData.maxSpeed = mountData.swiftMount ? 99 : 59;

    int32 masterSpeed = CalculateMasterMountSpeed(master, mountData);
    if (TryForms(master, GetMountType(master), masterSpeed))
        return true;

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

float CheckMountStateAction::CalculateDismountDistance() const { return 12.0f; }

float CheckMountStateAction::CalculateMountDistance() const
{
    return CheckForSwiftMount() ? 35.0f : 25.0f;
}

void CheckMountStateAction::Dismount()
{
    if (bot->HasAuraType(SPELL_AURA_MOUNTED))
        bot->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    if (IsTravelFormLike(bot->GetShapeshiftForm()))
        botAI->RemoveShapeshift();
}

bool CheckMountStateAction::ShouldFollowMasterMountState(Player* master, bool noAttackers, bool shouldMount) const
{
    if (!master || master == bot || master->GetMapId() != bot->GetMapId())
        return false;

    if (!noAttackers || !shouldMount)
        return false;

    if (master->IsTaxiFlying())
        return false;

    return bot->GetDistance(master) <= sPlayerbotAIConfig.sightDistance;
}

bool CheckMountStateAction::ShouldDismountForMaster(Player* master) const
{
    if (!master || master == bot || master->GetMapId() != bot->GetMapId())
        return false;

    if (master->IsInCombat())
        return true;

    if (IsMountedOrFastForm(master))
        return false;

    return bot->GetDistance(master) <= CalculateDismountDistance();
}

int32 CheckMountStateAction::CalculateMasterMountSpeed(Player* master, const MountData& mountData) const
{
    if (!master)
        return mountData.maxSpeed;

    float speedRate = master->GetSpeedRate(master->IsSwimming() ? MOVE_SWIM : MOVE_RUN);
    int32 speed = static_cast<int32>(std::round((speedRate - 1.0f) * 100.0f));

    if (speed > 0)
        return speed;

    return IsMountedOrFastForm(master) ? mountData.maxSpeed : 59;
}

bool CheckMountStateAction::CheckForSwiftMount() const
{
    std::vector<Item*> items = AI_VALUE2(std::vector<Item*>, "inventory items", "mount");
    for (Item* item : items)
    {
        if (!item || !item->GetTemplate())
            continue;

        for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        {
            uint32 spellId = item->GetTemplate()->Spells[i].SpellId;
            if (!spellId)
                continue;

            if (GetMountSpellSpeed(sSpellMgr.GetSpellEntry(spellId)) >= 99)
                return true;
        }
    }

    return false;
}

std::map<uint32, std::map<int32, std::vector<uint32>>> CheckMountStateAction::GetAllMountSpells() const
{
    std::map<uint32, std::map<int32, std::vector<uint32>>> result;
    std::vector<Item*> items = AI_VALUE2(std::vector<Item*>, "inventory items", "mount");

    for (Item* item : items)
    {
        if (!item || !item->GetTemplate())
            continue;

        for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        {
            uint32 spellId = item->GetTemplate()->Spells[i].SpellId;
            if (!spellId)
                continue;

            SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
            if (!spellInfo)
                continue;

            bool isMountSpell = false;
            for (uint8 effect = 0; effect < 3; ++effect)
            {
                if (spellInfo->EffectApplyAuraName[effect] == SPELL_AURA_MOUNTED)
                {
                    isMountSpell = true;
                    break;
                }
            }

            if (!isMountSpell)
                continue;

            int32 speed = GetMountSpellSpeed(spellInfo);
            if (speed <= 0)
                speed = 59;

            result[0][speed].push_back(spellId);
        }
    }

    return result;
}

bool CheckMountStateAction::TryForms(Player* /*master*/, int32 /*masterMountType*/, int32 masterSpeed)
{
    if (masterSpeed <= 59)
    {
        if (botAI->CanCastSpell("travel form", bot) && botAI->CastSpell("travel form", bot))
            return true;

        if (botAI->CanCastSpell("ghost wolf", bot) && botAI->CastSpell("ghost wolf", bot))
            return true;
    }

    return false;
}

bool CheckMountStateAction::TryPreferredMount(Player* master)
{
    std::map<uint32, std::map<int32, std::vector<uint32>>> allSpells = GetAllMountSpells();
    MountData mountData;
    mountData.allSpells = allSpells;
    mountData.swiftMount = CheckForSwiftMount();
    mountData.maxSpeed = mountData.swiftMount ? 99 : 59;

    int32 masterSpeed = CalculateMasterMountSpeed(master, mountData);
    return TryRandomMountFiltered(allSpells[GetMountType(master)], masterSpeed);
}

uint32 CheckMountStateAction::GetMountType(Player* /*master*/) const { return 0; }

bool CheckMountStateAction::TryRandomMountFiltered(const std::map<int32, std::vector<uint32>>& spells, int32 masterSpeed)
{
    if (spells.empty())
        return false;

    int32 selectedSpeed = 0;
    for (auto const& [speed, spellIds] : spells)
    {
        if (spellIds.empty())
            continue;

        if (speed <= masterSpeed && speed >= selectedSpeed)
            selectedSpeed = speed;
    }

    if (!selectedSpeed)
        selectedSpeed = spells.rbegin()->first;

    auto itr = spells.find(selectedSpeed);
    if (itr == spells.end() || itr->second.empty())
        return false;

    uint32 spellId = itr->second[urand(0, itr->second.size() - 1)];
    std::vector<Item*> items = AI_VALUE2(std::vector<Item*>, "inventory items", "mount");
    for (Item* item : items)
    {
        if (!item || !item->GetTemplate())
            continue;

        for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        {
            if (item->GetTemplate()->Spells[i].SpellId == spellId)
                return UseItemAuto(item);
        }
    }

    return false;
}
