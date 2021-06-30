DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210217165614');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210217165614');
-- Add your query below.

-- Events list for Flame of Ragnaros
DELETE FROM `creature_ai_events` WHERE `creature_id`=13148;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1314801, 13148, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1314801, 0, 0, 'Flame of Ragnaros - Cast Intense Heat on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1314801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1314801, 0, 15, 21155, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flame of Ragnaros - Cast Spell Intense Heat');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1314801, 0, 18, 1000, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flame of Ragnaros - Despawn');
UPDATE `creature_template` SET `faction`=54, `unit_flags`=33554432, `level_min`=60, `level_max`=60, `health_min`=3052, `health_max`=3052, `ai_name`='EventAI', `script_name`='', `flags_extra`=131072 WHERE `entry`=13148;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
