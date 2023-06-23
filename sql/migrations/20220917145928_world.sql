DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220917145928');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220917145928');
-- Add your query below.


-- Waypoint mob should be normal so you can see its level.
UPDATE `creature_template` SET `rank`=0, `type_flags`=0 WHERE `entry` IN (1,2);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
