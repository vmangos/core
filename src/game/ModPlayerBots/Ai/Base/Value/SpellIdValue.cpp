/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "SpellIdValue.h"

#include "ChatHelper.h"
#include "Playerbots.h"
#include "Vehicle.h"
#include "World.h"

SpellIdValue::SpellIdValue(PlayerbotAI* botAI) : CalculatedValue<uint32>(botAI, "spell id", 20 * 1000) {}

VehicleSpellIdValue::VehicleSpellIdValue(PlayerbotAI* botAI) : CalculatedValue<uint32>(botAI, "vehicle spell id") {}

uint32 SpellIdValue::Calculate()
{
    std::string namepart = qualifier;
    ItemIds itemIds = ChatHelper::parseItems(namepart);

    PlayerbotChatHandler handler(bot);
    uint32 extractedSpellId = handler.extractSpellId(namepart);
    if (extractedSpellId)
        if (SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(extractedSpellId))
            namepart = spellInfo->SpellName[0];

    std::wstring wnamepart;
    if (!Utf8toWStr(namepart, wnamepart))
        return 0;

    wstrToLower(wnamepart);
    char firstSymbol = tolower(namepart[0]);
    int spellLength = wnamepart.length();

    LocaleConstant loc = LOCALE_enUS;

    std::set<uint32> spellIds;
    for (PlayerSpellMap::iterator itr = bot->GetSpellMap().begin(); itr != bot->GetSpellMap().end(); ++itr)
    {
        uint32 spellId = itr->first;

        if (itr->second.state == PLAYERSPELL_REMOVED || !itr->second.active)
            continue;

        SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
        if (!spellInfo || spellInfo->IsPassiveSpell())
            continue;

        if (spellInfo->Effect[0] == SPELL_EFFECT_LEARN_SPELL)
            continue;

        bool useByItem = false;
        for (uint8 i = 0; i < 3; ++i)
        {
            if (spellInfo->Effect[i] == SPELL_EFFECT_CREATE_ITEM &&
                itemIds.find(spellInfo->EffectItemType[i]) != itemIds.end())
            {
                useByItem = true;
                break;
            }
        }

        std::string const& spellName = spellInfo->SpellName[loc];
        if (!useByItem && (tolower(spellName[0]) != firstSymbol || spellName.length() != spellLength ||
                           !Utf8FitTo(spellName.c_str(), wnamepart)))
            continue;

        spellIds.insert(spellId);
    }

    Pet* pet = bot->GetPet();
    if (spellIds.empty() && pet)
    {
        for (PetSpellMap::const_iterator itr = pet->m_petSpells.begin(); itr != pet->m_petSpells.end(); ++itr)
        {
            if (itr->second.state == PETSPELL_REMOVED)
                continue;

            uint32 spellId = itr->first;
            SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
            if (!spellInfo)
                continue;

            if (spellInfo->Effect[0] == SPELL_EFFECT_LEARN_SPELL)
                continue;

            std::string const& spellName = spellInfo->SpellName[loc];
            if (tolower(spellName[0]) != firstSymbol || spellName.length() != spellLength ||
                !Utf8FitTo(spellName.c_str(), wnamepart))
                continue;

            spellIds.insert(spellId);
        }
    }

    if (spellIds.empty())
        return 0;

    int32 saveMana = (int32)round(AI_VALUE(double, "mana save level"));
    uint32 rank = 1;
    uint32 highestRank = 0;
    uint32 highestSpellId = 0;
    uint32 lowestRank = 0;
    uint32 lowestSpellId = 0;
    if (saveMana <= 1)
    {
        for (auto it = spellIds.rbegin(); it != spellIds.rend(); ++it)
        {
            auto spellId = *it;
            const SpellInfo* pSpellInfo = sSpellMgr.GetSpellEntry(spellId);
            if (!pSpellInfo)
                continue;

            std::string spellName = pSpellInfo->Rank[0];

            // For atoi, the input string has to start with a digit, so lets search for the first digit
            size_t i = 0;
            for (; i < spellName.length(); i++)
            {
                if (isdigit(spellName[i]))
                    break;
            }

            // remove the first chars, which aren't digits
            spellName = spellName.substr(i, spellName.length() - i);

            // convert the remaining text to an integer
            int id = atoi(spellName.c_str());

            if (!id)
            {
                highestSpellId = spellId;
                continue;
            }

            if (!highestRank || id > highestRank)
            {
                highestRank = id;
                highestSpellId = spellId;
            }

            if (!lowestRank || (lowestRank && id < lowestRank))
            {
                lowestRank = id;
                lowestSpellId = spellId;
            }
        }
    }
    else
    {
        for (auto it = spellIds.rbegin(); it != spellIds.rend(); ++it)
        {
            auto spellId = *it;
            if (!highestSpellId)
                highestSpellId = spellId;
            if (saveMana == rank)
                return spellId;
            lowestSpellId = spellId;
            rank++;
        }
    }

    return saveMana > 1 ? lowestSpellId : highestSpellId;
}

uint32 VehicleSpellIdValue::Calculate()
{
#if PB_HAS_VEHICLES
    Vehicle* vehicle = bot->GetVehicle();
    if (!vehicle)
        return 0;

    // do not allow if no spells
    VehicleSeatEntry const* seat = vehicle->GetSeatForPassenger(bot);
    if (!seat || !(seat->m_flags & VEHICLE_SEAT_FLAG_CAN_CAST))
        return 0;

    Unit* vehicleBase = vehicle->GetBase();
    if (!vehicleBase->IsAlive())
        return 0;

    std::string namepart = qualifier;

    PlayerbotChatHandler handler(bot);
    uint32 extractedSpellId = handler.extractSpellId(namepart);
    if (extractedSpellId)
        if (SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(extractedSpellId))
            namepart = spellInfo->SpellName[0];

    std::wstring wnamepart;
    if (!Utf8toWStr(namepart, wnamepart))
        return 0;

    wstrToLower(wnamepart);
    char firstSymbol = tolower(namepart[0]);
    int spellLength = wnamepart.length();

    const int loc = LocaleConstant::LOCALE_enUS;

    Creature* creature = vehicleBase->ToCreature();
    for (uint32 x = 0; x < CREATURE_MAX_SPELLS; ++x)
    {
        uint32 spellId = creature->m_spells[x];
        if (spellId == 2)
            continue;

        SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
        if (!spellInfo || spellInfo->IsPassiveSpell())
            continue;

        std::string const& spellName = spellInfo->SpellName[loc];
        if (tolower(spellName[0]) != firstSymbol || spellName.length() != spellLength ||
            !Utf8FitTo(spellName.c_str(), wnamepart))
            continue;

        return spellId;
    }

    return 0;
#else
    return 0;
#endif
}
