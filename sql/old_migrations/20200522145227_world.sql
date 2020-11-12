DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200522145227');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200522145227');
-- Add your query below.


-- add path for haggle
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 14041;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(14041, 1, -18.4303, -17.2056, -4.29736, 100, 55000, 1.3, 0),
(14041, 2, -21.9769, -16.6178, -4.29737, 100, 0, 0, 0),
(14041, 3, -22.075, -9.7424, -4.29737, 100, 0, 0, 0),
(14041, 4, -21.3471, -9.64024, -4.29737, 100, 7000, 0, 1404101),
(14041, 5, -21.5384, -4.64424, -4.29737, 100, 0, 0, 0),
(14041, 6, -19.3452, -3.74857, -4.29737, 100, 7000, 0, 1404101),
(14041, 7, -18.3372, -5.60515, -4.29737, 100, 0, 0, 0),
(14041, 8, -14.6721, -2.92183, -4.29737, 100, 0, 0, 0),
(14041, 9, -14.6888, 21.1782, -4.29737, 100, 0, 0, 0),
(14041, 10, -18.5379, 21.4816, -4.29737, 100, 7000, 0, 1404101),
(14041, 11, -15.8772, 22.747, -4.29737, 100, 0, 0, 0),
(14041, 12, -16.3983, 27.0335, -4.29736, 3.28968, 7000, 0, 1404101),
(14041, 13, -13.5099, 25.3961, -4.29736, 100, 0, 0, 0),
(14041, 14, -13.5378, -14.4996, -4.29736, 100, 0, 0, 0),
(14041, 15, -18.4303, -17.2056, -4.29736, 100, 40000, 1.3, 0),
(14041, 16, -11.0139, -22.3596, -4.29736, 100, 0, 0, 0),
(14041, 17, -1.8459, -32.218, -4.29736, 100, 0, 0, 0),
(14041, 18, 11.9946, -32.6701, -4.29736, 100, 0, 0, 0),
(14041, 19, 15.9451, -21.4086, -4.29682, 100, 0, 0, 0),
(14041, 20, 22.3069, -17.5599, -4.29682, 1.54051, 7000, 0, 1404101),
(14041, 21, 32.003, -17.1321, -4.29682, 100, 0, 0, 0),
(14041, 22, 39.2451, -11.5749, -4.29682, 100, 7000, 0, 1404101),
(14041, 23, 37.5131, -10.4689, -4.29682, 100, 0, 0, 0),
(14041, 24, 37.3969, -0.666123, -4.29682, 100, 0, 0, 0),
(14041, 25, 39.244, 1.13247, -4.29682, 100, 7000, 0, 1404101),
(14041, 26, 28.5052, 5.15199, -4.29682, 100, 0, 0, 0),
(14041, 27, 21.3785, 14.6049, -4.29682, 100, 7000, 0, 1404101),
(14041, 28, 27.9144, 16.4489, -4.29682, 100, 0, 0, 0),
(14041, 29, 39.0292, 24.5663, -4.29649, 100, 7000, 0, 1404101),
(14041, 30, 27.8659, 34.8872, -4.29649, 100, 0, 0, 0),
(14041, 31, 20.0568, 35.1873, -4.29649, 100, 0, 0, 0),
(14041, 32, 17.5395, 29.6719, -4.29649, 100, 0, 0, 0),
(14041, 33, 17.0065, -13.1396, -4.29649, 100, 0, 0, 0),
(14041, 34, 13.0492, -31.4141, -4.29695, 100, 0, 0, 0),
(14041, 35, -1.66263, -31.2745, -4.29695, 100, 0, 0, 0),
(14041, 36, -18.2959, -17.0123, -4.29695, 100, 55000, 1.3, 1404103),
(14041, 37, -15.6317, -16.0231, -4.29695, 100, 0, 0, 0),
(14041, 38, -15.5101, -3.39945, -4.29695, 100, 0, 0, 0),
(14041, 39, -17.9317, -1.00978, -3.77108, 1.55107, 147000, 0, 1404102),
(14041, 40, -16.4948, -1.13581, -4.29712, 100, 4000, 0, 0),
(14041, 41, -14.8653, -3.04173, -4.29712, 100, 0, 0, 0),
(14041, 42, -14.9341, -15.2129, -4.29712, 100, 0, 0, 0);

-- add scripts for haggle
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404101, 1, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - start sift');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404101, 7, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - stop sift');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404102, 2, 28, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - start sleep');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404102, 147, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - stop sleep');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404101, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 9141, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404103, 54, 0, 2, 0, 0, 0, 0, 0, 0, 0, 9147, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - speak');

-- add random text for haggle
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 14041;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1404101, 14041, 0, 1, 0, 100, 3, 0, 0, 180000, 180000, 1404101, 1404102, 0, 'haggle - random say');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9098, 9088, 9089, 9150, 0, 0, 0, 0, 0, 'haggle - say text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9149, 9088, 9089, 9150, 0, 0, 0, 0, 0, 'haggle - say text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404102, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - speech emote');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1404101, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'haggle - speech emote');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
