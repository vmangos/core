DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201114193734');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201114193734');
-- Add your query below.


-- On use script for Mausoleum Trigger.
DELETE FROM `gameobject_scripts` WHERE `id`=44766;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44766, 0, 31, 6390, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mausoleum Trigger - Terminate Script if Ulag is spawned');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44766, 6, 76, 105168, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2375.96, 360.053, 38.2241, 2.3911, 0, 'Mausoleum Trigger - Summon GameObject Skull Key');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44766, 6, 10, 6390, 120000, 0, 0, 0, 0, 0, 0, 1, 0, 6, 1, 2390.28, 336.335, 40.099, 2.42601, 0, 'Mausoleum Trigger - Summon Creature Ulag the Cleaver');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44766, 6, 76, 103813, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2387.86, 339.52, 37.4054, 2.21656, 0, 'Mausoleum Trigger - Summon GameObject Mausoleum Seal');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44766, 17, 11, 44816, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doors - Open Door');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44766, 19, 3, 0, 1708, 4, 2, 6390, 50, 8, 2, 0, 0, 0, 0, 2384.65, 343.654, 38.1009, 2.226, 0, 'Ulag the Cleaver - Move');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (44766, 19, 34, 0, 0, 0, 0, 6390, 50, 8, 2, 0, 0, 0, 0, 2384.65, 343.654, 38.1009, 2.226, 0, 'Ulag the Cleaver - Set Home Position');

-- Ulag the Cleaver does not have a mount.
UPDATE `creature_template` SET `mount_display_id`=0 WHERE `entry`=6390;
-- Remove hardcoded script for Mausoleum Trigger.
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry`=104593;
-- Remove hardcoded script for Doors.
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry`=176594;
-- Correct size of Skull Key.
UPDATE `gameobject_template` SET `size`=3 WHERE `entry`=105168;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
