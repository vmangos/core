DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230108124229');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230108124229');
-- Add your query below.


-- Events list for Bloodscalp Witch Doctor
DELETE FROM `creature_ai_events` WHERE `creature_id`=660;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (66001, 660, 0, 0, 0, 100, 3, 6500, 15300, 13300, 21700, 66001, 66002, 0, 'Bloodscalp Witch Doctor - Cast Healing Ward or Cast Earthgrab Totem');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (66002, 660, 0, 2, 0, 100, 0, 20, 0, 0, 0, 66003, 0, 0, 'Bloodscalp Witch Doctor - Cast Enrage at 20% HP');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
