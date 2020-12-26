DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201224122604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201224122604');
-- Add your query below.


-- remove incorrect Gadgetzan Bruisers
DELETE FROM `creature` WHERE `guid` IN (60002, 60000, 60001, 23576, 23582, 23583);
DELETE FROM `creature_movement` WHERE `id` = 60000;

-- add Trenton Lighthammer script
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 7804;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780401, 7804, 0, 1, 0, 100, 1, 0, 0, 78000, 78000, 780401, 0, 0, 'Trenton Lighthammer - Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780401, 0, 39, 780401, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Trenton Lighthammer - Start Script');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780401, 0, 39, 780401, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Trenton Lighthammer - Start Script');

-- Chronalis correct position
UPDATE `creature` SET `position_x` = -8182.6, `position_y` = -4693.49, `position_z` = 16.4608 WHERE `guid` = 21774;

-- Tick correct position
UPDATE `creature` SET `position_x` = -8189.83, `position_y` = -4586.73, `position_z` = 8.14232, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 21775;

-- Occulus correct position
UPDATE `creature` SET `position_x` = -8195.5, `position_y` = -4480.25, `position_z` = 9.20932, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 21773;


-- Thousand Needles
-- Tarkreu Shadowstalker should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 21697;

-- Nagzehn waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 21695;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(4545, 1, -5854.42, -3418.36, -50.9324, 100, 5000, 0, 0),
(4545, 2, -5853.9, -3410.98, -50.9325, 100, 0, 0, 0),
(4545, 3, -5852.32, -3407.94, -50.9325, 100, 0, 0, 0),
(4545, 4, -5849.7, -3407.4, -50.9335, 100, 5000, 0, 0),
(4545, 5, -5843.16, -3408.65, -50.9749, 100, 0, 0, 0),
(4545, 6, -5840.28, -3409.66, -50.9317, 100, 0, 0, 0),
(4545, 7, -5837.72, -3410.56, -50.9328, 100, 0, 0, 0),
(4545, 8, -5832.82, -3415.98, -50.9326, 100, 5000, 0, 0),
(4545, 9, -5834.44, -3418.55, -50.9325, 100, 0, 0, 0),
(4545, 10, -5839.25, -3421.45, -50.9325, 100, 0, 0, 0),
(4545, 11, -5850.07, -3415.56, -50.9325, 100, 0, 0, 0);

-- Gnome Pit Crewman should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 0.5 WHERE `guid` IN (21557, 21559, 21558, 21556, 21555, 21552, 21551, 21553, 21554);

-- Kravel Koalbeard should kneel
REPLACE INTO `creature_addon` (`guid`, `stand_state`) VALUES
(21570, 8);

-- Riznek waypoints
UPDATE `creature` SET `position_x` = -6203.1, `position_y` = -3954.67, `position_z` = -58.7497, `movement_type` = 2 WHERE `guid` = 21565;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(6495, 1, -6203.1, -3954.67, -58.7497, 100, 0, 0, 0),
(6495, 2, -6207.52, -3958.79, -58.7497, 100, 0, 0, 0),
(6495, 3, -6209.93, -3969.56, -58.7494, 100, 0, 0, 0),
(6495, 4, -6208.04, -3978.33, -58.7494, 100, 0, 0, 0),
(6495, 5, -6202.85, -3991.94, -58.7498, 100, 0, 0, 0),
(6495, 6, -6242.02, -3996.55, -58.7496, 100, 5000, 0, 0),
(6495, 7, -6207.74, -3994.45, -58.749, 100, 0, 0, 0),
(6495, 8, -6202.85, -3984.7, -58.75, 100, 0, 0, 0),
(6495, 9, -6202.17, -3980.26, -58.7494, 100, 0, 0, 0),
(6495, 10, -6207.45, -3969.33, -58.7497, 100, 0, 0, 0),
(6495, 11, -6209.32, -3960.58, -58.7499, 100, 0, 0, 0),
(6495, 12, -6201.02, -3952.99, -58.7501, 100, 0, 0, 0),
(6495, 13, -6189.44, -3943.26, -58.7497, 100, 0, 0, 0),
(6495, 14, -6185.61, -3932.48, -58.75, 100, 0, 0, 0),
(6495, 15, -6184.11, -3920.45, -58.7698, 100, 0, 0, 0),
(6495, 16, -6157.86, -3917.68, -58.9962, 100, 5000, 0, 0),
(6495, 17, -6182.1, -3917.68, -58.841, 100, 0, 0, 0),
(6495, 18, -6187.61, -3933.56, -58.7496, 100, 0, 0, 0),
(6495, 19, -6198.61, -3950.78, -58.7495, 100, 0, 0, 0);

-- make Motega Firemane more blizzlike
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2169302, 1, 28, 8, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Motega Firemane - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2169302, 4, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Motega Firemane - Set Stand State');
UPDATE `creature_movement` SET `script_id` = 2169302 WHERE `id` = 21693 AND `point` = 4;


-- Ferales
-- Kristy Grant should roam
UPDATE `creature` SET `position_x` = -4507.80, `position_y` = -766.646, `position_z` = -37.5925, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 50057;


-- Un'Goro
-- add Bloodpetal Pest infestation event
DELETE FROM `creature` WHERE `guid` IN (24444, 24442, 24441, 24443);
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 9119;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (911901, 9119, 0, 1, 0, 100, 1, 360000, 360000, 360000, 360000, 911901, 0, 0, 'Muigin - Summon Creature OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911901, 0, 10, 9157, 660000, 0, 0, 0, 0, 0, 0, 0, 915701, 6, 10, -6211.25, -1057.72, -197.9, 0, 0, 'Muigin - Summon Creature');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911901, 0, 10, 9157, 660000, 0, 0, 0, 0, 0, 0, 0, 915701, 6, 10, -6211.25, -1057.72, -197.9, 0, 0, 'Muigin - Summon Creature');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911901, 0, 10, 9157, 660000, 0, 0, 0, 0, 0, 0, 0, 915701, 6, 10, -6211.25, -1057.72, -197.9, 0, 0, 'Muigin - Summon Creature');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911901, 0, 10, 9157, 660000, 0, 0, 0, 0, 0, 0, 0, 915701, 6, 10, -6211.25, -1057.72, -197.9, 0, 0, 'Muigin - Summon Creature');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911901, 0, 10, 9157, 660000, 0, 0, 0, 0, 0, 0, 0, 915701, 6, 10, -6211.25, -1057.72, -197.9, 0, 0, 'Muigin - Summon Creature');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (915701, 2, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodpetal Pest - Run');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (915701, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6190.68, -1099.47, -215.189, 0, 0, 'Bloodpetal Pest - Move');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (915701, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6202.634, -1114.64, -220.1, 0, 0, 'Bloodpetal Pest - Move');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (915701, 12, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 'Bloodpetal Pest - Set Move type');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
