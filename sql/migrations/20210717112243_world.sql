DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210717112243');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210717112243');
-- Add your query below.


-- Scourge Invasion ends after 3 weeks (21 days = 30240 minutes).
UPDATE `game_event` SET `length`='30240' WHERE `entry` in (17,81,90,91,92,93,94,95,96,97,98,99,129,130);

-- Make all events end on 31. december.
UPDATE `game_event` SET `end_time`='2030-12-31 23:59:59' WHERE `entry` in (17,81,90,91,92,93,94,95,96,97,98,99,129,130);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
