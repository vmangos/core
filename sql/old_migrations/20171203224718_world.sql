DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171203224718');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171203224718');
-- Add your query below.


-- Shaken gift
REPLACE INTO `item_loot_template` (`entry`, `item`, `mincountOrRef`, `maxcount`) VALUES (21271, 21241, 5, 5);

-- Ticking Present
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=21327 AND `item`=21213;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=21327 AND `item`=21325;

-- Gaily Wrapped Present
DELETE FROM `item_loot_template` WHERE `entry`=21310;
REPLACE INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES 
(21310, 21308, 25, 1, 1, 1, 0),(21310, 21305, 25, 1, 1, 1, 0),(21310, 21309, 25, 1, 1, 1, 0),(21310, 21301, 25, 1, 1, 1, 0);

-- Winters Veil quests
REPLACE INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES 
(8744, 6, 0, -22, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'A Carefully Wrapped Present', '', '', 'The tag on this present reads:$b$bTo $N,$b$bMay your feast of Great-Winter be merry and bright!', NULL, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21191, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8767, 6, 0, -22, 1, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gently Shaken Gift', '', '', 'This present looks like it has been shaken a few times. The tag on it reads:$B$BTo a very special $R $C.', NULL, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21270, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8768, 6, 0, -22, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gaily Wrapped Present', '', '', 'This festively-wrapped present has your name on it.$b$bWait, did it just move?', NULL, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21310, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8769, 6, 0, -22, 40, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'A Ticking Present', '', '', 'Have a joyous Feast of Great-Winter from your friends at Smokeywood Pastures.', NULL, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21327, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8788, 6, 0, -22, 1, 0, 1, 0, 1494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gently Shaken Gift', '', '', 'This present looks like it has been shaken a few times. The tag on it reads:$B$BTo a very special $r $c.', NULL, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21271, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8803, 6, 0, -22, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'A Festive Gift', '', '', 'The note on this present reads:$b$bTo $n,$b$bIn hoping this will help you spread warm tidings and holiday cheer to all of Azeroth.$b$bFrom Greatfather Winter', NULL, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21363, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8827, 6, 2, -22, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter\'s Presents', 'I hear Greatfather Winter - with the generous support of Smokeywood Pastures - has put presents for everyone under the tree in Ironforge. I wish I could go, but I\'ve got to look after the PX-238 Winter Wondervolt.$b$bBut you should definitely check it out. I\'m sure Greatfather Winter has some presents with your name on them.', 'Speak with Greatfather Winter. He is located near the Smokywood Pastures vendor area in Ironforge.', 'Oh, ho hello there! You can only be here for one reason: to open your Winter Veil presents.$B$BNow, don\'t you worry, Greatfather Winter hasn\'t forgotten about his favorite $R $C. Look under the tree and you\'ll find your gifts.$B$BDuring this season of giving, perhaps your friends would also enjoy receiving some of Smokeywood Pasture\'s excellent products?', NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8828, 6, 2, -22, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter\'s Presents', 'I hear Greatfather Winter - with the generous support of Smokeywood Pastures - has put presents for everyone under the tree in Orgrimmar. I wish I could go, but I\'ve got to look after the PX-238 Winter Wondervolt.$b$bBut you should definitely check it out. I\'m sure Greatfather Winter has some presents with your name on them.', 'Speak with Greatfather Winter. He is located near the Smokywood Pastures vendor area in Orgrimmar.', 'Oh, ho hello there! You can only be here for one reason: to open your Winter Veil presents.$B$BNow, don\'t you worry, Greatfather Winter hasn\'t forgotten about his favorite $R $C. Look under the tree and you\'ll find your gifts.$B$BDuring this season of giving, perhaps your friends would also enjoy receiving some of Smokeywood Pasture\'s excellent products?', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (15732, 8828, 6);
REPLACE INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (13445, 8828, 6);
UPDATE `quest_template` SET `RequiredRaces`=77 WHERE  `entry`=8827;
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE  `entry`=8828;

-- Main event end date
UPDATE `game_event` SET `end_time`='2021-01-02 23:59:59', `length`=25980 WHERE `entry`=2;

-- Winters Veil Gifts event
REPLACE INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`) VALUES 
(21, '2017-12-25 00:00:00', '2021-01-02 23:59:59', 525600, 12960, 0, 'Feast of Winter Veil: Gifts', 0, 0, 0, 10);

-- Winters Veil Gifts quests
REPLACE INTO `game_event_quest` (`quest`, `event`, `patch`) VALUES 
(8827, 21, 6),(8828, 21, 6);

REPLACE INTO `gameobject_questrelation` (`id`, `quest`, `patch`) VALUES 
(180746, 8788, 6),
(180746, 8767, 6),
(180743, 8744, 6),
(180747, 8768, 6),
(180748, 8769, 6),
(180793, 8803, 6);

REPLACE INTO `gameobject_involvedrelation` (`id`, `quest`, `patch`) VALUES 
(180743, 8744, 6),
(180746, 8767, 6),
(180746, 8788, 6),
(180747, 8768, 6),
(180748, 8769, 6),
(180793, 8803, 6);

-- Gift gameobjects
UPDATE `gameobject_template` SET `data3`=0 WHERE `entry` IN (180747,180748,180793);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES 
(151761, 180747, 0, -4919.58, -980.674, 501.46, 2.15958, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151762, 180747, 1, 1626.71, -4414.16, 15.8292, 2.2784, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151763, 180748, 1, 1625.77, -4413.86, 16.0883, 4.80049, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151764, 180748, 0, -4921.04, -981.624, 501.464, 1.81635, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151765, 180793, 0, -4916.73, -982.109, 501.884, 1.72839, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151766, 180793, 1, 1625.46, -4415.83, 15.4469, 2.11818, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151767, 180743, 0, -4915.83, -981.304, 501.759, 1.99149, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151768, 180743, 1, 1623.6, -4415.36, 15.1169, 0.75159, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151769, 180746, 0, -4915.18, -978.104, 501.451, 5.56505, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10),
(151770, 180746, 1, 1624.53, -4414.58, 15.9044, 1.30844, 0, 0, 0, 0, 300, 0, 1, 0, 0, 0, 10);

REPLACE INTO `game_event_gameobject` (`guid`, `event`) VALUES 
(151761, 21),
(151762, 21),
(151763, 21),
(151764, 21),
(151765, 21),
(151766, 21),
(151767, 21),
(151768, 21),
(151769, 21),
(151770, 21);

-- Mechanical Greench
UPDATE `creature_template` SET `subname`='', `minlevel`=58, `maxlevel`=58, `mindmg`=80, `maxdmg`=100 WHERE `entry`=15721;

-- Green Helper
DELETE FROM `spell_scripts` WHERE `id`=26532;
REPLACE INTO `spell_scripts` (`id`, `command`, `datalong`, `comments`) VALUES (26532, 15, 26533, 'Summon Green Helper');

-- Red Helper
UPDATE `creature_template` SET `subname`='' WHERE `entry`=15705;
DELETE FROM `spell_scripts` WHERE `id`=26541;
REPLACE INTO `spell_scripts` (`id`, `command`, `datalong`, `comments`) VALUES (26541, 15, 26536, 'Summon Red Helper');

-- Snowman
UPDATE `creature_template` SET `subname`='', `spell1`=23973, `ScriptName`='generic_spell_ai' WHERE  `entry`=15710;
DELETE FROM `spell_scripts` WHERE `id`=26469;
REPLACE INTO `spell_scripts` (`id`, `command`, `datalong`, `comments`) VALUES (26469, 15, 26045, 'Summon Snowman');

-- Reindeer
UPDATE `creature_template` SET `subname`='' WHERE `entry`=15710;
DELETE FROM `spell_scripts` WHERE `id`=26528;
REPLACE INTO `spell_scripts` (`id`, `command`, `datalong`, `comments`) VALUES (26528, 15, 26529, 'Summon Reindeer');

-- Quest completion letters and gifts
UPDATE `quest_template` SET `RewMailTemplateId`=122, `RewMailDelaySecs`=172800 WHERE `entry`=8746;
UPDATE `quest_template` SET `RewMailTemplateId`=161, `RewMailDelaySecs`=172800 WHERE `entry`=8762;
UPDATE `quest_template` SET `RewMailTemplateId`=102, `RewMailDelaySecs`=86400 WHERE `entry`=7025;
UPDATE `quest_template` SET `RewMailTemplateId`=108, `RewMailDelaySecs`=86400 WHERE `entry`=6984;
UPDATE `quest_template` SET `RewMailTemplateId`=117, `RewMailDelaySecs`=86400 WHERE `entry`=7045;
UPDATE `quest_template` SET `RequiredRaces`=178, `RewMailTemplateId`=118, `RewMailDelaySecs`=86400 WHERE `entry`=6962;
REPLACE INTO `mail_loot_template` (`entry`, `item`) VALUES (102, 17685),(118, 17685),(122,21216),(161,21216),(108,17712),(117,17712);

-- Metzen the Reindeer
DELETE FROM `pool_template` WHERE `entry`=10002;
DELETE FROM `pool_creature` WHERE `pool_entry`=10002;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(151750, 180719, 1, -8089.22, -5275.14, 1.23688, 1.75167, 0, 0, 0.768079, 0.640355, 300, 0, 1),
(151751, 180742, 0, -6606.33, -1860.82, 244.459, 6.27864, 0, 0, 0.00227228, -0.999997, 300, 0, 1),
(151752, 180742, 0, -6606.36, -1857.85, 244.382, 6.2433, 0, 0, 0.0199423, -0.999801, 300, 0, 1),
(151753, 180742, 0, -6609.29, -1854.76, 244.234, 1.58196, 0, 0, 0.711042, 0.703149, 300, 0, 1),
(151754, 180742, 0, -6606.33, -1854.91, 244.308, 1.55211, 0, 0, 0.700471, 0.713681, 300, 0, 1),
(151755, 180742, 0, -6612.22, -1854.84, 244.179, 3.15825, 0, 0, 0.999965, -0.00832624, 300, 0, 1),
(151756, 180742, 0, -6612.16, -1857.78, 244.212, 3.15432, 0, 0, 0.99998, -0.00636482, 300, 0, 1),
(151757, 180742, 0, -6612.09, -1860.72, 244.247, 4.69763, 0, 0, 0.712307, -0.701868, 300, 0, 1),
(151758, 180742, 0, -6609.11, -1860.79, 244.347, 4.73297, 0, 0, 0.699791, -0.714347, 300, 0, 1);
REPLACE INTO `game_event_gameobject` (`guid`, `event`) VALUES 
(151750, 2),(151751, 2),(151752, 2),(151753, 2),(151754, 2),
(151755, 2),(151756, 2),(151757, 2),(151758, 2);

-- Metzen gossip and quest completion
UPDATE `creature_template` SET `gossip_menu_id`=6763 WHERE `entry`=15664;
UPDATE `creature` SET `spawntimesecs`=60 WHERE id = 15664;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (58, 2, 21211, 1);

REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) 
VALUES (6763, 0, 0, 'Sprinkle some of the reindeer dust onto Metzen.', 1, 1, 6761, 0, 6763, 0, 0, '', 58);

DELETE FROM `gossip_menu` WHERE `entry`=6761;
DELETE FROM `gossip_menu` WHERE `entry`=6763;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6761, 8077, 0);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6763, 8076, 0);

DELETE FROM `gossip_scripts` WHERE `id`=6763;
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
(6763, 0, 15, 25952, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Metzen - Use visual effect'),
(6763, 8, 8, 15664, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Metzen - Credit for quest'),
(6763, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Metzen - Despawn');

UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `entry` in (8746,8762);

-- Snowball
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES 
(21167, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, 'Snowball Knockdown allow selfcast'),
(21167, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, 'Snowball Knockdown allow selfcast');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
