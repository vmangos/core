/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "TrainerAction.h"

#include "BudgetValues.h"
#include "Event.h"
#include "PlayerbotFactory.h"
#include "Playerbots.h"

namespace
{
void ResetSpellRelatedValueCaches(PlayerbotAI* botAI)
{
    if (!botAI)
        return;

    AiObjectContext* context = botAI->GetAiObjectContext();
    if (!context)
        return;

    for (std::string const& name : context->GetValues())
    {
        if (name.rfind("spell id::", 0) == 0 || name.rfind("item for spell::", 0) == 0 ||
            name.rfind("spell cast useful::", 0) == 0)
        {
            if (UntypedValue* value = context->GetUntypedValue(name))
                value->Reset();
        }
    }
}
}

bool TrainerAction::Execute(Event event)
{
    botAI->TellError("Trainer command is temporarily disabled in Vanilla port.");
    return false;
}

bool MaintenanceAction::Execute(Event event)
{
    if (!sPlayerbotAIConfig.maintenanceCommand)
    {
        botAI->TellError("maintenance command is not allowed, please check the configuration.");
        return false;
    }

    botAI->TellMaster("I'm maintaining");
    PlayerbotFactory factory(bot, bot->GetLevel());

    if (!botAI->IsAlt())
    {
        factory.InitAttunementQuests();
        factory.InitBags(false);
        factory.InitAmmo();
        factory.InitFood();
        factory.InitReagents();
        factory.InitConsumables();
        factory.InitPotions();
        factory.InitTalentsTree(true);
        factory.InitPet();
        factory.InitPetTalents();
        factory.InitSkills();
        factory.InitClassSpells();
        factory.InitAvailableSpells();
        factory.InitReputation();
        factory.InitSpecialSpells();
        factory.InitMounts();
        factory.InitGlyphs(false);
        factory.InitKeyring();
        if (bot->GetLevel() >= sPlayerbotAIConfig.minEnchantingBotLevel)
            factory.ApplyEnchantAndGemsNew();
    }
    else
    {
        if (sPlayerbotAIConfig.altMaintenanceAttunementQs)
            factory.InitAttunementQuests();

        if (sPlayerbotAIConfig.altMaintenanceBags)
            factory.InitBags(false);

        if (sPlayerbotAIConfig.altMaintenanceAmmo)
            factory.InitAmmo();

        if (sPlayerbotAIConfig.altMaintenanceFood)
            factory.InitFood();

        if (sPlayerbotAIConfig.altMaintenanceReagents)
            factory.InitReagents();

        if (sPlayerbotAIConfig.altMaintenanceConsumables)
            factory.InitConsumables();

        if (sPlayerbotAIConfig.altMaintenancePotions)
            factory.InitPotions();

        if (sPlayerbotAIConfig.altMaintenanceTalentTree)
            factory.InitTalentsTree(true);

        if (sPlayerbotAIConfig.altMaintenancePet)
            factory.InitPet();

        if (sPlayerbotAIConfig.altMaintenancePetTalents)
            factory.InitPetTalents();

        if (sPlayerbotAIConfig.altMaintenanceSkills)
            factory.InitSkills();

        if (sPlayerbotAIConfig.altMaintenanceClassSpells)
            factory.InitClassSpells();

        if (sPlayerbotAIConfig.altMaintenanceAvailableSpells)
            factory.InitAvailableSpells();

        if (sPlayerbotAIConfig.altMaintenanceReputation)
            factory.InitReputation();

        if (sPlayerbotAIConfig.altMaintenanceSpecialSpells)
            factory.InitSpecialSpells();

        if (sPlayerbotAIConfig.altMaintenanceMounts)
            factory.InitMounts();

        if (sPlayerbotAIConfig.altMaintenanceGlyphs)
            factory.InitGlyphs(false);

        if (sPlayerbotAIConfig.altMaintenanceKeyring)
            factory.InitKeyring();

        if (sPlayerbotAIConfig.altMaintenanceGemsEnchants && bot->GetLevel() >= sPlayerbotAIConfig.minEnchantingBotLevel)
            factory.ApplyEnchantAndGemsNew();
    }

    ResetSpellRelatedValueCaches(botAI);

    bot->DurabilityRepairAll(false, 1.0f);

    return true;
}

bool RemoveGlyphAction::Execute(Event event)
{
    botAI->TellError("Glyphs are not available in Vanilla (WoW 1.12)");
    return false;
}

bool AutoGearAction::Execute(Event event)
{
    if (!sPlayerbotAIConfig.autoGearCommand)
    {
        botAI->TellError("autogear command is not allowed, please check the configuration.");
        return false;
    }

    if (!sPlayerbotAIConfig.autoGearCommandAltBots &&
        !sPlayerbotAIConfig.IsInRandomAccountList(bot->GetSession()->GetAccountId()))
    {
        botAI->TellError("You cannot use autogear on alt bots.");
        return false;
    }

    botAI->TellMaster("I'm auto gearing");
    uint32 gs = sPlayerbotAIConfig.autoGearScoreLimit == 0
                    ? 0
                    : PlayerbotFactory::CalcMixedGearScore(sPlayerbotAIConfig.autoGearScoreLimit,
                                                           sPlayerbotAIConfig.autoGearQualityLimit);
    PlayerbotFactory factory(bot, bot->GetLevel(), sPlayerbotAIConfig.autoGearQualityLimit, gs);
    factory.InitEquipment(true);
    factory.InitAmmo();
    if (bot->GetLevel() >= sPlayerbotAIConfig.minEnchantingBotLevel)
    {
        factory.ApplyEnchantAndGemsNew();
    }
    bot->DurabilityRepairAll(false, 1.0f);
    return true;
}
