DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620214705');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620214705');
-- Add your query below.


-- farmer furlbrow
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 237;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23701, 237, 0, 1, 0, 100, 1, 75000, 90000, 150000, 180000, 23701, 0, 0, 'farmer furlbrow - say');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, 57, 0, 0, 0, 0, 0, 0, 0, 'farmer furlbrow - say');


-- verna furlbrow
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 238;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23801, 238, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 23801, 0, 0, 'verna furlbrow - speak');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 55, 0, 0, 0, 0, 0, 0, 0, 'verna furlbrow - speak');


-- farmer saldean
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 238;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23301, 233, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 23301, 0, 0, 'farmer saldean - speak');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 59, 60, 0, 0, 0, 0, 0, 0, 'farmer saldean - speak');


-- add protector weaver waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 488;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(488, 1, -10494.1, 1028.33, 95.6125, 100, 0, 0, 0),
(488, 2, -10494, 1027.09, 95.6125, 100, 0, 0, 0),
(488, 3, -10493.7, 1023.06, 95.6125, 100, 0, 0, 0),
(488, 4, -10495.6, 1021.03, 95.6125, 100, 0, 0, 0),
(488, 5, -10497.4, 1019.07, 95.6125, 100, 0, 0, 0),
(488, 6, -10498.7, 1018.96, 95.6125, 100, 0, 0, 0),
(488, 7, -10503.9, 1019.15, 95.6125, 100, 0, 0, 0),
(488, 8, -10504.9, 1020.06, 95.6125, 100, 0, 0, 0),
(488, 9, -10506.9, 1021.79, 95.6125, 100, 0, 0, 0),
(488, 10, -10507.5, 1024.46, 95.6125, 100, 0, 0, 0),
(488, 11, -10506.5, 1029.2, 95.6125, 100, 0, 0, 0),
(488, 12, -10505.7, 1030.25, 95.6125, 100, 0, 0, 0),
(488, 13, -10504, 1032.41, 95.6125, 100, 0, 0, 0),
(488, 14, -10502.8, 1032.73, 95.6125, 100, 0, 0, 0),
(488, 15, -10496.7, 1031.4, 95.6122, 100, 0, 0, 0),
(488, 16, -10495.8, 1030.45, 95.6121, 100, 0, 0, 0);


-- update protector dorana waypoints
DELETE FROM creature_movement WHERE id = 89532;
UPDATE `creature` SET `position_x` = -10197.4, `position_y` = 988.166, `position_z` = 33.0215 WHERE `id` = 869;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(869, 1, -10197.4, 988.166, 33.0215, 100, 0, 0, 0),
(869, 2, -10212.7, 993.453, 32.5429, 100, 0, 0, 0),
(869, 3, -10216.5, 994.564, 32.4853, 100, 0, 0, 0),
(869, 4, -10228.6, 995.737, 31.9918, 100, 0, 0, 0),
(869, 5, -10256.2, 991.014, 31.3775, 100, 0, 0, 0),
(869, 6, -10266.1, 984.771, 31.3251, 100, 0, 0, 0),
(869, 7, -10272.1, 974.315, 31.2214, 100, 0, 0, 0),
(869, 8, -10280.9, 966.746, 31.1856, 100, 0, 0, 0),
(869, 9, -10288.2, 964.36, 31.1974, 100, 0, 0, 0),
(869, 10, -10330.4, 977.563, 31.2548, 100, 0, 0, 0),
(869, 11, -10362.4, 980.346, 31.1638, 100, 0, 0, 0),
(869, 12, -10370.4, 981.149, 31.1479, 100, 0, 0, 0),
(869, 13, -10382.3, 983.277, 31.0827, 100, 0, 0, 0),
(869, 14, -10396.9, 990.324, 31.5598, 100, 0, 0, 0),
(869, 15, -10408.2, 994.21, 32.0454, 100, 0, 0, 0),
(869, 16, -10429.5, 984.057, 34.2767, 100, 0, 0, 0),
(869, 17, -10445.4, 971.76, 35.1749, 100, 0, 0, 0),
(869, 18, -10464.1, 956.154, 35.5314, 100, 0, 0, 0),
(869, 19, -10467.2, 953.811, 35.9535, 100, 0, 0, 0),
(869, 20, -10495.3, 952.824, 39.0622, 100, 0, 0, 0),
(869, 21, -10530.4, 961.276, 40.8875, 100, 0, 0, 0),
(869, 22, -10560.2, 973.82, 40.9455, 100, 0, 0, 0),
(869, 23, -10589.9, 986.219, 37.1973, 100, 0, 0, 0),
(869, 24, -10615.2, 998.396, 33.3854, 100, 0, 0, 0),
(869, 25, -10638.8, 1013.84, 31.7608, 100, 0, 0, 0),
(869, 26, -10647.5, 1012.37, 31.7765, 100, 0, 0, 0),
(869, 27, -10644.5, 1015.11, 31.5651, 100, 0, 0, 0),
(869, 28, -10624.8, 1004.12, 32.6886, 100, 0, 0, 0),
(869, 29, -10596.6, 989.205, 36.4663, 100, 0, 0, 0),
(869, 30, -10567, 976.743, 40.3615, 100, 0, 0, 0),
(869, 31, -10537.3, 963.922, 41.1886, 100, 0, 0, 0),
(869, 32, -10502.7, 953.329, 39.6958, 100, 0, 0, 0),
(869, 33, -10470.4, 953.687, 36.1321, 100, 0, 0, 0),
(869, 34, -10435.4, 980.078, 34.7469, 100, 0, 0, 0),
(869, 35, -10414.7, 992.349, 32.5759, 100, 0, 0, 0),
(869, 36, -10403.3, 993.174, 31.7505, 100, 0, 0, 0),
(869, 37, -10389.2, 985.575, 31.1479, 100, 0, 0, 0),
(869, 38, -10369.7, 981.036, 31.1479, 100, 0, 0, 0),
(869, 39, -10337.6, 979.009, 31.2418, 100, 0, 0, 0),
(869, 40, -10303.5, 966.942, 31.2532, 100, 0, 0, 0),
(869, 41, -10287.7, 964.306, 31.195, 100, 0, 0, 0),
(869, 42, -10276.9, 968.969, 31.1856, 100, 0, 0, 0),
(869, 43, -10270, 978.423, 31.2619, 100, 0, 0, 0),
(869, 44, -10262.8, 987.988, 31.358, 100, 0, 0, 0),
(869, 45, -10244.3, 993.825, 31.448, 100, 0, 0, 0),
(869, 46, -10220.4, 994.948, 32.4233, 100, 0, 0, 0),
(869, 47, -10204.9, 990.924, 32.7439, 100, 0, 0, 0),
(869, 48, -10193.6, 986.492, 33.4625, 100, 0, 0, 0),
(869, 49, -10169.8, 986.489, 34.2844, 100, 0, 0, 0),
(869, 50, -10137.8, 990.136, 35.5978, 100, 0, 0, 0),
(869, 51, -10121.9, 990.285, 37.7313, 100, 0, 0, 0),
(869, 52, -10100.2, 999.191, 37.4609, 100, 0, 0, 0),
(869, 53, -10114.3, 991.44, 38.2191, 100, 0, 0, 0),
(869, 54, -10130, 990.544, 36.672, 100, 0, 0, 0),
(869, 55, -10162.3, 987.258, 33.9972, 100, 0, 0, 0),
(869, 56, -10186.5, 985.172, 34.1512, 100, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
