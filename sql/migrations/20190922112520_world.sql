DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190922112520');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190922112520');
-- Add your query below.


-- Waypoints for Aedis Brom.
UPDATE `creature` SET `MovementType`=2 WHERE `id`=1478;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(1478, 1, -8605.97, 388.41, 102.925, 1000, 0, 147801, 0, 0, 0, 0, 0, 0, 0, 5.41052, 0, 0),
(1478, 2, -8605.97, 388.41, 102.925, 510000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.41052, 0, 0),
(1478, 3, -8605.97, 388.41, 102.925, 0, 0, 147803, 0, 0, 0, 0, 0, 0, 0, 5.41052, 0, 0),
(1478, 4, -8619.11, 396.418, 102.924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 5, -8624.07, 402.271, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 6, -8618.96, 407.582, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 7, -8628.49, 419.494, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 8, -8633.94, 415.62, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 9, -8639.85, 422.151, 102.486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 10, -8641.91, 425.36, 102.116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 11, -8642.04, 433.62, 101.397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 12, -8634.33, 443.463, 102.205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 13, -8633.34, 457.181, 102.209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 14, -8634.88, 461.135, 102.14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 15, -8639.39, 468.993, 102.394, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 16, -8643.08, 475.582, 102.509, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 17, -8642.71, 481.052, 102.505, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 18, -8611.65, 505.545, 103.317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 19, -8612.51, 512.689, 103.485, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 20, -8620.32, 521.592, 102.651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 21, -8641.88, 540.074, 98.971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 22, -8653.58, 552.629, 96.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 23, -8669.66, 554.005, 97.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 24, -8681.91, 546.389, 97.565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 25, -8692.59, 535.823, 97.832, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 26, -8708.98, 522.739, 97.554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 27, -8716.12, 522.891, 97.667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 28, -8723.47, 532.603, 100.014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 29, -8733.85, 544.522, 101.128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 30, -8744.44, 556.232, 97.969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 31, -8746.56, 563.747, 97.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 32, -8732.54, 579.483, 97.538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 33, -8723.48, 588.56, 98.356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 34, -8719.3, 592.065, 98.585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 35, -8709.3, 595.071, 98.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 36, -8703.52, 610.574, 99.584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 37, -8705.09, 627.019, 100.458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 38, -8707.94, 641.164, 100.098, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 39, -8710.98, 650.804, 99.574, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 40, -8724.55, 675.962, 98.654, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 41, -8730.08, 690.844, 98.716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 42, -8736.22, 699.464, 98.707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 43, -8748.8, 690.708, 99.971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 44, -8764.58, 678.348, 102.055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 45, -8773.76, 671.431, 103.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 46, -8779.56, 672.414, 103.028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 47, -8785.4, 679.026, 102.464, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 48, -8791.5, 676.587, 101.993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 49, -8793.39, 673.203, 101.629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 50, -8795.58, 665.523, 99.469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 51, -8798.59, 656.958, 95.44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 52, -8799.47, 651.866, 94.56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 53, -8798.43, 645.74, 94.379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 54, -8797.65, 638.005, 94.228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 55, -8821.77, 617.457, 94.699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 56, -8809.73, 605.011, 96.118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 57, -8800.16, 592.671, 97.39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 58, -8793.07, 590.792, 97.604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 59, -8772.77, 606.148, 97.146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 60, -8767.54, 606.199, 96.921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 61, -8757.06, 595.237, 97.21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 62, -8741.21, 578.752, 97.494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 63, -8740.24, 572.477, 97.396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 64, -8746.33, 565.161, 97.398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 65, -8743.6, 555.159, 98.345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 66, -8727.63, 537.786, 100.846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 67, -8716.49, 522.971, 97.708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 68, -8716.59, 517.261, 96.878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 69, -8719.88, 513.758, 96.676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 70, -8720.37, 509.626, 96.455, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 71, -8713.79, 501.283, 95.831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 72, -8695.82, 478.32, 95.322, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 73, -8696.65, 471.814, 95.427, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 74, -8708.09, 461.192, 96.381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 75, -8710.55, 458.533, 96.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 76, -8716.31, 451.601, 97.134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 77, -8718.78, 438.803, 97.103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 78, -8722.71, 422.538, 97.855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 79, -8727.03, 413.992, 97.453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 80, -8724.7, 407.017, 97.639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 81, -8715.01, 405.357, 98.109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 82, -8693.77, 397.442, 101.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 83, -8677.97, 400.221, 102.99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 84, -8660.54, 413.082, 102.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 85, -8648.46, 423.018, 101.759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 86, -8640.67, 423.029, 102.126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 87, -8634.95, 415.618, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 88, -8639.63, 411.121, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 89, -8630.76, 399.438, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 90, -8624.98, 401.716, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 91, -8623.15, 401.202, 103.702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 92, -8620.15, 398.061, 102.924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 93, -8616.57, 400.041, 102.924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1478, 94, -8606.97, 388.687, 102.924, 1000, 0, 147894, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1478, 95, -8606.97, 388.687, 102.924, 0, 0, 147895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Waypoint scripts for Aedis Brom.
DELETE FROM `creature_movement_scripts` WHERE `id`=147801;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147801, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Remove Equipment');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147801, 0, 19, 0, 0, 0, 0, 79753, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cristoph Faral - Remove Equipment');
DELETE FROM `creature_movement_scripts` WHERE `id`=147803;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 431, 0, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147803, 0, 78, 1, 0, 0, 0, 79753, 0, 9, 2, 0, 0, 0, 0, 1.1, 0, 0, 1.57, 0, 'Christoph Faral - Join Creature Group');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147803, 0, 19, 1, 0, 0, 0, 79753, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Christoph Faral - Set Equipment');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147803, 0, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Set Equipment');
DELETE FROM `creature_movement_scripts` WHERE `id`=147894;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147894, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Disband Creature Group');
DELETE FROM `creature_movement_scripts` WHERE `id`=147895;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147895, 0, 3, 0, 0, 322, 2, 79753, 0, 9, 2, 0, 0, 0, 0, -8607.49, 387.326, 102.926, 5.39307, 0, 'Christoph Faral - Move Point');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147895, 1, 0, 0, 0, 0, 0, 79753, 0, 9, 2, 432, 0, 0, 0, 0, 0, 0, 0, 0, 'Christoph Faral - Say Text');

-- Events list for Aedis Brom
DELETE FROM `creature_ai_events` WHERE `creature_id`=1478;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (147801, 1478, 458, 10, 0, 100, 1, 1, 50, 3000, 3000, 147801, 0, 0, 'Love is in the Air Event - Cast Love aura and turn on gossip NPC_FLAG');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (147802, 1478, 0, 1, 0, 100, 1, 60000, 150000, 60000, 150000, 147802, 0, 0, 'Aedis Brom - Say Text OOC');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001086);
DELETE FROM `creature_ai_scripts` WHERE `id`=147801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147801, 0, 15, 27741, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Cast Spell Love is in the Air');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147801, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Add Flag 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=147802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147802, 0, 39, 147807, 147808, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Start Script to Say Text');
DELETE FROM `event_scripts` WHERE `id`=147801;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 399, 400, 401, 402, 0, 0, 0, 0, 0, 'Aedis Brom and Christoph Faral - Say First Line - Part 1');
DELETE FROM `event_scripts` WHERE `id`=147802;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 403, 405, 406, 407, 0, 0, 0, 0, 0, 'Aedis Brom and Christoph Faral - Say First Line - Part 2');
DELETE FROM `event_scripts` WHERE `id`=147803;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 408, 409, 410, 411, 0, 0, 0, 0, 0, 'Aedis Brom and Christoph Faral - Say Second Line - Part 1');
DELETE FROM `event_scripts` WHERE `id`=147804;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 413, 414, 415, 416, 0, 0, 0, 0, 0, 'Aedis Brom and Christoph Faral - Say Second Line - Part 2');
DELETE FROM `event_scripts` WHERE `id`=147805;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 417, 418, 419, 420, 0, 0, 0, 0, 0, 'Aedis Brom and Christoph Faral - Say Third Line - Part 1');
DELETE FROM `event_scripts` WHERE `id`=147806;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 421, 422, 423, 424, 0, 0, 0, 0, 0, 'Aedis Brom and Christoph Faral - Say Third Line - Part 2');
DELETE FROM `event_scripts` WHERE `id`=147807;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147807, 0, 39, 147801, 147802, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Start Script to Say Line 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147807, 2, 39, 147803, 147804, 0, 0, 79753, 0, 9, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Christoph Faral - Start Script to Say Line 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147807, 4, 39, 147805, 147806, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Start Script to Say Line 3');
DELETE FROM `event_scripts` WHERE `id`=147808;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147808, 0, 39, 147801, 147802, 0, 0, 79753, 0, 9, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Christoph Faral - Start Script to Say Line 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147808, 2, 39, 147803, 147804, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Aedis Brom - Start Script to Say Line 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (147808, 4, 39, 147805, 147806, 0, 0, 79753, 0, 9, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Christoph Faral - Start Script to Say Line 3');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
