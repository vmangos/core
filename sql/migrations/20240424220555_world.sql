DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240424220555');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240424220555');
-- Add your query below.


-- Black Smoke - scale 2
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(131, 965, 0, -10295.9, 73.2196, 44.2344, 0, 0, 0, 0, 1, -10, -10, 100, 1, 0, 10); -- Duskwood

-- Black Smoke Emitter
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(134, 1604, 0, -10295.6, 73.3118, 44.1083, 5.77704, 0, 0, -0.25038, 0.968148, -10, -10, 100, 1, 0, 10); -- Duskwood

-- Quest end script for Wait for Sirra to Finish.
DELETE FROM `quest_end_scripts` WHERE `id`=401;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(401, 0, 0, 61, 412, 60, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translation to Ello - Start Scripted Map Event'),
(401, 1, 0, 9, 131, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translation to Ello - Respawn Black Smoke - scale 2'),
(401, 1, 1, 9, 134, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translation to Ello - Respawn Black Smoke Emitter'),
(401, 1, 2, 10, 1436, 900000, 1, 500, 0, 0, 0, 0, 11, 0, -1, 1, -10556.9, -1123.3, 30.2506, 3.24631, 0, 'Translation to Ello - Spawn Watcher Cutford');
UPDATE `quest_template` SET `CompleteScript`=401 WHERE `entry`=401;

-- Remove not needed spawn script for Watcher Cutford.
DELETE FROM `generic_scripts` WHERE `id`=1436;

-- Remove quest end script from Translation to Ello.
DELETE FROM `quest_end_scripts` WHERE `id`=252;
UPDATE `quest_template` SET `CompleteScript`=0 WHERE `entry`=252;

-- Assign script name to Sirra Von'Indi.
UPDATE `creature_template` SET `script_name`='npc_sirra_vonindi' WHERE `entry`=268;

-- Remove script name from Lord Ello Ebonlocke.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=263;

-- Waypoints for Creature Watcher Cutford.
DELETE FROM `creature_movement_template` WHERE `entry`=1436;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1436, 1, -10556.880859, -1123.302612, 30.250578, 3.24631000, 30000, 0.000000, 143601),
(1436, 2, -10569.420898, -1125.677002, 29.291561, 100.000000, 0, 0.000000, 0),
(1436, 3, -10569.950195, -1113.635864, 30.179350, 100.000000, 32000, 0.000000, 143603),
(1436, 4, -10574.929688, -1122.515259, 29.768606, 100.000000, 0, 0.000000, 0),
(1436, 5, -10565.645508, -1124.901978, 30.179325, 100.000000, 0, 0.000000, 0),
(1436, 6, -10556.668945, -1151.781860, 28.076490, 4.71238900, 800, 0.000000, 143606),
(1436, 7, -10556.668945, -1151.781860, 28.076490, 100.000000, 22000, 0.000000, 0),
(1436, 8, -10564.061523, -1161.595215, 27.654827, 100.000000, 0, 0.000000, 0),
(1436, 9, -10574.238281, -1169.432739, 28.220985, 100.000000, 0, 0.000000, 0),
(1436, 10, -10597.883789, -1178.896729, 28.139154, 100.000000, 0, 0.000000, 0),
(1436, 11, -10610.547852, -1181.641724, 28.490269, 100.000000, 0, 0.000000, 0),
(1436, 12, -10623.083008, -1184.570801, 28.921165, 100.000000, 0, 0.000000, 0),
(1436, 13, -10635.504883, -1188.308105, 28.903074, 100.000000, 0, 0.000000, 0),
(1436, 14, -10661.284180, -1191.964966, 28.340305, 100.000000, 0, 0.000000, 0),
(1436, 15, -10674.145508, -1192.689209, 27.633039, 100.000000, 0, 0.000000, 0),
(1436, 16, -10698.093750, -1183.114746, 26.874086, 100.000000, 0, 0.000000, 0),
(1436, 17, -10720.543945, -1169.858154, 26.713049, 100.000000, 0, 0.000000, 0),
(1436, 18, -10731.507813, -1162.844360, 26.908941, 100.000000, 0, 0.000000, 0),
(1436, 19, -10752.060547, -1147.240845, 26.915276, 100.000000, 0, 0.000000, 0),
(1436, 20, -10780.525391, -1111.953125, 30.534107, 100.000000, 800, 0.000000, 143620),
(1436, 21, -10782.949219, -1099.565308, 33.235577, 100.000000, 0, 0.000000, 0),
(1436, 22, -10793.548828, -1063.138794, 40.347610, 100.000000, 0, 0.000000, 0),
(1436, 23, -10801.182617, -1039.006592, 45.659138, 100.000000, 0, 0.000000, 0),
(1436, 24, -10805.604492, -1014.160706, 50.362385, 100.000000, 0, 0.000000, 0),
(1436, 25, -10806.653320, -988.594421, 54.428097, 100.000000, 0, 0.000000, 0),
(1436, 26, -10803.805664, -963.079163, 56.485775, 100.000000, 0, 0.000000, 0),
(1436, 27, -10798.505859, -937.755310, 56.431297, 100.000000, 0, 0.000000, 0),
(1436, 28, -10796.077148, -925.024414, 55.860046, 100.000000, 0, 0.000000, 0),
(1436, 29, -10800.884766, -899.827454, 56.033051, 100.000000, 0, 0.000000, 0),
(1436, 30, -10807.995117, -875.011841, 56.014294, 100.000000, 0, 0.000000, 0),
(1436, 31, -10820.960938, -842.781677, 56.031773, 100.000000, 500, 0.000000, 143631),
(1436, 32, -10826.375977, -830.938660, 55.858456, 100.000000, 0, 0.000000, 0),
(1436, 33, -10831.771484, -819.165283, 56.373459, 100.000000, 0, 0.000000, 0),
(1436, 34, -10845.344727, -797.204590, 56.316795, 100.000000, 0, 0.000000, 0),
(1436, 35, -10852.890625, -786.610657, 56.270161, 100.000000, 0, 0.000000, 0),
(1436, 36, -10870.119141, -767.294373, 55.592880, 100.000000, 0, 0.000000, 0),
(1436, 37, -10888.788086, -749.252625, 55.519005, 100.000000, 0, 0.000000, 0),
(1436, 38, -10905.039063, -729.146118, 54.939625, 100.000000, 0, 0.000000, 0),
(1436, 39, -10911.975586, -718.363953, 55.132450, 100.000000, 0, 0.000000, 0),
(1436, 40, -10918.148438, -706.920654, 55.714951, 100.000000, 0, 0.000000, 0),
(1436, 41, -10930.813477, -684.246216, 55.567173, 100.000000, 0, 0.000000, 0),
(1436, 42, -10937.818359, -673.304443, 55.775391, 100.000000, 0, 0.000000, 0),
(1436, 43, -10945.585938, -662.662903, 55.522682, 100.000000, 0, 0.000000, 0),
(1436, 44, -10953.288086, -652.321472, 55.455498, 100.000000, 0, 0.000000, 0),
(1436, 45, -10957.036133, -618.636353, 55.101994, 100.000000, 500, 0.000000, 143645),
(1436, 46, -10939.453125, -584.656921, 54.001637, 100.000000, 0, 0.000000, 0),
(1436, 47, -10926.596680, -562.290710, 54.055218, 100.000000, 0, 0.000000, 0),
(1436, 48, -10921.381836, -550.442322, 54.107521, 100.000000, 0, 0.000000, 0),
(1436, 49, -10916.948242, -538.211121, 54.217026, 100.000000, 0, 0.000000, 0),
(1436, 50, -10913.324219, -525.801575, 53.899815, 100.000000, 0, 0.000000, 0),
(1436, 51, -10909.357422, -500.295135, 51.279682, 100.000000, 0, 0.000000, 0),
(1436, 52, -10907.510742, -487.583160, 49.784210, 100.000000, 0, 0.000000, 0),
(1436, 53, -10907.752930, -462.337097, 46.799950, 100.000000, 0, 0.000000, 0),
(1436, 54, -10906.654297, -423.290771, 42.126560, 100.000000, 0, 0.000000, 0),
(1436, 55, -10907.341797, -410.539703, 41.568768, 100.000000, 0, 0.000000, 0),
(1436, 56, -10913.154297, -399.110077, 41.041832, 100.000000, 0, 0.000000, 0),
(1436, 57, -10929.400000, -386.183000, 40.058500, 100.000000, 60000, 0.000000, 143657);

-- Make Watcher Cutford use waypoints by default.
UPDATE `creature_template` SET `movement_type`=2 WHERE `entry`=1436;

-- Remove old waypoint scripts.
DELETE FROM `creature_movement_scripts` WHERE `id` IN (17, 18, 19, 20, 143601);

-- Waypoint scripts
DELETE FROM `creature_movement_scripts` WHERE `id`=143601;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(143601, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 549, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=143603;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(143603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 266, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text'),
(143603, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 268, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text'),
(143603, 13, 0, 39, 1436, 0, 0, 0, 263, 30, 8, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Ello Ebonlocke - Start Script to Say Text'),
(143603, 20, 0, 0, 0, 0, 0, 0, 263, 30, 8, 2, 271, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Ello Ebonlocke - Say Text'),
(143603, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text');
DELETE FROM `generic_scripts` WHERE `id`=1436;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1436, 0, 0, 0, 0, 0, 0, 0, 412, 0, 21, 0, 270, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Ello Ebonlocke - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=143606;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(143606, 11, 0, 0, 0, 0, 0, 264, 30, 8, 2, 273, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Althea Ebonlocke - Say Text'),
(143606, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 275, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=143620;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(143620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=143631;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(143631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=143645;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(143645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=143657;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(143657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Say Text'),
(143657, 1, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Move Idle'),
(143657, 1, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Watcher Cutford - Set Home Position');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
