DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190105170048');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190105170048');
-- Add your query below.


-- Assign script to quest.
UPDATE `quest_template` SET `StartScript`=836 WHERE `entry`=836;

-- Escort Conditions Source 60 Yards
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1014, 25, 1, 60, 0, 0, 0);

-- Waypoints
DELETE FROM `script_waypoint` WHERE `entry`=7806;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(7806, 1, 495.404, -3478.35, 114.837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 2, 492.705, -3486.11, 108.627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 3, 487.25, -3485.76, 107.89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 4, 476.852, -3489.88, 99.985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 5, 467.212, -3493.36, 99.819, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 6, 460.017, -3496.98, 104.481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 7, 439.619, -3500.73, 110.534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 8, 428.326, -3495.87, 118.662, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 9, 424.664, -3489.38, 121.999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 10, 424.137, -3470.95, 124.333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 11, 421.791, -3449.24, 119.126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 12, 404.247, -3429.38, 117.644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 13, 335.465, -3430.72, 116.456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 14, 317.16, -3426.71, 116.226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 15, 331.18, -3464, 117.143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 16, 336.394, -3501.88, 118.201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 17, 337.251, -3544.76, 117.284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 18, 337.749, -3565.42, 116.797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 19, 336.011, -3597.36, 118.225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 20, 324.619, -3622.88, 119.811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 21, 308.027, -3648.6, 123.047, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 22, 276.325, -3685.74, 128.356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 23, 239.981, -3717.33, 131.874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 24, 224.951, -3730.17, 132.125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 25, 198.708, -3768.29, 129.42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 26, 183.758, -3791.07, 128.045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 27, 178.111, -3801.58, 128.37, 3000, 780627, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7806, 28, 162.215, -3827.01, 129.424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 29, 141.665, -3864.52, 131.419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 30, 135.302, -3880.09, 132.12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 31, 122.461, -3910.07, 135.605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 32, 103.376, -3937.73, 137.342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 33, 81.4145, -3958.61, 138.469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 34, 55.3781, -3982, 136.52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 35, 13.9831, -4013.95, 126.903, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 36, -21.658, -4048.71, 118.068, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 37, -52.4431, -4081.21, 117.477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 38, -102.711, -4116.76, 118.666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 39, -92.9962, -4135.85, 119.31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 40, -86.3913, -4153.33, 122.502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 41, -85.7461, -4163.6, 121.892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 42, -90.544, -4183.58, 117.587, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 43, -110.224, -4205.86, 121.878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 44, -115.258, -4211.96, 121.878, 3000, 780644, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7806, 45, -128.595, -4233.34, 117.766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 46, -135.359, -4258.12, 117.562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 47, -156.832, -4258.96, 120.059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 48, -167.12, -4274.1, 117.062, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 49, -176.291, -4287.59, 118.721, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 50, -196.993, -4315.82, 117.588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 51, -209.329, -4331.67, 115.142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 52, -232.292, -4356.02, 108.543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 53, -232.16, -4370.9, 102.815, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 54, -210.271, -4389.9, 84.167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 55, -187.94, -4407.53, 70.987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 56, -181.354, -4418.77, 64.778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 57, -170.53, -4440.44, 58.943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 58, -141.429, -4465.32, 45.963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 59, -120.994, -4487.09, 32.075, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 60, -104.135, -4501.84, 25.051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 61, -84.1547, -4529.44, 11.952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 62, -88.6989, -4544.63, 9.055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 63, -100.603, -4575.03, 11.388, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 64, -106.909, -4600.41, 11.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7806, 65, -106.832, -4620.5, 11.057, 5000, 780665, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Waypoint Scripts
DELETE FROM `creature_movement_scripts` WHERE `id`=780627;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3797, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780627, 0, 10, 7808, 60000, 0, 0, 0, 0, 0, 0, 0, 83603, 6, 1, 143.336, -3849.527, 130.52, 1, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Summon Marauding Owl 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780627, 0, 10, 7808, 60000, 0, 0, 0, 0, 0, 0, 0, 83603, 6, 1, 147.95, -3852.233, 130.97, 1, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Summon Marauding Owl 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780627, 0, 10, 7808, 60000, 0, 0, 0, 0, 0, 0, 0, 83603, 6, 1, 152.579, -3854.917, 131.53, 1, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Summon Marauding Owl 3');
DELETE FROM `event_scripts` WHERE `id`=83603;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83603, 0, 3, 0, 0, 3, 2, 0, 0, 0, 0, 1, 0, 0, 0, 202.214, -3765.112, 129.82, 1, 0, 'Rescue OOX-09/HL!: Marauding Owlbeast - Move to Point');
DELETE FROM `creature_movement_scripts` WHERE `id`=780644;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3797, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780644, 0, 10, 7809, 60000, 0, 0, 0, 0, 0, 0, 0, 83604, 6, 1, -147.848, -4289.631, 118.6, 1.2, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Vilebranch Ambusher 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780644, 0, 10, 7809, 60000, 0, 0, 0, 0, 0, 0, 0, 83604, 6, 1, -143.828, -4290.666, 119.64, 1.3, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Vilebranch Ambusher 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780644, 0, 10, 7809, 60000, 0, 0, 0, 0, 0, 0, 0, 83604, 6, 1, -140.905, -4291.569, 120.215, 1.3, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Vilebranch Ambusher 3');
DELETE FROM `event_scripts` WHERE `id`=83604;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83604, 0, 3, 0, 0, 3, 2, 0, 0, 0, 0, 1, 0, 0, 0, -134.238, -4226.133, 117.981, 0, 0, 'Rescue OOX-09/HL!: Vilebranch Ambusher - Move to Point');
DELETE FROM `creature_movement_scripts` WHERE `id`=780665;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780665, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780665, 0, 62, 836, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: End Scripted Map Event');

-- Events list for Homing Robot OOX-09/HL
DELETE FROM `creature_ai_events` WHERE `creature_id`=7806;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780601, 7806, 0, 4, 0, 100, 0, 0, 0, 0, 0, 780601, 0, 0, 'Homing Robot OOX-09/HL - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780602, 7806, 0, 21, 0, 100, 0, 0, 0, 0, 0, 780602, 0, 0, 'Homing Robot OOX-09/HL - Stand Up on Reached Home');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780603, 7806, 0, 1, 1, 100, 1, 3000, 3000, 3000, 3000, 780603, 0, 0, 'Homing Robot OOX-09/HL - Assist Escorting Player (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780604, 7806, 0, 0, 1, 100, 1, 3000, 3000, 3000, 3000, 780603, 0, 0, 'Homing Robot OOX-09/HL - Assist Escorting Player (Phase 1)');
DELETE FROM `creature_ai_scripts` WHERE `id`=780601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3795, 3796, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-09/HL - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=780602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780602, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-09/HL - Stand Up');
DELETE FROM `creature_ai_scripts` WHERE `id`=780603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780603, 0, 72, 0, 0, 0, 0, 836, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-09/HL - Assist Player');

-- Events list for Marauding Owlbeast
DELETE FROM `creature_ai_events` WHERE `creature_id`=7808;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780801, 7808, 0, 2, 0, 100, 1, 30, 0, 120000, 125000, 780801, 0, 0, 'Marauding Owlbeast - Cast Enrage at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780802, 7808, 0, 29, 0, 100, 0, 8, 1, 0, 0, 780802, 0, 0, 'Marauding Owlbeast - Move Random on Reached Point');
DELETE FROM `creature_ai_scripts` WHERE `id`=780802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780802, 0, 20, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Marauding Owlbeast - Move Random');

-- Events list for Vilebranch Ambusher
DELETE FROM `creature_ai_events` WHERE `creature_id`=7809;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780901, 7809, 0, 2, 0, 100, 0, 15, 0, 0, 0, 780901, 0, 0, 'Vilebranch Ambusher - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780902, 7809, 0, 29, 0, 100, 0, 8, 1, 0, 0, 780902, 0, 0, 'Vilebranch Ambusher - Move Random on Reached Point');
DELETE FROM `creature_ai_scripts` WHERE `id`=780902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780902, 0, 20, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Vilebranch Ambusher - Move Random');

-- Script when the quest is accepted.
DELETE FROM `quest_start_scripts` WHERE `id`=836;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 0, 61, 836, 1200, 0, 0, 0, 0, 0, 8, 0, 83602, 1014, 83601, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Stand Up');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3794, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 3, 22, 113, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Set Faction');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 3, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 7806, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (836, 3, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Set Phase to 1');

-- Script when the quest fails.
DELETE FROM `event_scripts` WHERE `id`=83601;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83601, 0, 70, 836, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Fail Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83601, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Reset Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83601, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83601, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Despawn');

-- Script when the quest is completed.
DELETE FROM `event_scripts` WHERE `id`=83602;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83602, 0, 7, 836, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Complete Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3816, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83602, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Reset Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83602, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (83602, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-09/HL!: Homing Robot OOX-09/HL - Despawn');

-- Assign script to Homing Robot OOX-09/HL.
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=7806;

-- Make Homing Robot OOX-09/HL an Active Object so that it can respawn correctly.
UPDATE `creature` SET `spawnFlags`=1 WHERE `id`=7806;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
