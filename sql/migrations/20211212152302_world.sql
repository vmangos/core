DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211212152302');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211212152302');
-- Add your query below.


-- Remove Old Event Data
DELETE FROM `creature` WHERE `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event` = 153);
DELETE FROM `game_event` WHERE `entry` = 153;
DELETE FROM `game_event_creature` WHERE `event` = 153;
DELETE FROM `creature_groups` WHERE `leader_guid` = 301764;
DELETE FROM `creature_movement_scripts` WHERE `id` = 14;
DELETE FROM `creature_movement` WHERE  `id` IN (301764, 301765, 301761, 301763, 301762);

-- Misc
UPDATE `creature` SET `spawn_flags` = 1 WHERE `guid` = 15322;
UPDATE `game_event` SET `description` = 'Southshore Assassins', `occurence`='120', `length`='35' WHERE `entry`=152;
UPDATE `creature_template` SET `movement_type` = 0, `faction` = 108, `npc_flags` = 0, `ai_name` = '', `auras`='1785 3616' WHERE `entry` = 2434;
DELETE FROM `creature_ai_scripts` WHERE `id` = 243401;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 2434;
UPDATE `creature` SET `position_x` = -576.589, `position_y` = -555.617, `position_z` = 33.4733, `spawntimesecsmin` = 2100, `spawntimesecsmax` = 2100 WHERE `id` = 2435;
UPDATE `broadcast_text` SET `chat_type` = 2 WHERE `entry` = 623;

-- Events List for Farmer Kent
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry`=2436;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (243601, 2436, 0, 4, 0, 100, 0, 0, 0, 0, 0, 243601, 0, 0, 'Farmer Kent - Talk on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (243601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 628, 627, 0, 0, 0, 0, 0, 0, 0, 'Farmer Kent - Talk');

-- Events List for Southshore Crier
DELETE FROM `creature_ai_events` WHERE `creature_id`=2435;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (243502, 243503, 243504);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(243501, 2435, 0, 1, 0, 100, 0, 2000, 2000, 0, 0, 243501, 0, 0, 'Southshore Crier - Yell on Spawn');

-- Main script
DELETE FROM `creature_movement` WHERE `id` = 301755;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2435, 1, -576.589, -555.617, 33.4733, 100, 0, 0, 11),
(2435, 2, -576.589, -555.617, 33.4733, 100, 0, 0, 11),
(2435, 3, -584.442, -565.827, 32.8548, 100, 0, 0, 0),
(2435, 4, -590.498, -573.355, 32.4334, 100, 0, 0, 0),
(2435, 5, -627.736, -566.756, 27.9208, 100, 0, 0, 0),
(2435, 6, -652.486, -561.351, 26.2017, 100, 0, 0, 0),
(2435, 7, -668.636, -562.703, 25.3622, 100, 0, 0, 0),
(2435, 8, -680.996, -566.52, 25.2009, 100, 0, 0, 0),
(2435, 9, -693.22, -569.418, 24.4536, 100, 0, 0, 0),
(2435, 10, -723.958, -551.954, 20.5542, 100, 0, 0, 0),
(2435, 11, -764.897, -546.37, 17.9831, 100, 0, 0, 0),
(2435, 12, -809.579, -528.999, 15.3876, 100, 0, 0, 0),
(2435, 13, -821.22, -524.994, 13.8281, 100, 0, 0, 0),
(2435, 14, -856.326, -532.717, 9.74993, 100, 30000, 5, 243501);

DELETE FROM `creature_movement_scripts` WHERE `id`=243501;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 620, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 621, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243511, -1, 9, -787.574, -504.358, 18.9435, 5.79449, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243510, -1, 9, -787.598, -505.655, 18.9435, 6.05629, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243512, -1, 9, -726.914, -575.805, 25.4761, 4.03917, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243512, -1, 9, -726.371, -574.912, 25.5261, 4.16828, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243505, -1, 9, -877.416, -574.223, 11.5033, 1.0821, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243504, -1, 9, -874.746, -573.897, 11.6758, 2.28638, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243509, -1, 9, -817.583, -505.381, 15.2609, 3.03687, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243508, -1, 9, -818.436, -503.501, 15.3768, 3.71755, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243503, -1, 9, -850.748, -561.89, 11.6908, 3.14159, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243502, -1, 9, -852.268, -560.181, 11.6908, 3.82227, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243507, -1, 9, -863.394, -494.436, 13.4375, 5.53269, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 2100000, 0, 0, 0, 0, 0, 0, 0, 243506, -1, 9, -863.81, -496.398, 13.4382, 5.34071, 0, 'Summon Creature Southshore Guard'),
(243501, 21, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Cast Spell Touch of the Black Claw'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 626, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 623, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243513, -1, 9, -775.028, -681.441, 10.5779, 0.763972, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243513, -1, 9, -774.61, -682.655, 10.2871, 0.20944, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243514, -1, 9, -874.898, -543.902, 8.1009, 2.6314, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243514, -1, 9, -874.686, -543.904, 8.11303, 2.65715, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243515, -1, 9, -722.296, -626.843, 21.2373, 4.2949, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243515, -1, 9, -722.225, -627.343, 21.2852, 5.99603, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243516, -1, 9, -863.397, -420.184, 12.1807, 5.33287, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243516, -1, 9, -862.454, -416.289, 12.1807, 3.79291, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243517, -1, 9, -757.291, -425, 20.5991, 4.43955, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243517, -1, 9, -759.857, -421.127, 20.7913, 3.24438, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243518, -1, 9, -830.498, -675.663, 11.4526, 1.83392, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243518, -1, 9, -832.882, -666.844, 12.3942, 1.82468, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243519, -1, 9, -775.546, -441.894, 21.8413, 0.456332, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243519, -1, 9, -781.113, -441.065, 21.0467, 2.06222, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243520, -1, 9, -879.583, -506.974, 12.0944, 4.32519, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243520, -1, 9, -879.434, -507.08, 12.0944, 1.861, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243521, -1, 9, -863.649, -538.335, 8.72452, 0.311862, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243521, -1, 9, -860.799, -537.438, 9.01221, 0.313721, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243522, -1, 9, -864.073, -420.33, 12.208, 5.61996, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243522, -1, 9, -862.443, -418.923, 12.1787, 5.51524, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243523, -1, 9, -826.355, -514.603, 13.2019, 3.24146, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243523, -1, 9, -826.566, -514.741, 13.1909, 3.22376, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243524, -1, 9, -772.994, -529.219, 20.8964, 5.34041, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243524, -1, 9, -773.472, -526.871, 21.3032, 4.91285, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243525, -1, 9, -915.314, -416.524, 8.04292, 5.74213, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243525, -1, 9, -915.724, -418.445, 7.44239, 4.92183, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243526, -1, 9, -776.995, -681.734, 10.645, 1.14385, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 2100000, 0, 0, 0, 0, 0, 0, 0, 243526, -1, 9, -769.896, -676.539, 11.8627, 0.92749, 0, 'Summon Creature Shadowy Assassin'),
(243501, 27, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Despawn Creature');

-- Spawn Scripts and Waypoints for Creature Southshore Guards
DELETE FROM `generic_scripts` WHERE `id`=243502;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243502, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243502, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(238601, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 611, 612, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Speak');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243502, 1, -852.268, -560.181, 11.6908, 100, 0, 0, 11),
(243502, 2, -852.268, -560.181, 11.6908, 100, 0, 0, 238601),
(243502, 3, -849.097, -544.966, 11.1183, 100, 0, 0, 0),
(243502, 4, -870.534, -538.675, 8.21938, 100, 0, 0, 0),
(243502, 5, -902.927, -544.349, 6.87962, 100, 0, 0, 0),
(243502, 6, -900.795, -545.331, 6.87962, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243503;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243503, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243503, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243503, 1, -850.748, -561.89, 11.6908, 100, 0, 0, 11),
(243503, 2, -852.268, -560.181, 11.6916, 100, 0, 0, 0),
(243503, 3, -849.385, -552, 11.6751, 100, 0, 0, 0),
(243503, 4, -866.533, -538.207, 8.49329, 100, 0, 0, 0),
(243503, 5, -885.609, -542.527, 7.21792, 100, 0, 0, 0),
(243503, 6, -897.598, -544.321, 6.87962, 100, 0, 0, 0),
(243503, 7, -902.318, -544.345, 6.87962, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243504;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243504, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243504, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243504, 1, -874.746, -573.897, 11.6758, 100, 0, 0, 11),
(243504, 2, -878.976, -614.334, 6.35845, 100, 0, 0, 0),
(243504, 3, -867.666, -629.993, 7.5186, 100, 0, 0, 0),
(243504, 4, -867.149, -645.85, 10.1492, 100, 0, 0, 0),
(243504, 5, -843.583, -645.406, 16.4311, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243505;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243505, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243505, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243505, 1, -877.416, -574.223, 11.5033, 100, 0, 0, 11),
(243505, 2, -874.746, -573.897, 11.5886, 100, 0, 0, 0),
(243505, 3, -880.854, -580.928, 10.979, 100, 0, 0, 0),
(243505, 4, -879.883, -593.102, 9.9001, 100,0, 0, 0),
(243505, 5, -879.029, -612.981, 6.19609, 100, 0, 0, 0),
(243505, 6, -870.367, -626.243, 6.61821, 100, 0, 0, 0),
(243505, 7, -841.871, -640.051, 16.0813, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243506;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243506, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243506, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243506, 1, -863.81, -496.398, 13.4382, 100, 0, 0, 11),
(243506, 2, -863.81, -496.398, 13.4382, 100, 0, 0, 238601),
(243506, 3, -860.563, -520.896, 10.9899, 100, 0, 0, 0),
(243506, 4, -830.389, -520.065, 12.4591, 100, 0, 0, 0),
(243506, 5, -833.688, -496.637, 16.5962, 100, 0, 0, 0),
(243506, 6, -840.332, -462.552, 11.3648, 100, 0, 0, 0),
(243506, 7, -860.812, -449.905, 11.5171, 100, 0, 0, 0),
(243506, 8, -876.748, -424.008, 10.6959, 100, 0, 0, 0),
(243506, 9, -880.01, -417.176, 10.6465, 100, 0, 0, 0),
(243506, 10, -880.184, -419.371, 10.3621, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243507;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243507, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243507, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243507, 1, -863.394, -494.436, 13.4375, 100, 0, 0, 11),
(243507, 2, -863.81, -496.398, 13.3538, 100, 0, 0, 0),
(243507, 3, -860.937, -513.684, 11.06, 100, 0, 0, 0),
(243507, 4, -858.475, -524.878, 10.5119, 100, 0, 0, 0),
(243507, 5, -846.201, -526.387, 11.0783, 100, 0, 0, 0),
(243507, 6, -830.803, -517.105, 12.6693, 100, 0, 0, 0),
(243507, 7, -835.686, -485.885, 14.7551, 100, 0, 0, 0),
(243507, 8, -838.85, -470.139, 12.0356, 100, 0, 0, 0),
(243507, 9, -861.375, -429.504, 11.5338, 100, 0, 0, 0),
(243507, 10, -873.529, -420.94, 11.4227, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243508;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243508, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243508, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243508, 1, -818.436, -503.501, 15.3768, 100, 0, 0, 11),
(243508, 2, -811.192, -524.215, 15.4196, 100, 0, 0, 0),
(243508, 3, -806.47, -510.165, 17.7401, 100, 0, 0, 0),
(243508, 4, -796.442, -477.976, 17.3567, 100, 0, 0, 0),
(243508, 5, -801.218, -460.606, 16.3138, 100, 0, 0, 0),
(243508, 6, -801.012, -446.868, 17.879, 100, 0, 0, 0),
(243508, 7, -794.068, -432.563, 19.2965, 100, 0, 0, 0),
(243508, 8, -791.534, -432.07, 19.6855, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243509;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243509, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243509, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243509, 1, -817.583, -505.381, 15.2609, 100, 0, 0, 11),
(243509, 2, -818.436, -503.501, 15.3109, 100, 0, 0, 0),
(243509, 3, -839.998, -531.01, 11.9814, 100, 0, 0, 0),
(243509, 4, -797.96, -539.399, 16.3528, 100, 0, 0, 0),
(243509, 5, -809.075, -517.918, 16.528, 100, 0, 0, 0),
(243509, 6, -796.521, -471.88, 16.6262, 100, 0, 0, 0),
(243509, 7, -785.893, -449.136, 22.1255, 100, 0, 0, 0),
(243509, 8, -796.634, -433.713, 18.7880, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243510;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243510, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243510, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243510, 1, -787.598, -505.655, 18.9435, 100, 0, 0, 11),
(243510, 2, -782.269, -509.026, 18.8601, 100, 0, 0, 0),
(243510, 3, -788.217, -517.664, 17.7153, 100, 0, 0, 0),
(243510, 4, -799.213, -527.854, 16.7172, 100, 0, 0, 0),
(243510, 5, -797.417, -534.636, 16.543, 100, 0, 0, 0),
(243510, 6, -784.416, -541.493, 18.103, 100, 0, 0, 0),
(243510, 7, -763.778, -545.218, 17.9648, 100, 0, 0, 0),
(243510, 8, -744.096, -534.273, 20.9565, 100, 0, 0, 0),
(243510, 9, -733.027, -533.149, 22.9293, 100, 0, 0, 0),
(243510, 10, -734.124, -532.319, 22.8824, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243511;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243511, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 243511, 0, 0, 0, 0, 0, 0, 0, 'Southshore Guard - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(243511, 1, -787.574, -504.358, 18.9435, 100, 0, 0, 11),
(243511, 2, -784.115, -504.936, 18.8601, 100, 0, 0, 0),
(243511, 3, -782.467, -506.788, 18.8601, 100, 0, 0, 0),
(243511, 4, -782.93, -509.986, 18.8601, 100, 0, 0, 0),
(243511, 5, -788.478, -519.886, 17.7153, 100, 0, 0, 0),
(243511, 6, -792.481, -523.073, 17.7153, 100, 0, 0, 0),
(243511, 7, -795.157, -525.552, 17.5903, 100, 0, 0, 0),
(243511, 8, -801.297, -529.666, 16.3253, 100, 0, 0, 0),
(243511, 9, -800.868, -537.284, 16.0442, 100, 0, 0, 0),
(243511, 10, -795.949, -542.03, 16.4988, 100, 0, 0, 0),
(243511, 11, -788.061, -540.549, 17.6655, 100, 0, 0, 0),
(243511, 12, -783.011, -541.309, 18.1272, 100, 0, 0, 0),
(243511, 13, -776.883, -544.343, 18.0454, 100, 0, 0, 0),
(243511, 14, -768.136, -544.278, 17.9197, 100, 0, 0, 0),
(243511, 15, -760.135, -545.786, 18.2148, 100, 0, 0, 0),
(243511, 16, -753.148, -540.885, 18.996, 100, 0, 0, 0),
(243511, 17, -747.062, -535.458, 20.3122, 100, 0, 0, 0),
(243511, 18, -739.572, -531.611, 22.0098, 100, 0, 0, 0),
(243511, 19, -733.662, -533.042, 22.878, 100, 2100000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id`=243512;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243512, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

-- Spawn Scripts for Creature Shadowy Assassin
DELETE FROM `creature_movement_template` WHERE `entry` = 2434;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2434, 1, -856.004, -529.716, 10.1312, 100, 0, 0, 0),
(2434, 2, -860.056, -516.084, 11.1381, 100, 0, 0, 0),
(2434, 3, -861.821, -497.294, 13.3546, 100, 0, 0, 0),
(2434, 4, -863.06, -492.887, 13.3547, 100, 0, 0, 0),
(2434, 5, -875.937, -484.004, 13.3554, 100, 0, 0, 0),
(2434, 6, -864.933, -476.367, 13.3554, 100, 600000, 3, 0);

DELETE FROM `generic_scripts` WHERE `id` BETWEEN 243513 AND 243526;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243517, 180, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243518, 360, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243519, 540, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243520, 720, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243521, 900, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243522, 1080, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243523, 1260, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243524, 1440, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243525, 1620, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243526, 1800, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Assassin - Start Waypoints'),
(243513, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243514, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243515, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243516, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243517, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243518, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243519, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243520, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243521, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243522, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243523, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243524, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243525, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type'),
(243526, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Set Movement Type');

-- Magistrate Henry Maleb Alive
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2434, 20, 2276, 300, 0, 0, 2);
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243513, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243514, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243515, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243516, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243517, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243518, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243519, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243520, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243521, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243522, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243523, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243524, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243525, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk'),
(243526, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 633, 634, 635, 0, 0, 0, 0, 0, 2434, 'Shadowy Assassin - Talk');

-- Magistrate Henry Maleb Dead
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2435, 20, 2276, 300, 1, 0, 2);
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243513, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243514, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243515, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243516, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243517, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243518, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243519, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243520, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243521, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243522, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243523, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243524, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243525, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk'),
(243526, 2040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 631, 632, 0, 0, 0, 0, 0, 2435, 'Shadowy Assassin - Talk');

INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243513, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243514, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243515, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243516, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243517, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243518, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243519, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243520, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243521, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243522, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243523, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243524, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243525, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object'),
(243526, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Shadowy Assassin - Make Active Object');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
