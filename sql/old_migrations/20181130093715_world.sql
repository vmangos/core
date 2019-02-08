DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181130093715');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181130093715');
-- Add your query below.


-- Add distancing movement to Barak Kodobane
DELETE FROM `creature_ai_events` WHERE `creature_id`=3394;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (339401, 3394, 0, 2, 0, 100, 0, 15, 0, 0, 0, 339401, 0, 0, 'Barak Kodobane - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (339402, 3394, 0, 33, 0, 100, 1, 15000, 15000, 0, 0, 339402, 0, 0, 'Barak Kodobane - Run Away on Target Rooted');
DELETE FROM `creature_ai_scripts` WHERE `id`=339402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (339402, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Barak Kodobane - Move Away from Target');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
