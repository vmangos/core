DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221222151839');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221222151839');
-- Add your query below.


-- This text should be yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6162;

-- Add on use script to service gate.
DELETE FROM `gameobject_scripts` WHERE `id`=6851;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(6851, 0, 0, 20, 2, 0, 0, 0, 10435, 50, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Service Entrance Gate - Start Waypoints on Magistrate Barthilas');
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry`=175368;

-- Waypoints for Magistrate Barthilas.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(10435, 1, 3663.232178, -3619.138428, 137.983627, 100.000000, 0, 0.000000, 1043501),
(10435, 2, 3678.493652, -3608.529785, 137.679916, 100.000000, 0, 0.000000, 0),
(10435, 3, 3700.299561, -3604.127441, 139.540878, 100.000000, 0, 0.000000, 0),
(10435, 4, 3723.080000, -3600.480000, 142.357000, 100.000000, 3000, 0.000000, 1043504),
(10435, 5, 4068.739990, -3535.969971, 122.824997, 2.47836800, 0, 0.000000, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=1043501;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1043501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6162, 0, 0, 0, 0, 0, 0, 0, 0, 'Magistrate Barthilas - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=1043504;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1043504, 1, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magistrate Barthilas - Move Idle'),
(1043504, 1, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4068.74, -3535.97, 122.825, 2.478368, 0, 'Magistrate Barthilas - Set Home Position'),
(1043504, 1, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4068.74, -3535.97, 122.825, 2.478368, 0, 'Magistrate Barthilas - Teleport');
UPDATE `creature_template` SET `flags_extra` = (`flags_extra` | 33554432) WHERE `entry`=10435;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
