DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200504144725');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200504144725');
-- Add your query below.


-- Alowicious Czervik correct location
UPDATE `creature` SET `position_x` = 1627.81, `position_y` = -4413.17, `position_z` = 15.7001, `orientation` = 4.13643 WHERE `guid` = 86237;

-- correct scale for Rumstag Proudstrider
UPDATE `creature_template` SET `scale` = 1.35 WHERE `entry` = 14728;

-- Noarm correct location
UPDATE `creature` SET `position_x` = -8804.547582, `position_y` = 337.790001, `position_z` = 95.097664, `orientation` = 1.521965, `wander_distance` = 1, `movement_type` = 1 WHERE `guid` = 79781;

-- allow Umpi to roam
UPDATE `creature` SET `wander_distance` = 1.5, `movement_type` = 1 WHERE `guid` = 16051;

-- allow dannie fizzwizzle to roam
UPDATE `creature` SET `wander_distance` = 1.3, `movement_type` = 1 WHERE `guid` = 217;

-- remove felhunter from forlorn cavern
DELETE FROM `creature` WHERE `guid` = 86190;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
