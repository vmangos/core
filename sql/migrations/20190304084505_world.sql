DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190304084505');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190304084505');
-- Add your query below.


-- According to wowhead comments, these used to drop from Buccaneer's Strongbox.
DELETE FROM `gameobject_loot_template` WHERE `entry`=5426;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(5426, 8425, 4, 0, 1, 1, 0, 0, 10),
(5426, 8426, 4, 0, 1, 1, 0, 0, 10),
(5426, 8427, 4, 0, 1, 1, 0, 0, 10);

-- Quest Gahz'rilla had 2 rewards before 1.10.
-- https://web.archive.org/web/20060302210752/http://wow.allakhazam.com/db/quest.html?wquest=2770
DELETE FROM `quest_template` WHERE `entry`=2770;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (2770, 0, 2, 978, 40, 0, 50, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz\'rilla', 'Deep in Zul\'Farrak, the sand troll city in Tanaris, there is a sacred pool.  From that pool the trolls summon a huge beast!  Gahz\'rilla!  He\'s so fierce that even his scales crackle with energy.  It\'s that energy I want to harness for my car!$B$BBring me the electrified scale of Gahz\'rilla!$B$BBut the summoning of Gahz\'rilla is a well-kept secret of the trolls.  To face him, you must first wrest the secret from them.', 'Bring Gahz\'rilla\'s Electrified Scale to Wizzle Brassbolts in the Shimmering Flats.', 'Wow, you got the scale!  Thanks, $N.  I can\'t wait to get to work on this thing!$B$BSo you saw Gahz\'rilla?  Was he as big as they say??', 'Do you have the scale?  I can\'t wait to try different ways to harness its energy!', '', '', '', '', '', 8707, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9653, 11122, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7500, 4260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (2770, 8, 2, 978, 40, 0, 50, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz\'rilla', 'Deep in Zul\'Farrak, the sand troll city in Tanaris, there is a sacred pool.  From that pool the trolls summon a huge beast!  Gahz\'rilla!  He\'s so fierce that even his scales crackle with energy.  It\'s that energy I want to harness for my car!$B$BBring me the electrified scale of Gahz\'rilla!$B$BBut the summoning of Gahz\'rilla is a well-kept secret of the trolls.  To face him, you must first wrest the secret from them.', 'Bring Gahz\'rilla\'s Electrified Scale to Wizzle Brassbolts in the Shimmering Flats.', 'Wow, you got the scale!  Thanks, $N.  I can\'t wait to get to work on this thing!$B$BSo you saw Gahz\'rilla?  Was he as big as they say??', 'Do you have the scale?  I can\'t wait to try different ways to harness its energy!', '', '', '', '', '', 8707, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11122, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7500, 4260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0);

-- Rockfist used to drop from Phalanx until 1.10.
-- https://web.archive.org/web/20050117050616/http://wow.allakhazam.com/db/item.html?witem=11743
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30251, 11743, 0, 1, 1, 1, 0, 0, 7);

-- Phalanx should have a small chance to drop a BoE blue before 1.10.
-- https://web.archive.org/web/20050209085505/http://wow.allakhazam.com/db/mob.html?wmob=9502
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9502, 30558, 0.1, 0, -30558, 1, 0, 0, 7);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(30558, 3075, 0, 1, 1, 1, 0, 0, 7),
(30558, 12527, 0, 1, 1, 1, 0, 0, 7),
(30558, 12528, 0, 1, 1, 1, 0, 0, 7),
(30558, 12532, 0, 1, 1, 1, 0, 0, 7),
(30558, 12535, 0, 1, 1, 1, 0, 0, 7),
(30558, 12547, 0, 1, 1, 1, 0, 0, 7),
(30558, 12549, 0, 1, 1, 1, 0, 0, 7),
(30558, 12550, 0, 1, 1, 1, 0, 0, 7),
(30558, 12551, 0, 1, 1, 1, 0, 0, 7),
(30558, 12552, 0, 1, 1, 1, 0, 0, 7),
(30558, 14501, 0, 1, 1, 1, 0, 0, 7),
(30558, 17413, 0, 1, 1, 1, 0, 0, 7),
(30558, 17414, 0, 1, 1, 1, 0, 0, 7),
(30558, 17682, 0, 1, 1, 1, 0, 0, 7),
(30558, 17683, 0, 1, 1, 1, 0, 0, 7),
(30558, 18600, 0, 1, 1, 1, 0, 0, 7);

-- Golem Skull Helm used to drop from Phalanx not Magmus before 1.10.
-- https://web.archive.org/web/20050904165743/http://wow.allakhazam.com/db/item.html?witem=11746
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30251, 11746, 35, 1, 1, 1, 0, 0, 7);
UPDATE `reference_loot_template` SET `patch_min`=8 WHERE `item`=11746 && `entry`=30259;

-- Incendic Bracers used to drop from Lord Incendius until 1.10.
-- https://web.archive.org/web/20050117050727/http://wow.allakhazam.com/db/item.html?witem=11768
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30227, 11768, 50, 1, 1, 1, 0, 0, 7);

-- Lord Incendius should have a small chance to drop a BoE blue before 1.10.
-- https://web.archive.org/web/20060112204124/http://wow.allakhazam.com/db/mob.html?wmob=9017
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9017, 30563, 0.1, 0, -30563, 1, 0, 0, 7);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(30563, 2824, 0, 1, 1, 1, 0, 0, 7),
(30563, 3075, 0, 1, 1, 1, 0, 0, 7),
(30563, 12527, 0, 1, 1, 1, 0, 0, 7),
(30563, 12528, 0, 1, 1, 1, 0, 0, 7),
(30563, 12532, 0, 1, 1, 1, 0, 0, 7),
(30563, 12535, 0, 1, 1, 1, 0, 0, 7),
(30563, 12542, 0, 1, 1, 1, 0, 0, 7),
(30563, 12549, 0, 1, 1, 1, 0, 0, 7),
(30563, 12550, 0, 1, 1, 1, 0, 0, 7),
(30563, 12551, 0, 1, 1, 1, 0, 0, 7),
(30563, 12552, 0, 1, 1, 1, 0, 0, 7),
(30563, 12555, 0, 1, 1, 1, 0, 0, 7),
(30563, 12691, 0, 1, 1, 1, 0, 0, 7),
(30563, 14497, 0, 1, 1, 1, 0, 0, 7),
(30563, 14552, 0, 1, 1, 1, 0, 0, 7),
(30563, 17413, 0, 1, 1, 1, 0, 0, 7),
(30563, 17414, 0, 1, 1, 1, 0, 0, 7),
(30563, 17682, 0, 1, 1, 1, 0, 0, 7),
(30563, 17683, 0, 1, 1, 1, 0, 0, 7),
(30563, 18600, 0, 1, 1, 1, 0, 0, 7);

-- Quest The Troll Cave had 5 rewards before 1.7.
-- https://web.archive.org/web/20050527191331/http://wow.allakhazam.com/db/quest.html?wquest=182
DELETE FROM `quest_template` WHERE `entry`=182;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (182, 0, 2, 132, 1, 0, 4, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 218, 0, 0, 0, 'The Troll Cave', 'My brother Senir and I were sent to different parts of Dun Morogh to investigate the threat posed by the trolls. The Senate has its hands full with the troggs, so they\'ve no need for further annoyances.$b$bFrom what I\'ve seen, the trolls aren\'t well situated here in Coldridge Valley--mostly the southern cave. I\'d say that the army will not be necessary. A few strong arms should be more than enough.$b$bPerhaps you\'d like to assist in this endeavor? I have the authority to offer compensation for your help.', 'Grelin Whitebeard would like you to kill 14 Frostmane Troll Whelps.', 'Argh! Those Light-blasted trolls!$b<He takes a few breaths and seems to settle down... a bit.>$bA group of them came in the night and stole my journal! I knew better than to trust that good-for-nothing appr...', 'From what I\'ve learned, these trolls hail from the Frostmane clan. I\'m afraid I don\'t know much else about them that would be of any use to you, $N.', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 706, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 2047, 2048, 2195, 5761, 12446, 0, 1, 1, 1, 1, 1, 0, 961, 0, 0, 0, 3, 0, 0, 0, 54, 47, 0, 0, 0, 250, 250, 0, 0, 0, 0, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (182, 5, 2, 132, 1, 0, 4, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 218, 0, 0, 0, 'The Troll Cave', 'My brother Senir and I were sent to different parts of Dun Morogh to investigate the threat posed by the trolls. The Senate has its hands full with the troggs, so they\'ve no need for further annoyances.$b$bFrom what I\'ve seen, the trolls aren\'t well situated here in Coldridge Valley--mostly the southern cave. I\'d say that the army will not be necessary. A few strong arms should be more than enough.$b$bPerhaps you\'d like to assist in this endeavor? I have the authority to offer compensation for your help.', 'Grelin Whitebeard would like you to kill 14 Frostmane Troll Whelps.', 'Argh! Those Light-blasted trolls!$b<He takes a few breaths and seems to settle down... a bit.>$bA group of them came in the night and stole my journal! I knew better than to trust that good-for-nothing appr...', 'From what I\'ve learned, these trolls hail from the Frostmane clan. I\'m afraid I don\'t know much else about them that would be of any use to you, $N.', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 706, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 2047, 2048, 2195, 5761, 0, 0, 1, 1, 1, 1, 0, 0, 961, 0, 0, 0, 3, 0, 0, 0, 54, 47, 0, 0, 0, 250, 250, 0, 0, 0, 0, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Quest Webwood Venom had 6 rewards before 1.8.
-- https://web.archive.org/web/20050415180257/http://wow.allakhazam.com/db/quest.html?wquest=916
DELETE FROM `quest_template` WHERE `entry`=916;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (916, 0, 2, 188, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 917, 0, 0, 0, 'Webwood Venom', 'I came to Shadowglen to observe the webwood spiders that dwell in the Shadowthread Cave.  They are cousin to a much smaller variety of spider; I believe the world tree has had a profound effect on them, and I would like specimens to study to confirm this.$B$BFirst, I would like some of their venom.  Gather Webwood venom sacs from the spiders in and around the Shadowthread Cave, to the north.  I can then examine them for similarities with their smaller cousin\'s venom.', 'Bring 10 Webwood Venom Sacs to Gilshalan Windwalker at Aldrassil.', 'Thank you, $N. When I return to Darnassus I will compare the venom within these sacs with the venom of other spiders. It is my belief that it will have properties linked to the recent growth of our new world tree.', 'Did you gather the venom sacs, $N?', '', '', '', '', '', 5166, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1386, 5392, 5393, 5586, 10544, 12447, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 250, 0, 0, 0, 0, 0, 216, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (916, 6, 2, 188, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 917, 0, 0, 0, 'Webwood Venom', 'I came to Shadowglen to observe the webwood spiders that dwell in the Shadowthread Cave.  They are cousin to a much smaller variety of spider; I believe the world tree has had a profound effect on them, and I would like specimens to study to confirm this.$B$BFirst, I would like some of their venom.  Gather Webwood venom sacs from the spiders in and around the Shadowthread Cave, to the north.  I can then examine them for similarities with their smaller cousin\'s venom.', 'Bring 10 Webwood Venom Sacs to Gilshalan Windwalker at Aldrassil.', 'Thank you, $N. When I return to Darnassus I will compare the venom within these sacs with the venom of other spiders. It is my belief that it will have properties linked to the recent growth of our new world tree.', 'Did you gather the venom sacs, $N?', '', '', '', '', '', 5166, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10544, 5392, 5393, 5586, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 250, 0, 0, 0, 0, 0, 216, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Quest Rite of Strength had 6 rewards before 1.10.
-- https://web.archive.org/web/20050210142722/http://wow.allakhazam.com/db/quest.html?wquest=757
DELETE FROM `quest_template` WHERE `entry`=757;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (757, 0, 2, 220, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 755, 0, 0, 763, 0, 0, 0, 'Rite of Strength', 'The Rites of the Earthmother are the steps a young tauren needs to take to gain respect in Thunder Bluff.$b$bFirst you must pass the Rite of Strength. In this test you must prove your bravery by slaying enemies of the tribe.$b$bBristlebacks of Brambleblade Ravine to the east are encroaching on our tribal lands. They ambush our hunting parties and steal from the village by dark.$b$bShow your valor by slaying these villains and return to the Chief in Camp Narache with their belts as proof of your deeds.', 'Kill Bristlebacks in Brambleblade Ravine and bring 12 Bristleback Belts to Chief Hawkwind in Camp Narache.', 'You have passed the first test of the Rites of the Earthmother. The tribe will be proud.', 'Have you completed the Rite of Strength, $N? I require proof of your valor against the enemy of our tribe, the Bristlebacks.', '', '', '', '', '', 4770, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1382, 1383, 2137, 5776, 5777, 12448, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 350, 0, 0, 0, 0, 0, 270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (757, 8, 2, 220, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 755, 0, 0, 763, 0, 0, 0, 'Rite of Strength', 'The Rites of the Earthmother are the steps a young tauren needs to take to gain respect in Thunder Bluff.$b$bFirst you must pass the Rite of Strength. In this test you must prove your bravery by slaying enemies of the tribe.$b$bBristlebacks of Brambleblade Ravine to the east are encroaching on our tribal lands. They ambush our hunting parties and steal from the village by dark.$b$bShow your valor by slaying these villains and return to the Chief in Camp Narache with their belts as proof of your deeds.', 'Kill Bristlebacks in Brambleblade Ravine and bring 12 Bristleback Belts to Chief Hawkwind in Camp Narache.', 'You have passed the first test of the Rites of the Earthmother. The tribe will be proud.', 'Have you completed the Rite of Strength, $N? I require proof of your valor against the enemy of our tribe, the Bristlebacks.', '', '', '', '', '', 4770, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1382, 1383, 2137, 5776, 5777, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 350, 0, 0, 0, 0, 0, 270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Quest Vile Familiars had 5 reward before 1.7.
-- https://web.archive.org/web/20050827102650/http://wow.allakhazam.com/db/quest.html?wquest=792
DELETE FROM `quest_template` WHERE `entry`=792;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (792, 0, 2, 363, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 794, 0, 794, 0, 0, 0, 'Vile Familiars', 'I trust the Valley of Trials will teach you much, young $c.$B$BI was sent to the Valley to guide you, but I have discovered a growing taint here...$B$BA group that calls itself the Burning Blade has a coven here in the Valley of Trials.  They are skulking in a cave to the northeast, and their Vile Familiars have spilled from its mouth to cause havoc.$B$BAs your first task against the Burning Blade, I bid you, defeat these familiars. Slay many and, if you survive, return to me.', 'Kill 12 Vile Familiars.$B$BReturn to Zureetha Fargaze outside the Den.', 'You have done well, $N.$b$bAlthough the Vile Familiars were merely pets of the darker powers within the Burning Blade, your success against them foretells greater deeds ahead.', 'To prove yourself against the Burning Blade, you must first defeat its Vile Familiars. Return to me when you have done this.', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3101, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 4924, 4925, 4923, 5778, 12449, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 530, 76, 0, 0, 0, 350, 350, 0, 0, 0, 0, 270, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (792, 5, 2, 363, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 794, 0, 794, 0, 0, 0, 'Vile Familiars', 'I trust the Valley of Trials will teach you much, young $c.$B$BI was sent to the Valley to guide you, but I have discovered a growing taint here...$B$BA group that calls itself the Burning Blade has a coven here in the Valley of Trials.  They are skulking in a cave to the northeast, and their Vile Familiars have spilled from its mouth to cause havoc.$B$BAs your first task against the Burning Blade, I bid you, defeat these familiars. Slay many and, if you survive, return to me.', 'Kill 12 Vile Familiars.$B$BReturn to Zureetha Fargaze outside the Den.', 'You have done well, $N.$b$bAlthough the Vile Familiars were merely pets of the darker powers within the Burning Blade, your success against them foretells greater deeds ahead.', 'To prove yourself against the Burning Blade, you must first defeat its Vile Familiars. Return to me when you have done this.', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3101, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 4924, 4925, 4923, 5778, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 530, 76, 0, 0, 0, 350, 350, 0, 0, 0, 0, 270, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Bonespike Shoulder dropped from Warchief Rend Blackhand before 1.10.
-- https://web.archive.org/web/20060215190357/http://wow.allakhazam.com/db/item.html?witem=12588
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10429, 12588, 0, 1, 1, 1, 0, 0, 7);

-- Warchief Rend Blackhand should have a small chance to drop a BoE blue before 1.10.
-- https://web.archive.org/web/20060307182531/http://wow.allakhazam.com/db/mob.html?wmob=10429
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10429, 30559, 0.1, 0, -30559, 1, 0, 0, 7);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(30559, 944, 0, 1, 1, 1, 0, 0, 7),
(30559, 1443, 0, 1, 1, 1, 0, 0, 7),
(30559, 1728, 0, 1, 1, 1, 0, 0, 7),
(30559, 2243, 0, 1, 1, 1, 0, 0, 7),
(30559, 3475, 0, 1, 1, 1, 0, 0, 7),
(30559, 9402, 0, 1, 1, 1, 0, 0, 7),
(30559, 13000, 0, 1, 1, 1, 0, 0, 7),
(30559, 13001, 0, 1, 1, 1, 0, 0, 7),
(30559, 13006, 0, 1, 1, 1, 0, 0, 7),
(30559, 13072, 0, 1, 1, 1, 0, 0, 7),
(30559, 13107, 0, 1, 1, 1, 0, 0, 7),
(30559, 13116, 0, 1, 1, 1, 0, 0, 7),
(30559, 13123, 0, 1, 1, 1, 0, 0, 7),
(30559, 13133, 0, 1, 1, 1, 0, 0, 7),
(30559, 14555, 0, 1, 1, 1, 0, 0, 7),
(30559, 17414, 0, 1, 1, 1, 0, 0, 7),
(30559, 17683, 0, 1, 1, 1, 0, 0, 7),
(30559, 18335, 0, 1, 1, 1, 0, 0, 7),
(30559, 18600, 0, 1, 1, 1, 0, 0, 7),
(30559, 19262, 0, 1, 1, 1, 0, 0, 7),
(30559, 19263, 0, 1, 1, 1, 0, 0, 7),
(30559, 19264, 0, 1, 1, 1, 0, 0, 7),
(30559, 19265, 0, 1, 1, 1, 0, 0, 7),
(30559, 19274, 0, 1, 1, 1, 0, 0, 7),
(30559, 19281, 0, 1, 1, 1, 0, 0, 7),
(30559, 19282, 0, 1, 1, 1, 0, 0, 7),
(30559, 19284, 0, 1, 1, 1, 0, 0, 7);

-- Voone's Twitchbow used to drop from War Master Voone before 1.10.
-- https://web.archive.org/web/20051129162435/http://wow.allakhazam.com/db/item.html?witem=13175
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30248, 13175, 0, 1, 1, 1, 0, 0, 7);

-- War Master Voone should have a small chance to drop a BoE blue before 1.10.
-- https://web.archive.org/web/20060307184719/http://wow.allakhazam.com/db/mob.html?wmob=9237
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9237, 30560, 0.1, 0, -30560, 1, 0, 0, 7);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(30560, 1168, 0, 1, 1, 1, 0, 0, 7),
(30560, 1973, 0, 1, 1, 1, 0, 0, 7),
(30560, 2099, 0, 1, 1, 1, 0, 0, 7),
(30560, 2245, 0, 1, 1, 1, 0, 0, 7),
(30560, 12691, 0, 1, 1, 1, 0, 0, 7),
(30560, 13000, 0, 1, 1, 1, 0, 0, 7),
(30560, 13007, 0, 1, 1, 1, 0, 0, 7),
(30560, 13047, 0, 1, 1, 1, 0, 0, 7),
(30560, 13053, 0, 1, 1, 1, 0, 0, 7),
(30560, 13101, 0, 1, 1, 1, 0, 0, 7),
(30560, 13135, 0, 1, 1, 1, 0, 0, 7),
(30560, 13146, 0, 1, 1, 1, 0, 0, 7),
(30560, 17414, 0, 1, 1, 1, 0, 0, 7),
(30560, 17683, 0, 1, 1, 1, 0, 0, 7),
(30560, 18335, 0, 1, 1, 1, 0, 0, 7),
(30560, 18600, 0, 1, 1, 1, 0, 0, 7),
(30560, 19236, 0, 1, 1, 1, 0, 0, 7),
(30560, 19263, 0, 1, 1, 1, 0, 0, 7),
(30560, 19265, 0, 1, 1, 1, 0, 0, 7),
(30560, 19272, 0, 1, 1, 1, 0, 0, 7),
(30560, 19275, 0, 1, 1, 1, 0, 0, 7);

-- Detention Strap used to drop from Darkmaster Gandling before 1.10.
-- https://web.archive.org/web/20050223103609/http://wow.allakhazam.com/db/item.html?witem=13950
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30109, 13950, 0, 1, 1, 1, 0, 0, 7);

-- Darkmaster Gandling should have a small chance to drop a BoE blue before 1.10.
-- https://web.archive.org/web/20060215185720/http://wow.allakhazam.com/db/mob.html?wmob=1853
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1853, 30561, 0.1, 0, -30561, 1, 0, 0, 7);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(30561, 9402, 0, 1, 1, 1, 0, 0, 7),
(30561, 13001, 0, 1, 1, 1, 0, 0, 7),
(30561, 13028, 0, 1, 1, 1, 0, 0, 7),
(30561, 13096, 0, 1, 1, 1, 0, 0, 7),
(30561, 13107, 0, 1, 1, 1, 0, 0, 7),
(30561, 13116, 0, 1, 1, 1, 0, 0, 7),
(30561, 13133, 0, 1, 1, 1, 0, 0, 7),
(30561, 17414, 0, 1, 1, 1, 0, 0, 7),
(30561, 17683, 0, 1, 1, 1, 0, 0, 7),
(30561, 18600, 0, 1, 1, 1, 0, 0, 7),
(30561, 18701, 0, 1, 1, 1, 0, 0, 7),
(30561, 18702, 0, 1, 1, 1, 0, 0, 7);

-- Darkshade Gloves used to drop from Jandice Barov before 1.10.
-- https://web.archive.org/web/20060307182701/http://wow.allakhazam.com/db/mob.html?wmob=10503
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30290, 14543, 0, 1, 1, 1, 0, 0, 7);

-- Jandice Barov should have a small chance to drop a BoE blue before 1.10.
-- https://web.archive.org/web/20060307182701/http://wow.allakhazam.com/db/mob.html?wmob=10503
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10503, 30562, 0.1, 0, -30562, 1, 0, 0, 7);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(30562, 2243, 0, 1, 1, 1, 0, 0, 7),
(30562, 4696, 0, 1, 1, 1, 0, 0, 7),
(30562, 12717, 0, 1, 1, 1, 0, 0, 7),
(30562, 13002, 0, 1, 1, 1, 0, 0, 7),
(30562, 13028, 0, 1, 1, 1, 0, 0, 7),
(30562, 13083, 0, 1, 1, 1, 0, 0, 7),
(30562, 13107, 0, 1, 1, 1, 0, 0, 7),
(30562, 13116, 0, 1, 1, 1, 0, 0, 7),
(30562, 14536, 0, 1, 1, 1, 0, 0, 7),
(30562, 17414, 0, 1, 1, 1, 0, 0, 7),
(30562, 17683, 0, 1, 1, 1, 0, 0, 7),
(30562, 18335, 0, 1, 1, 1, 0, 0, 7),
(30562, 18600, 0, 1, 1, 1, 0, 0, 7),
(30562, 19234, 0, 1, 1, 1, 0, 0, 7),
(30562, 19235, 0, 1, 1, 1, 0, 0, 7),
(30562, 19263, 0, 1, 1, 1, 0, 0, 7),
(30562, 19273, 0, 1, 1, 1, 0, 0, 7),
(30562, 19281, 0, 1, 1, 1, 0, 0, 7),
(30562, 19282, 0, 1, 1, 1, 0, 0, 7),
(30562, 19284, 0, 1, 1, 1, 0, 0, 7);

-- Arcane Dust used to be sold by reagents vendors.
-- https://web.archive.org/web/20060524022043/http://wow.allakhazam.com/db/item.html?witem=17019
INSERT INTO `forbidden_items` VALUES (17019, 8, 0);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES 
(958, 17019, 0, 0),
(983, 17019, 0, 0),
(1257, 17019, 0, 0),
(1275, 17019, 0, 0),
(1307, 17019, 0, 0),
(1308, 17019, 0, 0),
(1351, 17019, 0, 0),
(1463, 17019, 0, 0),
(1673, 17019, 0, 0),
(2805, 17019, 0, 0),
(3323, 17019, 0, 0),
(3335, 17019, 0, 0),
(3351, 17019, 0, 0),
(3490, 17019, 0, 0),
(3542, 17019, 0, 0),
(3562, 17019, 0, 0),
(3970, 17019, 0, 0),
(4083, 17019, 0, 0),
(4220, 17019, 0, 0),
(4562, 17019, 0, 0),
(4575, 17019, 0, 0),
(4878, 17019, 0, 0),
(5110, 17019, 0, 0),
(5151, 17019, 0, 0),
(8361, 17019, 0, 0),
(14739, 17019, 0, 0);

/*
 World of Warcraft Client Patch 1.3.0 (2005-03-22)
 - Fixed a bug with Fist of Stone that caused it to have stats that it 
   shouldn't have. Existing Fist of Stone items have not been changed.
*/

UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=30360 && `item`=17943;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (30360, 17733, 0, 1, 1, 1, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
