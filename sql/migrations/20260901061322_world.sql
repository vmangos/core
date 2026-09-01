DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260901061322');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260901061322');
-- Add your query below.

-- Events list for Khan Hratha
DELETE FROM `creature_ai_events` WHERE `creature_id`=5402;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(540201, 5402, 0, 11, 0, 100, 0, 0, 0, 0, 0, 540201, 0, 0, 'Khan Hratha - Yell on Spawn'),
(540202, 5402, 0, 9, 0, 100, 13, 0, 5, 7000, 11000, 540202, 0, 0, 'Khan Hratha - Cast Cleave');

DELETE FROM `creature_ai_scripts` WHERE `id`=540201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(540201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1905, 0, 0, 0, 0, 0, 0, 0, 0, 'Khan Hratha - Yell on Spawn');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
