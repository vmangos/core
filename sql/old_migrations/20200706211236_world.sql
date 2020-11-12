DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200706211236');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200706211236');
-- Add your query below.


-- Delgren the Purifier - No XP on kill, no loot, 10 seconds respawn.
UPDATE `creature_template` SET `flags_extra` = 2 + 64 + 524288, `loot_id`=0 WHERE `entry`=3663;
UPDATE `creature` SET `spawntimesecsmin`=10, `spawntimesecsmax`=10 WHERE `id`=3663;
DELETE FROM `creature_loot_template` WHERE `entry`=3663;

-- Feero Ironhand - No XP on kill, 10 seconds respawn.
UPDATE `creature_template` SET `flags_extra` = 64 + 524288 + 1048576, `civilian`=0 WHERE `entry`=4484;
UPDATE `creature` SET `spawntimesecsmin`=10, `spawntimesecsmax`=10 WHERE `id`=4484;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
