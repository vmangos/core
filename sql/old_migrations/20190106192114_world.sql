DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190106192114');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190106192114');
-- Add your query below.


-- Assign script to quest.
UPDATE `quest_template` SET `StartScript`=648 WHERE `entry`=648;

-- Escort Conditions Source 80 Yards
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1019, 25, 1, 80, 0, 0, 0);

-- Waypoints
DELETE FROM `script_waypoint` WHERE `entry`=7784;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(7784, 1, -8845.65, -4373.98, 43.87, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7784, 2, -8840.79, -4373.73, 44.24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 3, -8837.43, -4373.56, 45.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 4, -8832.74, -4373.32, 45.68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 5, -8829.37, -4373.14, 44.33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 6, -8817.38, -4372.41, 35.58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 7, -8803.47, -4371.6, 30.34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 8, -8795.1, -4365.61, 26.08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 9, -8766.78, -4367.13, 25.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 10, -8755.63, -4367.54, 24.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 11, -8754.42, -4365.59, 24.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 12, -8728.82, -4353.13, 20.9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 13, -8706.6, -4356.55, 17.93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 14, -8679, -4380.23, 12.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 15, -8642.96, -4393.82, 12.52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 16, -8611.19, -4399.11, 9.55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 17, -8554.87, -4409.32, 13.05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 18, -8531.64, -4411.96, 11.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 19, -8510.4, -4414.38, 12.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 20, -8476.92, -4418.34, 9.71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 21, -8435.89, -4426.74, 9.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 22, -8381.89, -4446.4, 10.23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 23, -8351.15, -4447.79, 9.99, 5000, 778423, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7784, 24, -8324.18, -4445.05, 9.71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 25, -8297.86, -4422.64, 12.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 26, -8278.57, -4411.3, 9.534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 27, -8255.92, -4403.4, 12.095, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 28, -8196.71, -4386.61, 11.367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 29, -8138.94, -4384.78, 10.92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 30, -8070.93, -4414.46, 10.272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 31, -8036.87, -4443.38, 9.65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 32, -7975.16, -4500.39, 10.9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 33, -7947.92, -4581.73, 11.09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 34, -7905.32, -4611.66, 10.575, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 35, -7875.96, -4645.89, 9.99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 36, -7816.43, -4707.44, 11.04, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 37, -7780.92, -4761.81, 9.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 38, -7732.21, -4761.12, 9.938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 39, -7669.51, -4751.04, 10.438, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 40, -7587.67, -4765.01, 8.96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 41, -7497.65, -4792.86, 10.01, 0, 778441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 42, -7457.44, -4785.13, 9.428, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 43, -7391.54, -4774.26, 12.44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 44, -7308.42, -4739.87, 12.65, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(7784, 45, -7265.41, -4757.59, 9.46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 46, -7218.2, -4771.53, 12.88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 47, -7165.54, -4764.26, 9.85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 48, -7124.08, -4755.83, 9.675, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 49, -7065.05, -4748.49, 9.81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 50, -7065.05, -4748.49, 9.81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 51, -7016.11, -4751.12, 10.06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 52, -6985.52, -4777.41, 10.26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 53, -6953.02, -4786, 6.32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7784, 54, -6940.37, -4831.03, 0.67, 10000, 778454, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Waypoint Scripts
DELETE FROM `creature_movement_scripts` WHERE `id`=778423;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3821, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778423, 0, 10, 7803, 60000, 0, 0, 0, 0, 0, 0, 0, 64803, 6, 1, -8340.7, -4448.17, 9.17, 3.1, 0, 'Rescue OOX-17/TN!: Summon Scorpid Duneburrower 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778423, 0, 10, 7803, 60000, 0, 0, 0, 0, 0, 0, 0, 64803, 6, 1, -8343.18, -4444.35, 9.44, 2.35, 0, 'Rescue OOX-17/TN!: Summon Scorpid Duneburrower 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778423, 0, 10, 7803, 60000, 0, 0, 0, 0, 0, 0, 0, 64803, 6, 1, -8348.7, -4457.8, 9.58, 2.02, 0, 'Rescue OOX-17/TN!: Summon Scorpid Duneburrower 3');
DELETE FROM `event_scripts` WHERE `id`=64803;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64803, 0, 26, 0, 0, 0, 0, 648, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Scorpid Duneburrower - Attack Target');
DELETE FROM `creature_movement_scripts` WHERE `id`=778441;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3821, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778441, 0, 10, 7805, 60000, 0, 0, 0, 0, 0, 0, 0, 64803, 6, 1, -7488.02, -4786.56, 10.67, 3.74, 0, 'Rescue OOX-17/TN!: Summon Wastewander Scofflaw 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778441, 0, 10, 7805, 60000, 0, 0, 0, 0, 0, 0, 0, 64804, 6, 1, -7488.47, -4800.77, 9.77, 2.50, 0, 'Rescue OOX-17/TN!: Summon Wastewander Scofflaw 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778441, 0, 10, 5617, 60000, 0, 0, 0, 0, 0, 0, 0, 64803, 6, 1, -7486.41, -4791.55, 10.54, 3.26, 0, 'Rescue OOX-17/TN!: Summon Wastewander Shadow Mage');
DELETE FROM `event_scripts` WHERE `id`=64804;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64804, 0, 26, 0, 0, 0, 0, 648, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Wastewander Scofflaw - Attack Target');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3812, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Wastewander Scofflaw - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=778454;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778454, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778454, 0, 62, 648, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: End Scripted Map Event');

-- Events list for Homing Robot OOX-17/TN
DELETE FROM `creature_ai_events` WHERE `creature_id`=7784;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (778401, 7784, 0, 4, 0, 20, 0, 0, 0, 0, 0, 778401, 0, 0, 'Homing Robot OOX-17/TN - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (778402, 7784, 0, 21, 0, 100, 0, 0, 0, 0, 0, 778402, 0, 0, 'Homing Robot OOX-17/TN - Stand Up on Reached Home');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (778403, 7784, 0, 1, 1, 100, 1, 3000, 3000, 3000, 3000, 778403, 0, 0, 'Homing Robot OOX-17/TN - Assist Escorting Player (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (778404, 7784, 0, 0, 1, 100, 1, 3000, 3000, 3000, 3000, 778403, 0, 0, 'Homing Robot OOX-17/TN - Assist Escorting Player (Phase 1)');
DELETE FROM `creature_ai_scripts` WHERE `id`=778401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3795, 3796, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-17/TN - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=778402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778402, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-17/TN - Stand Up');
DELETE FROM `creature_ai_scripts` WHERE `id`=778403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (778403, 0, 72, 0, 0, 0, 0, 648, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Homing Robot OOX-17/TN - Assist Player');

-- Script when the quest is accepted.
DELETE FROM `quest_start_scripts` WHERE `id`=648;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 0, 61, 648, 1800, 0, 0, 0, 0, 0, 8, 0, 64802, 1019, 64801, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Stand Up');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3819, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 3, 22, 113, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Set Faction');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 3, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 7784, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (648, 3, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Set Phase to 1');

-- Script when the quest fails.
DELETE FROM `event_scripts` WHERE `id`=64801;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64801, 0, 70, 648, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Fail Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64801, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Reset Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64801, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64801, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Despawn');

-- Script when the quest is completed.
DELETE FROM `event_scripts` WHERE `id`=64802;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64802, 0, 7, 648, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Complete Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3820, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64802, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Reset Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64802, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (64802, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rescue OOX-17/TN!: Homing Robot OOX-17/TN - Despawn');

-- Assign script to Homing Robot OOX-17/TN.
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=7784;

-- Make Homing Robot OOX-17/TN an Active Object so that it can respawn correctly.
UPDATE `creature` SET `spawnFlags`=1 WHERE `id`=7784;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
