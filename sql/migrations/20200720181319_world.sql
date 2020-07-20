DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720181319');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720181319');
-- Add your query below.


-- Improved script for quest Mana Surges.
DELETE FROM `quest_start_scripts` WHERE `id`=1957;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2592, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1957, 0, 60, 3, 0, 0, 0, 0, 0, 0, 4, 0, 1957, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1957, 0, 4, 147, 3, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Remove Quest Giver Flag');

-- Waypoints for Tabetha when quest Mana Surges is started.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(1957, 1, -4035.85, -3384.24, 38.9959, 100, 0, 0, 0),
(1957, 2, -4037.6, -3381.32, 37.9133, 100, 0, 0, 0),
(1957, 3, -4037.38, -3378.67, 37.7076, 100, 0, 0, 0),
(1957, 4, -4033.77, -3376.26, 38.0439, 100, 0, 0, 0),
(1957, 5, -4027.12, -3377.37, 38.1654, 100, 0, 0, 0),
(1957, 6, -4020.59, -3382, 38.1995, 100, 6000, 0, 195701),
(1957, 7, -4026.94, -3377.41, 38.1672, 100, 0, 0, 0),
(1957, 8, -4034.27, -3376.6, 37.9825, 100, 0, 0, 0),
(1957, 9, -4038.45, -3380.05, 37.733, 100, 0, 0, 0),
(1957, 10, -4035.32, -3384.92, 38.9973, 100, 0, 0, 0),
(1957, 11, -4031.56, -3392.97, 38.9974, 2.1293, 1000, 0, 195702),
(1957, 12, -4031.56, -3392.97, 38.9974, 2.1293, 0, 0, 0);

-- Waypoint scripts for Tabetha.
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195701, 0, 15, 9097, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Cast Spell Create Rift');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195701, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Set Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195702, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Add Quest Giver Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195702, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Set Walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195702, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Move Idle');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
