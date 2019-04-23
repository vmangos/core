DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181221105453');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181221105453');
-- Add your query below.


-- Quest: Winterfall Runners
UPDATE `quest_template` SET `CompleteScript` = 5087 WHERE `entry` = 5087;
DELETE FROM `quest_end_scripts` WHERE `id` = 5087;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5087, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Runners - Donova Snowden: Remove Flag Questgiver'),
(5087, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 6231, 0, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Runners - Donova Snowden: Emote text 1'),
(5087, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6232, 0, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Runners - Donova Snowden: Say text 2'),
(5087, 7, 61, 5087, 1800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Runners - Donova Snowden: Start Map Event'),
(5087, 7, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 9298, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Runners - Donova Snowden: Start Waypoint');

DELETE FROM `creature_movement_special` WHERE `id` = 9298;
INSERT INTO `creature_movement_special` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`orientation`) VALUES
(9298,1,6379.99,-2527.63,536.729,4000,929801,100),
(9298,2,6395.57,-2536.75,541.548,1000,0,100);

DELETE FROM `creature_movement_scripts` WHERE `id` = 929801;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(929801, 1, 10, 14372, 180000, 0, 0, 0, 0, 0, 0, 0, 14372, 6, 9, 6387.13, -2481.36, 540.824, 4.25282, 0, 'Donova Snowden - Summon Creature'),
(929801, 1, 10, 14372, 180000, 0, 0, 0, 0, 0, 0, 0, 14372, 6, 9, 6393.32, -2468.99, 541.812, 4.25282, 0, 'Donova Snowden - Summon Creature'),
(929801, 1, 10, 14372, 180000, 0, 0, 0, 0, 0, 0, 0, 14372, 6, 9, 6390.48, -2475.06, 541.658, 4.25282, 0, 'Donova Snowden - Summon Creature'),
(929801, 2, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Donova Snowden - Set Run On'),
(929801, 2, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.64922, 0, 'Donova Snowden - Set Orientation'),
(929801, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6233, 0, 0, 0, 0, 0, 0, 0, 0, 'Donova Snowden - Say Text'),
(929801, 7, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.63731, 0, 'Donova Snowden - Set Orientation'),
(929801, 14, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Donova Snowden - Add Flag Questgiver');

DELETE FROM `event_scripts` WHERE `id` = 14372;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(14372, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 14372, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Ambusher - Start Waypoints');

UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 14372;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 14372;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1437201, 14372, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1437201, 0, 0, 'Winterfall Ambusher - Cast Spell On Spawn');

DELETE FROM `creature_ai_scripts` WHERE `id` = 1437201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1437201, 0, 15, 17205, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winterfall Ambusher - Cast Spell \'Winterfall Firewater\'');

DELETE FROM `creature_movement_special` WHERE `id` = 14372;
INSERT INTO `creature_movement_special` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`orientation`) VALUES
(14372,1,6378.32,-2501.16,537.467,0,0,100),
(14372,2,6376.79,-2520.54,535.867,0,1437201,100);

DELETE FROM `creature_movement_scripts` WHERE `id` = 1437201;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1437201, 0, 26, 0, 0, 0, 0, 5087, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 'Winterfall Ambusher - Start Attack Player (Event - 5087)');

UPDATE `broadcast_text` SET `EmoteId0` = 6 WHERE `ID` = 6232;
UPDATE `broadcast_text` SET `EmoteId0` = 5 WHERE `ID` = 6233;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
