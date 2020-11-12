DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200611182015');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200611182015');
-- Add your query below.


-- npc's should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` IN (4248, 4181, 4064, 4245, 4180);

-- npc's should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 0.5 WHERE `guid` IN (4242, 4198, 4196, 4197, 4081, 4175, 4195, 4205, 4083, 4210, 4188, 4189, 4190);

-- npc's should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 1 WHERE `guid` IN (5960, 4179, 4182, 4244, 4194, 4252, 4251);

-- Viktori Prism Antras - speak
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 276;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (27601, 276, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 27601, 0, 0, 'Viktori Prism Antras - Say Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (27601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 79, 0, 0, 0, 0, 0, 0, 0, 'Viktori Prism Antras - Say Text');

-- remove incorrect guards 
DELETE FROM `creature` WHERE `guid` IN (6133, 6127);

-- watcher keefer should roam not pathfind
DELETE FROM `creature_movement` WHERE `id` = 5965;
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 4 WHERE `guid` = 5965;

-- watcher petras correct path
UPDATE `creature` SET `position_x` = -10554.4, `position_y` = -1228.83, `position_z` = 27.5662, `movement_type` = 2 WHERE `guid` = 4247;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(828, 1, -10554.4, -1228.83, 27.5662, 100, 0, 0, 0),
(828, 2, -10554.2, -1233.77, 28.3546, 100, 0, 0, 0),
(828, 3, -10553.7, -1246.75, 30.9599, 100, 0, 0, 0),
(828, 4, -10553.6, -1250.2, 31.8325, 100, 0, 0, 0),
(828, 5, -10552.1, -1254.2, 32.3294, 100, 0, 0, 0),
(828, 6, -10549.5, -1260.84, 33.2856, 100, 0, 0, 0),
(828, 7, -10547.2, -1264.73, 34.0205, 100, 0, 0, 0),
(828, 8, -10546.9, -1265.02, 34.1108, 100, 0, 0, 0),
(828, 9, -10538.3, -1276.65, 37.1577, 100, 0, 0, 0),
(828, 10, -10533.6, -1287.47, 39.2166, 100, 0, 0, 0),
(828, 11, -10533.8, -1303.38, 41.6731, 100, 0, 0, 0),
(828, 12, -10535.4, -1310.63, 42.4776, 100, 0, 0, 0),
(828, 13, -10542.6, -1325.9, 45.5034, 100, 0, 0, 0),
(828, 14, -10546.8, -1334.8, 47.5132, 100, 0, 0, 0),
(828, 15, -10539.7, -1379.28, 56.0844, 100, 0, 0, 0),
(828, 16, -10546.8, -1334.8, 47.5132, 100, 0, 0, 0),
(828, 17, -10542.6, -1325.9, 45.5034, 100, 0, 0, 0),
(828, 18, -10535.4, -1310.63, 42.4776, 100, 0, 0, 0),
(828, 19, -10533.8, -1303.38, 41.6731, 100, 0, 0, 0),
(828, 20, -10533.6, -1287.47, 39.2166, 100, 0, 0, 0),
(828, 21, -10538.3, -1276.65, 37.1577, 100, 0, 0, 0),
(828, 22, -10546.9, -1265.02, 34.1108, 100, 0, 0, 0),
(828, 23, -10547.2, -1264.73, 34.0205, 100, 0, 0, 0),
(828, 24, -10549.5, -1260.84, 33.2856, 100, 0, 0, 0),
(828, 25, -10552.1, -1254.2, 32.3294, 100, 0, 0, 0),
(828, 26, -10553.6, -1250.2, 31.8325, 100, 0, 0, 0),
(828, 27, -10553.7, -1246.75, 30.9599, 100, 0, 0, 0),
(828, 28, -10554.2, -1233.77, 28.3546, 100, 0, 0, 0);

-- watcher backus correct path
UPDATE `creature` SET `position_x` = -10512.7, `position_y` = -1187.08, `position_z` = 28.1543 WHERE `guid` = 4230;
DELETE FROM `creature_movement_template` WHERE `entry` = 840;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(840, 1, -10512.7, -1187.08, 28.1543, 100, 0, 0, 0),
(840, 2, -10474.4, -1181.57, 27.6911, 100, 0, 0, 0),
(840, 3, -10456.4, -1179.36, 27.2816, 100, 0, 0, 0),
(840, 4, -10434.5, -1166.99, 27.9583, 100, 0, 0, 0),
(840, 5, -10421.5, -1146.45, 26.1002, 100, 0, 0, 0),
(840, 6, -10414.9, -1137.21, 24.2593, 100, 0, 0, 0),
(840, 7, -10399.3, -1124.41, 22.3425, 100, 0, 0, 0),
(840, 8, -10391.5, -1118.01, 22.4382, 100, 0, 0, 0),
(840, 9, -10387.2, -1117.89, 22.001, 100, 0, 0, 0),
(840, 10, -10357.7, -1117.04, 21.3006, 100, 0, 0, 0),
(840, 11, -10355.9, -1116.97, 21.3518, 100, 0, 0, 0),
(840, 12, -10351.8, -1116.86, 21.4269, 100, 0, 0, 0),
(840, 13, -10322.7, -1125.09, 21.6912, 100, 0, 0, 0),
(840, 14, -10302.2, -1146.36, 22.7224, 100, 0, 0, 0),
(840, 15, -10302.2, -1146.36, 22.7224, 100, 0, 0, 0),
(840, 16, -10322.7, -1125.09, 21.6912, 100, 0, 0, 0),
(840, 17, -10351.8, -1116.86, 21.4269, 100, 0, 0, 0),
(840, 18, -10355.9, -1116.97, 21.3518, 100, 0, 0, 0),
(840, 19, -10357.7, -1117.04, 21.3006, 100, 0, 0, 0),
(840, 20, -10387.2, -1117.89, 22.001, 100, 0, 0, 0),
(840, 21, -10391.5, -1118.01, 22.4382, 100, 0, 0, 0),
(840, 22, -10399.3, -1124.41, 22.3425, 100, 0, 0, 0),
(840, 23, -10414.9, -1137.21, 24.2593, 100, 0, 0, 0),
(840, 24, -10421.5, -1146.45, 26.1002, 100, 0, 0, 0),
(840, 25, -10434.5, -1166.99, 27.9583, 100, 0, 0, 0),
(840, 26, -10456.4, -1179.36, 27.2816, 100, 0, 0, 0),
(840, 27, -10474.4, -1181.57, 27.6911, 100, 0, 0, 0),
(840, 28, -10512.7, -1187.08, 28.1543, 100, 0, 0, 0);

-- farrin daris scripts
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 4062;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2112, 1, -10514.7, -1156.19, 34.9574, 4.06662, 150000, 0, 0),
(2112, 2, -10499, -1154.68, 34.9574, 3.19395, 93000, 0, 211201);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (211201, 0, 39, 211201, 211202, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Farrin Daris - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (211201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 963, 966, 964, 965, 0, 0, 0, 0, 0, 'Farrin Daris - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (211202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 962, 961, 963, 966, 0, 0, 0, 0, 0, 'Farrin Daris - Say Text');

-- watcher jordan correct path
DELETE FROM `creature_movement_template` WHERE `entry` = 887;
DELETE FROM `creature_movement` WHERE `id` = 5941;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(887, 1, -10624.6, -1185.56, 28.8704, 100, 0, 0, 0),
(887, 2, -10646, -1191.34, 28.4968, 100, 0, 0, 0),
(887, 3, -10648.6, -1192.04, 28.5482, 100, 0, 0, 0),
(887, 4, -10672, -1192.85, 27.5826, 100, 0, 0, 0),
(887, 5, -10681.3, -1193.18, 27.4885, 100, 0, 0, 0),
(887, 6, -10681.9, -1193.2, 27.479, 100, 0, 0, 0),
(887, 7, -10706.1, -1178.47, 26.3841, 100, 0, 0, 0),
(887, 8, -10707.5, -1177.55, 26.4133, 100, 0, 0, 0),
(887, 9, -10709.5, -1176.32, 26.4714, 100, 0, 0, 0),
(887, 10, -10712.2, -1174.63, 26.3535, 100, 0, 0, 0),
(887, 11, -10737.8, -1158.28, 26.4736, 100, 0, 0, 0),
(887, 12, -10751.9, -1147.21, 26.8814, 100, 0, 0, 0),
(887, 13, -10758.7, -1140.81, 26.9629, 100, 0, 0, 0),
(887, 14, -10766.6, -1131.98, 27.4404, 100, 0, 0, 0),
(887, 15, -10768.8, -1129.47, 27.8191, 100, 0, 0, 0),
(887, 16, -10770.8, -1126, 28.4115, 100, 0, 0, 0),
(887, 17, -10777.8, -1114.15, 30.155, 100, 0, 0, 0),
(887, 18, -10779, -1112.08, 30.5697, 100, 0, 0, 0),
(887, 19, -10780, -1110.32, 30.821, 100, 0, 0, 0),
(887, 20, -10781.3, -1107.08, 31.4511, 100, 0, 0, 0),
(887, 21, -10783.4, -1102.08, 32.5869, 100, 0, 0, 0),
(887, 22, -10787.1, -1079.96, 36.5552, 100, 0, 0, 0),
(887, 23, -10783.4, -1102.08, 32.5869, 100, 0, 0, 0),
(887, 24, -10781.3, -1107.08, 31.4511, 100, 0, 0, 0),
(887, 25, -10780, -1110.32, 30.821, 100, 0, 0, 0),
(887, 26, -10779, -1112.08, 30.5697, 100, 0, 0, 0),
(887, 27, -10777.8, -1114.15, 30.155, 100, 0, 0, 0),
(887, 28, -10770.8, -1126, 28.4115, 100, 0, 0, 0),
(887, 29, -10768.8, -1129.47, 27.8191, 100, 0, 0, 0),
(887, 30, -10766.6, -1131.98, 27.4404, 100, 0, 0, 0),
(887, 31, -10758.7, -1140.81, 26.9629, 100, 0, 0, 0),
(887, 32, -10751.9, -1147.21, 26.8814, 100, 0, 0, 0),
(887, 33, -10737.8, -1158.28, 26.4736, 100, 0, 0, 0),
(887, 34, -10712.2, -1174.63, 26.3535, 100, 0, 0, 0),
(887, 35, -10709.5, -1176.32, 26.4714, 100, 0, 0, 0),
(887, 36, -10707.5, -1177.55, 26.4133, 100, 0, 0, 0),
(887, 37, -10706.1, -1178.47, 26.3841, 100, 0, 0, 0),
(887, 38, -10681.9, -1193.2, 27.479, 100, 0, 0, 0),
(887, 39, -10681.3, -1193.18, 27.4885, 100, 0, 0, 0),
(887, 40, -10672, -1192.85, 27.5826, 100, 0, 0, 0),
(887, 41, -10648.6, -1192.04, 28.5482, 100, 0, 0, 0),
(887, 42, -10646, -1191.34, 28.4968, 100, 0, 0, 0);

-- blind mary correct path
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 4255;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(302, 1, -10785.4, -1374.49, 39.7132, 100, 30000, 0, 0),
(302, 2, -10780.2, -1380.28, 39.7193, 100, 30000, 0, 0),
(302, 3, -10786, -1381, 39.7193, 0.006667, 30000, 0, 0);

-- madame eva event
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 265;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (26501, 265, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 26501, 0, 0, 'Madame Eva - Say Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (26501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 74, 75, 76, 0, 0, 0, 0, 0, 'Madame Eva - Say Text');

-- commander althea ebonlocke event
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 264;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (26401, 264, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 26401, 0, 0, 'Commander Althea Ebonlocke - Say Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (26401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61, 62, 0, 0, 0, 0, 0, 0, 0, 'Commander Althea Ebonlocke - Say Text');

-- tavernkeep smitts event
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 273;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (27301, 273, 0, 1, 0, 100, 1, 45000, 60000, 150000, 180000, 27301, 0, 0, 'Tavernkeep Smitts - Say Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (27301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 82, 0, 0, 0, 0, 0, 0, 0, 0, 'Tavernkeep Smitts - Say Text');

-- events list for innkeeper trelayne
DELETE FROM `creature_ai_events` WHERE `creature_id`=6790;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (679001, 6790, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 679001, 0, 0, 'Innkeeper Trelayne - Say Text OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=679001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (679001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Trelayne - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
