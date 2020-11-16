DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201116030815');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201116030815');
-- Add your query below.


-- Change meaning of value 6 in attack_target field for SCRIPT_COMMAND_TEMP_SUMMON_CREATURE.
UPDATE `creature_ai_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `creature_movement_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `creature_spells_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `event_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `gameobject_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `generic_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `gossip_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `quest_end_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `quest_start_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;
UPDATE `spell_scripts` SET `dataint3`=-1 WHERE `command`=10 && `dataint3`=6;

-- Main script.
DELETE FROM `quest_start_scripts` WHERE `id`=6641;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 0, 61, 6641, 1200, 0, 0, 0, 0, 0, 8, 0, 0, 1014, 66410, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 1, 80, 1, 0, 0, 0, 47873, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Naga Brazier - Set GO State');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 1, 22, 33, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Faction to Escortee');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Remove Npc Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 1, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Remove Unit Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8566, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 7, 20, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Start Waypoints');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6641, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8555, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
UPDATE `quest_template` SET `StartScript`=6641 WHERE `entry`=6641;

-- Add emotes to texts.
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=8566;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=8555;
UPDATE `broadcast_text` SET `emote_id1`=25 WHERE `entry`=8568;
UPDATE `broadcast_text` SET `emote_id1`=4 WHERE `entry`=8569;
UPDATE `broadcast_text` SET `emote_id1`=2 WHERE `entry`=8558;
UPDATE `broadcast_text` SET `emote_id1`=1 WHERE `entry`=8564;

-- Fail script.
DELETE FROM `generic_scripts` WHERE `id`=66410;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66410, 0, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher Failed: Muglash - Despawn');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66410, 0, 70, 6641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher Failed: Fail Quest');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66410, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher Failed: Muglash - Reset Home Position');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66410, 0, 80, 1, 0, 0, 0, 47873, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher Failed: Naga Brazier - Set GO State');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66410, 0, 4, 9, 16, 1, 0, 47873, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher Failed: Naga Brazier - Add No Interact Flag');

-- Waypoints for Muglash.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(12717, 1, 3350.840088, 1007.580017, 3.799430, 100.000000, 0, 0.000000, 0),
(12717, 2, 3369.909912, 1010.380005, 3.890290, 100.000000, 0, 0.000000, 0),
(12717, 3, 3394.110107, 1012.460022, 3.265170, 100.000000, 0, 0.000000, 0),
(12717, 4, 3417.399902, 1013.440002, 2.911480, 100.000000, 0, 0.000000, 0),
(12717, 5, 3453.570068, 1021.450012, 1.953890, 100.000000, 0, 0.000000, 0),
(12717, 6, 3490.219971, 1038.319946, 2.719930, 100.000000, 0, 0.000000, 0),
(12717, 7, 3508.510010, 1048.800049, 10.973100, 100.000000, 0, 0.000000, 0),
(12717, 8, 3528.399902, 1060.729980, 7.813920, 100.000000, 0, 0.000000, 0),
(12717, 9, 3544.620117, 1093.910034, 0.979658, 100.000000, 0, 0.000000, 0),
(12717, 10, 3561.020020, 1120.209961, -5.101750, 100.000000, 0, 0.000000, 0),
(12717, 11, 3577.439941, 1135.569946, 5.735940, 100.000000, 0, 0.000000, 0),
(12717, 12, 3597.739990, 1144.060059, 6.264020, 100.000000, 0, 0.000000, 0),
(12717, 13, 3604.560059, 1144.979980, 9.413340, 0.135826, 0, 0.000000, 1271713);

-- Final waypoint script for Muglash.
DELETE FROM `creature_movement_scripts` WHERE `id`=1271713;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271713, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Phase to 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271713, 0, 15, 20861, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Cast Spell Muglash Waiting');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271713, 0, 4, 9, 16, 2, 0, 47873, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Naga Brazier - Remove No Interact Flag');

-- Add missing gameobject Naga Brazier (trap)
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`) VALUES (178248, 6, 327, 'Naga Brazier (trap)', 1, 0, 0, 0, 20863, 0, 0, -1, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (47935, 178248, 1, 3611.72, 1144.3, 9.75088, 1.43117, 0, 0, 0.656059, 0.75471, 900, 900, 100, 1, 0, 0, 0, 10);

-- Add target for spell Muglash's Brazier Trap.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (20863, 1, 12717, 0, 0, 0, 5875);

-- Script after Naga Brazier is extinguished.
DELETE FROM `generic_scripts` WHERE `id`=66411;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8410, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 0, 14, 20861, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Remove Aura Muglash Waiting');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3614.28, 1143.06, 10.2111, 0, 0, 'Vorsha the Lasher: Muglash - Move');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3614.28, 1143.06, 10.2111, 0, 0, 'Vorsha the Lasher: Muglash - Set Home Position');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8412, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 5, 10, 3713, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 6, 1, 3617.85, 1097.72, -4.08775, 5.67232, 0, 'Vorsha the Lasher: Muglash - Summon Creature Wrathtail Wave Rider');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 5, 10, 3712, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 6, 1, 3629.92, 1170, -3.44726, 1.37881, 0, 'Vorsha the Lasher: Muglash - Summon Creature Wrathtail Razortail');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 5, 10, 3717, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 6, 1, 3583.15, 1165.57, -5.36602, 1.85005, 0, 'Vorsha the Lasher: Muglash - Summon Creature Wrathtail Sorceress');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66411, 10, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Phase to 3');

-- Script after first naga wave is defeated.
DELETE FROM `generic_scripts` WHERE `id`=66412;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 0, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Phase to 4');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8413, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 0, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Sit Down');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8412, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 10, 10, 3944, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 6, 1, 3651.54, 1155.55, -3.96287, 1.09956, 0, 'Vorsha the Lasher: Muglash - Summon Creature Wrathtail Priestess');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 10, 10, 3711, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 6, 1, 3575.01, 1119.87, -4.25475, 0.349066, 0, 'Vorsha the Lasher: Muglash - Summon Creature Wrathtail Myrmidon');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 10, 10, 3715, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 6, 1, 3606.95, 1176.38, -2.96321, 4.97419, 0, 'Vorsha the Lasher: Muglash - Summon Creature Wrathtail Sea Witch');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66412, 15, 44, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Phase to 5');

-- Script after second naga wave is defeated.
DELETE FROM `generic_scripts` WHERE `id`=66413;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66413, 0, 44, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Phase to 6');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66413, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8567, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66413, 6, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.21, 0, 'Vorsha the Lasher: Muglash - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66413, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8568, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66413, 7, 10, 12940, 60000, 0, 0, 0, 0, 0, 0, 1, 12940, -1, 1, 3630.21, 1190.35, -16.6243, 4.46804, 0, 'Vorsha the Lasher: Muglash - Summon Creature Vorsha the Lasher');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66413, 8, 69, 6641, 0, 0, 0, 0, 0, 0, 0, 0, 66414, 1014, 66410, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Edit Scripted Map Event');

-- Spawn script for Vorsha the Lasher.
DELETE FROM `generic_scripts` WHERE `id`=12940;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12940, 0, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3612.57, 1146.34, 10.0559, 0, 0, 'Vorsha the Lasher - Move');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12940, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3612.57, 1146.34, 10.0559, 4.15, 0, 'Vorsha the Lasher - Set Home Position');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12940, 0, 63, 6641, 0, 0, 0, 0, 0, 0, 0, 738, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher - Add to Scripted map Event');

-- Completion script.
DELETE FROM `generic_scripts` WHERE `id`=66414;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 0, 18, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Despawn in 1 minute');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Reset Home Position');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Phase to 0');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8569, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 6, 7, 6641, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Complete Quest');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8558, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8564, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8565, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 20, 3, 0, 5011, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3625.35, 1140.15, 7.14173, 100, 0, 'Vorsha the Lasher: Muglash - Move');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 29, 3, 0, 11072, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3601.72, 1151.06, 9.21949, 100, 0, 'Vorsha the Lasher: Muglash - Move');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (66414, 40, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3623.81, 1140.42, 8.3252, 100, 0, 'Vorsha the Lasher: Muglash - Move');

-- Events list for Muglash
DELETE FROM `creature_ai_events` WHERE `creature_id`=12717;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1271701, 12717, 0, 1, 125, 100, 1, 0, 0, 60000, 60000, 1271701, 0, 0, 'Muglash - Say Text while waiting for player to extinguish brazier (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1271702, 12717, 0, 1, 123, 100, 0, 0, 0, 0, 0, 1271702, 0, 0, 'Muglash - Say Text after brazier is extinguished (Phase 2)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1271703, 12717, 0, 21, 119, 100, 0, 0, 0, 0, 0, 1271703, 0, 0, 'Muglash - Say Text after first naga wave killed (Phase 3)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1271704, 12717, 0, 21, 95, 100, 0, 0, 0, 0, 0, 1271704, 0, 0, 'Muglash - Say Text after second naga wave killed (Phase 5)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1271705, 12717, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1271705, 0, 0, 'Muglash - Reset Flags and Phase on Respawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1271701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271701, 0, 0, 0, 0, 0, 0, 6641, 0, 21, 0, 8556, 0, 0, 0, 0, 0, 0, 0, 0, 'Muglash - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1271702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271702, 0, 39, 66411, 0, 0, 0, 6641, 0, 21, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Muglash - Start Script');
DELETE FROM `creature_ai_scripts` WHERE `id`=1271703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271703, 0, 39, 66412, 0, 0, 0, 6641, 0, 21, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Muglash - Start Script');
DELETE FROM `creature_ai_scripts` WHERE `id`=1271704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271704, 0, 39, 66413, 0, 0, 0, 6641, 0, 21, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Muglash - Start Script');
DELETE FROM `creature_ai_scripts` WHERE `id`=1271705;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271705, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Muglash - Set Phase to 0');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271705, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Muglash - Add Quest Giver Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271705, 0, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Muglash - Add Immune to NPC flag');

-- Remove hardcoded scripts.
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=12717;
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry`=178247;
DELETE FROM `script_waypoint` WHERE `entry`=12717;
DELETE FROM `script_texts` WHERE `entry` IN (-1780221, -1780222);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
