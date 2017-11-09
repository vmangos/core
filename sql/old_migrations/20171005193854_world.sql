DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171005193854');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171005193854');
-- Add your query below.


-- ZG High Priest shared loot table
DELETE FROM `reference_loot_template` WHERE `groupid`=2 AND `item` IN (22711,22712,22713,22714,22715,22716,22718,22720,22721,22722);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `groupid`, `mincountOrRef`, `condition_id`) VALUES (14507, 330068, 3, -330068, 0);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `groupid`, `mincountOrRef`, `condition_id`) VALUES (14515, 330068, 3, -330068, 0);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `groupid`, `mincountOrRef`, `condition_id`) VALUES (14509, 330068, 3, -330068, 0);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `groupid`, `mincountOrRef`, `condition_id`) VALUES (14510, 330068, 3, -330068, 0);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `groupid`, `mincountOrRef`, `condition_id`) VALUES (14517, 330068, 3, -330068, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22711, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22712, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22713, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22714, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22715, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22716, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22718, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22720, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22721, 0, 3, 1, 1, 0);
REPLACE INTO `reference_loot_template` VALUES (330068, 22722, 0, 3, 1, 1, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
