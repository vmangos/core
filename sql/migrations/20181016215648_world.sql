DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181016215648');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181016215648');
-- Add your query below.


-- Fix flags for event after Harlan Needs A Resupply is completed.
DELETE FROM `quest_end_scripts` WHERE `id`=333;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (333, 0, 31, 1433, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Harlan Needs a Resupply - Check if Corbett Schneider is already spawned');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (333, 1, 10, 1433, 360000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1, -8774.38, 717.52, 99.533, 4.245, 0, 'Harlan Needs a Resupply - Spawn Corbett Schneider');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (333, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 253, 0, 0, 0, 0, 0, 0, 0, 'Harlan Needs a Resupply - Rema Schneider Say Text 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (333, 7, 0, 0, 0, 0, 0, 1433, 15, 8, 2, 255, 256, 0, 0, 0, 0, 0, 0, 0, 'Harlan Needs a Resupply - Corbet Schneider Say Text 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (333, 10, 20, 2, 0, 0, 0, 1433, 15, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Harlan Needs a Resupply - Corbet Schneider Start Waypoint Movement');

-- Fix flags for event after Translation to Ello is completed.
DELETE FROM `quest_end_scripts` WHERE `id`=252;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (252, 30, 10, 1436, 65000, 0, 0, 0, 0, 0, 0, 1, 1436, 6, 1, -10604.2, -1179.31, 27.995, 0.16, 0, 'Translation to Ello - Spawn Watcher Cutford');
DELETE FROM `event_scripts` WHERE `id`=1436;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1436, 1, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translation to Ello - Set Movement for Watcher Cutford');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
