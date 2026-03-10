/*
* Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
* and/or modify it under version 3 of the License, or (at your option), any later version.
*/

#include "RandomPlayerbotFactory.h"

#include "AccountMgr.h"
#include "ArenaTeamMgr.h"
#include "DatabaseEnv.h"
#include "Database/SqlOperations.h"
#include "GuildMgr.h"
#include "PlayerbotFactory.h"
#include "Playerbots.h"
#include "Player.h"
#include "PlayerbotGuildMgr.h"
#include "ScriptMgr.h"
#include "SharedDefines.h"
#include "SocialMgr.h"
#include "Timer.h"
#include "Guild.h"            // EmblemInfo::SaveToDB
#include "Log.h"
#include "GuildMgr.h"

namespace
{
class RandomBotLoginQueryHolder : public SqlQueryHolder
{
public:
    explicit RandomBotLoginQueryHolder(ObjectGuid guid) : SqlQueryHolder(guid.GetCounter()), guid_(guid) {}

    bool Initialize()
    {
        SetSize(MAX_PLAYER_LOGIN_QUERY);

        SetResult(PLAYER_LOGIN_QUERY_LOADFROM, CharacterDatabase.PQuery(
            "SELECT `guid`, `account`, `name`, `race`, `class`, `gender`, `level`, `xp`, `money`, `skin`, `face`, `hair_style`, `hair_color`, `facial_hair`, `bank_bag_slots`, `character_flags`, "
            "`position_x`, `position_y`, `position_z`, `map`, `orientation`, `known_taxi_mask`, `played_time_total`, `played_time_level`, `rest_bonus`, `logout_time`, `reset_talents_multiplier`, "
            "`reset_talents_time`, `transport_guid`, `transport_x`, `transport_y`, `transport_z`, `transport_o`, `extra_flags`, `stable_slots`, `death_expire_time`, `current_taxi_path`, "
            "`honor_rank_points`, `honor_highest_rank`, `honor_standing`, `honor_last_week_hk`, `honor_last_week_cp`, `honor_stored_hk`, `honor_stored_dk`, "
            "`watched_faction`, `drunk`, `health`, `power1`, `power2`, `power3`, `power4`, `power5`, `explored_zones`, `ammo_id`, `action_bars`, "
            "`world_phase_mask`, `create_time`, `instance` FROM `characters` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADGROUP, CharacterDatabase.PQuery(
            "SELECT `group_id` FROM `group_member` WHERE `member_guid` ='%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADBOUNDINSTANCES, CharacterDatabase.PQuery(
            "SELECT `id`, `permanent`, `map`, `reset_time` FROM `character_instance` LEFT JOIN `instance` ON `instance` = `id` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADAURAS, CharacterDatabase.PQuery(
            "SELECT `caster_guid`, `item_guid`, `spell`, `stacks`, `charges`, `base_points0`, `base_points1`, `base_points2`, `periodic_time0`, `periodic_time1`, `periodic_time2`, `max_duration`, `duration`, `effect_index_mask` FROM `character_aura` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADSPELLS, CharacterDatabase.PQuery(
            "SELECT `spell`, `active`, `disabled` FROM `character_spell` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADQUESTSTATUS, CharacterDatabase.PQuery(
            "SELECT `quest`, `status`, `rewarded`, `explored`, `timer`, `mob_count1`, `mob_count2`, `mob_count3`, `mob_count4`, `item_count1`, `item_count2`, `item_count3`, `item_count4`, `reward_choice` FROM `character_queststatus` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADHONORCP, CharacterDatabase.PQuery(
            "SELECT `victim_type`, `victim_id`, `cp`, `date`, `type` FROM `character_honor_cp` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADREPUTATION, CharacterDatabase.PQuery(
            "SELECT `faction`, `standing`, `flags` FROM `character_reputation` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADINVENTORY, CharacterDatabase.PQuery(
            "SELECT * FROM (SELECT `creator_guid`, `gift_creator_guid`, `count`, `duration`, `charges`, `flags`, `enchantments`, `random_property_id`, `durability`, `text`, `bag`, `slot`, `item_guid`, `item_instance`.`item_id`, `generated_loot` FROM `character_inventory` JOIN `item_instance` ON `character_inventory`.`item_guid` = `item_instance`.`guid` WHERE `character_inventory`.`guid` = '%u') as t ORDER BY `bag`, `slot`",
            guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADITEMLOOT, CharacterDatabase.PQuery(
            "SELECT `guid`, `item_id`, `amount`, `property` FROM `item_loot` WHERE `owner_guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADACTIONS, CharacterDatabase.PQuery(
            "SELECT `button`, `action`, `type` FROM `character_action` WHERE `guid` = '%u' ORDER BY `button`", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADSOCIALLIST, CharacterDatabase.PQuery(
            "SELECT `friend`, `flags` FROM `character_social` WHERE `guid` = '%u' LIMIT 255", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADHOMEBIND, CharacterDatabase.PQuery(
            "SELECT `map`, `zone`, `position_x`, `position_y`, `position_z` FROM `character_homebind` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADSPELLCOOLDOWNS, CharacterDatabase.PQuery(
            "SELECT `spell`, `spell_expire_time`, `category`, `category_expire_time`, `item_id` FROM `character_spell_cooldown` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADGUILD, CharacterDatabase.PQuery(
            "SELECT `guild_id`, `rank` FROM `guild_member` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADBGDATA, CharacterDatabase.PQuery(
            "SELECT `instance_id`, `team`, `join_x`, `join_y`, `join_z`, `join_o`, `join_map` FROM `character_battleground_data` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADACCOUNTDATA, CharacterDatabase.PQuery(
            "SELECT `type`, `time`, `data` FROM `character_account_data` WHERE `guid`='%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADSKILLS, CharacterDatabase.PQuery(
            "SELECT `skill`, `value`, `max` FROM `character_skills` WHERE `guid` = '%u'", guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADMAILS, CharacterDatabase.PQuery(
            "SELECT `id`, `message_type`, `sender_guid`, `receiver_guid`, `subject`, `item_text_id`, `expire_time`, `deliver_time`, `money`, `cod`, `checked`, `stationery`, `mail_template_id`, `has_items` FROM `mail` WHERE `receiver_guid` = '%u' ORDER BY `id` DESC",
            guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_LOADMAILEDITEMS, CharacterDatabase.PQuery(
            "SELECT `creator_guid`, `gift_creator_guid`, `count`, `duration`, `charges`, `flags`, `enchantments`, `random_property_id`, `durability`, `text`, `mail_id`, `item_guid`, `item_instance`.`item_id`, `generated_loot` FROM `mail_items` JOIN `item_instance` ON `item_guid` = `guid` WHERE `receiver_guid` = '%u'",
            guid_.GetCounter()));
        SetResult(PLAYER_LOGIN_QUERY_FORGOTTEN_SKILLS, CharacterDatabase.PQuery(
            "SELECT `skill`, `value` FROM `character_forgotten_skills` WHERE `guid` = '%u'", guid_.GetCounter()));

        return true;
    }

private:
    ObjectGuid guid_;
};
}  // namespace

constexpr RandomPlayerbotFactory::NameRaceAndGender RandomPlayerbotFactory::CombineRaceAndGender(uint8 race,
                                                                                                uint8 gender)
{
    NameRaceAndGender baseIndex;
    switch (race)
    {
        case RACE_ORC:        baseIndex = NameRaceAndGender::OrcMale; break;
        case RACE_DWARF:      baseIndex = NameRaceAndGender::DwarfMale; break;
        case RACE_NIGHTELF:   baseIndex = NameRaceAndGender::NightelfMale; break;
        case RACE_TAUREN:     baseIndex = NameRaceAndGender::TaurenMale; break;
        case RACE_GNOME:      baseIndex = NameRaceAndGender::GnomeMale; break;
        case RACE_TROLL:      baseIndex = NameRaceAndGender::TrollMale; break;
#if PB_COMPAT_VANILLA
#else
        case RACE_BLOODELF:   baseIndex = NameRaceAndGender::BloodelfMale; break;
        case RACE_DRAENEI:    baseIndex = NameRaceAndGender::DraeneiMale; break;
#endif
        case RACE_HUMAN:
        case RACE_UNDEAD_PLAYER:
        default:
            baseIndex = NameRaceAndGender::GenericMale;
            break;
    }

    return static_cast<NameRaceAndGender>(static_cast<uint8>(baseIndex) + ((gender >= GENDER_NONE) ? GENDER_MALE : gender));
}

bool RandomPlayerbotFactory::IsValidRaceClassCombination(uint8 race, uint8 cls, uint32 expansion)
{
    // skip expansion races - not available in Vanilla
    if (race == RACE_BLOODELF || race == RACE_DRAENEI)
        return false;

    // skip expansion classes - not available in Vanilla
    if (cls == CLASS_DEATH_KNIGHT)
        return false;

    PlayerInfo const* info = sObjectMgr.GetPlayerInfo(race, cls);
    return info != nullptr;
}

bool RandomPlayerbotFactory::LoadNameCacheEntry(
    NameRaceAndGender raceAndGender,
    std::unordered_map<NameRaceAndGender, std::vector<std::string>>& nameCache)
{
    std::vector<std::string>& names = nameCache[raceAndGender];
    if (!names.empty())
        return true;

    auto result = CharacterDatabase.PQuery(
        "SELECT n.name "
        "FROM playerbots_names n "
        "LEFT OUTER JOIN characters c ON c.name = n.name "
        "WHERE c.guid IS NULL AND n.gender = '%u' "
        "ORDER BY n.name_id "
        "LIMIT %u",
        static_cast<uint8>(raceAndGender), NameCacheBatchSize);
    if (!result)
        return false;

    do
    {
        Field* fields = result->Fetch();
        std::string const name = fields[0].GetCppString();
        if (sObjectMgr.CheckPlayerName(name) == CHAR_NAME_SUCCESS)
            names.push_back(name);
    } while (result->NextRow());

    return !names.empty();
}

bool RandomPlayerbotFactory::CreateRandomBot(WorldSession* session, uint8 cls, std::unordered_map<NameRaceAndGender, std::vector<std::string>>& nameCache)
{
    LOG_DEBUG("playerbots", "Creating a new random bot for class: %u", cls);

    std::vector<uint8> raceOptions;
    std::vector<uint8> allianceRaceOptions;
    std::vector<uint8> hordeRaceOptions;
    for (uint8 race = RACE_HUMAN; race < MAX_RACES; ++race)
    {
        // skip disabled with config races - not available in Vanilla, assume all enabled
        // if ((1 << (race - 1)) & sWorld.getIntConfig(CONFIG_CHARACTER_CREATING_DISABLED_RACEMASK))
        //     continue;

        if (!IsValidRaceClassCombination(race, cls, 0))
            continue;

        raceOptions.push_back(race);
        if (IsAlliance(race))
            allianceRaceOptions.push_back(race);
        else
            hordeRaceOptions.push_back(race);
    }

    if (raceOptions.empty())
    {
        LOG_ERROR("playerbots", "No races are available for class: %u", cls);
        return false;
    }

    // Preserve faction balancing only when the class is available to both factions.
    if (!allianceRaceOptions.empty() && !hordeRaceOptions.empty())
    {
        raceOptions = urand(0, 1) ? allianceRaceOptions : hordeRaceOptions;
    }

    const uint8 race = raceOptions[urand(0, raceOptions.size() - 1)];
    const uint8 gender = urand(0, 1) ? GENDER_MALE : GENDER_FEMALE;
    const auto raceAndGender = CombineRaceAndGender(race, gender);

    std::string name;
    if (!nameCache.empty())
    {
        if (!LoadNameCacheEntry(raceAndGender, nameCache))
        {
            LOG_ERROR("playerbots", "No names found for the specified race: %u and gender: %u",
                    race, gender);
            return false;
        }

        uint32 i = urand(0, nameCache[raceAndGender].size() - 1);
        name = nameCache[raceAndGender][i];
        swap(nameCache[raceAndGender][i], nameCache[raceAndGender].back());
        nameCache[raceAndGender].pop_back();
    }
    else
    {
        name = CreateRandomBotName(raceAndGender);
    }

    if (name.empty())
    {
        LOG_ERROR("playerbots", "Failed to get a valid random bot name");
        return false;
    }

    std::vector<uint8> skinColors, facialHairTypes;
    std::vector<std::pair<uint8, uint8>> faces, hairs;

    for (uint32 i = 0; i < sCharSectionsStore.GetNumRows(); ++i)
    {
        CharSectionsEntry const* charSection = sCharSectionsStore.LookupEntry(i);
        if (!charSection)
            continue;

        if (charSection->Race != race || charSection->Gender != gender)
            continue;

        switch (charSection->BaseSection)
        {
            case SECTION_TYPE_SKIN:
                skinColors.push_back(charSection->ColorIndex);
                break;
            case SECTION_TYPE_FACE:
                faces.push_back(std::pair<uint8, uint8>(charSection->VariationIndex, charSection->ColorIndex));
                break;
            case SECTION_TYPE_FACIAL_HAIR:
                facialHairTypes.push_back(charSection->VariationIndex);
                break;
            case SECTION_TYPE_HAIR:
                hairs.push_back(std::pair<uint8, uint8>(charSection->VariationIndex, charSection->ColorIndex));
                break;
        }
    }

    std::pair<uint8, uint8> face = faces[urand(0, faces.size() - 1)];
    std::pair<uint8, uint8> hair = hairs[urand(0, hairs.size() - 1)];

    bool excludeCheck = (race == RACE_TAUREN) || (race == RACE_DRAENEI) ||
                        (gender == GENDER_FEMALE && race != RACE_NIGHTELF && race != RACE_UNDEAD_PLAYER);
    uint8 facialHair = excludeCheck ? 0 : facialHairTypes[urand(0, facialHairTypes.size() - 1)];

    uint32 guidlow = sObjectMgr.GeneratePlayerLowGuid();

    if (!Player::SaveNewPlayer(session, guidlow, name, race, cls, gender, face.second, face.first, hair.first, hair.second, facialHair))
    {
        LOG_ERROR("playerbots",
            "Unable to persist random bot for account %u - name: \"%s\", race: %u, class: %u",
            session->GetAccountId(), name.c_str(), race, cls);
        return false;
    }

    std::unique_ptr<Player> bot(new Player(session));
    RandomBotLoginQueryHolder holder(ObjectGuid(HIGHGUID_PLAYER, guidlow));
    if (!holder.Initialize() || !bot->LoadFromDB(ObjectGuid(HIGHGUID_PLAYER, guidlow), &holder))
    {
        LOG_ERROR("playerbots",
            "Unable to materialize random bot state for account %u - name: \"%s\", guid: %u",
            session->GetAccountId(), name.c_str(), guidlow);
        return false;
    }

    bot->SaveToDB(false, false);

    if (PlayerCacheData* cacheData = sObjectMgr.GetPlayerDataByGUID(guidlow))
    {
        sObjectMgr.UpdatePlayerCachedPosition(cacheData, bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(),
            bot->GetPositionZ(), bot->GetOrientation(), false);
        cacheData->uiLevel = bot->GetLevel();
        cacheData->uiZoneId = bot->GetCachedZoneId();
    }

    LOG_DEBUG("playerbots", "Random bot created - name: \"%s\", race: %u, class: %u",
            name.c_str(), race, cls);

    return true;
}

std::string const RandomPlayerbotFactory::CreateRandomBotName(NameRaceAndGender raceAndGender)
{
    std::string botName = "";
    int tries = 3;
    while (--tries)
    {
        auto result = CharacterDatabase.PQuery(
            "SELECT n.name "
            "FROM playerbots_names n "
            "LEFT OUTER JOIN characters c ON c.name = n.name "
            "WHERE c.guid IS NULL and n.gender = '%u' "
            "ORDER BY RAND() LIMIT 1",
            static_cast<uint8>(raceAndGender));
        if (!result)
        {
            break;
        }

        Field* fields = result->Fetch();
        botName = fields[0].GetCppString();
        if (ObjectMgr::CheckPlayerName(botName) == CHAR_NAME_SUCCESS)
        {
            auto checkResult = CharacterDatabase.PQuery("SELECT guid FROM characters WHERE name = '%s'", botName.c_str());
            if (checkResult)
                continue;

            return botName;
        }
    }

    // CONLANG NAME GENERATION
    LOG_ERROR("playerbots", "No more names left for random bots. Attempting conlang name generation.");
    const std::string groupCategory = "SCVKRU";
    const std::string groupFormStart[2][4] = {{"SV", "SV", "VK", "RV"}, {"V", "SU", "VS", "RV"}};
    const std::string groupFormMid[2][6] = {{"CV", "CVC", "CVC", "CVK", "VC", "VK"},
                                            {"CV", "CVC", "CVK", "KVC", "VC", "KV"}};
    const std::string groupFormEnd[2][4] = {{"CV", "VC", "VK", "CV"}, {"RU", "UR", "VR", "V"}};
    const std::string groupLetter[2][6] = {
        // S           C                            V               K           R         U
        {"dtspkThfS", "bcCdfghjkmnNqqrrlsStTvwxyz", "aaeeiouA", "ppttkkbdg", "lmmnrr", "AEO"},
        {"dtskThfS", "bcCdfghjkmmnNqrrlssStTvwyz", "aaaeeiiuAAEIO", "ppttkbbdg", "lmmnrrr", "AEOy"}};
    const std::string replaceRule[2][17] = {
        {"ST", "ka", "ko", "ku", "kr", "S", "T", "C", "N", "jj", "AA", "AI", "A", "E", "O", "I", "aa"},
        {"sth", "ca", "co", "cu", "cr", "sh", "th", "ch", "ng", "dg", "A", "ayu", "ai", "ei", "ou", "iu", "ae"}};

    const auto gender = static_cast<uint8>(raceAndGender) % 2;

    tries = 10;
    while (--tries)
    {
        botName.clear();
        // Build name from groupForms
        // Pick random start group
        botName = groupFormStart[gender][rand() % 4];
        // Pick up to 2 and then up to 1 additional middle group
        for (int i = 0; i < rand() % 3 + rand() % 2; i++)
        {
            botName += groupFormMid[gender][rand() % 6];
        }
        // Pick up to 1 end group
        botName += rand() % 2 ? groupFormEnd[gender][rand() % 4] : "";
        // If name is single letter add random end group
        botName += (botName.size() < 2) ? groupFormEnd[gender][rand() % 4] : "";

        // Replace Catagory value with random Letter from that Catagory's Letter string for a given bot gender
        for (int i = 0; i < botName.size(); i++)
        {
            botName[i] = groupLetter[gender][groupCategory.find(botName[i])]
                                    [rand() % groupLetter[gender][groupCategory.find(botName[i])].size()];
        }

        // Itterate over replace rules
        for (int i = 0; i < 17; i++)
        {
            int j = botName.find(replaceRule[0][i]);
            while (j > -1)
            {
                botName.replace(j, replaceRule[0][i].size(), replaceRule[1][i]);
                j = botName.find(replaceRule[0][i]);
            }
        }

        // Capitalize first letter
        botName[0] -= 32;

        if (ObjectMgr::CheckPlayerName(botName) != CHAR_NAME_SUCCESS)
        {
            botName.clear();
            continue;
        }
        auto checkResult = CharacterDatabase.PQuery("SELECT guid FROM characters WHERE name = '%s'", botName.c_str());
        if (checkResult)
        {
            botName.clear();
            continue;
        }
        return std::move(botName);
    }

    // TRUE RANDOM NAME GENERATION
    LOG_ERROR("playerbots", "Con​lang name generation failed. True random name fallback.");
    tries = 10;
    while (--tries)
    {
        for (uint8 i = 0; i < 10; i++)
        {
            botName += (i == 0 ? 'A' : 'a') + rand() % 26;
        }
        if (ObjectMgr::CheckPlayerName(botName) != CHAR_NAME_SUCCESS)
        {
            botName.clear();
            continue;
        }
        auto checkResult = CharacterDatabase.PQuery("SELECT guid FROM characters WHERE name = '%s'", botName.c_str());
        if (checkResult)
        {
            botName.clear();
            continue;
        }
        return std::move(botName);
    }
    LOG_ERROR("playerbots", "Random name generation failed.");
    botName.clear();
    return std::move(botName);
}

// Calculates the total number of required accounts, either using the specified randomBotAccountCount
// or determining it dynamically based on MaxRandomBots, EnablePeriodicOnlineOffline and its ratio,
// and AddClassAccountPoolSize. The system also factors in the types of existing account, as assigned by
// AssignAccountTypes()
uint32 RandomPlayerbotFactory::CalculateTotalAccountCount()
{
    // Reset account types if features are disabled
    // Reset is done here to precede needed accounts calculations
    if (sPlayerbotAIConfig.maxRandomBots == 0 || sPlayerbotAIConfig.addClassAccountPoolSize == 0)
    {
        if (sPlayerbotAIConfig.maxRandomBots == 0)
        {
            // PlayerbotsDatabase.Execute("UPDATE playerbots_account_type SET account_type = 0 WHERE account_type = 1");
            LOG_INFO("playerbots", "MaxRandomBots set to 0, any RNDbot accounts (type 1) will be unassigned (type 0)");
        }
        if (sPlayerbotAIConfig.addClassAccountPoolSize == 0)
        {
            // PlayerbotsDatabase.Execute("UPDATE playerbots_account_type SET account_type = 0 WHERE account_type = 2");
            LOG_INFO("playerbots", "AddClassAccountPoolSize set to 0, any AddClass accounts (type 2) will be unassigned (type 0)");
        }

        // Wait for DB to reflect the change, up to 1 second max. This is needed to make sure other logs don't show wrong info
        // PlayerbotsDatabase not available in Vanilla - skip query
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
    }

    // Checks if randomBotAccountCount is set, otherwise calculate it dynamically.
    if (sPlayerbotAIConfig.randomBotAccountCount > 0)
        return sPlayerbotAIConfig.randomBotAccountCount;

    // Check existing account types
    uint32 existingRndBotAccounts = 0;
    uint32 existingAddClassAccounts = 0;
    uint32 existingUnassignedAccounts = 0;

    // PlayerbotsDatabase not available in Vanilla - skip type check query
    // Existing account counts will be calculated dynamically

    // Determine divisor based on Death Knight login eligibility and requested A&H faction ratio
    int divisor = CalculateAvailableCharsPerAccount();

    // Calculate max bots
    int maxBots = sPlayerbotAIConfig.maxRandomBots;
    // Take periodic online - offline into account
    if (sPlayerbotAIConfig.enablePeriodicOnlineOffline)
    {
        maxBots *= sPlayerbotAIConfig.periodicOnlineOfflineRatio;
    }

    // Calculate number of accounts needed for RNDbots
    // Result is rounded up for maxBots not cleanly divisible by the divisor
    uint32 neededRndBotAccounts = (maxBots + divisor - 1) / divisor;
    uint32 neededAddClassAccounts = sPlayerbotAIConfig.addClassAccountPoolSize;

    // Start with existing total
    uint32 existingTotal = existingRndBotAccounts + existingAddClassAccounts + existingUnassignedAccounts;

    // Calculate shortfalls after using unassigned accounts
    uint32 availableUnassigned = existingUnassignedAccounts;
    uint32 additionalAccountsNeeded = 0;

    // Check RNDbot needs
    if (neededRndBotAccounts > existingRndBotAccounts)
    {
        uint32 rndBotShortfall = neededRndBotAccounts - existingRndBotAccounts;
        if (rndBotShortfall <= availableUnassigned)
            availableUnassigned -= rndBotShortfall;
        else
        {
            additionalAccountsNeeded += (rndBotShortfall - availableUnassigned);
            availableUnassigned = 0;
        }
    }

    // Check AddClass needs
    if (neededAddClassAccounts > existingAddClassAccounts)
    {
        uint32 addClassShortfall = neededAddClassAccounts - existingAddClassAccounts;
        if (addClassShortfall <= availableUnassigned)
            availableUnassigned -= addClassShortfall;
        else
        {
            additionalAccountsNeeded += (addClassShortfall - availableUnassigned);
            availableUnassigned = 0;
        }
    }

    // Return existing total plus any additional accounts needed
    return existingTotal + additionalAccountsNeeded;
}

uint32 RandomPlayerbotFactory::CalculateAvailableCharsPerAccount()
{
    bool noDK = sPlayerbotAIConfig.disableDeathKnightLogin || true;

    uint32 availableChars = 9;

    uint32 hordeRatio = sPlayerbotAIConfig.randomBotHordeRatio;
    uint32 allianceRatio = sPlayerbotAIConfig.randomBotAllianceRatio;

    // horde : alliance = 50 : 50 -> 0%
    // horde : alliance = 0 : 50 -> 50%
    // horde : alliance = 10 : 50 -> 40%
    float unavailableRatio = static_cast<float>((std::max(hordeRatio, allianceRatio) - std::min(hordeRatio, allianceRatio))) /
        (std::max(hordeRatio, allianceRatio) * 2);

    if (unavailableRatio != 0)
    {
        // conservative floor to ensure enough chars (may result in more accounts than needed)
        availableChars = availableChars - availableChars * unavailableRatio;
    }

    return availableChars;
}

void RandomPlayerbotFactory::CreateRandomBots()
{
    /* multi-thread here is meaningless? since the async db operations */

    if (sPlayerbotAIConfig.deleteRandomBotAccounts)
    {
        std::vector<uint32> botAccounts;
        std::vector<uint32> botFriends;

        // Calculates the total number of required accounts.
        uint32 totalAccountCount = CalculateTotalAccountCount();

        for (uint32 accountNumber = 0; accountNumber < totalAccountCount; ++accountNumber)
        {
            std::ostringstream out;
            out << sPlayerbotAIConfig.randomBotAccountPrefix << accountNumber;
            std::string const accountName = out.str();

            if (uint32 accountId = sAccountMgr.GetId(accountName))
                botAccounts.push_back(accountId);
        }

        LOG_INFO("playerbots", "Deleting all random bot characters and accounts...");

        // First execute all the cleanup SQL commands
        // Clear playerbots_random_bots and playerbots_account_type
        // PlayerbotsDatabase.Execute("DELETE FROM playerbots_random_bots");
        // PlayerbotsDatabase.Execute("DELETE FROM playerbots_account_type");

        // Get the database names dynamically - not available in Vanilla, use hardcoded or skip
        // std::string loginDBName = LoginDatabase.GetConnectionInfo()->database;
        // std::string characterDBName = CharacterDatabase.GetConnectionInfo()->database;

        // Delete all characters from bot accounts - simplified query for Vanilla
        // CharacterDatabase.Execute("DELETE FROM characters WHERE account IN (SELECT id FROM " + loginDBName + ".account WHERE username LIKE '{}%%')",
        //     sPlayerbotAIConfig.randomBotAccountPrefix.c_str());

        // Wait for the characters to be deleted before proceeding to dependent deletes
// QueueSize not available in Vanilla
        {
            std::this_thread::sleep_for(std::chrono::seconds(1));
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(100));

        // Clean up orphaned entries in playerbots_guild_tasks
        // PlayerbotsDatabase.Execute("DELETE FROM playerbots_guild_tasks WHERE owner NOT IN (SELECT guid FROM " + characterDBName + ".characters)");

        // Clean up orphaned entries in playerbots_db_store
        // PlayerbotsDatabase not available in Vanilla - skip this query
        // PlayerbotsDatabase.Execute("DELETE FROM playerbots_db_store WHERE guid NOT IN (SELECT guid FROM " + characterDBName + ".characters WHERE account IN (SELECT id FROM " + loginDBName + ".account WHERE username NOT LIKE '{}%%'))",
        //     sPlayerbotAIConfig.randomBotAccountPrefix.c_str());

        // Clean up orphaned records in character-related tables
        CharacterDatabase.Execute("DELETE FROM arena_team_member WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM arena_team WHERE arenaTeamId NOT IN (SELECT arenaTeamId FROM arena_team_member)");
        CharacterDatabase.Execute("DELETE FROM character_account_data WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_achievement WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_achievement_progress WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_action WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_arena_stats WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_aura WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_entry_point WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_glyphs WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_homebind WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_inventory WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM item_instance WHERE owner_guid NOT IN (SELECT guid FROM characters) AND owner_guid > 0");

        // Clean up pet data
        CharacterDatabase.Execute("DELETE FROM character_pet WHERE owner NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM pet_aura WHERE guid NOT IN (SELECT id FROM character_pet)");
        CharacterDatabase.Execute("DELETE FROM pet_spell WHERE guid NOT IN (SELECT id FROM character_pet)");
        CharacterDatabase.Execute("DELETE FROM pet_spell_cooldown WHERE guid NOT IN (SELECT id FROM character_pet)");

        // Clean up character data
        CharacterDatabase.Execute("DELETE FROM character_queststatus WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_queststatus_rewarded WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_reputation WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_skills WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_social WHERE friend NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_spell WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_spell_cooldown WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM character_talent WHERE guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM corpse WHERE guid NOT IN (SELECT guid FROM characters)");

        // Clean up group data
        CharacterDatabase.Execute("DELETE FROM `groups` WHERE leaderGuid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM group_member WHERE memberGuid NOT IN (SELECT guid FROM characters)");

        // Clean up mail
        CharacterDatabase.Execute("DELETE FROM mail WHERE receiver NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM mail_items WHERE receiver NOT IN (SELECT guid FROM characters)");

        // Clean up guild data
        CharacterDatabase.Execute("DELETE FROM guild WHERE leaderguid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM guild_bank_eventlog WHERE guildid NOT IN (SELECT guildid FROM guild)");
        CharacterDatabase.Execute("DELETE FROM guild_member WHERE guildid NOT IN (SELECT guildid FROM guild) OR guid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM guild_rank WHERE guildid NOT IN (SELECT guildid FROM guild)");

        // Clean up petition data
        CharacterDatabase.Execute("DELETE FROM petition WHERE ownerguid NOT IN (SELECT guid FROM characters)");
        CharacterDatabase.Execute("DELETE FROM petition_sign WHERE ownerguid NOT IN (SELECT guid FROM characters) OR playerguid NOT IN (SELECT guid FROM characters)");

        // Finally, delete the bot accounts themselves
        LOG_INFO("playerbots", "Deleting random bot accounts...");
        auto results = LoginDatabase.PQuery("SELECT id FROM account WHERE username LIKE '%s%%'",
                                              sPlayerbotAIConfig.randomBotAccountPrefix.c_str());
        int32 deletion_count = 0;
        if (results)
        {
            do
            {
                Field* fields = results->Fetch();
                uint32 accId = fields[0].GetUInt32();
                LOG_DEBUG("playerbots", "Deleting account accID: %u(%d)...", accId, ++deletion_count);
                sAccountMgr.DeleteAccount(accId);
            } while (results->NextRow());
        }

        uint32 timer = getMSTime();

        // After ALL deletions, make sure data is commited to DB
        LoginDatabase.Execute("COMMIT");
        CharacterDatabase.Execute("COMMIT");
        // PlayerbotsDatabase.Execute("COMMIT");

        // Wait for all pending database operations to complete
// QueueSize not available in Vanilla
        {
            std::this_thread::sleep_for(std::chrono::seconds(1));
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(100));

        // Flush tables to ensure all data in memory are written to disk
        LoginDatabase.Execute("FLUSH TABLES");
        CharacterDatabase.Execute("FLUSH TABLES");
        // PlayerbotsDatabase.Execute("FLUSH TABLES");

        LOG_INFO("playerbots", ">> Random bot accounts and data deleted in %u ms", GetMSTimeDiffToNow(timer));
        LOG_INFO("playerbots", "Please reset the AiPlayerbot.DeleteRandomBotAccounts to 0 and restart the server...");
        World::StopNow(SHUTDOWN_EXIT_CODE);
        return;
    }

    LOG_INFO("playerbots", "Creating random bot accounts...");
    std::unordered_map<NameRaceAndGender, std::vector<std::string>> nameCache;
    // std::vector<std::future<void>> account_creations; // Not used in Vanilla - async not needed
    int account_creation = 0;

    // Calculates the total number of required accounts.
    uint32 totalAccountCount = CalculateTotalAccountCount();
    LOG_INFO("playerbots", "Random bot config: autologin=%s, min=%u, max=%u, account target=%u",
        sPlayerbotAIConfig.randomBotAutologin ? "true" : "false",
        sPlayerbotAIConfig.minRandomBots,
        sPlayerbotAIConfig.maxRandomBots,
        totalAccountCount);
    uint32 timer = getMSTime();

    for (uint32 accountNumber = 0; accountNumber < totalAccountCount; ++accountNumber)
    {
        std::ostringstream out;
        out << sPlayerbotAIConfig.randomBotAccountPrefix << accountNumber;
        std::string const accountName = out.str();

        auto result = LoginDatabase.PQuery("SELECT id FROM account WHERE username = '%s'", accountName.c_str());
        if (result)
        {
            continue;
        }
        account_creation++;
        std::string password = "";
        if (sPlayerbotAIConfig.randomBotRandomPassword)
        {
            for (int i = 0; i < 10; i++)
            {
                password += (char)urand('!', 'z');
            }
        }
        else
            password = accountName;

        sAccountMgr.CreateAccount(accountName, password);

        LOG_DEBUG("playerbots", "Account %s created for random bots", accountName.c_str());
    }
        if (account_creation)
        {
// QueueSize not available in Vanilla
            /* wait for async accounts create to make character create correctly */

// QueueSize not available in Vanilla
            {
                std::this_thread::sleep_for(std::chrono::seconds(1));
            }
            LOG_INFO("playerbots", ">> %u Accounts loaded into database in %u ms", account_creation, GetMSTimeDiffToNow(timer));
        }
        LOG_INFO("playerbots", ">> %u Accounts loaded into database in %u ms", account_creation, GetMSTimeDiffToNow(timer));

    LOG_INFO("playerbots", "Creating random bot characters...");
    uint32 totalRandomBotChars = 0;
    std::vector<WorldSession*> sessionBots;
    int bot_creation = 0;
    for (uint32 accountNumber = 0; accountNumber < totalAccountCount; ++accountNumber)
    {
        std::ostringstream out;
        out << sPlayerbotAIConfig.randomBotAccountPrefix << accountNumber;
        std::string const accountName = out.str();

        auto result = LoginDatabase.PQuery("SELECT id FROM account WHERE username = '%s'", accountName.c_str());
        if (!result)
            continue;

        Field* fields = result->Fetch();
        uint32 accountId = fields[0].GetUInt32();

        sPlayerbotAIConfig.randomBotAccounts.push_back(accountId);

        uint32 count = sAccountMgr.GetCharactersCount(accountId);
        if (count >= 10)
        {
            continue;
        }

        LOG_DEBUG("playerbots", "Creating random bot characters for account: [%u/%u]", accountNumber + 1, totalAccountCount);
        RandomPlayerbotFactory factory;

        WorldSession* session = new WorldSession(accountId, nullptr, SEC_PLAYER, 0, LOCALE_enUS);
        sessionBots.push_back(session);

        for (uint8 cls = CLASS_WARRIOR; cls < MAX_CLASSES - count; ++cls)
        {
            // skip nonexistent classes
            if (!((1 << (cls - 1)) & CLASSMASK_ALL_PLAYABLE) || !sChrClassesStore.LookupEntry(cls))
                continue;

            // skip disabled with config classes - not available in Vanilla, assume all enabled
            // if ((1 << (cls - 1)) & sWorld.getIntConfig(CONFIG_CHARACTER_CREATING_DISABLED_CLASSMASK))
            //     continue;

            if (!factory.CreateRandomBot(session, cls, nameCache))
            {
                LOG_ERROR("playerbots", "Failed to create persistent random bot character for account %u, class %u", accountId, cls);
                continue;
            }

            bot_creation++;
        }
    }

    if (bot_creation)
    {
// QueueSize not available in Vanilla
        /* wait for characters load into database, or characters will fail to loggin */
// QueueSize not available in Vanilla
        {
            std::this_thread::sleep_for(std::chrono::seconds(1));
        }
        LOG_INFO("playerbots", ">> %u Characters loaded into database in %u ms", bot_creation, GetMSTimeDiffToNow(timer));
    }

    for (WorldSession* session : sessionBots)
        delete session;

    for (uint32 accountId : sPlayerbotAIConfig.randomBotAccounts)
    {
        totalRandomBotChars += sAccountMgr.GetCharactersCount(accountId);
    }

    LOG_INFO("server.loading", ">> %zu random bot accounts with %u characters available",
            sPlayerbotAIConfig.randomBotAccounts.size(), totalRandomBotChars);

    if (!totalRandomBotChars)
    {
        LOG_WARN("playerbots", "No random bot characters are available after startup account scan");
    }
}

std::string const RandomPlayerbotFactory::CreateRandomGuildName()
{
    std::string guildName = "";

    auto result = CharacterDatabase.Query("SELECT MAX(name_id) FROM playerbots_guild_names");
    if (!result)
    {
        LOG_ERROR("playerbots", "No more names left for random guilds");
        return std::move(guildName);
    }

    Field* fields = result->Fetch();
    uint32 maxId = fields[0].GetUInt32();

    uint32 id = urand(0, maxId);
    result = CharacterDatabase.PQuery(
        "SELECT n.name FROM playerbots_guild_names n "
        "LEFT OUTER JOIN guild e ON e.name = n.name WHERE e.guildid IS NULL AND n.name_id >= %u LIMIT 1",
        id);
    if (!result)
    {
        LOG_ERROR("playerbots", "No more names left for random guilds");
        return std::move(guildName);
    }

    fields = result->Fetch();
    guildName = fields[0].GetCppString();

    return std::move(guildName);
}

void RandomPlayerbotFactory::CreateRandomArenaTeams(ArenaType type, uint32 count)
{
#if !PB_HAS_ARENA_TEAMS
    return;
#else
    std::vector<uint32> randomBots;

    auto result = // PlayerbotsDatabase.PQuery("SELECT bot FROM playerbots_random_bots WHERE event = 'add'");
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            uint32 bot = fields[0].GetUInt32();
            randomBots.push_back(bot);
        } while (result->NextRow());
    }

    uint32 arenaTeamNumber = 0;
    GuidVector availableCaptains;
    for (std::vector<uint32>::iterator i = randomBots.begin(); i != randomBots.end(); ++i)
    {
        ObjectGuid captain = ObjectGuid(*i);
        ArenaTeam* arenateam = sArenaTeamMgr->GetArenaTeamByCaptain(captain, type);
        if (arenateam)
        {
            ++arenaTeamNumber;
            sPlayerbotAIConfig.randomBotArenaTeams.push_back(arenateam->GetId());
        }
        else
        {
            Player* player = ObjectAccessor::FindConnectedPlayer(captain);

            if (!arenateam && player && player->GetLevel() >= 70)
                availableCaptains.push_back(captain);
        }
    }

    for (; arenaTeamNumber < count; ++arenaTeamNumber)
    {
        std::string const arenaTeamName = CreateRandomArenaTeamName();
        if (arenaTeamName.empty())
            continue;

        if (availableCaptains.empty())
        {
            LOG_ERROR("playerbots", "No captains for random arena teams available");
            continue;
        }

        uint32 index = urand(0, availableCaptains.size() - 1);
        ObjectGuid captain = availableCaptains[index];
        Player* player = ObjectAccessor::FindConnectedPlayer(captain);
        if (!player)
        {
            LOG_ERROR("playerbots", "Cannot find player for captain %u", captain.GetCounter());
            continue;
        }

        if (player->GetLevel() < 70)
        {
            LOG_ERROR("playerbots", "Bot %u must be level 70 to create an arena team", captain.GetCounter());
            continue;
        }

        // Below query no longer required as now user has control over the number of each type of arena team they want
        // to create. Keeping commented for potential future reference. QueryResult results =
        // CharacterDatabase.Query("SELECT `type` FROM playerbots_arena_team_names WHERE name = '{}'",
        // arenaTeamName.c_str()); if (!results)
        // {
        //     LOG_ERROR("playerbots", "No valid types for arena teams");
        //     return;
        // }

        // Field* fields = results->Fetch();
        // uint8 slot = fields[0].GetUInt8();

        ArenaTeam* arenateam = new ArenaTeam();
        if (!arenateam->Create(player->GetGUID(), type, arenaTeamName, 0, 0, 0, 0))
        {
            LOG_ERROR("playerbots", "Error creating arena team %s", arenaTeamName.c_str());
            continue;
        }

        arenateam->SetCaptain(player->GetGUID());

        // set random rating
        arenateam->SetRatingForAll(
            urand(sPlayerbotAIConfig.randomBotArenaTeamMinRating, sPlayerbotAIConfig.randomBotArenaTeamMaxRating));

        // set random emblem
        uint32 backgroundColor = urand(0xFF000000, 0xFFFFFFFF);
        uint32 emblemStyle = urand(0, 101);
        uint32 emblemColor = urand(0xFF000000, 0xFFFFFFFF);
        uint32 borderStyle = urand(0, 5);
        uint32 borderColor = urand(0xFF000000, 0xFFFFFFFF);
        arenateam->SetEmblem(backgroundColor, emblemStyle, emblemColor, borderStyle, borderColor);

        // set random kills (wip)
        // arenateam->SetStats(STAT_TYPE_GAMES_WEEK, urand(0, 30));
        // arenateam->SetStats(STAT_TYPE_WINS_WEEK, urand(0, arenateam->GetStats().games_week));
        // arenateam->SetStats(STAT_TYPE_GAMES_SEASON, urand(arenateam->GetStats().games_week,
        // arenateam->GetStats().games_week * 5)); arenateam->SetStats(STAT_TYPE_WINS_SEASON,
        // urand(arenateam->GetStats().wins_week, arenateam->GetStats().games
        arenateam->SaveToDB();

        sArenaTeamMgr->AddArenaTeam(arenateam);
        sPlayerbotAIConfig.randomBotArenaTeams.push_back(arenateam->GetId());
    }

    LOG_DEBUG("playerbots", "%u random bot %uv%u arena teams available", arenaTeamNumber, type, type);
#endif
}

std::string const RandomPlayerbotFactory::CreateRandomArenaTeamName()
{
#if !PB_HAS_ARENA_TEAMS
    return "";
#else
    std::string arenaTeamName = "";

    auto result = CharacterDatabase.Query("SELECT MAX(name_id) FROM playerbots_arena_team_names");
    if (!result)
    {
        LOG_ERROR("playerbots", "No more names left for random arena teams");
        return std::move(arenaTeamName);
    }

    Field* fields = result->Fetch();
    uint32 maxId = fields[0].GetUInt32();

    uint32 id = urand(0, maxId);
    result = CharacterDatabase.PQuery(
        "SELECT n.name FROM playerbots_arena_team_names n LEFT OUTER JOIN arena_team e ON e.name = n.name "
        "WHERE e.arenateamid IS NULL AND n.name_id >= %u LIMIT 1",
        id);

    if (!result)
    {
        LOG_ERROR("playerbots", "No more names left for random arena teams");
        return std::move(arenaTeamName);
    }

    fields = result->Fetch();
    arenaTeamName = fields[0].GetCppString();

    return std::move(arenaTeamName);
#endif
}
