DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620214705');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620214705');
-- Add your query below.


-- farmer furlbrow
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 237;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23701, 237, 0, 1, 0, 100, 1, 75000, 90000, 150000, 180000, 23701, 0, 0, 'farmer furlbrow - say');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, 57, 0, 0, 0, 0, 0, 0, 0, 'farmer furlbrow - say');


-- verna furlbrow
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 238;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23801, 238, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 23801, 0, 0, 'verna furlbrow - speak');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 55, 0, 0, 0, 0, 0, 0, 0, 'verna furlbrow - speak');


-- farmer saldean
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 238;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (23301, 233, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 23301, 0, 0, 'farmer saldean - speak');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (23301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 59, 60, 0, 0, 0, 0, 0, 0, 'farmer saldean - speak');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
