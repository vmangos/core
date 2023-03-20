DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230104122509');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230104122509');
-- Add your query below.


-- Extend end time of some events.
UPDATE `game_event` SET `end_time`='2030-12-31 00:00:00' WHERE `entry`=47;
UPDATE `game_event` SET `end_time`='2030-12-31 12:00:00' WHERE `entry`=48;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
