DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200316181516');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200316181516');
-- Add your query below.


-- Fix requirements for The Completed Orb of Dar'Orahil and Noh'Orahil.
UPDATE `quest_template` SET `ExclusiveGroup`=0, `PrevQuestId`=4962 WHERE `entry`=4964;
UPDATE `quest_template` SET `ExclusiveGroup`=0, `PrevQuestId`=4963 WHERE `entry`=4975;

-- Improved script for quest Cleansing of the Orb of Orahil.
DELETE FROM `quest_start_scripts` WHERE `id`=4961;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2629, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4961, 0, 60, 3, 0, 0, 0, 0, 0, 0, 4, 0, 4961, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4961, 0, 4, 147, 3, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Remove Quest Giver Flag');

-- Waypoints for Tabetha when quest Cleansing of the Orb of Orahil is started.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(4961, 1, -4035.85, -3384.24, 38.9959, 100, 0, 0, 0),
(4961, 2, -4037.6, -3381.32, 37.9133, 100, 0, 0, 0),
(4961, 3, -4037.38, -3378.67, 37.7076, 100, 0, 0, 0),
(4961, 4, -4033.77, -3376.26, 38.0439, 100, 0, 0, 0),
(4961, 5, -4027.12, -3377.37, 38.1654, 100, 0, 0, 0),
(4961, 6, -4020.59, -3382, 38.1995, 100, 6000, 0, 496106),
(4961, 7, -4026.94, -3377.41, 38.1672, 100, 0, 0, 0),
(4961, 8, -4034.27, -3376.6, 37.9825, 100, 0, 0, 0),
(4961, 9, -4038.45, -3380.05, 37.733, 100, 0, 0, 0),
(4961, 10, -4035.32, -3384.92, 38.9973, 100, 0, 0, 0),
(4961, 11, -4031.56, -3392.97, 38.9974, 2.1293, 1000, 0, 496111),
(4961, 12, -4031.56, -3392.97, 38.9974, 2.1293, 0, 0, 0);

-- Waypoint scripts for Tabetha.
DELETE FROM `creature_movement_scripts` WHERE `id`=496106;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (496106, 0, 15, 9097, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Cast Spell Summon Demon of the Orb');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (496106, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Set Run');
DELETE FROM `creature_movement_scripts` WHERE `id`=496111;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (496111, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Add Quest Giver Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (496111, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Set Walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (496111, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansing of the Orb of Orahil: Tabetha - Move Idle');

-- Missing weapon used by Demon of the Orb.
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (6549, 5747, 0, 0);
UPDATE `creature_template` SET `equipment_id`=6549 WHERE `entry`=6549;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
