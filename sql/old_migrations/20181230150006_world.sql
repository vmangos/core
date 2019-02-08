DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181230150006');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181230150006');
-- Add your query below.


-- Privateer Groy
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 2616;
DELETE FROM `creature_ai_events` WHERE `id` = 261601 AND `creature_id` = 2616;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(261601, 2616, 0, 1, 0, 40, 1, 1000, 15000, 150000, 180000, 261601, 0, 0, "Privateer Groy - Random OOC Say");
DELETE FROM `creature_ai_scripts` WHERE `id` = 261601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(261601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 737, 738, 739, 0, 0, 0, 0, 0, 0, "Privateer Groy - Say Text");
UPDATE `broadcast_text` SET `EmoteId0` = 6 WHERE `ID` = 739;
UPDATE `broadcast_text` SET `EmoteId0` = 5 WHERE `ID` IN (737, 738);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
