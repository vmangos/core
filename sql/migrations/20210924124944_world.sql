DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210924124944');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210924124944');
-- Add your query below.


-- Add spawn position for Horn of Margol the Rager.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (11468, 147136, 0, -4629.5, -1279.51, 503.382, 2.32129, 0, 0, 0.91706, 0.39875, -60, -60, 1, 100);

-- Add completion script for quest Proof of Deed.
DELETE FROM `quest_end_scripts` WHERE `id`=3182;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3182, 0, 61, 3182, 60, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Start Scripted Map Event');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3182, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4305, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Say Text');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3182, 1, 60, 3, 0, 5000, 0, 0, 0, 0, 0, 0, 3182, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Start Waypoints');
UPDATE `quest_template` SET `CompleteScript`=3182 WHERE `entry`=3182;

-- Add waypoints for Curator Thorius when quest Proof of Deed is turned in.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(3182, 1, -4652.279785, -1278.880005, 503.381989, 100.000000, 0, 0.000000, 0),
(3182, 2, -4652.279785, -1278.880005, 503.381989, 5.375610, 1000, 0.000000, 0),
(3182, 3, -4631.189941, -1278.020020, 503.381989, 100.000000, 0, 0.000000, 318203),
(3182, 4, -4631.189941, -1278.020020, 503.381989, 5.480330, 22000, 0.000000, 0);

-- Waypoint script.
DELETE FROM `creature_movement_scripts` WHERE `id`=318203;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318203, 0, 0, 0, 0, 0, 0, 3182, 0, 21, 0, 4306, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318203, 2, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Emote State Work No Sheathe');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318203, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Stop Emoting');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318203, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4307, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318203, 14, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Emote Cheer');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (318203, 14, 9, 11468, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Proof of Deed: Curator Thorius - Respawn GameObject');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
