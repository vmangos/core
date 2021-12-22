DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211115162219');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211115162219');
-- Add your query below.


-- Quests 5092 and 5096 Dont Require Breadcrumb Quests to Unlock
UPDATE `quest_template` SET `NextQuestId` = 0 WHERE `entry` IN (5066, 5090, 5091, 5093, 5094, 5095);

-- -----------------------------------------------------------------------------------------

-- Quest 1275 Does Not Require Breadcrumb Quest 3765
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1275;

-- -----------------------------------------------------------------------------------------

-- Quest 2922 Does Not Require Breadcrumb Quest 2923
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2922;

-- -----------------------------------------------------------------------------------------

-- Quest 353 Does Not Require Breadcrumb Quest 1097
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 353;

-- -----------------------------------------------------------------------------------------

-- Quest 4764 Does Not Require Breadcrumb Quest 4766
UPDATE `quest_template` SET `PrevQuestId`= 0 WHERE `entry` = 4764;

-- -----------------------------------------------------------------------------------------

-- Quest 1204 Does Not Require Breadcrumb Quest 1260
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1204;

-- -----------------------------------------------------------------------------------------

-- Quest 1395 Does Not Require Breadcrumb Quest 1477
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1395;

-- -----------------------------------------------------------------------------------------

-- Quest 738 Does Not Require Breadcrumb Quest 707
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 738;

-- -----------------------------------------------------------------------------------------

-- Quest 2240 Does Not Require Breadcrumb Quest 2398
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2240;

-- -----------------------------------------------------------------------------------------

-- Quest 466 Does Not Require Breadcrumb Quest 467
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 466;

-- -----------------------------------------------------------------------------------------

-- Quest 2518 Does Not Require Breadcrumb Quest 2519
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2518;

-- -----------------------------------------------------------------------------------------

-- Quest 4134 Does Not Require Breadcrumb Quest 4133
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 4134;

-- -----------------------------------------------------------------------------------------

-- Quest 4768 Does Not Require Breadcrumb Quest 4769
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 4768;

-- -----------------------------------------------------------------------------------------

-- Quest 518 Does Not Require Breadcrumb Quest 495
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 518;

-- -----------------------------------------------------------------------------------------

-- Quest 1131 Does Not Require Breadcrumb Quest 1130
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1131;

-- -----------------------------------------------------------------------------------------

-- Quest 1302 Does Not Require Breadcrumb Quest 1301 Also Quest 1301 Should Disable With Quests 1302 or 1282
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1302;
UPDATE `quest_template` SET `RequiredCondition` = 1303 WHERE `entry` = 1301;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1301, 22, 1302, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1302, 22, 1282, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1303, -2, 1301, 1302, 0, 0, 1);

-- -----------------------------------------------------------------------------------------

-- Quest 691 does not Require Breadcrumb Quest 690
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE  `entry` = 691;
UPDATE `quest_template` SET `RequiredCondition` = 790 WHERE `entry` = 690;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (790, 22, 691, 0, 0, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Quest 9223 Should be Repeatable
UPDATE `quest_template` SET `SpecialFlags` = 1 WHERE `entry` = 9223;

-- -----------------------------------------------------------------------------------------

-- Quest 4785 Should be Repeatable
UPDATE `quest_template` SET `SpecialFlags` = 1 WHERE `entry` = 4785;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 5041
UPDATE `quest_template` SET `PrevQuestId` = 871 WHERE `entry` = 5041;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 1130
UPDATE `quest_template` SET `PrevQuestId` = 882 WHERE `entry` = 1130;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 8469
UPDATE `quest_template` SET `PrevQuestId` = 8464 WHERE `entry` = 8469;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 4122
UPDATE `quest_template` SET `PrevQuestId` = 4082 WHERE `entry` = 4122;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 4962
UPDATE `quest_template` SET `PrevQuestId` = 1799 WHERE `entry` = 4962;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 4963
UPDATE `quest_template` SET `PrevQuestId` = 1799 WHERE `entry` = 4963;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 4493
UPDATE `quest_template` SET `PrevQuestId` = 4267 WHERE `entry` = 4493;

-- -----------------------------------------------------------------------------------------

-- Add Correct Prequest to 4494
UPDATE `quest_template` SET `PrevQuestId` = 7732 WHERE `entry` = 4494;

-- -----------------------------------------------------------------------------------------

-- Add Missing Questgiver
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(4485, 1361, 0, 10);

-- -----------------------------------------------------------------------------------------

-- Add Missing Questgiver
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(2092, 467, 0, 10);

-- -----------------------------------------------------------------------------------------

-- Add Missing Questgiver
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(415, 1097, 0, 10);

-- -----------------------------------------------------------------------------------------

-- Quests 103, 152, 104 are available to both factions
UPDATE `quest_template` SET `RequiredRaces` = 255 WHERE `entry` IN (103, 152, 104);

-- -----------------------------------------------------------------------------------------

-- Update New Frontier Quest Chains
UPDATE `quest_template` SET `NextQuestId` = 6761 WHERE  `entry` IN (1015, 1019, 1047);
UPDATE `quest_template` SET `OfferRewardText`='Greetings, $C.$b$bI am pleased to see the likes of you taking an interest in the well being of nature; tales of your mighty deeds precede you, and you are welcomed here. Seeing you before me instills the feeling of confidence that the Cenarion Circle will get the proper aid it needs.$b$bOur connection with the Cenarion Circle in Moonglade transcends racial and political divides. Remember this as you work on behalf of the Circle, and you will do well.' WHERE  `entry`=1004;
UPDATE `quest_template` SET `NextQuestId` = 1123 WHERE `entry` IN (1000, 1004, 1018);

-- -----------------------------------------------------------------------------------------

-- Correct Sunken Temple Quest Chain
UPDATE `quest_template` SET `NextQuestId` = 0 WHERE `entry` = 3446;
UPDATE `quest_template` SET `PrevQuestId` = 3444 WHERE `entry` = 3447;
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_max`)
VALUES (7771, 3447, 10);
DELETE FROM `gameobject_questrelation` WHERE  `id` = 148836 AND `quest` = 3447;
UPDATE `quest_template` SET `StartScript` = 0 WHERE `entry` = 3447;

-- -----------------------------------------------------------------------------------------

-- Quest 6383 Does Not Require Breadcrumb Quests
UPDATE `quest_template` SET `NextQuestId` = 0, `NextQuestInChain` = 6383 WHERE `entry` IN (235, 742, 6382);

-- -----------------------------------------------------------------------------------------

-- Remove Incorrect Questgivers
DELETE FROM `creature_questrelation` WHERE `id` IN (10857, 11536) AND `quest` = 5524;
DELETE FROM `creature_involvedrelation` WHERE  `id` IN (10857, 11536) AND `quest` = 5524;

-- Add Quest 5521 to 10857
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(10857, 5521, 1, 10);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(10857, 5521, 1, 10);

-- Add Quest 5517 to 11536
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11536, 5517, 1, 10);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11536, 5517, 1, 10);

-- -----------------------------------------------------------------------------------------

-- Quest Chain Should be Available to all Horde Races
UPDATE `quest_template` SET `RequiredRaces` = 178 WHERE `entry` IN (367, 368, 369);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
