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

-- Misc
UPDATE `creature` SET `position_x` = -668.636, `position_y` = -562.703, `position_z` = 25.3622 WHERE `id` = 2435;
UPDATE `broadcast_text` SET `chat_type` = 2 WHERE `entry` = 623;

-- Events list for Southshore Crier
DELETE FROM `creature_ai_events` WHERE `creature_id`=2435;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (243502, 243503, 243504);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(243501, 2435, 0, 1, 0, 100, 0, 2000, 2000, 0, 0, 243501, 0, 0, 'Southshore Crier - Yell on Spawn');

DELETE FROM `creature_movement` WHERE `id` = 301755;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2435, 1, -668.636, -562.703, 25.3622, 100, 0, 0, 11),
(2435, 2, -680.996, -566.52, 25.2009, 100, 0, 0, 0),
(2435, 3, -693.22, -569.418, 24.4536, 100, 0, 0, 0),
(2435, 4, -723.958, -551.954, 20.5542, 100, 0, 0, 0),
(2435, 5, -764.897, -546.37, 17.9831, 100, 0, 0, 0),
(2435, 6, -809.579, -528.999, 15.3876, 100, 0, 0, 0),
(2435, 7, -821.22, -524.994, 13.8281, 100, 0, 0, 0),
(2435, 8, -856.326, -532.717, 9.74993, 100, 30000, 5, 243501);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(243501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 620, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 621, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 21, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Cast Spell Touch of the Black Claw'),
(243501, 21, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Cast Spell Touch of the Black Claw'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 626, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 623, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Say Text'),
(243501, 27, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Southshore Crier - Despawn Creature');











-- group 1
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -852.268, -560.181, 11.6908, 3.82227, 0, 'Summon Creature Southshore Guard'),
(1, 0, 3, 0, 2747, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -849.097, -544.966, 11.1183, 0, 0, 'Southshore Guard - Move'),
(1, 2, 3, 0, 3234, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -870.534, -538.675, 8.21938, 0, 0, 'Southshore Guard - Move'),
(1, 4, 3, 0, 5394, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -902.927, -544.349, 6.87962, 0, 0, 'Southshore Guard - Move'),
(1, 6, 3, 0, 940, 0, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -900.795, -545.331, 6.87962, 0, 0, 'Southshore Guard - Move');

INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -850.748, -561.89, 11.6908, 3.14159, 0, 'Summon Creature Southshore Guard'),
(1, 0, 3, 0, 367, 0, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -852.268, -560.181, 11.6916, 0, 0, 'Southshore Guard - Move'),
(1, 2, 3, 0, 1010, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -849.385, -552, 11.6751, 0, 0, 'Southshore Guard - Move'),
(1, 4, 3, 0, 2993, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -860.306, -509.171, 12.7735, 0, 0, 'Southshore Guard - Move'),
(1, 5, 3, 0, 1011, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -866.533, -538.207, 8.49329, 0, 0, 'Southshore Guard - Move'),
(1, 7, 3, 0, 1302, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -885.609, -542.527, 7.21792, 0, 0, 'Southshore Guard - Move'),
(1, 8, 3, 0, 901, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -897.598, -544.321, 6.87962, 0, 0, 'Southshore Guard - Move'),
(1, 9, 3, 0, 1601, 0, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -902.318, -544.345, 6.87962, 0, 0, 'Southshore Guard - Move');




-- group 2
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -874.746, -573.897, 11.6758, 2.28638, 0, 'Summon Creature Southshore Guard'),
(1, 1, 3, 0, 4982, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -878.976, -614.334, 6.35845, 0, 0, 'Southshore Guard - Move'),
(1, 4, 3, 0, 4118, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -867.666, -629.993, 7.5186, 0, 0, 'Southshore Guard - Move'),
(1, 6, 3, 0, 3703, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -867.149, -645.85, 10.1492, 0, 0, 'Southshore Guard - Move'),
(1, 8, 3, 0, 676, 0, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -843.583, -645.406, 16.4311, 0, 0, 'Southshore Guard - Move');

INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -877.416, -574.223, 11.5033, 1.0821, 0, 'Summon Creature Southshore Guard'),
(1, 1, 3, 0, 597, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -874.746, -573.897, 11.5886, 0, 0, 'Southshore Guard - Move'),
(1, 2, 3, 0, 788, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -880.854, -580.928, 10.979, 0, 0, 'Southshore Guard - Move'),
(1, 4, 3, 0, 816, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -879.883, -593.102, 9.9001, 0, 0, 'Southshore Guard - Move'),
(1, 6, 3, 0, 1349, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -879.029, -612.981, 6.19609, 0, 0, 'Southshore Guard - Move'),
(1, 7, 3, 0, 1057, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -870.367, -626.243, 6.61821, 0, 0, 'Southshore Guard - Move'),
(1, 8, 3, 0, 3935, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -841.871, -640.051, 16.0813, 0, 0, 'Southshore Guard - Move');







-- group 3
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -863.81, -496.398, 13.4382, 5.34071, 0, 'Summon Creature Southshore Guard'),
(1, 0, 3, 0, 2741, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -860.563, -520.896, 10.9899, 0, 0, 'Southshore Guard - Move'),
(1, 2, 3, 0, 4523, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -830.389, -520.065, 12.4591, 0, 0, 'Southshore Guard - Move'),
(1, 5, 3, 0, 4132, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -833.688, -496.637, 16.5962, 0, 0, 'Southshore Guard - Move'),
(1, 7, 3, 0, 5664, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -840.332, -462.552, 11.3648, 0, 0, 'Southshore Guard - Move'),
(1, 10, 3, 0, 4831, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -860.812, -449.905, 11.5171, 0, 0, 'Southshore Guard - Move'),
(1, 13, 3, 0, 5069, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -876.748, -424.008, 10.6959, 0, 0, 'Southshore Guard - Move'),
(1, 15, 3, 0, 3037, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -880.01, -417.176, 10.6465, 0, 0, 'Southshore Guard - Move'),
(1, 18, 3, 0, 893, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -880.184, -419.371, 10.3621, 0, 0, 'Southshore Guard - Move');

INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -863.394, -494.436, 13.4375, 5.53269, 0, 'Summon Creature Southshore Guard'),
(1, 0, 3, 0, 350, 0, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -863.81, -496.398, 13.3538, 0, 0, 'Southshore Guard - Move'),
(1, 2, 3, 0, 1184, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -860.937, -513.684, 11.06, 0, 0, 'Southshore Guard - Move'),
(1, 4, 3, 0, 756, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -858.475, -524.878, 10.5119, 0, 0, 'Southshore Guard - Move'),
(1, 5, 3, 0, 826, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -846.201, -526.387, 11.0783, 0, 0, 'Southshore Guard - Move'),
(1, 7, 3, 0, 1209, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -830.803, -517.105, 12.6693, 0, 0, 'Southshore Guard - Move'),
(1, 8, 3, 0, 2903, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -829.459, -474.105, 15.2878, 0, 0, 'Southshore Guard - Move'),
(1, 10, 3, 0, 398, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -835.686, -485.885, 14.7551, 0, 0, 'Southshore Guard - Move'),
(1, 12, 3, 0, 1081, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -838.85, -470.139, 12.0356, 0, 0, 'Southshore Guard - Move'),
(1, 13, 3, 0, 3065, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -861.375, -429.504, 11.5338, 0, 0, 'Southshore Guard - Move'),
(1, 15, 3, 0, 2164, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -885.691, -450.73, 10.2349, 0, 0, 'Southshore Guard - Move'),
(1, 17, 3, 0, 2206, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -868.993, -414.111, 12.0528, 0, 0, 'Southshore Guard - Move'),
(1, 19, 3, 0, 1593, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -873.529, -420.94, 11.4227, 0, 0, 'Southshore Guard - Move');








-- group 4
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -818.436, -503.501, 15.3768, 3.71755, 0, 'Summon Creature Southshore Guard'),
(1, 1, 3, 0, 3758, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -811.192, -524.215, 15.4196, 0, 0, 'Southshore Guard - Move'),
(1, 2, 3, 0, 3650, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -806.47, -510.165, 17.7401, 0, 0, 'Southshore Guard - Move'),
(1, 4, 3, 0, 5829, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -796.442, -477.976, 17.3567, 0, 0, 'Southshore Guard - Move'),
(1, 7, 3, 0, 4008, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -801.218, -460.606, 16.3138, 0, 0, 'Southshore Guard - Move'),
(1, 9, 3, 0, 3763, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -801.012, -446.868, 17.879, 0, 0, 'Southshore Guard - Move'),
(1, 10, 3, 0, 3755, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -794.068, -432.563, 19.2965, 0, 0, 'Southshore Guard - Move'),
(1, 12, 3, 0, 1049, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -791.534, -432.07, 19.6855, 0, 0, 'Southshore Guard - Move');



INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1, 0, 10, 2386, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -817.583, -505.381, 15.2609, 3.03687, 0, 'Summon Creature Southshore Guard'),
(1, 1, 3, 0, 360, 0, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -818.436, -503.501, 15.3109, 0, 0, 'Southshore Guard - Move'),
(1, 2, 3, 0, 2340, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -839.998, -531.01, 11.9814, 0, 0, 'Southshore Guard - Move'),
(1, 4, 3, 0, 2568, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -797.96, -539.399, 16.3528, 0, 0, 'Southshore Guard - Move'),
(1, 5, 3, 0, 902, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -809.075, -517.918, 16.528, 0, 0, 'Southshore Guard - Move'),
(1, 7, 3, 0, 3196, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -796.521, -471.88, 16.6262, 0, 0, 'Southshore Guard - Move'),
(1, 9, 3, 0, 3300, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -785.893, -449.136, 22.1255, 0, 0, 'Southshore Guard - Move'),
(1, 10, 3, 0, 2838, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -819.587, -438.019, 13.9894, 0, 0, 'Southshore Guard - Move'),
(1, 12, 3, 0, 2099, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -781.496, -437.445, 21.333, 0, 0, 'Southshore Guard - Move'),
(1, 14, 3, 0, 2027, 1, 2, 2386, 30, 8, 2, 0, 0, 0, 0, -806.344, -417.402, 15.9492, 0, 0, 'Southshore Guard - Move');







-- Farmer Kent Scripts
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (243601, 2436, 0, 4, 0, 100, 1, 0, 0, 0, 0, 243601, 0, 0, 'Farmer Kent - Talk on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (243601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 628, 627, 0, 0, 0, 0, 0, 0, 0, 'Farmer Kent - Talk');





-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
