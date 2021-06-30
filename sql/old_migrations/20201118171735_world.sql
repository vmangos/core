DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201118171735');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201118171735');
-- Add your query below.


-- Events list for Buru Egg Trigger
DELETE FROM `creature_ai_events` WHERE `creature_id`=15964;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1596401, 15964, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1596401, 0, 0, 'Buru Egg Trigger - Despawn after 6500 ms');
DELETE FROM `creature_ai_scripts` WHERE `id`=1596401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1596401, 0, 18, 6500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Buru Egg Trigger - Despawn after 6500 ms');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1596401, 0, 15, 26646, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Buru Egg Trigger - Cast Spell Buru Egg Trigger Effect');
UPDATE `creature_template` SET `unit_flags`=33555200, `flags_extra`=131074, `ai_name`='EventAI' WHERE `entry`=15964;

-- Remove wrong unit flags from Buru Egg.
UPDATE `creature_template` SET `unit_flags`=0, `flags_extra`=2228502 WHERE `entry`=15514;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
