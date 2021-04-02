DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210402210056');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210402210056');
-- Add your query below.

-- Thulbek was not spawned in Grom'gol until Patch 1.7.
-- https://web.archive.org/web/20041115164537/http://wow.allakhazam.com/db/mob.html?wmob=5814
UPDATE `creature` set `patch_min` = 5 WHERE `id` = 5814;
UPDATE `creature_template` SET `patch` = 5 WHERE `entry` = 5814 AND `patch` = 0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
