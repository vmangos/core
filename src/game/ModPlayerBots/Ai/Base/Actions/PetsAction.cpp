/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PetsAction.h"

#include "CharmInfo.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "Pet.h"
#include "Player.h"
#include "PlayerbotAI.h"
#include "SharedDefines.h"
#include "Objects/UnitDefines.h"

bool PetsAction::Execute(Event event)
{
    // Extract the command parameter from the event (e.g., "aggressive", "defensive", "attack", etc.)
    std::string param = event.getParam();
    if (param.empty() && !defaultCmd.empty())
        param = defaultCmd;

    if (param.empty())
    {
        // If no parameter is provided, show usage instructions and return.
        std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pet_usage_error", "Usage: pet <aggressive|defensive|passive|stance|attack|follow|stay>", {});
        botAI->TellError(text);
        return false;
    }

    Player* bot = botAI->GetBot();

    // Collect all controlled pets and guardians, except totems, into the targets vector.
    std::vector<Creature*> targets;
    Pet* pet = bot->GetPet();
    if (pet)
        targets.push_back(pet);

    bot->CallForAllControlledUnits([&targets, pet](Unit* unit)
    {
        Creature* creature = dynamic_cast<Creature*>(unit);
        if (!creature)
            return;
        if (pet && creature == pet)
            return;
        if (creature->IsTotem())
            return;
        targets.push_back(creature);
    }, CONTROLLED_GUARDIANS);

    // If no pets or guardians are found, notify and return.
    if (targets.empty())
    {
        std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pet_no_pet_error", "You have no pet or guardian pet.", {});
        botAI->TellError(text);
        return false;
    }

    ReactStates react;
    std::string stanceText;

    // Handle stance commands: aggressive, defensive, or passive.
    if (param == "aggressive")
    {
        react = REACT_AGGRESSIVE;
        stanceText = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pet_stance_aggressive", "aggressive", {});
    }
    else if (param == "defensive")
    {
        react = REACT_DEFENSIVE;
        stanceText = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pet_stance_defensive", "defensive", {});
    }
    else if (param == "passive")
    {
        react = REACT_PASSIVE;
        stanceText = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pet_stance_passive", "passive", {});
    }
    // The "stance" command simply reports the current stance of each pet/guardian.
    else if (param == "stance")
    {
        for (Creature* target : targets)
        {
            std::string type = target->IsPet() ?
                PlayerbotTextMgr::instance().GetBotTextOrDefault("pet_type_pet", "pet", {}) :
                PlayerbotTextMgr::instance().GetBotTextOrDefault("pet_type_guardian", "guardian", {});
            std::string name = target->GetName();
            std::string stance;
            switch (target->GetReactState())
            {
                case REACT_AGGRESSIVE:
                    stance = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                        "pet_stance_aggressive", "aggressive", {});
                    break;
                case REACT_DEFENSIVE:
                    stance = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                        "pet_stance_defensive", "defensive", {});
                    break;
                case REACT_PASSIVE:
                    stance = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                        "pet_stance_passive", "passive", {});
                    break;
                default:
                    stance = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                        "pet_stance_unknown", "unknown", {});
                    break;
            }
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_stance_report", "Current stance of %type \"%name\": %stance.",
                {{"type", type}, {"name", name}, {"stance", stance}});
            botAI->TellMaster(text);
        }
        return true;
    }
    // The "attack" command forces pets/guardians to attack the master's selected target.
    else if (param == "attack")
    {
        // Try to get the master's selected target.
        Player* master = botAI->GetMaster();
        Unit* targetUnit = nullptr;

        if (master)
        {
            ObjectGuid masterTargetGuid = master->GetSelectionGuid();
            if (!masterTargetGuid.IsEmpty())
                targetUnit = botAI->GetUnit(masterTargetGuid);
        }

        // If no valid target is selected, show an error and return.
        if (!targetUnit)
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_no_target_error", "No valid target selected by master.", {});
            botAI->TellError(text);
            return false;
        }
        if (!targetUnit->IsAlive())
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_target_dead_error", "Target is not alive.", {});
            botAI->TellError(text);
            return false;
        }
        if (!bot->IsValidAttackTarget(targetUnit))
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_invalid_target_error", "Target is not a valid attack target for the bot.", {});
            botAI->TellError(text);
            return false;
        }
        if (sPlayerbotAIConfig.IsPvpProhibited(bot->GetZoneId(), bot->GetAreaId()) &&
            (targetUnit->IsPlayer() || targetUnit->IsPet()) &&
            (!bot->m_duel || bot->m_duel->opponent != targetUnit))
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_pvp_prohibited_error", "I cannot command my pet to attack players in PvP prohibited areas.", {});
            botAI->TellError(text);
            return false;
        }

        bool didAttack = false;
        // For each controlled pet/guardian, command them to attack the selected target.
        for (Creature* petCreature : targets)
        {
            CharmInfo* charmInfo = petCreature->GetCharmInfo();
            if (!charmInfo)
                continue;

            petCreature->ClearUnitState(UNIT_STATE_FOLLOW);
            // Only command attack if not already attacking the target, or if not currently under command attack.
            if (petCreature->GetVictim() != targetUnit ||
                (petCreature->GetVictim() == targetUnit && !charmInfo->IsCommandAttack()))
            {
                if (petCreature->GetVictim())
                    petCreature->AttackStop();

                if (!petCreature->IsPlayer() && petCreature->ToCreature()->AI() != nullptr)
                {
                    // For AI-enabled creatures (NPC pets/guardians): issue attack command and set flags.
                    charmInfo->SetIsCommandAttack(true);
                    charmInfo->SetIsAtStay(false);
                    charmInfo->SetIsFollowing(false);
                    charmInfo->SetIsCommandFollow(false);
                    charmInfo->SetIsReturning(false);

                    petCreature->ToCreature()->AI()->AttackStart(targetUnit);

                    didAttack = true;
                }
                else  // For charmed player pets/guardians
                {
                    if (petCreature->GetVictim() && petCreature->GetVictim() != targetUnit)
                        petCreature->AttackStop();

                    charmInfo->SetIsCommandAttack(true);
                    charmInfo->SetIsAtStay(false);
                    charmInfo->SetIsFollowing(false);
                    charmInfo->SetIsCommandFollow(false);
                    charmInfo->SetIsReturning(false);

                    petCreature->Attack(targetUnit, true);
                    didAttack = true;
                }
            }
        }
        // Inform the master if the command succeeded or failed.
        if (didAttack && sPlayerbotAIConfig.petChatCommandDebug == 1)
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_attack_success", "Pet commanded to attack your target.", {});
            botAI->TellMaster(text);
        }
        else if (!didAttack)
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_attack_failed", "Pet did not attack. (Already attacking or unable to attack target)", {});
            botAI->TellError(text);
        }
        return didAttack;
    }
    // The "follow" command makes all pets/guardians follow the bot.
    else if (param == "follow")
    {
        botAI->PetFollow();
        if (sPlayerbotAIConfig.petChatCommandDebug == 1)
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_follow_success", "Pet commanded to follow.", {});
            botAI->TellMaster(text);
        }
        return true;
    }
    // The "stay" command causes all pets/guardians to stop and stay in place.
    else if (param == "stay")
    {
        for (Creature* target : targets)
        {
            target->StopMoving();
            target->GetMotionMaster()->Clear(false);
            target->GetMotionMaster()->MoveIdle();

            CharmInfo* charmInfo = target->GetCharmInfo();
            if (charmInfo)
            {
                // Set charm/pet state flags for "stay".
                charmInfo->SetCommandState(COMMAND_STAY);
                charmInfo->SetIsCommandAttack(false);
                charmInfo->SetIsCommandFollow(false);
                charmInfo->SetIsFollowing(false);
                charmInfo->SetIsReturning(false);
                charmInfo->SetIsAtStay(true);
                charmInfo->SaveStayPosition();
            }
        }
        if (sPlayerbotAIConfig.petChatCommandDebug == 1)
        {
            std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
                "pet_stay_success", "Pet commanded to stay.", {});
            botAI->TellMaster(text);
        }
        return true;
    }
    // Unknown command: show usage instructions and return.
    else
    {
        std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pet_unknown_command_error", "Unknown pet command: %param. Use: pet <aggressive|defensive|passive|stance|attack|follow|stay>",
            {{"param", param}});
        botAI->TellError(text);
        return false;
    }

    // For stance commands, apply the chosen stance to all targets.
    for (Creature* target : targets)
    {
        target->SetReactState(react);
    }

    // Inform the master of the new stance if debug is enabled.
    if (sPlayerbotAIConfig.petChatCommandDebug == 1)
    {
        std::string text = PlayerbotTextMgr::instance().GetBotTextOrDefault(
            "pet_stance_set_success", "Pet stance set to %stance.",
            {{"stance", stanceText}});
        botAI->TellMaster(text);
    }

    return true;
}
