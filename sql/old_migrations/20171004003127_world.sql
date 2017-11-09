DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171004003127');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171004003127');
-- Add your query below.

UPDATE `game_event` SET `start_time`='2015-03-30 04:00:00' WHERE `entry`=154;
UPDATE `game_event` SET `start_time`='2015-03-30 04:00:00' WHERE `entry`=158;
UPDATE `game_event` SET `start_time`='2015-03-30 04:00:00' WHERE `entry`=155;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
