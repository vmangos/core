DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180219032202');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180219032202');
-- Add your query below.


-- Lunar Festival vendor corrections.
DELETE FROM `npc_vendor` WHERE `item` IN (21640, 21741, 21743, 21742, 21740, 21537);

-- Correct the number of dumplings received from Coin of Ancenstry turn-ins.
-- 8 as per https://web.archive.org/web/20071113084858/http://wow.allakhazam.com:80/db/quest.html?wquest=8863
UPDATE `quest_template` SET `RewItemCount1` = 8 WHERE `entry` = 8863;

-- Fix quest Lunar Fireworks.
UPDATE `quest_template` SET `ReqCreatureOrGOId1`=15893, `ReqCreatureOrGOId2`=15894 WHERE entry=8867;

-- Add missing quest Wheathoof the Elder.
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (8678, 7, 0, -366, 1, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Proudhorn the Elder', '', '', 'Your spirit burns with life, young $C. I accept the homage you pay, and offer in return this token...', NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21100, 0, 0, 0, 1, 0, 0, 0, 67, 469, 0, 0, 0, 75, 75, 0, 0, 0, 0, 0, 0, 25716, 136, 21600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (15580, 8678, 7);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (15580, 8678, 7);

-- Add missing spawns for Elder Ironband, Elder Obsidian, Elder Farwhisper.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `curhealth`, `curmana`, `spawndist`) VALUES (91638, 15567, 0, -7274.65, -801.765, 296.871, 6.14681, 3857, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `curhealth`, `curmana`, `spawndist`) VALUES (91694, 15561, 0, 514.754, 1560.97, 130.145, 4.39823, 3857, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `curhealth`, `curmana`, `spawndist`) VALUES (91695, 15607, 329, 3703.6, -3450.27, 130.831, 6.13656, 3857, 0, 0);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (91638, 7);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (91694, 7);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (91695, 7);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
