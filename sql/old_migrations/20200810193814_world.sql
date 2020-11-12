DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200810193814');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200810193814');
-- Add your query below.


-- Add condition support to quests.
ALTER TABLE `quest_template`
	ADD COLUMN `RequiredCondition` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `RequiredSkillValue`;

-- Add area condition to quest Jungle Secrets.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (215, 4, 99, 0, 0, 0, 1);
UPDATE `quest_template` SET `RequiredCondition`=215 WHERE `entry`=215;

-- Assign EventAI to Private Thorsen.
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=738;

-- Events list for Private Thorsen
DELETE FROM `creature_ai_events` WHERE `creature_id`=738;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (73801, 738, 0, 2, 0, 100, 0, 15, 1, 0, 0, 73801, 0, 0, 'Private Thorsen - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (73802, 738, 0, 1, 1, 100, 1, 1000, 1000, 60000, 60000, 73802, 0, 0, 'Private Thorsen - Say Text OOC (Phase 1)');
DELETE FROM `creature_ai_scripts` WHERE `id`=73801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73801, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Flee');
DELETE FROM `creature_ai_scripts` WHERE `id`=73802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Restore Faction');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Add Quest Giver Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Set Phase to 0');

-- Event success script. Thorsen has survied.
DELETE FROM `event_scripts` WHERE `id`=73801;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73801, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Set Phase to 1');

-- Waypoints and scripts for Private Thorsen.
DELETE FROM `creature_movement` WHERE `id`=2243;
DELETE FROM `creature_movement_scripts` WHERE `id`=224302;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224302, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Remove Quest Giver Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224302, 0, 22, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Set Faction');
DELETE FROM `creature_movement_scripts` WHERE `id`=224314;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224314, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Set Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Say Text');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (738, 46, 0, 0, 0, 0, 3);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (775, 47, 738, 121, 0, 0, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=224323;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224323, 1, 61, 738, 600, 0, 0, 0, 0, 0, 0, 0, 0, 738, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Start Map Event');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224323, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224323, 2, 10, 775, 300000, 0, 0, 0, 0, 0, 0, 3, 77501, 6, 1, -11511.1, -445.023, 41.4481, 1.03381, 0, 'Private Thorsen - Summon Creature Kurzen\'s Agent');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224323, 2, 10, 775, 300000, 0, 0, 0, 0, 0, 0, 3, 77502, 6, 1, -11508.2, -442.857, 41.6781, 2.53693, 0, 'Private Thorsen - Summon Creature Kurzen\'s Agent');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224323, 5, 69, 738, 0, 0, 0, 0, 0, 0, 0, 775, 73801, 738, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Edit Map Event');
DELETE FROM `creature_movement_scripts` WHERE `id`=224325;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224325, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Remove Quest Giver Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224325, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Set Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224325, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 105, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=224332;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224332, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Set Walk');
DELETE FROM `creature_movement_scripts` WHERE `id`=224347;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224347, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224347, 2, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Add Quest Giver Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (224347, 5, 0, 0, 0, 0, 0, 733, 20, 8, 2, 108, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Yohwa - Say Text');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(2243, 1, -11313.9, -202.766, 75.576, 5.5676, 1700000, 0, 0),
(2243, 2, -11313.9, -202.766, 75.576, 5.5676, 0, 0, 224302),
(2243, 3, -11321.7, -205.85, 75.4398, 100, 0, 0, 0),
(2243, 4, -11326.7, -216.63, 76.3375, 100, 0, 0, 0),
(2243, 5, -11331, -223.29, 75.2301, 100, 0, 0, 0),
(2243, 6, -11339.5, -222.598, 75.1477, 100, 0, 0, 0),
(2243, 7, -11351.3, -212.923, 75.2968, 100, 0, 0, 0),
(2243, 8, -11361.9, -212.078, 75.2968, 100, 0, 0, 0),
(2243, 9, -11374.4, -217.351, 75.2161, 100, 0, 0, 0),
(2243, 10, -11379.1, -227.022, 73.4353, 100, 0, 0, 0),
(2243, 11, -11379.4, -239.568, 67.9693, 100, 0, 0, 0),
(2243, 12, -11382.1, -251.993, 64.5292, 100, 0, 0, 0),
(2243, 13, -11384.7, -267.21, 60.9735, 100, 0, 0, 0),
(2243, 14, -11389.4, -273.725, 59.7828, 100, 500, 0, 224314),
(2243, 15, -11421.5, -287.48, 52.1968, 100, 0, 0, 0),
(2243, 16, -11441.1, -287.254, 45.9617, 100, 0, 0, 0),
(2243, 17, -11456.1, -287.166, 41.4507, 100, 0, 0, 0),
(2243, 18, -11472.5, -288.005, 37.0786, 100, 0, 0, 0),
(2243, 19, -11491.2, -299.717, 35.798, 100, 0, 0, 0),
(2243, 20, -11510.9, -317.675, 35.8094, 100, 0, 0, 0),
(2243, 21, -11521.4, -323.755, 35.8094, 100, 0, 0, 0),
(2243, 22, -11528.3, -335.951, 36.9253, 100, 0, 0, 0),
(2243, 23, -11527.6, -353.22, 37.7493, 100, 30000, 0, 224323),
(2243, 24, -11527.6, -353.22, 37.7493, 4.67, 180000, 0, 0),
(2243, 25, -11527.6, -353.22, 37.7493, 4.67, 1000, 0, 224325),
(2243, 26, -11521.5, -328.624, 36.0411, 100, 0, 0, 0),
(2243, 27, -11497.7, -306.014, 35.7996, 100, 0, 0, 0),
(2243, 28, -11473.7, -289.043, 36.9186, 100, 0, 0, 0),
(2243, 29, -11447.1, -287.478, 44.0555, 100, 0, 0, 0),
(2243, 30, -11415.6, -287.884, 53.9915, 100, 0, 0, 0),
(2243, 31, -11394.3, -285.5, 58.7721, 100, 0, 0, 0),
(2243, 32, -11384.7, -257.563, 62.7445, 100, 500, 0, 224332),
(2243, 33, -11382.7, -245.982, 65.8541, 100, 0, 0, 0),
(2243, 34, -11382.5, -237.982, 68.5594, 100, 0, 0, 0),
(2243, 35, -11381.8, -230.669, 71.8558, 100, 0, 0, 0),
(2243, 36, -11380, -225.222, 74.0057, 100, 0, 0, 0),
(2243, 37, -11376.7, -220.913, 75.0584, 100, 0, 0, 0),
(2243, 38, -11372, -214.515, 75.3274, 100, 0, 0, 0),
(2243, 39, -11364.8, -211.369, 75.2968, 100, 0, 0, 0),
(2243, 40, -11358.4, -210.313, 75.2968, 100, 0, 0, 0),
(2243, 41, -11352.7, -210.88, 75.2968, 100, 0, 0, 0),
(2243, 42, -11344.8, -210.795, 75.2968, 100, 0, 0, 0),
(2243, 43, -11338.4, -210.338, 75.2968, 100, 0, 0, 0),
(2243, 44, -11332.4, -207.985, 75.4801, 100, 0, 0, 0),
(2243, 45, -11325.3, -205.129, 75.5001, 100, 0, 0, 0),
(2243, 46, -11316.5, -201.627, 75.8807, 100, 0, 0, 0),
(2243, 47, -11314, -202.753, 75.4623, 100, 0, 0, 224347);

-- Correct data for Kurzen's Agent.
UPDATE `creature_template` SET `faction`=35, `dmg_min`=46, `dmg_max`=54, `ai_name`='EventAI' WHERE `entry`=775;

-- Events list for Kurzen's Agent
DELETE FROM `creature_ai_events` WHERE `creature_id`=775;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (77501, 775, 0, 2, 0, 100, 0, 15, 1, 0, 0, 77501, 0, 0, 'Kurzen\'s Agent - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (77502, 775, 0, 21, 1, 100, 0, 0, 0, 0, 0, 77502, 0, 0, 'Kurzen\'s Agent - Start Waypoints on Reached Home (Phase 1)');
DELETE FROM `creature_ai_scripts` WHERE `id`=77501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77501, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Flee');
DELETE FROM `creature_ai_scripts` WHERE `id`=77502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 60, 3, 0, 1000, 0, 0, 0, 0, 0, 0, 77503, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Start Waypoints');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Walk');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Phase to 0');

-- Summon script for Kurzen's Agent 1.
DELETE FROM `event_scripts` WHERE `id`=77501;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77501, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 77501, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent 1 - Start Waypoints');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77501, 0, 63, 738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent 1 - Add to Scripted Map Event');

-- Summon script for Kurzen's Agent 2.
DELETE FROM `event_scripts` WHERE `id`=77502;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 77502, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent 2 - Start Waypoints');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 63, 738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent 2 - Add to Scripted Map Event');

-- Waypoints and scripts for Kurzen's Agent 1.
DELETE FROM `creature_movement_scripts` WHERE `id`=7750103;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750103, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Walk');
DELETE FROM `creature_movement_scripts` WHERE `id`=7750108;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750108, 0, 22, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Faction');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750108, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750108, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Home Position');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750108, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Phase to 1');
DELETE FROM `creature_movement_scripts` WHERE `id`=7750110;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750110, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750110, 1, 26, 0, 0, 0, 0, 738, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Attack Private Thorsen');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(77501, 1, -11516.2, -437.373, 41.0429, 100, 0, 0, 0),
(77501, 2, -11521.6, -405.578, 36.1154, 100, 0, 0, 0),
(77501, 3, -11518.3, -393.09, 38.6186, 100, 1000, 0, 7750103),
(77501, 4, -11512.6, -390.189, 39.3354, 100, 0, 0, 0),
(77501, 5, -11516.4, -382.152, 39.3703, 100, 0, 0, 0),
(77501, 6, -11517.7, -377.045, 39.2097, 100, 0, 0, 0),
(77501, 7, -11515.7, -370.107, 38.5608, 100, 0, 0, 0),
(77501, 8, -11517.3, -361.799, 37.8186, 100, 0, 0, 7750108),
(77501, 9, -11519.8, -354.197, 37.6753, 100, 0, 0, 0),
(77501, 10, -11524.7, -355.43, 37.7869, 0, 0, 0, 7750110);

-- Waypoints and scripts for Kurzen's Agent 2.
DELETE FROM `creature_movement_scripts` WHERE `id`=7750210;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750210, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Walk');
DELETE FROM `creature_movement_scripts` WHERE `id`=7750213;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750213, 0, 22, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Faction');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750213, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750213, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Home Position');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750213, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Set Phase to 1');
DELETE FROM `creature_movement_scripts` WHERE `id`=7750214;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750214, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Move Idle');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750214, 1, 26, 0, 0, 0, 0, 738, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Attack Private Thorsen');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(77502, 1, -11515.8, -422.914, 38.0256, 100, 0, 0, 0),
(77502, 2, -11515.4, -417.184, 37.7756, 100, 0, 0, 0),
(77502, 3, -11515.2, -414.34, 37.539, 100, 0, 0, 0),
(77502, 4, -11515.8, -411.404, 37.0256, 100, 0, 0, 0),
(77502, 5, -11517.2, -404.555, 37.2756, 100, 0, 0, 0),
(77502, 6, -11517.7, -402.598, 37.5256, 100, 0, 0, 0),
(77502, 7, -11518.3, -399.662, 37.8354, 100, 0, 0, 0),
(77502, 8, -11518.7, -397.705, 38.0854, 100, 0, 0, 0),
(77502, 9, -11519.3, -394.77, 38.3354, 100, 0, 0, 0),
(77502, 10, -11519.7, -393.316, 38.5193, 100, 2000, 0, 7750210),
(77502, 11, -11518.7, -386.384, 39.4604, 100, 0, 0, 0),
(77502, 12, -11516.2, -373.36, 38.8261, 100, 0, 0, 0),
(77502, 13, -11518.9, -358.243, 37.6753, 100, 0, 0, 7750213),
(77502, 14, -11524.4, -355.048, 37.7224, 0, 0, 0, 7750214);

-- Return waypoints for Kurzen's Agent.
DELETE FROM `creature_movement_scripts` WHERE `id`=7750306;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7750306, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzen\'s Agent - Despawn');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES 
(77503, 1, -11518.9, -358.243, 37.6753, 100, 0, 0),
(77503, 2, -11517, -377.424, 39.1953, 100, 0, 0),
(77503, 3, -11519.2, -390.327, 38.9627, 100, 0, 0),
(77503, 4, -11519.7, -393.316, 38.5193, 100, 0, 0),
(77503, 5, -11515.7, -422.174, 38.2133, 100, 0, 0),
(77503, 6, -11516.8, -435.046, 40.6628, 100, 3000, 7750306),
(77503, 7, -11516.8, -435.046, 40.6628, 100, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
