DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200728160635');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200728160635');
-- Add your query below.


-- billy and adam ooc event
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1367;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (136701, 1367, 0, 1, 0, 100, 1, 0, 0, 80000, 80000, 136701, 0, 0, 'Billy - Say OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136701, 0, 39, 136701, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Billy - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 131, 132, 133, 134, 0, 0, 0, 0, 0, 'Billy - Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136701, 5, 0, 0, 0, 0, 0, 79702, 0, 9, 2, 136, 138, 143, 146, 0, 0, 0, 0, 0, 'Adam - Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136701, 40, 0, 0, 0, 0, 0, 0, 0, 0, 4, 135, 139, 140, 141, 0, 0, 0, 0, 0, 'Billy - Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (136701, 45, 0, 0, 0, 0, 0, 79702, 0, 9, 2, 144, 145, 147, 0, 0, 0, 0, 0, 0, 'Adam - Talk');

-- add ol emma ooc event
UPDATE `creature_movement` SET `script_id` = 0 WHERE `id` = 79796 AND `point` IN (7, 10, 13, 16, 22, 27);
DELETE FROM `creature_movement_scripts` WHERE `id` IN (7979607, 7979610, 7979613, 7979616, 7979622, 7979627);
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 3520;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (352001, 3520, 0, 1, 0, 100, 1, 0, 0, 180000, 180000, 352001, 0, 0, 'Ol Emma - Say OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (352002, 3520, 0, 1, 0, 100, 1, 6000, 6000, 180000, 180000, 352002, 0, 0, 'Ol Emma - Say OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (352001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1107, 1110, 1111, 1109, 0, 0, 0, 0, 0, 'Ol Emma - Talk');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (352002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1108, 1106, 1105, 1112, 0, 0, 0, 0, 0, 'Ol Emma - Talk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
