DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190114022024');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190114022024');
-- Add your query below.


UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 346;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 346;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(34601, 346, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 34601, 0, 0, 'Barkeep Daniels - Say OOC Text');
DELETE FROM `creature_ai_scripts` WHERE `id` = 34601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(34601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 48, 0, 0, 0, 0, 0, 0, 0, 'Barkeep Daniels - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
