DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190104135814');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190104135814');
-- Add your query below.


-- Texts
DELETE FROM `script_texts` WHERE `entry` IN (-1000357, -1000358, -1000359);
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=8327;

-- Target Alive
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1000, 46, 0, 0, 0, 0, 2);

-- Waypoints
DELETE FROM `script_waypoint` WHERE `entry`=11856;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(11856, 1, 113.91, -350.13, 4.55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 2, 109.54, -350.08, 3.74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 3, 106.95, -353.4, 3.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 4, 100.28, -338.89, 2.97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 5, 110.11, -320.26, 3.47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 6, 109.78, -287.8, 5.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 7, 105.02, -269.71, 4.71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 8, 86.71, -251.81, 5.34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 9, 64.1, -246.38, 5.91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 10, -2.55, -243.58, 6.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 11, -27.78, -267.53, -1.08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 12, -31.27, -283.54, -4.36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 13, -28.96, -322.44, -9.19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 14, -35.63, -360.03, -16.59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 15, -58.3, -412.26, -30.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 16, -58.88, -474.17, -44.54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 17, -45.92, -496.57, -46.26, 5000, 1185617, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(11856, 18, -40.25, -510.07, -46.05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11856, 19, -38.88, -520.72, -46.06, 5000, 1185619, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Waypoint Scripts
DELETE FROM `creature_movement_scripts` WHERE `id`=1185617;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1185617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8328, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1185617, 2, 10, 11910, 30000, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1, -50.75, -500.77, -46.13, 0.4, 0, 'Protect Kaya: Summon Creature Grimtotem Ruffian');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1185617, 2, 10, 11912, 30000, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1, -40.05, -510.89, -46.05, 1.7, 0, 'Protect Kaya: Summon Creature Grimtotem Brute');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1185617, 2, 10, 11913, 30000, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1, -32.21, -499.2, -45.35, 2.8, 0, 'Protect Kaya: Summon Creature Grimtotem Sorcerer');
DELETE FROM `creature_movement_scripts` WHERE `id`=1185619;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1185619, 0, 62, 6523, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Complete Map Event');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1185619, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Move Idle');

-- Script when the quest is accepted.
DELETE FROM `quest_start_scripts` WHERE `id`=6523;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6523, 0, 61, 6523, 900, 0, 0, 0, 0, 0, 8, 0, 652302, 1013, 652301, 0, 0, 0, 0, 0, 'Protect Kaya: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6523, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8327, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6523, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6523, 3, 22, 105, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Set Faction');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6523, 4, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 11856, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Start Waypoints');
UPDATE `quest_template` SET `StartScript`=6523 WHERE `entry`=6523;

-- Script when the quest fails.
DELETE FROM `event_scripts` WHERE `id`=652301;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (652301, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Protect Kaya: Kaya Flathoof - Despawn');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (652301, 0, 70, 6523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Fail Quest');

-- Script when the quest is completed.
DELETE FROM `event_scripts` WHERE `id`=652302;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (652302, 0, 7, 6523, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Complete Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (652302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8329, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (652302, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protect Kaya: Kaya Flathoof - Despawn');

-- Correct faction and remove hardcoded script.
UPDATE `creature_template` SET `faction`=104, `AIName`='', `ScriptName`='' WHERE `entry`=11856;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
