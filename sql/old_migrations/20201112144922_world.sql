DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201112144922');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201112144922');
-- Add your query below.


-- add  Korra waypoints and scripts
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 32347;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(3888, 1, 2768.44, -411.098, 111.463, 1.62316, 480000, 0, 388803),
(3888, 2, 2768.44, -411.098, 111.463, 100, 2000, 0, 388801),
(3888, 3, 2766.91, -407.248, 111.471, 100, 6000, 0, 388802),
(3888, 4, 2763.06, -402.483, 111.482, 100, 0, 0, 0),
(3888, 5, 2763.35, -399.281, 111.479, 100, 0, 0, 0),
(3888, 6, 2762.86, -396.496, 111.235, 100, 10000, 0, 0),
(3888, 7, 2756.46, -418.976, 111.475, 100, 0, 0, 0),
(3888, 8, 2754.08, -425.621, 111.475, 100, 0, 0, 0),
(3888, 9, 2748.49, -435.343, 111.474, 100, 0, 0, 0),
(3888, 10, 2736.83, -432.064, 111.874, 100, 189000, 0, 388803),
(3888, 11, 2736.83, -432.064, 111.874, 100, 2000, 0, 388801),
(3888, 12, 2743.72, -433.638, 111.458, 100, 0, 0, 0),
(3888, 13, 2751.9, -428.987, 111.474, 100, 0, 0, 0),
(3888, 14, 2759.19, -415.571, 111.48, 100, 0, 0, 0),
(3888, 15, 2768.07, -415.291, 111.459, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (388801, 0, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Korra - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (388802, 2, 0, 2, 0, 0, 0, 0, 0, 0, 4, 1296, 0, 0, 0, 0, 0, 0, 0, 0, 'Korra - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (388803, 2, 28, 3, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Korra - Set Stand State');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
