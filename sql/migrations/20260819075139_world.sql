DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260819075139');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260819075139');
-- Add your query below.

-- Events list for Glutton
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(856701, 8567, 0, 4, 0, 100, 1, 0, 0, 0, 0, 856701, 0, 0, 'Glutton - Yell on Aggro'),
(856704, 8567, 0, 5, 0, 100, 1, 0, 0, 1, 0, 856704, 0, 0, 'Glutton - Yell on Kill');

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(856701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6185, 0, 0, 0, 0, 0, 0, 0, 0, 'Glutton - Yell on Aggro'),
(856704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6186, 0, 0, 0, 0, 0, 0, 0, 0, 'Glutton - Yell on Kill');

UPDATE `broadcast_text` SET `sound_id` = 5823 WHERE `entry` = 6185;
UPDATE `broadcast_text` SET `chat_type` = 6, `sound_id` = 5824 WHERE `entry` = 6186;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
