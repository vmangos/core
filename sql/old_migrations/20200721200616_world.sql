DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200721200616');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200721200616');
-- Add your query below.


-- add waypoints and scripts to nancy vishas
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 17090;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(3984, 1, 888.142, -121.85, 38.3887, 100, 22000, 0, 398401),
(3984, 2, 891.274, -115.355, 38.3916, 100, 0, 0, 0),
(3984, 3, 893.52, -112.311, 37.1383, 100, 0, 0, 0),
(3984, 4, 897.72, -106.644, 35.4023, 100, 0, 0, 0),
(3984, 5, 902.433, -100.602, 33.7449, 100, 0, 0, 0),
(3984, 6, 906.811, -94.4563, 33.778, 100, 0, 0, 0),
(3984, 7, 909.417, -90.5137, 33.7852, 100, 120000, 0, 0),
(3984, 8, 909.417, -90.5137, 33.7852, 100, 4000, 0, 398402),
(3984, 9, 904.51, -97.8801, 33.7682, 100, 0, 0, 0),
(3984, 10, 900.044, -104.055, 34.5619, 100, 0, 0, 0),
(3984, 11, 895.075, -110.145, 36.4831, 100, 0, 0, 0),
(3984, 12, 891.818, -114.431, 38.3399, 100, 0, 0, 0),
(3984, 13, 888.142, -121.85, 38.3887, 1.0821, 480000, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398401, 0, 35, 0, 0, 0, 0, 16879, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nancy Vishas - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398401, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1365, 0, 0, 0, 0, 0, 0, 0, 0, 'Nancy Vishas - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398401, 6, 0, 0, 0, 0, 0, 16879, 0, 9, 2, 1366, 0, 0, 0, 0, 0, 0, 0, 0, 'Grandpa Vishas - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398401, 11, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1367, 0, 0, 0, 0, 0, 0, 0, 0, 'Nancy Vishas - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398401, 16, 0, 0, 0, 0, 0, 16879, 0, 9, 2, 1368, 0, 0, 0, 0, 0, 0, 0, 0, 'Grandpa Vishas - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398401, 16, 1, 11, 0, 0, 0, 16879, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grandpa Vishas - Emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398401, 21, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1369, 0, 0, 0, 0, 0, 0, 0, 0, 'Nancy Vishas - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398402, 0, 0, 2, 0, 0, 0, 0, 0, 0, 4, 1370, 0, 0, 0, 0, 0, 0, 0, 0, 'Nancy Vishas - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398402, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1371, 0, 0, 0, 0, 0, 0, 0, 0, 'Nancy Vishas - Talk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
