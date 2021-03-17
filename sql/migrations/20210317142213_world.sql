DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210317142213');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210317142213');
-- Add your query below.


-- Event 5713 is running.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5713, 36, 5713, 0, 0, 0, 0);

-- Texts
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry` IN (7200, 7202, 7328);

-- Script to move random at end of waypoints.
DELETE FROM `creature_movement_scripts` WHERE `id`=2;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Move Random at Current Position');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Set Home at Current Position');

-- Spawn Script for First Blackwood Tracker of Wave 1.
DELETE FROM `generic_scripts` WHERE `id`=571303;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571303, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 117131, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Blackwood Tracker - Start Waypoints');

-- Waypoints for First Blackwood Tracker of Wave 1.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(117131, 1, 4392.609863, -25.366100, 75.036697, 100.000000, 0, 0.000000, 0),
(117131, 2, 4393.160156, -30.393299, 79.213303, 100.000000, 0, 0.000000, 0),
(117131, 3, 4391.029785, -34.914101, 82.269997, 100.000000, 0, 0.000000, 0),
(117131, 4, 4385.589844, -39.882801, 82.269997, 100.000000, 0, 0.000000, 0),
(117131, 5, 4380.430176, -44.388199, 82.635696, 100.000000, 0, 0.000000, 0),
(117131, 6, 4379.680176, -49.509399, 85.542603, 100.000000, 0, 0.000000, 0),
(117131, 7, 4380.330078, -54.577599, 86.813202, 100.000000, 0, 0.000000, 0),
(117131, 8, 4382.236816, -56.135960, 86.949493, 100.000000, 0, 0.000000, 0),
(117131, 9, 4389.149902, -65.364899, 86.832497, 5.378330, 5000, 0.000000, 2),
(117131, 10, 4389.149902, -65.364899, 86.832497, 5.378330, 0, 0.000000, 0);

-- Spawn Script for Second Blackwood Tracker of Wave 1.
DELETE FROM `generic_scripts` WHERE `id`=571304;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571304, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 117132, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Blackwood Tracker - Start Waypoints');

-- Waypoints for Second Blackwood Tracker of Wave 1.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(117132, 1, 4390.069824, -7.880450, 69.378601, 100.000000, 0, 0.000000, 0),
(117132, 2, 4391.569824, -14.452600, 70.867897, 100.000000, 0, 0.000000, 0),
(117132, 3, 4392.560059, -24.838600, 74.677002, 100.000000, 0, 0.000000, 0),
(117132, 4, 4391.759766, -33.366402, 81.360603, 100.000000, 0, 0.000000, 0),
(117132, 5, 4384.669922, -40.686699, 81.862297, 100.000000, 0, 0.000000, 0),
(117132, 6, 4379.779785, -48.774799, 85.234100, 100.000000, 0, 0.000000, 0),
(117132, 7, 4383.419922, -58.362999, 87.034401, 5.393550, 5000, 0.000000, 2),
(117132, 8, 4383.419922, -58.362999, 87.034401, 5.393550, 0, 0.000000, 0);

-- Spawn Script for First Blackwood Tracker of Wave 2.
DELETE FROM `generic_scripts` WHERE `id`=571305;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571305, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 117133, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Blackwood Tracker - Start Waypoints');

-- Waypoints for First Blackwood Tracker of Wave 2.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(117133, 1, 4370.689941, -10.675800, 67.352097, 100.000000, 0, 0.000000, 0),
(117133, 2, 4365.600098, -19.496599, 69.151398, 100.000000, 0, 0.000000, 0),
(117133, 3, 4366.240234, -31.691900, 73.009697, 100.000000, 0, 0.000000, 0),
(117133, 4, 4370.209961, -38.133301, 76.526100, 100.000000, 0, 0.000000, 0),
(117133, 5, 4373.740234, -43.091702, 81.226097, 100.000000, 0, 0.000000, 0),
(117133, 6, 4377.120117, -47.906502, 85.066902, 100.000000, 0, 0.000000, 0),
(117133, 7, 4378.819824, -51.531200, 86.144997, 100.000000, 0, 0.000000, 0),
(117133, 8, 4379.669922, -53.343800, 86.769997, 100.000000, 0, 0.000000, 0),
(117133, 9, 4382.209961, -58.781200, 87.019997, 100.000000, 0, 0.000000, 0),
(117133, 10, 4387.450195, -63.796902, 86.927002, 100.000000, 5000, 0.000000, 2),
(117133, 11, 4387.450195, -63.796902, 86.927002, 100.000000, 0, 0.000000, 0);

-- Spawn Script for Second Blackwood Tracker of Wave 2.
DELETE FROM `generic_scripts` WHERE `id`=571306;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571306, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 117134, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Blackwood Tracker - Start Waypoints');

-- Waypoint for Second Blackwood Tracker of Wave 2.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(117134, 1, 4382.649902, -7.120410, 68.559898, 100.000000, 0, 0.000000, 0),
(117134, 2, 4368.589844, -11.112600, 67.287300, 100.000000, 0, 0.000000, 0),
(117134, 3, 4359.720215, -17.428301, 67.574699, 100.000000, 0, 0.000000, 0),
(117134, 4, 4365.640137, -20.330799, 69.357002, 100.000000, 0, 0.000000, 0),
(117134, 5, 4366.209961, -31.137199, 72.809799, 100.000000, 0, 0.000000, 0),
(117134, 6, 4372.209473, -37.981750, 76.070198, 100.000000, 0, 0.000000, 0),
(117134, 7, 4372.066895, -43.727089, 81.852921, 100.000000, 0, 0.000000, 0),
(117134, 8, 4374.420898, -49.689392, 86.039848, 100.000000, 0, 0.000000, 0),
(117134, 9, 4379.990234, -57.886299, 86.894997, 100.000000, 0, 0.000000, 0),
(117134, 10, 4387.169922, -64.509697, 86.841301, 100.000000, 5000, 0.000000, 2),
(117134, 11, 4387.169922, -64.509697, 86.841301, 100.000000, 0, 0.000000, 0);

-- Spawn Script for Third Blackwood Tracker of Wave 3.
DELETE FROM `generic_scripts` WHERE `id`=571307;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571307, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 117135, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Blackwood Tracker - Start Waypoints');

-- Waypoints for Third Blackwood Tracker of Wave 3.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(117135, 1, 4380.609863, -1.208700, 66.589104, 100.000000, 0, 0.000000, 0),
(117135, 2, 4364.000000, -13.318000, 67.317001, 100.000000, 0, 0.000000, 0),
(117135, 3, 4363.180176, -22.258600, 69.632004, 100.000000, 0, 0.000000, 0),
(117135, 4, 4366.209961, -31.137199, 72.809799, 100.000000, 0, 0.000000, 0),
(117135, 5, 4375.677734, -38.582951, 76.559105, 100.000000, 0, 0.000000, 0),
(117135, 6, 4377.253418, -45.495022, 83.209457, 100.000000, 0, 0.000000, 0),
(117135, 7, 4378.529785, -50.311012, 85.847794, 100.000000, 0, 0.000000, 0),
(117135, 8, 4384.060059, -55.782600, 87.561996, 100.000000, 0, 0.000000, 0),
(117135, 9, 4387.169922, -64.509697, 86.841301, 100.000000, 5000, 0.000000, 2),
(117135, 10, 4387.169922, -64.509697, 86.841301, 100.000000, 0, 0.000000, 0);

-- Spawn Script for Marosh the Devious.
DELETE FROM `generic_scripts` WHERE `id`=571308;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571308, 0, 20, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Marosh the Devious - Move Waypoint');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571308, 0, 63, 5713, 0, 0, 0, 0, 0, 0, 0, 121, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Marosh the Devious - Add to Scripted Map Event');

-- Waypoints for Marosh the Devious.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(11714, 1, 4390.479980, -21.105900, 73.030998, 100.000000, 0, 0.000000, 0),
(11714, 2, 4392.220215, -30.801001, 79.546600, 100.000000, 0, 0.000000, 0),
(11714, 3, 4390.299805, -37.460602, 83.446404, 100.000000, 0, 0.000000, 0),
(11714, 4, 4381.863770, -42.012394, 81.197136, 100.000000, 0, 0.000000, 0),
(11714, 5, 4373.379883, -44.119701, 82.255096, 100.000000, 0, 0.000000, 0),
(11714, 6, 4375.169922, -51.290501, 86.562302, 100.000000, 0, 0.000000, 0),
(11714, 7, 4377.890137, -54.059299, 86.744102, 100.000000, 4000, 0.000000, 0),
(11714, 8, 4389.040039, -65.586700, 86.779297, 100.000000, 5000, 0.000000, 2),
(11714, 9, 4389.040039, -65.586700, 86.779297, 100.000000, 0, 0.000000, 0);

-- Waypoints for Sentinel Aynasha.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(11711, 1, 4380.859863, -54.987301, 86.722198, 100.000000, 0, 0.000000, 0),
(11711, 2, 4374.750000, -42.409100, 80.447998, 100.000000, 0, 0.000000, 0),
(11711, 3, 4372.759766, -36.748100, 75.269997, 100.000000, 0, 0.000000, 0),
(11711, 4, 4370.770020, -31.087900, 72.620300, 100.000000, 0, 0.000000, 0),
(11711, 5, 4367.549805, -21.959200, 70.175499, 100.000000, 0, 0.000000, 0),
(11711, 6, 4373.040039, -10.418500, 67.573303, 100.000000, 0, 0.000000, 0),
(11711, 7, 4379.279785, -11.333600, 69.242401, 100.000000, 5000, 0.000000, 11711),
(11711, 8, 4379.279785, -11.333600, 69.242401, 100.000000, 0, 0.000000, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=11711;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11711, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (11711, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Despawn');

-- Blackwood Tracker
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (117130, 'Darkshore - Blackwood Tracker', 6950, 100, 1, 0, 0, 0, 5, 7, 30, 40, 0, 3391, 100, 0, 0, 0, 0, 5, 20, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=117130, `speed_walk`=0.666668, `speed_run`=0.992063, `base_attack_time`=2000, `xp_multiplier`=0.25 WHERE `entry`=11713;

-- Marosh the Devious
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (117140, 'Darkshore - Marosh the Devious', 6950, 100, 1, 0, 0, 0, 5, 30, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=117140, `speed_walk`=0.666668, `speed_run`=0.992063 WHERE `entry`=11714;
UPDATE `creature_display_info_addon` SET `bounding_radius`=1.3, `combat_reach`=1.625 WHERE `display_id`=11661;

-- Sentinel Aynasha
DELETE FROM `creature_ai_events` WHERE `creature_id`=11711;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1171101, 11711, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1171101, 0, 0, 'Sentinel Aynasha - Add Quest Giver Flag on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1171102, 11711, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1171102, 0, 0, 'Sentinel Aynasha - Play Sound on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1171103, 11711, 0, 21, 2, 100, 0, 0, 0, 0, 0, 1171103, 0, 0, 'Sentinel Aynasha - Cast Spell Aynasha\'s Root on Reached Home');
DELETE FROM `creature_ai_scripts` WHERE `id`=1171101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1171101, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Add Quest Giver Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1171101, 0, 15, 18373, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Cast Spell Aynasha\'s Root');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1171101, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Set Phase to 0');
DELETE FROM `creature_ai_scripts` WHERE `id`=1171102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1171102, 0, 16, 7339, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Play Sound');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1171102, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Disable Melee Attack');
DELETE FROM `creature_ai_scripts` WHERE `id`=1171103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1171103, 0, 15, 18373, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Aynasha - Cast Spell Aynasha\'s Root');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (117110, 'Darkshore - Sentinel Aynasha', 19767, 100, 1, 0, 0, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=117110, `auras`='', `speed_walk`=1, `speed_run`=1.42857, `ai_name`='EventAI', `script_name`='' WHERE `entry`=11711;
UPDATE `creature` SET `spawntimesecsmin`=65, `spawntimesecsmax`=65 WHERE `id`=11711;

-- Aynasha's Root should be a buff.
UPDATE `spell_template` SET `customFlags` = `customFlags` | 4 WHERE `entry`=18373;

-- Script when event fails.
DELETE FROM `generic_scripts` WHERE `id`=571301;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571301, 0, 70, 5713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Fail Quest');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571301, 0, 18, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Sentinel Aynasha - Despawn');

-- Script when event completes.
DELETE FROM `generic_scripts` WHERE `id`=571302;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 0, 7, 5713, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Complete Quest');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7201, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 1, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Set Emote State');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 4, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Stop Emoting');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7202, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7328, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 12, 14, 18373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Remove Aura Aynasha\'s Root');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 12, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Set Phase to 1');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 12, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Set Run');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571302, 13, 20, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill Completed: Sentinel Aynasha - Move Waypoint');

-- Script on accepting quest One Shot. One Kill.
DELETE FROM `quest_start_scripts` WHERE `id`=5713;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 0, 61, 5713, 600, 0, 0, 0, 0, 0, 8, 0, 571302, 1014, 571301, 0, 0, 0, 0, 0, 'One Shot One Kill: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Sentinel Aynasha - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Sentinel Aynasha - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 15, 18373, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Sentinel Aynasha - Cast Spell Aynasha\'s Root');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 55, 117110, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Sentinel Aynasha - Set Spell List');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 2, 10, 11713, 60000, 0, 0, 0, 0, 0, 0, 1, 571303, -1, 1, 4390.06, -3.51573, 68.8018, 1.02974, 0, 'One Shot One Kill: Sentinel Aynasha - Summon Blackwood Tracker 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 2, 10, 11713, 60000, 0, 0, 0, 0, 0, 0, 1, 571304, -1, 1, 4388.57, -4.57785, 68.7862, 1.41372, 0, 'One Shot One Kill: Sentinel Aynasha - Summon Blackwood Tracker 2');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 49, 32, 5713, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Terminate Script if Event Not Active');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 50, 10, 11713, 60000, 0, 0, 0, 0, 0, 0, 1, 571306, -1, 1, 4387.61, -3.88216, 68.5392, 4.13643, 0, 'One Shot One Kill: Sentinel Aynasha - Summon Blackwood Tracker 4');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 50, 10, 11713, 60000, 0, 0, 0, 0, 0, 0, 1, 571307, -1, 1, 4387.08, -2.34646, 68.1479, 1.51844, 0, 'One Shot One Kill: Sentinel Aynasha - Summon Blackwood Tracker 5');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 50, 10, 11713, 60000, 0, 0, 0, 0, 0, 0, 1, 571305, -1, 1, 4388.91, -3.7838, 68.6974, 4.17134, 0, 'One Shot One Kill: Sentinel Aynasha - Summon Blackwood Tracker 3');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 99, 32, 5713, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Terminate Script if Event Not Active');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 100, 10, 11714, 60000, 0, 0, 0, 0, 0, 0, 1, 571308, -1, 1, 4385.79, -4.06348, 68.2891, 1.0821, 0, 'One Shot One Kill: Sentinel Aynasha - Summon Marosh the Devious');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 119, 32, 5713, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Terminate Script if Event Not Active');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7199, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Sentinel Aynasha - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 120, 55, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'One Shot One Kill: Sentinel Aynasha - Remove Spell List');
UPDATE `quest_template` SET `StartScript`=5713 WHERE `entry`=5713;

-- Change condition used in Vorsha the Lasher script since I changed which object is used for conditions.
UPDATE `generic_scripts` SET `dataint`=121 WHERE `id`=12940 && `command`=63 && `dataint`=738;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
