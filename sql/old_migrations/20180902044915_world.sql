DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180902044915');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180902044915');
-- Add your query below.


-- Correct speed for Rift Spawn from Trinity.
UPDATE `creature_template` SET `speed_walk`=0.7, `speed_run`=0.8 WHERE `entry`=6492;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
