DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200627204553');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200627204553');
-- Add your query below.

-- forests edge
-- add stormwind guard 80463 waypoints
UPDATE `creature` SET `position_x` = -9625.91, `position_y` = 648.695, `position_z` = 38.6521, `movement_type` = 2 WHERE `guid` = 80463;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(80463, 1, -9625.91, 648.695, 38.6521, 100, 0, 0, 0),
(80463, 2, -9623.76, 653.384, 38.6521, 100, 0, 0, 0),
(80463, 3, -9622.76, 656.105, 38.6521, 100, 0, 0, 0),
(80463, 4, -9619.55, 663.514, 38.6522, 100, 0, 0, 0),
(80463, 5, -9613.32, 678.183, 38.6521, 100, 0, 0, 0),
(80463, 6, -9611.34, 683.016, 38.6521, 100, 0, 0, 0),
(80463, 7, -9611.34, 685.784, 38.6521, 100, 0, 0, 0),
(80463, 8, -9611.43, 686.799, 38.6521, 100, 0, 0, 0),
(80463, 9, -9612.43, 690.784, 38.6521, 100, 0, 0, 0),
(80463, 10, -9616.25, 691.774, 38.6521, 100, 0, 0, 0),
(80463, 11, -9619.87, 690.613, 38.6521, 100, 0, 0, 0),
(80463, 12, -9627.26, 676.629, 37.1529, 100, 0, 0, 0),
(80463, 13, -9630.66, 669.282, 37.1513, 100, 0, 0, 0),
(80463, 14, -9633.66, 662.105, 38.6522, 100, 0, 0, 0),
(80463, 15, -9635.15, 658.352, 38.6521, 100, 0, 0, 0),
(80463, 16, -9635.84, 654.435, 38.6521, 100, 0, 0, 0),
(80463, 17, -9634.51, 650.732, 38.6521, 100, 0, 0, 0),
(80463, 18, -9631.16, 648.651, 38.6521, 100, 0, 0, 0),
(80463, 19, -9627.21, 647.762, 38.6521, 100, 0, 0, 0);

-- add stormwind guard 80455 waypoints
UPDATE `creature` SET `position_x` = -9635.84, `position_y` = 670.504, `position_z` = 52.5756, `movement_type` = 2 WHERE `guid` = 80455;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(80455, 1, -9635.84, 670.504, 52.5756, 100, 0, 0, 0),
(80455, 2, -9638.48, 662.928, 52.5756, 100, 0, 0, 0),
(80455, 3, -9638.7, 658.931, 52.5756, 100, 0, 0, 0),
(80455, 4, -9633.14, 654.6, 50.4932, 100, 0, 0, 0),
(80455, 5, -9629.9, 653.253, 48.5795, 100, 0, 0, 0),
(80455, 6, -9626.23, 652.409, 47.474, 100, 0, 0, 0),
(80455, 7, -9622.63, 652.93, 47.4739, 100, 0, 0, 0),
(80455, 8, -9620.84, 656.479, 47.4739, 100, 0, 0, 0),
(80455, 9, -9619.6, 660.315, 47.4739, 100, 0, 0, 0),
(80455, 10, -9616.38, 667.677, 47.4739, 100, 0, 0, 0),
(80455, 11, -9614.46, 671.513, 47.4739, 100, 0, 0, 0),
(80455, 12, -9611.32, 678.789, 47.4739, 100, 0, 0, 0),
(80455, 13, -9609.55, 682.391, 47.4739, 100, 0, 0, 0),
(80455, 14, -9615.16, 687.424, 48.6381, 100, 0, 0, 0),
(80455, 15, -9618.63, 688.961, 50.707, 100, 0, 0, 0),
(80455, 16, -9621.95, 690.225, 52.5753, 100, 0, 0, 0),
(80455, 17, -9625.85, 689.829, 52.5756, 100, 0, 0, 0),
(80455, 18, -9630.21, 683.398, 52.5756, 100, 0, 0, 0),
(80455, 19, -9631.69, 679.623, 52.5756, 100, 0, 0, 0),
(80455, 20, -9634.94, 672.239, 52.5756, 100, 0, 0, 0);

-- add stormwind guard 80444 waypoints
UPDATE `creature` SET `position_x` = -9628.23, `position_y` = 648.636, `position_z` = 62.7332, `movement_type` = 2 WHERE `guid` = 80444;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(80444, 1, -9628.23, 648.636, 62.7332, 100, 0, 0, 0),
(80444, 2, -9635.62, 651.89, 62.7336, 100, 0, 0, 0),
(80444, 3, -9649.08, 657.328, 62.678, 100, 0, 0, 0),
(80444, 4, -9645.38, 655.816, 62.6891, 100, 0, 0, 0),
(80444, 5, -9637.88, 652.785, 62.7337, 100, 0, 0, 0),
(80444, 6, -9626.8, 647.985, 62.7332, 100, 0, 0, 0),
(80444, 7, -9613.6, 641.953, 62.6781, 100, 0, 0, 0),
(80444, 8, -9620.9, 645.289, 62.7328, 100, 0, 0, 0);

-- add stormwind guard 80462 waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 80462;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(80462, 1, -9621.15, 693.24, 62.7332, 100, 0, 0, 0),
(80462, 2, -9631.31, 697.477, 62.678, 100, 0, 0, 0),
(80462, 3, -9623.89, 694.383, 62.7337, 100, 0, 0, 0),
(80462, 4, -9616.57, 691.015, 62.733, 100, 0, 0, 0),
(80462, 5, -9609.09, 688.021, 62.7326, 100, 0, 0, 0),
(80462, 6, -9596.61, 682.74, 62.6781, 100, 0, 0, 0),
(80462, 7, -9603.99, 685.945, 62.7327, 100, 0, 0, 0),
(80462, 8, -9611.46, 688.906, 62.7327, 100, 0, 0, 0);

-- add stormwind guard 80484 waypoints
UPDATE `creature` SET `position_x` = -9790.6, `position_y` = 734.172, `position_z` = 33.0179, `movement_type` = 2 WHERE `guid` = 80484;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(80484, 1, -9790.6, 734.172, 33.0179, 100, 0, 0, 0),
(80484, 2, -9780.62, 722.212, 33.017, 100, 0, 0, 0),
(80484, 3, -9780.21, 710.461, 33.1088, 100, 0, 0, 0),
(80484, 4, -9786.44, 700.557, 33.0353, 100, 0, 0, 0),
(80484, 5, -9798.45, 695.196, 33.112, 100, 2000, 0, 0),
(80484, 6, -9790.79, 697.754, 33.0282, 100, 0, 0, 0),
(80484, 7, -9782.18, 705.72, 33.0731, 100, 0, 0, 0),
(80484, 8, -9779.61, 717.149, 33.0392, 100, 0, 0, 0),
(80484, 9, -9780.62, 722.212, 33.017, 100, 0, 0, 0),
(80484, 10, -9787.31, 731.866, 33.0451, 100, 0, 0, 0),
(80484, 11, -9801.2, 734.852, 33.1115, 100, 0, 0, 0),
(80484, 12, -9812.29, 729.431, 33.089, 100, 0, 0, 0),
(80484, 13, -9818.15, 718.665, 33.1132, 100, 0, 0, 0),
(80484, 14, -9815.6, 706.033, 33.1109, 100, 0, 0, 0),
(80484, 15, -9813.02, 701.892, 33.1128, 100, 2000, 0, 0),
(80484, 16, -9818.41, 712.983, 33.0263, 100, 0, 0, 0),
(80484, 17, -9815.06, 725.226, 33.1132, 100, 0, 0, 0),
(80484, 18, -9806.01, 733.877, 33.1115, 100, 0, 0, 0);

-- add missing guard
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(80473, 1423, 0, 0, 0, 0, 0, 0, -9611.2, 637.101, 51.6805, 0.887339, 285, 285, 1, 100, 0, 1, 0, 0, 0, 10);

-- npc's should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 1 WHERE `guid` IN (80464, 80465, 80443, 80447, 80460, 80461, 80456, 80458, 80446, 80457, 80486);

-- goldshire
-- update waypoints for bo
DELETE FROM creature_movement WHERE id = 80320;
DELETE FROM creature_movement_template WHERE entry = 797;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(797, 1, -9425.55, 129.192, 59.5418, 100, 38000, 7, 8032001),
(797, 2, -9442.73, 135.681, 58.3425, 100, 0, 0, 0),
(797, 3, -9446.76, 132.807, 58.745, 100, 0, 0, 0),
(797, 4, -9452.98, 129.175, 58.9913, 100, 0, 0, 0),
(797, 5, -9457.24, 125.796, 59.014, 100, 0, 0, 0),
(797, 6, -9463.49, 121.757, 58.6251, 100, 0, 0, 0),
(797, 7, -9464.32, 118.82, 58.0714, 100, 0, 0, 0),
(797, 8, -9464.71, 116.082, 57.9214, 100, 0, 0, 0),
(797, 9, -9464.12, 107.346, 57.5387, 100, 0, 0, 0),
(797, 10, -9461.14, 95.8617, 58.3268, 100, 44000, 3, 0),
(797, 11, -9464.12, 107.346, 57.5387, 100, 0, 0, 0),
(797, 12, -9464.71, 116.082, 57.9214, 100, 0, 0, 0),
(797, 13, -9464.32, 118.82, 58.0714, 100, 0, 0, 0),
(797, 14, -9463.49, 121.757, 58.6251, 100, 0, 0, 0),
(797, 15, -9457.24, 125.796, 59.014, 100, 0, 0, 0),
(797, 16, -9452.98, 129.175, 58.9913, 100, 0, 0, 0),
(797, 17, -9446.76, 132.807, 58.745, 100, 0, 0, 0),
(797, 18, -9442.73, 135.681, 58.3425, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8032001, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bo - Run');

-- npc's should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 7 WHERE `guid` IN (80317, 80321);
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 0.5 WHERE `guid` IN (79905, 79909, 79908, 79910);
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 1 WHERE `guid` = 80292;

-- add missing text to innkeeper farley
DELETE FROM `creature_ai_scripts` WHERE `id`=29501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (29501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 84, 85, 0, 0, 0, 0, 0, 0, 'Innkeeper Farley - Say Text');

-- add waypoints and scripts to matt
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 794;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(794, 1, -9387.13, -117.859, 58.862, 2.818, 3597000, 0, 79401),
(794, 2, -9383.68, -114.327, 58.8469, 100, 0, 0, 0),
(794, 3, -9380.77, -110.285, 58.8178, 100, 0, 0, 0),
(794, 4, -9378.45, -104.929, 60.5617, 100, 0, 0, 0),
(794, 5, -9388.37, -91.1196, 63.2423, 100, 0, 0, 0),
(794, 6, -9418.03, -87.5691, 60.0556, 100, 0, 0, 0),
(794, 7, -9421.72, -81.2192, 60.4194, 100, 0, 0, 0),
(794, 8, -9423.2, -53.2072, 63.5551, 100, 0, 0, 0),
(794, 9, -9420.56, -37.2724, 62.9432, 100, 0, 0, 0),
(794, 10, -9422.44, -21.2467, 62.0099, 100, 0, 0, 0),
(794, 11, -9432.84, 15.3516, 59.0447, 100, 0, 0, 0),
(794, 12, -9433.96, 52.9096, 56.3998, 100, 0, 0, 0),
(794, 13, -9437.53, 63.9734, 56.3863, 100, 0, 0, 0),
(794, 14, -9433.31, 76.173, 56.1534, 100, 0, 0, 0),
(794, 15, -9421.61, 95.8219, 57.8012, 100, 0, 0, 0),
(794, 16, -9410.34, 117.386, 60.4114, 100, 0, 0, 0),
(794, 17, -9410.93, 130.485, 59.4201, 100, 0, 0, 0),
(794, 18, -9420.29, 146.493, 57.5605, 100, 0, 0, 0),
(794, 19, -9430.31, 151.226, 55.5763, 100, 900000, 0, 79402),
(794, 20, -9426.91, 144.703, 57.4634, 100, 0, 0, 0),
(794, 21, -9413.45, 125.26, 59.7663, 100, 0, 0, 0),
(794, 22, -9404.68, 114.129, 60.4918, 100, 0, 0, 0),
(794, 23, -9402.83, 103.103, 59.0547, 100, 0, 0, 0),
(794, 24, -9418.24, 85.2314, 56.7479, 100, 0, 0, 0),
(794, 25, -9434.07, 71.3512, 56.1786, 100, 0, 0, 0),
(794, 26, -9439.36, 64.1234, 56.2029, 100, 0, 0, 0),
(794, 27, -9437.39, 53.4107, 56.0962, 100, 0, 0, 0),
(794, 28, -9427.39, 38.3134, 57.1306, 100, 0, 0, 0),
(794, 29, -9418.42, 26.2133, 58.0576, 100, 0, 0, 0),
(794, 30, -9401.25, 4.77202, 60.2208, 100, 0, 0, 0),
(794, 31, -9392.87, -4.30769, 60.91, 100, 0, 0, 0),
(794, 32, -9380.95, -17.9289, 62.2038, 100, 0, 0, 0),
(794, 33, -9360.5, -37.7572, 64.222, 100, 0, 0, 0),
(794, 34, -9356, -50.1369, 65.8597, 100, 0, 0, 0),
(794, 35, -9356.07, -60.5225, 66.4481, 100, 0, 0, 0),
(794, 36, -9358.77, -73.3921, 64.9128, 100, 0, 0, 0),
(794, 37, -9371.97, -90.3814, 64.1589, 100, 0, 0, 0),
(794, 38, -9377.91, -101.176, 61.7324, 100, 0, 0, 0),
(794, 39, -9379.77, -110.074, 58.8343, 100, 0, 0, 0),
(794, 40, -9383.17, -114.531, 58.8394, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (79401, 3594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 894, 0, 0, 0, 0, 0, 0, 0, 0, 'Matt - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (79402, 873, 0, 0, 0, 0, 0, 0, 0, 0, 0, 893, 0, 0, 0, 0, 0, 0, 0, 0, 'Matt - Say Text');

-- add clara charles ambush event
UPDATE creature_movement SET `position_x` = -9215.99, `position_y` = 364.038, `position_z` = 72.1662, `script_id` = 591701, `waittime` = 11000 WHERE `id` = 79881 AND `point` = 6;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (591701, 0, 39, 591701, 591702, 0, 0, 0, 0, 0, 0, 35, 35, 0, 0, 0, 0, 0, 0, 0, 'Clara Charles - Summon Defias Ambusher');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (591701, 0, 10, 583, 27000, 0, 0, 0, 0, 0, 0, 1, 58301, 6, 4, -9228.46, 340.316, 73.8243, 0, 0, 'Clara Charles - Summon Defias Ambusher');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (58301, 0, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 58301, 0, 0, 0, 0, 0, 0, 0, 'Defias Ambusher - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(58301, 1, -9228.46, 340.316, 73.8243, 100, 2000, 0, 0),
(58301, 2, -9219.99, 347.96, 73.9481, 100, 0, 0, 0),
(58301, 3, -9217.71, 362.5, 72.1445, 100, 3000, 0, 0),
(58301, 4, -9219.24, 368.871, 72.4996, 100, 5000, 0, 0),
(58301, 5, -9218.29, 356.559, 72.7523, 100, 0, 0, 0),
(58301, 6, -9220.93, 337.276, 73.3947, 100, 0, 0, 0),
(58301, 7, -9228.5, 309.567, 74.4148, 100, 0, 0, 0),
(58301, 8, -9229.13, 304.239, 74.4127, 100, 0, 0, 0),
(58301, 9, -9238.92, 305.596, 74.2677, 100, 2000, 0, 0);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (591702, 0, 10, 583, 28000, 0, 0, 0, 0, 0, 0, 1, 58302, 6, 4, -9231.07, 358.854, 73.7231, 0, 0, 'Clara Charles - Summon Defias Ambusher');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (58302, 0, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 58302, 0, 0, 0, 0, 0, 0, 0, 'Defias Ambusher - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(58302, 1, -9231.07, 358.854, 73.7231, 100, 2000, 0, 0),
(58302, 2, -9218.56, 364.569, 72.1008, 100, 3000, 0, 0),
(58302, 3, -9220.06, 367.568, 72.3202, 100, 5000, 0, 0),
(58302, 4, -9225.81, 367.491, 72.543, 100, 0, 0, 0),
(58302, 5, -9244.6, 368.092, 75.1086, 100, 0, 0, 0),
(58302, 6, -9268.99, 377.365, 78.1787, 100, 0, 0, 0),
(58302, 7, -9288.57, 386.671, 76.7691, 100, 0, 0, 0),
(58302, 8, -9295.63, 392.504, 76.2484, 100, 0, 0, 0),
(58302, 9, -9300.58, 404.784, 74.2369, 100, 2000, 0, 0);

-- add stormwind guard 79861 waypoints
UPDATE `creature` SET `position_x` = -9073.3, `position_y` = 427.18, `position_z` = 93.0558, `movement_type` = 2 WHERE `guid` = 79861;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79861, 1, -9073.3, 427.18, 93.0558, 100, 0, 0, 0),
(79861, 2, -9086.64, 417.472, 92.2924, 100, 0, 0, 0),
(79861, 3, -9120.96, 394.504, 92.0548, 100, 0, 0, 0),
(79861, 4, -9142.03, 376.161, 90.6847, 100, 0, 0, 0),
(79861, 5, -9165.44, 351.636, 87.3068, 100, 2000, 0, 0),
(79861, 6, -9142.03, 376.161, 90.6847, 100, 0, 0, 0),
(79861, 7, -9120.96, 394.504, 92.0548, 100, 0, 0, 0),
(79861, 8, -9086.64, 417.472, 92.2924, 100, 0, 0, 0),
(79861, 9, -9079.49, 425.134, 92.5005, 100, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
