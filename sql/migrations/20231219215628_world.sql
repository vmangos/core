DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231219215628');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231219215628');
-- Add your query below.


-- Events list for Thistlefur Ursa
DELETE FROM `creature_ai_events` WHERE `creature_id`=3921;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392101, 3921, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 392101, 0, 0, 'Thistlefur Ursa - Cast Coat of Thistlefur on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392102, 3921, 0, 1, 0, 100, 0, 3000, 3000, 0, 0, 392102, 0, 0, 'Thistlefur Ursa - Cast Battle Stance on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392103, 3921, 0, 9, 0, 100, 1, 0, 5, 23900, 38400, 392103, 0, 0, 'Thistlefur Ursa - Cast Heroic Strike');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392104, 3921, 0, 2, 0, 100, 0, 15, 0, 0, 0, 392104, 0, 0, 'Thistlefur Ursa - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392105, 3921, 0, 6, 0, 100, 0, 0, 0, 0, 0, 392105, 0, 0, 'Thistlefur Ursa - Cast Thistlefur Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=392105;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(392105, 0, 0, 15, 8603, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thistlefur Ursa - Cast Spell Thistlefur Death');

-- Events list for Thistlefur Totemic
DELETE FROM `creature_ai_events` WHERE `creature_id`=3922;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392201, 3922, 0, 11, 0, 100, 0, 0, 0, 0, 0, 392201, 0, 0, 'Thistlefur Totemic - Cast Coat of Thistlefur on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392202, 3922, 0, 6, 0, 100, 0, 0, 0, 0, 0, 392202, 0, 0, 'Thistlefur Totemic - Cast Thistlefur Death on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392203, 3922, 0, 2, 0, 100, 0, 15, 0, 0, 0, 392203, 0, 0, 'Thistlefur Totemic - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=392202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(392202, 0, 0, 15, 8603, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thistlefur Totemic - Cast Spell Thistlefur Death');


-- Events list for Thistlefur Den Watcher
DELETE FROM `creature_ai_events` WHERE `creature_id`=3923;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392301, 3923, 0, 11, 0, 100, 0, 0, 0, 0, 0, 392301, 0, 0, 'Thistlefur Den Watcher - Cast Coat of Thistlefur on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392302, 3923, 0, 2, 0, 100, 1, 30, 0, 11200, 21500, 392302, 0, 0, 'Thistlefur Den Watcher - Cast Frenzied Rage at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392303, 3923, 0, 2, 0, 100, 0, 15, 0, 0, 0, 392303, 0, 0, 'Thistlefur Den Watcher - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392304, 3923, 0, 6, 0, 100, 0, 0, 0, 0, 0, 392304, 0, 0, 'Thistlefur Den Watcher - Cast Thistlefur Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=392304;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(392304, 0, 0, 15, 8603, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thistlefur Den Watcher - Cast Spell Thistlefur Death');

-- Events list for Thistlefur Avenger
DELETE FROM `creature_ai_events` WHERE `creature_id`=3925;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392501, 3925, 0, 11, 0, 100, 0, 0, 0, 0, 0, 392501, 0, 0, 'Thistlefur Avenger - Cast Coat of Thistlefur on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392502, 3925, 0, 8, 0, 100, 0, 8603, -1, 0, 0, 392502, 0, 0, 'Thistlefur Avenger - Cast Vengeance on Hit By Spell Thistlefur Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392503, 3925, 0, 6, 0, 100, 0, 0, 0, 0, 0, 392503, 0, 0, 'Thistlefur Avenger - Cast Thistlefur Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=392503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(392503, 0, 0, 15, 8603, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thistlefur Avenger - Cast Spell Thistlefur Death');

-- Events list for Thistlefur Pathfinder
DELETE FROM `creature_ai_events` WHERE `creature_id`=3926;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392601, 3926, 0, 2, 0, 100, 0, 15, 0, 0, 0, 392601, 0, 0, 'Thistlefur Pathfinder - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (392602, 3926, 0, 6, 0, 100, 0, 0, 0, 0, 0, 392602, 0, 0, 'Thistlefur Pathfinder - Cast Thistlefur Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=392602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(392602, 0, 0, 15, 8603, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thistlefur Pathfinder - Cast Spell Thistlefur Death');

-- Define spell targets.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (8603, 1, 3925, 0, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
