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
UPDATE `creature_template` SET `movement_type` = '0' WHERE `entry` = 2434;
UPDATE `creature` SET `position_x` = -576.589, `position_y` = -555.617, `position_z` = 33.4733 WHERE `id` = 2435;
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
(2435, 2, -584.442, -565.827, 32.8548, 100, 0, 0, 0),
(2435, 3, -590.498, -573.355, 32.4334, 100, 0, 0, 0),
(2435, 4, -627.736, -566.756, 27.9208, 100, 0, 0, 0),
(2435, 5, -652.486, -561.351, 26.2017, 100, 0, 0, 0),
(2435, 6, -668.636, -562.703, 25.3622, 100, 0, 0, 0),
(2435, 7, -680.996, -566.52, 25.2009, 100, 0, 0, 0),
(2435, 8, -693.22, -569.418, 24.4536, 100, 0, 0, 0),
(2435, 9, -723.958, -551.954, 20.5542, 100, 0, 0, 0),
(2435, 10, -764.897, -546.37, 17.9831, 100, 0, 0, 0),
(2435, 11, -809.579, -528.999, 15.3876, 100, 0, 0, 0),
(2435, 12, -821.22, -524.994, 13.8281, 100, 0, 0, 0),
(2435, 13, -856.326, -532.717, 9.74993, 100, 30000, 5, 243501);

DELETE FROM `creature_movement_scripts` WHERE `id`=243501;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 620, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 621, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243511, -1, 1, -787.574, -504.358, 18.9435, 5.79449, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243510, -1, 1, -787.598, -505.655, 18.9435, 6.05629, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243512, -1, 1, -726.914, -575.805, 25.4761, 4.03917, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243512, -1, 1, -726.371, -574.912, 25.5261, 4.16828, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243505, -1, 1, -877.416, -574.223, 11.5033, 1.0821, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243504, -1, 1, -874.746, -573.897, 11.6758, 2.28638, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243509, -1, 1, -817.583, -505.381, 15.2609, 3.03687, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243508, -1, 1, -818.436, -503.501, 15.3768, 3.71755, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243503, -1, 1, -850.748, -561.89, 11.6908, 3.14159, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243502, -1, 1, -852.268, -560.181, 11.6908, 3.82227, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243507, -1, 1, -863.394, -494.436, 13.4375, 5.53269, 0, 'Summon Creature Southshore Guard'),
(243501, 8, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 243506, -1, 1, -863.81, -496.398, 13.4382, 5.34071, 0, 'Summon Creature Southshore Guard'),
(243501, 21, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Cast Spell Touch of the Black Claw'),
(243501, 21, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Cast Spell Touch of the Black Claw'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 626, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 623, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -775.546, -441.894, 21.8413, 0.456332, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -874.898, -543.902, 8.1009, 2.6314, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -874.686, -543.904, 8.11303, 2.65715, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -722.296, -626.843, 21.2373, 4.2949, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -722.225, -627.343, 21.2852, 5.99603, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -830.498, -675.663, 11.4526, 1.83392, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -832.882, -666.844, 12.3942, 1.82468, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -757.291, -425, 20.5991, 4.43955, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -759.857, -421.127, 20.7913, 3.24438, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -863.397, -420.184, 12.1807, 5.33287, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -862.454, -416.289, 12.1807, 3.79291, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -774.61, -682.655, 10.2871, 0.20944, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -775.028, -681.441, 10.5779, 0.763972, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -879.583, -506.974, 12.0944, 4.32519, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -879.434, -507.08, 12.0944, 1.861, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -863.649, -538.335, 8.72452, 0.311862, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -860.799, -537.438, 9.01221, 0.313721, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -864.073, -420.33, 12.208, 5.61996, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -862.443, -418.923, 12.1787, 5.51524, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -826.355, -514.603, 13.2019, 3.24146, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -826.566, -514.741, 13.1909, 3.22376, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -772.994, -529.219, 20.8964, 5.34041, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -773.472, -526.871, 21.3032, 4.91285, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -915.314, -416.524, 8.04292, 5.74213, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -915.724, -418.445, 7.44239, 4.92183, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -776.995, -681.734, 10.645, 1.14385, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -769.896, -676.539, 11.8627, 0.92749, 0, 'Summon Creature Shadowy Assassin'),
(243501, 22, 10, 2434, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -781.113, -441.065, 21.0467, 2.06222, 0, 'Summon Creature Shadowy Assassin'),
(243501, 27, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Despawn Creature');

-- Spawn scripts for Creature Southshore Guards
DELETE FROM `generic_scripts` WHERE `id`=243502;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243502, 0, 3, 0, 2747, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -849.097, -544.966, 11.1183, 0, 0, 'Southshore Guard - Move'),
(243502, 2, 3, 0, 3234, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -870.534, -538.675, 8.21938, 0, 0, 'Southshore Guard - Move'),
(243502, 4, 3, 0, 5394, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -902.927, -544.349, 6.87962, 0, 0, 'Southshore Guard - Move'),
(243502, 6, 3, 0, 940, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -900.795, -545.331, 6.87962, 0, 0, 'Southshore Guard - Move'),
(243502, 9, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243503;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243503, 0, 3, 0, 367, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -852.268, -560.181, 11.6916, 0, 0, 'Southshore Guard - Move'),
(243503, 2, 3, 0, 1010, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -849.385, -552, 11.6751, 0, 0, 'Southshore Guard - Move'),
(243503, 4, 3, 0, 2993, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -860.306, -509.171, 12.7735, 0, 0, 'Southshore Guard - Move'),
(243503, 5, 3, 0, 1011, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -866.533, -538.207, 8.49329, 0, 0, 'Southshore Guard - Move'),
(243503, 7, 3, 0, 1302, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -885.609, -542.527, 7.21792, 0, 0, 'Southshore Guard - Move'),
(243503, 8, 3, 0, 901, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -897.598, -544.321, 6.87962, 0, 0, 'Southshore Guard - Move'),
(243503, 9, 3, 0, 1601, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -902.318, -544.345, 6.87962, 0, 0, 'Southshore Guard - Move'),
(243503, 12, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243504;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243504, 1, 3, 0, 4982, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -878.976, -614.334, 6.35845, 0, 0, 'Southshore Guard - Move'),
(243504, 4, 3, 0, 4118, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -867.666, -629.993, 7.5186, 0, 0, 'Southshore Guard - Move'),
(243504, 6, 3, 0, 3703, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -867.149, -645.85, 10.1492, 0, 0, 'Southshore Guard - Move'),
(243504, 8, 3, 0, 676, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -843.583, -645.406, 16.4311, 0, 0, 'Southshore Guard - Move'),
(243504, 11, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243505;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243505, 1, 3, 0, 597, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -874.746, -573.897, 11.5886, 0, 0, 'Southshore Guard - Move'),
(243505, 2, 3, 0, 788, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -880.854, -580.928, 10.979, 0, 0, 'Southshore Guard - Move'),
(243505, 4, 3, 0, 816, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -879.883, -593.102, 9.9001, 0, 0, 'Southshore Guard - Move'),
(243505, 6, 3, 0, 1349, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -879.029, -612.981, 6.19609, 0, 0, 'Southshore Guard - Move'),
(243505, 7, 3, 0, 1057, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -870.367, -626.243, 6.61821, 0, 0, 'Southshore Guard - Move'),
(243505, 8, 3, 0, 3935, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -841.871, -640.051, 16.0813, 0, 0, 'Southshore Guard - Move'),
(243505, 11, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243506;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243506, 0, 3, 0, 2741, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -860.563, -520.896, 10.9899, 0, 0, 'Southshore Guard - Move'),
(243506, 2, 3, 0, 4523, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -830.389, -520.065, 12.4591, 0, 0, 'Southshore Guard - Move'),
(243506, 5, 3, 0, 4132, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -833.688, -496.637, 16.5962, 0, 0, 'Southshore Guard - Move'),
(243506, 7, 3, 0, 5664, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -840.332, -462.552, 11.3648, 0, 0, 'Southshore Guard - Move'),
(243506, 10, 3, 0, 4831, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -860.812, -449.905, 11.5171, 0, 0, 'Southshore Guard - Move'),
(243506, 13, 3, 0, 5069, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -876.748, -424.008, 10.6959, 0, 0, 'Southshore Guard - Move'),
(243506, 15, 3, 0, 3037, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -880.01, -417.176, 10.6465, 0, 0, 'Southshore Guard - Move'),
(243506, 18, 3, 0, 893, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -880.184, -419.371, 10.3621, 0, 0, 'Southshore Guard - Move'),
(243506, 21, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243507;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243507, 0, 3, 0, 350, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -863.81, -496.398, 13.3538, 0, 0, 'Southshore Guard - Move'),
(243507, 2, 3, 0, 1184, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -860.937, -513.684, 11.06, 0, 0, 'Southshore Guard - Move'),
(243507, 4, 3, 0, 756, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -858.475, -524.878, 10.5119, 0, 0, 'Southshore Guard - Move'),
(243507, 5, 3, 0, 826, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -846.201, -526.387, 11.0783, 0, 0, 'Southshore Guard - Move'),
(243507, 7, 3, 0, 1209, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -830.803, -517.105, 12.6693, 0, 0, 'Southshore Guard - Move'),
(243507, 8, 3, 0, 2903, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -829.459, -474.105, 15.2878, 0, 0, 'Southshore Guard - Move'),
(243507, 10, 3, 0, 398, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -835.686, -485.885, 14.7551, 0, 0, 'Southshore Guard - Move'),
(243507, 12, 3, 0, 1081, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -838.85, -470.139, 12.0356, 0, 0, 'Southshore Guard - Move'),
(243507, 13, 3, 0, 3065, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -861.375, -429.504, 11.5338, 0, 0, 'Southshore Guard - Move'),
(243507, 15, 3, 0, 2164, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -885.691, -450.73, 10.2349, 0, 0, 'Southshore Guard - Move'),
(243507, 17, 3, 0, 2206, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -868.993, -414.111, 12.0528, 0, 0, 'Southshore Guard - Move'),
(243507, 19, 3, 0, 1593, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, -873.529, -420.94, 11.4227, 0, 0, 'Southshore Guard - Move'),
(243507, 22, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243508;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243508, 1, 3, 0, 3758, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -811.192, -524.215, 15.4196, 0, 0, 'Southshore Guard - Move'),
(243508, 2, 3, 0, 3650, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -806.47, -510.165, 17.7401, 0, 0, 'Southshore Guard - Move'),
(243508, 4, 3, 0, 5829, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -796.442, -477.976, 17.3567, 0, 0, 'Southshore Guard - Move'),
(243508, 7, 3, 0, 4008, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -801.218, -460.606, 16.3138, 0, 0, 'Southshore Guard - Move'),
(243508, 9, 3, 0, 3763, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -801.012, -446.868, 17.879, 0, 0, 'Southshore Guard - Move'),
(243508, 10, 3, 0, 3755, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -794.068, -432.563, 19.2965, 0, 0, 'Southshore Guard - Move'),
(243508, 12, 3, 0, 1049, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -791.534, -432.07, 19.6855, 0, 0, 'Southshore Guard - Move'),
(243508, 15, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243509;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243509, 1, 3, 0, 360, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -818.436, -503.501, 15.3109, 0, 0, 'Southshore Guard - Move'),
(243509, 2, 3, 0, 2340, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -839.998, -531.01, 11.9814, 0, 0, 'Southshore Guard - Move'),
(243509, 4, 3, 0, 2568, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -797.96, -539.399, 16.3528, 0, 0, 'Southshore Guard - Move'),
(243509, 5, 3, 0, 902, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -809.075, -517.918, 16.528, 0, 0, 'Southshore Guard - Move'),
(243509, 7, 3, 0, 3196, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -796.521, -471.88, 16.6262, 0, 0, 'Southshore Guard - Move'),
(243509, 9, 3, 0, 3300, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -785.893, -449.136, 22.1255, 0, 0, 'Southshore Guard - Move'),
(243509, 10, 3, 0, 2838, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -819.587, -438.019, 13.9894, 0, 0, 'Southshore Guard - Move'),
(243509, 12, 3, 0, 2099, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -781.496, -437.445, 21.333, 0, 0, 'Southshore Guard - Move'),
(243509, 14, 3, 0, 2027, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -806.344, -417.402, 15.9492, 0, 0, 'Southshore Guard - Move'),
(243509, 17, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

-- timings off due to incomplete sniff
DELETE FROM `generic_scripts` WHERE `id`=243510;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243510, 0, 3, 0, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -782.269, -509.026, 18.8601, 0, 0, 'Southshore Guard - Move'),
(243510, 2, 3, 0, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -788.217, -517.664, 17.7153, 0, 0, 'Southshore Guard - Move'),
(243510, 4, 3, 0, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -799.213, -527.854, 16.7172, 0, 0, 'Southshore Guard - Move'),
(243510, 6, 3, 0, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -797.417, -534.636, 16.543, 0, 0, 'Southshore Guard - Move'),
(243510, 8, 3, 0, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -784.416, -541.493, 18.103, 0, 0, 'Southshore Guard - Move'),
(243510, 10, 3, 0, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -763.778, -545.218, 17.9648, 0, 0, 'Southshore Guard - Move'),
(243510, 13, 3, 0, 2000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -744.096, -534.273, 20.9565, 0, 0, 'Southshore Guard - Move'),
(243510, 16, 3, 0, 2000, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -733.222, -529.082, 22.755, 0, 0, 'Southshore Guard - Move'),
(243510, 19, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

-- timings off due to incomplete sniff
DELETE FROM `generic_scripts` WHERE `id`=243511;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243511, 0, 3, 0, 2343, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -784.115, -504.936, 18.8601, 0, 0, 'Southshore Guard - Move'),
(243511, 2, 3, 0, 2359, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -781.875, -506.887, 18.8601, 0, 0, 'Southshore Guard - Move'),
(243511, 4, 3, 0, 1452, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -782.915, -509.965, 18.8601, 0, 0, 'Southshore Guard - Move'),
(243511, 5, 3, 0, 4352, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -788.527, -519.874, 17.7153, 0, 0, 'Southshore Guard - Move'),
(243511, 7, 3, 0, 4081, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -792.64, -523.75, 17.7153, 0, 0, 'Southshore Guard - Move'),
(243511, 8, 3, 0, 2396, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -790.3, -519.487, 17.7153, 0, 0, 'Southshore Guard - Move'),
(243511, 10, 3, 0, 3207, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -798.481, -527.457, 16.8527, 0, 0, 'Southshore Guard - Move'),
(243511, 12, 3, 0, 2364, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -796.935, -525.849, 17.2314, 0, 0, 'Southshore Guard - Move'),
(243511, 13, 3, 0, 3486, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -804.472, -532.675, 15.7106, 0, 0, 'Southshore Guard - Move'),
(243511, 15, 3, 0, 4079, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -796.087, -538.252, 16.5774, 0, 0, 'Southshore Guard - Move'),
(243511, 17, 3, 0, 4111, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -791.68, -540.938, 17.1064, 0, 0, 'Southshore Guard - Move'),
(243511, 19, 3, 0, 2401, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -792.684, -538.436, 16.9858, 0, 0, 'Southshore Guard - Move'),
(243511, 20, 3, 0, 3383, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -783.046, -541.576, 18.2436, 0, 0, 'Southshore Guard - Move'),
(243511, 22, 3, 0, 2413, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -784.252, -541.444, 18.1226, 0, 0, 'Southshore Guard - Move'),
(243511, 27, 3, 0, 3181, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -772.616, -544.137, 17.9204, 0, 0, 'Southshore Guard - Move'),
(243511, 28, 3, 0, 3190, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -766.505, -544.84, 17.8964, 0, 0, 'Southshore Guard - Move'),
(243511, 30, 3, 0, 3199, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -760.518, -545.753, 18.2148, 0, 0, 'Southshore Guard - Move'),
(243511, 31, 3, 0, 3128, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -756.134, -544.215, 18.4648, 0, 0, 'Southshore Guard - Move'),
(243511, 33, 3, 0, 2406, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -756.957, -543.143, 18.4423, 0, 0, 'Southshore Guard - Move'),
(243511, 35, 3, 0, 2019, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -731.164, -532.619, 22.9293, 0, 0, 'Southshore Guard - Move'),
(243511, 38, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');

DELETE FROM `generic_scripts` WHERE `id`=243512;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243512, 14, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Southshore Guard - Set Movement Type');








-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
