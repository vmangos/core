DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240617091747');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240617091747');
-- Add your query below.


-- Add skinning loot to Longsnout.
-- https://www.wowhead.com/classic/npc=119/longsnout#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (119, 2934, 60, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (119, 2318, 40, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=119 WHERE `entry`=119;

-- Add skinning loot to Hematus.
-- https://www.wowhead.com/classic/npc=2759/hematus#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2759, 8170, 77, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2759, 4304, 15, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2759, 8171, 8, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=2759 WHERE `entry`=2759;

-- Add skinning loot to Phantim.
-- https://www.wowhead.com/classic/npc=5314/phantim#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5314, 8170, 70, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5314, 8165, 10, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5314, 15412, 10, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5314, 4304, 9, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5314, 8171, 1, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=5314 WHERE `entry`=5314;

-- Add skinning loot to Deviate Moccasin.
-- https://www.wowhead.com/classic/npc=5762/deviate-moccasin#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5762, 2318, 55, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5762, 2319, 26, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5762, 6470, 7, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5762, 783, 7, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5762, 4232, 3, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5762, 6471, 2, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=5762 WHERE `entry`=5762;

-- Add skinning loot to Captured Sprite Darter.
-- https://www.wowhead.com/classic/npc=7997/captured-sprite-darter#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7997, 4234, 44, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7997, 4304, 44, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7997, 8169, 6, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7997, 4235, 3, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (7997, 8165, 3, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=7997 WHERE `entry`=7997;

-- Add skinning loot to Sul'lithuz Broodling.
-- https://www.wowhead.com/classic/npc=8138/sullithuz-broodling#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8138, 4234, 70, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8138, 4304, 25, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8138, 4235, 5, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=8138 WHERE `entry`=8138;

-- Add skinning loot to Deep Stinger.
-- https://www.wowhead.com/classic/npc=8926/deep-stinger#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8926, 4304, 46, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8926, 8154, 40, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8926, 8170, 11, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8926, 8169, 3, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=8926 WHERE `entry`=8926;

-- Add skinning loot to Dark Screecher.
-- https://www.wowhead.com/classic/npc=8927/dark-screecher#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8927, 4304, 70, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8927, 8170, 25, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8927, 8169, 5, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=8927 WHERE `entry`=8927;

-- Add skinning loot to Burrowing Thundersnout.
-- https://www.wowhead.com/classic/npc=8928/burrowing-thundersnout#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8928, 4304, 70, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8928, 8170, 25, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (8928, 8169, 5, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=8928 WHERE `entry`=8928;

-- Add skinning loot to Spire Scorpid.
-- https://www.wowhead.com/classic/npc=9701/spire-scorpid#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9701, 8170, 45, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9701, 15408, 40, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9701, 4304, 10, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (9701, 8169, 5, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=9701 WHERE `entry`=9701;

-- Add skinning loot to Rookery Guardian.
-- https://www.wowhead.com/classic/npc=10258/rookery-guardian#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10258, 8170, 55, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10258, 15416, 25, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10258, 8165, 10, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10258, 8171, 5, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10258, 4304, 5, 1, 1, 2, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=10258 WHERE `entry`=10258;

-- Add skinning loot to Rookery Hatcher.
-- https://www.wowhead.com/classic/npc=10683/rookery-hatcher#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10683, 8170, 55, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10683, 15416, 25, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10683, 8165, 10, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10683, 8171, 5, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10683, 4304, 5, 1, 1, 2, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=10683 WHERE `entry`=10683;

-- Add skinning loot to Frostwolf.
-- https://www.wowhead.com/classic/npc=10981/frostwolf#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10981, 4304, 72, 1, 1, 1, 0, 3, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10981, 8170, 20, 1, 1, 1, 0, 3, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10981, 8169, 5, 1, 1, 1, 0, 3, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10981, 8368, 3, 1, 1, 1, 0, 3, 10);
UPDATE `creature_template` SET `skinning_loot_id`=10981 WHERE `entry`=10981;

-- Add skinning loot to Son of Hakkar.
-- https://www.wowhead.com/classic/npc=11357/son-of-hakkar#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11357, 8170, 80, 1, 1, 2, 0, 5, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11357, 4304, 15, 1, 1, 2, 0, 5, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11357, 8171, 5, 1, 1, 1, 0, 5, 10);
UPDATE `creature_template` SET `skinning_loot_id`=11357 WHERE `entry`=11357;

-- Add skinning loot to Nefarian.
-- https://www.wowhead.com/classic/npc=11583/nefarian#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (11583, 15416, 100, 0, 5, 8, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=11583 WHERE `entry`=11583;

-- Add skinning loot to Dreamtracker.
-- https://www.wowhead.com/classic/npc=12496/dreamtracker#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12496, 8170, 60, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12496, 15412, 20, 1, 1, 1, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12496, 4304, 10, 1, 1, 2, 0, 0, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (12496, 8165, 10, 1, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `skinning_loot_id`=12496 WHERE `entry`=12496;

-- Add skinning loot to Frostwolf Bloodhound.
-- https://www.wowhead.com/classic/npc=14282/frostwolf-bloodhound#skinning
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14282, 8170, 50, 1, 1, 1, 0, 3, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14282, 4304, 40, 1, 1, 1, 0, 3, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14282, 8368, 5, 1, 1, 1, 0, 3, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14282, 8171, 3, 1, 1, 1, 0, 3, 10);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (14282, 8169, 2, 1, 1, 1, 0, 3, 10);
UPDATE `creature_template` SET `skinning_loot_id`=14282 WHERE `entry`=14282;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
