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
UPDATE `creature` SET `position_x` = 1627.165, `position_y` = -4412.519, `position_z` = 15.453, `orientation` = 4.771000 WHERE `guid` = 86237;

-- Opus correct location
UPDATE `creature` SET `position_x` = -7468.840820, `position_y` = -2186.785156, `position_z` = 164.418686, `orientation` = 2.294904, `movement_type` = 0, `wander_distance` = 0 WHERE `guid` = 4567;

-- correct scale for Rumstag Proudstrider
UPDATE `creature_template` SET `scale` = 1.35 WHERE `entry` = 14728;

-- Noarm correct location
UPDATE `creature` SET `position_x` = -8804.547582, `position_y` = 337.790001, `position_z` = 95.097664, `orientation` = 1.521965, `wander_distance` = 1, `movement_type` = 1 WHERE `guid` = 79781;

-- allow Umpi to roam
UPDATE `creature` SET `wander_distance` = 1.5, `movement_type` = 1 WHERE `guid` = 16051;

-- allow dannie fizzwizzle to roam
UPDATE `creature` SET `wander_distance` = 1.3, `movement_type` = 1 WHERE `guid` = 217;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
