DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200804104542');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200804104542');
-- Add your query below.


-- Improved script for quest Mana Surges.
DELETE FROM `quest_start_scripts` WHERE `id`=1957;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1957, 0, 61, 0, 200, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1957, 1, 60, 3, 0, 0, 0, 0, 0, 0, 4, 0, 1957, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1957, 1, 4, 147, 3, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1957, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2592, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Say Text');
-- Script after Create Rift is cast.
DELETE FROM `event_scripts` WHERE `id`=1653;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 0, 9, 28294, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Respawn Mana Rift');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 10, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 10, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 40, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 40, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 70, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 70, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 70, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 100, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 100, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 100, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 130, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 130, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 130, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 130, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 160, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 160, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 160, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 160, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 190, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 190, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 190, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 190, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1653, 190, 10, 6550, 60000, 0, 0, 0, 0, 0, 0, 0, 6550, 6, 1, -4019.22, -3383.91, 38.2265, 0, 0, 'Mana Surges - Summon Creature Mana Surge');
-- On spawn script for Mana Surges.
DELETE FROM `event_scripts` WHERE `id`=6550;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6550, 0, 20, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 8, 0, 0, 0, 117, 'Mana Surge - Move Random');

-- Waypoints for Tabetha when quest Mana Surges is started.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(1957, 1, -4035.85, -3384.24, 38.9959, 100, 0, 0, 0),
(1957, 2, -4037.6, -3381.32, 37.9133, 100, 0, 0, 0),
(1957, 3, -4037.38, -3378.67, 37.7076, 100, 0, 0, 0),
(1957, 4, -4033.77, -3376.26, 38.0439, 100, 0, 0, 0),
(1957, 5, -4029.45, -3377.68, 38.128, 100, 6000, 0, 195701),
(1957, 6, -4034.27, -3376.6, 37.9825, 100, 0, 0, 0),
(1957, 7, -4038.45, -3380.05, 37.733, 100, 0, 0, 0),
(1957, 8, -4035.32, -3384.92, 38.9973, 100, 0, 0, 0),
(1957, 9, -4031.56, -3392.97, 38.9974, 2.1293, 1000, 0, 195702),
(1957, 10, -4031.56, -3392.97, 38.9974, 2.1293, 0, 0, 0);

-- Waypoint scripts for Tabetha.
DELETE FROM `creature_movement_scripts` WHERE `id`=195701;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195701, 0, 15, 9079, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Cast Spell Create Rift');
DELETE FROM `creature_movement_scripts` WHERE `id`=195702;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195702, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Add Quest Giver Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (195702, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges: Tabetha - Move Idle');

-- Correct Mana Rift location.
UPDATE `gameobject` SET `position_x`=-4016.67, `position_y`=-3384.42, `position_z`=38.3293, `orientation`=3.08918, `rotation0`=0, `rotation1`=0, `rotation2`=0.999657, `rotation3`=0.0262017 WHERE `guid`=28294;

-- Remove hardcoded script from Tabetha.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=6546;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
