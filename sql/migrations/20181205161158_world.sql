DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181205161158');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181205161158');
-- Add your query below.


-- Events list for Rak'shiri
DELETE FROM `creature_ai_events` WHERE `creature_id`=10200;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1020001, 10200, 0, 2, 0, 100, 1, 60, 1, 15000, 21000, 1020001, 0, 0, 'Rak\'shiri - Cast Terrify below 60% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1020002, 10200, 0, 2, 0, 100, 0, 30, 1, 0, 0, 1020002, 0, 0, 'Rak\'shiri - Cast Enrage below 30% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=1020001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1020001, 0, 15, 7399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rak\'shiri - Cast Terrify');
DELETE FROM `creature_ai_scripts` WHERE `id`=1020002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1020002, 0, 15, 15716, 6, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rak\'shiri - Cast Enrage');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1020002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Rak\'shiri - Say Text');
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=10200;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=10200;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
