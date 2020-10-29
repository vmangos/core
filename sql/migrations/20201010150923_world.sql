DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201010150923');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201010150923');
-- Add your query below.


-- set correct spellcost for shield slam and mortal strike rank 2
UPDATE `npc_trainer` SET `spellcost` = 2000 WHERE `spell` IN (21555, 23926);

-- set correct run_speed for defias dockworker
UPDATE `creature_template` SET `speed_run` = 0.857143 WHERE `entry` = 6927;

-- set correct values for Argent Quartermaster Hasana gossip menu option
UPDATE `gossip_menu_option` SET `action_menu_id` = -1, `action_script_id` = 3421, `condition_id` = 478 WHERE `menu_id` = 3421;

-- remove duplicate Cenarion Hold Infantry
DELETE FROM `creature` WHERE `guid` IN (42898, 42896);
DELETE FROM `creature_movement` WHERE `id` IN (42898, 42896);

-- assign correct event to objects
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES 
(3996169, 9),
(3996165, 9),
(3996166, 9),
(3996167, 9),
(3996168, 9);

-- add correct text to Warden Thelwater
DELETE FROM `creature_ai_scripts` WHERE `id`=171901;
DELETE FROM `generic_scripts` WHERE `id` IN (171901, 171902);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171901, 0, 39, 171901, 171902, 0, 0, 0, 0, 0, 4, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Warden Thelwater - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1658, 1659, 1660, 1661, 0, 0, 0, 0, 0, 'Warden Thelwater - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1662, 1661, 1660, 1659, 0, 0, 0, 0, 0, 'Warden Thelwater - Say Text');

-- remove duplicate Cliff Giant and Land Walker spawns
DELETE FROM `creature` WHERE `guid` IN (51692, 51697);

-- fenwick thatros should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 18259;

-- dalar dawnweaver should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 17613;

-- horde orphan should run
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (651701, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Orphan - Run');
UPDATE `creature_movement` SET `script_id` = 651701 WHERE `id` = 6517 AND `point` = 1;

-- keldran waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 1722;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5640, 1, 1781.55, -3997.07, 53.1638, 2.3911, 40000, 0.000000, 0),
(5640, 2, 1780.69, -3994.17, 53.1638, 100.000000, 0, 0.000000, 0),
(5640, 3, 1781.67, -3989.77, 53.1638, 100.000000, 0, 0.000000, 0),
(5640, 4, 1784.59, -3988.64, 53.1638, 100.000000, 0, 0.000000, 0),
(5640, 5, 1778.71, -3992, 53.1638, 100.000000, 0, 0.000000, 0),
(5640, 6, 1770.25, -3992.89, 52.9891, 100.000000, 30000, 0.000000, 0);

-- kon yelloweyes should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 8 WHERE `guid` = 26757;

-- thunder bluff bonfire should be lit at night
-- add lit bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(20557, 178571, 1, -1207.63, -66.4389, 157.49, -3.03687, 0, 0, 0.99863, -0.052336, 900, 900, 100, 0, 0, 0, 0, 10);

-- remove 20556 at night
INSERT INTO `game_event_gameobject` VALUES
(20556, -27);

-- add 20557 at night
INSERT INTO `game_event_gameobject` VALUES
(20557, 27);

-- arch druid fandral staghelm should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 8 WHERE `guid` = 46903;

-- add missing emotes to ironforge airfield npcs
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES
(190201, 233);
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES
(190211, 66);
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES
(190199, 22);
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES
(190236, 133);
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES
(190237, 133);
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES
(190239, 133);
INSERT INTO `creature_addon` (`guid`, `emote`) VALUES
(190240, 133);
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`= 12047;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1204701, 0, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormpike Mountaineer - Emote');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1204701, 52, 190243, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1204701, 12047, 1204701, 1, 0, 100, 1, 0, 0, 4000, 4000, 1204701, 0, 0, 'Stormpike Mountaineer - Emote');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (559508, 5595, 559508, 1, 0, 100, 1, 0, 0, 5000, 5000, 559508, 0, 0, 'Ironforge Guard - Emote');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (559508, 52, 190209, 0, 0, 0, 0);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (559508, 0, 1, 18, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Guard - Emote');
INSERT INTO `creature_addon` (`guid`, `bytes1`) VALUES
(190244, 1);

-- add missing text to addled leper
DELETE FROM `creature_ai_scripts` WHERE `id`=622103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (622103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3829, 2425, 2423, 2424, 0, 0, 0, 0, 0, 'Addled Leper - Say Text');

-- correct waypoints and scripts for curator thorius
DELETE FROM `creature_movement` WHERE `id` = 1887;
DELETE FROM `creature_movement_scripts` WHERE `id` IN (188715, 188716);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(8256, 1, -4654.31, -1281.54, 503.382, 100, 50000, 0, 0),
(8256, 2, -4635.38, -1262.67, 503.382, 100, 0, 0, 0),
(8256, 3, -4628.48, -1254.6, 503.382, 100, 0, 0, 0),
(8256, 4, -4623.31, -1254.38, 503.382, 100, 0, 0, 0),
(8256, 5, -4622.27, -1258.7, 503.382, 4.12949, 9000, 0, 825601),
(8256, 6, -4615.69, -1255.44, 503.382, 100, 0, 0, 0),
(8256, 7, -4611, -1251.59, 503.382, 100, 0, 0, 0),
(8256, 8, -4603.86, -1251.56, 503.382, 0.331613, 9000, 0, 825602),
(8256, 9, -4600.12, -1243.45, 503.381, 100, 0, 0, 0),
(8256, 10, -4592.52, -1232.32, 503.381, 100, 0, 0, 0),
(8256, 11, -4589.17, -1222.01, 503.382, 5.77903, 9000, 0, 825603),
(8256, 12, -4590.56, -1215.33, 503.382, 100, 0, 0, 0),
(8256, 13, -4593.49, -1215.04, 503.382, 100, 0, 0, 0),
(8256, 14, -4601.52, -1222.18, 503.382, 100, 0, 0, 0),
(8256, 15, -4609.05, -1232.85, 503.382, 100, 0, 0, 0),
(8256, 16, -4613.15, -1252.13, 503.382, 100, 0, 0, 0),
(8256, 17, -4619.33, -1265.1, 503.382, 100, 0, 0, 0),
(8256, 18, -4632.15, -1275.75, 503.382, 100, 0, 0, 0),
(8256, 19, -4651.05, -1285.22, 503.382, 100, 0, 0, 0),
(8256, 20, -4664.39, -1292.38, 503.382, 100, 0, 0, 0),
(8256, 21, -4675.87, -1295.89, 503.382, 100, 0, 0, 0),
(8256, 22, -4686.99, -1300.62, 503.382, 100, 0, 0, 0),
(8256, 23, -4702.68, -1309.54, 503.382, 100, 0, 0, 0),
(8256, 24, -4711.19, -1322.43, 503.382, 3.66159, 4000, 0, 0),
(8256, 25, -4699.78, -1325.52, 503.382, 100, 0, 0, 0),
(8256, 26, -4693.85, -1325.62, 503.382, 100, 0, 0, 0),
(8256, 27, -4687.15, -1321.02, 503.382, 100, 0, 0, 0),
(8256, 28, -4684.08, -1315.78, 503.382, 100, 0, 0, 0),
(8256, 29, -4679.16, -1313.33, 503.382, 100, 0, 0, 0),
(8256, 30, -4668.37, -1308.36, 503.381, 100, 0, 0, 0),
(8256, 31, -4663.3, -1301.66, 503.382, 100, 0, 0, 0),
(8256, 32, -4660.58, -1292.92, 503.382, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825601, 5, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4285, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825601, 5, 28, 8, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825601, 7, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Stand');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825602, 5, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4286, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825602, 5, 1, 69, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825602, 8, 1, 30, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825603, 5, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4287, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (825603, 5, 1, 36, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Curator Thorius - Emote');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
