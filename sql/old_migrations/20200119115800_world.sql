DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200119115800');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200119115800');
-- Add your query below.


-- Remove not needed custom text entries
DELETE FROM `script_texts` WHERE `entry` IN (-1000499, -1000500);

-- Remove wrong waypoints for Overlord Mok'Morokk
DELETE FROM `script_waypoint` WHERE `entry`=4500;

-- Waypoints for Overlord Mok'Morokk
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(4500, 1, -3138.42, -2871.17, 34.7173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 2, -3136.71, -2858.31, 34.7277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 3, -3120.89, -2847.41, 34.7246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 4, -3108.02, -2841.21, 34.325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 5, -3096.59, -2824.43, 34.2116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 6, -3093.38, -2818.37, 34.429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 7, -3099.71, -2808.6, 34.266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 8, -3104.32, -2798.5, 33.9432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 9, -3106, -2783.15, 34.3499, 5000, 0, 450009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4500, 10, -3106, -2783.15, 34.3499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Waypoint script for Overlord Mok'Morokk
DELETE FROM `creature_movement_scripts` WHERE `id`=450009;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450009, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk - Despawn');

-- Start script for quest Challenge Overlord Mok'Morokk
DELETE FROM `quest_start_scripts` WHERE `id`=1173;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1173, 0, 61, 1173, 300, 0, 0, 0, 0, 0, 8, 0, 117301, 6304, 117302, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk: Overlord Mok\'Morokk - Start Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1173, 2, 4, 147, 2, 2, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk: Overlord Mok\'Morokk - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1173, 2, 22, 168, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk: Overlord Mok\'Morokk - Set Faction to Enemy');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1173, 2, 4, 46, 256, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk: Overlord Mok\'Morokk - Remove Immune to Player Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1173, 2, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk: Overlord Mok\'Morokk - Set Phase to 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1173, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1515, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk: Overlord Mok\'Morokk - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1173, 3, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk: Overlord Mok\'Morokk - Start Attack');

-- Success script for quest Challenge Overlord Mok'Morokk
DELETE FROM `event_scripts` WHERE `id`=117301;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (117301, 0, 7, 1173, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk Success: Complete Quest');

-- Fail script for quest Challenge Overlord Mok'Morokk
DELETE FROM `event_scripts` WHERE `id`=117302;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (117302, 0, 70, 1173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk Failed: Fail Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (117302, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk Failed: Overlord Mok\'Morokk - Set Phase to 0');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (117302, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1514, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk Failed: Overlord Mok\'Morokk - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (117302, 1, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge Overlord Mok\'Morokk Failed: Overlord Mok\'Morokk - Respawn');

-- Assign script to quest template.
UPDATE `quest_template` SET `SpecialFlags`=2, `StartScript`=1173 WHERE `entry`=1173;

-- Events list for Overlord Mok'Morokk
DELETE FROM `creature_ai_events` WHERE `creature_id`=4500;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (450001, 4500, 0, 2, 5, 100, 0, 30, 1, 0, 0, 450001, 0, 0, 'Overlord Mok\'Morokk: Complete Event on 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (450002, 4500, 0, 21, 3, 100, 0, 0, 0, 0, 0, 450002, 0, 0, 'Overlord Mok\'Morokk: Start Waypints on Reached Home');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (450003, 4500, 0, 11, 0, 100, 0, 0, 0, 0, 0, 450003, 0, 0, 'Overlord Mok\'Morokk: Reset Flags on Respawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (450004, 4500, 0, 7, 5, 100, 0, 0, 0, 0, 0, 450004, 0, 0, 'Overlord Mok\'Morokk: Fail Quest on Evade');
DELETE FROM `creature_ai_scripts` WHERE `id`=450001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450001, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Set Phase to 2');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450001, 0, 4, 46, 256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Add Immune to Player Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450001, 0, 62, 1173, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Complete Map Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450001, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Enter Evade Mode');
DELETE FROM `creature_ai_scripts` WHERE `id`=450002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450002, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1523, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450002, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Set Phase to 0');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450002, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Set Run');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450002, 0, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Start Waypints');
DELETE FROM `creature_ai_scripts` WHERE `id`=450003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450003, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Add Quest Giver Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450003, 0, 4, 46, 256, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Remove Immune to Player Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450003, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: Set Phase to 0');
DELETE FROM `creature_ai_scripts` WHERE `id`=450004;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (450004, 0, 62, 1173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Mok\'Morokk: End Map Event');

-- Assign Event AI to Overlord Mok'Morokk
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=4500;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
