DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230316080310');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230316080310');
-- Add your query below.


-- Remove custom copy of High Overlord Saurfang.
DELETE FROM `creature_template` WHERE `entry`=987000;
UPDATE `creature_template` SET `script_name`='npc_aqwar_saurfang' WHERE `entry`=14720;
UPDATE `creature` SET `id`=14720 WHERE `id`=987000;

-- Remove custom creature Faerlina RP.
DELETE FROM `creature_template` WHERE `entry`=533004;
DELETE FROM `creature` WHERE `id`=533004;
UPDATE `creature` SET `id`=15981 WHERE `guid`=302477;
UPDATE `creature` SET `id`=15980 WHERE `guid`=302478;
-- 15981: Source's Guid Is 302449 Or 302453 Or 302462 Or 302469
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15981, 52, 302449, 302453, 302462, 302469, 0);
-- 15982: Source's Guid Is 302477 Or 302489
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15982, 52, 302477, 302489, 0, 0, 0);
-- 15983: (15981: Source's Guid Is 302449 Or 302453 Or 302462 Or 302469) Or (15982: Source's Guid Is 302477 Or 302489)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15983, -2, 15981, 15982, 0, 0, 0);
-- Events list for Naxxramas Acolyte
DELETE FROM `creature_ai_events` WHERE `creature_id`=15981;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1598101, 15981, 15983, 1, 0, 100, 1, 5000, 10000, 30000, 60000, 1598101, 0, 0, 'Naxxramas Acolyte - Start RP Script on Group OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1598101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1598101, 0, 0, 90, 15981, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Naxxramas Acolyte - Start Script on Group');
DELETE FROM `generic_scripts` WHERE `id`=15981;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15981, 0, 0, 28, 8, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 117, 'Naxxramas Acolyte - Set Stand State to Kneel'),
(15981, 10, 0, 15, 21157, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 117, 'Naxxramas Acolyte - Cast Spell Dark Channeling'),
(15981, 11, 0, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naxxramas Acolyte - Set Stand State to Standing'),
(15981, 21, 0, 14, 21157, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naxxramas Acolyte - Remove Aura Dark Channeling');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15981;

-- Remove custom creature Anub'Rekhan.
DELETE FROM `creature_template` WHERE `entry`=533003;

-- Remove custom creature Plague Cloud.
DELETE FROM `creature_template` WHERE `entry`=533002;

-- Remove custom creature Plague Fissure.
DELETE FROM `creature_template` WHERE `entry`=533001;

-- Remove custom creature Cannonball.
DELETE FROM `creature_template` WHERE `entry`=160018;

-- Remove custom creature Stratholme Trigger.
DELETE FROM `creature_template` WHERE `entry`=160017;
DELETE FROM `creature` WHERE `id`=160017;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`, `spawn_flags`) VALUES 
(52124, 10391, 329, 3643.18, -3130.85, 134.864, 5.34071, 7200, 7200, 0, 2, 2),
(52125, 10391, 329, 3641.67, -3131.31, 134.864, 5.41052, 7200, 7200, 0, 0, 2),
(52126, 10390, 329, 3640.15, -3132.19, 134.864, 2.25147, 7200, 7200, 0, 0, 2),
(52127, 10390, 329, 3643.77, -3133.26, 134.864, 3.07178, 7200, 7200, 0, 0, 2),
(52128, 10390, 329, 3642.42, -3134.07, 134.864, 2.21657, 7200, 7200, 0, 0, 2);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(52124, 1, 3643.176270, -3130.845947, 134.863754, 100.000000, 0, 0.000000, 0),
(52124, 2, 3648.996826, -3121.780273, 134.957306, 100.000000, 0, 0.000000, 0),
(52124, 3, 3648.266846, -3115.017090, 134.957413, 100.000000, 0, 0.000000, 0),
(52124, 4, 3648.791016, -3104.319092, 134.261017, 100.000000, 0, 0.000000, 0),
(52124, 5, 3653.072998, -3095.741211, 134.196396, 100.000000, 1000, 0.000000, 52124);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52124, 52124, 0, 0, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52124, 52125, 2, 3.64, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52124, 52126, 2, 2.6, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52124, 52127, 4, 3.64, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52124, 52128, 4, 2.6, 3);
DELETE FROM `creature_movement_scripts` WHERE `id`=52124;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(52124, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Berserker - Move Idle'),
(52124, 0, 0, 90, 5, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Berserker - Start Script on Group to Set Home Position');
DELETE FROM `generic_scripts` WHERE `id`=5;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5, 0, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Set Home Position to Current Position');
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES
(52129, 10424, 329, 3589.11, -3116.47, 151.759, 5.18363, 7200, 7200, 0, 0);
-- 302: Source's Creature Group Is Dead
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (302, 58, 0, 0, 0, 0, 0);
-- 54054: Is Part Of Creature Group With Leader Guid 54054
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54054, 57, 54054, 0, 0, 0, 0);
-- 54055: (302: Source's Creature Group Is Dead) And (54054: Source Is Part Of Creature Group With Leader Guid 54054)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54055, -1, 302, 54054, 0, 0, 0);
-- Events list for Crimson Guardsman
DELETE FROM `creature_ai_events` WHERE `creature_id`=10418;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1041801, 10418, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1041801, 0, 0, 'Crimson Guardsman - Cast Shield Charge on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1041802, 10418, 0, 0, 0, 100, 1, 6000, 6000, 15000, 15000, 1041802, 0, 0, 'Crimson Guardsman - Cast Disarm');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1041803, 10418, 0, 0, 0, 100, 1, 4000, 4000, 8000, 8000, 1041803, 0, 0, 'Crimson Guardsman - Cast Shield Bash');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1041804, 10418, 54055, 6, 0, 100, 0, 0, 0, 0, 0, 1041804, 0, 0, 'Crimson Guardsman - Spawn Undead on Group Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1041804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1041804, 0, 0, 91, 52124, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Guardsman - Spawn Undead Group'),
(1041804, 0, 0, 0, 6, 0, 0, 0, 52129, 0, 9, 2, 6436, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone');
-- Events list for Crimson Initiate
DELETE FROM `creature_ai_events` WHERE `creature_id`=10420;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042001, 10420, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1042001, 0, 0, 'Crimson Initiate - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042002, 10420, 54055, 6, 0, 100, 0, 0, 0, 0, 0, 1042002, 0, 0, 'Crimson Initiate - Spawn Undead on Group Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042002, 0, 0, 91, 52124, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Initiate - Spawn Undead Group'),
(1042002, 0, 0, 0, 6, 0, 0, 0, 52129, 0, 9, 2, 6436, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
