/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "TameAction.h"
#include <algorithm>
#include <cctype>
#include <iomanip>
#include <random>
#include <set>
#include <sstream>
#include "DBCStructure.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Pet.h"
#include "Player.h"
#include "PlayerbotAI.h"
#include "PlayerbotFactory.h"
#include "SpellMgr.h"
#include "WorldSession.h"

bool TameAction::Execute(Event event)
{
    // Parse the user's input command into mode and value (e.g. "name wolf", "id 1234", etc.)
    std::string param = event.getParam();
    std::istringstream iss(param);
    std::string mode, value;
    iss >> mode;
    std::getline(iss, value);
    value.erase(0, value.find_first_not_of(" "));  // Remove leading spaces from value

    bool found = false;

    // If the command is "family" with no value, list all available pet families
    if (mode == "family" && value.empty())
    {
        botAI->TellError("Pet family listing not available in Vanilla. Use 'tame rename <name>' or 'tame abandon'.");
        return true;
    }

    // Handle "tame abandon" command to give up your current pet
    if (mode == "abandon")
    {
        return AbandonPet();
    }

    // Try to process the command based on mode and value
    if (mode == "name" && !value.empty())
    {
        botAI->TellError("Pet taming by name not available in Vanilla. Use 'tame rename <name>' or 'tame abandon'.");
        return false;
    }
    else if (mode == "id" && !value.empty())
    {
        botAI->TellError("Pet taming by ID not available in Vanilla. Use 'tame rename <name>' or 'tame abandon'.");
        return false;
    }
    else if (mode == "family" && !value.empty())
    {
        botAI->TellError("Pet taming by family not available in Vanilla. Use 'tame rename <name>' or 'tame abandon'.");
        return false;
    }
    else if (mode == "rename" && !value.empty())
    {
        found = RenamePet(value);
    }
    else
    {
        // Unrecognized command or missing argument; show usage
        botAI->TellError(
            "Usage: tame rename <new name> | tame abandon");
        return false;
    }

    // If the requested rename failed, return failure
    if (!found)
        return false;

    return true;
}

bool TameAction::RenamePet(const std::string& newName)
{
    Player* bot = botAI->GetBot();
    Pet* pet = bot->GetPet();
    // Check if the bot currently has a pet
    if (!pet)
    {
        botAI->TellError("You have no pet to rename.");
        return false;
    }

    // Validate the new name: must not be empty and max 12 characters
    if (newName.empty() || newName.length() > 12)
    {
        botAI->TellError("Pet name must be between 1 and 12 alphabetic characters.");
        return false;
    }

    // Ensure all characters in the new name are alphabetic
    for (char c : newName)
    {
        if (!std::isalpha(static_cast<unsigned char>(c)))
        {
            botAI->TellError("Pet name must only contain alphabetic characters (A-Z, a-z).");
            return false;
        }
    }

    // Normalize the name: capitalize the first letter, lowercase the rest
    std::string normalized = newName;
    normalized[0] = std::toupper(normalized[0]);
    for (size_t i = 1; i < normalized.size(); ++i)
        normalized[i] = std::tolower(normalized[i]);

    // Check if the new name is reserved or forbidden
    if (sObjectMgr.IsReservedName(normalized))
    {
        botAI->TellError("That pet name is forbidden. Please choose another name.");
        return false;
    }

    // Set the pet's name and save it to the database
    pet->SetName(normalized);
    pet->SavePetToDB(PET_SAVE_AS_CURRENT);
    bot->GetSession()->SendPetNameQuery(pet->GetGUID(), pet->GetEntry());

    // Notify the master about the rename and give a tip to update the client name display
    botAI->TellMaster("Your pet has been renamed to " + normalized + "!");
    botAI->TellMaster("If you do not see the new name, please dismiss and recall your pet.");

    return true;
}

bool TameAction::AbandonPet()
{
    // Get the bot player and its current pet (if any)
    Player* bot = botAI->GetBot();
    Pet* pet = bot->GetPet();

    // Check if the bot has a pet and that it is a hunter pet
    if (pet && pet->GetPetType() == HUNTER_PET)
    {
        // Remove the pet from the bot and mark it as deleted in the database
        bot->RemovePet(PET_SAVE_AS_DELETED);
        // Inform the bot's master/player that the pet was abandoned
        botAI->TellMaster("Your pet has been abandoned.");
        return true;
    }
    else
    {
        // If there is no hunter pet, show an error message
        botAI->TellError("You have no hunter pet to abandon.");
        return false;
    }
}
