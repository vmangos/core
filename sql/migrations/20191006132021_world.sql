DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191006132021');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191006132021');
-- Add your query below.


-- Events list for Dark Iron Raider
DELETE FROM `creature_ai_events` WHERE `creature_id`=2149;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (214901, 2149, 0, 4, 0, 100, 0, 0, 0, 0, 0, 214901, 0, 0, 'Dark Iron Raider - Random Say on Aggro (Could be more Says but not 100% Sure)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (214902, 2149, 0, 2, 0, 100, 0, 15, 1, 0, 0, 214902, 0, 0, 'Dark Iron Raider - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=214902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (214902, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Raider - Flee');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
