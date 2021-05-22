DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210406002646');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210406002646');
-- Add your query below.

-- Both creatures have the exact same skinning loot table.
UPDATE `creature_template` SET `skinning_loot_id` = 4343 WHERE `entry` = 4342;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
