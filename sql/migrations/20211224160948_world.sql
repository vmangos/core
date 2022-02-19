DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211224160948');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211224160948');
-- Add your query below.


-- Correct spawn position and respawn time of Sethir the Ancient.
UPDATE `creature` SET `position_x`=11056.3, `position_y`=1924.88, `position_z`=1334.55, `orientation`=3.61283, `spawntimesecsmin`=10, `spawntimesecsmax`=20 WHERE `id`=6909;

-- Waypoints for Sethir the Ancient.
DELETE FROM `creature_movement` WHERE `id`=2499;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(6909, 1, 11056.330078, 1924.876343, 1334.548950, 3.61283, 40000, 0.000000, 0),
(6909, 2, 11051.851563, 1922.981689, 1333.187988, 100.000000, 0, 0.000000, 0),
(6909, 3, 11026.405273, 1913.373901, 1328.172852, 100.000000, 0, 0.000000, 0),
(6909, 4, 11005.017578, 1903.746338, 1333.854126, 100.000000, 40000, 0.000000, 690904),
(6909, 5, 11021.911133, 1911.188110, 1327.509644, 100.000000, 0, 0.000000, 0),
(6909, 6, 11048.061523, 1920.930054, 1331.762817, 100.000000, 0, 0.000000, 0),
(6909, 7, 11060.495117, 1916.960571, 1333.368164, 100.000000, 0, 0.000000, 0),
(6909, 8, 11068.019531, 1912.293213, 1335.533813, 100.000000, 0, 0.000000, 0),
(6909, 9, 11072.569336, 1907.023438, 1338.900757, 100.000000, 0, 0.000000, 0),
(6909, 10, 11074.375977, 1903.905518, 1340.737061, 100.000000, 0, 0.000000, 0),
(6909, 11, 11078.463867, 1899.173828, 1344.631348, 100.000000, 70000, 0.000000, 690911),
(6909, 12, 11078.463867, 1899.173828, 1344.631348, 100.000000, 0, 0.000000, 690912),
(6909, 13, 11087.393555, 1900.319214, 1343.685547, 100.000000, 0, 0.000000, 0),
(6909, 14, 11098.364258, 1906.453735, 1345.930664, 100.000000, 0, 0.000000, 0),
(6909, 15, 11111.196289, 1909.802368, 1353.085327, 100.000000, 0, 0.000000, 0),
(6909, 16, 11116.672852, 1910.986450, 1353.131226, 100.000000, 20000, 0.000000, 0),
(6909, 17, 11116.672852, 1910.986450, 1353.131226, 100.000000, 1000, 0.000000, 690917);

-- Waypoint scripts for Sethir the Ancient.
DELETE FROM `creature_movement_scripts` WHERE `id`=690904;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(690904, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3001, 0, 0, 0, 0, 0, 0, 0, 0, 'Sethir the Ancient - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=690911;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(690911, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sethir the Ancient - Set Run'),
(690911, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3002, 0, 0, 0, 0, 0, 0, 0, 0, 'Sethir the Ancient - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=690912;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(690912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2982, 0, 0, 0, 0, 0, 0, 0, 0, 'Sethir the Ancient - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=690917;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(690917, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sethir the Ancient - Despawn');

-- Events list for Sethir the Ancient
DELETE FROM `creature_ai_events` WHERE `creature_id`=6909;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (690901, 6909, 0, 4, 0, 100, 0, 0, 0, 0, 0, 690901, 0, 0, 'Sethir the Ancient - Summon Minions on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (690902, 6909, 0, 1, 0, 100, 1, 30000, 30000, 60000, 60000, 690902, 0, 0, 'Sethir the Ancient - Say Text if Stealthed Player is Nearby');
DELETE FROM `creature_ai_scripts` WHERE `id`=690901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690901, 0, 16, 6337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sethir the Ancient - Play Sound');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690901, 0, 10, 6911, 120000, 6, 100, 0, 0, 0, 0, 8, 0, -1, 1, 11063.5, 1927.53, 1336.7, 4.04916, 0, 'Sethir the Ancient - Summon Creature Minion of Sethir');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690901, 0, 10, 6911, 120000, 6, 100, 0, 0, 0, 0, 8, 0, -1, 1, 11063.2, 1918.13, 1333.54, 2.6529, 0, 'Sethir the Ancient - Summon Creature Minion of Sethir');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690901, 0, 10, 6911, 120000, 6, 100, 0, 0, 0, 0, 8, 0, -1, 1, 11055.9, 1914.41, 1332.45, 2.49582, 0, 'Sethir the Ancient - Summon Creature Minion of Sethir');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690901, 0, 10, 6911, 120000, 6, 100, 0, 0, 0, 0, 8, 0, -1, 1, 11007.3, 1898.09, 1335.56, 0.15708, 0, 'Sethir the Ancient - Summon Creature Minion of Sethir');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690901, 0, 10, 6911, 120000, 6, 100, 0, 0, 0, 0, 8, 0, -1, 1, 11007.6, 1908.29, 1334.29, 6.21337, 0, 'Sethir the Ancient - Summon Creature Minion of Sethir');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690901, 0, 10, 6911, 120000, 6, 100, 0, 0, 0, 0, 8, 0, -1, 1, 11006.4, 1903, 1333.53, 5.98648, 0, 'Sethir the Ancient - Summon Creature Minion of Sethir');
DELETE FROM `creature_ai_scripts` WHERE `id`=690902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690902, 0, 68, 690902, 3, 0, 15, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sethir the Ancient - Start Script on Nearby Players');
DELETE FROM `generic_scripts` WHERE `id`=690902;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (690902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2981, 0, 0, 0, 0, 0, 0, 0, 20264, 'Sethir the Ancient - Say Text');
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1.14286, `base_attack_time`=2000, `ai_name`='EventAI', `script_name`='' WHERE `entry`=6909;

-- Events list for Minion of Sethir
DELETE FROM `creature_ai_events` WHERE `creature_id`=6911;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (691101, 6911, 0, 4, 0, 100, 0, 0, 0, 0, 0, 691101, 0, 0, 'Minion of Sethir - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=691101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (691101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2983, 0, 0, 0, 0, 0, 0, 0, 0, 'Minion of Sethir - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=6911;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
