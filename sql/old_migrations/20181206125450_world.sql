DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181206125450');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181206125450');
-- Add your query below.


-- Yarlyn Amberstill
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 1263;
DELETE FROM `creature_ai_events` WHERE `id` = 126301 AND `creature_id` = 1263;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(126301, 1263, 0, 1, 0, 100, 3, 1000, 15000, 30000, 45000, 126301, 126302, 126303, 'Yarlyn Amberstill - OOC Random Script');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (126301, 126302, 126303);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(126301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 159, 160, 0, 0, 0, 0, 0, 0, 0, 'Yarlyn Amberstill - Say Text'),
(126302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 161, 162, 0, 0, 0, 0, 0, 0, 0, 'Yarlyn Amberstill - Say Text'),
(126303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 164, 165, 0, 0, 0, 0, 0, 0, 0, 'Yarlyn Amberstill - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
