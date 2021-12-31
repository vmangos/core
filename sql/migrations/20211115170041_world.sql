DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211115170041');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211115170041');
-- Add your query below.


-- Update Warlock Quest Chains
-- Quest 4964 Requires 4976 AND 4962
UPDATE `quest_template` SET `RequiredCondition`='537' WHERE  `entry`=4964 AND `patch`=0;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (535, 8, 4976, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (536, 8, 4962, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (537, -1, 535, 536, 0, 0, 0);

-- Quest 4975 Requires 4976 AND 4963
UPDATE `quest_template` SET `RequiredCondition`='539' WHERE  `entry`=4975 AND `patch`=0;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (538, 8, 4963, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (539, -1, 535, 538, 0, 0, 0);

-- Alliance
-- Quest 1715 Should be a Breadcrumb Quest
UPDATE `quest_template` SET `NextQuestInChain` = 1688 WHERE `entry` = 1715;

-- Quest 1758 Should Not Require Breadcrumb Quest 1798
UPDATE `quest_template` SET `NextQuestInChain` = 1758 WHERE `entry` = 1798;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1758;

-- Horde
-- Quests 1478 and 1506 Should be Breadcrumb Quests and Be Exclusive
UPDATE `quest_template` SET `NextQuestId` = 0, `NextQuestInChain` = 0, `RequiredCondition` = 1480 WHERE `entry` = 1478;
UPDATE `quest_template` SET `NextQuestId` = 0, `ExclusiveGroup` = 1478, `NextQuestInChain` = 0, `RequiredCondition` = 1480 WHERE `entry` = 1506;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1478, 22, 1473, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1479, 22, 1501, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1480, -2, 1478, 1479, 0, 0, 1);

-- Quests 1473 and 1501 Should be Exclusive
UPDATE `quest_template` SET `ExclusiveGroup` = 1473 WHERE `entry` IN (1473, 1501);

-- Quest 1801 Does Not Require Breadcrumb Quest
UPDATE `quest_template` SET `NextQuestInChain` = 1801 WHERE `entry` IN (2996, 3001);

-- Correct Race Requirement
UPDATE `quest_template` SET `RequiredRaces` = 178 WHERE `entry` = 4737;
UPDATE `quest_template` SET `RequiredRaces` = 77 WHERE `entry` = 4736;

-- Quest 1799 Requires Prequest
UPDATE `quest_template` SET `NextQuestId` = 1799 WHERE `entry` IN (4965, 4967, 4968, 4969);

-- Correct Orientation
UPDATE `creature` SET `orientation` = 4.43314 WHERE `guid` = 41833;

-- -----------------------------------------------------------------------------------------

-- Update Mage Quest Chains
-- Alliance
-- Quest 1920 Should not Require Pre Quest
UPDATE `quest_template` SET `PrevQuestId`= 0 WHERE `entry` = 1920;

-- Quests 1860 and 1879 Should be Breadcrumb Quests and Be Exclusive
UPDATE `quest_template` SET `NextQuestInChain` = 0, `RequiredCondition` = 1862 WHERE `entry` IN (1860, 1879);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1860, 22, 1861, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1861, 22, 1880, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1862, -2, 1860, 1861, 0, 0, 1);

-- Quests 1861 and 1880 Should be Exclusive
UPDATE `quest_template` SET `PrevQuestId` = 0, `ExclusiveGroup` = 1861 WHERE `entry` IN (1861, 1880);

-- Horde
-- Quests 1883 and 1881 Should be Breadcrumb Quests and Be Exclusive
UPDATE `quest_template` SET `NextQuestInChain` = 0, `RequiredCondition` = 1883 WHERE `entry` IN (1881, 1883);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1881, 22, 1884, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1882, 22, 1882, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1883, -2, 1881, 1882, 0, 0, 1);

-- Quests 1884 and 1882 Should be Exclusive
UPDATE `quest_template` SET `PrevQuestId` = 0, `ExclusiveGroup` = 1882 WHERE `entry` IN (1884, 1882);

-- Quest 1960 Should not Require Pre Quest
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1960;

-- Quest 1944 Should not Require Pre Quest
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1944;

-- -----------------------------------------------------------------------------------------

-- Update Priest Quest Chains
-- Garment Quests Should not Require a Pre Quest
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` IN (5650, 5648, 5624, 5625, 5621);

-- Update Race Requirement
UPDATE `quest_template` SET `RequiredRaces` = 16 WHERE `entry`= 5650;
UPDATE `quest_template` SET `RequiredRaces` = 128 WHERE `entry`= 5648;
UPDATE `quest_template` SET `RequiredRaces` = 1 WHERE `entry` = 5624;
UPDATE `quest_template` SET `RequiredRaces` = 4 WHERE `entry` = 5625;
UPDATE `quest_template` SET `RequiredRaces` = 8 WHERE `entry` = 5621;

-- Add Missing Quest Start NPC
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`)
VALUES (3044, 5656, 0, 10);

-- Add Missing Quest Start NPC
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`)
VALUES (11407, 5655, 0, 10);

-- Add Missing Quest Start NPC
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`)
VALUES (11407, 5661, 0, 10);

-- Add Missing Quest Start NPC
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`)
VALUES (3600, 5674, 0, 10);

-- -----------------------------------------------------------------------------------------

-- Update Warrior Quest Chains
-- Alliance
-- Quests 1638, 1684 and 1679 Should be Breadcrumb Quests
UPDATE `quest_template` SET `NextQuestInChain` = 0, `RequiredCondition` = 1653 WHERE `entry` IN (1638, 1684, 1679);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1650, 22, 1639, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1651, 22, 1683, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1652, 22, 1678, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1653, -2, 1650, 1651, 1652, 0, 1);

-- Quests 1639, 1683 and 1678 Should be Exclusive
UPDATE `quest_template` SET `PrevQuestId` = 0, `ExclusiveGroup` = 1639 WHERE `entry` IN (1639, 1683, 1678);

-- Add Missing Quest Start NPC
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`)
VALUES (7315, 8417, 6, 10);

-- Horde
-- Quests 1505 and 1818 Should be Breadcrumb Quests
UPDATE `quest_template` SET `NextQuestInChain` = 0, `RequiredCondition` = 1507 WHERE `entry` IN (1505, 1818);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1505, 22, 1498, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1506, 22, 1819, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1507, -2, 1505, 1506, 0, 0, 1);

-- Quests 1498 and 1819 Should be Exclusive
UPDATE `quest_template` SET `PrevQuestId` = 0, `ExclusiveGroup` = 1498 WHERE `entry` IN (1498, 1819);

-- -----------------------------------------------------------------------------------------

-- Update Shaman Quest Chains
-- Quests 1516 and 1519 Should be Exclusive
UPDATE `quest_template` SET `ExclusiveGroup` = 1516 WHERE `entry` IN (1516, 1519);

-- -----------------------------------------------------------------------------------------

-- Update Roque Quest Chains
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` IN (2300, 2298, 2299, 2260, 2259);
UPDATE `quest_template` SET `NextQuestInChain` = 2281 WHERE `entry` IN (2298, 2260);
UPDATE `quest_template` SET `ExclusiveGroup` = 2259 WHERE `entry` IN (2259, 2299);
UPDATE `quest_template` SET `ExclusiveGroup`= 2260  WHERE `entry` IN (2260, 2298, 2300);
UPDATE `quest_template` SET `PrevQuestId` = 2205 WHERE `entry`=2206;
UPDATE `quest_template` SET `NextQuestId` = 2238 WHERE `entry`=2218;

-- -----------------------------------------------------------------------------------------

-- Update Paladin Quest Chains
-- Epic Mount Quest Chain
UPDATE `quest_template` SET `PrevQuestId`= 0, `RequiredCondition` = 7643 WHERE `entry` = 7641;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7641, 8, 7638, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7642, 8, 7670, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7643, -2, 7641, 7642, 0, 0, 0);

UPDATE `quest_template` SET `NextQuestId` = 0 WHERE `entry` = 7640;
UPDATE `quest_template` SET `NextQuestId` = 7648 WHERE `entry` = 7642;

UPDATE `quest_template` SET `PrevQuestId` = 0, `RequiredCondition` = 7647 WHERE `entry` = 7643;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7645, 8, 7648, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7646, 8, 7640, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7647, -1, 7645, 7646, 0, 0, 0);

INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RequiredCondition`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewXP`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `RewMailMoney`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES
(7670, 2, 2, -141, 60, 0, 60, 0, 2, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7637, 7638, 0, 0, 0, 0, 'Lord Grayson Shadowbreaker', 'The time has come, $N, for you to learn about what it will take for you to acquire something you have no doubt waited on for some time... your charger.$B$BSpeak with Lord Grayson Shadowbreaker in Stormwind\'s Cathedral District.  It is he who will guide you not only though the legerdemain of a Paladin\'s most trusted mount, but the tasks before you to acquire one of your own.$B$BI wish you the best in this trial.  For the Light, noble $G brother : sister;!', 'Speak with Lord Grayson Shadowbreaker in Stormwind\'s Cathedral District.', 'I am glad to see you $N. I know that you have awaited word as to how to acquire your charger, and now that time has come.$B$BYou will be surely tested in many different ways, but most importantly in your willingness to rise above numerous obstacles thrust before you. These are not done as a learning exercise - your stature is beyond simple educational tests. You must save your future companion from the clutches of the evil you have spent your life fighting.$B$BTake heed, your time has come!', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 650, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 25, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(5149, 7670, 2, 10);

INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(928, 7670, 2, 10);

-- Add Correct Quest Requirement to Paladin Quest Chains
UPDATE `quest_template` SET `PrevQuestId` = 1654 WHERE `entry`= 1442 AND `patch`=0;
UPDATE `quest_template` SET `PrevQuestId` = 1654 WHERE `entry`= 1655 AND `patch`=0;

-- Corrections to Tome of Divinity (Dwarf) Quest
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1646;
UPDATE `quest_template` SET `SpecialFlags` = 1, `RequiredCondition` = 970 WHERE `entry` = 1645;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (970, 22, 1646, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 970 WHERE `entry` IN (2997, 2999, 3000);
DELETE FROM `conditions` WHERE `condition_entry` IN (164501, 164502, 164503, 164504);

-- Corrections to Tome of Divinity (Human) Quests
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1642;
UPDATE `quest_template` SET `SpecialFlags` = 1, `RequiredCondition` = 971 WHERE `entry` = 1641;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (971, 22, 1642, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 971 WHERE `entry` IN (2998, 3681);
DELETE FROM `conditions` WHERE `condition_entry` IN (164104, 164103, 164102, 164101);

-- Corrections to Tome of Valor Quests
UPDATE `quest_template` SET `SpecialFlags` = 1, `RequiredCondition` = 972 WHERE `entry` IN (1793, 1794);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (972, 22, 1649, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
