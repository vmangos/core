DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200601085400');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200601085400');
-- Add your query below.


-- allow rhag garmason to roam
UPDATE `creature` SET `wander_distance` = 2, `movement_type` = 1 WHERE `guid` = 9812;


-- Roggo Harlbarrow shoot
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1072;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (107201, 1072, 0, 1, 0, 100, 1, 3000, 8000, 3000, 8000, 107201, 0, 0, 'Roggo Harlbarrow - Cast Shoot');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (107201, 0, 15, 9008, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Roggo Harlbarrow - Cast Shoot');


-- Motley Garmason shoot
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1074;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (107401, 1074, 0, 1, 0, 100, 1, 3000, 8000, 3000, 8000, 107401, 0, 0, 'Motley Garmason - Cast Shoot');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (107401, 0, 15, 9008, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Motley Garmason - Cast Shoot');


-- Ashlan Stonesmirk throw dynamite
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1073;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (107301, 1073, 0, 1, 0, 100, 1, 25000, 25000, 25000, 25000, 107301, 0, 0, 'Ashlan Stonesmirk - Throw Dynamite');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (107301, 0, 15, 9009, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ashlan Stonesmirk - Cast Coarse Dynamite');


-- Add event for Dark Iron Rifleman team to shoot
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (652303, 6523, 652303, 1, 0, 100, 1, 3000, 8000, 3000, 8000, 252303, 0, 0, 'Dark Iron Rifleman 1 (10485) - Cast Shoot');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (652304, 6523, 652304, 1, 0, 100, 1, 3000, 8000, 3000, 8000, 252304, 0, 0, 'Dark Iron Rifleman 2 (10250) - Cast Shoot');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (652305, 6523, 652305, 1, 0, 100, 1, 3000, 8000, 3000, 8000, 252305, 0, 0, 'Dark Iron Rifleman 3 (10848) - Cast Shoot');


-- Add scripts for Dark Iron Rifleman team to shoot
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (252303, 0, 15, 8995, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Rifleman (10485) - Cast Shoot');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (252304, 0, 15, 8996, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Rifleman (10250) - Cast Shoot');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (252305, 0, 15, 8997, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Rifleman 3 (10848) - Cast Shoot');


-- Add conditions for Dark Iron Rifleman team to shoot
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (652303, 52, 10485, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (652304, 52, 10250, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (652305, 52, 10848, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
