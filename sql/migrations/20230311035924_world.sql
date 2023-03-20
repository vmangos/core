DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230311035924');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230311035924');
-- Add your query below.


-- Add enslave immunity to several demons.
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry` IN (7461, 7462, 7463, 7665, 7666, 7667, 7728, 8318, 8717, 8718, 9516, 10201, 10813, 11490, 11492, 12236, 12396, 14101, 14354, 15467);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
