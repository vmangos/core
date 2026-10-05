DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260831075604');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260831075604');
-- Add your query below.

-- Events list for Warbringer Construct
DELETE FROM `creature_ai_events` WHERE `creature_id`=8905;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(890501, 8905, 0, 4, 0, 100, 0, 0, 0, 0, 0, 890501, 0, 0, 'Warbringer Construct - Say on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=890501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(890501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4961, 0, 0, 0, 0, 0, 0, 0, 0, 'Warbringer Construct - Say on Aggro');

UPDATE `creature_template` SET `ai_name`='EventAI' WHERE  `entry`=8905 AND `patch`=0;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
