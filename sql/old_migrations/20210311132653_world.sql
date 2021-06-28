DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210311132653');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210311132653');
-- Add your query below.


-- Update Threshadon Fang drop locations and chances.
-- https://classic.wowhead.com/item=5516/threshadon-fang#dropped-by
DELETE FROM `reference_loot_template` WHERE `item`=5516;
DELETE FROM `creature_loot_template` WHERE `item`=5516;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(14357, 5516, 64, 0, 1, 1, 0, 0, 10),
(4827, 5516, 47, 0, 1, 1, 0, 0, 10),
(3476, 5516, 44, 0, 1, 1, 0, 0, 10),
(4389, 5516, 27, 0, 1, 1, 0, 0, 10),
(4390, 5516, 25, 0, 1, 1, 0, 0, 10),
(4388, 5516, 23, 0, 1, 1, 0, 0, 10),
(3641, 5516, 19, 0, 1, 1, 0, 0, 10),
(4830, 5516, 19, 0, 1, 1, 0, 0, 10),
(2187, 5516, 13, 0, 1, 1, 0, 0, 10),
(1224, 5516, 10, 0, 1, 1, 0, 0, 10),
(2188, 5516, 9, 0, 1, 1, 0, 0, 10),
(7273, 5516, 7, 0, 1, 1, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
