DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230321213656');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230321213656');
-- Add your query below.


-- Prevent pulling Baron Rivendare outside his room.
UPDATE `creature_template` SET `leash_range`=40 WHERE `entry`=10440;
UPDATE `spell_template` SET `customFlags`=0 WHERE `entry`=17467;

-- 10440: Source Is Within 1 Yards Of X 4032 Y -3365 Z 115
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (10440, 54, 4032, -3368, 115, 4, 2);

-- Events list for Baron Rivendare
DELETE FROM `creature_ai_events` WHERE `creature_id`=10440;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1044001, 10440, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1044001, 0, 0, 'Baron Rivendare - Set Data on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1044002, 10440, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1044002, 0, 0, 'Baron Rivendare - Set Data on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1044003, 10440, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1044003, 0, 0, 'Baron Rivendare - Set Data on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1044004, 10440, 10440, 0, 0, 100, 1, 1, 1, 1, 1, 1044004, 0, 0, 'Baron Rivendare - Evade if pulled outside of room');
DELETE FROM `creature_ai_scripts` WHERE `id`=1044004;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1044004, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Rivendare - Evade');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
