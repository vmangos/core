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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
