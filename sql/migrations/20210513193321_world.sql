DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210513193321');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210513193321');
-- Add your query below.

-- Fix damage and armor of starting mobs.
UPDATE `creature_template` SET `dmg_min` = 1, `dmg_max` = 2, `armor` = 16 WHERE `entry` IN (6, 707, 1512, 2955, 3098);
UPDATE `creature_template` SET `dmg_min` = 1, `dmg_max` = 2, `armor` = 15 WHERE `entry` = 1501;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
