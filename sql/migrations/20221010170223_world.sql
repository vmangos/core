DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221010170223');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221010170223');
-- Add your query below.


-- Add skinning loot to Ishamuhale.
UPDATE `creature_template` SET `skinning_loot_id`=3257 WHERE `entry`=3257;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(3257, 2318, 73, 1, 1, 2, 0, 0, 10),
(3257, 2319, 25, 1, 1, 1, 0, 0, 10),
(3257, 783, 2, 1, 1, 1, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
