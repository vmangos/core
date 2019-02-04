DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190204131040');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190204131040');
-- Add your query below.


-- Remove custom version of Ironhand Guardian and use the correct id.
UPDATE `creature` SET `id`=8982 WHERE `id`=20007;
UPDATE `creature_template_addon` SET `entry`=8982 WHERE `entry`=20007;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (898202, 8982, 0, 11, 0, 100, 0, 0, 0, 0, 0, 898202, 0, 0, 'Ironhand Guardian - Cast Stoned Visual on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (898202, 0, 15, 15533, 6, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironhand Guardian - Cast Stoned Visual');
DELETE FROM `creature_template` WHERE `entry`=20007;
DELETE FROM `creature_ai_events` WHERE `creature_id`=20007;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2000702, 2000703, 2000704, 2000705, 2000706);
UPDATE `creature_template` SET `ai_name`='EventAI', `flags_extra`=2050 WHERE `entry`=8982;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
