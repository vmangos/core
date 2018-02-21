DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180203182305');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180203182305');
-- Add your query below.

-- Old Winterfall Activity
DELETE FROM `quest_template` WHERE `entry`=6241 AND `patch`=9;
UPDATE `quest_template` SET `MinLevel`=60, `QuestLevel`=56, `RewRepValue1`=100 WHERE  `entry`=6241 AND `patch`=1;
REPLACE INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `QuestFlags`, `SpecialFlags`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `RewRepFaction1`, `RewRepValue1`, `RewMoneyMaxLevel`, `CompleteEmote`) 
VALUES (6241, 7, 1, 1769, 60, 56, 8, 1, 'Winterfall Activity', 'The Timbermaw tend to stay to themselves, $N. While we do allow safe passage to those that have proven they can be trusted, we try to avoid other furbolg tribes if at all possible.$B$BLately I have noticed that the Winterfall tribe has become increasingly hostile towards us. They seem to be in a state of rage, completely engulfed by their own fear and hatred of anything they do not understand.$B$BIf you could reduce their numbers this would help us greatly, $N.', 'Salfa wants you to kill 6 Winterfall Totemics, 6 Winterfall Den Watchers, and 6 Winterfall Pathfinders.', 'Thank you for what you have done. Please continue to help us, $N. We have very few allies on which to call upon.', 'We very much appreciate what you have done for the Timbermaw, $N. Your continued efforts will surely earn my tribe\'s trust and respect.', 7441, 7440, 7442, 6, 6, 6, 576, 100, 4026, 1);

-- New Winterfall Activity
REPLACE INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) 
VALUES (8464, 7, 2, 1769, 45, 0, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Activity', 'The Timbermaw tend to stay to themselves, $N. While we do allow safe passage to those that have proven they can be trusted, we try to avoid other furbolg tribes if at all possible.$B$BLately I have noticed that the Winterfall tribe has become increasingly hostile towards us. They seem to be in a state of rage, completely engulfed by their own fear and hatred of anything they do not understand.$B$BIf you could reduce their numbers this would help us greatly, $N.', 'Salfa wants you to kill 8 Winterfall Totemics, 8 Winterfall Den Watchers, and 8 Winterfall Pathfinders.', 'Thank you for what you have done. Please continue to help us, $N. We have very few allies on which to call upon.', 'We very much appreciate what you have done for the Timbermaw, $N. Your continued efforts will surely earn my tribe\'s trust and respect.', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7441, 7440, 7442, 0, 8, 8, 8, 0, 0, 0, 0, 0, 21318, 21319, 21320, 21322, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 576, 0, 0, 0, 0, 350, 0, 0, 0, 0, 0, 4026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (11556, 8464, 7);
REPLACE INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (11556, 8464, 7);
UPDATE `conditions` SET `value1`=8464 WHERE `condition_entry`=24;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
