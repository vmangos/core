/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "ListSpellsAction.h"

#include <algorithm>
#include <cstdlib>
#include <set>
#include <sstream>

#include "ChatHelper.h"
#include "Event.h"
#include "Playerbots.h"
#include "PlayerbotSpellRepository.h"

namespace
{
using SpellListEntry = std::pair<uint32, std::string>;

std::string GetSpellName(SpellEntry const* spellInfo)
{
    if (!spellInfo)
        return "";

    int locale = sWorld.GetDefaultDbcLocale();
    std::string name = spellInfo->SpellName[locale];
    if (name.empty())
        name = spellInfo->SpellName[LOCALE_enUS];

    return name;
}

std::string JoinTokens(std::vector<std::string> const& tokens, size_t startIndex)
{
    std::ostringstream out;
    for (size_t index = startIndex; index < tokens.size(); ++index)
    {
        if (index != startIndex)
            out << ' ';

        out << tokens[index];
    }

    return out.str();
}

bool IsIgnoredSpellName(std::string const& name)
{
    static std::set<std::string> const ignoredNames = {
        "Opening",
        "Closing",
        "Stuck",
        "Remove Insignia",
        "Opening - No Text",
        "Grovel",
        "Duel",
        "Honorless Target"
    };

    return ignoredNames.find(name) != ignoredNames.end();
}

bool CompareSpells(SpellListEntry const& leftSpell, SpellListEntry const& rightSpell)
{
    SpellEntry const* leftInfo = sSpellMgr.GetSpellEntry(leftSpell.first);
    SpellEntry const* rightInfo = sSpellMgr.GetSpellEntry(rightSpell.first);

    std::string leftName = GetSpellName(leftInfo);
    std::string rightName = GetSpellName(rightInfo);
    if (leftName == rightName)
        return leftSpell.first < rightSpell.first;

    return leftName < rightName;
}
}

bool ListSpellsAction::Execute(Event event)
{
    Player* master = GetMaster();
    if (!master)
        return false;

    std::vector<SpellListEntry> spells = GetSpellList(event.getParam());
    if (spells.empty())
    {
        botAI->TellMaster("No spells found.");
        return true;
    }

    std::sort(spells.begin(), spells.end(), CompareSpells);

    botAI->TellMaster("=== Spells ===");
    for (std::vector<SpellListEntry>::const_iterator itr = spells.begin(); itr != spells.end(); ++itr)
        botAI->TellMasterNoFacing(itr->second);

    return true;
}

std::vector<std::pair<uint32, std::string>> ListSpellsAction::GetSpellList(std::string filter)
{
    uint32 skillId = SKILL_NONE;

    std::vector<std::string> tokens = split(filter, ' ');
    if (!tokens.empty())
    {
        if (tokens[0] == "first" && tokens.size() > 1 && tokens[1] == "aid")
        {
            skillId = SKILL_FIRST_AID;
            filter = JoinTokens(tokens, 2);
        }
        else
        {
            uint32 parsedSkill = chat->parseSkill(tokens[0]);
            if (parsedSkill != SKILL_NONE)
            {
                skillId = parsedSkill;
                filter = JoinTokens(tokens, 1);
            }
        }
    }

    bool canCraftNow = filter.find('+') != std::string::npos;
    if (canCraftNow)
    {
        filter.erase(std::remove(filter.begin(), filter.end(), '+'), filter.end());

        if (skillId == SKILL_NONE)
        {
            std::vector<std::string> craftTokens = split(filter, ' ');
            if (!craftTokens.empty())
            {
                uint32 parsedSkill = chat->parseSkill(craftTokens[0]);
                if (parsedSkill != SKILL_NONE)
                {
                    skillId = parsedSkill;
                    filter = JoinTokens(craftTokens, 1);
                }
            }
        }
    }

    uint32 minLevel = 0;
    uint32 maxLevel = 0;
    size_t dashPos = filter.find('-');
    if (dashPos != std::string::npos)
    {
        std::string left = filter.substr(0, dashPos);
        std::string right = filter.substr(dashPos + 1);
        if (!left.empty() && !right.empty())
        {
            minLevel = std::atoi(left.c_str());
            maxLevel = std::atoi(right.c_str());
            if (minLevel && maxLevel)
            {
                if (minLevel > maxLevel)
                    std::swap(minLevel, maxLevel);

                filter.clear();
            }
            else
            {
                minLevel = 0;
                maxLevel = 0;
            }
        }
    }

    uint32 slot = chat->parseSlot(filter);
    if (slot != EQUIPMENT_SLOT_END)
        filter.clear();

    std::set<std::string> seenNames;
    std::vector<SpellListEntry> spells;
    for (PlayerSpellMap::iterator itr = bot->GetSpellMap().begin(); itr != bot->GetSpellMap().end(); ++itr)
    {
        if (itr->second.state == PLAYERSPELL_REMOVED || !itr->second.active)
            continue;

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(itr->first);
        if (!spellInfo || spellInfo->IsPassiveSpell())
            continue;

        SkillLineAbilityEntry const* skillLine = PlayerbotSpellRepository::Instance().GetSkillLine(itr->first);
        if (skillId != SKILL_NONE && (!skillLine || skillLine->skillId != skillId))
            continue;

        std::string spellName = GetSpellName(spellInfo);
        if (spellName.empty() || IsIgnoredSpellName(spellName) || seenNames.find(spellName) != seenNames.end())
            continue;

        if (!filter.empty() && !strstri(spellName.c_str(), filter.c_str()))
            continue;

        int32 craftsPossible = -1;
        bool createdItemMatchedSlot = (slot == EQUIPMENT_SLOT_END);
        bool filteredOut = false;
        std::ostringstream out;
        std::ostringstream materials;

        for (uint8 effectIndex = 0; effectIndex < MAX_EFFECT_INDEX; ++effectIndex)
        {
            if (spellInfo->Effect[effectIndex] != SPELL_EFFECT_CREATE_ITEM)
                continue;

            uint32 itemId = spellInfo->EffectItemType[effectIndex];
            if (!itemId)
                continue;

            ItemTemplate const* proto = sObjectMgr.GetItemTemplate(itemId);
            if (!proto)
                continue;

            if ((minLevel || maxLevel) && (!proto->RequiredLevel || proto->RequiredLevel < minLevel || proto->RequiredLevel > maxLevel))
            {
                filteredOut = true;
                break;
            }

            if (slot != EQUIPMENT_SLOT_END)
            {
                if (botAI->FindEquipSlot(proto, slot, true) != slot)
                    continue;

                createdItemMatchedSlot = true;
            }

            if (!out.str().empty())
                out << ", ";

            out << chat->FormatItem(proto);
        }

        if (filteredOut)
            continue;

        if (slot != EQUIPMENT_SLOT_END && !createdItemMatchedSlot)
            continue;

        bool firstReagent = true;
        for (uint32 reagentIndex = 0; reagentIndex < MAX_SPELL_REAGENTS; ++reagentIndex)
        {
            int32 reagentId = spellInfo->Reagent[reagentIndex];
            if (reagentId <= 0)
                continue;

            uint32 reagentCount = spellInfo->ReagentCount[reagentIndex];
            ItemTemplate const* proto = sObjectMgr.GetItemTemplate(static_cast<uint32>(reagentId));
            if (!proto)
                continue;

            if (firstReagent)
            {
                materials << ": ";
                firstReagent = false;
            }
            else
                materials << ", ";

            materials << chat->FormatItem(proto, reagentCount);

            FindItemByIdVisitor visitor(static_cast<uint32>(reagentId));
            uint32 reagentsInInventory = GetItemCount(&visitor);
            bool buyable = PlayerbotSpellRepository::Instance().IsItemBuyable(static_cast<uint32>(reagentId));
            if (!buyable)
            {
                uint32 possible = reagentCount ? reagentsInInventory / reagentCount : 0;
                if (craftsPossible < 0 || possible < static_cast<uint32>(craftsPossible))
                    craftsPossible = static_cast<int32>(possible);
            }

            if (reagentsInInventory)
                materials << "|cffffff00(x" << reagentsInInventory << ")|r";
            else if (buyable)
                materials << "|cffffff00(buy)|r";
        }

        if (craftsPossible < 0)
            craftsPossible = 0;

        if (canCraftNow && !craftsPossible)
            continue;

        if (out.str().empty())
            out << chat->FormatSpell(spellInfo);
        else if (craftsPossible > 0)
            out.str(std::string("|cffffff00(x" + std::to_string(craftsPossible) + ")|r ") + out.str());

        out << materials.str();

        spells.push_back(SpellListEntry(itr->first, out.str()));
        seenNames.insert(spellName);
    }

    return spells;
}

void ListSpellsAction::InitSpellCaches()
{
    PlayerbotSpellRepository::Instance().Initialize();
}
