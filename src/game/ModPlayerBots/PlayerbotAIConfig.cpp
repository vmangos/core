/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PlayerbotAIConfig.h"
#include <iostream>
#include "Config/Config.h"
#include "NewRpgInfo.h"
#include "PlayerbotDungeonRepository.h"
#include "PlayerbotFactory.h"
#include "Playerbots.h"
#include "PlayerbotGuildMgr.h"
#include "RandomItemMgr.h"
#include "RandomPlayerbotFactory.h"
#include "RandomPlayerbotMgr.h"
#include "Mgr/Travel/TravelMgr.h"
#include "Talentspec.h"

template <class T>
void LoadList(std::string const value, T& list)
{
    std::vector<std::string> ids = split(value, ',');
    for (std::vector<std::string>::iterator i = ids.begin(); i != ids.end(); i++)
    {
        uint32 id = atoi((*i).c_str());
        // if (!id)
        //     continue;
        list.push_back(id);
    }
}

template <class T>
void LoadSet(std::string const value, T& set)
{
    std::vector<std::string> ids = split(value, ',');
    for (std::vector<std::string>::iterator i = ids.begin(); i != ids.end(); i++)
    {
        uint32 id = atoi((*i).c_str());
        // if (!id)
        //     continue;
        set.insert(id);
    }
}

template <class T>
void LoadListString(std::string const value, T& list)
{
    std::vector<std::string> strings = split(value, ',');
    for (std::vector<std::string>::iterator i = strings.begin(); i != strings.end(); i++)
    {
        std::string const string = *i;
        if (string.empty())
            continue;

        list.push_back(string);
    }
}

bool PlayerbotAIConfig::Initialize()
{
    LOG_INFO("server.loading", "Initializing mod-playerbots, based on AI Playerbots by ike3 and the original Playerbots by blueboy");

    enabled = sConfig.GetBoolDefault("AiPlayerbot.Enabled", true);
    if (!enabled)
    {
        LOG_INFO("server.loading", "Playerbots Module is disabled in playerbots.conf");
        return false;
    }

    globalCoolDown = sConfig.GetIntDefault("AiPlayerbot.GlobalCooldown", 500);
    maxWaitForMove = sConfig.GetIntDefault("AiPlayerbot.MaxWaitForMove", 5000);
    disableMoveSplinePath = sConfig.GetIntDefault("AiPlayerbot.DisableMoveSplinePath", 0);
    maxMovementSearchTime = sConfig.GetIntDefault("AiPlayerbot.MaxMovementSearchTime", 3);
    expireActionTime = sConfig.GetIntDefault("AiPlayerbot.ExpireActionTime", 5000);
    dispelAuraDuration = sConfig.GetIntDefault("AiPlayerbot.DispelAuraDuration", 700);
    reactDelay = sConfig.GetIntDefault("AiPlayerbot.ReactDelay", 100);
    dynamicReactDelay = sConfig.GetBoolDefault("AiPlayerbot.DynamicReactDelay", true);
    passiveDelay = sConfig.GetIntDefault("AiPlayerbot.PassiveDelay", 10000);
    repeatDelay = sConfig.GetIntDefault("AiPlayerbot.RepeatDelay", 2000);
    errorDelay = sConfig.GetIntDefault("AiPlayerbot.ErrorDelay", 100);
    rpgDelay = sConfig.GetIntDefault("AiPlayerbot.RpgDelay", 10000);
    sitDelay = sConfig.GetIntDefault("AiPlayerbot.SitDelay", 20000);
    returnDelay = sConfig.GetIntDefault("AiPlayerbot.ReturnDelay", 2000);
    lootDelay = sConfig.GetIntDefault("AiPlayerbot.LootDelay", 1000);
    minBotsForGreaterBuff = sConfig.GetIntDefault("AiPlayerbot.MinBotsForGreaterBuff", 3);
    rpWarningCooldown     = sConfig.GetIntDefault("AiPlayerbot.RPWarningCooldown", 30);
    disabledWithoutRealPlayerLoginDelay = sConfig.GetIntDefault("AiPlayerbot.DisabledWithoutRealPlayerLoginDelay", 30);
    disabledWithoutRealPlayerLogoutDelay = sConfig.GetIntDefault("AiPlayerbot.DisabledWithoutRealPlayerLogoutDelay", 300);

    farDistance = sConfig.GetFloatDefault("AiPlayerbot.FarDistance", 20.0f);
    sightDistance = sConfig.GetFloatDefault("AiPlayerbot.SightDistance", 100.0f);
    spellDistance = sConfig.GetFloatDefault("AiPlayerbot.SpellDistance", 28.5f);
    shootDistance = sConfig.GetFloatDefault("AiPlayerbot.ShootDistance", 5.0f);
    healDistance = sConfig.GetFloatDefault("AiPlayerbot.HealDistance", 38.5f);
    lootDistance = sConfig.GetFloatDefault("AiPlayerbot.LootDistance", 15.0f);
    fleeDistance = sConfig.GetFloatDefault("AiPlayerbot.FleeDistance", 5.0f);
    aggroDistance = sConfig.GetFloatDefault("AiPlayerbot.AggroDistance", 22.0f);
    tooCloseDistance = sConfig.GetFloatDefault("AiPlayerbot.TooCloseDistance", 5.0f);
    meleeDistance = sConfig.GetFloatDefault("AiPlayerbot.MeleeDistance", 0.75f);
    followDistance = sConfig.GetFloatDefault("AiPlayerbot.FollowDistance", 1.5f);
    whisperDistance = sConfig.GetFloatDefault("AiPlayerbot.WhisperDistance", 6000.0f);
    contactDistance = sConfig.GetFloatDefault("AiPlayerbot.ContactDistance", 0.45f);
    aoeRadius = sConfig.GetFloatDefault("AiPlayerbot.AoeRadius", 10.0f);
    rpgDistance = sConfig.GetFloatDefault("AiPlayerbot.RpgDistance", 200.0f);
    grindDistance = sConfig.GetFloatDefault("AiPlayerbot.GrindDistance", 75.0f);
    reactDistance = sConfig.GetFloatDefault("AiPlayerbot.ReactDistance", 150.0f);

    criticalHealth = sConfig.GetIntDefault("AiPlayerbot.CriticalHealth", 25);
    lowHealth = sConfig.GetIntDefault("AiPlayerbot.LowHealth", 45);
    mediumHealth = sConfig.GetIntDefault("AiPlayerbot.MediumHealth", 65);
    almostFullHealth = sConfig.GetIntDefault("AiPlayerbot.AlmostFullHealth", 85);
    lowMana = sConfig.GetIntDefault("AiPlayerbot.LowMana", 15);
    mediumMana = sConfig.GetIntDefault("AiPlayerbot.MediumMana", 40);
    highMana = sConfig.GetIntDefault("AiPlayerbot.HighMana", 65);
    autoSaveMana = sConfig.GetBoolDefault("AiPlayerbot.AutoSaveMana", true);
    saveManaThreshold = sConfig.GetIntDefault("AiPlayerbot.SaveManaThreshold", 60);
    autoAvoidAoe = sConfig.GetBoolDefault("AiPlayerbot.AutoAvoidAoe", true);
    maxAoeAvoidRadius = sConfig.GetFloatDefault("AiPlayerbot.MaxAoeAvoidRadius", 15.0f);
    LoadSet<std::set<uint32>>(sConfig.GetStringDefault("AiPlayerbot.AoeAvoidSpellWhitelist", "50759,57491,13810,29946"),
                              aoeAvoidSpellWhitelist);
    tellWhenAvoidAoe = sConfig.GetBoolDefault("AiPlayerbot.TellWhenAvoidAoe", false);

    randomGearLoweringChance = sConfig.GetFloatDefault("AiPlayerbot.RandomGearLoweringChance", 0.0f);
    incrementalGearInit = sConfig.GetBoolDefault("AiPlayerbot.IncrementalGearInit", true);
    randomGearQualityLimit = sConfig.GetIntDefault("AiPlayerbot.RandomGearQualityLimit", 3);
    randomGearScoreLimit = sConfig.GetIntDefault("AiPlayerbot.RandomGearScoreLimit", 0);

    randomBotMinLevelChance = sConfig.GetFloatDefault("AiPlayerbot.RandomBotMinLevelChance", 0.1f);
    randomBotMaxLevelChance = sConfig.GetFloatDefault("AiPlayerbot.RandomBotMaxLevelChance", 0.1f);
    randomBotRpgChance = sConfig.GetFloatDefault("AiPlayerbot.RandomBotRpgChance", 0.20f);
    enablePopulationDirector = sConfig.GetBoolDefault("AiPlayerbot.EnablePopulationDirector", true);
    populationDirectorUpdateInterval = sConfig.GetIntDefault("AiPlayerbot.PopulationDirectorUpdateInterval", 60);
    populationDirectorPlayerHeatSigma =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorPlayerHeatSigma", 3000.0f);
    populationDirectorPlayerHeatHalfLife =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorPlayerHeatHalfLife", 900.0f);
    populationDirectorMinDwell = sConfig.GetIntDefault("AiPlayerbot.PopulationDirectorMinDwell", 600);
    populationDirectorMaxDwell = sConfig.GetIntDefault("AiPlayerbot.PopulationDirectorMaxDwell", 1800);
    populationDirectorMaxMovesPerTick = sConfig.GetIntDefault("AiPlayerbot.PopulationDirectorMaxMovesPerTick", 25);
    populationDirectorZoneMaxDynamicPct =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorZoneMaxDynamicPct", 0.18f);
    populationDirectorWeightPlayerHeat =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorWeight.PlayerHeat", 0.55f);
    populationDirectorWeightLevelMatch =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorWeight.LevelMatch", 0.20f);
    populationDirectorWeightRecentPresence =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorWeight.RecentPresence", 0.10f);
    populationDirectorWeightDiversity =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorWeight.Diversity", 0.15f);
    populationDirectorWeightSaturationPenalty =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorWeight.SaturationPenalty", 0.35f);
    populationDirectorHaloRadius =
        sConfig.GetFloatDefault("AiPlayerbot.PopulationDirectorHaloRadius", 5000.0f);

    iterationsPerTick = sConfig.GetIntDefault("AiPlayerbot.IterationsPerTick", 10);

    allowAccountBots = sConfig.GetBoolDefault("AiPlayerbot.AllowAccountBots", true);
    allowGuildBots = sConfig.GetBoolDefault("AiPlayerbot.AllowGuildBots", true);
    allowTrustedAccountBots = sConfig.GetBoolDefault("AiPlayerbot.AllowTrustedAccountBots", true);
    disabledWithoutRealPlayer = sConfig.GetBoolDefault("AiPlayerbot.DisabledWithoutRealPlayer", false);
    randomBotGuildNearby = sConfig.GetBoolDefault("AiPlayerbot.RandomBotGuildNearby", false);
    randomBotInvitePlayer = sConfig.GetBoolDefault("AiPlayerbot.RandomBotInvitePlayer", false);
    inviteChat = sConfig.GetBoolDefault("AiPlayerbot.InviteChat", false);

    randomBotMapsAsString = sConfig.GetStringDefault("AiPlayerbot.RandomBotMaps", "0,1,530,571");
    LoadList<std::vector<uint32>>(randomBotMapsAsString, randomBotMaps);
    probTeleToBankers = sConfig.GetFloatDefault("AiPlayerbot.ProbTeleToBankers", 0.25f);
    probTeleToBankersCity = sConfig.GetFloatDefault("AiPlayerbot.ProbTeleToBankersCity", probTeleToBankers);
    probTeleToBankersReserveStarter =
        sConfig.GetFloatDefault("AiPlayerbot.ProbTeleToBankersReserveStarter", probTeleToBankers);
    probTeleToBankersWorld = sConfig.GetFloatDefault("AiPlayerbot.ProbTeleToBankersWorld", probTeleToBankers);
    enableWeightTeleToCityBankers = sConfig.GetBoolDefault("AiPlayerbot.EnableWeightTeleToCityBankers", false);
    weightTeleToStormwind = sConfig.GetIntDefault("AiPlayerbot.TeleToStormwindWeight", 2);
    weightTeleToIronforge = sConfig.GetIntDefault("AiPlayerbot.TeleToIronforgeWeight", 1);
    weightTeleToDarnassus = sConfig.GetIntDefault("AiPlayerbot.TeleToDarnassusWeight", 1);
    weightTeleToExodar = sConfig.GetIntDefault("AiPlayerbot.TeleToExodarWeight", 1);
    weightTeleToOrgrimmar = sConfig.GetIntDefault("AiPlayerbot.TeleToOrgrimmarWeight", 2);
    weightTeleToUndercity = sConfig.GetIntDefault("AiPlayerbot.TeleToUndercityWeight", 1);
    weightTeleToThunderBluff = sConfig.GetIntDefault("AiPlayerbot.TeleToThunderBluffWeight", 1);
    weightTeleToSilvermoonCity = sConfig.GetIntDefault("AiPlayerbot.TeleToSilvermoonCityWeight", 1);
    weightTeleToShattrathCity = sConfig.GetIntDefault("AiPlayerbot.TeleToShattrathCityWeight", 1);
    weightTeleToDalaran = sConfig.GetIntDefault("AiPlayerbot.TeleToDalaranWeight", 1);
    enableCapitalCityPopulation = sConfig.GetBoolDefault("AiPlayerbot.EnableCapitalCityPopulation", true);
    minStormwindBots = sConfig.GetIntDefault("AiPlayerbot.MinStormwindBots", 20);
    minOrgrimmarBots = sConfig.GetIntDefault("AiPlayerbot.MinOrgrimmarBots", 20);
    capitalCityMinLevel = sConfig.GetIntDefault("AiPlayerbot.CapitalCityMinLevel", 20);
    capitalCityDwellMin = sConfig.GetIntDefault("AiPlayerbot.CapitalCityDwellMin", 600);
    capitalCityDwellMax = sConfig.GetIntDefault("AiPlayerbot.CapitalCityDwellMax", 1800);
    capitalCityCheckInterval = sConfig.GetIntDefault("AiPlayerbot.CapitalCityCheckInterval", 60);
    capitalCityProtectFromLogout = sConfig.GetBoolDefault("AiPlayerbot.CapitalCityProtectFromLogout", true);
    LoadList<std::vector<uint32>>(
        sConfig.GetStringDefault("AiPlayerbot.RandomBotQuestItems",
                                           "5175,5176,5177,5178,6948,11000,12382,13704,16309"),
        randomBotQuestItems);
    LoadList<std::vector<uint32>>(sConfig.GetStringDefault("AiPlayerbot.RandomBotSpellIds", ""),
                                  randomBotSpellIds);
    randomBotSpellIds.erase(
        std::remove_if(
            randomBotSpellIds.begin(), randomBotSpellIds.end(),
            [](uint32 spellId)
            {
                if (!spellId)
                    return true;

                if (sSpellMgr.GetSpellEntry(spellId))
                    return false;

                LOG_WARN("playerbots", "Skipping invalid random bot spell id %u", spellId);
                return true;
            }),
        randomBotSpellIds.end());
    LoadList<std::vector<uint32>>(
        sConfig.GetStringDefault("AiPlayerbot.PvpProhibitedZoneIds",
                                           "2255,656,2361,2362,2363,976,35,2268,3425,392,541,1446,3828,3712,3738,3565,"
                                           "3539,3623,4152,3988,4658,4284,4418,4436,4275,4323,4395,3703,4298,3951"),
        pvpProhibitedZoneIds);
    LoadList<std::vector<uint32>>(
        sConfig.GetStringDefault("AiPlayerbot.PvpProhibitedAreaIds",
                                           "976,35,392,2268,4161,4010,4317,4312,3649,3887,3958,3724,4080,3938,3754,3786,3973"),
        pvpProhibitedAreaIds);
    fastReactInBG = sConfig.GetBoolDefault("AiPlayerbot.FastReactInBG", true);
    LoadList<std::vector<uint32>>(
        sConfig.GetStringDefault("AiPlayerbot.RandomBotQuestIds", "3802,5505,6502,7761,7848,10277,10285,11492,13188,13189,24499,24511,24710,24712"),
        randomBotQuestIds);

    LoadSet<std::set<uint32>>(
        sConfig.GetStringDefault("AiPlayerbot.DisallowedGameObjects",
                                           "176213,17155,2656,74448,19020,3719,3658,3705,3706,105579,75293,2857,"
                                           "179490,141596,160836,160845,179516,176224,181085,176112,128308,128403,"
                                           "165739,165738,175245,175970,176325,176327,123329,2560"),
        disallowedGameObjects);
    botAutologin = sConfig.GetBoolDefault("AiPlayerbot.BotAutologin", false);
    randomBotAutologin = sConfig.GetBoolDefault("AiPlayerbot.RandomBotAutologin", true);
    minRandomBots = sConfig.GetIntDefault("AiPlayerbot.MinRandomBots", 500);
    maxRandomBots = sConfig.GetIntDefault("AiPlayerbot.MaxRandomBots", 500);
    randomBotUpdateInterval = sConfig.GetIntDefault("AiPlayerbot.RandomBotUpdateInterval", 20);
    randomBotCountChangeMinInterval =
        sConfig.GetIntDefault("AiPlayerbot.RandomBotCountChangeMinInterval", 30 * MINUTE);
    randomBotCountChangeMaxInterval =
        sConfig.GetIntDefault("AiPlayerbot.RandomBotCountChangeMaxInterval", 2 * HOUR);
    minRandomBotInWorldTime = sConfig.GetIntDefault("AiPlayerbot.MinRandomBotInWorldTime", 2 * HOUR);
    maxRandomBotInWorldTime = sConfig.GetIntDefault("AiPlayerbot.MaxRandomBotInWorldTime", 14 * 24 * HOUR);
    minRandomBotRandomizeTime = sConfig.GetIntDefault("AiPlayerbot.MinRandomBotRandomizeTime", 2 * HOUR);
    maxRandomBotRandomizeTime = sConfig.GetIntDefault("AiPlayerbot.MaxRandomBotRandomizeTime", 14 * 24 * HOUR);
    minRandomBotChangeStrategyTime =
        sConfig.GetIntDefault("AiPlayerbot.MinRandomBotChangeStrategyTime", 30 * MINUTE);
    maxRandomBotChangeStrategyTime =
        sConfig.GetIntDefault("AiPlayerbot.MaxRandomBotChangeStrategyTime", 2 * HOUR);
    minRandomBotReviveTime = sConfig.GetIntDefault("AiPlayerbot.MinRandomBotReviveTime", MINUTE);
    maxRandomBotReviveTime = sConfig.GetIntDefault("AiPlayerbot.MaxRandomBotReviveTime", 5 * MINUTE);
    minRandomBotTeleportInterval = sConfig.GetIntDefault("AiPlayerbot.MinRandomBotTeleportInterval", 1 * HOUR);
    maxRandomBotTeleportInterval = sConfig.GetIntDefault("AiPlayerbot.MaxRandomBotTeleportInterval", 5 * HOUR);
    permanentlyInWorldTime =
        sConfig.GetIntDefault("AiPlayerbot.PermanentlyInWorldTime", 1 * YEAR);
    randomBotTeleportDistance = sConfig.GetIntDefault("AiPlayerbot.RandomBotTeleportDistance", 100);
    randomBotsPerInterval = sConfig.GetIntDefault("AiPlayerbot.RandomBotsPerInterval", 60);
    minRandomBotsPriceChangeInterval =
        sConfig.GetIntDefault("AiPlayerbot.MinRandomBotsPriceChangeInterval", 2 * HOUR);
    maxRandomBotsPriceChangeInterval =
        sConfig.GetIntDefault("AiPlayerbot.MaxRandomBotsPriceChangeInterval", 48 * HOUR);
    randomBotJoinLfg = sConfig.GetBoolDefault("AiPlayerbot.RandomBotJoinLfg", true);

    restrictHealerDPS = sConfig.GetBoolDefault("AiPlayerbot.HealerDPSMapRestriction", false);
    LoadList<std::vector<uint32>>(
        sConfig.GetStringDefault("AiPlayerbot.RestrictedHealerDPSMaps",
                                             "33,34,36,43,47,48,70,90,109,129,209,229,230,329,349,389,429,1001,1004,"
                                             "1007,269,540,542,543,545,546,547,552,553,554,555,556,557,558,560,585,574,"
                                             "575,576,578,595,599,600,601,602,604,608,619,632,650,658,668,409,469,509,"
                                             "531,532,534,544,548,550,564,565,580,249,533,603,615,616,624,631,649,724"),
        restrictedHealerDPSMaps);

    //////////////////////////// ICC

    EnableICCBuffs = sConfig.GetBoolDefault("AiPlayerbot.EnableICCBuffs", true);

    //////////////////////////// Professions
    fishingDistanceFromMaster = sConfig.GetFloatDefault("AiPlayerbot.FishingDistanceFromMaster", 10.0f);
    endFishingWithMaster = sConfig.GetFloatDefault("AiPlayerbot.EndFishingWithMaster", 30.0f);
    fishingDistance = sConfig.GetFloatDefault("AiPlayerbot.FishingDistance", 40.0f);
    enableFishingWithMaster = sConfig.GetBoolDefault("AiPlayerbot.EnableFishingWithMaster", true);
    //////////////////////////// CHAT
    enableBroadcasts = sConfig.GetBoolDefault("AiPlayerbot.EnableBroadcasts", true);
    randomBotTalk = sConfig.GetBoolDefault("AiPlayerbot.RandomBotTalk", false);
    randomBotEmote = sConfig.GetBoolDefault("AiPlayerbot.RandomBotEmote", false);
    randomBotSuggestDungeons = sConfig.GetBoolDefault("AiPlayerbot.RandomBotSuggestDungeons", true);
    randomBotSayWithoutMaster = sConfig.GetBoolDefault("AiPlayerbot.RandomBotSayWithoutMaster", false);

    // broadcastChanceMaxValue is used in urand(1, broadcastChanceMaxValue) for broadcasts,
    // lowering it will increase the chance, setting it to 0 will disable broadcasts
    // for internal use, not intended to be change by the user
    broadcastChanceMaxValue = enableBroadcasts ? 30000 : 0;

    // all broadcast chances should be in range 1-broadcastChanceMaxValue, value of 0 will disable this particular
    // broadcast setting value to max does not guarantee the broadcast, as there are some internal randoms as well
    broadcastToGuildGlobalChance = sConfig.GetIntDefault("AiPlayerbot.BroadcastToGuildGlobalChance", 30000);
    broadcastToWorldGlobalChance = sConfig.GetIntDefault("AiPlayerbot.BroadcastToWorldGlobalChance", 30000);
    broadcastToGeneralGlobalChance = sConfig.GetIntDefault("AiPlayerbot.BroadcastToGeneralGlobalChance", 30000);
    broadcastToTradeGlobalChance = sConfig.GetIntDefault("AiPlayerbot.BroadcastToTradeGlobalChance", 30000);
    broadcastToLFGGlobalChance = sConfig.GetIntDefault("AiPlayerbot.BroadcastToLFGGlobalChance", 30000);
    broadcastToLocalDefenseGlobalChance =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastToLocalDefenseGlobalChance", 30000);
    broadcastToWorldDefenseGlobalChance =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastToWorldDefenseGlobalChance", 30000);
    broadcastToGuildRecruitmentGlobalChance =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastToGuildRecruitmentGlobalChance", 30000);

    broadcastChanceLootingItemPoor = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLootingItemPoor", 30);
    broadcastChanceLootingItemNormal =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLootingItemNormal", 300);
    broadcastChanceLootingItemUncommon =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLootingItemUncommon", 10000);
    broadcastChanceLootingItemRare = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLootingItemRare", 20000);
    broadcastChanceLootingItemEpic = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLootingItemEpic", 30000);
    broadcastChanceLootingItemLegendary =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLootingItemLegendary", 30000);
    broadcastChanceLootingItemArtifact =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLootingItemArtifact", 30000);

    broadcastChanceQuestAccepted = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceQuestAccepted", 6000);
    broadcastChanceQuestUpdateObjectiveCompleted =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceQuestUpdateObjectiveCompleted", 300);
    broadcastChanceQuestUpdateObjectiveProgress =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceQuestUpdateObjectiveProgress", 300);
    broadcastChanceQuestUpdateFailedTimer =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceQuestUpdateFailedTimer", 300);
    broadcastChanceQuestUpdateComplete =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceQuestUpdateComplete", 1000);
    broadcastChanceQuestTurnedIn = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceQuestTurnedIn", 10000);

    broadcastChanceKillNormal = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillNormal", 30);
    broadcastChanceKillElite = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillElite", 300);
    broadcastChanceKillRareelite = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillRareelite", 3000);
    broadcastChanceKillWorldboss = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillWorldboss", 20000);
    broadcastChanceKillRare = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillRare", 10000);
    broadcastChanceKillUnknown = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillUnknown", 100);
    broadcastChanceKillPet = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillPet", 10);
    broadcastChanceKillPlayer = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceKillPlayer", 30);

    broadcastChanceLevelupGeneric = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLevelupGeneric", 20000);
    broadcastChanceLevelupTenX = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLevelupTenX", 30000);
    broadcastChanceLevelupMaxLevel = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceLevelupMaxLevel", 30000);

    broadcastChanceSuggestInstance = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestInstance", 5000);
    broadcastChanceSuggestQuest = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestQuest", 10000);
    broadcastChanceSuggestGrindMaterials =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestGrindMaterials", 5000);
    broadcastChanceSuggestGrindReputation =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestGrindReputation", 5000);
    broadcastChanceSuggestSell = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestSell", 300);
    broadcastChanceSuggestSomething =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestSomething", 30000);

    broadcastChanceSuggestSomethingToxic =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestSomethingToxic", 0);

    broadcastChanceSuggestToxicLinks = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestToxicLinks", 0);
    toxicLinksPrefix = sConfig.GetStringDefault("AiPlayerbot.ToxicLinksPrefix", "gnomes");

    broadcastChanceSuggestThunderfury =
        sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceSuggestThunderfury", 1);

    // does not depend on global chance
    broadcastChanceGuildManagement = sConfig.GetIntDefault("AiPlayerbot.BroadcastChanceGuildManagement", 30000);
    ////////////////////////////

    toxicLinksRepliesChance = sConfig.GetIntDefault("AiPlayerbot.ToxicLinksRepliesChance", 30);    // 0-100
    thunderfuryRepliesChance = sConfig.GetIntDefault("AiPlayerbot.ThunderfuryRepliesChance", 40);  // 0-100
    guildRepliesRate = sConfig.GetIntDefault("AiPlayerbot.GuildRepliesRate", 100);                 // 0-100
    suggestDungeonsInLowerCaseRandomly =
        sConfig.GetBoolDefault("AiPlayerbot.SuggestDungeonsInLowerCaseRandomly", false);

    ////////////////////////// !CHAT

    randomBotJoinBG = sConfig.GetBoolDefault("AiPlayerbot.RandomBotJoinBG", true);
    randomBotAutoJoinBG = sConfig.GetBoolDefault("AiPlayerbot.RandomBotAutoJoinBG", false);

    randomBotAutoJoinArenaBracket = sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinArenaBracket", 7);

    randomBotAutoJoinICBrackets = sConfig.GetStringDefault("AiPlayerbot.RandomBotAutoJoinICBrackets", "0,1");
    randomBotAutoJoinEYBrackets = sConfig.GetStringDefault("AiPlayerbot.RandomBotAutoJoinEYBrackets", "0,1,2");
    randomBotAutoJoinAVBrackets = sConfig.GetStringDefault("AiPlayerbot.RandomBotAutoJoinAVBrackets", "0,1,2,3");
    randomBotAutoJoinABBrackets = sConfig.GetStringDefault("AiPlayerbot.RandomBotAutoJoinABBrackets", "0,1,2,3,4,5,6");
    randomBotAutoJoinWSBrackets = sConfig.GetStringDefault("AiPlayerbot.RandomBotAutoJoinWSBrackets", "0,1,2,3,4,5,6,7");

    randomBotAutoJoinBGICCount = sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGICCount", 0);
    randomBotAutoJoinBGEYCount = sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGEYCount", 0);
    randomBotAutoJoinBGAVCount = sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGAVCount", 0);
    randomBotAutoJoinBGABCount = sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGABCount", 0);
    randomBotAutoJoinBGWSCount = sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGWSCount", 0);

    randomBotAutoJoinBGRatedArena2v2Count =
        sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGRatedArena2v2Count", 0);
    randomBotAutoJoinBGRatedArena3v3Count =
        sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGRatedArena3v3Count", 0);
    randomBotAutoJoinBGRatedArena5v5Count =
        sConfig.GetIntDefault("AiPlayerbot.RandomBotAutoJoinBGRatedArena5v5Count", 0);
    logInGroupOnly = sConfig.GetBoolDefault("AiPlayerbot.LogInGroupOnly", true);
    logValuesPerTick = sConfig.GetBoolDefault("AiPlayerbot.LogValuesPerTick", false);
    fleeingEnabled = sConfig.GetBoolDefault("AiPlayerbot.FleeingEnabled", true);
    summonAtInnkeepersEnabled = sConfig.GetBoolDefault("AiPlayerbot.SummonAtInnkeepersEnabled", true);
    randomBotMinLevel = sConfig.GetIntDefault("AiPlayerbot.RandomBotMinLevel", 1);
    randomBotMaxLevel = sConfig.GetIntDefault("AiPlayerbot.RandomBotMaxLevel", 80);
    if (randomBotMaxLevel > sWorld.getIntConfig(CONFIG_MAX_PLAYER_LEVEL))
        randomBotMaxLevel = sWorld.getIntConfig(CONFIG_MAX_PLAYER_LEVEL);
    randomBotLoginAtStartup = sConfig.GetBoolDefault("AiPlayerbot.RandomBotLoginAtStartup", true);
    randomBotTeleLowerLevel = sConfig.GetIntDefault("AiPlayerbot.RandomBotTeleLowerLevel", 1);
    randomBotTeleHigherLevel = sConfig.GetIntDefault("AiPlayerbot.RandomBotTeleHigherLevel", 3);
    openGoSpell = sConfig.GetIntDefault("AiPlayerbot.OpenGoSpell", 6477);

    // Zones for NewRpgStrategy teleportation brackets
    std::vector<uint32> zoneIds = {
        // Classic WoW - Low-level zones
        1, 12, 14, 85, 141, 215, 3430, 3524,
        // Classic WoW - Mid-level zones
        17, 38, 40, 130, 148, 3433, 3525,
        // Classic WoW - High-level zones
        10, 11, 44, 267, 331, 400, 406,
        // Classic WoW - Higher-level zones
        3, 8, 15, 16, 33, 45, 47, 51, 357, 405, 440,
        // Classic WoW - Top-level zones
        4, 28, 46, 139, 361, 490, 618, 1377,
        // The Burning Crusade - Zones
        3483, 3518, 3519, 3520, 3521, 3522, 3523, 4080,
        // Wrath of the Lich King - Zones
        65, 66, 67, 210, 394, 495, 2817, 3537, 3711, 4197
    };

    for (uint32 zoneId : zoneIds)
    {
        std::string setting = "AiPlayerbot.ZoneBracket." + std::to_string(zoneId);
        std::string value = sConfig.GetStringDefault(setting.c_str(), "");

        if (!value.empty())
        {
            size_t commaPos = value.find(',');
            if (commaPos != std::string::npos)
            {
                uint32 minLevel = atoi(value.substr(0, commaPos).c_str());
                uint32 maxLevel = atoi(value.substr(commaPos + 1).c_str());
                zoneBrackets[zoneId] = std::make_pair(minLevel, maxLevel);
            }
        }
    }

    reserveZones.clear();
    if (minStormwindBots)
        reserveZones[1519] += minStormwindBots;
    if (minOrgrimmarBots)
        reserveZones[1637] += minOrgrimmarBots;

    for (auto const& entry : sConfig.GetEntriesByPrefix("AiPlayerbot.ReserveZone."))
    {
        size_t dotPos = entry.first.find_last_of('.');
        if (dotPos == std::string::npos || dotPos + 1 >= entry.first.size())
            continue;

        uint32 zoneId = static_cast<uint32>(std::strtoul(entry.first.substr(dotPos + 1).c_str(), nullptr, 10));
        uint32 minBots = static_cast<uint32>(std::strtoul(entry.second.c_str(), nullptr, 10));
        if (zoneId && minBots)
            reserveZones[zoneId] = minBots;
    }

    randomChangeMultiplier = sConfig.GetFloatDefault("AiPlayerbot.RandomChangeMultiplier", 1.0);

    randomBotCombatStrategies = sConfig.GetStringDefault("AiPlayerbot.RandomBotCombatStrategies", "");
    randomBotNonCombatStrategies = sConfig.GetStringDefault("AiPlayerbot.RandomBotNonCombatStrategies", "");
    randomBotNoRealPlayerPartyTimeout = sConfig.GetIntDefault("AiPlayerbot.RandomBotNoRealPlayerPartyTimeout", 300);
    combatStrategies = sConfig.GetStringDefault("AiPlayerbot.CombatStrategies", "");
    nonCombatStrategies = sConfig.GetStringDefault("AiPlayerbot.NonCombatStrategies", "");
    applyInstanceStrategies = sConfig.GetBoolDefault("AiPlayerbot.ApplyInstanceStrategies", true);

    commandPrefix = sConfig.GetStringDefault("AiPlayerbot.CommandPrefix", "");
    commandSeparator = sConfig.GetStringDefault("AiPlayerbot.CommandSeparator", "\\\\");

    commandServerPort = sConfig.GetIntDefault("AiPlayerbot.CommandServerPort", 8888);
    perfMonEnabled = sConfig.GetBoolDefault("AiPlayerbot.PerfMonEnabled", false);

    useGroundMountAtMinLevel = sConfig.GetIntDefault("AiPlayerbot.UseGroundMountAtMinLevel", 20);
    useFastGroundMountAtMinLevel = sConfig.GetIntDefault("AiPlayerbot.UseFastGroundMountAtMinLevel", 40);
    useFlyMountAtMinLevel = sConfig.GetIntDefault("AiPlayerbot.UseFlyMountAtMinLevel", 60);
    useFastFlyMountAtMinLevel = sConfig.GetIntDefault("AiPlayerbot.UseFastFlyMountAtMinLevel", 70);

    // stagger bot flightpath takeoff
    delayMin = sConfig.GetIntDefault("AiPlayerbot.BotTaxiDelayMinMs", 350u);
    delayMax = sConfig.GetIntDefault("AiPlayerbot.BotTaxiDelayMaxMs", 5000u);
    gapMs = sConfig.GetIntDefault("AiPlayerbot.BotTaxiGapMs", 200u);
    gapJitterMs = sConfig.GetIntDefault("AiPlayerbot.BotTaxiGapJitterMs", 100u);

    LOG_INFO("server.loading", "Loading TalentSpecs...");

    for (uint32 cls = 1; cls < MAX_CLASSES; ++cls)
    {
        if (cls == 10)
        {
            continue;
        }
        for (uint32 spec = 0; spec < MAX_SPECNO; ++spec)
        {
            std::ostringstream os;
            os << "AiPlayerbot.PremadeSpecName." << cls << "." << spec;
            premadeSpecName[cls][spec] = sConfig.GetStringDefault(os.str().c_str(), "");
            os.str("");
            os.clear();
            os << "AiPlayerbot.PremadeSpecGlyph." << cls << "." << spec;
            premadeSpecGlyph[cls][spec] = sConfig.GetStringDefault(os.str().c_str(), "");
            std::vector<std::string> splitSpecGlyph = split(premadeSpecGlyph[cls][spec], ',');
            for (std::string& split : splitSpecGlyph)
            {
                if (split.size() != 0)
                {
                    parsedSpecGlyph[cls][spec].push_back(atoi(split.c_str()));
                }
            }
            for (uint32 level = 0; level < MAX_LEVEL; ++level)
            {
                std::ostringstream os;
                os << "AiPlayerbot.PremadeSpecLink." << cls << "." << spec << "." << level;
                premadeSpecLink[cls][spec][level] = sConfig.GetStringDefault(os.str().c_str(), "");
                parsedSpecLinkOrder[cls][spec][level] = ParseTempTalentsOrder(cls, premadeSpecLink[cls][spec][level]);
            }
        }
        for (uint32 spec = 0; spec < 3; ++spec)
        {
            for (uint32 points = 0; points < 21; ++points)
            {
                std::ostringstream os;
                os << "AiPlayerbot.PremadeHunterPetLink." << spec << "." << points;
                premadeHunterPetLink[spec][points] = sConfig.GetStringDefault(os.str().c_str(), "");
                parsedHunterPetLinkOrder[spec][points] =
                    ParseTempPetTalentsOrder(spec, premadeHunterPetLink[spec][points]);
            }
        }
        for (uint32 spec = 0; spec < MAX_SPECNO; ++spec)
        {
            std::ostringstream os;
            os << "AiPlayerbot.RandomClassSpecProb." << cls << "." << spec;
            uint32 def;
            if (spec <= 1)
                def = 33;
            else if (spec == 2)
                def = 34;
            else
                def = 0;
            randomClassSpecProb[cls][spec] = sConfig.GetIntDefault(os.str().c_str(), def);
            os.str("");
            os.clear();
            os << "AiPlayerbot.RandomClassSpecIndex." << cls << "." << spec;
            randomClassSpecIndex[cls][spec] = sConfig.GetIntDefault(os.str().c_str(), spec);
        }
    }

    botCheats.clear();
    LoadListString<std::vector<std::string>>(sConfig.GetStringDefault("AiPlayerbot.BotCheats", "food,taxi,raid"),
                                             botCheats);

    botCheatMask = 0;

    if (std::find(botCheats.begin(), botCheats.end(), "food") != botCheats.end())
        botCheatMask |= (uint32)BotCheatMask::food;
    if (std::find(botCheats.begin(), botCheats.end(), "taxi") != botCheats.end())
        botCheatMask |= (uint32)BotCheatMask::taxi;
    if (std::find(botCheats.begin(), botCheats.end(), "gold") != botCheats.end())
        botCheatMask |= (uint32)BotCheatMask::gold;
    if (std::find(botCheats.begin(), botCheats.end(), "health") != botCheats.end())
        botCheatMask |= (uint32)BotCheatMask::health;
    if (std::find(botCheats.begin(), botCheats.end(), "mana") != botCheats.end())
        botCheatMask |= (uint32)BotCheatMask::mana;
    if (std::find(botCheats.begin(), botCheats.end(), "power") != botCheats.end())
        botCheatMask |= (uint32)BotCheatMask::power;
    if (std::find(botCheats.begin(), botCheats.end(), "raid") != botCheats.end())
        botCheatMask |= (uint32)BotCheatMask::raid;

    LoadListString<std::vector<std::string>>(sConfig.GetStringDefault("AiPlayerbot.AllowedLogFiles", ""),
                                             allowedLogFiles);
    LoadListString<std::vector<std::string>>(sConfig.GetStringDefault("AiPlayerbot.TradeActionExcludedPrefixes", ""),
                                             tradeActionExcludedPrefixes);

    worldBuffs.clear();
    loadWorldBuff();
    LOG_INFO("playerbots", "Loading World Buff Feature...");

    randomBotAccountPrefix = sConfig.GetStringDefault("AiPlayerbot.RandomBotAccountPrefix", "rndbot");
    randomBotAccountCount = sConfig.GetIntDefault("AiPlayerbot.RandomBotAccountCount", 0);
    deleteRandomBotAccounts = sConfig.GetBoolDefault("AiPlayerbot.DeleteRandomBotAccounts", false);
    randomBotGuildCount = sConfig.GetIntDefault("AiPlayerbot.RandomBotGuildCount", 20);
    randomBotGuildSizeMax = sConfig.GetIntDefault("AiPlayerbot.RandomBotGuildSizeMax", 15);
    deleteRandomBotGuilds = sConfig.GetBoolDefault("AiPlayerbot.DeleteRandomBotGuilds", false);

    guildTaskEnabled = sConfig.GetBoolDefault("AiPlayerbot.EnableGuildTasks", false);
    minGuildTaskChangeTime = sConfig.GetIntDefault("AiPlayerbot.MinGuildTaskChangeTime", 3 * 24 * 3600);
    maxGuildTaskChangeTime = sConfig.GetIntDefault("AiPlayerbot.MaxGuildTaskChangeTime", 4 * 24 * 3600);
    minGuildTaskAdvertisementTime = sConfig.GetIntDefault("AiPlayerbot.MinGuildTaskAdvertisementTime", 300);
    maxGuildTaskAdvertisementTime = sConfig.GetIntDefault("AiPlayerbot.MaxGuildTaskAdvertisementTime", 12 * 3600);
    minGuildTaskRewardTime = sConfig.GetIntDefault("AiPlayerbot.MinGuildTaskRewardTime", 300);
    maxGuildTaskRewardTime = sConfig.GetIntDefault("AiPlayerbot.MaxGuildTaskRewardTime", 3600);
    guildTaskAdvertCleanupTime = sConfig.GetIntDefault("AiPlayerbot.GuildTaskAdvertCleanupTime", 300);
    guildTaskKillTaskDistance = sConfig.GetIntDefault("AiPlayerbot.GuildTaskKillTaskDistance", 2000);
    targetPosRecalcDistance = sConfig.GetFloatDefault("AiPlayerbot.TargetPosRecalcDistance", 0.1f);

    // cosmetics (by lidocain)
    randomBotShowCloak = sConfig.GetBoolDefault("AiPlayerbot.RandomBotShowCloak", true);
    randomBotShowHelmet = sConfig.GetBoolDefault("AiPlayerbot.RandomBotShowHelmet", true);

    // SPP switches
    enableGreet = sConfig.GetBoolDefault("AiPlayerbot.EnableGreet", true);
    summonWhenGroup = sConfig.GetBoolDefault("AiPlayerbot.SummonWhenGroup", true);
    randomBotFixedLevel = sConfig.GetBoolDefault("AiPlayerbot.RandomBotFixedLevel", false);
    disableRandomLevels = sConfig.GetBoolDefault("AiPlayerbot.DisableRandomLevels", false);
    randomBotRandomPassword = sConfig.GetBoolDefault("AiPlayerbot.RandomBotRandomPassword", true);
    downgradeMaxLevelBot = sConfig.GetBoolDefault("AiPlayerbot.DowngradeMaxLevelBot", true);
    equipmentPersistence = sConfig.GetBoolDefault("AiPlayerbot.EquipmentPersistence", false);
    equipmentPersistenceLevel = sConfig.GetIntDefault("AiPlayerbot.EquipmentPersistenceLevel", 80);
    groupInvitationPermission = sConfig.GetIntDefault("AiPlayerbot.GroupInvitationPermission", 1);
    keepAltsInGroup = sConfig.GetBoolDefault("AiPlayerbot.KeepAltsInGroup", false);
    allowSummonInCombat = sConfig.GetBoolDefault("AiPlayerbot.AllowSummonInCombat", true);
    allowSummonWhenMasterIsDead = sConfig.GetBoolDefault("AiPlayerbot.AllowSummonWhenMasterIsDead", true);
    allowSummonWhenBotIsDead = sConfig.GetBoolDefault("AiPlayerbot.AllowSummonWhenBotIsDead", true);
    reviveBotWhenSummoned = sConfig.GetIntDefault("AiPlayerbot.ReviveBotWhenSummoned", 1);
    botRepairWhenSummon = sConfig.GetBoolDefault("AiPlayerbot.BotRepairWhenSummon", true);
    autoInitOnly = sConfig.GetBoolDefault("AiPlayerbot.AutoInitOnly", false);
    autoInitEquipLevelLimitRatio = sConfig.GetFloatDefault("AiPlayerbot.AutoInitEquipLevelLimitRatio", 1.0);

    maxAddedBots = sConfig.GetIntDefault("AiPlayerbot.MaxAddedBots", 40);
    addClassCommand = sConfig.GetIntDefault("AiPlayerbot.AddClassCommand", 1);
    addClassAccountPoolSize = sConfig.GetIntDefault("AiPlayerbot.AddClassAccountPoolSize", 50);
    maintenanceCommand = sConfig.GetIntDefault("AiPlayerbot.MaintenanceCommand", 1);

    altMaintenanceAttunementQs = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceAttunementQuests", true);
    altMaintenanceBags = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceBags", true);
    altMaintenanceAmmo = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceAmmo", true);
    altMaintenanceFood = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceFood", true);
    altMaintenanceReagents = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceReagents", true);
    altMaintenanceConsumables = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceConsumables", true);
    altMaintenancePotions = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenancePotions", true);
    altMaintenanceTalentTree = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceTalentTree", true);
    altMaintenancePet = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenancePet", true);
    altMaintenancePetTalents = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenancePetTalents", true);
    altMaintenanceClassSpells = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceClassSpells", true);
    altMaintenanceAvailableSpells = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceAvailableSpells", true);
    altMaintenanceSkills = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceSkills", true);
    altMaintenanceReputation = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceReputation", true);
    altMaintenanceSpecialSpells = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceSpecialSpells", true);
    altMaintenanceMounts = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceMounts", true);
    altMaintenanceGlyphs = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceGlyphs", true);
    altMaintenanceKeyring = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceKeyring", true);
    altMaintenanceGemsEnchants = sConfig.GetBoolDefault("AiPlayerbot.AltMaintenanceGemsEnchants", true);

    autoGearCommand = sConfig.GetIntDefault("AiPlayerbot.AutoGearCommand", 1);
    autoGearCommandAltBots = sConfig.GetIntDefault("AiPlayerbot.AutoGearCommandAltBots", 1);
    autoGearQualityLimit = sConfig.GetIntDefault("AiPlayerbot.AutoGearQualityLimit", 3);
    autoGearScoreLimit = sConfig.GetIntDefault("AiPlayerbot.AutoGearScoreLimit", 0);

    randomBotXPRate = sConfig.GetFloatDefault("AiPlayerbot.RandomBotXPRate", 1.0);
    randomBotAllianceRatio = sConfig.GetIntDefault("AiPlayerbot.RandomBotAllianceRatio", 50);
    randomBotHordeRatio = sConfig.GetIntDefault("AiPlayerbot.RandomBotHordeRatio", 50);
    disableDeathKnightLogin = sConfig.GetBoolDefault("AiPlayerbot.DisableDeathKnightLogin", 0);
    limitTalentsExpansion = sConfig.GetBoolDefault("AiPlayerbot.LimitTalentsExpansion", 0);
    botActiveAlone = sConfig.GetIntDefault("AiPlayerbot.BotActiveAlone", 100);
    BotActiveAloneForceWhenInRadius = sConfig.GetIntDefault("AiPlayerbot.BotActiveAloneForceWhenInRadius", 150);
    BotActiveAloneForceWhenInZone = sConfig.GetBoolDefault("AiPlayerbot.BotActiveAloneForceWhenInZone", 1);
    BotActiveAloneForceWhenInMap = sConfig.GetBoolDefault("AiPlayerbot.BotActiveAloneForceWhenInMap", 0);
    BotActiveAloneForceWhenIsFriend = sConfig.GetBoolDefault("AiPlayerbot.BotActiveAloneForceWhenIsFriend", 1);
    BotActiveAloneForceWhenInGuild = sConfig.GetBoolDefault("AiPlayerbot.BotActiveAloneForceWhenInGuild", 1);
    botActiveAloneSmartScale = sConfig.GetBoolDefault("AiPlayerbot.botActiveAloneSmartScale", 1);
    botActiveAloneSmartScaleDiffLimitfloor = sConfig.GetIntDefault("AiPlayerbot.botActiveAloneSmartScaleDiffLimitfloor", 50);
    botActiveAloneSmartScaleDiffLimitCeiling = sConfig.GetIntDefault("AiPlayerbot.botActiveAloneSmartScaleDiffLimitCeiling", 200);
    botActiveAloneSmartScaleWhenMinLevel = sConfig.GetIntDefault("AiPlayerbot.botActiveAloneSmartScaleWhenMinLevel", 1);
    botActiveAloneSmartScaleWhenMaxLevel = sConfig.GetIntDefault("AiPlayerbot.botActiveAloneSmartScaleWhenMaxLevel", 80);

    randombotsWalkingRPG = sConfig.GetBoolDefault("AiPlayerbot.RandombotsWalkingRPG", false);
    randombotsWalkingRPGInDoors = sConfig.GetBoolDefault("AiPlayerbot.RandombotsWalkingRPG.InDoors", false);
    minEnchantingBotLevel = sConfig.GetIntDefault("AiPlayerbot.MinEnchantingBotLevel", 60);
    limitEnchantExpansion = sConfig.GetIntDefault("AiPlayerbot.LimitEnchantExpansion", 1);
    limitGearExpansion = sConfig.GetIntDefault("AiPlayerbot.LimitGearExpansion", 1);
    randombotStartingLevel = sConfig.GetIntDefault("AiPlayerbot.RandombotStartingLevel", 1);
    enablePeriodicOnlineOffline = sConfig.GetBoolDefault("AiPlayerbot.EnablePeriodicOnlineOffline", false);
    enableRandomBotTrading = sConfig.GetIntDefault("AiPlayerbot.EnableRandomBotTrading", 1);
    periodicOnlineOfflineRatio = sConfig.GetFloatDefault("AiPlayerbot.PeriodicOnlineOfflineRatio", 2.0);
    gearscorecheck = sConfig.GetBoolDefault("AiPlayerbot.GearScoreCheck", false);
    randomBotPreQuests = sConfig.GetBoolDefault("AiPlayerbot.PreQuests", false);

    // SPP automation
    freeMethodLoot = sConfig.GetBoolDefault("AiPlayerbot.FreeMethodLoot", false);
    lootRollLevel = sConfig.GetIntDefault("AiPlayerbot.LootRollLevel", 1);
    autoPickReward = sConfig.GetStringDefault("AiPlayerbot.AutoPickReward", "yes");
    autoEquipUpgradeLoot = sConfig.GetBoolDefault("AiPlayerbot.AutoEquipUpgradeLoot", true);
    equipUpgradeThreshold = sConfig.GetFloatDefault("AiPlayerbot.EquipUpgradeThreshold", 1.1f);
    twoRoundsGearInit = sConfig.GetBoolDefault("AiPlayerbot.TwoRoundsGearInit", false);
    syncQuestWithPlayer = sConfig.GetBoolDefault("AiPlayerbot.SyncQuestWithPlayer", true);
    syncQuestForPlayer = sConfig.GetBoolDefault("AiPlayerbot.SyncQuestForPlayer", false);
    dropObsoleteQuests = sConfig.GetBoolDefault("AiPlayerbot.DropObsoleteQuests", true);
    autoTrainSpells = sConfig.GetStringDefault("AiPlayerbot.AutoTrainSpells", "yes");
    autoPickTalents = sConfig.GetBoolDefault("AiPlayerbot.AutoPickTalents", true);
    autoUpgradeEquip = sConfig.GetBoolDefault("AiPlayerbot.AutoUpgradeEquip", false);
    hunterWolfPet = sConfig.GetIntDefault("AiPlayerbot.HunterWolfPet", 0);
    defaultPetStance = sConfig.GetIntDefault("AiPlayerbot.DefaultPetStance", 1);
    petChatCommandDebug = sConfig.GetBoolDefault("AiPlayerbot.PetChatCommandDebug", 0);
    autoLearnTrainerSpells = sConfig.GetBoolDefault("AiPlayerbot.AutoLearnTrainerSpells", true);
    autoLearnQuestSpells = sConfig.GetBoolDefault("AiPlayerbot.AutoLearnQuestSpells", false);
    autoTeleportForLevel = sConfig.GetBoolDefault("AiPlayerbot.AutoTeleportForLevel", false);
    autoDoQuests = sConfig.GetBoolDefault("AiPlayerbot.AutoDoQuests", true);
    enableNewRpgStrategy = sConfig.GetBoolDefault("AiPlayerbot.EnableNewRpgStrategy", true);
    debugRandomBotQuesting = sConfig.GetBoolDefault("AiPlayerbot.DebugRandomBotQuesting", false);
    debugRandomBotPopulation = sConfig.GetBoolDefault("AiPlayerbot.DebugRandomBotPopulation", false);

    RpgStatusProbWeight[RPG_WANDER_RANDOM] = sConfig.GetIntDefault("AiPlayerbot.RpgStatusProbWeight.WanderRandom", 15);
    RpgStatusProbWeight[RPG_WANDER_NPC] = sConfig.GetIntDefault("AiPlayerbot.RpgStatusProbWeight.WanderNpc", 20);
    RpgStatusProbWeight[RPG_GO_GRIND] = sConfig.GetIntDefault("AiPlayerbot.RpgStatusProbWeight.GoGrind", 15);
    RpgStatusProbWeight[RPG_GO_CAMP] = sConfig.GetIntDefault("AiPlayerbot.RpgStatusProbWeight.GoCamp", 10);
    RpgStatusProbWeight[RPG_DO_QUEST] = sConfig.GetIntDefault("AiPlayerbot.RpgStatusProbWeight.DoQuest", 60);
    RpgStatusProbWeight[RPG_TRAVEL_FLIGHT] = sConfig.GetIntDefault("AiPlayerbot.RpgStatusProbWeight.TravelFlight", 15);
    RpgStatusProbWeight[RPG_REST] = sConfig.GetIntDefault("AiPlayerbot.RpgStatusProbWeight.Rest", 5);

    syncLevelWithPlayers = sConfig.GetBoolDefault("AiPlayerbot.SyncLevelWithPlayers", false);
    randomBotGroupNearby = sConfig.GetBoolDefault("AiPlayerbot.RandomBotGroupNearby", false);

    // arena
    randomBotArenaTeam2v2Count = sConfig.GetIntDefault("AiPlayerbot.RandomBotArenaTeam2v2Count", 10);
    randomBotArenaTeam3v3Count = sConfig.GetIntDefault("AiPlayerbot.RandomBotArenaTeam3v3Count", 10);
    randomBotArenaTeam5v5Count = sConfig.GetIntDefault("AiPlayerbot.RandomBotArenaTeam5v5Count", 5);
    deleteRandomBotArenaTeams = sConfig.GetBoolDefault("AiPlayerbot.DeleteRandomBotArenaTeams", false);
    randomBotArenaTeamMaxRating = sConfig.GetIntDefault("AiPlayerbot.RandomBotArenaTeamMaxRating", 2000);
    randomBotArenaTeamMinRating = sConfig.GetIntDefault("AiPlayerbot.RandomBotArenaTeamMinRating", 1000);

    selfBotLevel = sConfig.GetIntDefault("AiPlayerbot.SelfBotLevel", 1);

    excludedHunterPetFamilies.clear();
    LoadList<std::vector<uint32>>(sConfig.GetStringDefault("AiPlayerbot.ExcludedHunterPetFamilies", ""), excludedHunterPetFamilies);

    return true;
}

bool PlayerbotAIConfig::InitializeLate()
{
    if (!enabled || lateInitializationComplete)
        return true;

    RandomPlayerbotFactory::CreateRandomBots();
    if (World::IsStopped())
        return true;

    TravelMgr::instance().LoadQuestTravelTable();
    sRandomPlayerbotMgr.Init();

    PlayerbotGuildMgr::instance().Init();
    sRandomItemMgr.Init();
    sRandomItemMgr.InitAfterAhBot();
    PlayerbotTextMgr::instance().LoadBotTexts();
    PlayerbotTextMgr::instance().LoadBotTextChance();
    PlayerbotFactory::Init();

    AiObjectContext::BuildAllSharedContexts();

    if (randomBotSuggestDungeons)
        PlayerbotDungeonRepository::instance().LoadDungeonSuggestions();

    lateInitializationComplete = true;

    LOG_INFO("server.loading", "---------------------------------------");
    LOG_INFO("server.loading", "       mod-playerbots initialized      ");
    LOG_INFO("server.loading", "---------------------------------------");

    return true;
}

bool PlayerbotAIConfig::IsInRandomAccountList(uint32 id)
{
    return find(randomBotAccounts.begin(), randomBotAccounts.end(), id) != randomBotAccounts.end();
}

bool PlayerbotAIConfig::IsInRandomQuestItemList(uint32 id)
{
    return find(randomBotQuestItems.begin(), randomBotQuestItems.end(), id) != randomBotQuestItems.end();
}

bool PlayerbotAIConfig::IsPvpProhibited(uint32 zoneId, uint32 areaId)
{
    return IsInPvpProhibitedZone(zoneId) || IsInPvpProhibitedArea(areaId) || IsInPvpProhibitedZone(areaId);
}

bool PlayerbotAIConfig::IsInPvpProhibitedZone(uint32 id)
{
    return find(pvpProhibitedZoneIds.begin(), pvpProhibitedZoneIds.end(), id) != pvpProhibitedZoneIds.end();
}

bool PlayerbotAIConfig::IsInPvpProhibitedArea(uint32 id)
{
    return find(pvpProhibitedAreaIds.begin(), pvpProhibitedAreaIds.end(), id) != pvpProhibitedAreaIds.end();
}

bool PlayerbotAIConfig::IsRestrictedHealerDPSMap(uint32 mapId) const
{
    return restrictHealerDPS &&
            std::find(restrictedHealerDPSMaps.begin(), restrictedHealerDPSMaps.end(), mapId) != restrictedHealerDPSMaps.end();
}

std::string const PlayerbotAIConfig::GetTimestampStr()
{
    time_t t = time(nullptr);
    tm* aTm = localtime(&t);
    //       YYYY   year
    //       MM     month (2 digits 01-12)
    //       DD     day (2 digits 01-31)
    //       HH     hour (2 digits 00-23)
    //       MM     minutes (2 digits 00-59)
    //       SS     seconds (2 digits 00-59)
    char buf[32];
    snprintf(buf, sizeof(buf), "%04d-%02d-%02d %02d-%02d-%02d", aTm->tm_year + 1900, aTm->tm_mon + 1, aTm->tm_mday, aTm->tm_hour,
             aTm->tm_min, aTm->tm_sec);
    return std::string(buf);
}

bool PlayerbotAIConfig::openLog(std::string const fileName, char const* mode)
{
    if (!hasLog(fileName))
        return false;

    auto logFileIt = logFiles.find(fileName);
    if (logFileIt == logFiles.end())
    {
        logFiles.insert(std::make_pair(fileName, std::make_pair(nullptr, false)));
        logFileIt = logFiles.find(fileName);
    }

    FILE* file = logFileIt->second.first;
    bool fileOpen = logFileIt->second.second;

    if (fileOpen)  // close log file
        fclose(file);

    std::string m_logsDir = sConfig.GetStringDefault("LogsDir", "");
    if (!m_logsDir.empty())
    {
        if ((m_logsDir.at(m_logsDir.length() - 1) != '/') && (m_logsDir.at(m_logsDir.length() - 1) != '\\'))
            m_logsDir.append("/");
    }

    file = fopen((m_logsDir + fileName).c_str(), mode);
    fileOpen = true;

    logFileIt->second.first = file;
    logFileIt->second.second = fileOpen;

    return true;
}

void PlayerbotAIConfig::log(std::string const fileName, char const* str, ...)
{
    if (!str)
        return;

    std::lock_guard<std::mutex> guard(m_logMtx);

    if (!isLogOpen(fileName) && !openLog(fileName, "a"))
        return;

    FILE* file = logFiles.find(fileName)->second.first;

    va_list ap;
    va_start(ap, str);
    vfprintf(file, str, ap);
    fprintf(file, "\n");
    va_end(ap);
    fflush(file);

    fflush(stdout);
}

void PlayerbotAIConfig::loadWorldBuff()
{
    std::string matrix = sConfig.GetStringDefault("AiPlayerbot.WorldBuffMatrix", "");
    if (matrix.empty())
        return;

    std::istringstream entryStream(matrix);
    std::string entry;

    while (std::getline(entryStream, entry, ';'))
    {

        entry.erase(0, entry.find_first_not_of(" \t\r\n"));
        entry.erase(entry.find_last_not_of(" \t\r\n") + 1);

        size_t firstColon = entry.find(':');
        size_t secondColon = entry.find(':', firstColon + 1);

        if (firstColon == std::string::npos || secondColon == std::string::npos)
        {
            LOG_ERROR("playerbots", "Malformed entry: [%s]", entry.c_str());
            continue;
        }

        std::string metaPart = entry.substr(firstColon + 1, secondColon - firstColon - 1);
        std::string spellPart = entry.substr(secondColon + 1);

        std::vector<uint32> ids;
        std::istringstream metaStream(metaPart);
        std::string token;
        while (std::getline(metaStream, token, ','))
        {
            try {
                ids.push_back(static_cast<uint32>(std::stoi(token)));
            } catch (...) {
                LOG_ERROR("playerbots", "Invalid meta token in [%s]", entry.c_str());
                break;
            }
        }

        if (ids.size() != 5)
        {
            LOG_ERROR("playerbots", "Entry [%s] has incomplete meta block", entry.c_str());
            continue;
        }

        std::istringstream spellStream(spellPart);
        while (std::getline(spellStream, token, ','))
        {
            try {
                uint32 spellId = static_cast<uint32>(std::stoi(token));
                worldBuff wb = { spellId, ids[0], ids[1], ids[2], ids[3], ids[4] };
                worldBuffs.push_back(wb);
            } catch (...) {
                LOG_ERROR("playerbots", "Invalid spell ID in [%s]", entry.c_str());
            }
        }
    }
}

static std::vector<std::string> split(const std::string& str, const std::string& pattern)
{
    std::vector<std::string> res;
    if (str == "")
        return res;
    // Also add separators to string connections to facilitate intercepting the last paragraph.
    std::string strs = str + pattern;
    size_t pos = strs.find(pattern);

    while (pos != strs.npos)
    {
        std::string temp = strs.substr(0, pos);
        res.push_back(temp);
        // Remove the split string and split the remaining string
        strs = strs.substr(pos + 1, strs.size());
        pos = strs.find(pattern);
    }

    return res;
}

std::vector<std::vector<uint32>> PlayerbotAIConfig::ParseTempTalentsOrder(uint32 cls, std::string tab_link)
{
    // check bad link
    uint32 classMask = 1 << (cls - 1);
    std::vector<std::vector<uint32>> res;
    std::vector<std::string> tab_links = split(tab_link, "-");
    std::map<uint32, std::vector<TalentEntry const*>> spells;
    std::vector<std::vector<std::vector<uint32>>> orders(3);
    for (uint32 i = 0; i < sTalentStore.GetNumRows(); ++i)
    {
        TalentEntry const* talentInfo = sTalentStore.LookupEntry(i);
        if (!talentInfo)
            continue;

        TalentTabEntry const* talentTabInfo = sTalentTabStore.LookupEntry(talentInfo->TalentTab);
        if (!talentTabInfo)
            continue;

        if ((classMask & talentTabInfo->ClassMask) == 0)
            continue;

        spells[talentTabInfo->tabpage].push_back(talentInfo);
    }
    for (int tab = 0; tab < 3; tab++)
    {
        if (tab_links.size() <= tab)
        {
            break;
        }
        std::sort(spells[tab].begin(), spells[tab].end(),
                  [&](TalentEntry const* lhs, TalentEntry const* rhs)
                  { return lhs->Row != rhs->Row ? lhs->Row < rhs->Row : lhs->Col < rhs->Col; });
        for (int i = 0; i < tab_links[tab].size(); i++)
        {
            if (i >= spells[tab].size())
            {
                break;
            }
            int lvl = tab_links[tab][i] - '0';
            if (lvl == 0)
                continue;
            orders[tab].push_back({(uint32)tab, spells[tab][i]->Row, spells[tab][i]->Col, (uint32)lvl});
        }
    }
    // sort by talent tab size
    std::sort(orders.begin(), orders.end(), [&](auto& lhs, auto& rhs) { return lhs.size() > rhs.size(); });
    for (auto& order : orders)
    {
        res.insert(res.end(), order.begin(), order.end());
    }
    return res;
}

std::vector<std::vector<uint32>> PlayerbotAIConfig::ParseTempPetTalentsOrder(uint32 spec, std::string tab_link)
{
    // check bad link
    // uint32 classMask = 1 << (cls - 1);
    std::vector<TalentEntry const*> spells;
    std::vector<std::vector<uint32>> orders;
    for (uint32 i = 0; i < sTalentStore.GetNumRows(); ++i)
    {
        TalentEntry const* talentInfo = sTalentStore.LookupEntry(i);
        if (!talentInfo)
            continue;

        TalentTabEntry const* talentTabInfo = sTalentTabStore.LookupEntry(talentInfo->TalentTab);
        if (!talentTabInfo)
            continue;

        // skip some duplicate spells like dash/dive
        if (talentInfo->TalentID == 2201 || talentInfo->TalentID == 2208 || talentInfo->TalentID == 2219 ||
            talentInfo->TalentID == 2203)
            continue;

        spells.push_back(talentInfo);
    }
    std::sort(spells.begin(), spells.end(),
              [&](TalentEntry const* lhs, TalentEntry const* rhs)
              { return lhs->Row != rhs->Row ? lhs->Row < rhs->Row : lhs->Col < rhs->Col; });
    for (int i = 0; i < tab_link.size(); i++)
    {
        if (i >= spells.size())
        {
            break;
        }
        int lvl = tab_link[i] - '0';
        if (lvl == 0)
            continue;
        orders.push_back({spells[i]->Row, spells[i]->Col, (uint32)lvl});
    }
    // sort by talent tab size
    std::sort(orders.begin(), orders.end(), [&](auto& lhs, auto& rhs) { return lhs.size() > rhs.size(); });

    return orders;
}
