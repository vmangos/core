DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231222153346');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231222153346');
-- Add your query below.


-- Add Pre-1.7 version of the quest template.
DELETE FROM `quest_template` WHERE `entry`=4265;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RequiredCondition`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `BreadcrumbForQuestId`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewXP`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `RewMailMoney`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (4265, 0, 2, 357, 40, 0, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 4135, 0, 0, 0, 4266, 0, 0, 0, 'Escaping the Hive', 'The pod splits opens some when you touch it, revealing a night elven male who is surprisingly still alive.  He seems to be in good health, though deeply stunned.  As you help him down from the pod, he stirs to life.$B$B"Thank Elune - you\'ve saved me, friend! I... I\'m Raschal, and I awoke paralyzed inside this pod after these bugs overwhelmed me. I could use a hand getting out of here; after that, would you let the Stronghold know that I am all right? I\'ll be fine - we just need to leave, and fast!"', 'Escort Raschal safely out of the Zukk\'ash hive.$B$BReturn to Ginro Hearthkindle in Feathermoon Stronghold and let him know that Raschal is alive and well.', 'Welcome home, $N.  Raschal checked in just a little while ago and told me what happened.$B$BI... no, the entire Stronghold can\'t even begin to thank you for your great deed; Raschal would have been dead without your timely aid, and your assistance came to us without even so much as the whisper of a mercenary\'s fee.  You bear the mark of a true hero.  Know that you will always have a friend in Ginro Hearthkindle.', 'You have something to report, $n?', 'Free Raschal.', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 100, 0, 0, 0, 0, 4050, 0, 2460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 42650, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RequiredCondition`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `BreadcrumbForQuestId`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewXP`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `RewMailMoney`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (4265, 5, 2, 357, 40, 0, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 4135, 0, 0, 0, 4266, 0, 0, 0, 'Freed from the Hive', 'The pod splits opens some when you touch it, revealing a night elven male who is surprisingly still alive.  He seems to be in good health, though deeply stunned.  As you help him down from the pod, he stirs to life.$B$B"Thank Elune - you\'ve saved me, friend!  I... I\'m Raschal, and I awoke paralyzed inside this pod after these bugs overwhelmed me.  Were you sent by the Stronghold?"$B$BIt would seem that you\'ve found the missing courier!', 'Free Raschal from the Zukk\'ash hive.$B$BReturn to Ginro Hearthkindle in Feathermoon Stronghold and let him know that Raschal is alive and well.', 'Welcome home, $N.  Raschal checked in just a little while ago and told me what happened.$B$BI... no, the entire Stronghold can\'t even begin to thank you for your great deed; Raschal would have been dead without your timely aid, and your assistance came to us without even so much as the whisper of a mercenary\'s fee.  You bear the mark of a true hero.  Know that you will always have a friend in Ginro Hearthkindle.', 'You have something to report, $n?', 'Free Raschal.', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 100, 0, 0, 0, 0, 4050, 0, 2460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 42651, 0);

-- Removing EventAI from Raschal the Courier.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (954601, 954602);
DELETE FROM `creature_ai_events` WHERE `creature_id`=9546;
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=9546;

-- Start script for Post-1.7 version of quest.
DELETE FROM `quest_start_scripts` WHERE `id` IN (4265, 42650, 42651);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(42651, 5, 0, 10, 9546, 20000, 0, 0, 0, 0, 0, 0, 0, 42651, -1, 1, -5323.37, 431.877, 12.1585, 3.49066, 0, 'Freed from the Hive: Summon Creature Raschal the Courier'),
(42651, 20, 0, 7, 4265, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Freed from the Hive: Complete Quest');

-- Spawn script for Raschal the Courier during Post-1.7 version of quest.
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(42651, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4949, 0, 0, 0, 0, 0, 0, 0, 0, 'Freed from the Hive: Raschal the Courier - Say Text'),
(42651, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10620, 0, 0, 0, 0, 0, 0, 0, 0, 'Freed from the Hive: Raschal the Courier - Say Text');

-- Start script for Pre-1.7 version of quest.
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(42650, 5, 0, 10, 9546, 300000, 1, 100, 0, 0, 0, 0, 8, 42650, -1, 1, -5323.37, 431.877, 12.1585, 3.49066, 0, 'Escaping the Hive: Summon Creature Raschal the Courier');

-- Failure script for Pre-1.7 version of quest.
DELETE FROM `generic_scripts` WHERE `id`=42652;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(42652, 0, 0, 70, 4265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive Failed: Fail Quest'),
(42652, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive Failed: Raschal the Courier - Despawn');

-- Success script for Pre-1.7 version of quest.
DELETE FROM `generic_scripts` WHERE `id`=42653;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(42653, 0, 0, 7, 4265, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive Success: Complete Quest');

-- Spawn script for Raschal the Courier during Pre-1.7 version of quest.
DELETE FROM `generic_scripts` WHERE `id`=42650;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(42650, 0, 0, 61, 4265, 300, 0, 0, 0, 0, 0, 0, 0, 42653, 6303, 42652, 0, 0, 0, 0, 0, 'Escaping the Hive: Start Scripted Map Event'),
(42650, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4949, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive: Raschal the Courier - Say Text'),
(42650, 10, 0, 20, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive: Raschal the Courier - Start Waypoints');

-- Add waypoints for Raschal the Courier during Pre-1.7 version of quest. (made up)
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES 
(9546, 1, -5326.84, 429.041, 10.5769, 100, 0, 0, 954601, 0),
(9546, 2, -5337.12, 420.946, 10.5632, 100, 0, 0, 0, 0),
(9546, 3, -5349.59, 413.371, 11.1833, 100, 0, 0, 0, 0),
(9546, 4, -5356.52, 402.341, 14.8628, 100, 0, 0, 0, 0),
(9546, 5, -5358.54, 391.251, 18.7334, 100, 0, 0, 0, 0),
(9546, 6, -5352.64, 382.533, 17.6811, 100, 0, 0, 0, 0),
(9546, 7, -5343.49, 378.461, 16.8915, 100, 0, 0, 0, 0),
(9546, 8, -5333.95, 370.7, 17.2272, 100, 0, 0, 0, 0),
(9546, 9, -5326.74, 358.123, 18.9497, 100, 0, 0, 0, 0),
(9546, 10, -5321.48, 348.873, 18.1696, 100, 10000, 0, 954610, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=954601;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(954601, 0, 0, 4, 46, 768, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive: Raschal the Courier - Remove Immunity Flags');
DELETE FROM `creature_movement_scripts` WHERE `id`=954610;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(954610, 0, 0, 4, 46, 768, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive: Raschal the Courier - Add Immunity Flags'),
(954610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4955, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive: Raschal the Courier - Say Text'),
(954610, 0, 0, 62, 4265, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive: Complete Scripted Map Event'),
(954610, 5, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaping the Hive: Raschal the Courier - Despawn');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
