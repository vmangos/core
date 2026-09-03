DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260903140414');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260903140414');
-- Add your query below.


-- 3519: Creature 3519 Is Alive Within 10 Yards Of The Source
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3519, 20, 3519, 10, 0, 0, 2);

-- Quest accept script for quest Mist.
DELETE FROM `quest_start_scripts` WHERE `id`=938;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(938, 0, 0, 61, 938, 540, 0, 0, 0, 0, 0, 8, 3519, 93801, 6303, 93802, 0, 0, 0, 0, 0, 'Mist: Start Scripted Map Event'),
(938, 0, 1, 22, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Set Faction to Escortee'),
(938, 0, 2, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Remove Immune to NPC Flag'),
(938, 0, 3, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Remove Quest Giver Flag'),
(938, 0, 4, 93, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Follow Player');

-- Success script for quest Mist.
DELETE FROM `generic_scripts` WHERE `id`=93801;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(93801, 0, 0, 35, 0, 0, 0, 0, 3519, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Sentinel Arynia Cloudsbreak - Set Orientation'),
(93801, 0, 1, 4, 147, 2, 2, 0, 3519, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Sentinel Arynia Cloudsbreak - Remove Npc Flags'),
(93801, 0, 2, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Stop Following Player'),
(93801, 0, 3, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Move Idle'),
(93801, 1, 0, 7, 938, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Player - Complete Quest Mist'),
(93801, 2, 0, 3, 2, 0, 2, 2, 3519, 5, 10, 0, 0, 0, 0, 0, 3, 0, 0, -1, 0, 'Mist: Mist - Move'),
(93801, 3, 0, 28, 8, 0, 0, 0, 3519, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Sentinel Arynia Cloudsbreak - Set Stand State to UNIT_STAND_STATE_KNEEL'),
(93801, 6, 0, 0, 0, 0, 0, 0, 3519, 30, 10, 2, 1330, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Sentinel Arynia Cloudsbreak - Say Text'),
(93801, 6, 1, 1, 1, 0, 0, 0, 3519, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Sentinel Arynia Cloudsbreak - Emote OneShotTalk'),
(93801, 7, 0, 3, 0, 1082, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10663.6, 1864.91, 1324.42, 4.3, 0, 'Mist: Mist - Move'),
(93801, 9, 0, 35, 1, 0, 0, 0, 3519, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 2.86234, 0, 'Mist: Sentinel Arynia Cloudsbreak - Set Orientation'),
(93801, 9, 1, 28, 0, 0, 0, 0, 3519, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Sentinel Arynia Cloudsbreak - Set Stand State to UNIT_STAND_STATE_STAND'),
(93801, 9, 2, 4, 147, 2, 1, 0, 3519, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Sentinel Arynia Cloudsbreak - Add Npc Flags'),
(93801, 10, 0, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Add Unit Flags'),
(93801, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1340, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Say Text'),
(93801, 14, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Toggle Run'),
(93801, 14, 1, 20, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist: Mist - Start Waypoints');

-- Failure script for quest Mist.
DELETE FROM `generic_scripts` WHERE `id`=93802;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(93802, 0, 0, 70, 938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist Failed: Fail Quest Mist'),
(93802, 0, 1, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist Failed: Mist - Stop Following'),
(93802, 0, 2, 4, 46, 768, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist Failed: Mist - Add Immune to PC and NPC Flags'),
(93802, 0, 3, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist Failed: Mist - Add Quest Giver Flag'),
(93802, 0, 4, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist Failed: Mist - Reset Faction'),
(93802, 0, 5, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mist Failed: Mist - Respawn Creature');

-- Waypoints for Mist.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(3568, 1, 10656.367188, 1842.998535, 1321.744873, 100.000000, 0, 0.000000, 0),
(3568, 2, 10653.218750, 1830.813843, 1324.708008, 100.000000, 0, 0.000000, 0),
(3568, 3, 10650.784180, 1805.485718, 1326.677979, 100.000000, 0, 0.000000, 0),
(3568, 4, 10653.557617, 1793.180298, 1325.360352, 100.000000, 0, 0.000000, 0),
(3568, 5, 10658.532227, 1781.475708, 1323.398438, 100.000000, 0, 0.000000, 0),
(3568, 6, 10665.034180, 1771.006470, 1322.768311, 100.000000, 0, 0.000000, 0),
(3568, 7, 10688.408203, 1761.613281, 1318.239258, 100.000000, 0, 0.000000, 0),
(3568, 8, 10725.821289, 1752.209351, 1314.368042, 100.000000, 5000, 0.000000, 4);

-- Assign script.
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=3568;
UPDATE `quest_template` SET `StartScript`=938 WHERE `entry`=938;

-- Quest turn in script for quest Mortality Wanes.
DELETE FROM `quest_end_scripts` WHERE `id`=1142;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1142, 0, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mortality Wanes: Treshala Fallowbrook - Emote Cry');
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=4521;
UPDATE `quest_template` SET `CompleteScript`=1142 WHERE `entry`=1142;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
