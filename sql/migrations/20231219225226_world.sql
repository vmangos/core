DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231219225226');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231219225226');
-- Add your query below.


-- Events list for Twilight Avenger
DELETE FROM `creature_ai_events` WHERE `creature_id`=11880;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188001, 11880, 0, 2, 0, 100, 0, 30, 0, 0, 0, 1188001, 0, 0, 'Twilight Avenger - Cast Enrage at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188002, 11880, 0, 31, 0, 100, 0, 11880, 11880, 0, 0, 1188002, 0, 0, 'Twilight Avenger - Cast Vegeance on Script Event Happened');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188003, 11880, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1188003, 0, 0, 'Twilight Avenger - Send Script Event on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1188001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1188001, 0, 0, 15, 8599, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Avenger - Cast Spell Enrage'),
(1188001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2384, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Avenger - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1188002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1188002, 0, 0, 15, 8602, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Avenger - Cast Spell Vengeance'),
(1188002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1151, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Avenger - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1188003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1188003, 0, 0, 85, 11880, 11880, 0, 0, 11880, 10, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Avenger - Send Script Event');

-- Events list for Twilight Geolord
DELETE FROM `creature_ai_events` WHERE `creature_id`=11881;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188101, 11881, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1188101, 0, 0, 'Twilight Geolord - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1188102, 11881, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1188102, 0, 0, 'Twilight Geolord - Send Script Event on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1188102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1188102, 0, 0, 85, 11880, 11880, 0, 0, 11880, 10, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Geolord - Send Script Event');

-- Events list for Twilight Overlord
DELETE FROM `creature_ai_events` WHERE `creature_id`=15213;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1521301, 15213, 0, 33, 0, 100, 1, 10000, 10000, 0, 0, 1521301, 0, 0, 'Twilight Overlord - Run Away on Target Frozen');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1521302, 15213, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1521302, 0, 0, 'Twilight Overlord - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1521303, 15213, 0, 9, 0, 100, 1, 0, 8, 20000, 22000, 1521303, 0, 0, 'Twilight Overlord - Cast Frost Nova');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1521304, 15213, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1521304, 0, 0, 'Twilight Overlord - Send Script Event on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1521304;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1521304, 0, 0, 85, 11880, 11880, 0, 0, 11880, 10, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Overlord - Send Script Event');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
