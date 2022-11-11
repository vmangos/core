DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220804091054');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220804091054');
-- Add your query below.


-- Add missing Suicide aura to Compact Harvest Reaper.
UPDATE `creature_template` SET `auras`='8328' WHERE `entry`=2676;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
