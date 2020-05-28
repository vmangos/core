DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200528192148');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200528192148');
-- Add your query below.

-- Fix Reginald's horse faction
UPDATE `creature_template` SET `faction` = 534 WHERE `entry` = 12581;

-- Fix equip template of spawned Onyxia guards
UPDATE `creature_equip_template` SET `equipentry1` = 1899, `equipentry2` = 143 WHERE `entry` = 12739;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
