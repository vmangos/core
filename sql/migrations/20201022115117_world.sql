DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201022115117');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201022115117');
-- Add your query below.


-- Waypoints for Innkeeper Thulfram.
UPDATE `creature` SET `movement_type`=2, `position_x`=394.657013, `position_y`=-2097.139893, `position_z`=131.561996 WHERE `guid`=92923;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(92923, 1, 394.657013, -2097.139893, 131.561996, 100.000000, 0, 0.000000, 0),
(92923, 2, 399.725006, -2119.739990, 131.563995, 100.000000, 0, 0.000000, 0),
(92923, 3, 396.190002, -2103.780029, 131.561996, 100.000000, 0, 0.000000, 0),
(92923, 4, 394.209015, -2095.250000, 131.561996, 100.000000, 0, 0.000000, 0),
(92923, 5, 390.916992, -2081.429932, 131.561996, 100.000000, 0, 0.000000, 0),
(92923, 6, 391.851990, -2085.350098, 131.563004, 100.000000, 0, 0.000000, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
