DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171129173932');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171129173932');
-- Add your query below.


-- Fix texts for Donna and William
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (6, 0, 0, 0, 2532, 30, 0, 0, 694, 695, 696, 697, 0, 0, 0, 0, 'Donna Say Texts Part 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (7, 0, 0, 0, 2532, 30, 0, 0, 698, 699, 700, 701, 0, 0, 0, 0, 'Donna Say Texts Part 2');
UPDATE `creature_movement` SET `textid1`=711, `script_id`=7 WHERE `id`=79720 && `point`=58;
UPDATE `creature_movement` SET `textid1`=707 WHERE `id`=79720 && `point`=57;
UPDATE `creature_movement` SET `textid1`=711, `script_id`=7 WHERE `id`=79720 && `point`=82;
UPDATE `creature_movement` SET `textid1`=0, `script_id`=6 WHERE `id`=79720 && `textid1`=694;
UPDATE `creature_movement` SET `textid1`=0, `script_id`=7 WHERE `id`=79720 && `textid1`=696;
UPDATE `creature_movement` SET `textid2`=707 WHERE `id`=79720 && `textid1`=705;
UPDATE `creature_movement` SET `textid2`=708 WHERE `id`=79720 && `textid1`=706;

-- Fix faction and equipment for Sentinel Amarassan
UPDATE `creature_template` SET `faction_A`=124, `faction_H`=124, `equipment_id`=5916 WHERE `entry`=5916;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (5916, 5598, 0, 0);

-- ERROR:Unknown item (entry=12584) in creature_equip_template.equipentry1 for entry = 1450, forced to 0.
-- ERROR:Unknown item (entry=18825) in creature_equip_template.equipentry2 for entry = 1450, forced to 0.
DELETE FROM `creature_equip_template` WHERE `entry`=1450;
UPDATE `creature_template` SET `equipment_id`=15858 WHERE `entry`=15858;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (15858, 21573, 21572, 0);
UPDATE `creature_template` SET `equipment_id`=15868 WHERE `entry`=15868;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (15868, 21573, 21572, 0);

-- ERROR:Table `creature` has creature (GUID: 113132) with non existing creature entry 21010, skipped.
UPDATE `creature` SET `patch_min`=7 WHERE `guid`=113132;

-- ERROR:Table `creature_questrelation: Quest 1658 listed for entry 15199 does not exist.
UPDATE `creature_questrelation` SET `patch`=6 WHERE `quest`=1658;
-- ERROR:Table `creature_questrelation: Quest 9154 listed for entry 16255 does not exist.
UPDATE `creature_questrelation` SET `patch`=9 WHERE `quest`=9154;
-- ERROR:Table `creature_involvedrelation: Quest 1657 listed for entry 15197 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=6 WHERE `quest`=1657;
-- ERROR:Table `creature_involvedrelation: Quest 9094 listed for entry 16786 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=9 WHERE `quest`=9094;
-- ERROR:Table `creature_involvedrelation: Quest 9317 listed for entry 16786 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=9 WHERE `quest`=9317;
-- ERROR:Table `creature_involvedrelation: Quest 9318 listed for entry 16786 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=9 WHERE `quest`=9318;
-- ERROR:Table `creature_involvedrelation: Quest 9320 listed for entry 16786 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=9 WHERE `quest`=9320;
-- ERROR:Table `creature_involvedrelation: Quest 9321 listed for entry 16786 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=9 WHERE `quest`=9321;
-- ERROR:Table `creature_involvedrelation: Quest 9341 listed for entry 16786 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=9 WHERE `quest`=9341;

-- ERROR:Table `game_event_quest` contain entry for quest 8860 (event 34) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=6 WHERE `quest`=8860;
-- ERROR:Table `game_event_quest` contain entry for quest 8507 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8507;
-- ERROR:Table `game_event_quest` contain entry for quest 8861 (event 34) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=6 WHERE `quest`=8861;
-- ERROR:Table `game_event_quest` contain entry for quest 8743 (event 85) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8743;
-- ERROR:Table `game_event_quest` contain entry for quest 8731 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8731;
-- ERROR:Table `game_event_quest` contain entry for quest 8800 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8800;
-- ERROR:Table `game_event_quest` contain entry for quest 8556 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8556;
-- ERROR:Table `game_event_quest` contain entry for quest 8557 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8557;
-- ERROR:Table `game_event_quest` contain entry for quest 8558 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8558;
-- ERROR:Table `game_event_quest` contain entry for quest 8689 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8689;
-- ERROR:Table `game_event_quest` contain entry for quest 8690 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8690;
-- ERROR:Table `game_event_quest` contain entry for quest 8691 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8691;
-- ERROR:Table `game_event_quest` contain entry for quest 8692 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8692;
-- ERROR:Table `game_event_quest` contain entry for quest 8693 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8693;
-- ERROR:Table `game_event_quest` contain entry for quest 8694 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8694;
-- ERROR:Table `game_event_quest` contain entry for quest 8695 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8695;
-- ERROR:Table `game_event_quest` contain entry for quest 8696 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8696;
-- ERROR:Table `game_event_quest` contain entry for quest 8697 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8697;
-- ERROR:Table `game_event_quest` contain entry for quest 8698 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8698;
-- ERROR:Table `game_event_quest` contain entry for quest 8699 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8699;
-- ERROR:Table `game_event_quest` contain entry for quest 8700 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8700;
-- ERROR:Table `game_event_quest` contain entry for quest 8701 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8701;
-- ERROR:Table `game_event_quest` contain entry for quest 8702 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8702;
-- ERROR:Table `game_event_quest` contain entry for quest 8703 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8703;
-- ERROR:Table `game_event_quest` contain entry for quest 8704 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8704;
-- ERROR:Table `game_event_quest` contain entry for quest 8705 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8705;
-- ERROR:Table `game_event_quest` contain entry for quest 8706 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8706;
-- ERROR:Table `game_event_quest` contain entry for quest 8707 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8707;
-- ERROR:Table `game_event_quest` contain entry for quest 8708 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8708;
-- ERROR:Table `game_event_quest` contain entry for quest 8709 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8709;
-- ERROR:Table `game_event_quest` contain entry for quest 8710 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8710;
-- ERROR:Table `game_event_quest` contain entry for quest 8711 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8711;
-- ERROR:Table `game_event_quest` contain entry for quest 8712 (event 86) but this quest does not exist. Skipping.
UPDATE `game_event_quest` SET `patch`=7 WHERE `quest`=8712;

-- ERROR:Quest condition (entry 24, type 8) specifies non-existing quest (6241), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 24, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (6241, 0, 1, 61, 60, '[DISABLED] Winterfall Activity');
-- ERROR:Quest condition (entry 1372, type 8) specifies non-existing quest (1657), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 1372, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (1657, 0, 1, 61, 60, '[DISABLED] Stinking Up Southshore');
-- ERROR:Quest condition (entry 1373, type 8) specifies non-existing quest (8373), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 1373, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8373, 0, 1, 61, 60, '[DISABLED] The Power of Pine');
-- ERROR:Quest condition (entry 8534, type 9) specifies non-existing quest (8534), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 8534, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8534, 0, 1, 61, 60, '[DISABLED] Hive\'Zora Scout Report');
-- ERROR:Quest condition (entry 8738, type 9) specifies non-existing quest (8738), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 8738, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8738, 0, 1, 61, 60, '[DISABLED] Hive\'Regal Scout Report');
-- ERROR:Quest condition (entry 8739, type 9) specifies non-existing quest (8739), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 8739, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8739, 0, 1, 61, 60, '[DISABLED] Hive\'Ashi Scout Report');
-- ERROR:Quest condition (entry 8924, type 9) specifies non-existing quest (8924), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 8924, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8924, 0, 1, 61, 60, '[DISABLED] Hunting for Ectoplasm');
-- ERROR:Quest condition (entry 8977, type 8) specifies non-existing quest (8977), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 8977, skip
-- ERROR:CONDITION _AND or _OR (entry 22115, type -2) has value1 8977 without proper condition, skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 22115, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8977, 0, 1, 61, 60, '[DISABLED] Return to Deliana');
-- ERROR:Quest condition (entry 8978, type 8) specifies non-existing quest (8978), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 8978, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8978, 0, 1, 61, 60, '[DISABLED] Return to Mokvar');
-- ERROR:Quest condition (entry 57006, type 8) specifies non-existing quest (8996), skipped
-- ERROR:ObjectMgr::LoadConditions: invalid condition_entry 57006, skip
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `MinLevel`, `QuestLevel`, `Title`) VALUES (8996, 0, 1, 61, 60, '[DISABLED] Return to Bodley');

-- Fix Rapid Cast spell.
INSERT INTO `spell_effect_mod` (`Id`, `EffectBasePoints`, `Comment`) VALUES (8215, 50, 'Rapid Cast - Should be 50 percent.');

-- Add missing AQ war efforts quests.
-- https://github.com/LightsHope/server/issues/830
-- The Alliance Needs Your Help!
DELETE FROM `quest_template` WHERE `entry` IN (8795, 8796, 8797);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (8795, 7, 2, -365, 10, 0, 60, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 8795, 0, 0, 0, 0, 'The Alliance Needs Your Help!', 'Hello, I\'m glad that you\'ve decided to hear me out. The Alliance needs all of the help that it can get to prepare for the Ahn\'Qiraj War, and that means that we need you! Even now as we speak, official collectors are gathering the necessary material needed for the upcoming war, but we won\'t be able to meet our goals without your assistance, $N!$B$BYou should go speak with the guy in charge, Field Marshal Snowfall. What do you say, $c? Will you help out with the vital preparations?', 'Speak with Field Marshal Snowfall in Ironforge\'s Military Ward.', 'Hail and well met lad! Good to see so many of the Alliance, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.', NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (8796, 7, 2, -365, 10, 0, 60, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 8795, 0, 0, 0, 0, 'The Alliance Needs Your Help!', 'Hello, I\'m glad that you\'ve decided to hear me out. The Alliance needs all of the help that it can get to prepare for the Ahn\'Qiraj War, and that means that we need you! Even now as we speak, official collectors are gathering the necessary material needed for the upcoming war, but we won\'t be able to meet our goals without your assistance, $N!$B$BYou should go speak with the guy in charge, Field Marshal Snowfall. What do you say, $c? Will you help out with the vital preparations?', 'Speak with Field Marshal Snowfall in Ironforge\'s Military Ward.', 'Hail and well met lad! Good to see so many of the Alliance, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.', NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (8797, 7, 2, -365, 10, 0, 60, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 8795, 0, 0, 0, 0, 'The Alliance Needs Your Help!', 'Hello, I\'m glad that you\'ve decided to hear me out. The Alliance needs all of the help that it can get to prepare for the Ahn\'Qiraj War, and that means that we need you! Even now as we speak, official collectors are gathering the necessary material needed for the upcoming war, but we won\'t be able to meet our goals without your assistance, $N!$B$BYou should go speak with the guy in charge, Field Marshal Snowfall. What do you say, $c? Will you help out with the vital preparations?', 'Speak with Field Marshal Snowfall in Ironforge\'s Military Ward.', 'Hail and well met lad! Good to see so many of the Alliance, such as yourself, $N, coming out to lend your support in laying the groundwork for the upcoming Ahn\'Qiraj War. The effort here will ensure that we are victorious against the Silithid and their evil masters hidden away inside Ahn\'Qiraj.$B$BSo now that you are here, be sure to speak with the various collectors and offer your assistance in gathering those materials that you are suited to.', NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature_questrelation` WHERE `quest`=8795;
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (15707, 8795, 7);
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (15708, 8796, 7);
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (15709, 8797, 7);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (15701, 8796, 7);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (15701, 8797, 7);
-- Fix exclusive group for The Horde Needs Your Help!.
UPDATE `quest_template` SET `ExclusiveGroup`=8792 WHERE `entry` IN (8792, 8793, 8794);
-- Add quests to the war effort event.
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8792, 22, 7);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8793, 22, 7);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8796, 22, 7);
INSERT INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES (8797, 22, 7);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
