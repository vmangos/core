DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720182522');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720182522');
-- Add your query below.


-- firebrand invoker cast nova in combat
DELETE FROM `creature_ai_events` WHERE `creature_id`=9262;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (926201, 9262, 0, 0, 0, 100, 1, 8000, 10000, 11000, 14000, 926201, 0, 0, 'Firebrand Invoker - Fire Nova');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (926202, 9262, 0, 2, 0, 100, 0, 15, 0, 0, 0, 926202, 0, 0, 'Firebrand Invoker - Flee at 15% HP');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
