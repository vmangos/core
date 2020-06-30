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
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (58301, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 58301, 0, 0, 0, 0, 0, 0, 0, 'Defias Ambusher - Start Waypoints');
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
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (58302, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 58302, 0, 0, 0, 0, 0, 0, 0, 'Defias Ambusher - Start Waypoints');
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

-- tower of azora
-- npc's should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 1 WHERE `guid` IN (80928, 80936, 80929, 80924, 80926, 80925, 80931);

-- add servant of azora 80927 waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 80927;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(80927, 1, -9554.81, -706.766, 90.4123, 100, 0, 0, 0),
(80927, 2, -9559.78, -705.204, 90.4257, 100, 0, 0, 0),
(80927, 3, -9567.61, -707.474, 90.422, 100, 0, 0, 0),
(80927, 4, -9573.15, -714.011, 90.4237, 100, 0, 0, 0),
(80927, 5, -9573.83, -722.376, 90.4257, 100, 0, 0, 0),
(80927, 6, -9569.41, -729.787, 90.4263, 100, 0, 0, 0),
(80927, 7, -9557.52, -734.085, 90.4258, 100, 0, 0, 0),
(80927, 8, -9549.81, -728.635, 90.4258, 100, 0, 0, 0),
(80927, 9, -9546.45, -720.288, 90.4259, 100, 0, 0, 0),
(80927, 10, -9548.53, -712.153, 90.4209, 100, 0, 0, 0);

-- add stormwind guard 81362 waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 81362;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81362, 1, -9799.68, -1403.43, 62.7097, 100, 0, 0, 0),
(81362, 2, -9797.08, -1395.84, 62.7891, 100, 0, 0, 0),
(81362, 3, -9789.32, -1386.82, 62.7207, 100, 0, 0, 0),
(81362, 4, -9776.63, -1383.53, 62.7928, 100, 2000, 0, 0),
(81362, 5, -9784.66, -1384.44, 62.7101, 100, 0, 0, 0),
(81362, 6, -9793.97, -1391.36, 62.749, 100, 0, 0, 0),
(81362, 7, -9797.87, -1398.13, 62.7751, 100, 0, 0, 0),
(81362, 8, -9798.26, -1409.72, 62.735, 100, 0, 0, 0),
(81362, 9, -9794.25, -1416.94, 62.7356, 100, 0, 0, 0),
(81362, 10, -9784.03, -1422.15, 62.6837, 100, 0, 0, 0),
(81362, 11, -9771.84, -1421.92, 62.6979, 100, 0, 0, 0),
(81362, 12, -9761.87, -1408.17, 62.7735, 100, 0, 0, 0),
(81362, 13, -9763.66, -1392.01, 62.7932, 100, 2000, 0, 0),
(81362, 14, -9762.63, -1412.12, 62.793, 100, 0, 0, 0),
(81362, 15, -9775.93, -1422.36, 62.6859, 100, 0, 0, 0),
(81362, 16, -9787.56, -1421.32, 62.6966, 100, 0, 0, 0),
(81362, 17, -9794.25, -1416.94, 62.7356, 100, 0, 0, 0),
(81362, 18, -9798.88, -1406.96, 62.6995, 100, 0, 0, 0);

-- add stormwind guard 81365 waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 81365;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81365, 1, -9776.59, -1394.81, 97.8873, 100, 60000, 0, 0),
(81365, 2, -9788.5, -1399.94, 97.8873, 4.34587, 60000, 0, 0),
(81365, 3, -9783.52, -1412.02, 97.8873, 100, 60000, 0, 0),
(81365, 4, -9771.3, -1406.96, 97.8868, 1.16937, 60000, 0, 0);



-- eastvale logging camp
-- remove old scripts and waypoints
DELETE FROM `creature_template_addon` WHERE `entry` = 11328;
DELETE FROM `creature_addon` WHERE `guid` IN (81252, 81249, 81348, 81349, 81250);
DELETE FROM `creature_movement` WHERE `id` IN (81252, 81249, 81348, 81349, 81250);
DELETE FROM `creature_movement_scripts` WHERE `id` IN (8125001, 8125002, 8125003, 8125204, 8125208, 8125209, 8124901, 8124904, 8124905, 8134805, 8134810, 8134811, 8134902, 8134906, 8134907);
UPDATE `creature` SET `movement_type` = 0, `wander_distance` = 0  WHERE `guid` IN (81252, 81249, 81348, 81349, 81250);


-- add corect positions
UPDATE `creature` SET `position_x` = -9535.65, `position_y` = -1329.81, `position_z` = 47.3419, `orientation` = 1.939 WHERE `guid` = 81252;
UPDATE `creature` SET `position_x` = -9529.32, `position_y` = -1323.67, `position_z` = 45.9509, `orientation` = 2.70945 WHERE `guid` = 81249;
UPDATE `creature` SET `position_x` = -9535.3, `position_y` = -1304.7, `position_z` = 44.702, `orientation` = 5.28088 WHERE `guid` = 81348;
UPDATE `creature` SET `position_x` = -9501.6, `position_y` = -1282.86, `position_z` = 43.6379, `orientation` = 6.01566 WHERE `guid` = 81349;
UPDATE `creature` SET `position_x` = -9523.21, `position_y` = -1290.25, `position_z` = 44.1174, `orientation` = 5.23877 WHERE `guid` = 81250;


-- eastvale peasant 81252
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE 'entry' = 11328;

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (8125201, 11328, 8125201, 1, 0, 100, 1, 0, 0, 255000, 255000, 8125201, 0, 0, 'Westfall Worker 81252 - Start Waypoints OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 81252, 0, 0, 0, 0, 0, 0, 0, 0, 'Westfall Worker 81252 - Start Waypoints');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8125201, 52, 81252, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (8125202, 11328, 8125201, 1, 0, 100, 0, 0, 0, 0, 0, 8125202, 0, 0, 'Westfall Worker 81252 - Start ChopWood Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125202, 0, 68, 8125201, 2, 11328, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Westfall Worker 81252 - SSFA Eastvale Peasant');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 0, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Westfall Worker - ChopWood Emote - Started by Event 8125202');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81252, 1, -9535.65, -1329.81, 47.272, 100, 6000, 0, 8125201),
(81252, 2, -9508.88, -1333.61, 44.3237, 100, 0, 0, 0),
(81252, 3, -9498.48, -1327.6, 42.0789, 100, 0, 0, 0),
(81252, 4, -9478.76, -1307.33, 42.1843, 100, 0, 0, 0),
(81252, 5, -9466.71, -1296.88, 41.4483, 100, 2000, 0, 8125202),
(81252, 6, -9470.67, -1295.27, 41.0593, 100, 0, 0, 0),
(81252, 7, -9471.37, -1289.82, 41.1039, 100, 10000, 0, 8125203),
(81252, 8, -9497.14, -1325.79, 41.7219, 100, 0, 0, 0),
(81252, 9, -9511.88, -1333.19, 44.8482, 100, 0, 0, 0),
(81252, 10, -9523.05, -1335.57, 46.8005, 100, 0, 0, 0),
(81252, 11, -9532.64, -1333.36, 47.621, 100, 0, 0, 0),
(81252, 12, -9535.65, -1329.81, 47.272, 100, 6000, 0, 8125204);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Emote None');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125202, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 1, 16, 6289, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound -  What');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 1, 35, 0, 0, 0, 0, 81251, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Face Target');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 2, 16, 6288, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound - More Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 4, 39, 1061601, 0, 0, 0, 81251, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Start Script Supervisor Raelene');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 8, 16, 6242, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound - No One Else Available');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 9, 39, 8125001, 0, 0, 0, 81348, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Start Script Eastvale Peasant 81250');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125204, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.939, 0, 'Eastvale Peasant 81252 - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125204, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Emote ChopWood');


-- eastvale peasant 81348
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125001, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 81348, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Start Waypoints - Started by Eastvale Peasant 81252');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81348, 1, -9535.3, -1304.7, 44.6066, 100, 6000, 0, 8134801),
(81348, 2, -9525.24, -1286.03, 43.7736, 100, 0, 0, 0),
(81348, 3, -9502.34, -1283.87, 43.5437, 100, 0, 0, 0),
(81348, 4, -9472.02, -1296.85, 41.1791, 100, 0, 0, 0),
(81348, 5, -9466.69, -1296.88, 41.4499, 100, 2000, 0, 8134802),
(81348, 6, -9468.66, -1297.33, 41.4075, 100, 0, 0, 0),
(81348, 7, -9471.09, -1294.93, 41.0424, 100, 0, 0, 0),
(81348, 8, -9471.72, -1289.99, 41.0953, 100, 10000, 0, 8134803),
(81348, 9, -9497.3, -1284.53, 42.9337, 100, 0, 0, 0),
(81348, 10, -9523.47, -1284.09, 43.8342, 100, 0, 0, 0),
(81348, 11, -9535.18, -1301.59, 44.4283, 100, 0, 0, 0),
(81348, 12, -9535.3, -1304.7, 44.6075, 100, 6000, 0, 8134804);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134801, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Emote None');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134801, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134802, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 1, 35, 0, 0, 0, 0, 81251, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Face Target');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 1, 16, 6288, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Play Sound - More Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 4, 39, 1061601, 0, 0, 0, 81251, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Start Script Supervisor Raelene');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 8, 16, 6284, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Play Sound - Right O');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 10, 39, 8124901, 0, 0, 0, 81249, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Start Script Eastvale Peasant 81249');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134804, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.939, 0, 'Eastvale Peasant 81348 - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134804, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Emote ChopWood');


-- eastvale peasant 81249
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124901, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 81249, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Start Waypoints - Started by Eastvale Peasant 81348');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81249, 1, -9529.32, -1323.67, 45.7866, 100, 6000, 0, 8124901),
(81249, 2, -9520, -1331.45, 45.9187, 100, 0, 0, 0),
(81249, 3, -9514.88, -1332.6, 45.299, 100, 0, 0, 0),
(81249, 4, -9496.5, -1323.7, 41.4285, 100, 0, 0, 0),
(81249, 5, -9466.73, -1296.88, 41.4469, 100, 2000, 0, 8124902),
(81249, 6, -9468.69, -1297.31, 41.4041, 100, 0, 0, 0),
(81249, 7, -9470.94, -1295.14, 41.0533, 100, 0, 0, 0),
(81249, 8, -9471.44, -1289.93, 41.097, 100, 10000, 0, 8124903),
(81249, 9, -9494.73, -1320.24, 40.9404, 100, 0, 0, 0),
(81249, 10, -9514.85, -1332.59, 45.2935, 100, 0, 0, 0),
(81249, 11, -9525.68, -1325.85, 45.8462, 100, 0, 0, 0),
(81249, 12, -9529.32, -1323.67, 45.7879, 100, 6000, 0, 8124904);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124901, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Emote None');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124901, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124902, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 1, 35, 0, 0, 0, 0, 81251, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Face Target');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 1, 16, 6290, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Play Sound - Ready to Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 4, 39, 1061601, 0, 0, 0, 81251, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Start Script Supervisor Raelene');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 8, 16, 6285, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Play Sound - AlRight');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 9, 16, 6286, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Play Sound - Off I go Then');
-- INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 10, 39, 8124901, 0, 0, 0, 81249, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Start Script Eastvale Peasant 81249');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124904, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.70945, 0, 'Eastvale Peasant 81249 - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124904, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Emote ChopWood');




















-- supervisor raelen scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1061601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6891, 6892, 6890, 0, 0, 0, 0, 0, 0, 'Supervisor Raelen - Speak');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1061601, 2, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Supervisor Raelen - Emote Point');




-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
